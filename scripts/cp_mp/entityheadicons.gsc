// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\hostmigration.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace entityheadicons;

// Namespace entityheadicons/namespace_7bdde15c3500a23f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ae
// Size: 0xab
function init() {
    /#
        issharedfuncdefined("<unknown string>", "<unknown string>", 1);
    #/
    level.var_32fe21b3c5052471 = getdvarint(@"hash_8ed0da01bb4e0c5f", 1);
    level.factionfriendlyheadicon = "hud_icon_head_friendly_sm";
    level.factionenemyheadicon = "hud_icon_head_enemy_sm";
    if (function_6ede573723f08c0f()) {
        level.factionfriendlyheadicon = "hud_icon_head_equipment_friendly";
        level.factionenemyheadicon = "hud_icon_head_equipment_enemy";
    }
    level.activeheadicons = [];
    level.var_b516ed3abe09ea = [0:"hud_icon_death_spawn", 1:"hud_icon_head_friendly_sm", 2:"hud_icon_head_enemy_sm", 3:"hud_icon_new_marked"];
}

// Namespace entityheadicons/namespace_7bdde15c3500a23f
// Params 12, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x260
// Size: 0x21d
function setheadicon_singleimage(showto, image, offset, var_e0e11f3b4551be11, var_c5409ca7522182b3, var_30516b4afd1763de, delaytime, var_fa4cf28a58192889, var_b3ea37733a1577e5, var_7591ed99e87a77d3, showonminimap, iconsize) {
    level endon("game_ended");
    if (isdefined(delaytime)) {
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(delaytime);
    }
    if (!isdefined(self)) {
        return;
    }
    icon = setheadicon_createnewicon(undefined, var_7591ed99e87a77d3);
    setheadiconimage(icon, image);
    if (!isdefined(offset)) {
        offset = 30;
    }
    setheadiconzoffset(icon, offset);
    if (!isdefined(var_e0e11f3b4551be11)) {
        var_e0e11f3b4551be11 = 0;
    }
    setheadicondrawthroughgeo(icon, var_e0e11f3b4551be11);
    if (!isdefined(var_c5409ca7522182b3)) {
        var_c5409ca7522182b3 = 0;
    }
    setheadiconmaxdistance(icon, var_c5409ca7522182b3);
    if (!isdefined(var_30516b4afd1763de)) {
        var_30516b4afd1763de = 0;
    }
    setheadiconnaturaldistance(icon, var_30516b4afd1763de);
    if (isarray(showto)) {
        foreach (var_ebcded206506e726 in showto) {
            if (isplayer(var_ebcded206506e726)) {
                addclienttoheadiconmask(icon, var_ebcded206506e726);
            } else if (isdefined(var_ebcded206506e726) && isteam(var_ebcded206506e726)) {
                addteamtoheadiconmask(icon, var_ebcded206506e726);
            }
        }
    } else if (isplayer(showto)) {
        addclienttoheadiconmask(icon, showto);
    } else if (isdefined(showto) && isteam(showto)) {
        addteamtoheadiconmask(icon, showto);
    }
    if (!istrue(var_fa4cf28a58192889)) {
        thread setheadicon_watchdeath(icon);
    }
    if (istrue(var_b3ea37733a1577e5)) {
        setheadiconsnaptoedges(icon, 1);
    }
    if (istrue(showonminimap)) {
        setheadicondrawinmap(icon, 1);
    }
    if (istrue(level.var_32fe21b3c5052471) && level.teambased && isdefined(self.team) && function_670bc5c30525bf6(image)) {
        setheadiconteam(icon, self.team);
        function_ce9d0299637c2c24(icon, 1);
    }
    if (isdefined(iconsize)) {
        function_ddfa1aae9717e4d9(icon, iconsize);
    }
    return icon;
}

