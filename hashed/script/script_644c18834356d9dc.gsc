#using scripts\engine\utility.gsc;
#using scripts\cp\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using script_3db04fd1b466bdba;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using script_14609b809484646e;
#using script_435c3f85a3d06576;
#using scripts\cp\cp_analytics.gsc;
#using scripts\cp\loot_system.gsc;
#using script_531cb1be084314f7;
#using scripts\cp\cp_outofbounds.gsc;
#using script_afb7e332aee4bf2;
#using scripts\cp\equipment\nvg.gsc;
#using script_12e2fb553ec1605e;
#using script_116171939929af39;
#using scripts\cp\cp_hud_message.gsc;
#using scripts\cp\cp_checkpoint.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\cp\cp_weapons.gsc;
#using scripts\cp\cp_objectives.gsc;
#using script_74502a9e0ef1f19c;
#using scripts\cp_mp\killstreaks\chopper_gunner.gsc;
#using scripts\cp_mp\killstreaks\gunship.gsc;
#using scripts\cp_mp\killstreaks\airstrike.gsc;
#using scripts\cp_mp\killstreaks\juggernaut.gsc;
#using scripts\cp_mp\killstreaks\cruise_predator.gsc;
#using scripts\cp_mp\killstreaks\helper_drone.gsc;
#using script_189b67b2735b981d;
#using scripts\cp_mp\killstreaks\manual_turret.gsc;
#using scripts\cp_mp\killstreaks\sentry_gun.gsc;
#using script_4d0e5ae730a29489;
#using scripts\cp_mp\killstreaks\uav.gsc;
#using script_10ad6174c8938599;
#using script_b6e69ac53e6ee66;
#using scripts\cp_mp\killstreaks\toma_strike.gsc;
#using scripts\cp_mp\killstreaks\white_phosphorus.gsc;
#using script_1eddec53abf6e24c;
#using scripts\cp_mp\killstreaks\chopper_support.gsc;
#using script_249f45d992af1114;
#using script_6d68cfdf0836123c;
#using script_596570bd8d025881;
#using script_31f8511d0913ca09;
#using script_1b9d6b0232dbfb87;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_56ef8d52fe1b48a1;
#using script_644c18834356d9dc;
#using scripts\cp\powers\cp_tactical_cover.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;

#namespace munitions;

// Namespace munitions / namespace_94359011b63230a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1232
// Size: 0x1c3
function init_munitions() {
    level.munitions_table_data = [];
    level.ammoincompatibleweaponslist = ["iw9_la_mike32_mp"];
    level.var_e9059297c2017879 = [];
    level.var_89f755af301fc71e = ["gunship", "assault_drone", "chopper_gunner", "cruise_missile"];
    level.var_55c84262b9114f3c = ["gunship", "chopper_gunner", "cruise_missile", "precision_airstrike", "auto_drone", "hover_jet", "toma_strike", "loitering_munition", "missile_turret", "assault_drone"];
    level.var_fd57bc164397d837 = ["chopper_gunner", "cruise_missile", "auto_drone", "hover_jet", "precision_airstrike", "toma_strike", "uav", "switchblade_drone", "sentry", "cluster_spike", "assault_drone", "missile_turret"];
    level.var_affc75ae2955c39f = "tablet_start";
    val::group_register(level.var_affc75ae2955c39f, ["cp_munitions_pickup"]);
    setdvarifuninitialized(@"hash_f897a05f1af906a1", 0);
    read_munition_table();
    /#
        if (getdvar(@"hash_e6afce2cf5cf7515") == "<dev string:x1c>" || level.createfx_enabled) {
            return;
        }
    #/
    initkillstreakdata();
    level.unlimitedmunitions = getdvarint(@"hash_f897a05f1af906a1", 0);
    namespace_9c383b14c4908e46::function_8ece37593311858a(&function_65a298ec5c2f2ff4);
}

// Namespace munitions / namespace_94359011b63230a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13fd
// Size: 0x16d
function initkillstreakdata() {
    globals = spawnstruct();
    level.streakglobals = globals;
    globals.costomnvars = [];
    globals.costomnvars[1] = "ui_score_streak_cost";
    globals.costomnvars[2] = "ui_score_streak_two_cost";
    globals.costomnvars[3] = "ui_score_streak_three_cost";
    globals.slotomnvars = [];
    globals.slotomnvars[0] = "ui_score_streak_index_0";
    globals.slotomnvars[1] = "ui_score_streak_index_1";
    globals.slotomnvars[2] = "ui_score_streak_index_2";
    globals.slotomnvars[3] = "ui_score_streak_index_3";
    globals.availableomnvars = [];
    globals.availableomnvars[0] = "ui_score_streak_available_0";
    globals.availableomnvars[1] = "ui_score_streak_available_1";
    globals.availableomnvars[2] = "ui_score_streak_available_2";
    globals.availableomnvars[3] = "ui_score_streak_available_3";
    globals.var_8bbe6dc152f1dae0 = [];
    globals.var_8bbe6dc152f1dae0[1] = "ui_score_streak_last_round_earned_1";
    globals.var_8bbe6dc152f1dae0[2] = "ui_score_streak_last_round_earned_2";
    globals.var_8bbe6dc152f1dae0[3] = "ui_score_streak_last_round_earned_3";
    function_570918ef81285e16();
}

// Namespace munitions / namespace_94359011b63230a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1572
// Size: 0x186
function function_570918ef81285e16() {
    globals = level.streakglobals;
    if (isdefined(globals.streakbundles)) {
        return;
    }
    globals.streakbundles = [];
    globals.var_2150da9328528bb9 = [];
    var_20ee381602c954db = getscriptbundle(scripts\cp_mp\utility\killstreak_utility::function_708853c5d755f72());
    foreach (index, var_cc673384f6943c85 in var_20ee381602c954db.killstreak_list) {
        if (!isnumber(index)) {
            continue;
        }
        if (!isdefined(var_cc673384f6943c85)) {
            continue;
        }
        killstreakbundlename = var_cc673384f6943c85.bundle;
        if (!isdefined(killstreakbundlename)) {
            continue;
        }
        assert(function_73e183e02834309d(killstreakbundlename));
        if (killstreakbundlename == %"hash_6c0bd35c2f752777") {
            continue;
        }
        if (killstreakbundlename == %"hash_40daaf59ab8992e5") {
            continue;
        }
        bundle = getscriptbundle(killstreakbundlename);
        if (!isdefined(bundle)) {
            continue;
        }
        streakref = bundle.killstreakref;
        if (!isdefined(streakref) || streakref == "none") {
            assert(isdefined(streakref));
            continue;
        }
        bundle.var_19fb085453713468 = killstreakbundlename;
        function_2ff74098fad17213(var_cc673384f6943c85, streakref);
        globals.streakbundles[streakref] = bundle;
        globals.var_2150da9328528bb9[streakref] = index;
    }
}

// Namespace munitions / namespace_94359011b63230a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1700
// Size: 0xbf
function function_65a298ec5c2f2ff4() {
    if (function_240f7f4e57340e8f()) {
        level.var_3a7f3e66e1a1d8f5 = 1;
    } else {
        level.var_3a7f3e66e1a1d8f5 = 4;
    }
    self.munition_slots = [];
    function_25b13e44dca57e67();
    var_20ee381602c954db = getscriptbundle(scripts\cp_mp\utility\killstreak_utility::function_708853c5d755f72());
    foreach (var_cc673384f6943c85 in var_20ee381602c954db.killstreak_list) {
        if (!isdefined(var_cc673384f6943c85.bundle)) {
            continue;
        }
        initializekillstreak(function_1823ff50bb28148d(var_cc673384f6943c85.ref));
    }
}

// Namespace munitions / namespace_94359011b63230a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17c7
// Size: 0x10d
function function_25b13e44dca57e67() {
    total_slots = level.var_3a7f3e66e1a1d8f5;
    var_794a764136e46006 = [];
    for (i = 0; i < total_slots; i++) {
        self.munition_slots[i] = spawnstruct();
        self.munition_slots[i].ref = "none";
        self.munition_slots[i].cooldown = level.munitions_table_data[self.munition_slots[i].ref].cooldown;
        self.munition_slots[i].can_use = 0;
        self.munition_slots[i].cooldown_progress = undefined;
        self.munitions_in_playerdata[i] = spawnstruct();
        self.munitions_in_playerdata[i].ref = self.munition_slots[i].ref;
    }
}

// Namespace munitions / namespace_94359011b63230a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18dc
// Size: 0xdd
function read_munition_table() {
    for (row = 0; true; row++) {
        munition = tablelookupbyrow("cp/cp_munitiontable.csv", row, 1);
        if (munition == "") {
            break;
        }
        level.munitions_table_data[munition] = spawnstruct();
        level.munitions_table_data[munition].index = int(tablelookupbyrow("cp/cp_munitiontable.csv", row, 0));
        level.munitions_table_data[munition].ref = munition;
        level.munitions_table_data[munition].cost = int(tablelookupbyrow("cp/cp_munitiontable.csv", row, 4));
        level.munitions_table_data[munition].cooldown = float(tablelookupbyrow("cp/cp_munitiontable.csv", row, 5));
    }
}

