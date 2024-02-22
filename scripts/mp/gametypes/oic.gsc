// mwiii decomp prototype
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

// Namespace oic/namespace_eb402483c4e2db87
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x935
// Size: 0x238
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
    level.bypassclasschoicefunc = &namespace_d19129e4fa5d176::alwaysgamemodeclass;
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

// Namespace oic/namespace_eb402483c4e2db87
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb74
// Size: 0x3e
function waitthensetstatgroupreadonly() {
    self endon("game_ended");
    wait(1);
    if (isdefined(level.playerstats)) {
        makeplayerstatgroupreadonly("kdr");
        makeplayerstatgroupreadonly("losses");
        makeplayerstatgroupreadonly("winLoss");
    }
}

// Namespace oic/namespace_eb402483c4e2db87
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbb9
// Size: 0x15f
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

// Namespace oic/namespace_eb402483c4e2db87
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd1f
// Size: 0x2b2
function onstartgametype() {
    setclientnamemode("auto_change");
    setobjectivetext("allies", "OBJECTIVES/OIC");
    setobjectivetext("axis", "OBJECTIVES/OIC");
    if (level.splitscreen) {
        setobjectivescoretext("allies", "OBJECTIVES/OIC");
        setobjectivescoretext("axis", "OBJECTIVES/OIC");
    } else {
        setobjectivescoretext("allies", "OBJECTIVES/OIC_SCORE");
        setobjectivescoretext("axis", "OBJECTIVES/OIC_SCORE");
    }
    setobjectivehinttext("allies", "OBJECTIVES/OIC_HINT");
    setobjectivehinttext("axis", "OBJECTIVES/OIC_HINT");
    level.matchrules_oicweapon = spawnstruct();
    weapon = getmatchrulesdata("oicData", "weapon");
    level.matchrules_oicweapon.mpweapon = weaponassetnamemap(weapon);
    level.matchrules_oicweapon.weapon = weapon;
    level.matchrules_oicweapon.oicvariantid = 0;
    setgun();
    setspecialloadouts();
    if (function_bff229a11ecd1e34()) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"default");
    } else {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("FreeForAll", "Crit_Default");
    }
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_dm_spawn_start", 1);
    namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_dm_spawn");
    namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_dm_spawn_secondary", 1, 1);
    namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_dm_spawn");
    namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_dm_spawn_secondary", 1, 1);
    spawns = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_dm_spawn");
    var_3a5288f40c8be099 = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_dm_spawn_secondary");
    namespace_b2d5aa2baf2b5701::registerspawnset("dm", spawns);
    namespace_b2d5aa2baf2b5701::registerspawnset("dm_fallback", var_3a5288f40c8be099);
    level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
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

// Namespace oic/namespace_eb402483c4e2db87
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfd8
// Size: 0xa
function updategametypedvars() {
    namespace_310ba947928891df::updatecommongametypedvars();
}

// Namespace oic/namespace_eb402483c4e2db87
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfe9
// Size: 0x7e
function onplayerconnect() {
    for (;;) {
        player = level waittill("connected");
        player namespace_d19129e4fa5d176::function_a16868d4dcd81a4b();
        player.pers["gamemodeLoadout"] = level.oic_loadouts["axis"];
        player loadweaponsforplayer([0:level.matchrules_oicweapon.mpweapon], 1);
        player.oic_firstspawn = 1;
        player.oic_hasspawned = 0;
    }
}

// Namespace oic/namespace_eb402483c4e2db87
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x106e
// Size: 0xba
function getspawnpoint() {
    if (self.oic_firstspawn) {
        thread movelatejoinerstospectators();
    }
    if (level.ingraceperiod) {
        spawnpoint = undefined;
        spawnpoints = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_dm_spawn_start");
        if (spawnpoints.size > 0) {
            if (!isdefined(level.requiresminstartspawns)) {
                /#
                    assertex(spawnpoints.size >= 8, "Gun Game requires at least " + 8 + " start spawns");
                #/
            }
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint_startspawn(spawnpoints, 1);
        }
        if (!isdefined(spawnpoint)) {
            spawnpoints = namespace_b2d5aa2baf2b5701::getteamspawnpoints(self.team);
            spawnpoint = namespace_90f75d3fdf89a43e::getstartspawnpoint_freeforall(spawnpoints);
        }
        return spawnpoint;
    }
    spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, "none", "dm", "dm_fallback");
    return spawnpoint;
}

// Namespace oic/namespace_eb402483c4e2db87
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1130
// Size: 0x4c
function movelatejoinerstospectators() {
    level endon("game_ended");
    self endon("disconnect");
    gameflagwait("prematch_done");
    gameflagwait("graceperiod_done");
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(5);
    if (!self.oic_hasspawned) {
        namespace_e5ed2f5a5ee8410e::addtoteam("spectator", 1);
    }
}

