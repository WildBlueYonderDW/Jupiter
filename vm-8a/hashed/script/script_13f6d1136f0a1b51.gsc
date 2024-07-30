#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\gametypes\gun.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\utility\weapon.gsc;
#using script_5762ac2f22202ba2;
#using scripts\mp\cranked.gsc;
#using script_7ef95bba57dc4b82;
#using scripts\mp\equipment.gsc;
#using scripts\mp\equipment\snapshot_grenade.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\cp_mp\killstreaks\uav.gsc;
#using scripts\mp\tweakables.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\class.gsc;
#using scripts\cp_mp\utility\dialog_utility.gsc;
#using scripts\mp\spawnscoring.gsc;
#using scripts\mp\gamelogic.gsc;

#namespace havoc;

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x886
// Size: 0x1ef
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    level.var_46e88d936db0725c = [];
    level.var_374e02799ae6ce92 = getdvarint(@"hash_229f46b375f83420", 75);
    scripts\mp\globallogic::init();
    scripts\mp\globallogic::setupcallbacks();
    allowed[0] = getgametype();
    scripts\mp\gameobjects::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registerroundswitchdvar(getgametype(), 0, 0, 9);
        registertimelimitdvar(getgametype(), 600);
        registerroundlimitdvar(getgametype(), 1);
        registerwinlimitdvar(getgametype(), 1);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
        function_704789086c9ad943(getgametype(), 1);
    }
    registerscorelimitdvar(getgametype(), level.var_374e02799ae6ce92);
    updategametypedvars();
    function_c153b3be3a868971();
    level.teambased = 1;
    level.onstartgametype = &onstartgametype;
    level.getspawnpoint = &getspawnpoint;
    level.onnormaldeath = &onnormaldeath;
    level.onsuicidedeath = &onsuicidedeath;
    level.onteamchangedeath = &onsuicidedeath;
    level.modeonspawnplayer = &onspawnplayer;
    level.var_16aa7ce5efacbccb = 1;
    /#
        setdevdvarifuninitialized(@"hash_97c9e7f247669d0a", 0);
        setdevdvarifuninitialized(@"hash_20d78d09742ab023", "<dev string:x1c>");
        setdevdvarifuninitialized(@"hash_d3324e2adafbcfa9", "<dev string:x1c>");
    #/
    if (matchmakinggame()) {
        level.shouldgamelobbyremainintact = &shouldgamelobbyremainintact;
    }
    /#
        level.reinitspawns = &reinitspawns;
    #/
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa7d
// Size: 0x3b
function function_c153b3be3a868971() {
    game["dialog"]["gametype"] = "iw9_havc_mode_uktl_name";
    game["dialog"]["mod_incoming"] = "havoc_mod_incoming";
    game["dialog"]["mod_activated"] = "havoc_mod_activated";
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xac0
// Size: 0x9
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xad1
// Size: 0x174
function onstartgametype() {
    setclientnamemode("auto_change");
    if (!isdefined(game["switchedsides"])) {
        game["switchedsides"] = 0;
    }
    if (game["switchedsides"]) {
        oldattackers = game["attackers"];
        olddefenders = game["defenders"];
        game["attackers"] = olddefenders;
        game["defenders"] = oldattackers;
    }
    foreach (entry in level.teamnamelist) {
        setobjectivetext(entry, %OBJECTIVES/HAVOC);
        if (level.splitscreen) {
            setobjectivescoretext(entry, %OBJECTIVES/HAVOC);
        } else {
            setobjectivescoretext(entry, %OBJECTIVES/HAVOC_SCORE);
        }
        setobjectivehinttext(entry, %OBJECTIVES/HAVOC_HINT);
    }
    if (isdefined(level.initspawnsoverridefunc)) {
        [[ level.initspawnsoverridefunc ]]();
    } else {
        initspawns();
    }
    level.disablepersonalnuke = 1;
    level.var_c423c2360ca0dac5 = 1;
    function_b7752de07ea1870c();
    function_8c14093fb58b4e65();
    function_c2a7ea1687dfd306();
    function_905b2f805251e716();
    function_eee04ff98ccc9115();
    level thread function_4a3f65052dc511b2();
    level thread function_3c5cbe539052ea87();
    /#
        level thread function_63703b676d8d7c5d();
        level thread function_5beede1cf589d53e();
    #/
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc4d
// Size: 0xd1
function function_b7752de07ea1870c() {
    level.var_275f722de69e61a = [];
    function_722a88b02b9c6a83("game", "loadoutperksoff", 1);
    function_722a88b02b9c6a83("game", "perkpackage", 0);
    function_722a88b02b9c6a83("game", "showperksonspawn", 0);
    function_722a88b02b9c6a83("game", "minfalldamageheight", 225, 1);
    function_722a88b02b9c6a83("game", "herodrop", 0, 1);
    function_722a88b02b9c6a83("game", "one_tap_headshot", 0, 1);
    function_722a88b02b9c6a83("game", "lowgravity", 0, 1);
    function_722a88b02b9c6a83("game", "lowgravitystrength", 125, 1);
    function_722a88b02b9c6a83("team", "fftype", 0, 1);
    function_722a88b02b9c6a83("team", "teamkillspawndelay", 0, 1);
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd26
// Size: 0x24a
function function_8c14093fb58b4e65() {
    level.havoc_mods = [];
    level.var_3e4609e79ec16d7a = [];
    level.var_5c710278dd543e5c = [];
    level.var_31504a1b9e6cbdef = 0;
    level.var_dd052853f1cd3164 = [];
    level.var_dc4da78db330c5b5 = getdvarint(@"hash_2f01a491b1940657", 5);
    level.var_cfb17092bbc28b8b = int(level.var_374e02799ae6ce92 - level.var_374e02799ae6ce92 / level.var_dc4da78db330c5b5);
    level.var_e757fcf09fbb5ec0 = getdvarint(@"hash_c8f0ab916692bfbb", int(level.var_cfb17092bbc28b8b / level.var_dc4da78db330c5b5));
    newscorethreshold = level.var_e757fcf09fbb5ec0;
    for (i = 0; i < function_1cc9618aae9bbc8(); i++) {
        level.var_dd052853f1cd3164[level.var_dd052853f1cd3164.size] = newscorethreshold;
        newscorethreshold += level.var_e757fcf09fbb5ec0;
    }
    setomnvar("ui_havoc_show_mod", -1);
    setomnvar("ui_havoc_threshold_progress", 0);
    setomnvar("ui_havoc_score_threshold", level.var_31504a1b9e6cbdef);
    setomnvar("ui_havoc_mod_status_1", -1);
    setomnvar("ui_havoc_mod_status_2", -1);
    setomnvar("ui_havoc_mod_status_3", -1);
    setomnvar("ui_havoc_mod_status_4", -1);
    setomnvar("ui_havoc_mod_status_5", -1);
    numrows = tablelookupgetnumrows("mp/havoc_mods.csv");
    for (index = 0; index < numrows; index++) {
        modindex = tablelookupbyrow("mp/havoc_mods.csv", index, 0);
        if (modindex == "") {
            continue;
        }
        modcategory = tablelookupbyrow("mp/havoc_mods.csv", index, 1);
        modref = tablelookupbyrow("mp/havoc_mods.csv", index, 2);
        modrestore = tablelookupbyrow("mp/havoc_mods.csv", index, 5);
        var_6f6fd32d3dd289e0 = tablelookupbyrow("mp/havoc_mods.csv", index, 6);
        var_3804a6d6dbf6fddb = tablelookupbyrow("mp/havoc_mods.csv", index, 7);
        function_d7d6624794ccbded(modindex, modcategory, modref, modrestore, var_6f6fd32d3dd289e0, var_3804a6d6dbf6fddb);
    }
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf78
// Size: 0x27
function function_c2a7ea1687dfd306() {
    level.var_719290ba2ca20fdc = ["specialty_fastreload", "specialty_third_person", "specialty_commando"];
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfa7
// Size: 0xc1
function function_905b2f805251e716() {
    level.ladderindex = dvarintvalue("ladderIndex", 1, 1, 6);
    scripts\mp\gametypes\gun::function_6b7afefdbeeeec0a();
    level.var_3de0640c640e8ee0 = [];
    for (i = 0; i < 50; i++) {
        var_c69da2d2fff3aac5 = function_6149c1c60fce42b3();
        randomcategory = var_c69da2d2fff3aac5[randomint(var_c69da2d2fff3aac5.size)];
        weapondata = scripts\mp\gametypes\gun::function_5f97f15e9ca6cb6(randomcategory);
        weaponobj = scripts\mp\gametypes\gun::function_96d23570114bc7b6(weapondata);
        if (isnullweapon(weaponobj)) {
            /#
                iprintln("<dev string:x1d>" + randomcategory);
            #/
            continue;
        }
        level.var_3de0640c640e8ee0[level.var_3de0640c640e8ee0.size] = weaponobj;
    }
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1070
// Size: 0x74
function function_6149c1c60fce42b3() {
    validcategories = [];
    foreach (categoryref, category in level.weaponcategories) {
        if (category.size > 0 && categoryref != "rand_knife_end") {
            validcategories[validcategories.size] = categoryref;
        }
    }
    return validcategories;
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10ed
// Size: 0x1a1
function function_eee04ff98ccc9115() {
    function_5bda1250fea48e36("havoc_ammo_feeder", &function_66ecf48cd956ac04);
    function_5bda1250fea48e36("havoc_cranked", &function_a0e75971d087c74c);
    function_5bda1250fea48e36("havoc_equip_mayhem", &function_b90124cf1cea34ab);
    function_5bda1250fea48e36("havoc_kill_snap", &function_9c2e0f5f612d29b6);
    function_5bda1250fea48e36("havoc_lucky_killstreak", &function_f28a76fafba3e83c);
    function_5bda1250fea48e36("havoc_semtex_surprise", &function_14816c4a16bf3c7d);
    function_5bda1250fea48e36("havoc_hero_drop", &function_3317cce4d3b5f4d3);
    function_5bda1250fea48e36("havoc_eyes_on", &function_98619bddccd9a695);
    function_5bda1250fea48e36("havoc_headshot_only", &function_75934eae9944efea);
    function_5bda1250fea48e36("havoc_low_gravity", &function_a8d2d573000c15f2);
    function_5bda1250fea48e36("havoc_third_person", &function_3d1b533130fa8e4a);
    function_5bda1250fea48e36("havoc_gun_cycle", &function_530be69f39d0f7d2);
    function_5bda1250fea48e36("havoc_flame_on", &function_6dc42c579ee9815c);
    function_5bda1250fea48e36("havoc_system_reroll", &function_8cdab0c0cf731e79);
    foreach (modcategoryindex, modcategory in level.havoc_mods) {
        foreach (var_87e48f43a5b5f24c, modstruct in modcategory) {
            if (isdefined(modstruct.func)) {
                continue;
            }
            level.havoc_mods[modcategoryindex][var_87e48f43a5b5f24c] = undefined;
        }
    }
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1296
// Size: 0x85
function function_5bda1250fea48e36(ref, triggerfunc) {
    if (function_2d4dcf9441a36ea0(ref)) {
        return;
    }
    category = function_84ca23f2ef144201(ref);
    if (!isdefined(category)) {
        /#
            iprintln("<dev string:x57>" + ref + "<dev string:x6e>");
        #/
        function_d7d6624794ccbded(level.havoc_mods[category][ref].size, "player", ref, 0, "none");
    }
    level.havoc_mods[category][ref].func = triggerfunc;
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1323
// Size: 0x9c
function function_2d4dcf9441a36ea0(modref) {
    var_71afebac8fb1e1c2 = getdvar(@"hash_d3324e2adafbcfa9", "");
    if (var_71afebac8fb1e1c2 != "") {
        modtokens = strtok(var_71afebac8fb1e1c2, ",");
        foreach (mod in modtokens) {
            if (issubstr(modref, mod)) {
                return true;
            }
        }
    }
    return false;
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x13c8
// Size: 0x82
function function_bff609c8046eda89(category, ref, modinfo) {
    if (!(isdefined(category) && isdefined(ref))) {
        /#
            iprintln("<dev string:x90>");
        #/
        return;
    }
    function_813e589c3a58684c(modinfo);
    if (category == "weapon" || category == "end") {
        level.havoc_mods[category] = [];
        return;
    }
    level.havoc_mods[category] = array_remove_index(level.havoc_mods[category], ref, 1);
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1452
// Size: 0x31
function function_33de3bb74c6f9f68(modinfo) {
    if (!istrue(modinfo.restoreonspawn)) {
        return;
    }
    level.var_3e4609e79ec16d7a[level.var_3e4609e79ec16d7a.size] = modinfo;
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x148b
// Size: 0x4f
function function_813e589c3a58684c(modinfo) {
    if (level.var_31504a1b9e6cbdef > 0) {
        setomnvar("ui_havoc_mod_status_" + level.var_31504a1b9e6cbdef, modinfo.id);
    }
    level.var_5c710278dd543e5c[level.var_5c710278dd543e5c.size] = modinfo;
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14e2
// Size: 0xf1
function function_4a3f65052dc511b2() {
    level endon("game_ended");
    scripts\mp\flags::gameflagwait("prematch_done");
    wait 5;
    function_8b460428cb7e01ac(0, 0, 1);
    previoushighscore = 0;
    scorecounter = 0;
    while (true) {
        var_57acfdc40b2fba7 = scripts\mp\gamescore::gethighestscore();
        highestscore = var_57acfdc40b2fba7[1];
        highestteam = var_57acfdc40b2fba7[0];
        if (highestscore > previoushighscore) {
            scorediff = highestscore - previoushighscore;
            scorecounter += scorediff;
            previoushighscore = highestscore;
        }
        thresholdprogress = scorecounter / function_9d7788358c73db40();
        setomnvar("ui_havoc_threshold_progress", thresholdprogress);
        thresholdlimit = function_9d7788358c73db40();
        if (scorecounter >= thresholdlimit) {
            scorediff = scorecounter - thresholdlimit;
            scorecounter = scorediff;
            function_8b460428cb7e01ac(0, 1, 0);
            if (function_3d4f5744f1d73929() >= function_1cc9618aae9bbc8()) {
                break;
            }
        }
        waitframe();
    }
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15db
// Size: 0xb
function function_1cc9618aae9bbc8() {
    return level.var_dc4da78db330c5b5;
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15ef
// Size: 0xb
function function_9d7788358c73db40() {
    return level.var_e757fcf09fbb5ec0;
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1603
// Size: 0x15
function function_75c691ae431d4dd1() {
    return level.var_dd052853f1cd3164[level.var_31504a1b9e6cbdef];
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1621
// Size: 0xb
function function_1e7d37861aaa2bb8() {
    return level.var_cfb17092bbc28b8b;
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1635
// Size: 0xb
function function_3d4f5744f1d73929() {
    return level.var_31504a1b9e6cbdef;
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1649
// Size: 0x38
function function_b39b72eb28eae363(settodefault) {
    level.var_31504a1b9e6cbdef++;
    if (istrue(settodefault)) {
        level.var_31504a1b9e6cbdef = 0;
    }
    setomnvar("ui_havoc_score_threshold", level.var_31504a1b9e6cbdef);
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1689
// Size: 0x2c
function function_e7425d53cbe0c754(curscore) {
    nextscorethreshold = level.var_dd052853f1cd3164[level.var_31504a1b9e6cbdef];
    return curscore >= nextscorethreshold;
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x16be
// Size: 0x2c
function function_8b460428cb7e01ac(var_befa49910d2a94d6, var_58b112a46ed059ba, var_a45aedb0cb5a5ff6) {
    function_b39b72eb28eae363();
    function_dbd7cdab4ce361a3(var_befa49910d2a94d6, var_58b112a46ed059ba, var_a45aedb0cb5a5ff6);
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x16f2
// Size: 0x91
function function_dbd7cdab4ce361a3(var_befa49910d2a94d6, var_58b112a46ed059ba, var_a45aedb0cb5a5ff6) {
    modcategory = function_18ffa8c868bf9576();
    if (isdefined(modcategory)) {
        modlist = level.havoc_mods[modcategory];
        modref = undefined;
        if (isdefined(modlist)) {
            modref = function_3c00acca6c837a62(modcategory);
        } else {
            /#
                iprintln("<dev string:xad>");
            #/
        }
        level thread function_a0f58f6a04807697(modcategory, modref, var_befa49910d2a94d6, var_58b112a46ed059ba, var_a45aedb0cb5a5ff6);
        return;
    }
    /#
        iprintln("<dev string:xd3>");
    #/
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x178b
// Size: 0x2eb
function function_a0f58f6a04807697(modcategory, modref, var_befa49910d2a94d6, var_58b112a46ed059ba, var_a45aedb0cb5a5ff6) {
    level endon("game_ended");
    if (!(isdefined(modcategory) && isdefined(modref))) {
        /#
            iprintln("<dev string:xfd>");
        #/
        return;
    }
    var_89209396f51e191a = function_8318b76d2eedf2f(modcategory, modref);
    if (isdefined(var_89209396f51e191a)) {
        modid = function_47630ccd4c2f3fc6(modref);
        function_bff609c8046eda89(modcategory, modref, var_89209396f51e191a);
        function_33de3bb74c6f9f68(var_89209396f51e191a);
        /#
            iprintln("<dev string:x11b>" + modcategory + "<dev string:x142>" + modref);
        #/
        var_e3f97d38936f8e5b = spawn("script_origin", (0, 0, 0));
        var_e3f97d38936f8e5b hide();
        if (!istrue(var_befa49910d2a94d6)) {
            timer = 3;
            if (istrue(var_58b112a46ed059ba)) {
                function_59a66532ce69ba0("mod_incoming");
            }
            setomnvar("ui_havoc_countdown_time", gettime() + timer * 1000);
            var_ffb74c1047266e6f = 0;
            var_a8df161f525c4cce = 0;
            var_e3f97d38936f8e5b playsound("ui_mp_havoc_timer");
            while (var_a8df161f525c4cce < timer) {
                var_ffb74c1047266e6f += level.framedurationseconds;
                var_a8df161f525c4cce += level.framedurationseconds;
                progress = clamp(1 - var_a8df161f525c4cce / timer, 0, 1);
                setomnvar("ui_havoc_countdown_progress", progress);
                if (var_ffb74c1047266e6f >= 1) {
                    var_ffb74c1047266e6f = 0;
                    var_e3f97d38936f8e5b playsound("ui_mp_havoc_timer");
                }
                waitframe();
            }
        }
        if (isdefined(var_e3f97d38936f8e5b)) {
            var_e3f97d38936f8e5b delete();
        }
        setomnvar("ui_havoc_show_mod", modid);
        scripts\mp\hud_util::showsplashtoall(modref);
        if (istrue(var_a45aedb0cb5a5ff6)) {
            function_59a66532ce69ba0("mod_activated");
        }
        switch (modcategory) {
        case #"hash_611825599f1b56f9": 
            function_edcebba57ef459b7(var_89209396f51e191a.func);
            break;
        case #"hash_27124c6c97ccffa1": 
            if (modref == "havoc_gun_cycle") {
                function_edcebba57ef459b7(var_89209396f51e191a.func);
                break;
            }
        case #"hash_87d1443ef2805760":
        case #"hash_e0788d0d9af05c73":
        case #"hash_ed49946bfff8e78a": 
            level [[ var_89209396f51e191a.func ]]();
            break;
        }
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            player setclientomnvar("ui_match_start_countdown", 0);
        }
        return;
    }
    /#
        iprintln("<dev string:x14a>" + modcategory + "<dev string:x180>" + modref + "<dev string:x18b>");
    #/
}

/#

    // Namespace havoc / namespace_422968e5a7e1852f
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a7e
    // Size: 0x52
    function function_63703b676d8d7c5d() {
        level endon("<dev string:x1c2>");
        while (true) {
            var_436f42d33754867d = getdvarint(@"hash_97c9e7f247669d0a", 0);
            if (istrue(var_436f42d33754867d)) {
                attacker = level waittill("<dev string:x1cd>");
                function_dbd7cdab4ce361a3(0, 1, 0);
            }
            waitframe();
        }
    }

    // Namespace havoc / namespace_422968e5a7e1852f
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1ad8
    // Size: 0x7f
    function function_5beede1cf589d53e(modref) {
        level endon("<dev string:x1c2>");
        while (true) {
            var_fd9c246f73d9c2de = getdvar(@"hash_20d78d09742ab023", "<dev string:x1c>");
            if (var_fd9c246f73d9c2de != "<dev string:x1c>") {
                modref = var_fd9c246f73d9c2de;
                modcategory = function_84ca23f2ef144201(modref);
                level thread function_a0f58f6a04807697(modcategory, modref, 1, 0, 1);
                setdevdvar(@"hash_20d78d09742ab023", "<dev string:x1c>");
            }
            waitframe();
        }
    }

#/

// Namespace havoc / namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b5f
// Size: 0x21
function function_edcebba57ef459b7(callbackfunc) {
    level.var_46e88d936db0725c[level.var_46e88d936db0725c.size] = callbackfunc;
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1b88
// Size: 0xf5
function function_66ecf48cd956ac04(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    if (!isdefined(attacker) || !isplayer(attacker)) {
        return;
    }
    if (istrue(iskillstreakweapon)) {
        return;
    }
    if (!scripts\mp\utility\weapon::isprimaryweapon(objweapon)) {
        return;
    }
    var_d0bae9fa43b9e424 = attacker getweaponammoclip(objweapon);
    var_2b9acc695ed83f64 = attacker getweaponammostock(objweapon);
    var_e21a1fe75ea20307 = weaponclipsize(objweapon);
    var_9fdb767d664b093 = int(var_e21a1fe75ea20307 - var_d0bae9fa43b9e424);
    var_482a583cfa393392 = int(min(var_2b9acc695ed83f64, var_9fdb767d664b093));
    if (var_482a583cfa393392 > 0) {
        attacker setweaponammoclip(objweapon, var_e21a1fe75ea20307);
        attacker setweaponammostock(objweapon, var_2b9acc695ed83f64 - var_482a583cfa393392);
        attacker namespace_e072c8407b2a861c::hudicontype("ammofeeder");
        attacker playlocalsound("iw9_support_box_use");
    }
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1c85
// Size: 0x39
function function_bcfdc9507307ce2d(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    if (!isdefined(victim)) {
        return;
    }
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1cc6
// Size: 0x33
function function_68e97386dad8427d(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1d01
// Size: 0x85
function function_a0e75971d087c74c(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    if (!isdefined(attacker) || !isplayer(attacker)) {
        return;
    }
    if (isdefined(attacker.cranked) && attacker.cranked) {
        attacker scripts\mp\cranked::setcrankedplayerbombtimer("kill");
    } else {
        attacker scripts\mp\cranked::oncranked(undefined, attacker);
    }
    attacker thread function_3456261d6a6256a6();
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d8e
// Size: 0x37
function function_3456261d6a6256a6() {
    self endon("disconnect");
    self notify("havoc_cranked_remove");
    self endon("havoc_cranked_remove");
    level endon("game_ended");
    waittill_any_2("death", "last_stand_start");
    scripts\mp\cranked::cleanupcrankedplayertimer();
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1dcd
// Size: 0x88
function function_b90124cf1cea34ab(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    if (!isdefined(attacker)) {
        return;
    }
    primaryequip = attacker namespace_4fb9dddfb8c1a67a::getcurrentequipment("primary");
    secondaryequip = attacker namespace_4fb9dddfb8c1a67a::getcurrentequipment("secondary");
    attacker scripts\mp\equipment::giveequipment(primaryequip, "primary");
    attacker scripts\mp\equipment::giveequipment(secondaryequip, "secondary");
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1e5d
// Size: 0x54
function function_9c2e0f5f612d29b6(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    if (!isdefined(victim) || !isdefined(attacker)) {
        return;
    }
    attacker thread scripts\mp\equipment\snapshot_grenade::snapshot_grenade_watch_flight(victim.origin);
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1eb9
// Size: 0xda
function function_f28a76fafba3e83c(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    if (!isdefined(attacker)) {
        return;
    }
    if (!isdefined(attacker.var_c115c6e4d9eee7ca)) {
        attacker.var_c115c6e4d9eee7ca = 1;
    } else {
        attacker.var_c115c6e4d9eee7ca++;
    }
    if (attacker.var_c115c6e4d9eee7ca < 3) {
        return;
    }
    if (isdefined(attacker.var_1275922708964790)) {
        attacker scripts\mp\killstreaks\killstreaks::removekillstreak(0);
    }
    var_edc5f3cca53740b3 = scripts\cp_mp\killstreaks\airdrop::getrandomkillstreak();
    attacker scripts\mp\killstreaks\killstreaks::awardkillstreak(var_edc5f3cca53740b3, "other");
    attacker scripts\mp\hud_message::showkillstreaksplash(var_edc5f3cca53740b3, 4);
    attacker.var_c115c6e4d9eee7ca = undefined;
    attacker.var_1275922708964790 = var_edc5f3cca53740b3;
    attacker thread function_81d2aa21bd0d79e1();
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f9b
// Size: 0x31
function function_81d2aa21bd0d79e1() {
    self endon("disconnect");
    level endon("game_ended");
    self notify("lucky_killstreak_watch");
    self endon("lucky_killstreak_watch");
    self waittill("streak_activated");
    self.var_1275922708964790 = undefined;
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1fd4
// Size: 0x4a
function function_14816c4a16bf3c7d(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    if (!isdefined(victim) && !isdefined(attacker)) {
        return;
    }
    victim thread function_494c5c17d43e7e5b(attacker);
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2026
// Size: 0xfa
function function_494c5c17d43e7e5b(attacker) {
    self endon("disconnected");
    level endon("game_ended");
    for (i = 0; i < 3; i++) {
        grenadeorigin = self gettagorigin("j_mainroot");
        randdist = randomint(300);
        randangle = randomint(360);
        x = grenadeorigin[0] + randdist * cos(randangle);
        y = grenadeorigin[1] + randdist * sin(randangle);
        z = grenadeorigin[2];
        grenadegoal = (x, y, z);
        launchvelocity = grenadegoal - grenadeorigin;
        attacker function_f3bb4f4911a1beb2("weapons", "_launchGrenade", "semtex_mp", grenadeorigin, launchvelocity, randomfloatrange(2, 2.25));
        wait 0.05;
    }
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x2128
// Size: 0x9b
function function_530be69f39d0f7d2(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    if (!scripts\cp_mp\utility\weapon_utility::isbulletweapon(objweapon) && !scripts\cp_mp\utility\weapon_utility::islauncherweapon(objweapon)) {
        return;
    }
    var_b8215055a946eebb = attacker function_26fec210a06242ee();
    attacker _giveweapon(var_b8215055a946eebb, undefined, undefined, 1);
    var_62377657b0592c22 = attacker getcurrentweapon();
    if (!isnullweapon(var_62377657b0592c22)) {
        attacker _takeweapon(var_62377657b0592c22);
    }
    attacker thread domonitoredweaponswitch(var_b8215055a946eebb);
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21cb
// Size: 0x8f
function function_26fec210a06242ee() {
    validweapons = [];
    foreach (weapon in level.var_3de0640c640e8ee0) {
        if (weapon.basename == "none") {
            continue;
        }
        if (self getcurrentweapon() == weapon) {
            continue;
        }
        validweapons[validweapons.size] = weapon;
    }
    return validweapons[randomint(validweapons.size)];
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2263
// Size: 0x84
function function_6dc42c579ee9815c(playeroverride) {
    if (isdefined(playeroverride)) {
        playeroverride function_2b7a7ddd1506153c();
        return;
    }
    foreach (player in level.players) {
        if (!isdefined(player) || !isreallyalive(player)) {
            continue;
        }
        player function_2b7a7ddd1506153c();
    }
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22ef
// Size: 0x79
function function_2b7a7ddd1506153c() {
    currentweapons = self getweaponslistprimaries();
    foreach (weapon in currentweapons) {
        if (isdefined(weapon)) {
            scripts\cp_mp\utility\inventory_utility::_takeweapon(weapon);
        }
    }
    scripts\mp\utility\perk::giveperk("specialty_fastreload");
    thread function_f97e80320a07c84c();
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2370
// Size: 0x43
function function_f97e80320a07c84c(weaponobj) {
    self endon("death_or_disconnect");
    weaponobj = namespace_e0ee43ef2dddadaa::buildweapon("iw9_dm_crossbow", ["ammo_bolt_mol"]);
    _giveweapon(weaponobj);
    thread function_6753e15b1aa1fd7a(weaponobj);
    thread function_bed1816b8632a262(weaponobj);
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23bb
// Size: 0x57
function function_6753e15b1aa1fd7a(crossbowweapon) {
    self endon("death_or_disconnect");
    stockammo = self getweaponammostock(crossbowweapon);
    while (true) {
        objweapon = self waittill("weapon_fired");
        if (isdefined(objweapon) && objweapon != crossbowweapon) {
            continue;
        }
        self setweaponammostock(crossbowweapon, stockammo);
    }
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x241a
// Size: 0x75
function function_a08d6c53a446d62(playeroverride) {
    if (isdefined(playeroverride)) {
        return;
    }
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        player scripts\mp\utility\perk::giveperk("specialty_commando");
    }
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2497
// Size: 0xc8
function function_d7c7ab3572deb50a(playeroverride) {
    if (isdefined(playeroverride)) {
        playeroverride function_666f6c8f489ca946();
        return;
    }
    level.blastshieldclamp = getfloatproperty(@"hash_171bcebcaa849d95", 0.8) * 30;
    level.maxallowedteamkills = -1;
    function_722a88b02b9c6a83("team", "fftype", 1);
    function_722a88b02b9c6a83("team", "teamkillspawndelay", 0);
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        player function_666f6c8f489ca946();
    }
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2567
// Size: 0x45
function function_666f6c8f489ca946() {
    if (isreallyalive(self)) {
        currenthealth = self.health;
        if (self.health > 30) {
            self.health = 30;
        }
        self.maxhealth = 30;
    }
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x25b4
// Size: 0xa0
function function_3317cce4d3b5f4d3(playeroverride) {
    if (isdefined(playeroverride)) {
        playeroverride thread function_997eaa1fabfc52cd();
        return;
    }
    function_722a88b02b9c6a83("game", "minfalldamageheight", 50);
    function_722a88b02b9c6a83("game", "herodrop", 1);
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        player thread function_997eaa1fabfc52cd();
    }
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x265c
// Size: 0x4a
function function_997eaa1fabfc52cd() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (true) {
        self waittill("perform_hero_drop");
        self radiusdamage(self.origin, 256, 100, 100, self, "MOD_CRUSH", "high_jump_mp");
        thread function_798ebfff41139ca1();
    }
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26ae
// Size: 0x42
function function_798ebfff41139ca1() {
    self endon("disconnect");
    level endon("game_ended");
    self setscriptablepartstate("heroDiveVfx", "impact", 0);
    waittill_any_timeout_1(1, "death");
    self setscriptablepartstate("heroDiveVfx", "off", 0);
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26f8
// Size: 0x2
function function_a1274da8ba78ff0f() {
    
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2702
// Size: 0x4c
function function_98619bddccd9a695() {
    scripts\cp_mp\killstreaks\uav::function_484d86ce003c2526("allies", level.uavdirectionalid);
    level.activeadvanceduavs["allies"]++;
    scripts\cp_mp\killstreaks\uav::function_484d86ce003c2526("axis", level.uavdirectionalid);
    level.activeadvanceduavs["axis"]++;
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2756
// Size: 0x15
function function_75934eae9944efea() {
    function_722a88b02b9c6a83("game", "one_tap_headshot", 1);
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2773
// Size: 0x29
function function_a8d2d573000c15f2() {
    function_722a88b02b9c6a83("game", "lowgravity", 1);
    function_722a88b02b9c6a83("game", "lowgravitystrength", 300);
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27a4
// Size: 0x2
function function_8821a9b9a89a609d() {
    
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x27ae
// Size: 0x82
function function_3d1b533130fa8e4a(playeroverride) {
    if (isdefined(playeroverride)) {
        playeroverride scripts\mp\utility\perk::giveperk("specialty_third_person");
        return;
    }
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        player scripts\mp\utility\perk::giveperk("specialty_third_person");
    }
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2838
// Size: 0x14
function function_8cdab0c0cf731e79() {
    function_3660568f097fa7e(1);
    level thread function_855274d0effbf75f();
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2854
// Size: 0x30
function function_855274d0effbf75f() {
    level endon("game_ended");
    for (i = 0; i < 5; i++) {
        wait 4;
        function_8b460428cb7e01ac(1, 0, 0);
    }
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x288c
// Size: 0xda
function function_d7d6624794ccbded(modindex, modcategory, modref, modrestore, var_6f6fd32d3dd289e0, var_3804a6d6dbf6fddb) {
    newmod = spawnstruct();
    newmod.id = int(modindex);
    newmod.category = modcategory;
    newmod.ref = modref;
    newmod.restoreonspawn = ter_op(isstring(modrestore), string_to_bool(modrestore), modrestore);
    newmod.threshold = function_1f1afe7a22fe62f9(modcategory, modref);
    newmod.var_1c85b88373ba6a3e = var_6f6fd32d3dd289e0;
    newmod.var_9b8b3826bd61044f = var_3804a6d6dbf6fddb;
    newmod.skip = 0;
    level.havoc_mods[modcategory][modref] = newmod;
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x296e
// Size: 0x86
function function_1f1afe7a22fe62f9(modcategory, modref) {
    modthreshold = 0;
    if (modref == "havoc_third_person") {
        return 4;
    }
    switch (modcategory) {
    case #"hash_611825599f1b56f9":
    case #"hash_87d1443ef2805760":
    case #"hash_e0788d0d9af05c73": 
        modthreshold = 0;
        break;
    case #"hash_27124c6c97ccffa1": 
        modthreshold = 4;
        break;
    case #"hash_ed49946bfff8e78a": 
        modthreshold = 5;
        break;
    }
    return modthreshold;
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x29fd
// Size: 0xde
function function_84ca23f2ef144201(var_35a900e065ea5a7f) {
    var_fabfbd36ae78f479 = undefined;
    modcategories = level.havoc_mods;
    foreach (categoryindex, category in modcategories) {
        modrefs = modcategories[categoryindex];
        foreach (modindex, ref in modrefs) {
            if (var_35a900e065ea5a7f == modindex) {
                var_fabfbd36ae78f479 = categoryindex;
                break;
            }
        }
        if (isdefined(var_fabfbd36ae78f479)) {
            break;
        }
    }
    return var_fabfbd36ae78f479;
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ae4
// Size: 0x48
function function_47630ccd4c2f3fc6(var_35a900e065ea5a7f) {
    modcategory = function_84ca23f2ef144201(var_35a900e065ea5a7f);
    if (!isdefined(modcategory)) {
        /#
            iprintln("<dev string:x1e1>");
        #/
        return;
    }
    return level.havoc_mods[modcategory][var_35a900e065ea5a7f].id;
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2b35
// Size: 0x2d
function function_8318b76d2eedf2f(modcategory, modref) {
    if (!isdefined(modcategory) || !isdefined(modref)) {
        return;
    }
    return level.havoc_mods[modcategory][modref];
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b6b
// Size: 0x9d
function function_18ffa8c868bf9576() {
    modcategories = level.havoc_mods;
    var_ce9f595467d50327 = [];
    foreach (modcategoryindex, category in modcategories) {
        if (category.size > 0) {
            if (function_88d9da83aa05b571(modcategoryindex)) {
                var_ce9f595467d50327[var_ce9f595467d50327.size] = modcategoryindex;
            }
        }
    }
    randomcategory = undefined;
    if (var_ce9f595467d50327.size > 0) {
        randomcategory = var_ce9f595467d50327[randomint(var_ce9f595467d50327.size)];
    }
    return randomcategory;
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c11
// Size: 0xc8
function function_88d9da83aa05b571(modcategory) {
    modlist = level.havoc_mods[modcategory];
    var_a6f1763860ac8ee8 = [];
    foreach (var_87e48f43a5b5f24c, ref in modlist) {
        moddata = function_8318b76d2eedf2f(modcategory, var_87e48f43a5b5f24c);
        if (function_a5fa76c74c473333(moddata)) {
            var_a6f1763860ac8ee8[var_a6f1763860ac8ee8.size] = moddata;
            if (istrue(moddata.skip)) {
                moddata.skip = 0;
            }
            continue;
        }
        moddata.skip = 1;
    }
    return var_a6f1763860ac8ee8.size > 0;
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ce2
// Size: 0xf9
function function_3c00acca6c837a62(modcategory) {
    modlist = level.havoc_mods[modcategory];
    var_12f119851bca9da5 = [];
    foreach (var_87e48f43a5b5f24c, ref in modlist) {
        moddata = function_8318b76d2eedf2f(modcategory, var_87e48f43a5b5f24c);
        if (!istrue(moddata.skip)) {
            var_12f119851bca9da5[var_12f119851bca9da5.size] = var_87e48f43a5b5f24c;
        }
    }
    randommod = undefined;
    if (var_12f119851bca9da5.size > 0) {
        if (modcategory == "world") {
            if (var_12f119851bca9da5.size > 1 && array_contains(var_12f119851bca9da5, "havoc_third_person")) {
                randommod = function_22091d6a866ea9c5(var_12f119851bca9da5);
            } else {
                randommod = var_12f119851bca9da5[randomint(var_12f119851bca9da5.size)];
            }
        } else {
            randommod = var_12f119851bca9da5[randomint(var_12f119851bca9da5.size)];
        }
    }
    return randommod;
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2de4
// Size: 0x115
function function_22091d6a866ea9c5(var_12f119851bca9da5) {
    minweight = 25;
    maxweight = 100;
    totalweight = 0;
    var_2efb5db5ea1ed5b8 = [];
    foreach (mod in var_12f119851bca9da5) {
        modweight = ter_op(mod == "havoc_third_person", minweight, maxweight);
        totalweight += modweight;
        var_2efb5db5ea1ed5b8[mod] = totalweight;
    }
    randomweight = randomint(totalweight);
    weightedmod = undefined;
    foreach (var_87e48f43a5b5f24c, modweight in var_2efb5db5ea1ed5b8) {
        if (modweight > randomweight) {
            weightedmod = var_87e48f43a5b5f24c;
            break;
        }
    }
    return weightedmod;
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f02
// Size: 0x8b
function function_a5fa76c74c473333(var_89209396f51e191a) {
    var_ca0d813d8fa8bb1d = function_7469c072b8c751fc(var_89209396f51e191a);
    if (!istrue(var_ca0d813d8fa8bb1d)) {
        return 0;
    }
    if (var_89209396f51e191a.var_1c85b88373ba6a3e == "none" && var_89209396f51e191a.var_9b8b3826bd61044f == "none") {
        return 1;
    }
    if (var_89209396f51e191a.var_1c85b88373ba6a3e != "none") {
        var_ca0d813d8fa8bb1d = function_c6a1e26057464b5f(var_89209396f51e191a);
    }
    if (var_89209396f51e191a.var_9b8b3826bd61044f != "none") {
        var_ca0d813d8fa8bb1d = function_8ca343bc8bbb9bc(var_89209396f51e191a);
    }
    return var_ca0d813d8fa8bb1d;
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f96
// Size: 0x20
function function_7469c072b8c751fc(var_653659fc71620bea) {
    return var_653659fc71620bea.threshold <= level.var_31504a1b9e6cbdef;
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2fbf
// Size: 0x85
function function_c6a1e26057464b5f(var_653659fc71620bea) {
    if (level.var_5c710278dd543e5c.size > 0) {
        foreach (activemod in level.var_5c710278dd543e5c) {
            if (var_653659fc71620bea.var_1c85b88373ba6a3e == activemod.ref) {
                return true;
            }
        }
    }
    return false;
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x304d
// Size: 0x85
function function_8ca343bc8bbb9bc(var_653659fc71620bea) {
    if (level.var_5c710278dd543e5c.size > 0) {
        foreach (activemod in level.var_5c710278dd543e5c) {
            if (var_653659fc71620bea.var_9b8b3826bd61044f == activemod.ref) {
                return false;
            }
        }
    }
    return true;
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x30db
// Size: 0x90
function function_722a88b02b9c6a83(category, name, value, setonly) {
    if (!istrue(setonly)) {
        var_77335123603443b3 = spawnstruct();
        var_77335123603443b3.category = category;
        var_77335123603443b3.name = name;
        var_77335123603443b3.resetval = scripts\mp\tweakables::gettweakabledvarvalue(category, name);
        level.var_275f722de69e61a[level.var_275f722de69e61a.size] = var_77335123603443b3;
    }
    scripts\mp\tweakables::settweakabledvar(category, name, value);
    scripts\mp\tweakables::settweakablevalue(category, name, value);
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3173
// Size: 0xd8
function function_6e97354a9ca962db(var_45df8c4441e75fdd) {
    if (level.var_275f722de69e61a.size > 0) {
        foreach (tweakable in level.var_275f722de69e61a) {
            if (istrue(var_45df8c4441e75fdd) && (tweakable.name == "loadoutperksoff" || tweakable.name == "perkpackage" || tweakable.name == "showperksonspawn")) {
                continue;
            }
            function_722a88b02b9c6a83(tweakable.category, tweakable.name, tweakable.resetval, 1);
        }
    }
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3253
// Size: 0xc5
function function_d6cafb83c2fa3bb() {
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (!isreallyalive(player)) {
            continue;
        }
        foreach (perk in level.var_719290ba2ca20fdc) {
            if (player _hasperk(perk)) {
                player removeperk(perk);
            }
        }
    }
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3320
// Size: 0x132
function function_d367d2ad15dc84cf() {
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (!isreallyalive(player)) {
            continue;
        }
        foreach (mod in level.var_5c710278dd543e5c) {
            var_28f2a57c49dc3dc1 = player function_ad12cdc21552b243();
            if (mod.category == "weapon" && istrue(var_28f2a57c49dc3dc1)) {
                player _takeweapon(player getcurrentweapon());
                player _giveweapon(player.primaryweaponobj);
                player _giveweapon(player.secondaryweaponobj);
                player thread domonitoredweaponswitch(player.primaryweaponobj, 1);
                break;
            }
        }
    }
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x345a
// Size: 0x5f
function function_3ed044ffe00f170a() {
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        player scripts\mp\cranked::cleanupcrankedplayertimer();
    }
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34c1
// Size: 0x35
function function_ad12cdc21552b243() {
    var_28f2a57c49dc3dc1 = 0;
    var_c5108b06f2083214 = namespace_e0ee43ef2dddadaa::buildweapon("iw9_dm_crossbow", ["ammo_bolt_mol"]);
    return self hasweapon(var_c5108b06f2083214);
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x34ff
// Size: 0x148
function function_3660568f097fa7e(var_45df8c4441e75fdd) {
    setomnvar("ui_havoc_show_mod", -1);
    setomnvar("ui_havoc_mod_status_1", -1);
    setomnvar("ui_havoc_mod_status_2", -1);
    setomnvar("ui_havoc_mod_status_3", -1);
    setomnvar("ui_havoc_mod_status_4", -1);
    setomnvar("ui_havoc_mod_status_5", -1);
    if (level.var_5c710278dd543e5c.size > 0) {
        foreach (mod in level.var_5c710278dd543e5c) {
            if (mod.ref == "havoc_eyes_on") {
                level.activeadvanceduavs["allies"]--;
                scripts\cp_mp\killstreaks\uav::function_484d86ce003c2526("allies");
                level.activeadvanceduavs["axis"]--;
                scripts\cp_mp\killstreaks\uav::function_484d86ce003c2526("axis");
                break;
            }
        }
    }
    function_b39b72eb28eae363(1);
    function_6e97354a9ca962db(var_45df8c4441e75fdd);
    function_d6cafb83c2fa3bb();
    function_d367d2ad15dc84cf();
    function_3ed044ffe00f170a();
    level.var_46e88d936db0725c = [];
    level.var_3e4609e79ec16d7a = [];
    level.var_5c710278dd543e5c = [];
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x364f
// Size: 0x11
function function_3c5cbe539052ea87() {
    level waittill("game_ended");
    function_3660568f097fa7e();
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3668
// Size: 0x6a
function function_bad07401641fd228() {
    playerowner = undefined;
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        playerowner = player;
        break;
    }
    return playerowner;
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36db
// Size: 0x9
function updategametypedvars() {
    scripts\mp\gametypes\common::updatecommongametypedvars();
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36ec
// Size: 0x1f9
function initspawns() {
    if (getdvarint(@"hash_742caa13b3c2e685")) {
        return;
    }
    level.spawnmins = (0, 0, 0);
    level.spawnmaxs = (0, 0, 0);
    if (function_bff229a11ecd1e34()) {
        scripts\mp\spawnlogic::setactivespawnlogic(#"default");
    } else if (getdvarint(@"hash_a464cb031c16ee87", 0) > 0) {
        scripts\mp\spawnlogic::setactivespawnlogic("Default", "Crit_Default");
    } else if (isdefined(scripts\cp_mp\utility\game_utility::getlocaleid())) {
        scripts\mp\spawnlogic::setactivespawnlogic("BigTDM", "Crit_Frontline");
    } else {
        scripts\mp\spawnlogic::setactivespawnlogic("Default", "Crit_Frontline");
    }
    scripts\mp\spawnlogic::addstartspawnpoints("mp_tdm_spawn_allies_start");
    scripts\mp\spawnlogic::addstartspawnpoints("mp_tdm_spawn_axis_start");
    scripts\mp\spawnlogic::addspawnpoints(game["attackers"], "mp_tdm_spawn_allies_start");
    scripts\mp\spawnlogic::addspawnpoints(game["defenders"], "mp_tdm_spawn_axis_start");
    attackers = scripts\mp\spawnlogic::getspawnpointarray("mp_tdm_spawn_allies_start");
    defenders = scripts\mp\spawnlogic::getspawnpointarray("mp_tdm_spawn_axis_start");
    scripts\mp\spawnlogic::registerspawnset("start_attackers", attackers);
    scripts\mp\spawnlogic::registerspawnset("start_defenders", defenders);
    scripts\mp\spawnlogic::addspawnpoints("allies", "mp_tdm_spawn");
    scripts\mp\spawnlogic::addspawnpoints("axis", "mp_tdm_spawn");
    scripts\mp\spawnlogic::addspawnpoints("allies", "mp_tdm_spawn_secondary", 1, 1);
    scripts\mp\spawnlogic::addspawnpoints("axis", "mp_tdm_spawn_secondary", 1, 1);
    spawns = scripts\mp\spawnlogic::getspawnpointarray("mp_tdm_spawn");
    spawnssecondary = scripts\mp\spawnlogic::getspawnpointarray("mp_tdm_spawn_secondary");
    scripts\mp\spawnlogic::registerspawnset("normal", spawns);
    scripts\mp\spawnlogic::registerspawnset("fallback", spawnssecondary);
    level.mapcenter = scripts\mp\spawnlogic::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

/#

    // Namespace havoc / namespace_422968e5a7e1852f
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x38ed
    // Size: 0x63
    function reinitspawns() {
        scripts\mp\spawnlogic::function_8390bf8c3b74466a("<dev string:x1ff>");
        scripts\mp\spawnlogic::function_8390bf8c3b74466a("<dev string:x206>");
        spawns = scripts\mp\spawnlogic::getspawnpointarray("<dev string:x20f>");
        spawnssecondary = scripts\mp\spawnlogic::getspawnpointarray("<dev string:x21c>");
        scripts\mp\spawnlogic::registerspawnset("<dev string:x1ff>", spawns);
        scripts\mp\spawnlogic::registerspawnset("<dev string:x206>", spawnssecondary);
    }

#/

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3958
// Size: 0xaa
function getspawnpoint() {
    spawnteam = self.pers["team"];
    spawnpoint = undefined;
    if (scripts\mp\spawnlogic::shoulduseteamstartspawn()) {
        if (spawnteam == game["attackers"]) {
            scripts\mp\spawnlogic::activatespawnset("start_attackers", 1);
            spawnpoint = scripts\mp\spawnlogic::getspawnpoint(self, spawnteam, undefined, "start_attackers");
        } else {
            scripts\mp\spawnlogic::activatespawnset("start_defenders", 1);
            spawnpoint = scripts\mp\spawnlogic::getspawnpoint(self, spawnteam, undefined, "start_defenders");
        }
    } else {
        scripts\mp\spawnlogic::activatespawnset("normal", 1);
        spawnpoint = scripts\mp\spawnlogic::getspawnpoint(self, spawnteam, undefined, "fallback");
        /#
            spawncompare(spawnpoint, spawnteam);
        #/
    }
    return spawnpoint;
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a0b
// Size: 0x27
function onspawnplayer(revivespawn) {
    scripts\mp\hud_message::function_f004ef4606b9efdc("kill");
    thread function_4d6a6309eda44c4e();
    thread function_31ca71112f5442e0();
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a3a
// Size: 0x5c
function function_4d6a6309eda44c4e() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (true) {
        self waittill("equipKillstreaksFinished");
        if (isplayer(self) && !isbot(self)) {
            scripts\mp\killstreaks\killstreaks::clearkillstreaks();
            if (isdefined(self.var_1275922708964790)) {
                scripts\mp\killstreaks\killstreaks::awardkillstreak(self.var_1275922708964790, "other");
            }
        }
    }
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a9e
// Size: 0xf8
function function_31ca71112f5442e0() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (true) {
        self waittill("giveLoadout");
        scripts\mp\class::loadout_clearperks(1);
        defaultperks = scripts\mp\class::function_87c3b562f2b366ee(self);
        foreach (perk in defaultperks) {
            scripts\mp\class::loadout_giveperk(perk);
        }
        foreach (modstruct in level.var_3e4609e79ec16d7a) {
            if (!isdefined(modstruct.func)) {
                continue;
            }
            level [[ modstruct.func ]](self);
        }
    }
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b9e
// Size: 0x45
function function_bed1816b8632a262(weaponobj) {
    self endon("death_or_disconnect");
    while (true) {
        currentweapon = self getcurrentweapon();
        if (currentweapon != weaponobj) {
            _switchtoweaponimmediate(weaponobj);
        } else {
            break;
        }
        wait 0.1;
    }
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3beb
// Size: 0x68
function function_59a66532ce69ba0(voref) {
    dialogstruct = function_6b71256e2c7b2060(game["dialog"][voref], "allies");
    scripts\cp_mp\utility\dialog_utility::function_3b08be23bf113fcf(voref, "allies", "killstreak_earned", undefined, dialogstruct);
    dialogstruct = function_6b71256e2c7b2060(game["dialog"][voref], "axis");
    scripts\cp_mp\utility\dialog_utility::function_3b08be23bf113fcf(voref, "axis", "killstreak_earned", undefined, dialogstruct);
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3c5b
// Size: 0x9e
function function_6b71256e2c7b2060(event, team) {
    dialoginfo = spawnstruct();
    dialoginfo.mode = "mp";
    dialoginfo.map = "havc";
    dialoginfo.scene = "mode";
    dialoginfo.character = tolower(scripts\cp_mp\utility\dialog_utility::function_592c1f6b3e44ac25(team));
    if (event == "havoc_mod_incoming") {
        dialoginfo.event = "havi";
    } else {
        dialoginfo.event = "hava";
    }
    return dialoginfo;
}

/#

    // Namespace havoc / namespace_422968e5a7e1852f
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x3d02
    // Size: 0x17b
    function spawncompare(spawnpoint, spawnteam) {
        if (getdvarint(@"hash_b5ceec3e3cb419be") != 0) {
            spawnpoints = scripts\mp\spawnlogic::getteamspawnpoints(spawnteam);
            fallbackspawnpoints = [];
            scriptspawnpoint = scripts\mp\spawnscoring::getspawnpoint_legacy(spawnpoints, fallbackspawnpoints);
            if (!isdefined(level.var_3d292942d52b104a)) {
                level.var_3d292942d52b104a = 0;
                level.var_2dc7108159dc1da3 = 0;
                level.var_a065445ba781ddf6 = 0;
            }
            level.var_3d292942d52b104a++;
            println("<dev string:x233>" + scriptspawnpoint.index + "<dev string:x24b>" + scriptspawnpoint.totalscore);
            if (scriptspawnpoint.index == spawnpoint.index) {
                level.var_2dc7108159dc1da3++;
                iprintlnbold("<dev string:x25e>" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "<dev string:x27a>" + "<dev string:x285>" + level.var_2dc7108159dc1da3 + "<dev string:x287>" + level.var_3d292942d52b104a);
            } else {
                level.var_a065445ba781ddf6++;
                iprintlnbold("<dev string:x289>" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "<dev string:x27a>" + "<dev string:x285>" + level.var_2dc7108159dc1da3 + "<dev string:x287>" + level.var_3d292942d52b104a);
            }
            return scriptspawnpoint;
        }
    }

#/

// Namespace havoc / namespace_422968e5a7e1852f
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x3e85
// Size: 0xb2
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    level notify("havoc_player_killed", attacker);
    foreach (callbackfunc in level.var_46e88d936db0725c) {
        [[ callbackfunc ]](victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
    }
    victim.var_c115c6e4d9eee7ca = undefined;
    scripts\mp\gametypes\common::oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f3f
// Size: 0x16
function onsuicidedeath(victim) {
    victim.var_c115c6e4d9eee7ca = undefined;
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f5d
// Size: 0x52
function ontimelimit() {
    winner = scripts\mp\gamescore::gethighestscoringteam();
    if (game["status"] == "overtime") {
        winner = "forfeit";
    } else if ("tie") {
        winner = "overtime";
    }
    thread scripts\mp\gamelogic::endgame(winner, game["end_reason"]["time_limit_reached"]);
}

// Namespace havoc / namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3fb7
// Size: 0x4e
function shouldgamelobbyremainintact() {
    axisscore = int(game["teamScores"]["axis"]);
    alliesscore = int(game["teamScores"]["allies"]);
    differential = axisscore - alliesscore;
    return differential < 10;
}

