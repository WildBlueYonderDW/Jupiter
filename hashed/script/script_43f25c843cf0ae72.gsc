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
#using script_48814951e916af89;
#using scripts\cp_mp\parachute.gsc;
#using scripts\mp\gametypes\bradley_spawner.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\spawnscoring.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\mp\flags.gsc;

#namespace namespace_24a69f02d9272cd;

// Namespace namespace_24a69f02d9272cd/namespace_26afdfc219469a1e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6ac
// Size: 0x2a2
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
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
        registerscorelimitdvar(getgametype(), 75);
        registerroundlimitdvar(getgametype(), 1);
        registerwinlimitdvar(getgametype(), 1);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
        function_704789086c9ad943(getgametype(), 1);
    }
    updategametypedvars();
    level.teambased = 1;
    level.onstartgametype = &onstartgametype;
    level.getspawnpoint = &getspawnpoint;
    level.onnormaldeath = &onnormaldeath;
    level.modeonspawnplayer = &onspawnplayer;
    level.blockweapondrops = 1;
    level.denyclasschoice = 1;
    level.bypassclasschoicefunc = &namespace_d19129e4fa5d176::alwaysgamemodeclass;
    function_e88d9ec1d5270bad();
    setdvar(@"hash_3c4d1d9e67d42b87", 0);
    setdvar(@"hash_365d77262b3a350e", 0);
    namespace_bfef6903bca5845d::init();
    level.var_289df80e1ded586f = 1;
    if (getdvarint(@"hash_cd7a289c3a33ceda", 0) != 0) {
        level.onplayerkilled = &onhotfootplayerkilled;
    }
    game["dialog"]["gametype"] = "iw9_mtdm_mode_uktl_name";
    game["dialog"]["boost"] = "iw9_mtdm_mode_uktl_bost";
    game["dialog"]["offense_obj"] = "iw9_mtdm_mode_uktl_bost";
    game["dialog"]["defense_obj"] = "iw9_mtdm_mode_uktl_bost";
    level.testtdmanywhere = getdvarint(@"hash_157f06aff3c1f357", 0);
    level.tdmanywhere_dropheight = getdvarfloat(@"hash_c692d2a11dd6615", 1000);
    level.tdmanywhere_perpenoffset = getdvarfloat(@"hash_631c58033f43c2dc", 2048);
    level.tdmanywhere_distoffset = getdvarfloat(@"hash_f314048c87ae28aa", 4092);
    if (istrue(level.testtdmanywhere)) {
        namespace_5078ee98abb32db9::initparachutedvars();
    }
    if (matchmakinggame()) {
        level.shouldgamelobbyremainintact = &shouldgamelobbyremainintact;
    }
    /#
        level.var_a1c387e9b8e35312 = &function_a1c387e9b8e35312;
    #/
}

