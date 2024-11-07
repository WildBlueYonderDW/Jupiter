#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\throttle.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using scripts\common\callbacks.gsc;
#using script_3f8889c16399185c;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\weaponrank.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\utility\weapon.gsc;
#using script_2669878cf5a1b6bc;
#using script_4a6760982b403bad;
#using scripts\mp\flags.gsc;
#using scripts\mp\playerlogic.gsc;
#using script_6775ad452d13858;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\analyticslog.gsc;

#namespace rank;

// Namespace rank / scripts\mp\rank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa99
// Size: 0x38f
function init() {
    level.scoreinfo = [];
    level.playlistxpscale = function_e3ef0908b595e8e1();
    var_1a6adab6eb352e70 = function_5d1c0ff7078f3160();
    if (var_1a6adab6eb352e70 && (level.playlistxpscale > 4 || level.playlistxpscale < 0)) {
        exitlevel(0);
    }
    addglobalrankxpmultiplier(level.playlistxpscale, "online_mp_xpscale");
    var_2f470c4c8dc44884 = getdvarfloat(@"hash_376c97f27d1ea7fe", 1);
    if (var_2f470c4c8dc44884 > 0 && var_2f470c4c8dc44884 < 4) {
        level.var_2f470c4c8dc44884 = var_2f470c4c8dc44884;
    }
    level.ranktable = [];
    level.weaponranktable = [];
    ranktablebundle = function_766b80da1f882fc3();
    level.var_e0e30c15f736bd96 = ranktablebundle.var_e0e30c15f736bd96;
    level.maxrank = ranktablebundle.var_3f2a88f2202def78;
    level.maxelderrank = ranktablebundle.maxelderrank;
    for (rankid = 0; rankid <= level.maxrank; rankid++) {
        rank = getrankbundle(ranktablebundle.ranklist[rankid].rank);
        level.ranktable[rankid][0] = rank.minxp;
        level.ranktable[rankid][1] = rank.xptonext;
        level.ranktable[rankid][2] = rank.maxxp;
        assertex(rankid == 0 || rank.minxp == level.ranktable[rankid - 1][2], "<dev string:x1c>" + rankid);
        assertex(rank.minxp + rank.xptonext == rank.maxxp, "<dev string:x5e>");
    }
    level.var_cc985bc5548342e8 = getdvarint(hashcat(@"scr_", getgametype(), "_xp_dr_enabled_rank"), 0) == 1;
    level.var_9ca8191d077daebe = getdvarint(hashcat(@"scr_", getgametype(), "_xp_dr_enabled_weapon"), 0) == 1;
    level.var_272c8fb7f8a58135 = getdvarint(hashcat(@"scr_", getgametype(), "_xp_dr_lower"), 25000);
    level.var_fe4db4ab7ad9d95e = getdvarint(hashcat(@"scr_", getgametype(), "_xp_dr_upper"), 40000);
    level.var_bd959547d81ba9f6 = level.var_fe4db4ab7ad9d95e - level.var_272c8fb7f8a58135;
    level.var_ce487746206452f4 = getdvarfloat(hashcat(@"scr_", getgametype(), "_xp_dr_lower_rate"), 0.75);
    level.var_79c0b5f1954d30c9 = getdvarfloat(hashcat(@"scr_", getgametype(), "_xp_dr_upper_rate"), 0.25);
    avglength = getdvarint(hashcat(@"scr_", getgametype(), "_xp_dr_avg_length"), 0);
    if (avglength == 0) {
        avglength = gettimelimit();
    }
    level.var_6677795065862d93 = avglength / 3600;
    function_b560222a9aa3c942();
    scripts\mp\weaponrank::init();
    scripts\mp\utility\spawn_event_aggregator::registeronplayerspawncallback(&onplayerspawned);
    level.prestigeextras = [];
    level thread onplayerconnect();
}

// Namespace rank / scripts\mp\rank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe30
// Size: 0x17
function function_377a94f711d96927(type) {
    return isdefined(level.scoreinfo[type]);
}

// Namespace rank / scripts\mp\rank
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe50
// Size: 0x3d
function registerscoreinfomultiplier(type, multiplier) {
    if (!function_d03495fe6418377b(type)) {
        assertex(1, type);
        type = function_1823ff50bb28148d(type);
    }
    level.scoreinfo_multiplier[type] = multiplier;
}

// Namespace rank / scripts\mp\rank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe95
// Size: 0x3e
function function_6d17f84162f0d8f0(type) {
    if (!function_d03495fe6418377b(type)) {
        assertex(1, type);
        type = function_1823ff50bb28148d(type);
    }
    return default_to(level.scoreinfo_multiplier[type], 1);
}

// Namespace rank / scripts\mp\rank
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xedc
// Size: 0x1a6
function registerscoreinfo(type, category, value) {
    if (!function_d03495fe6418377b(type)) {
        assertex(1, type);
        type = function_1823ff50bb28148d(type);
    }
    if (!function_d03495fe6418377b(category)) {
        assertex(1, category);
        category = function_1823ff50bb28148d(category);
    }
    if (category == #"value") {
        valueoverride = getdvarint(hashcat(@"hash_655cd9f8aa8e671a", function_f28fd66285fa2c9(type), "_score_override"), -1);
        if (valueoverride >= 0) {
            value = valueoverride;
        }
        level.scoreinfo_value[type] = value;
        if (type == #"kill" || type == #"cache") {
            setomnvar("ui_game_type_kill_value", int(value));
        }
        return;
    }
    if (category == #"xp") {
        valueoverride = getdvarint(hashcat(@"hash_655cd9f8aa8e671a", function_f28fd66285fa2c9(type), "_xp_override"), -1);
        if (valueoverride >= 0) {
            value = valueoverride;
        }
        level.scoreinfo_xp[type] = value;
        return;
    }
    if (category == #"hash_6dd3d93bbf03abc6") {
        level.var_f749dda4bf7912b[type] = value;
        return;
    }
    if (category == #"hash_afa3cfee9cf8b4c6") {
        level.var_6e43c80aedbeec75[type] = value;
        return;
    }
    if (category == #"hash_582866801a05178b") {
        level.var_ac143fe8d620124e[type] = value;
        return;
    }
    if (category == #"hash_2a95da1330928b16") {
        level.var_8511c09177d02b1[type] = value;
        return;
    }
    level.scoreinfo[type][category] = value;
}

// Namespace rank / scripts\mp\rank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x108a
// Size: 0x33
function getscoreinfovalue(type) {
    if (!function_d03495fe6418377b(type)) {
        assertex(1, type);
        type = function_1823ff50bb28148d(type);
    }
    return level.scoreinfo_value[type];
}

// Namespace rank / scripts\mp\rank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10c6
// Size: 0x5f
function getscoreinfoxp(type) {
    if (!function_d03495fe6418377b(type)) {
        assertex(1, type);
        type = function_1823ff50bb28148d(type);
    }
    if (isplayer(self)) {
        xpoverride = self function_b2617441d2b73e0b(type, level.scoreeventlist);
        if (isdefined(xpoverride)) {
            return xpoverride;
        }
    }
    return level.scoreinfo_xp[type];
}

// Namespace rank / scripts\mp\rank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x112e
// Size: 0x34
function function_34294184e90b96c(type) {
    if (!function_d03495fe6418377b(type)) {
        assertex(1, type);
        type = function_1823ff50bb28148d(type);
    }
    return istrue(level.var_f749dda4bf7912b[type]);
}

// Namespace rank / scripts\mp\rank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x116b
// Size: 0x34
function function_e3dfd7e570749681(type) {
    if (!function_d03495fe6418377b(type)) {
        assertex(1, type);
        type = function_1823ff50bb28148d(type);
    }
    return istrue(level.var_ac143fe8d620124e[type]);
}

// Namespace rank / scripts\mp\rank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11a8
// Size: 0x33
function function_b2425a8c88e4a460(type) {
    if (!function_d03495fe6418377b(type)) {
        assertex(1, type);
        type = function_1823ff50bb28148d(type);
    }
    return level.var_8511c09177d02b1[type];
}

