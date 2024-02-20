// mwiii decomp prototype
#using scripts\mp\trials\trial_utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\trials\mp_trials_patches.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\cp_mp\parachute.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\trials\trial_enemy_sentry_turret.gsc;
#using scripts\mp\compass.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\mp\menus.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\dialog.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\utility\outline.gsc;

#namespace trial;

// Namespace trial/namespace_316a67d5fbb372aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8ee
// Size: 0x7b3
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    flag_init("strike_init_done");
    trial_mission_data_init();
    trial_retrieve_persistent_values();
    namespace_f6027de4091ac1ae::init_trial_patches();
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    if (isusingmatchrulesdata()) {
        setcommonrulesfrommatchrulesdata();
    } else {
        setdynamicdvar(@"hash_127490a7577f169f", 0);
        setdynamicdvar(@"hash_a54edeed7c5b587f", 0);
    }
    if (issubstr(getdvar(@"hash_687fb8f9b7a23245"), "mp_t_")) {
        setdvar(@"hash_2a4effcaf5954d38", 0);
    }
    if (getdvar(@"hash_a1767cfd7ede043b") == "1") {
        setdvar(@"hash_4d8ed5d95d54900a", 1);
    } else {
        setdvar(@"hash_ec7061888c9ec27f", 1);
    }
    setdvar(@"hash_84bca47b0009d424", 0);
    setdvar(@"hash_704afe6f6c582ee0", 0);
    setdvar(@"hash_da33635b62d4e5b3", 0);
    setdvar(@"hash_9a6a321c990cec4e", 0);
    /#
        setdvar(@"hash_3f36284b49b3d7a", 0);
    #/
    allowed = [];
    allowed[allowed.size] = level.gametype;
    allowed[allowed.size] = "trial_variant_" + level.trial["variant"];
    allowed[allowed.size] = "trial_mission_" + level.trial["missionScript"];
    allowed[allowed.size] = "t_variant_" + level.trial["variant"];
    allowed[allowed.size] = "t_mission_" + level.trial["missionScript"];
    if (trial_is_event()) {
        allowed[allowed.size] = "t_event";
    }
    switch (level.trial["missionScript"]) {
    case #"hash_5dfce04e1af9553":
    case #"hash_20d4a490009a1ff8":
        allowed[allowed.size] = "arm";
        break;
    default:
        break;
    }
    level.allowed_gametypes = allowed;
    namespace_19b4203b51d56488::main(allowed);
    namespace_cd0b2d039510b38d::registerroundswitchdvar(level.gametype, 0, 0, 9);
    namespace_cd0b2d039510b38d::registertimelimitdvar(level.gametype, 0);
    namespace_cd0b2d039510b38d::registerscorelimitdvar(level.gametype, 0);
    namespace_cd0b2d039510b38d::registerroundlimitdvar(level.gametype, 1);
    namespace_cd0b2d039510b38d::registerwinlimitdvar(level.gametype, 1);
    namespace_cd0b2d039510b38d::registernumlivesdvar(level.gametype, 0);
    namespace_cd0b2d039510b38d::registerhalftimedvar(level.gametype, 0);
    setspecialloadout();
    namespace_310ba947928891df::updatecommongametypedvars();
    namespace_5078ee98abb32db9::initparachutedvars();
    level.supportintel = 0;
    level.supportnuke = 0;
    level.disablespawncamera = 1;
    level.teambased = 1;
    level.challengesallowed = 0;
    level.getspawnpoint = &getspawnpoint;
    level.onplayerconnect = &onplayerconnect;
    level.bypassclasschoicefunc = &namespace_d19129e4fa5d176::alwaysgamemodeclass;
    level.endgame = &trialendgame;
    if (level.scripted_spawner_func.size) {
        level.starttime = 0;
        while (!isdefined(level.struct_class_names)) {
            waitframe();
        }
        foreach (index, func in level.scripted_spawner_func) {
            [[ func ]](1, "cs" + index);
        }
        foreach (struct in level.cs_object_container) {
            foreach (object in struct.objects) {
                if (isent(object) && isdefined(object.struct.script_gameobjectname)) {
                    var_265d16014b56096d = 0;
                    foreach (name in allowed) {
                        if (object.struct.script_gameobjectname == name) {
                            var_265d16014b56096d = 1;
                        }
                    }
                    if (!var_265d16014b56096d) {
                        object delete();
                    }
                }
            }
        }
    }
    while (!isdefined(level.trial_missionscript_init_funcs)) {
        waitframe();
    }
    if (isdefined(level.trial["triggeredTrialName"])) {
        switch (level.trial["missionScript"]) {
        case #"hash_3303663b5c9c9d6c":
        case #"hash_fb5b5e6c07253005":
            thread [[ level.trial_missionscript_init_funcs["gun"] ]](level.trial["triggeredTrialName"]);
            break;
        case #"hash_e9d9fcb8daba8602":
            thread [[ level.trial_missionscript_init_funcs["clear"] ]]();
            break;
        case #"hash_6191aaef9f922f96":
            thread [[ level.trial_missionscript_init_funcs["sniper"] ]](level.trial["triggeredTrialName"]);
            break;
        case #"hash_c2e89d8135aae861":
            thread [[ level.trial_missionscript_init_funcs["gunslinger"] ]]();
            break;
        case #"hash_6d20826c437003d8":
            thread [[ level.trial_missionscript_init_funcs["tdm"] ]]();
            break;
        default:
            break;
        }
    } else {
        switch (level.trial["missionScript"]) {
        case #"hash_3303663b5c9c9d6c":
        case #"hash_fb5b5e6c07253005":
            thread [[ level.trial_missionscript_init_funcs["gun"] ]]();
            break;
        case #"hash_e9d9fcb8daba8602":
            thread [[ level.trial_missionscript_init_funcs["clear"] ]]();
            break;
        case #"hash_6191aaef9f922f96":
            thread [[ level.trial_missionscript_init_funcs["sniper"] ]]();
            break;
        case #"hash_9196025f8ae8e51e":
            thread [[ level.trial_missionscript_init_funcs["jugg"] ]]();
            break;
        case #"hash_aae08c3a072df6bb":
            thread [[ level.trial_missionscript_init_funcs["lava"] ]]();
            break;
        case #"hash_9cda66e2792cde2a":
            thread [[ level.trial_missionscript_init_funcs["pitcher"] ]]();
            break;
        case #"hash_c2e89d8135aae861":
            thread [[ level.trial_missionscript_init_funcs["gunslinger"] ]]();
            break;
        case #"hash_20d4a490009a1ff8":
            thread [[ level.trial_missionscript_init_funcs["race"] ]]();
            break;
        case #"hash_5dfce04e1af9553":
            thread [[ level.trial_missionscript_init_funcs["arm_course"] ]]();
            break;
        default:
            break;
        }
    }
    namespace_9f25beb31a159a16::init();
    if (level.trial["compassMaterialOverride"] != "") {
        waitframe();
        namespace_3e528bdeb387613a::setupminimap(level.trial["compassMaterialOverride"]);
    }
    /#
        function_2e9e80d411685c12();
    #/
}

