// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using script_3b64eb40368c1450;
#using script_4c770a9a4ad7659c;
#using script_439fa02b5251fa5b;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\cp_mp\hostmigration.gsc;
#using scripts\common\anim.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\train_utility.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\cp_mp\killstreaks\helper_drone.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_282eb9d7fde0753e;
#using scripts\cp_mp\killstreaks\juggernaut.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using script_6bfe39bd5c12f84a;

#namespace airdrop;

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f84
// Size: 0xf4
function init() {
    if (issharedfuncdefined("airdrop", "init")) {
        [[ getsharedfunc("airdrop", "init") ]]();
    }
    level._effect["airdrop_crate_impact_ground"] = loadfx("vfx/iw9/killstreaks/smk_signal/vfx_carepkg_landing_dust.vfx");
    level._effect["airdrop_crate_impact_water"] = loadfx("vfx/iw9/killstreaks/smk_signal/vfx_carepkg_landing_water.vfx");
    level.carepackagedropnodes = getentarray("carepackage_drop_area", "targetname");
    initkillstreak();
    initheli();
    initcratedata();
    function_93512c08385359e1();
    function_27994695f48962e1();
    utility::function_7ae9075c73180af7(#"perk");
    if (issharedfuncdefined("airdrop", "airdropMultipleInit")) {
        [[ getsharedfunc("airdrop", "airdropMultipleInit") ]]();
    }
    if (issharedfuncdefined("airdrop", "airdropEscortInit")) {
        [[ getsharedfunc("airdrop", "airdropEscortInit") ]]();
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x207f
// Size: 0xb4
function initkillstreak() {
    /#
        setdevdvarifuninitialized(@"hash_c247993ede3808ca", "_request_response");
        setdevdvarifuninitialized(@"hash_22186e8d4f1020da", "_request_response");
        setdevdvarifuninitialized(@"hash_23ed746952207d2b", 1200);
        setdevdvarifuninitialized(@"hash_87413e0e6fc00a5f", 600);
        setdevdvarifuninitialized(@"hash_b2e9bf0017ceeeae", 0);
        setdevdvarifuninitialized(@"hash_7acaaf8f4063ab02", 0);
        setdevdvarifuninitialized(@"hash_a62fccdf77b23d67", 0);
        setdevdvarifuninitialized(@"hash_d15c22f57683add1", 1);
        setdevdvarifuninitialized(@"hash_d1c5f84bb717c57", 0);
        setdevdvarifuninitialized(@"hash_2f52ab5e0e1eac8b", 1);
    #/
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x213a
// Size: 0x33
function initheli() {
    level.littlebirds = [];
    if (issharedfuncdefined("airdrop", "registerScoreInfo")) {
        [[ getsharedfunc("airdrop", "registerScoreInfo") ]]();
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2174
// Size: 0x324
function initcratedata() {
    leveldata = spawnstruct();
    leveldata.configs = [];
    leveldata.crates = [];
    leveldata.usablecrates = [];
    level.cratedata = leveldata;
    level.cratedata.unresolvedcollisiontolerancesqr = pow(getdvarfloat(@"hash_a0cbf9e8d23fb12c", 2), 2);
    /#
        var_8f3ab761a14ddcdb = getentarray("airdrop_use", "entity");
        /#
            assertex(isdefined(var_8f3ab761a14ddcdb), "death");
        #/
        /#
            assertex(isdefined(var_8f3ab761a14ddcdb) && var_8f3ab761a14ddcdb.size <= 1, "killstreakSetDeathCallback");
        #/
    #/
    level.cratedata.mountmantlemodel = getent("care_package_col", "targetname");
    if (issharedfuncdefined("airdrop", "registerActionSet")) {
        [[ getsharedfunc("airdrop", "registerActionSet") ]]();
    }
    gametype = "mp";
    if (issharedfuncdefined("game", "getGameType")) {
        gametype = [[ getsharedfunc("game", "getGameType") ]]();
    }
    switch (gametype) {
    case #"hash_1a53256c17b7d2ee":
    case #"hash_7fb7ea2cb6529446":
    case #"hash_b7ddfbe1d0e2457a":
    case #"hash_c4f97a56da3b7cde":
    case #"hash_c636c850b4f608fd":
    case #"hash_dcb9324af7bb9f35":
        jumpiffalse(issharedfuncdefined("airdrop", "getGameModeSpecificCrateData")) LOC_0000015f;
        [[ getsharedfunc("airdrop", "getGameModeSpecificCrateData") ]]();
    case #"hash_bfabc434c59611fa":
    case #"hash_fa21c4f6bd5e3815":
    LOC_0000015f:
        initbattleroyalecratedata();
        initbattleroyaleloadoutcratedata();
        initbattleroyalec130airdropcratedata();
        initbattleroyalelootchoppercratedata();
        initbattleroyalejuggernautcratedata();
        function_19dc247eaaf9da8f();
        function_ddd270c88107faf9();
        function_56e93fd2282a71ce();
        break;
    case #"hash_ca6516c10db2c95":
    case #"hash_7f9c384a34cc392f":
        initarmcratedata();
        initkillstreakcratedata();
        initbattleroyalecratedata();
        function_c5c61b985836f974();
    case #"hash_b9458959b10637f8":
    case #"hash_dd5b900f435d3f36":
    case #"hash_ddd385f0a27d71bb":
        initdropzonekillstreakcratedata();
        function_c5c61b985836f974();
        break;
    case #"hash_c065cef60f38490a":
        function_a3299432ddb721e3();
        initkillstreakcratedata();
        function_c5c61b985836f974();
        break;
    default:
        initkillstreakcratedata();
        function_c5c61b985836f974();
        break;
    }
    if (issharedfuncdefined("airdrop", "getMapSpecificCrateData")) {
        [[ getsharedfunc("airdrop", "getMapSpecificCrateData") ]]();
    }
    initcratedropdata();
    if (getdvarint(@"hash_8061a7c1f39caf1e", 1)) {
        thread function_b6469ac2ab6f3dc6();
    } else if (issharedfuncdefined("game", "registerPlayerFrameUpdateCallback")) {
        [[ getsharedfunc("game", "registerPlayerFrameUpdateCallback") ]](&trackcratemantlingexploit);
    }
    thread watchallcrateusability();
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x249f
// Size: 0x4f
function function_93512c08385359e1() {
    level.var_27f78817b59dfe32 = "airdrop_placement";
    val::function_2d6e7e0b80767910(level.var_27f78817b59dfe32, [0:"offhand_weapons", 1:"melee", 2:"execution_attack", 3:"weapon_pickup", 4:"cp_munitions_pickup"]);
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24f5
// Size: 0x1c
function function_27994695f48962e1() {
    game["dialog"]["airdrop_use"] = "killstreak_remote_operator" + "_request_response";
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2518
// Size: 0x69
function getleveldata(cratetype) {
    /#
        assertex(isdefined(level.cratedata), "getLevelData() called before initCrateData().");
    #/
    leveldata = level.cratedata.configs[cratetype];
    if (!isdefined(leveldata)) {
        leveldata = getemptyleveldata();
        level.cratedata.configs[cratetype] = leveldata;
    }
    return leveldata;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2589
// Size: 0x27a
function getemptyleveldata() {
    leveldata = spawnstruct();
    leveldata.basemodel = "military_carepackage_03_mp";
    leveldata.halfheight = 27.5;
    leveldata.mountmantlemodel = getdefaultmountmantlemodel();
    leveldata.objweapon = nullweapon();
    leveldata.timeout = 90;
    leveldata.headiconoffset = 0;
    leveldata.headicondrawrange = 10000;
    leveldata.headiconnaturalrange = 400;
    leveldata.minimapicon = "hud_icon_minimap_killstreak_carepackage";
    leveldata.usetag = "tag_use";
    if (iscp()) {
        leveldata.usetag = "j_military_loot_crate_ui_01_lid";
    }
    leveldata.userange = 128;
    leveldata.breakuserangesqr = 30625;
    leveldata.usefov = 360;
    leveldata.usepriority = 0;
    leveldata.ownerusetime = 0.5;
    leveldata.otherusetime = 3;
    leveldata.friendlyuseonly = 0;
    leveldata.navobstaclebounds = (30, 10, 64);
    leveldata.navobstacleupdatedistsqr = 64;
    leveldata.dangerzoneheight = 1000;
    leveldata.dangerzoneradius = 128;
    leveldata.activatecallback = undefined;
    leveldata.deactivatecallback = undefined;
    leveldata.capturecallback = undefined;
    leveldata.rerollcallback = undefined;
    leveldata.destroycallback = undefined;
    leveldata.destroyoncapture = 1;
    leveldata.onecaptureperplayer = 0;
    leveldata.hasnointeraction = 0;
    leveldata.destroyvisualscallback = getdefaultdestroyvisualscallback();
    leveldata.destroyvisualsdeletiondelay = getdefaultdestroyvisualsdeletiondelay();
    leveldata.capturevisualscallback = getdefaultcapturevisualscallback();
    leveldata.capturevisualsdeletiondelay = getdefaultcapturevisualsdeletiondelay();
    leveldata.capturestring = "KILLSTREAKS_HINTS/CRATE_PICKUP";
    leveldata.rerollstring = "KILLSTREAKS_HINTS/UAV_REROLL";
    leveldata.headicon = "hud_icon_minimap_killstreak_carepackage";
    leveldata.supportsreroll = 0;
    leveldata.supportsownercapture = 1;
    leveldata.supportsothercapture = 1;
    return leveldata;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x280b
// Size: 0x22
function hasleveldata(cratetype) {
    return isdefined(level.cratedata.configs[cratetype]);
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params b, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2835
// Size: 0x546
function createcrate(owner, team, cratetype, position, angles, destination, hasnophysics, var_6244a1d5b282bb6c, data, skipminimapicon, markerposition) {
    /#
        assertex(hasleveldata(cratetype), "createCrate() called with an invalid crateType.");
    #/
    leveldata = getleveldata(cratetype);
    if (leveldata.supportsownercapture) {
        /#
            assertex(isdefined(owner), "createCrate() specifies ownerCapture but has no owner.");
        #/
    }
    if (leveldata.supportsreroll) {
        /#
            assertex(isdefined(owner), "createCrate() specifies supportsReroll but has no owner (only owners can reroll).");
        #/
    }
    crate = spawn("script_model", position);
    crate.angles = angles;
    if (!istrue(var_6244a1d5b282bb6c) && cratetype != "battle_royale_c130_loot" || cratetype != "battle_royale_loadout" && cratetype != "battle_royale_cash_crate") {
        if (issharedfuncdefined("entity", "touchingBadTrigger")) {
            if (crate [[ getsharedfunc("entity", "touchingBadTrigger") ]]()) {
                crate delete();
                return undefined;
            }
        }
    }
    if (!isdefined(crate)) {
        /#
            println("j_mainroot" + cratetype);
        #/
        return undefined;
    }
    crate.owner = owner;
    crate.team = team;
    crate.objweapon = leveldata.objweapon;
    crate.cratetype = cratetype;
    crate.useobject = undefined;
    crate.navobstacle = undefined;
    crate.headiconid = undefined;
    crate.minimapid = undefined;
    crate.dangerzoneid = undefined;
    crate.navobstacleid = undefined;
    crate.destination = destination;
    crate.markerposition = markerposition;
    crate.headiconactive = 0;
    crate.minimapiconactive = 0;
    crate.hasnophysics = istrue(hasnophysics);
    crate.physicsactivated = 0;
    crate.isdestroyed = 0;
    crate.data = data;
    crate.skipminimapicon = skipminimapicon;
    crate.inwater = 0;
    crate.var_28eb33ffd1aa3e63 = leveldata.var_28eb33ffd1aa3e63;
    crate.headicon = leveldata.headicon;
    crate.minimapicon = leveldata.minimapicon;
    crate.capturestring = leveldata.capturestring;
    crate.rerollstring = leveldata.rerollstring;
    crate.supportsreroll = leveldata.supportsreroll;
    crate.isteamonlycrate = leveldata.isteamonlycrate;
    crate.var_c23ca3472233553d = leveldata.var_c23ca3472233553d;
    crate.basemodel = leveldata.basemodel;
    if (isdefined(data) && isdefined(data.var_4191ace1612a5376)) {
        crate.basemodel = data.var_4191ace1612a5376;
    }
    crate setmodel(crate.basemodel);
    crate setnodeploy(1);
    crate setcandamage(0);
    crate makeunusable();
    if (issharedfuncdefined("airdrop", "attachXRays")) {
        crate = [[ getsharedfunc("airdrop", "attachXRays") ]](crate);
    }
    crate enableplayermarks("killstreak");
    if (level.teambased) {
        crate filteroutplayermarks(crate.team);
    } else {
        crate filteroutplayermarks(crate.owner);
    }
    killcament = undefined;
    if (!crate.hasnophysics) {
        if (issharedfuncdefined("game", "isBRStyleGameType")) {
            if (![[ getsharedfunc("game", "isBRStyleGameType") ]]()) {
                killcament = spawn("script_model", position + (0, 0, 300));
                killcament setscriptmoverkillcam("explosive");
                killcament linkto(crate);
            }
        }
    }
    if (isdefined(crate.owner)) {
        crate.owner.isffprotectedaction = 1;
    }
    crate.killcament = killcament;
    if (isdefined(crate.killcament)) {
        crate.killcament.linked = 1;
    }
    crate.unresolved_collision_notify_min = 1;
    var_79da6880ecea3790 = crate createmountmantlemodel();
    if (!var_79da6880ecea3790) {
        crate.unresolved_collision_func = &crateunresolvedcollisioncallback;
    }
    crate addtolists();
    if (!is_equal(level.script, "mp_bm_tut")) {
        crate thread watchcratedestroyearly();
    }
    if (istrue(crate.hasnophysics)) {
        crate activatecratefirsttime();
    } else if (istrue(var_6244a1d5b282bb6c)) {
        crate cratephysicson();
    }
    return crate;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d83
// Size: 0xc
function activatecratefirsttime() {
    activatecrate(1);
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d96
// Size: 0xd3
function activatecrate(isfirstactivation) {
    self notify("activateCrate");
    self.isfirstactivation = undefined;
    if (istrue(self.destroyonactivate)) {
        thread destroycrate();
        return;
    }
    _createnavobstacle();
    self notify("crate_dropped");
    if (istrue(self.waitforobjectiveactivate) && istrue(isfirstactivation)) {
        self waittill("objective_activate");
    }
    if (istrue(isfirstactivation) && self.cratetype != "battle_royale_loadout" && !istrue(self.skipminimapicon)) {
        createminimapicon();
    }
    _createheadicon();
    makecrateusable();
    leveldata = getleveldata(self.cratetype);
    if (isdefined(leveldata.activatecallback)) {
        self thread [[ leveldata.activatecallback ]](isfirstactivation);
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e70
// Size: 0x60
function deactivatecrate(var_4f1920bd33a0dba9) {
    if (istrue(var_4f1920bd33a0dba9)) {
        destroyminimapicon();
    }
    _destroyheadicon();
    makecrateunusable();
    leveldata = getleveldata(self.cratetype);
    if (isdefined(leveldata.deactivatecallback)) {
        self thread [[ leveldata.deactivatecallback ]](var_4f1920bd33a0dba9);
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ed7
// Size: 0x1a5
function capturecrate(player) {
    leveldata = getleveldata(self.cratetype);
    var_45c6df348e1551b3 = isdefined(self.owner);
    if (var_45c6df348e1551b3 && istrue(self.owner.isffprotectedaction)) {
        self.owner.isffprotectedaction = 0;
    }
    if (isdefined(leveldata.capturecallback)) {
        self thread [[ leveldata.capturecallback ]](player);
    }
    if (!istrue(self.var_b6a2fe13fb4e746a) && istrue(player.var_9ee2c87e0747c021)) {
        var_ee3ccf749502a23 = level.sharedfuncs[#"perk"][#"hash_5e75be22dd250b68"];
        if (isdefined(var_ee3ccf749502a23)) {
            self thread [[ var_ee3ccf749502a23 ]](player);
        }
        self.var_b6a2fe13fb4e746a = 1;
    } else if (istrue(self.var_b6a2fe13fb4e746a)) {
        detonatefunc = level.sharedfuncs[#"perk"][#"hash_3b864e571f199211"];
        if (isdefined(detonatefunc)) {
            self thread [[ detonatefunc ]]();
        }
        thread deletecrate(isdefined(self.var_278a47ee942fd1b0) ? 2.5 : self.var_278a47ee942fd1b0);
    } else if (leveldata.destroyoncapture) {
        var_cbf7be4f62a0ddb2 = 0;
        if (isdefined(leveldata.capturevisualscallback)) {
            self thread [[ leveldata.capturevisualscallback ]](self);
            var_cbf7be4f62a0ddb2 = leveldata.capturevisualsdeletiondelay;
        }
        thread deletecrate(var_cbf7be4f62a0ddb2);
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3083
// Size: 0x2cc
function destroycrate(immediate) {
    if (!isdefined(self) || istrue(self.isdestroyed)) {
        return;
    }
    if (!isdefined(immediate)) {
        if (isdefined(self.scenenode)) {
            if (isdefined(self.animdroptime)) {
                if (gettime() >= self.animdroptime) {
                    self.destroyonactivate = 1;
                    return;
                } else {
                    immediate = 1;
                }
            }
        } else if (istrue(self.physicsactivated)) {
            if (!istrue(self.physicssettled)) {
                self.destroyonactivate = 1;
                return;
            }
        }
    }
    if (isdefined(self.numuses) && self.numuses > 0 && isdefined(self.owner) && isplayer(self.owner)) {
        if (isdefined(self.streakinfo) && isdefined(self.streakinfo.airdroptype) & self.streakinfo.airdroptype == "loadout_drop") {
            self.owner namespace_aad14af462a74d08::function_d997435895422ecc("super_loadout_drop", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"end"), self.numuses);
        }
    }
    self.destroyonactivate = undefined;
    leveldata = getleveldata(self.cratetype);
    if (isdefined(level.br_pickups) && isdefined(level.br_pickups.crates) && array_contains(level.br_pickups.crates, self)) {
        level.br_pickups.crates = array_remove(level.br_pickups.crates, self);
    }
    if (isdefined(self.owner) && istrue(self.owner.isffprotectedaction)) {
        self.owner.isffprotectedaction = 0;
    }
    if (isdefined(leveldata.destroycallback)) {
        self thread [[ leveldata.destroycallback ]](immediate);
    }
    if (!istrue(immediate)) {
        var_cbf7be4f62a0ddb2 = undefined;
        if (!istrue(self.physicsactivated) || !istrue(self.physicssettled)) {
            if (isdefined(leveldata.destroyvisualscallback)) {
                self thread [[ leveldata.destroyvisualscallback ]](self);
                var_cbf7be4f62a0ddb2 = leveldata.destroyvisualsdeletiondelay;
            }
        } else if (isdefined(leveldata.capturevisualscallback)) {
            self thread [[ leveldata.capturevisualscallback ]](self);
            var_cbf7be4f62a0ddb2 = leveldata.capturevisualsdeletiondelay;
        }
        thread deletecrate(var_cbf7be4f62a0ddb2);
    } else {
        thread deletecrateimmediate();
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3356
// Size: 0x149
function deletecrate(delay) {
    if (istrue(self.isdestroyed)) {
        return;
    }
    self notify("death");
    self.isdestroyed = 1;
    if (isdefined(self.scenenode)) {
        if (isdefined(self.scenenode.crates)) {
            self.scenenode.crates[self getentitynumber()] = undefined;
        }
        if (isdefined(self.scenenode.crate)) {
            self.scenenode.crate = undefined;
        }
        self.scenenode = undefined;
    }
    removefromlists(self getentitynumber());
    self disableplayermarks("killstreak");
    self setcandamage(0);
    self setnonstick(1);
    makecrateunusable();
    if (isdefined(self.useobject)) {
        self.useobject delete();
    }
    destroydangerzone();
    _destroynavobstacle();
    destroymountmantlemodel();
    cratephysicsoff();
    destroyminimapicon();
    function_3a065ce769b6ce3d();
    _destroyheadicon();
    self notsolid();
    if (isdefined(self.killcament)) {
        self.killcament delete();
    }
    wait(delay);
    self delete();
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34a6
// Size: 0x53
function deletecrateimmediate() {
    var_cbf7be4f62a0ddb2 = level.framedurationseconds;
    if (isdefined(self getlinkedscriptableinstance()) && self getscriptablehaspart("visibility")) {
        self setscriptablepartstate(#"visibility", #"hide", 1);
    }
    deletecrate(var_cbf7be4f62a0ddb2);
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3500
// Size: 0xa2
function watchcratedestroyearly() {
    self endon("death");
    leveldata = getleveldata(self.cratetype);
    /#
        var_27c432c46e32be45 = getdvarint(@"hash_2c01d701bac5d9d3", 0);
        if (var_27c432c46e32be45) {
            leveldata.timeout = undefined;
        }
    #/
    if (isdefined(leveldata.timeout)) {
        /#
            assert(leveldata.timeout > 0, "watchCrateDestroyEarly called with a timeOut value of 0.");
        #/
    }
    watchcratedestroyearlyinternal(leveldata.timeout);
    if (istrue(self.nevertimeout)) {
        return;
    }
    thread destroycrate();
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35a9
// Size: 0xf3
function watchcratedestroyearlyinternal(timeout) {
    if (isdefined(self.owner)) {
        self.owner endon("disconnect");
        self.owner endon("joined_team");
        self.owner endon("joined_spectators");
    }
    level endon("game_ended");
    if (isdefined(timeout)) {
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(timeout);
        while (isdefined(self.playersusing) && self.playersusing.size > 0) {
            var_52fd907ebd6a9a6a = 0;
            foreach (player in self.playersusing) {
                if (isdefined(player)) {
                    var_52fd907ebd6a9a6a = 1;
                    break;
                }
            }
            if (!istrue(var_52fd907ebd6a9a6a)) {
                break;
            }
            waitframe();
        }
    } else {
        level waittill("forever");
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36a3
// Size: 0x1b3
function destroycrateinbadtrigger() {
    if (issharedfuncdefined("entity", "touchingBadTrigger")) {
        if (self [[ getsharedfunc("entity", "touchingBadTrigger") ]]()) {
            thread destroycrate();
        }
    }
    if (isdefined(level.var_ca4e08767cbdae12)) {
        var_425925a45729deae = self [[ level.var_ca4e08767cbdae12 ]](self.origin);
        if (!var_425925a45729deae) {
            if (issharedfuncdefined("player", "isReallyAlive")) {
                var_6bc61919b35c1a79 = isdefined(self.owner) && [[ getsharedfunc("player", "isReallyAlive") ]](self.owner);
                if (!var_6bc61919b35c1a79) {
                    thread destroycrate();
                    return;
                }
                if (issharedfuncdefined("hud", "showErrorMessage")) {
                    self.owner [[ getsharedfunc("hud", "showErrorMessage") ]]("EQUIPMENT/PLANT_FAILED");
                }
                if (isdefined(self.cratetype) && self.cratetype == "loadout_drop") {
                    if (issharedfuncdefined("supers", "refundSuper")) {
                        self.owner [[ getsharedfunc("supers", "refundSuper") ]]();
                    }
                } else if (isdefined(self.streakinfo) && isdefined(self.streakinfo.mpstreaksysteminfo)) {
                    if (issharedfuncdefined("killstreak", "awardKillstreakFromStruct")) {
                        self.owner [[ getsharedfunc("killstreak", "awardKillstreakFromStruct") ]](self.streakinfo.mpstreaksysteminfo, "other");
                    }
                }
            }
            thread destroycrate();
        }
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x385d
// Size: 0xfb
function initcratedropdata() {
    leveldata = spawnstruct();
    leveldata.helis = [];
    var_d8d1344707480943 = namespace_9abe40d2af041eb2::getkillstreakairstrikeheightent();
    if (isdefined(var_d8d1344707480943)) {
        leveldata.heliheight = var_d8d1344707480943.origin[2] - 750;
    } else {
        leveldata.heliheight = 2000;
    }
    leveldata.heliheightoffset = 128;
    level.cratedropdata = leveldata;
    initscriptedhelidropdata();
    if (isdefined(level.var_fc8ea831d44aeff6) && !getdvarint(@"hash_d400e64d176da3a4", 0)) {
        foreach (var_9590b22e3d9c08a3 in level.var_fc8ea831d44aeff6) {
            overridekillstreakcrateweight(var_9590b22e3d9c08a3, 0);
        }
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x395f
// Size: 0xa
function initscriptedhelidropdata() {
    initscriptedhelidropanims();
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3970
// Size: 0x92
function initscriptedhelidropanims() {
    level.scr_animtree["care_package"] = %script_model;
    level.scr_anim["care_package"]["care_package_drop"] = script_model%mp_carepackage_ckpg_flyin;
    level.scr_anim["care_package"]["care_package_capture"] = script_model%mp_military_carepackage_straps_falling;
    level.scr_animtree["care_package_chute"] = %script_model;
    level.scr_anim["care_package_chute"]["care_package_drop"] = script_model%mp_carepackage_parachute_flyin;
    initscriptedhelidropvehicleanims();
    initbrc130airdropdropanims();
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a09
// Size: 0x34
function initscriptedhelidropvehicleanims() {
    level.scr_animtree["care_package_heli"] = %script_model;
    level.scr_anim["care_package_heli"]["care_package_drop"] = mp_vehicles_always_loaded%mp_carepackage_lbravo_flyin;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a44
// Size: 0xbd
function initbrc130airdropdropanims() {
    level.scr_anim["care_package"]["brc130_drop_high"] = script_model%mp_carepackage_ckpg_flyin_10500;
    level.scr_anim["care_package"]["brc130_drop_med"] = script_model%mp_carepackage_ckpg_flyin_7500;
    level.scr_anim["care_package"]["brc130_drop_low"] = script_model%mp_carepackage_ckpg_flyin_3000;
    level.scr_anim["care_package_chute"]["brc130_drop_high"] = script_model%mp_carepackage_parachute_flyin_10500;
    level.scr_anim["care_package_chute"]["brc130_drop_med"] = script_model%mp_carepackage_parachute_flyin_7500;
    level.scr_anim["care_package_chute"]["brc130_drop_low"] = script_model%mp_carepackage_parachute_flyin_3000;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b08
// Size: 0x4f
function placecrate(owner, team, cratetype, position, angles, data, skipminimapicon) {
    return createcrate(owner, team, cratetype, position, angles, undefined, 0, 1, data, skipminimapicon, position);
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b5f
// Size: 0x82
function dropcrate(owner, team, cratetype, position, angles, destination, data, skipminimapicon) {
    if (!isdefined(destination)) {
        caststart = getcratedropcaststart(position, 0);
        destination = getcratedropdestination(caststart, getcratedropcastend(caststart, 0));
    }
    return createcrate(owner, team, cratetype, position, angles, destination, undefined, 1, data, skipminimapicon, position);
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3be9
// Size: 0x248
function dropcratefrommanualheli(owner, team, cratetype, position, angles, var_9abeb4585af3bd0e, var_7862c7c7ade2b42e, destination, data) {
    position = getcratedropcaststart(position, 1);
    height = position[2];
    if (!isdefined(destination)) {
        destination = getcratedropdestination(position, getcratedropcastend(position, 1));
        if (!isdefined(destination)) {
            return undefined;
        }
    }
    dropstruct = spawnstruct();
    dropstruct.owner = owner;
    dropstruct.team = team;
    dropstruct.hasowner = isdefined(owner);
    angles = angles * (0, 1, 0);
    var_16cedb94faf4d596 = position + -1 * anglestoforward(angles) * var_9abeb4585af3bd0e;
    dropstruct.dropposition = position;
    dropstruct.exitposition = position + anglestoforward(angles) * var_7862c7c7ade2b42e;
    vehicleisreserved = undefined;
    if (isdefined(data)) {
        vehicleisreserved = data.vehicleisreserved;
    }
    heli = createheli(owner, team, var_16cedb94faf4d596, angles, vehicleisreserved);
    heli.dropstruct = dropstruct;
    if (issharedfuncdefined("game", "isBRStyleGameType")) {
        if ([[ getsharedfunc("game", "isBRStyleGameType") ]]()) {
            heli vehicle_setspeed(100, 60);
        } else {
            heli vehicle_setspeed(200, 100);
        }
    }
    heli setmaxpitchroll(15, 15);
    heli setscriptablepartstate(#"lights", #"active", 1);
    dropstruct.heli = heli;
    crate = createcrate(owner, team, cratetype, var_16cedb94faf4d596, heli.angles, destination, undefined, 0, data, undefined, position);
    crate.dropstruct = dropstruct;
    crate linkto(heli, "tag_origin", (16, 0, -156), (0, 0, 0));
    dropstruct.crate = crate;
    dropstruct thread watchdropcratefrommanualheli();
    return dropstruct;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e39
// Size: 0x4d
function watchdropcratefrommanualheli() {
    self endon("death");
    watchdropcratefrommanualheliinternal();
    if (isdefined(self.crate)) {
        self.crate thread destroycrate();
    }
    if (isdefined(self.heli)) {
        self.heli thread destroyheli();
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e8d
// Size: 0x28a
function watchdropcratefrommanualheliinternal() {
    if (self.hasowner) {
        self.owner endon("disconnect");
        self.owner endon("joined_team");
        self.owner endon("joined_spectators");
    }
    level endon("game_ended");
    self.heli setvehgoalpos(self.dropposition, 1);
    self.heli waittill_notify_or_timeout("death", 2);
    if (!isdefined(self.heli) || istrue(self.heli.isdestroyed)) {
        thread docratedropfrommanualheli();
        return;
    }
    self.heli setyawspeed(40, 20, 20, 0.3);
    if (distancesquared(self.heli.origin, self.dropposition) > 5184) {
        self.heli waittill_any_2("death", "goal");
        if (!isdefined(self.heli) || istrue(self.heli.isdestroyed)) {
            thread docratedropfrommanualheli();
            return;
        }
        self.heli waittill_notify_or_timeout("death", 0.25);
        if (isdefined(self.crate) && !istrue(self.crate.isdestroyed)) {
            thread docratedropfrommanualheli();
        }
        if (!isdefined(self.heli) || istrue(self.heli.isdestroyed)) {
            return;
        }
        self.heli waittill_notify_or_timeout("death", 0.5);
        if (!isdefined(self.heli) || istrue(self.heli.isdestroyed)) {
            return;
        }
        if (distancesquared(self.heli.origin, self.exitposition) > 5184) {
            if (issharedfuncdefined("game", "isBRStyleGameType")) {
                if ([[ getsharedfunc("game", "isBRStyleGameType") ]]()) {
                    self.heli vehicle_setspeed(100, 60);
                } else {
                    self.heli vehicle_setspeed(150, 50);
                }
            }
            self.heli setvehgoalpos(self.exitposition, 1);
            self.heli waittill_any_2("death", "goal");
        }
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x411e
// Size: 0x3c
function docratedropfrommanualheli() {
    crate = self.crate;
    self.crate.dropstruct = undefined;
    self.crate = undefined;
    crate cratephysicson();
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 13, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4161
// Size: 0x28c
function createcrateforscripteddrop(owner, team, cratetype, destination, hasnophysics, var_6244a1d5b282bb6c, data, streakinfo, scenenode, animname, var_3f70f46831db1173, var_8d8a84acc6efadff, markerposition) {
    if (isdefined(streakinfo) && isdefined(streakinfo.streakname) && isstruct(data)) {
        var_cbab602e6919aad7 = undefined;
        if (isdefined(level.var_b23156d776b1d85)) {
            var_cbab602e6919aad7 = level.var_b23156d776b1d85.var_38f2a11237246ac[streakinfo.streakname];
        }
        if (isdefined(var_cbab602e6919aad7) && isdefined(var_cbab602e6919aad7.var_46525b458090d681)) {
            data.var_4191ace1612a5376 = var_cbab602e6919aad7.var_46525b458090d681;
        }
    }
    crate = createcrate(owner, team, cratetype, scenenode.origin, scenenode.angles, destination, hasnophysics, var_6244a1d5b282bb6c, data, undefined, markerposition);
    if (!isdefined(crate)) {
        return undefined;
    }
    crate.scenenode = scenenode;
    crate.streakinfo = streakinfo;
    if (!isdefined(scenenode.crates)) {
        scenenode.crates = [];
    }
    scenenode.crates[crate getentitynumber()] = crate;
    crate setscriptablepartstate(#"visibility", #"hide", 0);
    crate.animname = animname;
    crate namespace_bc4a4b9456315863::setanimtree();
    var_55a416c7a58bea99 = level.scr_anim[animname][var_3f70f46831db1173];
    var_feb55c68b4b9610 = getanimlength(var_55a416c7a58bea99) * 1000;
    crate.animdroptime = undefined;
    crate.animstoptrailtime = undefined;
    crate.animendtime = gettime() + var_feb55c68b4b9610;
    if (!istrue(var_8d8a84acc6efadff)) {
        crate.animdroptime = gettime() + getnotetracktimes(var_55a416c7a58bea99, "carepackage_drop")[0] * var_feb55c68b4b9610;
        crate.animstoptrailtime = gettime() + getnotetracktimes(var_55a416c7a58bea99, "carepackage_trail_end")[0] * var_feb55c68b4b9610;
    }
    scenenode.latestanimendtime = ter_op(crate.animendtime > scenenode.latestanimendtime, crate.animendtime, scenenode.latestanimendtime);
    return crate;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43f5
// Size: 0x1c1
function createchuteforscripteddrop(scenenode, crate, animname, var_3f70f46831db1173) {
    if (!isdefined(scenenode.chutes)) {
        scenenode.chutes = [];
    }
    chute = spawn("script_model", scenenode.origin);
    chute.angles = scenenode.origin;
    chute.scenenode = scenenode;
    chute.crate = crate;
    chute.crateanimdroptime = crate.animdroptime;
    scenenode.chutes[chute getentitynumber()] = chute;
    chute setmodel("veh9_mil_lnd_parachute_carepackage_mp");
    chute setscriptablepartstate(#"visibility", #"hide", 0);
    chute.animname = animname;
    chute namespace_bc4a4b9456315863::setanimtree();
    var_4adba587d6befdd3 = level.scr_anim[animname][var_3f70f46831db1173];
    var_d211250db97a000a = getanimlength(var_4adba587d6befdd3) * 1000;
    chute.animendtime = gettime() + getanimlength(level.scr_anim[animname][var_3f70f46831db1173]) * 1000;
    chute.animunhidetime = gettime() + getnotetracktimes(var_4adba587d6befdd3, "chute_unhide")[0] * var_d211250db97a000a;
    chute.animendtime = gettime() + var_d211250db97a000a;
    scenenode.latestanimendtime = ter_op(chute.animendtime > scenenode.latestanimendtime, chute.animendtime, scenenode.latestanimendtime);
    return chute;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45be
// Size: 0x31
function destroychute() {
    if (isdefined(self.scenenode)) {
        self.scenenode.chutes[self getentitynumber()] = undefined;
    }
    self delete();
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45f6
// Size: 0x34f
function dropcratefromscriptedheli(owner, team, cratetype, position, angles, destination, data, streakinfo) {
    if (issharedfuncdefined("killstreak", "currentActiveVehicleCount") && issharedfuncdefined("killstreak", "maxVehiclesAllowed")) {
        if ([[ getsharedfunc("killstreak", "currentActiveVehicleCount") ]]() >= [[ getsharedfunc("killstreak", "maxVehiclesAllowed") ]]()) {
            return undefined;
        }
    }
    if (isdefined(level.var_2562ea48235e90b5)) {
        exfils = level.var_2562ea48235e90b5;
        foreach (exfil in exfils) {
            if (istrue(exfil.var_1326008dc390c510) && distancesquared(exfil.origin, position) < squared(750)) {
                return undefined;
            }
        }
    }
    var_ebb5c644a3f5cfbc = getcratedropcaststart(position, 1);
    var_46d5f28d2724bf1f = angles * (0, 1, 0);
    destination = getcratedropdestination(var_ebb5c644a3f5cfbc, getcratedropcastend(var_ebb5c644a3f5cfbc, 1), destination);
    if (!isdefined(destination)) {
        return undefined;
    }
    var_ebb5c644a3f5cfbc = destination + (0, 0, 2000);
    scenenode = spawn("script_model", var_ebb5c644a3f5cfbc);
    scenenode.angles = var_46d5f28d2724bf1f;
    scenenode setmodel("tag_origin");
    scenenode.owner = owner;
    scenenode.team = team;
    scenenode.hasowner = isdefined(owner);
    vehicleisreserved = undefined;
    if (isdefined(data)) {
        vehicleisreserved = data.vehicleisreserved;
    }
    heli = createheli(owner, team, var_ebb5c644a3f5cfbc, var_46d5f28d2724bf1f, vehicleisreserved, streakinfo);
    if (!isdefined(heli)) {
        scenenode delete();
        return undefined;
    }
    heli.scenenode = heli;
    heli setscriptablepartstate(#"visibility", #"hide", 0);
    heli.animname = "care_package_heli";
    scenenode.heli = heli;
    scenenode.heliendtime = gettime() + getanimlength(level.scr_anim["care_package_heli"]["care_package_drop"]) * 1000;
    scenenode.latestanimendtime = scenenode.heliendtime;
    crate = createcrateforscripteddrop(owner, team, cratetype, destination, undefined, 0, data, streakinfo, scenenode, "care_package", "care_package_drop", undefined, position);
    if (!isdefined(crate) || isdefined(owner) && istrue(owner.var_65219c911f198c95)) {
        return undefined;
    }
    chute = createchuteforscripteddrop(scenenode, crate, "care_package_chute", "care_package_drop");
    if (!isdefined(chute)) {
        return undefined;
    }
    chute setscriptablepartstate(#"visibility", #"hide", 0);
    scenenode thread watchdropcratefromscriptedheli();
    return scenenode;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x494d
// Size: 0x1a9
function watchdropcratefromscriptedheli() {
    self endon("death");
    namespace_bc4a4b9456315863::anim_first_frame_solo(self.heli, "care_package_drop");
    foreach (crate in self.crates) {
        namespace_bc4a4b9456315863::anim_first_frame_solo(crate, "care_package_drop");
    }
    foreach (chute in self.chutes) {
        namespace_bc4a4b9456315863::anim_first_frame_solo(chute, "care_package_drop");
    }
    watchdropcratefromscriptedheliinternal();
    if (isdefined(self.heli)) {
        self.heli thread destroyheli();
    }
    foreach (crate in self.crates) {
        if (isdefined(crate)) {
            crate thread destroycrate();
        }
    }
    foreach (chute in self.chutes) {
        if (isdefined(chute)) {
            chute thread destroychute();
        }
    }
    self delete();
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4afd
// Size: 0x4d3
function watchdropcratefromscriptedheliinternal() {
    firstframe = undefined;
    while (gettime() <= self.latestanimendtime) {
        if (self.hasowner) {
            if (!isdefined(self.ownerdisconnected)) {
                if (isdefined(self.owner)) {
                    if (!isdefined(self.ownerjoinedteam)) {
                        if (self.team != self.owner.team) {
                            self.ownerjoinedteam = 1;
                        }
                    }
                } else {
                    self.ownerdisconnected = 1;
                }
            }
        }
        if (!isdefined(firstframe)) {
            firstframe = 1;
        } else if (firstframe) {
            if (isdefined(self.heli)) {
                self.heli setscriptablepartstate(#"visibility", #"show", 0);
                if (self.heli getscriptablehaspart(#"lights")) {
                    self.heli setscriptablepartstate(#"lights", #"active", 1);
                }
                thread namespace_bc4a4b9456315863::anim_single_solo(self.heli, "care_package_drop");
            }
            foreach (crate in self.crates) {
                if (isdefined(crate)) {
                    crate setscriptablepartstate(#"visibility", #"show", 0);
                    thread namespace_bc4a4b9456315863::anim_single_solo(crate, "care_package_drop");
                }
            }
            foreach (chute in self.chutes) {
                if (isdefined(chute)) {
                    thread namespace_bc4a4b9456315863::anim_single_solo(chute, "care_package_drop");
                    chute playsoundonmovingent("iw9_carepackage_parachute_drop");
                }
            }
            firstframe = 0;
        } else {
            disowned = istrue(self.ownerdisconnected) || istrue(self.ownerjoinedteam);
            if (isdefined(self.heli)) {
                if (disowned || gettime() > self.heliendtime) {
                    self.heli destroyheli();
                }
            }
            foreach (crate in self.crates) {
                if (isdefined(crate)) {
                    if (gettime() > crate.animendtime || isdefined(self.owner) && istrue(self.owner.var_65219c911f198c95)) {
                        if (disowned) {
                            crate thread destroycrate();
                        }
                        thread docratedropfromscripted(crate);
                    } else if (gettime() > crate.animdroptime) {
                        if (gettime() > crate.animstoptrailtime) {
                            crate setscriptablepartstate(#"trail", #"neutral", 1);
                        } else {
                            crate setscriptablepartstate(#"trail", #"active", 1);
                        }
                        if (disowned) {
                            crate thread destroycrate();
                        }
                    } else if (disowned) {
                        crate thread destroycrate();
                    } else if (!isdefined(self.heli) || istrue(self.heli.isdestroyed)) {
                        thread docratedropfromscripted(crate);
                    }
                }
            }
            foreach (chute in self.chutes) {
                if (isdefined(chute)) {
                    if (gettime() > chute.animendtime || isdefined(self.owner) && istrue(self.owner.var_65219c911f198c95)) {
                        chute thread destroychute();
                    } else if (gettime() <= chute.crateanimdroptime && (!isdefined(chute.crate) || !isdefined(self.crates[chute.crate getentitynumber()]))) {
                        chute thread destroychute();
                    } else if (gettime() > chute.animunhidetime) {
                        chute setscriptablepartstate(#"visibility", #"show", 0);
                    }
                }
            }
        }
        waitframe();
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fd7
// Size: 0x6a
function docratedropfromscripted(crate) {
    crate.scenenode = undefined;
    self.crates[crate getentitynumber()] = undefined;
    crate.animname = undefined;
    crate.animendtime = undefined;
    crate.animdroptime = undefined;
    crate.animstoptrailtime = undefined;
    crate notify("anim_finished");
    crate stopanimscripted();
    crate cratephysicson();
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5048
// Size: 0x5e
function getcratedropcaststart(position, var_5e43d97dfc3d0419, droptype) {
    caststart = undefined;
    if (istrue(var_5e43d97dfc3d0419)) {
        caststart = position * (1, 1, 0) + (0, 0, getscriptedhelidropheight(droptype));
    } else {
        caststart = position + (0, 0, 25);
    }
    return caststart;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50ae
// Size: 0x2a
function getcratedropcastend(caststart, var_5e43d97dfc3d0419) {
    return caststart + (0, 0, -1 * ter_op(istrue(var_5e43d97dfc3d0419), 25000, 25000));
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50e0
// Size: 0xf0
function getcratedropdestination(caststart, castend, destination) {
    ignorelist = getcratedropignorelist();
    contentoverride = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 0, 0);
    var_c59c5c63bf590651 = namespace_2a184fc4902783dc::sphere_trace(caststart, castend, 100, ignorelist, contentoverride);
    if (var_c59c5c63bf590651["hittype"] != "hittype_none" && isdefined(var_c59c5c63bf590651["position"])) {
        if (isdefined(destination)) {
            destination = (destination[0], destination[1], var_c59c5c63bf590651["position"][2]);
        } else {
            destination = var_c59c5c63bf590651["position"];
        }
    }
    /#
        thread namespace_f2ffc0540883e1ad::drawsphere(destination, 20, 30, (0, 1, 0));
        thread namespace_f2ffc0540883e1ad::drawline(destination, caststart, 30, (0, 1, 0));
        thread namespace_f2ffc0540883e1ad::drawsphere(caststart, 20, 30, (0, 1, 0));
    #/
    return destination;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51d8
// Size: 0xb8
function getcratedropignorelist() {
    if (isdefined(level.cratedata.helis) && isdefined(level.cratedata.ac130s)) {
        return array_combine_multiple([0:level.cratedropdata.helis, 1:level.cratedropdata.ac130s, 2:level.cratedata.crates]);
    } else {
        return array_combine_multiple([0:level.cratedropdata.helis, 1:level.cratedata.crates]);
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5297
// Size: 0x4c2
function createheli(owner, team, position, angles, vehicleisreserved, streakinfo) {
    heli = undefined;
    var_50cea258b08e022b = #"heli";
    var_cbab602e6919aad7 = undefined;
    if (isdefined(streakinfo) && isdefined(streakinfo.streakname) && isdefined(level.var_b23156d776b1d85)) {
        var_cbab602e6919aad7 = level.var_b23156d776b1d85.var_38f2a11237246ac[streakinfo.streakname];
    }
    var_b514d5120067a18a = "veh_airdrop_mp_phys";
    var_f98416d816ceec66 = "veh9_mil_air_heli_medium_airdrop_mp";
    if (isdefined(var_cbab602e6919aad7)) {
        if (isdefined(var_cbab602e6919aad7.var_4380bc0aa8fb8e3f)) {
            var_50cea258b08e022b = var_cbab602e6919aad7.var_4380bc0aa8fb8e3f;
        }
        if (isdefined(var_cbab602e6919aad7.var_73528a5c4334c98e)) {
            var_b514d5120067a18a = var_cbab602e6919aad7.var_73528a5c4334c98e;
        }
        if (isdefined(var_cbab602e6919aad7.var_e26d3ad734784c1b)) {
            var_f98416d816ceec66 = var_cbab602e6919aad7.var_e26d3ad734784c1b;
        }
    }
    if (istrue(vehicleisreserved)) {
        namespace_f64231d5b7a2c3c4::clearvehiclereservation();
    }
    if (var_50cea258b08e022b == #"hash_d6a48bc6dc44eb34") {
        spawndata = {var_5bfcdcb0bf0678c6:1, targetname:"airdrop", modelname:var_f98416d816ceec66, vehicletype:var_b514d5120067a18a, angles:angles, origin:position};
        var_ee8da5624236dc89 = spawnstruct();
        heli = namespace_f64231d5b7a2c3c4::_spawnvehicle(spawndata, var_ee8da5624236dc89);
    } else {
        heli = namespace_f64231d5b7a2c3c4::_spawnhelicopter(undefined, position, angles, var_b514d5120067a18a, var_f98416d816ceec66);
    }
    if (!isdefined(heli)) {
        return undefined;
    }
    if (!isdefined(team)) {
        team = "neutral";
    }
    if (team != "neutral") {
        heli setvehicleteam(team);
    }
    heli.owner = owner;
    heli.team = team;
    destroyedsplash = undefined;
    vodestroyed = undefined;
    scorepopup = undefined;
    if (isdefined(level.heliconfigs)) {
        config = level.heliconfigs["airdrop"];
        heli.health = config.maxhealth;
        heli.maxhealth = config.maxhealth;
        var_5a127424b8df87b6 = config.callout;
        vodestroyed = config.vodestroyed;
        scorepopup = config.scorepopup;
    } else {
        heli.maxhealth = 999999;
        heli.health = heli.maxhealth;
    }
    heli.streakinfo = streakinfo;
    heli.helitype = "airdrop";
    heli setscriptablepartstate(#"engine", #"on", 0);
    level thread function_ee93617532d8a679(heli, owner, undefined, undefined, 1);
    if (isdefined(owner)) {
        if (issharedfuncdefined("killstreak", "addToActiveKillstreakList")) {
            heli [[ getsharedfunc("killstreak", "addToActiveKillstreakList") ]]("airdrop", "Killstreak_Air", owner, 0, 0);
        }
        if (team != "neutral") {
            heli namespace_6d9917c3dc05dbe9::registersentient("Killstreak_Air", owner);
        }
    }
    if (issharedfuncdefined("killstreak", "killstreakMakeVehicle")) {
        heli [[ getsharedfunc("killstreak", "killstreakMakeVehicle") ]](var_b514d5120067a18a, scorepopup, vodestroyed, destroyedsplash);
    }
    if (issharedfuncdefined("killstreak", "killstreakSetPreModDamageCallback")) {
        heli [[ getsharedfunc("killstreak", "killstreakSetPreModDamageCallback") ]](var_b514d5120067a18a);
    }
    if (issharedfuncdefined("killstreak", "killstreakSetPostModDamageCallback")) {
        heli [[ getsharedfunc("killstreak", "killstreakSetPostModDamageCallback") ]](var_b514d5120067a18a);
    }
    if (issharedfuncdefined("killstreak", "killstreakSetDeathCallback")) {
        heli [[ getsharedfunc("killstreak", "killstreakSetDeathCallback") ]](var_b514d5120067a18a, &destroyhelicallback);
    }
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["airdrop"];
    if (!isdefined(var_cbab602e6919aad7) || !istrue(var_cbab602e6919aad7.candamage)) {
        heli setcandamage(0);
    } else if (issharedfuncdefined("damage", "monitorDamage")) {
        heli thread [[ getsharedfunc("damage", "monitorDamage") ]](heli.maxhealth, "hitequip", &function_5be12c382c72de75, &function_763c331f22e7499e, 1, 1);
    }
    heli thread watchhelidestroyearly();
    return heli;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5761
// Size: 0x36
function private function_5be12c382c72de75(data) {
    veh = data.victim;
    veh thread destroyheli();
    return data.damage;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x579f
// Size: 0x3d
function private function_5df678b586cdb293(veh) {
    if (!isdefined(veh)) {
        return;
    }
    veh thread destroyheli();
    level callback::callback("killstreak_finish_use", {streakinfo:veh.streakinfo});
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x57e3
// Size: 0x179
function private function_763c331f22e7499e(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    meansofdeath = data.meansofdeath;
    type = data.meansofdeath;
    modifieddamage = data.damage;
    if (istrue(level.var_be6a42242be00b66)) {
        bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["airdrop"];
        modifieddamage = getmodifieddamageusingdamagetuning(attacker, objweapon, type, modifieddamage, self.maxhealth, bundle.var_e913079a5ffda56d);
    } else if (issharedfuncdefined("killstreak", "getModifiedAntiKillstreakDamage")) {
        modifieddamage = self [[ getsharedfunc("killstreak", "getModifiedAntiKillstreakDamage") ]](attacker, objweapon, meansofdeath, modifieddamage, self.maxhealth, 1, 1, 1);
    }
    data.damage = modifieddamage;
    damagetaken = data.victim.damagetaken + data.damage;
    var_559a0810819cf4f0 = 100 - 100 * damagetaken / data.victim.maxhealth;
    return data.damage;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5964
// Size: 0x19
function watchhelidestroyearly() {
    self endon("death");
    watchhelidestroyearlyinternal();
    thread destroyheli();
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5984
// Size: 0x53
function watchhelidestroyearlyinternal() {
    self endon("death");
    if (isdefined(self.owner)) {
        self.owner endon("disconnect");
        self.owner endon("joined_team");
        self.owner endon("joined_spectators");
    }
    level endon("game_ended");
    level waittill("forever");
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59de
// Size: 0xc
function destroyheli() {
    thread deleteheli(0);
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59f1
// Size: 0x60
function deleteheli(delay) {
    self notify("death");
    self.isdestroyed = 1;
    if (isdefined(self.scenenode)) {
        self.scenenode.heli = undefined;
        self.scenenode = undefined;
    }
    removehelidroppingcratefromlist(self getentitynumber());
    wait(delay);
    namespace_f64231d5b7a2c3c4::_deletevehicle(self);
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a58
// Size: 0x13
function destroyhelicallback(data) {
    destroyheli();
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a72
// Size: 0x37
function getscriptedhelidropheightbase(droptype) {
    /#
        assertex(isdefined(level.cratedropdata), "getScriptedHeliDropHeightBase() called before initCrateDropData().");
    #/
    return level.cratedropdata.heliheight;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ab1
// Size: 0x3c
function getscriptedhelidropheight(droptype) {
    return getscriptedhelidropheightbase(droptype) + level.cratedropdata.helis.size * level.cratedropdata.heliheightoffset;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5af5
// Size: 0x4c
function addhelidroppingcratetolist(heli) {
    /#
        assertex(isdefined(level.cratedropdata), "getScriptedHeliDropHeight() called before initCrateDropData().");
    #/
    entnum = heli getentitynumber();
    level.cratedropdata.helis[entnum] = heli;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b48
// Size: 0x21
function removehelidroppingcratefromlist(entnum) {
    level.cratedropdata.helis[entnum] = undefined;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b70
// Size: 0x17e
function makecrateusable() {
    leveldata = getleveldata(self.cratetype);
    if (istrue(leveldata.hasnointeraction)) {
        return;
    }
    level.cratedata.usablecrates[self getentitynumber()] = self;
    self.isusable = 1;
    /#
        assertex(leveldata.supportsownercapture || leveldata.supportsothercapture, "makeCrateUsable called on a crate that does not support owner capture OR other capture.");
    #/
    if (leveldata.supportsownercapture && leveldata.supportsothercapture) {
        thread watchcrateuse(1);
        useobject = self.useobject;
        if (!isdefined(useobject)) {
            if (isdefined(self.model)) {
                usetag = function_fed3925eb5331836(self.model, leveldata.usetag) ? leveldata.usetag : "tag_origin";
            } else {
                usetag = leveldata.usetag;
            }
            useobject = spawn("script_model", self gettagorigin(usetag));
            useobject setmodel("tag_origin");
            useobject linkto(self);
            useobject makeunusable();
            self.useobject = useobject;
        }
        thread watchcrateuse(2, useobject);
    } else if (leveldata.supportsownercapture) {
        thread watchcrateuse(1);
    } else {
        thread watchcrateuse(2);
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5cf5
// Size: 0x40f
function watchcrateuse(usetype, useobject) {
    self endon("death");
    self endon("makeCrateUnusable");
    if (isdefined(useobject)) {
        useobject endon("death");
    }
    if (usetype == 1) {
        self.owner endon("disconnect");
        self.owner endon("joined_team");
        self.owner endon("joined_spectators");
        self.owner.isffprotectedaction = 1;
    }
    leveldata = getleveldata(self.cratetype);
    var_ef5d5141fdb51174 = gettriggerobject(useobject);
    var_ef5d5141fdb51174.usetype = usetype;
    var_ef5d5141fdb51174.userate = 1;
    var_ef5d5141fdb51174.curprogress = 0;
    if (isdefined(var_ef5d5141fdb51174.usetimeoverride)) {
        var_ef5d5141fdb51174.usetime = var_ef5d5141fdb51174.usetimeoverride;
    } else {
        var_ef5d5141fdb51174.usetime = ter_op(usetype == 1, leveldata.ownerusetime, leveldata.otherusetime);
    }
    var_ef5d5141fdb51174.inuse = 0;
    var_ef5d5141fdb51174.playerusing = undefined;
    if (!isdefined(self.playeroutlines)) {
        self.playeroutlines = [];
    }
    if (issharedfuncdefined("outline", "outlineEnableForTeam") && isdefined(self.team)) {
        self.playeroutlines[self.playeroutlines.size] = [[ getsharedfunc("outline", "outlineEnableForTeam") ]](self, self.team, "outline_depth_cyan", "level_script");
    }
    while (1) {
        player = var_ef5d5141fdb51174 waittill("trigger");
        if (getdvarint(@"hash_618b9c003b5b3883", 0) == 0) {
            if (isdefined(self.disabled_use_for) && istrue(self.disabled_use_for[player getentitynumber()])) {
                player namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2("airdrop", "airdrop_cannotUseLoadoutCrateHint");
                continue;
            }
        }
        if (istrue(player.isjuggernaut) && !player juggcanusecrate(self.cratetype)) {
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                player [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/JUGG_CANNOT_BE_USED");
            }
            continue;
        }
        if (istrue(player.var_5b3c77e2eafab370)) {
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                player [[ getsharedfunc("hud", "showErrorMessage") ]]("MP/CANNOT_USE_GENERIC");
            }
            continue;
        }
        if (canstartusingcrate(player, useobject)) {
            var_8d18e90deac7a522 = level.sharedfuncs[#"perk"][#"hash_3c36a82b640a16f6"];
            if (isdefined(var_8d18e90deac7a522)) {
                if (isdefined(self.owner) && isenemyteam(player.team, self.owner.team)) {
                    player.var_9ee2c87e0747c021 = player [[ var_8d18e90deac7a522 ]]();
                }
            }
            startusingcrate(player, useobject);
            player.isffprotectedaction = 1;
            var_ef5d5141fdb51174.playerusing = player;
            result = watchcrateuseinternal(player, useobject);
            if (isdefined(player)) {
                stopusingcrate(player, useobject);
            }
            var_ef5d5141fdb51174.playerusing = undefined;
            if (istrue(result)) {
                if (isdefined(player)) {
                    player.isffprotectedaction = 0;
                }
                if (leveldata.onecaptureperplayer && self.cratetype != "battle_royale_loadout") {
                    if (getdvarint(@"hash_618b9c003b5b3883") == 0) {
                        if (!isdefined(self.playerscaptured)) {
                            self.playerscaptured = [];
                        }
                        self.playerscaptured[player getentitynumber()] = player;
                    }
                }
                if (!isdefined(self.targetname) || self.targetname != "btm_flag_primary_inside") {
                    thread capturecrate(player);
                }
            }
        }
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x610b
// Size: 0x1e4
function watchcrateuseinternal(player, useobject) {
    var_ef5d5141fdb51174 = gettriggerobject(useobject);
    if (var_ef5d5141fdb51174.usetype != 1) {
        player endon("disconnect");
        player endon("joined_team");
        player endon("joined_spectators");
    }
    var_ef5d5141fdb51174.id = function_7972a1043e6facab();
    var_ef5d5141fdb51174.userate = ter_op(isdefined(player.objectivescaler), player.objectivescaler, 1);
    /#
        var_544e47b30f4f8fc3 = getdvarint(@"hash_7acaaf8f4063ab02", 0);
        if (isdefined(var_ef5d5141fdb51174.usetimeoverride)) {
            var_ef5d5141fdb51174.usetime = var_ef5d5141fdb51174.usetimeoverride;
        } else if (issharedfuncdefined("switchblade_drone", "lrad")) {
            if ([[ getsharedfunc("switchblade_drone", "lrad") ]]() == "overrideKillstreakCrateWeight() called before initKillstreakCrateData().") {
                goto LOC_00000118;
            }
            var_ef5d5141fdb51174.usetime = ter_op(var_544e47b30f4f8fc3, 3, 0.5);
        LOC_00000118:
        }
    LOC_00000118:
    #/
LOC_00000118:
    playusesound(player, useobject);
    while (isdefined(player) && player namespace_f8065cafc523dba5::_isalive() && cankeepusingcrate(player, useobject) && player usebuttonpressed()) {
        var_ef5d5141fdb51174.curprogress = var_ef5d5141fdb51174.curprogress + level.framedurationseconds * var_ef5d5141fdb51174.userate;
        if (var_ef5d5141fdb51174.curprogress >= var_ef5d5141fdb51174.usetime) {
            var_ef5d5141fdb51174.curprogress = 0;
            return 1;
        }
        if (issharedfuncdefined("airdrop", "updateUIProgress")) {
            player [[ getsharedfunc("airdrop", "updateUIProgress") ]](var_ef5d5141fdb51174, 1);
        }
        waitframe();
    }
    var_ef5d5141fdb51174.curprogress = 0;
    return 0;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62f7
// Size: 0x26
function function_7972a1043e6facab() {
    if (utility::iscp()) {
        return "use";
    }
    if (namespace_36f464722d326bbe::function_d04af493b6e718ac()) {
        return "open";
    }
    return "care_package";
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6325
// Size: 0xcb
function makecrateunusable() {
    self notify("makeCrateUnusable");
    /#
        assertex(isdefined(level.cratedata), "makeCrateUnusable() called before initCrateData().");
    #/
    level.cratedata.usablecrates[self getentitynumber()] = undefined;
    self.isusable = 0;
    if (isdefined(self.playerusing)) {
        stopusingcrate(self.playerusing);
    }
    self.playerusing = undefined;
    self makeunusable();
    if (isdefined(self.useobject)) {
        if (isdefined(self.useobject.playerusing)) {
            stopusingcrate(self.useobject.playerusing, self.useobject);
        }
        self.useobject makeunusable();
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63f7
// Size: 0x140
function startusingcrate(player, useobject) {
    if (!isdefined(self.playersusing)) {
        self.playersusing = [];
    }
    if (!array_contains(self.playersusing, player)) {
        self.playersusing = array_add(self.playersusing, player);
    }
    var_ef5d5141fdb51174 = gettriggerobject(useobject);
    leveldata = getleveldata(self.cratetype);
    if (istrue(player.isjuggernaut)) {
        if (issharedfuncdefined("airdrop", "allowActionSet")) {
            player [[ getsharedfunc("airdrop", "allowActionSet") ]]("juggCrateUse", 0);
        }
    } else {
        var_5e8f3dee82c118cf = getdvarint(@"hash_d15c22f57683add1", 1);
        if (var_5e8f3dee82c118cf) {
            player thread airdrop_givecrateuseweapon();
        }
        if (issharedfuncdefined("airdrop", "allowActionSet")) {
            player [[ getsharedfunc("airdrop", "allowActionSet") ]]("crateUse", 0);
        }
    }
    if (issharedfuncdefined("airdrop", "updateUIProgress")) {
        player [[ getsharedfunc("airdrop", "updateUIProgress") ]](var_ef5d5141fdb51174, 0);
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x653e
// Size: 0x46
function airdrop_givecrateuseweapon() {
    self endon("disconnect");
    level endon("game_ended");
    namespace_d325722f2754c2c4::saveweaponstates();
    var_ff937324b8d5708d = makeweapon("ks_use_crate_mp");
    namespace_df5cfdbe6e2d3812::_giveweapon(var_ff937324b8d5708d);
    thread airdrop_watchforcrateuseend(var_ff937324b8d5708d);
    self switchtoweapon(var_ff937324b8d5708d);
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x658b
// Size: 0x77
function airdrop_watchforcrateuseend(var_ff937324b8d5708d) {
    self endon("disconnect");
    level endon("game_ended");
    self waittill("crate_use_end");
    if (namespace_df5cfdbe6e2d3812::isswitchingtoweaponwithmonitoring(var_ff937324b8d5708d)) {
        namespace_df5cfdbe6e2d3812::abortmonitoredweaponswitch(var_ff937324b8d5708d);
    } else {
        namespace_df5cfdbe6e2d3812::_takeweapon(var_ff937324b8d5708d);
        if (isdefined(self.lastdroppableweaponobj)) {
            lastweaponobj = namespace_d325722f2754c2c4::restoreweaponstates(self.lastdroppableweaponobj);
            self switchtoweapon(lastweaponobj);
            thread namespace_df5cfdbe6e2d3812::forcevalidweapon(lastweaponobj);
        }
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6609
// Size: 0x114
function stopusingcrate(player, useobject) {
    if (array_contains(self.playersusing, player)) {
        self.playersusing = array_remove(self.playersusing, player);
    }
    var_ef5d5141fdb51174 = gettriggerobject(useobject);
    leveldata = getleveldata(self.cratetype);
    if (istrue(player.isjuggernaut)) {
        if (issharedfuncdefined("airdrop", "allowActionSet")) {
            player [[ getsharedfunc("airdrop", "allowActionSet") ]]("juggCrateUse", 1);
        }
    } else if (issharedfuncdefined("airdrop", "allowActionSet")) {
        player [[ getsharedfunc("airdrop", "allowActionSet") ]]("crateUse", 1);
    }
    if (issharedfuncdefined("airdrop", "updateUIProgress")) {
        player [[ getsharedfunc("airdrop", "updateUIProgress") ]](var_ef5d5141fdb51174, 0);
    }
    stopusesound(player, useobject);
    player notify("crate_use_end");
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6724
// Size: 0x1a0
function canstartusingcrate(player, useobject, var_c83f8b96968afe72) {
    if (issharedfuncdefined("airdrop", "specialCase_canUseCrate")) {
        if (!player [[ getsharedfunc("airdrop", "specialCase_canUseCrate") ]]()) {
            return 0;
        }
    }
    if (!player val::get("crate_use")) {
        return 0;
    }
    if (!player namespace_f8065cafc523dba5::_isalive()) {
        return 0;
    }
    if (player isonladder()) {
        return 0;
    }
    if (getdvarint(@"hash_618b9c003b5b3883", 0) == 0) {
        if (isdefined(self.playerscaptured) && isdefined(self.playerscaptured[player getentitynumber()])) {
            return 0;
        }
    }
    if (istrue(self.issquadonlycrate)) {
        if (isdefined(self.playersused) && namespace_3c37cb17ade254d::array_contains(self.playersused, player)) {
            return 0;
        }
        if (player.var_ff97225579de16a != self.var_ff97225579de16a || player.team != self.team) {
            return 0;
        }
    }
    if (istrue(self.isteamonlycrate)) {
        if (isdefined(self.playersused) && namespace_3c37cb17ade254d::array_contains(self.playersused, player)) {
            return 0;
        }
        if (player.team != self.team) {
            return 0;
        }
    }
    if (!self.isusable) {
        return 0;
    }
    if (!isdefined(var_c83f8b96968afe72)) {
        var_c83f8b96968afe72 = 1;
    }
    if (var_c83f8b96968afe72) {
        return canstartusingcratetriggerobject(player, useobject);
    }
    if (namespace_36f464722d326bbe::isbrstylegametype() && player isskydiving()) {
        return 0;
    }
    if (istrue(player.inlaststand)) {
        return 0;
    }
    return 1;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68cc
// Size: 0x11b
function canstartusingcratetriggerobject(player, useobject) {
    var_ef5d5141fdb51174 = gettriggerobject(useobject);
    if (isdefined(var_ef5d5141fdb51174.playerusing) && var_ef5d5141fdb51174.playerusing != player) {
        return 0;
    }
    if (var_ef5d5141fdb51174.usetype == 1 && (!isdefined(self.owner) || player != self.owner)) {
        return 0;
    }
    if (var_ef5d5141fdb51174.usetype == 2 && isdefined(self.owner) && player == self.owner) {
        return 0;
    }
    if (level.teambased && isdefined(self.team) && self.team != "neutral") {
        leveldata = getleveldata(self.cratetype);
        if (leveldata.friendlyuseonly && player.team != self.team) {
            return 0;
        }
    }
    return 1;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69ef
// Size: 0xf9
function cankeepusingcrate(player, useobject) {
    if (!val::get("crate_use")) {
        return 0;
    }
    if (!player namespace_f8065cafc523dba5::_isalive()) {
        return 0;
    }
    if (player meleebuttonpressed()) {
        return 0;
    }
    if (player isinexecutionvictim()) {
        return 0;
    }
    if (istrue(player.inlaststand)) {
        return 0;
    }
    leveldata = getleveldata(self.cratetype);
    if (isdefined(leveldata.breakuserangesqr) && distancesquared(player.origin, gettriggerobject(useobject).origin) >= leveldata.breakuserangesqr) {
        return 0;
    }
    if (!self.isusable) {
        return 0;
    }
    if (isdefined(self.cratetype) && self.cratetype == "loadout_drop") {
        if (!player isonground() && !player isswimming()) {
            return 0;
        }
    }
    return 1;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6af0
// Size: 0x112
function makecrateusableforplayer(crate, player) {
    var_ef5d5141fdb51174 = crate gettriggerobject();
    function_b21dea8dc3360508(var_ef5d5141fdb51174, crate);
    if (isdefined(crate.useobject)) {
        var_ef5d5141fdb51174 = crate gettriggerobject(crate.useobject);
        function_b21dea8dc3360508(var_ef5d5141fdb51174, crate);
    }
    crate enableplayeruse(player);
    if (isdefined(crate.useobject)) {
        crate.useobject enableplayeruse(player);
    }
    if (!crate canstartusingcrate(player, crate.useobject, 0)) {
        crate disableplayeruse(player);
        if (isdefined(crate.useobject)) {
            crate.useobject disableplayeruse(player);
        }
    } else {
        if (!crate canstartusingcratetriggerobject(player, undefined)) {
            crate disableplayeruse(player);
        }
        if (isdefined(crate.useobject)) {
            if (!crate canstartusingcratetriggerobject(player, crate.useobject)) {
                crate.useobject disableplayeruse(player);
            }
        }
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c09
// Size: 0x12b
function function_b21dea8dc3360508(var_ef5d5141fdb51174, crate) {
    leveldata = getleveldata(crate.cratetype);
    if (!iscp()) {
        var_ef5d5141fdb51174 setcursorhint("HINT_NOICON");
        var_ef5d5141fdb51174 sethintonobstruction("show");
    } else {
        var_ef5d5141fdb51174 setcursorhint("HINT_BUTTON");
        var_ef5d5141fdb51174 sethintonobstruction("hide");
    }
    var_ef5d5141fdb51174 sethinttag(leveldata.usetag);
    var_ef5d5141fdb51174 sethintdisplayrange(leveldata.userange);
    var_ef5d5141fdb51174 sethintdisplayfov(leveldata.usefov);
    var_ef5d5141fdb51174 setuserange(leveldata.userange);
    var_ef5d5141fdb51174 setusefov(leveldata.usefov);
    var_ef5d5141fdb51174 setusepriority(leveldata.usepriority);
    var_ef5d5141fdb51174 setuseholdduration("duration_none");
    if (var_ef5d5141fdb51174.usetype == 1 && crate.supportsreroll) {
        var_ef5d5141fdb51174 sethintstring(crate.rerollstring);
    } else {
        var_ef5d5141fdb51174 sethintstring(crate.capturestring);
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d3b
// Size: 0x229
function watchallcrateusability() {
    var_36afca263bbc6fbc = 0;
    if (getdvarint(@"hash_8a7e8eb2a9a7101", 0)) {
        var_36afca263bbc6fbc = 1;
    }
    while (1) {
        foreach (crate in level.cratedata.usablecrates) {
            if (!isdefined(crate)) {
                continue;
            }
            crate makeusable();
            if (istrue(var_36afca263bbc6fbc)) {
                crate disableplayeruseforallplayers();
            }
            if (isdefined(crate.useobject)) {
                crate.useobject makeusable();
                if (istrue(var_36afca263bbc6fbc)) {
                    crate.useobject disableplayeruseforallplayers();
                }
            }
            playerlist = level.players;
            if (istrue(var_36afca263bbc6fbc)) {
                if (level.teambased && isdefined(crate.team) && crate.team != "neutral") {
                    leveldata = getleveldata(crate.cratetype);
                    if (leveldata.friendlyuseonly) {
                        playerlist = level.teamdata[crate.team]["alivePlayers"];
                    }
                }
            }
            foreach (player in playerlist) {
                if (isdefined(crate.var_83cf634784b3a96b)) {
                    jumpiftrue(crate [[ crate.var_83cf634784b3a96b ]](player)) LOC_000001b6;
                } else if (istrue(var_36afca263bbc6fbc)) {
                    inrange = distancesquared(crate.origin, player.origin) < 57600;
                    if (inrange) {
                        makecrateusableforplayer(crate, player);
                    }
                } else {
                    makecrateusableforplayer(crate, player);
                }
            }
        }
        wait(0.1);
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f6b
// Size: 0x52
function playusesound(player, useobject) {
    var_ef5d5141fdb51174 = gettriggerobject(useobject);
    if (var_ef5d5141fdb51174.usetype == 1) {
        player playloopsound("mp_care_package_owner_cap");
    } else {
        player playloopsound("mp_care_package_non_owner_cap");
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6fc4
// Size: 0x68
function stopusesound(player, useobject) {
    var_ef5d5141fdb51174 = gettriggerobject(useobject);
    if (var_ef5d5141fdb51174.usetype == 1) {
        player stoploopsound("mp_care_package_owner_cap");
    } else {
        player stoploopsound("mp_care_package_non_owner_cap");
    }
    if (player namespace_f8065cafc523dba5::_isalive()) {
        player playsoundonmovingent("mp_care_package_cap_tail");
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7033
// Size: 0x16
function gettriggerobject(useobject) {
    return isdefined(useobject) ? self : useobject;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7051
// Size: 0x181
function cratephysicson(contactpoint, force) {
    leveldata = getleveldata(self.cratetype);
    if (isdefined(leveldata.cratephysicsoncallback)) {
        self thread [[ leveldata.cratephysicsoncallback ]]();
    }
    if (!isdefined(contactpoint)) {
        contactpoint = (0, 0, 0);
    }
    if (!isdefined(force)) {
        force = (0, 0, 0);
    }
    self unlink();
    self physicslaunchserver(contactpoint, force);
    if (isdefined(self.killcament) && !istrue(self.killcament.linked)) {
        self.killcament linkto(self, "tag_origin", (0, 0, 300), (0, 0, 0));
    }
    var_212a44a5393c3b34 = self physics_getbodyid(0);
    physics_setbodycenterofmassnormal(var_212a44a5393c3b34, (0, 0, -0.75));
    self.physicsactivated = 1;
    createdangerzone();
    thread monitoraveragevelocityandupdate();
    thread monitorplayerimpact();
    if (isdefined(level.wztrain_info) && issharedfuncdefined("game", "handlemovingplatforms")) {
        data = spawnstruct();
        data.deathoverridecallback = &function_a4d56f106b5ad5f9;
        self thread [[ getsharedfunc("game", "handlemovingplatforms") ]](data);
    }
    thread monitorimpact();
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x71d9
// Size: 0x11b
function function_a4d56f106b5ad5f9(data) {
    engine = namespace_9db09f982acd35b4::function_d6b0a591ac99bd();
    /#
        assert(isdefined(engine));
    #/
    if (!isdefined(engine)) {
        return;
    }
    if (is_equal(data.lasttouchedplatform, engine)) {
        if (!istrue(self.hitbytrain) || isdefined(self.cratetype) && self.cratetype == "battle_royale_elite_chopper") {
            force = engine.velocity * 150;
            contactpoint = engine.origin + rotatevector((375, 0, -100), engine.angles);
            self playsound("mp_care_package_high_impact");
            self physicslaunchserver(contactpoint, force);
            self.hitbytrain = 1;
        } else {
            namespace_6c578d6ef48f10ef::destroycrate();
            return;
        }
    }
    wait(1);
    data = spawnstruct();
    data.deathoverridecallback = &function_a4d56f106b5ad5f9;
    self thread [[ getsharedfunc("game", "handlemovingplatforms") ]](data);
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72fb
// Size: 0x48
function cratephysicsoff() {
    if (!istrue(self.physicsactivated)) {
        return;
    }
    self.physicsactivated = undefined;
    self.physicssettled = undefined;
    self physicsstopserver();
    clearaveragevelocities();
    monitorimpactend();
    monitorplayerimpactend();
    cancelchecklinktotrain();
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x734a
// Size: 0x1c1
function monitoraveragevelocityandupdate() {
    self endon("death");
    self notify("monitorAverageVelocityAndUpdate");
    self endon("monitorAverageVelocityAndUpdate");
    var_fea57fa0e78c63db = 0.1;
    thread monitoraveragevelocities(var_fea57fa0e78c63db, 8);
    var_717e0cfd076f91d = 0;
    var_4080d353839c6230 = 0;
    self.isfirstactivation = 1;
    var_1684a0b0fb3502c6 = undefined;
    var_42d273fe9538af56 = undefined;
    if (issharedfuncdefined("game", "lpcFeatureGated")) {
        var_42d273fe9538af56 = getsharedfunc("game", "lpcFeatureGated");
    }
    while (1) {
        avlinvel = getaveragelinearvelocity();
        avangvel = getaverageangularvelocity();
        if (isdefined(avlinvel) && isdefined(avangvel)) {
            if (avlinvel <= function_3c4492046080faa9() && avangvel <= function_f7e3f128296ac3b6()) {
                var_717e0cfd076f91d++;
                var_4080d353839c6230 = 0;
                if (var_717e0cfd076f91d == function_d4833b6c916db9c6()) {
                    self.physicssettled = 1;
                    var_1684a0b0fb3502c6 = self.origin;
                    thread activatecrate(self.isfirstactivation);
                    if (isdefined(var_42d273fe9538af56) && [[ var_42d273fe9538af56 ]]()) {
                        monitorimpactend();
                        if (isdefined(self.killcament)) {
                            self.killcament delete();
                        }
                    }
                    var_fea57fa0e78c63db = 0.1;
                    thread monitoraveragevelocities(var_fea57fa0e78c63db, 3, 3);
                    destroycrateinbadtrigger();
                }
            } else {
                if (isdefined(var_1684a0b0fb3502c6)) {
                    if (distancesquared(self.origin, var_1684a0b0fb3502c6) <= 2500) {
                        wait(var_fea57fa0e78c63db);
                        continue;
                    }
                }
                var_4080d353839c6230++;
                var_717e0cfd076f91d = 0;
                if (var_4080d353839c6230 == 1) {
                    self.physicssettled = undefined;
                    thread deactivatecrate();
                    var_fea57fa0e78c63db = 0.1;
                    thread monitoraveragevelocities(var_fea57fa0e78c63db, 8);
                }
            }
            wait(var_fea57fa0e78c63db);
        } else {
            waitframe();
        }
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7512
// Size: 0x1e0
function monitoraveragevelocities(var_fea57fa0e78c63db, var_6fb2f8a2df503284, var_2b14322307dd13aa) {
    clearaveragevelocities();
    self endon("death");
    self endon("clear_average_velocities");
    self.linvels = [];
    self.angvels = [];
    self.velstartid = 0;
    self.velendid = 0;
    self.velnumdatapoints = var_6fb2f8a2df503284;
    if (isdefined(var_2b14322307dd13aa)) {
        var_2b14322307dd13aa = int(clamp(var_2b14322307dd13aa, 0, var_6fb2f8a2df503284));
        if (var_2b14322307dd13aa > 0) {
            for (i = 0; i < var_2b14322307dd13aa; i++) {
                self.linvels[self.velstartid + i] = 0;
                self.angvels[self.velstartid + i] = 0;
            }
        }
    }
    while (1) {
        var_212a44a5393c3b34 = self physics_getbodyid(0);
        var_4da28b63de5ae3c7 = physics_getbodylinvel(var_212a44a5393c3b34);
        var_7ca7f0bb1a73c93a = physics_getbodyangvel(var_212a44a5393c3b34);
        self.linvels[self.velendid] = length(var_4da28b63de5ae3c7);
        self.angvels[self.velendid] = length(var_7ca7f0bb1a73c93a);
        self.velendid++;
        var_e8d39b65d6180c15 = self.velendid - self.velstartid;
        if (var_e8d39b65d6180c15 > var_6fb2f8a2df503284) {
            shift = mod(var_e8d39b65d6180c15, var_6fb2f8a2df503284);
            for (i = 0; i < shift; i++) {
                self.linvels[self.velstartid + i] = undefined;
                self.angvels[self.velstartid + i] = undefined;
            }
            self.velstartid = self.velstartid + shift;
        }
        self.avlinvel = undefined;
        self.avangvel = undefined;
        wait(var_fea57fa0e78c63db);
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76f9
// Size: 0x5b
function getaveragelinearvelocity() {
    if (isdefined(self.avlinvel)) {
        return self.avlinvel;
    }
    if (!isdefined(self.linvels)) {
        return undefined;
    }
    if (self.velendid - self.velstartid < self.velnumdatapoints) {
        return undefined;
    }
    calculateaveragevelocities();
    return self.avlinvel;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x775c
// Size: 0x5b
function getaverageangularvelocity() {
    if (isdefined(self.avangvel)) {
        return self.avangvel;
    }
    if (!isdefined(self.angvels)) {
        return undefined;
    }
    if (self.velendid - self.velstartid < self.velnumdatapoints) {
        return undefined;
    }
    calculateaveragevelocities();
    return self.avangvel;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77bf
// Size: 0x89
function calculateaveragevelocities() {
    var_7a89fce67703419f = 0;
    var_3386dde146fd60b4 = 0;
    for (i = self.velstartid; i < self.velendid; i++) {
        var_7a89fce67703419f = var_7a89fce67703419f + self.linvels[i];
        var_3386dde146fd60b4 = var_3386dde146fd60b4 + self.angvels[i];
    }
    self.avlinvel = var_7a89fce67703419f / self.velnumdatapoints;
    self.avangvel = var_3386dde146fd60b4 / self.velnumdatapoints;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x784f
// Size: 0x51
function clearaveragevelocities() {
    self notify("clear_average_velocities");
    self.linvels = undefined;
    self.angvels = undefined;
    self.velnumdatapoints = undefined;
    self.velstartid = undefined;
    self.velendid = undefined;
    self.avlinvel = undefined;
    self.avangvel = undefined;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78a7
// Size: 0x4d
function monitorimpact(delay) {
    monitorimpactend();
    self endon("monitorImpactEnd");
    self.monitoringimpact = 1;
    self playloopsound("mp_care_package_drop_lp");
    self physics_registerforcollisioncallback();
    monitorimpactinternal(delay);
    if (isdefined(self)) {
        thread monitorimpactend();
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78fb
// Size: 0x30e
function monitorimpactinternal(delay) {
    self endon("death");
    if (isdefined(delay)) {
        wait(delay);
    }
    var_260ef1536027d0e1 = 0;
    var_20be7f8f0dc3db57 = 0;
    while (1) {
        ent = impulse = normal = position = flag1 = flag0 = body1 = body0 = self waittill("collision");
        if (!istrue(var_20be7f8f0dc3db57)) {
            if (isdefined(self.killcament)) {
                self.killcament unlink();
                self.killcament.linked = 0;
            }
            var_20be7f8f0dc3db57 = 1;
        }
        if (isdefined(ent)) {
            if (impactshoulddestroyent(ent)) {
                if (isdefined(ent.vehicletype)) {
                    if (isdefined(ent.streakinfo)) {
                        if (isdefined(ent.var_3098bbcd22d0e052) && isdefined(ent.var_3098bbcd22d0e052.cleanupfunc)) {
                            ent thread [[ ent.var_3098bbcd22d0e052.cleanupfunc ]]();
                        } else if (ent namespace_bba8bc8532aa4913::ishelperdrone()) {
                            ent thread namespace_bba8bc8532aa4913::function_ba1c5496f8fc5f67();
                        }
                    } else if (getdvarint(@"hash_35d73d70c6843ce8", 1)) {
                        var_62ccfb7ea15a4520 = ent namespace_1f188a13f7e79610::function_62ccfb7ea15a4520();
                        if (!var_62ccfb7ea15a4520 && !istrue(ent.var_a2ba7043631b3392)) {
                            ent.var_a8f4bb03b366aa80 = 1;
                            ent namespace_1f188a13f7e79610::vehicle_explode();
                        }
                    }
                } else if (ent.classname == "scriptable_iw8_chicken_01") {
                    thread airdrop_crushchicken(ent);
                } else if (isdefined(ent.equipmentref) && ent.equipmentref == "equip_tac_cover") {
                    ent [[ ent.deletefunc ]](0, 1, 1);
                } else if (isdefined(ent.turrettype) && ent.turrettype == "sentry_turret") {
                    ent notify("kill_turret", 1);
                }
            }
            checklinktotrain(ent);
        }
        if (gettime() - var_260ef1536027d0e1 >= 200) {
            var_260ef1536027d0e1 = gettime();
            surface = physics_getsurfacetypefromflags(flag1);
            surfacetype = getsubstr(surface["name"], 9);
            if (surfacetype == "glass_pane") {
                glassradiusdamage(self.origin - (0, 0, 10), 100, 1000, 1000);
                waitframe();
                cratephysicson();
            }
            if (surfacetype == "water" && !istrue(self.inwater)) {
                self.inwater = 1;
            }
            if (surfacetype == "user_terrain1") {
                surfacetype = "user_terrain_1";
            }
            if (surfacetype == "user_terrain5") {
                surfacetype = "user_terrain_5";
            }
            playimpactfx(position, normal, impulse, surfacetype);
        }
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c10
// Size: 0x89
function checklinktotrain(ent) {
    if (isdefined(ent) && isdefined(ent.script_noteworthy) && isstartstr(ent.script_noteworthy, "train_") && !isdefined(self getlinkedparent())) {
        if (isdefined(self.trainent)) {
            if (self.trainent == ent) {
                return;
            } else {
                cancelchecklinktotrain();
            }
        }
        self.trainent = ent;
        self.traincylestolink = 4;
        thread checklinktotraininternal(ent);
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ca0
// Size: 0x232
function checklinktotraininternal(ent) {
    self endon("death");
    self endon("cancel_link_to_train");
    ent endon("death");
    leveldata = getleveldata(self.cratetype);
    contents = create_contents(0, 1, 0, 0, 0, 1, 1, 0, 0);
    ignorelist = [0:self];
    foreach (linkedent in self getlinkedchildren(1)) {
        ignorelist[ignorelist.size] = linkedent;
    }
    self.traintracefails = 0;
    self.traintracesuccesses = 0;
    while (self.traintracefails < 20) {
        caststart = self.origin + anglestoup(self.angles) * leveldata.halfheight;
        castend = caststart + (0, 0, -200);
        traceresult = namespace_2a184fc4902783dc::ray_trace(caststart, castend, ignorelist, contents);
        if (traceresult.size > 0 && isdefined(traceresult["entity"]) && namespace_9db09f982acd35b4::is_train_ent(traceresult["entity"])) {
            traintracerelpos = combineangles(invertangles(ent.angles), ent.origin - traceresult["position"]);
            if (!isdefined(self.traintracerelpos)) {
                goto LOC_0000020f;
            }
            if (distancesquared(traintracerelpos, self.traintracerelpos) > 10) {
                self.traintracefails++;
                self.traintracesuccesses = 0;
            } else {
                self.traintracesuccesses++;
                if (self.traintracesuccesses >= 4) {
                    self linkto(ent);
                    activatecrate(self.isfirstactivation);
                    thread cratephysicsoff();
                    break;
                }
            LOC_0000020f:
            }
        LOC_0000020f:
            self.traintracerelpos = traintracerelpos;
        } else {
            break;
        }
        wait(0.1);
    }
    thread cancelchecklinktotrain();
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ed9
// Size: 0x33
function cancelchecklinktotrain() {
    self notify("cancel_link_to_train");
    self.trainent = undefined;
    self.traintracerelpos = undefined;
    self.traintracefails = undefined;
    self.traintracesuccesses = undefined;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f13
// Size: 0x55
function airdrop_crushchicken(chicken) {
    self endon("death");
    var_5aabd8cbb69fe289 = gettime();
    while (gettime() - var_5aabd8cbb69fe289 < 3000) {
        chicken dodamage(100, chicken.origin, self, self, "MOD_CRUSH");
        wait(0.5);
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f6f
// Size: 0x36
function monitorimpactend() {
    if (!istrue(self.monitoringimpact)) {
        return;
    }
    self notify("monitorImpactEnd");
    self.monitoringimpact = undefined;
    self stoploopsound("mp_care_package_drop_lp");
    self physics_unregisterforcollisioncallback();
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fac
// Size: 0xc0
function impactshoulddestroyent(entity) {
    if (!istrue(self.physicssettled)) {
        if (isdefined(entity.classname)) {
            if (entity.classname == "worldSpawn") {
                return 0;
            } else if (entity.classname == "script_vehicle" && entity.targetname != "veh_jup_nuclear_locomotive") {
                return 1;
            } else if (entity.classname == "misc_turret") {
                return 1;
            } else if (issubstr(entity.classname, "scriptable_")) {
                return 1;
            } else if (entity.classname == "script_model") {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8074
// Size: 0x16a
function monitorplayerimpact() {
    monitorplayerimpactend();
    self endon("death");
    self endon("monitorPlayerImpactEnd");
    var_1b7ae3ffb4d76416 = self;
    if (isdefined(self.mountmantlemodel)) {
        var_1b7ae3ffb4d76416 = self.mountmantlemodel;
    }
    damageent = undefined;
    if (isdefined(self.owner)) {
        damageent = self.owner;
    }
    while (isdefined(var_1b7ae3ffb4d76416)) {
        linearvelocity = player = var_1b7ae3ffb4d76416 waittill("player_pushed");
        if (isdefined(player) && (isplayer(player) || isagent(player)) && player namespace_f8065cafc523dba5::_isalive()) {
            var_c421c5c1222e83f4 = linearvelocity[2] <= -8;
            var_2da284613791696f = 0;
            playerposition = undefined;
            if (player tagexists("j_mainroot")) {
                playerposition = player gettagorigin("j_mainroot");
                leveldata = getleveldata(self.cratetype);
                midpoint = self.origin + anglestoup(self.angles) * leveldata.halfheight;
                var_2da284613791696f = playerposition[2] <= midpoint[2];
            }
            if (var_c421c5c1222e83f4 && var_2da284613791696f) {
                eattacker = damageent;
                if (!isdefined(eattacker)) {
                    eattacker = player;
                }
            }
        }
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81e5
// Size: 0xb
function monitorplayerimpactend() {
    self notify("monitorPlayerImpactEnd");
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81f7
// Size: 0xce
function playimpactfx(position, normal, impulse, surfacetype) {
    if (surfacetype != "glass_pane") {
        var_64eb7ced98f907bd = "airdrop_crate_impact_ground";
        if (surfacetype == "water") {
            var_64eb7ced98f907bd = "airdrop_crate_impact_water";
            self playsurfacesound("mp_care_package_impact_water_body", surfacetype);
        } else if (impulse > 350) {
            self playsurfacesound("mp_care_package_high_impact", surfacetype);
        } else if (350 > impulse && impulse > 175) {
            self playsurfacesound("mp_care_package_med_impact", surfacetype);
        } else if (175 > impulse && impulse > 30) {
            self playsurfacesound("mp_care_package_low_impact", surfacetype);
        }
        playfx(getfx(var_64eb7ced98f907bd), position, normal);
    }
    self stoploopsound("mp_care_package_drop_lp");
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82cc
// Size: 0x192
function createdangerzone() {
    if (issharedfuncdefined("game", "lpcFeatureGated") && [[ getsharedfunc("game", "lpcFeatureGated") ]]()) {
        return;
    }
    if (!issharedfuncdefined("spawn", "addSpawnDangerZone")) {
        return;
    }
    destroydangerzone();
    leveldata = getleveldata(self.cratetype);
    dangerzoneid = undefined;
    if (isdefined(self.markerposition)) {
        if (isdefined(self.owner) && isdefined(self.team)) {
            dangerzoneid = [[ getsharedfunc("spawn", "addSpawnDangerZone") ]](self.markerposition, leveldata.dangerzoneradius, leveldata.dangerzoneheight, self.team, 30, self.owner, 1);
        } else if (isdefined(self.team)) {
            dangerzoneid = [[ getsharedfunc("spawn", "addSpawnDangerZone") ]](self.markerposition, leveldata.dangerzoneradius, leveldata.dangerzoneheight, self.team, 30);
        } else {
            dangerzoneid = spawnuniversaldangerzone(self.markerposition, leveldata.dangerzoneradius, leveldata.dangerzoneheight, 30);
        }
        /#
            thread namespace_f2ffc0540883e1ad::drawsphere(self.markerposition, 128, 30, (1, 0, 0));
        #/
    }
    self.dangerzoneid = dangerzoneid;
    return dangerzoneid;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8466
// Size: 0x80
function spawnuniversaldangerzone(position, radius, height, timeout) {
    if (issharedfuncdefined("spawn", "addSpawnDangerZone")) {
        dangerzoneid = [[ getsharedfunc("spawn", "addSpawnDangerZone") ]](position, radius, height, undefined, timeout, level.players[randomint(level.players.size)], 1);
        self.dangerzoneid = dangerzoneid;
        return dangerzoneid;
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84ed
// Size: 0x78
function destroydangerzone() {
    if (issharedfuncdefined("spawn", "isSpawnDangerZoneAlive") && issharedfuncdefined("spawn", "removeSpawnDangerZone")) {
        dangerzoneid = self.dangerzoneid;
        if (isdefined(dangerzoneid) && [[ getsharedfunc("spawn", "isSpawnDangerZoneAlive") ]](dangerzoneid)) {
            [[ getsharedfunc("spawn", "removeSpawnDangerZone") ]](dangerzoneid);
        }
        self.dangerzoneid = undefined;
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x856c
// Size: 0x9d
function _createnavobstacle() {
    self notify("createNavObstacle");
    self endon("createNavObstacle");
    if (isdefined(self.navobstacleid)) {
        destroynavobstacle(self.navobstacleid);
    }
    leveldata = getleveldata(self.cratetype);
    navobstacleid = createnavobstaclebybounds(self.origin, leveldata.navobstaclebounds, self.angles);
    self.navobstacleid = navobstacleid;
    childthread _watchnavobstacle(navobstacleid, self.origin, leveldata.navobstacleupdatedistsqr);
    return navobstacleid;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8611
// Size: 0x48
function _watchnavobstacle(id, origin, var_ecfeaf96c94abe6e) {
    self endon("death");
    while (distancesquared(origin, self.origin) < var_ecfeaf96c94abe6e) {
        wait(0.5);
    }
    thread _createnavobstacle();
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8660
// Size: 0x31
function _destroynavobstacle() {
    self notify("createNavObstacle");
    if (isdefined(self.navobstacleid)) {
        destroynavobstacle(self.navobstacleid);
    }
    self.navobstacleid = undefined;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8698
// Size: 0x124
function createmountmantlemodel() {
    leveldata = getleveldata(self.cratetype);
    if (isdefined(leveldata.mountmantlemodel)) {
        if (isdefined(self.mountmantlemodel)) {
            self.mountmantlemodel delete();
        }
        mountmantlemodel = spawn("script_model", self.origin);
        mountmantlemodel dontinterpolate();
        mountmantlemodel.angles = self.angles;
        mountmantlemodel.owner = self.owner;
        mountmantlemodel.unresolved_collision_func = &crateunresolvedcollisioncallback;
        mountmantlemodel.killcament = self.killcament;
        mountmantlemodel.mountmantlemodel = 1;
        mountmantlemodel.var_2ee93f095dc416f8 = 1;
        mountmantlemodel.unresolved_collision_notify_min = 1;
        mountmantlemodel clonebrushmodeltoscriptmodel(level.cratedata.mountmantlemodel);
        mountmantlemodel linkto(self);
        self.mountmantlemodel = mountmantlemodel;
        mountmantlemodel.crate = self;
        return 1;
    }
    return 0;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87c4
// Size: 0x29
function destroymountmantlemodel() {
    if (isdefined(self.mountmantlemodel)) {
        self.mountmantlemodel delete();
    }
    self.mountmantlemodel = undefined;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87f4
// Size: 0x108
function crateunresolvedcollisioncallback(hitent, penetration) {
    /#
        assertex(isdefined(level.cratedata), "crateUnresolvedCollisionCallback() called before initCrateData().");
    #/
    if (level.cratedata.unresolvedcollisiontolerancesqr > 0) {
        if (lengthsquared(penetration) <= level.cratedata.unresolvedcollisiontolerancesqr) {
            return;
        }
    }
    objweapon = self.objweapon;
    if (isdefined(self.create)) {
        objweapon = self.crate.objweapon;
    }
    hitent dodamage(1000, hitent.origin, self.owner, self, "MOD_CRUSH", objweapon);
    self endon("death");
    hitent endon("death_or_disconnect");
    if (isplayer(hitent) && hitent namespace_f8065cafc523dba5::_isalive()) {
        if (issharedfuncdefined("airdrop", "unresolvedCollisionNearestNode")) {
            [[ getsharedfunc("airdrop", "unresolvedCollisionNearestNode") ]](hitent, undefined, self);
        }
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8903
// Size: 0x1d4
function _createheadicon() {
    if (istrue(self.disallowheadiconid)) {
        return;
    }
    namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.headiconid);
    leveldata = getleveldata(self.cratetype);
    headiconid = undefined;
    if (isdefined(self.headicon)) {
        headiconoffset = function_c857ac89588adf6f();
        if (level.teambased && isdefined(self.team)) {
            if (!namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
                headiconid = namespace_7bdde15c3500a23f::setheadicon_singleimage(self.team, self.headicon, headiconoffset, 1, leveldata.headicondrawrange, leveldata.headiconnaturalrange, undefined, 1);
            }
            if (isdefined(headiconid)) {
                if (issharedfuncdefined("game", "isMLGMatch")) {
                    if ([[ getsharedfunc("game", "isMLGMatch") ]]()) {
                        addteamtoheadiconmask(headiconid, "spectator");
                    }
                }
            }
        } else if (isdefined(self.owner)) {
            if (!namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
                headiconid = namespace_7bdde15c3500a23f::setheadicon_singleimage(self.owner, self.headicon, headiconoffset, 1, leveldata.headicondrawrange, leveldata.headiconnaturalrange, undefined, 1);
            }
            if (isdefined(headiconid)) {
                if (issharedfuncdefined("game", "isMLGMatch")) {
                    if ([[ getsharedfunc("game", "isMLGMatch") ]]()) {
                        addteamtoheadiconmask(headiconid, "spectator");
                    }
                }
            }
        } else if (!namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
            headiconid = namespace_7bdde15c3500a23f::setheadicon_singleimage(level.teamnamelist, self.headicon, headiconoffset, 1, leveldata.headicondrawrange, leveldata.headiconnaturalrange);
        }
    }
    self.headiconid = headiconid;
    self.headiconactive = 1;
    return headiconid;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8adf
// Size: 0x28
function _destroyheadicon() {
    namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.headiconid);
    self.headiconid = undefined;
    self.headiconactive = 0;
    waitframe();
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b0e
// Size: 0x6f
function function_3a065ce769b6ce3d() {
    if (isdefined(self.var_7b5e5c2bbc8f9f79)) {
        objective_delete(self.var_7b5e5c2bbc8f9f79);
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.var_7b5e5c2bbc8f9f79);
        self.var_7b5e5c2bbc8f9f79 = undefined;
    } else if (self isscriptable() && self getscriptablehaspart("objective")) {
        self setscriptablepartstate("objective", "inactive");
        self.var_83746f6469687186 = undefined;
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b84
// Size: 0x109
function createminimapicon() {
    destroyminimapicon();
    leveldata = getleveldata(self.cratetype);
    minimapid = undefined;
    if (isdefined(self.minimapicon) && !istrue(self.visibilitymanuallycontrolled)) {
        createfunc = undefined;
        if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "createObjective")) {
            createfunc = namespace_3c37cb17ade254d::getsharedfunc("game", "createObjective");
        }
        if (isdefined(createfunc)) {
            if (level.teambased && isdefined(self.team)) {
                minimapid = self [[ createfunc ]](self.minimapicon, undefined, 1, 1);
            } else if (isdefined(self.owner)) {
                minimapid = self [[ createfunc ]](self.minimapicon, undefined, 1, 1);
            } else {
                minimapid = self [[ createfunc ]](self.minimapicon, undefined, 0, 1);
            }
        }
    }
    namespace_5a22b6f3a56f7e9b::function_79a1a16de6b22b2d(minimapid, 24);
    self.minimapid = minimapid;
    self.minimapiconactive = 1;
    return minimapid;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c95
// Size: 0x53
function destroyminimapicon() {
    if (isdefined(self.minimapid)) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "returnObjectiveID")) {
            [[ namespace_3c37cb17ade254d::getsharedfunc("game", "returnObjectiveID") ]](self.minimapid);
        }
    }
    self.minimapid = undefined;
    self.minimapiconactive = 0;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8cef
// Size: 0x68
function looselinkto(parent, offset, instancedata) {
    self endon("death");
    parent endon("death");
    self notify("looseLinkTo");
    self endon("looseLinkToEnd");
    while (istrue(self.physicsactivated)) {
        self.origin = parent.origin + offset;
        waitframe();
    }
    self linkto(parent);
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d5e
// Size: 0x37
function addtolists() {
    /#
        assertex(isdefined(level.cratedata), "addToLists() called before initCrateData().");
    #/
    level.cratedata.crates[self getentitynumber()] = self;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d9c
// Size: 0x2f
function removefromlists(id) {
    if (!isdefined(level.cratedata)) {
        return;
    }
    level.cratedata.crates[id] = undefined;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8dd2
// Size: 0x176
function getrandomkeyfromweightsarray(arr, var_cd71448fd6b9eb3f) {
    if (isdefined(var_cd71448fd6b9eb3f)) {
        if (!isarray(var_cd71448fd6b9eb3f)) {
            var_cd71448fd6b9eb3f = [0:var_cd71448fd6b9eb3f];
        }
    }
    var_4094287ff08e6d28 = [];
    var_6fb7daf6138d07d0 = [];
    maxval = 0;
    foreach (key, weight in arr) {
        if (weight > 0) {
            isexcluded = 0;
            if (isdefined(var_cd71448fd6b9eb3f)) {
                if (var_cd71448fd6b9eb3f.size > 0) {
                    foreach (id, var_8dd561da22c5839a in var_cd71448fd6b9eb3f) {
                        if (var_8dd561da22c5839a == key) {
                            var_cd71448fd6b9eb3f[id] = undefined;
                            isexcluded = 1;
                            break;
                        }
                    }
                } else {
                    var_cd71448fd6b9eb3f = undefined;
                }
            }
            if (!isexcluded) {
                maxval = maxval + weight;
                var_4094287ff08e6d28[var_4094287ff08e6d28.size] = key;
                var_6fb7daf6138d07d0[var_6fb7daf6138d07d0.size] = maxval;
            }
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

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f50
// Size: 0x8
function getdefaultcapturevisualscallback() {
    return &defaultcapturevisualscallback;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f60
// Size: 0x14
function getdefaultcapturevisualsdeletiondelay() {
    return getanimlength(script_model%mp_military_carepackage_straps_falling) + 1;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f7c
// Size: 0x10a
function defaultcapturevisualscallback(model) {
    if (!isdefined(self)) {
        return;
    }
    if (istrue(self.isdummyarmcrate)) {
        return;
    }
    if (!isdefined(model)) {
        return;
    }
    animtime = getanimlength(script_model%mp_military_carepackage_straps_falling);
    if (isdefined(animtime)) {
        animtime = max(0, animtime);
    }
    model.animname = "care_package";
    model namespace_bc4a4b9456315863::setanimtree();
    model thread namespace_bc4a4b9456315863::anim_single_solo(model, "care_package_capture");
    model setscriptablepartstate(#"capture", #"start", 0);
    if (isdefined(animtime)) {
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(animtime);
    }
    cratetype = model.cratetype;
    var_cd0883c0dcdd304e = #"fade";
    if (istrue(self.inwater)) {
        var_cd0883c0dcdd304e = #"hash_de840e2572f006d3";
    }
    model setscriptablepartstate(#"capture", var_cd0883c0dcdd304e, 0);
    model setscriptablepartstate(#"visibility", #"hide", 0);
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x908d
// Size: 0x4
function getdefaultdestroyvisualsdeletiondelay() {
    return 0;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9099
// Size: 0x8
function getdefaultdestroyvisualscallback() {
    return &defaultdestroyvisualscallback;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90a9
// Size: 0xc
function defaultdestroyvisualscallback(model) {
    
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90bc
// Size: 0x16
function getdefaultmountmantlemodel() {
    return level.cratedata.mountmantlemodel;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90da
// Size: 0x26
function getnumdroppedcrates() {
    if (!isdefined(level.cratedata)) {
        return 0;
    }
    return level.cratedata.crates.size;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9108
// Size: 0x35
function function_58f652f9f3a0775() {
    if (issharedfuncdefined("damage", "_suicide")) {
        self thread [[ getsharedfunc("damage", "_suicide") ]]();
    } else {
        self suicide();
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9144
// Size: 0x225
function trackcratemantlingexploit() {
    if (!isdefined(self.entmantlingendtime)) {
        if (self ismantling()) {
            entmantling = self getmovingplatformparent();
            if (isdefined(entmantling) && isdefined(entmantling.crate)) {
                self.entmantling = entmantling;
                self.entmantlingcrate = entmantling.crate;
            }
            self.entmantlingendtime = gettime() + 1000;
        }
    } else if (gettime() >= self.entmantlingendtime) {
        self.entmantling = undefined;
        self.entmantlingcrate = undefined;
        self.entmantlingendtime = undefined;
    } else {
        foreach (crate in level.cratedata.crates) {
            if (isdefined(crate) && istrue(crate.physicsactivated) && !istrue(crate.physicssettled)) {
                if (isdefined(self.entmantling)) {
                    if (isdefined(crate.mountmantlemodel)) {
                        if (self.entmantling != crate.mountmantlemodel) {
                            if (self istouching(crate.mountmantlemodel)) {
                                self.entmantling = undefined;
                                self.entmantlingcrate = undefined;
                                self.entmantlingendtime = undefined;
                                function_58f652f9f3a0775();
                                return;
                            }
                        }
                    }
                    if (self.entmantlingcrate != crate) {
                        if (self istouching(crate)) {
                            self.entmantling = undefined;
                            self.entmantlingcrate = undefined;
                            self.entmantlingendtime = undefined;
                            function_58f652f9f3a0775();
                            return;
                        }
                    }
                } else if (self istouching(crate) || isdefined(crate.mountmantlemodel) && self istouching(crate.mountmantlemodel)) {
                    self.entmantling = undefined;
                    self.entmantlingcrate = undefined;
                    self.entmantlingendtime = undefined;
                    function_58f652f9f3a0775();
                    return;
                }
            }
        }
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9370
// Size: 0x1f3
function function_b6469ac2ab6f3dc6() {
    var_4f35a480b277acb6 = function_869ccb4e3451b8c6([0:"etype_player"]);
    radius = getdvarint(@"hash_e9b16488fdec1843", 100);
    while (1) {
        foreach (crate in level.cratedata.crates) {
            if (!isdefined(crate) || !istrue(crate.physicsactivated) || istrue(crate.physicssettled)) {
                continue;
            }
            var_ef269077a28646eb = function_b1eef70090b5b7b5(crate.origin, radius, var_4f35a480b277acb6);
            foreach (p in var_ef269077a28646eb) {
                if (p ismantling()) {
                    entmantling = p getmovingplatformparent();
                    if (isdefined(entmantling) && isdefined(entmantling.crate)) {
                        if (isdefined(crate.mountmantlemodel)) {
                            if (entmantling != crate.mountmantlemodel && p istouching(crate.mountmantlemodel)) {
                                p function_58f652f9f3a0775();
                            }
                        } else if (entmantling.crate != crate) {
                            if (p istouching(crate)) {
                                p function_58f652f9f3a0775();
                            }
                        }
                    } else if (p istouching(crate) || isdefined(crate.mountmantlemodel) && p istouching(crate.mountmantlemodel)) {
                        p function_58f652f9f3a0775();
                    }
                }
            }
        }
        waitframe();
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x956a
// Size: 0xe3
function overridecapturestring(var_4c918b514697b434) {
    /#
        assertex(isdefined(var_4c918b514697b434), "overrideCrateCaptureString() requires a stringOverride.");
    #/
    if (isdefined(self.capturestring) && self.capturestring == var_4c918b514697b434) {
        return;
    }
    self.capturestring = var_4c918b514697b434;
    var_1f4abb20f5347265 = [0:self];
    if (isdefined(self.useobject)) {
        var_1f4abb20f5347265[var_1f4abb20f5347265.size] = self.useobject;
    }
    foreach (var_ef5d5141fdb51174 in var_1f4abb20f5347265) {
        if (!self.supportsreroll || var_ef5d5141fdb51174.usetype == 2) {
            var_ef5d5141fdb51174 sethintstring(self.capturestring);
        }
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9654
// Size: 0xe2
function overridererollstring(var_4c918b514697b434) {
    /#
        assertex(isdefined(var_4c918b514697b434), "overrideCrateRerollString() requires a stringOverride.");
    #/
    if (isdefined(self.rerollstring) && self.rerollstring == var_4c918b514697b434) {
        return;
    }
    self.rerollstring = var_4c918b514697b434;
    var_1f4abb20f5347265 = [0:self];
    if (isdefined(self.useobject)) {
        var_1f4abb20f5347265[var_1f4abb20f5347265.size] = self.useobject;
    }
    foreach (var_ef5d5141fdb51174 in var_1f4abb20f5347265) {
        if (self.supportsreroll && var_ef5d5141fdb51174.usetype == 1) {
            var_ef5d5141fdb51174 sethintstring(self.rerollstring);
        }
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x973d
// Size: 0x9a
function overrideheadicon(var_a6b4dbdd89bbbb24) {
    if (!isdefined(self.headicon) && !isdefined(var_a6b4dbdd89bbbb24)) {
        return;
    }
    if (isdefined(self.headicon) && isdefined(var_a6b4dbdd89bbbb24) && self.headicon == var_a6b4dbdd89bbbb24) {
        return;
    }
    if (!isdefined(var_a6b4dbdd89bbbb24)) {
        self.headicon = undefined;
        _destroyheadicon();
    } else {
        self.headicon = var_a6b4dbdd89bbbb24;
        if (self.headiconactive) {
            if (isdefined(self.headiconid)) {
                setheadiconimage(self.headiconid, var_a6b4dbdd89bbbb24);
            } else {
                _createheadicon();
            }
        }
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x97de
// Size: 0x9b
function overrideminimapicon(var_a6b4dbdd89bbbb24) {
    if (!isdefined(self.minimapicon) && !isdefined(var_a6b4dbdd89bbbb24)) {
        return;
    }
    if (isdefined(self.minimapicon) && isdefined(var_a6b4dbdd89bbbb24) && self.minimapicon == var_a6b4dbdd89bbbb24) {
        return;
    }
    if (!isdefined(var_a6b4dbdd89bbbb24)) {
        self.minimapicon = undefined;
        destroyminimapicon();
    } else {
        self.minimapicon = var_a6b4dbdd89bbbb24;
        if (self.minimapiconactive) {
            if (isdefined(self.minimapid)) {
                namespace_5a22b6f3a56f7e9b::update_objective_icon(self.minimapid, var_a6b4dbdd89bbbb24);
            } else {
                createminimapicon();
            }
        }
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9880
// Size: 0xd3
function overridesupportsreroll(var_916435788623ac01) {
    /#
        assertex(isdefined(var_916435788623ac01), "overrideSupportsReroll() requires a boolOverride.");
    #/
    if (self.supportsreroll == var_916435788623ac01) {
        return;
    }
    self.supportsreroll = var_916435788623ac01;
    if (self.supportsreroll) {
        var_1f4abb20f5347265 = [0:self];
        if (isdefined(self.useobject)) {
            var_1f4abb20f5347265[var_1f4abb20f5347265.size] = self.useobject;
        }
        foreach (var_ef5d5141fdb51174 in var_1f4abb20f5347265) {
            if (var_ef5d5141fdb51174.usetype == 1) {
                var_ef5d5141fdb51174 sethintstring(self.rerollstring);
            }
        }
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x995a
// Size: 0x2f1
function initkillstreakcratedata() {
    level.cratedata.ksweights = [];
    level.cratedata.kscapturestrings = [];
    level.cratedata.ksrerollstrings = [];
    activatecallback = &killstreakcrateactivatecallback;
    capturecallback = &killstreakcratecapturecallback;
    leveldata = getleveldata("killstreak");
    leveldata.activatecallback = activatecallback;
    leveldata.capturecallback = capturecallback;
    if (namespace_36f464722d326bbe::function_2d79a7a3b91c4c3e()) {
        leveldata.capturestring = "MP/BR_CRATE_LOADOUT";
    }
    leveldata = getleveldata("killstreak_no_owner");
    leveldata.activatecallback = activatecallback;
    leveldata.capturecallback = capturecallback;
    leveldata.supportsownercapture = 0;
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["airdrop"];
    if (!isdefined(bundle) || !istrue(bundle.var_819ed648a31d2d61)) {
        addkillstreakcratedata("assault_drone", undefined, undefined, 300);
        addkillstreakcratedata("uav", undefined, undefined, 300);
        addkillstreakcratedata("cluster_spike", undefined, undefined, 300);
        addkillstreakcratedata("scrambler_drone_guard", undefined, undefined, 300);
        addkillstreakcratedata("switchblade_drone", undefined, undefined, 300);
        addkillstreakcratedata("cruise_predator", undefined, undefined, 150);
        addkillstreakcratedata("toma_strike", undefined, undefined, 150);
        addkillstreakcratedata("precision_airstrike", undefined, undefined, 150);
        addkillstreakcratedata("remote_turret", undefined, undefined, 150);
        addkillstreakcratedata("lrad", undefined, undefined, 150);
        addkillstreakcratedata("fuel_airstrike", undefined, undefined, 100);
        addkillstreakcratedata("hover_jet", undefined, undefined, 100);
        addkillstreakcratedata("airdrop_escort", undefined, undefined, 100);
        addkillstreakcratedata("pac_sentry", undefined, undefined, 100);
        addkillstreakcratedata("juggernaut_recon", undefined, undefined, 100);
        addkillstreakcratedata("auto_drone", undefined, undefined, 50);
        addkillstreakcratedata("chopper_gunner", undefined, undefined, 50);
        addkillstreakcratedata("directional_uav", undefined, undefined, 25);
        addkillstreakcratedata("gunship", undefined, undefined, 25);
        addkillstreakcratedata("juggernaut", undefined, undefined, 10);
    } else {
        foreach (var_6cbea295f44add8 in bundle.var_33949e570ecac50c) {
            if (isdefined(var_6cbea295f44add8.name) && isdefined(var_6cbea295f44add8.weight)) {
                addkillstreakcratedata(var_6cbea295f44add8.name, undefined, undefined, var_6cbea295f44add8.weight);
            }
        }
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c52
// Size: 0x236
function initdropzonekillstreakcratedata() {
    level.cratedata.ksweights = [];
    level.cratedata.kscapturestrings = [];
    level.cratedata.ksrerollstrings = [];
    activatecallback = &killstreakcrateactivatecallback;
    capturecallback = &killstreakcratecapturecallback;
    leveldata = getleveldata("killstreak");
    leveldata.activatecallback = activatecallback;
    leveldata.capturecallback = capturecallback;
    leveldata = getleveldata("killstreak_no_owner");
    leveldata.activatecallback = activatecallback;
    leveldata.capturecallback = capturecallback;
    leveldata.supportsownercapture = 0;
    addkillstreakcratedata("assault_drone", undefined, undefined, 300);
    addkillstreakcratedata("uav", undefined, undefined, 300);
    addkillstreakcratedata("cluster_spike", undefined, undefined, 300);
    addkillstreakcratedata("scrambler_drone_guard", undefined, undefined, 300);
    addkillstreakcratedata("switchblade_drone", undefined, undefined, 300);
    addkillstreakcratedata("cruise_predator", undefined, undefined, 150);
    addkillstreakcratedata("toma_strike", undefined, undefined, 150);
    addkillstreakcratedata("precision_airstrike", undefined, undefined, 150);
    addkillstreakcratedata("remote_turret", undefined, undefined, 150);
    addkillstreakcratedata("lrad", undefined, undefined, 150);
    addkillstreakcratedata("fuel_airstrike", undefined, undefined, 100);
    addkillstreakcratedata("hover_jet", undefined, undefined, 100);
    addkillstreakcratedata("airdrop_escort", undefined, undefined, 100);
    addkillstreakcratedata("pac_sentry", undefined, undefined, 100);
    addkillstreakcratedata("juggernaut_recon", undefined, undefined, 100);
    addkillstreakcratedata("auto_drone", undefined, undefined, 50);
    addkillstreakcratedata("chopper_gunner", undefined, undefined, 50);
    addkillstreakcratedata("directional_uav", undefined, undefined, 25);
    addkillstreakcratedata("gunship", undefined, undefined, 25);
    addkillstreakcratedata("juggernaut", undefined, undefined, 10);
    if (namespace_36f464722d326bbe::function_2536e99eb6586f8f()) {
        leveldata.isteamonlycrate = 1;
    } else {
        addkillstreakcratedata("scrambler_drone_guard", undefined, undefined, 300);
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e8f
// Size: 0x83
function addkillstreakcratedata(streakname, capturestring, rerollstring, weight) {
    if (!isdefined(level.var_b23156d776b1d85.var_38f2a11237246ac[streakname])) {
        return;
    }
    level.cratedata.kscapturestrings[streakname] = capturestring;
    level.cratedata.ksrerollstrings[streakname] = rerollstring;
    level.cratedata.ksweights[streakname] = weight;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f19
// Size: 0x3f
function getkillstreakcratedatabystreakname(streakname, supportsreroll) {
    data = spawnstruct();
    data.streakname = streakname;
    data.supportsreroll = supportsreroll;
    return data;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f60
// Size: 0x87
function overridekillstreakcrateweight(streakname, var_3f9b0ba92698a35d) {
    /#
        assertex(isdefined(level.cratedata), "overrideKillstreakCrateWeight() called before initCrateData().");
    #/
    /#
        assertex(isdefined(level.cratedata.ksweights), "overrideKillstreakCrateWeight() called before initKillstreakCrateData().");
    #/
    /#
        assertex(isdefined(level.cratedata.ksweights), "overrideKillstreakCrateWeight() called with an invalid streakName.");
    #/
    level.cratedata.ksweights[streakname] = var_3f9b0ba92698a35d;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9fee
// Size: 0xb1
function killstreakcrateactivatecallback(isfirstactivation) {
    data = self.data;
    capturestring = level.cratedata.kscapturestrings[data.streakname];
    if (isdefined(capturestring)) {
        overridecapturestring(capturestring);
    }
    rerollstring = level.cratedata.ksrerollstrings[data.streakname];
    if (isdefined(rerollstring)) {
        overridererollstring(rerollstring);
    }
    supportsreroll = data.supportsreroll;
    if (isdefined(supportsreroll)) {
        overridesupportsreroll(supportsreroll);
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa0a6
// Size: 0x1dc
function killstreakcratecapturecallback(player) {
    streakname = self.data.streakname;
    var_44632ff01df0aadd = 0;
    var_63bb25760a7f230d = 0;
    switch (streakname) {
    case #"hash_cd0a0403551fc411":
        var_63bb25760a7f230d = 1;
    case #"hash_4ad475e6e15635bd":
        if (!istrue(player.isjuggernaut)) {
            var_44632ff01df0aadd = 1;
            if (issharedfuncdefined("airdrop", "applyImmediateJuggernaut")) {
                player [[ getsharedfunc("airdrop", "applyImmediateJuggernaut") ]](var_44632ff01df0aadd, var_63bb25760a7f230d);
            } else if (istrue(var_63bb25760a7f230d)) {
                player namespace_f65b8b60ef677e44::function_b960491329678b4(var_44632ff01df0aadd);
            } else {
                player namespace_3fad206953a935fe::tryusejuggernaut(var_44632ff01df0aadd);
            }
        }
        break;
    }
    if (!istrue(var_44632ff01df0aadd)) {
        if (issharedfuncdefined("airdrop", "awardKillstreak")) {
            player thread [[ getsharedfunc("airdrop", "awardKillstreak") ]](streakname, self.owner, self);
        }
        if (issharedfuncdefined("airdrop", "showKillstreakSplash")) {
            player [[ getsharedfunc("airdrop", "showKillstreakSplash") ]](streakname, undefined, 1);
        }
    }
    if (isdefined(self.owner) && player == self.owner) {
        goto LOC_000001da;
    }
    if (isdefined(self.team)) {
        if (player.team != self.team) {
            if (issharedfuncdefined("player", "doScoreEvent")) {
                player [[ getsharedfunc("player", "doScoreEvent") ]]("hijacker");
            }
            if (isdefined(self.owner)) {
                if (issharedfuncdefined("hud", "showSplash")) {
                    self.owner [[ getsharedfunc("hud", "showSplash") ]]("hijacked_airdrop", undefined, player);
                }
            }
            goto LOC_000001da;
        }
    LOC_000001da:
    }
LOC_000001da:
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa289
// Size: 0x6c
function getrandomkillstreak(var_52a8c1bddbf44d11) {
    /#
        assertex(isdefined(level.cratedata), "getRandomKillstreak() called before initCrateData().");
    #/
    /#
        assertex(isdefined(level.cratedata.ksweights), "getRandomKillstreak() called before initKillstreakCrateData().");
    #/
    streakname = getrandomkeyfromweightsarray(level.cratedata.ksweights, var_52a8c1bddbf44d11);
    return streakname;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xa2fd
// Size: 0xcc
function placekillstreakcrate(owner, team, streakname, position, angles) {
    if (!isdefined(streakname) || streakname == "random") {
        streakname = getrandomkillstreak();
    }
    cratetype = isdefined(owner) ? "killstreak" : "killstreak_no_owner";
    cratedropdata = getkillstreakcratedatabystreakname(streakname, 0);
    crate = placecrate(owner, team, cratetype, position, angles, cratedropdata);
    if (!isdefined(crate)) {
        return undefined;
    }
    if (isdefined(owner)) {
        if (issharedfuncdefined("hud", "teamPlayerCardSplash")) {
            level thread [[ getsharedfunc("hud", "teamPlayerCardSplash") ]]("used_airdrop", owner);
        }
    }
    return crate;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xa3d1
// Size: 0xd8
function dropkillstreakcrate(owner, team, streakname, position, angles, destination) {
    if (!isdefined(streakname) || streakname == "random") {
        streakname = getrandomkillstreak();
    }
    cratetype = isdefined(owner) ? "killstreak" : "killstreak_no_owner";
    cratedropdata = getkillstreakcratedatabystreakname(streakname, 0);
    crate = dropcrate(owner, team, cratetype, position, angles, destination, cratedropdata);
    if (!isdefined(crate)) {
        return undefined;
    }
    if (isdefined(owner)) {
        if (issharedfuncdefined("hud", "teamPlayerCardSplash")) {
            level thread [[ getsharedfunc("hud", "teamPlayerCardSplash") ]]("used_airdrop", owner);
        }
    }
    return crate;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4b1
// Size: 0x12e
function dropkillstreakcratefromscriptedheli(owner, team, streakname, position, angles, destination, vehicleisreserved, streakinfo) {
    if (!isdefined(streakname) || streakname == "random") {
        streakname = getrandomkillstreak();
    }
    cratetype = isdefined(owner) ? "killstreak" : "killstreak_no_owner";
    cratedropdata = getkillstreakcratedatabystreakname(streakname, 0);
    cratedropdata.vehicleisreserved = vehicleisreserved;
    scenenode = dropcratefromscriptedheli(owner, team, cratetype, position, angles, destination, cratedropdata, streakinfo);
    if (!isdefined(scenenode)) {
        return undefined;
    } else if (!isdefined(scenenode.crates) || !isdefined(array_get_first_item(scenenode.crates))) {
        return undefined;
    }
    if (isdefined(owner)) {
        owner thread airdrop_playdeploydialog(streakinfo);
        if (issharedfuncdefined("hud", "teamPlayerCardSplash")) {
            level thread [[ getsharedfunc("hud", "teamPlayerCardSplash") ]]("used_airdrop", owner);
        }
    }
    return scenenode;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa5e7
// Size: 0xbb
function airdrop_playdeploydialog(streakinfo) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (level.gametype == "grnd" || namespace_36f464722d326bbe::function_2536e99eb6586f8f()) {
        return;
    }
    var_52a5be2e2f91d710 = undefined;
    if (issharedfuncdefined("sound", "playKillstreakDeployDialog")) {
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(0.5);
        [[ getsharedfunc("sound", "playKillstreakDeployDialog") ]](self, streakinfo.streakname);
        var_52a5be2e2f91d710 = 3;
    }
    var_3707ac9ba459fb6d = streakinfo.streakname + "_use";
    thread playkillstreakoperatordialog(streakinfo.streakname, var_3707ac9ba459fb6d, 1, var_52a5be2e2f91d710);
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xa6a9
// Size: 0x112
function dropkillstreakcratefrommanualheli(owner, team, streakname, position, angles, destination, vehicleisreserved) {
    if (!isdefined(streakname) || streakname == "random") {
        streakname = getrandomkillstreak();
    }
    cratetype = isdefined(owner) ? "killstreak" : "killstreak_no_owner";
    cratedropdata = getkillstreakcratedatabystreakname(streakname, 0);
    cratedropdata.vehicleisreserved = vehicleisreserved;
    dropstruct = dropcratefrommanualheli(owner, team, cratetype, position, angles, 30000, 30000, destination, cratedropdata);
    if (!isdefined(dropstruct)) {
        return undefined;
    } else if (!isdefined(dropstruct.crate)) {
        return undefined;
    }
    if (isdefined(owner)) {
        if (issharedfuncdefined("hud", "teamPlayerCardSplash")) {
            level thread [[ getsharedfunc("hud", "teamPlayerCardSplash") ]]("used_airdrop", owner);
        }
    }
    return dropstruct.crate;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa7c3
// Size: 0x198
function tryairdroptriggered(streakinfo) {
    streakname = streakinfo.streakname;
    droptype = streakname;
    result = undefined;
    if (!isdefined(droptype)) {
        droptype = "airdrop";
    }
    var_f7d941fb76fd8044 = level.littlebirds.size;
    maxvehiclecount = 4;
    if (islargemap()) {
        maxvehiclecount = 10;
    }
    if (streakname == "airdrop_escort") {
        var_f7d941fb76fd8044 = level.cratedropdata.var_4950bb412d4e1d5.size;
        maxvehiclecount = 1;
    }
    var_4440147083abaf0a = 1;
    if ((var_f7d941fb76fd8044 >= maxvehiclecount || level.fauxvehiclecount >= maxvehiclecount) && droptype != "airdrop_mega") {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/MAX_AIRDROPS");
        }
        return 0;
    } else if (issharedfuncdefined("killstreak", "currentActiveVehicleCount") && issharedfuncdefined("killstreak", "maxVehiclesAllowed")) {
        if ([[ getsharedfunc("killstreak", "currentActiveVehicleCount") ]]() >= [[ getsharedfunc("killstreak", "maxVehiclesAllowed") ]]() || level.fauxvehiclecount + var_4440147083abaf0a >= [[ getsharedfunc("killstreak", "maxVehiclesAllowed") ]]()) {
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/TOO_MANY_VEHICLES");
            }
            return 0;
        }
    }
    return 1;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa963
// Size: 0x22
function airdropmarkerswitchended(streakinfo, var_41bf9bf4918115ac) {
    if (istrue(var_41bf9bf4918115ac)) {
        thread airdrop_watchplayerweapon(streakinfo);
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa98c
// Size: 0x89
function airdrop_watchplayerweapon(streakinfo) {
    self endon("disconnect");
    if (!isbot(self)) {
        self notifyonplayercommand("cancel_deploy", "+actionslot 3");
        self notifyonplayercommand("cancel_deploy", "+actionslot 4");
        self notifyonplayercommand("cancel_deploy", "+actionslot 5");
        self notifyonplayercommand("cancel_deploy", "+actionslot 6");
    }
    result = waittill_any_return_2("cancel_deploy", "weapon_switch_started");
    if (!isdefined(result)) {
        return;
    }
    streakinfo notify("killstreak_finished_with_deploy_weapon");
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaa1c
// Size: 0x106
function airdropvisualmarkerfired(streakinfo) {
    streakinfo.airdroptype = streakinfo.streakname;
    if (issharedfuncdefined("vehicle", "incrementFauxVehicleCount")) {
        [[ getsharedfunc("vehicle", "incrementFauxVehicleCount") ]]();
    }
    marker = undefined;
    if (issharedfuncdefined("airdrop", "getTargetMarker")) {
        marker = self [[ getsharedfunc("airdrop", "getTargetMarker") ]](streakinfo);
    }
    if (!isdefined(marker.location)) {
        if (issharedfuncdefined("vehicle", "decrementFauxVehicleCount")) {
            [[ getsharedfunc("vehicle", "decrementFauxVehicleCount") ]]();
        }
        return 0;
    }
    if (issharedfuncdefined("killstreak", "logKillstreakEvent")) {
        self [[ getsharedfunc("killstreak", "logKillstreakEvent") ]](streakinfo.airdroptype, self.origin);
    }
    airdropvisualmarkeractivate(marker, streakinfo.airdroptype, streakinfo);
    return 1;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab2a
// Size: 0xff
function airdropvisualmarkeractivate(marker, droptype, streakinfo) {
    var_f0f1e7230edecb24 = drop_to_ground(marker.location, 50, -200, (0, 0, 1));
    var_f0f1e7230edecb24 = var_f0f1e7230edecb24 + (0, 0, 1);
    canister = spawn("script_model", var_f0f1e7230edecb24);
    canister setmodel("offhand_wm_grenade_smoke");
    canister.angles = (0, 90, 90);
    fxent = spawn("script_model", var_f0f1e7230edecb24);
    fxent setmodel("ks_crate_marker_mp");
    fxent setscriptablepartstate(#"smoke", #"on", 0);
    if (isdefined(marker.visual)) {
        marker.visual delete();
    }
    /#
        assertmsg("doFlyBy() no longer supported. See airdrop.gsc for new drop methods");
    #/
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xac30
// Size: 0x21
function tryuseairdropmarker() {
    streakinfo = createstreakinfo("airdrop", self);
    return tryuseairdropmarkerfromstruct(streakinfo);
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac59
// Size: 0x1ed
function tryuseairdropmarkerfromstruct(streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    streakinfo.deployweaponobj = makeweapon("deploy_airdrop_mp");
    var_b340c162ce19ad5e = getdvarint(@"hash_b2e9bf0017ceeeae", 0);
    if (var_b340c162ce19ad5e) {
        streakinfo.deployweaponobj = makeweapon("deploy_airdrop_sticky_mp");
    }
    var_2472cbe64ade0c46 = undefined;
    switch (streakinfo.streakname) {
    case #"hash_2289ec11d77bce8f":
    case #"hash_56979e0566996b2e":
    case #"hash_887ad77192b9c4fb":
        var_2472cbe64ade0c46 = 1;
        break;
    default:
        var_2472cbe64ade0c46 = 0;
        break;
    }
    if (var_2472cbe64ade0c46) {
        if (!namespace_f64231d5b7a2c3c4::reservevehicle()) {
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/AIR_SPACE_TOO_CROWDED");
            }
            return 0;
        }
    }
    if (!tryairdroptriggered(streakinfo)) {
        if (var_2472cbe64ade0c46) {
            namespace_f64231d5b7a2c3c4::clearvehiclereservation();
        }
        return 0;
    }
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            if (var_2472cbe64ade0c46) {
                namespace_f64231d5b7a2c3c4::clearvehiclereservation();
            }
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/AIR_SPACE_TOO_CROWDED");
            }
            return 0;
        }
    }
    if (isdefined(level.var_27f78817b59dfe32)) {
        streakinfo.var_fb58a31c756db4cc = level.var_27f78817b59dfe32;
    }
    var_9b1deb5e9d32bbe3 = namespace_b3d24e921998a8b::streakdeploy_doweaponfireddeploy(streakinfo, streakinfo.deployweaponobj, "grenade_fire", undefined, &airdropmarkerswitchended, &airdropmarkerfired, undefined, &airdropmarkertaken);
    if (!istrue(var_9b1deb5e9d32bbe3)) {
        if (var_2472cbe64ade0c46) {
            namespace_f64231d5b7a2c3c4::clearvehiclereservation();
        }
        return 0;
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            return 0;
        }
    }
    return 1;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xae4e
// Size: 0xaf
function function_f66b707d0894b6de(streakinfo) {
    self endon("death_or_disconnect");
    self endon("giveAndFireOffhandReliableFailed");
    level endon("game_ended");
    deployweaponobj = streakinfo.deployweaponobj;
    while (1) {
        grenade = self waittill("grenade_thrown");
        if (isdefined(deployweaponobj.basename) && isdefined(grenade.weapon_name) && deployweaponobj.basename == grenade.weapon_name) {
            airdropmarkerfired(streakinfo, deployweaponobj, grenade, 1);
            break;
        } else {
            /#
                iprintln("doScoreEvent");
            #/
            break;
        }
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf04
// Size: 0xfa
function airdropmarkerfired(streakinfo, weaponobj, projectile, var_4b0c1a8c50d15340) {
    streakinfo.airdroptype = streakinfo.streakname;
    if (issharedfuncdefined("killstreak", "incrementFauxVehicleCount")) {
        [[ getsharedfunc("killstreak", "incrementFauxVehicleCount") ]]();
    }
    projectile.owner = self;
    /#
        assertex(isdefined(streakinfo.airdroptype), "airDropMarkerFired() was passed a streakInfo that didn't go through tryAirdropTriggered()");
    #/
    projectile thread airdropmarkeractivate(streakinfo.airdroptype, undefined, streakinfo, var_4b0c1a8c50d15340);
    if (issharedfuncdefined("killstreak", "logKillstreakEvent")) {
        self [[ getsharedfunc("killstreak", "logKillstreakEvent") ]](streakinfo.airdroptype, self.origin);
    }
    streakinfo.airdropmarkerfired = 1;
    if (!istrue(var_4b0c1a8c50d15340)) {
        streakinfo notify("killstreak_finished_with_deploy_weapon");
    }
    return "success";
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb006
// Size: 0x49b
function airdropmarkeractivate(droptype, lifeid, streakinfo, var_4b0c1a8c50d15340) {
    level endon("game_ended");
    var_811f337efd111e98 = self.owner.angles;
    position = self waittill("explode");
    if (istrue(var_4b0c1a8c50d15340)) {
        level callback::callback("killstreak_finish_use", {streakinfo:streakinfo});
    }
    owner = self.owner;
    if (!isdefined(owner)) {
        if (issharedfuncdefined("vehicle", "decrementFauxVehicleCount")) {
            [[ getsharedfunc("vehicle", "decrementFauxVehicleCount") ]]();
        }
        namespace_f64231d5b7a2c3c4::clearvehiclereservation();
        return;
    }
    waitframe();
    var_fda870b32ab92c1f = var_811f337efd111e98 + (0, 180, 0);
    targetpos = position;
    var_359711dd322783ec = getscriptedhelidropheight(droptype);
    ownerforward = anglestoforward(owner.angles);
    var_3c5a1b26c6973c2a = anglestoright(owner.angles);
    contents = namespace_2a184fc4902783dc::create_default_contents(1);
    var_f74f18c717b149e2 = [0:targetpos - ownerforward * 100, 1:targetpos + ownerforward * 100, 2:targetpos + var_3c5a1b26c6973c2a * 100, 3:targetpos - var_3c5a1b26c6973c2a * 100, 4:targetpos + (ownerforward + var_3c5a1b26c6973c2a) * 100, 5:targetpos + (ownerforward - var_3c5a1b26c6973c2a) * 100, 6:targetpos + (var_3c5a1b26c6973c2a - ownerforward) * 100, 7:targetpos + (-1 * ownerforward - var_3c5a1b26c6973c2a) * 100];
    foreach (var_f9567f37db523f7a in var_f74f18c717b149e2) {
        var_7a7426e42e674e40 = vectornormalize(var_f9567f37db523f7a - targetpos);
        var_c45bbeb56df09b5d = targetpos * (1, 1, 0) + (0, 0, var_359711dd322783ec);
        var_32a961dac02545b0 = var_c45bbeb56df09b5d - var_7a7426e42e674e40 * 25000;
        var_19189fd85d8a2c19 = var_c45bbeb56df09b5d + var_7a7426e42e674e40 * 25000;
        traceresult = namespace_2a184fc4902783dc::ray_trace_passed(var_32a961dac02545b0, var_19189fd85d8a2c19, undefined, contents);
        if (!istrue(traceresult)) {
            continue;
        }
        var_fda870b32ab92c1f = vectortoangles(var_7a7426e42e674e40);
        /#
            level thread namespace_f2ffc0540883e1ad::drawline(var_32a961dac02545b0, var_19189fd85d8a2c19, 30, (1, 1, 0));
        #/
        break;
    }
    /#
        if (droptype == "active") {
            var_8d87362079c3519c = getdvar(@"hash_c247993ede3808ca");
            if (var_8d87362079c3519c != "_request_response") {
                if (issharedfuncdefined("weapon", "players")) {
                    [[ getsharedfunc("weapon", "players") ]]();
                }
                dropkillstreakcratefromscriptedheli(owner, owner.team, var_8d87362079c3519c, position, var_fda870b32ab92c1f, position, 1, streakinfo);
                return;
            }
        }
    #/
    if (issharedfuncdefined("vehicle", "decrementFauxVehicleCount")) {
        [[ getsharedfunc("vehicle", "decrementFauxVehicleCount") ]]();
    }
    var_806f4f8c9ecef0a1 = undefined;
    if (droptype == "airdrop") {
        var_806f4f8c9ecef0a1 = dropkillstreakcratefromscriptedheli(owner, owner.team, undefined, position, var_fda870b32ab92c1f, position, 1, streakinfo);
    } else if (droptype == "airdrop_multiple") {
        if (issharedfuncdefined("airdrop", "airdropMultipleDropCrates")) {
            var_806f4f8c9ecef0a1 = [[ getsharedfunc("airdrop", "airdropMultipleDropCrates") ]](owner, owner.team, position, var_fda870b32ab92c1f, position, 1, streakinfo);
        }
    } else {
        if (droptype == "airdrop_escort") {
            goto LOC_00000407;
        }
        if (droptype == "loadout_drop") {
            var_806f4f8c9ecef0a1 = function_63e71231fbc15aa9(owner, owner.team, droptype, position, var_fda870b32ab92c1f, position, 1, streakinfo);
        LOC_00000407:
        }
    LOC_00000407:
    }
LOC_00000407:
    if (isdefined(owner)) {
        if (!isdefined(var_806f4f8c9ecef0a1)) {
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                owner [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/VEHICLE_REFUND_KILLSTREAK");
            }
            if (isdefined(streakinfo) && isdefined(streakinfo.mpstreaksysteminfo)) {
                if (issharedfuncdefined("killstreak", "awardKillstreakFromStruct")) {
                    owner [[ getsharedfunc("killstreak", "awardKillstreakFromStruct") ]](streakinfo.mpstreaksysteminfo, "other");
                }
            }
            return;
        }
        owner namespace_9abe40d2af041eb2::recordkillstreakendstats(streakinfo);
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb4a8
// Size: 0xbe
function function_206d83d7637be6a7(position, owner) {
    if (level.teambased) {
        var_13ba232eee7e6069 = spawnscriptable("airdrop_marker", position, (0, 0, 1));
        var_13ba232eee7e6069 setscriptablepartstate("smokeSignal", "active");
        var_13ba232eee7e6069 function_fca5bdbe24070d20("smokeSignal", owner.team);
    } else {
        payload = [0:#"hash_5f9c433bdcfb4e14", 1:owner getentitynumber()];
        var_13ba232eee7e6069 = spawnscriptable("airdrop_marker", position, (0, 0, 1), undefined, payload);
        var_13ba232eee7e6069 setscriptablepartstate("smokeSignal", "activeFFA");
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb56d
// Size: 0x78
function airdropmarkertaken(streakinfo) {
    if (istrue(streakinfo.airdropmarkerfired)) {
        level callback::callback("killstreak_finish_use", {streakinfo:streakinfo});
    }
    if (isdefined(streakinfo.airdroptype) && !istrue(streakinfo.airdropmarkerfired)) {
        if (issharedfuncdefined("vehicle", "decrementFauxVehicleCount")) {
            [[ getsharedfunc("vehicle", "decrementFauxVehicleCount") ]]();
        }
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb5ec
// Size: 0x8b
function initbattleroyalecratedata() {
    leveldata = getleveldata("battle_royale");
    leveldata.capturestring = "MP/BR_CRATE";
    leveldata.supportsownercapture = 0;
    leveldata.headicon = undefined;
    leveldata.usepriority = -1;
    leveldata.usefov = 180;
    leveldata.timeout = undefined;
    leveldata.activatecallback = &brcrateactivatecallback;
    leveldata.capturecallback = &brcratecapturecallback;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb67e
// Size: 0x2a
function getbrcratedatabytype(type) {
    data = spawnstruct();
    data.type = type;
    return data;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb6b0
// Size: 0x38
function brcrateactivatecallback(isfirstactivation) {
    if (istrue(isfirstactivation)) {
        if (issharedfuncdefined("airdrop", "registerCrateForCleanup")) {
            [[ getsharedfunc("airdrop", "registerCrateForCleanup") ]](self);
        }
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb6ef
// Size: 0x34
function brcratecapturecallback(player) {
    if (issharedfuncdefined("airdrop", "makeItemsFromCrate")) {
        self [[ getsharedfunc("airdrop", "makeItemsFromCrate") ]](player);
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb72a
// Size: 0x96
function dropbrcratefromscriptedheli(position) {
    type = ter_op(cointoss(), "weapon", "attachment");
    scenenode = dropcratefromscriptedheli(undefined, undefined, "battle_royale", position, (0, randomfloat(360), 0), position, getbrcratedatabytype(type));
    if (!isdefined(scenenode)) {
        return undefined;
    } else if (!isdefined(scenenode.crates) || !isdefined(array_get_first_item(scenenode.crates))) {
        return undefined;
    }
    return scenenode.crate;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb7c8
// Size: 0x85
function dropbrcratefrommanualheli(position) {
    type = ter_op(cointoss(), "weapon", "attachment");
    dropstruct = dropcratefrommanualheli(undefined, undefined, "battle_royale", position, (0, randomfloat(360), 0), 30000, 30000, position, getbrcratedatabytype(type));
    if (!isdefined(dropstruct)) {
        return undefined;
    } else if (!isdefined(dropstruct.crate)) {
        return undefined;
    }
    return dropstruct.crate;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb855
// Size: 0x11f
function initbattleroyaleloadoutcratedata() {
    leveldata = getleveldata("battle_royale_loadout");
    leveldata.capturestring = "MP/BR_CRATE_LOADOUT";
    leveldata.basemodel = "military_carepackage_01_br";
    leveldata.mountmantlemodel = undefined;
    leveldata.supportsownercapture = 0;
    leveldata.headicon = undefined;
    leveldata.usepriority = -1;
    leveldata.usefov = 180;
    leveldata.timeout = undefined;
    leveldata.friendlyuseonly = 1;
    leveldata.ownerusetime = 0.5;
    leveldata.otherusetime = 0.5;
    leveldata.activatecallback = &brloadoutcrateactivatecallback;
    leveldata.capturecallback = &brloadoutcratecapturecallback;
    leveldata.destroycallback = &brloadoutcratedestroycallback;
    leveldata.destroyoncapture = 0;
    leveldata.onecaptureperplayer = 1;
    leveldata.var_28eb33ffd1aa3e63 = 1;
    leveldata.var_c23ca3472233553d = 1;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb97b
// Size: 0x5f
function brloadoutcrateactivatecallback(isfirstactivation) {
    if (istrue(isfirstactivation)) {
        if (issharedfuncdefined("airdrop", "registerCrateForCleanup")) {
            [[ getsharedfunc("airdrop", "registerCrateForCleanup") ]](self);
        }
        if (issharedfuncdefined("airdrop", "brLoadoutCrateFirstActivation")) {
            [[ getsharedfunc("airdrop", "brLoadoutCrateFirstActivation") ]](self);
        }
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb9e1
// Size: 0x1d
function brloadoutcratecapturecallback(player) {
    giveweaponsfromdropbag(player);
    self notify("brLoadoutCapture", player);
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba05
// Size: 0x1e5
function brloadoutcratepostcapture(player) {
    if (!isdefined(self.numuses)) {
        self.numuses = 0;
    }
    if (!isdefined(self.playersused)) {
        self.playersused = [];
    }
    if (!isdefined(self.playerscaptured)) {
        self.playerscaptured = [];
    }
    self.playerscaptured[player getentitynumber()] = player;
    self.playersused[self.playersused.size] = player;
    self.numuses++;
    if (isdefined(self.playeroutlines)) {
        if (!isdefined(self.var_b3447241cb747d0b)) {
            self.var_b3447241cb747d0b = [];
        }
        self.var_b3447241cb747d0b[self.var_b3447241cb747d0b.size] = player;
        function_86f1096305a8c8f9(player);
    }
    self notify("brLoadoutPostCapture", player);
    if (istrue(self.var_93a4478d44f7941e) || istrue(self.var_4cd5b8f62d173211)) {
        return;
    }
    if (self.numuses >= level.teamdata[player.team]["teamCount"]) {
        if (isdefined(self.playeroutlines)) {
            foreach (outline in self.playeroutlines) {
                if (issharedfuncdefined("airdrop", "outlineDisable")) {
                    [[ getsharedfunc("airdrop", "outlineDisable") ]](outline, self);
                }
            }
        }
        if (isdefined(self.choosenlocation) && isdefined(self.choosenlocation.inuse)) {
            self.choosenlocation.inuse = 0;
        }
        thread destroycrate();
    }
    namespace_aad14af462a74d08::function_8359cadd253f9604(player, "pickup_airdrop_crate", 1);
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbbf1
// Size: 0x1ca
function function_86f1096305a8c8f9(player) {
    foreach (outlineid in self.playeroutlines) {
        if (isdefined(self.outlines) && isdefined(self.outlines[outlineid]) && isdefined(self.outlines[outlineid].playersvisibleto)) {
            if (issharedfuncdefined("outline", "outlineDisable")) {
                [[ getsharedfunc("outline", "outlineDisable") ]](outlineid, self);
            }
            self.playeroutlines = array_remove(self.playeroutlines, outlineid);
            var_557d59ebff7d41b2 = level.teamdata[player.team]["players"];
            var_7e9c8818d60b887a = var_557d59ebff7d41b2;
            foreach (teammate in var_557d59ebff7d41b2) {
                if (array_contains(self.var_b3447241cb747d0b, teammate)) {
                    var_7e9c8818d60b887a = array_remove(var_7e9c8818d60b887a, teammate);
                }
            }
            if (var_7e9c8818d60b887a.size > 0) {
                if (issharedfuncdefined("outline", "outlineEnableForTeam")) {
                    self.playeroutlines[self.playeroutlines.size] = [[ getsharedfunc("outline", "outlineEnableForTeam") ]](self, self.team, "outline_depth_cyan", "level_script", self.var_b3447241cb747d0b);
                }
            }
            break;
        }
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbdc2
// Size: 0x33
function brloadoutcratedestroycallback(immediate) {
    if (issharedfuncdefined("airdrop", "brOnLoadoutCrateDestroyed")) {
        [[ getsharedfunc("airdrop", "brOnLoadoutCrateDestroyed") ]](immediate);
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbdfc
// Size: 0x33
function giveweaponsfromdropbag(player) {
    if (issharedfuncdefined("airdrop", "br_giveDropBagLoadout")) {
        [[ getsharedfunc("airdrop", "br_giveDropBagLoadout") ]](player);
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe36
// Size: 0x36
function dropbrloadoutcrate(team, position, destination) {
    return dropcrate(undefined, team, "battle_royale_loadout", position, (0, randomfloat(360), 0), destination);
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe74
// Size: 0x11f
function function_c5c61b985836f974() {
    leveldata = getleveldata("loadout_drop");
    leveldata.capturestring = "MP/BR_CRATE_LOADOUT";
    leveldata.basemodel = "military_carepackage_01_loadout_mp";
    leveldata.supportsownercapture = 1;
    leveldata.headicon = "hud_icon_minimap_fieldupgrade_loadout_drop";
    leveldata.minimapicon = "hud_icon_minimap_fieldupgrade_loadout_drop";
    leveldata.usepriority = -1;
    leveldata.usefov = 360;
    leveldata.timeout = 60;
    leveldata.friendlyuseonly = 1;
    leveldata.var_c75f6dfe8df28b58 = 5;
    leveldata.ownerusetime = 0.5;
    leveldata.otherusetime = 0.5;
    leveldata.activatecallback = &function_22501284ac235158;
    leveldata.capturecallback = &function_a5d8804d96fe6a17;
    leveldata.destroyoncapture = 0;
    leveldata.onecaptureperplayer = 1;
    leveldata.isteamonlycrate = 1;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf9a
// Size: 0x38
function function_22501284ac235158(isfirstactivation) {
    if (istrue(isfirstactivation)) {
        if (issharedfuncdefined("airdrop", "registerCrateForCleanup")) {
            [[ getsharedfunc("airdrop", "registerCrateForCleanup") ]](self);
        }
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbfd9
// Size: 0x35
function function_a5d8804d96fe6a17(player) {
    if (issharedfuncdefined("airdrop", "airdropSelectLoadout")) {
        player thread [[ getsharedfunc("airdrop", "airdropSelectLoadout") ]](self);
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc015
// Size: 0x67
function function_d854bf5a8cd7daf2(player) {
    if (!isdefined(self.numuses)) {
        self.numuses = 0;
    }
    self.numuses++;
    leveldata = getleveldata(self.cratetype);
    if (self.numuses >= leveldata.var_c75f6dfe8df28b58) {
        thread destroycrate();
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc083
// Size: 0xd3
function function_63e71231fbc15aa9(owner, team, streakname, position, angles, destination, vehicleisreserved, streakinfo) {
    cratetype = streakname;
    cratedropdata = getkillstreakcratedatabystreakname(streakname, 0);
    cratedropdata.vehicleisreserved = vehicleisreserved;
    scenenode = dropcratefromscriptedheli(owner, team, cratetype, position, angles, destination, cratedropdata, streakinfo);
    if (!isdefined(scenenode)) {
        return undefined;
    } else if (!isdefined(scenenode.crates) || !isdefined(array_get_first_item(scenenode.crates))) {
        return undefined;
    }
    if (isdefined(owner)) {
        owner thread airdrop_playdeploydialog(streakinfo);
    }
    return scenenode;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc15e
// Size: 0x14a
function initbattleroyalec130airdropcratedata() {
    leveldata = getleveldata("battle_royale_c130_loot");
    if (namespace_36f464722d326bbe::function_6c1fce6f6b8779d5() == "plunder") {
        leveldata.capturestring = "MP/DMZ_LOOT_CRATE_CAPTURE";
    } else {
        leveldata.capturestring = "MP/GENERIC_LOOT_CRATE_CAPTURE";
    }
    leveldata.basemodel = "military_carepackage_03_br";
    leveldata.mountmantlemodel = undefined;
    leveldata.supportsownercapture = 0;
    leveldata.headicon = undefined;
    leveldata.usepriority = -1;
    leveldata.usefov = 180;
    leveldata.timeout = 600;
    leveldata.friendlyuseonly = 1;
    leveldata.ownerusetime = 0.5;
    leveldata.otherusetime = 0.5;
    leveldata.activatecallback = &brc130airdropcrateactivatecallback;
    leveldata.capturecallback = &brc130airdropcratecapturecallback;
    leveldata.destroycallback = &brc130airdropcratedestroycallback;
    leveldata.cratephysicsoncallback = &brc130airdropcratephysicsoncallback;
    leveldata.destroyoncapture = 1;
    leveldata.var_28eb33ffd1aa3e63 = 1;
    leveldata.var_c23ca3472233553d = 1;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc2af
// Size: 0xc
function brc130airdropcrateactivatecallback(isfirstactivation) {
    
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc2c2
// Size: 0xda
function brc130airdropcratecapturecallback(player) {
    self setscriptablepartstate(#"objective_map", #"inactive", 0);
    if (issharedfuncdefined("br_c130Airdrop", "c130Airdrop_onCrateUse")) {
        self [[ getsharedfunc("br_c130Airdrop", "c130Airdrop_onCrateUse") ]](player);
    }
    if (issharedfuncdefined("br_c130Airdrop", "dmzTut_crateUsed")) {
        self [[ getsharedfunc("br_c130Airdrop", "dmzTut_crateUsed") ]](player);
    }
    if (isdefined(self.smokesignal)) {
        self.smokesignal setscriptablepartstate(#"smoke_signal", #"off", 0);
        self.smokesignal delete();
    }
    if (isdefined(level.c130successfulairdrops)) {
        level.c130successfulairdrops = array_remove(level.c130successfulairdrops, self);
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc3a3
// Size: 0x8a
function brc130airdropcratedestroycallback(immediate) {
    self setscriptablepartstate(#"objective_map", #"inactive", 0);
    if (isdefined(self.smokesignal)) {
        self.smokesignal setscriptablepartstate(#"smoke_signal", #"off", 0);
        self.smokesignal delete();
    }
    if (isdefined(level.c130successfulairdrops)) {
        level.c130successfulairdrops = array_remove(level.c130successfulairdrops, self);
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc434
// Size: 0x1d
function brc130airdropcratephysicsoncallback() {
    self setscriptablepartstate(#"crate_audio", #"detach", 0);
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc458
// Size: 0x3e5
function dropbrc130airdropcrate(dropposition, var_7afb56851b06f678, dropangles, var_958bbdfed6f2e9ef, var_fe41be11a71dc1b4, nodropanim, team, var_cf11cd8c8b813faf) {
    var_dd3f2e9ec30744d5 = 250;
    var_c8ec5569be94e5c8 = level.c130airdrop_heightoverride;
    var_edf964e253d1f375 = 1000;
    var_55917b74a3b88b89 = 10500;
    var_843ccd48992e3408 = 7500;
    var_e0570c6b08e54443 = 3000;
    var_195f5093227fe5b6 = var_7afb56851b06f678 + (0, 0, var_edf964e253d1f375);
    var_16068a91a735db9f = "battle_royale_c130_loot";
    if (isdefined(var_958bbdfed6f2e9ef)) {
        var_16068a91a735db9f = var_958bbdfed6f2e9ef;
    }
    if (!isdefined(nodropanim)) {
        nodropanim = 0;
    }
    crate = createcrate(undefined, team, var_16068a91a735db9f, dropposition, (0, 0, 0), var_7afb56851b06f678, undefined, 0);
    if (isdefined(crate)) {
        crate.skipminimapicon = 1;
        if (!nodropanim && var_195f5093227fe5b6[2] < dropposition[2]) {
            var_2c8936d08f85c5c1 = undefined;
            var_ff42e8ba492b161a = distance(dropposition, var_195f5093227fe5b6);
            if (var_ff42e8ba492b161a >= var_55917b74a3b88b89) {
                var_2c8936d08f85c5c1 = "brc130_drop_high";
            } else if (var_ff42e8ba492b161a >= var_843ccd48992e3408) {
                var_2c8936d08f85c5c1 = "brc130_drop_med";
            } else if (var_ff42e8ba492b161a >= var_e0570c6b08e54443) {
                var_2c8936d08f85c5c1 = "brc130_drop_low";
            }
            if (isdefined(var_2c8936d08f85c5c1)) {
                var_7ac104d5971b61a5 = 1000;
                scenenode = spawn("script_model", var_195f5093227fe5b6 + (0, 0, var_7ac104d5971b61a5));
                scenenode.angles = dropangles;
                scenenode setmodel("tag_origin");
                crate.animname = "care_package";
                crate.dropanim = level.scr_anim[crate.animname][var_2c8936d08f85c5c1];
                crate.animlength = getanimlength(crate.dropanim);
                crate namespace_bc4a4b9456315863::setanimtree();
                if (isdefined(team)) {
                    namespace_c5f7e08ad7ea4280::function_8ba05ef17e2b7d10(crate, team);
                }
                chute = spawn("script_model", crate.origin);
                chute.angles = crate.angles;
                chute.animname = "care_package_chute";
                chute.dropanim = level.scr_anim[chute.animname][var_2c8936d08f85c5c1];
                chute.animlength = getanimlength(chute.dropanim);
                chute setmodel("veh9_mil_lnd_parachute_carepackage_br");
                chute namespace_bc4a4b9456315863::setanimtree();
                scenenode thread namespace_bc4a4b9456315863::anim_single_solo(crate, var_2c8936d08f85c5c1);
                scenenode thread namespace_bc4a4b9456315863::anim_single_solo(chute, var_2c8936d08f85c5c1);
                crate thread watchbrc130aidropcrateanimend();
                chute thread watchbrc130airdropchuteanimend(scenenode);
            } else {
                crate cratephysicson();
            }
        } else {
            crate cratephysicson();
        }
        var_40920b1903f4682a = #"cashdrop_common";
        var_c16dc9d131bd10ba = getdvarint(@"hash_ff7bb52f31b387e1", 1);
        if (var_c16dc9d131bd10ba) {
            var_40920b1903f4682a = #"cashdrop_common_world";
        }
        if (isdefined(var_fe41be11a71dc1b4)) {
            var_40920b1903f4682a = var_fe41be11a71dc1b4;
        }
        crate setscriptablepartstate("objective_map", var_40920b1903f4682a, 0);
        if (!nodropanim) {
            crate setscriptablepartstate("crate_audio", "parachuting", 0);
        }
        var_946146964fc4025f = "ks_airdrop_crate_br";
        if (isdefined(var_cf11cd8c8b813faf)) {
            var_946146964fc4025f = var_cf11cd8c8b813faf;
        }
        crate.smokesignal = spawn("script_model", var_7afb56851b06f678);
        crate.smokesignal setmodel(var_946146964fc4025f);
        crate.smokesignal setscriptablepartstate(#"smoke_signal", #"on", 0);
    }
    return crate;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc845
// Size: 0x39
function watchbrc130aidropcrateanimend() {
    self endon("death");
    wait(self.animlength);
    if (isdefined(self)) {
        level notify(self.cratetype + "drop_anim_completed");
        self stopanimscripted();
        cratephysicson();
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc885
// Size: 0x35
function watchbrc130airdropchuteanimend(scenenode) {
    self endon("death");
    wait(self.animlength);
    if (isdefined(self)) {
        self delete();
    }
    if (isdefined(scenenode)) {
        scenenode delete();
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc8c1
// Size: 0x133
function initbattleroyalelootchoppercratedata() {
    leveldata = getleveldata("battle_royale_chopper_loot");
    if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
        leveldata.capturestring = "MP/BR_CRATE_LOADOUT";
    } else {
        leveldata.capturestring = "MP/DMZ_PLUNDER_CRATE_CAPTURE";
    }
    leveldata.basemodel = "military_carepackage_03_br";
    leveldata.mountmantlemodel = undefined;
    leveldata.supportsownercapture = 0;
    leveldata.headicon = undefined;
    leveldata.usepriority = -1;
    leveldata.usefov = 180;
    leveldata.timeout = 600;
    leveldata.friendlyuseonly = 1;
    leveldata.ownerusetime = 0.5;
    leveldata.otherusetime = 0.5;
    leveldata.var_c23ca3472233553d = 1;
    leveldata.activatecallback = &brlootchoppercrateactivatecallback;
    leveldata.capturecallback = &brlootchoppercratecapturecallback;
    leveldata.destroycallback = &brlootchoppercratedestroycallback;
    leveldata.destroyoncapture = 1;
    leveldata.var_28eb33ffd1aa3e63 = 1;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9fb
// Size: 0xc
function brlootchoppercrateactivatecallback(isfirstactivation) {
    
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca0e
// Size: 0xb4
function brlootchoppercratecapturecallback(player) {
    self setscriptablepartstate(#"objective_map", #"inactive", 0);
    if (issharedfuncdefined("br_lootchopper", "lootChopper_onCrateUse")) {
        self [[ getsharedfunc("br_lootchopper", "lootChopper_onCrateUse") ]](player);
    }
    if (issharedfuncdefined("br_lootchopper", "championChopper_onCrateUse")) {
        self [[ getsharedfunc("br_lootchopper", "championChopper_onCrateUse") ]](player);
    }
    if (isdefined(self.smokesignal)) {
        self.smokesignal setscriptablepartstate(#"smoke_signal", #"off", 0);
        self.smokesignal delete();
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcac9
// Size: 0x64
function brlootchoppercratedestroycallback(immediate) {
    self setscriptablepartstate(#"objective_map", #"inactive", 0);
    if (isdefined(self.smokesignal)) {
        self.smokesignal setscriptablepartstate(#"smoke_signal", #"off", 0);
        self.smokesignal delete();
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb34
// Size: 0xee
function dropbrlootchoppercrate(position, destination) {
    crate = dropcrate(undefined, undefined, "battle_royale_chopper_loot", position, (0, randomfloat(360), 0), destination);
    if (isdefined(crate)) {
        crate.skipminimapicon = 1;
        var_40920b1903f4682a = #"cashdrop_common";
        var_c16dc9d131bd10ba = getdvarint(@"hash_ff7bb52f31b387e1", 1);
        if (var_c16dc9d131bd10ba) {
            var_40920b1903f4682a = #"cashdrop_common_world";
        }
        crate setscriptablepartstate(#"objective_map", var_40920b1903f4682a, 0);
        crate.smokesignal = spawn("script_model", destination);
        crate.smokesignal setmodel("ks_airdrop_crate_br");
        crate.smokesignal setscriptablepartstate(#"smoke_signal", #"on", 0);
    }
    return crate;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc2a
// Size: 0xb8
function dropbrlootchoppercrateforpublicevent(position, destination) {
    crate = dropcrate(undefined, undefined, "battle_royale_chopper_loot", position, (0, randomfloat(360), 0), destination);
    if (isdefined(crate)) {
        crate.skipminimapicon = 1;
        crate setscriptablepartstate(#"objective_map", #"pe_chopper_crate", 0);
        crate.smokesignal = spawn("script_model", destination);
        crate.smokesignal setmodel("ks_airdrop_crate_br");
        crate.smokesignal setscriptablepartstate(#"smoke_signal", #"hash_681713bdddb46d8e", 0);
    }
    return crate;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xccea
// Size: 0x108
function function_ddd270c88107faf9() {
    leveldata = getleveldata("battle_royale_elite_chopper");
    leveldata.capturestring = "MP/BR_CRATE_ELITE";
    leveldata.basemodel = "military_carepackage_01_elite_chopper";
    leveldata.mountmantlemodel = undefined;
    leveldata.supportsownercapture = 0;
    leveldata.headicon = undefined;
    leveldata.usepriority = -1;
    leveldata.usefov = 180;
    leveldata.timeout = 600;
    leveldata.friendlyuseonly = 1;
    leveldata.ownerusetime = 0.5;
    leveldata.otherusetime = 0.5;
    leveldata.activatecallback = &function_bcae3fa5db092dd4;
    leveldata.capturecallback = &function_60b85568611b92f3;
    leveldata.destroycallback = &function_1ecb1fecb6f56ecf;
    leveldata.destroyoncapture = 1;
    leveldata.var_28eb33ffd1aa3e63 = 1;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcdf9
// Size: 0xc
function function_bcae3fa5db092dd4(isfirstactivation) {
    
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce0c
// Size: 0x8c
function function_60b85568611b92f3(player) {
    self setscriptablepartstate(#"objective_map", #"inactive", 0);
    if (issharedfuncdefined("br_elitechopper", "eliteChopper_onCrateUse")) {
        self [[ getsharedfunc("br_elitechopper", "eliteChopper_onCrateUse") ]](player);
    }
    if (isdefined(self.smokesignal)) {
        self.smokesignal setscriptablepartstate(#"smoke_signal", #"off", 0);
        self.smokesignal delete();
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce9f
// Size: 0x64
function function_1ecb1fecb6f56ecf(immediate) {
    self setscriptablepartstate(#"objective_map", #"inactive", 0);
    if (isdefined(self.smokesignal)) {
        self.smokesignal setscriptablepartstate(#"smoke_signal", #"off", 0);
        self.smokesignal delete();
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf0a
// Size: 0xb8
function function_4671cbee65d1615d(position, destination) {
    crate = dropcrate(undefined, undefined, "battle_royale_elite_chopper", position, (0, randomfloat(360), 0), destination);
    if (isdefined(crate)) {
        crate.skipminimapicon = 1;
        crate setscriptablepartstate(#"objective_map", #"hash_e0257dc3ae9c640c", 0);
        crate.smokesignal = spawn("script_model", destination);
        crate.smokesignal setmodel("ks_airdrop_crate_br");
        crate.smokesignal setscriptablepartstate(#"smoke_signal", #"hash_681713bdddb46d8e", 0);
    }
    return crate;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcfca
// Size: 0x124
function function_53a94fee5954af57() {
    leveldata = getleveldata("battle_royale_cash_crate");
    leveldata.capturestring = "MP/DMZ_PLUNDER_CRATE_CAPTURE";
    leveldata.basemodel = "military_carepackage_03_br";
    leveldata.mountmantlemodel = undefined;
    leveldata.supportsownercapture = 0;
    leveldata.headicon = undefined;
    leveldata.usepriority = -1;
    leveldata.usefov = 180;
    leveldata.timeout = 600;
    leveldata.friendlyuseonly = 1;
    leveldata.ownerusetime = 0.5;
    leveldata.otherusetime = 0.5;
    leveldata.var_9ea9e33fa2a90171 = 1;
    leveldata.var_c23ca3472233553d = 1;
    leveldata.activatecallback = &function_bf892d4093c5f9d3;
    leveldata.capturecallback = &function_93bbdfaba40c778a;
    leveldata.destroycallback = &function_66ee09b2e374fb6e;
    leveldata.destroyoncapture = 1;
    leveldata.var_28eb33ffd1aa3e63 = 1;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd0f5
// Size: 0x33
function function_bf892d4093c5f9d3(isfirstactivation) {
    if (issharedfuncdefined("airdrop", "registerCrateForCleanup")) {
        [[ getsharedfunc("airdrop", "registerCrateForCleanup") ]](self);
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd12f
// Size: 0x8e
function function_93bbdfaba40c778a(player) {
    self setscriptablepartstate("objective_map", "inactive", 0);
    self setscriptablepartstate("objective", "inactive", 0);
    if (issharedfuncdefined("br_cashcrate", "cashCrate_onCrateUse")) {
        self [[ getsharedfunc("br_cashcrate", "cashCrate_onCrateUse") ]](player);
    }
    if (isdefined(self.smokesignal)) {
        self.smokesignal setscriptablepartstate("smoke_signal", "off", 0);
        self.smokesignal delete();
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd1c4
// Size: 0x66
function function_66ee09b2e374fb6e(immediate) {
    self setscriptablepartstate("objective_map", "inactive", 0);
    self setscriptablepartstate("objective", "inactive", 0);
    if (isdefined(self.smokesignal)) {
        self.smokesignal setscriptablepartstate("smoke_signal", "off", 0);
        self.smokesignal delete();
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd231
// Size: 0xda
function function_9feb10c0096cc4d6(position, destination) {
    crate = dropcrate(undefined, undefined, "battle_royale_cash_crate", position, (0, randomfloat(360), 0), destination);
    if (isdefined(crate)) {
        crate.skipminimapicon = 1;
        var_40920b1903f4682a = "cashdrop_common";
        var_c16dc9d131bd10ba = getdvarint(@"hash_ff7bb52f31b387e1", 1);
        if (var_c16dc9d131bd10ba) {
            var_40920b1903f4682a = "cashdrop_common_world";
        }
        crate setscriptablepartstate("objective_map", var_40920b1903f4682a, 0);
        crate.smokesignal = spawn("script_model", destination);
        crate.smokesignal setmodel("ks_airdrop_crate_br");
        crate.smokesignal setscriptablepartstate("smoke_signal", "on", 0);
    }
    return crate;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd313
// Size: 0x128
function initplundercratedata() {
    leveldata = getleveldata("esc_cache");
    leveldata.capturestring = "MP/ESC_CACHE_USE_HINT";
    leveldata.usetag = "tag_origin";
    leveldata.userange = 200;
    leveldata.usefov = 160;
    leveldata.usepriority = 0;
    leveldata.basemodel = "military_crate_large_stackable_01";
    leveldata.mountmantlemodel = undefined;
    leveldata.supportsownercapture = 0;
    leveldata.headicon = undefined;
    leveldata.usepriority = -10000;
    leveldata.headicon = undefined;
    leveldata.minimapicon = undefined;
    if (issharedfuncdefined("airdrop", "captureLootCacheCallback")) {
        leveldata.capturecallback = getsharedfunc("airdrop", "captureLootCacheCallback");
    }
    leveldata.destroyoncapture = 0;
    leveldata.onecaptureperplayer = 1;
    leveldata.capturevisualscallback = undefined;
    leveldata.destroyvisualscallback = undefined;
    leveldata.timeout = undefined;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd442
// Size: 0x2a
function getplcratedata(contents) {
    data = spawnstruct();
    data.contents = contents;
    return data;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xd474
// Size: 0x3e
function placeplcrate(contents, position, angles) {
    crate = placecrate(undefined, undefined, "esc_cache", position, angles, getplcratedata(contents));
    return crate;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd4ba
// Size: 0x128
function initarmcratedata() {
    level.cratedata.armweights = [];
    level.cratedata.armcapturestrings = [];
    leveldata = getleveldata("arm_no_owner");
    leveldata.activatecallback = &armcrateactivatecallback;
    leveldata.capturecallback = &armcratecapturecallback;
    leveldata.supportsownercapture = 0;
    leveldata.headicondrawrange = 5000;
    leveldata.timeout = 180;
    addarmcratedata("uav", undefined, 5, 10);
    addarmcratedata("manual_turret", undefined, 5, 5);
    addarmcratedata("cruise_predator", undefined, 4, 40);
    addarmcratedata("scrambler_drone_guard", undefined, 4, 20);
    addarmcratedata("precision_airstrike", undefined, 3, 60);
    addarmcratedata("toma_strike", undefined, 2, 40);
    addarmcratedata("chopper_gunner", undefined, 2, 30);
    addarmcratedata("pac_sentry", undefined, 2, 30);
    addarmcratedata("gunship", undefined, 2, 30);
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd5e9
// Size: 0x69
function addarmcratedata(streakname, capturestring, defconlevel, weight) {
    level.cratedata.armdefconlevels[streakname] = defconlevel;
    level.cratedata.armweights[streakname] = weight;
    level.cratedata.armcapturestrings[streakname] = capturestring;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd659
// Size: 0x2a
function getarmcratedatabystreakname(streakname) {
    data = spawnstruct();
    data.streakname = streakname;
    return data;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd68b
// Size: 0x57
function armcrateactivatecallback(isfirstactivation) {
    data = self.data;
    capturestring = level.cratedata.armcapturestrings[data.streakname];
    if (isdefined(capturestring)) {
        overridecapturestring(capturestring);
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd6e9
// Size: 0x57
function armcratecapturecallback(player) {
    if (issharedfuncdefined("killstreak", "awardKillstreak")) {
        player thread [[ getsharedfunc("killstreak", "awardKillstreak") ]](self.data.streakname, "airdrop", undefined, undefined, self.owner);
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd747
// Size: 0x7e
function getrandomarmkillstreak(team) {
    /#
        assertex(isdefined(level.cratedata), "getRandomArmKillstreak() called before initCrateData().");
    #/
    /#
        assertex(isdefined(level.cratedata.armweights), "getRandomArmKillstreak() called before initArmCrateData().");
    #/
    var_52a8c1bddbf44d11 = getarmkillsteakstoexcludebyteamdefconlevel(team);
    streakname = getrandomkeyfromweightsarray(level.cratedata.armweights, var_52a8c1bddbf44d11);
    return streakname;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd7cd
// Size: 0xd4
function getarmkillsteakstoexcludebyteamdefconlevel(team) {
    /#
        assertex(isdefined(level.cratedata.armdefconlevels), "getArmKillsteaksToExcludeByTeamDefconLevel() called before initArmCrateData().");
    #/
    /#
        assertex(isdefined(level.defconlevel), "getArmKillsteaksToExcludeByDefconLevel() called before scriptsmpgametypesarm::onStartGameType().");
    #/
    defconlevel = level.defconlevel;
    var_59f9b4ec41bab131 = undefined;
    if (defconlevel > 1) {
        var_59f9b4ec41bab131 = [];
        foreach (streakname, var_fce39dabbbb5c9e0 in level.cratedata.armdefconlevels) {
            if (defconlevel > var_fce39dabbbb5c9e0) {
                var_59f9b4ec41bab131[var_59f9b4ec41bab131.size] = streakname;
            }
        }
    }
    return var_59f9b4ec41bab131;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd8a9
// Size: 0xfe
function droparmcratefromscriptedheli(team, streakname, position, angles, destination) {
    if (!isdefined(streakname) || streakname == "random") {
        streakname = getrandomarmkillstreak(team);
    }
    cratedropdata = getarmcratedatabystreakname(streakname);
    scenenode = dropcratefromscriptedheli(undefined, team, "arm_no_owner", position, angles, destination, cratedropdata);
    if (!isdefined(scenenode)) {
        return undefined;
    } else if (!isdefined(scenenode.crates) || !isdefined(array_get_first_item(scenenode.crates))) {
        return undefined;
    }
    foreach (crate in scenenode.crates) {
        return crate;
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd9ae
// Size: 0x134
function function_a3299432ddb721e3() {
    level.cratedata.var_332809acea23b57 = [];
    level.cratedata.var_7480157ed64deda2 = [];
    leveldata = getleveldata("gwtdm_no_owner");
    leveldata.activatecallback = &function_d8a8e185cfa2de1b;
    leveldata.capturecallback = &armcratecapturecallback;
    leveldata.supportsownercapture = 0;
    leveldata.enemymodel = undefined;
    leveldata.headicondrawrange = 5000;
    leveldata.timeout = 180;
    function_c035e11237e84114("cruise_predator", 40);
    function_c035e11237e84114("precision_airstrike", 40);
    function_c035e11237e84114("toma_strike", 40);
    function_c035e11237e84114("fuel_airstrike", 40);
    function_c035e11237e84114("remote_turret", 40);
    function_c035e11237e84114("pac_sentry", 30);
    function_c035e11237e84114("auto_drone", 20);
    function_c035e11237e84114("hover_jet", 20);
    function_c035e11237e84114("chopper_gunner", 20);
    function_c035e11237e84114("gunship", 10);
    function_c035e11237e84114("juggernaut", 10);
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdae9
// Size: 0x2b
function function_c035e11237e84114(streakname, weight) {
    level.cratedata.var_332809acea23b57[streakname] = weight;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb1b
// Size: 0x57
function function_d8a8e185cfa2de1b(isfirstactivation) {
    data = self.data;
    capturestring = level.cratedata.var_7480157ed64deda2[data.streakname];
    if (isdefined(capturestring)) {
        overridecapturestring(capturestring);
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb79
// Size: 0x6b
function function_5d1369bfc4efd8b7(team) {
    /#
        assertex(isdefined(level.cratedata), "getRandomArmKillstreak() called before initCrateData().");
    #/
    /#
        assertex(isdefined(level.cratedata.var_332809acea23b57), "getRandomArmKillstreak() called before initArmCrateData().");
    #/
    streakname = getrandomkeyfromweightsarray(level.cratedata.var_332809acea23b57);
    return streakname;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdbec
// Size: 0x2a
function function_506b410ce5a55cb3(streakname) {
    data = spawnstruct();
    data.streakname = streakname;
    return data;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc1e
// Size: 0xfe
function function_99cc30ea8be5b2a6(team, streakname, position, angles, destination) {
    if (!isdefined(streakname) || streakname == "random") {
        streakname = function_5d1369bfc4efd8b7(team);
    }
    cratedropdata = function_506b410ce5a55cb3(streakname);
    scenenode = dropcratefromscriptedheli(undefined, team, "gwtdm_no_owner", position, angles, destination, cratedropdata);
    if (!isdefined(scenenode)) {
        return undefined;
    } else if (!isdefined(scenenode.crates) || !isdefined(array_get_first_item(scenenode.crates))) {
        return undefined;
    }
    foreach (crate in scenenode.crates) {
        return crate;
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd23
// Size: 0x140
function initbattleroyalejuggernautcratedata() {
    leveldata = getleveldata("battle_royale_juggernaut");
    if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
        leveldata.capturestring = "MP/BR_CRATE_LOADOUT";
    } else {
        leveldata.capturestring = "KILLSTREAKS_HINTS/JUGG_CRATE_PICKUP";
    }
    leveldata.basemodel = "military_carepackage_03_jugg_br";
    leveldata.mountmantlemodel = undefined;
    leveldata.supportsownercapture = 0;
    leveldata.headicon = undefined;
    leveldata.usepriority = -1;
    leveldata.usefov = 180;
    leveldata.timeout = undefined;
    leveldata.friendlyuseonly = 1;
    leveldata.ownerusetime = 0.5;
    leveldata.otherusetime = 0.5;
    leveldata.capturecallback = &brjuggernautcratecapturecallback;
    leveldata.destroycallback = &brjuggernautcratedestroycallback;
    leveldata.activatecallback = &brjuggernautcrateactivatecallback;
    leveldata.cratephysicsoncallback = &brjuggernautcratephysicsoncallback;
    leveldata.destroyoncapture = 1;
    leveldata.var_28eb33ffd1aa3e63 = 1;
    leveldata.var_c23ca3472233553d = 1;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde6a
// Size: 0x3c
function brjuggernautcrateactivatecallback(isfirstactivation) {
    namespace_3fad206953a935fe::oncrateactivated(isfirstactivation);
    if (issharedfuncdefined("br_juggernaut", "onCrateActivate")) {
        self [[ getsharedfunc("br_juggernaut", "onCrateActivate") ]](isfirstactivation);
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdead
// Size: 0x94
function brjuggernautcratecapturecallback(player) {
    self setscriptablepartstate(#"objective_map", #"inactive", 0);
    if (isdefined(self.smokesignal)) {
        self.smokesignal setscriptablepartstate(#"smoke_signal", #"off", 0);
        self.smokesignal delete();
    }
    if (issharedfuncdefined("br_juggernaut", "onCrateUse")) {
        self [[ getsharedfunc("br_juggernaut", "onCrateUse") ]](player);
    }
    namespace_3fad206953a935fe::oncratecaptured(player);
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf48
// Size: 0x84
function brjuggernautcratedestroycallback(immediate) {
    self setscriptablepartstate(#"objective_map", #"inactive", 0);
    if (isdefined(self.smokesignal)) {
        self.smokesignal setscriptablepartstate("smoke_signal", "off", 0);
        self.smokesignal delete();
    }
    if (issharedfuncdefined("br_juggernaut", "onCrateDestroy")) {
        self [[ getsharedfunc("br_juggernaut", "onCrateDestroy") ]](immediate);
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdfd3
// Size: 0x2e
function brjuggernautcratephysicsoncallback(position, destination) {
    self setscriptablepartstate(#"crate_audio", #"detach", 0);
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe008
// Size: 0x50
function dropjuggernautcrate(team, position, destination) {
    streakinfo = createstreakinfo("juggernaut", self);
    return dropcrate(undefined, team, "battle_royale_juggernaut", position, (0, randomfloat(360), 0), destination, streakinfo, 1);
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe060
// Size: 0xd9
function spawnjuggernautcrateatposition(pos, var_e648e96614161011) {
    crate = namespace_6c578d6ef48f10ef::dropjuggernautcrate(self.team, pos + (0, 0, 4096), pos + (0, 0, 512));
    /#
        assert(isdefined(crate));
    #/
    crate endon("death");
    enablejuggernautcrateobjective(crate);
    choosejuggernautcratemodel(crate);
    var_3be0d54d30a3593c = [];
    foreach (teammate in level.teamdata[self.team]["alivePlayers"]) {
    }
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe140
// Size: 0x2d
function enablejuggernautcrateobjective(crate) {
    crate setotherent(self);
    crate setscriptablepartstate(#"objective_map", #"jugg_world");
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe174
// Size: 0x2d
function choosejuggernautcratemodel(crate) {
    crate setotherent(self);
    crate setscriptablepartstate(#"model", #"choose");
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe1a8
// Size: 0x89
function juggcanusecrate(cratetype) {
    var_4418a5e6f9d1e943 = 1;
    switch (cratetype) {
    case #"hash_b597e9a707180461":
    case #"hash_d8d9a61afc7a655b":
        var_4418a5e6f9d1e943 = 0;
        break;
    case #"hash_d87004954b36d6e1":
        if (issharedfuncdefined("juggernaut", "canUseWeaponPickups")) {
            canuseweaponpickups = self [[ getsharedfunc("juggernaut", "canUseWeaponPickups") ]]();
            if (!istrue(canuseweaponpickups)) {
                var_4418a5e6f9d1e943 = 0;
            }
        }
        break;
    }
    return var_4418a5e6f9d1e943;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe239
// Size: 0x1d
function function_3c4492046080faa9() {
    return ter_op(istrue(self.inwater), 50, 5);
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe25e
// Size: 0x1d
function function_f7e3f128296ac3b6() {
    return ter_op(istrue(self.inwater), 5, 1);
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe283
// Size: 0x17
function function_d4833b6c916db9c6() {
    return ter_op(istrue(self.inwater), 3, 6);
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe2a2
// Size: 0x3a
function private function_c857ac89588adf6f() {
    leveldata = getleveldata(self.cratetype);
    return ter_op(istrue(self.inwater), 5, leveldata.headiconoffset);
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe2e4
// Size: 0x7a
function function_19dc247eaaf9da8f() {
    leveldata = getleveldata("elite_arrow_bombsite");
    leveldata.basemodel = "military_carepackage_01_cq";
    leveldata.var_9ae260c6bfb4c98d = 1;
    leveldata.minimapicon = undefined;
    leveldata.headicon = undefined;
    leveldata.supportsownercapture = 0;
    leveldata.hasnointeraction = 1;
    leveldata.timeout = 0.1;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe365
// Size: 0xd4
function function_56e93fd2282a71ce() {
    leveldata = getleveldata("legendary_supply_drop");
    leveldata.basemodel = "military_carepackage_03_br";
    leveldata.mountmantlemodel = undefined;
    leveldata.usepriority = -1;
    leveldata.minimapicon = undefined;
    leveldata.headicon = undefined;
    leveldata.supportsownercapture = 0;
    leveldata.timeout = 180;
    leveldata.ownerusetime = 0.5;
    leveldata.otherusetime = 0.5;
    leveldata.capturestring = "MP/GENERIC_LOOT_CRATE_CAPTURE";
    leveldata.capturecallback = &function_e7051a617b94015;
    leveldata.destroyoncapture = 1;
    leveldata.var_c23ca3472233553d = 1;
}

// Namespace airdrop/namespace_6c578d6ef48f10ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe440
// Size: 0x34
function function_e7051a617b94015(player) {
    if (issharedfuncdefined("br_legendary_supply_drop", "legendary_supply_onCrateUse")) {
        self [[ getsharedfunc("br_legendary_supply_drop", "legendary_supply_onCrateUse") ]](player);
    }
}