// Namespace rank / scripts\mp\rank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11e4
// Size: 0x38
function function_1e00d01d19fde519(type) {
    if (!function_d03495fe6418377b(type)) {
        assertex(1, type);
        type = function_1823ff50bb28148d(type);
    }
    return getscoreinfocategory(type, #"hash_9ef9bbcd1edc198b");
}

// Namespace rank / scripts\mp\rank
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1225
// Size: 0xeb
function getscoreinfocategory(type, category) {
    if (!function_d03495fe6418377b(type)) {
        assertex(1, type);
        type = function_1823ff50bb28148d(type);
    }
    if (!function_d03495fe6418377b(category)) {
        assertex(1, category);
        category = function_1823ff50bb28148d(category);
    }
    if (istrue(level.removekilleventsplash) && !isdefined(level.scoreinfo[type])) {
        return undefined;
    }
    if (category == #"value") {
        return getscoreinfovalue(type);
    } else if (category == #"xp") {
        return getscoreinfoxp(type);
    } else if (category == #"hash_6dd3d93bbf03abc6") {
        return function_34294184e90b96c(type);
    } else if (category == #"hash_582866801a05178b") {
        return function_e3dfd7e570749681(type);
    }
    if (!isdefined(level.scoreinfo[type])) {
        return undefined;
    }
    return level.scoreinfo[type][category];
}

// Namespace rank / scripts\mp\rank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1319
// Size: 0x497
function onplayerconnect() {
    for (;;) {
        level waittill("connected", player);
        if (!isai(player)) {
            if (level.playerxpenabled) {
                player.pers["rankxp"] = player getplayerdata(level.loadoutsgroup, "squadMembers", "player_xp");
                prestige = player getplayerdata(level.loadoutsgroup, "squadMembers", "season_rank");
                if (!isdefined(player.pers["xpEarnedThisMatch"])) {
                    player.pers["xpEarnedThisMatch"] = 0;
                }
            } else {
                prestige = 0;
                player.pers["rankxp"] = 0;
            }
        } else {
            prestige = 0;
            player.pers["rankxp"] = 0;
        }
        player.pers["prestige"] = prestige;
        if (player.pers["rankxp"] < 0) {
            player.pers["rankxp"] = 0;
        }
        rankid = player getrankforxp(player getrankxp());
        player.pers["rank"] = rankid;
        player setrank(rankid, prestige);
        player.pers["participation"] = 0;
        player.scoreupdatetotal = 0;
        player.scorepointsqueue = 0;
        player.scoreeventqueue = [];
        player.postgamepromotion = 0;
        player setclientdvar(@"hash_803bee4022a48b56", 0);
        if (!isdefined(player.pers["summary"])) {
            player.pers["summary"] = [];
            player.pers["summary"]["xp"] = 0;
            player.pers["summary"]["score"] = 0;
            player.pers["summary"]["challenge"] = 0;
            player.pers["summary"]["match"] = 0;
            player.pers["summary"]["misc"] = 0;
            player.pers["summary"]["medal"] = 0;
            player.pers["summary"]["bonusXP"] = 0;
            player.pers["summary"]["weaponXP"] = 0;
            player.pers["summary"]["operatorXP"] = 0;
            player.pers["summary"]["clanXP"] = 0;
            player.pers["summary"]["battlepassXP"] = 0;
        }
        if (!isdefined(player.pers["aarData"])) {
            player.pers["aarData"]["combat_xp"] = 0;
            player.pers["aarData"]["support_xp"] = 0;
            player.pers["aarData"]["strategy_xp"] = 0;
            player.pers["aarData"]["logistics_xp"] = 0;
            player.pers["aarData"]["recon_xp"] = 0;
            player.pers["aarData"]["use_featured_operator_skin_xp"] = 0;
        }
        player setclientdvar(@"hash_cbb22e2fb1a57873", 0);
        if (isdefined(level.gametypebundle) && isdefined(level.gametypebundle.var_d20acad05758f0d8)) {
            player setclientdvar(@"hash_6662b40ecc02a63c", level.gametypebundle.var_d20acad05758f0d8 == "battleroyale_ftue");
        }
        if (level.playerxpenabled) {
            partyxpscale = getdvarint(@"online_mp_party_xpscale");
            isinparty = player getprivatepartysize() > 1;
            if (isinparty) {
                player addrankxpmultiplier(partyxpscale, "online_mp_party_xpscale");
            }
            if (player getplayerdata(level.var_5d69837cf4db0407, "prestigeDoubleWeaponXp")) {
                player.prestigedoubleweaponxp = 1;
            } else {
                player.prestigedoubleweaponxp = 0;
            }
        }
        player.scoreeventcount = 0;
        player.scoreeventlistindex = 0;
        player setclientomnvar("ui_score_event_control", -1);
        player setclientomnvar("ui_potg_score_event_control", -1);
    }
}

// Namespace rank / scripts\mp\rank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17b8
// Size: 0x7b
function onplayerspawned() {
    if (isai(self)) {
        self.pers["rankxp"] = scripts\mp\bots\bots_util::get_rank_xp_for_bot();
    } else if (!level.playerxpenabled) {
        self.pers["rankxp"] = 0;
    } else {
        assertex(isdefined(self.class), "<dev string:xa1>");
        assertex(isdefined(self.class_num), "<dev string:xc3>");
    }
    playerupdaterank();
}

// Namespace rank / scripts\mp\rank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x183b
// Size: 0xc0
function playerupdaterank() {
    rankxp = self.pers["rankxp"];
    if (rankxp < 0) {
        rankxp = 0;
        self.pers["rankxp"] = 0;
    }
    rankid = getrankforxp(rankxp);
    self.pers["rank"] = rankid;
    if (isai(self) || !isdefined(self.pers["prestige"])) {
        if (level.playerxpenabled && isdefined(self.bufferedstats)) {
            prestige = getprestigelevel();
        } else {
            prestige = 0;
        }
        self setrank(rankid, prestige);
        self.pers["prestige"] = prestige;
    }
}

// Namespace rank / scripts\mp\rank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1903
// Size: 0x85
function tryresetrankxp() {
    assertex(isdefined(self.class), "<dev string:xa1>");
    if (issubstr(self.class, "custom")) {
        if (!level.playerxpenabled) {
            self.pers["rankxp"] = 0;
            return;
        }
        if (isai(self)) {
            self.pers["rankxp"] = 0;
            return;
        }
        assertex(isdefined(self.class_num), "<dev string:xc3>");
    }
}

// Namespace rank / scripts\mp\rank
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x1990
// Size: 0x2f1
function giverankxp(type, value, objweapon, suppresspopup, forceimmediate, var_339e50a026e4674f, var_b01aca3236595958, eventinfo) {
    self endon("disconnect");
    /#
        if (isdefined(level.var_55e0b414e3671f70) && istrue(level.var_55e0b414e3671f70.var_a5b0c4131fba9805)) {
            logstring("<dev string:xe9>" + value + "<dev string:xfc>" + function_3c8848a3a11b2553(type));
        }
    #/
    if (isdefined(self.owner) && !isbot(self) && self != self.owner) {
        self.owner giverankxp(type, value, objweapon, suppresspopup, forceimmediate, var_339e50a026e4674f, var_b01aca3236595958, eventinfo);
        return;
    }
    if (isai(self) || !isplayer(self)) {
        return;
    }
    if (!isdefined(value)) {
        assertmsg(function_3c8848a3a11b2553(type) + "<dev string:x10d>");
        value = 0;
    }
    var_c6ea1889cb72e9a4 = getplayerrateofgamerevenue(self);
    value = int(value * var_c6ea1889cb72e9a4);
    value = function_752af98b96c243e0(value);
    if (!isdefined(suppresspopup)) {
        suppresspopup = 0;
    }
    if (!isdefined(forceimmediate)) {
        forceimmediate = 0;
    }
    if (!isdefined(value) || value == 0) {
        return;
    }
    if (istrue(level.var_b9c6856f5ab5f70f)) {
    } else if (!istrue(level.forcerankxp)) {
        if (level.teambased) {
            totalteamcount = 0;
            foreach (entry in level.teamnamelist) {
                if (getteamdata(entry, "teamCount")) {
                    totalteamcount++;
                    if (totalteamcount >= 2) {
                        break;
                    }
                }
            }
            if (totalteamcount < 2) {
                return;
            }
        } else {
            totalplayercount = 0;
            foreach (entry in level.teamnamelist) {
                totalplayercount += getteamdata(entry, "teamCount");
                if (totalplayercount >= 2) {
                    break;
                }
            }
            if (totalplayercount < 2) {
                return;
            }
        }
    }
    var_a29c313ec2ad5e22 = getscoreinfocategory(type, #"allowbonus");
    bonusmultiplier = 1;
    modifiedvalue = value;
    bonusxp = 0;
    if (istrue(var_a29c313ec2ad5e22)) {
        bonusmultiplier = getrankxpmultipliertotal();
        modifiedvalue = int(value * bonusmultiplier);
        bonusxp = int(max(modifiedvalue - value, 0));
    }
    thread waitandapplyxp(type, value, modifiedvalue, bonusxp, objweapon, forceimmediate, var_339e50a026e4674f, var_b01aca3236595958, suppresspopup, eventinfo);
}

// Namespace rank / scripts\mp\rank
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x1c89
// Size: 0x407
function waitandapplyxp(type, originalvalue, modifiedvalue, bonusxp, objweapon, forceimmediate, var_339e50a026e4674f, var_b01aca3236595958, suppresspopup, eventinfo) {
    self endon("disconnect");
    if (!isdefined(forceimmediate)) {
        forceimmediate = 0;
    }
    if (!forceimmediate) {
        waitframe();
        waittillslowprocessallowed();
    }
    oldxp = getrankxp();
    if (updaterank(oldxp)) {
    }
    /#
        function_f440a654d455343e(type, modifiedvalue);
    #/
    syncxpstat();
    weapon_xp = 0;
    if (!istrue(var_339e50a026e4674f)) {
        if (!isdefined(objweapon) || isdefined(objweapon.basename) && objweapon.basename == "none") {
            if (isdefined(self.lastcacweaponobj)) {
                objweapon = self.lastcacweaponobj;
            } else if (isdefined(self.lastdroppableweaponobj)) {
                objweapon = self.lastdroppableweaponobj;
            }
        }
        if (isdefined(objweapon)) {
            objweapon = function_1e3102980c3a4cc1(objweapon);
            if (isdefined(objweapon)) {
                if (scripts\mp\weaponrank::weaponshouldgetxp(objweapon)) {
                    if (istrue(level.var_d45cbfd4ecd2662c)) {
                        weapon_xp = [[ level.var_d45cbfd4ecd2662c ]](type);
                    } else {
                        weapon_xp = originalvalue;
                        weapon_xp *= scripts\mp\weaponrank::getweaponrankxpmultipliertotal(objweapon);
                        weapon_xp = int(weapon_xp);
                    }
                }
            }
        }
    }
    modifiedvalue = function_c465f9a27979c865(modifiedvalue, var_b01aca3236595958);
    bonusxp = function_78802b8c6de6eeba(bonusxp, var_b01aca3236595958);
    originalvalue = function_736110bfd2a3a5ea(originalvalue, var_b01aca3236595958);
    weapon_xp = function_199d881c43179c3f(weapon_xp, var_b01aca3236595958);
    battlepassXP = function_744c50f3c54a2ed8(originalvalue, eventinfo);
    if (level.var_cc985bc5548342e8 || level.var_9ca8191d077daebe) {
        var_57ad0dc40b2fdda = function_8ed5ea54bb5c5194(modifiedvalue, weapon_xp);
        weapon_xp = var_57ad0dc40b2fdda[1];
        modifiedvalue = var_57ad0dc40b2fdda[0];
    }
    if (function_3e51d40e11ac7ccd()) {
        var_57ad1dc40b3000d = function_e9d048bc036717fa(originalvalue, bonusxp > 0, weapon_xp > 0 ? objweapon : undefined);
        weapon_xp = var_57ad1dc40b3000d[1];
        modifiedvalue = var_57ad1dc40b3000d[0];
    }
    if (!suppresspopup && level.var_27dcaf9644646944 == #"display_xp") {
        if (!level.playerxpenabled || level.var_ec2fb549b15ad827 || scripts\mp\utility\game::isanymlgmatch() && !getdvarint(@"hash_93109b9d6f2bf2")) {
            var_b3a25cc5438cd047 = scripts\mp\rank::getscoreinfovalue(type);
            if (level.mapname != "mp_firingrange") {
                assertex(isdefined(var_b3a25cc5438cd047), "<dev string:x142>" + function_3c8848a3a11b2553(type) + "<dev string:x166>");
            }
            if (!isdefined(var_b3a25cc5438cd047)) {
                var_b3a25cc5438cd047 = 0;
            }
            displayscoreeventpoints(var_b3a25cc5438cd047, type);
        } else {
            displayscoreeventpoints(function_c465f9a27979c865(modifiedvalue, var_b01aca3236595958), type);
        }
    }
    incrankxp(modifiedvalue, objweapon, weapon_xp, type, battlepassXP, var_b01aca3236595958, forceimmediate);
    if (level.playerxpenabled && !isai(self)) {
        if (isdefined(objweapon) && (scripts\mp\utility\weapon::iscacprimaryweapon(objweapon) || scripts\mp\utility\weapon::iscacsecondaryweapon(objweapon))) {
            var_7e2c53b0bcf117d9 = spawnstruct();
            var_7e2c53b0bcf117d9.weaponname = namespace_e0ee43ef2dddadaa::getweaponrootname(objweapon);
            var_7e2c53b0bcf117d9.fullweaponname = getcompleteweaponname(objweapon);
            var_7e2c53b0bcf117d9.statname = "xp_earned";
            var_7e2c53b0bcf117d9.incvalue = weapon_xp;
            var_7e2c53b0bcf117d9.variantid = -1;
            var_7e2c53b0bcf117d9.weaponobj = objweapon;
            namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_7e2c53b0bcf117d9);
        }
    }
    recordxpgains(type, originalvalue, bonusxp);
    if (issharedfuncdefined("seasonalevents", "featuredLootEventIsFieldRep")) {
        if (function_f3bb4f4911a1beb2("seasonalevents", "featuredLootEventIsFieldRep")) {
            function_76ed21eb2a456e77(type, originalvalue, bonusxp, eventinfo);
        }
    }
    current_prestige = getprestigelevel();
    current_rank = getrank();
}

// Namespace rank / scripts\mp\rank
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2098
// Size: 0x139
function function_8ed5ea54bb5c5194(rankxp, weaponxp) {
    adjustedrankxp = rankxp;
    var_a272dd31f410ca93 = weaponxp;
    var_9e57d571f220152f = default_to(self.pers["xpEarnedThisMatch"], 0) / level.var_6677795065862d93;
    if (var_9e57d571f220152f > level.var_fe4db4ab7ad9d95e) {
        if (level.var_cc985bc5548342e8) {
            adjustedrankxp = int(adjustedrankxp * level.var_79c0b5f1954d30c9);
        }
        if (level.var_9ca8191d077daebe) {
            var_a272dd31f410ca93 = int(var_a272dd31f410ca93 * level.var_79c0b5f1954d30c9);
        }
    } else if (var_9e57d571f220152f > level.var_272c8fb7f8a58135) {
        factor = clamp((var_9e57d571f220152f - level.var_272c8fb7f8a58135) / level.var_bd959547d81ba9f6, 0, 1);
        xpscalar = math::lerp(level.var_ce487746206452f4, level.var_79c0b5f1954d30c9, factor);
        if (level.var_cc985bc5548342e8) {
            adjustedrankxp = int(adjustedrankxp * xpscalar);
        }
        if (level.var_9ca8191d077daebe) {
            var_a272dd31f410ca93 = int(var_a272dd31f410ca93 * xpscalar);
        }
    }
    return [adjustedrankxp, var_a272dd31f410ca93];
}

// Namespace rank / scripts\mp\rank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21da
// Size: 0x478
function function_b560222a9aa3c942() {
    gametype = getgametype();
    if (getdvarint(hashcat(@"scr_", gametype, "_rank_xp_rs_enabled"), 0) == 1) {
        level.var_fdf6d27641357fd7 = 1000 * getdvarint(hashcat(@"scr_", gametype, "_rank_xp_rs_start_time_seconds"), 180);
        level.var_7b8d4c36ba6edcec = getdvarfloat(hashcat(@"scr_", gametype, "_rank_xp_rs_target_xp_per_hour"), 22000);
        var_d44fd609866efce4 = getdvarint(hashcat(@"scr_", gametype, "_rank_xp_rs_benchmark_count"), 0);
        if (var_d44fd609866efce4 > 0) {
            level.var_d81e28e42da9de5e = [];
            scaling = spawnstruct();
            scaling.benchmark = level.var_7b8d4c36ba6edcec;
            scaling.scalar = 1;
            level.var_d81e28e42da9de5e[level.var_d81e28e42da9de5e.size] = scaling;
            for (scalingindex = 1; scalingindex <= var_d44fd609866efce4; scalingindex += 1) {
                scaling = spawnstruct();
                scaling.benchmark = getdvarfloat(hashcat(@"scr_", gametype, "_rank_xp_rs_benchmark", scalingindex), -1);
                if (scaling.benchmark >= 0) {
                    scaling.scalar = getdvarfloat(hashcat(@"scr_", gametype, "_rank_xp_rs_scalar", scalingindex), 0);
                    previousscaling = level.var_d81e28e42da9de5e[level.var_d81e28e42da9de5e.size - 1];
                    previousscaling.var_8d91cd3e5ba96b9c = scaling.benchmark - previousscaling.benchmark;
                    previousscaling.var_2b53305b09e9ca11 = previousscaling.scalar - scaling.scalar;
                    assertex(scaling.benchmark >= previousscaling.benchmark, "<dev string:x1b0>");
                    level.var_d81e28e42da9de5e[level.var_d81e28e42da9de5e.size] = scaling;
                }
            }
            scaling.var_2b53305b09e9ca11 = 0;
            scaling.var_8d91cd3e5ba96b9c = 1;
        }
    }
    if (getdvarint(hashcat(@"scr_", gametype, "_weapon_xp_rs_enabled"), 0) == 1) {
        level.var_6e75b028ad0ae251 = 1000 * getdvarint(hashcat(@"scr_", gametype, "_weapon_xp_rs_start_time_seconds"), 180);
        level.var_7382e860a71d2ec6 = getdvarfloat(hashcat(@"scr_", gametype, "_weapon_xp_rs_target_xp_per_hour"), 22000);
        var_de4ef628cc84d98e = getdvarint(hashcat(@"scr_", gametype, "_weapon_xp_rs_benchmark_count"), 0);
        if (var_de4ef628cc84d98e > 0) {
            level.var_2b6ac783e47905d8 = [];
            scaling = spawnstruct();
            scaling.benchmark = level.var_7382e860a71d2ec6;
            scaling.scalar = 1;
            level.var_2b6ac783e47905d8[level.var_2b6ac783e47905d8.size] = scaling;
            for (scalingindex = 1; scalingindex <= var_de4ef628cc84d98e; scalingindex += 1) {
                scaling = spawnstruct();
                scaling.benchmark = getdvarfloat(hashcat(@"scr_", gametype, "_weapon_xp_rs_benchmark", scalingindex), -1);
                if (scaling.benchmark >= 0) {
                    scaling.scalar = getdvarfloat(hashcat(@"scr_", gametype, "_weapon_xp_rs_scalar", scalingindex), 0);
                    previousscaling = level.var_2b6ac783e47905d8[level.var_2b6ac783e47905d8.size - 1];
                    previousscaling.var_8d91cd3e5ba96b9c = scaling.benchmark - previousscaling.benchmark;
                    previousscaling.var_2b53305b09e9ca11 = scaling.scalar - previousscaling.scalar;
                    assertex(scaling.benchmark >= previousscaling.benchmark, "<dev string:x216>");
                    level.var_2b6ac783e47905d8[level.var_2b6ac783e47905d8.size] = scaling;
                }
            }
            scaling.var_2b53305b09e9ca11 = 0;
            scaling.var_8d91cd3e5ba96b9c = 1;
        }
    }
}

// Namespace rank / scripts\mp\rank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x265a
// Size: 0x28
function function_3e51d40e11ac7ccd() {
    return isdefined(level.starttimefrommatchstart) && (isdefined(level.var_d81e28e42da9de5e) || isdefined(level.var_2b6ac783e47905d8));
}

// Namespace rank / scripts\mp\rank
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x268b
// Size: 0x37e
function function_e9d048bc036717fa(originalvalue, applybonus, objweapon) {
    matchtimems = gettime() - level.starttimefrommatchstart;
    var_f38005d4b8f0ab05 = float(self.pers["summary"]["xp"] - self.pers["summary"]["bonusXP"]) / float(matchtimems) / 3.6e+06;
    scaledrankxp = originalvalue;
    if (isdefined(level.var_d81e28e42da9de5e) && matchtimems > level.var_fdf6d27641357fd7 && var_f38005d4b8f0ab05 > level.var_7b8d4c36ba6edcec) {
        scalingindex = 0;
        var_18667df3ced7535b = 0;
        while (scalingindex < level.var_d81e28e42da9de5e.size) {
            var_ea41d0306ce04c06 = var_f38005d4b8f0ab05 - level.var_d81e28e42da9de5e[scalingindex].benchmark;
            if (var_ea41d0306ce04c06 < 0) {
                break;
            }
            var_18667df3ced7535b = var_ea41d0306ce04c06;
            scalingindex += 1;
        }
        scaling = level.var_d81e28e42da9de5e[scalingindex - 1];
        scaledrankxp *= scaling.scalar + scaling.var_2b53305b09e9ca11 * var_18667df3ced7535b / scaling.var_8d91cd3e5ba96b9c;
        assert(scaledrankxp <= originalvalue);
    }
    var_2e1e3cce9930d323 = originalvalue;
    if (isdefined(objweapon) && isdefined(level.var_2b6ac783e47905d8) && matchtimems > level.var_6e75b028ad0ae251 && var_f38005d4b8f0ab05 > level.var_7382e860a71d2ec6) {
        scalingindex = 0;
        var_18667df3ced7535b = 0;
        while (scalingindex < level.var_2b6ac783e47905d8.size) {
            var_ea41d0306ce04c06 = var_f38005d4b8f0ab05 - level.var_2b6ac783e47905d8[scalingindex].benchmark;
            if (var_ea41d0306ce04c06 < 0) {
                break;
            }
            var_18667df3ced7535b = var_ea41d0306ce04c06;
            scalingindex += 1;
        }
        scaling = level.var_2b6ac783e47905d8[scalingindex - 1];
        var_2e1e3cce9930d323 *= scaling.scalar + scaling.var_2b53305b09e9ca11 * var_18667df3ced7535b / scaling.var_8d91cd3e5ba96b9c;
        assert(var_2e1e3cce9930d323 <= originalvalue);
    }
    if (applybonus) {
        scaledrankxp *= getrankxpmultipliertotal();
    }
    if (isdefined(objweapon)) {
        var_2e1e3cce9930d323 *= scripts\mp\weaponrank::getweaponrankxpmultipliertotal(objweapon);
    } else {
        var_2e1e3cce9930d323 = 0;
    }
    /#
        if (getdvarint(@"hash_4098c270c1841328", 0) == 1) {
            iprintln("<dev string:x270>" + "<dev string:x285>" + self.name + "<dev string:x290>" + var_f38005d4b8f0ab05 + "<dev string:x2a6>" + self.pers["<dev string:x2bc>"]["<dev string:x2c7>"] - self.pers["<dev string:x2bc>"]["<dev string:x2cd>"]);
            if (isdefined(level.var_d81e28e42da9de5e)) {
                iprintln("<dev string:x2d8>" + "<dev string:x2f8>" + originalvalue + "<dev string:x308>" + scaledrankxp / getrankxpmultipliertotal() + "<dev string:x316>" + scaledrankxp + "<dev string:x328>" + self.pers["<dev string:x2bc>"]["<dev string:x2c7>"]);
            }
            if (isdefined(level.var_2b6ac783e47905d8)) {
                iprintln("<dev string:x340>" + "<dev string:x2f8>" + originalvalue + "<dev string:x308>" + var_2e1e3cce9930d323 / scripts\mp\weaponrank::getweaponrankxpmultipliertotal(objweapon) + "<dev string:x316>" + var_2e1e3cce9930d323 + "<dev string:x328>" + self.pers["<dev string:x2bc>"]["<dev string:x362>"]);
            }
        }
    #/
    return [int(scaledrankxp), int(var_2e1e3cce9930d323)];
}

// Namespace rank / scripts\mp\rank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a12
// Size: 0xc
function function_1427e3d0eac2bf0f() {
    return isdefined(level.var_2f470c4c8dc44884);
}

// Namespace rank / scripts\mp\rank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a27
// Size: 0x26
function function_752af98b96c243e0(var_f1efa0a209029c86) {
    if (!function_1427e3d0eac2bf0f()) {
        return var_f1efa0a209029c86;
    }
    return int(var_f1efa0a209029c86 * level.var_2f470c4c8dc44884);
}

// Namespace rank / scripts\mp\rank
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2a56
// Size: 0x138
function function_76ed21eb2a456e77(type, var_7c6b134e84356e37, bonusxp, eventinfo) {
    if (!function_d03495fe6418377b(type)) {
        assertex(1, type);
        type = function_1823ff50bb28148d(type);
    }
    groupname = getscoreinfocategory(type, #"group");
    if (!isdefined(groupname)) {
        groupname = #"strategy";
    }
    if (!function_d03495fe6418377b(groupname)) {
        groupname = function_1823ff50bb28148d(groupname);
    }
    xpcategory = undefined;
    if (groupname == #"combat") {
        xpcategory = "combat_xp";
    } else if (groupname == #"recon") {
        xpcategory = "recon_xp";
    } else if (groupname == #"strategy") {
        xpcategory = "strategy_xp";
    } else if (groupname == #"support") {
        xpcategory = "support_xp";
    } else if (groupname == #"logistics") {
        xpcategory = "logistics_xp";
    }
    if (isdefined(xpcategory)) {
        totalxp = var_7c6b134e84356e37 + bonusxp;
        self.pers["aarData"][xpcategory] = self.pers["aarData"][xpcategory] + totalxp;
    }
}

// Namespace rank / scripts\mp\rank
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2b96
// Size: 0xd5c
function recordxpgains(type, var_7c6b134e84356e37, bonusxp) {
    var_61339cc7c44bde8b = var_7c6b134e84356e37 + bonusxp;
    group = getscoreinfocategory(type, #"group");
    if (!isdefined(group) || group == "") {
        /#
            println("<dev string:x36e>" + var_61339cc7c44bde8b);
            println("<dev string:x383>" + bonusxp);
        #/
        self.pers["summary"]["misc"] = self.pers["summary"]["misc"] + var_7c6b134e84356e37;
        self.pers["summary"]["bonusXP"] = self.pers["summary"]["bonusXP"] + bonusxp;
        self.pers["summary"]["xp"] = self.pers["summary"]["xp"] + var_61339cc7c44bde8b;
        return;
    }
    switch (group) {
    case #"hash_a7e252caaf292eee":
        self.pers["summary"]["match"] = self.pers["summary"]["match"] + var_7c6b134e84356e37;
        self.pers["summary"]["bonusXP"] = self.pers["summary"]["bonusXP"] + bonusxp;
        self.pers["summary"]["xp"] = self.pers["summary"]["xp"] + var_61339cc7c44bde8b;
        break;
    case #"hash_5b8ea26626b7f31e":
        /#
            println("<dev string:x399>" + var_61339cc7c44bde8b);
            println("<dev string:x383>" + bonusxp);
        #/
        self.pers["summary"]["challenge"] = self.pers["summary"]["challenge"] + var_7c6b134e84356e37;
        self.pers["summary"]["bonusXP"] = self.pers["summary"]["bonusXP"] + bonusxp;
        self.pers["summary"]["xp"] = self.pers["summary"]["xp"] + var_61339cc7c44bde8b;
        break;
    case #"hash_5ecdb5d7fae048c":
        /#
            println("<dev string:x3b3>" + var_61339cc7c44bde8b);
            println("<dev string:x383>" + bonusxp);
        #/
        if (!isdefined(self.pers["combatXP"])) {
            self.pers["combatXP"] = var_7c6b134e84356e37;
        } else {
            self.pers["combatXP"] = self.pers["combatXP"] + var_7c6b134e84356e37;
        }
        self.pers["summary"]["medal"] = self.pers["summary"]["medal"] + var_7c6b134e84356e37;
        self.pers["summary"]["bonusXP"] = self.pers["summary"]["bonusXP"] + bonusxp;
        self.pers["summary"]["xp"] = self.pers["summary"]["xp"] + var_61339cc7c44bde8b;
        break;
    case #"hash_9e02cd4a0f3ca981":
        if (!isdefined(self.pers["combatXP"])) {
            self.pers["combatXP"] = var_7c6b134e84356e37;
        } else {
            self.pers["combatXP"] = self.pers["combatXP"] + var_7c6b134e84356e37;
        }
        if (type == #"reviver") {
            if (!isdefined(self.pers["reviveXP"])) {
                self.pers["reviveXP"] = var_7c6b134e84356e37;
            } else {
                self.pers["reviveXP"] = self.pers["reviveXP"] + var_7c6b134e84356e37;
            }
        }
        self.pers["summary"]["score"] = self.pers["summary"]["score"] + var_7c6b134e84356e37;
        self.pers["summary"]["bonusXP"] = self.pers["summary"]["bonusXP"] + bonusxp;
        self.pers["summary"]["xp"] = self.pers["summary"]["xp"] + var_61339cc7c44bde8b;
        break;
    case #"hash_2c78cfb46b2e96f0":
    case #"hash_5a2ce44c49fb0661":
        if (!isdefined(self.pers["lootingXP"])) {
            self.pers["lootingXP"] = var_7c6b134e84356e37;
        } else {
            self.pers["lootingXP"] = self.pers["lootingXP"] + var_7c6b134e84356e37;
        }
        self.pers["summary"]["score"] = self.pers["summary"]["score"] + var_7c6b134e84356e37;
        self.pers["summary"]["bonusXP"] = self.pers["summary"]["bonusXP"] + bonusxp;
        self.pers["summary"]["xp"] = self.pers["summary"]["xp"] + var_61339cc7c44bde8b;
        break;
    case #"hash_605929bc0f7f95c8":
    case #"hash_7b0ddfd91d8aadfc":
        if (!isdefined(self.pers["supportXP"])) {
            self.pers["supportXP"] = var_7c6b134e84356e37;
        } else {
            self.pers["supportXP"] = self.pers["supportXP"] + var_7c6b134e84356e37;
        }
        self.pers["summary"]["score"] = self.pers["summary"]["score"] + var_7c6b134e84356e37;
        self.pers["summary"]["bonusXP"] = self.pers["summary"]["bonusXP"] + bonusxp;
        self.pers["summary"]["xp"] = self.pers["summary"]["xp"] + var_61339cc7c44bde8b;
        break;
    case #"hash_9617cc9a55eccdd4":
        if (!isdefined(self.pers["reconXP"])) {
            self.pers["reconXP"] = var_7c6b134e84356e37;
        } else {
            self.pers["reconXP"] = self.pers["reconXP"] + var_7c6b134e84356e37;
        }
        self.pers["summary"]["score"] = self.pers["summary"]["score"] + var_7c6b134e84356e37;
        self.pers["summary"]["bonusXP"] = self.pers["summary"]["bonusXP"] + bonusxp;
        self.pers["summary"]["xp"] = self.pers["summary"]["xp"] + var_61339cc7c44bde8b;
        break;
    case #"hash_1cac65e1b8bf24a7":
    case #"hash_8bcabde9ced22684":
    case #"hash_c4f97a56da3b7cde":
        if (!isdefined(self.pers["missionXP"])) {
            self.pers["missionXP"] = var_7c6b134e84356e37;
        } else {
            self.pers["missionXP"] = self.pers["missionXP"] + var_7c6b134e84356e37;
        }
        self.pers["summary"]["score"] = self.pers["summary"]["score"] + var_7c6b134e84356e37;
        self.pers["summary"]["bonusXP"] = self.pers["summary"]["bonusXP"] + bonusxp;
        self.pers["summary"]["xp"] = self.pers["summary"]["xp"] + var_61339cc7c44bde8b;
        break;
    case #"gametype":
        if (type == #"hash_3b0b5b72c38e1a56") {
            if (!isdefined(self.pers["explorationXP"])) {
                self.pers["explorationXP"] = var_7c6b134e84356e37;
            } else {
                self.pers["explorationXP"] = self.pers["explorationXP"] + var_7c6b134e84356e37;
            }
        } else if (type == #"hash_a664e407eb3e39d4") {
            if (!isdefined(self.pers["extractionXP"])) {
                self.pers["extractionXP"] = var_7c6b134e84356e37;
            } else {
                self.pers["extractionXP"] = self.pers["extractionXP"] + var_7c6b134e84356e37;
            }
        } else if (type == #"hash_541f0b57f321a27") {
            if (!isdefined(self.pers["uavTowerXP"])) {
                self.pers["uavTowerXP"] = var_7c6b134e84356e37;
            } else {
                self.pers["uavTowerXP"] = self.pers["uavTowerXP"] + var_7c6b134e84356e37;
            }
        } else if (type == #"hash_c02c8c802f07c908") {
            if (!isdefined(self.pers["safeOpenedXP"])) {
                self.pers["safeOpenedXP"] = var_7c6b134e84356e37;
            } else {
                self.pers["safeOpenedXP"] = self.pers["safeOpenedXP"] + var_7c6b134e84356e37;
            }
        } else if (type == #"hash_9a68d11b1688325a") {
            if (!isdefined(self.pers["supplyDropsOpenedXP"])) {
                self.pers["supplyDropsOpenedXP"] = var_7c6b134e84356e37;
            } else {
                self.pers["supplyDropsOpenedXP"] = self.pers["supplyDropsOpenedXP"] + var_7c6b134e84356e37;
            }
        } else if (type == #"hash_4f33a2c9e6f878f3" || type == #"hash_903730f789cd3ea8" || type == #"hash_39a2298d6704df34" || type == #"hash_73698e98eee3b648") {
            if (!isdefined(self.pers["contractXP"])) {
                self.pers["contractXP"] = var_7c6b134e84356e37;
            } else {
                self.pers["contractXP"] = self.pers["contractXP"] + var_7c6b134e84356e37;
            }
        } else if (type == #"hash_6c63c18261a7af97" || type == #"hash_584786512b068a29" || type == #"hash_f3613beae4483db1" || type == #"hash_6bc346a4e4ceec9c" || type == #"hash_8f214db6809e7a45" || type == #"hash_7f4e32e3118376d1" || type == #"hash_1da43ecd73fe96d8" || type == #"hash_1da441cd73fe9bf1" || type == #"hash_b89531208dd457d9" || type == #"hash_32cc2c1e56e5b931" || type == #"hash_32cc291e56e5b418" || type == #"hash_95f9ed42ef9ac79a") {
            if (!isdefined(self.pers["areaUnlockedXP"])) {
                self.pers["areaUnlockedXP"] = var_7c6b134e84356e37;
            } else {
                self.pers["areaUnlockedXP"] = self.pers["areaUnlockedXP"] + var_7c6b134e84356e37;
            }
        } else if (type == #"hash_5a2c275279403f5") {
            if (!isdefined(self.pers["missionXP"])) {
                self.pers["missionXP"] = var_7c6b134e84356e37;
            } else {
                self.pers["missionXP"] = self.pers["missionXP"] + var_7c6b134e84356e37;
            }
        } else if (type == #"hash_d50fc159ab68b13b") {
            if (!isdefined(self.pers["squadPlayXP"])) {
                self.pers["squadPlayXP"] = var_7c6b134e84356e37;
            } else {
                self.pers["squadPlayXP"] = self.pers["squadPlayXP"] + var_7c6b134e84356e37;
            }
        }
        self.pers["summary"]["score"] = self.pers["summary"]["score"] + var_7c6b134e84356e37;
        self.pers["summary"]["bonusXP"] = self.pers["summary"]["bonusXP"] + bonusxp;
        self.pers["summary"]["xp"] = self.pers["summary"]["xp"] + var_61339cc7c44bde8b;
        break;
    default:
        /#
            println("<dev string:x3c9>" + var_61339cc7c44bde8b);
            println("<dev string:x383>" + bonusxp);
        #/
        self.pers["summary"]["score"] = self.pers["summary"]["score"] + var_7c6b134e84356e37;
        self.pers["summary"]["bonusXP"] = self.pers["summary"]["bonusXP"] + bonusxp;
        self.pers["summary"]["xp"] = self.pers["summary"]["xp"] + var_61339cc7c44bde8b;
        break;
    }
}

// Namespace rank / scripts\mp\rank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x38fa
// Size: 0xf4
function updaterank(oldxp) {
    newrank = getrank();
    newprestige = getprestigelevel();
    var_e6633fe0fb633e52 = self.pers["rank"] + self.pers["prestige"];
    var_7a8cd849f0dbf2c7 = newrank + newprestige;
    self.pers["rank"] = newrank;
    self.pers["prestige"] = newprestige;
    if (var_7a8cd849f0dbf2c7 == var_e6633fe0fb633e52 || var_7a8cd849f0dbf2c7 >= level.maxrank + level.maxelderrank) {
        return false;
    }
    println("<dev string:x3de>" + self.name + "<dev string:x3eb>" + var_e6633fe0fb633e52 + "<dev string:x3fa>" + var_7a8cd849f0dbf2c7 + "<dev string:x402>" + oldxp + "<dev string:x3fa>" + getrankxp() + "<dev string:x41d>");
    self setrank(newrank, newprestige);
    return true;
}

// Namespace rank / scripts\mp\rank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x39f7
// Size: 0xef
function updaterankannouncehud() {
    self endon("disconnect");
    self notify("update_rank");
    self endon("update_rank");
    team = self.pers["team"];
    if (!isdefined(team)) {
        return;
    }
    if (!scripts\mp\flags::levelflag("game_over")) {
        level waittill_notify_or_timeout("game_over", 0.25);
    }
    newrank = self.pers["rank"] + self.pers["prestige"];
    for (i = 0; i < level.players.size; i++) {
        player = level.players[i];
        playerteam = player.pers["team"];
        if (isdefined(playerteam) && playerteam == team) {
            player iprintln(%RANK/PLAYER_WAS_PROMOTED, self, newrank + 1);
        }
    }
}

// Namespace rank / scripts\mp\rank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3aee
// Size: 0x1f
function queuescorepointspopup(amount) {
    self.scorepointsqueue += amount;
}

// Namespace rank / scripts\mp\rank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b15
// Size: 0x1c
function flushscorepointspopupqueue() {
    scorepointspopup(self.scorepointsqueue);
    self.scorepointsqueue = 0;
}

// Namespace rank / scripts\mp\rank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b39
// Size: 0x3b
function flushscorepointspopupqueueonspawn() {
    self endon("disconnect");
    self endon("joined_team");
    self endon("joined_spectators");
    self notify("flushScorePointsPopupQueueOnSpawn()");
    self endon("flushScorePointsPopupQueueOnSpawn()");
    self waittill("spawned_player");
    wait 0.1;
    flushscorepointspopupqueue();
}

// Namespace rank / scripts\mp\rank
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3b7c
// Size: 0xdb
function scorepointspopup(amount, var_644b10fb91c1254c) {
    self endon("disconnect");
    self endon("joined_team");
    self endon("joined_spectators");
    if (istrue(level.var_bb8596fb319eb83e)) {
        return;
    }
    if (amount == 0) {
        return;
    }
    if (!isreallyalive(self) && !self iscodcaster() && !isusingremote()) {
        if (!istrue(var_644b10fb91c1254c) || isinkillcam()) {
            queuescorepointspopup(amount);
            thread flushscorepointspopupqueueonspawn();
            return;
        }
    }
    self notify("scorePointsPopup");
    self endon("scorePointsPopup");
    self.scoreupdatetotal += amount;
    self setclientomnvar("ui_points_popup", self.scoreupdatetotal);
    self setclientomnvar("ui_points_popup_notify", gettime());
    wait 1;
    if (isdefined(self)) {
        self.scoreupdatetotal = 0;
    }
}

// Namespace rank / scripts\mp\rank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c5f
// Size: 0x15
function notifyplayerscore() {
    waitframe();
    level notify("update_player_score", self, self.scoreupdatetotal);
}

// Namespace rank / scripts\mp\rank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c7c
// Size: 0x21
function queuescoreeventpopup(event) {
    self.scoreeventqueue[self.scoreeventqueue.size] = event;
}

// Namespace rank / scripts\mp\rank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ca5
// Size: 0x6b
function flushscoreeventpopupqueue() {
    scoreevents = self.scoreeventqueue;
    self.scoreeventqueue = [];
    foreach (event in scoreevents) {
        scoreeventpopup(event);
    }
}

// Namespace rank / scripts\mp\rank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d18
// Size: 0x3b
function flushscoreeventpopupqueueonspawn() {
    self endon("disconnect");
    self endon("joined_team");
    self endon("joined_spectators");
    self notify("flushScoreEventPopupQueueOnSpawn()");
    self endon("flushScoreEventPopupQueueOnSpawn()");
    self waittill("spawned_player");
    wait 0.1;
    flushscoreeventpopupqueue();
}

// Namespace rank / scripts\mp\rank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d5b
// Size: 0x46
function getscoreeventpriority(event) {
    if (getdvarint(@"hash_a3a1cab75dca6cc6", 0) == 1) {
        return 0;
    }
    value = getscoreinfocategory(event, #"priority");
    if (!istrue(value)) {
        return 0;
    }
    return value;
}

// Namespace rank / scripts\mp\rank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3daa
// Size: 0x57
function scoreeventalwaysshowassplash(event) {
    if (getdvarint(@"hash_a3a1cab75dca6cc6", 0) == 1) {
        return false;
    }
    if (istrue(level.var_488d247ae51e8eeb)) {
        return true;
    }
    value = getscoreinfocategory(event, #"hash_582866801a05178b");
    if (!istrue(value)) {
        return false;
    }
    return true;
}

// Namespace rank / scripts\mp\rank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3e0a
// Size: 0x3a
function scoreeventhastext(event) {
    if (getdvarint(@"hash_a3a1cab75dca6cc6", 0) == 1) {
        return false;
    }
    if (!istrue(getscoreinfocategory(event, #"hastext"))) {
        return false;
    }
    return true;
}

// Namespace rank / scripts\mp\rank
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3e4d
// Size: 0x2f1
function scoreeventpopup(event, extraparam) {
    if (getdvarint(@"hash_a3a1cab75dca6cc6", 0) == 1) {
        return;
    }
    if (istrue(level.var_bb8596fb319eb83e)) {
        return;
    }
    if (isdefined(self.owner) && self.owner != self) {
        self.owner scoreeventpopup(event);
    }
    if (!isplayer(self)) {
        return;
    }
    var_a4e353fa34a0f7bd = 0;
    text = undefined;
    splashid = scripts\mp\rank::function_1e00d01d19fde519(event);
    if (isdefined(splashid)) {
        var_a4e353fa34a0f7bd = 1;
    }
    if (!isdefined(splashid) || splashid < 0) {
        splashid = getscoreinfocategory(event, #"hash_edd89bb2cc2d506");
    }
    if (!isdefined(splashid) || splashid < 0) {
        return;
    }
    if (!istrue(getscoreinfocategory(event, #"hastext"))) {
        return;
    }
    var_f331e293f923dc53 = 0;
    if (event == #"downed_victim" || event == #"hash_59943f6a740f581b") {
        var_f331e293f923dc53 = 1;
    }
    shoulddelay = !isreallyalive(self) && !var_f331e293f923dc53;
    if (shoulddelay && !self iscodcaster() && !isusingremote()) {
        queuescoreeventpopup(event);
        thread flushscoreeventpopupqueueonspawn();
        return;
    }
    if (!isdefined(self.scoreeventlistsize)) {
        self.scoreeventlistsize = 1;
        thread clearscoreeventlistafterwait();
    } else {
        self.scoreeventlistsize++;
        if (self.scoreeventlistsize > 5) {
            self.scoreeventlistsize = 5;
            println("<dev string:x422>");
            return;
        }
    }
    points = getscoreinfocategory(event, #"value");
    if (level.var_27dcaf9644646944 == #"display_xp") {
        points = getscoreinfocategory(event, #"xp");
    }
    if (isdefined(extraparam)) {
        self setclientomnvar("ui_score_event_param_" + self.scoreeventlistindex, extraparam);
        self setclientomnvar("ui_potg_score_event_param_" + self.scoreeventlistindex, extraparam);
    }
    self setclientomnvar("ui_score_event_list_score_" + self.scoreeventlistindex, points);
    self setclientomnvar("ui_potg_score_event_list_" + self.scoreeventlistindex, splashid);
    self setclientomnvar("ui_score_event_list_" + self.scoreeventlistindex, splashid);
    self setclientomnvar("ui_score_event_use_splashbundle_" + self.scoreeventlistindex, var_a4e353fa34a0f7bd);
    self setclientomnvar("ui_potg_score_event_use_splashbundle_" + self.scoreeventlistindex, var_a4e353fa34a0f7bd);
    self setclientomnvar("ui_score_event_control", self.scoreeventcount % 10);
    self setclientomnvar("ui_potg_score_event_control", self.scoreeventcount % 10);
    self.scoreeventlistindex++;
    self.scoreeventlistindex %= 5;
    self.scoreeventcount++;
}

// Namespace rank / scripts\mp\rank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4146
// Size: 0x33
function clearscoreeventlistafterwait() {
    self endon("disconnect");
    self notify("clearScoreEventListAfterWait()");
    self endon("clearScoreEventListAfterWait()");
    waittill_notify_or_timeout("death", 0.5);
    self.scoreeventlistsize = undefined;
}

// Namespace rank / scripts\mp\rank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4181
// Size: 0x24
function getmatchbonusspm() {
    ranklevel = getrank() + 1;
    return (3 + ranklevel * 0.5) * 10;
}

// Namespace rank / scripts\mp\rank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x41ae
// Size: 0x4c
function getprestigelevel() {
    if (isai(self) && isdefined(self.pers["prestige_fake"])) {
        return self.pers["prestige_fake"];
    }
    return self getplayerdata(level.loadoutsgroup, "squadMembers", "season_rank");
}

// Namespace rank / scripts\mp\rank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4202
// Size: 0x43
function getrankxp() {
    if (!isdefined(self)) {
        assertmsg("<dev string:x491>");
        return 0;
    }
    if (!isdefined(scripts\mp\utility\stats::getpersstat("rankxp"))) {
        assertmsg("<dev string:x4a8>" + self);
        return 0;
    }
    return scripts\mp\utility\stats::getpersstat("rankxp");
}

// Namespace rank / scripts\mp\rank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x424e
// Size: 0x3d
function function_3db51a7599861afe(xpscale) {
    var_3571877be753dfd7 = 1;
    if (istrue(scripts\mp\playerlogic::function_1761d46d3de136b9())) {
        var_3571877be753dfd7 = scripts\mp\playerlogic::function_35b4c67f5f658332();
    }
    return int(max(xpscale, var_3571877be753dfd7)) >= 2;
}

// Namespace rank / scripts\mp\rank
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x4294
// Size: 0x13d8
function incrankxp(amount, objweapon, weapon_xp, type, var_158745de00c72d3e, var_b01aca3236595958, forceimmediate) {
    if (!level.playerxpenabled) {
        return;
    }
    if (isai(self)) {
        return;
    }
    eventname = #"mp_addxp";
    eventid = function_6e2deb013c9ca85e(eventname);
    if (!isdefined(eventid)) {
        return;
    }
    if (isdefined(self.enabledxp) && !istrue(self.enabledxp)) {
        return;
    }
    if (!isdefined(level.maxbetarank)) {
        level.maxbetarank = getdvarint(@"hash_75ff427bfdaf65e9", 0);
    }
    if (level.maxbetarank > 0 && getrank() + 1 >= level.maxbetarank) {
        amount = 0;
    }
    if (!isdefined(var_158745de00c72d3e)) {
        var_158745de00c72d3e = amount;
    }
    xp = getrankxp();
    newxp = int(min(xp + amount, getrankinfomaxxp(level.maxrank) - 1));
    if (self.pers["rank"] == level.maxrank && newxp >= getrankinfomaxxp(level.maxrank)) {
        newxp = getrankinfomaxxp(level.maxrank);
    }
    self.pers["xpEarnedThisMatch"] = self.pers["xpEarnedThisMatch"] + amount;
    self.pers["rankxp"] = newxp;
    weapon = "";
    weaponlootid = 0;
    if (isdefined(objweapon)) {
        weapon = namespace_e0ee43ef2dddadaa::getweaponrootname(objweapon.basename);
        if (isdefined(level.weaponmapdata[weapon]) && isdefined(level.weaponmapdata[weapon].weaponlootid)) {
            weaponlootid = level.weaponmapdata[weapon].weaponlootid;
        }
    }
    weaponlootid = function_64ca1aa18fdeabc(weaponlootid, var_b01aca3236595958);
    if (weapon_xp > 0 && weaponlootid == 0) {
        assertmsg("<dev string:x4df>");
    }
    if (isdefined(level.var_b24b5841e002edae) && !istrue(forceimmediate)) {
        waitframe();
        if (!isdefined(self)) {
            return;
        }
        throttle::function_f632348cbb773537(level.var_b24b5841e002edae, self);
    }
    operatorid = 0;
    if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.operatorref)) {
        operatorid = namespace_465d40bb08a5337a::function_396b82c66e727528(self.operatorcustomization.operatorref);
    }
    operatorscalar = function_6352822c84cb9722();
    operatorxp = amount * operatorscalar;
    operatorxp = int(operatorxp);
    clanXP = int(amount);
    xpeventparams = [];
    var_22d9ebf9658572ca = 0;
    var_9842abca26b8412f = function_3db51a7599861afe(function_e3ef0908b595e8e1());
    var_9bcbd4de2b44016 = function_3db51a7599861afe(function_7d04fc91bee2ccd1());
    var_4f2ce1928e1c8a65 = function_6d29dcaf4fd78604() >= 2;
    var_15cf23ab0dd23996 = function_b3bd8c86dbdd11c1() >= 2;
    var_816c7322928047c2 = function_574c0312c915c601() >= 2;
    if (istrue(var_9842abca26b8412f)) {
        var_22d9ebf9658572ca = scripts\cp_mp\challenges::function_6d40f12a09494350(var_22d9ebf9658572ca, function_e2ff8f4b4e94f723(#"hash_e1ad0562d81a9efa", #"hash_acc6dc54625d0a17"));
    }
    if (istrue(var_9bcbd4de2b44016)) {
        var_22d9ebf9658572ca = scripts\cp_mp\challenges::function_6d40f12a09494350(var_22d9ebf9658572ca, function_e2ff8f4b4e94f723(#"hash_e1ad0562d81a9efa", #"hash_45e3c0812e75ab3e"));
    }
    if (istrue(var_4f2ce1928e1c8a65)) {
        var_22d9ebf9658572ca = scripts\cp_mp\challenges::function_6d40f12a09494350(var_22d9ebf9658572ca, function_e2ff8f4b4e94f723(#"hash_e1ad0562d81a9efa", #"hash_660db0e326cd81bd"));
    }
    if (istrue(var_15cf23ab0dd23996)) {
        var_22d9ebf9658572ca = scripts\cp_mp\challenges::function_6d40f12a09494350(var_22d9ebf9658572ca, function_e2ff8f4b4e94f723(#"hash_e1ad0562d81a9efa", #"hash_8b59c4002a512de"));
    }
    if (istrue(var_816c7322928047c2)) {
        var_22d9ebf9658572ca = scripts\cp_mp\challenges::function_6d40f12a09494350(var_22d9ebf9658572ca, function_e2ff8f4b4e94f723(#"hash_e1ad0562d81a9efa", #"hash_daaf4b8f296c064a"));
    }
    if (amount > 0) {
        if (!isdefined(self.logplayerxp)) {
            self.logplayerxp = 0;
        }
        assert(function_d03495fe6418377b(eventname));
        assert(function_d03495fe6418377b(#"value"));
        var_cf27bc26b98940ab = namespace_649c2fab0fd72b8b::function_d6f771aedba70ce7(eventname, #"value");
        if (isdefined(var_cf27bc26b98940ab)) {
            xpeventparams[xpeventparams.size] = var_cf27bc26b98940ab;
            xpeventparams[xpeventparams.size] = int(amount);
        } else {
            println("<dev string:x50e>" + function_3c8848a3a11b2553(#"value") + "<dev string:x52a>" + amount + "<dev string:x530>" + function_3c8848a3a11b2553(eventname));
        }
        self.logplayerxp += amount;
        if (!istrue(var_9842abca26b8412f)) {
            if (!isdefined(self.var_6839d4c49d4311cc)) {
                self.var_6839d4c49d4311cc = 0;
            }
            if (!isdefined(self.var_5f7f0514bd751748)) {
                self.var_5f7f0514bd751748 = 0;
            }
            var_eae0bcbf8e33e5 = function_526238fba52ecffb(#"hash_a23fd2965dc429bc", amount);
            if (var_eae0bcbf8e33e5 != 0) {
                assert(function_d03495fe6418377b(eventname));
                assert(function_d03495fe6418377b(#"bonus_xp"));
                var_cf27bc26b98940ab = namespace_649c2fab0fd72b8b::function_d6f771aedba70ce7(eventname, #"bonus_xp");
                if (isdefined(var_cf27bc26b98940ab)) {
                    xpeventparams[xpeventparams.size] = var_cf27bc26b98940ab;
                    xpeventparams[xpeventparams.size] = int(var_eae0bcbf8e33e5);
                } else {
                    println("<dev string:x50e>" + function_3c8848a3a11b2553(#"bonus_xp") + "<dev string:x52a>" + var_eae0bcbf8e33e5 + "<dev string:x530>" + function_3c8848a3a11b2553(eventname));
                }
                assert(function_d03495fe6418377b(eventname));
                assert(function_d03495fe6418377b(#"hash_73824491bffbc66a"));
                var_cf27bc26b98940ab = namespace_649c2fab0fd72b8b::function_d6f771aedba70ce7(eventname, #"hash_73824491bffbc66a");
                if (isdefined(var_cf27bc26b98940ab)) {
                    xpeventparams[xpeventparams.size] = var_cf27bc26b98940ab;
                    xpeventparams[xpeventparams.size] = int(2);
                } else {
                    println("<dev string:x50e>" + function_3c8848a3a11b2553(#"hash_73824491bffbc66a") + "<dev string:x52a>" + 2 + "<dev string:x530>" + function_3c8848a3a11b2553(eventname));
                }
                self.var_5f7f0514bd751748 += var_eae0bcbf8e33e5;
            } else {
                var_6cf32c59a6c7c2d9 = function_5e61313ccc7db173(#"hash_a23fd2965dc429bc", amount);
                if (var_6cf32c59a6c7c2d9 != 0) {
                    assert(function_d03495fe6418377b(eventname));
                    assert(function_d03495fe6418377b(#"bonus_xp"));
                    var_cf27bc26b98940ab = namespace_649c2fab0fd72b8b::function_d6f771aedba70ce7(eventname, #"bonus_xp");
                    if (isdefined(var_cf27bc26b98940ab)) {
                        xpeventparams[xpeventparams.size] = var_cf27bc26b98940ab;
                        xpeventparams[xpeventparams.size] = int(var_6cf32c59a6c7c2d9);
                    } else {
                        println("<dev string:x50e>" + function_3c8848a3a11b2553(#"bonus_xp") + "<dev string:x52a>" + var_6cf32c59a6c7c2d9 + "<dev string:x530>" + function_3c8848a3a11b2553(eventname));
                    }
                    assert(function_d03495fe6418377b(eventname));
                    assert(function_d03495fe6418377b(#"hash_73824491bffbc66a"));
                    var_cf27bc26b98940ab = namespace_649c2fab0fd72b8b::function_d6f771aedba70ce7(eventname, #"hash_73824491bffbc66a");
                    if (isdefined(var_cf27bc26b98940ab)) {
                        xpeventparams[xpeventparams.size] = var_cf27bc26b98940ab;
                        xpeventparams[xpeventparams.size] = int(1);
                    } else {
                        println("<dev string:x50e>" + function_3c8848a3a11b2553(#"hash_73824491bffbc66a") + "<dev string:x52a>" + 1 + "<dev string:x530>" + function_3c8848a3a11b2553(eventname));
                    }
                    self.var_6839d4c49d4311cc += var_6cf32c59a6c7c2d9;
                }
            }
        }
    }
    if (weapon_xp > 0) {
        if (level.onlinegame && self function_2129e0e4d014e1b3()) {
            weaponxpmult = getdvarfloat(@"hash_ae1bef48f6b2083c", 1.25);
            weapon_xp = int(weapon_xp * weaponxpmult);
        }
        if (!isdefined(self.var_ec2db7afa79d6329)) {
            self.var_ec2db7afa79d6329 = 0;
        }
        assert(function_d03495fe6418377b(eventname));
        assert(function_d03495fe6418377b(#"weapon_xp"));
        var_cf27bc26b98940ab = namespace_649c2fab0fd72b8b::function_d6f771aedba70ce7(eventname, #"weapon_xp");
        if (isdefined(var_cf27bc26b98940ab)) {
            xpeventparams[xpeventparams.size] = var_cf27bc26b98940ab;
            xpeventparams[xpeventparams.size] = int(weapon_xp);
        } else {
            println("<dev string:x50e>" + function_3c8848a3a11b2553(#"weapon_xp") + "<dev string:x52a>" + weapon_xp + "<dev string:x530>" + function_3c8848a3a11b2553(eventname));
        }
        assert(function_d03495fe6418377b(eventname));
        assert(function_d03495fe6418377b(#"weapon_loot_id"));
        var_cf27bc26b98940ab = namespace_649c2fab0fd72b8b::function_d6f771aedba70ce7(eventname, #"weapon_loot_id");
        if (isdefined(var_cf27bc26b98940ab)) {
            xpeventparams[xpeventparams.size] = var_cf27bc26b98940ab;
            xpeventparams[xpeventparams.size] = int(weaponlootid);
        } else {
            println("<dev string:x50e>" + function_3c8848a3a11b2553(#"weapon_loot_id") + "<dev string:x52a>" + weaponlootid + "<dev string:x530>" + function_3c8848a3a11b2553(eventname));
        }
        self.var_ec2db7afa79d6329 += weapon_xp;
        if (!istrue(var_9bcbd4de2b44016)) {
            if (!isdefined(self.var_87cced5af3fe8585)) {
                self.var_87cced5af3fe8585 = 0;
            }
            if (!isdefined(self.var_946e67a854e36f91)) {
                self.var_946e67a854e36f91 = 0;
            }
            var_eae0bcbf8e33e5 = function_526238fba52ecffb(#"weapon", weapon_xp);
            if (var_eae0bcbf8e33e5 != 0) {
                assert(function_d03495fe6418377b(eventname));
                assert(function_d03495fe6418377b(#"hash_48ad44d6a3d7d22a"));
                var_cf27bc26b98940ab = namespace_649c2fab0fd72b8b::function_d6f771aedba70ce7(eventname, #"hash_48ad44d6a3d7d22a");
                if (isdefined(var_cf27bc26b98940ab)) {
                    xpeventparams[xpeventparams.size] = var_cf27bc26b98940ab;
                    xpeventparams[xpeventparams.size] = int(var_eae0bcbf8e33e5);
                } else {
                    println("<dev string:x50e>" + function_3c8848a3a11b2553(#"hash_48ad44d6a3d7d22a") + "<dev string:x52a>" + var_eae0bcbf8e33e5 + "<dev string:x530>" + function_3c8848a3a11b2553(eventname));
                }
                assert(function_d03495fe6418377b(eventname));
                assert(function_d03495fe6418377b(#"hash_e16477c0e4e66937"));
                var_cf27bc26b98940ab = namespace_649c2fab0fd72b8b::function_d6f771aedba70ce7(eventname, #"hash_e16477c0e4e66937");
                if (isdefined(var_cf27bc26b98940ab)) {
                    xpeventparams[xpeventparams.size] = var_cf27bc26b98940ab;
                    xpeventparams[xpeventparams.size] = int(2);
                } else {
                    println("<dev string:x50e>" + function_3c8848a3a11b2553(#"hash_e16477c0e4e66937") + "<dev string:x52a>" + 2 + "<dev string:x530>" + function_3c8848a3a11b2553(eventname));
                }
                self.var_946e67a854e36f91 += var_eae0bcbf8e33e5;
            } else {
                var_6cf32c59a6c7c2d9 = function_5e61313ccc7db173(#"weapon", weapon_xp);
                if (var_6cf32c59a6c7c2d9 != 0) {
                    assert(function_d03495fe6418377b(eventname));
                    assert(function_d03495fe6418377b(#"hash_48ad44d6a3d7d22a"));
                    var_cf27bc26b98940ab = namespace_649c2fab0fd72b8b::function_d6f771aedba70ce7(eventname, #"hash_48ad44d6a3d7d22a");
                    if (isdefined(var_cf27bc26b98940ab)) {
                        xpeventparams[xpeventparams.size] = var_cf27bc26b98940ab;
                        xpeventparams[xpeventparams.size] = int(var_6cf32c59a6c7c2d9);
                    } else {
                        println("<dev string:x50e>" + function_3c8848a3a11b2553(#"hash_48ad44d6a3d7d22a") + "<dev string:x52a>" + var_6cf32c59a6c7c2d9 + "<dev string:x530>" + function_3c8848a3a11b2553(eventname));
                    }
                    assert(function_d03495fe6418377b(eventname));
                    assert(function_d03495fe6418377b(#"hash_e16477c0e4e66937"));
                    var_cf27bc26b98940ab = namespace_649c2fab0fd72b8b::function_d6f771aedba70ce7(eventname, #"hash_e16477c0e4e66937");
                    if (isdefined(var_cf27bc26b98940ab)) {
                        xpeventparams[xpeventparams.size] = var_cf27bc26b98940ab;
                        xpeventparams[xpeventparams.size] = int(1);
                    } else {
                        println("<dev string:x50e>" + function_3c8848a3a11b2553(#"hash_e16477c0e4e66937") + "<dev string:x52a>" + 1 + "<dev string:x530>" + function_3c8848a3a11b2553(eventname));
                    }
                    self.var_87cced5af3fe8585 += var_6cf32c59a6c7c2d9;
                }
            }
        }
    }
    if (var_158745de00c72d3e > 0) {
        if (!isdefined(self.var_f28d6120a5ec7857)) {
            self.var_f28d6120a5ec7857 = 0;
        }
        assert(function_d03495fe6418377b(eventname));
        assert(function_d03495fe6418377b(#"battlepass_xp"));
        var_cf27bc26b98940ab = namespace_649c2fab0fd72b8b::function_d6f771aedba70ce7(eventname, #"battlepass_xp");
        if (isdefined(var_cf27bc26b98940ab)) {
            xpeventparams[xpeventparams.size] = var_cf27bc26b98940ab;
            xpeventparams[xpeventparams.size] = int(var_158745de00c72d3e);
        } else {
            println("<dev string:x50e>" + function_3c8848a3a11b2553(#"battlepass_xp") + "<dev string:x52a>" + var_158745de00c72d3e + "<dev string:x530>" + function_3c8848a3a11b2553(eventname));
        }
        self.var_f28d6120a5ec7857 += var_158745de00c72d3e;
        if (!istrue(var_4f2ce1928e1c8a65)) {
            if (!isdefined(self.var_34337227f7ad5ac3)) {
                self.var_34337227f7ad5ac3 = 0;
            }
            if (!isdefined(self.var_5a7aef9c8dd06cdf)) {
                self.var_5a7aef9c8dd06cdf = 0;
            }
            var_eae0bcbf8e33e5 = function_526238fba52ecffb(#"bp", var_158745de00c72d3e);
            if (var_eae0bcbf8e33e5 != 0) {
                assert(function_d03495fe6418377b(eventname));
                assert(function_d03495fe6418377b(#"hash_f0b251f180942558"));
                var_cf27bc26b98940ab = namespace_649c2fab0fd72b8b::function_d6f771aedba70ce7(eventname, #"hash_f0b251f180942558");
                if (isdefined(var_cf27bc26b98940ab)) {
                    xpeventparams[xpeventparams.size] = var_cf27bc26b98940ab;
                    xpeventparams[xpeventparams.size] = int(var_eae0bcbf8e33e5);
                } else {
                    println("<dev string:x50e>" + function_3c8848a3a11b2553(#"hash_f0b251f180942558") + "<dev string:x52a>" + var_eae0bcbf8e33e5 + "<dev string:x530>" + function_3c8848a3a11b2553(eventname));
                }
                assert(function_d03495fe6418377b(eventname));
                assert(function_d03495fe6418377b(#"hash_1e26bad639898fed"));
                var_cf27bc26b98940ab = namespace_649c2fab0fd72b8b::function_d6f771aedba70ce7(eventname, #"hash_1e26bad639898fed");
                if (isdefined(var_cf27bc26b98940ab)) {
                    xpeventparams[xpeventparams.size] = var_cf27bc26b98940ab;
                    xpeventparams[xpeventparams.size] = int(2);
                } else {
                    println("<dev string:x50e>" + function_3c8848a3a11b2553(#"hash_1e26bad639898fed") + "<dev string:x52a>" + 2 + "<dev string:x530>" + function_3c8848a3a11b2553(eventname));
                }
                self.var_5a7aef9c8dd06cdf += var_eae0bcbf8e33e5;
            } else {
                var_6cf32c59a6c7c2d9 = function_5e61313ccc7db173(#"bp", var_158745de00c72d3e);
                if (var_6cf32c59a6c7c2d9 != 0) {
                    assert(function_d03495fe6418377b(eventname));
                    assert(function_d03495fe6418377b(#"hash_f0b251f180942558"));
                    var_cf27bc26b98940ab = namespace_649c2fab0fd72b8b::function_d6f771aedba70ce7(eventname, #"hash_f0b251f180942558");
                    if (isdefined(var_cf27bc26b98940ab)) {
                        xpeventparams[xpeventparams.size] = var_cf27bc26b98940ab;
                        xpeventparams[xpeventparams.size] = int(var_6cf32c59a6c7c2d9);
                    } else {
                        println("<dev string:x50e>" + function_3c8848a3a11b2553(#"hash_f0b251f180942558") + "<dev string:x52a>" + var_6cf32c59a6c7c2d9 + "<dev string:x530>" + function_3c8848a3a11b2553(eventname));
                    }
                    assert(function_d03495fe6418377b(eventname));
                    assert(function_d03495fe6418377b(#"hash_1e26bad639898fed"));
                    var_cf27bc26b98940ab = namespace_649c2fab0fd72b8b::function_d6f771aedba70ce7(eventname, #"hash_1e26bad639898fed");
                    if (isdefined(var_cf27bc26b98940ab)) {
                        xpeventparams[xpeventparams.size] = var_cf27bc26b98940ab;
                        xpeventparams[xpeventparams.size] = int(1);
                    } else {
                        println("<dev string:x50e>" + function_3c8848a3a11b2553(#"hash_1e26bad639898fed") + "<dev string:x52a>" + 1 + "<dev string:x530>" + function_3c8848a3a11b2553(eventname));
                    }
                    self.var_34337227f7ad5ac3 += var_6cf32c59a6c7c2d9;
                }
            }
        }
    }
    if (operatorxp > 0) {
        operatorid = scripts\cp_mp\challenges::function_aff35122a61a900b(self.team);
        assertex(operatorid != 0, "<dev string:x542>");
        assert(function_d03495fe6418377b(eventname));
        assert(function_d03495fe6418377b(#"operator_xp"));
        var_cf27bc26b98940ab = namespace_649c2fab0fd72b8b::function_d6f771aedba70ce7(eventname, #"operator_xp");
        if (isdefined(var_cf27bc26b98940ab)) {
            xpeventparams[xpeventparams.size] = var_cf27bc26b98940ab;
            xpeventparams[xpeventparams.size] = int(operatorxp);
        } else {
            println("<dev string:x50e>" + function_3c8848a3a11b2553(#"operator_xp") + "<dev string:x52a>" + operatorxp + "<dev string:x530>" + function_3c8848a3a11b2553(eventname));
        }
        assert(function_d03495fe6418377b(eventname));
        assert(function_d03495fe6418377b(#"hash_8fba2fc976d0515e"));
        var_cf27bc26b98940ab = namespace_649c2fab0fd72b8b::function_d6f771aedba70ce7(eventname, #"hash_8fba2fc976d0515e");
        if (isdefined(var_cf27bc26b98940ab)) {
            xpeventparams[xpeventparams.size] = var_cf27bc26b98940ab;
            xpeventparams[xpeventparams.size] = int(operatorid);
        } else {
            println("<dev string:x50e>" + function_3c8848a3a11b2553(#"hash_8fba2fc976d0515e") + "<dev string:x52a>" + operatorid + "<dev string:x530>" + function_3c8848a3a11b2553(eventname));
        }
    }
    if (clanXP > 0) {
        assert(function_d03495fe6418377b(eventname));
        assert(function_d03495fe6418377b(#"clan_xp"));
        var_cf27bc26b98940ab = namespace_649c2fab0fd72b8b::function_d6f771aedba70ce7(eventname, #"clan_xp");
        if (isdefined(var_cf27bc26b98940ab)) {
            xpeventparams[xpeventparams.size] = var_cf27bc26b98940ab;
            xpeventparams[xpeventparams.size] = int(clanXP);
        } else {
            println("<dev string:x50e>" + function_3c8848a3a11b2553(#"clan_xp") + "<dev string:x52a>" + clanXP + "<dev string:x530>" + function_3c8848a3a11b2553(eventname));
        }
    }
    assert(function_d03495fe6418377b(eventname));
    assert(function_d03495fe6418377b(#"version"));
    var_cf27bc26b98940ab = namespace_649c2fab0fd72b8b::function_d6f771aedba70ce7(eventname, #"version");
    if (isdefined(var_cf27bc26b98940ab)) {
        xpeventparams[xpeventparams.size] = var_cf27bc26b98940ab;
        xpeventparams[xpeventparams.size] = int(1);
    } else {
        println("<dev string:x50e>" + function_3c8848a3a11b2553(#"version") + "<dev string:x52a>" + 1 + "<dev string:x530>" + function_3c8848a3a11b2553(eventname));
    }
    assert(function_d03495fe6418377b(eventname));
    assert(function_d03495fe6418377b(#"hash_e1ad0562d81a9efa"));
    var_cf27bc26b98940ab = namespace_649c2fab0fd72b8b::function_d6f771aedba70ce7(eventname, #"hash_e1ad0562d81a9efa");
    if (isdefined(var_cf27bc26b98940ab)) {
        xpeventparams[xpeventparams.size] = var_cf27bc26b98940ab;
        xpeventparams[xpeventparams.size] = int(var_22d9ebf9658572ca);
    } else {
        println("<dev string:x50e>" + function_3c8848a3a11b2553(#"hash_e1ad0562d81a9efa") + "<dev string:x52a>" + var_22d9ebf9658572ca + "<dev string:x530>" + function_3c8848a3a11b2553(eventname));
    }
    gamemode = scripts\cp_mp\challenges::getchallengegamemode(self);
    assert(function_d03495fe6418377b(eventname));
    assert(function_d03495fe6418377b(#"gamemode"));
    var_cf27bc26b98940ab = namespace_649c2fab0fd72b8b::function_d6f771aedba70ce7(eventname, #"gamemode");
    if (isdefined(var_cf27bc26b98940ab)) {
        xpeventparams[xpeventparams.size] = var_cf27bc26b98940ab;
        xpeventparams[xpeventparams.size] = int(gamemode);
    } else {
        println("<dev string:x50e>" + function_3c8848a3a11b2553(#"gamemode") + "<dev string:x52a>" + gamemode + "<dev string:x530>" + function_3c8848a3a11b2553(eventname));
    }
    self.pers["summary"]["weaponXP"] = self.pers["summary"]["weaponXP"] + weapon_xp;
    self.pers["summary"]["operatorXP"] = self.pers["summary"]["operatorXP"] + operatorxp;
    self.pers["summary"]["clanXP"] = self.pers["summary"]["clanXP"] + clanXP;
    self.pers["summary"]["battlepassXP"] = self.pers["summary"]["battlepassXP"] + var_158745de00c72d3e;
    if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
        function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", eventid, xpeventparams);
    }
    scripts\mp\analyticslog::logevent_xpearned(self, amount, weapon, weapon_xp, type);
}

// Namespace rank / scripts\mp\rank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5674
// Size: 0x5b
function syncxpstat() {
    xp = getrankxp();
    oldxp = self getplayerdata("common", "mpProgression", "playerLevel", "xp");
    if (oldxp > xp) {
        return;
    }
    self setplayerdata("common", "mpProgression", "playerLevel", "xp", xp);
}

// Namespace rank / scripts\mp\rank
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x56d7
// Size: 0x26
function delayplayerscorepopup(delaytime, event, victim) {
    wait delaytime;
    thread doScoreEvent(event);
}

// Namespace rank / scripts\mp\rank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5705
// Size: 0x98
function getgametypexpmultiplier() {
    var_4edc3c9966d2d422 = getdvarfloat(hashcat(@"scr_", getgametype(), "_match_bonus_scalar_override"), 0);
    if (var_4edc3c9966d2d422 > 0) {
        return var_4edc3c9966d2d422;
    }
    if (getdvarint(@"hash_78653010d584aa6e", 0) == 0) {
        if (!isdefined(level.gametypexpmodifier)) {
            level.gametypexpmodifier = float(tablelookup("mp/gametypesTable.csv", 0, getgametype(), 17));
        }
        return level.gametypexpmodifier;
    }
    return level.gametypebundle.xpscalar;
}

// Namespace rank / scripts\mp\rank
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x57a6
// Size: 0x1d
function addglobalrankxpmultiplier(multiplier, ref) {
    level addrankxpmultiplier(multiplier, ref);
}

// Namespace rank / scripts\mp\rank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57cb
// Size: 0x56
function getglobalrankxpmultiplier() {
    xpmodifier = level getrankxpmultiplier();
    var_18648eb9853b55b = getdvarint(@"hash_a429ab6edb6e3023", 0) == 0;
    if (var_18648eb9853b55b) {
        var_18648eb9853b55b = function_5d1c0ff7078f3160();
    }
    if ((xpmodifier > 4 || xpmodifier < 0) && var_18648eb9853b55b) {
        exitlevel(0);
    }
    return xpmodifier;
}

// Namespace rank / scripts\mp\rank
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x582a
// Size: 0x92
function addrankxpmultiplier(multiplier, ref) {
    maxmultiplier = 4 / level getrankxpmultiplier();
    if (!function_5d1c0ff7078f3160()) {
        maxmultiplier = 2147483647;
    }
    if (multiplier > maxmultiplier) {
        return;
    }
    if (!isdefined(self.rankxpmultipliers)) {
        self.rankxpmultipliers = [];
    }
    if (isdefined(self.rankxpmultipliers[ref])) {
        self.rankxpmultipliers[ref] = max(self.rankxpmultipliers[ref], multiplier);
        return;
    }
    self.rankxpmultipliers[ref] = multiplier;
}

// Namespace rank / scripts\mp\rank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x58c4
// Size: 0x3a
function function_665218c7a5baa481(ref) {
    if (!isdefined(self.rankxpmultipliers) || !isdefined(self.rankxpmultipliers[ref])) {
        return 1;
    }
    return self.rankxpmultipliers[ref];
}

// Namespace rank / scripts\mp\rank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5907
// Size: 0x7e
function getrankxpmultiplier() {
    if (!isdefined(self.rankxpmultipliers)) {
        return 1;
    }
    modifiertotal = 1;
    foreach (modifier in self.rankxpmultipliers) {
        if (!isdefined(modifier)) {
            continue;
        }
        modifiertotal *= modifier;
    }
    return modifiertotal;
}

// Namespace rank / scripts\mp\rank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x598e
// Size: 0x53
function getplatformrankxpmultiplier() {
    if (getgametype() == "br" && self isbnetigrplayer()) {
        return getbnetigrplayerxpmultiplier();
    } else if (self isps4player()) {
        var_3901ab9d84bedb23 = getdvarfloat(@"hash_10f733902fb6e20", 1);
        return var_3901ab9d84bedb23;
    }
    return 1;
}

// Namespace rank / scripts\mp\rank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x59ea
// Size: 0x14
function removeglobalrankxpmultiplier(ref) {
    level removerankxpmultiplier(ref);
}

// Namespace rank / scripts\mp\rank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a06
// Size: 0x60
function removerankxpmultiplier(ref) {
    if (!isdefined(self.rankxpmultipliers)) {
        assertmsg("<dev string:x575>" + ref + "<dev string:x59e>");
        return;
    }
    if (!isdefined(self.rankxpmultipliers[ref])) {
        assertmsg("<dev string:x575>" + ref + "<dev string:x5c9>");
        return;
    }
    self.rankxpmultipliers[ref] = undefined;
}

// Namespace rank / scripts\mp\rank
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5a6e
// Size: 0xa5
function addteamrankxpmultiplier(multiplier, team, ref) {
    if (!level.teambased) {
        team = "all";
    }
    if (!isdefined(self.teamrankxpmultipliers)) {
        level.teamrankxpmultipliers = [];
    }
    if (!isdefined(level.teamrankxpmultipliers[team])) {
        level.teamrankxpmultipliers[team] = [];
    }
    if (isdefined(level.teamrankxpmultipliers[team][ref])) {
        level.teamrankxpmultipliers[team][ref] = max(self.teamrankxpmultipliers[team][ref], multiplier);
        return;
    }
    level.teamrankxpmultipliers[team][ref] = multiplier;
}

// Namespace rank / scripts\mp\rank
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5b1b
// Size: 0x69
function function_3c5e15b220a3852a(team, ref) {
    if (!level.teambased) {
        team = "all";
    }
    if (!isdefined(self.teamrankxpmultipliers) || !isdefined(level.teamrankxpmultipliers[team]) || !isdefined(level.teamrankxpmultipliers[team][ref])) {
        return 1;
    }
    return level.teamrankxpmultipliers[team][ref];
}

// Namespace rank / scripts\mp\rank
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5b8d
// Size: 0xa5
function removeteamrankxpmultiplier(team, ref) {
    if (!level.teambased) {
        team = "all";
    }
    if (!isdefined(level.teamrankxpmultipliers)) {
        assertmsg("<dev string:x5f8>" + ref + "<dev string:x625>");
        return;
    }
    if (!isdefined(level.teamrankxpmultipliers[team])) {
        assertmsg("<dev string:x5f8>" + ref + "<dev string:x655>");
        return;
    }
    if (!isdefined(level.teamrankxpmultipliers[team][ref])) {
        assertmsg("<dev string:x5f8>" + ref + "<dev string:x693>");
        return;
    }
    level.teamrankxpmultipliers[team][ref] = undefined;
}

// Namespace rank / scripts\mp\rank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5c3a
// Size: 0xb3
function getteamrankxpmultiplier(team) {
    if (!level.teambased) {
        team = "all";
    }
    if (!isdefined(team) || !isdefined(level.teamrankxpmultipliers) || !isdefined(level.teamrankxpmultipliers[team])) {
        return 1;
    }
    modifiertotal = 1;
    foreach (modifier in level.teamrankxpmultipliers[team]) {
        if (!isdefined(modifier)) {
            continue;
        }
        modifiertotal *= modifier;
    }
    return modifiertotal;
}

// Namespace rank / scripts\mp\rank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5cf6
// Size: 0x30
function function_6f7831412184db23() {
    var_48a136866e33614c = 1;
    if (istrue(scripts\mp\playerlogic::function_1761d46d3de136b9())) {
        var_48a136866e33614c = 2;
    }
    return max(var_48a136866e33614c, getglobalrankxpmultiplier());
}

// Namespace rank / scripts\mp\rank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d2f
// Size: 0x5f
function getrankxpmultipliertotal() {
    playermodifier = getrankxpmultiplier();
    globalmodifier = function_6f7831412184db23();
    teammodifier = getteamrankxpmultiplier(self.team);
    platformmodifier = getplatformrankxpmultiplier();
    returnval = playermodifier * globalmodifier * teammodifier * platformmodifier;
    return returnval;
}

// Namespace rank / scripts\mp\rank
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5d97
// Size: 0x1d
function function_b1bbf2ba52eb5c94(multiplier, ref) {
    level function_e43f9c736a23f8a7(multiplier, ref);
}

// Namespace rank / scripts\mp\rank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5dbc
// Size: 0x56
function function_5adb64ffe05cc777() {
    xpmodifier = level function_4beaed7d0e5c5b78();
    var_18648eb9853b55b = getdvarint(@"hash_a429ab6edb6e3023", 0) == 0;
    if (var_18648eb9853b55b) {
        var_18648eb9853b55b = function_5d1c0ff7078f3160();
    }
    if ((xpmodifier > 4 || xpmodifier < 0) && var_18648eb9853b55b) {
        exitlevel(0);
    }
    return xpmodifier;
}

// Namespace rank / scripts\mp\rank
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5e1b
// Size: 0x92
function function_e43f9c736a23f8a7(multiplier, ref) {
    maxmultiplier = 4 / level function_4beaed7d0e5c5b78();
    if (!function_5d1c0ff7078f3160()) {
        maxmultiplier = 2147483647;
    }
    if (multiplier > maxmultiplier) {
        return;
    }
    if (!isdefined(self.var_2914ba3b302ca331)) {
        self.var_2914ba3b302ca331 = [];
    }
    if (isdefined(self.var_2914ba3b302ca331[ref])) {
        self.var_2914ba3b302ca331[ref] = max(self.var_2914ba3b302ca331[ref], multiplier);
        return;
    }
    self.var_2914ba3b302ca331[ref] = multiplier;
}

// Namespace rank / scripts\mp\rank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5eb5
// Size: 0x27
function function_6352822c84cb9722() {
    playermodifier = function_4beaed7d0e5c5b78();
    globalmodifier = function_e7b697c34bea0fc1();
    return playermodifier * globalmodifier;
}

// Namespace rank / scripts\mp\rank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5ee5
// Size: 0x7e
function function_4beaed7d0e5c5b78() {
    if (!isdefined(self.var_2914ba3b302ca331)) {
        return 1;
    }
    modifiertotal = 1;
    foreach (modifier in self.var_2914ba3b302ca331) {
        if (!isdefined(modifier)) {
            continue;
        }
        modifiertotal *= modifier;
    }
    return modifiertotal;
}

// Namespace rank / scripts\mp\rank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f6c
// Size: 0x9
function function_e7b697c34bea0fc1() {
    return level function_4beaed7d0e5c5b78();
}

// Namespace rank / scripts\mp\rank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f7e
// Size: 0x61
function function_531e069621c1f4c2() {
    if (getdvarint(@"hash_78653010d584aa6e", 0) == 0) {
        if (!isdefined(level.gametypeweaponxpmodifier)) {
            level.gametypeweaponxpmodifier = float(tablelookup("mp/gametypesTable.csv", 0, getgametype(), 19));
        }
        return level.gametypeweaponxpmodifier;
    }
    return level.gametypebundle.var_3c836934a83182a5;
}

// Namespace rank / scripts\mp\rank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5fe8
// Size: 0x7
function function_7e269762b075143d() {
    return true;
}

/#

    // Namespace rank / scripts\mp\rank
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x5ff8
    // Size: 0x150
    function function_f440a654d455343e(type, amount) {
        if (getdvarint(@"hash_a59ff2bb10f08cc9", 0) == 1) {
            if (!isdefined(self.xpamountdebug)) {
                self.xpamountdebug = [];
            }
            if (!isdefined(self.xpamountdebug[type])) {
                self.xpamountdebug[type] = 0;
            }
            self.xpamountdebug[type] = self.xpamountdebug[type] + amount;
            println("<dev string:x6d1>" + self.name + "<dev string:x6d1>");
            println("<dev string:x6e4>");
            println("<dev string:x6f4>" + function_3c8848a3a11b2553(type) + "<dev string:x6fb>" + amount);
            println("<dev string:x700>" + getrankxpmultipliertotal());
            println("<dev string:x713>");
            println("<dev string:x737>");
            foreach (key, value in self.xpamountdebug) {
                println("<dev string:x6f4>" + function_3c8848a3a11b2553(key) + "<dev string:x6fb>" + value);
            }
            println("<dev string:x713>");
        }
    }

#/

// Namespace rank / scripts\mp\rank
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6150
// Size: 0x35
function function_fe885eed6609e08a(value, var_b01aca3236595958) {
    if (isdefined(var_b01aca3236595958) && isdefined(var_b01aca3236595958.basexp)) {
        return var_b01aca3236595958.basexp;
    }
    return value;
}

// Namespace rank / scripts\mp\rank
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x618e
// Size: 0x35
function function_78802b8c6de6eeba(value, var_b01aca3236595958) {
    if (isdefined(var_b01aca3236595958) && isdefined(var_b01aca3236595958.bonusxp)) {
        return var_b01aca3236595958.bonusxp;
    }
    return value;
}

// Namespace rank / scripts\mp\rank
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x61cc
// Size: 0x35
function function_c18c8bb0776284c6(value, var_b01aca3236595958) {
    if (isdefined(var_b01aca3236595958) && isdefined(var_b01aca3236595958.timexp)) {
        return var_b01aca3236595958.timexp;
    }
    return value;
}

// Namespace rank / scripts\mp\rank
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x620a
// Size: 0x35
function function_9e1336d25eb66326(value, var_b01aca3236595958) {
    if (isdefined(var_b01aca3236595958) && isdefined(var_b01aca3236595958.placementxp)) {
        return var_b01aca3236595958.placementxp;
    }
    return value;
}

// Namespace rank / scripts\mp\rank
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6248
// Size: 0x35
function function_c465f9a27979c865(value, var_b01aca3236595958) {
    if (isdefined(var_b01aca3236595958) && isdefined(var_b01aca3236595958.finalxp)) {
        return var_b01aca3236595958.finalxp;
    }
    return value;
}

// Namespace rank / scripts\mp\rank
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6286
// Size: 0x35
function function_736110bfd2a3a5ea(value, var_b01aca3236595958) {
    if (isdefined(var_b01aca3236595958) && isdefined(var_b01aca3236595958.basexp)) {
        return var_b01aca3236595958.basexp;
    }
    return value;
}

// Namespace rank / scripts\mp\rank
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x62c4
// Size: 0x35
function function_199d881c43179c3f(value, var_b01aca3236595958) {
    if (isdefined(var_b01aca3236595958) && isdefined(var_b01aca3236595958.weaponxp)) {
        return var_b01aca3236595958.weaponxp;
    }
    return value;
}

// Namespace rank / scripts\mp\rank
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6302
// Size: 0x35
function function_64ca1aa18fdeabc(value, var_b01aca3236595958) {
    if (isdefined(var_b01aca3236595958) && isdefined(var_b01aca3236595958.weaponlootid)) {
        return var_b01aca3236595958.weaponlootid;
    }
    return value;
}

// Namespace rank / scripts\mp\rank
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6340
// Size: 0x35
function function_744c50f3c54a2ed8(value, eventinfo) {
    if (isdefined(eventinfo) && isdefined(eventinfo.var_158745de00c72d3e)) {
        return eventinfo.var_158745de00c72d3e;
    }
    return value;
}

