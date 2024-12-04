#using scripts\common\utility;
#using scripts\cp_mp\utility\inventory_utility;
#using scripts\engine\utility;
#using scripts\mp\class;
#using scripts\mp\gamelogic;
#using scripts\mp\gameobjects;
#using scripts\mp\gamescore;
#using scripts\mp\gametypes\common;
#using scripts\mp\globallogic;
#using scripts\mp\hostmigration;
#using scripts\mp\hud_message;
#using scripts\mp\hud_util;
#using scripts\mp\persistence;
#using scripts\mp\spawnlogic;
#using scripts\mp\spawnscoring;
#using scripts\mp\utility\dialog;
#using scripts\mp\utility\dvars;
#using scripts\mp\utility\game;
#using scripts\mp\utility\perk;
#using scripts\mp\utility\player;
#using scripts\mp\utility\script;
#using scripts\mp\utility\stats;
#using scripts\mp\weapons;

#namespace sharp;

// Namespace sharp / scripts\mp\gametypes\sharp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa7f
// Size: 0x1f2
function main() {
    scripts\mp\globallogic::init();
    scripts\mp\globallogic::setupcallbacks();
    allowed[0] = getgametype();
    scripts\mp\gameobjects::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registertimelimitdvar(getgametype(), 600);
        registerscorelimitdvar(getgametype(), 30);
        registerwinlimitdvar(getgametype(), 1);
        registerroundlimitdvar(getgametype(), 1);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
    }
    updategametypedvars();
    level.onstartgametype = &onstartgametype;
    level.onplayerconnect = &onplayerconnect;
    level.getspawnpoint = &getspawnpoint;
    level.modeonspawnplayer = &onspawnplayer;
    level.onnormaldeath = &onnormaldeath;
    level.onplayerscore = &onplayerscore;
    level.didhalfscorevoboost = 0;
    setteammode("ffa");
    game["dialog"]["gametype"] = "iw9_mffa_mode_uktl_name";
    game["dialog"]["ffa_lead_first"] = "iw9_mffa_mode_uktl_ffp1";
    game["dialog"]["ffa_lead_second"] = "iw9_mffa_mode_uktl_ffp2";
    game["dialog"]["ffa_lead_third"] = "iw9_mffa_mode_uktl_ffp3";
    game["dialog"]["ffa_lead_last"] = "iw9_mffa_mode_uktl_ffp3";
    game["dialog"]["offense_obj"] = "iw9_mffa_mode_uktl_bost";
    game["dialog"]["defense_obj"] = "iw9_mffa_mode_uktl_bost";
    /#
        thread function_aeefcd8920dc46e0();
    #/
    level.denyclasschoice = 1;
    level.bypassclasschoicefunc = &scripts\mp\class::alwaysgamemodeclass;
    level.loadout_changes = 0;
    createloadouts();
    function_488cb469cc7ac9b4();
    function_6ac6e27728aa9bf2();
    function_2a30633c5961be0e();
}

// Namespace sharp / scripts\mp\gametypes\sharp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc79
// Size: 0x66
function initializematchrules() {
    setcommonrulesfrommatchrulesdata(1);
    setdynamicdvar(@"hash_85c3e7d7cf2f2af8", 1);
    registerwinlimitdvar("dm", 1);
    setdynamicdvar(@"hash_4cfd4f3e5a0eba56", 1);
    registerroundlimitdvar("dm", 1);
    setdynamicdvar(@"hash_eaf0f00090744c95", 0);
    registerhalftimedvar("dm", 0);
}