// Namespace namespace_24a69f02d9272cd/namespace_26afdfc219469a1e
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x955
// Size: 0x247
function private function_e88d9ec1d5270bad() {
    /#
        assertex(!isdefined(level.var_a955231ddec95faf), "The AON loadout has already been defined.");
    #/
    level.var_a955231ddec95faf = [];
    level.var_a955231ddec95faf["loadoutArchetype"] = "archetype_assault";
    level.var_a955231ddec95faf["loadoutPrimary"] = "iw9_me_knife_mp";
    level.var_a955231ddec95faf["loadoutPrimaryAttachment"] = "none";
    level.var_a955231ddec95faf["loadoutPrimaryAttachment2"] = "none";
    level.var_a955231ddec95faf["loadoutPrimaryCamo"] = "none";
    level.var_a955231ddec95faf["loadoutPrimaryReticle"] = "none";
    level.var_a955231ddec95faf["loadoutPrimaryVariantID"] = 0;
    level.var_a955231ddec95faf["loadoutSecondary"] = "iw9_pi_golf17_mp";
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

// Namespace namespace_24a69f02d9272cd/namespace_26afdfc219469a1e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xba3
// Size: 0x10e
function function_2a1ce8d7b1f21db9(player) {
    player endon("death");
    player endon("disconnect");
    while (1) {
        wait(2);
        team = player.pers["team"];
        if (!isdefined(team)) {
            continue;
        }
        var_152b8f126af5871d = getotherteam(team)[0];
        if (!isdefined(var_152b8f126af5871d)) {
            continue;
        }
        safeorigin = function_ca817bf862167332();
        if (abs(safeorigin[2] - level.player.origin[2]) > 90) {
            wait(1);
            continue;
        }
        angles = flat_angle(vectortoangles(safeorigin - level.player.origin));
        ai = namespace_bfef6903bca5845d::ai_mp_requestspawnagent("jup_enemy_mp_arcade_alien_01", safeorigin, (0, randomint(360), 0), "high", "everybody", undefined, undefined, var_152b8f126af5871d);
        if (isagent(ai)) {
            ai thread function_2f3dda44b5f52742();
        }
    }
}

// Namespace namespace_24a69f02d9272cd/namespace_26afdfc219469a1e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcb8
// Size: 0xe3
function function_2f3dda44b5f52742() {
    ai = self;
    ai endon("death");
    setdvar(@"hash_fd64b1a4770cd47c", 0);
    while (1) {
        ai setgoalpos(getclosestpointonnavmesh(level.player.origin), 16);
        ai.var_d4ae052f5bda013 = 0;
        ai.goalradius = 16;
        ai.stealth_enabled = 0;
        ai.pathenemyfightdist = 0;
        ai.noragdoll = 1;
        ai.script_noragdoll = 1;
        ai.liveragdoll = 0;
        if (distance(ai.origin, level.player.origin) < 140) {
            ai kill();
        }
        wait(0.2);
    }
}

// Namespace namespace_24a69f02d9272cd/namespace_26afdfc219469a1e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xda2
// Size: 0x7a
function function_ca817bf862167332() {
    dist = 1600;
    x = randomint(dist) * pow(-1, randomint(2));
    y = randomint(dist) * pow(-1, randomint(2));
    safeorigin = getclosestpointonnavmesh(level.player.origin + (x, y, 0));
    return safeorigin;
}

// Namespace namespace_24a69f02d9272cd/namespace_26afdfc219469a1e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe24
// Size: 0x38
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(@"hash_6e7da31aae47b8e0", 0);
    registerhalftimedvar(getgametype(), 0);
    setdynamicdvar(@"hash_bb6e8f8d9be104f4", 0);
}

// Namespace namespace_24a69f02d9272cd/namespace_26afdfc219469a1e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe63
// Size: 0x14e
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
        setobjectivetext(entry, "OBJECTIVES/WAR");
        if (level.splitscreen) {
            setobjectivescoretext(entry, "OBJECTIVES/WAR");
        } else {
            setobjectivescoretext(entry, "OBJECTIVES/WAR_SCORE");
        }
        setobjectivehinttext(entry, "OBJECTIVES/WAR_HINT");
    }
    if (isdefined(level.initspawnsoverridefunc)) {
        [[ level.initspawnsoverridefunc ]]();
    } else {
        initspawns();
    }
    namespace_662734e7fa8a8b94::inittankspawns();
    if (getdvarint(@"hash_cd7a289c3a33ceda", 0) != 0) {
        thread monitorhotfoot();
    }
    /#
        thread function_8469a5927d069db7();
        if (0) {
            function_bf2918399f1800b1();
        }
    #/
}

// Namespace namespace_24a69f02d9272cd/namespace_26afdfc219469a1e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfb8
// Size: 0xa
function updategametypedvars() {
    namespace_310ba947928891df::updatecommongametypedvars();
}

// Namespace namespace_24a69f02d9272cd/namespace_26afdfc219469a1e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfc9
// Size: 0x28c
function initspawns() {
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
        tdmanywhere_debugshowlocs();
    } else {
        level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
        setmapcenter(level.mapcenter);
    }
}

// Namespace namespace_24a69f02d9272cd/namespace_26afdfc219469a1e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x125c
// Size: 0x64
function function_a1c387e9b8e35312() {
    /#
        namespace_b2d5aa2baf2b5701::function_8390bf8c3b74466a("loadoutEquipmentSecondary");
        namespace_b2d5aa2baf2b5701::function_8390bf8c3b74466a("loadoutUsingSpecialist");
        spawns = namespace_b2d5aa2baf2b5701::getspawnpointarray("disconnect");
        var_3a5288f40c8be099 = namespace_b2d5aa2baf2b5701::getspawnpointarray("Default");
        namespace_b2d5aa2baf2b5701::registerspawnset("loadoutEquipmentSecondary", spawns);
        namespace_b2d5aa2baf2b5701::registerspawnset("loadoutUsingSpecialist", var_3a5288f40c8be099);
    #/
}

