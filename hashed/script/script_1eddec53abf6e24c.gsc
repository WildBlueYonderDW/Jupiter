// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\dialog_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_5323b44ee395058;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\cp_mp\killstreaks\airstrike.gsc;
#using scripts\common\anim.gsc;
#using scripts\cp_mp\hostmigration.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\cp_mp\killstreaks\chopper_support.gsc;

#namespace hover_jet;

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc11
// Size: 0xf3
function init() {
    if (issharedfuncdefined("hover_jet", "init")) {
        [[ getsharedfunc("hover_jet", "init") ]]();
    }
    /#
        bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["playKillstreakDeployDialog"];
        if (isdefined(bundle)) {
            setdevdvarifuninitialized(@"hash_66bec5bd52437caf", ter_op(isdefined(bundle), bundle.lifetime, 45));
        } else {
            setdevdvarifuninitialized(@"hash_66bec5bd52437caf", 45);
        }
        setdevdvarifuninitialized(@"hash_48714771f0d0b941", 0);
        setdevdvarifuninitialized(@"hash_de4ffc2e910521a1", 0);
        setdevdvarifuninitialized(@"hash_125a1951df8627f5", 0);
        setdevdvarifuninitialized(@"hash_92fce2b3a811a13f", 0);
        setdevdvarifuninitialized(@"hash_8ef299ce102da922", 3);
    #/
    function_3775988f960ec3e6();
    init_hover_jet_anims();
    init_hover_jet_vo();
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd0b
// Size: 0x71
function function_3775988f960ec3e6() {
    level.hoverjets = [];
    level.incomingallhoverjets = 0;
    foreach (teamname in level.teamnamelist) {
        level.incominghoverjets[teamname] = 0;
    }
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd83
// Size: 0x7f
function init_hover_jet_anims() {
    level.scr_anim["hover_jet"]["airstrike_flyby_loop"] = mp_vehicles_always_loaded%mp_halfa_flyin;
    level.scr_anim["hover_jet"]["airstrike_flyby_bank"] = mp_vehicles_always_loaded%iw9_mp_halfa_strike_01;
    level.scr_anim["hover_jet"]["airstrike_flyby_straight"] = mp_vehicles_always_loaded%iw9_mp_halfa_strike_02;
    level.scr_anim["hover_jet"]["exit"] = mp_vehicles_always_loaded%mp_halfa_exit;
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe09
// Size: 0x7f
function init_hover_jet_vo() {
    game["dialog"]["hover_jet" + "_use"] = "killstreak_remote_operator" + "_request_response";
    game["dialog"]["hover_jet" + "_leave"] = "killstreak_remote_operator" + "_leave";
    game["dialog"]["hover_jet" + "_crash"] = "killstreak_remote_operator" + "_crash";
    game["dialog"]["hover_jet" + "_confirm"] = "killstreak_remote_operator" + "_confirm_general";
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe8f
// Size: 0x3a
function weapongivenhoverjet(streakinfo) {
    if (issharedfuncdefined("killstreak", "startMapSelectSequence")) {
        self [[ getsharedfunc("killstreak", "startMapSelectSequence") ]](undefined, undefined, undefined, undefined, streakinfo);
    }
    return 1;
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xed1
// Size: 0x21
function tryusehoverjet() {
    streakinfo = createstreakinfo("hover_jet", self);
    return tryusehoverjetfromstruct(streakinfo);
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xefa
// Size: 0x1c9
function tryusehoverjetfromstruct(streakinfo) {
    team = self.team;
    if (!namespace_f64231d5b7a2c3c4::reservevehicle()) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/AIR_SPACE_TOO_CROWDED");
        }
        return 0;
    }
    level.incomingallhoverjets++;
    var_f2efed389ae42a3c = 1;
    if (islargemap()) {
        var_f2efed389ae42a3c = 2;
    }
    if (level.hoverjets.size >= var_f2efed389ae42a3c || level.hoverjets.size + level.incomingallhoverjets > var_f2efed389ae42a3c) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/AIR_SPACE_TOO_CROWDED");
        }
        level.incomingallhoverjets--;
        namespace_f64231d5b7a2c3c4::clearvehiclereservation();
        return 0;
    }
    if (islargemap() && level.teambased) {
        var_f8dbaa792bfd1c9f = 1;
        level.incominghoverjets[team]++;
        if (getnumactivekillstreakperteam(team, level.hoverjets) + level.incominghoverjets[team] > var_f8dbaa792bfd1c9f) {
            level.incomingallhoverjets--;
            level.incominghoverjets[team]--;
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/MAX_FRIENDLY_VTOL_JET");
            }
            namespace_f64231d5b7a2c3c4::clearvehiclereservation();
            return 0;
        }
    }
    result = _tryusehoverjetfromstructinternal(streakinfo);
    level.incomingallhoverjets--;
    if (islargemap() && level.teambased) {
        level.incominghoverjets[team]--;
    }
    if (!istrue(result)) {
        namespace_f64231d5b7a2c3c4::clearvehiclereservation();
        return 0;
    }
    return 1;
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10cb
// Size: 0x1bc
function _tryusehoverjetfromstructinternal(streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return 0;
        }
    }
    var_9b1deb5e9d32bbe3 = namespace_b3d24e921998a8b::streakdeploy_doweaponswitchdeploy(streakinfo, makeweapon("ks_remote_map_mp"), 1, &weapongivenhoverjet);
    if (!istrue(var_9b1deb5e9d32bbe3)) {
        return 0;
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            return 0;
        }
    }
    self playlocalsound("iw9_ks_tablet_ui_screen_plr");
    mappointinfo = undefined;
    if (issharedfuncdefined("killstreak", "getSelectMapPoint")) {
        mappointinfo = self [[ getsharedfunc("killstreak", "getSelectMapPoint") ]](streakinfo, 1);
        self playlocalsound("iw9_ks_tablet_ui_select_final_plr");
    }
    streakinfo.owner notify("killstreak_deploy_finished", streakinfo.streakname);
    if (!isdefined(mappointinfo)) {
        return 0;
    }
    streakinfo notify("killstreak_finished_with_deploy_weapon");
    thread starthoverjetairstrikepass(self, streakinfo, mappointinfo);
    var_52a5be2e2f91d710 = undefined;
    if (issharedfuncdefined("sound", "playKillstreakDeployDialog")) {
        [[ getsharedfunc("sound", "playKillstreakDeployDialog") ]](self, streakinfo.streakname);
        var_52a5be2e2f91d710 = 2.5;
    }
    thread playkillstreakoperatordialog("hover_jet", "hover_jet" + "_use", 1, var_52a5be2e2f91d710);
    utility::trycall(level.matchdata_logkillstreakevent, "hover_jet", self.origin);
    if (issharedfuncdefined("hud", "teamPlayerCardSplash")) {
        self thread [[ getsharedfunc("hud", "teamPlayerCardSplash") ]]("used_" + "hover_jet", self);
    }
    return 1;
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x128f
// Size: 0xb2c
function starthoverjetairstrikepass(owner, streakinfo, mappointinfo) {
    if (isdefined(level.var_b67b5f9dfe488c2f)) {
        thread [[ level.var_b67b5f9dfe488c2f ]](streakinfo);
    }
    level endon("game_ended");
    var_5fa1e1697a302583 = namespace_9abe40d2af041eb2::getkillstreakairstrikeheightent();
    planehalfdistance = 24000;
    var_23122e7b902f2ea9 = 6500;
    planeflyheight = 3250;
    var_67751d5d1646a2ae = 1000;
    heightoffset = (0, 0, 0);
    var_361663d437db22f5 = 1500;
    direction = owner.angles;
    var_505331ad630bbc6b = 1;
    if (isdefined(var_5fa1e1697a302583)) {
        planeflyheight = var_5fa1e1697a302583.origin[2] + 750;
    }
    localeid = namespace_36f464722d326bbe::getlocaleid();
    if (isdefined(localeid) && localeid == "locale_6") {
        planeflyheight = planeflyheight + 500;
    }
    /#
        var_5ceb15b939485b52 = getdvarint(@"hash_698613e6c8c52243", 0);
        planeflyheight = planeflyheight + var_5ceb15b939485b52;
    #/
    maplocation = mappointinfo[0].location;
    direction = namespace_203b58a09d020a50::callstrike_findoptimaldirection(owner, maplocation, planeflyheight, planehalfdistance);
    flightpath = namespace_203b58a09d020a50::getflightpath(maplocation, direction, planehalfdistance, var_5fa1e1697a302583, planeflyheight, var_23122e7b902f2ea9, var_361663d437db22f5, streakinfo.streakname, var_505331ad630bbc6b);
    pathstart = flightpath["startPoint"];
    pathgoal = flightpath["endPoint"];
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["hover_jet"];
    if (!isdefined(bundle)) {
        bundle = spawnstruct();
        bundle.lifetime = 60;
        bundle.maxhealth = 2500;
        bundle.var_4a029944039d94bc = 1;
    }
    var_2ed1737d09c74b75 = "veh9_mil_air_halfa_mp";
    namespace_f64231d5b7a2c3c4::clearvehiclereservation();
    var_28f8f60414dfb888 = namespace_f64231d5b7a2c3c4::_spawnhelicopter(undefined, pathstart, direction, "veh_hover_jet_mp_phys", var_2ed1737d09c74b75);
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        var_28f8f60414dfb888 [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_b5a9a3ea21b6ea62);
    }
    if (!isdefined(var_28f8f60414dfb888)) {
        return;
    }
    var_ef771a7a6ca753fb = bundle.lifetime;
    /#
        var_ebbe5c4d79905b3d = getdvarint(@"hash_66bec5bd52437caf", bundle.lifetime);
        var_2a98d1683cf44153 = getdvarint(@"hash_2c01d701bac5d9d3", 0);
        if (var_2a98d1683cf44153) {
            var_ebbe5c4d79905b3d = 9999;
        }
        var_ef771a7a6ca753fb = var_ebbe5c4d79905b3d;
    #/
    var_28f8f60414dfb888.speed = 250;
    var_28f8f60414dfb888.accel = 175;
    var_28f8f60414dfb888.health = bundle.maxhealth;
    var_28f8f60414dfb888.maxhealth = bundle.maxhealth;
    var_28f8f60414dfb888.currenthealth = bundle.maxhealth;
    var_28f8f60414dfb888.angles = vectortoangles(direction);
    var_28f8f60414dfb888.lifetime = var_ef771a7a6ca753fb;
    var_28f8f60414dfb888.team = owner.team;
    var_28f8f60414dfb888.owner = owner;
    var_28f8f60414dfb888.streakinfo = streakinfo;
    var_28f8f60414dfb888.streakname = streakinfo.streakname;
    var_28f8f60414dfb888.flaresreservecount = bundle.var_4a029944039d94bc;
    var_28f8f60414dfb888.returngoal = maplocation;
    var_28f8f60414dfb888.flyheight = planeflyheight;
    var_28f8f60414dfb888.hoverheight = var_67751d5d1646a2ae;
    var_28f8f60414dfb888.missiles = 6;
    var_28f8f60414dfb888.pers["team"] = var_28f8f60414dfb888.team;
    var_28f8f60414dfb888.bestgroundtarget = undefined;
    var_28f8f60414dfb888.bestairtarget = undefined;
    var_28f8f60414dfb888.flightdir = flightpath["directionAngles"];
    var_28f8f60414dfb888 setmaxpitchroll(0, 90);
    var_28f8f60414dfb888 vehicle_setspeed(var_28f8f60414dfb888.speed, var_28f8f60414dfb888.accel);
    var_28f8f60414dfb888 sethoverparams(50, 100, 50);
    var_28f8f60414dfb888 setturningability(0.05);
    var_28f8f60414dfb888 setyawspeed(45, 25, 25, 0.5);
    var_28f8f60414dfb888 setotherent(var_28f8f60414dfb888.owner);
    var_28f8f60414dfb888 setcandamage(1);
    var_28f8f60414dfb888 setneargoalnotifydist(700);
    var_28f8f60414dfb888 setvehicleteam(var_28f8f60414dfb888.team);
    var_28f8f60414dfb888 function_247ad6a91f6a4ffe(1);
    level thread function_ee93617532d8a679(var_28f8f60414dfb888, owner, &hoverjet_explode);
    var_28f8f60414dfb888 setscriptablepartstate("blinking_lights", "on", 0);
    var_28f8f60414dfb888 setscriptablepartstate("thrusters", "active", 0);
    var_28f8f60414dfb888 setscriptablepartstate("contrails", "on", 0);
    var_28f8f60414dfb888.turret = spawnturret("misc_turret", var_28f8f60414dfb888 gettagorigin("tag_turret"), "hover_jet_turret_ballistics_mp");
    var_28f8f60414dfb888.turret setmodel("veh9_mil_air_halfa_turret");
    var_28f8f60414dfb888.turret.owner = var_28f8f60414dfb888.owner;
    var_28f8f60414dfb888.turret.team = var_28f8f60414dfb888.team;
    var_28f8f60414dfb888.turret.angles = var_28f8f60414dfb888.angles;
    var_28f8f60414dfb888.turret.streakinfo = streakinfo;
    var_28f8f60414dfb888.turret linkto(var_28f8f60414dfb888, "tag_turret", (0, 0, 5), (0, 0, 0));
    var_28f8f60414dfb888.turret setturretteam(var_28f8f60414dfb888.team);
    var_28f8f60414dfb888.turret setturretmodechangewait(0);
    var_28f8f60414dfb888.turret setmode("manual_target");
    var_28f8f60414dfb888.turret setsentryowner(var_28f8f60414dfb888.owner);
    var_28f8f60414dfb888.turret setdefaultdroppitch(45);
    var_28f8f60414dfb888.turret maketurretinoperable();
    var_28f8f60414dfb888.turret setleftarc(360);
    var_28f8f60414dfb888.turret setrightarc(360);
    var_28f8f60414dfb888.turret setbottomarc(90);
    var_28f8f60414dfb888.turret settoparc(90);
    var_28f8f60414dfb888.turret setconvergencetime(0.5, "pitch");
    var_28f8f60414dfb888.turret setconvergencetime(0.5, "yaw");
    var_28f8f60414dfb888.turret setconvergenceheightpercent(0.65);
    var_28f8f60414dfb888.killcament = spawn("script_model", var_28f8f60414dfb888.turret gettagorigin("bi_center"));
    var_28f8f60414dfb888.killcament linkto(var_28f8f60414dfb888, "tag_origin", (-500, 0, 500), (0, 0, 0));
    var_28f8f60414dfb888.turret.killcament = var_28f8f60414dfb888.killcament;
    var_28f8f60414dfb888.turret.groundtargetent = spawn("script_model", var_28f8f60414dfb888.origin);
    var_28f8f60414dfb888.turret.groundtargetent setmodel("tag_origin");
    var_28f8f60414dfb888.turret.groundtargetent dontinterpolate();
    level.hoverjets[level.hoverjets.size] = var_28f8f60414dfb888;
    level notify("vtol_jet_arrived");
    if (issharedfuncdefined("killstreak", "addToActiveKillstreakList")) {
        var_28f8f60414dfb888 [[ getsharedfunc("killstreak", "addToActiveKillstreakList") ]](streakinfo.streakname, "Killstreak_Air", owner, 0, 1, 100);
    }
    var_28f8f60414dfb888.animname = streakinfo.streakname;
    var_28f8f60414dfb888.scenenode = spawn("script_model", var_28f8f60414dfb888.returngoal * (1, 1, 0) + (0, 0, planeflyheight));
    var_28f8f60414dfb888.scenenode.angles = var_28f8f60414dfb888.angles;
    var_28f8f60414dfb888.scenenode setmodel("tag_origin");
    var_28f8f60414dfb888 function_fbda9177c810ff24(maplocation);
    /#
        var_671b9cb2b0e5d795 = getdvarint(@"hash_920f0586653a26d4", 0);
        if (isdefined(var_671b9cb2b0e5d795) && var_671b9cb2b0e5d795) {
            var_28f8f60414dfb888 thread namespace_203b58a09d020a50::function_fc41f67ef33c00b0(pathstart, pathgoal, (1, 1, 1), 20);
            var_28f8f60414dfb888 thread namespace_203b58a09d020a50::function_aca0ec4cab6e6319(planeflyheight, pathgoal);
            sphere(var_28f8f60414dfb888.scenenode.origin, 100, (1, 0, 1), 0, 500);
        }
    #/
    if (iscp()) {
        var_28f8f60414dfb888.turret makeentitysentient("allies");
        if (!threatbiasgroupexists("Killstreak_VTOL_MG")) {
            createthreatbiasgroup("Killstreak_VTOL_MG");
        }
        var_28f8f60414dfb888.turret setthreatbiasgroup("Killstreak_VTOL_MG");
        setthreatbiasagainstall("Killstreak_VTOL_MG", 3000);
    }
    var_28f8f60414dfb888 hoverjet_playflyfx();
    var_c51de0af53e40876 = function_9f6c5e46080e47dc();
    var_9bc4a52a93594ddd = getanimlength(level.scr_anim[var_28f8f60414dfb888.animname][var_c51de0af53e40876]);
    var_2e44aa5689f2db63 = get_notetrack_time(level.scr_anim[var_28f8f60414dfb888.animname][var_c51de0af53e40876], "contrail_off");
    var_28f8f60414dfb888.scenenode thread namespace_bc4a4b9456315863::anim_single_solo(var_28f8f60414dfb888, var_c51de0af53e40876);
    var_28f8f60414dfb888 thread hoverjet_delaysetscriptable(var_2e44aa5689f2db63, "contrails", "off");
    var_28f8f60414dfb888 thread hoverjet_watchgameend();
    if (issharedfuncdefined("hover_jet", "registerSentient")) {
        var_28f8f60414dfb888 [[ getsharedfunc("hover_jet", "registerSentient") ]]("Killstreak_Air", self);
    }
    var_28f8f60414dfb888 function_58258fda8ee98d76(streakinfo.streakname);
    if (issharedfuncdefined("flares", "handleIncomingStinger")) {
        var_28f8f60414dfb888 thread [[ getsharedfunc("flares", "handleIncomingStinger") ]](&hoverjet_handlemissiledetection);
    }
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_9bc4a52a93594ddd);
    /#
        level notify("emp");
    #/
    if (!isdefined(var_28f8f60414dfb888)) {
        return;
    }
    if (isdefined(var_28f8f60414dfb888.scenenode)) {
        var_28f8f60414dfb888.scenenode delete();
    }
    var_28f8f60414dfb888 starthoverjetdefend(streakinfo);
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dc2
// Size: 0x43
function hoverjet_delaysetscriptable(delaytime, part, state) {
    self endon("death");
    self endon("crashing");
    level endon("game_ended");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(delaytime);
    self setscriptablepartstate(part, state, 0);
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e0c
// Size: 0x33
function hoverjet_playflyfx() {
    thread delaythread(0.05, &hoverjet_playapproachfx);
    thread delaythread(6, &hoverjet_playflybyfx);
    thread delaythread(14, &hoverjet_playreturnfx);
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e46
// Size: 0x2d
function hoverjet_playapproachfx() {
    if (getgametype() == "wm") {
        self playsoundonmovingent("ks_wm_hoverjet_approach");
    } else {
        self playsoundonmovingent("ks_hoverjet_approach");
    }
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e7a
// Size: 0x40
function hoverjet_playflybyfx() {
    if (getgametype() == "wm" && level.mapname == "mp_jup_skydiving") {
        self playsoundonmovingent("ks_wm_hoverjet_flyby");
    } else {
        self playsoundonmovingent("ks_hoverjet_flyby");
    }
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ec1
// Size: 0x40
function hoverjet_playreturnfx() {
    if (getgametype() == "wm" && level.mapname == "mp_jup_skydiving") {
        self playsoundonmovingent("ks_wm_hoverjet_return");
    } else {
        self playsoundonmovingent("ks_hoverjet_return");
    }
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f08
// Size: 0x3b
function function_fbda9177c810ff24(var_7b59b41b01684053) {
    var_caeb7635e74ead06 = getdvarint(@"hash_8ef299ce102da922", 3);
    thread function_41780f288d860974(var_7b59b41b01684053, var_caeb7635e74ead06);
    thread function_f42c29a91cabc8c2(var_7b59b41b01684053, var_caeb7635e74ead06);
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f4a
// Size: 0x47c
function function_41780f288d860974(var_7b59b41b01684053, var_caeb7635e74ead06) {
    self endon("death");
    self endon("crashing");
    level endon("game_ended");
    if (var_caeb7635e74ead06 != 0) {
        return;
    }
    var_c51de0af53e40876 = function_9f6c5e46080e47dc();
    var_7b00721e9d1ef2a0 = get_notetrack_time(level.scr_anim["hover_jet"][var_c51de0af53e40876], "attack");
    var_26689f6158b948aa = var_7b00721e9d1ef2a0 - 4;
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_26689f6158b948aa);
    content = [0:"physicscontents_clipshot", 1:"physicscontents_missileclip", 2:"physicscontents_solid"];
    contentoverride = physics_createcontents(content);
    var_ebeaa9648906468 = self.angles * (0, 1, 0);
    var_6c5ceed9b00eb7d5 = anglestoforward(var_ebeaa9648906468);
    var_5cc1d6dd55c49e3a = anglestoright(var_ebeaa9648906468);
    var_ae87376418450660 = [0:var_7b59b41b01684053 - var_6c5ceed9b00eb7d5 * 2250 + var_5cc1d6dd55c49e3a * 750, 1:var_7b59b41b01684053 - var_6c5ceed9b00eb7d5 * 1500 - var_5cc1d6dd55c49e3a * 750, 2:var_7b59b41b01684053 - var_6c5ceed9b00eb7d5 * 750 + var_5cc1d6dd55c49e3a * 250, 3:var_7b59b41b01684053 - var_5cc1d6dd55c49e3a * 250, 4:var_7b59b41b01684053 + var_6c5ceed9b00eb7d5 * 750 + var_5cc1d6dd55c49e3a * 750, 5:var_7b59b41b01684053 + var_6c5ceed9b00eb7d5 * 1500 - var_5cc1d6dd55c49e3a * 750, 6:var_7b59b41b01684053 + var_6c5ceed9b00eb7d5 * 2250 + var_5cc1d6dd55c49e3a * 250, 7:var_7b59b41b01684053 + var_6c5ceed9b00eb7d5 * 3000 - var_5cc1d6dd55c49e3a * 250];
    var_c0c290150bfe81b7 = [0:"tag_right_aphid_missile", 1:"tag_left_aphid_missile", 2:"tag_right_archer_missile", 3:"tag_left_archer_missile"];
    var_43cf5d2a3c531d4b = 0;
    var_c2e32ae249aa7753 = [];
    foreach (index, location in var_ae87376418450660) {
        starttrace = location + (0, 0, 10000);
        endtrace = location - (0, 0, 10000);
        var_369dc9ed4c0ec3f5 = ray_trace(starttrace, endtrace, level.characters, contentoverride);
        enemies = utility::playersinsphere(var_369dc9ed4c0ec3f5["position"], 1000);
        missiletarget = hoverjet_findmissiletarget(enemies, var_c2e32ae249aa7753);
        var_2c990b843ba28448 = self gettagorigin(var_c0c290150bfe81b7[var_43cf5d2a3c531d4b]) + anglestoforward(self gettagangles(var_c0c290150bfe81b7[var_43cf5d2a3c531d4b])) * 300;
        missile = _magicbullet(makeweapon("hover_jet_proj_mp"), var_2c990b843ba28448, var_369dc9ed4c0ec3f5["position"], self.owner);
        missile.killcament = spawn("script_model", missile.origin);
        missile.killcament linkto(missile, "tag_origin", (-100, 0, 500), (0, 0, 0));
        missile.killcament thread hoverjet_missilekillcammove(var_369dc9ed4c0ec3f5["position"], missile.angles);
        missile.streakinfo = self.streakinfo;
        self.streakinfo.shots_fired++;
        thread hoverjet_firemissilescriptable(var_43cf5d2a3c531d4b + 1);
        if (isdefined(missiletarget)) {
            location = missiletarget.origin;
            var_c2e32ae249aa7753[var_c2e32ae249aa7753.size] = missiletarget;
            thread hoverjet_delaymissiletracking(missile, 0.05, missiletarget);
        }
        /#
            var_671b9cb2b0e5d795 = getdvarint(@"hash_920f0586653a26d4", 0);
            if (isdefined(var_671b9cb2b0e5d795) && var_671b9cb2b0e5d795) {
                self.owner iprintlnbold("script_model" + index + 1);
                if (isdefined(missiletarget)) {
                    sphere(location, 500, (0, 1, 0), 0, 1000);
                } else {
                    sphere(location, 500, (1, 0, 0), 0, 1000);
                }
            }
        #/
        wait(0.5);
        var_43cf5d2a3c531d4b++;
        if (var_43cf5d2a3c531d4b > var_c0c290150bfe81b7.size - 1) {
            var_43cf5d2a3c531d4b = 0;
        }
    }
    var_c2e32ae249aa7753 = undefined;
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23cd
// Size: 0x180
function function_f42c29a91cabc8c2(var_7b59b41b01684053, var_caeb7635e74ead06) {
    self endon("death");
    self endon("crashing");
    level endon("game_ended");
    if (var_caeb7635e74ead06 != 1 && var_caeb7635e74ead06 != 2 && var_caeb7635e74ead06 != 3) {
        return;
    }
    var_c13a68982f815dec = "attack";
    if (var_caeb7635e74ead06 == 1) {
        var_c13a68982f815dec = "attack_bomb";
    }
    var_c51de0af53e40876 = function_9f6c5e46080e47dc();
    var_56d62165cf89d99c = get_notetrack_time(level.scr_anim["hover_jet"][var_c51de0af53e40876], var_c13a68982f815dec);
    var_d7c48eccae06e020 = var_7b59b41b01684053 + self.flightdir * 500;
    /#
        var_671b9cb2b0e5d795 = getdvarint(@"hash_920f0586653a26d4", 0);
        if (istrue(var_671b9cb2b0e5d795)) {
            thread namespace_f2ffc0540883e1ad::drawsphere(var_7b59b41b01684053, 20, 20, (1, 1, 0));
        }
    #/
    wait(var_56d62165cf89d99c);
    sideoffset = 100;
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["hover_jet"];
    if (!isdefined(bundle)) {
        bundle = spawnstruct();
        bundle.var_c29b10f4c16e57f6 = 6;
    }
    for (i = 0; i < bundle.var_c29b10f4c16e57f6; i++) {
        function_2b7c965fb8b07829(var_d7c48eccae06e020, sideoffset);
        sideoffset = sideoffset * -1;
        wait(0.095);
    }
    /#
        thread function_3f69aefa7b90fb4a();
    #/
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2554
// Size: 0x1a1
function function_2b7c965fb8b07829(var_7b59b41b01684053, sideoffset) {
    if (!isdefined(sideoffset)) {
        sideoffset = 0;
    }
    var_921393d77069e4d2 = "hover_jet_bomb_mp";
    var_976a1708e3157766 = 10;
    var_735317d9303b68a7 = self.origin - anglestoright(self.angles) * sideoffset;
    var_8c9add3c0a2a7dc1 = var_735317d9303b68a7 - anglestoup(self.angles) * randomintrange(100, 300);
    var_67c9be17f01e1d77 = vectornormalize(var_7b59b41b01684053 - self.origin);
    var_5036600277a13160 = var_8c9add3c0a2a7dc1 + var_67c9be17f01e1d77 * distance(var_8c9add3c0a2a7dc1, var_7b59b41b01684053);
    var_afb697b9b1efc66a = var_5036600277a13160 - var_8c9add3c0a2a7dc1;
    if (namespace_3c37cb17ade254d::issharedfuncdefined("weapons", "_launchGrenade")) {
        bomb = self [[ namespace_3c37cb17ade254d::getsharedfunc("weapons", "_launchGrenade") ]](var_921393d77069e4d2, var_8c9add3c0a2a7dc1, var_afb697b9b1efc66a, var_976a1708e3157766);
        bomb.streakinfo = self.streakinfo;
        bomb.killcament = self.killcament;
        bomb thread function_d6c447fe14ce9a65();
    }
    /#
        var_671b9cb2b0e5d795 = getdvarint(@"hash_920f0586653a26d4", 0);
        if (istrue(var_671b9cb2b0e5d795)) {
            thread namespace_f2ffc0540883e1ad::drawsphere(var_8c9add3c0a2a7dc1, 20, 10, (0, 1, 0));
            thread namespace_f2ffc0540883e1ad::drawline(var_8c9add3c0a2a7dc1, var_5036600277a13160, 10, (1, 1, 1));
            thread namespace_f2ffc0540883e1ad::drawsphere(var_5036600277a13160, 20, 10, (1, 0, 0));
        }
    #/
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26fc
// Size: 0x44
function function_d6c447fe14ce9a65() {
    level endon("game_ended");
    position = self waittill("explode");
    if (issharedfuncdefined("shellshock", "artillery_earthQuake")) {
        [[ getsharedfunc("shellshock", "artillery_earthQuake") ]](position);
    }
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2747
// Size: 0x50
function hoverjet_missilekillcammove(var_f30b80168ef340e4, var_d0b12377bc0ec26f) {
    self endon("death");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(2);
    self unlink();
    self moveto(var_f30b80168ef340e4 - anglestoforward(var_d0b12377bc0ec26f) * 750, 6);
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(7);
    self delete();
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x279e
// Size: 0x4e
function hoverjet_firemissilescriptable(var_1600845f933938d5) {
    self endon("death");
    level endon("game_ended");
    self setscriptablepartstate("fire_missile_" + var_1600845f933938d5, "on", 0);
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(0.5);
    self setscriptablepartstate("fire_missile_" + var_1600845f933938d5, "off", 0);
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27f3
// Size: 0xe4
function hoverjet_findmissiletarget(targets, var_fb3ad4ba40f6988a) {
    var_d172b4330e232920 = undefined;
    foreach (target in targets) {
        if (level.teambased && target.team == self.team) {
            continue;
        }
        if (target == self.owner) {
            continue;
        }
        if (array_contains(var_fb3ad4ba40f6988a, target)) {
            continue;
        }
        if (issharedfuncdefined("perk", "hasPerk")) {
            jumpiffalse(target [[ getsharedfunc("perk", "hasPerk") ]]("specialty_blindeye")) LOC_000000c9;
        } else {
        LOC_000000c9:
            var_d172b4330e232920 = target;
            break;
        }
    }
    return var_d172b4330e232920;
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28df
// Size: 0x4c
function hoverjet_delaymissiletracking(missile, delaytime, var_d0792a7d1412666f) {
    self endon("death");
    level endon("game_ended");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(delaytime);
    if (isdefined(missile)) {
        missile missile_settargetent(var_d0792a7d1412666f, (0, 0, 10));
    }
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2932
// Size: 0x45
function hoverjet_delayresetscriptable(var_47a4179a1eedcff8) {
    self endon("death");
    level endon("game_ended");
    self setscriptablepartstate("explode" + var_47a4179a1eedcff8, "active", 0);
    wait(1);
    self setscriptablepartstate("explode" + var_47a4179a1eedcff8, "neutral", 0);
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x297e
// Size: 0x31
function starthoverjetdefend(streakinfo) {
    thread hoverjet_defendlocation(self.returngoal);
    /#
        thread function_9480f8b8d48d0f59(self.owner);
    #/
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29b6
// Size: 0x6f
function hoverjet_defendlocation(var_28b401c980c645ae) {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    level endon("game_ended");
    if (self vehicle_isphysveh()) {
        self stopanimscripted();
        self vehphys_setdefaultmotion();
    }
    thread hoverjet_watchlifetime(self.lifetime);
    thread hoverjet_watchowner();
    thread hoverjet_startcombatlogic();
    wait(0.05);
    thread hoverjet_movetolocation(var_28b401c980c645ae);
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a2c
// Size: 0x132
function hoverjet_handlemissiledetection(player, var_82fd3ee8fbace30e, missiletarget, var_5991f0e5da9f9bd5) {
    self endon("death");
    missiletarget endon("death");
    missiletarget endon("crashing");
    level endon("game_ended");
    while (1) {
        if (!isdefined(missiletarget)) {
            break;
        }
        center = missiletarget getpointinbounds(0, 0, 0);
        curdist = distance(self.origin, center);
        if (curdist < 4000 && missiletarget.flaresreservecount > 0) {
            if (issharedfuncdefined("flares", "reduceReserves")) {
                [[ getsharedfunc("flares", "reduceReserves") ]](missiletarget);
            }
            if (issharedfuncdefined("flares", "playFx")) {
                missiletarget thread [[ getsharedfunc("flares", "playFx") ]]("jet_flares", var_5991f0e5da9f9bd5);
            }
            newtarget = undefined;
            if (issharedfuncdefined("flares", "deploy")) {
                newtarget = missiletarget [[ getsharedfunc("flares", "deploy") ]]();
            }
            self missile_settargetent(newtarget);
            self notify("missile_pairedWithFlare");
            return;
        }
        waitframe();
    }
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b65
// Size: 0x8c
function hoverjet_watchlifetime(lifetime) {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    level endon("game_ended");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(lifetime);
    /#
        var_671b9cb2b0e5d795 = getdvarint(@"hash_920f0586653a26d4", 0);
        if (isdefined(var_671b9cb2b0e5d795) && var_671b9cb2b0e5d795) {
            self.owner iprintlnbold("shellshock");
        }
    #/
    playkillstreakoperatordialog("hover_jet", "hover_jet" + "_leave", 1);
    thread hoverjet_leave();
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bf8
// Size: 0x3e
function hoverjet_watchgameend() {
    self endon("death");
    level waittill("game_ended");
    self.recordedgameendstats = 1;
    self.owner namespace_9abe40d2af041eb2::recordkillstreakendstats(self.streakinfo);
    thread hoverjet_leave();
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c3d
// Size: 0x39
function hoverjet_watchowner() {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    level endon("game_ended");
    thread hoverjet_leaveonownernotify("disconnect");
    thread hoverjet_leaveonownernotify("joined_team");
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c7d
// Size: 0x3c
function hoverjet_leaveonownernotify(var_70687e0cc558a009) {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    level endon("game_ended");
    self.owner waittill(var_70687e0cc558a009);
    thread hoverjet_leave();
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cc0
// Size: 0x76
function hoverjet_startcombatlogic() {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    level endon("game_ended");
    self setmaxpitchroll(15, 15);
    self vehicle_setspeed(45, 10);
    thread hoverjet_watchforreposition();
    thread hoverjet_engagegroundtargets();
    if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
        self.owner setclientomnvar("ui_using_hover_jet", 1);
    }
    self setscriptablepartstate("thrusters", "idle", 0);
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d3d
// Size: 0x1b6
function hoverjet_movetolocation(location) {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    level endon("game_ended");
    ignorelist = [0:self, 1:self.turret];
    while (1) {
        currentpos = self.origin;
        var_2eca7b12d2ee27ba = location * (1, 1, 0) + (0, 0, self.origin[2]);
        var_691aa1d5da533612 = sphere_trace(currentpos, var_2eca7b12d2ee27ba, 256, ignorelist);
        var_158f8e4d0e511638 = 0;
        goalx = location[0];
        goaly = location[1];
        if (isdefined(var_691aa1d5da533612)) {
            if (var_691aa1d5da533612["hittype"] != "hittype_none") {
                goalx = var_691aa1d5da533612["position"][0];
                goaly = var_691aa1d5da533612["position"][1];
                var_158f8e4d0e511638 = 1;
            }
        }
        var_ed2239151283c790 = hoverjet_getcorrectheight(goalx, goaly, 20);
        newpos = (goalx, goaly, var_ed2239151283c790);
        self setvehgoalpos(newpos, 1);
        /#
            var_671b9cb2b0e5d795 = getdvarint(@"hash_920f0586653a26d4", 0);
            if (istrue(var_671b9cb2b0e5d795)) {
                thread namespace_f2ffc0540883e1ad::drawline(self.origin, newpos, 20, (1, 1, 1));
                thread namespace_f2ffc0540883e1ad::drawsphere(newpos, 20, 20, (1, 0, 0));
            }
        #/
        self waittill("near_goal");
        if (!istrue(var_158f8e4d0e511638)) {
            self.currentguardlocation = newpos;
            self notify("hoverJet_moveToNewlocation", newpos);
            break;
        }
    }
    self clearlookatent();
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2efa
// Size: 0x7f
function hoverjet_getcorrectheight(x, y, rand) {
    var_dc8bb6300463cf1e = self.hoverheight;
    /#
        var_8b2cb9f843e54ad0 = getdvarint(@"hash_92fce2b3a811a13f", 0);
        var_dc8bb6300463cf1e = var_dc8bb6300463cf1e + var_8b2cb9f843e54ad0;
    #/
    var_e7a7d619f927d791 = hoverjet_tracegroundpoint(x, y);
    var_1dc672cfe0f0128e = var_e7a7d619f927d791 + var_dc8bb6300463cf1e;
    var_1dc672cfe0f0128e = var_1dc672cfe0f0128e + randomint(rand);
    return var_1dc672cfe0f0128e;
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f81
// Size: 0xd1
function hoverjet_tracegroundpoint(x, y) {
    self endon("death");
    self endon("acquiringTarget");
    self endon("leaving");
    z = -99999;
    var_e531afbe1391f499 = self.origin[2];
    minz = level.averagealliesz;
    contentoverride = create_contents(0, 1, 1, 1, 1, 0, 0, 0, 0);
    var_e96577032a7740fc = sphere_trace((x, y, var_e531afbe1391f499), (x, y, z), 512, self, contentoverride, 1);
    if (var_e96577032a7740fc["position"][2] < minz) {
        var_fa83e3a4c4e6902 = minz;
    } else {
        var_fa83e3a4c4e6902 = var_e96577032a7740fc["position"][2];
    }
    return var_fa83e3a4c4e6902;
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x305a
// Size: 0x185
function hoverjet_engagegroundtargets() {
    self notify("engageGround");
    self endon("engageGround");
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    level endon("game_ended");
    thread function_7cad88468df8256e();
    while (1) {
        var_97e45ab250562d16 = undefined;
        if (!isdefined(self.bestgroundtarget)) {
            var_8b9f24ff1c0d7822 = undefined;
            var_1833609413f67de7 = undefined;
            var_1c58dd8c5ca65897 = undefined;
            if (utility::iscp()) {
                var_8b9f24ff1c0d7822 = "allies";
                var_1833609413f67de7 = 1;
                var_1c58dd8c5ca65897 = 1;
            }
            var_97e45ab250562d16 = function_770a14e56b03b067(self.turret, 3000, 1, 0, 0, undefined, @"hash_48714771f0d0b941", var_8b9f24ff1c0d7822, var_1833609413f67de7, var_1c58dd8c5ca65897);
            if (!isdefined(var_97e45ab250562d16)) {
                namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(0.25);
                continue;
            }
            self.bestgroundtarget = function_70b8756e9fc03c44(var_97e45ab250562d16);
            self notify("acquiringTarget", self.bestgroundtarget);
        }
        self.turret settargetentity(self.turret.groundtargetent);
        if (!isdefined(self.bestairtarget)) {
            self setlookatent(self.bestgroundtarget);
        }
        var_f14a9b1e9835aeaf = function_effebb9076efbdb(var_97e45ab250562d16);
        thread hoverjet_watchtargetstatus(self.bestgroundtarget);
        thread hoverjet_watchtargetlos(self.bestgroundtarget, undefined, var_f14a9b1e9835aeaf);
        thread hoverjet_watchtargettimeout(self.bestgroundtarget);
        hoverjet_fireongroundtarget(isdefined(var_f14a9b1e9835aeaf));
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(1);
    }
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31e6
// Size: 0x5e
function function_7cad88468df8256e() {
    self endon("death");
    level endon("game_ended");
    while (1) {
        projectile = self.turret waittill("missile_fire");
        projectile.streakinfo = self.streakinfo;
        projectile.killcament = self.killcament;
    }
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x324b
// Size: 0x1a4
function hoverjet_fireongroundtarget(targetvehicle) {
    firetime = weaponfiretime("hover_jet_turret_ballistics_mp");
    var_db0ea2c2c400255 = 0;
    var_dbc5aeb90480b355 = 0;
    var_b0b68854ae03b4d7 = 100;
    while (isdefined(self) && isdefined(self.bestgroundtarget) && !isdefined(self.iscrashing) && !isdefined(self.isleaving)) {
        if (self.turret hoverjet_turretlookingattarget()) {
            /#
                var_671b9cb2b0e5d795 = getdvarint(@"hash_920f0586653a26d4", 0);
                if (isdefined(var_671b9cb2b0e5d795) && var_671b9cb2b0e5d795) {
                    sphere(self.bestgroundtarget.origin, 20, (1, 0, 0), 0, 100);
                }
            #/
            var_de95d26a97999b92 = undefined;
            if (isdefined(targetvehicle)) {
                var_de95d26a97999b92 = self.bestgroundtarget.origin;
            } else {
                var_de95d26a97999b92 = self.bestgroundtarget gettagorigin("j_mainroot");
            }
            namespace_343543689c1d8859::choppersupport_setattackpoint(self.turret, self.bestgroundtarget, var_de95d26a97999b92, var_b0b68854ae03b4d7);
            if (var_dbc5aeb90480b355 == 0) {
                wait(0.1);
            }
            if (var_dbc5aeb90480b355 == 15) {
                var_b0b68854ae03b4d7 = 50;
            } else if (var_dbc5aeb90480b355 == 30) {
                var_b0b68854ae03b4d7 = undefined;
            }
            if (!istrue(self.var_d7b89e030dda87bf)) {
                self.turret shootturret("tag_flash");
                var_dbc5aeb90480b355++;
                self.turret.streakinfo.shots_fired++;
            }
        }
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(firetime);
    }
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33f6
// Size: 0x84
function hoverjet_turretlookingattarget() {
    var_97f0985016aa48cb = 0.996;
    var_929ad65d451ffc68 = anglestoforward(self gettagangles("tag_flash"));
    var_efa57adc48838f9b = vectornormalize(self.groundtargetent.origin - self.origin);
    var_ff53e400dd536b82 = vectordot(var_929ad65d451ffc68, var_efa57adc48838f9b);
    if (isdefined(self gettargetentity(1)) && var_ff53e400dd536b82 >= var_97f0985016aa48cb) {
        return 1;
    }
    return 0;
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3482
// Size: 0xc9
function hoverjet_engageairtargets() {
    self notify("engageAir");
    self endon("engageAir");
    self endon("death");
    self endon("leaving");
    level endon("game_ended");
    while (1) {
        if (!isdefined(self.bestairtarget)) {
            var_18603c41332bf068 = [];
            var_18603c41332bf068 = array_combine(level.helis, level.littlebirds, level.supportdrones);
            self.bestairtarget = hoverjet_getbestairtarget(var_18603c41332bf068);
            self notify("hoverJet_acquiringAirTarget", self.bestairtarget);
            if (!isdefined(self.bestairtarget)) {
                namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(0.5);
                continue;
            }
        }
        thread hoverjet_watchtargetstatus(self.bestairtarget);
        hoverjet_fireonairtarget();
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(1);
    }
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3552
// Size: 0x236
function hoverjet_fireonairtarget() {
    var_c42e4efdf5e20e14 = "right";
    var_b144b7d889960d44 = makeweapon("hover_jet_proj_mp");
    var_52aefeef79e2902d = undefined;
    self setlookatent(self.bestairtarget);
    while (isdefined(self) && isdefined(self.bestairtarget)) {
        var_ecbf90442e065a5f = 5;
        if (!istrue(var_52aefeef79e2902d)) {
            var_52aefeef79e2902d = 1;
        }
        while (var_ecbf90442e065a5f > 0 && isdefined(self.bestairtarget) && !hoverjet_airtargetiswithinview(self.bestairtarget)) {
            var_ecbf90442e065a5f = var_ecbf90442e065a5f - level.framedurationseconds;
            waitframe();
        }
        if (isdefined(self.bestairtarget)) {
            hoverjet_moveawayfromtarget(self.bestairtarget);
        } else {
            break;
        }
        /#
            var_671b9cb2b0e5d795 = getdvarint(@"hash_920f0586653a26d4", 0);
            if (isdefined(var_671b9cb2b0e5d795) && var_671b9cb2b0e5d795) {
                line(self gettagorigin("hoverJet_moveToNewlocation"), self.bestairtarget.origin, (1, 0, 1), 1, 0, 1);
            }
        #/
        if (isdefined(self.bestairtarget)) {
            var_3f5937ab90734769 = self gettagorigin("tag_" + var_c42e4efdf5e20e14 + "_archer_missile") + anglestoforward(self.angles) * 100;
            var_77e91c731500dfe8 = var_3f5937ab90734769 + anglestoforward(self.angles) * 100;
            missile = _magicbullet(var_b144b7d889960d44, var_3f5937ab90734769, var_77e91c731500dfe8, self.owner);
            var_9806e3c29658cc34 = hoverjet_setmissileoffset(self.bestairtarget);
            missile missile_settargetent(self.bestairtarget, var_9806e3c29658cc34);
            missile.streakinfo = self.streakinfo;
            if (var_c42e4efdf5e20e14 == "right") {
                var_c42e4efdf5e20e14 = "left";
            } else {
                var_c42e4efdf5e20e14 = "right";
            }
        } else {
            break;
        }
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(2);
    }
    if (istrue(self.movedoffguardlocation)) {
        thread hoverjet_movetolocation(self.currentguardlocation);
        self.movedoffguardlocation = undefined;
    }
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x378f
// Size: 0xd5
function hoverjet_setmissileoffset(target) {
    offset = (0, 0, 0);
    if (isdefined(target.streakinfo)) {
        switch (target.streakinfo.streakname) {
        case #"hash_349713b5ad494dda":
        case #"hash_691f39dddd9116b8":
            offset = (0, 0, -50);
            break;
        case #"hash_f64c697bfb4c6b54":
            offset = (0, 0, -30);
            break;
        case #"hash_bf2f9adbd2b41d5":
            offset = (0, 0, 20);
            break;
        case #"hash_27002778019fb447":
            offset = (0, 0, 10);
            break;
        }
    }
    return offset;
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x386c
// Size: 0x78
function hoverjet_airtargetiswithinview(var_250463ab8af4a9ae) {
    var_97f0985016aa48cb = 0.866;
    var_6c5ceed9b00eb7d5 = anglestoforward(self.angles);
    var_efa57adc48838f9b = vectornormalize(var_250463ab8af4a9ae.origin - self.origin);
    var_ff53e400dd536b82 = vectordot(var_6c5ceed9b00eb7d5, var_efa57adc48838f9b);
    return ter_op(var_ff53e400dd536b82 >= var_97f0985016aa48cb, 1, 0);
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38ec
// Size: 0x34
function hoverjet_airtargetistooclose(var_250463ab8af4a9ae) {
    return ter_op(distance2dsquared(var_250463ab8af4a9ae.origin, self.origin) < 1000000, 1, 0);
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3928
// Size: 0x18d
function hoverjet_moveawayfromtarget(var_250463ab8af4a9ae) {
    while (isdefined(var_250463ab8af4a9ae) && hoverjet_airtargetistooclose(var_250463ab8af4a9ae)) {
        newpos = undefined;
        var_6c5ceed9b00eb7d5 = anglestoforward(self.angles);
        var_5cc1d6dd55c49e3a = anglestoright(self.angles);
        var_4549cd5fc4176d49 = self.origin - var_6c5ceed9b00eb7d5 * 1000;
        var_fda6246979f38f6d = self.origin + 707 * (var_5cc1d6dd55c49e3a - var_6c5ceed9b00eb7d5);
        var_e3cff2d14efa4b98 = self.origin + 707 * (-1 * var_6c5ceed9b00eb7d5 - var_5cc1d6dd55c49e3a);
        var_e2f36ecdae896a0a = [0:var_4549cd5fc4176d49, 1:var_fda6246979f38f6d, 2:var_e3cff2d14efa4b98];
        var_b9d5783a4f34efbc = [0:self, 1:var_250463ab8af4a9ae];
        foreach (position in var_e2f36ecdae896a0a) {
            if (sphere_trace_passed(self.origin, position, 256, var_b9d5783a4f34efbc)) {
                newpos = position * (1, 1, 0) + (0, 0, var_250463ab8af4a9ae.origin[2]);
            }
        }
        if (isdefined(newpos)) {
            self.movedoffguardlocation = 1;
            self setvehgoalpos(newpos, 1);
        }
        waitframe();
    }
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3abc
// Size: 0xc6
function function_e05ade915e49f05f() {
    function_b6018909193826e4();
    self.var_ad9affc67934f84d = namespace_5a22b6f3a56f7e9b::requestobjectiveid();
    var_227794813f747ded = self.origin + (0, 0, 0);
    objective_add_objective(self.var_ad9affc67934f84d, "current", var_227794813f747ded, "hud_icon_killstreak_hover_jet", "icon_regular");
    objective_playermask_hidefromall(self.var_ad9affc67934f84d);
    objective_set_play_intro(self.var_ad9affc67934f84d, 0);
    objective_playermask_addshowplayer(self.var_ad9affc67934f84d, self);
    function_9766d0b79eada249(self.var_ad9affc67934f84d, 1);
    objective_setbackground(self.var_ad9affc67934f84d, 1);
    function_11cbcb8303075da(self.var_ad9affc67934f84d, 224, 224, 224, 1);
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b89
// Size: 0x1f
function function_b6018909193826e4() {
    if (isdefined(self.var_ad9affc67934f84d)) {
        objective_delete(self.var_ad9affc67934f84d);
    }
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3baf
// Size: 0x182
function hoverjet_watchforreposition() {
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    level endon("game_ended");
    self setneargoalnotifydist(100);
    function_e68434bdb941ed1e(self.streakinfo.streakname, self.owner, "KILLSTREAKS_HINTS/HOVER_JET_GUARD", 1);
    /#
        self.useobj thread function_380d84b0fdfca800(self.owner, self);
    #/
    updaterate = level.framedurationseconds;
    activatetime = 0.25;
    self.useobj setuseholdduration(250);
    while (isdefined(self.useobj)) {
        timeused = 0;
        player = self.useobj waittill("trigger");
        if (player isusingremote()) {
            continue;
        }
        playkillstreakoperatordialog("hover_jet", "hover_jet" + "_confirm", 1);
        self setscriptablepartstate("thrusters", "active", 0);
        /#
            var_671b9cb2b0e5d795 = getdvarint(@"hash_920f0586653a26d4", 0);
            if (isdefined(var_671b9cb2b0e5d795) && var_671b9cb2b0e5d795) {
                player iprintlnbold("left");
            }
            self.useobj thread function_d6e5bb5b2c900f89(1);
        #/
        if (isdefined(player)) {
            thread hoverjet_movetolocation(player.origin);
            thread hoverjet_watchfornearmovementgoal();
            player function_e05ade915e49f05f();
        }
    }
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d38
// Size: 0x2b
function hoverjet_watchfornearmovementgoal() {
    self endon("death");
    self endon("leaving");
    self waittill("near_goal");
    self setscriptablepartstate("thrusters", "idle", 0);
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d6a
// Size: 0x2e
function hoverjet_randomizemovement() {
    self notify("random_movement");
    self endon("random_movement");
    self endon("stopRand");
    self endon("death");
    self endon("acquiringTarget");
    self endon("leaving");
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d9f
// Size: 0x12a
function function_58258fda8ee98d76(streakname) {
    var_e25f9b0de2cc7b81 = self;
    scorepopup = "destroyed_" + streakname;
    vodestroyed = undefined;
    destroyedsplash = "callout_destroyed_" + streakname;
    var_8dfc256103cce53e = &function_a7c9961508e4b099;
    var_191284e2e2837328 = &function_8987ef697fe06da3;
    var_bacc6dd14316758c = &function_3b2ccb79d72d0155;
    var_7da88d9c69433487 = &function_acd17bdc96a89f80;
    deathcallback = &hoverjet_handledeathdamage;
    killstreak_setupvehicledamagefunctionality(streakname, var_e25f9b0de2cc7b81, scorepopup, vodestroyed, destroyedsplash, var_8dfc256103cce53e, var_191284e2e2837328, var_bacc6dd14316758c, var_7da88d9c69433487, deathcallback);
    namespace_f64231d5b7a2c3c4::vehicle_tracking_registerinstance(self, self.owner, self.owner.team);
    function_cfc5e3633ef950fd(1, self.maxhealth * 0.75, &function_be82a8c78a16752b);
    function_cfc5e3633ef950fd(2, self.maxhealth * 0.5, &function_239dc7891d929c9c);
    function_cfc5e3633ef950fd(3, self.maxhealth * 0.25, &function_ba3a1232dbda15da);
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ed0
// Size: 0x35
function function_a7c9961508e4b099(streakname) {
    if (issharedfuncdefined("vehicle_damage", "setVehicleHitDamageData")) {
        [[ getsharedfunc("vehicle_damage", "setVehicleHitDamageData") ]](streakname, 12);
    }
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f0c
// Size: 0x10b
function function_8987ef697fe06da3(streakname) {
    weaponname = "thermite_bolt_mp";
    weaponhitsperattack = 1;
    var_8b4500d6a881b7b2 = 24;
    if (issharedfuncdefined("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon")) {
        [[ getsharedfunc("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon") ]](weaponname, weaponhitsperattack, var_8b4500d6a881b7b2, streakname);
    }
    weaponname = "thermite_xmike109_mp";
    weaponhitsperattack = 1;
    var_8b4500d6a881b7b2 = 50;
    if (issharedfuncdefined("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon")) {
        [[ getsharedfunc("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon") ]](weaponname, weaponhitsperattack, var_8b4500d6a881b7b2, streakname);
    }
    weaponname = "semtex_bolt_mp";
    weaponhitsperattack = 1;
    var_8b4500d6a881b7b2 = 9;
    if (issharedfuncdefined("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon")) {
        [[ getsharedfunc("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon") ]](weaponname, weaponhitsperattack, var_8b4500d6a881b7b2, streakname);
    }
    weaponname = "semtex_xmike109_mp";
    weaponhitsperattack = 1;
    var_8b4500d6a881b7b2 = 13;
    if (issharedfuncdefined("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon")) {
        [[ getsharedfunc("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon") ]](weaponname, weaponhitsperattack, var_8b4500d6a881b7b2, streakname);
    }
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x401e
// Size: 0x3a
function function_3b2ccb79d72d0155(data) {
    damage = data.damage;
    attacker = data.attacker;
    return 1;
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4060
// Size: 0xa0
function function_acd17bdc96a89f80(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    self.currenthealth = self.currenthealth - damage;
    killstreak_updatedamagestate(self.currenthealth);
    return 1;
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4108
// Size: 0x14
function function_be82a8c78a16752b() {
    self setscriptablepartstate("body_damage_light", "on");
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4123
// Size: 0x14
function function_239dc7891d929c9c() {
    self setscriptablepartstate("body_damage_medium", "on");
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x413e
// Size: 0x14
function function_ba3a1232dbda15da() {
    self setscriptablepartstate("body_damage_heavy", "on");
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4159
// Size: 0x40
function hoverjet_handledeathdamage(data) {
    self.killedbyweapon = data.objweapon;
    thread hoverjet_handledestroyed(data.attacker, data.objweapon);
    return 1;
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41a1
// Size: 0xbb
function hoverjet_handledestroyed(attacker, killedbyweapon) {
    level endon("game_ended");
    self endon("hover_jet_gone");
    var_1d4408c68f2118a = isdefined(attacker) && isplayer(attacker) && istrue(attacker.isjuggernaut);
    var_31777acbf2b0901 = 1;
    if (issharedfuncdefined("killstreak", "isKillstreakWeapon")) {
        if ([[ getsharedfunc("killstreak", "isKillstreakWeapon") ]](killedbyweapon) && !var_1d4408c68f2118a) {
            var_31777acbf2b0901 = 0;
        }
    }
    if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
        self.owner setclientomnvar("ui_using_hover_jet", 0);
    }
    if (istrue(var_31777acbf2b0901)) {
        hoverjet_crash(75);
    }
    thread hoverjet_explode();
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4263
// Size: 0x13c
function hoverjet_crash(speed) {
    self endon("explode");
    self.iscrashing = 1;
    self.killcament unlink();
    self.killcament.origin = self.origin + (0, 0, 100);
    self vehicle_turnengineoff();
    self clearlookatent();
    self notify("crashing");
    if (getgametype() == "wm" && level.mapname == "mp_jup_skydiving") {
        self playsoundonmovingent("ks_wm_hoverjet_crash");
    } else {
        self playsoundonmovingent("ks_hoverjet_crash");
    }
    self setmaxpitchroll(10, 50);
    self vehicle_setspeed(speed, 20, 20);
    self setneargoalnotifydist(100);
    var_6847739e80fb4e81 = hoverjet_findcrashposition(2500);
    if (!isdefined(var_6847739e80fb4e81)) {
        return;
    }
    playkillstreakoperatordialog("hover_jet", "hover_jet" + "_crash", 1);
    self setvehgoalpos(var_6847739e80fb4e81, 0);
    thread function_a12df0241d8eea2(var_6847739e80fb4e81);
    thread hoverjet_spinout(speed);
    self.owner function_b6018909193826e4();
    waittill_any_timeout_2(5, "collision", "near_goal");
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43a6
// Size: 0x80
function function_a12df0241d8eea2(var_6847739e80fb4e81) {
    self endon("death");
    var_9f9c84729373f7db = length(self.origin - var_6847739e80fb4e81);
    var_501dfe1465156b4c = var_9f9c84729373f7db * 0.5;
    var_153bdb19c511cb34 = var_501dfe1465156b4c * var_501dfe1465156b4c;
    while (1) {
        if (distancesquared(self.origin, var_6847739e80fb4e81) <= var_153bdb19c511cb34) {
            break;
        }
        waitframe();
    }
    self setscriptablepartstate("explode_cockpit", "on", 0);
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x442d
// Size: 0x4d
function hoverjet_spinout(speed) {
    self endon("death");
    self setyawspeed(speed, 50, 50, 0.5);
    while (isdefined(self)) {
        self settargetyaw(self.angles[1] + speed * 0.5);
        wait(0.5);
    }
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4481
// Size: 0x1ae
function hoverjet_findcrashposition(var_6f8d59f68bd2b46c) {
    var_b2b5f5510c5d94e0 = self.origin;
    crashoffset = 1000;
    var_543f2191dde2b7f6 = undefined;
    var_6c5ceed9b00eb7d5 = anglestoforward(self.angles);
    var_5cc1d6dd55c49e3a = anglestoright(self.angles);
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 + var_6c5ceed9b00eb7d5 * var_6f8d59f68bd2b46c - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 - var_6c5ceed9b00eb7d5 * var_6f8d59f68bd2b46c - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 + var_5cc1d6dd55c49e3a * var_6f8d59f68bd2b46c - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 - var_5cc1d6dd55c49e3a * var_6f8d59f68bd2b46c - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 + 0.707 * var_6f8d59f68bd2b46c * (var_6c5ceed9b00eb7d5 + var_5cc1d6dd55c49e3a) - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 + 0.707 * var_6f8d59f68bd2b46c * (var_6c5ceed9b00eb7d5 - var_5cc1d6dd55c49e3a) - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 + 0.707 * var_6f8d59f68bd2b46c * (var_5cc1d6dd55c49e3a - var_6c5ceed9b00eb7d5) - (0, 0, crashoffset);
    var_4720f54e3eff6e8d = ray_trace(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 + 0.707 * var_6f8d59f68bd2b46c * (-1 * var_6c5ceed9b00eb7d5 - var_5cc1d6dd55c49e3a) - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    return var_543f2191dde2b7f6;
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4637
// Size: 0x7c
function hoverjet_explode() {
    if (istrue(self.var_3621873dccbde4b5)) {
        return;
    }
    self notify("explode");
    self.var_3621873dccbde4b5 = 1;
    function_5a9772411551e56e("hover_jet");
    self radiusdamage(self.origin, 1000, 200, 200, self.owner, "MOD_EXPLOSIVE", "hover_jet_turret_ballistics_mp");
    self setscriptablepartstate("explode", "on", 0);
    wait(0.35);
    thread hoverjet_cleanup(1);
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46ba
// Size: 0x2ec
function hoverjet_leave() {
    self endon("death");
    if (isdefined(level.var_f56a88761038798b)) {
        thread [[ level.var_f56a88761038798b ]](self.streakinfo);
    }
    self.isleaving = 1;
    self notify("leaving");
    if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
        self.owner setclientomnvar("ui_using_hover_jet", 0);
    }
    hoverjet_breakofftarget(undefined, 1);
    var_df6c75d1a1e4ff18 = 3;
    var_e757789796c82383 = (0, 0, 1000);
    var_bb0e78a73b33d580 = self.origin + var_e757789796c82383;
    var_bc09a6e223b96348 = undefined;
    var_690e4620fe5fa98f = undefined;
    var_ec0c66c48e6f8304 = undefined;
    while (var_df6c75d1a1e4ff18 > 0) {
        flightpath = function_999fe3838d6b6f8c(var_bb0e78a73b33d580, self.angles, 350, 24000);
        if (isdefined(flightpath.end)) {
            var_bc09a6e223b96348 = flightpath.start;
            var_690e4620fe5fa98f = flightpath.end;
            var_ec0c66c48e6f8304 = flightpath.angles;
            break;
        }
        var_bb0e78a73b33d580 = var_bb0e78a73b33d580 + (0, 0, 1000);
        var_df6c75d1a1e4ff18--;
        wait(0.05);
    }
    if (!isdefined(var_690e4620fe5fa98f)) {
        thread hoverjet_explode();
    } else {
        var_1602fab5eab68601 = 150;
        var_2451a07aca478bf6 = 35;
        self setyawspeed(var_1602fab5eab68601, 50, 25, 0);
        self settargetyaw(var_ec0c66c48e6f8304[1]);
        self vehicle_setspeed(var_2451a07aca478bf6, 25);
        pathgoal = var_bc09a6e223b96348;
        self setvehgoalpos(pathgoal, 1);
        self vehicleplayanim(level.scr_anim["hover_jet"]["exit"]);
        if (getgametype() == "wm" && level.mapname == "mp_jup_skydiving") {
            self playsoundonmovingent("ks_wm_hoverjet_leave");
        } else {
            self playsoundonmovingent("ks_hoverjet_leave");
        }
        self setscriptablepartstate("thrusters", "active", 0);
        waittill_any_timeout_1(3, "goal");
        var_f457885f9e89c75d = 0;
        while (var_f457885f9e89c75d < 2) {
            currentyaw = (0, self.angles[1], 0);
            yawdiff = var_ec0c66c48e6f8304 - currentyaw;
            if (abs(yawdiff[1]) < 5) {
                break;
            }
            var_f457885f9e89c75d = var_f457885f9e89c75d + level.framedurationseconds;
            waitframe();
        }
        self vehicle_turnengineoff();
        self setscriptablepartstate("contrails", "on", 0);
        self vehicle_setspeed(250, 75);
        self setvehgoalpos(var_690e4620fe5fa98f, 1);
        self setneargoalnotifydist(1000);
        self.owner function_b6018909193826e4();
        waittill_any_timeout_1(10, "near_goal");
        self notify("hover_jet_gone");
        thread hoverjet_cleanup(0);
    }
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49ad
// Size: 0x13a
function hoverjet_cleanup(var_4fac8b8ce36e09f1) {
    if (istrue(self.var_bf178f6894d17b96)) {
        return;
    }
    self.var_bf178f6894d17b96 = 1;
    if (isdefined(self.turret)) {
        self.turret setentityowner(undefined);
        self.turret delete();
    }
    if (isdefined(self.killcament)) {
        self.killcament delete();
    }
    if (isdefined(self.turret.groundtargetent)) {
        self.turret.groundtargetent delete();
    }
    if (isdefined(self.scenenode)) {
        self.scenenode delete();
    }
    self setscriptablepartstate("blinking_lights", "off", 0);
    self setscriptablepartstate("thrusters", "off", 0);
    self.streakinfo.expiredbydeath = istrue(var_4fac8b8ce36e09f1);
    if (!istrue(self.recordedgameendstats)) {
        self.owner namespace_9abe40d2af041eb2::recordkillstreakendstats(self.streakinfo);
    }
    level.hoverjets = array_remove(level.hoverjets, self);
    namespace_f64231d5b7a2c3c4::_deletevehicle(self);
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4aee
// Size: 0x95
function hoverjet_watchtargetstatus(target) {
    targetentnum = target getentitynumber();
    self endon("hoverJet_breakOffTarget " + targetentnum);
    self endon("hoverJet_breakOffAllTargets");
    self endon("death");
    self endon("leaving");
    if (isplayer(target)) {
        thread hoverjet_watchgroundtargetdeathdisconnect(target);
    } else {
        thread hoverjet_watchairtargetdeath(target);
    }
    thread hoverjet_watchforbreakaction(target, "hoverJet_targetLost " + targetentnum);
    thread hoverjet_watchforbreakaction(target, "hoverJet_targetNotInView " + targetentnum);
    thread hoverjet_watchforbreakaction(target, "hoverJet_moveToNewlocation");
    thread hoverjet_watchforbreakaction(target, "hoverJet_targetTimeout");
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b8a
// Size: 0x4d
function hoverjet_watchgroundtargetdeathdisconnect(var_fc034515f9e66143) {
    targetentnum = var_fc034515f9e66143 getentitynumber();
    self endon("hoverJet_breakOffTarget " + targetentnum);
    self endon("hoverJet_breakOffAllTargets");
    self endon("death");
    self endon("leaving");
    var_fc034515f9e66143 waittill("death_or_disconnect");
    self notify("hoverJet_targetLost " + targetentnum);
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bde
// Size: 0x4d
function hoverjet_watchairtargetdeath(var_250463ab8af4a9ae) {
    targetentnum = var_250463ab8af4a9ae getentitynumber();
    self endon("hoverJet_breakOffTarget " + targetentnum);
    self endon("hoverJet_breakOffAllTargets");
    self endon("death");
    self endon("leaving");
    var_250463ab8af4a9ae waittill("death");
    self notify("hoverJet_targetLost " + targetentnum);
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c32
// Size: 0x4f
function hoverjet_watchforbreakaction(target, action) {
    targetentnum = target getentitynumber();
    self endon("hoverJet_breakOffTarget " + targetentnum);
    self endon("hoverJet_breakOffAllTargets");
    self endon("death");
    self endon("leaving");
    self waittill(action);
    hoverjet_breakofftarget(targetentnum);
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c88
// Size: 0x1a8
function hoverjet_watchtargetlos(target, tolerance, var_9cb7c709f17e1c56) {
    targetentnum = target getentitynumber();
    self endon("death");
    self endon("leaving");
    self endon("hoverJet_breakOffTarget " + targetentnum);
    self endon("hoverJet_breakOffAllTargets");
    self.bestgroundtarget endon("death_or_disconnect");
    var_fa2a5bdd4208df6e = undefined;
    if (!isdefined(tolerance)) {
        tolerance = 500;
    }
    var_c3fbb6661b91750f = create_contents(0, 1, 0, 1, 0, 1, 0, 1, 1);
    ignorelist = [0:self.turret];
    if (isdefined(var_9cb7c709f17e1c56)) {
        ignorelist[ignorelist.size] = var_9cb7c709f17e1c56;
        var_53023fda76fa64fe = var_9cb7c709f17e1c56 getlinkedchildren();
        if (isdefined(var_53023fda76fa64fe) && var_53023fda76fa64fe.size > 0) {
            ignorelist = array_combine(ignorelist, var_53023fda76fa64fe);
        }
    }
    while (1) {
        canseetarget = ray_trace_passed(self.turret gettagorigin("tag_barrel"), target gettagorigin("j_head"), ignorelist, var_c3fbb6661b91750f);
        if (!istrue(canseetarget)) {
            if (!isdefined(var_fa2a5bdd4208df6e)) {
                var_fa2a5bdd4208df6e = gettime();
            }
            if (gettime() - var_fa2a5bdd4208df6e > tolerance) {
                self notify("hoverJet_targetNotInView " + targetentnum);
                return;
            }
        } else {
            /#
                var_4dbe11d3bda81e4a = getdvarint(@"hash_48714771f0d0b941", 0);
                if (var_4dbe11d3bda81e4a) {
                    line(self.turret gettagorigin("hoverJet_breakOffAllTargets"), target.origin, (1, 0, 0), 1, 0, 5);
                }
            #/
            var_fa2a5bdd4208df6e = undefined;
        }
        wait(0.25);
    }
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e37
// Size: 0x5b
function hoverjet_watchtargettimeout(target) {
    targetentnum = target getentitynumber();
    self endon("death");
    self endon("leaving");
    self endon("hoverJet_breakOffTarget " + targetentnum);
    self endon("hoverJet_breakOffAllTargets");
    self.bestgroundtarget endon("death_or_disconnect");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(5);
    self notify("hoverJet_targetTimeout");
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e99
// Size: 0x205
function hoverjet_breakofftarget(targetentnum, var_d239154c0f9ced8e) {
    var_291f69a68aa5ddb3 = undefined;
    if (!isdefined(targetentnum) || istrue(var_d239154c0f9ced8e)) {
        self.bestgroundtarget = undefined;
        self.bestairtarget = undefined;
        self clearlookatent();
        self.turret cleartargetentity();
        self.turret.groundtargetent unlink();
        var_291f69a68aa5ddb3 = "Breaking off all targets";
        /#
            var_671b9cb2b0e5d795 = getdvarint(@"hash_920f0586653a26d4", 0);
            if (isdefined(var_671b9cb2b0e5d795) && var_671b9cb2b0e5d795) {
                self.owner iprintlnbold(var_291f69a68aa5ddb3);
            }
        #/
        self notify("hoverJet_breakOffAllTargets");
        return;
    } else {
        if (isdefined(self.bestgroundtarget) && targetentnum == self.bestgroundtarget getentitynumber()) {
            if (isdefined(self.bestgroundtarget.name)) {
                var_291f69a68aa5ddb3 = "Breaking off ground target: " + self.bestgroundtarget.name;
            }
            self.bestgroundtarget = undefined;
            self.turret cleartargetentity();
            self.turret.groundtargetent unlink();
        } else if (isdefined(self.bestairtarget) && targetentnum == self.bestairtarget getentitynumber()) {
            if (isdefined(self.bestairtarget.model)) {
                var_291f69a68aa5ddb3 = "Breaking off air target: " + self.bestairtarget.model;
            }
            self.bestairtarget = undefined;
        } else {
            var_291f69a68aa5ddb3 = "Breaking off removed target: " + targetentnum;
        }
        if (!isdefined(self.bestgroundtarget) && !isdefined(self.bestairtarget)) {
            self clearlookatent();
        }
    }
    /#
        var_671b9cb2b0e5d795 = getdvarint(@"hash_920f0586653a26d4", 0);
        if (isdefined(var_671b9cb2b0e5d795) && var_671b9cb2b0e5d795) {
            self.owner iprintlnbold(var_291f69a68aa5ddb3);
        }
    #/
    self notify("hoverJet_breakOffTarget " + targetentnum);
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50a5
// Size: 0x141
function hoverjet_getbestairtarget(targets) {
    self endon("death");
    self endon("leaving");
    besttarget = undefined;
    bestdistance = undefined;
    var_4efaf0d84225539 = 0;
    foreach (targ in targets) {
        if (!isdefined(targ)) {
            continue;
        }
        /#
            var_4dbe11d3bda81e4a = getdvarint(@"hash_de4ffc2e910521a1", 0);
            if (var_4dbe11d3bda81e4a) {
                var_4efaf0d84225539 = 1;
            }
        #/
        if (!istrue(var_4efaf0d84225539)) {
            if (level.teambased && targ.team == self.team) {
                continue;
            }
            jumpiffalse(targ.owner == self.owner) LOC_000000ee;
        } else {
        LOC_000000ee:
            curdist = distance2dsquared(targ.origin, self.origin);
            if (curdist >= 6250000) {
                continue;
            }
            if (!isdefined(bestdistance) || curdist < bestdistance) {
                besttarget = targ;
                bestdistance = curdist;
            }
        }
    }
    return besttarget;
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51ee
// Size: 0x89
function function_9f6c5e46080e47dc() {
    var_c51de0af53e40876 = "airstrike_flyby_straight";
    /#
        var_dc24abeecce774ba = getdvarint(@"hash_8ef299ce102da922", 3);
        switch (var_dc24abeecce774ba) {
        case 0:
        case 1:
            var_c51de0af53e40876 = "hoverJet_mini_emp_hit";
            break;
        case 2:
            var_c51de0af53e40876 = "<unknown string>";
            break;
        case 3:
            var_c51de0af53e40876 = "<unknown string>";
            break;
        }
    #/
    return var_c51de0af53e40876;
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x527f
// Size: 0x19
function function_b5a9a3ea21b6ea62(data) {
    if (isdefined(self)) {
        hoverjet_handledeathdamage(data);
    }
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x529f
// Size: 0x24b
function function_8b040f320bd1e206(data) {
    self endon("death");
    self notify("hoverJet_mini_emp_hit");
    self endon("hoverJet_mini_emp_hit");
    hoverjet_breakofftarget(undefined, 1);
    self.var_d7b89e030dda87bf = 1;
    if (!isdefined(self.var_e8d88b601e41fba5) && self.flaresreservecount > 0) {
        self.var_e8d88b601e41fba5 = gettime();
        if (issharedfuncdefined("flares", "reduceReserves")) {
            [[ getsharedfunc("flares", "reduceReserves") ]](self);
        }
        if (issharedfuncdefined("flares", "playFx")) {
            self thread [[ getsharedfunc("flares", "playFx") ]]("jet_flares");
        }
        newtarget = undefined;
        if (issharedfuncdefined("flares", "deploy")) {
            newtarget = self [[ getsharedfunc("flares", "deploy") ]]();
        }
    } else if (self.flaresreservecount > 0 && self.var_e8d88b601e41fba5 <= gettime() - 10000) {
        if (issharedfuncdefined("flares", "reduceReserves")) {
            [[ getsharedfunc("flares", "reduceReserves") ]](self);
        }
        if (issharedfuncdefined("flares", "playFx")) {
            self thread [[ getsharedfunc("flares", "playFx") ]]("jet_flares");
        }
        newtarget = undefined;
        if (issharedfuncdefined("flares", "deploy")) {
            newtarget = self [[ getsharedfunc("flares", "deploy") ]]();
        }
    }
    if (!isdefined(self.var_40717aa8f16967e3)) {
        self.var_40717aa8f16967e3 = gettime();
        if (namespace_3c37cb17ade254d::issharedfuncdefined("player", "doScoreEvent")) {
            data.attacker thread [[ namespace_3c37cb17ade254d::getsharedfunc("player", "doScoreEvent") ]]("emped_killstreak");
        }
    }
    if (self.var_40717aa8f16967e3 < gettime() - 4750) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("player", "doScoreEvent")) {
            data.attacker thread [[ namespace_3c37cb17ade254d::getsharedfunc("player", "doScoreEvent") ]]("emped_killstreak");
        }
        self.var_40717aa8f16967e3 = gettime();
    }
    wait(5);
    self.var_d7b89e030dda87bf = undefined;
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x54f1
// Size: 0x3c
function function_950a05f71804f5() {
    /#
        self endon("<unknown string>");
        while (1) {
            sphere(self.origin, 50, (1, 0, 0), 0, 1);
            wait(0.05);
        }
    #/
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5534
// Size: 0x151
function function_9480f8b8d48d0f59(owner) {
    /#
        self endon("<unknown string>");
        self endon("<unknown string>");
        while (1) {
            if (getdvarint(@"hash_920f0586653a26d4") == 0) {
                waitframe();
                continue;
            }
            if (!isdefined(self.bestgroundtarget)) {
                bestgroundtarget = "<unknown string>";
            } else {
                bestgroundtarget = self.bestgroundtarget.name;
            }
            if (!isdefined(self.bestairtarget)) {
                bestairtarget = "<unknown string>";
            } else {
                bestairtarget = self.bestairtarget.model;
            }
            var_379097055795a272 = anglestoforward(owner.angles);
            scalar = (var_379097055795a272[0] * 300, var_379097055795a272[1] * 300, var_379097055795a272[2]);
            print3d(level.players[0].origin + scalar, "<unknown string>" + bestairtarget, (1, 1, 0));
            print3d(level.players[0].origin + scalar - (0, 0, 20), "<unknown string>" + bestgroundtarget, (1, 1, 0));
            waitframe();
        }
    #/
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x568c
// Size: 0x11b
function function_380d84b0fdfca800(owner, var_28f8f60414dfb888) {
    /#
        self endon("<unknown string>");
        var_28f8f60414dfb888 endon("<unknown string>");
        var_28f8f60414dfb888 endon("<unknown string>");
        self.debugcolor = (1, 1, 1);
        while (1) {
            if (getdvarint(@"hash_125a1951df8627f5", 0) == 0) {
                waitframe();
                continue;
            }
            var_d2076e1ec538f071 = owner geteye();
            var_379097055795a272 = anglestoforward(owner getplayerangles());
            scalar = (var_379097055795a272[0] * 300, var_379097055795a272[1] * 300, var_379097055795a272[2]);
            print3d(owner.origin + scalar, "<unknown string>" + distance(self.origin, var_d2076e1ec538f071), self.debugcolor);
            sphere(self.origin, 50, self.debugcolor, 0, 1);
            line(self.origin, var_d2076e1ec538f071 + var_379097055795a272 * 300, self.debugcolor, 1, 0, 1);
            waitframe();
        }
    #/
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x57ae
// Size: 0x60
function function_d6e5bb5b2c900f89(time) {
    /#
        self endon("<unknown string>");
        self endon("<unknown string>");
        if (getdvarint(@"hash_125a1951df8627f5", 0) == 0) {
            return;
        }
        self.debugcolor = (1, 0, 0);
        wait(time);
        self.debugcolor = (1, 1, 1);
    #/
}

// Namespace hover_jet/namespace_e70862d8d2eb291c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5815
// Size: 0xfb
function function_3f69aefa7b90fb4a() {
    /#
        if (!isdefined(self) || !isdefined(self.owner)) {
            return;
        }
        self endon("<unknown string>");
        self endon("<unknown string>");
        self.owner endon("<unknown string>");
        level endon("<unknown string>");
        self.owner notifyonplayercommand("<unknown string>", "<unknown string>");
        self.owner notifyonplayercommand("<unknown string>", "<unknown string>");
        var_921393d77069e4d2 = "<unknown string>";
        var_976a1708e3157766 = 10;
        sideoffset = 100;
        while (1) {
            var_671b9cb2b0e5d795 = getdvarint(@"hash_920f0586653a26d4", 0);
            if (!istrue(var_671b9cb2b0e5d795)) {
                waitframe();
                continue;
            }
            self.owner waittill("<unknown string>");
            function_2b7c965fb8b07829(self.origin - (0, 0, 10000), sideoffset);
            sideoffset = sideoffset * -1;
        }
    #/
}

