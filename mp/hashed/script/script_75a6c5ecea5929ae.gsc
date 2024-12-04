#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp_mp\utility\inventory_utility;
#using scripts\engine\utility;
#using scripts\mp\class;
#using scripts\mp\utility\perk;
#using scripts\mp\utility\spawn_event_aggregator;

#namespace namespace_2d3858b0486afd15;

// Namespace namespace_2d3858b0486afd15 / namespace_bd8dd5dc71a74700
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x47b
// Size: 0x42
function function_17a8b3a21e25bce4() {
    level.denyclasschoice = 1;
    setdvar(@"hash_c55dc89ef275cdaa", 1);
    level thread onStartGameTypeFinished();
    level scripts\mp\utility\spawn_event_aggregator::registeronplayerspawncallback(&onplayerspawned);
    level.bypassclasschoicefunc = &scripts\mp\class::alwaysgamemodeclass;
}

// Namespace namespace_2d3858b0486afd15 / namespace_bd8dd5dc71a74700
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c5
// Size: 0x29
function onStartGameTypeFinished() {
    utility::flag_wait("onStartGameTypeFinished");
    setspecialloadouts();
    level.blockweapondrops = 1;
    level thread onplayerconnect();
}

// Namespace namespace_2d3858b0486afd15 / namespace_bd8dd5dc71a74700
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f6
// Size: 0x5e
function onplayerconnect() {
    for (;;) {
        level waittill("connected", player);
        player scripts\mp\class::function_a16868d4dcd81a4b();
        player.pers["gamemodeLoadout"] = level.var_e2c0087725abdea2["allies"];
        player loadweaponsforplayer(["iw9_dm_crossbow_mp", "jup_jp23_me_spear_mp"], 1);
    }
}

// Namespace namespace_2d3858b0486afd15 / namespace_bd8dd5dc71a74700
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x55c
// Size: 0x4d
function onplayerspawned() {
    var_14ad7dfe17275303 = ["specialty_stalker_boots", "specialty_lightweight", "specialty_fastreload", "specialty_longslide", "specialty_sliding_ads", "specialty_fastcrouchmovement"];
    function_177aaacdaae75fd6(var_14ad7dfe17275303);
}

// Namespace namespace_2d3858b0486afd15 / namespace_bd8dd5dc71a74700
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b1
// Size: 0x399
function setspecialloadouts() {
    level.var_e2c0087725abdea2["loadoutArchetype"] = "archetype_assault";
    level.var_e2c0087725abdea2["allies"]["loadoutPrimary"] = "iw9_dm_crossbow_mp";
    level.var_e2c0087725abdea2["allies"]["loadoutPrimaryAttachment2"] = "bar_dm_hvyass_p38";
    level.var_e2c0087725abdea2["allies"]["loadoutPrimaryAttachmentVariantID2"] = 5;
    level.var_e2c0087725abdea2["allies"]["loadoutPrimaryAttachment3"] = "jup_minireddot_hor_tall";
    level.var_e2c0087725abdea2["allies"]["loadoutPrimaryAttachmentVariantID3"] = 1;
    level.var_e2c0087725abdea2["allies"]["loadoutPrimaryAttachment4"] = "stock_dm_hvyass_p38";
    level.var_e2c0087725abdea2["allies"]["loadoutPrimaryAttachmentVariantID4"] = 4;
    level.var_e2c0087725abdea2["allies"]["loadoutPrimaryAttachment5"] = "jup_grip_stop_03";
    level.var_e2c0087725abdea2["allies"]["loadoutPrimaryAttachmentVariantID5"] = 60;
    level.var_e2c0087725abdea2["allies"]["loadoutPrimaryAttachment6"] = "ammo_bolt_he";
    level.var_e2c0087725abdea2["allies"]["loadoutPrimaryAttachmentVariantID6"] = 4;
    level.var_e2c0087725abdea2["allies"]["loadoutPrimaryVariantID"] = function_64ccc54bdbae5cf6(80642);
    level.var_e2c0087725abdea2["allies"]["loadoutSecondary"] = "jup_jp23_me_spear_mp";
    level.var_e2c0087725abdea2["allies"]["loadoutEquipmentPrimary"] = "none";
    level.var_e2c0087725abdea2["allies"]["loadoutEquipmentSecondary"] = "none";
    level.var_e2c0087725abdea2["allies"]["loadoutStreakType"] = "assault";
    level.var_e2c0087725abdea2["allies"]["loadoutGesture"] = "playerData";
    level.var_e2c0087725abdea2["axis"]["loadoutPrimary"] = "iw9_dm_crossbow_mp";
    level.var_e2c0087725abdea2["axis"]["loadoutPrimaryAttachment2"] = "bar_dm_hvyass_p38";
    level.var_e2c0087725abdea2["axis"]["loadoutPrimaryAttachmentVariantID2"] = 5;
    level.var_e2c0087725abdea2["axis"]["loadoutPrimaryAttachment3"] = "jup_minireddot_hor_tall";
    level.var_e2c0087725abdea2["axis"]["loadoutPrimaryAttachmentVariantID3"] = 1;
    level.var_e2c0087725abdea2["axis"]["loadoutPrimaryAttachment4"] = "stock_dm_hvyass_p38";
    level.var_e2c0087725abdea2["axis"]["loadoutPrimaryAttachmentVariantID4"] = 4;
    level.var_e2c0087725abdea2["axis"]["loadoutPrimaryAttachment5"] = "jup_grip_stop_03";
    level.var_e2c0087725abdea2["axis"]["loadoutPrimaryAttachmentVariantID5"] = 60;
    level.var_e2c0087725abdea2["axis"]["loadoutPrimaryAttachment6"] = "ammo_bolt_he";
    level.var_e2c0087725abdea2["axis"]["loadoutPrimaryAttachmentVariantID6"] = 4;
    level.var_e2c0087725abdea2["axis"]["loadoutPrimaryVariantID"] = function_64ccc54bdbae5cf6(80642);
    level.var_e2c0087725abdea2["axis"]["loadoutSecondary"] = "jup_jp23_me_spear_mp";
    level.var_e2c0087725abdea2["axis"]["loadoutEquipmentPrimary"] = "none";
    level.var_e2c0087725abdea2["axis"]["loadoutEquipmentSecondary"] = "none";
    level.var_e2c0087725abdea2["axis"]["loadoutStreakType"] = "assault";
    level.var_e2c0087725abdea2["axis"]["loadoutGesture"] = "playerData";
}

// Namespace namespace_2d3858b0486afd15 / namespace_bd8dd5dc71a74700
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x952
// Size: 0x68
function function_177aaacdaae75fd6(var_608cc23373c0fd33) {
    scripts\mp\class::loadout_clearperks();
    foreach (perk in var_608cc23373c0fd33) {
        if (!scripts\mp\utility\perk::_hasperk(perk)) {
            scripts\mp\utility\perk::giveperk(perk);
        }
    }
}

