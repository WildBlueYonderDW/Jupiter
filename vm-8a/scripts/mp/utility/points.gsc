#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\events.gsc;
#using scripts\mp\awards.gsc;
#using script_303fd53078a244f1;
#using scripts\mp\potg.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\supers.gsc;
#using scripts\mp\perks\perks.gsc;
#using script_55e418c5cc946593;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;

#namespace points;

// Namespace points / scripts\mp\utility\points
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4dd
// Size: 0x10
function initpoints() {
    level.var_97e29f66f7229f48 = &doScoreEvent;
}

// Namespace points / scripts\mp\utility\points
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4f5
// Size: 0x80
function givestreakpointswithtext(event, objweapon, pointsoverride) {
    if (istrue(level.ignorescoring)) {
        return;
    }
    if (isdefined(pointsoverride)) {
        points = pointsoverride;
    } else {
        points = scripts\mp\rank::getscoreinfovalue(event);
        assertex(isdefined(points), "giveStreakPointsWithText() with event \"" + function_3c8848a3a11b2553(event) + "\", but that event doesn't exist in the gametype's scoreeventlist asset");
    }
    points = modifyunifiedpoints(event, points, objweapon);
    scripts\mp\killstreaks\killstreaks::givestreakpoints(event, points);
    displayscoreeventpoints(points, event);
}

// Namespace points / scripts\mp\utility\points
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57d
// Size: 0x80
function givexpwithtext(event, pointsoverride) {
    if (istrue(level.ignorescoring)) {
        return;
    }
    assert(function_d03495fe6418377b(event));
    points = undefined;
    if (isdefined(pointsoverride)) {
        points = pointsoverride;
    } else {
        points = scripts\mp\rank::getscoreinfovalue(event);
        assertex(isdefined(points), "giveXPWithText() with event \"" + function_3c8848a3a11b2553(event) + "\", but that event doesn't exist in the gametype's scoreeventlist asset");
    }
    thread scripts\mp\rank::giverankxp(event, points);
    thread scripts\mp\rank::scoreeventpopup(event);
}

// Namespace points / scripts\mp\utility\points
// Params 12, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x605
// Size: 0x28e
function doScoreEvent(event, objweapon, pointsoverride, xpoverride, victim, var_51bdae03b05bc75e, dontwait, cankillchain, streakinfo, var_827c276da1cdcf23, eventinfo, var_339e50a026e4674f) {
    if (istrue(level.gameended)) {
        isvalidevent = 0;
        if (isarray(event)) {
            if (isnumber(level.gameendtime)) {
                if (event[1] <= level.gameendtime) {
                    isvalidevent = 1;
                    event = event[0];
                }
            }
        } else if (isdefined(event)) {
            isvalidevent = 1;
        }
        if (!isvalidevent) {
            return;
        }
    } else if (isarray(event)) {
        event = event[0];
    }
    if (getdvarint(@"hash_28825c0c0b691b0d", 0) == 1) {
        hexname = function_f28fd66285fa2c9(event);
        hashname = hashcat(@"hash_1e443aaa4347a9c", hexname);
        if (getdvarint(hashname, 0) == 1) {
            return;
        }
    }
    showsplash = scripts\mp\rank::function_e3dfd7e570749681(event);
    if (showsplash && !scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        extraparam = isdefined(eventinfo) ? eventinfo.extraparam : undefined;
        thread scripts\mp\events::killeventtextpopup(event, 1, undefined, extraparam);
    }
    if (scripts\mp\rank::function_34294184e90b96c(event)) {
        scripts\mp\awards::givemidmatchaward(event, objweapon, pointsoverride, xpoverride, var_51bdae03b05bc75e, dontwait, victim, cankillchain, streakinfo, var_827c276da1cdcf23, eventinfo);
    } else {
        giveunifiedpoints(event, objweapon, pointsoverride, xpoverride, victim, cankillchain, streakinfo, var_827c276da1cdcf23, eventinfo, var_339e50a026e4674f);
    }
    if (scripts\cp_mp\utility\game_utility::function_6c1fce6f6b8779d5() == "champion") {
        thread namespace_a5b4009d7c2e0b3d::doScoreEvent(event);
    }
    if (scripts\mp\potg::function_acab8b716476b589()) {
        if (isdefined(eventinfo) && istrue(eventinfo.var_f02e60455d9ce50f)) {
            return;
        }
        if (isdefined(victim)) {
            attackerdata = victim.attackerdata[self.guid];
            assertex(isdefined(attackerdata), "The victim of the score event has undefined attackerData. Consider removing the victim argument from your call to doScoreEvent(...) or ensuring the victim's data is well-formed.");
            psoffset = isdefined(attackerdata) ? attackerdata.psoffsettime : undefined;
            var_386245dad4e566f6 = attackerdata.firsttimedamaged;
            var_b91d5956ea4e402c = attackerdata.lasttimedamaged;
            scripts\mp\potg::processevent(event, var_386245dad4e566f6, var_b91d5956ea4e402c, psoffset);
            return;
        }
        scripts\mp\potg::processevent(event);
    }
}