// Namespace munitions / namespace_94359011b63230a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19c1
// Size: 0x5c
function function_77084f05581a035() {
    self.dpad_selection_index = 0;
    var_b00605b9047d7f4b = level.var_3a7f3e66e1a1d8f5;
    total_slots = level.var_3a7f3e66e1a1d8f5;
    if (istrue(level.unlimitedmunitions)) {
        total_slots = 1;
    }
    self setplayerdata("cp", "inventorySlots", "totalSlots", total_slots);
}

// Namespace munitions / namespace_94359011b63230a6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1a25
// Size: 0x389
function function_b64f3836c1d7a06(notification, val) {
    if (isdefined(notification)) {
        switch (notification) {
        case #"hash_954f00101888049e": 
            if (!istrue(level.var_c4ed9eb36c678ed4)) {
                break;
            }
        case #"hash_c02213513d8eb1f4": 
            reason = 0;
            /#
                reason = getdvarint(@"hash_5c04fc6164658276", 0);
            #/
            if (!istrue(self.isjuggernaut)) {
                if (!player_can_use_munitions(reason)) {
                    break;
                }
            } else {
                val = function_346cde477a4fef90("nvg");
                if (!isdefined(val)) {
                    break;
                }
            }
            if (val >= 0 && val <= 3) {
                munition = self.munition_slots[val];
                if (isdefined(munition) && munition.ref != "none" && munition.ref != "empty1" && munition.ref != "empty2" && munition.ref != "empty3") {
                    if (istrue(can_use_munition(val))) {
                        if (function_240f7f4e57340e8f() && isdefined(level.var_e9059297c2017879) && array_contains(level.var_e9059297c2017879, munition.ref)) {
                            thread function_e9bcf4a2a0e6dc79(munition.ref);
                        } else if (function_240f7f4e57340e8f() && isdefined(level.var_89f755af301fc71e) && array_contains(level.var_89f755af301fc71e, munition.ref)) {
                            thread function_6dba5503031bcc38(munition.ref);
                        }
                        if (munition.ref == "nvg" && !istrue(level.disable_nvg) && !istrue(self.var_4d572a54ed8571c4)) {
                            if (!istrue(self.pers["useNVG"])) {
                                self.pers["useNVG"] = 1;
                                self nightvisionviewon();
                            } else {
                                self.pers["useNVG"] = 0;
                                self nightvisionviewoff();
                            }
                            break;
                        }
                        if (munition.ref == "flashlight" && istrue(level.var_c735d60735eda5f)) {
                            thread namespace_873a796d1ccabb0c::toggle_flashlight();
                            break;
                        }
                        thread remove_munition_on_use(munition.ref, val);
                        success = giveitembasedoncraftingstruct(munition.ref);
                        if (success) {
                            if (is_instant_use_munition(munition.ref)) {
                                self notify("munitions_used", munition.ref);
                            }
                            scripts\cp\cp_analytics::logevent_munitionused(self, munition.ref);
                            if (function_240f7f4e57340e8f()) {
                                if (!scripts\cp\loot_system::is_empty_or_none(0)) {
                                    self waittill("munition_removed");
                                }
                                while (level.var_50c7b4b50d222c0 >= 0 && !isdefined(namespace_bc7b29dcc022d887::function_821bfba97b1251ac(level.var_e85fcf89f70a718a[level.var_50c7b4b50d222c0]))) {
                                    level.var_50c7b4b50d222c0--;
                                }
                                if (level.var_50c7b4b50d222c0 >= 0) {
                                    index = namespace_bc7b29dcc022d887::function_821bfba97b1251ac(level.var_e85fcf89f70a718a[level.var_50c7b4b50d222c0]);
                                    namespace_bc7b29dcc022d887::equipBackpackItem(index);
                                }
                            }
                        } else {
                            self notify("remove_munition_on_use");
                            self notify("killstreak_use_finished", munition.ref);
                        }
                    }
                }
            }
            break;
        default: 
            break;
        }
    }
}

// Namespace munitions / namespace_94359011b63230a6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1db6
// Size: 0x3c
function function_e9bcf4a2a0e6dc79(ref) {
    self endon("disconnect");
    flag_set("player_demigod");
    self waittillmatch("killstreak_deploy_finished", ref);
    flag_clear("player_demigod");
    function_3f1ccafed0f5caee();
}

// Namespace munitions / namespace_94359011b63230a6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1dfa
// Size: 0x71
function function_6dba5503031bcc38(ref) {
    self endon("disconnect");
    ref = function_9ee17a338bde061b(ref);
    flag_set("player_demigod");
    flag_set("player_using_munition");
    level.var_f2dd7048c6084bbe = ref;
    self waittillmatch("killstreak_use_finished", ref);
    flag_clear("player_demigod");
    flag_clear("player_using_munition");
    level.var_f2dd7048c6084bbe = undefined;
    function_3f1ccafed0f5caee();
}

// Namespace munitions / namespace_94359011b63230a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e73
// Size: 0x49
function function_3f1ccafed0f5caee() {
    if (isdefined(self.oobendtime) && gettime() >= self.oobendtime) {
        if (isdefined(self.last_good_pos)) {
            self setorigin(self.last_good_pos);
            return;
        }
        scripts\cp\cp_outofbounds::playeroutoftimecallback();
    }
}

// Namespace munitions / namespace_94359011b63230a6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ec4
// Size: 0x4fe
function player_can_use_munitions(reason) {
    if (istrue(level.disable_munitions)) {
        thread scripts\cp\utility::hint_prompt("munition_unavailable", 1, 2);
        return false;
    }
    if (istrue(self.disable_munitions)) {
        thread scripts\cp\utility::hint_prompt("munition_unavailable", 1, 2);
        return false;
    }
    if (!isdefined(self.munition_slots)) {
        if (reason) {
            iprintlnbold("self.munition_slots undefined");
        }
        return false;
    }
    if (self isonladder()) {
        if (reason) {
            iprintlnbold("IsOnLadder() failed");
        }
        return false;
    }
    if (istrue(self.spectating)) {
        if (reason) {
            iprintlnbold("self.spectating");
        }
        return false;
    }
    if (isdefined(self.currentpiece)) {
        if (reason) {
            iprintlnbold("self.currentPiece defined");
        }
        return false;
    }
    if (istrue(self.is_fast_traveling)) {
        if (reason) {
            iprintlnbold("self.is_fast_traveling");
        }
        return false;
    }
    if (istrue(self.inlaststand)) {
        if (reason) {
            iprintlnbold("self.inLastStand");
        }
        return false;
    }
    if (istrue(self.instant_revive_buffer)) {
        if (reason) {
            iprintlnbold("self.instant_revive_buffer");
        }
        return false;
    }
    if (istrue(self.isreviving)) {
        if (reason) {
            iprintlnbold("self.isReviving");
        }
        return false;
    }
    if (isdefined(self.placementmodel)) {
        if (reason) {
            iprintlnbold("self.placementModel defined");
        }
        return false;
    }
    if (istrue(self.iscarrying)) {
        if (reason) {
            iprintlnbold("self.isCarrying");
        }
        return false;
    }
    if (isdefined(self.hostagecarried)) {
        if (reason) {
            iprintlnbold("self.hostageCarried defined");
        }
        return false;
    }
    if (istrue(self.bgivensentry)) {
        if (reason) {
            iprintlnbold("self.bGivenSentry");
        }
        return false;
    }
    if (istrue(self.tablet_out)) {
        if (reason) {
            iprintlnbold("self.tablet_out");
        }
        return false;
    }
    if (istrue(self.b_in_vehicle)) {
        if (reason) {
            iprintlnbold("self.b_in_vehicle");
        }
        thread scripts\cp\utility::hint_prompt("munition_unavailable", 1, 2);
        return false;
    }
    if (istrue(self.waiting_to_spawn)) {
        if (reason) {
            iprintlnbold("self.waiting_to_spawn");
        }
        return false;
    }
    if (self isparachuting()) {
        if (reason) {
            iprintlnbold("self IsParachuting()");
        }
        return false;
    }
    if (self isskydiving()) {
        if (reason) {
            iprintlnbold("self IsSkydiving()");
        }
        return false;
    }
    if (isdefined(self.currentturret)) {
        if (reason) {
            iprintlnbold("self.currentTurret defined");
        }
        return false;
    }
    if (istrue(self.respawn_in_progress)) {
        if (reason) {
            iprintlnbold("respawn in progress");
        }
        return false;
    }
    if (istrue(self.isjuggernaut)) {
        if (reason) {
            iprintlnbold("self.isJuggernaut");
        }
        return false;
    }
    if (isdefined(level.nuclear_core_carrier) && level.nuclear_core_carrier == self) {
        if (reason) {
            iprintlnbold("self is nuclear core carrier");
        }
        thread scripts\cp\utility::hint_prompt("munition_unavailable", 1, 2);
        return false;
    }
    if (namespace_d4aab8c9cb8ecb14::player_in_laststand(self)) {
        if (reason) {
            iprintlnbold("player in last stand");
        }
        return false;
    }
    if (istrue(self.islockedinkidnapanim)) {
        if (reason) {
            iprintlnbold("self.isLockedInKidnapAnim");
        }
        return false;
    }
    if (self isjumping()) {
        if (reason) {
            iprintlnbold("self IsJumping()");
        }
        return false;
    }
    if (self isswimming()) {
        if (reason) {
            iprintlnbold("self IsSwimming()");
        }
        return false;
    }
    if (!self isonground() && !self isswimming()) {
        if (reason) {
            iprintlnbold("self not IsOnGround()");
        }
        return false;
    }
    if (istrue(self.usingobject)) {
        if (reason) {
            iprintlnbold("self.usingObject");
        }
        return false;
    }
    if (istrue(self.is_riding_heli)) {
        if (reason) {
            iprintlnbold("self.is_riding_heli");
        }
        return false;
    }
    if (istrue(level.regroup_process_started)) {
        if (reason) {
            iprintlnbold(" Regroup to plane started so disabled Munitions till process is complete");
        }
        return false;
    }
    if (istrue(self.dropping_minigun)) {
        if (reason) {
            iprintlnbold("Still dropping minigun");
        }
        return false;
    }
    if (istrue(self.super_activated)) {
        if (self.super.supername == "role_hunter" || self.super.supername == "role_engineer") {
            if (reason) {
                iprintlnbold("Super ability still active");
            }
            return false;
        }
    }
    if (istrue(self.gascoughinprogress)) {
        if (reason) {
            iprintlnbold("gas cough in progress");
        }
        return false;
    }
    if (istrue(self.using_mun)) {
        if (reason) {
            iprintlnbold("still using munition");
        }
        return false;
    }
    if (!val::get("cp_munitions")) {
        if (reason) {
            iprintlnbold("munitions are not allowed");
        }
        return false;
    }
    if (istrue(self.var_d5af94588739718c)) {
        if (reason) {
            iprintlnbold("using cctv");
        }
        return false;
    }
    if (istrue(self.var_23a6763562820c70)) {
        if (reason) {
            iprintlnbold("using oxygen");
        }
        return false;
    }
    if (istrue(self.oob)) {
        if (reason) {
            iprintlnbold("player out of bounds");
        }
        return false;
    }
    return true;
}

