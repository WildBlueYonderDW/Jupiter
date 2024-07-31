#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace namespace_81810d22a17382b6;

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x244
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
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x2af
// Size: 0xd1
function targetmarkergroup_on(var_21323aee11762c98, showto, tomark, groupowner, friendlymarker, markonspawn, var_262f4b55aa151de1) {
    if (level.activetargetmarkergroups.size >= 50) {
        assertmsg("<dev string:x1c>");
        return;
    }
    if (targetmarkergroup_getownedgroups(groupowner) >= 2) {
        assertmsg("<dev string:x8d>");
        return;
    }
    var_6d7ef76a3761f0f8 = createtargetmarkergroup(var_21323aee11762c98);
    if (!isdefined(var_6d7ef76a3761f0f8)) {
        assertmsg("<dev string:x102>");
        return;
    } else if (targetmarkergroupexists(var_6d7ef76a3761f0f8)) {
        assertmsg("<dev string:x157>" + var_6d7ef76a3761f0f8 + "<dev string:x1a5>");
        return;
    }
    addtargetmarkergroup(var_6d7ef76a3761f0f8, showto, tomark, groupowner, friendlymarker, markonspawn, var_262f4b55aa151de1);
    return var_6d7ef76a3761f0f8;
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x389
// Size: 0x3b
function targetmarkergroup_off(var_4226c12910d867d4) {
    if (!targetmarkergroupexists(var_4226c12910d867d4)) {
        assertmsg("<dev string:x1b9>" + var_4226c12910d867d4 + "<dev string:x1ee>");
        return;
    }
    removetargetmarkergroup(var_4226c12910d867d4);
    deletetargetmarkergroup(var_4226c12910d867d4);
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3cc
// Size: 0x7b
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
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x450
// Size: 0x98
function function_b76f204edb67efc7(var_4226c12910d867d4, showto) {
    markergroup = gettargetmarkergroup(var_4226c12910d867d4);
    assertex(isdefined(markergroup), "<dev string:x1f3>");
    if (isdefined(showto)) {
        if (isplayer(showto)) {
            if (array_contains(markergroup.showntoents, showto)) {
                return;
            }
            if (function_32fdc90fc744999f(showto) >= 2) {
                assertmsg("<dev string:x23a>");
                return;
            }
            markergroup.showntoents[markergroup.showntoents.size] = showto;
            addclienttotargetmarkergroupmask(var_4226c12910d867d4, showto);
        }
    }
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4f0
// Size: 0xfd
function function_9f84e910425d033(var_4226c12910d867d4, showto) {
    markergroup = gettargetmarkergroup(var_4226c12910d867d4);
    assertex(isdefined(markergroup), "<dev string:x1f3>");
    assertex(isdefined(showto), "<dev string:x2b8>");
    assertex(isarray(showto), "<dev string:x2fc>");
    foreach (var_ebcded206506e726 in showto) {
        if (isplayer(var_ebcded206506e726)) {
            if (array_contains(markergroup.showntoents, var_ebcded206506e726)) {
                continue;
            }
            if (function_32fdc90fc744999f(var_ebcded206506e726) >= 2) {
                assertmsg("<dev string:x23a>");
                continue;
            }
            markergroup.showntoents[markergroup.showntoents.size] = var_ebcded206506e726;
            addclienttotargetmarkergroupmask(var_4226c12910d867d4, var_ebcded206506e726);
        }
    }
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5f5
// Size: 0xf8
function function_adb80c80f10281f9(var_4226c12910d867d4, showto) {
    markergroup = gettargetmarkergroup(var_4226c12910d867d4);
    assertex(isdefined(markergroup), "<dev string:x1f3>");
    if (isdefined(showto)) {
        if (isteam(showto)) {
            if (array_contains(markergroup.showntoteams, showto)) {
                return;
            }
            teaments = level.teamdata[showto]["players"];
            foreach (player in teaments) {
                if (function_32fdc90fc744999f(player) >= 2) {
                    assertmsg("<dev string:x23a>");
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
// Checksum 0x0, Offset: 0x6f5
// Size: 0x166
function function_aafa0ed4a3d69b91(var_4226c12910d867d4, showto) {
    markergroup = gettargetmarkergroup(var_4226c12910d867d4);
    assertex(isdefined(markergroup), "<dev string:x1f3>");
    assertex(isdefined(showto), "<dev string:x351>");
    assertex(isarray(showto), "<dev string:x399>");
    foreach (var_ebcded206506e726 in showto) {
        if (isteam(var_ebcded206506e726)) {
            if (array_contains(markergroup.showntoteams, var_ebcded206506e726)) {
                continue;
            }
            teaments = level.teamdata[var_ebcded206506e726]["players"];
            foreach (player in teaments) {
                if (function_32fdc90fc744999f(player) >= 2) {
                    assertmsg("<dev string:x23a>");
                    break;
                }
            }
            markergroup.showntoteams[markergroup.showntoteams.size] = var_ebcded206506e726;
            addteamtotargetmarkergroupmask(var_4226c12910d867d4, var_ebcded206506e726);
        }
    }
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x863
// Size: 0x1a1
function function_fd770a1099036688(var_4226c12910d867d4, var_65f5a4e57b38d87) {
    markergroup = gettargetmarkergroup(var_4226c12910d867d4);
    assertex(isdefined(markergroup), "<dev string:x1f3>");
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
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xa0c
// Size: 0x2b0
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
                    assertmsg("<dev string:x23a>");
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
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcc4
// Size: 0xce
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
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd9a
// Size: 0x33
function setnewowner(var_4226c12910d867d4, newowner) {
    tmg = gettargetmarkergroup(var_4226c12910d867d4);
    tmg.markerowner = newowner;
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdd5
// Size: 0xa5
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
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe82
// Size: 0x8f
function targetmarkergroupexists(var_4226c12910d867d4) {
    groupexists = 0;
    if (!isdefined(var_4226c12910d867d4)) {
        assertmsg("<dev string:x3e3>");
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
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf1a
// Size: 0x8e
function gettargetmarkergroup(var_4226c12910d867d4) {
    targetmarkergroup = undefined;
    if (!isdefined(var_4226c12910d867d4)) {
        assertmsg("<dev string:x41e>");
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
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xfb1
// Size: 0x54
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
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x100d
// Size: 0x4b
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
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1060
// Size: 0x4b
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
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x10b3
// Size: 0x89
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
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1145
// Size: 0x1da
function targetmarkergroup_markentity(ent, var_4226c12910d867d4, var_262f4b55aa151de1) {
    markergroup = gettargetmarkergroup(var_4226c12910d867d4);
    if (!isdefined(markergroup)) {
        assertmsg("<dev string:x456>");
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
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1327
// Size: 0x55
function function_61a64c527b1e0c5f(markergroup) {
    entnum = function_74348e91568973f8();
    markergroup endon("ent_removed_" + entnum);
    level endon("removed_targetMarkerGroup_" + markergroup.markerid);
    targetmarkergroup_addtomarkingqueue(markergroup);
    targetmarkergroup_unmarkentity(self, markergroup.markerid, entnum);
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1384
// Size: 0x59
function targetmarkergroup_removefromgroupaction(action, markergroup) {
    entnum = function_74348e91568973f8();
    markergroup endon("ent_removed_" + entnum);
    level endon("removed_targetMarkerGroup_" + markergroup.markerid);
    self waittill(action);
    targetmarkergroup_unmarkentity(self, markergroup.markerid, entnum);
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13e5
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
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1455
// Size: 0x39
function function_38a987baf2b61673(removenotify, markergroup) {
    level endon("game_ended");
    level endon("removed_targetMarkerGroup_" + markergroup.markerid);
    self waittill(removenotify);
    targetmarkergroup_removefrommarkingqueue(markergroup);
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1496
// Size: 0x6b
function targetmarkergroup_removefrommarkingqueue(markergroup) {
    if (!isdefined(markergroup)) {
        assertmsg("<dev string:x493>");
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
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1509
// Size: 0xbd
function targetmarkergroup_handlemarkingfromqueue(markergroupid) {
    level endon("game_ended");
    level endon("removed_targetMarkerGroup_" + markergroupid);
    while (targetmarkergroupexists(markergroupid)) {
        var_568640efc573fcce = level waittill("ent_removed_from_marker_group");
        markergroup = gettargetmarkergroup(markergroupid);
        if (!isdefined(markergroup)) {
            assertmsg("<dev string:x4de>");
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
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x15ce
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
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1670
// Size: 0x7f
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
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x16f8
// Size: 0x61
function function_7c253e3d43e44097(target, var_4226c12910d867d4) {
    entnum = target function_74348e91568973f8();
    markergroup = gettargetmarkergroup(var_4226c12910d867d4);
    return isdefined(markergroup) && isdefined(markergroup.markedents) && isdefined(entnum) && isdefined(markergroup.markedents[entnum]);
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1762
// Size: 0x76
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
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17e1
// Size: 0x13
function targetmarkergroup_clearcacheonspawn() {
    self setclientomnvar("ui_clear_target_markers", gettime());
}

// Namespace namespace_81810d22a17382b6 / scripts\cp_mp\targetmarkergroups
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17fc
// Size: 0x6e
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
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1873
// Size: 0xde
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