// Namespace oic/namespace_eb402483c4e2db87
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1183
// Size: 0x65
function onspawnplayer(var_9156b53bcf7ce573) {
    namespace_310ba947928891df::onspawnplayercommon(var_9156b53bcf7ce573);
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

// Namespace oic/namespace_eb402483c4e2db87
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11ef
// Size: 0x1e9
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
    var_f968c960c23738e6 = namespace_d325722f2754c2c4::function_eeaa22f0cd1ff845("iw9_knifestab_mp");
    self giveweapon(var_f968c960c23738e6);
    self assignweaponmeleeslot(var_f968c960c23738e6);
    self.oic_hasspawned = 1;
    self setclientomnvar("ui_oic_lives", self.pers["lives"] + 1);
}

// Namespace oic/namespace_eb402483c4e2db87
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13df
// Size: 0x66
function playernumlivesvo() {
    numlives = self.pers["lives"];
    if (numlives == 1) {
        namespace_944ddf7b8df1b0e3::leaderdialogonplayer("oic_lives_two");
    } else if (numlives == 0) {
        dialog = ter_op(randomint(100) < 30, "oic_lives_last_alt", "oic_lives_last");
        namespace_944ddf7b8df1b0e3::leaderdialogonplayer(dialog);
    }
}

// Namespace oic/namespace_eb402483c4e2db87
// Params 12, eflags: 0x0
// Checksum 0x0, Offset: 0x144c
// Size: 0x107
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

// Namespace oic/namespace_eb402483c4e2db87
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x155b
// Size: 0xac
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    namespace_310ba947928891df::oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
    level.timesincelastdeath = gettime();
    if (attacker.pers["cur_kill_streak"] > attacker getpersstat("killChains")) {
        attacker.pers["killChains"] = attacker.pers["cur_kill_streak"];
        attacker setextrascore1(attacker.pers["cur_kill_streak"]);
    }
}

// Namespace oic/namespace_eb402483c4e2db87
// Params a, eflags: 0x0
// Checksum 0x0, Offset: 0x160e
// Size: 0x25d
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, lifeid) {
    if (isdefined(attacker) && isplayer(attacker) && self != attacker) {
        if (isdefined(smeansofdeath) && smeansofdeath == "MOD_EXECUTION") {
            attacker.oic_rewardammo = attacker.oic_rewardammo + level.matchrules_rewardammo + 2;
        } else {
            attacker.oic_rewardammo = attacker.oic_rewardammo + level.matchrules_rewardammo;
        }
        attacker giveammo();
        if (getgametypenumlives() && self.pers["deaths"] == getgametypenumlives()) {
            eliminateplayer(attacker);
        }
        if (smeansofdeath == "MOD_MELEE") {
            attacker incpersstat("stabs", 1);
            attacker namespace_2685ec368e022695::statsetchild("round", "stabs", attacker.pers["stabs"]);
            if (isplayer(attacker)) {
                attacker setextrascore0(attacker.pers["stabs"]);
            }
        }
        if (matchmakinggame()) {
            foreach (player in level.players) {
                if (isdefined(player.sessionstate) && (player.sessionstate == "spectator" || player.sessionstate == "spectating")) {
                    var_13c5603d4beea2fc = player getspectatingplayer();
                    if (isdefined(var_13c5603d4beea2fc) && isdefined(attacker) && var_13c5603d4beea2fc == attacker) {
                        player playlocalsound("mp_bodycount_tick_positive");
                        points = namespace_62c556437da28f50::getscoreinfovalue(#"hash_764e78bd2752d4b5");
                        player thread namespace_62c556437da28f50::giverankxp(#"hash_764e78bd2752d4b5", points);
                        player setclientomnvar("ui_oic_wager", gettime());
                    }
                }
            }
        }
    }
}

// Namespace oic/namespace_eb402483c4e2db87
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1872
// Size: 0x110
function onplayerscore(event, player, originalpoints, victim, var_7ec7671a1e0c788f) {
    player namespace_3c5a4254f2b957ea::incpersstat("gamemodeScore", originalpoints);
    newscore = int(player namespace_3c5a4254f2b957ea::getpersstat("gamemodeScore"));
    player namespace_2685ec368e022695::statsetchild("round", "gamemodeScore", newscore);
    if (isdefined(var_7ec7671a1e0c788f)) {
        if (istrue(var_7ec7671a1e0c788f.var_e0badec2b1517ca3)) {
            return 0;
        }
        if (istrue(var_7ec7671a1e0c788f.var_3a13c58c2a354968)) {
            return 0;
        }
    }
    if (event == #"kill" || event == #"hash_49ee3d646e1fd20f") {
        var_cc7886247a15dfdf = namespace_62c556437da28f50::getscoreinfovalue(#"hash_cade9c820001f3bf");
        /#
            assertex(isdefined(var_cc7886247a15dfdf), "No score info value for event "score_increment"");
        #/
        return var_cc7886247a15dfdf;
    } else if (event == #"assist_ffa") {
        player namespace_9c840bb9f2ecbf00::bufferednotify("earned_score_buffered", originalpoints);
    } else if (event == #"survivor") {
        return originalpoints;
    }
    return 0;
}

// Namespace oic/namespace_eb402483c4e2db87
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x198a
// Size: 0x39
function onsuicidedeath(victim) {
    if (getgametypenumlives() && victim.pers["deaths"] == getgametypenumlives()) {
        victim eliminateplayer();
    }
}

// Namespace oic/namespace_eb402483c4e2db87
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19ca
// Size: 0x66
function ononeleftevent(team) {
    lastplayer = getlastlivingplayer();
    logstring("last one alive, win: " + lastplayer.name);
    level.finalkillcam_winner = "none";
    level thread function_5eb4dacf5fbd3485(lastplayer, game["end_reason"]["enemies_eliminated"], game["end_reason"]["br_eliminated"]);
}

// Namespace oic/namespace_eb402483c4e2db87
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x1a37
// Size: 0x42
function private function_5eb4dacf5fbd3485(winner, endreasontext, var_656b99fc50e799ae, nukedetonated, var_8e4a26ed257a393b) {
    level endon("game_ended");
    waitframe();
    level thread namespace_d576b6dc7cef9c62::endgame(winner, endreasontext, var_656b99fc50e799ae, nukedetonated, var_8e4a26ed257a393b);
}

// Namespace oic/namespace_eb402483c4e2db87
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a80
// Size: 0x16e
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
            var_dbf0bedc278c4c0 = self getweaponammoclip(currentweapon, "left");
            self setweaponammoclip(currentweapon, stockammo + var_dbf0bedc278c4c0 + self.oic_rewardammo - clipsize, "left");
        }
    } else {
        self setweaponammoclip(currentweapon, clipammo + self.oic_rewardammo);
        if (isdefined(self.primaryweapons[0]) && self.primaryweapons[0].isdualwield) {
            var_dbf0bedc278c4c0 = self getweaponammoclip(currentweapon, "left");
            self setweaponammoclip(currentweapon, var_dbf0bedc278c4c0 + self.oic_rewardammo, "left");
        }
    }
    self playlocalsound("br_pickup_ammo");
    self.oic_rewardammo = 0;
}

