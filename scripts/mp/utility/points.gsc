// mwiii decomp prototype
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

// Namespace points/namespace_48a08c5037514e04
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4dd
// Size: 0x11
function function_8e9b2e8ba0328e3c() {
    level.var_97e29f66f7229f48 = &doScoreEvent;
}

// Namespace points/namespace_48a08c5037514e04
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4f5
// Size: 0x81
function givestreakpointswithtext(event, objweapon, var_91185ff4a2e16a72) {
    if (istrue(level.ignorescoring)) {
        return;
    }
    if (isdefined(var_91185ff4a2e16a72)) {
        points = var_91185ff4a2e16a72;
    } else {
        points = namespace_62c556437da28f50::getscoreinfovalue(event);
        /#
            assertex(isdefined(points), "giveStreakPointsWithText() with event "" + function_3c8848a3a11b2553(event) + "", but that event doesn't exist in the gametype's scoreeventlist asset");
        #/
    }
    points = modifyunifiedpoints(event, points, objweapon);
    namespace_58a74e7d54b56e8d::givestreakpoints(event, points);
    displayscoreeventpoints(points, event);
}

// Namespace points/namespace_48a08c5037514e04
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57d
// Size: 0x81
function givexpwithtext(event, var_91185ff4a2e16a72) {
    if (istrue(level.ignorescoring)) {
        return;
    }
    /#
        assert(function_d03495fe6418377b(event));
    #/
    points = undefined;
    if (isdefined(var_91185ff4a2e16a72)) {
        points = var_91185ff4a2e16a72;
    } else {
        points = namespace_62c556437da28f50::getscoreinfovalue(event);
        /#
            assertex(isdefined(points), "giveXPWithText() with event "" + function_3c8848a3a11b2553(event) + "", but that event doesn't exist in the gametype's scoreeventlist asset");
        #/
    }
    thread namespace_62c556437da28f50::giverankxp(event, points);
    thread namespace_62c556437da28f50::scoreeventpopup(event);
}

// Namespace points/namespace_48a08c5037514e04
// Params 12, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x605
// Size: 0x28f
function doScoreEvent(event, objweapon, var_91185ff4a2e16a72, var_4b5a99c16abfdfb1, victim, var_51bdae03b05bc75e, var_30e33d4e4669117f, canKillChain, streakinfo, var_827c276da1cdcf23, var_7ec7671a1e0c788f, var_339e50a026e4674f) {
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
        var_6eec53a074d33065 = function_f28fd66285fa2c9(event);
        var_69a6fcf999f750be = function_2ef675c13ca1c4af(@"hash_1e443aaa4347a9c", var_6eec53a074d33065);
        if (getdvarint(var_69a6fcf999f750be, 0) == 1) {
            return;
        }
    }
    showsplash = namespace_62c556437da28f50::function_e3dfd7e570749681(event);
    if (showsplash && !namespace_36f464722d326bbe::isBRStyleGameType()) {
        if (isdefined(var_7ec7671a1e0c788f)) {
            goto LOC_00000189;
        }
        var_715403f4ba13470a = undefined;
        thread namespace_391de535501b0143::killeventtextpopup(event, 1, undefined, var_715403f4ba13470a);
    }
    if (namespace_62c556437da28f50::function_34294184e90b96c(event)) {
        namespace_46006c5769c2ac90::givemidmatchaward(event, objweapon, var_91185ff4a2e16a72, var_4b5a99c16abfdfb1, var_51bdae03b05bc75e, var_30e33d4e4669117f, victim, canKillChain, streakinfo, var_827c276da1cdcf23, var_7ec7671a1e0c788f);
    } else {
        giveunifiedpoints(event, objweapon, var_91185ff4a2e16a72, var_4b5a99c16abfdfb1, victim, canKillChain, streakinfo, var_827c276da1cdcf23, var_7ec7671a1e0c788f, var_339e50a026e4674f);
    }
    if (namespace_36f464722d326bbe::function_6c1fce6f6b8779d5() == "champion") {
        thread namespace_a5b4009d7c2e0b3d::doScoreEvent(event);
    }
    if (namespace_ab70c875589b8f6a::function_acab8b716476b589()) {
        if (isdefined(var_7ec7671a1e0c788f) && istrue(var_7ec7671a1e0c788f.var_f02e60455d9ce50f)) {
            return;
        }
        if (isdefined(victim)) {
            attackerdata = victim.attackerdata[self.guid];
            /#
                assertex(isdefined(attackerdata), "The victim of the score event has undefined attackerData. Consider removing the victim argument from your call to doScoreEvent(...) or ensuring the victim's data is well-formed.");
            #/
            if (isdefined(attackerdata)) {
                goto LOC_00000259;
            }
            var_5d459e1dea2385a3 = undefined;
            var_386245dad4e566f6 = attackerdata.firsttimedamaged;
            var_b91d5956ea4e402c = attackerdata.lasttimedamaged;
            namespace_ab70c875589b8f6a::processevent(event, var_386245dad4e566f6, var_b91d5956ea4e402c, var_5d459e1dea2385a3);
        } else {
            namespace_ab70c875589b8f6a::processevent(event);
        }
    }
}

