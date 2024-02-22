// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\spawnscoring.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\weapons.gsc;

#namespace sharp;

// Namespace sharp/namespace_1654fdb4feddfcb6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x928
// Size: 0x1f2
function main() {
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    allowed[0] = getgametype();
    namespace_19b4203b51d56488::main(allowed);
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
    level.bypassclasschoicefunc = &namespace_d19129e4fa5d176::alwaysgamemodeclass;
    level.var_4b5bcb81b0764969 = 0;
    function_322c3b76fd30cc();
    function_488cb469cc7ac9b4();
    function_6ac6e27728aa9bf2();
    function_2a30633c5961be0e();
}

// Namespace sharp/namespace_1654fdb4feddfcb6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb21
// Size: 0x67
function initializematchrules() {
    setcommonrulesfrommatchrulesdata(1);
    setdynamicdvar(@"hash_85c3e7d7cf2f2af8", 1);
    registerwinlimitdvar("dm", 1);
    setdynamicdvar(@"hash_4cfd4f3e5a0eba56", 1);
    registerroundlimitdvar("dm", 1);
    setdynamicdvar(@"hash_eaf0f00090744c95", 0);
    registerhalftimedvar("dm", 0);
}

// Namespace sharp/namespace_1654fdb4feddfcb6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb8f
// Size: 0x193
function onstartgametype() {
    setclientnamemode("auto_change");
    foreach (entry in level.teamnamelist) {
        setobjectivetext(entry, "OBJECTIVES/DM");
        if (level.splitscreen) {
            setobjectivescoretext(entry, "OBJECTIVES/DM");
        } else {
            setobjectivescoretext(entry, "OBJECTIVES/DM_SCORE");
        }
        setobjectivehinttext(entry, "OBJECTIVES/DM_HINT");
    }
    if (function_bff229a11ecd1e34()) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"default");
    } else {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("FreeForAll", "Crit_Default");
    }
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_dm_spawn_start", 1);
    namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_dm_spawn");
    namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_dm_spawn");
    spawns = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_dm_spawn");
    namespace_b2d5aa2baf2b5701::registerspawnset("dm", spawns);
    level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
    level.quickmessagetoall = 1;
    level.blockweapondrops = 1;
}

// Namespace sharp/namespace_1654fdb4feddfcb6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd29
// Size: 0xa
function updategametypedvars() {
    namespace_310ba947928891df::updatecommongametypedvars();
}

// Namespace sharp/namespace_1654fdb4feddfcb6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd3a
// Size: 0xb5
function getspawnpoint() {
    spawnpoint = undefined;
    if (level.ingraceperiod) {
        spawnpoints = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_dm_spawn_start");
        if (!isdefined(level.requiresminstartspawns)) {
            /#
                assertex(spawnpoints.size != 0 || spawnpoints.size >= 8, "FFA requires at least " + 8 + " start spawns");
            #/
        }
        if (spawnpoints.size > 0) {
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint_startspawn(spawnpoints, 1);
        }
        if (!isdefined(spawnpoint)) {
            spawnpoints = namespace_b2d5aa2baf2b5701::getteamspawnpoints(self.team);
            spawnpoint = namespace_90f75d3fdf89a43e::getstartspawnpoint_freeforall(spawnpoints);
        }
    } else {
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, "none", "dm");
        /#
            function_456325525cd504d4(spawnpoint);
        #/
    }
    return spawnpoint;
}

// Namespace sharp/namespace_1654fdb4feddfcb6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdf7
// Size: 0x17c
function function_456325525cd504d4(spawnpoint) {
    /#
        if (getdvarint(@"hash_b5ceec3e3cb419be") != 0) {
            spawnpoints = namespace_b2d5aa2baf2b5701::getteamspawnpoints(self.team);
            fallbackspawnpoints = [];
            var_965ef52941de8769 = namespace_90f75d3fdf89a43e::getspawnpoint_legacy(spawnpoints, fallbackspawnpoints);
            if (!isdefined(level.var_3d292942d52b104a)) {
                level.var_3d292942d52b104a = 0;
                level.var_2dc7108159dc1da3 = 0;
                level.var_a065445ba781ddf6 = 0;
            }
            level.var_3d292942d52b104a++;
            println("kill" + var_965ef52941de8769.index + "t10_me_p15_knife" + var_965ef52941de8769.totalscore);
            if (var_965ef52941de8769.index == spawnpoint.index) {
                level.var_2dc7108159dc1da3++;
                iprintlnbold("specialty_dexterity" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "equip_bunkerbuster" + "sharp_bonus_5" + level.var_2dc7108159dc1da3 + "specialty_fastreload" + level.var_3d292942d52b104a);
            } else {
                level.var_a065445ba781ddf6++;
                iprintlnbold("specialty_fastsprintrecovery" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "equip_bunkerbuster" + "sharp_bonus_5" + level.var_2dc7108159dc1da3 + "specialty_fastreload" + level.var_3d292942d52b104a);
            }
            return var_965ef52941de8769;
        }
    #/
}

