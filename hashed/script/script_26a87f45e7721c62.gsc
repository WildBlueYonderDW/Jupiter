// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\spawnscoring.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\rank.gsc;

#namespace namespace_8bc51f03a28343f9;

// Namespace namespace_8bc51f03a28343f9/namespace_b3e0358457096f98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x78f
// Size: 0x1e0
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
        registertimelimitdvar(getgametype(), 300);
        registerscorelimitdvar(getgametype(), 20);
        registerroundlimitdvar(getgametype(), 1);
        registerwinlimitdvar(getgametype(), 1);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
    }
    function_94024c05e74d1a1();
    updategametypedvars();
    setteammode("ffa");
    level.onstartgametype = &onstartgametype;
    level.getspawnpoint = &getspawnpoint;
    level.onnormaldeath = &onnormaldeath;
    level.onplayerscore = &onplayerscore;
    level.onplayerconnect = &onplayerconnect;
    level.blockweapondrops = 1;
    level.denyclasschoice = 1;
    level.bypassclasschoicefunc = &namespace_d19129e4fa5d176::alwaysgamemodeclass;
    namespace_310ba947928891df::addspecialistdialog();
    function_e88d9ec1d5270bad();
    level.bots_gametype_handles_class_choice = 1;
    game["dialog"]["gametype"] = "gametype_aon";
    game["dialog"]["ffa_lead_first"] = "iw9_mffa_mode_uktl_ffp1";
    game["dialog"]["ffa_lead_second"] = "iw9_mffa_mode_uktl_ffp2";
    game["dialog"]["ffa_lead_third"] = "iw9_mffa_mode_uktl_ffp3";
    game["dialog"]["ffa_lead_last"] = "iw9_mffa_mode_uktl_ffp3";
    game["dialog"]["offense_obj"] = "iw9_mffa_mode_uktl_bost";
    game["dialog"]["defense_obj"] = "iw9_mffa_mode_uktl_bost";
    namespace_71eef510d7f364cf::registeronplayerspawncallback(&onplayerspawn);
}

// Namespace namespace_8bc51f03a28343f9/namespace_b3e0358457096f98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x976
// Size: 0x128
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(@"hash_51f7d7a1e73ce81d", getmatchrulesdata("aonData", "perkRef1"));
    setdynamicdvar(@"hash_66e3421f64de8bb8", getmatchrulesdata("aonData", "perkRef2"));
    setdynamicdvar(@"hash_48d22d4340bdaf5f", getmatchrulesdata("aonData", "perkRef3"));
    setdynamicdvar(@"hash_36cd4f12c763e1fa", getmatchrulesdata("aonData", "perkRef4"));
    setdynamicdvar(@"hash_7954a01f18f7ff09", getmatchrulesdata("aonData", "perkKills1"));
    setdynamicdvar(@"hash_e544e1784e62977c", getmatchrulesdata("aonData", "perkKills2"));
    setdynamicdvar(@"hash_b7df94ef10ab8413", getmatchrulesdata("aonData", "perkKills3"));
    setdynamicdvar(@"hash_9ce4576a217f3616", getmatchrulesdata("aonData", "perkKills4"));
    setdynamicdvar(@"hash_6e7da31aae47b8e0", 0);
    registerhalftimedvar(getgametype(), 0);
    setdynamicdvar(@"hash_bb6e8f8d9be104f4", 0);
}

// Namespace namespace_8bc51f03a28343f9/namespace_b3e0358457096f98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaa5
// Size: 0x1e1
function onstartgametype() {
    setclientnamemode("auto_change");
    foreach (entry in level.teamnamelist) {
        setobjectivetext(entry, "OBJECTIVES/WAR");
        if (level.splitscreen) {
            setobjectivescoretext(entry, "OBJECTIVES/WAR");
        } else {
            setobjectivescoretext(entry, "OBJECTIVES/WAR_SCORE");
        }
        setobjectivehinttext(entry, "OBJECTIVES/WAR_HINT");
    }
    if (function_bff229a11ecd1e34()) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"default");
    } else {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("FreeForAll", "Crit_Default");
    }
    level.spawnmins = (0, 0, 0);
    level.spawnmaxs = (0, 0, 0);
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_dm_spawn_start", 1);
    namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_dm_spawn");
    namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_dm_spawn_secondary", 1, 1);
    namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_dm_spawn");
    namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_dm_spawn_secondary", 1, 1);
    spawns = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_dm_spawn");
    var_3a5288f40c8be099 = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_dm_spawn_secondary");
    namespace_b2d5aa2baf2b5701::registerspawnset("normal", spawns);
    namespace_b2d5aa2baf2b5701::registerspawnset("fallback", var_3a5288f40c8be099);
    level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
    setomnvar("ui_disable_killstreaks", 1);
    setomnvar("ui_disable_fieldupgrades", 1);
}

