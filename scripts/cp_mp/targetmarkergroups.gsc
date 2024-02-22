// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace namespace_81810d22a17382b6;

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x634
// Size: 0x64
function init() {
    level.activetargetmarkergroups = [];
    if (issharedfuncdefined("game", "registerOnPlayerSpawnCallback")) {
        [[ getsharedfunc("game", "registerOnPlayerSpawnCallback") ]](&targetmarkergroup_clearcacheonspawn);
    }
    registersharedfunc("game", "targetMarkerGroup_off", &targetmarkergroup_off);
    registersharedfunc("game", "targetMarkerGroup_on", &targetmarkergroup_on);
}

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69f
// Size: 0xd1
function targetmarkergroup_on(var_21323aee11762c98, showto, var_65fc87a9bc280a91, var_298022b2afadb4bf, friendlymarker, var_aeb2840fedae5220, var_262f4b55aa151de1) {
    if (level.activetargetmarkergroups.size >= 50) {
        /#
            assertmsg("targetMarkerGroup_on: There are too many active target marker groups.  Please remove some before adding more.");
        #/
        return;
    }
    if (targetmarkergroup_getownedgroups(var_298022b2afadb4bf) >= 2) {
        /#
            assertmsg("targetMarkerGroup_on: Owner already has too many active groups.  Please turn off a group before adding a new one.");
        #/
        return;
    }
    var_6d7ef76a3761f0f8 = createtargetmarkergroup(var_21323aee11762c98);
    if (!isdefined(var_6d7ef76a3761f0f8)) {
        /#
            assertmsg("targetMarkerGroup_on: Can't create target marker group.  Marker Group ID invalid!");
        #/
        return;
    } else if (targetmarkergroupexists(var_6d7ef76a3761f0f8)) {
        /#
            assertmsg("targetMarkerGroup_on: Can't create target marker group.  Marker Group ID: " + var_6d7ef76a3761f0f8 + " already exists!");
        #/
        return;
    }
    addtargetmarkergroup(var_6d7ef76a3761f0f8, showto, var_65fc87a9bc280a91, var_298022b2afadb4bf, friendlymarker, var_aeb2840fedae5220, var_262f4b55aa151de1);
    return var_6d7ef76a3761f0f8;
}

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x778
// Size: 0x3c
function targetmarkergroup_off(var_4226c12910d867d4) {
    if (!targetmarkergroupexists(var_4226c12910d867d4)) {
        /#
            assertmsg("Trying to remove invalid target marker group ID: " + var_4226c12910d867d4 + " ");
        #/
        return;
    }
    removetargetmarkergroup(var_4226c12910d867d4);
    deletetargetmarkergroup(var_4226c12910d867d4);
}

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bb
// Size: 0x7e
function function_32fdc90fc744999f(ent) {
    var_729ee1cfdbe2c06e = 0;
    foreach (var_c8462289edfc0aca in level.activetargetmarkergroups) {
        if (array_contains(var_c8462289edfc0aca.showntoents, ent)) {
            var_729ee1cfdbe2c06e++;
        }
    }
    return var_729ee1cfdbe2c06e;
}

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x841
// Size: 0x98
function function_b76f204edb67efc7(var_4226c12910d867d4, showto) {
    var_c8462289edfc0aca = gettargetmarkergroup(var_4226c12910d867d4);
    /#
        assertex(isdefined(var_c8462289edfc0aca), "Tried to add clients to TargetMarkerGroup but the TMG did not exist");
    #/
    if (isdefined(showto)) {
        if (isplayer(showto)) {
            if (array_contains(var_c8462289edfc0aca.showntoents, showto)) {
                return;
            }
            if (function_32fdc90fc744999f(showto) >= 2) {
                /#
                    assertmsg("addTargetMarkerGroup: Show to Entity already has too many active groups.  Please turn off a group before adding a new one.");
                #/
                return;
            }
            var_c8462289edfc0aca.showntoents[var_c8462289edfc0aca.showntoents.size] = showto;
            addclienttotargetmarkergroupmask(var_4226c12910d867d4, showto);
        }
    }
}

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8e0
// Size: 0x100
function function_9f84e910425d033(var_4226c12910d867d4, showto) {
    var_c8462289edfc0aca = gettargetmarkergroup(var_4226c12910d867d4);
    /#
        assertex(isdefined(var_c8462289edfc0aca), "Tried to add clients to TargetMarkerGroup but the TMG did not exist");
    #/
    /#
        assertex(isdefined(showto), "Tried to add clients to TargetMarkerGroup but list is undefined.");
    #/
    /#
        assertex(isarray(showto), "ShowTo is not an array of clients. Please adjust this before using this function.");
    #/
    foreach (var_ebcded206506e726 in showto) {
        if (isplayer(var_ebcded206506e726)) {
            if (array_contains(var_c8462289edfc0aca.showntoents, var_ebcded206506e726)) {
                continue;
            }
            if (function_32fdc90fc744999f(var_ebcded206506e726) >= 2) {
                /#
                    assertmsg("addTargetMarkerGroup: Show to Entity already has too many active groups.  Please turn off a group before adding a new one.");
                #/
            } else {
                var_c8462289edfc0aca.showntoents[var_c8462289edfc0aca.showntoents.size] = var_ebcded206506e726;
                addclienttotargetmarkergroupmask(var_4226c12910d867d4, var_ebcded206506e726);
            }
        }
    }
}

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9e7
// Size: 0xfc
function function_adb80c80f10281f9(var_4226c12910d867d4, showto) {
    var_c8462289edfc0aca = gettargetmarkergroup(var_4226c12910d867d4);
    /#
        assertex(isdefined(var_c8462289edfc0aca), "Tried to add clients to TargetMarkerGroup but the TMG did not exist");
    #/
    if (isdefined(showto)) {
        if (isteam(showto)) {
            if (array_contains(var_c8462289edfc0aca.showntoteams, showto)) {
                return;
            }
            var_767cac7730c2f3c2 = level.teamdata[showto]["players"];
            foreach (player in var_767cac7730c2f3c2) {
                if (function_32fdc90fc744999f(player) >= 2) {
                    /#
                        assertmsg("addTargetMarkerGroup: Show to Entity already has too many active groups.  Please turn off a group before adding a new one.");
                    #/
                    return;
                }
            }
            var_c8462289edfc0aca.showntoteams[var_c8462289edfc0aca.showntoteams.size] = showto;
            addteamtotargetmarkergroupmask(var_4226c12910d867d4, showto);
        }
    }
}

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xaea
// Size: 0x16d
function function_aafa0ed4a3d69b91(var_4226c12910d867d4, showto) {
    var_c8462289edfc0aca = gettargetmarkergroup(var_4226c12910d867d4);
    /#
        assertex(isdefined(var_c8462289edfc0aca), "Tried to add clients to TargetMarkerGroup but the TMG did not exist");
    #/
    /#
        assertex(isdefined(showto), "Tried to add team list to TargetMarkerGroup but ShowTo is undefined.");
    #/
    /#
        assertex(isarray(showto), "ShowTo is not an array. Please adjust this before using this function.");
    #/
    foreach (var_ebcded206506e726 in showto) {
        if (isteam(var_ebcded206506e726)) {
            if (array_contains(var_c8462289edfc0aca.showntoteams, var_ebcded206506e726)) {
                continue;
            }
            var_767cac7730c2f3c2 = level.teamdata[var_ebcded206506e726]["players"];
            foreach (player in var_767cac7730c2f3c2) {
                if (function_32fdc90fc744999f(player) >= 2) {
                    /#
                        assertmsg("addTargetMarkerGroup: Show to Entity already has too many active groups.  Please turn off a group before adding a new one.");
                    #/
                    break;
                }
            }
            var_c8462289edfc0aca.showntoteams[var_c8462289edfc0aca.showntoteams.size] = var_ebcded206506e726;
            addteamtotargetmarkergroupmask(var_4226c12910d867d4, var_ebcded206506e726);
        }
    }
}

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc5e
// Size: 0x1a4
function function_fd770a1099036688(var_4226c12910d867d4, var_65f5a4e57b38d87) {
    var_c8462289edfc0aca = gettargetmarkergroup(var_4226c12910d867d4);
    /#
        assertex(isdefined(var_c8462289edfc0aca), "Tried to add clients to TargetMarkerGroup but the TMG did not exist");
    #/
    if (isdefined(var_65f5a4e57b38d87)) {
        if (isarray(var_65f5a4e57b38d87)) {
            foreach (remove in var_65f5a4e57b38d87) {
                if (isplayer(var_65f5a4e57b38d87)) {
                    if (array_contains(var_c8462289edfc0aca.showntoents, remove)) {
                        var_c8462289edfc0aca.showntoents = array_remove(var_c8462289edfc0aca.showntoents, remove);
                        removeclientfromtargetmarkergroupmask(var_4226c12910d867d4, remove);
                    }
                } else if (isteam(var_65f5a4e57b38d87)) {
                    if (array_contains(var_c8462289edfc0aca.showntoteams, remove)) {
                        var_c8462289edfc0aca.showntoteams = array_remove(var_c8462289edfc0aca.showntoteams, remove);
                        removeteamfromtargetmarkergroupmask(var_4226c12910d867d4, remove);
                    }
                }
            }
        } else if (isplayer(var_65f5a4e57b38d87)) {
            if (array_contains(var_c8462289edfc0aca.showntoents, var_65f5a4e57b38d87)) {
                var_c8462289edfc0aca.showntoents = array_remove(var_c8462289edfc0aca.showntoents, var_65f5a4e57b38d87);
                removeclientfromtargetmarkergroupmask(var_4226c12910d867d4, var_65f5a4e57b38d87);
            }
        } else if (isteam(var_65f5a4e57b38d87)) {
            if (array_contains(var_c8462289edfc0aca.showntoteams, var_65f5a4e57b38d87)) {
                var_c8462289edfc0aca.showntoteams = array_remove(var_c8462289edfc0aca.showntoteams, var_65f5a4e57b38d87);
                removeteamfromtargetmarkergroupmask(var_4226c12910d867d4, var_65f5a4e57b38d87);
            }
        }
    }
}

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe09
// Size: 0x2b6
function addtargetmarkergroup(var_4226c12910d867d4, showto, var_65fc87a9bc280a91, var_298022b2afadb4bf, friendlymarker, var_aeb2840fedae5220, var_262f4b55aa151de1) {
    var_c8462289edfc0aca = spawnstruct();
    var_c8462289edfc0aca.markerid = var_4226c12910d867d4;
    var_c8462289edfc0aca.markerowner = var_298022b2afadb4bf;
    var_c8462289edfc0aca.friendlymarker = friendlymarker;
    var_c8462289edfc0aca.showntoents = [];
    var_c8462289edfc0aca.showntoteams = [];
    var_c8462289edfc0aca.markedents = [];
    var_c8462289edfc0aca.markedentsinqueue = [];
    level.activetargetmarkergroups[level.activetargetmarkergroups.size] = var_c8462289edfc0aca;
    level thread targetmarkergroup_handlemarkingfromqueue(var_4226c12910d867d4);
    if (isdefined(showto)) {
        if (isarray(showto)) {
            foreach (var_ebcded206506e726 in showto) {
                if (function_32fdc90fc744999f(var_ebcded206506e726) >= 2) {
                    /#
                        assertmsg("addTargetMarkerGroup: Show to Entity already has too many active groups.  Please turn off a group before adding a new one.");
                    #/
                } else if (isplayer(var_ebcded206506e726)) {
                    var_c8462289edfc0aca.showntoents[var_c8462289edfc0aca.showntoents.size] = var_ebcded206506e726;
                    addclienttotargetmarkergroupmask(var_4226c12910d867d4, var_ebcded206506e726);
                } else if (isteam(var_ebcded206506e726)) {
                    var_c8462289edfc0aca.showntoteams[var_c8462289edfc0aca.showntoteams.size] = var_ebcded206506e726;
                    addteamtotargetmarkergroupmask(var_4226c12910d867d4, var_ebcded206506e726);
                }
            }
        } else if (isplayer(showto)) {
            var_c8462289edfc0aca.showntoents[var_c8462289edfc0aca.showntoents.size] = showto;
            addclienttotargetmarkergroupmask(var_4226c12910d867d4, showto);
        } else if (isteam(showto)) {
            var_c8462289edfc0aca.showntoteams[var_c8462289edfc0aca.showntoteams.size] = showto;
            addteamtotargetmarkergroupmask(var_4226c12910d867d4, showto);
        }
    }
    if (isdefined(var_65fc87a9bc280a91)) {
        if (isarray(var_65fc87a9bc280a91)) {
            foreach (var_caeacf76ee56d62e in var_65fc87a9bc280a91) {
                targetmarkergroup_markentity(var_caeacf76ee56d62e, var_4226c12910d867d4, var_262f4b55aa151de1);
            }
        } else {
            targetmarkergroup_markentity(var_65fc87a9bc280a91, var_4226c12910d867d4, var_262f4b55aa151de1);
        }
    }
    if (istrue(var_aeb2840fedae5220)) {
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

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c6
// Size: 0xd2
function function_78264e044be08e4d(var_4226c12910d867d4) {
    level endon("game_ended");
    level endon("removed_targetMarkerGroup_" + var_4226c12910d867d4);
    while (targetmarkergroupexists(var_4226c12910d867d4)) {
        var_c8462289edfc0aca = gettargetmarkergroup(var_4226c12910d867d4);
        if (var_c8462289edfc0aca.markedentsinqueue.size > 0) {
            entnum = undefined;
            foreach (ent in var_c8462289edfc0aca.markedents) {
                entnum = ent function_74348e91568973f8();
                if (isdefined(entnum)) {
                    ent function_61a64c527b1e0c5f(var_c8462289edfc0aca);
                    wait(randomfloatrange(0.1, 0.2));
                    break;
                }
            }
        }
        waitframe();
    }
}

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x119f
// Size: 0x33
function function_69d232b5e8c5d652(var_4226c12910d867d4, newowner) {
    var_e97b73032a8f6b63 = gettargetmarkergroup(var_4226c12910d867d4);
    var_e97b73032a8f6b63.markerowner = newowner;
}

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11d9
// Size: 0xa9
function removetargetmarkergroup(var_4226c12910d867d4) {
    var_1bb39b6537c2fd51 = undefined;
    var_1af30f69ef1607bf = [];
    foreach (var_c8462289edfc0aca in level.activetargetmarkergroups) {
        if (var_c8462289edfc0aca.markerid == var_4226c12910d867d4) {
            var_1bb39b6537c2fd51 = var_c8462289edfc0aca;
        } else {
            var_1af30f69ef1607bf[var_1af30f69ef1607bf.size] = var_c8462289edfc0aca;
        }
    }
    if (isdefined(var_1bb39b6537c2fd51)) {
        var_1bb39b6537c2fd51 = undefined;
    }
    level.activetargetmarkergroups = var_1af30f69ef1607bf;
    level notify("removed_targetMarkerGroup_" + var_4226c12910d867d4);
}

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1289
// Size: 0x92
function targetmarkergroupexists(var_4226c12910d867d4) {
    var_fc88d6eff33e9d68 = 0;
    if (!isdefined(var_4226c12910d867d4)) {
        /#
            assertmsg("targetMarkerGroupExists: Invalid target marker group id");
        #/
        return var_fc88d6eff33e9d68;
    }
    foreach (var_c8462289edfc0aca in level.activetargetmarkergroups) {
        if (var_c8462289edfc0aca.markerid == var_4226c12910d867d4) {
            var_fc88d6eff33e9d68 = 1;
            break;
        }
    }
    return var_fc88d6eff33e9d68;
}

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1323
// Size: 0x91
function gettargetmarkergroup(var_4226c12910d867d4) {
    targetmarkergroup = undefined;
    if (!isdefined(var_4226c12910d867d4)) {
        /#
            assertmsg("getTargetMarkerGroup: Invalid target marker group id");
        #/
        return targetmarkergroup;
    }
    foreach (var_c8462289edfc0aca in level.activetargetmarkergroups) {
        if (var_c8462289edfc0aca.markerid == var_4226c12910d867d4) {
            targetmarkergroup = var_c8462289edfc0aca;
            break;
        }
    }
    return targetmarkergroup;
}

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13bc
// Size: 0x54
function targetmarkergroup_watchmarkonspawn(var_4226c12910d867d4, var_262f4b55aa151de1) {
    level endon("game_ended ");
    level endon("removed_targetMarkerGroup_" + var_4226c12910d867d4);
    while (1) {
        player = level waittill("player_spawned");
        if (canbemarkedingroup(var_4226c12910d867d4, player)) {
            targetmarkergroup_markentity(player, var_4226c12910d867d4, var_262f4b55aa151de1);
        }
    }
}

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1417
// Size: 0x4b
function targetmarkergroup_watchfornoscopeoutlineperkunset(var_4226c12910d867d4) {
    level endon("game_ended ");
    level endon("removed_targetMarkerGroup_" + var_4226c12910d867d4);
    while (1) {
        player = level waittill("unset_noscopeoutline");
        if (canbemarkedingroup(var_4226c12910d867d4, player)) {
            targetmarkergroup_markentity(player, var_4226c12910d867d4);
        }
    }
}

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1469
// Size: 0x4b
function targetmarkergroup_watchfornoscopeoutlineperkset(var_4226c12910d867d4) {
    level endon("game_ended ");
    level endon("removed_targetMarkerGroup_" + var_4226c12910d867d4);
    while (1) {
        player = level waittill("set_noscopeoutline");
        if (canbemarkedingroup(var_4226c12910d867d4, player)) {
            targetmarkergroup_unmarkentity(player, var_4226c12910d867d4);
        }
    }
}

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14bb
// Size: 0x89
function private function_74348e91568973f8() {
    var_c1a9121cfb94feb9 = undefined;
    if (isdefined(self) && isent(self)) {
        if (isplayer(self) && !isbot(self)) {
            var_c1a9121cfb94feb9 = self getxuid();
        } else if (isdefined(self.owner) && !isbot(self.owner) && isplayer(self.owner)) {
            var_c1a9121cfb94feb9 = self.owner getxuid();
        } else {
            var_c1a9121cfb94feb9 = self getentitynumber();
        }
    }
    return var_c1a9121cfb94feb9;
}

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x154c
// Size: 0x1de
function targetmarkergroup_markentity(ent, var_4226c12910d867d4, var_262f4b55aa151de1) {
    var_c8462289edfc0aca = gettargetmarkergroup(var_4226c12910d867d4);
    if (!isdefined(var_c8462289edfc0aca)) {
        /#
            /#
                assertmsg("specialty_noscopeoutline");
            #/
        #/
        return;
    }
    entnum = ent function_74348e91568973f8();
    if (!isdefined(entnum)) {
        return;
    }
    if (var_c8462289edfc0aca.markedents.size >= 20) {
        ent targetmarkergroup_addtomarkingqueue(var_c8462289edfc0aca);
        return;
    }
    if (isdefined(ent) && isplayer(ent)) {
        if (istrue(ent.liveragdoll)) {
            return;
        }
        if (istrue(var_262f4b55aa151de1)) {
            markerowner = var_c8462289edfc0aca.markerowner;
            checkteam = isdefined(var_c8462289edfc0aca.friendlymarker);
            var_5294b0c9df040308 = istrue(var_c8462289edfc0aca.friendlymarker);
            if (checkteam) {
                if (!var_5294b0c9df040308) {
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
    if (!array_contains(var_c8462289edfc0aca.markedents, ent)) {
        var_c8462289edfc0aca.markedents[entnum] = ent;
        targetmarkergroupaddentity(var_4226c12910d867d4, ent);
        if (isplayer(ent)) {
            ent thread targetmarkergroup_removefromgroupaction("death", var_c8462289edfc0aca);
            ent thread targetmarkergroup_removefromgroupaction("disconnect", var_c8462289edfc0aca);
            ent thread targetmarkergroup_removefromgroupaction("joined_team", var_c8462289edfc0aca);
            ent thread targetmarkergroup_removefromgroupaction("enter_live_ragdoll", var_c8462289edfc0aca);
        } else {
            ent thread targetmarkergroup_removefromgroupaction("death", var_c8462289edfc0aca);
        }
    }
}

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1731
// Size: 0x55
function function_61a64c527b1e0c5f(var_c8462289edfc0aca) {
    entnum = function_74348e91568973f8();
    var_c8462289edfc0aca endon("ent_removed_" + entnum);
    level endon("removed_targetMarkerGroup_" + var_c8462289edfc0aca.markerid);
    targetmarkergroup_addtomarkingqueue(var_c8462289edfc0aca);
    targetmarkergroup_unmarkentity(self, var_c8462289edfc0aca.markerid, entnum);
}

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x178d
// Size: 0x59
function targetmarkergroup_removefromgroupaction(action, var_c8462289edfc0aca) {
    entnum = function_74348e91568973f8();
    var_c8462289edfc0aca endon("ent_removed_" + entnum);
    level endon("removed_targetMarkerGroup_" + var_c8462289edfc0aca.markerid);
    self waittill(action);
    targetmarkergroup_unmarkentity(self, var_c8462289edfc0aca.markerid, entnum);
}

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ed
// Size: 0x69
function targetmarkergroup_addtomarkingqueue(var_c8462289edfc0aca) {
    if (isdefined(self) && !array_contains(var_c8462289edfc0aca.markedentsinqueue, self)) {
        var_c8462289edfc0aca.markedentsinqueue[var_c8462289edfc0aca.markedentsinqueue.size] = self;
        if (isplayer(self)) {
            thread function_38a987baf2b61673("disconnect", var_c8462289edfc0aca);
        } else {
            thread function_38a987baf2b61673("death", var_c8462289edfc0aca);
        }
    }
}

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x185d
// Size: 0x3a
function function_38a987baf2b61673(var_bd2f118c743ab788, var_c8462289edfc0aca) {
    level endon("game_ended");
    level endon("removed_targetMarkerGroup_" + var_c8462289edfc0aca.markerid);
    self waittill(var_bd2f118c743ab788);
    targetmarkergroup_removefrommarkingqueue(var_c8462289edfc0aca);
}

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x189e
// Size: 0x6b
function targetmarkergroup_removefrommarkingqueue(var_c8462289edfc0aca) {
    if (!isdefined(var_c8462289edfc0aca)) {
        /#
            /#
                assertmsg("<unknown string>");
            #/
        #/
        return;
    }
    var_e5dab4f107f3a279 = [];
    if (isdefined(self)) {
        var_e5dab4f107f3a279 = array_remove(var_c8462289edfc0aca.markedentsinqueue, self);
    } else {
        var_e5dab4f107f3a279 = array_removeundefined(var_c8462289edfc0aca.markedentsinqueue);
    }
    var_c8462289edfc0aca.markedentsinqueue = var_e5dab4f107f3a279;
}

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1910
// Size: 0xbf
function targetmarkergroup_handlemarkingfromqueue(var_d50b22f7f8cd2bc7) {
    level endon("game_ended");
    level endon("removed_targetMarkerGroup_" + var_d50b22f7f8cd2bc7);
    while (targetmarkergroupexists(var_d50b22f7f8cd2bc7)) {
        var_568640efc573fcce = level waittill("ent_removed_from_marker_group");
        var_c8462289edfc0aca = gettargetmarkergroup(var_d50b22f7f8cd2bc7);
        if (!isdefined(var_c8462289edfc0aca)) {
            /#
                assertmsg("targetMarkerGroup_handleMarkingFromQueue: Marker group doesn't exist");
            #/
            break;
        }
        if (var_568640efc573fcce != var_c8462289edfc0aca) {
            continue;
        }
        if (var_c8462289edfc0aca.markedentsinqueue.size == 0) {
            continue;
        }
        var_c8728064db9c260e = undefined;
        if (isdefined(var_c8462289edfc0aca.markedentsinqueue[0])) {
            var_c8728064db9c260e = var_c8462289edfc0aca.markedentsinqueue[0];
        }
        var_c8728064db9c260e targetmarkergroup_removefrommarkingqueue(var_c8462289edfc0aca);
        targetmarkergroup_markentity(var_c8728064db9c260e, var_d50b22f7f8cd2bc7);
    }
}

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19d6
// Size: 0x9b
function targetmarkergroup_unmarkentity(ent, var_4226c12910d867d4, var_1117512b0cac320e) {
    entnum = ent function_74348e91568973f8();
    if (isdefined(var_1117512b0cac320e)) {
        entnum = var_1117512b0cac320e;
    }
    var_c8462289edfc0aca = gettargetmarkergroup(var_4226c12910d867d4);
    if (isdefined(var_c8462289edfc0aca) && isdefined(var_c8462289edfc0aca.markedents)) {
        var_c8462289edfc0aca.markedents = function_6c752e44b5090154(var_c8462289edfc0aca.markedents, ent);
        if (isdefined(ent)) {
            targetmarkergroupremoveentity(var_4226c12910d867d4, ent);
        }
        level notify("ent_removed_from_marker_group", var_c8462289edfc0aca);
        var_c8462289edfc0aca notify("ent_removed_" + entnum);
    }
}

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a78
// Size: 0x82
function function_6c752e44b5090154(markedents, var_a1dcb36aa55a847) {
    newarray = [];
    foreach (var_126f2d644585dab2, ent in markedents) {
        if (!isdefined(ent)) {
            continue;
        }
        if (isdefined(var_a1dcb36aa55a847) && var_a1dcb36aa55a847 == ent) {
            continue;
        }
        newarray[var_126f2d644585dab2] = ent;
    }
    return newarray;
}

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b02
// Size: 0x62
function function_7c253e3d43e44097(target, var_4226c12910d867d4) {
    entnum = target function_74348e91568973f8();
    var_c8462289edfc0aca = gettargetmarkergroup(var_4226c12910d867d4);
    return isdefined(var_c8462289edfc0aca) && isdefined(var_c8462289edfc0aca.markedents) && isdefined(entnum) && isdefined(var_c8462289edfc0aca.markedents[entnum]);
}

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b6c
// Size: 0x79
function targetmarkergroup_getownedgroups(var_298022b2afadb4bf) {
    var_9cea65c4cff49987 = 0;
    foreach (var_c8462289edfc0aca in level.activetargetmarkergroups) {
        if (var_c8462289edfc0aca.markerowner == var_298022b2afadb4bf) {
            var_9cea65c4cff49987++;
        }
    }
    return var_9cea65c4cff49987;
}

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bed
// Size: 0x14
function targetmarkergroup_clearcacheonspawn() {
    self setclientomnvar("ui_clear_target_markers", gettime());
}

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c08
// Size: 0x70
function isteam(showto) {
    if (showto == "spectator") {
        return 1;
    }
    foreach (teamname in level.teamnamelist) {
        if (showto == teamname) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_81810d22a17382b6/namespace_f48c22429667eba9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c80
// Size: 0xe2
function canbemarkedingroup(var_4226c12910d867d4, ent) {
    var_aca1314ebd3bb434 = 0;
    var_c8462289edfc0aca = gettargetmarkergroup(var_4226c12910d867d4);
    var_5104555d72c8c295 = var_c8462289edfc0aca.markerowner;
    checkteam = istrue(level.teambased);
    var_5294b0c9df040308 = istrue(var_c8462289edfc0aca.friendlymarker);
    if (!isdefined(var_5104555d72c8c295)) {
        return var_aca1314ebd3bb434;
    }
    if (checkteam) {
        if (var_5294b0c9df040308) {
            if (ent.team == var_5104555d72c8c295.team) {
                var_aca1314ebd3bb434 = 1;
            }
        } else if (ent.team != var_5104555d72c8c295.team) {
            var_aca1314ebd3bb434 = 1;
        }
    } else if (var_5294b0c9df040308) {
        if (ent == var_5104555d72c8c295) {
            var_aca1314ebd3bb434 = 1;
        }
    } else if (ent != var_5104555d72c8c295) {
        var_aca1314ebd3bb434 = 1;
    }
    return var_aca1314ebd3bb434;
}