// Namespace namespace_24a69f02d9272cd/namespace_26afdfc219469a1e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12c7
// Size: 0x1c1
function getspawnpoint() {
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
        /#
            function_d73615f1fc12f3db(spawnpoint, spawnteam);
        #/
    }
    spawnpoint.angles = (0, 0, 0);
    return spawnpoint;
}

// Namespace namespace_24a69f02d9272cd/namespace_26afdfc219469a1e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1490
// Size: 0x75
function onspawnplayer(var_9156b53bcf7ce573) {
    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("kill");
    thread function_c97e11b8cda0d02a();
    level thread function_2a1ce8d7b1f21db9(self);
    if (!istrue(level.testtdmanywhere)) {
        return;
    }
    self setplayerangles(vectortoangles(level.mapcenter - self.origin));
    model = spawn("script_model", self.origin);
}

// Namespace namespace_24a69f02d9272cd/namespace_26afdfc219469a1e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x150c
// Size: 0x9d
function function_c97e11b8cda0d02a() {
    var_ca029ca2f4f87707 = self.origin + (0, 0, 500);
    var_5940f376a254619d = spawn("script_model", var_ca029ca2f4f87707);
    var_5940f376a254619d setmodel("tag_origin");
    var_5940f376a254619d.angles = vectortoangles(self.origin - var_ca029ca2f4f87707);
    self cameralinkto(var_5940f376a254619d, "tag_origin");
    var_5940f376a254619d linkto(self);
    self freezelookcontrols(1);
    self.plotarmor = 1;
    self setmovespeedscale(3);
    thread function_df184fbc4e747730();
}

// Namespace namespace_24a69f02d9272cd/namespace_26afdfc219469a1e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15b0
// Size: 0x10b
function function_df184fbc4e747730() {
    dist = 64;
    num = 3;
    baseangle = 360 / num;
    if (istrue(self.var_cfd1661be8d74137)) {
        return;
    }
    self.var_cfd1661be8d74137 = 1;
    ent = spawn("script_model", self.origin);
    ent setmodel("tag_origin");
    ent thread function_e3f27c4c28aff30f();
    ent thread followplayer(self);
    for (i = 0; i < num; i++) {
        angle = i * baseangle;
        offsetx = dist * cos(angle);
        offsety = dist * sin(angle);
        model = spawn("script_model", self.origin + (offsetx, offsety, 0));
        model setmodel("me_decor_barrels_01_yellow_black_01");
        model linkto(ent);
    }
}

// Namespace namespace_24a69f02d9272cd/namespace_26afdfc219469a1e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16c2
// Size: 0x41
function function_e3f27c4c28aff30f() {
    while (1) {
        self rotateyaw(360, 3);
        wait(3);
        level.player setclientomnvar("ui_hide_hud", 1);
        level.player thread dropgrenade();
    }
}

// Namespace namespace_24a69f02d9272cd/namespace_26afdfc219469a1e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x170a
// Size: 0x66
function dropgrenade() {
    var_e020078567e41613 = magicgrenademanual("frag_grenade_mp", level.player.origin + (0, 0, 9), (randomint(30) - 30, randomint(30) - 30, 45));
    wait(0.75);
    var_e020078567e41613 detonate(level.player);
}

// Namespace namespace_24a69f02d9272cd/namespace_26afdfc219469a1e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1777
// Size: 0x29
function followplayer(player) {
    while (1) {
        self.origin = player.origin;
        waitframe();
    }
}

// Namespace namespace_24a69f02d9272cd/namespace_26afdfc219469a1e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x17a7
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
            println("time_limit_reached" + var_965ef52941de8769.index + "<unknown string>" + var_965ef52941de8769.totalscore);
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

// Namespace namespace_24a69f02d9272cd/namespace_26afdfc219469a1e
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x192a
// Size: 0x41
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    namespace_310ba947928891df::oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
}