// Namespace points / scripts\mp\utility\points
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89b
// Size: 0x66
function function_e3e3e81453fd788b(event, objweapon, victim) {
    if (!isdefined(level.var_ff4509ffa6e8acae)) {
        level.var_ff4509ffa6e8acae = spawnstruct();
        level.var_ff4509ffa6e8acae.var_e62ceeee8b598809 = 1;
    }
    doScoreEvent(event, objweapon, undefined, undefined, victim, undefined, undefined, undefined, undefined, undefined, level.var_ff4509ffa6e8acae);
}

// Namespace points / scripts\mp\utility\points
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x909
// Size: 0x4f0
function giveunifiedpoints(event, objweapon, pointsoverride, xpoverride, victim, cankillchain, streakinfo, var_ad8c6c5cc50af10b, eventinfo, var_339e50a026e4674f) {
    if (istrue(level.gameended)) {
        isvalidevent = 0;
        if (isarray(event)) {
            if (isnumber(level.gameendtime)) {
                if (event[1] <= level.gameendtime) {
                    isvalidevent = 1;
                    event = event[0];
                }
            }
        } else if (isdefined(event)) {
            isvalidevent = 1;
        }
        if (!isvalidevent) {
            return;
        }
    } else if (isarray(event)) {
        event = event[0];
    }
    if (!function_d03495fe6418377b(event)) {
        assertex(1, event);
        event = function_1823ff50bb28148d(event);
    }
    if (istrue(level.ignorescoring)) {
        var_587eb1f4e11a34f3 = 1;
        var_e7a7e20ec68138e3 = scripts\cp_mp\utility\game_utility::isbrstylegametype() && !scripts\mp\flags::gameflag("prematch_done");
        if (var_e7a7e20ec68138e3) {
            var_587eb1f4e11a34f3 = 0;
        }
        if (var_587eb1f4e11a34f3) {
            return;
        }
    }
    if (istrue(game["practiceRound"])) {
        return;
    }
    if (isdefined(pointsoverride)) {
        points = pointsoverride;
    } else {
        points = scripts\mp\rank::getscoreinfovalue(event);
        /#
            if (level.mapname != "<dev string:x1c>" && level.mapname != "<dev string:x2b>") {
                assertex(isdefined(points), "<dev string:x3f>" + function_3c8848a3a11b2553(event) + "<dev string:x60>");
            }
        #/
        if (!isdefined(points)) {
            points = 0;
        }
    }
    points = modifyunifiedpoints(event, points, objweapon);
    scripts\mp\gamescore::giveplayerscore(event, points, victim, eventinfo);
    if (isdefined(objweapon)) {
        weaponobj = scripts\mp\utility\weapon::mapweapon(objweapon);
        sweapon = getcompleteweaponname(weaponobj);
        thread scripts\mp\gamelogic::threadedsetweaponstatbyname(sweapon, points, "total_score_earned");
    }
    if (isdefined(streakinfo) && isdefined(streakinfo.score)) {
        streakinfo.score += points;
    }
    isassist = event == #"assist";
    iskill = event == #"kill";
    if (!istrue(var_ad8c6c5cc50af10b) && function_72886dac59580765(self, objweapon, event, eventinfo, cankillchain)) {
        if (scripts\cp_mp\utility\killstreak_utility::function_9f1dc821e9a8506() && getdvarint(@"hash_fde6241a6a888ee5", 0) == 1) {
            iskillstreakkillevent = isdefined(eventinfo) && istrue(eventinfo.iskillstreakkill);
            var_4057c6ccc0529d32 = scripts\mp\utility\killstreak::isjuggernaut();
            iskillstreakkill = var_4057c6ccc0529d32 || iskillstreakkillevent || isdefined(objweapon) && namespace_e0ee43ef2dddadaa::iskillstreakweapon(objweapon);
            if (iskillstreakkill) {
                points = int(points * getdvarfloat(@"hash_fbb908c0bf030802", 0.5));
            }
        }
        scripts\mp\killstreaks\killstreaks::givestreakpoints(event, 1, points);
    }
    supermultiplier = 1;
    if (iskill || isassist) {
        supermultiplier = function_fa5f24df7c838fe0(supermultiplier);
    }
    if (!istrue(level.superglobals.var_a33f6855d9867dbf) && !istrue(self.var_f405191d4605c15c)) {
        scripts\mp\supers::givesuperpoints(points, event, undefined, supermultiplier);
    }
    if (isdefined(level.var_5dfd73c97bf5d03d)) {
        [[ level.var_5dfd73c97bf5d03d ]](self, victim, event, points);
    }
    var_798ada8b24ba4887 = 1;
    if (isdefined(xpoverride) && xpoverride < 0) {
        var_798ada8b24ba4887 = 0;
    }
    if (var_798ada8b24ba4887) {
        xp = xpoverride;
        if (!isdefined(xp)) {
            if (isdefined(pointsoverride)) {
                xp = points;
            } else {
                xp = scripts\mp\rank::getscoreinfoxp(event);
            }
        }
        if (!isdefined(xp)) {
            xp = 0;
        }
        if (iskill) {
            var_9bcadacc6ecad1 = isdefined(objweapon) && objweapon hasattachment("gunperk_xp") || _hasperk("specialty_gunperk_xp");
            if (var_9bcadacc6ecad1) {
                xp += 20;
            }
            xp = sharekillxp(xp);
        }
        thread scripts\mp\rank::giverankxp(event, xp, objweapon, undefined, undefined, var_339e50a026e4674f, undefined, eventinfo);
    }
    thread scripts\mp\events::killeventtextpopup(event, 0);
    if (istrue(level.var_1e17e3480b1d264d) && isdefined(level.var_9c1e3c18b99409e9) && points > 0 && event != "br_kioskBuy") {
        /#
        #/
        self [[ level.var_9c1e3c18b99409e9 ]](points);
    }
    if (istrue(level.var_606eb45e074ff204)) {
        if (!isdefined(self.var_4c6852d3c7765d04)) {
            self.var_4c6852d3c7765d04 = 0;
        }
        if (!isdefined(points)) {
            points = 0;
        }
        self.var_4c6852d3c7765d04 += points;
        scripts\mp\perks\perks::function_2cb1405f41491297(points);
        scripts\mp\perks\perks::function_f2dbab6f947771f2();
        return;
    }
    if (namespace_708f627020de59d3::function_c0d385a09d173a36()) {
        namespace_708f627020de59d3::onplayerscore();
    }
}