// Namespace trial/namespace_316a67d5fbb372aa
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10a8
// Size: 0xa0
function trialendgame(winner, endreasontext) {
    level notify("exitLevel_called");
    processlobbydata();
    if (isdefined(level.trial_dlog_func)) {
        [[ level.trial_dlog_func ]]();
    }
    if (getomnvar("ui_trial_reward_tier") >= 1) {
        setomnvar("ui_trial_reward_received", 1);
        setomnvar("ui_trial_failed", 0);
        if (getdvar(@"hash_a1767cfd7ede043b") != "1") {
            wait(0.1);
            level.player openmenu("RoundEndTeamHud");
            wait(3);
        }
    }
    exitlevel(0);
}

// Namespace trial/namespace_316a67d5fbb372aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x114f
// Size: 0x3b7
function trial_mission_data_init() {
    var_6fed165ac80bc702 = trial_fetch_mission_table();
    /#
        assert(tableexists(var_6fed165ac80bc702));
    #/
    missionid = getdvarint(@"hash_b93f834a6e6a8b21", 0);
    if (missionid == 0) {
        var_6ae64d9896aef8f2 = tablelookup(var_6fed165ac80bc702, 2, getdvar(@"hash_687fb8f9b7a23245"), 0);
        if (var_6ae64d9896aef8f2 != "") {
            /#
                println("ui_trial_reward_received" + var_6ae64d9896aef8f2 + "assault" + getdvar(@"hash_687fb8f9b7a23245"));
            #/
            missionid = var_6ae64d9896aef8f2;
        } else {
            /#
                assertmsg("ui_trial_mission_id omnvar unspecified. Cannot fallback to a mission because no mission is registered for " + getdvar(@"hash_687fb8f9b7a23245") + ". Can't initialize mission!");
            #/
            return;
        }
    }
    level.trial["missionID"] = int(missionid);
    level.trial["zone"] = tablelookup(var_6fed165ac80bc702, 0, level.trial["missionID"], 2);
    level.trial["missionScript"] = tablelookup(var_6fed165ac80bc702, 0, level.trial["missionID"], 3);
    level.trial["variant"] = tablelookup(var_6fed165ac80bc702, 0, level.trial["missionID"], 4);
    level.trial["team"] = tablelookup(var_6fed165ac80bc702, 0, level.trial["missionID"], 5);
    level.trial["scoreType"] = tablelookup(var_6fed165ac80bc702, 0, level.trial["missionID"], 6);
    level.trial["tier1"] = int(tablelookup(var_6fed165ac80bc702, 0, level.trial["missionID"], 8));
    level.trial["tier2"] = int(tablelookup(var_6fed165ac80bc702, 0, level.trial["missionID"], 9));
    level.trial["tier3"] = int(tablelookup(var_6fed165ac80bc702, 0, level.trial["missionID"], 10));
    level.trial["attempts"] = int(tablelookup(var_6fed165ac80bc702, 0, level.trial["missionID"], 11));
    level.trial["compassMaterialOverride"] = tablelookup(var_6fed165ac80bc702, 0, level.trial["missionID"], 18);
    level.trial["playerDataId"] = int(tablelookup(var_6fed165ac80bc702, 0, level.trial["missionID"], 20));
    if (level.trial["zone"] != getdvar(@"hash_687fb8f9b7a23245")) {
        /#
            assertmsg("Incorrect map, " + getdvar(@"hash_687fb8f9b7a23245") + ", launched for mission ID " + level.trial["missionID"] + ". Expected " + level.trial["zone"] + "!");
        #/
    }
    setomnvar("ui_trial_mission_score_is_time", level.trial["scoreType"] == "time");
    setomnvar("ui_trial_mission_id", level.trial["missionID"]);
    setomnvar("ui_trial_mission_player_data_id", level.trial["playerDataId"]);
    setomnvar("ui_trial_tier_1_requirement", level.trial["tier1"]);
    setomnvar("ui_trial_tier_2_requirement", level.trial["tier2"]);
    setomnvar("ui_trial_tier_3_requirement", level.trial["tier3"]);
}