// Namespace oic/namespace_eb402483c4e2db87
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1bf5
// Size: 0x178
function eliminateplayer(attacker) {
    thread namespace_44abc05161e2e2cb::showsplash("out_of_lives");
    thread teamplayercardsplash("callout_eliminated", self);
    if (isdefined(attacker)) {
        attacker thread namespace_44abc05161e2e2cb::showsplash("target_eliminated");
        attacker thread namespace_391de535501b0143::killeventtextpopup(#"target_eliminated", 0);
    }
    remainingplayers = [];
    foreach (player in level.players) {
        if (player.pers["deaths"] < getgametypenumlives() && player.oic_hasspawned) {
            remainingplayers[remainingplayers.size] = player;
            player namespace_48a08c5037514e04::doscoreevent(#"survivor");
        }
    }
    if (remainingplayers.size > 2) {
        playsoundonplayers("iw9_mp_oitc_eliminate_player");
    } else if (remainingplayers.size == 2) {
        thread namespace_3bde6869e44a2770::stopsuspensemusic();
        playsoundonplayers("iw9_mp_oitc_last_players");
        setmusicstate("mp_timesup_general");
        level thread namespace_52f6938dd902c7d0::teamplayercardsplash("callout_lastenemyalive", remainingplayers[0], remainingplayers[1].team);
        level thread namespace_52f6938dd902c7d0::teamplayercardsplash("callout_lastenemyalive", remainingplayers[1], remainingplayers[0].team);
    }
    namespace_944ddf7b8df1b0e3::leaderdialogonplayers("oic_enemy_eliminated", level.players);
}

// Namespace oic/namespace_eb402483c4e2db87
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d74
// Size: 0x8f
function playerwager(dowait) {
    level endon("game_ended");
    self endon("disconnect");
    while (namespace_7e17181d03156026::isinkillcam()) {
        waitframe();
    }
    self notifyonplayercommand("selected_player", "+usereload");
    self notifyonplayercommand("selected_player", "+activate");
    while (1) {
        self waittill("selected_player");
        player = self getspectatingplayer();
        if (isdefined(player)) {
            self.wagingplayer = player.name;
            self playlocalsound("recondrone_tag_plr");
        }
    }
}

// Namespace oic/namespace_eb402483c4e2db87
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e0a
// Size: 0x153
function finalthreeuav() {
    level endon("game_ended");
    gameflagwait("prematch_done");
    gameflagwait("graceperiod_done");
    var_d643b02a0f8a1cba = undefined;
    if (matchmakinggame()) {
        var_d643b02a0f8a1cba = getdvarint(@"hash_7f1035b67920ce04", 5);
    }
    while (1) {
        var_fa666ec667543b59 = [];
        foreach (player in level.players) {
            if (player.pers["deaths"] < getgametypenumlives() && player.oic_hasspawned) {
                var_fa666ec667543b59[var_fa666ec667543b59.size] = player;
            }
        }
        if (var_fa666ec667543b59.size < 4) {
            level notify("end_one_off_sweeps");
            foreach (player in level.players) {
                if (isreallyalive(player)) {
                    triggeroneoffradarsweep(player);
                }
            }
            wait(ter_op(isdefined(var_d643b02a0f8a1cba), var_d643b02a0f8a1cba, 5));
        }
        wait(0.5);
    }
}

// Namespace oic/namespace_eb402483c4e2db87
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f64
// Size: 0x124
function oneoffuavsweeps() {
    level endon("game_ended");
    level endon("end_one_off_sweeps");
    gameflagwait("prematch_done");
    level.timesincelastdeath = gettime();
    var_78d5d35856b8fcc = undefined;
    var_fa9ece409c7cb6f = undefined;
    if (matchmakinggame()) {
        var_78d5d35856b8fcc = getdvarint(@"hash_df2b2c6f95fd821c", 15);
        var_fa9ece409c7cb6f = getdvarint(@"hash_ed1f8a6aec967a91", 5);
    }
    var_ffbb4ab56e0fc823 = ter_op(isdefined(var_78d5d35856b8fcc), var_78d5d35856b8fcc, 30);
    var_ffbb4ab56e0fc823 = var_ffbb4ab56e0fc823 * 1000;
    var_b0b479e267e5ecf9 = ter_op(isdefined(var_fa9ece409c7cb6f), var_fa9ece409c7cb6f, 15);
    while (1) {
        if (gettime() > level.timesincelastdeath + var_ffbb4ab56e0fc823) {
            foreach (player in level.players) {
                if (isreallyalive(player)) {
                    triggeroneoffradarsweep(player);
                }
            }
            wait(var_b0b479e267e5ecf9);
        }
        wait(1);
    }
}

// Namespace oic/namespace_eb402483c4e2db87
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x208f
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

// Namespace oic/namespace_eb402483c4e2db87
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x213a
// Size: 0x113
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

// Namespace oic/namespace_eb402483c4e2db87
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2255
// Size: 0x111
function function_8f08d343c26d5683() {
    level.weaponcategories = [];
    for (row = 0; 1; row++) {
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

// Namespace oic/namespace_eb402483c4e2db87
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x236d
// Size: 0x13e
function function_dabbfbbd80941f29(categoryname) {
    selectedweapons = [];
    weaponlist = level.weaponcategories[categoryname];
    if (isdefined(weaponlist) && weaponlist.size > 0) {
        newweapon = "";
        data = undefined;
        for (loopcount = 0; 1; loopcount++) {
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
    } else {
        /#
            assertmsg("Unknown weapon category name " + categoryname);
        #/
        return "none";
    }
}

// Namespace oic/namespace_eb402483c4e2db87
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24b2
// Size: 0x2c5
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
    level.aon_loadouts["allies"]["loadoutPerks"] = [0:"specialty_hustle"];
    level.oic_loadouts["allies"]["loadoutGesture"] = "playerData";
    level.oic_loadouts["allies"]["loadoutFieldUpgrade1"] = "super_deadsilence";
    level.oic_loadouts["allies"]["loadoutFieldUpgrade2"] = "none";
    level.oic_loadouts["axis"] = level.oic_loadouts["allies"];
}

// Namespace oic/namespace_eb402483c4e2db87
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x277e
// Size: 0xd1
function getrandomkeyfromweaponweightsarray(arr) {
    var_4094287ff08e6d28 = [];
    var_6fb7daf6138d07d0 = [];
    maxval = 0;
    foreach (key, weight in arr) {
        if (weight > 0) {
            maxval = maxval + weight;
            var_4094287ff08e6d28[var_4094287ff08e6d28.size] = key;
            var_6fb7daf6138d07d0[var_6fb7daf6138d07d0.size] = maxval;
        }
    }
    randint = randomint(maxval);
    key = undefined;
    for (i = 0; i < var_4094287ff08e6d28.size; i++) {
        maxval = var_6fb7daf6138d07d0[i];
        if (randint < maxval) {
            key = var_4094287ff08e6d28[i];
            break;
        }
    }
    return key;
}