// Namespace munitions / namespace_94359011b63230a6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23cb
// Size: 0xd
function should_drop_minigun(ref) {
    return true;
}

// Namespace munitions / namespace_94359011b63230a6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x23e1
// Size: 0x4d
function remove_munition_on_use(ref, val) {
    self notify("remove_munition_on_use");
    self endon("remove_munition_on_use");
    if (istrue(level.unlimitedmunitions)) {
        return;
    }
    thread send_munition_used_notify(ref, val);
    ref = self waittill("munitions_used");
    remove_munition(val, ref);
}

// Namespace munitions / namespace_94359011b63230a6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2436
// Size: 0x6c
function send_munition_used_notify(ref, val) {
    switch (ref) {
    case #"hash_349713b5ad494dda":
    case #"hash_b55ba82d2cec3b73": 
        self waittill("chopper_gunner_used");
        break;
    case #"hash_b161e185f1b8e117": 
        self waittill("auto_drone_used");
        break;
    default: 
        return;
    }
    self notify("munitions_used", ref);
}

// Namespace munitions / namespace_94359011b63230a6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x24aa
// Size: 0x48
function is_instant_use_munition(ref) {
    switch (ref) {
    case #"hash_413c38e72fe8b5bf":
    case #"hash_58136b573f30f5be":
    case #"hash_634b246c3da5c56f":
    case #"hash_eca3b9673d38fd59": 
        return true;
    }
    return false;
}

// Namespace munitions / namespace_94359011b63230a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24fb
// Size: 0x78
function mun_test_monitor() {
    self endon("disconnect");
    var_251347bbd289c8b3 = level.disable_nvg;
    while (true) {
        var_36012b041de2be87 = getdvar(@"hash_f98dd172396621e2", "");
        if (var_36012b041de2be87 != "") {
            scripts\cp\utility::function_7bb9f9b4dc700888();
            scripts\cp\equipment\nvg::removenvg();
        } else if (!istrue(level.disable_nvg)) {
            scripts\cp\equipment\nvg::runnvg();
        }
        wait 0.1;
    }
}

// Namespace munitions / namespace_94359011b63230a6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x257b
// Size: 0x18
function update_lua_inventory_slot(var_b8e029c9896f52b6) {
    self setclientomnvar("cp_munition_sel_slot_idx", var_b8e029c9896f52b6);
}

// Namespace munitions / namespace_94359011b63230a6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x259b
// Size: 0x2c
function get_selection_index_loop_around(var_c3dd56819f77263b, min_value, max_value) {
    if (var_c3dd56819f77263b > max_value) {
        return min_value;
    }
    if (var_c3dd56819f77263b < min_value) {
        return max_value;
    }
    return var_c3dd56819f77263b;
}

// Namespace munitions / namespace_94359011b63230a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25d0
// Size: 0x8d
function clear_legacy_pickup_munitions() {
    self endon("disconnect");
    level endon("game_ended");
    self setclientomnvar("reset_wave_loadout", 5);
    wait 0.5;
    self setplayerdata("cp", "alienSession", "escapedRank0", 0);
    self setplayerdata("cp", "alienSession", "escapedRank1", 0);
    self setplayerdata("cp", "alienSession", "escapedRank2", 0);
    total_slots = level.var_3a7f3e66e1a1d8f5;
    reset_munitions(self, total_slots);
    assign_lowest_full_slot_to_active();
}

// Namespace munitions / namespace_94359011b63230a6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2665
// Size: 0x5c7
function reset_munitions(player, total_slots) {
    player notify("reset_munitions");
    var_794a764136e46006 = [];
    total_slots = level.var_3a7f3e66e1a1d8f5;
    for (i = 0; i < total_slots; i++) {
        if (isdefined(player.munition_slots) && isdefined(player.munition_slots[i]) && isdefined(player.munition_slots[i].cooldown_progress)) {
            var_794a764136e46006[i] = player.munition_slots[i].cooldown_progress;
        } else {
            var_794a764136e46006[i] = undefined;
        }
        var_a52c671acca08378 = player namespace_751288259782653c::cac_getloadoutselectedidx();
        if (!isdefined(player.munition_slots) || !isdefined(player.munition_slots[i])) {
            player.munition_slots[i] = spawnstruct();
        }
        player.munitions_in_playerdata[i] = spawnstruct();
        if (namespace_162cff1cf88b9bbf::allow_munitions(player)) {
            player.munition_slots[i].ref = player get_munition(i);
            player.munitions_in_playerdata[i].ref = player.munition_slots[i].ref;
            player.munition_slots[i].cooldown = level.munitions_table_data[player.munition_slots[i].ref].cooldown;
            player.munition_slots[i].can_use = 0;
            player.munition_slots[i].cooldown_progress = undefined;
            if (isdefined(var_794a764136e46006[i])) {
                player.munition_slots[i].cooldown_progress = var_794a764136e46006[i];
            }
            if (!istrue(level.unlimitedmunitions)) {
                player.munition_slots[i].can_use = 0;
                if (!scripts\cp\loot_system::is_empty_or_none(i)) {
                    player setclientomnvar("cp_munition_1_timer", 1);
                    player setclientomnvar("cp_munition_2_timer", 1);
                    player setclientomnvar("cp_munition_3_timer", 1);
                    player setclientomnvar("cp_munition_4_timer", 1);
                    player.munition_slots[i].can_use = 1;
                }
            }
        } else if (!isdefined(player.init_munitions)) {
            player.munition_slots[i].ref = "none";
            player.munition_slots[i].cooldown = level.munitions_table_data[player.munition_slots[i].ref].cooldown;
            player.munition_slots[i].can_use = 0;
            player.munition_slots[i].cooldown_progress = undefined;
        }
        omnvar = undefined;
        var_a413dae711968957 = "cp_munition_slot_reset";
        slot = undefined;
        switch (i) {
        case 0: 
            omnvar = "cp_munition_slot_1";
            slot = 1;
            break;
        case 1: 
            omnvar = "cp_munition_slot_2";
            slot = 2;
            break;
        case 2: 
            omnvar = "cp_munition_slot_3";
            slot = 3;
            break;
        case 3: 
            omnvar = "cp_munition_slot_4";
            slot = 4;
            break;
        }
        index = level.munitions_table_data[player.munition_slots[i].ref].index;
        if (isdefined(omnvar) && isdefined(index) && isdefined(slot)) {
            player setclientomnvar(omnvar, index);
        }
    }
    if (!isdefined(player.init_munitions)) {
        player.init_munitions = 1;
    }
    if (!isdefined(player.loadout_changed_flag)) {
        player.loadout_changed_flag = 0;
    }
    if (player.loadout_changed_flag == 0) {
        new_value = 1;
    } else {
        new_value = 0;
    }
    player setclientomnvar("cp_loadout_changed", new_value);
    player.loadout_changed_flag = new_value;
    if (istrue(level.unlimitedmunitions)) {
        player thread cooldown_munition("munition_1_used", "cp_munition_1_timer", player, player.munition_slots[0].ref, player.munition_slots[0].cooldown, 0);
        player thread cooldown_munition("munition_2_used", "cp_munition_2_timer", player, player.munition_slots[1].ref, player.munition_slots[1].cooldown, 1);
        player thread cooldown_munition("munition_3_used", "cp_munition_3_timer", player, player.munition_slots[2].ref, player.munition_slots[2].cooldown, 2);
        player thread cooldown_munition("munition_4_used", "cp_munition_4_timer", player, player.munition_slots[3].ref, player.munition_slots[3].cooldown, 3);
    }
}