// Namespace trial/namespace_316a67d5fbb372aa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x150d
// Size: 0x3a6
function function_72965bdb36677ee9(missionid) {
    var_6fed165ac80bc702 = trial_fetch_mission_table();
    /#
        assert(tableexists(var_6fed165ac80bc702));
    #/
    if (missionid == 0) {
        var_6ae64d9896aef8f2 = tablelookup(var_6fed165ac80bc702, 2, getdvar(@"hash_687fb8f9b7a23245"), 0);
        if (var_6ae64d9896aef8f2 != "") {
            /#
                println("ui_trial_reward_received" + var_6ae64d9896aef8f2 + "assault" + getdvar(@"hash_687fb8f9b7a23245"));
            #/
            missionid = var_6ae64d9896aef8f2;
        } else {
            /#
                assertmsg("ui_trial_mission_id omnvar unspecified. Cannot fallback to a mission because no mission is registered for " + getdvar(@"hash_687fb8f9b7a23245") + ". Can't initialize mission!");
            #/
            return;
        }
    }
    level.trial["missionID"] = int(missionid);
    level.trial["zone"] = tablelookup(var_6fed165ac80bc702, 0, level.trial["missionID"], 2);
    level.trial["missionScript"] = tablelookup(var_6fed165ac80bc702, 0, level.trial["missionID"], 3);
    level.trial["variant"] = tablelookup(var_6fed165ac80bc702, 0, level.trial["missionID"], 4);
    level.trial["team"] = tablelookup(var_6fed165ac80bc702, 0, level.trial["missionID"], 5);
    level.trial["scoreType"] = tablelookup(var_6fed165ac80bc702, 0, level.trial["missionID"], 6);
    level.trial["tier1"] = int(tablelookup(var_6fed165ac80bc702, 0, level.trial["missionID"], 8));
    level.trial["tier2"] = int(tablelookup(var_6fed165ac80bc702, 0, level.trial["missionID"], 9));
    level.trial["tier3"] = int(tablelookup(var_6fed165ac80bc702, 0, level.trial["missionID"], 10));
    level.trial["attempts"] = int(tablelookup(var_6fed165ac80bc702, 0, level.trial["missionID"], 11));
    level.trial["compassMaterialOverride"] = tablelookup(var_6fed165ac80bc702, 0, level.trial["missionID"], 18);
    level.trial["playerDataId"] = int(tablelookup(var_6fed165ac80bc702, 0, level.trial["missionID"], 20));
    if (level.trial["zone"] != getdvar(@"hash_687fb8f9b7a23245")) {
        /#
            assertmsg("Incorrect map, " + getdvar(@"hash_687fb8f9b7a23245") + ", launched for mission ID " + level.trial["missionID"] + ". Expected " + level.trial["zone"] + "!");
        #/
    }
    setomnvar("ui_trial_mission_score_is_time", level.trial["scoreType"] == "time");
    setomnvar("ui_trial_mission_id", level.trial["missionID"]);
    setomnvar("ui_trial_mission_player_data_id", level.trial["playerDataId"]);
    setomnvar("ui_trial_tier_1_requirement", level.trial["tier1"]);
    setomnvar("ui_trial_tier_2_requirement", level.trial["tier2"]);
    setomnvar("ui_trial_tier_3_requirement", level.trial["tier3"]);
}