// Namespace entityheadicons/namespace_7bdde15c3500a23f
// Params 13, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x485
// Size: 0x274
function setheadicon_multiimage(showto, var_74ce33b771c6ca07, var_9830d857024187a1, var_36a93664071874b4, offset, var_e0e11f3b4551be11, var_c5409ca7522182b3, var_30516b4afd1763de, delaytime, var_fa4cf28a58192889, var_b3ea37733a1577e5, var_7591ed99e87a77d3, showonminimap) {
    level endon("game_ended");
    if (isdefined(delaytime)) {
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(delaytime);
    }
    if (!isdefined(self)) {
        return;
    }
    icon = setheadicon_createnewicon(undefined, var_7591ed99e87a77d3);
    if (isdefined(var_74ce33b771c6ca07)) {
        setheadiconfriendlyimage(icon, var_74ce33b771c6ca07);
    }
    if (isdefined(var_9830d857024187a1)) {
        setheadiconneutralimage(icon, var_9830d857024187a1);
    }
    if (isdefined(var_36a93664071874b4)) {
        setheadiconenemyimage(icon, var_36a93664071874b4);
    }
    if (!isplayer(self)) {
        if (!isdefined(self.owner) && !isdefined(self.team)) {
            /#
                /#
                    assertmsg("<unknown string>");
                #/
            #/
            setheadicon_deleteicon(icon);
            return;
        }
        if (isdefined(self.owner)) {
            setheadiconowner(icon, self.owner);
        }
        if (level.teambased && isdefined(self.team)) {
            setheadiconteam(icon, self.team);
        }
    }
    if (!isdefined(offset)) {
        offset = 30;
    }
    setheadiconzoffset(icon, offset);
    if (!isdefined(var_e0e11f3b4551be11)) {
        var_e0e11f3b4551be11 = 0;
    }
    setheadicondrawthroughgeo(icon, var_e0e11f3b4551be11);
    if (!isdefined(var_c5409ca7522182b3)) {
        var_c5409ca7522182b3 = 0;
    }
    setheadiconmaxdistance(icon, var_c5409ca7522182b3);
    if (!isdefined(var_30516b4afd1763de)) {
        var_30516b4afd1763de = 0;
    }
    setheadiconnaturaldistance(icon, var_30516b4afd1763de);
    if (isarray(showto)) {
        foreach (var_ebcded206506e726 in showto) {
            if (isplayer(var_ebcded206506e726)) {
                addclienttoheadiconmask(icon, var_ebcded206506e726);
            } else if (isdefined(var_ebcded206506e726) && isteam(var_ebcded206506e726)) {
                addteamtoheadiconmask(icon, var_ebcded206506e726);
            }
        }
    } else if (isplayer(showto)) {
        addclienttoheadiconmask(icon, showto);
    } else if (isdefined(showto) && isteam(showto)) {
        addteamtoheadiconmask(icon, showto);
    }
    if (!istrue(var_fa4cf28a58192889)) {
        thread setheadicon_watchdeath(icon);
    }
    if (istrue(var_b3ea37733a1577e5)) {
        setheadiconsnaptoedges(icon, 1);
    }
    if (istrue(showonminimap)) {
        setheadicondrawinmap(icon, 1);
    }
    return icon;
}

// Namespace entityheadicons/namespace_7bdde15c3500a23f
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x701
// Size: 0x1b8
function setheadicon_factionimage(showtoallfactions, offset, var_e0e11f3b4551be11, var_c5409ca7522182b3, var_30516b4afd1763de, delaytime, var_fa4cf28a58192889, ownerinvisible, var_7591ed99e87a77d3, showonminimap) {
    if (namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        return;
    }
    level endon("game_ended");
    if (isdefined(delaytime)) {
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(delaytime);
    }
    if (!isdefined(self)) {
        return;
    }
    icon = setheadicon_createnewicon(undefined, var_7591ed99e87a77d3);
    var_b7f8c8834de6d664 = spawnstruct();
    var_b7f8c8834de6d664.icon = icon;
    var_b7f8c8834de6d664.entowner = self.owner;
    var_b7f8c8834de6d664.showtoallfactions = showtoallfactions;
    var_b7f8c8834de6d664.ownerinvisible = ownerinvisible;
    if (!isdefined(offset)) {
        offset = 30;
    }
    setheadiconzoffset(var_b7f8c8834de6d664.icon, offset);
    if (!isdefined(var_e0e11f3b4551be11)) {
        var_e0e11f3b4551be11 = 0;
    }
    setheadicondrawthroughgeo(var_b7f8c8834de6d664.icon, var_e0e11f3b4551be11);
    if (!isdefined(var_c5409ca7522182b3)) {
        var_c5409ca7522182b3 = 768;
    }
    setheadiconmaxdistance(var_b7f8c8834de6d664.icon, var_c5409ca7522182b3);
    if (!isdefined(var_30516b4afd1763de)) {
        var_30516b4afd1763de = 0;
    }
    setheadiconnaturaldistance(var_b7f8c8834de6d664.icon, var_30516b4afd1763de);
    if (!istrue(var_fa4cf28a58192889)) {
        thread setheadicon_watchdeath(var_b7f8c8834de6d664.icon);
    }
    if (istrue(showonminimap)) {
        setheadicondrawinmap(icon, 1);
    }
    _updateiconowner(var_b7f8c8834de6d664);
    thread setheadicon_watchfornewowner(var_b7f8c8834de6d664);
    var_8b82f9f802c09d2d = getdvarint(@"hash_264312901607c2ac", 1);
    if (var_8b82f9f802c09d2d) {
        thread setheadicon_watchforteamswitch(var_b7f8c8834de6d664);
    }
    return var_b7f8c8834de6d664.icon;
}