// Namespace sharp / scripts\mp\gametypes\sharp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xce7
// Size: 0x190
function onstartgametype() {
    setclientnamemode("auto_change");
    foreach (entry in level.teamnamelist) {
        setobjectivetext(entry, %OBJECTIVES/DM);
        if (level.splitscreen) {
            setobjectivescoretext(entry, %OBJECTIVES/DM);
        } else {
            setobjectivescoretext(entry, %OBJECTIVES/DM_SCORE);
        }
        setobjectivehinttext(entry, %OBJECTIVES/DM_HINT);
    }
    if (function_bff229a11ecd1e34()) {
        scripts\mp\spawnlogic::setactivespawnlogic(#"default");
    } else {
        scripts\mp\spawnlogic::setactivespawnlogic("FreeForAll", "Crit_Default");
    }
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    scripts\mp\spawnlogic::addstartspawnpoints("mp_dm_spawn_start", 1);
    scripts\mp\spawnlogic::addspawnpoints("allies", "mp_dm_spawn");
    scripts\mp\spawnlogic::addspawnpoints("axis", "mp_dm_spawn");
    spawns = scripts\mp\spawnlogic::getspawnpointarray("mp_dm_spawn");
    scripts\mp\spawnlogic::registerspawnset("dm", spawns);
    level.mapcenter = scripts\mp\spawnlogic::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
    level.quickmessagetoall = 1;
    level.blockweapondrops = 1;
}

// Namespace sharp / scripts\mp\gametypes\sharp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe7f
// Size: 0x9
function updategametypedvars() {
    scripts\mp\gametypes\common::updatecommongametypedvars();
}

// Namespace sharp / scripts\mp\gametypes\sharp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe90
// Size: 0xb4
function getspawnpoint() {
    spawnpoint = undefined;
    if (level.ingraceperiod) {
        spawnpoints = scripts\mp\spawnlogic::getspawnpointarray("mp_dm_spawn_start");
        if (!isdefined(level.requiresminstartspawns)) {
            assertex(spawnpoints.size != 0 || spawnpoints.size >= 8, "<dev string:x1c>" + 8 + "<dev string:x36>");
        }
        if (spawnpoints.size > 0) {
            spawnpoint = scripts\mp\spawnlogic::getspawnpoint_startspawn(spawnpoints, 1);
        }
        if (!isdefined(spawnpoint)) {
            spawnpoints = scripts\mp\spawnlogic::getteamspawnpoints(self.team);
            spawnpoint = scripts\mp\spawnscoring::getstartspawnpoint_freeforall(spawnpoints);
        }
    } else {
        spawnpoint = scripts\mp\spawnlogic::getspawnpoint(self, "none", "dm");
        /#
            comparespawns(spawnpoint);
        #/
    }
    return spawnpoint;
}

/#

    // Namespace sharp / scripts\mp\gametypes\sharp
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xf4d
    // Size: 0x17a
    function comparespawns(spawnpoint) {
        if (getdvarint(@"hash_b5ceec3e3cb419be") != 0) {
            spawnpoints = scripts\mp\spawnlogic::getteamspawnpoints(self.team);
            fallbackspawnpoints = [];
            scriptspawnpoint = scripts\mp\spawnscoring::getspawnpoint_legacy(spawnpoints, fallbackspawnpoints);
            if (!isdefined(level.var_3d292942d52b104a)) {
                level.var_3d292942d52b104a = 0;
                level.var_2dc7108159dc1da3 = 0;
                level.var_a065445ba781ddf6 = 0;
            }
            level.var_3d292942d52b104a++;
            println("<dev string:x47>" + scriptspawnpoint.index + "<dev string:x62>" + scriptspawnpoint.totalscore);
            if (scriptspawnpoint.index == spawnpoint.index) {
                level.var_2dc7108159dc1da3++;
                iprintlnbold("<dev string:x78>" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "<dev string:x97>" + "<dev string:xa5>" + level.var_2dc7108159dc1da3 + "<dev string:xaa>" + level.var_3d292942d52b104a);
            } else {
                level.var_a065445ba781ddf6++;
                iprintlnbold("<dev string:xaf>" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "<dev string:x97>" + "<dev string:xa5>" + level.var_2dc7108159dc1da3 + "<dev string:xaa>" + level.var_3d292942d52b104a);
            }
            return scriptspawnpoint;
        }
    }

#/

// Namespace sharp / scripts\mp\gametypes\sharp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10cf
// Size: 0x62
function onspawnplayer(revivespawn) {
    scripts\mp\hud_message::function_f004ef4606b9efdc("kill");
    scripts\mp\class::giveloadout(self.team, "gamemode");
    self.var_4fd8a514d1f6b580 = 0;
    if (istrue(level.var_843c3040189fc440)) {
        self.var_4fd8a514d1f6b580 = 1;
    }
    level notify("spawned_player");
    scripts\mp\hud_message::showsplash("equipped_perks_mp");
}

// Namespace sharp / scripts\mp\gametypes\sharp
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1139
// Size: 0x161
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    highestscore = 0;
    foreach (player in level.players) {
        if (isdefined(player.score) && player.score > highestscore) {
            highestscore = player.score;
        }
    }
    if (!level.didhalfscorevoboost) {
        if (attacker.score >= int(level.scorelimit * level.currentround - level.scorelimit / 2)) {
            thread dohalftimevo(attacker);
        }
    }
    if (attacker.score == level.scorelimit - 2) {
        level.kick_afk_check = 1;
    }
    streak = attacker getpersstat("killChains");
    if (isdefined(streak)) {
        attacker setextrascore1(streak);
    }
    attacker givebonus(attacker.killcountthislife);
}

