// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_247745a526421ba7;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\cp_mp\utility\team_utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\targetmarkergroups.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;

#namespace binoculars;

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44d
// Size: 0x2d
function binoculars_init() {
    if (isdefined(level.binocularsinited)) {
        return;
    }
    level.var_2c4f2a5075921418 = 2 | 131072;
    level.binocularsinited = 1;
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x481
// Size: 0x64
function binoculars_onstateupdatefunc(stateindex, targetent, cansee) {
    switch (stateindex) {
    case 0:
        return binoculars_onstateinvalidupdate(targetent, cansee);
    case 2:
        return binoculars_onstateunmarkedupdate(targetent, cansee);
    case 4:
        return binoculars_onstatemarkpendingupdate(targetent, cansee);
        break;
    }
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ec
// Size: 0x71
function binoculars_onstateenterfunc(stateindex, targetent) {
    switch (stateindex) {
    case 0:
        binoculars_onstateinvalidenter(targetent);
    case 2:
        binoculars_onstateunmarkedenter(targetent);
    case 4:
        binoculars_onstatemarkpendingenter(targetent);
    case 5:
        binoculars_onstatemarkedenter(targetent);
        return;
    }
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x564
// Size: 0x47
function binoculars_onstateexitfunc(stateindex, targetent) {
    switch (stateindex) {
    case 4:
        binoculars_onstatemarkpendingexit(targetent);
    case 5:
        binoculars_onstatemarkedexit(targetent);
        return;
    }
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b2
// Size: 0x4d
function binoculars_ongive(equipmentref, var_cbb2b3d05e48bd27, variantid) {
    if (equipmentref != "equip_binoculars" || getdvarint(@"hash_8bcd5b94785fa58b", 1) != 1) {
        return;
    }
    binoculars_init();
    thread binoculars_watchforads();
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x606
// Size: 0x27
function binoculars_ontake(equipmentref, var_cbb2b3d05e48bd27) {
    if (equipmentref != "equip_binoculars") {
        return;
    }
    self notify("binoculars_take");
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x634
// Size: 0x19
function binoculars_used(grenade) {
    waitframe();
    if (isdefined(grenade)) {
        grenade delete();
    }
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x654
// Size: 0x1ae
function binoculars_watchforads() {
    self endon("disconnect");
    self notify("binoculars_watchForADS");
    self endon("binoculars_watchForADS");
    isads = 0;
    while (1) {
        var_c05958d616ddf1c5 = spawnstruct();
        childthread binoculars_watchracedeath(var_c05958d616ddf1c5);
        childthread binoculars_watchracelaststand(var_c05958d616ddf1c5);
        childthread function_621d5bba47a7c73(var_c05958d616ddf1c5);
        childthread binoculars_watchracetake(var_c05958d616ddf1c5);
        childthread binoculars_watchraceadson(var_c05958d616ddf1c5);
        childthread binoculars_watchraceadsoff(var_c05958d616ddf1c5);
        childthread function_1ba52d293a13fe7a(var_c05958d616ddf1c5);
        childthread function_f802aa89b1f729a0(var_c05958d616ddf1c5);
        childthread function_faec4945097de55d(var_c05958d616ddf1c5);
        childthread function_d32f05ddfe8701fe(var_c05958d616ddf1c5);
        self waittill("binoculars_watchRaceStart");
        waittillframeend();
        death = istrue(var_c05958d616ddf1c5.death);
        take = istrue(var_c05958d616ddf1c5.take);
        adsoff = istrue(var_c05958d616ddf1c5.adsoff) || istrue(var_c05958d616ddf1c5.laststand) || istrue(var_c05958d616ddf1c5.enteredvehicle) || istrue(var_c05958d616ddf1c5.var_12bfb031c0a0efd8) || istrue(var_c05958d616ddf1c5.var_a003e9e51f2cf83) || istrue(var_c05958d616ddf1c5.var_8d20bef4e952f457) || istrue(var_c05958d616ddf1c5.var_ddf65301f7d23098);
        adson = !adsoff && istrue(var_c05958d616ddf1c5.adson);
        if (death || take) {
            self notify("binoculars_watchRaceEnd");
            binoculars_endadslogic();
            return;
        }
        if (adson && !isads) {
            isads = 1;
            thread binoculars_runadslogic();
        } else if (adsoff && isads) {
            isads = 0;
            binoculars_endadslogic();
        }
        self notify("binoculars_watchRaceEnd");
    }
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x809
// Size: 0x31
function binoculars_watchracedeath(var_c05958d616ddf1c5) {
    self endon("binoculars_watchRaceEnd");
    self waittill("death");
    var_c05958d616ddf1c5.death = 1;
    self notify("binoculars_watchRaceStart");
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x841
// Size: 0x31
function binoculars_watchracelaststand(var_c05958d616ddf1c5) {
    self endon("binoculars_watchRaceEnd");
    self waittill("last_stand_start");
    var_c05958d616ddf1c5.laststand = 1;
    self notify("binoculars_watchRaceStart");
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x879
// Size: 0x3a
function function_621d5bba47a7c73(var_c05958d616ddf1c5) {
    self endon("binoculars_watchRaceEnd");
    waittill_any_2("vehicle_enter", "vehicle_change_seat");
    var_c05958d616ddf1c5.enteredvehicle = 1;
    self notify("binoculars_watchRaceStart");
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ba
// Size: 0x31
function binoculars_watchracetake(var_c05958d616ddf1c5) {
    self endon("binoculars_watchRaceEnd");
    self waittill("binoculars_take");
    var_c05958d616ddf1c5.take = 1;
    self notify("binoculars_watchRaceStart");
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f2
// Size: 0x63
function binoculars_watchraceadson(var_c05958d616ddf1c5) {
    self endon("binoculars_watchRaceEnd");
    while (1) {
        weapon = self waittill("offhand_ads_on");
        if (!istrue(self.var_74642c7f377a42c5)) {
            if (getweaponbasename(weapon) == "offhand_spotter_scope_mp") {
                break;
            }
        }
    }
    var_c05958d616ddf1c5.adson = 1;
    self notify("binoculars_watchRaceStart");
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95c
// Size: 0x56
function binoculars_watchraceadsoff(var_c05958d616ddf1c5) {
    self endon("binoculars_watchRaceEnd");
    while (1) {
        weapon = self waittill("offhand_ads_off");
        if (getweaponbasename(weapon) == "offhand_spotter_scope_mp") {
            break;
        }
    }
    var_c05958d616ddf1c5.adsoff = 1;
    self notify("binoculars_watchRaceStart");
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b9
// Size: 0x3c
function function_1ba52d293a13fe7a(var_c05958d616ddf1c5) {
    self endon("binoculars_watchRaceEnd");
    while (1) {
        self waittill("player_isHaywire");
        break;
    }
    var_c05958d616ddf1c5.var_12bfb031c0a0efd8 = 1;
    self notify("binoculars_watchRaceStart");
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9fc
// Size: 0x3c
function function_f802aa89b1f729a0(var_c05958d616ddf1c5) {
    self endon("binoculars_watchRaceEnd");
    while (1) {
        self waittill("gas_begin_coughing");
        break;
    }
    var_c05958d616ddf1c5.var_a003e9e51f2cf83 = 1;
    self notify("binoculars_watchRaceStart");
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa3f
// Size: 0x31
function function_faec4945097de55d(var_c05958d616ddf1c5) {
    self endon("binoculars_watchRaceEnd");
    self waittill("detonate");
    var_c05958d616ddf1c5.var_8d20bef4e952f457 = 1;
    self notify("binoculars_watchRaceStart");
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa77
// Size: 0x31
function function_d32f05ddfe8701fe(var_c05958d616ddf1c5) {
    self endon("binoculars_watchRaceEnd");
    self waittill("binoculars_invalid_weapon");
    var_c05958d616ddf1c5.var_ddf65301f7d23098 = 1;
    self notify("binoculars_watchRaceStart");
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaaf
// Size: 0x117
function binoculars_endadslogic() {
    self notify("binoculars_ads_off");
    namespace_1cd9f6896754adb0::function_c9d0b43701bdba00("binoculars_ads");
    if (isdefined(self.binocularsstruct)) {
        self.binocularsstruct.adson = undefined;
        self.binocularsstruct.var_811eb055aa6df60e = undefined;
        if (isdefined(self.binocularsstruct.targetmarkergroup)) {
            namespace_f48c22429667eba9::targetmarkergroup_off(self.binocularsstruct.targetmarkergroup);
            self.binocularsstruct.targetmarkergroup = undefined;
        }
        binoculars_clearuidata();
        foreach (targetdata in self.binocularsstruct.targetdata) {
            if (!isdefined(targetdata)) {
                continue;
            }
            targetdata.hastargetmarker = undefined;
            if (isdefined(targetdata.headicon)) {
                binoculars_updateheadiconvisibilityforplayer(targetdata, self);
            }
        }
    }
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbcd
// Size: 0xbb
function binoculars_runadslogic() {
    self endon("disconnect");
    self endon("binoculars_ads_off");
    self notify("binoculars_ads_on");
    namespace_1cd9f6896754adb0::set("binoculars_ads", "usability", 0);
    thread function_b2875ea64bc1896f();
    if (!isdefined(self.binocularsstruct)) {
        self.binocularsstruct = spawnstruct();
        self.binocularsstruct.targetdata = [];
        self.binocularsstruct.var_811eb055aa6df60e = 0;
    }
    self.binocularsstruct.adson = 1;
    self.binocularsstruct.targetmarkergroup = namespace_f48c22429667eba9::targetmarkergroup_on("overlaytargetmarkerenemy", self, undefined, self, 0, 0, 0);
    thread binoculars_processtargetdata();
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc8f
// Size: 0x6a
function function_b2875ea64bc1896f() {
    self endon("disconnect");
    self endon("binoculars_ads_off");
    while (1) {
        currentoffhand = self getheldoffhand();
        if (isnullweapon(currentoffhand) || isdefined(currentoffhand.basename) && currentoffhand.basename != "offhand_spotter_scope_mp") {
            break;
        }
        waitframe();
    }
    wait(0.05);
    self notify("binoculars_invalid_weapon");
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd00
// Size: 0x25
function binoculars_isads() {
    return isdefined(self.binocularsstruct) && istrue(self.binocularsstruct.adson);
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd2d
// Size: 0x440
function binoculars_processtargetdata() {
    if (istrue(self.binocularsstruct.var_2877d88b9a6d8cdb)) {
        return;
    }
    self.binocularsstruct.var_2877d88b9a6d8cdb = 1;
    self endon("disconnect");
    while (1) {
        currenttarget = undefined;
        var_5ebb903e8ca2ab84 = [];
        while (1) {
            function_5c3ab97c636c1b90();
            if (binoculars_isads()) {
                targetarray = sortbydistance(self function_c5140fff72feca2d(self.binocularsstruct.maxrange, binoculars_getfov(), level.var_2c4f2a5075921418, 0), self.origin);
                var_56bf4e4b2bb221a7 = [];
                var_cb791416725e9bc6 = 0;
                foreach (targetent in targetarray) {
                    targetnum = targetent getentitynumber();
                    curstate = function_856db8d000d0be6(targetnum);
                    targetdata = self.binocularsstruct.targetdata[targetnum];
                    if (isdefined(targetdata)) {
                        function_34d6333ca8b1f289(targetent);
                    }
                    if (isdefined(currenttarget)) {
                        continue;
                    }
                    if (curstate == 5) {
                        continue;
                    }
                    newstate = binoculars_onstateupdatefunc(curstate, targetent, 1);
                    var_56bf4e4b2bb221a7[targetnum] = 1;
                    var_5ebb903e8ca2ab84[targetnum] = targetent;
                    if (newstate != curstate) {
                        binoculars_onstateexitfunc(curstate, targetent);
                        binoculars_onstateenterfunc(newstate, targetent);
                        if (newstate == 4) {
                            currenttarget = targetent;
                        }
                    }
                }
                foreach (targetent in var_5ebb903e8ca2ab84) {
                    if (!isdefined(targetent)) {
                        continue;
                    }
                    targetnum = targetent getentitynumber();
                    if (!isdefined(var_56bf4e4b2bb221a7[targetnum])) {
                        var_5ebb903e8ca2ab84[targetnum] = undefined;
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
            foreach (targetent in var_5ebb903e8ca2ab84) {
                if (!isdefined(targetent)) {
                    continue;
                }
                if (targetent == currenttarget) {
                    continue;
                }
                curstate = function_856db8d000d0be6(targetent getentitynumber());
                newstate = binoculars_onstateupdatefunc(curstate, targetent, 0);
                if (newstate != curstate) {
                    binoculars_onstateexitfunc(curstate, targetent);
                    binoculars_onstateenterfunc(newstate, targetent);
                }
            }
        }
        if (!isdefined(currenttarget)) {
            waitframe();
            continue;
        }
        lastseentime = gettime();
        cansee = 1;
        var_e6e07516a9f2893e = currenttarget getentitynumber();
        while (1) {
            function_5c3ab97c636c1b90();
            if (binoculars_isads()) {
                if (!isdefined(currenttarget)) {
                    waitframe();
                    break;
                }
                curstate = function_856db8d000d0be6(var_e6e07516a9f2893e);
                if (gettime() - lastseentime > 100) {
                    lastseentime = gettime();
                    cansee = function_67da6f8a8e37737b(currenttarget);
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
                        self.markedents[currenttarget getentitynumber()] = currenttarget;
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

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1174
// Size: 0x3e
function function_856db8d000d0be6(targetnum) {
    targetdata = self.binocularsstruct.targetdata[targetnum];
    if (isdefined(targetdata)) {
        return targetdata.state;
    }
    return 0;
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11ba
// Size: 0xeb
function function_5c3ab97c636c1b90() {
    var_c50a828a855fa65f = getdvarfloat(@"hash_90d4dd93f932de3f", 72);
    self.binocularsstruct.maxrange = binoculars_getmaxrange();
    self.binocularsstruct.maxrangesq = self.binocularsstruct.maxrange * self.binocularsstruct.maxrange;
    self.binocularsstruct.cosfov = cos(binoculars_getfov());
    self.binocularsstruct.projdistsq = var_c50a828a855fa65f * var_c50a828a855fa65f;
    self.binocularsstruct.markingtarget = 0;
    self.binocularsstruct.markingcoldblooded = 0;
    self.binocularsstruct.markingendtime = 0;
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ac
// Size: 0x117
function binoculars_updateMarkedEnts() {
    self endon("disconnect");
    self notify("binoculars_updateMarkedEnts");
    self endon("binoculars_updateMarkedEnts");
    while (isdefined(self.markedents) && self.markedents.size > 0) {
        waitframe();
        foreach (entnum, targetent in self.markedents) {
            if (!isdefined(targetent)) {
                self.markedents[entnum] = undefined;
            } else {
                curstate = 0;
                targetdata = self.binocularsstruct.targetdata[entnum];
                if (isdefined(targetdata)) {
                    curstate = targetdata.state;
                }
                newstate = binoculars_onstatemarkedupdate(targetent);
                if (newstate != curstate) {
                    binoculars_onstateexitfunc(curstate, targetent);
                    binoculars_onstateenterfunc(newstate, targetent);
                    self.markedents[entnum] = undefined;
                }
            }
        }
    }
    self.markedents = undefined;
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ca
// Size: 0x1c7
function function_67da6f8a8e37737b(targetent) {
    contents = namespace_2a184fc4902783dc::create_contents(0, 1, 0, 1, 1, 1, 0, 1);
    tracepoints = [0:targetent.origin];
    if (isplayer(targetent)) {
        headpos = targetent namespace_7e17181d03156026::getstancetop();
        centerpos = targetent namespace_7e17181d03156026::getstancecenter();
        tracepoints = [0:headpos, 1:centerpos, 2:targetent.origin];
    } else if (isagent(targetent)) {
        tracepoints = [0:targetent.origin + (0, 0, 48)];
    }
    ignorelist = [0:self, 1:targetent];
    vehicle = targetent namespace_f8065cafc523dba5::getvehicle();
    if (isdefined(vehicle)) {
        ignorelist[ignorelist.size] = vehicle;
        var_bb7ac665413117fc = vehicle getlinkedchildren(1);
        foreach (child in var_bb7ac665413117fc) {
            ignorelist[ignorelist.size] = vehicle;
        }
    }
    var_da0f17fcc7950d77 = 0;
    foreach (point in tracepoints) {
        if (!namespace_2a184fc4902783dc::ray_trace_passed(self getvieworigin(), point, ignorelist, contents)) {
            continue;
        }
        return 1;
    }
    return 0;
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1599
// Size: 0x5b
function function_34d6333ca8b1f289(targetent) {
    targetdata = self.binocularsstruct.targetdata[targetent getentitynumber()];
    /#
        assert(isdefined(targetdata));
    #/
    targetdata.loschecktime = gettime();
    targetdata.loscheckpassed = 1;
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15fb
// Size: 0x73
function binoculars_cansee(targetent) {
    targetdata = self.binocularsstruct.targetdata[targetent getentitynumber()];
    /#
        assert(isdefined(targetdata));
    #/
    if (!isdefined(targetdata.loschecktime) || gettime() - targetdata.loschecktime > 1000) {
        return 0;
    }
    return istrue(targetdata.loscheckpassed);
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1676
// Size: 0x75
function binoculars_setcurrentstate(targetent, newstate) {
    targetdata = self.binocularsstruct.targetdata[targetent getentitynumber()];
    if (!isdefined(targetdata)) {
        if (newstate == 0) {
            return;
        }
        targetdata = spawnstruct();
        self.binocularsstruct.targetdata[targetent getentitynumber()] = targetdata;
    }
    targetdata.state = newstate;
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16f2
// Size: 0x22
function binoculars_hascoldblooded(targetent) {
    return isplayer(targetent) && targetent _hasperk("specialty_noscopeoutline");
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x171c
// Size: 0xbe
function binoculars_showtargetmarker(targetent, ismarked) {
    targetdata = self.binocularsstruct.targetdata[targetent getentitynumber()];
    if (isdefined(targetdata)) {
        targetdata.hastargetmarker = 1;
    }
    if (!isdefined(self.binocularsstruct.targetmarkergroup)) {
        return;
    }
    namespace_f48c22429667eba9::targetmarkergroup_markentity(targetent, self.binocularsstruct.targetmarkergroup, 0);
    var_177716bec3407a6a = binoculars_hascoldblooded(targetent);
    if (var_177716bec3407a6a) {
        binoculars_settargetmarkerstate(targetent, 3);
    } else if (ismarked) {
        binoculars_settargetmarkerstate(targetent, 2);
    } else {
        binoculars_settargetmarkerstate(targetent, 1);
    }
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17e1
// Size: 0x6a
function binoculars_updatetargetmarker(targetent, ismarked) {
    if (!isdefined(self.binocularsstruct.targetmarkergroup)) {
        return;
    }
    var_177716bec3407a6a = binoculars_hascoldblooded(targetent);
    if (var_177716bec3407a6a) {
        binoculars_settargetmarkerstate(targetent, 3);
    } else if (ismarked) {
        binoculars_settargetmarkerstate(targetent, 2);
    } else {
        binoculars_settargetmarkerstate(targetent, 1);
    }
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1852
// Size: 0x74
function binoculars_hidetargetmarker(targetent) {
    targetdata = self.binocularsstruct.targetdata[targetent getentitynumber()];
    if (isdefined(targetdata)) {
        targetdata.hastargetmarker = undefined;
    }
    if (!isdefined(self.binocularsstruct.targetmarkergroup)) {
        return;
    }
    namespace_f48c22429667eba9::targetmarkergroup_unmarkentity(targetent, self.binocularsstruct.targetmarkergroup);
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18cd
// Size: 0x73
function binoculars_settargetmarkerstate(targetent, state) {
    var_7cbb905f3204b5d0 = (state >> 0) % 2 == 1;
    var_1f6ff6a3877bf04 = (state >> 1) % 2 == 1;
    targetmarkergroupsetentitystate(self.binocularsstruct.targetmarkergroup, targetent, var_7cbb905f3204b5d0);
    targetmarkergroupsetextrastate(self.binocularsstruct.targetmarkergroup, targetent, var_1f6ff6a3877bf04);
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1947
// Size: 0xba
function binoculars_addheadicon(targetent) {
    var_f98e48f2527d4205 = "hud_icon_new_marked";
    if (namespace_7bdde15c3500a23f::function_6ede573723f08c0f()) {
        var_f98e48f2527d4205 = "hud_icon_head_marked";
    }
    var_f9cd7fda74e92e2a = 8;
    var_e0e11f3b4551be11 = 1;
    var_c5409ca7522182b3 = 0;
    var_30516b4afd1763de = 500;
    targetdata = self.binocularsstruct.targetdata[targetent getentitynumber()];
    /#
        assert(isdefined(targetdata));
    #/
    targetdata.headicon = targetent namespace_7bdde15c3500a23f::setheadicon_singleimage([], var_f98e48f2527d4205, var_f9cd7fda74e92e2a, var_e0e11f3b4551be11, var_c5409ca7522182b3, var_30516b4afd1763de, undefined, 1, 1);
    thread binoculars_cleanupheadiconondisconnect(targetent);
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a08
// Size: 0xb5
function binoculars_updateheadiconvisibility(targetent) {
    targetdata = self.binocularsstruct.targetdata[targetent getentitynumber()];
    if (!isdefined(targetdata) || !isdefined(targetdata.headicon)) {
        return;
    }
    players = namespace_54d20dd0dd79277f::getteamdata(self.team, "players");
    foreach (player in players) {
        binoculars_updateheadiconvisibilityforplayer(targetdata, player);
    }
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ac4
// Size: 0x91
function binoculars_updateheadiconvisibilityforplayer(targetdata, player) {
    /#
        assert(isdefined(targetdata));
    #/
    /#
        assert(isdefined(targetdata.headicon));
    #/
    shouldshow = 1;
    if (player == self && binoculars_isads() && istrue(targetdata.hastargetmarker)) {
        shouldshow = 0;
    }
    if (shouldshow) {
        namespace_7bdde15c3500a23f::setheadicon_addclienttomask(targetdata.headicon, player);
    } else {
        namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(targetdata.headicon, player);
    }
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b5c
// Size: 0xa1
function binoculars_cleanupheadiconondisconnect(targetent) {
    entnum = targetent getentitynumber();
    self endon("disconnect");
    self endon("removeHeadIcon_" + entnum);
    targetent waittill("disconnect");
    if (isdefined(self.binocularsstruct) && isdefined(self.binocularsstruct.targetdata)) {
        targetdata = self.binocularsstruct.targetdata[entnum];
        if (isdefined(targetdata) && isdefined(targetdata.headicon)) {
            namespace_7bdde15c3500a23f::setheadicon_deleteicon(targetdata.headicon);
        }
    }
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c04
// Size: 0x5d
function binoculars_removeheadicon(targetent) {
    targetdata = self.binocularsstruct.targetdata[targetent getentitynumber()];
    /#
        assert(isdefined(targetdata));
    #/
    namespace_7bdde15c3500a23f::setheadicon_deleteicon(targetdata.headicon);
    self notify("removeHeadIcon_" + targetent getentitynumber());
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c68
// Size: 0x1d
function binoculars_onstateinvalidenter(targetent) {
    binoculars_hidetargetmarker(targetent);
    binoculars_setcurrentstate(targetent, 0);
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c8c
// Size: 0x33
function binoculars_onstateinvalidupdate(targetent, cansee) {
    istargetvalid = binoculars_targetisvalid(targetent);
    if (istargetvalid && cansee) {
        return 2;
    }
    return 0;
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cc7
// Size: 0x1f
function binoculars_onstateunmarkedenter(targetent) {
    binoculars_showtargetmarker(targetent, 0);
    binoculars_setcurrentstate(targetent, 2);
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ced
// Size: 0x75
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

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d6a
// Size: 0x2a
function binoculars_onstatemarkpendingenter(targetent) {
    binoculars_setpendingtimer(targetent);
    binoculars_setcurrentstate(targetent, 4);
    self playlocalsound("eqp_spotter_scope_marking");
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d9b
// Size: 0x20
function binoculars_onstatemarkpendingexit(targetent) {
    binoculars_clearpendingtimer(targetent);
    self stoplocalsound("eqp_spotter_scope_marking");
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dc2
// Size: 0xda
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

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ea4
// Size: 0xa9
function binoculars_onstatemarkedenter(targetent) {
    binoculars_addheadicon(targetent);
    binoculars_updateheadiconvisibility(targetent);
    binoculars_showtargetmarker(targetent, 1);
    binoculars_setexpirationtimer(targetent);
    binoculars_addmarkpoints(targetent);
    binoculars_setcurrentstate(targetent, 5);
    self playlocalsound("eqp_spotter_scope_marked_beep");
    self stoplocalsound("eqp_spotter_scope_marking");
    incpersstat("binocularMarks", 1);
    namespace_aad14af462a74d08::function_b0f754c8a379154e("equip_binoculars", self, int(distance(self.origin, targetent.origin)), function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"hit"));
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f54
// Size: 0x28
function binoculars_onstatemarkedexit(targetent) {
    binoculars_removeheadicon(targetent);
    binoculars_clearexpirationtimer(targetent);
    self stoplocalsound("eqp_spotter_scope_marking");
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f83
// Size: 0x6a
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

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ff5
// Size: 0x94
function binoculars_targetisvalid(targetent) {
    return isdefined(targetent) && binoculars_isads() && !(isplayer(targetent) && !isreallyalive(targetent)) && !(isagent(targetent) && !isalive(targetent)) && !(level.teambased && isdefined(targetent.team) && targetent.team == self.team) && targetent != self && binoculars_istargetinrange(targetent) && binoculars_istargetinbroadfov(targetent);
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2091
// Size: 0x81
function binoculars_targetisvalidmark(targetent) {
    if (!isdefined(targetent)) {
        return 0;
    }
    if (isplayer(targetent) && !isreallyalive(targetent)) {
        return 0;
    }
    if (isagent(targetent) && !isalive(targetent)) {
        return 0;
    }
    if (level.teambased) {
        if (isdefined(targetent.team) && targetent.team == self.team) {
            return 0;
        }
    } else if (targetent == self) {
        return 0;
    }
    return 1;
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x211a
// Size: 0x41
function binoculars_getmaxrange() {
    var_801f8d99adff8b0 = self playergetzoomlevelindex();
    if (var_801f8d99adff8b0 > 0) {
        return getdvarint(@"hash_60c09b13568650e9", 30000);
    } else {
        return getdvarint(@"hash_c11b9fbc2f45b442", 15000);
    }
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2162
// Size: 0x15
function binoculars_getfov() {
    var_b52cdf6675378a31 = self playergetzoomfov();
    return var_b52cdf6675378a31;
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x217f
// Size: 0x39
function binoculars_istargetinrange(targetent) {
    return distancesquared(self.origin, targetent.origin) < self.binocularsstruct.maxrangesq;
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21c0
// Size: 0x3f
function binoculars_istargetinbroadfov(targetent) {
    return within_fov(self.origin, self getplayerangles(), targetent.origin, self.binocularsstruct.cosfov);
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2207
// Size: 0x15a
function binoculars_iswithinprojectiondistance_compute(targetent) {
    pointa = self getvieworigin();
    pointb = pointa + anglestoforward(self getplayerangles()) * self.binocularsstruct.maxrange;
    var_20c094516733ffb1 = [0:targetent.origin];
    if (isplayer(targetent)) {
        headpos = targetent namespace_7e17181d03156026::getstancetop();
        centerpos = targetent namespace_7e17181d03156026::getstancecenter();
        var_20c094516733ffb1 = [0:headpos, 1:centerpos, 2:targetent.origin];
    } else if (isagent(targetent)) {
        var_20c094516733ffb1 = [0:targetent.origin + (0, 0, 48)];
    }
    foreach (point in var_20c094516733ffb1) {
        distsq = lengthsquared(vectorfromlinetopoint(pointa, pointb, point));
        if (distsq < self.binocularsstruct.projdistsq) {
            return 1;
        }
    }
    return 0;
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2369
// Size: 0x6e
function binoculars_updateprojectiondistance(targetent) {
    passed = binoculars_iswithinprojectiondistance_compute(targetent);
    targetdata = self.binocularsstruct.targetdata[targetent getentitynumber()];
    /#
        assert(isdefined(targetdata));
    #/
    if (passed) {
        targetdata.withinprojectiondistance = 1;
    } else {
        targetdata.withinprojectiondistance = undefined;
    }
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23de
// Size: 0x48
function binoculars_iswithinprojectiondistance(targetent) {
    targetdata = self.binocularsstruct.targetdata[targetent getentitynumber()];
    /#
        assert(isdefined(targetdata));
    #/
    return istrue(targetdata.withinprojectiondistance);
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x242e
// Size: 0x55
function binoculars_setpendingtimer(targetent) {
    targetdata = self.binocularsstruct.targetdata[targetent getentitynumber()];
    /#
        assert(isdefined(targetdata));
    #/
    targetdata.pendingtimer = gettime() + binoculars_getpendingtime(targetent);
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x248a
// Size: 0x47
function binoculars_clearpendingtimer(targetent) {
    targetdata = self.binocularsstruct.targetdata[targetent getentitynumber()];
    /#
        assert(isdefined(targetdata));
    #/
    targetdata.pendingtimer = undefined;
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24d8
// Size: 0x5e
function binoculars_checkpendingtimer(targetent) {
    targetdata = self.binocularsstruct.targetdata[targetent getentitynumber()];
    /#
        assert(isdefined(targetdata));
    #/
    if (!isdefined(targetdata.pendingtimer)) {
        return 0;
    }
    return gettime() > targetdata.pendingtimer;
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x253e
// Size: 0x111
function binoculars_getpendingtime(targetent) {
    mindistance = getdvarfloat(@"hash_f59503ac1ff0e454", 2500);
    maxdistance = getdvarfloat(@"hash_c7d3a5fbd69e4e06", 5000);
    if (mindistance >= maxdistance) {
        return getdvarfloat(@"hash_882715f356441b92", 500);
    }
    disttotarget = distance(self.origin, targetent.origin);
    if (disttotarget <= mindistance) {
        return getdvarfloat(@"hash_882715f356441b92", 500);
    } else if (disttotarget >= 5000) {
        return getdvarfloat(@"hash_81f96de1624a2fc0", 500);
    } else {
        mintime = getdvarfloat(@"hash_882715f356441b92", 500);
        maxtime = getdvarfloat(@"hash_81f96de1624a2fc0", 500);
        var_3042a94e9a4ad389 = (disttotarget - mindistance) / (maxdistance - mindistance);
        return int(math::lerp(mintime, maxtime, var_3042a94e9a4ad389));
    }
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2656
// Size: 0x64
function binoculars_getpendingendtime(targetent) {
    targetdata = self.binocularsstruct.targetdata[targetent getentitynumber()];
    /#
        assert(isdefined(targetdata));
    #/
    if (!isdefined(targetdata.pendingtimer)) {
        return (gettime() + binoculars_getpendingtime(targetent));
    }
    return targetdata.pendingtimer;
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26c2
// Size: 0x6b
function binoculars_setexpirationtimer(targetent) {
    targetdata = self.binocularsstruct.targetdata[targetent getentitynumber()];
    /#
        assert(isdefined(targetdata));
    #/
    expiretime = getdvarint(@"hash_b9e9ee1040e95fe3", 5000);
    targetdata.expirationtimer = gettime() + expiretime;
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2734
// Size: 0x47
function binoculars_clearexpirationtimer(targetent) {
    targetdata = self.binocularsstruct.targetdata[targetent getentitynumber()];
    /#
        assert(isdefined(targetdata));
    #/
    targetdata.expirationtimer = undefined;
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2782
// Size: 0x5f
function binoculars_checkexpirationtimer(targetent) {
    targetdata = self.binocularsstruct.targetdata[targetent getentitynumber()];
    /#
        assert(isdefined(targetdata));
    #/
    if (!isdefined(targetdata.expirationtimer)) {
        return 1;
    }
    return gettime() >= targetdata.expirationtimer;
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27e9
// Size: 0x9f
function binoculars_addmarkpoints(targetent) {
    if (!isdefined(self.markedentitieslifeindices)) {
        self.markedentitieslifeindices = [];
    }
    entitynum = targetent getentitynumber();
    lifeindex = ter_op(isdefined(self.matchdatalifeindex), self.matchdatalifeindex, 0);
    if (!isdefined(self.markedentitieslifeindices[entitynum]) || self.markedentitieslifeindices[entitynum] > lifeindex) {
        self.markedentitieslifeindices[entitynum] = lifeindex;
        thread doScoreEvent(#"hash_6ebe4fc013b04480");
        namespace_99ac021a7547cae3::playerHasMoved();
    }
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x288f
// Size: 0x6e
function binoculars_targetismarked(targetent) {
    if (!isdefined(self.binocularsstruct) || !isdefined(self.binocularsstruct.targetdata)) {
        return 0;
    }
    targetdata = self.binocularsstruct.targetdata[targetent getentitynumber()];
    if (!isdefined(targetdata)) {
        return 0;
    }
    return targetdata.state == 5;
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2905
// Size: 0xcb
function binoculars_giveassistpoints(attacker, victim) {
    if (!isdefined(level.binocularsinited)) {
        return;
    }
    if (!isdefined(attacker) || !isdefined(victim) || !isdefined(attacker.team)) {
        return;
    }
    teammates = namespace_54d20dd0dd79277f::getteamdata(attacker.team, "players");
    foreach (teammate in teammates) {
        if (teammate == attacker) {
            continue;
        }
        if (teammate binoculars_targetismarked(victim)) {
            teammate thread namespace_48a08c5037514e04::doScoreEvent(#"hash_1928d4dc8bb8669f");
        }
    }
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29d7
// Size: 0x29
function binoculars_clearuidata() {
    self setclientomnvar("ui_binoculars_timer", 0);
    self setclientomnvar("ui_binoculars_state", 0);
    self stoplocalsound("eqp_spotter_scope_marking");
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a07
// Size: 0x50
function binoculars_setuidata(state, timer) {
    if (self getclientomnvar("ui_binoculars_state") == state && self getclientomnvar("ui_binoculars_timer") == timer) {
        return;
    }
    self setclientomnvar("ui_binoculars_state", state);
    self setclientomnvar("ui_binoculars_timer", timer);
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a5e
// Size: 0xaf
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

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b14
// Size: 0xbb
function function_972e3424668e97f4() {
    self endon("binoculars_ads_off");
    self endon("disconnect");
    level endon("game_ended");
    while (1) {
        var_a705a5a2e887557b = function_8a8136a64df0f01d();
        if (isdefined(var_a705a5a2e887557b)) {
            targetdistance = distance(self getvieworigin(), var_a705a5a2e887557b);
            var_48f6e924bb30ee5c = asin((var_a705a5a2e887557b[2] - self getvieworigin()[2]) / targetdistance);
            targetdistance = targetdistance * 0.0254;
            self setclientomnvar("ui_binoculars_target_distance", int(round(targetdistance)));
            self setclientomnvar("ui_binoculars_target_degree", int(round(var_48f6e924bb30ee5c)));
        } else {
            self setclientomnvar("ui_binoculars_target_distance", -1);
        }
        wait(0.15);
    }
}

// Namespace binoculars/namespace_7111b1420b25d0ad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bd6
// Size: 0xb0
function function_8a8136a64df0f01d() {
    content = [0:"physicscontents_characterproxy", 1:"physicscontents_clipshot", 2:"physicscontents_missileclip", 3:"physicscontents_vehicleclip"];
    contentoverride = physics_createcontents(content);
    starttrace = self getvieworigin();
    endtrace = starttrace + anglestoforward(self getplayerangles()) * 50000;
    ignoreents = namespace_9abe40d2af041eb2::playerkillstreakgetownerlookatignoreents();
    trace = namespace_2a184fc4902783dc::ray_trace(starttrace, endtrace, ignoreents, contentoverride);
    if (trace["hittype"] == "hittype_none") {
        return undefined;
    }
    return trace["position"];
}

