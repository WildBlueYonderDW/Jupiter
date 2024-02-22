// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using scripts\mp\gametypes\br_blueprint_extract_spawn.gsc;
#using script_110fd2130c2ed1fe;
#using script_404df4d3a3b8cd80;
#using script_1c3dac686aa675cc;
#using script_6388860e9e2a83bd;
#using script_6ab78610e79a4aec;
#using scripts\mp\gametypes\br_bunker_utility.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\gametypes\br_callouts.gsc;
#using scripts\mp\gametypes\br_analytics.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_challenges.gsc;
#using script_64acb6ce534155b7;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\gametypes\br_armory_kiosk.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gametypes\br_rewards.gsc;
#using scripts\mp\perks\perks.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\gametypes\br_jugg_common.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using script_5238dee479bbf7fb;
#using scripts\mp\gametypes\br_publicevents.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\killstreaks\uav.gsc;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using scripts\mp\gametypes\br_dev.gsc;

#namespace namespace_bd5b51637804dbad;

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10a0
// Size: 0x55e
function init_quest_util() {
    if (!getdvarint(@"hash_90a3dfd557408611", 1)) {
        return;
    }
    level.questinfo = spawnstruct();
    level.questinfo.quests = [];
    level.questinfo.thinkers = [];
    level.questinfo.tabletinfo = [];
    level.questinfo.teamsonquests = [];
    level.questinfo.thinkindex = 0;
    level.questinfo.tablevalues = [];
    level.questinfo.rewards = spawnstruct();
    level.questinfo.rewards.categorytogroup = [];
    level.questinfo.rewards.grouptorewards = [];
    level.questinfo.rewards.scalertoscaleinfo = [];
    level.questinfo.rewards.rewardtotype = [];
    level.questinfo.rewards.rewardtovalue = [];
    level.questinfo.tiers = [];
    level.questinfo.unlockables = [];
    /#
        level.questinfo.debuginfo = spawnstruct();
        var_191417401f979fb4[0] = "vfx/iw8_br/gameplay/vfx_br_flare_smktrail";
        var_191417401f979fb4[1] = "quest_started";
        var_191417401f979fb4[2] = "questEnded";
        var_191417401f979fb4[3] = "onPlayerDisconnect";
        var_2484093a170df905 = [];
        var_2484093a170df905["No splash_key defined for message being displayed to '"] = 0;
        foreach (bit, str in var_191417401f979fb4) {
            var_2484093a170df905[str] = 1 << bit;
            var_2484093a170df905["No splash_key defined for message being displayed to '"] = var_2484093a170df905["No splash_key defined for message being displayed to '"] | 1 << bit;
        }
        var_2484093a170df905["mission"] = var_2484093a170df905["vfx/iw8_br/gameplay/vfx_br_flare_smktrail"] | var_2484093a170df905["quest_started"] | var_2484093a170df905["questEnded"];
        level.questinfo.debuginfo.var_191417401f979fb4 = var_191417401f979fb4;
        level.questinfo.debuginfo.var_2484093a170df905 = var_2484093a170df905;
        level.questinfo.debuginfo.var_a001e7b664eaee73 = 0;
    #/
    level.questinfo.defaultfilter = [];
    level.questinfo.defaultfilter[0] = &filtercondition_isdead;
    level.questinfo.defaultfilter[1] = &filtercondition_ingulag;
    level.questinfo.getactiveforteam = &getallactivequestsforteam;
    namespace_c5622898120e827f::function_eca79fa0f341ee08(7, &dangercircletick);
    if (namespace_71073fa38f11492::isfeaturedisabled("brQuests")) {
        return;
    }
    loadtables();
    namespace_f1d40c362677777e::registerondisconnecteventcallback(&onplayerdisconnect);
    namespace_8e13c187e2eade0c::init();
    if (getdvarint(@"hash_82bde055b11e6698", 0)) {
        namespace_94f9b19ae91ab934::init();
        namespace_8e6e608bc83e3d46::init();
        namespace_2af0110302b87c2::init();
        namespace_5a4a9f3e4a0baf2f::init();
        namespace_d076143c5177e740::init();
    }
    if (getdvarint(@"hash_b91a7ebb801d5968", 1) == 1) {
        namespace_ff69a74765774dfd::disablelootbunkercachelocations();
    }
    if (getdvarint(@"hash_fd6b014836f663e0", 1) == 1) {
        namespace_ff69a74765774dfd::disablebunker11cachelocations();
    }
    thread inittablets();
    thread setupcirclepeek();
    /#
        assert(isdefined(game["dialog"]));
    #/
    game["dialog"]["mission_gen_accept"] = "mission_mission_gen_accept";
    game["dialog"]["mission_misc_success"] = "contract_misc_success";
    game["dialog"]["mission_obj_change"] = "mission_mission_obj_change";
    game["dialog"]["mission_obj_moved"] = "mission_mission_obj_moved";
    game["dialog"]["mission_obj_next_ptarget"] = "mission_mission_obj_next_ptarget";
    game["dialog"]["mission_obj_next_nptarget"] = "mission_mission_obj_next_nptarget";
    game["dialog"]["mission_obj_warning_time"] = "mission_mission_obj_warning_time";
    game["dialog"]["mission_obj_warning_capture"] = "mission_mission_obj_warning_capture";
    game["dialog"]["mission_obj_circle_fail"] = "mission_mission_obj_circle_fail";
    game["dialog"]["mission_gen_fail"] = "mission_mission_gen_fail";
    game["dialog"]["mission_teammate_down"] = "mission_teammate_down";
    game["dialog"]["mission_enemy_down"] = "mission_enemy_down";
    if (!namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
        level._effect["vfx_dom_flare"] = loadfx("vfx/iw8_br/gameplay/vfx_br_flare_dom");
    }
    level._effect["vfx_revive_flare"] = loadfx("vfx/iw8_br/gameplay/vfx_br_flare_revive");
    level._effect["vfx_smktrail_mortar"] = loadfx("vfx/iw8_br/gameplay/vfx_br_flare_smktrail");
    level._effect["vfx_marker_base_orange_pulse"] = loadfx("vfx/iw8_br/gameplay/vfx_br_tr_marker.vfx");
    level.brmodevariantrewardcullfunc = undefined;
    /#
        level.questinfo thread function_f14edc2973202386();
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1605
// Size: 0x121
function loadtables() {
    for (row = 0; 1; row++) {
        unlockableindex = tablelookupbyrow("mp/brmission_unlockables.csv", row, 0);
        if (!isdefined(unlockableindex) || unlockableindex == "") {
            break;
        }
        if (int(tablelookup("mp/brmission_unlockables.csv", 0, unlockableindex, 3)) == 1) {
            continue;
        }
        var_a03d4fe1f134db01 = spawnstruct();
        var_a03d4fe1f134db01.unlockableindex = int(unlockableindex);
        var_a03d4fe1f134db01.lootid = int(tablelookup("mp/brmission_unlockables.csv", 0, unlockableindex, 1));
        var_a03d4fe1f134db01.extractunlockablechance = int(tablelookup("mp/brmission_unlockables.csv", 0, unlockableindex, 2));
        /#
            assert(isdefined(var_a03d4fe1f134db01.unlockableindex));
        #/
        /#
            assert(isdefined(var_a03d4fe1f134db01.lootid));
        #/
        /#
            assert(isdefined(var_a03d4fe1f134db01.extractunlockablechance));
        #/
        level.questinfo.unlockables[var_a03d4fe1f134db01.lootid] = var_a03d4fe1f134db01;
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x172d
// Size: 0x866
function inittablets() {
    level.questinfo.activetablets = [];
    /#
        level.questinfo.debuginfo.var_9db1e36a47913241 = [];
        foreach (type, info in level.questinfo.tabletinfo) {
            level.questinfo.debuginfo.var_9db1e36a47913241[type] = 0;
            level.questinfo.debuginfo.var_2f8e8ca203d36b1d[type] = 0;
        }
        level.questinfo.debuginfo.var_66a7ec880cde941b = 0;
        level.questinfo.debuginfo.var_7b2f9f2035df4396 = 0;
        level.questinfo.debuginfo.var_70ad3759919237b7 = [];
    #/
    var_64d2f24df5d49616 = getdvarfloat(@"hash_4ec62b4599196026", 0.667);
    var_294684d6a0deef46 = [];
    foreach (type, info in level.questinfo.tabletinfo) {
        var_a1093166de09e6b8 = getlootname(type);
        var_e0d1e3a2b6f5323a = getlootscriptablearray(var_a1093166de09e6b8);
        if (!info.enabled) {
            continue;
        }
        var_6d130ebb53ad2136 = getdvarfloat(@"hash_8d46517b8da8688", 1200);
        if (var_6d130ebb53ad2136 > 0) {
            var_7bea6d9f75c96cef = 0;
            foreach (kiosk in level.br_armory_kiosk.scriptables) {
                var_7ba908d45c350ca4 = getlootscriptablearrayinradius(var_a1093166de09e6b8, undefined, kiosk.origin, var_6d130ebb53ad2136);
                foreach (var_edba0a1c91ab84bf in var_7ba908d45c350ca4) {
                    if (istrue(var_edba0a1c91ab84bf.startdisabled)) {
                        continue;
                    }
                    var_edba0a1c91ab84bf.startdisabled = 1;
                    var_7bea6d9f75c96cef++;
                }
            }
            for (i = var_e0d1e3a2b6f5323a.size - 1; i >= 0 && var_7bea6d9f75c96cef; i--) {
                if (istrue(var_e0d1e3a2b6f5323a[i].startdisabled)) {
                    var_e0d1e3a2b6f5323a[i] = var_e0d1e3a2b6f5323a[var_e0d1e3a2b6f5323a.size - 1];
                    var_e0d1e3a2b6f5323a[var_e0d1e3a2b6f5323a.size - 1] = undefined;
                    var_7bea6d9f75c96cef--;
                }
            }
        }
        if (istrue(level.lowpopstart) && namespace_d20f8ef223912e12::lowpopallowtweaks()) {
            var_984f974fa5f11f8 = getdvarfloat(@"hash_cc6bb1e27a91186f", 0.8);
            var_4038cde6712b9f81 = int(min(var_e0d1e3a2b6f5323a.size, var_e0d1e3a2b6f5323a.size * (1 - var_984f974fa5f11f8) + 0.5));
            for (i = 0; i < var_4038cde6712b9f81; i++) {
                randindex = randomintrange(0, var_e0d1e3a2b6f5323a.size);
                var_e0d1e3a2b6f5323a[randindex].startdisabled = 1;
                var_e0d1e3a2b6f5323a[randindex] = var_e0d1e3a2b6f5323a[var_e0d1e3a2b6f5323a.size - 1];
                var_e0d1e3a2b6f5323a[var_e0d1e3a2b6f5323a.size - 1] = undefined;
            }
        }
        for (i = var_e0d1e3a2b6f5323a.size - 1; i >= 0; i--) {
            tablet = var_e0d1e3a2b6f5323a[i];
            tablet tabletinit(type);
            if (!tablet.init) {
                var_e0d1e3a2b6f5323a[i].startdisabled = 1;
                var_e0d1e3a2b6f5323a[i] = var_e0d1e3a2b6f5323a[var_e0d1e3a2b6f5323a.size - 1];
                var_e0d1e3a2b6f5323a[var_e0d1e3a2b6f5323a.size - 1] = undefined;
            }
        }
        if (var_e0d1e3a2b6f5323a.size) {
            setobjectivetypesomvarbit(type);
        }
        var_2c3363605abb4836 = var_e0d1e3a2b6f5323a.size * var_64d2f24df5d49616;
        var_5731f7181809474a = int(var_2c3363605abb4836);
        var_c678b652d11243b9 = var_2c3363605abb4836 - var_5731f7181809474a;
        if (randomfloat(1) < var_c678b652d11243b9) {
            var_5731f7181809474a++;
        }
        for (i = 0; i < var_5731f7181809474a; i++) {
            randindex = randomintrange(0, var_e0d1e3a2b6f5323a.size);
            tablet = var_e0d1e3a2b6f5323a[randindex];
            var_e0d1e3a2b6f5323a[randindex].startdisabled = 1;
            var_294684d6a0deef46[var_294684d6a0deef46.size] = var_e0d1e3a2b6f5323a[randindex];
            var_e0d1e3a2b6f5323a[randindex] = var_e0d1e3a2b6f5323a[var_e0d1e3a2b6f5323a.size - 1];
            var_e0d1e3a2b6f5323a[var_e0d1e3a2b6f5323a.size - 1] = undefined;
        }
    }
    zones = getarraykeys(level.calloutglobals.namelocations);
    var_6b7736374856505c = [];
    var_7b18bf75c63cf8be = getdvarint(@"hash_96db0b0e9378ad40", 1);
    if (var_7b18bf75c63cf8be > 0) {
        foreach (zone in zones) {
            var_6b7736374856505c[zone] = var_7b18bf75c63cf8be;
            /#
                level.questinfo.debuginfo.var_70ad3759919237b7[zone] = [];
            #/
        }
    }
    var_7ca789cbf8098e = 0;
    foreach (type, info in level.questinfo.tabletinfo) {
        var_e0d1e3a2b6f5323a = getlootscriptablearray(getlootname(type));
        var_7ca789cbf8098e = var_7ca789cbf8098e + var_e0d1e3a2b6f5323a.size;
        if (info.enabled) {
            foreach (tablet in var_e0d1e3a2b6f5323a) {
                if (istrue(tablet.startdisabled)) {
                    tablet tablethide();
                } else {
                    tablet tabletshow();
                    if (var_6b7736374856505c.size > 0) {
                        var_ea19c4e9489cd7bf = namespace_cf43e8181d279e3e::getlocationnameforpoint(tablet.origin);
                        if (isdefined(var_6b7736374856505c[var_ea19c4e9489cd7bf])) {
                            /#
                                var_421bf0c7afec94ae = level.questinfo.debuginfo.var_70ad3759919237b7[var_ea19c4e9489cd7bf].size;
                                level.questinfo.debuginfo.var_70ad3759919237b7[var_ea19c4e9489cd7bf][var_421bf0c7afec94ae] = tablet;
                            #/
                            var_6b7736374856505c[var_ea19c4e9489cd7bf]--;
                            if (!var_6b7736374856505c[var_ea19c4e9489cd7bf]) {
                                var_6b7736374856505c[var_ea19c4e9489cd7bf] = undefined;
                            }
                        }
                    }
                }
            }
        } else {
            foreach (tablet in var_e0d1e3a2b6f5323a) {
                tablet tablethide();
            }
        }
    }
    if (var_6b7736374856505c.size) {
        var_294684d6a0deef46 = array_randomize(var_294684d6a0deef46);
        for (i = 0; i < var_294684d6a0deef46.size; i++) {
            tablet = var_294684d6a0deef46[i];
            var_ea19c4e9489cd7bf = namespace_cf43e8181d279e3e::getlocationnameforpoint(tablet.origin);
            if (isdefined(var_6b7736374856505c[var_ea19c4e9489cd7bf])) {
                tablet tabletshow();
                /#
                    var_421bf0c7afec94ae = level.questinfo.debuginfo.var_70ad3759919237b7[var_ea19c4e9489cd7bf].size;
                    level.questinfo.debuginfo.var_70ad3759919237b7[var_ea19c4e9489cd7bf][var_421bf0c7afec94ae] = tablet;
                #/
                var_6b7736374856505c[var_ea19c4e9489cd7bf]--;
                if (!var_6b7736374856505c[var_ea19c4e9489cd7bf]) {
                    var_6b7736374856505c[var_ea19c4e9489cd7bf] = undefined;
                    if (!var_6b7736374856505c.size) {
                        break;
                    }
                }
            }
        }
    }
    activequests = level.questinfo.activetablets.size;
    var_9afe8d8a9aed972a = var_294684d6a0deef46.size;
    namespace_a011fbf6d93f25e5::branalytics_inittablets(var_7ca789cbf8098e, activequests, var_9afe8d8a9aed972a, var_64d2f24df5d49616);
    if (namespace_71073fa38f11492::isfeatureenabled("tabletReplace")) {
        thread tabletreplace(var_294684d6a0deef46);
    } else {
        thread delayedshowtablets(var_294684d6a0deef46);
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f9a
// Size: 0x46
function setobjectivetypesomvarbit(type) {
    index = getquestindex(type);
    /#
        assertex(index < 32, "Quest type " + type + " has index >= 32");
    #/
    setomnvarbit("ui_br_objective_types", index, 1);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fe7
// Size: 0xc7
function tabletreplace(var_294684d6a0deef46) {
    if (!isdefined(level.br_level)) {
        return;
    }
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    var_294684d6a0deef46 = array_randomize(var_294684d6a0deef46);
    var_fb4145cf6a25541e = 0;
    var_40fb495a4451d505 = level.tabletreplacefrequency;
    i = 0;
    while (i < var_294684d6a0deef46.size) {
        tablet = var_294684d6a0deef46[i];
        level waittill("quest_started");
        if (isdefined(level.tabletreplacefrequency) && level.tabletreplacefrequency != -1) {
            var_fb4145cf6a25541e++;
            if (var_fb4145cf6a25541e >= var_40fb495a4451d505) {
                tablet tabletshow();
                var_40fb495a4451d505 = var_40fb495a4451d505 + level.tabletreplacefrequency;
                i++;
            }
        } else {
            tablet tabletshow();
            i++;
        }
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20b5
// Size: 0x231
function delayedshowtablets(var_294684d6a0deef46) {
    if (!isdefined(level.br_level)) {
        return;
    }
    var_46599dab79a549 = level.br_level.br_circledelaytimes.size - 1 - getdvarint(@"hash_96878da693689ccd", 4);
    var_f5f66e7f9cb52c09 = getdvarfloat(@"hash_743253d28cd0d1f7", 0.3);
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    var_495d2ed937e965e = [];
    for (i = 0; i < var_294684d6a0deef46.size; i++) {
        tablet = var_294684d6a0deef46[i];
        tablet.circleindex = namespace_c5622898120e827f::getcircleindexforpoint(tablet.origin);
        if (tablet.circleindex >= 0) {
            var_495d2ed937e965e[var_495d2ed937e965e.size] = tablet;
        }
    }
    var_294684d6a0deef46 = array_randomize(var_495d2ed937e965e);
    while (1) {
        level waittill("br_circle_set");
        if (!level.br_circle.circleindex) {
            namespace_a011fbf6d93f25e5::branalytics_delayedshowtablets(0, var_f5f66e7f9cb52c09, var_495d2ed937e965e.size, 0);
            continue;
        }
        var_495d2ed937e965e = [];
        for (i = 0; i < var_294684d6a0deef46.size; i++) {
            tablet = var_294684d6a0deef46[i];
            if (tablet.circleindex >= level.br_circle.circleindex) {
                var_495d2ed937e965e[var_495d2ed937e965e.size] = tablet;
            }
        }
        var_8fa722572853ffb7 = int(ceil(var_495d2ed937e965e.size * var_f5f66e7f9cb52c09));
        var_cf6dc40ca9d1b393 = int(max(0, getdvarint(@"hash_6cd10c5d6e2a6220", 100) - level.questinfo.activetablets.size));
        var_8fa722572853ffb7 = int(min(var_8fa722572853ffb7, var_cf6dc40ca9d1b393));
        for (i = 0; i < var_8fa722572853ffb7; i++) {
            tablet = var_495d2ed937e965e[i];
            tablet tabletshow();
        }
        var_294684d6a0deef46 = [];
        for (i = var_8fa722572853ffb7; i < var_495d2ed937e965e.size; i++) {
            var_294684d6a0deef46[var_294684d6a0deef46.size] = var_495d2ed937e965e[i];
        }
        namespace_a011fbf6d93f25e5::branalytics_delayedshowtablets(level.br_circle.circleindex, var_f5f66e7f9cb52c09, var_495d2ed937e965e.size, var_8fa722572853ffb7);
        if (level.br_circle.circleindex >= var_46599dab79a549) {
            break;
        }
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22ed
// Size: 0xcd
function disablealltablets() {
    foreach (type, info in level.questinfo.tabletinfo) {
        var_e0d1e3a2b6f5323a = getlootscriptablearray(getlootname(type));
        if (info.enabled) {
            foreach (tablet in var_e0d1e3a2b6f5323a) {
                tablet tablethide();
            }
        }
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23c1
// Size: 0xb
function tablethide() {
    thread _tablethide();
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23d3
// Size: 0x1e
function _tablethide() {
    self endon("show");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    namespace_cb965d2f71fefddc::loothide(self);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23f8
// Size: 0xbf
function tabletshow() {
    /#
        assert(isdefined(self.init));
    #/
    self notify("show");
    part = self.type;
    self setscriptablepartstate(part, "visible");
    level.questinfo.activetablets["" + self.index] = self;
    namespace_a011fbf6d93f25e5::branalytics_spawntablet(self);
    /#
        level.questinfo.debuginfo.var_9db1e36a47913241[self.tablettype]++;
        level.questinfo.debuginfo.var_2f8e8ca203d36b1d[self.tablettype]++;
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24be
// Size: 0x85
function tabletinit(type) {
    if (isdefined(self.init)) {
        return;
    }
    self.init = 1;
    self.tablettype = type;
    tabletinit = level.questinfo.quests[type].funcs["tabletInit"];
    if (isdefined(tabletinit)) {
        self.init = self [[ tabletinit ]]();
        if (!self.init) {
            namespace_a011fbf6d93f25e5::branalytics_invalidtablet(self);
        }
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x254a
// Size: 0x87
function onquesttablethide(instance) {
    if (isdefined(level.questinfo.activetablets["" + instance.index])) {
        /#
            level.questinfo.debuginfo.var_9db1e36a47913241[instance.tablettype]--;
        #/
        level.questinfo.activetablets["" + instance.index] = undefined;
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25d8
// Size: 0x60
function function_8e57889ac5dda0bc(instance) {
    /#
        level.questinfo.debuginfo.var_9db1e36a47913241[instance.tablettype]++;
    #/
    level.questinfo.activetablets["" + instance.index] = instance;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x263f
// Size: 0x41
function getlootname(category) {
    var_a1093166de09e6b8 = "brloot_" + category + "_tablet";
    if (getdvarint(@"hash_39c3947a2e4f5f9e") != 0) {
        var_a1093166de09e6b8 = var_a1093166de09e6b8 + "_mgl";
    }
    return var_a1093166de09e6b8;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2688
// Size: 0xa9
function registerteamonquest(team, player) {
    /#
        function_132b6261e829fa9c();
    #/
    namespace_a011fbf6d93f25e5::branalytics_missionstart(self, player);
    level.questinfo.teamsonquests = array_add(level.questinfo.teamsonquests, team);
    if (!isdefined(level.questinfo.maxperkbonustier)) {
        level.questinfo.maxperkbonustier = [];
    }
    level.questinfo.maxperkbonustier[team] = getquestperkbonus(team, 1);
    level notify("quest_started", team);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2738
// Size: 0x45e
function releaseteamonquest(team) {
    /#
        assertex(array_contains(level.questinfo.teamsonquests, team), "releaseTeamOnQuest called for unregistered team '" + team + "'");
    #/
    /#
        function_132b6261e829fa9c();
    #/
    if (isdefined(level.questinfo.maxperkbonustier)) {
        level.questinfo.maxperkbonustier[team] = undefined;
    }
    level.questinfo.teamsonquests = array_remove(level.questinfo.teamsonquests, team);
    var_89eddde3da46bc8d = getquestrewardtier(team);
    results = [];
    if (isdefined(self.result) && self.result == "success") {
        foreach (player in getteamdata(team, "players")) {
            if (isbot(player) && namespace_d3d40f75bb4e4c32::istutorial()) {
                continue;
            }
            player.brmissionscompleted = get_int_or_0(player.brmissionscompleted) + 1;
            if (level.var_58adce74179ab9ef) {
                player incpersstat("objectivesCompleted", 1);
                player namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("missionsCompleted", player getpersstat("objectivesCompleted"));
            } else {
                player namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("missionsCompleted", player.brmissionscompleted);
            }
            player namespace_3c5a4254f2b957ea::incpersstat("contracts", 1);
            if (!isdefined(player.brmissiontypescompleted)) {
                player.brmissiontypescompleted = [];
            }
            player.brmissiontypescompleted[self.questcategory] = get_int_or_0(player.brmissiontypescompleted[self.questcategory]) + 1;
            player namespace_a553e80c09b00591::challengeevaluator("br_mastery_fiveContracts");
        }
        if (getdvarint(@"hash_82bde055b11e6698", 0)) {
            results = givequestrewardsinstance(team, self.rewardorigin, self.rewardangles, self.rewardscriptable, self.contributingplayers);
        }
    }
    if (isdefined(self.result)) {
        var_a4bc9ad7065c48e9 = ter_op(self.result == "success", 1, 2);
        var_1bbeb265ef74bc60 = self.category;
        foreach (player in namespace_54d20dd0dd79277f::getteamdata(team, "players")) {
            if (isbot(player) && namespace_d3d40f75bb4e4c32::istutorial()) {
                continue;
            }
            contractid = namespace_1eb3c4e0e28fac71::getquesttableindex(self.category);
            player namespace_aad14af462a74d08::oncontractend(contractid, var_a4bc9ad7065c48e9 == 1, 1);
            player notify("calloutmarkerping_warzoneKillQuestIcon");
        }
        if (isdefined(self.targetteam)) {
            var_c0cbb1ecd0d11afd = ter_op(self.result == "success", 2, 1);
            foreach (player in namespace_54d20dd0dd79277f::getteamdata(self.targetteam, "players")) {
                if (isbot(player) && namespace_d3d40f75bb4e4c32::istutorial()) {
                    continue;
                }
                contractid = namespace_1eb3c4e0e28fac71::getquesttableindex(self.category);
                player namespace_aad14af462a74d08::oncontractend(contractid, var_c0cbb1ecd0d11afd == 1, 2);
            }
        }
    }
    teamplayers = namespace_54d20dd0dd79277f::getteamdata(team, "players");
    var_ef08909f6cbf35fc = teamplayers.size;
    namespace_a011fbf6d93f25e5::branalytics_missionend(self, var_89eddde3da46bc8d, results, var_ef08909f6cbf35fc);
    self notify("questEnded");
    if (isdefined(self.rewardscriptable)) {
        self.rewardscriptable notify("questEnded", team);
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b9d
// Size: 0x9f
function startteamcontractchallenge(category, var_a705a5a5884ebf9c, team) {
    foreach (player in getteamdata(team, "players")) {
        if (isbot(player) && namespace_d3d40f75bb4e4c32::istutorial()) {
            continue;
        }
        contractid = namespace_1eb3c4e0e28fac71::getquesttableindex(category);
        player namespace_aad14af462a74d08::oncontractstart(contractid, var_a705a5a5884ebf9c);
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c43
// Size: 0xd3
function takequesttablet(instance) {
    /#
        level.questinfo.debuginfo.var_66a7ec880cde941b++;
    #/
    if (getdvarint(@"hash_82bde055b11e6698", 0)) {
        switch (instance.type) {
        case #"hash_8094e885a45098b4":
            namespace_94f9b19ae91ab934::takequestitem(instance);
            break;
        case #"hash_c8230662b0d30e46":
            namespace_8e6e608bc83e3d46::takequestitem(instance);
            break;
        case #"hash_c62e49742391cbbe":
            namespace_2af0110302b87c2::takequestitem(instance);
            break;
        case #"hash_e13eb7bd4cbc4cf7":
            namespace_5a4a9f3e4a0baf2f::takequestitem(instance);
            break;
        case #"hash_a0acbfc0d6e070be":
            namespace_d076143c5177e740::takequestitem(instance);
            break;
        }
    }
    namespace_c6ccccd95254983f::modify_plunder_itemsinworld("brloot_mission_tablet", -1);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d1d
// Size: 0x1b8
function dangercircletick(var_819edacdacb810e4, var_e86632d645c137d0, var_5d954f1724092f5a) {
    if (!isdefined(level.questinfo)) {
        return;
    }
    var_52d59c928eb97c81 = var_e86632d645c137d0 + var_5d954f1724092f5a;
    foreach (tablet in level.questinfo.activetablets) {
        if (distance2dsquared(var_819edacdacb810e4, tablet.origin) > var_52d59c928eb97c81 * var_52d59c928eb97c81) {
            /#
                level.questinfo.debuginfo.var_7b2f9f2035df4396++;
            #/
            namespace_cb965d2f71fefddc::loothide(tablet);
            namespace_c6ccccd95254983f::modify_plunder_itemsinworld("brloot_mission_tablet", -1);
        }
    }
    foreach (quest in level.questinfo.quests) {
        if (isdefined(quest.funcs["circleTick"])) {
            foreach (instance in quest.instances) {
                instance [[ quest.funcs["circleTick"] ]](var_819edacdacb810e4, var_52d59c928eb97c81);
            }
        }
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2edc
// Size: 0xa6
function createquestinstance(category, var_fb5fdfafc29f4513, missionid, rewardscriptable) {
    instance = spawnstruct();
    /#
        instance.debugtype = "travel";
    #/
    instance.questcategory = category;
    instance.enabled = 1;
    instance.category = category;
    instance.id = var_fb5fdfafc29f4513;
    instance.missionid = "" + missionid;
    instance.rewardscriptable = rewardscriptable;
    instance _assignthinkoffset();
    return instance;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f8a
// Size: 0xe7
function addquestinstance(category, var_2c1f354cfd7716e) {
    /#
        assertex(isdefined(level.questinfo.quests[category]), "UNDEFINED Quest Type'" + category + "'");
    #/
    if (!istrue(level.questinfo.ismanagerthreadthinking)) {
        _initmanagerquestthread();
        level.questinfo thread _questmanagerthread();
    }
    if (!_isquestthreaded(category) && isdefined(level.questinfo.quests[category].numthinkfuncs)) {
        if (_checkforregister(category, "initQuestVars")) {
            level.questinfo.quests[category] _runinitquestvars(category);
        }
        _runaddquestinstance(category, var_2c1f354cfd7716e);
        _runaddquestthread(category);
    } else {
        _runaddquestinstance(category, var_2c1f354cfd7716e);
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3078
// Size: 0xdc
function removequestinstance() {
    /#
        function_132b6261e829fa9c();
    #/
    if (istrue(self.removed)) {
        return;
    }
    self.removed = 1;
    category = self.questcategory;
    /#
        assertex(isdefined(level.questinfo.quests[category].funcs["removeInstance"]), "UNDEFINED level.questInfo.quests['" + category + "'].funcs['removeInstance']");
    #/
    _runremovequestinstance(category);
    if (isdefined(self.subscribedlocale)) {
        leavequestlocale();
    }
    if (_questinstancesactive(category) <= 0) {
        if (_checkforregister(category, "clearQuestVars")) {
            level.questinfo.quests[category] _runclearquestvars(category);
        }
        if (_questthreadsactive() <= 0) {
            _removemanagerquestthread();
        }
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x315b
// Size: 0x18
function isquestinstancealocale(instance) {
    return isdefined(instance.subscribedinstances);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x317b
// Size: 0x19
function _initmanagerquestthread() {
    level.questinfo.ismanagerthreadthinking = 1;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x319b
// Size: 0x20
function _removemanagerquestthread() {
    level notify("end_quest_manager_thread");
    level.questinfo.ismanagerthreadthinking = 0;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31c2
// Size: 0x124
function _questmanagerthread() {
    level endon("game_ended");
    level endon("end_quest_manager_thread");
    for (;;) {
        wait(0.05);
        level.questinfo.thinkindex++;
        foreach (var_29b3d4262d4b443c in level.questinfo.thinkers) {
            if (!level.questinfo.quests[var_29b3d4262d4b443c].enabled) {
                continue;
            }
            foreach (instance in level.questinfo.quests[var_29b3d4262d4b443c].instances) {
                if (instance.enabled) {
                    instance _runquestthinkfunctions(var_29b3d4262d4b443c);
                }
            }
        }
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32ed
// Size: 0xd0
function _runquestthinkfunctions(var_29b3d4262d4b443c) {
    /#
        function_132b6261e829fa9c();
    #/
    for (index = 0; index < level.questinfo.quests[var_29b3d4262d4b443c].numthinkfuncs; index++) {
        if ((level.questinfo.thinkindex - self.thinkoffset + self.firstthink) % level.questinfo.quests[var_29b3d4262d4b443c].thinkrates[index] == 0) {
            var_6b9f4c30d54f0f83 = "questThink" + index;
            [[ level.questinfo.quests[var_29b3d4262d4b443c].funcs[var_6b9f4c30d54f0f83] ]]();
        }
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33c4
// Size: 0x85
function _assignthinkoffset() {
    /#
        function_132b6261e829fa9c();
    #/
    if (!isdefined(level.questinfo.thinkoffset)) {
        level.questinfo.thinkoffset = 0;
    }
    self.thinkoffset = level.questinfo.thinkoffset;
    self.firstthink = level.questinfo.thinkindex;
    level.questinfo.thinkoffset++;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3450
// Size: 0x6e
function _registerquestfunc(category, func, var_6b9f4c30d54f0f83) {
    /#
        /#
            assertex(isdefined(level.questinfo.quests[category]), "end" + category + "directional_uav");
        #/
    #/
    level.questinfo.quests[category].funcs[var_6b9f4c30d54f0f83] = func;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34c5
// Size: 0x36
function _checkforregister(category, var_6b9f4c30d54f0f83) {
    return isdefined(level.questinfo.quests[category].funcs[var_6b9f4c30d54f0f83]);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3503
// Size: 0x8e
function registerquestcategory(category, var_4c43a06a2d630dfd) {
    enabled = getdvarint(function_2ef675c13ca1c4af(@"hash_71622bba3f9292f4", category, "_quest"), var_4c43a06a2d630dfd);
    if (namespace_71073fa38f11492::isfeaturedisabled("missions")) {
        enabled = 0;
    }
    info = spawnstruct();
    info.enabled = enabled;
    level.questinfo.tabletinfo[category] = info;
    if (!enabled) {
        return 0;
    }
    _registerquestcategory(category);
    return 1;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3599
// Size: 0x14
function registerquestlocale(category) {
    _registerquestcategory(category);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35b4
// Size: 0xee
function _registerquestcategory(category) {
    if (!isdefined(level.questinfo.quests[category])) {
        level.questinfo.quests[category] = spawnstruct();
        level.questinfo.quests[category].initflag = 0;
        level.questinfo.quests[category].hasinitfunc = 0;
        level.questinfo.quests[category].funcs = [];
        level.questinfo.quests[category].instances = [];
        level.questinfo.quests[category].enabled = 1;
        registerquestcategorytablevalues(category);
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36a9
// Size: 0x6e
function registerquestcategorytablevalues(category) {
    /#
        assert(!isdefined(level.questinfo.tablevalues[category]));
    #/
    level.questinfo.tablevalues[category] = spawnstruct();
    level.questinfo.tablevalues[category].index = getquesttableindex(category);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x371e
// Size: 0x44
function registerinitquestvars(category, func) {
    _registerquestfunc(category, func, "initQuestVars");
    level.questinfo.quests[category].hasinitfunc = 1;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3769
// Size: 0x182
function registerquestthink(category, func, thinkrate) {
    /#
        /#
            assertex(isdefined(category), "end" + category + "string");
        #/
    #/
    /#
        /#
            assertex(isdefined(func), "<unknown string>" + category + "string");
        #/
    #/
    /#
        /#
            assertex(isdefined(thinkrate), "<unknown string>" + category + "string");
        #/
    #/
    if (!isdefined(level.questinfo.quests[category].numthinkfuncs)) {
        level.questinfo.quests[category].numthinkfuncs = 0;
    }
    var_3d29d068e46cb221 = int(thinkrate * 20);
    level.questinfo.quests[category].thinkrates[level.questinfo.quests[category].numthinkfuncs] = var_3d29d068e46cb221;
    var_6b9f4c30d54f0f83 = "questThink" + level.questinfo.quests[category].numthinkfuncs;
    _registerquestfunc(category, func, var_6b9f4c30d54f0f83);
    level.questinfo.quests[category].numthinkfuncs = level.questinfo.quests[category].numthinkfuncs + 1;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38f2
// Size: 0x22
function registerquestcircletick(category, func) {
    _registerquestfunc(category, func, "circleTick");
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x391b
// Size: 0x22
function registerremovequestinstance(category, func) {
    _registerquestfunc(category, func, "removeInstance");
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3944
// Size: 0x22
function registerclearquestvars(category, func) {
    _registerquestfunc(category, func, "clearQuestVars");
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x396d
// Size: 0x168
function registerplayerfilter(category, var_9e41235ac60933d8, var_abcd53565564fc79) {
    /#
        /#
            assertex(isdefined(level.questinfo.quests[category]), "end" + category + "directional_uav");
        #/
    #/
    /#
        /#
            assertex(isarray(var_9e41235ac60933d8), "<unknown string>" + category + "directional_uav");
        #/
    #/
    if (!isdefined(level.questinfo.quests[category].filters)) {
        level.questinfo.quests[category].filters = [];
    }
    if (isdefined(var_abcd53565564fc79)) {
        /#
            assertex(!isdefined(level.questinfo.quests[category].filters[var_abcd53565564fc79]), "Duplicate Filter Registered for '" + category + "' at Index '" + var_abcd53565564fc79 + "'");
        #/
        level.questinfo.quests[category].filters[var_abcd53565564fc79] = var_9e41235ac60933d8;
    } else {
        count = level.questinfo.quests[category].filters.size;
        level.questinfo.quests[category].filters[count] = var_9e41235ac60933d8;
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3adc
// Size: 0x22
function registeronplayerkilled(category, func) {
    _registerquestfunc(category, func, "onPlayerKilled");
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b05
// Size: 0x22
function registeronplayerdisconnect(category, func) {
    _registerquestfunc(category, func, "onPlayerDisconnect");
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b2e
// Size: 0x22
function registeronentergulag(category, func) {
    _registerquestfunc(category, func, "onEnterGulag");
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b57
// Size: 0x22
function registeronrespawn(category, func) {
    _registerquestfunc(category, func, "onRespawn");
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b80
// Size: 0x22
function registerontimerupdate(category, func) {
    _registerquestfunc(category, func, "onTimerUpdate");
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ba9
// Size: 0x22
function registerontimerexpired(category, func) {
    _registerquestfunc(category, func, "onTimerExpired");
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bd2
// Size: 0x22
function registertabletinit(category, func) {
    _registerquestfunc(category, func, "tabletInit");
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3bfb
// Size: 0x18
function _clearregisters(category) {
    var_1f8f4a275423b76c = [];
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c1a
// Size: 0xf6
function onplayerkilled(attacker, victim) {
    if (!isdefined(level.questinfo)) {
        return;
    }
    foreach (quest in level.questinfo.quests) {
        if (isdefined(quest.funcs["onPlayerKilled"])) {
            foreach (instance in quest.instances) {
                instance [[ quest.funcs["onPlayerKilled"] ]](attacker, victim);
            }
        }
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d17
// Size: 0x4e
function onplayerconnect(player) {
    if (!isdefined(player.team) || !isdefined(level.questinfo)) {
        return;
    }
    setquestrewardtier(player.team, getquestrewardtier(player.team));
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d6c
// Size: 0xec
function onplayerdisconnect(player) {
    if (!isdefined(level.questinfo)) {
        return;
    }
    foreach (quest in level.questinfo.quests) {
        if (isdefined(quest.funcs["onPlayerDisconnect"])) {
            foreach (instance in quest.instances) {
                instance [[ quest.funcs["onPlayerDisconnect"] ]](player);
            }
        }
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e5f
// Size: 0xec
function onplayerentergulag() {
    /#
        function_fe3b51cfbf0f97c5();
    #/
    if (!isdefined(level.questinfo)) {
        return;
    }
    foreach (quest in level.questinfo.quests) {
        if (isdefined(quest.funcs["onEnterGulag"])) {
            foreach (instance in quest.instances) {
                instance [[ quest.funcs["onEnterGulag"] ]](self);
            }
        }
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f52
// Size: 0xfd
function onplayerrespawn() {
    /#
        function_fe3b51cfbf0f97c5();
    #/
    if (!isdefined(level.questinfo)) {
        return;
    }
    self setclientomnvar("ui_player_spawned_notify", gettime());
    foreach (quest in level.questinfo.quests) {
        if (isdefined(quest.funcs["onRespawn"])) {
            foreach (instance in quest.instances) {
                instance [[ quest.funcs["onRespawn"] ]](self);
            }
        }
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4056
// Size: 0x34
function _runinitquestvars(category) {
    [[ level.questinfo.quests[category].funcs["initQuestVars"] ]]();
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4091
// Size: 0x106
function _runaddquestthread(category) {
    if (!_isquestthreaded(category)) {
        /#
            for (index = 0; index < level.questinfo.quests[category].numthinkfuncs; index++) {
                /#
                    assertex(isdefined(level.questinfo.quests[category].funcs["<unknown string>" + index]), "<unknown string>" + category + "<unknown string>" + index + "<unknown string>");
                #/
            }
        #/
        count = level.questinfo.thinkers.size;
        level.questinfo.thinkers[count] = category;
        level.questinfo.quests[category].enabled = 1;
    } else {
        /#
            println("<unknown string>" + category + "<unknown string>");
        #/
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x419e
// Size: 0x41
function _runaddquestinstance(category, var_2c1f354cfd7716e) {
    level.questinfo.quests[category].instances[var_2c1f354cfd7716e.id] = var_2c1f354cfd7716e;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41e6
// Size: 0x66
function _runremovequestinstance(category) {
    self [[ level.questinfo.quests[category].funcs["removeInstance"] ]]();
    self notify("removed");
    level.questinfo.quests[category].instances[self.id] = undefined;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4253
// Size: 0x83
function _runclearquestvars(category) {
    [[ level.questinfo.quests[category].funcs["clearQuestVars"] ]]();
    level.questinfo.thinkers = array_remove(level.questinfo.thinkers, category);
    level.questinfo.quests[category].enabled = 0;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42dd
// Size: 0x2d
function _isquestthreaded(category) {
    if (array_contains(level.questinfo.thinkers, category)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4312
// Size: 0x51
function _questinstancesactive(category) {
    if (isdefined(level.questinfo.quests[category].instances)) {
        return level.questinfo.quests[category].instances.size;
    }
    return 0;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x436b
// Size: 0x30
function _questthreadsactive() {
    if (isdefined(level.questinfo.thinkers)) {
        return level.questinfo.thinkers.size;
    }
    return 0;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43a3
// Size: 0x76
function createlocaleinstance(category, var_58cf9831f1c92e24, var_fb5fdfafc29f4513) {
    locale = createquestinstance(category, var_fb5fdfafc29f4513, "invalid");
    locale.subscriber_type = var_58cf9831f1c92e24;
    getquestdata(var_58cf9831f1c92e24).locale_type = category;
    locale.subscribedinstances = [];
    /#
        locale.debugtype = "<unknown string>";
    #/
    return locale;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4421
// Size: 0x22
function registercreatequestlocale(category, func) {
    _registerquestfunc(category, func, "create_locale");
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x444a
// Size: 0x22
function registermovequestlocale(category, func) {
    _registerquestfunc(category, func, "move_locale");
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4473
// Size: 0x22
function registercheckiflocaleisavailable(category, func) {
    _registerquestfunc(category, func, "check_available");
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x449c
// Size: 0x23b
function _determinelocationarray(var_354d1457278b342c) {
    /#
        assertex(isdefined(var_354d1457278b342c.searchfunc), "_determineLocationArray : search_params.searchFunc is undefined");
    #/
    switch (var_354d1457278b342c.searchfunc) {
    case #"hash_499717c03903e17b":
        return getentitylessscriptablearray(var_354d1457278b342c.itemname, "classname", var_354d1457278b342c.searchcircleorigin, var_354d1457278b342c.searchradiusmax);
    case #"hash_e77c846975579748":
        var_6206d739138b8be8 = getunusedlootcachepoints(var_354d1457278b342c.searchcircleorigin, var_354d1457278b342c.searchradiusmax, 0, 1);
        return var_6206d739138b8be8;
    case #"hash_54890ab858a5b8d7":
        return getquestpoints(var_354d1457278b342c.questtypes, var_354d1457278b342c.searchcircleorigin, var_354d1457278b342c.searchradiusmax, 0, 1);
    case #"hash_f657de26aeb66a7":
        var_86eede4334852d70 = namespace_a4b43c1cf86c6fe5::getallspawninstances();
        var_ced8a1f62ae2956b = [];
        foreach (kiosk in level.br_armory_kiosk.scriptables) {
            if (!istrue(kiosk.disabled)) {
                var_ced8a1f62ae2956b[var_ced8a1f62ae2956b.size] = kiosk;
            }
        }
        return var_ced8a1f62ae2956b;
    case #"hash_6cde8a1344819cc":
        jumpiffalse(isdefined(level.br_plunder_sites)) LOC_000001df;
        var_b86aa807b6cf37e3 = namespace_c6ccccd95254983f::getplunderextractionsites();
        var_680d985ddbbc9b72 = [];
        foreach (site in var_b86aa807b6cf37e3) {
            if (istrue(site getscriptablepartstate(site.type) == "hidden")) {
                var_680d985ddbbc9b72[var_680d985ddbbc9b72.size] = site;
            }
        }
        if (var_680d985ddbbc9b72.size == 0) {
            return var_b86aa807b6cf37e3;
        }
        return var_680d985ddbbc9b72;
    default:
    LOC_000001df:
        /#
            assertex(0, "_determineLocationArray : search_params.searchFunc has an invalid value");
        #/
        break;
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46de
// Size: 0x33a
function _findnewlocaleplacement(var_2aab8569152edfac, var_354d1457278b342c) {
    var_2aab8569152edfac = array_randomize(var_2aab8569152edfac);
    if (!isdefined(var_354d1457278b342c.mintime)) {
        var_354d1457278b342c.mintime = 0;
    }
    if (!isdefined(var_354d1457278b342c.travelspeed)) {
        var_354d1457278b342c.travelspeed = 190;
    }
    var_ec522787bbcaab24 = isdefined(var_354d1457278b342c.searchradiusidealmax) && isdefined(var_354d1457278b342c.searchradiusidealmin);
    if (istrue(var_354d1457278b342c.searchforcecirclecenter)) {
        var_f55f0723dfa08b99 = namespace_c5622898120e827f::getmintimetillpointindangercircle(var_354d1457278b342c.searchcircleorigin);
    } else {
        var_f55f0723dfa08b99 = 0;
    }
    debug = spawnstruct();
    /#
        debug.var_f55f0723dfa08b99 = var_f55f0723dfa08b99;
        debug.var_85e83f382aedc103 = getdvarint(@"hash_fb5e59c5e6515a4b", 0);
    #/
    var_2ed718e1da0b965 = undefined;
    var_be0f4d48fa40793f = var_354d1457278b342c.searchradiusmax;
    foreach (i, loc in var_2aab8569152edfac) {
        dist = distance2d(loc.origin, var_354d1457278b342c.searchcircleorigin);
        /#
            debug.dist[i] = dist;
            if (debug.var_85e83f382aedc103) {
                if (dist < var_be0f4d48fa40793f) {
                    var_2ed718e1da0b965 = i;
                    var_be0f4d48fa40793f = dist;
                }
                goto LOC_000002ed;
            }
        #/
        if (dist < var_354d1457278b342c.searchradiusmin) {
            continue;
        }
        seconds = namespace_c5622898120e827f::getmintimetillpointindangercircle(loc.origin);
        if (!level.br_circle_disabled && seconds >= 0) {
            /#
                debug.var_975b4be3f9205374[i] = seconds;
            #/
            if (seconds < var_f55f0723dfa08b99) {
                continue;
            }
            if (var_354d1457278b342c.travelspeed > 0) {
                traveltime = dist / var_354d1457278b342c.travelspeed;
                /#
                    debug.traveltime[i] = traveltime;
                #/
                seconds = seconds - traveltime;
            }
            jumpiffalse(seconds < var_354d1457278b342c.mintime) LOC_0000025c;
        } else {
        LOC_0000025c:
            /#
                debug.var_9f896722b457f938[i] = 0;
            #/
            if (var_ec522787bbcaab24) {
                if (dist < var_354d1457278b342c.searchradiusidealmax) {
                    if (dist >= var_354d1457278b342c.searchradiusidealmin) {
                        /#
                            debug.var_9f896722b457f938[i] = 1;
                        #/
                        var_5435995e95681b89 = 0;
                    } else {
                        var_5435995e95681b89 = var_354d1457278b342c.searchradiusidealmin - dist;
                    }
                } else {
                    var_5435995e95681b89 = dist - var_354d1457278b342c.searchradiusidealmax;
                }
                if (var_5435995e95681b89 < var_be0f4d48fa40793f) {
                    var_be0f4d48fa40793f = var_5435995e95681b89;
                    var_2ed718e1da0b965 = i;
                    if (var_5435995e95681b89 <= 0) {
                        break;
                    }
                }
            } else {
                var_2ed718e1da0b965 = i;
            LOC_000002ed:
            }
        LOC_000002ed:
        }
    LOC_000002ed:
    }
    /#
        thread function_f42fbf313ebaec27(var_2aab8569152edfac, var_2ed718e1da0b965, var_354d1457278b342c, debug);
    #/
    var_b70ef58c802abddf = undefined;
    if (isdefined(var_2ed718e1da0b965)) {
        var_b70ef58c802abddf = var_2aab8569152edfac[var_2ed718e1da0b965];
    } else {
        /#
            thread function_3c30c102ba44ec57(var_2aab8569152edfac, var_2ed718e1da0b965, var_354d1457278b342c, debug);
        #/
    }
    return var_b70ef58c802abddf;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4a20
// Size: 0x5f
function function_f42fbf313ebaec27(var_2aab8569152edfac, var_2ed718e1da0b965, var_354d1457278b342c, debuginfo) {
    /#
        dvar = @"hash_b88af237972348e6";
        var_3f70bd89393f0882 = 0;
        if (!getdvarint(dvar, var_3f70bd89393f0882)) {
            return;
        }
        function_a3db3d7f49e8c9(dvar, var_3f70bd89393f0882, var_2aab8569152edfac, var_2ed718e1da0b965, var_354d1457278b342c, debuginfo);
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x4a86
// Size: 0x143
function function_3c30c102ba44ec57(var_2aab8569152edfac, var_2ed718e1da0b965, var_354d1457278b342c, debuginfo, var_3d99dd8fb4ab7d8f) {
    /#
        dvar = @"hash_b4cb045fde16721f";
        var_3f70bd89393f0882 = -2;
        var_3df45bd0d60106a4 = -1;
        var_3d99dd8fb4ab7d8f = level.questinfo.debuginfo.var_a001e7b664eaee73;
        level.questinfo.debuginfo.var_a001e7b664eaee73++;
        while (1) {
            while (1) {
                dvarvalue = getdvarint(dvar, var_3f70bd89393f0882);
                if (dvarvalue == var_3df45bd0d60106a4) {
                    line(var_354d1457278b342c.searchcircleorigin, var_354d1457278b342c.searchcircleorigin + (0, 0, 5000), (1, 0, 0));
                    debugstar(var_354d1457278b342c.searchcircleorigin, (1, 0, 0), 1, "<unknown string>" + var_3d99dd8fb4ab7d8f);
                    waitframe();
                    continue;
                }
                if (dvarvalue == var_3d99dd8fb4ab7d8f) {
                    break;
                }
                wait(0.2);
            }
            function_a3db3d7f49e8c9(dvar, var_3d99dd8fb4ab7d8f, var_2aab8569152edfac, var_2ed718e1da0b965, var_354d1457278b342c, debuginfo);
        }
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x4bd0
// Size: 0x4b4
function function_a3db3d7f49e8c9(dvar, dvarvalue, var_2aab8569152edfac, var_2ed718e1da0b965, var_354d1457278b342c, debuginfo) {
    /#
        if (!isdefined(debuginfo.dist)) {
            debuginfo.dist = [];
        }
        if (!isdefined(debuginfo.var_975b4be3f9205374)) {
            debuginfo.var_975b4be3f9205374 = [];
        }
        if (!isdefined(debuginfo.traveltime)) {
            debuginfo.traveltime = [];
        }
        if (!isdefined(debuginfo.var_9f896722b457f938)) {
            debuginfo.var_9f896722b457f938 = [];
        }
        level notify("<unknown string>");
        level endon("<unknown string>");
        red = (1, 0, 0);
        yellow = (1, 1, 0);
        green = (0, 1, 0);
        light_green = (0.5, 1, 0.5);
        blue = (0, 0, 1);
        white = (1, 1, 1);
        var_7b830592bc29feb8 = (0, 0, 15);
        while (getdvarint(dvar) == dvarvalue) {
            sphere(var_354d1457278b342c.searchcircleorigin, 10, yellow);
            print3d(var_354d1457278b342c.searchcircleorigin, "<unknown string>" + var_2aab8569152edfac.size + "<unknown string>" + debuginfo.var_f55f0723dfa08b99, white, 1, 1, 1, 1);
            if (!isdefined(var_2ed718e1da0b965)) {
                print3d(var_354d1457278b342c.searchcircleorigin + var_7b830592bc29feb8, "<unknown string>", red, 1, 1, 1, 1);
            }
            namespace_3c37cb17ade254d::draw_circle(var_354d1457278b342c.searchcircleorigin, var_354d1457278b342c.searchradiusmin, green, 1, 0, 0);
            namespace_3c37cb17ade254d::draw_circle(var_354d1457278b342c.searchcircleorigin, var_354d1457278b342c.searchradiusmax, red, 1, 0, 0);
            if (isdefined(var_354d1457278b342c.searchradiusidealmin)) {
                namespace_3c37cb17ade254d::draw_circle(var_354d1457278b342c.searchcircleorigin, var_354d1457278b342c.searchradiusidealmin, yellow, 1, 0, 0);
            }
            if (isdefined(var_354d1457278b342c.searchradiusidealmax)) {
                namespace_3c37cb17ade254d::draw_circle(var_354d1457278b342c.searchcircleorigin, var_354d1457278b342c.searchradiusidealmax, yellow, 1, 0, 0);
            }
            foreach (i, loc in var_2aab8569152edfac) {
                checked = isdefined(debuginfo.dist[i]);
                if (isdefined(var_2ed718e1da0b965) && i == var_2ed718e1da0b965) {
                    color = green;
                    size = 50;
                } else if (checked) {
                    color = blue;
                    size = 20;
                } else {
                    color = white;
                    size = 10;
                }
                sphere(loc.origin, size, color);
                if (checked) {
                    dist = debuginfo.dist[i];
                    if (dist <= var_354d1457278b342c.searchradiusmin) {
                        color = red;
                        var_616e15980f379ec4 = red;
                    } else {
                        color = green;
                        var_616e15980f379ec4 = green;
                    }
                    if (istrue(debuginfo.var_9f896722b457f938[i])) {
                        var_616e15980f379ec4 = yellow;
                    }
                    printorigin = loc.origin;
                    print3d(printorigin, "<unknown string>" + debuginfo.dist[i], var_616e15980f379ec4, 1, 1, 1, 1);
                    printorigin = printorigin + var_7b830592bc29feb8;
                    var_975b4be3f9205374 = debuginfo.var_975b4be3f9205374[i];
                    if (isdefined(var_975b4be3f9205374)) {
                        str = "<unknown string>" + var_975b4be3f9205374;
                        traveltime = debuginfo.traveltime[i];
                        if (!isdefined(traveltime)) {
                            traveltime = 0;
                        }
                        str = "<unknown string>" + var_975b4be3f9205374 + "<unknown string>" + traveltime;
                        if (var_975b4be3f9205374 - traveltime < var_354d1457278b342c.mintime) {
                            color = red;
                            str = str + "<unknown string>";
                        } else {
                            color = green;
                            str = str + "<unknown string>";
                        }
                        str = str + var_354d1457278b342c.mintime;
                        print3d(printorigin, str, color, 1, 1, 1, 1);
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x508b
// Size: 0xaa
function _runcreatequestlocale(category, params) {
    /#
        function_d2caa40694d469ab();
    #/
    if (isdefined(params)) {
        locale = self [[ level.questinfo.quests[category].funcs["create_locale"] ]](params);
    } else {
        locale = self [[ level.questinfo.quests[category].funcs["create_locale"] ]]();
    }
    /#
        /#
            assertex(isdefined(locale.curorigin), "<unknown string>" + category + "<unknown string>");
        #/
    #/
    return locale;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x513d
// Size: 0x79
function _runmovequestlocale(category, params) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    if (isdefined(params)) {
        self [[ level.questinfo.quests[category].funcs["move_locale"] ]](params);
    } else {
        self [[ level.questinfo.quests[category].funcs["move_locale"] ]]();
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51bd
// Size: 0x34
function _runcheckiflocaleisavailable(category) {
    return self [[ level.questinfo.quests[category].funcs["check_available"] ]]();
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51f9
// Size: 0xfc
function _findexisitingquestlocale(category, var_354d1457278b342c) {
    /#
        assertex(isdefined(var_354d1457278b342c.searchcircleorigin), "_findExisitingQuestLocale for '" + category + "' is missing parameter search_params.searchCircleOrigin");
    #/
    var_935c70547a6790a9 = getquestdata(category);
    if (!isdefined(var_935c70547a6790a9) || !isdefined(var_935c70547a6790a9.instances)) {
        return undefined;
    }
    foreach (instance in var_935c70547a6790a9.instances) {
        dist = distance2d(var_354d1457278b342c.searchcircleorigin, instance.curorigin);
        if (dist > var_354d1457278b342c.searchradiusmax) {
            continue;
        }
        if (!instance _runcheckiflocaleisavailable(category)) {
            continue;
        }
        return instance;
    }
    return undefined;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x52fd
// Size: 0x97
function function_58f2ed57b8b8a4a5(category, var_354d1457278b342c) {
    /#
        /#
            assertex(isdefined(var_354d1457278b342c.searchcircleorigin), "<unknown string>" + category + "<unknown string>");
        #/
        /#
            assertex(isdefined(var_354d1457278b342c.searchradiusmax), "<unknown string>" + category + "<unknown string>");
        #/
        /#
            assertex(isdefined(var_354d1457278b342c.searchradiusmin), "<unknown string>" + category + "<unknown string>");
        #/
        /#
            assertex(isdefined(var_354d1457278b342c.searchfunc), "<unknown string>");
        #/
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x539b
// Size: 0x65
function findquestplacement(category, var_354d1457278b342c) {
    /#
        function_58f2ed57b8b8a4a5(category, var_354d1457278b342c);
    #/
    if (isdefined(var_354d1457278b342c.reservedplacement)) {
        placement = var_354d1457278b342c.reservedplacement;
    } else {
        var_2aab8569152edfac = _determinelocationarray(var_354d1457278b342c);
        placement = _findnewlocaleplacement(var_2aab8569152edfac, var_354d1457278b342c);
    }
    return placement;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5408
// Size: 0x7b
function requestquestlocale(category, var_354d1457278b342c, var_50803249d3868e7a) {
    /#
        function_d2caa40694d469ab();
        function_58f2ed57b8b8a4a5(category, var_354d1457278b342c);
    #/
    locale = undefined;
    if (!isdefined(var_50803249d3868e7a) || !var_50803249d3868e7a) {
        locale = _findexisitingquestlocale(category, var_354d1457278b342c);
    }
    if (!isdefined(locale)) {
        placement = findquestplacement(category, var_354d1457278b342c);
        locale = _runcreatequestlocale(category, placement);
    }
    subscribetoquestlocale(locale);
    return locale;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x548b
// Size: 0x3e
function subscribetoquestlocale(locale) {
    /#
        function_d2caa40694d469ab();
    #/
    self.subscribedlocale = locale;
    locale.subscribedinstances = array_add(locale.subscribedinstances, self);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54d0
// Size: 0x3a
function movequestlocale(category, var_354d1457278b342c) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    placement = findquestplacement(category, var_354d1457278b342c);
    _runmovequestlocale(category, placement);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5511
// Size: 0x7c
function leavequestlocale() {
    /#
        function_d2caa40694d469ab();
    #/
    var_7011f22fd8734b8b = getquestdata(self.questcategory).locale_type;
    locale = self.subscribedlocale;
    locale.subscribedinstances = array_remove(locale.subscribedinstances, self);
    if (locale.subscribedinstances.size <= 0) {
        locale removequestinstance();
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5594
// Size: 0x49
function getquestdata(category) {
    if (!isdefined(level.questinfo) || !isdefined(level.questinfo.quests)) {
        return undefined;
    }
    return level.questinfo.quests[category];
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55e5
// Size: 0x35
function getquestinstancedata(category, var_56150f88eefb0135) {
    return level.questinfo.quests[category].instances[var_56150f88eefb0135];
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5622
// Size: 0x6b
function getquestinstancedatasafe(category, var_56150f88eefb0135) {
    instance = undefined;
    if (isdefined(level.questinfo) && isdefined(level.questinfo.quests[category])) {
        instance = level.questinfo.quests[category].instances[var_56150f88eefb0135];
    }
    return instance;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5695
// Size: 0x3d
function checkforinstance(category, var_fb5fdfafc29f4513) {
    if (isdefined(level.questinfo.quests[category].instances[var_fb5fdfafc29f4513])) {
        return 1;
    }
    return 0;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56da
// Size: 0x114
function _validateplayerfilter(var_1f4e8b926c213a9a) {
    if (isdefined(var_1f4e8b926c213a9a)) {
        if (isint(var_1f4e8b926c213a9a)) {
            /#
                function_132b6261e829fa9c();
            #/
            /#
                assertex(isdefined(level.questinfo.quests[self.questcategory].filters[var_1f4e8b926c213a9a]));
            #/
            return level.questinfo.quests[self.questcategory].filters[var_1f4e8b926c213a9a];
        }
        if (isarray(var_1f4e8b926c213a9a)) {
            return var_1f4e8b926c213a9a;
        }
        /#
            assertex(0, "Invalid Parameter used in Player Filter Function");
        #/
    } else if (isdefined(level.questinfo.quests[self.questcategory].filters)) {
        /#
            function_132b6261e829fa9c();
        #/
        return level.questinfo.quests[self.questcategory].filters[0];
    } else {
        return level.questinfo.defaultfilter;
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57f5
// Size: 0x64
function _validateplayer(player, filter) {
    foreach (condition in filter) {
        if (![[ condition ]](player)) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5861
// Size: 0x2e
function isplayervalid(player, var_1f4e8b926c213a9a) {
    filter = _validateplayerfilter(var_1f4e8b926c213a9a);
    return _validateplayer(player, filter);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5897
// Size: 0x85
function isteamvalid(team, var_1f4e8b926c213a9a) {
    filter = _validateplayerfilter(var_1f4e8b926c213a9a);
    foreach (player in getteamdata(team, "players")) {
        if (_validateplayer(player, filter)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5924
// Size: 0x85
function isentireteamvalid(team, var_1f4e8b926c213a9a) {
    filter = _validateplayerfilter(var_1f4e8b926c213a9a);
    foreach (player in getteamdata(team, "players")) {
        if (!_validateplayer(player, filter)) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59b1
// Size: 0x95
function getvalidplayersinteam(team, var_1f4e8b926c213a9a) {
    filter = _validateplayerfilter(var_1f4e8b926c213a9a);
    players = [];
    foreach (player in getteamdata(team, "players")) {
        if (_validateplayer(player, filter)) {
            players[players.size] = player;
        }
    }
    return players;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a4e
// Size: 0x8a
function getvalidplayersinarray(group, var_1f4e8b926c213a9a) {
    filter = _validateplayerfilter(var_1f4e8b926c213a9a);
    players = [];
    foreach (player in group) {
        if (_validateplayer(player, filter)) {
            players[players.size] = player;
        }
    }
    return players;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ae0
// Size: 0xbd
function sortvalidplayersinarray(group, var_1f4e8b926c213a9a) {
    filter = _validateplayerfilter(var_1f4e8b926c213a9a);
    players = [];
    players["valid"] = [];
    players["invalid"] = [];
    foreach (player in group) {
        if (_validateplayer(player, filter)) {
            players["valid"][players["valid"].size] = player;
        } else {
            players["invalid"][players["invalid"].size] = player;
        }
    }
    return players;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ba5
// Size: 0xa4
function getteamcenter(team, filter) {
    center = (0, 0, 0);
    validplayers = getvalidplayersinteam(team, filter);
    if (validplayers.size <= 0) {
        return center;
    }
    foreach (player in validplayers) {
        center = center + player.origin;
    }
    center = center / validplayers.size;
    return center;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c51
// Size: 0x19
function filtercondition_isdead(player) {
    if (!isalive(player)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c72
// Size: 0x1f
function filtercondition_isdowned(player) {
    if (istrue(player.inlaststand)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c99
// Size: 0x1a
function filtercondition_ingulag(player) {
    if (player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
        return 0;
    }
    return 1;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5cbb
// Size: 0x1f
function filtercondition_hasbeeningulag(player) {
    if (isdefined(player.gulag)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ce2
// Size: 0xa9
function packsplashparambits(missionid, rewardtier, var_11d65784f0b6afa2, unlockableindex) {
    if (!isdefined(var_11d65784f0b6afa2)) {
        var_11d65784f0b6afa2 = 0;
    }
    if (!isdefined(unlockableindex)) {
        unlockableindex = 0;
    }
    /#
        assert(missionid >= 0 && missionid < 32);
    #/
    /#
        assert(rewardtier >= 0 && rewardtier < 32);
    #/
    /#
        assert(var_11d65784f0b6afa2 >= 0 && var_11d65784f0b6afa2 < 64);
    #/
    /#
        assert(unlockableindex >= 0 && unlockableindex < 8);
    #/
    value = unlockableindex;
    value = value << 6 | var_11d65784f0b6afa2;
    value = value << 5 | rewardtier;
    value = value << 5 | missionid;
    return value;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d93
// Size: 0x4f
function displayteamsplash(team, var_e9ae765e2c4fe816, params) {
    /#
        assertex(isdefined(var_e9ae765e2c4fe816), "No splash_key defined for message being displayed to '" + team);
    #/
    players = getteamdata(team, "players");
    displaysplashtoplayers(players, var_e9ae765e2c4fe816, params);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5de9
// Size: 0xca
function displaysplashtoplayers(players, var_e9ae765e2c4fe816, params) {
    /#
        assertex(isdefined(var_e9ae765e2c4fe816), "No splash_key defined for message being displayed");
    #/
    foreach (player in players) {
        if (player namespace_d3d40f75bb4e4c32::isplayeringulag()) {
            continue;
        }
        if (isbot(player) && namespace_d3d40f75bb4e4c32::istutorial()) {
            continue;
        }
        if (isdefined(params)) {
            jumpiffalse(isdefined(params.excludedplayers)) LOC_000000ac;
            jumpiffalse(array_contains(params.excludedplayers, player)) LOC_000000ac;
        } else {
        LOC_000000ac:
            displayplayersplash(player, var_e9ae765e2c4fe816, params);
        }
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5eba
// Size: 0xac
function displayplayersplash(player, var_e9ae765e2c4fe816, params) {
    if (getsubgametype() == "champion") {
        return;
    }
    /#
        assertex(isdefined(var_e9ae765e2c4fe816), "No splash_key defined for message being displayed to '" + player.name);
    #/
    if (isdefined(params) && isdefined(params.packedbits)) {
        player thread namespace_44abc05161e2e2cb::showsplash(var_e9ae765e2c4fe816, params.packedbits);
    } else if (isdefined(params) && isdefined(params.intvar)) {
        player thread namespace_44abc05161e2e2cb::showsplash(var_e9ae765e2c4fe816, params.intvar);
    } else {
        player thread namespace_44abc05161e2e2cb::showsplash(var_e9ae765e2c4fe816);
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f6d
// Size: 0x17d
function displaysplashtoplayersinradius(var_e9ae765e2c4fe816, origin, radius, var_132557e1f59a234b, params) {
    var_c17ed6db14ebc007 = radius * radius;
    newarray = [];
    foreach (player in level.players) {
        dist2rd = distancesquared(origin, player.origin);
        if (dist2rd > var_c17ed6db14ebc007) {
            continue;
        }
        if (isdefined(params.excludedteams) && array_contains(params.excludedteams, player.team)) {
            continue;
        }
        if (isdefined(params.excludedplayers) && array_contains(params.excludedplayers, player)) {
            continue;
        }
        if (!isplayervalid(player, var_132557e1f59a234b)) {
            continue;
        }
        newarray[newarray.size] = player;
    }
    if (newarray.size > 0) {
        foreach (player in newarray) {
            displayplayersplash(player, var_e9ae765e2c4fe816, params);
        }
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60f1
// Size: 0x6b
function displaysquadmessagetoplayer(var_939b8e8818bfd5ae, state, missionid) {
    player = var_939b8e8818bfd5ae getentitynumber();
    if (!isdefined(state)) {
        state = 0;
    }
    if (!isdefined(player)) {
        player = 0;
    }
    if (!isdefined(missionid)) {
        missionid = 0;
    }
    value = 0;
    value = missionid << 12 | player << 4 | state;
    self setclientomnvar("ui_br_expanded_obit_message", value);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6163
// Size: 0x80
function displaysquadmessagetoteam(team, var_939b8e8818bfd5ae, state, missionid) {
    foreach (player in getteamdata(team, "players")) {
        player displaysquadmessagetoplayer(var_939b8e8818bfd5ae, state, missionid);
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x61ea
// Size: 0x1e
function giveplayerpoints(player, ref) {
    player thread namespace_48a08c5037514e04::doscoreevent(ref);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x620f
// Size: 0x7e
function giveteampoints(team, ref) {
    if (getsubgametype() == "champion") {
        return;
    }
    foreach (player in getteamdata(team, "players")) {
        player thread namespace_48a08c5037514e04::doscoreevent(ref);
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6294
// Size: 0x3e
function calldropbag(player, location) {
    var_b29198c6c1093a6b = namespace_c3059e55bc606259::getdropbagspawntypeenum(0, 0, 0, 1, 0, 0);
    player namespace_c3059e55bc606259::spawndropbagatposition(var_b29198c6c1093a6b);
    level thread namespace_c3059e55bc606259::managedropbags();
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62d9
// Size: 0x135
function giveteamplunderflat(team, amount, var_6463a610d995bab9) {
    var_8e3c5f90e4f80a58 = getdvarfloat(@"hash_7165dad703502609", 0.4);
    var_2cefa8f8a2ba6bfe = 0;
    foreach (player in getteamdata(team, "players")) {
        if (isbot(player) && namespace_d3d40f75bb4e4c32::istutorial()) {
            continue;
        }
        var_36773a58eb035bff = amount;
        if (!isreallyalive(player) && isdefined(var_6463a610d995bab9)) {
            var_36773a58eb035bff = int(amount * var_8e3c5f90e4f80a58);
        } else {
            var_36773a58eb035bff = int(var_36773a58eb035bff * function_fd4c76c90a1a0333(player));
        }
        player namespace_c6ccccd95254983f::playerplunderpickup(var_36773a58eb035bff);
        level.br_plunder.plunder_awarded_by_missions_total = level.br_plunder.plunder_awarded_by_missions_total + var_36773a58eb035bff;
        namespace_a011fbf6d93f25e5::trackcashevent(player, "mission", var_36773a58eb035bff);
        player namespace_c6ccccd95254983f::function_5a2284274d70f7d(1, var_36773a58eb035bff);
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6415
// Size: 0xe9
function giveteamplunderdistributive(players, amount) {
    var_6eebcda719cd18a1 = int(amount / players.size);
    foreach (player in players) {
        if (isbot(player) && namespace_d3d40f75bb4e4c32::istutorial()) {
            continue;
        }
        var_18417c862feb0b9e = int(var_6eebcda719cd18a1 * function_fd4c76c90a1a0333(player));
        player namespace_c6ccccd95254983f::playerplunderpickup(var_18417c862feb0b9e);
        level.br_plunder.plunder_awarded_by_missions_total = level.br_plunder.plunder_awarded_by_missions_total + var_18417c862feb0b9e;
        namespace_a011fbf6d93f25e5::trackcashevent(player, "mission", var_18417c862feb0b9e);
        player namespace_c6ccccd95254983f::function_5a2284274d70f7d(1, var_18417c862feb0b9e);
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x6505
// Size: 0x315
function dropplunder(amount, var_5b7bf3433d244cdf, var_76212928fed46301, var_41271de03a84a690) {
    if (!istrue(level.br_plunder_enabled)) {
        return;
    }
    var_5c2ad86c68eab7e9 = 0;
    var_168ea84f2950fe38 = 1;
    var_b590c41d9f9ce9f3 = 2;
    var_82c3fc1e774a5a35[0] = [0:"brloot_plunder_cash_uncommon_3", 1:level.br_plunder.quantityepic, 2:getdvarfloat(@"hash_53dd15287f7df644", 0.2)];
    var_82c3fc1e774a5a35[1] = [0:"brloot_plunder_cash_uncommon_2", 1:level.br_plunder.quantityrare, 2:getdvarfloat(@"hash_8fa17586ac872da9", 0.3)];
    var_82c3fc1e774a5a35[2] = [0:"brloot_plunder_cash_uncommon_1", 1:level.br_plunder.quantitycommon, 2:getdvarfloat(@"hash_30bf1dd438567db0", 0.5)];
    var_403adfafce8e54ae = 0;
    for (i = 0; i < var_82c3fc1e774a5a35.size; i++) {
        info = var_82c3fc1e774a5a35[i];
        var_403adfafce8e54ae = var_403adfafce8e54ae + info[var_b590c41d9f9ce9f3];
    }
    plundertotal = 0;
    for (i = 0; i < var_82c3fc1e774a5a35.size; i++) {
        info = var_82c3fc1e774a5a35[i];
        info[var_b590c41d9f9ce9f3] = info[var_b590c41d9f9ce9f3] / var_403adfafce8e54ae;
        plundertotal = plundertotal + info[var_168ea84f2950fe38] * info[var_b590c41d9f9ce9f3];
    }
    var_ce1bd3fdf0fcecf = amount / plundertotal;
    var_f278eb5eb7f1e8be = amount;
    var_c75b43b86b00cb9d = [];
    for (i = 0; i < var_82c3fc1e774a5a35.size; i++) {
        info = var_82c3fc1e774a5a35[i];
        var_c75b43b86b00cb9d[i] = int(var_ce1bd3fdf0fcecf * info[var_b590c41d9f9ce9f3]);
        var_f278eb5eb7f1e8be = var_f278eb5eb7f1e8be - var_c75b43b86b00cb9d[i] * info[var_168ea84f2950fe38];
    }
    if (var_f278eb5eb7f1e8be > 0) {
        for (i = 0; i < var_82c3fc1e774a5a35.size; i++) {
            info = var_82c3fc1e774a5a35[i];
            extra = int(var_f278eb5eb7f1e8be / info[var_168ea84f2950fe38]);
            var_c75b43b86b00cb9d[i] = var_c75b43b86b00cb9d[i] + extra;
            var_f278eb5eb7f1e8be = var_f278eb5eb7f1e8be - extra * info[var_168ea84f2950fe38];
        }
    }
    var_1473580ac7cfa299 = [];
    for (i = 0; i < var_c75b43b86b00cb9d.size; i++) {
        for (j = 0; j < var_c75b43b86b00cb9d[i]; j++) {
            var_1473580ac7cfa299[var_1473580ac7cfa299.size] = i;
        }
    }
    var_1473580ac7cfa299 = array_randomize(var_1473580ac7cfa299);
    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    for (i = 0; i < var_1473580ac7cfa299.size; i++) {
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, var_5b7bf3433d244cdf, var_76212928fed46301, var_41271de03a84a690);
        namespace_cb965d2f71fefddc::spawnpickup(var_82c3fc1e774a5a35[var_1473580ac7cfa299[i]][var_5c2ad86c68eab7e9], var_cb4fad49263e20c4, var_82c3fc1e774a5a35[var_1473580ac7cfa299[i]][var_168ea84f2950fe38], 1);
    }
    level.br_plunder.plunder_awarded_by_missions_total = level.br_plunder.plunder_awarded_by_missions_total + amount;
    level thread namespace_c6ccccd95254983f::dropplundersounds(var_5b7bf3433d244cdf, var_1473580ac7cfa299.size);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6821
// Size: 0x2b
function getquestindex(ref) {
    return level.questinfo.tablevalues[ref].index;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6854
// Size: 0x2b
function getquesttableindex(ref) {
    index = int(tablelookup("mp/brmissions.csv", 1, ref, 0));
    return index;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6887
// Size: 0x35
function uiobjectiveshow(ref) {
    /#
        assert(isplayer(self));
    #/
    index = getquestindex(ref);
    setquestindexomnvar(index);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68c3
// Size: 0x6d
function uiobjectiveshowtoteam(ref, team) {
    foreach (player in getteamdata(team, "players")) {
        player uiobjectiveshow(ref);
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6937
// Size: 0x1a
function uiobjectivehide() {
    /#
        assert(isplayer(self));
    #/
    setquestindexomnvar(0);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6958
// Size: 0x64
function uiobjectivehidefromteam(team) {
    foreach (player in getteamdata(team, "players")) {
        player uiobjectivehide();
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69c3
// Size: 0x28
function uiobjectivesetparameter(value) {
    /#
        assert(isplayer(self));
    #/
    self setclientomnvar("ui_br_objective_param", value);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69f2
// Size: 0x28
function uiobjectivesetlootid(value) {
    /#
        assert(isplayer(self));
    #/
    self setclientomnvar("ui_br_objective_loot_id", value);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a21
// Size: 0xeb
function function_fd4c76c90a1a0333(player) {
    mod = 1;
    if (namespace_b6a8027f477010e1::function_f45c19871b412ea5("specialty_contract_payout")) {
        if (player namespace_82dcd1d5ae30ff7::_hasperk("specialty_contract_payout")) {
            mod = mod + getdvarfloat(@"hash_cb657adb237d72a2", 0.1);
        } else if (istrue(getdvarint(@"hash_a50815ce2cfbefbc", 0))) {
            foreach (var_cdde4878f529a276 in getteamdata(player.team, "players")) {
                if (var_cdde4878f529a276 != player && var_cdde4878f529a276 namespace_82dcd1d5ae30ff7::_hasperk("specialty_contract_payout")) {
                    mod = mod + getdvarfloat(@"hash_e4f6ee9301cbf325", 0.1);
                }
            }
        }
    }
    return mod;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b14
// Size: 0xce
function createquestobjicon(var_cb8e582431cf1641, state, var_38116998df9814d4) {
    self.objectiveiconid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
    if (self.objectiveiconid != -1) {
        namespace_5a22b6f3a56f7e9b::objective_add_objective(self.objectiveiconid, state, (0, 0, 0), var_cb8e582431cf1641);
        namespace_5a22b6f3a56f7e9b::update_objective_setbackground(self.objectiveiconid, 1);
        if (function_fa7bfcc1d68b7b73()) {
            objective_removeallfrommask(self.objectiveiconid);
        }
        objective_showtoplayersinmask(self.objectiveiconid);
        namespace_5a22b6f3a56f7e9b::objective_set_play_intro(self.objectiveiconid, 1);
        if (isdefined(var_38116998df9814d4)) {
            movequestobjicon(var_38116998df9814d4);
        }
    } else {
        /#
            println(self.category + "<unknown string>");
        #/
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6be9
// Size: 0x1d
function movequestobjicon(neworigin) {
    namespace_5a22b6f3a56f7e9b::update_objective_position(self.objectiveiconid, neworigin);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c0d
// Size: 0x1c
function showquestobjicontoplayer(player) {
    objective_addclienttomask(self.objectiveiconid, player);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6c30
// Size: 0x13
function showquestobjicontoall(objid) {
    objective_addalltomask(objid);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c4a
// Size: 0x1c
function hidequestobjiconfromplayer(player) {
    objective_removeclientfrommask(self.objectiveiconid, player);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6c6d
// Size: 0xd
function checkforactiveobjicon() {
    return isdefined(self.objectiveiconid);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c82
// Size: 0x23
function deletequestobjicon() {
    namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(self.objectiveiconid);
    namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.objectiveiconid);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6cac
// Size: 0xf8
function utilflare_shootflare(spawn_origin, var_1da50610f94e1bfb) {
    level endon("game_ended");
    var_3e146ed5e207e635 = namespace_2a184fc4902783dc::create_contents(0, 1, 0, 1, 0, 0, 0);
    new_position = ray_trace(spawn_origin + (0, 0, 4000), spawn_origin, undefined, var_3e146ed5e207e635, undefined, 1)["position"];
    flare = spawn("script_model", new_position);
    if (!isdefined(flare)) {
        return;
    }
    flare.angles = vectortoangles((0, 0, 1));
    flare setmodel("equip_flare_br");
    wait(0.5);
    flare setscriptablepartstate("launch", "start", 0);
    var_3fc3daade1c87824 = "start";
    if (var_1da50610f94e1bfb == "revive") {
        var_3fc3daade1c87824 = "start_revive";
    }
    flare setscriptablepartstate("travel", var_3fc3daade1c87824, 0);
    flare thread _utilflare_lerpflare(var_1da50610f94e1bfb);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6dab
// Size: 0x53
function _utilflare_lerpflare(var_1da50610f94e1bfb) {
    self endon("death");
    level endon("game_ended");
    movetime = 3.125;
    self moveto(self.origin + (0, 0, 2500), movetime);
    wait(movetime);
    _utilflare_flareexplode(var_1da50610f94e1bfb);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e05
// Size: 0x73
function _utilflare_flareexplode(var_1da50610f94e1bfb) {
    if (!isdefined(var_1da50610f94e1bfb)) {
        var_1da50610f94e1bfb = "<undefined>";
    }
    self setscriptablepartstate("travel", "off", 0);
    if (!_utilflare_isvalidflaretype(var_1da50610f94e1bfb)) {
        /#
            assertmsg("util flared called with invalid flare type string '" + var_1da50610f94e1bfb + "'");
        #/
        return;
    }
    var_44a98e57feb74898 = "start_" + var_1da50610f94e1bfb;
    self setscriptablepartstate("explode", var_44a98e57feb74898, 0);
    thread sfx_br_flare_phosphorus();
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e7f
// Size: 0x46
function _utilflare_isvalidflaretype(var_1da50610f94e1bfb) {
    var_3ba45e0e07877b7 = 0;
    if (isdefined(var_1da50610f94e1bfb)) {
        switch (var_1da50610f94e1bfb) {
        case #"hash_b06d15a59bd8ea50":
        case #"hash_f4a9126c03d3385b":
            var_3ba45e0e07877b7 = 1;
            break;
        }
    }
    return var_3ba45e0e07877b7;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ecd
// Size: 0x72
function sfx_br_flare_phosphorus() {
    self endon("death");
    level endon("game_ended");
    self setscriptablepartstate("phosphorus", "start", 0);
    wait(0.3);
    self setscriptablepartstate("phosphorus_loop", "start", 0);
    wait(12);
    self setscriptablepartstate("phosphorus", "end", 0);
    wait(0.3);
    self setscriptablepartstate("phosphorus_loop", "off", 0);
    wait(5);
    self delete();
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f46
// Size: 0x5f
function questpointgetradius(point) {
    radius = 0;
    if (point.spawnflags & 4) {
        radius = 256;
    } else if (point.spawnflags & 2) {
        radius = 128;
    } else if (point.spawnflags & 1) {
        radius = 168;
    }
    return radius;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6fad
// Size: 0x4c
function questtimerinit(category, var_3e871b4b1ef67d52) {
    var_935c70547a6790a9 = getquestdata(category);
    var_935c70547a6790a9.usequesttimer = getdvarint(function_2ef675c13ca1c4af(@"hash_71622bba3f9292f4", category, "_enableQuestTime"), var_3e871b4b1ef67d52);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7000
// Size: 0x78
function questtimerset(time, var_9707ff10d99d386) {
    /#
        function_d2caa40694d469ab();
    #/
    if (!isdefined(var_9707ff10d99d386)) {
        var_9707ff10d99d386 = 0;
    }
    totaltime = time + var_9707ff10d99d386;
    var_935c70547a6790a9 = getquestdata(self.category);
    if (!var_935c70547a6790a9.usequesttimer) {
        return;
    }
    self.missiontime = gettime() + totaltime * 1000;
    questtimerupdate();
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x707f
// Size: 0x5e
function questtimeradd(time) {
    /#
        function_d2caa40694d469ab();
    #/
    var_935c70547a6790a9 = getquestdata(self.category);
    if (!var_935c70547a6790a9.usequesttimer) {
        return;
    }
    self.missiontime = self.missiontime + time * 1000;
    questtimerupdate();
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70e4
// Size: 0xc1
function questtimerupdate() {
    /#
        function_d2caa40694d469ab();
    #/
    foreach (player in getteamdata(self.id, "players")) {
        player setclientomnvar("ui_br_objective_countdown_timer", self.missiontime);
    }
    var_935c70547a6790a9 = getquestdata(self.category);
    updatefunc = var_935c70547a6790a9.funcs["onTimerUpdate"];
    if (isdefined(updatefunc)) {
        [[ updatefunc ]]();
    }
    thread _questtimerwait();
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x71ac
// Size: 0x9f
function _questtimerwait() {
    /#
        function_d2caa40694d469ab();
    #/
    self notify("updateQuestTimer");
    self endon("game_ended");
    self endon("updateQuestTimer");
    self endon("questEnded");
    waittime = (self.missiontime - gettime()) / 1000;
    wait(waittime);
    var_935c70547a6790a9 = getquestdata(self.category);
    var_73eedca966115848 = var_935c70547a6790a9.funcs["onTimerExpired"];
    if (isdefined(var_73eedca966115848)) {
        [[ var_73eedca966115848 ]]();
    }
    self.result = "timeout";
    thread removequestinstance();
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7252
// Size: 0x4c
function registercontributingplayers(player) {
    if (!isdefined(self.contributingplayers)) {
        self.contributingplayers = [];
    }
    if (!array_contains(self.contributingplayers, player)) {
        self.contributingplayers[self.contributingplayers.size] = player;
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72a5
// Size: 0x2c
function function_8acf00b423dca1e6() {
    if (getdvarint(@"hash_82bde055b11e6698", 0)) {
        return level.questinfo;
    } else {
        return level.var_41f4bc9ee8c7c9c6;
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72d8
// Size: 0xf3
function givequestrewardsinstance(team, rewardorigin, rewardangles, rewardscriptable, players) {
    /#
        function_d2caa40694d469ab();
    #/
    if (!isdefined(players)) {
        players = getteamdata(team, "players");
    }
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        if (!isdefined(player.missionparticipation)) {
            player.missionparticipation = 1;
        } else {
            player.missionparticipation++;
        }
        player namespace_c6ccccd95254983f::packextrascore0();
    }
    return givequestrewards(self.questcategory, self.rewardmodifier, self.modifier, team, rewardorigin, rewardangles, rewardscriptable, players);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73d3
// Size: 0x67
function givequestrewards(category, var_50b7f9e171376862, var_395d6df5c468ce77, team, rewardorigin, rewardangles, rewardscriptable, players) {
    group = getquestrewardbuildgroupref(category, var_50b7f9e171376862, var_395d6df5c468ce77);
    return givequestrewardgroup(group, team, rewardorigin, rewardangles, rewardscriptable, players);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7442
// Size: 0x15a
function givequestrewardgroup(group, team, rewardorigin, rewardangles, rewardscriptable, players) {
    results = [];
    level.currentrewarddropindex = 0;
    if (!isdefined(players)) {
        players = getteamdata(team, "players");
    }
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("giveQuestRewardGroup")) {
        namespace_71073fa38f11492::runbrgametypefunc6("giveQuestRewardGroup", group, team, rewardorigin, rewardangles, rewardscriptable, players);
    }
    rewards = getquestrewardgroupstablerewards(group);
    foreach (var_ea0ddae1258e9acf, var_a816505fffa5ebd2 in rewards) {
        var_bfe6b462496edde3 = givequestrewardref(var_ea0ddae1258e9acf, var_a816505fffa5ebd2, team, rewardorigin, rewardangles, rewardscriptable, players);
        value = var_bfe6b462496edde3[1];
        reward = var_bfe6b462496edde3[0];
        if (isdefined(results[reward])) {
            if (isstring(results[reward])) {
                results[reward] = results[reward] + "," + value;
            } else {
                results[reward] = results[reward] + value;
            }
        } else {
            results[reward] = value;
        }
    }
    level.currentrewarddropindex = undefined;
    return results;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75a4
// Size: 0xc8
function givequestrewardref(var_ea0ddae1258e9acf, var_a816505fffa5ebd2, team, rewardorigin, rewardangles, rewardscriptable, players) {
    tier = getquestrewardtier(team);
    rewardtype = getquestrewardstabletype(var_ea0ddae1258e9acf);
    value = getquestrewardstablevalue(var_ea0ddae1258e9acf);
    if (!isstring(value)) {
        scale = getquestscalervalue(var_a816505fffa5ebd2, tier);
        if (scale != 1) {
            value = value * scale;
            value = castrewardvalue(rewardtype, value);
        }
    }
    value = givequestreward(rewardtype, value, team, rewardorigin, rewardangles, rewardscriptable, players);
    return [0:rewardtype, 1:value];
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7674
// Size: 0x548
function givequestreward(type, value, team, rewardorigin, rewardangles, rewardscriptable, players) {
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("giveQuestReward")) {
        var_bfe6b362496edbb0 = namespace_71073fa38f11492::function_d72af9ccedfc923b("giveQuestReward", type, value, team, rewardorigin, rewardangles, rewardscriptable, players);
        value = var_bfe6b362496edbb0[1];
        completed = var_bfe6b362496edbb0[0];
        if (completed) {
            return value;
        }
    }
    switch (type) {
    case #"hash_59b8e9d05b31ff9":
        if (istrue(level.br_plunder_enabled)) {
            participantplunder = isdefined(rewardscriptable) && istrue(rewardscriptable.participantplunder);
            brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
            if (brgametype != "plunder" && brgametype != "risk" && !participantplunder) {
                giveteamplunderflat(team, value);
            } else if (players.size > 0) {
                if (!namespace_36f464722d326bbe::function_2d79a7a3b91c4c3e() && namespace_36f464722d326bbe::isbrstylegametype()) {
                    giveteamplunderflat(team, value, 1);
                } else {
                    giveteamplunderdistributive(players, value);
                }
            } else {
                value = 0;
            }
        } else {
            value = 0;
        }
        break;
    case #"hash_fa66c6f6bd945535":
        if (isdefined(rewardscriptable) && istrue(rewardscriptable.participantxp)) {
            var_2329e2336d8412bc = players;
        } else {
            var_2329e2336d8412bc = getteamdata(team, "players");
        }
        foreach (player in var_2329e2336d8412bc) {
            player thread points::doscoreevent(#"hash_607cd099425b81c7", undefined, undefined, value, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
            weaponxp = int(value * 0.2);
            lastweaponobj = player.lastnormalweaponobj;
            player namespace_d20f8ef223912e12::givebrweaponxp(#"", weaponxp, lastweaponobj, 0, 0);
            player.br_contractxpearned = get_int_or_0(player.br_contractxpearned) + value;
        }
        break;
    case #"hash_5c95c522c7b782c2":
        if (isdefined(rewardscriptable) && istrue(rewardscriptable.participantweaponxp)) {
            var_2329e2336d8412bc = players;
        } else {
            var_2329e2336d8412bc = getteamdata(team, "players");
        }
        foreach (player in var_2329e2336d8412bc) {
            lastweaponobj = player.lastnormalweaponobj;
            player namespace_d20f8ef223912e12::givebrweaponxp(#"", value, lastweaponobj, 0, 0);
        }
        break;
    case #"hash_3fcca127b49609dc":
        brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
        if (brgametype != "plunder" && brgametype != "risk") {
            items = getscriptablelootcachecontents(rewardscriptable, value);
            questrewarddropitems(team, items, rewardorigin, rewardangles, 0);
        }
        break;
    case #"hash_4f00b29797aa9132":
        items = getscriptablelootcachecontents(rewardscriptable, value);
        questrewarddropitems(team, items, rewardorigin, rewardangles, 1);
        break;
    case #"hash_f63eaf7a297850fc":
        items = strtok(value, " ");
        questrewarddropitems(team, items, rewardorigin, rewardangles, 0);
        break;
    case #"hash_161f0250e7e8e1b5":
        var_736d8d9188ccbd45 = getteamdata(team, "players")[0];
        calldropbag(var_736d8d9188ccbd45, rewardorigin);
        break;
    case #"hash_5a20d43f09c87c1d":
        questrewardcirclepeek(team);
        break;
    case #"hash_bee67d6e01f8331f":
        thread addquestrewardtierframeend(team, value);
        break;
    case #"hash_4938974347fbe589":
        if (!namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
            blueprintextract = namespace_8e13c187e2eade0c::blueprintextract_trygetreward(rewardorigin);
            if (isdefined(blueprintextract)) {
                namespace_8e13c187e2eade0c::blueprintextract_beforepickupspawned(team);
                items = [0:blueprintextract];
                questrewarddropitems(team, items, rewardorigin, rewardangles, 0);
                displayteamsplash(team, "br_blueprint_extract_quest_spawned");
            }
        }
        break;
    case #"hash_634b246c3da5c56f":
        var_5935fe3b4986afa2 = getclosestplayerforreward(team, players, rewardorigin);
        if (isdefined(var_5935fe3b4986afa2)) {
            var_5935fe3b4986afa2 thread questrewarduav(value);
        }
        break;
    case #"hash_22ec6d5e437a8571":
        function_62471111ae6a1489(team, players, rewardorigin);
        break;
    case #"hash_4ad475e6e15635bd":
        dropcircle = spawnstruct();
        dropcircle.origin = rewardorigin;
        dropcircle.dropradius = 300;
        dropcircle.nodropanim = 1;
        level thread namespace_cf880efca02c6010::dropdeliveryatpos(dropcircle, "quest_reward");
        break;
    case #"hash_db653a4972b3c13b":
        break;
    default:
        /#
            assertmsg("Unknown Quest Reward Type '" + type + "'");
        #/
        break;
    }
    return value;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bc4
// Size: 0xd9
function getclosestplayerforreward(team, players, rewardorigin) {
    if (isdefined(players) && players.size > 0) {
        var_afc2f18cdaa6c9cc = players;
    } else {
        var_afc2f18cdaa6c9cc = getteamdata(team, "players");
    }
    closestplayer = undefined;
    var_14f2e41bc5ced509 = undefined;
    foreach (player in var_afc2f18cdaa6c9cc) {
        dist = distance2d(player.origin, rewardorigin);
        if (!isdefined(var_14f2e41bc5ced509) || dist < var_14f2e41bc5ced509) {
            var_14f2e41bc5ced509 = dist;
            closestplayer = player;
        }
    }
    return closestplayer;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ca5
// Size: 0x107
function setupcirclepeek() {
    if (istrue(level.br_circle_disabled) || istrue(level.br_level.staticcircle)) {
        return;
    }
    /#
        assertex(!isdefined(level.circlepeeks), "setupCirclePeek called too many times. Circle Peeks are already set up.");
    #/
    level.circlepeeks = [];
    level.teamswithcirclepeek = [];
    for (index = 1; index < level.br_level.br_circleradii.size; index++) {
        circleradius = level.br_level.br_circleradii[index];
        circleorigin = level.br_level.br_circlecenters[index];
        level.circlepeeks[index] = spawnstruct();
        level.circlepeeks[index] function_6b6b6273f8180522("PeekCircle_Br", circleorigin, circleradius);
        level.circlepeeks[index] function_4eaf685bc40a3b9();
    }
    level thread circlepeekcleanup();
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7db3
// Size: 0xc3
function circlepeekcleanup() {
    self endon("game_ended");
    level endon("CirclePeekCleanup");
    while (1) {
        level waittill("br_circle_set");
        level.circlepeeks[level.br_circle.circleindex + 1] function_af5604ce591768e1();
        foreach (team in getarraykeys(level.teamswithcirclepeek)) {
            level.teamswithcirclepeek[team]--;
            if (level.teamswithcirclepeek[team] < 0) {
                level.teamswithcirclepeek[team] = 0;
            }
        }
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e7d
// Size: 0x15d
function questrewardcirclepeek(team) {
    if (getdvarint(@"hash_82bde055b11e6698", 0)) {
        if (istrue(level.br_circle_disabled)) {
            return;
        }
        if (!isdefined(level.teamswithcirclepeek[team])) {
            level.teamswithcirclepeek[team] = 0;
        }
        level.teamswithcirclepeek[team]++;
        index = level.teamswithcirclepeek[team] + level.br_circle.circleindex + 1;
        if (!isdefined(level.circlepeeks[index])) {
            foreach (player in getteamdata(team, "players")) {
                player namespace_58fb4f2e73fd41a0::setlowermessageomnvar("circle_peek_limit", undefined, 5);
            }
            return;
        }
        foreach (player in getteamdata(team, "players")) {
            level.circlepeeks[index] function_cfd53c8f6878014f(player);
        }
    } else {
        namespace_981ad73f8047222f::function_647a8c40104e4866(team);
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fe1
// Size: 0x6f
function getquesttablerewardgroup(category) {
    var_2edab15f93691de8 = function_8acf00b423dca1e6();
    group = var_2edab15f93691de8.rewards.categorytogroup[category];
    if (!isdefined(group)) {
        group = tablelookup("mp/brmissions.csv", 1, category, 7);
        var_2edab15f93691de8.rewards.categorytogroup[category] = group;
    }
    return group;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8058
// Size: 0xfb
function getquestrewardgroupstablerewards(group) {
    var_4c90cb0f1e0cd03a = getquestrewardsgrouptable();
    var_2edab15f93691de8 = function_8acf00b423dca1e6();
    rewards = var_2edab15f93691de8.rewards.grouptorewards[group];
    if (!isdefined(rewards)) {
        rewards = [];
        var_e1e297e1dba915dc = 2;
        var_8201e3609f801081 = 3;
        while (1) {
            ref = tablelookup(var_4c90cb0f1e0cd03a, 0, group, var_e1e297e1dba915dc);
            if (ref == "") {
                break;
            }
            scaler = tablelookup(var_4c90cb0f1e0cd03a, 0, group, var_8201e3609f801081);
            rewards[ref] = scaler;
            var_e1e297e1dba915dc = var_e1e297e1dba915dc + 2;
            var_8201e3609f801081 = var_8201e3609f801081 + 2;
        }
        if (isdefined(level.brmodevariantrewardcullfunc)) {
            rewards = [[ level.brmodevariantrewardcullfunc ]](rewards);
        }
        var_2edab15f93691de8.rewards.grouptorewards[group] = rewards;
    }
    return rewards;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x815b
// Size: 0x91
function getquestrewardstabletype(reward) {
    var_8519ce2870b094d2 = function_29c4f14ee8c99d3f();
    if (namespace_36f464722d326bbe::function_6c1fce6f6b8779d5() == "risk") {
        var_8519ce2870b094d2 = "mp/brmission_rewards_dmz.csv";
    }
    var_2edab15f93691de8 = function_8acf00b423dca1e6();
    type = var_2edab15f93691de8.rewards.rewardtotype[reward];
    if (!isdefined(type)) {
        type = tablelookup(var_8519ce2870b094d2, 0, reward, 1);
        var_2edab15f93691de8.rewards.rewardtotype[reward] = type;
    }
    return type;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81f4
// Size: 0x11a
function getquestrewardstablevalue(var_ea0ddae1258e9acf) {
    var_8519ce2870b094d2 = function_29c4f14ee8c99d3f();
    if (namespace_36f464722d326bbe::function_6c1fce6f6b8779d5() == "risk") {
        var_8519ce2870b094d2 = "mp/brmission_rewards_dmz.csv";
    }
    var_2edab15f93691de8 = function_8acf00b423dca1e6();
    value = var_2edab15f93691de8.rewards.rewardtovalue[var_ea0ddae1258e9acf];
    if (!isdefined(value)) {
        columnindex = getquestrewardstablevaluecolumnindex();
        value = tablelookup(var_8519ce2870b094d2, 0, var_ea0ddae1258e9acf, columnindex);
        type = getquestrewardstabletype(var_ea0ddae1258e9acf);
        value = castrewardvalue(type, value);
        var_2edab15f93691de8.rewards.rewardtovalue[var_ea0ddae1258e9acf] = value;
    }
    if (istrue(level.bmoovertime) && !isstring(value)) {
        value = int(value * level.overtimecashmultiplier);
    }
    if (namespace_d76af9f804655767::ispubliceventoftypeactive(15) && !isstring(value)) {
        value = int(value * level.br_pe_data[15].var_46a451f9012bd1c);
    }
    return value;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8316
// Size: 0x8b
function getquestrewardstablevaluecolumnindex() {
    /#
        assert(isdefined(level.maxteamsize));
    #/
    teamsize = level.maxteamsize;
    if (namespace_d3d40f75bb4e4c32::istutorial()) {
        teamsize = 1;
    }
    switch (teamsize) {
    case 4:
        return 10;
    case 3:
        return 9;
    case 2:
        return 8;
    case 1:
        return 7;
    default:
        return 9;
        break;
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83a8
// Size: 0xe2
function getquestrewardscalerstablescaleinfo(ref) {
    var_2edab15f93691de8 = function_8acf00b423dca1e6();
    info = var_2edab15f93691de8.rewards.scalertoscaleinfo[ref];
    if (!isdefined(info)) {
        info = [];
        var_33f38025cf1bb801 = 1;
        var_8201e3609f801081 = 2;
        while (1) {
            tier = tablelookup("mp/brmission_reward_scalers.csv", 0, ref, var_33f38025cf1bb801);
            if (tier == "") {
                break;
            }
            tier = int(tier);
            scaler = float(tablelookup("mp/brmission_reward_scalers.csv", 0, ref, var_8201e3609f801081));
            info[tier] = scaler;
            var_33f38025cf1bb801 = var_33f38025cf1bb801 + 2;
            var_8201e3609f801081 = var_8201e3609f801081 + 2;
        }
        var_2edab15f93691de8.rewards.scalertoscaleinfo[ref] = info;
    }
    return info;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8492
// Size: 0x2e
function getquestplunderrewardinstance(tier) {
    return getquestplunderreward(self.questcategory, tier, self.modifier, self.rewardmodifier);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x84c8
// Size: 0x2e
function getquestxprewardinstance(tier) {
    return getquestxpreward(self.questcategory, tier, self.modifier, self.rewardmodifier);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x84fe
// Size: 0x2e
function getquestweaponxprewardinstance(tier) {
    return getquestweaponxpreward(self.questcategory, tier, self.modifier, self.rewardmodifier);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8534
// Size: 0x41
function getquestplunderreward(category, tier, var_7d42b5952d47067c, rewardmodifier) {
    if (!level.br_plunder_enabled) {
        return 0;
    }
    return getquestscaledvalue(category, tier, "plunder", var_7d42b5952d47067c, rewardmodifier);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x857d
// Size: 0x33
function getquestxpreward(category, tier, var_7d42b5952d47067c, rewardmodifier) {
    return getquestscaledvalue(category, tier, "xp", var_7d42b5952d47067c, rewardmodifier);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85b8
// Size: 0x33
function getquestweaponxpreward(category, tier, var_7d42b5952d47067c, rewardmodifier) {
    return getquestscaledvalue(category, tier, "weapon_xp", var_7d42b5952d47067c, rewardmodifier);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85f3
// Size: 0x106
function getquestscaledvalue(category, tier, type, var_7d42b5952d47067c, rewardmodifier) {
    group = getquesttablerewardgroup(category);
    getquestrewardbuildgroupref(category, rewardmodifier, var_7d42b5952d47067c);
    rewards = getquestrewardgroupstablerewards(group);
    value = 0;
    foreach (var_ea0ddae1258e9acf, var_a816505fffa5ebd2 in rewards) {
        rewardtype = getquestrewardstabletype(var_ea0ddae1258e9acf);
        if (rewardtype == type) {
            var_aa82e6d1b3760575 = getquestrewardstablevalue(var_ea0ddae1258e9acf);
            scale = getquestscalervalue(var_a816505fffa5ebd2, tier);
            value = value + var_aa82e6d1b3760575 * scale;
        }
    }
    value = castrewardvalue(type, value);
    return value;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8701
// Size: 0x71
function getquestscalervalue(var_a816505fffa5ebd2, tier) {
    scaler = 1;
    info = getquestrewardscalerstablescaleinfo(var_a816505fffa5ebd2);
    add = 0;
    for (i = 1; i <= tier; i++) {
        if (isdefined(info[i])) {
            add = info[i];
        }
        scaler = scaler + add;
    }
    return scaler;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x877a
// Size: 0xe4
function getquestperkbonus(team, var_de16a768392aeea5) {
    if (!isdefined(var_de16a768392aeea5)) {
        var_de16a768392aeea5 = 0;
    }
    var_f6426590c29d7ab0 = 0;
    foreach (player in getteamdata(team, "players")) {
        if (istrue(player.hasbettermissionrewards)) {
            var_f6426590c29d7ab0++;
        }
    }
    if (!var_de16a768392aeea5 && isdefined(level.questinfo.maxperkbonustier) && isdefined(level.questinfo.maxperkbonustier[team])) {
        var_f6426590c29d7ab0 = int(min(var_f6426590c29d7ab0, level.questinfo.maxperkbonustier[team]));
    }
    return var_f6426590c29d7ab0;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8866
// Size: 0x13f
function questrewarddropitems(team, items, origin, angles, var_a6293f3144240b99, var_3bbe1192172d43fd, var_77bd0639072486ac) {
    if (!isdefined(items)) {
        return;
    }
    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    var_cb4fad49263e20c4 = spawnstruct();
    var_cb4fad49263e20c4.origin = origin;
    var_cb4fad49263e20c4.angles = angles;
    var_cb4fad49263e20c4.itemsdropped = 0;
    if (isdefined(level.currentrewarddropindex)) {
        var_cb4fad49263e20c4.itemsdropped = level.currentrewarddropindex;
    }
    var_605079299d001231 = var_cb4fad49263e20c4 namespace_1b7e64f50cca9321::lootspawnitemlist(dropstruct, items, var_a6293f3144240b99, undefined, var_3bbe1192172d43fd, var_77bd0639072486ac);
    foreach (item in var_605079299d001231) {
        item.team = team;
    }
    if (isdefined(level.currentrewarddropindex)) {
        level.currentrewarddropindex = var_cb4fad49263e20c4.itemsdropped;
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89ac
// Size: 0x68
function questrewarduav(uavtype) {
    streakinfo = namespace_9abe40d2af041eb2::createstreakinfo(uavtype, self);
    streakinfo.skipequippedstreakcheck = 1;
    streakinfo.var_32cd77f7f836e8e4 = 0;
    if (uavtype == "directional_uav") {
        streakinfo.var_97072eeae32ebd38 = getdvarint(@"hash_df0bf19d56f89b93", 15);
    }
    namespace_f1fe279354a7da2::tryuseuavfromstruct(streakinfo);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a1b
// Size: 0x74
function getquestrewardbuildgroupref(category, var_50b7f9e171376862, var_395d6df5c468ce77) {
    var_c077500984233d8d = getquesttablerewardgroup(category);
    group = var_c077500984233d8d;
    if (isdefined(var_395d6df5c468ce77)) {
        group = group + var_395d6df5c468ce77;
    }
    if (isdefined(var_50b7f9e171376862)) {
        group = group + var_50b7f9e171376862;
    }
    if (questrewardgroupexist(group)) {
        return group;
    }
    group = var_c077500984233d8d;
    if (isdefined(var_50b7f9e171376862)) {
        group = group + var_50b7f9e171376862;
    }
    if (questrewardgroupexist(group)) {
        return group;
    }
    return var_c077500984233d8d;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a97
// Size: 0x38
function questrewardgroupexist(var_2f0b8c1f978fd835) {
    var_4c90cb0f1e0cd03a = getquestrewardsgrouptable();
    ref = tablelookup(var_4c90cb0f1e0cd03a, 0, var_2f0b8c1f978fd835, 0);
    return ref != "";
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ad7
// Size: 0xee
function getrewardvaluetype(rewardtype) {
    switch (rewardtype) {
    case #"hash_59b8e9d05b31ff9":
    case #"hash_161f0250e7e8e1b5":
    case #"hash_3fcca127b49609dc":
    case #"hash_4938974347fbe589":
    case #"hash_4ad475e6e15635bd":
    case #"hash_4f00b29797aa9132":
    case #"hash_5a20d43f09c87c1d":
    case #"hash_5c95c522c7b782c2":
    case #"hash_bee67d6e01f8331f":
    case #"hash_db653a4972b3c13b":
    case #"hash_fa66c6f6bd945535":
        return "int";
    case #"hash_22ec6d5e437a8571":
    case #"hash_634b246c3da5c56f":
    case #"hash_f63eaf7a297850fc":
        return "string";
    default:
        /#
            assertmsg("Unknown Quest Reward Type '" + rewardtype + "'");
        #/
        break;
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bcc
// Size: 0x9b
function castrewardvalue(rewardtype, value) {
    type = getrewardvaluetype(rewardtype);
    switch (type) {
    case #"hash_4730906c2f53f03e":
        value = int(value);
        break;
    case #"hash_3e4a6f464c850b65":
        value = float(value);
        break;
    case #"hash_2ac140ce3b5ea398":
        value = "" + value;
        break;
    default:
        /#
            assertmsg("Unknown Quest Reward Value Type '" + type + "'");
        #/
        break;
    }
    return value;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c6f
// Size: 0x60
function getquestrewardsgrouptable() {
    if (getdvarint(@"hash_78653010d584aa6e", 0)) {
        var_4c90cb0f1e0cd03a = getmatchrulesdata("brData", "brMissionRewardGroupsTable");
    } else {
        var_4c90cb0f1e0cd03a = getdvar(@"hash_85ba512aed5ce540", "mp/brmission_reward_groups.csv");
    }
    if (!isdefined(var_4c90cb0f1e0cd03a) || var_4c90cb0f1e0cd03a == "") {
        var_4c90cb0f1e0cd03a = "mp/brmission_reward_groups.csv";
    }
    return var_4c90cb0f1e0cd03a;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8cd7
// Size: 0x75
function function_29c4f14ee8c99d3f() {
    if (getdvarint(@"hash_82bde055b11e6698", 0)) {
        var_122320381ea5bbe9 = getdvar(@"hash_f29fa998fb70c4d5", "mp/brmission_rewards.csv");
        return var_122320381ea5bbe9;
    } else {
        if (getdvarint(@"hash_78653010d584aa6e", 0)) {
            var_122320381ea5bbe9 = getmatchrulesdata("brData", "brMissionRewardTable");
        }
        if (!isdefined(var_122320381ea5bbe9) || var_122320381ea5bbe9 == "") {
            var_122320381ea5bbe9 = "mp/brmission_rewards.csv";
        }
        return var_122320381ea5bbe9;
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d53
// Size: 0x2c
function getquestrewardgroupindex(group) {
    var_4c90cb0f1e0cd03a = getquestrewardsgrouptable();
    return int(tablelookup(var_4c90cb0f1e0cd03a, 0, group, 1));
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d87
// Size: 0x14d
function function_4f93b5d0c1953(team, players, rewardorigin) {
    var_86eede4334852d70 = level.br_armory_kiosk.scriptables;
    var_ced8a1f62ae2956b = [];
    if (!isdefined(var_86eede4334852d70) || var_86eede4334852d70.size == 0) {
        return;
    }
    foreach (kiosk in var_86eede4334852d70) {
        if (!istrue(kiosk.disabled)) {
            var_ced8a1f62ae2956b[var_ced8a1f62ae2956b.size] = kiosk;
        }
    }
    locations = array_randomize(var_ced8a1f62ae2956b);
    var_1d1479e278ab33db = undefined;
    var_bf97af9158bcf3 = undefined;
    foreach (kiosk in locations) {
        var_556b31282abcb132 = distance2d(kiosk.origin, rewardorigin);
        if (!isdefined(var_bf97af9158bcf3) || var_bf97af9158bcf3 > var_556b31282abcb132) {
            var_bf97af9158bcf3 = var_556b31282abcb132;
            var_1d1479e278ab33db = kiosk;
        }
    }
    return var_1d1479e278ab33db;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8edc
// Size: 0x9a
function function_62471111ae6a1489(team, players, rewardorigin) {
    kiosk = function_4f93b5d0c1953(team, players, rewardorigin);
    if (!isdefined(kiosk)) {
        return;
    }
    foreach (player in players) {
        if (isdefined(player) && !istrue(player.br_iseliminated)) {
            namespace_a4b43c1cf86c6fe5::kiosksetupfiresaleforplayer(kiosk, player);
        }
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f7d
// Size: 0x3f
function getquestrewardtier(team) {
    var_2edab15f93691de8 = function_8acf00b423dca1e6();
    tier = var_2edab15f93691de8.tiers[team];
    if (!isdefined(tier)) {
        tier = 1;
    }
    return tier;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8fc4
// Size: 0x3d
function setquestrewardtier(team, tier) {
    var_2edab15f93691de8 = function_8acf00b423dca1e6();
    var_2edab15f93691de8.tiers[team] = tier;
    setquestrewardtierteamomnvar(team, tier);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9008
// Size: 0x25
function addquestrewardtier(team, value) {
    setquestrewardtier(team, getquestrewardtier(team) + value);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9034
// Size: 0x26
function addquestrewardtierframeend(team, value) {
    waittillframeend();
    setquestrewardtier(team, getquestrewardtier(team) + value);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9061
// Size: 0x6d
function setquestindexteamomnvar(team, var_5e9b1036a4cae82f) {
    foreach (player in getteamdata(team, "players")) {
        player setquestindexomnvar(var_5e9b1036a4cae82f);
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90d5
// Size: 0x23
function setquestindexomnvar(var_5e9b1036a4cae82f) {
    /#
        function_fe3b51cfbf0f97c5();
    #/
    self setclientomnvar("ui_br_objective_index", var_5e9b1036a4cae82f);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90ff
// Size: 0x6d
function setquestrewardtierteamomnvar(team, tier) {
    foreach (player in getteamdata(team, "players")) {
        player setquestrewardtieromnvar(tier);
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9173
// Size: 0x23
function setquestrewardtieromnvar(tier) {
    /#
        function_fe3b51cfbf0f97c5();
    #/
    self setclientomnvar("ui_br_objective_reward_tier", tier);
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x919d
// Size: 0xc2
function cancelallmissions() {
    foreach (quest in level.questinfo.quests) {
        foreach (instance in quest.instances) {
            instance.result = "cancel";
            instance removequestinstance();
        }
    }
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9266
// Size: 0x36f
function getallactivequestsforteam(team) {
    results = [];
    foreach (quest in level.questinfo.quests) {
        foreach (id, instance in quest.instances) {
            if (id != team) {
                continue;
            }
            if (namespace_4bc0ead8d2af3d84::isquestinstancealocale(instance)) {
                continue;
            }
            questinfo = spawnstruct();
            questinfo.instance = instance;
            switch (instance.category) {
            case #"hash_96e641d7fe5b1cf1":
                if (isdefined(instance.targetplayer)) {
                    questinfo.origin = instance.targetplayer.origin;
                }
                break;
            case #"hash_1cc92bad632fbc15":
                if (isdefined(instance.subscribedlocale) && isdefined(instance.subscribedlocale.domflag) && isdefined(instance.subscribedlocale.domflag.curorigin)) {
                    questinfo.origin = instance.subscribedlocale.domflag.curorigin + (0, 0, 60);
                }
                break;
            case #"hash_5c57b61aa79410db":
                if (isdefined(instance.subscribedlocale.cacheentity.origin) && isdefined(instance.subscribedlocale.cacheentity)) {
                    questinfo.origin = instance.subscribedlocale.cacheentity.origin + (0, 0, 50);
                }
                break;
            case #"hash_d0eb63c46c25ef55":
                break;
            case #"hash_97546a43dd1105ce":
                if (isdefined(instance.cacheentity) && isdefined(instance.cacheentity.origin)) {
                    questinfo.origin = instance.cacheentity.origin + (0, 0, 50);
                }
                break;
            case #"hash_de61e484b9734ea1":
                break;
            case #"hash_cc7c1c701864c7bf":
                break;
            case #"hash_96815ed47cc355cf":
                break;
            case #"hash_d0eb8b9de6742b83":
                break;
            case #"hash_d50a09e505e005f1":
                break;
            case #"hash_7b0c576c4a7e4890":
                break;
            case #"hash_d43a3732d39e4a11":
                break;
            default:
                /#
                    assertmsg("Unhandled mission type: " + instance.category);
                #/
                break;
            }
            results[results.size] = questinfo;
        }
    }
    return results;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95dd
// Size: 0x60
function getquestunlockableindexfromlootid(lootid) {
    var_a03d4fe1f134db01 = level.questinfo.unlockables[lootid];
    if (!isdefined(var_a03d4fe1f134db01)) {
        /#
            assert("Could not find an unlockable indx for lootId, " + lootid + ". Make sure it exists in " + "mp/brmission_unlockables.csv" + ".");
        #/
        return 0;
    }
    return var_a03d4fe1f134db01.unlockableindex;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9645
// Size: 0x131
function getrandomextractunlockablelootid() {
    var_db4d4d3dcae5375 = 0;
    foreach (var_a03d4fe1f134db01 in level.questinfo.unlockables) {
        var_db4d4d3dcae5375 = var_db4d4d3dcae5375 + var_a03d4fe1f134db01.extractunlockablechance;
    }
    var_d80612ae080f4b21 = randomfloatrange(0, var_db4d4d3dcae5375);
    var_b4f3205e2a8c0862 = 0;
    foreach (var_a03d4fe1f134db01 in level.questinfo.unlockables) {
        var_b4f3205e2a8c0862 = var_b4f3205e2a8c0862 + var_a03d4fe1f134db01.extractunlockablechance;
        if (var_d80612ae080f4b21 <= var_b4f3205e2a8c0862) {
            return var_a03d4fe1f134db01.lootid;
        }
    }
    /#
        assert("Should have already found a random piece of loot. Check function logic for errors.");
    #/
    return level.questinfo.unlockables[0].lootid;
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x977e
// Size: 0x12
function function_d2caa40694d469ab() {
    /#
        function_8ff83bdd5420ae28("travel");
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9797
// Size: 0x12
function function_8b0829a8ce24f0aa() {
    /#
        function_8ff83bdd5420ae28("<unknown string>");
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x97b0
// Size: 0x50
function function_8ff83bdd5420ae28(type) {
    /#
        var_62f1998d4ccbbd13 = self.debugtype;
        if (!isdefined(var_62f1998d4ccbbd13)) {
            var_62f1998d4ccbbd13 = "<unknown string>";
        }
        /#
            assertex(type == var_62f1998d4ccbbd13, "<unknown string>" + type + "<unknown string>" + var_62f1998d4ccbbd13 + "<unknown string>");
        #/
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9807
// Size: 0x17
function function_132b6261e829fa9c() {
    /#
        function_6736e9c4965502d1("travel", "<unknown string>");
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9825
// Size: 0x67
function function_6736e9c4965502d1(var_54764e985d3d2029, var_54764b985d3d1990) {
    /#
        var_62f1998d4ccbbd13 = self.debugtype;
        if (!isdefined(var_62f1998d4ccbbd13)) {
            var_62f1998d4ccbbd13 = "<unknown string>";
        }
        /#
            assertex(var_54764e985d3d2029 == var_62f1998d4ccbbd13 || var_54764b985d3d1990 == var_62f1998d4ccbbd13, "<unknown string>" + var_54764e985d3d2029 + "<unknown string>" + var_54764b985d3d1990 + "<unknown string>" + var_62f1998d4ccbbd13 + "<unknown string>");
        #/
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9893
// Size: 0x1a
function function_fe3b51cfbf0f97c5() {
    /#
        /#
            assertex(isplayer(self), "<unknown string>");
        #/
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x98b4
// Size: 0x31
function function_edc6b2561f8041e0() {
    /#
        /#
            assertex(isdefined(self.type) && namespace_cb965d2f71fefddc::isquesttablet(self.type), "<unknown string>");
        #/
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x98ec
// Size: 0x25
function function_cfea05fa19edb13b(category, func) {
    /#
        _registerquestfunc(category, func, "<unknown string>");
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9918
// Size: 0x22
function function_f14edc2973202386() {
    /#
        thread function_58c7e92065fbb263();
        thread function_5d305b3bfc39236c();
        namespace_e4c20df2c9115a56::registerhandlecommand(&function_a70d9040958e91c3);
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9941
// Size: 0xbd
function function_a70d9040958e91c3(command, args) {
    /#
        switch (command) {
        case #"hash_3fbd7dbc792314ea":
            function_bfaa2e162911a568();
            break;
        case #"hash_9779298a0ee0bed1":
            function_279b2ae4a95c269b(args[0]);
            break;
        case #"hash_3646a7f55b1c0ac9":
            function_5bb84e6bdcae8b0a(args);
            break;
        case #"hash_c0e656e5de2e359d":
            function_a608630338efae56(args);
            break;
        case #"hash_2b40e3c6ce7561c7":
            function_be813b7757b99ae0(args);
            break;
        case #"hash_91c28b828620cf74":
            thread function_d91326e8ffd1cb7(args[0]);
            break;
        default:
            break;
        }
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9a05
// Size: 0x101
function function_bfaa2e162911a568() {
    /#
        player = level.player;
        if (!isdefined(player) || !isdefined(player.team)) {
            return;
        }
        foreach (quest in level.questinfo.quests) {
            foreach (id, instance in quest.instances) {
                if (id == player.team) {
                    instance.result = "<unknown string>";
                    instance removequestinstance();
                }
            }
        }
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9b0d
// Size: 0x9a
function function_279b2ae4a95c269b(category) {
    /#
        tablet = spawnscriptable(getlootname(category), level.player.origin + (0, 0, 15), (0, 0, 0));
        tablet tabletinit(category);
        if (tablet.init) {
            tablet.keepinmap = 1;
            tablet thread function_3e68e198ba016b00();
        } else {
            tablet tablethide();
            iprintlnbold("<unknown string>");
        }
        return tablet;
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9bae
// Size: 0x1c
function function_3e68e198ba016b00() {
    /#
        self endon("<unknown string>");
        self waittill("<unknown string>");
        self freescriptable();
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9bd1
// Size: 0x19d
function function_5bb84e6bdcae8b0a(args) {
    /#
        var_dc675b36cbd04ba = args[0];
        var_3d50d2d1243c2917 = args[1];
        var_ac6ca28a64718193 = level.player.team;
        if (!isdefined(var_ac6ca28a64718193)) {
            var_ac6ca28a64718193 = "<unknown string>";
        }
        if (var_dc675b36cbd04ba == "<unknown string>") {
            teams = [0:var_ac6ca28a64718193];
        } else if (var_dc675b36cbd04ba == "<unknown string>") {
            teams = getotherteam(var_ac6ca28a64718193);
        } else {
            teams = [0:var_dc675b36cbd04ba];
        }
        var_68f71eb953fe2cc0 = undefined;
        foreach (team in teams) {
            if (array_contains(level.questinfo.teamsonquests, team)) {
                continue;
            }
            aliveplayers = getteamdata(team, "<unknown string>");
            if (!aliveplayers.size) {
                continue;
            }
            var_68f71eb953fe2cc0 = random(aliveplayers);
            break;
        }
        if (!isdefined(var_68f71eb953fe2cc0)) {
            iprintlnbold("<unknown string>" + var_dc675b36cbd04ba + "<unknown string>");
            return;
        }
        tablet = function_279b2ae4a95c269b(var_3d50d2d1243c2917);
        if (isdefined(tablet)) {
            namespace_cb965d2f71fefddc::lootused(tablet, tablet.type, "<unknown string>", var_68f71eb953fe2cc0);
            iprintlnbold("<unknown string>" + var_68f71eb953fe2cc0.team + "directional_uav");
        }
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9d75
// Size: 0x9b
function function_756366dbe90f369c(var_1070d193895b35b4) {
    /#
        var_4599a00c9fc16d43 = strtok(var_1070d193895b35b4, "<unknown string>");
        var_1ebdbf59cb7998a = 0;
        foreach (tok in var_4599a00c9fc16d43) {
            var_1ebdbf59cb7998a = var_1ebdbf59cb7998a | level.questinfo.debuginfo.var_2484093a170df905[tok];
        }
        return var_1ebdbf59cb7998a;
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9e17
// Size: 0xa3
function function_31342031c93cfdc0(i) {
    /#
        var_1070d193895b35b4 = "<unknown string>";
        foreach (bit, str in level.questinfo.debuginfo.var_191417401f979fb4) {
            if (i & 1 << bit) {
                if (var_1070d193895b35b4 != "<unknown string>") {
                    var_1070d193895b35b4 = var_1070d193895b35b4 + "<unknown string>";
                }
                var_1070d193895b35b4 = var_1070d193895b35b4 + str;
            }
        }
        return var_1070d193895b35b4;
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9ec1
// Size: 0x3a
function function_a608630338efae56(args) {
    /#
        var_d126c8072ae45490 = args[0];
        if (var_d126c8072ae45490 == "<unknown string>") {
            level notify("<unknown string>");
            return;
        }
        level thread function_ee8fbb46302dee4a(var_d126c8072ae45490);
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9f02
// Size: 0x16e
function function_ee8fbb46302dee4a(type) {
    /#
        level notify("<unknown string>");
        level endon("<unknown string>");
        while (!isdefined(level.player)) {
            waitframe();
        }
        var_bd37b214227476ca = function_756366dbe90f369c(type);
        while (1) {
            var_47f3f37d04065b9f = getdvarfloat(@"hash_1929787a187dde7b", 5000);
            points = getquestpoints(var_bd37b214227476ca, level.player.origin, var_47f3f37d04065b9f, 0, 1);
            foreach (point in points) {
                sphere(point.origin, 10, (0, 1, 0), 0, 1);
                print3d(point.origin, function_31342031c93cfdc0(point.spawnflags), (0, 1, 1), 1, 1, 1, 1);
                radius = questpointgetradius(point);
                if (radius > 0) {
                    namespace_3c37cb17ade254d::draw_circle(point.origin, radius, (1, 1, 0), 1, 0, 0);
                }
            }
            waitframe();
        }
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa077
// Size: 0x29
function function_be813b7757b99ae0(args) {
    /#
        questrewardcirclepeek(level.player.team);
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa0a7
// Size: 0x1be
function function_d91326e8ffd1cb7(enabled) {
    /#
        level notify("<unknown string>");
        level endon("<unknown string>");
        if (enabled == "<unknown string>") {
            return;
        }
        while (1) {
            foreach (type, info in level.questinfo.tabletinfo) {
                var_e0d1e3a2b6f5323a = getlootscriptablearray(getlootname(type));
                foreach (tablet in var_e0d1e3a2b6f5323a) {
                    if (!isdefined(tablet.reservedplacement)) {
                        continue;
                    }
                    if (isarray(tablet.reservedplacement)) {
                        count = tablet.reservedplacement.size;
                        if (!count) {
                            continue;
                        }
                        for (i = 1; i < count; i++) {
                            placement = tablet.reservedplacement[i];
                            function_5d34afc069a50cba(placement, tablet.reservedplacement[i - 1]);
                        }
                        placement = tablet.reservedplacement[0];
                    } else {
                        placement = tablet.reservedplacement;
                    }
                    debugstar(tablet.origin, (0, 1, 0), 1, type);
                    function_5d34afc069a50cba(placement, tablet);
                }
            }
            waitframe();
        }
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa26c
// Size: 0xf9
function function_5d34afc069a50cba(placement, from) {
    /#
        if (!isdefined(from.var_975b4be3f9205374)) {
            from.var_975b4be3f9205374 = namespace_c5622898120e827f::getmintimetillpointindangercircle(from.origin);
        }
        if (!isdefined(placement.var_975b4be3f9205374)) {
            placement.var_975b4be3f9205374 = namespace_c5622898120e827f::getmintimetillpointindangercircle(placement.origin);
        }
        delta = placement.var_975b4be3f9205374 - from.var_975b4be3f9205374;
        if (delta <= 0) {
            color = (1, 0, 0);
        } else {
            color = (1, 1, 0);
        }
        line(from.origin, placement.origin, color);
        debugstar(placement.origin, color, 1, "<unknown string>" + delta);
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xa36c
// Size: 0x80
function function_aed58a503d8e32c3(numerator, denominator, var_c3f2e4be0e2206d8, var_f5f66e7f9cb52c09) {
    /#
        if (!isdefined(var_c3f2e4be0e2206d8)) {
            var_c3f2e4be0e2206d8 = 1;
        }
        if (!isdefined(var_f5f66e7f9cb52c09)) {
            var_f5f66e7f9cb52c09 = 1;
        }
        str = "<unknown string>" + numerator;
        if (var_c3f2e4be0e2206d8) {
            str = str + "<unknown string>" + denominator;
        }
        if (var_f5f66e7f9cb52c09 && denominator) {
            str = str + "<unknown string>" + function_fc84b7b73e9130bc(numerator / denominator, 1) + "<unknown string>";
        }
        return str;
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa3f3
// Size: 0x48
function function_fc84b7b73e9130bc(frac, var_b41871e1436f9240) {
    /#
        if (!isdefined(var_b41871e1436f9240)) {
            var_b41871e1436f9240 = 1;
        }
        return "<unknown string>" + int(frac * pow(10, 2 + var_b41871e1436f9240) + 0.5) / pow(10, var_b41871e1436f9240);
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa442
// Size: 0x5da
function function_58c7e92065fbb263() {
    /#
        setdvarifuninitialized(@"hash_d3c4b3e2a6204d64", 0);
        setdvarifuninitialized(@"hash_3cec5db77a324ac5", 12);
        while (!isdefined(level.player)) {
            waitframe();
        }
        wait(1);
        x_pos = 200;
        y_pos = 40;
        while (1) {
            hudelems = [];
            while (!getdvarint(@"hash_d3c4b3e2a6204d64", 0)) {
                waitframe();
            }
            var_41f97a94c30a7593 = function_5d895ce7d9060182();
            var_41f97a94c30a7593.x = x_pos;
            var_41f97a94c30a7593.y = y_pos;
            var_41f97a94c30a7593 setdevtext("<unknown string>");
            while (getdvarint(@"hash_d3c4b3e2a6204d64", 0)) {
                var_f9076fdebdd5b3fb = getdvarint(@"hash_d3c4b3e2a6204d64", 0);
                var_fa89ff89b0460da4 = 0;
                var_1e3c0e925b1a5b32 = 0;
                switch (var_f9076fdebdd5b3fb) {
                case 3:
                    var_fa89ff89b0460da4 = 1;
                    var_1e3c0e925b1a5b32 = 0;
                    break;
                case 2:
                    var_fa89ff89b0460da4 = 0;
                    var_1e3c0e925b1a5b32 = 1;
                    break;
                case 1:
                default:
                    var_fa89ff89b0460da4 = 1;
                    var_1e3c0e925b1a5b32 = 1;
                    break;
                }
                var_9327e30c0d510a51 = getdvarint(@"hash_3cec5db77a324ac5", 12);
                var_7bc749fccfc8e770 = [];
                if (var_fa89ff89b0460da4) {
                    var_ea80bcf709e10fe5 = 0;
                    foreach (type, count in self.debuginfo.var_2f8e8ca203d36b1d) {
                        var_ea80bcf709e10fe5 = var_ea80bcf709e10fe5 + count;
                    }
                    var_6ef66619669b76b3 = 0;
                    foreach (type, count in self.debuginfo.var_9db1e36a47913241) {
                        var_6ef66619669b76b3 = var_6ef66619669b76b3 + count;
                    }
                    var_7bc749fccfc8e770[var_7bc749fccfc8e770.size] = "<unknown string>" + function_aed58a503d8e32c3(var_6ef66619669b76b3, var_ea80bcf709e10fe5);
                    foreach (type, count in self.debuginfo.var_9db1e36a47913241) {
                        var_7bc749fccfc8e770[var_7bc749fccfc8e770.size] = "<unknown string>" + type + "<unknown string>" + function_aed58a503d8e32c3(count, var_ea80bcf709e10fe5, 0);
                    }
                    var_7bc749fccfc8e770[var_7bc749fccfc8e770.size] = "<unknown string>" + function_aed58a503d8e32c3(self.debuginfo.var_66a7ec880cde941b, var_ea80bcf709e10fe5, 0);
                    var_7bc749fccfc8e770[var_7bc749fccfc8e770.size] = "<unknown string>" + function_aed58a503d8e32c3(self.debuginfo.var_7b2f9f2035df4396, var_ea80bcf709e10fe5, 0);
                }
                if (var_1e3c0e925b1a5b32) {
                    var_7bc749fccfc8e770[var_7bc749fccfc8e770.size] = "<unknown string>";
                    foreach (type, quest in level.questinfo.quests) {
                        var_7bc749fccfc8e770[var_7bc749fccfc8e770.size] = "<unknown string>" + type + "<unknown string>" + quest.instances.size + "<unknown string>";
                        foreach (id, instance in quest.instances) {
                            var_7bc749fccfc8e770[var_7bc749fccfc8e770.size] = "<unknown string>" + id;
                            var_f7585468d6a35ce8 = level.questinfo.quests[type].funcs["<unknown string>"];
                            if (isdefined(var_f7585468d6a35ce8)) {
                                var_1720b66a99e6b824 = instance [[ var_f7585468d6a35ce8 ]]();
                                foreach (str in var_1720b66a99e6b824) {
                                    var_7bc749fccfc8e770[var_7bc749fccfc8e770.size] = "<unknown string>" + str;
                                }
                            }
                        }
                    }
                }
                count = 0;
                var_b9f7ac7066356a39 = 0;
                for (i = 0; i < var_7bc749fccfc8e770.size; i++) {
                    str = var_7bc749fccfc8e770[i];
                    if (!isdefined(hudelems[i])) {
                        hudelems[i] = function_5d895ce7d9060182();
                    }
                    if (!isdefined(hudelems[i])) {
                        break;
                    }
                    var_b9f7ac7066356a39 = var_b9f7ac7066356a39 || str != hudelems[i].var_e7ac8994c2b612d;
                    hudelems[i].x = x_pos;
                    hudelems[i].y = y_pos + 11 * (i + 1);
                    count++;
                }
                if (var_b9f7ac7066356a39) {
                    var_41f97a94c30a7593 clearalltextafterhudelem();
                    for (i = 0; i < count; i++) {
                        hudelems[i] setdevtext(var_7bc749fccfc8e770[i]);
                        hudelems[i].var_e7ac8994c2b612d = var_7bc749fccfc8e770[i];
                    }
                }
                if (count < hudelems.size) {
                    for (i = hudelems.size - 1; i >= count; i--) {
                        hudelems[i] destroy();
                        hudelems[i] = undefined;
                    }
                }
                wait(0.05);
            }
            foreach (hud in hudelems) {
                hud destroy();
            }
            var_41f97a94c30a7593 destroy();
        }
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaa23
// Size: 0x138
function function_5d895ce7d9060182() {
    /#
        fontelem = newhudelem();
        if (isdefined(fontelem)) {
            fontelem.elemtype = "<unknown string>";
            fontelem.font = "<unknown string>";
            fontelem.fontscale = 1.2;
            fontelem.basefontscale = fontelem.fontscale;
            fontelem.x = 0;
            fontelem.y = 0;
            fontelem.width = 0;
            fontelem.height = int(level.fontheight * fontelem.fontscale);
            fontelem.xoffset = 0;
            fontelem.yoffset = 0;
            fontelem.children = [];
            fontelem namespace_52f6938dd902c7d0::setparent(level.uiparent);
            fontelem.hidden = 0;
            fontelem.aligny = "<unknown string>";
            fontelem.alignx = "<unknown string>";
            fontelem.var_e7ac8994c2b612d = "<unknown string>";
            fontelem setdevtext("<unknown string>");
        }
        return fontelem;
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xab62
// Size: 0x23c
function function_5d305b3bfc39236c() {
    /#
        debughud = "<unknown string>" + "<unknown string>";
        thread function_2bb11cfc1551b19a(debughud + "<unknown string>" + function_f28fd66285fa2c9(@"hash_d3c4b3e2a6204d64") + "<unknown string>");
        thread function_2bb11cfc1551b19a(debughud + "<unknown string>" + function_f28fd66285fa2c9(@"hash_d3c4b3e2a6204d64") + "<unknown string>");
        thread function_2bb11cfc1551b19a(debughud + "<unknown string>" + function_f28fd66285fa2c9(@"hash_d3c4b3e2a6204d64") + "<unknown string>");
        thread function_2bb11cfc1551b19a(debughud + "<unknown string>" + function_f28fd66285fa2c9(@"hash_d3c4b3e2a6204d64") + "<unknown string>");
        foreach (type, info in level.questinfo.tabletinfo) {
            function_8f449f8c11c8ea84(type, "<unknown string>" + type + "<unknown string>", [0:0, 1:1], info.enabled);
        }
        function_8f449f8c11c8ea84("<unknown string>", "<unknown string>", [0:500, 1:1000, 2:5000, 3:10000, 4:50000], 5000);
        function_89a2139a95fab230("<unknown string>");
        var_e07185f7ee187b3a = getarraykeys(level.questinfo.tabletinfo);
        function_89a2139a95fab230("<unknown string>", var_e07185f7ee187b3a);
        function_89a2139a95fab230("<unknown string>" + "<unknown string>", var_e07185f7ee187b3a);
        function_89a2139a95fab230("<unknown string>" + "<unknown string>", var_e07185f7ee187b3a);
        var_b5c4f807971196ca = getarraykeys(level.questinfo.debuginfo.var_2484093a170df905);
        var_b5c4f807971196ca = array_add(var_b5c4f807971196ca, "<unknown string>");
        function_89a2139a95fab230("<unknown string>", var_b5c4f807971196ca);
        function_89a2139a95fab230("<unknown string>", [0:"<unknown string>", 1:"<unknown string>"]);
        function_89a2139a95fab230("<unknown string>");
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xada5
// Size: 0x50
function function_8f449f8c11c8ea84(var_a2a449cf44288026, dvarname, values, defaultvalue) {
    /#
        var_cbb0facdb1db8dd4 = "<unknown string>" + "<unknown string>" + var_a2a449cf44288026 + "<unknown string>";
        function_f23e7e2f6a51b5be(var_cbb0facdb1db8dd4, dvarname, values, defaultvalue);
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xadfc
// Size: 0xbc
function function_89a2139a95fab230(cmd, args) {
    /#
        var_cbb0facdb1db8dd4 = "<unknown string>" + "<unknown string>";
        if (isdefined(args)) {
            foreach (arg in args) {
                thread function_2bb11cfc1551b19a(var_cbb0facdb1db8dd4 + cmd + "<unknown string>" + arg + "<unknown string>" + cmd + "<unknown string>" + arg + "<unknown string>");
            }
        } else {
            thread function_2bb11cfc1551b19a(var_cbb0facdb1db8dd4 + cmd + "<unknown string>" + cmd + "<unknown string>");
        }
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xaebf
// Size: 0x11b
function function_f23e7e2f6a51b5be(var_cbb0facdb1db8dd4, dvarname, values, defaultvalue) {
    /#
        if (isdefined(defaultvalue)) {
            var_8b77c89f0db97ac3 = 0;
            foreach (value in values) {
                if (value == defaultvalue) {
                    var_8b77c89f0db97ac3 = 1;
                    break;
                }
            }
            if (!var_8b77c89f0db97ac3) {
                values[values.size] = defaultvalue;
            }
        }
        var_a606a5995982f6b3 = var_cbb0facdb1db8dd4 + dvarname + "<unknown string>";
        for (i = 0; i < values.size; i++) {
            value = values[i];
            isdefault = isdefined(defaultvalue) && value == defaultvalue;
            thread function_2bb11cfc1551b19a(var_a606a5995982f6b3 + value + ter_op(isdefault, "<unknown string>", "<unknown string>") + i + "<unknown string>" + dvarname + "<unknown string>" + value + "<unknown string>");
        }
    #/
}

// Namespace namespace_bd5b51637804dbad/namespace_4bc0ead8d2af3d84
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xafe1
// Size: 0x8a
function function_2bb11cfc1551b19a(cmd) {
    /#
        while (!isdefined(level.player)) {
            waitframe();
        }
        while (1) {
            if (!isdefined(level.var_ea8a728d3504fb9b) || level.var_ea8a728d3504fb9b < gettime()) {
                level.var_ea8a728d3504fb9b = gettime();
                level.var_28f915fb1d12fdb1 = 0;
            }
            if (level.var_28f915fb1d12fdb1 < 3) {
                break;
            }
            wait(0.05);
        }
        level.var_28f915fb1d12fdb1++;
        adddebugcommand(cmd);
    #/
}

