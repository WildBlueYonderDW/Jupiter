#using script_3a8f9ace195c9da9;
#using script_42f868a5dda17294;
#using script_46b342a079938c68;
#using script_4a6760982b403bad;
#using script_6b80871eb8142180;
#using script_737f801e6beb18c7;
#using scripts\common\ae_utility;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp\utility;
#using scripts\cp_mp\challenges;
#using scripts\cp_mp\entityheadicons;
#using scripts\cp_mp\targetmarkergroups;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\killstreak_utility;
#using scripts\cp_mp\utility\player_utility;
#using scripts\cp_mp\utility\team_utility;
#using scripts\engine\math;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace namespace_e666063f094d5591;

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x632
// Size: 0x8e
function function_69e63e3462f94600() {
    globals = level.equipment;
    if (issharedfuncdefined("equipment", "equipment_init")) {
        globals = [[ getsharedfunc("equipment", "equipment_init") ]](globals);
    }
    globals.callbacks["equip_binoculars"]["onGive"] = &namespace_e875ad14b292bd61::binoculars_ongive;
    globals.callbacks["equip_binoculars"]["onTake"] = &namespace_e875ad14b292bd61::binoculars_ontake;
    val::group_register("binoculars_ads", ["cp_munitions"]);
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6c8
// Size: 0x97
function binoculars_init() {
    if (isdefined(level.binocularsinited)) {
        return;
    }
    level.var_2c4f2a5075921418 = 2 | 131072 | 2048;
    level.binocularsinited = 1;
    if (getdvarint(@"hash_39f6380d005b64fa", 0)) {
        level.var_9b60ec72f9c75a17 = 1;
        if (!isdefined(level.var_8b30d8e5d8aecf1)) {
            level.var_8b30d8e5d8aecf1 = spawnstruct();
        }
        level.var_8b30d8e5d8aecf1.var_3f2c367416b5b6e7 = 0.03;
        level.var_8b30d8e5d8aecf1.var_6768c96deefcebf1 = 1;
    }
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x767
// Size: 0x63
function binoculars_onstateupdatefunc(stateindex, targetent, cansee) {
    switch (stateindex) {
    case 0:
        return binoculars_onstateinvalidupdate(targetent, cansee);
    case 2:
        return binoculars_onstateunmarkedupdate(targetent, cansee);
    case 4:
        return binoculars_onstatemarkpendingupdate(targetent, cansee);
    }
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7d2
// Size: 0x70
function binoculars_onstateenterfunc(stateindex, targetent) {
    switch (stateindex) {
    case 0:
        binoculars_onstateinvalidenter(targetent);
        return;
    case 2:
        binoculars_onstateunmarkedenter(targetent);
        return;
    case 4:
        binoculars_onstatemarkpendingenter(targetent);
        return;
    case 5:
        binoculars_onstatemarkedenter(targetent);
        return;
    }
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x84a
// Size: 0x46
function binoculars_onstateexitfunc(stateindex, targetent) {
    switch (stateindex) {
    case 4:
        binoculars_onstatemarkpendingexit(targetent);
        return;
    case 5:
        binoculars_onstatemarkedexit(targetent);
        return;
    }
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x898
// Size: 0x4c
function binoculars_ongive(equipmentref, equipmentslot) {
    if (equipmentref != "equip_binoculars" || getdvarint(@"hash_8bcd5b94785fa58b", 1) != 1) {
        return;
    }
    binoculars_init();
    thread binoculars_watchforads();
    self notify("binoculars_give");
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8ec
// Size: 0x48
function binoculars_ontake(equipmentref, equipmentslot) {
    if (equipmentref != "equip_binoculars") {
        return;
    }
    self notifyonplayercommandremove("binos_stance", "+stance");
    self notifyonplayercommandremove("binos_swap_weapon", "+weapnext");
    self notify("binoculars_take");
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x93c
// Size: 0x18
function binoculars_used(grenade) {
    waitframe();
    if (isdefined(grenade)) {
        grenade delete();
    }
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x95c
// Size: 0x3c
function function_2a17aea2030bad61() {
    if (!isdefined(self)) {
        return false;
    }
    return !istrue(self.var_24e9ac46ba2ec580) && !binoculars_isads() && !(self isgestureplaying("ges_equip_nvg_puton_mp") || self isgestureplaying("ges_equip_nvg_takeoff_mp"));
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9a1
// Size: 0x17b
function binoculars_watchforads() {
    self endon("disconnect");
    self notify("binoculars_watchForADS");
    self endon("binoculars_watchForADS");
    isads = 0;
    self notifyonplayercommand("binos_stance", "+stance");
    self notifyonplayercommand("binos_swap_weapon", "+weapnext");
    while (true) {
        raceresult = spawnstruct();
        childthread binoculars_watchracedeath(raceresult);
        childthread binoculars_watchracelaststand(raceresult);
        childthread binoculars_watchracetake(raceresult);
        childthread binoculars_watchraceadson(raceresult);
        childthread binoculars_watchraceadsoff(raceresult);
        childthread function_621d5bba47a7c73(raceresult);
        childthread function_7ea3084beb23d8ce(raceresult);
        childthread function_e1715f0f4cfdc36b(raceresult);
        self waittill("binoculars_watchRaceStart", condition);
        if (!isdefined(condition)) {
            continue;
        }
        death = condition == "death";
        take = condition == "take";
        adson = condition == "ads_on";
        adsoff = condition == "ads_off" || condition == "last_stand" || condition == "vehicle_interact" || condition == "special_exit" || condition == "weap_change";
        self notify("binoculars_watchRaceEnd");
        if (death || take) {
            binoculars_endadslogic();
            return;
        }
        if (adson && !isads) {
            isads = 1;
            thread binoculars_runadslogic();
            continue;
        }
        if (adsoff && isads) {
            isads = 0;
            binoculars_endadslogic();
        }
    }
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb24
// Size: 0x35
function binoculars_watchracedeath(raceresult) {
    self endon("binoculars_watchRaceEnd");
    self waittill("death");
    raceresult.death = 1;
    self notify("binoculars_watchRaceStart", "death");
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb61
// Size: 0x35
function binoculars_watchracelaststand(raceresult) {
    self endon("binoculars_watchRaceEnd");
    self waittill("last_stand_start");
    raceresult.laststand = 1;
    self notify("binoculars_watchRaceStart", "last_stand");
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb9e
// Size: 0x35
function binoculars_watchracetake(raceresult) {
    self endon("binoculars_watchRaceEnd");
    self waittill("binoculars_take");
    raceresult.take = 1;
    self notify("binoculars_watchRaceStart", "take");
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbdb
// Size: 0x6a
function binoculars_watchraceadson(raceresult) {
    self endon("binoculars_watchRaceEnd");
    while (true) {
        self waittill("offhand_ads_on", weapon);
        if (getweaponbasename(weapon) == "offhand_spotter_scope_mp" || getweaponbasename(weapon) == "offhand_spotter_scope_cp") {
            break;
        }
    }
    raceresult.adson = 1;
    self notify("binoculars_watchRaceStart", "ads_on");
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc4d
// Size: 0x6a
function binoculars_watchraceadsoff(raceresult) {
    self endon("binoculars_watchRaceEnd");
    while (true) {
        self waittill("offhand_ads_off", weapon);
        if (getweaponbasename(weapon) == "offhand_spotter_scope_mp" || getweaponbasename(weapon) == "offhand_spotter_scope_cp") {
            break;
        }
    }
    raceresult.adsoff = 1;
    self notify("binoculars_watchRaceStart", "ads_off");
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcbf
// Size: 0x35
function function_e1715f0f4cfdc36b(raceresult) {
    self endon("binoculars_watchRaceEnd");
    self waittill("weapon_change");
    raceresult.adsoff = 1;
    self notify("binoculars_watchRaceStart", "weap_change");
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcfc
// Size: 0x46
function function_621d5bba47a7c73(raceresult) {
    self endon("binoculars_watchRaceEnd");
    waittill_any_2("vehicle_enter", "vehicle_change_seat");
    raceresult.enteredvehicle = 1;
    self notify("binos_vehicle_interact");
    self notify("binoculars_watchRaceStart", "vehicle_interact");
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd4a
// Size: 0xe4
function function_7ea3084beb23d8ce(raceresult) {
    self endon("binoculars_watchRaceEnd");
    while (true) {
        waittill_any_4("spotter_hotkey_pressed", "binos_stance", "binos_swap_weapon", "detonate");
        offhand = self getheldoffhand();
        if (isdefined(offhand) && isdefined(offhand.basename) && (offhand.basename == "offhand_spotter_scope_mp" || offhand.basename == "offhand_spotter_scope_cp") || issubstr(offhand.basename, "c4")) {
            if (!issubstr(offhand.basename, "c4")) {
                self releaseoffhand();
            }
            break;
        }
        waitframe();
    }
    raceresult.adsoff = 1;
    self notify("binos_special_exit");
    self notify("binoculars_watchRaceStart", "special_exit");
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe36
// Size: 0x1c8
function binoculars_endadslogic() {
    self notify("binoculars_ads_off");
    level notify("binoculars_ads_off", self);
    if (isdefined(self.binocularsstruct)) {
        self.binocularsstruct.adson = undefined;
        self.binocularsstruct.var_811eb055aa6df60e = undefined;
        if (isdefined(self.binocularsstruct.targetmarkergroup)) {
            scripts\cp_mp\targetmarkergroups::targetmarkergroup_off(self.binocularsstruct.targetmarkergroup);
            self.binocularsstruct.targetmarkergroup = undefined;
        }
        namespace_4e11149030890e64::function_a1a4c60871710624();
        binoculars_clearuidata();
        foreach (targetdata in self.binocularsstruct.targetdata) {
            targetdata.hastargetmarker = undefined;
            if (isdefined(targetdata.headicon)) {
                binoculars_updateheadiconvisibilityforplayer(targetdata, self);
            LOC_0000011a:
            }
        LOC_0000011a:
        }
    }
    if (isdefined(level.var_b31dd264ae8db273)) {
        data = spawnstruct();
        data.player = level.player;
        data.enemiesmarked = level.var_b31dd264ae8db273.enemiesmarked;
        data.var_a96aac2935b87d1 = level.var_b31dd264ae8db273.var_a96aac2935b87d1;
        data.var_6709a01d1de361cf = level.var_b31dd264ae8db273.var_6709a01d1de361cf;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_used_spotter", data);
    }
    val::group_reset("binoculars_ads");
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1006
// Size: 0xbe
function binoculars_runadslogic() {
    self endon("disconnect");
    self endon("binoculars_ads_off");
    self notify("binoculars_ads_on");
    level notify("binoculars_ads_on", self);
    if (!isdefined(self.binocularsstruct)) {
        self.binocularsstruct = spawnstruct();
        self.binocularsstruct.targetdata = [];
        self.binocularsstruct.var_811eb055aa6df60e = 0;
    }
    self.binocularsstruct.adson = 1;
    self.binocularsstruct.targetmarkergroup = scripts\cp_mp\targetmarkergroups::targetmarkergroup_on("rcdmarker", self, undefined, self, 0, 0, 0);
    level function_baa1e373458f1367();
    thread binoculars_processtargetdata();
    val::group_set("binoculars_ads", 0);
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10cc
// Size: 0x24
function binoculars_isads() {
    return isdefined(self.binocularsstruct) && istrue(self.binocularsstruct.adson);
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10f9
// Size: 0x4be
function binoculars_processtargetdata() {
    if (istrue(self.binocularsstruct.var_2877d88b9a6d8cdb)) {
        return;
    }
    self.binocularsstruct.var_2877d88b9a6d8cdb = 1;
    self endon("disconnect");
    while (true) {
        currenttarget = undefined;
        seentargets = [];
        while (true) {
            function_5c3ab97c636c1b90();
            if (binoculars_isads()) {
                targetarray = sortbydistance(self function_c5140fff72feca2d(self.binocularsstruct.maxrange, binoculars_getfov(), level.var_2c4f2a5075921418, 0), self.origin);
                if (istrue(level.var_9b60ec72f9c75a17)) {
                    targetarray = array_combine(targetarray, function_a4070ba049bbd2e6(self.binocularsstruct.maxrange, self.binocularsstruct.cosfov));
                }
                var_56bf4e4b2bb221a7 = [];
                var_cb791416725e9bc6 = 0;
                foreach (targetent in targetarray) {
                    targetnum = targetent function_77eb550af880483a();
                    if (!isdefined(targetnum)) {
                        continue;
                    }
                    curstate = function_856db8d000d0be6(targetnum);
                    targetdata = self.binocularsstruct.targetdata[targetnum];
                    if (isdefined(currenttarget)) {
                        continue;
                    }
                    if (!function_67da6f8a8e37737b(targetent)) {
                        continue;
                    }
                    if (curstate == 5) {
                        continue;
                    }
                    newstate = binoculars_onstateupdatefunc(curstate, targetent, 1);
                    var_56bf4e4b2bb221a7[targetnum] = 1;
                    seentargets[targetnum] = targetent;
                    if (newstate != curstate) {
                        binoculars_onstateexitfunc(curstate, targetent);
                        binoculars_onstateenterfunc(newstate, targetent);
                        if (newstate == 4) {
                            function_34d6333ca8b1f289(targetent);
                            currenttarget = targetent;
                        }
                    }
                }
                foreach (targetent in seentargets) {
                    if (!isdefined(targetent)) {
                        continue;
                    }
                    targetnum = targetent function_77eb550af880483a();
                    if (!isdefined(var_56bf4e4b2bb221a7[targetnum])) {
                        seentargets[targetnum] = undefined;
                        curstate = function_856db8d000d0be6(targetnum);
                        newstate = binoculars_onstateupdatefunc(curstate, targetent, 0);
                        if (newstate != curstate) {
                            binoculars_onstateexitfunc(curstate, targetent);
                            binoculars_onstateenterfunc(newstate, targetent);
                        }
                    }
                }
                if (isdefined(currenttarget)) {
                    break;
                }
                binoculars_updateuidata();
            } else if (!isdefined(self.markedents)) {
                self.binocularsstruct = undefined;
                return;
            }
            waitframe();
        }
        waitframe();
        if (binoculars_isads()) {
            foreach (targetent in seentargets) {
                if (!isdefined(targetent) || targetent == currenttarget) {
                    continue;
                }
                curstate = function_856db8d000d0be6(targetent function_77eb550af880483a());
                newstate = binoculars_onstateupdatefunc(curstate, targetent, 0);
                if (newstate != curstate) {
                    binoculars_onstateexitfunc(curstate, targetent);
                    binoculars_onstateenterfunc(newstate, targetent);
                }
            }
        }
        lastseentime = gettime();
        cansee = 1;
        currenttargetnumber = currenttarget function_77eb550af880483a();
        while (true) {
            function_5c3ab97c636c1b90();
            if (binoculars_isads()) {
                curstate = function_856db8d000d0be6(currenttargetnumber);
                if (gettime() - lastseentime > 250) {
                    lastseentime = gettime();
                    if (istrue(level.var_9b60ec72f9c75a17) && isdefined(currenttarget.var_3d33ce746b270d75) && istrue(currenttarget.var_3d33ce746b270d75.is_objective)) {
                        cansee = function_42beae79b9afdeef(currenttarget);
                    } else {
                        cansee = function_67da6f8a8e37737b(currenttarget);
                    }
                }
                newstate = binoculars_onstateupdatefunc(curstate, currenttarget, cansee);
                if (newstate != curstate) {
                    binoculars_onstateexitfunc(curstate, currenttarget);
                    binoculars_onstateenterfunc(newstate, currenttarget);
                    if (newstate == 0 || newstate == 2) {
                        waitframe();
                        break;
                    } else if (newstate == 5) {
                        if (!isdefined(self.markedents)) {
                            self.markedents = [];
                        }
                        self.markedents[currenttarget function_77eb550af880483a()] = currenttarget;
                        thread binoculars_updateMarkedEnts();
                        waitframe();
                        break;
                    }
                }
                binoculars_updateuidata();
            } else if (!isdefined(self.markedents)) {
                self.binocularsstruct = undefined;
                return;
            }
            waitframe();
        }
    }
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15bf
// Size: 0x3d
function function_856db8d000d0be6(targetnum) {
    targetdata = self.binocularsstruct.targetdata[targetnum];
    if (isdefined(targetdata)) {
        return targetdata.state;
    }
    return 0;
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1605
// Size: 0xea
function function_5c3ab97c636c1b90() {
    projectiondistance = getdvarfloat(@"hash_90d4dd93f932de3f", 72);
    self.binocularsstruct.maxrange = binoculars_getmaxrange();
    self.binocularsstruct.maxrangesq = self.binocularsstruct.maxrange * self.binocularsstruct.maxrange;
    self.binocularsstruct.cosfov = cos(binoculars_getfov());
    self.binocularsstruct.projdistsq = projectiondistance * projectiondistance;
    self.binocularsstruct.markingtarget = 0;
    self.binocularsstruct.markingcoldblooded = 0;
    self.binocularsstruct.markingendtime = 0;
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16f7
// Size: 0x113
function binoculars_updateMarkedEnts() {
    self endon("disconnect");
    self notify("binoculars_updateMarkedEnts");
    self endon("binoculars_updateMarkedEnts");
    while (isdefined(self.markedents) && self.markedents.size > 0) {
        waitframe();
        foreach (targetent in self.markedents) {
            if (!isdefined(targetent)) {
                continue;
            }
            curstate = 0;
            targetdata = self.binocularsstruct.targetdata[targetent function_77eb550af880483a()];
            if (isdefined(targetdata)) {
                curstate = targetdata.state;
            }
            newstate = binoculars_onstatemarkedupdate(targetent);
            if (newstate != curstate) {
                binoculars_onstateexitfunc(curstate, targetent);
                binoculars_onstateenterfunc(newstate, targetent);
                self.markedents[targetent function_77eb550af880483a()] = undefined;
            }
        }
    }
    self.markedents = undefined;
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1812
// Size: 0x3cd
function function_67da6f8a8e37737b(targetent) {
    targetid = targetent function_77eb550af880483a();
    if (isdefined(self.binocularsstruct.var_c035c79565a18c68) && isdefined(self.binocularsstruct.var_c035c79565a18c68[targetid]) && self.binocularsstruct.var_c035c79565a18c68[targetid] == gettime()) {
        return self.binocularsstruct.var_b395fc404387c5c0[targetid];
    }
    self.binocularsstruct.var_c035c79565a18c68[targetid] = gettime();
    contents = scripts\engine\trace::create_contents(0, 1, 0, 1, 1, 1, 0, 1);
    tracepoints = [targetent.origin + (0, 0, 15)];
    if (!isdefined(level.var_9b60ec72f9c75a17) || isdefined(level.var_9b60ec72f9c75a17) && !namespace_4e11149030890e64::function_bd27c13c6b8f16fd(targetent)) {
        if (isplayer(targetent)) {
            headpos = targetent scripts\cp_mp\utility\player_utility::getstancetop();
            centerpos = targetent scripts\cp_mp\utility\player_utility::getstancecenter();
            tracepoints = [headpos, centerpos, targetent.origin];
        } else if (isagent(targetent)) {
            tracepoints = [targetent.origin + (0, 0, 48)];
        }
        ignorelist = [self, targetent];
        vehicle = targetent scripts\cp_mp\utility\player_utility::getvehicle();
        if (isdefined(vehicle)) {
            ignorelist[ignorelist.size] = vehicle;
            vehiclechildren = vehicle getlinkedchildren(1);
            foreach (child in vehiclechildren) {
                ignorelist[ignorelist.size] = vehicle;
            }
        }
        checkpassed = 0;
        foreach (point in tracepoints) {
            if (!scripts\engine\trace::ray_trace_passed(self getvieworigin(), point, ignorelist, contents)) {
                continue;
            }
            self.binocularsstruct.var_b395fc404387c5c0[targetid] = 1;
            return 1;
        }
    } else if (istrue(level.var_9b60ec72f9c75a17) && isdefined(targetent.var_3d33ce746b270d75) && istrue(targetent.var_3d33ce746b270d75.is_objective)) {
        var_7052d6ad22659ddb = function_42beae79b9afdeef(targetent);
        self.binocularsstruct.var_b395fc404387c5c0[targetid] = var_7052d6ad22659ddb;
        return var_7052d6ad22659ddb;
    } else {
        midpoint = targetent function_7f5f53871d3db00c();
        tracepoints = function_6d6af8144a5131f1(tracepoints, midpoint);
        contents = scripts\engine\trace::create_contents(0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1);
        foreach (point in tracepoints) {
            if (!istrue(targetent function_ee50df7ae647178b(self getvieworigin(), point, ignorelist, contents))) {
                continue;
            }
            self.binocularsstruct.var_b395fc404387c5c0[targetid] = 1;
            return 1;
        }
    }
    self.binocularsstruct.var_b395fc404387c5c0[targetid] = 0;
    return 0;
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1be8
// Size: 0x5b
function function_34d6333ca8b1f289(targetent) {
    targetdata = self.binocularsstruct.targetdata[targetent function_77eb550af880483a()];
    assert(isdefined(targetdata));
    targetdata.loschecktime = gettime();
    targetdata.loscheckpassed = 1;
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c4b
// Size: 0x73
function binoculars_cansee(targetent) {
    targetdata = self.binocularsstruct.targetdata[targetent function_77eb550af880483a()];
    assert(isdefined(targetdata));
    if (!isdefined(targetdata.loschecktime) || gettime() - targetdata.loschecktime > 1000) {
        return false;
    }
    return istrue(targetdata.loscheckpassed);
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1cc7
// Size: 0xa0
function binoculars_setcurrentstate(targetent, newstate) {
    targetdata = self.binocularsstruct.targetdata[targetent function_77eb550af880483a()];
    if (!isdefined(targetdata)) {
        if (newstate == 0) {
            return;
        }
        targetdata = spawnstruct();
        if (namespace_4e11149030890e64::function_bd27c13c6b8f16fd(targetent)) {
            self.binocularsstruct.targetdata[targetent function_77eb550af880483a()] = targetdata;
        } else {
            self.binocularsstruct.targetdata[targetent function_77eb550af880483a()] = targetdata;
        }
    }
    targetdata.state = newstate;
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d6f
// Size: 0x3f
function binoculars_hascoldblooded(targetent) {
    if (istrue(level.var_9b60ec72f9c75a17) && namespace_4e11149030890e64::function_bd27c13c6b8f16fd(targetent)) {
        return 0;
    }
    return isplayer(targetent) && targetent _hasperk("specialty_noscopeoutline");
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1db6
// Size: 0xf5
function binoculars_showtargetmarker(targetent, ismarked) {
    targetdata = self.binocularsstruct.targetdata[targetent function_77eb550af880483a()];
    if (isdefined(targetdata)) {
        targetdata.hastargetmarker = 1;
    }
    if (!isdefined(self.binocularsstruct.targetmarkergroup)) {
        return;
    }
    if (istrue(level.var_9b60ec72f9c75a17) && (istrue(targetent.var_b41f2d4772efac2d) || namespace_4e11149030890e64::function_bd27c13c6b8f16fd(targetent))) {
        targetent = function_6226cd474c01848f(targetent);
        if (!isdefined(targetent)) {
            return;
        }
    }
    scripts\cp_mp\targetmarkergroups::targetmarkergroup_markentity(targetent, self.binocularsstruct.targetmarkergroup, 0);
    hascoldblooded = binoculars_hascoldblooded(targetent);
    if (hascoldblooded) {
        binoculars_settargetmarkerstate(targetent, 3);
        return;
    }
    if (ismarked) {
        binoculars_settargetmarkerstate(targetent, 2);
        return;
    }
    binoculars_settargetmarkerstate(targetent, 1);
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1eb3
// Size: 0xa0
function binoculars_updatetargetmarker(targetent, ismarked) {
    if (!isdefined(self.binocularsstruct.targetmarkergroup)) {
        return;
    }
    if (istrue(level.var_9b60ec72f9c75a17) && (istrue(targetent.var_b41f2d4772efac2d) || namespace_4e11149030890e64::function_bd27c13c6b8f16fd(targetent))) {
        targetent = function_6226cd474c01848f(targetent);
        if (!isdefined(targetent)) {
            return;
        }
    }
    hascoldblooded = binoculars_hascoldblooded(targetent);
    if (hascoldblooded) {
        binoculars_settargetmarkerstate(targetent, 3);
        return;
    }
    if (ismarked) {
        binoculars_settargetmarkerstate(targetent, 2);
        return;
    }
    binoculars_settargetmarkerstate(targetent, 1);
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f5b
// Size: 0xed
function binoculars_hidetargetmarker(targetent) {
    if (istrue(level.var_9b60ec72f9c75a17)) {
        if (namespace_4e11149030890e64::function_bd27c13c6b8f16fd(targetent) || namespace_8c7f8f6b3076a74a::function_409b4b9bee1fbe1c(targetent)) {
            if (isdefined(targetent.var_3d33ce746b270d75.var_7230693117949738)) {
                delaythread(0.65, &scripts\cp_mp\targetmarkergroups::targetmarkergroup_unmarkentity, targetent.var_3d33ce746b270d75.var_7230693117949738, self.binocularsstruct.targetmarkergroup);
                return;
            } else {
                return;
            }
        }
    }
    targetdata = self.binocularsstruct.targetdata[targetent function_77eb550af880483a()];
    if (isdefined(targetdata)) {
        targetdata.hastargetmarker = undefined;
    }
    if (!isdefined(self.binocularsstruct.targetmarkergroup)) {
        return;
    }
    scripts\cp_mp\targetmarkergroups::targetmarkergroup_unmarkentity(targetent, self.binocularsstruct.targetmarkergroup);
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2050
// Size: 0x72
function binoculars_settargetmarkerstate(targetent, state) {
    firstbit = (state >> 0) % 2 == 1;
    secondbit = (state >> 1) % 2 == 1;
    targetmarkergroupsetentitystate(self.binocularsstruct.targetmarkergroup, targetent, firstbit);
    targetmarkergroupsetextrastate(self.binocularsstruct.targetmarkergroup, targetent, secondbit);
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x20ca
// Size: 0xaa
function binoculars_addheadicon(targetent) {
    markicon = "hud_icon_new_marked";
    var_f9cd7fda74e92e2a = 8;
    var_e0e11f3b4551be11 = 1;
    var_c5409ca7522182b3 = 0;
    naturaldist = 500;
    targetdata = self.binocularsstruct.targetdata[targetent function_77eb550af880483a()];
    assert(isdefined(targetdata));
    targetdata.headicon = targetent scripts\cp_mp\entityheadicons::setheadicon_singleimage([], markicon, var_f9cd7fda74e92e2a, var_e0e11f3b4551be11, var_c5409ca7522182b3, naturaldist, undefined, 1, 1);
    thread binoculars_cleanupheadiconondisconnect(targetent);
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x217c
// Size: 0xd3
function binoculars_updateheadiconvisibility(targetent) {
    targetdata = self.binocularsstruct.targetdata[targetent function_77eb550af880483a()];
    if (!isdefined(targetdata) || !isdefined(targetdata.headicon)) {
        return;
    }
    players = [];
    if (issharedfuncdefined("game", "getTeamData")) {
        players = [[ getsharedfunc("game", "getTeamData") ]](self.team, "players");
    }
    foreach (player in players) {
        binoculars_updateheadiconvisibilityforplayer(targetdata, player);
    }
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2257
// Size: 0x90
function binoculars_updateheadiconvisibilityforplayer(targetdata, player) {
    assert(isdefined(targetdata));
    assert(isdefined(targetdata.headicon));
    shouldshow = 1;
    if (player == self && binoculars_isads() && istrue(targetdata.hastargetmarker)) {
        shouldshow = 0;
    }
    if (shouldshow) {
        scripts\cp_mp\entityheadicons::setheadicon_addclienttomask(targetdata.headicon, player);
        return;
    }
    scripts\cp_mp\entityheadicons::setheadicon_removeclientfrommask(targetdata.headicon, player);
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x22ef
// Size: 0xa1
function binoculars_cleanupheadiconondisconnect(targetent) {
    entnum = targetent function_77eb550af880483a();
    self endon("disconnect");
    self endon("removeHeadIcon_" + entnum);
    targetent waittill("disconnect");
    if (isdefined(self.binocularsstruct) && isdefined(self.binocularsstruct.targetdata)) {
        targetdata = self.binocularsstruct.targetdata[entnum];
        if (isdefined(targetdata) && isdefined(targetdata.headicon)) {
            scripts\cp_mp\entityheadicons::setheadicon_deleteicon(targetdata.headicon);
        }
    }
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2398
// Size: 0x5e
function binoculars_removeheadicon(targetent) {
    targetdata = self.binocularsstruct.targetdata[targetent function_77eb550af880483a()];
    assert(isdefined(targetdata));
    scripts\cp_mp\entityheadicons::setheadicon_deleteicon(targetdata.headicon);
    self notify("removeHeadIcon_" + targetent function_77eb550af880483a());
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23fe
// Size: 0x1c
function binoculars_onstateinvalidenter(targetent) {
    binoculars_hidetargetmarker(targetent);
    binoculars_setcurrentstate(targetent, 0);
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2422
// Size: 0x32
function binoculars_onstateinvalidupdate(targetent, cansee) {
    istargetvalid = binoculars_targetisvalid(targetent);
    if (istargetvalid && cansee) {
        return 2;
    }
    return 0;
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x245d
// Size: 0x1e
function binoculars_onstateunmarkedenter(targetent) {
    binoculars_showtargetmarker(targetent, 0);
    binoculars_setcurrentstate(targetent, 2);
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2483
// Size: 0x74
function binoculars_onstateunmarkedupdate(targetent, cansee) {
    istargetvalid = binoculars_targetisvalid(targetent);
    if (!istargetvalid) {
        return 0;
    }
    binoculars_updateprojectiondistance(targetent);
    if (!cansee) {
        return 0;
    }
    binoculars_updatetargetmarker(targetent, 0);
    if (binoculars_iswithinprojectiondistance(targetent)) {
        if (binoculars_hascoldblooded(targetent)) {
            self.binocularsstruct.markingcoldblooded = 1;
            return 2;
        }
        return 4;
    }
    return 2;
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2500
// Size: 0x29
function binoculars_onstatemarkpendingenter(targetent) {
    binoculars_setpendingtimer(targetent);
    binoculars_setcurrentstate(targetent, 4);
    self playlocalsound("eqp_spotter_scope_marking");
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2531
// Size: 0x1f
function binoculars_onstatemarkpendingexit(targetent) {
    binoculars_clearpendingtimer(targetent);
    self stoplocalsound("eqp_spotter_scope_marking");
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2558
// Size: 0x10e
function binoculars_onstatemarkpendingupdate(targetent, cansee) {
    istargetvalid = binoculars_targetisvalid(targetent);
    if (!istargetvalid) {
        return 0;
    }
    binoculars_updateprojectiondistance(targetent);
    if (!cansee) {
        return 0;
    }
    if (!binoculars_iswithinprojectiondistance(targetent)) {
        return 2;
    }
    if (istrue(level.var_9b60ec72f9c75a17) && namespace_8c7f8f6b3076a74a::function_409b4b9bee1fbe1c(targetent) && istrue(targetent.var_3d33ce746b270d75.skip_spotter_delay)) {
        return 5;
    }
    if (binoculars_checkpendingtimer(targetent)) {
        return 5;
    }
    self.binocularsstruct.markingtarget = 1;
    if (self.binocularsstruct.markingendtime == 0) {
        self.binocularsstruct.markingendtime = binoculars_getpendingendtime(targetent);
    } else {
        self.binocularsstruct.markingendtime = int(min(self.binocularsstruct.markingendtime, binoculars_getpendingendtime(targetent)));
    }
    return 4;
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x266f
// Size: 0x126
function binoculars_onstatemarkedenter(targetent) {
    if (!isdefined(targetent.var_3d33ce746b270d75)) {
        binoculars_addheadicon(targetent);
        binoculars_updateheadiconvisibility(targetent);
    }
    if (istrue(level.var_9b60ec72f9c75a17) && namespace_4e11149030890e64::function_bd27c13c6b8f16fd(targetent) && !namespace_4e11149030890e64::function_2a2a8e6796cccfc4(targetent)) {
        targetent function_f8257e394afead2d();
    } else if ((isplayer(targetent) || isagent(targetent)) && isalive(targetent)) {
        if (isdefined(level.var_b31dd264ae8db273)) {
            level.var_b31dd264ae8db273.enemiesmarked++;
        }
        namespace_1170726b2799ea65::function_e4c6e53c9f6e94c8("jup_sp_iliketopretendihaveaplan", "achievementILikeToPretendIHaveAPlan");
    }
    binoculars_showtargetmarker(targetent, 1);
    binoculars_setexpirationtimer(targetent);
    binoculars_addmarkpoints(targetent);
    binoculars_setcurrentstate(targetent, 5);
    self playlocalsound("eqp_spotter_scope_marked_beep");
    self stoplocalsound("eqp_spotter_scope_marking");
    scripts\cp_mp\challenges::function_b0f754c8a379154e("equip_binoculars", self, int(distance(self.origin, targetent.origin)), function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"hit"));
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x279d
// Size: 0x27
function binoculars_onstatemarkedexit(targetent) {
    binoculars_removeheadicon(targetent);
    binoculars_clearexpirationtimer(targetent);
    self stoplocalsound("eqp_spotter_scope_marking");
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x27cc
// Size: 0x69
function binoculars_onstatemarkedupdate(targetent) {
    if (!binoculars_targetisvalidmark(targetent)) {
        return 0;
    }
    binoculars_updateprojectiondistance(targetent);
    if (binoculars_isads() && binoculars_cansee(targetent) && binoculars_iswithinprojectiondistance(targetent)) {
        binoculars_setexpirationtimer(targetent);
    } else if (binoculars_checkexpirationtimer(targetent)) {
        return 0;
    }
    binoculars_updateheadiconvisibility(targetent);
    binoculars_updatetargetmarker(targetent, 1);
    return 5;
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x283e
// Size: 0x106
function binoculars_targetisvalid(targetent) {
    if (istrue(level.var_9b60ec72f9c75a17) && namespace_4e11149030890e64::function_bd27c13c6b8f16fd(targetent)) {
        return (isdefined(targetent) && (!namespace_8c7f8f6b3076a74a::function_409b4b9bee1fbe1c(targetent) && !namespace_4e11149030890e64::function_2a2a8e6796cccfc4(targetent) || namespace_8c7f8f6b3076a74a::function_409b4b9bee1fbe1c(targetent) && !namespace_8c7f8f6b3076a74a::function_23425e6521e47280(targetent)) && binoculars_isads() && targetent != self && binoculars_istargetinrange(targetent) && binoculars_istargetinbroadfov(targetent));
    }
    return isdefined(targetent) && binoculars_isads() && !(isplayer(targetent) && !scripts\cp_mp\utility\player_utility::isreallyalive(targetent)) && !(isagent(targetent) && !isalive(targetent)) && !(level.teambased && isdefined(targetent.team) && targetent.team == self.team) && targetent != self && binoculars_istargetinrange(targetent) && binoculars_istargetinbroadfov(targetent);
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x294c
// Size: 0x9a
function binoculars_targetisvalidmark(targetent) {
    if (!isdefined(targetent)) {
        return false;
    }
    if (istrue(level.var_9b60ec72f9c75a17) && namespace_4e11149030890e64::function_bd27c13c6b8f16fd(targetent)) {
        return false;
    }
    if (isplayer(targetent) && !scripts\cp_mp\utility\player_utility::isreallyalive(targetent)) {
        return false;
    }
    if (isagent(targetent) && !isalive(targetent)) {
        return false;
    }
    if (level.teambased) {
        if (isdefined(targetent.team) && targetent.team == self.team) {
            return false;
        }
    } else if (targetent == self) {
        return false;
    }
    return true;
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29ef
// Size: 0x40
function binoculars_getmaxrange() {
    var_801f8d99adff8b0 = self playergetzoomlevelindex();
    if (var_801f8d99adff8b0 > 0) {
        return getdvarint(@"hash_60c09b13568650e9", 30000);
    }
    return getdvarint(@"hash_c11b9fbc2f45b442", 15000);
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a37
// Size: 0x14
function binoculars_getfov() {
    zoomfov = self playergetzoomfov();
    return zoomfov;
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a54
// Size: 0x83
function binoculars_istargetinrange(targetent) {
    if (istrue(level.var_9b60ec72f9c75a17) && namespace_4e11149030890e64::function_bd27c13c6b8f16fd(targetent) || istrue(targetent.var_b41f2d4772efac2d)) {
        if (function_409b4b9bee1fbe1c(targetent)) {
            return true;
        }
        maxrange = 59290000;
    } else {
        maxrange = self.binocularsstruct.maxrangesq;
    }
    return distancesquared(self.origin, targetent.origin) < maxrange;
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ae0
// Size: 0x73
function binoculars_istargetinbroadfov(targetent) {
    if (istrue(level.var_9b60ec72f9c75a17) && namespace_8c7f8f6b3076a74a::function_409b4b9bee1fbe1c(targetent) && istrue(targetent.var_3d33ce746b270d75.is_objective)) {
        return 1;
    }
    return within_fov(self.origin, self getplayerangles(), targetent.origin, self.binocularsstruct.cosfov);
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b5c
// Size: 0x1c0
function binoculars_iswithinprojectiondistance_compute(targetent) {
    pointa = self getvieworigin();
    pointb = pointa + anglestoforward(self getplayerangles()) * self.binocularsstruct.maxrange;
    var_20c094516733ffb1 = [targetent.origin + (0, 0, 15)];
    if (!istrue(level.var_9b60ec72f9c75a17) || !namespace_4e11149030890e64::function_bd27c13c6b8f16fd(targetent)) {
        if (isplayer(targetent)) {
            headpos = targetent scripts\cp_mp\utility\player_utility::getstancetop();
            centerpos = targetent scripts\cp_mp\utility\player_utility::getstancecenter();
            var_20c094516733ffb1 = [headpos, centerpos, targetent.origin];
        } else if (isagent(targetent)) {
            var_20c094516733ffb1 = [targetent.origin + (0, 0, 48)];
        }
    }
    if (istrue(level.var_9b60ec72f9c75a17) && isdefined(targetent.var_3d33ce746b270d75) && istrue(targetent.var_3d33ce746b270d75.is_objective)) {
        return function_42beae79b9afdeef(targetent);
    } else {
        foreach (point in var_20c094516733ffb1) {
            distsq = lengthsquared(vectorfromlinetopoint(pointa, pointb, point));
            if (distsq < self.binocularsstruct.projdistsq) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d25
// Size: 0x6e
function binoculars_updateprojectiondistance(targetent) {
    passed = binoculars_iswithinprojectiondistance_compute(targetent);
    targetdata = self.binocularsstruct.targetdata[targetent function_77eb550af880483a()];
    assert(isdefined(targetdata));
    if (passed) {
        targetdata.withinprojectiondistance = 1;
        return;
    }
    targetdata.withinprojectiondistance = undefined;
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d9b
// Size: 0x48
function binoculars_iswithinprojectiondistance(targetent) {
    targetdata = self.binocularsstruct.targetdata[targetent function_77eb550af880483a()];
    assert(isdefined(targetdata));
    return istrue(targetdata.withinprojectiondistance);
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2dec
// Size: 0x55
function binoculars_setpendingtimer(targetent) {
    targetdata = self.binocularsstruct.targetdata[targetent function_77eb550af880483a()];
    assert(isdefined(targetdata));
    targetdata.pendingtimer = gettime() + binoculars_getpendingtime(targetent);
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e49
// Size: 0x47
function binoculars_clearpendingtimer(targetent) {
    targetdata = self.binocularsstruct.targetdata[targetent function_77eb550af880483a()];
    assert(isdefined(targetdata));
    targetdata.pendingtimer = undefined;
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e98
// Size: 0x5e
function binoculars_checkpendingtimer(targetent) {
    targetdata = self.binocularsstruct.targetdata[targetent function_77eb550af880483a()];
    assert(isdefined(targetdata));
    if (!isdefined(targetdata.pendingtimer)) {
        return false;
    }
    return gettime() > targetdata.pendingtimer;
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2eff
// Size: 0x12d
function binoculars_getpendingtime(targetent) {
    mindistance = getdvarfloat(@"hash_f59503ac1ff0e454", 2500);
    maxdistance = getdvarfloat(@"hash_c7d3a5fbd69e4e06", 5000);
    if (mindistance >= maxdistance) {
        return getdvarfloat(@"hash_882715f356441b92", 500);
    }
    mintime = getdvarfloat(@"hash_882715f356441b92", 500);
    maxtime = getdvarfloat(@"hash_81f96de1624a2fc0", 500);
    if (namespace_4e11149030890e64::function_bd27c13c6b8f16fd(targetent) && namespace_8c7f8f6b3076a74a::function_409b4b9bee1fbe1c(targetent)) {
        mintime = getdvarfloat(@"hash_790608492c067152", 500);
        maxtime = getdvarfloat(@"hash_a5a28daf3a285f40", 500);
    }
    disttotarget = distance(self.origin, targetent.origin);
    if (disttotarget <= mindistance) {
        return mintime;
    }
    if (disttotarget >= 5000) {
        return maxtime;
    }
    distfrac = (disttotarget - mindistance) / (maxdistance - mindistance);
    return int(math::lerp(mintime, maxtime, distfrac));
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3034
// Size: 0x64
function binoculars_getpendingendtime(targetent) {
    targetdata = self.binocularsstruct.targetdata[targetent function_77eb550af880483a()];
    assert(isdefined(targetdata));
    if (!isdefined(targetdata.pendingtimer)) {
        return (gettime() + binoculars_getpendingtime(targetent));
    }
    return targetdata.pendingtimer;
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x30a1
// Size: 0x6b
function binoculars_setexpirationtimer(targetent) {
    targetdata = self.binocularsstruct.targetdata[targetent function_77eb550af880483a()];
    assert(isdefined(targetdata));
    expiretime = getdvarint(@"hash_b9e9ee1040e95fe3", 15000);
    targetdata.expirationtimer = gettime() + expiretime;
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3114
// Size: 0x47
function binoculars_clearexpirationtimer(targetent) {
    targetdata = self.binocularsstruct.targetdata[targetent function_77eb550af880483a()];
    assert(isdefined(targetdata));
    targetdata.expirationtimer = undefined;
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3163
// Size: 0x5f
function binoculars_checkexpirationtimer(targetent) {
    targetdata = self.binocularsstruct.targetdata[targetent function_77eb550af880483a()];
    assert(isdefined(targetdata));
    if (!isdefined(targetdata.expirationtimer)) {
        return true;
    }
    return gettime() >= targetdata.expirationtimer;
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x31cb
// Size: 0xb4
function binoculars_addmarkpoints(targetent) {
    if (!isdefined(self.markedentitieslifeindices)) {
        self.markedentitieslifeindices = [];
    }
    entitynum = targetent function_77eb550af880483a();
    lifeindex = ter_op(isdefined(self.matchdatalifeindex), self.matchdatalifeindex, 0);
    if (!isdefined(self.markedentitieslifeindices[entitynum]) || self.markedentitieslifeindices[entitynum] > lifeindex) {
        self.markedentitieslifeindices[entitynum] = lifeindex;
        if (scripts\engine\utility::issharedfuncdefined("player", "doScoreEvent")) {
            self thread [[ scripts\engine\utility::getsharedfunc("player", "doScoreEvent") ]]("binoculars_marked");
        }
    }
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3287
// Size: 0x6e
function binoculars_targetismarked(targetent) {
    if (!isdefined(self.binocularsstruct) || !isdefined(self.binocularsstruct.targetdata)) {
        return false;
    }
    targetdata = self.binocularsstruct.targetdata[targetent function_77eb550af880483a()];
    if (!isdefined(targetdata)) {
        return false;
    }
    return targetdata.state == 5;
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x32fe
// Size: 0x103
function binoculars_giveassistpoints(attacker, victim) {
    if (!isdefined(level.binocularsinited)) {
        return;
    }
    if (!isdefined(attacker) || !isdefined(victim) || !isdefined(attacker.team)) {
        return;
    }
    teammates = [];
    if (issharedfuncdefined("game", "getTeamData")) {
        teammates = [[ getsharedfunc("game", "getTeamData") ]](attacker.team, "players");
    }
    foreach (teammate in teammates) {
        if (teammate == attacker) {
            continue;
        }
        if (teammate binoculars_targetismarked(victim)) {
            if (issharedfuncdefined("player", "doScoreEvent")) {
                teammate thread [[ getsharedfunc("player", "doScoreEvent") ]]("binoculars_assist");
            }
        }
    }
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3409
// Size: 0x28
function binoculars_clearuidata() {
    self setclientomnvar("ui_binoculars_timer", 0);
    self setclientomnvar("ui_binoculars_state", 0);
    self stoplocalsound("eqp_spotter_scope_marking");
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3439
// Size: 0x4f
function binoculars_setuidata(state, timer) {
    if (self getclientomnvar("ui_binoculars_state") == state && self getclientomnvar("ui_binoculars_timer") == timer) {
        return;
    }
    self setclientomnvar("ui_binoculars_state", state);
    self setclientomnvar("ui_binoculars_timer", timer);
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3490
// Size: 0xae
function binoculars_updateuidata() {
    var_4fbba5fa20d85eed = istrue(self.binocularsstruct.markingtarget);
    if (var_4fbba5fa20d85eed) {
        binoculars_setuidata(1, self.binocularsstruct.markingendtime);
        return;
    }
    var_1b92495009d23667 = istrue(self.binocularsstruct.markingcoldblooded);
    if (var_1b92495009d23667) {
        binoculars_setuidata(2, 0);
        return;
    }
    binoculars_setuidata(0, 0);
    if (!istrue(self.binocularsstruct.var_811eb055aa6df60e)) {
        self.binocularsstruct.var_811eb055aa6df60e = 1;
        thread function_972e3424668e97f4();
    }
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3546
// Size: 0xba
function function_972e3424668e97f4() {
    self endon("binoculars_ads_off");
    self endon("disconnect");
    level endon("game_ended");
    while (true) {
        newlookatpos = function_8a8136a64df0f01d();
        if (isdefined(newlookatpos)) {
            targetdistance = distance(self getvieworigin(), newlookatpos);
            targetdegree = asin((newlookatpos[2] - self getvieworigin()[2]) / targetdistance);
            targetdistance *= 0.0254;
            self setclientomnvar("ui_binoculars_target_distance", int(round(targetdistance)));
            self setclientomnvar("ui_binoculars_target_degree", int(round(targetdegree)));
        } else {
            self setclientomnvar("ui_binoculars_target_distance", -1);
        }
        wait 0.15;
    }
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3608
// Size: 0x1c5
function function_8a8136a64df0f01d(var_4da79e9b4e1ffbd5) {
    var_ef51b8985476aebb = ["physicscontents_clipshot", "physicscontents_missileclip", "physicscontents_vehicleclip", "physicscontents_glass"];
    if (isdefined(var_4da79e9b4e1ffbd5)) {
        var_ef51b8985476aebb array_add(var_ef51b8985476aebb, var_4da79e9b4e1ffbd5);
    }
    contentoverride = physics_createcontents(var_ef51b8985476aebb);
    if (isdefined(self.binocularsstruct.lookatpos_time) && isdefined(self.binocularsstruct.lookatpos_time[contentoverride]) && isdefined(self.binocularsstruct.var_19500a5122c11ce8) && self.binocularsstruct.lookatpos_time[contentoverride] == gettime()) {
        return self.binocularsstruct.var_19500a5122c11ce8[contentoverride];
    }
    starttrace = self getvieworigin();
    endtrace = starttrace + anglestoforward(self getplayerangles()) * 50000;
    ignoreents = scripts\cp_mp\utility\killstreak_utility::playerkillstreakgetownerlookatignoreents();
    trace = scripts\engine\trace::ray_trace(starttrace, endtrace, ignoreents, contentoverride);
    self.binocularsstruct.lookatpos_time[contentoverride] = gettime();
    if (trace["hittype"] == "hittype_none") {
        if (isdefined(self.binocularsstruct.var_19500a5122c11ce8) && isdefined(self.binocularsstruct.var_19500a5122c11ce8[contentoverride])) {
            self.binocularsstruct.var_19500a5122c11ce8[contentoverride] = undefined;
        }
        return undefined;
    }
    self.binocularsstruct.var_19500a5122c11ce8[contentoverride] = trace["position"];
    return trace["position"];
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x37d6
// Size: 0x15e
function function_79d9dbea734fc001(viewpoint) {
    if (!isdefined(viewpoint)) {
        return;
    }
    viewdist = distance(self.origin, viewpoint);
    var_56afec62d47e756b = level.var_8b30d8e5d8aecf1.var_3f2c367416b5b6e7;
    zoomlevel = self playergetzoomlevelindex();
    if (zoomlevel > 0) {
        var_56afec62d47e756b += 0.02;
    }
    distmultiplier = 1 - exp(viewdist * -1 / 100);
    offset_factor = viewdist * var_56afec62d47e756b * distmultiplier;
    direction = (viewpoint - level.players[0].origin) / viewdist;
    up_down = (0, 0, 1) * offset_factor;
    left_right = vectorcross(direction, up_down);
    vectors = [viewpoint + up_down, viewpoint - up_down, viewpoint + left_right, viewpoint - left_right];
    for (i = 0; i < vectors.size; i++) {
        var_dcd1632d8f3813d8 = (vectors[i] - self.origin) / viewdist;
        vectors[i] = vectors[i] + var_dcd1632d8f3813d8 * offset_factor * 2;
    }
    return vectors;
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x393d
// Size: 0x9c
function function_b1ff3731b2ae4f66(targetpoint) {
    var_ef51b8985476aebb = ["physicscontents_clipshot", "physicscontents_missileclip", "physicscontents_vehicleclip", "physicscontents_glass"];
    starttrace = self getvieworigin();
    ignoreents = scripts\cp_mp\utility\killstreak_utility::playerkillstreakgetownerlookatignoreents();
    overridecontents = physics_createcontents(var_ef51b8985476aebb);
    trace = scripts\engine\trace::ray_trace(starttrace, targetpoint, ignoreents, overridecontents);
    if (trace["hittype"] == "hittype_none") {
        return targetpoint;
    }
    return trace["position"];
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x39e2
// Size: 0x2a
function function_77eb550af880483a() {
    if (namespace_4e11149030890e64::function_bd27c13c6b8f16fd(self)) {
        return self.var_3d33ce746b270d75.id;
    }
    return self getentitynumber();
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a14
// Size: 0x6c
function function_6226cd474c01848f(targetent) {
    if (namespace_4e11149030890e64::function_bd27c13c6b8f16fd(targetent) && !namespace_8c7f8f6b3076a74a::function_409b4b9bee1fbe1c(targetent)) {
        targetent namespace_4e11149030890e64::function_6021e91c9efbc35c();
        if (isdefined(targetent.var_3d33ce746b270d75.var_7230693117949738)) {
            return targetent.var_3d33ce746b270d75.var_7230693117949738;
        }
    } else if (istrue(targetent.var_b41f2d4772efac2d)) {
        return targetent;
    }
    return undefined;
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a89
// Size: 0x77
function function_f8257e394afead2d() {
    if (namespace_8c7f8f6b3076a74a::function_409b4b9bee1fbe1c(self)) {
        thread namespace_8c7f8f6b3076a74a::function_51fd5f0f2c9e0cba("spotter");
        if (isdefined(level.var_b31dd264ae8db273)) {
            level.var_b31dd264ae8db273.var_a96aac2935b87d1++;
        }
        return;
    }
    thread namespace_4e11149030890e64::function_4d683611cc7d88fc();
    namespace_1170726b2799ea65::function_e4c6e53c9f6e94c8("jup_sp_iliketopretendihaveaplan", "achievementILikeToPretendIHaveAPlan");
    if (isdefined(level.var_b31dd264ae8db273)) {
        level.var_b31dd264ae8db273.var_6709a01d1de361cf++;
    }
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3b08
// Size: 0x86
function function_ee50df7ae647178b(pointa, pointb, ignorelist, contents) {
    raycast = physics_raycast(pointa, pointb, contents, ignorelist, 0, "physicsquery_closest", 1, 1);
    if (raycast.size == 0 || isdefined(raycast[0]["entity"]) && raycast[0]["entity"] == self || isdefined(raycast[0]["scriptable"]) && raycast[0]["scriptable"] == self) {
        return true;
    }
    return false;
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b97
// Size: 0x1ab
function function_42beae79b9afdeef(objective) {
    if (!namespace_8c7f8f6b3076a74a::function_409b4b9bee1fbe1c(objective)) {
        return false;
    }
    var_7e53bfb39bee6ede = undefined;
    if (isdefined(objective.var_3d33ce746b270d75.spotter_ignore_water) && istrue(objective.var_3d33ce746b270d75.spotter_ignore_water)) {
        var_7e53bfb39bee6ede = "physicscontents_water";
    }
    viewpoint = function_8a8136a64df0f01d(var_7e53bfb39bee6ede);
    if (!isdefined(viewpoint)) {
        return false;
    }
    if (isdefined(objective.var_3d33ce746b270d75.min_distance) && isdefined(viewpoint)) {
        var_2aac420621d1c008 = distancesquared(self.origin, viewpoint);
        if (var_2aac420621d1c008 < squared(objective.var_3d33ce746b270d75.min_distance)) {
            return false;
        }
    }
    searchradius = 500;
    var_3d4f9af0f44e9e9 = [viewpoint];
    var_3d4f9af0f44e9e9 = array_combine(var_3d4f9af0f44e9e9, function_79d9dbea734fc001(viewpoint));
    for (i = 0; i < var_3d4f9af0f44e9e9.size; i++) {
        if (isdefined(var_3d4f9af0f44e9e9[i])) {
            if (i != 0) {
                var_3d4f9af0f44e9e9[i] = function_b1ff3731b2ae4f66(var_3d4f9af0f44e9e9[i]);
            }
            if (namespace_8c7f8f6b3076a74a::function_5175ee2a98016ca8(objective)) {
                if (objective namespace_d18e5dabdf7709e4::function_b7755ccb57f05b94(var_3d4f9af0f44e9e9[i])) {
                    return true;
                }
                continue;
            }
            if (isdefined(objective.var_3d33ce746b270d75.objective_radius)) {
                searchradius = objective.var_3d33ce746b270d75.objective_radius;
            }
            var_f25430617ab002f8 = distance(objective.origin, var_3d4f9af0f44e9e9[i]);
            if (var_f25430617ab002f8 < searchradius) {
                return true;
            }
        }
    }
    return false;
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3d4b
// Size: 0xad
function function_a4070ba049bbd2e6(maxrange, cosfov) {
    infov = [];
    var_1c91c276fc7873f7 = array_combine(level.var_8b30d8e5d8aecf1.valid_entities, level.var_8b30d8e5d8aecf1.objectivelocations);
    foreach (item in var_1c91c276fc7873f7) {
        if (istrue(binoculars_targetisvalid(item))) {
            infov = array_add(infov, item);
        }
    }
    return infov;
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e01
// Size: 0x3d
function function_21d6e8e0f57aef6b() {
    if (isdefined(self.equipment)) {
        var_46796a9974780b2a = self.equipment["secondary"];
        if (isdefined(var_46796a9974780b2a) && var_46796a9974780b2a == "equip_binoculars") {
            return true;
        }
    }
    return false;
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e47
// Size: 0x8b
function function_93683605237cc77e() {
    self endon("disconnect");
    binoculars_init();
    thread binoculars_watchforads();
    attachments = function_6527364c1ecca6c6("offhand_spotter_scope_cp");
    weaponobj = makeweapon("offhand_spotter_scope_cp", attachments);
    self notifyonplayercommand("spotter_hotkey_pressed", "+actionslot 1");
    while (true) {
        self waittill("spotter_hotkey_pressed");
        if (!function_2a17aea2030bad61()) {
            continue;
        }
        self giveandfireoffhand(weaponobj);
        if (self isnightvisionon()) {
            waittillframeend();
            self nightvisionviewoff(1);
        }
    }
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3eda
// Size: 0x4f
function function_baa1e373458f1367() {
    level.var_b31dd264ae8db273 = spawnstruct();
    level.var_b31dd264ae8db273.enemiesmarked = 0;
    level.var_b31dd264ae8db273.var_a96aac2935b87d1 = 0;
    level.var_b31dd264ae8db273.var_6709a01d1de361cf = 0;
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f31
// Size: 0xf
function function_fae1b024969b7bb7() {
    if (isdefined(self)) {
        self notify("spotter_hotkey_pressed");
    }
}

// Namespace namespace_e666063f094d5591 / namespace_e875ad14b292bd61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f48
// Size: 0x27
function function_59af417737cb281b() {
    if (isdefined(self) && binoculars_isads()) {
        self notify("binoculars_watchRaceEnd");
        binoculars_endadslogic();
        self releaseoffhand();
    }
}