// Namespace sharp/namespace_1654fdb4feddfcb6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf7a
// Size: 0x63
function onspawnplayer(var_9156b53bcf7ce573) {
    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("kill");
    namespace_d19129e4fa5d176::giveloadout(self.team, "gamemode");
    self.var_4fd8a514d1f6b580 = 0;
    if (istrue(level.var_843c3040189fc440)) {
        self.var_4fd8a514d1f6b580 = 1;
    }
    level notify("spawned_player");
    namespace_44abc05161e2e2cb::showsplash("equipped_perks_mp");
}

// Namespace sharp/namespace_1654fdb4feddfcb6
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xfe4
// Size: 0x165
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
    attacker function_c7f941f617781d37(attacker.killcountthislife);
}

// Namespace sharp/namespace_1654fdb4feddfcb6
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1150
// Size: 0x165
function onplayerscore(event, player, originalpoints, victim, var_7ec7671a1e0c788f) {
    player incpersstat("gamemodeScore", originalpoints);
    newscore = int(player getpersstat("gamemodeScore"));
    player namespace_2685ec368e022695::statsetchild("round", "gamemodeScore", newscore);
    if (player.pers["cur_kill_streak"] > player getpersstat("killChains")) {
        player.pers["killChains"] = player.pers["cur_kill_streak"];
        player setextrascore1(player.pers["cur_kill_streak"]);
    }
    if (isdefined(var_7ec7671a1e0c788f)) {
        if (istrue(var_7ec7671a1e0c788f.var_3a13c58c2a354968)) {
            return 0;
        }
    }
    if (event == #"kill" || event == #"hash_49ee3d646e1fd20f" && istrue(player.var_4fd8a514d1f6b580)) {
        return 20;
    } else if (event == #"kill" || event == #"hash_49ee3d646e1fd20f" || isdefined(var_7ec7671a1e0c788f) && istrue(var_7ec7671a1e0c788f.var_e0badec2b1517ca3)) {
        return 10;
    } else if (event == #"assist_ffa") {
        player bufferednotify("earned_score_buffered", originalpoints);
    }
    return 0;
}

// Namespace sharp/namespace_1654fdb4feddfcb6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12bd
// Size: 0xa3
function dohalftimevo(attacker) {
    attacker namespace_944ddf7b8df1b0e3::leaderdialogonplayer("ffa_lead_first");
    newarray = array_sort_with_func(level.players, &compare_player_score);
    if (isdefined(newarray[1])) {
        newarray[1] namespace_944ddf7b8df1b0e3::leaderdialogonplayer("ffa_lead_second");
    }
    if (isdefined(newarray[2]) && newarray.size > 2) {
        newarray[2] namespace_944ddf7b8df1b0e3::leaderdialogonplayer("ffa_lead_third");
    }
    if (isdefined(newarray[newarray.size - 1]) && newarray.size > 3) {
        newarray[newarray.size - 1] namespace_944ddf7b8df1b0e3::leaderdialogonplayer("ffa_lead_last");
    }
    level.didhalfscorevoboost = 1;
}

// Namespace sharp/namespace_1654fdb4feddfcb6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1367
// Size: 0x2b
function compare_player_score(left, right) {
    return left.score >= right.score;
}

// Namespace sharp/namespace_1654fdb4feddfcb6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x139a
// Size: 0x2c
function onplayerconnect(player) {
    player namespace_d19129e4fa5d176::function_a16868d4dcd81a4b();
    player.pers["gamemodeLoadout"] = function_f158d813fe86ec48();
}

// Namespace sharp/namespace_1654fdb4feddfcb6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13cd
// Size: 0x156
function function_aeefcd8920dc46e0() {
    /#
        self endon("<unknown string>");
        while (1) {
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
                        player namespace_e8a49b70d0769b66::giveplayerscore(#"kill", 1);
                    }
                    waitframe();
                }
                break;
            }
            wait(1);
        }
        setdevdvar(@"hash_46a6b424af6acbc2", 0);
        setdevdvar(@"hash_86e14326e43c0115", 0);
        thread function_aeefcd8920dc46e0();
    #/
}

