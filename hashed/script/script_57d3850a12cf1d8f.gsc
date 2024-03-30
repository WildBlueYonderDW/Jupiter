// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\engine\scriptable_door.gsc;
#using script_600b944a95c3a7bf;
#using script_2d9d24f7c63ac143;
#using scripts\engine\trace.gsc;
#using scripts\mp\gametypes\activity_manager.gsc;
#using script_744cad313ed0a87e;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\cp_mp\utility\scriptable_door_utility.gsc;
#using scripts\mp\utility\debug.gsc;
#using script_4948cdf739393d2d;
#using script_6a8ec730b2bfa844;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\equipment\gas_grenade.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using script_4a6760982b403bad;
#using script_2892a7e13357d95b;
#using script_45f403e1732217d3;

#namespace locksandkeys;

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4317
// Size: 0x998
function init() {
    while (!isdefined(level.struct_class_names)) {
        waitframe();
    }
    precachestring("MP_DMZ_LOCKS/LOCKED_FORTRESS");
    precachestring("MP_DMZ_LOCKS/STUCK");
    precachestring("MP_DMZ_LOCKS/LOCKED_TESTUNIQUEDOOR");
    precachestring("MP_DMZ_LOCKS/LOCKED_QUARRY_STORAGE");
    precachestring("MP_DMZ_LOCKS/LOCKED_QUARRY_CONTROL");
    precachestring("MP_DMZ_LOCKS/LOCKED_QUARRY_OFFICE");
    precachestring("MP_DMZ_LOCKS/LOCKED_HYDRO_STORAGE");
    precachestring("MP_DMZ_LOCKS/LOCKED_HYDRO_APT");
    precachestring("MP_DMZ_LOCKS/LOCKED_HYDRO_WEAPONDROP");
    precachestring("MP_DMZ_LOCKS/LOCKED");
    precachestring("MP_BIO_LAB/CACHE_LOCKED_RED_DOOR");
    precachestring("MP_BIO_LAB/CACHE_LOCKED_BLUE_DOOR");
    precachestring("MP_BIO_LAB/CACHE_LOCKED_GREEN_DOOR");
    precachestring("MP_BIO_LAB/CACHE_LOCKED_BLACK_DOOR");
    precachestring("MP_BIO_LAB/CACHE_LOCKED_GOLD_DOOR");
    precachestring("MP_DMZ_LOCKS/LOCKED_TRAPPER_DOOR");
    precachestring("MP_DMZ_LOCKS/LOCKED_RESORT_ENTRANCE");
    precachestring("MP_DMZ_LOCKS/LOCKED_FIREFIGHTTEST01");
    precachestring("MP_DMZ_LOCKS/LOCKED");
    precachestring("MP_DMZ_LOCKS/LOCKED_CONFERENCE_ROOM");
    precachestring("MP_DMZ_LOCKS/LOCKED_AIRPORT_MAINTENANCE");
    precachestring("MP_DMZ_LOCKS/LOCKED_UNDERGROUND_SHACK");
    precachestring("MP_DMZ_LOCKS/LOCKED_CLIFF_ROOM");
    precachestring("MP_DMZ_LOCKS/LOCKED_GRAVEYARD_HOUSE");
    precachestring("MP_DMZ_LOCKS/LOCKED_POPPY_HOME");
    precachestring("MP_DMZ_LOCKS/LOCKED_WESTERN_STORAGE");
    precachestring("MP_DMZ_LOCKS/LOCKED_MOBILE_OFFICE");
    precachestring("MP_DMZ_LOCKS/LOCKED_CRANE_BUILDING");
    precachestring("MP_DMZ_LOCKS/LOCKED_POLICE_LOCKERROOM");
    precachestring("MP_DMZ_LOCKS/LOCKED_SMUGGLERS_WAREHOUSE");
    precachestring("MP_DMZ_LOCKS/LOCKED_POWER_SUBSTATION");
    precachestring("MP_DMZ_LOCKS/LOCKED_CELL_PHONE_SHOP");
    precachestring("MP_DMZ_LOCKS/LOCKED_POLICE_ACADEMY_BARRACKS");
    precachestring("MP_DMZ_LOCKS/LOCKED_POLICE_ACADEMY_LOCKERROOM");
    precachestring("MP_DMZ_LOCKS/LOCKED_POST_OFFICE");
    precachestring("MP_DMZ_LOCKS/LOCKED_TV_STATION");
    precachestring("MP_DMZ_LOCKS/LOCKED_SHOPPING_BOOTH");
    precachestring("MP_DMZ_LOCKS/LOCKED_APARTMENT_CLOSET");
    precachestring("MP_DMZ_LOCKS/LOCKED_NORTH_GUARD_SHACK");
    precachestring("MP_DMZ_LOCKS/LOCKED_SOUTH_GUARD_SHACK");
    precachestring("MP_DMZ_LOCKS/LOCKED_FORT_BARRACK1");
    precachestring("MP_DMZ_LOCKS/LOCKED_ANTIQUITIES_OFFICE");
    precachestring("MP_DMZ_LOCKS/LOCKED_MUNITIONS_STORAGE");
    precachestring("MP_DMZ_LOCKS/LOCKED_OFFICEQUARTERS1");
    precachestring("MP_DMZ_LOCKS/LOCKED_OFFICEQUARTERS2");
    precachestring("MP_DMZ_LOCKS/LOCKED_QUIET_BEDROOM");
    precachestring("MP_DMZ_LOCKS/LOCKED_AUTO_SHOP_SUNKEN");
    precachestring("MP_DMZ_LOCKS/LOCKED_SERVER_ROOM");
    precachestring("MP_DMZ_LOCKS/LOCKED_SUNKEN_OFFICE");
    precachestring("MP_DMZ_LOCKS/LOCKED_SUNKEN_SECOND_OFFICE");
    precachestring("MP_DMZ_LOCKS/LOCKED_HOTEL_ROOM1");
    precachestring("MP_DMZ_LOCKS/LOCKED_HOTEL_ROOM2");
    precachestring("MP_DMZ_LOCKS/LOCKED_DRESSING_ROOM");
    precachestring("MP_DMZ_LOCKS/LOCKED_SEC_CAMERA_ROOM");
    precachestring("MP_DMZ_LOCKS/LOCKED_GAMING_ROOM");
    precachestring("MP_DMZ_LOCKS/LOCKED_FISH_SHACK");
    precachestring("MP_DMZ_LOCKS/LOCKED_MOUNTAIN_TOP_ROOM");
    precachestring("MP_DMZ_LOCKS/LOCKED_SPOTTERS_VIEW");
    precachestring("MP_DMZ_LOCKS/LOCKED_GROCERY_OFFICE");
    precachestring("MP_DMZ_LOCKS/LOCKED_NEIGH_STORAGE_ROOM");
    precachestring("MP_DMZ_LOCKS/LOCKED_APARTMENT_CLOSET");
    precachestring("MP_DMZ_LOCKS/LOCKED_APARTMENT_SNIPERNEST");
    precachestring("MP_DMZ_LOCKS/LOCKED_DESTROYED_TELESCOPE");
    precachestring("MP_DMZ_LOCKS/LOCKED_GROUNDSKEEPERS");
    precachestring("MP_DMZ_LOCKS/LOCKED_LIGHTHOUSE_ROOM");
    precachestring("MP_DMZ_LOCKS/LOCKED_SAFE_ROOM");
    precachestring("MP_DMZ_LOCKS/LOCKED_SCIENTIST_APARTMENT");
    precachestring("MP_DMZ_LOCKS/LOCKED_SECRET_COMMS");
    precachestring("MP_DMZ_LOCKS/LOCKED_SHOPPING_BOOTH");
    precachestring("MP_DMZ_LOCKS/LOCKED_SIRA_APARTMENT");
    precachestring("MP_DMZ_LOCKS/LOCKED_SMALL_CONFER_ROOM");
    precachestring("MP_DMZ_LOCKS/LOCKED_SUPPLY_ROOM");
    precachestring("MP_DMZ_LOCKS/LOCKED_TV_COMPUTER_ROOM");
    precachestring("MP_DMZ_LOCKS/LOCKED_YUM_BURGER");
    precachestring("MP_DMZ_LOCKS/LOCKED_INTERROGATION_ROOM");
    precachestring("MP_DMZ_LOCKS/LOCKED_CONTROL_TOWER");
    precachestring("MP_DMZ_LOCKS/LOCKED_EXHUME_WAREHOUSE");
    precachestring("MP_DMZ_LOCKS/LOCKED_FORT");
    precachestring("MP_DMZ_LOCKS/LOCKED_POLICE_ACADEMY");
    precachestring("MP_DMZ_LOCKS/LOCKED_SIRA_MALL");
    precachestring("MP_DMZ_LOCKS/LOCKED_CIVIC_CENTER");
    precachestring("MP_DMZ_LOCKS/LOCKED_EMBASSY");
    precachestring("MP_DMZ_LOCKS/LOCKED_POST_OFFICE_STRONGHOLD");
    precachestring("MP_BIOBUNKER/BOSS_KEY_A_NAME");
    precachestring("MP_BIOBUNKER/BOSS_KEY_B_NAME");
    precachestring("MP_BIOBUNKER/HUB_KEY_A_NAME");
    precachestring("MP_BIOBUNKER/HUB_KEY_B_NAME");
    precachestring("MP_BIOBUNKER/WATER_KEY_A_NAME");
    precachestring("MP_BIOBUNKER/WATER_KEY_B_NAME");
    precachestring("MP_BIOBUNKER/RAD_KEY_A_NAME");
    precachestring("MP_BIOBUNKER/RAD_KEY_B_NAME");
    precachestring("MP_BIOBUNKER/WORKSHOP_KEY_NEED");
    precachestring("MP_BIOBUNKER/STAIRWELL_KEY_NEED");
    precachestring("MP_BIOBUNKER/STAIRWELL_KEY_UNLOCK");
    precachestring("MP_BIOBUNKER/WORKSHOP_KEY_UNLOCK");
    precachestring("MP_DMZ_LOCKS/LOCKED_CARTEL_WAREHOUSE");
    precachestring("MP_DMZ_LOCKS/LOCKED_SKELETON_ROOM");
    if (scripts/cp_mp/utility/game_utility::function_eb4bce9b222e36ac() || scripts/cp_mp/utility/game_utility::function_b1d9cdb3f16a7678() || istrue(level.var_65edf6967a5a44e9)) {
        precachestring("MP_DMZ_LOCKS/LOCKED_LOW_TOWN_CITADEL");
        precachestring("MP_DMZ_LOCKS/LOCKED_LOW_TOWN_CITADEL_COMMANDER_ROOM");
    }
    precachestring("MP_DMZ_LOCKS/UNLOCK_FORTRESS");
    precachestring("MP_DMZ_LOCKS/UNLOCK_TESTUNIQUEDOOR");
    precachestring("MP_DMZ_LOCKS/UNLOCK_QUARRY_STORAGE");
    precachestring("MP_DMZ_LOCKS/UNLOCK_QUARRY_CONTROL");
    precachestring("MP_DMZ_LOCKS/UNLOCK_QUARRY_OFFICE");
    precachestring("MP_DMZ_LOCKS/UNLOCK_HYDRO_STORAGE");
    precachestring("MP_DMZ_LOCKS/UNLOCK_HYDRO_APT");
    precachestring("MP_DMZ_LOCKS/UNLOCK_HYDRO_WEAPONDROP");
    precachestring("MP_DMZ_LOCKS/UNLOCK_DOOR");
    precachestring("MP_DMZ_LOCKS/UNLOCK_TRAPPER_DOOR");
    precachestring("MP_DMZ_LOCKS/UNLOCK_RESORT_ENTRANCE");
    precachestring("MP_DMZ_LOCKS/UNLOCK_FIREFIGHTTEST01");
    precachestring("MP_DMZ_LOCKS/UNLOCK_DOOR");
    precachestring("MP_DMZ_LOCKS/UNLOCK_DEADBOLT");
    precachestring("MP_DMZ_MISSIONS/TRAP_DOOR_UNLOCK");
    precachestring("MP_DMZ_LOCKS/UNLOCK_CONFERENCE_ROOM");
    precachestring("MP_DMZ_LOCKS/UNLOCK_AIRPORT_MAINTENANCE");
    precachestring("MP_DMZ_LOCKS/UNLOCK_UNDERGROUND_SHACK");
    precachestring("MP_DMZ_LOCKS/UNLOCK_CLIFF_ROOM");
    precachestring("MP_DMZ_LOCKS/UNLOCK_GRAVEYARD_HOUSE");
    precachestring("MP_DMZ_LOCKS/UNLOCK_POPPY_HOME");
    precachestring("MP_DMZ_LOCKS/UNLOCK_WESTERN_STORAGE");
    precachestring("MP_DMZ_LOCKS/UNLOCK_MOBILE_OFFICE");
    precachestring("MP_DMZ_LOCKS/UNLOCK_CRANE_BUILDING");
    precachestring("MP_DMZ_LOCKS/UNLOCK_POLICE_LOCKERROOM");
    precachestring("MP_DMZ_LOCKS/UNLOCK_SMUGGLERS_WAREHOUSE");
    precachestring("MP_DMZ_LOCKS/UNLOCK_POWER_SUBSTATION");
    precachestring("MP_DMZ_LOCKS/UNLOCK_CELL_PHONE_SHOP");
    precachestring("MP_DMZ_LOCKS/UNLOCK_POLICE_ACADEMY_BARRACKS");
    precachestring("MP_DMZ_LOCKS/UNLOCK_POLICE_ACADEMY_LOCKERROOM");
    precachestring("MP_DMZ_LOCKS/UNLOCK_POST_OFFICE");
    precachestring("MP_DMZ_LOCKS/UNLOCK_TV_STATION");
    precachestring("MP_DMZ_LOCKS/UNLOCK_SHOPPING_BOOTH");
    precachestring("MP_DMZ_LOCKS/UNLOCK_APARTMENT_CLOSET");
    precachestring("MP_DMZ_LOCKS/UNLOCK_CONTROL_ROOM");
    precachestring("MP_DMZ_LOCKS/UNLOCK_NORTH_GUARD_SHACK");
    precachestring("MP_DMZ_LOCKS/UNLOCK_SOUTH_GUARD_SHACK1");
    precachestring("MP_DMZ_LOCKS/UNLOCK_FORT_BARRACK1");
    precachestring("MP_DMZ_LOCKS/UNLOCK_ANTIQUITIES_OFFICE");
    precachestring("MP_DMZ_LOCKS/UNLOCK_MUNITIONS_STORAGE");
    precachestring("MP_DMZ_LOCKS/UNLOCK_OFFICE_QUARTERS1");
    precachestring("MP_DMZ_LOCKS/UNLOCK_OFFICE_QUARTERS2");
    precachestring("MP_DMZ_LOCKS/UNLOCK_QUIET_BEDROOM");
    precachestring("MP_DMZ_LOCKS/UNLOCK_AUTO_SHOP_SUNKEN");
    precachestring("MP_DMZ_LOCKS/UNLOCK_SERVER_ROOM");
    precachestring("MP_DMZ_LOCKS/UNLOCK_SUNKEN_OFFICE");
    precachestring("MP_DMZ_LOCKS/UNLOCK_SUNKEN_SECOND_OFFICE");
    precachestring("MP_DMZ_LOCKS/UNLOCK_HOTEL_ROOM1");
    precachestring("MP_DMZ_LOCKS/UNLOCK_HOTEL_ROOM2");
    precachestring("MP_DMZ_LOCKS/UNLOCK_DRESSING_ROOM");
    precachestring("MP_DMZ_LOCKS/UNLOCK_SEC_CAMERA_ROOM");
    precachestring("MP_DMZ_LOCKS/UNLOCK_GAMING_ROOM");
    precachestring("MP_DMZ_LOCKS/UNLOCK_FISH_SHACK");
    precachestring("MP_DMZ_LOCKS/UNLOCK_MOUNTAIN_TOP_ROOM");
    precachestring("MP_DMZ_LOCKS/UNLOCK_SPOTTERS_VIEW");
    precachestring("MP_DMZ_LOCKS/UNLOCK_GROCERY_OFFICE");
    precachestring("MP_DMZ_LOCKS/UNLOCK_NEIGH_STORAGE_ROOM");
    precachestring("MP_DMZ_LOCKS/UNLOCK_APARTMENT_CLOSET");
    precachestring("MP_DMZ_LOCKS/UNLOCK_APARTMENT_SNIPERNEST");
    precachestring("MP_DMZ_LOCKS/UNLOCK_DESTROYED_TELESCOPE");
    precachestring("MP_DMZ_LOCKS/UNLOCK_GROUNDSKEEPERS");
    precachestring("MP_DMZ_LOCKS/UNLOCK_LIGHTHOUSE_ROOM");
    precachestring("MP_DMZ_LOCKS/UNLOCK_SAFE_HOUSE");
    precachestring("MP_DMZ_LOCKS/UNLOCK_SCIENTIST_APARTMENT");
    precachestring("MP_DMZ_LOCKS/UNLOCK_SECRET_COMMS");
    precachestring("MP_DMZ_LOCKS/UNLOCK_SHOPPING_BOOTH");
    precachestring("MP_DMZ_LOCKS/UNLOCK_SIRA_APARTMENT");
    precachestring("MP_DMZ_LOCKS/UNLOCK_SMALL_CONFER_ROOM");
    precachestring("MP_DMZ_LOCKS/UNLOCK_SUPPLY_ROOM");
    precachestring("MP_DMZ_LOCKS/UNLOCK_TV_COMPUTER_ROOM");
    precachestring("MP_DMZ_LOCKS/UNLOCK_YUM_BURGER");
    precachestring("MP_DMZ_LOCKS/UNLOCK_INTERROGATION_ROOM");
    precachestring("MP_DMZ_LOCKS/UNLOCK_CONTROL_TOWER");
    precachestring("MP_DMZ_LOCKS/UNLOCK_EXHUME_WAREHOUSE");
    precachestring("MP_DMZ_LOCKS/UNLOCK_FORT");
    precachestring("MP_DMZ_LOCKS/UNLOCK_POLICE_ACADEMY");
    precachestring("MP_DMZ_LOCKS/UNLOCK_SIRA_MALL");
    precachestring("MP_DMZ_LOCKS/UNLOCK_CIVIC_CENTER");
    precachestring("MP_DMZ_LOCKS/UNLOCK_EMBASSY");
    precachestring("MP_DMZ_LOCKS/UNLOCK_POST_OFFICE_STRONGHOLD");
    precachestring("MP_DMZ_LOCKS/UNLOCK_CARTEL_WAREHOUSE");
    precachestring("MP_DMZ_LOCKS/UNLOCK_SKELETON_ROOM");
    precachestring("MP_DMZ_LOCKS/UNLOCK_STRONGOLD_WITH_SKELETON");
    if (scripts/cp_mp/utility/game_utility::function_eb4bce9b222e36ac() || scripts/cp_mp/utility/game_utility::function_b1d9cdb3f16a7678() || istrue(level.var_65edf6967a5a44e9)) {
        precachestring("MP_DMZ_LOCKS/UNLOCK_LOW_TOWN_CITADEL");
        precachestring("MP_DMZ_LOCKS/UNLOCK_LOW_TOWN_CITADEL_COMMANDER_ROOM");
    }
    if (scripts/cp_mp/utility/game_utility::function_5e0e3a24dbb1fae1()) {
        precachestring("MP_DMZ_LOCKS/LOCKED_DELTA_AQUARIUM");
        precachestring("MP_DMZ_LOCKS/UNLOCK_DELTA_AQUARIUM");
        precachestring("MP_DMZ_LOCKS/LOCKED_DELTA_CITYHALL");
        precachestring("MP_DMZ_LOCKS/UNLOCK_DELTA_CITYHALL");
        precachestring("MP_DMZ_LOCKS/LOCKED_DELTA_FIRESTATION");
        precachestring("MP_DMZ_LOCKS/UNLOCK_DELTA_FIRESTATION");
        precachestring("MP_DMZ_LOCKS/LOCKED_DELTA_OLDMUSEUM");
        precachestring("MP_DMZ_LOCKS/UNLOCK_DELTA_OLDMUSEUM");
        precachestring("MP_DMZ_LOCKS/LOCKED_DELTA_STADIUM");
        precachestring("MP_DMZ_LOCKS/UNLOCK_DELTA_STADIUM");
        precachestring("MP_DMZ_LOCKS/LOCKED_DELTA_TERMINAL");
        precachestring("MP_DMZ_LOCKS/UNLOCK_DELTA_TERMINAL");
        precachestring("MP_DMZ_LOCKS/LOCKED_DELTA_TRAINSTATION");
        precachestring("MP_DMZ_LOCKS/UNLOCK_DELTA_TRAINSTATION");
    }
    level.var_65edf6967a5a44e9 = getdvarint(@"hash_48bb11d2f0f1133", 0);
    scripts/engine/scriptable::scriptable_addusedcallbackbypart("maphint_lock", &function_2166c547b0d38235);
    scripts/engine/scriptable::scriptable_addusedcallbackbypart("maphint_lock_interior", &function_ee4e77bc15da5eae);
    scripts/engine/scriptable_door::function_29ba88e5ce21f3fd(&function_6416fb9a24d278b4);
    scripts/engine/scriptable_door::function_e37078f3d00ef312(&function_504f19b32802cb8d);
    scripts/engine/scriptable_door::function_87d7be37d61cbae3(&doorunlocked);
    function_20466dfc92ecf1a9();
    function_fad5181703a528ee();
    function_b35796a7c0a71079();
    function_e726302a1f8d9a1a();
    if (getdvarint(@"hash_3260888995a11bf7", 0) != 1) {
        function_3e0f1ceeb525c408();
    }
    function_e6df49dda3f9a00e();
    function_af0108718cddff00();
    function_5d0e6d83fdc95800();
    /#
        level thread function_af458cfdaf8d86e4();
    #/
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cb6
// Size: 0x28
function function_5d0e6d83fdc95800() {
    if (!isdefined(level.var_ab18903aa481fff2)) {
        level.var_ab18903aa481fff2 = function_f159c10d5cf8f0b4("locked_space_volume", "script_noteworthy");
    }
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ce5
// Size: 0x67
function function_fad5181703a528ee() {
    level.var_b33c035c483c2893 = [];
    level.var_b33c035c483c2893["onPickup"] = [];
    level.var_b33c035c483c2893["onDrop"] = [];
    level.var_b33c035c483c2893["onMatchStart"] = [];
    level.var_b33c035c483c2893["onExtract"] = [];
    scripts/engine/utility::registersharedfunc("locksandkeys", "getAIKeyLootDrop", &getAIKeyLootDrop);
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d53
// Size: 0x108
function function_1420863a23deab24(scriptable, player) {
    var_2bef23d3db267f0d = isdefined(player.activitykey) && scriptable.activitykey == player.activitykey;
    var_4d1155f8bb48272e = isdefined(player.var_b2fb23e638adc7d2) && scriptable.activitykey == player.var_b2fb23e638adc7d2;
    var_2dc12170aeab79fc = isdefined(scriptable.task) && istrue(scriptable.task.completed) && isdefined(scriptable.task.teams) && isdefined(player.team) && array_contains(scriptable.task.teams, player.team);
    return var_2bef23d3db267f0d || var_4d1155f8bb48272e || var_2dc12170aeab79fc;
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e63
// Size: 0x9c
function getAIKeyLootDrop(agent, agenttype) {
    validparams = isdefined(agent) && isdefined(agent.subclass) && isdefined(agenttype);
    validmap = scripts/cp_mp/utility/game_utility::function_eb4bce9b222e36ac() || scripts/cp_mp/utility/game_utility::function_b1d9cdb3f16a7678() || istrue(level.var_65edf6967a5a44e9);
    if (validparams && validmap && agent.subclass == "exgm_captain") {
        if (issubstr(agenttype, "commander")) {
            return "loot_key_low_town_citadel_commander_room_worn";
        } else {
            return "loot_key_low_town_citadel";
        }
    }
    return undefined;
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f07
// Size: 0x274
function function_6416fb9a24d278b4(scriptable, player) {
    if (distance2dsquared(scriptable.interiororigin, player.origin) < distance2dsquared(scriptable.node.origin, player.origin)) {
        if (isdefined(scriptable.keyname) && isstring(scriptable.keyname) && scriptable.keyname == "blacksite") {
            keylootid = namespace_38b993c4618e76cd::getlootidfromref("loot_key_" + scriptable.keyname);
            if (isdefined(keylootid) && player namespace_aead94004cf4c147::function_36b1968bfe78916b(keylootid)) {
                return function_54f0ba9ac5666aba(scriptable.keyname);
            } else {
                return function_94f5e3929619c3d1(scriptable.keyname);
            }
        }
        return "MP_DMZ_LOCKS/UNLOCK_DEADBOLT";
    }
    if (isdefined(scriptable.keyname) && isstring(scriptable.keyname)) {
        keylootid = namespace_38b993c4618e76cd::getlootidfromref("loot_key_" + scriptable.keyname);
        if (isdefined(scriptable.activitykey)) {
            if (function_1420863a23deab24(scriptable, player)) {
                if (isdefined(scriptable.activitytype)) {
                    return function_54f0ba9ac5666aba(scriptable.activitytype);
                } else {
                    return function_54f0ba9ac5666aba(scriptable.keyname);
                }
            } else if (istrue(scriptable.var_8e6ba9b12787eb1d)) {
                return function_94f5e3929619c3d1(scriptable.keyname);
            }
        }
        if (isdefined(keylootid)) {
            if (player namespace_aead94004cf4c147::function_36b1968bfe78916b(keylootid)) {
                return function_54f0ba9ac5666aba(scriptable.keyname);
            } else if (function_92063f2c6a1ca2bf(player) && scriptable.keyname != "stuck") {
                if (scriptable.keyname == "fortress" && (!isdefined(scriptable.activitykey) || !function_1420863a23deab24(scriptable, player))) {
                    return function_54f0ba9ac5666aba("stronghold_with_skeleton");
                } else if (istrue(scriptable.var_534ffc051d7244a7)) {
                    return function_94f5e3929619c3d1(scriptable.keyname);
                } else {
                    return function_54f0ba9ac5666aba(scriptable.keyname);
                }
            } else {
                return function_94f5e3929619c3d1(scriptable.keyname);
            }
        }
    }
    return "MP_DMZ_LOCKS/LOCKED";
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5183
// Size: 0x13f
function function_e0e50ef00477deeb(scriptablename, player, scriptable) {
    if (scriptablename == "loot_key_stuck") {
        return false;
    }
    defaultlootid = namespace_38b993c4618e76cd::getlootidfromref(scriptablename);
    if (isdefined(defaultlootid) && player namespace_aead94004cf4c147::function_36b1968bfe78916b(defaultlootid)) {
        return true;
    }
    usedlootid = namespace_38b993c4618e76cd::getlootidfromref(scriptablename + "_used");
    if (isdefined(usedlootid) && player namespace_aead94004cf4c147::function_36b1968bfe78916b(usedlootid)) {
        return true;
    }
    wornlootid = namespace_38b993c4618e76cd::getlootidfromref(scriptablename + "_worn");
    if (isdefined(wornlootid) && player namespace_aead94004cf4c147::function_36b1968bfe78916b(wornlootid)) {
        return true;
    }
    if (isdefined(scriptable) && istrue(scriptable.var_534ffc051d7244a7)) {
        return false;
    } else {
        foreach (key in level.keysskeleton) {
            keyid = namespace_38b993c4618e76cd::getlootidfromref(key);
            if (isdefined(keyid) && player namespace_aead94004cf4c147::function_36b1968bfe78916b(keyid)) {
                return true;
            }
        }
    }
    return false;
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52ca
// Size: 0x67
function function_92063f2c6a1ca2bf(player) {
    keylootid = namespace_38b993c4618e76cd::getlootidfromref("loot_key_skeleton");
    if (player namespace_aead94004cf4c147::function_36b1968bfe78916b(keylootid)) {
        return true;
    }
    keylootid = namespace_38b993c4618e76cd::getlootidfromref("loot_key_skeleton_used");
    if (player namespace_aead94004cf4c147::function_36b1968bfe78916b(keylootid)) {
        return true;
    }
    keylootid = namespace_38b993c4618e76cd::getlootidfromref("loot_key_skeleton_worn");
    if (player namespace_aead94004cf4c147::function_36b1968bfe78916b(keylootid)) {
        return true;
    }
    return false;
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5339
// Size: 0x433
function function_b88d3fe223408f2b(scriptable, player, var_85e3240d30e184e7) {
    success = 0;
    deadbolt = 0;
    isvalidnode = isdefined(scriptable) && isdefined(scriptable.node);
    if (!istrue(isvalidnode)) {
        return 0;
    }
    if (distance2dsquared(scriptable.interiororigin, player.origin) < distance2dsquared(scriptable.node.origin, player.origin)) {
        if (!var_85e3240d30e184e7) {
            success = 1;
            deadbolt = 1;
        } else {
            tracecontents = scripts/engine/trace::create_default_contents(1);
            traceresults = scripts/engine/trace::ray_trace(player.origin + (0, 0, 16), scriptable.interiororigin, player, tracecontents);
            if (traceresults["hittype"] == "hittype_none") {
                success = 1;
                deadbolt = 1;
            }
        }
    }
    if (isdefined(scriptable.activitykey)) {
        if (function_1420863a23deab24(scriptable, player)) {
            success = 1;
        } else if (istrue(scriptable.var_8e6ba9b12787eb1d)) {
            success = 0;
        }
    }
    if (isdefined(scriptable.keyname) && isstring(scriptable.keyname)) {
        if (scriptable.keyname == "TESTUNIQUEDOOR") {
            success = 1;
        }
        if (scriptable.keyname == "completely_locked") {
            return [0, 0];
        }
        keyname = scriptable.keyname;
        var_6f3309b71ae22d94 = isdefined(scriptable.node.script_noteworthy) && (scriptable.node.script_noteworthy == "lockMe_interior" || scriptable.node.script_noteworthy == "lockme_interior");
        if (istrue(var_6f3309b71ae22d94)) {
            keyname = scriptable.keyname + "_interior";
        }
        if (isdefined(scriptable.fortress) && scriptable.keyname == "fortress" && scripts/mp/gametypes/activity_manager::function_a2dcdcd112310e33(player.team, scriptable.fortress)) {
            success = 1;
        }
        if (function_e0e50ef00477deeb("loot_key_" + keyname, player, scriptable) && !istrue(scriptable.var_8e6ba9b12787eb1d)) {
            success = 1;
        }
        if (keyname == "office_quarters1") {
            if (function_e0e50ef00477deeb("loot_key_office_quarters2", player, scriptable) && !istrue(scriptable.var_8e6ba9b12787eb1d)) {
                keylootid = namespace_38b993c4618e76cd::getlootidfromref("loot_key_office_quarters2");
                var_cf5bc3d609317cc3 = namespace_38b993c4618e76cd::getlootidfromref("loot_key_office_quarters1");
                backpackindex = player namespace_aead94004cf4c147::function_106b52ed8f680043(keylootid);
                if (!isdefined(backpackindex)) {
                    keylootid = namespace_38b993c4618e76cd::getlootidfromref("loot_key_office_quarters2_used");
                    var_cf5bc3d609317cc3 = namespace_38b993c4618e76cd::getlootidfromref("loot_key_office_quarters1_used");
                    backpackindex = player namespace_aead94004cf4c147::function_106b52ed8f680043(keylootid);
                }
                if (!isdefined(backpackindex)) {
                    keylootid = namespace_38b993c4618e76cd::getlootidfromref("loot_key_office_quarters2_worn");
                    var_cf5bc3d609317cc3 = namespace_38b993c4618e76cd::getlootidfromref("loot_key_office_quarters1_worn");
                    backpackindex = player namespace_aead94004cf4c147::function_106b52ed8f680043(keylootid);
                }
                player namespace_aead94004cf4c147::function_db1dd76061352e5b(backpackindex);
                namespace_aead94004cf4c147::function_11f48ae5b87b4525(player, backpackindex, var_cf5bc3d609317cc3, 1);
                success = 1;
            }
        }
        var_6dd4fa9f46b16ce = isdefined(scriptable.fortress) && isdefined(scriptable.fortress.name) && istrue(level.var_be265257b0c58303);
        if (!istrue(deadbolt) && !istrue(var_6f3309b71ae22d94) && var_6dd4fa9f46b16ce) {
            tier = scriptable.fortress namespace_bd614c3c2275579a::function_b7a9796c95aa8e8d();
            if (isdefined(tier) && tier == "black") {
                success = function_ed2cf116dda82611(player, scriptable.fortress.tierkeys, "loot_multi_key_fortress", level.var_ccbb1eb445b88cc0);
            }
        }
    }
    return [success, deadbolt];
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5774
// Size: 0xd6
function function_504f19b32802cb8d(scriptable, player, var_85e3240d30e184e7) {
    success = 0;
    deadbolt = 0;
    var_57acddc40b2f741 = function_b88d3fe223408f2b(scriptable, player, var_85e3240d30e184e7);
    deadbolt = var_57acddc40b2f741[1];
    success = var_57acddc40b2f741[0];
    if (istrue(var_85e3240d30e184e7)) {
        if (!success) {
            playsoundatpos(scriptable.node.origin, "mp_door_locked");
        } else {
            scriptable.var_fc580acbd61da738 = deadbolt;
            if (istrue(deadbolt)) {
                playsoundatpos(scriptable.node.origin, "mp_door_unlock_deadbolt");
            } else {
                playsoundatpos(scriptable.node.origin, "mp_door_unlock_key");
            }
        }
    }
    return success;
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5852
// Size: 0x2e1
function function_87997fcee4a6e14c(scriptable, unlocker) {
    if (isdefined(scriptable) && isdefined(scriptable.type) && scriptable.type == "locked_cache_prompt") {
        return;
    }
    var_7ecbd4f07f6882d0 = getdvarint(@"hash_291ad74097993a0a", 1) == 1;
    var_ba03253452037335 = 0;
    isstronghold = 0;
    var_f2075bd612ae5ab7 = 0;
    players = scripts/mp/utility/teams::getteamdata(unlocker.team, "players");
    if (isdefined(scriptable)) {
        keyname = scriptable.keyname;
        function_a60e40071d04db92(unlocker, keyname);
    }
    if (isdefined(scriptable.fortress)) {
        isstronghold = !istrue(scriptable.fortress.ishero);
        var_f2075bd612ae5ab7 = istrue(scriptable.fortress.ishero);
        if (isdefined(scriptable.fortress.unlockedby)) {
            if (!var_7ecbd4f07f6882d0) {
                var_243d9ea347100ef1 = 0;
                foreach (player in players) {
                    if (array_contains(scriptable.fortress.unlockedby, player)) {
                        var_243d9ea347100ef1 = 1;
                        break;
                    }
                }
                if (!var_243d9ea347100ef1) {
                    scriptable.fortress.unlockedby = array_combine_unique(scriptable.fortress.unlockedby, players);
                    var_ba03253452037335 = 1;
                }
            }
        } else {
            scriptable.fortress.unlockedby = [];
            scriptable.fortress.unlockedby = array_combine_unique(scriptable.fortress.unlockedby, players);
            var_ba03253452037335 = 1;
        }
    } else {
        var_ba03253452037335 = 1;
    }
    if (!var_ba03253452037335) {
        return;
    }
    foreach (player in players) {
        if (!isdefined(player.doorsunlocked)) {
            player.doorsunlocked = 0;
        }
        player.doorsunlocked++;
        if (var_f2075bd612ae5ab7) {
            player scripts/mp/utility/points::doScoreEvent(#"hash_f3613beae4483db1");
            continue;
        }
        if (isstronghold) {
            player scripts/mp/utility/points::doScoreEvent(#"hash_584786512b068a29");
            continue;
        }
        player scripts/mp/utility/points::doScoreEvent(#"hash_6c63c18261a7af97");
    }
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b3a
// Size: 0x15c
function function_7d321a63bc56c65c(rootkeyname, player, noskeleton) {
    wornlootid = namespace_38b993c4618e76cd::getlootidfromref(rootkeyname + "_worn");
    if (isdefined(wornlootid) && player namespace_aead94004cf4c147::function_36b1968bfe78916b(wornlootid)) {
        return [rootkeyname + "_worn", 2];
    }
    usedlootid = namespace_38b993c4618e76cd::getlootidfromref(rootkeyname + "_used");
    if (isdefined(usedlootid) && player namespace_aead94004cf4c147::function_36b1968bfe78916b(usedlootid)) {
        return [rootkeyname + "_used", 1];
    }
    defaultlootid = namespace_38b993c4618e76cd::getlootidfromref(rootkeyname);
    if (isdefined(defaultlootid) && player namespace_aead94004cf4c147::function_36b1968bfe78916b(defaultlootid)) {
        return [rootkeyname, 0];
    }
    if (!istrue(noskeleton)) {
        foreach (index, key in level.keysskeleton) {
            keyid = namespace_38b993c4618e76cd::getlootidfromref(key);
            if (isdefined(keyid) && player namespace_aead94004cf4c147::function_36b1968bfe78916b(keyid)) {
                return [key, index];
            }
        }
    }
    return [undefined, undefined];
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c9e
// Size: 0x29
function function_475482bfe3feb25(var_fd28c1fc64c971b4) {
    var_fd28c1fc64c971b4 = scripts/mp/utility/script::strip_suffix(var_fd28c1fc64c971b4, "_worn");
    var_fd28c1fc64c971b4 = scripts/mp/utility/script::strip_suffix(var_fd28c1fc64c971b4, "_used");
    return var_fd28c1fc64c971b4;
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ccf
// Size: 0x61
function doorunlocked(scriptable, player) {
    if (isdefined(scriptable.connecteddoor)) {
        scriptable.connecteddoor scriptabledoorfreeze(0);
    }
    if (isdefined(scriptable.var_def557e8fd5c6763)) {
        scriptable thread [[ scriptable.var_def557e8fd5c6763 ]](scriptable, player);
    }
    player thread function_83f5cdc3d883507e(scriptable, player);
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d37
// Size: 0x1b7
function function_83f5cdc3d883507e(scriptable, player) {
    player endon("death_or_disconnect");
    savedorigin = scriptable.origin;
    if (isdefined(scriptable.keyname) && isstring(scriptable.keyname)) {
        keyname = scriptable.keyname;
        var_57acfdc40b2fba7 = function_7d321a63bc56c65c("loot_key_" + keyname, player);
        keylevel = var_57acfdc40b2fba7[1];
        scriptablename = var_57acfdc40b2fba7[0];
        if (keyname == "fortress" && isdefined(scriptablename) && !array_contains(level.keysskeleton, scriptablename)) {
            function_87997fcee4a6e14c(scriptable, player);
            return;
        }
        if (isdefined(scriptable.activitykey) && function_1420863a23deab24(scriptable, player)) {
            return;
        }
        if (isdefined(scriptablename) && isdefined(keylevel)) {
            function_87997fcee4a6e14c(scriptable, player);
            if (!istrue(scriptable.var_fc580acbd61da738)) {
                keylootid = namespace_38b993c4618e76cd::getlootidfromref(scriptablename);
                var_cf5bc3d609317cc3 = function_ed1aea6648bcdc28("loot_key_" + keyname, keylevel);
                if (array_contains(level.keysskeleton, scriptablename)) {
                    var_cf5bc3d609317cc3 = function_ed1aea6648bcdc28("loot_key_skeleton", keylevel);
                }
                if (!isdefined(var_cf5bc3d609317cc3)) {
                    player namespace_aead94004cf4c147::function_6f39f9916649ac48(keylootid, 1);
                    wait(1);
                    playsoundatpos(savedorigin, "mp_door_key_break");
                    return;
                }
                backpackindex = player namespace_aead94004cf4c147::function_106b52ed8f680043(keylootid);
                player namespace_aead94004cf4c147::function_db1dd76061352e5b(backpackindex);
                namespace_aead94004cf4c147::function_11f48ae5b87b4525(player, backpackindex, var_cf5bc3d609317cc3, 1);
            }
        }
    }
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ef5
// Size: 0x76
function function_ed2cf116dda82611(player, numkeys, keyname, teamkeys) {
    keylootid = namespace_38b993c4618e76cd::getlootidfromref(keyname);
    keycount = 0;
    if (!isdefined(numkeys)) {
        return false;
    }
    if (istrue(teamkeys)) {
        keycount = player namespace_aead94004cf4c147::function_ef5c7ec55e0e20ee(keylootid);
    } else {
        keycount = player namespace_aead94004cf4c147::function_93f02514431a1f5d(keylootid);
    }
    if (!isdefined(keycount)) {
        return false;
    }
    if (keycount >= numkeys) {
        return true;
    }
    return false;
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5f73
// Size: 0x2b
function function_830809e6920e8bed(category, keyname, callback) {
    level.var_b33c035c483c2893[category][keyname] = callback;
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5fa5
// Size: 0x10b
function function_1a037d5cd64dc892() {
    if (isdefined(level.uniquedoors)) {
        return;
    }
    level.uniquedoors = [];
    keys = getarraykeys(level.struct_class_names["script_noteworthy"]);
    foreach (key in keys) {
        if (issubstr(tolower(key), "uniquedoor")) {
            foreach (node in level.struct_class_names["script_noteworthy"][key]) {
                level.uniquedoors = function_ad1b6accbaab404e(node, level.uniquedoors, getsubstr(key, 11), 1);
            }
        }
    }
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x60b7
// Size: 0x7a
function private function_3e0f1ceeb525c408() {
    function_1a037d5cd64dc892();
    foreach (door in level.uniquedoors) {
        if (istrue(door.doubledoor)) {
            door scriptabledoorfreeze(1);
            continue;
        }
        function_fbbfe6f05eda5eb1(door);
    }
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6138
// Size: 0x15
function function_fbbfe6f05eda5eb1(door) {
    door function_9af4c9b2cc1bf989(1);
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6154
// Size: 0x33
function function_b092780f9ec4496e(door) {
    door function_80902296b05be00a();
    if (isdefined(door.connecteddoor)) {
        door.connecteddoor function_80902296b05be00a();
    }
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x618e
// Size: 0x3d
function function_4327a2c68eef5db9(struct) {
    if (isdefined(struct.target)) {
        doors = getentitylessscriptablearray(struct.target, "targetname");
        return doors;
    }
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61d2
// Size: 0x42
function function_2166c547b0d38235(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    level thread function_a95d35e420c6a968(instance, part, state, player, var_a5b2c541413aa895);
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x621b
// Size: 0x11b
function function_a95d35e420c6a968(instance, part, state, player, var_a5b2c541413aa895) {
    instance setscriptablepartstate("maphint_lock", "off");
    playsoundatpos(instance.origin, "emt_bunk_red_button_press");
    if (getdvarint(@"hash_5556498dffa596fb", 0) == 1 || player namespace_aead94004cf4c147::function_36b1968bfe78916b(instance.keylootid)) {
        playsoundatpos(instance.origin, "br_keypad_confirm");
        function_b092780f9ec4496e(instance.door);
        instance.interiorhint setscriptablepartstate("maphint_lock_interior", "off");
        if (isdefined(instance.door.var_def557e8fd5c6763)) {
            [[ instance.door.var_def557e8fd5c6763 ]](instance.door, player);
        }
        return;
    }
    wait(1);
    instance setscriptablepartstate("maphint_lock", instance.keyname);
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x633d
// Size: 0x42
function function_ee4e77bc15da5eae(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    level thread function_44017cc8b84b87ad(instance, part, state, player, var_a5b2c541413aa895);
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6386
// Size: 0xd6
function function_44017cc8b84b87ad(instance, part, state, player, var_a5b2c541413aa895) {
    instance setscriptablepartstate("maphint_lock_interior", "off");
    playsoundatpos(instance.origin, "emt_bunk_red_button_press");
    wait(1);
    playsoundatpos(instance.origin, "br_keypad_confirm");
    function_b092780f9ec4496e(instance.door);
    instance.exteriorhint setscriptablepartstate("maphint_lock", "off");
    if (isdefined(instance.door.var_def557e8fd5c6763)) {
        [[ instance.door.var_def557e8fd5c6763 ]](instance.door, player);
    }
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6463
// Size: 0x31f
function function_ad1b6accbaab404e(node, var_fa9e859ca98dcdbf, keyname, highpriority) {
    index = var_fa9e859ca98dcdbf.size;
    doors = scripts/cp_mp/utility/scriptable_door_utility::scriptable_door_get_in_radius(node.origin, 75, 75);
    doorswap = 0;
    foreach (door in doors) {
        if (isdefined(door.type) && issubstr(door.type, "invisible")) {
            doorswap = 1;
            break;
        }
    }
    if (doorswap) {
        var_be7b958fdbf091c0 = [];
        foreach (door in doors) {
            if (isdefined(door.type) && issubstr(door.type, "invisible")) {
                door setscriptablepartstate("door", "closed");
                var_be7b958fdbf091c0[var_be7b958fdbf091c0.size] = door;
                continue;
            }
            door setscriptablepartstate("door", "invisible");
        }
        doors = var_be7b958fdbf091c0;
    }
    if (doors.size == 2) {
        doors[0].connecteddoor = doors[1];
        doors[1].connecteddoor = doors[0];
        if (false) {
            thread scripts/mp/utility/debug::drawsphere(node.origin, 75, 900, (0, 1, 0));
        }
    }
    if (isdefined(doors)) {
        foreach (door in doors) {
            if (isdefined(door)) {
                if (istrue(door.var_67535222a761bdc5) && !istrue(highpriority)) {
                    continue;
                }
                var_fa9e859ca98dcdbf[index] = door;
                var_fa9e859ca98dcdbf[index].keyname = keyname;
                var_fa9e859ca98dcdbf[index].var_9ccea499f9e1b693 = node.origin;
                var_fa9e859ca98dcdbf[index].node = node;
                if (istrue(highpriority)) {
                    var_fa9e859ca98dcdbf[index].var_67535222a761bdc5 = 1;
                }
                forward = anglestoforward(node.angles);
                var_fa9e859ca98dcdbf[index].interiororigin = door.var_9ccea499f9e1b693 - forward * 25;
                var_fa9e859ca98dcdbf[index].outerorigin = door.var_9ccea499f9e1b693 + forward * 60;
                if (false) {
                    thread scripts/mp/utility/debug::drawline(node.origin, var_fa9e859ca98dcdbf[index].interiororigin, 300, (1, 0, 0));
                }
            }
            index++;
        }
    }
    return var_fa9e859ca98dcdbf;
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x678a
// Size: 0xfa
function function_e6df49dda3f9a00e() {
    level.uniqueblockers = [];
    keys = getarraykeys(level.struct_class_names["targetname"]);
    foreach (key in keys) {
        if (issubstr(key, "uniqueBlocker")) {
            foreach (node in level.struct_class_names["targetname"][key]) {
                if (isdefined(node.script_noteworthy)) {
                    level.uniqueblockers[level.uniqueblockers.size] = node;
                }
            }
        }
    }
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x688b
// Size: 0x92
function function_af0108718cddff00() {
    foreach (node in level.uniqueblockers) {
        scriptable = spawnscriptable("fortress_scriptable_props", node.origin, node.angles);
        scriptable setscriptablepartstate("scriptable_prop", node.script_noteworthy);
    }
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6924
// Size: 0x1ae0
function function_20466dfc92ecf1a9() {
    level.doorstrings = [];
    level.doorstrings["locked_no_key"] = [];
    level.doorstrings["locked_has_key"] = [];
    level.doorstrings["open"] = [];
    level.doorstrings["locked_no_key"]["fortress"] = "MP_DMZ_LOCKS/LOCKED_FORTRESS";
    level.doorstrings["locked_no_key"]["stuck"] = "MP_DMZ_LOCKS/STUCK";
    level.doorstrings["locked_no_key"]["testuniquedoor"] = "MP_DMZ_LOCKS/LOCKED_TESTUNIQUEDOOR";
    level.doorstrings["locked_no_key"]["quarry_storage"] = "MP_DMZ_LOCKS/LOCKED_QUARRY_STORAGE";
    level.doorstrings["locked_no_key"]["quarry_control"] = "MP_DMZ_LOCKS/LOCKED_QUARRY_CONTROL";
    level.doorstrings["locked_no_key"]["quarry_office"] = "MP_DMZ_LOCKS/LOCKED_QUARRY_OFFICE";
    level.doorstrings["locked_no_key"]["hydro_storage"] = "MP_DMZ_LOCKS/LOCKED_HYDRO_STORAGE";
    level.doorstrings["locked_no_key"]["hydro_apt"] = "MP_DMZ_LOCKS/LOCKED_HYDRO_APT";
    level.doorstrings["locked_no_key"]["hydro_weapondrop"] = "MP_DMZ_LOCKS/LOCKED_HYDRO_WEAPONDROP";
    level.doorstrings["locked_no_key"]["hostage_door"] = "MP_DMZ_MISSIONS/LOCKED_HOSTAGE_DOOR";
    level.doorstrings["locked_no_key"]["trap"] = "MP_DMZ_LOCKS/LOCKED_FORTRESS";
    level.doorstrings["locked_no_key"]["trapper_door"] = "MP_DMZ_LOCKS/LOCKED_TRAPPER_DOOR";
    level.doorstrings["locked_no_key"]["resort_entrance"] = "MP_DMZ_LOCKS/LOCKED_RESORT_ENTRANCE";
    level.doorstrings["locked_no_key"]["firefighttest01"] = "MP_DMZ_LOCKS/LOCKED_FIREFIGHTTEST01";
    level.doorstrings["locked_no_key"]["biolab_door"] = "MP_DMZ_LOCKS/LOCKED";
    level.doorstrings["locked_no_key"]["high_security"] = "MP_BIO_LAB/CACHE_LOCKED_SECURITY_ROOM";
    level.doorstrings["locked_no_key"]["third_floor"] = "MP_BIO_LAB/CACHE_LOCKED_SECURITY_ROOM";
    level.doorstrings["locked_no_key"]["red_door"] = "MP_BIO_LAB/CACHE_LOCKED_RED_DOOR";
    level.doorstrings["locked_no_key"]["blue_door"] = "MP_BIO_LAB/CACHE_LOCKED_BLUE_DOOR";
    level.doorstrings["locked_no_key"]["green_door"] = "MP_BIO_LAB/CACHE_LOCKED_GREEN_DOOR";
    level.doorstrings["locked_no_key"]["black_door"] = "MP_BIO_LAB/CACHE_LOCKED_BLACK_DOOR";
    level.doorstrings["locked_no_key"]["gold_door"] = "MP_BIO_LAB/CACHE_LOCKED_GOLD_DOOR";
    level.doorstrings["locked_no_key"]["armory_room"] = "MP_BIO_LAB/CACHE_LOCKED_ARMORY_ROOM";
    level.doorstrings["locked_no_key"]["conference_room"] = "MP_DMZ_LOCKS/LOCKED_CONFERENCE_ROOM";
    level.doorstrings["locked_no_key"]["maintenance"] = "MP_DMZ_LOCKS/LOCKED_AIRPORT_MAINTENANCE";
    level.doorstrings["locked_no_key"]["undershack"] = "MP_DMZ_LOCKS/LOCKED_UNDERGROUND_SHACK";
    level.doorstrings["locked_no_key"]["cliffroom"] = "MP_DMZ_LOCKS/LOCKED_CLIFF_ROOM";
    level.doorstrings["locked_no_key"]["gravehouse"] = "MP_DMZ_LOCKS/LOCKED_GRAVEYARD_HOUSE";
    level.doorstrings["locked_no_key"]["poppyhome"] = "MP_DMZ_LOCKS/LOCKED_POPPY_HOME";
    level.doorstrings["locked_no_key"]["western_storage"] = "MP_DMZ_LOCKS/LOCKED_WESTERN_STORAGE";
    level.doorstrings["locked_no_key"]["mobile_office"] = "MP_DMZ_LOCKS/LOCKED_MOBILE_OFFICE";
    level.doorstrings["locked_no_key"]["crane_building"] = "MP_DMZ_LOCKS/LOCKED_CRANE_BUILDING";
    level.doorstrings["locked_no_key"]["policestation"] = "MP_DMZ_LOCKS/LOCKED_POLICE_LOCKERROOM";
    level.doorstrings["locked_no_key"]["smugglers_warehouse"] = "MP_DMZ_LOCKS/LOCKED_SMUGGLERS_WAREHOUSE";
    level.doorstrings["locked_no_key"]["power_substation"] = "MP_DMZ_LOCKS/LOCKED_POWER_SUBSTATION";
    level.doorstrings["locked_no_key"]["cell_phone_shop"] = "MP_DMZ_LOCKS/LOCKED_CELL_PHONE_SHOP";
    level.doorstrings["locked_no_key"]["police_academy_barracks"] = "MP_DMZ_LOCKS/LOCKED_POLICE_ACADEMY_BARRACKS";
    level.doorstrings["locked_no_key"]["police_lockerroom"] = "MP_DMZ_LOCKS/LOCKED_POLICE_ACADEMY_LOCKERROOM";
    level.doorstrings["locked_no_key"]["post_office"] = "MP_DMZ_LOCKS/LOCKED_POST_OFFICE";
    level.doorstrings["locked_no_key"]["tv_station"] = "MP_DMZ_LOCKS/LOCKED_TV_STATION";
    level.doorstrings["locked_no_key"]["shopping_booth"] = "MP_DMZ_LOCKS/LOCKED_SHOPPING_BOOTH";
    level.doorstrings["locked_no_key"]["apartment_closet"] = "MP_DMZ_LOCKS/LOCKED_APARTMENT_CLOSET";
    level.doorstrings["locked_no_key"]["north_guard_shack"] = "MP_DMZ_LOCKS/LOCKED_NORTH_GUARD_SHACK";
    level.doorstrings["locked_no_key"]["south_guard_shack"] = "MP_DMZ_LOCKS/LOCKED_SOUTH_GUARD_SHACK";
    level.doorstrings["locked_no_key"]["fortbarrack1"] = "MP_DMZ_LOCKS/LOCKED_FORT_BARRACK1";
    level.doorstrings["locked_no_key"]["antiquities_office"] = "MP_DMZ_LOCKS/LOCKED_ANTIQUITIES_OFFICE";
    level.doorstrings["locked_no_key"]["munitions_storage"] = "MP_DMZ_LOCKS/LOCKED_MUNITIONS_STORAGE";
    level.doorstrings["locked_no_key"]["office_quarters1"] = "MP_DMZ_LOCKS/LOCKED_OFFICEQUARTERS1";
    level.doorstrings["locked_no_key"]["office_quarters2"] = "MP_DMZ_LOCKS/LOCKED_OFFICEQUARTERS2";
    level.doorstrings["locked_no_key"]["quiet_bedroom"] = "MP_DMZ_LOCKS/LOCKED_QUIET_BEDROOM";
    level.doorstrings["locked_no_key"]["car_shop"] = "MP_DMZ_LOCKS/LOCKED_AUTO_SHOP_SUNKEN";
    level.doorstrings["locked_no_key"]["server_room"] = "MP_DMZ_LOCKS/LOCKED_SERVER_ROOM";
    level.doorstrings["locked_no_key"]["sunken_top_office"] = "MP_DMZ_LOCKS/LOCKED_SUNKEN_OFFICE";
    level.doorstrings["locked_no_key"]["sunken_2nd_office"] = "MP_DMZ_LOCKS/LOCKED_SUNKEN_SECOND_OFFICE";
    level.doorstrings["locked_no_key"]["hotel_room1"] = "MP_DMZ_LOCKS/LOCKED_HOTEL_ROOM1";
    level.doorstrings["locked_no_key"]["hotel_room2"] = "MP_DMZ_LOCKS/LOCKED_HOTEL_ROOM2";
    level.doorstrings["locked_no_key"]["dressing_room"] = "MP_DMZ_LOCKS/LOCKED_DRESSING_ROOM";
    level.doorstrings["locked_no_key"]["sec_camera_room"] = "MP_DMZ_LOCKS/LOCKED_SEC_CAMERA_ROOM";
    level.doorstrings["locked_no_key"]["gaming_room"] = "MP_DMZ_LOCKS/LOCKED_GAMING_ROOM";
    level.doorstrings["locked_no_key"]["fishing_shack"] = "MP_DMZ_LOCKS/LOCKED_FISH_SHACK";
    level.doorstrings["locked_no_key"]["mountain_top"] = "MP_DMZ_LOCKS/LOCKED_MOUNTAIN_TOP_ROOM";
    level.doorstrings["locked_no_key"]["spotters_view"] = "MP_DMZ_LOCKS/LOCKED_SPOTTERS_VIEW";
    level.doorstrings["locked_no_key"]["grocery_office"] = "MP_DMZ_LOCKS/LOCKED_GROCERY_OFFICE";
    level.doorstrings["locked_no_key"]["neigh_storage_room"] = "MP_DMZ_LOCKS/LOCKED_NEIGH_STORAGE_ROOM";
    level.doorstrings["locked_no_key"]["apartment_closet"] = "MP_DMZ_LOCKS/LOCKED_APARTMENT_CLOSET";
    level.doorstrings["locked_no_key"]["apartment_snipernest"] = "MP_DMZ_LOCKS/LOCKED_APARTMENT_SNIPERNEST";
    level.doorstrings["locked_no_key"]["destroyed_telescope"] = "MP_DMZ_LOCKS/LOCKED_DESTROYED_TELESCOPE";
    level.doorstrings["locked_no_key"]["groundskeepers"] = "MP_DMZ_LOCKS/LOCKED_GROUNDSKEEPERS";
    level.doorstrings["locked_no_key"]["lighthouse_room"] = "MP_DMZ_LOCKS/LOCKED_LIGHTHOUSE_ROOM";
    level.doorstrings["locked_no_key"]["safe_house"] = "MP_DMZ_LOCKS/LOCKED_SAFE_ROOM";
    level.doorstrings["locked_no_key"]["scientist_apartment"] = "MP_DMZ_LOCKS/LOCKED_SCIENTIST_APARTMENT";
    level.doorstrings["locked_no_key"]["secret_comms"] = "MP_DMZ_LOCKS/LOCKED_SECRET_COMMS";
    level.doorstrings["locked_no_key"]["shopping_booth"] = "MP_DMZ_LOCKS/LOCKED_SHOPPING_BOOTH";
    level.doorstrings["locked_no_key"]["sira_apartment"] = "MP_DMZ_LOCKS/LOCKED_SIRA_APARTMENT";
    level.doorstrings["locked_no_key"]["small_confer_room"] = "MP_DMZ_LOCKS/LOCKED_SMALL_CONFER_ROOM";
    level.doorstrings["locked_no_key"]["supply_rooms"] = "MP_DMZ_LOCKS/LOCKED_SUPPLY_ROOM";
    level.doorstrings["locked_no_key"]["tv_computer_room"] = "MP_DMZ_LOCKS/LOCKED_TV_COMPUTER_ROOM";
    level.doorstrings["locked_no_key"]["yumyum_burger"] = "MP_DMZ_LOCKS/LOCKED_YUM_BURGER";
    level.doorstrings["locked_no_key"]["interrogation_room"] = "MP_DMZ_LOCKS/LOCKED_INTERROGATION_ROOM";
    level.doorstrings["locked_no_key"]["control_tower"] = "MP_DMZ_LOCKS/LOCKED_CONTROL_TOWER";
    level.doorstrings["locked_no_key"]["civic_center"] = "MP_DMZ_LOCKS/LOCKED_CIVIC_CENTER";
    level.doorstrings["locked_no_key"]["sira_mall"] = "MP_DMZ_LOCKS/LOCKED_SIRA_MALL";
    level.doorstrings["locked_no_key"]["fort"] = "MP_DMZ_LOCKS/LOCKED_FORT";
    level.doorstrings["locked_no_key"]["exhume_warehouse"] = "MP_DMZ_LOCKS/LOCKED_EXHUME_WAREHOUSE";
    level.doorstrings["locked_no_key"]["post_office_stronghold"] = "MP_DMZ_LOCKS/LOCKED_POST_OFFICE_STRONGHOLD";
    level.doorstrings["locked_no_key"]["police_academy"] = "MP_DMZ_LOCKS/LOCKED_POLICE_ACADEMY";
    level.doorstrings["locked_no_key"]["embassy"] = "MP_DMZ_LOCKS/LOCKED_EMBASSY";
    level.doorstrings["locked_no_key"]["blacksite"] = "MP_DMZ_LOCKS/LOCKED_BLACKSITE";
    level.doorstrings["locked_no_key"]["br_fortress"] = "MP_DMZ_LOCKS/LOCKED_BR_FORTRESS";
    level.doorstrings["locked_no_key"]["cartel_warehouse"] = "MP_DMZ_LOCKS/LOCKED_CARTEL_WAREHOUSE";
    level.doorstrings["locked_no_key"]["skeleton_key"] = "MP_DMZ_LOCKS/LOCKED_SKELETON_ROOM";
    if (scripts/cp_mp/utility/game_utility::function_eb4bce9b222e36ac() || scripts/cp_mp/utility/game_utility::function_b1d9cdb3f16a7678() || istrue(level.var_65edf6967a5a44e9)) {
        level.doorstrings["locked_no_key"]["low_town_citadel"] = "MP_DMZ_LOCKS/LOCKED_LOW_TOWN_CITADEL";
        level.doorstrings["locked_no_key"]["low_town_citadel_commander_room"] = "MP_DMZ_LOCKS/LOCKED_LOW_TOWN_CITADEL_COMMANDER_ROOM";
    }
    if (scripts/cp_mp/utility/game_utility::function_e21746abaaaf8414()) {
        level.doorstrings["locked_no_key"]["sealion_beach_club_bathroom"] = "MP_DMZ_LOCKS/LOCKED_SEALION_BEACHCLUB_BATHROOM";
        level.doorstrings["locked_no_key"]["sealion_ferry_tourist_information_booth"] = "MP_DMZ_LOCKS/LOCKED_SEALION_FERRY_BOOTH";
        level.doorstrings["locked_no_key"]["sealion_hotel_room_403"] = "MP_DMZ_LOCKS/LOCKED_SEALION_HOTEL_ROOM_403";
        level.doorstrings["locked_no_key"]["sealion_lab_office"] = "MP_DMZ_LOCKS/LOCKED_SEALION_LAB_OFFICE";
        level.doorstrings["locked_no_key"]["sealion_port_harbor_control"] = "MP_DMZ_LOCKS/LOCKED_SEALION_PORT_HARBOR_CONTROL";
        level.doorstrings["locked_no_key"]["sealion_port_managers_office"] = "MP_DMZ_LOCKS/LOCKED_SEALION_PORT_MANAGER_OFFICE";
        level.doorstrings["locked_no_key"]["sealion_water_treatment_control_center"] = "MP_DMZ_LOCKS/LOCKED_SEALION_WATERTREATMENT_CC";
        level.doorstrings["locked_no_key"]["sealion_castle"] = "MP_DMZ_LOCKS/LOCKED_SEALION_CASTLE";
        level.doorstrings["locked_no_key"]["sealion_cityhall"] = "MP_DMZ_LOCKS/LOCKED_SEALION_CITYHALL";
    }
    if (scripts/cp_mp/utility/game_utility::function_5e0e3a24dbb1fae1()) {
        level.doorstrings["locked_no_key"]["delta_aquarium"] = "MP_DMZ_LOCKS/LOCKED_DELTA_AQUARIUM";
        level.doorstrings["locked_no_key"]["delta_cityhall"] = "MP_DMZ_LOCKS/LOCKED_DELTA_CITYHALL";
        level.doorstrings["locked_no_key"]["delta_firestation"] = "MP_DMZ_LOCKS/LOCKED_DELTA_FIRESTATION";
        level.doorstrings["locked_no_key"]["delta_oldmuseum"] = "MP_DMZ_LOCKS/LOCKED_DELTA_OLDMUSEUM";
        level.doorstrings["locked_no_key"]["delta_stadium"] = "MP_DMZ_LOCKS/LOCKED_DELTA_STADIUM";
        level.doorstrings["locked_no_key"]["delta_terminal"] = "MP_DMZ_LOCKS/LOCKED_DELTA_TERMINAL";
        level.doorstrings["locked_no_key"]["delta_trainstation"] = "MP_DMZ_LOCKS/LOCKED_DELTA_TRAINSTATION";
        level.doorstrings["locked_no_key"]["de_animal_care"] = "MP_DMZ_LOCKS/CACHE_LOCKED_DELTA_ANIMALCARE";
        level.doorstrings["locked_no_key"]["de_shops_02"] = "MP_DMZ_LOCKS/CACHE_LOCKED_DELTA_APARTMENT";
        level.doorstrings["locked_no_key"]["de_bike_parking_02"] = "MP_DMZ_LOCKS/CACHE_LOCKED_DELTA_BIKEPARKING";
        level.doorstrings["locked_no_key"]["de_firestation_01"] = "MP_DMZ_LOCKS/CACHE_LOCKED_DELTA_FIRESTATION";
        level.doorstrings["locked_no_key"]["de_waterhome_04"] = "MP_DMZ_LOCKS/CACHE_LOCKED_DELTA_FLOATINGHOUSE";
        level.doorstrings["locked_no_key"]["de_homeboat_08"] = "MP_DMZ_LOCKS/CACHE_LOCKED_DELTA_HOMEBOAT";
        level.doorstrings["locked_no_key"]["de_stadium"] = "MP_DMZ_LOCKS/CACHE_LOCKED_DELTA_STADIUM";
        level.doorstrings["locked_no_key"]["de_cruise_terminal"] = "MP_DMZ_LOCKS/CACHE_LOCKED_DELTA_CRUISETERMINAL";
        level.doorstrings["locked_no_key"]["de_block_01"] = "MP_DMZ_LOCKS/CACHE_LOCKED_DELTA_TOWNHOUSE";
    }
    if (scripts/cp_mp/utility/game_utility::function_ee0c2958aa2ee59e()) {
        level.doorstrings["locked_no_key"]["biobunker_fortress"] = "MP_DMZ_LOCKS/LOCKED_BIOBUNKER_FORTRESS";
        level.doorstrings["locked_no_key"]["datacenter_saferoom"] = "MP_BIOBUNKER/DATA_CENTER_SAFE_DOOR_LOCKED";
        level.doorstrings["locked_no_key"]["code_on_wall_saferoom"] = "MP_BIOBUNKER/CODE_ON_WALL_SAFE_DOOR_LOCKED";
        level.doorstrings["locked_no_key"]["biobunker_stairwell_worn"] = "MP_BIOBUNKER/STAIRWELL_KEY_NEED";
        level.doorstrings["locked_no_key"]["biobunker_workshop_worn"] = "MP_BIOBUNKER/WORKSHOP_KEY_NEED";
    }
    level.doorstrings["locked_has_key"]["fortress"] = "MP_DMZ_LOCKS/UNLOCK_FORTRESS";
    level.doorstrings["locked_has_key"]["stuck"] = "MP_DMZ_LOCKS/STUCK";
    level.doorstrings["locked_has_key"]["testuniquedoor"] = "MP_DMZ_LOCKS/UNLOCK_TESTUNIQUEDOOR";
    level.doorstrings["locked_has_key"]["quarry_storage"] = "MP_DMZ_LOCKS/UNLOCK_QUARRY_STORAGE";
    level.doorstrings["locked_has_key"]["quarry_control"] = "MP_DMZ_LOCKS/UNLOCK_QUARRY_CONTROL";
    level.doorstrings["locked_has_key"]["quarry_office"] = "MP_DMZ_LOCKS/UNLOCK_QUARRY_OFFICE";
    level.doorstrings["locked_has_key"]["hydro_storage"] = "MP_DMZ_LOCKS/UNLOCK_HYDRO_STORAGE";
    level.doorstrings["locked_has_key"]["hydro_apt"] = "MP_DMZ_LOCKS/UNLOCK_HYDRO_APT";
    level.doorstrings["locked_has_key"]["hydro_weapondrop"] = "MP_DMZ_LOCKS/UNLOCK_HYDRO_WEAPONDROP";
    level.doorstrings["locked_has_key"]["hostage_door"] = "MP_DMZ_MISSIONS/UNLOCK_HOSTAGE_DOOR";
    level.doorstrings["locked_has_key"]["trap"] = "MP_DMZ_MISSIONS/TRAP_DOOR_UNLOCK";
    level.doorstrings["locked_has_key"]["trapper_door"] = "MP_DMZ_LOCKS/UNLOCK_TRAPPER_DOOR";
    level.doorstrings["locked_has_key"]["resort_entrance"] = "MP_DMZ_LOCKS/UNLOCK_RESORT_ENTRANCE";
    level.doorstrings["locked_has_key"]["firefighttest01"] = "MP_DMZ_LOCKS/UNLOCK_FIREFIGHTTEST01";
    level.doorstrings["locked_has_key"]["biolab_door"] = "MP_DMZ_LOCKS/UNLOCK_DOOR";
    level.doorstrings["locked_has_key"]["red_door"] = "MP_DMZ_LOCKS/UNLOCK_DOOR";
    level.doorstrings["locked_has_key"]["blue_door"] = "MP_DMZ_LOCKS/UNLOCK_DOOR";
    level.doorstrings["locked_has_key"]["green_door"] = "MP_DMZ_LOCKS/UNLOCK_DOOR";
    level.doorstrings["locked_has_key"]["black_door"] = "MP_DMZ_LOCKS/UNLOCK_DOOR";
    level.doorstrings["locked_has_key"]["gold_door"] = "MP_DMZ_LOCKS/UNLOCK_DOOR";
    level.doorstrings["locked_has_key"]["armory_room"] = "MP_DMZ_LOCKS/UNLOCK_DOOR";
    level.doorstrings["locked_has_key"]["third_floor"] = "MP_DMZ_LOCKS/UNLOCK_DOOR";
    level.doorstrings["locked_has_key"]["high_security"] = "MP_DMZ_LOCKS/UNLOCK_DOOR";
    level.doorstrings["locked_has_key"]["conference_room"] = "MP_DMZ_LOCKS/UNLOCK_CONFERENCE_ROOM";
    level.doorstrings["locked_has_key"]["maintenance"] = "MP_DMZ_LOCKS/UNLOCK_AIRPORT_MAINTENANCE";
    level.doorstrings["locked_has_key"]["undershack"] = "MP_DMZ_LOCKS/UNLOCK_UNDERGROUND_SHACK";
    level.doorstrings["locked_has_key"]["cliffroom"] = "MP_DMZ_LOCKS/UNLOCK_CLIFF_ROOM";
    level.doorstrings["locked_has_key"]["gravehouse"] = "MP_DMZ_LOCKS/UNLOCK_GRAVEYARD_HOUSE";
    level.doorstrings["locked_has_key"]["poppyhome"] = "MP_DMZ_LOCKS/UNLOCK_POPPY_HOME";
    level.doorstrings["locked_has_key"]["western_storage"] = "MP_DMZ_LOCKS/UNLOCK_WESTERN_STORAGE";
    level.doorstrings["locked_has_key"]["mobile_office"] = "MP_DMZ_LOCKS/UNLOCK_MOBILE_OFFICE";
    level.doorstrings["locked_has_key"]["crane_building"] = "MP_DMZ_LOCKS/UNLOCK_CRANE_BUILDING";
    level.doorstrings["locked_has_key"]["policestation"] = "MP_DMZ_LOCKS/UNLOCK_POLICE_LOCKERROOM";
    level.doorstrings["locked_has_key"]["smugglers_warehouse"] = "MP_DMZ_LOCKS/UNLOCK_SMUGGLERS_WAREHOUSE";
    level.doorstrings["locked_has_key"]["power_substation"] = "MP_DMZ_LOCKS/UNLOCK_POWER_SUBSTATION";
    level.doorstrings["locked_has_key"]["cell_phone_shop"] = "MP_DMZ_LOCKS/UNLOCK_CELL_PHONE_SHOP";
    level.doorstrings["locked_has_key"]["police_academy_barracks"] = "MP_DMZ_LOCKS/UNLOCK_POLICE_ACADEMY_BARRACKS";
    level.doorstrings["locked_has_key"]["police_lockerroom"] = "MP_DMZ_LOCKS/UNLOCK_POLICE_ACADEMY_LOCKERROOM";
    level.doorstrings["locked_has_key"]["post_office"] = "MP_DMZ_LOCKS/UNLOCK_POST_OFFICE";
    level.doorstrings["locked_has_key"]["tv_station"] = "MP_DMZ_LOCKS/UNLOCK_TV_STATION";
    level.doorstrings["locked_has_key"]["shopping_booth"] = "MP_DMZ_LOCKS/UNLOCK_SHOPPING_BOOTH";
    level.doorstrings["locked_has_key"]["apartment_closet"] = "MP_DMZ_LOCKS/UNLOCK_APARTMENT_CLOSET";
    level.doorstrings["locked_has_key"]["control_room"] = "MP_DMZ_LOCKS/UNLOCK_CONTROL_ROOM";
    level.doorstrings["locked_has_key"]["north_guard_shack"] = "MP_DMZ_LOCKS/UNLOCK_NORTH_GUARD_SHACK";
    level.doorstrings["locked_has_key"]["south_guard_shack"] = "MP_DMZ_LOCKS/UNLOCK_SOUTH_GUARD_SHACK1";
    level.doorstrings["locked_has_key"]["fortbarrack1"] = "MP_DMZ_LOCKS/UNLOCK_FORT_BARRACK1";
    level.doorstrings["locked_has_key"]["antiquities_office"] = "MP_DMZ_LOCKS/UNLOCK_ANTIQUITIES_OFFICE";
    level.doorstrings["locked_has_key"]["munitions_storage"] = "MP_DMZ_LOCKS/UNLOCK_MUNITIONS_STORAGE";
    level.doorstrings["locked_has_key"]["office_quarters1"] = "MP_DMZ_LOCKS/UNLOCK_OFFICE_QUARTERS1";
    level.doorstrings["locked_has_key"]["office_quarters2"] = "MP_DMZ_LOCKS/UNLOCK_OFFICE_QUARTERS2";
    level.doorstrings["locked_has_key"]["quiet_bedroom"] = "MP_DMZ_LOCKS/UNLOCK_QUIET_BEDROOM";
    level.doorstrings["locked_has_key"]["car_shop"] = "MP_DMZ_LOCKS/UNLOCK_AUTO_SHOP_SUNKEN";
    level.doorstrings["locked_has_key"]["server_room"] = "MP_DMZ_LOCKS/UNLOCK_SERVER_ROOM";
    level.doorstrings["locked_has_key"]["sunken_top_office"] = "MP_DMZ_LOCKS/UNLOCK_SUNKEN_OFFICE";
    level.doorstrings["locked_has_key"]["sunken_2nd_office"] = "MP_DMZ_LOCKS/UNLOCK_SUNKEN_SECOND_OFFICE";
    level.doorstrings["locked_has_key"]["hotel_room1"] = "MP_DMZ_LOCKS/UNLOCK_HOTEL_ROOM1";
    level.doorstrings["locked_has_key"]["hotel_room2"] = "MP_DMZ_LOCKS/UNLOCK_HOTEL_ROOM2";
    level.doorstrings["locked_has_key"]["dressing_room"] = "MP_DMZ_LOCKS/UNLOCK_DRESSING_ROOM";
    level.doorstrings["locked_has_key"]["sec_camera_room"] = "MP_DMZ_LOCKS/UNLOCK_SEC_CAMERA_ROOM";
    level.doorstrings["locked_has_key"]["gaming_room"] = "MP_DMZ_LOCKS/UNLOCK_GAMING_ROOM";
    level.doorstrings["locked_has_key"]["fishing_shack"] = "MP_DMZ_LOCKS/UNLOCK_FISH_SHACK";
    level.doorstrings["locked_has_key"]["mountain_top"] = "MP_DMZ_LOCKS/UNLOCK_MOUNTAIN_TOP_ROOM";
    level.doorstrings["locked_has_key"]["spotters_view"] = "MP_DMZ_LOCKS/UNLOCK_SPOTTERS_VIEW";
    level.doorstrings["locked_has_key"]["grocery_office"] = "MP_DMZ_LOCKS/UNLOCK_GROCERY_OFFICE";
    level.doorstrings["locked_has_key"]["neigh_storage_room"] = "MP_DMZ_LOCKS/UNLOCK_NEIGH_STORAGE_ROOM";
    level.doorstrings["locked_has_key"]["apartment_closet"] = "MP_DMZ_LOCKS/UNLOCK_APARTMENT_CLOSET";
    level.doorstrings["locked_has_key"]["apartment_snipernest"] = "MP_DMZ_LOCKS/UNLOCK_APARTMENT_SNIPERNEST";
    level.doorstrings["locked_has_key"]["destroyed_telescope"] = "MP_DMZ_LOCKS/UNLOCK_DESTROYED_TELESCOPE";
    level.doorstrings["locked_has_key"]["groundskeepers"] = "MP_DMZ_LOCKS/UNLOCK_GROUNDSKEEPERS";
    level.doorstrings["locked_has_key"]["lighthouse_room"] = "MP_DMZ_LOCKS/UNLOCK_LIGHTHOUSE_ROOM";
    level.doorstrings["locked_has_key"]["safe_house"] = "MP_DMZ_LOCKS/UNLOCK_SAFE_HOUSE";
    level.doorstrings["locked_has_key"]["scientist_apartment"] = "MP_DMZ_LOCKS/UNLOCK_SCIENTIST_APARTMENT";
    level.doorstrings["locked_has_key"]["secret_comms"] = "MP_DMZ_LOCKS/UNLOCK_SECRET_COMMS";
    level.doorstrings["locked_has_key"]["shopping_booth"] = "MP_DMZ_LOCKS/UNLOCK_SHOPPING_BOOTH";
    level.doorstrings["locked_has_key"]["sira_apartment"] = "MP_DMZ_LOCKS/UNLOCK_SIRA_APARTMENT";
    level.doorstrings["locked_has_key"]["small_confer_room"] = "MP_DMZ_LOCKS/UNLOCK_SMALL_CONFER_ROOM";
    level.doorstrings["locked_has_key"]["supply_rooms"] = "MP_DMZ_LOCKS/UNLOCK_SUPPLY_ROOM";
    level.doorstrings["locked_has_key"]["tv_computer_room"] = "MP_DMZ_LOCKS/UNLOCK_TV_COMPUTER_ROOM";
    level.doorstrings["locked_has_key"]["yumyum_burger"] = "MP_DMZ_LOCKS/UNLOCK_YUM_BURGER";
    level.doorstrings["locked_has_key"]["interrogation_room"] = "MP_DMZ_LOCKS/UNLOCK_INTERROGATION_ROOM";
    level.doorstrings["locked_has_key"]["control_tower"] = "MP_DMZ_LOCKS/UNLOCK_CONTROL_TOWER";
    level.doorstrings["locked_has_key"]["civic_center"] = "MP_DMZ_LOCKS/UNLOCK_CIVIC_CENTER";
    level.doorstrings["locked_has_key"]["sira_mall"] = "MP_DMZ_LOCKS/UNLOCK_SIRA_MALL";
    level.doorstrings["locked_has_key"]["fort"] = "MP_DMZ_LOCKS/UNLOCK_FORT";
    level.doorstrings["locked_has_key"]["exhume_warehouse"] = "MP_DMZ_LOCKS/UNLOCK_EXHUME_WAREHOUSE";
    level.doorstrings["locked_has_key"]["post_office_stronghold"] = "MP_DMZ_LOCKS/UNLOCK_POST_OFFICE_STRONGHOLD";
    level.doorstrings["locked_has_key"]["police_academy"] = "MP_DMZ_LOCKS/UNLOCK_POLICE_ACADEMY";
    level.doorstrings["locked_has_key"]["embassy"] = "MP_DMZ_LOCKS/UNLOCK_EMBASSY";
    level.doorstrings["locked_has_key"]["blacksite"] = "MP_DMZ_LOCKS/UNLOCK_BLACKSITE";
    level.doorstrings["locked_has_key"]["cartel_warehouse"] = "MP_DMZ_LOCKS/UNLOCK_CARTEL_WAREHOUSE";
    level.doorstrings["locked_has_key"]["skeleton_key"] = "MP_DMZ_LOCKS/UNLOCK_SKELETON_ROOM";
    level.doorstrings["locked_has_key"]["stronghold_with_skeleton"] = "MP_DMZ_LOCKS/UNLOCK_STRONGOLD_WITH_SKELETON";
    level.doorstrings["locked_has_key"]["stuck"] = "MP_DMZ_LOCKS/UNLOCK_DOOR";
    if (scripts/cp_mp/utility/game_utility::function_eb4bce9b222e36ac() || scripts/cp_mp/utility/game_utility::function_b1d9cdb3f16a7678() || istrue(level.var_65edf6967a5a44e9)) {
        level.doorstrings["locked_has_key"]["low_town_citadel"] = "MP_DMZ_LOCKS/UNLOCK_LOW_TOWN_CITADEL";
        level.doorstrings["locked_has_key"]["low_town_citadel_commander_room"] = "MP_DMZ_LOCKS/UNLOCK_LOW_TOWN_CITADEL_COMMANDER_ROOM";
    }
    if (scripts/cp_mp/utility/game_utility::function_e21746abaaaf8414()) {
        level.doorstrings["locked_has_key"]["sealion_beach_club_bathroom"] = "MP_DMZ_LOCKS/UNLOCK_SEALION_BEACHCLUB_BATHROOM";
        level.doorstrings["locked_has_key"]["sealion_ferry_tourist_information_booth"] = "MP_DMZ_LOCKS/UNLOCK_SEALION_FERRY_BOOTH";
        level.doorstrings["locked_has_key"]["sealion_hotel_room_403"] = "MP_DMZ_LOCKS/UNLOCK_SEALION_HOTEL_ROOM_403";
        level.doorstrings["locked_has_key"]["sealion_lab_office"] = "MP_DMZ_LOCKS/UNLOCK_SEALION_LAB_OFFICE";
        level.doorstrings["locked_has_key"]["sealion_port_harbor_control"] = "MP_DMZ_LOCKS/UNLOCK_SEALION_PORT_HARBOR_CONTROL";
        level.doorstrings["locked_has_key"]["sealion_port_managers_office"] = "MP_DMZ_LOCKS/UNLOCK_SEALION_PORT_MANAGER_OFFICE";
        level.doorstrings["locked_has_key"]["sealion_water_treatment_control_center"] = "MP_DMZ_LOCKS/UNLOCK_SEALION_WATERTREATMENT_CC";
        level.doorstrings["locked_has_key"]["sealion_castle"] = "MP_DMZ_LOCKS/UNLOCK_SEALION_CASTLE";
        level.doorstrings["locked_has_key"]["sealion_cityhall"] = "MP_DMZ_LOCKS/UNLOCK_SEALION_CITYHALL";
    }
    if (scripts/cp_mp/utility/game_utility::function_5e0e3a24dbb1fae1()) {
        level.doorstrings["locked_has_key"]["delta_aquarium"] = "MP_DMZ_LOCKS/UNLOCK_DELTA_AQUARIUM";
        level.doorstrings["locked_has_key"]["delta_cityhall"] = "MP_DMZ_LOCKS/UNLOCK_DELTA_CITYHALL";
        level.doorstrings["locked_has_key"]["delta_firestation"] = "MP_DMZ_LOCKS/UNLOCK_DELTA_FIRESTATION";
        level.doorstrings["locked_has_key"]["delta_oldmuseum"] = "MP_DMZ_LOCKS/UNLOCK_DELTA_OLDMUSEUM";
        level.doorstrings["locked_has_key"]["delta_stadium"] = "MP_DMZ_LOCKS/UNLOCK_DELTA_STADIUM";
        level.doorstrings["locked_has_key"]["delta_terminal"] = "MP_DMZ_LOCKS/UNLOCK_DELTA_TERMINAL";
        level.doorstrings["locked_has_key"]["delta_trainstation"] = "MP_DMZ_LOCKS/UNLOCK_DELTA_TRAINSTATION";
        level.doorstrings["locked_has_key"]["de_animal_care"] = "MP_DMZ_LOCKS/CACHE_UNLOCK_DELTA_ANIMALCARE";
        level.doorstrings["locked_has_key"]["de_shops_02"] = "MP_DMZ_LOCKS/CACHE_UNLOCK_DELTA_APARTMENT";
        level.doorstrings["locked_has_key"]["de_bike_parking_02"] = "MP_DMZ_LOCKS/CACHE_UNLOCK_DELTA_BIKEPARKING";
        level.doorstrings["locked_has_key"]["de_firestation_01"] = "MP_DMZ_LOCKS/CACHE_UNLOCK_DELTA_FIRESTATION";
        level.doorstrings["locked_has_key"]["de_waterhome_04"] = "MP_DMZ_LOCKS/CACHE_UNLOCK_DELTA_FLOATINGHOUSE";
        level.doorstrings["locked_has_key"]["de_homeboat_08"] = "MP_DMZ_LOCKS/CACHE_UNLOCK_DELTA_HOMEBOAT";
        level.doorstrings["locked_has_key"]["de_stadium"] = "MP_DMZ_LOCKS/CACHE_UNLOCK_DELTA_STADIUM";
        level.doorstrings["locked_has_key"]["de_cruise_terminal"] = "MP_DMZ_LOCKS/CACHE_UNLOCK_DELTA_CRUISETERMINAL";
        level.doorstrings["locked_has_key"]["de_block_01"] = "MP_DMZ_LOCKS/CACHE_UNLOCK_DELTA_TOWNHOUSE";
    }
    if (scripts/cp_mp/utility/game_utility::function_ee0c2958aa2ee59e()) {
        level.doorstrings["locked_has_key"]["biobunker_fortress"] = "MP_DMZ_LOCKS/UNLOCK_BIOBUNKER_FORTRESS";
        level.doorstrings["locked_has_key"]["datacenter_saferoom"] = "MP_BIOBUNKER/DATA_CENTER_SAFE_DOOR_UNLOCK";
        level.doorstrings["locked_has_key"]["code_on_wall_saferoom"] = "MP_BIOBUNKER/DATA_CENTER_SAFE_DOOR_UNLOCK";
        level.doorstrings["locked_has_key"]["biobunker_workshop_worn"] = "MP_BIOBUNKER/WORKSHOP_KEY_UNLOCK";
        level.doorstrings["locked_has_key"]["biobunker_stairwell_worn"] = "MP_BIOBUNKER/STAIRWELL_KEY_UNLOCK";
    }
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x840b
// Size: 0x5a
function function_94f5e3929619c3d1(doorname) {
    string = level.doorstrings["locked_no_key"][tolower(doorname)];
    if (!isdefined(string)) {
        /#
            println("MP_DMZ_LOCKS/LOCKED_SMUGGLERS_WAREHOUSE" + doorname);
        #/
        string = level.doorstrings["locked_no_key"]["stuck"];
    }
    return string;
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x846d
// Size: 0x5a
function function_54f0ba9ac5666aba(doorname) {
    string = level.doorstrings["locked_has_key"][tolower(doorname)];
    if (!isdefined(string)) {
        /#
            println("MP_BIOBUNKER/WORKSHOP_KEY_NEED" + doorname);
        #/
        string = level.doorstrings["locked_has_key"]["stuck"];
    }
    return string;
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84cf
// Size: 0x2d
function function_2a56c656879dbf63() {
    /#
        setdvar(@"hash_34766c6f7cda260e", 0);
        level thread function_ed06a4c85b7994a0();
    #/
    function_8e1cbe18678d7fff();
    function_29e046251bdc472c();
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8503
// Size: 0xaf
function function_29e046251bdc472c() {
    while (!isdefined(level.struct_class_names)) {
        waitframe();
    }
    level.lockedspaces = [];
    var_4c7bfe49f37e4faf = level.struct_class_names["script_noteworthy"]["lockedSpace"];
    if (!isdefined(var_4c7bfe49f37e4faf)) {
        return;
    }
    foreach (mainnode in var_4c7bfe49f37e4faf) {
        function_2039418022567d47(mainnode);
        function_dcec5158a800e39d(mainnode);
        level.lockedspaces[level.lockedspaces.size] = mainnode;
    }
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85b9
// Size: 0x24f
function function_2039418022567d47(var_809fdff7726141bb) {
    nodes = array_combine(getstructarray(var_809fdff7726141bb.target, "targetname"), getentarray(var_809fdff7726141bb.target, "targetname"));
    var_809fdff7726141bb.lockeddoors = [];
    var_809fdff7726141bb.var_84b0ef6bddd2907a = [];
    var_809fdff7726141bb.var_3da7559f232a2ca9 = [];
    var_809fdff7726141bb.props = [];
    foreach (node in nodes) {
        if (!isdefined(node.angles)) {
            node.angles = (0, 0, 0);
        }
        if (!isdefined(node.script_noteworthy)) {
            continue;
        }
        switch (tolower(node.script_noteworthy)) {
        case #"hash_cd0ffa281c8e3a8":
            var_809fdff7726141bb.lockeddoors = function_ad1b6accbaab404e(node, var_809fdff7726141bb.lockeddoors, tolower(var_809fdff7726141bb.targetname), 0);
            break;
        case #"hash_a0a74a8a22d1d16":
            var_809fdff7726141bb.var_84b0ef6bddd2907a = function_ad1b6accbaab404e(node, var_809fdff7726141bb.var_84b0ef6bddd2907a, "stuck", 0);
            break;
        case #"hash_df8921e339df1f80":
            node.var_86740fa764ee2fdc = 1;
            var_809fdff7726141bb.var_3da7559f232a2ca9[var_809fdff7726141bb.var_3da7559f232a2ca9.size] = node;
            break;
        case #"hash_db521e4972a48a9d":
            node.isnote = 1;
            var_809fdff7726141bb.var_3da7559f232a2ca9[var_809fdff7726141bb.var_3da7559f232a2ca9.size] = node;
            break;
        case #"hash_55425b6c36803a4c":
            node.iskey = 1;
            var_809fdff7726141bb.var_3da7559f232a2ca9[var_809fdff7726141bb.var_3da7559f232a2ca9.size] = node;
            break;
        default:
            var_809fdff7726141bb.props[var_809fdff7726141bb.props.size] = node;
            break;
        }
    }
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x880f
// Size: 0x15c
function function_dcec5158a800e39d(var_7be3a4ca79d6d8e6, var_14dcea3d745e5b2b) {
    foreach (door in var_7be3a4ca79d6d8e6.lockeddoors) {
        function_fbbfe6f05eda5eb1(door);
        door.var_3325cfe18a840beb = 1;
        if (isdefined(var_14dcea3d745e5b2b)) {
            door.var_def557e8fd5c6763 = var_14dcea3d745e5b2b;
            continue;
        }
        door.var_def557e8fd5c6763 = &function_bf5ad2061b782c3c;
    }
    foreach (door in var_7be3a4ca79d6d8e6.var_84b0ef6bddd2907a) {
        function_fbbfe6f05eda5eb1(door);
    }
    namespace_9823ee6035594d67::function_401b0949743b45a9(var_7be3a4ca79d6d8e6);
    foreach (node in var_7be3a4ca79d6d8e6.var_3da7559f232a2ca9) {
        function_4c877fc54e2e6854(node, var_7be3a4ca79d6d8e6.targetname);
    }
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8972
// Size: 0x67
function function_64332f29e2409e55(origin) {
    foreach (volume in level.var_ab18903aa481fff2) {
        if (ispointinvolume(origin, volume)) {
            return true;
        }
    }
    return false;
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89e1
// Size: 0x1d
function function_bf5ad2061b782c3c(scriptable, player) {
    namespace_8361bad7391de074::function_1d1df26df05a6c8(scriptable, player);
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a05
// Size: 0xe2
function function_ed1aea6648bcdc28(scriptablename, keylevel) {
    /#
        assertex(isdefined(keylevel), "Key Level is undefined in getLowerQualityKey");
    #/
    /#
        assertex(isdefined(scriptablename), "Scriptable name is undefined in getLowerQualityKey");
    #/
    if (!isdefined(scriptablename) || !isdefined(keylevel)) {
        return undefined;
    }
    switch (keylevel) {
    case 0:
        var_f48a1fa8eddf2b4a = namespace_38b993c4618e76cd::getlootidfromref(scriptablename + "_used");
        /#
            assertex(isdefined(var_f48a1fa8eddf2b4a), "Lower quality key is not defined for: " + scriptablename);
        #/
        if (!isdefined(var_f48a1fa8eddf2b4a)) {
            return undefined;
        }
        return var_f48a1fa8eddf2b4a;
    case 1:
        var_f48a1fa8eddf2b4a = namespace_38b993c4618e76cd::getlootidfromref(scriptablename + "_worn");
        /#
            assertex(isdefined(var_f48a1fa8eddf2b4a), "Lower quality key is not defined for: " + scriptablename + "_worn");
        #/
        if (!isdefined(var_f48a1fa8eddf2b4a)) {
            return undefined;
        }
        return var_f48a1fa8eddf2b4a;
    case 2:
        return undefined;
    default:
        return undefined;
    }
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8aee
// Size: 0xd5
function function_ed06a4c85b7994a0() {
    /#
        level endon("MP_DMZ_LOCKS/UNLOCK_SPOTTERS_VIEW");
        while (true) {
            if (getdvarint(@"hash_34766c6f7cda260e", 0) == 1) {
                foreach (var_809fdff7726141bb in level.lockedspaces) {
                    sphere(var_809fdff7726141bb.origin, 128, (0, 0, 1));
                    print3d(var_809fdff7726141bb.origin + (0, 0, 550), var_809fdff7726141bb.targetname, (1, 1, 1), 1, 2, 20);
                }
            }
            waitframe();
        }
    #/
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bca
// Size: 0x13e
function function_8e1cbe18678d7fff() {
    var_5374a9df4582df00 = getdvar(@"hash_64ddcf029687ca8b", "mp/loot/br/dmz/lootset_custom_nodes.csv");
    level.var_3da7559f232a2ca9 = [];
    numrows = tablelookupgetnumrows(var_5374a9df4582df00);
    for (i = 0; istrue(i < numrows); i++) {
        var_49710df804bea4d0 = tablelookupbyrow(var_5374a9df4582df00, i, 0);
        if (!isdefined(level.var_3da7559f232a2ca9[var_49710df804bea4d0])) {
            level.var_3da7559f232a2ca9[var_49710df804bea4d0] = [];
        }
        lootitemtype = tablelookupbyrow(var_5374a9df4582df00, i, 1);
        dropchance = int(tablelookupbyrow(var_5374a9df4582df00, i, 2));
        var_dcb6e2b7467a12fc = tablelookupbyrow(var_5374a9df4582df00, i, 3);
        var_b99b2114134fe248 = tablelookupbyrow(var_5374a9df4582df00, i, 4);
        level.var_3da7559f232a2ca9[var_49710df804bea4d0][lootitemtype] = spawnstruct();
        level.var_3da7559f232a2ca9[var_49710df804bea4d0][lootitemtype].dropchance = dropchance;
        level.var_3da7559f232a2ca9[var_49710df804bea4d0][lootitemtype].var_dcb6e2b7467a12fc = var_dcb6e2b7467a12fc;
        level.var_3da7559f232a2ca9[var_49710df804bea4d0][lootitemtype].var_b99b2114134fe248 = var_b99b2114134fe248;
    }
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8d0f
// Size: 0xa8
function function_799a9ee634da2160(node) {
    if (!isdefined(node.classname) || !isent(node)) {
        return false;
    }
    var_9f1cae7f3799988a = node isscriptable();
    isnote = issubstr(node.classname, "note");
    if (istrue(isnote)) {
        node.isnote = isnote;
    }
    iskey = issubstr(node.classname, "key");
    if (istrue(iskey)) {
        node.iskey = isnote;
    }
    return var_9f1cae7f3799988a && (isnote || iskey);
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8dbf
// Size: 0x42c
function function_4c877fc54e2e6854(node, var_49710df804bea4d0) {
    var_49710df804bea4d0 = tolower(var_49710df804bea4d0);
    if (!isdefined(level.var_3da7559f232a2ca9[var_49710df804bea4d0])) {
        /#
            /#
                assertmsg("MP_DMZ_LOCKS/UNLOCK_SMALL_CONFER_ROOM" + var_49710df804bea4d0);
            #/
        #/
        return;
    }
    if (istrue(node.iskey)) {
        if (!function_e05f1f84bb69a4d2(var_49710df804bea4d0, "key")) {
            percentagespawn = 0;
        } else {
            percentagespawn = level.var_3da7559f232a2ca9[var_49710df804bea4d0]["key"].dropchance;
        }
        if (percentagespawn == 0) {
            return;
        }
        roll = randomint(100);
        if (roll < percentagespawn) {
            dropinfo = scripts/mp/gametypes/br_pickups::getitemdropinfo(node.origin, node.angles);
            iscritical = 0;
            keyname = "loot_key_fortress";
            var_dcb6e2b7467a12fc = level.var_3da7559f232a2ca9[var_49710df804bea4d0]["key"].var_dcb6e2b7467a12fc;
            if (isdefined(var_dcb6e2b7467a12fc) && var_dcb6e2b7467a12fc != "") {
                keyname = var_dcb6e2b7467a12fc;
                if (issubstr(keyname, "loot_key")) {
                    iscritical = 1;
                }
            }
            tokens = strtok(keyname, "_");
            if (tokens[0] == "tier1Key") {
                keyname = function_23326c8ac97c60c7(1, 0, 0, 0, 1, 0, 0, 0, 20, 60, 20, tokens[1]);
            } else if (tokens[0] == "tier2Key") {
                keyname = function_23326c8ac97c60c7(0, 1, 0, 0, 0, 1, 0, 0, 20, 60, 20, tokens[1]);
            } else if (tokens[0] == "tier3Key") {
                keyname = function_23326c8ac97c60c7(0, 0, 1, 0, 0, 0, 1, 0, 20, 60, 20, tokens[1]);
            } else if (tokens[0] == "heroKey") {
                keyname = function_23326c8ac97c60c7(0, 0, 0, 1, 0, 0, 0, 1, 20, 60, 20, tokens[1]);
            }
            scriptable = scripts/mp/gametypes/br_pickups::spawnpickup(keyname, dropinfo, 1, 0);
            if (istrue(iscritical)) {
                scriptable.criticalitem = 1;
            }
        }
        return;
    }
    if (istrue(node.isnote) || istrue(node.var_86740fa764ee2fdc)) {
        if (isdefined(level.var_3da7559f232a2ca9[var_49710df804bea4d0]["noteAlreadyPlaced"])) {
            return;
        } else {
            level.var_3da7559f232a2ca9[var_49710df804bea4d0]["noteAlreadyPlaced"] = 1;
        }
        if (!function_e05f1f84bb69a4d2(var_49710df804bea4d0, "note")) {
            percentagespawn = 0;
        } else {
            percentagespawn = level.var_3da7559f232a2ca9[var_49710df804bea4d0]["note"].dropchance;
        }
        if (percentagespawn == 0) {
            return;
        }
        roll = randomint(100);
        if (roll < percentagespawn) {
            notename = level.var_3da7559f232a2ca9[var_49710df804bea4d0]["note"].var_dcb6e2b7467a12fc;
            if (!isdefined(notename) || notename == "") {
                return;
            }
            offset = (0, 0, 0);
            if (scripts/cp_mp/utility/game_utility::function_7ee65fae13124702()) {
                if (istrue(node.var_86740fa764ee2fdc)) {
                    if (issubstr(notename, "_note_")) {
                        offset = (-90, 0, 0);
                    } else {
                        offset = (90, 0, 0);
                    }
                } else if (istrue(node.isnote)) {
                    if (issubstr(notename, "_notebook_")) {
                        offset = (90, 0, 0);
                    } else {
                        offset = (90, 0, 0);
                    }
                }
            } else if (scripts/cp_mp/utility/game_utility::function_e21746abaaaf8414()) {
                if (notename == "interactable_notebook_sealion_scared01") {
                    node.angles = (0, 0, 0);
                } else if (istrue(node.isnote)) {
                    offset = (90, 0, 0);
                }
            }
            dropinfo = scripts/mp/gametypes/br_pickups::getitemdropinfo(node.origin, node.angles + offset);
            scriptable = scripts/mp/gametypes/br_pickups::spawnpickup(notename, dropinfo, 1, 0);
            scriptable.criticalitem = 1;
        }
    }
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x91f2
// Size: 0x86
function function_e05f1f84bb69a4d2(var_49710df804bea4d0, itemtype) {
    if (!isdefined(var_49710df804bea4d0) || !isdefined(itemtype)) {
        return false;
    }
    if (!isdefined(level.var_3da7559f232a2ca9[var_49710df804bea4d0])) {
        return false;
    }
    if (!isdefined(level.var_3da7559f232a2ca9[var_49710df804bea4d0][itemtype])) {
        return false;
    }
    if (!isdefined(level.var_3da7559f232a2ca9[var_49710df804bea4d0][itemtype].dropchance)) {
        return false;
    }
    if (!isint(level.var_3da7559f232a2ca9[var_49710df804bea4d0][itemtype].dropchance)) {
        return false;
    }
    return true;
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9280
// Size: 0xfe
function function_a894d6041798cc06() {
    level thread function_a9d72a6ee70123e5();
    scripts/engine/scriptable::scriptable_addusedcallbackbypart("locked_cache_prompt", &function_38904bc3a49af40c);
    while (!isdefined(level.struct_class_names)) {
        waitframe();
    }
    cachenodes = getstructarray("lockedCache", "targetname");
    foreach (cachenode in cachenodes) {
        var_c54e8a88506815aa = getentitylessscriptablearray(undefined, undefined, cachenode.origin, 64, "body");
        if (!isdefined(var_c54e8a88506815aa)) {
            continue;
        }
        cache = var_c54e8a88506815aa[0];
        if (!isdefined(cache)) {
            continue;
        }
        cache lockedcache_lock(cachenode.origin, default_to(cachenode.script_noteworthy, "generic"), "closed_locked");
    }
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9385
// Size: 0xad
function lockedcache_lock(origin, keyname, lockstate, unlockstate) {
    if (isdefined(lockstate)) {
        self setscriptablepartstate("body", lockstate);
    }
    self.unlockstate = unlockstate;
    scriptable = spawnscriptable("locked_cache_prompt", origin);
    scriptable setscriptablepartstate("locked_cache_prompt", ter_op(keyname == "generic_no_key", "on_no_key", "on"));
    scriptable.keyname = keyname;
    scriptable.cache = self;
    scriptable.canplaysound = 1;
    self.islockedcache = 1;
    return scriptable;
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x943a
// Size: 0x3c
function function_f3b1f1d41c65b340() {
    self.cache setscriptablepartstate("body", default_to(self.cache.unlockstate, "closed_usable"));
    self freescriptable();
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x947d
// Size: 0x48f
function function_38904bc3a49af40c(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    backpackkeyname = instance.keyname;
    if (instance.keyname == "firefightTestContainer") {
        backpackkeyname = "fortress";
    }
    if (!function_e0e50ef00477deeb("loot_key_" + backpackkeyname, player)) {
        player scripts/mp/hud_message::showerrormessage(function_bd958525be466cd7(backpackkeyname));
        if (istrue(instance.canplaysound)) {
            instance.canplaysound = 0;
            playsoundatpos(instance.origin, "mp_door_locked");
            return 0;
        }
        wait(3);
        instance.canplaysound = 1;
        return 0;
    }
    cache = instance.cache;
    player thread function_83f5cdc3d883507e(instance, player);
    playsoundatpos(instance.origin, "mp_door_unlock_key");
    savedkeyname = instance.keyname;
    if (instance.keyname == "crash_lrg_2") {
        grenadeorigin = instance.cache.origin + (0, 0, 42);
        grenade = magicgrenademanual("gas_grenade_mp", grenadeorigin, (0, 0, 1), 0.1);
        grenade.owner = player;
        player thread scripts/mp/equipment/gas_grenade::gas_used(grenade);
    }
    instance freescriptable();
    wait(1);
    cache setscriptablepartstate("body", default_to(cache.unlockstate, "closed_usable"));
    items = getscriptablelootcachecontents(cache);
    cache.containertype = 3;
    cache.contents = scripts/mp/gametypes/br_lootcache::function_ec87b214cd429e96(items, undefined);
    namespace_8361bad7391de074::function_f00aa0c3b58c13f2(cache, player);
    itemarray = function_b98c91e5697edb49(savedkeyname);
    foreach (index, item in itemarray) {
        itemtable = item.var_b99b2114134fe248;
        if (!isdefined(itemtable)) {
            continue;
        }
        ref = undefined;
        if (array_contains(level.br_plunder.names, item.var_dcb6e2b7467a12fc)) {
            lootid = namespace_38b993c4618e76cd::getlootidfromref("cash");
            var_7baf6f0eafe87a8 = 0;
            foreach (var_f90d0e006a1f717b, var_3466c10973e9c476 in level.br_plunder.names) {
                if (var_3466c10973e9c476 == item.var_dcb6e2b7467a12fc) {
                    var_7baf6f0eafe87a8 = var_f90d0e006a1f717b;
                    break;
                }
            }
            count = level.br_plunder.quantity[var_7baf6f0eafe87a8];
        } else if (issubstr(item.var_dcb6e2b7467a12fc, "brloot_weapon")) {
            lootid = level.br_pickups.var_7b2bff2d04ee1017[item.var_dcb6e2b7467a12fc];
            count = 1;
            ref = item.var_dcb6e2b7467a12fc;
        } else {
            lootid = namespace_38b993c4618e76cd::getlootidfromref(item.var_dcb6e2b7467a12fc);
            if (istrue(level.var_a9350d89a2e4d752)) {
                count = "";
                if (isdefined(level.br_pickups.counts[item.var_dcb6e2b7467a12fc])) {
                    count = level.br_pickups.counts[item.var_dcb6e2b7467a12fc];
                }
            } else {
                count = tablelookup(level.brloottablename, 1, item.var_dcb6e2b7467a12fc, 4);
                if (count == "") {
                    count = tablelookup(level.brloottablename, 5, lootid, 4);
                }
            }
        }
        cache.contents = scripts/mp/gametypes/br_lootcache::function_848e20cf1d6cab8f(cache.contents, count, lootid, ref, index);
    }
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9913
// Size: 0x4bd
function function_a9d72a6ee70123e5() {
    level.var_409396d5620deae8 = [];
    level.var_409396d5620deae8["fortress"] = "MP_DMZ_LOCKS/CACHE_LOCKED_FORTRESS";
    level.var_409396d5620deae8["generic_no_key"] = "MP_DMZ_LOCKS/CACHE_LOCKED_GENERIC_NO_KEY";
    flag_wait("scriptables_ready");
    if (scripts/cp_mp/utility/game_utility::function_7ee65fae13124702()) {
        level.var_409396d5620deae8["airport_lounge"] = "MP_DMZ_LOCKS/CACHE_LOCKED_AIRPORT_LOUNGE";
        level.var_409396d5620deae8["baggage_handling"] = "MP_DMZ_LOCKS/CACHE_LOCKED_BAGGAGE_HANDLING";
        level.var_409396d5620deae8["end_runway"] = "MP_DMZ_LOCKS/CACHE_LOCKED_END_RUNWAY";
        level.var_409396d5620deae8["caves_bench_container"] = "MP_DMZ_LOCKS/CACHE_LOCKED_CAVES_BENCH_CONTAINER";
        level.var_409396d5620deae8["powerstation_container"] = "MP_DMZ_LOCKS/CACHE_LOCKED_POWERSUBSTATION_CONTAINER";
        level.var_409396d5620deae8["gravesite_container"] = "MP_DMZ_LOCKS/CACHE_LOCKED_GRAVESITE_CONTAINER";
        level.var_409396d5620deae8["waterpit_container"] = "MP_DMZ_LOCKS/CACHE_LOCKED_WATERPIT_CONTAINER";
        level.var_409396d5620deae8["underwater_ship"] = "MP_DMZ_LOCKS/CACHE_LOCKED_UNDERWATER_SHIP";
        level.var_409396d5620deae8["clocktower_container"] = "MP_DMZ_LOCKS/CACHE_LOCKED_CLOCKTOWER_CONTAINER";
        level.var_409396d5620deae8["hydro_island_room"] = "MP_DMZ_LOCKS/CACHE_LOCKED_HYDRO_ISLAND_ROOM";
        level.var_409396d5620deae8["ship_bridge"] = "MP_DMZ_LOCKS/CACHE_LOCKED_SHIP_BRIDGE";
        level.var_409396d5620deae8["ship_center"] = "MP_DMZ_LOCKS/CACHE_LOCKED_SHIP_CENTER";
        level.var_409396d5620deae8["fishing_box_dock"] = "MP_DMZ_LOCKS/CACHE_LOCKED_FISHING_BOX_DOCK";
        level.var_409396d5620deae8["underthebridge"] = "MP_DMZ_LOCKS/CACHE_LOCKED_UNDERBRIDGE";
        level.var_409396d5620deae8["tower_hill"] = "MP_DMZ_LOCKS/CACHE_LOCKED_TOWER_HILL";
        level.var_409396d5620deae8["canal_uw_container"] = "MP_DMZ_LOCKS/CACHE_LOCKED_CANAL_UW_CONTAINER";
        level.var_409396d5620deae8["hallway_locker"] = "MP_DMZ_LOCKS/CACHE_LOCKED_HALLWAY_LOCKER";
        level.var_409396d5620deae8["control_room"] = "MP_DMZ_LOCKS/CACHE_LOCKED_CONTROL_ROOM";
        level.var_409396d5620deae8["ship_above_water"] = "MP_DMZ_LOCKS/CACHE_LOCKED_SHIP_ABOVE_WATER";
        level.var_409396d5620deae8["sunken_ship"] = "MP_DMZ_LOCKS/CACHE_LOCKED_SUNKEN_SHIP";
        level.var_409396d5620deae8["underground_passage"] = "MP_DMZ_LOCKS/CACHE_LOCKED_UNDERGROUND_PASSAGE";
        level.var_409396d5620deae8["police_locker"] = "MP_DMZ_LOCKS/CACHE_LOCKED_POLICE_LOCKER";
        level.var_409396d5620deae8["end_pyro_tunnel"] = "MP_DMZ_LOCKS/CACHE_LOCKED_END_PYRO_TUNNEL";
        level.var_409396d5620deae8["crash_wp_case"] = "MP_DMZ_LOCKS/CACHE_LOCKED_CRASH_WP_CASE";
        level.var_409396d5620deae8["crash_lrg_1"] = "MP_DMZ_LOCKS/CACHE_LOCKED_CRASH_LRG_1";
        level.var_409396d5620deae8["crash_lrg_2"] = "MP_DMZ_LOCKS/CACHE_LOCKED_CRASH_LRG_2";
        level.var_409396d5620deae8["crash_sm_1"] = "MP_DMZ_LOCKS/CACHE_LOCKED_CRASH_SM_1";
        level.var_409396d5620deae8["crash_sm_2"] = "MP_DMZ_LOCKS/CACHE_LOCKED_CRASH_SM_2";
        level.var_409396d5620deae8["crash_sm_3"] = "MP_DMZ_LOCKS/CACHE_LOCKED_CRASH_SM_3";
        level.var_409396d5620deae8["crash_briefcase_1"] = "MP_DMZ_LOCKS/CACHE_LOCKED_CRASH_BRIEFCASE_1";
        level.var_409396d5620deae8["dc_toolbox_1"] = "MP_DMZ_LOCKS/CACHE_LOCKED_DC_TOOLBOX_1";
        level.var_409396d5620deae8["dc_briefcase_1"] = "MP_DMZ_LOCKS/CACHE_LOCKED_DC_BRIEFCASE_1";
        return;
    }
    if (scripts/cp_mp/utility/game_utility::function_e21746abaaaf8414()) {
        level.var_409396d5620deae8["sealion_castle_armory"] = "MP_DMZ_LOCKS/CACHE_LOCKED_SEALION_CASTLE_ARMORY";
        level.var_409396d5620deae8["sealion_couple_fight_bag"] = "MP_DMZ_LOCKS/CACHE_LOCKED_SEALION_COUPLE_BAG";
        level.var_409396d5620deae8["sealion_farmers_toolbox"] = "MP_DMZ_LOCKS/CACHE_LOCKED_SEALION_FARMERS_TOOLBOX";
        level.var_409396d5620deae8["sealion_hotel_workers_office_fridge"] = "MP_DMZ_LOCKS/CACHE_LOCKED_SEALION_OFFICE_FRIDGE";
        level.var_409396d5620deae8["sealion_knocked_over_workers_toolbox"] = "MP_DMZ_LOCKS/CACHE_LOCKED_SEALION_WORKER_TOOLBOX";
        level.var_409396d5620deae8["sealion_lost_travelers_bag"] = "MP_DMZ_LOCKS/CACHE_LOCKED_SEALION_TRAVELERS_BAG";
        level.var_409396d5620deae8["sealion_misplaced_crate"] = "MP_DMZ_LOCKS/CACHE_LOCKED_SEALION_MISPLACED_CRATE";
        level.var_409396d5620deae8["sealion_observatory_thrown_fridge"] = "MP_DMZ_LOCKS/CACHE_LOCKED_SEALION_OBSERVATORY_FRIDGE";
        level.var_409396d5620deae8["sealion_shadow_company_toolbox"] = "MP_DMZ_LOCKS/CACHE_LOCKED_SEALION_SHADOW_TOOLBOX";
        level.var_409396d5620deae8["sealion_shipwreck_cargo_crate"] = "MP_DMZ_LOCKS/CACHE_LOCKED_SEALION_SHIPWRECK_CRATE";
        level.var_409396d5620deae8["sealion_town_canal_crate"] = "MP_DMZ_LOCKS/CACHE_LOCKED_SEALION_CANAL_CRATE";
        return;
    }
    if (scripts/cp_mp/utility/game_utility::function_5e0e3a24dbb1fae1()) {
        level.var_409396d5620deae8["de_city_hall"] = "MP_DMZ_LOCKS/CACHE_LOCKED_DELTA_CITYHALL";
        level.var_409396d5620deae8["de_museum_02"] = "MP_DMZ_LOCKS/CACHE_LOCKED_DELTA_NEWMUSEUM";
        level.var_409396d5620deae8["de_museum_01"] = "MP_DMZ_LOCKS/CACHE_LOCKED_DELTA_OLDMUSEUM";
        level.var_409396d5620deae8["de_tunnel_01"] = "MP_DMZ_LOCKS/CACHE_LOCKED_DELTA_SEWERS";
        level.var_409396d5620deae8["de_shopping_mall"] = "MP_DMZ_LOCKS/CACHE_LOCKED_DELTA_SHOPPINGMALL";
        level.var_409396d5620deae8["de_hangar_01"] = "MP_DMZ_LOCKS/CACHE_LOCKED_DELTA_STABLES";
        level.var_409396d5620deae8["de_homeboat_01"] = "MP_DMZ_LOCKS/CACHE_LOCKED_DELTA_SUNKENHOUSE";
        level.var_409396d5620deae8["de_under_bridge"] = "MP_DMZ_LOCKS/CACHE_LOCKED_DELTA_UNDERBRIDGE";
        level.var_409396d5620deae8["de_stage_01"] = "MP_DMZ_LOCKS/CACHE_LOCKED_DELTA_UNIVERSITY";
        level.var_409396d5620deae8["de_windmill"] = "MP_DMZ_LOCKS/CACHE_LOCKED_DELTA_WINDMILL";
    }
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9dd7
// Size: 0x39
function function_bd958525be466cd7(keyname) {
    errorstring = level.var_409396d5620deae8[keyname];
    if (!isdefined(errorstring)) {
        errorstring = level.var_409396d5620deae8["fortress"];
    }
    return errorstring;
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e18
// Size: 0x231
function function_b98c91e5697edb49(var_49710df804bea4d0) {
    itemarray = [];
    if (isdefined(level.var_3da7559f232a2ca9[var_49710df804bea4d0])) {
        foreach (potentialitem in level.var_3da7559f232a2ca9[var_49710df804bea4d0]) {
            tokens = strtok(potentialitem.var_dcb6e2b7467a12fc, "_");
            if (tokens[0] == "tier1Key") {
                potentialitem.var_dcb6e2b7467a12fc = function_23326c8ac97c60c7(1, 0, 0, 0, 1, 0, 0, 0, 20, 60, 20, tokens[1]);
                itemarray[itemarray.size] = potentialitem;
                continue;
            }
            if (tokens[0] == "tier2Key") {
                potentialitem.var_dcb6e2b7467a12fc = function_23326c8ac97c60c7(0, 1, 0, 0, 0, 1, 0, 0, 20, 60, 20, tokens[1]);
                itemarray[itemarray.size] = potentialitem;
                continue;
            }
            if (tokens[0] == "tier3Key") {
                potentialitem.var_dcb6e2b7467a12fc = function_23326c8ac97c60c7(0, 0, 1, 0, 0, 0, 1, 0, 20, 60, 20, tokens[1]);
                itemarray[itemarray.size] = potentialitem;
                continue;
            }
            if (tokens[0] == "heroKey") {
                potentialitem.var_dcb6e2b7467a12fc = function_23326c8ac97c60c7(0, 0, 0, 1, 0, 0, 0, 1, 20, 60, 20, tokens[1]);
                itemarray[itemarray.size] = potentialitem;
                continue;
            }
            if (tokens[0] == "weaponPistol") {
                potentialitem.var_dcb6e2b7467a12fc = function_3c30cd923087306b("pistol");
                itemarray[itemarray.size] = potentialitem;
                continue;
            }
            if (tokens[0] == "weaponRare") {
                potentialitem.var_dcb6e2b7467a12fc = function_3c30cd923087306b("rare");
                itemarray[itemarray.size] = potentialitem;
                continue;
            }
            if (tokens[0] == "weaponEpic") {
                potentialitem.var_dcb6e2b7467a12fc = function_3c30cd923087306b("epic");
                itemarray[itemarray.size] = potentialitem;
                continue;
            }
            roll = randomint(100);
            if (roll < potentialitem.dropchance) {
                itemarray[itemarray.size] = potentialitem;
            }
        }
    }
    return itemarray;
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa051
// Size: 0xb3d
function function_b35796a7c0a71079() {
    level.var_eabf33bc40a9a363 = [];
    level.keysskeleton = ["loot_key_skeleton", "loot_key_skeleton_used", "loot_key_skeleton_worn"];
    level.var_f2e2b5ed406a7d94 = [];
    level.var_f2e2b5ed406a7d94[1] = [];
    level.var_f2e2b5ed406a7d94[2] = [];
    level.var_f2e2b5ed406a7d94[3] = [];
    level.var_f2e2b5ed406a7d94[4] = [];
    level.var_f2e2b5ed406a7d94["1_sabacrash"] = [];
    level.var_f2e2b5ed406a7d94["2_sabacrash"] = [];
    level.var_f2e2b5ed406a7d94["3_sabacrash"] = [];
    level.var_f2e2b5ed406a7d94["4_sabacrash"] = [];
    level.var_f2e2b5ed406a7d94["1_b21"] = [];
    level.var_f2e2b5ed406a7d94["1_sealion"] = [];
    level.var_f2e2b5ed406a7d94["2_sealion"] = [];
    level.var_f2e2b5ed406a7d94["3_sealion"] = [];
    level.var_f2e2b5ed406a7d94["4_sealion"] = [];
    level.var_f2e2b5ed406a7d94["1_delta"] = [];
    level.var_f2e2b5ed406a7d94["2_delta"] = [];
    level.var_f2e2b5ed406a7d94["3_delta"] = [];
    level.var_f2e2b5ed406a7d94["4_delta"] = [];
    function_b96ca3c98ca2fb0a(1, "hydro_storage", 1);
    function_b96ca3c98ca2fb0a(1, "airport_lounge", 1);
    function_b96ca3c98ca2fb0a(1, "baggage_handling", 1);
    function_b96ca3c98ca2fb0a(1, "caves_bench_container", 1);
    function_b96ca3c98ca2fb0a(1, "undershack", 1);
    function_b96ca3c98ca2fb0a(1, "gravehouse", 1);
    function_b96ca3c98ca2fb0a(1, "powerstation_container", 1);
    function_b96ca3c98ca2fb0a(1, "gravesite_container", 1);
    function_b96ca3c98ca2fb0a(1, "mobile_office", 1);
    function_b96ca3c98ca2fb0a(1, "groundskeepers", 1);
    function_b96ca3c98ca2fb0a(1, "clocktower_container", 1);
    function_b96ca3c98ca2fb0a(1, "hydro_island_room", 1);
    function_b96ca3c98ca2fb0a(1, "fishing_box_dock", 1);
    function_b96ca3c98ca2fb0a(1, "supply_rooms", 1);
    function_b96ca3c98ca2fb0a(1, "power_substation", 1);
    function_b96ca3c98ca2fb0a(1, "cell_phone_shop", 1);
    function_b96ca3c98ca2fb0a(1, "underthebridge", 1);
    function_b96ca3c98ca2fb0a(1, "police_academy_barracks", 1);
    function_b96ca3c98ca2fb0a(1, "tv_station", 1);
    function_b96ca3c98ca2fb0a(1, "shopping_booth", 1);
    function_b96ca3c98ca2fb0a(1, "yumyum_burger", 1);
    function_b96ca3c98ca2fb0a(1, "tower_hill", 1);
    function_b96ca3c98ca2fb0a(1, "canal_uw_container", 1);
    function_b96ca3c98ca2fb0a(1, "small_confer_room", 1);
    function_b96ca3c98ca2fb0a(1, "hallway_locker", 1);
    function_b96ca3c98ca2fb0a(1, "north_guard_shack", 1);
    function_b96ca3c98ca2fb0a(1, "south_guard_shack", 1);
    function_b96ca3c98ca2fb0a(1, "fortbarrack1", 1);
    function_b96ca3c98ca2fb0a(1, "office_quarters1", 1);
    function_b96ca3c98ca2fb0a(1, "sunken_2nd_office", 1);
    function_b96ca3c98ca2fb0a(1, "sira_apartment", 1);
    function_b96ca3c98ca2fb0a(1, "gaming_room", 1);
    function_b96ca3c98ca2fb0a(1, "fishing_shack", 1);
    function_b96ca3c98ca2fb0a(1, "spotters_view", 1);
    function_b96ca3c98ca2fb0a(1, "grocery_office", 1);
    function_b96ca3c98ca2fb0a(1, "neigh_storage_room", 1);
    function_b96ca3c98ca2fb0a(1, "crane_building", 1);
    function_b96ca3c98ca2fb0a(1, "underwater_ship", 1);
    function_b96ca3c98ca2fb0a(2, "hydro_apt");
    function_b96ca3c98ca2fb0a(2, "conference_room");
    function_b96ca3c98ca2fb0a(2, "end_runway", 1);
    function_b96ca3c98ca2fb0a(2, "cliffroom");
    function_b96ca3c98ca2fb0a(2, "poppyhome");
    function_b96ca3c98ca2fb0a(2, "waterpit_container", 1);
    function_b96ca3c98ca2fb0a(2, "lighthouse_room");
    function_b96ca3c98ca2fb0a(2, "ship_bridge", 1);
    function_b96ca3c98ca2fb0a(2, "ship_center", 1);
    function_b96ca3c98ca2fb0a(2, "policestation", 1);
    function_b96ca3c98ca2fb0a(2, "smugglers_warehouse");
    function_b96ca3c98ca2fb0a(2, "interrogation_room");
    function_b96ca3c98ca2fb0a(2, "police_lockerroom");
    function_b96ca3c98ca2fb0a(2, "apartment_closet");
    function_b96ca3c98ca2fb0a(2, "tv_computer_room");
    function_b96ca3c98ca2fb0a(2, "destroyed_telescope");
    function_b96ca3c98ca2fb0a(2, "scientist_apartment");
    function_b96ca3c98ca2fb0a(2, "control_room");
    function_b96ca3c98ca2fb0a(2, "end_pyro_tunnel");
    function_b96ca3c98ca2fb0a(2, "munitions_storage", 1);
    function_b96ca3c98ca2fb0a(2, "car_shop");
    function_b96ca3c98ca2fb0a(2, "sunken_top_office");
    function_b96ca3c98ca2fb0a(2, "hotel_room1");
    function_b96ca3c98ca2fb0a(2, "ship_above_water");
    function_b96ca3c98ca2fb0a(2, "dressing_room");
    function_b96ca3c98ca2fb0a(2, "apartment_snipernest");
    function_b96ca3c98ca2fb0a(2, "underground_passage");
    function_b96ca3c98ca2fb0a(3, "maintenance");
    function_b96ca3c98ca2fb0a(3, "safe_house");
    function_b96ca3c98ca2fb0a(3, "western_storage");
    function_b96ca3c98ca2fb0a(3, "secret_comms", 1);
    function_b96ca3c98ca2fb0a(3, "post_office");
    function_b96ca3c98ca2fb0a(3, "antiquities_office", 1);
    function_b96ca3c98ca2fb0a(3, "quiet_bedroom");
    function_b96ca3c98ca2fb0a(3, "server_room");
    function_b96ca3c98ca2fb0a(3, "hotel_room2", 1);
    function_b96ca3c98ca2fb0a(3, "sunken_ship");
    function_b96ca3c98ca2fb0a(3, "sec_camera_room");
    function_b96ca3c98ca2fb0a(3, "mountain_top");
    function_b96ca3c98ca2fb0a(4, "civic_center", 1);
    function_b96ca3c98ca2fb0a(4, "embassy", 1);
    function_b96ca3c98ca2fb0a(4, "fort", 1);
    function_b96ca3c98ca2fb0a(4, "sira_mall", 1);
    function_b96ca3c98ca2fb0a(4, "resort_entrance", 1);
    function_b96ca3c98ca2fb0a(4, "police_academy", 1);
    function_b96ca3c98ca2fb0a(4, "post_office_stronghold", 1);
    function_b96ca3c98ca2fb0a(4, "control_tower", 1);
    function_b96ca3c98ca2fb0a(4, "exhume_warehouse", 1);
    function_b96ca3c98ca2fb0a("1_sabacrash", "crash_sm_1");
    function_b96ca3c98ca2fb0a("1_sabacrash", "crash_wp_case");
    function_b96ca3c98ca2fb0a("1_sabacrash", "sealion_port_managers_office");
    function_b96ca3c98ca2fb0a("1_sabacrash", "sealion_castle_armory");
    function_b96ca3c98ca2fb0a("2_sabacrash", "crash_sm_2");
    function_b96ca3c98ca2fb0a("2_sabacrash", "crash_wp_case");
    function_b96ca3c98ca2fb0a("2_sabacrash", "sealion_ferry_tourist_information_booth");
    function_b96ca3c98ca2fb0a("2_sabacrash", "sealion_misplaced_crate");
    function_b96ca3c98ca2fb0a("3_sabacrash", "crash_sm_3");
    function_b96ca3c98ca2fb0a("3_sabacrash", "crash_wp_case");
    function_b96ca3c98ca2fb0a("3_sabacrash", "sealion_water_treatment_control_center");
    function_b96ca3c98ca2fb0a("3_sabacrash", "sealion_port_harbor_control");
    function_b96ca3c98ca2fb0a("4_sabacrash", "crash_lrg_1");
    function_b96ca3c98ca2fb0a("4_sabacrash", "crash_lrg_2");
    function_b96ca3c98ca2fb0a("4_sabacrash", "crash_briefcase_1");
    function_b96ca3c98ca2fb0a("1_b21", "red_door", 1);
    function_b96ca3c98ca2fb0a("1_b21", "blue_door", 1);
    function_b96ca3c98ca2fb0a("1_b21", "green_door", 1);
    function_b96ca3c98ca2fb0a("1_b21", "black_door", 1);
    function_b96ca3c98ca2fb0a("1_sealion", "sealion_shadow_company_toolbox", 1);
    function_b96ca3c98ca2fb0a("1_sealion", "sealion_castle_armory", 1);
    function_b96ca3c98ca2fb0a("1_sealion", "sealion_beach_club_bathroom", 1);
    function_b96ca3c98ca2fb0a("1_sealion", "sealion_hotel_room_403", 1);
    function_b96ca3c98ca2fb0a("1_sealion", "sealion_hotel_workers_office_fridge", 1);
    function_b96ca3c98ca2fb0a("1_sealion", "sealion_port_managers_office", 1);
    function_b96ca3c98ca2fb0a("1_sealion", "sealion_shipwreck_cargo_crate", 1);
    function_b96ca3c98ca2fb0a("1_sealion", "sealion_farmers_toolbox", 1);
    function_b96ca3c98ca2fb0a("1_sealion", "sealion_couple_fight_bag", 1);
    function_b96ca3c98ca2fb0a("2_sealion", "sealion_misplaced_crate", 1);
    function_b96ca3c98ca2fb0a("2_sealion", "sealion_knocked_over_workers_toolbox", 1);
    function_b96ca3c98ca2fb0a("2_sealion", "sealion_observatory_thrown_fridge");
    function_b96ca3c98ca2fb0a("2_sealion", "sealion_lab_office", 1);
    function_b96ca3c98ca2fb0a("2_sealion", "sealion_town_canal_crate", 1);
    function_b96ca3c98ca2fb0a("2_sealion", "sealion_ferry_tourist_information_booth", 1);
    function_b96ca3c98ca2fb0a("2_sealion", "sealion_lost_travelers_bag");
    function_b96ca3c98ca2fb0a("3_sealion", "sealion_water_treatment_control_center", 1);
    function_b96ca3c98ca2fb0a("3_sealion", "sealion_port_harbor_control");
    function_b96ca3c98ca2fb0a("3_sealion", "sealion_castle", 1);
    function_b96ca3c98ca2fb0a("3_sealion", "sealion_cityhall", 1);
    function_b96ca3c98ca2fb0a("4_sealion", "sealion_castle", 1);
    function_b96ca3c98ca2fb0a("4_sealion", "sealion_cityhall", 1);
    function_b96ca3c98ca2fb0a("1_delta", "de_city_hall", 1);
    function_b96ca3c98ca2fb0a("1_delta", "de_museum_02", 1);
    function_b96ca3c98ca2fb0a("1_delta", "de_museum_01", 1);
    function_b96ca3c98ca2fb0a("1_delta", "de_tunnel_01");
    function_b96ca3c98ca2fb0a("1_delta", "de_shopping_mall");
    function_b96ca3c98ca2fb0a("1_delta", "de_hangar_01");
    function_b96ca3c98ca2fb0a("1_delta", "de_homeboat_01");
    function_b96ca3c98ca2fb0a("1_delta", "de_under_bridge");
    function_b96ca3c98ca2fb0a("1_delta", "de_stage_01", 1);
    function_b96ca3c98ca2fb0a("1_delta", "de_windmill", 1);
    function_b96ca3c98ca2fb0a("2_delta", "de_animal_care", 1);
    function_b96ca3c98ca2fb0a("2_delta", "de_shops_02", 1);
    function_b96ca3c98ca2fb0a("2_delta", "de_bike_parking_02", 1);
    function_b96ca3c98ca2fb0a("2_delta", "de_firestation_01", 1);
    function_b96ca3c98ca2fb0a("2_delta", "de_waterhome_04");
    function_b96ca3c98ca2fb0a("2_delta", "de_homeboat_08");
    function_b96ca3c98ca2fb0a("2_delta", "de_stadium", 1);
    function_b96ca3c98ca2fb0a("2_delta", "de_cruise_terminal", 1);
    function_b96ca3c98ca2fb0a("2_delta", "de_block_01");
    function_b96ca3c98ca2fb0a("3_delta", "delta_oldmuseum", 1);
    function_b96ca3c98ca2fb0a("3_delta", "delta_stadium", 1);
    function_b96ca3c98ca2fb0a("3_delta", "delta_trainstation", 1);
    function_b96ca3c98ca2fb0a("4_delta", "delta_aquarium", 1);
    function_b96ca3c98ca2fb0a("4_delta", "delta_cityhall", 1);
    function_b96ca3c98ca2fb0a("4_delta", "delta_firestation", 1);
    function_b96ca3c98ca2fb0a("4_delta", "delta_terminal", 1);
    /#
    #/
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab95
// Size: 0x71
function function_b96ca3c98ca2fb0a(category, keyname, var_4baad979fef17bc0) {
    level.var_f2e2b5ed406a7d94[category][level.var_f2e2b5ed406a7d94[category].size] = keyname;
    if (istrue(var_4baad979fef17bc0)) {
        if (!isdefined(level.var_eabf33bc40a9a363[category])) {
            level.var_eabf33bc40a9a363[category] = [];
        }
        level.var_eabf33bc40a9a363[category][level.var_eabf33bc40a9a363[category].size] = keyname;
    }
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac0d
// Size: 0xd4
function function_f4c3a9c8da53fbc9(categories, categoryweights, pristinechance, usedchance, wornchance) {
    var_9b43447dbbdf246b = random_weighted(categories, categoryweights);
    if (!isdefined(var_9b43447dbbdf246b) || !isdefined(level.var_eabf33bc40a9a363[var_9b43447dbbdf246b]) || level.var_eabf33bc40a9a363[var_9b43447dbbdf246b].size == 0) {
        return undefined;
    }
    key = random(level.var_eabf33bc40a9a363[var_9b43447dbbdf246b]);
    durabilitysuffix = random_weighted(["", "_used", "_worn"], [pristinechance, usedchance, wornchance]);
    if (!isdefined(durabilitysuffix)) {
        return undefined;
    }
    return "loot_key_" + key + durabilitysuffix;
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 12, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xace9
// Size: 0x2f1
function function_23326c8ac97c60c7(tier1ok, tier2ok, tier3ok, herook, tier1chance, tier2chance, tier3chance, herochance, pristinechance, usedchance, wornchance, mapnameoverride) {
    possibletiers = [];
    totaltickets = 0;
    if (istrue(tier1ok)) {
        if (isdefined(tier1chance)) {
            totaltickets = totaltickets + tier1chance;
            possibletiers[1] = tier1chance;
        } else {
            totaltickets = totaltickets + 1;
            possibletiers[1] = 1;
        }
    }
    if (istrue(tier2ok)) {
        if (isdefined(tier2chance)) {
            totaltickets = totaltickets + tier2chance;
            possibletiers[2] = tier2chance;
        } else {
            totaltickets = totaltickets + 1;
            possibletiers[2] = 1;
        }
    }
    if (istrue(tier3ok)) {
        if (isdefined(tier2chance)) {
            totaltickets = totaltickets + tier3chance;
            possibletiers[3] = tier3chance;
        } else {
            totaltickets = totaltickets + 1;
            possibletiers[3] = 1;
        }
    }
    if (istrue(herook)) {
        if (isdefined(herochance)) {
            totaltickets = totaltickets + herochance;
            possibletiers[4] = herochance;
        } else {
            totaltickets = totaltickets + 1;
            possibletiers[4] = 1;
        }
    }
    roll = randomint(totaltickets);
    chancetotal = 0;
    var_390ae2320a151006 = undefined;
    foreach (tier, tierchance in possibletiers) {
        chancetotal = chancetotal + tierchance;
        if (roll < chancetotal) {
            var_390ae2320a151006 = tier;
            break;
        }
    }
    var_bf3d63e39c071fab = [];
    var_d73cb1f45b5418a1 = 0;
    if (isdefined(pristinechance)) {
        var_d73cb1f45b5418a1 = var_d73cb1f45b5418a1 + pristinechance;
        var_bf3d63e39c071fab[""] = pristinechance;
    }
    if (isdefined(usedchance)) {
        var_d73cb1f45b5418a1 = var_d73cb1f45b5418a1 + usedchance;
        var_bf3d63e39c071fab["_used"] = usedchance;
    }
    if (isdefined(wornchance)) {
        var_d73cb1f45b5418a1 = var_d73cb1f45b5418a1 + wornchance;
        var_bf3d63e39c071fab["_worn"] = wornchance;
    }
    if (var_bf3d63e39c071fab.size == 0) {
        var_f97b516eeab99cbb = random(["", "_worn", "_used"]);
    } else {
        roll = randomint(var_d73cb1f45b5418a1);
        chancetotal = 0;
        var_f97b516eeab99cbb = undefined;
        foreach (quality, var_d4846ec86821410a in var_bf3d63e39c071fab) {
            chancetotal = chancetotal + var_d4846ec86821410a;
            if (roll < chancetotal) {
                var_f97b516eeab99cbb = quality;
                break;
            }
        }
    }
    if (isdefined(mapnameoverride)) {
        var_390ae2320a151006 = var_390ae2320a151006 + "_" + mapnameoverride;
    }
    keyname = random(level.var_f2e2b5ed406a7d94[var_390ae2320a151006]);
    lootkeyname = "loot_key_" + keyname + var_f97b516eeab99cbb;
    return lootkeyname;
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xafe2
// Size: 0x7b7
function function_e726302a1f8d9a1a() {
    level.lockedCache = spawnstruct();
    level.lockedCache.var_e0fffa1af7503400 = [];
    level.lockedCache.var_e0fffa1af7503400["rare"] = [];
    level.lockedCache.var_e0fffa1af7503400["epic"] = [];
    level.lockedCache.var_e0fffa1af7503400["pistol"] = [];
    level.lockedCache.var_e0fffa1af7503400["rare"][level.lockedCache.var_e0fffa1af7503400["rare"].size] = "brloot_weapon_br_msecho_epic";
    level.lockedCache.var_e0fffa1af7503400["rare"][level.lockedCache.var_e0fffa1af7503400["rare"].size] = "brloot_weapon_la_rpapa7_epic";
    level.lockedCache.var_e0fffa1af7503400["rare"][level.lockedCache.var_e0fffa1af7503400["rare"].size] = "brloot_weapon_dm_pgolf1_epic";
    level.lockedCache.var_e0fffa1af7503400["rare"][level.lockedCache.var_e0fffa1af7503400["rare"].size] = "brloot_weapon_dm_la700_epic";
    level.lockedCache.var_e0fffa1af7503400["rare"][level.lockedCache.var_e0fffa1af7503400["rare"].size] = "brloot_weapon_br_soscar14_epic";
    level.lockedCache.var_e0fffa1af7503400["rare"][level.lockedCache.var_e0fffa1af7503400["rare"].size] = "brloot_weapon_sh_charlie725_epic";
    level.lockedCache.var_e0fffa1af7503400["rare"][level.lockedCache.var_e0fffa1af7503400["rare"].size] = "brloot_weapon_sh_mviktor_epic";
    level.lockedCache.var_e0fffa1af7503400["rare"][level.lockedCache.var_e0fffa1af7503400["rare"].size] = "brloot_weapon_lm_ahotel_epic";
    level.lockedCache.var_e0fffa1af7503400["rare"][level.lockedCache.var_e0fffa1af7503400["rare"].size] = "brloot_weapon_lm_kilo21_epic";
    level.lockedCache.var_e0fffa1af7503400["rare"][level.lockedCache.var_e0fffa1af7503400["rare"].size] = "brloot_weapon_ar_mike4_epic";
    level.lockedCache.var_e0fffa1af7503400["rare"][level.lockedCache.var_e0fffa1af7503400["rare"].size] = "brloot_weapon_ar_kilo53_epic";
    level.lockedCache.var_e0fffa1af7503400["rare"][level.lockedCache.var_e0fffa1af7503400["rare"].size] = "brloot_weapon_sm_papa90_epic";
    level.lockedCache.var_e0fffa1af7503400["rare"][level.lockedCache.var_e0fffa1af7503400["rare"].size] = "brloot_weapon_sm_alpha57_epic";
    level.lockedCache.var_e0fffa1af7503400["epic"][level.lockedCache.var_e0fffa1af7503400["epic"].size] = "brloot_weapon_ar_golf3_lege";
    level.lockedCache.var_e0fffa1af7503400["epic"][level.lockedCache.var_e0fffa1af7503400["epic"].size] = "brloot_weapon_br_msecho_lege";
    level.lockedCache.var_e0fffa1af7503400["epic"][level.lockedCache.var_e0fffa1af7503400["epic"].size] = "brloot_weapon_dm_mike14_lege";
    level.lockedCache.var_e0fffa1af7503400["epic"][level.lockedCache.var_e0fffa1af7503400["epic"].size] = "brloot_weapon_dm_sa700_lege";
    level.lockedCache.var_e0fffa1af7503400["epic"][level.lockedCache.var_e0fffa1af7503400["epic"].size] = "brloot_weapon_dm_scromeo_lege";
    level.lockedCache.var_e0fffa1af7503400["epic"][level.lockedCache.var_e0fffa1af7503400["epic"].size] = "brloot_weapon_sh_mbravo_lege";
    level.lockedCache.var_e0fffa1af7503400["epic"][level.lockedCache.var_e0fffa1af7503400["epic"].size] = "brloot_weapon_lm_foxtrot_lege";
    level.lockedCache.var_e0fffa1af7503400["epic"][level.lockedCache.var_e0fffa1af7503400["epic"].size] = "brloot_weapon_lm_rkilo_lege";
    level.lockedCache.var_e0fffa1af7503400["epic"][level.lockedCache.var_e0fffa1af7503400["epic"].size] = "brloot_weapon_ar_kilo53_lege";
    level.lockedCache.var_e0fffa1af7503400["epic"][level.lockedCache.var_e0fffa1af7503400["epic"].size] = "brloot_weapon_ar_augolf_epic";
    level.lockedCache.var_e0fffa1af7503400["epic"][level.lockedCache.var_e0fffa1af7503400["epic"].size] = "brloot_weapon_ar_akilo_lege";
    level.lockedCache.var_e0fffa1af7503400["epic"][level.lockedCache.var_e0fffa1af7503400["epic"].size] = "brloot_weapon_sm_victor_lege";
    level.lockedCache.var_e0fffa1af7503400["epic"][level.lockedCache.var_e0fffa1af7503400["epic"].size] = "brloot_weapon_br_soscar14_lege";
    level.lockedCache.var_e0fffa1af7503400["epic"][level.lockedCache.var_e0fffa1af7503400["epic"].size] = "brloot_weapon_sm_alpha57_lege";
    level.lockedCache.var_e0fffa1af7503400["epic"][level.lockedCache.var_e0fffa1af7503400["epic"].size] = "brloot_weapon_la_juliet_epic";
    level.lockedCache.var_e0fffa1af7503400["pistol"][level.lockedCache.var_e0fffa1af7503400["pistol"].size] = "brloot_weapon_pi_decho_lege";
    level.lockedCache.var_e0fffa1af7503400["pistol"][level.lockedCache.var_e0fffa1af7503400["pistol"].size] = "brloot_weapon_pi_golf17_epic";
    level.lockedCache.var_e0fffa1af7503400["pistol"][level.lockedCache.var_e0fffa1af7503400["pistol"].size] = "brloot_weapon_pi_golf18_lege";
    level.lockedCache.var_e0fffa1af7503400["pistol"][level.lockedCache.var_e0fffa1af7503400["pistol"].size] = "brloot_weapon_pi_swhiskey_lege";
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb7a0
// Size: 0x41
function function_3c30cd923087306b(category) {
    if (!isdefined(level.lockedCache.var_e0fffa1af7503400[category])) {
        return;
    }
    return random(level.lockedCache.var_e0fffa1af7503400[category]);
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb7e9
// Size: 0x20f
function function_a60e40071d04db92(player, keyused) {
    if (!isdefined(keyused)) {
        logprint("'keyUsed' is undefined. Parameter [1], 'keyUsed'");
    }
    if (!isdefined(player)) {
        logprint("'player' is undefined. Parameter [0], 'player'");
        return;
    }
    if (!isplayer(player)) {
        logprint("'player' object passed in is not a Player . Parameter [0], 'player'");
        return;
    }
    keytype = default_to(keyused, #"undefined");
    if (isdefined(player) && isplayer(player)) {
        playerpositionx = player.origin[0];
        playerpositiony = player.origin[1];
        playerpositionz = player.origin[2];
        playerrotationpitch = player.angles[0];
        playerrotationyaw = player.angles[1];
        playerrotationroll = player.angles[2];
        matchtime = default_to(namespace_de6e6777b0937bd7::function_1b15450e092933cf(gettime()), 0);
        lpconlevel = namespace_500325c20d920621::function_c43f9411e4146fbd();
        teamid = default_to(namespace_e77194a0203f683::function_260df5ddbfebac5f(player), #"undefined");
        player dlog_recordplayerevent("dlog_event_dmz_keycard_used", ["key_type", function_1823ff50bb28148d(keytype), "player_position_x", playerpositionx, "player_position_y", playerpositiony, "player_position_z", playerpositionz, "player_rotation_pitch", playerrotationpitch, "player_rotation_yaw", playerrotationyaw, "player_rotation_roll", playerrotationroll, "lpcon_level", function_1823ff50bb28148d(lpconlevel), "team_id", function_1823ff50bb28148d(teamid), "match_time_elapsed", matchtime]);
    }
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb9ff
// Size: 0x37
function function_ffc077d5175e066a() {
    /#
        while (true) {
            randomkey = function_23326c8ac97c60c7(1, 0, 0, 0, 1, 0, 0, 0, 10, 70, 20);
            println(randomkey);
            waitframe();
        }
    #/
}

// Namespace locksandkeys / namespace_58dcf42cf567f34f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xba3d
// Size: 0x322
function function_af458cfdaf8d86e4() {
    /#
        while (true) {
            if (getdvarint(@"hash_add2748481956623", 0) == 1) {
                lootitems = getentitylessscriptablearray();
                var_e98075a1f0dfce41 = [];
                var_e75ae897f63866b7 = [];
                cachelocs = [];
                foreach (item in lootitems) {
                    switch (item.type) {
                    case #"hash_8709a7ef11ecdbea":
                        var_e98075a1f0dfce41[var_e98075a1f0dfce41.size] = item.origin;
                        continue;
                    case #"hash_183cb58bad34bd86":
                    case #"hash_19ba8d41970911ad":
                    case #"hash_33a1ab3969e0b64e":
                    case #"hash_417c605750c7baa5":
                    case #"hash_b1814c3921b5bcf2":
                    case #"hash_b5b4216883bf84b8":
                        cachelocs[cachelocs.size] = item;
                        continue;
                    }
                    if (isdefined(item.type) && (issubstr(item.type, "delta_trainstation") || issubstr(item.type, "MP_DMZ_LOCKS/CACHE_LOCKED_DELTA_FLOATINGHOUSE"))) {
                        var_e75ae897f63866b7[var_e75ae897f63866b7.size] = item.origin;
                    }
                }
                foreach (cache in cachelocs) {
                    cacheitems = getscriptablelootcachecontents(cache);
                    foreach (item in cacheitems) {
                        if (item == "loot_key_skeleton_used") {
                            var_e98075a1f0dfce41[var_e98075a1f0dfce41.size] = cache.origin;
                            continue;
                        }
                        if (issubstr(item, "delta_trainstation") || issubstr(item, "MP_DMZ_LOCKS/CACHE_LOCKED_DELTA_FLOATINGHOUSE")) {
                            var_e75ae897f63866b7[var_e75ae897f63866b7.size] = cache.origin;
                        }
                    }
                }
                color = (0, 1, 0);
                foreach (loc in var_e98075a1f0dfce41) {
                    thread scripts/mp/utility/debug::drawsphere(loc, 32, 1, color);
                }
                color = (0, 0, 1);
                foreach (loc in var_e75ae897f63866b7) {
                    thread scripts/mp/utility/debug::drawsphere(loc, 32, 1, color);
                }
            }
            wait(1);
        }
    #/
}

