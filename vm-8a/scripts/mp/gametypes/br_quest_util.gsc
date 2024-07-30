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

#namespace br_quest_util;

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10a0
// Size: 0x55d
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
        var_191417401f979fb4[0] = "<dev string:x1c>";
        var_191417401f979fb4[1] = "<dev string:x27>";
        var_191417401f979fb4[2] = "<dev string:x38>";
        var_191417401f979fb4[3] = "<dev string:x49>";
        var_2484093a170df905 = [];
        var_2484093a170df905["<dev string:x5c>"] = 0;
        foreach (bit, str in var_191417401f979fb4) {
            var_2484093a170df905[str] = 1 << bit;
            var_2484093a170df905["<dev string:x5c>"] = var_2484093a170df905["<dev string:x5c>"] | 1 << bit;
        }
        var_2484093a170df905["<dev string:x60>"] = var_2484093a170df905["<dev string:x1c>"] | var_2484093a170df905["<dev string:x27>"] | var_2484093a170df905["<dev string:x38>"];
        level.questinfo.debuginfo.var_191417401f979fb4 = var_191417401f979fb4;
        level.questinfo.debuginfo.var_2484093a170df905 = var_2484093a170df905;
        level.questinfo.debuginfo.var_a001e7b664eaee73 = 0;
    #/
    level.questinfo.defaultfilter = [];
    level.questinfo.defaultfilter[0] = &filtercondition_isdead;
    level.questinfo.defaultfilter[1] = &filtercondition_ingulag;
    level.questinfo.getactiveforteam = &getallactivequestsforteam;
    scripts\mp\gametypes\br_circle::function_eca79fa0f341ee08(7, &dangercircletick);
    if (scripts\mp\gametypes\br_gametypes::isfeaturedisabled("brQuests")) {
        return;
    }
    loadtables();
    scripts\mp\utility\disconnect_event_aggregator::registerondisconnecteventcallback(&onplayerdisconnect);
    scripts\mp\gametypes\br_blueprint_extract_spawn::init();
    if (getdvarint(@"hash_82bde055b11e6698", 0)) {
        namespace_94f9b19ae91ab934::init();
        namespace_8e6e608bc83e3d46::init();
        namespace_2af0110302b87c2::init();
        namespace_5a4a9f3e4a0baf2f::init();
        namespace_d076143c5177e740::init();
    }
    if (getdvarint(@"hash_b91a7ebb801d5968", 1) == 1) {
        scripts\mp\gametypes\br_bunker_utility::disablelootbunkercachelocations();
    }
    if (getdvarint(@"hash_fd6b014836f663e0", 1) == 1) {
        scripts\mp\gametypes\br_bunker_utility::disablebunker11cachelocations();
    }
    thread inittablets();
    thread setupcirclepeek();
    assert(isdefined(game["dialog"]));
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
    if (!scripts\cp_mp\utility\game_utility::function_fa7bfcc1d68b7b73()) {
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

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1605
// Size: 0x120
function loadtables() {
    for (row = 0; true; row++) {
        unlockableindex = tablelookupbyrow("mp/brmission_unlockables.csv", row, 0);
        if (!isdefined(unlockableindex) || unlockableindex == "") {
            break;
        }
        if (int(tablelookup("mp/brmission_unlockables.csv", 0, unlockableindex, 3)) == 1) {
            continue;
        }
        unlockabledata = spawnstruct();
        unlockabledata.unlockableindex = int(unlockableindex);
        unlockabledata.lootid = int(tablelookup("mp/brmission_unlockables.csv", 0, unlockableindex, 1));
        unlockabledata.extractunlockablechance = int(tablelookup("mp/brmission_unlockables.csv", 0, unlockableindex, 2));
        assert(isdefined(unlockabledata.unlockableindex));
        assert(isdefined(unlockabledata.lootid));
        assert(isdefined(unlockabledata.extractunlockablechance));
        level.questinfo.unlockables[unlockabledata.lootid] = unlockabledata;
    }
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x172d
// Size: 0x865
function inittablets() {
    level.questinfo.activetablets = [];
    /#
        level.questinfo.debuginfo.var_9db1e36a47913241 = [];
        foreach (type, info in level.questinfo.tabletinfo) {
            level.questinfo.debuginfo.var_9db1e36a47913241[type] = 0;
            level.questinfo.debuginfo.var_2f8e8ca203d36b1d[type] = 0;
        }
        level.questinfo.debuginfo.tabletsused = 0;
        level.questinfo.debuginfo.var_7b2f9f2035df4396 = 0;
        level.questinfo.debuginfo.locationtablets = [];
    #/
    hidepercent = getdvarfloat(@"hash_4ec62b4599196026", 0.667);
    hiddentablets = [];
    foreach (type, info in level.questinfo.tabletinfo) {
        lootname = getlootname(type);
        tablets = getlootscriptablearray(lootname);
        if (!info.enabled) {
            continue;
        }
        var_6d130ebb53ad2136 = getdvarfloat(@"hash_8d46517b8da8688", 1200);
        if (var_6d130ebb53ad2136 > 0) {
            numdisabled = 0;
            foreach (kiosk in level.br_armory_kiosk.scriptables) {
                closetablets = getlootscriptablearrayinradius(lootname, undefined, kiosk.origin, var_6d130ebb53ad2136);
                foreach (closetablet in closetablets) {
                    if (istrue(closetablet.startdisabled)) {
                        continue;
                    }
                    closetablet.startdisabled = 1;
                    numdisabled++;
                }
            }
            for (i = tablets.size - 1; i >= 0 && numdisabled; i--) {
                if (istrue(tablets[i].startdisabled)) {
                    tablets[i] = tablets[tablets.size - 1];
                    tablets[tablets.size - 1] = undefined;
                    numdisabled--;
                }
            }
        }
        if (istrue(level.lowpopstart) && scripts\mp\gametypes\br::lowpopallowtweaks()) {
            var_984f974fa5f11f8 = getdvarfloat(@"hash_cc6bb1e27a91186f", 0.8);
            var_4038cde6712b9f81 = int(min(tablets.size, tablets.size * (1 - var_984f974fa5f11f8) + 0.5));
            for (i = 0; i < var_4038cde6712b9f81; i++) {
                randindex = randomintrange(0, tablets.size);
                tablets[randindex].startdisabled = 1;
                tablets[randindex] = tablets[tablets.size - 1];
                tablets[tablets.size - 1] = undefined;
            }
        }
        for (i = tablets.size - 1; i >= 0; i--) {
            tablet = tablets[i];
            tablet tabletinit(type);
            if (!tablet.init) {
                tablets[i].startdisabled = 1;
                tablets[i] = tablets[tablets.size - 1];
                tablets[tablets.size - 1] = undefined;
            }
        }
        if (tablets.size) {
            setobjectivetypesomvarbit(type);
        }
        var_2c3363605abb4836 = tablets.size * hidepercent;
        var_5731f7181809474a = int(var_2c3363605abb4836);
        extrachance = var_2c3363605abb4836 - var_5731f7181809474a;
        if (randomfloat(1) < extrachance) {
            var_5731f7181809474a++;
        }
        for (i = 0; i < var_5731f7181809474a; i++) {
            randindex = randomintrange(0, tablets.size);
            tablet = tablets[randindex];
            tablets[randindex].startdisabled = 1;
            hiddentablets[hiddentablets.size] = tablets[randindex];
            tablets[randindex] = tablets[tablets.size - 1];
            tablets[tablets.size - 1] = undefined;
        }
    }
    zones = getarraykeys(level.calloutglobals.namelocations);
    var_6b7736374856505c = [];
    locationmin = getdvarint(@"hash_96db0b0e9378ad40", 1);
    if (locationmin > 0) {
        foreach (zone in zones) {
            var_6b7736374856505c[zone] = locationmin;
            /#
                level.questinfo.debuginfo.locationtablets[zone] = [];
            #/
        }
    }
    totalquests = 0;
    foreach (type, info in level.questinfo.tabletinfo) {
        tablets = getlootscriptablearray(getlootname(type));
        totalquests += tablets.size;
        if (info.enabled) {
            foreach (tablet in tablets) {
                if (istrue(tablet.startdisabled)) {
                    tablet tablethide();
                    continue;
                }
                tablet tabletshow();
                if (var_6b7736374856505c.size > 0) {
                    tabletzone = scripts\mp\gametypes\br_callouts::getlocationnameforpoint(tablet.origin);
                    if (isdefined(var_6b7736374856505c[tabletzone])) {
                        /#
                            var_421bf0c7afec94ae = level.questinfo.debuginfo.locationtablets[tabletzone].size;
                            level.questinfo.debuginfo.locationtablets[tabletzone][var_421bf0c7afec94ae] = tablet;
                        #/
                        var_6b7736374856505c[tabletzone]--;
                        if (!var_6b7736374856505c[tabletzone]) {
                            var_6b7736374856505c[tabletzone] = undefined;
                        }
                    }
                }
            }
            continue;
        }
        foreach (tablet in tablets) {
            tablet tablethide();
        }
    }
    if (var_6b7736374856505c.size) {
        hiddentablets = array_randomize(hiddentablets);
        for (i = 0; i < hiddentablets.size; i++) {
            tablet = hiddentablets[i];
            tabletzone = scripts\mp\gametypes\br_callouts::getlocationnameforpoint(tablet.origin);
            if (isdefined(var_6b7736374856505c[tabletzone])) {
                tablet tabletshow();
                /#
                    var_421bf0c7afec94ae = level.questinfo.debuginfo.locationtablets[tabletzone].size;
                    level.questinfo.debuginfo.locationtablets[tabletzone][var_421bf0c7afec94ae] = tablet;
                #/
                var_6b7736374856505c[tabletzone]--;
                if (!var_6b7736374856505c[tabletzone]) {
                    var_6b7736374856505c[tabletzone] = undefined;
                    if (!var_6b7736374856505c.size) {
                        break;
                    }
                }
            }
        }
    }
    activequests = level.questinfo.activetablets.size;
    hiddenquests = hiddentablets.size;
    scripts\mp\gametypes\br_analytics::branalytics_inittablets(totalquests, activequests, hiddenquests, hidepercent);
    if (scripts\mp\gametypes\br_gametypes::isfeatureenabled("tabletReplace")) {
        thread tabletreplace(hiddentablets);
        return;
    }
    thread delayedshowtablets(hiddentablets);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f9a
// Size: 0x45
function setobjectivetypesomvarbit(type) {
    index = getquestindex(type);
    assertex(index < 32, "Quest type " + type + " has index >= 32");
    setomnvarbit("ui_br_objective_types", index, 1);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fe7
// Size: 0xc6
function tabletreplace(hiddentablets) {
    if (!isdefined(level.br_level)) {
        return;
    }
    scripts\mp\flags::gameflagwait("prematch_done");
    hiddentablets = array_randomize(hiddentablets);
    var_fb4145cf6a25541e = 0;
    var_40fb495a4451d505 = level.tabletreplacefrequency;
    for (i = 0; i < hiddentablets.size; i++) {
        tablet = hiddentablets[i];
        level waittill("quest_started");
        if (isdefined(level.tabletreplacefrequency) && level.tabletreplacefrequency != -1) {
            var_fb4145cf6a25541e++;
            if (var_fb4145cf6a25541e >= var_40fb495a4451d505) {
                tablet tabletshow();
                var_40fb495a4451d505 += level.tabletreplacefrequency;
                i++;
            }
            continue;
        }
        tablet tabletshow();
    }
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20b5
// Size: 0x230
function delayedshowtablets(hiddentablets) {
    if (!isdefined(level.br_level)) {
        return;
    }
    lastcircle = level.br_level.br_circledelaytimes.size - 1 - getdvarint(@"hash_96878da693689ccd", 4);
    showpercent = getdvarfloat(@"hash_743253d28cd0d1f7", 0.3);
    scripts\mp\flags::gameflagwait("prematch_done");
    validtablets = [];
    for (i = 0; i < hiddentablets.size; i++) {
        tablet = hiddentablets[i];
        tablet.circleindex = scripts\mp\gametypes\br_circle::getcircleindexforpoint(tablet.origin);
        if (tablet.circleindex >= 0) {
            validtablets[validtablets.size] = tablet;
        }
    }
    hiddentablets = array_randomize(validtablets);
    while (true) {
        level waittill("br_circle_set");
        if (!level.br_circle.circleindex) {
            scripts\mp\gametypes\br_analytics::branalytics_delayedshowtablets(0, showpercent, validtablets.size, 0);
            continue;
        }
        validtablets = [];
        for (i = 0; i < hiddentablets.size; i++) {
            tablet = hiddentablets[i];
            if (tablet.circleindex >= level.br_circle.circleindex) {
                validtablets[validtablets.size] = tablet;
            }
        }
        showcount = int(ceil(validtablets.size * showpercent));
        var_cf6dc40ca9d1b393 = int(max(0, getdvarint(@"hash_6cd10c5d6e2a6220", 100) - level.questinfo.activetablets.size));
        showcount = int(min(showcount, var_cf6dc40ca9d1b393));
        for (i = 0; i < showcount; i++) {
            tablet = validtablets[i];
            tablet tabletshow();
        }
        hiddentablets = [];
        for (i = showcount; i < validtablets.size; i++) {
            hiddentablets[hiddentablets.size] = validtablets[i];
        }
        scripts\mp\gametypes\br_analytics::branalytics_delayedshowtablets(level.br_circle.circleindex, showpercent, validtablets.size, showcount);
        if (level.br_circle.circleindex >= lastcircle) {
            break;
        }
    }
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22ed
// Size: 0xcc
function disablealltablets() {
    foreach (type, info in level.questinfo.tabletinfo) {
        tablets = getlootscriptablearray(getlootname(type));
        if (info.enabled) {
            foreach (tablet in tablets) {
                tablet tablethide();
            }
        }
    }
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23c1
// Size: 0xa
function tablethide() {
    thread _tablethide();
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23d3
// Size: 0x1d
function _tablethide() {
    self endon("show");
    scripts\mp\flags::gameflagwait("prematch_done");
    scripts\mp\gametypes\br_pickups::loothide(self);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23f8
// Size: 0xbe
function tabletshow() {
    assert(isdefined(self.init));
    self notify("show");
    part = self.type;
    self setscriptablepartstate(part, "visible");
    level.questinfo.activetablets["" + self.index] = self;
    scripts\mp\gametypes\br_analytics::branalytics_spawntablet(self);
    /#
        level.questinfo.debuginfo.var_9db1e36a47913241[self.tablettype]++;
        level.questinfo.debuginfo.var_2f8e8ca203d36b1d[self.tablettype]++;
    #/
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24be
// Size: 0x84
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
            scripts\mp\gametypes\br_analytics::branalytics_invalidtablet(self);
        }
    }
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x254a
// Size: 0x86
function onquesttablethide(instance) {
    if (isdefined(level.questinfo.activetablets["" + instance.index])) {
        /#
            level.questinfo.debuginfo.var_9db1e36a47913241[instance.tablettype]--;
        #/
        level.questinfo.activetablets["" + instance.index] = undefined;
    }
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25d8
// Size: 0x5f
function activatetablet(instance) {
    /#
        level.questinfo.debuginfo.var_9db1e36a47913241[instance.tablettype]++;
    #/
    level.questinfo.activetablets["" + instance.index] = instance;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x263f
// Size: 0x40
function getlootname(category) {
    lootname = "brloot_" + category + "_tablet";
    if (getdvarint(@"hash_39c3947a2e4f5f9e") != 0) {
        lootname += "_mgl";
    }
    return lootname;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2688
// Size: 0xa8
function registerteamonquest(team, player) {
    /#
        function_132b6261e829fa9c();
    #/
    scripts\mp\gametypes\br_analytics::branalytics_missionstart(self, player);
    level.questinfo.teamsonquests = array_add(level.questinfo.teamsonquests, team);
    if (!isdefined(level.questinfo.maxperkbonustier)) {
        level.questinfo.maxperkbonustier = [];
    }
    level.questinfo.maxperkbonustier[team] = getquestperkbonus(team, 1);
    level notify("quest_started", team);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2738
// Size: 0x45d
function releaseteamonquest(team) {
    assertex(array_contains(level.questinfo.teamsonquests, team), "releaseTeamOnQuest called for unregistered team '" + team + "'");
    /#
        function_132b6261e829fa9c();
    #/
    if (isdefined(level.questinfo.maxperkbonustier)) {
        level.questinfo.maxperkbonustier[team] = undefined;
    }
    level.questinfo.teamsonquests = array_remove(level.questinfo.teamsonquests, team);
    questtier = getquestrewardtier(team);
    results = [];
    if (isdefined(self.result) && self.result == "success") {
        foreach (player in getteamdata(team, "players")) {
            if (isbot(player) && scripts\mp\gametypes\br_public::istutorial()) {
                continue;
            }
            player.brmissionscompleted = get_int_or_0(player.brmissionscompleted) + 1;
            if (level.var_58adce74179ab9ef) {
                player incpersstat("objectivesCompleted", 1);
                player scripts\mp\gametypes\br_public::updatebrscoreboardstat("missionsCompleted", player getpersstat("objectivesCompleted"));
            } else {
                player scripts\mp\gametypes\br_public::updatebrscoreboardstat("missionsCompleted", player.brmissionscompleted);
            }
            player scripts\mp\utility\stats::incpersstat("contracts", 1);
            if (!isdefined(player.brmissiontypescompleted)) {
                player.brmissiontypescompleted = [];
            }
            player.brmissiontypescompleted[self.questcategory] = get_int_or_0(player.brmissiontypescompleted[self.questcategory]) + 1;
            player scripts\mp\gametypes\br_challenges::challengeevaluator("br_mastery_fiveContracts");
        }
        if (getdvarint(@"hash_82bde055b11e6698", 0)) {
            results = givequestrewardsinstance(team, self.rewardorigin, self.rewardangles, self.rewardscriptable, self.contributingplayers);
        }
    }
    if (isdefined(self.result)) {
        teamresult = ter_op(self.result == "success", 1, 2);
        contractref = self.category;
        foreach (player in scripts\mp\utility\teams::getteamdata(team, "players")) {
            if (isbot(player) && scripts\mp\gametypes\br_public::istutorial()) {
                continue;
            }
            contractid = namespace_1eb3c4e0e28fac71::getquesttableindex(self.category);
            player scripts\cp_mp\challenges::oncontractend(contractid, teamresult == 1, 1);
            player notify("calloutmarkerping_warzoneKillQuestIcon");
        }
        if (isdefined(self.targetteam)) {
            targetresult = ter_op(self.result == "success", 2, 1);
            foreach (player in scripts\mp\utility\teams::getteamdata(self.targetteam, "players")) {
                if (isbot(player) && scripts\mp\gametypes\br_public::istutorial()) {
                    continue;
                }
                contractid = namespace_1eb3c4e0e28fac71::getquesttableindex(self.category);
                player scripts\cp_mp\challenges::oncontractend(contractid, targetresult == 1, 2);
            }
        }
    }
    teamplayers = scripts\mp\utility\teams::getteamdata(team, "players");
    numteamplayers = teamplayers.size;
    scripts\mp\gametypes\br_analytics::branalytics_missionend(self, questtier, results, numteamplayers);
    self notify("questEnded");
    if (isdefined(self.rewardscriptable)) {
        self.rewardscriptable notify("questEnded", team, self.result);
    }
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b9d
// Size: 0x9e
function startteamcontractchallenge(category, var_a705a5a5884ebf9c, team) {
    foreach (player in getteamdata(team, "players")) {
        if (isbot(player) && scripts\mp\gametypes\br_public::istutorial()) {
            continue;
        }
        contractid = namespace_1eb3c4e0e28fac71::getquesttableindex(category);
        player scripts\cp_mp\challenges::oncontractstart(contractid, var_a705a5a5884ebf9c);
    }
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c43
// Size: 0xd2
function takequesttablet(instance) {
    /#
        level.questinfo.debuginfo.tabletsused++;
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
    scripts\mp\gametypes\br_plunder::modify_plunder_itemsinworld("brloot_mission_tablet", -1);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d1d
// Size: 0x1b7
function dangercircletick(var_819edacdacb810e4, dangercircleradius, thresholdradius) {
    if (!isdefined(level.questinfo)) {
        return;
    }
    var_52d59c928eb97c81 = dangercircleradius + thresholdradius;
    foreach (tablet in level.questinfo.activetablets) {
        if (distance2dsquared(var_819edacdacb810e4, tablet.origin) > var_52d59c928eb97c81 * var_52d59c928eb97c81) {
            /#
                level.questinfo.debuginfo.var_7b2f9f2035df4396++;
            #/
            scripts\mp\gametypes\br_pickups::loothide(tablet);
            scripts\mp\gametypes\br_plunder::modify_plunder_itemsinworld("brloot_mission_tablet", -1);
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

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2edc
// Size: 0xa5
function createquestinstance(category, instanceid, missionid, rewardscriptable) {
    instance = spawnstruct();
    /#
        instance.debugtype = "<dev string:x6f>";
    #/
    instance.questcategory = category;
    instance.enabled = 1;
    instance.category = category;
    instance.id = instanceid;
    instance.missionid = "" + missionid;
    instance.rewardscriptable = rewardscriptable;
    instance _assignthinkoffset();
    return instance;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f8a
// Size: 0xe6
function addquestinstance(category, instanceinfo) {
    assertex(isdefined(level.questinfo.quests[category]), "UNDEFINED Quest Type'" + category + "'");
    if (!istrue(level.questinfo.ismanagerthreadthinking)) {
        _initmanagerquestthread();
        level.questinfo thread _questmanagerthread();
    }
    if (!_isquestthreaded(category) && isdefined(level.questinfo.quests[category].numthinkfuncs)) {
        if (_checkforregister(category, "initQuestVars")) {
            level.questinfo.quests[category] _runinitquestvars(category);
        }
        _runaddquestinstance(category, instanceinfo);
        _runaddquestthread(category);
        return;
    }
    _runaddquestinstance(category, instanceinfo);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3078
// Size: 0xdb
function removequestinstance() {
    /#
        function_132b6261e829fa9c();
    #/
    if (istrue(self.removed)) {
        return;
    }
    self.removed = 1;
    category = self.questcategory;
    assertex(isdefined(level.questinfo.quests[category].funcs["removeInstance"]), "UNDEFINED level.questInfo.quests['" + category + "'].funcs['removeInstance']");
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

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x315b
// Size: 0x17
function isquestinstancealocale(instance) {
    return isdefined(instance.subscribedinstances);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x317b
// Size: 0x18
function _initmanagerquestthread() {
    level.questinfo.ismanagerthreadthinking = 1;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x319b
// Size: 0x1f
function _removemanagerquestthread() {
    level notify("end_quest_manager_thread");
    level.questinfo.ismanagerthreadthinking = 0;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31c2
// Size: 0x123
function _questmanagerthread() {
    level endon("game_ended");
    level endon("end_quest_manager_thread");
    for (;;) {
        wait 0.05;
        level.questinfo.thinkindex++;
        foreach (questid in level.questinfo.thinkers) {
            if (!level.questinfo.quests[questid].enabled) {
                continue;
            }
            foreach (instance in level.questinfo.quests[questid].instances) {
                if (instance.enabled) {
                    instance _runquestthinkfunctions(questid);
                }
            }
        }
    }
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32ed
// Size: 0xcf
function _runquestthinkfunctions(questid) {
    /#
        function_132b6261e829fa9c();
    #/
    for (index = 0; index < level.questinfo.quests[questid].numthinkfuncs; index++) {
        if ((level.questinfo.thinkindex - self.thinkoffset + self.firstthink) % level.questinfo.quests[questid].thinkrates[index] == 0) {
            funclabel = "questThink" + index;
            [[ level.questinfo.quests[questid].funcs[funclabel] ]]();
        }
    }
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33c4
// Size: 0x84
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

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3450
// Size: 0x6d
function _registerquestfunc(category, func, funclabel) {
    assertex(isdefined(level.questinfo.quests[category]), "<dev string:x78>" + category + "<dev string:x8e>");
    level.questinfo.quests[category].funcs[funclabel] = func;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34c5
// Size: 0x35
function _checkforregister(category, funclabel) {
    return isdefined(level.questinfo.quests[category].funcs[funclabel]);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3503
// Size: 0x8d
function registerquestcategory(category, var_4c43a06a2d630dfd) {
    enabled = getdvarint(hashcat(@"hash_71622bba3f9292f4", category, "_quest"), var_4c43a06a2d630dfd);
    if (scripts\mp\gametypes\br_gametypes::isfeaturedisabled("missions")) {
        enabled = 0;
    }
    info = spawnstruct();
    info.enabled = enabled;
    level.questinfo.tabletinfo[category] = info;
    if (!enabled) {
        return false;
    }
    _registerquestcategory(category);
    return true;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3599
// Size: 0x13
function registerquestlocale(category) {
    _registerquestcategory(category);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35b4
// Size: 0xed
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

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36a9
// Size: 0x6d
function registerquestcategorytablevalues(category) {
    assert(!isdefined(level.questinfo.tablevalues[category]));
    level.questinfo.tablevalues[category] = spawnstruct();
    level.questinfo.tablevalues[category].index = getquesttableindex(category);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x371e
// Size: 0x43
function registerinitquestvars(category, func) {
    _registerquestfunc(category, func, "initQuestVars");
    level.questinfo.quests[category].hasinitfunc = 1;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3769
// Size: 0x181
function registerquestthink(category, func, thinkrate) {
    assertex(isdefined(category), "<dev string:x78>" + category + "<dev string:x90>");
    assertex(isdefined(func), "<dev string:xa8>" + category + "<dev string:x90>");
    assertex(isdefined(thinkrate), "<dev string:xc8>" + category + "<dev string:x90>");
    if (!isdefined(level.questinfo.quests[category].numthinkfuncs)) {
        level.questinfo.quests[category].numthinkfuncs = 0;
    }
    var_3d29d068e46cb221 = int(thinkrate * 20);
    level.questinfo.quests[category].thinkrates[level.questinfo.quests[category].numthinkfuncs] = var_3d29d068e46cb221;
    funclabel = "questThink" + level.questinfo.quests[category].numthinkfuncs;
    _registerquestfunc(category, func, funclabel);
    level.questinfo.quests[category].numthinkfuncs = level.questinfo.quests[category].numthinkfuncs + 1;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38f2
// Size: 0x21
function registerquestcircletick(category, func) {
    _registerquestfunc(category, func, "circleTick");
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x391b
// Size: 0x21
function registerremovequestinstance(category, func) {
    _registerquestfunc(category, func, "removeInstance");
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3944
// Size: 0x21
function registerclearquestvars(category, func) {
    _registerquestfunc(category, func, "clearQuestVars");
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x396d
// Size: 0x167
function registerplayerfilter(category, var_9e41235ac60933d8, filterindex) {
    assertex(isdefined(level.questinfo.quests[category]), "<dev string:x78>" + category + "<dev string:x8e>");
    assertex(isarray(var_9e41235ac60933d8), "<dev string:xe4>" + category + "<dev string:x8e>");
    if (!isdefined(level.questinfo.quests[category].filters)) {
        level.questinfo.quests[category].filters = [];
    }
    if (isdefined(filterindex)) {
        assertex(!isdefined(level.questinfo.quests[category].filters[filterindex]), "Duplicate Filter Registered for '" + category + "' at Index '" + filterindex + "'");
        level.questinfo.quests[category].filters[filterindex] = var_9e41235ac60933d8;
        return;
    }
    count = level.questinfo.quests[category].filters.size;
    level.questinfo.quests[category].filters[count] = var_9e41235ac60933d8;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3adc
// Size: 0x21
function registeronplayerkilled(category, func) {
    _registerquestfunc(category, func, "onPlayerKilled");
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b05
// Size: 0x21
function registeronplayerdisconnect(category, func) {
    _registerquestfunc(category, func, "onPlayerDisconnect");
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b2e
// Size: 0x21
function registeronentergulag(category, func) {
    _registerquestfunc(category, func, "onEnterGulag");
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b57
// Size: 0x21
function registeronrespawn(category, func) {
    _registerquestfunc(category, func, "onRespawn");
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b80
// Size: 0x21
function registerontimerupdate(category, func) {
    _registerquestfunc(category, func, "onTimerUpdate");
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ba9
// Size: 0x21
function registerontimerexpired(category, func) {
    _registerquestfunc(category, func, "onTimerExpired");
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bd2
// Size: 0x21
function registertabletinit(category, func) {
    _registerquestfunc(category, func, "tabletInit");
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3bfb
// Size: 0x17
function _clearregisters(category) {
    var_1f8f4a275423b76c = [];
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c1a
// Size: 0xf5
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

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d17
// Size: 0x4d
function onplayerconnect(player) {
    if (!isdefined(player.team) || !isdefined(level.questinfo)) {
        return;
    }
    setquestrewardtier(player.team, getquestrewardtier(player.team));
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d6c
// Size: 0xeb
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

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e5f
// Size: 0xeb
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

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f52
// Size: 0xfc
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

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4056
// Size: 0x33
function _runinitquestvars(category) {
    [[ level.questinfo.quests[category].funcs["initQuestVars"] ]]();
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4091
// Size: 0x105
function _runaddquestthread(category) {
    if (!_isquestthreaded(category)) {
        /#
            for (index = 0; index < level.questinfo.quests[category].numthinkfuncs; index++) {
                assertex(isdefined(level.questinfo.quests[category].funcs["<dev string:x11b>" + index]), "<dev string:x126>" + category + "<dev string:x149>" + index + "<dev string:x15e>");
            }
        #/
        count = level.questinfo.thinkers.size;
        level.questinfo.thinkers[count] = category;
        level.questinfo.quests[category].enabled = 1;
        return;
    }
    println("<dev string:x161>" + category + "<dev string:x179>");
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x419e
// Size: 0x40
function _runaddquestinstance(category, instanceinfo) {
    level.questinfo.quests[category].instances[instanceinfo.id] = instanceinfo;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41e6
// Size: 0x65
function _runremovequestinstance(category) {
    self [[ level.questinfo.quests[category].funcs["removeInstance"] ]]();
    self notify("removed");
    level.questinfo.quests[category].instances[self.id] = undefined;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4253
// Size: 0x82
function _runclearquestvars(category) {
    [[ level.questinfo.quests[category].funcs["clearQuestVars"] ]]();
    level.questinfo.thinkers = array_remove(level.questinfo.thinkers, category);
    level.questinfo.quests[category].enabled = 0;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42dd
// Size: 0x2c
function _isquestthreaded(category) {
    if (array_contains(level.questinfo.thinkers, category)) {
        return true;
    }
    return false;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4312
// Size: 0x50
function _questinstancesactive(category) {
    if (isdefined(level.questinfo.quests[category].instances)) {
        return level.questinfo.quests[category].instances.size;
    }
    return 0;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x436b
// Size: 0x2f
function _questthreadsactive() {
    if (isdefined(level.questinfo.thinkers)) {
        return level.questinfo.thinkers.size;
    }
    return 0;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43a3
// Size: 0x75
function createlocaleinstance(category, linkedcategory, instanceid) {
    locale = createquestinstance(category, instanceid, "invalid");
    locale.subscriber_type = linkedcategory;
    getquestdata(linkedcategory).locale_type = category;
    locale.subscribedinstances = [];
    /#
        locale.debugtype = "<dev string:x18a>";
    #/
    return locale;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4421
// Size: 0x21
function registercreatequestlocale(category, func) {
    _registerquestfunc(category, func, "create_locale");
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x444a
// Size: 0x21
function registermovequestlocale(category, func) {
    _registerquestfunc(category, func, "move_locale");
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4473
// Size: 0x21
function registercheckiflocaleisavailable(category, func) {
    _registerquestfunc(category, func, "check_available");
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x449c
// Size: 0x23a
function _determinelocationarray(search_params) {
    assertex(isdefined(search_params.searchfunc), "_determineLocationArray : search_params.searchFunc is undefined");
    switch (search_params.searchfunc) {
    case #"hash_499717c03903e17b": 
        return getentitylessscriptablearray(search_params.itemname, "classname", search_params.searchcircleorigin, search_params.searchradiusmax);
    case #"hash_e77c846975579748": 
        var_6206d739138b8be8 = getunusedlootcachepoints(search_params.searchcircleorigin, search_params.searchradiusmax, 0, 1);
        return var_6206d739138b8be8;
    case #"hash_54890ab858a5b8d7": 
        return getquestpoints(search_params.questtypes, search_params.searchcircleorigin, search_params.searchradiusmax, 0, 1);
    case #"hash_f657de26aeb66a7": 
        allkiosks = scripts\mp\gametypes\br_armory_kiosk::getallspawninstances();
        activekiosks = [];
        foreach (kiosk in level.br_armory_kiosk.scriptables) {
            if (!istrue(kiosk.disabled)) {
                activekiosks[activekiosks.size] = kiosk;
            }
        }
        return activekiosks;
    case #"hash_6cde8a1344819cc": 
        if (isdefined(level.br_plunder_sites)) {
            var_b86aa807b6cf37e3 = scripts\mp\gametypes\br_plunder::getplunderextractionsites();
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
        }
    default: 
        assertex(0, "_determineLocationArray : search_params.searchFunc has an invalid value");
        break;
    }
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46de
// Size: 0x339
function _findnewlocaleplacement(var_2aab8569152edfac, search_params) {
    var_2aab8569152edfac = array_randomize(var_2aab8569152edfac);
    if (!isdefined(search_params.mintime)) {
        search_params.mintime = 0;
    }
    if (!isdefined(search_params.travelspeed)) {
        search_params.travelspeed = 190;
    }
    checkideal = isdefined(search_params.searchradiusidealmax) && isdefined(search_params.searchradiusidealmin);
    if (istrue(search_params.searchforcecirclecenter)) {
        centertime = scripts\mp\gametypes\br_circle::getmintimetillpointindangercircle(search_params.searchcircleorigin);
    } else {
        centertime = 0;
    }
    debug = spawnstruct();
    /#
        debug.centertime = centertime;
        debug.forceclosest = getdvarint(@"hash_fb5e59c5e6515a4b", 0);
    #/
    bestlocindex = undefined;
    var_be0f4d48fa40793f = search_params.searchradiusmax;
    foreach (i, loc in var_2aab8569152edfac) {
        dist = distance2d(loc.origin, search_params.searchcircleorigin);
        /#
            debug.dist[i] = dist;
            if (debug.forceclosest) {
                if (dist < var_be0f4d48fa40793f) {
                    bestlocindex = i;
                    var_be0f4d48fa40793f = dist;
                }
                continue;
            }
        #/
        if (dist < search_params.searchradiusmin) {
            continue;
        }
        seconds = scripts\mp\gametypes\br_circle::getmintimetillpointindangercircle(loc.origin);
        if (!level.br_circle_disabled && seconds >= 0) {
            /#
                debug.circletime[i] = seconds;
            #/
            if (seconds < centertime) {
                continue;
            }
            if (search_params.travelspeed > 0) {
                traveltime = dist / search_params.travelspeed;
                /#
                    debug.traveltime[i] = traveltime;
                #/
                seconds -= traveltime;
            }
            if (seconds < search_params.mintime) {
                continue;
            }
        }
        /#
            debug.var_9f896722b457f938[i] = 0;
        #/
        if (checkideal) {
            if (dist < search_params.searchradiusidealmax) {
                if (dist >= search_params.searchradiusidealmin) {
                    /#
                        debug.var_9f896722b457f938[i] = 1;
                    #/
                    var_5435995e95681b89 = 0;
                } else {
                    var_5435995e95681b89 = search_params.searchradiusidealmin - dist;
                }
            } else {
                var_5435995e95681b89 = dist - search_params.searchradiusidealmax;
            }
            if (var_5435995e95681b89 < var_be0f4d48fa40793f) {
                var_be0f4d48fa40793f = var_5435995e95681b89;
                bestlocindex = i;
                if (var_5435995e95681b89 <= 0) {
                    break;
                }
            }
            continue;
        }
        bestlocindex = i;
    }
    /#
        thread function_f42fbf313ebaec27(var_2aab8569152edfac, bestlocindex, search_params, debug);
    #/
    bestloc = undefined;
    if (isdefined(bestlocindex)) {
        bestloc = var_2aab8569152edfac[bestlocindex];
    } else {
        /#
            thread function_3c30c102ba44ec57(var_2aab8569152edfac, bestlocindex, search_params, debug);
        #/
    }
    return bestloc;
}

/#

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 4, eflags: 0x0
    // Checksum 0x0, Offset: 0x4a20
    // Size: 0x5e
    function function_f42fbf313ebaec27(var_2aab8569152edfac, bestlocindex, search_params, debuginfo) {
        dvar = @"hash_b88af237972348e6";
        dvar_default = 0;
        if (!getdvarint(dvar, dvar_default)) {
            return;
        }
        function_a3db3d7f49e8c9(dvar, dvar_default, var_2aab8569152edfac, bestlocindex, search_params, debuginfo);
    }

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 5, eflags: 0x0
    // Checksum 0x0, Offset: 0x4a86
    // Size: 0x142
    function function_3c30c102ba44ec57(var_2aab8569152edfac, bestlocindex, search_params, debuginfo, failindex) {
        dvar = @"hash_b4cb045fde16721f";
        dvar_default = -2;
        var_3df45bd0d60106a4 = -1;
        failindex = level.questinfo.debuginfo.var_a001e7b664eaee73;
        level.questinfo.debuginfo.var_a001e7b664eaee73++;
        while (true) {
            while (true) {
                dvarvalue = getdvarint(dvar, dvar_default);
                if (dvarvalue == var_3df45bd0d60106a4) {
                    line(search_params.searchcircleorigin, search_params.searchcircleorigin + (0, 0, 5000), (1, 0, 0));
                    debugstar(search_params.searchcircleorigin, (1, 0, 0), 1, "<dev string:x191>" + failindex);
                    waitframe();
                    continue;
                }
                if (dvarvalue == failindex) {
                    break;
                }
                wait 0.2;
            }
            function_a3db3d7f49e8c9(dvar, failindex, var_2aab8569152edfac, bestlocindex, search_params, debuginfo);
        }
    }

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 6, eflags: 0x0
    // Checksum 0x0, Offset: 0x4bd0
    // Size: 0x4b3
    function function_a3db3d7f49e8c9(dvar, dvarvalue, var_2aab8569152edfac, bestlocindex, search_params, debuginfo) {
        if (!isdefined(debuginfo.dist)) {
            debuginfo.dist = [];
        }
        if (!isdefined(debuginfo.circletime)) {
            debuginfo.circletime = [];
        }
        if (!isdefined(debuginfo.traveltime)) {
            debuginfo.traveltime = [];
        }
        if (!isdefined(debuginfo.var_9f896722b457f938)) {
            debuginfo.var_9f896722b457f938 = [];
        }
        level notify("<dev string:x192>");
        level endon("<dev string:x192>");
        red = (1, 0, 0);
        yellow = (1, 1, 0);
        green = (0, 1, 0);
        light_green = (0.5, 1, 0.5);
        blue = (0, 0, 1);
        white = (1, 1, 1);
        print3doffset = (0, 0, 15);
        while (getdvarint(dvar) == dvarvalue) {
            sphere(search_params.searchcircleorigin, 10, yellow);
            print3d(search_params.searchcircleorigin, "<dev string:x1ae>" + var_2aab8569152edfac.size + "<dev string:x1b6>" + debuginfo.centertime, white, 1, 1, 1, 1);
            if (!isdefined(bestlocindex)) {
                print3d(search_params.searchcircleorigin + print3doffset, "<dev string:x1be>", red, 1, 1, 1, 1);
            }
            scripts\engine\utility::draw_circle(search_params.searchcircleorigin, search_params.searchradiusmin, green, 1, 0, 0);
            scripts\engine\utility::draw_circle(search_params.searchcircleorigin, search_params.searchradiusmax, red, 1, 0, 0);
            if (isdefined(search_params.searchradiusidealmin)) {
                scripts\engine\utility::draw_circle(search_params.searchcircleorigin, search_params.searchradiusidealmin, yellow, 1, 0, 0);
            }
            if (isdefined(search_params.searchradiusidealmax)) {
                scripts\engine\utility::draw_circle(search_params.searchcircleorigin, search_params.searchradiusidealmax, yellow, 1, 0, 0);
            }
            foreach (i, loc in var_2aab8569152edfac) {
                checked = isdefined(debuginfo.dist[i]);
                if (isdefined(bestlocindex) && i == bestlocindex) {
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
                    if (dist <= search_params.searchradiusmin) {
                        color = red;
                        colordist = red;
                    } else {
                        color = green;
                        colordist = green;
                    }
                    if (istrue(debuginfo.var_9f896722b457f938[i])) {
                        colordist = yellow;
                    }
                    printorigin = loc.origin;
                    print3d(printorigin, "<dev string:x1d0>" + debuginfo.dist[i], colordist, 1, 1, 1, 1);
                    printorigin += print3doffset;
                    circletime = debuginfo.circletime[i];
                    if (isdefined(circletime)) {
                        str = "<dev string:x1d7>" + circletime;
                        traveltime = debuginfo.traveltime[i];
                        if (!isdefined(traveltime)) {
                            traveltime = 0;
                        }
                        str = "<dev string:x191>" + circletime + "<dev string:x1e4>" + traveltime;
                        if (circletime - traveltime < search_params.mintime) {
                            color = red;
                            str += "<dev string:x1e8>";
                        } else {
                            color = green;
                            str += "<dev string:x1ec>";
                        }
                        str += search_params.mintime;
                        print3d(printorigin, str, color, 1, 1, 1, 1);
                    }
                }
            }
            waitframe();
        }
    }

#/

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x508b
// Size: 0xa9
function _runcreatequestlocale(category, params) {
    /#
        function_d2caa40694d469ab();
    #/
    if (isdefined(params)) {
        locale = self [[ level.questinfo.quests[category].funcs["create_locale"] ]](params);
    } else {
        locale = self [[ level.questinfo.quests[category].funcs["create_locale"] ]]();
    }
    assertex(isdefined(locale.curorigin), "<dev string:x1f1>" + category + "<dev string:x20b>");
    return locale;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x513d
// Size: 0x78
function _runmovequestlocale(category, params) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    if (isdefined(params)) {
        self [[ level.questinfo.quests[category].funcs["move_locale"] ]](params);
        return;
    }
    self [[ level.questinfo.quests[category].funcs["move_locale"] ]]();
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51bd
// Size: 0x33
function _runcheckiflocaleisavailable(category) {
    return self [[ level.questinfo.quests[category].funcs["check_available"] ]]();
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51f9
// Size: 0xfb
function _findexisitingquestlocale(category, search_params) {
    assertex(isdefined(search_params.searchcircleorigin), "_findExisitingQuestLocale for '" + category + "' is missing parameter search_params.searchCircleOrigin");
    questdata = getquestdata(category);
    if (!isdefined(questdata) || !isdefined(questdata.instances)) {
        return undefined;
    }
    foreach (instance in questdata.instances) {
        dist = distance2d(search_params.searchcircleorigin, instance.curorigin);
        if (dist > search_params.searchradiusmax) {
            continue;
        }
        if (!instance _runcheckiflocaleisavailable(category)) {
            continue;
        }
        return instance;
    }
    return undefined;
}

/#

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x52fd
    // Size: 0x96
    function function_58f2ed57b8b8a4a5(category, search_params) {
        assertex(isdefined(search_params.searchcircleorigin), "<dev string:x233>" + category + "<dev string:x249>");
        assertex(isdefined(search_params.searchradiusmax), "<dev string:x233>" + category + "<dev string:x281>");
        assertex(isdefined(search_params.searchradiusmin), "<dev string:x233>" + category + "<dev string:x2b6>");
        assertex(isdefined(search_params.searchfunc), "<dev string:x2eb>");
    }

#/

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x539b
// Size: 0x64
function findquestplacement(category, search_params) {
    /#
        function_58f2ed57b8b8a4a5(category, search_params);
    #/
    if (isdefined(search_params.reservedplacement)) {
        placement = search_params.reservedplacement;
    } else {
        var_2aab8569152edfac = _determinelocationarray(search_params);
        placement = _findnewlocaleplacement(var_2aab8569152edfac, search_params);
    }
    return placement;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5408
// Size: 0x7a
function requestquestlocale(category, search_params, ignoreexisting) {
    /#
        function_d2caa40694d469ab();
        function_58f2ed57b8b8a4a5(category, search_params);
    #/
    locale = undefined;
    if (!isdefined(ignoreexisting) || !ignoreexisting) {
        locale = _findexisitingquestlocale(category, search_params);
    }
    if (!isdefined(locale)) {
        placement = findquestplacement(category, search_params);
        locale = _runcreatequestlocale(category, placement);
    }
    subscribetoquestlocale(locale);
    return locale;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x548b
// Size: 0x3d
function subscribetoquestlocale(locale) {
    /#
        function_d2caa40694d469ab();
    #/
    self.subscribedlocale = locale;
    locale.subscribedinstances = array_add(locale.subscribedinstances, self);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54d0
// Size: 0x39
function movequestlocale(category, search_params) {
    /#
        function_8b0829a8ce24f0aa();
    #/
    placement = findquestplacement(category, search_params);
    _runmovequestlocale(category, placement);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5511
// Size: 0x7b
function leavequestlocale() {
    /#
        function_d2caa40694d469ab();
    #/
    localetype = getquestdata(self.questcategory).locale_type;
    locale = self.subscribedlocale;
    locale.subscribedinstances = array_remove(locale.subscribedinstances, self);
    if (locale.subscribedinstances.size <= 0) {
        locale removequestinstance();
    }
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5594
// Size: 0x48
function getquestdata(category) {
    if (!isdefined(level.questinfo) || !isdefined(level.questinfo.quests)) {
        return undefined;
    }
    return level.questinfo.quests[category];
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55e5
// Size: 0x34
function getquestinstancedata(category, instancekey) {
    return level.questinfo.quests[category].instances[instancekey];
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5622
// Size: 0x6a
function getquestinstancedatasafe(category, instancekey) {
    instance = undefined;
    if (isdefined(level.questinfo) && isdefined(level.questinfo.quests[category])) {
        instance = level.questinfo.quests[category].instances[instancekey];
    }
    return instance;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5695
// Size: 0x3c
function checkforinstance(category, instanceid) {
    if (isdefined(level.questinfo.quests[category].instances[instanceid])) {
        return true;
    }
    return false;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56da
// Size: 0x113
function _validateplayerfilter(filterkey) {
    if (isdefined(filterkey)) {
        if (isint(filterkey)) {
            /#
                function_132b6261e829fa9c();
            #/
            assertex(isdefined(level.questinfo.quests[self.questcategory].filters[filterkey]));
            return level.questinfo.quests[self.questcategory].filters[filterkey];
        }
        if (isarray(filterkey)) {
            return filterkey;
        }
        assertex(0, "Invalid Parameter used in Player Filter Function");
        return;
    }
    if (isdefined(level.questinfo.quests[self.questcategory].filters)) {
        /#
            function_132b6261e829fa9c();
        #/
        return level.questinfo.quests[self.questcategory].filters[0];
    }
    return level.questinfo.defaultfilter;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57f5
// Size: 0x63
function _validateplayer(player, filter) {
    foreach (condition in filter) {
        if (![[ condition ]](player)) {
            return false;
        }
    }
    return true;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5861
// Size: 0x2d
function isplayervalid(player, filterkey) {
    filter = _validateplayerfilter(filterkey);
    return _validateplayer(player, filter);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5897
// Size: 0x84
function isteamvalid(team, filterkey) {
    filter = _validateplayerfilter(filterkey);
    foreach (player in getteamdata(team, "players")) {
        if (_validateplayer(player, filter)) {
            return true;
        }
    }
    return false;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5924
// Size: 0x84
function isentireteamvalid(team, filterkey) {
    filter = _validateplayerfilter(filterkey);
    foreach (player in getteamdata(team, "players")) {
        if (!_validateplayer(player, filter)) {
            return false;
        }
    }
    return true;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59b1
// Size: 0x94
function getvalidplayersinteam(team, filterkey) {
    filter = _validateplayerfilter(filterkey);
    players = [];
    foreach (player in getteamdata(team, "players")) {
        if (_validateplayer(player, filter)) {
            players[players.size] = player;
        }
    }
    return players;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a4e
// Size: 0x89
function getvalidplayersinarray(group, filterkey) {
    filter = _validateplayerfilter(filterkey);
    players = [];
    foreach (player in group) {
        if (_validateplayer(player, filter)) {
            players[players.size] = player;
        }
    }
    return players;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ae0
// Size: 0xbc
function sortvalidplayersinarray(group, filterkey) {
    filter = _validateplayerfilter(filterkey);
    players = [];
    players["valid"] = [];
    players["invalid"] = [];
    foreach (player in group) {
        if (_validateplayer(player, filter)) {
            players["valid"][players["valid"].size] = player;
            continue;
        }
        players["invalid"][players["invalid"].size] = player;
    }
    return players;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ba5
// Size: 0xa3
function getteamcenter(team, filter) {
    center = (0, 0, 0);
    validplayers = getvalidplayersinteam(team, filter);
    if (validplayers.size <= 0) {
        return center;
    }
    foreach (player in validplayers) {
        center += player.origin;
    }
    center /= validplayers.size;
    return center;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c51
// Size: 0x18
function filtercondition_isdead(player) {
    if (!isalive(player)) {
        return false;
    }
    return true;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c72
// Size: 0x1e
function filtercondition_isdowned(player) {
    if (istrue(player.inlaststand)) {
        return false;
    }
    return true;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c99
// Size: 0x19
function filtercondition_ingulag(player) {
    if (player scripts\mp\gametypes\br_public::isplayerinorgoingtogulag()) {
        return false;
    }
    return true;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5cbb
// Size: 0x1e
function filtercondition_hasbeeningulag(player) {
    if (isdefined(player.gulag)) {
        return false;
    }
    return true;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ce2
// Size: 0xa8
function packsplashparambits(missionid, rewardtier, rewardindex, unlockableindex) {
    if (!isdefined(rewardindex)) {
        rewardindex = 0;
    }
    if (!isdefined(unlockableindex)) {
        unlockableindex = 0;
    }
    assert(missionid >= 0 && missionid < 32);
    assert(rewardtier >= 0 && rewardtier < 32);
    assert(rewardindex >= 0 && rewardindex < 64);
    assert(unlockableindex >= 0 && unlockableindex < 8);
    value = unlockableindex;
    value = value << 6 | rewardindex;
    value = value << 5 | rewardtier;
    value = value << 5 | missionid;
    return value;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d93
// Size: 0x4e
function displayteamsplash(team, splash_key, params) {
    assertex(isdefined(splash_key), "No splash_key defined for message being displayed to '" + team);
    players = getteamdata(team, "players");
    displaysplashtoplayers(players, splash_key, params);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5de9
// Size: 0xc9
function displaysplashtoplayers(players, splash_key, params) {
    assertex(isdefined(splash_key), "No splash_key defined for message being displayed");
    foreach (player in players) {
        if (player scripts\mp\gametypes\br_public::isplayeringulag()) {
            continue;
        }
        if (isbot(player) && scripts\mp\gametypes\br_public::istutorial()) {
            continue;
        }
        if (isdefined(params)) {
            if (isdefined(params.excludedplayers)) {
                if (array_contains(params.excludedplayers, player)) {
                    continue;
                }
            }
        }
        displayplayersplash(player, splash_key, params);
    }
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5eba
// Size: 0xab
function displayplayersplash(player, splash_key, params) {
    if (getsubgametype() == "champion") {
        return;
    }
    assertex(isdefined(splash_key), "No splash_key defined for message being displayed to '" + player.name);
    if (isdefined(params) && isdefined(params.packedbits)) {
        player thread scripts\mp\hud_message::showsplash(splash_key, params.packedbits);
        return;
    }
    if (isdefined(params) && isdefined(params.intvar)) {
        player thread scripts\mp\hud_message::showsplash(splash_key, params.intvar);
        return;
    }
    player thread scripts\mp\hud_message::showsplash(splash_key);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f6d
// Size: 0x17c
function displaysplashtoplayersinradius(splash_key, origin, radius, player_filter, params) {
    maxdist2rd = radius * radius;
    newarray = [];
    foreach (player in level.players) {
        dist2rd = distancesquared(origin, player.origin);
        if (dist2rd > maxdist2rd) {
            continue;
        }
        if (isdefined(params.excludedteams) && array_contains(params.excludedteams, player.team)) {
            continue;
        }
        if (isdefined(params.excludedplayers) && array_contains(params.excludedplayers, player)) {
            continue;
        }
        if (!isplayervalid(player, player_filter)) {
            continue;
        }
        newarray[newarray.size] = player;
    }
    if (newarray.size > 0) {
        foreach (player in newarray) {
            displayplayersplash(player, splash_key, params);
        }
    }
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60f1
// Size: 0x6a
function displaysquadmessagetoplayer(player_ref, state, missionid) {
    player = player_ref getentitynumber();
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

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6163
// Size: 0x7f
function displaysquadmessagetoteam(team, player_ref, state, missionid) {
    foreach (player in getteamdata(team, "players")) {
        player displaysquadmessagetoplayer(player_ref, state, missionid);
    }
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x61ea
// Size: 0x1d
function giveplayerpoints(player, ref) {
    player thread scripts\mp\utility\points::doScoreEvent(ref);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x620f
// Size: 0x7d
function giveteampoints(team, ref) {
    if (getsubgametype() == "champion") {
        return;
    }
    foreach (player in getteamdata(team, "players")) {
        player thread scripts\mp\utility\points::doScoreEvent(ref);
    }
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6294
// Size: 0x3d
function calldropbag(player, location) {
    var_b29198c6c1093a6b = scripts\mp\gametypes\br_rewards::getdropbagspawntypeenum(0, 0, 0, 1, 0, 0);
    player scripts\mp\gametypes\br_rewards::spawndropbagatposition(var_b29198c6c1093a6b);
    level thread scripts\mp\gametypes\br_rewards::managedropbags();
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62d9
// Size: 0x134
function giveteamplunderflat(team, amount, var_6463a610d995bab9) {
    var_8e3c5f90e4f80a58 = getdvarfloat(@"hash_7165dad703502609", 0.4);
    var_2cefa8f8a2ba6bfe = 0;
    foreach (player in getteamdata(team, "players")) {
        if (isbot(player) && scripts\mp\gametypes\br_public::istutorial()) {
            continue;
        }
        var_36773a58eb035bff = amount;
        if (!isreallyalive(player) && isdefined(var_6463a610d995bab9)) {
            var_36773a58eb035bff = int(amount * var_8e3c5f90e4f80a58);
        } else {
            var_36773a58eb035bff = int(var_36773a58eb035bff * function_fd4c76c90a1a0333(player));
        }
        player scripts\mp\gametypes\br_plunder::playerplunderpickup(var_36773a58eb035bff);
        level.br_plunder.plunder_awarded_by_missions_total += var_36773a58eb035bff;
        scripts\mp\gametypes\br_analytics::trackcashevent(player, "mission", var_36773a58eb035bff);
        player scripts\mp\gametypes\br_plunder::function_5a2284274d70f7d(1, var_36773a58eb035bff);
    }
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6415
// Size: 0xe8
function giveteamplunderdistributive(players, amount) {
    amountperplayer = int(amount / players.size);
    foreach (player in players) {
        if (isbot(player) && scripts\mp\gametypes\br_public::istutorial()) {
            continue;
        }
        var_18417c862feb0b9e = int(amountperplayer * function_fd4c76c90a1a0333(player));
        player scripts\mp\gametypes\br_plunder::playerplunderpickup(var_18417c862feb0b9e);
        level.br_plunder.plunder_awarded_by_missions_total += var_18417c862feb0b9e;
        scripts\mp\gametypes\br_analytics::trackcashevent(player, "mission", var_18417c862feb0b9e);
        player scripts\mp\gametypes\br_plunder::function_5a2284274d70f7d(1, var_18417c862feb0b9e);
    }
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x6505
// Size: 0x314
function dropplunder(amount, var_5b7bf3433d244cdf, var_76212928fed46301, var_41271de03a84a690) {
    if (!istrue(level.br_plunder_enabled)) {
        return;
    }
    info_name = 0;
    info_scale = 1;
    info_percent = 2;
    var_82c3fc1e774a5a35[0] = ["brloot_plunder_cash_uncommon_3", level.br_plunder.quantityepic, getdvarfloat(@"hash_53dd15287f7df644", 0.2)];
    var_82c3fc1e774a5a35[1] = ["brloot_plunder_cash_uncommon_2", level.br_plunder.quantityrare, getdvarfloat(@"hash_8fa17586ac872da9", 0.3)];
    var_82c3fc1e774a5a35[2] = ["brloot_plunder_cash_uncommon_1", level.br_plunder.quantitycommon, getdvarfloat(@"hash_30bf1dd438567db0", 0.5)];
    totalpercent = 0;
    for (i = 0; i < var_82c3fc1e774a5a35.size; i++) {
        info = var_82c3fc1e774a5a35[i];
        totalpercent += info[info_percent];
    }
    plundertotal = 0;
    for (i = 0; i < var_82c3fc1e774a5a35.size; i++) {
        info = var_82c3fc1e774a5a35[i];
        info[info_percent] = info[info_percent] / totalpercent;
        plundertotal += info[info_scale] * info[info_percent];
    }
    numdrops = amount / plundertotal;
    rewardremaining = amount;
    plunderdrops = [];
    for (i = 0; i < var_82c3fc1e774a5a35.size; i++) {
        info = var_82c3fc1e774a5a35[i];
        plunderdrops[i] = int(numdrops * info[info_percent]);
        rewardremaining -= plunderdrops[i] * info[info_scale];
    }
    if (rewardremaining > 0) {
        for (i = 0; i < var_82c3fc1e774a5a35.size; i++) {
            info = var_82c3fc1e774a5a35[i];
            extra = int(rewardremaining / info[info_scale]);
            plunderdrops[i] = plunderdrops[i] + extra;
            rewardremaining -= extra * info[info_scale];
        }
    }
    droptypes = [];
    for (i = 0; i < plunderdrops.size; i++) {
        for (j = 0; j < plunderdrops[i]; j++) {
            droptypes[droptypes.size] = i;
        }
    }
    droptypes = array_randomize(droptypes);
    dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
    for (i = 0; i < droptypes.size; i++) {
        dropinfo = scripts\mp\gametypes\br_pickups::getitemdroporiginandangles(dropstruct, var_5b7bf3433d244cdf, var_76212928fed46301, var_41271de03a84a690);
        scripts\mp\gametypes\br_pickups::spawnpickup(var_82c3fc1e774a5a35[droptypes[i]][info_name], dropinfo, var_82c3fc1e774a5a35[droptypes[i]][info_scale], 1);
    }
    level.br_plunder.plunder_awarded_by_missions_total += amount;
    level thread scripts\mp\gametypes\br_plunder::dropplundersounds(var_5b7bf3433d244cdf, droptypes.size);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6821
// Size: 0x2a
function getquestindex(ref) {
    return level.questinfo.tablevalues[ref].index;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6854
// Size: 0x2a
function getquesttableindex(ref) {
    index = int(tablelookup("mp/brmissions.csv", 1, ref, 0));
    return index;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6887
// Size: 0x34
function uiobjectiveshow(ref) {
    assert(isplayer(self));
    index = getquestindex(ref);
    setquestindexomnvar(index);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68c3
// Size: 0x6c
function uiobjectiveshowtoteam(ref, team) {
    foreach (player in getteamdata(team, "players")) {
        player uiobjectiveshow(ref);
    }
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6937
// Size: 0x19
function uiobjectivehide() {
    assert(isplayer(self));
    setquestindexomnvar(0);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6958
// Size: 0x63
function uiobjectivehidefromteam(team) {
    foreach (player in getteamdata(team, "players")) {
        player uiobjectivehide();
    }
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69c3
// Size: 0x27
function uiobjectivesetparameter(value) {
    assert(isplayer(self));
    self setclientomnvar("ui_br_objective_param", value);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69f2
// Size: 0x27
function uiobjectivesetlootid(value) {
    assert(isplayer(self));
    self setclientomnvar("ui_br_objective_loot_id", value);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a21
// Size: 0xea
function function_fd4c76c90a1a0333(player) {
    mod = 1;
    if (scripts\mp\perks\perks::function_f45c19871b412ea5("specialty_contract_payout")) {
        if (player scripts\mp\utility\perk::_hasperk("specialty_contract_payout")) {
            mod += getdvarfloat(@"hash_cb657adb237d72a2", 0.1);
        } else if (istrue(getdvarint(@"hash_a50815ce2cfbefbc", 0))) {
            foreach (tm in getteamdata(player.team, "players")) {
                if (tm != player && tm scripts\mp\utility\perk::_hasperk("specialty_contract_payout")) {
                    mod += getdvarfloat(@"hash_e4f6ee9301cbf325", 0.1);
                }
            }
        }
    }
    return mod;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b14
// Size: 0xcd
function createquestobjicon(iconref, state, var_38116998df9814d4) {
    self.objectiveiconid = scripts\mp\objidpoolmanager::requestobjectiveid(1);
    if (self.objectiveiconid != -1) {
        scripts\mp\objidpoolmanager::objective_add_objective(self.objectiveiconid, state, (0, 0, 0), iconref);
        scripts\mp\objidpoolmanager::update_objective_setbackground(self.objectiveiconid, 1);
        if (function_fa7bfcc1d68b7b73()) {
            objective_removeallfrommask(self.objectiveiconid);
        }
        objective_showtoplayersinmask(self.objectiveiconid);
        scripts\mp\objidpoolmanager::objective_set_play_intro(self.objectiveiconid, 1);
        if (isdefined(var_38116998df9814d4)) {
            movequestobjicon(var_38116998df9814d4);
        }
        return;
    }
    println(self.category + "<dev string:x32b>");
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6be9
// Size: 0x1c
function movequestobjicon(neworigin) {
    scripts\mp\objidpoolmanager::update_objective_position(self.objectiveiconid, neworigin);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c0d
// Size: 0x1b
function showquestobjicontoplayer(player) {
    objective_addclienttomask(self.objectiveiconid, player);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6c30
// Size: 0x12
function showquestobjicontoall(objid) {
    objective_addalltomask(objid);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c4a
// Size: 0x1b
function hidequestobjiconfromplayer(player) {
    objective_removeclientfrommask(self.objectiveiconid, player);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6c6d
// Size: 0xc
function checkforactiveobjicon() {
    return isdefined(self.objectiveiconid);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c82
// Size: 0x22
function deletequestobjicon() {
    scripts\mp\objidpoolmanager::objective_playermask_hidefromall(self.objectiveiconid);
    scripts\mp\objidpoolmanager::returnobjectiveid(self.objectiveiconid);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6cac
// Size: 0xf7
function utilflare_shootflare(spawn_origin, flaretype) {
    level endon("game_ended");
    content_filter = scripts\engine\trace::create_contents(0, 1, 0, 1, 0, 0, 0);
    new_position = ray_trace(spawn_origin + (0, 0, 4000), spawn_origin, undefined, content_filter, undefined, 1)["position"];
    flare = spawn("script_model", new_position);
    if (!isdefined(flare)) {
        return;
    }
    flare.angles = vectortoangles((0, 0, 1));
    flare setmodel("equip_flare_br");
    wait 0.5;
    flare setscriptablepartstate("launch", "start", 0);
    travelpart = "start";
    if (flaretype == "revive") {
        travelpart = "start_revive";
    }
    flare setscriptablepartstate("travel", travelpart, 0);
    flare thread _utilflare_lerpflare(flaretype);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6dab
// Size: 0x52
function _utilflare_lerpflare(flaretype) {
    self endon("death");
    level endon("game_ended");
    movetime = 3.125;
    self moveto(self.origin + (0, 0, 2500), movetime);
    wait movetime;
    _utilflare_flareexplode(flaretype);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e05
// Size: 0x72
function _utilflare_flareexplode(flaretype) {
    if (!isdefined(flaretype)) {
        flaretype = "<undefined>";
    }
    self setscriptablepartstate("travel", "off", 0);
    if (!_utilflare_isvalidflaretype(flaretype)) {
        assertmsg("util flared called with invalid flare type string '" + flaretype + "'");
        return;
    }
    fxstate = "start_" + flaretype;
    self setscriptablepartstate("explode", fxstate, 0);
    thread sfx_br_flare_phosphorus();
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e7f
// Size: 0x45
function _utilflare_isvalidflaretype(flaretype) {
    var_3ba45e0e07877b7 = 0;
    if (isdefined(flaretype)) {
        switch (flaretype) {
        case #"hash_b06d15a59bd8ea50":
        case #"hash_f4a9126c03d3385b": 
            var_3ba45e0e07877b7 = 1;
            break;
        }
    }
    return var_3ba45e0e07877b7;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ecd
// Size: 0x71
function sfx_br_flare_phosphorus() {
    self endon("death");
    level endon("game_ended");
    self setscriptablepartstate("phosphorus", "start", 0);
    wait 0.3;
    self setscriptablepartstate("phosphorus_loop", "start", 0);
    wait 12;
    self setscriptablepartstate("phosphorus", "end", 0);
    wait 0.3;
    self setscriptablepartstate("phosphorus_loop", "off", 0);
    wait 5;
    self delete();
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f46
// Size: 0x5e
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

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6fad
// Size: 0x4b
function questtimerinit(category, var_3e871b4b1ef67d52) {
    questdata = getquestdata(category);
    questdata.usequesttimer = getdvarint(hashcat(@"hash_71622bba3f9292f4", category, "_enableQuestTime"), var_3e871b4b1ef67d52);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7000
// Size: 0x77
function questtimerset(time, animbuffer) {
    /#
        function_d2caa40694d469ab();
    #/
    if (!isdefined(animbuffer)) {
        animbuffer = 0;
    }
    totaltime = time + animbuffer;
    questdata = getquestdata(self.category);
    if (!questdata.usequesttimer) {
        return;
    }
    self.missiontime = gettime() + totaltime * 1000;
    questtimerupdate();
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x707f
// Size: 0x5d
function questtimeradd(time) {
    /#
        function_d2caa40694d469ab();
    #/
    questdata = getquestdata(self.category);
    if (!questdata.usequesttimer) {
        return;
    }
    self.missiontime += time * 1000;
    questtimerupdate();
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70e4
// Size: 0xc0
function questtimerupdate() {
    /#
        function_d2caa40694d469ab();
    #/
    foreach (player in getteamdata(self.id, "players")) {
        player setclientomnvar("ui_br_objective_countdown_timer", self.missiontime);
    }
    questdata = getquestdata(self.category);
    updatefunc = questdata.funcs["onTimerUpdate"];
    if (isdefined(updatefunc)) {
        [[ updatefunc ]]();
    }
    thread _questtimerwait();
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x71ac
// Size: 0x9e
function _questtimerwait() {
    /#
        function_d2caa40694d469ab();
    #/
    self notify("updateQuestTimer");
    self endon("game_ended");
    self endon("updateQuestTimer");
    self endon("questEnded");
    waittime = (self.missiontime - gettime()) / 1000;
    wait waittime;
    questdata = getquestdata(self.category);
    expiredfunc = questdata.funcs["onTimerExpired"];
    if (isdefined(expiredfunc)) {
        [[ expiredfunc ]]();
    }
    self.result = "timeout";
    thread removequestinstance();
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7252
// Size: 0x4b
function registercontributingplayers(player) {
    if (!isdefined(self.contributingplayers)) {
        self.contributingplayers = [];
    }
    if (!array_contains(self.contributingplayers, player)) {
        self.contributingplayers[self.contributingplayers.size] = player;
    }
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72a5
// Size: 0x2b
function function_8acf00b423dca1e6() {
    if (getdvarint(@"hash_82bde055b11e6698", 0)) {
        return level.questinfo;
    }
    return level.contractmanager;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72d8
// Size: 0xf2
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
        player scripts\mp\gametypes\br_plunder::packextrascore0();
    }
    return givequestrewards(self.questcategory, self.rewardmodifier, self.modifier, team, rewardorigin, rewardangles, rewardscriptable, players);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73d3
// Size: 0x66
function givequestrewards(category, rewardmod, questmod, team, rewardorigin, rewardangles, rewardscriptable, players) {
    group = getquestrewardbuildgroupref(category, rewardmod, questmod);
    return givequestrewardgroup(group, team, rewardorigin, rewardangles, rewardscriptable, players);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7442
// Size: 0x159
function givequestrewardgroup(group, team, rewardorigin, rewardangles, rewardscriptable, players) {
    results = [];
    level.currentrewarddropindex = 0;
    if (!isdefined(players)) {
        players = getteamdata(team, "players");
    }
    if (scripts\mp\gametypes\br_gametypes::isbrgametypefuncdefined("giveQuestRewardGroup")) {
        scripts\mp\gametypes\br_gametypes::runbrgametypefunc6("giveQuestRewardGroup", group, team, rewardorigin, rewardangles, rewardscriptable, players);
    }
    rewards = getquestrewardgroupstablerewards(group);
    foreach (rewardref, scalerref in rewards) {
        var_bfe6b462496edde3 = givequestrewardref(rewardref, scalerref, team, rewardorigin, rewardangles, rewardscriptable, players);
        value = var_bfe6b462496edde3[1];
        reward = var_bfe6b462496edde3[0];
        if (isdefined(results[reward])) {
            if (isstring(results[reward])) {
                results[reward] = results[reward] + "," + value;
            } else {
                results[reward] = results[reward] + value;
            }
            continue;
        }
        results[reward] = value;
    }
    level.currentrewarddropindex = undefined;
    return results;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75a4
// Size: 0xc7
function givequestrewardref(rewardref, scalerref, team, rewardorigin, rewardangles, rewardscriptable, players) {
    tier = getquestrewardtier(team);
    rewardtype = getquestrewardstabletype(rewardref);
    value = getquestrewardstablevalue(rewardref);
    if (!isstring(value)) {
        scale = getquestscalervalue(scalerref, tier);
        if (scale != 1) {
            value *= scale;
            value = castrewardvalue(rewardtype, value);
        }
    }
    value = givequestreward(rewardtype, value, team, rewardorigin, rewardangles, rewardscriptable, players);
    return [rewardtype, value];
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7674
// Size: 0x547
function givequestreward(type, value, team, rewardorigin, rewardangles, rewardscriptable, players) {
    if (scripts\mp\gametypes\br_gametypes::isbrgametypefuncdefined("giveQuestReward")) {
        var_bfe6b362496edbb0 = scripts\mp\gametypes\br_gametypes::function_d72af9ccedfc923b("giveQuestReward", type, value, team, rewardorigin, rewardangles, rewardscriptable, players);
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
            brgametype = scripts\cp_mp\utility\game_utility::function_6c1fce6f6b8779d5();
            if (brgametype != "plunder" && brgametype != "risk" && !participantplunder) {
                giveteamplunderflat(team, value);
            } else if (players.size > 0) {
                if (!scripts\cp_mp\utility\game_utility::function_2d79a7a3b91c4c3e() && scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
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
            rewardplayers = players;
        } else {
            rewardplayers = getteamdata(team, "players");
        }
        foreach (player in rewardplayers) {
            player thread points::doScoreEvent(#"hash_607cd099425b81c7", undefined, undefined, value, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
            weaponxp = int(value * 0.2);
            lastweaponobj = player.lastnormalweaponobj;
            player scripts\mp\gametypes\br::givebrweaponxp(#"", weaponxp, lastweaponobj, 0, 0);
            player.br_contractxpearned = get_int_or_0(player.br_contractxpearned) + value;
        }
        break;
    case #"hash_5c95c522c7b782c2": 
        if (isdefined(rewardscriptable) && istrue(rewardscriptable.participantweaponxp)) {
            rewardplayers = players;
        } else {
            rewardplayers = getteamdata(team, "players");
        }
        foreach (player in rewardplayers) {
            lastweaponobj = player.lastnormalweaponobj;
            player scripts\mp\gametypes\br::givebrweaponxp(#"", value, lastweaponobj, 0, 0);
        }
        break;
    case #"hash_3fcca127b49609dc": 
        brgametype = scripts\cp_mp\utility\game_utility::function_6c1fce6f6b8779d5();
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
        teamplayer = getteamdata(team, "players")[0];
        calldropbag(teamplayer, rewardorigin);
        break;
    case #"hash_5a20d43f09c87c1d": 
        questrewardcirclepeek(team);
        break;
    case #"hash_bee67d6e01f8331f": 
        thread addquestrewardtierframeend(team, value);
        break;
    case #"hash_4938974347fbe589": 
        if (!scripts\cp_mp\utility\game_utility::function_fa7bfcc1d68b7b73()) {
            blueprintextract = scripts\mp\gametypes\br_blueprint_extract_spawn::blueprintextract_trygetreward(rewardorigin);
            if (isdefined(blueprintextract)) {
                scripts\mp\gametypes\br_blueprint_extract_spawn::blueprintextract_beforepickupspawned(team);
                items = [blueprintextract];
                questrewarddropitems(team, items, rewardorigin, rewardangles, 0);
                displayteamsplash(team, "br_blueprint_extract_quest_spawned");
            }
        }
        break;
    case #"hash_634b246c3da5c56f": 
        uavplayer = getclosestplayerforreward(team, players, rewardorigin);
        if (isdefined(uavplayer)) {
            uavplayer thread questrewarduav(value);
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
        level thread scripts\mp\gametypes\br_jugg_common::dropdeliveryatpos(dropcircle, "quest_reward");
        break;
    case #"hash_db653a4972b3c13b": 
        break;
    default: 
        assertmsg("Unknown Quest Reward Type '" + type + "'");
        break;
    }
    return value;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bc4
// Size: 0xd8
function getclosestplayerforreward(team, players, rewardorigin) {
    if (isdefined(players) && players.size > 0) {
        possibleplayers = players;
    } else {
        possibleplayers = getteamdata(team, "players");
    }
    closestplayer = undefined;
    closestplayerdist = undefined;
    foreach (player in possibleplayers) {
        dist = distance2d(player.origin, rewardorigin);
        if (!isdefined(closestplayerdist) || dist < closestplayerdist) {
            closestplayerdist = dist;
            closestplayer = player;
        }
    }
    return closestplayer;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ca5
// Size: 0x106
function setupcirclepeek() {
    if (istrue(level.br_circle_disabled) || istrue(level.br_level.staticcircle)) {
        return;
    }
    assertex(!isdefined(level.circlepeeks), "setupCirclePeek called too many times. Circle Peeks are already set up.");
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

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7db3
// Size: 0xc2
function circlepeekcleanup() {
    self endon("game_ended");
    level endon("CirclePeekCleanup");
    while (true) {
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

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e7d
// Size: 0x15c
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
                player scripts\mp\utility\lower_message::setlowermessageomnvar("circle_peek_limit", undefined, 5);
            }
            return;
        }
        foreach (player in getteamdata(team, "players")) {
            level.circlepeeks[index] function_cfd53c8f6878014f(player);
        }
        return;
    }
    namespace_981ad73f8047222f::function_647a8c40104e4866(team);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fe1
// Size: 0x6e
function getquesttablerewardgroup(category) {
    utilstruct = function_8acf00b423dca1e6();
    group = utilstruct.rewards.categorytogroup[category];
    if (!isdefined(group)) {
        group = tablelookup("mp/brmissions.csv", 1, category, 7);
        utilstruct.rewards.categorytogroup[category] = group;
    }
    return group;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8058
// Size: 0xfa
function getquestrewardgroupstablerewards(group) {
    var_4c90cb0f1e0cd03a = getquestrewardsgrouptable();
    utilstruct = function_8acf00b423dca1e6();
    rewards = utilstruct.rewards.grouptorewards[group];
    if (!isdefined(rewards)) {
        rewards = [];
        rewardcol = 2;
        for (scalercol = 3; true; scalercol += 2) {
            ref = tablelookup(var_4c90cb0f1e0cd03a, 0, group, rewardcol);
            if (ref == "") {
                break;
            }
            scaler = tablelookup(var_4c90cb0f1e0cd03a, 0, group, scalercol);
            rewards[ref] = scaler;
            rewardcol += 2;
        }
        if (isdefined(level.brmodevariantrewardcullfunc)) {
            rewards = [[ level.brmodevariantrewardcullfunc ]](rewards);
        }
        utilstruct.rewards.grouptorewards[group] = rewards;
    }
    return rewards;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x815b
// Size: 0x90
function getquestrewardstabletype(reward) {
    rewardtable = function_29c4f14ee8c99d3f();
    if (scripts\cp_mp\utility\game_utility::function_6c1fce6f6b8779d5() == "risk") {
        rewardtable = "mp/brmission_rewards_dmz.csv";
    }
    utilstruct = function_8acf00b423dca1e6();
    type = utilstruct.rewards.rewardtotype[reward];
    if (!isdefined(type)) {
        type = tablelookup(rewardtable, 0, reward, 1);
        utilstruct.rewards.rewardtotype[reward] = type;
    }
    return type;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81f4
// Size: 0x119
function getquestrewardstablevalue(rewardref) {
    rewardtable = function_29c4f14ee8c99d3f();
    if (scripts\cp_mp\utility\game_utility::function_6c1fce6f6b8779d5() == "risk") {
        rewardtable = "mp/brmission_rewards_dmz.csv";
    }
    utilstruct = function_8acf00b423dca1e6();
    value = utilstruct.rewards.rewardtovalue[rewardref];
    if (!isdefined(value)) {
        columnindex = getquestrewardstablevaluecolumnindex();
        value = tablelookup(rewardtable, 0, rewardref, columnindex);
        type = getquestrewardstabletype(rewardref);
        value = castrewardvalue(type, value);
        utilstruct.rewards.rewardtovalue[rewardref] = value;
    }
    if (istrue(level.bmoovertime) && !isstring(value)) {
        value = int(value * level.overtimecashmultiplier);
    }
    if (scripts\mp\gametypes\br_publicevents::ispubliceventoftypeactive(15) && !isstring(value)) {
        value = int(value * level.br_pe_data[15].var_46a451f9012bd1c);
    }
    return value;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8316
// Size: 0x8a
function getquestrewardstablevaluecolumnindex() {
    assert(isdefined(level.maxteamsize));
    teamsize = level.maxteamsize;
    if (scripts\mp\gametypes\br_public::istutorial()) {
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
    }
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83a8
// Size: 0xe1
function getquestrewardscalerstablescaleinfo(ref) {
    utilstruct = function_8acf00b423dca1e6();
    info = utilstruct.rewards.scalertoscaleinfo[ref];
    if (!isdefined(info)) {
        info = [];
        tiercol = 1;
        for (scalercol = 2; true; scalercol += 2) {
            tier = tablelookup("mp/brmission_reward_scalers.csv", 0, ref, tiercol);
            if (tier == "") {
                break;
            }
            tier = int(tier);
            scaler = float(tablelookup("mp/brmission_reward_scalers.csv", 0, ref, scalercol));
            info[tier] = scaler;
            tiercol += 2;
        }
        utilstruct.rewards.scalertoscaleinfo[ref] = info;
    }
    return info;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8492
// Size: 0x2d
function getquestplunderrewardinstance(tier) {
    return getquestplunderreward(self.questcategory, tier, self.modifier, self.rewardmodifier);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x84c8
// Size: 0x2d
function getquestxprewardinstance(tier) {
    return getquestxpreward(self.questcategory, tier, self.modifier, self.rewardmodifier);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x84fe
// Size: 0x2d
function getquestweaponxprewardinstance(tier) {
    return getquestweaponxpreward(self.questcategory, tier, self.modifier, self.rewardmodifier);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8534
// Size: 0x40
function getquestplunderreward(category, tier, questmodifier, rewardmodifier) {
    if (!level.br_plunder_enabled) {
        return 0;
    }
    return getquestscaledvalue(category, tier, "plunder", questmodifier, rewardmodifier);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x857d
// Size: 0x32
function getquestxpreward(category, tier, questmodifier, rewardmodifier) {
    return getquestscaledvalue(category, tier, "xp", questmodifier, rewardmodifier);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85b8
// Size: 0x32
function getquestweaponxpreward(category, tier, questmodifier, rewardmodifier) {
    return getquestscaledvalue(category, tier, "weapon_xp", questmodifier, rewardmodifier);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85f3
// Size: 0x105
function getquestscaledvalue(category, tier, type, questmodifier, rewardmodifier) {
    group = getquesttablerewardgroup(category);
    getquestrewardbuildgroupref(category, rewardmodifier, questmodifier);
    rewards = getquestrewardgroupstablerewards(group);
    value = 0;
    foreach (rewardref, scalerref in rewards) {
        rewardtype = getquestrewardstabletype(rewardref);
        if (rewardtype == type) {
            basevalue = getquestrewardstablevalue(rewardref);
            scale = getquestscalervalue(scalerref, tier);
            value += basevalue * scale;
        }
    }
    value = castrewardvalue(type, value);
    return value;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8701
// Size: 0x70
function getquestscalervalue(scalerref, tier) {
    scaler = 1;
    info = getquestrewardscalerstablescaleinfo(scalerref);
    add = 0;
    for (i = 1; i <= tier; i++) {
        if (isdefined(info[i])) {
            add = info[i];
        }
        scaler += add;
    }
    return scaler;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x877a
// Size: 0xe3
function getquestperkbonus(team, newquest) {
    if (!isdefined(newquest)) {
        newquest = 0;
    }
    perkbonus = 0;
    foreach (player in getteamdata(team, "players")) {
        if (istrue(player.hasbettermissionrewards)) {
            perkbonus++;
        }
    }
    if (!newquest && isdefined(level.questinfo.maxperkbonustier) && isdefined(level.questinfo.maxperkbonustier[team])) {
        perkbonus = int(min(perkbonus, level.questinfo.maxperkbonustier[team]));
    }
    return perkbonus;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8866
// Size: 0x13e
function questrewarddropitems(team, items, origin, angles, fromcache, distoverride, yawoverride) {
    if (!isdefined(items)) {
        return;
    }
    dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
    dropinfo = spawnstruct();
    dropinfo.origin = origin;
    dropinfo.angles = angles;
    dropinfo.itemsdropped = 0;
    if (isdefined(level.currentrewarddropindex)) {
        dropinfo.itemsdropped = level.currentrewarddropindex;
    }
    var_605079299d001231 = dropinfo scripts\mp\gametypes\br_lootcache::lootspawnitemlist(dropstruct, items, fromcache, undefined, distoverride, yawoverride);
    foreach (item in var_605079299d001231) {
        item.team = team;
    }
    if (isdefined(level.currentrewarddropindex)) {
        level.currentrewarddropindex = dropinfo.itemsdropped;
    }
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89ac
// Size: 0x67
function questrewarduav(uavtype) {
    streakinfo = scripts\cp_mp\utility\killstreak_utility::createstreakinfo(uavtype, self);
    streakinfo.skipequippedstreakcheck = 1;
    streakinfo.var_32cd77f7f836e8e4 = 0;
    if (uavtype == "directional_uav") {
        streakinfo.overridetime = getdvarint(@"hash_df0bf19d56f89b93", 15);
    }
    scripts\cp_mp\killstreaks\uav::tryuseuavfromstruct(streakinfo);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a1b
// Size: 0x73
function getquestrewardbuildgroupref(category, rewardmod, questmod) {
    groupbase = getquesttablerewardgroup(category);
    group = groupbase;
    if (isdefined(questmod)) {
        group += questmod;
    }
    if (isdefined(rewardmod)) {
        group += rewardmod;
    }
    if (questrewardgroupexist(group)) {
        return group;
    }
    group = groupbase;
    if (isdefined(rewardmod)) {
        group += rewardmod;
    }
    if (questrewardgroupexist(group)) {
        return group;
    }
    return groupbase;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a97
// Size: 0x37
function questrewardgroupexist(groupref) {
    var_4c90cb0f1e0cd03a = getquestrewardsgrouptable();
    ref = tablelookup(var_4c90cb0f1e0cd03a, 0, groupref, 0);
    return ref != "";
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ad7
// Size: 0xed
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
        assertmsg("Unknown Quest Reward Type '" + rewardtype + "'");
        break;
    }
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bcc
// Size: 0x9a
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
        assertmsg("Unknown Quest Reward Value Type '" + type + "'");
        break;
    }
    return value;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c6f
// Size: 0x5f
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

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8cd7
// Size: 0x74
function function_29c4f14ee8c99d3f() {
    if (getdvarint(@"hash_82bde055b11e6698", 0)) {
        rewardstable = getdvar(@"hash_f29fa998fb70c4d5", "mp/brmission_rewards.csv");
        return rewardstable;
    }
    if (getdvarint(@"hash_78653010d584aa6e", 0)) {
        rewardstable = getmatchrulesdata("brData", "brMissionRewardTable");
    }
    if (!isdefined(rewardstable) || rewardstable == "") {
        rewardstable = "mp/brmission_rewards.csv";
    }
    return rewardstable;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d53
// Size: 0x2b
function getquestrewardgroupindex(group) {
    var_4c90cb0f1e0cd03a = getquestrewardsgrouptable();
    return int(tablelookup(var_4c90cb0f1e0cd03a, 0, group, 1));
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d87
// Size: 0x14c
function function_4f93b5d0c1953(team, players, rewardorigin) {
    allkiosks = level.br_armory_kiosk.scriptables;
    activekiosks = [];
    if (!isdefined(allkiosks) || allkiosks.size == 0) {
        return;
    }
    foreach (kiosk in allkiosks) {
        if (!istrue(kiosk.disabled)) {
            activekiosks[activekiosks.size] = kiosk;
        }
    }
    locations = array_randomize(activekiosks);
    closestkiosk = undefined;
    shortestdist = undefined;
    foreach (kiosk in locations) {
        currentdist = distance2d(kiosk.origin, rewardorigin);
        if (!isdefined(shortestdist) || shortestdist > currentdist) {
            shortestdist = currentdist;
            closestkiosk = kiosk;
        }
    }
    return closestkiosk;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8edc
// Size: 0x99
function function_62471111ae6a1489(team, players, rewardorigin) {
    kiosk = function_4f93b5d0c1953(team, players, rewardorigin);
    if (!isdefined(kiosk)) {
        return;
    }
    foreach (player in players) {
        if (isdefined(player) && !istrue(player.br_iseliminated)) {
            scripts\mp\gametypes\br_armory_kiosk::kiosksetupfiresaleforplayer(kiosk, player);
        }
    }
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f7d
// Size: 0x3e
function getquestrewardtier(team) {
    utilstruct = function_8acf00b423dca1e6();
    tier = utilstruct.tiers[team];
    if (!isdefined(tier)) {
        tier = 1;
    }
    return tier;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8fc4
// Size: 0x3c
function setquestrewardtier(team, tier) {
    utilstruct = function_8acf00b423dca1e6();
    utilstruct.tiers[team] = tier;
    setquestrewardtierteamomnvar(team, tier);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9008
// Size: 0x24
function addquestrewardtier(team, value) {
    setquestrewardtier(team, getquestrewardtier(team) + value);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9034
// Size: 0x25
function addquestrewardtierframeend(team, value) {
    waittillframeend();
    setquestrewardtier(team, getquestrewardtier(team) + value);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9061
// Size: 0x6c
function setquestindexteamomnvar(team, questindex) {
    foreach (player in getteamdata(team, "players")) {
        player setquestindexomnvar(questindex);
    }
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90d5
// Size: 0x22
function setquestindexomnvar(questindex) {
    /#
        function_fe3b51cfbf0f97c5();
    #/
    self setclientomnvar("ui_br_objective_index", questindex);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90ff
// Size: 0x6c
function setquestrewardtierteamomnvar(team, tier) {
    foreach (player in getteamdata(team, "players")) {
        player setquestrewardtieromnvar(tier);
    }
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9173
// Size: 0x22
function setquestrewardtieromnvar(tier) {
    /#
        function_fe3b51cfbf0f97c5();
    #/
    self setclientomnvar("ui_br_objective_reward_tier", tier);
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x919d
// Size: 0xc1
function cancelallmissions() {
    foreach (quest in level.questinfo.quests) {
        foreach (instance in quest.instances) {
            instance.result = "cancel";
            instance removequestinstance();
        }
    }
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9266
// Size: 0x36e
function getallactivequestsforteam(team) {
    results = [];
    foreach (quest in level.questinfo.quests) {
        foreach (id, instance in quest.instances) {
            if (id != team) {
                continue;
            }
            if (scripts\mp\gametypes\br_quest_util::isquestinstancealocale(instance)) {
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
                assertmsg("Unhandled mission type: " + instance.category);
                break;
            }
            results[results.size] = questinfo;
        }
    }
    return results;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95dd
// Size: 0x5f
function getquestunlockableindexfromlootid(lootid) {
    unlockabledata = level.questinfo.unlockables[lootid];
    if (!isdefined(unlockabledata)) {
        assert("Could not find an unlockable indx for lootId, " + lootid + ". Make sure it exists in " + "mp/brmission_unlockables.csv" + ".");
        return 0;
    }
    return unlockabledata.unlockableindex;
}

// Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9645
// Size: 0x130
function getrandomextractunlockablelootid() {
    chancetotal = 0;
    foreach (unlockabledata in level.questinfo.unlockables) {
        chancetotal += unlockabledata.extractunlockablechance;
    }
    randomroll = randomfloatrange(0, chancetotal);
    chancecurrent = 0;
    foreach (unlockabledata in level.questinfo.unlockables) {
        chancecurrent += unlockabledata.extractunlockablechance;
        if (randomroll <= chancecurrent) {
            return unlockabledata.lootid;
        }
    }
    assert("Should have already found a random piece of loot. Check function logic for errors.");
    return level.questinfo.unlockables[0].lootid;
}

/#

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x977e
    // Size: 0x11
    function function_d2caa40694d469ab() {
        function_8ff83bdd5420ae28("<dev string:x6f>");
    }

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x9797
    // Size: 0x11
    function function_8b0829a8ce24f0aa() {
        function_8ff83bdd5420ae28("<dev string:x18a>");
    }

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x97b0
    // Size: 0x4f
    function function_8ff83bdd5420ae28(type) {
        selftype = self.debugtype;
        if (!isdefined(selftype)) {
            selftype = "<dev string:x347>";
        }
        assertex(type == selftype, "<dev string:x353>" + type + "<dev string:x363>" + selftype + "<dev string:x374>");
    }

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x9807
    // Size: 0x16
    function function_132b6261e829fa9c() {
        function_6736e9c4965502d1("<dev string:x6f>", "<dev string:x18a>");
    }

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x9825
    // Size: 0x66
    function function_6736e9c4965502d1(type_a, type_b) {
        selftype = self.debugtype;
        if (!isdefined(selftype)) {
            selftype = "<dev string:x347>";
        }
        assertex(type_a == selftype || type_b == selftype, "<dev string:x353>" + type_a + "<dev string:x377>" + type_b + "<dev string:x363>" + selftype + "<dev string:x374>");
    }

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x9893
    // Size: 0x19
    function function_fe3b51cfbf0f97c5() {
        assertex(isplayer(self), "<dev string:x37e>");
    }

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x98b4
    // Size: 0x30
    function function_edc6b2561f8041e0() {
        assertex(isdefined(self.type) && scripts\mp\gametypes\br_pickups::isquesttablet(self.type), "<dev string:x3a3>");
    }

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x98ec
    // Size: 0x24
    function function_cfea05fa19edb13b(category, func) {
        _registerquestfunc(category, func, "<dev string:x3c8>");
    }

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x9918
    // Size: 0x21
    function function_f14edc2973202386() {
        thread function_58c7e92065fbb263();
        thread quest_devgui();
        scripts\mp\gametypes\br_dev::registerhandlecommand(&function_a70d9040958e91c3);
    }

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x9941
    // Size: 0xbc
    function function_a70d9040958e91c3(command, args) {
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
    }

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x9a05
    // Size: 0x100
    function function_bfaa2e162911a568() {
        player = level.player;
        if (!isdefined(player) || !isdefined(player.team)) {
            return;
        }
        foreach (quest in level.questinfo.quests) {
            foreach (id, instance in quest.instances) {
                if (id == player.team) {
                    instance.result = "<dev string:x441>";
                    instance removequestinstance();
                }
            }
        }
    }

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x9b0d
    // Size: 0x99
    function function_279b2ae4a95c269b(category) {
        tablet = spawnscriptable(getlootname(category), level.player.origin + (0, 0, 15), (0, 0, 0));
        tablet tabletinit(category);
        if (tablet.init) {
            tablet.keepinmap = 1;
            tablet thread function_3e68e198ba016b00();
        } else {
            tablet tablethide();
            iprintlnbold("<dev string:x447>");
        }
        return tablet;
    }

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x9bae
    // Size: 0x1b
    function function_3e68e198ba016b00() {
        self endon("<dev string:x471>");
        self waittill("<dev string:x477>");
        self freescriptable();
    }

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x9bd1
    // Size: 0x19c
    function function_5bb84e6bdcae8b0a(args) {
        argteam = args[0];
        argcategory = args[1];
        friendlyteam = level.player.team;
        if (!isdefined(friendlyteam)) {
            friendlyteam = "<dev string:x482>";
        }
        if (argteam == "<dev string:x489>") {
            teams = [friendlyteam];
        } else if (argteam == "<dev string:x492>") {
            teams = getotherteam(friendlyteam);
        } else {
            teams = [argteam];
        }
        missionplayer = undefined;
        foreach (team in teams) {
            if (array_contains(level.questinfo.teamsonquests, team)) {
                continue;
            }
            aliveplayers = getteamdata(team, "<dev string:x498>");
            if (!aliveplayers.size) {
                continue;
            }
            missionplayer = random(aliveplayers);
            break;
        }
        if (!isdefined(missionplayer)) {
            iprintlnbold("<dev string:x4a5>" + argteam + "<dev string:x4c1>");
            return;
        }
        tablet = function_279b2ae4a95c269b(argcategory);
        if (isdefined(tablet)) {
            scripts\mp\gametypes\br_pickups::lootused(tablet, tablet.type, "<dev string:x4c8>", missionplayer);
            iprintlnbold("<dev string:x4d0>" + missionplayer.team + "<dev string:x8e>");
        }
    }

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x9d75
    // Size: 0x9a
    function function_756366dbe90f369c(queststring) {
        var_4599a00c9fc16d43 = strtok(queststring, "<dev string:x4e8>");
        questint = 0;
        foreach (tok in var_4599a00c9fc16d43) {
            questint |= level.questinfo.debuginfo.var_2484093a170df905[tok];
        }
        return questint;
    }

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x9e17
    // Size: 0xa2
    function function_31342031c93cfdc0(i) {
        queststring = "<dev string:x191>";
        foreach (bit, str in level.questinfo.debuginfo.var_191417401f979fb4) {
            if (i & 1 << bit) {
                if (queststring != "<dev string:x191>") {
                    queststring += "<dev string:x4e8>";
                }
                queststring += str;
            }
        }
        return queststring;
    }

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x9ec1
    // Size: 0x39
    function function_a608630338efae56(args) {
        showtype = args[0];
        if (showtype == "<dev string:x4ea>") {
            level notify("<dev string:x4ef>");
            return;
        }
        level thread function_ee8fbb46302dee4a(showtype);
    }

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x9f02
    // Size: 0x16d
    function function_ee8fbb46302dee4a(type) {
        level notify("<dev string:x4ef>");
        level endon("<dev string:x4ef>");
        while (!isdefined(level.player)) {
            waitframe();
        }
        typeint = function_756366dbe90f369c(type);
        while (true) {
            drawdist = getdvarfloat(@"hash_1929787a187dde7b", 5000);
            points = getquestpoints(typeint, level.player.origin, drawdist, 0, 1);
            foreach (point in points) {
                sphere(point.origin, 10, (0, 1, 0), 0, 1);
                print3d(point.origin, function_31342031c93cfdc0(point.spawnflags), (0, 1, 1), 1, 1, 1, 1);
                radius = questpointgetradius(point);
                if (radius > 0) {
                    scripts\engine\utility::draw_circle(point.origin, radius, (1, 1, 0), 1, 0, 0);
                }
            }
            waitframe();
        }
    }

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xa077
    // Size: 0x28
    function function_be813b7757b99ae0(args) {
        questrewardcirclepeek(level.player.team);
    }

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xa0a7
    // Size: 0x1bd
    function function_d91326e8ffd1cb7(enabled) {
        level notify("<dev string:x502>");
        level endon("<dev string:x502>");
        if (enabled == "<dev string:x515>") {
            return;
        }
        while (true) {
            foreach (type, info in level.questinfo.tabletinfo) {
                tablets = getlootscriptablearray(getlootname(type));
                foreach (tablet in tablets) {
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
    }

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xa26c
    // Size: 0xf8
    function function_5d34afc069a50cba(placement, from) {
        if (!isdefined(from.circletime)) {
            from.circletime = scripts\mp\gametypes\br_circle::getmintimetillpointindangercircle(from.origin);
        }
        if (!isdefined(placement.circletime)) {
            placement.circletime = scripts\mp\gametypes\br_circle::getmintimetillpointindangercircle(placement.origin);
        }
        delta = placement.circletime - from.circletime;
        if (delta <= 0) {
            color = (1, 0, 0);
        } else {
            color = (1, 1, 0);
        }
        line(from.origin, placement.origin, color);
        debugstar(placement.origin, color, 1, "<dev string:x191>" + delta);
    }

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 4, eflags: 0x0
    // Checksum 0x0, Offset: 0xa36c
    // Size: 0x7f
    function function_aed58a503d8e32c3(numerator, denominator, showdenominator, showpercent) {
        if (!isdefined(showdenominator)) {
            showdenominator = 1;
        }
        if (!isdefined(showpercent)) {
            showpercent = 1;
        }
        str = "<dev string:x191>" + numerator;
        if (showdenominator) {
            str += "<dev string:x519>" + denominator;
        }
        if (showpercent && denominator) {
            str += "<dev string:x51b>" + function_fc84b7b73e9130bc(numerator / denominator, 1) + "<dev string:x51e>";
        }
        return str;
    }

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xa3f3
    // Size: 0x47
    function function_fc84b7b73e9130bc(frac, decimalplaces) {
        if (!isdefined(decimalplaces)) {
            decimalplaces = 1;
        }
        return "<dev string:x191>" + int(frac * pow(10, 2 + decimalplaces) + 0.5) / pow(10, decimalplaces);
    }

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xa442
    // Size: 0x5d9
    function function_58c7e92065fbb263() {
        setdvarifuninitialized(@"hash_d3c4b3e2a6204d64", 0);
        setdvarifuninitialized(@"hash_3cec5db77a324ac5", 12);
        while (!isdefined(level.player)) {
            waitframe();
        }
        wait 1;
        x_pos = 200;
        y_pos = 40;
        while (true) {
            hudelems = [];
            while (!getdvarint(@"hash_d3c4b3e2a6204d64", 0)) {
                waitframe();
            }
            hudheader = function_5d895ce7d9060182();
            hudheader.x = x_pos;
            hudheader.y = y_pos;
            hudheader setdevtext("<dev string:x520>");
            while (getdvarint(@"hash_d3c4b3e2a6204d64", 0)) {
                huddetail = getdvarint(@"hash_d3c4b3e2a6204d64", 0);
                var_fa89ff89b0460da4 = 0;
                var_1e3c0e925b1a5b32 = 0;
                switch (huddetail) {
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
                maxprints = getdvarint(@"hash_3cec5db77a324ac5", 12);
                hudstrings = [];
                if (var_fa89ff89b0460da4) {
                    totalstarting = 0;
                    foreach (type, count in self.debuginfo.var_2f8e8ca203d36b1d) {
                        totalstarting += count;
                    }
                    totalactive = 0;
                    foreach (type, count in self.debuginfo.var_9db1e36a47913241) {
                        totalactive += count;
                    }
                    hudstrings[hudstrings.size] = "<dev string:x52c>" + function_aed58a503d8e32c3(totalactive, totalstarting);
                    foreach (type, count in self.debuginfo.var_9db1e36a47913241) {
                        hudstrings[hudstrings.size] = "<dev string:x536>" + type + "<dev string:x538>" + function_aed58a503d8e32c3(count, totalstarting, 0);
                    }
                    hudstrings[hudstrings.size] = "<dev string:x53b>" + function_aed58a503d8e32c3(self.debuginfo.tabletsused, totalstarting, 0);
                    hudstrings[hudstrings.size] = "<dev string:x543>" + function_aed58a503d8e32c3(self.debuginfo.var_7b2f9f2035df4396, totalstarting, 0);
                }
                if (var_1e3c0e925b1a5b32) {
                    hudstrings[hudstrings.size] = "<dev string:x555>";
                    foreach (type, quest in level.questinfo.quests) {
                        hudstrings[hudstrings.size] = "<dev string:x536>" + type + "<dev string:x55d>" + quest.instances.size + "<dev string:x51e>";
                        foreach (id, instance in quest.instances) {
                            hudstrings[hudstrings.size] = "<dev string:x55f>" + id;
                            instancefunc = level.questinfo.quests[type].funcs["<dev string:x3c8>"];
                            if (isdefined(instancefunc)) {
                                instancestrings = instance [[ instancefunc ]]();
                                foreach (str in instancestrings) {
                                    hudstrings[hudstrings.size] = "<dev string:x562>" + str;
                                }
                            }
                        }
                    }
                }
                count = 0;
                anychange = 0;
                for (i = 0; i < hudstrings.size; i++) {
                    str = hudstrings[i];
                    if (!isdefined(hudelems[i])) {
                        hudelems[i] = function_5d895ce7d9060182();
                    }
                    if (!isdefined(hudelems[i])) {
                        break;
                    }
                    anychange = anychange || str != hudelems[i].currenttext;
                    hudelems[i].x = x_pos;
                    hudelems[i].y = y_pos + 11 * (i + 1);
                    count++;
                }
                if (anychange) {
                    hudheader clearalltextafterhudelem();
                    for (i = 0; i < count; i++) {
                        hudelems[i] setdevtext(hudstrings[i]);
                        hudelems[i].currenttext = hudstrings[i];
                    }
                }
                if (count < hudelems.size) {
                    for (i = hudelems.size - 1; i >= count; i--) {
                        hudelems[i] destroy();
                        hudelems[i] = undefined;
                    }
                }
                wait 0.05;
            }
            foreach (hud in hudelems) {
                hud destroy();
            }
            hudheader destroy();
        }
    }

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xaa23
    // Size: 0x137
    function function_5d895ce7d9060182() {
        fontelem = newhudelem();
        if (isdefined(fontelem)) {
            fontelem.elemtype = "<dev string:x566>";
            fontelem.font = "<dev string:x56b>";
            fontelem.fontscale = 1.2;
            fontelem.basefontscale = fontelem.fontscale;
            fontelem.x = 0;
            fontelem.y = 0;
            fontelem.width = 0;
            fontelem.height = int(level.fontheight * fontelem.fontscale);
            fontelem.xoffset = 0;
            fontelem.yoffset = 0;
            fontelem.children = [];
            fontelem scripts\mp\hud_util::setparent(level.uiparent);
            fontelem.hidden = 0;
            fontelem.aligny = "<dev string:x573>";
            fontelem.alignx = "<dev string:x577>";
            fontelem.currenttext = "<dev string:x57c>";
            fontelem setdevtext("<dev string:x57c>");
        }
        return fontelem;
    }

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xab62
    // Size: 0x23b
    function quest_devgui() {
        debughud = "<dev string:x582>" + "<dev string:x59e>";
        thread adddebugcommanddelayed(debughud + "<dev string:x5ab>" + function_f28fd66285fa2c9(@"hash_d3c4b3e2a6204d64") + "<dev string:x5c7>");
        thread adddebugcommanddelayed(debughud + "<dev string:x5cc>" + function_f28fd66285fa2c9(@"hash_d3c4b3e2a6204d64") + "<dev string:x5e5>");
        thread adddebugcommanddelayed(debughud + "<dev string:x5ea>" + function_f28fd66285fa2c9(@"hash_d3c4b3e2a6204d64") + "<dev string:x604>");
        thread adddebugcommanddelayed(debughud + "<dev string:x609>" + function_f28fd66285fa2c9(@"hash_d3c4b3e2a6204d64") + "<dev string:x616>");
        foreach (type, info in level.questinfo.tabletinfo) {
            function_8f449f8c11c8ea84(type, "<dev string:x61b>" + type + "<dev string:x623>", [0, 1], info.enabled);
        }
        function_8f449f8c11c8ea84("<dev string:x62a>", "<dev string:x637>", [500, 1000, 5000, 10000, 50000], 5000);
        function_89a2139a95fab230("<dev string:x3d9>");
        var_e07185f7ee187b3a = getarraykeys(level.questinfo.tabletinfo);
        function_89a2139a95fab230("<dev string:x3e8>", var_e07185f7ee187b3a);
        function_89a2139a95fab230("<dev string:x3f5>" + "<dev string:x65a>", var_e07185f7ee187b3a);
        function_89a2139a95fab230("<dev string:x3f5>" + "<dev string:x664>", var_e07185f7ee187b3a);
        var_b5c4f807971196ca = getarraykeys(level.questinfo.debuginfo.var_2484093a170df905);
        var_b5c4f807971196ca = array_add(var_b5c4f807971196ca, "<dev string:x4ea>");
        function_89a2139a95fab230("<dev string:x407>", var_b5c4f807971196ca);
        function_89a2139a95fab230("<dev string:x42c>", ["<dev string:x66b>", "<dev string:x515>"]);
        function_89a2139a95fab230("<dev string:x419>");
    }

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 4, eflags: 0x0
    // Checksum 0x0, Offset: 0xada5
    // Size: 0x4f
    function function_8f449f8c11c8ea84(submenu, dvarname, values, defaultvalue) {
        devguipath = "<dev string:x582>" + "<dev string:x66e>" + submenu + "<dev string:x519>";
        function_f23e7e2f6a51b5be(devguipath, dvarname, values, defaultvalue);
    }

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xadfc
    // Size: 0xbb
    function function_89a2139a95fab230(cmd, args) {
        devguipath = "<dev string:x582>" + "<dev string:x67a>";
        if (isdefined(args)) {
            foreach (arg in args) {
                thread adddebugcommanddelayed(devguipath + cmd + "<dev string:x519>" + arg + "<dev string:x686>" + cmd + "<dev string:x698>" + arg + "<dev string:x69a>");
            }
            return;
        }
        thread adddebugcommanddelayed(devguipath + cmd + "<dev string:x686>" + cmd + "<dev string:x69a>");
    }

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 4, eflags: 0x0
    // Checksum 0x0, Offset: 0xaebf
    // Size: 0x11a
    function function_f23e7e2f6a51b5be(devguipath, dvarname, values, defaultvalue) {
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
        var_a606a5995982f6b3 = devguipath + dvarname + "<dev string:x519>";
        for (i = 0; i < values.size; i++) {
            value = values[i];
            isdefault = isdefined(defaultvalue) && value == defaultvalue;
            thread adddebugcommanddelayed(var_a606a5995982f6b3 + value + ter_op(isdefault, "<dev string:x69d>", "<dev string:x6a9>") + i + "<dev string:x6ab>" + dvarname + "<dev string:x698>" + value + "<dev string:x69a>");
        }
    }

    // Namespace br_quest_util / scripts\mp\gametypes\br_quest_util
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xafe1
    // Size: 0x89
    function adddebugcommanddelayed(cmd) {
        while (!isdefined(level.player)) {
            waitframe();
        }
        while (true) {
            if (!isdefined(level.var_ea8a728d3504fb9b) || level.var_ea8a728d3504fb9b < gettime()) {
                level.var_ea8a728d3504fb9b = gettime();
                level.var_28f915fb1d12fdb1 = 0;
            }
            if (level.var_28f915fb1d12fdb1 < 3) {
                break;
            }
            wait 0.05;
        }
        level.var_28f915fb1d12fdb1++;
        adddebugcommand(cmd);
    }

#/