// Namespace sharp/namespace_1654fdb4feddfcb6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x152a
// Size: 0xd8
function function_322c3b76fd30cc() {
    level.var_5e99d1959527eed7[0] = function_326e3b76fdc1f2();
    level.var_5e99d1959527eed7[1] = function_326d3b76fdbfbf();
    level.var_5e99d1959527eed7[2] = function_326c3b76fdbd8c();
    level.var_5e99d1959527eed7[3] = function_326b3b76fdbb59();
    level.var_5e99d1959527eed7[4] = function_326a3b76fdb926();
    level.var_5e99d1959527eed7[5] = function_32693b76fdb6f3();
    level.var_5e99d1959527eed7[6] = function_32683b76fdb4c0();
    level.var_5e99d1959527eed7[7] = function_32773b76fdd5bd();
    level.var_5e99d1959527eed7[8] = function_32763b76fdd38a();
    level.var_5e99d1959527eed7[9] = function_6caa2ec6b0111da6();
    level.var_77a35a46c2f9d7d2 = array_randomize(level.var_5e99d1959527eed7);
}

// Namespace sharp/namespace_1654fdb4feddfcb6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1609
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
    loadout["loadoutPerks"] = [0:"specialty_ghost", 1:"specialty_engineer_minimap", 2:"specialty_coldblooded_and_hidden", 3:"specialty_operative"];
    loadout["loadoutGesture"] = "playerData";
    return loadout;
}

// Namespace sharp/namespace_1654fdb4feddfcb6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16da
// Size: 0x95
function function_326d3b76fdbfbf() {
    loadout["loadoutPrimary"] = "t10_sm_p06_sroger3";
    loadout["loadoutPrimaryAttachment"] = "t10_reflex01_east";
    loadout["loadoutSecondary"] = "t10_pi_p14_stiger";
    loadout["loadoutTertiary"] = "t10_me_p15_knife";
    loadout["loadoutEquipmentPrimary"] = "equip_impact_grenade";
    loadout["loadoutEquipmentSecondary"] = "equip_adrenaline";
    loadout["loadoutPerks"] = [0:"specialty_assassin", 1:"specialty_dexterity", 2:"specialty_hustle", 3:"specialty_slayer"];
    loadout["loadoutGesture"] = "playerData";
    return loadout;
}

// Namespace sharp/namespace_1654fdb4feddfcb6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1777
// Size: 0x88
function function_326c3b76fdbd8c() {
    loadout["loadoutPrimary"] = "t10_lm_p01_aroger10";
    loadout["loadoutSecondary"] = "t10_la_p17_pable3";
    loadout["loadoutTertiary"] = "t10_me_p15_knife";
    loadout["loadoutEquipmentPrimary"] = "equip_ied";
    loadout["loadoutEquipmentSecondary"] = "equip_emp";
    loadout["loadoutPerks"] = [0:"specialty_flak_jacket", 1:"specialty_fast_hands", 2:"specialty_quartermaster", 3:"specialty_tactician"];
    loadout["loadoutGesture"] = "playerData";
    return loadout;
}

// Namespace sharp/namespace_1654fdb4feddfcb6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1807
// Size: 0x8c
function function_326b3b76fdbb59() {
    loadout["loadoutPrimary"] = "t10_ar_p02_aking74";
    loadout["loadoutPrimaryAttachment"] = "t10_reflex02_east";
    loadout["loadoutSecondary"] = "t10_pi_p13_usugar9";
    loadout["loadoutTertiary"] = "t10_me_p15_knife";
    loadout["loadoutEquipmentPrimary"] = "equip_molotov";
    loadout["loadoutEquipmentSecondary"] = "equip_concussion";
    loadout["loadoutPerks"] = [0:"specialty_ghost", 1:"specialty_dexterity", 2:"specialty_hustle"];
    loadout["loadoutGesture"] = "playerData";
    return loadout;
}

// Namespace sharp/namespace_1654fdb4feddfcb6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x189b
// Size: 0x7f
function function_326a3b76fdb926() {
    loadout["loadoutPrimary"] = "t10_sm_p03_safox";
    loadout["loadoutSecondary"] = "t10_pi_p14_stiger";
    loadout["loadoutTertiary"] = "t10_me_p15_knife";
    loadout["loadoutEquipmentPrimary"] = "equip_c4";
    loadout["loadoutEquipmentSecondary"] = "equip_adrenaline";
    loadout["loadoutPerks"] = [0:"specialty_scavenger_ammo_and_equipment", 1:"specialty_fast_hands", 2:"specialty_coldblooded_and_hidden"];
    loadout["loadoutGesture"] = "playerData";
    return loadout;
}