// Namespace points / scripts\mp\utility\points
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe01
// Size: 0x403
function sharekillxp(inxp) {
    if (getdvarint(@"hash_97ad5e7b7a25f1ca", 1) == 0) {
        return inxp;
    }
    var_909fb4fd1b455b29 = 0;
    var_e11ba37bb136600d = inxp;
    returnval = inxp;
    players = level.players;
    if (issharedfuncdefined("game", "getTeamData")) {
        players = [[ getsharedfunc("game", "getTeamData") ]](self.team, "players");
    }
    if (players.size > 1) {
        switch (getgametype()) {
        case #"hash_a93dacd349d98a99":
        case #"hash_d82d642e83fb9772":
        case #"hash_1a5d186c17c00d3c":
        case #"hash_1b1eecd3863a50cf":
        case #"hash_21eed743fb721f4a":
        case #"hash_a1313b745c17c07e":
        case #"hash_aada280b52cbdd96":
        case #"hash_4d60179017f5a28a":
        case #"hash_515260130b210bff":
        case #"hash_aac44b0b52bacb8e":
        case #"hash_6efb0f59a62300fb":
        case #"hash_719dd4821355f699":
        case #"hash_7485fa6c474ec865":
        case #"hash_77eb1179a728005e":
        case #"hash_78ebb3b7ce8f864f":
        case #"hash_7a322834c148e09a":
        case #"hash_973d1db8b6644466":
        case #"hash_dd160d04d4a296a9":
        case #"hash_dd5b900f435d3f36":
        case #"hash_ea061d29bbd1f237":
        case #"hash_ec72fd25bbbac99e":
        case #"hash_f4a9126c03d3385b":
        case #"hash_fa0ed2f6bd4f4395":
        case #"hash_fa34c5f6bd6d4432":
        case #"hash_fa44d9f6bd7a2fa1":
        case #"hash_fa50b0f6bd82e972":
        case #"hash_fa7b69e7b63430d3": 
            var_774c32865ce6ed66 = getdvarfloat(@"hash_23ceb5f30cd9cf48", 0.8);
            var_e11ba37bb136600d *= (1 - var_774c32865ce6ed66) / (players.size - 1);
            var_909fb4fd1b455b29 = 1;
            returnval *= var_774c32865ce6ed66;
            break;
        case #"hash_25397d96e5bc8403":
        case #"hash_8f01ce022684fbc8": 
            var_281f5f544dfe29d6 = getdvarfloat(@"hash_94a2f41d316613ec", 0.65);
            var_e11ba37bb136600d *= (1 - var_281f5f544dfe29d6) / (players.size - 1);
            var_909fb4fd1b455b29 = 1;
            returnval *= var_281f5f544dfe29d6;
            break;
        case #"hash_c51506c10984515":
        case #"hash_fa0ed9f6bd4f4e9a":
        case #"hash_ddd385f0a27d71bb":
        case #"hash_ab00240b52e9ec5e":
        case #"hash_b9458959b10637f8":
        case #"hash_3696c16c262a0862":
        case #"hash_fb5b5e6c07253005": 
            break;
        case #"hash_5ff8e011d5b9d1c8": 
            if (getdvarint(@"hash_2167cbfc86b6839", 0) == 1) {
                var_774c32865ce6ed66 = getdvarfloat(@"hash_23ceb5f30cd9cf48", 0.8);
                var_e11ba37bb136600d *= (1 - var_774c32865ce6ed66) / (players.size - 1);
                var_909fb4fd1b455b29 = 1;
                returnval *= var_774c32865ce6ed66;
            }
            break;
        case #"hash_448b7248104bfa9c":
        case #"hash_c065cef60f38490a":
        case #"hash_ca6516c10db2c95": 
            var_cd4f215570e9f234 = getdvarfloat(@"hash_9a6b4d162b5aee8a", 0.9);
            var_e11ba37bb136600d *= (1 - var_cd4f215570e9f234) / (players.size - 1);
            var_909fb4fd1b455b29 = 1;
            returnval *= var_cd4f215570e9f234;
            break;
        default: 
            break;
        }
    }
    if (var_909fb4fd1b455b29) {
        foreach (player in players) {
            if (player != self) {
                player thread scripts\mp\rank::giverankxp("buddy_kill", var_e11ba37bb136600d, player.weapon, 1);
            }
        }
    }
    return returnval;
}

