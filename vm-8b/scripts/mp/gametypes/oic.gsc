#using scripts\mp\hud_util.gsc;
#using scripts\mp\class.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\utility\sound.gsc;
#using scripts\mp\flags.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\playerstats_interface.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\spawnscoring.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\menus.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\events.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\music_and_dialog.gsc;

#namespace oic;

// Namespace oic / scripts\mp\gametypes\oic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa65
// Size: 0x238
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
        registertimelimitdvar(level.gametype, 10);
        registerscorelimitdvar(level.gametype, 0);
        registerroundlimitdvar(level.gametype, 1);
        registerwinlimitdvar(level.gametype, 1);
        registernumlivesdvar(level.gametype, 3);
        registerhalftimedvar(level.gametype, 0);
        level.matchrules_oneshotkill = 1;
        level.matchrules_initialammo = 1;
        level.matchrules_rewardammo = 1;
    }
    updategametypedvars();
    setteammode("ffa");
    level.ignorekdrstats = 1;
    level.teambased = 0;
    thread waitthensetstatgroupreadonly();
    level.onstartgametype = &onstartgametype;
    level.onspawnplayer = &onspawnplayer;
    level.getspawnpoint = &getspawnpoint;
    level.onnormaldeath = &onnormaldeath;
    level.onplayerkilled = &onplayerkilled;
    level.ononeleftevent = &ononeleftevent;
    level.modeonsuicidedeath = &onsuicidedeath;
    level.onplayerscore = &onplayerscore;
    level.bypassclasschoicefunc = &scripts\mp\class::alwaysgamemodeclass;
    level.modifyplayerdamage = &modifyplayerdamage;
    game["dialog"]["gametype"] = "gametype_oic";
    game["dialog"]["boost"] = "boost_oic";
    game["dialog"]["offense_obj"] = "boost_oic";
    game["dialog"]["defense_obj"] = "boost_oic";
    game["dialog"]["oic_enemy_eliminated"] = "oic_elimination";
    game["dialog"]["oic_lives_two"] = "oic_lives_two";
    game["dialog"]["oic_lives_last"] = "oic_lives_last";
    game["dialog"]["oic_lives_last_alt"] = "oic_dead";
}

// Namespace oic / scripts\mp\gametypes\oic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xca5
// Size: 0x3d
function waitthensetstatgroupreadonly() {
    self endon("game_ended");
    wait 1;
    if (isdefined(level.playerstats)) {
        makeplayerstatgroupreadonly("kdr");
        makeplayerstatgroupreadonly("losses");
        makeplayerstatgroupreadonly("winLoss");
    }
}

// Namespace oic / scripts\mp\gametypes\oic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcea
// Size: 0x15e
function initializematchrules() {
    setcommonrulesfrommatchrulesdata(1);
    level.matchrules_initialammo = getmatchrulesdata("oicData", "initialAmmoCount");
    level.matchrules_rewardammo = getmatchrulesdata("oicData", "killRewardAmmoCount");
    level.matchrules_oneshotkill = getmatchrulesdata("oicData", "oneShotKill");
    level.var_4adbbbc6d67b6e9 = getmatchrulesdata("oicData", "pistolWeight");
    level.var_25387041e13266f = getmatchrulesdata("oicData", "smgWeight");
    level.var_18d7344680332a65 = getmatchrulesdata("oicData", "assaultWeight");
    level.var_c86c66435f4fd292 = getmatchrulesdata("oicData", "lmgWeight");
    level.var_83a4db0ddee26e01 = getmatchrulesdata("oicData", "sniperWeight");
    level.var_a72c3b537e759691 = getmatchrulesdata("oicData", "weaponsTable");
    if (level.var_a72c3b537e759691 == "") {
        level.var_a72c3b537e759691 = "mp/gunGameWeapons.csv";
    }
    level.var_4886a13cde5ccc2e = 0;
    if (level.var_4adbbbc6d67b6e9 + level.var_25387041e13266f + level.var_18d7344680332a65 + level.var_c86c66435f4fd292 + level.var_83a4db0ddee26e01 != 0) {
        level.var_4886a13cde5ccc2e = 1;
    }
    setdynamicdvar(@"hash_fe700867cf5c7fef", 0);
}

