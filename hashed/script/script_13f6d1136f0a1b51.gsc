// mwiii decomp prototype
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

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x886
// Size: 0x1f0
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    level.var_46e88d936db0725c = [];
    level.var_374e02799ae6ce92 = getdvarint(@"hash_229f46b375f83420", 75);
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    allowed[0] = getgametype();
    namespace_19b4203b51d56488::main(allowed);
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
        setdevdvarifuninitialized(@"hash_20d78d09742ab023", "ui_havoc_threshold_progress");
        setdevdvarifuninitialized(@"hash_d3324e2adafbcfa9", "ui_havoc_threshold_progress");
    #/
    if (matchmakinggame()) {
        level.shouldgamelobbyremainintact = &shouldgamelobbyremainintact;
    }
    /#
        level.var_a1c387e9b8e35312 = &function_a1c387e9b8e35312;
    #/
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa7d
// Size: 0x3c
function function_c153b3be3a868971() {
    game["dialog"]["gametype"] = "iw9_havc_mode_uktl_name";
    game["dialog"]["mod_incoming"] = "havoc_mod_incoming";
    game["dialog"]["mod_activated"] = "havoc_mod_activated";
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xac0
// Size: 0xa
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xad1
// Size: 0x175
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
        setobjectivetext(entry, "OBJECTIVES/HAVOC");
        if (level.splitscreen) {
            setobjectivescoretext(entry, "OBJECTIVES/HAVOC");
        } else {
            setobjectivescoretext(entry, "OBJECTIVES/HAVOC_SCORE");
        }
        setobjectivehinttext(entry, "OBJECTIVES/HAVOC_HINT");
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

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc4d
// Size: 0xd2
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

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd26
// Size: 0x24b
function function_8c14093fb58b4e65() {
    level.var_2f3a1a97f388712 = [];
    level.var_3e4609e79ec16d7a = [];
    level.var_5c710278dd543e5c = [];
    level.var_31504a1b9e6cbdef = 0;
    level.var_dd052853f1cd3164 = [];
    level.var_dc4da78db330c5b5 = getdvarint(@"hash_2f01a491b1940657", 5);
    level.var_cfb17092bbc28b8b = int(level.var_374e02799ae6ce92 - level.var_374e02799ae6ce92 / level.var_dc4da78db330c5b5);
    level.var_e757fcf09fbb5ec0 = getdvarint(@"hash_c8f0ab916692bfbb", int(level.var_cfb17092bbc28b8b / level.var_dc4da78db330c5b5));
    var_ba0bc366802f8c30 = level.var_e757fcf09fbb5ec0;
    for (i = 0; i < function_1cc9618aae9bbc8(); i++) {
        level.var_dd052853f1cd3164[level.var_dd052853f1cd3164.size] = var_ba0bc366802f8c30;
        var_ba0bc366802f8c30 = var_ba0bc366802f8c30 + level.var_e757fcf09fbb5ec0;
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
        var_ded220fe49414105 = tablelookupbyrow("mp/havoc_mods.csv", index, 0);
        if (var_ded220fe49414105 == "") {
            continue;
        }
        var_d9befb3c1c446153 = tablelookupbyrow("mp/havoc_mods.csv", index, 1);
        var_24574657df24da70 = tablelookupbyrow("mp/havoc_mods.csv", index, 2);
        var_86c1a6bc32729067 = tablelookupbyrow("mp/havoc_mods.csv", index, 5);
        var_6f6fd32d3dd289e0 = tablelookupbyrow("mp/havoc_mods.csv", index, 6);
        var_3804a6d6dbf6fddb = tablelookupbyrow("mp/havoc_mods.csv", index, 7);
        function_d7d6624794ccbded(var_ded220fe49414105, var_d9befb3c1c446153, var_24574657df24da70, var_86c1a6bc32729067, var_6f6fd32d3dd289e0, var_3804a6d6dbf6fddb);
    }
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf78
// Size: 0x28
function function_c2a7ea1687dfd306() {
    level.var_719290ba2ca20fdc = [0:"specialty_fastreload", 1:"specialty_third_person", 2:"specialty_commando"];
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfa7
// Size: 0xc2
function function_905b2f805251e716() {
    level.ladderindex = dvarintvalue("ladderIndex", 1, 1, 6);
    namespace_5efc3f84199a836c::function_6b7afefdbeeeec0a();
    level.var_3de0640c640e8ee0 = [];
    for (i = 0; i < 50; i++) {
        var_c69da2d2fff3aac5 = function_6149c1c60fce42b3();
        var_8c7cbd4fa9a20866 = var_c69da2d2fff3aac5[randomint(var_c69da2d2fff3aac5.size)];
        weapondata = namespace_5efc3f84199a836c::function_5f97f15e9ca6cb6(var_8c7cbd4fa9a20866);
        weaponobj = namespace_5efc3f84199a836c::function_96d23570114bc7b6(weapondata);
        if (isnullweapon(weaponobj)) {
            /#
                iprintln("ui_havoc_score_threshold" + var_8c7cbd4fa9a20866);
            #/
        } else {
            level.var_3de0640c640e8ee0[level.var_3de0640c640e8ee0.size] = weaponobj;
        }
    }
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1070
// Size: 0x75
function function_6149c1c60fce42b3() {
    var_ef5f8952fe9be185 = [];
    foreach (var_f8f00bed55a25eba, category in level.weaponcategories) {
        if (category.size > 0 && var_f8f00bed55a25eba != "rand_knife_end") {
            var_ef5f8952fe9be185[var_ef5f8952fe9be185.size] = var_f8f00bed55a25eba;
        }
    }
    return var_ef5f8952fe9be185;
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10ed
// Size: 0x1a2
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
    foreach (var_13751ce30e58b249, var_d9befb3c1c446153 in level.var_2f3a1a97f388712) {
        foreach (var_87e48f43a5b5f24c, var_b39bbb3a0e35c61e in var_d9befb3c1c446153) {
            if (isdefined(var_b39bbb3a0e35c61e.func)) {
                continue;
            }
            level.var_2f3a1a97f388712[var_13751ce30e58b249][var_87e48f43a5b5f24c] = undefined;
        }
    }
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1296
// Size: 0x86
function function_5bda1250fea48e36(ref, triggerfunc) {
    if (function_2d4dcf9441a36ea0(ref)) {
        return;
    }
    category = function_84ca23f2ef144201(ref);
    if (!isdefined(category)) {
        /#
            iprintln("ammo_bolt_mol" + ref + "fallback");
        #/
        function_d7d6624794ccbded(level.var_2f3a1a97f388712[category][ref].size, "player", ref, 0, "none");
    }
    level.var_2f3a1a97f388712[category][ref].func = triggerfunc;
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1323
// Size: 0x9d
function function_2d4dcf9441a36ea0(var_24574657df24da70) {
    var_71afebac8fb1e1c2 = getdvar(@"hash_d3324e2adafbcfa9", "");
    if (var_71afebac8fb1e1c2 != "") {
        var_e04329ac881d885 = strtok(var_71afebac8fb1e1c2, ",");
        foreach (mod in var_e04329ac881d885) {
            if (issubstr(var_24574657df24da70, mod)) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x13c8
// Size: 0x83
function function_bff609c8046eda89(category, ref, var_f1e7600ae8f8a94b) {
    if (!(isdefined(category) && isdefined(ref))) {
        /#
            iprintln("<unknown string>");
        #/
        return;
    }
    function_813e589c3a58684c(var_f1e7600ae8f8a94b);
    if (category == "weapon" || category == "end") {
        level.var_2f3a1a97f388712[category] = [];
    } else {
        level.var_2f3a1a97f388712[category] = array_remove_index(level.var_2f3a1a97f388712[category], ref, 1);
    }
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1452
// Size: 0x32
function function_33de3bb74c6f9f68(var_f1e7600ae8f8a94b) {
    if (!istrue(var_f1e7600ae8f8a94b.var_cb661d99ccda33bf)) {
        return;
    }
    level.var_3e4609e79ec16d7a[level.var_3e4609e79ec16d7a.size] = var_f1e7600ae8f8a94b;
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x148b
// Size: 0x50
function function_813e589c3a58684c(var_f1e7600ae8f8a94b) {
    if (level.var_31504a1b9e6cbdef > 0) {
        setomnvar("ui_havoc_mod_status_" + level.var_31504a1b9e6cbdef, var_f1e7600ae8f8a94b.id);
    }
    level.var_5c710278dd543e5c[level.var_5c710278dd543e5c.size] = var_f1e7600ae8f8a94b;
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14e2
// Size: 0xf2
function function_4a3f65052dc511b2() {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    wait(5);
    function_8b460428cb7e01ac(0, 0, 1);
    var_a25e53a4d71828ea = 0;
    var_19429f26834e5ed7 = 0;
    while (1) {
        var_57acfdc40b2fba7 = namespace_e8a49b70d0769b66::gethighestscore();
        highestscore = var_57acfdc40b2fba7[1];
        var_1ff67ba127220e2 = var_57acfdc40b2fba7[0];
        if (highestscore > var_a25e53a4d71828ea) {
            scorediff = highestscore - var_a25e53a4d71828ea;
            var_19429f26834e5ed7 = var_19429f26834e5ed7 + scorediff;
            var_a25e53a4d71828ea = highestscore;
        }
        var_ef573163de7e46af = var_19429f26834e5ed7 / function_9d7788358c73db40();
        setomnvar("ui_havoc_threshold_progress", var_ef573163de7e46af);
        var_c6f714345d79acf7 = function_9d7788358c73db40();
        if (var_19429f26834e5ed7 >= var_c6f714345d79acf7) {
            scorediff = var_19429f26834e5ed7 - var_c6f714345d79acf7;
            var_19429f26834e5ed7 = scorediff;
            function_8b460428cb7e01ac(0, 1, 0);
            if (function_3d4f5744f1d73929() >= function_1cc9618aae9bbc8()) {
                break;
            }
        }
        waitframe();
    }
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15db
// Size: 0xc
function function_1cc9618aae9bbc8() {
    return level.var_dc4da78db330c5b5;
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15ef
// Size: 0xc
function function_9d7788358c73db40() {
    return level.var_e757fcf09fbb5ec0;
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1603
// Size: 0x16
function function_75c691ae431d4dd1() {
    return level.var_dd052853f1cd3164[level.var_31504a1b9e6cbdef];
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1621
// Size: 0xc
function function_1e7d37861aaa2bb8() {
    return level.var_cfb17092bbc28b8b;
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1635
// Size: 0xc
function function_3d4f5744f1d73929() {
    return level.var_31504a1b9e6cbdef;
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1649
// Size: 0x39
function function_b39b72eb28eae363(var_dda8acd20a27afef) {
    level.var_31504a1b9e6cbdef++;
    if (istrue(var_dda8acd20a27afef)) {
        level.var_31504a1b9e6cbdef = 0;
    }
    setomnvar("ui_havoc_score_threshold", level.var_31504a1b9e6cbdef);
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1689
// Size: 0x2d
function function_e7425d53cbe0c754(var_5b1bc86c3c8c20b9) {
    var_cd4331dd65cbcde1 = level.var_dd052853f1cd3164[level.var_31504a1b9e6cbdef];
    return var_5b1bc86c3c8c20b9 >= var_cd4331dd65cbcde1;
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x16be
// Size: 0x2d
function function_8b460428cb7e01ac(var_befa49910d2a94d6, var_58b112a46ed059ba, var_a45aedb0cb5a5ff6) {
    function_b39b72eb28eae363();
    function_dbd7cdab4ce361a3(var_befa49910d2a94d6, var_58b112a46ed059ba, var_a45aedb0cb5a5ff6);
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x16f2
// Size: 0x92
function function_dbd7cdab4ce361a3(var_befa49910d2a94d6, var_58b112a46ed059ba, var_a45aedb0cb5a5ff6) {
    var_d9befb3c1c446153 = function_18ffa8c868bf9576();
    if (isdefined(var_d9befb3c1c446153)) {
        var_db61a9c69ab388a7 = level.var_2f3a1a97f388712[var_d9befb3c1c446153];
        var_24574657df24da70 = undefined;
        if (isdefined(var_db61a9c69ab388a7)) {
            var_24574657df24da70 = function_3c00acca6c837a62(var_d9befb3c1c446153);
        } else {
            /#
                iprintln("<unknown string>");
            #/
        }
        level thread function_a0f58f6a04807697(var_d9befb3c1c446153, var_24574657df24da70, var_befa49910d2a94d6, var_58b112a46ed059ba, var_a45aedb0cb5a5ff6);
    } else {
        /#
            iprintln("<unknown string>");
        #/
    }
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x178b
// Size: 0x2ec
function function_a0f58f6a04807697(var_d9befb3c1c446153, var_24574657df24da70, var_befa49910d2a94d6, var_58b112a46ed059ba, var_a45aedb0cb5a5ff6) {
    level endon("game_ended");
    if (!(isdefined(var_d9befb3c1c446153) && isdefined(var_24574657df24da70))) {
        /#
            iprintln("<unknown string>");
        #/
        return;
    }
    var_89209396f51e191a = function_8318b76d2eedf2f(var_d9befb3c1c446153, var_24574657df24da70);
    if (isdefined(var_89209396f51e191a)) {
        var_3a927c89eed3a0b2 = function_47630ccd4c2f3fc6(var_24574657df24da70);
        function_bff609c8046eda89(var_d9befb3c1c446153, var_24574657df24da70, var_89209396f51e191a);
        function_33de3bb74c6f9f68(var_89209396f51e191a);
        /#
            iprintln("<unknown string>" + var_d9befb3c1c446153 + "<unknown string>" + var_24574657df24da70);
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
                var_ffb74c1047266e6f = var_ffb74c1047266e6f + level.framedurationseconds;
                var_a8df161f525c4cce = var_a8df161f525c4cce + level.framedurationseconds;
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
        setomnvar("ui_havoc_show_mod", var_3a927c89eed3a0b2);
        namespace_52f6938dd902c7d0::showsplashtoall(var_24574657df24da70);
        if (istrue(var_a45aedb0cb5a5ff6)) {
            function_59a66532ce69ba0("mod_activated");
        }
        switch (var_d9befb3c1c446153) {
        case #"hash_611825599f1b56f9":
            function_edcebba57ef459b7(var_89209396f51e191a.func);
            break;
        case #"hash_27124c6c97ccffa1":
            jumpiffalse(var_24574657df24da70 == "havoc_gun_cycle") LOC_0000022f;
            function_edcebba57ef459b7(var_89209396f51e191a.func);
            break;
        case #"hash_87d1443ef2805760":
        case #"hash_e0788d0d9af05c73":
        case #"hash_ed49946bfff8e78a":
        LOC_0000022f:
            level [[ var_89209396f51e191a.func ]]();
            break;
        }
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            player setclientomnvar("ui_match_start_countdown", 0);
        }
    } else {
        /#
            iprintln("<unknown string>" + var_d9befb3c1c446153 + "<unknown string>" + var_24574657df24da70 + "<unknown string>");
        #/
    }
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a7e
// Size: 0x53
function function_63703b676d8d7c5d() {
    /#
        level endon("<unknown string>");
        while (1) {
            var_436f42d33754867d = getdvarint(@"hash_97c9e7f247669d0a", 0);
            if (istrue(var_436f42d33754867d)) {
                attacker = level waittill("<unknown string>");
                function_dbd7cdab4ce361a3(0, 1, 0);
            }
            waitframe();
        }
    #/
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ad8
// Size: 0x80
function function_5beede1cf589d53e(var_24574657df24da70) {
    /#
        level endon("<unknown string>");
        while (1) {
            var_fd9c246f73d9c2de = getdvar(@"hash_20d78d09742ab023", "ui_havoc_threshold_progress");
            if (var_fd9c246f73d9c2de != "ui_havoc_threshold_progress") {
                var_24574657df24da70 = var_fd9c246f73d9c2de;
                var_d9befb3c1c446153 = function_84ca23f2ef144201(var_24574657df24da70);
                level thread function_a0f58f6a04807697(var_d9befb3c1c446153, var_24574657df24da70, 1, 0, 1);
                setdevdvar(@"hash_20d78d09742ab023", "ui_havoc_threshold_progress");
            }
            waitframe();
        }
    #/
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b5f
// Size: 0x22
function function_edcebba57ef459b7(callbackfunc) {
    level.var_46e88d936db0725c[level.var_46e88d936db0725c.size] = callbackfunc;
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1b88
// Size: 0xf6
function function_66ecf48cd956ac04(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    if (!isdefined(attacker) || !isplayer(attacker)) {
        return;
    }
    if (istrue(iskillstreakweapon)) {
        return;
    }
    if (!namespace_68e641469fde3fa7::isprimaryweapon(objweapon)) {
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

// Namespace havoc/namespace_422968e5a7e1852f
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1c85
// Size: 0x3a
function function_bcfdc9507307ce2d(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    if (!isdefined(victim)) {
        return;
    }
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1cc6
// Size: 0x34
function function_68e97386dad8427d(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1d01
// Size: 0x86
function function_a0e75971d087c74c(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    if (!isdefined(attacker) || !isplayer(attacker)) {
        return;
    }
    if (isdefined(attacker.cranked) && attacker.cranked) {
        attacker namespace_58012cf453ba1014::setcrankedplayerbombtimer("kill");
    } else {
        attacker namespace_58012cf453ba1014::oncranked(undefined, attacker);
    }
    attacker thread function_3456261d6a6256a6();
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d8e
// Size: 0x38
function function_3456261d6a6256a6() {
    self endon("disconnect");
    self notify("havoc_cranked_remove");
    self endon("havoc_cranked_remove");
    level endon("game_ended");
    waittill_any_2("death", "last_stand_start");
    namespace_58012cf453ba1014::cleanupcrankedplayertimer();
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1dcd
// Size: 0x89
function function_b90124cf1cea34ab(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    if (!isdefined(attacker)) {
        return;
    }
    var_f5c0017750f207a3 = attacker namespace_4fb9dddfb8c1a67a::getcurrentequipment("primary");
    var_702915cbe6ad0ce3 = attacker namespace_4fb9dddfb8c1a67a::getcurrentequipment("secondary");
    attacker namespace_1a507865f681850e::giveequipment(var_f5c0017750f207a3, "primary");
    attacker namespace_1a507865f681850e::giveequipment(var_702915cbe6ad0ce3, "secondary");
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1e5d
// Size: 0x55
function function_9c2e0f5f612d29b6(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    if (!isdefined(victim) || !isdefined(attacker)) {
        return;
    }
    attacker thread namespace_ce72036f17f28af2::snapshot_grenade_watch_flight(victim.origin);
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1eb9
// Size: 0xdb
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
        attacker namespace_58a74e7d54b56e8d::removekillstreak(0);
    }
    var_edc5f3cca53740b3 = namespace_6c578d6ef48f10ef::getrandomkillstreak();
    attacker namespace_58a74e7d54b56e8d::awardkillstreak(var_edc5f3cca53740b3, "other");
    attacker namespace_44abc05161e2e2cb::showkillstreaksplash(var_edc5f3cca53740b3, 4);
    attacker.var_c115c6e4d9eee7ca = undefined;
    attacker.var_1275922708964790 = var_edc5f3cca53740b3;
    attacker thread function_81d2aa21bd0d79e1();
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f9b
// Size: 0x32
function function_81d2aa21bd0d79e1() {
    self endon("disconnect");
    level endon("game_ended");
    self notify("lucky_killstreak_watch");
    self endon("lucky_killstreak_watch");
    self waittill("streak_activated");
    self.var_1275922708964790 = undefined;
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1fd4
// Size: 0x4b
function function_14816c4a16bf3c7d(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    if (!isdefined(victim) && !isdefined(attacker)) {
        return;
    }
    victim thread function_494c5c17d43e7e5b(attacker);
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2026
// Size: 0xfb
function function_494c5c17d43e7e5b(attacker) {
    self endon("disconnected");
    level endon("game_ended");
    for (i = 0; i < 3; i++) {
        var_f3e5ec9ecaaf8e1b = self gettagorigin("j_mainroot");
        var_a0a41ba05e16ffe6 = randomint(300);
        randangle = randomint(360);
        x = var_f3e5ec9ecaaf8e1b[0] + var_a0a41ba05e16ffe6 * cos(randangle);
        y = var_f3e5ec9ecaaf8e1b[1] + var_a0a41ba05e16ffe6 * sin(randangle);
        z = var_f3e5ec9ecaaf8e1b[2];
        var_503b97808f1cb382 = (x, y, z);
        launchvelocity = var_503b97808f1cb382 - var_f3e5ec9ecaaf8e1b;
        attacker function_f3bb4f4911a1beb2("weapons", "_launchGrenade", "semtex_mp", var_f3e5ec9ecaaf8e1b, launchvelocity, randomfloatrange(2, 2.25));
        wait(0.05);
    }
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x2128
// Size: 0x9c
function function_530be69f39d0f7d2(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    if (!namespace_d325722f2754c2c4::isbulletweapon(objweapon) && !namespace_d325722f2754c2c4::function_102d677621400199(objweapon)) {
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

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21cb
// Size: 0x90
function function_26fec210a06242ee() {
    var_d89a1a1c041a3afe = [];
    foreach (weapon in level.var_3de0640c640e8ee0) {
        if (weapon.basename == "none") {
            continue;
        }
        if (self getcurrentweapon() == weapon) {
            continue;
        }
        var_d89a1a1c041a3afe[var_d89a1a1c041a3afe.size] = weapon;
    }
    return var_d89a1a1c041a3afe[randomint(var_d89a1a1c041a3afe.size)];
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2263
// Size: 0x85
function function_6dc42c579ee9815c(var_32d402d0cf52b9e4) {
    if (isdefined(var_32d402d0cf52b9e4)) {
        var_32d402d0cf52b9e4 function_2b7a7ddd1506153c();
    } else {
        foreach (player in level.players) {
            if (!isdefined(player) || !isreallyalive(player)) {
                continue;
            }
            player function_2b7a7ddd1506153c();
        }
    }
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22ef
// Size: 0x7a
function function_2b7a7ddd1506153c() {
    var_849c1df4114e0a37 = self getweaponslistprimaries();
    foreach (weapon in var_849c1df4114e0a37) {
        if (isdefined(weapon)) {
            namespace_df5cfdbe6e2d3812::_takeweapon(weapon);
        }
    }
    namespace_82dcd1d5ae30ff7::giveperk("specialty_fastreload");
    thread function_f97e80320a07c84c();
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2370
// Size: 0x44
function function_f97e80320a07c84c(weaponobj) {
    self endon("death_or_disconnect");
    weaponobj = namespace_e0ee43ef2dddadaa::buildweapon("iw9_dm_crossbow", [0:"ammo_bolt_mol"]);
    _giveweapon(weaponobj);
    thread function_6753e15b1aa1fd7a(weaponobj);
    thread function_bed1816b8632a262(weaponobj);
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23bb
// Size: 0x58
function function_6753e15b1aa1fd7a(var_9b990c49cd9cfdb1) {
    self endon("death_or_disconnect");
    stockammo = self getweaponammostock(var_9b990c49cd9cfdb1);
    while (1) {
        objweapon = self waittill("weapon_fired");
        if (isdefined(objweapon) && objweapon != var_9b990c49cd9cfdb1) {
            continue;
        }
        self setweaponammostock(var_9b990c49cd9cfdb1, stockammo);
    }
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x241a
// Size: 0x76
function function_a08d6c53a446d62(var_32d402d0cf52b9e4) {
    if (isdefined(var_32d402d0cf52b9e4)) {
        goto LOC_00000074;
    }
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        player namespace_82dcd1d5ae30ff7::giveperk("specialty_commando");
    }
LOC_00000074:
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2497
// Size: 0xc9
function function_d7c7ab3572deb50a(var_32d402d0cf52b9e4) {
    if (isdefined(var_32d402d0cf52b9e4)) {
        var_32d402d0cf52b9e4 function_666f6c8f489ca946();
    } else {
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
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2567
// Size: 0x46
function function_666f6c8f489ca946() {
    if (isreallyalive(self)) {
        currenthealth = self.health;
        if (self.health > 30) {
            self.health = 30;
        }
        self.maxhealth = 30;
    }
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x25b4
// Size: 0xa1
function function_3317cce4d3b5f4d3(var_32d402d0cf52b9e4) {
    if (isdefined(var_32d402d0cf52b9e4)) {
        var_32d402d0cf52b9e4 thread function_997eaa1fabfc52cd();
    } else {
        function_722a88b02b9c6a83("game", "minfalldamageheight", 50);
        function_722a88b02b9c6a83("game", "herodrop", 1);
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            player thread function_997eaa1fabfc52cd();
        }
    }
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x265c
// Size: 0x4b
function function_997eaa1fabfc52cd() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (1) {
        self waittill("perform_hero_drop");
        self radiusdamage(self.origin, 256, 100, 100, self, "MOD_CRUSH", "high_jump_mp");
        thread function_798ebfff41139ca1();
    }
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26ae
// Size: 0x43
function function_798ebfff41139ca1() {
    self endon("disconnect");
    level endon("game_ended");
    self setscriptablepartstate("heroDiveVfx", "impact", 0);
    waittill_any_timeout_1(1, "death");
    self setscriptablepartstate("heroDiveVfx", "off", 0);
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26f8
// Size: 0x3
function function_a1274da8ba78ff0f() {
    
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2702
// Size: 0x4d
function function_98619bddccd9a695() {
    namespace_f1fe279354a7da2::function_484d86ce003c2526("allies", level.uavdirectionalid);
    level.activeadvanceduavs["allies"]++;
    namespace_f1fe279354a7da2::function_484d86ce003c2526("axis", level.uavdirectionalid);
    level.activeadvanceduavs["axis"]++;
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2756
// Size: 0x16
function function_75934eae9944efea() {
    function_722a88b02b9c6a83("game", "one_tap_headshot", 1);
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2773
// Size: 0x2a
function function_a8d2d573000c15f2() {
    function_722a88b02b9c6a83("game", "lowgravity", 1);
    function_722a88b02b9c6a83("game", "lowgravitystrength", 300);
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27a4
// Size: 0x3
function function_8821a9b9a89a609d() {
    
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x27ae
// Size: 0x83
function function_3d1b533130fa8e4a(var_32d402d0cf52b9e4) {
    if (isdefined(var_32d402d0cf52b9e4)) {
        var_32d402d0cf52b9e4 namespace_82dcd1d5ae30ff7::giveperk("specialty_third_person");
    } else {
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            player namespace_82dcd1d5ae30ff7::giveperk("specialty_third_person");
        }
    }
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2838
// Size: 0x15
function function_8cdab0c0cf731e79() {
    function_3660568f097fa7e(1);
    level thread function_855274d0effbf75f();
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2854
// Size: 0x31
function function_855274d0effbf75f() {
    level endon("game_ended");
    for (i = 0; i < 5; i++) {
        wait(4);
        function_8b460428cb7e01ac(1, 0, 0);
    }
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x288c
// Size: 0xdb
function function_d7d6624794ccbded(var_ded220fe49414105, var_d9befb3c1c446153, var_24574657df24da70, var_86c1a6bc32729067, var_6f6fd32d3dd289e0, var_3804a6d6dbf6fddb) {
    var_96ff4659f479920b = spawnstruct();
    var_96ff4659f479920b.id = int(var_ded220fe49414105);
    var_96ff4659f479920b.category = var_d9befb3c1c446153;
    var_96ff4659f479920b.ref = var_24574657df24da70;
    var_96ff4659f479920b.var_cb661d99ccda33bf = ter_op(isstring(var_86c1a6bc32729067), string_to_bool(var_86c1a6bc32729067), var_86c1a6bc32729067);
    var_96ff4659f479920b.threshold = function_1f1afe7a22fe62f9(var_d9befb3c1c446153, var_24574657df24da70);
    var_96ff4659f479920b.var_1c85b88373ba6a3e = var_6f6fd32d3dd289e0;
    var_96ff4659f479920b.var_9b8b3826bd61044f = var_3804a6d6dbf6fddb;
    var_96ff4659f479920b.skip = 0;
    level.var_2f3a1a97f388712[var_d9befb3c1c446153][var_24574657df24da70] = var_96ff4659f479920b;
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x296e
// Size: 0x87
function function_1f1afe7a22fe62f9(var_d9befb3c1c446153, var_24574657df24da70) {
    var_bf4187d4e43eb09a = 0;
    if (var_24574657df24da70 == "havoc_third_person") {
        return 4;
    }
    switch (var_d9befb3c1c446153) {
    case #"hash_611825599f1b56f9":
    case #"hash_87d1443ef2805760":
    case #"hash_e0788d0d9af05c73":
        var_bf4187d4e43eb09a = 0;
        break;
    case #"hash_27124c6c97ccffa1":
        var_bf4187d4e43eb09a = 4;
        break;
    case #"hash_ed49946bfff8e78a":
        var_bf4187d4e43eb09a = 5;
        break;
    }
    return var_bf4187d4e43eb09a;
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x29fd
// Size: 0xdf
function function_84ca23f2ef144201(var_35a900e065ea5a7f) {
    var_fabfbd36ae78f479 = undefined;
    var_2078f053e1a92113 = level.var_2f3a1a97f388712;
    foreach (categoryindex, category in var_2078f053e1a92113) {
        var_10c9b63fbe0b7499 = var_2078f053e1a92113[categoryindex];
        foreach (var_ded220fe49414105, ref in var_10c9b63fbe0b7499) {
            if (var_35a900e065ea5a7f == var_ded220fe49414105) {
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

// Namespace havoc/namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ae4
// Size: 0x49
function function_47630ccd4c2f3fc6(var_35a900e065ea5a7f) {
    var_d9befb3c1c446153 = function_84ca23f2ef144201(var_35a900e065ea5a7f);
    if (!isdefined(var_d9befb3c1c446153)) {
        /#
            iprintln("<unknown string>");
        #/
        return;
    }
    return level.var_2f3a1a97f388712[var_d9befb3c1c446153][var_35a900e065ea5a7f].id;
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2b35
// Size: 0x2e
function function_8318b76d2eedf2f(var_d9befb3c1c446153, var_24574657df24da70) {
    if (!isdefined(var_d9befb3c1c446153) || !isdefined(var_24574657df24da70)) {
        return;
    }
    return level.var_2f3a1a97f388712[var_d9befb3c1c446153][var_24574657df24da70];
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b6b
// Size: 0x9e
function function_18ffa8c868bf9576() {
    var_2078f053e1a92113 = level.var_2f3a1a97f388712;
    var_ce9f595467d50327 = [];
    foreach (var_13751ce30e58b249, category in var_2078f053e1a92113) {
        if (category.size > 0) {
            if (function_88d9da83aa05b571(var_13751ce30e58b249)) {
                var_ce9f595467d50327[var_ce9f595467d50327.size] = var_13751ce30e58b249;
            }
        }
    }
    var_8c7cbd4fa9a20866 = undefined;
    if (var_ce9f595467d50327.size > 0) {
        var_8c7cbd4fa9a20866 = var_ce9f595467d50327[randomint(var_ce9f595467d50327.size)];
    }
    return var_8c7cbd4fa9a20866;
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c11
// Size: 0xc9
function function_88d9da83aa05b571(var_d9befb3c1c446153) {
    var_db61a9c69ab388a7 = level.var_2f3a1a97f388712[var_d9befb3c1c446153];
    var_a6f1763860ac8ee8 = [];
    foreach (var_87e48f43a5b5f24c, ref in var_db61a9c69ab388a7) {
        var_11ad757f6e375867 = function_8318b76d2eedf2f(var_d9befb3c1c446153, var_87e48f43a5b5f24c);
        if (function_a5fa76c74c473333(var_11ad757f6e375867)) {
            var_a6f1763860ac8ee8[var_a6f1763860ac8ee8.size] = var_11ad757f6e375867;
            if (istrue(var_11ad757f6e375867.skip)) {
                var_11ad757f6e375867.skip = 0;
            }
        } else {
            var_11ad757f6e375867.skip = 1;
        }
    }
    return var_a6f1763860ac8ee8.size > 0;
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ce2
// Size: 0xfa
function function_3c00acca6c837a62(var_d9befb3c1c446153) {
    var_db61a9c69ab388a7 = level.var_2f3a1a97f388712[var_d9befb3c1c446153];
    var_12f119851bca9da5 = [];
    foreach (var_87e48f43a5b5f24c, ref in var_db61a9c69ab388a7) {
        var_11ad757f6e375867 = function_8318b76d2eedf2f(var_d9befb3c1c446153, var_87e48f43a5b5f24c);
        if (!istrue(var_11ad757f6e375867.skip)) {
            var_12f119851bca9da5[var_12f119851bca9da5.size] = var_87e48f43a5b5f24c;
        }
    }
    var_452e5615187761d2 = undefined;
    if (var_12f119851bca9da5.size > 0) {
        if (var_d9befb3c1c446153 == "world") {
            if (var_12f119851bca9da5.size > 1 && array_contains(var_12f119851bca9da5, "havoc_third_person")) {
                var_452e5615187761d2 = function_22091d6a866ea9c5(var_12f119851bca9da5);
            } else {
                var_452e5615187761d2 = var_12f119851bca9da5[randomint(var_12f119851bca9da5.size)];
            }
        } else {
            var_452e5615187761d2 = var_12f119851bca9da5[randomint(var_12f119851bca9da5.size)];
        }
    }
    return var_452e5615187761d2;
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2de4
// Size: 0x116
function function_22091d6a866ea9c5(var_12f119851bca9da5) {
    minweight = 25;
    maxweight = 100;
    totalweight = 0;
    var_2efb5db5ea1ed5b8 = [];
    foreach (mod in var_12f119851bca9da5) {
        var_91faddf8609303b = ter_op(mod == "havoc_third_person", minweight, maxweight);
        totalweight = totalweight + var_91faddf8609303b;
        var_2efb5db5ea1ed5b8[mod] = totalweight;
    }
    var_162b86f62cd92b56 = randomint(totalweight);
    var_1009e8199d46be10 = undefined;
    foreach (var_87e48f43a5b5f24c, var_91faddf8609303b in var_2efb5db5ea1ed5b8) {
        if (var_91faddf8609303b > var_162b86f62cd92b56) {
            var_1009e8199d46be10 = var_87e48f43a5b5f24c;
            break;
        }
    }
    return var_1009e8199d46be10;
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f02
// Size: 0x8c
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

// Namespace havoc/namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f96
// Size: 0x21
function function_7469c072b8c751fc(var_653659fc71620bea) {
    return var_653659fc71620bea.threshold <= level.var_31504a1b9e6cbdef;
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2fbf
// Size: 0x86
function function_c6a1e26057464b5f(var_653659fc71620bea) {
    if (level.var_5c710278dd543e5c.size > 0) {
        foreach (var_61a6016a17726221 in level.var_5c710278dd543e5c) {
            if (var_653659fc71620bea.var_1c85b88373ba6a3e == var_61a6016a17726221.ref) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x304d
// Size: 0x86
function function_8ca343bc8bbb9bc(var_653659fc71620bea) {
    if (level.var_5c710278dd543e5c.size > 0) {
        foreach (var_61a6016a17726221 in level.var_5c710278dd543e5c) {
            if (var_653659fc71620bea.var_9b8b3826bd61044f == var_61a6016a17726221.ref) {
                return 0;
            }
        }
    }
    return 1;
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x30db
// Size: 0x91
function function_722a88b02b9c6a83(category, name, value, var_2dd220c4d334a359) {
    if (!istrue(var_2dd220c4d334a359)) {
        var_77335123603443b3 = spawnstruct();
        var_77335123603443b3.category = category;
        var_77335123603443b3.name = name;
        var_77335123603443b3.var_e25764e59872b2b3 = namespace_775507ba36294dfb::gettweakabledvarvalue(category, name);
        level.var_275f722de69e61a[level.var_275f722de69e61a.size] = var_77335123603443b3;
    }
    namespace_775507ba36294dfb::settweakabledvar(category, name, value);
    namespace_775507ba36294dfb::settweakablevalue(category, name, value);
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3173
// Size: 0xd9
function function_6e97354a9ca962db(var_45df8c4441e75fdd) {
    if (level.var_275f722de69e61a.size > 0) {
        foreach (var_eaef819ef6e642c7 in level.var_275f722de69e61a) {
            if (istrue(var_45df8c4441e75fdd) && (var_eaef819ef6e642c7.name == "loadoutperksoff" || var_eaef819ef6e642c7.name == "perkpackage" || var_eaef819ef6e642c7.name == "showperksonspawn")) {
                continue;
            }
            function_722a88b02b9c6a83(var_eaef819ef6e642c7.category, var_eaef819ef6e642c7.name, var_eaef819ef6e642c7.var_e25764e59872b2b3, 1);
        }
    }
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3253
// Size: 0xc6
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

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3320
// Size: 0x133
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

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x345a
// Size: 0x60
function function_3ed044ffe00f170a() {
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        player namespace_58012cf453ba1014::cleanupcrankedplayertimer();
    }
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34c1
// Size: 0x36
function function_ad12cdc21552b243() {
    var_28f2a57c49dc3dc1 = 0;
    var_c5108b06f2083214 = namespace_e0ee43ef2dddadaa::buildweapon("iw9_dm_crossbow", [0:"ammo_bolt_mol"]);
    return self hasweapon(var_c5108b06f2083214);
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x34ff
// Size: 0x149
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
                namespace_f1fe279354a7da2::function_484d86ce003c2526("allies");
                level.activeadvanceduavs["axis"]--;
                namespace_f1fe279354a7da2::function_484d86ce003c2526("axis");
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

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x364f
// Size: 0x12
function function_3c5cbe539052ea87() {
    level waittill("game_ended");
    function_3660568f097fa7e();
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3668
// Size: 0x6b
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

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36db
// Size: 0xa
function updategametypedvars() {
    namespace_310ba947928891df::updatecommongametypedvars();
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36ec
// Size: 0x1fa
function initspawns() {
    if (getdvarint(@"hash_742caa13b3c2e685")) {
        return;
    }
    level.spawnmins = (0, 0, 0);
    level.spawnmaxs = (0, 0, 0);
    if (function_bff229a11ecd1e34()) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"default");
    } else if (getdvarint(@"hash_a464cb031c16ee87", 0) > 0) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("Default", "Crit_Default");
    } else if (isdefined(namespace_36f464722d326bbe::getlocaleid())) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("BigTDM", "Crit_Frontline");
    } else {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("Default", "Crit_Frontline");
    }
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_tdm_spawn_allies_start");
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_tdm_spawn_axis_start");
    namespace_b2d5aa2baf2b5701::addspawnpoints(game["attackers"], "mp_tdm_spawn_allies_start");
    namespace_b2d5aa2baf2b5701::addspawnpoints(game["defenders"], "mp_tdm_spawn_axis_start");
    attackers = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_allies_start");
    defenders = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_axis_start");
    namespace_b2d5aa2baf2b5701::registerspawnset("start_attackers", attackers);
    namespace_b2d5aa2baf2b5701::registerspawnset("start_defenders", defenders);
    namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_tdm_spawn");
    namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_tdm_spawn");
    namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_tdm_spawn_secondary", 1, 1);
    namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_tdm_spawn_secondary", 1, 1);
    spawns = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn");
    var_3a5288f40c8be099 = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_secondary");
    namespace_b2d5aa2baf2b5701::registerspawnset("normal", spawns);
    namespace_b2d5aa2baf2b5701::registerspawnset("fallback", var_3a5288f40c8be099);
    level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x38ed
// Size: 0x64
function function_a1c387e9b8e35312() {
    /#
        namespace_b2d5aa2baf2b5701::function_8390bf8c3b74466a("<unknown string>");
        namespace_b2d5aa2baf2b5701::function_8390bf8c3b74466a("<unknown string>");
        spawns = namespace_b2d5aa2baf2b5701::getspawnpointarray("<unknown string>");
        var_3a5288f40c8be099 = namespace_b2d5aa2baf2b5701::getspawnpointarray("<unknown string>");
        namespace_b2d5aa2baf2b5701::registerspawnset("<unknown string>", spawns);
        namespace_b2d5aa2baf2b5701::registerspawnset("<unknown string>", var_3a5288f40c8be099);
    #/
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3958
// Size: 0xab
function getspawnpoint() {
    spawnteam = self.pers["team"];
    spawnpoint = undefined;
    if (namespace_b2d5aa2baf2b5701::shoulduseteamstartspawn()) {
        if (spawnteam == game["attackers"]) {
            namespace_b2d5aa2baf2b5701::activatespawnset("start_attackers", 1);
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_attackers");
        } else {
            namespace_b2d5aa2baf2b5701::activatespawnset("start_defenders", 1);
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_defenders");
        }
    } else {
        namespace_b2d5aa2baf2b5701::activatespawnset("normal", 1);
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "fallback");
        /#
            function_d73615f1fc12f3db(spawnpoint, spawnteam);
        #/
    }
    return spawnpoint;
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a0b
// Size: 0x28
function onspawnplayer(var_9156b53bcf7ce573) {
    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("kill");
    thread function_4d6a6309eda44c4e();
    thread function_31ca71112f5442e0();
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a3a
// Size: 0x5d
function function_4d6a6309eda44c4e() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (1) {
        self waittill("equipKillstreaksFinished");
        if (isplayer(self) && !isbot(self)) {
            namespace_58a74e7d54b56e8d::clearkillstreaks();
            if (isdefined(self.var_1275922708964790)) {
                namespace_58a74e7d54b56e8d::awardkillstreak(self.var_1275922708964790, "other");
            }
        }
    }
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a9e
// Size: 0xf9
function function_31ca71112f5442e0() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (1) {
        self waittill("giveLoadout");
        namespace_d19129e4fa5d176::loadout_clearperks(1);
        var_96e16459d5114277 = namespace_d19129e4fa5d176::function_87c3b562f2b366ee(self);
        foreach (perk in var_96e16459d5114277) {
            namespace_d19129e4fa5d176::loadout_giveperk(perk);
        }
        foreach (var_b39bbb3a0e35c61e in level.var_3e4609e79ec16d7a) {
            if (!isdefined(var_b39bbb3a0e35c61e.func)) {
                continue;
            }
            level [[ var_b39bbb3a0e35c61e.func ]](self);
        }
    }
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b9e
// Size: 0x46
function function_bed1816b8632a262(weaponobj) {
    self endon("death_or_disconnect");
    while (1) {
        currentweapon = self getcurrentweapon();
        if (currentweapon != weaponobj) {
            _switchtoweaponimmediate(weaponobj);
        } else {
            break;
        }
        wait(0.1);
    }
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3beb
// Size: 0x69
function function_59a66532ce69ba0(var_555748de5727b94f) {
    var_e78607dbd5bfa3b0 = function_6b71256e2c7b2060(game["dialog"][var_555748de5727b94f], "allies");
    namespace_d2b94521fd636348::function_3b08be23bf113fcf(var_555748de5727b94f, "allies", "killstreak_earned", undefined, var_e78607dbd5bfa3b0);
    var_e78607dbd5bfa3b0 = function_6b71256e2c7b2060(game["dialog"][var_555748de5727b94f], "axis");
    namespace_d2b94521fd636348::function_3b08be23bf113fcf(var_555748de5727b94f, "axis", "killstreak_earned", undefined, var_e78607dbd5bfa3b0);
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3c5b
// Size: 0x9f
function function_6b71256e2c7b2060(event, team) {
    var_a6461de9055834b5 = spawnstruct();
    var_a6461de9055834b5.mode = "mp";
    var_a6461de9055834b5.map = "havc";
    var_a6461de9055834b5.scene = "mode";
    var_a6461de9055834b5.character = tolower(namespace_d2b94521fd636348::function_592c1f6b3e44ac25(team));
    if (event == "havoc_mod_incoming") {
        var_a6461de9055834b5.event = "havi";
    } else {
        var_a6461de9055834b5.event = "hava";
    }
    return var_a6461de9055834b5;
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3d02
// Size: 0x17c
function function_d73615f1fc12f3db(spawnpoint, spawnteam) {
    /#
        if (getdvarint(@"hash_b5ceec3e3cb419be") != 0) {
            spawnpoints = namespace_b2d5aa2baf2b5701::getteamspawnpoints(spawnteam);
            fallbackspawnpoints = [];
            var_965ef52941de8769 = namespace_90f75d3fdf89a43e::getspawnpoint_legacy(spawnpoints, fallbackspawnpoints);
            if (!isdefined(level.var_3d292942d52b104a)) {
                level.var_3d292942d52b104a = 0;
                level.var_2dc7108159dc1da3 = 0;
                level.var_a065445ba781ddf6 = 0;
            }
            level.var_3d292942d52b104a++;
            println("<unknown string>" + var_965ef52941de8769.index + "<unknown string>" + var_965ef52941de8769.totalscore);
            if (var_965ef52941de8769.index == spawnpoint.index) {
                level.var_2dc7108159dc1da3++;
                iprintlnbold("<unknown string>" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "<unknown string>" + "<unknown string>" + level.var_2dc7108159dc1da3 + "<unknown string>" + level.var_3d292942d52b104a);
            } else {
                level.var_a065445ba781ddf6++;
                iprintlnbold("<unknown string>" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "<unknown string>" + "<unknown string>" + level.var_2dc7108159dc1da3 + "<unknown string>" + level.var_3d292942d52b104a);
            }
            return var_965ef52941de8769;
        }
    #/
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x3e85
// Size: 0xb3
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    level notify("havoc_player_killed", attacker);
    foreach (callbackfunc in level.var_46e88d936db0725c) {
        [[ callbackfunc ]](victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
    }
    victim.var_c115c6e4d9eee7ca = undefined;
    namespace_310ba947928891df::oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f3f
// Size: 0x17
function onsuicidedeath(victim) {
    victim.var_c115c6e4d9eee7ca = undefined;
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f5d
// Size: 0x53
function ontimelimit() {
    winner = namespace_e8a49b70d0769b66::gethighestscoringteam();
    if (game["status"] == "overtime") {
        winner = "forfeit";
    } else if ("tie") {
        winner = "overtime";
    }
    thread namespace_d576b6dc7cef9c62::endgame(winner, game["end_reason"]["time_limit_reached"]);
}

// Namespace havoc/namespace_422968e5a7e1852f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3fb7
// Size: 0x4f
function shouldgamelobbyremainintact() {
    axisscore = int(game["teamScores"]["axis"]);
    alliesscore = int(game["teamScores"]["allies"]);
    var_f9c7aae8c6acd600 = axisscore - alliesscore;
    return var_f9c7aae8c6acd600 < 10;
}