// Namespace points / scripts\mp\utility\points
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x120d
// Size: 0x1c8
function private function_72886dac59580765(var_127dab70c06a79e6, objweapon, event, eventinfo, cankillchain) {
    if (isagent(var_127dab70c06a79e6)) {
        return false;
    }
    if (level.gametype == "conf_v" && event != #"temp_v") {
        return false;
    }
    iskill = event == #"kill" || event == #"elimination_kill" || event == #"elimination_assist";
    iskillstreakkillevent = isdefined(eventinfo) && istrue(eventinfo.iskillstreakkill);
    var_4057c6ccc0529d32 = var_127dab70c06a79e6 scripts\mp\utility\killstreak::isjuggernaut();
    iskillstreakkill = var_4057c6ccc0529d32 || iskillstreakkillevent || isdefined(objweapon) && namespace_e0ee43ef2dddadaa::iskillstreakweapon(objweapon);
    var_caddf81c02734fa0 = function_caddf81c02734fa0(objweapon);
    hasscorestreak = var_127dab70c06a79e6 _hasperk("specialty_strategist") || var_127dab70c06a79e6 _hasperk("specialty_killstreak_to_scorestreak");
    var_1f79c5eb226f51e2 = function_423a6ac43d977bb6();
    if (istrue(var_1f79c5eb226f51e2)) {
        return false;
    }
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        return false;
    }
    if (iskillstreakkill && !_hasperk("specialty_chain_killstreaks")) {
        var_127dab70c06a79e6.pers["canKillChain"] = undefined;
    }
    if (!var_127dab70c06a79e6 scripts\cp_mp\utility\player_utility::_isalive()) {
        return false;
    }
    if (isdefined(objweapon) && !var_caddf81c02734fa0) {
        return false;
    }
    if (iskillstreakkill) {
        var_df795729dadcd508 = istrue(var_127dab70c06a79e6.pers["canKillChain"]);
        if (!var_df795729dadcd508 || var_df795729dadcd508 && !istrue(cankillchain)) {
            return false;
        }
    }
    if (!iskill && !hasscorestreak) {
        return false;
    }
    return true;
}

