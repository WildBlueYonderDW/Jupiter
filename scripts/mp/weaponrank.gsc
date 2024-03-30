// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3f8889c16399185c;
#using script_2669878cf5a1b6bc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\analyticslog.gsc;

#namespace weaponrank;

// Namespace weaponrank / scripts/mp/weaponrank
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41c
// Size: 0x89
function init() {
    /#
        if (getdvarint(@"hash_e6afce2cf5cf7515", 0)) {
            return;
        }
    #/
    loadweaponranktable();
    level.var_b883cc44c69244ca = getdvarint(@"hash_53b03e37a92e4ce8", 1) == 1;
    level.var_4ea3e75e13f80da0 = getdvarfloat(@"hash_ca4ce52ff089426", 0.2);
    var_8215d55ce8caee38 = getdvarint(@"hash_dc3e80d2e74fb4b5", 1);
    addglobalweaponrankxpmultiplier(var_8215d55ce8caee38, "online_mp_weapon_xpscale");
    level thread onplayerconnect();
}

// Namespace weaponrank / scripts/mp/weaponrank
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ac
// Size: 0x6d
function onplayerconnect() {
    for (;;) {
        player = level waittill("connected");
        if (!isai(player)) {
            if (level.weaponxpenabled) {
                var_69a07d6024aeb70b = getdvarint(@"hash_2bdc03077e6414dc");
                isinparty = player getprivatepartysize() > 1;
                if (isinparty) {
                    player addweaponrankxpmultiplier(var_69a07d6024aeb70b, "online_mp_party_weapon_xpscale");
                }
            }
        }
    }
}