// Namespace munitions / namespace_94359011b63230a6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c34
// Size: 0x24
function function_af07aad35b55fd73(var_e0190c3433d5b099) {
    if (!isdefined(var_e0190c3433d5b099)) {
        return false;
    }
    if (issubstr(var_e0190c3433d5b099, "brloot_munition")) {
        return true;
    }
    return false;
}

// Namespace munitions / namespace_94359011b63230a6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c61
// Size: 0x8c
function get_munition(var_a52c671acca08378) {
    if (is_wave_gametype()) {
        munition = self getplayerdata(level.loadoutsgroup, "squadMembers", "munitionWaveModeSetups", var_a52c671acca08378, "munition");
    } else if (function_a3577e8e6c88a56b() || function_240f7f4e57340e8f()) {
        return "none";
    } else {
        if (var_a52c671acca08378 == 3) {
            return "none";
        }
        munition = self getplayerdata(level.loadoutsgroup, "squadMembers", "munitionSetups", var_a52c671acca08378, "munition");
    }
    return munition;
}

// Namespace munitions / namespace_94359011b63230a6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2cf6
// Size: 0x3b
function get_role_munition(var_a52c671acca08378) {
    var_36012b041de2be87 = undefined;
    /#
        if (!isdefined(var_36012b041de2be87)) {
            println("<dev string:x1e>");
        } else {
            println("<dev string:x41>" + var_36012b041de2be87);
        }
    #/
    return var_36012b041de2be87;
}

// Namespace munitions / namespace_94359011b63230a6
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x2d3a
// Size: 0x334
function cooldown_munition(var_f00b93a05196f767, var_a64c51188d789c25, player, munition, cooldown_time, slot, var_1207e043696ebaf9) {
    level endon("game_ended");
    player endon("disconnect");
    player endon("reset_munitions");
    player notify(var_f00b93a05196f767 + "_reset");
    player endon(var_f00b93a05196f767 + "_reset");
    var_395fc479a3ccd472 = cooldown_time;
    var_713b970f6576a5c9 = getdvarfloat(@"hash_c2da12edf7170dd7", 1);
    cooldown_time = var_395fc479a3ccd472 * var_713b970f6576a5c9;
    splash_shown = undefined;
    while (true) {
        paused = 0;
        if (flag_exist("infil_complete") && !flag("infil_complete")) {
            paused = 1;
        }
        if (paused) {
            waitframe();
            continue;
        }
        if (!isdefined(player.munition_slots[slot].cooldown_progress)) {
            player.munition_slots[slot].cooldown_progress = 0;
            player setclientomnvar(var_a64c51188d789c25, 0);
        }
        if (istrue(var_1207e043696ebaf9)) {
            player.munition_slots[slot].cooldown_progress = cooldown_time;
            player setclientomnvar(var_a64c51188d789c25, 1);
            var_1207e043696ebaf9 = undefined;
        }
        if (player.munition_slots[slot].cooldown_progress < cooldown_time) {
            player.munition_slots[slot].can_use = 0;
        }
        while (player.munition_slots[slot].cooldown_progress <= cooldown_time) {
            var_6e96934d67c36a7c = getdvarfloat(@"hash_c2da12edf7170dd7", 1);
            if (var_6e96934d67c36a7c != var_713b970f6576a5c9) {
                var_713b970f6576a5c9 = var_6e96934d67c36a7c;
                cooldown_time = var_395fc479a3ccd472 * var_713b970f6576a5c9;
            }
            if (istrue(player.has_inv_cooldown)) {
                player.munition_slots[slot].cooldown_progress = cooldown_time + 1;
            }
            if (cooldown_time == 0) {
                progress_ratio = 1;
            } else {
                progress_ratio = min(player.munition_slots[slot].cooldown_progress / cooldown_time, 1);
            }
            player setclientomnvar(var_a64c51188d789c25, progress_ratio);
            if (progress_ratio < 1) {
                var_28d1299402599124 = 0.05;
                player.munition_slots[slot].cooldown_progress = player.munition_slots[slot].cooldown_progress + var_28d1299402599124;
            } else {
                break;
            }
            wait 0.05;
        }
        player.munition_slots[slot].can_use = 1;
        splashref = "cp_" + munition;
        if (istrue(splash_shown)) {
            player thread scripts\cp\cp_hud_message::showsplash(splashref, undefined, self);
        }
        splash_shown = 1;
        player waittill(var_f00b93a05196f767);
        player.munition_slots[slot].cooldown_progress = undefined;
        player.munition_slots[slot].can_use = 0;
        player.munition_slots[slot].source = undefined;
    }
}

// Namespace munitions / namespace_94359011b63230a6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3076
// Size: 0x94
function remove_munition_from_array(slot, munition) {
    for (i = 0; i < self.munition_slots.size; i++) {
        if (isdefined(self.munitions_in_playerdata[i]) && self.munitions_in_playerdata[i].ref == munition) {
            if (i == slot) {
                self setclientomnvar("cp_munition_slot_reset", i);
            }
            self.munitions_in_playerdata[i] = undefined;
            self.munition_slots[slot].source = undefined;
            break;
        }
    }
}

// Namespace munitions / namespace_94359011b63230a6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3112
// Size: 0x47
function munition_source_getridof(name) {
    var_38cc1dc20c14e9d0 = 0;
    switch (name) {
    case #"hash_11f18aa9ebd8bac6":
    case #"hash_52a1df2f94f2cfe5": 
        var_38cc1dc20c14e9d0 = 1;
        break;
    }
    if (var_38cc1dc20c14e9d0) {
        return true;
    }
    return false;
}

// Namespace munitions / namespace_94359011b63230a6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3162
// Size: 0x9f
function can_use_munition(slot) {
    if (self.munition_slots[slot].ref == "juggernaut" && istrue(self.isjuggernaut)) {
        return false;
    }
    if (self.munition_slots[slot].ref == "gunship" && istrue(level.gunshipinuse)) {
        return false;
    }
    if (self getcurrentweapon().basename == "tac_cover_mp") {
        return false;
    }
    if (istrue(self.munition_slots[slot].can_use)) {
        return true;
    }
    return false;
}

// Namespace munitions / namespace_94359011b63230a6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x320a
// Size: 0x18b
function remove_munition(slot, munition) {
    remove_munition_from_array(slot, munition);
    var_1dd5348e4e741473 = "none";
    if (slot == 0) {
        var_1dd5348e4e741473 = "empty1";
        self setplayerdata("cp", "alienSession", "escapedRank0", 0);
    } else if (slot == 1) {
        var_1dd5348e4e741473 = "empty2";
        self setplayerdata("cp", "alienSession", "escapedRank1", 0);
    } else if (slot == 2) {
        var_1dd5348e4e741473 = "empty3";
        self setplayerdata("cp", "alienSession", "escapedRank2", 0);
    }
    give_munition_to_slot(var_1dd5348e4e741473, slot);
    var_a64c51188d789c25 = "cp_munition_1_timer";
    switch (slot) {
    case 0: 
        var_a64c51188d789c25 = "cp_munition_1_timer";
        break;
    case 1: 
        var_a64c51188d789c25 = "cp_munition_2_timer";
        break;
    case 2: 
        var_a64c51188d789c25 = "cp_munition_3_timer";
        break;
    case 3: 
        var_a64c51188d789c25 = "cp_munition_4_timer";
        break;
    }
    self setclientomnvar(var_a64c51188d789c25, 0);
    check_for_empty_munitions();
    assign_highest_full_slot_to_active();
    checkpoint = scripts\cp\cp_checkpoint::function_9eed75023a958c18();
    if (isdefined(checkpoint) && checkpoint != "" && isdefined(self.pers["last_checkpoint"]) && self.pers["last_checkpoint"] != checkpoint) {
        thread namespace_751288259782653c::function_7da7bd24b280d295();
    }
    self notify("munition_removed");
}

// Namespace munitions / namespace_94359011b63230a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x339d
// Size: 0x8a
function check_for_empty_munitions() {
    munition_slots_full = 0;
    total_slots = self getplayerdata("cp", "inventorySlots", "totalSlots");
    for (i = 0; i < total_slots; i++) {
        if (isdefined(self.munition_slots) && isdefined(self.munition_slots[i])) {
            if (!scripts\cp\loot_system::is_empty_or_none(i)) {
                munition_slots_full += 1;
            }
        }
    }
    self.munition_slots_full = munition_slots_full;
    self setclientomnvar("cp_munition_slots_full", munition_slots_full);
}

// Namespace munitions / namespace_94359011b63230a6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x342f
// Size: 0x76
function function_346cde477a4fef90(var_5a8f1accec64dc4a) {
    i = 0;
    foreach (slot in self.munition_slots) {
        if (slot.ref == var_5a8f1accec64dc4a) {
            return i;
        }
        i++;
    }
    return undefined;
}