// Namespace trial/namespace_316a67d5fbb372aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18ba
// Size: 0xc9
function getspawnpoint() {
    while (istrue(level.trial_spawn_wait)) {
        waitframe();
    }
    spawnpointname = "mp_trial_spawn";
    spawnpoints = namespace_b2d5aa2baf2b5701::getspawnpointarray(spawnpointname);
    /#
        assert(spawnpoints.size);
    #/
    spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint_startspawn(spawnpoints);
    if (isdefined(level.trial_spawn_vehicle)) {
        seat = namespace_1fbd40990ee60ede::function_d3d95972f58ad2bc(level.trial_spawn_vehicle);
        data = spawnstruct();
        data.useonspawn = 1;
        data.enterstartwaitmsg = "spawned_player";
        thread namespace_1fbd40990ee60ede::vehicle_occupancy_enter(level.trial_spawn_vehicle, seat, self, data);
        self.spawningintovehicle = 1;
    }
    return spawnpoint;
}

// Namespace trial/namespace_316a67d5fbb372aa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x198b
// Size: 0x1d8
function onplayerconnect(player) {
    if (utility::function_d5d0823d606a2a6e("tdm")) {
        if (isbot(player)) {
            return;
        }
    }
    player thread namespace_e5ed2f5a5ee8410e::addtoteam(level.trial["team"]);
    level.teamdata["allies"]["soundInfix"] = "uk";
    level.teamdata["axis"]["soundInfix"] = "ru";
    player namespace_d19129e4fa5d176::function_a16868d4dcd81a4b();
    player setclientomnvar("ui_total_fade", 1);
    if (isdefined(level.trial_map_loadout)) {
        player.pers["gamemodeLoadout"] = level.trial_map_loadout;
    } else {
        player.pers["gamemodeLoadout"] = level.trial_loadout["axis"];
    }
    if (istrue(level.trial_infinite_reserve_ammo)) {
        player thread infinite_reserve_ammo();
    }
    thread trial_weapon_spawn();
    level waittill("player_spawned");
    if (level.players.size > 1) {
        /#
            println("trial_end_tier_3");
        #/
        exitlevel(0);
    }
    level.player namespace_d20f8ef223912e12::playerexecutionsdisable();
    wait(1);
    thread namespace_36f464722d326bbe::fadetoblackforplayer(player, 0, 0.5);
    if (game["trial"]["tries_remaining"] < level.trial["attempts"]) {
        player namespace_944ddf7b8df1b0e3::leaderdialogonplayer("trial_retry");
    } else if (getdvar(@"hash_687fb8f9b7a23245") == getdvar(@"hash_3ff42928b2b7f8e5", "")) {
        player namespace_944ddf7b8df1b0e3::leaderdialogonplayer("trial_intro_short");
    } else {
        player namespace_944ddf7b8df1b0e3::leaderdialogonplayer("trial_intro");
    }
    setdvar(@"hash_3ff42928b2b7f8e5", getdvar(@"hash_687fb8f9b7a23245"));
    thread trial_restart_watcher();
}