// Namespace namespace_24a69f02d9272cd/namespace_26afdfc219469a1e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1972
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

// Namespace namespace_24a69f02d9272cd/namespace_26afdfc219469a1e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19cc
// Size: 0xe8
function function_8469a5927d069db7() {
    /#
        self endon("<unknown string>");
        while (1) {
            if (getdvarint(@"hash_46a6b424af6acbc2") != 0) {
                points = getdvarint(@"hash_46a6b424af6acbc2");
                if (points == -1) {
                    points = getdvarint(@"hash_f20234a548c56c11") - 1;
                }
                namespace_e8a49b70d0769b66::giveteamscoreforobjective("<unknown string>", points, 0);
                break;
            } else if (getdvarint(@"hash_86e14326e43c0115") != 0) {
                points = getdvarint(@"hash_86e14326e43c0115");
                if (points == -1) {
                    points = getdvarint(@"hash_f20234a548c56c11") - 1;
                }
                namespace_e8a49b70d0769b66::giveteamscoreforobjective("<unknown string>", points, 0);
                break;
            }
            wait(1);
        }
        setdevdvar(@"hash_46a6b424af6acbc2", 0);
        setdevdvar(@"hash_86e14326e43c0115", 0);
        thread function_8469a5927d069db7();
    #/
}

// Namespace namespace_24a69f02d9272cd/namespace_26afdfc219469a1e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1abb
// Size: 0x1f9
function function_bf2918399f1800b1() {
    /#
        wait(5);
        ents = getentarray("<unknown string>", "<unknown string>");
        foreach (ent in ents) {
            thread namespace_d028276791d9cff6::drawsphere(ent.origin, 64, 1000, (0, 1, 0));
        }
        ents = getentarray("<unknown string>", "<unknown string>");
        foreach (ent in ents) {
            thread namespace_d028276791d9cff6::drawsphere(ent.origin, 64, 1000, (0, 1, 0));
        }
        structs = getstructarray("<unknown string>", "<unknown string>");
        foreach (struct in structs) {
            thread namespace_d028276791d9cff6::drawsphere(struct.origin, 64, 1000, (0, 1, 0));
        }
        structs = getstructarray("<unknown string>", "<unknown string>");
        foreach (struct in structs) {
            thread namespace_d028276791d9cff6::drawsphere(struct.origin, 64, 1000, (0, 1, 0));
        }
    #/
}

// Namespace namespace_24a69f02d9272cd/namespace_26afdfc219469a1e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cbb
// Size: 0x19b
function tdmanywhere_debugshowlocs() {
    thread namespace_d028276791d9cff6::drawsphere(level.mapcenter, 128, 100, (0, 1, 0));
    if (!isdefined(level.tdmanywherefrontline)) {
        waitframe();
    }
    var_cc015915d647fbdf = level.tdmanywherefrontline.anchordir * level.tdmanywhere_distoffset;
    var_c1d9d45c8845eb82 = level.tdmanywherefrontline.anchorrt * level.tdmanywhere_perpenoffset;
    thread namespace_d028276791d9cff6::drawline(level.mapcenter, level.mapcenter + var_cc015915d647fbdf, 1000, (1, 0, 0));
    thread namespace_d028276791d9cff6::drawline(level.mapcenter, level.mapcenter - var_cc015915d647fbdf, 1000, (1, 0, 0));
    thread namespace_d028276791d9cff6::drawline(level.mapcenter + var_cc015915d647fbdf, level.mapcenter + var_cc015915d647fbdf + var_c1d9d45c8845eb82, 1000, (0, 0, 1));
    thread namespace_d028276791d9cff6::drawline(level.mapcenter + var_cc015915d647fbdf, level.mapcenter + var_cc015915d647fbdf - var_c1d9d45c8845eb82, 1000, (0, 0, 1));
    thread namespace_d028276791d9cff6::drawline(level.mapcenter - var_cc015915d647fbdf, level.mapcenter - var_cc015915d647fbdf + var_c1d9d45c8845eb82, 1000, (0, 0, 1));
    thread namespace_d028276791d9cff6::drawline(level.mapcenter - var_cc015915d647fbdf, level.mapcenter - var_cc015915d647fbdf - var_c1d9d45c8845eb82, 1000, (0, 0, 1));
}