// Namespace points/namespace_48a08c5037514e04
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89b
// Size: 0x67
function function_e3e3e81453fd788b(event, objweapon, victim) {
    if (!isdefined(level.var_ff4509ffa6e8acae)) {
        level.var_ff4509ffa6e8acae = spawnstruct();
        level.var_ff4509ffa6e8acae.var_e62ceeee8b598809 = 1;
    }
    doScoreEvent(event, objweapon, undefined, undefined, victim, undefined, undefined, undefined, undefined, undefined, level.var_ff4509ffa6e8acae);
}

// Namespace points/namespace_48a08c5037514e04
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x909
// Size: 0x4f1
function giveunifiedpoints(event, objweapon, var_91185ff4a2e16a72, var_4b5a99c16abfdfb1, victim, canKillChain, streakinfo, var_ad8c6c5cc50af10b, var_7ec7671a1e0c788f, var_339e50a026e4674f) {
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
        /#
            assertex(1, event);
        #/
        event = function_1823ff50bb28148d(event);
    }
    if (istrue(level.ignorescoring)) {
        var_587eb1f4e11a34f3 = 1;
        var_e7a7e20ec68138e3 = namespace_36f464722d326bbe::isBRStyleGameType() && !namespace_4b0406965e556711::gameflag("prematch_done");
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
    if (isdefined(var_91185ff4a2e16a72)) {
        points = var_91185ff4a2e16a72;
    } else {
        points = namespace_62c556437da28f50::getscoreinfovalue(event);
        /#
            if (level.mapname != "<unknown string>" && level.mapname != "<unknown string>") {
                /#
                    assertex(isdefined(points), "<unknown string>" + function_3c8848a3a11b2553(event) + "<unknown string>");
                #/
            }
        #/
        if (!isdefined(points)) {
            points = 0;
        }
    }
    points = modifyunifiedpoints(event, points, objweapon);
    namespace_e8a49b70d0769b66::giveplayerscore(event, points, victim, var_7ec7671a1e0c788f);
    if (isdefined(objweapon)) {
        weaponobj = namespace_68e641469fde3fa7::mapweapon(objweapon);
        sweapon = getcompleteweaponname(weaponobj);
        thread namespace_d576b6dc7cef9c62::threadedsetweaponstatbyname(sweapon, points, "total_score_earned");
    }
    if (isdefined(streakinfo) && isdefined(streakinfo.score)) {
        streakinfo.score = streakinfo.score + points;
    }
    var_c9db681c20feffe2 = event == #"assist";
    var_ce5497ef5aa384f5 = event == #"kill";
    if (!istrue(var_ad8c6c5cc50af10b) && function_72886dac59580765(self, objweapon, event, var_7ec7671a1e0c788f, canKillChain)) {
        if (namespace_9abe40d2af041eb2::function_9f1dc821e9a8506() && getdvarint(@"hash_fde6241a6a888ee5", 0) == 1) {
            iskillstreakkillevent = isdefined(var_7ec7671a1e0c788f) && istrue(var_7ec7671a1e0c788f.var_e0badec2b1517ca3);
            var_4057c6ccc0529d32 = namespace_a2f809133c566621::isjuggernaut();
            var_e0badec2b1517ca3 = var_4057c6ccc0529d32 || iskillstreakkillevent || isdefined(objweapon) && namespace_e0ee43ef2dddadaa::iskillstreakweapon(objweapon);
            if (var_e0badec2b1517ca3) {
                points = int(points * getdvarfloat(@"hash_fbb908c0bf030802", 0.5));
            }
        }
        namespace_58a74e7d54b56e8d::givestreakpoints(event, 1, points);
    }
    var_6a97ebc2e0f33b5f = 1;
    if (var_ce5497ef5aa384f5 || var_c9db681c20feffe2) {
        var_6a97ebc2e0f33b5f = function_fa5f24df7c838fe0(var_6a97ebc2e0f33b5f);
    }
    if (!istrue(level.superglobals.var_a33f6855d9867dbf) && !istrue(self.var_f405191d4605c15c)) {
        namespace_85d036cb78063c4a::givesuperpoints(points, event, undefined, var_6a97ebc2e0f33b5f);
    }
    if (isdefined(level.var_5dfd73c97bf5d03d)) {
        [[ level.var_5dfd73c97bf5d03d ]](self, victim, event, points);
    }
    var_798ada8b24ba4887 = 1;
    if (isdefined(var_4b5a99c16abfdfb1) && var_4b5a99c16abfdfb1 < 0) {
        var_798ada8b24ba4887 = 0;
    }
    if (var_798ada8b24ba4887) {
        xp = var_4b5a99c16abfdfb1;
        if (!isdefined(xp)) {
            if (isdefined(var_91185ff4a2e16a72)) {
                xp = points;
            } else {
                xp = namespace_62c556437da28f50::getscoreinfoxp(event);
            }
        }
        if (!isdefined(xp)) {
            xp = 0;
        }
        if (var_ce5497ef5aa384f5) {
            var_9bcadacc6ecad1 = isdefined(objweapon) && objweapon hasattachment("gunperk_xp") || _hasperk("specialty_gunperk_xp");
            if (var_9bcadacc6ecad1) {
                xp = xp + 20;
            }
            xp = function_97ee90a70bce34ec(xp);
        }
        thread namespace_62c556437da28f50::giverankxp(event, xp, objweapon, undefined, undefined, var_339e50a026e4674f, undefined, var_7ec7671a1e0c788f);
    }
    thread namespace_391de535501b0143::killeventtextpopup(event, 0);
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
        self.var_4c6852d3c7765d04 = self.var_4c6852d3c7765d04 + points;
        namespace_b6a8027f477010e1::function_2cb1405f41491297(points);
        namespace_b6a8027f477010e1::function_f2dbab6f947771f2();
    } else if (namespace_708f627020de59d3::function_c0d385a09d173a36()) {
        namespace_708f627020de59d3::onplayerscore();
    }
}

