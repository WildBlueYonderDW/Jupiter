// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_4c770a9a4ad7659c;
#using script_3db04fd1b466bdba;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_13865ca76df87ea;
#using script_5323b44ee395058;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\cp_mp\vehicles\vehicle_mines.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\cp_mp\utility\vehicle_omnvar_utility.gsc;
#using scripts\mp\movers.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\mp\spawnlogic.gsc;
#using script_736dec95a49487a6;
#using scripts\cp_mp\hostmigration.gsc;
#using script_371b4c2ab5861e62;
#using scripts\cp_mp\killstreaks\sentry_gun.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\utility\points.gsc;

#namespace remotetank;

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad7
// Size: 0x106
function init() {
    namespace_58a74e7d54b56e8d::registerkillstreak("pac_sentry", &tryuseremotetankfromstruct);
    namespace_3c37cb17ade254d::registersharedfunc("remoteTank", "attachXRays", &function_8cba478f80e8ac72);
    /#
        bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["_destroyed"];
        if (!isdefined(bundle)) {
            setdevdvarifuninitialized(@"hash_d429fa03fd7003ad", 60);
        } else {
            setdevdvarifuninitialized(@"hash_d429fa03fd7003ad", bundle.lifetime);
        }
        setdevdvarifuninitialized(@"hash_8e0e41d9572ba691", 0);
        setdevdvarifuninitialized(@"hash_91f047e0dec87b64", 0);
        setdevdvarifuninitialized(@"hash_fd16625ce7800c7e", 0);
        setdevdvarifuninitialized(@"hash_a6581cfd5a4bf464", 1);
        setdevdvarifuninitialized(@"hash_a5394f50be0dd2cf", 2);
    #/
    level function_d029f84fc08948be();
    level function_6866db861ac3911c();
    level function_1cf50b689d874cab();
    level function_67b3c8209aee7fd0();
    level function_67f9bf209b3afb75();
    level function_e46c604fe3e0c63a();
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe4
// Size: 0x457
function function_d029f84fc08948be() {
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["pac_sentry"];
    level.tanksettings = [];
    level.tanksettings["remote_tank"] = spawnstruct();
    if (isdefined(bundle)) {
        level.tanksettings["remote_tank"].timeout = bundle.lifetime;
        level.tanksettings["remote_tank"].maxhealth = bundle.maxhealth;
    } else {
        level.tanksettings["remote_tank"].timeout = 60;
        level.tanksettings["remote_tank"].maxhealth = 3000;
    }
    level.tanksettings["remote_tank"].hitstokill = 10;
    level.tanksettings["remote_tank"].streakname = "pac_sentry";
    level.tanksettings["remote_tank"].modelbase = "veh9_mil_lnd_whotel_v2_composite_mp";
    level.tanksettings["remote_tank"].bodymodel = "veh9_mil_lnd_whotel_v2_body_mp";
    level.tanksettings["remote_tank"].turretmodel = "veh9_mil_lnd_whotel_v2_turret_mp";
    level.tanksettings["remote_tank"].weaponinfo = "pac_sentry_turret_mp";
    level.tanksettings["remote_tank"].vehicleinfo = "veh_pac_sentry_amphibious_mp";
    level.tanksettings["remote_tank"].sentrymodeon = "sentry";
    level.tanksettings["remote_tank"].sentrymodeoff = "sentry_offline";
    level.tanksettings["remote_tank"].burstmin = 20;
    level.tanksettings["remote_tank"].burstmax = 120;
    level.tanksettings["remote_tank"].pausemin = 0.15;
    level.tanksettings["remote_tank"].pausemax = 0.35;
    level.tanksettings["remote_tank"].lockstrength = 6;
    level.tanksettings["remote_tank"].spinuptime = 0.65;
    level.tanksettings["remote_tank"].overheattime = 8;
    level.tanksettings["remote_tank"].cooldowntime = 0.3;
    level.tanksettings["remote_tank"].stringcannotplace = "KILLSTREAKS_HINT_CANNOT_CALL_IN";
    level.tanksettings["remote_tank"].scorepopup = "destroyed_pac_sentry";
    level.tanksettings["remote_tank"].vodestroyed = "destroyed_pac_sentry";
    level.tanksettings["remote_tank"].destroyedsplash = "callout_destroyed_pac_sentry";
    level.tanksettings["remote_tank"].premoddamagefunc = &function_944f35a106cf0b72;
    level.tanksettings["remote_tank"].postmoddamagefunc = &function_75ab8f8d5f7aff1d;
    level.tanksettings["remote_tank"].deathfunc = &function_c2a6845f0336b0f1;
    level.incomingallremotetanks = 0;
    foreach (teamname in level.teamnamelist) {
        level.incomingremotetanks[teamname] = 0;
    }
    level.remotetanks = [];
    level function_94c2e83dcb13ec31();
    registervisibilityomnvarforkillstreak("pac_sentry", "third_person_hud_on", 11);
    registervisibilityomnvarforkillstreak("pac_sentry", "first_person_hud_on", 12);
    namespace_dace9d390bc4a290::vehicle_spawn_setclearancecheckminradius("pac_sentry", 32);
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1042
// Size: 0x3
function function_6866db861ac3911c() {
    
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x104c
// Size: 0x3
function function_1cf50b689d874cab() {
    
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1056
// Size: 0x1f7
function function_94c2e83dcb13ec31() {
    minedata = namespace_739a1beacdad3457::vehicle_mines_getleveldataforvehicle("pac_sentry", 1);
    minedata.frontextents = 32;
    minedata.backextents = 32;
    minedata.leftextents = 22;
    minedata.rightextents = 22;
    minedata.bottomextents = 10;
    minedata.distancetobottom = 50;
    vehicledata = namespace_1f188a13f7e79610::function_29b4292c92443328("pac_sentry");
    vehicledata.occupancy = spawnstruct();
    vehicledata.occupancy.exitdirections = [0:"left", 1:"right", 2:"back", 3:"front"];
    vehicledata.occupancy.exitoffsets = [0:(-5, 0, 55), 1:(5, 0, 55), 2:(-35, 0, 45), 3:(29, 0, 55)];
    vehicledata.occupancy.exittopcastoffset = 45;
    vehicledata.occupancy.exitextents["left"] = 28;
    vehicledata.occupancy.exitextents["right"] = 28;
    vehicledata.occupancy.exitextents["back"] = 45;
    vehicledata.occupancy.exitextents["front"] = 45;
    vehicledata.occupancy.exitextents["top"] = 40;
    vehicledata.occupancy.exitextents["bottom"] = 0;
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1254
// Size: 0x7f
function function_67b3c8209aee7fd0() {
    game["dialog"]["pac_sentry" + "_use"] = "killstreak_remote_operator" + "_request_response";
    game["dialog"]["pac_sentry" + "_timeout"] = "killstreak_remote_operator" + "_timeout";
    game["dialog"]["pac_sentry" + "_destroyed"] = "killstreak_remote_operator" + "_crash";
    game["dialog"]["pac_sentry" + "_sentry"] = "killstreak_remote_operator" + "_confirm_sentry_mode";
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12da
// Size: 0x3
function function_67f9bf209b3afb75() {
    
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12e4
// Size: 0x3
function function_e46c604fe3e0c63a() {
    
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ee
// Size: 0xe
function weapongivenremotetank(streakinfo) {
    return 1;
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1304
// Size: 0x14
function deployweapontaken(streakinfo) {
    self notify("finished_deploy_weapon");
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x131f
// Size: 0x21
function tryuseremotetank() {
    streakinfo = createstreakinfo("pac_sentry", self);
    return tryuseremotetankfromstruct(streakinfo);
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1348
// Size: 0xdf
function tryuseremotetankfromstruct(streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    var_75d0da8e536bc6e1 = function_e6904a8315db4476(streakinfo);
    if (!istrue(var_75d0da8e536bc6e1)) {
        decrementfauxvehiclecount();
        namespace_f64231d5b7a2c3c4::clearvehiclereservation();
        streakinfo notify("killstreak_finished_with_deploy_weapon");
        return 0;
    }
    var_f79327d5641a9504 = function_8dc34405adaf04fe(streakinfo);
    level.incomingallremotetanks--;
    if (level.teambased) {
        level.incomingremotetanks[self.team]--;
    }
    if (!istrue(var_f79327d5641a9504)) {
        decrementfauxvehiclecount();
        namespace_f64231d5b7a2c3c4::clearvehiclereservation();
        streakinfo notify("killstreak_finished_with_deploy_weapon");
        return 0;
    }
    result = starttankdropoff(streakinfo);
    namespace_f64231d5b7a2c3c4::clearvehiclereservation();
    if (!istrue(result)) {
        decrementfauxvehiclecount();
        namespace_44abc05161e2e2cb::showerrormessage("KILLSTREAKS/NOT_ENOUGH_SPACE");
        streakinfo notify("killstreak_finished_with_deploy_weapon");
        return 0;
    }
    return 1;
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x142f
// Size: 0x20e
function function_e6904a8315db4476(streakinfo) {
    incrementfauxvehiclecount();
    if (!namespace_f64231d5b7a2c3c4::reservevehicle()) {
        namespace_44abc05161e2e2cb::showerrormessage("KILLSTREAKS/TOO_MANY_VEHICLES");
        return 0;
    }
    var_4440147083abaf0a = 1;
    if (currentactivevehiclecount() >= maxvehiclesallowed() || level.fauxvehiclecount + var_4440147083abaf0a >= maxvehiclesallowed()) {
        namespace_44abc05161e2e2cb::showerrormessage("KILLSTREAKS/TOO_MANY_VEHICLES");
        return 0;
    }
    level.incomingallremotetanks++;
    var_3c73b886cee8419d = 2;
    if (islargemap()) {
        var_3c73b886cee8419d = 4;
    }
    if (level.remotetanks.size >= var_3c73b886cee8419d || level.remotetanks.size + level.incomingallremotetanks > var_3c73b886cee8419d) {
        namespace_44abc05161e2e2cb::showerrormessage("KILLSTREAKS/TOO_MANY_VEHICLES");
        level.incomingallremotetanks--;
        return 0;
    }
    if (level.teambased) {
        var_deb1e3597303a7e6 = 1;
        if (islargemap()) {
            var_deb1e3597303a7e6 = 2;
        }
        level.incomingremotetanks[self.team]++;
        if (getnumactivekillstreakperteam(self.team, level.remotetanks) + level.incomingremotetanks[self.team] > var_deb1e3597303a7e6) {
            level.incomingallremotetanks--;
            level.incomingremotetanks[self.team]--;
            namespace_44abc05161e2e2cb::showerrormessage("KILLSTREAKS/MAX_FRIENDLY_WHEELSON");
            return 0;
        }
    } else if (level.remotetanks.size > 0) {
        foreach (tank in level.remotetanks) {
            if (isdefined(tank.owner) && tank.owner == self) {
                level.incomingallremotetanks--;
                namespace_44abc05161e2e2cb::showerrormessage("KILLSTREAKS/MAX_FRIENDLY_WHEELSON");
                return 0;
            }
        }
    }
    if (level.gameended) {
        return 0;
    }
    return 1;
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1645
// Size: 0x86
function function_8dc34405adaf04fe(streakinfo) {
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return 0;
        }
    }
    deployweaponobj = makeweapon("ks_remote_device_mp");
    var_9b1deb5e9d32bbe3 = namespace_b3d24e921998a8b::streakdeploy_doweapontabletdeploy(streakinfo, &weapongivenremotetank, undefined, undefined, &deployweapontaken);
    if (!istrue(var_9b1deb5e9d32bbe3)) {
        return 0;
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            return 0;
        }
    }
    return 1;
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16d3
// Size: 0x107
function starttankdropoff(streakinfo) {
    if (namespace_f8065cafc523dba5::function_f8789f15330de751(self)) {
        return 0;
    }
    position = function_8acee201d15f4c71(100);
    if (!isdefined(position)) {
        return 0;
    }
    /#
        debugspawns = getdvarint(@"hash_fd16625ce7800c7e", 0);
        if (debugspawns) {
            return 0;
        }
    #/
    _freezecontrols(1);
    val::set("tankDropOff", "fire", 0);
    tank = createtank("remote_tank", self, streakinfo, position);
    decrementfauxvehiclecount();
    if (!isdefined(tank)) {
        _freezecontrols(0);
        val::function_c9d0b43701bdba00("tankDropOff");
        return 0;
    }
    val::function_c9d0b43701bdba00("tankDropOff");
    thread function_cfd4851e4ca5b834(tank);
    playkillstreakoperatordialog("pac_sentry", "pac_sentry" + "_use", 1);
    utility::trycall(level.matchdata_logkillstreakevent, "pac_sentry", self.origin);
    thread teamplayercardsplash("used_pac_sentry", self);
    return 1;
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17e2
// Size: 0x6a8
function createtank(tanktype, owner, streakinfo, spawnloc) {
    var_a84cfd847dc1f677 = level.tanksettings[tanktype];
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["pac_sentry"];
    if (isdefined(streakinfo.mpstreaksysteminfo) && isdefined(streakinfo) && isdefined(bundle) && isdefined(streakinfo.mpstreaksysteminfo.blueprintindex)) {
        var_a84cfd847dc1f677 = function_b0f0e3d826fdb35(bundle, var_a84cfd847dc1f677, streakinfo.mpstreaksysteminfo.blueprintindex);
    }
    modelbase = var_a84cfd847dc1f677.modelbase;
    vehicletype = var_a84cfd847dc1f677.vehicleinfo;
    var_c5012e0b9ada53ca = getdvarint(@"hash_a6581cfd5a4bf464", 1);
    /#
        if (var_c5012e0b9ada53ca == 0) {
            modelbase = var_a84cfd847dc1f677.bodymodel;
            vehicletype = "fire";
        }
        var_49909f37ef778807 = getdvarint(@"hash_a5394f50be0dd2cf", 2);
        if (var_49909f37ef778807 == 1) {
            vehicletype = "semtex_xmike109_mp";
        } else if (var_49909f37ef778807 == 0) {
            vehicletype = "player_fatal_death";
        }
    #/
    angles = owner.angles;
    spawndata = spawnstruct();
    spawndata.origin = spawnloc;
    spawndata.angles = angles;
    spawndata.modelname = modelbase;
    spawndata.targetname = tanktype;
    spawndata.vehicletype = vehicletype;
    spawndata.owner = owner;
    spawndata.cannotbesuspended = 1;
    var_ee8da5624236dc89 = spawnstruct();
    remotetank = namespace_f64231d5b7a2c3c4::_spawnvehicle(spawndata, var_ee8da5624236dc89);
    if (!isdefined(remotetank)) {
        return undefined;
    }
    var_ebbe5c4d79905b3d = getdvarint(@"hash_d429fa03fd7003ad", var_a84cfd847dc1f677.timeout);
    /#
        var_2a98d1683cf44153 = getdvarint(@"hash_2c01d701bac5d9d3", 0);
        if (var_2a98d1683cf44153) {
            var_ebbe5c4d79905b3d = 9999;
        }
    #/
    remotetank.team = owner.team;
    remotetank.teamfriendlyto = owner.team;
    remotetank.owner = owner;
    remotetank.playerfriendlyto = owner;
    remotetank.streakinfo = streakinfo;
    remotetank.tanktype = tanktype;
    remotetank.config = var_a84cfd847dc1f677;
    remotetank.maxhealth = var_a84cfd847dc1f677.maxhealth;
    remotetank.health = var_a84cfd847dc1f677.maxhealth;
    remotetank.currenthealth = var_a84cfd847dc1f677.maxhealth;
    remotetank.lifetime = var_ebbe5c4d79905b3d;
    remotetank.var_d8943d63ec472996 = var_c5012e0b9ada53ca;
    remotetank setotherent(owner);
    remotetank setvehicleteam(remotetank.team);
    level thread function_ee93617532d8a679(remotetank, owner, &function_4334ace787c46d9e);
    remotetank.var_93d37decdfe9be3d = remotetank vehicle_gettopspeedforward();
    remotetank.var_9fef0f6069126b26 = remotetank vehicle_gettopspeedreverse();
    if (issharedfuncdefined("remoteTank", "attachXRays")) {
        remotetank = [[ getsharedfunc("remoteTank", "attachXRays") ]](remotetank);
    }
    killcament = spawn("script_model", remotetank gettagorigin("tag_aim"));
    killcament.angles = remotetank gettagangles("tag_aim");
    killcament linkto(remotetank, "tag_aim", (-5, 0, 0), (0, 0, 0));
    killcament setscriptmoverkillcam("turret");
    remotetank.killcament = killcament;
    remotetank namespace_6d9917c3dc05dbe9::registersentient("Killstreak_Ground", owner);
    remotetank function_de3e4e392c558d37(streakinfo.streakname);
    setlockedoncallback(remotetank, &function_7fa9ed782d7c0734);
    setlockedonremovedcallback(remotetank, &function_13a9b220f9377bba);
    remotetank vehicle_damage_setcandamage(0);
    remotetank thread function_371a76c203bdc938();
    remotetank thread function_7f192a2a47cf2a7d();
    remotetank thread function_da556e71229fa017();
    remotetank thread function_1dcee2ab6d1348c2();
    remotetank.childoutlineents = [0:remotetank];
    if (remotetank.var_d8943d63ec472996 == 0) {
        var_6ec4c83e2ded9d38 = remotetank gettagorigin("tag_turret");
        mgturret = spawnturret("misc_turret", var_6ec4c83e2ded9d38, var_a84cfd847dc1f677.weaponinfo, 0);
        mgturret linkto(remotetank, "tag_turret", (0, 0, 0), (0, 0, 0));
        mgturret setmodel(var_a84cfd847dc1f677.turretmodel);
        mgturret.owner = owner;
        mgturret.angles = remotetank.angles;
        mgturret.tank = remotetank;
        mgturret.overheated = 0;
        mgturret.streakinfo = streakinfo;
        mgturret disableplayeruseforallplayers();
        mgturret setdefaultdroppitch(0);
        mgturret setmode(var_a84cfd847dc1f677.sentrymodeoff);
        mgturret setotherent(owner);
        mgturret setturretowner(owner);
        mgturret setturretteam(owner.team);
        remotetank.mgturret = mgturret;
        remotetank.childoutlineents[remotetank.childoutlineents.size] = mgturret;
    }
    remotetank thread function_a46005e27c92c2ca();
    remotetank thread function_4048c2ca00c4690();
    remotetank thread function_cba0065c10ac9099();
    var_405425b0f7da50dc = "daytime";
    if (level.mapname == "mp_jup_grandprix_pm_2" || isnightmap()) {
        var_405425b0f7da50dc = "nighttime";
    }
    remotetank setscriptablepartstate("lights", var_405425b0f7da50dc, 0);
    namespace_d9c77dc2a6fe29c6::registerentforoob(remotetank, "killstreak");
    namespace_f64231d5b7a2c3c4::vehicle_tracking_registerinstance(remotetank, owner, owner.team);
    level.remotetanks[level.remotetanks.size] = remotetank;
    remotetank addtoactivekillstreaklist(streakinfo.streakname, "Killstreak_Ground", owner, 0, 1, 60);
    level notify("matchrecording_small_ground_vehicle", remotetank);
    return remotetank;
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e92
// Size: 0x139
function function_b0f0e3d826fdb35(bundle, var_a84cfd847dc1f677, blueprintindex) {
    var_9b32d1936831f5aa = undefined;
    if (isdefined(bundle.var_d96d3e6ceed581fd.blueprints) && bundle.var_d96d3e6ceed581fd.blueprints.size > 0 && blueprintindex > 0) {
        var_9b32d1936831f5aa = bundle.var_d96d3e6ceed581fd.blueprints[blueprintindex - 1].genericblueprint;
    } else if (isdefined(bundle.var_d96d3e6ceed581fd.var_85ec36a3c387a93a)) {
        var_9b32d1936831f5aa = bundle.var_d96d3e6ceed581fd.var_85ec36a3c387a93a;
    }
    bodymodel = function_29e16a88682086b2(var_9b32d1936831f5aa, "xmodel", "bodyModel");
    turretmodel = function_29e16a88682086b2(var_9b32d1936831f5aa, "xmodel", "turretModel");
    compositemodel = function_29e16a88682086b2(var_9b32d1936831f5aa, "xmodel", "xcompositeModel");
    var_a84cfd847dc1f677.bodymodel = bodymodel;
    var_a84cfd847dc1f677.turretmodel = turretmodel;
    var_a84cfd847dc1f677.modelbase = compositemodel;
    return var_a84cfd847dc1f677;
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fd3
// Size: 0x106
function function_de3e4e392c558d37(streakname) {
    var_e25f9b0de2cc7b81 = self;
    scorepopup = "destroyed_" + streakname;
    vodestroyed = undefined;
    destroyedsplash = "callout_destroyed_" + streakname;
    var_8dfc256103cce53e = &function_89445073f3e86e5c;
    var_191284e2e2837328 = &function_e2797fdb403c45e0;
    var_bacc6dd14316758c = &function_944f35a106cf0b72;
    var_7da88d9c69433487 = &function_75ab8f8d5f7aff1d;
    deathcallback = &function_c2a6845f0336b0f1;
    killstreak_setupvehicledamagefunctionality(streakname, var_e25f9b0de2cc7b81, scorepopup, vodestroyed, destroyedsplash, var_8dfc256103cce53e, var_191284e2e2837328, var_bacc6dd14316758c, var_7da88d9c69433487, deathcallback);
    namespace_f64231d5b7a2c3c4::vehicle_tracking_registerinstance(self, self.owner, self.owner.team);
    function_cfc5e3633ef950fd(1, 2750, &function_30214d9ff0a7ec22);
    function_cfc5e3633ef950fd(2, 1500, &function_d0fc0ddcbaeef567);
    function_cfc5e3633ef950fd(3, 500, &function_b89384926b7b6217);
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20e0
// Size: 0x5c
function function_89445073f3e86e5c(streakname) {
    config = level.tanksettings[self.tanktype];
    if (issharedfuncdefined("vehicle_damage", "setVehicleHitDamageData")) {
        [[ getsharedfunc("vehicle_damage", "setVehicleHitDamageData") ]](streakname, config.hitstokill);
    }
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2143
// Size: 0x143
function function_e2797fdb403c45e0(streakname) {
    weaponname = "thermite_bolt_mp";
    weaponhitsperattack = 1;
    var_8b4500d6a881b7b2 = 18;
    if (issharedfuncdefined("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon")) {
        [[ getsharedfunc("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon") ]](weaponname, weaponhitsperattack, var_8b4500d6a881b7b2, streakname);
    }
    weaponname = "thermite_xmike109_mp";
    weaponhitsperattack = 1;
    var_8b4500d6a881b7b2 = 25;
    if (issharedfuncdefined("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon")) {
        [[ getsharedfunc("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon") ]](weaponname, weaponhitsperattack, var_8b4500d6a881b7b2, streakname);
    }
    weaponname = "semtex_bolt_mp";
    weaponhitsperattack = 1;
    var_8b4500d6a881b7b2 = 7;
    if (issharedfuncdefined("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon")) {
        [[ getsharedfunc("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon") ]](weaponname, weaponhitsperattack, var_8b4500d6a881b7b2, streakname);
    }
    weaponname = "semtex_xmike109_mp";
    weaponhitsperattack = 1;
    var_8b4500d6a881b7b2 = 8;
    if (issharedfuncdefined("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon")) {
        [[ getsharedfunc("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon") ]](weaponname, weaponhitsperattack, var_8b4500d6a881b7b2, streakname);
    }
    weaponname = "c4_mp";
    weaponhitsperattack = 5;
    var_8b4500d6a881b7b2 = undefined;
    if (issharedfuncdefined("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon")) {
        [[ getsharedfunc("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon") ]](weaponname, weaponhitsperattack, var_8b4500d6a881b7b2, streakname);
    }
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x228d
// Size: 0x1d
function function_7fa9ed782d7c0734() {
    namespace_84cff6185e39aa66::vehomn_showwarning("missileLocking", self.owner, "killstreak");
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22b1
// Size: 0x1d
function function_13a9b220f9377bba() {
    namespace_84cff6185e39aa66::vehomn_hidewarning("missileLocking", self.owner, "killstreak");
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22d5
// Size: 0x2c6
function function_cfd4851e4ca5b834(remotetank) {
    level endon("game_ended");
    self endon("disconnect");
    self disablephysicaldepthoffieldscripting();
    self.restoreangles = self getplayerangles();
    remotetank vehicle_damage_setcandamage(1);
    data = spawnstruct();
    data.deathoverridecallback = &function_f49e3a7cfdb07f52;
    remotetank thread namespace_d7b023c7eb3949d0::handle_moving_platforms(data);
    remotetank setotherent(self);
    if (remotetank.var_d8943d63ec472996 == 0) {
        remotetank setentityowner(self);
    }
    remotetank.driver = self;
    remotetank.ispiloted = 1;
    self unlink();
    if (isdefined(remotetank.empcount) && remotetank.empcount > 0) {
        _freezelookcontrols(1);
    } else if (remotetank.var_d8943d63ec472996 == 0) {
        self controlslinkto(remotetank);
        self remotecontrolturret(remotetank.mgturret);
    } else {
        if (remotetank namespace_5a51aa78ea0b1b9f::is_empd()) {
            function_db443c859c55e450(1);
        }
        remotetank vehicle_turnengineon();
        self usevehicle(remotetank, 0);
    }
    remotetank.controlslinked = 1;
    self painvisionoff();
    killstreak_savenvgstate();
    var_b929075ec07dce71 = 1;
    var_a6f4657e2f8d1d39 = "third_person_hud_on";
    if (isdefined(self.previousremotetankviewstate)) {
        var_b929075ec07dce71 = self.previousremotetankviewstate;
        if (var_a6f4657e2f8d1d39 == 2) {
            var_a6f4657e2f8d1d39 = "first_person_hud_on";
        }
    }
    _setvisibiilityomnvarforkillstreak(remotetank.streakinfo.streakname, var_a6f4657e2f8d1d39);
    self setclientomnvar("ui_pac_sentry_controls", var_b929075ec07dce71);
    self setclientomnvar("ui_pac_sentry_speed", 0);
    self setclientomnvar("ui_killstreak_health", remotetank.health / remotetank.maxhealth);
    self setclientomnvar("ui_killstreak_damage_state", 0);
    _stopshellshock();
    val::set("remoteTank", "shellshock", 0);
    namespace_d9c77dc2a6fe29c6::registerentforoob(remotetank, "killstreak");
    remotetank thread function_6f3f7278c3e229d7();
    val::set("remoteTank_spawn", "player_for_spawn_logic", 0);
    namespace_b2d5aa2baf2b5701::addspawnviewer(remotetank);
    remotetank namespace_5a51aa78ea0b1b9f::set_start_emp_callback(&function_766f7c743d266217);
    remotetank namespace_5a51aa78ea0b1b9f::set_clear_emp_callback(&function_a05d4cd1fe21c586);
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        remotetank [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_766f7c743d266217);
    }
    if (issharedfuncdefined("emp", "setEMP_Cleared_Callback")) {
        remotetank [[ getsharedfunc("emp", "setEMP_Cleared_Callback") ]](&function_8c02e338af14541c);
    }
    remotetank namespace_b6b4a3ac458ab6e2::function_172d848d58051fdf(&function_f149e9383f183cf0);
    remotetank namespace_b6b4a3ac458ab6e2::function_aa823a31304ed981(&function_5c67fa91fe5b79);
    _freezecontrols(0);
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25a2
// Size: 0x3a
function function_944f35a106cf0b72(data) {
    damage = data.damage;
    attacker = data.attacker;
    return 1;
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25e4
// Size: 0x171
function function_75ab8f8d5f7aff1d(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    if (isdefined(self.owner) && self.owner isusingremote()) {
        if (isexplosivedamagemod(type)) {
            if (ceil(damage / self.maxhealth) >= 0.33) {
                self.owner earthquakeforplayer(0.25, 0.2, self.origin, 150);
                self.owner playrumbleonpositionforclient("damage_heavy", self.owner geteye());
            }
        } else {
            self.owner earthquakeforplayer(0.15, 0.15, self.origin, 150);
            self.owner playrumbleonpositionforclient("damage_light", self.owner geteye());
        }
    }
    self.currenthealth = self.currenthealth - damage;
    killstreak_updatedamagestate(self.currenthealth);
    return 1;
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x275d
// Size: 0x15
function function_30214d9ff0a7ec22() {
    self setscriptablepartstate("body_damage_light", "on", 0);
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2779
// Size: 0x15
function function_d0fc0ddcbaeef567() {
    self setscriptablepartstate("body_damage_medium", "on", 0);
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2795
// Size: 0x27
function function_b89384926b7b6217() {
    self setscriptablepartstate("body_damage_heavy", "on", 0);
    self setscriptablepartstate("turret_damage", "on", 0);
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27c3
// Size: 0x42
function function_c2a6845f0336b0f1(data) {
    self.killedbyweapon = data.objweapon;
    playkillstreakoperatordialog("pac_sentry", "pac_sentry" + "_destroyed", 1);
    thread function_4334ace787c46d9e();
    return 0;
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x280d
// Size: 0x14
function function_f49e3a7cfdb07f52(data) {
    thread function_4334ace787c46d9e();
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2828
// Size: 0x41
function function_371a76c203bdc938() {
    self endon("death");
    level endon("game_ended");
    thread function_7f60b3159041388a();
    function_cee9be98157cd644();
    playkillstreakoperatordialog("pac_sentry", "pac_sentry" + "_timeout", 1);
    thread function_4334ace787c46d9e();
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2870
// Size: 0x70
function function_7f60b3159041388a() {
    self endon("death");
    var_ed6f9375a4009de4 = self.owner;
    if (!isdefined(var_ed6f9375a4009de4)) {
        return;
    }
    var_ed6f9375a4009de4 endon("disconnect");
    var_ed6f9375a4009de4 endon("joined_team");
    var_ed6f9375a4009de4 endon("joined_spectators");
    var_ed6f9375a4009de4 endon("team_kill_punish");
    while (1) {
        var_ed6f9375a4009de4 waittill("player_fatal_death");
        if (istrue(self.ispiloted)) {
            thread function_66cd16d1ea616b67();
        } else {
            thread function_4334ace787c46d9e();
        }
    }
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28e7
// Size: 0xe4
function function_cee9be98157cd644() {
    self endon("killstreakExit");
    self.owner endon("disconnect");
    self.owner endon("joined_team");
    self.owner endon("joined_spectators");
    self.owner endon("team_kill_punish");
    level endon("game_ended");
    self.owner setclientomnvar("ui_killstreak_countdown", 100);
    timeelapsed = 0;
    timeoutduration = self.lifetime;
    while (timeelapsed < timeoutduration) {
        var_77b3f0514a25c019 = (timeoutduration - timeelapsed) / timeoutduration;
        var_77b3f0514a25c019 = int(ceil(clamp(var_77b3f0514a25c019, 0, 1) * 100));
        if (istrue(self.ispiloted)) {
            self.owner setclientomnvar("ui_killstreak_countdown", var_77b3f0514a25c019);
        }
        timeelapsed = timeelapsed + level.framedurationseconds;
        waitframe();
    }
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29d2
// Size: 0x24
function function_7f192a2a47cf2a7d() {
    self endon("death");
    level waittill_any_2("start_game_ended", "game_ended");
    thread function_4334ace787c46d9e();
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29fd
// Size: 0x242
function function_4334ace787c46d9e(attacker, var_4fac8b8ce36e09f1) {
    var_a84cfd847dc1f677 = level.tanksettings[self.tanktype];
    if (istrue(self.destroyed)) {
        return;
    } else {
        self.destroyed = 1;
    }
    self notify("death");
    self.controlslinked = undefined;
    if (self.var_d8943d63ec472996 == 0) {
        self.mgturret setturretowner(undefined);
        self.mgturret notify("kill_turret");
        self.mgturret notify("death");
        self.mgturret setmode(var_a84cfd847dc1f677.sentrymodeoff);
    }
    level callback::callback("killstreak_finish_use", {streakinfo:self.streakinfo});
    if (!isdefined(attacker)) {
        attacker = self.owner;
    }
    namespace_f64231d5b7a2c3c4::vehicle_tracking_deregisterinstance(self);
    self.health = 0;
    vehicle_damage_setcandamage(0);
    namespace_5a51aa78ea0b1b9f::clear_emp(1);
    namespace_5a51aa78ea0b1b9f::allow_emp(0);
    if (isdefined(self.owner.empscramblelevels) && isdefined(self.owner.empscramblelevels[5])) {
        self.owner thread namespace_5a51aa78ea0b1b9f::stop_emp_scramble(5);
    }
    namespace_d9c77dc2a6fe29c6::clearoob(self, 1);
    self.streakinfo.expiredbydeath = istrue(var_4fac8b8ce36e09f1);
    self.owner namespace_9abe40d2af041eb2::recordkillstreakendstats(self.streakinfo);
    if (isdefined(self.driver)) {
        self.driver thread function_fd5a2ca6a710c2c8(self);
    }
    self playsound("veh_ks_wheelson_explode");
    self setscriptablepartstate("explode", "on", 0);
    wait(0.35);
    decrementfauxvehiclecount();
    if (self.var_d8943d63ec472996 == 0) {
        if (isdefined(self.mgturret)) {
            self.mgturret delete();
        }
    }
    if (isdefined(self.killcament)) {
        self.killcament delete();
    }
    level.remotetanks = array_remove(level.remotetanks, self);
    namespace_f64231d5b7a2c3c4::_deletevehicle(self);
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c46
// Size: 0x15f
function function_fd5a2ca6a710c2c8(tank) {
    self endon("disconnect");
    var_a84cfd847dc1f677 = level.tanksettings[tank.tanktype];
    tank function_13a9b220f9377bba();
    if (isdefined(tank.empcount) && tank.empcount > 0) {
        _freezelookcontrols(0);
    }
    tank setotherent(undefined);
    tank.driver = undefined;
    tank.ispiloted = undefined;
    if (tank.var_d8943d63ec472996 == 0) {
        tank setentityowner(undefined);
        self controlsunlink();
        self remotecontrolturretoff(tank.mgturret);
    } else {
        tank function_db443c859c55e450(0);
        tank notify("driver_exited");
        self function_c0505f05660d120c(0);
    }
    _setvisibiilityomnvarforkillstreak(tank.streakinfo.streakname, "off");
    self setclientomnvar("ui_pac_sentry_controls", 0);
    if (isusingremote()) {
        tank.streakinfo notify("killstreak_finished_with_deploy_weapon");
    }
    self painvisionon();
    killstreak_restorenvgstate();
    val::function_c9d0b43701bdba00("remoteTank_spawn");
    namespace_b2d5aa2baf2b5701::removespawnviewer(tank);
    if (namespace_f8065cafc523dba5::_isalive()) {
        _stopshellshock();
        val::function_c9d0b43701bdba00("remoteTank");
        level thread restorekillstreakplayerangles(self);
    }
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2dac
// Size: 0x10d
function function_717645ad31e6b064() {
    self endon("death");
    while (1) {
        projectile = self.mgturret waittill("missile_fire");
        projectile.owner = self.owner;
        projectile.streakinfo = self.streakinfo;
        var_fcf66a83d8283ea1 = spawn("script_model", projectile.origin);
        var_fcf66a83d8283ea1 setmodel("ks_pac_sentry_mp");
        var_fcf66a83d8283ea1.angles = projectile.angles;
        var_fcf66a83d8283ea1.team = self.team;
        var_fcf66a83d8283ea1.owner = self.owner;
        var_fcf66a83d8283ea1.streakinfo = self.streakinfo;
        var_fcf66a83d8283ea1 setentityowner(self.owner);
        var_fcf66a83d8283ea1 dontinterpolate();
        self.streakinfo.shots_fired++;
        function_93c80ddc3857d00d(projectile, var_fcf66a83d8283ea1);
    }
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ec0
// Size: 0x19f
function function_93c80ddc3857d00d(var_ee356ed81b5cb7f4, var_fcf66a83d8283ea1) {
    var_5c2475d41219f077 = anglestoforward(var_ee356ed81b5cb7f4.angles);
    startpos = var_ee356ed81b5cb7f4.origin;
    endpos = startpos + var_5c2475d41219f077 * 22500;
    ignorelist = [0:var_ee356ed81b5cb7f4, 1:var_fcf66a83d8283ea1, 2:self.owner];
    var_9e4ee1c6e5812de2 = namespace_2a184fc4902783dc::create_contents(1, 0, 0, 0, 0, 0, 0, 0, 0);
    var_e5354be82a7990d5 = namespace_2a184fc4902783dc::sphere_trace_get_all_results(startpos, endpos, 60, ignorelist, var_9e4ee1c6e5812de2);
    var_b443b8bf31b2425e = 0;
    if (isdefined(var_e5354be82a7990d5[0])) {
        for (i = 0; i < var_e5354be82a7990d5.size - 1; i++) {
            potentialtarget = var_e5354be82a7990d5[i]["entity"];
            var_77861a4668ff91e7 = var_e5354be82a7990d5[i]["position"];
            var_3c70094ed665a389 = var_e5354be82a7990d5[i]["shape_position"];
            if (isdefined(potentialtarget)) {
                if (level.teambased) {
                    if (potentialtarget.team == var_fcf66a83d8283ea1.team) {
                        continue;
                    }
                }
                jumpiftrue(ray_trace_passed(var_3c70094ed665a389, var_77861a4668ff91e7, var_fcf66a83d8283ea1)) LOC_0000015f;
            } else {
            LOC_0000015f:
                var_b443b8bf31b2425e = 1;
                traveltime = distance(startpos, var_3c70094ed665a389) / 7500;
                var_ee356ed81b5cb7f4 thread function_21526388ce8cfe7c(var_77861a4668ff91e7, var_3c70094ed665a389, traveltime, var_fcf66a83d8283ea1, self);
                break;
            }
        }
    }
    if (!istrue(var_b443b8bf31b2425e)) {
        if (isdefined(var_fcf66a83d8283ea1)) {
            var_fcf66a83d8283ea1 delete();
        }
    }
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3066
// Size: 0xdf
function function_21526388ce8cfe7c(var_77861a4668ff91e7, var_3c70094ed665a389, traveltime, var_fcf66a83d8283ea1, tank) {
    level endon("game_ended");
    if (isdefined(self)) {
        self delete();
    }
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(traveltime);
    var_fcf66a83d8283ea1.origin = var_3c70094ed665a389;
    var_fcf66a83d8283ea1 setscriptablepartstate("airburst", "airExpl");
    if (issharedfuncdefined("spawn", "addSpawnDangerZone")) {
        [[ getsharedfunc("spawn", "addSpawnDangerZone") ]](var_3c70094ed665a389, 100, 100, var_fcf66a83d8283ea1.team, 1, var_fcf66a83d8283ea1.owner, 1);
    }
    var_fcf66a83d8283ea1 thread function_a2d262a682ad5e0();
    /#
        var_4117f5f8086a687e = getdvarint(@"hash_91f047e0dec87b64", 0);
        if (var_4117f5f8086a687e) {
            var_fcf66a83d8283ea1 thread function_257b6f1cf0249339(var_77861a4668ff91e7, tank);
        }
    #/
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x314c
// Size: 0x1cf
function function_1dcee2ab6d1348c2() {
    level endon("game_ended");
    var_a84cfd847dc1f677 = level.tanksettings[self.tanktype];
    updaterate = level.framedurationseconds;
    holdtime = ter_op(function_ba5574c7f287c587(), 0.01, 0.25);
    self.var_df66bd377221e9b5 = 0;
    var_efe526bf6a23d275 = undefined;
    if (function_ba5574c7f287c587()) {
        var_efe526bf6a23d275 = "hud_icon_killstreak_wheelson";
    }
    function_e68434bdb941ed1e(self.streakinfo.streakname, self.owner, "KILLSTREAKS_HINTS/REMOTE_TANK_SENTRY_OFF", undefined, var_efe526bf6a23d275);
    if (isdefined(self.useobj)) {
        self.useobj setuseholdduration(250);
    }
    while (isdefined(self)) {
        if (!istrue(self.var_df66bd377221e9b5)) {
            timeused = 0;
            while (isdefined(self) && isdefined(self.owner) && self.owner usebuttonpressed()) {
                timeused = timeused + updaterate;
                if (!istrue(self.var_df66bd377221e9b5)) {
                    self.owner setclientomnvar("ui_exit_progress", timeused / holdtime);
                }
                if (timeused >= holdtime) {
                    function_66cd16d1ea616b67();
                    break;
                }
                wait(updaterate);
            }
            if (isdefined(self) && isdefined(self.owner) && !istrue(self.var_df66bd377221e9b5)) {
                self.owner setclientomnvar("ui_exit_progress", 0);
            }
        } else {
            if (isdefined(self.useobj)) {
                player = self.useobj waittill("trigger");
            }
            if (!istrue(self.owner.var_65219c911f198c95)) {
                function_bd237957848037c8();
            }
        }
        waitframe();
    }
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3322
// Size: 0x20e
function function_44208c5a6449e697(target) {
    if (!isdefined(target)) {
        return 0;
    }
    if (isplayer(target)) {
        if (isdefined(self) && isdefined(target.team) && isdefined(self.var_1329597b4278afe9) && array_contains(self.var_1329597b4278afe9, target.team)) {
            return 0;
        }
        if (!target namespace_f8065cafc523dba5::_isalive() || target.sessionstate != "playing") {
            return 0;
        }
        if (istrue(target.notarget)) {
            return 0;
        }
        if (target == self.owner) {
            return 0;
        }
        if (!isdefined(target.pers["team"])) {
            return 0;
        }
        if (target.pers["team"] == "spectator") {
            return 0;
        }
        if (level.teambased) {
            if (target.pers["team"] == self.team) {
                return 0;
            }
        }
        if (issharedfuncdefined("perk", "hasPerk")) {
            if (target [[ getsharedfunc("perk", "hasPerk") ]]("specialty_blindeye")) {
                return 0;
            }
        }
        if (isdefined(target.team) && isdefined(self.var_1329597b4278afe9) && array_contains(self.var_1329597b4278afe9, target.team)) {
            return 0;
        }
    } else if (isagent(target)) {
        if (!isalive(target)) {
            return 0;
        }
        if (isdefined(target.agent_type) && issubstr(target.agent_type, "civilian")) {
            return 0;
        }
        var_da8cec9bce12f9cb = namespace_14d36171baccf528::agentpers_getagentpersdata(target, "team");
        if (!isdefined(var_da8cec9bce12f9cb)) {
            var_da8cec9bce12f9cb = target.team;
        }
        if (level.teambased) {
            if (isdefined(var_da8cec9bce12f9cb) && var_da8cec9bce12f9cb == self.team) {
                return 0;
            }
        }
    }
    return self vehicle_canturrettargetpoint(target gettagorigin("j_mainroot"), 1, self);
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3538
// Size: 0x119
function function_d8ff9ab17cba9862() {
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["pac_sentry"];
    closesttarget = undefined;
    closestdistsq = undefined;
    var_c81c8e185fc6d4eb = undefined;
    if (isdefined(bundle)) {
        var_c81c8e185fc6d4eb = utility::function_2d7fd59d039fa69b(self.origin, bundle.var_7a91dfa9031fe491);
    } else {
        var_c81c8e185fc6d4eb = utility::function_2d7fd59d039fa69b(self.origin, 4096);
    }
    foreach (target in var_c81c8e185fc6d4eb) {
        if (!function_44208c5a6449e697(target)) {
            continue;
        }
        distsq = distancesquared(target.origin, self.origin);
        if (!isdefined(closesttarget) || distsq < closestdistsq) {
            closesttarget = target;
            closestdistsq = distsq;
        }
    }
    self.currentenemy = closesttarget;
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3658
// Size: 0x28f
function function_b1ccab9347662a31() {
    self endon("death");
    self endon("entering_control");
    self.owner endon("disconnect");
    level endon("game_ended");
    var_3807e28e9f5cd57 = 0;
    while (1) {
        if (istrue(self.var_158f2fb396c0cccb)) {
            waitframe();
            continue;
        }
        var_4586e4603ee41cde = self.currentenemy;
        function_d8ff9ab17cba9862();
        if (isdefined(self.currentenemy)) {
            self setturrettargetent(self.currentenemy, self.currentenemy gettagorigin("j_mainroot") - self.currentenemy.origin);
            while (function_44208c5a6449e697(self.currentenemy) && !function_bb61346fda4278e5(self, self.currentenemy, "j_mainroot", 5)) {
                waitframe();
            }
            if (function_44208c5a6449e697(self.currentenemy)) {
                var_a84cfd847dc1f677 = level.tanksettings[self.tanktype];
                firetime = weaponfiretime(var_a84cfd847dc1f677.weaponinfo);
                var_3746ec1befd86ae8 = var_a84cfd847dc1f677.burstmin;
                var_3e92cd336a99ce02 = var_a84cfd847dc1f677.burstmax;
                var_5f622c39d6661b23 = var_a84cfd847dc1f677.pausemin;
                var_42ae243cd994c3bd = var_a84cfd847dc1f677.pausemax;
                numshots = randomintrange(var_3746ec1befd86ae8, var_3e92cd336a99ce02 + 1);
                function_416e1c2f79fce693(var_a84cfd847dc1f677);
                while (function_44208c5a6449e697(self.currentenemy) && numshots > 0) {
                    self fireweapon();
                    numshots--;
                    self.streakinfo.shots_fired++;
                    wait(firetime);
                }
                wait(randomfloatrange(var_5f622c39d6661b23, var_42ae243cd994c3bd));
            }
        } else {
            function_6add0f629e59f222();
            var_941d89bd45430ff7 = randomfloatrange(-5 + 180 * var_3807e28e9f5cd57, 5 + 180 * var_3807e28e9f5cd57);
            var_3807e28e9f5cd57++;
            var_3807e28e9f5cd57 = var_3807e28e9f5cd57 % 2;
            targetangles = (0, var_941d89bd45430ff7, 0);
            var_c0686995758526de = anglestoforward(targetangles);
            start = self.origin + (0, 0, 16);
            end = start + 1000 * var_c0686995758526de;
            self setturrettargetvec(end);
            waittill_any_timeout_1(2, "turret_on_target");
            wait(0.25);
        }
    }
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38ee
// Size: 0x77
function function_416e1c2f79fce693(var_a84cfd847dc1f677) {
    self endon("death");
    spinuptime = var_a84cfd847dc1f677.spinuptime;
    self laseron();
    thread namespace_c5e4bf96a5150e88::sentry_targetlocksound();
    self function_ee85446afc7cb0a8(1);
    self.var_4863a1b39f3e20f5 = 1;
    while (function_44208c5a6449e697(self.currentenemy) && spinuptime > 0) {
        spinuptime = spinuptime - 0.05;
        wait(0.05);
    }
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x396c
// Size: 0x29
function function_6add0f629e59f222() {
    if (istrue(self.var_4863a1b39f3e20f5)) {
        self laseroff();
        self function_ee85446afc7cb0a8(0);
        self.var_4863a1b39f3e20f5 = undefined;
    }
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x399c
// Size: 0x105
function function_66cd16d1ea616b67() {
    self endon("death");
    self.owner endon("disconnect");
    if (istrue(self.destroyed)) {
        return;
    }
    var_a84cfd847dc1f677 = level.tanksettings[self.tanktype];
    childthread function_79479ff61f57b90b();
    self.owner function_fd5a2ca6a710c2c8(self);
    self notify("leaving_control");
    playkillstreakoperatordialog("pac_sentry", "pac_sentry" + "_sentry", 1);
    function_3c864cee6ca51e89(1);
    if (self.var_d8943d63ec472996 == 0) {
        self.mgturret setmode(var_a84cfd847dc1f677.sentrymodeon);
        self.mgturret thread namespace_c5e4bf96a5150e88::sentry_attacktargets(var_a84cfd847dc1f677);
        /#
            self.mgturret thread namespace_c5e4bf96a5150e88::function_c057f52574c94670(var_a84cfd847dc1f677);
        #/
    } else {
        thread function_b1ccab9347662a31();
    }
    self.var_df66bd377221e9b5 = 1;
    self setscriptablepartstate("auto_spin_sfx", "on");
    function_86ff095469a70cd2();
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3aa8
// Size: 0x39
function function_79479ff61f57b90b() {
    level endon("game_ended");
    function_3f55c1fb553a4775(self.owner, self.useobj);
    wait(0.1);
    function_17576a4cdcd447a7(self.owner);
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ae8
// Size: 0x14b
function function_bd237957848037c8() {
    self.owner endon("disconnect");
    var_a84cfd847dc1f677 = level.tanksettings[self.tanktype];
    streakinfo = self.streakinfo;
    deployweaponobj = makeweapon("ks_remote_device_mp");
    var_9b1deb5e9d32bbe3 = self.owner namespace_b3d24e921998a8b::streakdeploy_doweapontabletdeploy(self.streakinfo, &weapongivenremotetank, undefined, undefined, &deployweapontaken, undefined, undefined, undefined, 0, 1);
    if (!istrue(var_9b1deb5e9d32bbe3)) {
        self.owner namespace_44abc05161e2e2cb::showerrormessage("KILLSTREAKS/CANNOT_RECONNECT");
        return;
    }
    if (!isdefined(self) || istrue(self.destroyed)) {
        streakinfo notify("killstreak_finished_with_deploy_weapon");
        return;
    }
    if (self.var_d8943d63ec472996 == 0) {
        self.mgturret setmode(var_a84cfd847dc1f677.sentrymodeoff);
        self.mgturret notify("kill_turret");
    } else {
        self notify("entering_control");
        self clearturrettarget();
    }
    function_3c864cee6ca51e89(0);
    self setscriptablepartstate("auto_spin_sfx", "off");
    self.owner function_cfd4851e4ca5b834(self);
    self.var_df66bd377221e9b5 = 0;
    function_a91ebb0263d086f3();
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c3a
// Size: 0x5e
function function_3c864cee6ca51e89(var_93c07017fa762d2b) {
    var_698544664d21f59 = self function_962a6476fe1c33ee();
    if (isdefined(var_698544664d21f59)) {
        if (var_698544664d21f59 == "veh_amphibious_water") {
            if (istrue(var_93c07017fa762d2b)) {
                self function_481c2a63f2ba3332(-1, 0, 0);
            } else {
                self function_481c2a63f2ba3332(0);
            }
        } else {
            self function_65aa053c077c003a(var_93c07017fa762d2b);
        }
    }
    if (istrue(var_93c07017fa762d2b)) {
        function_c5b2e0bb2a8d5f68();
    }
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3c9f
// Size: 0x144
function function_257b6f1cf0249339(var_77861a4668ff91e7, tank) {
    /#
        self endon("spectator");
        tank endon("spectator");
        var_7de35540c250a948 = 120;
        var_224e3e985c76a43f = tank.origin;
        var_2d7a2733c414e4df = self.origin;
        sphere(var_2d7a2733c414e4df, 60, (1, 1, 1), 0, var_7de35540c250a948);
        sphere(var_2d7a2733c414e4df, 100, (1, 0, 0), 0, var_7de35540c250a948);
        line(tank.mgturret gettagorigin("entering_control"), var_2d7a2733c414e4df, (1, 0, 0), 1, 0, var_7de35540c250a948);
        var_379097055795a272 = vectornormalize(var_2d7a2733c414e4df - tank.mgturret gettagorigin("entering_control"));
        var_6632aaba73e07c62 = 0;
        while (var_6632aaba73e07c62 < var_7de35540c250a948) {
            print3d(var_224e3e985c76a43f + var_379097055795a272 * 200, "veh_wheelson_engine_stop" + var_2d7a2733c414e4df, (1, 0, 0));
            print3d(var_224e3e985c76a43f + var_379097055795a272 * 200 - (0, 0, 20), "killstreak_veh_camera_mp" + distance2d(var_2d7a2733c414e4df, var_77861a4668ff91e7));
            waitframe();
            var_6632aaba73e07c62 = var_6632aaba73e07c62 + 1;
        }
    #/
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dea
// Size: 0x25
function function_a2d262a682ad5e0() {
    self endon("death");
    self.dying = 1;
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(1);
    self delete();
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e16
// Size: 0xa2
function function_da556e71229fa017() {
    self endon("death");
    var_2bdc3e3680df74eb = 0;
    while (1) {
        var_e466656788b2bde5 = self vehicle_getspeed();
        var_46c9a177682cfdd2 = var_e466656788b2bde5 * 1.60934;
        if (var_e466656788b2bde5 > 1 && !istrue(var_2bdc3e3680df74eb)) {
            var_2bdc3e3680df74eb = 1;
            self setscriptablepartstate("dust", "on");
        } else if (var_e466656788b2bde5 <= 1 && istrue(var_2bdc3e3680df74eb)) {
            var_2bdc3e3680df74eb = 0;
            self setscriptablepartstate("dust", "off");
        }
        self.owner setclientomnvar("ui_pac_sentry_speed", int(var_46c9a177682cfdd2));
        waitframe();
    }
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ebf
// Size: 0x95
function function_cba0065c10ac9099() {
    self endon("death");
    level endon("game_ended");
    thread function_c495d6715028bedf();
    while (1) {
        if (istrue(self.var_df66bd377221e9b5)) {
            waitframe();
            continue;
        }
        driver = self.owner;
        if (isdefined(driver)) {
            var_f619fe4a4e1d4868 = driver getnormalizedmovement();
            var_58724d69ca657b30 = abs(var_f619fe4a4e1d4868[0]);
            if (var_58724d69ca657b30 >= 0.15) {
                function_cf71eb6e0611096c();
            } else {
                function_c5b2e0bb2a8d5f68();
            }
        } else {
            function_c5b2e0bb2a8d5f68();
        }
        waitframe();
    }
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f5b
// Size: 0x4f
function function_cf71eb6e0611096c() {
    self endon("death");
    self endon("wheelson_stop_engine");
    level endon("game_ended");
    if (istrue(self.engine_audio_active)) {
        return;
    }
    self.engine_audio_active = 1;
    self playsoundonmovingent("veh_wheelson_engine_start");
    wait(0.5);
    self playloopsound("veh_wheelson_engine_lp");
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fb1
// Size: 0x7b
function function_c5b2e0bb2a8d5f68(var_fcef8d217a441961) {
    if (istrue(var_fcef8d217a441961)) {
        self notify("wheelson_stop_engine");
        self.engine_audio_active = undefined;
        self stoploopsound("veh_wheelson_engine_lp");
    } else if (istrue(self.engine_audio_active)) {
        self notify("wheelson_stop_engine");
        self endon("wheelson_stop_engine");
        self.engine_audio_active = undefined;
        self playsoundonmovingent("veh_wheelson_engine_stop");
        wait(0.5);
        if (isdefined(self)) {
            self stoploopsound("veh_wheelson_engine_lp");
        }
    }
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4033
// Size: 0x1a
function function_c495d6715028bedf() {
    self endon("death");
    level waittill("game_ended");
    thread function_c5b2e0bb2a8d5f68();
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4054
// Size: 0xb3
function function_766f7c743d266217(data) {
    if (!isdefined(self.owner)) {
        return;
    }
    if (isdefined(data.attacker)) {
        data.attacker thread namespace_48a08c5037514e04::doscoreevent(#"hash_e5ce77cfae268ab3", undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
    }
    self.var_158f2fb396c0cccb = 1;
    if (istrue(self.ispiloted)) {
        function_db443c859c55e450(1);
    }
    self vehicle_turnengineoff();
    self.useobj disableplayeruse(self.owner);
    if (isplayer(self.owner)) {
        self.owner thread namespace_5a51aa78ea0b1b9f::play_emp_scramble(5);
    }
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x410e
// Size: 0x51
function function_db443c859c55e450(isenabled) {
    var_e796719320e13e49 = self function_1e8542a707a8002("p2p");
    if (!var_e796719320e13e49) {
        self.owner _freezelookcontrols(isenabled);
        self.owner _freezecontrols(isenabled);
    }
    function_e4adb8dfbd1e62dd(isenabled, var_e796719320e13e49);
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4166
// Size: 0xa0
function function_e4adb8dfbd1e62dd(var_e2a66dd8a90fbd3f, var_e796719320e13e49) {
    if (var_e2a66dd8a90fbd3f) {
        if (var_e796719320e13e49) {
            self function_77320e794d35465a("p2p", "pause", 1);
        } else {
            namespace_84cff6185e39aa66::vehomn_showwarning("movementDisabled", self.owner, namespace_1f188a13f7e79610::function_d93ec4635290febd());
            self function_64d8ae560c3ec9b6(1);
            self.veh_throttle = 0;
        }
    } else if (var_e796719320e13e49) {
        self function_77320e794d35465a("p2p", "resume", 1);
    } else {
        namespace_84cff6185e39aa66::vehomn_hidewarning("movementDisabled", self.owner, namespace_1f188a13f7e79610::function_d93ec4635290febd());
        self function_64d8ae560c3ec9b6(0);
    }
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x420d
// Size: 0x71
function function_a05d4cd1fe21c586(isdeath) {
    if (!isdefined(self.owner)) {
        return;
    }
    self vehicle_turnengineon();
    self.var_158f2fb396c0cccb = 0;
    if (!isdeath && istrue(self.ispiloted)) {
        function_db443c859c55e450(0);
    }
    self.owner thread namespace_5a51aa78ea0b1b9f::stop_emp_scramble(5);
    self.useobj enableplayeruse(self.owner);
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4285
// Size: 0x6b
function function_8c02e338af14541c(data) {
    if (!isdefined(self.owner)) {
        return;
    }
    self vehicle_turnengineon();
    self.var_158f2fb396c0cccb = 0;
    if (istrue(self.ispiloted)) {
        function_db443c859c55e450(0);
    }
    self.owner thread namespace_5a51aa78ea0b1b9f::stop_emp_scramble(5);
    self.useobj enableplayeruse(self.owner);
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42f7
// Size: 0xab
function function_f149e9383f183cf0(data) {
    var_8a28fd9df2f03764 = data.victim;
    if (!isdefined(var_8a28fd9df2f03764)) {
        return;
    }
    if (!isdefined(var_8a28fd9df2f03764.owner)) {
        return;
    }
    if (istrue(var_8a28fd9df2f03764.var_12bfb031c0a0efd8)) {
        return;
    }
    var_8a28fd9df2f03764.var_12bfb031c0a0efd8 = 1;
    var_8a28fd9df2f03764 thread function_e6cbf8131b64e6db();
    namespace_84cff6185e39aa66::vehomn_showwarning("shockStickAttached", var_8a28fd9df2f03764.owner, var_8a28fd9df2f03764.vehiclename);
    var_8a28fd9df2f03764 vehicle_settopspeedforward(var_8a28fd9df2f03764.var_93d37decdfe9be3d / 3);
    var_8a28fd9df2f03764 vehicle_settopspeedreverse(var_8a28fd9df2f03764.var_9fef0f6069126b26 / 3);
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43a9
// Size: 0x8b
function function_5c67fa91fe5b79(data) {
    var_8a28fd9df2f03764 = data.victim;
    if (!isdefined(var_8a28fd9df2f03764)) {
        return;
    }
    if (!isdefined(var_8a28fd9df2f03764.owner)) {
        return;
    }
    var_8a28fd9df2f03764 vehicle_settopspeedforward(var_8a28fd9df2f03764.var_93d37decdfe9be3d);
    var_8a28fd9df2f03764 vehicle_settopspeedreverse(var_8a28fd9df2f03764.var_9fef0f6069126b26);
    namespace_84cff6185e39aa66::vehomn_hidewarning("shockStickAttached", var_8a28fd9df2f03764.owner, var_8a28fd9df2f03764.vehiclename);
    var_8a28fd9df2f03764.var_12bfb031c0a0efd8 = 0;
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x443b
// Size: 0xa9
function function_e6cbf8131b64e6db() {
    level endon("game_ended");
    self.owner endon("disconnect");
    var_a84cfd847dc1f677 = level.tanksettings[self.tanktype];
    firetime = weaponfiretime(var_a84cfd847dc1f677.weaponinfo);
    childthread function_4973f20495f7d1ff(firetime);
    self.var_158f2fb396c0cccb = 1;
    if (!isdefined(self.driver)) {
        self clearturrettarget();
        self.currentenemy = undefined;
    }
    msg = waittill_any_return_2("death", "haywire_cleared");
    self.var_158f2fb396c0cccb = undefined;
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44eb
// Size: 0x2b
function function_4973f20495f7d1ff(firetime) {
    self endon("death");
    self endon("haywire_cleared");
    while (1) {
        self fireweapon();
        wait(firetime);
    }
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x451d
// Size: 0x5d
function function_6f3f7278c3e229d7() {
    self endon("death");
    self.owner endon("end_remote");
    self.owner endon("disconnect");
    while (1) {
        self.owner earthquakeforplayer(0.05, 0.05, self gettagorigin("tag_body"), 500);
        wait(0.05);
    }
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4581
// Size: 0x146
function function_8acee201d15f4c71(spawndist) {
    result = undefined;
    startpos = self.origin;
    startang = self.angles;
    forward = anglestoforward(startang);
    right = anglestoright(startang);
    var_7dddf03b37d511f = [0:startpos + spawndist * forward, 1:startpos - spawndist * forward, 2:startpos + spawndist * right, 3:startpos - spawndist * right, 4:startpos + 0.707 * spawndist * (forward + right), 5:startpos + 0.707 * spawndist * (forward - right), 6:startpos + 0.707 * spawndist * (right - forward), 7:startpos + 0.707 * spawndist * (-1 * forward - right)];
    foreach (curpos in var_7dddf03b37d511f) {
        result = function_a03fd14f53c89e53(startpos, curpos);
        if (isdefined(result)) {
            break;
        }
    }
    return result;
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46cf
// Size: 0x25a
function function_a03fd14f53c89e53(startpoint, spawnpoint) {
    result = undefined;
    zoffset = (0, 0, 45);
    var_1bfa180c6fdd09dd = create_contents(1, 1, 1, 1, 1, 1, 1, 0, 1);
    tracestart = startpoint + zoffset;
    traceend = spawnpoint + zoffset;
    var_ddeb1b8d9d4632e6 = 40;
    var_cb0a84b6d7f42d67 = ray_trace_passed(tracestart, traceend, self, var_1bfa180c6fdd09dd);
    if (!istrue(var_cb0a84b6d7f42d67)) {
        return result;
    }
    groundtrace = ray_trace(traceend, traceend - (0, 0, 500), level.players, var_1bfa180c6fdd09dd);
    if (isdefined(groundtrace["position"]) && groundtrace["hittype"] != "hittype_none") {
        var_fc168e598e8265ae = groundtrace["position"] + zoffset;
        var_2db6453133b55e73 = sphere_trace_passed(var_fc168e598e8265ae, var_fc168e598e8265ae, var_ddeb1b8d9d4632e6, level.players, var_1bfa180c6fdd09dd);
        var_da8cec9bce12f9cb = undefined;
        if (level.teambased) {
            var_da8cec9bce12f9cb = self.team;
        }
        if (istrue(var_2db6453133b55e73) && !namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(groundtrace["position"], var_da8cec9bce12f9cb)) {
            result = groundtrace["position"];
            /#
                debugspawns = getdvarint(@"hash_fd16625ce7800c7e", 0);
                if (debugspawns) {
                    line(tracestart, traceend, (0, 1, 0), 1, 0, 300);
                    line(traceend, result, (0, 1, 0), 1, 0, 300);
                    sphere(var_fc168e598e8265ae, var_ddeb1b8d9d4632e6, (0, 1, 0), 0, 300);
                    self iprintlnbold("<unknown string>");
                }
            #/
        } else {
            /#
                debugspawns = getdvarint(@"hash_fd16625ce7800c7e", 0);
                if (debugspawns) {
                    line(tracestart, traceend, (1, 0, 0), 1, 0, 300);
                    line(traceend, var_fc168e598e8265ae, (1, 0, 0), 1, 0, 300);
                    sphere(var_fc168e598e8265ae, var_ddeb1b8d9d4632e6, (1, 0, 0), 0, 300);
                }
            #/
        }
    }
    return result;
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4931
// Size: 0xbd
function function_a46005e27c92c2ca() {
    self endon("death");
    self.owner endon("disconnect");
    level endon("game_ended");
    while (1) {
        turretangles = undefined;
        if (self.var_d8943d63ec472996 == 0) {
            turretangles = self.mgturret gettagangles("tag_flash");
        } else {
            turretangles = self gettagangles("tag_flash");
        }
        var_5f1a5a32f3d81ce2 = invertangles(self.angles);
        var_d550ebe8b9a1bb32 = combineangles(var_5f1a5a32f3d81ce2, turretangles);
        var_bbb9076182480914 = var_d550ebe8b9a1bb32[1] * -1;
        self.owner setclientomnvar("ui_pac_sentry_degrees", var_bbb9076182480914);
        waitframe();
    }
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49f5
// Size: 0x158
function function_4048c2ca00c4690() {
    self endon("death");
    self.owner endon("disconnect");
    level endon("game_ended");
    thread function_865318fe12d890e8();
    self.owner notifyonplayercommand("toggle_view", "+togglevehcam");
    var_b929075ec07dce71 = 1;
    var_a6f4657e2f8d1d39 = "third_person_hud_on";
    if (isdefined(self.owner.previousremotetankviewstate)) {
        var_b929075ec07dce71 = self.owner.previousremotetankviewstate;
        if (var_a6f4657e2f8d1d39 == 2) {
            var_a6f4657e2f8d1d39 = "first_person_hud_on";
        }
    }
    while (1) {
        self.owner waittill("toggle_view");
        var_b929075ec07dce71++;
        if (var_b929075ec07dce71 == 2) {
            self.owner _shellshock("killstreak_veh_camera_mp", "top", self.lifetime, 0);
            var_a6f4657e2f8d1d39 = "first_person_hud_on";
        } else if (var_b929075ec07dce71 > 2) {
            self.owner _stopshellshock();
            var_b929075ec07dce71 = 1;
            var_a6f4657e2f8d1d39 = "third_person_hud_on";
        }
        self.owner.previousremotetankviewstate = var_b929075ec07dce71;
        self.owner _setvisibiilityomnvarforkillstreak(self.streakinfo.streakname, var_a6f4657e2f8d1d39);
        self.owner setclientomnvar("ui_pac_sentry_controls", var_b929075ec07dce71);
    }
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b54
// Size: 0x56
function function_865318fe12d890e8() {
    var_ed6f9375a4009de4 = self.owner;
    var_ed6f9375a4009de4 endon("disconnect");
    level endon("game_ended");
    var_ed6f9375a4009de4 notify("tank_reset_viewState");
    var_ed6f9375a4009de4 endon("tank_reset_viewState");
    var_ed6f9375a4009de4 waittill("death");
    if (isdefined(var_ed6f9375a4009de4.previousremotetankviewstate)) {
        var_ed6f9375a4009de4.previousremotetankviewstate = undefined;
    }
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bb1
// Size: 0x21
function function_8cba478f80e8ac72(remotetank) {
    remotetank function_5226227bce83ebe9(3, remotetank.team);
    return remotetank;
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bda
// Size: 0x104
function function_876be54dd49f69a9(data) {
    self endon("death");
    self.owner endon("disconnect");
    self notify("remoteTanke_dronegun_emp_start");
    self endon("remoteTanke_dronegun_emp_start");
    if (!isdefined(self.owner)) {
        return;
    }
    if (isdefined(data.attacker)) {
        data.attacker thread namespace_48a08c5037514e04::doscoreevent(#"emped_killstreak");
    }
    self.var_158f2fb396c0cccb = 1;
    self.var_195cf5a953ae9265 = 1;
    if (istrue(self.ispiloted)) {
        function_db443c859c55e450(1);
    }
    self vehicle_turnengineoff();
    if (isplayer(self.owner)) {
        thread namespace_5a51aa78ea0b1b9f::function_9d31a370d60f86da(self.owner, 4);
    }
    childthread function_6f35c67c1d78b1d5();
    wait(4);
    self vehicle_turnengineon();
    self.var_158f2fb396c0cccb = 0;
    if (istrue(self.ispiloted)) {
        function_db443c859c55e450(0);
    }
    self.var_195cf5a953ae9265 = undefined;
    self notify("dronegun_emp_cleared");
}

// Namespace remotetank/namespace_6ca1587edcca0018
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ce5
// Size: 0x30
function function_6f35c67c1d78b1d5() {
    self endon("death");
    self endon("dronegun_emp_cleared");
    self.owner endon("disconnect");
    self waittill("driver_exited");
    self notify("dronegun_emp_cleared");
}

