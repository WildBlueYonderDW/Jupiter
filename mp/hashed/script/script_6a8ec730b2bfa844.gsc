#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\common\values.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\common\callbacks.gsc;
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
#using scripts\mp\gametypes\dead_drop.gsc;
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
#using scripts\mp\poi.gsc;
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
#using scripts\mp\ai_behavior.gsc;
#using scripts\mp\stationary_notes.gsc;
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5116
// Size: 0xac
function pmc_init() {
    scripts\common\callbacks::add("player_connect", &onconnect);
    scripts\common\callbacks::add("player_disconnect", &ondisconnect);
    level scripts\mp\utility\lui_game_event_aggregator::registeronluieventcallback(&luinotifylistener);
    level scripts\common\ui::lui_registercallback("pmc_mission_complete", &function_db6a7576652ee974);
    level scripts\common\ui::lui_registercallback("pmc_mission_tier_complete", &on_pmc_mission_tier_complete);
    namespace_c31609f90efcf2ca::registeronplayerjoinsquadcallback(&function_b944a4d927f9c28a);
    namespace_c31609f90efcf2ca::function_a99987c7bf114da4(&function_b944a4d927f9c28a);
    function_5a45eb93b9fc8909();
    level.pmcmissions.var_da66011459cb5e59 = [];
    function_44d9a690ed5b6e76();
    callback::add("squad_created", &function_6d402ea224e021c2);
    /#
        thread function_7b91bc1947716bcf();
    #/
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x51ca
// Size: 0x1b2
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5384
// Size: 0x71
function private function_c649b702f1ecf51c(partname) {
    scriptables = getentitylessscriptablearray(undefined, undefined, undefined, undefined, partname);
    if (!isdefined(scriptables)) {
        return;
    }
    foreach (scriptable in scriptables) {
        scripts\mp\gametypes\br_pickups::loothide(scriptable);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x53fd
// Size: 0x3b8
function private function_5a45eb93b9fc8909() {
    assert(isdefined(level.gamemodebundle), "<dev string:x1c>");
    assert(isdefined(level.gamemodebundle.factionmissiontable), "<dev string:x38>");
    level.var_37cbce6ebdd87f7f = getscriptbundle("factionmissiontable:" + level.gamemodebundle.factionmissiontable);
    assert(isdefined(level.var_37cbce6ebdd87f7f), "<dev string:x7d>" + level.gamemodebundle.factionmissiontable + "<dev string:x97>");
    assert(isdefined(level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30), "<dev string:xa5>" + level.gamemodebundle.factionmissiontable);
    level.pmcmissions = spawnstruct();
    level.pmcmissions.missiondata = [];
    level.pmcmissions.var_1b943b33f98bce6 = [];
    level.pmcmissions.var_a27457d7b8ab1a28 = [];
    foreach (var_555f50621039c357 in level.var_37cbce6ebdd87f7f.factionmissiontable) {
        factionmissionasset = getscriptbundle("factionmission:" + var_555f50621039c357.factionmission);
        assert(isdefined(factionmissionasset), "<dev string:xe5>" + var_555f50621039c357.factionmission + "<dev string:x97>");
        assert(isdefined(factionmissionasset.ref), "<dev string:xe5>" + var_555f50621039c357.factionmission + "<dev string:xff>");
        row = tablelookuprownum(level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30, 1, factionmissionasset.ref);
        assertex(isdefined(row) && row >= 0, "<dev string:x16f>" + factionmissionasset.ref + "<dev string:x18e>" + level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30);
        var_e070ff5172dff51b = tablelookupbyrow(level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30, row, 13);
        if (isdefined(var_e070ff5172dff51b) && var_e070ff5172dff51b != "") {
            var_d0926f46fae9c1d = strtok(var_e070ff5172dff51b, "|");
            foreach (var_96e013cf8894a365 in var_d0926f46fae9c1d) {
                tierrow = tablelookuprownum(level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30, 0, int(var_96e013cf8894a365));
                var_21355b990d4fdc67 = tablelookupbyrow(level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30, tierrow, 13);
                if (isdefined(var_21355b990d4fdc67) && var_21355b990d4fdc67 != "") {
                    var_9c66512083e1df59 = strtok(var_21355b990d4fdc67, "|");
                    foreach (challengeid in var_9c66512083e1df59) {
                        level.pmcmissions.var_a27457d7b8ab1a28[int(challengeid)] = factionmissionasset.ref;
                    }
                }
            }
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x57bd
// Size: 0x508
function private function_11adb36b4aa3e03b(missionid) {
    if (!isdefined(level.pmcmissions)) {
        assertmsg("<dev string:x196>");
        return;
    }
    if (!isdefined(level.pmcmissions.missiondata) || !isarray(level.pmcmissions.missiondata)) {
        assertmsg("<dev string:x23e>");
        return;
    }
    if (!isdefined(level.var_37cbce6ebdd87f7f)) {
        assertmsg("<dev string:x289>");
        return;
    }
    if (!isdefined(missionid)) {
        println("<dev string:x2d5>");
        return;
    }
    if (!isdefined(level.pmcmissions.missiondata[missionid])) {
        row = tablelookuprownum(level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30, 0, missionid);
        assertex(isdefined(row) && row >= 0, "<dev string:x328>" + missionid + "<dev string:x18e>" + level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30);
        ref = tablelookupbyrow(level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30, row, 1);
        amount = int(tablelookupbyrow(level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30, row, 4));
        xp = int(tablelookupbyrow(level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30, row, 6));
        lootid = int(tablelookupbyrow(level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30, row, 14));
        lootitemtype = int(tablelookupbyrow(level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30, row, 15));
        lootmethod = tablelookupbyrow(level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30, row, 16);
        filterparam = tablelookupbyrow(level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30, row, 18);
        var_62cd3d7406be8c32 = tablelookupbyrow(level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30, row, 17);
        lootids = [];
        if (lootid) {
            lootids[lootids.size] = lootid;
        }
        if (filterparam == "iw9_loot_id" && var_62cd3d7406be8c32 != "") {
            filterlist = strtok(var_62cd3d7406be8c32, "|");
            foreach (str in filterlist) {
                filterlootid = int(str);
                if (filterlootid) {
                    lootids[lootids.size] = filterlootid;
                }
            }
        }
        childrenstr = tablelookupbyrow(level.var_37cbce6ebdd87f7f.var_847dc5a98178ad30, row, 13);
        children = [];
        if (isdefined(childrenstr) && childrenstr != "") {
            childrenstr = strtok(childrenstr, "|");
            foreach (str in childrenstr) {
                children[children.size] = int(str);
            }
        }
        data = spawnstruct();
        data.ref = ref;
        data.amount = amount;
        data.xp = xp;
        data.children = children;
        data.lootids = lootids;
        data.lootmethod = lootmethod;
        data.lootitemtype = lootitemtype;
        if (isdefined(level.pmcmissions.var_a27457d7b8ab1a28[missionid])) {
            data.faction = level.pmcmissions.var_a27457d7b8ab1a28[missionid];
        }
        if (children.size) {
            foreach (childid in children) {
                var_bea76252fdb221f5 = function_11adb36b4aa3e03b(childid);
                var_bea76252fdb221f5.parent = missionid;
                var_bea76252fdb221f5.faction = data.faction;
            }
        }
        level.pmcmissions.missiondata[missionid] = data;
        level.pmcmissions.var_1b943b33f98bce6[ref] = missionid;
    }
    return level.pmcmissions.missiondata[missionid];
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5cce
// Size: 0x3c
function function_16ae6d8b5f25f31b(challengeref) {
    id = level.pmcmissions.var_1b943b33f98bce6["iw9_s4_ch_pmc_" + challengeref];
    if (!isdefined(id)) {
        id = -1;
    }
    return id;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d13
// Size: 0x197
function function_d57e0f306b88dd37() {
    spawns = getstructarray("pmc_spawn_loot", "script_noteworthy");
    foreach (lootspawn in spawns) {
        dropinfo = scripts\mp\gametypes\br_pickups::getitemdropinfo(lootspawn.origin, lootspawn.angles);
        item = scripts\mp\gametypes\br_pickups::spawnpickup(lootspawn.targetname, dropinfo, 1);
        if (isdefined(item)) {
            item.criticalitem = 1;
            continue;
        }
        assertmsg("<dev string:x346>" + lootspawn.targetname + "<dev string:x357>");
    }
    weapons = getstructarray("pmc_spawn_weapon", "script_noteworthy");
    foreach (lootspawn in weapons) {
        dropinfo = scripts\mp\gametypes\br_pickups::getitemdropinfo(lootspawn.origin, lootspawn.angles);
        item = scripts\mp\gametypes\br_pickups::spawnpickup(lootspawn.targetname, dropinfo);
        if (isdefined(item)) {
            item.criticalitem = 1;
            continue;
        }
        assertmsg("<dev string:x346>" + lootspawn.targetname + "<dev string:x357>");
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5eb2
// Size: 0x95
function function_46bfece294c56645(challengeref, itemlist, identifier) {
    id = function_16ae6d8b5f25f31b(challengeref);
    if (isdefined(itemlist)) {
        foreach (item in itemlist) {
            level.var_57726c4d54785f95[item] = id;
        }
    }
    if (isdefined(identifier)) {
        level.var_57726c4d54785f95[identifier] = id;
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x5f4f
// Size: 0x156
function function_d5394a20735bc2f1(struct, item, identifier, collectitem, modeloverride) {
    origin = default_to(struct.origin, (0, 0, 0));
    angles = default_to(struct.angles, (0, 0, 0));
    placement = spawnscriptable("dmz_place_item", origin, angles);
    placement setscriptablepartstate("dmz_place_item_use", "usable_" + item);
    placement setscriptablepartstate("dmz_place_item_model", "hidden");
    placement.item = item;
    placement.lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(placement.item);
    placement.modelstate = item;
    if (isdefined(modeloverride)) {
        placement.modelstate = modeloverride;
    }
    placement.number = 1;
    placement.identifier = identifier;
    placement.collectitem = collectitem;
    level.pmcmissions.placements[level.pmcmissions.placements.size] = placement;
    return placement;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x60ae
// Size: 0x8c
function function_5c280a977f39790e(struct) {
    placement = function_d5394a20735bc2f1(struct, struct.targetname, struct.target, struct.script_parameters, struct.script_label);
    if (isdefined(struct.target)) {
        id = function_16ae6d8b5f25f31b(struct.target);
        level.var_57726c4d54785f95[struct.target] = id;
    }
    return placement;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x6143
// Size: 0xa3
function function_5fb061ad407e6e6c(script_noteworthy, item, identifier, collectitem, modeloverride) {
    structs = getstructarray(script_noteworthy, "script_noteworthy");
    if (isdefined(structs)) {
        foreach (struct in structs) {
            placement = function_d5394a20735bc2f1(struct, item, identifier, collectitem, modeloverride);
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x61ee
// Size: 0x241
function function_2537e0b46ae9a7f1() {
    level.pmcmissions.placements = [];
    level.var_57726c4d54785f95 = [];
    function_46bfece294c56645("place_smuggling_tunnels", ["brloot_valuable_freshwater", "brloot_valuable_mre", "brloot_valuable_bandage"]);
    function_46bfece294c56645("plant_research_story", ["brloot_research_intel", "brloot_gascan"]);
    function_46bfece294c56645("mall_place", ["brloot_valuable_gunoil", "brloot_offhand_c4", "brloot_valuable_drill"]);
    function_46bfece294c56645("deliver_letter", ["brloot_drivers_note"]);
    function_46bfece294c56645("track_submarines", undefined, "track_submarine");
    function_46bfece294c56645("track_biolabs_cargo", undefined, "track_cargo_truck_biolabs");
    function_46bfece294c56645("plant_microphone", undefined, "pmc_discrete_radio");
    function_46bfece294c56645("plant_fake_docs", ["brloot_fake_aq_intel"]);
    function_46bfece294c56645("extract_plant_intel", ["brloot_biolab_usb"]);
    function_46bfece294c56645("redacted_3_excavation", undefined, "track_biobunker_entrance");
    function_46bfece294c56645("ir_beacon_story", ["brloot_ir_beacon"]);
    spawns = getstructarray("pmc_place_loot", "script_noteworthy");
    foreach (spawn in spawns) {
        placement = function_5c280a977f39790e(spawn);
        if (placement.item == "brloot_tracking_device" && scripts\cp_mp\utility\game_utility::function_ffbbb4525b11d5a2()) {
            placement.identifier = "track_cargo_truck_biolabs";
        }
    }
    function_5fb061ad407e6e6c("pmc_submarine_tracker", "brloot_tracking_device", "track_submarine", "plant_submarine_tracker");
    function_5fb061ad407e6e6c("pmc_discrete_radio", "brloot_discrete_radio", "pmc_discrete_radio");
    function_5fb061ad407e6e6c("pmc_fake_aq_docs_place", "brloot_fake_aq_intel");
    function_5fb061ad407e6e6c("pmc_intel_exchange_usb", "brloot_biolab_usb");
    function_5fb061ad407e6e6c("track_biobunker_entrace", "brloot_tracking_device", "track_biobunker_entrance", "plant_biobunker_entrance", "parts_pouch_comms_cellular_jammer");
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x6437
// Size: 0x273
function function_c335cf2377039ba5(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (!isdefined(player) || !isdefined(player.team)) {
        return;
    }
    hasitem = istrue(player namespace_aead94004cf4c147::function_6f39f9916649ac48(instance.lootid, 1));
    if (!hasitem) {
        curr = player scripts\mp\equipment::getcurrentequipment("primary");
        equipammo = player scripts\mp\equipment::getequipmentslotammo("primary");
        if (isdefined(curr) && curr != "" && isdefined(equipammo) && equipammo) {
            lootid = namespace_38b993c4618e76cd::getlootidfromref(curr);
            if (lootid == instance.lootid) {
                player scripts\mp\equipment::takeequipment("primary");
                hasitem = 1;
            }
        }
    }
    if (hasitem) {
        teammates = teams::getteamdata(player.team, "players");
        foreach (teammate in teammates) {
            instance disablescriptableplayeruse(teammate);
        }
        state = instance getscriptablepartstate("dmz_place_item_model");
        if (state == "hidden") {
            instance setscriptablepartstate("dmz_place_item_model", instance.modelstate);
        }
        method = scripts\cp_mp\challenges::function_6d40f12a09494350(0, ae_utility::function_e2ff8f4b4e94f723(#"hash_2af1f13aa6ae3b5f", #"place"));
        scripts\cp_mp\challenges::function_d24138b32084fc3e(player, instance.lootid, undefined, method, 1);
        var_4e55fc12323ff73e = function_16ae6d8b5f25f31b("microphone_story");
        if (function_c5e0bac8f123cc88(player.team, var_4e55fc12323ff73e)) {
            if (isdefined(instance.identifier) && instance.identifier == "microphone_story") {
                teams::setteamdata(player.team, "placed_microphone", 1);
            }
        }
        if (isdefined(instance.collectitem)) {
            function_8359cadd253f9604(player, instance.collectitem, 1);
        }
        return;
    }
    player scripts\mp\hud_message::showerrormessage("PMC_S2/PLACE_ERR_MSG");
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x66b2
// Size: 0x33e
function function_fabd5665eee8cc3a() {
    if (!scripts\mp\flags::gameflag("prematch_done")) {
        level scripts\mp\flags::gameflagwait("prematch_done");
    }
    var_529ed52251ca4317 = [];
    foreach (player in level.players) {
        foreach (placement in level.pmcmissions.placements) {
            placement disablescriptableplayeruse(player);
        }
        if (isdefined(player.team) && getteamdata(player.team, "players").size == 1) {
            function_8359cadd253f9604(player, "solo_infil_exfil", 1);
            weapons = namespace_aead94004cf4c147::getinventoryweapons(player);
            if (isdefined(weapons)) {
                hasweapon = 0;
                foreach (weapon in weapons) {
                    if (!scripts\mp\utility\weapon::isfistsonly(weapon) && !scripts\mp\utility\weapon::isgunlessweapon(weapon)) {
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
                    foreach (placement in level.pmcmissions.placements) {
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x69f8
// Size: 0x124
function function_e634010f11d249eb(player) {
    for (missionindex = 0; missionindex < 1; missionindex++) {
        id = function_47f721114fed37e7(player, missionindex);
        if (id > 0 && isdefined(level.pmcmissions.missiondata[id])) {
            ref = level.pmcmissions.missiondata[id].ref;
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
                namespace_446fc987a980892f::playevent(vo, [player]);
            }
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6b24
// Size: 0x24
function function_b0ca76f04ad0e0c3(player) {
    if (namespace_a38a2e1fe7519183::function_4b57e9867785e738(player)) {
        function_8359cadd253f9604(player, "exfil_with_custom_weapon", 1);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b50
// Size: 0xc0
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6c18
// Size: 0x109
function function_6d402ea224e021c2(sparams) {
    if (isdefined(level.squaddata) && isdefined(sparams) && isdefined(sparams.team) && isdefined(sparams.index)) {
        level.squaddata[sparams.team][sparams.index].properties["poisVisited"] = [];
        level.squaddata[sparams.team][sparams.index].properties["vehiclesEntered"] = [];
        level.squaddata[sparams.team][sparams.index].properties["gpsPoisVisited"] = [];
        level.squaddata[sparams.team][sparams.index].properties["poisVisitedACV"] = [];
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6d29
// Size: 0x30
function function_cff2f4f168b29b81() {
    if (!isdefined(level.var_b2729f28a675be79)) {
        level.var_b2729f28a675be79 = getdvarint(@"hash_5a8c71e376f35349", 0);
    }
    return level.var_b2729f28a675be79;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6d62
// Size: 0x6e
function function_545dc7a8e9dc2b05() {
    if (!isdefined(level.var_25fd54c3e76497cc)) {
        assert(isdefined(level.gamemodebundle), "<dev string:x1c>");
        assert(isdefined(level.gamemodebundle.var_25fd54c3e76497cc), "<dev string:x377>");
        level.var_25fd54c3e76497cc = level.gamemodebundle.var_25fd54c3e76497cc;
    }
    return level.var_25fd54c3e76497cc;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6dd9
// Size: 0x48
function function_47f721114fed37e7(player, missionindex) {
    if (!isdefined(player)) {
        println("<dev string:x3c2>");
        return 0;
    }
    return player getplayerdata(level.loadoutdata, "squadMembers", function_545dc7a8e9dc2b05(), missionindex, "challengeID");
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6e2a
// Size: 0x51
function function_7159ceb842152778(player, missionindex, childindex) {
    if (!isdefined(player)) {
        println("<dev string:x41f>");
        return 0;
    }
    return player getplayerdata(level.loadoutdata, "squadMembers", function_545dc7a8e9dc2b05(), missionindex, "challengeProgress", childindex);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6e84
// Size: 0x3e
function function_31b54d12c6b13a7c(player) {
    challenges = [];
    for (missionindex = 0; missionindex < 1; missionindex++) {
        challenges[challenges.size] = function_47f721114fed37e7(player, missionindex);
    }
    return challenges;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6ecb
// Size: 0x98
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6f6c
// Size: 0x106
function function_c7d3c1cb4a3958cf(player, challengeid) {
    if (!function_cff2f4f168b29b81()) {
        println("<dev string:x471>");
        return false;
    }
    if (!isdefined(challengeid)) {
        assertmsg("<dev string:x4fc>");
        return false;
    }
    for (missionindex = 0; missionindex < 1; missionindex++) {
        challenge = function_850c980cd2929d25(player, missionindex);
        if (isdefined(challenge) && challenge > 0 && challenge == challengeid) {
            return true;
        }
        if (isdefined(challenge) && challenge > 0) {
            challengedata = function_11adb36b4aa3e03b(challenge);
            if (isdefined(challengedata) && isarray(challengedata.children)) {
                for (childindex = 0; childindex < challengedata.children.size; childindex++) {
                    child = challengedata.children[childindex];
                    if (isdefined(child) && child == challengeid) {
                        return true;
                    }
                }
            }
        }
    }
    return false;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x707b
// Size: 0x136
function function_62b41959b3c5a9ca(player, challengeid) {
    if (!function_cff2f4f168b29b81()) {
        println("<dev string:x519>");
        return false;
    }
    if (!isdefined(challengeid)) {
        println("<dev string:x5ae>");
        return false;
    }
    for (missionindex = 0; missionindex < 1; missionindex++) {
        challenge = function_850c980cd2929d25(player, missionindex);
        if (!isdefined(challenge) || challenge <= 0) {
            continue;
        }
        parentdata = function_11adb36b4aa3e03b(challenge);
        if (isdefined(parentdata)) {
            if (isdefined(parentdata.children)) {
                for (childindex = 0; childindex < parentdata.children.size; childindex++) {
                    child = parentdata.children[childindex];
                    if (isdefined(child) && child == challengeid) {
                        childdata = function_11adb36b4aa3e03b(child);
                        progress = function_7159ceb842152778(player, missionindex, childindex);
                        if (isdefined(progress) && isdefined(childdata.amount)) {
                            return (progress >= childdata.amount);
                        }
                    }
                }
            }
        }
    }
    return false;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x71ba
// Size: 0x11b
function function_ff53d8b600dbc74(player, challengeid) {
    if (!function_cff2f4f168b29b81()) {
        println("<dev string:x613>");
        return undefined;
    }
    if (!isdefined(challengeid)) {
        println("<dev string:x6a8>");
        return undefined;
    }
    for (missionindex = 0; missionindex < 1; missionindex++) {
        challenge = function_850c980cd2929d25(player, missionindex);
        if (!isdefined(challenge) || challenge <= 0) {
            continue;
        }
        parentdata = function_11adb36b4aa3e03b(challenge);
        if (isdefined(parentdata)) {
            if (isdefined(parentdata.children)) {
                for (childindex = 0; childindex < parentdata.children.size; childindex++) {
                    child = parentdata.children[childindex];
                    if (isdefined(child) && child == challengeid) {
                        childdata = function_11adb36b4aa3e03b(child);
                        return [function_7159ceb842152778(player, missionindex, childindex), childdata.amount];
                    }
                }
            }
        }
    }
    return undefined;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x72de
// Size: 0x91
function function_c5e0bac8f123cc88(team, challengeid) {
    if (getdvarint(@"hash_ae46d31a716a05e8", 0)) {
        return true;
    }
    players = getteamdata(team, "players");
    foreach (player in players) {
        if (function_c7d3c1cb4a3958cf(player, challengeid)) {
            return true;
        }
    }
    return false;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7378
// Size: 0x9a
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x741b
// Size: 0xab
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x74ce
// Size: 0x5b
function function_ef63cdebaaff3440() {
    foreach (player in level.players) {
        if (isdefined(player)) {
            self disablescriptableplayeruse(player);
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7531
// Size: 0xd8
function createprogressbar(icon, offset, team) {
    offset = default_to(offset, (0, 0, 0));
    self.curorigin = self.origin;
    self.offset3d = offset;
    scripts\mp\gameobjects::requestid(1, 1, undefined, 1);
    objidnum = self.objidnum;
    if (isdefined(icon)) {
        objective_icon(objidnum, icon);
    }
    objective_position(objidnum, self.origin + offset);
    if (isdefined(team)) {
        scripts\mp\objidpoolmanager::objective_teammask_single(objidnum, team);
    } else {
        objective_addalltomask(objidnum);
        objective_hidefromplayersinmask(objidnum);
    }
    function_9427cb5974c925d9(objidnum, 1);
    scripts\mp\objidpoolmanager::objective_pin_global(objidnum, 1);
    scripts\mp\objidpoolmanager::update_objective_setbackground(objidnum, 4);
    function_a13e72e0427ecad2(objidnum, function_58fb674a1dd27075());
    return objidnum;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x7612
// Size: 0x55
function function_280edf3f47535ae9(name, key, type, var_1fbc3549649926b6) {
    trigger = function_f159c10d5cf8f0b4(name, key);
    if (!isdefined(trigger) || trigger.size == 0) {
        return;
    }
    trigger = trigger[0];
    thread watchplayertrigger(trigger, type, var_1fbc3549649926b6);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x766f
// Size: 0x83
function function_89a7111bd154e223(name, key, var_bb7537f2ccd47382, var_1fbc3549649926b6) {
    struct = getstruct(name, key);
    if (!isdefined(struct)) {
        return;
    }
    trigger = spawn("noent_volume_trigger_radius", struct.origin, 0, struct.radius, int(struct.target));
    thread watchplayertrigger(trigger, var_bb7537f2ccd47382, var_1fbc3549649926b6);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x76fa
// Size: 0xcd
function watchplayertrigger(trigger, type, var_1fbc3549649926b6) {
    while (true) {
        trigger waittill("trigger", ent);
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x77cf
// Size: 0x219
function function_a0af645242dc7260(player, lootid, loottype) {
    missions = function_31b54d12c6b13a7c(player);
    foreach (mission in missions) {
        if (mission <= 0 || !isdefined(level.pmcmissions.missiondata[mission])) {
            continue;
        }
        missiondata = function_11adb36b4aa3e03b(mission);
        lootitemtype = missiondata.lootitemtype;
        if (lootitemtype && isdefined(loottype) && lootitemtype == loottype) {
            return mission;
        }
        foreach (id in missiondata.lootids) {
            if (isdefined(id) && id != 0) {
                if (id == lootid) {
                    return mission;
                }
            }
        }
        foreach (child in missiondata.children) {
            var_bea76252fdb221f5 = function_11adb36b4aa3e03b(child);
            lootitemtype = var_bea76252fdb221f5.lootitemtype;
            if (lootitemtype && isdefined(loottype) && lootitemtype == loottype) {
                return child;
            }
            foreach (id in var_bea76252fdb221f5.lootids) {
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x79f1
// Size: 0x57
function function_6c11b28b956bf6ad(mapid) {
    if (!isdefined(mapid)) {
        mapid = 1;
    }
    if (mapid & 1) {
        return scripts\cp_mp\utility\game_utility::function_7ee65fae13124702();
    } else if (mapid & 2) {
        return scripts\cp_mp\utility\game_utility::function_e21746abaaaf8414();
    } else if (mapid & 4) {
        return scripts\cp_mp\utility\game_utility::function_ffbbb4525b11d5a2();
    } else if (mapid & 8) {
        return scripts\cp_mp\utility\game_utility::function_5e0e3a24dbb1fae1();
    }
    return 1;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x7a51
// Size: 0x14d
function function_315e9c3a5fb405e5(missionid, containerposition, lootid, quantity, mapid) {
    if (!function_6c11b28b956bf6ad(mapid)) {
        return;
    }
    if (!scripts\mp\flags::gameflag("prematch_done")) {
        level scripts\mp\flags::gameflagwait("prematch_done");
    }
    scripts\engine\utility::flag_wait("dead_drops_init");
    if (!isdefined(level.deaddrops)) {
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
    container = sortbydistance(level.deaddrops, containerposition)[0];
    namespace_92fc655e328c1a9f::function_6207d6f728cee51d(var_694cf27a7080216, container, lootid, quantity, undefined, 1);
    level thread function_955e6c9750ee6b5e(var_694cf27a7080216, container);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x7ba6
// Size: 0x16a
function function_3079d4d1c0ee380e(missionid, containerposition, weaponobj, mapid) {
    if (!function_6c11b28b956bf6ad(mapid)) {
        return;
    }
    if (!scripts\mp\flags::gameflag("prematch_done")) {
        level scripts\mp\flags::gameflagwait("prematch_done");
    }
    scripts\engine\utility::flag_wait("dead_drops_init");
    if (!isdefined(level.deaddrops)) {
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
    container = sortbydistance(level.deaddrops, containerposition)[0];
    lootid = namespace_e0ee43ef2dddadaa::getweaponlootid(weaponobj);
    ammo = weaponclipsize(weaponobj);
    namespace_92fc655e328c1a9f::function_6207d6f728cee51d(var_694cf27a7080216, container, lootid, ammo, weaponobj, 1);
    level thread function_955e6c9750ee6b5e(var_694cf27a7080216, container);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7d18
// Size: 0x124
function function_955e6c9750ee6b5e(var_694cf27a7080216, container) {
    if (!isdefined(container) || !isdefined(var_694cf27a7080216)) {
        return;
    }
    container notify("dead_drop_nag");
    container endon("dead_drop_nag");
    container endon("death");
    level endon("game_ended");
    while (true) {
        teamsnotified = [];
        foreach (player in var_694cf27a7080216) {
            if (isdefined(player) && !isbot(player) && scripts\mp\utility\player::isreallyalive(player) && isdefined(player.team) && !array_contains(teamsnotified, player.team) && distance2d(player.origin, container.origin) < 2000) {
                namespace_446fc987a980892f::function_9793a81bc3bc19e9("player_item_dead_drop_retrieve", player.team);
                teamsnotified[teamsnotified.size] = player.team;
            }
        }
        wait 5;
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7e44
// Size: 0x525
function function_b944a4d927f9c28a(player, incomingid) {
    if (!isdefined(incomingid)) {
        incomingid = 0;
    }
    if (!isplayer(player)) {
        return;
    }
    player.var_1f4ccc0c71eba297 = incomingid;
    players = [];
    if (issharedfuncdefined("squad_utility", "getSquadMembers")) {
        players = player [[ getsharedfunc("squad_utility", "getSquadMembers") ]]();
    } else {
        players[0] = player;
    }
    activechallenges = [];
    var_a0f0fc2f7ff8f287 = [];
    clientnums = [];
    foreach (teamplayer in players) {
        for (missionindex = 0; missionindex < 1; missionindex++) {
            memberindex = teamplayer.var_3f78c6a0862f9e25;
            if (!isdefined(activechallenges[memberindex])) {
                activechallenges[memberindex] = [];
                var_a0f0fc2f7ff8f287[memberindex] = [];
            }
            clientnums[memberindex] = teamplayer getentitynumber();
            assert(activechallenges[memberindex].size == var_a0f0fc2f7ff8f287[memberindex].size);
            size = activechallenges[memberindex].size;
            id = function_47f721114fed37e7(teamplayer, missionindex);
            activechallenges[memberindex][size] = id;
            var_a0f0fc2f7ff8f287[memberindex][size] = [];
            for (childindex = 0; childindex < 4; childindex++) {
                var_a0f0fc2f7ff8f287[memberindex][size][childindex] = function_7159ceb842152778(teamplayer, missionindex, childindex);
            }
            if (id > 0) {
                if (isdefined(level.pmcmissions.missiondata[id])) {
                    if (level.pmcmissions.missiondata[id].children.size > 0) {
                        allcompleted = 1;
                        for (child = 0; child < 4; child++) {
                            childid = level.pmcmissions.missiondata[id].children[child];
                            if (isdefined(childid) && childid > 0) {
                                progress = var_a0f0fc2f7ff8f287[memberindex][size][child];
                                amount = level.pmcmissions.missiondata[childid].amount;
                                childref = level.pmcmissions.missiondata[childid].ref;
                                if (progress != amount) {
                                    allcompleted = 0;
                                    continue;
                                }
                                if (id != 0 && incomingid != 0) {
                                    params = spawnstruct();
                                    params.player = player;
                                    params.stepid = childid;
                                    params.stepref = childref;
                                    params.parentid = id;
                                    params.parentref = level.pmcmissions.missiondata[id].ref;
                                    callback::callback("on_pmc_mission_step_complete", params);
                                }
                                function_1a3bd4602e62e661(teamplayer, players, childref);
                            }
                        }
                        if (istrue(allcompleted)) {
                            function_b2d5fe14937fa854(teamplayer, id);
                        }
                        continue;
                    }
                    progress = var_a0f0fc2f7ff8f287[memberindex][size][0];
                    amount = level.pmcmissions.missiondata[id].amount;
                    if (progress == amount) {
                        function_b2d5fe14937fa854(teamplayer, id);
                    }
                }
            }
        }
    }
    foreach (teamplayer in players) {
        for (memberindex = 0; memberindex < players.size; memberindex++) {
            challengeindex = 0;
            if (isdefined(clientnums[memberindex])) {
                teamplayer setplayerdata(level.var_5d69837cf4db0407, "squadPMCMissionGroups", memberindex, "clientNum", clientnums[memberindex]);
            }
            if (isdefined(activechallenges[memberindex]) && isdefined(var_a0f0fc2f7ff8f287[memberindex])) {
                for (challengeindex = 0; challengeindex < min(activechallenges[memberindex].size, 1); challengeindex++) {
                    teamplayer setplayerdata(level.var_5d69837cf4db0407, "squadPMCMissionGroups", memberindex, "missions", challengeindex, "challengeID", activechallenges[memberindex][challengeindex]);
                    for (childindex = 0; childindex < 4; childindex++) {
                        teamplayer setplayerdata(level.var_5d69837cf4db0407, "squadPMCMissionGroups", memberindex, "missions", challengeindex, "challengeProgress", childindex, var_a0f0fc2f7ff8f287[memberindex][challengeindex][childindex]);
                    }
                }
            }
            while (challengeindex < 1) {
                teamplayer setplayerdata(level.var_5d69837cf4db0407, "squadPMCMissionGroups", memberindex, "missions", challengeindex, "challengeID", 0);
                for (childindex = 0; childindex < 4; childindex++) {
                    teamplayer setplayerdata(level.var_5d69837cf4db0407, "squadPMCMissionGroups", memberindex, "missions", challengeindex, "challengeProgress", childindex, 0);
                }
                challengeindex++;
            }
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8371
// Size: 0xd0
function function_b2d5fe14937fa854(player, id) {
    if (isdefined(player.guid) && isdefined(level.pmcmissions.var_da66011459cb5e59)) {
        if (!isdefined(level.pmcmissions.var_da66011459cb5e59[player.guid])) {
            level.pmcmissions.var_da66011459cb5e59[player.guid] = [];
        }
        if (!isdefined(level.pmcmissions.var_da66011459cb5e59[player.guid][id])) {
            level.pmcmissions.var_da66011459cb5e59[player.guid][id] = 1;
            function_dab637c713e2986f(player, id);
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8449
// Size: 0x38
function luinotifylistener(notification, value) {
    if (isdefined(notification)) {
        switch (notification) {
        case #"hash_c263e227327caf17":
            function_b944a4d927f9c28a(self);
            break;
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8489
// Size: 0x19
function function_728323a4ebcaa0cb(value) {
    if (isdefined(value)) {
        function_b944a4d927f9c28a(self, value);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x84aa
// Size: 0x19
function function_db6a7576652ee974(value) {
    if (isdefined(value)) {
        function_b2d5fe14937fa854(self, value);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x84cb
// Size: 0x77
function on_pmc_mission_tier_complete(value) {
    if (isdefined(value) && value > 0) {
        missiondata = function_11adb36b4aa3e03b(value);
        params = spawnstruct();
        params.player = self;
        params.id = value;
        params.ref = missiondata.ref;
        callback::callback("on_pmc_mission_tier_complete", params);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x854a
// Size: 0x1c
function function_6f6cc16c0528de5b(player) {
    return player scripts\cp_mp\challenges::challengesenabledforplayer() && function_cff2f4f168b29b81();
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x856f
// Size: 0x12f
function function_1120295a2cd880f4(player, missionXP) {
    if (!isplayer(player)) {
        return;
    }
    players = [];
    if (issharedfuncdefined("squad_utility", "getSquadMembers")) {
        players = player [[ getsharedfunc("squad_utility", "getSquadMembers") ]]();
    }
    foreach (teamplayer in players) {
        if (teamplayer != player) {
            teamplayer scripts\mp\utility\points::doScoreEvent(#"hash_5a2c275279403f5", undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
        } else {
            if (!isdefined(teamplayer.pers["missionXP"])) {
                teamplayer.pers["missionXP"] = 0;
            }
            teamplayer.pers["missionXP"] = teamplayer.pers["missionXP"] + missionXP;
        }
        if (!isdefined(teamplayer.var_56a4e98c643a1e2d)) {
            teamplayer.var_56a4e98c643a1e2d = 0;
        }
        teamplayer.var_56a4e98c643a1e2d++;
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x86a6
// Size: 0x325
function function_1a3bd4602e62e661(player, players, ref) {
    foreach (teamplayer in players) {
        if (!isarray(teamplayer.var_d0ffe5aa652992e9)) {
            teamplayer.var_d0ffe5aa652992e9 = [];
        }
        teamplayer.var_d0ffe5aa652992e9[ref] = 1;
    }
    if (!scripts\mp\flags::gameflag("prematch_done") || !isdefined(player.team)) {
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x89d3
// Size: 0x421
function function_dab637c713e2986f(player, id) {
    missiondata = function_11adb36b4aa3e03b(id);
    ref = missiondata.ref;
    xp = missiondata.xp;
    if (!scripts\mp\flags::gameflag("prematch_done") || !isdefined(player.team)) {
        return;
    }
    function_1120295a2cd880f4(player, xp);
    squadmates = undefined;
    if (issharedfuncdefined("squad_utility", "getSquadMembers")) {
        squadmates = player [[ getsharedfunc("squad_utility", "getSquadMembers") ]]();
    }
    if (isdefined(squadmates)) {
        foreach (squadmate in squadmates) {
            if (squadmate != player) {
                function_8359cadd253f9604(squadmate, "squadmate_mission_complete", 1);
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8dfc
// Size: 0x1c
function function_41d63c1ace07fa21() {
    wait 3;
    if (isdefined(self.var_c2cb671fe02fa346)) {
        self.var_c2cb671fe02fa346 = undefined;
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8e20
// Size: 0x197
function function_5ddb9007ee69fe54(player, lootid, loottype) {
    if (!isdefined(lootid)) {
        return 0;
    }
    mission = function_a0af645242dc7260(player, lootid, loottype);
    var_d720b003c55c1f6c = 0;
    if (mission) {
        missiondata = function_11adb36b4aa3e03b(mission);
        faction = missiondata.faction;
        method = missiondata.lootmethod;
        assert(isdefined(faction) && faction != "<dev string:x70d>");
        if (isdefined(faction)) {
            switch (method) {
            case #"hash_14cdf88779fee5fe":
            case #"hash_f2046c241db20c4f":
                namespace_446fc987a980892f::playevent("faction_" + faction + "_item_exfil_nag", [player]);
                var_d720b003c55c1f6c = 1;
                break;
            case #"hash_f354dcd79eb93325":
                namespace_446fc987a980892f::playevent("faction_" + faction + "_item_dead_drop_nag", [player]);
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8fc0
// Size: 0xc9
function function_7bb64b8f4eea0443(player, lootid) {
    var_5d10fd4182b17097 = namespace_38b993c4618e76cd::getlootidfromref("brloot_valuable_drill");
    var_c6d0df64279e57b9 = namespace_38b993c4618e76cd::getlootidfromref("brloot_gascan");
    skullid = namespace_38b993c4618e76cd::getlootidfromref("brloot_valuable_gold_skull");
    if (lootid == var_5d10fd4182b17097 || lootid == var_c6d0df64279e57b9 || lootid == skullid) {
        waitframe();
        if (isdefined(player)) {
            var_977a87cbf1bc6d6 = player namespace_aead94004cf4c147::function_93f02514431a1f5d(var_5d10fd4182b17097);
            var_42e59ad4d758c878 = player namespace_aead94004cf4c147::function_93f02514431a1f5d(var_c6d0df64279e57b9);
            var_5a0f6a793669372a = player namespace_aead94004cf4c147::function_93f02514431a1f5d(skullid);
            if (var_977a87cbf1bc6d6 && var_42e59ad4d758c878 && var_5a0f6a793669372a) {
                function_8359cadd253f9604(player, "get_backpack_trade_items", 1);
            }
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x9091
// Size: 0xf0
function onPickupWeapon(player, weapon, metadata) {
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
        if (isdefined(level.trappercrossbow) && issameweapon(weapon, level.trappercrossbow)) {
            function_8359cadd253f9604(player, "loot_trapper_crossbow", 1);
        }
        if (isdefined(metadata)) {
            namespace_8361bad7391de074::function_cc6a02d4564d9f07(player, metadata);
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9189
// Size: 0x3c
function function_c2bc51039a2df634(player) {
    operatorIndex = namespace_a38a2e1fe7519183::function_ddd16c8b86863b56(player);
    if (isdefined(operatorIndex) && operatorIndex <= 2) {
        scripts\cp_mp\challenges::function_8359cadd253f9604(player, "operator_slot_full_" + operatorIndex, 1);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x91cd
// Size: 0x411
function onexfil(player, inventory, backpackinventory, clipammo, cash, var_3064fa24dbbd5bbf) {
    if (!function_6f6cc16c0528de5b(player)) {
        return;
    }
    if (scripts\cp_mp\utility\game_utility::function_ffbbb4525b11d5a2()) {
        function_4249ec519aa97cd(player, inventory, backpackinventory, clipammo, cash, var_3064fa24dbbd5bbf);
        if (istrue(player.var_859654e0445a36d9)) {
            function_8359cadd253f9604(player, "pmc_biolabs_hostage_exfil", 1);
        }
    }
    numdogtags = 0;
    foreach (item in backpackinventory) {
        function_f3bb4f4911a1beb2(item.lootid, "extracted", player, item);
        if (namespace_85cd45b4fe0d86fb::function_3c17a26ce6a4668(item.lootid)) {
            numdogtags++;
        }
    }
    backpacksize = namespace_aead94004cf4c147::getPlayerBackpackSize(player);
    if (numdogtags >= backpacksize) {
        function_8359cadd253f9604(player, "full_backpack_dogtag_extract", 1);
    }
    method = 0;
    method = scripts\cp_mp\challenges::function_6d40f12a09494350(method, function_e2ff8f4b4e94f723(#"hash_2af1f13aa6ae3b5f", #"exfil"));
    if (istrue(var_3064fa24dbbd5bbf.finalexfil)) {
        method = scripts\cp_mp\challenges::function_6d40f12a09494350(method, function_e2ff8f4b4e94f723(#"hash_2af1f13aa6ae3b5f", #"final_exfil"));
        function_8359cadd253f9604(player, "extracted_final", 1);
    }
    if (var_3064fa24dbbd5bbf.players.size >= 2) {
        if (istrue(var_3064fa24dbbd5bbf.personalexfil)) {
            function_8359cadd253f9604(player, "personal_exfil_with_other_player", 1);
        }
        function_8359cadd253f9604(player, "exfil_with_other_players", var_3064fa24dbbd5bbf.players.size);
    }
    if (istrue(var_3064fa24dbbd5bbf.drivableexfil)) {
        function_8359cadd253f9604(player, "drivable_exfil", 1);
    }
    items = array_combine(inventory, backpackinventory, clipammo);
    function_baeceec743d9a737(player, items, cash, method, 1);
    if (isdefined(level.var_e250c5815c2e42f3) && array_contains(level.var_e250c5815c2e42f3, player.team)) {
        function_8359cadd253f9604(player, "plane_black_box_extract", 1);
    }
    function_8359cadd253f9604(player, "extracted", 1);
    if (isdefined(player.guid) && (!isdefined(level.var_36635e1fd288ea27) || !isdefined(level.var_36635e1fd288ea27[player.guid]))) {
        function_8359cadd253f9604(player, "exfil_no_weapons", 1);
    }
    var_4c4ca0f1f252f57b = namespace_aead94004cf4c147::getPlayerBackpackSize(player);
    currentbackpack = namespace_aead94004cf4c147::function_102abd6883c5f9bf(player);
    var_7704a6a835ad2e44 = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("brloot_backpack_scav");
    if (var_4c4ca0f1f252f57b > 5 && currentbackpack != var_7704a6a835ad2e44) {
        var_4c4ca0f1f252f57b++;
    }
    if (backpackinventory.size == var_4c4ca0f1f252f57b) {
        function_8359cadd253f9604(player, "full_backpack_extract", 1);
    }
    if (istrue(var_3064fa24dbbd5bbf.hostageexfil)) {
        function_8359cadd253f9604(player, "hostage_heli_exfil", 1);
    }
    if (istrue(player.var_d139ca6041259b28)) {
        function_8359cadd253f9604(player, "extract_heli_blackbox", 1);
    }
    operatorfull = namespace_aead94004cf4c147::getPlayerBackpackSize(player) >= 9 && is_equal(player.var_bed158a6dfac230d, 3) && is_equal(player.gasmasktype, "brloot_equip_gasmask_durable") && player scripts\mp\gametypes\br_public::hasselfrevivetoken() && isdefined(scripts\mp\killstreaks\killstreaks::getkillstreakinslot(1));
    if (operatorfull && backpackinventory.size >= 10 && namespace_aead94004cf4c147::getinventoryweapons(player).size >= 2 && isdefined(player.equipment) && player.equipment.size >= 4) {
        function_8359cadd253f9604(player, "full_backpack_loadout_extract", 1);
    }
    if (operatorfull) {
        function_c2bc51039a2df634(player);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x95e6
// Size: 0x8e
function function_4249ec519aa97cd(player, inventory, backpackinventory, clipammo, cash, var_3064fa24dbbd5bbf) {
    if (isdefined(level.var_a7b62649c81b481a) && isdefined(level.var_a7b62649c81b481a.var_acc161de36707de2)) {
        lpconlevel = level.var_a7b62649c81b481a.var_acc161de36707de2;
        if (lpconlevel == 5) {
            function_8359cadd253f9604(player, "lpcon_echo_extract", 1);
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x967c
// Size: 0xbb
function function_b0537ee3a491b4dd(player, contents, cash) {
    method = 0;
    method = scripts\cp_mp\challenges::function_6d40f12a09494350(0, function_e2ff8f4b4e94f723(#"hash_2af1f13aa6ae3b5f", #"extract_balloon"));
    method = scripts\cp_mp\challenges::function_6d40f12a09494350(0, function_e2ff8f4b4e94f723(#"hash_2af1f13aa6ae3b5f", #"extract"));
    totalcashvalue = function_baeceec743d9a737(player, contents, cash, method, 0);
    if (!isdefined(player.var_e7faf08f327b0fb5)) {
        player.var_e7faf08f327b0fb5 = 0;
    }
    player.var_e7faf08f327b0fb5 += scripts\mp\gametypes\dead_drop::function_160a29300ce1e14(totalcashvalue, player);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x973f
// Size: 0x490
function function_baeceec743d9a737(player, items, cash, method, isexfil) {
    if (!function_6f6cc16c0528de5b(player)) {
        return;
    }
    uniquegrenades = [];
    var_2a1283e22f4e4aa8 = 0;
    method = scripts\cp_mp\challenges::function_6d40f12a09494350(method, function_e2ff8f4b4e94f723(#"hash_2af1f13aa6ae3b5f", #"extract"));
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
        if (isdefined(item.pastteam) && isdefined(player.team) && item.pastteam != player.team) {
            source = scripts\cp_mp\challenges::function_6d40f12a09494350(source, function_e2ff8f4b4e94f723(#"loot_source", #"enemy_player"));
        }
        lootid = item.lootid;
        if (isdefined(item.objweapon)) {
            baseweaponlootid = scripts\mp\weapons::function_7a91162092cc11ec(lootid);
            if (isdefined(baseweaponlootid)) {
                lootid = baseweaponlootid;
            }
        }
        scripts\cp_mp\challenges::function_d24138b32084fc3e(player, lootid, undefined, method, quantity, source);
        if (isdefined(itemtype) && (itemtype == #"lethal" || itemtype == #"tactical")) {
            if (!isdefined(uniquegrenades[ref])) {
                function_8359cadd253f9604(player, "unique_grenade_extract", quantity);
                uniquegrenades[ref] = 1;
            }
        }
        if (isdefined(item.objweapon) && isdefined(item.metadata)) {
            weaponowner = namespace_a38a2e1fe7519183::function_36275388f9093535(item.metadata);
            if (isdefined(weaponowner) && weaponowner.team != player.team) {
                function_8359cadd253f9604(weaponowner, "player_extracted_your_insured_weapon", 1);
            }
        }
        fixedweaponclass = scripts\cp_mp\challenges::function_ce112254f7cba89e(item.objweapon);
        if (isdefined(fixedweaponclass) && fixedweaponclass != 0) {
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
    scripts\cp_mp\challenges::function_d24138b32084fc3e(player, 8395, undefined, method, cash);
    totalcashvalue = player.plundercount;
    if (!namespace_aead94004cf4c147::function_c4f1bd7a01a307fa(player)) {
        totalcashvalue = player.plundercount + player namespace_512200f0f9e6ebc9::function_e2f4f470c55123b8(items);
    } else {
        totalcashvalue += namespace_a8b2b88699fc40fb::function_baf5e17d7033a223(player);
    }
    if (istrue(isexfil)) {
        player.totalcashvalue = totalcashvalue;
    }
    player dlog_recordplayerevent("dlog_event_dmz_exfil_cash", ["cash_amount", totalcashvalue]);
    if (totalcashvalue >= 20000) {
        function_8359cadd253f9604(player, "big_cash_extract", 1);
    }
    return totalcashvalue;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9bd8
// Size: 0x2d
function function_68d841f5bc2dd2b6(player, cache) {
    if (!function_6f6cc16c0528de5b(player)) {
        return;
    }
    function_8359cadd253f9604(player, "loot_cache", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x9c0d
// Size: 0x106
function private onOpenSupplyDrop(player, cache, items) {
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9d1c
// Size: 0x176
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9e9a
// Size: 0x4a
function function_f00aa0c3b58c13f2(cache, player) {
    if (!function_6f6cc16c0528de5b(player)) {
        return;
    }
    if (!isdefined(player) || !isdefined(player.team) || !isdefined(cache)) {
        return;
    }
    function_8359cadd253f9604(player, "unlocked_door", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9eec
// Size: 0x1f2
function function_d10645afed0f00fe(player, poi) {
    if (!function_6f6cc16c0528de5b(player)) {
        return;
    }
    if (isdefined(level.squaddata)) {
        if (isalive(player) && player.sessionstate == "playing") {
            poisVisited = squads::getsquaddata(player.team, player.sessionsquadid, "poisVisited");
        }
    } else {
        poisVisited = teams::getteamdata(player.team, "poisVisited");
    }
    if (isdefined(poisVisited)) {
        if (!isdefined(poisVisited[poi])) {
            function_8359cadd253f9604(player, "poi_travel", 1);
            poisVisited[poi] = 1;
            if (isdefined(level.squaddata)) {
                squads::function_a20a10ce593f692b(player.team, player.sessionsquadid, "poisVisited", poisVisited);
                players = level.squaddata[player.team][player.sessionsquadid].players;
            } else {
                teams::setteamdata(player.team, "poisVisited", poisVisited);
                players = scripts\mp\utility\teams::getteamdata(player.team, "players");
            }
            foreach (ent in players) {
                ent scripts\mp\utility\points::doScoreEvent(#"hash_3b0b5b72c38e1a56");
            }
        }
    }
    if (player namespace_aead94004cf4c147::getTotalItemCountInBag(11200) > 0) {
        function_187f4232dcd3b0e9(player, poi);
    }
    if (isdefined(player.vehicle) && player.vehicle.vehiclename == "veh9_acv_6x6") {
        function_88d8597beafdd628(player, poi);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa0e6
// Size: 0x144
function onVehicleEnter(player, vehicle) {
    if (!function_6f6cc16c0528de5b(player)) {
        return;
    }
    vehiclename = vehicle.vehiclename;
    if (isdefined(level.squaddata)) {
        vehiclesEntered = squads::getsquaddata(player.team, player.sessionsquadid, "vehiclesEntered");
        if (!isdefined(vehiclesEntered[vehiclename])) {
            function_8359cadd253f9604(player, "unique_vehicle_pilot", 1);
            vehiclesEntered[vehiclename] = 1;
            squads::function_a20a10ce593f692b(player.team, player.sessionsquadid, "vehiclesEntered", vehiclesEntered);
        }
    } else {
        vehiclesEntered = teams::getteamdata(player.team, "vehiclesEntered");
        if (!isdefined(vehiclesEntered[vehiclename])) {
            function_8359cadd253f9604(player, "unique_vehicle_pilot", 1);
            vehiclesEntered[vehiclename] = 1;
            teams::setteamdata(player.team, "vehiclesEntered", vehiclesEntered);
        }
    }
    if (vehiclename == "veh9_civ_lnd_dirt_bike") {
        function_8359cadd253f9604(player, "enter_dirt_bike", 1);
    }
    if (vehiclename == "veh9_mil_lnd_mrap" && !vehicle scripts\cp_mp\vehicles\vehicle_occupancy::function_72f871bf74995298()) {
        function_7fc83d63a85c14d(player);
    }
    thread function_b55402e6d4fae450(vehicle);
    thread function_494cf678a5b30f9e(player, vehiclename);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa232
// Size: 0x2c
function onvehicleoutoffuel(player) {
    if (!isdefined(player) || !function_6f6cc16c0528de5b(player)) {
        return;
    }
    function_8359cadd253f9604(player, "gas_drain", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa266
// Size: 0x225
function onvehiclefullrefuelandrepair(vehicle, gasstation) {
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
    if (!array_contains(level.var_e4f4c5fe8bc2228f[owner.team], gasstation)) {
        level.var_e4f4c5fe8bc2228f[owner.team][level.var_e4f4c5fe8bc2228f[owner.team].size] = gasstation;
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
        if (vehicle scripts\cp_mp\vehicles\vehicle::isvehicleboat()) {
            function_8359cadd253f9604(owner, "boat_refuel_repair", 1);
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa493
// Size: 0x6b
function function_719e931249c15652(vehicle) {
    owner = vehicle.lastowner;
    if (!isdefined(owner) || !function_6f6cc16c0528de5b(owner) || istrue(vehicle.killedbytrain)) {
        return;
    }
    vehicle.killedbytrain = 1;
    if (!vehicle scripts\cp_mp\vehicles\vehicle::isvehiclehusk()) {
        function_8359cadd253f9604(owner, "kill_vehicle_with_train", 1);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa506
// Size: 0xbe
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa5cc
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa64e
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa6d6
// Size: 0x57
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa735
// Size: 0xa5
function function_c0a3853f9497fad3(revivedata) {
    if (isdefined(revivedata.reviver) && isdefined(revivedata.reviver)) {
        if (isdefined(revivedata.reviver.team) && isdefined(revivedata.revivee.team) && revivedata.reviver.team != revivedata.revivee.team) {
            function_8359cadd253f9604(revivedata.reviver, "stim_enemy_player", 1);
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa7e2
// Size: 0xd5
function function_b71395f12af20a42(instance) {
    function_a9f8fa06a358585b(instance.owningteam, "samsite", 1, instance.poi, 1);
    var_a497d0881ebbdf71 = 0;
    foreach (samsite in level.samsites) {
        if (isdefined(samsite.owningteam) && samsite.owningteam == instance.owningteam) {
            var_a497d0881ebbdf71++;
        }
    }
    if (var_a497d0881ebbdf71 >= 3) {
        function_8a7a2427622e7572(instance.owningteam, "sync_samsite_control", 1);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa8bf
// Size: 0x24
function function_19d6e799236e4435(instance) {
    function_8a7a2427622e7572(instance.owningteam, "plane_shot_down", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa8eb
// Size: 0x2e1
function function_da13a73169d19313(ref) {
    switch (ref) {
    case #"hash_f4a9126c03d3385b":
        return ae_utility::function_e2ff8f4b4e94f723(#"activity_type", #"domination");
    case #"hash_e91729d4ef79ca26":
        return ae_utility::function_e2ff8f4b4e94f723(#"activity_type", #"geiger_search");
    case #"hash_75b6db03edb1e84e":
        return ae_utility::function_e2ff8f4b4e94f723(#"activity_type", #"elimination");
    case #"hash_82ea0e6e4f123b62":
        return ae_utility::function_e2ff8f4b4e94f723(#"activity_type", #"trap");
    case #"hash_e0b82e0f064c17d6":
        return ae_utility::function_e2ff8f4b4e94f723(#"activity_type", #"hostage");
    case #"hash_9db32d30f2603c35":
        return ae_utility::function_e2ff8f4b4e94f723(#"activity_type", #"vehicledrive");
    case #"hash_37bb23543c319104":
        return ae_utility::function_e2ff8f4b4e94f723(#"activity_type", #"hunt");
    case #"hash_1e754eb11fa62651":
        return ae_utility::function_e2ff8f4b4e94f723(#"activity_type", #"boatdrive");
    case #"hash_cf3abe09f0094696":
        return ae_utility::function_e2ff8f4b4e94f723(#"activity_type", #"demolition");
    case #"hash_c5a5568c914ba427":
        return ae_utility::function_e2ff8f4b4e94f723(#"activity_type", #"samsite");
    case #"hash_9682e089e580b4b8":
        return ae_utility::function_e2ff8f4b4e94f723(#"activity_type", #"safe");
    case #"hash_7e9cf92ed0a526f1":
        return ae_utility::function_e2ff8f4b4e94f723(#"activity_type", #"bomb");
    case #"hash_890e226c519dc6ab":
        return ae_utility::function_e2ff8f4b4e94f723(#"activity_type", #"hash_3cfb50e48ebdfe5b");
    case #"hash_218ddcea32fa5fbc":
        return ae_utility::function_e2ff8f4b4e94f723(#"activity_type", #"hacker_phone");
    case #"hash_be386dc37be6968e":
        return ae_utility::function_e2ff8f4b4e94f723(#"activity_type", #"supply");
    case #"hash_88570f89de3f4680":
        return ae_utility::function_e2ff8f4b4e94f723(#"activity_type", #"scav");
    case #"hash_4f62da1c4ed6f790":
        return ae_utility::function_e2ff8f4b4e94f723(#"activity_type", #"convoy_attack");
    case #"hash_5c317bf7b4be6e08":
        return ae_utility::function_e2ff8f4b4e94f723(#"activity_type", #"hash_81ebff92b418d2c8");
    case #"hash_2a58b3d6862b2cdf":
        return ae_utility::function_e2ff8f4b4e94f723(#"activity_type", #"train_safe");
    default:
        return undefined;
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xabd4
// Size: 0x1dc
function function_a9f8fa06a358585b(captureteam, activityref, iscompletion, poi, var_a7828126a34279e8) {
    playersonteam = teams::getteamdata(captureteam, "players");
    if (playersonteam.size == 0) {
        return;
    }
    activityindex = function_da13a73169d19313(activityref);
    if (!isdefined(activityindex)) {
        return;
    }
    activitytype = scripts\cp_mp\challenges::function_6d40f12a09494350(0, activityindex);
    if (istrue(iscompletion)) {
        foreach (player in playersonteam) {
            if (!function_6f6cc16c0528de5b(player)) {
                continue;
            }
            scripts\cp_mp\challenges::function_2635cdb5e985eaab(player, activitytype, poi);
        }
        if (istrue(var_a7828126a34279e8)) {
            return;
        }
        if (!isdefined(level.var_48cd656af1746262)) {
            level.var_48cd656af1746262 = [];
        }
        if (!isdefined(level.var_48cd656af1746262[captureteam])) {
            level.var_48cd656af1746262[captureteam] = [];
        }
        if (isdefined(poi)) {
            if (!isdefined(level.var_48cd656af1746262[captureteam][poi])) {
                level.var_48cd656af1746262[captureteam][poi] = 1;
                function_8a7a2427622e7572(captureteam, "contract_complete_unique_poi", 1);
            }
        }
        if (!isdefined(level.var_48cd656af1746262[captureteam][activityref])) {
            level.var_48cd656af1746262[captureteam][activityref] = 1;
            function_8a7a2427622e7572(captureteam, "contract_complete_unique_contract", 1);
        }
        return;
    }
    foreach (player in playersonteam) {
        if (!function_6f6cc16c0528de5b(player)) {
            continue;
        }
        scripts\cp_mp\challenges::function_affb3af6af110594(player, activitytype, poi);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xadb8
// Size: 0x94
function onsquadwiped(attackers) {
    if (!function_cff2f4f168b29b81()) {
        return;
    }
    attackerteams = [];
    foreach (attacker in attackers) {
        if (!isdefined(attackerteams[attacker.team])) {
            attackerteams[attacker.team] = 1;
            function_8359cadd253f9604(attacker, "squad_wipe", 1);
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xae54
// Size: 0x24
function function_5e98eb5de21b3a8c(player) {
    if (!function_cff2f4f168b29b81()) {
        return;
    }
    function_8359cadd253f9604(player, "hacked_wheelson", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xae80
// Size: 0x114
function private onRequestTeamAssimilate(player, validplayers) {
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaf9c
// Size: 0x25
function onPingContractPhone(player) {
    if (!function_6f6cc16c0528de5b(player)) {
        return;
    }
    function_8359cadd253f9604(player, "ping_contract_phone", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xafc9
// Size: 0x34
function function_58d9b223aaf4966c(fortress) {
    name = fortress.name;
    if (isdefined(name)) {
        return ("cleared_" + name);
    }
    return "";
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb006
// Size: 0x137
function function_59fe5e0d7d5e7947(player, fortress) {
    if (!function_6f6cc16c0528de5b(player)) {
        return;
    }
    if (namespace_9823ee6035594d67::function_4ec4f39a2e1745f2(fortress)) {
        if (!isdefined(fortress.name)) {
            assertmsg("<dev string:x711>" + scripts\common\utility::function_d5ad0ebc9d8935b6(fortress.origin) + "<dev string:x721>");
            return;
        }
        ref = function_58d9b223aaf4966c(fortress);
        function_8359cadd253f9604(player, ref, 1);
        if (fortress.name == "delta_firestation" && isdefined(player.team)) {
            players = scripts\mp\utility\teams::getteamdata(player.team, "players");
            foreach (teammate in players) {
                if (teammate namespace_aead94004cf4c147::function_d63a7299c6203bf9(29299)) {
                    function_8359cadd253f9604(player, "cleared_fire_station_with_weapon_case", 1);
                    break;
                }
            }
        }
        return;
    }
    function_8359cadd253f9604(player, "clear_stronghold", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb145
// Size: 0x16f
function onUAVTowerUsed(player, index) {
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
    if (isdefined(level.activetowers) && isdefined(player.team)) {
        var_f7df47f85b931da = 0;
        foreach (tower in level.activetowers) {
            if (isdefined(tower.activeteam) && tower.activeteam == player.team) {
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb2bc
// Size: 0x2d
function function_3d12fce128d424b1(player, instance) {
    if (!function_6f6cc16c0528de5b(player)) {
        return;
    }
    function_8359cadd253f9604(player, "agent_radio_used", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb2f1
// Size: 0x4e2
function onaikill(victim, player, objweapon) {
    if (!isdefined(player) || !function_6f6cc16c0528de5b(player)) {
        return;
    }
    if (isdefined(objweapon)) {
        weaponclass = weaponclass(objweapon);
        if (weaponclass == "spread" && isdefined(player.closestpoi) && player.closestpoi == "saba_hydro") {
            function_8359cadd253f9604(player, "hydro_shotgun_ai", 1);
        } else if (weaponclass == "rifle" && isdefined(player.closestpoi) && player.closestpoi == "saba_oilfield") {
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
    if (isdefined(level.activetowers) && isdefined(player.team)) {
        foreach (instance in level.activetowers) {
            if (isdefined(instance.activeteam) && instance.activeteam == player.team) {
                dist = distance2d(instance.origin, victim.origin);
                if (dist <= level.var_6acf91bbf5273e8f) {
                    function_8359cadd253f9604(player, "kill_under_uav_tower", 1);
                }
            }
        }
    }
    if (isdefined(player) && isdefined(player.team)) {
        if (isdefined(victim.agentStruct) && isdefined(victim.agentStruct.fortress)) {
            if (!isdefined(level.var_6ba2db37df87088e)) {
                level.var_6ba2db37df87088e = [];
            }
            var_dd070161709fa76 = "brloot_legion_deal_intel";
            if (scripts\cp_mp\utility\game_utility::function_ee0c2958aa2ee59e()) {
                var_dd070161709fa76 = "brloot_aq_bunker_note";
            }
            if (!isdefined(level.var_6ba2db37df87088e[player.team])) {
                level.var_6ba2db37df87088e[player.team] = 1;
                namespace_bfef6903bca5845d::function_63a043d47490f90d(victim, var_dd070161709fa76);
            } else {
                namespace_bfef6903bca5845d::function_63a043d47490f90d(victim, var_dd070161709fa76, undefined, 0.25);
            }
            if (scripts\mp\agents\agent_utility::function_17b2ecdae3a795f6(victim)) {
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
        } else if (scripts\mp\agents\agent_utility::function_17b2ecdae3a795f6(victim)) {
            if (scripts\cp_mp\utility\game_utility::function_ffbbb4525b11d5a2()) {
                var_dd070161709fa76 = "brloot_note_extraction_protocol";
                namespace_bfef6903bca5845d::function_63a043d47490f90d(victim, var_dd070161709fa76, undefined, 0.1);
            } else if (scripts\mp\agents\agent_utility::istier3(victim)) {
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
        player.var_5394c1bb15bee8f8 = default_to(player.var_5394c1bb15bee8f8, []);
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xb7db
// Size: 0x216
function function_398906218a0dd7da(player, victim, objweapon, modifiers) {
    if (!isdefined(player) || !function_6f6cc16c0528de5b(player)) {
        return;
    }
    if (isdefined(objweapon)) {
        fixedweaponclass = scripts\cp_mp\challenges::function_ce112254f7cba89e(objweapon);
        if (isdefined(fixedweaponclass) && fixedweaponclass != 0) {
            function_e06a127b0dd6af8(player, fixedweaponclass);
        }
    }
    bitarray = scripts\cp_mp\challenges::function_3005ef56488df9be(modifiers);
    if (isdefined(bitarray) && isdefined(bitarray[ae_utility::function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"vehiclesurf")])) {
        for (moverparent = player; true; moverparent = newparent) {
            if ((isplayer(moverparent) || isactor(moverparent)) && !moverparent islinked()) {
                newparent = moverparent getmovingplatformparent(1);
            } else {
                newparent = moverparent getlinkedparent();
            }
            if (!isdefined(newparent)) {
                break;
            }
        }
        if (isdefined(moverparent) && moverparent scripts\cp_mp\vehicles\vehicle::isvehicle()) {
            driver = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getdriver(moverparent);
            if (isdefined(driver) && isdefined(driver.team) && isplayer(driver)) {
                if (driver.team != player.team && (!isplayer(victim) || driver.team != victim.team)) {
                    function_8359cadd253f9604(driver, "enemy_operator_killed_enemies_from_your_vehicle", 1);
                }
            }
        }
    }
    if (isdefined(player.externalvehicle)) {
        driver = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getdriver(player.externalvehicle);
        if (isdefined(driver) && isdefined(driver.team) && isplayer(driver)) {
            if (driver.team != player.team && (!isplayer(victim) || driver.team != victim.team)) {
                function_8359cadd253f9604(driver, "enemy_operator_killed_enemies_from_your_vehicle", 1);
            }
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb9f9
// Size: 0xfb
function function_e06a127b0dd6af8(player, fixedweaponclass) {
    if (!isdefined(player.var_3b6f247ff290f31a)) {
        player.var_3b6f247ff290f31a = [];
    }
    if (!isdefined(player.var_3b6f247ff290f31a[fixedweaponclass])) {
        player.var_3b6f247ff290f31a[fixedweaponclass] = 1;
        players = teams::getteamdata(player.team, "players");
        foreach (teamplayer in players) {
            if (isdefined(teamplayer) && teamplayer != player) {
                if (!isdefined(teamplayer.var_3b6f247ff290f31a)) {
                    teamplayer.var_3b6f247ff290f31a = [];
                }
                teamplayer.var_3b6f247ff290f31a[fixedweaponclass] = 1;
            }
        }
        function_8359cadd253f9604(player, "kill_unique_weapon_class", 1);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbafc
// Size: 0x101
function function_22024087c0855cde() {
    if (!isdefined(level.var_a7b62649c81b481a) || !isdefined(level.var_a7b62649c81b481a.var_acc161de36707de2)) {
        return;
    }
    if (!function_cff2f4f168b29b81()) {
        return;
    }
    var_b3a1d6972f2a160c = level.var_a7b62649c81b481a.var_acc161de36707de2;
    reportstring = "";
    if (var_b3a1d6972f2a160c == 2) {
        reportstring = "lpcon_bravo";
    } else if (var_b3a1d6972f2a160c == 3) {
        reportstring = "lpcon_charlie";
    } else if (var_b3a1d6972f2a160c == 4) {
        reportstring = "lpcon_delta";
    } else if (var_b3a1d6972f2a160c == 5) {
        reportstring = "lpcon_echo";
    }
    if (reportstring != "") {
        foreach (player in level.players) {
            function_8359cadd253f9604(player, reportstring, 1);
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xbc05
// Size: 0x173
function function_7184abfe5941a710(player, cashspent) {
    if (!isdefined(player) || !isdefined(player.br_kiosk)) {
        return;
    }
    kiosk = player.br_kiosk;
    if (!isdefined(level.kioskpurchases)) {
        level.kioskpurchases = [];
    }
    if (!isdefined(level.kioskpurchases[player.team])) {
        level.kioskpurchases[player.team] = [];
    }
    if (!isdefined(level.kioskpurchases[player.team][kiosk.index])) {
        purchasestruct = spawnstruct();
        purchasestruct.cashspent = 0;
        purchasestruct.challengesucceeded = 0;
        level.kioskpurchases[player.team][kiosk.index] = purchasestruct;
    }
    purchasestruct = level.kioskpurchases[player.team][kiosk.index];
    purchasestruct.cashspent += cashspent;
    if (purchasestruct.cashspent >= 600 && !purchasestruct.challengesucceeded) {
        function_8359cadd253f9604(player, "spend_cash_unique_buy_station", 1);
        purchasestruct.challengesucceeded = 1;
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xbd80
// Size: 0xa4
function onItemSold(player, var_6e36889d56716c4) {
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xbe2c
// Size: 0x7a
function function_8a7a2427622e7572(team, type, quantity) {
    if (isdefined(team)) {
        foreach (teamplayer in teams::getteamdata(team, "players")) {
            function_8359cadd253f9604(teamplayer, type, quantity, 0);
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xbeae
// Size: 0x1a
function private function_a269616a6f117980() {
    level.var_b4973b15ead7e660 = function_f159c10d5cf8f0b4("trigger_hydro_waterwell", "script_noteworthy");
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0xbed0
// Size: 0x106
function private ongasgrenadeexplode(position, owner, team) {
    if (!isdefined(level.var_b4973b15ead7e660) || level.var_b4973b15ead7e660.size == 0) {
        return;
    }
    position -= (0, 0, 100);
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0xbfde
// Size: 0x3a
function private onEnterMediumBird(vehicle, seatid, var_fc7c7a874b43a31a, player, data) {
    function_8359cadd253f9604(player, "enter_medium_bird", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xc020
// Size: 0x137
function private function_b46e6500bef678bc() {
    helipads = function_f159c10d5cf8f0b4("trigger_lone_helipad", "script_noteworthy");
    if (!isdefined(helipads) || helipads.size == 0) {
        return;
    }
    helipad = helipads[0];
    while (true) {
        helipad waittill("trigger", ent);
        if (!ent scripts\cp_mp\vehicles\vehicle::isvehicle()) {
            continue;
        }
        if (ent scripts\cp_mp\vehicles\vehicle::function_d93ec4635290febd() != "little_bird") {
            continue;
        }
        driver = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getdriver(ent);
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xc15f
// Size: 0x1c9
function private function_1d1a225ab9f876fd(vehicle, driver) {
    function_8359cadd253f9604(driver, "land_at_lone_helipad", 1);
    downloadent = spawn("script_origin", vehicle.origin);
    downloadent linkto(vehicle);
    downloadent makeusable();
    downloadent setuserange(250);
    downloadent setusefov(180);
    downloadent sethintstring(%PMC/DOWNLOAD_FLIGHT_PATH_DATA);
    teammates = teams::getteamdata(driver.team, "players");
    foreach (player in level.players) {
        if (array_contains(teammates, player)) {
            downloadent enableplayeruse(player);
            continue;
        }
        downloadent disableplayeruse(player);
    }
    foreach (player in teammates) {
        player scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_allowvehicleuse(vehicle, 0);
    }
    downloadent waittill("trigger");
    function_8359cadd253f9604(driver, "use_heli_blackbox", 1);
    driver.var_d139ca6041259b28 = 1;
    downloadent delete();
    foreach (player in teammates) {
        if (isdefined(player)) {
            player scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_allowvehicleuse(vehicle, 1);
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xc330
// Size: 0xb9
function private function_c603f3be1379a541() {
    level.var_a524a11dadc4d9fb = [];
    malltrigger = function_f159c10d5cf8f0b4("trigger_sira_mall", "script_noteworthy");
    oasistrigger = function_f159c10d5cf8f0b4("pmc_oasis_trigger", "script_noteworthy");
    var_5f3fcc88f85016c2 = function_f159c10d5cf8f0b4("pmc_sandstorm", "script_noteworthy");
    if (isdefined(malltrigger) && malltrigger.size > 0) {
        level.var_a524a11dadc4d9fb["sira_mall"] = malltrigger[0];
    }
    if (isdefined(oasistrigger) && oasistrigger.size > 0) {
        level.var_a524a11dadc4d9fb["saba_oasis"] = oasistrigger[0];
    }
    if (isdefined(var_5f3fcc88f85016c2) && var_5f3fcc88f85016c2.size > 0) {
        level.var_a524a11dadc4d9fb["saba_sandstorm"] = var_5f3fcc88f85016c2[0];
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xc3f1
// Size: 0x37
function private function_4e6833308f41021e() {
    var_641d70dcbcaf1346 = getentitylessscriptablearray(undefined, undefined, undefined, undefined, "brloot_unhacked_laptop");
    if (!isdefined(var_641d70dcbcaf1346) || var_641d70dcbcaf1346.size == 0) {
        return;
    }
    level.var_1fed93654fa204f8 = var_641d70dcbcaf1346[0];
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc430
// Size: 0xe0
function function_44cb8b0c33cef670(player, deaddrop, weapon) {
    if (isdefined(weapon)) {
        attachments = getweaponattachments(weapon);
        var_51dbe1a1c3d8bf04 = function_6527364c1ecca6c6(weapon);
        var_2cb723804483d204 = array_remove_array(attachments, var_51dbe1a1c3d8bf04);
        if (var_2cb723804483d204.size >= 5) {
            function_8359cadd253f9604(player, "dead_drop_gun_with_five_attachments", 1);
        }
        if (isdefined(deaddrop.poi) && deaddrop.poi == "saba_caves" && issameweapon(weapon, level.var_c891a425bf8cbc28)) {
            function_8359cadd253f9604(player, "dead_drop_chemist_gun", 1);
        }
        if (isdefined(level.trappercrossbow) && issameweapon(weapon, level.trappercrossbow)) {
            function_8359cadd253f9604(player, "dead_drop_trapper_crossbow", 1);
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xc518
// Size: 0x1a2
function private onAddItemToDeadDrop(container, lootid) {
    if (issharedfuncdefined(lootid, "addedToDeadDrop")) {
        return function_f3bb4f4911a1beb2(lootid, "addedToDeadDrop", container, lootid);
    }
    if (!isdefined(self) || !isdefined(self.var_2fa5b49969def47)) {
        return [lootid, undefined];
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
    return [lootid, noextract];
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xc6c3
// Size: 0xec
function private function_d2abbcb10a39ff56(lootid) {
    if (!isdefined(self) || !isdefined(self.var_2fa5b49969def47) || !isdefined(self.var_2fa5b49969def47.origin)) {
        return [lootid, undefined];
    }
    if (!isdefined(self.var_2fa5b49969def47.poi)) {
        self.var_2fa5b49969def47.poi = scripts\mp\poi::function_6cc445c02b5effac(self.var_2fa5b49969def47.origin);
    }
    if (!isdefined(self.var_2fa5b49969def47.poi) || self.var_2fa5b49969def47.poi != "saba_caves") {
        return [lootid, undefined];
    }
    function_e53e7e4801c9866();
    function_8359cadd253f9604(self, "hacked_laptop", 1);
    return [8644, 1];
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xc7b8
// Size: 0x90
function private function_e53e7e4801c9866() {
    if (!isdefined(level.var_1fed93654fa204f8) || !isdefined(level.var_1fed93654fa204f8.origin) || !isdefined(level.var_1fed93654fa204f8.angles)) {
        return;
    }
    var_6d6612caac7c7233 = spawnscriptable("dmz_pmc_place_laptop", level.var_1fed93654fa204f8.origin, level.var_1fed93654fa204f8.angles);
    var_6d6612caac7c7233 function_ab5c0b42f31a0d20(function_16ae6d8b5f25f31b("espionage_story"));
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0xc850
// Size: 0x8a
function private function_959dc4fe95b93cea(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (state != "invisible_usable") {
        return;
    }
    var_d1768fd36a39517b = istrue(player namespace_aead94004cf4c147::function_6f39f9916649ac48(8644, 1));
    if (!var_d1768fd36a39517b) {
        player scripts\mp\hud_message::showerrormessage("PMC/DONT_HAVE_HACKED_LAPTOP");
        return;
    }
    instance setscriptablepartstate("dmz_pmc_place_laptop", "visible_unusable");
    function_8359cadd253f9604(player, "planted_hacked_laptop", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xc8e2
// Size: 0x16a
function private function_492d7c202b56dc1() {
    flag_wait("scriptables_ready");
    lootids = [11209, 11208, 11201];
    for (i = 1; i <= 3; i++) {
        cachespawn = getstruct("puzzle_buried_cache_" + i, "script_noteworthy");
        var_fa4fff8ad27727e2 = lootids[i - 1];
        if (!isdefined(cachespawn)) {
            continue;
        }
        cache = spawnscriptable("dmz_geiger_puzzle_container", cachespawn.origin, default_to(cachespawn.angles, (0, 0, 0)));
        contents = scripts\mp\gametypes\br_lootcache::function_ec87b214cd429e96(getscriptablelootcachecontents(cache));
        newcontents = [];
        for (j = 0; j < contents.size; j++) {
            lootid = contents[j]["lootID"];
            if (array_contains(lootids, lootid)) {
                if (lootid == var_fa4fff8ad27727e2) {
                    contents[j]["callback"] = &function_ecdd376b2a318c49;
                    newcontents[newcontents.size] = contents[j];
                }
                continue;
            }
            newcontents[newcontents.size] = contents[j];
        }
        cache.contents = array_randomize(newcontents);
        cache setscriptablepartstate("body", "closed_usable");
        namespace_96abc792b7f61807::function_f0d61e14dfde9ccd(cache);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xca54
// Size: 0x1b
function private function_ecdd376b2a318c49(cache, player) {
    namespace_96abc792b7f61807::function_a67007b5af86ff0b(cache);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xca77
// Size: 0x4a
function private function_5c7bc3641f80e9dc() {
    level.var_39f292381a9d3bb8 = getstruct("oilfield_stronghold_entrance", "script_noteworthy");
    if (isdefined(level.var_39f292381a9d3bb8) && !isdefined(level.var_39f292381a9d3bb8.origin)) {
        level.var_39f292381a9d3bb8 = undefined;
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xcac9
// Size: 0x79
function private onPlaceTacCamera(camera) {
    if (!isdefined(camera) || !isdefined(camera.origin)) {
        return;
    }
    if (isdefined(level.var_39f292381a9d3bb8)) {
        function_635937c689ec374(camera);
    }
    if (isdefined(level.var_ccaa9cfd2b7b3856)) {
        function_e6fc5a0cc74883ef(camera);
    }
    if (isdefined(level.map2map) && isdefined(level.map2map.warpstructs)) {
        function_1236e9842df9aa2f(camera);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcb4a
// Size: 0x89
function function_635937c689ec374(camera) {
    if (distancesquared(camera.origin, level.var_39f292381a9d3bb8.origin) > 2250000) {
        return;
    }
    raycast = scripts\engine\trace::ray_trace(camera.origin, level.var_39f292381a9d3bb8.origin, camera);
    if (raycast["fraction"] < 0.99) {
        return;
    }
    function_8359cadd253f9604(self, "tac_cam_pointing_at_oilfield", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcbdb
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xcc6c
// Size: 0x8a
function function_7cfd9e977f412d78(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (state != "invisible_usable") {
        return;
    }
    hasdocuments = istrue(player namespace_aead94004cf4c147::function_6f39f9916649ac48(8618, 1));
    if (!hasdocuments) {
        player scripts\mp\hud_message::showerrormessage("PMC/NO_DOCUMENTS_ERR_MSG");
        return;
    }
    instance setscriptablepartstate("dmz_pmc_place_intel", "visible");
    function_8359cadd253f9604(player, "swapped_caves_intel", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xccfe
// Size: 0x114
function function_7868d975ef389aba() {
    cavetriggers = function_f159c10d5cf8f0b4("trigger_water_cave_docks", "script_noteworthy");
    if (!isdefined(cavetriggers) || cavetriggers.size == 0) {
        return;
    }
    cavetrigger = cavetriggers[0];
    while (true) {
        cavetrigger waittill("trigger", ent);
        if (!ent scripts\cp_mp\vehicles\vehicle::isvehicle()) {
            continue;
        }
        if (!ent scripts\cp_mp\vehicles\vehicle::isvehicleboat()) {
            continue;
        }
        driver = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getdriver(ent);
        if (!isdefined(driver) || !isdefined(driver.team) || !isplayer(driver)) {
            continue;
        }
        if (isdefined(cavetrigger.used) && isdefined(cavetrigger.used[driver.team])) {
            continue;
        }
        if (!isdefined(cavetrigger.used)) {
            cavetrigger.used = [];
        }
        cavetrigger.used[driver.team] = 1;
        function_8359cadd253f9604(driver, "trigger_water_cave_docks", 1);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xce1a
// Size: 0x23c
function private function_3008315fdf9460b8() {
    cachespawn = getstruct("fortress_sewer_underwater_cache", "script_noteworthy");
    var_aece5bd343e9d2dc = getstructarray("fortress_breaker_interact", "script_noteworthy");
    if (!isdefined(cachespawn) || !isdefined(cachespawn.origin)) {
        return;
    }
    if (!isdefined(var_aece5bd343e9d2dc) || var_aece5bd343e9d2dc.size == 0) {
        return;
    }
    level.var_f0223212ed81b749 = [];
    badorigins = [(18096, -55514, 731), (16657, -53540, 837), (18114, -54311, 730)];
    foreach (struct in var_aece5bd343e9d2dc) {
        valid = 1;
        foreach (origin in badorigins) {
            if (distance(struct.origin, origin) < 20) {
                valid = 0;
            }
        }
        if (valid) {
            level.var_f0223212ed81b749[level.var_f0223212ed81b749.size] = struct;
        }
    }
    level.var_d4a11cb7a6a4bc0c = 0;
    level.var_518fafbd705972fb = spawnscriptable("br_loot_cache_lege", cachespawn.origin, default_to(cachespawn.angles, (0, 0, 0)));
    level.var_518fafbd705972fb scripts\mp\gametypes\br_lootcache::function_d683a60016231237(11263, 1);
    level.var_518fafbd705972fb.var_c93ea8f612f4aaba = 1;
    level.var_dd5eaba9f20b9619 = level.var_518fafbd705972fb namespace_58dcf42cf567f34f::lockedcache_lock(level.var_518fafbd705972fb.origin + (0, 0, 20), "generic_no_key");
    level thread function_280edf3f47535ae9("trigger_fortress_sewers", "script_noteworthy", "trigger_fortress_sewers", &function_ff25c1631a28d8fe);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xd05e
// Size: 0x14c
function private function_ff25c1631a28d8fe(player) {
    if (istrue(level.var_1171de670afddbee)) {
        return;
    }
    level.var_1171de670afddbee = 1;
    level.var_3edca7326772514b = [];
    foreach (breakerspawn in level.var_f0223212ed81b749) {
        level.var_3edca7326772514b[level.var_3edca7326772514b.size] = spawnscriptable("dmz_pmc_disarm_security", breakerspawn.origin);
    }
    level.var_66b139a489af4aac = player.team;
    level.var_f0223212ed81b749 = undefined;
    playsoundatpos(random(level.var_3edca7326772514b).origin, "mp_dmz_alrm_trap");
    level endon("sewer_event_disabled");
    wait 240;
    if (isdefined(level.var_3edca7326772514b)) {
        randombreaker = random(level.var_3edca7326772514b);
        playsoundatpos(randombreaker.origin, "mp_dmz_alrm_trap");
        function_5c7bc997159207b3();
        function_8ad0dc3070480b2b(randombreaker.origin, 6, "saba_fort");
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0xd1b2
// Size: 0xa3
function private function_8ad0dc3070480b2b(location, num, poi) {
    agents = [];
    agentpackage = namespace_bfef6903bca5845d::function_ab14d6652e44fda0(6, level.spawnset["guard"], 3);
    agentpackage.reinforcementtype = "Helicopter";
    while (!isdefined(agents) || agents.size == 0) {
        agents = namespace_bfef6903bca5845d::function_77acc10c4823dd8a(6, location, "high", "mission", "sewerEvent", undefined, undefined, 1, poi, undefined, undefined, undefined, agentpackage);
        if (isdefined(agents) && agents.size != 0) {
            break;
        }
        wait 1;
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0xd25d
// Size: 0x99
function private function_4cdd0981528ff098(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    instance setscriptablepartstate(part, "invisible_unusable");
    player thread scripts\mp\gametypes\br_pickups::playerplaypickupanim();
    level.var_3edca7326772514b = array_remove(level.var_3edca7326772514b, instance);
    level.var_d4a11cb7a6a4bc0c++;
    if (level.var_d4a11cb7a6a4bc0c == 7) {
        function_66d667a607a545c4();
    }
    function_8a7a2427622e7572(level.var_66b139a489af4aac, "fortress_sewer_breaker_reroute", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xd2fe
// Size: 0xc9
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
        var_27e49251bb3376ea scripts\cp_mp\calloutmarkerping::calloutmarkerping_createcallout(19, (0, 0, 100), level.var_518fafbd705972fb.index);
    }
    function_5c7bc997159207b3();
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xd3cf
// Size: 0x77
function private function_5c7bc997159207b3() {
    if (!isdefined(level.var_3edca7326772514b)) {
        return;
    }
    foreach (scriptable in level.var_3edca7326772514b) {
        scriptable setscriptablepartstate("dmz_pmc_disarm_security", "invisible_unusable");
    }
    level.var_3edca7326772514b = undefined;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xd44e
// Size: 0x15b
function private function_9414ce99a799a309() {
    if (!scripts\mp\flags::gameflag("prematch_done")) {
        level scripts\mp\flags::gameflagwait("prematch_done");
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
    toweruse = spawnscriptable("dmz_pmc_hydro_tower_use", tower.origin);
    toweruse function_ab5c0b42f31a0d20(missionid);
    level thread function_98f9cf6481d5a722(triggers);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xd5b1
// Size: 0xda
function private function_98f9cf6481d5a722(triggers) {
    level.var_e5953799fc4ece76 = triggers;
    foreach (trigger in level.var_e5953799fc4ece76) {
        trigger thread function_88e153e1b6916e25();
    }
    while (true) {
        if (function_4518b3f7c0343ae4()) {
            foreach (player in level.players) {
                function_8359cadd253f9604(player, "parked_vehicles_hydro_gas_station", 1, 0);
            }
            return;
        }
        wait 1;
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xd693
// Size: 0x55
function private function_88e153e1b6916e25() {
    self.nearbyvehicles = [];
    while (true) {
        self waittill("trigger", ent);
        if (!ent scripts\cp_mp\vehicles\vehicle::isvehicle()) {
            continue;
        }
        if (isdefined(self.nearbyvehicles[ent getentitynumber()])) {
            continue;
        }
        thread function_cde3404945df007c(ent);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xd6f0
// Size: 0x73
function private function_cde3404945df007c(vehicle) {
    entnum = vehicle getentitynumber();
    self.nearbyvehicles[entnum] = vehicle;
    while (isdefined(vehicle) && isdefined(vehicle.origin) && distancesquared(vehicle.origin, self.origin) < 490000) {
        wait 1;
    }
    self.nearbyvehicles[entnum] = undefined;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xd76b
// Size: 0x63
function private function_4518b3f7c0343ae4() {
    foreach (trigger in level.var_e5953799fc4ece76) {
        if (trigger.nearbyvehicles.size == 0) {
            return false;
        }
    }
    return true;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xd7d7
// Size: 0x70
function private function_69a1e33dfbee41d2(team) {
    foreach (bombscriptable in level.var_fc7bbb62daf23e2d) {
        if (!is_equal(bombscriptable.team, team)) {
            return false;
        }
    }
    return true;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0xd850
// Size: 0x38d
function private function_fffd723ff4050d8e(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (state == "usable") {
        instance setscriptablepartstate(part, "unusable");
        if (istrue(instance.planting)) {
            return;
        }
        instance.planting = 1;
        bomb = function_c795784dbf5f49c5(player);
        thread namespace_f2c68794a1018c9d::function_d86771edadba8b4a(instance, instance, player);
        buttontime = 0;
        while (buttontime < level.demoprops.planttime) {
            if (instance.cancel || !scripts\mp\utility\player::isAliveAndNotInLastStand(player)) {
                instance.planting = 0;
                function_bc3d8a9d8b004ecd(player, bomb);
                instance setscriptablepartstate(part, "usable");
                return;
            }
            buttontime += level.framedurationseconds;
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
        return;
    }
    if (state == "defusable") {
        instance setscriptablepartstate(part, "unusable");
        if (istrue(instance.defusing)) {
            return;
        }
        instance.defusing = 1;
        instance.plantedbomb setscriptablepartstate("dmz_pmc_hydro_bomb", "invisible");
        bomb = function_c795784dbf5f49c5(player);
        thread namespace_f2c68794a1018c9d::function_d86771edadba8b4a(instance, instance, player);
        buttontime = 0;
        while (buttontime < level.demoprops.defusetime) {
            if (instance.cancel || !isalive(player) || isdefined(player.var_2ca0dac193d83c1) && player.var_2ca0dac193d83c1) {
                instance.defusing = 0;
                function_bc3d8a9d8b004ecd(player, bomb);
                instance.plantedbomb setscriptablepartstate("dmz_pmc_hydro_bomb", "visible");
                instance function_9c8ee1fae2f25458();
                return;
            }
            buttontime += level.framedurationseconds;
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xdbe5
// Size: 0xbd
function private function_9c8ee1fae2f25458() {
    self setscriptablepartstate("dmz_pmc_hydro_bomb_site_use", "defusable", 0);
    foreach (player in level.players) {
        self enablescriptableplayeruse(player);
    }
    foreach (player in teams::getteamdata(self.team, "players")) {
        self disablescriptableplayeruse(player);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xdcaa
// Size: 0x57
function private function_c795784dbf5f49c5(player) {
    player function_18445fc8f6589865(0);
    bomb = makeweapon("briefcase_bomb_mp");
    player scripts\cp_mp\utility\inventory_utility::_giveweapon(bomb, undefined, undefined, 0);
    player setweaponammostock(bomb, 0);
    player setweaponammoclip(bomb, 0);
    player thread scripts\mp\gameobjects::switchtouseweapon(bomb, 1, 1);
    return bomb;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xdd0a
// Size: 0x6c
function private function_bc3d8a9d8b004ecd(player, bomb) {
    lastweaponobj = player scripts\mp\utility\inventory::getlastweapon();
    if (player scripts\mp\utility\killstreak::isjuggernaut()) {
        lastweaponobj = scripts\mp\juggernaut::jugg_getminigunweapon();
    } else if (!player hasweapon(lastweaponobj)) {
        lastweaponobj = player scripts\mp\utility\inventory::getfirstprimaryweapon();
    }
    player scripts\cp_mp\utility\inventory_utility::domonitoredweaponswitch(lastweaponobj, 0, 1);
    player takeweapon(bomb);
    player function_18445fc8f6589865(1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xdd7e
// Size: 0x116
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
        val::reset_all("sam_holding_bomb");
        self function_bb04491d50d9e43e();
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0xde9c
// Size: 0x20d
function private function_a2b7f3dafbffa8de(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (!function_4518b3f7c0343ae4()) {
        player scripts\mp\hud_message::showerrormessage("PMC/NOT_ALL_GAS_STATIONS_ARE_OCCUPIED");
        return;
    }
    if (!function_69a1e33dfbee41d2(player.team)) {
        player scripts\mp\hud_message::showerrormessage("PMC/NOT_ALL_BOMBS_ARE_PLANTED");
        return;
    }
    instance freescriptable();
    player thread scripts\mp\equipment\c4::c4_animdetonate();
    wait 1;
    foreach (bomb in level.var_fc7bbb62daf23e2d) {
        pmc_explosion(bomb.origin, player);
        bomb.plantedbomb freescriptable();
        bomb freescriptable();
    }
    foreach (trigger in level.var_e5953799fc4ece76) {
        foreach (vehicle in trigger.nearbyvehicles) {
            if (isdefined(vehicle) && !istrue(vehicle.isdestroyed)) {
                data = scripts\cp_mp\utility\damage_utility::packdamagedata(player, vehicle, vehicle.maxhealth, makeweapon("bomb_site_mp"), "MOD_EXPLOSIVE", vehicle, vehicle.origin);
                vehicle scripts\cp_mp\vehicles\vehicle::vehicle_explode(data);
            }
        }
    }
    level.var_fc7bbb62daf23e2d = undefined;
    level.var_e5953799fc4ece76 = undefined;
    function_8359cadd253f9604(player, "detonated_hydro_bombs", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0xe0b1
// Size: 0xc3
function private pmc_explosion(origin, damageent, overridesound) {
    explosionpos = origin + (0, 0, 20);
    explosioneffect = spawnfx(level._effect["samsite_bomb_explosion"], explosionpos);
    explosioneffect thread function_b4b04de87729a6f3(10);
    triggerfx(explosioneffect);
    physicsexplosionsphere(explosionpos, 200, 100, 3);
    playrumbleonposition("grenade_rumble", origin);
    earthquake(0.25, 0.5, origin, 500);
    playsoundatpos(explosionpos, default_to(overridesound, "exp_bombsite_lr"));
    radiusdamage(explosionpos, 200, 500, 10, damageent, "MOD_EXPLOSIVE", "bomb_site_mp");
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xe17c
// Size: 0xee
function private function_b61326cf101fb540() {
    var_32e92de34d022079 = getstructarray("computer_usb_port", "script_noteworthy");
    if (!isdefined(var_32e92de34d022079) || var_32e92de34d022079.size == 0) {
        return;
    }
    if (!scripts\mp\flags::gameflag("prematch_done")) {
        level scripts\mp\flags::gameflagwait("prematch_done");
    }
    missionid = function_16ae6d8b5f25f31b("plant_usb_story");
    foreach (var_54a79406c5065ed0 in var_32e92de34d022079) {
        usb = spawnscriptable("dmz_pmc_place_usb", var_54a79406c5065ed0.origin, var_54a79406c5065ed0.angles);
        usb function_ab5c0b42f31a0d20(missionid);
    }
    level thread function_315e9c3a5fb405e5(missionid, (22656, -55352, 696), 11262, 3);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0xe272
// Size: 0x86
function private function_d7415966d73d5a1e(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (state != "invisible_usable") {
        return;
    }
    var_95d1a0691036b3e7 = istrue(player namespace_aead94004cf4c147::function_6f39f9916649ac48(11262, 1));
    if (!var_95d1a0691036b3e7) {
        player scripts\mp\hud_message::showerrormessage("PMC/HACKED_THUMB_DRIVE_REQUIRED");
        return;
    }
    instance setscriptablepartstate(part, "visible_unusable");
    function_8359cadd253f9604(player, "hacked_usb_planted", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xe300
// Size: 0x31
function private function_31b8c224ba19c71d() {
    if (scripts\cp_mp\utility\game_utility::function_7ee65fae13124702()) {
        level thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("gps_travel_story"), (4297, -11455, 4590), 11200, 1);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xe339
// Size: 0x3f
function private onContainerLooted(player, lootid, quantity, container) {
    if (lootid != 11200) {
        return;
    }
    function_187f4232dcd3b0e9(player, player.closestpoi);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe380
// Size: 0xe6
function function_187f4232dcd3b0e9(player, poi) {
    if (isdefined(player) && isdefined(poi)) {
        if (isdefined(level.squaddata)) {
            poisVisited = squads::getsquaddata(player.team, player.sessionsquadid, "gpsPoisVisited");
            if (!isdefined(poisVisited[poi])) {
                function_8359cadd253f9604(player, "gps_poi_travel", 1);
                poisVisited[poi] = 1;
                squads::function_a20a10ce593f692b(player.team, player.sessionsquadid, "gpsPoisVisited", poisVisited);
            }
            return;
        }
        poisVisited = teams::getteamdata(player.team, "gpsPoisVisited");
        if (!isdefined(poisVisited[poi])) {
            function_8359cadd253f9604(player, "gps_poi_travel", 1);
            poisVisited[poi] = 1;
            teams::setteamdata(player.team, "gpsPoisVisited", poisVisited);
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe46e
// Size: 0x4f
function function_438dae3e86a38aba(team, sessionsquadid) {
    if (isdefined(level.squaddata)) {
        poisVisited = squads::getsquaddata(team, sessionsquadid, "gpsPoisVisited");
    } else {
        poisVisited = teams::getteamdata(team, "gpsPoisVisited");
    }
    return poisVisited.size == 17;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xe4c6
// Size: 0x1d4
function private function_c9fb574bc742a62e() {
    var_400c962e88747e94 = getstructarray("caves_tracking_device", "script_noteworthy");
    var_c2b66b0092cf95c6 = [];
    foreach (struct in var_400c962e88747e94) {
        if (distance(struct.origin, (-31098, -499.5, 2113)) > 10) {
            var_c2b66b0092cf95c6[var_c2b66b0092cf95c6.size] = struct;
        }
    }
    serverspawn = getstruct("caves_bunker_server", "script_noteworthy");
    if (!isdefined(var_c2b66b0092cf95c6) || var_c2b66b0092cf95c6.size == 0 || !isdefined(serverspawn)) {
        return;
    }
    missionid = function_16ae6d8b5f25f31b("caves_tracking");
    if (scripts\cp_mp\utility\game_utility::function_7ee65fae13124702()) {
        function_315e9c3a5fb405e5(missionid, (21286, -16750, 3685), 11206, var_c2b66b0092cf95c6.size);
    } else if (!scripts\mp\flags::gameflag("prematch_done")) {
        level scripts\mp\flags::gameflagwait("prematch_done");
    }
    foreach (var_3029e9d959d68951 in var_c2b66b0092cf95c6) {
        trackingdevice = spawnscriptable("dmz_pmc_place_tracker", var_3029e9d959d68951.origin, default_to(var_3029e9d959d68951.angles, (0, 0, 0)));
        trackingdevice function_ab5c0b42f31a0d20(missionid);
    }
    var_56593eba3d9c2965 = spawnscriptable("dmz_pmc_caves_server_use", serverspawn.origin);
    var_56593eba3d9c2965 function_ab5c0b42f31a0d20(missionid);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0xe6a2
// Size: 0x7b
function private function_9e928de0556dd9a1(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    hastracker = istrue(player namespace_aead94004cf4c147::function_6f39f9916649ac48(11206, 1));
    if (!hastracker) {
        player scripts\mp\hud_message::showerrormessage("PMC/NO_TRACKING_DEVICES_IN_BACKPACK");
        return;
    }
    instance setscriptablepartstate(part, "visible_unusable");
    function_8359cadd253f9604(player, "plant_tracker_on_truck", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0xe725
// Size: 0xbf
function private function_822721b8759d5950(instance, part, state, player, var_a5b2c541413aa895, usestring) {
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xe7ec
// Size: 0x23d
function private function_b4b7d5eff7c75c3c(server, player) {
    server.curorigin = server.origin;
    server.offset3d = (0, 0, 15);
    server scripts\mp\gameobjects::requestid(1, 1, undefined, 1, 1);
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
        scripts\mp\objidpoolmanager::function_ce702e5925e31fc9(objid, teammember, 1, 2, %PMC/DOWNLOADING_SERVER_DATA);
    }
    wait 3;
    progress = 0;
    while (progress < 1) {
        progress = min(1, progress + level.framedurationseconds / 8);
        objective_setprogress(objid, progress);
        waitframe();
    }
    wait 0.2;
    foreach (teammember in players) {
        if (!isdefined(teammember)) {
            continue;
        }
        scripts\mp\objidpoolmanager::function_26259bd38697b5ad(objid, teammember);
    }
    function_8a7a2427622e7572(playerteam, "caves_server_download", 1);
    server scripts\mp\gameobjects::releaseid();
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xea31
// Size: 0x5e
function private function_822d31a70ed0bc67() {
    hiddencache = getentitylessscriptablearray("pmc_beach_observatory_toolbox", "script_noteworthy");
    if (!isdefined(hiddencache) || hiddencache.size != 1) {
        return;
    }
    hiddencache = hiddencache[0];
    hiddencache setscriptablepartstate("body", "closed_usable");
    hiddencache.islockedcache = 1;
    hiddencache scripts\mp\gametypes\br_lootcache::function_d683a60016231237(19247, 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xea97
// Size: 0x36c
function private function_84247818fc8a16f9(pingindex, pingtype) {
    if (pingtype == 6) {
        function_8359cadd253f9604(self, "ping_vehicle", 1);
        ent = self calloutmarkerping_getent(pingindex);
        if (isdefined(ent)) {
            if (isdefined(ent.bossname)) {
                function_8359cadd253f9604(self, "ping_boss", 1);
            }
        }
        return;
    }
    if (pingtype == 4) {
        index = self calloutmarkerping_getgscobjectiveindex(pingindex);
        if (isdefined(index)) {
            found = 0;
            if (isarray(level.uavtowers)) {
                foreach (uavtower in level.uavtowers) {
                    if (isdefined(uavtower) && isdefined(uavtower.uav_station) && isdefined(uavtower.uav_station.objidnum) && index == uavtower.uav_station.objidnum) {
                        function_8359cadd253f9604(self, "ping_uav_tower", 1);
                        found = 1;
                        break;
                    }
                }
            }
            if (!found) {
                if (isarray(level.bosses)) {
                    foreach (bosstype in level.bosses) {
                        foreach (bossinstance in bosstype.instances) {
                            if (isdefined(bossinstance.objidnum) && bossinstance.objidnum == index) {
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
        return;
    }
    if (pingtype == 23) {
        ent = self calloutmarkerping_getent(pingindex);
        if (isdefined(ent) && isdefined(ent.type) && ent.type == "dmz_uav_tower") {
            function_8359cadd253f9604(self, "ping_uav_tower", 1);
        }
        if (isdefined(ent) && isdefined(ent.type) && ent.type == "pmc_cartel_cargo") {
            function_8359cadd253f9604(self, "pmc_pinged_cartel_cargo", 1);
        }
        return;
    }
    if (pingtype == 9) {
        ent = self calloutmarkerping_getent(pingindex);
        if (isagent(ent) || isplayer(ent)) {
            if (isdefined(ent.agent_type)) {
                subcategory = function_f3bb4f4911a1beb2("ai_mp_controller", "agentPers_getAgentPersData", ent, "subcategory");
                if (function_c7496288999ac847(ent.agent_type, subcategory)) {
                    function_8359cadd253f9604(self, "ping_cartel_member", 1);
                }
            }
            function_8359cadd253f9604(self, "ping_enemy", 1);
            if (isdefined(ent.bossname)) {
                function_8359cadd253f9604(self, "ping_boss", 1);
            }
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xee0b
// Size: 0x41
function private ongascanrefuel(vehicle, palfagascan) {
    if (!function_6f6cc16c0528de5b(self)) {
        return;
    }
    function_8359cadd253f9604(self, "gas_can_refuel", 1);
    if (istrue(palfagascan)) {
        function_8359cadd253f9604(self, "refuel_palfa", 1);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xee54
// Size: 0x8a
function private onvehiclesiphoned(vehicle, palfagascan) {
    if (!function_6f6cc16c0528de5b(self) || !isdefined(vehicle) || istrue(palfagascan)) {
        return;
    }
    if (!isdefined(vehicle.var_46708a9a93d3dd28)) {
        vehicle.var_46708a9a93d3dd28 = [];
    }
    id = scripts\mp\utility\player::getuniqueid();
    if (istrue(vehicle.var_46708a9a93d3dd28[id])) {
        return;
    }
    vehicle.var_46708a9a93d3dd28[id] = 1;
    function_8359cadd253f9604(self, "siphon_gas", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xeee6
// Size: 0xa5
function private function_1236e9842df9aa2f(camera) {
    foreach (locname, struct in level.map2map.warpstructs) {
        var_82ffc17c45523d42 = struct.useprompt.trigger;
        if (ispointinvolume(camera.origin, var_82ffc17c45523d42)) {
            function_8359cadd253f9604(self, "plant_camera_" + locname, 1);
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xef93
// Size: 0x4f
function private function_b09c81ea055c4c31() {
    var_ccaa9cfd2b7b3856 = getstructarray("pmc_smuggling_tunnel_entrance", "script_noteworthy");
    if (!isdefined(var_ccaa9cfd2b7b3856) || var_ccaa9cfd2b7b3856.size == 0) {
        return;
    }
    level.var_ccaa9cfd2b7b3856 = var_ccaa9cfd2b7b3856;
    level thread function_280edf3f47535ae9("pmc_smuggling_tunnels_trigger", "script_noteworthy", "locate_smuggling_tunnels");
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xefea
// Size: 0xc8
function private function_e6fc5a0cc74883ef(camera) {
    closestentrance = sortbydistance(level.var_ccaa9cfd2b7b3856, camera.origin)[0];
    if (!isdefined(camera.ownerteam)) {
        return;
    }
    if (!isdefined(closestentrance.used)) {
        closestentrance.used = [];
    }
    if (isdefined(closestentrance.used[camera.ownerteam])) {
        return;
    }
    if (distancesquared(camera.origin, closestentrance.origin) > 360000) {
        return;
    }
    closestentrance.used[camera.ownerteam] = 1;
    function_8359cadd253f9604(self, "plant_tac_cam_smuggling_tunnels", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xf0ba
// Size: 0x316
function private onuseuploadstation(player) {
    if (!isdefined(player.team)) {
        return 0;
    }
    if (!isdefined(self.var_68fa0b06cbf0a443)) {
        self.var_68fa0b06cbf0a443 = [];
    }
    if (scripts\cp_mp\utility\game_utility::function_ee0c2958aa2ee59e()) {
        if (istrue(level.laserroom.var_7a7997ebb531cb5b[player.guid])) {
            level thread function_1115d65bd80653e6(self, player, 10000, "upload_reset_lasers", &function_3ce8c941726c2400);
            return 1;
        }
    }
    var_4e55fc12323ff73e = function_16ae6d8b5f25f31b("microphone_story");
    if (function_c5e0bac8f123cc88(player.team, var_4e55fc12323ff73e)) {
        if (istrue(teams::getteamdata(player.team, "placed_microphone"))) {
            duration = 10000;
            successevent = "upload_eavesdropped_audio";
            level thread function_1115d65bd80653e6(self, player, duration, successevent);
            return 1;
        }
    }
    if (isdefined(self.poi)) {
        if (function_c5e0bac8f123cc88(player.team, function_16ae6d8b5f25f31b("radio_uploads_story"))) {
            if ((self.poi == "sealion_coastalruins" || self.poi == "sealion_residential" || self.poi == "saba_observatory") && player namespace_aead94004cf4c147::function_d63a7299c6203bf9(19224)) {
                switch (self.poi) {
                case #"hash_b74d2013e0a73b91":
                    duration = 45000;
                    successevent = "upload_legion_intel_2";
                    break;
                case #"hash_202632819760f0f3":
                    duration = 60000;
                    successevent = "upload_legion_intel_3";
                    break;
                default:
                    duration = 30000;
                    successevent = "upload_legion_intel_1";
                    break;
                }
                level thread function_1115d65bd80653e6(self, player, duration, successevent);
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0xf3d8
// Size: 0xf9
function private function_1115d65bd80653e6(instance, player, duration, successevent, var_35203142d72cdc41) {
    namespace_e1bfa87a2a692d3c::function_94f937f05d8740c8(instance, player);
    if (!istrue(instance.successfuluse)) {
        return;
    }
    instance.var_68fa0b06cbf0a443[player.guid] = 1;
    faketask = spawnstruct();
    faketask.var_bf7f7683ea10da26 = &function_6012affe882a1565;
    faketask.var_35203142d72cdc41 = var_35203142d72cdc41;
    faketask.instance = instance;
    faketask.successevent = successevent;
    faketask.origin = instance.origin;
    faketask createprogressbar("ui_map_icon_obj_intel", (0, 0, 50));
    faketask thread namespace_e1bfa87a2a692d3c::domflag_update(player.team, instance, faketask.objidnum, duration);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xf4d9
// Size: 0xaf
function private function_6012affe882a1565(team) {
    foreach (player in teams::getteamdata(team, "players")) {
        scripts\mp\objidpoolmanager::function_26259bd38697b5ad(self.objidnum, player);
    }
    scripts\mp\gameobjects::releaseid();
    function_8a7a2427622e7572(team, self.successevent, 1);
    if (isdefined(self.var_35203142d72cdc41)) {
        [[ self.var_35203142d72cdc41 ]](self.capturingplayer);
    }
    self notify("task_ended");
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf590
// Size: 0x24
function function_a3e1795e126d3738(player) {
    if (!function_cff2f4f168b29b81()) {
        return;
    }
    function_8359cadd253f9604(player, "plant_tac_cam_core_room", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf5bc
// Size: 0x4f
function function_800f75fe5e5c7462(player, triggeredtrap) {
    if (!function_cff2f4f168b29b81()) {
        return;
    }
    if (isdefined(triggeredtrap.poi)) {
        if (triggeredtrap.poi == "sealion_castle") {
            function_8359cadd253f9604(player, "trigger_trapper_trap", 1);
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf613
// Size: 0xf6
function function_ec8a620f07dbcb21() {
    level endon("game_ended");
    if (!scripts\cp_mp\utility\game_utility::function_ffbbb4525b11d5a2()) {
        return;
    }
    if (!function_cff2f4f168b29b81()) {
        return;
    }
    var_aaf949c4c3315031 = [];
    var_39de31482ab57867 = getent("lv1_generator_room", "script_noteworthy");
    while (true) {
        foreach (player in level.players) {
            if (isdefined(player) && isdefined(player.guid) && isalive(player) && !isdefined(var_aaf949c4c3315031[player.guid]) && player istouching(var_39de31482ab57867)) {
                function_8359cadd253f9604(player, "locate_generator_room", 1);
                var_aaf949c4c3315031[player.guid] = 1;
            }
        }
        wait 1;
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xf711
// Size: 0x4f
function private onPopTire(player, isenemy) {
    if (!isenemy) {
        return;
    }
    minspeed = getdvarfloat(@"hash_e85d50ef5e31422", 10);
    if (self vehicle_getspeed() < minspeed) {
        return;
    }
    function_8359cadd253f9604(player, "pop_enemy_player_vehicle_tire", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xf768
// Size: 0x8d
function private onShatterWindow(damagedata) {
    if (!isdefined(damagedata) || !isdefined(damagedata.attacker) || !isplayer(damagedata.attacker)) {
        return;
    }
    if (!scripts\cp_mp\vehicles\vehicle::vehicle_isenemytoplayer(self, damagedata.attacker)) {
        return;
    }
    minspeed = getdvarfloat(@"hash_e85d50ef5e31422", 10);
    if (self vehicle_getspeed() < minspeed) {
        return;
    }
    function_8359cadd253f9604(damagedata.attacker, "shatter_enemy_vehicle_window", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xf7fd
// Size: 0x8a
function private onSignalExfil(player, exfilstruct) {
    if (!isdefined(self.pmcused)) {
        self.pmcused = [];
    }
    if (isdefined(self.pmcused[player.team])) {
        return;
    }
    self.pmcused[player.team] = 1;
    function_8359cadd253f9604(player, "signal_any_exfil", 1);
    if (istrue(exfilstruct.personalexfil)) {
        return;
    }
    function_8359cadd253f9604(player, "signal_unique_exfil", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xf88f
// Size: 0x28
function private function_825c9ca2bbc7169f() {
    level thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("exfil_tracking_story"), (-8980, 4681, 405), 11206, 4);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xf8bf
// Size: 0xe1
function private onSpawnExfilHeli(var_7e6513b2ae0d5c1d) {
    if (!scripts\cp_mp\utility\game_utility::function_7ee65fae13124702()) {
        return;
    }
    trackerprompt = spawnscriptable("dmz_pmc_place_exfil_tracker", self.origin);
    trackerprompt.var_7e6513b2ae0d5c1d = var_7e6513b2ae0d5c1d;
    trackerprompt utility::function_6e506f39f121ea8a(self, (-150, 105, -211.5), (180, 270, 20));
    trackerprompt function_ab5c0b42f31a0d20(function_16ae6d8b5f25f31b("exfil_tracking_story"));
    if (isdefined(self.callingteam)) {
        foreach (player in teams::getteamdata(self.callingteam, "players")) {
            trackerprompt disablescriptableplayeruse(player);
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0xf9a8
// Size: 0x9e
function private function_8db9f46c5668c0af(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    hastracker = istrue(player namespace_aead94004cf4c147::function_6f39f9916649ac48(11206, 1));
    if (!hastracker) {
        player scripts\mp\hud_message::showerrormessage("PMC/NO_TRACKING_DEVICES_IN_BACKPACK");
        return;
    }
    instance setscriptablepartstate(part, "visible_unusable");
    event = ter_op(istrue(instance.var_7e6513b2ae0d5c1d), "final_exfil_heli_plant", "exfil_heli_plant");
    function_8359cadd253f9604(player, event, 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xfa4e
// Size: 0xe4
function private function_81365960be26e970() {
    cachespawn = getstruct("pmc_boating_and_entering_cache", "script_noteworthy");
    if (!isdefined(cachespawn) || !isdefined(cachespawn.origin)) {
        return;
    }
    level.var_9e5144fe5a8d9020 = 0;
    level.var_f9dc2c104ad6d123 = spawnscriptable("br_loot_cache_lege", cachespawn.origin, default_to(cachespawn.angles, (0, 0, 0)));
    level.var_f9dc2c104ad6d123 scripts\mp\gametypes\br_lootcache::function_d683a60016231237(19241, 1);
    level.var_f9dc2c104ad6d123.var_c93ea8f612f4aaba = 1;
    level.var_e64e215320ea7ca1 = level.var_f9dc2c104ad6d123 namespace_58dcf42cf567f34f::lockedcache_lock(level.var_f9dc2c104ad6d123.origin + (0, 0, 20), "generic_no_key");
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xfb3a
// Size: 0xdf
function private function_c10af6c88ee96f56(player) {
    if (istrue(level.var_2c791a3626339e6)) {
        return;
    }
    level.var_2c791a3626339e6 = 1;
    level endon("caves_event_disabled");
    level.var_2d313239a1fedc04 = player.team;
    playerorigin = player.origin;
    wait 2;
    playsoundatpos(sortbydistance(level.var_12177faddacf1082, playerorigin)[0].origin, "mp_dmz_alrm_trap");
    wait 180;
    function_e469bcf32854cc04();
    reinforcebreaker = sortbydistance(level.var_12177faddacf1082, (-3642.89, -94.2525, 433.417))[0];
    playsoundatpos(reinforcebreaker.origin, "mp_dmz_alrm_trap");
    function_8ad0dc3070480b2b(reinforcebreaker.origin, 6, "sealion_beachclub");
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0xfc21
// Size: 0xcd
function private function_71b0774fb2e6261f(instance, part, state, player, var_a5b2c541413aa895, usestring) {
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
    player thread scripts\mp\gametypes\br_pickups::playerplaypickupanim();
    level thread function_c10af6c88ee96f56(player);
    level.var_9e5144fe5a8d9020++;
    if (level.var_9e5144fe5a8d9020 >= 9) {
        level thread function_3a8deba1c5443f74();
    }
    function_8a7a2427622e7572(level.var_2d313239a1fedc04, "sealion_electric_breaker", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xfcf6
// Size: 0x9c
function private function_e469bcf32854cc04() {
    foreach (scriptable in level.var_12177faddacf1082) {
        state = scriptable getscriptablepartstate("electrical_box");
        if (state == "on") {
            scriptable setscriptablepartstate("electrical_box", "unusable_on");
            continue;
        }
        if (state == "off") {
            scriptable setscriptablepartstate("electrical_box", "unusable_off");
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xfd9a
// Size: 0xca
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
        var_27e49251bb3376ea scripts\cp_mp\calloutmarkerping::calloutmarkerping_createcallout(19, (0, 0, 100), level.var_f9dc2c104ad6d123.index);
    }
    waittillframeend();
    function_e469bcf32854cc04();
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xfe6c
// Size: 0x28
function private function_fe20dc47d6a83b30() {
    level thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("biolabs_harddrive_story"), (-8980, 4681, 405), 19240, 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xfe9c
// Size: 0x80
function private function_8305df6d2c121acb() {
    var_651c7ab3f07b0718 = getstruct("pmc_server_room_computer", "script_noteworthy");
    if (!isdefined(var_651c7ab3f07b0718)) {
        return;
    }
    level.var_adc92e54d3179af = spawnscriptable("dmz_pmc_place_harddrive", var_651c7ab3f07b0718.origin, var_651c7ab3f07b0718.angles);
    level.var_adc92e54d3179af createprogressbar("ui_map_icon_obj_intel", (0, 0, 5));
    level.var_adc92e54d3179af thread function_c1c1f536ab7b9c6b();
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0xff24
// Size: 0x42
function private function_23b4bc828cd125ea(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    level thread function_8df84ba9405587b(instance, part, state, player, var_a5b2c541413aa895, usestring);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0xff6e
// Size: 0x2b0
function private function_8df84ba9405587b(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (!isdefined(player) || !isdefined(player.team)) {
        return;
    }
    var_870b7252d19b6b4 = 0;
    var_cf727733e585e945 = istrue(player namespace_aead94004cf4c147::function_6f39f9916649ac48(19240, 1));
    if (!var_cf727733e585e945) {
        var_870b7252d19b6b4 = istrue(player namespace_aead94004cf4c147::function_6f39f9916649ac48(19241, 1));
        if (!var_870b7252d19b6b4) {
            player scripts\mp\hud_message::showerrormessage("PMC_S2/CANT_USE_THIS");
            return;
        }
    }
    player thread scripts\mp\gametypes\br_pickups::playerplaypickupanim();
    instance setscriptablepartstate(part, "visible_unusable");
    objidnum = level.var_adc92e54d3179af.objidnum;
    level.var_9629782fe725d345 = player.team;
    scripts\mp\objidpoolmanager::objective_teammask_single(objidnum, player.team);
    instance notify("download_started");
    instance thread function_2ae7954a827cf6a1();
    progress = 0;
    wavenum = 0;
    while (progress < 150) {
        if (level.var_cae5a4efc6320920.size > 0) {
            progress += level.framedurationseconds;
        }
        if (wavenum < 1 && progress > 4) {
            function_22fa1e423c72c2a(1250);
            wavenum = 1;
        } else if (wavenum < 2 && progress > 50) {
            function_22fa1e423c72c2a(2500);
            wavenum = 2;
        } else if (wavenum < 3 && progress > 100) {
            function_22fa1e423c72c2a(4000);
            wavenum = 3;
        }
        objective_setprogress(objidnum, clamp(progress / 150, 0, 1));
        waitframe();
    }
    foreach (hideplayer in level.var_cae5a4efc6320920) {
        scripts\mp\objidpoolmanager::function_26259bd38697b5ad(objidnum, hideplayer);
    }
    instance notify("download_ended");
    instance setscriptablepartstate(part, "invisible_unusable");
    tospawn = ter_op(var_cf727733e585e945, "brloot_black_mous_harddrive_downloaded", "brloot_experiment_harddrive_decrypted");
    newdrive = spawnscriptable(tospawn, instance.origin, instance.angles);
    scripts\mp\gametypes\br_pickups::registerscriptableinstance(newdrive);
    newdrive.criticalitem = 1;
    while (isdefined(newdrive)) {
        waitframe();
    }
    scripts\mp\objidpoolmanager::objective_playermask_hidefromall(objidnum);
    wait 2;
    instance thread function_c1c1f536ab7b9c6b();
    instance setscriptablepartstate(part, "invisible_usable");
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x10226
// Size: 0x4f
function private function_22fa1e423c72c2a(radius) {
    playsoundatpos(level.var_adc92e54d3179af.origin, "mp_dmz_alrm_trap");
    namespace_bfef6903bca5845d::function_353fecd1549f5f42(level.var_adc92e54d3179af.origin, radius, level.var_4b195d3dd0024b9c, 4);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1027d
// Size: 0x1d4
function private function_2ae7954a827cf6a1() {
    self endon("download_ended");
    origin = level.var_adc92e54d3179af.origin;
    objidnum = level.var_adc92e54d3179af.objidnum;
    level.var_cae5a4efc6320920 = [];
    while (true) {
        nearby = [];
        foreach (player in level.players) {
            if (isdefined(player.origin) && is_equal(player.team, level.var_9629782fe725d345) && distancesquared(origin, player.origin) < 122500) {
                nearby[nearby.size] = player;
            }
        }
        newnearby = array_difference(nearby, level.var_cae5a4efc6320920);
        var_ea6b4eeeaea5cdc3 = array_difference(level.var_cae5a4efc6320920, nearby);
        foreach (player in newnearby) {
            scripts\mp\objidpoolmanager::function_ce702e5925e31fc9(objidnum, player, 2, 2, %DMZ/UPLOAD_STATION_PROGRESS);
        }
        foreach (player in var_ea6b4eeeaea5cdc3) {
            scripts\mp\objidpoolmanager::function_26259bd38697b5ad(objidnum, player);
        }
        level.var_cae5a4efc6320920 = nearby;
        wait 1;
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x10459
// Size: 0x219
function private function_c1c1f536ab7b9c6b() {
    self endon("download_started");
    if (!scripts\mp\flags::gameflag("prematch_done")) {
        level scripts\mp\flags::gameflagwait("prematch_done");
    }
    foreach (player in level.players) {
        self disablescriptableplayeruse(player);
    }
    origin = level.var_adc92e54d3179af.origin;
    objidnum = level.var_adc92e54d3179af.objidnum;
    canuseplayers = [];
    while (true) {
        var_b39a5638271f4b06 = [];
        foreach (player in level.players) {
            if (isdefined(player.origin) && distancesquared(origin, player.origin) < 122500 && (player namespace_aead94004cf4c147::function_d63a7299c6203bf9(19240) || player namespace_aead94004cf4c147::function_d63a7299c6203bf9(19241))) {
                var_b39a5638271f4b06[var_b39a5638271f4b06.size] = player;
            }
        }
        newcanuse = array_difference(var_b39a5638271f4b06, canuseplayers);
        var_e46940998b5c5eca = array_difference(canuseplayers, var_b39a5638271f4b06);
        foreach (player in newcanuse) {
            self enablescriptableplayeruse(player);
        }
        foreach (player in var_e46940998b5c5eca) {
            self disablescriptableplayeruse(player);
        }
        canuseplayers = var_b39a5638271f4b06;
        wait 1;
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1067a
// Size: 0xf1
function private function_bdfd9501e21e7259() {
    if (!scripts\cp_mp\utility\game_utility::function_7ee65fae13124702()) {
        return;
    }
    scripts\common\callbacks::add("player_connect", &function_2f274301f86d64e0);
    scripts\engine\scriptable::scriptable_addusedcallbackbypart("dmz_train_tracking_placement", &function_10545602cd6cf0a9);
    missionid = function_16ae6d8b5f25f31b("track_train_story");
    level thread function_315e9c3a5fb405e5(missionid, (22656, -55352, 696), 11206, 9);
    if (!scripts\mp\flags::gameflag("prematch_done")) {
        level scripts\mp\flags::gameflagwait("prematch_done");
    }
    flag_wait("wztrain_scriptables_spawned");
    foreach (scriptable in getentitylessscriptablearray(undefined, undefined, undefined, undefined, "dmz_train_tracking_placement")) {
        scriptable setscriptablepartstate("dmz_train_tracking_placement", "invisible_usable");
        scriptable function_ab5c0b42f31a0d20(missionid);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x10773
// Size: 0x6d
function private function_10545602cd6cf0a9(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (!istrue(player namespace_aead94004cf4c147::function_6f39f9916649ac48(11206, 1))) {
        player scripts\mp\hud_message::showerrormessage("PMC/NO_TRACKING_DEVICES_IN_BACKPACK");
        return;
    }
    instance setscriptablepartstate(part, "visible_unusable");
    function_8359cadd253f9604(player, "plant_tracker_cargo_train", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x107e8
// Size: 0xa2
function private function_2f274301f86d64e0(params) {
    self endon("disconnect");
    if (!isdefined(self.team) || !function_c5e0bac8f123cc88(self.team, function_16ae6d8b5f25f31b("track_train_story"))) {
        return;
    }
    flag_wait("wztrain_array_set");
    oldtrain = undefined;
    while (true) {
        newtrain = scripts\cp_mp\utility\train_utility::function_31156831afc882ad();
        if (isdefined(newtrain) && !is_equal(newtrain, oldtrain) && newtrain == "cargo_train") {
            function_8359cadd253f9604(self, "get_on_cargo_train", 1);
            return;
        }
        oldtrain = newtrain;
        wait 1;
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x10892
// Size: 0x1a
function private function_3cb0e100c1dc6f26() {
    level thread function_280edf3f47535ae9("pmc_sealion_castle_trigger", "script_noteworthy", "locate_sealion_castle");
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x108b4
// Size: 0x28
function private function_caabc88d74ae0ae3() {
    level thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("instructions_story"), (22656, -55352, 696), 19233, 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x108e4
// Size: 0x71
function private function_47c562560e28ebc7() {
    promptspawn = getstruct("pmc_atc_console", "script_noteworthy");
    if (!isdefined(promptspawn)) {
        return;
    }
    if (!scripts\mp\flags::gameflag("prematch_done")) {
        level scripts\mp\flags::gameflagwait("prematch_done");
    }
    prompt = spawnscriptable("dmz_pmc_call_in_plane", promptspawn.origin);
    prompt function_ab5c0b42f31a0d20(function_16ae6d8b5f25f31b("destroy_plane_story"));
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x1095d
// Size: 0x9e
function private function_969b576411f99ad(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (!isdefined(player.team) || !function_c5e0bac8f123cc88(player.team, function_16ae6d8b5f25f31b("destroy_plane_story"))) {
        player scripts\mp\hud_message::showerrormessage("PMC_S2/CANT_USE_THIS");
        instance disablescriptableplayeruse(player);
        return;
    }
    instance setscriptablepartstate(part, "invisible_unusable");
    function_8359cadd253f9604(player, "destroy_plane_call_in", 1);
    level thread function_700e4f86ff237db();
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x10a03
// Size: 0x4d
function private function_700e4f86ff237db() {
    plane = namespace_7afff53e7b73476b::function_9c57f5d58c4333ce();
    plane setscriptablepartstate("objective", "active_red");
    plane endon("deleted");
    plane waittill("plane_hit", team);
    function_8a7a2427622e7572(team, "destroy_plane_destroy", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x10a58
// Size: 0x11d
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
    if (!scripts\mp\flags::gameflag("prematch_done")) {
        level scripts\mp\flags::gameflagwait("prematch_done");
    }
    destination.prompt function_ab5c0b42f31a0d20(function_16ae6d8b5f25f31b("transport_bomb_story"));
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x10b7d
// Size: 0x594
function private function_63603418e8aa6cfa() {
    self endon("delete");
    destination = level.var_4b66829e86ada86;
    if (!scripts\mp\flags::gameflag("prematch_done")) {
        level scripts\mp\flags::gameflagwait("prematch_done");
    }
    endtime = gettime() + 300000;
    var_95390aefe43f2fc7 = [];
    var_95390aefe43f2fc7[10000] = ["dmz_bombsite_warning_beep_05", 0.5];
    var_95390aefe43f2fc7[30000] = ["dmz_bombsite_warning_beep_04", 1.5];
    var_95390aefe43f2fc7[60000] = ["dmz_bombsite_warning_beep_03", 3];
    var_95390aefe43f2fc7[150000] = ["dmz_bombsite_warning_beep_02", 5];
    var_95390aefe43f2fc7[300000] = ["dmz_bombsite_warning_beep_01", 7];
    hasplanted = [];
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
        wait waittime;
        if (isdefined(level.var_75434aa809a31eb6) && isdefined(level.var_75434aa809a31eb6.team) && !istrue(hasplanted[level.var_75434aa809a31eb6.team]) && distance(self.origin, destination.origin) < 200) {
            hasplanted[level.var_75434aa809a31eb6.team] = 1;
            function_8359cadd253f9604(level.var_75434aa809a31eb6, "transport_bomb_plant", 1);
        }
    }
    pmc_explosion(self.origin, self);
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
        return;
    }
    if (isdefined(level.var_58ea889cd5f8ae84.playercontents)) {
        if (!isdefined(level.var_75434aa809a31eb6) || !isdefined(level.var_75434aa809a31eb6.guid)) {
            return;
        }
        guid = level.var_75434aa809a31eb6.guid;
        if (!isdefined(level.var_58ea889cd5f8ae84.playercontents[guid]) || !isdefined(level.var_58ea889cd5f8ae84.playercontents[guid].contents)) {
            return;
        }
        foreach (index, item in level.var_58ea889cd5f8ae84.playercontents[guid].contents) {
            if (item["lootID"] == 19215) {
                level.var_58ea889cd5f8ae84.playercontents[guid].contents[index]["lootID"] = 0;
                level.var_58ea889cd5f8ae84.playercontents[guid].contents[index]["quantity"] = 0;
            }
        }
        return;
    }
    if (isdefined(level.var_58ea889cd5f8ae84.contents)) {
        foreach (index, item in level.var_58ea889cd5f8ae84.contents) {
            if (item["lootID"] == 19215) {
                level.var_58ea889cd5f8ae84.contents[index]["lootID"] = 0;
                level.var_58ea889cd5f8ae84.contents[index]["quantity"] = 0;
            }
        }
        return;
    }
    if (level.var_58ea889cd5f8ae84 function_73cc0f04c4c5001d()) {
        scripts\mp\gametypes\br_pickups::deregisterscriptableinstance(level.var_58ea889cd5f8ae84);
        level.var_58ea889cd5f8ae84 freescriptable();
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x11119
// Size: 0x6b
function private function_80e7bbf0a2202b9b(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    bombindex = player namespace_aead94004cf4c147::function_e05897f5d860188e(19215, undefined, 1);
    if (!isdefined(bombindex)) {
        player scripts\mp\hud_message::showerrormessage("PMC_S2/PLACE_ERR_MSG");
        return;
    }
    player thread scripts\mp\gametypes\br_pickups::quickdropitem(10, bombindex);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1118c
// Size: 0x3b
function private onconnect(params) {
    if (scripts\cp_mp\utility\game_utility::function_ffbbb4525b11d5a2()) {
        function_8359cadd253f9604(self, "infil_biolabs", 1);
    }
    if (scripts\cp_mp\utility\game_utility::function_ee0c2958aa2ee59e()) {
        function_8359cadd253f9604(self, "infil_biobunker", 1);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x111cf
// Size: 0x45
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1121c
// Size: 0x6e
function private function_239568ca276a3ae6() {
    if (!isdefined(self) || !isdefined(self.origin)) {
        function_fcceb181033ee1ef();
        return;
    }
    dropinfo = scripts\mp\gametypes\br_pickups::getitemdropinfo(self.origin, self.angles);
    bomb = scripts\mp\gametypes\br_pickups::spawnpickup("brloot_explosive_charge", dropinfo, 1);
    ondropbomb(bomb, self, dropinfo.origin);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x11292
// Size: 0x13
function private function_fcceb181033ee1ef() {
    level.var_a3f54943d4b96da2 notify("delete");
    return false;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x112ae
// Size: 0x23
function private function_d3ac71d99075cecd(player, item) {
    level.var_a3f54943d4b96da2 notify("delete");
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x112d9
// Size: 0xbc
function private ondropbomb(scriptable, owner, finalorigin) {
    level.var_a3f54943d4b96da2 unlink();
    if (isdefined(finalorigin)) {
        level.var_a3f54943d4b96da2.origin = finalorigin;
    }
    if (isdefined(scriptable) && isdefined(scriptable.linkedparent)) {
        level.var_a3f54943d4b96da2 linkto(scriptable.linkedparent);
    }
    level.var_58ea889cd5f8ae84 = scriptable;
    if (distance(scriptable.origin, level.var_4b66829e86ada86.origin) < 200) {
        playsoundatpos(scriptable.origin, "dmz_mission_bomb_arm");
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1139d
// Size: 0x88
function private function_e71ca8a81f647309(container, owner) {
    level.var_a3f54943d4b96da2 unlink();
    if (isdefined(container)) {
        if (isdefined(container.origin)) {
            level.var_a3f54943d4b96da2.origin = container.origin;
        }
        if (isdefined(container.linkedparent)) {
            level.var_a3f54943d4b96da2 linkto(container.linkedparent);
        }
    }
    level.var_58ea889cd5f8ae84 = container;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1142d
// Size: 0xdb
function private function_fe936ca269bd714d(deaddrop, lootid) {
    if (isdefined(self.var_2fa5b49969def47) && isdefined(self.var_2fa5b49969def47.origin) && isdefined(self.team)) {
        function_fcceb181033ee1ef();
        return function_a28e5fe14b06de35(self.var_2fa5b49969def47, 19215);
    }
    level.var_a3f54943d4b96da2 unlink();
    if (isdefined(self.var_2fa5b49969def47) && isdefined(self.var_2fa5b49969def47.origin)) {
        level.var_a3f54943d4b96da2.origin = self.var_2fa5b49969def47.origin;
    }
    level.var_58ea889cd5f8ae84 = self.var_2fa5b49969def47;
    return [19215, 1];
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x11511
// Size: 0x79
function private onpickupbomb(scriptable, player) {
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x11592
// Size: 0x25e
function private function_f8d258990c78569(lootid) {
    if (!scripts\cp_mp\utility\game_utility::function_7ee65fae13124702() && !scripts\cp_mp\utility\game_utility::function_e21746abaaaf8414()) {
        return [lootid, undefined];
    }
    if (!isdefined(self.var_2fa5b49969def47.playercontents) || !isdefined(self.var_2fa5b49969def47.playercontents[self.guid])) {
        return [lootid, undefined];
    }
    var_6152ab3d3d329811 = [8408, 9104, 8569];
    founditems = [];
    foreach (item in var_6152ab3d3d329811) {
        if (item == lootid) {
            continue;
        }
        var_ecabdc27d567d5a1 = scripts\mp\loot::getIndexForLootIDInContainer(self.var_2fa5b49969def47, item, self);
        _ = var_ecabdc27d567d5a1[1];
        itemindex = var_ecabdc27d567d5a1[0];
        if (!isdefined(itemindex)) {
            return [lootid, 1];
        }
        founditems[founditems.size] = itemindex;
    }
    if (istrue(level.var_16677a8421e20c23)) {
        self.var_2fa5b49969def47 thread function_5a9dc1917ed8bcdf(self);
        return [lootid, undefined];
    }
    foreach (itemindex in founditems) {
        self.var_2fa5b49969def47.playercontents[self.guid].contents[itemindex]["quantity"] = self.var_2fa5b49969def47.playercontents[self.guid].contents[itemindex]["quantity"] - 1;
        self.var_2fa5b49969def47.playercontents[self.guid].contents[itemindex]["noExtract"] = undefined;
    }
    namespace_92fc655e328c1a9f::function_ce9b69fc041571d2(self, self.var_2fa5b49969def47);
    function_f40c67796c17fbcb();
    return [21646, 1];
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x117f9
// Size: 0x20
function function_5a9dc1917ed8bcdf(player) {
    self waittill("closed");
    player scripts\mp\hud_message::showerrormessage("PMC_S2/SOMEONE_ALREADY_MADE_RADIOACTIVE_CHARGE");
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x11821
// Size: 0x8e
function private function_f40c67796c17fbcb() {
    if (!namespace_7789f919216d38a2::radiation_isInit()) {
        return;
    }
    level.var_16677a8421e20c23 = 1;
    level.var_9c0e86c22acf2968 = 1;
    scriptable = spawnscriptable("dmz_pmc_use_radiation", namespace_7789f919216d38a2::radiation_getorigin());
    startingstate = ter_op(scripts\cp_mp\utility\game_utility::function_7ee65fae13124702(), "usable_saba", "usable_sealion");
    scriptable setscriptablepartstate("dmz_pmc_use_radiation", startingstate);
    scriptable function_ab5c0b42f31a0d20(function_16ae6d8b5f25f31b("radiation_bomb_story"));
    function_f8f2890a42f13746();
    level thread function_f65b07ef19699719();
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x118b7
// Size: 0x254
function private function_f65b07ef19699719() {
    level.var_6ceeaaa97aa7c2e9 = 0;
    canseeprogressbar = [];
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
            newcansee = array_difference(var_e01568fe8f58645b, canseeprogressbar);
            var_5008853324a21a45 = array_difference(canseeprogressbar, var_e01568fe8f58645b);
            foreach (player in newcansee) {
                scripts\mp\objidpoolmanager::function_ce702e5925e31fc9(level.var_d21f44d30e9fbcae, player, 2, 2, %PMC_S2/ARMING_BOMB);
            }
            foreach (player in var_5008853324a21a45) {
                scripts\mp\objidpoolmanager::function_26259bd38697b5ad(level.var_d21f44d30e9fbcae, player);
            }
            canseeprogressbar = var_e01568fe8f58645b;
        }
        wait 1;
    }
    if (isdefined(level.var_d21f44d30e9fbcae)) {
        foreach (player in canseeprogressbar) {
            scripts\mp\objidpoolmanager::function_26259bd38697b5ad(level.var_d21f44d30e9fbcae, player);
        }
        scripts\mp\objidpoolmanager::returnobjectiveid(level.var_d21f44d30e9fbcae);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x11b13
// Size: 0x71
function private function_26c3b83e972a14fd(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (!istrue(player namespace_aead94004cf4c147::function_6f39f9916649ac48(21646, 1))) {
        player scripts\mp\hud_message::showerrormessage("PMC_S2/NO_RADIOACTIVE_CHARGE");
        return;
    }
    instance freescriptable();
    function_8359cadd253f9604(player, "plant_radioactive_charge", 1);
    level thread function_bc2e5c079bf6b8f2(player);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x11b8c
// Size: 0x141
function private function_bc2e5c079bf6b8f2(player) {
    bomb = spawnscriptable("brloot_radioactive_charge", drop_to_ground(player.origin, 50));
    bomb setscriptablepartstate("brloot_radioactive_charge", "unusable");
    function_65932d306cce787e(bomb);
    level.var_e301c40b562dbd9d = player.team;
    objidnum = bomb createprogressbar("ui_map_icon_obj_bomb_collect", (0, 0, 15), level.var_e301c40b562dbd9d);
    level.var_d21f44d30e9fbcae = objidnum;
    progress = 0;
    while (progress < 60) {
        if (istrue(level.var_6ceeaaa97aa7c2e9)) {
            progress += level.framedurationseconds;
            objective_setprogress(objidnum, clamp(progress / 60, 0, 1));
        }
        waitframe();
    }
    level.var_e301c40b562dbd9d = undefined;
    level.var_9c0e86c22acf2968 = undefined;
    pmc_explosion(bomb.origin, default_to(player, bomb), "exp_radiation_boom_c");
    bomb freescriptable();
    namespace_7789f919216d38a2::function_9bc063861b9330f1(10);
    scripts\mp\gametypes\br_gametype_dmz::showdmzsplash("dmz_radiation_damage_increase", level.players);
    function_8359cadd253f9604(player, "explode_radioactive_charge", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x11cd5
// Size: 0x77
function private function_56f9b7d959b1704b(params) {
    if (!isdefined(self) || !isdefined(self.origin)) {
        function_fcceb181033ee1ef();
        return;
    }
    dropinfo = scripts\mp\gametypes\br_pickups::getitemdropinfo(self.origin, self.angles);
    bomb = scripts\mp\gametypes\br_pickups::spawnpickup("brloot_radioactive_charge", dropinfo, 1);
    ondropbomb(bomb, self, dropinfo.origin);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x11d54
// Size: 0xd
function private function_8bd9cfd763bcd0e4() {
    level.var_9c0e86c22acf2968 = undefined;
    return false;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x11d6a
// Size: 0x1d
function private function_2fdfbb52976ba9e(player, item) {
    level.var_9c0e86c22acf2968 = undefined;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x11d8f
// Size: 0x25
function private function_65932d306cce787e(scriptable, owner, finalorigin) {
    level.var_8654b69976fbaee8 = scriptable;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x11dbc
// Size: 0x1d
function private function_23f069dc1bff2ee0(container, owner) {
    level.var_8654b69976fbaee8 = container;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x11de1
// Size: 0x33
function private function_f8f2890a42f13746(deaddrop, lootid) {
    level.var_8654b69976fbaee8 = self.var_2fa5b49969def47;
    return [21646, 1];
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x11e1d
// Size: 0x1d
function private function_3e5ce38e7e8f69(scriptable, player) {
    level.var_8654b69976fbaee8 = player;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11e42
// Size: 0x50
function function_944498dd24bc5348() {
    thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("track_submarines"), (21286, -16750, 3685), 11206, 1, 1);
    thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("track_submarines"), (-72.488, 1721.72, 434.75), 11206, 1, 2);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11e9a
// Size: 0x29
function function_38dd5f365b6d2135() {
    thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("track_biolabs_cargo"), (0, 0, 0), 11206, 7, 4);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11ecb
// Size: 0x29
function function_2345dc4fa1f40628() {
    thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("plant_microphone"), (-7562, 2060, 512), 19217, 1, 2);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11efc
// Size: 0x29
function function_126c379552e5f3b7() {
    thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("microphone_story"), (-72.488, 1721.72, 434.75), 19217, 1, 2);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11f2d
// Size: 0x50
function function_71192f593da6cf() {
    thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("deliver_letter_story"), (-9152.06, -11234.5, 48), 32022, 1, 8);
    thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("deliver_letter_story"), (-9152.06, -11234.5, 48), 11206, 1, 8);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11f85
// Size: 0x50
function function_573c2d675de0604c() {
    thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("phalanx_harddrive_story"), (4467, 8721, 124), 32166, 1, 8);
    thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("phalanx_harddrive_story"), (4297, -11455, 4590), 32132, 1, 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11fdd
// Size: 0x93
function function_285b8dcd4ea4da26() {
    level.var_632f6a89b947fd5 = namespace_e0ee43ef2dddadaa::buildweapon("iw9_ar_akilo", ["rec_akilo", "bar_lm_light_p04_akilo", "stock_ar_p04_akilo", "mag_ar_large_p04_akilo", "holotherm01", "ub_gl_drill_akilo", "ammo_762s", "pgrip_p04", "silencer05_br"]);
    thread function_3079d4d1c0ee380e(function_16ae6d8b5f25f31b("kill_biobunker_bosses_weapon"), (4467, 8721, 124), level.var_632f6a89b947fd5, 8);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12078
// Size: 0x30
function function_8882ca663f07c0cf() {
    boatlocation = getstruct("pmc_spawnrhib", "script_noteworthy");
    if (isdefined(boatlocation)) {
        scripts\cp_mp\vehicles\vehicle::vehicle_spawn("veh9_rhib", boatlocation);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x120b0
// Size: 0xb4
function function_3de41a0f1613060f() {
    scripts\mp\flags::function_1240434f4201ac9d("prematch_done");
    airdroplocation = getstruct("pmc_spawn_jltv_radar", "script_noteworthy");
    if (isdefined(airdroplocation)) {
        missionid = function_16ae6d8b5f25f31b("delta_drive_poi");
        airdrop = spawnscriptable("pmc_airdrop_jltv_radar", airdroplocation.origin);
        airdrop function_ab5c0b42f31a0d20(missionid);
        airdrop setscriptablepartstate("pmc_airdrop_site", "ready");
        airdrop.origin = drop_to_ground(airdroplocation.origin);
        droppedvehicle = scripts\engine\scriptable::scriptable_addusedcallbackbypart("pmc_airdrop_site", &function_9d1f0973f606c702);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1216c
// Size: 0x31
function function_4dd8f8cbcba13e0a() {
    thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("plant_fake_docs"), (4297, -11455, 4590), namespace_38b993c4618e76cd::getlootidfromref("brloot_fake_aq_intel"), 1, 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x121a5
// Size: 0x31
function function_871ab85492b81d67() {
    thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("extract_plant_intel"), (-3419.62, -5825.94, 332), namespace_38b993c4618e76cd::getlootidfromref("brloot_biolab_usb"), 1, 2);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x121de
// Size: 0x31
function function_b4824dfa90ca1ab9() {
    thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("plant_ir_beacon_towers"), (21286, -16750, 3685), namespace_38b993c4618e76cd::getlootidfromref("brloot_ir_beacon"), 2, 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12217
// Size: 0x17
function function_b93ca7db745586f6() {
    if (namespace_76a219af07c28c13::function_6934349b7823d888()) {
        namespace_76a219af07c28c13::registerteamassimilatecallback(&function_4168098f4ad31178);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x12236
// Size: 0x30
function function_4168098f4ad31178(player, oldteam, newteam) {
    if (!isdefined(newteam)) {
        return;
    }
    function_8359cadd253f9604(player, "complete_assimilation", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1226e
// Size: 0x91
function function_924e9e46e918d2ea() {
    level endon("game_ended");
    if (!scripts\mp\flags::gameflag("prematch_done")) {
        level scripts\mp\flags::gameflagwait("prematch_done");
    }
    if (!scripts\cp_mp\utility\game_utility::function_5e0e3a24dbb1fae1()) {
        return;
    }
    spawnnode = getstruct("brloot_valuable_vondelgas", "script_noteworthy");
    dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
    dropinfo = scripts\mp\gametypes\br_pickups::getitemdroporiginandangles(dropstruct, spawnnode.origin, spawnnode.angles);
    scripts\mp\gametypes\br_pickups::spawnpickup("brloot_valuable_vondelgas", dropinfo, 1, 0);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12307
// Size: 0xb2
function function_70280eb87761bcd0() {
    level endon("game_ended");
    if (!scripts\mp\flags::gameflag("prematch_done")) {
        level scripts\mp\flags::gameflagwait("prematch_done");
    }
    if (!scripts\cp_mp\utility\game_utility::function_ee0c2958aa2ee59e()) {
        return;
    }
    id = function_16ae6d8b5f25f31b("gas_sample_story");
    players = function_4e577d33450caee4(id);
    if (!isdefined(players) || players.size <= 0) {
        return;
    }
    spawnnode = getstruct("dmz_pmc_validate_gas", "script_noteworthy");
    useprompt = spawnscriptable("dmz_pmc_validate_gas", spawnnode.origin, spawnnode.angles);
    useprompt function_ab5c0b42f31a0d20(id);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x123c1
// Size: 0xfc
function function_e3b5db8f3422827e(instance, part, state, player, var_a5b2c541413aa895, usestring) {
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x124c5
// Size: 0x71
function private function_9c054602c73df809() {
    blackbox = getstruct("pmc_black_box", "script_noteworthy");
    if (!isdefined(blackbox)) {
        return;
    }
    if (!scripts\mp\flags::gameflag("prematch_done")) {
        level scripts\mp\flags::gameflagwait("prematch_done");
    }
    scriptable = spawnscriptable("dmz_pmc_download_blackbox", blackbox.origin);
    scriptable function_ab5c0b42f31a0d20(function_16ae6d8b5f25f31b("plane_encounter"));
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x1253e
// Size: 0x3d
function private function_e5aa3c571f674bd3(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    instance thread function_7993f38e8643f95d(player);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x12583
// Size: 0x1e8
function private function_7993f38e8643f95d(player) {
    if (istrue(self.downloading)) {
        return;
    }
    self.downloading = 1;
    team = player.team;
    objidnum = createprogressbar("ui_map_icon_obj_scavenger", (0, 0, 20), player.team);
    shownplayers = [];
    foreach (player in teams::getteamdata(team, "players")) {
        self disablescriptableplayeruse(player);
        if (distancesquared(player.origin, self.origin) < 160000) {
            shownplayers[shownplayers.size] = player;
            scripts\mp\objidpoolmanager::function_ce702e5925e31fc9(objidnum, player, 1, 2, %PMC_S2/DOWNLOADING_BLACKBOX);
        }
    }
    namespace_bfef6903bca5845d::function_353fecd1549f5f42(self.origin, 1200, level.var_4b195d3dd0024b9c, 4);
    progress = 0;
    while (progress < 10) {
        progress += level.framedurationseconds;
        objective_setprogress(objidnum, clamp(progress / 10, 0, 1));
        waitframe();
    }
    foreach (player in shownplayers) {
        scripts\mp\objidpoolmanager::function_26259bd38697b5ad(objidnum, player);
    }
    scripts\mp\gameobjects::releaseid();
    if (!isdefined(level.var_e250c5815c2e42f3)) {
        level.var_e250c5815c2e42f3 = [];
    }
    level.var_e250c5815c2e42f3[level.var_e250c5815c2e42f3.size] = team;
    function_8a7a2427622e7572(team, "plane_black_box_download", 1);
    self.downloading = 0;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12773
// Size: 0x9c
function function_f91e78aad103b663() {
    level.var_c891a425bf8cbc28 = namespace_e0ee43ef2dddadaa::buildweapon("iw9_dm_xmike2010", ["ammo_300wm", "bar_sn_light_p20_xmike2010", "bolt_p20", "laserbox_ads01", "mag_sn_p20_xmike2010", "pgrip_p20_xmike2010", "rec_xmike2010", "silencer01_dm", "snscope_therm01", "stock_sn_p20"]);
    thread function_3079d4d1c0ee380e(function_16ae6d8b5f25f31b("chemist_kill_story"), (-26681, 2194, 1915), level.var_c891a425bf8cbc28, 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12817
// Size: 0x78
function function_41c54a1f9c108720() {
    triggers = getstructarray("pmc_getawayvehicle_triggers", "script_noteworthy");
    if (!isdefined(triggers) || triggers.size == 0) {
        return;
    }
    foreach (struct in triggers) {
        thread function_4132600c37883f0b(struct);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12897
// Size: 0x11b
function function_4132600c37883f0b(struct) {
    trigger = spawn("noent_volume_trigger_radius", struct.origin, 0, struct.radius, 100);
    while (true) {
        trigger waittill("trigger", ent);
        if (!ent scripts\cp_mp\vehicles\vehicle::isvehicle()) {
            continue;
        }
        if (ent scripts\cp_mp\vehicles\vehicle::function_d93ec4635290febd() != "veh9_rhib") {
            continue;
        }
        driver = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getdriver(ent);
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x129ba
// Size: 0x23b
function private function_4ad47f789dfad847(container, lootid) {
    if (!scripts\cp_mp\utility\game_utility::function_e21746abaaaf8414() || scripts\mp\gametypes\dead_drop::function_30b30561882a2477(container) != "sealion_waterways") {
        return [lootid, undefined];
    }
    if (!isdefined(self.var_2fa5b49969def47.playercontents) || !isdefined(self.var_2fa5b49969def47.playercontents[self.guid])) {
        return [lootid, undefined];
    }
    var_6152ab3d3d329811 = [19214, 8408, 13372];
    founditems = [];
    foreach (item in var_6152ab3d3d329811) {
        if (item == lootid) {
            continue;
        }
        var_bff06827b42c0dbd = scripts\mp\loot::getIndexForLootIDInContainer(self.var_2fa5b49969def47, item, self);
        _ = var_bff06827b42c0dbd[1];
        itemindex = var_bff06827b42c0dbd[0];
        if (!isdefined(itemindex)) {
            return [lootid, 1];
        }
        founditems[founditems.size] = itemindex;
    }
    foreach (itemindex in founditems) {
        self.var_2fa5b49969def47.playercontents[self.guid].contents[itemindex]["quantity"] = self.var_2fa5b49969def47.playercontents[self.guid].contents[itemindex]["quantity"] - 1;
        self.var_2fa5b49969def47.playercontents[self.guid].contents[itemindex]["noExtract"] = undefined;
    }
    namespace_92fc655e328c1a9f::function_ce9b69fc041571d2(self, self.var_2fa5b49969def47);
    return [19216, 1];
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x12bfe
// Size: 0x204
function private function_a28e5fe14b06de35(container, lootid) {
    if (!isdefined(self.var_2fa5b49969def47.playercontents) || !isdefined(self.var_2fa5b49969def47.playercontents[self.guid])) {
        return [lootid, undefined];
    }
    var_6152ab3d3d329811 = [19215];
    founditems = [];
    foreach (item in var_6152ab3d3d329811) {
        if (item == lootid) {
            continue;
        }
        var_bff05b27b42bf126 = scripts\mp\loot::getIndexForLootIDInContainer(self.var_2fa5b49969def47, item, self);
        _ = var_bff05b27b42bf126[1];
        itemindex = var_bff05b27b42bf126[0];
        if (!isdefined(itemindex)) {
            return [lootid, 1];
        }
        founditems[founditems.size] = itemindex;
    }
    foreach (itemindex in founditems) {
        self.var_2fa5b49969def47.playercontents[self.guid].contents[itemindex]["quantity"] = self.var_2fa5b49969def47.playercontents[self.guid].contents[itemindex]["quantity"] - 1;
        self.var_2fa5b49969def47.playercontents[self.guid].contents[itemindex]["noExtract"] = undefined;
    }
    namespace_92fc655e328c1a9f::function_ce9b69fc041571d2(self, self.var_2fa5b49969def47);
    return [32107, 1];
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12e0b
// Size: 0x66
function function_45dcf3dfcc5d1674() {
    rods = getentitylessscriptablearray(undefined, undefined, undefined, undefined, "brloot_valuable_fuelrods");
    foreach (rod in rods) {
        namespace_96abc792b7f61807::function_f0d61e14dfde9ccd(rod);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12e79
// Size: 0x18
function function_265739b4859488d7() {
    function_89a7111bd154e223("pmc_observatory_car_crash_trigger", "script_noteworthy", "locate_car_crash");
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12e99
// Size: 0x18
function function_bb6de40dd726b4d9() {
    function_280edf3f47535ae9("pmc_plane_crash_trigger", "script_noteworthy", "locate_plane_crash_site");
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12eb9
// Size: 0x31
function function_359f7f436de6ba09() {
    thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("redacted_1_zero_tolerance"), (-26681, 2194, 1915), namespace_38b993c4618e76cd::getlootidfromref("brloot_cartel_intel"), 1, 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12ef2
// Size: 0x31
function function_3c989ad19e62de6c() {
    thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("redacted_3_excavation"), (22656, -55352, 696), namespace_38b993c4618e76cd::getlootidfromref("brloot_tracking_device"), 3, 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x12f2b
// Size: 0xdb
function function_88d8597beafdd628(player, poi) {
    if (isdefined(level.squaddata)) {
        poisVisitedACV = squads::getsquaddata(player.team, player.sessionsquadid, "poisVisitedACV");
        if (!isdefined(poisVisitedACV[poi])) {
            function_8359cadd253f9604(player, "poi_travel_acv", 1);
            poisVisitedACV[poi] = 1;
            squads::function_a20a10ce593f692b(player.team, player.sessionsquadid, "poisVisitedACV", poisVisitedACV);
        }
        return;
    }
    poisVisitedACV = teams::getteamdata(player.team, "poisVisitedACV");
    if (!isdefined(poisVisitedACV[poi])) {
        function_8359cadd253f9604(player, "poi_travel_acv", 1);
        poisVisitedACV[poi] = 1;
        teams::setteamdata(player.team, "poisVisitedACV", poisVisitedACV);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1300e
// Size: 0x1a
function function_8706a89fae666d51(player) {
    function_8359cadd253f9604(player, "contract_hacker_use", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x13030
// Size: 0x29
function private function_51bde44b90a1fc39() {
    thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("tracking_activity"), (-9152.06, -11234.5, 48), 30414, 1, 8);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x13061
// Size: 0x6c
function private function_16597cc75de769a6() {
    hasremoved = istrue(namespace_aead94004cf4c147::function_6f39f9916649ac48(30414, 1));
    assert(hasremoved);
    assert(namespace_aead94004cf4c147::function_7e103028c464ab9a(namespace_38b993c4618e76cd::function_b88cfb4893ceedac("<dev string:x742>")));
    assert(namespace_aead94004cf4c147::function_8a160d9935d47f5e("<dev string:x742>", "<dev string:x764>", 1));
    namespace_aead94004cf4c147::addItemToBackpackByRef("brloot_gps_loaded_triangulator", "valuable", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x130d5
// Size: 0xec
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
            if (teammate.var_24acac5a29f2b972 >= 3 && teammate namespace_aead94004cf4c147::function_d63a7299c6203bf9(30414) && scripts\cp_mp\utility\game_utility::function_7ee65fae13124702()) {
                teammate function_16597cc75de769a6();
            }
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x131c9
// Size: 0x1a
function function_2b7cc5d62043202e(player) {
    function_8359cadd253f9604(player, "read_stationary_note", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x131eb
// Size: 0x1a
function function_93ab9968bf96e2b0(player) {
    function_8359cadd253f9604(player, "shopkeeper_trade_success", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1320d
// Size: 0x1a
function function_c2b3319eb135740(player) {
    function_8359cadd253f9604(player, "reward_station_buy_item", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1322f
// Size: 0x86
function function_38d565bd866ced0e(player, deaddrop) {
    dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
    baseorigin = default_to(deaddrop.centerbottom, deaddrop.origin);
    baseangles = deaddrop.angles;
    dropinfo = scripts\mp\gametypes\br_pickups::getitemdroporiginandangles(dropstruct, baseorigin, baseangles, player, undefined);
    scripts\mp\gametypes\br_pickups::spawnpickup("brloot_shop_intel", dropinfo, 1, 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x132bd
// Size: 0x9e
function function_c543832fab9303cb(player, deaddrop) {
    dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
    baseorigin = default_to(deaddrop.centerbottom, deaddrop.origin);
    baseangles = deaddrop.angles;
    dropinfo = scripts\mp\gametypes\br_pickups::getitemdroporiginandangles(dropstruct, baseorigin, baseangles, player, undefined);
    quantity = int(level.var_dab6c0f07f8df447);
    scripts\mp\gametypes\br_pickups::spawnpickup("brloot_shopkeeper_code", dropinfo, quantity, 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x13363
// Size: 0x86
function function_f3f7cf5aa591a391(player, deaddrop) {
    dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
    baseorigin = default_to(deaddrop.centerbottom, deaddrop.origin);
    baseangles = deaddrop.angles;
    dropinfo = scripts\mp\gametypes\br_pickups::getitemdroporiginandangles(dropstruct, baseorigin, baseangles, player, undefined);
    scripts\mp\gametypes\br_pickups::spawnpickup("brloot_valuable_shopkeeper_konni_intel", dropinfo, 1, 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x133f1
// Size: 0x2
function private function_554ec348cfc62f37() {
    
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x133fb
// Size: 0x1a
function function_b49c89ad7edcf17b(player) {
    function_8359cadd253f9604(player, "discover_oasis_bunker_entrance", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1341d
// Size: 0x2d2
function function_a7fb9d5548d2455a() {
    if (!scripts\cp_mp\utility\game_utility::function_ee0c2958aa2ee59e()) {
        return;
    }
    laserroom = spawnstruct();
    level.laserroom = laserroom;
    laserroom.var_7a7997ebb531cb5b = [];
    uploadnode = getstruct("pmc_bunker_upload_station", "script_noteworthy");
    namespace_e1bfa87a2a692d3c::function_2eddefe4d621123b();
    uploadstation = namespace_e1bfa87a2a692d3c::function_443a192943945265(uploadnode, 5);
    cachenode = getstruct("pmc_laser_trap_cache", "script_noteworthy");
    cache = getentitylessscriptablearray(undefined, undefined, cachenode.origin, 50, "body")[0];
    if (!isdefined(cache)) {
        assertmsg("<dev string:x770>");
        return;
    }
    cache.islockedcache = 1;
    cache scripts\mp\gametypes\br_lootcache::function_d683a60016231237(namespace_38b993c4618e76cd::getlootidfromref("brloot_biolabs_evidence"), 1);
    cache.laserroom = laserroom;
    cache.var_534e0cf170a981b7 = &function_901bc7e60ba89f7f;
    laserroom.cache = cache;
    level thread function_4baddf78c907e8f9();
    lasers = getstructarray("pmc_laser_trap", "script_noteworthy");
    config = spawnstruct();
    config.maxhealth = 350;
    config.maxrange = 4000000;
    config.laserrange = 7562500;
    foreach (struct in lasers) {
        turret = namespace_66ade5cda10fe3aa::function_d1acadc2a0b9e115(config, struct, "team_hundred_ninety_five", "electronics_ir_laser_device_assembly_nogeo", "laser_trap_nvg");
        turret setmode("manual");
        turret laseron();
        turret.laserroom = laserroom;
        tag = "tag_laser";
        if (!hastag(turret.model, tag)) {
            tag = "tag_turret";
        }
        var_878bae61aca86fc5 = anglestoforward(struct.angles);
        sentry_origin = turret gettagorigin(tag);
        newpos = sentry_origin + var_878bae61aca86fc5 * 2000;
        trace = scripts\engine\trace::ray_trace(sentry_origin, newpos, turret);
        end = trace["position"];
        turret.aimlocation = end;
        turret function_83ea6f9ebc30c9a4(turret.aimlocation - sentry_origin);
        vmidpoint = (sentry_origin + end) / 2;
        turret thread namespace_66ade5cda10fe3aa::function_a890d51e917ad74(0, vmidpoint);
        turret thread function_a7614ce40d9dbe48();
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x136f7
// Size: 0x333
function function_a7614ce40d9dbe48() {
    level endon("game_ended");
    self endon("death");
    self endon("stop_idle_movement");
    scripts\mp\flags::function_1240434f4201ac9d("prematch_done");
    tag = "tag_laser";
    if (!hastag(self.model, tag)) {
        tag = "tag_turret";
    }
    self.aimlocation = self gettagorigin(tag) + anglestoforward(self gettagangles(tag)) * 3000;
    self.var_7a7997ebb531cb5b = [];
    wait 2;
    var_4a5d9d7667048bf3 = scripts\engine\trace::create_character_contents();
    while (true) {
        start = self gettagorigin("tag_laser");
        nearby_players = sortbydistancecullbyradius(level.players, start, 1024);
        if (nearby_players.size == 0) {
            waitframe();
            continue;
        }
        trace = scripts\engine\trace::ray_trace(start, self.aimlocation);
        end = trace["position"];
        gooddistsq = lengthsquared(start - end);
        trace = scripts\engine\trace::ray_trace(start, end, [], var_4a5d9d7667048bf3);
        if (isdefined(trace["entity"]) && trace["hittype"] == "hittype_entity") {
            if (isplayer(trace["entity"]) && isdefined(trace["entity"].guid)) {
                player = trace["entity"];
                if (isdefined(player) && isplayer(player)) {
                    player.var_230a3287f9ad2965 = 1;
                    player.shouldskipdeathsshield = 1;
                }
                /#
                    printtoscreen2d(50, 50, "<dev string:x79a>", (1, 0, 0));
                #/
                currenttime = gettime();
                if (!isdefined(self.var_7a7997ebb531cb5b[player.guid]) || currenttime - self.var_7a7997ebb531cb5b[player.guid] > 10000) {
                    playsoundatpos(self.origin, "cp_laser_trigger");
                    self.var_7a7997ebb531cb5b[player.guid] = currenttime;
                }
                if (!istrue(self.laserroom.var_7a7997ebb531cb5b[player.guid])) {
                    self.laserroom.var_7a7997ebb531cb5b[player.guid] = 1;
                    scripts\mp\gametypes\br_gametype_dmz::showdmzsplash("dmz_laser_tripped", [player]);
                    if (!isdefined(self.laserroom.triggertime) || currenttime - self.laserroom.triggertime > lookupsoundlength("mp_dmz_alrm_trap")) {
                        playsoundatpos(self.laserroom.cache.origin, "mp_dmz_alrm_trap");
                        self.laserroom.triggertime = currenttime;
                        namespace_bfef6903bca5845d::function_353fecd1549f5f42(level.laserroom.cache.origin, 1500, level.var_4b195d3dd0024b9c, 6);
                    }
                }
            }
        }
        waitframe();
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x13a32
// Size: 0x77
function function_901bc7e60ba89f7f(instance, player) {
    currenttime = gettime();
    if (isdefined(player.guid) && istrue(instance.laserroom.var_7a7997ebb531cb5b[player.guid])) {
        player scripts\mp\hud_message::showerrormessage("MP_DMZ_MISSIONS/GEIGER_SEARCH_GC_CACHE_ERR");
        return 0;
    }
    function_8359cadd253f9604(player, "open_laser_cache", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13ab1
// Size: 0x91
function function_4baddf78c907e8f9() {
    scripts\mp\flags::function_1240434f4201ac9d("prematch_done");
    foreach (player in level.players) {
        if (isdefined(player) && isdefined(player.guid)) {
            level.laserroom.var_7a7997ebb531cb5b[player.guid] = 1;
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13b4a
// Size: 0x53
function function_3ce8c941726c2400(player) {
    if (isdefined(player) && isdefined(player.guid)) {
        level.laserroom.var_7a7997ebb531cb5b[player.guid] = 0;
        scripts\mp\gametypes\br_gametype_dmz::showdmzsplash("dmz_laser_reset", [player]);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13ba5
// Size: 0xef
function function_ab1164302301c233() {
    lootid = namespace_38b993c4618e76cd::getlootidfromref("brloot_flare_stick");
    missionid = function_16ae6d8b5f25f31b("place_biobunker_tac_inserts");
    thread function_315e9c3a5fb405e5(missionid, (-72.488, 1721.72, 434.75), lootid, 4, 2);
    if (!scripts\cp_mp\utility\game_utility::function_ee0c2958aa2ee59e()) {
        return;
    }
    scripts\mp\flags::function_1240434f4201ac9d("prematch_done");
    structs = getstructarray("pmc_plant_flare", "script_noteworthy");
    foreach (struct in structs) {
        place = spawnscriptable("dmz_flare_place", struct.origin, struct.angles);
        place function_ab5c0b42f31a0d20(missionid);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x13c9c
// Size: 0xbf
function function_48a98ebe20dd89f2(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (isdefined(player)) {
        lootid = namespace_38b993c4618e76cd::getlootidfromref("brloot_flare_stick");
        hasitem = istrue(player namespace_aead94004cf4c147::function_6f39f9916649ac48(lootid, 1));
        if (!hasitem) {
            player scripts\mp\hud_message::showerrormessage("PMC_S2/PLACE_ERR_MSG");
            return;
        }
        weapon = makeweapon("flare_dmz_pmc");
        success = player scripts\cp_mp\utility\weapon_utility::giveandfireoffhandreliable(weapon);
        if (istrue(success)) {
            instance disablescriptableplayeruse(player);
            function_8359cadd253f9604(player, "place_flare_stick", 1);
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13d63
// Size: 0x6e
function onFlarePlaced(grenade) {
    if (isdefined(grenade) && isdefined(self)) {
        level.flaresplaced = default_to(level.flaresplaced, 0);
        level.flaresplaced++;
        grenade setscriptablepartstate("smoke", "active");
        if (level.flaresplaced > getdvarint(@"hash_27c2a8e9ee2e06d4", 20)) {
            grenade delete();
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x13dd9
// Size: 0x9b
function private function_7757687df059eb94(teamname) {
    aliveplayers = teams::getteamdata(teamname, "alivePlayers");
    haskey = 0;
    foreach (player in aliveplayers) {
        if (isdefined(player) && !istrue(player.extracted) && player namespace_aead94004cf4c147::function_d63a7299c6203bf9(29514)) {
            haskey = 1;
            break;
        }
    }
    return haskey;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x13e7d
// Size: 0x46
function function_5ff4af6e7a002c62(teamname, var_11807f242097f672) {
    var_ee3d1775b76dc3e9 = 0;
    if (isdefined(var_11807f242097f672.var_b934b77f24f0966e) && isdefined(var_11807f242097f672.var_b934b77f24f0966e[teamname])) {
        var_ee3d1775b76dc3e9 = 1;
    }
    return var_ee3d1775b76dc3e9;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13ecc
// Size: 0xe2
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13fb7
// Size: 0x55
function function_4cba31e79d4e5166(teamname) {
    var_7d0763bc73f02938 = function_6adb8d95823366cb(teamname);
    if (!isdefined(var_7d0763bc73f02938)) {
        return false;
    }
    var_42c0d692e6b1366e = var_7d0763bc73f02938.var_b934b77f24f0966e[teamname];
    var_25a8868785389f9 = gettime() - var_42c0d692e6b1366e < 120000;
    return !var_25a8868785389f9;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x14015
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x14098
// Size: 0x1a6
function function_6245fc3e65911655(var_11807f242097f672, var_694cf27a7080216) {
    level endon("game_ended");
    var_11807f242097f672 endon("death");
    while (true) {
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
                    continue;
                }
                var_11807f242097f672 disablescriptableplayeruse(player);
            }
        }
        var_11807f242097f672 waittill_any_timeout_1(5, "cutTheHead_laptop_activated");
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x14246
// Size: 0xa8
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x142f7
// Size: 0x95
function private function_68307fc74660904c() {
    if (!scripts\mp\flags::gameflag("prematch_done")) {
        level scripts\mp\flags::gameflagwait("prematch_done");
    }
    level.var_f734766fb8c924e2 = function_37e963e85f8863aa();
    var_694cf27a7080216 = function_4e577d33450caee4(13926);
    foreach (var_11807f242097f672 in level.var_f734766fb8c924e2) {
        thread function_6245fc3e65911655(var_11807f242097f672, var_694cf27a7080216);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x14394
// Size: 0x156
function private function_c2d1503cc1629dd2(var_11807f242097f672, part, state, player, var_a5b2c541413aa895, usestring) {
    if (!isdefined(var_11807f242097f672) || !isdefined(player)) {
        return;
    }
    if (function_538ab9a6a1f38f55(player.team, var_11807f242097f672)) {
        var_11807f242097f672.var_b934b77f24f0966e = default_to(var_11807f242097f672.var_b934b77f24f0966e, []);
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x144f2
// Size: 0xb0
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x145aa
// Size: 0x40
function private function_414cf87bc60bb468() {
    player = self;
    level endon("game_ended");
    player endon("disconnect");
    while (true) {
        player waittill("weapon_taken", weapontaken);
        player function_664fd771b95a53b6(weapontaken);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x145f2
// Size: 0x46
function private function_27667a7e09799204() {
    player = self;
    level endon("game_ended");
    player endon("disconnect");
    while (true) {
        player waittill("reload");
        objweapon = player getcurrentweapon();
        player function_664fd771b95a53b6(objweapon);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x14640
// Size: 0x71
function private function_3a9ba2472c7413c6(player, objweapon) {
    uniqueWeaponKill = teams::getteamdata(player.team, "uniqueWeaponKill");
    if (!array_contains(uniqueWeaponKill, objweapon)) {
        function_8359cadd253f9604(player, "kill_AI_unique_weapon_squad", 1);
        uniqueWeaponKill = array_add(uniqueWeaponKill, objweapon);
        teams::setteamdata(player.team, "uniqueWeaponKill", uniqueWeaponKill);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x146b9
// Size: 0x13e
function private function_634368e310edf6f9(player, objweapon) {
    if (!isdefined(player) || !isdefined(objweapon)) {
        return;
    }
    function_3a9ba2472c7413c6(player, objweapon);
    if (!scripts\mp\weapons::isdroppableweapon(objweapon)) {
        return;
    }
    player.var_9ab1766f74a7f17d = default_to(player.var_9ab1766f74a7f17d, []);
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x147ff
// Size: 0x78
function private function_5ad5cd868765ed83() {
    level scripts\mp\flags::gameflagwait("prematch_done");
    var_694cf27a7080216 = function_4e577d33450caee4(15132);
    foreach (player in var_694cf27a7080216) {
        player thread function_414cf87bc60bb468();
        player thread function_27667a7e09799204();
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1487f
// Size: 0x76
function private function_c17f9e8e49a412bf(player) {
    hasremoved = istrue(player namespace_aead94004cf4c147::function_6f39f9916649ac48(8567, 1));
    assert(hasremoved);
    assert(namespace_aead94004cf4c147::function_7e103028c464ab9a(namespace_38b993c4618e76cd::function_b88cfb4893ceedac("<dev string:x7ab>")));
    assert(namespace_aead94004cf4c147::function_8a160d9935d47f5e("<dev string:x7ab>", "<dev string:x764>", 1));
    namespace_aead94004cf4c147::addItemToBackpackByRef("brloot_loaded_harddrive", "valuable", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x148fd
// Size: 0x71
function private function_afd9995bf86b7912(objidnum) {
    player = self;
    player endon("vehicle_change_seat");
    numticks = 100;
    ticktime = 120 / numticks;
    scripts\mp\objidpoolmanager::function_ce702e5925e31fc9(objidnum, player, 2, 2, %PMC_S4/GO_FOR_A_DRIVE_TIMER);
    for (i = 1; i <= numticks; i++) {
        objective_setprogress(objidnum, i / numticks);
        wait ticktime;
    }
    return true;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x14977
// Size: 0xb6
function private function_c900d8cc1fe76ef0(objidnum) {
    player = self;
    level endon("game_ended");
    player endon("death_or_disconnect");
    player endon("vehicle_exit");
    while (true) {
        isdriver = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_occupantisvehicledriver(player);
        if (isdriver) {
            namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_e_go_for_a_drive_transfer_started", player.team);
            var_b6af944a5cf839e = player function_afd9995bf86b7912(objidnum);
            scripts\mp\objidpoolmanager::function_26259bd38697b5ad(objidnum, player);
            if (istrue(var_b6af944a5cf839e)) {
                if (!player namespace_aead94004cf4c147::function_d63a7299c6203bf9(8567)) {
                    break;
                }
                function_c17f9e8e49a412bf(player);
                function_8359cadd253f9604(player, "drive_overland_while_carrying_hard_drive", 1);
                break;
            }
            continue;
        }
        player waittill("vehicle_change_seat");
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x14a35
// Size: 0x96
function private function_5071e81a54b409cf(player) {
    faketask = spawnstruct();
    faketask.curorigin = player.origin;
    faketask.offset3d = (0, 0, 0);
    faketask scripts\mp\gameobjects::requestid(0, 1, undefined, 0);
    objidnum = faketask.objidnum;
    objective_icon(objidnum, "ui_map_icon_obj_intel");
    scripts\mp\objidpoolmanager::objective_pin_global(objidnum, 1);
    objective_onentity(objidnum, player);
    scripts\mp\objidpoolmanager::objective_playermask_single(objidnum, player);
    return objidnum;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x14ad4
// Size: 0x96
function private function_494cf678a5b30f9e(player, vehiclename) {
    assert(isdefined(vehiclename));
    assert(isdefined(player));
    if (scripts\mp\flags::gameflag("prematch_done") && scripts\cp_mp\utility\game_utility::function_5e0e3a24dbb1fae1() && vehiclename == "veh9_overland_2016" && player namespace_aead94004cf4c147::function_d63a7299c6203bf9(8567) && function_c5e0bac8f123cc88(player.team, 14773)) {
        objidnum = function_5071e81a54b409cf(player);
        player function_c900d8cc1fe76ef0(objidnum);
        scripts\mp\objidpoolmanager::returnobjectiveid(objidnum);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x14b72
// Size: 0x1d0
function private function_dbc1b65952f8ed88(player, container, lootid) {
    laptopid = namespace_38b993c4618e76cd::getlootidfromref("brloot_slipstream_laptop");
    if (!scripts\cp_mp\utility\game_utility::function_7ee65fae13124702() || lootid != laptopid || !isdefined(player.guid)) {
        return [lootid, undefined];
    }
    var_9ca59006fcfeece6 = scripts\mp\gametypes\dead_drop::function_30b30561882a2477(container);
    if (var_9ca59006fcfeece6 != "saba_observatory" && var_9ca59006fcfeece6 != "saba_mtntwn" && var_9ca59006fcfeece6 != "saba_oldtwn") {
        return [lootid, undefined];
    }
    if (!isdefined(level.var_4c039b809146fc9d)) {
        level.var_4c039b809146fc9d = [];
    }
    if (!isdefined(level.var_4c039b809146fc9d[player.guid])) {
        struct = spawnstruct();
        struct.poisVisited = [];
        struct.starttime = gettime();
        level.var_4c039b809146fc9d[player.guid] = struct;
        function_70abd486ae26235(player, "first_slipstream_dead_drop", 1);
    }
    struct = level.var_4c039b809146fc9d[player.guid];
    currenttime = gettime();
    timeelapsed = currenttime - struct.starttime;
    if (timeelapsed > 180000) {
        struct.starttime = currenttime;
        struct.poisVisited = [];
        function_70abd486ae26235(player, "first_slipstream_dead_drop", 1);
    }
    struct.poisVisited[var_9ca59006fcfeece6] = 1;
    if (struct.poisVisited.size == 3) {
        function_8359cadd253f9604(player, "dead_drop_dirt_bike", 1);
    }
    return [lootid, 1];
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x14d4b
// Size: 0x56
function private function_892733a0f84dedcf(lootid) {
    if (!isdefined(lootid)) {
        return false;
    }
    return lootid == 11247 || lootid == 8644 || lootid == 32131 || lootid == 13356 || lootid == 19244 || lootid == 19245 || lootid == 26336 || lootid == 32131;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14daa
// Size: 0x1f
function function_bebcefbd95a287ec(player) {
    return function_c5e0bac8f123cc88(player.team, 13915);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x14dd2
// Size: 0x158
function function_fea699cf9870f641(radar, vehicle) {
    level endon("game_ended");
    vehicle endon("death");
    while (isdefined(vehicle)) {
        radius = getdvarint(@"hash_ef46fbf92436a6e7", 1200);
        sweeptime = getdvarint(@"hash_6b9856393459e1e8", 2);
        var_f7949d3327a3e569 = getdvarint(@"hash_97cefea3d38c1b44", 10);
        if (isdefined(vehicle.owner) && isdefined(vehicle.owner.team)) {
            triggerportableradarpingteam(radar.origin, vehicle.owner.team, radius, sweeptime * 1000);
            radar playsoundonmovingent("iw9_code_scan_succes");
            currentpoi = scripts\mp\poi::function_6cc445c02b5effac(radar.origin, 0, 0, 0);
            if (currentpoi == "delta_fleamarket") {
                function_8a7a2427622e7572(vehicle.owner.team, "quidproquo_visited_poi_one", 1);
            } else if (currentpoi == "delta_firestation") {
                function_8a7a2427622e7572(vehicle.owner.team, "quidproquo_visited_poi_two", 1);
            }
        }
        wait var_f7949d3327a3e569;
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14f32
// Size: 0xca
function function_6300f1d8a3c7644(vehicle) {
    level endon("game_ended");
    vehicle endon("death");
    while (isdefined(vehicle)) {
        if (isdefined(vehicle.owner) && isdefined(vehicle.owner.team)) {
            currentpoi = scripts\mp\poi::function_6cc445c02b5effac(vehicle.origin, 0, 0, 0);
            if (currentpoi == "delta_fleamarket") {
                function_8a7a2427622e7572(vehicle.owner.team, "quidproquo_visited_poi_one", 1);
            } else if (currentpoi == "delta_firestation") {
                function_8a7a2427622e7572(vehicle.owner.team, "quidproquo_visited_poi_two", 1);
            }
        }
        wait 1;
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x15004
// Size: 0x189
function function_6234d21aecef0158(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    level endon("game_ended");
    squadmates = teams::getteamdata(player.team, "players");
    foreach (squadmate in squadmates) {
        instance disablescriptableplayeruse(squadmate);
    }
    airdropdata = spawnstruct();
    airdropdata.origin = instance.origin;
    airdropdata.angles = instance.angles;
    var_17160569dab45fd6 = namespace_801fa17f47560d76::function_66c684fea143fbfd("veh9_jltv_mg", airdropdata);
    var_17160569dab45fd6 waittill("landed");
    function_8359cadd253f9604(player, "quidproquo_airdrop_call_success", 1);
    offset = (-80, 0, 37);
    radarspawnlocation = var_17160569dab45fd6.origin + offset;
    radar = spawn("script_model", radarspawnlocation, 0, 0);
    radar setmodel("offhand_2h_wm_sonar_pulse_v0");
    radar show();
    radar linkto(var_17160569dab45fd6);
    level thread function_fea699cf9870f641(radar, var_17160569dab45fd6);
    level thread function_6300f1d8a3c7644(var_17160569dab45fd6);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x15195
// Size: 0x41
function function_9d1f0973f606c702(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    thread function_6234d21aecef0158(instance, part, state, player, var_a5b2c541413aa895, usestring);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x151de
// Size: 0x1a
function function_7616962f7c523a5d(player) {
    scripts\cp_mp\challenges::function_8359cadd253f9604(player, "enter_keycode_success", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15200
// Size: 0x1a
function function_d8bae32458ce35b7(player) {
    scripts\cp_mp\challenges::function_8359cadd253f9604(player, "drill_bunker_safe", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15222
// Size: 0x1a
function function_8b3be362bff6847f(player) {
    scripts\cp_mp\challenges::function_8359cadd253f9604(player, "enter_traded_keycode_success", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15244
// Size: 0x25
function onbombdefused(defuser) {
    if (!function_6f6cc16c0528de5b(defuser)) {
        return;
    }
    scripts\cp_mp\challenges::function_8359cadd253f9604(defuser, "defuse_enemy_charge", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x15271
// Size: 0xd7
function function_d882e5d473c9b258(player, item, var_ec22a950f210e39) {
    if (namespace_a38a2e1fe7519183::function_d3e4d206d9b842a0(item) && function_c5e0bac8f123cc88(player.team, function_16ae6d8b5f25f31b("infil_give_scav_weapon"))) {
        var_fafd64b272244139 = getlootscriptablearrayinradius(undefined, undefined, player.origin, 500);
        if (isdefined(var_fafd64b272244139) && var_fafd64b272244139.size > 0) {
            foreach (scriptable in var_fafd64b272244139) {
                if (isdefined(scriptable.loadoutcontents)) {
                    scripts\cp_mp\challenges::function_8359cadd253f9604(player, "give_weapon_to_scavenger", 1);
                    break;
                }
            }
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15350
// Size: 0x1c2
function function_794d65c4d264dcc0() {
    radiationstructs = getstructarray("pmc_bunker_exit_radiation", "script_noteworthy");
    foreach (struct in radiationstructs) {
        namespace_96abc792b7f61807::function_f0d61e14dfde9ccd(struct);
        struct.var_9d4873a013fb19ab = "scanned_bunker_exit";
        struct.var_44c91f16317bb5c2 = 1.32;
        struct.var_f967e4de0363ea83 = [];
        struct.trigger = spawn("noent_volume_trigger_radius", struct.origin, 0, 600, 400);
        thread watchplayertrigger(struct.trigger, "entered_bunker_exit_trigger");
    }
    buttonstructs = getstructarray("pmc_bunker_exit_button", "script_noteworthy");
    level.var_c67075aa240462a9 = [];
    foreach (struct in buttonstructs) {
        button = spawnscriptable("pmc_bunker_exit_button", struct.origin, struct.angles);
        button setscriptablepartstate("pmc_bunker_exit_button_use", "usable");
        button function_ab5c0b42f31a0d20(function_16ae6d8b5f25f31b("secure_biobunker_exits_story"));
        button createprogressbar("ui_map_icon_obj_searchseizure", (0, 0, 5));
        button.var_11fb82ff93300bb7 = [];
        level.var_c67075aa240462a9[level.var_c67075aa240462a9.size] = button;
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1551a
// Size: 0x41
function function_c55dae311ea23861(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    thread function_dacdd049029751a8(instance, part, state, player, var_a5b2c541413aa895, usestring);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x15563
// Size: 0x4b1
function function_dacdd049029751a8(instance, part, state, player, var_a5b2c541413aa895, usestring) {
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
        player scripts\mp\hud_message::showerrormessage("PMC_S4/BUNKER_EXIT_BUTTON_ERR_MSG");
        return;
    }
    foreach (team in instance.var_11fb82ff93300bb7) {
        if (is_equal(team, player.team)) {
            player scripts\mp\hud_message::showerrormessage("PMC_S4/BUNKER_EXIT_BUTTON_ALREADY_SECURED_ERR_MSG");
            return;
        }
    }
    teammates = teams::getteamdata(player.team, "players");
    foreach (teammate in teammates) {
        instance disablescriptableplayeruse(teammate);
    }
    objidnum = instance.objidnum;
    captureteam = player.team;
    instance.nearplayers = [];
    scripts\mp\objidpoolmanager::objective_teammask_single(objidnum, player.team);
    instance.securing = 1;
    instance notify("download_started");
    instance thread function_1db8528d0d503797();
    progress = 0;
    wavenum = 0;
    time = getdvarint(@"hash_f542e5b088626170", 80);
    while (progress < time) {
        if (instance.nearplayers.size > 0) {
            progress += level.framedurationseconds;
        }
        if (wavenum < 1 && progress > 0) {
            function_b9fce22c56fdae8(instance.origin, 1250);
            wavenum = 1;
        } else if (wavenum < 2 && progress > 30) {
            function_b9fce22c56fdae8(instance.origin, 2500);
            wavenum = 2;
        } else if (wavenum < 3 && progress > 60) {
            function_b9fce22c56fdae8(instance.origin, 4000);
            wavenum = 3;
        }
        objective_setprogress(objidnum, clamp(progress / time, 0, 1));
        waitframe();
    }
    foreach (hideplayer in instance.nearplayers) {
        scripts\mp\objidpoolmanager::function_26259bd38697b5ad(objidnum, hideplayer);
    }
    instance notify("download_ended");
    scripts\mp\gametypes\br_gametype_dmz::showdmzsplash("dmz_bunker_exit_secured", instance.nearplayers);
    scripts\mp\objidpoolmanager::objective_playermask_hidefromall(objidnum);
    trackedTeams = [];
    foreach (trackplayer in instance.nearplayers) {
        if (!array_contains(trackedTeams, trackplayer.team)) {
            trackedTeams[trackedTeams.size] = trackplayer.team;
        }
    }
    foreach (team in trackedTeams) {
        function_8a7a2427622e7572(team, "secured_bunker_exit", 1);
        teammates = teams::getteamdata(team, "players");
        foreach (teammate in teammates) {
            instance disablescriptableplayeruse(teammate);
        }
    }
    instance.securing = 0;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x15a1c
// Size: 0x5a
function private function_b9fce22c56fdae8(origin, radius) {
    playsoundatpos(origin, "mp_dmz_alrm_trap");
    namespace_bfef6903bca5845d::function_77acc10c4823dd8a(4, origin, "high", "mission", "pmc_bunkerExit", "no_group", level.var_4b195d3dd0024b9c);
    namespace_bfef6903bca5845d::function_353fecd1549f5f42(origin, radius, level.var_4b195d3dd0024b9c, 6);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x15a7e
// Size: 0x198
function private function_1db8528d0d503797() {
    self endon("download_ended");
    origin = self.origin;
    objidnum = self.objidnum;
    while (true) {
        nearby = [];
        foreach (player in level.players) {
            if (isdefined(player.origin) && distancesquared(origin, player.origin) < 160000) {
                nearby[nearby.size] = player;
            }
        }
        newnearby = array_difference(nearby, self.nearplayers);
        var_ea6b4eeeaea5cdc3 = array_difference(self.nearplayers, nearby);
        foreach (player in newnearby) {
            scripts\mp\objidpoolmanager::function_ce702e5925e31fc9(objidnum, player, 2, 2, %PMC_S4/BUNKER_EXIT_SECURING_PROGRESS_TITLE);
        }
        foreach (player in var_ea6b4eeeaea5cdc3) {
            scripts\mp\objidpoolmanager::function_26259bd38697b5ad(objidnum, player);
        }
        self.nearplayers = nearby;
        wait 1;
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x15c1e
// Size: 0xae
function function_d7fd9f403937e688(origin, angles) {
    silo = spawnscriptable("missile_silo_noent", origin, angles);
    silo setscriptablepartstate("missile_silo_noent", "closed_idle");
    collisionpos = coordtransform((0, 0, 105), silo.origin, silo.angles);
    var_d9bf814fe5fab0c7 = combineangles(silo.angles, (0, 0, 180));
    silo.hiddencollision = spawnscriptable("missile_silo_hidden_collision", collisionpos, var_d9bf814fe5fab0c7);
    return silo;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15cd5
// Size: 0x35a
function function_6ce896ca48e4c62a() {
    if (!scripts\cp_mp\utility\game_utility::function_7ee65fae13124702()) {
        return;
    }
    nodes = getstructarray("dmz_missle_silo", "script_noteworthy");
    foreach (node in nodes) {
        silo = spawnscriptable("missile_silo_noent", node.origin, node.angles);
        silo setscriptablepartstate("missile_silo_noent", "closed_idle");
        var_d9bf814fe5fab0c7 = combineangles((0, 180, 0), silo.angles);
        silo.hiddencollision = spawnscriptable("missile_silo_hidden_collision", silo.origin, var_d9bf814fe5fab0c7);
    }
    opennode = getstruct("dmz_missile_silo_open", "script_noteworthy");
    opensilo = spawnscriptable("missile_silo_noent", opennode.origin, opennode.angles);
    opensilo setscriptablepartstate("missile_silo_noent_collision", "open");
    opensilo.oncaptured = &function_ea506e1f9c05efc8;
    level.var_a2b890d129c64761 = spawnstruct();
    level.var_a2b890d129c64761.usetime = 3;
    level.var_a2b890d129c64761.capturetype = 2;
    shipvolume = function_f159c10d5cf8f0b4("subarea_airport_konniship", "script_noteworthy")[0];
    group = spawnstruct();
    group.contributingplayers = [];
    group.used = [];
    group.categoryname = "pmc_konni_ship";
    group.volume = shipvolume;
    function_572838690d80d959(group.categoryname);
    level scripts\mp\flags::gameflagwait("prematch_done");
    enemynodes = getstructarray("pmc_boat_agent_spawn", "script_noteworthy");
    foreach (node in enemynodes) {
        aitype = namespace_bfef6903bca5845d::function_7f1a2e2ebe0c1693("ar");
        agent = namespace_bfef6903bca5845d::ai_mp_requestspawnagent(aitype, node.origin, node.angles, "high", "mission", "pmc_mission", undefined, undefined, undefined, "saba_airport", 0, undefined, 0);
        agentStruct = spawnstruct();
        agentStruct.group = group;
        agentStruct.var_90ccd093de8c8c55 = &function_8ef059ceb8bb6f26;
        agentStruct.ondeath = &function_5629fa2cae5846f2;
        agentStruct.var_9e729433fd479f19 = &function_507b92d2539b9074;
        if (isint(agent)) {
            agentStruct.var_451a9d27d63c746b = agent;
        }
        namespace_14d36171baccf528::function_3ea1225bf6192343(agent, agentStruct);
        namespace_14d36171baccf528::function_58aab2edaec2599f(agent, "pmc_agentPostDormancy", &pmc_agentPostDormancy);
        function_e812b7065161da79(agent, group.categoryname);
    }
    thread function_5678739494bf8de1(group);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x16037
// Size: 0x76
function function_8ef059ceb8bb6f26(agent, var_451a9d27d63c746b) {
    agent.agentStruct.var_451a9d27d63c746b = var_451a9d27d63c746b;
    function_c36f897d56e28169(agent, agent.agentStruct.group.categoryname);
    function_e812b7065161da79(var_451a9d27d63c746b, agent.agentStruct.group.categoryname);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x160b5
// Size: 0x6b
function pmc_agentPostDormancy(agent) {
    function_c36f897d56e28169(agent.agentStruct.var_451a9d27d63c746b, agent.agentStruct.group.categoryname);
    function_e812b7065161da79(agent, agent.agentStruct.group.categoryname);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x16128
// Size: 0x2f
function function_507b92d2539b9074(struct, id) {
    function_c36f897d56e28169(id, struct.group.categoryname);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1615f
// Size: 0x17c
function function_5629fa2cae5846f2(agent, killer) {
    if (isagent(agent)) {
        agentStruct = namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "agentStruct");
        if (isdefined(agentStruct)) {
            if (isdefined(agentStruct.forcedrop)) {
                agent namespace_bfef6903bca5845d::function_8c8c6dbf143ab5b2(agent, agentStruct.forcedrop);
            }
            function_c36f897d56e28169(agent, agentStruct.group.categoryname);
            if (isdefined(killer) && isplayer(killer) && isdefined(agentStruct.group.contributingplayers) && !array_contains(agentStruct.group.contributingplayers, killer)) {
                agentStruct.group.contributingplayers[agentStruct.group.contributingplayers.size] = killer;
            }
        }
    } else if (isint(agent)) {
        info = namespace_14d36171baccf528::function_2b0e82156fa6075b(agent);
        if (isdefined(info) && isdefined(info.agentStruct) && isdefined(info.agentStruct.group)) {
            function_c36f897d56e28169(agent, info.agentStruct.group.categoryname);
        }
    }
    namespace_14d36171baccf528::function_3ea1225bf6192343(agent, undefined);
    namespace_14d36171baccf528::function_97fbd14bbcf19d9c(agent, "pmc_agentPostDormancy", &pmc_agentPostDormancy);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x162e3
// Size: 0x28a
function function_5678739494bf8de1(group) {
    level endon("game_ended");
    while (true) {
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
            involume = isdefined(origin) && ispointinvolume(origin, group.volume);
            inrange = isdefined(origin) && distance2d(origin, group.volume.origin) < 1000;
            if (involume || inrange) {
                var_28615e1635f3c2eb++;
                continue;
            }
            function_5629fa2cae5846f2(agent);
        }
        group.var_28615e1635f3c2eb = var_28615e1635f3c2eb;
        if (var_28615e1635f3c2eb == 0) {
            teamscontributing = [];
            var_7da5b2082e28ab9d = [];
            foreach (player in group.contributingplayers) {
                if (isdefined(player.team) && !array_contains(teamscontributing, player.team)) {
                    teamscontributing[teamscontributing.size] = player.team;
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
        wait 1;
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x16575
// Size: 0x47
function function_ea506e1f9c05efc8(missilesilo, player) {
    if (missilesilo getscriptablepartstate("missile_silo_noent") != "capturing_0_percent") {
        missilesilo setscriptablepartstate("missile_silo_noent", "capturing_0_percent");
    }
    function_8359cadd253f9604(player, "open_missile_silo", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x165c4
// Size: 0x1a
function function_2d3c14faa38e2146(player) {
    function_8359cadd253f9604(player, "equipped_disguise", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x165e6
// Size: 0x1a
function function_4f23417a848e2f5f(player) {
    function_8359cadd253f9604(player, "buy_scavenger_buy_station", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16608
// Size: 0x90
function function_54e624d4ac58b723() {
    if (!scripts\cp_mp\utility\game_utility::function_7ee65fae13124702()) {
        return;
    }
    node = getstruct("pmc_tunnel_entrance", "script_noteworthy");
    use = spawnscriptable("pmc_signal_flare_use", node.origin, node.angles);
    use setscriptablepartstate("pmc_signal_flare_use", "usable");
    use.usedplayers = [];
    level scripts\mp\flags::function_1240434f4201ac9d("prematch_done");
    use function_ab5c0b42f31a0d20(function_16ae6d8b5f25f31b("false_reinforcement_signal_story"));
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x166a0
// Size: 0x41
function function_ac56c0ec10ac3e25(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    thread function_6871a50434e7cc31(instance, part, state, player, var_a5b2c541413aa895, usestring);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x166e9
// Size: 0x1ca
function function_6871a50434e7cc31(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    thread namespace_1eb3c4e0e28fac71::utilflare_shootflare(instance.origin, "dom");
    function_8359cadd253f9604(player, "false_signal_sent", 1);
    teammates = getteamdata(player.team, "players");
    foreach (teammate in teammates) {
        instance disablescriptableplayeruse(teammate);
    }
    package = namespace_bfef6903bca5845d::function_ab14d6652e44fda0(8, level.spawnset["guard"], 3, undefined, "Helicopter");
    for (agents = undefined; !isdefined(agents); agents = namespace_bfef6903bca5845d::function_77acc10c4823dd8a(undefined, instance.origin, "absolute", "mission", "false_signal", undefined, undefined, 1, undefined, undefined, undefined, undefined, package, "ru")) {
    }
    var_fc1c9cebe104f3fe = 0;
    foreach (agent in agents) {
        agent.var_b582b10663b5b2a9 = 0;
        namespace_bfef6903bca5845d::function_63a043d47490f90d(agent, "brloot_konni_combat_intel", undefined, ter_op(var_fc1c9cebe104f3fe, 0.5, 1), 1);
        if (!var_fc1c9cebe104f3fe) {
            var_fc1c9cebe104f3fe = 1;
        }
        scripts\mp\ai_behavior::function_bd9acc7c99ad884(agent, instance.origin);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x168bb
// Size: 0x1e9
function function_1665f2fe0ae0d024() {
    if (!scripts\cp_mp\utility\game_utility::function_7ee65fae13124702()) {
        return;
    }
    missionid = function_16ae6d8b5f25f31b("locate_missile_containers");
    thread function_315e9c3a5fb405e5(missionid, (4297, -11455, 4590), namespace_38b993c4618e76cd::getlootidfromref("brloot_ir_beacon"), 2, 1);
    cemeterysilo = undefined;
    nodes = getstructarray("missile_silo", "targetname");
    foreach (node in nodes) {
        poi = scripts\mp\poi::function_6cc445c02b5effac(node.origin, 1, 1);
        if (poi == "saba_cemetery") {
            cemeterysilo = function_e13625d770059ef9(node, missionid);
            cemeterysilo.collectitem = "silo_plant_first_ir_beacon";
            nodes = array_remove(nodes, node);
            break;
        }
    }
    nodes = array_randomize(nodes);
    silo = function_e13625d770059ef9(nodes[0], missionid);
    silo.collectitem = "silo_plant_second_ir_beacon";
    poi = scripts\mp\poi::function_6cc445c02b5effac(nodes[0].origin, 1, 1);
    notepos = coordtransform((51, 0, 65), cemeterysilo.origin, cemeterysilo.angles);
    var_4a122e836c546c35 = combineangles(cemeterysilo.angles, (90, 0, 0));
    note = spawnscriptable("stationary_note_paper", notepos, var_4a122e836c546c35);
    noteref = "pmc_missile_silo_hint_" + getsubstr(poi, 5);
    note.noteid = scripts\mp\stationary_notes::function_793a7b85ffb737d1(noteref);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x16aac
// Size: 0xbc
function function_e13625d770059ef9(node, missionid) {
    silo = function_d7fd9f403937e688(node.origin, node.angles);
    silo setscriptablepartstate("missile_silo_noent_use", "usable");
    silo thread function_ab5c0b42f31a0d20(missionid);
    trigger = spawn("noent_volume_trigger_radius", silo.origin, 0, 700, 700);
    thread watchplayertrigger(trigger, "locate_missile_silo");
    silo thread scripts\cp_mp\utility\debug_utility::drawsphere(silo.origin, 50, 10000000, (1, 0, 0));
    thread function_afe925f2dee5f03e(silo);
    return silo;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16b71
// Size: 0x159
function function_afe925f2dee5f03e(silo) {
    scripts\mp\flags::function_1240434f4201ac9d("prematch_done");
    numagents = 4;
    for (i = 0; i < numagents; i++) {
        var_de2d3e1486e4e9d3 = randomfloatrange(200, 400);
        forward = anglestoforward(silo.angles) * var_de2d3e1486e4e9d3;
        right = vectorcross((0, 0, 1), forward);
        facingangle = axistoangles(forward, right, (0, 0, 1));
        var_88b83b0d7a43ea72 = i / numagents * 360 + randomfloatrange(-30, 30) % 360;
        offset = rotatepointaroundvector((0, 0, 1), forward, var_88b83b0d7a43ea72);
        origin = silo.origin + offset;
        aitype = namespace_bfef6903bca5845d::function_7f1a2e2ebe0c1693("ar", 2);
        agent = namespace_bfef6903bca5845d::ai_mp_requestspawnagent(aitype, origin, facingangle, "medium", "mission", "pmc_mission");
        scripts\mp\ai_behavior::function_e786aa52b93833eb(agent, silo.origin, 512);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x16cd2
// Size: 0x179
function function_948991a18b048182(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (!player isonground() || !isdefined(player.team)) {
        return;
    }
    lootid = namespace_38b993c4618e76cd::getlootidfromref("brloot_ir_beacon");
    hasitem = istrue(player namespace_aead94004cf4c147::function_6f39f9916649ac48(lootid, 1));
    if (hasitem) {
        groundpos = drop_to_ground(player.origin);
        placement = spawnscriptable("dmz_place_item", groundpos, player.angles);
        placement setscriptablepartstate("dmz_place_item_use", "unusable");
        placement setscriptablepartstate("dmz_place_item_model", "brloot_ir_beacon");
        player thread scripts\mp\gametypes\br_pickups::playerplaypickupanim();
        function_8359cadd253f9604(player, instance.collectitem);
        teammates = getteamdata(player.team, "players");
        foreach (teammate in teammates) {
            instance disablescriptableplayeruse(teammate);
        }
        return;
    }
    player scripts\mp\hud_message::showerrormessage("PMC_S2/PLACE_ERR_MSG");
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16e53
// Size: 0x1a
function function_7fc83d63a85c14d(player) {
    function_8359cadd253f9604(player, "turn_on_mrap", 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16e75
// Size: 0x61
function function_496b109dc14fa57d(task) {
    if (isdefined(task.hostageheli) && istrue(task.hostageheli.finalexfil) && isdefined(task.teams[0])) {
        function_8a7a2427622e7572(task.teams[0], "hostage_final_exfil", 1);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16ede
// Size: 0x31
function function_a07e5e1f98c14d68() {
    thread function_315e9c3a5fb405e5(function_16ae6d8b5f25f31b("speed_deaddrop_chain"), (-8980, 4681, 405), namespace_38b993c4618e76cd::getlootidfromref("brloot_slipstream_laptop"), 1, 1);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x16f17
// Size: 0x5f
function function_cc6a02d4564d9f07(player, metadata) {
    if (!function_cff2f4f168b29b81()) {
        return;
    }
    weaponowner = namespace_a38a2e1fe7519183::function_36275388f9093535(metadata);
    if (isdefined(weaponowner) && weaponowner.team != player.team) {
        function_8359cadd253f9604(weaponowner, "share_insured_weapon", 1);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x16f7e
// Size: 0x83
function private function_5a3fd0babc886413(modifiedvehicle, vehicleref) {
    vehicleinstances = scripts\cp_mp\vehicles\vehicle_tracking::vehicle_tracking_getgameinstances(vehicleref);
    foreach (vehicleinstance in vehicleinstances) {
        if (!isdefined(vehicleinstance.lastowner) && vehicleinstance != modifiedvehicle) {
            return false;
        }
    }
    return true;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1700a
// Size: 0xf7
function private function_b55402e6d4fae450(vehicle) {
    if (!scripts\cp_mp\utility\game_utility::function_5e0e3a24dbb1fae1()) {
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17109
// Size: 0x1d
function function_7854f54f01615a6e(vehicle) {
    if (!function_cff2f4f168b29b81()) {
        return;
    }
    function_b55402e6d4fae450(vehicle);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1712e
// Size: 0x2b8
function function_34969e35391841ba() {
    if (!scripts\cp_mp\utility\game_utility::function_e21746abaaaf8414()) {
        return;
    }
    scripts\mp\flags::function_1240434f4201ac9d("fortress_system_init");
    var_590672f7b5711c59 = (-578, 7297, 434);
    fortress = namespace_9823ee6035594d67::function_c0a211a69f5f8f2f(var_590672f7b5711c59);
    if (!isdefined(fortress)) {
        assertmsg("<dev string:x7c6>");
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
    group.exitnodes = getstructarray("pmc_konni_safehouse_exit", "script_noteworthy");
    agentspawns = getstructarray("pmc_konni_safehouse_agent", "script_noteworthy");
    firstspawn = 1;
    foreach (spawn in agentspawns) {
        aitype = namespace_bfef6903bca5845d::function_7f1a2e2ebe0c1693("ar");
        agent = undefined;
        while (!isdefined(agent)) {
            agent = namespace_bfef6903bca5845d::ai_mp_requestspawnagent(aitype, spawn.origin, spawn.angles, "high", "mission", "pmc_mission", undefined, undefined, undefined, undefined, 0, undefined, 0);
            if (!isdefined(agent)) {
                waitframe();
            }
        }
        agentStruct = spawnstruct();
        agentStruct.group = group;
        agentStruct.var_90ccd093de8c8c55 = &function_8ef059ceb8bb6f26;
        agentStruct.ondeath = &function_5629fa2cae5846f2;
        agentStruct.var_9e729433fd479f19 = &function_507b92d2539b9074;
        agentStruct.forcedrop = namespace_bfef6903bca5845d::function_edabf4238e9d70b5("brloot_cartel_transportation_plans", undefined, undefined, ter_op(firstspawn, 1, 0.25), 1);
        if (isint(agent)) {
            agentStruct.var_451a9d27d63c746b = agent;
        }
        namespace_14d36171baccf528::function_3ea1225bf6192343(agent, agentStruct);
        namespace_14d36171baccf528::function_58aab2edaec2599f(agent, "pmc_agentPostDormancy", &pmc_agentPostDormancy);
        function_e812b7065161da79(agent, group.categoryname);
        scripts\mp\ai_behavior::function_e786aa52b93833eb(agent, spawn.origin, 256);
        firstspawn = 0;
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x173ee
// Size: 0x1a6
function function_f37f5d719bc2f2f0(grenade, player) {
    if (!scripts\cp_mp\utility\game_utility::function_e21746abaaaf8414()) {
        return;
    }
    player endon("death_or_disconnect");
    origin = function_4404ed46f49e5ba1(grenade);
    origin = default_to(origin, grenade.origin);
    if (!isdefined(origin)) {
        return;
    }
    if (isdefined(level.var_79c824ddfe860a6f)) {
        if (namespace_9823ee6035594d67::function_20f6e9317b1baf3d(origin, level.var_79c824ddfe860a6f.fortress)) {
            if (isdefined(player)) {
                function_8359cadd253f9604(player, "grenade_in_konni_safehouse", 1);
            }
            namespace_9823ee6035594d67::function_a113cf2be454f78d(level.var_79c824ddfe860a6f.fortress);
            wait 1;
            agents = function_b4b9401715cf98ea(level.var_79c824ddfe860a6f.categoryname);
            foreach (agent in agents) {
                if (isagent(agent)) {
                    agentorigin = agent.origin;
                    if (!isdefined(agentorigin)) {
                        continue;
                    }
                    var_c79dca57049c64d4 = namespace_9823ee6035594d67::function_20f6e9317b1baf3d(agentorigin, level.var_79c824ddfe860a6f.fortress);
                    if (var_c79dca57049c64d4) {
                        closestexit = getclosest(agentorigin, level.var_79c824ddfe860a6f.exitnodes);
                        if (isdefined(closestexit)) {
                            scripts\mp\ai_behavior::function_a5117518725da028(agent, closestexit.origin, 0);
                        }
                    }
                }
            }
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1759c
// Size: 0x27
function function_4404ed46f49e5ba1(grenade) {
    grenade endon("decoy_sequence_started");
    grenade waittill("explode", origin);
    return origin;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x175cc
// Size: 0xfc
function function_7a1e65b949e0b879() {
    level endon("game_ended");
    flag_wait("create_script_initialized");
    flag_wait("scriptables_ready");
    scripts\engine\scriptable::scriptable_addusedcallbackbypart("brloot_pmc_unobserved_radio", &function_cd8c827e2b6115ea);
    var_340fefbb7410b03e = getstructarray("pmc_unobserved_laptop", "script_noteworthy");
    foreach (node in var_340fefbb7410b03e) {
        dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
        dropinfo = scripts\mp\gametypes\br_pickups::getitemdroporiginandangles(dropstruct, node.origin, node.angles);
        item = scripts\mp\gametypes\br_pickups::spawnpickup("brloot_valuable_konni_laptop", dropinfo, 1);
        item.criticalitem = 1;
        item.alwayscritical = 1;
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x176d0
// Size: 0x197
function function_f7d8054ae05de10f(door, player) {
    if (!scripts\cp_mp\utility\game_utility::function_7ee65fae13124702() || !getdvarint(@"hash_67839dc5e648f761", 1)) {
        return;
    }
    lootpoints = getlootscriptablearrayinradius(undefined, undefined, door.fortress.origin, 1500);
    maxdist = -1;
    bestloot = undefined;
    foreach (loot in lootpoints) {
        if (!loot getscriptableisloot() || loot scriptableislootcache() || !namespace_9823ee6035594d67::function_20f6e9317b1baf3d(loot.origin, door.fortress)) {
            continue;
        }
        currentdist = distancesquared(player.origin, loot.origin);
        if (currentdist > maxdist) {
            maxdist = currentdist;
            bestloot = loot;
        }
    }
    if (isdefined(bestloot)) {
        spawnorigin = bestloot.origin;
        scripts\mp\gametypes\br_pickups::loothide(bestloot);
        radio = spawnscriptable("brloot_pmc_unobserved_radio", spawnorigin);
        radio.fortress = door.fortress;
        /#
            thread scripts\cp_mp\utility\debug_utility::drawsphere(radio.origin, 50, 120, (1, 0, 0));
        #/
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1786f
// Size: 0xe8
function function_cd8c827e2b6115ea(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (player namespace_c39580665208f0a4::function_d3b190ee881c5ca7()) {
        instance setscriptablepartstate("brloot_pmc_unobserved_radio", "visible_unusable");
        function_8359cadd253f9604(player, "unobserved_activated_radio", 1);
        for (i = 0; i < level.var_cc75a90d4b9108b1.size; i++) {
            var_ab70ae90be101a99 = function_7bbdbbc6cb745dc6(int(level.var_cc75a90d4b9108b1[i]));
            playsoundatpos(instance.origin, var_ab70ae90be101a99);
            wait getdvarfloat(@"hash_291c19b0a2eb5ce4", 1);
        }
        instance setscriptablepartstate("brloot_pmc_unobserved_radio", "visible");
        return;
    }
    player scripts\mp\hud_message::showerrormessage("MP/ACTIVATE_DISGUISE_ERROR");
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1795f
// Size: 0x11e
function function_7bbdbbc6cb745dc6(currentnum) {
    numstring = "";
    switch (currentnum) {
    case 0:
        numstring = "zero";
        break;
    case 1:
        numstring = "one";
        break;
    case 2:
        numstring = "two";
        break;
    case 3:
        numstring = "three";
        break;
    case 4:
        numstring = "four";
        break;
    case 5:
        numstring = "five";
        break;
    case 6:
        numstring = "six";
        break;
    case 7:
        numstring = "seven";
        break;
    case 8:
        numstring = "eight";
        break;
    case 9:
        numstring = "nine";
        break;
    default:
        numstring = "zero";
        break;
    }
    return "dx_br_bds5_fcms_cmpv_" + numstring;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17a86
// Size: 0x1bd
function function_562889df3a616506() {
    flag_wait("scriptables_ready");
    if (scripts\cp_mp\utility\game_utility::function_ffbbb4525b11d5a2()) {
        computermonitor = getentitylessscriptablearray("scriptable_un_office_computer_monitor_01_169", "classname", (-919, 828, 451), 20);
        if (isdefined(computermonitor) && computermonitor.size > 0) {
            computermonitor[0] setscriptablepartstate("screen", "bink2");
            if (isdefined(level.snotes.var_4cc11ef35eb39ae8)) {
                level.snotes.var_4cc11ef35eb39ae8[14] = "pmc_cartel_computer";
            }
        }
    }
    if (scripts\cp_mp\utility\game_utility::function_5e0e3a24dbb1fae1()) {
        var_740d31feb555e99e = getstruct("pmc_cartel_boat", "targetname");
        if (isdefined(var_740d31feb555e99e)) {
            boat = scripts\cp_mp\vehicles\vehicle::vehicle_spawn("veh9_patrol_boat", var_740d31feb555e99e);
            backturret = scripts\cp_mp\vehicles\vehicle::vehicle_getturretbyweapon(boat, "iw9_mg_patrol_boat_back_mp");
            backturret.prevexit = backturret.exit;
            backturret.exit = (-100, 45, -7);
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17c4b
// Size: 0x625
function function_48864d898e5100c0() {
    if (!scripts\cp_mp\utility\game_utility::function_5e0e3a24dbb1fae1()) {
        return;
    }
    level.var_c162c5e269f54cbf = spawnstruct();
    level.var_c162c5e269f54cbf.nodes = [];
    bombsitenodes = getstructarray("pmc_terminal_bombsite", "script_noteworthy");
    foreach (node in bombsitenodes) {
        site = spawnscriptable("dmz_supply_site", node.origin, node.angles);
        site.use = spawnscriptable("dmz_supply_site_use_pmc", site.origin);
        site.node = node;
        node.site = site;
        node.use = site.use;
        node.use.node = node;
        node.task = spawnstruct();
        node.isbombsite = 1;
        node.disablefunc = &function_7ef66059655c6e3e;
        node.curorigin = site.origin;
        node.offset3d = (0, 0, 15);
        node scripts\mp\gameobjects::requestid(0, 0, undefined, 1);
        objid = node.objidnum;
        scripts\mp\objidpoolmanager::update_objective_icon(objid, "ui_map_icon_obj_bomb_collect");
        scripts\mp\objidpoolmanager::update_objective_setbackground(objid, 1);
        scripts\mp\objidpoolmanager::update_objective_setzoffset(objid, 15);
        scripts\mp\objidpoolmanager::update_objective_position(objid, node.origin + (0, 0, 15));
        scripts\mp\objidpoolmanager::objective_pin_global(objid, 1);
        scripts\mp\objidpoolmanager::function_d7e3c4a08682c1b9(objid, 1);
        scripts\mp\objidpoolmanager::objective_set_play_intro(objid, 0);
        scripts\mp\objidpoolmanager::function_9cad42ac02eff950(objid);
        scripts\mp\objidpoolmanager::function_6ae37618bb04ea60(objid);
        site.use setscriptablepartstate("dmz_supply_site_use_pmc", "usable");
        node.trigger = spawn("trigger_radius", node.origin, 0, int(128), int(512));
        node.trigger trigger_off();
        node thread function_1e1fb042a28726e6(node.trigger, 512);
        level.var_c162c5e269f54cbf.nodes[level.var_c162c5e269f54cbf.nodes.size] = node;
        thread function_b7fa1e109d78dfe5(node);
    }
    safenodes = getstructarray("pmc_terminal_safe", "script_noteworthy");
    foreach (node in safenodes) {
        safe = spawnscriptable("dmz_safe_pmc_terminal", node.origin, node.angles);
        safe.curorigin = safe.origin;
        safe.offset3d = (0, 0, 15);
        safe scripts\mp\gameobjects::requestid(0, 0, undefined, 1);
        objid = safe.objidnum;
        scripts\mp\objidpoolmanager::update_objective_icon(objid, "ui_map_icon_safe");
        scripts\mp\objidpoolmanager::update_objective_setbackground(objid, 1);
        scripts\mp\objidpoolmanager::update_objective_setzoffset(objid, 15);
        scripts\mp\objidpoolmanager::update_objective_position(objid, safe.origin + (0, 0, 15));
        scripts\mp\objidpoolmanager::objective_pin_global(objid, 1);
        scripts\mp\objidpoolmanager::function_d7e3c4a08682c1b9(objid, 1);
        scripts\mp\objidpoolmanager::objective_set_play_intro(objid, 0);
        if (level.safeprops.hideicons) {
            scripts\mp\objidpoolmanager::function_9cad42ac02eff950(objid);
        } else {
            scripts\mp\objidpoolmanager::function_a28e8535e00d34f3(objid);
        }
        scripts\mp\objidpoolmanager::function_6ae37618bb04ea60(objid);
        safe.node = node;
        node.safe = safe;
        level.var_c162c5e269f54cbf.nodes[level.var_c162c5e269f54cbf.nodes.size] = node;
        safe setscriptablepartstate("safe", "usable_not_open");
        safe.trigger = spawn("trigger_radius", safe.node.origin, 0, int(128), int(512));
        safe.trigger trigger_off();
        safe.capturetime = getdvarint(@"hash_aaf56e4808ead990", 480);
        safe.revealedteams = [];
        safe thread namespace_abc7ed0cde8527d4::function_474e2e9b4a997564(safe.trigger, 512);
        safe.var_ceb543956c7203e7 = &namespace_abc7ed0cde8527d4::function_9618cc73546d253d;
        safe.overrideusecallback = &function_2d2046e72a3653fb;
        node.disablefunc = &function_1c9e346732c1dcc5;
    }
    thread function_139abff6182eebcb();
    if (getdvarint(@"hash_dd42f7c88cf36a4b", 1)) {
        foreach (node in level.var_c162c5e269f54cbf.nodes) {
            thread function_2039e3a5f09b1a11(node);
        }
    }
    scripts\mp\flags::function_1240434f4201ac9d("fortress_system_init");
    level.var_c162c5e269f54cbf.fortress = namespace_9823ee6035594d67::function_888d8429a71c944c("delta_terminal");
    assertex(isdefined(level.var_c162c5e269f54cbf.fortress), "<dev string:x801>");
    level.var_c162c5e269f54cbf.fortress.nationalityoverride = "cartel";
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18278
// Size: 0x1b0
function function_139abff6182eebcb() {
    level endon("game_ended");
    waittimes = [getdvarint(@"hash_afbca5bb4491c0a5", 45), getdvarint(@"hash_4d898ebbb795902f", 30), getdvarint(@"hash_2436b93c12eb7965", 20), getdvarint(@"hash_366c7231d6d96a73", 15), getdvarint(@"hash_1d332131c5bf6c97", 10)];
    unlockeddoors = 0;
    while (true) {
        foreach (node in level.var_c162c5e269f54cbf.nodes) {
            if (istrue(node.shouldreinforce)) {
                if (!istrue(unlockeddoors)) {
                    namespace_9823ee6035594d67::function_a113cf2be454f78d(level.var_c162c5e269f54cbf.fortress);
                    unlockeddoors = 1;
                }
                var_34e72e17a2410a72 = 0;
                foreach (var_715887858d481e40 in level.var_c162c5e269f54cbf.nodes) {
                    var_34e72e17a2410a72 += istrue(var_715887858d481e40.shouldreinforce);
                }
                function_a30ad7c4a9b45232(node.origin, var_34e72e17a2410a72);
                waittime = waittimes[var_34e72e17a2410a72 - 1];
                if (isdefined(waittime)) {
                    wait waittime;
                }
            }
        }
        wait 1;
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x18430
// Size: 0x7c
function function_a30ad7c4a9b45232(origin, count) {
    agents = undefined;
    while (!isdefined(agents)) {
        numagents = getdvarint(@"hash_53bfa830add0ab24", 4);
        if (count >= 4) {
            numagents += 2;
        }
        agents = namespace_bfef6903bca5845d::function_77acc10c4823dd8a(numagents, origin, "high", "mission", "demoReinforcements", undefined, undefined, undefined, undefined, "Helicopter");
        if (!isdefined(agents)) {
            wait 1;
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x184b4
// Size: 0x98
function function_2039e3a5f09b1a11(node) {
    level endon("game_ended");
    while (true) {
        if (istrue(node.shouldreinforce)) {
            agents = agentsnear(node.origin, 500);
            foreach (agent in agents) {
                thread pmc_terminalWatchAgentDisarmTimer(node, agent);
            }
        }
        wait 1;
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x18554
// Size: 0x21c
function pmc_terminalWatchAgentDisarmTimer(node, agent) {
    level endon("game_ended");
    if (istrue(namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "pmc_terminalWatchAgentDisarmTimer"))) {
        return;
    }
    namespace_14d36171baccf528::agentpers_setagentpersdata(agent, "pmc_terminalWatchAgentDisarmTimer", 1);
    var_4fe918623e730b5a = getdvarint(@"hash_4989dd8f2d0eb10f", 6);
    timeremaining = var_4fe918623e730b5a;
    while (true) {
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
                timeremaining -= level.framedurationseconds;
                if (timeremaining <= 0) {
                    players = charactersnear(node.origin, 500, 1);
                    if (!players.size) {
                        node [[ node.disablefunc ]](agent);
                    }
                    namespace_14d36171baccf528::agentpers_setagentpersdata(agent, "pmc_terminalWatchAgentDisarmTimer", 0);
                    return;
                }
            } else {
                /#
                    sphere(info[0]["<dev string:x83c>"], 10);
                #/
            }
        } else if (distance <= 500) {
            scripts\mp\ai_behavior::function_a5117518725da028(agent, node.origin, 0, 0, 0);
            timeremaining = var_4fe918623e730b5a;
        }
        waitframe();
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18778
// Size: 0x174
function function_b7fa1e109d78dfe5(node) {
    while (true) {
        node waittill("bomb_planted");
        node.nearbyplayers = [];
        scripts\mp\objidpoolmanager::update_objective_state(node.objidnum, "current");
        scripts\mp\objidpoolmanager::objective_show_progress(node.objidnum, 1);
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x188f4
// Size: 0xa2
function function_dd80845d6200b0dc(time) {
    level endon("game_ended");
    self endon("bomb_defused");
    /#
        sphere(self.origin + (0, 0, 50), 600, (1, 0, 0), 1, 100000);
    #/
    function_849b91807bee7e34(time);
    namespace_5ffce5a43b2d1ec2::function_accead05b2c47cb7();
    self.shouldreinforce = 0;
    if (isdefined(self.plantplayer)) {
        function_8359cadd253f9604(self.plantplayer, "destroy_terminal_supplies", 1);
    }
    wait 0.1;
    self.use freescriptable();
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1899e
// Size: 0x106
function function_849b91807bee7e34(time) {
    shownplayers = [];
    thread function_9dfa2432e378262a(time);
    starttime = gettime();
    offset = 5;
    totaltime = time + offset;
    self.plantedbomb thread namespace_5ffce5a43b2d1ec2::playtickingsound(time, offset);
    self.timeremaining = totaltime;
    while (true) {
        currenttime = gettime();
        duration = (currenttime - starttime) / 1000;
        var_de2c2a1fd468b5f = 1 - duration / time;
        progress = clamp(var_de2c2a1fd468b5f, 0, 1);
        self.timeremaining = totaltime - duration;
        shownplayers = function_5df48be36d20a070(self.nearbyplayers, shownplayers, progress, %MP_DMZ_MISSIONS/DMZ_DESTROY_SAM_PROGRESS_TEXT);
        scripts\mp\objidpoolmanager::objective_set_progress(self.objidnum, progress);
        if (self.timeremaining <= 0) {
            self notify("bomb_exploded");
            break;
        }
        waitframe();
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x18aac
// Size: 0x187
function function_5df48be36d20a070(nearbyplayers, shownplayers, progress, text) {
    allplayers = array_combine(nearbyplayers, shownplayers);
    var_f6fd7b0e73c3270c = shownplayers;
    foreach (player in allplayers) {
        if (!isdefined(player)) {
            continue;
        }
        if (isdefined(player.team) && !array_contains(self.teams, player.team)) {
            self.teams[self.teams.size] = player.team;
        }
        if (!array_contains(shownplayers, player) && array_contains(nearbyplayers, player)) {
            scripts\mp\objidpoolmanager::objective_show_player_progress(self.objidnum, player);
            scripts\mp\objidpoolmanager::function_8f7a55bda12ebb21(text, player);
            scripts\mp\objidpoolmanager::function_7299a742781a5030(2, player);
            scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(self.objidnum, player);
            var_f6fd7b0e73c3270c = array_add(var_f6fd7b0e73c3270c, player);
            continue;
        }
        if (array_contains(shownplayers, player) && !array_contains(nearbyplayers, player)) {
            scripts\mp\objidpoolmanager::objective_hide_player_progress(self.objidnum, player);
            scripts\mp\objidpoolmanager::function_7299a742781a5030(0, player);
            scripts\mp\objidpoolmanager::objective_playermask_hidefrom(self.objidnum, player);
            var_f6fd7b0e73c3270c = array_remove(var_f6fd7b0e73c3270c, player);
        }
    }
    return var_f6fd7b0e73c3270c;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18c3c
// Size: 0x35
function function_9dfa2432e378262a(timer) {
    level endon("game_ended");
    self endon("bomb_defused");
    wait timer;
    self.use setscriptablepartstate("dmz_supply_site_use_pmc", "unusable", 0);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18c79
// Size: 0x121
function function_2e94d8da4a6ed951() {
    level endon("game_ended");
    self endon("bomb_exploded");
    self waittill("bomb_defused");
    self.use setscriptablepartstate("dmz_supply_site_use_pmc", "usable", 0);
    foreach (player in self.nearbyplayers) {
        scripts\mp\objidpoolmanager::function_26259bd38697b5ad(self.objidnum, player);
    }
    self.nearbyplayers = [];
    planterteam = self.plantteam;
    scripts\mp\gametypes\br_gametype_dmz::showdmzsplash("dmz_demo_defused_lose", getteamdata(planterteam, "players"));
    if (isdefined(self.defuseplayer)) {
        scripts\engine\utility::function_f3bb4f4911a1beb2("pmc_missions", "onBombDefused", self.defuseplayer);
    }
    self.shouldreinforce = 0;
    self.use.origin = self.origin;
    self.plantedbomb delete();
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18da2
// Size: 0x13
function function_7ef66059655c6e3e(agent) {
    self notify("bomb_defused");
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x18dbd
// Size: 0xd3
function function_1e1fb042a28726e6(trigger, radius) {
    level endon("game_ended");
    self endon("bomb_exploded");
    self.nearbyplayers = [];
    self.teams = [];
    while (true) {
        trigger waittill("trigger", player);
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x18e98
// Size: 0x81
function function_34a83ef704f155d7(trigger, player, radius) {
    while (isdefined(player) && isalive(player) && isdefined(self.trigger) && distance(trigger.origin, player.origin) < radius * 1.2) {
        wait 0.2;
    }
    self.nearbyplayers = array_remove(self.nearbyplayers, player);
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x18f21
// Size: 0x42e
function function_ec7e73044204b1cf(instance, part, state, player, var_a5b2c541413aa895, usestring) {
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
            if (node.cancel || !scripts\mp\utility\player::isAliveAndNotInLastStand(player)) {
                node.planting = 0;
                namespace_5ffce5a43b2d1ec2::function_db896f4486ca187(player, bomb);
                instance setscriptablepartstate("dmz_supply_site_use_pmc", "usable", 0);
                return;
            }
            buttontime += level.framedurationseconds;
            waitframe();
        }
        origin = player.origin;
        namespace_5ffce5a43b2d1ec2::function_db896f4486ca187(player, bomb);
        bombent = spawn("script_model", origin);
        bombent setmodel("offhand_2h_wm_briefcase_bomb_v0");
        bombent.visuals = [];
        bombent.visuals[0] = spawn("script_model", origin);
        bombent.visuals[0] setmodel("tag_origin");
        bombent.curorigin = origin;
        bombent.offset3d = (0, 0, 15);
        bombent.safeorigin = origin;
        bombent.trigger = spawnstruct();
        bombent.icon = -1;
        bombent.owner = player;
        bombent scripts\mp\gameobjects::setdropped(undefined, undefined, 1);
        node.plantedbomb = bombent;
        node.plantedbomb.node = node;
        node.bombplanted = 1;
        node.plantplayer = player;
        node.plantteam = player.team;
        node.planting = 0;
        node notify("bomb_planted");
        return;
    }
    if (state == "defusable") {
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
            if (node.cancel || !scripts\mp\utility\player::isAliveAndNotInLastStand(player) || isdefined(player.var_2ca0dac193d83c1) && player.var_2ca0dac193d83c1) {
                node.defusing = 0;
                namespace_5ffce5a43b2d1ec2::function_db896f4486ca187(player, bomb);
                node.plantedbomb show();
                instance setscriptablepartstate("dmz_supply_site_use_pmc", "defusable");
                foreach (player in level.players) {
                    instance enablescriptableplayeruse(player);
                }
                return;
            }
            buttontime += level.framedurationseconds;
            waitframe();
        }
        node.defuseplayer = player;
        node.defusing = 0;
        node notify("bomb_defused");
        namespace_5ffce5a43b2d1ec2::function_db896f4486ca187(player, bomb);
        if (isdefined(node.plantedbomb)) {
            node.plantedbomb show();
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x19357
// Size: 0x2b1
function function_2d2046e72a3653fb(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (!isdefined(player.team)) {
        return;
    }
    if (!namespace_abc7ed0cde8527d4::safe_canuse(player)) {
        player scripts\mp\hud_message::showerrormessage(level.br_pickups.var_355cddb773cb000d);
        return;
    }
    if (state == "usable_not_open") {
        instance setscriptablepartstate(part, "unusable");
        instance.successfuluse = 0;
        instance thread namespace_abc7ed0cde8527d4::function_24765a7aabf0093e(player);
        instance namespace_abc7ed0cde8527d4::function_7f10e8e120314f4b(player, part);
        if (istrue(instance.successfuluse)) {
            instance.teams = [player.team];
            instance.trigger trigger_on();
            namespace_25b25d188ef778c4::function_1c2bd1696d29935b(player.team, "dmz_mission_safe_opening");
            scripts\mp\objidpoolmanager::update_objective_state(instance.objidnum, "current");
            scripts\mp\objidpoolmanager::objective_show_progress(instance.objidnum, 1);
            scripts\mp\objidpoolmanager::objective_teammask_addtomask(instance.objidnum, player.team);
            instance thread function_c606a52499149c25();
            wait 1;
            scripts\mp\gametypes\br_gametype_dmz::showdmzsplash("dmz_safe_defend_started", getteamdata(player.team, "players"), instance.node.poi);
        } else {
            instance setscriptablepartstate(part, "usable_not_open");
        }
        return;
    }
    if (state == "usable_drilling") {
        instance.node.paused = 0;
        instance.nearbyplayers = [];
        instance setscriptablepartstate("safe", "unusable_drilling");
        return;
    }
    if (state == "open_usable") {
        if (instance getscriptableparthasstate("safe", "unusable")) {
            instance setscriptablepartstate("safe", "unusable");
        }
        if (!isdefined(instance.contents)) {
            var_9256a8c4667baa69 = getdvarint(@"hash_4c9b0494a5ffac13", 2);
            items = scripts\mp\gametypes\br_lootcache::function_a76b46f057488cc0(instance, player.team, 23, var_9256a8c4667baa69);
            instance.containertype = 4;
            instance scripts\mp\gametypes\br_lootcache::lootcachespawncontents(items, 1, player, instance.contents);
            instance namespace_abc7ed0cde8527d4::function_20d58c7fb1074fc6(player.team);
            return;
        }
        instance scripts\mp\gametypes\br_lootcache::lootcachespawncontents(undefined, 1, player, instance.contents);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19610
// Size: 0x1d1
function function_c606a52499149c25() {
    level endon("game_ended");
    self endon("safe_unlocked");
    self.progress = 0;
    shownplayers = [];
    self.node.isactive = 1;
    self.node.shouldreinforce = 1;
    while (true) {
        if (isdefined(self.trigger) && !istrue(self.trigger.trigger_off)) {
            if (!istrue(self.node.paused)) {
                progressbefore = self.progress;
                self.progress = min(self.capturetime, self.progress + level.framedurationseconds);
            }
            progress = self.progress / self.capturetime;
            text = ter_op(istrue(self.node.paused), %MP_DMZ_MISSIONS/SAFE_PAUSED, %MP_DMZ_MISSIONS/OPENING_SAFE);
            shownplayers = function_5df48be36d20a070(self.nearbyplayers, shownplayers, progress, text);
            scripts\mp\objidpoolmanager::objective_set_progress(self.objidnum, progress);
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x197e9
// Size: 0xbd
function function_1c9e346732c1dcc5(agent) {
    self.paused = 1;
    self.safe setscriptablepartstate("safe", "usable_drilling");
    self.safe.nearbyplayers = [];
    foreach (team in self.safe.teams) {
        players = getteamdata(team, "players");
        scripts\mp\gametypes\br_gametype_dmz::showdmzsplash("dmz_train_safe_paused", players);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x198ae
// Size: 0x108
function function_c0849326027254f0() {
    if (scripts\mp\utility\game::getsubgametype() != "dmz") {
        return;
    }
    scriptable = "brloot_volatile_decoy_grenade";
    if (!isdefined(level.br_pickups)) {
        scripts\mp\gametypes\br_pickups::br_pickups_init();
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

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x199be
// Size: 0x77
function function_39564755f8f1046b() {
    level endon("game_ended");
    level.var_877f557047d60fb5 endon("death");
    while (true) {
        if (isdefined(level.var_877f557047d60fb5.targetent)) {
            level.var_877f557047d60fb5.origin = level.var_877f557047d60fb5.targetent.origin + (0, 0, 50);
        }
        waitframe();
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19a3d
// Size: 0x27f
function function_c7cfd1ad1977f03e() {
    level endon("game_ended");
    level.var_877f557047d60fb5 endon("death");
    firetypes = ["ar", "smg", "sniper"];
    footstepsounds = ["footFallSoundsA", "footFallSoundsB"];
    footsteptypes = ["footFallsSprint", "footFallsWalk"];
    while (true) {
        if (istrue(level.var_877f557047d60fb5.playsounds)) {
            playsteps = randomfloat(1) > 0.65;
            if (playsteps) {
                stepcount = randomintrange(6, 12);
                footstepsound = random(footstepsounds);
                footsteptype = random(footsteptypes);
                for (i = 0; i < stepcount; i++) {
                    if (istrue(level.var_877f557047d60fb5.playsounds)) {
                        level.var_877f557047d60fb5 setscriptablepartstate(footstepsound, footsteptype);
                        if (footstepsound == "footFallSoundsA") {
                            footstepsound = "footFallSoundsB";
                        } else {
                            footstepsound = "footFallSoundsA";
                        }
                    }
                    wait 0.15;
                }
            } else {
                firetype = random(firetypes);
                firecount = 1 + randomint(level.decoygrenadedata.firemaxcounts[firetype]);
                level.var_877f557047d60fb5 setscriptablepartstate("weaponSounds", firetype + "Fire", 0);
                var_5c362dcaaa44cdf0 = function_98a826b6b6d0d118(level.var_877f557047d60fb5.origin, 2000, undefined, 1000, 0);
                foreach (agent in var_5c362dcaaa44cdf0) {
                    agent aieventlistenerevent("gunshot", level.var_877f557047d60fb5.targetent, level.var_877f557047d60fb5.origin);
                }
                wait level.decoygrenadedata.firetimes[firetype];
            }
        }
        intervaltime = randomfloatrange(1, 5);
        wait intervaltime;
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x19cc4
// Size: 0x5d
function function_32cb9876a487c40f(scriptable, player) {
    level.var_877f557047d60fb5.playsounds = 1;
    level.var_877f557047d60fb5.origin = player.origin;
    level.var_877f557047d60fb5.targetent = player;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x19d29
// Size: 0x5b
function function_5df8cf35b1de080c(container, player) {
    level.var_877f557047d60fb5.playsounds = 1;
    level.var_877f557047d60fb5.targetent = undefined;
    level.var_877f557047d60fb5.origin = container.origin;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x19d8c
// Size: 0x59
function function_b46d7d7d4eccda8c(pickup, player, origin) {
    level.var_877f557047d60fb5.playsounds = 1;
    level.var_877f557047d60fb5.targetent = undefined;
    level.var_877f557047d60fb5.origin = origin;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x19ded
// Size: 0x66
function function_be5af8dc2f94e2ee(deaddrop, lootid) {
    level.var_877f557047d60fb5.playsounds = 1;
    level.var_877f557047d60fb5.targetent = undefined;
    level.var_877f557047d60fb5.origin = deaddrop.origin;
    return [lootid, 0];
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19e5c
// Size: 0x2a
function function_29ddd40932b14edb() {
    level.var_877f557047d60fb5.playsounds = 0;
    level.var_877f557047d60fb5.targetent = undefined;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x19e8e
// Size: 0x3b
function function_792282e9cede4876(player, item) {
    level.var_877f557047d60fb5.playsounds = 0;
    level.var_877f557047d60fb5.targetent = undefined;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x19ed1
// Size: 0x53
function function_54e94e9563adff5e(player, lootid, type, var_9fb3b576439ee3d, cashvalue) {
    level.var_877f557047d60fb5.playsounds = 0;
    level.var_877f557047d60fb5.targetent = undefined;
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19f2c
// Size: 0x13d
function function_83ba07b9cb8b0809() {
    spawn = getstruct("pmc_biolabs_hostage", "script_noteworthy");
    if (isdefined(spawn)) {
        scripts\mp\flags::function_1240434f4201ac9d("prematch_done");
        fakecontract = spawnstruct();
        fakecontract.teams = [];
        fakecontract.node = spawnstruct();
        fakecontract.node.target = "fake_debug_hostage";
        fakecontract.skipcontract = 1;
        var_679afef82bb8e515 = spawnstruct();
        spawn.targetname = "fake_debug_hostage";
        spawn.script_noteworthy = "hostage";
        addstruct(spawn);
        fakecontract namespace_232aeaeb467df5bd::function_b6b601986dcad85a();
        fakecontract.instance setscriptablepartstate("dmz_hostage", "remaining");
        foreach (player in level.players) {
            fakecontract.instance enablescriptableplayeruse(player);
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1a071
// Size: 0xf0
function function_ff7f720788558a70(agent, players) {
    uniqueteams = [];
    foreach (player in players) {
        if (isdefined(player.team) && !array_contains(uniqueteams, player.team)) {
            uniqueteams = array_add(uniqueteams, player.team);
        }
    }
    foreach (team in uniqueteams) {
        function_8a7a2427622e7572(team, "pmc_biolabs_hostage_exfil", 1);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a169
// Size: 0x274
function function_b74ad2c2c1691b18() {
    if (!scripts\cp_mp\utility\game_utility::function_5e0e3a24dbb1fae1()) {
        return;
    }
    structs = getstructarray("pmc_radiation_safe", "script_noteworthy");
    scripts\mp\flags::function_1240434f4201ac9d("radiation_initialized");
    foreach (node in structs) {
        if (namespace_7789f919216d38a2::radiation_isInRadiation(node.origin)) {
            safe = spawnscriptable("dmz_safe_pmc_terminal", node.origin, node.angles);
            safe.curorigin = safe.origin;
            safe.offset3d = (0, 0, 15);
            safe scripts\mp\gameobjects::requestid(0, 0, undefined, 1);
            objid = safe.objidnum;
            scripts\mp\objidpoolmanager::update_objective_icon(objid, "ui_map_icon_safe");
            scripts\mp\objidpoolmanager::update_objective_setbackground(objid, 1);
            scripts\mp\objidpoolmanager::update_objective_setzoffset(objid, 15);
            scripts\mp\objidpoolmanager::update_objective_position(objid, safe.origin + (0, 0, 15));
            scripts\mp\objidpoolmanager::objective_pin_global(objid, 1);
            scripts\mp\objidpoolmanager::function_d7e3c4a08682c1b9(objid, 1);
            scripts\mp\objidpoolmanager::objective_set_play_intro(objid, 0);
            if (level.safeprops.hideicons) {
                scripts\mp\objidpoolmanager::function_9cad42ac02eff950(objid);
            } else {
                scripts\mp\objidpoolmanager::function_a28e8535e00d34f3(objid);
            }
            scripts\mp\objidpoolmanager::function_6ae37618bb04ea60(objid);
            safe.node = node;
            node.safe = safe;
            safe setscriptablepartstate("safe", "usable_not_open");
            safe.trigger = spawn("trigger_radius", safe.node.origin, 0, int(128), int(512));
            safe.trigger trigger_off();
            safe.capturetime = getdvarint(@"hash_6045836c04e4d385", 300);
            safe.revealedteams = [];
            safe thread namespace_abc7ed0cde8527d4::function_474e2e9b4a997564(safe.trigger, 512);
            safe.var_ceb543956c7203e7 = &namespace_abc7ed0cde8527d4::function_9618cc73546d253d;
            safe.overrideusecallback = &function_c9ec79155b2119ba;
            break;
        }
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1a3e5
// Size: 0x252
function function_c9ec79155b2119ba(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (!isdefined(player.team)) {
        return;
    }
    if (!namespace_abc7ed0cde8527d4::safe_canuse(player)) {
        player scripts\mp\hud_message::showerrormessage(level.br_pickups.var_355cddb773cb000d);
        return;
    }
    if (state == "usable_not_open") {
        instance setscriptablepartstate(part, "unusable");
        instance.successfuluse = 0;
        instance thread namespace_abc7ed0cde8527d4::function_24765a7aabf0093e(player);
        instance namespace_abc7ed0cde8527d4::function_7f10e8e120314f4b(player, part);
        if (istrue(instance.successfuluse)) {
            instance.teams = [player.team];
            instance.trigger trigger_on();
            namespace_25b25d188ef778c4::function_1c2bd1696d29935b(player.team, "dmz_mission_safe_opening");
            scripts\mp\objidpoolmanager::update_objective_state(instance.objidnum, "current");
            scripts\mp\objidpoolmanager::objective_show_progress(instance.objidnum, 1);
            scripts\mp\objidpoolmanager::objective_teammask_addtomask(instance.objidnum, player.team);
            instance thread function_65ccf76ea342606();
            wait 1;
            scripts\mp\gametypes\br_gametype_dmz::showdmzsplash("dmz_safe_defend_started", getteamdata(player.team, "players"), instance.node.poi);
        } else {
            instance setscriptablepartstate(part, "usable_not_open");
        }
        return;
    }
    if (state == "open_usable") {
        if (instance getscriptableparthasstate("safe", "unusable")) {
            instance setscriptablepartstate("safe", "unusable");
        }
        if (!isdefined(instance.contents)) {
            lootid = namespace_38b993c4618e76cd::getlootidfromref("brloot_irradiated_gas_canister");
            instance scripts\mp\gametypes\br_lootcache::function_d683a60016231237(lootid, 1);
            instance.containertype = 4;
            instance scripts\mp\gametypes\br_lootcache::lootcachespawncontents(undefined, 1, player, instance.contents);
            instance namespace_abc7ed0cde8527d4::function_20d58c7fb1074fc6(player.team);
            return;
        }
        instance scripts\mp\gametypes\br_lootcache::lootcachespawncontents(undefined, 1, player, instance.contents);
    }
}

// Namespace pmc_missions / namespace_8361bad7391de074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a63f
// Size: 0x297
function function_65ccf76ea342606() {
    level endon("game_ended");
    self endon("safe_unlocked");
    self.progress = 0;
    var_a81135442ee1a731 = 0;
    shownplayers = [];
    timesincelastreinforcement = 0;
    while (true) {
        if (isdefined(self.trigger) && !istrue(self.trigger.trigger_off)) {
            currenttime = gettime();
            if (self.nearbyplayers.size > 0) {
                progressbefore = self.progress;
                self.progress = min(self.capturetime, self.progress + level.framedurationseconds);
            } else {
                progressbefore = self.progress;
                self.progress = max(0, self.progress - level.framedurationseconds * 0.5);
            }
            progress = self.progress / self.capturetime;
            shownplayers = namespace_abc7ed0cde8527d4::function_75a1596e8181156(self.nearbyplayers, shownplayers, progress);
            scripts\mp\objidpoolmanager::objective_set_progress(self.objidnum, progress);
            if (self.progress >= self.capturetime) {
                foreach (team in self.teams) {
                    function_8a7a2427622e7572(team, "pmc_radiation_safe_open", 1);
                }
                namespace_abc7ed0cde8527d4::function_67abfc6a70af2ccc();
            } else if (self.nearbyplayers.size > 0 && timesincelastreinforcement + 45000 < currenttime) {
                timesincelastreinforcement = currenttime;
                alertradius = 2816;
                agents = namespace_bfef6903bca5845d::function_353fecd1549f5f42(self.origin, alertradius, undefined, 3, undefined, 64, 128);
                if (isdefined(agents)) {
                    self.agents = array_combine(self.agents, agents);
                    var_a81135442ee1a731 += agents.size;
                }
                var_da117ca38efac51b = namespace_bfef6903bca5845d::function_77acc10c4823dd8a(6, self.origin, "high", "mission", "safeReinforcements", undefined, undefined, undefined, undefined, "Helicopter", 32, 64);
                if (isdefined(var_da117ca38efac51b) && var_da117ca38efac51b.size > 0) {
                    helicalled = 1;
                    self.agents = array_combine(self.agents, var_da117ca38efac51b);
                }
            }
        }
        waitframe();
    }
}

/#

    // Namespace pmc_missions / namespace_8361bad7391de074
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a8de
    // Size: 0x244
    function function_7b91bc1947716bcf() {
        level endon("<dev string:x848>");
        while (true) {
            value = getdvarint(@"hash_4d3888fdb854c18d", 0);
            if (value) {
                setdvar(@"hash_4d3888fdb854c18d", 0);
                function_dab637c713e2986f(level.players[0], value);
            }
            if (getdvarint(@"hash_7b8ff4311d323400", 0)) {
                setdvar(@"hash_7b8ff4311d323400", 0);
                function_a9f8fa06a358585b(level.players[0].team, "<dev string:x856>", 0, "<dev string:x861>", 0);
            }
            if (getdvarint(@"hash_20b0905187d34da1", 0)) {
                setdvar(@"hash_20b0905187d34da1", 0);
                function_a9f8fa06a358585b(level.players[0].team, "<dev string:x856>", 1, "<dev string:x861>", 0);
            }
            debugstring = getdvar(@"hash_a1eb1e43fb0a9af1", "<dev string:x70d>");
            switch (debugstring) {
            case #"hash_654cfdcaf93b64e1":
                player = level.players[0];
                if (isdefined(level.var_632f6a89b947fd5)) {
                    fullweaponname = getcompleteweaponname(level.var_632f6a89b947fd5);
                    scripts\mp\gametypes\br_weapons::br_forcegivecustomweapon(player, level.var_632f6a89b947fd5, fullweaponname, level.var_632f6a89b947fd5.basename);
                }
                break;
            case #"hash_af2000093a54848e":
                if (!isdefined(level.var_cc75a90d4b9108b1)) {
                    break;
                }
                foreach (player in level.players) {
                    radio = spawnscriptable("<dev string:x8a3>", player.origin);
                    radio.origin = drop_to_ground(radio.origin);
                }
            default:
                break;
            }
            setdvar(@"hash_a1eb1e43fb0a9af1", "<dev string:x70d>");
            wait 1;
        }
    }

#/