// Namespace sharp / scripts\mp\gametypes\sharp
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x12a2
// Size: 0x165
function onplayerscore(event, player, originalpoints, victim, eventinfo) {
    player incpersstat("gamemodeScore", originalpoints);
    newscore = int(player getpersstat("gamemodeScore"));
    player scripts\mp\persistence::statsetchild("round", "gamemodeScore", newscore);
    if (player.pers["cur_kill_streak"] > player getpersstat("killChains")) {
        player.pers["killChains"] = player.pers["cur_kill_streak"];
        player setextrascore1(player.pers["cur_kill_streak"]);
    }
    if (isdefined(eventinfo)) {
        if (istrue(eventinfo.var_3a13c58c2a354968)) {
            return 0;
        }
    }
    if (event == #"kill" || event == #"elimination_kill" && istrue(player.var_4fd8a514d1f6b580)) {
        return 20;
    } else if (event == #"kill" || event == #"elimination_kill" || isdefined(eventinfo) && istrue(eventinfo.iskillstreakkill)) {
        return 10;
    } else if (event == #"assist_ffa") {
        player bufferednotify("earned_score_buffered", originalpoints);
    }
    return 0;
}

// Namespace sharp / scripts\mp\gametypes\sharp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1410
// Size: 0xa3
function dohalftimevo(attacker) {
    attacker scripts\mp\utility\dialog::leaderdialogonplayer("ffa_lead_first");
    newarray = array_sort_with_func(level.players, &compare_player_score);
    if (isdefined(newarray[1])) {
        newarray[1] scripts\mp\utility\dialog::leaderdialogonplayer("ffa_lead_second");
    }
    if (isdefined(newarray[2]) && newarray.size > 2) {
        newarray[2] scripts\mp\utility\dialog::leaderdialogonplayer("ffa_lead_third");
    }
    if (isdefined(newarray[newarray.size - 1]) && newarray.size > 3) {
        newarray[newarray.size - 1] scripts\mp\utility\dialog::leaderdialogonplayer("ffa_lead_last");
    }
    level.didhalfscorevoboost = 1;
}

// Namespace sharp / scripts\mp\gametypes\sharp
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x14bb
// Size: 0x2a
function compare_player_score(left, right) {
    return left.score >= right.score;
}

// Namespace sharp / scripts\mp\gametypes\sharp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14ee
// Size: 0x2b
function onplayerconnect(player) {
    player scripts\mp\class::function_a16868d4dcd81a4b();
    player.pers["gamemodeLoadout"] = function_f158d813fe86ec48();
}