// Namespace points/namespace_48a08c5037514e04
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe01
// Size: 0x404
function function_97ee90a70bce34ec(var_acf27fb62b74734a) {
    if (getdvarint(@"hash_97ad5e7b7a25f1ca", 1) == 0) {
        return var_acf27fb62b74734a;
    }
    var_909fb4fd1b455b29 = 0;
    var_e11ba37bb136600d = var_acf27fb62b74734a;
    var_62563a3ab1624a5a = var_acf27fb62b74734a;
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
            var_e11ba37bb136600d = var_e11ba37bb136600d * (1 - var_774c32865ce6ed66) / (players.size - 1);
            var_909fb4fd1b455b29 = 1;
            var_62563a3ab1624a5a = var_62563a3ab1624a5a * var_774c32865ce6ed66;
            break;
        case #"hash_25397d96e5bc8403":
        case #"hash_8f01ce022684fbc8":
            var_281f5f544dfe29d6 = getdvarfloat(@"hash_94a2f41d316613ec", 0.65);
            var_e11ba37bb136600d = var_e11ba37bb136600d * (1 - var_281f5f544dfe29d6) / (players.size - 1);
            var_909fb4fd1b455b29 = 1;
            var_62563a3ab1624a5a = var_62563a3ab1624a5a * var_281f5f544dfe29d6;
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
                var_e11ba37bb136600d = var_e11ba37bb136600d * (1 - var_774c32865ce6ed66) / (players.size - 1);
                var_909fb4fd1b455b29 = 1;
                var_62563a3ab1624a5a = var_62563a3ab1624a5a * var_774c32865ce6ed66;
            }
            break;
        case #"hash_448b7248104bfa9c":
        case #"hash_c065cef60f38490a":
        case #"hash_ca6516c10db2c95":
            var_cd4f215570e9f234 = getdvarfloat(@"hash_9a6b4d162b5aee8a", 0.9);
            var_e11ba37bb136600d = var_e11ba37bb136600d * (1 - var_cd4f215570e9f234) / (players.size - 1);
            var_909fb4fd1b455b29 = 1;
            var_62563a3ab1624a5a = var_62563a3ab1624a5a * var_cd4f215570e9f234;
            break;
        default:
            break;
        }
    }
    if (var_909fb4fd1b455b29) {
        foreach (player in players) {
            if (player != self) {
                player thread namespace_62c556437da28f50::giverankxp("buddy_kill", var_e11ba37bb136600d, player.weapon, 1);
            }
        }
    }
    return var_62563a3ab1624a5a;
}