// Namespace trial/namespace_316a67d5fbb372aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b6a
// Size: 0x3da
function setspecialloadout() {
    level.trial_loadout["axis"]["loadoutPrimary"] = "iw9_me_fists";
    level.trial_loadout["axis"]["loadoutPrimaryAttachment"] = "none";
    level.trial_loadout["axis"]["loadoutPrimaryAttachment2"] = "none";
    level.trial_loadout["axis"]["loadoutPrimaryCamo"] = "none";
    level.trial_loadout["axis"]["loadoutPrimaryReticle"] = "none";
    level.trial_loadout["axis"]["loadoutSecondary"] = "none";
    level.trial_loadout["axis"]["loadoutSecondaryAttachment"] = "none";
    level.trial_loadout["axis"]["loadoutSecondaryAttachment2"] = "none";
    level.trial_loadout["axis"]["loadoutSecondaryCamo"] = "none";
    level.trial_loadout["axis"]["loadoutSecondaryReticle"] = "none";
    level.trial_loadout["axis"]["loadoutEquipment"] = "specialty_null";
    level.trial_loadout["axis"]["loadoutOffhand"] = "none";
    level.trial_loadout["axis"]["loadoutStreakType"] = "assault";
    level.trial_loadout["axis"]["loadoutKillstreak1"] = "none";
    level.trial_loadout["axis"]["loadoutKillstreak2"] = "none";
    level.trial_loadout["axis"]["loadoutKillstreak3"] = "none";
    level.trial_loadout["axis"]["loadoutPerks"] = [];
    level.trial_loadout["axis"]["loadoutGesture"] = "playerData";
    var_9309e04671262786 = getent("trial_starting_weapon", "script_noteworthy");
    var_226dd676a3cf59cb = getent("trial_starting_weapon_2", "script_noteworthy");
    if (isdefined(var_9309e04671262786)) {
        var_5660bee41c94af5f = strtok(var_9309e04671262786.script_parameters, "+");
        var_51b7953d0e3a6f82 = var_5660bee41c94af5f[0];
        var_116a551dc9d3c305 = array_remove(var_5660bee41c94af5f, var_51b7953d0e3a6f82);
        level.trial_loadout["axis"]["loadoutPrimary"] = var_51b7953d0e3a6f82;
        foreach (i, attachment in var_116a551dc9d3c305) {
            if (!i) {
                level.trial_loadout["axis"]["loadoutPrimaryAttachment"] = attachment;
            } else {
                key = "loadoutPrimaryAttachment" + i + 1;
                level.trial_loadout["axis"][key] = attachment;
            }
        }
    }
    if (isdefined(var_226dd676a3cf59cb)) {
        var_5660bee41c94af5f = strtok(var_226dd676a3cf59cb.script_parameters, "+");
        var_51b7953d0e3a6f82 = var_5660bee41c94af5f[0];
        var_116a551dc9d3c305 = array_remove(var_5660bee41c94af5f, var_51b7953d0e3a6f82);
        level.trial_loadout["axis"]["loadoutSecondary"] = var_51b7953d0e3a6f82;
        foreach (i, attachment in var_116a551dc9d3c305) {
            if (!i) {
                level.trial_loadout["axis"]["loadoutSecondaryAttachment"] = attachment;
            } else {
                key = "loadoutSecondaryAttachment" + i + 1;
                level.trial_loadout["axis"][key] = attachment;
            }
        }
    }
    level.trial_loadout["allies"] = level.trial_loadout["axis"];
}