// Namespace points / scripts\mp\utility\points
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13de
// Size: 0x6c
function private modifyunifiedpoints(event, points, objweapon) {
    if (event == #"damage") {
        return 0;
    }
    if (isdefined(level.modifyunifiedpointscallback)) {
        points = [[ level.modifyunifiedpointscallback ]](points, event, self, objweapon);
    } else if (isdefined(self.point_scalar)) {
        points *= self.point_scalar;
    }
    return int(points);
}

// Namespace points / scripts\mp\utility\points
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1453
// Size: 0x11f
function displayscoreeventpoints(points, event) {
    if (getdvarint(@"hash_a3a1cab75dca6cc6", 0) == 1) {
        return;
    }
    if (istrue(level.codcasterenabled)) {
        foreach (player in level.players) {
            if (player iscodcaster()) {
                spectatingplayer = player getspectatingplayer();
                if (isdefined(spectatingplayer)) {
                    spectatingplayerclientnum = spectatingplayer getentitynumber();
                    clientnum = self getentitynumber();
                    if (spectatingplayerclientnum == clientnum) {
                        player thread scripts\mp\rank::scorepointspopup(points);
                        player thread scripts\mp\rank::scoreeventpopup(event);
                    }
                }
            }
        }
    }
    if (!istrue(level.var_bb8596fb319eb83e)) {
        var_dc03362b77c5058d = 0;
        if (issimultaneouskillenabled()) {
            var_dc03362b77c5058d = event == #"kill";
        }
        thread scripts\mp\rank::scorepointspopup(points, var_dc03362b77c5058d);
    }
}

// Namespace points / scripts\mp\utility\points
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x157a
// Size: 0x1a
function function_caddf81c02734fa0(objweapon) {
    if (!isdefined(objweapon)) {
        return false;
    }
    return !scripts\mp\utility\weapon::isvehicleweapon(objweapon);
}

// Namespace points / scripts\mp\utility\points
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x159d
// Size: 0x6a
function isforcekillstreakprogressweapon(objweapon) {
    if (!isdefined(objweapon)) {
        return false;
    }
    if (isstring(objweapon)) {
        objweapon = makeweapon(objweapon);
    }
    switch (objweapon.basename) {
    case #"hash_405f9521b5ee8402":
    case #"hash_448b7248104bfa9c":
    case #"hash_807ae3204119bd41":
    case #"hash_aacdf3a6d5b91585": 
        return true;
    }
    return false;
}

// Namespace points / scripts\mp\utility\points
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1610
// Size: 0x3
function function_423a6ac43d977bb6() {
    return false;
}

// Namespace points / scripts\mp\utility\points
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x161c
// Size: 0x31
function function_fa5f24df7c838fe0(multiplier) {
    if (_hasperk("specialty_underkill")) {
        multiplier *= getdvarfloat(@"hash_1cd604fc4c6912", 3);
    }
    return multiplier;
}

// Namespace points / scripts\mp\utility\points
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1656
// Size: 0x3a
function function_9c1e3c18b99409e9(cash) {
    if (cash < 10) {
        cash = int(cash);
    } else {
        cash = int(max(cash / 10, 1));
    }
    scripts\mp\gametypes\br_plunder::playerplunderpickup(cash, undefined, 1);
}

// Namespace points / scripts\mp\utility\points
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1698
// Size: 0x77
function function_2a66e9acc30896c(team, event) {
    assert(isdefined(team));
    foreach (player in getteamdata(team, "players")) {
        player doScoreEvent(event);
    }
}