// Namespace namespace_24a69f02d9272cd/namespace_26afdfc219469a1e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e5d
// Size: 0x419
function monitorhotfoot() {
    level endon("game_ended");
    level.outlinedplayers = [];
    level.hotfootabsloops = 0;
    timepassed = 0;
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    while (1) {
        foreach (player in level.players) {
            if (!isdefined(player.hotfootlastposition)) {
                player.hotfootdisttraveledsq = 0;
                player.hotfootlastposition = player.origin;
                player.abshotfootlastposition = player.origin;
            }
            player.hotfootdisttraveledsq = player.hotfootdisttraveledsq + distancesquared(player.hotfootlastposition, player.origin);
            player.hotfootlastposition = player.origin;
        }
        timepassed = timepassed + level.framedurationseconds;
        if (timepassed > 3) {
            if (level.hotfootabsloops >= 2) {
                level.hotfootabsloops = 0;
                foreach (player in level.players) {
                    if (!isdefined(player.abshotfootlastposition)) {
                        player.abshotfootlastposition = player.origin;
                    }
                    player.forceabshotfoot = distancesquared(player.abshotfootlastposition, player.origin) < 4225;
                    player.abshotfootlastposition = player.origin;
                }
            }
            foreach (player in level.players) {
                entnum = player getentitynumber();
                var_ac6ca28a64718193 = player.pers["team"];
                if (var_ac6ca28a64718193 == "allies") {
                    enemyteam = "axis";
                } else {
                    enemyteam = "allies";
                }
                if (isalive(player) && (istrue(player.forceabshotfoot) || player.hotfootdisttraveledsq < 4225 && !istrue(player.hotfootreset))) {
                    /#
                        if (istrue(player.forceabshotfoot)) {
                            player iprintlnbold("<unknown string>");
                        } else {
                            player iprintlnbold("<unknown string>");
                        }
                    #/
                    player.forceabshotfoot = 0;
                    if (!isdefined(level.outlinedplayers[entnum])) {
                        level.outlinedplayers[entnum] = player;
                        player.outlineidfriend = outlineenableforteam(player, var_ac6ca28a64718193, "outline_nodepth_orange", "level_script");
                        player.outlineidenemy = outlineenableforteam(player, enemyteam, "outline_nodepth_red", "level_script");
                        player namespace_cbd3754a0c69cc63::_hudoutlineviewmodelenable("outlinefill_nodepth_orange", 0);
                    }
                } else {
                    if (isalive(player)) {
                        player.hotfootreset = 0;
                    }
                    player.forceabshotfoot = 0;
                    if (isdefined(level.outlinedplayers[entnum])) {
                        outlinedisable(player.outlineidfriend, player);
                        outlinedisable(player.outlineidenemy, player);
                        player namespace_cbd3754a0c69cc63::_hudoutlineviewmodeldisable();
                        player.outlineidfriend = undefined;
                        player.outlineidenemy = undefined;
                        level.outlinedplayers[entnum] = undefined;
                    }
                }
                player.hotfootdisttraveledsq = 0;
            }
            timepassed = 0;
        }
        level.hotfootabsloops++;
        waitframe();
    }
}

// Namespace namespace_24a69f02d9272cd/namespace_26afdfc219469a1e
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x227d
// Size: 0xc0
function onhotfootplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    entnum = self getentitynumber();
    if (isdefined(level.outlinedplayers[entnum])) {
        outlinedisable(self.outlineidfriend, self);
        outlinedisable(self.outlineidenemy, self);
        self.outlineidfriend = undefined;
        self.outlineidenemy = undefined;
        level.outlinedplayers[entnum] = undefined;
    }
    self.hotfootreset = 1;
}

// Namespace namespace_24a69f02d9272cd/namespace_26afdfc219469a1e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2344
// Size: 0x4f
function shouldgamelobbyremainintact() {
    axisscore = int(game["teamScores"]["axis"]);
    alliesscore = int(game["teamScores"]["allies"]);
    var_f9c7aae8c6acd600 = axisscore - alliesscore;
    return var_f9c7aae8c6acd600 < 10;
}

