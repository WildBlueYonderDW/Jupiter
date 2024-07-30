#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace namespace_81810d22a17382b6;

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x634
// Size: 0x63
function init() {
    level.activetargetmarkergroups = [];
    if (issharedfuncdefined("game", "registerOnPlayerSpawnCallback")) {
        [[ getsharedfunc("game", "registerOnPlayerSpawnCallback") ]](&targetmarkergroup_clearcacheonspawn);
    }
    registersharedfunc("game", "targetMarkerGroup_off", &targetmarkergroup_off);
    registersharedfunc("game", "targetMarkerGroup_on", &targetmarkergroup_on);
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69f
// Size: 0xd0
function targetmarkergroup_on(var_21323aee11762c98, showto, tomark, groupowner, friendlymarker, markonspawn, var_262f4b55aa151de1) {
    if (level.activetargetmarkergroups.size >= 50) {
        assertmsg("targetMarkerGroup_on: There are too many active target marker groups.  Please remove some before adding more.");
        return;
    }
    if (targetmarkergroup_getownedgroups(groupowner) >= 2) {
        assertmsg("targetMarkerGroup_on: Owner already has too many active groups.  Please turn off a group before adding a new one.");
        return;
    }
    var_6d7ef76a3761f0f8 = createtargetmarkergroup(var_21323aee11762c98);
    if (!isdefined(var_6d7ef76a3761f0f8)) {
        assertmsg("targetMarkerGroup_on: Can't create target marker group.  Marker Group ID invalid!");
        return;
    } else if (targetmarkergroupexists(var_6d7ef76a3761f0f8)) {
        assertmsg("targetMarkerGroup_on: Can't create target marker group.  Marker Group ID: " + var_6d7ef76a3761f0f8 + " already exists!");
        return;
    }
    addtargetmarkergroup(var_6d7ef76a3761f0f8, showto, tomark, groupowner, friendlymarker, markonspawn, var_262f4b55aa151de1);
    return var_6d7ef76a3761f0f8;
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x778
// Size: 0x3b
function targetmarkergroup_off(var_4226c12910d867d4) {
    if (!targetmarkergroupexists(var_4226c12910d867d4)) {
        assertmsg("Trying to remove invalid target marker group ID: " + var_4226c12910d867d4 + " ");
        return;
    }
    removetargetmarkergroup(var_4226c12910d867d4);
    deletetargetmarkergroup(var_4226c12910d867d4);
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bb
// Size: 0x7d
function function_32fdc90fc744999f(ent) {
    var_729ee1cfdbe2c06e = 0;
    foreach (markergroup in level.activetargetmarkergroups) {
        if (array_contains(markergroup.showntoents, ent)) {
            var_729ee1cfdbe2c06e++;
        }
    }
    return var_729ee1cfdbe2c06e;
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x841
// Size: 0x97
function function_b76f204edb67efc7(var_4226c12910d867d4, showto) {
    markergroup = gettargetmarkergroup(var_4226c12910d867d4);
    assertex(isdefined(markergroup), "Tried to add clients to TargetMarkerGroup but the TMG did not exist");
    if (isdefined(showto)) {
        if (isplayer(showto)) {
            if (array_contains(markergroup.showntoents, showto)) {
                return;
            }
            if (function_32fdc90fc744999f(showto) >= 2) {
                assertmsg("addTargetMarkerGroup: Show to Entity already has too many active groups.  Please turn off a group before adding a new one.");
                return;
            }
            markergroup.showntoents[markergroup.showntoents.size] = showto;
            addclienttotargetmarkergroupmask(var_4226c12910d867d4, showto);
        }
    }
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8e0
// Size: 0xff
function function_9f84e910425d033(var_4226c12910d867d4, showto) {
    markergroup = gettargetmarkergroup(var_4226c12910d867d4);
    assertex(isdefined(markergroup), "Tried to add clients to TargetMarkerGroup but the TMG did not exist");
    assertex(isdefined(showto), "Tried to add clients to TargetMarkerGroup but list is undefined.");
    assertex(isarray(showto), "ShowTo is not an array of clients. Please adjust this before using this function.");
    foreach (var_ebcded206506e726 in showto) {
        if (isplayer(var_ebcded206506e726)) {
            if (array_contains(markergroup.showntoents, var_ebcded206506e726)) {
                continue;
            }
            if (function_32fdc90fc744999f(var_ebcded206506e726) >= 2) {
                assertmsg("addTargetMarkerGroup: Show to Entity already has too many active groups.  Please turn off a group before adding a new one.");
                continue;
            }
            markergroup.showntoents[markergroup.showntoents.size] = var_ebcded206506e726;
            addclienttotargetmarkergroupmask(var_4226c12910d867d4, var_ebcded206506e726);
        }
    }
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9e7
// Size: 0xfb
function function_adb80c80f10281f9(var_4226c12910d867d4, showto) {
    markergroup = gettargetmarkergroup(var_4226c12910d867d4);
    assertex(isdefined(markergroup), "Tried to add clients to TargetMarkerGroup but the TMG did not exist");
    if (isdefined(showto)) {
        if (isteam(showto)) {
            if (array_contains(markergroup.showntoteams, showto)) {
                return;
            }
            teaments = level.teamdata[showto]["players"];
            foreach (player in teaments) {
                if (function_32fdc90fc744999f(player) >= 2) {
                    assertmsg("addTargetMarkerGroup: Show to Entity already has too many active groups.  Please turn off a group before adding a new one.");
                    return;
                }
            }
            markergroup.showntoteams[markergroup.showntoteams.size] = showto;
            addteamtotargetmarkergroupmask(var_4226c12910d867d4, showto);
        }
    }
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xaea
// Size: 0x16c
function function_aafa0ed4a3d69b91(var_4226c12910d867d4, showto) {
    markergroup = gettargetmarkergroup(var_4226c12910d867d4);
    assertex(isdefined(markergroup), "Tried to add clients to TargetMarkerGroup but the TMG did not exist");
    assertex(isdefined(showto), "Tried to add team list to TargetMarkerGroup but ShowTo is undefined.");
    assertex(isarray(showto), "ShowTo is not an array. Please adjust this before using this function.");
    foreach (var_ebcded206506e726 in showto) {
        if (isteam(var_ebcded206506e726)) {
            if (array_contains(markergroup.showntoteams, var_ebcded206506e726)) {
                continue;
            }
            teaments = level.teamdata[var_ebcded206506e726]["players"];
            foreach (player in teaments) {
                if (function_32fdc90fc744999f(player) >= 2) {
                    assertmsg("addTargetMarkerGroup: Show to Entity already has too many active groups.  Please turn off a group before adding a new one.");
                    break;
                }
            }
            markergroup.showntoteams[markergroup.showntoteams.size] = var_ebcded206506e726;
            addteamtotargetmarkergroupmask(var_4226c12910d867d4, var_ebcded206506e726);
        }
    }
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc5e
// Size: 0x1a3
function function_fd770a1099036688(var_4226c12910d867d4, var_65f5a4e57b38d87) {
    markergroup = gettargetmarkergroup(var_4226c12910d867d4);
    assertex(isdefined(markergroup), "Tried to add clients to TargetMarkerGroup but the TMG did not exist");
    if (isdefined(var_65f5a4e57b38d87)) {
        if (isarray(var_65f5a4e57b38d87)) {
            foreach (remove in var_65f5a4e57b38d87) {
                if (isplayer(var_65f5a4e57b38d87)) {
                    if (array_contains(markergroup.showntoents, remove)) {
                        markergroup.showntoents = array_remove(markergroup.showntoents, remove);
                        removeclientfromtargetmarkergroupmask(var_4226c12910d867d4, remove);
                    }
                    continue;
                }
                if (isteam(var_65f5a4e57b38d87)) {
                    if (array_contains(markergroup.showntoteams, remove)) {
                        markergroup.showntoteams = array_remove(markergroup.showntoteams, remove);
                        removeteamfromtargetmarkergroupmask(var_4226c12910d867d4, remove);
                    }
                }
            }
            return;
        }
        if (isplayer(var_65f5a4e57b38d87)) {
            if (array_contains(markergroup.showntoents, var_65f5a4e57b38d87)) {
                markergroup.showntoents = array_remove(markergroup.showntoents, var_65f5a4e57b38d87);
                removeclientfromtargetmarkergroupmask(var_4226c12910d867d4, var_65f5a4e57b38d87);
            }
            return;
        }
        if (isteam(var_65f5a4e57b38d87)) {
            if (array_contains(markergroup.showntoteams, var_65f5a4e57b38d87)) {
                markergroup.showntoteams = array_remove(markergroup.showntoteams, var_65f5a4e57b38d87);
                removeteamfromtargetmarkergroupmask(var_4226c12910d867d4, var_65f5a4e57b38d87);
            }
        }
    }
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe09
// Size: 0x2b5
function addtargetmarkergroup(var_4226c12910d867d4, showto, tomark, groupowner, friendlymarker, markonspawn, var_262f4b55aa151de1) {
    markergroup = spawnstruct();
    markergroup.markerid = var_4226c12910d867d4;
    markergroup.markerowner = groupowner;
    markergroup.friendlymarker = friendlymarker;
    markergroup.showntoents = [];
    markergroup.showntoteams = [];
    markergroup.markedents = [];
    markergroup.markedentsinqueue = [];
    level.activetargetmarkergroups[level.activetargetmarkergroups.size] = markergroup;
    level thread targetmarkergroup_handlemarkingfromqueue(var_4226c12910d867d4);
    if (isdefined(showto)) {
        if (isarray(showto)) {
            foreach (var_ebcded206506e726 in showto) {
                if (function_32fdc90fc744999f(var_ebcded206506e726) >= 2) {
                    assertmsg("addTargetMarkerGroup: Show to Entity already has too many active groups.  Please turn off a group before adding a new one.");
                    continue;
                }
                if (isplayer(var_ebcded206506e726)) {
                    markergroup.showntoents[markergroup.showntoents.size] = var_ebcded206506e726;
                    addclienttotargetmarkergroupmask(var_4226c12910d867d4, var_ebcded206506e726);
                    continue;
                }
                if (isteam(var_ebcded206506e726)) {
                    markergroup.showntoteams[markergroup.showntoteams.size] = var_ebcded206506e726;
                    addteamtotargetmarkergroupmask(var_4226c12910d867d4, var_ebcded206506e726);
                }
            }
        } else if (isplayer(showto)) {
            markergroup.showntoents[markergroup.showntoents.size] = showto;
            addclienttotargetmarkergroupmask(var_4226c12910d867d4, showto);
        } else if (isteam(showto)) {
            markergroup.showntoteams[markergroup.showntoteams.size] = showto;
            addteamtotargetmarkergroupmask(var_4226c12910d867d4, showto);
        }
    }
    if (isdefined(tomark)) {
        if (isarray(tomark)) {
            foreach (var_caeacf76ee56d62e in tomark) {
                targetmarkergroup_markentity(var_caeacf76ee56d62e, var_4226c12910d867d4, var_262f4b55aa151de1);
            }
        } else {
            targetmarkergroup_markentity(tomark, var_4226c12910d867d4, var_262f4b55aa151de1);
        }
    }
    if (istrue(markonspawn)) {
        level thread targetmarkergroup_watchmarkonspawn(var_4226c12910d867d4, var_262f4b55aa151de1);
    }
    if (istrue(var_262f4b55aa151de1)) {
        level thread targetmarkergroup_watchfornoscopeoutlineperkset(var_4226c12910d867d4);
        level thread targetmarkergroup_watchfornoscopeoutlineperkunset(var_4226c12910d867d4);
    }
    if (function_ccf98e6391dd38b9()) {
        level thread function_78264e044be08e4d(var_4226c12910d867d4);
    }
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c6
// Size: 0xd1
function function_78264e044be08e4d(var_4226c12910d867d4) {
    level endon("game_ended");
    level endon("removed_targetMarkerGroup_" + var_4226c12910d867d4);
    while (targetmarkergroupexists(var_4226c12910d867d4)) {
        markergroup = gettargetmarkergroup(var_4226c12910d867d4);
        if (markergroup.markedentsinqueue.size > 0) {
            entnum = undefined;
            foreach (ent in markergroup.markedents) {
                entnum = ent function_74348e91568973f8();
                if (isdefined(entnum)) {
                    ent function_61a64c527b1e0c5f(markergroup);
                    wait randomfloatrange(0.1, 0.2);
                    break;
                }
            }
        }
        waitframe();
    }
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x119f
// Size: 0x32
function setnewowner(var_4226c12910d867d4, newowner) {
    tmg = gettargetmarkergroup(var_4226c12910d867d4);
    tmg.markerowner = newowner;
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11d9
// Size: 0xa8
function removetargetmarkergroup(var_4226c12910d867d4) {
    var_1bb39b6537c2fd51 = undefined;
    var_1af30f69ef1607bf = [];
    foreach (markergroup in level.activetargetmarkergroups) {
        if (markergroup.markerid == var_4226c12910d867d4) {
            var_1bb39b6537c2fd51 = markergroup;
            continue;
        }
        var_1af30f69ef1607bf[var_1af30f69ef1607bf.size] = markergroup;
    }
    if (isdefined(var_1bb39b6537c2fd51)) {
        var_1bb39b6537c2fd51 = undefined;
    }
    level.activetargetmarkergroups = var_1af30f69ef1607bf;
    level notify("removed_targetMarkerGroup_" + var_4226c12910d867d4);
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1289
// Size: 0x91
function targetmarkergroupexists(var_4226c12910d867d4) {
    groupexists = 0;
    if (!isdefined(var_4226c12910d867d4)) {
        assertmsg("targetMarkerGroupExists: Invalid target marker group id");
        return groupexists;
    }
    foreach (markergroup in level.activetargetmarkergroups) {
        if (markergroup.markerid == var_4226c12910d867d4) {
            groupexists = 1;
            break;
        }
    }
    return groupexists;
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1323
// Size: 0x90
function gettargetmarkergroup(var_4226c12910d867d4) {
    targetmarkergroup = undefined;
    if (!isdefined(var_4226c12910d867d4)) {
        assertmsg("getTargetMarkerGroup: Invalid target marker group id");
        return targetmarkergroup;
    }
    foreach (markergroup in level.activetargetmarkergroups) {
        if (markergroup.markerid == var_4226c12910d867d4) {
            targetmarkergroup = markergroup;
            break;
        }
    }
    return targetmarkergroup;
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13bc
// Size: 0x53
function targetmarkergroup_watchmarkonspawn(var_4226c12910d867d4, var_262f4b55aa151de1) {
    level endon("game_ended ");
    level endon("removed_targetMarkerGroup_" + var_4226c12910d867d4);
    while (true) {
        player = level waittill("player_spawned");
        if (canbemarkedingroup(var_4226c12910d867d4, player)) {
            targetmarkergroup_markentity(player, var_4226c12910d867d4, var_262f4b55aa151de1);
        }
    }
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1417
// Size: 0x4a
function targetmarkergroup_watchfornoscopeoutlineperkunset(var_4226c12910d867d4) {
    level endon("game_ended ");
    level endon("removed_targetMarkerGroup_" + var_4226c12910d867d4);
    while (true) {
        player = level waittill("unset_noscopeoutline");
        if (canbemarkedingroup(var_4226c12910d867d4, player)) {
            targetmarkergroup_markentity(player, var_4226c12910d867d4);
        }
    }
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1469
// Size: 0x4a
function targetmarkergroup_watchfornoscopeoutlineperkset(var_4226c12910d867d4) {
    level endon("game_ended ");
    level endon("removed_targetMarkerGroup_" + var_4226c12910d867d4);
    while (true) {
        player = level waittill("set_noscopeoutline");
        if (canbemarkedingroup(var_4226c12910d867d4, player)) {
            targetmarkergroup_unmarkentity(player, var_4226c12910d867d4);
        }
    }
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14bb
// Size: 0x88
function private function_74348e91568973f8() {
    outxuid = undefined;
    if (isdefined(self) && isent(self)) {
        if (isplayer(self) && !isbot(self)) {
            outxuid = self getxuid();
        } else if (isdefined(self.owner) && !isbot(self.owner) && isplayer(self.owner)) {
            outxuid = self.owner getxuid();
        } else {
            outxuid = self getentitynumber();
        }
    }
    return outxuid;
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x154c
// Size: 0x1dd
function targetmarkergroup_markentity(ent, var_4226c12910d867d4, var_262f4b55aa151de1) {
    markergroup = gettargetmarkergroup(var_4226c12910d867d4);
    if (!isdefined(markergroup)) {
        assertmsg("<dev string:x1c>");
        return;
    }
    entnum = ent function_74348e91568973f8();
    if (!isdefined(entnum)) {
        return;
    }
    if (markergroup.markedents.size >= 20) {
        ent targetmarkergroup_addtomarkingqueue(markergroup);
        return;
    }
    if (isdefined(ent) && isplayer(ent)) {
        if (istrue(ent.liveragdoll)) {
            return;
        }
        if (istrue(var_262f4b55aa151de1)) {
            markerowner = markergroup.markerowner;
            checkteam = isdefined(markergroup.friendlymarker);
            isfriendlymarker = istrue(markergroup.friendlymarker);
            if (checkteam) {
                if (!isfriendlymarker) {
                    if (issharedfuncdefined("perk", "hasPerk")) {
                        if (ent [[ getsharedfunc("perk", "hasPerk") ]]("specialty_noscopeoutline")) {
                            return;
                        }
                    }
                }
            } else if (issharedfuncdefined("perk", "hasPerk")) {
                if (ent [[ getsharedfunc("perk", "hasPerk") ]]("specialty_noscopeoutline")) {
                    return;
                }
            }
        }
    }
    if (!array_contains(markergroup.markedents, ent)) {
        markergroup.markedents[entnum] = ent;
        targetmarkergroupaddentity(var_4226c12910d867d4, ent);
        if (isplayer(ent)) {
            ent thread targetmarkergroup_removefromgroupaction("death", markergroup);
            ent thread targetmarkergroup_removefromgroupaction("disconnect", markergroup);
            ent thread targetmarkergroup_removefromgroupaction("joined_team", markergroup);
            ent thread targetmarkergroup_removefromgroupaction("enter_live_ragdoll", markergroup);
            return;
        }
        ent thread targetmarkergroup_removefromgroupaction("death", markergroup);
    }
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1731
// Size: 0x54
function function_61a64c527b1e0c5f(markergroup) {
    entnum = function_74348e91568973f8();
    markergroup endon("ent_removed_" + entnum);
    level endon("removed_targetMarkerGroup_" + markergroup.markerid);
    targetmarkergroup_addtomarkingqueue(markergroup);
    targetmarkergroup_unmarkentity(self, markergroup.markerid, entnum);
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x178d
// Size: 0x58
function targetmarkergroup_removefromgroupaction(action, markergroup) {
    entnum = function_74348e91568973f8();
    markergroup endon("ent_removed_" + entnum);
    level endon("removed_targetMarkerGroup_" + markergroup.markerid);
    self waittill(action);
    targetmarkergroup_unmarkentity(self, markergroup.markerid, entnum);
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ed
// Size: 0x68
function targetmarkergroup_addtomarkingqueue(markergroup) {
    if (isdefined(self) && !array_contains(markergroup.markedentsinqueue, self)) {
        markergroup.markedentsinqueue[markergroup.markedentsinqueue.size] = self;
        if (isplayer(self)) {
            thread function_38a987baf2b61673("disconnect", markergroup);
            return;
        }
        thread function_38a987baf2b61673("death", markergroup);
    }
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x185d
// Size: 0x39
function function_38a987baf2b61673(removenotify, markergroup) {
    level endon("game_ended");
    level endon("removed_targetMarkerGroup_" + markergroup.markerid);
    self waittill(removenotify);
    targetmarkergroup_removefrommarkingqueue(markergroup);
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x189e
// Size: 0x6a
function targetmarkergroup_removefrommarkingqueue(markergroup) {
    if (!isdefined(markergroup)) {
        assertmsg("<dev string:x56>");
        return;
    }
    newlist = [];
    if (isdefined(self)) {
        newlist = array_remove(markergroup.markedentsinqueue, self);
    } else {
        newlist = array_removeundefined(markergroup.markedentsinqueue);
    }
    markergroup.markedentsinqueue = newlist;
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1910
// Size: 0xbe
function targetmarkergroup_handlemarkingfromqueue(markergroupid) {
    level endon("game_ended");
    level endon("removed_targetMarkerGroup_" + markergroupid);
    while (targetmarkergroupexists(markergroupid)) {
        var_568640efc573fcce = level waittill("ent_removed_from_marker_group");
        markergroup = gettargetmarkergroup(markergroupid);
        if (!isdefined(markergroup)) {
            assertmsg("targetMarkerGroup_handleMarkingFromQueue: Marker group doesn't exist");
            break;
        }
        if (var_568640efc573fcce != markergroup) {
            continue;
        }
        if (markergroup.markedentsinqueue.size == 0) {
            continue;
        }
        enttoadd = undefined;
        if (isdefined(markergroup.markedentsinqueue[0])) {
            enttoadd = markergroup.markedentsinqueue[0];
        }
        enttoadd targetmarkergroup_removefrommarkingqueue(markergroup);
        targetmarkergroup_markentity(enttoadd, markergroupid);
    }
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19d6
// Size: 0x9a
function targetmarkergroup_unmarkentity(ent, var_4226c12910d867d4, entnumoverride) {
    entnum = ent function_74348e91568973f8();
    if (isdefined(entnumoverride)) {
        entnum = entnumoverride;
    }
    markergroup = gettargetmarkergroup(var_4226c12910d867d4);
    if (isdefined(markergroup) && isdefined(markergroup.markedents)) {
        markergroup.markedents = function_6c752e44b5090154(markergroup.markedents, ent);
        if (isdefined(ent)) {
            targetmarkergroupremoveentity(var_4226c12910d867d4, ent);
        }
        level notify("ent_removed_from_marker_group", markergroup);
        markergroup notify("ent_removed_" + entnum);
    }
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a78
// Size: 0x81
function function_6c752e44b5090154(markedents, var_a1dcb36aa55a847) {
    newarray = [];
    foreach (entnumindex, ent in markedents) {
        if (!isdefined(ent)) {
            continue;
        }
        if (isdefined(var_a1dcb36aa55a847) && var_a1dcb36aa55a847 == ent) {
            continue;
        }
        newarray[entnumindex] = ent;
    }
    return newarray;
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b02
// Size: 0x61
function function_7c253e3d43e44097(target, var_4226c12910d867d4) {
    entnum = target function_74348e91568973f8();
    markergroup = gettargetmarkergroup(var_4226c12910d867d4);
    return isdefined(markergroup) && isdefined(markergroup.markedents) && isdefined(entnum) && isdefined(markergroup.markedents[entnum]);
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b6c
// Size: 0x78
function targetmarkergroup_getownedgroups(groupowner) {
    groupcount = 0;
    foreach (markergroup in level.activetargetmarkergroups) {
        if (markergroup.markerowner == groupowner) {
            groupcount++;
        }
    }
    return groupcount;
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bed
// Size: 0x13
function targetmarkergroup_clearcacheonspawn() {
    self setclientomnvar("ui_clear_target_markers", gettime());
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c08
// Size: 0x6f
function isteam(showto) {
    if (showto == "spectator") {
        return true;
    }
    foreach (teamname in level.teamnamelist) {
        if (showto == teamname) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c80
// Size: 0xe1
function canbemarkedingroup(var_4226c12910d867d4, ent) {
    canbemarked = 0;
    markergroup = gettargetmarkergroup(var_4226c12910d867d4);
    var_5104555d72c8c295 = markergroup.markerowner;
    checkteam = istrue(level.teambased);
    isfriendlymarker = istrue(markergroup.friendlymarker);
    if (!isdefined(var_5104555d72c8c295)) {
        return canbemarked;
    }
    if (checkteam) {
        if (isfriendlymarker) {
            if (ent.team == var_5104555d72c8c295.team) {
                canbemarked = 1;
            }
        } else if (ent.team != var_5104555d72c8c295.team) {
            canbemarked = 1;
        }
    } else if (isfriendlymarker) {
        if (ent == var_5104555d72c8c295) {
            canbemarked = 1;
        }
    } else if (ent != var_5104555d72c8c295) {
        canbemarked = 1;
    }
    return canbemarked;
}