// Namespace namespace_8bc51f03a28343f9/namespace_b3e0358457096f98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc8d
// Size: 0x164
function updategametypedvars() {
    namespace_310ba947928891df::updatecommongametypedvars();
    /#
        assert(isdefined(level.var_2f35cb1fb5f0d1be), "AON perks must be registered first.");
    #/
    level.var_2f35cb1fb5f0d1be[0].ref = getdvar(@"hash_51f7d7a1e73ce81d", "specialty_scavenger_plus");
    level.var_2f35cb1fb5f0d1be[0].kills = getdvarint(@"hash_7954a01f18f7ff09", 1);
    level.var_2f35cb1fb5f0d1be[1].ref = getdvar(@"hash_66e3421f64de8bb8", "specialty_hustle");
    level.var_2f35cb1fb5f0d1be[1].kills = getdvarint(@"hash_e544e1784e62977c", 1);
    level.var_2f35cb1fb5f0d1be[2].ref = getdvar(@"hash_48d22d4340bdaf5f", "specialty_grenade_expert");
    level.var_2f35cb1fb5f0d1be[2].kills = getdvarint(@"hash_b7df94ef10ab8413", 1);
    level.var_2f35cb1fb5f0d1be[3].ref = getdvar(@"hash_36cd4f12c763e1fa", "specialty_restock");
    level.var_2f35cb1fb5f0d1be[3].kills = getdvarint(@"hash_9ce4576a217f3616", 1);
}

// Namespace namespace_8bc51f03a28343f9/namespace_b3e0358457096f98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdf8
// Size: 0xba
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
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, "none", "normal", "fallback");
        /#
            function_456325525cd504d4(spawnpoint);
        #/
    }
    return spawnpoint;
}

// Namespace namespace_8bc51f03a28343f9/namespace_b3e0358457096f98
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xeba
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
            println("FreeForAll" + var_965ef52941de8769.index + "" + var_965ef52941de8769.totalscore);
            if (var_965ef52941de8769.index == spawnpoint.index) {
                level.var_2dc7108159dc1da3++;
                iprintlnbold("loadoutSecondaryAttachment" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "<unknown string>" + "<unknown string>" + level.var_2dc7108159dc1da3 + "<unknown string>" + level.var_3d292942d52b104a);
            } else {
                level.var_a065445ba781ddf6++;
                iprintlnbold("<unknown string>" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "<unknown string>" + "<unknown string>" + level.var_2dc7108159dc1da3 + "<unknown string>" + level.var_3d292942d52b104a);
            }
            return var_965ef52941de8769;
        }
    #/
}

// Namespace namespace_8bc51f03a28343f9/namespace_b3e0358457096f98
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x103d
// Size: 0x41
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    namespace_310ba947928891df::oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
}