// Namespace munitions / namespace_94359011b63230a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34ae
// Size: 0x7c
function assign_highest_full_slot_to_active() {
    empty_slots = 0;
    for (i = self.munition_slots.size - 1; i > -1; i--) {
        if (!scripts\cp\loot_system::is_empty_or_none(i)) {
            self.dpad_selection_index = i;
            break;
        }
        empty_slots += 1;
    }
    if (empty_slots == self.munition_slots.size) {
        self.dpad_selection_index = 0;
    }
    update_lua_inventory_slot(self.dpad_selection_index);
}

// Namespace munitions / namespace_94359011b63230a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3532
// Size: 0x78
function assign_lowest_full_slot_to_active() {
    empty_slots = 0;
    for (i = 0; i < self.munition_slots.size; i++) {
        if (!scripts\cp\loot_system::is_empty_or_none(i)) {
            self.dpad_selection_index = i;
            break;
        }
        empty_slots += 1;
    }
    if (empty_slots == self.munition_slots.size) {
        self.dpad_selection_index = 0;
    }
    update_lua_inventory_slot(self.dpad_selection_index);
}

// Namespace munitions / namespace_94359011b63230a6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x35b2
// Size: 0x68
function has_munition(var_5940a3ac5c0c822c) {
    foreach (slot in self.munition_slots) {
        if (slot.ref == var_5940a3ac5c0c822c) {
            return true;
        }
    }
    return false;
}

// Namespace munitions / namespace_94359011b63230a6
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3623
// Size: 0x4f6
function give_munition_to_slot(munition, slot, source, var_e2c50da23374b895) {
    if (function_240f7f4e57340e8f()) {
        assertex(slot == 0, "Slot must be " + 0);
    }
    total_slots = update_total_slots(slot);
    player = self;
    if (!isdefined(slot)) {
        slot = total_slots - 1;
    }
    if (!isdefined(var_e2c50da23374b895)) {
        var_e2c50da23374b895 = 1;
    }
    if (!isdefined(self.munition_slots) || !isdefined(self.munition_slots[slot])) {
        self.munition_slots[slot] = spawnstruct();
    }
    if (function_240f7f4e57340e8f()) {
        self.munition_slots[slot].ref = function_77cbcaf60caaf605(munition);
    } else {
        self.munition_slots[slot].ref = munition;
    }
    self.munition_slots[slot].cooldown = level.munitions_table_data[self.munition_slots[slot].ref].cooldown;
    self.munition_slots[slot].can_use = 1;
    self.munition_slots[slot].cooldown_progress = 1;
    if (isdefined(source)) {
        self.munition_slots[slot].source = source;
        if (isdefined(self.munition_slots[slot].source) && munition_source_getridof(self.munition_slots[slot].source)) {
            if (slot == 0) {
                self setplayerdata("cp", "alienSession", "escapedRank0", 1);
            } else if (slot == 1) {
                self setplayerdata("cp", "alienSession", "escapedRank1", 1);
            } else if (slot == 2) {
                self setplayerdata("cp", "alienSession", "escapedRank2", 1);
            }
        }
    }
    if (munition == "none") {
        if (isdefined(self.munition_slots[slot].source)) {
            self.munition_slots[slot].source = undefined;
        }
    }
    total_slots = self getplayerdata("cp", "inventorySlots", "totalSlots");
    omnvar = undefined;
    splashref = player check_for_gl_proj_override(munition);
    if (!istrue(self.munition_splash_supress)) {
        splashref = "cp_" + splashref;
    }
    player thread scripts\cp\cp_hud_message::showsplash(splashref, undefined, self);
    switch (slot) {
    case 0: 
        omnvar = "cp_munition_slot_1";
        player thread cooldown_munition("munition_1_used", "cp_munition_1_timer", player, player.munition_slots[0].ref, player.munition_slots[0].cooldown, 0, 1);
        break;
    case 1: 
        omnvar = "cp_munition_slot_2";
        player thread cooldown_munition("munition_2_used", "cp_munition_2_timer", player, player.munition_slots[1].ref, player.munition_slots[1].cooldown, 1, 1);
        break;
    case 2: 
        omnvar = "cp_munition_slot_3";
        player thread cooldown_munition("munition_3_used", "cp_munition_3_timer", player, player.munition_slots[2].ref, player.munition_slots[2].cooldown, 2, 1);
        break;
    case 3: 
        omnvar = "cp_munition_slot_4";
        player thread cooldown_munition("munition_4_used", "cp_munition_4_timer", player, player.munition_slots[3].ref, player.munition_slots[3].cooldown, 3, 1);
        break;
    }
    index = level.munitions_table_data[player.munition_slots[slot].ref].index;
    if (isdefined(omnvar) && isdefined(index)) {
        player setclientomnvar(omnvar, index);
    }
    if (istrue(var_e2c50da23374b895) && getdvarint(@"hash_210d16e93f2436f5", 0) == 0) {
        player thread nag_munitions();
    }
    if (isdefined(player.munition_slots_full) && player.munition_slots_full == 0) {
        player check_for_empty_munitions();
    }
    if (munition == "nvg") {
        player function_b1e64d364cf55b73(player has_munition("nvg"));
    }
    if (munition != "empty1") {
        level notify("munition_pickup", munition);
    }
}

// Namespace munitions / namespace_94359011b63230a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b21
// Size: 0xa
function function_d3e4275ca1bc1207() {
    self notify("nag_munitions");
}

// Namespace munitions / namespace_94359011b63230a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b33
// Size: 0x98
function nag_munitions() {
    self notify("nag_munitions");
    self endon("nag_munitions");
    self endon("disconnect");
    wait 12;
    if (getdvarint(@"hash_6978b3f150582c40", 1)) {
        self notify("nag_munitions");
    }
    count = 0;
    while (count < 2) {
        if (istrue(self.var_7269deeba689cd65)) {
            self clearhudtutorialmessage();
            wait 5;
            return;
        }
        if (!namespace_d4aab8c9cb8ecb14::player_in_laststand(self)) {
            if (!function_9e1ff2e695fd901d()) {
                scripts\cp\cp_hud_message::tutorialprint(%COOP_GAME_PLAY/USE_MUNITION_NAG, 2);
            } else {
                return;
            }
            count++;
            wait 30;
            continue;
        }
        count++;
        wait 30;
    }
}

// Namespace munitions / namespace_94359011b63230a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3bd3
// Size: 0x31
function function_9e1ff2e695fd901d() {
    for (i = 0; i < self.munition_slots.size; i++) {
        if (!scripts\cp\loot_system::is_empty_or_none(i)) {
            return false;
        }
    }
    return true;
}

// Namespace munitions / namespace_94359011b63230a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c0d
// Size: 0x31
function function_50be8abfe68ddbfc() {
    for (i = 0; i < self.munition_slots.size; i++) {
        if (scripts\cp\loot_system::is_empty_or_none(i)) {
            return true;
        }
    }
    return false;
}

// Namespace munitions / namespace_94359011b63230a6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c47
// Size: 0x67
function update_total_slots(slot) {
    if (!isdefined(slot)) {
        slot = 5;
    }
    total_slots = self getplayerdata("cp", "inventorySlots", "totalSlots");
    if (slot >= total_slots && total_slots < level.var_3a7f3e66e1a1d8f5) {
        total_slots += 1;
    }
    self setplayerdata("cp", "inventorySlots", "totalSlots", total_slots);
    return total_slots;
}

// Namespace munitions / namespace_94359011b63230a6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3cb7
// Size: 0x44
function check_for_gl_proj_override(munition) {
    player = self;
    if (munition == "grenade_launcher" && isdefined(player.gl_proj_override)) {
        return (player.gl_proj_override + "_proj");
    }
    return munition;
}

// Namespace munitions / namespace_94359011b63230a6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3d04
// Size: 0x1bb
function remove_munitions_in_radius(org, radius, var_7c64e39970c639fa) {
    radius_sq = radius * radius;
    throttle = 20;
    if (isdefined(var_7c64e39970c639fa)) {
        throttle = var_7c64e39970c639fa;
    }
    var_7507f409fee2b657 = ["brloot_munition", "brloot_munition_airdrop", "brloot_munition_ammo", "brloot_munition_armor", "brloot_munition_c4_launcher", "brloot_munition_cluster_strike", "brloot_munition_cruise_missile", "brloot_munition_cruise_predator", "brloot_munition_deployable_cover", "brloot_munition_grenade_crate", "brloot_munition_grenade_launcher", "brloot_munition_juggernaut", "brloot_munition_precision_airstrike", "brloot_munition_thermite_launcher", "brloot_munition_trophysystem", "brloot_munition_turret", "brloot_munition_uav", "brloot_munition_white_phos"];
    foreach (name in var_7507f409fee2b657) {
        var_792740c4c87cf9fa = getentitylessscriptablearray(undefined, undefined, org, radius, name);
        count = 0;
        foreach (var_31f869647e8740b4 in var_792740c4c87cf9fa) {
            var_31f869647e8740b4 setscriptablepartstate(name, "hidden");
            count++;
            if (count % throttle) {
                wait 0.1;
            }
        }
        wait 0.1;
    }
}