// Namespace entityheadicons/namespace_7bdde15c3500a23f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c1
// Size: 0x3a2
function _updateiconowner(var_b7f8c8834de6d664) {
    self notify("_updateIconOwner()");
    if (istrue(var_b7f8c8834de6d664.showtoallfactions)) {
        setheadiconfriendlyimage(var_b7f8c8834de6d664.icon, level.factionfriendlyheadicon);
        setheadiconneutralimage(var_b7f8c8834de6d664.icon, level.factionenemyheadicon);
        setheadiconenemyimage(var_b7f8c8834de6d664.icon, level.factionenemyheadicon);
        if (!isplayer(self)) {
            if (!isdefined(self.owner) && !isdefined(self.team)) {
                /#
                    /#
                        assertmsg("<unknown string>");
                    #/
                #/
                setheadicon_deleteicon(var_b7f8c8834de6d664.icon);
                return;
            }
            if (isdefined(self.owner)) {
                setheadiconowner(var_b7f8c8834de6d664.icon, self.owner);
            }
            if (level.teambased && isdefined(self.team)) {
                setheadiconteam(var_b7f8c8834de6d664.icon, self.team);
            }
        }
    } else {
        image = level.factionfriendlyheadicon;
        setheadiconimage(var_b7f8c8834de6d664.icon, image);
        if (istrue(level.var_32fe21b3c5052471) && level.teambased && isdefined(self.team) && function_670bc5c30525bf6(image)) {
            setheadiconteam(var_b7f8c8834de6d664.icon, self.team);
            function_ce9d0299637c2c24(var_b7f8c8834de6d664.icon, 1);
        }
    }
    foreach (player in level.players) {
        removeclientfromheadiconmask(var_b7f8c8834de6d664.icon, player);
    }
    if (istrue(var_b7f8c8834de6d664.showtoallfactions)) {
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            addclienttoheadiconmask(var_b7f8c8834de6d664.icon, player);
        }
        thread setheadicon_watchforlateconnect(var_b7f8c8834de6d664.icon);
    } else {
        if (!isdefined(self.owner)) {
            /#
                /#
                    assertmsg("<unknown string>");
                #/
            #/
            setheadicon_deleteicon(var_b7f8c8834de6d664.icon);
            return;
        }
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            if (level.teambased && isdefined(self.owner.team) && player.team != self.owner.team) {
                continue;
            }
            if (!level.teambased && player != self.owner) {
                continue;
            }
            if (istrue(var_b7f8c8834de6d664.ownerinvisible) && player == self.owner) {
                continue;
            }
            addclienttoheadiconmask(var_b7f8c8834de6d664.icon, player);
        }
    }
}

// Namespace entityheadicons/namespace_7bdde15c3500a23f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc6a
// Size: 0x56
function setheadicon_watchforlateconnect(icon) {
    self endon("death");
    self endon("_updateIconOwner()");
    if (isplayer(self)) {
        self endon("disconnect");
    }
    level endon("game_ended");
    while (1) {
        player = level waittill("connected");
        thread setheadicon_watchforlatespawn(icon, player);
    }
}