// Namespace weaponrank / scripts/mp/weaponrank
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x520
// Size: 0x2c6
function loadweaponranktable() {
    level.weaponranktable = spawnstruct();
    level.weaponranktable.rankinfo = [];
    var_c6e3b34739982959 = function_b1e11b17e1fbded3();
    level.weaponranktable.maxrank = var_c6e3b34739982959.maxrank;
    for (rankid = 0; rankid <= level.weaponranktable.maxrank; rankid++) {
        weaponranktableentry = function_91ce54da71d1008d(var_c6e3b34739982959.weaponranklist[rankid].rank);
        rankinfo = spawnstruct();
        level.weaponranktable.rankinfo[rankid] = rankinfo;
        rankinfo.minxp = weaponranktableentry.minxp;
        rankinfo.xptonextrank = weaponranktableentry.xptonext;
        rankinfo.maxxp = weaponranktableentry.maxxp;
        /#
            assertex(rankinfo.minxp + rankinfo.xptonextrank == rankinfo.maxxp, "weaponRankTable entry " + rankid + " has values that don't add up, check weaponranktable gdt");
        #/
    }
    level.weaponranktable.maxweaponranks = [];
    weaponsscriptbundle = namespace_e0ee43ef2dddadaa::function_a221d76594ef4e8b();
    if (isdefined(weaponsscriptbundle)) {
        foreach (weaponname in weaponsscriptbundle) {
            weaponscriptbundle = namespace_e0ee43ef2dddadaa::function_8477d8595e0364a7(weaponname, [#"ref", #"maxrank"]);
            if (isdefined(weaponscriptbundle)) {
                rootname = weaponscriptbundle.ref;
                maxrank = weaponscriptbundle.maxrank;
                if (!isdefined(rootname) || rootname == "" || !isdefined(maxrank)) {
                    continue;
                }
                maxrank = int(maxrank);
                /#
                    assertex(maxrank <= level.weaponranktable.maxrank, "Statstable entry for "" + rootname + "" has a max rank of " + maxrank + " but weaponRankTable bundle only goes up to " + level.weaponranktable.maxrank);
                #/
                level.weaponranktable.maxweaponranks[rootname] = maxrank;
            }
        }
    }
    /#
        assertex(level.weaponranktable.maxweaponranks.size > 0, "Found no valid leveling weapons while parsing StatsTable.csv. This is likely an error");
    #/
}

// Namespace weaponrank / scripts/mp/weaponrank
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ed
// Size: 0x41
function getplayerweaponrank(rootweapon) {
    /#
        assert(weaponhasranks(rootweapon));
    #/
    weaponxp = getplayerweaponrankxp(rootweapon);
    rank = getweaponrankforxp(weaponxp);
    return rank;
}

// Namespace weaponrank / scripts/mp/weaponrank
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x836
// Size: 0xf0
function getplayerweaponrankxp(rootweapon, type) {
    /#
        assertex(weaponshouldgetxp(rootweapon), "getWeaponRankXP() called for a weapon that should can not gain XP");
    #/
    if (!isdefined(type)) {
        type = "all";
    }
    switch (type) {
    case #"hash_fa24c8f6bd607cf8":
        mpxp = self getplayerdata("common", "sharedProgression", "weaponLevel", rootweapon, "mpXP");
        return mpxp;
    case #"hash_fa1ebcf6bd5bece6":
        cpXP = self getplayerdata("common", "sharedProgression", "weaponLevel", rootweapon, "cpXP");
        return cpXP;
    case #"hash_c482c6c109150a4":
        mpxp = self getplayerdata("common", "sharedProgression", "weaponLevel", rootweapon, "mpXP");
        cpXP = self getplayerdata("common", "sharedProgression", "weaponLevel", rootweapon, "cpXP");
        return (mpxp + cpXP);
    }
}

// Namespace weaponrank / scripts/mp/weaponrank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x92d
// Size: 0x43
function isplayerweaponatmaxxp(rootweapon) {
    /#
        assert(weaponhasranks(rootweapon));
    #/
    currentxp = getplayerweaponrankxp(rootweapon);
    maxxp = getweaponmaxrankxp(rootweapon);
    return currentxp >= maxxp;
}

// Namespace weaponrank / scripts/mp/weaponrank
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x978
// Size: 0x72
function weaponshouldgetxp(weapon) {
    var_f486e79b42c6cbec = getdvarint(@"hash_39c5e2e95ae3c2e6", 1) == 1;
    if (!var_f486e79b42c6cbec && self.pers["rank"] < 3 && !getdvarint(@"hash_37acf332efd205cc")) {
        return 0;
    }
    rootname = getweaponrootname(weapon);
    return weaponhasranks(rootname);
}

// Namespace weaponrank / scripts/mp/weaponrank
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f2
// Size: 0x76
function weaponhasranks(rootname) {
    if (!isdefined(level.weaponranktable.maxweaponranks[rootname])) {
        return 0;
    }
    hasranks = level.weaponranktable.maxweaponranks[rootname] > 0;
    /#
        assertex(!hasranks || isenumvaluevalid("common", "LoadoutWeapon", rootname), """ + rootname + "" has a max weapon rank listed in statstable.csv, but is not in the LoadoutWeapons enum in playerdata");
    #/
    return hasranks;
}

// Namespace weaponrank / scripts/mp/weaponrank
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa70
// Size: 0x35
function getweaponmaxrankxp(rootweapon) {
    /#
        assert(weaponhasranks(rootweapon));
    #/
    maxrank = getmaxweaponrankforrootweapon(rootweapon);
    return getweaponrankinfomaxxp(maxrank);
}

// Namespace weaponrank / scripts/mp/weaponrank
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaad
// Size: 0x43
function getweaponrankforxp(xpval) {
    if (xpval == 0) {
        return 0;
    }
    for (rankid = getmaxweaponrank() - 1; rankid >= 0; rankid--) {
        if (xpval >= getweaponrankinfominxp(rankid)) {
            return rankid;
        }
    }
    return rankid;
}

// Namespace weaponrank / scripts/mp/weaponrank
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf8
// Size: 0x31
function getmaxweaponrankforrootweapon(rootweapon) {
    /#
        assert(weaponhasranks(rootweapon));
    #/
    return level.weaponranktable.maxweaponranks[rootweapon];
}

// Namespace weaponrank / scripts/mp/weaponrank
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb31
// Size: 0x16
function getmaxweaponrank() {
    return level.weaponranktable.maxrank;
}

// Namespace weaponrank / scripts/mp/weaponrank
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb4f
// Size: 0x2b
function getweaponrankinfominxp(rankid) {
    return level.weaponranktable.rankinfo[rankid].minxp;
}

// Namespace weaponrank / scripts/mp/weaponrank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb82
// Size: 0x2b
function getweaponrankinfoxptonextrank(rankid) {
    return level.weaponranktable.rankinfo[rankid].xptonextrank;
}

// Namespace weaponrank / scripts/mp/weaponrank
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb5
// Size: 0x2b
function getweaponrankinfomaxxp(rankid) {
    return level.weaponranktable.rankinfo[rankid].maxxp;
}

// Namespace weaponrank / scripts/mp/weaponrank
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xbe8
// Size: 0x28c
function giveplayerweaponxp(objweapon, type, xp) {
    if (isai(self) || !isplayer(self) || !isdefined(xp) || xp == 0 || !level.weaponxpenabled) {
        return;
    }
    rootweapon = getweaponrootname(objweapon.basename);
    if (!self isitemunlocked(rootweapon, "weapon")) {
        return;
    }
    if (!weaponhasranks(rootweapon)) {
        return;
    }
    newtype = remapscoreeventforweapon(type);
    if (newtype != type) {
        type = newtype;
        xp = scripts/mp/rank::getscoreinfoxp(type);
    }
    if (xp < 0) {
        /#
            assertmsg("Attempting to give negative weapon XP.");
        #/
        return;
    }
    basexp = xp;
    xp = xp * getweaponrankxpmultipliertotal();
    xp = int(xp);
    var_d6c1d2574e3947c7 = getplayerweaponrankxp(rootweapon, "mp");
    var_6e5c89151ed6e249 = getplayerweaponrankxp(rootweapon, "cp");
    var_d9e44a427ec4c8d9 = var_d6c1d2574e3947c7 + var_6e5c89151ed6e249;
    oldrank = getweaponrankforxp(var_d9e44a427ec4c8d9);
    maxxp = getweaponmaxrankxp(rootweapon);
    var_bc811beec61533e0 = maxxp - var_6e5c89151ed6e249;
    var_ccc135d35f5bebc8 = var_d6c1d2574e3947c7 + xp;
    if (var_ccc135d35f5bebc8 > var_bc811beec61533e0) {
        var_ccc135d35f5bebc8 = var_bc811beec61533e0;
    }
    var_2993edf5241f55a = var_ccc135d35f5bebc8 + var_6e5c89151ed6e249;
    maxrank = getmaxweaponrankforrootweapon(rootweapon);
    current_prestige = self getplayerdata("common", "sharedProgression", "weaponLevel", rootweapon, "prestige");
    current_rank = int(min(getweaponrankforxp(var_2993edf5241f55a), maxrank));
    scripts/mp/analyticslog::logevent_givempweaponxp(objweapon, current_prestige, current_rank, xp, type);
    if (oldrank < current_rank) {
        var_9060bffe66826b8c = #"hash_e9aa6f742889a408";
        if (current_rank >= 15) {
            var_9060bffe66826b8c = #"hash_df87536a55018058";
        } else if (current_rank >= 10) {
            var_9060bffe66826b8c = #"hash_db8b62b195e166e8";
        } else if (current_rank >= 5) {
            var_9060bffe66826b8c = #"hash_2235f7435f85418";
        }
        var_12239dca1aef95cd = scripts/mp/rank::getscoreinfoxp(var_9060bffe66826b8c);
        scripts/mp/rank::giverankxp(var_9060bffe66826b8c, var_12239dca1aef95cd);
    }
    /#
        println("removeWeaponRankXPMultiplier() called for "" + rootweapon + "<unknown string>" + xp);
        println("<unknown string>" + xp - basexp);
    #/
    return xp;
}

// Namespace weaponrank / scripts/mp/weaponrank
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe7c
// Size: 0x42
function remapscoreeventforweapon(event) {
    switch (event) {
    case #"hash_611825599f1b56f9":
        event = "kill_weapon";
        break;
    case #"hash_5b8ea26626b7f31e":
        event = "weapon_challenge";
        break;
    }
    return event;
}

// Namespace weaponrank / scripts/mp/weaponrank
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec6
// Size: 0x1e
function addglobalweaponrankxpmultiplier(multiplier, ref) {
    level addweaponrankxpmultiplier(multiplier, ref);
}

// Namespace weaponrank / scripts/mp/weaponrank
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeeb
// Size: 0xa
function getglobalweaponrankxpmultiplier() {
    return level getweaponrankxpmultiplier();
}

// Namespace weaponrank / scripts/mp/weaponrank
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xefd
// Size: 0x8
function getplatformweaponrankxpmultiplier() {
    return true;
}

// Namespace weaponrank / scripts/mp/weaponrank
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf0d
// Size: 0x80
function function_9c989ce157528a7e(objweapon) {
    if (!istrue(level.var_b883cc44c69244ca)) {
        return 1;
    }
    if (!isdefined(objweapon)) {
        return 1;
    }
    rootweapon = getweaponrootname(objweapon);
    if (isdefined(rootweapon) && isdefined(level.weaponmapdata[rootweapon]) && istrue(level.weaponmapdata[rootweapon].var_b883cc44c69244ca)) {
        return (1 + level.var_4ea3e75e13f80da0);
    }
    return 1;
}

// Namespace weaponrank / scripts/mp/weaponrank
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf95
// Size: 0x67
function addweaponrankxpmultiplier(multiplier, ref) {
    if (!isdefined(self.weaponrankxpmultipliers)) {
        self.weaponrankxpmultipliers = [];
    }
    if (isdefined(self.weaponrankxpmultipliers[ref])) {
        self.weaponrankxpmultipliers[ref] = max(self.weaponrankxpmultipliers[ref], multiplier);
        return;
    }
    self.weaponrankxpmultipliers[ref] = multiplier;
}

// Namespace weaponrank / scripts/mp/weaponrank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1003
// Size: 0x3b
function function_e45154ff0dfc8771(ref) {
    if (!isdefined(self.weaponrankxpmultipliers) || !isdefined(self.weaponrankxpmultipliers[ref])) {
        return 1;
    }
    return self.weaponrankxpmultipliers[ref];
}

// Namespace weaponrank / scripts/mp/weaponrank
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1046
// Size: 0x81
function getweaponrankxpmultiplier() {
    if (!isdefined(self.weaponrankxpmultipliers)) {
        return 1;
    }
    modifiertotal = 1;
    foreach (modifier in self.weaponrankxpmultipliers) {
        if (!isdefined(modifier)) {
            continue;
        }
        modifiertotal = modifiertotal * modifier;
    }
    return modifiertotal;
}

// Namespace weaponrank / scripts/mp/weaponrank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10cf
// Size: 0x15
function removeglobalweaponrankxpmultiplier(ref) {
    level removeweaponrankxpmultiplier(ref);
}

// Namespace weaponrank / scripts/mp/weaponrank
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10eb
// Size: 0x61
function removeweaponrankxpmultiplier(ref) {
    if (!isdefined(self.weaponrankxpmultipliers)) {
        /#
            assertmsg("removeWeaponRankXPMultiplier() called for "" + ref + "", but no xp modifiers have been added.");
        #/
        return;
    }
    if (!isdefined(self.weaponrankxpmultipliers[ref])) {
        /#
            assertmsg("removeWeaponRankXPMultiplier() called for "" + ref + "", but that xp modifier has not been added.");
        #/
        return;
    }
    self.rankxpmultipliers[ref] = undefined;
}

// Namespace weaponrank / scripts/mp/weaponrank
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1153
// Size: 0x6b
function getweaponrankxpmultipliertotal(objweapon) {
    playermodifier = getweaponrankxpmultiplier();
    globalmodifier = getglobalweaponrankxpmultiplier();
    gametypemodifier = getgametypeweaponxpmultiplier();
    platformmodifier = getplatformweaponrankxpmultiplier();
    var_c4843c7f58599a44 = function_9c989ce157528a7e(objweapon);
    return playermodifier * globalmodifier * gametypemodifier * platformmodifier * var_c4843c7f58599a44;
}

// Namespace weaponrank / scripts/mp/weaponrank
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11c6
// Size: 0x9c
function getgametypeweaponxpmultiplier() {
    dvarscalar = getdvarfloat(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_weapon_xp_scalar_override"), 0);
    if (dvarscalar > 0) {
        return dvarscalar;
    }
    if (getdvarint(@"hash_78653010d584aa6e", 0) == 0) {
        if (!isdefined(level.gametypeweaponxpmodifier)) {
            level.gametypeweaponxpmodifier = float(tablelookup("mp/gametypesTable.csv", 0, getgametype(), 19));
        }
        return level.gametypeweaponxpmodifier;
    }
    return level.gametypebundle.var_3c836934a83182a5;
}

// Namespace weaponrank / scripts/mp/weaponrank
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x126a
// Size: 0x62
function getgametypekillsperhouravg() {
    if (getdvarint(@"hash_78653010d584aa6e", 0) == 0) {
        if (!isdefined(level.gametypekillsperhouravg)) {
            level.gametypekillsperhouravg = int(tablelookup("mp/gametypesTable.csv", 0, getgametype(), 20));
        }
        return level.gametypekillsperhouravg;
    }
    return level.gametypebundle.var_d98341b1a105c7af;
}

// Namespace weaponrank / scripts/mp/weaponrank
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12d4
// Size: 0x9e
function getgametypekillspermatchmaximum() {
    if (!isdefined(level.gametypekillspermatchmax)) {
        timelimit = getdvarint(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_timelimit"));
        if (timelimit == 0) {
            timelimit = 900;
        }
        winlimit = getdvarint(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_winlimit"));
        if (winlimit > 0) {
            timelimit = timelimit * (winlimit * 2 - 1);
        }
        level.gametypekillspermatchmax = getgametypekillsperhouravg() / 60 * timelimit / 60;
    }
    return level.gametypekillspermatchmax;
}

