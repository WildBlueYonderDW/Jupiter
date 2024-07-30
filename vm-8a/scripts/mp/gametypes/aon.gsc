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

#namespace aon;

// Namespace aon / scripts\mp\gametypes\aon
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x78f
// Size: 0x1df
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
        registertimelimitdvar(getgametype(), 300);
        registerscorelimitdvar(getgametype(), 20);
        registerroundlimitdvar(getgametype(), 1);
        registerwinlimitdvar(getgametype(), 1);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
    }
    registerperks();
    updategametypedvars();
    setteammode("ffa");
    level.onstartgametype = &onstartgametype;
    level.getspawnpoint = &getspawnpoint;
    level.onnormaldeath = &onnormaldeath;
    level.onplayerscore = &onplayerscore;
    level.onplayerconnect = &onplayerconnect;
    level.blockweapondrops = 1;
    level.denyclasschoice = 1;
    level.bypassclasschoicefunc = &scripts\mp\class::alwaysgamemodeclass;
    scripts\mp\gametypes\common::addspecialistdialog();
    function_e88d9ec1d5270bad();
    level.bots_gametype_handles_class_choice = 1;
    game["dialog"]["gametype"] = "gametype_aon";
    game["dialog"]["ffa_lead_first"] = "iw9_mffa_mode_uktl_ffp1";
    game["dialog"]["ffa_lead_second"] = "iw9_mffa_mode_uktl_ffp2";
    game["dialog"]["ffa_lead_third"] = "iw9_mffa_mode_uktl_ffp3";
    game["dialog"]["ffa_lead_last"] = "iw9_mffa_mode_uktl_ffp3";
    game["dialog"]["offense_obj"] = "iw9_mffa_mode_uktl_bost";
    game["dialog"]["defense_obj"] = "iw9_mffa_mode_uktl_bost";
    scripts\mp\utility\spawn_event_aggregator::registeronplayerspawncallback(&onplayerspawn);
}

// Namespace aon / scripts\mp\gametypes\aon
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x976
// Size: 0x127
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