// Namespace munitions / namespace_94359011b63230a6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3ec7
// Size: 0x170
function remove_munitions_globally(var_1d88cbbb14926330) {
    var_7507f409fee2b657 = ["brloot_munition", "brloot_munition_airdrop", "brloot_munition_ammo", "brloot_munition_armor", "brloot_munition_c4_launcher", "brloot_munition_cluster_strike", "brloot_munition_cruise_missile", "brloot_munition_cruise_predator", "brloot_munition_deployable_cover", "brloot_munition_grenade_crate", "brloot_munition_grenade_launcher", "brloot_munition_juggernaut", "brloot_munition_precision_airstrike", "brloot_munition_thermite_launcher", "brloot_munition_trophysystem", "brloot_munition_turret", "brloot_munition_uav", "brloot_munition_white_phos"];
    if (isdefined(var_1d88cbbb14926330)) {
        var_7507f409fee2b657 = var_1d88cbbb14926330;
    }
    foreach (name in var_7507f409fee2b657) {
        var_53db3afb46ea6459 = getentitylessscriptablearray(undefined, undefined, undefined, undefined, name);
        foreach (var_31f869647e8740b4 in var_53db3afb46ea6459) {
            var_31f869647e8740b4 setscriptablepartstate(name, "hidden");
        }
        wait 0.1;
    }
}

// Namespace munitions / namespace_94359011b63230a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x403f
// Size: 0x14b
function givegrenadelauncher() {
    self.last_weapon = self getcurrentweapon();
    if (istrue(self.has_gl)) {
        var_c4adb5b8c25725b6 = self.equippedweapons;
        foreach (gun in var_c4adb5b8c25725b6) {
            if (gun.basename == "iw9_la_mike32_mp") {
                clip_size = weaponclipsize(gun);
                self setweaponammoclip(gun, clip_size);
            }
        }
    } else {
        var_37ede289a37ef621 = "iw9_la_mike32_mp";
        gun = namespace_e0ee43ef2dddadaa::buildweapon(var_37ede289a37ef621);
        self giveweapon(gun);
        clip_size = weaponclipsize(gun);
        self setweaponammoclip(gun, clip_size);
        self setweaponammostock(gun, 0);
        self switchtoweapon(gun);
        self.has_gl = 1;
        val::set("give_grenade_launcher", "weapon_pickup", 0);
        disable_backpack_inventory(1);
        self.var_74a98fc784d043a0 = self.disable_munitions;
        self.disable_munitions = 1;
        thread remove_at_ammo_count(gun.basename, 0);
    }
    self notify("munitions_used", "grenade_launcher");
}

// Namespace munitions / namespace_94359011b63230a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4192
// Size: 0x17
function function_dd25d8d11acb070() {
    wait 1;
    self waittill("weapon_switch_started");
    self.has_gl = undefined;
}

// Namespace munitions / namespace_94359011b63230a6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x41b1
// Size: 0x176
function remove_at_ammo_count(weapon_name, ammo_count) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("weapon_removed");
    childthread function_dd25d8d11acb070();
    weapon = undefined;
    list = self getweaponslist("primary");
    foreach (weap in list) {
        if (weap.basename == weapon_name) {
            weapon = weap;
            break;
        }
    }
    if (isdefined(weapon)) {
        while (true) {
            var_337043bba3301b3c = self getammocount(weapon);
            if (var_337043bba3301b3c <= ammo_count) {
                break;
            }
            if (!isdefined(self.has_gl)) {
                break;
            }
            waitframe();
        }
        val::reset_all("give_grenade_launcher");
        disable_backpack_inventory(0);
        if (isdefined(self.var_74a98fc784d043a0)) {
            self.disable_munitions = self.var_74a98fc784d043a0;
            self.var_74a98fc784d043a0 = undefined;
        } else {
            self.disable_munitions = 0;
        }
        self takeweapon(weapon);
        weapontoswitch = getweapontoswitchbackto();
        success = thread scripts\cp\cp_weapons::switchtoweaponreliable(weapontoswitch, 0);
        self.has_gl = undefined;
        self notify("weapon_removed", "grenade_launcher");
    }
}