// Namespace sharp/namespace_1654fdb4feddfcb6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1922
// Size: 0x8c
function function_32693b76fdb6f3() {
    loadout["loadoutPrimary"] = "t10_ar_p06_asvalor";
    loadout["loadoutPrimaryAttachment"] = "t10_reflex01_east";
    loadout["loadoutSecondary"] = "t10_pi_p14_stiger";
    loadout["loadoutTertiary"] = "t10_me_p15_knife";
    loadout["loadoutEquipmentPrimary"] = "equip_combataxe";
    loadout["loadoutEquipmentSecondary"] = "equip_decoy";
    loadout["loadoutPerks"] = [0:"specialty_ghost", 1:"specialty_gungho", 2:"specialty_gearhead"];
    loadout["loadoutGesture"] = "playerData";
    return loadout;
}

// Namespace sharp/namespace_1654fdb4feddfcb6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19b6
// Size: 0x8c
function function_32683b76fdb4c0() {
    loadout["loadoutPrimary"] = "t10_lm_p02_puncle21";
    loadout["loadoutPrimaryAttachment"] = "t10_reflex02_east";
    loadout["loadoutSecondary"] = "t10_pi_p13_usugar9";
    loadout["loadoutTertiary"] = "t10_me_p15_knife";
    loadout["loadoutEquipmentPrimary"] = "equip_ied";
    loadout["loadoutEquipmentSecondary"] = "equip_decoy";
    loadout["loadoutPerks"] = [0:"specialty_tac_mask", 1:"specialty_engineer_minimap", 2:"specialty_coldblooded_and_hidden"];
    loadout["loadoutGesture"] = "playerData";
    return loadout;
}

// Namespace sharp/namespace_1654fdb4feddfcb6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a4a
// Size: 0x7f
function function_32773b76fdd5bd() {
    loadout["loadoutPrimary"] = "t10_sh_p10_moslo500";
    loadout["loadoutSecondary"] = "t10_pi_p13_usugar9";
    loadout["loadoutTertiary"] = "t10_me_p15_knife";
    loadout["loadoutEquipmentPrimary"] = "equip_impact_grenade";
    loadout["loadoutEquipmentSecondary"] = "equip_shockstick";
    loadout["loadoutPerks"] = [0:"specialty_ghost", 1:"specialty_gungho", 2:"specialty_hustle"];
    loadout["loadoutGesture"] = "playerData";
    return loadout;
}

// Namespace sharp/namespace_1654fdb4feddfcb6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ad1
// Size: 0x7f
function function_32763b76fdd38a() {
    loadout["loadoutPrimary"] = "t10_sn_p09_droger";
    loadout["loadoutSecondary"] = "t10_la_p17_pable3";
    loadout["loadoutTertiary"] = "t10_me_p15_knife";
    loadout["loadoutEquipmentPrimary"] = "equip_bunkerbuster";
    loadout["loadoutEquipmentSecondary"] = "equip_spycam";
    loadout["loadoutPerks"] = [0:"specialty_flak_jacket", 1:"specialty_support_streaker", 2:"specialty_ante_up"];
    loadout["loadoutGesture"] = "playerData";
    return loadout;
}

// Namespace sharp/namespace_1654fdb4feddfcb6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b58
// Size: 0x7f
function function_6caa2ec6b0111da6() {
    loadout["loadoutPrimary"] = "t10_sn_p08_ultiger";
    loadout["loadoutSecondary"] = "t10_pi_p14_stiger";
    loadout["loadoutTertiary"] = "t10_me_p15_knife";
    loadout["loadoutEquipmentPrimary"] = "equip_ied";
    loadout["loadoutEquipmentSecondary"] = "equip_flash";
    loadout["loadoutPerks"] = [0:"specialty_ghost", 1:"specialty_dexterity", 2:"specialty_coldblooded_and_hidden"];
    loadout["loadoutGesture"] = "playerData";
    return loadout;
}

// Namespace sharp/namespace_1654fdb4feddfcb6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bdf
// Size: 0xc
function function_f158d813fe86ec48() {
    return level.var_995dc1bb9ac37bf2;
}

// Namespace sharp/namespace_1654fdb4feddfcb6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bf3
// Size: 0x1f
function function_488cb469cc7ac9b4() {
    level.var_995dc1bb9ac37bf2 = level.var_77a35a46c2f9d7d2[level.var_4b5bcb81b0764969];
}