// Namespace points/namespace_48a08c5037514e04
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x120d
// Size: 0x1c9
function private function_72886dac59580765(var_127dab70c06a79e6, objweapon, event, var_7ec7671a1e0c788f, canKillChain) {
    if (isagent(var_127dab70c06a79e6)) {
        return 0;
    }
    if (level.gametype == "conf_v" && event != #"temp_v") {
        return 0;
    }
    var_ce5497ef5aa384f5 = event == #"kill" || event == #"hash_49ee3d646e1fd20f" || event == #"hash_84f67f0bec9e361c";
    iskillstreakkillevent = isdefined(var_7ec7671a1e0c788f) && istrue(var_7ec7671a1e0c788f.var_e0badec2b1517ca3);
    var_4057c6ccc0529d32 = var_127dab70c06a79e6 namespace_a2f809133c566621::isjuggernaut();
    var_e0badec2b1517ca3 = var_4057c6ccc0529d32 || iskillstreakkillevent || isdefined(objweapon) && namespace_e0ee43ef2dddadaa::iskillstreakweapon(objweapon);
    var_caddf81c02734fa0 = function_caddf81c02734fa0(objweapon);
    var_1abbd3b2b53279a5 = var_127dab70c06a79e6 _hasperk("specialty_strategist") || var_127dab70c06a79e6 _hasperk("specialty_killstreak_to_scorestreak");
    var_1f79c5eb226f51e2 = function_423a6ac43d977bb6();
    if (istrue(var_1f79c5eb226f51e2)) {
        return 0;
    }
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        return 0;
    }
    if (var_e0badec2b1517ca3 && !_hasperk("specialty_chain_killstreaks")) {
        var_127dab70c06a79e6.pers["canKillChain"] = undefined;
    }
    if (!var_127dab70c06a79e6 namespace_f8065cafc523dba5::_isalive()) {
        return 0;
    }
    if (isdefined(objweapon) && !var_caddf81c02734fa0) {
        return 0;
    }
    if (var_e0badec2b1517ca3) {
        var_df795729dadcd508 = istrue(var_127dab70c06a79e6.pers["canKillChain"]);
        if (!var_df795729dadcd508 || var_df795729dadcd508 && !istrue(canKillChain)) {
            return 0;
        }
    }
    if (!var_ce5497ef5aa384f5 && !var_1abbd3b2b53279a5) {
        return 0;
    }
    return 1;
}