// Namespace entityheadicons/namespace_7bdde15c3500a23f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc7
// Size: 0x51
function setheadicon_watchforlatespawn(icon, player) {
    self endon("death");
    self endon("_updateIconOwner()");
    if (isplayer(self)) {
        self endon("disconnect");
    }
    level endon("game_ended");
    while (1) {
        player waittill("spawned_player");
        addclienttoheadiconmask(icon, player);
    }
}

// Namespace entityheadicons/namespace_7bdde15c3500a23f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd1f
// Size: 0x6d
function setheadicon_watchfornewowner(var_b7f8c8834de6d664) {
    self endon("death");
    if (isplayer(self)) {
        self endon("disconnect");
    }
    level endon("game_ended");
    while (1) {
        if (var_b7f8c8834de6d664.entowner != self.owner) {
            var_b7f8c8834de6d664.entowner = self.owner;
            _updateiconowner(var_b7f8c8834de6d664);
        }
        wait(0.1);
    }
}

// Namespace entityheadicons/namespace_7bdde15c3500a23f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd93
// Size: 0xc9
function setheadicon_watchforteamswitch(var_b7f8c8834de6d664) {
    level endon("game_ended");
    self endon("headicon_deleted");
    self endon("death");
    while (1) {
        player = level waittill("add_to_team");
        removeclientfromheadiconmask(var_b7f8c8834de6d664.icon, player);
        if (istrue(var_b7f8c8834de6d664.showtoallfactions)) {
            addclienttoheadiconmask(var_b7f8c8834de6d664.icon, player);
        } else {
            if (!isdefined(self.owner)) {
                setheadicon_deleteicon(var_b7f8c8834de6d664.icon);
                return;
            }
            if (player.team != self.owner.team) {
                continue;
            }
            addclienttoheadiconmask(var_b7f8c8834de6d664.icon, player);
        }
    }
}

// Namespace entityheadicons/namespace_7bdde15c3500a23f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe63
// Size: 0x48
function setheadicon_watchdeath(icon) {
    level endon("game_ended");
    self endon("headicon_deleted");
    if (isplayer(self) && !isbot(self)) {
        self waittill("death_or_disconnect");
    } else {
        self waittill("death");
    }
    setheadicon_deleteicon(icon);
}

// Namespace entityheadicons/namespace_7bdde15c3500a23f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb2
// Size: 0x7b
function isteam(showto) {
    if (showto == "spectator" || showto == "codcaster") {
        return 1;
    }
    foreach (teamname in level.teamnamelist) {
        if (showto == teamname) {
            return 1;
        }
    }
    return 0;
}

// Namespace entityheadicons/namespace_7bdde15c3500a23f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf35
// Size: 0xfc
function setheadicon_createnewicon(prioritygroup, var_7591ed99e87a77d3) {
    if (!isdefined(prioritygroup)) {
        prioritygroup = 0;
    }
    if (!setheadicon_allowiconcreation()) {
        setheadicon_removeoldicon(prioritygroup);
    }
    var_4d8a0737086afd98 = undefined;
    if (isdefined(var_7591ed99e87a77d3)) {
        var_4d8a0737086afd98 = createheadiconatorigin(var_7591ed99e87a77d3);
    } else {
        var_4d8a0737086afd98 = createheadicon(self);
    }
    if (!isdefined(var_4d8a0737086afd98) || var_4d8a0737086afd98 < 0) {
        /#
            var_a41b5f8513836136 = self;
            if (isdefined(self.owner)) {
                var_a41b5f8513836136 = self.owner;
            }
            var_a41b5f8513836136 iprintlnbold("<unknown string>");
        #/
        return;
    }
    var_d89e953f27063a40 = spawnstruct();
    var_d89e953f27063a40.icon = var_4d8a0737086afd98;
    var_d89e953f27063a40.entmarked = self;
    var_d89e953f27063a40.prioritygroup = prioritygroup;
    var_d89e953f27063a40.timecreated = gettime();
    level.activeheadicons[var_d89e953f27063a40.icon] = var_d89e953f27063a40;
    return var_d89e953f27063a40.icon;
}

