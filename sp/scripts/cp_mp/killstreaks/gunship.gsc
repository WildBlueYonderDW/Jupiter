#using script_3db04fd1b466bdba;
#using scripts\common\anim;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp_mp\hostmigration;
#using scripts\cp_mp\killstreaks\killstreakdeploy;
#using scripts\cp_mp\targetmarkergroups;
#using scripts\cp_mp\utility\damage_utility;
#using scripts\cp_mp\utility\dialog_utility;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\inventory_utility;
#using scripts\cp_mp\utility\killstreak_utility;
#using scripts\cp_mp\utility\player_utility;
#using scripts\cp_mp\utility\shellshock_utility;
#using scripts\cp_mp\utility\vehicle_omnvar_utility;
#using scripts\cp_mp\utility\weapon_utility;
#using scripts\cp_mp\vehicles\vehicle;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\mp\sentientpoolmanager;

#namespace gunship;

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19c0
// Size: 0x141
function init() {
    bundle = level.streakglobals.streakbundles["gunship"];
    if (!isdefined(bundle)) {
        return;
    }
    if (issharedfuncdefined("gunship", "init")) {
        [[ getsharedfunc("gunship", "init") ]]();
    }
    /#
        setdevdvarifuninitialized(@"hash_fa402c92e4148a39", bundle.gunship_lifetime);
        setdevdvarifuninitialized(@"hash_f49f4fd233809e37", 0);
        setdevdvarifuninitialized(@"hash_a59a7da9fa17c00", 0);
        setdevdvarifuninitialized(@"hash_cc9d9505b48bc357", 0);
        setdevdvarifuninitialized(@"hash_302d41b2b6f9d002", 0);
        setdevdvarifuninitialized(@"hash_9a9f1499825922aa", 0);
        setdevdvarifuninitialized(@"hash_73471de3f4780421", 0);
        setdevdvarifuninitialized(@"hash_55b253d027368418", 1);
        setdevdvarifuninitialized(@"hash_9852a22e959385f5", 0);
        setdevdvarifuninitialized(@"hash_1fa8dffa69ff4ed8", 0);
    #/
    level thread function_7ab42d42f465952f();
    level function_8e8513a8b071336c();
    level function_77e6149ef483d24a();
    level function_b0280ee1765554d1();
    level init_gunship_vo();
    level function_6fcb27d917ef709b();
    level function_ea9e0f077f0d655c();
    thread function_fff560b330fd842d();
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b09
// Size: 0xd
function weapongivengunship(streakinfo) {
    return true;
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b1f
// Size: 0x4d
function function_7ab42d42f465952f() {
    level endon("game_ended");
    flag_wait("onStartGameTypeFinished");
    if (isdefined(level.mapcenter)) {
        level.var_3065d0b3d892e79f = level.mapcenter;
        return;
    }
    level.var_3065d0b3d892e79f = (0, 0, 0);
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b74
// Size: 0x193
function function_8e8513a8b071336c() {
    bundle = level.streakglobals.streakbundles["gunship"];
    level.gunship_speed["move"] = 250;
    level.gunship_speed["rotate"] = 120;
    level.var_89d6f5464d64ebf4 = makeweapon(bundle.deployweaponname);
    level.physicssphereradius[bundle.var_2b83894fc24a37fc] = 60;
    level.physicssphereradius[bundle.var_2cb6918da56b085b] = 600;
    level.physicssphereradius[bundle.var_b702d1aa92e3f7dc] = 1000;
    level.physicssphereforce[bundle.var_2b83894fc24a37fc] = 0;
    level.physicssphereforce[bundle.var_2cb6918da56b085b] = 3;
    level.physicssphereforce[bundle.var_b702d1aa92e3f7dc] = 6;
    level.weaponreloadtime[bundle.var_2b83894fc24a37fc] = bundle.var_67d0db070ddbff8d;
    level.weaponreloadtime[bundle.var_2cb6918da56b085b] = bundle.var_7a1254e0d125c272;
    level.weaponreloadtime[bundle.var_b702d1aa92e3f7dc] = bundle.var_f3502361de75bf6d;
    level.gunshiprigs = [];
    level.gunship_lockon = getdvarint(@"hash_55b253d027368418", 1);
    registervisibilityomnvarforkillstreak("gunship", "on", 9);
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d0f
// Size: 0xb5
function function_77e6149ef483d24a() {
    val::group_register("gunshipIntro", ["allow_jump", "usability", "killstreaks", "supers", "gesture", "fire", "weapon_switch", "allow_movement", "offhand_weapons", "shellshock"]);
    val::group_register("gunshipUse", ["usability", "killstreaks", "supers", "gesture", "weapon_switch", "allow_movement", "shellshock"]);
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1dcc
// Size: 0x574
function function_b0280ee1765554d1() {
    level.scr_animtree["gunship"] = %script_model;
    animindex = "intro_gunship";
    level.scr_anim["gunship"][animindex] = script_model%mp_acharlie130_intro;
    animindex = "intro_gunship_exterior";
    level.scr_anim["gunship"][animindex] = script_model%iw9_mp_acharlie130_intro;
    animindex = "intro_gunner";
    level.scr_anim["gunship"][animindex] = script_model%vm_ks_gunship_player_intro;
    animindex = "intro_co_gunner";
    level.scr_anim["gunship"][animindex] = script_model%wm_ks_gunship_pilot2_intro;
    animindex = "intro_desk";
    level.scr_anim["gunship"][animindex] = script_model%vm_ks_gunship_desk_intro;
    animindex = "intro_clipboard_1";
    level.scr_anim["gunship"][animindex] = script_model%vm_ks_gunship_clipboard1_intro;
    animindex = "intro_clipboard_2";
    level.scr_anim["gunship"][animindex] = script_model%vm_ks_gunship_clipboard2_intro;
    animindex = "intro_paper";
    level.scr_anim["gunship"][animindex] = script_model%vm_ks_gunship_paper1_intro;
    animindex = "intro_pen_1";
    level.scr_anim["gunship"][animindex] = script_model%vm_ks_gunship_pen1_intro;
    animindex = "intro_pen_2";
    level.scr_anim["gunship"][animindex] = script_model%vm_ks_gunship_pen2_intro;
    animindex = "intro_smartphone";
    level.scr_anim["gunship"][animindex] = script_model%vm_ks_gunship_smartphone1_intro;
    animindex = "intro_tablet";
    level.scr_anim["gunship"][animindex] = script_model%vm_ks_gunship_tablet1_intro;
    animindex = "intro_binder";
    level.scr_anim["gunship"][animindex] = script_model%vm_ks_gunship_binder_intro;
    animindex = "intro_joystick";
    level.scr_anim["gunship"][animindex] = script_model%vm_ks_gunship_joystick_intro;
    animindex = "outro_gunner";
    level.scr_anim["gunship"][animindex] = script_model%vm_ks_gunship_player_outro;
    animindex = "outro_co_gunner";
    level.scr_anim["gunship"][animindex] = script_model%wm_ks_gunship_pilot2_outro;
    animindex = "outro_desk";
    level.scr_anim["gunship"][animindex] = script_model%vm_ks_gunship_desk_outro;
    animindex = "outro_clipboard_1";
    level.scr_anim["gunship"][animindex] = script_model%vm_ks_gunship_clipboard1_outro;
    animindex = "outro_clipboard_2";
    level.scr_anim["gunship"][animindex] = script_model%vm_ks_gunship_clipboard2_outro;
    animindex = "outro_paper";
    level.scr_anim["gunship"][animindex] = script_model%vm_ks_gunship_paper1_outro;
    animindex = "outro_pen_1";
    level.scr_anim["gunship"][animindex] = script_model%vm_ks_gunship_pen1_outro;
    animindex = "outro_pen_2";
    level.scr_anim["gunship"][animindex] = script_model%vm_ks_gunship_pen2_outro;
    animindex = "outro_smartphone";
    level.scr_anim["gunship"][animindex] = script_model%vm_ks_gunship_smartphone1_outro;
    animindex = "outro_tablet";
    level.scr_anim["gunship"][animindex] = script_model%vm_ks_gunship_tablet1_outro;
    animindex = "outro_binder";
    level.scr_anim["gunship"][animindex] = script_model%vm_ks_gunship_binder_outro;
    animindex = "outro_joystick";
    level.scr_anim["gunship"][animindex] = script_model%vm_ks_gunship_joystick_outro;
    animindex = "outro_gunship_death";
    level.scr_anim["gunship"][animindex] = script_model%mp_acharlie130_death;
    foreach (animindex, scr_anim in level.scr_anim["gunship"]) {
        level.scr_animlength["gunship"][animindex] = function_52351c3338da63f4("gunship", animindex);
    }
    bundle = level.streakglobals.streakbundles["gunship"];
    level.var_9c7d2f4c2fc66b1f = [];
    level.var_9c7d2f4c2fc66b1f["gunship_exterior"] = bundle.gunship_intromodel;
    level.var_9c7d2f4c2fc66b1f["gunner"] = "body_sp_ally_sensor_operator_vm_1_1_noface";
    level.var_9c7d2f4c2fc66b1f["co_gunner"] = "fullbody_sp_ally_sensor_operator_wm_1_1";
    level.var_9c7d2f4c2fc66b1f["desk"] = "misc_gunship_interior_desk";
    level.var_9c7d2f4c2fc66b1f["clipboard_1"] = "misc_un_office_clipboard_01";
    level.var_9c7d2f4c2fc66b1f["clipboard_2"] = "misc_un_office_clipboard_01";
    level.var_9c7d2f4c2fc66b1f["paper"] = "misc_un_office_paper_01";
    level.var_9c7d2f4c2fc66b1f["pen_1"] = "misc_un_office_pen_01";
    level.var_9c7d2f4c2fc66b1f["pen_2"] = "misc_un_office_pen_01";
    level.var_9c7d2f4c2fc66b1f["smartphone"] = "offhand1h_smartphone_static_v0";
    level.var_9c7d2f4c2fc66b1f["tablet"] = "offhand2h_tablet_static_v0";
    level.var_9c7d2f4c2fc66b1f["binder"] = "misc_un_office_binder_open";
    level.var_9c7d2f4c2fc66b1f["joystick"] = "misc_gunship_interior_joystick";
    level.gunship_animtype = getdvarint(@"hash_a59a7da9fa17c00", 0);
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2348
// Size: 0x211
function init_gunship_vo() {
    game["dialog"]["gunship" + "_use"] = "killstreak_remote_operator" + "_request_response";
    game["dialog"]["gunship" + "_leave"] = "killstreak_remote_operator" + "_leave";
    game["dialog"]["gunship" + "_engage"] = "killstreak_remote_operator" + "_engage";
    game["dialog"]["gunship" + "_random_radio"] = "killstreak_remote_operator" + "_radio_chatter";
    game["dialog"]["gunship" + "_flares"] = "killstreak_remote_operator" + "_flare_release";
    game["dialog"]["gunship" + "_light_damage"] = "killstreak_remote_operator" + "_light_damage";
    game["dialog"]["gunship" + "_med_damage"] = "killstreak_remote_operator" + "_med_damage";
    game["dialog"]["gunship" + "_heavy_damage"] = "killstreak_remote_operator" + "_heavy_damage";
    game["dialog"]["gunship" + "_lockedon"] = "killstreak_remote_operator" + "_missile_lock_warning";
    game["dialog"]["gunship" + "_crash"] = "killstreak_remote_operator" + "_crash";
    game["dialog"]["gunship" + "_hit_target"] = "killstreak_remote_operator" + "_hit_target";
    game["dialog"]["gunship" + "_miss_target"] = "killstreak_remote_operator" + "_miss_target";
    game["dialog"]["gunship" + "_spotted_single_target"] = "killstreak_remote_operator" + "_target_spotted_single";
    game["dialog"]["gunship" + "_spotted_multi_target"] = "killstreak_remote_operator" + "_miss_target";
    game["dialog"]["gunship" + "_hellfire_reload"] = "killstreak_remote_operator" + "_hellfire_reload";
    game["dialog"]["gunship" + "_40mm_reload"] = "killstreak_remote_operator" + "_40mm_reload";
    game["dialog"]["gunship" + "_25mm_reload"] = "killstreak_remote_operator" + "_25mm_reload";
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2561
// Size: 0x50
function function_6fcb27d917ef709b() {
    level._effect["clouds"] = loadfx("vfx/iw8_mp/killstreak/vfx_ac130_view_clouds.vfx");
    level._effect["gunship_flares"] = loadfx("vfx/iw8_mp/killstreak/vfx_ac130_flares.vfx");
    level._effect["camera_spotlight"] = loadfx("vfx/iw8_mp/killstreak/vfx_ac130_ir_spotlight.vfx");
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25b9
// Size: 0xca
function function_ea9e0f077f0d655c() {
    if (isdefined(level.gunshipvisionset)) {
        function_c0b0a582ff9e4d57(level.gunshipvisionset);
    }
    bundle = level.streakglobals.streakbundles["gunship"];
    function_c0b0a582ff9e4d57(bundle.var_7a35928e082dd9b7);
    function_c0b0a582ff9e4d57(bundle.var_6070115b879adfc9);
    function_c0b0a582ff9e4d57(bundle.var_7c6da61313057613, 0.1, 0.2, 0.5);
    function_c0b0a582ff9e4d57(bundle.var_1773b3703b61838e, 0.1, 0.1, 0.3);
    function_c0b0a582ff9e4d57(bundle.var_ee69fd7db3c43c73, 0.1, 0.1, 0.2);
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x268b
// Size: 0x20
function tryusegunship() {
    streakinfo = createstreakinfo("gunship", self);
    return tryusegunshipfromstruct(streakinfo);
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x26b4
// Size: 0xe2
function tryusegunshipfromstruct(streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return 0;
        }
    }
    deployresult = scripts\cp_mp\killstreaks\killstreakdeploy::streakdeploy_doweapontabletdeploy(streakinfo, &weapongivengunship);
    if (!istrue(deployresult)) {
        return 0;
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            streakinfo notify("killstreak_finished_with_deploy_weapon");
            return 0;
        }
    }
    if (level.gameended) {
        streakinfo notify("killstreak_finished_with_deploy_weapon");
        return 0;
    }
    result = gunship_startuse(self, streakinfo);
    if (!istrue(result)) {
        if (scripts\engine\utility::issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ scripts\engine\utility::getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/AIR_SPACE_TOO_CROWDED");
        }
        streakinfo notify("killstreak_finished_with_deploy_weapon");
        return 0;
    }
    return result;
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x279f
// Size: 0x67
function gunship_monitormanualplayerexit(owner) {
    level endon("game_ended");
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    owner endon("disconnect");
    if (issharedfuncdefined("killstreak", "allowRideKillstreakPlayerExit")) {
        self thread [[ getsharedfunc("killstreak", "allowRideKillstreakPlayerExit") ]]();
    }
    self waittill("killstreakExit");
    thread gunship_leave(owner);
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x280e
// Size: 0x624
function gunship_startuse(player, streakinfo) {
    level endon("game_ended");
    if (issharedfuncdefined("game", "disable_backpack_inventory")) {
        player [[ getsharedfunc("game", "disable_backpack_inventory") ]](1);
    }
    launchorigin = level.var_3065d0b3d892e79f;
    if (islargemap()) {
        if (level.gametype == "arm" || level.gametype == "conflict" || level.gametype == "gwtdm") {
            if (isdefined(level.hqmidpoint)) {
                launchorigin = level.hqmidpoint;
            } else if (isdefined(level.gunship_origin_override)) {
                launchorigin = level.gunship_origin_override;
            }
        } else {
            launchorigin = player.origin;
        }
    }
    var_2136b63785ee0579 = function_25233a050a5e41f0(player, launchorigin);
    if (!isdefined(var_2136b63785ee0579)) {
        return false;
    }
    bundle = level.streakglobals.streakbundles["gunship"];
    var_8945c22a67231e20 = randomint(360);
    radiusoffset = 9000;
    zoffset = 8000;
    foreach (map in bundle.var_b46a22c71ca5e923) {
        if (issubstr(level.mapname, map.name)) {
            if (isdefined(map.gunship_radiusoffset)) {
                radiusoffset = map.gunship_radiusoffset;
            }
            if (isdefined(map.gunship_zoffset)) {
                zoffset += map.gunship_zoffset;
            }
            break;
        }
    }
    if (utility::iscp()) {
        player.start_position = player.origin;
        if (isdefined(level.var_82219b46e414a2ae)) {
            var_8945c22a67231e20 = level.var_82219b46e414a2ae;
        }
    }
    /#
        var_6a0d59565e047ea2 = getdvarint(@"hash_9852a22e959385f5", 0);
        zoffset += var_6a0d59565e047ea2;
        radiusoffsetoverride = getdvarint(@"hash_74da12841dc5abf8", 0);
        if (radiusoffsetoverride != 0) {
            radiusoffset = radiusoffsetoverride;
        }
        zoffsetoverride = getdvarint(@"hash_e9998dac93d948d8", 0);
        if (zoffsetoverride != 0) {
            zoffset = 8000 + zoffsetoverride;
        }
    #/
    xoffset = cos(var_8945c22a67231e20) * radiusoffset;
    yoffset = sin(var_8945c22a67231e20) * radiusoffset;
    var_78ac3c5ef5263d4f = vectornormalize((xoffset, yoffset, zoffset));
    var_78ac3c5ef5263d4f *= zoffset;
    level.gunshipinuse = 1;
    gunshipIntro = gunship_playintro(player, streakinfo, var_8945c22a67231e20, var_78ac3c5ef5263d4f, var_2136b63785ee0579);
    if (!isdefined(gunshipIntro)) {
        level.gunshipinuse = 0;
        return false;
    }
    gunship = gunship_spawn(player, streakinfo, var_8945c22a67231e20, var_78ac3c5ef5263d4f, gunshipIntro, var_2136b63785ee0579);
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        gunship [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_aaedf89b93495d4f);
    }
    if (!isdefined(gunship)) {
        level.gunshipinuse = 0;
        return false;
    }
    if (utility::iscp()) {
        level.gunship = gunship;
        level.gunship.var_d6604e5e3d0ba3b7 = bundle.var_b702d1aa92e3f7dc;
        level.gunship.var_d6604d5e3d0ba184 = bundle.var_2cb6918da56b085b;
        level.gunship.var_d660505e3d0ba81d = bundle.var_2b83894fc24a37fc;
    }
    if (issharedfuncdefined("hud", "teamPlayerCardSplash")) {
        thread [[ getsharedfunc("hud", "teamPlayerCardSplash") ]]("used_gunship", player);
    }
    if (getdvarint(@"camera_thirdperson")) {
        if (issharedfuncdefined("player", "setThirdPersonDOF")) {
            player [[ getsharedfunc("player", "setThirdPersonDOF") ]](0);
        }
    }
    if (issharedfuncdefined("killstreak", "addToActiveKillstreakList")) {
        gunship [[ getsharedfunc("killstreak", "addToActiveKillstreakList") ]](gunship.streakinfo.streakname, "Killstreak_Air", player);
    }
    setlockedoncallback(gunship, &gunship_lockedoncallback);
    setlockedonremovedcallback(gunship, &gunship_lockedonremovedcallback);
    gunship thread gunship_attachgunner(player);
    gunship thread gunship_watchchangeweapons(player);
    gunship thread gunship_watchweaponfired(player);
    gunship thread gunship_watchthermaltoggle(player);
    gunship thread gunship_watchdamage(player);
    gunship thread gunship_watchtimeout(player);
    gunship thread gunship_watchgameend(player);
    gunship thread function_aafc33d685563aa4(player);
    gunship thread function_5fbd9704078207ad(player);
    gunship thread gunship_watchownerexitaction(player, "disconnect");
    gunship thread gunship_watchownerexitaction(player, "joined_team");
    gunship thread gunship_watchownerexitaction(player, "joined_spectators");
    gunship thread gunship_watchownerexitaction(player, "team_kill_punish");
    gunship thread gunship_watchendgame(player);
    gunship thread gunship_playpilotfx(player);
    gunship thread gunship_linklightfxent();
    gunship thread gunship_linkwingfxents();
    gunship thread gunship_monitormanualplayerexit(player);
    gunship thread gunship_trackvelocity(player);
    gunship thread gunship_watchtargets(player);
    gunship thread function_39464052869b655d(player);
    /#
        thirdpersoncam = getdvarint(@"hash_f49f4fd233809e37", 0);
        if (thirdpersoncam) {
            gunship thread function_45ad456c933cbb32();
            gunship thread function_ae468fe5beababc0(var_2136b63785ee0579);
        }
    #/
    if (issharedfuncdefined("flares", "handleIncomingStinger")) {
        gunship thread [[ getsharedfunc("flares", "handleIncomingStinger") ]](&gunship_handlemissiledetection);
    }
    gunship playloopsound("iw8_ks_ac130_lp");
    if (istrue(player.ksempd)) {
        gunship thread gunship_crash(player);
    }
    return true;
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2e3b
// Size: 0xd7
function function_25233a050a5e41f0(owner, launchorigin) {
    gunshiprig = undefined;
    if (!islargemap()) {
        if (level.gunshiprigs.size > 0) {
            gunshiprig = level.gunshiprigs[0];
        }
    } else if (isdefined(level.gunshiprigs) && level.gunshiprigs.size >= 1) {
        return undefined;
    }
    if (!isdefined(gunshiprig)) {
        gunshiprig = spawn("script_model", launchorigin);
        gunshiprig setmodel("tag_origin");
        gunshiprig.angles = (0, 115, 0);
        gunshiprig hide();
        level.gunshiprigs[level.gunshiprigs.size] = gunshiprig;
        gunshiprig thread gunship_rotaterig();
        if (!islargemap()) {
            gunshiprig thread function_486b043f227fca86();
        }
    }
    return gunshiprig;
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f1b
// Size: 0x3b
function gunship_lockedoncallback() {
    playkillstreakoperatordialog("gunship", "gunship" + "_lockedon", 1, undefined, "pilot");
    scripts\cp_mp\utility\vehicle_omnvar_utility::vehomn_showwarning("missileLocking", self.owner, "killstreak");
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f5e
// Size: 0x1c
function gunship_lockedonremovedcallback() {
    scripts\cp_mp\utility\vehicle_omnvar_utility::vehomn_hidewarning("missileLocking", self.owner, "killstreak");
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x2f82
// Size: 0x8e3
function gunship_playintro(player, streakinfo, angle, anglevector, var_2136b63785ee0579) {
    player endon("disconnect");
    level endon("game_ended");
    thirdpersoncam = 0;
    /#
        thirdpersoncam = getdvarint(@"hash_f49f4fd233809e37", 0);
        if (thirdpersoncam) {
            streakinfo notify("<dev string:x1c>");
        }
    #/
    streakinfo endon("killstreak_finished_with_deploy_weapon");
    player disablephysicaldepthoffieldscripting();
    player gunship_allowstances(0);
    if (!thirdpersoncam) {
        player _stopshellshock();
        player val::group_set("gunshipIntro", 0);
    }
    gunshipIntro = undefined;
    bundle = level.streakglobals.streakbundles["gunship"];
    /#
        level.gunship_animtype = getdvarint(@"hash_a59a7da9fa17c00", 0);
    #/
    if (level.gunship_animtype == 1) {
        var_e4739db3b860ef4 = "intro_gunship";
        var_258b660f7db9aba6 = function_52351c3338da63f4("gunship", var_e4739db3b860ef4);
        gunshipIntro = spawn("script_model", var_2136b63785ee0579.origin);
        gunshipIntro setmodel(bundle.gunship_intromodel);
        gunshipIntro.angles = var_2136b63785ee0579.angles;
        gunshipIntro setotherent(player);
        gunshipIntro.animname = streakinfo.streakname;
        gunshipIntro.owner = player;
        if (!thirdpersoncam) {
            foreach (var_6c3d15091efa3c48 in level.players) {
                if (var_6c3d15091efa3c48 != player) {
                    gunshipIntro hidefromplayer(var_6c3d15091efa3c48);
                }
            }
            gunshipIntro thread gunship_hideintromodelonplayerconnect(player);
        }
        heightoffset = 2000;
        switch (level.mapname) {
        case #"hash_66ce5cdcd3b547f3":
        case #"hash_ff009e5fab42b778":
            heightoffset = 500;
            break;
        }
        gunshipIntro linkto(var_2136b63785ee0579, "tag_origin", anglevector - (0, 0, heightoffset), (0, angle + 90, 0));
        gunshipIntro thread gunship_watchintrodisown("disconnect", streakinfo);
        gunshipIntro thread gunship_watchintrodisown("joined_team", streakinfo);
        gunshipIntro thread gunship_watchintrodisown("joined_spectators", streakinfo);
        waitframe();
        if (!isdefined(gunshipIntro)) {
            return undefined;
        }
        gunshipIntro scripts\common\anim::setanimtree();
        gunshipIntro.var_ba27aac5a0f799e0 = spawn("script_model", gunshipIntro.origin);
        gunshipIntro.var_ba27aac5a0f799e0.angles = gunshipIntro.angles;
        gunshipIntro.var_ba27aac5a0f799e0 setmodel("tag_origin");
        gunshipIntro playsoundtoplayer("iw9_ks_ac130_intro", player);
        if (!thirdpersoncam) {
            player cameralinkto(gunshipIntro, "tag_player", 0, 1);
            player painvisionoff();
            player killstreak_savenvgstate();
            gunshipIntro setscriptablepartstate("clouds_intro", "old", 0);
            gunshipIntro setscriptablepartstate("bodyFX_intro", "on", 0);
            gunshipIntro thread gunship_startintroshake(var_258b660f7db9aba6, player);
            gunshipIntro thread gunship_queuecamerazoom(var_258b660f7db9aba6, player);
            gunshipIntro thread function_c285675bee6618a3(var_258b660f7db9aba6, player);
        }
        player playkillstreakoperatordialog("gunship", "gunship" + "_use", 1, undefined, "pilot");
        gunshipIntro.var_ba27aac5a0f799e0 scripts\common\anim::anim_single_solo(gunshipIntro, var_e4739db3b860ef4);
    } else {
        bundle = level.streakglobals.streakbundles["gunship"];
        introz = 20000;
        foreach (map in bundle.var_b46a22c71ca5e923) {
            if (issubstr(level.mapname, map.name) && isdefined(map.introz)) {
                introz = map.introz;
            }
        }
        animpos = player.origin + anglestoforward(player.angles) * 100 + (0, 0, introz);
        /#
            var_b4a0772c51ea82ee = getdvarint(@"hash_1fa8dffa69ff4ed8", 0);
            animpos += (0, 0, var_b4a0772c51ea82ee);
        #/
        var_d9979e10eec99504 = spawn("script_model", animpos);
        var_d9979e10eec99504 setmodel("veh9_mil_air_gunship_interior_vm");
        var_5cb1f0f95e16878e = [];
        var_5cb1f0f95e16878e["gunship_interior"] = var_d9979e10eec99504;
        var_ba27aac5a0f799e0 = spawn("script_model", var_d9979e10eec99504 gettagorigin("tag_control_desk"));
        var_ba27aac5a0f799e0 setmodel("tag_origin");
        var_ba27aac5a0f799e0.angles = var_d9979e10eec99504 gettagangles("tag_control_desk");
        gunshipIntro = spawnstruct();
        gunshipIntro.owner = player;
        gunshipIntro.gunshipinterior = var_d9979e10eec99504;
        gunshipIntro.var_9bc4ed07a250f4d3 = player function_d176c031e49a9127("gunship_interior_probe", "gunship_shadow_brush");
        gunshipIntro thread gunship_watchintrodisown("disconnect", streakinfo);
        gunshipIntro thread gunship_watchintrodisown("joined_team", streakinfo);
        gunshipIntro thread gunship_watchintrodisown("joined_spectators", streakinfo);
        var_e618f33d2594b25b = undefined;
        foreach (modelindex, animmodel in level.var_9c7d2f4c2fc66b1f) {
            var_4d4d74b2657628ee = var_ba27aac5a0f799e0.origin;
            if (modelindex == "gunship_exterior") {
                var_e618f33d2594b25b = var_4d4d74b2657628ee + (0, 0, 200);
            }
            var_c43a209b29ea8ead = spawn("script_model", var_ba27aac5a0f799e0.origin);
            var_c43a209b29ea8ead setmodel(animmodel);
            var_c43a209b29ea8ead setotherent(player);
            var_c43a209b29ea8ead.angles = var_ba27aac5a0f799e0.angles;
            var_c43a209b29ea8ead.animname = "gunship";
            var_c43a209b29ea8ead scripts\common\anim::setanimtree();
            if (modelindex == "desk") {
                var_e618f33d2594b25b = var_c43a209b29ea8ead;
            }
            if (modelindex == "joystick") {
                var_c43a209b29ea8ead dontinterpolate();
                var_c43a209b29ea8ead.origin = var_e618f33d2594b25b gettagorigin("tag_joystick_1");
                var_c43a209b29ea8ead linkto(var_e618f33d2594b25b);
            }
            var_5cb1f0f95e16878e[modelindex] = var_c43a209b29ea8ead;
        }
        foreach (animent in var_5cb1f0f95e16878e) {
            if (!thirdpersoncam) {
                foreach (var_6c3d15091efa3c48 in level.players) {
                    animent hidefromplayer(var_6c3d15091efa3c48);
                }
                animent thread gunship_hideintromodelonplayerconnect(player);
            }
        }
        gunshipIntro.var_ba27aac5a0f799e0 = var_ba27aac5a0f799e0;
        gunshipIntro.var_5cb1f0f95e16878e = var_5cb1f0f95e16878e;
        var_b8a46ae48904492c = "gunship_exterior";
        var_313a9e6067853ba8 = "intro_" + var_b8a46ae48904492c;
        var_1be95b011eb36224 = getdvarint(@"hash_cc9d9505b48bc357", 0);
        if (var_1be95b011eb36224) {
            level.scr_anim["gunship"][var_313a9e6067853ba8] = script_model%iw9_mp_acharlie130_intro_v2;
        } else {
            level.scr_anim["gunship"][var_313a9e6067853ba8] = script_model%iw9_mp_acharlie130_intro;
        }
        player playsoundtoplayer("iw9_gunship_plr_intro", player);
        player playkillstreakoperatordialog("gunship", "gunship" + "_use", 1, undefined, "pilot");
        player painvisionoff();
        player killstreak_savenvgstate();
        player function_fa9987de43a6169b(gunshipIntro, var_313a9e6067853ba8);
        gunshipIntro function_7eb343dd6a3f639(player, "light_interior_intro", "on", "ks_gunship_interior_intro", 0);
        player function_fa9987de43a6169b(gunshipIntro, "intro");
        gunshipIntro function_7eb343dd6a3f639(player, "light_interior_intro", "off", "ks_gunship_interior_intro", 0.5);
    }
    gunshipIntro notify("gunship_end_intro");
    if (!thirdpersoncam) {
        player disablephysicaldepthoffieldscripting();
        _stopshellshock();
        player val::group_reset("gunshipIntro");
    }
    return gunshipIntro;
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x386e
// Size: 0x5d
function gunship_watchintrodisown(action, streakinfo) {
    self endon("death");
    self endon("gunship_end_intro");
    level endon("game_ended");
    gunshipowner = self.owner;
    gunshipowner waittill(action);
    if (action == "disconnect") {
        level.gunshipinuse = 0;
    }
    gunship_detachplayerfromintro(gunshipowner, streakinfo);
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x38d3
// Size: 0xcc
function gunship_detachplayerfromintro(gunshipowner, streakinfo) {
    thirdpersoncam = 0;
    /#
        thirdpersoncam = getdvarint(@"hash_f49f4fd233809e37", 0);
    #/
    if (isdefined(gunshipowner) && !thirdpersoncam) {
        gunshipowner cameraunlink();
        gunshipowner _stopshellshock();
        gunshipowner disablephysicaldepthoffieldscripting();
        gunshipowner val::group_reset("gunshipIntro");
        gunshipowner _setvisibiilityomnvarforkillstreak(streakinfo.streakname, "off");
        gunshipowner setclientomnvar("ui_gunship_hud", 0);
        gunshipowner painvisionon();
        gunshipowner killstreak_restorenvgstate();
        gunshipowner killstreak_setMainVision("");
        gunshipowner function_8b676f496920e2ab();
        gunshipowner notify("detach_gunship_intro");
        level thread scripts\cp_mp\utility\game_utility::fadetoblackforplayer(gunshipowner, 0);
    }
    streakinfo notify("killstreak_finished_with_deploy_weapon");
    function_3856d3338b2c7ebf(self);
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x39a7
// Size: 0x3c
function gunship_hideintromodelonplayerconnect(owner) {
    self endon("death");
    owner endon("disconnect");
    while (true) {
        level waittill("connected", player);
        self hidefromplayer(player);
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x39eb
// Size: 0x139
function function_c285675bee6618a3(animlength, owner, introsequence) {
    self endon("death");
    owner endon("disconnect");
    owner endon("detach_gunship_intro");
    owner enablephysicaldepthoffieldscripting();
    if (isdefined(introsequence)) {
        if (introsequence == "intro_gunship_exterior") {
            owner setphysicaldepthoffield(1.4, 87, 10, 10);
            phase1dof = animlength * 0.25;
            phase2dof = animlength * 0.65;
            thread function_37b61f53bc7c8643(owner, phase1dof, 2.2, 87, 50, 50);
            thread function_37b61f53bc7c8643(owner, phase2dof, 4, 350, 1, 1);
            return;
        }
        if (introsequence == "intro") {
            owner setphysicaldepthoffield(1.4, 21, 1000, 1000);
            phase1dof = animlength * 0.8;
            thread function_37b61f53bc7c8643(owner, phase1dof, 1.4, 43, 50, 50);
            return;
        }
        owner setphysicaldepthoffield(1.4, 43, 1000, 1000);
        phase1dof = animlength * 0.5;
        phase2dof = animlength * 0.7;
        thread function_37b61f53bc7c8643(owner, phase1dof, 1.4, 20, 50, 50);
        thread function_37b61f53bc7c8643(owner, phase2dof, 3, 100, 50, 50);
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x3b2c
// Size: 0x55
function function_37b61f53bc7c8643(owner, delaytime, fstop, focusdistance, focusspeed, var_5587778bb9d6e798) {
    self endon("death");
    owner endon("disconnect");
    owner endon("detach_gunship_intro");
    wait delaytime;
    owner setphysicaldepthoffield(fstop, focusdistance, focusspeed, var_5587778bb9d6e798);
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3b89
// Size: 0xe4
function gunship_startintroshake(animlength, owner, introsequence) {
    self endon("death");
    owner endon("disconnect");
    owner endon("detach_gunship_intro");
    animtime = animlength;
    eqscale = 0.45;
    shaketime = 0.05;
    if (isdefined(introsequence)) {
        if (introsequence == "intro_gunship_exterior") {
            eqscale = 0.01;
            shaketime = 0.25;
        }
    }
    while (animtime > 0) {
        owner earthquakeforplayer(eqscale, shaketime, self.origin, 5000);
        if (isdefined(introsequence)) {
            if (introsequence == "intro_gunship_exterior") {
                eqscale += 0.01;
                if (eqscale >= 0.1) {
                    eqscale = 0.1;
                }
            }
        } else {
            eqscale -= 0.01;
            if (eqscale <= 0.12) {
                eqscale = 0.12;
            }
        }
        animtime -= shaketime;
        wait shaketime;
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3c75
// Size: 0x60
function gunship_queuecamerazoom(animlength, owner) {
    self endon("death");
    owner endon("disconnect");
    owner endon("detach_gunship_intro");
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(animlength - 0.2);
    owner killstreak_setMainVision("killstreak_slamzoom");
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(0.1);
    level thread scripts\cp_mp\utility\game_utility::fadetoblackforplayer(owner, 1, 0.1);
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3cdd
// Size: 0x57
function function_2be9ae7928984f8(animlength, owner) {
    owner endon("disconnect");
    level endon("game_ended");
    owner endon("detach_gunship_intro");
    wait animlength - 0.3;
    level thread scripts\cp_mp\utility\game_utility::fadetoblackforplayer(owner, 1, 0.3);
    wait 0.7;
    level thread scripts\cp_mp\utility\game_utility::fadetoblackforplayer(owner, 0, 0.3);
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3d3c
// Size: 0x2c1
function gunship_returnplayer(player, crashing) {
    level callback::callback("killstreak_finish_use", {#streakinfo:self.streakinfo});
    if (isdefined(player)) {
        player endon("disconnect");
        thirdpersoncam = 0;
        /#
            thirdpersoncam = getdvarint(@"hash_f49f4fd233809e37", 0);
        #/
        if (!thirdpersoncam) {
            player _stopshellshock();
        }
        player setclientomnvar("ui_killstreak_thermal_mode", 0);
        player setthermalvision(0);
        player _setvisibiilityomnvarforkillstreak(self.streakinfo.streakname, "off");
        player setclientomnvar("ui_gunship_hud", 0);
        player stoploopsound();
        player killstreak_setMainVision("");
        player clearclienttriggeraudiozone(0.5);
        player painvisionon();
        player _stopshellshock();
        player clearcinematicmotionoverride();
        if (issharedfuncdefined("game", "disable_backpack_inventory")) {
            player [[ getsharedfunc("game", "disable_backpack_inventory") ]](0);
        }
        player notify("returning_killstreak_player");
        player.usinggunship = undefined;
        if (getdvarint(@"camera_thirdperson")) {
            if (issharedfuncdefined("player", "setThirdPersonDOF")) {
                player [[ getsharedfunc("player", "setThirdPersonDOF") ]](1);
            }
        }
        if (isdefined(player.gunship_cloudsfx)) {
            player.gunship_cloudsfx delete();
        }
        if (!thirdpersoncam) {
            if (player scripts\cp_mp\utility\player_utility::_isalive()) {
                player _giveweapon(level.var_89d6f5464d64ebf4);
                player _switchtoweaponimmediate(level.var_89d6f5464d64ebf4);
            }
            player unlink();
            if (istrue(crashing) && level.gunship_animtype == 0) {
                player waittill("finished_gunship_anim_outro");
                player killstreak_setMainVision("killstreak_static");
                wait 1;
                player cameraunlink();
                player killstreak_setMainVision("");
            }
            player val::group_reset("gunshipUse");
            player gunship_allowstances(1);
            player function_8b676f496920e2ab();
            player killstreak_restorenvgstate();
            player thread gunship_restoreplayerweapon(self.streakinfo);
        } else {
            /#
                self.streakinfo notify("<dev string:x1c>");
            #/
        }
    }
    function_3856d3338b2c7ebf(self.gunshipIntro);
    gunship_lockedonremovedcallback();
    if (isdefined(self.enemytargetmarkergroup)) {
        scripts\cp_mp\targetmarkergroups::targetmarkergroup_off(self.enemytargetmarkergroup);
    }
    if (isdefined(self.friendlytargetmarkergroup)) {
        scripts\cp_mp\targetmarkergroups::targetmarkergroup_off(self.friendlytargetmarkergroup);
    }
    if (issharedfuncdefined("gunship", "br_respawn")) {
        [[ getsharedfunc("gunship", "br_respawn") ]](player);
    }
    level.gunshipinuse = 0;
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4005
// Size: 0x124
function gunship_restoreplayerweapon(streakinfo) {
    self endon("disconnect");
    streakinfo notify("killstreak_finished_with_deploy_weapon");
    var_263d5a6c4338e56c = getanimlength(script_model%vm_ks_tablet_drop);
    bundle = level.streakglobals.streakbundles["gunship"];
    if (_isalive()) {
        val::set("gunshipExit", "fire", 0);
        val::set("gunshipExit", "allow_movement", 0);
        val::set("gunshipExit", "offhand_weapons", 0);
        val::set("gunshipExit", "mantle", 0);
        val::set("gunshipExit", "melee", 0);
        wait 0.05;
        _switchtoweapon(self.lastdroppableweaponobj);
        wait var_263d5a6c4338e56c;
        _takeweapon(bundle.var_b702d1aa92e3f7dc);
        _takeweapon(bundle.var_2cb6918da56b085b);
        _takeweapon(bundle.var_2b83894fc24a37fc);
        _takeweapon(level.var_89d6f5464d64ebf4);
        val::reset_all("gunshipExit");
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4131
// Size: 0x4de
function gunship_watchdamage(gunner) {
    self endon("death");
    self endon("crashing");
    level endon("game_ended");
    self.damagetaken = 0;
    self.attractor = missile_createattractorent(self, 1000, 4096);
    bundle = level.streakglobals.streakbundles["gunship"];
    while (true) {
        self waittill("damage", damage, attacker, direction_vec, point, smeansofdeath, modelname, tagname, partname, idflags, objweapon);
        thirdpersoncam = undefined;
        debugdamage = undefined;
        /#
            thirdpersoncam = getdvarint(@"hash_f49f4fd233809e37", 0);
            debugdamage = istrue(self.debugdamage);
        #/
        if (isdefined(level.teambased) && isplayer(attacker) && attacker.team == self.team && (!isdefined(thirdpersoncam) || !thirdpersoncam) && (!isdefined(debugdamage) || !debugdamage)) {
            continue;
        }
        if (smeansofdeath == "MOD_RIFLE_BULLET" || smeansofdeath == "MOD_PISTOL_BULLET" || smeansofdeath == "MOD_EXPLOSIVE_BULLET") {
            continue;
        }
        if (isdefined(gunner) && gunner isusinggunship()) {
            var_bb22d61320ffe92d = "light";
            if (isexplosivedamagemod(smeansofdeath)) {
                if (ceil(damage / self.maxhealth) >= bundle.var_900fc143f1a96ed2) {
                    gunner earthquakeforplayer(0.25, 0.2, self.camera.origin, 150);
                    gunner playrumbleonentity("damage_heavy");
                    var_bb22d61320ffe92d = "heavy";
                } else {
                    gunner earthquakeforplayer(0.15, 0.15, self.camera.origin, 150);
                    gunner playrumbleonentity("damage_light");
                }
            }
            gunner function_c144de677d9b9175(self.currentvisionset, var_bb22d61320ffe92d);
        }
        self.wasdamaged = 1;
        modifieddamage = undefined;
        if (isdefined(debugdamage)) {
            modifieddamage = damage;
        } else if (issharedfuncdefined("killstreak", "getModifiedAntiKillstreakDamage")) {
            modifieddamage = self [[ getsharedfunc("killstreak", "getModifiedAntiKillstreakDamage") ]](attacker, objweapon, smeansofdeath, damage, self.maxhealth, 4, 5, 25, 0, 350);
        }
        if (isplayer(attacker)) {
            if (issharedfuncdefined("damage", "updateDamageFeedback")) {
                attacker [[ getsharedfunc("damage", "updateDamageFeedback") ]]("hitequip");
            }
        }
        if (issharedfuncdefined("killstreak", "killstreakHit")) {
            [[ getsharedfunc("killstreak", "killstreakHit") ]](attacker, objweapon, self, smeansofdeath, modifieddamage);
        }
        if (isdefined(attacker.owner) && isplayer(attacker.owner)) {
            if (issharedfuncdefined("damage", "updateDamageFeedback")) {
                attacker.owner [[ getsharedfunc("damage", "updateDamageFeedback") ]]("hitequip");
            }
        }
        self.damagetaken += modifieddamage;
        self.currenthealth -= modifieddamage;
        killstreak_updateDamageState(self.currenthealth);
        if (self.damagetaken >= self.maxhealth) {
            streakname = self.streakinfo.streakname;
            damagetype = undefined;
            scorepopupname = "destroyed_" + streakname;
            leaderdialog = undefined;
            cardsplash = "callout_destroyed_" + streakname;
            skipdeathnotify = 1;
            if (isplayer(attacker)) {
                if (issharedfuncdefined("hud", "teamPlayerCardSplash")) {
                    thread [[ getsharedfunc("hud", "teamPlayerCardSplash") ]](cardsplash, attacker);
                }
            }
            if (scripts\engine\utility::issharedfuncdefined("damage", "onKillstreakKilled") && isdefined(attacker) && (isplayer(attacker) || isdefined(attacker.owner))) {
                var_3737240cefe2c793 = self [[ scripts\engine\utility::getsharedfunc("damage", "onKillstreakKilled") ]](streakname, attacker, objweapon, damagetype, damage, scorepopupname, leaderdialog, cardsplash, skipdeathnotify);
            }
            thread gunship_crash(gunner);
        }
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4617
// Size: 0x70
function function_fd00f7fcdbcd8972() {
    self setscriptablepartstate("body_damage_light", "on");
    gunner = self.owner;
    if (isdefined(gunner) && gunner isusinggunship()) {
        self.flashlight setscriptablepartstate("camera_damage_light", "on");
        gunner playkillstreakoperatordialog("gunship", "gunship" + "_light_damage", 1, undefined, "pilot");
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x468f
// Size: 0x9b
function function_ab0ec37ba0afd257() {
    self setscriptablepartstate("body_damage_light", "off");
    self setscriptablepartstate("body_damage_medium", "on");
    gunner = self.owner;
    if (isdefined(gunner) && gunner isusinggunship()) {
        self.flashlight setscriptablepartstate("camera_damage_medium", "on");
        gunner playkillstreakoperatordialog("gunship", "gunship" + "_med_damage", 1, undefined, "pilot");
        gunner playlocalsound("ks_ac130_damage_warning");
        gunner setclienttriggeraudiozone("gunship_killstreak_damaged", 2);
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4732
// Size: 0x89
function function_cf130118900c4c47() {
    self setscriptablepartstate("body_damage_medium", "off");
    self setscriptablepartstate("contrails", "off");
    thread gunship_startengineblowoutfx();
    gunner = self.owner;
    if (isdefined(gunner) && gunner isusinggunship()) {
        self.flashlight setscriptablepartstate("camera_damage_heavy", "on");
        gunner playkillstreakoperatordialog("gunship", "gunship" + "_heavy_damage", 1, undefined, "pilot");
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x47c3
// Size: 0x8c
function gunship_startengineblowoutfx() {
    level endon("game_ended");
    self.leftwingfxent setscriptablepartstate("engine_blowout", "on");
    self.leftwingfxent setscriptablepartstate("body_damage_heavy", "on");
    randomwait = randomfloatrange(0.5, 1);
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(randomwait);
    self.rightwingfxent setscriptablepartstate("engine_blowout", "on");
    self.rightwingfxent setscriptablepartstate("body_damage_heavy", "on");
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4857
// Size: 0x40
function gunship_watchtimeout(gunner) {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    level endon("game_ended");
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(self.timeout);
    thread gunship_leave(gunner);
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x489f
// Size: 0x3b
function gunship_watchgameend(gunner) {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    level waittill_any_2("start_game_ended", "game_ended");
    thread gunship_leave(gunner);
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x48e2
// Size: 0xd5
function gunship_leave(gunner) {
    self endon("death");
    self endon("crashing");
    level endon("game_ended");
    self notify("leaving");
    self unlink();
    self rotateroll(30, 3);
    currentangles = self.angles;
    currentdir = anglestoforward(currentangles);
    if (isdefined(self.owner)) {
        self.owner playkillstreakoperatordialog("gunship", "gunship" + "_leave", 1, undefined, "pilot");
    }
    thread gunship_returnplayer(gunner);
    self moveto(self.origin + currentdir * 50000, 10, 5);
    gunship_waittilldestination(self.origin + currentdir * 50000);
    gunship_removeplane(0);
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x49bf
// Size: 0x23
function gunship_waittilldestination(destination) {
    while (isdefined(self) && self.origin != destination) {
        waitframe();
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x49ea
// Size: 0x3c
function gunship_watchownerexitaction(gunner, var_304d14a0f176d5c3) {
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    level endon("game_ended");
    gunner waittill(var_304d14a0f176d5c3);
    thread gunship_crash(gunner);
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4a2e
// Size: 0x5c
function gunship_watchendgame(gunner) {
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    gunner endon("disconnect");
    level waittill("game_ended");
    gunner _setvisibiilityomnvarforkillstreak(self.streakinfo.streakname, "off");
    gunner setclientomnvar("ui_gunship_hud", 0);
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4a92
// Size: 0x87
function gunship_trackvelocity(gunner) {
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    level endon("game_ended");
    self.velocity = (0, 0, 0);
    while (true) {
        self.lastorigin = self.origin;
        wait level.framedurationseconds;
        self.velocity = (self.origin - self.lastorigin) / level.framedurationseconds;
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x4b21
// Size: 0x34a
function gunship_spawn(owner, streakinfo, angle, anglevector, gunshipIntro, var_2136b63785ee0579) {
    bundle = level.streakglobals.streakbundles["gunship"];
    gunship = spawn("script_model", var_2136b63785ee0579.origin);
    gunship setmodel(bundle.var_9db3c2a9aa0ab053);
    gunship setcandamage(1);
    gunship.currenthealth = bundle.maxhealth;
    gunship.maxhealth = gunship.currenthealth;
    gunship.health = 99999;
    gunship.owner = owner;
    gunship.team = owner.team;
    gunship.gunshipIntro = gunshipIntro;
    gunship.var_2136b63785ee0579 = var_2136b63785ee0579;
    gunship.ispiloted = 1;
    gunship.timeout = bundle.gunship_lifetime;
    if (issharedfuncdefined("gunship", "attachXRays")) {
        gunship = [[ getsharedfunc("gunship", "attachXRays") ]](gunship);
    }
    gunship.hellfireloaded = 1;
    hellfiretarget = spawn("script_model", gunship.origin);
    hellfiretarget setmodel("tag_origin");
    gunship.hellfiretarget = hellfiretarget;
    if (islargemap()) {
        var_2136b63785ee0579 thread function_f14aa90c4ef905d2(gunship);
    }
    gunship scripts\mp\sentientpoolmanager::registersentient("Killstreak_Air", owner, undefined, undefined, 1, 0);
    gunship function_cfc5e3633ef950fd(1, bundle.var_bfb39f38f09df343, &function_fd00f7fcdbcd8972);
    gunship function_cfc5e3633ef950fd(2, bundle.var_bde8ccf56d975fe4, &function_ab0ec37ba0afd257);
    gunship function_cfc5e3633ef950fd(3, bundle.var_a59fd30a2552ed85, &function_cf130118900c4c47);
    /#
        timeoutoverride = getdvarint(@"hash_fa402c92e4148a39", bundle.gunship_lifetime);
        var_2a98d1683cf44153 = getdvarint(@"hash_2c01d701bac5d9d3", 0);
        if (var_2a98d1683cf44153) {
            timeoutoverride = 9999;
        }
        gunship.timeout = timeoutoverride;
    #/
    if (isdefined(level.var_aa1e2ad7dc79adc6)) {
        gunship.timeout = level.var_aa1e2ad7dc79adc6;
    }
    gunship.flaresreservecount = bundle.var_b5d84be31a39bf30;
    gunship.streakinfo = streakinfo;
    gunship scriptmoveroutline();
    gunship scriptmoverthermal();
    gunship setotherent(owner);
    minimapid = undefined;
    if (scripts\engine\utility::issharedfuncdefined("game", "createObjective")) {
        minimapid = gunship [[ scripts\engine\utility::getsharedfunc("game", "createObjective") ]]("hud_icon_minimap_killstreak_gunship", gunship.team, 0, 1, 1);
    }
    gunship.minimapid = minimapid;
    gunship linkto(var_2136b63785ee0579, "tag_origin", anglevector, (0, angle + 90, -30));
    level notify("matchrecording_plane", gunship);
    return gunship;
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4e74
// Size: 0x4f
function gunship_updateoverlaycoords(plane) {
    plane endon("death");
    plane endon("crashing");
    plane endon("leaving");
    self endon("disconnect");
    level endon("game_ended");
    wait 0.05;
    thread gunship_updateplanemodelcoords(plane);
    thread gunship_updateplayerpositioncoords(plane);
    thread gunship_updateaimingcoords(plane);
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4ecb
// Size: 0x98
function gunship_updateplanemodelcoords(plane) {
    plane endon("death");
    plane endon("crashing");
    plane endon("leaving");
    self endon("disconnect");
    level endon("game_ended");
    while (true) {
        self setclientomnvar("ui_gunship_coord1_posx", int(plane.origin[0]));
        self setclientomnvar("ui_gunship_coord1_posy", int(plane.origin[1]));
        self setclientomnvar("ui_gunship_coord1_posz", int(plane.origin[2]));
        wait 0.5;
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4f6b
// Size: 0x85
function gunship_updateplayerpositioncoords(plane) {
    plane endon("death");
    plane endon("crashing");
    plane endon("leaving");
    self endon("disconnect");
    level endon("game_ended");
    waitframe();
    self setclientomnvar("ui_gunship_coord2_posx", int(self.origin[0]));
    self setclientomnvar("ui_gunship_coord2_posy", int(self.origin[1]));
    self setclientomnvar("ui_gunship_coord2_posz", int(self.origin[2]));
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4ff8
// Size: 0xb9
function gunship_updateaimingcoords(plane) {
    plane endon("death");
    plane endon("crashing");
    plane endon("leaving");
    self endon("disconnect");
    level endon("game_ended");
    while (true) {
        starttrace = self getvieworigin();
        endtrace = starttrace + anglestoforward(self getplayerangles()) * 15000;
        endpos = physicstrace(starttrace, endtrace);
        self setclientomnvar("ui_gunship_coord3_posx", int(endpos[0]));
        self setclientomnvar("ui_gunship_coord3_posy", int(endpos[1]));
        self setclientomnvar("ui_gunship_coord3_posz", int(endpos[2]));
        wait 0.1;
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x50b9
// Size: 0xbd
function gunship_rotaterig() {
    self endon("death");
    var_25bb708a7d591131 = 10;
    rotatetime = level.gunship_speed["rotate"] / 360 * var_25bb708a7d591131;
    self rotateyaw(self.angles[2] + var_25bb708a7d591131, rotatetime, rotatetime, 0);
    degreespersecond = 360 / level.gunship_speed["rotate"];
    var_31fc5244269dae18 = degreespersecond * 0.0174533;
    level.gunship_magnitude = var_31fc5244269dae18 * 9000;
    while (true) {
        self rotateyaw(360, level.gunship_speed["rotate"]);
        wait level.gunship_speed["rotate"];
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x517e
// Size: 0x4b6
function gunship_attachgunner(gunner) {
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    gunner killstreak_setMainVision("");
    level thread scripts\cp_mp\utility\game_utility::fadetoblackforplayer(gunner, 0, 0.1);
    /#
        thirdpersoncam = getdvarint(@"hash_f49f4fd233809e37", 0);
        if (thirdpersoncam) {
            if (level.gunship_animtype == 1) {
                function_3856d3338b2c7ebf(self.gunshipIntro);
            } else {
                gunner function_5efa20e5c624be8f(self.gunshipIntro);
            }
            self.streakinfo notify("<dev string:x1c>");
            return;
        }
    #/
    bundle = level.streakglobals.streakbundles["gunship"];
    gunner _giveweapon(bundle.var_b702d1aa92e3f7dc);
    gunner _giveweapon(bundle.var_2cb6918da56b085b);
    gunner _giveweapon(bundle.var_2b83894fc24a37fc);
    gunner _switchtoweaponimmediate(bundle.var_b702d1aa92e3f7dc);
    if (isdefined(level.gunshipvisionset)) {
        self.currentvisionset = level.gunshipvisionset;
    } else {
        self.currentvisionset = bundle.var_7a35928e082dd9b7;
        if (isdefined(level.mapname) && (issubstr(level.mapname, "mp_shipment") || issubstr(level.mapname, "mp_skerries"))) {
            self.currentvisionset = bundle.var_6070115b879adfc9;
        }
    }
    waitframe();
    gunner cameraunlink();
    if (level.gunship_animtype == 1) {
        function_3856d3338b2c7ebf(self.gunshipIntro);
    } else {
        gunner function_5efa20e5c624be8f(self.gunshipIntro);
    }
    self.camera = spawn("script_model", self.origin - (0, 0, 20));
    self.camera setmodel("tag_player");
    self.camera.angles = vectortoangles(self.var_2136b63785ee0579.origin - self.camera.origin);
    self.camera linkto(self);
    if (isbot(gunner)) {
        gunner cameralinkto(self.camera, "tag_player");
        return;
    }
    arcclamps = function_58415bfdad59562c(bundle);
    gunner playkillstreakoperatordialog("gunship", "gunship" + "_engage", 1, undefined, "pilot");
    gunner.usinggunship = 1;
    gunner playerlinkweaponviewtodelta(self.camera, "tag_player", 1, arcclamps[0], arcclamps[1], arcclamps[2], arcclamps[3], 0, 1, 1);
    gunner playerlinkedsetviewznear(0);
    gunner killstreak_setMainVision(self.currentvisionset);
    gunner setclienttriggeraudiozone("gunship_killstreak", 2);
    gunner setplayerangles(self.camera.angles);
    gunner val::set("gunshipUse", "ads", 1);
    gunner setcinematicmotionoverride("player_gunship_ride_mp");
    gunner thread function_d13d2a81214fbfb8("65_instant_noscale");
    gunner _setvisibiilityomnvarforkillstreak(self.streakinfo.streakname, "on");
    gunner setclientomnvar("ui_gunship_hud", 1);
    gunner setclientomnvar("ui_killstreak_weapon_1_ammo", gunner getweaponammoclip(bundle.var_b702d1aa92e3f7dc));
    gunner setclientomnvar("ui_killstreak_weapon_2_ammo", gunner getweaponammoclip(bundle.var_2cb6918da56b085b));
    gunner setclientomnvar("ui_killstreak_weapon_3_ammo", gunner getweaponammoclip(bundle.var_2b83894fc24a37fc));
    gunner setclientomnvar("ui_killstreak_countdown", gettime() + int(self.timeout * 1000));
    gunner setclientomnvar("ui_killstreak_health", self.maxhealth);
    gunner setclientomnvar("ui_killstreak_flares", self.flaresreservecount);
    gunner setclientomnvar("ui_killstreak_damage_state", 0);
    gunner _shellshock("killstreak_veh_camera_mp", "top", self.timeout, 0);
    gunner _stopshellshock();
    gunner val::group_set("gunshipUse", 0);
    if (issharedfuncdefined("gunship", "assignTargetMarkers")) {
        self thread [[ getsharedfunc("gunship", "assignTargetMarkers") ]](gunner);
    }
    gunner thread gunship_updateoverlaycoords(self);
    thread function_9214536761e6be23(bundle.var_b702d1aa92e3f7dc);
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x563c
// Size: 0x1ce
function function_58415bfdad59562c(bundle) {
    rightarcclamp = 100;
    leftarcclamp = 100;
    toparcclamp = 17;
    bottomarcclamp = 90;
    foreach (map in bundle.var_b46a22c71ca5e923) {
        if (issubstr(level.mapname, map.name)) {
            if (isdefined(map.rightarcclamp)) {
                rightarcclamp = map.var_fbfc9b3202a01d51;
            }
            if (isdefined(map.leftarcclamp)) {
                leftarcclamp = map.var_112ab36579abf6b2;
            }
            if (isdefined(map.toparcclamp)) {
                toparcclamp = map.var_63dc0140ad437800;
            }
            if (isdefined(map.bottomarcclamp)) {
                bottomarcclamp = map.var_858f316c3c5c0478;
            }
            break;
        }
    }
    /#
        if (getdvarint(@"hash_a9dd72f919820c3c", -1) >= 0) {
            rightarcclamp = getdvarint(@"hash_a9dd72f919820c3c", -1);
        }
        if (getdvarint(@"hash_f6f54c4504a08e99", -1) >= 0) {
            leftarcclamp = getdvarint(@"hash_f6f54c4504a08e99", -1);
        }
        if (getdvarint(@"hash_be524367b2923ffd", -1) >= 0) {
            toparcclamp = getdvarint(@"hash_be524367b2923ffd", -1);
        }
        if (getdvarint(@"hash_276a14d37ceed71f", -1) >= 0) {
            bottomarcclamp = getdvarint(@"hash_276a14d37ceed71f", -1);
        }
    #/
    return [rightarcclamp, leftarcclamp, toparcclamp, bottomarcclamp];
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5813
// Size: 0xc2
function function_623a9b1b10d1db2e(gunner) {
    gunner endon("disconnect");
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    level endon("game_ended");
    if (!ismp()) {
        return;
    }
    if (!istrue(level.gunship_lockon)) {
        return;
    }
    thread function_7f87e01d436c03cc(gunner);
    while (true) {
        if (gunner adsbuttonpressed()) {
            currentweapon = gunner getcurrentweapon();
            bundle = level.streakglobals.streakbundles["gunship"];
            if (currentweapon.basename == bundle.var_b702d1aa92e3f7dc) {
                function_dceaa78f8d315302(gunner, 1);
                self notify("gunship_reset_hellfire_lockon");
            }
        }
        waitframe();
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x58dd
// Size: 0x92
function function_7f87e01d436c03cc(gunner) {
    gunner endon("disconnect");
    level endon("game_ended");
    while (true) {
        result = waittill_any_return_4("death", "leaving", "crashing", "gunship_reset_hellfire_lockon");
        if (issharedfuncdefined("gunship", "ResetMissileLauncherLocking")) {
            gunner [[ getsharedfunc("gunship", "ResetMissileLauncherLocking") ]]();
        }
        gunner.var_2bd8b6befeeb2b63 = undefined;
        gunner setclientomnvar("ui_gunship_hellfire_lockon", 0);
        if (result != "gunship_reset_hellfire_lockon") {
            break;
        }
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5977
// Size: 0x2e5
function function_dceaa78f8d315302(gunner, var_cc706c96147ed540) {
    gunner endon("disconnect");
    level endon("game_ended");
    while (gunner adsbuttonpressed()) {
        if ((gunner playerads() >= 0.95 || istrue(var_cc706c96147ed540)) && istrue(self.hellfireloaded)) {
            gunner.missilelauncheruseentered = 1;
            targets = [];
            if (issharedfuncdefined("gunship", "lockOnLaunchers_getTargetArray")) {
                targets = [[ getsharedfunc("gunship", "lockOnLaunchers_getTargetArray") ]](0);
            }
            if (targets.size == 0) {
                self notify("gunship_reset_hellfire_lockon");
                waitframe();
                continue;
            }
            targets = sortbydistance(targets, gunner.origin);
            if (!isdefined(gunner.missilelauncherstage)) {
                gunner.missilelauncherstage = 0;
            }
            if (gunner.missilelauncherstage == 0) {
                var_1fe8eeb95943f79f = undefined;
                var_c7f50dd357b9cdcf = 0;
                foreach (target in targets) {
                    if (!isdefined(target)) {
                        continue;
                    }
                    var_1fe8eeb95943f79f = function_a3ec651ef5989fb9(gunner, target);
                    if (isdefined(var_1fe8eeb95943f79f)) {
                        break;
                    }
                }
                if (!isdefined(var_1fe8eeb95943f79f)) {
                    self notify("gunship_reset_hellfire_lockon");
                    waitframe();
                    continue;
                }
                gunner.missilelaunchertarget = var_1fe8eeb95943f79f.target;
                gunner.missilelauncherlockstarttime = gettime();
                gunner.missilelauncherlostsightlinetime = 0;
                if (isdefined(gunner.missilelaunchertarget)) {
                    addlockedon(gunner.missilelaunchertarget, gunner);
                }
                thread function_2b613e06060d8b55(gunner);
                gunner.missilelauncherstage = 1;
            }
            if (gunner.missilelauncherstage == 1) {
                var_f05aefecc4f91279 = function_a3ec651ef5989fb9(gunner);
                if (!isdefined(var_f05aefecc4f91279)) {
                    self notify("gunship_reset_hellfire_lockon");
                    waitframe();
                    continue;
                }
                timepassed = gettime() - gunner.missilelauncherlockstarttime;
                if (timepassed < 500) {
                    waitframe();
                    continue;
                }
                self notify("stop_gunship_hellfire_locking_sfx");
                thread function_75eee29aa3795a05(gunner);
                gunner.missilelauncherstage = 2;
            }
            if (gunner.missilelauncherstage == 2) {
                var_f05aefecc4f91279 = function_a3ec651ef5989fb9(gunner);
                if (!isdefined(var_f05aefecc4f91279)) {
                    self notify("gunship_reset_hellfire_lockon");
                    waitframe();
                    continue;
                }
                if (!istrue(gunner.var_2bd8b6befeeb2b63)) {
                    gunner setclientomnvar("ui_gunship_hellfire_lockon", 1);
                    gunner.var_2bd8b6befeeb2b63 = 1;
                    if (issharedfuncdefined("gunship", "missileLauncher_finalizeLock")) {
                        gunner [[ getsharedfunc("gunship", "missileLauncher_finalizeLock") ]](var_f05aefecc4f91279);
                    }
                    waitframe();
                    continue;
                }
            }
        }
        waitframe();
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5c64
// Size: 0x92
function function_2b613e06060d8b55(gunner) {
    gunner endon("disconnect");
    self endon("death");
    self endon("crashing");
    self endon("explode");
    self endon("gunship_reset_hellfire_lockon");
    self endon("stop_gunship_hellfire_locking_sfx");
    level endon("game_ended");
    bundle = level.streakglobals.streakbundles["gunship"];
    while (true) {
        gunner playlocalsound(bundle.var_8d665c5e920f57d7);
        gunner playrumbleonentity(bundle.var_dda37cdc1cceaa1d);
        wait 0.6;
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5cfe
// Size: 0x8b
function function_75eee29aa3795a05(gunner) {
    gunner endon("disconnect");
    self endon("death");
    self endon("crashing");
    self endon("explode");
    self endon("gunship_reset_hellfire_lockon");
    level endon("game_ended");
    bundle = level.streakglobals.streakbundles["gunship"];
    gunner playlocalsound(bundle.var_615f5055e4f0b368);
    while (true) {
        gunner playrumbleonentity(bundle.var_f21822264fab160);
        wait 0.25;
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5d91
// Size: 0x1bb
function function_a3ec651ef5989fb9(gunner, targetoverride) {
    var_e688b198aa9a4b3f = 0;
    /#
        var_e688b198aa9a4b3f = getdvarint(@"hash_10368af4dee3ba2c", 0);
    #/
    lockontarget = undefined;
    if (isdefined(gunner.missilelaunchertarget)) {
        lockontarget = gunner.missilelaunchertarget;
    } else if (isdefined(targetoverride)) {
        lockontarget = targetoverride;
    }
    if (!isdefined(lockontarget)) {
        return undefined;
    }
    if (!var_e688b198aa9a4b3f && lockontarget scripts\cp_mp\vehicles\vehicle::isvehicle() && scripts\cp_mp\vehicles\vehicle::vehicle_isfriendlytoplayer(lockontarget, gunner)) {
        return undefined;
    }
    var_1fe8eeb95943f79f = undefined;
    if (issharedfuncdefined("gunship", "stingTargStruct_create")) {
        var_1fe8eeb95943f79f = [[ getsharedfunc("gunship", "stingTargStruct_create") ]](gunner, lockontarget);
    }
    if (!isdefined(var_1fe8eeb95943f79f)) {
        return undefined;
    }
    if (issharedfuncdefined("gunship", "stingTargStruct_getOffsets")) {
        var_1fe8eeb95943f79f [[ getsharedfunc("gunship", "stingTargStruct_getOffsets") ]]();
    }
    if (issharedfuncdefined("gunship", "stingTargStruct_getOrigins")) {
        var_1fe8eeb95943f79f [[ getsharedfunc("gunship", "stingTargStruct_getOrigins") ]]();
    }
    if (issharedfuncdefined("gunship", "stingTargStruct_getInReticle")) {
        var_1fe8eeb95943f79f [[ getsharedfunc("gunship", "stingTargStruct_getInReticle") ]]();
    }
    if (issharedfuncdefined("gunship", "stingTargStruct_isInReticle")) {
        if (!var_1fe8eeb95943f79f [[ getsharedfunc("gunship", "stingTargStruct_isInReticle") ]]()) {
            return undefined;
        }
    }
    if (issharedfuncdefined("gunship", "stingTargStruct_getInLOS")) {
        var_1fe8eeb95943f79f [[ getsharedfunc("gunship", "stingTargStruct_getInLOS") ]]();
    }
    if (issharedfuncdefined("gunship", "SoftSightTest")) {
        if (!gunner [[ getsharedfunc("gunship", "SoftSightTest") ]](var_1fe8eeb95943f79f)) {
            return undefined;
        }
    }
    return var_1fe8eeb95943f79f;
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5f55
// Size: 0x2da
function gunship_watchchangeweapons(gunner) {
    gunner endon("disconnect");
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    level endon("game_ended");
    /#
        thirdpersoncam = getdvarint(@"hash_f49f4fd233809e37", 0);
        if (thirdpersoncam) {
            return;
        }
    #/
    bundle = level.streakglobals.streakbundles["gunship"];
    weaponlistorder = [bundle.var_b702d1aa92e3f7dc, bundle.var_2cb6918da56b085b, bundle.var_2b83894fc24a37fc];
    currentweaponindex = weaponlistorder.size;
    if (!isai(gunner)) {
        gunner notifyonplayercommand("gunship_switch_weapon_next", "+weapnext");
        gunner notifyonplayercommand("gunship_switch_weapon_next", "selectweapon2");
        gunner notifyonplayercommand("gunship_switch_weapon_prev", "+weapprev");
        gunner notifyonplayercommand("gunship_switch_weapon_prev", "selectweapon1");
        gunner setclientomnvar("ui_killstreak_weapon", currentweaponindex);
    }
    while (true) {
        cmd = gunner waittill_any_return_2("gunship_switch_weapon_prev", "gunship_switch_weapon_next");
        if (!isdefined(cmd)) {
            continue;
        }
        gunner playlocalsound("iw8_ks_ac130_weaponswitch");
        currentweapon = gunner getcurrentweapon();
        newweapon = currentweapon;
        foreach (index, weapon in weaponlistorder) {
            if (currentweapon.basename == weapon) {
                if (cmd == "gunship_switch_weapon_prev") {
                    newweaponindex = index - 1;
                    if (newweaponindex < 0) {
                        newweaponindex = weaponlistorder.size - 1;
                    }
                } else {
                    newweaponindex = index + 1;
                    if (newweaponindex > weaponlistorder.size - 1) {
                        newweaponindex = 0;
                    }
                }
                newweapon = weaponlistorder[newweaponindex];
                break;
            }
        }
        if (newweapon != bundle.var_b702d1aa92e3f7dc) {
            gunner notify("gunship_hellfire_disable_tracking");
        }
        gunner _switchtoweaponimmediate(newweapon);
        if (self.currentvisionset == function_44e0bd95b98288ab()) {
            dofinfo = gunship_getdofinfobyweapon(newweapon);
            gunner setphysicaldepthoffield(dofinfo.fstop, dofinfo.focusdistance, 20, 20);
        }
        if (cmd == "gunship_switch_weapon_prev") {
            currentweaponindex++;
            if (currentweaponindex > weaponlistorder.size) {
                currentweaponindex = 1;
            }
        } else {
            currentweaponindex--;
            if (currentweaponindex == 0) {
                currentweaponindex = weaponlistorder.size;
            }
        }
        gunner setclientomnvar("ui_killstreak_weapon", currentweaponindex);
        gunner function_58707ddfdd9744fa("killstreak_weapon_change_shutter");
        thread function_9214536761e6be23(newweapon);
        scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(0.4);
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6237
// Size: 0x1c3
function gunship_watchweaponfired(gunner) {
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    level endon("game_ended");
    /#
        thirdpersoncam = getdvarint(@"hash_f49f4fd233809e37", 0);
        if (thirdpersoncam) {
            return;
        }
    #/
    streakinfo = self.streakinfo;
    bundle = level.streakglobals.streakbundles["gunship"];
    while (true) {
        gunner waittill("missile_fire", projectile);
        projectile.streakinfo = streakinfo;
        streakinfo.shots_fired++;
        weapon = gunner getcurrentweapon();
        currentammo = gunner getweaponammoclip(weapon);
        if (weapon.basename == bundle.var_b702d1aa92e3f7dc) {
            earthquake(0.2, 1, self.origin, 1000);
            gunner setclientomnvar("ui_killstreak_weapon_1_ammo", currentammo);
            projectile thread function_3f087cf63f4156fa(self, gunner);
        } else if (weapon.basename == bundle.var_2cb6918da56b085b) {
            earthquake(0.1, 0.5, self.origin, 1000);
            gunner setclientomnvar("ui_killstreak_weapon_2_ammo", currentammo);
        } else if (weapon.basename == bundle.var_2b83894fc24a37fc) {
            gunner setclientomnvar("ui_killstreak_weapon_3_ammo", currentammo);
        }
        projectile thread function_ccaa72b347c823bb(self, gunner, weapon.basename);
        if (currentammo == 0) {
            gunner thread gunship_weaponreload(weapon, self);
        }
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6402
// Size: 0x71
function getmissileexplscale(weaponname) {
    scale = 1;
    bundle = level.streakglobals.streakbundles["gunship"];
    if (weaponname == bundle.var_b702d1aa92e3f7dc) {
        scale = 0.75;
    } else if (weaponname == bundle.var_2cb6918da56b085b) {
        scale = 0.5;
    }
    return scale;
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x647c
// Size: 0x85
function getmissileexplradius(weaponname) {
    radius = 1;
    bundle = level.streakglobals.streakbundles["gunship"];
    if (weaponname == bundle.var_b702d1aa92e3f7dc) {
        radius = 2000;
    } else if (weaponname == bundle.var_2cb6918da56b085b) {
        radius = 1300;
    } else if (weaponname == bundle.var_2b83894fc24a37fc) {
        radius = 700;
    }
    return radius;
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x650a
// Size: 0xa9
function function_3f087cf63f4156fa(gunship, gunner) {
    gunship endon("death");
    gunship endon("leaving");
    gunship endon("crashing");
    gunner endon("disconnect");
    self endon("death");
    targetent = gunship.hellfiretarget;
    if (isdefined(gunner.missilelaunchertarget) && isdefined(gunner.missilelauncherstage) && gunner.missilelauncherstage == 2) {
        targetent = gunner.missilelaunchertarget;
        gunship notify("gunship_reset_hellfire_lockon");
    }
    self missile_settargetent(targetent);
    gunner waittill("gunship_hellfire_disable_tracking");
    self missile_cleartarget();
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x65bb
// Size: 0x3c
function gunship_watchthermaltoggle(gunner) {
    if (!isai(gunner)) {
        gunner thread watchthermalinputchange();
    }
    gunship_watchthermaltoggleinternal(gunner);
    if (isdefined(gunner) && !isai(gunner)) {
        gunner stopwatchingthermalinputchange();
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x65ff
// Size: 0x36b
function gunship_watchthermaltoggleinternal(gunner) {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    gunner endon("disconnect");
    level endon("game_ended");
    self.flashlight = spawn("script_model", self.origin);
    self.flashlight setmodel("ks_gunship_mp");
    self.flashlight dontinterpolate();
    self.flashlight thread gunship_watchthermalflashlightpos(self, gunner);
    if (isnightmap()) {
        self.flashlight thread gunship_showflashlight();
    }
    togglethermal = 0;
    var_9b037229590a3dc2 = 1;
    bundle = level.streakglobals.streakbundles["gunship"];
    /#
        thirdpersoncam = getdvarint(@"hash_f49f4fd233809e37", 0);
        if (thirdpersoncam) {
            var_9b037229590a3dc2 = 0;
        }
    #/
    var_41799da9b6cce8be = 12;
    var_a044168d7664b127 = 1000;
    thermalvisionset = function_44e0bd95b98288ab();
    if (utility::iscp() && isdefined(level.var_f02a7fe4a43f02ee)) {
        function_c0b0a582ff9e4d57(level.var_f02a7fe4a43f02ee);
        thermalvisionset = level.var_f02a7fe4a43f02ee;
    }
    if (isnightmap() && istrue(var_9b037229590a3dc2)) {
        gunner setthermalvision(1, var_41799da9b6cce8be, var_a044168d7664b127);
        self.currentvisionset = thermalvisionset;
        self.flashlight notify("flashlight_on");
        togglethermal = 1;
        gunner _shellshock("killstreak_veh_camera_flir_mp", "top", self.timeout, 0);
        gunner setclientomnvar("ui_killstreak_thermal_mode", 1);
        gunner killstreak_setMainVision(thermalvisionset);
    }
    while (true) {
        gunner waittill("switch_thermal_mode");
        currentgunshipweapon = gunner getcurrentweapon();
        dofinfo = gunship_getdofinfobyweapon(currentgunshipweapon.basename);
        if (!istrue(togglethermal)) {
            gunner setthermalvision(1, dofinfo.fstop, dofinfo.focusdistance);
            self.currentvisionset = thermalvisionset;
            togglethermal = 1;
            gunner _shellshock("killstreak_veh_camera_flir_mp", "top", self.timeout, 0);
            gunner setclientomnvar("ui_killstreak_thermal_mode", 1);
            gunner killstreak_setMainVision(thermalvisionset);
            continue;
        }
        defaultvisionset = bundle.var_7a35928e082dd9b7;
        if (isdefined(level.mapname) && (issubstr(level.mapname, "mp_shipment") || issubstr(level.mapname, "mp_skerries") || getdvarint(@"hash_ef7e2418dc2fe517", 0))) {
            defaultvisionset = bundle.var_6070115b879adfc9;
        }
        if (isdefined(level.gunshipvisionset)) {
            gunner killstreak_setMainVision(level.gunshipvisionset);
            self.currentvisionset = level.gunshipvisionset;
        } else {
            gunner killstreak_setMainVision(defaultvisionset);
            self.currentvisionset = defaultvisionset;
        }
        togglethermal = 0;
        gunner _shellshock("killstreak_veh_camera_mp", "top", self.timeout, 0);
        gunner setclientomnvar("ui_killstreak_thermal_mode", 0);
        gunner setthermalvision(0);
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6972
// Size: 0xcd
function gunship_getdofinfobyweapon(weaponbasename) {
    dofinfo = spawnstruct();
    bundle = level.streakglobals.streakbundles["gunship"];
    if (weaponbasename == bundle.var_b702d1aa92e3f7dc) {
        dofinfo.fstop = 8;
        dofinfo.focusdistance = 600;
    } else if (weaponbasename == bundle.var_2cb6918da56b085b) {
        dofinfo.fstop = 8;
        dofinfo.focusdistance = 600;
    } else if (weaponbasename == bundle.var_2b83894fc24a37fc) {
        dofinfo.fstop = 8;
        dofinfo.focusdistance = 3500;
    }
    return dofinfo;
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6a48
// Size: 0x9a
function gunship_watchthermalflashlightpos(gunship, gunner) {
    self endon("death");
    level endon("game_ended");
    useplayerangles = 1;
    /#
        thirdpersoncam = getdvarint(@"hash_f49f4fd233809e37", 0);
        if (thirdpersoncam) {
            useplayerangles = 0;
        }
    #/
    while (isdefined(gunship) && isdefined(gunner)) {
        self.origin = gunship.origin;
        if (istrue(useplayerangles)) {
            self.angles = gunner getplayerangles();
        }
        wait 0.05;
    }
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6aea
// Size: 0x71
function gunship_showflashlight() {
    self endon("death");
    level endon("game_ended");
    playfxontag(getfx("camera_spotlight"), self, "tag_origin");
    while (true) {
        level waittill("player_enabled_nvgs");
        stopfxontag(getfx("camera_spotlight"), self, "tag_origin");
        scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(0.1);
        playfxontag(getfx("camera_spotlight"), self, "tag_origin");
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6b63
// Size: 0x203
function gunship_weaponreload(weapon, gunship) {
    gunship endon("death");
    gunship endon("crashing");
    gunship endon("leaving");
    self endon("disconnect");
    level endon("game_ended");
    bundle = level.streakglobals.streakbundles["gunship"];
    var_49e6ef3edadd524e = getgunshipweaponrootname(weapon);
    reloadsound = var_49e6ef3edadd524e + "_mp_reload";
    var_dd020944ee631ba8 = strtok(var_49e6ef3edadd524e, "_");
    if (var_dd020944ee631ba8[0] == "gunship") {
        reloadsound = "ac130";
        for (i = 1; i < var_dd020944ee631ba8.size; i++) {
            appendstring = var_dd020944ee631ba8[i];
            if (appendstring == "hellfire") {
                appendstring = "105mm";
            }
            reloadsound = reloadsound + "_" + appendstring;
        }
        reloadsound += "_mp_reload";
    }
    self playlocalsound(reloadsound);
    if (weapon.basename == bundle.var_b702d1aa92e3f7dc) {
        gunship.hellfireloaded = 0;
    }
    gunship_waitforweaponreloadtime(weapon, var_49e6ef3edadd524e);
    reloaddialog = var_49e6ef3edadd524e + "_reload";
    playkillstreakoperatordialog("gunship", reloaddialog, undefined, undefined, "pilot");
    maxammo = weaponmaxammo(weapon);
    self setweaponammoclip(weapon, maxammo);
    if (weapon.basename == bundle.var_b702d1aa92e3f7dc) {
        gunship.hellfireloaded = 1;
    }
    var_f3fc82c371854578 = undefined;
    switch (var_49e6ef3edadd524e) {
    case #"hash_a595cc01d9fdb1c3":
        var_f3fc82c371854578 = "ui_killstreak_weapon_1_ammo";
        break;
    case #"hash_f7dc9df20da28f2":
        var_f3fc82c371854578 = "ui_killstreak_weapon_2_ammo";
        break;
    case #"hash_9e7bbed3c5c35ca3":
        var_f3fc82c371854578 = "ui_killstreak_weapon_3_ammo";
        break;
    }
    self setclientomnvar(var_f3fc82c371854578, maxammo);
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6d6e
// Size: 0xc2
function gunship_waitforweaponreloadtime(weapon, var_49e6ef3edadd524e) {
    reloadtime = level.weaponreloadtime[weapon.basename];
    var_d7dac94935945aab = undefined;
    switch (var_49e6ef3edadd524e) {
    case #"hash_a595cc01d9fdb1c3":
        var_d7dac94935945aab = "ui_killstreak_weapon_1_reloadtime";
        break;
    case #"hash_f7dc9df20da28f2":
        var_d7dac94935945aab = "ui_killstreak_weapon_2_reloadtime";
        break;
    case #"hash_9e7bbed3c5c35ca3":
        var_d7dac94935945aab = "ui_killstreak_weapon_3_reloadtime";
        break;
    }
    self setclientomnvar(var_d7dac94935945aab, gettime() + int(reloadtime * 1000));
    while (true) {
        wait 0.05;
        reloadtime -= 0.05;
        if (reloadtime <= 0) {
            break;
        }
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6e38
// Size: 0x53
function getgunshipweaponrootname(weapon) {
    index = 0;
    weaponname = weapon.basename;
    tokens = strtok(weaponname, "_");
    return tokens[index] + "_" + tokens[index + 1];
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6e94
// Size: 0xb5
function gunship_playpilotfx(pilot) {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    level endon("game_ended");
    /#
        thirdpersoncam = getdvarint(@"hash_f49f4fd233809e37", 0);
        if (thirdpersoncam) {
            return;
        }
    #/
    pilot.gunship_cloudsfx = spawn("script_model", pilot geteye());
    pilot.gunship_cloudsfx setmodel("tag_origin");
    pilot.gunship_cloudsfx linkto(pilot, "tag_eye");
    waitframe();
    playfxontagforclients(getfx("clouds"), pilot.gunship_cloudsfx, "tag_origin", pilot);
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6f51
// Size: 0x21
function deleteaftertime(delay) {
    self endon("death");
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(delay);
    self delete();
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6f7a
// Size: 0x2f
function gunship_crash(gunner) {
    self notify("crashing");
    self.crashed = 1;
    thread function_43c36396180ee798(gunner);
    thread gunship_movetocrashpos();
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6fb1
// Size: 0xfd
function function_43c36396180ee798(gunner) {
    if (!isdefined(gunner)) {
        return;
    }
    if (isdefined(self)) {
        self endon("death");
        gunner endon("disconnect");
        thread gunship_returnplayer(gunner, 1);
        if (isdefined(self.gunshipIntro) && level.gunship_animtype == 0) {
            self.gunshipIntro function_7eb343dd6a3f639(gunner, "light_interior_outro", "on", "ks_gunship_interior_outro", 0.5);
            self playsoundtoplayer("iw9_gunship_plr_outro", gunner);
            gunner playkillstreakoperatordialog("gunship", "gunship" + "_crash", 1, undefined, "pilot");
            var_fbde3ff0d883172a = function_52351c3338da63f4("gunship", "outro_gunner");
            gunner thread gunship_crashexplosionradiostatic(var_fbde3ff0d883172a);
            gunner function_fa9987de43a6169b(self.gunshipIntro, "outro");
            self.gunshipIntro function_7eb343dd6a3f639(gunner, "light_interior_outro", "off", "ks_gunship_interior_outro", 0);
        }
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x70b6
// Size: 0x2fb
function gunship_movetocrashpos() {
    level endon("game_ended");
    self.leftwingfxent setscriptablepartstate("engine_blowout", "off");
    self.rightwingfxent setscriptablepartstate("engine_blowout", "off");
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(3);
    self.leftwingfxent setscriptablepartstate("engine_blowout", "on");
    self.rightwingfxent setscriptablepartstate("engine_blowout", "on");
    self unlink();
    self.var_ba27aac5a0f799e0 = spawn("script_model", self.origin);
    self.var_ba27aac5a0f799e0 setmodel("tag_origin");
    self.var_ba27aac5a0f799e0.angles = vectortoangles(anglestoforward(self.angles));
    self.leftwingfxent setscriptablepartstate("engine_blowout", "off");
    self.rightwingfxent setscriptablepartstate("engine_blowout", "off");
    self.leftwingfxent setscriptablepartstate("body_damage_heavy", "off");
    self.rightwingfxent setscriptablepartstate("body_damage_heavy", "off");
    bundle = level.streakglobals.streakbundles["gunship"];
    crashmodel = spawn("script_model", self.origin);
    crashmodel setmodel(bundle.var_579059c670a08df4);
    crashmodel.angles = self.angles;
    crashmodel.animname = self.streakinfo.streakname;
    crashmodel scripts\common\anim::setanimtree();
    explosionfxent = spawn("script_model", self.origin);
    explosionfxent setmodel("ks_gunship_mp");
    explosionfxent.angles = self.angles;
    explosionfxent linkto(crashmodel, "tag_body", (0, 0, -10), (0, 0, 0));
    /#
    #/
    crashpart = "crash_air";
    explosionfxent setscriptablepartstate(crashpart, "on", 0);
    if (issharedfuncdefined("entity", "delayEntDelete")) {
        explosionfxent thread [[ getsharedfunc("entity", "delayEntDelete") ]](10);
        crashmodel thread [[ getsharedfunc("entity", "delayEntDelete") ]](10);
    }
    crashmodel thread gunship_crash_audio();
    var_1041b7883e5d3da5 = "outro_gunship_death";
    var_f7380e0ba9c6762f = function_52351c3338da63f4("gunship", var_1041b7883e5d3da5);
    thread gunship_delayhide();
    thread gunship_crashexplosionscreenshake(var_f7380e0ba9c6762f);
    self.var_ba27aac5a0f799e0 scripts\common\anim::anim_single_solo(crashmodel, var_1041b7883e5d3da5);
    self.var_ba27aac5a0f799e0 delete();
    gunship_removeplane(1);
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x73b9
// Size: 0x16
function gunship_delayhide() {
    level endon("game_ended");
    wait 0.05;
    self hide();
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x73d7
// Size: 0x96
function gunship_crashexplosionscreenshake(delaytime) {
    level endon("game_ended");
    var_14b1d0692795af2f = delaytime - 2;
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(var_14b1d0692795af2f);
    foreach (player in level.players) {
        if (player scripts\cp_mp\utility\player_utility::_isalive()) {
            player earthquakeforplayer(0.25, 2, self.origin, 30000);
        }
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7475
// Size: 0x2b
function gunship_crashexplosionradiostatic(delaytime) {
    level endon("game_ended");
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(delaytime);
    function_5a9772411551e56e("gunship", "pilot");
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x74a8
// Size: 0x53
function gunship_crash_audio() {
    waitframe();
    playsoundatpos(self.origin, "iw8_ks_ac130_explo_main");
    playsoundatpos(self.origin, "iw8_ks_ac130_explo_low_02");
    playsoundatpos(self.origin, "iw8_ks_ac130_shake_explo");
    playsoundatpos(self.origin, "iw8_ks_ac130_whine");
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7503
// Size: 0x13c
function gunship_removeplane(wasdestroyed) {
    if (isdefined(self.flashlight)) {
        self.flashlight delete();
    }
    if (isdefined(self.camera)) {
        self.camera delete();
    }
    if (isdefined(self.leftwingfxent)) {
        self.leftwingfxent delete();
    }
    if (isdefined(self.rightwingfxent)) {
        self.rightwingfxent delete();
    }
    if (isdefined(self.lightfxent)) {
        self.lightfxent delete();
    }
    if (isdefined(self.hellfiretarget)) {
        self.hellfiretarget delete();
    }
    if (isdefined(self.minimapid)) {
        if (scripts\engine\utility::issharedfuncdefined("game", "returnObjectiveID")) {
            [[ scripts\engine\utility::getsharedfunc("game", "returnObjectiveID") ]](self.minimapid);
        }
        self.minimapid = undefined;
    }
    self.streakinfo.expiredbydeath = istrue(wasdestroyed);
    if (isdefined(self.owner)) {
        self.owner scripts\cp_mp\utility\killstreak_utility::recordkillstreakendstats(self.streakinfo);
    }
    self delete();
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7647
// Size: 0xcd
function function_3856d3338b2c7ebf(gunshipIntro) {
    if (isdefined(gunshipIntro)) {
        if (isdefined(gunshipIntro.var_ba27aac5a0f799e0)) {
            gunshipIntro.var_ba27aac5a0f799e0 delete();
        }
        if (isent(gunshipIntro)) {
            gunshipIntro setscriptablepartstate("clouds_intro", "off", 0);
            gunshipIntro setscriptablepartstate("bodyFX_intro", "off", 0);
            gunshipIntro delete();
            return;
        }
        if (isdefined(gunshipIntro.var_5cb1f0f95e16878e)) {
            foreach (animent in gunshipIntro.var_5cb1f0f95e16878e) {
                if (isdefined(animent)) {
                    animent delete();
                }
            }
        }
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x771c
// Size: 0x81
function function_5efa20e5c624be8f(gunshipIntro) {
    if (isdefined(gunshipIntro)) {
        if (isdefined(gunshipIntro.var_5cb1f0f95e16878e)) {
            foreach (animent in gunshipIntro.var_5cb1f0f95e16878e) {
                if (isdefined(animent)) {
                    animent hidefromplayer(gunshipIntro.var_dee7149209c9df8c);
                }
            }
        }
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x77a5
// Size: 0x2d7
function function_fa9987de43a6169b(gunshipIntro, sequence) {
    self endon("disconnect");
    thirdpersoncam = 0;
    /#
        thirdpersoncam = getdvarint(@"hash_f49f4fd233809e37", 0);
    #/
    if (!isdefined(gunshipIntro.var_dee7149209c9df8c)) {
        gunshipIntro.var_dee7149209c9df8c = self;
    }
    if (isdefined(gunshipIntro) && isdefined(sequence)) {
        thread function_d13d2a81214fbfb8("80_instant_noscale", 1);
        if (sequence == "intro_gunship_exterior") {
            var_d0b97be6dc1a3eba = gunshipIntro.var_5cb1f0f95e16878e["gunship_exterior"];
            var_258b660f7db9aba6 = function_52351c3338da63f4("gunship", sequence);
            var_d0b97be6dc1a3eba showtoplayer(gunshipIntro.var_dee7149209c9df8c);
            var_d0b97be6dc1a3eba setscriptablepartstate("clouds_intro", "old", 0);
            var_d0b97be6dc1a3eba setscriptablepartstate("bodyFX_intro", "on", 0);
            gunshipIntro.var_ba27aac5a0f799e0 thread scripts\common\anim::anim_single_solo(var_d0b97be6dc1a3eba, sequence);
            if (!thirdpersoncam) {
                gunshipIntro.var_dee7149209c9df8c cameralinkto(var_d0b97be6dc1a3eba, "tag_player", 1, 1);
            }
            var_d0b97be6dc1a3eba thread gunship_startintroshake(var_258b660f7db9aba6, self, sequence);
            var_d0b97be6dc1a3eba thread function_c285675bee6618a3(var_258b660f7db9aba6, self, sequence);
            var_d0b97be6dc1a3eba thread function_2be9ae7928984f8(var_258b660f7db9aba6, self);
            wait var_258b660f7db9aba6;
            if (!thirdpersoncam) {
                gunshipIntro.var_dee7149209c9df8c cameraunlink();
            }
        } else {
            if (sequence == "intro") {
                var_d0b97be6dc1a3eba = gunshipIntro.var_5cb1f0f95e16878e["gunship_exterior"];
                var_d0b97be6dc1a3eba setscriptablepartstate("clouds_intro", "off", 0);
                var_d0b97be6dc1a3eba setscriptablepartstate("bodyFX_intro", "off", 0);
            }
            if (isdefined(gunshipIntro.var_5cb1f0f95e16878e)) {
                foreach (modelindex, animent in gunshipIntro.var_5cb1f0f95e16878e) {
                    if (isdefined(animent)) {
                        if (modelindex == "gunship_exterior") {
                            continue;
                        }
                        animent showtoplayer(gunshipIntro.var_dee7149209c9df8c);
                        if (modelindex == "gunship_interior") {
                            continue;
                        }
                        var_465db5572e637fb7 = sequence + "_" + modelindex;
                        gunshipIntro.var_ba27aac5a0f799e0 thread scripts\common\anim::anim_single_solo(animent, var_465db5572e637fb7);
                        if (!thirdpersoncam && modelindex == "gunner") {
                            gunshipIntro.var_dee7149209c9df8c cameralinkto(animent, "tag_camera", 1, 1);
                            var_9adc9e34bc4e0c77 = function_52351c3338da63f4("gunship", sequence + "_gunner");
                            animent thread function_c285675bee6618a3(var_9adc9e34bc4e0c77, self, sequence);
                        }
                    }
                }
                var_258b660f7db9aba6 = function_52351c3338da63f4("gunship", sequence + "_gunner");
                wait var_258b660f7db9aba6;
            }
        }
        self notify("finished_gunship_anim_" + sequence);
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7a84
// Size: 0x246
function function_d176c031e49a9127(var_5e0676140eecdf2d, brush_name) {
    init_succeed = 1;
    lighting_info = spawnstruct();
    probe = getent(var_5e0676140eecdf2d, "script_noteworthy");
    if (!isdefined(probe)) {
        /#
            assertex(0, "<dev string:x43>");
            self iprintln("<dev string:x43>");
        #/
        return undefined;
    }
    shadow_brushes = getentarray(brush_name, "targetname");
    if (!isdefined(shadow_brushes)) {
        /#
            assertex(0, "<dev string:x43>");
            self iprintln("<dev string:x43>");
        #/
        return undefined;
    }
    lighting_info.probe = probe;
    lighting_info.shadow_brushes = shadow_brushes;
    var_ad02eaa051593bff = [];
    var_4662a9052a5547bd = [];
    var_ad02eaa051593bff["pos"] = probe.origin;
    var_ad02eaa051593bff["rot"] = probe.angles;
    lighting_info.var_af2c99167339224 = var_ad02eaa051593bff;
    foreach (brush in shadow_brushes) {
        brush_t = [];
        brush_t["pos"] = brush.origin;
        brush_t["rot"] = brush.angles;
        var_4662a9052a5547bd[index] = brush_t;
    }
    lighting_info.var_959ac8221d7965be = var_4662a9052a5547bd;
    foreach (var_6c3d15091efa3c48 in level.players) {
        probe hidefromplayer(var_6c3d15091efa3c48);
        probe thread gunship_hideintromodelonplayerconnect(self);
        foreach (brush in shadow_brushes) {
            brush hidefromplayer(var_6c3d15091efa3c48);
            brush thread gunship_hideintromodelonplayerconnect(self);
        }
    }
    return lighting_info;
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7cd3
// Size: 0xe8
function function_4293b1250d8a40ec(owner, lighting_info, showlighting) {
    if (istrue(showlighting)) {
        lighting_info.probe showtoplayer(owner);
        foreach (brush in lighting_info.shadow_brushes) {
            brush showtoplayer(owner);
        }
        return;
    }
    lighting_info.probe hidefromplayer(owner);
    foreach (brush in lighting_info.shadow_brushes) {
        brush hidefromplayer(owner);
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7dc3
// Size: 0x42
function function_4d00f78750774093(lighting_info) {
    if (!isdefined(lighting_info)) {
        return;
    }
    lighting_info.probe linkto(self, "tag_origin", (100, 0, 115), (0, 0, 0));
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7e0d
// Size: 0x83
function function_bbfa3bca65cb8e4c(lighting_info) {
    if (!isdefined(lighting_info)) {
        return;
    }
    foreach (brush in lighting_info.shadow_brushes) {
        brush linkto(self, "tag_origin", (0, 0, 0), (0, 0, 0));
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7e98
// Size: 0x70
function function_38101db6ed950f17(lighting_info) {
    if (!isdefined(lighting_info)) {
        return;
    }
    lighting_info.probe unlink();
    lighting_info.probe.origin = lighting_info.var_af2c99167339224["pos"];
    lighting_info.probe.angles = lighting_info.var_af2c99167339224["rot"];
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7f10
// Size: 0x77
function function_fff560b330fd842d() {
    if (getdvarint(@"hash_e6afce2cf5cf7515") == 0) {
        capture_model = getentarray("ks_gunship_light_only", "script_noteworthy");
        foreach (m in capture_model) {
            m hide();
        }
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7f8f
// Size: 0xa1
function unlink_brushes(lighting_info) {
    if (!isdefined(lighting_info)) {
        return;
    }
    foreach (index, brush in lighting_info.shadow_brushes) {
        brush unlink();
        brush.origin = lighting_info.var_959ac8221d7965be[index]["pos"];
        brush.angles = lighting_info.var_959ac8221d7965be[index]["rot"];
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x8038
// Size: 0x137
function function_7eb343dd6a3f639(player, var_8a46c62f0a756dd3, state, visionset_name, time) {
    thirdpersoncam = undefined;
    /#
        thirdpersoncam = getdvarint(@"hash_f49f4fd233809e37", 0);
        if (istrue(thirdpersoncam)) {
            return;
        }
    #/
    if (!isdefined(player)) {
        return;
    }
    if (state == "on") {
        self.gunshipinterior function_4293b1250d8a40ec(player, self.var_9bc4ed07a250f4d3, 1);
        self.gunshipinterior function_4d00f78750774093(self.var_9bc4ed07a250f4d3);
        self.gunshipinterior function_bbfa3bca65cb8e4c(self.var_9bc4ed07a250f4d3);
        self.gunshipinterior setscriptablepartstate(var_8a46c62f0a756dd3, "on");
        player visionsetnakedforplayer(visionset_name, time);
        return;
    }
    if (state == "off") {
        self.gunshipinterior function_4293b1250d8a40ec(player, self.var_9bc4ed07a250f4d3, 0);
        function_38101db6ed950f17(self.var_9bc4ed07a250f4d3);
        unlink_brushes(self.var_9bc4ed07a250f4d3);
        self.gunshipinterior setscriptablepartstate(var_8a46c62f0a756dd3, "off");
        player visionsetnakedforplayer("", time);
    }
}

/#

    // Namespace gunship / scripts\cp_mp\killstreaks\gunship
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x8177
    // Size: 0x5b
    function function_eb2299f7c29ac70c(gunshipIntro, animent, var_465db5572e637fb7) {
        animent endon("<dev string:xab>");
        self notifyonplayercommand("<dev string:xb1>", "<dev string:xc1>");
        while (true) {
            self waittill("<dev string:xb1>");
            gunshipIntro.var_ba27aac5a0f799e0 thread scripts\common\anim::anim_single_solo(animent, var_465db5572e637fb7);
        }
    }

#/

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x81da
// Size: 0x333
function gunship_control_bot_aiming() {
    var_4ac4b608421ecbbb = undefined;
    var_4d571df5f3a8befc = undefined;
    target_loc = undefined;
    var_befbf47bff2227bd = 0;
    var_ea189b55de5c8fa7 = 0;
    inaccuracy_vector = undefined;
    bot_inaccuracy = (self botgetdifficultysetting("minInaccuracy") + self botgetdifficultysetting("maxInaccuracy")) / 2;
    var_def9c228381a493a = 0;
    bundle = level.streakglobals.streakbundles["gunship"];
    while (true) {
        var_d430bcda6275a38b = 0;
        var_4b05a8497817406a = 0;
        if (isdefined(var_4d571df5f3a8befc) && var_4d571df5f3a8befc.health <= 0 && gettime() - var_4d571df5f3a8befc.deathtime < 2000) {
            var_d430bcda6275a38b = 1;
            var_4b05a8497817406a = 1;
        } else if (isalive(self.enemy) && (self botcanseeentity(self.enemy) || gettime() - self lastknowntime(self.enemy) <= 300)) {
            var_d430bcda6275a38b = 1;
            var_4d571df5f3a8befc = self.enemy;
            var_7f9803312b446879 = var_4d571df5f3a8befc.origin;
            var_4ac4b608421ecbbb = self.enemy.origin;
            if (self botcanseeentity(self.enemy)) {
                var_def9c228381a493a = 0;
                var_4b05a8497817406a = 1;
                var_b8cccb951e8a65c4 = gettime();
            } else {
                var_def9c228381a493a += 0.05;
                if (var_def9c228381a493a > 5) {
                    var_d430bcda6275a38b = 0;
                }
            }
        }
        if (var_d430bcda6275a38b) {
            if (isdefined(var_4ac4b608421ecbbb)) {
                target_loc = var_4ac4b608421ecbbb;
            }
            if (issharedfuncdefined("bots", "bot_body_is_dead")) {
                if (var_4b05a8497817406a && (self [[ getsharedfunc("bots", "bot_body_is_dead") ]]() || distancesquared(target_loc, level.gunship.origin) > level.physicssphereradius[bundle.var_b702d1aa92e3f7dc] * level.physicssphereradius[bundle.var_b702d1aa92e3f7dc])) {
                    self botpressbutton("attack");
                }
            }
            if (gettime() > var_ea189b55de5c8fa7 + 500) {
                random_x = randomfloatrange(-1 * bot_inaccuracy / 2, bot_inaccuracy / 2);
                random_y = randomfloatrange(-1 * bot_inaccuracy / 2, bot_inaccuracy / 2);
                random_z = randomfloatrange(-1 * bot_inaccuracy / 2, bot_inaccuracy / 2);
                inaccuracy_vector = (150 * random_x, 150 * random_y, 150 * random_z);
                var_ea189b55de5c8fa7 = gettime();
            }
            target_loc += inaccuracy_vector;
        } else if (gettime() > var_befbf47bff2227bd) {
            var_befbf47bff2227bd = gettime() + randomintrange(1000, 2000);
            target_loc = undefined;
            if (issharedfuncdefined("bots", "get_random_outside_target")) {
                target_loc = [[ getsharedfunc("bots", "get_random_outside_target") ]]();
            }
        }
        self botlookatpoint(target_loc, 0.2, "script_forced");
        wait 0.05;
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x8515
// Size: 0x1c6
function gunship_handlemissiledetection(player, missileteam, missiletarget, fxtagoverride) {
    self endon("death");
    while (true) {
        if (!isdefined(missiletarget)) {
            break;
        }
        center = missiletarget getpointinbounds(0, 0, 0);
        curdist = distance(self.origin, center);
        if (curdist < 4000 && missiletarget.flaresreservecount > 0) {
            if (issharedfuncdefined("flares", "reduceReserves")) {
                [[ getsharedfunc("flares", "reduceReserves") ]](missiletarget);
            }
            missiletarget thread gunship_playflaresfx(fxtagoverride);
            missiletarget playkillstreakoperatordialog("gunship", "gunship" + "_flares", 1, undefined, "pilot");
            newtarget = undefined;
            if (issharedfuncdefined("flares", "deploy")) {
                newtarget = missiletarget [[ getsharedfunc("flares", "deploy") ]]();
            }
            if (issharedfuncdefined("killstreak", "updateScrapAssistDataForceCredit")) {
                missiletarget [[ getsharedfunc("killstreak", "updateScrapAssistDataForceCredit") ]](player);
            }
            self missile_settargetent(newtarget);
            self notify("missile_pairedWithFlare");
            return;
        } else if (curdist < 300 && missiletarget.flaresreservecount <= 0) {
            missiletarget thread gunship_playfakebodyexplosion();
            missiledamage = weapongetdamagemax(self.weapon_name);
            if (isdefined(self.owner)) {
                missiletarget dodamage(missiledamage, self.owner.origin, self.owner, self, "MOD_EXPLOSIVE", self.weapon_name);
            }
            self delete();
        }
        waitframe();
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x86e3
// Size: 0x83
function gunship_playfakebodyexplosion() {
    if (!isdefined(self.missileexplcounter)) {
        self.missileexplcounter = 0;
    }
    self.missileexplcounter++;
    if (self.missileexplcounter > 4) {
        self.missileexplcounter = 0;
    }
    self setscriptablepartstate("fake_missile_expl_" + self.missileexplcounter, "on", 0);
    self playsoundonmovingent("iw8_ks_ac130_dist_rkt_explo");
    wait 2;
    self setscriptablepartstate("fake_missile_expl_" + self.missileexplcounter, "off", 0);
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x876e
// Size: 0x73
function gunship_playflaresfx(fxtagoverride) {
    flarestag = "tag_origin";
    if (isdefined(fxtagoverride)) {
        flarestag = fxtagoverride;
    }
    playsoundatpos(self gettagorigin(flarestag), "ks_ac130_flares");
    playfxontag(getfx("gunship_flares"), self, flarestag);
    flaresgroup = self.flaresreservecount + 1;
    self setscriptablepartstate("fake_flares_" + flaresgroup, "on", 0);
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x87e9
// Size: 0xc
function isusinggunship() {
    return isdefined(self.usinggunship);
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x87fe
// Size: 0x40
function gunship_linklightfxent() {
    self endon("death");
    level endon("game_ended");
    wait 0.05;
    gunshipforward = anglestoforward(self.angles);
    self setscriptablepartstate("lights", "on");
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8846
// Size: 0x16b
function gunship_linkwingfxents() {
    self endon("death");
    level endon("game_ended");
    wait 0.05;
    var_633eaa5f21008b6f = self gettagorigin("tag_left_outer_prop");
    self.leftwingfxent = spawn("script_model", var_633eaa5f21008b6f);
    self.leftwingfxent setmodel("ks_gunship_mp");
    self.leftwingfxent.angles = self.angles;
    self.leftwingfxent setotherent(self.owner);
    self.leftwingfxent linkto(self, "tag_left_outer_prop", (0, 0, 0), (0, 0, 0));
    var_3eacd3938ccd4b6c = self gettagorigin("tag_right_outer_prop");
    self.rightwingfxent = spawn("script_model", var_3eacd3938ccd4b6c);
    self.rightwingfxent setmodel("ks_gunship_mp");
    self.rightwingfxent.angles = self.angles;
    self.rightwingfxent setotherent(self.owner);
    self.rightwingfxent linkto(self, "tag_right_outer_prop", (0, 0, 0), (0, 0, 0));
    self setscriptablepartstate("contrails", "on");
}

/#

    // Namespace gunship / scripts\cp_mp\killstreaks\gunship
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x89b9
    // Size: 0x4d
    function function_9a76988758d4b96d(wingfxent) {
        self endon("<dev string:xab>");
        level endon("<dev string:xca>");
        while (true) {
            sphere(wingfxent.origin, 100, (1, 0, 0), 0, 1);
            wait 0.05;
        }
    }

#/

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8a0e
// Size: 0x1c8
function gunship_watchtargets(gunner) {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    level endon("game_ended");
    gunner endon("disconnect");
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(5);
    while (true) {
        visibletargets = [];
        foreach (player in level.players) {
            if (!isdefined(player) || !player scripts\cp_mp\utility\player_utility::_isalive()) {
                continue;
            }
            if (self.owner worldpointinreticle_circle(player.origin, 80, 100)) {
                if (level.teambased && player.team == self.team) {
                    continue;
                }
                if (player == self.owner) {
                    continue;
                }
                if (!streakcanseetarget(self.origin, player gettagorigin("j_spineupper"), self)) {
                    continue;
                }
                if (issharedfuncdefined("perk", "hasPerk")) {
                    if (player [[ getsharedfunc("perk", "hasPerk") ]]("specialty_noscopeoutline")) {
                        continue;
                    }
                }
                visibletargets = gunship_getnearbytargets(player);
                break;
            }
            wait 0.05;
        }
        if (visibletargets.size > 0 && visibletargets.size < 2) {
            gunner playkillstreakoperatordialog("gunship", "gunship" + "_spotted_single_target", undefined, undefined, "pilot");
        } else if (visibletargets.size >= 2) {
            gunner playkillstreakoperatordialog("gunship", "gunship" + "_spotted_single_multi", undefined, undefined, "pilot");
        }
        wait randomintrange(5, 15);
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8bde
// Size: 0xc7
function gunship_getnearbytargets(maintarget) {
    var_69338ca0bf9d8d91 = utility::playersinsphere(maintarget.origin, 300);
    nearbytargets = [];
    foreach (player in var_69338ca0bf9d8d91) {
        if (level.teambased && player.team != maintarget.team) {
            continue;
        }
        if (!level.teambased && player == self.owner) {
            continue;
        }
        nearbytargets[nearbytargets.size] = player;
    }
    return nearbytargets;
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8cae
// Size: 0xbd
function function_39464052869b655d(gunner) {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    level endon("game_ended");
    gunner endon("disconnect");
    self.var_d743ac65ecce766 = 0;
    childthread gunship_watchkills();
    childthread function_c8437bfb873fd165();
    while (true) {
        if (self.var_d743ac65ecce766 != 0) {
            wait 2;
            if (self.var_d743ac65ecce766 >= 1) {
                playkillstreakoperatordialog("gunship", "gunship" + "_hit_target", undefined, undefined, "pilot");
            } else {
                playkillstreakoperatordialog("gunship", "gunship" + "_miss_target", undefined, undefined, "pilot");
            }
            self.var_d743ac65ecce766 = 0;
            wait 1;
        }
        waitframe();
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8d73
// Size: 0x3f
function gunship_watchkills() {
    while (true) {
        self.owner waittill("update_rapid_kill_buffered", recentkills, weaponname);
        if (isdefined(recentkills)) {
            self.var_d743ac65ecce766++;
        }
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8dba
// Size: 0x3f
function function_c8437bfb873fd165() {
    while (true) {
        self.owner waittill("update_rapid_agent_kill_buffered", recentkills, weaponname);
        if (isdefined(recentkills)) {
            self.var_d743ac65ecce766++;
        }
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8e01
// Size: 0x6d
function gunship_iskillstreakweapon(weaponname) {
    bundle = level.streakglobals.streakbundles["gunship"];
    return ter_op(isdefined(weaponname) && (weaponname == bundle.var_b702d1aa92e3f7dc || weaponname == bundle.var_2cb6918da56b085b || weaponname == bundle.var_2b83894fc24a37fc), 1, 0);
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8e77
// Size: 0x39
function gunship_islargemap() {
    largemap = islargemap();
    /#
        crashtype = getdvarint(@"hash_302d41b2b6f9d002", 0);
        if (crashtype) {
            largemap = 1;
        }
    #/
    return largemap;
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8eb9
// Size: 0xe6
function gunship_allowstances(boolean) {
    if (!istrue(boolean)) {
        self.gunship_disabledstances = [];
        currentstance = self getstance();
        switch (currentstance) {
        case #"hash_c6775c88e38f7803":
            self.gunship_disabledstances = ["crouch", "prone"];
            break;
        case #"hash_3fed0cbd303639eb":
            self.gunship_disabledstances = ["stand", "prone"];
            break;
        case #"hash_d91940431ed7c605":
            self.gunship_disabledstances = ["stand", "crouch"];
            break;
        }
        val::group_register("gunshipStance", self.gunship_disabledstances);
        val::group_set("gunshipStance", 0);
        return;
    }
    val::group_reset("gunshipStance");
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8fa7
// Size: 0x31
function function_486b043f227fca86() {
    self endon("death");
    level waittill("game_ended");
    level.gunshiprigs = array_remove(level.gunshiprigs, self);
    self delete();
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8fe0
// Size: 0x44
function function_f14aa90c4ef905d2(ent) {
    self endon("death");
    ent waittill_any_2("leaving", "death");
    level.gunshiprigs = array_remove(level.gunshiprigs, self);
    self delete();
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x902c
// Size: 0x63
function function_aafc33d685563aa4(owner) {
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    owner endon("disconnect");
    level endon("game_ended");
    while (true) {
        targetpos = function_cdf6e1bdfe5b42b5(owner);
        if (isdefined(targetpos)) {
            self.hellfiretarget.origin = targetpos;
        }
        waitframe();
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9097
// Size: 0x143
function function_5fbd9704078207ad(owner) {
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    owner endon("disconnect");
    level endon("game_ended");
    gunshipbasefov = 65;
    lerptime = 0.2;
    currentfov = gunshipbasefov;
    var_d54d564805c29b7b = undefined;
    timeheld = 0;
    playedvision = 0;
    owner setclientomnvar("ui_killstreak_zoom_fov", currentfov);
    while (true) {
        if (!isdefined(self.var_5496ff174012e0e0)) {
            waitframe();
            continue;
        }
        if (owner adsbuttonpressed()) {
            timeheld += 0.05;
            if (timeheld >= lerptime) {
                timeheld = lerptime;
            }
            if (!istrue(playedvision)) {
                owner function_58707ddfdd9744fa("killstreak_ads_shutter");
                playedvision = 1;
            }
        } else if (timeheld > 0) {
            timeheld -= 0.05;
            if (timeheld <= 0) {
                timeheld = 0;
            }
            if (istrue(playedvision)) {
                playedvision = 0;
            }
        }
        if (timeheld >= 0) {
            var_d54d564805c29b7b = self.var_5496ff174012e0e0;
            timeperc = timeheld / lerptime * 100;
            currentfov = int(timeperc * (var_d54d564805c29b7b - gunshipbasefov) / 100 + gunshipbasefov);
        }
        owner setclientomnvar("ui_killstreak_zoom_fov", currentfov);
        wait 0.05;
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x91e2
// Size: 0xae
function function_cdf6e1bdfe5b42b5(owner) {
    content = ["physicscontents_clipshot", "physicscontents_missileclip", "physicscontents_vehicleclip"];
    contentoverride = physics_createcontents(content);
    starttrace = owner getvieworigin();
    endtrace = starttrace + anglestoforward(owner getplayerangles()) * 50000;
    ignoreents = owner playerkillstreakgetownerlookatignoreents();
    trace = scripts\engine\trace::ray_trace(starttrace, endtrace, ignoreents, contentoverride);
    endpos = trace["position"];
    return endpos;
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9299
// Size: 0x73
function function_9214536761e6be23(targetweapon) {
    self endon("death");
    self notify("gunhip_storing_fov");
    self endon("gunship_storing_fov");
    while (true) {
        currentplayerweapon = self.owner getcurrentweapon();
        if (isdefined(currentplayerweapon) && currentplayerweapon.basename == targetweapon) {
            break;
        }
        waitframe();
    }
    self.var_5496ff174012e0e0 = self.owner playergetzoomfov();
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x9314
// Size: 0xce
function function_ccaa72b347c823bb(gunship, gunner, weaponbasename) {
    gunship endon("death");
    gunship endon("leaving");
    gunship endon("crashing");
    gunner endon("disconnect");
    self waittill("death");
    bundle = level.streakglobals.streakbundles["gunship"];
    if (weaponbasename == bundle.var_2b83894fc24a37fc) {
        return;
    }
    var_465f0d60f080d408 = bundle.var_ee69fd7db3c43c73;
    if (weaponbasename == bundle.var_b702d1aa92e3f7dc) {
        var_465f0d60f080d408 = bundle.var_1773b3703b61838e;
        earthquake(0.125, 0.5, gunship.origin, 1000);
    }
    gunner function_58707ddfdd9744fa(var_465f0d60f080d408);
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x93ea
// Size: 0x20
function function_aaedf89b93495d4f(data) {
    if (isdefined(self)) {
        gunship_crash(self.owner);
    }
}

// Namespace gunship / scripts\cp_mp\killstreaks\gunship
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9412
// Size: 0x28a
function function_377ab89187436937(data) {
    self endon("death");
    self notify("gunship_mini_emp_hit");
    self endon("gunship_mini_emp_hit");
    self.owner _setvisibiilityomnvarforkillstreak(self.streakname, "off");
    wait 0.1;
    self.owner _setvisibiilityomnvarforkillstreak(self.streakname, "on");
    wait 0.05;
    self.owner _setvisibiilityomnvarforkillstreak(self.streakname, "off");
    wait 0.25;
    self.owner _setvisibiilityomnvarforkillstreak(self.streakname, "on");
    if (!isdefined(self.var_e8d88b601e41fba5) && self.flaresreservecount > 0) {
        self.var_e8d88b601e41fba5 = gettime();
        if (issharedfuncdefined("flares", "reduceReserves")) {
            [[ getsharedfunc("flares", "reduceReserves") ]](self);
        }
        thread gunship_playflaresfx();
        if (issharedfuncdefined("flares", "deploy")) {
            self [[ getsharedfunc("flares", "deploy") ]]();
        }
        if (issharedfuncdefined("killstreak", "updateScrapAssistDataForceCredit")) {
            self [[ getsharedfunc("killstreak", "updateScrapAssistDataForceCredit") ]](data.attacker);
        }
        if (scripts\engine\utility::issharedfuncdefined("player", "doScoreEvent")) {
            data.attacker thread [[ scripts\engine\utility::getsharedfunc("player", "doScoreEvent") ]]("emped_killstreak");
        }
        return;
    }
    if (self.flaresreservecount > 0 && self.var_e8d88b601e41fba5 <= gettime() - 10000) {
        self.var_e8d88b601e41fba5 = gettime();
        if (issharedfuncdefined("flares", "reduceReserves")) {
            [[ getsharedfunc("flares", "reduceReserves") ]](self);
        }
        thread gunship_playflaresfx();
        if (issharedfuncdefined("flares", "deploy")) {
            self [[ getsharedfunc("flares", "deploy") ]]();
        }
        if (issharedfuncdefined("killstreak", "updateScrapAssistDataForceCredit")) {
            self [[ getsharedfunc("killstreak", "updateScrapAssistDataForceCredit") ]](data.attacker);
        }
        if (scripts\engine\utility::issharedfuncdefined("player", "doScoreEvent")) {
            data.attacker thread [[ scripts\engine\utility::getsharedfunc("player", "doScoreEvent") ]]("emped_killstreak");
        }
    }
}

/#

    // Namespace gunship / scripts\cp_mp\killstreaks\gunship
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x96a4
    // Size: 0xe3
    function function_ae468fe5beababc0(var_2136b63785ee0579) {
        self endon("<dev string:xab>");
        self.owner endon("<dev string:xd5>");
        self.owner endon("<dev string:xf1>");
        while (true) {
            trace = scripts\engine\trace::ray_trace(self.origin, self.origin - (0, 0, 40000), self);
            line(self.origin, trace["<dev string:x10e>"], (1, 1, 1), 1, 0, 1);
            sphere(var_2136b63785ee0579.origin, 50, (1, 1, 0), 0, 1);
            self.owner iprintlnbold("<dev string:x117>" + distance(self.origin, trace["<dev string:x10e>"]));
            waitframe();
        }
    }

    // Namespace gunship / scripts\cp_mp\killstreaks\gunship
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x978f
    // Size: 0x116
    function function_9d69dd8c1ff1265c(tagname, var_22c53c353885fe59) {
        self endon("<dev string:xab>");
        while (true) {
            debuglocation = self.origin;
            if (isdefined(tagname)) {
                debuglocation = self gettagorigin(tagname);
            }
            sphere(debuglocation, 100, (1, 1, 1), 0, 1);
            if (istrue(var_22c53c353885fe59)) {
                testforward = anglestoforward(self.angles);
                testright = anglestoright(self.angles);
                testup = anglestoup(self.angles);
                line(debuglocation, debuglocation + testforward * 1000, (1, 0, 0), 1, 0, 1);
                line(debuglocation, debuglocation + testright * 1000, (0, 1, 0), 1, 0, 1);
                line(debuglocation, debuglocation + testup * 1000, (0, 0, 1), 1, 0, 1);
            }
            wait 0.05;
        }
    }

    // Namespace gunship / scripts\cp_mp\killstreaks\gunship
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x98ad
    // Size: 0x17a
    function function_45ad456c933cbb32() {
        self endon("<dev string:xab>");
        self endon("<dev string:x122>");
        self endon("<dev string:x12a>");
        self.owner notifyonplayercommand("<dev string:xd5>", "<dev string:x133>");
        self.owner notifyonplayercommand("<dev string:xf1>", "<dev string:x13d>");
        self.owner notifyonplayercommand("<dev string:xf1>", "<dev string:x147>");
        self.flashlight notify("<dev string:x152>");
        bundle = level.streakglobals.streakbundles["<dev string:x160>"];
        weaponstocycle = [bundle.var_b702d1aa92e3f7dc, bundle.var_2cb6918da56b085b, bundle.var_2b83894fc24a37fc];
        currentdebugweaponindex = 0;
        currentdebugweapon = weaponstocycle[0];
        while (true) {
            result = self.owner waittill_any_return_2("<dev string:xd5>", "<dev string:xf1>");
            if (!isdefined(result)) {
                waitframe();
                continue;
            }
            if (result == "<dev string:xd5>") {
                currentdebugweaponindex++;
                if (currentdebugweaponindex > 2) {
                    currentdebugweaponindex = 0;
                }
                currentdebugweapon = weaponstocycle[currentdebugweaponindex];
                self.owner iprintlnbold("<dev string:x168>" + currentdebugweapon);
                continue;
            }
            shotgoal = function_120feaa7e2f0658b(self.owner);
            thread function_4f101b253c661e40(shotgoal, currentdebugweapon);
        }
    }

    // Namespace gunship / scripts\cp_mp\killstreaks\gunship
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x9a2f
    // Size: 0x15
    function function_ce1591d034df25ad(weapon) {
        return weaponfiretime(weapon);
    }

    // Namespace gunship / scripts\cp_mp\killstreaks\gunship
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x9a4c
    // Size: 0xa6
    function function_120feaa7e2f0658b(owner) {
        content = ["<dev string:x183>", "<dev string:x19c>", "<dev string:x1b8>"];
        contentoverride = physics_createcontents(content);
        starttrace = owner getvieworigin();
        endtrace = starttrace + anglestoforward(owner getplayerangles()) * 50000;
        trace = scripts\engine\trace::ray_trace(starttrace, endtrace, level.characters, contentoverride);
        endpos = trace["<dev string:x10e>"];
        return endpos;
    }

    // Namespace gunship / scripts\cp_mp\killstreaks\gunship
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x9afa
    // Size: 0x167
    function function_4f101b253c661e40(shotgoal, currentdebugweapon) {
        self endon("<dev string:xab>");
        self endon("<dev string:x122>");
        self endon("<dev string:x12a>");
        self.owner endon("<dev string:xd5>");
        self.owner endon("<dev string:xf1>");
        while (true) {
            sphere(shotgoal, 10, (1, 1, 0), 0, 60);
            self.owner iprintlnbold("<dev string:x1d0>" + currentdebugweapon + "<dev string:x1d8>" + shotgoal + "<dev string:x1dd>" + getweaponexplosionradius(currentdebugweapon));
            ammoleft = weaponmaxammo(currentdebugweapon);
            thread function_5d02a3b580b4d80e(shotgoal);
            while (ammoleft > 0) {
                var_e84b952249e4abe = undefined;
                if (issharedfuncdefined("<dev string:x160>", "<dev string:x1ef>")) {
                    var_e84b952249e4abe = [[ getsharedfunc("<dev string:x160>", "<dev string:x1ef>") ]](shotgoal, 100);
                }
                projectile = _magicbullet(makeweapon(currentdebugweapon), self.origin, var_e84b952249e4abe, self.owner);
                ammoleft--;
                if (ammoleft == 0) {
                    wait 1;
                    reloadtimer = level.weaponreloadtime[currentdebugweapon];
                    while (reloadtimer > 0) {
                        self.owner iprintlnbold("<dev string:x1ff>" + currentdebugweapon);
                        reloadtimer--;
                        wait 1;
                    }
                }
                wait function_ce1591d034df25ad(currentdebugweapon);
            }
        }
    }

    // Namespace gunship / scripts\cp_mp\killstreaks\gunship
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x9c69
    // Size: 0x90
    function function_5d02a3b580b4d80e(shotgoal) {
        self endon("<dev string:xab>");
        self endon("<dev string:x122>");
        self endon("<dev string:x12a>");
        self.owner endon("<dev string:xd5>");
        self.owner endon("<dev string:xf1>");
        while (true) {
            self.flashlight.angles = vectortoangles(shotgoal - self.origin);
            line(self.origin, shotgoal, (1, 1, 1), 1, 0, 1);
            waitframe();
        }
    }

    // Namespace gunship / scripts\cp_mp\killstreaks\gunship
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x9d01
    // Size: 0x54
    function function_66f838db99a91aa3() {
        self endon("<dev string:xab>");
        wait 10;
        data = scripts\cp_mp\utility\damage_utility::packdamagedata(self.owner, self, 1, self.currentprimaryweapon, "<dev string:x20a>", self);
        function_377ab89187436937(data);
        wait 10;
        function_377ab89187436937(data);
    }

#/