// Namespace points/namespace_48a08c5037514e04
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13de
// Size: 0x6d
function private modifyunifiedpoints(event, points, objweapon) {
    if (event == #"damage") {
        return 0;
    }
    if (isdefined(level.modifyunifiedpointscallback)) {
        points = [[ level.modifyunifiedpointscallback ]](points, event, self, objweapon);
    } else if (isdefined(self.var_5cdb0bfad9d3e64e)) {
        points = points * self.var_5cdb0bfad9d3e64e;
    }
    return int(points);
}

// Namespace points/namespace_48a08c5037514e04
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1453
// Size: 0x120
function displayscoreeventpoints(points, event) {
    if (getdvarint(@"hash_a3a1cab75dca6cc6", 0) == 1) {
        return;
    }
    if (istrue(level.codcasterenabled)) {
        foreach (player in level.players) {
            if (player iscodcaster()) {
                var_13c5603d4beea2fc = player getspectatingplayer();
                if (isdefined(var_13c5603d4beea2fc)) {
                    var_917b3708f1e070d9 = var_13c5603d4beea2fc getentitynumber();
                    clientnum = self getentitynumber();
                    if (var_917b3708f1e070d9 == clientnum) {
                        player thread namespace_62c556437da28f50::scorepointspopup(points);
                        player thread namespace_62c556437da28f50::scoreeventpopup(event);
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
        thread namespace_62c556437da28f50::scorepointspopup(points, var_dc03362b77c5058d);
    }
}

// Namespace points/namespace_48a08c5037514e04
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x157a
// Size: 0x1b
function function_caddf81c02734fa0(objweapon) {
    if (!isdefined(objweapon)) {
        return 0;
    }
    return !namespace_68e641469fde3fa7::isvehicleweapon(objweapon);
}

// Namespace points/namespace_48a08c5037514e04
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x159d
// Size: 0x6b
function isforcekillstreakprogressweapon(objweapon) {
    if (!isdefined(objweapon)) {
        return 0;
    }
    if (isstring(objweapon)) {
        objweapon = makeweapon(objweapon);
    }
    switch (objweapon.basename) {
    case #"hash_405f9521b5ee8402":
    case #"hash_448b7248104bfa9c":
    case #"hash_807ae3204119bd41":
    case #"hash_aacdf3a6d5b91585":
        return 1;
        break;
    }
    return 0;
}

// Namespace points/namespace_48a08c5037514e04
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1610
// Size: 0x4
function function_423a6ac43d977bb6() {
    return 0;
}

// Namespace points/namespace_48a08c5037514e04
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x161c
// Size: 0x32
function function_fa5f24df7c838fe0(multiplier) {
    if (_hasperk("specialty_underkill")) {
        multiplier = multiplier * getdvarfloat(@"hash_1cd604fc4c6912", 3);
    }
    return multiplier;
}

// Namespace points/namespace_48a08c5037514e04
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1656
// Size: 0x3b
function function_9c1e3c18b99409e9(cash) {
    if (cash < 10) {
        cash = int(cash);
    } else {
        cash = int(max(cash / 10, 1));
    }
    namespace_c6ccccd95254983f::playerplunderpickup(cash, undefined, 1);
}

// Namespace points/namespace_48a08c5037514e04
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1698
// Size: 0x78
function function_2a66e9acc30896c(team, event) {
    /#
        assert(isdefined(team));
    #/
    foreach (player in getteamdata(team, "players")) {
        player doScoreEvent(event);
    }
}