/#

    // Namespace sharp / scripts\mp\gametypes\sharp
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1521
    // Size: 0x150
    function function_aeefcd8920dc46e0() {
        self endon("<dev string:xdf>");
        while (true) {
            if (getdvarint(@"hash_46a6b424af6acbc2") != 0 || getdvarint(@"hash_86e14326e43c0115") != 0) {
                points = 0;
                var_ff962a1182d547dc = getdvarint(@"hash_46a6b424af6acbc2");
                var_f104804091b9dedf = getdvarint(@"hash_86e14326e43c0115");
                if (var_ff962a1182d547dc > 0) {
                    points = var_ff962a1182d547dc;
                }
                if (var_f104804091b9dedf > 0) {
                    points = var_f104804091b9dedf;
                }
                if (var_ff962a1182d547dc == -1 || var_f104804091b9dedf == -1) {
                    points = getdvarint(@"hash_dba1d87860792cd4") - 1;
                }
                foreach (player in level.players) {
                    for (i = 0; i < points; i++) {
                        player scripts\mp\gamescore::giveplayerscore(#"kill", 1);
                    }
                    waitframe();
                }
                break;
            }
            wait 1;
        }
        setdevdvar(@"hash_46a6b424af6acbc2", 0);
        setdevdvar(@"hash_86e14326e43c0115", 0);
        thread function_aeefcd8920dc46e0();
    }

#/

// Namespace sharp / scripts\mp\gametypes\sharp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1679
// Size: 0xd7
function createloadouts() {
    level.infil_loadouts[0] = function_326e3b76fdc1f2();
    level.infil_loadouts[1] = function_326d3b76fdbfbf();
    level.infil_loadouts[2] = function_326c3b76fdbd8c();
    level.infil_loadouts[3] = function_326b3b76fdbb59();
    level.infil_loadouts[4] = function_326a3b76fdb926();
    level.infil_loadouts[5] = function_32693b76fdb6f3();
    level.infil_loadouts[6] = function_32683b76fdb4c0();
    level.infil_loadouts[7] = function_32773b76fdd5bd();
    level.infil_loadouts[8] = function_32763b76fdd38a();
    level.infil_loadouts[9] = function_6caa2ec6b0111da6();
    level.var_77a35a46c2f9d7d2 = array_randomize(level.infil_loadouts);
}

// Namespace sharp / scripts\mp\gametypes\sharp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1758
// Size: 0xc9
function function_326e3b76fdc1f2() {
    loadout["loadoutPrimary"] = "t10_ar_p01_coslo723";
    loadout["loadoutPrimaryAttachment"] = "t10_mags_extclip_ar_coslo";
    loadout["loadoutPrimaryAttachment2"] = "t10_stocks_adsmove_ar_coslo";
    loadout["loadoutPrimaryAttachment3"] = "t10_muzzles_suppressor_ar_coslo";
    loadout["loadoutPrimaryAttachment4"] = "t10_grips_quickdraw_ar_coslo";
    loadout["loadoutPrimaryAttachment5"] = "t10_reddot01_west";
    loadout["loadoutSecondary"] = "t10_pi_p13_usugar9";
    loadout["loadoutTertiary"] = "t10_me_p15_knife";
    loadout["loadoutEquipmentPrimary"] = "equip_frag";
    loadout["loadoutEquipmentSecondary"] = "equip_smoke";
    loadout["loadoutPerks"] = ["specialty_ghost", "specialty_engineer_minimap", "specialty_coldblooded_and_hidden", "specialty_operative"];
    loadout["loadoutGesture"] = "playerData";
    return loadout;
}

// Namespace sharp / scripts\mp\gametypes\sharp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x182a
// Size: 0x95
function function_326d3b76fdbfbf() {
    loadout["loadoutPrimary"] = "t10_sm_p06_sroger3";
    loadout["loadoutPrimaryAttachment"] = "t10_reflex01_east";
    loadout["loadoutSecondary"] = "t10_pi_p14_stiger";
    loadout["loadoutTertiary"] = "t10_me_p15_knife";
    loadout["loadoutEquipmentPrimary"] = "equip_impact_grenade";
    loadout["loadoutEquipmentSecondary"] = "equip_adrenaline";
    loadout["loadoutPerks"] = ["specialty_assassin", "specialty_dexterity", "specialty_hustle", "specialty_slayer"];
    loadout["loadoutGesture"] = "playerData";
    return loadout;
}

// Namespace sharp / scripts\mp\gametypes\sharp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18c8
// Size: 0x88
function function_326c3b76fdbd8c() {
    loadout["loadoutPrimary"] = "t10_lm_p01_aroger10";
    loadout["loadoutSecondary"] = "t10_la_p17_pable3";
    loadout["loadoutTertiary"] = "t10_me_p15_knife";
    loadout["loadoutEquipmentPrimary"] = "equip_ied";
    loadout["loadoutEquipmentSecondary"] = "equip_emp";
    loadout["loadoutPerks"] = ["specialty_flak_jacket", "specialty_fast_hands", "specialty_quartermaster", "specialty_tactician"];
    loadout["loadoutGesture"] = "playerData";
    return loadout;
}

// Namespace sharp / scripts\mp\gametypes\sharp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1959
// Size: 0x8c
function function_326b3b76fdbb59() {
    loadout["loadoutPrimary"] = "t10_ar_p02_aking74";
    loadout["loadoutPrimaryAttachment"] = "t10_reflex02_east";
    loadout["loadoutSecondary"] = "t10_pi_p13_usugar9";
    loadout["loadoutTertiary"] = "t10_me_p15_knife";
    loadout["loadoutEquipmentPrimary"] = "equip_molotov";
    loadout["loadoutEquipmentSecondary"] = "equip_concussion";
    loadout["loadoutPerks"] = ["specialty_ghost", "specialty_dexterity", "specialty_hustle"];
    loadout["loadoutGesture"] = "playerData";
    return loadout;
}

// Namespace sharp / scripts\mp\gametypes\sharp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19ee
// Size: 0x7f
function function_326a3b76fdb926() {
    loadout["loadoutPrimary"] = "t10_sm_p03_safox";
    loadout["loadoutSecondary"] = "t10_pi_p14_stiger";
    loadout["loadoutTertiary"] = "t10_me_p15_knife";
    loadout["loadoutEquipmentPrimary"] = "equip_c4";
    loadout["loadoutEquipmentSecondary"] = "equip_adrenaline";
    loadout["loadoutPerks"] = ["specialty_scavenger_ammo_and_equipment", "specialty_fast_hands", "specialty_coldblooded_and_hidden"];
    loadout["loadoutGesture"] = "playerData";
    return loadout;
}

// Namespace sharp / scripts\mp\gametypes\sharp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a76
// Size: 0x8c
function function_32693b76fdb6f3() {
    loadout["loadoutPrimary"] = "t10_ar_p06_asvalor";
    loadout["loadoutPrimaryAttachment"] = "t10_reflex01_east";
    loadout["loadoutSecondary"] = "t10_pi_p14_stiger";
    loadout["loadoutTertiary"] = "t10_me_p15_knife";
    loadout["loadoutEquipmentPrimary"] = "equip_combataxe";
    loadout["loadoutEquipmentSecondary"] = "equip_decoy";
    loadout["loadoutPerks"] = ["specialty_ghost", "specialty_gungho", "specialty_gearhead"];
    loadout["loadoutGesture"] = "playerData";
    return loadout;
}

// Namespace sharp / scripts\mp\gametypes\sharp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b0b
// Size: 0x8c
function function_32683b76fdb4c0() {
    loadout["loadoutPrimary"] = "t10_lm_p02_puncle21";
    loadout["loadoutPrimaryAttachment"] = "t10_reflex02_east";
    loadout["loadoutSecondary"] = "t10_pi_p13_usugar9";
    loadout["loadoutTertiary"] = "t10_me_p15_knife";
    loadout["loadoutEquipmentPrimary"] = "equip_ied";
    loadout["loadoutEquipmentSecondary"] = "equip_decoy";
    loadout["loadoutPerks"] = ["specialty_tac_mask", "specialty_engineer_minimap", "specialty_coldblooded_and_hidden"];
    loadout["loadoutGesture"] = "playerData";
    return loadout;
}

// Namespace sharp / scripts\mp\gametypes\sharp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ba0
// Size: 0x7f
function function_32773b76fdd5bd() {
    loadout["loadoutPrimary"] = "t10_sh_p10_moslo500";
    loadout["loadoutSecondary"] = "t10_pi_p13_usugar9";
    loadout["loadoutTertiary"] = "t10_me_p15_knife";
    loadout["loadoutEquipmentPrimary"] = "equip_impact_grenade";
    loadout["loadoutEquipmentSecondary"] = "equip_shockstick";
    loadout["loadoutPerks"] = ["specialty_ghost", "specialty_gungho", "specialty_hustle"];
    loadout["loadoutGesture"] = "playerData";
    return loadout;
}

// Namespace sharp / scripts\mp\gametypes\sharp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c28
// Size: 0x7f
function function_32763b76fdd38a() {
    loadout["loadoutPrimary"] = "t10_sn_p09_droger";
    loadout["loadoutSecondary"] = "t10_la_p17_pable3";
    loadout["loadoutTertiary"] = "t10_me_p15_knife";
    loadout["loadoutEquipmentPrimary"] = "equip_bunkerbuster";
    loadout["loadoutEquipmentSecondary"] = "equip_spycam";
    loadout["loadoutPerks"] = ["specialty_flak_jacket", "specialty_support_streaker", "specialty_ante_up"];
    loadout["loadoutGesture"] = "playerData";
    return loadout;
}

// Namespace sharp / scripts\mp\gametypes\sharp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cb0
// Size: 0x7f
function function_6caa2ec6b0111da6() {
    loadout["loadoutPrimary"] = "t10_sn_p08_ultiger";
    loadout["loadoutSecondary"] = "t10_pi_p14_stiger";
    loadout["loadoutTertiary"] = "t10_me_p15_knife";
    loadout["loadoutEquipmentPrimary"] = "equip_ied";
    loadout["loadoutEquipmentSecondary"] = "equip_flash";
    loadout["loadoutPerks"] = ["specialty_ghost", "specialty_dexterity", "specialty_coldblooded_and_hidden"];
    loadout["loadoutGesture"] = "playerData";
    return loadout;
}

// Namespace sharp / scripts\mp\gametypes\sharp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d38
// Size: 0xb
function function_f158d813fe86ec48() {
    return level.currentloadout;
}

// Namespace sharp / scripts\mp\gametypes\sharp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d4c
// Size: 0x1e
function function_488cb469cc7ac9b4() {
    level.currentloadout = level.var_77a35a46c2f9d7d2[level.loadout_changes];
}

// Namespace sharp / scripts\mp\gametypes\sharp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d72
// Size: 0x2a
function function_6ac6e27728aa9bf2() {
    level waittill("prematch_done");
    var_c6a739346165199a = gettime();
    function_488cb469cc7ac9b4();
    function_405ec19f3c7a5c25(var_c6a739346165199a);
}

// Namespace sharp / scripts\mp\gametypes\sharp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1da4
// Size: 0x1b
function function_1072c9acffb341d5() {
    var_c6a739346165199a = gettime();
    function_405ec19f3c7a5c25(var_c6a739346165199a);
}

// Namespace sharp / scripts\mp\gametypes\sharp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1dc7
// Size: 0x186
function function_405ec19f3c7a5c25(var_c6a739346165199a) {
    level endon("disconnect");
    level endon("game_ended");
    countdown_time = 5;
    while (var_c6a739346165199a > gettime() - 40000) {
        scripts\mp\hostmigration::waitlongdurationwithgameendtimeupdate(1);
    }
    while (countdown_time > 0) {
        foreach (player in level.players) {
            player setclientomnvar("ui_match_start_countdown", countdown_time);
            player playsoundtoplayer("ui_mp_cranked_timer", player);
        }
        scripts\mp\hostmigration::waitlongdurationwithgameendtimeupdate(1);
        countdown_time--;
    }
    level.loadout_changes++;
    if (level.loadout_changes == level.var_77a35a46c2f9d7d2.size) {
        level.loadout_changes = 0;
    }
    function_488cb469cc7ac9b4();
    foreach (player in level.players) {
        player.pers["gamemodeLoadout"] = function_f158d813fe86ec48();
        player setclientomnvar("ui_match_start_countdown", 0);
        player scripts\mp\class::giveloadout(player.team, "gamemode");
        player scripts\mp\hud_message::showsplash("equipped_perks_mp");
    }
    function_1072c9acffb341d5();
}

// Namespace sharp / scripts\mp\gametypes\sharp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f55
// Size: 0xb5
function function_2a30633c5961be0e() {
    level endon("game_ended");
    level waittill("prematch_done");
    while (scripts\mp\gamelogic::gettimeremaining() / 1000 > 60) {
        scripts\mp\hostmigration::waitlongdurationwithgameendtimeupdate(1);
    }
    level.var_843c3040189fc440 = 1;
    foreach (player in level.players) {
        player.var_4fd8a514d1f6b580 = 1;
        thread scripts\mp\hud_message::function_51614e8fce37b07f("sharp_bonus_5", level.gametypebundle.var_3b841d10cb84cb06);
    }
}

// Namespace sharp / scripts\mp\gametypes\sharp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2012
// Size: 0x152
function givebonus(streak) {
    switch (streak) {
    case 1:
        self.movespeedscaler = 1.2;
        scripts\mp\weapons::updatemovespeedscale();
        thread scripts\mp\hud_message::function_51614e8fce37b07f("sharp_bonus_1", level.gametypebundle.var_3b841d10cb84cb06);
        break;
    case 2:
        giveperk("specialty_fastreload");
        thread scripts\mp\hud_message::function_51614e8fce37b07f("sharp_bonus_2", level.gametypebundle.var_3b841d10cb84cb06);
        break;
    case 3:
        giveperk("specialty_fastsprintrecovery");
        thread scripts\mp\hud_message::function_51614e8fce37b07f("sharp_bonus_3", level.gametypebundle.var_3b841d10cb84cb06);
        break;
    case 4:
        giveperk("specialty_quickdraw");
        thread scripts\mp\hud_message::function_51614e8fce37b07f("sharp_bonus_4", level.gametypebundle.var_3b841d10cb84cb06);
        break;
    case 5:
        self.var_4fd8a514d1f6b580 = 1;
        thread scripts\mp\hud_message::function_51614e8fce37b07f("sharp_bonus_5", level.gametypebundle.var_3b841d10cb84cb06);
        break;
    default:
        break;
    }
}