// Namespace trial/namespace_316a67d5fbb372aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f4b
// Size: 0x31
function infinite_reserve_ammo() {
    level endon("game_ended");
    self endon("disconnect");
    while (1) {
        self waittill("reload");
        self givemaxammo(self.currentprimaryweapon);
    }
}

// Namespace trial/namespace_316a67d5fbb372aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f83
// Size: 0x197
function trial_weapon_spawn() {
    level.trial_weapons = getentarray("trial_weapon", "targetname");
    level.trial_akimbo_props = getentarray("trial_weapon_akimbo_prop", "targetname");
    while (!isdefined(level.weaponmapdata)) {
        waitframe();
    }
    waitframe();
    foreach (weapon in level.trial_weapons) {
        weapon thread weapon_think();
    }
    /#
        var_89e9f545fb8c88c1 = tablelookup(trial_fetch_mission_table(), 0, level.trial["<unknown string>"], 1);
        if (var_89e9f545fb8c88c1 == "<unknown string>") {
            println("<unknown string>");
        } else {
            println("<unknown string>");
            println("<unknown string>");
            print(var_89e9f545fb8c88c1);
            foreach (weap in level.trial_weapons) {
                if (isdefined(weap.spawned_weapon)) {
                    str = getsubstr(weap.spawned_weapon.classname, 7);
                    print("<unknown string>" + str);
                }
            }
            println("<unknown string>");
        }
    #/
}

// Namespace trial/namespace_316a67d5fbb372aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2121
// Size: 0x390
function weapon_think() {
    level.player endon("death");
    var_5660bee41c94af5f = strtok(self.script_parameters, "+");
    var_51b7953d0e3a6f82 = var_5660bee41c94af5f[0];
    var_116a551dc9d3c305 = array_remove(var_5660bee41c94af5f, var_51b7953d0e3a6f82);
    var_11a1fa68aeb971c0 = namespace_36f464722d326bbe::function_d2d2b803a7b741a4();
    basename = namespace_e0ee43ef2dddadaa::weaponassetnamemap(var_51b7953d0e3a6f82);
    var_a7408dbfed49f3f9 = makeweapon(basename);
    var_98a8134515df9081 = [];
    var_a1ae8ff6d228344d = 0;
    foreach (a in var_116a551dc9d3c305) {
        if (var_a7408dbfed49f3f9 canuseattachment(a)) {
            if (a == "akimbo") {
                var_a1ae8ff6d228344d = 1;
            }
            var_98a8134515df9081[var_98a8134515df9081.size] = a;
        } else {
            /#
                assertmsg("Invalid attachment: " + a + " found for weapon: " + basename);
            #/
        }
    }
    var_116a551dc9d3c305 = var_98a8134515df9081;
    var_91c18f9d87634d94 = namespace_e0ee43ef2dddadaa::buildweapon(var_51b7953d0e3a6f82, var_116a551dc9d3c305, "none", "none", -1, undefined, undefined, undefined, var_11a1fa68aeb971c0);
    weapon_name = getcompleteweaponname(var_91c18f9d87634d94);
    if (var_a1ae8ff6d228344d) {
        thread weapon_akimbo_prop_think(weapon_name);
    }
    while (!isdefined(level.player.primaryinventory[0])) {
        waitframe();
    }
    while (1) {
        var_caf3a434dc6e3312 = 0;
        var_caf3a534dc6e3545 = 0;
        if (isdefined(level.player.primaryinventory[0])) {
            var_caf3a434dc6e3312 = weapon_name == getcompleteweaponname(level.player.primaryinventory[0]);
        }
        if (isdefined(level.player.primaryinventory[1])) {
            var_caf3a534dc6e3545 = weapon_name == getcompleteweaponname(level.player.primaryinventory[1]);
        }
        if (!isdefined(self.spawned_weapon) && !var_caf3a434dc6e3312 && !var_caf3a534dc6e3545) {
            self.spawned_weapon = spawn("weapon_" + weapon_name, self.origin, 17);
            self.spawned_weapon.angles = self.angles;
            clip_ammo = weaponclipsize(var_91c18f9d87634d94);
            var_59cf20581d014f8e = weaponmaxammo(var_91c18f9d87634d94);
            if (isdefined(self.script_noteworthy)) {
                if (self.script_noteworthy == "outline") {
                    namespace_cbd3754a0c69cc63::outlineenableforplayer(self.spawned_weapon, level.player, "outline_trial_item", "level_script");
                } else if (self.script_noteworthy == "osp") {
                    namespace_cbd3754a0c69cc63::outlineenableforplayer(self.spawned_weapon, level.player, "outlinefill_nodepth_cyan", "level_script");
                    var_59cf20581d014f8e = 0;
                }
            }
            if (var_a1ae8ff6d228344d) {
                clip_ammo = 0;
            }
            if (istrue(level.player_limitedammo)) {
                var_59cf20581d014f8e = level.enemiestotal - clip_ammo;
            }
            self.spawned_weapon itemweaponsetammo(clip_ammo, var_59cf20581d014f8e);
        }
        objweapon = var_47dcfbc98e2103ee = level.player waittill("weapon_dropped");
        if (isdefined(var_47dcfbc98e2103ee) && isdefined(objweapon) && getcompleteweaponname(objweapon) == weapon_name) {
            var_47dcfbc98e2103ee delete();
        }
    }
}