// Namespace aon / scripts\mp\gametypes\aon
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaa5
// Size: 0x1e0
function onstartgametype() {
    setclientnamemode("auto_change");
    foreach (entry in level.teamnamelist) {
        setobjectivetext(entry, %OBJECTIVES/WAR);
        if (level.splitscreen) {
            setobjectivescoretext(entry, %OBJECTIVES/WAR);
        } else {
            setobjectivescoretext(entry, %OBJECTIVES/WAR_SCORE);
        }
        setobjectivehinttext(entry, %OBJECTIVES/WAR_HINT);
    }
    if (function_bff229a11ecd1e34()) {
        scripts\mp\spawnlogic::setactivespawnlogic(#"default");
    } else {
        scripts\mp\spawnlogic::setactivespawnlogic("FreeForAll", "Crit_Default");
    }
    level.spawnmins = (0, 0, 0);
    level.spawnmaxs = (0, 0, 0);
    scripts\mp\spawnlogic::addstartspawnpoints("mp_dm_spawn_start", 1);
    scripts\mp\spawnlogic::addspawnpoints("allies", "mp_dm_spawn");
    scripts\mp\spawnlogic::addspawnpoints("allies", "mp_dm_spawn_secondary", 1, 1);
    scripts\mp\spawnlogic::addspawnpoints("axis", "mp_dm_spawn");
    scripts\mp\spawnlogic::addspawnpoints("axis", "mp_dm_spawn_secondary", 1, 1);
    spawns = scripts\mp\spawnlogic::getspawnpointarray("mp_dm_spawn");
    spawnssecondary = scripts\mp\spawnlogic::getspawnpointarray("mp_dm_spawn_secondary");
    scripts\mp\spawnlogic::registerspawnset("normal", spawns);
    scripts\mp\spawnlogic::registerspawnset("fallback", spawnssecondary);
    level.mapcenter = scripts\mp\spawnlogic::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
    setomnvar("ui_disable_killstreaks", 1);
    setomnvar("ui_disable_fieldupgrades", 1);
}

// Namespace aon / scripts\mp\gametypes\aon
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc8d
// Size: 0x163
function updategametypedvars() {
    scripts\mp\gametypes\common::updatecommongametypedvars();
    assert(isdefined(level.var_2f35cb1fb5f0d1be), "AON perks must be registered first.");
    level.var_2f35cb1fb5f0d1be[0].ref = getdvar(@"hash_51f7d7a1e73ce81d", "specialty_scavenger_plus");
    level.var_2f35cb1fb5f0d1be[0].kills = getdvarint(@"hash_7954a01f18f7ff09", 1);
    level.var_2f35cb1fb5f0d1be[1].ref = getdvar(@"hash_66e3421f64de8bb8", "specialty_hustle");
    level.var_2f35cb1fb5f0d1be[1].kills = getdvarint(@"hash_e544e1784e62977c", 1);
    level.var_2f35cb1fb5f0d1be[2].ref = getdvar(@"hash_48d22d4340bdaf5f", "specialty_grenade_expert");
    level.var_2f35cb1fb5f0d1be[2].kills = getdvarint(@"hash_b7df94ef10ab8413", 1);
    level.var_2f35cb1fb5f0d1be[3].ref = getdvar(@"hash_36cd4f12c763e1fa", "specialty_restock");
    level.var_2f35cb1fb5f0d1be[3].kills = getdvarint(@"hash_9ce4576a217f3616", 1);
}

// Namespace aon / scripts\mp\gametypes\aon
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdf8
// Size: 0xb9
function getspawnpoint() {
    spawnpoint = undefined;
    if (level.ingraceperiod) {
        spawnpoints = scripts\mp\spawnlogic::getspawnpointarray("mp_dm_spawn_start");
        if (!isdefined(level.requiresminstartspawns)) {
            assertex(spawnpoints.size != 0 || spawnpoints.size >= 8, "FFA requires at least " + 8 + " start spawns");
        }
        if (spawnpoints.size > 0) {
            spawnpoint = scripts\mp\spawnlogic::getspawnpoint_startspawn(spawnpoints, 1);
        }
        if (!isdefined(spawnpoint)) {
            spawnpoints = scripts\mp\spawnlogic::getteamspawnpoints(self.team);
            spawnpoint = scripts\mp\spawnscoring::getstartspawnpoint_freeforall(spawnpoints);
        }
    } else {
        spawnpoint = scripts\mp\spawnlogic::getspawnpoint(self, "none", "normal", "fallback");
        /#
            comparespawns(spawnpoint);
        #/
    }
    return spawnpoint;
}

/#

    // Namespace aon / scripts\mp\gametypes\aon
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xeba
    // Size: 0x17b
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
            println("<dev string:x1c>" + scriptspawnpoint.index + "<dev string:x34>" + scriptspawnpoint.totalscore);
            if (scriptspawnpoint.index == spawnpoint.index) {
                level.var_2dc7108159dc1da3++;
                iprintlnbold("<dev string:x47>" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "<dev string:x63>" + "<dev string:x6e>" + level.var_2dc7108159dc1da3 + "<dev string:x70>" + level.var_3d292942d52b104a);
            } else {
                level.var_a065445ba781ddf6++;
                iprintlnbold("<dev string:x72>" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "<dev string:x63>" + "<dev string:x6e>" + level.var_2dc7108159dc1da3 + "<dev string:x70>" + level.var_3d292942d52b104a);
            }
            return scriptspawnpoint;
        }
    }

#/

// Namespace aon / scripts\mp\gametypes\aon
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x103d
// Size: 0x40
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    scripts\mp\gametypes\common::oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
}