// Namespace namespace_8bc51f03a28343f9/namespace_b3e0358457096f98
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1085
// Size: 0x1bc
function onplayerscore(event, player, originalpoints, victim, var_7ec7671a1e0c788f) {
    player namespace_3c5a4254f2b957ea::incpersstat("gamemodeScore", originalpoints);
    newscore = int(player namespace_3c5a4254f2b957ea::getpersstat("gamemodeScore"));
    player namespace_2685ec368e022695::statsetchild("round", "gamemodeScore", newscore);
    if (event != #"kill") {
        return 0;
    }
    if (player.var_c393133eb539cb6f < level.var_2f35cb1fb5f0d1be.size) {
        player.var_1f60935b8c07d0da++;
        unlockprogress = clamp(player.var_1f60935b8c07d0da / player.var_20b605ac2f213f6d, 0, 1);
        player setclientomnvar(level.var_2f35cb1fb5f0d1be[player.var_c393133eb539cb6f].var_b771ccc29a7c4099, unlockprogress);
        if (unlockprogress >= 1) {
            player namespace_82dcd1d5ae30ff7::giveperk(level.var_2f35cb1fb5f0d1be[player.var_c393133eb539cb6f].ref);
            player setclientomnvar(level.var_2f35cb1fb5f0d1be[player.var_c393133eb539cb6f].var_9f0625676ff25429, 1);
            player.var_c393133eb539cb6f++;
            if (player.var_c393133eb539cb6f < level.var_2f35cb1fb5f0d1be.size) {
                player.var_1f60935b8c07d0da = 0;
                player.var_20b605ac2f213f6d = level.var_2f35cb1fb5f0d1be[player.var_c393133eb539cb6f].kills;
            }
        }
    }
    return namespace_62c556437da28f50::getscoreinfovalue(#"hash_cade9c820001f3bf");
}

// Namespace namespace_8bc51f03a28343f9/namespace_b3e0358457096f98
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1249
// Size: 0x87
function onplayerconnect(player) {
    player namespace_d19129e4fa5d176::function_a16868d4dcd81a4b();
    player.pers["gamemodeLoadout"] = level.var_a955231ddec95faf;
    primaryweapon = player.pers["gamemodeLoadout"]["loadoutPrimary"];
    secondaryweapon = player.pers["gamemodeLoadout"]["loadoutSecondary"];
    player loadweaponsforplayer([0:primaryweapon, 1:secondaryweapon], 1);
}

// Namespace namespace_8bc51f03a28343f9/namespace_b3e0358457096f98
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x12d7
// Size: 0x45
function private onplayerspawn() {
    function_2c5507acfc56949d(self);
    function_bc342804fa29fa70(self);
    self.var_1f60935b8c07d0da = 0;
    self.var_c393133eb539cb6f = 0;
    self.var_20b605ac2f213f6d = level.var_2f35cb1fb5f0d1be[0].kills;
}

// Namespace namespace_8bc51f03a28343f9/namespace_b3e0358457096f98
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1323
// Size: 0x21d
function private function_94024c05e74d1a1() {
    /#
        assertex(!isdefined(level.var_2f35cb1fb5f0d1be), "AON perks have already been registered.");
    #/
    level.var_2f35cb1fb5f0d1be = [];
    level.var_2f35cb1fb5f0d1be[0] = spawnstruct();
    level.var_2f35cb1fb5f0d1be[0].ref = "";
    level.var_2f35cb1fb5f0d1be[0].kills = 1;
    level.var_2f35cb1fb5f0d1be[0].var_b771ccc29a7c4099 = "ui_aon_perk_progress_0";
    level.var_2f35cb1fb5f0d1be[0].var_9f0625676ff25429 = "ui_aon_perk_splash_0";
    level.var_2f35cb1fb5f0d1be[1] = spawnstruct();
    level.var_2f35cb1fb5f0d1be[1].ref = "";
    level.var_2f35cb1fb5f0d1be[1].kills = 1;
    level.var_2f35cb1fb5f0d1be[1].var_b771ccc29a7c4099 = "ui_aon_perk_progress_1";
    level.var_2f35cb1fb5f0d1be[1].var_9f0625676ff25429 = "ui_aon_perk_splash_1";
    level.var_2f35cb1fb5f0d1be[2] = spawnstruct();
    level.var_2f35cb1fb5f0d1be[2].ref = "";
    level.var_2f35cb1fb5f0d1be[2].kills = 1;
    level.var_2f35cb1fb5f0d1be[2].var_b771ccc29a7c4099 = "ui_aon_perk_progress_2";
    level.var_2f35cb1fb5f0d1be[2].var_9f0625676ff25429 = "ui_aon_perk_splash_2";
    level.var_2f35cb1fb5f0d1be[3] = spawnstruct();
    level.var_2f35cb1fb5f0d1be[3].ref = "";
    level.var_2f35cb1fb5f0d1be[3].kills = 1;
    level.var_2f35cb1fb5f0d1be[3].var_b771ccc29a7c4099 = "ui_aon_perk_progress_3";
    level.var_2f35cb1fb5f0d1be[3].var_9f0625676ff25429 = "ui_aon_perk_splash_3";
}

// Namespace namespace_8bc51f03a28343f9/namespace_b3e0358457096f98
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1547
// Size: 0x90
function private function_2c5507acfc56949d(player) {
    level endon("game_ended");
    player endon("disconnect");
    foreach (weapon in player.weaponlist) {
        if (isdefined(weapon) && !istrue(weapon.ismelee)) {
            player setweaponammoclip(weapon, 0);
            player setweaponammostock(weapon, 0);
        }
    }
}

// Namespace namespace_8bc51f03a28343f9/namespace_b3e0358457096f98
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x15de
// Size: 0x232
function private function_e88d9ec1d5270bad() {
    /#
        assertex(!isdefined(level.var_a955231ddec95faf), "The AON loadout has already been defined.");
    #/
    level.var_a955231ddec95faf = [];
    level.var_a955231ddec95faf["loadoutPrimary"] = "jup_jp23_me_knife_mp";
    level.var_a955231ddec95faf["loadoutPrimaryAttachment"] = "none";
    level.var_a955231ddec95faf["loadoutPrimaryAttachment2"] = "none";
    level.var_a955231ddec95faf["loadoutPrimaryCamo"] = "none";
    level.var_a955231ddec95faf["loadoutPrimaryReticle"] = "none";
    level.var_a955231ddec95faf["loadoutPrimaryVariantID"] = 0;
    level.var_a955231ddec95faf["loadoutSecondary"] = "jup_cp24_pi_glima21_mp";
    level.var_a955231ddec95faf["loadoutSecondaryAttachment"] = "none";
    level.var_a955231ddec95faf["loadoutSecondaryAttachment2"] = "none";
    level.var_a955231ddec95faf["loadoutSecondaryCamo"] = "none";
    level.var_a955231ddec95faf["loadoutSecondaryReticle"] = "none";
    level.var_a955231ddec95faf["loadoutSecondaryVariantID"] = 0;
    level.var_a955231ddec95faf["loadoutEquipmentPrimary"] = "equip_throwing_knife";
    level.var_a955231ddec95faf["loadoutEquipmentSecondary"] = "none";
    level.var_a955231ddec95faf["loadoutSuper"] = "none";
    level.var_a955231ddec95faf["loadoutStreakType"] = "assault";
    level.var_a955231ddec95faf["loadoutKillstreak1"] = "none";
    level.var_a955231ddec95faf["loadoutKillstreak2"] = "none";
    level.var_a955231ddec95faf["loadoutKillstreak3"] = "none";
    level.var_a955231ddec95faf["loadoutUsingSpecialist"] = 1;
    level.var_a955231ddec95faf["loadoutPerks"] = [0:"specialty_null"];
    level.var_a955231ddec95faf["loadoutExtraPerks"] = [0:"specialty_null"];
    level.var_a955231ddec95faf["loadoutGesture"] = "playerData";
    level.var_a955231ddec95faf["loadoutFieldUpgrade1"] = "none";
    level.var_a955231ddec95faf["loadoutFieldUpgrade2"] = "none";
}

// Namespace namespace_8bc51f03a28343f9/namespace_b3e0358457096f98
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1817
// Size: 0x191
function private function_bc342804fa29fa70(player) {
    player setclientomnvar("ui_spawn_perk_0", level.var_2f35cb1fb5f0d1be[0].ref);
    player setclientomnvar("ui_spawn_perk_1", level.var_2f35cb1fb5f0d1be[1].ref);
    player setclientomnvar("ui_spawn_perk_2", level.var_2f35cb1fb5f0d1be[2].ref);
    player setclientomnvar("ui_spawn_perk_3", level.var_2f35cb1fb5f0d1be[3].ref);
    player setclientomnvar(level.var_2f35cb1fb5f0d1be[0].var_b771ccc29a7c4099, 0);
    player setclientomnvar(level.var_2f35cb1fb5f0d1be[1].var_b771ccc29a7c4099, 0);
    player setclientomnvar(level.var_2f35cb1fb5f0d1be[2].var_b771ccc29a7c4099, 0);
    player setclientomnvar(level.var_2f35cb1fb5f0d1be[3].var_b771ccc29a7c4099, 0);
    player setclientomnvar(level.var_2f35cb1fb5f0d1be[0].var_9f0625676ff25429, 0);
    player setclientomnvar(level.var_2f35cb1fb5f0d1be[1].var_9f0625676ff25429, 0);
    player setclientomnvar(level.var_2f35cb1fb5f0d1be[2].var_9f0625676ff25429, 0);
    player setclientomnvar(level.var_2f35cb1fb5f0d1be[3].var_9f0625676ff25429, 0);
}