// Namespace munitions / namespace_94359011b63230a6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x432f
// Size: 0x8d0
function giveitembasedoncraftingstruct(crafteditem) {
    deployable = 1;
    self.var_7269deeba689cd65 = 1;
    switch (crafteditem) {
    case #"hash_a693a5088100be1f": 
        self iprintln(" RESPAWN SYSTEM IS DEPRECATED. ");
        break;
    case #"hash_b55ba82d2cec3b73":
    case #"hash_349713b5ad494dda": 
        if (istrue(level.no_aerial_munitions) || scripts\cp\cp_objectives::is_objective_active("collect_nuclear_core") || scripts\cp\cp_objectives::is_objective_active("exfil_plane")) {
            /#
                self iprintln("<dev string:x5b>");
            #/
            scripts\cp\utility::hint_prompt("munition_unavailable", 1, 2);
            return false;
        }
        if (namespace_a0628d6954815ef8::player_has_minigun(self)) {
            namespace_a0628d6954815ef8::drop_minigun(self);
            scripts\cp\utility::hint_prompt("munition_unavailable", 1, 2);
            return false;
        }
        success = scripts\cp_mp\killstreaks\chopper_gunner::tryusechoppergunner();
        if (!istrue(success)) {
            return false;
        }
        break;
    case #"hash_b83560470dd3f49b": 
        success = giveammocrate();
        if (!istrue(success)) {
            return false;
        }
        break;
    case #"hash_d95dd5d6012a0de1": 
        success = function_d4d986dbfa3f3ab1();
        if (!istrue(success)) {
            return false;
        }
        break;
    case #"hash_413c38e72fe8b5bf": 
        if (istrue(level.no_aerial_munitions) || scripts\cp\cp_objectives::is_objective_active("collect_nuclear_core") || scripts\cp\cp_objectives::is_objective_active("exfil_plane")) {
            /#
                self iprintln("<dev string:x5b>");
            #/
            scripts\cp\utility::hint_prompt("munition_unavailable", 1, 2);
            return false;
        }
        if (isdefined(level.ac130_activate_function)) {
            self notify("attempt_use_gunship");
            success = self [[ level.ac130_activate_function ]]();
            if (!istrue(success)) {
                return false;
            }
        }
        scripts\cp_mp\killstreaks\gunship::tryusegunship();
        break;
    case #"hash_8c766d6477287bb6": 
        if (istrue(level.no_aerial_munitions) || scripts\cp\cp_objectives::is_objective_active("collect_nuclear_core") || scripts\cp\cp_objectives::is_objective_active("exfil_plane")) {
            /#
                self iprintln("<dev string:x5b>");
            #/
            scripts\cp\utility::hint_prompt("munition_unavailable", 1, 2);
            return false;
        }
        success = scripts\cp_mp\killstreaks\airstrike::tryuseairstrike("precision_airstrike");
        if (!success) {
            return false;
        }
        break;
    case #"hash_4ad475e6e15635bd": 
        scripts\cp_mp\killstreaks\juggernaut::tryusejuggernaut(1);
        break;
    case #"hash_e65b15f734e5ab84": 
        scripts\cp_mp\killstreaks\juggernaut::tryusejuggernaut(1, 1);
        break;
    case #"hash_eca3b9673d38fd59": 
        success = scripts\cp_mp\killstreaks\cruise_predator::tryusecruisepredator();
        if (!istrue(success)) {
            return false;
        }
        break;
    case #"hash_4c07a1218b26a890": 
        if (istrue(level.no_aerial_munitions) || scripts\cp\cp_objectives::is_objective_active("collect_nuclear_core") || scripts\cp\cp_objectives::is_objective_active("exfil_plane")) {
            /#
                self iprintln("<dev string:x5b>");
            #/
            scripts\cp\utility::hint_prompt("munition_unavailable", 1, 2);
            return false;
        }
        result = scripts\cp_mp\killstreaks\cruise_predator::tryusecruisepredator();
        if (istrue(result)) {
            break;
        } else {
            return false;
        }
    case #"hash_6414903dd56a87f8": 
        if (scripts\cp\cp_objectives::is_objective_active("collect_nuclear_core") || scripts\cp\cp_objectives::is_objective_active("exfil_plane")) {
            /#
                self iprintln("<dev string:x5b>");
            #/
            scripts\cp\utility::hint_prompt("munition_unavailable", 1, 2);
            return false;
        }
        scripts\cp_mp\killstreaks\helper_drone::tryusehelperdrone("radar_drone_recon");
        namespace_27c74152ccb91331::function_55b08d6d71b41402(self, "activate_drone");
        break;
    case #"hash_c9ce32066612c729": 
        deployable = 0;
        self notify("one_watcher_for_removing_deployables");
        giveriotshield();
        namespace_27c74152ccb91331::function_55b08d6d71b41402(self, "killstreak_used");
        break;
    case #"hash_65872b6ad36f2e8a": 
        deployable = 0;
        self notify("one_watcher_for_removing_deployables");
        givegrenadelauncher();
        namespace_27c74152ccb91331::function_55b08d6d71b41402(self, "killstreak_used");
        break;
    case #"hash_25789111b74943b4": 
        success = givearmorcrate();
        if (!istrue(success)) {
            return false;
        }
        namespace_27c74152ccb91331::function_55b08d6d71b41402(self, "killstreak_used");
        break;
    case #"hash_52d9b7ed584bec3e": 
        if (!istrue(self.bgivensentry)) {
            scripts\cp_mp\killstreaks\manual_turret::tryusemanualturret("manual_turret");
        }
        break;
    case #"hash_fa4536bde6f7ad9":
    case #"hash_74e2f521aa352a6a": 
        if (!istrue(self.bgivensentry)) {
            success = scripts\cp_mp\killstreaks\sentry_gun::tryusesentryturret("sentry_gun");
            if (!success) {
                return false;
            }
        }
        break;
    case #"hash_b571a6187bf67f9e": 
        success = namespace_6420d3dce7f35553::function_463f566c8cfddea5("missile_turret");
        if (!istrue(success)) {
            return false;
        }
        break;
    case #"hash_634b246c3da5c56f": 
        if (istrue(level.no_aerial_munitions) || scripts\cp\cp_objectives::is_objective_active("collect_nuclear_core") || scripts\cp\cp_objectives::is_objective_active("exfil_plane")) {
            /#
                self iprintln("<dev string:x5b>");
            #/
            scripts\cp\utility::hint_prompt("munition_unavailable", 1, 2);
            return false;
        }
        if (self.skipuavupdate == 0) {
            scripts\cp\utility::hint_prompt("munition_unavailable", 1, 2);
            return false;
        }
        success = scripts\cp_mp\killstreaks\uav::tryuseuav("uav");
        if (!istrue(success)) {
            return false;
        }
        namespace_27c74152ccb91331::function_55b08d6d71b41402(self, "activate_uav");
        break;
    case #"hash_6637a8e7426ba85e": 
        success = give_deployable_cover();
        if (!istrue(success)) {
            return false;
        }
        namespace_27c74152ccb91331::function_55b08d6d71b41402(self, "killstreak_used");
        break;
    case #"hash_4d35eb58f9d545f0": 
        success = namespace_39febbb7a6990e45::function_43fcf054875c96c5();
        if (!istrue(success)) {
            return false;
        }
        break;
    case #"hash_b161e185f1b8e117": 
        scripts\cp_mp\utility\killstreak_utility::starttabletscreen("auto_drone", 0.75, 0);
        success = namespace_d02a28280306d1bc::function_f5488ebdae28a1d8();
        if (!istrue(success)) {
            thread scripts\cp_mp\utility\killstreak_utility::tabletdofset(1, 1);
            return false;
        }
        break;
    case #"hash_2f437058d5eef2ac":
    case #"hash_b4ac3581c343a029": 
        if (istrue(level.no_aerial_munitions) || scripts\cp\cp_objectives::is_objective_active("collect_nuclear_core") || scripts\cp\cp_objectives::is_objective_active("exfil_plane")) {
            /#
                self iprintln("<dev string:x5b>");
            #/
            scripts\cp\utility::hint_prompt("munition_unavailable", 1, 2);
            return false;
        }
        success = scripts\cp_mp\killstreaks\toma_strike::tryusetomastrike();
        if (!success) {
            return false;
        }
        break;
    case #"hash_4059066c2be514e6": 
        thread scripts\cp\equipment\nvg::runnvg();
        break;
    case #"hash_58136b573f30f5be": 
        self giveandfireoffhand("trophy_cp");
        namespace_27c74152ccb91331::function_55b08d6d71b41402(self, "killstreak_used");
        break;
    case #"hash_1fc9d3e5733715bd": 
        scripts\cp_mp\killstreaks\white_phosphorus::tryusewpfromstruct("white_phosphorus");
        break;
    case #"hash_bf2f9adbd2b41d5": 
        scripts\cp_mp\utility\killstreak_utility::starttabletscreen("hover_jet", 0.75, 0);
        success = namespace_e70862d8d2eb291c::tryusehoverjet();
        if (!istrue(success)) {
            thread scripts\cp_mp\utility\killstreak_utility::tabletdofset(1, 1);
            return false;
        }
        self notify("munitions_used", "hover_jet");
        break;
    case #"hash_691f39dddd9116b8": 
        success = scripts\cp_mp\killstreaks\chopper_support::tryusechoppersupport("chopper_support");
        if (!istrue(success)) {
            return false;
        }
        self notify("munitions_used", "chopper_support");
        break;
    case #"hash_9e36e3bd3a9dd00d": 
        success = namespace_8a82a4967e25efd4::function_e24ef5600f59548e();
        if (!istrue(success)) {
            return false;
        }
        namespace_27c74152ccb91331::function_55b08d6d71b41402(self, "activate_drone");
        break;
    case #"hash_e3f28d3556bd7625": 
        if (istrue(level.no_aerial_munitions)) {
            scripts\cp\utility::hint_prompt("munition_unavailable", 1, 2);
            return false;
        }
        success = namespace_893ac0cf28c5af44::function_57fd8a7006975cd6();
        if (!istrue(success)) {
            return false;
        }
        namespace_27c74152ccb91331::function_55b08d6d71b41402(self, "activate_drone");
        break;
    case #"hash_19dd9a3a4147e09e": 
        success = namespace_876fdba3df4aad3::function_5dae574697e78d96();
        if (!istrue(success)) {
            return false;
        }
        break;
    case #"hash_7a687f6a4d685110": 
        if (issharedfuncdefined(crafteditem, "tryUseKillstreak")) {
            success = self [[ getsharedfunc(crafteditem, "tryUseKillstreak") ]]();
            if (!isdefined(success) || !success) {
                return false;
            }
        }
        break;
    case #"hash_a1031216158c7882": 
        success = namespace_2989abaabfa17ecb::function_10fd15ea1cbf20d7();
        if (!istrue(success)) {
            return false;
        }
        break;
    case #"hash_472d8b6c2f51a9c8": 
        success = namespace_ff6ed0238d12364f::function_81c2d38662659380();
        if (!istrue(success)) {
            return false;
        }
        break;
    case #"hash_6362d6aae3e5a62e": 
        if (isdefined(level.droneswarmactive) && level.droneswarmactive) {
            scripts\cp\cp_hud_message::showerrormessage("KILLSTREAKS/CANNOT_SWITCH");
            return false;
        } else {
            if (issharedfuncdefined("drone_swarm", "tryUseDroneSwarm ")) {
                success = self [[ getsharedfunc("drone_swarm", "tryUseDroneSwarm") ]]();
            }
            if (!isdefined(success) || !istrue(success)) {
                return false;
            }
        }
        break;
    case #"hash_56979e0566996b2e": 
        success = scripts\cp_mp\killstreaks\airdrop::tryuseairdropmarker();
        if (!istrue(success)) {
            return false;
        }
        self notify("munitions_used", "airdrop");
        break;
    }
    checkpoint = scripts\cp\cp_checkpoint::function_9eed75023a958c18();
    if (isdefined(checkpoint) && checkpoint != "" && isdefined(self.pers["last_checkpoint"]) && self.pers["last_checkpoint"] != checkpoint) {
        thread namespace_751288259782653c::function_7da7bd24b280d295();
    }
    if (deployable) {
        thread watcherforremovingdeployable();
    }
    function_ffd0ae3abd92c511(crafteditem);
    return true;
}

// Namespace munitions / namespace_94359011b63230a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c08
// Size: 0x5d
function watcherforremovingdeployable() {
    self notify("one_watcher_for_removing_deployables");
    self endon("one_watcher_for_removing_deployables");
    while (true) {
        self waittill("remove_any_active_items");
        if (isdefined(self.last_weapon)) {
            weapontoswitch = getweapontoswitchbackto();
            self switchtoweapon(weapontoswitch);
            self.last_weapon = undefined;
            clearlowermessage("crate_prompt");
        }
    }
}

// Namespace munitions / namespace_94359011b63230a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c6d
// Size: 0xd
function givearmorcrate() {
    return give_deployable_crate("iw8_armor_marker_cp");
}

// Namespace munitions / namespace_94359011b63230a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c83
// Size: 0xd
function giveammocrate() {
    return give_deployable_crate("iw8_ammo_marker_cp");
}

// Namespace munitions / namespace_94359011b63230a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c99
// Size: 0xd
function function_d4d986dbfa3f3ab1() {
    return give_deployable_crate("iw8_ammo_marker_cp");
}