// Namespace trial/namespace_316a67d5fbb372aa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x24b8
// Size: 0x15e
function weapon_akimbo_prop_think(weapon_name) {
    foreach (prop in level.trial_akimbo_props) {
        if (prop.script_parameters == self.script_parameters) {
            self.akimbo_prop = prop;
        }
    }
    while (isdefined(self.akimbo_prop)) {
        while (!isdefined(self.spawned_weapon)) {
            waitframe();
        }
        self.akimbo_prop.spawned_prop = spawn("weapon_" + weapon_name, self.akimbo_prop.origin, 17);
        self.akimbo_prop.spawned_prop.angles = self.akimbo_prop.angles;
        self.akimbo_prop.spawned_prop sethintinoperable(1);
        while (isdefined(self.spawned_weapon)) {
            waitframe();
        }
        if (isdefined(self.akimbo_prop.spawned_prop)) {
            self.akimbo_prop.spawned_prop delete();
        }
    }
}

// Namespace trial/namespace_316a67d5fbb372aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x261d
// Size: 0x14b
function trial_end_score_dialogue() {
    var_a14d1d7d5339e7fe = undefined;
    var_a14d1c7d5339e5cb = undefined;
    var_a14d1b7d5339e398 = undefined;
    var_76526f2b092d6a59 = getomnvar("ui_trial_main_score");
    var_f642a654edaf0a48 = getomnvar("ui_trial_main_time");
    if (var_76526f2b092d6a59 != -1) {
        var_a14d1d7d5339e7fe = var_76526f2b092d6a59 >= getomnvar("ui_trial_tier_1_requirement");
        var_a14d1c7d5339e5cb = var_76526f2b092d6a59 >= getomnvar("ui_trial_tier_2_requirement");
        var_a14d1b7d5339e398 = var_76526f2b092d6a59 >= getomnvar("ui_trial_tier_3_requirement");
    } else if (var_f642a654edaf0a48 != -1) {
        var_a14d1d7d5339e7fe = var_f642a654edaf0a48 <= getomnvar("ui_trial_tier_1_requirement");
        var_a14d1c7d5339e5cb = var_f642a654edaf0a48 <= getomnvar("ui_trial_tier_2_requirement");
        var_a14d1b7d5339e398 = var_f642a654edaf0a48 <= getomnvar("ui_trial_tier_3_requirement");
    }
    if (istrue(level.trial_fail_alt)) {
        level.trial_fail_alt = 0;
        dialog = "trial_end_tier_0_alt";
    } else if (var_a14d1b7d5339e398) {
        dialog = "trial_end_tier_3";
    } else if (var_a14d1c7d5339e5cb) {
        dialog = "trial_end_tier_2";
    } else if (var_a14d1d7d5339e7fe) {
        dialog = "trial_end_tier_1";
    } else {
        dialog = "trial_end_tier_0";
    }
    level.player namespace_944ddf7b8df1b0e3::leaderdialogonplayer(dialog);
    trial_ui_waittill_retry();
    if (!istrue(level.trial_restarting)) {
        level.player namespace_944ddf7b8df1b0e3::leaderdialogonplayer("trial_retry");
    }
}