// Namespace oic / scripts\mp\gametypes\oic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe50
// Size: 0x2b0
function onstartgametype() {
    setclientnamemode("auto_change");
    setobjectivetext("allies", %OBJECTIVES/OIC);
    setobjectivetext("axis", %OBJECTIVES/OIC);
    if (level.splitscreen) {
        setobjectivescoretext("allies", %OBJECTIVES/OIC);
        setobjectivescoretext("axis", %OBJECTIVES/OIC);
    } else {
        setobjectivescoretext("allies", %OBJECTIVES/OIC_SCORE);
        setobjectivescoretext("axis", %OBJECTIVES/OIC_SCORE);
    }
    setobjectivehinttext("allies", %OBJECTIVES/OIC_HINT);
    setobjectivehinttext("axis", %OBJECTIVES/OIC_HINT);
    level.matchrules_oicweapon = spawnstruct();
    weapon = getmatchrulesdata("oicData", "weapon");
    level.matchrules_oicweapon.mpweapon = weaponassetnamemap(weapon);
    level.matchrules_oicweapon.weapon = weapon;
    level.matchrules_oicweapon.oicvariantid = 0;
    setgun();
    setspecialloadouts();
    if (function_bff229a11ecd1e34()) {
        scripts\mp\spawnlogic::setactivespawnlogic(#"default");
    } else {
        scripts\mp\spawnlogic::setactivespawnlogic("FreeForAll", "Crit_Default");
    }
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    scripts\mp\spawnlogic::addstartspawnpoints("mp_dm_spawn_start", 1);
    scripts\mp\spawnlogic::addspawnpoints("allies", "mp_dm_spawn");
    scripts\mp\spawnlogic::addspawnpoints("allies", "mp_dm_spawn_secondary", 1, 1);
    scripts\mp\spawnlogic::addspawnpoints("axis", "mp_dm_spawn");
    scripts\mp\spawnlogic::addspawnpoints("axis", "mp_dm_spawn_secondary", 1, 1);
    spawns = scripts\mp\spawnlogic::getspawnpointarray("mp_dm_spawn");
    spawnssecondary = scripts\mp\spawnlogic::getspawnpointarray("mp_dm_spawn_secondary");
    scripts\mp\spawnlogic::registerspawnset("dm", spawns);
    scripts\mp\spawnlogic::registerspawnset("dm_fallback", spawnssecondary);
    level.mapcenter = scripts\mp\spawnlogic::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
    level.blockweapondrops = 1;
    if (isdefined(level.modifyplayerdamage) && level.modifyplayerdamage != &modifyplayerdamage) {
        level.var_52e8799c139f7b89 = level.modifyplayerdamage;
        level.modifyplayerdamage = &modifyplayerdamage;
    }
    level thread oneoffuavsweeps();
    level thread finalthreeuav();
    level thread onplayerconnect();
}

// Namespace oic / scripts\mp\gametypes\oic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1108
// Size: 0x9
function updategametypedvars() {
    scripts\mp\gametypes\common::updatecommongametypedvars();
}

// Namespace oic / scripts\mp\gametypes\oic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1119
// Size: 0x141
function onplayerconnect() {
    for (;;) {
        player = level waittill("connected");
        player scripts\mp\class::function_a16868d4dcd81a4b();
        player.pers["gamemodeLoadout"] = level.oic_loadouts["axis"];
        player loadweaponsforplayer([level.matchrules_oicweapon.mpweapon], 1);
        player.oic_firstspawn = 1;
        player.oic_hasspawned = 0;
        if (isdefined(player.joinedinprogress) && player.joinedinprogress == 1) {
            eliminatedWhileAlive = 0;
            foreach (var_f7651b6d5fbc7ed9 in level.players) {
                if (var_f7651b6d5fbc7ed9.eliminatedWhileAlive > eliminatedWhileAlive) {
                    eliminatedWhileAlive = var_f7651b6d5fbc7ed9.eliminatedWhileAlive;
                }
            }
            player.eliminatedWhileAlive = eliminatedWhileAlive;
        } else {
            player.eliminatedWhileAlive = 0;
        }
        player scripts\mp\utility\stats::setextrascore3(player.eliminatedWhileAlive);
    }
}

// Namespace oic / scripts\mp\gametypes\oic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1262
// Size: 0xb9
function getspawnpoint() {
    if (self.oic_firstspawn) {
        thread movelatejoinerstospectators();
    }
    if (level.ingraceperiod) {
        spawnpoint = undefined;
        spawnpoints = scripts\mp\spawnlogic::getspawnpointarray("mp_dm_spawn_start");
        if (spawnpoints.size > 0) {
            if (!isdefined(level.requiresminstartspawns)) {
                assertex(spawnpoints.size >= 8, "<dev string:x1c>" + 8 + "<dev string:x3b>");
            }
            spawnpoint = scripts\mp\spawnlogic::getspawnpoint_startspawn(spawnpoints, 1);
        }
        if (!isdefined(spawnpoint)) {
            spawnpoints = scripts\mp\spawnlogic::getteamspawnpoints(self.team);
            spawnpoint = scripts\mp\spawnscoring::getstartspawnpoint_freeforall(spawnpoints);
        }
        return spawnpoint;
    }
    spawnpoint = scripts\mp\spawnlogic::getspawnpoint(self, "none", "dm", "dm_fallback");
    return spawnpoint;
}

// Namespace oic / scripts\mp\gametypes\oic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1324
// Size: 0x4b
function movelatejoinerstospectators() {
    level endon("game_ended");
    self endon("disconnect");
    gameflagwait("prematch_done");
    gameflagwait("graceperiod_done");
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause(5);
    if (!self.oic_hasspawned) {
        scripts\mp\menus::addtoteam("spectator", 1);
    }
}

// Namespace oic / scripts\mp\gametypes\oic
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1377
// Size: 0x64
function onspawnplayer(revivespawn) {
    scripts\mp\gametypes\common::onspawnplayercommon(revivespawn);
    if (isdefined(self.oic_rewardammo) && self.oic_rewardammo) {
        giveammo();
    } else {
        self.oic_rewardammo = 0;
    }
    thread waitloadoutdone();
    level notify("spawned_player");
    if (getgametypenumlives() != 0) {
        thread playernumlivesvo();
    }
}

// Namespace oic / scripts\mp\gametypes\oic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13e3
// Size: 0x1e6
function waitloadoutdone() {
    level endon("game_ended");
    self endon("disconnect");
    self waittill("spawned_player");
    clipsize = weaponclipsize(self.primaryweapon);
    if (level.matchrules_initialammo > clipsize) {
        self setweaponammoclip(self.primaryweapon, clipsize);
        self setweaponammostock(self.primaryweapon, level.matchrules_initialammo - clipsize);
        if (self.primaryweapons[0].isdualwield) {
            self setweaponammoclip(self.primaryweapon, level.matchrules_initialammo - clipsize, "left");
        }
    } else {
        self setweaponammoclip(self.primaryweapon, level.matchrules_initialammo);
        self setweaponammostock(self.primaryweapon, 0);
        if (self.primaryweapons[0].isdualwield) {
            self setweaponammoclip(self.primaryweapon, level.matchrules_initialammo, "left");
        }
    }
    burstcount = weaponburstcount(self.primaryweaponobj);
    if (burstcount > 1) {
        if (issubstr(self.primaryweaponobj.underbarrel, "selectsemi") || issubstr(self.primaryweaponobj.underbarrel, "selectauto")) {
            altweapon = self.primaryweaponobj getaltweapon();
            if (isdefined(altweapon)) {
                self switchtoweaponimmediate(altweapon);
            }
        }
    }
    takeweaponwhensafe("iw9_me_fists_mp");
    knifeweapon = scripts\cp_mp\utility\weapon_utility::function_eeaa22f0cd1ff845("iw9_knifestab_mp");
    self giveweapon(knifeweapon);
    self assignweaponmeleeslot(knifeweapon);
    self.oic_hasspawned = 1;
    self setclientomnvar("ui_oic_lives", self.pers["lives"] + 1);
}

// Namespace oic / scripts\mp\gametypes\oic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15d1
// Size: 0x65
function playernumlivesvo() {
    numlives = self.pers["lives"];
    if (numlives == 1) {
        scripts\mp\utility\dialog::leaderdialogonplayer("oic_lives_two");
        return;
    }
    if (numlives == 0) {
        dialog = ter_op(randomint(100) < 30, "oic_lives_last_alt", "oic_lives_last");
        scripts\mp\utility\dialog::leaderdialogonplayer(dialog);
    }
}

// Namespace oic / scripts\mp\gametypes\oic
// Params 12, eflags: 0x0
// Checksum 0x0, Offset: 0x163e
// Size: 0x106
function modifyplayerdamage(einflictor, victim, eattacker, idamage, smeansofdeath, objweapon, vpoint, vdir, shitloc, idflags, var_be4285b26ed99ab1, var_1da1a66b5c6a06a7) {
    if (isdefined(level.var_52e8799c139f7b89)) {
        idamage = int([[ level.var_52e8799c139f7b89 ]](einflictor, victim, eattacker, idamage, smeansofdeath, objweapon, vpoint, vdir, shitloc, idflags, var_be4285b26ed99ab1));
    }
    switch (smeansofdeath) {
    case #"hash_590bdb04e515167b":
    case #"hash_5f1054c48d66fd1c":
    case #"hash_966768b3f0c94767": 
        if (istrue(level.matchrules_oneshotkill)) {
            return victim.maxhealth;
        }
        break;
    case #"hash_a5123f4d02745600": 
        return victim.maxhealth;
    default: 
        break;
    }
    return idamage;
}

// Namespace oic / scripts\mp\gametypes\oic
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x174d
// Size: 0xab
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    scripts\mp\gametypes\common::oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
    level.timesincelastdeath = gettime();
    if (attacker.pers["cur_kill_streak"] > attacker getpersstat("killChains")) {
        attacker.pers["killChains"] = attacker.pers["cur_kill_streak"];
        attacker setextrascore1(attacker.pers["cur_kill_streak"]);
    }
}

