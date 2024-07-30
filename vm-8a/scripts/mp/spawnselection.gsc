#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\flags.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\mp\spawnselection.gsc;
#using scripts\common\ui.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\trigger.gsc;
#using scripts\mp\spawnscoring.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\gametypes\arm_vehicles.gsc;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\spawncamera.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\flashpoint.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using script_58be75c518bf0d40;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\mp\tweakables.gsc;
#using scripts\mp\objidpoolmanager.gsc;

#namespace spawnselection;

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd37
// Size: 0x282
function init() {
    if (scripts\mp\spawnselection::function_167619fe3d0cff00()) {
        setdvar(@"hash_5fc696f5bbb3ca62", 0);
    } else {
        return;
    }
    level.usec130spawn = getdvarint(@"hash_d5257119daec762d", 0) == 1;
    level.usesquadspawn = getdvarint(@"hash_2314646deabe3144", 0) == 1;
    level.usesquadspawnselection = getdvarint(@"hash_923f96b1d9a290b4", 1) == 1;
    level.spawnsquadleaderonly = getdvarint(@"hash_fc11053944ab5f7e", 0) == 1;
    level.var_f15becfbc1b01a1b = getdvarint(@"hash_ee75f0b9d9e03349", 1) == 1;
    level.var_a50b22fa98674a50 = getdvarint(@"hash_ef54007b614237da", 0) == 1;
    level.var_6f40c2b6970373c0 = getdvarint(@"hash_8fe41b9ffb4e54aa", 1) == 1;
    level.var_757ec02df4d678f5 = getdvarint(@"hash_537448d6935dd02b", 1) == 1;
    level.var_111c5f085a86c2f0 = &function_f83711dd7546db96;
    level.var_aba39caf969cd3f7 = &function_dc659688380c4195;
    level.checkspawnselectionafk = matchmakinggame() && getdvarint(@"hash_a66999457b70da2", 1) == 1;
    level.var_f13131261b4c6ad5 = getdvarint(@"hash_6560b9b4c5fcbab", 0) == 1;
    level.var_ca4fe20b267c4f54 = getdvarint(@"hash_9fe20711e5bcee42", 0) == 1;
    level.var_4d2556c1d0f4893e = getdvarint(@"hash_a959156dff929a38", 0) == 1;
    level.var_7119a108c4ba4d2c = getdvarint(@"hash_4ce0b40aac178e56", 0) == 1;
    level.var_c0e8540c63b7af50 = getdvarfloat(@"hash_79708dd3ddf8ed32", 0);
    level.var_f335c53db1d6dd34 = getdvarint(@"hash_8e9e98f013db1ac4", 1) == 1;
    level.availablespawnlocations = [];
    foreach (entry in level.teamnamelist) {
        level.availablespawnlocations[entry] = [];
    }
    if (!isdefined(level.var_d280c5fdb0036183)) {
        level.var_d280c5fdb0036183 = &function_dc3a172bf923d9b3;
    }
    level thread initspawns();
    scripts\common\ui::lui_registercallback("tac_ops_spawn_focus_changed", &endcondition_focuschanged);
    scripts\mp\utility\spawn_event_aggregator::registeronplayerspawncallback(&isplayerindanger_think);
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc1
// Size: 0x4
function function_dc3a172bf923d9b3() {
    return true;
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfce
// Size: 0x2
function delayspawntoc130() {
    
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfd8
// Size: 0x185
function churnareas() {
    lanenames = [];
    lanenames[0] = "lane01_";
    lanenames[1] = "lane02_";
    lanenames[2] = "lane03_";
    alliesareas = [];
    alliesareas[alliesareas.size] = lanenames[0] + randomint(3) + 1;
    alliesareas[alliesareas.size] = lanenames[1] + randomint(3) + 1;
    alliesareas[alliesareas.size] = lanenames[2] + randomint(3) + 1;
    setspawnlocations(alliesareas, "allies");
    axisareas = [];
    axisareas[alliesareas.size] = lanenames[0] + randomint(3) + 1;
    axisareas[alliesareas.size] = lanenames[1] + randomint(3) + 1;
    axisareas[alliesareas.size] = lanenames[2] + randomint(3) + 1;
    setspawnlocations(axisareas, "axis");
    updatespawnareas();
    while (true) {
        wait 10;
        alliesareas = [];
        alliesareas[alliesareas.size] = lanenames[0] + randomint(3) + 1;
        alliesareas[alliesareas.size] = lanenames[1] + randomint(3) + 1;
        alliesareas[alliesareas.size] = lanenames[2] + randomint(3) + 1;
        setspawnlocations(alliesareas, "allies");
        axisareas = [];
        axisareas[axisareas.size] = lanenames[0] + randomint(3) + 1;
        axisareas[axisareas.size] = lanenames[1] + randomint(3) + 1;
        axisareas[axisareas.size] = lanenames[2] + randomint(3) + 1;
        setspawnlocations(axisareas, "axis");
        updatespawnareas();
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1165
// Size: 0x19b
function setspawnlocations(refarray, team) {
    dynamiclocations = [];
    foreach (loc in level.availablespawnlocations[team]) {
        if (issubstr(loc, "dynamic") || issubstr(loc, "vehicle") || issubstr(loc, "squad")) {
            dynamiclocations[dynamiclocations.size] = loc;
        }
    }
    level.availablespawnlocations[team] = [];
    foreach (ref in refarray) {
        if (!array_contains(level.availablespawnlocations[team], ref)) {
            level.availablespawnlocations[team][level.availablespawnlocations[team].size] = ref;
        }
    }
    foreach (ref in dynamiclocations) {
        if (!array_contains(level.availablespawnlocations[team], ref)) {
            level.availablespawnlocations[team][level.availablespawnlocations[team].size] = ref;
        }
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1308
// Size: 0x42
function allowspawnlocation(ref, team) {
    if (!array_contains(level.availablespawnlocations[team], ref)) {
        level.availablespawnlocations[team][level.availablespawnlocations[team].size] = ref;
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1352
// Size: 0x87
function removespawnlocation(ref, team) {
    availablespawnlocations = [];
    foreach (location in level.availablespawnlocations[team]) {
        if (location != ref) {
            availablespawnlocations[availablespawnlocations.size] = location;
        }
    }
    level.availablespawnlocations[team] = availablespawnlocations;
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e1
// Size: 0xa
function updatespawnareas() {
    level notify("tac_ops_map_changed");
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13f3
// Size: 0x9e
function initspawns() {
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    if (!isdefined(level.var_a88344345b7590c8)) {
        level.var_a88344345b7590c8 = &setupspawnlocations;
    }
    [[ level.var_a88344345b7590c8 ]]();
    if (getgametype() == "arm" || getgametype() == "conflict" || getgametype() == "risk" || getgametype() == "bigctf") {
        setupspawninfluencezones();
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1499
// Size: 0x4c1
function setupspawnlocations() {
    while (!isdefined(level.gamemodespawnpointnames)) {
        waitframe();
    }
    level.spawnselectionlocations = [];
    foreach (entry in level.teamnamelist) {
        spawns = scripts\mp\spawnlogic::getspawnpointarray(level.gamemodespawnpointnames[entry]);
        scripts\mp\spawnlogic::registerspawnpoints(entry, spawns);
        foreach (s in spawns) {
            if (!isdefined(s.target) || s.target == "") {
                continue;
            }
            targets = getentarray(s.target, "targetname");
            if (!isdefined(targets) || targets.size == 0) {
                targets = getstructarray(s.target, "targetname");
            }
            if (targets.size == 0) {
                continue;
            }
            target = undefined;
            if (targets.size == 1) {
                target = targets[0];
            } else if (isdefined(scripts\cp_mp\utility\game_utility::getlocaleid())) {
                foreach (ent in targets) {
                    if (isdefined(ent.script_noteworthy) && ent.script_noteworthy == level.localeid) {
                        target = ent;
                        break;
                    }
                }
            } else {
                closestdistsq = undefined;
                foreach (ent in targets) {
                    distsq = distancesquared(s.origin, ent.origin);
                    if (!isdefined(closestdistsq) || distsq < closestdistsq) {
                        target = ent;
                        closestdistsq = distsq;
                    }
                }
            }
            if (!isdefined(target)) {
                continue;
            }
            ref = target.script_label;
            team = entry;
            if (isdefined(target.script_team) && isgameplayteam(target.script_team)) {
                if (scripts\cp_mp\utility\game_utility::getmapname() == "mp_quarry2" && target.targetname == "gw_fob_03_safe_axis") {
                    team = "axis";
                } else if (team == "team_three" || team == "team_four") {
                } else {
                    team = target.script_team;
                }
            }
            if (isdefined(level.spawnselectionlocations[ref]) && isdefined(level.spawnselectionlocations[ref][team])) {
                loc = level.spawnselectionlocations[ref][team];
                if (!array_contains(loc.spawnpoints, s)) {
                    loc.spawnpoints[loc.spawnpoints.size] = s;
                }
                continue;
            }
            struct = spawnstruct();
            struct.origin = target.origin;
            struct.angles = target.angles;
            struct.spawnpoints = [];
            struct.spawnpoints[0] = s;
            if (!issubstr(ref, "safe")) {
                initspawnarea(team, struct, ref);
                continue;
            }
            level.spawnselectionlocations[ref][team] = struct;
        }
        foreach (key, teamarray in level.spawnselectionlocations) {
            if (isdefined(teamarray[entry])) {
                scripts\mp\spawnlogic::registerspawnset(key + "_" + entry, teamarray[entry].spawnpoints);
            }
        }
    }
    level.usespawnselection = scripts\mp\spawnselection::function_167619fe3d0cff00() && level.spawnselectionlocations.size > 0;
    if (level.usespawnselection) {
        level.getspawnpoint = &getspawnpoint;
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1962
// Size: 0x16a
function initspawnarea(team, struct, ref) {
    typeid = tablelookuprownum("mp/spawnSelectionMapData.csv", 0, ref);
    assertex(typeid >= 0, "tac_ops_map::addSpawnArea() - Unknown typeRef \"" + ref + "\"");
    anchorent = spawn("script_model", struct.origin);
    anchorent setmodel("tag_origin");
    struct.anchorentity = anchorent;
    struct.typeid = typeid;
    struct.typeref = ref;
    struct.owner = "allies";
    if (!issubstr(ref, "HQ") && !issubstr(ref, "vehicle")) {
        var_53db5ba095078996 = undefined;
        if (isdefined(level.localeid)) {
            var_53db5ba095078996 = getlabelid(ref + "_" + level.localeid);
        }
        if (!isdefined(var_53db5ba095078996) || var_53db5ba095078996 == -1) {
            struct.labelid = typeid;
        } else {
            struct.labelid = var_53db5ba095078996;
        }
    } else {
        struct.labelid = typeid;
    }
    if (isdefined(struct.dynamicent)) {
        anchorent linkto(struct.dynamicent);
    }
    level.spawnselectionlocations[ref][team] = struct;
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ad4
// Size: 0x2b
function getlabelid(ref) {
    labelid = tablelookuprownum("mp/spawnSelectionMapData.csv", 0, ref);
    if (!isdefined(labelid)) {
        labelid = 0;
    }
    return labelid;
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1b08
// Size: 0x34
function setanchorent(ref, team, ent) {
    level.spawnselectionlocations[ref][team].anchorentity = ent;
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b44
// Size: 0x7e
function setupspawninfluencezones() {
    level.spawninfluencezones = [];
    for (i = 1; i <= 5; i++) {
        trigger = scripts\cp_mp\utility\game_utility::getlocaleent("gw_fob_0" + i + "_spawnInfluenceZone");
        if (!isdefined(trigger)) {
            continue;
        }
        scripts\mp\utility\trigger::makeenterexittrigger(trigger, &spawninfluencezone_onusebegin, &spawninfluencezone_onuseend);
        trigger.touchlist = [];
        level.spawninfluencezones["gw_fob_0" + i] = trigger;
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bca
// Size: 0x56
function spawninfluencezone_onusebegin(ent, trigger) {
    if (isdefined(ent.classname) && ent.classname == "script_vehicle") {
        return;
    }
    trigger.touchlist = array_add(trigger.touchlist, ent);
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c28
// Size: 0x56
function spawninfluencezone_onuseend(ent, trigger) {
    if (isdefined(ent.classname) && ent.classname == "script_vehicle") {
        return;
    }
    trigger.touchlist = array_remove(trigger.touchlist, ent);
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c86
// Size: 0xad
function isteamtouching(team) {
    found = 0;
    validtouchlist = [];
    foreach (entry in self.touchlist) {
        if (!isdefined(entry)) {
            continue;
        }
        if (isdefined(entry.team) && entry.team == team) {
            found = 1;
        }
        validtouchlist[validtouchlist.size] = entry;
    }
    self.touchlist = validtouchlist;
    return found;
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d3c
// Size: 0x830
function getspawnpoint() {
    scripts\mp\spawnlogic::deactivateallspawnsets();
    if (scripts\mp\spawnlogic::shoulduseteamstartspawn()) {
        spawnpoints = scripts\mp\spawnlogic::getspawnpointarray(level.gamemodestartspawnpointnames[self.team]);
        spawnpoint = scripts\mp\spawnlogic::getspawnpoint_startspawn(spawnpoints);
        return spawnpoint;
    }
    spawnpoint = undefined;
    self.wassquadspawned = 0;
    if (isdefined(self.selectedspawnarea)) {
        printspawnmessage("spawnSelection::getSpawnPoint() = " + self.selectedspawnarea);
        if (issubstr(self.selectedspawnarea, "squad")) {
            index = undefined;
            if (self.selectedspawnarea == "squad_leader") {
                index = level.squaddata[self.team][self.sessionsquadid].squadleader.var_3f78c6a0862f9e25;
            } else {
                index = int(getsubstr(self.selectedspawnarea, self.selectedspawnarea.size - 1, self.selectedspawnarea.size));
            }
            teammate = level.squaddata[self.team][self.sessionsquadid].players[index];
            spawnpoint = scripts\mp\spawnscoring::findteammatebuddyspawn(teammate);
            teammate thread scripts\mp\utility\points::doScoreEvent(#"squad_spawn");
            thread scripts\mp\utility\points::doScoreEvent(#"hash_5fe4192c1fd1be4c");
            self.wassquadspawned = 1;
            if (isdefined(teammate.vehicle)) {
                self.spawningintovehicle = 1;
                self.vehiclespawninginto = teammate.vehicle.vehiclename;
            }
            scripts\mp\utility\stats::incpersstat("spawnSelectSquad", 1);
            teammate scripts\mp\utility\stats::incpersstat("timesSelectedAsSquadLeader", 1);
        } else if (issubstr(self.selectedspawnarea, "dynamic")) {
            spawnpoint = scripts\mp\spawnlogic::getspawnpoint(self, self.team, undefined, undefined, 2);
            thread scripts\mp\gametypes\arm_vehicles::spawnplayertoc130();
        } else if (issubstr(self.selectedspawnarea, "vehicle")) {
            spawnpoint = scripts\mp\spawnlogic::getspawnpoint(self, self.team, undefined, undefined, 2);
            vehicleent = level.spawnselectionlocations[self.selectedspawnarea][self.team].dynamicent;
            forwardoffset = -200;
            heightoffset = 64;
            spawnpoint.origin = vehicleent.origin + anglestoforward(vehicleent.angles) * forwardoffset + (0, 0, heightoffset);
            spawnpoint.angles = (0, vehicleent.angles[1], 0);
            seat = function_d3d95972f58ad2bc(vehicleent);
            if (isdefined(seat) && istrue(scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_vehiclecanbeused(vehicleent)) && (istrue(scripts\cp_mp\vehicles\vehicle_spawn::vehicle_spawn_getleveldataforvehicle(vehicleent scripts\cp_mp\vehicles\vehicle::function_d93ec4635290febd()).var_1ad50a59da38c8f5) || seat == "driver")) {
                data = spawnstruct();
                data.useonspawn = 1;
                data.enterstartwaitmsg = "spawned_player";
                thread vehicle_occupancy_enter(vehicleent, seat, self, data);
            } else {
                exitboundinginfo = function_517f60905f08bf96(vehicleent);
                var_b8e7e41430673dd2 = vehicle_occupancy_getleveldataforvehicle(vehicleent.vehiclename);
                var_de71eef0ad57608 = 0;
                foreach (ref, direction in var_b8e7e41430673dd2.exitdirections) {
                    if (direction == "top" || direction == "inside") {
                        position = vehicle_occupancy_getexitposition(vehicleent, self, ref, exitboundinginfo, 1);
                        exitoffset = var_b8e7e41430673dd2.exitoffsets[ref];
                        if (isdefined(position)) {
                            spawnpoint.origin = position;
                            self.var_f109e15fae27ddc2 = vehicleent;
                            self.platformoffset = exitoffset;
                            thread scripts\cp_mp\vehicles\vehicle::vehicle_preventplayercollisiondamagefortimeafterexit(vehicleent, self);
                            break;
                        }
                        if (!var_de71eef0ad57608) {
                            var_de71eef0ad57608 = 1;
                            var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicleent scripts\cp_mp\vehicles\vehicle::function_d93ec4635290febd());
                            exitoffset = var_e2818ad39a3341b4.exitoffsets[ref];
                            spawnpoint.origin = vehicleent.origin + rotatevector(exitoffset, vehicleent.angles);
                            self.var_f109e15fae27ddc2 = vehicleent;
                            self.platformoffset = exitoffset;
                            thread scripts\cp_mp\vehicles\vehicle::vehicle_preventplayercollisiondamagefortimeafterexit(vehicleent, self);
                        }
                    }
                }
            }
            driver = vehicle_occupancy_getdriver(vehicleent);
            vehicleref = vehicleent scripts\cp_mp\vehicles\vehicle::function_d93ec4635290febd();
            var_4ac41c9583912b8f = scripts\cp_mp\vehicles\vehicle_spawn::vehicle_spawn_getleveldataforvehicle(vehicleref).var_51b047bd40d984fe;
            if (isdefined(driver) && isdefined(var_4ac41c9583912b8f) && var_4ac41c9583912b8f != "") {
                driver thread scripts\mp\utility\points::doScoreEvent(function_1823ff50bb28148d(var_4ac41c9583912b8f));
            }
            self.spawningintovehicle = 1;
            scripts\mp\utility\stats::incpersstat("spawnSelectVehicle", 1);
        } else if (self.selectedspawnarea == "tac_insert") {
            if (isdefined(self.setspawnpoint)) {
                self.ti_spawn = 1;
                spawnpoint = self.setspawnpoint;
            }
        } else {
            if (isdefined(level.spawninfluencezones)) {
                trigger = undefined;
                keys = getarraykeys(level.spawninfluencezones);
                foreach (key in keys) {
                    if (key == self.selectedspawnarea) {
                        trigger = level.spawninfluencezones[key];
                    }
                }
                if (isdefined(trigger) && trigger isteamtouching(getotherteam(self.team)[0])) {
                    ref = self.selectedspawnarea + "_safe_" + self.team;
                    spawnset = level.spawnglobals.spawnsets[ref];
                    if (!isdefined(spawnset)) {
                        ref = self.selectedspawnarea + "_" + self.team;
                    }
                } else {
                    ref = self.selectedspawnarea + "_" + self.team;
                }
            } else {
                ref = self.selectedspawnarea + "_" + self.team;
            }
            scripts\mp\spawnlogic::activatespawnset(ref, 1);
            spawnpoint = scripts\mp\spawnlogic::getspawnpoint(self, self.team, undefined, undefined, 2);
            if (issubstr(self.selectedspawnarea, "alliesHQ") || issubstr(self.selectedspawnarea, "axisHQ")) {
                scripts\mp\utility\stats::incpersstat("spawnSelectBase", 1);
            } else {
                scripts\mp\utility\stats::incpersstat("spawnSelectFlag", 1);
            }
        }
    } else {
        spawnpoint = scripts\mp\spawnlogic::getspawnpoint(self, self.team, undefined, undefined, 2);
    }
    if (istrue(level.usesquadspawn) && istrue(self.squadspawnconfirmed)) {
        spectatingteammate = self getspectatingplayer();
        if (isdefined(spectatingteammate) && isdefined(self.sessionsquadid) && self.team == spectatingteammate.team && self.sessionsquadid == spectatingteammate.sessionsquadid) {
            spawnpoint = scripts\mp\spawnscoring::findteammatebuddyspawn(spectatingteammate);
            spectatingteammate thread scripts\mp\utility\points::givexpwithtext(#"squad_spawn");
            thread scripts\mp\utility\points::givexpwithtext(#"hash_5fe4192c1fd1be4c");
            self.wassquadspawned = 1;
        }
    }
    return spawnpoint;
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2575
// Size: 0x89
function refreshplayerspawnareaomnvars() {
    for (var_7df4a8a7599bcca3 = 0; var_7df4a8a7599bcca3 < 16; var_7df4a8a7599bcca3++) {
        self setclientomnvar("ui_tom_spawn_entity_" + var_7df4a8a7599bcca3, undefined);
        self setclientomnvar("ui_tom_spawn_id_" + var_7df4a8a7599bcca3, -1);
    }
    if (isdefined(self.forcedavailablespawnlocation)) {
        picklane(self.forcedavailablespawnlocation);
    }
    thread evaluatefobspawns();
    if (istrue(level.usesquadspawnselection)) {
        thread evaluatesquadspawn();
    }
    if (isdefined(self.setspawnpoint)) {
        thread function_7de3f8f504024fde();
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2606
// Size: 0x3cc
function evaluatefobspawns() {
    self endon("disconnect");
    self endon("end_respawn");
    self notify("evaluateFOBSpawns");
    self endon("evaluateFOBSpawns");
    var_e62653e4f73622a = [];
    while (true) {
        if (var_e62653e4f73622a.size > level.availablespawnlocations[self.team].size) {
            thread refreshplayerspawnareaomnvars();
            return;
        }
        index = 0;
        foreach (entry in level.availablespawnlocations[self.team]) {
            if (!isdefined(var_e62653e4f73622a[index])) {
                break;
            }
            if (var_e62653e4f73622a[index].location != entry) {
                thread refreshplayerspawnareaomnvars();
                return;
            }
            index++;
        }
        index = 0;
        foreach (entry in level.availablespawnlocations[self.team]) {
            selected = level.spawnselectionlocations[entry][self.team];
            if (index == var_e62653e4f73622a.size) {
                data = spawnstruct();
                data.location = undefined;
                data.entity = undefined;
                data.id = undefined;
                var_e62653e4f73622a[var_e62653e4f73622a.size] = data;
            }
            if (!isdefined(var_e62653e4f73622a[index].location)) {
                var_e62653e4f73622a[index].location = entry;
            }
            if (!isdefined(var_e62653e4f73622a[index].entity)) {
                var_e62653e4f73622a[index].entity = selected.anchorentity;
                self setclientomnvar("ui_tom_spawn_entity_" + index, selected.anchorentity);
            }
            indanger = 0;
            isowned = 0;
            var_8d03c3781f6b70c0 = 0;
            var_5e41ee78365ed202 = 0;
            if (isdefined(selected.objectivekey)) {
                indanger = istrue(selected.indanger);
                isowned = level.objectives[selected.objectivekey].ownerteam == self.team;
            } else if (issubstr(entry, "vehicle")) {
                vehent = selected.dynamicent;
                if (isdefined(vehent) && !istrue(vehent.isdestroyed)) {
                    indanger = istrue(vehent.indanger);
                    var_8d03c3781f6b70c0 = hassquadmatepassengers(vehent, self);
                    if (vehicle_occupancy_getavailablevehicleseats(vehent).size == 0 || !istrue(scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_vehiclecanbeused(vehent))) {
                        var_5e41ee78365ed202 = 1;
                    }
                }
            }
            id = selected.labelid;
            if (indanger) {
                id += 128;
            }
            if (isowned) {
                id += 256;
            }
            if (istrue(var_5e41ee78365ed202)) {
                id += 1024;
            }
            if (istrue(var_8d03c3781f6b70c0)) {
                id += 2048;
            }
            if (isdefined(selected.objectivekey) && !function_7f15ad998050dd8c()) {
                id += 32768;
                objectiveindex = level.objectives[selected.objectivekey].objidnum;
                id += objectiveindex << 16;
            }
            if (!isdefined(var_e62653e4f73622a[index].id) || var_e62653e4f73622a[index].id != id) {
                var_e62653e4f73622a[index].id = id;
                self setclientomnvar("ui_tom_spawn_id_" + index, id);
            }
            index++;
        }
        waitframe();
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29da
// Size: 0x23b
function isobjectiveindanger(objectivekey, team) {
    obj = level.objectives[objectivekey];
    switch (obj.id) {
    case #"hash_def5f510c5aa68f4": 
        if (istrue(level.var_b307135dbcef5a38)) {
            return (team != obj.ownerteam);
        } else {
            return false;
        }
    case #"hash_ffc490adcece137f": 
        if (!level.var_a09dce2c531d0bab) {
            return true;
        }
        if (istrue(level.var_f335c53db1d6dd34)) {
            return (team != obj.ownerteam);
        }
        checkpct = level.var_c0e8540c63b7af50 > 0;
        allowpercent = isdefined(obj.var_f271d42faf329b89) && obj.var_f271d42faf329b89 <= level.var_c0e8540c63b7af50;
        if (checkpct) {
            return !allowpercent;
        } else {
            return false;
        }
    case #"hash_2da0874a234cfd12": 
        return false;
    default: 
        var_90ee2572b0fe338a = obj.ownerteam != team;
        iscontested = !level.var_f13131261b4c6ad5 && obj.stalemate;
        isblocked = !level.var_ca4fe20b267c4f54 && obj.captureblocked;
        isbeingcaptured = !level.var_4d2556c1d0f4893e && obj.claimteam != "none" && obj.claimteam != team;
        var_a3a90d8c2aee0964 = !level.var_7119a108c4ba4d2c && istrue(obj.spawnpointdanger);
        var_adfc287fdbf815aa = level.var_c0e8540c63b7af50 > 0 && obj.curprogress / obj.usetime <= level.var_c0e8540c63b7af50;
        if (var_adfc287fdbf815aa) {
            iscontested = 0;
            isblocked = 0;
            isbeingcaptured = 0;
            isbeingcaptured = 0;
        }
        return (var_90ee2572b0fe338a || iscontested || isblocked || isbeingcaptured || var_a3a90d8c2aee0964);
    }
    return false;
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c1e
// Size: 0x15d
function isvehicleindanger(vehent) {
    currenttime = gettime();
    tookdamage = isdefined(vehent) && isdefined(vehent.lasttimedamaged) && vehent.lasttimedamaged + 5000 > currenttime;
    oob = isdefined(vehent) && vehent scripts\mp\outofbounds::istouchingoobtrigger();
    enemyinproximity = 0;
    if (isdefined(vehent.team)) {
        var_35c341a22b58d17d = utility::playersnear(vehent.origin, 384);
        foreach (player in var_35c341a22b58d17d) {
            if (isdefined(player) && player.team != vehent.team && isalive(player) && !isdefined(player.fauxdead)) {
                if (abs(vehent.origin[2] - player.origin[2]) < 100) {
                    enemyinproximity = 1;
                    break;
                }
            }
        }
    }
    return tookdamage || oob || enemyinproximity;
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d84
// Size: 0x32
function function_167619fe3d0cff00() {
    if (!isdefined(level.usespawnselection)) {
        level.usespawnselection = getdvarint(@"hash_6e73595f4ce7501e", 0) != 0;
    }
    return level.usespawnselection;
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dbf
// Size: 0x2d5
function vehicleindangertracking(vehent) {
    vehent endon("death");
    vehent.indanger = 0;
    ignoredamagethreshold = getdvarfloat(@"hash_b5bc6252b2764d8c", 0.15);
    while (true) {
        currenttime = gettime();
        burningdown = istrue(vehent.burningdown);
        missilelocked = scripts\cp_mp\utility\weapon_utility::islockedonto(vehent);
        var_f7772e25266681de = vehicle_occupancy_canspawninto(vehent);
        tookdamage = isdefined(vehent) && isdefined(vehent.lasttimedamaged) && vehent.lasttimedamaged + 5000 > currenttime;
        oob = isdefined(vehent) && vehent scripts\mp\outofbounds::istouchingoobtrigger();
        isbeached = 0;
        enemyinproximity = 0;
        if (isdefined(vehent.team) && vehent.vehiclename != "apc_russian" && vehent.vehiclename != "veh9_apc_8x8") {
            var_35c341a22b58d17d = utility::playersnear(vehent.origin, 384);
            foreach (player in var_35c341a22b58d17d) {
                if (isdefined(player) && player.team != vehent.team && isalive(player) && !isdefined(player.fauxdead)) {
                    if (abs(vehent.origin[2] - player.origin[2]) < 100) {
                        enemyinproximity = 1;
                        break;
                    }
                }
            }
        }
        if (vehent.vehiclename == "apc_russian" || vehent.vehiclename == "veh9_apc_8x8" || vehent.vehiclename == "veh9_palfa") {
            currenthealthpct = vehent.health / vehent.maxhealth;
            if (currenthealthpct > ignoredamagethreshold) {
                tookdamage = 0;
            }
            missilelocked = 0;
        } else if (vehent.vehiclename == "veh9_patrol_boat") {
            isbeached = vehent vehicle_isonground();
        }
        lastoutcome = vehent.indanger;
        vehent.indanger = tookdamage || oob || enemyinproximity || burningdown || missilelocked || !var_f7772e25266681de || isbeached;
        waitframe();
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x309c
// Size: 0xf3
function hassquadmatepassengers(vehicle, player) {
    if (!isdefined(level.squaddata)) {
        return false;
    }
    squadmates = level.squaddata[self.team][self.sessionsquadid].players;
    foreach (occupant in vehicle.occupants) {
        foreach (mate in squadmates) {
            if (mate == occupant) {
                return true;
            }
        }
    }
    return false;
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3198
// Size: 0x22d
function setspawnselectionorder() {
    markers = getstructarray("axisLeft_alliesRight", "targetname");
    if (isdefined(scripts\cp_mp\utility\game_utility::getlocaleid())) {
        var_ef171a7416dc2ab0 = undefined;
        foreach (marker in markers) {
            if (marker.script_noteworthy == level.localeid) {
                var_ef171a7416dc2ab0 = marker;
            }
        }
        assert(isdefined(var_ef171a7416dc2ab0), "Mode is using Locales, but no Directional Marker set for Locale " + level.localeid);
    } else {
        var_ef171a7416dc2ab0 = getstruct("axisLeft_alliesRight", "targetname");
    }
    var_c099305bcdb72ad7 = [];
    foreach (location in level.spawnselectionlocations) {
        foreach (index, team in location) {
            if (index != self.team) {
                continue;
            }
            var_c099305bcdb72ad7[var_c099305bcdb72ad7.size] = team;
        }
    }
    if (self.team == "axis") {
        objectives_ordered = var_ef171a7416dc2ab0 array_sort_with_func(var_c099305bcdb72ad7, &sortlocationsbydistance_closestfirst);
    } else {
        objectives_ordered = var_ef171a7416dc2ab0 array_sort_with_func(var_c099305bcdb72ad7, &sortlocationsbydistance_farthestfirst);
    }
    foreach (index, objective in objectives_ordered) {
        self setclientomnvar("ui_tom_spawn_entity_" + index, objective.anchorentity);
        self setclientomnvar("ui_tom_spawn_id_" + index, objective.labelid);
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33cd
// Size: 0x46
function sortlocationsbydistance_closestfirst(location1, location2) {
    return distancesquared(location1.origin, self.origin) < distancesquared(location2.origin, self.origin);
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x341c
// Size: 0x46
function sortlocationsbydistance_farthestfirst(location1, location2) {
    return distancesquared(location1.origin, self.origin) > distancesquared(location2.origin, self.origin);
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x346b
// Size: 0x1b1
function picklane(lane) {
    areakey = undefined;
    foreach (loc in level.availablespawnlocations[self.team]) {
        if (issubstr(loc, lane)) {
            areakey = loc;
            break;
        }
    }
    if (!isdefined(areakey)) {
        return;
    }
    if (!isdefined(level.spawnselectionlocations[areakey])) {
        return;
    }
    selected = level.spawnselectionlocations[areakey][self.team];
    if (!isdefined(selected)) {
        return;
    }
    var_4e2f30f5b1dfa9f3 = self.team == "allies";
    laneindex = 0;
    switch (lane) {
    case #"hash_2eafa9a536901cad":
    case #"hash_7270631ce8f6357f":
    case #"hash_c9b3133a17a3b2d0": 
        laneindex = ter_op(var_4e2f30f5b1dfa9f3, 0, 2);
        break;
    case #"hash_2881ce6c1efb40c5":
    case #"hash_2eafa6a5369017f4":
    case #"hash_7273231ce8f80f56": 
        laneindex = 1;
        break;
    case #"hash_2eafa7a536901987":
    case #"hash_726a231ce8f15391":
    case #"hash_96815ce4f2a3dbc5": 
        laneindex = ter_op(var_4e2f30f5b1dfa9f3, 2, 0);
        break;
    }
    self setclientomnvar("ui_tom_spawn_entity_" + laneindex, selected.anchorentity);
    self setclientomnvar("ui_tom_spawn_id_" + laneindex, selected.labelid);
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3624
// Size: 0xc9
function refreshsquadspawns() {
    var_d861f893072a477e = 3;
    foreach (loc in level.availablespawnlocations[self.team]) {
        if (issubstr(loc, "squad_")) {
            selected = level.spawnselectionlocations[loc][self.team];
            self setclientomnvar("ui_tom_spawn_entity_" + var_d861f893072a477e, selected.anchorentity);
            self setclientomnvar("ui_tom_spawn_id_" + var_d861f893072a477e, selected.labelid);
            var_d861f893072a477e++;
        }
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36f5
// Size: 0xed
function refreshdynamicspawns() {
    var_d861f893072a477e = 6;
    foreach (loc in level.availablespawnlocations[self.team]) {
        if (issubstr(loc, "dynamic_")) {
            if (!isdefined(level.spawnselectionlocations[loc][self.team])) {
                continue;
            }
            selected = level.spawnselectionlocations[loc][self.team];
            if (!isdefined(selected)) {
                continue;
            }
            self setclientomnvar("ui_tom_spawn_entity_" + var_d861f893072a477e, selected.anchorentity);
            self setclientomnvar("ui_tom_spawn_id_" + var_d861f893072a477e, selected.labelid);
            var_d861f893072a477e++;
        }
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37ea
// Size: 0x103
function waitforspawnselection(timeuntilspawn, forcepick) {
    if (istrue(level.gameended) || istrue(level.nukeinfo.detonated)) {
        pickrandomnonvehiclespawn();
        return;
    }
    self endon("disconnect");
    self.selectedspawnarea = undefined;
    refreshplayerspawnareaomnvars();
    getclosestavailablespawnlocation();
    if (istrue(level.forcetopickafob)) {
        timeuntilspawnmessaging(1, "waiting_to_spawn");
        pickrandomnonvehiclespawn();
        return;
    }
    if (isai(self) || istrue(forcepick) || issubstr(self.name, "_hl_")) {
        timeuntilspawnmessaging(timeuntilspawn, "waiting_to_spawn");
        if (scripts\mp\spawnlogic::shoulduseteamstartspawn()) {
            return;
        }
        pickrandomnonvehiclespawn();
        return;
    }
    while (!gameflag("prematch_done")) {
        waitframe();
    }
    self lerpfovscalefactor(0, 0.2);
    spawnselectionthink(timeuntilspawn);
    self lerpfovscalefactor(1, 0.2);
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38f5
// Size: 0x93
function pickrandomnonvehiclespawn() {
    var_e7479a24d5e8f522 = array_randomize(level.availablespawnlocations[self.team]);
    foreach (area in var_e7479a24d5e8f522) {
        if (issubstr(area, "fob") || issubstr(area, "HQ")) {
            self.selectedspawnarea = area;
            return;
        }
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3990
// Size: 0x99
function pickrandomvehiclespawn(var_b6603908715584da) {
    if (!isdefined(var_b6603908715584da)) {
        var_b6603908715584da = "vehicle";
    }
    var_e7479a24d5e8f522 = array_randomize(level.availablespawnlocations[self.team]);
    foreach (area in var_e7479a24d5e8f522) {
        if (issubstr(area, "vehicle")) {
            self.selectedspawnarea = area;
            return;
        }
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a31
// Size: 0x32
function pickrandomspawn() {
    var_e7479a24d5e8f522 = array_randomize(level.availablespawnlocations[self.team]);
    self.selectedspawnarea = var_e7479a24d5e8f522[0];
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a6c
// Size: 0xa7
function function_37b8d5f51288ba7d() {
    timeoutms = getdvarint(@"hash_b7cddbc61e64ed", 2000);
    if (!istrue(self.var_a7461778c6502729) && gameflag("prematch_done")) {
        timeoutms = getdvarint(@"hash_a06dc2c4de808757", 9000);
        self.var_a7461778c6502729 = 1;
    }
    spawncamera = scripts\mp\spawncamera::getspawncamera();
    streamorigin = scripts\mp\gametypes\br_public::playerstreamhintlocation(spawncamera.origin, timeoutms);
    scripts\cp_mp\utility\game_utility::fadetoblackforplayer(self, 1, 0);
    scripts\mp\gametypes\br_public::playerwaittillstreamhintcomplete();
    scripts\cp_mp\utility\game_utility::fadetoblackforplayer(self, 0, 0.5);
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b1b
// Size: 0x2db
function spawnselectionthink(timeuntilspawn) {
    level endon("game_ended");
    self endon("disconnect");
    thread checkformatchend();
    if (istrue(level.gameended)) {
        return;
    }
    if (isteamreviveenabled()) {
        return;
    }
    if (istrue(level.nukeinfo.detonated)) {
        return;
    }
    if (!self [[ level.var_d280c5fdb0036183 ]]()) {
        return;
    }
    scripts\mp\class::loadout_clearperks();
    thread scripts\mp\spawncamera::startspawncamera(0, 0, 0);
    thread function_37b8d5f51288ba7d();
    self.selectedspawnarea = undefined;
    self.inspawnselection = 1;
    self setclientomnvar("ui_hide_objectives", 1);
    thread selectiondelaymessaging(timeuntilspawn);
    if (istrue(level.spawnselectionshowfriendly) || istrue(level.spawnselectionshowenemy)) {
        thread scripts\mp\flashpoint::flashpoint_spawnselectionvfx();
    }
    if (istrue(level.showteamtanks)) {
        thread vehicle_showteamtanks();
    }
    wait 0.5;
    if (isdefined(level.var_111c5f085a86c2f0)) {
        self [[ level.var_111c5f085a86c2f0 ]]();
    }
    self setclientomnvar("ui_hide_objectives", 0);
    self setclientomnvar("ui_tac_ops_map_open", 1);
    self cameralinkto(self.spawncameraent, "tag_origin", 1);
    printspawnmessage("spawnselection::spawnSelectionThink() CameraLinkTo()");
    thread timeuntilspawnmessaging(timeuntilspawn, "waiting_to_spawn");
    thread selectionmade();
    if (istrue(level.checkspawnselectionafk)) {
        thread watchforafk();
    }
    self.var_f9cd51a4708ec70f = 0;
    while (true) {
        endcondition = watchendconditions();
        var_83cb6d50fa2daf87 = 1;
        switch (endcondition) {
        case #"hash_2400cb6252980d91": 
            var_83cb6d50fa2daf87 = 1;
            break;
        case #"hash_eccbb0b46937db3a": 
            var_83cb6d50fa2daf87 = 0;
            refreshplayerspawnareaomnvars();
            break;
        case #"hash_d79f98d6ba6dd9de": 
            var_83cb6d50fa2daf87 = 1;
            scripts\mp\spawncamera::deletespawncamera();
            break;
        case #"hash_315ca762a236ee4b": 
            var_83cb6d50fa2daf87 = 1;
            scripts\mp\spawncamera::deletespawncamera();
            break;
        case #"hash_e73d5cfa4614c287": 
            var_83cb6d50fa2daf87 = 1;
            scripts\mp\spawncamera::deletespawncamera();
            break;
        case #"hash_8bfb9f6e1ffad7f4": 
            var_83cb6d50fa2daf87 = 0;
            break;
        case #"hash_af2638e19142720b": 
            var_83cb6d50fa2daf87 = 0;
            self setclientomnvar("ui_hide_objectives", 1);
            self setclientomnvar("ui_tac_ops_map_open", 0);
            thread spawnselectionshutdown_nuke();
            break;
        case #"hash_e3e8e9e8b2bb7b82": 
            var_83cb6d50fa2daf87 = 1;
            self.var_f9cd51a4708ec70f = 1;
            break;
        default: 
            assertmsg("Tac Ops Map Internal Error -- Unknown End Condition");
            break;
        }
        if (var_83cb6d50fa2daf87) {
            self notify("stop_spawnselection_afk");
            self setclientomnvar("ui_tac_ops_map_open", 0);
            self.inspawnselection = 0;
            if (isdefined(level.var_aba39caf969cd3f7)) {
                self [[ level.var_aba39caf969cd3f7 ]]();
            }
            return;
        }
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dfe
// Size: 0x2e
function checkformatchend() {
    self endon("stop_spawnselection_afk");
    self endon("disconnect");
    while (!istrue(level.gameended)) {
        waitframe();
    }
    self setclientomnvar("ui_tac_ops_map_open", 0);
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e34
// Size: 0x4e
function watchforafk() {
    self endon("disconnect");
    self endon("stop_spawnselection_afk");
    if (isdefined(level.spawnselectionafktime)) {
        wait level.spawnselectionafktime;
    } else {
        wait 60;
    }
    self notify("afk_disconnection_imminent");
    wait 1;
    kick(self getentitynumber(), "EXE/PLAYERKICKED_INACTIVE", 1);
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e8a
// Size: 0x108
function selectiondelaymessaging(timeuntilspawn) {
    self endon("disconnect");
    self.canprocessselection = 0;
    if (getgametype() == "arm" || getgametype() == "conflict" || getgametype() == "risk" || getgametype() == "gwbomb" || getgametype() == "bigctf") {
        self setclientomnvar("ui_tom_respawnTimerActive", 1);
    }
    if (timeuntilspawn > 0) {
        wait timeuntilspawn;
    }
    if (getgametype() == "arm" || getgametype() == "conflict" || getgametype() == "risk" || getgametype() == "gwbomb" || getgametype() == "bigctf") {
        self setclientomnvar("ui_tom_respawnTimerActive", 0);
    }
    scripts\mp\utility\lower_message::setlowermessageomnvar("select_spawn");
    self.canprocessselection = 1;
    if (isdefined(self.selectedspawnarea)) {
        validateselectedspawnarea();
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f9a
// Size: 0x7a
function validateselectedspawnarea() {
    foreach (loc in level.availablespawnlocations[self.team]) {
        if (loc == self.selectedspawnarea) {
            self notify("tac_ops_map_selection_made");
            return;
        }
    }
    self.selectedspawnarea = undefined;
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x401c
// Size: 0x475
function selectionmade() {
    self endon("disconnect");
    self endon("tac_ops_map_selection_valid");
    while (true) {
        message, var_84d6164f2a6eb8da = self waittill("luinotifyserver");
        if (message == "tac_ops_spawn_area_selected") {
            var_84d6164f2a6eb8da = updateplayerspawninputtype(var_84d6164f2a6eb8da);
            printspawnmessage("spawnSelection::selectionMade() START");
            selectedspawnarea = undefined;
            foreach (loc in level.spawnselectionlocations) {
                if (isdefined(loc[self.team]) && isdefined(loc[self.team].anchorentity) && loc[self.team].anchorentity getentitynumber() == var_84d6164f2a6eb8da) {
                    updatespecificfobindanger(loc[self.team].typeref, self, self.team);
                    if (isdefined(loc[self.team].objectivekey) && isobjectiveindanger(loc[self.team].objectivekey, self.team)) {
                        break;
                    }
                    if (isdefined(loc[self.team].typeref) && issubstr(loc[self.team].typeref, "vehicle") && istrue(loc[self.team].dynamicent.indanger)) {
                        break;
                    }
                    selectedspawnarea = loc[self.team].typeref;
                    break;
                }
            }
            if (!isdefined(selectedspawnarea)) {
                squadlocations = getsquadspawnlocations(self.team, self.sessionsquadid);
                foreach (loc in squadlocations) {
                    if (isdefined(loc.dynamicent) && loc.dynamicent getentitynumber() == var_84d6164f2a6eb8da) {
                        if (loc.dynamicent.team != self.team || loc.dynamicent.sessionsquadid != self.sessionsquadid) {
                            thread refreshplayerspawnareaomnvars();
                            assertmsg("Attemped to spawn on someone who isn't on your squad:" + "\nself.team           = " + self.team + "\nself.sessionsquadid     = " + self.sessionsquadid + "\nloc.dynamicEnt.team = " + loc.dynamicent + "\nloc.dynamicEnt.sessionsquadid = " + loc.dynamicent.sessionsquadid);
                            break;
                        }
                        if (issquadmateindanger(loc.dynamicent)) {
                            break;
                        }
                        vehicle = loc.dynamicent.vehicle;
                        if (isdefined(vehicle)) {
                            if (vehicle_occupancy_getavailablevehicleseats(vehicle).size == 0 || !istrue(scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_vehiclecanbeused(vehicle))) {
                                break;
                            }
                        }
                        spawninfo = spawnstruct();
                        spawninfo = scripts\mp\spawnscoring::capsulepass(spawninfo, loc.dynamicent);
                        if (!isdefined(spawninfo.spawnposition)) {
                            loc.dynamicent.nogroundfoundtime = gettime();
                            break;
                        }
                        selectedspawnarea = loc.typeref;
                        break;
                    }
                }
            }
            if (!isdefined(selectedspawnarea)) {
                if (isdefined(self.setspawnpoint) && self.setspawnpoint getentitynumber() == var_84d6164f2a6eb8da) {
                    selectedspawnarea = "tac_insert";
                } else {
                    continue;
                }
            }
            var_f199bbb576943488 = issubstr(selectedspawnarea, "squad");
            var_a95007e8e6d9d166 = getdvarint(@"hash_517d1754377878d8", 0) == 1;
            if (istrue(self.canprocessselection) || var_f199bbb576943488 && var_a95007e8e6d9d166) {
                printspawnmessage("spawnSelection::selectionMade() = " + selectedspawnarea);
                self.selectedspawnarea = selectedspawnarea;
                self notify("tac_ops_map_selection_made");
                return;
            }
        }
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4499
// Size: 0x110
function updateplayerspawninputtype(var_84d6164f2a6eb8da) {
    if (!isdefined(self.gwinputtypesused)) {
        self.gwinputtypesused = [];
    }
    var_c1606c1030582cfa = 65536;
    var_9078b4c4e3258dfb = 131072;
    var_caaf532a5fd0a997 = 262144;
    var_e4f4a7af0d80ea24 = 524288;
    self.gwinputtypesused["rightmouseup"] = istrue(self.gwinputtypesused["rightmouseup"]) || (var_84d6164f2a6eb8da & var_c1606c1030582cfa) > 0;
    self.gwinputtypesused["leftmouseup"] = istrue(self.gwinputtypesused["leftmouseup"]) || (var_84d6164f2a6eb8da & var_9078b4c4e3258dfb) > 0;
    self.gwinputtypesused["activate"] = istrue(self.gwinputtypesused["activate"]) || (var_84d6164f2a6eb8da & var_caaf532a5fd0a997) > 0;
    self.gwinputtypesused["gostand"] = istrue(self.gwinputtypesused["gostand"]) || (var_84d6164f2a6eb8da & var_e4f4a7af0d80ea24) > 0;
    return var_84d6164f2a6eb8da & ~(var_c1606c1030582cfa | var_9078b4c4e3258dfb | var_caaf532a5fd0a997 | var_e4f4a7af0d80ea24);
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45b2
// Size: 0x76
function watchendconditions() {
    self endon("disconnect");
    thread endconditionwatcher_gameended();
    thread endconditionwatcher_selectionmade();
    thread endconditionwatcher_mapcleared();
    thread endconditionwatcher_mapchanged();
    thread endconditionwatcher_nuke();
    thread function_b0e57461a4af2476();
    result = function_efe4706df8361219("tac_ops_map_selection_valid", "tac_ops_map_changed", "tac_ops_map_cleared", "spawned_player", "tac_ops_map_game_ended", "tac_ops_map_nuke", "tac_ops_map_no_valid_selections");
    self notify("tac_ops_end_condition_met");
    return result;
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4631
// Size: 0x3a
function endconditionwatcher_selectionmade() {
    self endon("disconnect");
    self endon("tac_ops_end_condition_met");
    self notify("endConditionWatcher_SelectionMade()");
    self endon("endConditionWatcher_SelectionMade()");
    while (true) {
        self waittill("tac_ops_map_selection_made");
        self notify("tac_ops_map_selection_valid");
        break;
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4673
// Size: 0x33f
function endcondition_focuschanged(var_84d6164f2a6eb8da) {
    if (isdefined(self.selectedspawnarea)) {
        return;
    }
    self endon("disconnect");
    self notify("endConditionWatcher_FocusChanged()");
    self endon("endConditionWatcher_FocusChanged()");
    self notify("tac_ops_spawn_focus_changed");
    printspawnmessage("endCondition_FocusChanged() START");
    selectedspawnarea = undefined;
    foreach (loc in level.spawnselectionlocations) {
        if (isdefined(loc[self.team]) && isdefined(loc[self.team].anchorentity) && loc[self.team].anchorentity getentitynumber() == var_84d6164f2a6eb8da) {
            thread keepstreamposfresh(loc[self.team].anchorentity.origin);
            selectedspawnarea = loc[self.team].typeref;
            break;
        }
    }
    if (!isdefined(selectedspawnarea)) {
        squadlocations = getsquadspawnlocations(self.team, self.sessionsquadid);
        foreach (loc in squadlocations) {
            if (isdefined(loc.dynamicent) && loc.dynamicent getentitynumber() == var_84d6164f2a6eb8da) {
                thread keepstreamposfresh(loc.dynamicent.origin);
                selectedspawnarea = loc.typeref;
                break;
            }
        }
    }
    if (!isdefined(selectedspawnarea)) {
        return;
    }
    printspawnmessage("endCondition_FocusChanged() = " + selectedspawnarea);
    self setclientomnvar("ui_tom_veh_health_percent", 0);
    if (issubstr(selectedspawnarea, "squad")) {
        if (!istrue(level.var_72c2648ce78bea79)) {
            thread managesquadcameraposition(selectedspawnarea);
        }
        id = tablelookuprownum("mp/spawnSelectionMapData.csv", 0, selectedspawnarea);
        self setclientomnvar("ui_tom_previous_selection", id);
        return;
    }
    if (issubstr(selectedspawnarea, "vehicle")) {
        if (!istrue(level.var_8f6541607d5dda6b)) {
            thread managevehiclecameraposition(selectedspawnarea);
        }
        thread managevehiclehealthui(selectedspawnarea);
        id = tablelookuprownum("mp/spawnSelectionMapData.csv", 0, selectedspawnarea);
        self setclientomnvar("ui_tom_previous_selection", id);
        return;
    }
    id = -1;
    if (isdefined(level.localeid)) {
        id = tablelookuprownum("mp/spawnSelectionMapData.csv", 0, selectedspawnarea + "_" + level.localeid);
    }
    if (id == -1) {
        id = tablelookuprownum("mp/spawnSelectionMapData.csv", 0, selectedspawnarea);
    }
    self setclientomnvar("ui_tom_previous_selection", id);
    if (isdefined(level.spawncameras[selectedspawnarea]) && isdefined(level.spawncameras[selectedspawnarea][self.team])) {
        self.forcedspawncameraref = selectedspawnarea;
        while (!gameflag("prematch_done")) {
            waitframe();
        }
        thread scripts\mp\spawncamera::movetospawncamera(0);
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49ba
// Size: 0x47
function keepstreamposfresh(origin) {
    self endon("disconnect");
    self endon("tac_ops_map_selection_valid");
    self endon("spawned_player");
    self notify("keepStreamPosFresh");
    self endon("keepStreamPosFresh");
    while (true) {
        self function_bc667001f9dd3808(origin, 1);
        wait 1;
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a09
// Size: 0x2f
function endconditionwatcher_gameended() {
    self endon("disconnect");
    self endon("tac_ops_end_condition_met");
    self notify("endConditionWatcher_GameEnded()");
    self endon("endConditionWatcher_GameEnded()");
    level waittill("game_ended");
    self notify("tac_ops_map_game_ended");
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a40
// Size: 0x2f
function endconditionwatcher_mapcleared() {
    self endon("disconnect");
    self endon("tac_ops_end_condition_met");
    self notify("endConditionWatcher_MapCleared()");
    self endon("endConditionWatcher_MapCleared()");
    level waittill("tac_ops_map_cleared");
    self notify("tac_ops_map_cleared");
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a77
// Size: 0x2f
function endconditionwatcher_mapchanged() {
    self endon("disconnect");
    self endon("tac_ops_end_condition_met");
    self notify("endConditionWatcher_MapChanged()");
    self endon("endConditionWatcher_MapChanged()");
    level waittill("tac_ops_map_changed");
    self notify("tac_ops_map_changed");
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4aae
// Size: 0x2f
function endconditionwatcher_nuke() {
    self endon("disconnect");
    self endon("tac_ops_end_condition_met");
    self notify("endConditionWatcher_Nuke()");
    self endon("endConditionWatcher_Nuke()");
    level waittill("nuke_detonated");
    self notify("tac_ops_map_nuke");
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ae5
// Size: 0x2b
function function_b0e57461a4af2476() {
    self endon("disconnect");
    self endon("tac_ops_map_selection_valid");
    while (self [[ level.var_d280c5fdb0036183 ]]()) {
        waitframe();
    }
    self notify("tac_ops_map_no_valid_selections");
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b18
// Size: 0x46
function spawnselectionshutdown_nuke() {
    if (!istrue(self.inspawnselection)) {
        return;
    }
    self visionsetnakedforplayer("nuke_global_aftermath", 0.05);
    wait 2;
    if (!istrue(self.inspawnselection)) {
        return;
    }
    self visionsetnakedforplayer("flir_0_black_to_white_heavy_damage", 0.05);
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b66
// Size: 0x11b
function adddynamicspawnarea(team, ent, ref, offset) {
    if (isdefined(level.spawnselectionlocations[ref]) && isdefined(level.spawnselectionlocations[ref][team])) {
        areastruct = level.spawnselectionlocations[ref][team];
        areastruct.origin = ent.origin + ter_op(isdefined(offset), offset, (0, 0, 0));
        areastruct.angles = ent.angles;
        return;
    }
    areastruct = spawnstruct();
    areastruct.origin = ent.origin + ter_op(isdefined(offset), offset, (0, 0, 0));
    areastruct.angles = ent.angles;
    areastruct.dynamicent = ent;
    areastruct.script_noteworthy = ref;
    initspawnarea(team, areastruct, ref);
    updatespawnareas();
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c89
// Size: 0x64
function removedynamicspawnarea(team, ref) {
    if (isdefined(level.spawnselectionlocations[ref]) && isdefined(level.spawnselectionlocations[ref][team])) {
        level.spawnselectionlocations[ref][team] = undefined;
        if (level.spawnselectionlocations[ref].size == 0) {
            level.spawnselectionlocations[ref] = undefined;
        }
    }
    updatespawnareas();
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cf5
// Size: 0x5e
function getsquadspawnlocations(team, squadindex) {
    locations = [];
    if (isdefined(level.squadspawnselectionlocations) && isdefined(level.squadspawnselectionlocations[team]) && isdefined(level.squadspawnselectionlocations[team][squadindex])) {
        locations = level.squadspawnselectionlocations[team][squadindex];
    }
    return locations;
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d5c
// Size: 0x169
function updatesquadspawn(team, squad, ref, ent) {
    if (!isdefined(level.squadspawnselectionlocations)) {
        level.squadspawnselectionlocations = [];
    }
    if (!isdefined(level.squadspawnselectionlocations[team])) {
        level.squadspawnselectionlocations[team] = [];
    }
    if (!isdefined(level.squadspawnselectionlocations[team][squad])) {
        level.squadspawnselectionlocations[team][squad] = [];
    }
    if (isdefined(level.squadspawnselectionlocations[team][squad][ref])) {
        if (!isdefined(ent)) {
            level.squadspawnselectionlocations[team][squad][ref] = undefined;
            return;
        }
        areastruct = level.squadspawnselectionlocations[team][squad][ref];
        areastruct.typeref = ref;
        areastruct.origin = ent.origin;
        areastruct.angles = ent.angles;
        areastruct.dynamicent = ent;
        return;
    }
    if (!isdefined(ent)) {
        return;
    }
    areastruct = spawnstruct();
    areastruct.typeref = ref;
    areastruct.origin = ent.origin;
    areastruct.angles = ent.angles;
    areastruct.dynamicent = ent;
    level.squadspawnselectionlocations[team][squad][ref] = areastruct;
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ecd
// Size: 0x36
function removespawnareaondeathdisconnect(team, ref) {
    self endon("tac_ops_end_condition_met");
    adddynamicspawnarea(team, self, ref);
    self waittill("death_or_disconnect");
    thread addspawnareaonspawn(team, ref);
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f0b
// Size: 0x3c
function addspawnareaonspawn(team, ref) {
    self endon("tac_ops_end_condition_met");
    removedynamicspawnarea(team, ref);
    self endon("disconnect");
    self waittill("spawned_player");
    thread removespawnareaondeathdisconnect(team, ref);
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f4f
// Size: 0x9b
function function_360feec64890e6f1() {
    self endon("disconnect");
    self endon("end_respawn");
    self endon("tacInsert_destroyed");
    self.var_eaea86358d19ed20 = 1;
    var_f148fcd88267d96e = int(level.tispawndelay);
    self setclientomnvar("ui_tom_ti_respawnTimer", gettime() + var_f148fcd88267d96e * 1000);
    while (true) {
        var_f148fcd88267d96e = clamp(var_f148fcd88267d96e, 0, level.tispawndelay);
        if (var_f148fcd88267d96e == 0) {
            self setclientomnvar("ui_tom_ti_respawnTimer", 0);
            self.var_eaea86358d19ed20 = 0;
            return;
        } else {
            var_f148fcd88267d96e -= level.framedurationseconds;
        }
        waitframe();
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ff2
// Size: 0x120
function function_7de3f8f504024fde() {
    if (!isdefined(self.setspawnpoint)) {
        return;
    }
    self endon("disconnect");
    self endon("end_respawn");
    self notify("evaluateTISpawn");
    self endon("evaluateTISpawn");
    startindex = level.availablespawnlocations[self.team].size;
    tiindex = startindex + 4;
    tidata = spawnstruct();
    tidata.entity = self.setspawnpoint;
    tidata.id = tablelookuprownum("mp/spawnSelectionMapData.csv", 0, "tac_insert");
    if (!istrue(self.var_eaea86358d19ed20)) {
        thread function_360feec64890e6f1();
    }
    while (true) {
        if (!isdefined(self.setspawnpoint)) {
            self setclientomnvar("ui_tom_spawn_id_" + tiindex, -1);
            self setclientomnvar("ui_tom_spawn_entity_" + tiindex, undefined);
            refreshplayerspawnareaomnvars();
            return;
        }
        self setclientomnvar("ui_tom_spawn_id_" + tiindex, tidata.id);
        self setclientomnvar("ui_tom_spawn_entity_" + tiindex, tidata.entity);
        waitframe();
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x511a
// Size: 0x57d
function evaluatesquadspawn() {
    if (!isdefined(level.squaddata)) {
        return;
    }
    self endon("disconnect");
    self endon("end_respawn");
    self notify("evaluateSquadSpawn");
    self endon("evaluateSquadSpawn");
    startindex = level.availablespawnlocations[self.team].size;
    typeid = [];
    typeid[0] = tablelookuprownum("mp/spawnSelectionMapData.csv", 0, "squad_0");
    typeid[1] = tablelookuprownum("mp/spawnSelectionMapData.csv", 0, "squad_1");
    typeid[2] = tablelookuprownum("mp/spawnSelectionMapData.csv", 0, "squad_2");
    typeid[3] = tablelookuprownum("mp/spawnSelectionMapData.csv", 0, "squad_3");
    squadleaderid = tablelookuprownum("mp/spawnSelectionMapData.csv", 0, "squad_leader");
    var_5966e8a05a4d1903 = [];
    for (i = 0; i < 4; i++) {
        data = spawnstruct();
        data.guid = undefined;
        data.entity = undefined;
        data.idmask = undefined;
        var_5966e8a05a4d1903[i] = data;
    }
    squadrefs = [];
    for (i = 0; i < 4; i++) {
        squadrefs[i] = "squad_" + i;
    }
    while (true) {
        squadleader = namespace_ca7b90256548aa40::getsquadleader(self.team, self.sessionsquadid);
        players = level.squaddata[self.team][self.sessionsquadid].players;
        for (i = 0; i < 4; i++) {
            if (!isdefined(var_5966e8a05a4d1903[i].guid)) {
                continue;
            }
            if (!isdefined(players[i]) || players[i].guid != var_5966e8a05a4d1903[i].guid) {
                thread refreshplayerspawnareaomnvars();
                return;
            }
        }
        for (i = 0; i < 4; i++) {
            if (i < players.size) {
                player = players[i];
            } else {
                player = undefined;
            }
            ref = squadrefs[i];
            updatesquadspawn(self.team, self.sessionsquadid, ref, player);
        }
        locations = getsquadspawnlocations(self.team, self.sessionsquadid);
        for (i = 0; i < 4; i++) {
            if (i < players.size) {
                player = players[i];
            } else {
                player = undefined;
            }
            issquadleader = isdefined(player) && isdefined(squadleader) && player == squadleader;
            if (!issquadleader && istrue(level.spawnsquadleaderonly)) {
                continue;
            }
            ref = squadrefs[i];
            selected = locations[ref];
            var_d059a36c2835b580 = isdefined(player) && isdefined(player.vehicle) && istrue(player.vehicle.israllypointvehicle);
            if (isdefined(player) && self != player && issquadspawnable(player) && !istrue(var_d059a36c2835b580)) {
                indanger = istrue(player.indanger);
                idmask = typeid[i];
                if (indanger) {
                    idmask += 128;
                }
                if (issquadleader) {
                    idmask += 256;
                }
                if (isdefined(player.vehicle)) {
                    idmask += 512;
                    if (vehicle_occupancy_getavailablevehicleseats(player.vehicle).size == 0 || !istrue(scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_vehiclecanbeused(player.vehicle))) {
                        idmask += 1024;
                    }
                    if (player.vehicle.vehiclename == "little_bird" || player.vehicle.vehiclename == "little_bird_mg") {
                        idmask += 4096;
                    }
                }
                idmask += player.var_3f78c6a0862f9e25 << 13;
                if (!isdefined(var_5966e8a05a4d1903[i].guid)) {
                    var_5966e8a05a4d1903[i].guid = player.guid;
                }
                if (!isdefined(var_5966e8a05a4d1903[i].entity) && isdefined(selected) && isdefined(selected.dynamicent)) {
                    var_5966e8a05a4d1903[i].entity = selected.dynamicent;
                    self setclientomnvar("ui_tom_spawn_entity_" + startindex + i, selected.dynamicent);
                }
                if (!isdefined(var_5966e8a05a4d1903[i].idmask) || var_5966e8a05a4d1903[i].idmask != idmask) {
                    var_5966e8a05a4d1903[i].idmask = idmask;
                    self setclientomnvar("ui_tom_spawn_id_" + startindex + i, idmask);
                }
                continue;
            }
            if (isdefined(var_5966e8a05a4d1903[i].entity)) {
                var_5966e8a05a4d1903[i].entity = undefined;
                self setclientomnvar("ui_tom_spawn_entity_" + startindex + i, undefined);
            }
            if (isdefined(var_5966e8a05a4d1903[i].idmask) && var_5966e8a05a4d1903[i].idmask != -1) {
                var_5966e8a05a4d1903[i].idmask = -1;
                self setclientomnvar("ui_tom_spawn_id_" + startindex + i, -1);
            }
        }
        waitframe();
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x569f
// Size: 0x50d
function handlerespawnselection(spawnedasspectator, timeuntilspawn) {
    level endon("game_ended");
    self endon("disconnect");
    respawntype = undefined;
    if (!isdefined(respawntype)) {
        if (istrue(level.usec130spawnfirstonly) && istrue(level.usec130spawn) && !istrue(self.spawnedusingc130) && isdefined(level.spawnc130[self.team])) {
            respawntype = 1;
        } else if (istrue(level.usesquadspawn)) {
            respawntype = 0;
        } else if (istrue(level.usespawnselection)) {
            respawntype = 2;
        } else if (istrue(level.usec130spawn)) {
            respawntype = 1;
        } else {
            respawntype = 3;
        }
    }
    initialtime = gettime();
    selectionmade = 0;
    while (!selectionmade) {
        currenttime = gettime();
        spawndelay = (initialtime + timeuntilspawn * 1000 - currenttime) / 1000;
        switch (respawntype) {
        case 0: 
            self.squadspawnconfirmed = 0;
            self.squadspawnaborted = 0;
            if (!isai(self)) {
                thread handlesquadspawnabort();
            }
            if (!spawnedasspectator) {
                thread scripts\mp\playerlogic::respawn_asspectator(self.origin + (0, 0, 60), self.angles);
            }
            spawnedasspectator = 1;
            startindex = ter_op(isdefined(self.spawnselectedsquadmate), self.spawnselectedsquadmate, 0);
            if (thread cyclevalidsquadspectate(startindex, 1)) {
                if (!isai(self)) {
                    result = handlesquadspawnconfirm(spawndelay);
                    if (!istrue(result)) {
                        self.squadspawnaborted = 1;
                    } else {
                        self.squadspawnconfirmed = 1;
                    }
                } else {
                    timeuntilspawnmessaging(timeuntilspawn, "spawn_revive_wait");
                    if (cointoss()) {
                        self.squadspawnconfirmed = 1;
                    } else {
                        self.squadspawnaborted = 1;
                    }
                }
            } else {
                self.squadspawnaborted = 1;
            }
            if (self.squadspawnaborted) {
                self.forcespectatorclient = -1;
                if (istrue(level.usec130spawn)) {
                    respawntype = 1;
                } else if (istrue(level.usespawnselection)) {
                    respawntype = 2;
                } else {
                    respawntype = 3;
                }
            } else {
                selectionmade = 1;
            }
            break;
        case 1: 
            thread scripts\mp\spawncamera::startspawncamera();
            cameradelay = thread scripts\mp\spawncamera::getspawncamerawaittime();
            if (!isdefined(cameradelay)) {
                cameradelay = 0;
            }
            if (istrue(level.usec130spawnfirstonly)) {
                self.spawnedusingc130 = 1;
            }
            spawntoc130();
            selectionmade = 1;
            break;
        case 2: 
            caninfil = gameflag("infil_will_run") && !istrue(gameflag("infil_started"));
            if ((getgametype() == "arm" || getgametype() == "conflict" || getgametype() == "risk" || getgametype() == "bigctf") && !caninfil && !gameflag("prematch_done")) {
                camerapositions = [[ level.var_e637d49948a038d3 ]](self.team);
                cament = spawn("script_model", camerapositions.startorigin);
                cament setmodel("tag_origin");
                cament.angles = camerapositions.startangles;
                self cameralinkto(cament, "tag_origin");
                cament moveto(camerapositions.endorigin, 18);
                cament rotateto(camerapositions.endangles, 18);
                gameflagwait("prematch_done");
                self cameraunlink();
                self.spawncameratime = 0.5;
                thread scripts\mp\spawncamera::startspawncamera(0, 0.5, 0.5);
            } else {
                self.spawncameratime = 0.5;
                thread scripts\mp\spawncamera::startspawncamera(0, 0.5, 0.5);
            }
            cameradelay = thread scripts\mp\spawncamera::getspawncamerawaittime();
            if (!isdefined(cameradelay)) {
                cameradelay = 0;
            }
            waitforspawnselection(spawndelay + cameradelay);
            if (isdefined(self.selectedspawnarea)) {
                selectionmade = 1;
            }
            break;
        case 3: 
            thread scripts\mp\spawncamera::startspawncamera();
            cameradelay = thread scripts\mp\spawncamera::getspawncamerawaittime();
            if (!isdefined(cameradelay)) {
                cameradelay = 0;
            }
            timeuntilspawnmessaging(spawndelay + cameradelay, "waiting_to_spawn");
            selectionmade = 1;
            break;
        }
    }
    if (needsbuttontorespawn()) {
        if (!istrue(self.waitingtoselectclass)) {
            scripts\mp\utility\lower_message::setlowermessageomnvar("press_to_spawn");
        }
        if (!spawnedasspectator) {
            thread scripts\mp\playerlogic::respawn_asspectator(self.origin + (0, 0, 60), self.angles);
        }
        spawnedasspectator = 1;
        waitrespawnbutton();
    }
    thread scripts\mp\spawncamera::endspawncamera();
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5bb4
// Size: 0x4f
function handlesquadspawnabort() {
    self endon("disconnect");
    self notify("handleSquadSpawnAbort");
    self endon("handleSquadSpawnAbort");
    self notifyonplayercommand("switchSpawnMethod", "+stance");
    self waittill("switchSpawnMethod");
    self.forcespectatorclient = -1;
    self.squadspawnaborted = 1;
    self notify("squad_spawn_abort");
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c0b
// Size: 0xb0
function handlesquadspawncycle() {
    self endon("disconnect");
    self endon("end_respawn");
    self endon("squad_spawn_abort");
    self notify("handleSquadSpawnCycle");
    self endon("handleSquadSpawnCycle");
    self notifyonplayercommand("cyclePos", "+gostand");
    while (true) {
        result = waittill_any_return_2("cyclePos", "cycleNeg");
        if (isdefined(result)) {
            current = self getspectatingplayer();
            if (result == "cyclePos") {
                thread cyclevalidsquadspectate(current.var_3f78c6a0862f9e25, 1);
                continue;
            }
            if (result == "cycleNeg") {
                thread cyclevalidsquadspectate(current.var_3f78c6a0862f9e25, 0);
            }
        }
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5cc3
// Size: 0x54
function handlesquadspawnconfirm(timeuntilspawn) {
    self endon("disconnect");
    self endon("end_respawn");
    self endon("squad_spawn_abort");
    timeuntilspawnmessaging(timeuntilspawn, "waiting_to_spawn");
    scripts\mp\utility\lower_message::setlowermessageomnvar("squad_spawn");
    self notifyonplayercommand("respawn_confirm", "+usereload");
    self waittill("respawn_confirm");
    return true;
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d20
// Size: 0xec
function cyclevalidsquadspectate(startindex, positive) {
    self endon("disconnect");
    self endon("end_respawn");
    self endon("squad_spawn_abort");
    self notify("cycleValidSquadSpectate");
    self endon("cycleValidSquadSpectate");
    players = level.squaddata[self.team][self.sessionsquadid].players;
    checkindex = startindex;
    step = ter_op(positive, 1, -1);
    for (i = 0; i < players.size; i++) {
        if (iscurrentspectatetarget(players[checkindex]) || !issquadspawnable(players[checkindex])) {
            checkindex += step;
            if (checkindex == players.size) {
                checkindex = 0;
            }
            if (checkindex == -1) {
                checkindex = players.size - 1;
            }
            continue;
        }
        thread monitorsquadspectator(players[checkindex]);
        return true;
    }
    return false;
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e15
// Size: 0x35
function iscurrentspectatetarget(player) {
    if (!isdefined(self.forcespectatorclient)) {
        return false;
    }
    spectatingteammate = self getspectatingplayer();
    if (!isdefined(spectatingteammate)) {
        return false;
    }
    return player == spectatingteammate;
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e53
// Size: 0x48
function issquadspawnable(player) {
    if (!isdefined(player)) {
        return false;
    }
    if (!isreallyalive(player)) {
        return false;
    }
    if (istrue(player.inspawncamera)) {
        return false;
    }
    if (player isskydiving()) {
        return false;
    }
    if (player isusingremote()) {
        return false;
    }
    return true;
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ea4
// Size: 0x27
function isplayerindanger_think() {
    thread internal_isplayerindanger_think();
    if (getdvarint(@"hash_99a922188ec4750f", 0) == 1) {
        thread scripts\mp\spawnscoring::squadspawndebug();
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ed3
// Size: 0x33
function internal_isplayerindanger_think() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (true) {
        if (issquadspawnable(self)) {
            self.indanger = issquadmateindanger(self);
        }
        waitframe();
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f0e
// Size: 0x21f
function issquadmateindanger(player) {
    currenttime = gettime();
    if (isdefined(player) && isdefined(player.pers["lastDamageTime"]) && player.pers["lastDamageTime"] + 5000 > currenttime || isdefined(player.lasttimedamaged) && player.lasttimedamaged + 5000 > currenttime) {
        return true;
    }
    if (player isonladder()) {
        return true;
    }
    player scripts\mp\battlechatter_mp::validaterecentattackers();
    if (isdefined(player.recentattackers) && player.recentattackers.size > 0) {
        return true;
    }
    if (isdefined(player.lastweaponfiretimestart) && player.lastweaponfiretimestart + 3000 > currenttime) {
        return true;
    }
    if (isdefined(player.lastweaponfiretimestart) && isdefined(player.lastweaponfiretimeend) && player.lastweaponfiretimestart > player.lastweaponfiretimeend || isdefined(player.lastweaponfiretimestart) && !isdefined(player.lastweaponfiretimeend)) {
        return true;
    }
    var_f2e473b17ca70265 = player getclosestenemy(384, 100, 1);
    if (isdefined(var_f2e473b17ca70265)) {
        return true;
    }
    if (isdefined(player.vehicle)) {
        if (istrue(player.vehicle.burningdown)) {
            return true;
        }
        if (istrue(scripts\cp_mp\utility\weapon_utility::islockedonto(player.vehicle))) {
            return true;
        }
    }
    if (isdefined(player) && player scripts\mp\outofbounds::istouchingoobtrigger()) {
        return true;
    }
    if (getdvarint(@"hash_3728c11e46ec4b26", 0) == 1) {
        bucket = player getspawnbucketforplayer(1, player.origin);
        bucket = scripts\mp\spawnlogic::getspawnbucketfromstring(bucket);
        if (bucket >= 2) {
            return true;
        }
    }
    if (isdefined(player) && isdefined(player.nogroundfoundtime) && player.nogroundfoundtime + 1000 > currenttime) {
        return true;
    }
    return false;
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6136
// Size: 0x102
function monitorsquadspectator(target) {
    self endon("disconnect");
    self endon("end_respawn");
    self endon("squad_spawn_abort");
    self notify("monitorSquadSpectator");
    self endon("monitorSquadSpectator");
    index = target.var_3f78c6a0862f9e25;
    self.forcespectatorclient = target getentitynumber();
    self forcethirdpersonwhenspectating();
    thread handlesquadspawncycle();
    while (issquadspawnable(target)) {
        if (issquadmateindanger(target)) {
            self setclientomnvar("ui_squad_spawn_combat", 1);
        } else {
            self setclientomnvar("ui_squad_spawn_combat", 0);
        }
        self.squadspectatepos = target.origin + anglestoforward(target.angles) * -80 + (0, 0, 64);
        self.squadspectateang = target.angles;
        waitframe();
    }
    if (!thread cyclevalidsquadspectate(index, 1)) {
        self.squadspawnaborted = 0;
        self notify("squad_spawn_abort");
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6240
// Size: 0x100
function spawntoc130() {
    self endon("disconnect");
    while (istrue(level.usec130spawn) && !isdefined(level.spawnc130)) {
        waitframe();
    }
    if (!istrue(level.usec130spawn) || !isdefined(level.spawnc130[self.team])) {
        wait 1.5;
        return;
    }
    if (!istrue(level.usec130spawnfirstonly) && isdefined(level.timeuntilnextc130) && level.timeuntilnextc130[self.team] - gettime() <= (level.flighttime + level.timebetweenc130passes) * 1000) {
        scripts\mp\utility\lower_message::setlowermessageomnvar("waiting_for_c130", int(level.timeuntilnextc130[self.team]));
    } else {
        scripts\mp\utility\lower_message::setlowermessageomnvar("clear_lower_msg");
    }
    thread scripts\mp\gametypes\arm_vehicles::spawnplayertoc130();
    if (isdefined(level.spawnc130[self.team])) {
        self waittill("c130_ready");
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6348
// Size: 0x68
function needsbuttontorespawn() {
    if (scripts\mp\tweakables::gettweakablevalue("player", "forcerespawn") != 0) {
        return false;
    }
    if (!self.hasspawned) {
        return false;
    }
    wavebased = getdvarint(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_waverespawndelay")) > 0;
    if (wavebased) {
        return false;
    }
    if (self.wantsafespawn) {
        return false;
    }
    return true;
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63b9
// Size: 0x2a
function waitrespawnbutton() {
    self endon("disconnect");
    self endon("end_respawn");
    while (true) {
        if (self usebuttonpressed()) {
            break;
        }
        wait 0.05;
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63eb
// Size: 0x51
function timeuntilspawnmessaging(timeuntilspawn, reason) {
    self endon("disconnect");
    if (timeuntilspawn > 0) {
        if (!isdefined(reason)) {
            reason = "waiting_to_spawn";
        }
        scripts\mp\utility\lower_message::setlowermessageomnvar(reason, int(gettime() + timeuntilspawn * 1000));
        waittill_any_timeout_no_endon_death_1(timeuntilspawn, "force_spawn");
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6444
// Size: 0x2a8
function managesquadcameraposition(ref) {
    self endon("disconnect");
    self endon("end_respawn");
    self endon("tac_ops_spawn_focus_changed");
    self notify("manageSquadCameraPosition");
    self endon("manageSquadCameraPosition");
    index = undefined;
    if (ref == "squad_leader") {
        index = level.squaddata[self.team][self.sessionsquadid].squadleader.var_3f78c6a0862f9e25;
    } else {
        index = int(getsubstr(ref, ref.size - 1, ref.size));
    }
    goalplayer = undefined;
    if (isdefined(level.squaddata[self.team]) && isdefined(level.squaddata[self.team][self.sessionsquadid]) && isdefined(level.squaddata[self.team][self.sessionsquadid].players[index])) {
        goalplayer = level.squaddata[self.team][self.sessionsquadid].players[index];
    }
    forward = level.spawnselectionteamforward[self.team];
    while (isdefined(self.spawncameraent) && isdefined(goalplayer)) {
        goalposition = [];
        goalangles = [];
        if (istrue(level.usestaticspawnselectioncamera)) {
            temp = scripts\mp\spawnselection::getstaticcameraposition(self.team);
            goalposition = temp.origin;
            goalangles = temp.angles;
        } else {
            heightoffset = 7000;
            if (istrue(level.useunifiedspawnselectioncameraheight)) {
                heightoffset = function_87bbbee0bbf27304();
            }
            goalposition = goalplayer.origin + forward * -8500 + (0, 0, heightoffset);
            goalvector = vectornormalize(goalplayer.origin - goalposition);
            goalangles = vectortoanglessafe(goalvector, (0, 0, 1));
            goalposition += [[ level.var_3c89983e2030dfff ]](self.team, goalplayer.origin);
        }
        self.spawncameratargetpos = goalposition;
        self.spawncameratargetang = goalangles;
        self.spawncameraent moveto(goalposition, 0.25, 0.05, 0.2);
        self.spawncameraent rotateto(goalangles, 0.25, 0.05, 0.2);
        waitframe();
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66f4
// Size: 0x2e4
function managevehiclecameraposition(ref) {
    self endon("disconnect");
    self endon("end_respawn");
    self endon("tac_ops_spawn_focus_changed");
    self notify("manageVehicleCameraPosition");
    self endon("manageVehicleCameraPosition");
    index = int(getsubstr(ref, ref.size - 1, ref.size));
    vehicleent = level.spawnselectionlocations[ref][self.team].dynamicent;
    forward = level.spawnselectionteamforward[self.team];
    var_ff816c44d164cac1 = 0;
    while (isdefined(self.spawncameraent) && isdefined(vehicleent) && !istrue(vehicleent.isdestroyed)) {
        goalposition = [];
        goalangles = [];
        if (istrue(level.usestaticspawnselectioncamera)) {
            temp = scripts\mp\spawnselection::getstaticcameraposition(self.team);
            goalposition = temp.origin;
            goalangles = temp.angles;
        } else {
            heightoffset = 7000;
            if (istrue(level.useunifiedspawnselectioncameraheight)) {
                heightoffset = function_87bbbee0bbf27304();
            }
            goalposition = vehicleent.origin + forward * -8500 + (0, 0, heightoffset);
            groundpos = level.spawnselectionlocations[ref][self.team].anchorentity.origin;
            camerapos = groundpos + forward * -8500 + (0, 0, heightoffset);
            toground = vectornormalize(groundpos - camerapos);
            goalangles = vectortoanglessafe(toground, (0, 0, 1));
            goalposition += [[ level.var_3c89983e2030dfff ]](self.team, groundpos);
        }
        self.spawncameratargetpos = goalposition;
        self.spawncameratargetang = goalangles;
        if (!isdefined(self.spawncameraendtime) || gettime() > self.spawncameraendtime) {
            self.spawncameraent moveto(goalposition, 0.25, 0.05, 0.2);
            self.spawncameraent rotateto(goalangles, 0.25, 0.05, 0.2);
        } else if (!var_ff816c44d164cac1) {
            var_ff816c44d164cac1 = 1;
            self.spawncameraent moveto(goalposition, self.spawncameratime, self.spawncameratime * 0.3, self.spawncameratime * 0.4);
            self.spawncameraent rotateto(goalangles, self.spawncameratime, self.spawncameratime * 0.3, self.spawncameratime * 0.4);
        }
        waitframe();
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69e0
// Size: 0xe4
function managevehiclehealthui(ref) {
    self endon("disconnect");
    self endon("end_respawn");
    self endon("tac_ops_spawn_focus_changed");
    self notify("manageVehicleHealthUI");
    self endon("manageVehicleHealthUI");
    vehicleent = level.spawnselectionlocations[ref][self.team].dynamicent;
    self setclientomnvar("ui_tom_veh_health_percent", 0);
    waitframe();
    var_3ed7c323526c2b33 = undefined;
    while (isdefined(vehicleent)) {
        healthpercent = int(clamp(vehicleent.health / vehicleent.maxhealth * 100, 0, 100));
        /#
            if (healthpercent < 0) {
                println("<dev string:x1c>");
            }
        #/
        if (!isdefined(var_3ed7c323526c2b33) || var_3ed7c323526c2b33 != healthpercent) {
            self setclientomnvar("ui_tom_veh_health_percent", int(healthpercent));
            var_3ed7c323526c2b33 = healthpercent;
        }
        waitframe();
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6acc
// Size: 0x382
function getclosestavailablespawnlocation() {
    closestdistsq = undefined;
    closestref = undefined;
    if (!gameflag("prematch_done") && (getgametype() == "arm" || getgametype() == "conflict" || getgametype() == "bigctf") || getgametype() == "risk" || !isdefined(self.hasvisitedgwspawnselection)) {
        if (self.team == "axis" || self.team == "team_three" || self.team == "team_four") {
            closestref = "gw_fob_axisHQ";
        } else {
            closestref = "gw_fob_alliesHQ";
        }
        self.hasvisitedgwspawnselection = 1;
    } else {
        var_be1261e9563d861b = 0;
        foreach (ref in level.availablespawnlocations[self.team]) {
            distsq = distancesquared(self.origin, level.spawnselectionlocations[ref][self.team].anchorentity.origin);
            if (!isdefined(distsq)) {
                continue;
            }
            if (ref == "gw_fob_" + self.team + "HQ") {
                if (distsq < 4194304) {
                    closestdistsq = distsq;
                    closestref = ref;
                    break;
                }
            }
            if (!isdefined(closestdistsq) || distsq < closestdistsq) {
                closestdistsq = distsq;
                closestref = ref;
            }
        }
        if (isdefined(level.squadspawnselectionlocations) && isdefined(level.squadspawnselectionlocations[self.team][self.sessionsquadid])) {
            locations = getsquadspawnlocations(self.team, self.sessionsquadid);
            foreach (loc in locations) {
                if (loc.dynamicent == self) {
                    continue;
                }
                distsq = distancesquared(self.origin, loc.dynamicent.origin);
                if (distsq < closestdistsq) {
                    closestdistsq = distsq;
                    closestref = loc.typeref;
                }
            }
        }
    }
    /#
        if (issubstr(closestref, "<dev string:x21>")) {
            println("<dev string:x29>");
        }
    #/
    id = -1;
    if (isdefined(closestref)) {
        if (!issubstr(closestref, "squad") && !issubstr(closestref, "vehicle") && !issubstr(closestref, "HQ")) {
            var_ecb1ed5831deb517 = closestref + "_" + level.localeid;
            id = tablelookuprownum("mp/spawnSelectionMapData.csv", 0, var_ecb1ed5831deb517);
        }
        if (id == -1) {
            id = tablelookuprownum("mp/spawnSelectionMapData.csv", 0, closestref);
        }
        self setclientomnvar("ui_tom_previous_selection", id);
        self.forcedspawncameraref = closestref;
        return;
    }
    self setclientomnvar("ui_tom_previous_selection", -1);
    self.forcedspawncameraref = undefined;
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e56
// Size: 0x4d5
function getstaticcameraposition(team) {
    assert(isdefined(scripts\cp_mp\utility\game_utility::getlocaleid()), "Asking for static spawn selection camera when no locale has been set.");
    var_fbc978e58d9efd71 = spawnstruct();
    if (isdefined(level.var_45abec6de5366021) && isdefined(level.var_7b73a66e2d4ca32f)) {
        var_fbc978e58d9efd71.origin = level.var_45abec6de5366021;
        var_fbc978e58d9efd71.angles = level.var_7b73a66e2d4ca32f;
        return var_fbc978e58d9efd71;
    }
    if (level.mapname == "mp_locale_test") {
        switch (level.localeid) {
        case #"hash_369d96655b32d0ca": 
            if (team == "axis") {
                var_fbc978e58d9efd71.origin = (2094, -1804, 2763);
                var_fbc978e58d9efd71.angles = (54, 40, 0);
            } else {
                var_fbc978e58d9efd71.origin = (2315, 1956, 2763);
                var_fbc978e58d9efd71.angles = (54, 296, 0);
            }
            break;
        case #"hash_369d97655b32d25d": 
            if (team == "axis") {
                var_fbc978e58d9efd71.origin = (5556, -1368, 2464);
                var_fbc978e58d9efd71.angles = (56, 42, 0);
            } else {
                var_fbc978e58d9efd71.origin = (5636, 1630, 2446);
                var_fbc978e58d9efd71.angles = (56, 307, 0);
            }
            break;
        default: 
            if (team == "axis") {
                var_fbc978e58d9efd71.origin = (0, 0, 0);
                var_fbc978e58d9efd71.angles = (0, 0, 0);
            } else {
                var_fbc978e58d9efd71.origin = (0, 0, 0);
                var_fbc978e58d9efd71.angles = (0, 0, 0);
            }
            break;
        }
    } else {
        switch (level.localeid) {
        case #"hash_369d95655b32cf37": 
            if (team == "axis") {
                var_fbc978e58d9efd71.origin = (30965, 28984, 12785);
                var_fbc978e58d9efd71.angles = (53, 82, 0);
            } else {
                var_fbc978e58d9efd71.origin = (35294, 53430, 12785);
                var_fbc978e58d9efd71.angles = (50, 260, 0);
            }
            break;
        case #"hash_369d96655b32d0ca": 
            if (team == "axis") {
                var_fbc978e58d9efd71.origin = (35294, 53430, 12785);
                var_fbc978e58d9efd71.angles = (50, 260, 0);
            } else {
                var_fbc978e58d9efd71.origin = (30965, 28984, 12785);
                var_fbc978e58d9efd71.angles = (53, 82, 0);
            }
            break;
        case #"hash_369d97655b32d25d": 
            if (team == "axis") {
                var_fbc978e58d9efd71.origin = (0, 0, 0);
                var_fbc978e58d9efd71.angles = (0, 0, 0);
            } else {
                var_fbc978e58d9efd71.origin = (0, 0, 0);
                var_fbc978e58d9efd71.angles = (0, 0, 0);
            }
            break;
        case #"hash_2cd7bb8e90f46c32":
        case #"hash_2cdb2a8e90f75986":
        case #"hash_2cdb2d8e90f75e3f": 
            var_fbc978e58d9efd71.origin = (6000, -46000, 19500);
            var_fbc978e58d9efd71.angles = (73, 130, 0);
            break;
        case #"hash_2ce1348e90fbe672":
        case #"hash_2ce1358e90fbe805": 
            var_fbc978e58d9efd71.origin = (-33000, -23775, 12650);
            var_fbc978e58d9efd71.angles = (82, 111, 0);
            break;
        default: 
            if (team == "axis") {
                var_fbc978e58d9efd71.origin = (0, 0, 0);
                var_fbc978e58d9efd71.angles = (0, 0, 0);
            } else {
                var_fbc978e58d9efd71.origin = (0, 0, 0);
                var_fbc978e58d9efd71.angles = (0, 0, 0);
            }
            break;
        }
    }
    return var_fbc978e58d9efd71;
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7334
// Size: 0x15e
function function_87bbbee0bbf27304() {
    if (getdvarint(@"hash_9d53a38d10c6bbc5", 0) > 0) {
        return getdvarint(@"hash_9d53a38d10c6bbc5", 0);
    }
    if (!isdefined(level.localeid)) {
        return 7000;
    }
    if (level.mapname == "mp_locale_test") {
        switch (level.localeid) {
        case #"hash_369d96655b32d0ca": 
            return 7000;
        case #"hash_369d97655b32d25d": 
            return 7000;
        case #"hash_369d88655b32bac0": 
            return 7000;
        case #"hash_369d89655b32bc53": 
            return 7000;
        case #"hash_2cd7bf8e90f4727e": 
            return 12000;
        default: 
            return 7000;
        }
        return;
    }
    switch (level.localeid) {
    case #"hash_369d95655b32cf37": 
        return 7000;
    case #"hash_369d96655b32d0ca": 
        return 8000;
    case #"hash_369d97655b32d25d": 
        return 8000;
    case #"hash_369d88655b32bac0": 
        return 8000;
    case #"hash_369d89655b32bc53": 
        return 8000;
    case #"hash_2cd4bf8e90f233e7": 
        return 7000;
    case #"hash_2cd4be8e90f23254": 
        return 5000;
    case #"hash_2cd7bf8e90f4727e": 
        return 12000;
    default: 
        return 7000;
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x749a
// Size: 0x10c
function updatefobindanger() {
    if (!istrue(level.usespawnselection)) {
        return;
    }
    level thread updatefobspawnsindanger();
    while (true) {
        foreach (team in level.teamnamelist) {
            foreach (entry in level.availablespawnlocations[team]) {
                selected = level.spawnselectionlocations[entry][team];
                if (isdefined(selected) && isdefined(selected.objectivekey)) {
                    selected.indanger = isobjectiveindanger(selected.objectivekey, team);
                }
            }
        }
        waitframe();
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75ae
// Size: 0x302
function updatefobspawnsindanger() {
    while (true) {
        foreach (team in level.teamnamelist) {
            testplayer = getteamdata(team, "players")[0];
            foreach (location in level.availablespawnlocations[team]) {
                if (!issubstr(location, "HQ") && issubstr(location, "fob")) {
                    canuseprimary = 1;
                    canusefallback = isdefined(level.spawnglobals.spawnsets[location + "_safe_" + team]);
                    primaryset = location + "_" + team;
                    fallbackset = undefined;
                    if (canusefallback) {
                        fallbackset = location + "_safe_" + team;
                    }
                    if (isdefined(level.spawninfluencezones)) {
                        trigger = undefined;
                        keys = getarraykeys(level.spawninfluencezones);
                        foreach (key in keys) {
                            if (key == location) {
                                trigger = level.spawninfluencezones[key];
                                break;
                            }
                        }
                        if (isdefined(trigger) && trigger isteamtouching(getotherteam(team)[0])) {
                            canuseprimary = 0;
                        }
                    }
                    indanger = 0;
                    if (isdefined(testplayer)) {
                        var_1e77bb9e18bf61a7 = undefined;
                        var_55807291c518deed = undefined;
                        if (canuseprimary) {
                            scripts\mp\spawnlogic::activatespawnset(primaryset, 1);
                            var_1e77bb9e18bf61a7 = testplayer getspawnbucketforplayer();
                            var_1e77bb9e18bf61a7 = scripts\mp\spawnlogic::getspawnbucketfromstring(var_1e77bb9e18bf61a7);
                        }
                        if (canusefallback) {
                            scripts\mp\spawnlogic::activatespawnset(fallbackset, 1);
                            var_55807291c518deed = testplayer getspawnbucketforplayer();
                            var_55807291c518deed = scripts\mp\spawnlogic::getspawnbucketfromstring(var_55807291c518deed);
                        }
                        if (canuseprimary && canusefallback) {
                            indanger = var_1e77bb9e18bf61a7 >= 2 && var_55807291c518deed >= 2;
                        } else if (canuseprimary && !canusefallback) {
                            indanger = var_1e77bb9e18bf61a7 >= 2;
                        } else if (canusefallback) {
                            indanger = var_55807291c518deed >= 2;
                        }
                    }
                    objectivekey = level.spawnselectionlocations[location][team].objectivekey;
                    level.objectives[objectivekey].spawnpointdanger = indanger;
                    level.objectives[objectivekey].spawnpointdangertime = gettime();
                }
            }
        }
        wait 1;
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78b8
// Size: 0x2a0
function updatespecificfobindanger(location, player, team) {
    objectivekey = level.spawnselectionlocations[location][team].objectivekey;
    if (!isdefined(objectivekey) || !isdefined(level.objectives[objectivekey]) || !isdefined(level.objectives[objectivekey].spawnpointdangertime) || level.objectives[objectivekey].spawnpointdangertime == gettime()) {
        return;
    }
    canuseprimary = 1;
    canusefallback = isdefined(level.spawnglobals.spawnsets[location + "_safe_" + team]);
    primaryset = location + "_" + team;
    fallbackset = undefined;
    if (canusefallback) {
        fallbackset = location + "_safe_" + team;
    }
    if (isdefined(level.spawninfluencezones)) {
        trigger = undefined;
        keys = getarraykeys(level.spawninfluencezones);
        foreach (key in keys) {
            if (key == location) {
                trigger = level.spawninfluencezones[key];
                break;
            }
        }
        if (isdefined(trigger) && isdefined(trigger.numplayers) && trigger.numplayers[getotherteam(team)[0]] > 0) {
            canuseprimary = 0;
        }
    }
    indanger = 0;
    if (isdefined(player)) {
        var_1e77bb9e18bf61a7 = undefined;
        var_55807291c518deed = undefined;
        if (canuseprimary) {
            scripts\mp\spawnlogic::activatespawnset(primaryset, 1);
            var_1e77bb9e18bf61a7 = player getspawnbucketforplayer();
            var_1e77bb9e18bf61a7 = scripts\mp\spawnlogic::getspawnbucketfromstring(var_1e77bb9e18bf61a7);
        }
        if (canusefallback) {
            scripts\mp\spawnlogic::activatespawnset(fallbackset, 1);
            var_55807291c518deed = player getspawnbucketforplayer();
            var_55807291c518deed = scripts\mp\spawnlogic::getspawnbucketfromstring(var_55807291c518deed);
        }
        if (canuseprimary && canusefallback) {
            indanger = var_1e77bb9e18bf61a7 >= 2 && var_55807291c518deed >= 2;
        } else if (canuseprimary && !canusefallback) {
            indanger = var_1e77bb9e18bf61a7 >= 2;
        } else if (canusefallback) {
            indanger = var_55807291c518deed >= 2;
        }
    }
    level.objectives[objectivekey].spawnpointdanger = indanger;
    level.objectives[objectivekey].spawnpointdangertime = gettime();
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b60
// Size: 0x167
function vehicle_showteamtanks() {
    self endon("disconnect");
    scripts\mp\flags::gameflagwait("prematch_done");
    foreach (tank in level.trackedtanks[self.team]) {
        scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(tank.spawnselectionmarker.objidnum, self);
    }
    while (self.inspawnselection) {
        waitframe();
    }
    foreach (tank in level.trackedtanks["axis"]) {
        scripts\mp\objidpoolmanager::objective_playermask_hidefrom(tank.spawnselectionmarker.objidnum, self);
    }
    foreach (tank in level.trackedtanks["allies"]) {
        scripts\mp\objidpoolmanager::objective_playermask_hidefrom(tank.spawnselectionmarker.objidnum, self);
    }
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ccf
// Size: 0x214
function function_f83711dd7546db96() {
    if (!isdefined(level.gw_objstruct) || !isdefined(level.gw_objstruct.allieshqloc) || !isdefined(level.gw_objstruct.allieshqloc.marker)) {
        return;
    }
    if (self.team == "allies") {
        if (level.var_a50b22fa98674a50) {
            scripts\mp\objidpoolmanager::objective_playermask_hidefrom(level.gw_objstruct.allieshqloc.marker.objidnum, self);
        } else {
            scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(level.gw_objstruct.allieshqloc.marker.objidnum, self);
        }
        if (level.var_f15becfbc1b01a1b) {
            scripts\mp\objidpoolmanager::objective_playermask_hidefrom(level.gw_objstruct.axishqloc.enemymarker.objidnum, self);
        } else {
            scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(level.gw_objstruct.axishqloc.enemymarker.objidnum, self);
        }
        return;
    }
    if (level.var_a50b22fa98674a50) {
        scripts\mp\objidpoolmanager::objective_playermask_hidefrom(level.gw_objstruct.axishqloc.marker.objidnum, self);
    } else {
        scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(level.gw_objstruct.axishqloc.marker.objidnum, self);
    }
    if (level.var_f15becfbc1b01a1b) {
        scripts\mp\objidpoolmanager::objective_playermask_hidefrom(level.gw_objstruct.allieshqloc.enemymarker.objidnum, self);
        return;
    }
    scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(level.gw_objstruct.allieshqloc.enemymarker.objidnum, self);
}

// Namespace spawnselection / scripts\mp\spawnselection
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7eeb
// Size: 0x214
function function_dc659688380c4195() {
    if (!isdefined(level.gw_objstruct) || !isdefined(level.gw_objstruct.allieshqloc) || !isdefined(level.gw_objstruct.allieshqloc.marker)) {
        return;
    }
    if (self.team == "allies") {
        if (level.var_757ec02df4d678f5) {
            scripts\mp\objidpoolmanager::objective_playermask_hidefrom(level.gw_objstruct.allieshqloc.marker.objidnum, self);
        } else {
            scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(level.gw_objstruct.allieshqloc.marker.objidnum, self);
        }
        if (level.var_6f40c2b6970373c0) {
            scripts\mp\objidpoolmanager::objective_playermask_hidefrom(level.gw_objstruct.axishqloc.enemymarker.objidnum, self);
        } else {
            scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(level.gw_objstruct.axishqloc.enemymarker.objidnum, self);
        }
        return;
    }
    if (level.var_757ec02df4d678f5) {
        scripts\mp\objidpoolmanager::objective_playermask_hidefrom(level.gw_objstruct.axishqloc.marker.objidnum, self);
    } else {
        scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(level.gw_objstruct.axishqloc.marker.objidnum, self);
    }
    if (level.var_6f40c2b6970373c0) {
        scripts\mp\objidpoolmanager::objective_playermask_hidefrom(level.gw_objstruct.allieshqloc.enemymarker.objidnum, self);
        return;
    }
    scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(level.gw_objstruct.allieshqloc.enemymarker.objidnum, self);
}

