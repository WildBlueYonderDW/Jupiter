#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using scripts\common\values.gsc;
#using scripts\common\callbacks.gsc;
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f84
// Size: 0xf3
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x207f
// Size: 0xb3
function initkillstreak() {
    /#
        setdevdvarifuninitialized(@"hash_c247993ede3808ca", "<dev string:x1c>");
        setdevdvarifuninitialized(@"hash_22186e8d4f1020da", "<dev string:x1c>");
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x213a
// Size: 0x32
function initheli() {
    level.littlebirds = [];
    if (issharedfuncdefined("airdrop", "registerScoreInfo")) {
        [[ getsharedfunc("airdrop", "registerScoreInfo") ]]();
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2174
// Size: 0x323
function initcratedata() {
    leveldata = spawnstruct();
    leveldata.configs = [];
    leveldata.crates = [];
    leveldata.usablecrates = [];
    level.cratedata = leveldata;
    level.cratedata.unresolvedcollisiontolerancesqr = pow(getdvarfloat(@"hash_a0cbf9e8d23fb12c", 2), 2);
    /#
        var_8f3ab761a14ddcdb = getentarray("<dev string:x1d>", "<dev string:x2e>");
        assertex(isdefined(var_8f3ab761a14ddcdb), "<dev string:x39>");
        assertex(isdefined(var_8f3ab761a14ddcdb) && var_8f3ab761a14ddcdb.size <= 1, "<dev string:x67>");
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
        if (issharedfuncdefined("airdrop", "getGameModeSpecificCrateData")) {
            [[ getsharedfunc("airdrop", "getGameModeSpecificCrateData") ]]();
        }
    case #"hash_bfabc434c59611fa":
    case #"hash_fa21c4f6bd5e3815": 
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x249f
// Size: 0x4e
function function_93512c08385359e1() {
    level.var_27f78817b59dfe32 = "airdrop_placement";
    val::group_register(level.var_27f78817b59dfe32, ["offhand_weapons", "melee", "execution_attack", "weapon_pickup", "cp_munitions_pickup"]);
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24f5
// Size: 0x1b
function function_27994695f48962e1() {
    game["dialog"]["airdrop_use"] = "killstreak_remote_operator" + "_request_response";
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2518
// Size: 0x68
function getleveldata(cratetype) {
    assertex(isdefined(level.cratedata), "getLevelData() called before initCrateData().");
    leveldata = level.cratedata.configs[cratetype];
    if (!isdefined(leveldata)) {
        leveldata = getemptyleveldata();
        level.cratedata.configs[cratetype] = leveldata;
    }
    return leveldata;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2589
// Size: 0x279
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
    leveldata.capturestring = %KILLSTREAKS_HINTS/CRATE_PICKUP;
    leveldata.rerollstring = %KILLSTREAKS_HINTS/UAV_REROLL;
    leveldata.headicon = "hud_icon_minimap_killstreak_carepackage";
    leveldata.supportsreroll = 0;
    leveldata.supportsownercapture = 1;
    leveldata.supportsothercapture = 1;
    return leveldata;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x280b
// Size: 0x21
function hasleveldata(cratetype) {
    return isdefined(level.cratedata.configs[cratetype]);
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2835
// Size: 0x545
function createcrate(owner, team, cratetype, position, angles, destination, hasnophysics, var_6244a1d5b282bb6c, data, skipminimapicon, markerposition) {
    assertex(hasleveldata(cratetype), "createCrate() called with an invalid crateType.");
    leveldata = getleveldata(cratetype);
    if (leveldata.supportsownercapture) {
        assertex(isdefined(owner), "createCrate() specifies ownerCapture but has no owner.");
    }
    if (leveldata.supportsreroll) {
        assertex(isdefined(owner), "createCrate() specifies supportsReroll but has no owner (only owners can reroll).");
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
        println("<dev string:xac>" + cratetype);
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
    crate.isdropcrate = leveldata.isdropcrate;
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d83
// Size: 0xb
function activatecratefirsttime() {
    activatecrate(1);
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d96
// Size: 0xd2
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e70
// Size: 0x5f
function deactivatecrate(ispermanent) {
    if (istrue(ispermanent)) {
        destroyminimapicon();
    }
    _destroyheadicon();
    makecrateunusable();
    leveldata = getleveldata(self.cratetype);
    if (isdefined(leveldata.deactivatecallback)) {
        self thread [[ leveldata.deactivatecallback ]](ispermanent);
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ed7
// Size: 0x1a4
function capturecrate(player) {
    leveldata = getleveldata(self.cratetype);
    var_45c6df348e1551b3 = isdefined(self.owner);
    if (var_45c6df348e1551b3 && istrue(self.owner.isffprotectedaction)) {
        self.owner.isffprotectedaction = 0;
    }
    if (isdefined(leveldata.capturecallback)) {
        self thread [[ leveldata.capturecallback ]](player);
    }
    if (!istrue(self.boobytrapped) && istrue(player.var_9ee2c87e0747c021)) {
        var_ee3ccf749502a23 = level.sharedfuncs[#"perk"][#"hash_5e75be22dd250b68"];
        if (isdefined(var_ee3ccf749502a23)) {
            self thread [[ var_ee3ccf749502a23 ]](player);
        }
        self.boobytrapped = 1;
        return;
    }
    if (istrue(self.boobytrapped)) {
        detonatefunc = level.sharedfuncs[#"perk"][#"hash_3b864e571f199211"];
        if (isdefined(detonatefunc)) {
            self thread [[ detonatefunc ]]();
        }
        thread deletecrate(isdefined(self.var_278a47ee942fd1b0) ? self.var_278a47ee942fd1b0 : 2.5);
        return;
    }
    if (leveldata.destroyoncapture) {
        var_cbf7be4f62a0ddb2 = 0;
        if (isdefined(leveldata.capturevisualscallback)) {
            self thread [[ leveldata.capturevisualscallback ]](self);
            var_cbf7be4f62a0ddb2 = leveldata.capturevisualsdeletiondelay;
        }
        thread deletecrate(var_cbf7be4f62a0ddb2);
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3083
// Size: 0x2cb
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
            self.owner scripts\cp_mp\challenges::function_d997435895422ecc("super_loadout_drop", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"end"), self.numuses);
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
        return;
    }
    thread deletecrateimmediate();
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3356
// Size: 0x148
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
    wait delay;
    self delete();
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34a6
// Size: 0x52
function deletecrateimmediate() {
    var_cbf7be4f62a0ddb2 = level.framedurationseconds;
    if (isdefined(self getlinkedscriptableinstance()) && self getscriptablehaspart("visibility")) {
        self setscriptablepartstate(#"visibility", #"hide", 1);
    }
    deletecrate(var_cbf7be4f62a0ddb2);
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3500
// Size: 0xa1
function watchcratedestroyearly() {
    self endon("death");
    leveldata = getleveldata(self.cratetype);
    /#
        nolifetime = getdvarint(@"hash_2c01d701bac5d9d3", 0);
        if (nolifetime) {
            leveldata.timeout = undefined;
        }
    #/
    if (isdefined(leveldata.timeout)) {
        assert(leveldata.timeout > 0, "watchCrateDestroyEarly called with a timeOut value of 0.");
    }
    watchcratedestroyearlyinternal(leveldata.timeout);
    if (istrue(self.nevertimeout)) {
        return;
    }
    thread destroycrate();
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35a9
// Size: 0xf2
function watchcratedestroyearlyinternal(timeout) {
    if (isdefined(self.owner)) {
        self.owner endon("disconnect");
        self.owner endon("joined_team");
        self.owner endon("joined_spectators");
    }
    level endon("game_ended");
    if (isdefined(timeout)) {
        scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(timeout);
        while (isdefined(self.playersusing) && self.playersusing.size > 0) {
            validuser = 0;
            foreach (player in self.playersusing) {
                if (isdefined(player)) {
                    validuser = 1;
                    break;
                }
            }
            if (!istrue(validuser)) {
                break;
            }
            waitframe();
        }
        return;
    }
    level waittill("forever");
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36a3
// Size: 0x1b2
function destroycrateinbadtrigger() {
    if (issharedfuncdefined("entity", "touchingBadTrigger")) {
        if (self [[ getsharedfunc("entity", "touchingBadTrigger") ]]()) {
            thread destroycrate();
        }
    }
    if (isdefined(level.var_ca4e08767cbdae12)) {
        canplant = self [[ level.var_ca4e08767cbdae12 ]](self.origin);
        if (!canplant) {
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x385d
// Size: 0xfa
function initcratedropdata() {
    leveldata = spawnstruct();
    leveldata.helis = [];
    var_d8d1344707480943 = scripts\cp_mp\utility\killstreak_utility::getkillstreakairstrikeheightent();
    if (isdefined(var_d8d1344707480943)) {
        leveldata.heliheight = var_d8d1344707480943.origin[2] - 750;
    } else {
        leveldata.heliheight = 2000;
    }
    leveldata.heliheightoffset = 128;
    level.cratedropdata = leveldata;
    initscriptedhelidropdata();
    if (isdefined(level.var_fc8ea831d44aeff6) && !getdvarint(@"hash_d400e64d176da3a4", 0)) {
        foreach (excludestreak in level.var_fc8ea831d44aeff6) {
            overridekillstreakcrateweight(excludestreak, 0);
        }
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x395f
// Size: 0x9
function initscriptedhelidropdata() {
    initscriptedhelidropanims();
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3970
// Size: 0x91
function initscriptedhelidropanims() {
    level.scr_animtree["care_package"] = %script_model;
    level.scr_anim["care_package"]["care_package_drop"] = script_model%mp_carepackage_ckpg_flyin;
    level.scr_anim["care_package"]["care_package_capture"] = script_model%mp_military_carepackage_straps_falling;
    level.scr_animtree["care_package_chute"] = %script_model;
    level.scr_anim["care_package_chute"]["care_package_drop"] = script_model%mp_carepackage_parachute_flyin;
    initscriptedhelidropvehicleanims();
    initbrc130airdropdropanims();
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a09
// Size: 0x33
function initscriptedhelidropvehicleanims() {
    level.scr_animtree["care_package_heli"] = %mp_vehicles_always_loaded;
    level.scr_anim["care_package_heli"]["care_package_drop"] = mp_vehicles_always_loaded%mp_carepackage_lbravo_flyin;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a44
// Size: 0xbc
function initbrc130airdropdropanims() {
    level.scr_anim["care_package"]["brc130_drop_high"] = script_model%mp_carepackage_ckpg_flyin_10500;
    level.scr_anim["care_package"]["brc130_drop_med"] = script_model%mp_carepackage_ckpg_flyin_7500;
    level.scr_anim["care_package"]["brc130_drop_low"] = script_model%mp_carepackage_ckpg_flyin_3000;
    level.scr_anim["care_package_chute"]["brc130_drop_high"] = script_model%mp_carepackage_parachute_flyin_10500;
    level.scr_anim["care_package_chute"]["brc130_drop_med"] = script_model%mp_carepackage_parachute_flyin_7500;
    level.scr_anim["care_package_chute"]["brc130_drop_low"] = script_model%mp_carepackage_parachute_flyin_3000;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b08
// Size: 0x4e
function placecrate(owner, team, cratetype, position, angles, data, skipminimapicon) {
    return createcrate(owner, team, cratetype, position, angles, undefined, 0, 1, data, skipminimapicon, position);
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b5f
// Size: 0x81
function dropcrate(owner, team, cratetype, position, angles, destination, data, skipminimapicon) {
    if (!isdefined(destination)) {
        caststart = getcratedropcaststart(position, 0);
        destination = getcratedropdestination(caststart, getcratedropcastend(caststart, 0));
    }
    return createcrate(owner, team, cratetype, position, angles, destination, undefined, 1, data, skipminimapicon, position);
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3be9
// Size: 0x247
function dropcratefrommanualheli(owner, team, cratetype, position, angles, enteroffset, exitoffset, destination, data) {
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
    angles *= (0, 1, 0);
    enterposition = position + -1 * anglestoforward(angles) * enteroffset;
    dropstruct.dropposition = position;
    dropstruct.exitposition = position + anglestoforward(angles) * exitoffset;
    vehicleisreserved = undefined;
    if (isdefined(data)) {
        vehicleisreserved = data.vehicleisreserved;
    }
    heli = createheli(owner, team, enterposition, angles, vehicleisreserved);
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
    crate = createcrate(owner, team, cratetype, enterposition, heli.angles, destination, undefined, 0, data, undefined, position);
    crate.dropstruct = dropstruct;
    crate linkto(heli, "tag_origin", (16, 0, -156), (0, 0, 0));
    dropstruct.crate = crate;
    dropstruct thread watchdropcratefrommanualheli();
    return dropstruct;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e39
// Size: 0x4c
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e8d
// Size: 0x289
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x411e
// Size: 0x3b
function docratedropfrommanualheli() {
    crate = self.crate;
    self.crate.dropstruct = undefined;
    self.crate = undefined;
    crate cratephysicson();
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 13, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4161
// Size: 0x28b
function createcrateforscripteddrop(owner, team, cratetype, destination, hasnophysics, var_6244a1d5b282bb6c, data, streakinfo, scenenode, animname, _anim, clearanimdroptime, markerposition) {
    if (isdefined(streakinfo) && isdefined(streakinfo.streakname) && isstruct(data)) {
        streakbundle = undefined;
        if (isdefined(level.streakglobals)) {
            streakbundle = level.streakglobals.streakbundles[streakinfo.streakname];
        }
        if (isdefined(streakbundle) && isdefined(streakbundle.var_46525b458090d681)) {
            data.var_4191ace1612a5376 = streakbundle.var_46525b458090d681;
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
    crate scripts\common\anim::setanimtree();
    crateanim = level.scr_anim[animname][_anim];
    var_feb55c68b4b9610 = getanimlength(crateanim) * 1000;
    crate.animdroptime = undefined;
    crate.animstoptrailtime = undefined;
    crate.animendtime = gettime() + var_feb55c68b4b9610;
    if (!istrue(clearanimdroptime)) {
        crate.animdroptime = gettime() + getnotetracktimes(crateanim, "carepackage_drop")[0] * var_feb55c68b4b9610;
        crate.animstoptrailtime = gettime() + getnotetracktimes(crateanim, "carepackage_trail_end")[0] * var_feb55c68b4b9610;
    }
    scenenode.latestanimendtime = ter_op(crate.animendtime > scenenode.latestanimendtime, crate.animendtime, scenenode.latestanimendtime);
    return crate;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43f5
// Size: 0x1c0
function createchuteforscripteddrop(scenenode, crate, animname, _anim) {
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
    chute scripts\common\anim::setanimtree();
    var_4adba587d6befdd3 = level.scr_anim[animname][_anim];
    var_d211250db97a000a = getanimlength(var_4adba587d6befdd3) * 1000;
    chute.animendtime = gettime() + getanimlength(level.scr_anim[animname][_anim]) * 1000;
    chute.animunhidetime = gettime() + getnotetracktimes(var_4adba587d6befdd3, "chute_unhide")[0] * var_d211250db97a000a;
    chute.animendtime = gettime() + var_d211250db97a000a;
    scenenode.latestanimendtime = ter_op(chute.animendtime > scenenode.latestanimendtime, chute.animendtime, scenenode.latestanimendtime);
    return chute;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45be
// Size: 0x30
function destroychute() {
    if (isdefined(self.scenenode)) {
        self.scenenode.chutes[self getentitynumber()] = undefined;
    }
    self delete();
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45f6
// Size: 0x34e
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
    if (!isdefined(crate) || isdefined(owner) && istrue(owner.ksempd)) {
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x494d
// Size: 0x1a8
function watchdropcratefromscriptedheli() {
    self endon("death");
    scripts\common\anim::anim_first_frame_solo(self.heli, "care_package_drop");
    foreach (crate in self.crates) {
        scripts\common\anim::anim_first_frame_solo(crate, "care_package_drop");
    }
    foreach (chute in self.chutes) {
        scripts\common\anim::anim_first_frame_solo(chute, "care_package_drop");
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4afd
// Size: 0x4d2
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
                thread scripts\common\anim::anim_single_solo(self.heli, "care_package_drop");
            }
            foreach (crate in self.crates) {
                if (isdefined(crate)) {
                    crate setscriptablepartstate(#"visibility", #"show", 0);
                    thread scripts\common\anim::anim_single_solo(crate, "care_package_drop");
                }
            }
            foreach (chute in self.chutes) {
                if (isdefined(chute)) {
                    thread scripts\common\anim::anim_single_solo(chute, "care_package_drop");
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
                    if (gettime() > crate.animendtime || isdefined(self.owner) && istrue(self.owner.ksempd)) {
                        if (disowned) {
                            crate thread destroycrate();
                        }
                        thread docratedropfromscripted(crate);
                        continue;
                    }
                    if (gettime() > crate.animdroptime) {
                        if (gettime() > crate.animstoptrailtime) {
                            crate setscriptablepartstate(#"trail", #"neutral", 1);
                        } else {
                            crate setscriptablepartstate(#"trail", #"active", 1);
                        }
                        if (disowned) {
                            crate thread destroycrate();
                        }
                        continue;
                    }
                    if (disowned) {
                        crate thread destroycrate();
                        continue;
                    }
                    if (!isdefined(self.heli) || istrue(self.heli.isdestroyed)) {
                        thread docratedropfromscripted(crate);
                    }
                }
            }
            foreach (chute in self.chutes) {
                if (isdefined(chute)) {
                    if (gettime() > chute.animendtime || isdefined(self.owner) && istrue(self.owner.ksempd)) {
                        chute thread destroychute();
                        continue;
                    }
                    if (gettime() <= chute.crateanimdroptime && (!isdefined(chute.crate) || !isdefined(self.crates[chute.crate getentitynumber()]))) {
                        chute thread destroychute();
                        continue;
                    }
                    if (gettime() > chute.animunhidetime) {
                        chute setscriptablepartstate(#"visibility", #"show", 0);
                    }
                }
            }
        }
        waitframe();
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fd7
// Size: 0x69
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5048
// Size: 0x5d
function getcratedropcaststart(position, fromheli, droptype) {
    caststart = undefined;
    if (istrue(fromheli)) {
        caststart = position * (1, 1, 0) + (0, 0, getscriptedhelidropheight(droptype));
    } else {
        caststart = position + (0, 0, 25);
    }
    return caststart;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50ae
// Size: 0x29
function getcratedropcastend(caststart, fromheli) {
    return caststart + (0, 0, -1 * ter_op(istrue(fromheli), 25000, 25000));
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50e0
// Size: 0xef
function getcratedropdestination(caststart, castend, destination) {
    ignorelist = getcratedropignorelist();
    contentoverride = scripts\engine\trace::create_contents(0, 1, 1, 1, 0, 0);
    droptrace = scripts\engine\trace::sphere_trace(caststart, castend, 100, ignorelist, contentoverride);
    if (droptrace["hittype"] != "hittype_none" && isdefined(droptrace["position"])) {
        if (isdefined(destination)) {
            destination = (destination[0], destination[1], droptrace["position"][2]);
        } else {
            destination = droptrace["position"];
        }
    }
    /#
        thread scripts\cp_mp\utility\debug_utility::drawsphere(destination, 20, 30, (0, 1, 0));
        thread scripts\cp_mp\utility\debug_utility::drawline(destination, caststart, 30, (0, 1, 0));
        thread scripts\cp_mp\utility\debug_utility::drawsphere(caststart, 20, 30, (0, 1, 0));
    #/
    return destination;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51d8
// Size: 0xb7
function getcratedropignorelist() {
    if (isdefined(level.cratedata.helis) && isdefined(level.cratedata.ac130s)) {
        return array_combine_multiple([level.cratedropdata.helis, level.cratedropdata.ac130s, level.cratedata.crates]);
    }
    return array_combine_multiple([level.cratedropdata.helis, level.cratedata.crates]);
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5297
// Size: 0x4c1
function createheli(owner, team, position, angles, vehicleisreserved, streakinfo) {
    heli = undefined;
    var_50cea258b08e022b = #"heli";
    streakbundle = undefined;
    if (isdefined(streakinfo) && isdefined(streakinfo.streakname) && isdefined(level.streakglobals)) {
        streakbundle = level.streakglobals.streakbundles[streakinfo.streakname];
    }
    heliname = "veh_airdrop_mp_phys";
    helimodel = "veh9_mil_air_heli_medium_airdrop_mp";
    if (isdefined(streakbundle)) {
        if (isdefined(streakbundle.var_4380bc0aa8fb8e3f)) {
            var_50cea258b08e022b = streakbundle.var_4380bc0aa8fb8e3f;
        }
        if (isdefined(streakbundle.airdropvehicle)) {
            heliname = streakbundle.airdropvehicle;
        }
        if (isdefined(streakbundle.var_e26d3ad734784c1b)) {
            helimodel = streakbundle.var_e26d3ad734784c1b;
        }
    }
    if (istrue(vehicleisreserved)) {
        scripts\cp_mp\vehicles\vehicle_tracking::clearvehiclereservation();
    }
    if (var_50cea258b08e022b == #"nonheli") {
        spawndata = {#var_5bfcdcb0bf0678c6:1, #targetname:"airdrop", #modelname:helimodel, #vehicletype:heliname, #angles:angles, #origin:position};
        faildata = spawnstruct();
        heli = scripts\cp_mp\vehicles\vehicle_tracking::_spawnvehicle(spawndata, faildata);
    } else {
        heli = scripts\cp_mp\vehicles\vehicle_tracking::_spawnhelicopter(undefined, position, angles, heliname, helimodel);
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
        vocallout = config.callout;
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
            heli scripts\mp\sentientpoolmanager::registersentient("Killstreak_Air", owner);
        }
    }
    if (issharedfuncdefined("killstreak", "killstreakMakeVehicle")) {
        heli [[ getsharedfunc("killstreak", "killstreakMakeVehicle") ]](heliname, scorepopup, vodestroyed, destroyedsplash);
    }
    if (issharedfuncdefined("killstreak", "killstreakSetPreModDamageCallback")) {
        heli [[ getsharedfunc("killstreak", "killstreakSetPreModDamageCallback") ]](heliname);
    }
    if (issharedfuncdefined("killstreak", "killstreakSetPostModDamageCallback")) {
        heli [[ getsharedfunc("killstreak", "killstreakSetPostModDamageCallback") ]](heliname);
    }
    if (issharedfuncdefined("killstreak", "killstreakSetDeathCallback")) {
        heli [[ getsharedfunc("killstreak", "killstreakSetDeathCallback") ]](heliname, &destroyhelicallback);
    }
    bundle = level.streakglobals.streakbundles["airdrop"];
    if (!isdefined(streakbundle) || !istrue(streakbundle.candamage)) {
        heli setcandamage(0);
    } else if (issharedfuncdefined("damage", "monitorDamage")) {
        heli thread [[ getsharedfunc("damage", "monitorDamage") ]](heli.maxhealth, "hitequip", &function_5be12c382c72de75, &function_763c331f22e7499e, 1, 1);
    }
    heli thread watchhelidestroyearly();
    return heli;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5761
// Size: 0x35
function private function_5be12c382c72de75(data) {
    veh = data.victim;
    veh thread destroyheli();
    return data.damage;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x579f
// Size: 0x3c
function private function_5df678b586cdb293(veh) {
    if (!isdefined(veh)) {
        return;
    }
    veh thread destroyheli();
    level callback::callback("killstreak_finish_use", {#streakinfo:veh.streakinfo});
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x57e3
// Size: 0x178
function private function_763c331f22e7499e(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    meansofdeath = data.meansofdeath;
    type = data.meansofdeath;
    modifieddamage = data.damage;
    if (istrue(level.var_be6a42242be00b66)) {
        bundle = level.streakglobals.streakbundles["airdrop"];
        modifieddamage = getmodifieddamageusingdamagetuning(attacker, objweapon, type, modifieddamage, self.maxhealth, bundle.var_e913079a5ffda56d);
    } else if (issharedfuncdefined("killstreak", "getModifiedAntiKillstreakDamage")) {
        modifieddamage = self [[ getsharedfunc("killstreak", "getModifiedAntiKillstreakDamage") ]](attacker, objweapon, meansofdeath, modifieddamage, self.maxhealth, 1, 1, 1);
    }
    data.damage = modifieddamage;
    damagetaken = data.victim.damagetaken + data.damage;
    healthpercent = 100 - 100 * damagetaken / data.victim.maxhealth;
    return data.damage;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5964
// Size: 0x18
function watchhelidestroyearly() {
    self endon("death");
    watchhelidestroyearlyinternal();
    thread destroyheli();
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5984
// Size: 0x52
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59de
// Size: 0xb
function destroyheli() {
    thread deleteheli(0);
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59f1
// Size: 0x5f
function deleteheli(delay) {
    self notify("death");
    self.isdestroyed = 1;
    if (isdefined(self.scenenode)) {
        self.scenenode.heli = undefined;
        self.scenenode = undefined;
    }
    removehelidroppingcratefromlist(self getentitynumber());
    wait delay;
    scripts\cp_mp\vehicles\vehicle_tracking::_deletevehicle(self);
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a58
// Size: 0x12
function destroyhelicallback(data) {
    destroyheli();
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a72
// Size: 0x36
function getscriptedhelidropheightbase(droptype) {
    assertex(isdefined(level.cratedropdata), "getScriptedHeliDropHeightBase() called before initCrateDropData().");
    return level.cratedropdata.heliheight;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ab1
// Size: 0x3b
function getscriptedhelidropheight(droptype) {
    return getscriptedhelidropheightbase(droptype) + level.cratedropdata.helis.size * level.cratedropdata.heliheightoffset;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5af5
// Size: 0x4b
function addhelidroppingcratetolist(heli) {
    assertex(isdefined(level.cratedropdata), "getScriptedHeliDropHeight() called before initCrateDropData().");
    entnum = heli getentitynumber();
    level.cratedropdata.helis[entnum] = heli;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b48
// Size: 0x20
function removehelidroppingcratefromlist(entnum) {
    level.cratedropdata.helis[entnum] = undefined;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b70
// Size: 0x17d
function makecrateusable() {
    leveldata = getleveldata(self.cratetype);
    if (istrue(leveldata.hasnointeraction)) {
        return;
    }
    level.cratedata.usablecrates[self getentitynumber()] = self;
    self.isusable = 1;
    assertex(leveldata.supportsownercapture || leveldata.supportsothercapture, "makeCrateUsable called on a crate that does not support owner capture OR other capture.");
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
        return;
    }
    if (leveldata.supportsownercapture) {
        thread watchcrateuse(1);
        return;
    }
    thread watchcrateuse(2);
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5cf5
// Size: 0x40e
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
    triggerobject = gettriggerobject(useobject);
    triggerobject.usetype = usetype;
    triggerobject.userate = 1;
    triggerobject.curprogress = 0;
    if (isdefined(triggerobject.usetimeoverride)) {
        triggerobject.usetime = triggerobject.usetimeoverride;
    } else {
        triggerobject.usetime = ter_op(usetype == 1, leveldata.ownerusetime, leveldata.otherusetime);
    }
    triggerobject.inuse = 0;
    triggerobject.playerusing = undefined;
    if (!isdefined(self.playeroutlines)) {
        self.playeroutlines = [];
    }
    if (issharedfuncdefined("outline", "outlineEnableForTeam") && isdefined(self.team)) {
        self.playeroutlines[self.playeroutlines.size] = [[ getsharedfunc("outline", "outlineEnableForTeam") ]](self, self.team, "outline_depth_cyan", "level_script");
    }
    while (true) {
        player = triggerobject waittill("trigger");
        if (getdvarint(@"hash_618b9c003b5b3883", 0) == 0) {
            if (isdefined(self.disabled_use_for) && istrue(self.disabled_use_for[player getentitynumber()])) {
                player scripts\engine\utility::function_f3bb4f4911a1beb2("airdrop", "airdrop_cannotUseLoadoutCrateHint");
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
            triggerobject.playerusing = player;
            result = watchcrateuseinternal(player, useobject);
            if (isdefined(player)) {
                stopusingcrate(player, useobject);
            }
            triggerobject.playerusing = undefined;
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x610b
// Size: 0x1e3
function watchcrateuseinternal(player, useobject) {
    triggerobject = gettriggerobject(useobject);
    if (triggerobject.usetype != 1) {
        player endon("disconnect");
        player endon("joined_team");
        player endon("joined_spectators");
    }
    triggerobject.id = function_7972a1043e6facab();
    triggerobject.userate = ter_op(isdefined(player.objectivescaler), player.objectivescaler, 1);
    /#
        var_544e47b30f4f8fc3 = getdvarint(@"hash_7acaaf8f4063ab02", 0);
        if (isdefined(triggerobject.usetimeoverride)) {
            triggerobject.usetime = triggerobject.usetimeoverride;
        } else if (issharedfuncdefined("<dev string:xcc>", "<dev string:xd1>")) {
            if ([[ getsharedfunc("<dev string:xcc>", "<dev string:xd1>") ]]() == "<dev string:xdd>") {
            } else {
                triggerobject.usetime = ter_op(var_544e47b30f4f8fc3, 3, 0.5);
            }
        }
    #/
    playusesound(player, useobject);
    while (isdefined(player) && player scripts\cp_mp\utility\player_utility::_isalive() && cankeepusingcrate(player, useobject) && player usebuttonpressed()) {
        triggerobject.curprogress += level.framedurationseconds * triggerobject.userate;
        if (triggerobject.curprogress >= triggerobject.usetime) {
            triggerobject.curprogress = 0;
            return true;
        }
        if (issharedfuncdefined("airdrop", "updateUIProgress")) {
            player [[ getsharedfunc("airdrop", "updateUIProgress") ]](triggerobject, 1);
        }
        waitframe();
    }
    triggerobject.curprogress = 0;
    return false;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62f7
// Size: 0x25
function function_7972a1043e6facab() {
    if (utility::iscp()) {
        return "use";
    }
    if (scripts\cp_mp\utility\game_utility::function_d04af493b6e718ac()) {
        return "open";
    }
    return "care_package";
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6325
// Size: 0xca
function makecrateunusable() {
    self notify("makeCrateUnusable");
    assertex(isdefined(level.cratedata), "makeCrateUnusable() called before initCrateData().");
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63f7
// Size: 0x13f
function startusingcrate(player, useobject) {
    if (!isdefined(self.playersusing)) {
        self.playersusing = [];
    }
    if (!array_contains(self.playersusing, player)) {
        self.playersusing = array_add(self.playersusing, player);
    }
    triggerobject = gettriggerobject(useobject);
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
        player [[ getsharedfunc("airdrop", "updateUIProgress") ]](triggerobject, 0);
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x653e
// Size: 0x45
function airdrop_givecrateuseweapon() {
    self endon("disconnect");
    level endon("game_ended");
    scripts\cp_mp\utility\weapon_utility::saveweaponstates();
    crateweaponobj = makeweapon("ks_use_crate_mp");
    scripts\cp_mp\utility\inventory_utility::_giveweapon(crateweaponobj);
    thread airdrop_watchforcrateuseend(crateweaponobj);
    self switchtoweapon(crateweaponobj);
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x658b
// Size: 0x76
function airdrop_watchforcrateuseend(crateweaponobj) {
    self endon("disconnect");
    level endon("game_ended");
    self waittill("crate_use_end");
    if (scripts\cp_mp\utility\inventory_utility::isswitchingtoweaponwithmonitoring(crateweaponobj)) {
        scripts\cp_mp\utility\inventory_utility::abortmonitoredweaponswitch(crateweaponobj);
        return;
    }
    scripts\cp_mp\utility\inventory_utility::_takeweapon(crateweaponobj);
    if (isdefined(self.lastdroppableweaponobj)) {
        lastweaponobj = scripts\cp_mp\utility\weapon_utility::restoreweaponstates(self.lastdroppableweaponobj);
        self switchtoweapon(lastweaponobj);
        thread scripts\cp_mp\utility\inventory_utility::forcevalidweapon(lastweaponobj);
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6609
// Size: 0x113
function stopusingcrate(player, useobject) {
    if (array_contains(self.playersusing, player)) {
        self.playersusing = array_remove(self.playersusing, player);
    }
    triggerobject = gettriggerobject(useobject);
    leveldata = getleveldata(self.cratetype);
    if (istrue(player.isjuggernaut)) {
        if (issharedfuncdefined("airdrop", "allowActionSet")) {
            player [[ getsharedfunc("airdrop", "allowActionSet") ]]("juggCrateUse", 1);
        }
    } else if (issharedfuncdefined("airdrop", "allowActionSet")) {
        player [[ getsharedfunc("airdrop", "allowActionSet") ]]("crateUse", 1);
    }
    if (issharedfuncdefined("airdrop", "updateUIProgress")) {
        player [[ getsharedfunc("airdrop", "updateUIProgress") ]](triggerobject, 0);
    }
    stopusesound(player, useobject);
    player notify("crate_use_end");
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6724
// Size: 0x19f
function canstartusingcrate(player, useobject, var_c83f8b96968afe72) {
    if (issharedfuncdefined("airdrop", "specialCase_canUseCrate")) {
        if (!player [[ getsharedfunc("airdrop", "specialCase_canUseCrate") ]]()) {
            return 0;
        }
    }
    if (!player val::get("crate_use")) {
        return 0;
    }
    if (!player scripts\cp_mp\utility\player_utility::_isalive()) {
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
        if (isdefined(self.playersused) && scripts\engine\utility::array_contains(self.playersused, player)) {
            return 0;
        }
        if (player.sessionsquadid != self.sessionsquadid || player.team != self.team) {
            return 0;
        }
    }
    if (istrue(self.isteamonlycrate)) {
        if (isdefined(self.playersused) && scripts\engine\utility::array_contains(self.playersused, player)) {
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
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype() && player isskydiving()) {
        return 0;
    }
    if (istrue(player.inlaststand)) {
        return 0;
    }
    return 1;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68cc
// Size: 0x11a
function canstartusingcratetriggerobject(player, useobject) {
    triggerobject = gettriggerobject(useobject);
    if (isdefined(triggerobject.playerusing) && triggerobject.playerusing != player) {
        return false;
    }
    if (triggerobject.usetype == 1 && (!isdefined(self.owner) || player != self.owner)) {
        return false;
    }
    if (triggerobject.usetype == 2 && isdefined(self.owner) && player == self.owner) {
        return false;
    }
    if (level.teambased && isdefined(self.team) && self.team != "neutral") {
        leveldata = getleveldata(self.cratetype);
        if (leveldata.friendlyuseonly && player.team != self.team) {
            return false;
        }
    }
    return true;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69ef
// Size: 0xf8
function cankeepusingcrate(player, useobject) {
    if (!val::get("crate_use")) {
        return false;
    }
    if (!player scripts\cp_mp\utility\player_utility::_isalive()) {
        return false;
    }
    if (player meleebuttonpressed()) {
        return false;
    }
    if (player isinexecutionvictim()) {
        return false;
    }
    if (istrue(player.inlaststand)) {
        return false;
    }
    leveldata = getleveldata(self.cratetype);
    if (isdefined(leveldata.breakuserangesqr) && distancesquared(player.origin, gettriggerobject(useobject).origin) >= leveldata.breakuserangesqr) {
        return false;
    }
    if (!self.isusable) {
        return false;
    }
    if (isdefined(self.cratetype) && self.cratetype == "loadout_drop") {
        if (!player isonground() && !player isswimming()) {
            return false;
        }
    }
    return true;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6af0
// Size: 0x111
function makecrateusableforplayer(crate, player) {
    triggerobject = crate gettriggerobject();
    function_b21dea8dc3360508(triggerobject, crate);
    if (isdefined(crate.useobject)) {
        triggerobject = crate gettriggerobject(crate.useobject);
        function_b21dea8dc3360508(triggerobject, crate);
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
        return;
    }
    if (!crate canstartusingcratetriggerobject(player, undefined)) {
        crate disableplayeruse(player);
    }
    if (isdefined(crate.useobject)) {
        if (!crate canstartusingcratetriggerobject(player, crate.useobject)) {
            crate.useobject disableplayeruse(player);
        }
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c09
// Size: 0x12a
function function_b21dea8dc3360508(triggerobject, crate) {
    leveldata = getleveldata(crate.cratetype);
    if (!iscp()) {
        triggerobject setcursorhint("HINT_NOICON");
        triggerobject sethintonobstruction("show");
    } else {
        triggerobject setcursorhint("HINT_BUTTON");
        triggerobject sethintonobstruction("hide");
    }
    triggerobject sethinttag(leveldata.usetag);
    triggerobject sethintdisplayrange(leveldata.userange);
    triggerobject sethintdisplayfov(leveldata.usefov);
    triggerobject setuserange(leveldata.userange);
    triggerobject setusefov(leveldata.usefov);
    triggerobject setusepriority(leveldata.usepriority);
    triggerobject setuseholdduration("duration_none");
    if (triggerobject.usetype == 1 && crate.supportsreroll) {
        triggerobject sethintstring(crate.rerollstring);
        return;
    }
    triggerobject sethintstring(crate.capturestring);
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d3b
// Size: 0x228
function watchallcrateusability() {
    var_36afca263bbc6fbc = 0;
    if (getdvarint(@"hash_8a7e8eb2a9a7101", 0)) {
        var_36afca263bbc6fbc = 1;
    }
    while (true) {
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
                    if (!crate [[ crate.var_83cf634784b3a96b ]](player)) {
                        continue;
                    }
                }
                if (istrue(var_36afca263bbc6fbc)) {
                    inrange = distancesquared(crate.origin, player.origin) < 57600;
                    if (inrange) {
                        makecrateusableforplayer(crate, player);
                    }
                    continue;
                }
                makecrateusableforplayer(crate, player);
            }
        }
        wait 0.1;
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f6b
// Size: 0x51
function playusesound(player, useobject) {
    triggerobject = gettriggerobject(useobject);
    if (triggerobject.usetype == 1) {
        player playloopsound("mp_care_package_owner_cap");
        return;
    }
    player playloopsound("mp_care_package_non_owner_cap");
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6fc4
// Size: 0x67
function stopusesound(player, useobject) {
    triggerobject = gettriggerobject(useobject);
    if (triggerobject.usetype == 1) {
        player stoploopsound("mp_care_package_owner_cap");
    } else {
        player stoploopsound("mp_care_package_non_owner_cap");
    }
    if (player scripts\cp_mp\utility\player_utility::_isalive()) {
        player playsoundonmovingent("mp_care_package_cap_tail");
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7033
// Size: 0x15
function gettriggerobject(useobject) {
    return isdefined(useobject) ? useobject : self;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7051
// Size: 0x180
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
    bodyid = self physics_getbodyid(0);
    physics_setbodycenterofmassnormal(bodyid, (0, 0, -0.75));
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x71d9
// Size: 0x11a
function function_a4d56f106b5ad5f9(data) {
    engine = scripts\cp_mp\utility\train_utility::function_d6b0a591ac99bd();
    assert(isdefined(engine));
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
            scripts\cp_mp\killstreaks\airdrop::destroycrate();
            return;
        }
    }
    wait 1;
    data = spawnstruct();
    data.deathoverridecallback = &function_a4d56f106b5ad5f9;
    self thread [[ getsharedfunc("game", "handlemovingplatforms") ]](data);
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72fb
// Size: 0x47
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x734a
// Size: 0x1c0
function monitoraveragevelocityandupdate() {
    self endon("death");
    self notify("monitorAverageVelocityAndUpdate");
    self endon("monitorAverageVelocityAndUpdate");
    var_fea57fa0e78c63db = 0.1;
    thread monitoraveragevelocities(var_fea57fa0e78c63db, 8);
    settlecount = 0;
    var_4080d353839c6230 = 0;
    self.isfirstactivation = 1;
    var_1684a0b0fb3502c6 = undefined;
    var_42d273fe9538af56 = undefined;
    if (issharedfuncdefined("game", "lpcFeatureGated")) {
        var_42d273fe9538af56 = getsharedfunc("game", "lpcFeatureGated");
    }
    while (true) {
        avlinvel = getaveragelinearvelocity();
        avangvel = getaverageangularvelocity();
        if (isdefined(avlinvel) && isdefined(avangvel)) {
            if (avlinvel <= function_3c4492046080faa9() && avangvel <= function_f7e3f128296ac3b6()) {
                settlecount++;
                var_4080d353839c6230 = 0;
                if (settlecount == function_d4833b6c916db9c6()) {
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
                        wait var_fea57fa0e78c63db;
                        continue;
                    }
                }
                var_4080d353839c6230++;
                settlecount = 0;
                if (var_4080d353839c6230 == 1) {
                    self.physicssettled = undefined;
                    thread deactivatecrate();
                    var_fea57fa0e78c63db = 0.1;
                    thread monitoraveragevelocities(var_fea57fa0e78c63db, 8);
                }
            }
            wait var_fea57fa0e78c63db;
            continue;
        }
        waitframe();
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7512
// Size: 0x1df
function monitoraveragevelocities(var_fea57fa0e78c63db, numdatapoints, var_2b14322307dd13aa) {
    clearaveragevelocities();
    self endon("death");
    self endon("clear_average_velocities");
    self.linvels = [];
    self.angvels = [];
    self.velstartid = 0;
    self.velendid = 0;
    self.velnumdatapoints = numdatapoints;
    if (isdefined(var_2b14322307dd13aa)) {
        var_2b14322307dd13aa = int(clamp(var_2b14322307dd13aa, 0, numdatapoints));
        if (var_2b14322307dd13aa > 0) {
            for (i = 0; i < var_2b14322307dd13aa; i++) {
                self.linvels[self.velstartid + i] = 0;
                self.angvels[self.velstartid + i] = 0;
            }
        }
    }
    while (true) {
        bodyid = self physics_getbodyid(0);
        linvel = physics_getbodylinvel(bodyid);
        angvel = physics_getbodyangvel(bodyid);
        self.linvels[self.velendid] = length(linvel);
        self.angvels[self.velendid] = length(angvel);
        self.velendid++;
        var_e8d39b65d6180c15 = self.velendid - self.velstartid;
        if (var_e8d39b65d6180c15 > numdatapoints) {
            shift = mod(var_e8d39b65d6180c15, numdatapoints);
            for (i = 0; i < shift; i++) {
                self.linvels[self.velstartid + i] = undefined;
                self.angvels[self.velstartid + i] = undefined;
            }
            self.velstartid += shift;
        }
        self.avlinvel = undefined;
        self.avangvel = undefined;
        wait var_fea57fa0e78c63db;
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76f9
// Size: 0x5a
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x775c
// Size: 0x5a
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77bf
// Size: 0x88
function calculateaveragevelocities() {
    var_7a89fce67703419f = 0;
    var_3386dde146fd60b4 = 0;
    for (i = self.velstartid; i < self.velendid; i++) {
        var_7a89fce67703419f += self.linvels[i];
        var_3386dde146fd60b4 += self.angvels[i];
    }
    self.avlinvel = var_7a89fce67703419f / self.velnumdatapoints;
    self.avangvel = var_3386dde146fd60b4 / self.velnumdatapoints;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x784f
// Size: 0x50
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78a7
// Size: 0x4c
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78fb
// Size: 0x30d
function monitorimpactinternal(delay) {
    self endon("death");
    if (isdefined(delay)) {
        wait delay;
    }
    var_260ef1536027d0e1 = 0;
    firstimpact = 0;
    while (true) {
        body0, body1, flag0, flag1, position, normal, impulse, ent = self waittill("collision");
        if (!istrue(firstimpact)) {
            if (isdefined(self.killcament)) {
                self.killcament unlink();
                self.killcament.linked = 0;
            }
            firstimpact = 1;
        }
        if (isdefined(ent)) {
            if (impactshoulddestroyent(ent)) {
                if (isdefined(ent.vehicletype)) {
                    if (isdefined(ent.streakinfo)) {
                        if (isdefined(ent.var_3098bbcd22d0e052) && isdefined(ent.var_3098bbcd22d0e052.cleanupfunc)) {
                            ent thread [[ ent.var_3098bbcd22d0e052.cleanupfunc ]]();
                        } else if (ent scripts\cp_mp\killstreaks\helper_drone::ishelperdrone()) {
                            ent thread scripts\cp_mp\killstreaks\helper_drone::function_ba1c5496f8fc5f67();
                        }
                    } else if (getdvarint(@"hash_35d73d70c6843ce8", 1)) {
                        var_62ccfb7ea15a4520 = ent scripts\cp_mp\vehicles\vehicle::function_62ccfb7ea15a4520();
                        if (!var_62ccfb7ea15a4520 && !istrue(ent.exfilhelicopter)) {
                            ent.var_a8f4bb03b366aa80 = 1;
                            ent scripts\cp_mp\vehicles\vehicle::vehicle_explode();
                        }
                    }
                } else if (ent.classname == "scriptable_iw8_chicken_01") {
                    thread airdrop_crushchicken(ent);
                } else if (isdefined(ent.equipmentref) && ent.equipmentref == "equip_tac_cover") {
                    ent [[ ent.deletefunc ]](0, 1, 1);
                } else if (isdefined(ent.turrettype) && ent.turrettype == "sentry_turret") {
                    ent notify("kill_turret", 1, 1);
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c10
// Size: 0x88
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ca0
// Size: 0x231
function checklinktotraininternal(ent) {
    self endon("death");
    self endon("cancel_link_to_train");
    ent endon("death");
    leveldata = getleveldata(self.cratetype);
    contents = create_contents(0, 1, 0, 0, 0, 1, 1, 0, 0);
    ignorelist = [self];
    foreach (linkedent in self getlinkedchildren(1)) {
        ignorelist[ignorelist.size] = linkedent;
    }
    self.traintracefails = 0;
    self.traintracesuccesses = 0;
    while (self.traintracefails < 20) {
        caststart = self.origin + anglestoup(self.angles) * leveldata.halfheight;
        castend = caststart + (0, 0, -200);
        traceresult = scripts\engine\trace::ray_trace(caststart, castend, ignorelist, contents);
        if (traceresult.size > 0 && isdefined(traceresult["entity"]) && scripts\cp_mp\utility\train_utility::is_train_ent(traceresult["entity"])) {
            traintracerelpos = combineangles(invertangles(ent.angles), ent.origin - traceresult["position"]);
            if (!isdefined(self.traintracerelpos)) {
            } else if (distancesquared(traintracerelpos, self.traintracerelpos) > 10) {
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
            }
            self.traintracerelpos = traintracerelpos;
        } else {
            break;
        }
        wait 0.1;
    }
    thread cancelchecklinktotrain();
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ed9
// Size: 0x32
function cancelchecklinktotrain() {
    self notify("cancel_link_to_train");
    self.trainent = undefined;
    self.traintracerelpos = undefined;
    self.traintracefails = undefined;
    self.traintracesuccesses = undefined;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f13
// Size: 0x54
function airdrop_crushchicken(chicken) {
    self endon("death");
    crushtime = gettime();
    while (gettime() - crushtime < 3000) {
        chicken dodamage(100, chicken.origin, self, self, "MOD_CRUSH");
        wait 0.5;
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f6f
// Size: 0x35
function monitorimpactend() {
    if (!istrue(self.monitoringimpact)) {
        return;
    }
    self notify("monitorImpactEnd");
    self.monitoringimpact = undefined;
    self stoploopsound("mp_care_package_drop_lp");
    self physics_unregisterforcollisioncallback();
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fac
// Size: 0xbf
function impactshoulddestroyent(entity) {
    if (!istrue(self.physicssettled)) {
        if (isdefined(entity.classname)) {
            if (entity.classname == "worldSpawn") {
                return false;
            } else if (entity.classname == "script_vehicle" && entity.targetname != "veh_jup_nuclear_locomotive") {
                return true;
            } else if (entity.classname == "misc_turret") {
                return true;
            } else if (issubstr(entity.classname, "scriptable_")) {
                return true;
            } else if (entity.classname == "script_model") {
                return true;
            }
        }
    }
    return false;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8074
// Size: 0x169
function monitorplayerimpact() {
    monitorplayerimpactend();
    self endon("death");
    self endon("monitorPlayerImpactEnd");
    pushent = self;
    if (isdefined(self.mountmantlemodel)) {
        pushent = self.mountmantlemodel;
    }
    damageent = undefined;
    if (isdefined(self.owner)) {
        damageent = self.owner;
    }
    while (isdefined(pushent)) {
        player, linearvelocity = pushent waittill("player_pushed");
        if (isdefined(player) && (isplayer(player) || isagent(player)) && player scripts\cp_mp\utility\player_utility::_isalive()) {
            isfalling = linearvelocity[2] <= -8;
            var_2da284613791696f = 0;
            playerposition = undefined;
            if (player tagexists("j_mainroot")) {
                playerposition = player gettagorigin("j_mainroot");
                leveldata = getleveldata(self.cratetype);
                midpoint = self.origin + anglestoup(self.angles) * leveldata.halfheight;
                var_2da284613791696f = playerposition[2] <= midpoint[2];
            }
            if (isfalling && var_2da284613791696f) {
                eattacker = damageent;
                if (!isdefined(eattacker)) {
                    eattacker = player;
                }
            }
        }
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81e5
// Size: 0xa
function monitorplayerimpactend() {
    self notify("monitorPlayerImpactEnd");
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81f7
// Size: 0xcd
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82cc
// Size: 0x191
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
            thread scripts\cp_mp\utility\debug_utility::drawsphere(self.markerposition, 128, 30, (1, 0, 0));
        #/
    }
    self.dangerzoneid = dangerzoneid;
    return dangerzoneid;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8466
// Size: 0x7f
function spawnuniversaldangerzone(position, radius, height, timeout) {
    if (issharedfuncdefined("spawn", "addSpawnDangerZone")) {
        dangerzoneid = [[ getsharedfunc("spawn", "addSpawnDangerZone") ]](position, radius, height, undefined, timeout, level.players[randomint(level.players.size)], 1);
        self.dangerzoneid = dangerzoneid;
        return dangerzoneid;
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84ed
// Size: 0x77
function destroydangerzone() {
    if (issharedfuncdefined("spawn", "isSpawnDangerZoneAlive") && issharedfuncdefined("spawn", "removeSpawnDangerZone")) {
        dangerzoneid = self.dangerzoneid;
        if (isdefined(dangerzoneid) && [[ getsharedfunc("spawn", "isSpawnDangerZoneAlive") ]](dangerzoneid)) {
            [[ getsharedfunc("spawn", "removeSpawnDangerZone") ]](dangerzoneid);
        }
        self.dangerzoneid = undefined;
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x856c
// Size: 0x9c
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8611
// Size: 0x47
function _watchnavobstacle(id, origin, updatedistsqr) {
    self endon("death");
    while (distancesquared(origin, self.origin) < updatedistsqr) {
        wait 0.5;
    }
    thread _createnavobstacle();
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8660
// Size: 0x30
function _destroynavobstacle() {
    self notify("createNavObstacle");
    if (isdefined(self.navobstacleid)) {
        destroynavobstacle(self.navobstacleid);
    }
    self.navobstacleid = undefined;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8698
// Size: 0x123
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
        return true;
    }
    return false;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87c4
// Size: 0x28
function destroymountmantlemodel() {
    if (isdefined(self.mountmantlemodel)) {
        self.mountmantlemodel delete();
    }
    self.mountmantlemodel = undefined;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87f4
// Size: 0x107
function crateunresolvedcollisioncallback(hitent, penetration) {
    assertex(isdefined(level.cratedata), "crateUnresolvedCollisionCallback() called before initCrateData().");
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
    if (isplayer(hitent) && hitent scripts\cp_mp\utility\player_utility::_isalive()) {
        if (issharedfuncdefined("airdrop", "unresolvedCollisionNearestNode")) {
            [[ getsharedfunc("airdrop", "unresolvedCollisionNearestNode") ]](hitent, undefined, self);
        }
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8903
// Size: 0x1d3
function _createheadicon() {
    if (istrue(self.disallowheadiconid)) {
        return;
    }
    scripts\cp_mp\entityheadicons::setheadicon_deleteicon(self.headiconid);
    leveldata = getleveldata(self.cratetype);
    headiconid = undefined;
    if (isdefined(self.headicon)) {
        headiconoffset = function_c857ac89588adf6f();
        if (level.teambased && isdefined(self.team)) {
            if (!scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924()) {
                headiconid = scripts\cp_mp\entityheadicons::setheadicon_singleimage(self.team, self.headicon, headiconoffset, 1, leveldata.headicondrawrange, leveldata.headiconnaturalrange, undefined, 1);
            }
            if (isdefined(headiconid)) {
                if (issharedfuncdefined("game", "isMLGMatch")) {
                    if ([[ getsharedfunc("game", "isMLGMatch") ]]()) {
                        addteamtoheadiconmask(headiconid, "spectator");
                    }
                }
            }
        } else if (isdefined(self.owner)) {
            if (!scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924()) {
                headiconid = scripts\cp_mp\entityheadicons::setheadicon_singleimage(self.owner, self.headicon, headiconoffset, 1, leveldata.headicondrawrange, leveldata.headiconnaturalrange, undefined, 1);
            }
            if (isdefined(headiconid)) {
                if (issharedfuncdefined("game", "isMLGMatch")) {
                    if ([[ getsharedfunc("game", "isMLGMatch") ]]()) {
                        addteamtoheadiconmask(headiconid, "spectator");
                    }
                }
            }
        } else if (!scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924()) {
            headiconid = scripts\cp_mp\entityheadicons::setheadicon_singleimage(level.teamnamelist, self.headicon, headiconoffset, 1, leveldata.headicondrawrange, leveldata.headiconnaturalrange);
        }
    }
    self.headiconid = headiconid;
    self.headiconactive = 1;
    return headiconid;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8adf
// Size: 0x27
function _destroyheadicon() {
    scripts\cp_mp\entityheadicons::setheadicon_deleteicon(self.headiconid);
    self.headiconid = undefined;
    self.headiconactive = 0;
    waitframe();
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b0e
// Size: 0x6e
function function_3a065ce769b6ce3d() {
    if (isdefined(self.scriptedobjid)) {
        objective_delete(self.scriptedobjid);
        scripts\mp\objidpoolmanager::returnobjectiveid(self.scriptedobjid);
        self.scriptedobjid = undefined;
        return;
    }
    if (self isscriptable() && self getscriptablehaspart("objective")) {
        self setscriptablepartstate("objective", "inactive");
        self.objectivevisible = undefined;
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b84
// Size: 0x108
function createminimapicon() {
    destroyminimapicon();
    leveldata = getleveldata(self.cratetype);
    minimapid = undefined;
    if (isdefined(self.minimapicon) && !istrue(self.visibilitymanuallycontrolled)) {
        createfunc = undefined;
        if (scripts\engine\utility::issharedfuncdefined("game", "createObjective")) {
            createfunc = scripts\engine\utility::getsharedfunc("game", "createObjective");
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
    scripts\mp\objidpoolmanager::function_79a1a16de6b22b2d(minimapid, 24);
    self.minimapid = minimapid;
    self.minimapiconactive = 1;
    return minimapid;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c95
// Size: 0x52
function destroyminimapicon() {
    if (isdefined(self.minimapid)) {
        if (scripts\engine\utility::issharedfuncdefined("game", "returnObjectiveID")) {
            [[ scripts\engine\utility::getsharedfunc("game", "returnObjectiveID") ]](self.minimapid);
        }
    }
    self.minimapid = undefined;
    self.minimapiconactive = 0;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8cef
// Size: 0x67
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d5e
// Size: 0x36
function addtolists() {
    assertex(isdefined(level.cratedata), "addToLists() called before initCrateData().");
    level.cratedata.crates[self getentitynumber()] = self;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d9c
// Size: 0x2e
function removefromlists(id) {
    if (!isdefined(level.cratedata)) {
        return;
    }
    level.cratedata.crates[id] = undefined;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8dd2
// Size: 0x175
function getrandomkeyfromweightsarray(arr, exclusionlist) {
    if (isdefined(exclusionlist)) {
        if (!isarray(exclusionlist)) {
            exclusionlist = [exclusionlist];
        }
    }
    arrkeys = [];
    var_6fb7daf6138d07d0 = [];
    maxval = 0;
    foreach (key, weight in arr) {
        if (weight > 0) {
            isexcluded = 0;
            if (isdefined(exclusionlist)) {
                if (exclusionlist.size > 0) {
                    foreach (id, excludedkey in exclusionlist) {
                        if (excludedkey == key) {
                            exclusionlist[id] = undefined;
                            isexcluded = 1;
                            break;
                        }
                    }
                } else {
                    exclusionlist = undefined;
                }
            }
            if (!isexcluded) {
                maxval += weight;
                arrkeys[arrkeys.size] = key;
                var_6fb7daf6138d07d0[var_6fb7daf6138d07d0.size] = maxval;
            }
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f50
// Size: 0x7
function getdefaultcapturevisualscallback() {
    return &defaultcapturevisualscallback;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f60
// Size: 0x13
function getdefaultcapturevisualsdeletiondelay() {
    return getanimlength(script_model%mp_military_carepackage_straps_falling) + 1;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f7c
// Size: 0x109
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
    model scripts\common\anim::setanimtree();
    model thread scripts\common\anim::anim_single_solo(model, "care_package_capture");
    model setscriptablepartstate(#"capture", #"start", 0);
    if (isdefined(animtime)) {
        scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(animtime);
    }
    cratetype = model.cratetype;
    capturestate = #"fade";
    if (istrue(self.inwater)) {
        capturestate = #"fade_water";
    }
    model setscriptablepartstate(#"capture", capturestate, 0);
    model setscriptablepartstate(#"visibility", #"hide", 0);
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x908d
// Size: 0x3
function getdefaultdestroyvisualsdeletiondelay() {
    return false;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9099
// Size: 0x7
function getdefaultdestroyvisualscallback() {
    return &defaultdestroyvisualscallback;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90a9
// Size: 0xb
function defaultdestroyvisualscallback(model) {
    
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90bc
// Size: 0x15
function getdefaultmountmantlemodel() {
    return level.cratedata.mountmantlemodel;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90da
// Size: 0x25
function getnumdroppedcrates() {
    if (!isdefined(level.cratedata)) {
        return 0;
    }
    return level.cratedata.crates.size;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9108
// Size: 0x34
function function_58f652f9f3a0775() {
    if (issharedfuncdefined("damage", "_suicide")) {
        self thread [[ getsharedfunc("damage", "_suicide") ]]();
        return;
    }
    self suicide();
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9144
// Size: 0x224
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
        return;
    }
    if (gettime() >= self.entmantlingendtime) {
        self.entmantling = undefined;
        self.entmantlingcrate = undefined;
        self.entmantlingendtime = undefined;
        return;
    }
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
                continue;
            }
            if (self istouching(crate) || isdefined(crate.mountmantlemodel) && self istouching(crate.mountmantlemodel)) {
                self.entmantling = undefined;
                self.entmantlingcrate = undefined;
                self.entmantlingendtime = undefined;
                function_58f652f9f3a0775();
                return;
            }
        }
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9370
// Size: 0x1f2
function function_b6469ac2ab6f3dc6() {
    entmask = function_869ccb4e3451b8c6(["etype_player"]);
    radius = getdvarint(@"hash_e9b16488fdec1843", 100);
    while (true) {
        foreach (crate in level.cratedata.crates) {
            if (!isdefined(crate) || !istrue(crate.physicsactivated) || istrue(crate.physicssettled)) {
                continue;
            }
            nearplayers = function_b1eef70090b5b7b5(crate.origin, radius, entmask);
            foreach (p in nearplayers) {
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
                        continue;
                    }
                    if (p istouching(crate) || isdefined(crate.mountmantlemodel) && p istouching(crate.mountmantlemodel)) {
                        p function_58f652f9f3a0775();
                    }
                }
            }
        }
        waitframe();
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x956a
// Size: 0xe2
function overridecapturestring(stringoverride) {
    assertex(isdefined(stringoverride), "overrideCrateCaptureString() requires a stringOverride.");
    if (isdefined(self.capturestring) && self.capturestring == stringoverride) {
        return;
    }
    self.capturestring = stringoverride;
    triggerobjects = [self];
    if (isdefined(self.useobject)) {
        triggerobjects[triggerobjects.size] = self.useobject;
    }
    foreach (triggerobject in triggerobjects) {
        if (!self.supportsreroll || triggerobject.usetype == 2) {
            triggerobject sethintstring(self.capturestring);
        }
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9654
// Size: 0xe1
function overridererollstring(stringoverride) {
    assertex(isdefined(stringoverride), "overrideCrateRerollString() requires a stringOverride.");
    if (isdefined(self.rerollstring) && self.rerollstring == stringoverride) {
        return;
    }
    self.rerollstring = stringoverride;
    triggerobjects = [self];
    if (isdefined(self.useobject)) {
        triggerobjects[triggerobjects.size] = self.useobject;
    }
    foreach (triggerobject in triggerobjects) {
        if (self.supportsreroll && triggerobject.usetype == 1) {
            triggerobject sethintstring(self.rerollstring);
        }
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x973d
// Size: 0x99
function overrideheadicon(iconoverride) {
    if (!isdefined(self.headicon) && !isdefined(iconoverride)) {
        return;
    }
    if (isdefined(self.headicon) && isdefined(iconoverride) && self.headicon == iconoverride) {
        return;
    }
    if (!isdefined(iconoverride)) {
        self.headicon = undefined;
        _destroyheadicon();
        return;
    }
    self.headicon = iconoverride;
    if (self.headiconactive) {
        if (isdefined(self.headiconid)) {
            setheadiconimage(self.headiconid, iconoverride);
            return;
        }
        _createheadicon();
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x97de
// Size: 0x9a
function overrideminimapicon(iconoverride) {
    if (!isdefined(self.minimapicon) && !isdefined(iconoverride)) {
        return;
    }
    if (isdefined(self.minimapicon) && isdefined(iconoverride) && self.minimapicon == iconoverride) {
        return;
    }
    if (!isdefined(iconoverride)) {
        self.minimapicon = undefined;
        destroyminimapicon();
        return;
    }
    self.minimapicon = iconoverride;
    if (self.minimapiconactive) {
        if (isdefined(self.minimapid)) {
            scripts\mp\objidpoolmanager::update_objective_icon(self.minimapid, iconoverride);
            return;
        }
        createminimapicon();
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9880
// Size: 0xd2
function overridesupportsreroll(booloverride) {
    assertex(isdefined(booloverride), "overrideSupportsReroll() requires a boolOverride.");
    if (self.supportsreroll == booloverride) {
        return;
    }
    self.supportsreroll = booloverride;
    if (self.supportsreroll) {
        triggerobjects = [self];
        if (isdefined(self.useobject)) {
            triggerobjects[triggerobjects.size] = self.useobject;
        }
        foreach (triggerobject in triggerobjects) {
            if (triggerobject.usetype == 1) {
                triggerobject sethintstring(self.rerollstring);
            }
        }
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x995a
// Size: 0x2f0
function initkillstreakcratedata() {
    level.cratedata.ksweights = [];
    level.cratedata.kscapturestrings = [];
    level.cratedata.ksrerollstrings = [];
    activatecallback = &killstreakcrateactivatecallback;
    capturecallback = &killstreakcratecapturecallback;
    leveldata = getleveldata("killstreak");
    leveldata.activatecallback = activatecallback;
    leveldata.capturecallback = capturecallback;
    if (scripts\cp_mp\utility\game_utility::function_2d79a7a3b91c4c3e()) {
        leveldata.capturestring = %MP/BR_CRATE_LOADOUT;
    }
    leveldata = getleveldata("killstreak_no_owner");
    leveldata.activatecallback = activatecallback;
    leveldata.capturecallback = capturecallback;
    leveldata.supportsownercapture = 0;
    bundle = level.streakglobals.streakbundles["airdrop"];
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
        return;
    }
    foreach (crateentry in bundle.crateentries) {
        if (isdefined(crateentry.name) && isdefined(crateentry.weight)) {
            addkillstreakcratedata(crateentry.name, undefined, undefined, crateentry.weight);
        }
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c52
// Size: 0x235
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
    if (scripts\cp_mp\utility\game_utility::isinfectedgametype()) {
        leveldata.isteamonlycrate = 1;
        return;
    }
    addkillstreakcratedata("scrambler_drone_guard", undefined, undefined, 300);
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e8f
// Size: 0x82
function addkillstreakcratedata(streakname, capturestring, rerollstring, weight) {
    if (!isdefined(level.streakglobals.streakbundles[streakname])) {
        return;
    }
    level.cratedata.kscapturestrings[streakname] = capturestring;
    level.cratedata.ksrerollstrings[streakname] = rerollstring;
    level.cratedata.ksweights[streakname] = weight;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f19
// Size: 0x3e
function getkillstreakcratedatabystreakname(streakname, supportsreroll) {
    data = spawnstruct();
    data.streakname = streakname;
    data.supportsreroll = supportsreroll;
    return data;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f60
// Size: 0x86
function overridekillstreakcrateweight(streakname, weightoverride) {
    assertex(isdefined(level.cratedata), "overrideKillstreakCrateWeight() called before initCrateData().");
    assertex(isdefined(level.cratedata.ksweights), "overrideKillstreakCrateWeight() called before initKillstreakCrateData().");
    assertex(isdefined(level.cratedata.ksweights), "overrideKillstreakCrateWeight() called with an invalid streakName.");
    level.cratedata.ksweights[streakname] = weightoverride;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9fee
// Size: 0xb0
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa0a6
// Size: 0x1db
function killstreakcratecapturecallback(player) {
    streakname = self.data.streakname;
    useimmediate = 0;
    var_63bb25760a7f230d = 0;
    switch (streakname) {
    case #"hash_cd0a0403551fc411": 
        var_63bb25760a7f230d = 1;
    case #"hash_4ad475e6e15635bd": 
        if (!istrue(player.isjuggernaut)) {
            useimmediate = 1;
            if (issharedfuncdefined("airdrop", "applyImmediateJuggernaut")) {
                player [[ getsharedfunc("airdrop", "applyImmediateJuggernaut") ]](useimmediate, var_63bb25760a7f230d);
            } else if (istrue(var_63bb25760a7f230d)) {
                player namespace_f65b8b60ef677e44::function_b960491329678b4(useimmediate);
            } else {
                player scripts\cp_mp\killstreaks\juggernaut::tryusejuggernaut(useimmediate);
            }
        }
        break;
    }
    if (!istrue(useimmediate)) {
        if (issharedfuncdefined("airdrop", "awardKillstreak")) {
            player thread [[ getsharedfunc("airdrop", "awardKillstreak") ]](streakname, self.owner, self);
        }
        if (issharedfuncdefined("airdrop", "showKillstreakSplash")) {
            player [[ getsharedfunc("airdrop", "showKillstreakSplash") ]](streakname, undefined, 1);
        }
    }
    if (isdefined(self.owner) && player == self.owner) {
        return;
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
        }
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa289
// Size: 0x6b
function getrandomkillstreak(var_52a8c1bddbf44d11) {
    assertex(isdefined(level.cratedata), "getRandomKillstreak() called before initCrateData().");
    assertex(isdefined(level.cratedata.ksweights), "getRandomKillstreak() called before initKillstreakCrateData().");
    streakname = getrandomkeyfromweightsarray(level.cratedata.ksweights, var_52a8c1bddbf44d11);
    return streakname;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xa2fd
// Size: 0xcb
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xa3d1
// Size: 0xd7
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4b1
// Size: 0x12d
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa5e7
// Size: 0xba
function airdrop_playdeploydialog(streakinfo) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (level.gametype == "grnd" || scripts\cp_mp\utility\game_utility::isinfectedgametype()) {
        return;
    }
    var_52a5be2e2f91d710 = undefined;
    if (issharedfuncdefined("sound", "playKillstreakDeployDialog")) {
        scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(0.5);
        [[ getsharedfunc("sound", "playKillstreakDeployDialog") ]](self, streakinfo.streakname);
        var_52a5be2e2f91d710 = 3;
    }
    operatordialog = streakinfo.streakname + "_use";
    thread playkillstreakoperatordialog(streakinfo.streakname, operatordialog, 1, var_52a5be2e2f91d710);
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xa6a9
// Size: 0x111
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa7c3
// Size: 0x197
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
        var_f7d941fb76fd8044 = level.cratedropdata.escortchoppers.size;
        maxvehiclecount = 1;
    }
    var_4440147083abaf0a = 1;
    if ((var_f7d941fb76fd8044 >= maxvehiclecount || level.fauxvehiclecount >= maxvehiclecount) && droptype != "airdrop_mega") {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/MAX_AIRDROPS");
        }
        return false;
    } else if (issharedfuncdefined("killstreak", "currentActiveVehicleCount") && issharedfuncdefined("killstreak", "maxVehiclesAllowed")) {
        if ([[ getsharedfunc("killstreak", "currentActiveVehicleCount") ]]() >= [[ getsharedfunc("killstreak", "maxVehiclesAllowed") ]]() || level.fauxvehiclecount + var_4440147083abaf0a >= [[ getsharedfunc("killstreak", "maxVehiclesAllowed") ]]()) {
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/TOO_MANY_VEHICLES");
            }
            return false;
        }
    }
    return true;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa963
// Size: 0x21
function airdropmarkerswitchended(streakinfo, switchresult) {
    if (istrue(switchresult)) {
        thread airdrop_watchplayerweapon(streakinfo);
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa98c
// Size: 0x88
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaa1c
// Size: 0x105
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
        return false;
    }
    if (issharedfuncdefined("killstreak", "logKillstreakEvent")) {
        self [[ getsharedfunc("killstreak", "logKillstreakEvent") ]](streakinfo.airdroptype, self.origin);
    }
    airdropvisualmarkeractivate(marker, streakinfo.airdroptype, streakinfo);
    return true;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab2a
// Size: 0xfe
function airdropvisualmarkeractivate(marker, droptype, streakinfo) {
    fxposition = drop_to_ground(marker.location, 50, -200, (0, 0, 1));
    fxposition += (0, 0, 1);
    canister = spawn("script_model", fxposition);
    canister setmodel("offhand_wm_grenade_smoke");
    canister.angles = (0, 90, 90);
    fxent = spawn("script_model", fxposition);
    fxent setmodel("ks_crate_marker_mp");
    fxent setscriptablepartstate(#"smoke", #"on", 0);
    if (isdefined(marker.visual)) {
        marker.visual delete();
    }
    assertmsg("doFlyBy() no longer supported. See airdrop.gsc for new drop methods");
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xac30
// Size: 0x20
function tryuseairdropmarker() {
    streakinfo = createstreakinfo("airdrop", self);
    return tryuseairdropmarkerfromstruct(streakinfo);
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac59
// Size: 0x1ec
function tryuseairdropmarkerfromstruct(streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    streakinfo.deployweaponobj = makeweapon("deploy_airdrop_mp");
    sticky = getdvarint(@"hash_b2e9bf0017ceeeae", 0);
    if (sticky) {
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
        if (!scripts\cp_mp\vehicles\vehicle_tracking::reservevehicle()) {
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/AIR_SPACE_TOO_CROWDED");
            }
            return false;
        }
    }
    if (!tryairdroptriggered(streakinfo)) {
        if (var_2472cbe64ade0c46) {
            scripts\cp_mp\vehicles\vehicle_tracking::clearvehiclereservation();
        }
        return false;
    }
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            if (var_2472cbe64ade0c46) {
                scripts\cp_mp\vehicles\vehicle_tracking::clearvehiclereservation();
            }
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/AIR_SPACE_TOO_CROWDED");
            }
            return false;
        }
    }
    if (isdefined(level.var_27f78817b59dfe32)) {
        streakinfo.var_fb58a31c756db4cc = level.var_27f78817b59dfe32;
    }
    deployresult = scripts\cp_mp\killstreaks\killstreakdeploy::streakdeploy_doweaponfireddeploy(streakinfo, streakinfo.deployweaponobj, "grenade_fire", undefined, &airdropmarkerswitchended, &airdropmarkerfired, undefined, &airdropmarkertaken);
    if (!istrue(deployresult)) {
        if (var_2472cbe64ade0c46) {
            scripts\cp_mp\vehicles\vehicle_tracking::clearvehiclereservation();
        }
        return false;
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            return false;
        }
    }
    return true;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xae4e
// Size: 0xae
function function_f66b707d0894b6de(streakinfo) {
    self endon("death_or_disconnect");
    self endon("giveAndFireOffhandReliableFailed");
    level endon("game_ended");
    deployweaponobj = streakinfo.deployweaponobj;
    while (true) {
        grenade = self waittill("grenade_thrown");
        if (isdefined(deployweaponobj.basename) && isdefined(grenade.weapon_name) && deployweaponobj.basename == grenade.weapon_name) {
            airdropmarkerfired(streakinfo, deployweaponobj, grenade, 1);
            break;
        }
        /#
            iprintln("<dev string:xe2>");
        #/
        break;
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf04
// Size: 0xf9
function airdropmarkerfired(streakinfo, weaponobj, projectile, var_4b0c1a8c50d15340) {
    streakinfo.airdroptype = streakinfo.streakname;
    if (issharedfuncdefined("killstreak", "incrementFauxVehicleCount")) {
        [[ getsharedfunc("killstreak", "incrementFauxVehicleCount") ]]();
    }
    projectile.owner = self;
    assertex(isdefined(streakinfo.airdroptype), "airDropMarkerFired() was passed a streakInfo that didn't go through tryAirdropTriggered()");
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb006
// Size: 0x49a
function airdropmarkeractivate(droptype, lifeid, streakinfo, var_4b0c1a8c50d15340) {
    level endon("game_ended");
    var_811f337efd111e98 = self.owner.angles;
    position = self waittill("explode");
    if (istrue(var_4b0c1a8c50d15340)) {
        level callback::callback("killstreak_finish_use", {#streakinfo:streakinfo});
    }
    owner = self.owner;
    if (!isdefined(owner)) {
        if (issharedfuncdefined("vehicle", "decrementFauxVehicleCount")) {
            [[ getsharedfunc("vehicle", "decrementFauxVehicleCount") ]]();
        }
        scripts\cp_mp\vehicles\vehicle_tracking::clearvehiclereservation();
        return;
    }
    waitframe();
    var_fda870b32ab92c1f = var_811f337efd111e98 + (0, 180, 0);
    targetpos = position;
    targetheightoffset = getscriptedhelidropheight(droptype);
    ownerforward = anglestoforward(owner.angles);
    ownerright = anglestoright(owner.angles);
    contents = scripts\engine\trace::create_default_contents(1);
    var_f74f18c717b149e2 = [targetpos - ownerforward * 100, targetpos + ownerforward * 100, targetpos + ownerright * 100, targetpos - ownerright * 100, targetpos + (ownerforward + ownerright) * 100, targetpos + (ownerforward - ownerright) * 100, targetpos + (ownerright - ownerforward) * 100, targetpos + (-1 * ownerforward - ownerright) * 100];
    foreach (dirpos in var_f74f18c717b149e2) {
        var_7a7426e42e674e40 = vectornormalize(dirpos - targetpos);
        var_c45bbeb56df09b5d = targetpos * (1, 1, 0) + (0, 0, targetheightoffset);
        var_32a961dac02545b0 = var_c45bbeb56df09b5d - var_7a7426e42e674e40 * 25000;
        var_19189fd85d8a2c19 = var_c45bbeb56df09b5d + var_7a7426e42e674e40 * 25000;
        traceresult = scripts\engine\trace::ray_trace_passed(var_32a961dac02545b0, var_19189fd85d8a2c19, undefined, contents);
        if (!istrue(traceresult)) {
            continue;
        }
        var_fda870b32ab92c1f = vectortoangles(var_7a7426e42e674e40);
        /#
            level thread scripts\cp_mp\utility\debug_utility::drawline(var_32a961dac02545b0, var_19189fd85d8a2c19, 30, (1, 1, 0));
        #/
        break;
    }
    /#
        if (droptype == "<dev string:x10e>") {
            crateoverride = getdvar(@"hash_c247993ede3808ca");
            if (crateoverride != "<dev string:x1c>") {
                if (issharedfuncdefined("<dev string:x116>", "<dev string:x11e>")) {
                    [[ getsharedfunc("<dev string:x116>", "<dev string:x11e>") ]]();
                }
                dropkillstreakcratefromscriptedheli(owner, owner.team, crateoverride, position, var_fda870b32ab92c1f, position, 1, streakinfo);
                return;
            }
        }
    #/
    if (issharedfuncdefined("vehicle", "decrementFauxVehicleCount")) {
        [[ getsharedfunc("vehicle", "decrementFauxVehicleCount") ]]();
    }
    dropresult = undefined;
    if (droptype == "airdrop") {
        dropresult = dropkillstreakcratefromscriptedheli(owner, owner.team, undefined, position, var_fda870b32ab92c1f, position, 1, streakinfo);
    } else if (droptype == "airdrop_multiple") {
        if (issharedfuncdefined("airdrop", "airdropMultipleDropCrates")) {
            dropresult = [[ getsharedfunc("airdrop", "airdropMultipleDropCrates") ]](owner, owner.team, position, var_fda870b32ab92c1f, position, 1, streakinfo);
        }
    } else if (droptype == "airdrop_escort") {
    } else if (droptype == "loadout_drop") {
        dropresult = function_63e71231fbc15aa9(owner, owner.team, droptype, position, var_fda870b32ab92c1f, position, 1, streakinfo);
    }
    if (isdefined(owner)) {
        if (!isdefined(dropresult)) {
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
        owner scripts\cp_mp\utility\killstreak_utility::recordkillstreakendstats(streakinfo);
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb4a8
// Size: 0xbd
function function_206d83d7637be6a7(position, owner) {
    if (level.teambased) {
        var_13ba232eee7e6069 = spawnscriptable("airdrop_marker", position, (0, 0, 1));
        var_13ba232eee7e6069 setscriptablepartstate("smokeSignal", "active");
        var_13ba232eee7e6069 function_fca5bdbe24070d20("smokeSignal", owner.team);
        return;
    }
    payload = [#"teamselect", owner getentitynumber()];
    var_13ba232eee7e6069 = spawnscriptable("airdrop_marker", position, (0, 0, 1), undefined, payload);
    var_13ba232eee7e6069 setscriptablepartstate("smokeSignal", "activeFFA");
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb56d
// Size: 0x77
function airdropmarkertaken(streakinfo) {
    if (istrue(streakinfo.airdropmarkerfired)) {
        level callback::callback("killstreak_finish_use", {#streakinfo:streakinfo});
    }
    if (isdefined(streakinfo.airdroptype) && !istrue(streakinfo.airdropmarkerfired)) {
        if (issharedfuncdefined("vehicle", "decrementFauxVehicleCount")) {
            [[ getsharedfunc("vehicle", "decrementFauxVehicleCount") ]]();
        }
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb5ec
// Size: 0x8a
function initbattleroyalecratedata() {
    leveldata = getleveldata("battle_royale");
    leveldata.capturestring = %MP/BR_CRATE;
    leveldata.supportsownercapture = 0;
    leveldata.headicon = undefined;
    leveldata.usepriority = -1;
    leveldata.usefov = 180;
    leveldata.timeout = undefined;
    leveldata.activatecallback = &brcrateactivatecallback;
    leveldata.capturecallback = &brcratecapturecallback;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb67e
// Size: 0x29
function getbrcratedatabytype(type) {
    data = spawnstruct();
    data.type = type;
    return data;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb6b0
// Size: 0x37
function brcrateactivatecallback(isfirstactivation) {
    if (istrue(isfirstactivation)) {
        if (issharedfuncdefined("airdrop", "registerCrateForCleanup")) {
            [[ getsharedfunc("airdrop", "registerCrateForCleanup") ]](self);
        }
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb6ef
// Size: 0x33
function brcratecapturecallback(player) {
    if (issharedfuncdefined("airdrop", "makeItemsFromCrate")) {
        self [[ getsharedfunc("airdrop", "makeItemsFromCrate") ]](player);
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb72a
// Size: 0x95
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb7c8
// Size: 0x84
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb855
// Size: 0x11e
function initbattleroyaleloadoutcratedata() {
    leveldata = getleveldata("battle_royale_loadout");
    leveldata.capturestring = %MP/BR_CRATE_LOADOUT;
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
    leveldata.isdropcrate = 1;
    leveldata.var_c23ca3472233553d = 1;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb97b
// Size: 0x5e
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb9e1
// Size: 0x1c
function brloadoutcratecapturecallback(player) {
    giveweaponsfromdropbag(player);
    self notify("brLoadoutCapture", player);
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba05
// Size: 0x1e4
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
    if (istrue(self.strongholdcrate) || istrue(self.var_4cd5b8f62d173211)) {
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
    scripts\cp_mp\challenges::function_8359cadd253f9604(player, "pickup_airdrop_crate", 1);
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbbf1
// Size: 0x1c9
function function_86f1096305a8c8f9(player) {
    foreach (outlineid in self.playeroutlines) {
        if (isdefined(self.outlines) && isdefined(self.outlines[outlineid]) && isdefined(self.outlines[outlineid].playersvisibleto)) {
            if (issharedfuncdefined("outline", "outlineDisable")) {
                [[ getsharedfunc("outline", "outlineDisable") ]](outlineid, self);
            }
            self.playeroutlines = array_remove(self.playeroutlines, outlineid);
            totalteamplayers = level.teamdata[player.team]["players"];
            var_7e9c8818d60b887a = totalteamplayers;
            foreach (teammate in totalteamplayers) {
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbdc2
// Size: 0x32
function brloadoutcratedestroycallback(immediate) {
    if (issharedfuncdefined("airdrop", "brOnLoadoutCrateDestroyed")) {
        [[ getsharedfunc("airdrop", "brOnLoadoutCrateDestroyed") ]](immediate);
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbdfc
// Size: 0x32
function giveweaponsfromdropbag(player) {
    if (issharedfuncdefined("airdrop", "br_giveDropBagLoadout")) {
        [[ getsharedfunc("airdrop", "br_giveDropBagLoadout") ]](player);
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe36
// Size: 0x35
function dropbrloadoutcrate(team, position, destination) {
    return dropcrate(undefined, team, "battle_royale_loadout", position, (0, randomfloat(360), 0), destination);
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe74
// Size: 0x11e
function function_c5c61b985836f974() {
    leveldata = getleveldata("loadout_drop");
    leveldata.capturestring = %MP/BR_CRATE_LOADOUT;
    leveldata.basemodel = "military_carepackage_01_loadout_mp";
    leveldata.supportsownercapture = 1;
    leveldata.headicon = "hud_icon_minimap_fieldupgrade_loadout_drop";
    leveldata.minimapicon = "hud_icon_minimap_fieldupgrade_loadout_drop";
    leveldata.usepriority = -1;
    leveldata.usefov = 360;
    leveldata.timeout = 60;
    leveldata.friendlyuseonly = 1;
    leveldata.maxusage = 5;
    leveldata.ownerusetime = 0.5;
    leveldata.otherusetime = 0.5;
    leveldata.activatecallback = &function_22501284ac235158;
    leveldata.capturecallback = &function_a5d8804d96fe6a17;
    leveldata.destroyoncapture = 0;
    leveldata.onecaptureperplayer = 1;
    leveldata.isteamonlycrate = 1;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf9a
// Size: 0x37
function function_22501284ac235158(isfirstactivation) {
    if (istrue(isfirstactivation)) {
        if (issharedfuncdefined("airdrop", "registerCrateForCleanup")) {
            [[ getsharedfunc("airdrop", "registerCrateForCleanup") ]](self);
        }
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbfd9
// Size: 0x34
function function_a5d8804d96fe6a17(player) {
    if (issharedfuncdefined("airdrop", "airdropSelectLoadout")) {
        player thread [[ getsharedfunc("airdrop", "airdropSelectLoadout") ]](self);
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc015
// Size: 0x66
function function_d854bf5a8cd7daf2(player) {
    if (!isdefined(self.numuses)) {
        self.numuses = 0;
    }
    self.numuses++;
    leveldata = getleveldata(self.cratetype);
    if (self.numuses >= leveldata.maxusage) {
        thread destroycrate();
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc083
// Size: 0xd2
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc15e
// Size: 0x149
function initbattleroyalec130airdropcratedata() {
    leveldata = getleveldata("battle_royale_c130_loot");
    if (scripts\cp_mp\utility\game_utility::function_6c1fce6f6b8779d5() == "plunder") {
        leveldata.capturestring = %MP/DMZ_LOOT_CRATE_CAPTURE;
    } else {
        leveldata.capturestring = %MP/GENERIC_LOOT_CRATE_CAPTURE;
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
    leveldata.isdropcrate = 1;
    leveldata.var_c23ca3472233553d = 1;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc2af
// Size: 0xb
function brc130airdropcrateactivatecallback(isfirstactivation) {
    
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc2c2
// Size: 0xd9
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc3a3
// Size: 0x89
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc434
// Size: 0x1c
function brc130airdropcratephysicsoncallback() {
    self setscriptablepartstate(#"crate_audio", #"detach", 0);
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc458
// Size: 0x3e4
function dropbrc130airdropcrate(dropposition, dropdestination, dropangles, var_958bbdfed6f2e9ef, var_fe41be11a71dc1b4, nodropanim, team, var_cf11cd8c8b813faf) {
    var_dd3f2e9ec30744d5 = 250;
    var_c8ec5569be94e5c8 = level.c130airdrop_heightoverride;
    releaseoffset = 1000;
    var_55917b74a3b88b89 = 10500;
    var_843ccd48992e3408 = 7500;
    var_e0570c6b08e54443 = 3000;
    releasedestination = dropdestination + (0, 0, releaseoffset);
    droplootid = "battle_royale_c130_loot";
    if (isdefined(var_958bbdfed6f2e9ef)) {
        droplootid = var_958bbdfed6f2e9ef;
    }
    if (!isdefined(nodropanim)) {
        nodropanim = 0;
    }
    crate = createcrate(undefined, team, droplootid, dropposition, (0, 0, 0), dropdestination, undefined, 0);
    if (isdefined(crate)) {
        crate.skipminimapicon = 1;
        if (!nodropanim && releasedestination[2] < dropposition[2]) {
            animid = undefined;
            var_ff42e8ba492b161a = distance(dropposition, releasedestination);
            if (var_ff42e8ba492b161a >= var_55917b74a3b88b89) {
                animid = "brc130_drop_high";
            } else if (var_ff42e8ba492b161a >= var_843ccd48992e3408) {
                animid = "brc130_drop_med";
            } else if (var_ff42e8ba492b161a >= var_e0570c6b08e54443) {
                animid = "brc130_drop_low";
            }
            if (isdefined(animid)) {
                animzoffset = 1000;
                scenenode = spawn("script_model", releasedestination + (0, 0, animzoffset));
                scenenode.angles = dropangles;
                scenenode setmodel("tag_origin");
                crate.animname = "care_package";
                crate.dropanim = level.scr_anim[crate.animname][animid];
                crate.animlength = getanimlength(crate.dropanim);
                crate scripts\common\anim::setanimtree();
                if (isdefined(team)) {
                    namespace_c5f7e08ad7ea4280::function_8ba05ef17e2b7d10(crate, team);
                }
                chute = spawn("script_model", crate.origin);
                chute.angles = crate.angles;
                chute.animname = "care_package_chute";
                chute.dropanim = level.scr_anim[chute.animname][animid];
                chute.animlength = getanimlength(chute.dropanim);
                chute setmodel("veh9_mil_lnd_parachute_carepackage_br");
                chute scripts\common\anim::setanimtree();
                scenenode thread scripts\common\anim::anim_single_solo(crate, animid);
                scenenode thread scripts\common\anim::anim_single_solo(chute, animid);
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
        crate.smokesignal = spawn("script_model", dropdestination);
        crate.smokesignal setmodel(var_946146964fc4025f);
        crate.smokesignal setscriptablepartstate(#"smoke_signal", #"on", 0);
    }
    return crate;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc845
// Size: 0x38
function watchbrc130aidropcrateanimend() {
    self endon("death");
    wait self.animlength;
    if (isdefined(self)) {
        level notify(self.cratetype + "drop_anim_completed");
        self stopanimscripted();
        cratephysicson();
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc885
// Size: 0x34
function watchbrc130airdropchuteanimend(scenenode) {
    self endon("death");
    wait self.animlength;
    if (isdefined(self)) {
        self delete();
    }
    if (isdefined(scenenode)) {
        scenenode delete();
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc8c1
// Size: 0x132
function initbattleroyalelootchoppercratedata() {
    leveldata = getleveldata("battle_royale_chopper_loot");
    if (scripts\cp_mp\utility\game_utility::function_fa7bfcc1d68b7b73()) {
        leveldata.capturestring = %MP/BR_CRATE_LOADOUT;
    } else {
        leveldata.capturestring = %MP/DMZ_PLUNDER_CRATE_CAPTURE;
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
    leveldata.isdropcrate = 1;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9fb
// Size: 0xb
function brlootchoppercrateactivatecallback(isfirstactivation) {
    
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca0e
// Size: 0xb3
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcac9
// Size: 0x63
function brlootchoppercratedestroycallback(immediate) {
    self setscriptablepartstate(#"objective_map", #"inactive", 0);
    if (isdefined(self.smokesignal)) {
        self.smokesignal setscriptablepartstate(#"smoke_signal", #"off", 0);
        self.smokesignal delete();
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb34
// Size: 0xed
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc2a
// Size: 0xb7
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xccea
// Size: 0x107
function function_ddd270c88107faf9() {
    leveldata = getleveldata("battle_royale_elite_chopper");
    leveldata.capturestring = %MP/BR_CRATE_ELITE;
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
    leveldata.isdropcrate = 1;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcdf9
// Size: 0xb
function function_bcae3fa5db092dd4(isfirstactivation) {
    
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce0c
// Size: 0x8b
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce9f
// Size: 0x63
function function_1ecb1fecb6f56ecf(immediate) {
    self setscriptablepartstate(#"objective_map", #"inactive", 0);
    if (isdefined(self.smokesignal)) {
        self.smokesignal setscriptablepartstate(#"smoke_signal", #"off", 0);
        self.smokesignal delete();
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf0a
// Size: 0xb7
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcfca
// Size: 0x123
function function_53a94fee5954af57() {
    leveldata = getleveldata("battle_royale_cash_crate");
    leveldata.capturestring = %MP/DMZ_PLUNDER_CRATE_CAPTURE;
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
    leveldata.isdropcrate = 1;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd0f5
// Size: 0x32
function function_bf892d4093c5f9d3(isfirstactivation) {
    if (issharedfuncdefined("airdrop", "registerCrateForCleanup")) {
        [[ getsharedfunc("airdrop", "registerCrateForCleanup") ]](self);
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd12f
// Size: 0x8d
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd1c4
// Size: 0x65
function function_66ee09b2e374fb6e(immediate) {
    self setscriptablepartstate("objective_map", "inactive", 0);
    self setscriptablepartstate("objective", "inactive", 0);
    if (isdefined(self.smokesignal)) {
        self.smokesignal setscriptablepartstate("smoke_signal", "off", 0);
        self.smokesignal delete();
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd231
// Size: 0xd9
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd313
// Size: 0x127
function initplundercratedata() {
    leveldata = getleveldata("esc_cache");
    leveldata.capturestring = %MP/ESC_CACHE_USE_HINT;
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd442
// Size: 0x29
function getplcratedata(contents) {
    data = spawnstruct();
    data.contents = contents;
    return data;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xd474
// Size: 0x3d
function placeplcrate(contents, position, angles) {
    crate = placecrate(undefined, undefined, "esc_cache", position, angles, getplcratedata(contents));
    return crate;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd4ba
// Size: 0x127
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd5e9
// Size: 0x68
function addarmcratedata(streakname, capturestring, defconlevel, weight) {
    level.cratedata.armdefconlevels[streakname] = defconlevel;
    level.cratedata.armweights[streakname] = weight;
    level.cratedata.armcapturestrings[streakname] = capturestring;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd659
// Size: 0x29
function getarmcratedatabystreakname(streakname) {
    data = spawnstruct();
    data.streakname = streakname;
    return data;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd68b
// Size: 0x56
function armcrateactivatecallback(isfirstactivation) {
    data = self.data;
    capturestring = level.cratedata.armcapturestrings[data.streakname];
    if (isdefined(capturestring)) {
        overridecapturestring(capturestring);
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd6e9
// Size: 0x56
function armcratecapturecallback(player) {
    if (issharedfuncdefined("killstreak", "awardKillstreak")) {
        player thread [[ getsharedfunc("killstreak", "awardKillstreak") ]](self.data.streakname, "airdrop", undefined, undefined, self.owner);
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd747
// Size: 0x7d
function getrandomarmkillstreak(team) {
    assertex(isdefined(level.cratedata), "getRandomArmKillstreak() called before initCrateData().");
    assertex(isdefined(level.cratedata.armweights), "getRandomArmKillstreak() called before initArmCrateData().");
    var_52a8c1bddbf44d11 = getarmkillsteakstoexcludebyteamdefconlevel(team);
    streakname = getrandomkeyfromweightsarray(level.cratedata.armweights, var_52a8c1bddbf44d11);
    return streakname;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd7cd
// Size: 0xd3
function getarmkillsteakstoexcludebyteamdefconlevel(team) {
    assertex(isdefined(level.cratedata.armdefconlevels), "getArmKillsteaksToExcludeByTeamDefconLevel() called before initArmCrateData().");
    assertex(isdefined(level.defconlevel), "getArmKillsteaksToExcludeByDefconLevel() called before scriptsmpgametypesarm::onStartGameType().");
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd8a9
// Size: 0xfd
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd9ae
// Size: 0x133
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdae9
// Size: 0x2a
function function_c035e11237e84114(streakname, weight) {
    level.cratedata.var_332809acea23b57[streakname] = weight;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb1b
// Size: 0x56
function function_d8a8e185cfa2de1b(isfirstactivation) {
    data = self.data;
    capturestring = level.cratedata.var_7480157ed64deda2[data.streakname];
    if (isdefined(capturestring)) {
        overridecapturestring(capturestring);
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb79
// Size: 0x6a
function function_5d1369bfc4efd8b7(team) {
    assertex(isdefined(level.cratedata), "getRandomArmKillstreak() called before initCrateData().");
    assertex(isdefined(level.cratedata.var_332809acea23b57), "getRandomArmKillstreak() called before initArmCrateData().");
    streakname = getrandomkeyfromweightsarray(level.cratedata.var_332809acea23b57);
    return streakname;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdbec
// Size: 0x29
function function_506b410ce5a55cb3(streakname) {
    data = spawnstruct();
    data.streakname = streakname;
    return data;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc1e
// Size: 0xfd
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd23
// Size: 0x13f
function initbattleroyalejuggernautcratedata() {
    leveldata = getleveldata("battle_royale_juggernaut");
    if (scripts\cp_mp\utility\game_utility::function_fa7bfcc1d68b7b73()) {
        leveldata.capturestring = %MP/BR_CRATE_LOADOUT;
    } else {
        leveldata.capturestring = %KILLSTREAKS_HINTS/JUGG_CRATE_PICKUP;
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
    leveldata.isdropcrate = 1;
    leveldata.var_c23ca3472233553d = 1;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde6a
// Size: 0x3b
function brjuggernautcrateactivatecallback(isfirstactivation) {
    scripts\cp_mp\killstreaks\juggernaut::oncrateactivated(isfirstactivation);
    if (issharedfuncdefined("br_juggernaut", "onCrateActivate")) {
        self [[ getsharedfunc("br_juggernaut", "onCrateActivate") ]](isfirstactivation);
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdead
// Size: 0x93
function brjuggernautcratecapturecallback(player) {
    self setscriptablepartstate(#"objective_map", #"inactive", 0);
    if (isdefined(self.smokesignal)) {
        self.smokesignal setscriptablepartstate(#"smoke_signal", #"off", 0);
        self.smokesignal delete();
    }
    if (issharedfuncdefined("br_juggernaut", "onCrateUse")) {
        self [[ getsharedfunc("br_juggernaut", "onCrateUse") ]](player);
    }
    scripts\cp_mp\killstreaks\juggernaut::oncratecaptured(player);
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf48
// Size: 0x83
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdfd3
// Size: 0x2d
function brjuggernautcratephysicsoncallback(position, destination) {
    self setscriptablepartstate(#"crate_audio", #"detach", 0);
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe008
// Size: 0x4f
function dropjuggernautcrate(team, position, destination) {
    streakinfo = createstreakinfo("juggernaut", self);
    return dropcrate(undefined, team, "battle_royale_juggernaut", position, (0, randomfloat(360), 0), destination, streakinfo, 1);
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe060
// Size: 0xd8
function spawnjuggernautcrateatposition(pos, var_e648e96614161011) {
    crate = scripts\cp_mp\killstreaks\airdrop::dropjuggernautcrate(self.team, pos + (0, 0, 4096), pos + (0, 0, 512));
    assert(isdefined(crate));
    crate endon("death");
    enablejuggernautcrateobjective(crate);
    choosejuggernautcratemodel(crate);
    voplayers = [];
    foreach (teammate in level.teamdata[self.team]["alivePlayers"]) {
    }
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe140
// Size: 0x2c
function enablejuggernautcrateobjective(crate) {
    crate setotherent(self);
    crate setscriptablepartstate(#"objective_map", #"jugg_world");
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe174
// Size: 0x2c
function choosejuggernautcratemodel(crate) {
    crate setotherent(self);
    crate setscriptablepartstate(#"model", #"choose");
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe1a8
// Size: 0x88
function juggcanusecrate(cratetype) {
    canusecrate = 1;
    switch (cratetype) {
    case #"hash_b597e9a707180461":
    case #"hash_d8d9a61afc7a655b": 
        canusecrate = 0;
        break;
    case #"hash_d87004954b36d6e1": 
        if (issharedfuncdefined("juggernaut", "canUseWeaponPickups")) {
            canUseWeaponPickups = self [[ getsharedfunc("juggernaut", "canUseWeaponPickups") ]]();
            if (!istrue(canUseWeaponPickups)) {
                canusecrate = 0;
            }
        }
        break;
    }
    return canusecrate;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe239
// Size: 0x1c
function function_3c4492046080faa9() {
    return ter_op(istrue(self.inwater), 50, 5);
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe25e
// Size: 0x1c
function function_f7e3f128296ac3b6() {
    return ter_op(istrue(self.inwater), 5, 1);
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe283
// Size: 0x16
function function_d4833b6c916db9c6() {
    return ter_op(istrue(self.inwater), 3, 6);
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe2a2
// Size: 0x39
function private function_c857ac89588adf6f() {
    leveldata = getleveldata(self.cratetype);
    return ter_op(istrue(self.inwater), 5, leveldata.headiconoffset);
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe2e4
// Size: 0x79
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

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe365
// Size: 0xd3
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
    leveldata.capturestring = %MP/GENERIC_LOOT_CRATE_CAPTURE;
    leveldata.capturecallback = &function_e7051a617b94015;
    leveldata.destroyoncapture = 1;
    leveldata.var_c23ca3472233553d = 1;
}

// Namespace airdrop / scripts\cp_mp\killstreaks\airdrop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe440
// Size: 0x33
function function_e7051a617b94015(player) {
    if (issharedfuncdefined("br_legendary_supply_drop", "legendary_supply_onCrateUse")) {
        self [[ getsharedfunc("br_legendary_supply_drop", "legendary_supply_onCrateUse") ]](player);
    }
}

