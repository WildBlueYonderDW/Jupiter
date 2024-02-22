// mwiii decomp prototype
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
#using script_27c2db69a21775a0;
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

#namespace namespace_f463d4704ecd6902;

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd37
// Size: 0x283
function init() {
    if (namespace_8e28f8b325a83325::function_167619fe3d0cff00()) {
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
    namespace_61d0e47c5dff187c::lui_registercallback("tac_ops_spawn_focus_changed", &endcondition_focuschanged);
    namespace_71eef510d7f364cf::registeronplayerspawncallback(&isplayerindanger_think);
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc1
// Size: 0x5
function function_dc3a172bf923d9b3() {
    return 1;
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfce
// Size: 0x3
function delayspawntoc130() {
    
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfd8
// Size: 0x186
function churnareas() {
    var_45c9dae424956501 = [];
    var_45c9dae424956501[0] = "lane01_";
    var_45c9dae424956501[1] = "lane02_";
    var_45c9dae424956501[2] = "lane03_";
    var_265f87a0122dcfe7 = [];
    var_265f87a0122dcfe7[var_265f87a0122dcfe7.size] = var_45c9dae424956501[0] + randomint(3) + 1;
    var_265f87a0122dcfe7[var_265f87a0122dcfe7.size] = var_45c9dae424956501[1] + randomint(3) + 1;
    var_265f87a0122dcfe7[var_265f87a0122dcfe7.size] = var_45c9dae424956501[2] + randomint(3) + 1;
    setspawnlocations(var_265f87a0122dcfe7, "allies");
    var_4e35ac8fc8c9f4ce = [];
    var_4e35ac8fc8c9f4ce[var_265f87a0122dcfe7.size] = var_45c9dae424956501[0] + randomint(3) + 1;
    var_4e35ac8fc8c9f4ce[var_265f87a0122dcfe7.size] = var_45c9dae424956501[1] + randomint(3) + 1;
    var_4e35ac8fc8c9f4ce[var_265f87a0122dcfe7.size] = var_45c9dae424956501[2] + randomint(3) + 1;
    setspawnlocations(var_4e35ac8fc8c9f4ce, "axis");
    updatespawnareas();
    while (1) {
        wait(10);
        var_265f87a0122dcfe7 = [];
        var_265f87a0122dcfe7[var_265f87a0122dcfe7.size] = var_45c9dae424956501[0] + randomint(3) + 1;
        var_265f87a0122dcfe7[var_265f87a0122dcfe7.size] = var_45c9dae424956501[1] + randomint(3) + 1;
        var_265f87a0122dcfe7[var_265f87a0122dcfe7.size] = var_45c9dae424956501[2] + randomint(3) + 1;
        setspawnlocations(var_265f87a0122dcfe7, "allies");
        var_4e35ac8fc8c9f4ce = [];
        var_4e35ac8fc8c9f4ce[var_4e35ac8fc8c9f4ce.size] = var_45c9dae424956501[0] + randomint(3) + 1;
        var_4e35ac8fc8c9f4ce[var_4e35ac8fc8c9f4ce.size] = var_45c9dae424956501[1] + randomint(3) + 1;
        var_4e35ac8fc8c9f4ce[var_4e35ac8fc8c9f4ce.size] = var_45c9dae424956501[2] + randomint(3) + 1;
        setspawnlocations(var_4e35ac8fc8c9f4ce, "axis");
        updatespawnareas();
    }
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1165
// Size: 0x19c
function setspawnlocations(var_f05f5b44b0e2757f, team) {
    var_fccd72853ab541be = [];
    foreach (loc in level.availablespawnlocations[team]) {
        if (issubstr(loc, "dynamic") || issubstr(loc, "vehicle") || issubstr(loc, "squad")) {
            var_fccd72853ab541be[var_fccd72853ab541be.size] = loc;
        }
    }
    level.availablespawnlocations[team] = [];
    foreach (ref in var_f05f5b44b0e2757f) {
        if (!array_contains(level.availablespawnlocations[team], ref)) {
            level.availablespawnlocations[team][level.availablespawnlocations[team].size] = ref;
        }
    }
    foreach (ref in var_fccd72853ab541be) {
        if (!array_contains(level.availablespawnlocations[team], ref)) {
            level.availablespawnlocations[team][level.availablespawnlocations[team].size] = ref;
        }
    }
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1308
// Size: 0x43
function allowspawnlocation(ref, team) {
    if (!array_contains(level.availablespawnlocations[team], ref)) {
        level.availablespawnlocations[team][level.availablespawnlocations[team].size] = ref;
    }
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1352
// Size: 0x88
function removespawnlocation(ref, team) {
    availablespawnlocations = [];
    foreach (location in level.availablespawnlocations[team]) {
        if (location != ref) {
            availablespawnlocations[availablespawnlocations.size] = location;
        }
    }
    level.availablespawnlocations[team] = availablespawnlocations;
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e1
// Size: 0xb
function updatespawnareas() {
    level notify("tac_ops_map_changed");
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13f3
// Size: 0x9f
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

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1499
// Size: 0x4c2
function setupspawnlocations() {
    while (!isdefined(level.gamemodespawnpointnames)) {
        waitframe();
    }
    level.spawnselectionlocations = [];
    foreach (entry in level.teamnamelist) {
        spawns = namespace_b2d5aa2baf2b5701::getspawnpointarray(level.gamemodespawnpointnames[entry]);
        namespace_b2d5aa2baf2b5701::registerspawnpoints(entry, spawns);
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
            } else if (isdefined(namespace_36f464722d326bbe::getlocaleid())) {
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
                if (namespace_36f464722d326bbe::getmapname() == "mp_quarry2" && target.targetname == "gw_fob_03_safe_axis") {
                    team = "axis";
                } else {
                    if (team == "team_three" || team == "team_four") {
                        goto LOC_00000324;
                    }
                    team = target.script_team;
                LOC_00000324:
                }
            LOC_00000324:
            }
        LOC_00000324:
            if (isdefined(level.spawnselectionlocations[ref]) && isdefined(level.spawnselectionlocations[ref][team])) {
                loc = level.spawnselectionlocations[ref][team];
                if (!array_contains(loc.spawnpoints, s)) {
                    loc.spawnpoints[loc.spawnpoints.size] = s;
                }
            } else {
                struct = spawnstruct();
                struct.origin = target.origin;
                struct.angles = target.angles;
                struct.spawnpoints = [];
                struct.spawnpoints[0] = s;
                if (!issubstr(ref, "safe")) {
                    initspawnarea(team, struct, ref);
                } else {
                    level.spawnselectionlocations[ref][team] = struct;
                }
            }
        }
        foreach (key, teamarray in level.spawnselectionlocations) {
            if (isdefined(teamarray[entry])) {
                namespace_b2d5aa2baf2b5701::registerspawnset(key + "_" + entry, teamarray[entry].spawnpoints);
            }
        }
    }
    level.usespawnselection = namespace_8e28f8b325a83325::function_167619fe3d0cff00() && level.spawnselectionlocations.size > 0;
    if (level.usespawnselection) {
        level.getspawnpoint = &getspawnpoint;
    }
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1962
// Size: 0x16b
function initspawnarea(team, struct, ref) {
    typeid = tablelookuprownum("mp/spawnSelectionMapData.csv", 0, ref);
    /#
        assertex(typeid >= 0, "tac_ops_map::addSpawnArea() - Unknown typeRef "" + ref + """);
    #/
    var_1c75a457e19f3b75 = spawn("script_model", struct.origin);
    var_1c75a457e19f3b75 setmodel("tag_origin");
    struct.anchorentity = var_1c75a457e19f3b75;
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
        var_1c75a457e19f3b75 linkto(struct.dynamicent);
    }
    level.spawnselectionlocations[ref][team] = struct;
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ad4
// Size: 0x2c
function getlabelid(ref) {
    labelid = tablelookuprownum("mp/spawnSelectionMapData.csv", 0, ref);
    if (!isdefined(labelid)) {
        labelid = 0;
    }
    return labelid;
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1b08
// Size: 0x35
function setanchorent(ref, team, ent) {
    level.spawnselectionlocations[ref][team].anchorentity = ent;
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b44
// Size: 0x7f
function setupspawninfluencezones() {
    level.spawninfluencezones = [];
    for (i = 1; i <= 5; i++) {
        trigger = namespace_36f464722d326bbe::getlocaleent("gw_fob_0" + i + "_spawnInfluenceZone");
        if (!isdefined(trigger)) {
            continue;
        }
        namespace_f1565a2788ab1e89::makeenterexittrigger(trigger, &spawninfluencezone_onusebegin, &spawninfluencezone_onuseend);
        trigger.touchlist = [];
        level.spawninfluencezones["gw_fob_0" + i] = trigger;
    }
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bca
// Size: 0x57
function spawninfluencezone_onusebegin(ent, trigger) {
    if (isdefined(ent.classname) && ent.classname == "script_vehicle") {
        return;
    }
    trigger.touchlist = array_add(trigger.touchlist, ent);
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c28
// Size: 0x57
function spawninfluencezone_onuseend(ent, trigger) {
    if (isdefined(ent.classname) && ent.classname == "script_vehicle") {
        return;
    }
    trigger.touchlist = array_remove(trigger.touchlist, ent);
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c86
// Size: 0xae
function isteamtouching(team) {
    found = 0;
    var_92cc828bfcf717c8 = [];
    foreach (entry in self.touchlist) {
        if (!isdefined(entry)) {
            continue;
        }
        if (isdefined(entry.team) && entry.team == team) {
            found = 1;
        }
        var_92cc828bfcf717c8[var_92cc828bfcf717c8.size] = entry;
    }
    self.touchlist = var_92cc828bfcf717c8;
    return found;
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d3c
// Size: 0x831
function getspawnpoint() {
    namespace_b2d5aa2baf2b5701::deactivateallspawnsets();
    if (namespace_b2d5aa2baf2b5701::shoulduseteamstartspawn()) {
        spawnpoints = namespace_b2d5aa2baf2b5701::getspawnpointarray(level.gamemodestartspawnpointnames[self.team]);
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint_startspawn(spawnpoints);
        return spawnpoint;
    }
    spawnpoint = undefined;
    self.wassquadspawned = 0;
    if (isdefined(self.selectedspawnarea)) {
        printspawnmessage("spawnSelection::getSpawnPoint() = " + self.selectedspawnarea);
        if (issubstr(self.selectedspawnarea, "squad")) {
            index = undefined;
            if (self.selectedspawnarea == "squad_leader") {
                index = level.squaddata[self.team][self.var_ff97225579de16a].squadleader.var_3f78c6a0862f9e25;
            } else {
                index = int(getsubstr(self.selectedspawnarea, self.selectedspawnarea.size - 1, self.selectedspawnarea.size));
            }
            teammate = level.squaddata[self.team][self.var_ff97225579de16a].players[index];
            spawnpoint = namespace_90f75d3fdf89a43e::findteammatebuddyspawn(teammate);
            teammate thread namespace_48a08c5037514e04::doscoreevent(#"squad_spawn");
            thread namespace_48a08c5037514e04::doscoreevent(#"hash_5fe4192c1fd1be4c");
            self.wassquadspawned = 1;
            if (isdefined(teammate.vehicle)) {
                self.spawningintovehicle = 1;
                self.vehiclespawninginto = teammate.vehicle.vehiclename;
            }
            namespace_3c5a4254f2b957ea::incpersstat("spawnSelectSquad", 1);
            teammate namespace_3c5a4254f2b957ea::incpersstat("timesSelectedAsSquadLeader", 1);
        } else if (issubstr(self.selectedspawnarea, "dynamic")) {
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, self.team, undefined, undefined, 2);
            thread namespace_35f66e61f847336c::spawnplayertoc130();
        } else if (issubstr(self.selectedspawnarea, "vehicle")) {
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, self.team, undefined, undefined, 2);
            var_a5d118f040f60db0 = level.spawnselectionlocations[self.selectedspawnarea][self.team].dynamicent;
            forwardoffset = -200;
            heightoffset = 64;
            spawnpoint.origin = var_a5d118f040f60db0.origin + anglestoforward(var_a5d118f040f60db0.angles) * forwardoffset + (0, 0, heightoffset);
            spawnpoint.angles = (0, var_a5d118f040f60db0.angles[1], 0);
            seat = function_d3d95972f58ad2bc(var_a5d118f040f60db0);
            if (isdefined(seat) && istrue(namespace_141c4634b6ea7b27::vehicle_interact_vehiclecanbeused(var_a5d118f040f60db0)) && (istrue(namespace_dace9d390bc4a290::vehicle_spawn_getleveldataforvehicle(var_a5d118f040f60db0 namespace_1f188a13f7e79610::function_d93ec4635290febd()).var_1ad50a59da38c8f5) || seat == "driver")) {
                data = spawnstruct();
                data.useonspawn = 1;
                data.enterstartwaitmsg = "spawned_player";
                thread vehicle_occupancy_enter(var_a5d118f040f60db0, seat, self, data);
            } else {
                exitboundinginfo = function_517f60905f08bf96(var_a5d118f040f60db0);
                var_b8e7e41430673dd2 = vehicle_occupancy_getleveldataforvehicle(var_a5d118f040f60db0.vehiclename);
                var_de71eef0ad57608 = 0;
                foreach (ref, direction in var_b8e7e41430673dd2.exitdirections) {
                    if (direction == "top" || direction == "inside") {
                        position = vehicle_occupancy_getexitposition(var_a5d118f040f60db0, self, ref, exitboundinginfo, 1);
                        var_7862c7c7ade2b42e = var_b8e7e41430673dd2.exitoffsets[ref];
                        if (isdefined(position)) {
                            spawnpoint.origin = position;
                            self.var_f109e15fae27ddc2 = var_a5d118f040f60db0;
                            self.var_9066885bd8b59751 = var_7862c7c7ade2b42e;
                            thread namespace_1f188a13f7e79610::vehicle_preventplayercollisiondamagefortimeafterexit(var_a5d118f040f60db0, self);
                            break;
                        } else if (!var_de71eef0ad57608) {
                            var_de71eef0ad57608 = 1;
                            var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(var_a5d118f040f60db0 namespace_1f188a13f7e79610::function_d93ec4635290febd());
                            var_7862c7c7ade2b42e = var_e2818ad39a3341b4.exitoffsets[ref];
                            spawnpoint.origin = var_a5d118f040f60db0.origin + rotatevector(var_7862c7c7ade2b42e, var_a5d118f040f60db0.angles);
                            self.var_f109e15fae27ddc2 = var_a5d118f040f60db0;
                            self.var_9066885bd8b59751 = var_7862c7c7ade2b42e;
                            thread namespace_1f188a13f7e79610::vehicle_preventplayercollisiondamagefortimeafterexit(var_a5d118f040f60db0, self);
                        }
                    }
                }
            }
            driver = vehicle_occupancy_getdriver(var_a5d118f040f60db0);
            vehicleref = var_a5d118f040f60db0 namespace_1f188a13f7e79610::function_d93ec4635290febd();
            var_4ac41c9583912b8f = namespace_dace9d390bc4a290::vehicle_spawn_getleveldataforvehicle(vehicleref).var_51b047bd40d984fe;
            if (isdefined(driver) && isdefined(var_4ac41c9583912b8f) && var_4ac41c9583912b8f != "") {
                driver thread namespace_48a08c5037514e04::doscoreevent(function_1823ff50bb28148d(var_4ac41c9583912b8f));
            }
            self.spawningintovehicle = 1;
            namespace_3c5a4254f2b957ea::incpersstat("spawnSelectVehicle", 1);
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
            namespace_b2d5aa2baf2b5701::activatespawnset(ref, 1);
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, self.team, undefined, undefined, 2);
            if (issubstr(self.selectedspawnarea, "alliesHQ") || issubstr(self.selectedspawnarea, "axisHQ")) {
                namespace_3c5a4254f2b957ea::incpersstat("spawnSelectBase", 1);
            } else {
                namespace_3c5a4254f2b957ea::incpersstat("spawnSelectFlag", 1);
            }
        }
    } else {
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, self.team, undefined, undefined, 2);
    }
    if (istrue(level.usesquadspawn) && istrue(self.squadspawnconfirmed)) {
        var_279bb6642ec5e695 = self getspectatingplayer();
        if (isdefined(var_279bb6642ec5e695) && isdefined(self.var_ff97225579de16a) && self.team == var_279bb6642ec5e695.team && self.var_ff97225579de16a == var_279bb6642ec5e695.var_ff97225579de16a) {
            spawnpoint = namespace_90f75d3fdf89a43e::findteammatebuddyspawn(var_279bb6642ec5e695);
            var_279bb6642ec5e695 thread namespace_48a08c5037514e04::givexpwithtext(#"squad_spawn");
            thread namespace_48a08c5037514e04::givexpwithtext(#"hash_5fe4192c1fd1be4c");
            self.wassquadspawned = 1;
        }
    }
    return spawnpoint;
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2575
// Size: 0x8a
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

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2606
// Size: 0x3cd
function evaluatefobspawns() {
    self endon("disconnect");
    self endon("end_respawn");
    self notify("evaluateFOBSpawns");
    self endon("evaluateFOBSpawns");
    var_e62653e4f73622a = [];
    while (1) {
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
            var_a81af2627597688a = 0;
            var_8d03c3781f6b70c0 = 0;
            var_5e41ee78365ed202 = 0;
            if (isdefined(selected.objectivekey)) {
                indanger = istrue(selected.indanger);
                var_a81af2627597688a = level.objectives[selected.objectivekey].ownerteam == self.team;
            } else if (issubstr(entry, "vehicle")) {
                var_c6577c1382e4b40d = selected.dynamicent;
                if (isdefined(var_c6577c1382e4b40d) && !istrue(var_c6577c1382e4b40d.isdestroyed)) {
                    indanger = istrue(var_c6577c1382e4b40d.indanger);
                    var_8d03c3781f6b70c0 = hassquadmatepassengers(var_c6577c1382e4b40d, self);
                    if (vehicle_occupancy_getavailablevehicleseats(var_c6577c1382e4b40d).size == 0 || !istrue(namespace_141c4634b6ea7b27::vehicle_interact_vehiclecanbeused(var_c6577c1382e4b40d))) {
                        var_5e41ee78365ed202 = 1;
                    }
                }
            }
            id = selected.labelid;
            if (indanger) {
                id = id + 128;
            }
            if (var_a81af2627597688a) {
                id = id + 256;
            }
            if (istrue(var_5e41ee78365ed202)) {
                id = id + 1024;
            }
            if (istrue(var_8d03c3781f6b70c0)) {
                id = id + 2048;
            }
            if (isdefined(selected.objectivekey) && !function_7f15ad998050dd8c()) {
                id = id + 32768;
                objectiveindex = level.objectives[selected.objectivekey].objidnum;
                id = id + (objectiveindex << 16);
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

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29da
// Size: 0x23c
function isobjectiveindanger(objectivekey, team) {
    obj = level.objectives[objectivekey];
    switch (obj.id) {
    case #"hash_def5f510c5aa68f4":
        if (istrue(level.var_b307135dbcef5a38)) {
            return (team != obj.ownerteam);
            goto LOC_000000a2;
        }
        return 0;
    case #"hash_ffc490adcece137f":
    LOC_000000a2:
        if (!level.var_a09dce2c531d0bab) {
            return 1;
        }
        if (istrue(level.var_f335c53db1d6dd34)) {
            return (team != obj.ownerteam);
        }
        var_763491d0037dff6e = level.var_c0e8540c63b7af50 > 0;
        var_d590566a3430702f = isdefined(obj.var_f271d42faf329b89) && obj.var_f271d42faf329b89 <= level.var_c0e8540c63b7af50;
        if (var_763491d0037dff6e) {
            return !var_d590566a3430702f;
            goto LOC_00000113;
        }
        return 0;
    case #"hash_2da0874a234cfd12":
    LOC_00000113:
        return 0;
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
        break;
    }
    return 0;
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c1e
// Size: 0x15e
function isvehicleindanger(var_c6577c1382e4b40d) {
    currenttime = gettime();
    var_e2adec8d28854d3f = isdefined(var_c6577c1382e4b40d) && isdefined(var_c6577c1382e4b40d.lasttimedamaged) && var_c6577c1382e4b40d.lasttimedamaged + 5000 > currenttime;
    oob = isdefined(var_c6577c1382e4b40d) && var_c6577c1382e4b40d namespace_d9c77dc2a6fe29c6::istouchingoobtrigger();
    enemyinproximity = 0;
    if (isdefined(var_c6577c1382e4b40d.team)) {
        var_35c341a22b58d17d = utility::playersnear(var_c6577c1382e4b40d.origin, 384);
        foreach (player in var_35c341a22b58d17d) {
            if (isdefined(player) && player.team != var_c6577c1382e4b40d.team && isalive(player) && !isdefined(player.fauxdead)) {
                if (abs(var_c6577c1382e4b40d.origin[2] - player.origin[2]) < 100) {
                    enemyinproximity = 1;
                    break;
                }
            }
        }
    }
    return var_e2adec8d28854d3f || oob || enemyinproximity;
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d84
// Size: 0x33
function function_167619fe3d0cff00() {
    if (!isdefined(level.usespawnselection)) {
        level.usespawnselection = getdvarint(@"hash_6e73595f4ce7501e", 0) != 0;
    }
    return level.usespawnselection;
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dbf
// Size: 0x2d6
function vehicleindangertracking(var_c6577c1382e4b40d) {
    var_c6577c1382e4b40d endon("death");
    var_c6577c1382e4b40d.indanger = 0;
    var_55d25b77e9fb1759 = getdvarfloat(@"hash_b5bc6252b2764d8c", 0.15);
    while (1) {
        currenttime = gettime();
        burningdown = istrue(var_c6577c1382e4b40d.burningdown);
        var_83d6b23061e5bf09 = namespace_d325722f2754c2c4::islockedonto(var_c6577c1382e4b40d);
        var_f7772e25266681de = vehicle_occupancy_canspawninto(var_c6577c1382e4b40d);
        var_e2adec8d28854d3f = isdefined(var_c6577c1382e4b40d) && isdefined(var_c6577c1382e4b40d.lasttimedamaged) && var_c6577c1382e4b40d.lasttimedamaged + 5000 > currenttime;
        oob = isdefined(var_c6577c1382e4b40d) && var_c6577c1382e4b40d namespace_d9c77dc2a6fe29c6::istouchingoobtrigger();
        var_5aa9cfb2ea0ff115 = 0;
        enemyinproximity = 0;
        if (isdefined(var_c6577c1382e4b40d.team) && var_c6577c1382e4b40d.vehiclename != "apc_russian" && var_c6577c1382e4b40d.vehiclename != "veh9_apc_8x8") {
            var_35c341a22b58d17d = utility::playersnear(var_c6577c1382e4b40d.origin, 384);
            foreach (player in var_35c341a22b58d17d) {
                if (isdefined(player) && player.team != var_c6577c1382e4b40d.team && isalive(player) && !isdefined(player.fauxdead)) {
                    if (abs(var_c6577c1382e4b40d.origin[2] - player.origin[2]) < 100) {
                        enemyinproximity = 1;
                        break;
                    }
                }
            }
        }
        if (var_c6577c1382e4b40d.vehiclename == "apc_russian" || var_c6577c1382e4b40d.vehiclename == "veh9_apc_8x8" || var_c6577c1382e4b40d.vehiclename == "veh9_palfa") {
            var_6990f1d64bbbbbf3 = var_c6577c1382e4b40d.health / var_c6577c1382e4b40d.maxhealth;
            if (var_6990f1d64bbbbbf3 > var_55d25b77e9fb1759) {
                var_e2adec8d28854d3f = 0;
            }
            var_83d6b23061e5bf09 = 0;
        } else if (var_c6577c1382e4b40d.vehiclename == "veh9_patrol_boat") {
            var_5aa9cfb2ea0ff115 = var_c6577c1382e4b40d vehicle_isonground();
        }
        var_2492daef403f6853 = var_c6577c1382e4b40d.indanger;
        var_c6577c1382e4b40d.indanger = var_e2adec8d28854d3f || oob || enemyinproximity || burningdown || var_83d6b23061e5bf09 || !var_f7772e25266681de || var_5aa9cfb2ea0ff115;
        waitframe();
    }
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x309c
// Size: 0xf4
function hassquadmatepassengers(vehicle, player) {
    if (!isdefined(level.squaddata)) {
        return 0;
    }
    var_607da387f3617ed1 = level.squaddata[self.team][self.var_ff97225579de16a].players;
    foreach (occupant in vehicle.occupants) {
        foreach (var_c98aac0e8e6eaf8c in var_607da387f3617ed1) {
            if (var_c98aac0e8e6eaf8c == occupant) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3198
// Size: 0x22e
function setspawnselectionorder() {
    markers = getstructarray("axisLeft_alliesRight", "targetname");
    if (isdefined(namespace_36f464722d326bbe::getlocaleid())) {
        var_ef171a7416dc2ab0 = undefined;
        foreach (marker in markers) {
            if (marker.script_noteworthy == level.localeid) {
                var_ef171a7416dc2ab0 = marker;
            }
        }
        /#
            assert(isdefined(var_ef171a7416dc2ab0), "Mode is using Locales, but no Directional Marker set for Locale " + level.localeid);
        #/
    } else {
        var_ef171a7416dc2ab0 = getstruct("axisLeft_alliesRight", "targetname");
    }
    var_c099305bcdb72ad7 = [];
    foreach (location in level.spawnselectionlocations) {
        foreach (index, team in location) {
            if (index != self.team) {
                continue;
            } else {
                var_c099305bcdb72ad7[var_c099305bcdb72ad7.size] = team;
            }
        }
    }
    if (self.team == "axis") {
        var_3067799883aaeeb7 = var_ef171a7416dc2ab0 array_sort_with_func(var_c099305bcdb72ad7, &sortlocationsbydistance_closestfirst);
    } else {
        var_3067799883aaeeb7 = var_ef171a7416dc2ab0 array_sort_with_func(var_c099305bcdb72ad7, &sortlocationsbydistance_farthestfirst);
    }
    foreach (index, objective in var_3067799883aaeeb7) {
        self setclientomnvar("ui_tom_spawn_entity_" + index, objective.anchorentity);
        self setclientomnvar("ui_tom_spawn_id_" + index, objective.labelid);
    }
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33cd
// Size: 0x47
function sortlocationsbydistance_closestfirst(var_fcf7e6e6d8c4861, var_fcf7b6e6d8c41c8) {
    return distancesquared(var_fcf7e6e6d8c4861.origin, self.origin) < distancesquared(var_fcf7b6e6d8c41c8.origin, self.origin);
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x341c
// Size: 0x47
function sortlocationsbydistance_farthestfirst(var_fcf7e6e6d8c4861, var_fcf7b6e6d8c41c8) {
    return distancesquared(var_fcf7e6e6d8c4861.origin, self.origin) > distancesquared(var_fcf7b6e6d8c41c8.origin, self.origin);
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x346b
// Size: 0x1b2
function picklane(lane) {
    var_b67beb76f4cec0f7 = undefined;
    foreach (loc in level.availablespawnlocations[self.team]) {
        if (issubstr(loc, lane)) {
            var_b67beb76f4cec0f7 = loc;
            break;
        }
    }
    if (!isdefined(var_b67beb76f4cec0f7)) {
        return;
    }
    if (!isdefined(level.spawnselectionlocations[var_b67beb76f4cec0f7])) {
        return;
    }
    selected = level.spawnselectionlocations[var_b67beb76f4cec0f7][self.team];
    if (!isdefined(selected)) {
        return;
    }
    var_4e2f30f5b1dfa9f3 = self.team == "allies";
    var_69de983472a45af9 = 0;
    switch (lane) {
    case #"hash_2eafa9a536901cad":
    case #"hash_7270631ce8f6357f":
    case #"hash_c9b3133a17a3b2d0":
        var_69de983472a45af9 = ter_op(var_4e2f30f5b1dfa9f3, 0, 2);
        break;
    case #"hash_2881ce6c1efb40c5":
    case #"hash_2eafa6a5369017f4":
    case #"hash_7273231ce8f80f56":
        var_69de983472a45af9 = 1;
        break;
    case #"hash_2eafa7a536901987":
    case #"hash_726a231ce8f15391":
    case #"hash_96815ce4f2a3dbc5":
        var_69de983472a45af9 = ter_op(var_4e2f30f5b1dfa9f3, 2, 0);
        break;
    }
    self setclientomnvar("ui_tom_spawn_entity_" + var_69de983472a45af9, selected.anchorentity);
    self setclientomnvar("ui_tom_spawn_id_" + var_69de983472a45af9, selected.labelid);
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3624
// Size: 0xca
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

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36f5
// Size: 0xee
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

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37ea
// Size: 0x104
function waitforspawnselection(timeuntilspawn, var_54a4645082a09829) {
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
    if (isai(self) || istrue(var_54a4645082a09829) || issubstr(self.name, "_hl_")) {
        timeuntilspawnmessaging(timeuntilspawn, "waiting_to_spawn");
        if (namespace_b2d5aa2baf2b5701::shoulduseteamstartspawn()) {
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

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38f5
// Size: 0x94
function pickrandomnonvehiclespawn() {
    var_e7479a24d5e8f522 = array_randomize(level.availablespawnlocations[self.team]);
    foreach (area in var_e7479a24d5e8f522) {
        if (issubstr(area, "fob") || issubstr(area, "HQ")) {
            self.selectedspawnarea = area;
            return;
        }
    }
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3990
// Size: 0x9a
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

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a31
// Size: 0x33
function pickrandomspawn() {
    var_e7479a24d5e8f522 = array_randomize(level.availablespawnlocations[self.team]);
    self.selectedspawnarea = var_e7479a24d5e8f522[0];
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a6c
// Size: 0xa8
function function_37b8d5f51288ba7d() {
    timeoutms = getdvarint(@"hash_b7cddbc61e64ed", 2000);
    if (!istrue(self.var_a7461778c6502729) && gameflag("prematch_done")) {
        timeoutms = getdvarint(@"hash_a06dc2c4de808757", 9000);
        self.var_a7461778c6502729 = 1;
    }
    var_dc51de4e8cbd07b = namespace_d7fe36703a9572fe::getspawncamera();
    var_11f3b4465c8b637b = namespace_d3d40f75bb4e4c32::playerstreamhintlocation(var_dc51de4e8cbd07b.origin, timeoutms);
    namespace_36f464722d326bbe::fadetoblackforplayer(self, 1, 0);
    namespace_d3d40f75bb4e4c32::playerwaittillstreamhintcomplete();
    namespace_36f464722d326bbe::fadetoblackforplayer(self, 0, 0.5);
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b1b
// Size: 0x2dc
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
    namespace_d19129e4fa5d176::loadout_clearperks();
    thread namespace_d7fe36703a9572fe::startspawncamera(0, 0, 0);
    thread function_37b8d5f51288ba7d();
    self.selectedspawnarea = undefined;
    self.inspawnselection = 1;
    self setclientomnvar("ui_hide_objectives", 1);
    thread selectiondelaymessaging(timeuntilspawn);
    if (istrue(level.spawnselectionshowfriendly) || istrue(level.spawnselectionshowenemy)) {
        thread namespace_8af839578a30040a::flashpoint_spawnselectionvfx();
    }
    if (istrue(level.showteamtanks)) {
        thread vehicle_showteamtanks();
    }
    wait(0.5);
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
    while (1) {
        var_302dce65cab2acf3 = watchendconditions();
        var_83cb6d50fa2daf87 = 1;
        switch (var_302dce65cab2acf3) {
        case #"hash_2400cb6252980d91":
            var_83cb6d50fa2daf87 = 1;
            break;
        case #"hash_eccbb0b46937db3a":
            var_83cb6d50fa2daf87 = 0;
            refreshplayerspawnareaomnvars();
            break;
        case #"hash_d79f98d6ba6dd9de":
            var_83cb6d50fa2daf87 = 1;
            namespace_d7fe36703a9572fe::deletespawncamera();
            break;
        case #"hash_315ca762a236ee4b":
            var_83cb6d50fa2daf87 = 1;
            namespace_d7fe36703a9572fe::deletespawncamera();
            break;
        case #"hash_e73d5cfa4614c287":
            var_83cb6d50fa2daf87 = 1;
            namespace_d7fe36703a9572fe::deletespawncamera();
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
            /#
                assertmsg("Tac Ops Map Internal Error -- Unknown End Condition");
            #/
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

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dfe
// Size: 0x2f
function checkformatchend() {
    self endon("stop_spawnselection_afk");
    self endon("disconnect");
    while (!istrue(level.gameended)) {
        waitframe();
    }
    self setclientomnvar("ui_tac_ops_map_open", 0);
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e34
// Size: 0x4f
function watchforafk() {
    self endon("disconnect");
    self endon("stop_spawnselection_afk");
    if (isdefined(level.spawnselectionafktime)) {
        wait(level.spawnselectionafktime);
    } else {
        wait(60);
    }
    self notify("afk_disconnection_imminent");
    wait(1);
    kick(self getentitynumber(), "EXE/PLAYERKICKED_INACTIVE", 1);
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e8a
// Size: 0x109
function selectiondelaymessaging(timeuntilspawn) {
    self endon("disconnect");
    self.canprocessselection = 0;
    if (getgametype() == "arm" || getgametype() == "conflict" || getgametype() == "risk" || getgametype() == "gwbomb" || getgametype() == "bigctf") {
        self setclientomnvar("ui_tom_respawnTimerActive", 1);
    }
    if (timeuntilspawn > 0) {
        wait(timeuntilspawn);
    }
    if (getgametype() == "arm" || getgametype() == "conflict" || getgametype() == "risk" || getgametype() == "gwbomb" || getgametype() == "bigctf") {
        self setclientomnvar("ui_tom_respawnTimerActive", 0);
    }
    namespace_58fb4f2e73fd41a0::setlowermessageomnvar("select_spawn");
    self.canprocessselection = 1;
    if (isdefined(self.selectedspawnarea)) {
        validateselectedspawnarea();
    }
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f9a
// Size: 0x7b
function validateselectedspawnarea() {
    foreach (loc in level.availablespawnlocations[self.team]) {
        if (loc == self.selectedspawnarea) {
            self notify("tac_ops_map_selection_made");
            return;
        }
    }
    self.selectedspawnarea = undefined;
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x401c
// Size: 0x476
function selectionmade() {
    self endon("disconnect");
    self endon("tac_ops_map_selection_valid");
    while (1) {
        var_84d6164f2a6eb8da = message = self waittill("luinotifyserver");
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
                var_3cab94f850a2511f = getsquadspawnlocations(self.team, self.var_ff97225579de16a);
                foreach (loc in var_3cab94f850a2511f) {
                    if (isdefined(loc.dynamicent) && loc.dynamicent getentitynumber() == var_84d6164f2a6eb8da) {
                        if (loc.dynamicent.team != self.team || loc.dynamicent.var_ff97225579de16a != self.var_ff97225579de16a) {
                            thread refreshplayerspawnareaomnvars();
                            /#
                                assertmsg("Attemped to spawn on someone who isn't on your squad:" + "
self.team           = " + self.team + "
self.sessionsquadid     = " + self.var_ff97225579de16a + "
loc.dynamicEnt.team = " + loc.dynamicent + "
loc.dynamicEnt.sessionsquadid = " + loc.dynamicent.var_ff97225579de16a);
                            #/
                            break;
                        }
                        if (issquadmateindanger(loc.dynamicent)) {
                            break;
                        }
                        vehicle = loc.dynamicent.vehicle;
                        if (isdefined(vehicle)) {
                            if (vehicle_occupancy_getavailablevehicleseats(vehicle).size == 0 || !istrue(namespace_141c4634b6ea7b27::vehicle_interact_vehiclecanbeused(vehicle))) {
                                break;
                            }
                        }
                        spawninfo = spawnstruct();
                        spawninfo = namespace_90f75d3fdf89a43e::capsulepass(spawninfo, loc.dynamicent);
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

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4499
// Size: 0x111
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

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45b2
// Size: 0x77
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

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4631
// Size: 0x3b
function endconditionwatcher_selectionmade() {
    self endon("disconnect");
    self endon("tac_ops_end_condition_met");
    self notify("endConditionWatcher_SelectionMade()");
    self endon("endConditionWatcher_SelectionMade()");
    while (1) {
        self waittill("tac_ops_map_selection_made");
        self notify("tac_ops_map_selection_valid");
        break;
    }
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4673
// Size: 0x340
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
        var_3cab94f850a2511f = getsquadspawnlocations(self.team, self.var_ff97225579de16a);
        foreach (loc in var_3cab94f850a2511f) {
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
        thread namespace_d7fe36703a9572fe::movetospawncamera(0);
    }
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49ba
// Size: 0x48
function keepstreamposfresh(origin) {
    self endon("disconnect");
    self endon("tac_ops_map_selection_valid");
    self endon("spawned_player");
    self notify("keepStreamPosFresh");
    self endon("keepStreamPosFresh");
    while (1) {
        self function_bc667001f9dd3808(origin, 1);
        wait(1);
    }
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a09
// Size: 0x30
function endconditionwatcher_gameended() {
    self endon("disconnect");
    self endon("tac_ops_end_condition_met");
    self notify("endConditionWatcher_GameEnded()");
    self endon("endConditionWatcher_GameEnded()");
    level waittill("game_ended");
    self notify("tac_ops_map_game_ended");
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a40
// Size: 0x30
function endconditionwatcher_mapcleared() {
    self endon("disconnect");
    self endon("tac_ops_end_condition_met");
    self notify("endConditionWatcher_MapCleared()");
    self endon("endConditionWatcher_MapCleared()");
    level waittill("tac_ops_map_cleared");
    self notify("tac_ops_map_cleared");
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a77
// Size: 0x30
function endconditionwatcher_mapchanged() {
    self endon("disconnect");
    self endon("tac_ops_end_condition_met");
    self notify("endConditionWatcher_MapChanged()");
    self endon("endConditionWatcher_MapChanged()");
    level waittill("tac_ops_map_changed");
    self notify("tac_ops_map_changed");
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4aae
// Size: 0x30
function endconditionwatcher_nuke() {
    self endon("disconnect");
    self endon("tac_ops_end_condition_met");
    self notify("endConditionWatcher_Nuke()");
    self endon("endConditionWatcher_Nuke()");
    level waittill("nuke_detonated");
    self notify("tac_ops_map_nuke");
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ae5
// Size: 0x2c
function function_b0e57461a4af2476() {
    self endon("disconnect");
    self endon("tac_ops_map_selection_valid");
    while (self [[ level.var_d280c5fdb0036183 ]]()) {
        waitframe();
    }
    self notify("tac_ops_map_no_valid_selections");
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b18
// Size: 0x47
function spawnselectionshutdown_nuke() {
    if (!istrue(self.inspawnselection)) {
        return;
    }
    self visionsetnakedforplayer("nuke_global_aftermath", 0.05);
    wait(2);
    if (!istrue(self.inspawnselection)) {
        return;
    }
    self visionsetnakedforplayer("flir_0_black_to_white_heavy_damage", 0.05);
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b66
// Size: 0x11c
function adddynamicspawnarea(team, ent, ref, offset) {
    if (isdefined(level.spawnselectionlocations[ref]) && isdefined(level.spawnselectionlocations[ref][team])) {
        var_7bf80d7ff1d68a01 = level.spawnselectionlocations[ref][team];
        var_7bf80d7ff1d68a01.origin = ent.origin + ter_op(isdefined(offset), offset, (0, 0, 0));
        var_7bf80d7ff1d68a01.angles = ent.angles;
    } else {
        var_7bf80d7ff1d68a01 = spawnstruct();
        var_7bf80d7ff1d68a01.origin = ent.origin + ter_op(isdefined(offset), offset, (0, 0, 0));
        var_7bf80d7ff1d68a01.angles = ent.angles;
        var_7bf80d7ff1d68a01.dynamicent = ent;
        var_7bf80d7ff1d68a01.script_noteworthy = ref;
        initspawnarea(team, var_7bf80d7ff1d68a01, ref);
        updatespawnareas();
    }
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c89
// Size: 0x65
function removedynamicspawnarea(team, ref) {
    if (isdefined(level.spawnselectionlocations[ref]) && isdefined(level.spawnselectionlocations[ref][team])) {
        level.spawnselectionlocations[ref][team] = undefined;
        if (level.spawnselectionlocations[ref].size == 0) {
            level.spawnselectionlocations[ref] = undefined;
        }
    }
    updatespawnareas();
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cf5
// Size: 0x5f
function getsquadspawnlocations(team, squadindex) {
    locations = [];
    if (isdefined(level.squadspawnselectionlocations) && isdefined(level.squadspawnselectionlocations[team]) && isdefined(level.squadspawnselectionlocations[team][squadindex])) {
        locations = level.squadspawnselectionlocations[team][squadindex];
    }
    return locations;
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d5c
// Size: 0x16a
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
        var_7bf80d7ff1d68a01 = level.squadspawnselectionlocations[team][squad][ref];
        var_7bf80d7ff1d68a01.typeref = ref;
        var_7bf80d7ff1d68a01.origin = ent.origin;
        var_7bf80d7ff1d68a01.angles = ent.angles;
        var_7bf80d7ff1d68a01.dynamicent = ent;
    } else {
        if (!isdefined(ent)) {
            return;
        }
        var_7bf80d7ff1d68a01 = spawnstruct();
        var_7bf80d7ff1d68a01.typeref = ref;
        var_7bf80d7ff1d68a01.origin = ent.origin;
        var_7bf80d7ff1d68a01.angles = ent.angles;
        var_7bf80d7ff1d68a01.dynamicent = ent;
        level.squadspawnselectionlocations[team][squad][ref] = var_7bf80d7ff1d68a01;
    }
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ecd
// Size: 0x37
function removespawnareaondeathdisconnect(team, ref) {
    self endon("tac_ops_end_condition_met");
    adddynamicspawnarea(team, self, ref);
    self waittill("death_or_disconnect");
    thread addspawnareaonspawn(team, ref);
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f0b
// Size: 0x3d
function addspawnareaonspawn(team, ref) {
    self endon("tac_ops_end_condition_met");
    removedynamicspawnarea(team, ref);
    self endon("disconnect");
    self waittill("spawned_player");
    thread removespawnareaondeathdisconnect(team, ref);
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f4f
// Size: 0x9c
function function_360feec64890e6f1() {
    self endon("disconnect");
    self endon("end_respawn");
    self endon("tacInsert_destroyed");
    self.var_eaea86358d19ed20 = 1;
    var_f148fcd88267d96e = int(level.tispawndelay);
    self setclientomnvar("ui_tom_ti_respawnTimer", gettime() + var_f148fcd88267d96e * 1000);
    while (1) {
        var_f148fcd88267d96e = clamp(var_f148fcd88267d96e, 0, level.tispawndelay);
        if (var_f148fcd88267d96e == 0) {
            self setclientomnvar("ui_tom_ti_respawnTimer", 0);
            self.var_eaea86358d19ed20 = 0;
            return;
        } else {
            var_f148fcd88267d96e = var_f148fcd88267d96e - level.framedurationseconds;
        }
        waitframe();
    }
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ff2
// Size: 0x121
function function_7de3f8f504024fde() {
    if (!isdefined(self.setspawnpoint)) {
        return;
    }
    self endon("disconnect");
    self endon("end_respawn");
    self notify("evaluateTISpawn");
    self endon("evaluateTISpawn");
    startindex = level.availablespawnlocations[self.team].size;
    var_221d2a4479c093b6 = startindex + 4;
    var_b0b3efd85f274c12 = spawnstruct();
    var_b0b3efd85f274c12.entity = self.setspawnpoint;
    var_b0b3efd85f274c12.id = tablelookuprownum("mp/spawnSelectionMapData.csv", 0, "tac_insert");
    if (!istrue(self.var_eaea86358d19ed20)) {
        thread function_360feec64890e6f1();
    }
    while (1) {
        if (!isdefined(self.setspawnpoint)) {
            self setclientomnvar("ui_tom_spawn_id_" + var_221d2a4479c093b6, -1);
            self setclientomnvar("ui_tom_spawn_entity_" + var_221d2a4479c093b6, undefined);
            refreshplayerspawnareaomnvars();
            return;
        }
        self setclientomnvar("ui_tom_spawn_id_" + var_221d2a4479c093b6, var_b0b3efd85f274c12.id);
        self setclientomnvar("ui_tom_spawn_entity_" + var_221d2a4479c093b6, var_b0b3efd85f274c12.entity);
        waitframe();
    }
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x511a
// Size: 0x57e
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
    var_72e07b77470f32d9 = tablelookuprownum("mp/spawnSelectionMapData.csv", 0, "squad_leader");
    var_5966e8a05a4d1903 = [];
    for (i = 0; i < 4; i++) {
        data = spawnstruct();
        data.guid = undefined;
        data.entity = undefined;
        data.idmask = undefined;
        var_5966e8a05a4d1903[i] = data;
    }
    var_4da35154d6d43593 = [];
    for (i = 0; i < 4; i++) {
        var_4da35154d6d43593[i] = "squad_" + i;
    }
    while (1) {
        squadleader = namespace_ca7b90256548aa40::getsquadleader(self.team, self.var_ff97225579de16a);
        players = level.squaddata[self.team][self.var_ff97225579de16a].players;
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
            ref = var_4da35154d6d43593[i];
            updatesquadspawn(self.team, self.var_ff97225579de16a, ref, player);
        }
        locations = getsquadspawnlocations(self.team, self.var_ff97225579de16a);
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
            ref = var_4da35154d6d43593[i];
            selected = locations[ref];
            var_d059a36c2835b580 = isdefined(player) && isdefined(player.vehicle) && istrue(player.vehicle.israllypointvehicle);
            if (isdefined(player) && self != player && issquadspawnable(player) && !istrue(var_d059a36c2835b580)) {
                indanger = istrue(player.indanger);
                idmask = typeid[i];
                if (indanger) {
                    idmask = idmask + 128;
                }
                if (issquadleader) {
                    idmask = idmask + 256;
                }
                if (isdefined(player.vehicle)) {
                    idmask = idmask + 512;
                    if (vehicle_occupancy_getavailablevehicleseats(player.vehicle).size == 0 || !istrue(namespace_141c4634b6ea7b27::vehicle_interact_vehiclecanbeused(player.vehicle))) {
                        idmask = idmask + 1024;
                    }
                    if (player.vehicle.vehiclename == "little_bird" || player.vehicle.vehiclename == "little_bird_mg") {
                        idmask = idmask + 4096;
                    }
                }
                idmask = idmask + (player.var_3f78c6a0862f9e25 << 13);
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
            } else {
                if (isdefined(var_5966e8a05a4d1903[i].entity)) {
                    var_5966e8a05a4d1903[i].entity = undefined;
                    self setclientomnvar("ui_tom_spawn_entity_" + startindex + i, undefined);
                }
                if (isdefined(var_5966e8a05a4d1903[i].idmask) && var_5966e8a05a4d1903[i].idmask != -1) {
                    var_5966e8a05a4d1903[i].idmask = -1;
                    self setclientomnvar("ui_tom_spawn_id_" + startindex + i, -1);
                }
            }
        }
        waitframe();
    }
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x569f
// Size: 0x50e
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
    var_33c2a141ebc8f7ae = gettime();
    selectionmade = 0;
    while (!selectionmade) {
        currenttime = gettime();
        spawndelay = (var_33c2a141ebc8f7ae + timeuntilspawn * 1000 - currenttime) / 1000;
        switch (respawntype) {
        case 0:
            self.squadspawnconfirmed = 0;
            self.squadspawnaborted = 0;
            if (!isai(self)) {
                thread handlesquadspawnabort();
            }
            if (!spawnedasspectator) {
                thread namespace_99ac021a7547cae3::respawn_asspectator(self.origin + (0, 0, 60), self.angles);
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
            thread namespace_d7fe36703a9572fe::startspawncamera();
            var_7f011a0a8adbdf3d = thread namespace_d7fe36703a9572fe::getspawncamerawaittime();
            if (!isdefined(var_7f011a0a8adbdf3d)) {
                var_7f011a0a8adbdf3d = 0;
            }
            if (istrue(level.usec130spawnfirstonly)) {
                self.spawnedusingc130 = 1;
            }
            spawntoc130();
            selectionmade = 1;
            break;
        case 2:
            var_6109158034da3fe9 = gameflag("infil_will_run") && !istrue(gameflag("infil_started"));
            if ((getgametype() == "arm" || getgametype() == "conflict" || getgametype() == "risk" || getgametype() == "bigctf") && !var_6109158034da3fe9 && !gameflag("prematch_done")) {
                var_c2106fa614419d22 = [[ level.var_e637d49948a038d3 ]](self.team);
                var_5940f376a254619d = spawn("script_model", var_c2106fa614419d22.startorigin);
                var_5940f376a254619d setmodel("tag_origin");
                var_5940f376a254619d.angles = var_c2106fa614419d22.startangles;
                self cameralinkto(var_5940f376a254619d, "tag_origin");
                var_5940f376a254619d moveto(var_c2106fa614419d22.endorigin, 18);
                var_5940f376a254619d rotateto(var_c2106fa614419d22.endangles, 18);
                gameflagwait("prematch_done");
                self cameraunlink();
                self.spawncameratime = 0.5;
                thread namespace_d7fe36703a9572fe::startspawncamera(0, 0.5, 0.5);
            } else {
                self.spawncameratime = 0.5;
                thread namespace_d7fe36703a9572fe::startspawncamera(0, 0.5, 0.5);
            }
            var_7f011a0a8adbdf3d = thread namespace_d7fe36703a9572fe::getspawncamerawaittime();
            if (!isdefined(var_7f011a0a8adbdf3d)) {
                var_7f011a0a8adbdf3d = 0;
            }
            waitforspawnselection(spawndelay + var_7f011a0a8adbdf3d);
            if (isdefined(self.selectedspawnarea)) {
                selectionmade = 1;
            }
            break;
        case 3:
            thread namespace_d7fe36703a9572fe::startspawncamera();
            var_7f011a0a8adbdf3d = thread namespace_d7fe36703a9572fe::getspawncamerawaittime();
            if (!isdefined(var_7f011a0a8adbdf3d)) {
                var_7f011a0a8adbdf3d = 0;
            }
            timeuntilspawnmessaging(spawndelay + var_7f011a0a8adbdf3d, "waiting_to_spawn");
            selectionmade = 1;
            break;
        }
    }
    if (needsbuttontorespawn()) {
        if (!istrue(self.waitingtoselectclass)) {
            namespace_58fb4f2e73fd41a0::setlowermessageomnvar("press_to_spawn");
        }
        if (!spawnedasspectator) {
            thread namespace_99ac021a7547cae3::respawn_asspectator(self.origin + (0, 0, 60), self.angles);
        }
        spawnedasspectator = 1;
        waitrespawnbutton();
    }
    thread namespace_d7fe36703a9572fe::endspawncamera();
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5bb4
// Size: 0x50
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

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c0b
// Size: 0xb1
function handlesquadspawncycle() {
    self endon("disconnect");
    self endon("end_respawn");
    self endon("squad_spawn_abort");
    self notify("handleSquadSpawnCycle");
    self endon("handleSquadSpawnCycle");
    self notifyonplayercommand("cyclePos", "+gostand");
    while (1) {
        result = waittill_any_return_2("cyclePos", "cycleNeg");
        if (isdefined(result)) {
            current = self getspectatingplayer();
            if (result == "cyclePos") {
                thread cyclevalidsquadspectate(current.var_3f78c6a0862f9e25, 1);
            } else if (result == "cycleNeg") {
                thread cyclevalidsquadspectate(current.var_3f78c6a0862f9e25, 0);
            }
        }
    }
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5cc3
// Size: 0x55
function handlesquadspawnconfirm(timeuntilspawn) {
    self endon("disconnect");
    self endon("end_respawn");
    self endon("squad_spawn_abort");
    timeuntilspawnmessaging(timeuntilspawn, "waiting_to_spawn");
    namespace_58fb4f2e73fd41a0::setlowermessageomnvar("squad_spawn");
    self notifyonplayercommand("respawn_confirm", "+usereload");
    self waittill("respawn_confirm");
    return 1;
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d20
// Size: 0xed
function cyclevalidsquadspectate(startindex, var_9fc5fbeae7221fb6) {
    self endon("disconnect");
    self endon("end_respawn");
    self endon("squad_spawn_abort");
    self notify("cycleValidSquadSpectate");
    self endon("cycleValidSquadSpectate");
    players = level.squaddata[self.team][self.var_ff97225579de16a].players;
    var_39d4bb9b710ffd49 = startindex;
    step = ter_op(var_9fc5fbeae7221fb6, 1, -1);
    for (i = 0; i < players.size; i++) {
        if (iscurrentspectatetarget(players[var_39d4bb9b710ffd49]) || !issquadspawnable(players[var_39d4bb9b710ffd49])) {
            var_39d4bb9b710ffd49 = var_39d4bb9b710ffd49 + step;
            if (var_39d4bb9b710ffd49 == players.size) {
                var_39d4bb9b710ffd49 = 0;
            }
            if (var_39d4bb9b710ffd49 == -1) {
                var_39d4bb9b710ffd49 = players.size - 1;
            }
        } else {
            thread monitorsquadspectator(players[var_39d4bb9b710ffd49]);
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e15
// Size: 0x36
function iscurrentspectatetarget(player) {
    if (!isdefined(self.forcespectatorclient)) {
        return 0;
    }
    var_279bb6642ec5e695 = self getspectatingplayer();
    if (!isdefined(var_279bb6642ec5e695)) {
        return 0;
    }
    return player == var_279bb6642ec5e695;
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e53
// Size: 0x49
function issquadspawnable(player) {
    if (!isdefined(player)) {
        return 0;
    }
    if (!isreallyalive(player)) {
        return 0;
    }
    if (istrue(player.inspawncamera)) {
        return 0;
    }
    if (player isskydiving()) {
        return 0;
    }
    if (player isusingremote()) {
        return 0;
    }
    return 1;
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ea4
// Size: 0x28
function isplayerindanger_think() {
    thread internal_isplayerindanger_think();
    if (getdvarint(@"hash_99a922188ec4750f", 0) == 1) {
        thread namespace_90f75d3fdf89a43e::squadspawndebug();
    }
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ed3
// Size: 0x34
function internal_isplayerindanger_think() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (1) {
        if (issquadspawnable(self)) {
            self.indanger = issquadmateindanger(self);
        }
        waitframe();
    }
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f0e
// Size: 0x220
function issquadmateindanger(player) {
    currenttime = gettime();
    if (isdefined(player) && isdefined(player.pers["lastDamageTime"]) && player.pers["lastDamageTime"] + 5000 > currenttime || isdefined(player.lasttimedamaged) && player.lasttimedamaged + 5000 > currenttime) {
        return 1;
    }
    if (player isonladder()) {
        return 1;
    }
    player namespace_25c5a6f43bb97b43::validaterecentattackers();
    if (isdefined(player.recentattackers) && player.recentattackers.size > 0) {
        return 1;
    }
    if (isdefined(player.lastweaponfiretimestart) && player.lastweaponfiretimestart + 3000 > currenttime) {
        return 1;
    }
    if (isdefined(player.lastweaponfiretimestart) && isdefined(player.lastweaponfiretimeend) && player.lastweaponfiretimestart > player.lastweaponfiretimeend || isdefined(player.lastweaponfiretimestart) && !isdefined(player.lastweaponfiretimeend)) {
        return 1;
    }
    var_f2e473b17ca70265 = player getclosestenemy(384, 100, 1);
    if (isdefined(var_f2e473b17ca70265)) {
        return 1;
    }
    if (isdefined(player.vehicle)) {
        if (istrue(player.vehicle.burningdown)) {
            return 1;
        }
        if (istrue(namespace_d325722f2754c2c4::islockedonto(player.vehicle))) {
            return 1;
        }
    }
    if (isdefined(player) && player namespace_d9c77dc2a6fe29c6::istouchingoobtrigger()) {
        return 1;
    }
    if (getdvarint(@"hash_3728c11e46ec4b26", 0) == 1) {
        bucket = player getspawnbucketforplayer(1, player.origin);
        bucket = namespace_b2d5aa2baf2b5701::getspawnbucketfromstring(bucket);
        if (bucket >= 2) {
            return 1;
        }
    }
    if (isdefined(player) && isdefined(player.nogroundfoundtime) && player.nogroundfoundtime + 1000 > currenttime) {
        return 1;
    }
    return 0;
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6136
// Size: 0x103
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

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6240
// Size: 0x101
function spawntoc130() {
    self endon("disconnect");
    while (istrue(level.usec130spawn) && !isdefined(level.spawnc130)) {
        waitframe();
    }
    if (!istrue(level.usec130spawn) || !isdefined(level.spawnc130[self.team])) {
        wait(1.5);
        return;
    }
    if (!istrue(level.usec130spawnfirstonly) && isdefined(level.timeuntilnextc130) && level.timeuntilnextc130[self.team] - gettime() <= (level.flighttime + level.timebetweenc130passes) * 1000) {
        namespace_58fb4f2e73fd41a0::setlowermessageomnvar("waiting_for_c130", int(level.timeuntilnextc130[self.team]));
    } else {
        namespace_58fb4f2e73fd41a0::setlowermessageomnvar("clear_lower_msg");
    }
    thread namespace_35f66e61f847336c::spawnplayertoc130();
    if (isdefined(level.spawnc130[self.team])) {
        self waittill("c130_ready");
    }
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6348
// Size: 0x69
function needsbuttontorespawn() {
    if (namespace_775507ba36294dfb::gettweakablevalue("player", "forcerespawn") != 0) {
        return 0;
    }
    if (!self.hasspawned) {
        return 0;
    }
    wavebased = getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_waverespawndelay")) > 0;
    if (wavebased) {
        return 0;
    }
    if (self.wantsafespawn) {
        return 0;
    }
    return 1;
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63b9
// Size: 0x2b
function waitrespawnbutton() {
    self endon("disconnect");
    self endon("end_respawn");
    while (1) {
        if (self usebuttonpressed()) {
            break;
        }
        wait(0.05);
    }
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63eb
// Size: 0x52
function timeuntilspawnmessaging(timeuntilspawn, reason) {
    self endon("disconnect");
    if (timeuntilspawn > 0) {
        if (!isdefined(reason)) {
            reason = "waiting_to_spawn";
        }
        namespace_58fb4f2e73fd41a0::setlowermessageomnvar(reason, int(gettime() + timeuntilspawn * 1000));
        waittill_any_timeout_no_endon_death_1(timeuntilspawn, "force_spawn");
    }
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6444
// Size: 0x2a9
function managesquadcameraposition(ref) {
    self endon("disconnect");
    self endon("end_respawn");
    self endon("tac_ops_spawn_focus_changed");
    self notify("manageSquadCameraPosition");
    self endon("manageSquadCameraPosition");
    index = undefined;
    if (ref == "squad_leader") {
        index = level.squaddata[self.team][self.var_ff97225579de16a].squadleader.var_3f78c6a0862f9e25;
    } else {
        index = int(getsubstr(ref, ref.size - 1, ref.size));
    }
    var_356a015aa1975023 = undefined;
    if (isdefined(level.squaddata[self.team]) && isdefined(level.squaddata[self.team][self.var_ff97225579de16a]) && isdefined(level.squaddata[self.team][self.var_ff97225579de16a].players[index])) {
        var_356a015aa1975023 = level.squaddata[self.team][self.var_ff97225579de16a].players[index];
    }
    forward = level.spawnselectionteamforward[self.team];
    while (isdefined(self.spawncameraent) && isdefined(var_356a015aa1975023)) {
        goalposition = [];
        goalangles = [];
        if (istrue(level.usestaticspawnselectioncamera)) {
            temp = namespace_8e28f8b325a83325::getstaticcameraposition(self.team);
            goalposition = temp.origin;
            goalangles = temp.angles;
        } else {
            heightoffset = 7000;
            if (istrue(level.useunifiedspawnselectioncameraheight)) {
                heightoffset = function_87bbbee0bbf27304();
            }
            goalposition = var_356a015aa1975023.origin + forward * -8500 + (0, 0, heightoffset);
            var_67794ff6e49c4961 = vectornormalize(var_356a015aa1975023.origin - goalposition);
            goalangles = vectortoanglessafe(var_67794ff6e49c4961, (0, 0, 1));
            goalposition = goalposition + [[ level.var_3c89983e2030dfff ]](self.team, var_356a015aa1975023.origin);
        }
        self.spawncameratargetpos = goalposition;
        self.spawncameratargetang = goalangles;
        self.spawncameraent moveto(goalposition, 0.25, 0.05, 0.2);
        self.spawncameraent rotateto(goalangles, 0.25, 0.05, 0.2);
        waitframe();
    }
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66f4
// Size: 0x2e5
function managevehiclecameraposition(ref) {
    self endon("disconnect");
    self endon("end_respawn");
    self endon("tac_ops_spawn_focus_changed");
    self notify("manageVehicleCameraPosition");
    self endon("manageVehicleCameraPosition");
    index = int(getsubstr(ref, ref.size - 1, ref.size));
    var_a5d118f040f60db0 = level.spawnselectionlocations[ref][self.team].dynamicent;
    forward = level.spawnselectionteamforward[self.team];
    var_ff816c44d164cac1 = 0;
    while (isdefined(self.spawncameraent) && isdefined(var_a5d118f040f60db0) && !istrue(var_a5d118f040f60db0.isdestroyed)) {
        goalposition = [];
        goalangles = [];
        if (istrue(level.usestaticspawnselectioncamera)) {
            temp = namespace_8e28f8b325a83325::getstaticcameraposition(self.team);
            goalposition = temp.origin;
            goalangles = temp.angles;
        } else {
            heightoffset = 7000;
            if (istrue(level.useunifiedspawnselectioncameraheight)) {
                heightoffset = function_87bbbee0bbf27304();
            }
            goalposition = var_a5d118f040f60db0.origin + forward * -8500 + (0, 0, heightoffset);
            groundpos = level.spawnselectionlocations[ref][self.team].anchorentity.origin;
            camerapos = groundpos + forward * -8500 + (0, 0, heightoffset);
            var_6d399a908d913b0b = vectornormalize(groundpos - camerapos);
            goalangles = vectortoanglessafe(var_6d399a908d913b0b, (0, 0, 1));
            goalposition = goalposition + [[ level.var_3c89983e2030dfff ]](self.team, groundpos);
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

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69e0
// Size: 0xe5
function managevehiclehealthui(ref) {
    self endon("disconnect");
    self endon("end_respawn");
    self endon("tac_ops_spawn_focus_changed");
    self notify("manageVehicleHealthUI");
    self endon("manageVehicleHealthUI");
    var_a5d118f040f60db0 = level.spawnselectionlocations[ref][self.team].dynamicent;
    self setclientomnvar("ui_tom_veh_health_percent", 0);
    waitframe();
    var_3ed7c323526c2b33 = undefined;
    while (isdefined(var_a5d118f040f60db0)) {
        var_559a0810819cf4f0 = int(clamp(var_a5d118f040f60db0.health / var_a5d118f040f60db0.maxhealth * 100, 0, 100));
        /#
            if (var_559a0810819cf4f0 < 0) {
                println("gw_fob_0");
            }
        #/
        if (!isdefined(var_3ed7c323526c2b33) || var_3ed7c323526c2b33 != var_559a0810819cf4f0) {
            self setclientomnvar("ui_tom_veh_health_percent", int(var_559a0810819cf4f0));
            var_3ed7c323526c2b33 = var_559a0810819cf4f0;
        }
        waitframe();
    }
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6acc
// Size: 0x383
function getclosestavailablespawnlocation() {
    closestdistsq = undefined;
    var_f7f7ea6e8e4c442d = undefined;
    if (!gameflag("prematch_done") && (getgametype() == "arm" || getgametype() == "conflict" || getgametype() == "bigctf") || getgametype() == "risk" || !isdefined(self.hasvisitedgwspawnselection)) {
        if (self.team == "axis" || self.team == "team_three" || self.team == "team_four") {
            var_f7f7ea6e8e4c442d = "gw_fob_axisHQ";
        } else {
            var_f7f7ea6e8e4c442d = "gw_fob_alliesHQ";
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
                    var_f7f7ea6e8e4c442d = ref;
                    break;
                }
            }
            if (!isdefined(closestdistsq) || distsq < closestdistsq) {
                closestdistsq = distsq;
                var_f7f7ea6e8e4c442d = ref;
            }
        }
        if (isdefined(level.squadspawnselectionlocations) && isdefined(level.squadspawnselectionlocations[self.team][self.var_ff97225579de16a])) {
            locations = getsquadspawnlocations(self.team, self.var_ff97225579de16a);
            foreach (loc in locations) {
                if (loc.dynamicent == self) {
                    continue;
                }
                distsq = distancesquared(self.origin, loc.dynamicent.origin);
                if (distsq < closestdistsq) {
                    closestdistsq = distsq;
                    var_f7f7ea6e8e4c442d = loc.typeref;
                }
            }
        }
    }
    /#
        if (issubstr(var_f7f7ea6e8e4c442d, "spawnSelectSquad")) {
            println("_safe_");
        }
    #/
    id = -1;
    if (isdefined(var_f7f7ea6e8e4c442d)) {
        if (!issubstr(var_f7f7ea6e8e4c442d, "squad") && !issubstr(var_f7f7ea6e8e4c442d, "vehicle") && !issubstr(var_f7f7ea6e8e4c442d, "HQ")) {
            var_ecb1ed5831deb517 = var_f7f7ea6e8e4c442d + "_" + level.localeid;
            id = tablelookuprownum("mp/spawnSelectionMapData.csv", 0, var_ecb1ed5831deb517);
        }
        if (id == -1) {
            id = tablelookuprownum("mp/spawnSelectionMapData.csv", 0, var_f7f7ea6e8e4c442d);
        }
        self setclientomnvar("ui_tom_previous_selection", id);
        self.forcedspawncameraref = var_f7f7ea6e8e4c442d;
    } else {
        self setclientomnvar("ui_tom_previous_selection", -1);
        self.forcedspawncameraref = undefined;
    }
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e56
// Size: 0x4d6
function getstaticcameraposition(team) {
    /#
        assert(isdefined(namespace_36f464722d326bbe::getlocaleid()), "Asking for static spawn selection camera when no locale has been set.");
    #/
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

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7334
// Size: 0x15f
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
            break;
        }
    } else {
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
            break;
        }
    }
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x749a
// Size: 0x10d
function updatefobindanger() {
    if (!istrue(level.usespawnselection)) {
        return;
    }
    level thread updatefobspawnsindanger();
    while (1) {
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

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75ae
// Size: 0x303
function updatefobspawnsindanger() {
    while (1) {
        foreach (team in level.teamnamelist) {
            var_f7632b4589b2bed4 = getteamdata(team, "players")[0];
            foreach (location in level.availablespawnlocations[team]) {
                if (!issubstr(location, "HQ") && issubstr(location, "fob")) {
                    var_2ebe16a8c2cafe36 = 1;
                    var_786e91448e72be = isdefined(level.spawnglobals.spawnsets[location + "_safe_" + team]);
                    var_8a0fca89b6c1a093 = location + "_" + team;
                    var_363d9492f84cd9e5 = undefined;
                    if (var_786e91448e72be) {
                        var_363d9492f84cd9e5 = location + "_safe_" + team;
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
                            var_2ebe16a8c2cafe36 = 0;
                        }
                    }
                    indanger = 0;
                    if (isdefined(var_f7632b4589b2bed4)) {
                        var_1e77bb9e18bf61a7 = undefined;
                        var_55807291c518deed = undefined;
                        if (var_2ebe16a8c2cafe36) {
                            namespace_b2d5aa2baf2b5701::activatespawnset(var_8a0fca89b6c1a093, 1);
                            var_1e77bb9e18bf61a7 = var_f7632b4589b2bed4 getspawnbucketforplayer();
                            var_1e77bb9e18bf61a7 = namespace_b2d5aa2baf2b5701::getspawnbucketfromstring(var_1e77bb9e18bf61a7);
                        }
                        if (var_786e91448e72be) {
                            namespace_b2d5aa2baf2b5701::activatespawnset(var_363d9492f84cd9e5, 1);
                            var_55807291c518deed = var_f7632b4589b2bed4 getspawnbucketforplayer();
                            var_55807291c518deed = namespace_b2d5aa2baf2b5701::getspawnbucketfromstring(var_55807291c518deed);
                        }
                        if (var_2ebe16a8c2cafe36 && var_786e91448e72be) {
                            indanger = var_1e77bb9e18bf61a7 >= 2 && var_55807291c518deed >= 2;
                        } else if (var_2ebe16a8c2cafe36 && !var_786e91448e72be) {
                            indanger = var_1e77bb9e18bf61a7 >= 2;
                        } else if (var_786e91448e72be) {
                            indanger = var_55807291c518deed >= 2;
                        }
                    }
                    objectivekey = level.spawnselectionlocations[location][team].objectivekey;
                    level.objectives[objectivekey].spawnpointdanger = indanger;
                    level.objectives[objectivekey].spawnpointdangertime = gettime();
                }
            }
        }
        wait(1);
    }
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78b8
// Size: 0x2a1
function updatespecificfobindanger(location, player, team) {
    objectivekey = level.spawnselectionlocations[location][team].objectivekey;
    if (!isdefined(objectivekey) || !isdefined(level.objectives[objectivekey]) || !isdefined(level.objectives[objectivekey].spawnpointdangertime) || level.objectives[objectivekey].spawnpointdangertime == gettime()) {
        return;
    }
    var_2ebe16a8c2cafe36 = 1;
    var_786e91448e72be = isdefined(level.spawnglobals.spawnsets[location + "_safe_" + team]);
    var_8a0fca89b6c1a093 = location + "_" + team;
    var_363d9492f84cd9e5 = undefined;
    if (var_786e91448e72be) {
        var_363d9492f84cd9e5 = location + "_safe_" + team;
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
            var_2ebe16a8c2cafe36 = 0;
        }
    }
    indanger = 0;
    if (isdefined(player)) {
        var_1e77bb9e18bf61a7 = undefined;
        var_55807291c518deed = undefined;
        if (var_2ebe16a8c2cafe36) {
            namespace_b2d5aa2baf2b5701::activatespawnset(var_8a0fca89b6c1a093, 1);
            var_1e77bb9e18bf61a7 = player getspawnbucketforplayer();
            var_1e77bb9e18bf61a7 = namespace_b2d5aa2baf2b5701::getspawnbucketfromstring(var_1e77bb9e18bf61a7);
        }
        if (var_786e91448e72be) {
            namespace_b2d5aa2baf2b5701::activatespawnset(var_363d9492f84cd9e5, 1);
            var_55807291c518deed = player getspawnbucketforplayer();
            var_55807291c518deed = namespace_b2d5aa2baf2b5701::getspawnbucketfromstring(var_55807291c518deed);
        }
        if (var_2ebe16a8c2cafe36 && var_786e91448e72be) {
            indanger = var_1e77bb9e18bf61a7 >= 2 && var_55807291c518deed >= 2;
        } else if (var_2ebe16a8c2cafe36 && !var_786e91448e72be) {
            indanger = var_1e77bb9e18bf61a7 >= 2;
        } else if (var_786e91448e72be) {
            indanger = var_55807291c518deed >= 2;
        }
    }
    level.objectives[objectivekey].spawnpointdanger = indanger;
    level.objectives[objectivekey].spawnpointdangertime = gettime();
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b60
// Size: 0x168
function vehicle_showteamtanks() {
    self endon("disconnect");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    foreach (tank in level.trackedtanks[self.team]) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(tank.spawnselectionmarker.objidnum, self);
    }
    while (self.inspawnselection) {
        waitframe();
    }
    foreach (tank in level.trackedtanks["axis"]) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(tank.spawnselectionmarker.objidnum, self);
    }
    foreach (tank in level.trackedtanks["allies"]) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(tank.spawnselectionmarker.objidnum, self);
    }
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ccf
// Size: 0x215
function function_f83711dd7546db96() {
    if (!isdefined(level.gw_objstruct) || !isdefined(level.gw_objstruct.allieshqloc) || !isdefined(level.gw_objstruct.allieshqloc.marker)) {
        return;
    }
    if (self.team == "allies") {
        if (level.var_a50b22fa98674a50) {
            namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(level.gw_objstruct.allieshqloc.marker.objidnum, self);
        } else {
            namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(level.gw_objstruct.allieshqloc.marker.objidnum, self);
        }
        if (level.var_f15becfbc1b01a1b) {
            namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(level.gw_objstruct.axishqloc.enemymarker.objidnum, self);
        } else {
            namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(level.gw_objstruct.axishqloc.enemymarker.objidnum, self);
        }
    } else {
        if (level.var_a50b22fa98674a50) {
            namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(level.gw_objstruct.axishqloc.marker.objidnum, self);
        } else {
            namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(level.gw_objstruct.axishqloc.marker.objidnum, self);
        }
        if (level.var_f15becfbc1b01a1b) {
            namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(level.gw_objstruct.allieshqloc.enemymarker.objidnum, self);
        } else {
            namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(level.gw_objstruct.allieshqloc.enemymarker.objidnum, self);
        }
    }
}

// Namespace namespace_f463d4704ecd6902/namespace_8e28f8b325a83325
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7eeb
// Size: 0x215
function function_dc659688380c4195() {
    if (!isdefined(level.gw_objstruct) || !isdefined(level.gw_objstruct.allieshqloc) || !isdefined(level.gw_objstruct.allieshqloc.marker)) {
        return;
    }
    if (self.team == "allies") {
        if (level.var_757ec02df4d678f5) {
            namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(level.gw_objstruct.allieshqloc.marker.objidnum, self);
        } else {
            namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(level.gw_objstruct.allieshqloc.marker.objidnum, self);
        }
        if (level.var_6f40c2b6970373c0) {
            namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(level.gw_objstruct.axishqloc.enemymarker.objidnum, self);
        } else {
            namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(level.gw_objstruct.axishqloc.enemymarker.objidnum, self);
        }
    } else {
        if (level.var_757ec02df4d678f5) {
            namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(level.gw_objstruct.axishqloc.marker.objidnum, self);
        } else {
            namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(level.gw_objstruct.axishqloc.marker.objidnum, self);
        }
        if (level.var_6f40c2b6970373c0) {
            namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(level.gw_objstruct.allieshqloc.enemymarker.objidnum, self);
        } else {
            namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(level.gw_objstruct.allieshqloc.enemymarker.objidnum, self);
        }
    }
}