// Namespace entityheadicons/namespace_7bdde15c3500a23f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1039
// Size: 0x6a
function setheadicon_deleteicon(icon) {
    var_d89e953f27063a40 = setheadicon_getexistingiconinfo(icon);
    if (isdefined(var_d89e953f27063a40)) {
        if (isdefined(var_d89e953f27063a40.entmarked)) {
            var_d89e953f27063a40.entmarked notify("headicon_deleted");
        }
        deleteheadicon(var_d89e953f27063a40.icon);
        level.activeheadicons[var_d89e953f27063a40.icon] = undefined;
    }
}

// Namespace entityheadicons/namespace_7bdde15c3500a23f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10aa
// Size: 0x11
function setheadicon_allowiconcreation() {
    return level.activeheadicons.size < 1023;
}

// Namespace entityheadicons/namespace_7bdde15c3500a23f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c3
// Size: 0x2d
function setheadicon_getexistingiconinfo(icon) {
    if (!isdefined(icon)) {
        return;
    }
    if (!isdefined(level.activeheadicons[icon])) {
        return;
    }
    return level.activeheadicons[icon];
}

// Namespace entityheadicons/namespace_7bdde15c3500a23f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f8
// Size: 0x38
function setheadicon_removeoldicon(var_85c943684cfc2305) {
    var_52f4cf8472153ad7 = setheadicon_findlowestprioritygroup(var_85c943684cfc2305);
    var_9633a62391f17533 = setheadicon_findoldestcreatedicon(var_52f4cf8472153ad7);
    setheadicon_deleteicon(var_9633a62391f17533);
}

// Namespace entityheadicons/namespace_7bdde15c3500a23f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1137
// Size: 0x83
function setheadicon_findlowestprioritygroup(var_85c943684cfc2305) {
    var_52f4cf8472153ad7 = var_85c943684cfc2305;
    foreach (var_d89e953f27063a40 in level.activeheadicons) {
        if (var_52f4cf8472153ad7 > var_d89e953f27063a40.prioritygroup) {
            var_52f4cf8472153ad7 = var_d89e953f27063a40.prioritygroup;
        }
    }
    return var_52f4cf8472153ad7;
}

// Namespace entityheadicons/namespace_7bdde15c3500a23f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11c2
// Size: 0xa9
function setheadicon_findoldestcreatedicon(var_49d4316fce0b35b7) {
    var_4a38995d4f273f6b = undefined;
    var_7a69631fd4b42a1f = undefined;
    foreach (var_d89e953f27063a40 in level.activeheadicons) {
        if (!isdefined(var_4a38995d4f273f6b) && !isdefined(var_7a69631fd4b42a1f) || var_4a38995d4f273f6b.timecreated > var_d89e953f27063a40.timecreated) {
            var_4a38995d4f273f6b = var_d89e953f27063a40;
            var_7a69631fd4b42a1f = var_d89e953f27063a40.icon;
        }
    }
    return var_7a69631fd4b42a1f;
}

// Namespace entityheadicons/namespace_7bdde15c3500a23f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1273
// Size: 0x33
function setheadicon_addclienttomask(headicon, client) {
    var_d89e953f27063a40 = setheadicon_getexistingiconinfo(headicon);
    if (isdefined(var_d89e953f27063a40)) {
        addclienttoheadiconmask(headicon, client);
    }
}

// Namespace entityheadicons/namespace_7bdde15c3500a23f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ad
// Size: 0x33
function setheadicon_removeclientfrommask(headicon, client) {
    var_d89e953f27063a40 = setheadicon_getexistingiconinfo(headicon);
    if (isdefined(var_d89e953f27063a40)) {
        removeclientfromheadiconmask(headicon, client);
    }
}

// Namespace entityheadicons/namespace_7bdde15c3500a23f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12e7
// Size: 0x63
function function_670bc5c30525bf6(imagename) {
    foreach (name in level.var_b516ed3abe09ea) {
        if (name == imagename) {
            return 1;
        }
    }
    return 0;
}

// Namespace entityheadicons/namespace_7bdde15c3500a23f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1352
// Size: 0x12
function function_6ede573723f08c0f() {
    return getdvarint(@"hash_1d8c3eb547f8c176", 0);
}

