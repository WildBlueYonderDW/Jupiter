// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\challenges.gsc;
#using script_4c770a9a4ad7659c;
#using script_76cc264b397db9cb;
#using scripts\mp\utility\lui_game_event_aggregator.gsc;
#using scripts\common\ui.gsc;
#using script_2342b8aad723994e;
#using scripts\mp\gametypes\br_pickups.gsc;
#using script_600b944a95c3a7bf;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_2d9d24f7c63ac143;
#using scripts\mp\equipment.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\weapon.gsc;
#using script_b7a9ce0a2282b79;
#using script_1f97a44d1761c919;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_48614492ef09b23;
#using script_2669878cf5a1b6bc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\points.gsc;
#using script_6a8ec730b2bfa844;
#using script_2391409ef7b431e1;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using script_2cc6455920627806;
#using scripts\mp\weapons.gsc;
#using script_6fc415ff6a905dc1;
#using script_3aacf02225ca0da5;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_4948cdf739393d2d;
#using script_1174abedbefe9ada;
#using script_48814951e916af89;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using script_5def7af2a9f04234;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using script_479e458f6f530f0d;
#using script_57d3850a12cf1d8f;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using script_6c4e8cea70bf4b6d;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\utility\inventory.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\juggernaut.gsc;
#using scripts\mp\equipment\c4.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using script_c00335a7aeb2728;
#using scripts\engine\scriptable.gsc;
#using scripts\cp_mp\utility\train_utility.gsc;
#using script_79d4b1c751a51f03;
#using scripts\mp\loot.gsc;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using script_3ff084f114b7f6c9;
#using script_518ae857a3d351c;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_721ee99d7a8f9168;
#using script_371b4c2ab5861e62;
#using script_64acb6ce534155b7;
#using script_120270bd0a747a35;
#using script_304f476283f6d36e;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using script_7c03ab87c5f9f420;
#using script_a62705cb078ec0a;
#using script_662cbac61c1ae7e2;
#using script_58fe895fd0fbe620;
#using script_5307834cd39b435c;
#using scripts\mp\utility\game.gsc;
#using script_241ff3c86d02a28d;
#using scripts\mp\gametypes\br_weapons.gsc;

#namespace pmc_missions;

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4aee
// Size: 0xad
function function_5a9c4bf10785ce1e() {
    namespace_7f0bcee5d45a1dea::add("player_connect", &onconnect);
    namespace_7f0bcee5d45a1dea::add("player_disconnect", &ondisconnect);
    level namespace_3846cfb60b2ef12f::registeronluieventcallback(&luinotifylistener);
    level namespace_61d0e47c5dff187c::lui_registercallback("pmc_mission_complete", &function_db6a7576652ee974);
    level namespace_61d0e47c5dff187c::lui_registercallback("pmc_mission_tier_complete", &on_pmc_mission_tier_complete);
    namespace_c31609f90efcf2ca::registeronplayerjoinsquadcallback(&function_b944a4d927f9c28a);
    namespace_c31609f90efcf2ca::function_a99987c7bf114da4(&function_b944a4d927f9c28a);
    function_5a45eb93b9fc8909();
    level.var_87af7f50c23346e8.var_da66011459cb5e59 = [];
    function_44d9a690ed5b6e76();
    callback::add("squad_created", &function_6d402ea224e021c2);
    /#
        thread function_7b91bc1947716bcf();
    #/
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ba2
// Size: 0x1b3
function cleanup() {
    function_c649b702f1ecf51c("brloot_caves_intel");
    function_c649b702f1ecf51c("brloot_unhacked_laptop");
    function_c649b702f1ecf51c("brloot_crane_intel");
    function_c649b702f1ecf51c("brloot_biolabs_intel_a");
    function_c649b702f1ecf51c("brloot_biolabs_intel_b");
    function_c649b702f1ecf51c("brloot_biolabs_intel_c");
    function_c649b702f1ecf51c("brloot_black_mous_intel");
    function_c649b702f1ecf51c("brloot_crown_intel");
    function_c649b702f1ecf51c("brloot_fake_aq_intel");
    function_c649b702f1ecf51c("brloot_konni_intel");
    function_c649b702f1ecf51c("brloot_legion_deal_intel");
    function_c649b702f1ecf51c("brloot_medical_intel");
    function_c649b702f1ecf51c("brloot_research_intel");
    function_c649b702f1ecf51c("brloot_saba_shipping_intel");
    function_c649b702f1ecf51c("brloot_sealion_intel");
    function_c649b702f1ecf51c("brloot_shadow_company_intel");
    function_c649b702f1ecf51c("brloot_shadow_deal_intel");
    function_c649b702f1ecf51c("brloot_system_architecture");
    function_c649b702f1ecf51c("brloot_drivers_note");
    function_c649b702f1ecf51c("brloot_konni_deal_note");
    function_c649b702f1ecf51c("brloot_pmc_instructions");
    function_c649b702f1ecf51c("brloot_politicians_letter");
    function_c649b702f1ecf51c("brloot_shadow_letter");
    function_c649b702f1ecf51c("brloot_rami_pictureofachild");
    function_c649b702f1ecf51c("brloot_rami_heartlocket");
    function_c649b702f1ecf51c("brloot_rami_watch");
    function_c649b702f1ecf51c("brloot_valuable_drug_brick");
    function_c649b702f1ecf51c("brloot_biolab_usb");
    function_c649b702f1ecf51c("brloot_shadow_company_usb");
    function_c649b702f1ecf51c("brloot_ceo_laptop");
    function_c649b702f1ecf51c("brloot_konni_laptop");
    function_c649b702f1ecf51c("brloot_black_mous_harddrive");
    function_c649b702f1ecf51c("brloot_experiment_harddrive");
    function_c649b702f1ecf51c("brloot_sealion_harddrive");
    function_c649b702f1ecf51c("brloot_shadow_harddrive");
    function_c649b702f1ecf51c("brloot_shipping_manifest");
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4d5c
// Size: 0x74
function private function_c649b702f1ecf51c(partname) {
    scriptables = getentitylessscriptablearray(undefined, undefined, undefined, undefined, partname);
    if (!isdefined(scriptables)) {
        return;
    }
    foreach (scriptable in scriptables) {
        namespace_cb965d2f71fefddc::loothide(scriptable);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4dd7
// Size: 0x3c7
function private function_5a45eb93b9fc8909() {
    /#
        assert(isdefined(level.var_1a2b600a06ec21f4), "Gamemode bundle required");
    #/
    /#
        assert(isdefined(level.var_1a2b600a06ec21f4.var_5839631399b1f1e1), "Current gamemode requires a faction mission table to be specified");
    #/
    level.var_37cbce6ebdd87f7f = getscriptbundle("factionmissiontable:" + level.var_1a2b600a06ec21f4.var_5839631399b1f1e1);
    /#
        assert(isdefined(level.var_37cbce6ebdd87f7f), "Faction mission table " + level.var_1a2b600a06ec21f4.var_5839631399b1f1e1 + " not found");
    #/
    /#
        assert(isdefined(level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30), "Challenges CSV needs to be defined in faction mission table " + level.var_1a2b600a06ec21f4.var_5839631399b1f1e1);
    #/
    level.var_87af7f50c23346e8 = spawnstruct();
    level.var_87af7f50c23346e8.var_16308019512af385 = [];
    level.var_87af7f50c23346e8.var_1b943b33f98bce6 = [];
    level.var_87af7f50c23346e8.var_a27457d7b8ab1a28 = [];
    foreach (var_555f50621039c357 in level.var_37cbce6ebdd87f7f.var_5839631399b1f1e1) {
        var_8fdd9a9ee1cc7089 = getscriptbundle("factionmission:" + var_555f50621039c357.var_96c3c27265ad5fcf);
        /#
            assert(isdefined(var_8fdd9a9ee1cc7089), "Faction mission asset " + var_555f50621039c357.var_96c3c27265ad5fcf + " not found");
        #/
        /#
            assert(isdefined(var_8fdd9a9ee1cc7089.ref), "Faction mission asset " + var_555f50621039c357.var_96c3c27265ad5fcf + " is missing a ref value. This should match the achievement name ref of the faction mission root achievement.");
        #/
        row = tablelookuprownum(level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30, 1, var_8fdd9a9ee1cc7089.ref);
        /#
            assertex(isdefined(row) && row >= 0, "Unable to find mission ref " + var_8fdd9a9ee1cc7089.ref + " in " + level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30);
        #/
        var_e070ff5172dff51b = tablelookupbyrow(level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30, row, 13);
        if (isdefined(var_e070ff5172dff51b) && var_e070ff5172dff51b != "") {
            var_d0926f46fae9c1d = strtok(var_e070ff5172dff51b, "|");
            foreach (var_96e013cf8894a365 in var_d0926f46fae9c1d) {
                var_5a330e252f700f4b = tablelookuprownum(level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30, 0, int(var_96e013cf8894a365));
                var_21355b990d4fdc67 = tablelookupbyrow(level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30, var_5a330e252f700f4b, 13);
                if (isdefined(var_21355b990d4fdc67) && var_21355b990d4fdc67 != "") {
                    var_9c66512083e1df59 = strtok(var_21355b990d4fdc67, "|");
                    foreach (challengeid in var_9c66512083e1df59) {
                        level.var_87af7f50c23346e8.var_a27457d7b8ab1a28[int(challengeid)] = var_8fdd9a9ee1cc7089.ref;
                    }
                }
            }
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x51a5
// Size: 0x51f
function private function_11adb36b4aa3e03b(missionid) {
    if (!isdefined(level.var_87af7f50c23346e8)) {
        /#
            assertmsg("level.pmcMissions is undefined when calling getMissionData! This is probably because pmc_init() was never called from the dvar: pmc_mission_enabled, being disabled!");
        #/
        return;
    }
    if (!isdefined(level.var_87af7f50c23346e8.var_16308019512af385) || !isarray(level.var_87af7f50c23346e8.var_16308019512af385)) {
        /#
            assertmsg("level.pmcMissions.missionData is undefined when calling getMissionData!");
        #/
        return;
    }
    if (!isdefined(level.var_37cbce6ebdd87f7f)) {
        /#
            assertmsg("level.factionMissionTableAsset is undefined when calling getMissionData!");
        #/
        return;
    }
    if (!isdefined(missionid)) {
        /#
            println("brloot_rami_pictureofachild");
        #/
        return;
    }
    if (!isdefined(level.var_87af7f50c23346e8.var_16308019512af385[missionid])) {
        row = tablelookuprownum(level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30, 0, missionid);
        /#
            assertex(isdefined(row) && row >= 0, "Unable to find mission ID " + missionid + " in " + level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30);
        #/
        ref = tablelookupbyrow(level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30, row, 1);
        amount = int(tablelookupbyrow(level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30, row, 4));
        xp = int(tablelookupbyrow(level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30, row, 6));
        lootid = int(tablelookupbyrow(level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30, row, 14));
        var_f2e7ef56fb1a0b7c = int(tablelookupbyrow(level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30, row, 15));
        var_1e6f49eec1998002 = tablelookupbyrow(level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30, row, 16);
        var_da9fc800af5a5ce0 = tablelookupbyrow(level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30, row, 18);
        var_62cd3d7406be8c32 = tablelookupbyrow(level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30, row, 17);
        var_b6da601dccc1197 = [];
        if (lootid) {
            var_b6da601dccc1197[var_b6da601dccc1197.size] = lootid;
        }
        if (var_da9fc800af5a5ce0 == "iw9_loot_id" && var_62cd3d7406be8c32 != "") {
            var_a36a3ba99f4fac6b = strtok(var_62cd3d7406be8c32, "|");
            foreach (str in var_a36a3ba99f4fac6b) {
                var_89e8814ce0183c08 = int(str);
                if (var_89e8814ce0183c08) {
                    var_b6da601dccc1197[var_b6da601dccc1197.size] = var_89e8814ce0183c08;
                }
            }
        }
        var_cfae3ad1c98a75b1 = tablelookupbyrow(level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30, row, 13);
        children = [];
        if (isdefined(var_cfae3ad1c98a75b1) && var_cfae3ad1c98a75b1 != "") {
            var_cfae3ad1c98a75b1 = strtok(var_cfae3ad1c98a75b1, "|");
            foreach (str in var_cfae3ad1c98a75b1) {
                children[children.size] = int(str);
            }
        }
        data = spawnstruct();
        data.ref = ref;
        data.amount = amount;
        data.xp = xp;
        data.children = children;
        data.var_b6da601dccc1197 = var_b6da601dccc1197;
        data.var_1e6f49eec1998002 = var_1e6f49eec1998002;
        data.var_f2e7ef56fb1a0b7c = var_f2e7ef56fb1a0b7c;
        if (isdefined(level.var_87af7f50c23346e8.var_a27457d7b8ab1a28[missionid])) {
            data.faction = level.var_87af7f50c23346e8.var_a27457d7b8ab1a28[missionid];
        }
        if (children.size) {
            foreach (childid in children) {
                var_bea76252fdb221f5 = function_11adb36b4aa3e03b(childid);
                var_bea76252fdb221f5.parent = missionid;
                var_bea76252fdb221f5.faction = data.faction;
            }
        }
        level.var_87af7f50c23346e8.var_16308019512af385[missionid] = data;
        level.var_87af7f50c23346e8.var_1b943b33f98bce6[ref] = missionid;
    }
    return level.var_87af7f50c23346e8.var_16308019512af385[missionid];
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56cc
// Size: 0x3c
function function_16ae6d8b5f25f31b(var_a5cb6f1f6abe070b) {
    id = level.var_87af7f50c23346e8.var_1b943b33f98bce6["iw9_s4_ch_pmc_" + var_a5cb6f1f6abe070b];
    if (!isdefined(id)) {
        id = -1;
    }
    return id;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5710
// Size: 0x19f
function function_d57e0f306b88dd37() {
    spawns = getstructarray("pmc_spawn_loot", "script_noteworthy");
    foreach (var_543aa033cda8a436 in spawns) {
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(var_543aa033cda8a436.origin, var_543aa033cda8a436.angles);
        item = namespace_cb965d2f71fefddc::spawnpickup(var_543aa033cda8a436.targetname, var_cb4fad49263e20c4, 1);
        if (isdefined(item)) {
            item.var_bbc200bc77c5db2b = 1;
        } else {
            /#
                assertmsg("Mission item " + var_543aa033cda8a436.targetname + " was not able to be spawned!");
            #/
        }
    }
    weapons = getstructarray("pmc_spawn_weapon", "script_noteworthy");
    foreach (var_543aa033cda8a436 in weapons) {
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(var_543aa033cda8a436.origin, var_543aa033cda8a436.angles);
        item = namespace_cb965d2f71fefddc::spawnpickup(var_543aa033cda8a436.targetname, var_cb4fad49263e20c4);
        if (isdefined(item)) {
            item.var_bbc200bc77c5db2b = 1;
        } else {
            /#
                assertmsg("Mission item " + var_543aa033cda8a436.targetname + " was not able to be spawned!");
            #/
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58b6
// Size: 0x98
function function_46bfece294c56645(var_a5cb6f1f6abe070b, itemlist, identifier) {
    id = function_16ae6d8b5f25f31b(var_a5cb6f1f6abe070b);
    if (isdefined(itemlist)) {
        foreach (item in itemlist) {
            level.var_57726c4d54785f95[item] = id;
        }
    }
    if (isdefined(identifier)) {
        level.var_57726c4d54785f95[identifier] = id;
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5955
// Size: 0x158
function function_d5394a20735bc2f1(struct, item, identifier, var_1fa640f7c162f51e, var_3474b4e818850c46) {
    origin = function_53c4c53197386572(struct.origin, (0, 0, 0));
    angles = function_53c4c53197386572(struct.angles, (0, 0, 0));
    placement = spawnscriptable("dmz_place_item", origin, angles);
    placement setscriptablepartstate("dmz_place_item_use", "usable_" + item);
    placement setscriptablepartstate("dmz_place_item_model", "hidden");
    placement.item = item;
    placement.lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(placement.item);
    placement.var_d136b9f79e55c11b = item;
    if (isdefined(var_3474b4e818850c46)) {
        placement.var_d136b9f79e55c11b = var_3474b4e818850c46;
    }
    placement.number = 1;
    placement.identifier = identifier;
    placement.var_1fa640f7c162f51e = var_1fa640f7c162f51e;
    level.var_87af7f50c23346e8.var_c3e10a42a81ade25[level.var_87af7f50c23346e8.var_c3e10a42a81ade25.size] = placement;
    return placement;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ab5
// Size: 0x8d
function function_5c280a977f39790e(struct) {
    placement = function_d5394a20735bc2f1(struct, struct.targetname, struct.target, struct.script_parameters, struct.script_label);
    if (isdefined(struct.target)) {
        id = function_16ae6d8b5f25f31b(struct.target);
        level.var_57726c4d54785f95[struct.target] = id;
    }
    return placement;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b4a
// Size: 0xa7
function function_5fb061ad407e6e6c(script_noteworthy, item, identifier, var_1fa640f7c162f51e, var_3474b4e818850c46) {
    structs = getstructarray(script_noteworthy, "script_noteworthy");
    if (isdefined(structs)) {
        foreach (struct in structs) {
            placement = function_d5394a20735bc2f1(struct, item, identifier, var_1fa640f7c162f51e, var_3474b4e818850c46);
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5bf8
// Size: 0x245
function function_2537e0b46ae9a7f1() {
    level.var_87af7f50c23346e8.var_c3e10a42a81ade25 = [];
    level.var_57726c4d54785f95 = [];
    function_46bfece294c56645("place_smuggling_tunnels", [0:"brloot_valuable_freshwater", 1:"brloot_valuable_mre", 2:"brloot_valuable_bandage"]);
    function_46bfece294c56645("plant_research_story", [0:"brloot_research_intel", 1:"brloot_gascan"]);
    function_46bfece294c56645("mall_place", [0:"brloot_valuable_gunoil", 1:"brloot_offhand_c4", 2:"brloot_valuable_drill"]);
    function_46bfece294c56645("deliver_letter", [0:"brloot_drivers_note"]);
    function_46bfece294c56645("track_submarines", undefined, "track_submarine");
    function_46bfece294c56645("track_biolabs_cargo", undefined, "track_cargo_truck_biolabs");
    function_46bfece294c56645("plant_microphone", undefined, "pmc_discrete_radio");
    function_46bfece294c56645("plant_fake_docs", [0:"brloot_fake_aq_intel"]);
    function_46bfece294c56645("extract_plant_intel", [0:"brloot_biolab_usb"]);
    function_46bfece294c56645("redacted_3_excavation", undefined, "track_biobunker_entrance");
    function_46bfece294c56645("ir_beacon_story", [0:"brloot_ir_beacon"]);
    spawns = getstructarray("pmc_place_loot", "script_noteworthy");
    foreach (spawn in spawns) {
        placement = function_5c280a977f39790e(spawn);
        if (placement.item == "brloot_tracking_device" && namespace_36f464722d326bbe::function_ffbbb4525b11d5a2()) {
            placement.identifier = "track_cargo_truck_biolabs";
        }
    }
    function_5fb061ad407e6e6c("pmc_submarine_tracker", "brloot_tracking_device", "track_submarine", "plant_submarine_tracker");
    function_5fb061ad407e6e6c("pmc_discrete_radio", "brloot_discrete_radio", "pmc_discrete_radio");
    function_5fb061ad407e6e6c("pmc_fake_aq_docs_place", "brloot_fake_aq_intel");
    function_5fb061ad407e6e6c("pmc_intel_exchange_usb", "brloot_biolab_usb");
    function_5fb061ad407e6e6c("track_biobunker_entrace", "brloot_tracking_device", "track_biobunker_entrance", "plant_biobunker_entrance", "parts_pouch_comms_cellular_jammer");
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x5e44
// Size: 0x27c
function function_c335cf2377039ba5(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!isdefined(player) || !isdefined(player.team)) {
        return;
    }
    var_587f61ad4c5334a0 = istrue(player namespace_aead94004cf4c147::function_6f39f9916649ac48(instance.lootid, 1));
    if (!var_587f61ad4c5334a0) {
        curr = player namespace_1a507865f681850e::getcurrentequipment("primary");
        var_c89f07da007ff0d = player namespace_1a507865f681850e::getequipmentslotammo("primary");
        if (isdefined(curr) && curr != "" && isdefined(var_c89f07da007ff0d) && var_c89f07da007ff0d) {
            lootid = namespace_38b993c4618e76cd::getlootidfromref(curr);
            if (lootid == instance.lootid) {
                player namespace_1a507865f681850e::takeequipment("primary");
                var_587f61ad4c5334a0 = 1;
            }
        }
    }
    if (var_587f61ad4c5334a0) {
        teammates = teams::getteamdata(player.team, "players");
        foreach (teammate in teammates) {
            instance disablescriptableplayeruse(teammate);
        }
        state = instance getscriptablepartstate("dmz_place_item_model");
        if (state == "hidden") {
            instance setscriptablepartstate("dmz_place_item_model", instance.var_d136b9f79e55c11b);
        }
        method = namespace_aad14af462a74d08::function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_2af1f13aa6ae3b5f", #"place"));
        namespace_aad14af462a74d08::function_d24138b32084fc3e(player, instance.lootid, undefined, method, 1);
        var_4e55fc12323ff73e = function_16ae6d8b5f25f31b("microphone_story");
        if (function_c5e0bac8f123cc88(player.team, var_4e55fc12323ff73e)) {
            if (isdefined(instance.identifier) && instance.identifier == "microphone_story") {
                teams::setteamdata(player.team, "placed_microphone", 1);
            }
        }
        if (isdefined(instance.var_1fa640f7c162f51e)) {
            function_8359cadd253f9604(player, instance.var_1fa640f7c162f51e, 1);
        }
    } else {
        player namespace_44abc05161e2e2cb::showerrormessage("PMC_S2/PLACE_ERR_MSG");
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x60c7
// Size: 0x34e
function function_fabd5665eee8cc3a() {
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level namespace_4b0406965e556711::gameflagwait("prematch_done");
    }
    var_529ed52251ca4317 = [];
    foreach (player in level.players) {
        foreach (placement in level.var_87af7f50c23346e8.var_c3e10a42a81ade25) {
            placement disablescriptableplayeruse(player);
        }
        if (isdefined(player.team) && getteamdata(player.team, "players").size == 1) {
            function_8359cadd253f9604(player, "solo_infil_exfil", 1);
            weapons = namespace_aead94004cf4c147::function_57931a717f140ebe(player);
            if (isdefined(weapons)) {
                hasweapon = 0;
                foreach (weapon in weapons) {
                    if (!namespace_68e641469fde3fa7::isfistsonly(weapon) && !namespace_68e641469fde3fa7::isgunlessweapon(weapon)) {
                        hasweapon = 1;
                        break;
                    }
                }
                if (!istrue(hasweapon)) {
                    function_8359cadd253f9604(player, "infil_solo_no_weapons", 1);
                }
            }
        }
        if (namespace_a38a2e1fe7519183::function_4b57e9867785e738(player)) {
            function_8359cadd253f9604(player, "infil_with_custom_weapon", 1);
        }
        if (isdefined(player.team)) {
            foreach (str, id in level.var_57726c4d54785f95) {
                if (isdefined(var_529ed52251ca4317[player.team]) && istrue(var_529ed52251ca4317[player.team][id]) || function_c5e0bac8f123cc88(player.team, id)) {
                    if (!isdefined(var_529ed52251ca4317[player.team])) {
                        var_529ed52251ca4317[player.team] = [];
                    }
                    if (!isdefined(var_529ed52251ca4317[player.team][id])) {
                        var_529ed52251ca4317[player.team][id] = 1;
                    }
                    foreach (placement in level.var_87af7f50c23346e8.var_c3e10a42a81ade25) {
                        if (isdefined(placement.item) && placement.item == str || isdefined(placement.identifier) && placement.identifier == str) {
                            placement enablescriptableplayeruse(player);
                        }
                    }
                }
            }
        }
        function_e634010f11d249eb(player);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x641c
// Size: 0x127
function function_e634010f11d249eb(player) {
    for (missionindex = 0; missionindex < 1; missionindex++) {
        id = function_47f721114fed37e7(player, missionindex);
        if (id > 0 && isdefined(level.var_87af7f50c23346e8.var_16308019512af385[id])) {
            ref = level.var_87af7f50c23346e8.var_16308019512af385[id].ref;
            vo = undefined;
            switch (ref) {
            case #"hash_78ba8d3ed2e0be53":
                vo = "faction_e_smugglers_run_on_start";
                break;
            case #"hash_9f579d24659a2a83":
                vo = "faction_e_tracking_activity_on_start";
                break;
            case #"hash_e6cbb14725afd9b5":
                vo = "faction_e_go_for_a_drive_on_start";
                break;
            case #"hash_bb6693e16da254ef":
                vo = "faction_e_fearless_on_start";
                break;
            case #"hash_eb9074fd9f79f15b":
                vo = "faction_e_cut_the_head_on_start";
                break;
            default:
                continue;
            }
            if (isdefined(vo)) {
                namespace_446fc987a980892f::function_d87d5deb069bf8e5(vo, [0:player]);
            }
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x654a
// Size: 0x25
function function_b0ca76f04ad0e0c3(player) {
    if (namespace_a38a2e1fe7519183::function_4b57e9867785e738(player)) {
        function_8359cadd253f9604(player, "exfil_with_custom_weapon", 1);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6576
// Size: 0xc2
function function_44d9a690ed5b6e76() {
    foreach (team in level.teamnamelist) {
        level.teamdata[team]["poisVisited"] = [];
        level.teamdata[team]["vehiclesEntered"] = [];
        level.teamdata[team]["gpsPoisVisited"] = [];
        level.teamdata[team]["poisVisitedACV"] = [];
        level.teamdata[team]["placed_microphone"] = 0;
        level.teamdata[team]["uniqueWeaponKill"] = [];
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x663f
// Size: 0x10a
function function_6d402ea224e021c2(var_d27680ff86693f5c) {
    if (isdefined(level.squaddata) && isdefined(var_d27680ff86693f5c) && isdefined(var_d27680ff86693f5c.team) && isdefined(var_d27680ff86693f5c.index)) {
        level.squaddata[var_d27680ff86693f5c.team][var_d27680ff86693f5c.index].properties["poisVisited"] = [];
        level.squaddata[var_d27680ff86693f5c.team][var_d27680ff86693f5c.index].properties["vehiclesEntered"] = [];
        level.squaddata[var_d27680ff86693f5c.team][var_d27680ff86693f5c.index].properties["gpsPoisVisited"] = [];
        level.squaddata[var_d27680ff86693f5c.team][var_d27680ff86693f5c.index].properties["poisVisitedACV"] = [];
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6750
// Size: 0x31
function function_cff2f4f168b29b81() {
    if (!isdefined(level.var_b2729f28a675be79)) {
        level.var_b2729f28a675be79 = getdvarint(@"hash_5a8c71e376f35349", 0);
    }
    return level.var_b2729f28a675be79;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6789
// Size: 0x6f
function function_545dc7a8e9dc2b05() {
    if (!isdefined(level.var_25fd54c3e76497cc)) {
        /#
            assert(isdefined(level.var_1a2b600a06ec21f4), "Gamemode bundle required");
        #/
        /#
            assert(isdefined(level.var_1a2b600a06ec21f4.var_25fd54c3e76497cc), "Current gamemode requires activeFactionMissionsStatsKey to be specified");
        #/
        level.var_25fd54c3e76497cc = level.var_1a2b600a06ec21f4.var_25fd54c3e76497cc;
    }
    return level.var_25fd54c3e76497cc;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6800
// Size: 0x49
function function_47f721114fed37e7(player, missionindex) {
    if (!isdefined(player)) {
        /#
            println("prematch_done");
        #/
        return 0;
    }
    return player getplayerdata(level.loadoutdata, "squadMembers", function_545dc7a8e9dc2b05(), missionindex, "challengeID");
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6851
// Size: 0x52
function function_7159ceb842152778(player, missionindex, childindex) {
    if (!isdefined(player)) {
        /#
            println("plane_black_box_extract");
        #/
        return 0;
    }
    return player getplayerdata(level.loadoutdata, "squadMembers", function_545dc7a8e9dc2b05(), missionindex, "challengeProgress", childindex);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68ab
// Size: 0x3f
function function_31b54d12c6b13a7c(player) {
    challenges = [];
    for (missionindex = 0; missionindex < 1; missionindex++) {
        challenges[challenges.size] = function_47f721114fed37e7(player, missionindex);
    }
    return challenges;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68f2
// Size: 0x99
function function_850c980cd2929d25(player, missionindex) {
    challenge = undefined;
    if (isplayer(player)) {
        if (!isarray(player.var_c2cb671fe02fa346)) {
            player.var_c2cb671fe02fa346 = [];
            for (index = 0; index < 1; index++) {
                player.var_c2cb671fe02fa346[index] = function_47f721114fed37e7(player, index);
            }
        }
        if (missionindex < player.var_c2cb671fe02fa346.size) {
            challenge = player.var_c2cb671fe02fa346[missionindex];
        }
    }
    return challenge;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6993
// Size: 0x10a
function function_c7d3c1cb4a3958cf(player, challengeid) {
    if (!function_cff2f4f168b29b81()) {
        /#
            println("oilfield_sniper_ai");
        #/
        return 0;
    }
    if (!isdefined(challengeid)) {
        /#
            /#
                assertmsg("gas_can_refuel");
            #/
        #/
        return 0;
    }
    for (missionindex = 0; missionindex < 1; missionindex++) {
        challenge = function_850c980cd2929d25(player, missionindex);
        if (isdefined(challenge) && challenge > 0 && challenge == challengeid) {
            return 1;
        }
        if (isdefined(challenge) && challenge > 0) {
            var_aa54c32da8404cf2 = function_11adb36b4aa3e03b(challenge);
            if (isdefined(var_aa54c32da8404cf2) && isarray(var_aa54c32da8404cf2.children)) {
                for (childindex = 0; childindex < var_aa54c32da8404cf2.children.size; childindex++) {
                    child = var_aa54c32da8404cf2.children[childindex];
                    if (isdefined(child) && child == challengeid) {
                        return 1;
                    }
                }
            }
        }
    }
    return 0;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6aa5
// Size: 0x13c
function function_62b41959b3c5a9ca(player, challengeid) {
    if (!function_cff2f4f168b29b81()) {
        /#
            println("plant_tac_cam_core_room");
        #/
        return 0;
    }
    if (!isdefined(challengeid)) {
        /#
            println("brloot_shop_intel");
        #/
        return 0;
    }
    for (missionindex = 0; missionindex < 1; missionindex++) {
        challenge = function_850c980cd2929d25(player, missionindex);
        if (!isdefined(challenge) || challenge <= 0) {
            continue;
        }
        var_f4e94dcd0c66dbc1 = function_11adb36b4aa3e03b(challenge);
        if (isdefined(var_f4e94dcd0c66dbc1)) {
            if (isdefined(var_f4e94dcd0c66dbc1.children)) {
                for (childindex = 0; childindex < var_f4e94dcd0c66dbc1.children.size; childindex++) {
                    child = var_f4e94dcd0c66dbc1.children[childindex];
                    if (isdefined(child) && child == challengeid) {
                        var_8d3cfe3c7bd5af71 = function_11adb36b4aa3e03b(child);
                        progress = function_7159ceb842152778(player, missionindex, childindex);
                        if (isdefined(progress) && isdefined(var_8d3cfe3c7bd5af71.amount)) {
                            return (progress >= var_8d3cfe3c7bd5af71.amount);
                        }
                    }
                }
            }
        }
    }
    return 0;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6be9
// Size: 0x120
function function_ff53d8b600dbc74(player, challengeid) {
    if (!function_cff2f4f168b29b81()) {
        /#
            println("pmc_agentPostDormancy");
        #/
        return undefined;
    }
    if (!isdefined(challengeid)) {
        /#
            println("<unknown string>");
        #/
        return undefined;
    }
    for (missionindex = 0; missionindex < 1; missionindex++) {
        challenge = function_850c980cd2929d25(player, missionindex);
        if (!isdefined(challenge) || challenge <= 0) {
            continue;
        }
        var_f4e94dcd0c66dbc1 = function_11adb36b4aa3e03b(challenge);
        if (isdefined(var_f4e94dcd0c66dbc1)) {
            if (isdefined(var_f4e94dcd0c66dbc1.children)) {
                for (childindex = 0; childindex < var_f4e94dcd0c66dbc1.children.size; childindex++) {
                    child = var_f4e94dcd0c66dbc1.children[childindex];
                    if (isdefined(child) && child == challengeid) {
                        var_8d3cfe3c7bd5af71 = function_11adb36b4aa3e03b(child);
                        return [0:function_7159ceb842152778(player, missionindex, childindex), 1:var_8d3cfe3c7bd5af71.amount];
                    }
                }
            }
        }
    }
    return undefined;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d11
// Size: 0x94
function function_c5e0bac8f123cc88(team, challengeid) {
    if (getdvarint(@"hash_ae46d31a716a05e8", 0)) {
        return 1;
    }
    players = getteamdata(team, "players");
    foreach (player in players) {
        if (function_c7d3c1cb4a3958cf(player, challengeid)) {
            return 1;
        }
    }
    return 0;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6dad
// Size: 0x9d
function function_4e577d33450caee4(challengeid) {
    if (getdvarint(@"hash_ae46d31a716a05e8", 0)) {
        return level.players;
    }
    var_694cf27a7080216 = [];
    foreach (player in level.players) {
        if (isdefined(player) && function_c7d3c1cb4a3958cf(player, challengeid)) {
            var_694cf27a7080216 = array_add(var_694cf27a7080216, player);
        }
    }
    return var_694cf27a7080216;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e52
// Size: 0xae
function function_ab5c0b42f31a0d20(missionid) {
    var_f2092a53e01523f4 = [];
    foreach (player in level.players) {
        if (!isdefined(var_f2092a53e01523f4[player.team])) {
            var_f2092a53e01523f4[player.team] = function_c5e0bac8f123cc88(player.team, missionid);
        }
        if (!var_f2092a53e01523f4[player.team]) {
            self disablescriptableplayeruse(player);
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f07
// Size: 0x5d
function function_ef63cdebaaff3440() {
    foreach (player in level.players) {
        if (isdefined(player)) {
            self disablescriptableplayeruse(player);
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f6b
// Size: 0xd8
function function_d3428ebfda80edeb(icon, offset, team) {
    offset = function_53c4c53197386572(offset, (0, 0, 0));
    self.curorigin = self.origin;
    self.offset3d = offset;
    namespace_19b4203b51d56488::requestid(1, 1, undefined, 1);
    objidnum = self.objidnum;
    if (isdefined(icon)) {
        objective_icon(objidnum, icon);
    }
    objective_position(objidnum, self.origin + offset);
    if (isdefined(team)) {
        namespace_5a22b6f3a56f7e9b::objective_teammask_single(objidnum, team);
    } else {
        objective_addalltomask(objidnum);
        objective_hidefromplayersinmask(objidnum);
    }
    function_9427cb5974c925d9(objidnum, 1);
    namespace_5a22b6f3a56f7e9b::objective_pin_global(objidnum, 1);
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objidnum, 4);
    function_a13e72e0427ecad2(objidnum, function_58fb674a1dd27075());
    return objidnum;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x704b
// Size: 0x55
function function_280edf3f47535ae9(name, key, type, var_1fbc3549649926b6) {
    trigger = function_f159c10d5cf8f0b4(name, key);
    if (!isdefined(trigger) || trigger.size == 0) {
        return;
    }
    trigger = trigger[0];
    thread function_b58f7554faa406e7(trigger, type, var_1fbc3549649926b6);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70a7
// Size: 0x84
function function_89a7111bd154e223(name, key, var_bb7537f2ccd47382, var_1fbc3549649926b6) {
    struct = getstruct(name, key);
    if (!isdefined(struct)) {
        return;
    }
    trigger = spawn("noent_volume_trigger_radius", struct.origin, 0, struct.radius, int(struct.target));
    thread function_b58f7554faa406e7(trigger, var_bb7537f2ccd47382, var_1fbc3549649926b6);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7132
// Size: 0xcd
function function_b58f7554faa406e7(trigger, type, var_1fbc3549649926b6) {
    while (1) {
        ent = trigger waittill("trigger");
        if (!isplayer(ent) || !isdefined(ent.team)) {
            continue;
        }
        if (isdefined(trigger.used) && isdefined(trigger.used[ent.team])) {
            continue;
        }
        if (!isdefined(trigger.used)) {
            trigger.used = [];
        }
        trigger.used[ent.team] = 1;
        function_8359cadd253f9604(ent, type, 1);
        if (isdefined(var_1fbc3549649926b6)) {
            [[ var_1fbc3549649926b6 ]](ent);
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7206
// Size: 0x227
function function_a0af645242dc7260(player, lootid, var_5577636292591c8b) {
    missions = function_31b54d12c6b13a7c(player);
    foreach (mission in missions) {
        if (mission <= 0 || !isdefined(level.var_87af7f50c23346e8.var_16308019512af385[mission])) {
            continue;
        }
        var_16308019512af385 = function_11adb36b4aa3e03b(mission);
        var_f2e7ef56fb1a0b7c = var_16308019512af385.var_f2e7ef56fb1a0b7c;
        if (var_f2e7ef56fb1a0b7c && isdefined(var_5577636292591c8b) && var_f2e7ef56fb1a0b7c == var_5577636292591c8b) {
            return mission;
        }
        foreach (id in var_16308019512af385.var_b6da601dccc1197) {
            if (isdefined(id) && id != 0) {
                if (id == lootid) {
                    return mission;
                }
            }
        }
        foreach (child in var_16308019512af385.children) {
            var_bea76252fdb221f5 = function_11adb36b4aa3e03b(child);
            var_f2e7ef56fb1a0b7c = var_bea76252fdb221f5.var_f2e7ef56fb1a0b7c;
            if (var_f2e7ef56fb1a0b7c && isdefined(var_5577636292591c8b) && var_f2e7ef56fb1a0b7c == var_5577636292591c8b) {
                return child;
            }
            foreach (id in var_bea76252fdb221f5.var_b6da601dccc1197) {
                if (isdefined(id) && id != 0) {
                    if (id == lootid) {
                        return child;
                    }
                }
            }
        }
    }
    return 0;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7435
// Size: 0x58
function function_6c11b28b956bf6ad(mapid) {
    if (!isdefined(mapid)) {
        mapid = 1;
    }
    if (mapid & 1) {
        return namespace_36f464722d326bbe::function_7ee65fae13124702();
    } else if (mapid & 2) {
        return namespace_36f464722d326bbe::function_e21746abaaaf8414();
    } else if (mapid & 4) {
        return namespace_36f464722d326bbe::function_ffbbb4525b11d5a2();
    } else if (mapid & 8) {
        return namespace_36f464722d326bbe::function_5e0e3a24dbb1fae1();
    }
    return 1;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7495
// Size: 0x152
function function_315e9c3a5fb405e5(missionid, var_f05299e50a2f2cc7, lootid, quantity, mapid) {
    if (!function_6c11b28b956bf6ad(mapid)) {
        return;
    }
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level namespace_4b0406965e556711::gameflagwait("prematch_done");
    }
    namespace_3c37cb17ade254d::flag_wait("dead_drops_init");
    if (!isdefined(level.var_ced78996bbf1b2d3)) {
        return;
    }
    var_694cf27a7080216 = [];
    var_f2092a53e01523f4 = [];
    foreach (player in level.players) {
        if (!isdefined(var_f2092a53e01523f4[player.team])) {
            var_f2092a53e01523f4[player.team] = function_c5e0bac8f123cc88(player.team, missionid);
        }
        if (var_f2092a53e01523f4[player.team]) {
            var_694cf27a7080216[var_694cf27a7080216.size] = player;
        }
    }
    container = sortbydistance(level.var_ced78996bbf1b2d3, var_f05299e50a2f2cc7)[0];
    namespace_92fc655e328c1a9f::function_6207d6f728cee51d(var_694cf27a7080216, container, lootid, quantity, undefined, 1);
    level thread function_955e6c9750ee6b5e(var_694cf27a7080216, container);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75ee
// Size: 0x171
function function_3079d4d1c0ee380e(missionid, var_f05299e50a2f2cc7, weaponobj, mapid) {
    if (!function_6c11b28b956bf6ad(mapid)) {
        return;
    }
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level namespace_4b0406965e556711::gameflagwait("prematch_done");
    }
    namespace_3c37cb17ade254d::flag_wait("dead_drops_init");
    if (!isdefined(level.var_ced78996bbf1b2d3)) {
        return;
    }
    var_694cf27a7080216 = [];
    var_f2092a53e01523f4 = [];
    foreach (player in level.players) {
        if (!isdefined(var_f2092a53e01523f4[player.team])) {
            var_f2092a53e01523f4[player.team] = function_c5e0bac8f123cc88(player.team, missionid);
        }
        if (var_f2092a53e01523f4[player.team]) {
            var_694cf27a7080216[var_694cf27a7080216.size] = player;
        }
    }
    container = sortbydistance(level.var_ced78996bbf1b2d3, var_f05299e50a2f2cc7)[0];
    lootid = namespace_e0ee43ef2dddadaa::function_9c331f88be5a1478(weaponobj);
    ammo = weaponclipsize(weaponobj);
    namespace_92fc655e328c1a9f::function_6207d6f728cee51d(var_694cf27a7080216, container, lootid, ammo, weaponobj, 1);
    level thread function_955e6c9750ee6b5e(var_694cf27a7080216, container);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7766
// Size: 0x127
function function_955e6c9750ee6b5e(var_694cf27a7080216, container) {
    if (!isdefined(container) || !isdefined(var_694cf27a7080216)) {
        return;
    }
    container notify("dead_drop_nag");
    container endon("dead_drop_nag");
    container endon("death");
    level endon("game_ended");
    while (1) {
        var_ee49733d297cd9f1 = [];
        foreach (player in var_694cf27a7080216) {
            if (isdefined(player) && !isbot(player) && namespace_7e17181d03156026::isreallyalive(player) && isdefined(player.team) && !array_contains(var_ee49733d297cd9f1, player.team) && distance2d(player.origin, container.origin) < 2000) {
                namespace_446fc987a980892f::function_9793a81bc3bc19e9("player_item_dead_drop_retrieve", player.team);
                var_ee49733d297cd9f1[var_ee49733d297cd9f1.size] = player.team;
            }
        }
        wait(5);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7894
// Size: 0x53a
function function_b944a4d927f9c28a(player, var_ef33da3e10ea5db8) {
    if (!isdefined(var_ef33da3e10ea5db8)) {
        var_ef33da3e10ea5db8 = 0;
    }
    if (!isplayer(player)) {
        return;
    }
    player.var_1f4ccc0c71eba297 = var_ef33da3e10ea5db8;
    players = [];
    if (issharedfuncdefined("squad_utility", "getSquadMembers")) {
        players = player [[ getsharedfunc("squad_utility", "getSquadMembers") ]]();
    } else {
        players[0] = player;
    }
    var_14cee82314ac28cd = [];
    var_a0f0fc2f7ff8f287 = [];
    clientnums = [];
    foreach (var_736d8d9188ccbd45 in players) {
        for (missionindex = 0; missionindex < 1; missionindex++) {
            memberindex = var_736d8d9188ccbd45.var_3f78c6a0862f9e25;
            if (!isdefined(var_14cee82314ac28cd[memberindex])) {
                var_14cee82314ac28cd[memberindex] = [];
                var_a0f0fc2f7ff8f287[memberindex] = [];
            }
            clientnums[memberindex] = var_736d8d9188ccbd45 getentitynumber();
            /#
                assert(var_14cee82314ac28cd[memberindex].size == var_a0f0fc2f7ff8f287[memberindex].size);
            #/
            size = var_14cee82314ac28cd[memberindex].size;
            id = function_47f721114fed37e7(var_736d8d9188ccbd45, missionindex);
            var_14cee82314ac28cd[memberindex][size] = id;
            var_a0f0fc2f7ff8f287[memberindex][size] = [];
            for (childindex = 0; childindex < 4; childindex++) {
                var_a0f0fc2f7ff8f287[memberindex][size][childindex] = function_7159ceb842152778(var_736d8d9188ccbd45, missionindex, childindex);
            }
            if (id > 0) {
                if (isdefined(level.var_87af7f50c23346e8.var_16308019512af385[id])) {
                    if (level.var_87af7f50c23346e8.var_16308019512af385[id].children.size > 0) {
                        var_55194940629e0c11 = 1;
                        for (child = 0; child < 4; child++) {
                            childid = level.var_87af7f50c23346e8.var_16308019512af385[id].children[child];
                            if (isdefined(childid) && childid > 0) {
                                progress = var_a0f0fc2f7ff8f287[memberindex][size][child];
                                amount = level.var_87af7f50c23346e8.var_16308019512af385[childid].amount;
                                var_46612e4815489ba6 = level.var_87af7f50c23346e8.var_16308019512af385[childid].ref;
                                if (progress != amount) {
                                    var_55194940629e0c11 = 0;
                                } else {
                                    if (id != 0 && var_ef33da3e10ea5db8 != 0) {
                                        params = spawnstruct();
                                        params.player = player;
                                        params.var_5acbea480d34f416 = childid;
                                        params.var_63242b74ae47b604 = var_46612e4815489ba6;
                                        params.parentid = id;
                                        params.var_5c1182cb547ca916 = level.var_87af7f50c23346e8.var_16308019512af385[id].ref;
                                        callback::callback("on_pmc_mission_step_complete", params);
                                    }
                                    function_1a3bd4602e62e661(var_736d8d9188ccbd45, players, var_46612e4815489ba6);
                                }
                            }
                        }
                        if (istrue(var_55194940629e0c11)) {
                            function_b2d5fe14937fa854(var_736d8d9188ccbd45, id);
                        }
                    } else {
                        progress = var_a0f0fc2f7ff8f287[memberindex][size][0];
                        amount = level.var_87af7f50c23346e8.var_16308019512af385[id].amount;
                        if (progress == amount) {
                            function_b2d5fe14937fa854(var_736d8d9188ccbd45, id);
                        }
                    }
                }
            }
        }
    }
    foreach (var_736d8d9188ccbd45 in players) {
        for (memberindex = 0; memberindex < players.size; memberindex++) {
            challengeindex = 0;
            if (isdefined(clientnums[memberindex])) {
                var_736d8d9188ccbd45 setplayerdata(level.var_5d69837cf4db0407, "squadPMCMissionGroups", memberindex, "clientNum", clientnums[memberindex]);
            }
            if (isdefined(var_14cee82314ac28cd[memberindex]) && isdefined(var_a0f0fc2f7ff8f287[memberindex])) {
                for (challengeindex = 0; challengeindex < min(var_14cee82314ac28cd[memberindex].size, 1); challengeindex++) {
                    var_736d8d9188ccbd45 setplayerdata(level.var_5d69837cf4db0407, "squadPMCMissionGroups", memberindex, "missions", challengeindex, "challengeID", var_14cee82314ac28cd[memberindex][challengeindex]);
                    for (childindex = 0; childindex < 4; childindex++) {
                        var_736d8d9188ccbd45 setplayerdata(level.var_5d69837cf4db0407, "squadPMCMissionGroups", memberindex, "missions", challengeindex, "challengeProgress", childindex, var_a0f0fc2f7ff8f287[memberindex][challengeindex][childindex]);
                    }
                }
            }
            while (challengeindex < 1) {
                var_736d8d9188ccbd45 setplayerdata(level.var_5d69837cf4db0407, "squadPMCMissionGroups", memberindex, "missions", challengeindex, "challengeID", 0);
                for (childindex = 0; childindex < 4; childindex++) {
                    var_736d8d9188ccbd45 setplayerdata(level.var_5d69837cf4db0407, "squadPMCMissionGroups", memberindex, "missions", challengeindex, "challengeProgress", childindex, 0);
                }
                challengeindex++;
            }
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7dd5
// Size: 0xd1
function function_b2d5fe14937fa854(player, id) {
    if (isdefined(player.guid) && isdefined(level.var_87af7f50c23346e8.var_da66011459cb5e59)) {
        if (!isdefined(level.var_87af7f50c23346e8.var_da66011459cb5e59[player.guid])) {
            level.var_87af7f50c23346e8.var_da66011459cb5e59[player.guid] = [];
        }
        if (!isdefined(level.var_87af7f50c23346e8.var_da66011459cb5e59[player.guid][id])) {
            level.var_87af7f50c23346e8.var_da66011459cb5e59[player.guid][id] = 1;
            function_dab637c713e2986f(player, id);
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ead
// Size: 0x39
function luinotifylistener(notification, value) {
    if (isdefined(notification)) {
        switch (notification) {
        case #"hash_c263e227327caf17":
            function_b944a4d927f9c28a(self);
            break;
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7eed
// Size: 0x1a
function function_728323a4ebcaa0cb(value) {
    if (isdefined(value)) {
        function_b944a4d927f9c28a(self, value);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f0e
// Size: 0x1a
function function_db6a7576652ee974(value) {
    if (isdefined(value)) {
        function_b2d5fe14937fa854(self, value);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f2f
// Size: 0x78
function on_pmc_mission_tier_complete(value) {
    if (isdefined(value) && value > 0) {
        var_16308019512af385 = function_11adb36b4aa3e03b(value);
        params = spawnstruct();
        params.player = self;
        params.id = value;
        params.ref = var_16308019512af385.ref;
        callback::callback("on_pmc_mission_tier_complete", params);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fae
// Size: 0x1d
function function_6f6cc16c0528de5b(player) {
    return player namespace_aad14af462a74d08::challengesenabledforplayer() && function_cff2f4f168b29b81();
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fd3
// Size: 0x132
function function_1120295a2cd880f4(player, missionxp) {
    if (!isplayer(player)) {
        return;
    }
    players = [];
    if (issharedfuncdefined("squad_utility", "getSquadMembers")) {
        players = player [[ getsharedfunc("squad_utility", "getSquadMembers") ]]();
    }
    foreach (var_736d8d9188ccbd45 in players) {
        if (var_736d8d9188ccbd45 != player) {
            var_736d8d9188ccbd45 namespace_48a08c5037514e04::doscoreevent(#"hash_5a2c275279403f5", undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
        } else {
            if (!isdefined(var_736d8d9188ccbd45.pers["missionXP"])) {
                var_736d8d9188ccbd45.pers["missionXP"] = 0;
            }
            var_736d8d9188ccbd45.pers["missionXP"] = var_736d8d9188ccbd45.pers["missionXP"] + missionxp;
        }
        if (!isdefined(var_736d8d9188ccbd45.var_56a4e98c643a1e2d)) {
            var_736d8d9188ccbd45.var_56a4e98c643a1e2d = 0;
        }
        var_736d8d9188ccbd45.var_56a4e98c643a1e2d++;
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x810c
// Size: 0x327
function function_1a3bd4602e62e661(player, players, ref) {
    foreach (var_736d8d9188ccbd45 in players) {
        if (!isarray(var_736d8d9188ccbd45.var_d0ffe5aa652992e9)) {
            var_736d8d9188ccbd45.var_d0ffe5aa652992e9 = [];
        }
        var_736d8d9188ccbd45.var_d0ffe5aa652992e9[ref] = 1;
    }
    if (!namespace_4b0406965e556711::gameflag("prematch_done") || !isdefined(player.team)) {
        return;
    }
    switch (ref) {
    case #"hash_7e108663ae8d1445":
        if (!istrue(player.var_d0ffe5aa652992e9["iw9_s4_ch_pmc_smugglers_run_drop"])) {
            namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_e_smugglers_run_on_kills_done", player.team);
        } else {
            namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_e_smugglers_run_extract_ready", player.team);
        }
        break;
    case #"hash_89cfd86fd6468831":
        if (!istrue(player.var_d0ffe5aa652992e9["iw9_s4_ch_pmc_smugglers_run_extract"])) {
            namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_e_smugglers_run_weapons_deaddropped", player.team);
        } else {
            namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_e_smugglers_run_extract_ready", player.team);
        }
        break;
    case #"hash_4b3a113ebbac085e":
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_e_tracking_activity_on_tracker_pickup", player.team);
        break;
    case #"hash_539cec193586e67f":
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_e_tracking_activity_on_uavs_activated", player.team);
        break;
    case #"hash_aa9eab5f1b79016b":
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_e_go_for_a_drive_on_drive_pickup", player.team);
        break;
    case #"hash_16e75678b85cf692":
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_e_go_for_a_drive_transfer_completed", player.team);
        break;
    case #"hash_5dd2bbbbb55fcf9b":
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_e_fearless_on_weaponcase_pickup", player.team);
        break;
    case #"hash_3f96ce3129b1f13d":
        if (!istrue(player.var_d0ffe5aa652992e9["iw9_s4_ch_pmc_fearless_activate"])) {
            namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_e_fearless_on_firestation_cleared", player.team);
        } else {
            namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_e_fearless_completed", player.team);
        }
        break;
    case #"hash_f7de4bbb1103e171":
        if (!istrue(player.var_d0ffe5aa652992e9["iw9_s4_ch_pmc_fearless_clear"])) {
            namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_e_fearless_on_uav_activated", player.team);
        } else {
            namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_e_fearless_completed", player.team);
        }
        break;
    case #"hash_9181f4d4b41517d0":
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_e_cut_the_head_on_key_pickup", player.team);
        break;
    case #"hash_13a37d8235b2382d":
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_e_cut_the_head_on_data_ready_for_extract", player.team);
        break;
    default:
        break;
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x843a
// Size: 0x428
function function_dab637c713e2986f(player, id) {
    var_16308019512af385 = function_11adb36b4aa3e03b(id);
    ref = var_16308019512af385.ref;
    xp = var_16308019512af385.xp;
    if (!namespace_4b0406965e556711::gameflag("prematch_done") || !isdefined(player.team)) {
        return;
    }
    function_1120295a2cd880f4(player, xp);
    var_607da387f3617ed1 = undefined;
    if (issharedfuncdefined("squad_utility", "getSquadMembers")) {
        var_607da387f3617ed1 = player [[ getsharedfunc("squad_utility", "getSquadMembers") ]]();
    }
    if (isdefined(var_607da387f3617ed1)) {
        foreach (var_8f7040e569ec9e98 in var_607da387f3617ed1) {
            if (var_8f7040e569ec9e98 != player) {
                function_8359cadd253f9604(var_8f7040e569ec9e98, "squadmate_mission_complete", 1);
            }
        }
    }
    switch (ref) {
    case #"hash_9f579d24659a2a83":
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_e_tracking_activity_completed", player.team);
        break;
    case #"hash_e6cbb14725afd9b5":
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_e_go_for_a_drive_completed", player.team);
        break;
    case #"hash_eb9074fd9f79f15b":
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_e_cut_the_head_completed", player.team);
        break;
    case #"hash_fe603225c0f0af56":
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_mission_beacon_castle_completed", player.team);
        break;
    case #"hash_5e96e6ce5b56d43e":
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_mission_microphone_plant_completed", player.team);
        break;
    case #"hash_934618d8b9979b92":
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_mission_assign_travel", player.team);
        break;
    case #"hash_45de09b3d5e30764":
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_mission_shadow_alliance_2_completed", player.team);
        break;
    case #"hash_51f4767b02457c82":
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_mission_gas_investigation_completed", player.team);
        break;
    case #"hash_f4365880005f0dd2":
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_mission_letter_instructions_completed", player.team);
        break;
    case #"hash_7ef6adf8c0387ccc":
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_mission_letter_delivery_completed", player.team);
        break;
    case #"hash_7a765cbc8502bdbd":
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_mission_bio_bunker_intel_completed", player.team);
        break;
    case #"hash_f2757bcacbcdc86c":
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_mission_building_21_owner_completed", player.team);
        break;
    case #"hash_f0437f6c134b7fd3":
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_mission_drill_completed", player.team);
        break;
    case #"hash_40596713534b14ba":
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_mission_letter_instructions_completed", player.team);
        break;
    case #"hash_939f793aafd78958":
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_mission_find_map_completed", player.team);
        break;
    case #"hash_b7651710e84f5811":
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_mission_three_strongholds_completed", player.team);
        break;
    case #"hash_f9982a7240fef7d":
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_mission_exits_located_completed", player.team);
        break;
    case #"hash_b860a722cf8bdfad":
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_mission_exit_secured_completed", player.team);
        break;
    default:
        break;
    }
    player thread function_41d63c1ace07fa21();
    params = spawnstruct();
    params.player = player;
    params.id = id;
    params.ref = ref;
    callback::callback("on_pmc_mission_completed", params);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8869
// Size: 0x1d
function function_41d63c1ace07fa21() {
    wait(3);
    if (isdefined(self.var_c2cb671fe02fa346)) {
        self.var_c2cb671fe02fa346 = undefined;
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x888d
// Size: 0x19b
function function_5ddb9007ee69fe54(player, lootid, var_5577636292591c8b) {
    if (!isdefined(lootid)) {
        return 0;
    }
    mission = function_a0af645242dc7260(player, lootid, var_5577636292591c8b);
    var_d720b003c55c1f6c = 0;
    if (mission) {
        var_16308019512af385 = function_11adb36b4aa3e03b(mission);
        faction = var_16308019512af385.faction;
        method = var_16308019512af385.var_1e6f49eec1998002;
        /#
            assert(isdefined(faction) && faction != "");
        #/
        if (isdefined(faction)) {
            switch (method) {
            case #"hash_14cdf88779fee5fe":
            case #"hash_f2046c241db20c4f":
                namespace_446fc987a980892f::function_d87d5deb069bf8e5("faction_" + faction + "_item_exfil_nag", [0:player]);
                var_d720b003c55c1f6c = 1;
                break;
            case #"hash_f354dcd79eb93325":
                namespace_446fc987a980892f::function_d87d5deb069bf8e5("faction_" + faction + "_item_dead_drop_nag", [0:player]);
                var_d720b003c55c1f6c = 1;
                break;
            default:
                break;
            }
        }
    }
    if (lootid == 11197) {
        if (isdefined(level.var_fe06b29988dc7c85) && level.var_fe06b29988dc7c85 getscriptablepartstate("dmz_pmc_place_intel") == "invisible_unusable") {
            level.var_fe06b29988dc7c85 setscriptablepartstate("dmz_pmc_place_intel", "invisible_usable");
            level.var_fe06b29988dc7c85 function_ab5c0b42f31a0d20(function_16ae6d8b5f25f31b("water_caves_story"));
        }
        var_d720b003c55c1f6c = 1;
    }
    thread function_7bb64b8f4eea0443(player, lootid);
    return var_d720b003c55c1f6c;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a30
// Size: 0xce
function function_7bb64b8f4eea0443(player, lootid) {
    var_5d10fd4182b17097 = namespace_38b993c4618e76cd::getlootidfromref("brloot_valuable_drill");
    var_c6d0df64279e57b9 = namespace_38b993c4618e76cd::getlootidfromref("brloot_gascan");
    var_d3a1b1290ee315ab = namespace_38b993c4618e76cd::getlootidfromref("brloot_valuable_gold_skull");
    if (lootid == var_5d10fd4182b17097 || lootid == var_c6d0df64279e57b9 || lootid == var_d3a1b1290ee315ab) {
        waitframe();
        if (isdefined(player)) {
            var_977a87cbf1bc6d6 = player namespace_aead94004cf4c147::function_93f02514431a1f5d(var_5d10fd4182b17097);
            var_42e59ad4d758c878 = player namespace_aead94004cf4c147::function_93f02514431a1f5d(var_c6d0df64279e57b9);
            var_5a0f6a793669372a = player namespace_aead94004cf4c147::function_93f02514431a1f5d(var_d3a1b1290ee315ab);
            if (var_977a87cbf1bc6d6 && var_42e59ad4d758c878 && var_5a0f6a793669372a) {
                function_8359cadd253f9604(player, "get_backpack_trade_items", 1);
            }
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8b05
// Size: 0xf1
function onpickupweapon(player, weapon, metadata) {
    if (!function_6f6cc16c0528de5b(player)) {
        return;
    }
    if (!isdefined(player) || !isdefined(player.guid)) {
        return;
    }
    if (!isdefined(level.var_36635e1fd288ea27)) {
        level.var_36635e1fd288ea27 = [];
    }
    level.var_36635e1fd288ea27[player.guid] = 1;
    if (isdefined(weapon)) {
        if (issameweapon(weapon, level.var_c891a425bf8cbc28)) {
            function_8359cadd253f9604(player, "loot_chemist_dead_drop_weapon", 1);
        }
        if (issameweapon(weapon, level.var_632f6a89b947fd5)) {
            function_8359cadd253f9604(player, "loot_phalanx_dead_drop_weapon", 1);
        }
        if (isdefined(level.var_c932dcf448d425f1) && issameweapon(weapon, level.var_c932dcf448d425f1)) {
            function_8359cadd253f9604(player, "loot_trapper_crossbow", 1);
        }
        if (isdefined(metadata)) {
            namespace_8361bad7391de074::function_cc6a02d4564d9f07(player, metadata);
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bfd
// Size: 0x3c
function function_c2bc51039a2df634(player) {
    operatorindex = namespace_a38a2e1fe7519183::function_ddd16c8b86863b56(player);
    if (isdefined(operatorindex) && operatorindex <= 2) {
        namespace_aad14af462a74d08::function_8359cadd253f9604(player, "operator_slot_full_" + operatorindex, 1);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c40
// Size: 0x41b
function function_3172b1344f4e08a0(player, inventory, var_ebd34e72023fc5a9, clipammo, cash, var_3064fa24dbbd5bbf) {
    if (!function_6f6cc16c0528de5b(player)) {
        return;
    }
    if (namespace_36f464722d326bbe::function_ffbbb4525b11d5a2()) {
        function_4249ec519aa97cd(player, inventory, var_ebd34e72023fc5a9, clipammo, cash, var_3064fa24dbbd5bbf);
        if (istrue(player.var_859654e0445a36d9)) {
            function_8359cadd253f9604(player, "pmc_biolabs_hostage_exfil", 1);
        }
    }
    var_3c0f3a5d88f0584a = 0;
    foreach (item in var_ebd34e72023fc5a9) {
        function_f3bb4f4911a1beb2(item.lootid, "extracted", player, item);
        if (namespace_85cd45b4fe0d86fb::function_3c17a26ce6a4668(item.lootid)) {
            var_3c0f3a5d88f0584a++;
        }
    }
    backpacksize = namespace_aead94004cf4c147::function_b13e35608b336d65(player);
    if (var_3c0f3a5d88f0584a >= backpacksize) {
        function_8359cadd253f9604(player, "full_backpack_dogtag_extract", 1);
    }
    method = 0;
    method = namespace_aad14af462a74d08::function_6d40f12a09494350(method, function_e2ff8f4b4e94f723(#"hash_2af1f13aa6ae3b5f", #"exfil"));
    if (istrue(var_3064fa24dbbd5bbf.var_27144879b0c7beed)) {
        method = namespace_aad14af462a74d08::function_6d40f12a09494350(method, function_e2ff8f4b4e94f723(#"hash_2af1f13aa6ae3b5f", #"hash_c5bb2c28ce9fb14c"));
        function_8359cadd253f9604(player, "extracted_final", 1);
    }
    if (var_3064fa24dbbd5bbf.players.size >= 2) {
        if (istrue(var_3064fa24dbbd5bbf.var_5fda164731e59c13)) {
            function_8359cadd253f9604(player, "personal_exfil_with_other_player", 1);
        }
        function_8359cadd253f9604(player, "exfil_with_other_players", var_3064fa24dbbd5bbf.players.size);
    }
    if (istrue(var_3064fa24dbbd5bbf.var_21584999ab948530)) {
        function_8359cadd253f9604(player, "drivable_exfil", 1);
    }
    items = array_combine(inventory, var_ebd34e72023fc5a9, clipammo);
    function_baeceec743d9a737(player, items, cash, method, 1);
    if (isdefined(level.var_e250c5815c2e42f3) && array_contains(level.var_e250c5815c2e42f3, player.team)) {
        function_8359cadd253f9604(player, "plane_black_box_extract", 1);
    }
    function_8359cadd253f9604(player, "extracted", 1);
    if (isdefined(player.guid) && (!isdefined(level.var_36635e1fd288ea27) || !isdefined(level.var_36635e1fd288ea27[player.guid]))) {
        function_8359cadd253f9604(player, "exfil_no_weapons", 1);
    }
    var_4c4ca0f1f252f57b = namespace_aead94004cf4c147::function_b13e35608b336d65(player);
    var_b3723cf04dcd3fb8 = namespace_aead94004cf4c147::function_102abd6883c5f9bf(player);
    var_7704a6a835ad2e44 = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("brloot_backpack_scav");
    if (var_4c4ca0f1f252f57b > 5 && var_b3723cf04dcd3fb8 != var_7704a6a835ad2e44) {
        var_4c4ca0f1f252f57b++;
    }
    if (var_ebd34e72023fc5a9.size == var_4c4ca0f1f252f57b) {
        function_8359cadd253f9604(player, "full_backpack_extract", 1);
    }
    if (istrue(var_3064fa24dbbd5bbf.var_6086028a8dfde29e)) {
        function_8359cadd253f9604(player, "hostage_heli_exfil", 1);
    }
    if (istrue(player.var_d139ca6041259b28)) {
        function_8359cadd253f9604(player, "extract_heli_blackbox", 1);
    }
    var_b5468c34e36d3940 = namespace_aead94004cf4c147::function_b13e35608b336d65(player) >= 9 && is_equal(player.var_bed158a6dfac230d, 3) && is_equal(player.gasmasktype, "brloot_equip_gasmask_durable") && player namespace_d3d40f75bb4e4c32::hasselfrevivetoken() && isdefined(namespace_58a74e7d54b56e8d::getkillstreakinslot(1));
    if (var_b5468c34e36d3940 && var_ebd34e72023fc5a9.size >= 10 && namespace_aead94004cf4c147::function_57931a717f140ebe(player).size >= 2 && isdefined(player.equipment) && player.equipment.size >= 4) {
        function_8359cadd253f9604(player, "full_backpack_loadout_extract", 1);
    }
    if (var_b5468c34e36d3940) {
        function_c2bc51039a2df634(player);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9062
// Size: 0x8e
function function_4249ec519aa97cd(player, inventory, var_ebd34e72023fc5a9, clipammo, cash, var_3064fa24dbbd5bbf) {
    if (isdefined(level.var_a7b62649c81b481a) && isdefined(level.var_a7b62649c81b481a.var_acc161de36707de2)) {
        var_9c02e895e4dbdc3b = level.var_a7b62649c81b481a.var_acc161de36707de2;
        if (var_9c02e895e4dbdc3b == 5) {
            function_8359cadd253f9604(player, "lpcon_echo_extract", 1);
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90f7
// Size: 0xbc
function function_b0537ee3a491b4dd(player, contents, cash) {
    method = 0;
    method = namespace_aad14af462a74d08::function_6d40f12a09494350(0, function_e2ff8f4b4e94f723(#"hash_2af1f13aa6ae3b5f", #"hash_170eed3e03d45ad6"));
    method = namespace_aad14af462a74d08::function_6d40f12a09494350(0, function_e2ff8f4b4e94f723(#"hash_2af1f13aa6ae3b5f", #"extract"));
    var_fec4228317afe4ff = function_baeceec743d9a737(player, contents, cash, method, 0);
    if (!isdefined(player.var_e7faf08f327b0fb5)) {
        player.var_e7faf08f327b0fb5 = 0;
    }
    player.var_e7faf08f327b0fb5 = player.var_e7faf08f327b0fb5 + namespace_b66505f20cbf2570::function_160a29300ce1e14(var_fec4228317afe4ff, player);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x91ba
// Size: 0x4a1
function function_baeceec743d9a737(player, items, cash, method, var_4fc750f6108a10ab) {
    if (!function_6f6cc16c0528de5b(player)) {
        return;
    }
    var_a95035097821e2d1 = [];
    var_2a1283e22f4e4aa8 = 0;
    method = namespace_aad14af462a74d08::function_6d40f12a09494350(method, function_e2ff8f4b4e94f723(#"hash_2af1f13aa6ae3b5f", #"extract"));
    foreach (item in items) {
        ref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(item.lootid);
        var_25978461c6e4f61b = level.br_pickups.var_838863c4848d4c26[ref];
        itemtype = undefined;
        if (isdefined(var_25978461c6e4f61b)) {
            itemtype = level.br_pickups.br_itemtype[var_25978461c6e4f61b];
        }
        quantity = item.quantity;
        if (!isdefined(item.quantity)) {
            quantity = 1;
        }
        source = 0;
        if (isdefined(item.var_e1147886ccf51970) && isdefined(player.team) && item.var_e1147886ccf51970 != player.team) {
            source = namespace_aad14af462a74d08::function_6d40f12a09494350(source, function_e2ff8f4b4e94f723(#"hash_570fd18b83e115ad", #"enemy_player"));
        }
        lootid = item.lootid;
        if (isdefined(item.objweapon)) {
            var_49d6c5a42ebcf947 = namespace_3bbb5a98b932c46f::function_7a91162092cc11ec(lootid);
            if (isdefined(var_49d6c5a42ebcf947)) {
                lootid = var_49d6c5a42ebcf947;
            }
        }
        namespace_aad14af462a74d08::function_d24138b32084fc3e(player, lootid, undefined, method, quantity, source);
        if (isdefined(itemtype) && (itemtype == #"lethal" || itemtype == #"tactical")) {
            if (!isdefined(var_a95035097821e2d1[ref])) {
                function_8359cadd253f9604(player, "unique_grenade_extract", quantity);
                var_a95035097821e2d1[ref] = 1;
            }
        }
        if (isdefined(item.objweapon) && isdefined(item.metadata)) {
            var_3f6103d9666b07cc = namespace_a38a2e1fe7519183::function_36275388f9093535(item.metadata);
            if (isdefined(var_3f6103d9666b07cc) && var_3f6103d9666b07cc.team != player.team) {
                function_8359cadd253f9604(var_3f6103d9666b07cc, "player_extracted_your_insured_weapon", 1);
            }
        }
        var_927cf275793e815b = namespace_aad14af462a74d08::function_ce112254f7cba89e(item.objweapon);
        if (isdefined(var_927cf275793e815b) && var_927cf275793e815b != 0) {
            attachments = getweaponattachments(item.objweapon);
            var_51dbe1a1c3d8bf04 = function_6527364c1ecca6c6(item.objweapon);
            var_2cb723804483d204 = array_remove_array(attachments, var_51dbe1a1c3d8bf04);
            if (var_2cb723804483d204.size >= 3) {
                function_8359cadd253f9604(player, "extract_3_attachment_weapon", 1);
            }
        }
        if (isdefined(item.objweapon) && item.objweapon issilenced()) {
            function_8359cadd253f9604(player, "extract_with_silenced_weapons", 1);
        }
        if (isdefined(item.objweapon) && isdefined(item.objweapon.basename) && isdefined(item.objweapon.camo) && item.objweapon.basename == "iw9_pi_decho_mp" && item.objweapon.camo == "camo_comp_01") {
            function_8359cadd253f9604(player, "extracted_gold_decho", 1);
        }
    }
    namespace_aad14af462a74d08::function_d24138b32084fc3e(player, 8395, undefined, method, cash);
    var_fec4228317afe4ff = player.plundercount;
    if (!namespace_aead94004cf4c147::function_c4f1bd7a01a307fa(player)) {
        var_fec4228317afe4ff = player.plundercount + player namespace_512200f0f9e6ebc9::function_e2f4f470c55123b8(items);
    } else {
        var_fec4228317afe4ff = var_fec4228317afe4ff + namespace_a8b2b88699fc40fb::function_baf5e17d7033a223(player);
    }
    if (istrue(var_4fc750f6108a10ab)) {
        player.var_fec4228317afe4ff = var_fec4228317afe4ff;
    }
    player dlog_recordplayerevent("dlog_event_dmz_exfil_cash", [0:"cash_amount", 1:var_fec4228317afe4ff]);
    if (var_fec4228317afe4ff >= 20000) {
        function_8359cadd253f9604(player, "big_cash_extract", 1);
    }
    return var_fec4228317afe4ff;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9663
// Size: 0x2e
function function_68d841f5bc2dd2b6(player, cache) {
    if (!function_6f6cc16c0528de5b(player)) {
        return;
    }
    function_8359cadd253f9604(player, "loot_cache", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x9698
// Size: 0x107
function private onopensupplydrop(player, cache, items) {
    if (!function_6f6cc16c0528de5b(player)) {
        return items;
    }
    if (!isdefined(player) || !isdefined(cache) || !isdefined(player.team)) {
        return items;
    }
    if (isdefined(cache.type) && cache.type == "dmz_supply_drop_samsite" && function_c5e0bac8f123cc88(player.team, function_16ae6d8b5f25f31b("samsite_supply_box"))) {
        items[items.size] = "interactable_note_anti_air";
    }
    if (isdefined(cache.used) && isdefined(cache.used[player.team])) {
        return items;
    }
    if (!isdefined(cache.used)) {
        cache.used = [];
    }
    cache.used[player.team] = 1;
    function_8359cadd253f9604(player, "loot_supply_drop", 1);
    return items;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x97a7
// Size: 0x177
function function_1d1df26df05a6c8(door, player) {
    if (!function_6f6cc16c0528de5b(player)) {
        return;
    }
    if (!isdefined(player) || !isdefined(player.team) || !isdefined(door) || !isplayer(player)) {
        return;
    }
    if (!isdefined(door.keyname) || istrue(door.var_fc580acbd61da738)) {
        return;
    }
    if (door.keyname == "fortress") {
        function_8359cadd253f9604(player, "unlock_stronghold", 1);
        function_70abd486ae26235(player, "unlock_stronghold", 1);
        function_f7d8054ae05de10f(door, player);
        return;
    }
    if (!isdefined(level.var_b99bdead5a1bf81b)) {
        level.var_b99bdead5a1bf81b = [];
    }
    if (isdefined(level.var_b99bdead5a1bf81b[door.keyname])) {
        return;
    }
    level.var_b99bdead5a1bf81b[door.keyname] = 1;
    switch (door.keyname) {
    case #"hash_95b1732f27550d94":
        function_8359cadd253f9604(player, "unlock_room_2", 1);
        break;
    case #"hash_6ff139daaf7185ef":
        function_8359cadd253f9604(player, "unlock_crane_building_base", 1);
        break;
    case #"hash_811692793cef2bfa":
        function_8359cadd253f9604(player, "unlock_skeleton_key", 1);
        break;
    default:
        break;
    }
    function_8359cadd253f9604(player, "unlocked_door", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9925
// Size: 0x4b
function function_f00aa0c3b58c13f2(cache, player) {
    if (!function_6f6cc16c0528de5b(player)) {
        return;
    }
    if (!isdefined(player) || !isdefined(player.team) || !isdefined(cache)) {
        return;
    }
    function_8359cadd253f9604(player, "unlocked_door", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9977
// Size: 0x1f6
function function_d10645afed0f00fe(player, poi) {
    if (!function_6f6cc16c0528de5b(player)) {
        return;
    }
    if (isdefined(level.squaddata)) {
        if (isalive(player) && player.sessionstate == "playing") {
            poisvisited = squads::function_2026e82470c5c89f(player.team, player.var_ff97225579de16a, "poisVisited");
        }
    } else {
        poisvisited = teams::getteamdata(player.team, "poisVisited");
    }
    if (isdefined(poisvisited)) {
        if (!isdefined(poisvisited[poi])) {
            function_8359cadd253f9604(player, "poi_travel", 1);
            poisvisited[poi] = 1;
            if (isdefined(level.squaddata)) {
                squads::function_a20a10ce593f692b(player.team, player.var_ff97225579de16a, "poisVisited", poisvisited);
                players = level.squaddata[player.team][player.var_ff97225579de16a].players;
            } else {
                teams::setteamdata(player.team, "poisVisited", poisvisited);
                players = namespace_54d20dd0dd79277f::getteamdata(player.team, "players");
            }
            foreach (ent in players) {
                ent namespace_48a08c5037514e04::doscoreevent(#"hash_3b0b5b72c38e1a56");
            }
        }
    }
    if (player namespace_aead94004cf4c147::gettotalitemcountinbag(11200) > 0) {
        function_187f4232dcd3b0e9(player, poi);
    }
    if (isdefined(player.vehicle) && player.vehicle.vehiclename == "veh9_acv_6x6") {
        function_88d8597beafdd628(player, poi);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9b74
// Size: 0x145
function onvehicleenter(player, vehicle) {
    if (!function_6f6cc16c0528de5b(player)) {
        return;
    }
    vehiclename = vehicle.vehiclename;
    if (isdefined(level.squaddata)) {
        vehiclesentered = squads::function_2026e82470c5c89f(player.team, player.var_ff97225579de16a, "vehiclesEntered");
        if (!isdefined(vehiclesentered[vehiclename])) {
            function_8359cadd253f9604(player, "unique_vehicle_pilot", 1);
            vehiclesentered[vehiclename] = 1;
            squads::function_a20a10ce593f692b(player.team, player.var_ff97225579de16a, "vehiclesEntered", vehiclesentered);
        }
    } else {
        vehiclesentered = teams::getteamdata(player.team, "vehiclesEntered");
        if (!isdefined(vehiclesentered[vehiclename])) {
            function_8359cadd253f9604(player, "unique_vehicle_pilot", 1);
            vehiclesentered[vehiclename] = 1;
            teams::setteamdata(player.team, "vehiclesEntered", vehiclesentered);
        }
    }
    if (vehiclename == "veh9_civ_lnd_dirt_bike") {
        function_8359cadd253f9604(player, "enter_dirt_bike", 1);
    }
    if (vehiclename == "veh9_mil_lnd_mrap" && !vehicle namespace_1fbd40990ee60ede::function_72f871bf74995298()) {
        function_7fc83d63a85c14d(player);
    }
    thread function_b55402e6d4fae450(vehicle);
    thread function_494cf678a5b30f9e(player, vehiclename);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9cc0
// Size: 0x2d
function onvehicleoutoffuel(player) {
    if (!isdefined(player) || !function_6f6cc16c0528de5b(player)) {
        return;
    }
    function_8359cadd253f9604(player, "gas_drain", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9cf4
// Size: 0x225
function onvehiclefullrefuelandrepair(vehicle, var_c75620ca74d2e522) {
    owner = vehicle.owner;
    if (!isdefined(owner) || !isdefined(owner.guid) || !isdefined(owner.team) || !function_6f6cc16c0528de5b(owner)) {
        return;
    }
    if (!isdefined(level.var_e4f4c5fe8bc2228f)) {
        level.var_e4f4c5fe8bc2228f = [];
    }
    if (!isdefined(level.var_e4f4c5fe8bc2228f[owner.team])) {
        level.var_e4f4c5fe8bc2228f[owner.team] = [];
    }
    if (!isdefined(level.var_f1cb112868cffc8)) {
        level.var_f1cb112868cffc8 = [];
    }
    if (!isdefined(level.var_f1cb112868cffc8[owner.team])) {
        level.var_f1cb112868cffc8[owner.team] = [];
    }
    if (!array_contains(level.var_e4f4c5fe8bc2228f[owner.team], var_c75620ca74d2e522)) {
        level.var_e4f4c5fe8bc2228f[owner.team][level.var_e4f4c5fe8bc2228f[owner.team].size] = var_c75620ca74d2e522;
        function_8359cadd253f9604(owner, "unique_full_gas_and_repair", 1);
    }
    if (!array_contains(level.var_f1cb112868cffc8[owner.team], vehicle)) {
        level.var_f1cb112868cffc8[owner.team][level.var_f1cb112868cffc8[owner.team].size] = vehicle;
        function_8359cadd253f9604(owner, "unique_vehicle_refuel_repair", 1);
        if (isdefined(vehicle.vehiclename)) {
            if (vehicle.vehiclename == "veh9_jltv_mg" || vehicle.vehiclename == "veh9_patrol_boat") {
                function_8359cadd253f9604(owner, "full_gas_and_repair_cargo_vehicle", 1);
            }
            if (vehicle.vehiclename == "veh9_mil_cargo_truck") {
                function_8359cadd253f9604(owner, "cargo_truck_refuel_repair", 1);
            }
        }
        if (vehicle namespace_1f188a13f7e79610::function_7c62ca52f72901a1()) {
            function_8359cadd253f9604(owner, "boat_refuel_repair", 1);
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f20
// Size: 0x6b
function function_719e931249c15652(vehicle) {
    owner = vehicle.var_628a2eba2e3d4af4;
    if (!isdefined(owner) || !function_6f6cc16c0528de5b(owner) || istrue(vehicle.var_2e64c6e32cba0a75)) {
        return;
    }
    vehicle.var_2e64c6e32cba0a75 = 1;
    if (!vehicle namespace_1f188a13f7e79610::function_b7148a3bfc4defb2()) {
        function_8359cadd253f9604(owner, "kill_vehicle_with_train", 1);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f92
// Size: 0xbf
function ongrenadeused(grenade, player, var_49e6ef3edadd524e) {
    if (!function_6f6cc16c0528de5b(player) || !isdefined(player)) {
        return;
    }
    switch (var_49e6ef3edadd524e) {
    case #"hash_333525cef39d0c66":
    case #"hash_5d11ac1131cddab1":
    case #"hash_7c03088193266bc4":
    case #"hash_8670ac083666f3a4":
    case #"hash_9d57562863499a06":
    case #"hash_a0319e349a692b8f":
    case #"hash_d9108a0595d7d0b9":
    case #"hash_fa1e80f6bd5b8e72":
    case #"hash_fb36696c0708bf42":
        thread function_f37f5d719bc2f2f0(grenade, player);
        break;
    default:
        break;
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa058
// Size: 0x7a
function function_5d2504919b717097(owner, victim) {
    if (!function_6f6cc16c0528de5b(owner) || !isdefined(victim) || !isdefined(victim.origin)) {
        return;
    }
    if (isagent(victim)) {
        var_831b0df5dbb687cf = namespace_9823ee6035594d67::function_c0a211a69f5f8f2f(victim.origin);
        if (isdefined(var_831b0df5dbb687cf) && namespace_9823ee6035594d67::function_771f278c8c749a28(var_831b0df5dbb687cf)) {
            function_8359cadd253f9604(owner, "snapshot_in_locked_stronghold", 1);
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa0d9
// Size: 0x80
function function_815a3dcb943176b3(owner, victim) {
    if (!isdefined(owner) || !function_6f6cc16c0528de5b(owner) || !isdefined(victim)) {
        return;
    }
    if (isdefined(victim.agent_type)) {
        subcategory = function_f3bb4f4911a1beb2("ai_mp_controller", "agentPers_getAgentPersData", victim, "subcategory");
        if (function_c7496288999ac847(victim.agent_type, subcategory)) {
            function_8359cadd253f9604(owner, "photograph_cartel", 1);
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa160
// Size: 0x58
function function_2910bc79a4d8427b(owner, victim) {
    if (!isdefined(owner) || !function_6f6cc16c0528de5b(owner) || !isdefined(victim)) {
        return;
    }
    if (isagent(victim)) {
        if (namespace_7789f919216d38a2::function_76ef3c8b8171d2d(victim.origin)) {
            function_8359cadd253f9604(owner, "tag_enemy_in_radiation", 1);
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa1bf
// Size: 0xa6
function function_c0a3853f9497fad3(var_1a38f515390a5144) {
    if (isdefined(var_1a38f515390a5144.reviver) && isdefined(var_1a38f515390a5144.reviver)) {
        if (isdefined(var_1a38f515390a5144.reviver.team) && isdefined(var_1a38f515390a5144.revivee.team) && var_1a38f515390a5144.reviver.team != var_1a38f515390a5144.revivee.team) {
            function_8359cadd253f9604(var_1a38f515390a5144.reviver, "stim_enemy_player", 1);
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa26c
// Size: 0xd8
function function_b71395f12af20a42(instance) {
    function_a9f8fa06a358585b(instance.owningteam, "samsite", 1, instance.poi, 1);
    var_a497d0881ebbdf71 = 0;
    foreach (samsite in level.var_cf3feeaa65a4e3f0) {
        if (isdefined(samsite.owningteam) && samsite.owningteam == instance.owningteam) {
            var_a497d0881ebbdf71++;
        }
    }
    if (var_a497d0881ebbdf71 >= 3) {
        function_8a7a2427622e7572(instance.owningteam, "sync_samsite_control", 1);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa34b
// Size: 0x25
function function_19d6e799236e4435(instance) {
    function_8a7a2427622e7572(instance.owningteam, "plane_shot_down", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa377
// Size: 0x2e2
function function_da13a73169d19313(ref) {
    switch (ref) {
    case #"hash_f4a9126c03d3385b":
        return namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"activity_type", #"domination");
    case #"hash_e91729d4ef79ca26":
        return namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"activity_type", #"hash_cdf1fcaae0c7f5c3");
    case #"hash_75b6db03edb1e84e":
        return namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"activity_type", #"elimination");
    case #"hash_82ea0e6e4f123b62":
        return namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"activity_type", #"trap");
    case #"hash_e0b82e0f064c17d6":
        return namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"activity_type", #"hostage");
    case #"hash_9db32d30f2603c35":
        return namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"activity_type", #"vehicledrive");
    case #"hash_37bb23543c319104":
        return namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"activity_type", #"hunt");
    case #"hash_1e754eb11fa62651":
        return namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"activity_type", #"hash_25075d6eb94d7c51");
    case #"hash_cf3abe09f0094696":
        return namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"activity_type", #"demolition");
    case #"hash_c5a5568c914ba427":
        return namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"activity_type", #"samsite");
    case #"hash_9682e089e580b4b8":
        return namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"activity_type", #"safe");
    case #"hash_7e9cf92ed0a526f1":
        return namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"activity_type", #"bomb");
    case #"hash_890e226c519dc6ab":
        return namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"activity_type", #"hash_3cfb50e48ebdfe5b");
    case #"hash_218ddcea32fa5fbc":
        return namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"activity_type", #"hacker_phone");
    case #"hash_be386dc37be6968e":
        return namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"activity_type", #"supply");
    case #"hash_88570f89de3f4680":
        return namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"activity_type", #"hash_f75ced18b5176da0");
    case #"hash_4f62da1c4ed6f790":
        return namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"activity_type", #"convoy_attack");
    case #"hash_5c317bf7b4be6e08":
        return namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"activity_type", #"hash_81ebff92b418d2c8");
    case #"hash_2a58b3d6862b2cdf":
        return namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"activity_type", #"train_safe");
    default:
        return undefined;
        break;
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa660
// Size: 0x1e3
function function_a9f8fa06a358585b(var_2e0bdb36f81a37e4, var_fa7850d42f71a2ad, var_2c900ddf3b37aa0b, poi, var_a7828126a34279e8) {
    var_e2b2bbd9e6539f11 = teams::getteamdata(var_2e0bdb36f81a37e4, "players");
    if (var_e2b2bbd9e6539f11.size == 0) {
        return;
    }
    var_3f96767f60a1d2c = function_da13a73169d19313(var_fa7850d42f71a2ad);
    if (!isdefined(var_3f96767f60a1d2c)) {
        return;
    }
    var_af0662d6485d5d58 = namespace_aad14af462a74d08::function_6d40f12a09494350(0, var_3f96767f60a1d2c);
    if (istrue(var_2c900ddf3b37aa0b)) {
        foreach (player in var_e2b2bbd9e6539f11) {
            if (!function_6f6cc16c0528de5b(player)) {
                continue;
            }
            namespace_aad14af462a74d08::function_2635cdb5e985eaab(player, var_af0662d6485d5d58, poi);
        }
        if (istrue(var_a7828126a34279e8)) {
            return;
        }
        if (!isdefined(level.var_48cd656af1746262)) {
            level.var_48cd656af1746262 = [];
        }
        if (!isdefined(level.var_48cd656af1746262[var_2e0bdb36f81a37e4])) {
            level.var_48cd656af1746262[var_2e0bdb36f81a37e4] = [];
        }
        if (isdefined(poi)) {
            if (!isdefined(level.var_48cd656af1746262[var_2e0bdb36f81a37e4][poi])) {
                level.var_48cd656af1746262[var_2e0bdb36f81a37e4][poi] = 1;
                function_8a7a2427622e7572(var_2e0bdb36f81a37e4, "contract_complete_unique_poi", 1);
            }
        }
        if (!isdefined(level.var_48cd656af1746262[var_2e0bdb36f81a37e4][var_fa7850d42f71a2ad])) {
            level.var_48cd656af1746262[var_2e0bdb36f81a37e4][var_fa7850d42f71a2ad] = 1;
            function_8a7a2427622e7572(var_2e0bdb36f81a37e4, "contract_complete_unique_contract", 1);
        }
    } else {
        foreach (player in var_e2b2bbd9e6539f11) {
            if (!function_6f6cc16c0528de5b(player)) {
                continue;
            }
            namespace_aad14af462a74d08::function_affb3af6af110594(player, var_af0662d6485d5d58, poi);
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa84a
// Size: 0x97
function function_63fedb7f004da23b(attackers) {
    if (!function_cff2f4f168b29b81()) {
        return;
    }
    var_42f8055b028ea2e0 = [];
    foreach (attacker in attackers) {
        if (!isdefined(var_42f8055b028ea2e0[attacker.team])) {
            var_42f8055b028ea2e0[attacker.team] = 1;
            function_8359cadd253f9604(attacker, "squad_wipe", 1);
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa8e8
// Size: 0x25
function function_5e98eb5de21b3a8c(player) {
    if (!function_cff2f4f168b29b81()) {
        return;
    }
    function_8359cadd253f9604(player, "hacked_wheelson", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xa914
// Size: 0x116
function private onrequestteamassimilate(player, validplayers) {
    if (!function_cff2f4f168b29b81()) {
        return;
    }
    if (!isdefined(level.var_8b67a807d9dd822c)) {
        level.var_8b67a807d9dd822c = [];
    }
    if (!isdefined(level.var_8b67a807d9dd822c[player.guid])) {
        level.var_8b67a807d9dd822c[player.guid] = [];
    }
    foreach (var_3c142a00b5cb6976 in validplayers) {
        if (!isdefined(var_3c142a00b5cb6976.guid) || isdefined(level.var_8b67a807d9dd822c[player.guid][var_3c142a00b5cb6976.guid])) {
            continue;
        }
        level.var_8b67a807d9dd822c[player.guid][var_3c142a00b5cb6976.guid] = 1;
        function_8359cadd253f9604(player, "request_assimilation", 1);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaa31
// Size: 0x26
function onpingcontractphone(player) {
    if (!function_6f6cc16c0528de5b(player)) {
        return;
    }
    function_8359cadd253f9604(player, "ping_contract_phone", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa5e
// Size: 0x34
function function_58d9b223aaf4966c(fortress) {
    name = fortress.name;
    if (isdefined(name)) {
        return ("cleared_" + name);
    }
    return "";
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa9a
// Size: 0x13b
function function_59fe5e0d7d5e7947(player, fortress) {
    if (!function_6f6cc16c0528de5b(player)) {
        return;
    }
    if (namespace_9823ee6035594d67::function_4ec4f39a2e1745f2(fortress)) {
        if (!isdefined(fortress.name)) {
            /#
                assertmsg("Fortress at " + namespace_448ccf1ca136fbbe::function_d5ad0ebc9d8935b6(fortress.origin) + " doesn't have a defined name!");
            #/
            return;
        }
        ref = function_58d9b223aaf4966c(fortress);
        function_8359cadd253f9604(player, ref, 1);
        if (fortress.name == "delta_firestation" && isdefined(player.team)) {
            players = namespace_54d20dd0dd79277f::getteamdata(player.team, "players");
            foreach (teammate in players) {
                if (teammate namespace_aead94004cf4c147::function_d63a7299c6203bf9(29299)) {
                    function_8359cadd253f9604(player, "cleared_fire_station_with_weapon_case", 1);
                    break;
                }
            }
        }
    } else {
        function_8359cadd253f9604(player, "clear_stronghold", 1);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xabdc
// Size: 0x172
function onuavtowerused(player, index) {
    if (!function_6f6cc16c0528de5b(player)) {
        return;
    }
    if (!isdefined(player.var_9cd3a5a67fcd8a9a)) {
        player.var_9cd3a5a67fcd8a9a = [];
    }
    if (!istrue(player.var_9cd3a5a67fcd8a9a[index])) {
        function_d6fab9bc69a92a51(player);
        if (player namespace_aead94004cf4c147::function_d63a7299c6203bf9(29299)) {
            function_8359cadd253f9604(player, "uav_tower_use_with_weapon_case", 1);
        }
        function_8359cadd253f9604(player, "uav_tower", 1);
        player.var_9cd3a5a67fcd8a9a[index] = 1;
    }
    if (isdefined(level.var_116a5f32aeb86391) && isdefined(player.team)) {
        var_f7df47f85b931da = 0;
        foreach (tower in level.var_116a5f32aeb86391) {
            if (isdefined(tower.var_dcc5f31ec71d6d8a) && tower.var_dcc5f31ec71d6d8a == player.team) {
                var_f7df47f85b931da++;
            }
        }
        if (var_f7df47f85b931da >= 5) {
            function_8a7a2427622e7572(player.team, "sync_uav_tower_control", 1);
        }
        if (var_f7df47f85b931da >= 2) {
            function_8a7a2427622e7572(player.team, "two_uav_tower_active_at_once", 1);
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad55
// Size: 0x2e
function function_3d12fce128d424b1(player, instance) {
    if (!function_6f6cc16c0528de5b(player)) {
        return;
    }
    function_8359cadd253f9604(player, "agent_radio_used", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad8a
// Size: 0x4ee
function function_aff49e563a741f1e(victim, player, objweapon) {
    if (!isdefined(player) || !function_6f6cc16c0528de5b(player)) {
        return;
    }
    if (isdefined(objweapon)) {
        weaponclass = weaponclass(objweapon);
        if (weaponclass == "spread" && isdefined(player.var_da28916e7827af7c) && player.var_da28916e7827af7c == "saba_hydro") {
            function_8359cadd253f9604(player, "hydro_shotgun_ai", 1);
        } else if (weaponclass == "rifle" && isdefined(player.var_da28916e7827af7c) && player.var_da28916e7827af7c == "saba_oilfield") {
            function_8359cadd253f9604(player, "oilfield_sniper_ai", 1);
        }
    }
    if (isdefined(level.var_a68dcd3b5a82712d)) {
        foreach (struct in level.var_a68dcd3b5a82712d) {
            dist = distance2d(struct.origin, victim.origin);
            if (dist <= struct.radius) {
                function_8359cadd253f9604(player, "killed_under_agent_radio", 1);
            }
        }
    }
    if (isdefined(level.var_116a5f32aeb86391) && isdefined(player.team)) {
        foreach (instance in level.var_116a5f32aeb86391) {
            if (isdefined(instance.var_dcc5f31ec71d6d8a) && instance.var_dcc5f31ec71d6d8a == player.team) {
                dist = distance2d(instance.origin, victim.origin);
                if (dist <= level.var_6acf91bbf5273e8f) {
                    function_8359cadd253f9604(player, "kill_under_uav_tower", 1);
                }
            }
        }
    }
    if (isdefined(player) && isdefined(player.team)) {
        if (isdefined(victim.agentstruct) && isdefined(victim.agentstruct.fortress)) {
            if (!isdefined(level.var_6ba2db37df87088e)) {
                level.var_6ba2db37df87088e = [];
            }
            var_dd070161709fa76 = "brloot_legion_deal_intel";
            if (namespace_36f464722d326bbe::function_ee0c2958aa2ee59e()) {
                var_dd070161709fa76 = "brloot_aq_bunker_note";
            }
            if (!isdefined(level.var_6ba2db37df87088e[player.team])) {
                level.var_6ba2db37df87088e[player.team] = 1;
                namespace_bfef6903bca5845d::function_63a043d47490f90d(victim, var_dd070161709fa76);
            } else {
                namespace_bfef6903bca5845d::function_63a043d47490f90d(victim, var_dd070161709fa76, undefined, 0.25);
            }
            if (namespace_86b52005c685dfb9::function_17b2ecdae3a795f6(victim)) {
                if (!isdefined(level.var_686c3d79c097cb9e)) {
                    level.var_686c3d79c097cb9e = [];
                }
                var_dd070161709fa76 = "brloot_valuable_konni_ledger";
                if (!isdefined(level.var_686c3d79c097cb9e[player.team])) {
                    level.var_686c3d79c097cb9e[player.team] = 1;
                    namespace_bfef6903bca5845d::function_63a043d47490f90d(victim, var_dd070161709fa76);
                } else {
                    namespace_bfef6903bca5845d::function_63a043d47490f90d(victim, var_dd070161709fa76, undefined, 0.25);
                }
            }
        } else if (namespace_86b52005c685dfb9::function_17b2ecdae3a795f6(victim)) {
            if (namespace_36f464722d326bbe::function_ffbbb4525b11d5a2()) {
                var_dd070161709fa76 = "brloot_note_extraction_protocol";
                namespace_bfef6903bca5845d::function_63a043d47490f90d(victim, var_dd070161709fa76, undefined, 0.1);
            } else if (namespace_86b52005c685dfb9::function_35cc816aceeeb402(victim)) {
                if (!isdefined(level.var_97f6dfd8f1a1cde8)) {
                    level.var_97f6dfd8f1a1cde8 = [];
                }
                var_dd070161709fa76 = "brloot_valuable_battle_notes";
                if (!isdefined(level.var_97f6dfd8f1a1cde8[player.team])) {
                    level.var_97f6dfd8f1a1cde8[player.team] = 1;
                    namespace_bfef6903bca5845d::function_63a043d47490f90d(victim, var_dd070161709fa76);
                } else {
                    namespace_bfef6903bca5845d::function_63a043d47490f90d(victim, var_dd070161709fa76, undefined, 0.1);
                }
            }
        }
    }
    if (isdefined(objweapon)) {
        player.var_5394c1bb15bee8f8 = function_53c4c53197386572(player.var_5394c1bb15bee8f8, []);
        var_50aa84b69780e0f7 = 0;
        foreach (oldweapon in player.var_5394c1bb15bee8f8) {
            if (issameweapon(objweapon, oldweapon)) {
                var_50aa84b69780e0f7 = 1;
                break;
            }
        }
        if (!var_50aa84b69780e0f7) {
            player.var_5394c1bb15bee8f8 = array_add(player.var_5394c1bb15bee8f8, objweapon);
            function_8359cadd253f9604(player, "kill_AI_unique_weapon", 1);
        }
    }
    function_634368e310edf6f9(player, objweapon);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xb27f
// Size: 0x21a
function function_398906218a0dd7da(player, victim, objweapon, modifiers) {
    if (!isdefined(player) || !function_6f6cc16c0528de5b(player)) {
        return;
    }
    if (isdefined(objweapon)) {
        var_927cf275793e815b = namespace_aad14af462a74d08::function_ce112254f7cba89e(objweapon);
        if (isdefined(var_927cf275793e815b) && var_927cf275793e815b != 0) {
            function_e06a127b0dd6af8(player, var_927cf275793e815b);
        }
    }
    bitarray = namespace_aad14af462a74d08::function_3005ef56488df9be(modifiers);
    if (isdefined(bitarray) && isdefined(bitarray[namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"vehiclesurf")])) {
        var_d4e556c137e61b46 = player;
        while (1) {
            if ((isplayer(var_d4e556c137e61b46) || isactor(var_d4e556c137e61b46)) && !var_d4e556c137e61b46 islinked()) {
                var_acf3eb2af5579d05 = var_d4e556c137e61b46 getmovingplatformparent(1);
            } else {
                var_acf3eb2af5579d05 = var_d4e556c137e61b46 getlinkedparent();
            }
            if (!isdefined(var_acf3eb2af5579d05)) {
                break;
            }
            var_d4e556c137e61b46 = var_acf3eb2af5579d05;
        }
        if (isdefined(var_d4e556c137e61b46) && var_d4e556c137e61b46 namespace_1f188a13f7e79610::isvehicle()) {
            driver = namespace_1fbd40990ee60ede::vehicle_occupancy_getdriver(var_d4e556c137e61b46);
            if (isdefined(driver) && isdefined(driver.team) && isplayer(driver)) {
                if (driver.team != player.team && (!isplayer(victim) || driver.team != victim.team)) {
                    function_8359cadd253f9604(driver, "enemy_operator_killed_enemies_from_your_vehicle", 1);
                }
            }
        }
    }
    if (isdefined(player.var_abd157413ac4e022)) {
        driver = namespace_1fbd40990ee60ede::vehicle_occupancy_getdriver(player.var_abd157413ac4e022);
        if (isdefined(driver) && isdefined(driver.team) && isplayer(driver)) {
            if (driver.team != player.team && (!isplayer(victim) || driver.team != victim.team)) {
                function_8359cadd253f9604(driver, "enemy_operator_killed_enemies_from_your_vehicle", 1);
            }
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb4a0
// Size: 0xfe
function function_e06a127b0dd6af8(player, var_927cf275793e815b) {
    if (!isdefined(player.var_3b6f247ff290f31a)) {
        player.var_3b6f247ff290f31a = [];
    }
    if (!isdefined(player.var_3b6f247ff290f31a[var_927cf275793e815b])) {
        player.var_3b6f247ff290f31a[var_927cf275793e815b] = 1;
        players = teams::getteamdata(player.team, "players");
        foreach (var_736d8d9188ccbd45 in players) {
            if (isdefined(var_736d8d9188ccbd45) && var_736d8d9188ccbd45 != player) {
                if (!isdefined(var_736d8d9188ccbd45.var_3b6f247ff290f31a)) {
                    var_736d8d9188ccbd45.var_3b6f247ff290f31a = [];
                }
                var_736d8d9188ccbd45.var_3b6f247ff290f31a[var_927cf275793e815b] = 1;
            }
        }
        function_8359cadd253f9604(player, "kill_unique_weapon_class", 1);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb5a5
// Size: 0x105
function function_22024087c0855cde() {
    if (!isdefined(level.var_a7b62649c81b481a) || !isdefined(level.var_a7b62649c81b481a.var_acc161de36707de2)) {
        return;
    }
    if (!function_cff2f4f168b29b81()) {
        return;
    }
    var_b3a1d6972f2a160c = level.var_a7b62649c81b481a.var_acc161de36707de2;
    var_444a5451f436094a = "";
    if (var_b3a1d6972f2a160c == 2) {
        var_444a5451f436094a = "lpcon_bravo";
    } else if (var_b3a1d6972f2a160c == 3) {
        var_444a5451f436094a = "lpcon_charlie";
    } else if (var_b3a1d6972f2a160c == 4) {
        var_444a5451f436094a = "lpcon_delta";
    } else if (var_b3a1d6972f2a160c == 5) {
        var_444a5451f436094a = "lpcon_echo";
    }
    if (var_444a5451f436094a != "") {
        foreach (player in level.players) {
            function_8359cadd253f9604(player, var_444a5451f436094a, 1);
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb6b1
// Size: 0x174
function function_7184abfe5941a710(player, var_1cb2654b9d2b112a) {
    if (!isdefined(player) || !isdefined(player.br_kiosk)) {
        return;
    }
    kiosk = player.br_kiosk;
    if (!isdefined(level.var_b434bb6b1c80514)) {
        level.var_b434bb6b1c80514 = [];
    }
    if (!isdefined(level.var_b434bb6b1c80514[player.team])) {
        level.var_b434bb6b1c80514[player.team] = [];
    }
    if (!isdefined(level.var_b434bb6b1c80514[player.team][kiosk.index])) {
        var_836acb10d08e768b = spawnstruct();
        var_836acb10d08e768b.var_1cb2654b9d2b112a = 0;
        var_836acb10d08e768b.var_e993c350422f112f = 0;
        level.var_b434bb6b1c80514[player.team][kiosk.index] = var_836acb10d08e768b;
    }
    var_836acb10d08e768b = level.var_b434bb6b1c80514[player.team][kiosk.index];
    var_836acb10d08e768b.var_1cb2654b9d2b112a = var_836acb10d08e768b.var_1cb2654b9d2b112a + var_1cb2654b9d2b112a;
    if (var_836acb10d08e768b.var_1cb2654b9d2b112a >= 600 && !var_836acb10d08e768b.var_e993c350422f112f) {
        function_8359cadd253f9604(player, "spend_cash_unique_buy_station", 1);
        var_836acb10d08e768b.var_e993c350422f112f = 1;
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb82c
// Size: 0xa5
function onitemsold(player, var_6e36889d56716c4) {
    if (!isdefined(player)) {
        return;
    }
    if (!isdefined(level.var_47cafadb8da5a0b2)) {
        level.var_47cafadb8da5a0b2 = [];
    }
    if (!isdefined(level.var_47cafadb8da5a0b2[player.team])) {
        level.var_47cafadb8da5a0b2[player.team] = [];
    }
    if (!isdefined(level.var_47cafadb8da5a0b2[player.team][var_6e36889d56716c4])) {
        level.var_47cafadb8da5a0b2[player.team][var_6e36889d56716c4] = 1;
        function_8359cadd253f9604(player, "sell_unique_valuable", 1);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb8d8
// Size: 0x7c
function function_8a7a2427622e7572(team, type, quantity) {
    if (isdefined(team)) {
        foreach (var_736d8d9188ccbd45 in teams::getteamdata(team, "players")) {
            function_8359cadd253f9604(var_736d8d9188ccbd45, type, quantity, 0);
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xb95b
// Size: 0x1b
function private function_a269616a6f117980() {
    level.var_b4973b15ead7e660 = function_f159c10d5cf8f0b4("trigger_hydro_waterwell", "script_noteworthy");
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0xb97d
// Size: 0x108
function private ongasgrenadeexplode(position, owner, team) {
    if (!isdefined(level.var_b4973b15ead7e660) || level.var_b4973b15ead7e660.size == 0) {
        return;
    }
    position = position - (0, 0, 100);
    foreach (well in level.var_b4973b15ead7e660) {
        if (!ispointinvolume(position, well)) {
            continue;
        }
        if (isdefined(well.used) && isdefined(well.used[team])) {
            continue;
        }
        if (!isdefined(well.used)) {
            well.used = [];
        }
        well.used[team] = 1;
        function_8359cadd253f9604(owner, "gas_grenade_in_hydro_well", 1);
        break;
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0xba8c
// Size: 0x3b
function private onentermediumbird(vehicle, seatid, var_fc7c7a874b43a31a, player, data) {
    function_8359cadd253f9604(player, "enter_medium_bird", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xbace
// Size: 0x13a
function private function_b46e6500bef678bc() {
    var_4d9fc05439d5c39f = function_f159c10d5cf8f0b4("trigger_lone_helipad", "script_noteworthy");
    if (!isdefined(var_4d9fc05439d5c39f) || var_4d9fc05439d5c39f.size == 0) {
        return;
    }
    helipad = var_4d9fc05439d5c39f[0];
    while (1) {
        ent = helipad waittill("trigger");
        if (!ent namespace_1f188a13f7e79610::isvehicle()) {
            continue;
        }
        if (ent namespace_1f188a13f7e79610::function_d93ec4635290febd() != "little_bird") {
            continue;
        }
        driver = namespace_1fbd40990ee60ede::vehicle_occupancy_getdriver(ent);
        if (!isdefined(driver) || !isdefined(driver.team) || !isplayer(driver)) {
            continue;
        }
        if (isdefined(helipad.used) && isdefined(helipad.used[driver.team])) {
            continue;
        }
        if (!namespace_8361bad7391de074::function_c5e0bac8f123cc88(driver.team, function_16ae6d8b5f25f31b("medium_bird_story"))) {
            continue;
        }
        if (!isdefined(helipad.used)) {
            helipad.used = [];
        }
        helipad.used[driver.team] = 1;
        helipad function_1d1a225ab9f876fd(ent, driver);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbc0f
// Size: 0x1d1
function private function_1d1a225ab9f876fd(vehicle, driver) {
    function_8359cadd253f9604(driver, "land_at_lone_helipad", 1);
    var_fdc858798721a112 = spawn("script_origin", vehicle.origin);
    var_fdc858798721a112 linkto(vehicle);
    var_fdc858798721a112 makeusable();
    var_fdc858798721a112 setuserange(250);
    var_fdc858798721a112 setusefov(180);
    var_fdc858798721a112 sethintstring("PMC/DOWNLOAD_FLIGHT_PATH_DATA");
    teammates = teams::getteamdata(driver.team, "players");
    foreach (player in level.players) {
        if (array_contains(teammates, player)) {
            var_fdc858798721a112 enableplayeruse(player);
        } else {
            var_fdc858798721a112 disableplayeruse(player);
        }
    }
    foreach (player in teammates) {
        player namespace_141c4634b6ea7b27::vehicle_interact_allowvehicleuse(vehicle, 0);
    }
    var_fdc858798721a112 waittill("trigger");
    function_8359cadd253f9604(driver, "use_heli_blackbox", 1);
    driver.var_d139ca6041259b28 = 1;
    var_fdc858798721a112 delete();
    foreach (player in teammates) {
        if (isdefined(player)) {
            player namespace_141c4634b6ea7b27::vehicle_interact_allowvehicleuse(vehicle, 1);
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xbde7
// Size: 0xbb
function private function_c603f3be1379a541() {
    level.var_a524a11dadc4d9fb = [];
    var_4c570d8c8152faf1 = function_f159c10d5cf8f0b4("trigger_sira_mall", "script_noteworthy");
    var_9a4152961152a1a = function_f159c10d5cf8f0b4("pmc_oasis_trigger", "script_noteworthy");
    var_5f3fcc88f85016c2 = function_f159c10d5cf8f0b4("pmc_sandstorm", "script_noteworthy");
    if (isdefined(var_4c570d8c8152faf1) && var_4c570d8c8152faf1.size > 0) {
        level.var_a524a11dadc4d9fb["sira_mall"] = var_4c570d8c8152faf1[0];
    }
    if (isdefined(var_9a4152961152a1a) && var_9a4152961152a1a.size > 0) {
        level.var_a524a11dadc4d9fb["saba_oasis"] = var_9a4152961152a1a[0];
    }
    if (isdefined(var_5f3fcc88f85016c2) && var_5f3fcc88f85016c2.size > 0) {
        level.var_a524a11dadc4d9fb["saba_sandstorm"] = var_5f3fcc88f85016c2[0];
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xbea9
// Size: 0x37
function private function_4e6833308f41021e() {
    var_641d70dcbcaf1346 = getentitylessscriptablearray(undefined, undefined, undefined, undefined, "brloot_unhacked_laptop");
    if (!isdefined(var_641d70dcbcaf1346) || var_641d70dcbcaf1346.size == 0) {
        return;
    }
    level.var_1fed93654fa204f8 = var_641d70dcbcaf1346[0];
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbee7
// Size: 0xe2
function function_44cb8b0c33cef670(player, var_5793a0cf9d352c92, weapon) {
    if (isdefined(weapon)) {
        attachments = getweaponattachments(weapon);
        var_51dbe1a1c3d8bf04 = function_6527364c1ecca6c6(weapon);
        var_2cb723804483d204 = array_remove_array(attachments, var_51dbe1a1c3d8bf04);
        if (var_2cb723804483d204.size >= 5) {
            function_8359cadd253f9604(player, "dead_drop_gun_with_five_attachments", 1);
        }
        if (isdefined(var_5793a0cf9d352c92.poi) && var_5793a0cf9d352c92.poi == "saba_caves" && issameweapon(weapon, level.var_c891a425bf8cbc28)) {
            function_8359cadd253f9604(player, "dead_drop_chemist_gun", 1);
        }
        if (isdefined(level.var_c932dcf448d425f1) && issameweapon(weapon, level.var_c932dcf448d425f1)) {
            function_8359cadd253f9604(player, "dead_drop_trapper_crossbow", 1);
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xbfd0
// Size: 0x1a6
function private onadditemtodeaddrop(container, lootid) {
    if (issharedfuncdefined(lootid, "addedToDeadDrop")) {
        return function_f3bb4f4911a1beb2(lootid, "addedToDeadDrop", container, lootid);
    }
    if (!isdefined(self) || !isdefined(self.var_2fa5b49969def47)) {
        return [0:lootid, 1:undefined];
    }
    noextract = undefined;
    if (lootid == 11247) {
        var_ec8d5627d546900e = function_d2abbcb10a39ff56(lootid);
        noextract = var_ec8d5627d546900e[1];
        lootid = var_ec8d5627d546900e[0];
    }
    if (isdefined(self.team) && function_c5e0bac8f123cc88(self.team, function_16ae6d8b5f25f31b("radiation_bomb_story")) && (lootid == 8408 || lootid == 9104 || lootid == 8569)) {
        var_ec88c927d5416420 = function_f8d258990c78569(lootid);
        noextract = var_ec88c927d5416420[1];
        lootid = var_ec88c927d5416420[0];
    }
    if (isdefined(self.team) && function_c5e0bac8f123cc88(self.team, function_16ae6d8b5f25f31b("bomb_delivery")) && (lootid == 19214 || lootid == 8408 || lootid == 13372)) {
        var_ec88ca27d5416653 = function_4ad47f789dfad847(container, lootid);
        noextract = var_ec88ca27d5416653[1];
        lootid = var_ec88ca27d5416653[0];
    }
    if (isdefined(self.team) && function_c5e0bac8f123cc88(self.team, function_16ae6d8b5f25f31b("speed_deaddrop_chain"))) {
        var_ec88cb27d5416886 = function_dbc1b65952f8ed88(self, container, lootid);
        noextract = var_ec88cb27d5416886[1];
        lootid = var_ec88cb27d5416886[0];
    }
    return [0:lootid, 1:noextract];
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc17e
// Size: 0xed
function private function_d2abbcb10a39ff56(lootid) {
    if (!isdefined(self) || !isdefined(self.var_2fa5b49969def47) || !isdefined(self.var_2fa5b49969def47.origin)) {
        return [0:lootid, 1:undefined];
    }
    if (!isdefined(self.var_2fa5b49969def47.poi)) {
        self.var_2fa5b49969def47.poi = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(self.var_2fa5b49969def47.origin);
    }
    if (!isdefined(self.var_2fa5b49969def47.poi) || self.var_2fa5b49969def47.poi != "saba_caves") {
        return [0:lootid, 1:undefined];
    }
    function_e53e7e4801c9866();
    function_8359cadd253f9604(self, "hacked_laptop", 1);
    return [0:8644, 1:1];
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc273
// Size: 0x90
function private function_e53e7e4801c9866() {
    if (!isdefined(level.var_1fed93654fa204f8) || !isdefined(level.var_1fed93654fa204f8.origin) || !isdefined(level.var_1fed93654fa204f8.angles)) {
        return;
    }
    var_6d6612caac7c7233 = spawnscriptable("dmz_pmc_place_laptop", level.var_1fed93654fa204f8.origin, level.var_1fed93654fa204f8.angles);
    var_6d6612caac7c7233 function_ab5c0b42f31a0d20(function_16ae6d8b5f25f31b("espionage_story"));
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0xc30a
// Size: 0x8a
function private function_959dc4fe95b93cea(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (state != "invisible_usable") {
        return;
    }
    var_d1768fd36a39517b = istrue(player namespace_aead94004cf4c147::function_6f39f9916649ac48(8644, 1));
    if (!var_d1768fd36a39517b) {
        player namespace_44abc05161e2e2cb::showerrormessage("PMC/DONT_HAVE_HACKED_LAPTOP");
        return;
    }
    instance setscriptablepartstate("dmz_pmc_place_laptop", "visible_unusable");
    function_8359cadd253f9604(player, "planted_hacked_laptop", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xc39b
// Size: 0x172
function private function_492d7c202b56dc1() {
    flag_wait("scriptables_ready");
    var_b6da601dccc1197 = [0:11209, 1:11208, 2:11201];
    for (i = 1; i <= 3; i++) {
        var_3531236d1a437a5c = getstruct("puzzle_buried_cache_" + i, "script_noteworthy");
        var_fa4fff8ad27727e2 = var_b6da601dccc1197[i - 1];
        if (!isdefined(var_3531236d1a437a5c)) {
            continue;
        }
        cache = spawnscriptable("dmz_geiger_puzzle_container", var_3531236d1a437a5c.origin, function_53c4c53197386572(var_3531236d1a437a5c.angles, (0, 0, 0)));
        contents = namespace_1b7e64f50cca9321::function_ec87b214cd429e96(getscriptablelootcachecontents(cache));
        var_521d43cca02db88b = [];
        for (j = 0; j < contents.size; j++) {
            lootid = contents[j]["lootID"];
            if (array_contains(var_b6da601dccc1197, lootid)) {
                if (lootid == var_fa4fff8ad27727e2) {
                    contents[j]["callback"] = &function_ecdd376b2a318c49;
                    var_521d43cca02db88b[var_521d43cca02db88b.size] = contents[j];
                }
            } else {
                var_521d43cca02db88b[var_521d43cca02db88b.size] = contents[j];
            }
        }
        cache.contents = array_randomize(var_521d43cca02db88b);
        cache setscriptablepartstate("body", "closed_usable");
        namespace_96abc792b7f61807::function_f0d61e14dfde9ccd(cache);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc514
// Size: 0x1c
function private function_ecdd376b2a318c49(cache, player) {
    namespace_96abc792b7f61807::function_a67007b5af86ff0b(cache);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xc537
// Size: 0x4b
function private function_5c7bc3641f80e9dc() {
    level.var_39f292381a9d3bb8 = getstruct("oilfield_stronghold_entrance", "script_noteworthy");
    if (isdefined(level.var_39f292381a9d3bb8) && !isdefined(level.var_39f292381a9d3bb8.origin)) {
        level.var_39f292381a9d3bb8 = undefined;
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xc589
// Size: 0x7a
function private onplacetaccamera(camera) {
    if (!isdefined(camera) || !isdefined(camera.origin)) {
        return;
    }
    if (isdefined(level.var_39f292381a9d3bb8)) {
        function_635937c689ec374(camera);
    }
    if (isdefined(level.var_ccaa9cfd2b7b3856)) {
        function_e6fc5a0cc74883ef(camera);
    }
    if (isdefined(level.var_a05f3bd63f29eff9) && isdefined(level.var_a05f3bd63f29eff9.var_cc41b5d31d55087b)) {
        function_1236e9842df9aa2f(camera);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc60a
// Size: 0x89
function function_635937c689ec374(camera) {
    if (distancesquared(camera.origin, level.var_39f292381a9d3bb8.origin) > 2250000) {
        return;
    }
    var_2f75059127901dc = namespace_2a184fc4902783dc::ray_trace(camera.origin, level.var_39f292381a9d3bb8.origin, camera);
    if (var_2f75059127901dc["fraction"] < 0.99) {
        return;
    }
    function_8359cadd253f9604(self, "tac_cam_pointing_at_oilfield", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc69a
// Size: 0x89
function function_5175fa97870923ad() {
    items = getentitylessscriptablearray(undefined, undefined, undefined, undefined, "brloot_caves_intel");
    if (!isdefined(items) || items.size == 0) {
        return;
    }
    level.var_446d110c8d4ddfd2 = items[0];
    level.var_fe06b29988dc7c85 = spawnscriptable("dmz_pmc_place_intel", level.var_446d110c8d4ddfd2.origin, level.var_446d110c8d4ddfd2.angles);
    level.var_fe06b29988dc7c85 setscriptablepartstate("dmz_pmc_place_intel", "invisible_unusable");
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xc72a
// Size: 0x8a
function function_7cfd9e977f412d78(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (state != "invisible_usable") {
        return;
    }
    var_2166bd993a82e3 = istrue(player namespace_aead94004cf4c147::function_6f39f9916649ac48(8618, 1));
    if (!var_2166bd993a82e3) {
        player namespace_44abc05161e2e2cb::showerrormessage("PMC/NO_DOCUMENTS_ERR_MSG");
        return;
    }
    instance setscriptablepartstate("dmz_pmc_place_intel", "visible");
    function_8359cadd253f9604(player, "swapped_caves_intel", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc7bb
// Size: 0x117
function function_7868d975ef389aba() {
    var_17ad7dd267294331 = function_f159c10d5cf8f0b4("trigger_water_cave_docks", "script_noteworthy");
    if (!isdefined(var_17ad7dd267294331) || var_17ad7dd267294331.size == 0) {
        return;
    }
    var_e4c7659a84f52978 = var_17ad7dd267294331[0];
    while (1) {
        ent = var_e4c7659a84f52978 waittill("trigger");
        if (!ent namespace_1f188a13f7e79610::isvehicle()) {
            continue;
        }
        if (!ent namespace_1f188a13f7e79610::function_7c62ca52f72901a1()) {
            continue;
        }
        driver = namespace_1fbd40990ee60ede::vehicle_occupancy_getdriver(ent);
        if (!isdefined(driver) || !isdefined(driver.team) || !isplayer(driver)) {
            continue;
        }
        if (isdefined(var_e4c7659a84f52978.used) && isdefined(var_e4c7659a84f52978.used[driver.team])) {
            continue;
        }
        if (!isdefined(var_e4c7659a84f52978.used)) {
            var_e4c7659a84f52978.used = [];
        }
        var_e4c7659a84f52978.used[driver.team] = 1;
        function_8359cadd253f9604(driver, "trigger_water_cave_docks", 1);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xc8d9
// Size: 0x245
function private function_3008315fdf9460b8() {
    var_3531236d1a437a5c = getstruct("fortress_sewer_underwater_cache", "script_noteworthy");
    var_aece5bd343e9d2dc = getstructarray("fortress_breaker_interact", "script_noteworthy");
    if (!isdefined(var_3531236d1a437a5c) || !isdefined(var_3531236d1a437a5c.origin)) {
        return;
    }
    if (!isdefined(var_aece5bd343e9d2dc) || var_aece5bd343e9d2dc.size == 0) {
        return;
    }
    level.var_f0223212ed81b749 = [];
    var_8af01e9d902b5797 = [0:(18096, -55514, 731), 1:(16657, -53540, 837), 2:(18114, -54311, 730)];
    foreach (struct in var_aece5bd343e9d2dc) {
        valid = 1;
        foreach (origin in var_8af01e9d902b5797) {
            if (distance(struct.origin, origin) < 20) {
                valid = 0;
            }
        }
        if (valid) {
            level.var_f0223212ed81b749[level.var_f0223212ed81b749.size] = struct;
        }
    }
    level.var_d4a11cb7a6a4bc0c = 0;
    level.var_518fafbd705972fb = spawnscriptable("br_loot_cache_lege", var_3531236d1a437a5c.origin, function_53c4c53197386572(var_3531236d1a437a5c.angles, (0, 0, 0)));
    level.var_518fafbd705972fb namespace_1b7e64f50cca9321::function_d683a60016231237(11263, 1);
    level.var_518fafbd705972fb.var_c93ea8f612f4aaba = 1;
    level.var_dd5eaba9f20b9619 = level.var_518fafbd705972fb namespace_58dcf42cf567f34f::function_c4d29f8f054e326b(level.var_518fafbd705972fb.origin + (0, 0, 20), "generic_no_key");
    level thread function_280edf3f47535ae9("trigger_fortress_sewers", "script_noteworthy", "trigger_fortress_sewers", &function_ff25c1631a28d8fe);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcb25
// Size: 0x14f
function private function_ff25c1631a28d8fe(player) {
    if (istrue(level.var_1171de670afddbee)) {
        return;
    }
    level.var_1171de670afddbee = 1;
    level.var_3edca7326772514b = [];
    foreach (var_f1eb9d38c7909ec6 in level.var_f0223212ed81b749) {
        level.var_3edca7326772514b[level.var_3edca7326772514b.size] = spawnscriptable("dmz_pmc_disarm_security", var_f1eb9d38c7909ec6.origin);
    }
    level.var_66b139a489af4aac = player.team;
    level.var_f0223212ed81b749 = undefined;
    playsoundatpos(random(level.var_3edca7326772514b).origin, "mp_dmz_alrm_trap");
    level endon("sewer_event_disabled");
    wait(240);
    if (isdefined(level.var_3edca7326772514b)) {
        var_ea893b6b39485e16 = random(level.var_3edca7326772514b);
        playsoundatpos(var_ea893b6b39485e16.origin, "mp_dmz_alrm_trap");
        function_5c7bc997159207b3();
        function_8ad0dc3070480b2b(var_ea893b6b39485e16.origin, 6, "saba_fort");
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcc7b
// Size: 0xa4
function private function_8ad0dc3070480b2b(location, num, poi) {
    agents = [];
    var_cf2ff249c028b242 = namespace_bfef6903bca5845d::function_ab14d6652e44fda0(6, level.spawnset["guard"], 3);
    var_cf2ff249c028b242.var_83c3368707c68e6 = "Helicopter";
    while (!isdefined(agents) || agents.size == 0) {
        agents = namespace_bfef6903bca5845d::function_77acc10c4823dd8a(6, location, "high", "mission", "sewerEvent", undefined, undefined, 1, poi, undefined, undefined, undefined, var_cf2ff249c028b242);
        if (isdefined(agents) && agents.size != 0) {
            break;
        }
        wait(1);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0xcd26
// Size: 0x9a
function private function_4cdd0981528ff098(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    instance setscriptablepartstate(part, "invisible_unusable");
    player thread namespace_cb965d2f71fefddc::playerplaypickupanim();
    level.var_3edca7326772514b = array_remove(level.var_3edca7326772514b, instance);
    level.var_d4a11cb7a6a4bc0c++;
    if (level.var_d4a11cb7a6a4bc0c == 7) {
        function_66d667a607a545c4();
    }
    function_8a7a2427622e7572(level.var_66b139a489af4aac, "fortress_sewer_breaker_reroute", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcdc7
// Size: 0xcc
function private function_66d667a607a545c4() {
    level notify("sewer_event_disabled");
    level.var_dd5eaba9f20b9619 namespace_58dcf42cf567f34f::function_f3b1f1d41c65b340();
    var_27e49251bb3376ea = undefined;
    foreach (player in teams::getteamdata(level.var_66b139a489af4aac, "players")) {
        if (!isdefined(player) || !isalive(player)) {
            return;
        }
        var_27e49251bb3376ea = player;
        break;
    }
    if (isdefined(var_27e49251bb3376ea)) {
        var_27e49251bb3376ea namespace_ede58c1e66c2c280::calloutmarkerping_createcallout(19, (0, 0, 100), level.var_518fafbd705972fb.index);
    }
    function_5c7bc997159207b3();
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xce9a
// Size: 0x79
function private function_5c7bc997159207b3() {
    if (!isdefined(level.var_3edca7326772514b)) {
        return;
    }
    foreach (scriptable in level.var_3edca7326772514b) {
        scriptable setscriptablepartstate("dmz_pmc_disarm_security", "invisible_unusable");
    }
    level.var_3edca7326772514b = undefined;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xcf1a
// Size: 0x162
function private function_9414ce99a799a309() {
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level namespace_4b0406965e556711::gameflagwait("prematch_done");
    }
    triggers = function_f159c10d5cf8f0b4("trigger_hydro_gas_station", "script_noteworthy");
    tower = function_f159c10d5cf8f0b4("trigger_radio_tower_hydro", "script_noteworthy");
    if (!isdefined(triggers) || triggers.size == 0 || !isdefined(tower) || tower.size == 0) {
        return;
    }
    level.var_fc7bbb62daf23e2d = [];
    missionid = function_16ae6d8b5f25f31b("car_bomb_story");
    foreach (trigger in triggers) {
        var_c1a3f9c508fa9b56 = spawnscriptable("dmz_pmc_hydro_bomb_site_use", trigger.origin);
        var_c1a3f9c508fa9b56 setscriptablepartstate("dmz_pmc_hydro_bomb_site_use", "usable");
        var_c1a3f9c508fa9b56 function_ab5c0b42f31a0d20(missionid);
        level.var_fc7bbb62daf23e2d[level.var_fc7bbb62daf23e2d.size] = var_c1a3f9c508fa9b56;
    }
    tower = tower[0];
    var_81739bc035ab88e1 = spawnscriptable("dmz_pmc_hydro_tower_use", tower.origin);
    var_81739bc035ab88e1 function_ab5c0b42f31a0d20(missionid);
    level thread function_98f9cf6481d5a722(triggers);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd083
// Size: 0xdf
function private function_98f9cf6481d5a722(triggers) {
    level.var_e5953799fc4ece76 = triggers;
    foreach (trigger in level.var_e5953799fc4ece76) {
        trigger thread function_88e153e1b6916e25();
    }
    while (1) {
        if (function_4518b3f7c0343ae4()) {
            foreach (player in level.players) {
                function_8359cadd253f9604(player, "parked_vehicles_hydro_gas_station", 1, 0);
            }
            return;
        }
        wait(1);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd169
// Size: 0x55
function private function_88e153e1b6916e25() {
    self.var_7a27771914a473eb = [];
    while (1) {
        ent = self waittill("trigger");
        if (!ent namespace_1f188a13f7e79610::isvehicle()) {
            continue;
        }
        if (isdefined(self.var_7a27771914a473eb[ent getentitynumber()])) {
            continue;
        }
        thread function_cde3404945df007c(ent);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd1c5
// Size: 0x73
function private function_cde3404945df007c(vehicle) {
    entnum = vehicle getentitynumber();
    self.var_7a27771914a473eb[entnum] = vehicle;
    while (isdefined(vehicle) && isdefined(vehicle.origin) && distancesquared(vehicle.origin, self.origin) < 490000) {
        wait(1);
    }
    self.var_7a27771914a473eb[entnum] = undefined;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd23f
// Size: 0x65
function private function_4518b3f7c0343ae4() {
    foreach (trigger in level.var_e5953799fc4ece76) {
        if (trigger.var_7a27771914a473eb.size == 0) {
            return 0;
        }
    }
    return 1;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd2ac
// Size: 0x72
function private function_69a1e33dfbee41d2(team) {
    foreach (var_461edd0ef0140e86 in level.var_fc7bbb62daf23e2d) {
        if (!is_equal(var_461edd0ef0140e86.team, team)) {
            return 0;
        }
    }
    return 1;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0xd326
// Size: 0x390
function private function_fffd723ff4050d8e(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (state == "usable") {
        instance setscriptablepartstate(part, "unusable");
        if (istrue(instance.planting)) {
            return;
        }
        instance.planting = 1;
        bomb = function_c795784dbf5f49c5(player);
        thread namespace_f2c68794a1018c9d::function_d86771edadba8b4a(instance, instance, player);
        buttontime = 0;
        while (buttontime < level.var_f330cdb3a4738b38.planttime) {
            if (instance.cancel || !namespace_7e17181d03156026::function_ad443bbcdcf37b85(player)) {
                instance.planting = 0;
                function_bc3d8a9d8b004ecd(player, bomb);
                instance setscriptablepartstate(part, "usable");
                return;
            }
            buttontime = buttontime + level.framedurationseconds;
            waitframe();
        }
        origin = drop_to_ground(player.origin, 100, undefined, undefined, create_world_contents()) + (0, 0, 1);
        team = player.team;
        function_bc3d8a9d8b004ecd(player, bomb);
        instance.plantedbomb = spawnscriptable("dmz_pmc_hydro_bomb", origin);
        instance.team = team;
        instance.used = [];
        instance.used[team] = 1;
        instance function_9c8ee1fae2f25458();
        function_8a7a2427622e7572(team, "planted_bombs_hydro_gas_station", 1);
    } else if (state == "defusable") {
        instance setscriptablepartstate(part, "unusable");
        if (istrue(instance.defusing)) {
            return;
        }
        instance.defusing = 1;
        instance.plantedbomb setscriptablepartstate("dmz_pmc_hydro_bomb", "invisible");
        bomb = function_c795784dbf5f49c5(player);
        thread namespace_f2c68794a1018c9d::function_d86771edadba8b4a(instance, instance, player);
        buttontime = 0;
        while (buttontime < level.var_f330cdb3a4738b38.defusetime) {
            if (instance.cancel || !isalive(player) || isdefined(player.var_2ca0dac193d83c1) && player.var_2ca0dac193d83c1) {
                instance.defusing = 0;
                function_bc3d8a9d8b004ecd(player, bomb);
                instance.plantedbomb setscriptablepartstate("dmz_pmc_hydro_bomb", "visible");
                instance function_9c8ee1fae2f25458();
                return;
            }
            buttontime = buttontime + level.framedurationseconds;
            waitframe();
        }
        instance.team = player.team;
        instance.plantedbomb.origin = drop_to_ground(player.origin, 100, undefined, undefined, create_world_contents()) + (0, 0, 1);
        function_bc3d8a9d8b004ecd(player, bomb);
        if (!isdefined(instance.used[instance.team])) {
            instance.used[instance.team] = 1;
            function_8a7a2427622e7572(instance.team, "planted_bombs_hydro_gas_station", 1);
        }
        instance.plantedbomb setscriptablepartstate("dmz_pmc_hydro_bomb", "visible");
        instance function_9c8ee1fae2f25458();
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd6bd
// Size: 0xc1
function private function_9c8ee1fae2f25458() {
    self setscriptablepartstate("dmz_pmc_hydro_bomb_site_use", "defusable", 0);
    foreach (player in level.players) {
        self enablescriptableplayeruse(player);
    }
    foreach (player in teams::getteamdata(self.team, "players")) {
        self disablescriptableplayeruse(player);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd785
// Size: 0x57
function private function_c795784dbf5f49c5(player) {
    player function_18445fc8f6589865(0);
    bomb = makeweapon("briefcase_bomb_mp");
    player namespace_df5cfdbe6e2d3812::_giveweapon(bomb, undefined, undefined, 0);
    player setweaponammostock(bomb, 0);
    player setweaponammoclip(bomb, 0);
    player thread namespace_19b4203b51d56488::switchtouseweapon(bomb, 1, 1);
    return bomb;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd7e4
// Size: 0x6c
function private function_bc3d8a9d8b004ecd(player, bomb) {
    lastweaponobj = player namespace_92e4af149e72dc29::getlastweapon();
    if (player namespace_a2f809133c566621::isjuggernaut()) {
        lastweaponobj = namespace_68f1873625691c6::jugg_getminigunweapon();
    } else if (!player hasweapon(lastweaponobj)) {
        lastweaponobj = player namespace_92e4af149e72dc29::getfirstprimaryweapon();
    }
    player namespace_df5cfdbe6e2d3812::domonitoredweaponswitch(lastweaponobj, 0, 1);
    player takeweapon(bomb);
    player function_18445fc8f6589865(1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd857
// Size: 0x117
function private function_18445fc8f6589865(isallowed) {
    val::set("sam_holding_bomb", "allow_movement", isallowed);
    val::set("sam_holding_bomb", "sprint", isallowed);
    val::set("sam_holding_bomb", "fire", isallowed);
    val::set("sam_holding_bomb", "reload", isallowed);
    val::set("sam_holding_bomb", "weapon_pickup", isallowed);
    val::set("sam_holding_bomb", "weapon_switch", isallowed);
    val::set("sam_holding_bomb", "allow_jump", isallowed);
    val::set("sam_holding_bomb", "gesture", isallowed);
    val::set("sam_holding_bomb", "supers", isallowed);
    self function_35501b42058d4de9();
    if (isallowed) {
        waittill_any_timeout_1(0.8, "bomb_allow_offhands");
    }
    val::set("sam_holding_bomb", "melee", isallowed);
    val::set("sam_holding_bomb", "mantle", isallowed);
    val::set("sam_holding_bomb", "offhand_weapons", isallowed);
    if (isallowed) {
        val::function_c9d0b43701bdba00("sam_holding_bomb");
        self function_bb04491d50d9e43e();
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0xd975
// Size: 0x216
function private function_a2b7f3dafbffa8de(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!function_4518b3f7c0343ae4()) {
        player namespace_44abc05161e2e2cb::showerrormessage("PMC/NOT_ALL_GAS_STATIONS_ARE_OCCUPIED");
        return;
    }
    if (!function_69a1e33dfbee41d2(player.team)) {
        player namespace_44abc05161e2e2cb::showerrormessage("PMC/NOT_ALL_BOMBS_ARE_PLANTED");
        return;
    }
    instance freescriptable();
    player thread namespace_7381a1f17171d16c::c4_animdetonate();
    wait(1);
    foreach (bomb in level.var_fc7bbb62daf23e2d) {
        function_81c6d95294b1ece3(bomb.origin, player);
        bomb.plantedbomb freescriptable();
        bomb freescriptable();
    }
    foreach (trigger in level.var_e5953799fc4ece76) {
        foreach (vehicle in trigger.var_7a27771914a473eb) {
            if (isdefined(vehicle) && !istrue(vehicle.isdestroyed)) {
                data = namespace_169cd7a8fbc76ee5::packdamagedata(player, vehicle, vehicle.maxhealth, makeweapon("bomb_site_mp"), "MOD_EXPLOSIVE", vehicle, vehicle.origin);
                vehicle namespace_1f188a13f7e79610::vehicle_explode(data);
            }
        }
    }
    level.var_fc7bbb62daf23e2d = undefined;
    level.var_e5953799fc4ece76 = undefined;
    function_8359cadd253f9604(player, "detonated_hydro_bombs", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdb92
// Size: 0xc4
function private function_81c6d95294b1ece3(origin, damageent, var_39a2c4c5962fc158) {
    explosionpos = origin + (0, 0, 20);
    explosioneffect = spawnfx(level._effect["samsite_bomb_explosion"], explosionpos);
    explosioneffect thread function_b4b04de87729a6f3(10);
    triggerfx(explosioneffect);
    physicsexplosionsphere(explosionpos, 200, 100, 3);
    playrumbleonposition("grenade_rumble", origin);
    earthquake(0.25, 0.5, origin, 500);
    playsoundatpos(explosionpos, function_53c4c53197386572(var_39a2c4c5962fc158, "exp_bombsite_lr"));
    radiusdamage(explosionpos, 200, 500, 10, damageent, "MOD_EXPLOSIVE", "bomb_site_mp");
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xdc5d
// Size: 0xf3
function private function_b61326cf101fb540() {
    var_32e92de34d022079 = getstructarray("computer_usb_port", "script_noteworthy");
    if (!isdefined(var_32e92de34d022079) || var_32e92de34d022079.size == 0) {
        return;
    }
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level namespace_4b0406965e556711::gameflagwait("prematch_done");
    }
    missionid = function_16ae6d8b5f25f31b("plant_usb_story");
    foreach (var_54a79406c5065ed0 in var_32e92de34d022079) {
        usb = spawnscriptable("dmz_pmc_place_usb", var_54a79406c5065ed0.origin, var_54a79406c5065ed0.angles);
        usb function_ab5c0b42f31a0d20(missionid);
    }
    level thread function_315e9c3a5fb405e5(missionid, (22656, -55352, 696), 11262, 3);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0xdd57
// Size: 0x86
function private function_d7415966d73d5a1e(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (state != "invisible_usable") {
        return;
    }
    var_95d1a0691036b3e7 = istrue(player namespace_aead94004cf4c147::function_6f39f9916649ac48(11262, 1));
    if (!var_95d1a0691036b3e7) {
        player namespace_44abc05161e2e2cb::showerrormessage("PMC/HACKED_THUMB_DRIVE_REQUIRED");
        return;
    }
    instance setscriptablepartstate(part, "visible_unusable");
    function_8359cadd253f9604(player, "hacked_usb_planted", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xdde4
// Size: 0x32
function private function_31b8c224ba19c71d() {
    if (namespace_36f464722d326bbe::function_7ee65fae13124702()) {
        level thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("gps_travel_story"), (4297, -11455, 4590), 11200, 1);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xde1d
// Size: 0x40
function private oncontainerlooted(player, lootid, quantity, container) {
    if (lootid != 11200) {
        return;
    }
    function_187f4232dcd3b0e9(player, player.var_da28916e7827af7c);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde64
// Size: 0xe6
function function_187f4232dcd3b0e9(player, poi) {
    if (isdefined(player) && isdefined(poi)) {
        if (isdefined(level.squaddata)) {
            poisvisited = squads::function_2026e82470c5c89f(player.team, player.var_ff97225579de16a, "gpsPoisVisited");
            if (!isdefined(poisvisited[poi])) {
                function_8359cadd253f9604(player, "gps_poi_travel", 1);
                poisvisited[poi] = 1;
                squads::function_a20a10ce593f692b(player.team, player.var_ff97225579de16a, "gpsPoisVisited", poisvisited);
            }
        } else {
            poisvisited = teams::getteamdata(player.team, "gpsPoisVisited");
            if (!isdefined(poisvisited[poi])) {
                function_8359cadd253f9604(player, "gps_poi_travel", 1);
                poisvisited[poi] = 1;
                teams::setteamdata(player.team, "gpsPoisVisited", poisvisited);
            }
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xdf51
// Size: 0x4f
function function_438dae3e86a38aba(team, var_ff97225579de16a) {
    if (isdefined(level.squaddata)) {
        poisvisited = squads::function_2026e82470c5c89f(team, var_ff97225579de16a, "gpsPoisVisited");
    } else {
        poisvisited = teams::getteamdata(team, "gpsPoisVisited");
    }
    return poisvisited.size == 17;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xdfa8
// Size: 0x1df
function private function_c9fb574bc742a62e() {
    var_400c962e88747e94 = getstructarray("caves_tracking_device", "script_noteworthy");
    var_c2b66b0092cf95c6 = [];
    foreach (struct in var_400c962e88747e94) {
        if (distance(struct.origin, (-31098, -499.5, 2113)) > 10) {
            var_c2b66b0092cf95c6[var_c2b66b0092cf95c6.size] = struct;
        }
    }
    var_84a1c60e63eb7ad5 = getstruct("caves_bunker_server", "script_noteworthy");
    if (!isdefined(var_c2b66b0092cf95c6) || var_c2b66b0092cf95c6.size == 0 || !isdefined(var_84a1c60e63eb7ad5)) {
        return;
    }
    missionid = function_16ae6d8b5f25f31b("caves_tracking");
    if (namespace_36f464722d326bbe::function_7ee65fae13124702()) {
        function_315e9c3a5fb405e5(missionid, (21286, -16750, 3685), 11206, var_c2b66b0092cf95c6.size);
    } else if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level namespace_4b0406965e556711::gameflagwait("prematch_done");
    }
    foreach (var_3029e9d959d68951 in var_c2b66b0092cf95c6) {
        var_5be082c81f66920a = spawnscriptable("dmz_pmc_place_tracker", var_3029e9d959d68951.origin, function_53c4c53197386572(var_3029e9d959d68951.angles, (0, 0, 0)));
        var_5be082c81f66920a function_ab5c0b42f31a0d20(missionid);
    }
    var_56593eba3d9c2965 = spawnscriptable("dmz_pmc_caves_server_use", var_84a1c60e63eb7ad5.origin);
    var_56593eba3d9c2965 function_ab5c0b42f31a0d20(missionid);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0xe18e
// Size: 0x7b
function private function_9e928de0556dd9a1(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    var_761f8b171e80e381 = istrue(player namespace_aead94004cf4c147::function_6f39f9916649ac48(11206, 1));
    if (!var_761f8b171e80e381) {
        player namespace_44abc05161e2e2cb::showerrormessage("PMC/NO_TRACKING_DEVICES_IN_BACKPACK");
        return;
    }
    instance setscriptablepartstate(part, "visible_unusable");
    function_8359cadd253f9604(player, "plant_tracker_on_truck", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0xe210
// Size: 0xc0
function private function_822721b8759d5950(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!isdefined(player.team) || !isdefined(instance)) {
        return;
    }
    if (isdefined(instance.used) && isdefined(instance.used[player.team])) {
        instance disablescriptableplayeruse(player);
        return;
    }
    if (!isdefined(instance.used)) {
        instance.used = [];
    }
    instance.used[player.team] = 1;
    instance thread function_b4b7d5eff7c75c3c(instance, player);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe2d7
// Size: 0x245
function private function_b4b7d5eff7c75c3c(server, player) {
    server.curorigin = server.origin;
    server.offset3d = (0, 0, 15);
    server namespace_19b4203b51d56488::requestid(1, 1, undefined, 1, 1);
    objid = server.objidnum;
    server.curorigin = undefined;
    server.offset3d = undefined;
    if (objid == -1) {
        return;
    }
    objective_icon(objid, "ui_map_icon_obj_recon");
    objective_setbackground(objid, 1);
    objective_setzoffset(objid, 15);
    objective_position(objid, server.origin + (0, 0, 15));
    objective_setpinned(objid, 1);
    objective_setplayintro(objid, 1);
    objective_removeallfrommask(objid);
    objective_addteamtomask(objid, player.team);
    objective_showtoplayersinmask(objid);
    playerteam = player.team;
    players = teams::getteamdata(player.team, "players");
    foreach (teammember in players) {
        server disablescriptableplayeruse(teammember);
        namespace_5a22b6f3a56f7e9b::function_ce702e5925e31fc9(objid, teammember, 1, 2, "PMC/DOWNLOADING_SERVER_DATA");
    }
    wait(3);
    progress = 0;
    while (progress < 1) {
        progress = min(1, progress + level.framedurationseconds / 8);
        objective_setprogress(objid, progress);
        waitframe();
    }
    wait(0.2);
    foreach (teammember in players) {
        if (!isdefined(teammember)) {
            continue;
        }
        namespace_5a22b6f3a56f7e9b::function_26259bd38697b5ad(objid, teammember);
    }
    function_8a7a2427622e7572(playerteam, "caves_server_download", 1);
    server namespace_19b4203b51d56488::releaseid();
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xe523
// Size: 0x5e
function private function_822d31a70ed0bc67() {
    var_5cd858914520a8a5 = getentitylessscriptablearray("pmc_beach_observatory_toolbox", "script_noteworthy");
    if (!isdefined(var_5cd858914520a8a5) || var_5cd858914520a8a5.size != 1) {
        return;
    }
    var_5cd858914520a8a5 = var_5cd858914520a8a5[0];
    var_5cd858914520a8a5 setscriptablepartstate("body", "closed_usable");
    var_5cd858914520a8a5.var_3e5d613e6f4d92e3 = 1;
    var_5cd858914520a8a5 namespace_1b7e64f50cca9321::function_d683a60016231237(19247, 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xe588
// Size: 0x378
function private function_84247818fc8a16f9(var_394466c2ddb208cb, pingtype) {
    if (pingtype == 6) {
        function_8359cadd253f9604(self, "ping_vehicle", 1);
        ent = self calloutmarkerping_getent(var_394466c2ddb208cb);
        if (isdefined(ent)) {
            if (isdefined(ent.var_47bde44b1acec603)) {
                function_8359cadd253f9604(self, "ping_boss", 1);
            }
        }
    } else if (pingtype == 4) {
        index = self calloutmarkerping_getgscobjectiveindex(var_394466c2ddb208cb);
        if (isdefined(index)) {
            found = 0;
            if (isarray(level.var_a1141d47ab94d2a1)) {
                foreach (var_d233486a875a4ba8 in level.var_a1141d47ab94d2a1) {
                    if (isdefined(var_d233486a875a4ba8) && isdefined(var_d233486a875a4ba8.var_107d6e8fc82a82a8) && isdefined(var_d233486a875a4ba8.var_107d6e8fc82a82a8.objidnum) && index == var_d233486a875a4ba8.var_107d6e8fc82a82a8.objidnum) {
                        function_8359cadd253f9604(self, "ping_uav_tower", 1);
                        found = 1;
                        break;
                    }
                }
            }
            if (!found) {
                if (isarray(level.bosses)) {
                    foreach (var_9329e0d3ce1d5ca8 in level.bosses) {
                        foreach (var_566868292ee2a1b in var_9329e0d3ce1d5ca8.instances) {
                            if (isdefined(var_566868292ee2a1b.objidnum) && var_566868292ee2a1b.objidnum == index) {
                                function_8359cadd253f9604(self, "ping_boss", 1);
                                found = 1;
                                break;
                            }
                        }
                        if (found) {
                            break;
                        }
                    }
                }
            }
        }
    } else if (pingtype == 23) {
        ent = self calloutmarkerping_getent(var_394466c2ddb208cb);
        if (isdefined(ent) && isdefined(ent.type) && ent.type == "dmz_uav_tower") {
            function_8359cadd253f9604(self, "ping_uav_tower", 1);
        }
        if (isdefined(ent) && isdefined(ent.type) && ent.type == "pmc_cartel_cargo") {
            function_8359cadd253f9604(self, "pmc_pinged_cartel_cargo", 1);
        }
    } else if (pingtype == 9) {
        ent = self calloutmarkerping_getent(var_394466c2ddb208cb);
        if (isagent(ent) || isplayer(ent)) {
            if (isdefined(ent.agent_type)) {
                subcategory = function_f3bb4f4911a1beb2("ai_mp_controller", "agentPers_getAgentPersData", ent, "subcategory");
                if (function_c7496288999ac847(ent.agent_type, subcategory)) {
                    function_8359cadd253f9604(self, "ping_cartel_member", 1);
                }
            }
            function_8359cadd253f9604(self, "ping_enemy", 1);
            if (isdefined(ent.var_47bde44b1acec603)) {
                function_8359cadd253f9604(self, "ping_boss", 1);
            }
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xe907
// Size: 0x42
function private ongascanrefuel(vehicle, var_5e91b6fe3674e856) {
    if (!function_6f6cc16c0528de5b(self)) {
        return;
    }
    function_8359cadd253f9604(self, "gas_can_refuel", 1);
    if (istrue(var_5e91b6fe3674e856)) {
        function_8359cadd253f9604(self, "refuel_palfa", 1);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xe950
// Size: 0x8a
function private onvehiclesiphoned(vehicle, var_5e91b6fe3674e856) {
    if (!function_6f6cc16c0528de5b(self) || !isdefined(vehicle) || istrue(var_5e91b6fe3674e856)) {
        return;
    }
    if (!isdefined(vehicle.var_46708a9a93d3dd28)) {
        vehicle.var_46708a9a93d3dd28 = [];
    }
    id = namespace_7e17181d03156026::getuniqueid();
    if (istrue(vehicle.var_46708a9a93d3dd28[id])) {
        return;
    }
    vehicle.var_46708a9a93d3dd28[id] = 1;
    function_8359cadd253f9604(self, "siphon_gas", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe9e1
// Size: 0xa8
function private function_1236e9842df9aa2f(camera) {
    foreach (locname, struct in level.var_a05f3bd63f29eff9.var_cc41b5d31d55087b) {
        var_82ffc17c45523d42 = struct.useprompt.trigger;
        if (ispointinvolume(camera.origin, var_82ffc17c45523d42)) {
            function_8359cadd253f9604(self, "plant_camera_" + locname, 1);
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xea90
// Size: 0x4f
function private function_b09c81ea055c4c31() {
    var_ccaa9cfd2b7b3856 = getstructarray("pmc_smuggling_tunnel_entrance", "script_noteworthy");
    if (!isdefined(var_ccaa9cfd2b7b3856) || var_ccaa9cfd2b7b3856.size == 0) {
        return;
    }
    level.var_ccaa9cfd2b7b3856 = var_ccaa9cfd2b7b3856;
    level thread function_280edf3f47535ae9("pmc_smuggling_tunnels_trigger", "script_noteworthy", "locate_smuggling_tunnels");
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xeae6
// Size: 0xc8
function private function_e6fc5a0cc74883ef(camera) {
    var_4f99fc3ccb1614de = sortbydistance(level.var_ccaa9cfd2b7b3856, camera.origin)[0];
    if (!isdefined(camera.ownerteam)) {
        return;
    }
    if (!isdefined(var_4f99fc3ccb1614de.used)) {
        var_4f99fc3ccb1614de.used = [];
    }
    if (isdefined(var_4f99fc3ccb1614de.used[camera.ownerteam])) {
        return;
    }
    if (distancesquared(camera.origin, var_4f99fc3ccb1614de.origin) > 360000) {
        return;
    }
    var_4f99fc3ccb1614de.used[camera.ownerteam] = 1;
    function_8359cadd253f9604(self, "plant_tac_cam_smuggling_tunnels", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xebb5
// Size: 0x319
function private onuseuploadstation(player) {
    if (!isdefined(player.team)) {
        return 0;
    }
    if (!isdefined(self.var_68fa0b06cbf0a443)) {
        self.var_68fa0b06cbf0a443 = [];
    }
    if (namespace_36f464722d326bbe::function_ee0c2958aa2ee59e()) {
        jumpiffalse(istrue(level.var_1e8573a54a7096f3.var_7a7997ebb531cb5b[player.guid])) LOC_000000ac;
        level thread function_1115d65bd80653e6(self, player, 10000, "upload_reset_lasers", &function_3ce8c941726c2400);
        return 1;
        duration = 30000;
        var_9d0c2841c15d2fcc = "upload_legion_intel_1";
    } else {
    LOC_000000ac:
        var_4e55fc12323ff73e = function_16ae6d8b5f25f31b("microphone_story");
        if (function_c5e0bac8f123cc88(player.team, var_4e55fc12323ff73e)) {
            if (istrue(teams::getteamdata(player.team, "placed_microphone"))) {
                duration = 10000;
                var_9d0c2841c15d2fcc = "upload_eavesdropped_audio";
                level thread function_1115d65bd80653e6(self, player, duration, var_9d0c2841c15d2fcc);
                return 1;
            }
        }
        if (isdefined(self.poi)) {
            if (function_c5e0bac8f123cc88(player.team, function_16ae6d8b5f25f31b("radio_uploads_story"))) {
                if ((self.poi == "sealion_coastalruins" || self.poi == "sealion_residential" || self.poi == "saba_observatory") && player namespace_aead94004cf4c147::function_d63a7299c6203bf9(19224)) {
                    switch (self.poi) {
                    case #"hash_b74d2013e0a73b91":
                        duration = 45000;
                        var_9d0c2841c15d2fcc = "upload_legion_intel_2";
                        break;
                    case #"hash_202632819760f0f3":
                        duration = 60000;
                        var_9d0c2841c15d2fcc = "upload_legion_intel_3";
                        break;
                    default:
                        duration = 30000;
                        var_9d0c2841c15d2fcc = "upload_legion_intel_1";
                        break;
                    }
                    level thread function_1115d65bd80653e6(self, player, duration, var_9d0c2841c15d2fcc);
                    return 1;
                }
            }
            var_4e21105a6086a3a7 = function_16ae6d8b5f25f31b("letter_upload_story");
            if (function_c5e0bac8f123cc88(player.team, var_4e21105a6086a3a7)) {
                level thread function_1115d65bd80653e6(self, player, 30000, "upload_mysterious_letter");
                return 1;
            }
            if (function_c5e0bac8f123cc88(player.team, function_16ae6d8b5f25f31b("phalanx_harddrive_story"))) {
                if (player namespace_aead94004cf4c147::function_d63a7299c6203bf9(32166) && player namespace_aead94004cf4c147::function_d63a7299c6203bf9(32132)) {
                    level thread function_1115d65bd80653e6(self, player, 30000, "upload_title_deed_drives_success");
                    return 1;
                }
            }
            if (function_c5e0bac8f123cc88(player.team, function_16ae6d8b5f25f31b("upload_konni_harddrive"))) {
                if (player namespace_aead94004cf4c147::function_d63a7299c6203bf9(32131) && player namespace_aead94004cf4c147::function_d63a7299c6203bf9(32168)) {
                    level thread function_1115d65bd80653e6(self, player, 30000, "upload_russian_hard_drive_to_shadow_company");
                    return 1;
                }
            }
            if (function_c5e0bac8f123cc88(player.team, function_16ae6d8b5f25f31b("hdd_upload_story"))) {
                if (self.poi == "saba_observatory" && player namespace_aead94004cf4c147::function_d63a7299c6203bf9(21648)) {
                    level thread function_1115d65bd80653e6(self, player, 60000, "upload_eavesdropped_audio");
                    return 1;
                }
            }
        }
        return 0;
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xeed5
// Size: 0xf9
function private function_1115d65bd80653e6(instance, player, duration, var_9d0c2841c15d2fcc, var_35203142d72cdc41) {
    namespace_e1bfa87a2a692d3c::function_94f937f05d8740c8(instance, player);
    if (!istrue(instance.var_b14a331ba425c286)) {
        return;
    }
    instance.var_68fa0b06cbf0a443[player.guid] = 1;
    var_45accc7124be3725 = spawnstruct();
    var_45accc7124be3725.var_bf7f7683ea10da26 = &function_6012affe882a1565;
    var_45accc7124be3725.var_35203142d72cdc41 = var_35203142d72cdc41;
    var_45accc7124be3725.instance = instance;
    var_45accc7124be3725.var_9d0c2841c15d2fcc = var_9d0c2841c15d2fcc;
    var_45accc7124be3725.origin = instance.origin;
    var_45accc7124be3725 function_d3428ebfda80edeb("ui_map_icon_obj_intel", (0, 0, 50));
    var_45accc7124be3725 thread namespace_e1bfa87a2a692d3c::function_66998e5e0034b2bb(player.team, instance, var_45accc7124be3725.objidnum, duration);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xefd5
// Size: 0xb1
function private function_6012affe882a1565(team) {
    foreach (player in teams::getteamdata(team, "players")) {
        namespace_5a22b6f3a56f7e9b::function_26259bd38697b5ad(self.objidnum, player);
    }
    namespace_19b4203b51d56488::releaseid();
    function_8a7a2427622e7572(team, self.var_9d0c2841c15d2fcc, 1);
    if (isdefined(self.var_35203142d72cdc41)) {
        [[ self.var_35203142d72cdc41 ]](self.var_21280a92d9373b6f);
    }
    self notify("task_ended");
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf08d
// Size: 0x25
function function_a3e1795e126d3738(player) {
    if (!function_cff2f4f168b29b81()) {
        return;
    }
    function_8359cadd253f9604(player, "plant_tac_cam_core_room", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf0b9
// Size: 0x50
function function_800f75fe5e5c7462(player, var_b35522ae1f278555) {
    if (!function_cff2f4f168b29b81()) {
        return;
    }
    if (isdefined(var_b35522ae1f278555.poi)) {
        if (var_b35522ae1f278555.poi == "sealion_castle") {
            function_8359cadd253f9604(player, "trigger_trapper_trap", 1);
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf110
// Size: 0xfa
function function_ec8a620f07dbcb21() {
    level endon("game_ended");
    if (!namespace_36f464722d326bbe::function_ffbbb4525b11d5a2()) {
        return;
    }
    if (!function_cff2f4f168b29b81()) {
        return;
    }
    var_aaf949c4c3315031 = [];
    var_39de31482ab57867 = getent("lv1_generator_room", "script_noteworthy");
    while (1) {
        foreach (player in level.players) {
            if (isdefined(player) && isdefined(player.guid) && isalive(player) && !isdefined(var_aaf949c4c3315031[player.guid]) && player istouching(var_39de31482ab57867)) {
                function_8359cadd253f9604(player, "locate_generator_room", 1);
                var_aaf949c4c3315031[player.guid] = 1;
            }
        }
        wait(1);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xf211
// Size: 0x4f
function private onpoptire(player, isenemy) {
    if (!isenemy) {
        return;
    }
    minspeed = getdvarfloat(@"hash_e85d50ef5e31422", 10);
    if (self vehicle_getspeed() < minspeed) {
        return;
    }
    function_8359cadd253f9604(player, "pop_enemy_player_vehicle_tire", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xf267
// Size: 0x8d
function private onshatterwindow(damagedata) {
    if (!isdefined(damagedata) || !isdefined(damagedata.attacker) || !isplayer(damagedata.attacker)) {
        return;
    }
    if (!namespace_1f188a13f7e79610::vehicle_isenemytoplayer(self, damagedata.attacker)) {
        return;
    }
    minspeed = getdvarfloat(@"hash_e85d50ef5e31422", 10);
    if (self vehicle_getspeed() < minspeed) {
        return;
    }
    function_8359cadd253f9604(damagedata.attacker, "shatter_enemy_vehicle_window", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xf2fb
// Size: 0x8b
function private onsignalexfil(player, exfilstruct) {
    if (!isdefined(self.var_63e7335083210b7a)) {
        self.var_63e7335083210b7a = [];
    }
    if (isdefined(self.var_63e7335083210b7a[player.team])) {
        return;
    }
    self.var_63e7335083210b7a[player.team] = 1;
    function_8359cadd253f9604(player, "signal_any_exfil", 1);
    if (istrue(exfilstruct.var_5fda164731e59c13)) {
        return;
    }
    function_8359cadd253f9604(player, "signal_unique_exfil", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xf38d
// Size: 0x29
function private function_825c9ca2bbc7169f() {
    level thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("exfil_tracking_story"), (-8980, 4681, 405), 11206, 4);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xf3bd
// Size: 0xe4
function private onspawnexfilheli(var_7e6513b2ae0d5c1d) {
    if (!namespace_36f464722d326bbe::function_7ee65fae13124702()) {
        return;
    }
    var_6cfd049d9a6f1d75 = spawnscriptable("dmz_pmc_place_exfil_tracker", self.origin);
    var_6cfd049d9a6f1d75.var_7e6513b2ae0d5c1d = var_7e6513b2ae0d5c1d;
    var_6cfd049d9a6f1d75 utility::function_6e506f39f121ea8a(self, (-150, 105, -211.5), (180, 270, 20));
    var_6cfd049d9a6f1d75 function_ab5c0b42f31a0d20(function_16ae6d8b5f25f31b("exfil_tracking_story"));
    if (isdefined(self.var_1e897ae1c018b2c2)) {
        foreach (player in teams::getteamdata(self.var_1e897ae1c018b2c2, "players")) {
            var_6cfd049d9a6f1d75 disablescriptableplayeruse(player);
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0xf4a8
// Size: 0x9f
function private function_8db9f46c5668c0af(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    var_761f8b171e80e381 = istrue(player namespace_aead94004cf4c147::function_6f39f9916649ac48(11206, 1));
    if (!var_761f8b171e80e381) {
        player namespace_44abc05161e2e2cb::showerrormessage("PMC/NO_TRACKING_DEVICES_IN_BACKPACK");
        return;
    }
    instance setscriptablepartstate(part, "visible_unusable");
    event = ter_op(istrue(instance.var_7e6513b2ae0d5c1d), "final_exfil_heli_plant", "exfil_heli_plant");
    function_8359cadd253f9604(player, event, 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xf54e
// Size: 0xe4
function private function_81365960be26e970() {
    var_3531236d1a437a5c = getstruct("pmc_boating_and_entering_cache", "script_noteworthy");
    if (!isdefined(var_3531236d1a437a5c) || !isdefined(var_3531236d1a437a5c.origin)) {
        return;
    }
    level.var_9e5144fe5a8d9020 = 0;
    level.var_f9dc2c104ad6d123 = spawnscriptable("br_loot_cache_lege", var_3531236d1a437a5c.origin, function_53c4c53197386572(var_3531236d1a437a5c.angles, (0, 0, 0)));
    level.var_f9dc2c104ad6d123 namespace_1b7e64f50cca9321::function_d683a60016231237(19241, 1);
    level.var_f9dc2c104ad6d123.var_c93ea8f612f4aaba = 1;
    level.var_e64e215320ea7ca1 = level.var_f9dc2c104ad6d123 namespace_58dcf42cf567f34f::function_c4d29f8f054e326b(level.var_f9dc2c104ad6d123.origin + (0, 0, 20), "generic_no_key");
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf639
// Size: 0xe0
function private function_c10af6c88ee96f56(player) {
    if (istrue(level.var_2c791a3626339e6)) {
        return;
    }
    level.var_2c791a3626339e6 = 1;
    level endon("caves_event_disabled");
    level.var_2d313239a1fedc04 = player.team;
    playerorigin = player.origin;
    wait(2);
    playsoundatpos(sortbydistance(level.var_12177faddacf1082, playerorigin)[0].origin, "mp_dmz_alrm_trap");
    wait(180);
    function_e469bcf32854cc04();
    var_bf12fbeec276acbe = sortbydistance(level.var_12177faddacf1082, (-3642.89, -94.2525, 433.417))[0];
    playsoundatpos(var_bf12fbeec276acbe.origin, "mp_dmz_alrm_trap");
    function_8ad0dc3070480b2b(var_bf12fbeec276acbe.origin, 6, "sealion_beachclub");
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0xf720
// Size: 0xce
function private function_71b0774fb2e6261f(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!isdefined(level.var_12177faddacf1082)) {
        return;
    }
    if (!array_contains(level.var_12177faddacf1082, instance)) {
        return;
    }
    if (!isdefined(level.var_f9dc2c104ad6d123)) {
        return;
    }
    if (istrue(instance.used)) {
        return;
    }
    instance.used = 1;
    player thread namespace_cb965d2f71fefddc::playerplaypickupanim();
    level thread function_c10af6c88ee96f56(player);
    level.var_9e5144fe5a8d9020++;
    if (level.var_9e5144fe5a8d9020 >= 9) {
        level thread function_3a8deba1c5443f74();
    }
    function_8a7a2427622e7572(level.var_2d313239a1fedc04, "sealion_electric_breaker", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf7f5
// Size: 0x9f
function private function_e469bcf32854cc04() {
    foreach (scriptable in level.var_12177faddacf1082) {
        state = scriptable getscriptablepartstate("electrical_box");
        if (state == "on") {
            scriptable setscriptablepartstate("electrical_box", "unusable_on");
        } else if (state == "off") {
            scriptable setscriptablepartstate("electrical_box", "unusable_off");
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf89b
// Size: 0xcd
function private function_3a8deba1c5443f74() {
    level notify("caves_event_disabled");
    level.var_e64e215320ea7ca1 namespace_58dcf42cf567f34f::function_f3b1f1d41c65b340();
    var_27e49251bb3376ea = undefined;
    foreach (player in teams::getteamdata(level.var_2d313239a1fedc04, "players")) {
        if (!isdefined(player) || !isalive(player)) {
            return;
        }
        var_27e49251bb3376ea = player;
        break;
    }
    if (isdefined(var_27e49251bb3376ea)) {
        var_27e49251bb3376ea namespace_ede58c1e66c2c280::calloutmarkerping_createcallout(19, (0, 0, 100), level.var_f9dc2c104ad6d123.index);
    }
    waittillframeend();
    function_e469bcf32854cc04();
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xf96f
// Size: 0x29
function private function_fe20dc47d6a83b30() {
    level thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("biolabs_harddrive_story"), (-8980, 4681, 405), 19240, 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xf99f
// Size: 0x80
function private function_8305df6d2c121acb() {
    var_651c7ab3f07b0718 = getstruct("pmc_server_room_computer", "script_noteworthy");
    if (!isdefined(var_651c7ab3f07b0718)) {
        return;
    }
    level.var_adc92e54d3179af = spawnscriptable("dmz_pmc_place_harddrive", var_651c7ab3f07b0718.origin, var_651c7ab3f07b0718.angles);
    level.var_adc92e54d3179af function_d3428ebfda80edeb("ui_map_icon_obj_intel", (0, 0, 5));
    level.var_adc92e54d3179af thread function_c1c1f536ab7b9c6b();
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0xfa26
// Size: 0x43
function private function_23b4bc828cd125ea(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    level thread function_8df84ba9405587b(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfa70
// Size: 0x2b9
function private function_8df84ba9405587b(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!isdefined(player) || !isdefined(player.team)) {
        return;
    }
    var_870b7252d19b6b4 = 0;
    var_cf727733e585e945 = istrue(player namespace_aead94004cf4c147::function_6f39f9916649ac48(19240, 1));
    if (!var_cf727733e585e945) {
        var_870b7252d19b6b4 = istrue(player namespace_aead94004cf4c147::function_6f39f9916649ac48(19241, 1));
        if (!var_870b7252d19b6b4) {
            player namespace_44abc05161e2e2cb::showerrormessage("PMC_S2/CANT_USE_THIS");
            return;
        }
    }
    player thread namespace_cb965d2f71fefddc::playerplaypickupanim();
    instance setscriptablepartstate(part, "visible_unusable");
    objidnum = level.var_adc92e54d3179af.objidnum;
    level.var_9629782fe725d345 = player.team;
    namespace_5a22b6f3a56f7e9b::objective_teammask_single(objidnum, player.team);
    instance notify("download_started");
    instance thread function_2ae7954a827cf6a1();
    progress = 0;
    var_f26d6e29f4efc048 = 0;
    while (progress < 150) {
        if (level.var_cae5a4efc6320920.size > 0) {
            progress = progress + level.framedurationseconds;
        }
        if (var_f26d6e29f4efc048 < 1 && progress > 4) {
            function_22fa1e423c72c2a(1250);
            var_f26d6e29f4efc048 = 1;
        } else if (var_f26d6e29f4efc048 < 2 && progress > 50) {
            function_22fa1e423c72c2a(2500);
            var_f26d6e29f4efc048 = 2;
        } else if (var_f26d6e29f4efc048 < 3 && progress > 100) {
            function_22fa1e423c72c2a(4000);
            var_f26d6e29f4efc048 = 3;
        }
        objective_setprogress(objidnum, clamp(progress / 150, 0, 1));
        waitframe();
    }
    foreach (var_6b8130899cd021f4 in level.var_cae5a4efc6320920) {
        namespace_5a22b6f3a56f7e9b::function_26259bd38697b5ad(objidnum, var_6b8130899cd021f4);
    }
    instance notify("download_ended");
    instance setscriptablepartstate(part, "invisible_unusable");
    var_a620cb0e6444887f = ter_op(var_cf727733e585e945, "brloot_black_mous_harddrive_downloaded", "brloot_experiment_harddrive_decrypted");
    var_776f4d5dcb35850f = spawnscriptable(var_a620cb0e6444887f, instance.origin, instance.angles);
    namespace_cb965d2f71fefddc::registerscriptableinstance(var_776f4d5dcb35850f);
    var_776f4d5dcb35850f.var_bbc200bc77c5db2b = 1;
    while (isdefined(var_776f4d5dcb35850f)) {
        waitframe();
    }
    namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(objidnum);
    wait(2);
    instance thread function_c1c1f536ab7b9c6b();
    instance setscriptablepartstate(part, "invisible_usable");
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfd30
// Size: 0x50
function private function_22fa1e423c72c2a(radius) {
    playsoundatpos(level.var_adc92e54d3179af.origin, "mp_dmz_alrm_trap");
    namespace_bfef6903bca5845d::function_353fecd1549f5f42(level.var_adc92e54d3179af.origin, radius, level.var_4b195d3dd0024b9c, 4);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfd87
// Size: 0x1df
function private function_2ae7954a827cf6a1() {
    self endon("download_ended");
    origin = level.var_adc92e54d3179af.origin;
    objidnum = level.var_adc92e54d3179af.objidnum;
    level.var_cae5a4efc6320920 = [];
    while (1) {
        var_c8dadd43aefdc396 = [];
        foreach (player in level.players) {
            if (isdefined(player.origin) && is_equal(player.team, level.var_9629782fe725d345) && distancesquared(origin, player.origin) < 122500) {
                var_c8dadd43aefdc396[var_c8dadd43aefdc396.size] = player;
            }
        }
        var_e34e332590ac462 = array_difference(var_c8dadd43aefdc396, level.var_cae5a4efc6320920);
        var_ea6b4eeeaea5cdc3 = array_difference(level.var_cae5a4efc6320920, var_c8dadd43aefdc396);
        foreach (player in var_e34e332590ac462) {
            namespace_5a22b6f3a56f7e9b::function_ce702e5925e31fc9(objidnum, player, 2, 2, "DMZ/UPLOAD_STATION_PROGRESS");
        }
        foreach (player in var_ea6b4eeeaea5cdc3) {
            namespace_5a22b6f3a56f7e9b::function_26259bd38697b5ad(objidnum, player);
        }
        level.var_cae5a4efc6320920 = var_c8dadd43aefdc396;
        wait(1);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xff6d
// Size: 0x227
function private function_c1c1f536ab7b9c6b() {
    self endon("download_started");
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level namespace_4b0406965e556711::gameflagwait("prematch_done");
    }
    foreach (player in level.players) {
        self disablescriptableplayeruse(player);
    }
    origin = level.var_adc92e54d3179af.origin;
    objidnum = level.var_adc92e54d3179af.objidnum;
    var_436336afa9e7c28a = [];
    while (1) {
        var_b39a5638271f4b06 = [];
        foreach (player in level.players) {
            if (isdefined(player.origin) && distancesquared(origin, player.origin) < 122500 && (player namespace_aead94004cf4c147::function_d63a7299c6203bf9(19240) || player namespace_aead94004cf4c147::function_d63a7299c6203bf9(19241))) {
                var_b39a5638271f4b06[var_b39a5638271f4b06.size] = player;
            }
        }
        var_196224c27ca169c = array_difference(var_b39a5638271f4b06, var_436336afa9e7c28a);
        var_e46940998b5c5eca = array_difference(var_436336afa9e7c28a, var_b39a5638271f4b06);
        foreach (player in var_196224c27ca169c) {
            self enablescriptableplayeruse(player);
        }
        foreach (player in var_e46940998b5c5eca) {
            self disablescriptableplayeruse(player);
        }
        var_436336afa9e7c28a = var_b39a5638271f4b06;
        wait(1);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1019b
// Size: 0xf4
function private function_bdfd9501e21e7259() {
    if (!namespace_36f464722d326bbe::function_7ee65fae13124702()) {
        return;
    }
    namespace_7f0bcee5d45a1dea::add("player_connect", &function_2f274301f86d64e0);
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("dmz_train_tracking_placement", &function_10545602cd6cf0a9);
    missionid = function_16ae6d8b5f25f31b("track_train_story");
    level thread function_315e9c3a5fb405e5(missionid, (22656, -55352, 696), 11206, 9);
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level namespace_4b0406965e556711::gameflagwait("prematch_done");
    }
    flag_wait("wztrain_scriptables_spawned");
    foreach (scriptable in getentitylessscriptablearray(undefined, undefined, undefined, undefined, "dmz_train_tracking_placement")) {
        scriptable setscriptablepartstate("dmz_train_tracking_placement", "invisible_usable");
        scriptable function_ab5c0b42f31a0d20(missionid);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10296
// Size: 0x6e
function private function_10545602cd6cf0a9(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!istrue(player namespace_aead94004cf4c147::function_6f39f9916649ac48(11206, 1))) {
        player namespace_44abc05161e2e2cb::showerrormessage("PMC/NO_TRACKING_DEVICES_IN_BACKPACK");
        return;
    }
    instance setscriptablepartstate(part, "visible_unusable");
    function_8359cadd253f9604(player, "plant_tracker_cargo_train", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1030b
// Size: 0xa3
function private function_2f274301f86d64e0(params) {
    self endon("disconnect");
    if (!isdefined(self.team) || !function_c5e0bac8f123cc88(self.team, function_16ae6d8b5f25f31b("track_train_story"))) {
        return;
    }
    flag_wait("wztrain_array_set");
    var_6b111dc033d6f700 = undefined;
    while (1) {
        var_357562058ea1c391 = namespace_9db09f982acd35b4::function_31156831afc882ad();
        if (isdefined(var_357562058ea1c391) && !is_equal(var_357562058ea1c391, var_6b111dc033d6f700) && var_357562058ea1c391 == "cargo_train") {
            function_8359cadd253f9604(self, "get_on_cargo_train", 1);
            return;
        }
        var_6b111dc033d6f700 = var_357562058ea1c391;
        wait(1);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x103b5
// Size: 0x1b
function private function_3cb0e100c1dc6f26() {
    level thread function_280edf3f47535ae9("pmc_sealion_castle_trigger", "script_noteworthy", "locate_sealion_castle");
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x103d7
// Size: 0x29
function private function_caabc88d74ae0ae3() {
    level thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("instructions_story"), (22656, -55352, 696), 19233, 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x10407
// Size: 0x72
function private function_47c562560e28ebc7() {
    var_10ea8a6407d668da = getstruct("pmc_atc_console", "script_noteworthy");
    if (!isdefined(var_10ea8a6407d668da)) {
        return;
    }
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level namespace_4b0406965e556711::gameflagwait("prematch_done");
    }
    prompt = spawnscriptable("dmz_pmc_call_in_plane", var_10ea8a6407d668da.origin);
    prompt function_ab5c0b42f31a0d20(function_16ae6d8b5f25f31b("destroy_plane_story"));
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x10480
// Size: 0x9f
function private function_969b576411f99ad(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!isdefined(player.team) || !function_c5e0bac8f123cc88(player.team, function_16ae6d8b5f25f31b("destroy_plane_story"))) {
        player namespace_44abc05161e2e2cb::showerrormessage("PMC_S2/CANT_USE_THIS");
        instance disablescriptableplayeruse(player);
        return;
    }
    instance setscriptablepartstate(part, "invisible_unusable");
    function_8359cadd253f9604(player, "destroy_plane_call_in", 1);
    level thread function_700e4f86ff237db();
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10526
// Size: 0x4e
function private function_700e4f86ff237db() {
    plane = namespace_7afff53e7b73476b::function_9c57f5d58c4333ce();
    plane setscriptablepartstate("objective", "active_red");
    plane endon("deleted");
    team = plane waittill("plane_hit");
    function_8a7a2427622e7572(team, "destroy_plane_destroy", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1057b
// Size: 0x11e
function private function_de99e97cbc765508() {
    bomb = getentitylessscriptablearray(undefined, undefined, undefined, undefined, "brloot_explosive_charge");
    destination = getstruct("pmc_transporter_bombsite", "script_noteworthy");
    if (!isdefined(bomb) || bomb.size == 0 || !isdefined(destination)) {
        return;
    }
    level.var_58ea889cd5f8ae84 = bomb[0];
    destination.site = spawnscriptable("dmz_supply_site", destination.origin, destination.angles);
    level.var_4b66829e86ada86 = destination;
    destination.prompt = spawnscriptable("dmz_pmc_transporter_plant", destination.origin);
    level.var_a3f54943d4b96da2 = spawn("script_origin", level.var_58ea889cd5f8ae84.origin);
    level.var_a3f54943d4b96da2 thread function_63603418e8aa6cfa();
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level namespace_4b0406965e556711::gameflagwait("prematch_done");
    }
    destination.prompt function_ab5c0b42f31a0d20(function_16ae6d8b5f25f31b("transport_bomb_story"));
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x106a0
// Size: 0x5a3
function private function_63603418e8aa6cfa() {
    self endon("delete");
    destination = level.var_4b66829e86ada86;
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level namespace_4b0406965e556711::gameflagwait("prematch_done");
    }
    endtime = gettime() + 300000;
    var_95390aefe43f2fc7 = [];
    var_95390aefe43f2fc7[10000] = [0:"dmz_bombsite_warning_beep_05", 1:0.5];
    var_95390aefe43f2fc7[30000] = [0:"dmz_bombsite_warning_beep_04", 1:1.5];
    var_95390aefe43f2fc7[60000] = [0:"dmz_bombsite_warning_beep_03", 1:3];
    var_95390aefe43f2fc7[150000] = [0:"dmz_bombsite_warning_beep_02", 1:5];
    var_95390aefe43f2fc7[300000] = [0:"dmz_bombsite_warning_beep_01", 1:7];
    var_1d24d18e8f904d2d = [];
    while (gettime() < endtime) {
        timeleft = endtime - gettime();
        sound = undefined;
        waittime = undefined;
        foreach (time, var_d41b4def32764658 in var_95390aefe43f2fc7) {
            if (timeleft <= time) {
                sound = var_d41b4def32764658[0];
                waittime = var_d41b4def32764658[1];
                break;
            }
        }
        if (soundexists(sound)) {
            self playsound(sound);
        }
        wait(waittime);
        if (isdefined(level.var_75434aa809a31eb6) && isdefined(level.var_75434aa809a31eb6.team) && !istrue(var_1d24d18e8f904d2d[level.var_75434aa809a31eb6.team]) && distance(self.origin, destination.origin) < 200) {
            var_1d24d18e8f904d2d[level.var_75434aa809a31eb6.team] = 1;
            function_8359cadd253f9604(level.var_75434aa809a31eb6, "transport_bomb_plant", 1);
        }
    }
    function_81c6d95294b1ece3(self.origin, self);
    destination.prompt setscriptablepartstate("dmz_pmc_transporter_plant", "invisible_unusable");
    if (distance(self.origin, destination.origin) < 200) {
        function_8359cadd253f9604(level.var_75434aa809a31eb6, "transport_bomb_explode", 1);
        explosioneffect = spawnfx(level._effect["bombsite_explosion"], destination.origin);
        explosioneffect thread function_b4b04de87729a6f3(10);
        triggerfx(explosioneffect);
        physicsexplosionsphere(destination.origin, 200, 100, 3);
        playrumbleonposition("grenade_rumble", self.origin);
        earthquake(0.75, 2, self.origin, 2000);
        destination.site setscriptablepartstate("dmz_supply_site", "destroyed");
    }
    self delete();
    if (!isdefined(level.var_58ea889cd5f8ae84)) {
        return;
    }
    if (isent(level.var_58ea889cd5f8ae84) && isplayer(level.var_58ea889cd5f8ae84)) {
        level.var_58ea889cd5f8ae84 namespace_aead94004cf4c147::function_6f39f9916649ac48(19215, 1);
    } else if (isdefined(level.var_58ea889cd5f8ae84.var_556db0b72a96514e)) {
        if (!isdefined(level.var_75434aa809a31eb6) || !isdefined(level.var_75434aa809a31eb6.guid)) {
            return;
        }
        guid = level.var_75434aa809a31eb6.guid;
        if (!isdefined(level.var_58ea889cd5f8ae84.var_556db0b72a96514e[guid]) || !isdefined(level.var_58ea889cd5f8ae84.var_556db0b72a96514e[guid].contents)) {
            return;
        }
        foreach (index, item in level.var_58ea889cd5f8ae84.var_556db0b72a96514e[guid].contents) {
            if (item["lootID"] == 19215) {
                level.var_58ea889cd5f8ae84.var_556db0b72a96514e[guid].contents[index]["lootID"] = 0;
                level.var_58ea889cd5f8ae84.var_556db0b72a96514e[guid].contents[index]["quantity"] = 0;
            }
        }
    } else if (isdefined(level.var_58ea889cd5f8ae84.contents)) {
        foreach (index, item in level.var_58ea889cd5f8ae84.contents) {
            if (item["lootID"] == 19215) {
                level.var_58ea889cd5f8ae84.contents[index]["lootID"] = 0;
                level.var_58ea889cd5f8ae84.contents[index]["quantity"] = 0;
            }
        }
    } else if (level.var_58ea889cd5f8ae84 function_73cc0f04c4c5001d()) {
        namespace_cb965d2f71fefddc::deregisterscriptableinstance(level.var_58ea889cd5f8ae84);
        level.var_58ea889cd5f8ae84 freescriptable();
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x10c4a
// Size: 0x6b
function private function_80e7bbf0a2202b9b(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    var_e2695a141b4f2bc3 = player namespace_aead94004cf4c147::function_e05897f5d860188e(19215, undefined, 1);
    if (!isdefined(var_e2695a141b4f2bc3)) {
        player namespace_44abc05161e2e2cb::showerrormessage("PMC_S2/PLACE_ERR_MSG");
        return;
    }
    player thread namespace_cb965d2f71fefddc::quickdropitem(10, var_e2695a141b4f2bc3);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10cbc
// Size: 0x3c
function private onconnect(params) {
    if (namespace_36f464722d326bbe::function_ffbbb4525b11d5a2()) {
        function_8359cadd253f9604(self, "infil_biolabs", 1);
    }
    if (namespace_36f464722d326bbe::function_ee0c2958aa2ee59e()) {
        function_8359cadd253f9604(self, "infil_biobunker", 1);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10cff
// Size: 0x46
function private ondisconnect(params) {
    if (getdvarint(@"hash_8f63416f53600636", 1)) {
        return;
    }
    if (namespace_aead94004cf4c147::function_d63a7299c6203bf9(21646)) {
        function_56f9b7d959b1704b();
    }
    if (namespace_aead94004cf4c147::function_d63a7299c6203bf9(19215)) {
        function_239568ca276a3ae6();
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10d4c
// Size: 0x6f
function private function_239568ca276a3ae6() {
    if (!isdefined(self) || !isdefined(self.origin)) {
        function_fcceb181033ee1ef();
        return;
    }
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(self.origin, self.angles);
    bomb = namespace_cb965d2f71fefddc::spawnpickup("brloot_explosive_charge", var_cb4fad49263e20c4, 1);
    function_2ba521e376d3e4a5(bomb, self, var_cb4fad49263e20c4.origin);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10dc2
// Size: 0x14
function private function_fcceb181033ee1ef() {
    level.var_a3f54943d4b96da2 notify("delete");
    return 0;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x10dde
// Size: 0x24
function private function_d3ac71d99075cecd(player, item) {
    level.var_a3f54943d4b96da2 notify("delete");
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10e09
// Size: 0xbd
function private function_2ba521e376d3e4a5(scriptable, owner, var_d7a9fdc121364c8d) {
    level.var_a3f54943d4b96da2 unlink();
    if (isdefined(var_d7a9fdc121364c8d)) {
        level.var_a3f54943d4b96da2.origin = var_d7a9fdc121364c8d;
    }
    if (isdefined(scriptable) && isdefined(scriptable.var_bf8e5f003146af44)) {
        level.var_a3f54943d4b96da2 linkto(scriptable.var_bf8e5f003146af44);
    }
    level.var_58ea889cd5f8ae84 = scriptable;
    if (distance(scriptable.origin, level.var_4b66829e86ada86.origin) < 200) {
        playsoundatpos(scriptable.origin, "dmz_mission_bomb_arm");
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x10ecd
// Size: 0x89
function private function_e71ca8a81f647309(container, owner) {
    level.var_a3f54943d4b96da2 unlink();
    if (isdefined(container)) {
        if (isdefined(container.origin)) {
            level.var_a3f54943d4b96da2.origin = container.origin;
        }
        if (isdefined(container.var_bf8e5f003146af44)) {
            level.var_a3f54943d4b96da2 linkto(container.var_bf8e5f003146af44);
        }
    }
    level.var_58ea889cd5f8ae84 = container;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x10f5d
// Size: 0xdc
function private function_fe936ca269bd714d(var_5793a0cf9d352c92, lootid) {
    if (isdefined(self.var_2fa5b49969def47) && isdefined(self.var_2fa5b49969def47.origin) && isdefined(self.team)) {
        function_fcceb181033ee1ef();
        return function_a28e5fe14b06de35(self.var_2fa5b49969def47, 19215);
    }
    level.var_a3f54943d4b96da2 unlink();
    if (isdefined(self.var_2fa5b49969def47) && isdefined(self.var_2fa5b49969def47.origin)) {
        level.var_a3f54943d4b96da2.origin = self.var_2fa5b49969def47.origin;
    }
    level.var_58ea889cd5f8ae84 = self.var_2fa5b49969def47;
    return [0:19215, 1:1];
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x11041
// Size: 0x7a
function private function_942941c058f16b20(scriptable, player) {
    level.var_a3f54943d4b96da2 unlink();
    if (isdefined(player)) {
        level.var_75434aa809a31eb6 = player;
        if (isdefined(player.origin)) {
            level.var_a3f54943d4b96da2.origin = player.origin;
        }
        level.var_a3f54943d4b96da2 linkto(player);
    }
    level.var_58ea889cd5f8ae84 = player;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x110c2
// Size: 0x267
function private function_f8d258990c78569(lootid) {
    if (!namespace_36f464722d326bbe::function_7ee65fae13124702() && !namespace_36f464722d326bbe::function_e21746abaaaf8414()) {
        return [0:lootid, 1:undefined];
    }
    if (!isdefined(self.var_2fa5b49969def47.var_556db0b72a96514e) || !isdefined(self.var_2fa5b49969def47.var_556db0b72a96514e[self.guid])) {
        return [0:lootid, 1:undefined];
    }
    var_6152ab3d3d329811 = [0:8408, 1:9104, 2:8569];
    var_71f687d0cc8ce37d = [];
    foreach (item in var_6152ab3d3d329811) {
        if (item == lootid) {
            continue;
        }
        var_ecabdc27d567d5a1 = namespace_3f0ea7483345a2c0::getindexforlootidincontainer(self.var_2fa5b49969def47, item, self);
        _ = var_ecabdc27d567d5a1[1];
        itemindex = var_ecabdc27d567d5a1[0];
        if (!isdefined(itemindex)) {
            return [0:lootid, 1:1];
        }
        var_71f687d0cc8ce37d[var_71f687d0cc8ce37d.size] = itemindex;
    }
    if (istrue(level.var_16677a8421e20c23)) {
        self.var_2fa5b49969def47 thread function_5a9dc1917ed8bcdf(self);
        return [0:lootid, 1:undefined];
    }
    foreach (itemindex in var_71f687d0cc8ce37d) {
        self.var_2fa5b49969def47.var_556db0b72a96514e[self.guid].contents[itemindex]["quantity"] = self.var_2fa5b49969def47.var_556db0b72a96514e[self.guid].contents[itemindex]["quantity"] - 1;
        self.var_2fa5b49969def47.var_556db0b72a96514e[self.guid].contents[itemindex]["noExtract"] = undefined;
    }
    namespace_92fc655e328c1a9f::function_ce9b69fc041571d2(self, self.var_2fa5b49969def47);
    function_f40c67796c17fbcb();
    return [0:21646, 1:1];
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11331
// Size: 0x21
function function_5a9dc1917ed8bcdf(player) {
    self waittill("closed");
    player namespace_44abc05161e2e2cb::showerrormessage("PMC_S2/SOMEONE_ALREADY_MADE_RADIOACTIVE_CHARGE");
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11359
// Size: 0x8f
function private function_f40c67796c17fbcb() {
    if (!namespace_7789f919216d38a2::radiation_isinit()) {
        return;
    }
    level.var_16677a8421e20c23 = 1;
    level.var_9c0e86c22acf2968 = 1;
    scriptable = spawnscriptable("dmz_pmc_use_radiation", namespace_7789f919216d38a2::function_f3fb60f986f267c5());
    var_45253047e760f6a6 = ter_op(namespace_36f464722d326bbe::function_7ee65fae13124702(), "usable_saba", "usable_sealion");
    scriptable setscriptablepartstate("dmz_pmc_use_radiation", var_45253047e760f6a6);
    scriptable function_ab5c0b42f31a0d20(function_16ae6d8b5f25f31b("radiation_bomb_story"));
    function_f8f2890a42f13746();
    level thread function_f65b07ef19699719();
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x113ef
// Size: 0x260
function private function_f65b07ef19699719() {
    level.var_6ceeaaa97aa7c2e9 = 0;
    var_8078d5974e1b58f0 = [];
    while (istrue(level.var_9c0e86c22acf2968)) {
        level.var_6ceeaaa97aa7c2e9 = 0;
        var_e01568fe8f58645b = [];
        if (isdefined(level.var_8654b69976fbaee8) && isdefined(level.var_8654b69976fbaee8.origin)) {
            foreach (player in utility::playersinsphere(level.var_8654b69976fbaee8.origin, 500)) {
                namespace_7789f919216d38a2::function_c4a3072ce7b3f1fd(player, 1, 1);
                if (is_equal(level.var_e301c40b562dbd9d, player.team)) {
                    level.var_6ceeaaa97aa7c2e9 = 1;
                    var_e01568fe8f58645b[var_e01568fe8f58645b.size] = player;
                }
            }
        }
        if (isdefined(level.var_e301c40b562dbd9d) && isdefined(level.var_d21f44d30e9fbcae)) {
            var_5b27284c6a5e1168 = array_difference(var_e01568fe8f58645b, var_8078d5974e1b58f0);
            var_5008853324a21a45 = array_difference(var_8078d5974e1b58f0, var_e01568fe8f58645b);
            foreach (player in var_5b27284c6a5e1168) {
                namespace_5a22b6f3a56f7e9b::function_ce702e5925e31fc9(level.var_d21f44d30e9fbcae, player, 2, 2, "PMC_S2/ARMING_BOMB");
            }
            foreach (player in var_5008853324a21a45) {
                namespace_5a22b6f3a56f7e9b::function_26259bd38697b5ad(level.var_d21f44d30e9fbcae, player);
            }
            var_8078d5974e1b58f0 = var_e01568fe8f58645b;
        }
        wait(1);
    }
    if (isdefined(level.var_d21f44d30e9fbcae)) {
        foreach (player in var_8078d5974e1b58f0) {
            namespace_5a22b6f3a56f7e9b::function_26259bd38697b5ad(level.var_d21f44d30e9fbcae, player);
        }
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(level.var_d21f44d30e9fbcae);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x11656
// Size: 0x72
function private function_26c3b83e972a14fd(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!istrue(player namespace_aead94004cf4c147::function_6f39f9916649ac48(21646, 1))) {
        player namespace_44abc05161e2e2cb::showerrormessage("PMC_S2/NO_RADIOACTIVE_CHARGE");
        return;
    }
    instance freescriptable();
    function_8359cadd253f9604(player, "plant_radioactive_charge", 1);
    level thread function_bc2e5c079bf6b8f2(player);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x116cf
// Size: 0x143
function private function_bc2e5c079bf6b8f2(player) {
    bomb = spawnscriptable("brloot_radioactive_charge", drop_to_ground(player.origin, 50));
    bomb setscriptablepartstate("brloot_radioactive_charge", "unusable");
    function_65932d306cce787e(bomb);
    level.var_e301c40b562dbd9d = player.team;
    objidnum = bomb function_d3428ebfda80edeb("ui_map_icon_obj_bomb_collect", (0, 0, 15), level.var_e301c40b562dbd9d);
    level.var_d21f44d30e9fbcae = objidnum;
    progress = 0;
    while (progress < 60) {
        if (istrue(level.var_6ceeaaa97aa7c2e9)) {
            progress = progress + level.framedurationseconds;
            objective_setprogress(objidnum, clamp(progress / 60, 0, 1));
        }
        waitframe();
    }
    level.var_e301c40b562dbd9d = undefined;
    level.var_9c0e86c22acf2968 = undefined;
    function_81c6d95294b1ece3(bomb.origin, function_53c4c53197386572(player, bomb), "exp_radiation_boom_c");
    bomb freescriptable();
    namespace_7789f919216d38a2::function_9bc063861b9330f1(10);
    namespace_d696adde758cbe79::showdmzsplash("dmz_radiation_damage_increase", level.players);
    function_8359cadd253f9604(player, "explode_radioactive_charge", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11819
// Size: 0x78
function private function_56f9b7d959b1704b(params) {
    if (!isdefined(self) || !isdefined(self.origin)) {
        function_fcceb181033ee1ef();
        return;
    }
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(self.origin, self.angles);
    bomb = namespace_cb965d2f71fefddc::spawnpickup("brloot_radioactive_charge", var_cb4fad49263e20c4, 1);
    function_2ba521e376d3e4a5(bomb, self, var_cb4fad49263e20c4.origin);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x11898
// Size: 0xe
function private function_8bd9cfd763bcd0e4() {
    level.var_9c0e86c22acf2968 = undefined;
    return 0;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x118ae
// Size: 0x1e
function private function_2fdfbb52976ba9e(player, item) {
    level.var_9c0e86c22acf2968 = undefined;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x118d3
// Size: 0x26
function private function_65932d306cce787e(scriptable, owner, var_d7a9fdc121364c8d) {
    level.var_8654b69976fbaee8 = scriptable;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x11900
// Size: 0x1e
function private function_23f069dc1bff2ee0(container, owner) {
    level.var_8654b69976fbaee8 = container;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11925
// Size: 0x34
function private function_f8f2890a42f13746(var_5793a0cf9d352c92, lootid) {
    level.var_8654b69976fbaee8 = self.var_2fa5b49969def47;
    return [0:21646, 1:1];
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x11961
// Size: 0x1e
function private function_3e5ce38e7e8f69(scriptable, player) {
    level.var_8654b69976fbaee8 = player;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11986
// Size: 0x51
function function_944498dd24bc5348() {
    thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("track_submarines"), (21286, -16750, 3685), 11206, 1, 1);
    thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("track_submarines"), (-72.488, 1721.72, 434.75), 11206, 1, 2);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x119de
// Size: 0x2a
function function_38dd5f365b6d2135() {
    thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("track_biolabs_cargo"), (0, 0, 0), 11206, 7, 4);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11a0f
// Size: 0x2a
function function_2345dc4fa1f40628() {
    thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("plant_microphone"), (-7562, 2060, 512), 19217, 1, 2);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11a40
// Size: 0x2a
function function_126c379552e5f3b7() {
    thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("microphone_story"), (-72.488, 1721.72, 434.75), 19217, 1, 2);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11a71
// Size: 0x51
function function_71192f593da6cf() {
    thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("deliver_letter_story"), (-9152.06, -11234.5, 48), 32022, 1, 8);
    thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("deliver_letter_story"), (-9152.06, -11234.5, 48), 11206, 1, 8);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11ac9
// Size: 0x51
function function_573c2d675de0604c() {
    thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("phalanx_harddrive_story"), (4467, 8721, 124), 32166, 1, 8);
    thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("phalanx_harddrive_story"), (4297, -11455, 4590), 32132, 1, 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11b21
// Size: 0x94
function function_285b8dcd4ea4da26() {
    level.var_632f6a89b947fd5 = namespace_e0ee43ef2dddadaa::buildweapon("iw9_ar_akilo", [0:"rec_akilo", 1:"bar_lm_light_p04_akilo", 2:"stock_ar_p04_akilo", 3:"mag_ar_large_p04_akilo", 4:"holotherm01", 5:"ub_gl_drill_akilo", 6:"ammo_762s", 7:"pgrip_p04", 8:"silencer05_br"]);
    thread function_3079d4d1c0ee380e(function_16ae6d8b5f25f31b("kill_biobunker_bosses_weapon"), (4467, 8721, 124), level.var_632f6a89b947fd5, 8);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11bbc
// Size: 0x30
function function_8882ca663f07c0cf() {
    var_aba9018b1743d830 = getstruct("pmc_spawnrhib", "script_noteworthy");
    if (isdefined(var_aba9018b1743d830)) {
        namespace_1f188a13f7e79610::vehicle_spawn("veh9_rhib", var_aba9018b1743d830);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11bf3
// Size: 0xb7
function function_3de41a0f1613060f() {
    namespace_4b0406965e556711::function_1240434f4201ac9d("prematch_done");
    var_47d43cea8a553af1 = getstruct("pmc_spawn_jltv_radar", "script_noteworthy");
    if (isdefined(var_47d43cea8a553af1)) {
        missionid = function_16ae6d8b5f25f31b("delta_drive_poi");
        airdrop = spawnscriptable("pmc_airdrop_jltv_radar", var_47d43cea8a553af1.origin);
        airdrop function_ab5c0b42f31a0d20(missionid);
        airdrop setscriptablepartstate("pmc_airdrop_site", "ready");
        airdrop.origin = drop_to_ground(var_47d43cea8a553af1.origin);
        var_a06f4d6a943fff5b = namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("pmc_airdrop_site", &function_9d1f0973f606c702);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11cb1
// Size: 0x32
function function_4dd8f8cbcba13e0a() {
    thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("plant_fake_docs"), (4297, -11455, 4590), namespace_38b993c4618e76cd::getlootidfromref("brloot_fake_aq_intel"), 1, 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11cea
// Size: 0x32
function function_871ab85492b81d67() {
    thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("extract_plant_intel"), (-3419.62, -5825.94, 332), namespace_38b993c4618e76cd::getlootidfromref("brloot_biolab_usb"), 1, 2);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11d23
// Size: 0x32
function function_b4824dfa90ca1ab9() {
    thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("plant_ir_beacon_towers"), (21286, -16750, 3685), namespace_38b993c4618e76cd::getlootidfromref("brloot_ir_beacon"), 2, 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11d5c
// Size: 0x18
function function_b93ca7db745586f6() {
    if (namespace_76a219af07c28c13::function_6934349b7823d888()) {
        namespace_76a219af07c28c13::registerteamassimilatecallback(&function_4168098f4ad31178);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11d7b
// Size: 0x31
function function_4168098f4ad31178(player, oldteam, newteam) {
    if (!isdefined(newteam)) {
        return;
    }
    function_8359cadd253f9604(player, "complete_assimilation", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11db3
// Size: 0x93
function function_924e9e46e918d2ea() {
    level endon("game_ended");
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level namespace_4b0406965e556711::gameflagwait("prematch_done");
    }
    if (!namespace_36f464722d326bbe::function_5e0e3a24dbb1fae1()) {
        return;
    }
    var_c229d93c0bb4f8e8 = getstruct("brloot_valuable_vondelgas", "script_noteworthy");
    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, var_c229d93c0bb4f8e8.origin, var_c229d93c0bb4f8e8.angles);
    namespace_cb965d2f71fefddc::spawnpickup("brloot_valuable_vondelgas", var_cb4fad49263e20c4, 1, 0);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11e4d
// Size: 0xb5
function function_70280eb87761bcd0() {
    level endon("game_ended");
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level namespace_4b0406965e556711::gameflagwait("prematch_done");
    }
    if (!namespace_36f464722d326bbe::function_ee0c2958aa2ee59e()) {
        return;
    }
    id = function_16ae6d8b5f25f31b("gas_sample_story");
    players = function_4e577d33450caee4(id);
    if (!isdefined(players) || players.size <= 0) {
        return;
    }
    var_c229d93c0bb4f8e8 = getstruct("dmz_pmc_validate_gas", "script_noteworthy");
    useprompt = spawnscriptable("dmz_pmc_validate_gas", var_c229d93c0bb4f8e8.origin, var_c229d93c0bb4f8e8.angles);
    useprompt function_ab5c0b42f31a0d20(id);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x11f09
// Size: 0x101
function function_e3b5db8f3422827e(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    var_6760390f08fad126 = player namespace_aead94004cf4c147::function_106b52ed8f680043(32110);
    var_8edd6a16616bba27 = player namespace_aead94004cf4c147::function_106b52ed8f680043(32111);
    if (!isdefined(var_6760390f08fad126) || !isdefined(var_8edd6a16616bba27)) {
        return;
    }
    player namespace_aead94004cf4c147::function_db1dd76061352e5b(var_6760390f08fad126);
    player namespace_aead94004cf4c147::function_db1dd76061352e5b(var_8edd6a16616bba27);
    teammates = teams::getteamdata(player.team, "players");
    foreach (member in teammates) {
        instance disablescriptableplayeruse(player);
    }
    function_8359cadd253f9604(player, "validate_gas_samples", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x12011
// Size: 0x72
function private function_9c054602c73df809() {
    blackbox = getstruct("pmc_black_box", "script_noteworthy");
    if (!isdefined(blackbox)) {
        return;
    }
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level namespace_4b0406965e556711::gameflagwait("prematch_done");
    }
    scriptable = spawnscriptable("dmz_pmc_download_blackbox", blackbox.origin);
    scriptable function_ab5c0b42f31a0d20(function_16ae6d8b5f25f31b("plane_encounter"));
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x1208a
// Size: 0x3e
function private function_e5aa3c571f674bd3(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    instance thread function_7993f38e8643f95d(player);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x120cf
// Size: 0x1ef
function private function_7993f38e8643f95d(player) {
    if (istrue(self.downloading)) {
        return;
    }
    self.downloading = 1;
    team = player.team;
    objidnum = function_d3428ebfda80edeb("ui_map_icon_obj_scavenger", (0, 0, 20), player.team);
    var_90fb369a18926018 = [];
    foreach (player in teams::getteamdata(team, "players")) {
        self disablescriptableplayeruse(player);
        if (distancesquared(player.origin, self.origin) < 160000) {
            var_90fb369a18926018[var_90fb369a18926018.size] = player;
            namespace_5a22b6f3a56f7e9b::function_ce702e5925e31fc9(objidnum, player, 1, 2, "PMC_S2/DOWNLOADING_BLACKBOX");
        }
    }
    namespace_bfef6903bca5845d::function_353fecd1549f5f42(self.origin, 1200, level.var_4b195d3dd0024b9c, 4);
    progress = 0;
    while (progress < 10) {
        progress = progress + level.framedurationseconds;
        objective_setprogress(objidnum, clamp(progress / 10, 0, 1));
        waitframe();
    }
    foreach (player in var_90fb369a18926018) {
        namespace_5a22b6f3a56f7e9b::function_26259bd38697b5ad(objidnum, player);
    }
    namespace_19b4203b51d56488::releaseid();
    if (!isdefined(level.var_e250c5815c2e42f3)) {
        level.var_e250c5815c2e42f3 = [];
    }
    level.var_e250c5815c2e42f3[level.var_e250c5815c2e42f3.size] = team;
    function_8a7a2427622e7572(team, "plane_black_box_download", 1);
    self.downloading = 0;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x122c5
// Size: 0x9d
function function_f91e78aad103b663() {
    level.var_c891a425bf8cbc28 = namespace_e0ee43ef2dddadaa::buildweapon("iw9_dm_xmike2010", [0:"ammo_300wm", 1:"bar_sn_light_p20_xmike2010", 2:"bolt_p20", 3:"laserbox_ads01", 4:"mag_sn_p20_xmike2010", 5:"pgrip_p20_xmike2010", 6:"rec_xmike2010", 7:"silencer01_dm", 8:"snscope_therm01", 9:"stock_sn_p20"]);
    thread function_3079d4d1c0ee380e(function_16ae6d8b5f25f31b("chemist_kill_story"), (-26681, 2194, 1915), level.var_c891a425bf8cbc28, 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12369
// Size: 0x7b
function function_41c54a1f9c108720() {
    triggers = getstructarray("pmc_getawayvehicle_triggers", "script_noteworthy");
    if (!isdefined(triggers) || triggers.size == 0) {
        return;
    }
    foreach (struct in triggers) {
        thread function_4132600c37883f0b(struct);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x123eb
// Size: 0x11d
function function_4132600c37883f0b(struct) {
    trigger = spawn("noent_volume_trigger_radius", struct.origin, 0, struct.radius, 100);
    while (1) {
        ent = trigger waittill("trigger");
        if (!ent namespace_1f188a13f7e79610::isvehicle()) {
            continue;
        }
        if (ent namespace_1f188a13f7e79610::function_d93ec4635290febd() != "veh9_rhib") {
            continue;
        }
        driver = namespace_1fbd40990ee60ede::vehicle_occupancy_getdriver(ent);
        if (!isdefined(driver) || !isdefined(driver.team) || !isplayer(driver)) {
            continue;
        }
        if (isdefined(trigger.used) && isdefined(trigger.used[driver.team])) {
            continue;
        }
        if (!isdefined(trigger.used)) {
            trigger.used = [];
        }
        trigger.used[driver.team] = 1;
        function_8359cadd253f9604(driver, "park_rhib_sira", 1);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1250f
// Size: 0x244
function private function_4ad47f789dfad847(container, lootid) {
    if (!namespace_36f464722d326bbe::function_e21746abaaaf8414() || namespace_b66505f20cbf2570::function_30b30561882a2477(container) != "sealion_waterways") {
        return [0:lootid, 1:undefined];
    }
    if (!isdefined(self.var_2fa5b49969def47.var_556db0b72a96514e) || !isdefined(self.var_2fa5b49969def47.var_556db0b72a96514e[self.guid])) {
        return [0:lootid, 1:undefined];
    }
    var_6152ab3d3d329811 = [0:19214, 1:8408, 2:13372];
    var_71f687d0cc8ce37d = [];
    foreach (item in var_6152ab3d3d329811) {
        if (item == lootid) {
            continue;
        }
        var_bff06827b42c0dbd = namespace_3f0ea7483345a2c0::getindexforlootidincontainer(self.var_2fa5b49969def47, item, self);
        _ = var_bff06827b42c0dbd[1];
        itemindex = var_bff06827b42c0dbd[0];
        if (!isdefined(itemindex)) {
            return [0:lootid, 1:1];
        }
        var_71f687d0cc8ce37d[var_71f687d0cc8ce37d.size] = itemindex;
    }
    foreach (itemindex in var_71f687d0cc8ce37d) {
        self.var_2fa5b49969def47.var_556db0b72a96514e[self.guid].contents[itemindex]["quantity"] = self.var_2fa5b49969def47.var_556db0b72a96514e[self.guid].contents[itemindex]["quantity"] - 1;
        self.var_2fa5b49969def47.var_556db0b72a96514e[self.guid].contents[itemindex]["noExtract"] = undefined;
    }
    namespace_92fc655e328c1a9f::function_ce9b69fc041571d2(self, self.var_2fa5b49969def47);
    return [0:19216, 1:1];
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1275b
// Size: 0x20d
function private function_a28e5fe14b06de35(container, lootid) {
    if (!isdefined(self.var_2fa5b49969def47.var_556db0b72a96514e) || !isdefined(self.var_2fa5b49969def47.var_556db0b72a96514e[self.guid])) {
        return [0:lootid, 1:undefined];
    }
    var_6152ab3d3d329811 = [0:19215];
    var_71f687d0cc8ce37d = [];
    foreach (item in var_6152ab3d3d329811) {
        if (item == lootid) {
            continue;
        }
        var_bff05b27b42bf126 = namespace_3f0ea7483345a2c0::getindexforlootidincontainer(self.var_2fa5b49969def47, item, self);
        _ = var_bff05b27b42bf126[1];
        itemindex = var_bff05b27b42bf126[0];
        if (!isdefined(itemindex)) {
            return [0:lootid, 1:1];
        }
        var_71f687d0cc8ce37d[var_71f687d0cc8ce37d.size] = itemindex;
    }
    foreach (itemindex in var_71f687d0cc8ce37d) {
        self.var_2fa5b49969def47.var_556db0b72a96514e[self.guid].contents[itemindex]["quantity"] = self.var_2fa5b49969def47.var_556db0b72a96514e[self.guid].contents[itemindex]["quantity"] - 1;
        self.var_2fa5b49969def47.var_556db0b72a96514e[self.guid].contents[itemindex]["noExtract"] = undefined;
    }
    namespace_92fc655e328c1a9f::function_ce9b69fc041571d2(self, self.var_2fa5b49969def47);
    return [0:32107, 1:1];
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12970
// Size: 0x69
function function_45dcf3dfcc5d1674() {
    var_e2a9adc592527cf3 = getentitylessscriptablearray(undefined, undefined, undefined, undefined, "brloot_valuable_fuelrods");
    foreach (var_cb89020314445a32 in var_e2a9adc592527cf3) {
        namespace_96abc792b7f61807::function_f0d61e14dfde9ccd(var_cb89020314445a32);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x129e0
// Size: 0x19
function function_265739b4859488d7() {
    function_89a7111bd154e223("pmc_observatory_car_crash_trigger", "script_noteworthy", "locate_car_crash");
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12a00
// Size: 0x19
function function_bb6de40dd726b4d9() {
    function_280edf3f47535ae9("pmc_plane_crash_trigger", "script_noteworthy", "locate_plane_crash_site");
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12a20
// Size: 0x32
function function_359f7f436de6ba09() {
    thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("redacted_1_zero_tolerance"), (-26681, 2194, 1915), namespace_38b993c4618e76cd::getlootidfromref("brloot_cartel_intel"), 1, 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12a59
// Size: 0x32
function function_3c989ad19e62de6c() {
    thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("redacted_3_excavation"), (22656, -55352, 696), namespace_38b993c4618e76cd::getlootidfromref("brloot_tracking_device"), 3, 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12a92
// Size: 0xdb
function function_88d8597beafdd628(player, poi) {
    if (isdefined(level.squaddata)) {
        poisvisitedacv = squads::function_2026e82470c5c89f(player.team, player.var_ff97225579de16a, "poisVisitedACV");
        if (!isdefined(poisvisitedacv[poi])) {
            function_8359cadd253f9604(player, "poi_travel_acv", 1);
            poisvisitedacv[poi] = 1;
            squads::function_a20a10ce593f692b(player.team, player.var_ff97225579de16a, "poisVisitedACV", poisvisitedacv);
        }
    } else {
        poisvisitedacv = teams::getteamdata(player.team, "poisVisitedACV");
        if (!isdefined(poisvisitedacv[poi])) {
            function_8359cadd253f9604(player, "poi_travel_acv", 1);
            poisvisitedacv[poi] = 1;
            teams::setteamdata(player.team, "poisVisitedACV", poisvisitedacv);
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12b74
// Size: 0x1b
function function_8706a89fae666d51(player) {
    function_8359cadd253f9604(player, "contract_hacker_use", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x12b96
// Size: 0x2a
function private function_51bde44b90a1fc39() {
    thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("tracking_activity"), (-9152.06, -11234.5, 48), 30414, 1, 8);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12bc7
// Size: 0x6c
function private function_16597cc75de769a6() {
    var_41b55ebf5a84f41d = istrue(namespace_aead94004cf4c147::function_6f39f9916649ac48(30414, 1));
    /#
        assert(var_41b55ebf5a84f41d);
    #/
    /#
        assert(namespace_aead94004cf4c147::function_7e103028c464ab9a(namespace_38b993c4618e76cd::function_b88cfb4893ceedac("brloot_gps_loaded_triangulator")));
    #/
    /#
        assert(namespace_aead94004cf4c147::function_8a160d9935d47f5e("brloot_gps_loaded_triangulator", "valuable", 1));
    #/
    namespace_aead94004cf4c147::additemtobackpackbyref("brloot_gps_loaded_triangulator", "valuable", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12c3a
// Size: 0xef
function private function_d6fab9bc69a92a51(player) {
    if (player namespace_aead94004cf4c147::function_d63a7299c6203bf9(30414)) {
        function_8359cadd253f9604(player, "uav_tower_use_with_tracker", 1);
        var_3995ec6a46bd14df = teams::getteamdata(player.team, "players");
        foreach (teammate in var_3995ec6a46bd14df) {
            if (!isdefined(teammate)) {
                continue;
            }
            if (!isdefined(teammate.var_24acac5a29f2b972)) {
                teammate.var_24acac5a29f2b972 = 0;
            }
            teammate.var_24acac5a29f2b972++;
            if (teammate.var_24acac5a29f2b972 >= 3 && teammate namespace_aead94004cf4c147::function_d63a7299c6203bf9(30414) && namespace_36f464722d326bbe::function_7ee65fae13124702()) {
                teammate function_16597cc75de769a6();
            }
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12d30
// Size: 0x1b
function function_2b7cc5d62043202e(player) {
    function_8359cadd253f9604(player, "read_stationary_note", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12d52
// Size: 0x1b
function function_93ab9968bf96e2b0(player) {
    function_8359cadd253f9604(player, "shopkeeper_trade_success", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12d74
// Size: 0x1b
function function_c2b3319eb135740(player) {
    function_8359cadd253f9604(player, "reward_station_buy_item", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x12d96
// Size: 0x89
function function_38d565bd866ced0e(player, var_5793a0cf9d352c92) {
    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    baseorigin = function_53c4c53197386572(var_5793a0cf9d352c92.var_afc028d00356e443, var_5793a0cf9d352c92.origin);
    baseangles = var_5793a0cf9d352c92.angles;
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, baseorigin, baseangles, player, undefined);
    namespace_cb965d2f71fefddc::spawnpickup("brloot_shop_intel", var_cb4fad49263e20c4, 1, 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x12e26
// Size: 0xa2
function function_c543832fab9303cb(player, var_5793a0cf9d352c92) {
    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    baseorigin = function_53c4c53197386572(var_5793a0cf9d352c92.var_afc028d00356e443, var_5793a0cf9d352c92.origin);
    baseangles = var_5793a0cf9d352c92.angles;
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, baseorigin, baseangles, player, undefined);
    quantity = int(level.var_dab6c0f07f8df447);
    namespace_cb965d2f71fefddc::spawnpickup("brloot_shopkeeper_code", var_cb4fad49263e20c4, quantity, 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x12ecf
// Size: 0x89
function function_f3f7cf5aa591a391(player, var_5793a0cf9d352c92) {
    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    baseorigin = function_53c4c53197386572(var_5793a0cf9d352c92.var_afc028d00356e443, var_5793a0cf9d352c92.origin);
    baseangles = var_5793a0cf9d352c92.angles;
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, baseorigin, baseangles, player, undefined);
    namespace_cb965d2f71fefddc::spawnpickup("brloot_valuable_shopkeeper_konni_intel", var_cb4fad49263e20c4, 1, 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x12f5f
// Size: 0x3
function private function_554ec348cfc62f37() {
    
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12f69
// Size: 0x1b
function function_b49c89ad7edcf17b(player) {
    function_8359cadd253f9604(player, "discover_oasis_bunker_entrance", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12f8b
// Size: 0x2e3
function function_a7fb9d5548d2455a() {
    if (!namespace_36f464722d326bbe::function_ee0c2958aa2ee59e()) {
        return;
    }
    var_1e8573a54a7096f3 = spawnstruct();
    level.var_1e8573a54a7096f3 = var_1e8573a54a7096f3;
    var_1e8573a54a7096f3.var_7a7997ebb531cb5b = [];
    var_cf59b8ff27dce1a4 = getstruct("pmc_bunker_upload_station", "script_noteworthy");
    namespace_e1bfa87a2a692d3c::function_2eddefe4d621123b();
    var_c25ecf9ed9150764 = namespace_e1bfa87a2a692d3c::function_443a192943945265(var_cf59b8ff27dce1a4, 5);
    var_2076a994e0e7c929 = getstruct("pmc_laser_trap_cache", "script_noteworthy");
    cache = getentitylessscriptablearray(undefined, undefined, var_2076a994e0e7c929.origin, 50, "body")[0];
    if (!isdefined(cache)) {
        /#
            assertmsg("Couldn't find cache for PMC laser room");
        #/
        return;
    }
    cache.var_3e5d613e6f4d92e3 = 1;
    cache namespace_1b7e64f50cca9321::function_d683a60016231237(namespace_38b993c4618e76cd::getlootidfromref("brloot_biolabs_evidence"), 1);
    cache.var_1e8573a54a7096f3 = var_1e8573a54a7096f3;
    cache.var_534e0cf170a981b7 = &function_901bc7e60ba89f7f;
    var_1e8573a54a7096f3.cache = cache;
    level thread function_4baddf78c907e8f9();
    var_60ceb54cf9534519 = getstructarray("pmc_laser_trap", "script_noteworthy");
    config = spawnstruct();
    config.maxhealth = 350;
    config.maxrange = 4000000;
    config.var_947af351ce904aa5 = 7562500;
    foreach (struct in var_60ceb54cf9534519) {
        turret = namespace_66ade5cda10fe3aa::function_d1acadc2a0b9e115(config, struct, "team_hundred_ninety_five", "electronics_ir_laser_device_assembly_nogeo", "laser_trap_nvg");
        turret setmode("manual");
        turret laseron();
        turret.var_1e8573a54a7096f3 = var_1e8573a54a7096f3;
        tag = "tag_laser";
        if (!hastag(turret.model, tag)) {
            tag = "tag_turret";
        }
        var_878bae61aca86fc5 = anglestoforward(struct.angles);
        var_1e536fc02ce7881d = turret gettagorigin(tag);
        newpos = var_1e536fc02ce7881d + var_878bae61aca86fc5 * 2000;
        trace = namespace_2a184fc4902783dc::ray_trace(var_1e536fc02ce7881d, newpos, turret);
        end = trace["position"];
        turret.var_c507394a92387e01 = end;
        turret function_83ea6f9ebc30c9a4(turret.var_c507394a92387e01 - var_1e536fc02ce7881d);
        var_98c102bf3750c771 = (var_1e536fc02ce7881d + end) / 2;
        turret thread namespace_66ade5cda10fe3aa::function_a890d51e917ad74(0, var_98c102bf3750c771);
        turret thread function_a7614ce40d9dbe48();
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13275
// Size: 0x33b
function function_a7614ce40d9dbe48() {
    level endon("game_ended");
    self endon("death");
    self endon("stop_idle_movement");
    namespace_4b0406965e556711::function_1240434f4201ac9d("prematch_done");
    tag = "tag_laser";
    if (!hastag(self.model, tag)) {
        tag = "tag_turret";
    }
    self.var_c507394a92387e01 = self gettagorigin(tag) + anglestoforward(self gettagangles(tag)) * 3000;
    self.var_7a7997ebb531cb5b = [];
    wait(2);
    var_4a5d9d7667048bf3 = namespace_2a184fc4902783dc::create_character_contents();
    while (1) {
        start = self gettagorigin("tag_laser");
        nearby_players = sortbydistancecullbyradius(level.players, start, 1024);
        if (nearby_players.size == 0) {
            waitframe();
            continue;
        }
        trace = namespace_2a184fc4902783dc::ray_trace(start, self.var_c507394a92387e01);
        end = trace["position"];
        var_db9c2822e3d940dc = lengthsquared(start - end);
        trace = namespace_2a184fc4902783dc::ray_trace(start, end, [], var_4a5d9d7667048bf3);
        if (isdefined(trace["entity"]) && trace["hittype"] == "hittype_entity") {
            if (isplayer(trace["entity"]) && isdefined(trace["entity"].guid)) {
                player = trace["entity"];
                if (isdefined(player) && isplayer(player)) {
                    player.var_230a3287f9ad2965 = 1;
                    player.shouldskipdeathsshield = 1;
                }
                /#
                    printtoscreen2d(50, 50, "<unknown string>", (1, 0, 0));
                #/
                currenttime = gettime();
                if (!isdefined(self.var_7a7997ebb531cb5b[player.guid]) || currenttime - self.var_7a7997ebb531cb5b[player.guid] > 10000) {
                    playsoundatpos(self.origin, "cp_laser_trigger");
                    self.var_7a7997ebb531cb5b[player.guid] = currenttime;
                }
                if (!istrue(self.var_1e8573a54a7096f3.var_7a7997ebb531cb5b[player.guid])) {
                    self.var_1e8573a54a7096f3.var_7a7997ebb531cb5b[player.guid] = 1;
                    namespace_d696adde758cbe79::showdmzsplash("dmz_laser_tripped", [0:player]);
                    if (!isdefined(self.var_1e8573a54a7096f3.triggertime) || currenttime - self.var_1e8573a54a7096f3.triggertime > lookupsoundlength("mp_dmz_alrm_trap")) {
                        playsoundatpos(self.var_1e8573a54a7096f3.cache.origin, "mp_dmz_alrm_trap");
                        self.var_1e8573a54a7096f3.triggertime = currenttime;
                        namespace_bfef6903bca5845d::function_353fecd1549f5f42(level.var_1e8573a54a7096f3.cache.origin, 1500, level.var_4b195d3dd0024b9c, 6);
                    }
                }
            }
        }
        waitframe();
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x135b7
// Size: 0x77
function function_901bc7e60ba89f7f(instance, player) {
    currenttime = gettime();
    if (isdefined(player.guid) && istrue(instance.var_1e8573a54a7096f3.var_7a7997ebb531cb5b[player.guid])) {
        player namespace_44abc05161e2e2cb::showerrormessage("MP_DMZ_MISSIONS/GEIGER_SEARCH_GC_CACHE_ERR");
        return 0;
    }
    function_8359cadd253f9604(player, "open_laser_cache", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13635
// Size: 0x93
function function_4baddf78c907e8f9() {
    namespace_4b0406965e556711::function_1240434f4201ac9d("prematch_done");
    foreach (player in level.players) {
        if (isdefined(player) && isdefined(player.guid)) {
            level.var_1e8573a54a7096f3.var_7a7997ebb531cb5b[player.guid] = 1;
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x136cf
// Size: 0x54
function function_3ce8c941726c2400(player) {
    if (isdefined(player) && isdefined(player.guid)) {
        level.var_1e8573a54a7096f3.var_7a7997ebb531cb5b[player.guid] = 0;
        namespace_d696adde758cbe79::showdmzsplash("dmz_laser_reset", [0:player]);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1372a
// Size: 0xf5
function function_ab1164302301c233() {
    lootid = namespace_38b993c4618e76cd::getlootidfromref("brloot_flare_stick");
    missionid = function_16ae6d8b5f25f31b("place_biobunker_tac_inserts");
    thread function_315e9c3a5fb405e5(missionid, (-72.488, 1721.72, 434.75), lootid, 4, 2);
    if (!namespace_36f464722d326bbe::function_ee0c2958aa2ee59e()) {
        return;
    }
    namespace_4b0406965e556711::function_1240434f4201ac9d("prematch_done");
    structs = getstructarray("pmc_plant_flare", "script_noteworthy");
    foreach (struct in structs) {
        place = spawnscriptable("dmz_flare_place", struct.origin, struct.angles);
        place function_ab5c0b42f31a0d20(missionid);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x13826
// Size: 0xc2
function function_48a98ebe20dd89f2(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (isdefined(player)) {
        lootid = namespace_38b993c4618e76cd::getlootidfromref("brloot_flare_stick");
        var_587f61ad4c5334a0 = istrue(player namespace_aead94004cf4c147::function_6f39f9916649ac48(lootid, 1));
        if (!var_587f61ad4c5334a0) {
            player namespace_44abc05161e2e2cb::showerrormessage("PMC_S2/PLACE_ERR_MSG");
            return;
        }
        weapon = makeweapon("flare_dmz_pmc");
        success = player namespace_d325722f2754c2c4::function_f19f8b4cf085ecbd(weapon);
        if (istrue(success)) {
            instance disablescriptableplayeruse(player);
            function_8359cadd253f9604(player, "place_flare_stick", 1);
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x138ef
// Size: 0x6f
function onflareplaced(grenade) {
    if (isdefined(grenade) && isdefined(self)) {
        level.var_e1fbd405916eab45 = function_53c4c53197386572(level.var_e1fbd405916eab45, 0);
        level.var_e1fbd405916eab45++;
        grenade setscriptablepartstate("smoke", "active");
        if (level.var_e1fbd405916eab45 > getdvarint(@"hash_27c2a8e9ee2e06d4", 20)) {
            grenade delete();
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13965
// Size: 0x9f
function private function_7757687df059eb94(teamname) {
    aliveplayers = teams::getteamdata(teamname, "alivePlayers");
    var_3bb38b68cd07463e = 0;
    foreach (player in aliveplayers) {
        if (isdefined(player) && !istrue(player.extracted) && player namespace_aead94004cf4c147::function_d63a7299c6203bf9(29514)) {
            var_3bb38b68cd07463e = 1;
            break;
        }
    }
    return var_3bb38b68cd07463e;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a0c
// Size: 0x46
function function_5ff4af6e7a002c62(teamname, var_11807f242097f672) {
    var_ee3d1775b76dc3e9 = 0;
    if (isdefined(var_11807f242097f672.var_b934b77f24f0966e) && isdefined(var_11807f242097f672.var_b934b77f24f0966e[teamname])) {
        var_ee3d1775b76dc3e9 = 1;
    }
    return var_ee3d1775b76dc3e9;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a5a
// Size: 0xe8
function function_6adb8d95823366cb(teamname) {
    level.var_f734766fb8c924e2 = array_removeundefined(level.var_f734766fb8c924e2);
    var_7d0763bc73f02938 = undefined;
    var_de6953dde7efbc9c = undefined;
    foreach (var_11807f242097f672 in level.var_f734766fb8c924e2) {
        var_676d7c49ab177224 = isdefined(var_11807f242097f672.var_b934b77f24f0966e) && isdefined(var_11807f242097f672.var_b934b77f24f0966e[teamname]);
        if (!var_676d7c49ab177224) {
            continue;
        }
        var_42c0d692e6b1366e = var_11807f242097f672.var_b934b77f24f0966e[teamname];
        if (!isdefined(var_de6953dde7efbc9c) || var_42c0d692e6b1366e < var_de6953dde7efbc9c) {
            var_de6953dde7efbc9c = var_42c0d692e6b1366e;
            var_7d0763bc73f02938 = var_11807f242097f672;
        }
    }
    return var_7d0763bc73f02938;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b4a
// Size: 0x57
function function_4cba31e79d4e5166(teamname) {
    var_7d0763bc73f02938 = function_6adb8d95823366cb(teamname);
    if (!isdefined(var_7d0763bc73f02938)) {
        return 0;
    }
    var_42c0d692e6b1366e = var_7d0763bc73f02938.var_b934b77f24f0966e[teamname];
    var_25a8868785389f9 = gettime() - var_42c0d692e6b1366e < 120000;
    return !var_25a8868785389f9;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ba9
// Size: 0x7a
function function_538ab9a6a1f38f55(teamname, var_11807f242097f672) {
    var_de05d1d03582c1f8 = 1;
    if (teams::getteamdata(teamname, "aliveCount") == 0) {
        var_de05d1d03582c1f8 = 0;
    } else if (!function_c5e0bac8f123cc88(teamname, 13926)) {
        var_de05d1d03582c1f8 = 0;
    } else if (!function_7757687df059eb94(teamname)) {
        var_de05d1d03582c1f8 = 0;
    } else if (function_5ff4af6e7a002c62(teamname, var_11807f242097f672)) {
        var_de05d1d03582c1f8 = 0;
    } else if (function_4cba31e79d4e5166(teamname)) {
        var_de05d1d03582c1f8 = 0;
    }
    return var_de05d1d03582c1f8;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13c2b
// Size: 0x1b0
function function_6245fc3e65911655(var_11807f242097f672, var_694cf27a7080216) {
    level endon("game_ended");
    var_11807f242097f672 endon("death");
    while (1) {
        var_fa33c4c6886d1da2 = [];
        foreach (player in var_694cf27a7080216) {
            if (isdefined(player) && !array_contains(var_fa33c4c6886d1da2, player.team)) {
                var_fa33c4c6886d1da2 = array_add(var_fa33c4c6886d1da2, player.team);
            }
        }
        if (var_fa33c4c6886d1da2.size == 0) {
            return;
        }
        foreach (teamname in var_fa33c4c6886d1da2) {
            var_8d978122bc1c23af = function_538ab9a6a1f38f55(teamname, var_11807f242097f672);
            aliveplayers = teams::getteamdata(teamname, "alivePlayers");
            aliveplayers = array_removeundefined(aliveplayers);
            foreach (player in aliveplayers) {
                if (istrue(player.extracted)) {
                    continue;
                }
                if (var_8d978122bc1c23af) {
                    var_11807f242097f672 enablescriptableplayeruse(player);
                } else {
                    var_11807f242097f672 disablescriptableplayeruse(player);
                }
            }
        }
        var_11807f242097f672 waittill_any_timeout_1(5, "cutTheHead_laptop_activated");
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13de2
// Size: 0xad
function private function_37e963e85f8863aa() {
    var_158d9d73ae320433 = [];
    var_16881d0315399bb8 = getstructarray("pmc_mission_cut_the_head", "script_noteworthy");
    foreach (spawner in var_16881d0315399bb8) {
        var_11807f242097f672 = spawnscriptable("dmz_pmc_cut_the_head_mission_laptop", spawner.origin, spawner.angles);
        var_11807f242097f672 function_ef63cdebaaff3440();
        var_158d9d73ae320433 = array_add(var_158d9d73ae320433, var_11807f242097f672);
    }
    return var_158d9d73ae320433;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x13e97
// Size: 0x98
function private function_68307fc74660904c() {
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level namespace_4b0406965e556711::gameflagwait("prematch_done");
    }
    level.var_f734766fb8c924e2 = function_37e963e85f8863aa();
    var_694cf27a7080216 = function_4e577d33450caee4(13926);
    foreach (var_11807f242097f672 in level.var_f734766fb8c924e2) {
        thread function_6245fc3e65911655(var_11807f242097f672, var_694cf27a7080216);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x13f36
// Size: 0x159
function private function_c2d1503cc1629dd2(var_11807f242097f672, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!isdefined(var_11807f242097f672) || !isdefined(player)) {
        return;
    }
    if (function_538ab9a6a1f38f55(player.team, var_11807f242097f672)) {
        var_11807f242097f672.var_b934b77f24f0966e = function_53c4c53197386572(var_11807f242097f672.var_b934b77f24f0966e, []);
        var_11807f242097f672.var_b934b77f24f0966e[player.team] = gettime();
        var_11807f242097f672 setscriptablepartstate("dmz_pmc_cut_the_head_mission_laptop", "laptop_on");
        function_8359cadd253f9604(player, "activate_laptop_within_time_limit", 1);
        if (!istrue(player.var_cfd4a4c78abadc9)) {
            namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_e_cut_the_head_on_1st_laptop_use", player.team);
            players = teams::getteamdata(player.team, "players");
            foreach (var_e62da3572742c173 in players) {
                var_e62da3572742c173.var_cfd4a4c78abadc9 = 1;
            }
        }
        var_11807f242097f672 notify("cutTheHead_laptop_activated");
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14096
// Size: 0xb3
function private function_664fd771b95a53b6(objweapon) {
    player = self;
    if (!isdefined(player.var_9ab1766f74a7f17d) || !isdefined(objweapon)) {
        return;
    }
    foreach (killsperweapon in player.var_9ab1766f74a7f17d) {
        if (issameweapon(killsperweapon.objweapon, objweapon)) {
            player.var_9ab1766f74a7f17d = array_remove(player.var_9ab1766f74a7f17d, killsperweapon);
            break;
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14150
// Size: 0x41
function private function_414cf87bc60bb468() {
    player = self;
    level endon("game_ended");
    player endon("disconnect");
    while (1) {
        var_ebef17f6067e94c0 = player waittill("weapon_taken");
        player function_664fd771b95a53b6(var_ebef17f6067e94c0);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14198
// Size: 0x47
function private function_27667a7e09799204() {
    player = self;
    level endon("game_ended");
    player endon("disconnect");
    while (1) {
        player waittill("reload");
        objweapon = player getcurrentweapon();
        player function_664fd771b95a53b6(objweapon);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x141e6
// Size: 0x71
function private function_3a9ba2472c7413c6(player, objweapon) {
    uniqueweaponkill = teams::getteamdata(player.team, "uniqueWeaponKill");
    if (!array_contains(uniqueweaponkill, objweapon)) {
        function_8359cadd253f9604(player, "kill_AI_unique_weapon_squad", 1);
        uniqueweaponkill = array_add(uniqueweaponkill, objweapon);
        teams::setteamdata(player.team, "uniqueWeaponKill", uniqueweaponkill);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1425e
// Size: 0x141
function private function_634368e310edf6f9(player, objweapon) {
    if (!isdefined(player) || !isdefined(objweapon)) {
        return;
    }
    function_3a9ba2472c7413c6(player, objweapon);
    if (!namespace_3bbb5a98b932c46f::isdroppableweapon(objweapon)) {
        return;
    }
    player.var_9ab1766f74a7f17d = function_53c4c53197386572(player.var_9ab1766f74a7f17d, []);
    killsperweapon = undefined;
    foreach (var_81729cc26e850eae in player.var_9ab1766f74a7f17d) {
        if (issameweapon(var_81729cc26e850eae.objweapon, objweapon)) {
            killsperweapon = var_81729cc26e850eae;
            break;
        }
    }
    if (!isdefined(killsperweapon)) {
        killsperweapon = spawnstruct();
        killsperweapon.objweapon = objweapon;
        killsperweapon.var_1338796a0caad277 = 0;
        player.var_9ab1766f74a7f17d = array_add(player.var_9ab1766f74a7f17d, killsperweapon);
    }
    killsperweapon.var_1338796a0caad277++;
    if (killsperweapon.var_1338796a0caad277 >= 10) {
        function_8359cadd253f9604(player, "AI_kills_with_unique_ammo_clip", 1);
        player function_664fd771b95a53b6(objweapon);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x143a6
// Size: 0x7b
function private function_5ad5cd868765ed83() {
    level namespace_4b0406965e556711::gameflagwait("prematch_done");
    var_694cf27a7080216 = function_4e577d33450caee4(15132);
    foreach (player in var_694cf27a7080216) {
        player thread function_414cf87bc60bb468();
        player thread function_27667a7e09799204();
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14428
// Size: 0x76
function private function_c17f9e8e49a412bf(player) {
    var_41b55ebf5a84f41d = istrue(player namespace_aead94004cf4c147::function_6f39f9916649ac48(8567, 1));
    /#
        assert(var_41b55ebf5a84f41d);
    #/
    /#
        assert(namespace_aead94004cf4c147::function_7e103028c464ab9a(namespace_38b993c4618e76cd::function_b88cfb4893ceedac("brloot_loaded_harddrive")));
    #/
    /#
        assert(namespace_aead94004cf4c147::function_8a160d9935d47f5e("brloot_loaded_harddrive", "valuable", 1));
    #/
    namespace_aead94004cf4c147::additemtobackpackbyref("brloot_loaded_harddrive", "valuable", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x144a5
// Size: 0x74
function private function_afd9995bf86b7912(objidnum) {
    player = self;
    player endon("vehicle_change_seat");
    var_6a9734d81cbb50e7 = 100;
    var_c351a54729796ae1 = 120 / var_6a9734d81cbb50e7;
    namespace_5a22b6f3a56f7e9b::function_ce702e5925e31fc9(objidnum, player, 2, 2, "PMC_S4/GO_FOR_A_DRIVE_TIMER");
    for (i = 1; i <= var_6a9734d81cbb50e7; i++) {
        objective_setprogress(objidnum, i / var_6a9734d81cbb50e7);
        wait(var_c351a54729796ae1);
    }
    return 1;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14521
// Size: 0xb8
function private function_c900d8cc1fe76ef0(objidnum) {
    player = self;
    level endon("game_ended");
    player endon("death_or_disconnect");
    player endon("vehicle_exit");
    while (1) {
        var_17915db3de174953 = namespace_1fbd40990ee60ede::vehicle_occupancy_occupantisvehicledriver(player);
        if (var_17915db3de174953) {
            namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_e_go_for_a_drive_transfer_started", player.team);
            var_b6af944a5cf839e = player function_afd9995bf86b7912(objidnum);
            namespace_5a22b6f3a56f7e9b::function_26259bd38697b5ad(objidnum, player);
            if (istrue(var_b6af944a5cf839e)) {
                if (!player namespace_aead94004cf4c147::function_d63a7299c6203bf9(8567)) {
                    break;
                }
                function_c17f9e8e49a412bf(player);
                function_8359cadd253f9604(player, "drive_overland_while_carrying_hard_drive", 1);
                break;
            }
        } else {
            player waittill("vehicle_change_seat");
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x145e0
// Size: 0x97
function private function_5071e81a54b409cf(player) {
    var_45accc7124be3725 = spawnstruct();
    var_45accc7124be3725.curorigin = player.origin;
    var_45accc7124be3725.offset3d = (0, 0, 0);
    var_45accc7124be3725 namespace_19b4203b51d56488::requestid(0, 1, undefined, 0);
    objidnum = var_45accc7124be3725.objidnum;
    objective_icon(objidnum, "ui_map_icon_obj_intel");
    namespace_5a22b6f3a56f7e9b::objective_pin_global(objidnum, 1);
    objective_onentity(objidnum, player);
    namespace_5a22b6f3a56f7e9b::objective_playermask_single(objidnum, player);
    return objidnum;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1467f
// Size: 0x96
function private function_494cf678a5b30f9e(player, vehiclename) {
    /#
        assert(isdefined(vehiclename));
    #/
    /#
        assert(isdefined(player));
    #/
    if (namespace_4b0406965e556711::gameflag("prematch_done") && namespace_36f464722d326bbe::function_5e0e3a24dbb1fae1() && vehiclename == "veh9_overland_2016" && player namespace_aead94004cf4c147::function_d63a7299c6203bf9(8567) && function_c5e0bac8f123cc88(player.team, 14773)) {
        objidnum = function_5071e81a54b409cf(player);
        player function_c900d8cc1fe76ef0(objidnum);
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(objidnum);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1471c
// Size: 0x1d4
function private function_dbc1b65952f8ed88(player, container, lootid) {
    var_dc336372f57219a4 = namespace_38b993c4618e76cd::getlootidfromref("brloot_slipstream_laptop");
    if (!namespace_36f464722d326bbe::function_7ee65fae13124702() || lootid != var_dc336372f57219a4 || !isdefined(player.guid)) {
        return [0:lootid, 1:undefined];
    }
    var_9ca59006fcfeece6 = namespace_b66505f20cbf2570::function_30b30561882a2477(container);
    if (var_9ca59006fcfeece6 != "saba_observatory" && var_9ca59006fcfeece6 != "saba_mtntwn" && var_9ca59006fcfeece6 != "saba_oldtwn") {
        return [0:lootid, 1:undefined];
    }
    if (!isdefined(level.var_4c039b809146fc9d)) {
        level.var_4c039b809146fc9d = [];
    }
    if (!isdefined(level.var_4c039b809146fc9d[player.guid])) {
        struct = spawnstruct();
        struct.poisvisited = [];
        struct.starttime = gettime();
        level.var_4c039b809146fc9d[player.guid] = struct;
        function_70abd486ae26235(player, "first_slipstream_dead_drop", 1);
    }
    struct = level.var_4c039b809146fc9d[player.guid];
    currenttime = gettime();
    timeelapsed = currenttime - struct.starttime;
    if (timeelapsed > 180000) {
        struct.starttime = currenttime;
        struct.poisvisited = [];
        function_70abd486ae26235(player, "first_slipstream_dead_drop", 1);
    }
    struct.poisvisited[var_9ca59006fcfeece6] = 1;
    if (struct.poisvisited.size == 3) {
        function_8359cadd253f9604(player, "dead_drop_dirt_bike", 1);
    }
    return [0:lootid, 1:1];
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x148f8
// Size: 0x57
function private function_892733a0f84dedcf(lootid) {
    if (!isdefined(lootid)) {
        return 0;
    }
    return lootid == 11247 || lootid == 8644 || lootid == 32131 || lootid == 13356 || lootid == 19244 || lootid == 19245 || lootid == 26336 || lootid == 32131;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14957
// Size: 0x20
function function_bebcefbd95a287ec(player) {
    return function_c5e0bac8f123cc88(player.team, 13915);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1497f
// Size: 0x15b
function function_fea699cf9870f641(radar, vehicle) {
    level endon("game_ended");
    vehicle endon("death");
    while (isdefined(vehicle)) {
        radius = getdvarint(@"hash_ef46fbf92436a6e7", 1200);
        var_5888fe9dac2d7d8e = getdvarint(@"hash_6b9856393459e1e8", 2);
        var_f7949d3327a3e569 = getdvarint(@"hash_97cefea3d38c1b44", 10);
        if (isdefined(vehicle.owner) && isdefined(vehicle.owner.team)) {
            triggerportableradarpingteam(radar.origin, vehicle.owner.team, radius, var_5888fe9dac2d7d8e * 1000);
            radar playsoundonmovingent("iw9_code_scan_succes");
            currentpoi = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(radar.origin, 0, 0, 0);
            if (currentpoi == "delta_fleamarket") {
                function_8a7a2427622e7572(vehicle.owner.team, "quidproquo_visited_poi_one", 1);
            } else if (currentpoi == "delta_firestation") {
                function_8a7a2427622e7572(vehicle.owner.team, "quidproquo_visited_poi_two", 1);
            }
        }
        wait(var_f7949d3327a3e569);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14ae1
// Size: 0xca
function function_6300f1d8a3c7644(vehicle) {
    level endon("game_ended");
    vehicle endon("death");
    while (isdefined(vehicle)) {
        if (isdefined(vehicle.owner) && isdefined(vehicle.owner.team)) {
            currentpoi = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(vehicle.origin, 0, 0, 0);
            if (currentpoi == "delta_fleamarket") {
                function_8a7a2427622e7572(vehicle.owner.team, "quidproquo_visited_poi_one", 1);
            } else if (currentpoi == "delta_firestation") {
                function_8a7a2427622e7572(vehicle.owner.team, "quidproquo_visited_poi_two", 1);
            }
        }
        wait(1);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14bb2
// Size: 0x191
function function_6234d21aecef0158(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    level endon("game_ended");
    var_607da387f3617ed1 = teams::getteamdata(player.team, "players");
    foreach (var_8f7040e569ec9e98 in var_607da387f3617ed1) {
        instance disablescriptableplayeruse(var_8f7040e569ec9e98);
    }
    var_e99460bc50772002 = spawnstruct();
    var_e99460bc50772002.origin = instance.origin;
    var_e99460bc50772002.angles = instance.angles;
    var_17160569dab45fd6 = namespace_801fa17f47560d76::function_66c684fea143fbfd("veh9_jltv_mg", var_e99460bc50772002);
    var_17160569dab45fd6 waittill("landed");
    function_8359cadd253f9604(player, "quidproquo_airdrop_call_success", 1);
    offset = (-80, 0, 37);
    var_3d3f3ec461dfb6f1 = var_17160569dab45fd6.origin + offset;
    radar = spawn("script_model", var_3d3f3ec461dfb6f1, 0, 0);
    radar setmodel("offhand_2h_wm_sonar_pulse_v0");
    radar show();
    radar linkto(var_17160569dab45fd6);
    level thread function_fea699cf9870f641(radar, var_17160569dab45fd6);
    level thread function_6300f1d8a3c7644(var_17160569dab45fd6);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14d4a
// Size: 0x42
function function_9d1f0973f606c702(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    thread function_6234d21aecef0158(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14d93
// Size: 0x1b
function function_7616962f7c523a5d(player) {
    namespace_aad14af462a74d08::function_8359cadd253f9604(player, "enter_keycode_success", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14db5
// Size: 0x1b
function function_d8bae32458ce35b7(player) {
    namespace_aad14af462a74d08::function_8359cadd253f9604(player, "drill_bunker_safe", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14dd7
// Size: 0x1b
function function_8b3be362bff6847f(player) {
    namespace_aad14af462a74d08::function_8359cadd253f9604(player, "enter_traded_keycode_success", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14df9
// Size: 0x26
function onbombdefused(defuser) {
    if (!function_6f6cc16c0528de5b(defuser)) {
        return;
    }
    namespace_aad14af462a74d08::function_8359cadd253f9604(defuser, "defuse_enemy_charge", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14e26
// Size: 0xda
function function_d882e5d473c9b258(player, item, var_ec22a950f210e39) {
    if (namespace_a38a2e1fe7519183::function_d3e4d206d9b842a0(item) && function_c5e0bac8f123cc88(player.team, function_16ae6d8b5f25f31b("infil_give_scav_weapon"))) {
        var_fafd64b272244139 = getlootscriptablearrayinradius(undefined, undefined, player.origin, 500);
        if (isdefined(var_fafd64b272244139) && var_fafd64b272244139.size > 0) {
            foreach (scriptable in var_fafd64b272244139) {
                if (isdefined(scriptable.var_bf23a60678978c19)) {
                    namespace_aad14af462a74d08::function_8359cadd253f9604(player, "give_weapon_to_scavenger", 1);
                    break;
                }
            }
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14f07
// Size: 0x1c9
function function_794d65c4d264dcc0() {
    var_6a49a6f54a44c91a = getstructarray("pmc_bunker_exit_radiation", "script_noteworthy");
    foreach (struct in var_6a49a6f54a44c91a) {
        namespace_96abc792b7f61807::function_f0d61e14dfde9ccd(struct);
        struct.var_9d4873a013fb19ab = "scanned_bunker_exit";
        struct.var_44c91f16317bb5c2 = 1.32;
        struct.var_f967e4de0363ea83 = [];
        struct.trigger = spawn("noent_volume_trigger_radius", struct.origin, 0, 600, 400);
        thread function_b58f7554faa406e7(struct.trigger, "entered_bunker_exit_trigger");
    }
    var_91554e96494ce0a9 = getstructarray("pmc_bunker_exit_button", "script_noteworthy");
    level.var_c67075aa240462a9 = [];
    foreach (struct in var_91554e96494ce0a9) {
        button = spawnscriptable("pmc_bunker_exit_button", struct.origin, struct.angles);
        button setscriptablepartstate("pmc_bunker_exit_button_use", "usable");
        button function_ab5c0b42f31a0d20(function_16ae6d8b5f25f31b("secure_biobunker_exits_story"));
        button function_d3428ebfda80edeb("ui_map_icon_obj_searchseizure", (0, 0, 5));
        button.var_11fb82ff93300bb7 = [];
        level.var_c67075aa240462a9[level.var_c67075aa240462a9.size] = button;
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x150d7
// Size: 0x42
function function_c55dae311ea23861(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    thread function_dacdd049029751a8(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15120
// Size: 0x4cb
function function_dacdd049029751a8(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!isdefined(player) || !isdefined(player.team)) {
        return;
    }
    var_cf66d8322862d043 = 0;
    foreach (button in level.var_c67075aa240462a9) {
        if (istrue(button.securing)) {
            var_cf66d8322862d043 = 1;
        }
    }
    if (istrue(var_cf66d8322862d043)) {
        player namespace_44abc05161e2e2cb::showerrormessage("PMC_S4/BUNKER_EXIT_BUTTON_ERR_MSG");
        return;
    }
    foreach (team in instance.var_11fb82ff93300bb7) {
        if (is_equal(team, player.team)) {
            player namespace_44abc05161e2e2cb::showerrormessage("PMC_S4/BUNKER_EXIT_BUTTON_ALREADY_SECURED_ERR_MSG");
            return;
        }
    }
    teammates = teams::getteamdata(player.team, "players");
    foreach (teammate in teammates) {
        instance disablescriptableplayeruse(teammate);
    }
    objidnum = instance.objidnum;
    var_2e0bdb36f81a37e4 = player.team;
    instance.var_ef269077a28646eb = [];
    namespace_5a22b6f3a56f7e9b::objective_teammask_single(objidnum, player.team);
    instance.securing = 1;
    instance notify("download_started");
    instance thread function_1db8528d0d503797();
    progress = 0;
    var_f26d6e29f4efc048 = 0;
    time = getdvarint(@"hash_f542e5b088626170", 80);
    while (progress < time) {
        if (instance.var_ef269077a28646eb.size > 0) {
            progress = progress + level.framedurationseconds;
        }
        if (var_f26d6e29f4efc048 < 1 && progress > 0) {
            function_b9fce22c56fdae8(instance.origin, 1250);
            var_f26d6e29f4efc048 = 1;
        } else if (var_f26d6e29f4efc048 < 2 && progress > 30) {
            function_b9fce22c56fdae8(instance.origin, 2500);
            var_f26d6e29f4efc048 = 2;
        } else if (var_f26d6e29f4efc048 < 3 && progress > 60) {
            function_b9fce22c56fdae8(instance.origin, 4000);
            var_f26d6e29f4efc048 = 3;
        }
        objective_setprogress(objidnum, clamp(progress / time, 0, 1));
        waitframe();
    }
    foreach (var_6b8130899cd021f4 in instance.var_ef269077a28646eb) {
        namespace_5a22b6f3a56f7e9b::function_26259bd38697b5ad(objidnum, var_6b8130899cd021f4);
    }
    instance notify("download_ended");
    namespace_d696adde758cbe79::showdmzsplash("dmz_bunker_exit_secured", instance.var_ef269077a28646eb);
    namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(objidnum);
    trackedteams = [];
    foreach (var_8ba69f32363f01dd in instance.var_ef269077a28646eb) {
        if (!array_contains(trackedteams, var_8ba69f32363f01dd.team)) {
            trackedteams[trackedteams.size] = var_8ba69f32363f01dd.team;
        }
    }
    foreach (team in trackedteams) {
        function_8a7a2427622e7572(team, "secured_bunker_exit", 1);
        teammates = teams::getteamdata(team, "players");
        foreach (teammate in teammates) {
            instance disablescriptableplayeruse(teammate);
        }
    }
    instance.securing = 0;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x155f2
// Size: 0x5b
function private function_b9fce22c56fdae8(origin, radius) {
    playsoundatpos(origin, "mp_dmz_alrm_trap");
    namespace_bfef6903bca5845d::function_77acc10c4823dd8a(4, origin, "high", "mission", "pmc_bunkerExit", "no_group", level.var_4b195d3dd0024b9c);
    namespace_bfef6903bca5845d::function_353fecd1549f5f42(origin, radius, level.var_4b195d3dd0024b9c, 6);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x15654
// Size: 0x1a3
function private function_1db8528d0d503797() {
    self endon("download_ended");
    origin = self.origin;
    objidnum = self.objidnum;
    while (1) {
        var_c8dadd43aefdc396 = [];
        foreach (player in level.players) {
            if (isdefined(player.origin) && distancesquared(origin, player.origin) < 160000) {
                var_c8dadd43aefdc396[var_c8dadd43aefdc396.size] = player;
            }
        }
        var_e34e332590ac462 = array_difference(var_c8dadd43aefdc396, self.var_ef269077a28646eb);
        var_ea6b4eeeaea5cdc3 = array_difference(self.var_ef269077a28646eb, var_c8dadd43aefdc396);
        foreach (player in var_e34e332590ac462) {
            namespace_5a22b6f3a56f7e9b::function_ce702e5925e31fc9(objidnum, player, 2, 2, "PMC_S4/BUNKER_EXIT_SECURING_PROGRESS_TITLE");
        }
        foreach (player in var_ea6b4eeeaea5cdc3) {
            namespace_5a22b6f3a56f7e9b::function_26259bd38697b5ad(objidnum, player);
        }
        self.var_ef269077a28646eb = var_c8dadd43aefdc396;
        wait(1);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x157fe
// Size: 0xb0
function function_d7fd9f403937e688(origin, angles) {
    var_a6487fb1572c9b44 = spawnscriptable("missile_silo_noent", origin, angles);
    var_a6487fb1572c9b44 setscriptablepartstate("missile_silo_noent", "closed_idle");
    var_fe5c4a69c056946b = coordtransform((0, 0, 105), var_a6487fb1572c9b44.origin, var_a6487fb1572c9b44.angles);
    var_d9bf814fe5fab0c7 = combineangles(var_a6487fb1572c9b44.angles, (0, 0, 180));
    var_a6487fb1572c9b44.var_e0393ee951db4b0f = spawnscriptable("missile_silo_hidden_collision", var_fe5c4a69c056946b, var_d9bf814fe5fab0c7);
    return var_a6487fb1572c9b44;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x158b6
// Size: 0x369
function function_6ce896ca48e4c62a() {
    if (!namespace_36f464722d326bbe::function_7ee65fae13124702()) {
        return;
    }
    nodes = getstructarray("dmz_missle_silo", "script_noteworthy");
    foreach (node in nodes) {
        var_a6487fb1572c9b44 = spawnscriptable("missile_silo_noent", node.origin, node.angles);
        var_a6487fb1572c9b44 setscriptablepartstate("missile_silo_noent", "closed_idle");
        var_d9bf814fe5fab0c7 = combineangles((0, 180, 0), var_a6487fb1572c9b44.angles);
        var_a6487fb1572c9b44.var_e0393ee951db4b0f = spawnscriptable("missile_silo_hidden_collision", var_a6487fb1572c9b44.origin, var_d9bf814fe5fab0c7);
    }
    var_6328aeb6488169e5 = getstruct("dmz_missile_silo_open", "script_noteworthy");
    var_6e62624128d2efa0 = spawnscriptable("missile_silo_noent", var_6328aeb6488169e5.origin, var_6328aeb6488169e5.angles);
    var_6e62624128d2efa0 setscriptablepartstate("missile_silo_noent_collision", "open");
    var_6e62624128d2efa0.var_445f2d1be8a9dd9e = &function_ea506e1f9c05efc8;
    level.var_a2b890d129c64761 = spawnstruct();
    level.var_a2b890d129c64761.usetime = 3;
    level.var_a2b890d129c64761.capturetype = 2;
    var_5085f0539505e5f5 = function_f159c10d5cf8f0b4("subarea_airport_konniship", "script_noteworthy")[0];
    group = spawnstruct();
    group.contributingplayers = [];
    group.used = [];
    group.categoryname = "pmc_konni_ship";
    group.volume = var_5085f0539505e5f5;
    function_572838690d80d959(group.categoryname);
    level namespace_4b0406965e556711::gameflagwait("prematch_done");
    var_811318cf900d3874 = getstructarray("pmc_boat_agent_spawn", "script_noteworthy");
    foreach (node in var_811318cf900d3874) {
        aitype = namespace_bfef6903bca5845d::function_7f1a2e2ebe0c1693("ar");
        agent = namespace_bfef6903bca5845d::ai_mp_requestspawnagent(aitype, node.origin, node.angles, "high", "mission", "pmc_mission", undefined, undefined, undefined, "saba_airport", 0, undefined, 0);
        agentstruct = spawnstruct();
        agentstruct.group = group;
        agentstruct.var_90ccd093de8c8c55 = &function_8ef059ceb8bb6f26;
        agentstruct.ondeath = &function_5629fa2cae5846f2;
        agentstruct.var_9e729433fd479f19 = &function_507b92d2539b9074;
        if (isint(agent)) {
            agentstruct.var_451a9d27d63c746b = agent;
        }
        namespace_14d36171baccf528::function_3ea1225bf6192343(agent, agentstruct);
        namespace_14d36171baccf528::function_58aab2edaec2599f(agent, "pmc_agentPostDormancy", &pmc_agentpostdormancy);
        function_e812b7065161da79(agent, group.categoryname);
    }
    thread function_5678739494bf8de1(group);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c26
// Size: 0x77
function function_8ef059ceb8bb6f26(agent, var_451a9d27d63c746b) {
    agent.agentstruct.var_451a9d27d63c746b = var_451a9d27d63c746b;
    function_c36f897d56e28169(agent, agent.agentstruct.group.categoryname);
    function_e812b7065161da79(var_451a9d27d63c746b, agent.agentstruct.group.categoryname);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ca4
// Size: 0x6c
function pmc_agentpostdormancy(agent) {
    function_c36f897d56e28169(agent.agentstruct.var_451a9d27d63c746b, agent.agentstruct.group.categoryname);
    function_e812b7065161da79(agent, agent.agentstruct.group.categoryname);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15d17
// Size: 0x30
function function_507b92d2539b9074(struct, id) {
    function_c36f897d56e28169(id, struct.group.categoryname);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15d4e
// Size: 0x17d
function function_5629fa2cae5846f2(agent, killer) {
    if (isagent(agent)) {
        agentstruct = namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "agentStruct");
        if (isdefined(agentstruct)) {
            if (isdefined(agentstruct.var_9768b22610b34d9d)) {
                agent namespace_bfef6903bca5845d::function_8c8c6dbf143ab5b2(agent, agentstruct.var_9768b22610b34d9d);
            }
            function_c36f897d56e28169(agent, agentstruct.group.categoryname);
            if (isdefined(killer) && isplayer(killer) && isdefined(agentstruct.group.contributingplayers) && !array_contains(agentstruct.group.contributingplayers, killer)) {
                agentstruct.group.contributingplayers[agentstruct.group.contributingplayers.size] = killer;
            }
        }
    } else if (isint(agent)) {
        info = namespace_14d36171baccf528::function_2b0e82156fa6075b(agent);
        if (isdefined(info) && isdefined(info.agentstruct) && isdefined(info.agentstruct.group)) {
            function_c36f897d56e28169(agent, info.agentstruct.group.categoryname);
        }
    }
    namespace_14d36171baccf528::function_3ea1225bf6192343(agent, undefined);
    namespace_14d36171baccf528::function_97fbd14bbcf19d9c(agent, "pmc_agentPostDormancy", &pmc_agentpostdormancy);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ed2
// Size: 0x29a
function function_5678739494bf8de1(group) {
    level endon("game_ended");
    while (1) {
        agents = function_b4b9401715cf98ea(group.categoryname);
        numagents = agents.size;
        var_28615e1635f3c2eb = 0;
        group.var_28615e1635f3c2eb = 0;
        foreach (agent in agents) {
            origin = undefined;
            if (isagent(agent)) {
                origin = agent.origin;
            } else if (isint(agent)) {
                info = namespace_14d36171baccf528::function_2b0e82156fa6075b(agent);
                if (isdefined(info)) {
                    origin = info.origin;
                }
            }
            var_fbf09640272961b4 = isdefined(origin) && ispointinvolume(origin, group.volume);
            inrange = isdefined(origin) && distance2d(origin, group.volume.origin) < 1000;
            if (var_fbf09640272961b4 || inrange) {
                var_28615e1635f3c2eb++;
            } else {
                function_5629fa2cae5846f2(agent);
            }
        }
        group.var_28615e1635f3c2eb = var_28615e1635f3c2eb;
        if (var_28615e1635f3c2eb == 0) {
            var_95cfa82ffcda809 = [];
            var_7da5b2082e28ab9d = [];
            foreach (player in group.contributingplayers) {
                if (isdefined(player.team) && !array_contains(var_95cfa82ffcda809, player.team)) {
                    var_95cfa82ffcda809[var_95cfa82ffcda809.size] = player.team;
                    var_7da5b2082e28ab9d[var_7da5b2082e28ab9d.size] = player;
                }
            }
            foreach (player in var_7da5b2082e28ab9d) {
                group.used[player.team] = 1;
                function_8359cadd253f9604(player, "cleared_konni_ship");
            }
            group.cleared = 1;
            return;
        }
        wait(1);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16173
// Size: 0x48
function function_ea506e1f9c05efc8(var_c45248fdf60a7b9a, player) {
    if (var_c45248fdf60a7b9a getscriptablepartstate("missile_silo_noent") != "capturing_0_percent") {
        var_c45248fdf60a7b9a setscriptablepartstate("missile_silo_noent", "capturing_0_percent");
    }
    function_8359cadd253f9604(player, "open_missile_silo", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x161c2
// Size: 0x1b
function function_2d3c14faa38e2146(player) {
    function_8359cadd253f9604(player, "equipped_disguise", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x161e4
// Size: 0x1b
function function_4f23417a848e2f5f(player) {
    function_8359cadd253f9604(player, "buy_scavenger_buy_station", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16206
// Size: 0x91
function function_54e624d4ac58b723() {
    if (!namespace_36f464722d326bbe::function_7ee65fae13124702()) {
        return;
    }
    node = getstruct("pmc_tunnel_entrance", "script_noteworthy");
    use = spawnscriptable("pmc_signal_flare_use", node.origin, node.angles);
    use setscriptablepartstate("pmc_signal_flare_use", "usable");
    use.var_a8e2d773f5b6d88e = [];
    level namespace_4b0406965e556711::function_1240434f4201ac9d("prematch_done");
    use function_ab5c0b42f31a0d20(function_16ae6d8b5f25f31b("false_reinforcement_signal_story"));
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1629e
// Size: 0x42
function function_ac56c0ec10ac3e25(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    thread function_6871a50434e7cc31(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x162e7
// Size: 0x1d3
function function_6871a50434e7cc31(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    thread namespace_1eb3c4e0e28fac71::utilflare_shootflare(instance.origin, "dom");
    function_8359cadd253f9604(player, "false_signal_sent", 1);
    teammates = getteamdata(player.team, "players");
    foreach (teammate in teammates) {
        instance disablescriptableplayeruse(teammate);
    }
    package = namespace_bfef6903bca5845d::function_ab14d6652e44fda0(8, level.spawnset["guard"], 3, undefined, "Helicopter");
    agents = undefined;
    while (!isdefined(agents)) {
        agents = namespace_bfef6903bca5845d::function_77acc10c4823dd8a(undefined, instance.origin, "absolute", "mission", "false_signal", undefined, undefined, 1, undefined, undefined, undefined, undefined, package, "ru");
    }
    var_fc1c9cebe104f3fe = 0;
    foreach (agent in agents) {
        agent.var_b582b10663b5b2a9 = 0;
        namespace_bfef6903bca5845d::function_63a043d47490f90d(agent, "brloot_konni_combat_intel", undefined, ter_op(var_fc1c9cebe104f3fe, 0.5, 1), 1);
        if (!var_fc1c9cebe104f3fe) {
            var_fc1c9cebe104f3fe = 1;
        }
        namespace_2000a83505151e5b::function_bd9acc7c99ad884(agent, instance.origin);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x164c1
// Size: 0x1f4
function function_1665f2fe0ae0d024() {
    if (!namespace_36f464722d326bbe::function_7ee65fae13124702()) {
        return;
    }
    missionid = function_16ae6d8b5f25f31b("locate_missile_containers");
    thread function_315e9c3a5fb405e5(missionid, (4297, -11455, 4590), namespace_38b993c4618e76cd::getlootidfromref("brloot_ir_beacon"), 2, 1);
    var_f98c415fea7d1738 = undefined;
    nodes = getstructarray("missile_silo", "targetname");
    foreach (node in nodes) {
        poi = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(node.origin, 1, 1);
        if (poi == "saba_cemetery") {
            var_f98c415fea7d1738 = function_e13625d770059ef9(node, missionid);
            var_f98c415fea7d1738.var_1fa640f7c162f51e = "silo_plant_first_ir_beacon";
            nodes = array_remove(nodes, node);
            break;
        }
    }
    nodes = array_randomize(nodes);
    var_a6487fb1572c9b44 = function_e13625d770059ef9(nodes[0], missionid);
    var_a6487fb1572c9b44.var_1fa640f7c162f51e = "silo_plant_second_ir_beacon";
    poi = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(nodes[0].origin, 1, 1);
    var_4298e4ca487bd69d = coordtransform((51, 0, 65), var_f98c415fea7d1738.origin, var_f98c415fea7d1738.angles);
    var_4a122e836c546c35 = combineangles(var_f98c415fea7d1738.angles, (90, 0, 0));
    note = spawnscriptable("stationary_note_paper", var_4298e4ca487bd69d, var_4a122e836c546c35);
    var_5fc921ca5df09e7e = "pmc_missile_silo_hint_" + getsubstr(poi, 5);
    note.var_70b5fd7365f6b50c = namespace_18e0fd353e69a0b2::function_793a7b85ffb737d1(var_5fc921ca5df09e7e);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x166bc
// Size: 0xbd
function function_e13625d770059ef9(node, missionid) {
    var_a6487fb1572c9b44 = function_d7fd9f403937e688(node.origin, node.angles);
    var_a6487fb1572c9b44 setscriptablepartstate("missile_silo_noent_use", "usable");
    var_a6487fb1572c9b44 thread function_ab5c0b42f31a0d20(missionid);
    trigger = spawn("noent_volume_trigger_radius", var_a6487fb1572c9b44.origin, 0, 700, 700);
    thread function_b58f7554faa406e7(trigger, "locate_missile_silo");
    var_a6487fb1572c9b44 thread namespace_f2ffc0540883e1ad::drawsphere(var_a6487fb1572c9b44.origin, 50, 10000000, (1, 0, 0));
    thread function_afe925f2dee5f03e(var_a6487fb1572c9b44);
    return var_a6487fb1572c9b44;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16781
// Size: 0x163
function function_afe925f2dee5f03e(var_a6487fb1572c9b44) {
    namespace_4b0406965e556711::function_1240434f4201ac9d("prematch_done");
    numagents = 4;
    for (i = 0; i < numagents; i++) {
        var_de2d3e1486e4e9d3 = randomfloatrange(200, 400);
        forward = anglestoforward(var_a6487fb1572c9b44.angles) * var_de2d3e1486e4e9d3;
        right = vectorcross((0, 0, 1), forward);
        facingangle = axistoangles(forward, right, (0, 0, 1));
        var_88b83b0d7a43ea72 = i / numagents * 360 + randomfloatrange(-30, 30) % 360;
        offset = rotatepointaroundvector((0, 0, 1), forward, var_88b83b0d7a43ea72);
        origin = var_a6487fb1572c9b44.origin + offset;
        aitype = namespace_bfef6903bca5845d::function_7f1a2e2ebe0c1693("ar", 2);
        agent = namespace_bfef6903bca5845d::ai_mp_requestspawnagent(aitype, origin, facingangle, "medium", "mission", "pmc_mission");
        namespace_2000a83505151e5b::function_e786aa52b93833eb(agent, var_a6487fb1572c9b44.origin, 512);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x168eb
// Size: 0x180
function function_948991a18b048182(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!player isonground() || !isdefined(player.team)) {
        return;
    }
    lootid = namespace_38b993c4618e76cd::getlootidfromref("brloot_ir_beacon");
    var_587f61ad4c5334a0 = istrue(player namespace_aead94004cf4c147::function_6f39f9916649ac48(lootid, 1));
    if (var_587f61ad4c5334a0) {
        groundpos = drop_to_ground(player.origin);
        placement = spawnscriptable("dmz_place_item", groundpos, player.angles);
        placement setscriptablepartstate("dmz_place_item_use", "unusable");
        placement setscriptablepartstate("dmz_place_item_model", "brloot_ir_beacon");
        player thread namespace_cb965d2f71fefddc::playerplaypickupanim();
        function_8359cadd253f9604(player, instance.var_1fa640f7c162f51e);
        teammates = getteamdata(player.team, "players");
        foreach (teammate in teammates) {
            instance disablescriptableplayeruse(teammate);
        }
    } else {
        player namespace_44abc05161e2e2cb::showerrormessage("PMC_S2/PLACE_ERR_MSG");
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16a72
// Size: 0x1b
function function_7fc83d63a85c14d(player) {
    function_8359cadd253f9604(player, "turn_on_mrap", 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16a94
// Size: 0x62
function function_496b109dc14fa57d(task) {
    if (isdefined(task.var_540e563bd70483a2) && istrue(task.var_540e563bd70483a2.var_27144879b0c7beed) && isdefined(task.teams[0])) {
        function_8a7a2427622e7572(task.teams[0], "hostage_final_exfil", 1);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16afd
// Size: 0x32
function function_a07e5e1f98c14d68() {
    thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("speed_deaddrop_chain"), (-8980, 4681, 405), namespace_38b993c4618e76cd::getlootidfromref("brloot_slipstream_laptop"), 1, 1);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16b36
// Size: 0x5f
function function_cc6a02d4564d9f07(player, metadata) {
    if (!function_cff2f4f168b29b81()) {
        return;
    }
    var_3f6103d9666b07cc = namespace_a38a2e1fe7519183::function_36275388f9093535(metadata);
    if (isdefined(var_3f6103d9666b07cc) && var_3f6103d9666b07cc.team != player.team) {
        function_8359cadd253f9604(var_3f6103d9666b07cc, "share_insured_weapon", 1);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16b9c
// Size: 0x86
function private function_5a3fd0babc886413(var_cfdfb123eb5c2482, vehicleref) {
    var_e6ab91af04fb3479 = namespace_f64231d5b7a2c3c4::vehicle_tracking_getgameinstances(vehicleref);
    foreach (var_9940e1f565dcfad0 in var_e6ab91af04fb3479) {
        if (!isdefined(var_9940e1f565dcfad0.var_628a2eba2e3d4af4) && var_9940e1f565dcfad0 != var_cfdfb123eb5c2482) {
            return 0;
        }
    }
    return 1;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16c2a
// Size: 0xfa
function private function_b55402e6d4fae450(vehicle) {
    if (!namespace_36f464722d326bbe::function_5e0e3a24dbb1fae1()) {
        return;
    }
    if (vehicle.vehiclename == "veh9_pwc" || vehicle.vehiclename == "veh9_rhib" || vehicle.vehiclename == "veh9_patrol_boat") {
        var_d9a354906c598604 = function_5a3fd0babc886413(vehicle, "veh9_pwc");
        if (var_d9a354906c598604) {
            var_d9a354906c598604 = var_d9a354906c598604 && function_5a3fd0babc886413(vehicle, "veh9_rhib");
            if (var_d9a354906c598604) {
                var_d9a354906c598604 = var_d9a354906c598604 && function_5a3fd0babc886413(vehicle, "veh9_patrol_boat");
                if (var_d9a354906c598604) {
                    foreach (player in level.players) {
                        function_8359cadd253f9604(player, "destroy_all_unoccupied_aquatic_vehicles", 1, 0);
                    }
                }
            }
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16d2b
// Size: 0x1e
function function_7854f54f01615a6e(vehicle) {
    if (!function_cff2f4f168b29b81()) {
        return;
    }
    function_b55402e6d4fae450(vehicle);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16d50
// Size: 0x2c3
function function_34969e35391841ba() {
    if (!namespace_36f464722d326bbe::function_e21746abaaaf8414()) {
        return;
    }
    namespace_4b0406965e556711::function_1240434f4201ac9d("fortress_system_init");
    var_590672f7b5711c59 = (-578, 7297, 434);
    fortress = namespace_9823ee6035594d67::function_c0a211a69f5f8f2f(var_590672f7b5711c59);
    if (!isdefined(fortress)) {
        /#
            assertmsg("The fortress for the Konni safehouse isn't initialized!");
        #/
        return;
    }
    namespace_9823ee6035594d67::function_d1ec6d522c8102d9(fortress);
    namespace_9823ee6035594d67::function_68a6379d51e7dbc2(fortress, "completely_locked");
    triggers = fortress.var_aa7c37b8b3ec1f46;
    group = spawnstruct();
    level.var_79c824ddfe860a6f = group;
    group.contributingplayers = [];
    group.used = [];
    group.categoryname = "pmc_konni_safehouse";
    group.volume = triggers[0];
    group.fortress = fortress;
    function_572838690d80d959(group.categoryname);
    group.var_45895ced8788d5de = getstructarray("pmc_konni_safehouse_exit", "script_noteworthy");
    var_9d3ab0bfff930906 = getstructarray("pmc_konni_safehouse_agent", "script_noteworthy");
    firstspawn = 1;
    foreach (spawn in var_9d3ab0bfff930906) {
        aitype = namespace_bfef6903bca5845d::function_7f1a2e2ebe0c1693("ar");
        agent = undefined;
        while (!isdefined(agent)) {
            agent = namespace_bfef6903bca5845d::ai_mp_requestspawnagent(aitype, spawn.origin, spawn.angles, "high", "mission", "pmc_mission", undefined, undefined, undefined, undefined, 0, undefined, 0);
            if (!isdefined(agent)) {
                waitframe();
            }
        }
        agentstruct = spawnstruct();
        agentstruct.group = group;
        agentstruct.var_90ccd093de8c8c55 = &function_8ef059ceb8bb6f26;
        agentstruct.ondeath = &function_5629fa2cae5846f2;
        agentstruct.var_9e729433fd479f19 = &function_507b92d2539b9074;
        agentstruct.var_9768b22610b34d9d = namespace_bfef6903bca5845d::function_edabf4238e9d70b5("brloot_cartel_transportation_plans", undefined, undefined, ter_op(firstspawn, 1, 0.25), 1);
        if (isint(agent)) {
            agentstruct.var_451a9d27d63c746b = agent;
        }
        namespace_14d36171baccf528::function_3ea1225bf6192343(agent, agentstruct);
        namespace_14d36171baccf528::function_58aab2edaec2599f(agent, "pmc_agentPostDormancy", &pmc_agentpostdormancy);
        function_e812b7065161da79(agent, group.categoryname);
        namespace_2000a83505151e5b::function_e786aa52b93833eb(agent, spawn.origin, 256);
        firstspawn = 0;
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1701a
// Size: 0x1ad
function function_f37f5d719bc2f2f0(grenade, player) {
    if (!namespace_36f464722d326bbe::function_e21746abaaaf8414()) {
        return;
    }
    player endon("death_or_disconnect");
    origin = function_4404ed46f49e5ba1(grenade);
    origin = function_53c4c53197386572(origin, grenade.origin);
    if (!isdefined(origin)) {
        return;
    }
    if (isdefined(level.var_79c824ddfe860a6f)) {
        if (namespace_9823ee6035594d67::function_20f6e9317b1baf3d(origin, level.var_79c824ddfe860a6f.fortress)) {
            if (isdefined(player)) {
                function_8359cadd253f9604(player, "grenade_in_konni_safehouse", 1);
            }
            namespace_9823ee6035594d67::function_a113cf2be454f78d(level.var_79c824ddfe860a6f.fortress);
            wait(1);
            agents = function_b4b9401715cf98ea(level.var_79c824ddfe860a6f.categoryname);
            foreach (agent in agents) {
                if (isagent(agent)) {
                    var_f66f4b446207b0c = agent.origin;
                    if (!isdefined(var_f66f4b446207b0c)) {
                        continue;
                    }
                    var_c79dca57049c64d4 = namespace_9823ee6035594d67::function_20f6e9317b1baf3d(var_f66f4b446207b0c, level.var_79c824ddfe860a6f.fortress);
                    if (var_c79dca57049c64d4) {
                        var_e8697ee52f033360 = getclosest(var_f66f4b446207b0c, level.var_79c824ddfe860a6f.var_45895ced8788d5de);
                        if (isdefined(var_e8697ee52f033360)) {
                            namespace_2000a83505151e5b::function_a5117518725da028(agent, var_e8697ee52f033360.origin, 0);
                        }
                    }
                }
            }
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x171ce
// Size: 0x27
function function_4404ed46f49e5ba1(grenade) {
    grenade endon("decoy_sequence_started");
    origin = grenade waittill("explode");
    return origin;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x171fd
// Size: 0x102
function function_7a1e65b949e0b879() {
    level endon("game_ended");
    flag_wait("create_script_initialized");
    flag_wait("scriptables_ready");
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("brloot_pmc_unobserved_radio", &function_cd8c827e2b6115ea);
    var_340fefbb7410b03e = getstructarray("pmc_unobserved_laptop", "script_noteworthy");
    foreach (node in var_340fefbb7410b03e) {
        dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, node.origin, node.angles);
        item = namespace_cb965d2f71fefddc::spawnpickup("brloot_valuable_konni_laptop", var_cb4fad49263e20c4, 1);
        item.var_bbc200bc77c5db2b = 1;
        item.var_8c6ce30a6a5126b1 = 1;
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17306
// Size: 0x19f
function function_f7d8054ae05de10f(door, player) {
    if (!namespace_36f464722d326bbe::function_7ee65fae13124702() || !getdvarint(@"hash_67839dc5e648f761", 1)) {
        return;
    }
    var_a44bbce89fc81df8 = getlootscriptablearrayinradius(undefined, undefined, door.fortress.origin, 1500);
    maxdist = -1;
    var_c0b5aefdde135c6d = undefined;
    foreach (loot in var_a44bbce89fc81df8) {
        if (!loot getscriptableisloot() || loot scriptableislootcache() || !namespace_9823ee6035594d67::function_20f6e9317b1baf3d(loot.origin, door.fortress)) {
            continue;
        }
        var_556b31282abcb132 = distancesquared(player.origin, loot.origin);
        if (var_556b31282abcb132 > maxdist) {
            maxdist = var_556b31282abcb132;
            var_c0b5aefdde135c6d = loot;
        }
    }
    if (isdefined(var_c0b5aefdde135c6d)) {
        spawnorigin = var_c0b5aefdde135c6d.origin;
        namespace_cb965d2f71fefddc::loothide(var_c0b5aefdde135c6d);
        radio = spawnscriptable("brloot_pmc_unobserved_radio", spawnorigin);
        radio.fortress = door.fortress;
        /#
            thread namespace_f2ffc0540883e1ad::drawsphere(radio.origin, 50, 120, (1, 0, 0));
        #/
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x174ac
// Size: 0xe9
function function_cd8c827e2b6115ea(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (player namespace_c39580665208f0a4::function_d3b190ee881c5ca7()) {
        instance setscriptablepartstate("brloot_pmc_unobserved_radio", "visible_unusable");
        function_8359cadd253f9604(player, "unobserved_activated_radio", 1);
        for (i = 0; i < level.var_cc75a90d4b9108b1.size; i++) {
            var_ab70ae90be101a99 = function_7bbdbbc6cb745dc6(int(level.var_cc75a90d4b9108b1[i]));
            playsoundatpos(instance.origin, var_ab70ae90be101a99);
            wait(getdvarfloat(@"hash_291c19b0a2eb5ce4", 1));
        }
        instance setscriptablepartstate("brloot_pmc_unobserved_radio", "visible");
    } else {
        player namespace_44abc05161e2e2cb::showerrormessage("MP/ACTIVATE_DISGUISE_ERROR");
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1759c
// Size: 0x11e
function function_7bbdbbc6cb745dc6(var_506303dca407bfe6) {
    var_7c06c0a232e7e6ea = "";
    switch (var_506303dca407bfe6) {
    case 0:
        var_7c06c0a232e7e6ea = "zero";
        break;
    case 1:
        var_7c06c0a232e7e6ea = "one";
        break;
    case 2:
        var_7c06c0a232e7e6ea = "two";
        break;
    case 3:
        var_7c06c0a232e7e6ea = "three";
        break;
    case 4:
        var_7c06c0a232e7e6ea = "four";
        break;
    case 5:
        var_7c06c0a232e7e6ea = "five";
        break;
    case 6:
        var_7c06c0a232e7e6ea = "six";
        break;
    case 7:
        var_7c06c0a232e7e6ea = "seven";
        break;
    case 8:
        var_7c06c0a232e7e6ea = "eight";
        break;
    case 9:
        var_7c06c0a232e7e6ea = "nine";
        break;
    default:
        var_7c06c0a232e7e6ea = "zero";
        break;
    }
    return "dx_br_bds5_fcms_cmpv_" + var_7c06c0a232e7e6ea;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x176c2
// Size: 0x1c1
function function_562889df3a616506() {
    flag_wait("scriptables_ready");
    if (namespace_36f464722d326bbe::function_ffbbb4525b11d5a2()) {
        var_2b63ed707bd0b362 = getentitylessscriptablearray("scriptable_un_office_computer_monitor_01_169", "classname", (-919, 828, 451), 20);
        if (isdefined(var_2b63ed707bd0b362) && var_2b63ed707bd0b362.size > 0) {
            var_2b63ed707bd0b362[0] setscriptablepartstate("screen", "bink2");
            if (isdefined(level.var_ad243d07c52c2843.var_4cc11ef35eb39ae8)) {
                level.var_ad243d07c52c2843.var_4cc11ef35eb39ae8[14] = "pmc_cartel_computer";
            }
        }
    }
    if (namespace_36f464722d326bbe::function_5e0e3a24dbb1fae1()) {
        var_740d31feb555e99e = getstruct("pmc_cartel_boat", "targetname");
        if (isdefined(var_740d31feb555e99e)) {
            boat = namespace_1f188a13f7e79610::vehicle_spawn("veh9_patrol_boat", var_740d31feb555e99e);
            var_536a5c2e42582b98 = namespace_1f188a13f7e79610::vehicle_getturretbyweapon(boat, "iw9_mg_patrol_boat_back_mp");
            var_536a5c2e42582b98.var_a682a8256c580b8c = var_536a5c2e42582b98.exit;
            var_536a5c2e42582b98.exit = (-100, 45, -7);
            var_107050c9b895dd07 = spawn("script_model", boat.origin + (0, 0, 5) + anglestoforward(boat.angles) * -90);
            var_107050c9b895dd07.angles = boat.angles;
            var_107050c9b895dd07 setmodel("pmc_cartel_cargo");
            var_107050c9b895dd07 linkto(boat);
            boat.payload = var_107050c9b895dd07;
            if (isdefined(var_107050c9b895dd07.objidnum)) {
                level.var_f49deaf34cd1a04a = var_107050c9b895dd07.objidnum;
            }
            thread namespace_168c086126cfa488::function_cf8f787850f621f9(boat);
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1788a
// Size: 0x630
function function_48864d898e5100c0() {
    if (!namespace_36f464722d326bbe::function_5e0e3a24dbb1fae1()) {
        return;
    }
    level.var_c162c5e269f54cbf = spawnstruct();
    level.var_c162c5e269f54cbf.nodes = [];
    var_d7dcf29bc306d383 = getstructarray("pmc_terminal_bombsite", "script_noteworthy");
    foreach (node in var_d7dcf29bc306d383) {
        site = spawnscriptable("dmz_supply_site", node.origin, node.angles);
        site.use = spawnscriptable("dmz_supply_site_use_pmc", site.origin);
        site.node = node;
        node.site = site;
        node.use = site.use;
        node.use.node = node;
        node.task = spawnstruct();
        node.var_c01591cd513b7e46 = 1;
        node.var_3dba99677fd840cd = &function_7ef66059655c6e3e;
        node.curorigin = site.origin;
        node.offset3d = (0, 0, 15);
        node namespace_19b4203b51d56488::requestid(0, 0, undefined, 1);
        objid = node.objidnum;
        namespace_5a22b6f3a56f7e9b::update_objective_icon(objid, "ui_map_icon_obj_bomb_collect");
        namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objid, 1);
        namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(objid, 15);
        namespace_5a22b6f3a56f7e9b::update_objective_position(objid, node.origin + (0, 0, 15));
        namespace_5a22b6f3a56f7e9b::objective_pin_global(objid, 1);
        namespace_5a22b6f3a56f7e9b::function_d7e3c4a08682c1b9(objid, 1);
        namespace_5a22b6f3a56f7e9b::objective_set_play_intro(objid, 0);
        namespace_5a22b6f3a56f7e9b::function_9cad42ac02eff950(objid);
        namespace_5a22b6f3a56f7e9b::function_6ae37618bb04ea60(objid);
        site.use setscriptablepartstate("dmz_supply_site_use_pmc", "usable");
        node.trigger = spawn("trigger_radius", node.origin, 0, int(128), int(512));
        node.trigger trigger_off();
        node thread function_1e1fb042a28726e6(node.trigger, 512);
        level.var_c162c5e269f54cbf.nodes[level.var_c162c5e269f54cbf.nodes.size] = node;
        thread function_b7fa1e109d78dfe5(node);
    }
    var_7944bbb983082099 = getstructarray("pmc_terminal_safe", "script_noteworthy");
    foreach (node in var_7944bbb983082099) {
        safe = spawnscriptable("dmz_safe_pmc_terminal", node.origin, node.angles);
        safe.curorigin = safe.origin;
        safe.offset3d = (0, 0, 15);
        safe namespace_19b4203b51d56488::requestid(0, 0, undefined, 1);
        objid = safe.objidnum;
        namespace_5a22b6f3a56f7e9b::update_objective_icon(objid, "ui_map_icon_safe");
        namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objid, 1);
        namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(objid, 15);
        namespace_5a22b6f3a56f7e9b::update_objective_position(objid, safe.origin + (0, 0, 15));
        namespace_5a22b6f3a56f7e9b::objective_pin_global(objid, 1);
        namespace_5a22b6f3a56f7e9b::function_d7e3c4a08682c1b9(objid, 1);
        namespace_5a22b6f3a56f7e9b::objective_set_play_intro(objid, 0);
        if (level.var_ac29bbe3a85fc5fa.var_f73c5aa20a9c44d5) {
            namespace_5a22b6f3a56f7e9b::function_9cad42ac02eff950(objid);
        } else {
            namespace_5a22b6f3a56f7e9b::function_a28e8535e00d34f3(objid);
        }
        namespace_5a22b6f3a56f7e9b::function_6ae37618bb04ea60(objid);
        safe.node = node;
        node.safe = safe;
        level.var_c162c5e269f54cbf.nodes[level.var_c162c5e269f54cbf.nodes.size] = node;
        safe setscriptablepartstate("safe", "usable_not_open");
        safe.trigger = spawn("trigger_radius", safe.node.origin, 0, int(128), int(512));
        safe.trigger trigger_off();
        safe.capturetime = getdvarint(@"hash_aaf56e4808ead990", 480);
        safe.var_4e29111f80d17365 = [];
        safe thread namespace_abc7ed0cde8527d4::function_474e2e9b4a997564(safe.trigger, 512);
        safe.var_ceb543956c7203e7 = &namespace_abc7ed0cde8527d4::function_9618cc73546d253d;
        safe.var_ab0e150eda2b5e13 = &function_2d2046e72a3653fb;
        node.var_3dba99677fd840cd = &function_1c9e346732c1dcc5;
    }
    thread function_139abff6182eebcb();
    if (getdvarint(@"hash_dd42f7c88cf36a4b", 1)) {
        foreach (node in level.var_c162c5e269f54cbf.nodes) {
            thread function_2039e3a5f09b1a11(node);
        }
    }
    namespace_4b0406965e556711::function_1240434f4201ac9d("fortress_system_init");
    level.var_c162c5e269f54cbf.fortress = namespace_9823ee6035594d67::function_888d8429a71c944c("delta_terminal");
    /#
        assertex(isdefined(level.var_c162c5e269f54cbf.fortress), "Didn't find the delta terminal hero stronghold somehow!");
    #/
    level.var_c162c5e269f54cbf.fortress.var_a42c3e0e1b2dc645 = "cartel";
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ec1
// Size: 0x1b9
function function_139abff6182eebcb() {
    level endon("game_ended");
    var_2c728360e4c9326a = [0:getdvarint(@"hash_afbca5bb4491c0a5", 45), 1:getdvarint(@"hash_4d898ebbb795902f", 30), 2:getdvarint(@"hash_2436b93c12eb7965", 20), 3:getdvarint(@"hash_366c7231d6d96a73", 15), 4:getdvarint(@"hash_1d332131c5bf6c97", 10)];
    var_6068cce0aec83591 = 0;
    while (1) {
        foreach (node in level.var_c162c5e269f54cbf.nodes) {
            if (istrue(node.shouldreinforce)) {
                if (!istrue(var_6068cce0aec83591)) {
                    namespace_9823ee6035594d67::function_a113cf2be454f78d(level.var_c162c5e269f54cbf.fortress);
                    var_6068cce0aec83591 = 1;
                }
                var_34e72e17a2410a72 = 0;
                foreach (var_715887858d481e40 in level.var_c162c5e269f54cbf.nodes) {
                    var_34e72e17a2410a72 = var_34e72e17a2410a72 + istrue(var_715887858d481e40.shouldreinforce);
                }
                function_a30ad7c4a9b45232(node.origin, var_34e72e17a2410a72);
                waittime = var_2c728360e4c9326a[var_34e72e17a2410a72 - 1];
                if (isdefined(waittime)) {
                    wait(waittime);
                }
            }
        }
        wait(1);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18081
// Size: 0x7d
function function_a30ad7c4a9b45232(origin, count) {
    agents = undefined;
    while (!isdefined(agents)) {
        numagents = getdvarint(@"hash_53bfa830add0ab24", 4);
        if (count >= 4) {
            numagents = numagents + 2;
        }
        agents = namespace_bfef6903bca5845d::function_77acc10c4823dd8a(numagents, origin, "high", "mission", "demoReinforcements", undefined, undefined, undefined, undefined, "Helicopter");
        if (!isdefined(agents)) {
            wait(1);
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18105
// Size: 0x9b
function function_2039e3a5f09b1a11(node) {
    level endon("game_ended");
    while (1) {
        if (istrue(node.shouldreinforce)) {
            agents = agentsnear(node.origin, 500);
            foreach (agent in agents) {
                thread pmc_terminalwatchagentdisarmtimer(node, agent);
            }
        }
        wait(1);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x181a7
// Size: 0x222
function pmc_terminalwatchagentdisarmtimer(node, agent) {
    level endon("game_ended");
    if (istrue(namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "pmc_terminalWatchAgentDisarmTimer"))) {
        return;
    }
    namespace_14d36171baccf528::agentpers_setagentpersdata(agent, "pmc_terminalWatchAgentDisarmTimer", 1);
    var_4fe918623e730b5a = getdvarint(@"hash_4989dd8f2d0eb10f", 6);
    timeremaining = var_4fe918623e730b5a;
    while (1) {
        if (!isdefined(agent) || !isalive(agent)) {
            return;
        }
        distance = distance(agent.origin, node.origin);
        if (!istrue(node.shouldreinforce) || istrue(node.paused) || distance > 500) {
            namespace_14d36171baccf528::agentpers_setagentpersdata(agent, "pmc_terminalWatchAgentDisarmTimer", 0);
            return;
        }
        if (distance <= 200) {
            contents = create_contents(0, 1, 1, 0);
            ignore = [];
            if (isdefined(node.safe)) {
                ignore[ignore.size] = node.safe;
            }
            info = physics_raycast(node.origin + (0, 0, 65), agent.origin + (0, 0, 50), contents, undefined, 0, "physicsquery_closest", 1, 0);
            if (!info.size || !isdefined(info[0]["hittype"])) {
                timeremaining = timeremaining - level.framedurationseconds;
                if (timeremaining <= 0) {
                    players = function_a92d0739b2373df(node.origin, 500, 1);
                    if (!players.size) {
                        node [[ node.var_3dba99677fd840cd ]](agent);
                    }
                    namespace_14d36171baccf528::agentpers_setagentpersdata(agent, "pmc_terminalWatchAgentDisarmTimer", 0);
                    return;
                }
            } else {
                /#
                    sphere(info[0]["<unknown string>"], 10);
                #/
            }
        } else if (distance <= 500) {
            namespace_2000a83505151e5b::function_a5117518725da028(agent, node.origin, 0, 0, 0);
            timeremaining = var_4fe918623e730b5a;
        }
        waitframe();
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x183d0
// Size: 0x176
function function_b7fa1e109d78dfe5(node) {
    while (1) {
        node waittill("bomb_planted");
        node.nearbyplayers = [];
        namespace_5a22b6f3a56f7e9b::update_objective_state(node.objidnum, "current");
        namespace_5a22b6f3a56f7e9b::objective_show_progress(node.objidnum, 1);
        node.trigger trigger_on();
        node.use.origin = node.plantedbomb.origin;
        node.use setscriptablepartstate("dmz_supply_site_use_pmc", "defusable");
        foreach (player in level.players) {
            node.use enablescriptableplayeruse(player);
        }
        node.var_7b45aaac74192c14 = namespace_bfef6903bca5845d::function_353fecd1549f5f42(node.plantedbomb.origin, 2048, undefined, 10);
        node.isactive = 1;
        node.shouldreinforce = 1;
        node thread function_dd80845d6200b0dc(getdvarint(@"hash_cadc39f51d382105", 360));
        node function_2e94d8da4a6ed951();
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1854d
// Size: 0xa3
function function_dd80845d6200b0dc(time) {
    level endon("game_ended");
    self endon("bomb_defused");
    /#
        sphere(self.origin + (0, 0, 50), 600, (1, 0, 0), 1, 100000);
    #/
    function_849b91807bee7e34(time);
    namespace_5ffce5a43b2d1ec2::function_accead05b2c47cb7();
    self.shouldreinforce = 0;
    if (isdefined(self.var_6036cd81fe22627)) {
        function_8359cadd253f9604(self.var_6036cd81fe22627, "destroy_terminal_supplies", 1);
    }
    wait(0.1);
    self.use freescriptable();
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x185f7
// Size: 0x10d
function function_849b91807bee7e34(time) {
    var_90fb369a18926018 = [];
    thread function_9dfa2432e378262a(time);
    starttime = gettime();
    offset = 5;
    totaltime = time + offset;
    self.plantedbomb thread namespace_5ffce5a43b2d1ec2::playtickingsound(time, offset);
    self.timeremaining = totaltime;
    while (1) {
        currenttime = gettime();
        duration = (currenttime - starttime) / 1000;
        var_de2c2a1fd468b5f = 1 - duration / time;
        progress = clamp(var_de2c2a1fd468b5f, 0, 1);
        self.timeremaining = totaltime - duration;
        var_90fb369a18926018 = function_5df48be36d20a070(self.nearbyplayers, var_90fb369a18926018, progress, "MP_DMZ_MISSIONS/DMZ_DESTROY_SAM_PROGRESS_TEXT");
        namespace_5a22b6f3a56f7e9b::objective_set_progress(self.objidnum, progress);
        if (self.timeremaining <= 0) {
            self notify("bomb_exploded");
            break;
        }
        waitframe();
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1870b
// Size: 0x18b
function function_5df48be36d20a070(nearbyplayers, var_90fb369a18926018, progress, text) {
    allplayers = array_combine(nearbyplayers, var_90fb369a18926018);
    var_f6fd7b0e73c3270c = var_90fb369a18926018;
    foreach (player in allplayers) {
        if (!isdefined(player)) {
            continue;
        }
        if (isdefined(player.team) && !array_contains(self.teams, player.team)) {
            self.teams[self.teams.size] = player.team;
        }
        if (!array_contains(var_90fb369a18926018, player) && array_contains(nearbyplayers, player)) {
            namespace_5a22b6f3a56f7e9b::objective_show_player_progress(self.objidnum, player);
            namespace_5a22b6f3a56f7e9b::function_8f7a55bda12ebb21(text, player);
            namespace_5a22b6f3a56f7e9b::function_7299a742781a5030(2, player);
            namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(self.objidnum, player);
            var_f6fd7b0e73c3270c = array_add(var_f6fd7b0e73c3270c, player);
        } else if (array_contains(var_90fb369a18926018, player) && !array_contains(nearbyplayers, player)) {
            namespace_5a22b6f3a56f7e9b::objective_hide_player_progress(self.objidnum, player);
            namespace_5a22b6f3a56f7e9b::function_7299a742781a5030(0, player);
            namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(self.objidnum, player);
            var_f6fd7b0e73c3270c = array_remove(var_f6fd7b0e73c3270c, player);
        }
    }
    return var_f6fd7b0e73c3270c;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1889e
// Size: 0x36
function function_9dfa2432e378262a(timer) {
    level endon("game_ended");
    self endon("bomb_defused");
    wait(timer);
    self.use setscriptablepartstate("dmz_supply_site_use_pmc", "unusable", 0);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x188db
// Size: 0x124
function function_2e94d8da4a6ed951() {
    level endon("game_ended");
    self endon("bomb_exploded");
    self waittill("bomb_defused");
    self.use setscriptablepartstate("dmz_supply_site_use_pmc", "usable", 0);
    foreach (player in self.nearbyplayers) {
        namespace_5a22b6f3a56f7e9b::function_26259bd38697b5ad(self.objidnum, player);
    }
    self.nearbyplayers = [];
    var_379d6bad84e53438 = self.var_bd6089532051aa97;
    namespace_d696adde758cbe79::showdmzsplash("dmz_demo_defused_lose", getteamdata(var_379d6bad84e53438, "players"));
    if (isdefined(self.var_285292a6695a1fca)) {
        namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2("pmc_missions", "onBombDefused", self.var_285292a6695a1fca);
    }
    self.shouldreinforce = 0;
    self.use.origin = self.origin;
    self.plantedbomb delete();
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18a06
// Size: 0x14
function function_7ef66059655c6e3e(agent) {
    self notify("bomb_defused");
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18a21
// Size: 0xd3
function function_1e1fb042a28726e6(trigger, radius) {
    level endon("game_ended");
    self endon("bomb_exploded");
    self.nearbyplayers = [];
    self.teams = [];
    while (1) {
        player = trigger waittill("trigger");
        if (!isplayer(player) || array_contains(self.nearbyplayers, player)) {
            continue;
        }
        if (!array_contains(self.teams, player.team)) {
            self.teams[self.teams.size] = player.team;
        }
        self.nearbyplayers = array_add(self.nearbyplayers, player);
        thread function_34a83ef704f155d7(trigger, player, radius);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18afb
// Size: 0x82
function function_34a83ef704f155d7(trigger, player, radius) {
    while (isdefined(player) && isalive(player) && isdefined(self.trigger) && distance(trigger.origin, player.origin) < radius * 1.2) {
        wait(0.2);
    }
    self.nearbyplayers = array_remove(self.nearbyplayers, player);
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x18b84
// Size: 0x434
function function_ec7e73044204b1cf(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (part != "dmz_supply_site_use_pmc") {
        return;
    }
    if (state == "usable") {
        instance setscriptablepartstate("dmz_supply_site_use_pmc", "unusable");
        node = instance.node;
        if (isdefined(node.planting) && istrue(node.planting)) {
            return;
        }
        node.planting = 1;
        bomb = namespace_5ffce5a43b2d1ec2::function_cadc5181c3b67e3f(player);
        thread namespace_f2c68794a1018c9d::function_d86771edadba8b4a(node, node, player);
        buttontime = 0;
        while (buttontime < 5) {
            if (node.cancel || !namespace_7e17181d03156026::function_ad443bbcdcf37b85(player)) {
                node.planting = 0;
                namespace_5ffce5a43b2d1ec2::function_db896f4486ca187(player, bomb);
                instance setscriptablepartstate("dmz_supply_site_use_pmc", "usable", 0);
                return;
            }
            buttontime = buttontime + level.framedurationseconds;
            waitframe();
        }
        origin = player.origin;
        namespace_5ffce5a43b2d1ec2::function_db896f4486ca187(player, bomb);
        var_eeb138fae3842a92 = spawn("script_model", origin);
        var_eeb138fae3842a92 setmodel("offhand_2h_wm_briefcase_bomb_v0");
        var_eeb138fae3842a92.visuals = [];
        var_eeb138fae3842a92.visuals[0] = spawn("script_model", origin);
        var_eeb138fae3842a92.visuals[0] setmodel("tag_origin");
        var_eeb138fae3842a92.curorigin = origin;
        var_eeb138fae3842a92.offset3d = (0, 0, 15);
        var_eeb138fae3842a92.safeorigin = origin;
        var_eeb138fae3842a92.trigger = spawnstruct();
        var_eeb138fae3842a92.icon = -1;
        var_eeb138fae3842a92.owner = player;
        var_eeb138fae3842a92 namespace_19b4203b51d56488::setdropped(undefined, undefined, 1);
        node.plantedbomb = var_eeb138fae3842a92;
        node.plantedbomb.node = node;
        node.bombplanted = 1;
        node.var_6036cd81fe22627 = player;
        node.var_bd6089532051aa97 = player.team;
        node.planting = 0;
        node notify("bomb_planted");
    } else if (state == "defusable") {
        instance setscriptablepartstate("dmz_supply_site_use_pmc", "unusable");
        node = instance.node;
        if (isdefined(node.defusing) && istrue(node.defusing)) {
            return;
        }
        node.defusing = 1;
        node.plantedbomb hide();
        bomb = namespace_5ffce5a43b2d1ec2::function_cadc5181c3b67e3f(player);
        thread namespace_f2c68794a1018c9d::function_d86771edadba8b4a(node, node, player);
        buttontime = 0;
        while (buttontime < 5) {
            if (node.cancel || !namespace_7e17181d03156026::function_ad443bbcdcf37b85(player) || isdefined(player.var_2ca0dac193d83c1) && player.var_2ca0dac193d83c1) {
                node.defusing = 0;
                namespace_5ffce5a43b2d1ec2::function_db896f4486ca187(player, bomb);
                node.plantedbomb show();
                instance setscriptablepartstate("dmz_supply_site_use_pmc", "defusable");
                foreach (player in level.players) {
                    instance enablescriptableplayeruse(player);
                }
                return;
            }
            buttontime = buttontime + level.framedurationseconds;
            waitframe();
        }
        node.var_285292a6695a1fca = player;
        node.defusing = 0;
        node notify("bomb_defused");
        namespace_5ffce5a43b2d1ec2::function_db896f4486ca187(player, bomb);
        if (isdefined(node.plantedbomb)) {
            node.plantedbomb show();
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18fbf
// Size: 0x2b2
function function_2d2046e72a3653fb(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!isdefined(player.team)) {
        return;
    }
    if (!namespace_abc7ed0cde8527d4::function_9ab4d7ea05385788(player)) {
        player namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.var_355cddb773cb000d);
        return;
    }
    if (state == "usable_not_open") {
        instance setscriptablepartstate(part, "unusable");
        instance.var_b14a331ba425c286 = 0;
        instance thread namespace_abc7ed0cde8527d4::function_24765a7aabf0093e(player);
        instance namespace_abc7ed0cde8527d4::function_7f10e8e120314f4b(player, part);
        if (istrue(instance.var_b14a331ba425c286)) {
            instance.teams = [0:player.team];
            instance.trigger trigger_on();
            namespace_25b25d188ef778c4::function_1c2bd1696d29935b(player.team, "dmz_mission_safe_opening");
            namespace_5a22b6f3a56f7e9b::update_objective_state(instance.objidnum, "current");
            namespace_5a22b6f3a56f7e9b::objective_show_progress(instance.objidnum, 1);
            namespace_5a22b6f3a56f7e9b::objective_teammask_addtomask(instance.objidnum, player.team);
            instance thread function_c606a52499149c25();
            wait(1);
            namespace_d696adde758cbe79::showdmzsplash("dmz_safe_defend_started", getteamdata(player.team, "players"), instance.node.poi);
        } else {
            instance setscriptablepartstate(part, "usable_not_open");
        }
    } else if (state == "usable_drilling") {
        instance.node.paused = 0;
        instance.nearbyplayers = [];
        instance setscriptablepartstate("safe", "unusable_drilling");
    } else if (state == "open_usable") {
        if (instance getscriptableparthasstate("safe", "unusable")) {
            instance setscriptablepartstate("safe", "unusable");
        }
        if (!isdefined(instance.contents)) {
            var_9256a8c4667baa69 = getdvarint(@"hash_4c9b0494a5ffac13", 2);
            items = namespace_1b7e64f50cca9321::function_a76b46f057488cc0(instance, player.team, 23, var_9256a8c4667baa69);
            instance.var_46a3a8565ac0c17c = 4;
            instance namespace_1b7e64f50cca9321::lootcachespawncontents(items, 1, player, instance.contents);
            instance namespace_abc7ed0cde8527d4::function_20d58c7fb1074fc6(player.team);
        } else {
            instance namespace_1b7e64f50cca9321::lootcachespawncontents(undefined, 1, player, instance.contents);
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19278
// Size: 0x1d7
function function_c606a52499149c25() {
    level endon("game_ended");
    self endon("safe_unlocked");
    self.progress = 0;
    var_90fb369a18926018 = [];
    self.node.isactive = 1;
    self.node.shouldreinforce = 1;
    while (1) {
        if (isdefined(self.trigger) && !istrue(self.trigger.trigger_off)) {
            if (!istrue(self.node.paused)) {
                var_f8527642ea162ae5 = self.progress;
                self.progress = min(self.capturetime, self.progress + level.framedurationseconds);
            }
            progress = self.progress / self.capturetime;
            text = ter_op(istrue(self.node.paused), "MP_DMZ_MISSIONS/SAFE_PAUSED", "MP_DMZ_MISSIONS/OPENING_SAFE");
            var_90fb369a18926018 = function_5df48be36d20a070(self.nearbyplayers, var_90fb369a18926018, progress, text);
            namespace_5a22b6f3a56f7e9b::objective_set_progress(self.objidnum, progress);
            if (self.progress >= self.capturetime) {
                namespace_abc7ed0cde8527d4::function_67abfc6a70af2ccc();
                self.node.shouldreinforce = 0;
                foreach (team in self.teams) {
                    function_8a7a2427622e7572(team, "terminal_safe_open", 1);
                }
            }
        }
        waitframe();
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19456
// Size: 0xc0
function function_1c9e346732c1dcc5(agent) {
    self.paused = 1;
    self.safe setscriptablepartstate("safe", "usable_drilling");
    self.safe.nearbyplayers = [];
    foreach (team in self.safe.teams) {
        players = getteamdata(team, "players");
        namespace_d696adde758cbe79::showdmzsplash("dmz_train_safe_paused", players);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1951d
// Size: 0x109
function function_c0849326027254f0() {
    if (namespace_cd0b2d039510b38d::getsubgametype() != "dmz") {
        return;
    }
    scriptable = "brloot_volatile_decoy_grenade";
    if (!isdefined(level.br_pickups)) {
        namespace_cb965d2f71fefddc::br_pickups_init();
    }
    lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(scriptable);
    registersharedfunc(scriptable, "delete", &function_29ddd40932b14edb);
    registersharedfunc(scriptable, "dropped", &function_b46d7d7d4eccda8c);
    if (isdefined(lootid)) {
        registersharedfunc(lootid, "addedToContainer", &function_5df8cf35b1de080c);
        registersharedfunc(lootid, "pickedUp", &function_32cb9876a487c40f);
        registersharedfunc(lootid, "addedToDeadDrop", &function_be5af8dc2f94e2ee);
        registersharedfunc(lootid, "extracted", &function_792282e9cede4876);
        registersharedfunc(lootid, "onItemSold", &function_54e94e9563adff5e);
    }
    level.var_877f557047d60fb5 = spawnscriptable("pmc_volatile_decoy_grenade", (0, 0, 0), (0, 0, 0));
    thread function_c7cfd1ad1977f03e();
    thread function_39564755f8f1046b();
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1962d
// Size: 0x78
function function_39564755f8f1046b() {
    level endon("game_ended");
    level.var_877f557047d60fb5 endon("death");
    while (1) {
        if (isdefined(level.var_877f557047d60fb5.targetent)) {
            level.var_877f557047d60fb5.origin = level.var_877f557047d60fb5.targetent.origin + (0, 0, 50);
        }
        waitframe();
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x196ac
// Size: 0x28d
function function_c7cfd1ad1977f03e() {
    level endon("game_ended");
    level.var_877f557047d60fb5 endon("death");
    firetypes = [0:"ar", 1:"smg", 2:"sniper"];
    var_d95c5ad4a266e91f = [0:"footFallSoundsA", 1:"footFallSoundsB"];
    var_9a9572ba98e9e9ec = [0:"footFallsSprint", 1:"footFallsWalk"];
    while (1) {
        if (istrue(level.var_877f557047d60fb5.var_7309e8a5ef4bc197)) {
            var_a6f6bc31eb056d92 = randomfloat(1) > 0.65;
            if (var_a6f6bc31eb056d92) {
                stepcount = randomintrange(6, 12);
                var_fd5d79d7e8a4c916 = random(var_d95c5ad4a266e91f);
                var_9c7e57c8db70ba17 = random(var_9a9572ba98e9e9ec);
                for (i = 0; i < stepcount; i++) {
                    if (istrue(level.var_877f557047d60fb5.var_7309e8a5ef4bc197)) {
                        level.var_877f557047d60fb5 setscriptablepartstate(var_fd5d79d7e8a4c916, var_9c7e57c8db70ba17);
                        if (var_fd5d79d7e8a4c916 == "footFallSoundsA") {
                            var_fd5d79d7e8a4c916 = "footFallSoundsB";
                        } else {
                            var_fd5d79d7e8a4c916 = "footFallSoundsA";
                        }
                    }
                    wait(0.15);
                }
            } else {
                firetype = random(firetypes);
                firecount = 1 + randomint(level.decoygrenadedata.firemaxcounts[firetype]);
                level.var_877f557047d60fb5 setscriptablepartstate("weaponSounds", firetype + "Fire", 0);
                var_5c362dcaaa44cdf0 = function_98a826b6b6d0d118(level.var_877f557047d60fb5.origin, 2000, undefined, 1000, 0);
                foreach (agent in var_5c362dcaaa44cdf0) {
                    agent aieventlistenerevent("gunshot", level.var_877f557047d60fb5.targetent, level.var_877f557047d60fb5.origin);
                }
                wait(level.decoygrenadedata.firetimes[firetype]);
            }
        }
        intervaltime = randomfloatrange(1, 5);
        wait(intervaltime);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19940
// Size: 0x5e
function function_32cb9876a487c40f(scriptable, player) {
    level.var_877f557047d60fb5.var_7309e8a5ef4bc197 = 1;
    level.var_877f557047d60fb5.origin = player.origin;
    level.var_877f557047d60fb5.targetent = player;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x199a5
// Size: 0x5c
function function_5df8cf35b1de080c(container, player) {
    level.var_877f557047d60fb5.var_7309e8a5ef4bc197 = 1;
    level.var_877f557047d60fb5.targetent = undefined;
    level.var_877f557047d60fb5.origin = container.origin;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19a08
// Size: 0x5a
function function_b46d7d7d4eccda8c(pickup, player, origin) {
    level.var_877f557047d60fb5.var_7309e8a5ef4bc197 = 1;
    level.var_877f557047d60fb5.targetent = undefined;
    level.var_877f557047d60fb5.origin = origin;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19a69
// Size: 0x67
function function_be5af8dc2f94e2ee(var_5793a0cf9d352c92, lootid) {
    level.var_877f557047d60fb5.var_7309e8a5ef4bc197 = 1;
    level.var_877f557047d60fb5.targetent = undefined;
    level.var_877f557047d60fb5.origin = var_5793a0cf9d352c92.origin;
    return [0:lootid, 1:0];
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19ad8
// Size: 0x2b
function function_29ddd40932b14edb() {
    level.var_877f557047d60fb5.var_7309e8a5ef4bc197 = 0;
    level.var_877f557047d60fb5.targetent = undefined;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19b0a
// Size: 0x3c
function function_792282e9cede4876(player, item) {
    level.var_877f557047d60fb5.var_7309e8a5ef4bc197 = 0;
    level.var_877f557047d60fb5.targetent = undefined;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19b4d
// Size: 0x54
function function_54e94e9563adff5e(player, lootid, type, var_9fb3b576439ee3d, var_b87f7fae01ce754f) {
    level.var_877f557047d60fb5.var_7309e8a5ef4bc197 = 0;
    level.var_877f557047d60fb5.targetent = undefined;
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19ba8
// Size: 0x142
function function_83ba07b9cb8b0809() {
    spawn = getstruct("pmc_biolabs_hostage", "script_noteworthy");
    if (isdefined(spawn)) {
        namespace_4b0406965e556711::function_1240434f4201ac9d("prematch_done");
        var_325f3808645ad9e2 = spawnstruct();
        var_325f3808645ad9e2.teams = [];
        var_325f3808645ad9e2.node = spawnstruct();
        var_325f3808645ad9e2.node.target = "fake_debug_hostage";
        var_325f3808645ad9e2.var_2f893d4a9cbf8a5c = 1;
        var_679afef82bb8e515 = spawnstruct();
        spawn.targetname = "fake_debug_hostage";
        spawn.script_noteworthy = "hostage";
        function_1f6c1a9b7564dc61(spawn);
        var_325f3808645ad9e2 namespace_232aeaeb467df5bd::function_b6b601986dcad85a();
        var_325f3808645ad9e2.instance setscriptablepartstate("dmz_hostage", "remaining");
        foreach (player in level.players) {
            var_325f3808645ad9e2.instance enablescriptableplayeruse(player);
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x19cf1
// Size: 0xf6
function function_ff7f720788558a70(agent, players) {
    var_1b8524f934edd790 = [];
    foreach (player in players) {
        if (isdefined(player.team) && !array_contains(var_1b8524f934edd790, player.team)) {
            var_1b8524f934edd790 = array_add(var_1b8524f934edd790, player.team);
        }
    }
    foreach (team in var_1b8524f934edd790) {
        function_8a7a2427622e7572(team, "pmc_biolabs_hostage_exfil", 1);
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19dee
// Size: 0x279
function function_b74ad2c2c1691b18() {
    if (!namespace_36f464722d326bbe::function_5e0e3a24dbb1fae1()) {
        return;
    }
    structs = getstructarray("pmc_radiation_safe", "script_noteworthy");
    namespace_4b0406965e556711::function_1240434f4201ac9d("radiation_initialized");
    foreach (node in structs) {
        if (namespace_7789f919216d38a2::radiation_isinradiation(node.origin)) {
            safe = spawnscriptable("dmz_safe_pmc_terminal", node.origin, node.angles);
            safe.curorigin = safe.origin;
            safe.offset3d = (0, 0, 15);
            safe namespace_19b4203b51d56488::requestid(0, 0, undefined, 1);
            objid = safe.objidnum;
            namespace_5a22b6f3a56f7e9b::update_objective_icon(objid, "ui_map_icon_safe");
            namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objid, 1);
            namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(objid, 15);
            namespace_5a22b6f3a56f7e9b::update_objective_position(objid, safe.origin + (0, 0, 15));
            namespace_5a22b6f3a56f7e9b::objective_pin_global(objid, 1);
            namespace_5a22b6f3a56f7e9b::function_d7e3c4a08682c1b9(objid, 1);
            namespace_5a22b6f3a56f7e9b::objective_set_play_intro(objid, 0);
            if (level.var_ac29bbe3a85fc5fa.var_f73c5aa20a9c44d5) {
                namespace_5a22b6f3a56f7e9b::function_9cad42ac02eff950(objid);
            } else {
                namespace_5a22b6f3a56f7e9b::function_a28e8535e00d34f3(objid);
            }
            namespace_5a22b6f3a56f7e9b::function_6ae37618bb04ea60(objid);
            safe.node = node;
            node.safe = safe;
            safe setscriptablepartstate("safe", "usable_not_open");
            safe.trigger = spawn("trigger_radius", safe.node.origin, 0, int(128), int(512));
            safe.trigger trigger_off();
            safe.capturetime = getdvarint(@"hash_6045836c04e4d385", 300);
            safe.var_4e29111f80d17365 = [];
            safe thread namespace_abc7ed0cde8527d4::function_474e2e9b4a997564(safe.trigger, 512);
            safe.var_ceb543956c7203e7 = &namespace_abc7ed0cde8527d4::function_9618cc73546d253d;
            safe.var_ab0e150eda2b5e13 = &function_c9ec79155b2119ba;
            break;
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a06e
// Size: 0x252
function function_c9ec79155b2119ba(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!isdefined(player.team)) {
        return;
    }
    if (!namespace_abc7ed0cde8527d4::function_9ab4d7ea05385788(player)) {
        player namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.var_355cddb773cb000d);
        return;
    }
    if (state == "usable_not_open") {
        instance setscriptablepartstate(part, "unusable");
        instance.var_b14a331ba425c286 = 0;
        instance thread namespace_abc7ed0cde8527d4::function_24765a7aabf0093e(player);
        instance namespace_abc7ed0cde8527d4::function_7f10e8e120314f4b(player, part);
        if (istrue(instance.var_b14a331ba425c286)) {
            instance.teams = [0:player.team];
            instance.trigger trigger_on();
            namespace_25b25d188ef778c4::function_1c2bd1696d29935b(player.team, "dmz_mission_safe_opening");
            namespace_5a22b6f3a56f7e9b::update_objective_state(instance.objidnum, "current");
            namespace_5a22b6f3a56f7e9b::objective_show_progress(instance.objidnum, 1);
            namespace_5a22b6f3a56f7e9b::objective_teammask_addtomask(instance.objidnum, player.team);
            instance thread function_65ccf76ea342606();
            wait(1);
            namespace_d696adde758cbe79::showdmzsplash("dmz_safe_defend_started", getteamdata(player.team, "players"), instance.node.poi);
        } else {
            instance setscriptablepartstate(part, "usable_not_open");
        }
    } else if (state == "open_usable") {
        if (instance getscriptableparthasstate("safe", "unusable")) {
            instance setscriptablepartstate("safe", "unusable");
        }
        if (!isdefined(instance.contents)) {
            lootid = namespace_38b993c4618e76cd::getlootidfromref("brloot_irradiated_gas_canister");
            instance namespace_1b7e64f50cca9321::function_d683a60016231237(lootid, 1);
            instance.var_46a3a8565ac0c17c = 4;
            instance namespace_1b7e64f50cca9321::lootcachespawncontents(undefined, 1, player, instance.contents);
            instance namespace_abc7ed0cde8527d4::function_20d58c7fb1074fc6(player.team);
        } else {
            instance namespace_1b7e64f50cca9321::lootcachespawncontents(undefined, 1, player, instance.contents);
        }
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a2c7
// Size: 0x2a3
function function_65ccf76ea342606() {
    level endon("game_ended");
    self endon("safe_unlocked");
    self.progress = 0;
    var_a81135442ee1a731 = 0;
    var_90fb369a18926018 = [];
    var_c07a32453726222f = 0;
    while (1) {
        if (isdefined(self.trigger) && !istrue(self.trigger.trigger_off)) {
            currenttime = gettime();
            if (self.nearbyplayers.size > 0) {
                var_f8527642ea162ae5 = self.progress;
                self.progress = min(self.capturetime, self.progress + level.framedurationseconds);
            } else {
                var_f8527642ea162ae5 = self.progress;
                self.progress = max(0, self.progress - level.framedurationseconds * 0.5);
            }
            progress = self.progress / self.capturetime;
            var_90fb369a18926018 = namespace_abc7ed0cde8527d4::function_75a1596e8181156(self.nearbyplayers, var_90fb369a18926018, progress);
            namespace_5a22b6f3a56f7e9b::objective_set_progress(self.objidnum, progress);
            if (self.progress >= self.capturetime) {
                foreach (team in self.teams) {
                    function_8a7a2427622e7572(team, "pmc_radiation_safe_open", 1);
                }
                namespace_abc7ed0cde8527d4::function_67abfc6a70af2ccc();
            } else if (self.nearbyplayers.size > 0 && var_c07a32453726222f + 45000 < currenttime) {
                var_c07a32453726222f = currenttime;
                var_f7d8df490bd332c3 = 2816;
                agents = namespace_bfef6903bca5845d::function_353fecd1549f5f42(self.origin, var_f7d8df490bd332c3, undefined, 3, undefined, 64, 128);
                if (isdefined(agents)) {
                    self.agents = array_combine(self.agents, agents);
                    var_a81135442ee1a731 = var_a81135442ee1a731 + agents.size;
                }
                var_da117ca38efac51b = namespace_bfef6903bca5845d::function_77acc10c4823dd8a(6, self.origin, "high", "mission", "safeReinforcements", undefined, undefined, undefined, undefined, "Helicopter", 32, 64);
                if (isdefined(var_da117ca38efac51b) && var_da117ca38efac51b.size > 0) {
                    var_7cc37d084d5e863c = 1;
                    self.agents = array_combine(self.agents, var_da117ca38efac51b);
                }
            }
        }
        waitframe();
    }
}

// Namespace pmc_missions/namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a571
// Size: 0x24a
function function_7b91bc1947716bcf() {
    /#
        level endon("<unknown string>");
        while (1) {
            value = getdvarint(@"hash_4d3888fdb854c18d", 0);
            if (value) {
                setdvar(@"hash_4d3888fdb854c18d", 0);
                function_dab637c713e2986f(level.players[0], value);
            }
            if (getdvarint(@"hash_7b8ff4311d323400", 0)) {
                setdvar(@"hash_7b8ff4311d323400", 0);
                function_a9f8fa06a358585b(level.players[0].team, "<unknown string>", 0, "<unknown string>", 0);
            }
            if (getdvarint(@"hash_20b0905187d34da1", 0)) {
                setdvar(@"hash_20b0905187d34da1", 0);
                function_a9f8fa06a358585b(level.players[0].team, "<unknown string>", 1, "<unknown string>", 0);
            }
            debugstring = getdvar(@"hash_a1eb1e43fb0a9af1", "<unknown string>");
            switch (debugstring) {
            case #"hash_654cfdcaf93b64e1":
                player = level.players[0];
                if (isdefined(level.var_632f6a89b947fd5)) {
                    fullweaponname = getcompleteweaponname(level.var_632f6a89b947fd5);
                    namespace_3bcd40a3005712ec::br_forcegivecustomweapon(player, level.var_632f6a89b947fd5, fullweaponname, level.var_632f6a89b947fd5.basename);
                }
                break;
            case #"hash_af2000093a54848e":
                if (!isdefined(level.var_cc75a90d4b9108b1)) {
                    break;
                }
                foreach (player in level.players) {
                    radio = spawnscriptable("<unknown string>", player.origin);
                    radio.origin = drop_to_ground(radio.origin);
                }
            default:
                break;
            }
            setdvar(@"hash_a1eb1e43fb0a9af1", "<unknown string>");
            wait(1);
        }
    #/
}

