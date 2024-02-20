// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\mp\class.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\playerstats_interface.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_65df1ea6c7e0b8ce;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\cp_mp\killstreaks\uav.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\spawnscoring.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\utility\sound.gsc;
#using scripts\mp\weapons.gsc;
#using script_15eddb0fac236a22;
#using scripts\mp\gametypes\arena.gsc;
#using scripts\mp\equipment.gsc;

#namespace gun;

// Namespace gun/namespace_5efc3f84199a836c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcb4
// Size: 0x317
function main() {
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    allowed = [];
    namespace_19b4203b51d56488::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registertimelimitdvar(getgametype(), 600);
        registerroundlimitdvar(getgametype(), 1);
        registerwinlimitdvar(getgametype(), 0);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
    }
    setspecialloadout();
    updategametypedvars();
    setgunladder();
    if (function_c1cddd7ae3bc2698()) {
        level.teambased = 1;
        level.ignorekdrstats = 1;
        level.disablespawncamera = 1;
        level.var_ff35df662c18a63d = getdvarint(@"hash_73aac3f6d560f91f", 10);
    } else {
        setteammode("ffa");
        level.teambased = 0;
        level.ignorekdrstats = 1;
        level.disablespawncamera = 1;
    }
    if (!function_c1cddd7ae3bc2698()) {
        level thread namespace_f1fe279354a7da2::function_6394127938ed8257(3);
    }
    thread waitthensetstatgroupreadonly();
    level.doprematch = 1;
    level.supportintel = 0;
    level.supportnuke = 0;
    level.disablecopycatloadout = 1;
    setomnvar("ui_killcam_copycat", 0);
    level.onprecachegametype = &onprecachegametype;
    level.onstartgametype = &onstartgametype;
    level.onplayerconnect = &onplayerconnect;
    level.modeonspawnplayer = &onspawnplayer;
    level.getspawnpoint = &getspawnpoint;
    level.onplayerkilled = &onplayerkilled;
    level.ontimelimit = &ontimelimit;
    level.onplayerscore = &onplayerscore;
    level.bypassclasschoicefunc = &namespace_d19129e4fa5d176::alwaysgamemodeclass;
    level.modifyunifiedpointscallback = &modifyunifiedpointscallback;
    if (function_c1cddd7ae3bc2698()) {
        level.getspawnpoint = &function_deaacd9c07dbc9fe;
        level.modifyunifiedpointscallback = undefined;
        level.onplayerscore = undefined;
        level.onplayerkilled = &function_849e633648f1596f;
        level.ontimelimit = &namespace_d576b6dc7cef9c62::default_ontimelimit;
    }
    if (namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        game["dialog"]["gametype"] = "dx_mp_gunn_game_uktl_ggt1";
    } else {
        game["dialog"]["gametype"] = "dx_mp_gunn_game_uktl_ggnm";
    }
    game["dialog"]["boost"] = "dx_mp_gunn_game_uktl_ggbo";
    game["dialog"]["offense_obj"] = "dx_mp_gunn_game_uktl_ggbo";
    game["dialog"]["defense_obj"] = "dx_mp_gunn_game_uktl_ggbo";
    game["dialog"]["lasttier_enemy"] = "dx_mp_gunn_game_uktl_ggfe";
    game["dialog"]["lasttier_friendly"] = "dx_mp_gunn_game_uktl_ggff";
    if (function_c1cddd7ae3bc2698()) {
        game["dialog"]["gametype"] = "dx_mp_mtgg_mode_t141_name";
    }
    /#
        setdevdvarifuninitialized(@"hash_131d7c69641a09e6", 0);
        setdevdvarifuninitialized(@"hash_4d0d7b8829a798cf", 0);
    #/
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfd2
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