// Namespace munitions / namespace_94359011b63230a6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4caf
// Size: 0x14d
function give_deployable_crate(var_e91c88de8cb8afb9) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    self endon("last_stand");
    objweapon = makeweapon(var_e91c88de8cb8afb9);
    if (!istrue(scripts\cp_mp\utility\weapon_utility::giveandfireoffhandreliable(objweapon))) {
        self.super_activated = 0;
        namespace_44edfb3e2b433c17::function_c5ea07dac9d83685();
        clientnum = self getentitynumber();
        setomnvar("ui_class_power_reloading", clientnum);
        var_89656f67c2ea228d = 0.2;
        thread function_8f741e1e8e870100(var_89656f67c2ea228d, 975);
        namespace_44edfb3e2b433c17::superusefinished();
        namespace_44edfb3e2b433c17::setsuperisinuse(0);
        return undefined;
    }
    msg = waittill_any_return_6("offhand_fired", "weapon_fired", "offhand_end", "weapon_change", "weapon_gesture_failed", "offhand_pullback");
    self.super_activated = 0;
    namespace_44edfb3e2b433c17::function_c5ea07dac9d83685();
    clientnum = self getentitynumber();
    setomnvar("ui_class_power_reloading", clientnum);
    if (msg == "offhand_pullback" || msg == "weapon_change" || msg == "weapon_gesture_failed") {
        var_89656f67c2ea228d = 0.2;
        thread function_8f741e1e8e870100(var_89656f67c2ea228d, 975);
        namespace_44edfb3e2b433c17::superusefinished();
        namespace_44edfb3e2b433c17::setsuperisinuse(0);
        return undefined;
    }
    namespace_44edfb3e2b433c17::setsuperisinuse(0);
    namespace_27c74152ccb91331::function_55b08d6d71b41402(self, "equipment_deployed");
    return 1;
}

// Namespace munitions / namespace_94359011b63230a6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4e05
// Size: 0x1d
function function_8f741e1e8e870100(var_89656f67c2ea228d, var_4eedbc067a81f686) {
    wait var_89656f67c2ea228d;
    namespace_44edfb3e2b433c17::increase_super_progress(var_4eedbc067a81f686);
}

// Namespace munitions / namespace_94359011b63230a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e2a
// Size: 0x7d
function giveriotshield() {
    self.riot_shield_damage = 1000;
    self.last_weapon = self getcurrentweapon();
    if (!istrue(self.has_riot_shield)) {
        gun = "iw9_me_riotshield_mp";
        shield = makeweapon(gun);
        _giveweapon(shield);
        scripts\cp\cp_weapons::switchtoweaponreliable(shield);
        self.has_riot_shield = 1;
        thread remove_at_shield_death(gun, 0);
    }
    self notify("munitions_used", "riot_shield");
}

// Namespace munitions / namespace_94359011b63230a6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4eaf
// Size: 0x11a
function remove_at_shield_death(weapon_name, var_946a167e53da62ed) {
    level endon("game_ended");
    self endon("disconnect");
    weapon = undefined;
    list = self getweaponslist("primary");
    foreach (weap in list) {
        if (weap.basename == weapon_name) {
            weapon = weap;
            break;
        }
    }
    if (isdefined(weapon)) {
        while (self.riot_shield_damage > var_946a167e53da62ed) {
            waitframe();
        }
        self.riot_shield_broken = 1;
        if (isdefined(self.riotshieldmodel)) {
            riotshield_detach(1);
        } else if (isdefined(self.riotshieldmodelstowed)) {
            riotshield_detach(0);
        }
        wait 1;
        self takeweapon(weapon);
        self switchtoweapon(self.last_weapon);
        self.has_riot_shield = undefined;
        self.riot_shield_broken = undefined;
    }
}

// Namespace munitions / namespace_94359011b63230a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4fd1
// Size: 0x1cd
function givemunitionfromluinotify() {
    self endon("disconnect");
    level endon("game_ended");
    self.dpad_selection_index = 0;
    var_b00605b9047d7f4b = level.var_3a7f3e66e1a1d8f5;
    total_slots = level.var_3a7f3e66e1a1d8f5;
    if (istrue(level.unlimitedmunitions)) {
        total_slots = 1;
    }
    self setplayerdata("cp", "inventorySlots", "totalSlots", total_slots);
    /#
    #/
    for (;;) {
        channel, val = self waittill("luinotifyserver");
        if (channel == "radial_menu_munition") {
            function_d3e4275ca1bc1207();
            reason = 0;
            /#
                reason = getdvarint(@"hash_5c04fc6164658276", 0);
            #/
            if (!player_can_use_munitions(reason)) {
                continue;
            }
            if (val >= 0 && val <= 2) {
                munition = self.munition_slots[val];
                if (isdefined(munition) && munition.ref != "none" && munition.ref != "empty1" && munition.ref != "empty2" && munition.ref != "empty3") {
                    if (istrue(can_use_munition(val))) {
                        thread remove_munition_on_use(munition.ref, val);
                        success = namespace_94359011b63230a6::giveitembasedoncraftingstruct(munition.ref);
                        if (success) {
                            if (is_instant_use_munition(munition.ref)) {
                                self notify("munitions_used", munition.ref);
                            }
                            scripts\cp\cp_analytics::logevent_munitionused(self, munition.ref);
                            continue;
                        }
                        self notify("remove_munition_on_use");
                    }
                }
            }
        }
    }
}

// Namespace munitions / namespace_94359011b63230a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x51a6
// Size: 0xe5
function give_deployable_cover() {
    if (self isthrowinggrenade()) {
        return;
    }
    self.prev_weapon_taccover = self getcurrentprimaryweapon();
    gun = "tac_cover_mp";
    self giveweapon(gun);
    self switchtoweapon(gun);
    self notifyonplayercommand("equip_deploy_end", "+weapnext");
    self notifyonplayercommand("equip_deploy_end", "+weapprev");
    self notifyonplayercommand("equip_deploy_end", "+actionslot 4");
    if (!self isconsoleplayer()) {
        self notifyonplayercommand("equip_deploy_end", "+actionslot 5");
        self notifyonplayercommand("equip_deploy_end", "+actionslot 6");
        self notifyonplayercommand("equip_deploy_end", "+actionslot 7");
    }
    val::set("deployable_cover", "melee", 0);
    success = fire_deployable_cover();
    if (istrue(success)) {
        return 1;
    } else {
        val::reset_all("deployable_cover");
    }
    return undefined;
}

// Namespace munitions / namespace_94359011b63230a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5294
// Size: 0xe9
function fire_deployable_cover() {
    self endon("equip_deploy_end");
    self endon("last_stand");
    self endon("death_or_disconnect");
    grenade = namespace_a0628d6954815ef8::waittill_grenade_fire();
    if (isdefined(grenade.weapon_name) && grenade.weapon_name == "tac_cover_mp") {
        success = scripts\cp\powers\cp_tactical_cover::tac_cover_on_fired_super();
        if (istrue(success)) {
            thread scripts\cp\powers\cp_tactical_cover::tac_cover_used(grenade);
            val::reset_all("deployable_cover");
            foreach (player in level.players) {
                player thread scripts\cp\cp_hud_message::showsplash("cp_used_deployable_cover", undefined, self);
            }
            self notify("munitions_used", "deployable_cover");
            return 1;
        }
    }
    self notify("deploy_cover_failed");
    return undefined;
}

// Namespace munitions / namespace_94359011b63230a6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5386
// Size: 0x46
function function_9ee17a338bde061b(ref) {
    switch (ref) {
    case #"hash_74e2f521aa352a6a": 
        return "sentry_gun";
    case #"hash_eca3b9673d38fd59": 
        return "cruise_predator";
    default: 
        return ref;
    }
}

// Namespace munitions / namespace_94359011b63230a6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x53d4
// Size: 0x46
function function_77cbcaf60caaf605(ref) {
    switch (ref) {
    case #"hash_4d5aa76e8707f47b": 
        return "sentry";
    case #"hash_28d0236400e33fd0": 
        return "cruise_missile";
    default: 
        return ref;
    }
}

// Namespace munitions / namespace_94359011b63230a6
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x5422
// Size: 0x145
function function_8c2b940cf1550e4d(damage, attacker, inflictor, victimteam, sourceorigin, meansofdeath, weaponname) {
    direction_vec = (0, 0, 0);
    point = (0, 0, 0);
    angles = (0, 0, 0);
    normal = (0, 0, 0);
    modelname = "";
    tagname = "";
    partname = "";
    idflags = undefined;
    if (isagent(self)) {
        self dodamage(damage, sourceorigin, attacker, inflictor, meansofdeath, weaponname);
        return;
    }
    if (scripts\cp_mp\vehicles\vehicle::isvehicle()) {
        self dodamage(damage, sourceorigin, attacker, inflictor, meansofdeath, weaponname);
        return;
    }
    weapon = makeweaponfromstring(weaponname);
    self notify("damage", damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, weapon, sourceorigin, angles, normal, inflictor);
}

// Namespace munitions / namespace_94359011b63230a6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x556f
// Size: 0xd7
function function_ffd0ae3abd92c511(crafteditem) {
    numMunitions = self getProgressionData("spData", "numMunitions");
    if (numMunitions >= level.var_fd57bc164397d837.size) {
        self function_6a369480dbaf1090("jup_sp_boundandmagged", numMunitions);
        return;
    }
    for (i = 0; i < level.var_fd57bc164397d837.size; i++) {
        if (crafteditem == self getProgressionData("spData", "usedMunitions", i)) {
            return;
        }
    }
    if (array_contains(level.var_fd57bc164397d837, crafteditem)) {
        self setProgressionData("spData", "usedMunitions", numMunitions, crafteditem);
        numMunitions++;
        self setProgressionData("spData", "numMunitions", numMunitions);
        if (numMunitions <= 5) {
            self function_6a369480dbaf1090("jup_sp_partyfavors", numMunitions);
        }
        self function_6a369480dbaf1090("jup_sp_boundandmagged", numMunitions);
    }
}