// Namespace oic / scripts\mp\gametypes\oic
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x1800
// Size: 0x27f
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, lifeid) {
    if (isdefined(attacker) && isplayer(attacker) && self != attacker) {
        if (isdefined(smeansofdeath) && smeansofdeath == "MOD_EXECUTION") {
            attacker.oic_rewardammo += level.matchrules_rewardammo + 2;
        } else {
            attacker.oic_rewardammo += level.matchrules_rewardammo;
        }
        attacker giveammo();
        if (getgametypenumlives() && self.pers["deaths"] == getgametypenumlives()) {
            eliminateplayer(attacker);
        }
        if (smeansofdeath == "MOD_MELEE") {
            attacker incpersstat("stabs", 1);
            attacker scripts\mp\persistence::statsetchild("round", "stabs", attacker.pers["stabs"]);
            if (isplayer(attacker)) {
                attacker setextrascore0(attacker.pers["stabs"]);
            }
        }
        if (matchmakinggame()) {
            foreach (player in level.players) {
                if (isdefined(player.sessionstate) && (player.sessionstate == "spectator" || player.sessionstate == "spectating")) {
                    spectatingplayer = player getspectatingplayer();
                    if (isdefined(spectatingplayer) && isdefined(attacker) && spectatingplayer == attacker) {
                        player playlocalsound("mp_bodycount_tick_positive");
                        points = scripts\mp\rank::getscoreinfovalue(#"kill_bonus");
                        player thread scripts\mp\rank::giverankxp(#"kill_bonus", points);
                        player setclientomnvar("ui_oic_wager", gettime());
                    }
                }
            }
        }
        streak = attacker getpersstat("killChains");
        if (isdefined(streak)) {
            attacker setextrascore2(streak);
        }
    }
}

// Namespace oic / scripts\mp\gametypes\oic
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1a87
// Size: 0x16c
function onplayerscore(event, player, originalpoints, victim, eventinfo) {
    player scripts\mp\utility\stats::incpersstat("gamemodeScore", originalpoints);
    newscore = int(player scripts\mp\utility\stats::getpersstat("gamemodeScore"));
    player scripts\mp\persistence::statsetchild("round", "gamemodeScore", newscore);
    if (player.pers["cur_kill_streak"] > player getpersstat("killChains")) {
        player.pers["killChains"] = player.pers["cur_kill_streak"];
        player setextrascore2(player.pers["cur_kill_streak"]);
    }
    if (isdefined(eventinfo)) {
        if (istrue(eventinfo.iskillstreakkill)) {
            return 0;
        }
        if (istrue(eventinfo.var_3a13c58c2a354968)) {
            return 0;
        }
    }
    if (event == #"kill" || event == #"elimination_kill") {
        adjustedscore = scripts\mp\rank::getscoreinfovalue(#"score_increment");
        assertex(isdefined(adjustedscore), "<dev string:x4c>");
        return adjustedscore;
    } else if (event == #"assist_ffa") {
        player scripts\mp\utility\script::bufferednotify("earned_score_buffered", originalpoints);
    } else if (event == #"survivor") {
        return originalpoints;
    }
    return 0;
}

// Namespace oic / scripts\mp\gametypes\oic
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1bfc
// Size: 0x38
function onsuicidedeath(victim) {
    if (getgametypenumlives() && victim.pers["deaths"] == getgametypenumlives()) {
        victim eliminateplayer();
    }
}

// Namespace oic / scripts\mp\gametypes\oic
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c3c
// Size: 0x73
function ononeleftevent(team) {
    level.lastplayerwins = getlastlivingplayer();
    logstring("last one alive, win: " + level.lastplayerwins.name);
    level.finalkillcam_winner = "none";
    level thread function_5eb4dacf5fbd3485(level.lastplayerwins, game["end_reason"]["enemies_eliminated"], game["end_reason"]["br_eliminated"]);
}

// Namespace oic / scripts\mp\gametypes\oic
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x1cb7
// Size: 0x41
function private function_5eb4dacf5fbd3485(winner, endreasontext, endreasontextloss, nukedetonated, var_8e4a26ed257a393b) {
    level endon("game_ended");
    waitframe();
    level thread scripts\mp\gamelogic::endgame(winner, endreasontext, endreasontextloss, nukedetonated, var_8e4a26ed257a393b);
}

// Namespace oic / scripts\mp\gametypes\oic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d00
// Size: 0x16a
function giveammo() {
    currentweapon = self.primaryweapon;
    stockammo = self getweaponammostock(currentweapon);
    clipammo = self getweaponammoclip(currentweapon);
    clipsize = weaponclipsize(currentweapon);
    if (clipsize == 1) {
        self setweaponammostock(currentweapon, stockammo + self.oic_rewardammo);
    } else if (clipammo + self.oic_rewardammo > clipsize) {
        self setweaponammoclip(currentweapon, clipsize);
        self setweaponammostock(currentweapon, stockammo + clipammo + self.oic_rewardammo - clipsize);
        if (isdefined(self.primaryweapons[0]) && self.primaryweapons[0].isdualwield) {
            clipammoleft = self getweaponammoclip(currentweapon, "left");
            self setweaponammoclip(currentweapon, stockammo + clipammoleft + self.oic_rewardammo - clipsize, "left");
        }
    } else {
        self setweaponammoclip(currentweapon, clipammo + self.oic_rewardammo);
        if (isdefined(self.primaryweapons[0]) && self.primaryweapons[0].isdualwield) {
            clipammoleft = self getweaponammoclip(currentweapon, "left");
            self setweaponammoclip(currentweapon, clipammoleft + self.oic_rewardammo, "left");
        }
    }
    self playlocalsound("mp_oic_ammo_pickup");
    self.oic_rewardammo = 0;
}

// Namespace oic / scripts\mp\gametypes\oic
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e72
// Size: 0x1a2
function eliminateplayer(attacker) {
    thread scripts\mp\hud_message::showsplash("out_of_lives");
    thread teamplayercardsplash("callout_eliminated", self);
    if (isdefined(attacker)) {
        attacker thread scripts\mp\hud_message::showsplash("oic_target_eliminated");
        attacker thread scripts\mp\events::killeventtextpopup(#"target_eliminated", 0);
    }
    remainingplayers = [];
    foreach (player in level.players) {
        if (player.pers["deaths"] < getgametypenumlives() && player.oic_hasspawned) {
            remainingplayers[remainingplayers.size] = player;
            player scripts\mp\utility\points::doScoreEvent(#"survivor");
            player.eliminatedWhileAlive += 1;
            player scripts\mp\utility\stats::setextrascore3(player.eliminatedWhileAlive);
        }
    }
    if (remainingplayers.size > 2) {
        playsoundonplayers("iw9_mp_oitc_eliminate_player");
    } else if (remainingplayers.size == 2) {
        thread scripts\mp\music_and_dialog::stopsuspensemusic();
        playsoundonplayers("iw9_mp_oitc_last_players");
        setmusicstate("mp_timesup_general");
        level thread scripts\mp\hud_util::teamplayercardsplash("callout_lastenemyalive", remainingplayers[0], remainingplayers[1].team);
        level thread scripts\mp\hud_util::teamplayercardsplash("callout_lastenemyalive", remainingplayers[1], remainingplayers[0].team);
    }
    scripts\mp\utility\dialog::leaderdialogonplayers("oic_enemy_eliminated", level.players);
}

// Namespace oic / scripts\mp\gametypes\oic
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x201c
// Size: 0x8f
function playerwager(dowait) {
    level endon("game_ended");
    self endon("disconnect");
    while (scripts\mp\utility\player::isinkillcam()) {
        waitframe();
    }
    self notifyonplayercommand("selected_player", "+usereload");
    self notifyonplayercommand("selected_player", "+activate");
    while (true) {
        self waittill("selected_player");
        player = self getspectatingplayer();
        if (isdefined(player)) {
            self.wagingplayer = player.name;
            self playlocalsound("recondrone_tag_plr");
        }
    }
}

// Namespace oic / scripts\mp\gametypes\oic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20b3
// Size: 0x14d
function finalthreeuav() {
    level endon("game_ended");
    gameflagwait("prematch_done");
    gameflagwait("graceperiod_done");
    var_d643b02a0f8a1cba = undefined;
    if (matchmakinggame()) {
        var_d643b02a0f8a1cba = getdvarint(@"hash_7f1035b67920ce04", 5);
    }
    while (true) {
        numremaining = [];
        foreach (player in level.players) {
            if (player.pers["deaths"] < getgametypenumlives() && player.oic_hasspawned) {
                numremaining[numremaining.size] = player;
            }
        }
        if (numremaining.size < 4) {
            level notify("end_one_off_sweeps");
            foreach (player in level.players) {
                if (isreallyalive(player)) {
                    triggeroneoffradarsweep(player);
                }
            }
            wait ter_op(isdefined(var_d643b02a0f8a1cba), var_d643b02a0f8a1cba, 5);
        }
        wait 0.5;
    }
}

// Namespace oic / scripts\mp\gametypes\oic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2208
// Size: 0x133
function oneoffuavsweeps() {
    level endon("game_ended");
    level endon("end_one_off_sweeps");
    gameflagwait("prematch_done");
    if (getdvarint(@"hash_43fd3b58b83a1e1d", 0) == 0) {
        return;
    }
    level.timesincelastdeath = gettime();
    var_78d5d35856b8fcc = undefined;
    var_fa9ece409c7cb6f = undefined;
    if (matchmakinggame()) {
        var_78d5d35856b8fcc = getdvarint(@"hash_df2b2c6f95fd821c", 15);
        var_fa9ece409c7cb6f = getdvarint(@"hash_ed1f8a6aec967a91", 5);
    }
    var_ffbb4ab56e0fc823 = ter_op(isdefined(var_78d5d35856b8fcc), var_78d5d35856b8fcc, 30);
    var_ffbb4ab56e0fc823 *= 1000;
    var_b0b479e267e5ecf9 = ter_op(isdefined(var_fa9ece409c7cb6f), var_fa9ece409c7cb6f, 15);
    while (true) {
        if (gettime() > level.timesincelastdeath + var_ffbb4ab56e0fc823) {
            foreach (player in level.players) {
                if (isreallyalive(player)) {
                    triggeroneoffradarsweep(player);
                }
            }
            wait var_b0b479e267e5ecf9;
        }
        wait 1;
    }
}

// Namespace oic / scripts\mp\gametypes\oic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2343
// Size: 0xa4
function setgun() {
    if (level.var_4886a13cde5ccc2e) {
        weapondata = getrandomweapon();
        level.matchrules_oicweapon.weapon = weapondata["weapon"];
        level.matchrules_oicweapon.oicvariantid = weapondata["variantID"];
    }
    if (!isdefined(level.matchrules_oicweapon.weapon) || level.matchrules_oicweapon.weapon == "none") {
        level.matchrules_oicweapon.weapon = "iw9_pi_golf17";
    }
}

// Namespace oic / scripts\mp\gametypes\oic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23ef
// Size: 0x112
function getrandomweapon() {
    level.oic_guns = spawnstruct();
    level.oic_guns.weaponclassweights = [];
    level.oic_guns.weaponclassweights["rand_pistol"] = level.var_4adbbbc6d67b6e9;
    level.oic_guns.weaponclassweights["rand_smg"] = level.var_25387041e13266f;
    level.oic_guns.weaponclassweights["rand_assault"] = level.var_18d7344680332a65;
    level.oic_guns.weaponclassweights["rand_lmg"] = level.var_c86c66435f4fd292;
    level.oic_guns.weaponclassweights["rand_sniper"] = level.var_83a4db0ddee26e01;
    function_8f08d343c26d5683();
    var_b70d1952b9ab92c0 = getrandomkeyfromweaponweightsarray(level.oic_guns.weaponclassweights);
    weapondata = function_dabbfbbd80941f29(var_b70d1952b9ab92c0);
    return weapondata;
}

// Namespace oic / scripts\mp\gametypes\oic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x250a
// Size: 0x10f
function function_8f08d343c26d5683() {
    level.weaponcategories = [];
    for (row = 0; true; row++) {
        categoryname = tablelookupbyrow(level.var_a72c3b537e759691, row, 0);
        if (categoryname == "") {
            break;
        }
        if (!isdefined(level.weaponcategories[categoryname])) {
            level.weaponcategories[categoryname] = [];
        }
        data = [];
        data["weapon"] = tablelookupbyrow(level.var_a72c3b537e759691, row, 1);
        data["min"] = int(tablelookupbyrow(level.var_a72c3b537e759691, row, 2));
        data["max"] = int(tablelookupbyrow(level.var_a72c3b537e759691, row, 3));
        data["allowed"] = int(tablelookupbyrow(level.var_a72c3b537e759691, row, 8));
        if (!data["allowed"]) {
            row++;
            continue;
        }
        level.weaponcategories[categoryname][level.weaponcategories[categoryname].size] = data;
    }
}

// Namespace oic / scripts\mp\gametypes\oic
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2621
// Size: 0x137
function function_dabbfbbd80941f29(categoryname) {
    selectedweapons = [];
    weaponlist = level.weaponcategories[categoryname];
    if (isdefined(weaponlist) && weaponlist.size > 0) {
        newweapon = "";
        data = undefined;
        for (loopcount = 0; true; loopcount++) {
            index = randomintrange(0, weaponlist.size);
            data = weaponlist[index];
            rootname = getweaponrootname(data["weapon"]);
            if (!isdefined(selectedweapons[rootname]) || loopcount > weaponlist.size) {
                selectedweapons[rootname] = 1;
                for (i = 0; i < level.weaponcategories[categoryname].size; i++) {
                    if (level.weaponcategories[categoryname][i]["weapon"] == data["weapon"]) {
                        level.weaponcategories[categoryname] = array_remove_index(level.weaponcategories[categoryname], i);
                        break;
                    }
                }
                break;
            }
        }
        return data;
    }
    assertmsg("<dev string:x7f>" + categoryname);
    return "none";
}

// Namespace oic / scripts\mp\gametypes\oic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2760
// Size: 0x2c4
function setspecialloadouts() {
    level.oic_loadouts["allies"]["loadoutPrimary"] = level.matchrules_oicweapon.weapon;
    level.oic_loadouts["allies"]["loadoutPrimaryAttachment"] = "none";
    level.oic_loadouts["allies"]["loadoutPrimaryAttachment2"] = "none";
    level.oic_loadouts["allies"]["loadoutPrimaryCamo"] = "none";
    level.oic_loadouts["allies"]["loadoutPrimaryReticle"] = "none";
    level.oic_loadouts["allies"]["loadoutPrimaryAddBlueprintAttachments"] = ter_op(level.matchrules_oicweapon.oicvariantid != 0, 1, 0);
    level.oic_loadouts["allies"]["loadoutPrimaryVariantID"] = level.matchrules_oicweapon.oicvariantid;
    level.oic_loadouts["allies"]["loadoutSecondary"] = "none";
    level.oic_loadouts["allies"]["loadoutSecondaryAttachment"] = "none";
    level.oic_loadouts["allies"]["loadoutSecondaryAttachment2"] = "none";
    level.oic_loadouts["allies"]["loadoutSecondaryCamo"] = "none";
    level.oic_loadouts["allies"]["loadoutSecondaryReticle"] = "none";
    level.oic_loadouts["allies"]["loadoutSecondaryVariantID"] = 0;
    level.oic_loadouts["allies"]["loadoutEquipmentPrimary"] = "none";
    level.oic_loadouts["allies"]["loadoutEquipmentSecondary"] = "none";
    level.oic_loadouts["allies"]["loadoutStreakType"] = "assault";
    level.oic_loadouts["allies"]["loadoutKillstreak1"] = "none";
    level.oic_loadouts["allies"]["loadoutKillstreak2"] = "none";
    level.oic_loadouts["allies"]["loadoutKillstreak3"] = "none";
    level.aon_loadouts["allies"]["loadoutPerks"] = ["specialty_hustle"];
    level.oic_loadouts["allies"]["loadoutGesture"] = "playerData";
    level.oic_loadouts["allies"]["loadoutFieldUpgrade1"] = "super_deadsilence";
    level.oic_loadouts["allies"]["loadoutFieldUpgrade2"] = "none";
    level.oic_loadouts["axis"] = level.oic_loadouts["allies"];
}

// Namespace oic / scripts\mp\gametypes\oic
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a2c
// Size: 0xca
function getrandomkeyfromweaponweightsarray(arr) {
    arrkeys = [];
    var_6fb7daf6138d07d0 = [];
    maxval = 0;
    foreach (key, weight in arr) {
        if (weight > 0) {
            maxval += weight;
            arrkeys[arrkeys.size] = key;
            var_6fb7daf6138d07d0[var_6fb7daf6138d07d0.size] = maxval;
        }
    }
    randint = randomint(maxval);
    key = undefined;
    for (i = 0; i < arrkeys.size; i++) {
        maxval = var_6fb7daf6138d07d0[i];
        if (randint < maxval) {
            key = arrkeys[i];
            break;
        }
    }
    return key;
}