// Namespace gun/namespace_5efc3f84199a836c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1017
// Size: 0x151
function initializematchrules() {
    setcommonrulesfrommatchrulesdata(1);
    var_29fe567a5ca5271d = getmatchrulesdata("gunData", "gunGameWeaponsTable");
    level.var_29fe567a5ca5271d = getscriptbundle(function_2ef675c13ca1c4af(%"hash_adeeae037d337c6", var_29fe567a5ca5271d));
    /#
        assertex(isdefined(level.var_29fe567a5ca5271d), "No Weapon Table Defined, check Common Data -> GunData in APE or feature includes");
    #/
    var_a07458d2aa01e093 = getmatchrulesdata("gunData", "gunGameWeaponTierList");
    if (isdefined(var_a07458d2aa01e093)) {
        level.var_9bc45da762160eb8 = getscriptbundle(function_2ef675c13ca1c4af(%"hash_586ba1c6dbd22d07", var_a07458d2aa01e093));
        /#
            assertex(isdefined(level.var_9bc45da762160eb8), "Gun Game Ladder found in gunData but unable to find script bundle name: " + var_a07458d2aa01e093);
        #/
    }
    level.var_1a933adf9d114ff4 = getmatchrulesdata("gunData", "meleeGivesScore");
    level.setback = getmatchrulesdata("gunData", "setback");
    level.setbackstreak = getmatchrulesdata("gunData", "setbackStreak");
    level.killsperweapon = getmatchrulesdata("gunData", "killsPerWeapon");
    level.ladderindex = getmatchrulesdata("gunData", "ladderIndex");
    level.useLadderIndex = getmatchrulesdata("gunData", "useLadderIndex");
    setdynamicdvar(@"hash_d35ca3409324ec94", 0);
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x116f
// Size: 0x3
function onprecachegametype() {
    
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1179
// Size: 0x11a
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
    setgunsfinal();
    if (function_c1cddd7ae3bc2698()) {
        function_4acafac11df3da39();
    } else {
        initspawns();
    }
    level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
    level.quickmessagetoall = 1;
    level.blockweapondrops = 1;
    /#
        level thread function_976d13e05a73c64e();
        level thread function_d5a7aac125289e1d();
    #/
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x129a
// Size: 0xff
function initspawns() {
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
    namespace_b2d5aa2baf2b5701::registerspawnset("normal", spawns);
    namespace_b2d5aa2baf2b5701::registerspawnset("fallback", var_3a5288f40c8be099);
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13a0
// Size: 0x285
function function_4acafac11df3da39() {
    if (getdvarint(@"hash_742caa13b3c2e685")) {
        return;
    }
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
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
    if (istrue(level.testtdmanywhere)) {
        x = getdvarfloat(@"hash_b6294c84c04e377b", randomfloatrange(-4096, 4096));
        y = getdvarfloat(@"hash_b6294b84c04e3548", randomfloatrange(-4096, 4096));
        z = getdvarfloat(@"hash_b6294e84c04e3be1", randomfloatrange(0, 512));
        level.mapcenter = (x, y, z);
    } else {
        level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
        setmapcenter(level.mapcenter);
    }
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x162c
// Size: 0xa
function updategametypedvars() {
    namespace_310ba947928891df::updatecommongametypedvars();
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x163d
// Size: 0x8e
function onplayerconnect(player) {
    player thread keepweaponsloaded();
    player namespace_d19129e4fa5d176::function_a16868d4dcd81a4b();
    player.pers["gamemodeLoadout"] = level.gun_loadouts["axis"];
    player.gungamegunindex = 0;
    player.gungameprevgunindex = 0;
    player thread refillammo();
    player thread refillsinglecountammo();
    if (function_c1cddd7ae3bc2698() && !isbot(player)) {
        player notifyonplayercommand("gun_game_next", "+weapnext");
    }
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16d2
// Size: 0xb1
function keepweaponsloaded() {
    self loadweaponsforplayer([0:level.gun_guns[0], 1:level.gun_guns[1]], 1);
    var_1942f036ef77c9a4 = [];
    while (1) {
        self waittill("update_loadweapons");
        var_1942f036ef77c9a4[0] = level.gun_guns[int(max(0, self.gungamegunindex - level.setback))];
        var_1942f036ef77c9a4[1] = level.gun_guns[self.gungamegunindex];
        var_1942f036ef77c9a4[2] = level.gun_guns[self.gungamegunindex + 1];
        self loadweaponsforplayer(var_1942f036ef77c9a4, 1);
    }
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x178a
// Size: 0xa6
function getspawnpoint() {
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
    spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, "none", "normal", "fallback");
    return spawnpoint;
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1838
// Size: 0x19c
function function_deaacd9c07dbc9fe() {
    spawnteam = self.pers["team"];
    spawnpoint = undefined;
    if (istrue(level.testtdmanywhere)) {
        var_4a31bbf837fe3389 = level.tdmanywherefrontline.anchorrt * randomfloatrange(level.tdmanywhere_perpenoffset * -1, level.tdmanywhere_perpenoffset);
        var_fc4e89bc101f9a57 = undefined;
        if (spawnteam == "axis") {
            var_fc4e89bc101f9a57 = level.tdmanywherefrontline.anchordir * level.tdmanywhere_distoffset * -1;
        } else {
            var_fc4e89bc101f9a57 = level.tdmanywherefrontline.anchordir * level.tdmanywhere_distoffset;
        }
        spawnpoint = spawnstruct();
        spawnpoint.origin = level.mapcenter + var_4a31bbf837fe3389 + var_fc4e89bc101f9a57 + (0, 0, level.tdmanywhere_dropheight);
        spawnpoint.angles = (0, 0, 0);
        spawnpoint.index = 1;
    } else if (namespace_b2d5aa2baf2b5701::shoulduseteamstartspawn()) {
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
    }
    return spawnpoint;
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19dc
// Size: 0x35
function onspawnplayer(var_9156b53bcf7ce573) {
    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("kill");
    thread waitloadoutdone();
    self setclientomnvar("show_change_weapon_prompt", 0);
    level notify("spawned_player");
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a18
// Size: 0x75
function waitloadoutdone() {
    level endon("game_ended");
    self endon("disconnect");
    self waittill("spawned_player");
    if (function_c1cddd7ae3bc2698()) {
        function_aa7d3b7589a7323e();
    }
    if (level.gameended && self.gungamegunindex == level.gun_guns.size) {
        self.gungamegunindex = self.gungameprevgunindex;
    }
    giveperk("specialty_bling");
    thread givenextgun(1);
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x1a94
// Size: 0x60e
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, lifeid) {
    if (level.gameended) {
        return;
    }
    if (smeansofdeath == "MOD_FALLING" || isdefined(attacker) && isplayer(attacker)) {
        ismeleeweapon = isriotshield(objweapon.basename);
        isknife = isknifeonly(objweapon.basename) || isakimbomeleeweapon(objweapon.basename) || isaxeweapon(objweapon.basename) || ismeleeoverrideweapon(objweapon);
        var_6a7de031c0d6ffa9 = isdefined(smeansofdeath) && smeansofdeath == "MOD_EXECUTION";
        if (!isdefined(self.ladderdeathsthisweapon)) {
            self.ladderdeathsthisweapon = 1;
        } else {
            self.ladderdeathsthisweapon++;
        }
        if (smeansofdeath == "MOD_FALLING" || attacker == self || smeansofdeath == "MOD_MELEE" && isknife || self.ladderdeathsthisweapon == level.setbackstreak || var_6a7de031c0d6ffa9) {
            self.ladderdeathsthisweapon = 0;
            self notify("update_loadweapons");
            self.gungameprevgunindex = self.gungamegunindex;
            self.gungamegunindex = int(max(0, self.gungamegunindex - level.setback));
            if (self.gungameprevgunindex > self.gungamegunindex) {
                namespace_e8a49b70d0769b66::giveplayerscore(#"dropped_gun_rank", 1);
                thread namespace_62c556437da28f50::scoreeventpopup(#"dropped_gun_rank");
                incpersstat("setbacks", 1);
                namespace_2685ec368e022695::statsetchild("round", "setbacks", self.pers["setbacks"]);
                self playlocalsound("jup_mode_gun_rank_down");
                if (isplayer(self)) {
                    setextrascore1(self.pers["setbacks"]);
                }
            }
            if (smeansofdeath == "MOD_MELEE") {
                if (self.gungameprevgunindex) {
                    attacker thread doScoreEvent(#"hash_9fedfea2929dc7da");
                }
                attacker updateknivesperminute();
                attacker namespace_48a08c5037514e04::doScoreEvent(#"hash_6943b98a3e7d1a00");
                attacker incpersstat("stabs", 1);
                attacker namespace_2685ec368e022695::statsetchild("round", "stabs", attacker.pers["stabs"]);
                if (isplayer(attacker)) {
                    attacker setextrascore0(attacker.pers["stabs"]);
                }
            }
            if (attacker == self) {
                return;
            }
        }
        if (attacker != self && smeansofdeath == "MOD_PISTOL_BULLET" || smeansofdeath == "MOD_RIFLE_BULLET" || smeansofdeath == "MOD_HEAD_SHOT" || smeansofdeath == "MOD_PROJECTILE" || smeansofdeath == "MOD_PROJECTILE_SPLASH" || smeansofdeath == "MOD_IMPACT" || smeansofdeath == "MOD_GRENADE" || smeansofdeath == "MOD_GRENADE_SPLASH" || smeansofdeath == "MOD_EXPLOSIVE" || smeansofdeath == "MOD_EXPLOSIVE_BULLET" || smeansofdeath == "MOD_FIRE" || smeansofdeath == "MOD_MELEE" && !isknife && istrue(level.var_1a933adf9d114ff4) || smeansofdeath == "MOD_MELEE" && isknife || var_6a7de031c0d6ffa9) {
            var_ac0b9adaa0d681a = getweaponbasename(attacker.primaryweapon);
            if (!attacker canprogressingunrank(objweapon, var_ac0b9adaa0d681a, var_6a7de031c0d6ffa9)) {
                return;
            }
            if (!isdefined(attacker.ladderkillsthisweapon)) {
                attacker.ladderkillsthisweapon = 1;
            } else {
                attacker.ladderkillsthisweapon++;
            }
            if (attacker.ladderkillsthisweapon != level.killsperweapon) {
                return;
            }
            attacker.ladderkillsthisweapon = 0;
            attacker.ladderdeathsthisweapon = 0;
            attacker.gungameprevgunindex = attacker.gungamegunindex;
            attacker.gungamegunindex++;
            attacker notify("update_loadweapons");
            attacker namespace_e8a49b70d0769b66::giveplayerscore(#"gained_gun_rank", 1);
            if (attacker.gungamegunindex == level.gun_guns.size - 2) {
                level.kick_afk_check = 1;
            }
            if (attacker isonlastkill()) {
                var_15030f107e796007 = [];
                foreach (p in level.players) {
                    if (p != attacker) {
                        var_15030f107e796007[var_15030f107e796007.size] = p;
                    }
                }
                namespace_944ddf7b8df1b0e3::leaderdialogonplayers("lasttier_enemy", var_15030f107e796007);
                attacker namespace_944ddf7b8df1b0e3::leaderdialogonplayer("lasttier_friendly");
                attacker namespace_44abc05161e2e2cb::showsplash("gun_final_kill");
                namespace_a34451ae3d453e::playsoundonplayers("mp_enemy_obj_captured");
                level thread teamplayercardsplash("callout_top_gun_rank", attacker);
            }
            if (attacker.gungamegunindex < level.gun_guns.size) {
                points = namespace_62c556437da28f50::getscoreinfovalue(#"gained_gun_rank");
                attacker thread namespace_62c556437da28f50::scorepointspopup(points);
                attacker thread namespace_62c556437da28f50::scoreeventpopup(#"gained_gun_rank");
                attacker playlocalsound("jup_mode_gun_rank_up");
                attacker thread givenextgun(0);
            }
            if (isdefined(attacker.lastgunrankincreasetime) && gettime() - attacker.lastgunrankincreasetime < 5000) {
                attacker namespace_48a08c5037514e04::doScoreEvent(#"hash_16fa4e4e4a6aaacc");
            }
            attacker.lastgunrankincreasetime = gettime();
        }
    }
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x20a9
// Size: 0x2bf
function function_849e633648f1596f(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, lifeid) {
    var_17dd3068f1c6eafb = attacker.pers["team"];
    if (!isdefined(level.var_9b6e5e563299fef9)) {
        level.var_9b6e5e563299fef9 = [];
    }
    if (!isdefined(level.var_b0ad9e7ef6c53ce7)) {
        level.var_b0ad9e7ef6c53ce7 = [];
    }
    if (!isdefined(level.var_9b6e5e563299fef9[var_17dd3068f1c6eafb])) {
        level.var_9b6e5e563299fef9[var_17dd3068f1c6eafb] = level.var_ff35df662c18a63d;
    }
    if (!isdefined(level.var_b0ad9e7ef6c53ce7[var_17dd3068f1c6eafb])) {
        level.var_b0ad9e7ef6c53ce7[var_17dd3068f1c6eafb] = 0;
    }
    currentscore = getteamscore(var_17dd3068f1c6eafb) + 1;
    ismeleeweapon = isriotshield(objweapon.basename);
    isknife = isknifeonly(objweapon.basename) || isakimbomeleeweapon(objweapon.basename) || isaxeweapon(objweapon.basename) || ismeleeoverrideweapon(objweapon);
    var_6a7de031c0d6ffa9 = isdefined(smeansofdeath) && smeansofdeath == "MOD_EXECUTION";
    if (smeansofdeath == "MOD_FALLING" || attacker == self || smeansofdeath == "MOD_MELEE" && isknife) {
        return;
    }
    if (currentscore == level.var_9b6e5e563299fef9[var_17dd3068f1c6eafb]) {
        level.var_b0ad9e7ef6c53ce7[var_17dd3068f1c6eafb]++;
        level.var_9b6e5e563299fef9[var_17dd3068f1c6eafb] = level.var_9b6e5e563299fef9[var_17dd3068f1c6eafb] + level.var_ff35df662c18a63d;
        foreach (player in getteamdata(var_17dd3068f1c6eafb, "players")) {
            player.gungamegunindex = level.var_b0ad9e7ef6c53ce7[var_17dd3068f1c6eafb];
            player.gungameprevgunindex = level.var_b0ad9e7ef6c53ce7[var_17dd3068f1c6eafb] - 1;
            points = namespace_62c556437da28f50::getscoreinfovalue(#"gained_gun_rank");
            player thread namespace_62c556437da28f50::scorepointspopup(points);
            player thread namespace_62c556437da28f50::scoreeventpopup(#"gained_gun_rank");
            player playlocalsound("jup_mode_team_gun_rank_up_splash");
            player thread function_27748d0b77246b9d();
            player thread givenextgun(0);
        }
    }
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x236f
// Size: 0x2f2
function givenextgun(var_4fee35970dd4ddf) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (!var_4fee35970dd4ddf) {
        val::set("spawn_weapon", "weapon_switch", 0);
    }
    if (function_c1cddd7ae3bc2698() && !var_4fee35970dd4ddf) {
        result = wait_button_pressed_or_timeout(5);
        if (!istrue(result)) {
            return;
        }
    }
    waitframe();
    var_66b3db972ac1531e = getnextgun();
    var_66b3db972ac1531e = namespace_3bbb5a98b932c46f::updatesavedaltstate(var_66b3db972ac1531e);
    _giveweapon(var_66b3db972ac1531e, undefined, undefined, 1);
    if (function_c1cddd7ae3bc2698() && !var_4fee35970dd4ddf) {
        self playlocalsound("jup_mode_team_gun_rank_up_gain");
    }
    if (var_4fee35970dd4ddf) {
        self setspawnweapon(var_66b3db972ac1531e);
        foreach (weapon in self.weaponlist) {
            if (weapon == var_66b3db972ac1531e) {
                continue;
            }
            if (isdefined(self.var_f1ddb2e2f886e31e) && getweaponbasename(weapon) == self.var_f1ddb2e2f886e31e) {
                continue;
            }
            if (isdefined(self.var_350710ea016eac45) && getweaponbasename(weapon) == self.var_350710ea016eac45) {
                continue;
            }
            thread takeweaponwhensafe(weapon);
        }
    }
    self.pers["primaryWeapon"] = var_66b3db972ac1531e.basename;
    self.primaryweapon = var_66b3db972ac1531e.basename;
    self.primaryweaponobj = var_66b3db972ac1531e;
    namespace_6b49ddb858f34366::function_adcb155953291ec7(1, 0);
    _switchtoweapon(var_66b3db972ac1531e);
    var_f118b7926c3fde57 = isaxeweapon(var_66b3db972ac1531e);
    if (var_f118b7926c3fde57) {
        self setweaponammoclip(var_66b3db972ac1531e, 1);
        thread takeweaponwhensafegungame("iw9_knifestab_mp", 0);
    } else if (self.gungamegunindex != level.gun_guns.size - 1) {
        self givestartammo(var_66b3db972ac1531e);
        var_f968c960c23738e6 = namespace_d325722f2754c2c4::function_eeaa22f0cd1ff845("iw9_knifestab_mp");
        self giveweapon(var_f968c960c23738e6);
        self assignweaponmeleeslot(var_f968c960c23738e6);
    }
    if (!var_4fee35970dd4ddf) {
        currentweapon = self.lastdroppableweaponobj;
        thread takeweaponwhensafegungame(currentweapon, 1);
    }
    giveortakethrowingknife(var_66b3db972ac1531e.basename);
    namespace_3bbb5a98b932c46f::updatetogglescopestate(var_66b3db972ac1531e);
    self.gungameprevgunindex = self.gungamegunindex;
    if (!isdefined(self.lastgunpromotiontime)) {
        self.lastgunpromotiontime = gettime();
    }
    var_6943f322aa5378a5 = (gettime() - self.lastgunpromotiontime) / 1000;
    self.lastgunpromotiontime = gettime();
    if (isdefined(self.pers["longestTimeSpentOnWeapon"]) && var_6943f322aa5378a5 > self.pers["longestTimeSpentOnWeapon"]) {
        self.pers["longestTimeSpentOnWeapon"] = var_6943f322aa5378a5;
    }
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2668
// Size: 0x43
function function_27748d0b77246b9d() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("gun_game_next");
    for (i = 1; i < 6; i++) {
        self playlocalsound("jup_mode_team_gun_rank_timer_0" + i);
        wait(1);
    }
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x26b2
// Size: 0x56
function wait_button_pressed_or_timeout(time) {
    self endon("disconnect");
    self notify("wait_button_pressed_or_timeout");
    self endon("wait_button_pressed_or_timeout");
    self setclientomnvar("show_change_weapon_prompt", 1);
    msg = waittill_any_timeout_2(time, "gun_game_next");
    self setclientomnvar("show_change_weapon_prompt", 0);
    return 1;
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2710
// Size: 0x49
function takeweaponwhensafegungame(weapon, var_2af5eedf0b55ac7e) {
    self endon("death_or_disconnect");
    while (1) {
        if (!iscurrentweapon(weapon)) {
            break;
        }
        waitframe();
    }
    _takeweapon(weapon);
    if (var_2af5eedf0b55ac7e) {
        val::function_c9d0b43701bdba00("spawn_weapon");
    }
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2760
// Size: 0x3f
function getnextgun(var_5ed2cd7c116c2ad7) {
    var_111a8e98dce6a897 = self.gungamegunindex;
    if (isdefined(var_5ed2cd7c116c2ad7)) {
        var_111a8e98dce6a897 = var_5ed2cd7c116c2ad7;
    }
    newweapon = level.gun_guns[var_111a8e98dce6a897];
    return newweapon;
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27a7
// Size: 0xbf
function ontimelimit() {
    winners = gethighestprogressedplayers();
    if (!isdefined(winners) || !winners.size) {
        thread namespace_d576b6dc7cef9c62::endgame("tie", game["end_reason"]["time_limit_reached"]);
    } else if (winners.size == 1) {
        thread namespace_d576b6dc7cef9c62::endgame(winners[0], game["end_reason"]["time_limit_reached"]);
    } else if (winners[winners.size - 1].gungamegunindex > winners[winners.size - 2].gungamegunindex) {
        thread namespace_d576b6dc7cef9c62::endgame(winners[winners.size - 1], game["end_reason"]["time_limit_reached"]);
    } else {
        thread namespace_d576b6dc7cef9c62::endgame("tie", game["end_reason"]["time_limit_reached"]);
    }
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x286d
// Size: 0x9d
function gethighestprogressedplayers() {
    var_8808a5f5c406a534 = -1;
    var_cdd8c3d4ba7e829 = [];
    foreach (player in level.players) {
        if (isdefined(player.gungamegunindex) && player.gungamegunindex >= var_8808a5f5c406a534) {
            var_8808a5f5c406a534 = player.gungamegunindex;
            var_cdd8c3d4ba7e829[var_cdd8c3d4ba7e829.size] = player;
        }
    }
    return var_cdd8c3d4ba7e829;
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2912
// Size: 0x6b
function refillammo() {
    level endon("game_ended");
    self endon("disconnect");
    while (1) {
        self waittill("reload");
        currentweapon = self getcurrentweapon();
        var_8a2ecc3a9d4c95df = weaponstartammo(currentweapon);
        clipammo = weaponclipsize(currentweapon);
        stockammo = var_8a2ecc3a9d4c95df - clipammo;
        self setweaponammostock(currentweapon, stockammo);
    }
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2984
// Size: 0x68
function refillsinglecountammo() {
    level endon("game_ended");
    self endon("disconnect");
    while (1) {
        if (isreallyalive(self) && self.team != "spectator" && isdefined(self.primaryweapon) && self getammocount(self getcurrentweapon()) == 0) {
            wait(2);
            self notify("reload");
            wait(1);
        } else {
            waitframe();
        }
    }
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29f3
// Size: 0xaee
function setgunladder() {
    level.gun_guns = [];
    level.selectedweapons = [];
    if (istrue(level.useLadderIndex)) {
        switch (level.ladderindex) {
        case 1:
        case 4:
        case 5:
        case 6:
            if (matchmakinggame() && getdvarint(@"hash_fb3e643c9cdd861", 0) == 1) {
                level.gun_guns[0] = {var_4930aed7df4f9479:"rand_pistol"};
                level.gun_guns[1] = {var_4930aed7df4f9479:"rand_shotgun"};
                level.gun_guns[2] = {var_4930aed7df4f9479:"rand_smg"};
                level.gun_guns[3] = {var_4930aed7df4f9479:"rand_assault"};
                level.gun_guns[4] = {var_4930aed7df4f9479:"rand_lmg"};
                level.gun_guns[5] = {var_4930aed7df4f9479:"rand_sniper"};
                level.gun_guns[6] = {var_4930aed7df4f9479:"rand_smg"};
                level.gun_guns[7] = {var_4930aed7df4f9479:"rand_assault"};
                level.gun_guns[8] = {var_4930aed7df4f9479:"rand_lmg"};
                level.gun_guns[9] = {var_4930aed7df4f9479:"rand_launcher"};
                level.gun_guns[10] = {var_4930aed7df4f9479:"rand_shotgun"};
                level.gun_guns[11] = {var_4930aed7df4f9479:"rand_smg"};
                level.gun_guns[12] = {var_4930aed7df4f9479:"rand_assault"};
                level.gun_guns[13] = {var_4930aed7df4f9479:"rand_shotgun"};
                level.gun_guns[14] = {var_4930aed7df4f9479:"rand_assault"};
                level.gun_guns[15] = {var_4930aed7df4f9479:"rand_sniper"};
                level.gun_guns[16] = {var_4930aed7df4f9479:"rand_pistol"};
                level.gun_guns[17] = {var_4930aed7df4f9479:"rand_knife_end"};
            } else {
                level.gun_guns[0] = {var_4930aed7df4f9479:"rand_assault"};
                level.gun_guns[1] = {var_4930aed7df4f9479:"rand_smg"};
                level.gun_guns[2] = {var_4930aed7df4f9479:"rand_shotgun"};
                level.gun_guns[3] = {var_4930aed7df4f9479:"rand_lmg"};
                level.gun_guns[4] = {var_4930aed7df4f9479:"rand_assault"};
                level.gun_guns[5] = {var_4930aed7df4f9479:"rand_dmr"};
                level.gun_guns[6] = {var_4930aed7df4f9479:"rand_pistol"};
                level.gun_guns[7] = {var_4930aed7df4f9479:"rand_assault"};
                level.gun_guns[8] = {var_4930aed7df4f9479:"rand_smg"};
                level.gun_guns[9] = {var_4930aed7df4f9479:"rand_launcher"};
                level.gun_guns[10] = {var_4930aed7df4f9479:"rand_dmr"};
                level.gun_guns[11] = {var_4930aed7df4f9479:"rand_lmg"};
                level.gun_guns[12] = {var_4930aed7df4f9479:"rand_assault"};
                level.gun_guns[13] = {var_4930aed7df4f9479:"rand_smg"};
                level.gun_guns[14] = {var_4930aed7df4f9479:"rand_sniper"};
                level.gun_guns[15] = {var_4930aed7df4f9479:"rand_shotgun"};
                level.gun_guns[16] = {var_4930aed7df4f9479:"rand_pistol"};
                level.gun_guns[17] = {var_4930aed7df4f9479:"rand_knife_end"};
            }
            break;
        case 2:
            level.gun_guns[0] = {var_4930aed7df4f9479:"rand_pistol"};
            level.gun_guns[1] = {var_4930aed7df4f9479:"rand_shotgun"};
            level.gun_guns[2] = {var_4930aed7df4f9479:"rand_smg"};
            level.gun_guns[3] = {var_4930aed7df4f9479:"rand_assault"};
            level.gun_guns[4] = {var_4930aed7df4f9479:"rand_pistol"};
            level.gun_guns[5] = {var_4930aed7df4f9479:"rand_shotgun"};
            level.gun_guns[6] = {var_4930aed7df4f9479:"rand_smg"};
            level.gun_guns[7] = {var_4930aed7df4f9479:"rand_assault"};
            level.gun_guns[8] = {var_4930aed7df4f9479:"rand_pistol"};
            level.gun_guns[9] = {var_4930aed7df4f9479:"rand_shotgun"};
            level.gun_guns[10] = {var_4930aed7df4f9479:"rand_smg"};
            level.gun_guns[11] = {var_4930aed7df4f9479:"rand_assault"};
            level.gun_guns[12] = {var_4930aed7df4f9479:"rand_pistol"};
            level.gun_guns[13] = {var_4930aed7df4f9479:"rand_shotgun2"};
            level.gun_guns[14] = {var_4930aed7df4f9479:"rand_smg"};
            level.gun_guns[15] = {var_4930aed7df4f9479:"rand_assault"};
            level.gun_guns[16] = {var_4930aed7df4f9479:"rand_pistol"};
            level.gun_guns[17] = {var_4930aed7df4f9479:"rand_knife_end"};
            break;
        case 3:
            level.gun_guns[0] = {var_4930aed7df4f9479:"rand_pistol"};
            level.gun_guns[1] = {var_4930aed7df4f9479:"rand_assault"};
            level.gun_guns[2] = {var_4930aed7df4f9479:"rand_lmg"};
            level.gun_guns[3] = {var_4930aed7df4f9479:"rand_launcher"};
            level.gun_guns[4] = {var_4930aed7df4f9479:"rand_sniper"};
            level.gun_guns[5] = {var_4930aed7df4f9479:"rand_assault"};
            level.gun_guns[6] = {var_4930aed7df4f9479:"rand_lmg"};
            level.gun_guns[7] = {var_4930aed7df4f9479:"rand_launcher"};
            level.gun_guns[8] = {var_4930aed7df4f9479:"rand_sniper"};
            level.gun_guns[9] = {var_4930aed7df4f9479:"rand_assault"};
            level.gun_guns[10] = {var_4930aed7df4f9479:"rand_lmg"};
            level.gun_guns[11] = {var_4930aed7df4f9479:"rand_launcher"};
            level.gun_guns[12] = {var_4930aed7df4f9479:"rand_sniper2"};
            level.gun_guns[13] = {var_4930aed7df4f9479:"rand_assault"};
            level.gun_guns[14] = {var_4930aed7df4f9479:"rand_sniper2"};
            level.gun_guns[15] = {var_4930aed7df4f9479:"rand_assault"};
            level.gun_guns[16] = {var_4930aed7df4f9479:"rand_pistol"};
            level.gun_guns[17] = {var_4930aed7df4f9479:"rand_knife_end"};
            break;
        case 7:
            level.gun_guns[0] = {var_4930aed7df4f9479:"rand_pistol"};
            level.gun_guns[1] = {var_4930aed7df4f9479:"rand_assault"};
            level.gun_guns[2] = {var_4930aed7df4f9479:"rand_lmg"};
            level.gun_guns[3] = {var_4930aed7df4f9479:"rand_smg"};
            level.gun_guns[4] = {var_4930aed7df4f9479:"rand_sniper"};
            level.gun_guns[5] = {var_4930aed7df4f9479:"rand_pistol"};
            level.gun_guns[6] = {var_4930aed7df4f9479:"rand_lmg"};
            level.gun_guns[7] = {var_4930aed7df4f9479:"rand_battle_rifle"};
            level.gun_guns[8] = {var_4930aed7df4f9479:"rand_dmr"};
            level.gun_guns[9] = {var_4930aed7df4f9479:"rand_assault"};
            level.gun_guns[10] = {var_4930aed7df4f9479:"rand_smg"};
            level.gun_guns[11] = {var_4930aed7df4f9479:"rand_battle_rifle"};
            level.gun_guns[12] = {var_4930aed7df4f9479:"rand_dmr"};
            level.gun_guns[13] = {var_4930aed7df4f9479:"rand_assault"};
            level.gun_guns[14] = {var_4930aed7df4f9479:"rand_smg"};
            level.gun_guns[15] = {var_4930aed7df4f9479:"rand_smg"};
            level.gun_guns[16] = {var_4930aed7df4f9479:"rand_pistol"};
            level.gun_guns[17] = {var_4930aed7df4f9479:"rand_knife_end"};
            break;
        }
    } else {
        level.gun_guns = level.var_9bc45da762160eb8.weaponlist;
    }
    if (level.gametype == "gun") {
        scorelimit = level.gun_guns.size;
        setdynamicdvar(@"hash_a7992f287575dd31", scorelimit);
        registerscorelimitdvar(getgametype(), scorelimit);
    }
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34e8
// Size: 0x182
function setgunsfinal() {
    level.selectedweapons = [];
    function_102741e35aa549ae();
    for (i = 0; i < level.gun_guns.size; i++) {
        var_b3bf8105d61a60e1 = level.gun_guns[i];
        if (string_starts_with(var_b3bf8105d61a60e1.var_4930aed7df4f9479, "rand_")) {
            weapondata = function_5f97f15e9ca6cb6(var_b3bf8105d61a60e1.var_4930aed7df4f9479);
            if (level.ladderindex == 4 || level.ladderindex == 5) {
                level.gun_guns[i] = buildweapon_blueprint(weapondata["weapon"], undefined, undefined, weapondata["variantID"], undefined, undefined, namespace_36f464722d326bbe::isnightmap());
            } else {
                level.gun_guns[i] = function_96d23570114bc7b6(weapondata);
            }
        } else {
            rootname = getweaponrootname(level.gun_guns[i]);
            level.selectedweapons[rootname] = 1;
            newweapon = rootname;
            var_c8616c37bc30098b = 0;
            if (level.ladderindex == 4 || level.ladderindex == 5) {
                newweapon = buildweapon_blueprint(rootname, undefined, undefined, undefined, undefined, undefined, namespace_36f464722d326bbe::function_d2d2b803a7b741a4());
            } else {
                newweapon = gun_createrandomweapon(rootname, var_c8616c37bc30098b, undefined, namespace_36f464722d326bbe::function_d2d2b803a7b741a4());
            }
            level.gun_guns[i] = newweapon;
        }
    }
    level.selectedweapons = undefined;
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3671
// Size: 0x8
function getrandomarchetype() {
    return "archetype_assault";
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3681
// Size: 0x24d
function setspecialloadout() {
    level.gun_loadouts["axis"]["loadoutPrimary"] = "none";
    level.gun_loadouts["axis"]["loadoutPrimaryAttachment"] = "none";
    level.gun_loadouts["axis"]["loadoutPrimaryAttachment2"] = "none";
    level.gun_loadouts["axis"]["loadoutPrimaryCamo"] = "none";
    level.gun_loadouts["axis"]["loadoutPrimaryReticle"] = "none";
    level.gun_loadouts["axis"]["loadoutPrimaryVariantID"] = 0;
    level.gun_loadouts["axis"]["loadoutSecondary"] = "none";
    level.gun_loadouts["axis"]["loadoutSecondaryAttachment"] = "none";
    level.gun_loadouts["axis"]["loadoutSecondaryAttachment2"] = "none";
    level.gun_loadouts["axis"]["loadoutSecondaryCamo"] = "none";
    level.gun_loadouts["axis"]["loadoutSecondaryReticle"] = "none";
    level.gun_loadouts["axis"]["loadoutSecondaryVariantID"] = 0;
    level.gun_loadouts["axis"]["loadoutEquipmentPrimary"] = "none";
    level.gun_loadouts["axis"]["loadoutEquipmentSecondary"] = "none";
    level.gun_loadouts["axis"]["loadoutOffhand"] = "none";
    level.gun_loadouts["axis"]["loadoutStreakType"] = "assault";
    level.gun_loadouts["axis"]["loadoutKillstreak1"] = "none";
    level.gun_loadouts["axis"]["loadoutKillstreak2"] = "none";
    level.gun_loadouts["axis"]["loadoutKillstreak3"] = "none";
    level.gun_loadouts["axis"]["loadoutPerks"] = [];
    level.gun_loadouts["axis"]["loadoutGesture"] = "playerData";
    level.gun_loadouts["allies"] = level.gun_loadouts["axis"];
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x38d5
// Size: 0x1b9
function function_6b7afefdbeeeec0a() {
    level.weaponcategories = [];
    for (row = 0; 1; row++) {
        categoryname = tablelookupbyrow("mp/gunGameWeapons.csv", row, 0);
        if (categoryname == "") {
            break;
        }
        if (!isdefined(level.weaponcategories[categoryname])) {
            level.weaponcategories[categoryname] = [];
        }
        var_e1fb30830e39f39d = tablelookupbyrow("mp/gunGameWeapons.csv", row, 5);
        if (var_e1fb30830e39f39d == "" || getdvarint(var_e1fb30830e39f39d, 0) == 1) {
            data = [];
            data["weapon"] = getweaponrootname(tablelookupbyrow("mp/gunGameWeapons.csv", row, 1));
            data["min"] = int(tablelookupbyrow("mp/gunGameWeapons.csv", row, 2));
            data["max"] = int(tablelookupbyrow("mp/gunGameWeapons.csv", row, 3));
            data["perk"] = tablelookupbyrow("mp/gunGameWeapons.csv", row, 4);
            if (level.ladderindex == 4 || level.ladderindex == 5) {
                if (!isdefined(game["arenaWeaponCategories"])) {
                    level.arenaloadouts = 13;
                    namespace_47e715c4f9510479::function_b7c18ded2347456c();
                }
                data["variantID"] = namespace_47e715c4f9510479::function_11a6a3ec5c206652(data["weapon"]);
            }
            data["allowed"] = int(tablelookupbyrow("mp/gunGameWeapons.csv", row, 7));
            if ((level.ladderindex == 4 || level.ladderindex == 6) && !data["allowed"]) {
                row++;
                continue;
            }
            level.weaponcategories[categoryname][level.weaponcategories[categoryname].size] = data;
        }
    }
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a95
// Size: 0x1ab
function function_102741e35aa549ae() {
    level.weaponcategories = [];
    foreach (var_5d2032c6e19e24e7 in level.var_29fe567a5ca5271d.weaponsTable) {
        if (!isdefined(level.weaponcategories[var_5d2032c6e19e24e7.groupname])) {
            level.weaponcategories[var_5d2032c6e19e24e7.groupname] = [];
        }
        data = [];
        data["weapon"] = var_5d2032c6e19e24e7.baseweapon;
        data["min"] = var_5d2032c6e19e24e7.var_1aeea42b2243716f;
        data["max"] = var_5d2032c6e19e24e7.maxattachments;
        data["perk"] = var_5d2032c6e19e24e7.var_13db3ca1ad2db644;
        if (level.ladderindex == 4 || level.ladderindex == 5) {
            if (!isdefined(game["arenaWeaponCategories"])) {
                level.arenaloadouts = 13;
                namespace_47e715c4f9510479::function_b7c18ded2347456c();
            }
            data["variantID"] = namespace_47e715c4f9510479::function_11a6a3ec5c206652(data["weapon"]);
        }
        data["allowed"] = var_5d2032c6e19e24e7.var_dea829db5b5247a9;
        if ((level.ladderindex == 4 || level.ladderindex == 6) && !data["allowed"]) {
            continue;
        }
        level.weaponcategories[var_5d2032c6e19e24e7.groupname][level.weaponcategories[var_5d2032c6e19e24e7.groupname].size] = data;
    }
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c47
// Size: 0x199
function function_5f97f15e9ca6cb6(categoryname) {
    weaponlist = level.weaponcategories[categoryname];
    if (isdefined(weaponlist) && weaponlist.size > 0) {
        newweapon = "";
        data = undefined;
        for (loopcount = 0; 1; loopcount++) {
            index = randomintrange(0, weaponlist.size);
            data = weaponlist[index];
            rootname = getweaponrootname(data["weapon"]);
            var_aaa935a3ebf3fd7c = 1;
            if (level.ladderindex == 4 || level.ladderindex == 6) {
                var_aaa935a3ebf3fd7c = data["allowed"];
            }
            if (isdefined(level.selectedweapons) && !isdefined(level.selectedweapons[rootname]) && var_aaa935a3ebf3fd7c || loopcount > weaponlist.size) {
                level.selectedweapons[rootname] = 1;
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
            assertmsg("Unknown weapon category name " + categoryname + ". Possible cause could be not enough weapons of category in " + level.var_29fe567a5ca5271d);
        #/
        return "none";
    }
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3de7
// Size: 0x54
function function_96d23570114bc7b6(weapondata) {
    var_c8616c37bc30098b = randomintrange(weapondata["min"], weapondata["max"] + 1);
    newweapon = gun_createrandomweapon(weapondata["weapon"], var_c8616c37bc30098b, weapondata["variantID"], namespace_36f464722d326bbe::function_d2d2b803a7b741a4());
    return newweapon;
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3e43
// Size: 0xc2
function gun_createrandomweapon(rootname, var_c8616c37bc30098b, variantid, var_11a1fa68aeb971c0) {
    if ((!isdefined(var_c8616c37bc30098b) || !getdvarint(@"hash_76d3386761ef7fb6", 0)) && !istrue(level.var_c423c2360ca0dac5)) {
        var_c8616c37bc30098b = 0;
    }
    var_b8215055a946eebb = buildweapon(rootname, undefined, undefined, undefined, variantid, undefined, undefined, undefined, var_11a1fa68aeb971c0);
    var_952f1674fa8d734f = [];
    if (var_c8616c37bc30098b > 0) {
        var_72e3a98d1c7327c5 = [0:"visual", 1:"modifier2"];
        var_952f1674fa8d734f = namespace_3bbb5a98b932c46f::function_8df87e6b1d13c15a(var_b8215055a946eebb, var_c8616c37bc30098b, 0, var_72e3a98d1c7327c5, 1000);
    }
    if (var_952f1674fa8d734f.size > 0) {
        var_b8215055a946eebb = buildweapon(rootname, var_952f1674fa8d734f, undefined, undefined, variantid, undefined, undefined, undefined, var_11a1fa68aeb971c0);
    }
    return var_b8215055a946eebb;
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f0d
// Size: 0xb0
function gun_buildoverrideattachmentlist(var_72c4b0af1a85887e) {
    possibleattachments = getallselectableattachments(var_72c4b0af1a85887e);
    var_79583f5b5010a954 = [];
    foreach (attachment in possibleattachments) {
        if (isstartstr(attachment, "gl") || isstartstr(attachment, "ub") || isstartstr(attachment, "thermal") || attachment == "hybrid3") {
            continue;
        }
        var_79583f5b5010a954[var_79583f5b5010a954.size] = attachment;
    }
    return var_79583f5b5010a954;
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3fc5
// Size: 0x94
function attachmentcheck(attachment, var_517683bad763b676, var_a71a84cdad3a4ebb, weaponname) {
    var_2c4fc9c24ccfdf3c = tablelookup(var_a71a84cdad3a4ebb, 0, attachment, 1);
    for (i = 0; i < var_517683bad763b676.size; i++) {
        var_e012c12f441a9c1d = tablelookup(var_a71a84cdad3a4ebb, 0, var_517683bad763b676[i], 1);
        if (attachment == var_517683bad763b676[i] || attachmentsconflict(attachment, var_517683bad763b676[i], weaponname) != "" || var_2c4fc9c24ccfdf3c == var_e012c12f441a9c1d) {
            return 0;
        }
    }
    return 1;
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4061
// Size: 0x6e
function giveortakethrowingknife(currentweapon) {
    namespace_1a507865f681850e::takeequipment("primary");
    if (isknifeonly(currentweapon) || isakimbomeleeweapon(currentweapon) || isaxeweapon(currentweapon)) {
        giveperk("specialty_scavenger");
        giveperk("specialty_pitcher");
        namespace_1a507865f681850e::giveequipment("equip_throwing_knife", "primary");
        thread namespace_1a507865f681850e::incrementequipmentammo("equip_throwing_knife");
    }
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x40d6
// Size: 0x13
function isvalidthrowingknifekill(var_d3b1e28744413c1) {
    return var_d3b1e28744413c1 == "throwingknife_mp";
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x40f1
// Size: 0xdf
function onplayerscore(event, player, originalpoints, victim, var_7ec7671a1e0c788f) {
    player incpersstat("gamemodeScore", originalpoints);
    newscore = player getpersstat("gamemodeScore");
    player namespace_2685ec368e022695::statsetchild("round", "gamemodeScore", newscore);
    score = 0;
    if (event == "gained_gun_rank") {
        score = 1;
    } else if (event == "dropped_gun_rank") {
        var_51b54a87bcda2c52 = level.setback;
        score = var_51b54a87bcda2c52 * -1;
    } else if (event == "assist_ffa" || event == "kill") {
        player bufferednotify("earned_score_buffered", originalpoints);
    }
    /#
        assert(isdefined(score));
    #/
    return score;
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x41d8
// Size: 0x54
function updateknivesperminute() {
    if (!isdefined(self.knivesperminute)) {
        self.numknives = 0;
        self.knivesperminute = 0;
    }
    self.numknives++;
    if (getminutespassed() < 1) {
        return;
    }
    self.knivesperminute = self.numknives / getminutespassed();
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4233
// Size: 0xa7
function modifyunifiedpointscallback(points, event, player, objweapon) {
    if (isdefined(objweapon) && (objweapon.basename == "iw9_me_knife_mp" || objweapon.basename == "jup_jp23_me_knife_mp" || objweapon.basename == "iw8_me_akimboblunt_mp" || objweapon.basename == "iw8_me_akimboblades_mp")) {
        if (isdefined(player) && isdefined(player.knivesperminute) && player.knivesperminute >= 10) {
            return 0;
        }
    }
    return points;
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x42e2
// Size: 0xa8
function canprogressingunrank(objweapon, var_ac0b9adaa0d681a, var_6a7de031c0d6ffa9) {
    if (objweapon.basename == var_ac0b9adaa0d681a && !(objweapon.basename == "jup_jp23_me_knife_mp")) {
        return 1;
    }
    if (var_ac0b9adaa0d681a == "iw8_sn_crossbow_mp") {
        if (issubstr(objweapon.basename, "bolt")) {
            return 1;
        }
    }
    if (objweapon.basename == "dragonsbreath_mp") {
        return 1;
    }
    if (isonlastkill()) {
        if (isvalidthrowingknifekill(objweapon.basename)) {
            return 1;
        }
        if (var_6a7de031c0d6ffa9) {
            return 1;
        }
    }
    return 0;
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4392
// Size: 0x1a
function isonlastkill() {
    return self.gungamegunindex == level.gun_guns.size - 1;
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x43b4
// Size: 0x123
function function_d5a7aac125289e1d() {
    /#
        level endon("ladderIndex");
        while (1) {
            var_fa94695bf12341b6 = getdvarint(@"hash_d5afb25002d2a396", 0);
            setdvar(@"hash_d5afb25002d2a396", 0);
            if (var_fa94695bf12341b6) {
                foreach (class in level.weaponcategories) {
                    foreach (weapon in class) {
                        level.players[0] takeallweapons();
                        setdvar(@"hash_1ce2eb225cc3a6da", weapon["mp_dm_spawn_secondary"]);
                        wait(1);
                        adddebugcommand("mp_tdm_spawn_allies_start" + "kill" + weapon["mp_dm_spawn_secondary"] + "MOD_PISTOL_BULLET");
                        wait(2);
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x44de
// Size: 0x285
function function_976d13e05a73c64e() {
    /#
        level endon("ladderIndex");
        while (1) {
            var_c5a3307389b271ae = getdvarint(@"hash_131d7c69641a09e6", 0);
            var_16ef92f533f614f7 = getdvarint(@"hash_4d0d7b8829a798cf", 0);
            if (var_c5a3307389b271ae || var_16ef92f533f614f7) {
                foreach (player in level.players) {
                    var_ac0b9adaa0d681a = getweaponbasename(player.primaryweapon);
                    player.gungameprevgunindex = player.gungamegunindex;
                    var_93f61c4827bcef8a = 0;
                    if (var_c5a3307389b271ae) {
                        var_5931b9c1e935811f = player.gungamegunindex + 1;
                        if (var_5931b9c1e935811f >= level.gun_guns.size - 1) {
                            player iprintlnbold("MOD_HEAD_SHOT");
                        } else {
                            player.gungamegunindex++;
                            var_93f61c4827bcef8a = 1;
                            player namespace_e8a49b70d0769b66::giveplayerscore(#"gained_gun_rank", 1);
                            points = namespace_62c556437da28f50::getscoreinfovalue(#"gained_gun_rank");
                            player thread namespace_62c556437da28f50::scorepointspopup(points);
                            player thread namespace_62c556437da28f50::scoreeventpopup(#"gained_gun_rank");
                            player playlocalsound("loadoutSecondaryAttachment");
                        }
                        setdvar(@"hash_131d7c69641a09e6", 0);
                    } else {
                        var_5931b9c1e935811f = player.gungamegunindex - 1;
                        if (var_5931b9c1e935811f < 0) {
                            player iprintlnbold("arenaWeaponCategories");
                        } else {
                            player.gungamegunindex--;
                            var_93f61c4827bcef8a = 1;
                            player namespace_e8a49b70d0769b66::giveplayerscore(#"dropped_gun_rank", 1);
                            player incpersstat("<unknown string>", 1);
                            player namespace_2685ec368e022695::statsetchild("<unknown string>", "<unknown string>", player.pers["<unknown string>"]);
                            player playlocalsound("<unknown string>");
                            if (isplayer(player)) {
                                player setextrascore1(player.pers["<unknown string>"]);
                            }
                        }
                        setdvar(@"hash_4d0d7b8829a798cf", 0);
                    }
                    if (istrue(var_93f61c4827bcef8a)) {
                        player notify("<unknown string>");
                        player thread givenextgun(0);
                        player.lastgunrankincreasetime = gettime();
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace gun/namespace_5efc3f84199a836c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x476a
// Size: 0x22
function function_277a84f0f23bdb9b() {
    /#
        while (1) {
            wait(6);
            setdvar(@"hash_131d7c69641a09e6", 1);
        }
    #/
}