// Namespace sharp/namespace_1654fdb4feddfcb6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c19
// Size: 0x2a
function function_6ac6e27728aa9bf2() {
    level waittill("prematch_done");
    var_c6a739346165199a = gettime();
    function_488cb469cc7ac9b4();
    function_405ec19f3c7a5c25(var_c6a739346165199a);
}

// Namespace sharp/namespace_1654fdb4feddfcb6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c4a
// Size: 0x1b
function function_1072c9acffb341d5() {
    var_c6a739346165199a = gettime();
    function_405ec19f3c7a5c25(var_c6a739346165199a);
}

// Namespace sharp/namespace_1654fdb4feddfcb6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c6c
// Size: 0x18b
function function_405ec19f3c7a5c25(var_c6a739346165199a) {
    level endon("disconnect");
    level endon("game_ended");
    var_928b160c136333a8 = 5;
    while (var_c6a739346165199a > gettime() - 40000) {
        namespace_e323c8674b44c8f4::waitlongdurationwithgameendtimeupdate(1);
    }
    while (var_928b160c136333a8 > 0) {
        foreach (player in level.players) {
            player setclientomnvar("ui_match_start_countdown", var_928b160c136333a8);
            player playsoundtoplayer("ui_mp_cranked_timer", player);
        }
        namespace_e323c8674b44c8f4::waitlongdurationwithgameendtimeupdate(1);
        var_928b160c136333a8--;
    }
    level.var_4b5bcb81b0764969++;
    if (level.var_4b5bcb81b0764969 == level.var_77a35a46c2f9d7d2.size) {
        level.var_4b5bcb81b0764969 = 0;
    }
    function_488cb469cc7ac9b4();
    foreach (player in level.players) {
        player.pers["gamemodeLoadout"] = function_f158d813fe86ec48();
        player setclientomnvar("ui_match_start_countdown", 0);
        player namespace_d19129e4fa5d176::giveloadout(player.team, "gamemode");
        player namespace_44abc05161e2e2cb::showsplash("equipped_perks_mp");
    }
    function_1072c9acffb341d5();
}

// Namespace sharp/namespace_1654fdb4feddfcb6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1dfe
// Size: 0xb7
function function_2a30633c5961be0e() {
    level endon("game_ended");
    level waittill("prematch_done");
    while (namespace_d576b6dc7cef9c62::gettimeremaining() / 1000 > 60) {
        namespace_e323c8674b44c8f4::waitlongdurationwithgameendtimeupdate(1);
    }
    level.var_843c3040189fc440 = 1;
    foreach (player in level.players) {
        player.var_4fd8a514d1f6b580 = 1;
        thread namespace_44abc05161e2e2cb::function_51614e8fce37b07f("sharp_bonus_5", level.var_62f6f7640e4431e3.var_3b841d10cb84cb06);
    }
}

// Namespace sharp/namespace_1654fdb4feddfcb6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ebc
// Size: 0x153
function function_c7f941f617781d37(streak) {
    switch (streak) {
    case 1:
        self.movespeedscaler = 1.2;
        namespace_3bbb5a98b932c46f::updatemovespeedscale();
        thread namespace_44abc05161e2e2cb::function_51614e8fce37b07f("sharp_bonus_1", level.var_62f6f7640e4431e3.var_3b841d10cb84cb06);
        break;
    case 2:
        giveperk("specialty_fastreload");
        thread namespace_44abc05161e2e2cb::function_51614e8fce37b07f("sharp_bonus_2", level.var_62f6f7640e4431e3.var_3b841d10cb84cb06);
        break;
    case 3:
        giveperk("specialty_fastsprintrecovery");
        thread namespace_44abc05161e2e2cb::function_51614e8fce37b07f("sharp_bonus_3", level.var_62f6f7640e4431e3.var_3b841d10cb84cb06);
        break;
    case 4:
        giveperk("specialty_quickdraw");
        thread namespace_44abc05161e2e2cb::function_51614e8fce37b07f("sharp_bonus_4", level.var_62f6f7640e4431e3.var_3b841d10cb84cb06);
        break;
    case 5:
        self.var_4fd8a514d1f6b580 = 1;
        thread namespace_44abc05161e2e2cb::function_51614e8fce37b07f("sharp_bonus_5", level.var_62f6f7640e4431e3.var_3b841d10cb84cb06);
        break;
    default:
        break;
    }
}