// Namespace trial/namespace_316a67d5fbb372aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x276f
// Size: 0xde
function trial_retrieve_persistent_values() {
    if (!isdefined(game["trial"])) {
        game["trial"] = [];
    }
    if (!isdefined(game["trial"]["best_score"])) {
        game["trial"]["best_score"] = -1;
    }
    if (!isdefined(game["trial"]["best_time"])) {
        game["trial"]["best_time"] = -1;
    }
    if (!isdefined(game["trial"]["tries_remaining"])) {
        game["trial"]["tries_remaining"] = level.trial["attempts"];
    }
    setomnvar("ui_trial_best_score", int(game["trial"]["best_score"]));
    setomnvar("ui_trial_best_time", int(game["trial"]["best_time"]));
    setomnvar("ui_trial_tries_remaining", int(game["trial"]["tries_remaining"]));
}

// Namespace trial/namespace_316a67d5fbb372aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2854
// Size: 0x52
function trial_restart_watcher() {
    while (1) {
        msg = level.player waittill("luinotifyserver");
        if (msg == "trial_restart") {
            if (!isdefined(level.isinrewardflow) || !level.isinrewardflow) {
                trial_restart();
            }
        }
    }
}

// Namespace trial/namespace_316a67d5fbb372aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28ad
// Size: 0x48
function processlobbydata() {
    processlobbydataforclient(level.player);
    if (matchmakinggame() && !privatematch()) {
        setclientmatchdata("isPublicMatch", 1);
    } else {
        setclientmatchdata("isPublicMatch", 0);
    }
    sendclientmatchdata();
}

// Namespace trial/namespace_316a67d5fbb372aa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x28fc
// Size: 0x1ff
function processlobbydataforclient(player) {
    if (istrue(player.processlobbydataforclient)) {
        return;
    }
    player.processlobbydataforclient = 1;
    if (isdefined(player) && !isdefined(player.clientmatchdataid)) {
        player.clientmatchdataid = level.currentclientmatchdataid;
        level.currentclientmatchdataid++;
    }
    playername = player.name;
    setclientmatchdata("players", player.clientmatchdataid, "clanTag", player getclantag());
    setclientmatchdata("players", player.clientmatchdataid, "xuidHigh", player getxuidhigh());
    setclientmatchdata("players", player.clientmatchdataid, "xuidLow", player getxuidlow());
    setclientmatchdata("players", player.clientmatchdataid, "isBot", isbot(player));
    setclientmatchdata("players", player.clientmatchdataid, "uniqueClientId", player.clientid);
    setclientmatchdata("players", player.clientmatchdataid, "username", playername);
    if (player isps4player()) {
        setclientmatchdata("players", player.clientmatchdataid, "platform", "ps4");
    } else if (player isxb3player()) {
        setclientmatchdata("players", player.clientmatchdataid, "platform", "xb3");
    } else if (player ispcplayer()) {
        setclientmatchdata("players", player.clientmatchdataid, "platform", "bnet");
    } else {
        setclientmatchdata("players", player.clientmatchdataid, "platform", "none");
    }
    player setplayerdata("common", "round", "clientMatchIndex", player.clientmatchdataid);
}

// Namespace trial/namespace_316a67d5fbb372aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b02
// Size: 0xe
function function_2e9e80d411685c12() {
    /#
        thread function_c27ed1f1252188f8();
    #/
}

// Namespace trial/namespace_316a67d5fbb372aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b17
// Size: 0x4a
function function_c27ed1f1252188f8() {
    /#
        setdevdvarifuninitialized(@"hash_8b4dddca0bda590f", -1);
        while (1) {
            var_a16b1bfe5419bdd1 = getdvarint(@"hash_8b4dddca0bda590f", -1);
            if (var_a16b1bfe5419bdd1 != -1) {
                function_7bd94570d05ebf80(var_a16b1bfe5419bdd1);
            }
            waitframe();
        }
    #/
}