// Namespace aon / scripts\mp\gametypes\aon
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1085
// Size: 0x1bb
function onplayerscore(event, player, originalpoints, victim, eventinfo) {
    player scripts\mp\utility\stats::incpersstat("gamemodeScore", originalpoints);
    newscore = int(player scripts\mp\utility\stats::getpersstat("gamemodeScore"));
    player scripts\mp\persistence::statsetchild("round", "gamemodeScore", newscore);
    if (event != #"kill") {
        return 0;
    }
    if (player.var_c393133eb539cb6f < level.var_2f35cb1fb5f0d1be.size) {
        player.var_1f60935b8c07d0da++;
        unlockprogress = clamp(player.var_1f60935b8c07d0da / player.var_20b605ac2f213f6d, 0, 1);
        player setclientomnvar(level.var_2f35cb1fb5f0d1be[player.var_c393133eb539cb6f].var_b771ccc29a7c4099, unlockprogress);
        if (unlockprogress >= 1) {
            player scripts\mp\utility\perk::giveperk(level.var_2f35cb1fb5f0d1be[player.var_c393133eb539cb6f].ref);
            player setclientomnvar(level.var_2f35cb1fb5f0d1be[player.var_c393133eb539cb6f].var_9f0625676ff25429, 1);
            player.var_c393133eb539cb6f++;
            if (player.var_c393133eb539cb6f < level.var_2f35cb1fb5f0d1be.size) {
                player.var_1f60935b8c07d0da = 0;
                player.var_20b605ac2f213f6d = level.var_2f35cb1fb5f0d1be[player.var_c393133eb539cb6f].kills;
            }
        }
    }
    return scripts\mp\rank::getscoreinfovalue(#"score_increment");
}

// Namespace aon / scripts\mp\gametypes\aon
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1249
// Size: 0x86
function onplayerconnect(player) {
    player scripts\mp\class::function_a16868d4dcd81a4b();
    player.pers["gamemodeLoadout"] = level.aonloadout;
    primaryweapon = player.pers["gamemodeLoadout"]["loadoutPrimary"];
    secondaryweapon = player.pers["gamemodeLoadout"]["loadoutSecondary"];
    player loadweaponsforplayer([primaryweapon, secondaryweapon], 1);
}

// Namespace aon / scripts\mp\gametypes\aon
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x12d7
// Size: 0x44
function private onplayerspawn() {
    finalizeloadout(self);
    function_bc342804fa29fa70(self);
    self.var_1f60935b8c07d0da = 0;
    self.var_c393133eb539cb6f = 0;
    self.var_20b605ac2f213f6d = level.var_2f35cb1fb5f0d1be[0].kills;
}

// Namespace aon / scripts\mp\gametypes\aon
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1323
// Size: 0x21c
function private registerperks() {
    assertex(!isdefined(level.var_2f35cb1fb5f0d1be), "AON perks have already been registered.");
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

// Namespace aon / scripts\mp\gametypes\aon
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1547
// Size: 0x8f
function private finalizeloadout(player) {
    level endon("game_ended");
    player endon("disconnect");
    foreach (weapon in player.weaponlist) {
        if (isdefined(weapon) && !istrue(weapon.ismelee)) {
            player setweaponammoclip(weapon, 0);
            player setweaponammostock(weapon, 0);
        }
    }
}

// Namespace aon / scripts\mp\gametypes\aon
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x15de
// Size: 0x231
function private function_e88d9ec1d5270bad() {
    assertex(!isdefined(level.aonloadout), "The AON loadout has already been defined.");
    level.aonloadout = [];
    level.aonloadout["loadoutPrimary"] = "jup_jp23_me_knife_mp";
    level.aonloadout["loadoutPrimaryAttachment"] = "none";
    level.aonloadout["loadoutPrimaryAttachment2"] = "none";
    level.aonloadout["loadoutPrimaryCamo"] = "none";
    level.aonloadout["loadoutPrimaryReticle"] = "none";
    level.aonloadout["loadoutPrimaryVariantID"] = 0;
    level.aonloadout["loadoutSecondary"] = "jup_cp24_pi_glima21_mp";
    level.aonloadout["loadoutSecondaryAttachment"] = "none";
    level.aonloadout["loadoutSecondaryAttachment2"] = "none";
    level.aonloadout["loadoutSecondaryCamo"] = "none";
    level.aonloadout["loadoutSecondaryReticle"] = "none";
    level.aonloadout["loadoutSecondaryVariantID"] = 0;
    level.aonloadout["loadoutEquipmentPrimary"] = "equip_throwing_knife";
    level.aonloadout["loadoutEquipmentSecondary"] = "none";
    level.aonloadout["loadoutSuper"] = "none";
    level.aonloadout["loadoutStreakType"] = "assault";
    level.aonloadout["loadoutKillstreak1"] = "none";
    level.aonloadout["loadoutKillstreak2"] = "none";
    level.aonloadout["loadoutKillstreak3"] = "none";
    level.aonloadout["loadoutUsingSpecialist"] = 1;
    level.aonloadout["loadoutPerks"] = ["specialty_null"];
    level.aonloadout["loadoutExtraPerks"] = ["specialty_null"];
    level.aonloadout["loadoutGesture"] = "playerData";
    level.aonloadout["loadoutFieldUpgrade1"] = "none";
    level.aonloadout["loadoutFieldUpgrade2"] = "none";
}

// Namespace aon / scripts\mp\gametypes\aon
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1817
// Size: 0x190
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

