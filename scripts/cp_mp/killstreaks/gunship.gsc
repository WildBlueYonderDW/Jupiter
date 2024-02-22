// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\anim.gsc;
#using script_3b64eb40368c1450;
#using script_4c770a9a4ad7659c;
#using script_3db04fd1b466bdba;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using scripts\cp_mp\utility\dialog_utility.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\cp_mp\utility\vehicle_omnvar_utility.gsc;
#using scripts\cp_mp\hostmigration.gsc;
#using scripts\cp_mp\targetmarkergroups.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;

#namespace gunship;

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19d1
// Size: 0x142
function init() {
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["gunship"];
    if (!isdefined(bundle)) {
        return;
    }
    if (issharedfuncdefined("gunship", "init")) {
        [[ getsharedfunc("gunship", "init") ]]();
    }
    /#
        setdevdvarifuninitialized(@"hash_fa402c92e4148a39", bundle.var_1eb3e683c77a9c6f);
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

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b1a
// Size: 0xe
function weapongivengunship(streakinfo) {
    return 1;
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b30
// Size: 0x4e
function function_7ab42d42f465952f() {
    level endon("game_ended");
    flag_wait("onStartGameTypeFinished");
    if (isdefined(level.mapcenter)) {
        level.var_3065d0b3d892e79f = level.mapcenter;
    } else {
        level.var_3065d0b3d892e79f = (0, 0, 0);
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b85
// Size: 0x194
function function_8e8513a8b071336c() {
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["gunship"];
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
    level.var_1217e6483e1a18a0 = [];
    level.var_241720cf8c74ddde = getdvarint(@"hash_55b253d027368418", 1);
    registervisibilityomnvarforkillstreak("gunship", "on", 9);
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d20
// Size: 0xb6
function function_77e6149ef483d24a() {
    val::function_2d6e7e0b80767910("gunshipIntro", [0:"allow_jump", 1:"usability", 2:"killstreaks", 3:"supers", 4:"gesture", 5:"fire", 6:"weapon_switch", 7:"allow_movement", 8:"offhand_weapons", 9:"shellshock"]);
    val::function_2d6e7e0b80767910("gunshipUse", [0:"usability", 1:"killstreaks", 2:"supers", 3:"gesture", 4:"weapon_switch", 5:"allow_movement", 6:"shellshock"]);
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ddd
// Size: 0x579
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
        level.var_539e9dc23256f26d["gunship"][animindex] = function_52351c3338da63f4("gunship", animindex);
    }
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["gunship"];
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
    level.var_faf1aba229e3e2a9 = getdvarint(@"hash_a59a7da9fa17c00", 0);
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x235d
// Size: 0x212
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

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2576
// Size: 0x51
function function_6fcb27d917ef709b() {
    level._effect["clouds"] = loadfx("vfx/iw8_mp/killstreak/vfx_ac130_view_clouds.vfx");
    level._effect["gunship_flares"] = loadfx("vfx/iw8_mp/killstreak/vfx_ac130_flares.vfx");
    level._effect["camera_spotlight"] = loadfx("vfx/iw8_mp/killstreak/vfx_ac130_ir_spotlight.vfx");
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25ce
// Size: 0xcb
function function_ea9e0f077f0d655c() {
    if (isdefined(level.var_bfab55c68d5dee05)) {
        function_c0b0a582ff9e4d57(level.var_bfab55c68d5dee05);
    }
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["gunship"];
    function_c0b0a582ff9e4d57(bundle.var_7a35928e082dd9b7);
    function_c0b0a582ff9e4d57(bundle.var_6070115b879adfc9);
    function_c0b0a582ff9e4d57(bundle.var_7c6da61313057613, 0.1, 0.2, 0.5);
    function_c0b0a582ff9e4d57(bundle.var_1773b3703b61838e, 0.1, 0.1, 0.3);
    function_c0b0a582ff9e4d57(bundle.var_ee69fd7db3c43c73, 0.1, 0.1, 0.2);
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26a0
// Size: 0x21
function tryusegunship() {
    streakinfo = createstreakinfo("gunship", self);
    return tryusegunshipfromstruct(streakinfo);
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26c9
// Size: 0xe3
function tryusegunshipfromstruct(streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return 0;
        }
    }
    var_9b1deb5e9d32bbe3 = namespace_b3d24e921998a8b::streakdeploy_doweapontabletdeploy(streakinfo, &weapongivengunship);
    if (!istrue(var_9b1deb5e9d32bbe3)) {
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
        if (namespace_3c37cb17ade254d::issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ namespace_3c37cb17ade254d::getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/AIR_SPACE_TOO_CROWDED");
        }
        streakinfo notify("killstreak_finished_with_deploy_weapon");
        return 0;
    }
    return result;
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27b4
// Size: 0x68
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

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2823
// Size: 0x639
function gunship_startuse(player, streakinfo) {
    level endon("game_ended");
    if (issharedfuncdefined("game", "disable_backpack_inventory")) {
        player [[ getsharedfunc("game", "disable_backpack_inventory") ]](1);
    }
    var_51c1b45046e1647c = level.var_3065d0b3d892e79f;
    if (islargemap()) {
        if (level.gametype == "arm" || level.gametype == "conflict" || level.gametype == "gwtdm") {
            if (isdefined(level.hqmidpoint)) {
                var_51c1b45046e1647c = level.hqmidpoint;
            } else if (isdefined(level.gunship_origin_override)) {
                var_51c1b45046e1647c = level.gunship_origin_override;
            }
        } else {
            var_51c1b45046e1647c = player.origin;
        }
    }
    var_2136b63785ee0579 = function_25233a050a5e41f0(player, var_51c1b45046e1647c);
    if (!isdefined(var_2136b63785ee0579)) {
        return 0;
    }
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["gunship"];
    var_8945c22a67231e20 = randomint(360);
    radiusoffset = 9000;
    zoffset = 8000;
    foreach (map in bundle.var_b46a22c71ca5e923) {
        if (issubstr(level.mapname, map.name)) {
            if (isdefined(map.var_d72b743776952935)) {
                radiusoffset = map.var_d72b743776952935;
            }
            if (isdefined(map.var_a9dc4719c0825b05)) {
                zoffset = zoffset + map.var_a9dc4719c0825b05;
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
        zoffset = zoffset + var_6a0d59565e047ea2;
        var_febfb4ffab31cfc = getdvarint(@"hash_74da12841dc5abf8", 0);
        if (var_febfb4ffab31cfc != 0) {
            radiusoffset = var_febfb4ffab31cfc;
        }
        var_7b4eeac3b76fec6e = getdvarint(@"hash_e9998dac93d948d8", 0);
        if (var_7b4eeac3b76fec6e != 0) {
            zoffset = 8000 + var_7b4eeac3b76fec6e;
        }
    #/
    xoffset = cos(var_8945c22a67231e20) * radiusoffset;
    yoffset = sin(var_8945c22a67231e20) * radiusoffset;
    var_78ac3c5ef5263d4f = vectornormalize((xoffset, yoffset, zoffset));
    var_78ac3c5ef5263d4f = var_78ac3c5ef5263d4f * zoffset;
    level.gunshipinuse = 1;
    gunshipintro = gunship_playintro(player, streakinfo, var_8945c22a67231e20, var_78ac3c5ef5263d4f, var_2136b63785ee0579);
    if (!isdefined(gunshipintro)) {
        level.gunshipinuse = 0;
        return 0;
    }
    gunship = gunship_spawn(player, streakinfo, var_8945c22a67231e20, var_78ac3c5ef5263d4f, gunshipintro, var_2136b63785ee0579);
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        gunship [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_aaedf89b93495d4f);
    }
    if (!isdefined(gunship)) {
        level.gunshipinuse = 0;
        return 0;
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
    if (getdvarint(@"hash_c00e244ea59d530e")) {
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
    gunship thread gunship_watchownerexitaction(player, "player_fatal_death");
    gunship thread gunship_watchendgame(player);
    gunship thread gunship_playpilotfx(player);
    gunship thread gunship_linklightfxent();
    gunship thread gunship_linkwingfxents();
    gunship thread gunship_monitormanualplayerexit(player);
    gunship thread gunship_trackvelocity(player);
    gunship thread gunship_watchtargets(player);
    gunship thread function_39464052869b655d(player);
    /#
        var_c8823e8c933ef356 = getdvarint(@"hash_f49f4fd233809e37", 0);
        if (var_c8823e8c933ef356) {
            gunship thread function_45ad456c933cbb32();
            gunship thread function_ae468fe5beababc0(var_2136b63785ee0579);
        }
    #/
    if (issharedfuncdefined("flares", "handleIncomingStinger")) {
        gunship thread [[ getsharedfunc("flares", "handleIncomingStinger") ]](&gunship_handlemissiledetection);
    }
    gunship playloopsound("iw8_ks_ac130_lp");
    if (istrue(player.var_65219c911f198c95)) {
        gunship thread gunship_crash(player);
    }
    return 1;
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e64
// Size: 0xd8
function function_25233a050a5e41f0(owner, var_51c1b45046e1647c) {
    var_12a4204b9c132493 = undefined;
    if (!islargemap()) {
        if (level.var_1217e6483e1a18a0.size > 0) {
            var_12a4204b9c132493 = level.var_1217e6483e1a18a0[0];
        }
    } else if (isdefined(level.var_1217e6483e1a18a0) && level.var_1217e6483e1a18a0.size >= 1) {
        return undefined;
    }
    if (!isdefined(var_12a4204b9c132493)) {
        var_12a4204b9c132493 = spawn("script_model", var_51c1b45046e1647c);
        var_12a4204b9c132493 setmodel("tag_origin");
        var_12a4204b9c132493.angles = (0, 115, 0);
        var_12a4204b9c132493 hide();
        level.var_1217e6483e1a18a0[level.var_1217e6483e1a18a0.size] = var_12a4204b9c132493;
        var_12a4204b9c132493 thread function_cbbaa3b3a43fa6b3();
        if (!islargemap()) {
            var_12a4204b9c132493 thread function_486b043f227fca86();
        }
    }
    return var_12a4204b9c132493;
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f44
// Size: 0x3c
function gunship_lockedoncallback() {
    playkillstreakoperatordialog("gunship", "gunship" + "_lockedon", 1, undefined, "pilot");
    namespace_84cff6185e39aa66::vehomn_showwarning("missileLocking", self.owner, "killstreak");
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f87
// Size: 0x1d
function gunship_lockedonremovedcallback() {
    namespace_84cff6185e39aa66::vehomn_hidewarning("missileLocking", self.owner, "killstreak");
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fab
// Size: 0x91a
function gunship_playintro(player, streakinfo, angle, anglevector, var_2136b63785ee0579) {
    player endon("disconnect");
    level endon("game_ended");
    var_c8823e8c933ef356 = 0;
    /#
        var_c8823e8c933ef356 = getdvarint(@"hash_f49f4fd233809e37", 0);
        if (var_c8823e8c933ef356) {
            streakinfo notify("intro_pen_1");
        }
    #/
    streakinfo endon("killstreak_finished_with_deploy_weapon");
    player disablephysicaldepthoffieldscripting();
    player gunship_allowstances(0);
    if (!var_c8823e8c933ef356) {
        player _stopshellshock();
        player val::function_3633b947164be4f3("gunshipIntro", 0);
    }
    gunshipintro = undefined;
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["gunship"];
    /#
        level.var_faf1aba229e3e2a9 = getdvarint(@"hash_a59a7da9fa17c00", 0);
    #/
    if (level.var_faf1aba229e3e2a9 == 1) {
        var_e4739db3b860ef4 = "intro_gunship";
        var_258b660f7db9aba6 = function_52351c3338da63f4("gunship", var_e4739db3b860ef4);
        gunshipintro = spawn("script_model", var_2136b63785ee0579.origin);
        gunshipintro setmodel(bundle.gunship_intromodel);
        gunshipintro.angles = var_2136b63785ee0579.angles;
        gunshipintro setotherent(player);
        gunshipintro.animname = streakinfo.streakname;
        gunshipintro.owner = player;
        if (!var_c8823e8c933ef356) {
            foreach (var_6c3d15091efa3c48 in level.players) {
                if (var_6c3d15091efa3c48 != player) {
                    gunshipintro hidefromplayer(var_6c3d15091efa3c48);
                }
            }
            gunshipintro thread gunship_hideintromodelonplayerconnect(player);
        }
        heightoffset = 2000;
        switch (level.mapname) {
        case #"hash_66ce5cdcd3b547f3":
        case #"hash_ff009e5fab42b778":
            heightoffset = 500;
            break;
        }
        gunshipintro linkto(var_2136b63785ee0579, "tag_origin", anglevector - (0, 0, heightoffset), (0, angle + 90, 0));
        gunshipintro thread gunship_watchintrodisown("disconnect", streakinfo);
        gunshipintro thread gunship_watchintrodisown("joined_team", streakinfo);
        gunshipintro thread gunship_watchintrodisown("joined_spectators", streakinfo);
        gunshipintro thread gunship_watchintrodisown("player_fatal_death", streakinfo);
        waitframe();
        if (!isdefined(gunshipintro)) {
            return undefined;
        }
        gunshipintro namespace_bc4a4b9456315863::setanimtree();
        gunshipintro.var_ba27aac5a0f799e0 = spawn("script_model", gunshipintro.origin);
        gunshipintro.var_ba27aac5a0f799e0.angles = gunshipintro.angles;
        gunshipintro.var_ba27aac5a0f799e0 setmodel("tag_origin");
        gunshipintro playsoundtoplayer("iw9_ks_ac130_intro", player);
        if (!var_c8823e8c933ef356) {
            player cameralinkto(gunshipintro, "tag_player", 0, 1);
            player painvisionoff();
            player killstreak_savenvgstate();
            gunshipintro setscriptablepartstate("clouds_intro", "old", 0);
            gunshipintro setscriptablepartstate("bodyFX_intro", "on", 0);
            gunshipintro thread gunship_startintroshake(var_258b660f7db9aba6, player);
            gunshipintro thread gunship_queuecamerazoom(var_258b660f7db9aba6, player);
            gunshipintro thread function_c285675bee6618a3(var_258b660f7db9aba6, player);
        }
        player playkillstreakoperatordialog("gunship", "gunship" + "_use", 1, undefined, "pilot");
        gunshipintro.var_ba27aac5a0f799e0 namespace_bc4a4b9456315863::anim_single_solo(gunshipintro, var_e4739db3b860ef4);
    } else {
        bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["gunship"];
        var_8fb3c3f9c5517645 = 20000;
        foreach (map in bundle.var_b46a22c71ca5e923) {
            if (issubstr(level.mapname, map.name) && isdefined(map.var_8fb3c3f9c5517645)) {
                var_8fb3c3f9c5517645 = map.var_8fb3c3f9c5517645;
            }
        }
        var_c458edac96d58b16 = player.origin + anglestoforward(player.angles) * 100 + (0, 0, var_8fb3c3f9c5517645);
        /#
            var_b4a0772c51ea82ee = getdvarint(@"hash_1fa8dffa69ff4ed8", 0);
            var_c458edac96d58b16 = var_c458edac96d58b16 + (0, 0, var_b4a0772c51ea82ee);
        #/
        var_d9979e10eec99504 = spawn("script_model", var_c458edac96d58b16);
        var_d9979e10eec99504 setmodel("veh9_mil_air_gunship_interior_vm");
        var_5cb1f0f95e16878e = [];
        var_5cb1f0f95e16878e["gunship_interior"] = var_d9979e10eec99504;
        var_ba27aac5a0f799e0 = spawn("script_model", var_d9979e10eec99504 gettagorigin("tag_control_desk"));
        var_ba27aac5a0f799e0 setmodel("tag_origin");
        var_ba27aac5a0f799e0.angles = var_d9979e10eec99504 gettagangles("tag_control_desk");
        gunshipintro = spawnstruct();
        gunshipintro.owner = player;
        gunshipintro.var_3589ad3885d61683 = var_d9979e10eec99504;
        gunshipintro.var_9bc4ed07a250f4d3 = player function_d176c031e49a9127("gunship_interior_probe", "gunship_shadow_brush");
        gunshipintro thread gunship_watchintrodisown("disconnect", streakinfo);
        gunshipintro thread gunship_watchintrodisown("joined_team", streakinfo);
        gunshipintro thread gunship_watchintrodisown("joined_spectators", streakinfo);
        gunshipintro thread gunship_watchintrodisown("player_fatal_death", streakinfo);
        var_e618f33d2594b25b = undefined;
        foreach (modelindex, var_7f6d36cc641739d9 in level.var_9c7d2f4c2fc66b1f) {
            var_4d4d74b2657628ee = var_ba27aac5a0f799e0.origin;
            if (modelindex == "gunship_exterior") {
                var_e618f33d2594b25b = var_4d4d74b2657628ee + (0, 0, 200);
            }
            var_c43a209b29ea8ead = spawn("script_model", var_ba27aac5a0f799e0.origin);
            var_c43a209b29ea8ead setmodel(var_7f6d36cc641739d9);
            var_c43a209b29ea8ead setotherent(player);
            var_c43a209b29ea8ead.angles = var_ba27aac5a0f799e0.angles;
            var_c43a209b29ea8ead.animname = "gunship";
            var_c43a209b29ea8ead namespace_bc4a4b9456315863::setanimtree();
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
        foreach (var_b2a3f9abcee9d071 in var_5cb1f0f95e16878e) {
            if (!var_c8823e8c933ef356) {
                foreach (var_6c3d15091efa3c48 in level.players) {
                    var_b2a3f9abcee9d071 hidefromplayer(var_6c3d15091efa3c48);
                }
                var_b2a3f9abcee9d071 thread gunship_hideintromodelonplayerconnect(player);
            }
        }
        gunshipintro.var_ba27aac5a0f799e0 = var_ba27aac5a0f799e0;
        gunshipintro.var_5cb1f0f95e16878e = var_5cb1f0f95e16878e;
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
        player function_fa9987de43a6169b(gunshipintro, var_313a9e6067853ba8);
        gunshipintro function_7eb343dd6a3f639(player, "light_interior_intro", "on", "ks_gunship_interior_intro", 0);
        player function_fa9987de43a6169b(gunshipintro, "intro");
        gunshipintro function_7eb343dd6a3f639(player, "light_interior_intro", "off", "ks_gunship_interior_intro", 0.5);
    }
    gunshipintro notify("gunship_end_intro");
    if (!var_c8823e8c933ef356) {
        player disablephysicaldepthoffieldscripting();
        _stopshellshock();
        player val::function_588f2307a3040610("gunshipIntro");
    }
    return gunshipintro;
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38cd
// Size: 0x5e
function gunship_watchintrodisown(action, streakinfo) {
    self endon("death");
    self endon("gunship_end_intro");
    level endon("game_ended");
    var_69b64e348a80229e = self.owner;
    var_69b64e348a80229e waittill(action);
    if (action == "disconnect") {
        level.gunshipinuse = 0;
    }
    gunship_detachplayerfromintro(var_69b64e348a80229e, streakinfo);
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3932
// Size: 0xcd
function gunship_detachplayerfromintro(var_69b64e348a80229e, streakinfo) {
    var_c8823e8c933ef356 = 0;
    /#
        var_c8823e8c933ef356 = getdvarint(@"hash_f49f4fd233809e37", 0);
    #/
    if (isdefined(var_69b64e348a80229e) && !var_c8823e8c933ef356) {
        var_69b64e348a80229e cameraunlink();
        var_69b64e348a80229e _stopshellshock();
        var_69b64e348a80229e disablephysicaldepthoffieldscripting();
        var_69b64e348a80229e val::function_588f2307a3040610("gunshipIntro");
        var_69b64e348a80229e _setvisibiilityomnvarforkillstreak(streakinfo.streakname, "off");
        var_69b64e348a80229e setclientomnvar("ui_gunship_hud", 0);
        var_69b64e348a80229e painvisionon();
        var_69b64e348a80229e killstreak_restorenvgstate();
        var_69b64e348a80229e killstreak_setmainvision("");
        var_69b64e348a80229e function_8b676f496920e2ab();
        var_69b64e348a80229e notify("detach_gunship_intro");
        level thread namespace_36f464722d326bbe::fadetoblackforplayer(var_69b64e348a80229e, 0);
    }
    streakinfo notify("killstreak_finished_with_deploy_weapon");
    function_3856d3338b2c7ebf(self);
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a06
// Size: 0x3d
function gunship_hideintromodelonplayerconnect(owner) {
    self endon("death");
    owner endon("disconnect");
    while (1) {
        player = level waittill("connected");
        self hidefromplayer(player);
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a4a
// Size: 0x13a
function function_c285675bee6618a3(animlength, owner, introsequence) {
    self endon("death");
    owner endon("disconnect");
    owner endon("detach_gunship_intro");
    owner enablephysicaldepthoffieldscripting();
    if (isdefined(introsequence)) {
        if (introsequence == "intro_gunship_exterior") {
            owner setphysicaldepthoffield(1.4, 87, 10, 10);
            var_31d8a5fd4175dcf4 = animlength * 0.25;
            var_f2c9960fabe10533 = animlength * 0.65;
            thread function_37b61f53bc7c8643(owner, var_31d8a5fd4175dcf4, 2.2, 87, 50, 50);
            thread function_37b61f53bc7c8643(owner, var_f2c9960fabe10533, 4, 350, 1, 1);
        } else if (introsequence == "intro") {
            owner setphysicaldepthoffield(1.4, 21, 1000, 1000);
            var_31d8a5fd4175dcf4 = animlength * 0.8;
            thread function_37b61f53bc7c8643(owner, var_31d8a5fd4175dcf4, 1.4, 43, 50, 50);
        } else {
            owner setphysicaldepthoffield(1.4, 43, 1000, 1000);
            var_31d8a5fd4175dcf4 = animlength * 0.5;
            var_f2c9960fabe10533 = animlength * 0.7;
            thread function_37b61f53bc7c8643(owner, var_31d8a5fd4175dcf4, 1.4, 20, 50, 50);
            thread function_37b61f53bc7c8643(owner, var_f2c9960fabe10533, 3, 100, 50, 50);
        }
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b8b
// Size: 0x56
function function_37b61f53bc7c8643(owner, delaytime, fstop, focusdistance, focusspeed, var_5587778bb9d6e798) {
    self endon("death");
    owner endon("disconnect");
    owner endon("detach_gunship_intro");
    wait(delaytime);
    owner setphysicaldepthoffield(fstop, focusdistance, focusspeed, var_5587778bb9d6e798);
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3be8
// Size: 0xe5
function gunship_startintroshake(animlength, owner, introsequence) {
    self endon("death");
    owner endon("disconnect");
    owner endon("detach_gunship_intro");
    animtime = animlength;
    var_9ddfa144dacc4377 = 0.45;
    var_23250ac0c394b3c8 = 0.05;
    if (isdefined(introsequence)) {
        if (introsequence == "intro_gunship_exterior") {
            var_9ddfa144dacc4377 = 0.01;
            var_23250ac0c394b3c8 = 0.25;
        }
    }
    while (animtime > 0) {
        owner earthquakeforplayer(var_9ddfa144dacc4377, var_23250ac0c394b3c8, self.origin, 5000);
        if (isdefined(introsequence)) {
            if (introsequence == "intro_gunship_exterior") {
                var_9ddfa144dacc4377 = var_9ddfa144dacc4377 + 0.01;
                if (var_9ddfa144dacc4377 >= 0.1) {
                    var_9ddfa144dacc4377 = 0.1;
                }
            }
        } else {
            var_9ddfa144dacc4377 = var_9ddfa144dacc4377 - 0.01;
            if (var_9ddfa144dacc4377 <= 0.12) {
                var_9ddfa144dacc4377 = 0.12;
            }
        }
        animtime = animtime - var_23250ac0c394b3c8;
        wait(var_23250ac0c394b3c8);
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cd4
// Size: 0x61
function gunship_queuecamerazoom(animlength, owner) {
    self endon("death");
    owner endon("disconnect");
    owner endon("detach_gunship_intro");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(animlength - 0.2);
    owner killstreak_setmainvision("killstreak_slamzoom");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(0.1);
    level thread namespace_36f464722d326bbe::fadetoblackforplayer(owner, 1, 0.1);
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d3c
// Size: 0x58
function function_2be9ae7928984f8(animlength, owner) {
    owner endon("disconnect");
    level endon("game_ended");
    owner endon("detach_gunship_intro");
    wait(animlength - 0.3);
    level thread namespace_36f464722d326bbe::fadetoblackforplayer(owner, 1, 0.3);
    wait(0.7);
    level thread namespace_36f464722d326bbe::fadetoblackforplayer(owner, 0, 0.3);
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d9b
// Size: 0x2c2
function gunship_returnplayer(player, crashing) {
    level callback::callback("killstreak_finish_use", {streakinfo:self.streakinfo});
    if (isdefined(player)) {
        player endon("disconnect");
        var_c8823e8c933ef356 = 0;
        /#
            var_c8823e8c933ef356 = getdvarint(@"hash_f49f4fd233809e37", 0);
        #/
        if (!var_c8823e8c933ef356) {
            player _stopshellshock();
        }
        player setclientomnvar("ui_killstreak_thermal_mode", 0);
        player setthermalvision(0);
        player _setvisibiilityomnvarforkillstreak(self.streakinfo.streakname, "off");
        player setclientomnvar("ui_gunship_hud", 0);
        player stoploopsound();
        player killstreak_setmainvision("");
        player clearclienttriggeraudiozone(0.5);
        player painvisionon();
        player _stopshellshock();
        player clearcinematicmotionoverride();
        if (issharedfuncdefined("game", "disable_backpack_inventory")) {
            player [[ getsharedfunc("game", "disable_backpack_inventory") ]](0);
        }
        player notify("returning_killstreak_player");
        player.usinggunship = undefined;
        if (getdvarint(@"hash_c00e244ea59d530e")) {
            if (issharedfuncdefined("player", "setThirdPersonDOF")) {
                player [[ getsharedfunc("player", "setThirdPersonDOF") ]](1);
            }
        }
        if (isdefined(player.gunship_cloudsfx)) {
            player.gunship_cloudsfx delete();
        }
        if (!var_c8823e8c933ef356) {
            if (player namespace_f8065cafc523dba5::_isalive()) {
                player _giveweapon(level.var_89d6f5464d64ebf4);
                player _switchtoweaponimmediate(level.var_89d6f5464d64ebf4);
            }
            player unlink();
            if (istrue(crashing) && level.var_faf1aba229e3e2a9 == 0) {
                player waittill("finished_gunship_anim_outro");
                player killstreak_setmainvision("killstreak_static");
                wait(1);
                player cameraunlink();
                player killstreak_setmainvision("");
            }
            player val::function_588f2307a3040610("gunshipUse");
            player gunship_allowstances(1);
            player function_8b676f496920e2ab();
            player killstreak_restorenvgstate();
            player thread gunship_restoreplayerweapon(self.streakinfo);
        } else {
            /#
                self.streakinfo notify("intro_pen_1");
            #/
        }
    }
    function_3856d3338b2c7ebf(self.gunshipintro);
    gunship_lockedonremovedcallback();
    if (isdefined(self.enemytargetmarkergroup)) {
        namespace_f48c22429667eba9::targetmarkergroup_off(self.enemytargetmarkergroup);
    }
    if (isdefined(self.friendlytargetmarkergroup)) {
        namespace_f48c22429667eba9::targetmarkergroup_off(self.friendlytargetmarkergroup);
    }
    if (issharedfuncdefined("gunship", "br_respawn")) {
        [[ getsharedfunc("gunship", "br_respawn") ]](player);
    }
    level.gunshipinuse = 0;
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4064
// Size: 0x125
function gunship_restoreplayerweapon(streakinfo) {
    self endon("disconnect");
    streakinfo notify("killstreak_finished_with_deploy_weapon");
    var_263d5a6c4338e56c = getanimlength(script_model%vm_ks_tablet_drop);
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["gunship"];
    if (_isalive()) {
        val::set("gunshipExit", "fire", 0);
        val::set("gunshipExit", "allow_movement", 0);
        val::set("gunshipExit", "offhand_weapons", 0);
        val::set("gunshipExit", "mantle", 0);
        val::set("gunshipExit", "melee", 0);
        wait(0.05);
        _switchtoweapon(self.lastdroppableweaponobj);
        wait(var_263d5a6c4338e56c);
        _takeweapon(bundle.var_b702d1aa92e3f7dc);
        _takeweapon(bundle.var_2cb6918da56b085b);
        _takeweapon(bundle.var_2b83894fc24a37fc);
        _takeweapon(level.var_89d6f5464d64ebf4);
        val::function_c9d0b43701bdba00("gunshipExit");
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4190
// Size: 0x4df
function gunship_watchdamage(gunner) {
    self endon("death");
    self endon("crashing");
    level endon("game_ended");
    self.damagetaken = 0;
    self.attractor = missile_createattractorent(self, 1000, 4096);
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["gunship"];
    while (1) {
        objweapon = idflags = partname = tagname = modelname = smeansofdeath = point = direction_vec = attacker = damage = self waittill("damage");
        var_c8823e8c933ef356 = undefined;
        var_1faa3d3dec8d49bd = undefined;
        /#
            var_c8823e8c933ef356 = getdvarint(@"hash_f49f4fd233809e37", 0);
            var_1faa3d3dec8d49bd = istrue(self.var_1faa3d3dec8d49bd);
        #/
        if (isdefined(level.teambased) && isplayer(attacker) && attacker.team == self.team && (!isdefined(var_c8823e8c933ef356) || !var_c8823e8c933ef356) && (!isdefined(var_1faa3d3dec8d49bd) || !var_1faa3d3dec8d49bd)) {
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
        if (isdefined(var_1faa3d3dec8d49bd)) {
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
        self.damagetaken = self.damagetaken + modifieddamage;
        self.currenthealth = self.currenthealth - modifieddamage;
        killstreak_updatedamagestate(self.currenthealth);
        if (self.damagetaken >= self.maxhealth) {
            streakname = self.streakinfo.streakname;
            damagetype = undefined;
            scorepopupname = "destroyed_" + streakname;
            leaderdialog = undefined;
            var_6342e2da1dc12454 = "callout_destroyed_" + streakname;
            var_dc695757f69ed065 = 1;
            if (isplayer(attacker)) {
                if (issharedfuncdefined("hud", "teamPlayerCardSplash")) {
                    thread [[ getsharedfunc("hud", "teamPlayerCardSplash") ]](var_6342e2da1dc12454, attacker);
                }
            }
            if (namespace_3c37cb17ade254d::issharedfuncdefined("damage", "onKillstreakKilled") && isdefined(attacker) && (isplayer(attacker) || isdefined(attacker.owner))) {
                var_3737240cefe2c793 = self [[ namespace_3c37cb17ade254d::getsharedfunc("damage", "onKillstreakKilled") ]](streakname, attacker, objweapon, damagetype, damage, scorepopupname, leaderdialog, var_6342e2da1dc12454, var_dc695757f69ed065);
            }
            thread gunship_crash(gunner);
        }
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4676
// Size: 0x71
function function_fd00f7fcdbcd8972() {
    self setscriptablepartstate("body_damage_light", "on");
    gunner = self.owner;
    if (isdefined(gunner) && gunner isusinggunship()) {
        self.flashlight setscriptablepartstate("camera_damage_light", "on");
        gunner playkillstreakoperatordialog("gunship", "gunship" + "_light_damage", 1, undefined, "pilot");
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46ee
// Size: 0x9c
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

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4791
// Size: 0x8a
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

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4822
// Size: 0x8d
function gunship_startengineblowoutfx() {
    level endon("game_ended");
    self.leftwingfxent setscriptablepartstate("engine_blowout", "on");
    self.leftwingfxent setscriptablepartstate("body_damage_heavy", "on");
    var_dcd6ec5f89d73423 = randomfloatrange(0.5, 1);
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_dcd6ec5f89d73423);
    self.rightwingfxent setscriptablepartstate("engine_blowout", "on");
    self.rightwingfxent setscriptablepartstate("body_damage_heavy", "on");
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48b6
// Size: 0x41
function gunship_watchtimeout(gunner) {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    level endon("game_ended");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(self.timeout);
    thread gunship_leave(gunner);
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48fe
// Size: 0x3c
function gunship_watchgameend(gunner) {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    level waittill_any_2("start_game_ended", "game_ended");
    thread gunship_leave(gunner);
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4941
// Size: 0xd6
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

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a1e
// Size: 0x24
function gunship_waittilldestination(destination) {
    while (isdefined(self) && self.origin != destination) {
        waitframe();
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a49
// Size: 0x53
function gunship_watchownerexitaction(gunner, var_304d14a0f176d5c3) {
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    level endon("game_ended");
    gunner waittill(var_304d14a0f176d5c3);
    if (var_304d14a0f176d5c3 == "player_fatal_death") {
        thread gunship_leave(gunner);
    } else {
        thread gunship_crash(gunner);
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4aa3
// Size: 0x5d
function gunship_watchendgame(gunner) {
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    gunner endon("disconnect");
    level waittill("game_ended");
    gunner _setvisibiilityomnvarforkillstreak(self.streakinfo.streakname, "off");
    gunner setclientomnvar("ui_gunship_hud", 0);
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b07
// Size: 0x88
function gunship_trackvelocity(gunner) {
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    level endon("game_ended");
    self.velocity = (0, 0, 0);
    while (1) {
        self.lastorigin = self.origin;
        wait(level.framedurationseconds);
        self.velocity = (self.origin - self.lastorigin) / level.framedurationseconds;
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b96
// Size: 0x34b
function gunship_spawn(owner, streakinfo, angle, anglevector, gunshipintro, var_2136b63785ee0579) {
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["gunship"];
    gunship = spawn("script_model", var_2136b63785ee0579.origin);
    gunship setmodel(bundle.var_9db3c2a9aa0ab053);
    gunship setcandamage(1);
    gunship.currenthealth = bundle.maxhealth;
    gunship.maxhealth = gunship.currenthealth;
    gunship.health = 99999;
    gunship.owner = owner;
    gunship.team = owner.team;
    gunship.gunshipintro = gunshipintro;
    gunship.var_2136b63785ee0579 = var_2136b63785ee0579;
    gunship.ispiloted = 1;
    gunship.timeout = bundle.var_1eb3e683c77a9c6f;
    if (issharedfuncdefined("gunship", "attachXRays")) {
        gunship = [[ getsharedfunc("gunship", "attachXRays") ]](gunship);
    }
    gunship.var_d933dae6a2be2faf = 1;
    var_f07dc7f04d04af5f = spawn("script_model", gunship.origin);
    var_f07dc7f04d04af5f setmodel("tag_origin");
    gunship.var_f07dc7f04d04af5f = var_f07dc7f04d04af5f;
    if (islargemap()) {
        var_2136b63785ee0579 thread function_f14aa90c4ef905d2(gunship);
    }
    gunship namespace_6d9917c3dc05dbe9::registersentient("Killstreak_Air", owner, undefined, undefined, 1, 0);
    gunship function_cfc5e3633ef950fd(1, bundle.var_bfb39f38f09df343, &function_fd00f7fcdbcd8972);
    gunship function_cfc5e3633ef950fd(2, bundle.var_bde8ccf56d975fe4, &function_ab0ec37ba0afd257);
    gunship function_cfc5e3633ef950fd(3, bundle.var_a59fd30a2552ed85, &function_cf130118900c4c47);
    /#
        var_334d3b08aef373d4 = getdvarint(@"hash_fa402c92e4148a39", bundle.var_1eb3e683c77a9c6f);
        var_2a98d1683cf44153 = getdvarint(@"hash_2c01d701bac5d9d3", 0);
        if (var_2a98d1683cf44153) {
            var_334d3b08aef373d4 = 9999;
        }
        gunship.timeout = var_334d3b08aef373d4;
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
    if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "createObjective")) {
        minimapid = gunship [[ namespace_3c37cb17ade254d::getsharedfunc("game", "createObjective") ]]("hud_icon_minimap_killstreak_gunship", gunship.team, 0, 1, 1);
    }
    gunship.minimapid = minimapid;
    gunship linkto(var_2136b63785ee0579, "tag_origin", anglevector, (0, angle + 90, -30));
    level notify("matchrecording_plane", gunship);
    return gunship;
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ee9
// Size: 0x50
function gunship_updateoverlaycoords(plane) {
    plane endon("death");
    plane endon("crashing");
    plane endon("leaving");
    self endon("disconnect");
    level endon("game_ended");
    wait(0.05);
    thread gunship_updateplanemodelcoords(plane);
    thread gunship_updateplayerpositioncoords(plane);
    thread gunship_updateaimingcoords(plane);
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f40
// Size: 0x99
function gunship_updateplanemodelcoords(plane) {
    plane endon("death");
    plane endon("crashing");
    plane endon("leaving");
    self endon("disconnect");
    level endon("game_ended");
    while (1) {
        self setclientomnvar("ui_gunship_coord1_posx", int(plane.origin[0]));
        self setclientomnvar("ui_gunship_coord1_posy", int(plane.origin[1]));
        self setclientomnvar("ui_gunship_coord1_posz", int(plane.origin[2]));
        wait(0.5);
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fe0
// Size: 0x86
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

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x506d
// Size: 0xba
function gunship_updateaimingcoords(plane) {
    plane endon("death");
    plane endon("crashing");
    plane endon("leaving");
    self endon("disconnect");
    level endon("game_ended");
    while (1) {
        starttrace = self getvieworigin();
        endtrace = starttrace + anglestoforward(self getplayerangles()) * 15000;
        endpos = physicstrace(starttrace, endtrace);
        self setclientomnvar("ui_gunship_coord3_posx", int(endpos[0]));
        self setclientomnvar("ui_gunship_coord3_posy", int(endpos[1]));
        self setclientomnvar("ui_gunship_coord3_posz", int(endpos[2]));
        wait(0.1);
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x512e
// Size: 0xbe
function function_cbbaa3b3a43fa6b3() {
    self endon("death");
    var_25bb708a7d591131 = 10;
    rotatetime = level.gunship_speed["rotate"] / 360 * var_25bb708a7d591131;
    self rotateyaw(self.angles[2] + var_25bb708a7d591131, rotatetime, rotatetime, 0);
    degreespersecond = 360 / level.gunship_speed["rotate"];
    var_31fc5244269dae18 = degreespersecond * 0.0174533;
    level.gunship_magnitude = var_31fc5244269dae18 * 9000;
    while (1) {
        self rotateyaw(360, level.gunship_speed["rotate"]);
        wait(level.gunship_speed["rotate"]);
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51f3
// Size: 0x4b7
function gunship_attachgunner(gunner) {
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    gunner killstreak_setmainvision("");
    level thread namespace_36f464722d326bbe::fadetoblackforplayer(gunner, 0, 0.1);
    /#
        var_c8823e8c933ef356 = getdvarint(@"hash_f49f4fd233809e37", 0);
        if (var_c8823e8c933ef356) {
            if (level.var_faf1aba229e3e2a9 == 1) {
                function_3856d3338b2c7ebf(self.gunshipintro);
            } else {
                gunner function_5efa20e5c624be8f(self.gunshipintro);
            }
            self.streakinfo notify("intro_pen_1");
            return;
        }
    #/
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["gunship"];
    gunner _giveweapon(bundle.var_b702d1aa92e3f7dc);
    gunner _giveweapon(bundle.var_2cb6918da56b085b);
    gunner _giveweapon(bundle.var_2b83894fc24a37fc);
    gunner _switchtoweaponimmediate(bundle.var_b702d1aa92e3f7dc);
    if (isdefined(level.var_bfab55c68d5dee05)) {
        self.currentvisionset = level.var_bfab55c68d5dee05;
    } else {
        self.currentvisionset = bundle.var_7a35928e082dd9b7;
        if (isdefined(level.mapname) && (issubstr(level.mapname, "_shipment") || issubstr(level.mapname, "mp_skerries"))) {
            self.currentvisionset = bundle.var_6070115b879adfc9;
        }
    }
    waitframe();
    gunner cameraunlink();
    if (level.var_faf1aba229e3e2a9 == 1) {
        function_3856d3338b2c7ebf(self.gunshipintro);
    } else {
        gunner function_5efa20e5c624be8f(self.gunshipintro);
    }
    self.camera = spawn("script_model", self.origin - (0, 0, 20));
    self.camera setmodel("tag_player");
    self.camera.angles = vectortoangles(self.var_2136b63785ee0579.origin - self.camera.origin);
    self.camera linkto(self);
    if (isbot(gunner)) {
        gunner cameralinkto(self.camera, "tag_player");
    } else {
        var_70b99692da5c7fef = function_58415bfdad59562c(bundle);
        gunner playkillstreakoperatordialog("gunship", "gunship" + "_engage", 1, undefined, "pilot");
        gunner.usinggunship = 1;
        gunner playerlinkweaponviewtodelta(self.camera, "tag_player", 1, var_70b99692da5c7fef[0], var_70b99692da5c7fef[1], var_70b99692da5c7fef[2], var_70b99692da5c7fef[3], 0, 1, 1);
        gunner playerlinkedsetviewznear(0);
        gunner killstreak_setmainvision(self.currentvisionset);
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
        gunner val::function_3633b947164be4f3("gunshipUse", 0);
        if (issharedfuncdefined("gunship", "assignTargetMarkers")) {
            self thread [[ getsharedfunc("gunship", "assignTargetMarkers") ]](gunner);
        }
        gunner thread gunship_updateoverlaycoords(self);
        thread function_9214536761e6be23(bundle.var_b702d1aa92e3f7dc);
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56b1
// Size: 0x1d3
function function_58415bfdad59562c(bundle) {
    var_eb57fe1e11d3f7de = 100;
    var_82acbc5e2f4e43bb = 100;
    var_990b4b7550e595ff = 17;
    var_84a1be18525b3059 = 90;
    foreach (map in bundle.var_b46a22c71ca5e923) {
        if (issubstr(level.mapname, map.name)) {
            if (isdefined(map.var_eb57fe1e11d3f7de)) {
                var_eb57fe1e11d3f7de = map.var_fbfc9b3202a01d51;
            }
            if (isdefined(map.var_82acbc5e2f4e43bb)) {
                var_82acbc5e2f4e43bb = map.var_112ab36579abf6b2;
            }
            if (isdefined(map.var_990b4b7550e595ff)) {
                var_990b4b7550e595ff = map.var_63dc0140ad437800;
            }
            if (isdefined(map.var_84a1be18525b3059)) {
                var_84a1be18525b3059 = map.var_858f316c3c5c0478;
            }
            break;
        }
    }
    /#
        if (getdvarint(@"hash_a9dd72f919820c3c", -1) >= 0) {
            var_eb57fe1e11d3f7de = getdvarint(@"hash_a9dd72f919820c3c", -1);
        }
        if (getdvarint(@"hash_f6f54c4504a08e99", -1) >= 0) {
            var_82acbc5e2f4e43bb = getdvarint(@"hash_f6f54c4504a08e99", -1);
        }
        if (getdvarint(@"hash_be524367b2923ffd", -1) >= 0) {
            var_990b4b7550e595ff = getdvarint(@"hash_be524367b2923ffd", -1);
        }
        if (getdvarint(@"hash_276a14d37ceed71f", -1) >= 0) {
            var_84a1be18525b3059 = getdvarint(@"hash_276a14d37ceed71f", -1);
        }
    #/
    return [0:var_eb57fe1e11d3f7de, 1:var_82acbc5e2f4e43bb, 2:var_990b4b7550e595ff, 3:var_84a1be18525b3059];
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x588c
// Size: 0xc3
function function_623a9b1b10d1db2e(gunner) {
    gunner endon("disconnect");
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    level endon("game_ended");
    if (!ismp()) {
        return;
    }
    if (!istrue(level.var_241720cf8c74ddde)) {
        return;
    }
    thread function_7f87e01d436c03cc(gunner);
    while (1) {
        if (gunner adsbuttonpressed()) {
            currentweapon = gunner getcurrentweapon();
            bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["gunship"];
            if (currentweapon.basename == bundle.var_b702d1aa92e3f7dc) {
                function_dceaa78f8d315302(gunner, 1);
                self notify("gunship_reset_hellfire_lockon");
            }
        }
        waitframe();
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5956
// Size: 0x93
function function_7f87e01d436c03cc(gunner) {
    gunner endon("disconnect");
    level endon("game_ended");
    while (1) {
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

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59f0
// Size: 0x2ea
function function_dceaa78f8d315302(gunner, var_cc706c96147ed540) {
    gunner endon("disconnect");
    level endon("game_ended");
    while (gunner adsbuttonpressed()) {
        if ((gunner playerads() >= 0.95 || istrue(var_cc706c96147ed540)) && istrue(self.var_d933dae6a2be2faf)) {
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

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ce1
// Size: 0x93
function function_2b613e06060d8b55(gunner) {
    gunner endon("disconnect");
    self endon("death");
    self endon("crashing");
    self endon("explode");
    self endon("gunship_reset_hellfire_lockon");
    self endon("stop_gunship_hellfire_locking_sfx");
    level endon("game_ended");
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["gunship"];
    while (1) {
        gunner playlocalsound(bundle.var_8d665c5e920f57d7);
        gunner playrumbleonentity(bundle.var_dda37cdc1cceaa1d);
        wait(0.6);
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d7b
// Size: 0x8c
function function_75eee29aa3795a05(gunner) {
    gunner endon("disconnect");
    self endon("death");
    self endon("crashing");
    self endon("explode");
    self endon("gunship_reset_hellfire_lockon");
    level endon("game_ended");
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["gunship"];
    gunner playlocalsound(bundle.var_615f5055e4f0b368);
    while (1) {
        gunner playrumbleonentity(bundle.var_f21822264fab160);
        wait(0.25);
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e0e
// Size: 0x1bc
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
    if (!var_e688b198aa9a4b3f && lockontarget namespace_1f188a13f7e79610::isvehicle() && namespace_1f188a13f7e79610::vehicle_isfriendlytoplayer(lockontarget, gunner)) {
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

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5fd2
// Size: 0x2df
function gunship_watchchangeweapons(gunner) {
    gunner endon("disconnect");
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    level endon("game_ended");
    /#
        var_c8823e8c933ef356 = getdvarint(@"hash_f49f4fd233809e37", 0);
        if (var_c8823e8c933ef356) {
            return;
        }
    #/
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["gunship"];
    var_28186422e412ef1b = [0:bundle.var_b702d1aa92e3f7dc, 1:bundle.var_2cb6918da56b085b, 2:bundle.var_2b83894fc24a37fc];
    currentweaponindex = var_28186422e412ef1b.size;
    if (!isai(gunner)) {
        gunner notifyonplayercommand("gunship_switch_weapon_next", "+weapnext");
        gunner notifyonplayercommand("gunship_switch_weapon_next", "selectweapon2");
        gunner notifyonplayercommand("gunship_switch_weapon_prev", "+weapprev");
        gunner notifyonplayercommand("gunship_switch_weapon_prev", "selectweapon1");
        gunner setclientomnvar("ui_killstreak_weapon", currentweaponindex);
    }
    while (1) {
        cmd = gunner waittill_any_return_2("gunship_switch_weapon_prev", "gunship_switch_weapon_next");
        if (!isdefined(cmd)) {
            continue;
        }
        gunner playlocalsound("iw8_ks_ac130_weaponswitch");
        currentweapon = gunner getcurrentweapon();
        newweapon = currentweapon;
        foreach (index, weapon in var_28186422e412ef1b) {
            if (currentweapon.basename == weapon) {
                if (cmd == "gunship_switch_weapon_prev") {
                    var_1d78867302ef16af = index - 1;
                    if (var_1d78867302ef16af < 0) {
                        var_1d78867302ef16af = var_28186422e412ef1b.size - 1;
                    }
                } else {
                    var_1d78867302ef16af = index + 1;
                    if (var_1d78867302ef16af > var_28186422e412ef1b.size - 1) {
                        var_1d78867302ef16af = 0;
                    }
                }
                newweapon = var_28186422e412ef1b[var_1d78867302ef16af];
                break;
            }
        }
        if (newweapon != bundle.var_b702d1aa92e3f7dc) {
            gunner notify("gunship_hellfire_disable_tracking");
        }
        gunner _switchtoweaponimmediate(newweapon);
        if (self.currentvisionset == function_44e0bd95b98288ab()) {
            var_6d34d38793b8fcca = gunship_getdofinfobyweapon(newweapon);
            gunner setphysicaldepthoffield(var_6d34d38793b8fcca.fstop, var_6d34d38793b8fcca.focusdistance, 20, 20);
        }
        if (cmd == "gunship_switch_weapon_prev") {
            currentweaponindex++;
            if (currentweaponindex > var_28186422e412ef1b.size) {
                currentweaponindex = 1;
            }
        } else {
            currentweaponindex--;
            if (currentweaponindex == 0) {
                currentweaponindex = var_28186422e412ef1b.size;
            }
        }
        gunner setclientomnvar("ui_killstreak_weapon", currentweaponindex);
        gunner function_58707ddfdd9744fa("killstreak_weapon_change_shutter");
        thread function_9214536761e6be23(newweapon);
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(0.4);
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62b8
// Size: 0x1c4
function gunship_watchweaponfired(gunner) {
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    level endon("game_ended");
    /#
        var_c8823e8c933ef356 = getdvarint(@"hash_f49f4fd233809e37", 0);
        if (var_c8823e8c933ef356) {
            return;
        }
    #/
    streakinfo = self.streakinfo;
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["gunship"];
    while (1) {
        projectile = gunner waittill("missile_fire");
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

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6483
// Size: 0x72
function getmissileexplscale(weaponname) {
    scale = 1;
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["gunship"];
    if (weaponname == bundle.var_b702d1aa92e3f7dc) {
        scale = 0.75;
    } else if (weaponname == bundle.var_2cb6918da56b085b) {
        scale = 0.5;
    }
    return scale;
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x64fd
// Size: 0x86
function getmissileexplradius(weaponname) {
    radius = 1;
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["gunship"];
    if (weaponname == bundle.var_b702d1aa92e3f7dc) {
        radius = 2000;
    } else if (weaponname == bundle.var_2cb6918da56b085b) {
        radius = 1300;
    } else if (weaponname == bundle.var_2b83894fc24a37fc) {
        radius = 700;
    }
    return radius;
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x658b
// Size: 0xaa
function function_3f087cf63f4156fa(gunship, gunner) {
    gunship endon("death");
    gunship endon("leaving");
    gunship endon("crashing");
    gunner endon("disconnect");
    self endon("death");
    targetent = gunship.var_f07dc7f04d04af5f;
    if (isdefined(gunner.missilelaunchertarget) && isdefined(gunner.missilelauncherstage) && gunner.missilelauncherstage == 2) {
        targetent = gunner.missilelaunchertarget;
        gunship notify("gunship_reset_hellfire_lockon");
    }
    self missile_settargetent(targetent);
    gunner waittill("gunship_hellfire_disable_tracking");
    self missile_cleartarget();
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x663c
// Size: 0x3d
function gunship_watchthermaltoggle(gunner) {
    if (!isai(gunner)) {
        gunner thread watchthermalinputchange();
    }
    gunship_watchthermaltoggleinternal(gunner);
    if (isdefined(gunner) && !isai(gunner)) {
        gunner stopwatchingthermalinputchange();
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6680
// Size: 0x36c
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
    var_c550a393da085c54 = 0;
    var_9b037229590a3dc2 = 1;
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["gunship"];
    /#
        var_c8823e8c933ef356 = getdvarint(@"hash_f49f4fd233809e37", 0);
        if (var_c8823e8c933ef356) {
            var_9b037229590a3dc2 = 0;
        }
    #/
    var_41799da9b6cce8be = 12;
    var_a044168d7664b127 = 1000;
    var_93b54405fda960c = function_44e0bd95b98288ab();
    if (utility::iscp() && isdefined(level.var_f02a7fe4a43f02ee)) {
        function_c0b0a582ff9e4d57(level.var_f02a7fe4a43f02ee);
        var_93b54405fda960c = level.var_f02a7fe4a43f02ee;
    }
    if (isnightmap() && istrue(var_9b037229590a3dc2)) {
        gunner setthermalvision(1, var_41799da9b6cce8be, var_a044168d7664b127);
        self.currentvisionset = var_93b54405fda960c;
        self.flashlight notify("flashlight_on");
        var_c550a393da085c54 = 1;
        gunner _shellshock("killstreak_veh_camera_flir_mp", "top", self.timeout, 0);
        gunner setclientomnvar("ui_killstreak_thermal_mode", 1);
        gunner killstreak_setmainvision(var_93b54405fda960c);
    }
    while (1) {
        gunner waittill("switch_thermal_mode");
        currentgunshipweapon = gunner getcurrentweapon();
        var_6d34d38793b8fcca = gunship_getdofinfobyweapon(currentgunshipweapon.basename);
        if (!istrue(var_c550a393da085c54)) {
            gunner setthermalvision(1, var_6d34d38793b8fcca.fstop, var_6d34d38793b8fcca.focusdistance);
            self.currentvisionset = var_93b54405fda960c;
            var_c550a393da085c54 = 1;
            gunner _shellshock("killstreak_veh_camera_flir_mp", "top", self.timeout, 0);
            gunner setclientomnvar("ui_killstreak_thermal_mode", 1);
            gunner killstreak_setmainvision(var_93b54405fda960c);
        } else {
            var_b050705ce498bcb2 = bundle.var_7a35928e082dd9b7;
            if (isdefined(level.mapname) && (issubstr(level.mapname, "_shipment") || issubstr(level.mapname, "mp_skerries") || getdvarint(@"hash_ef7e2418dc2fe517", 0))) {
                var_b050705ce498bcb2 = bundle.var_6070115b879adfc9;
            }
            if (isdefined(level.var_bfab55c68d5dee05)) {
                gunner killstreak_setmainvision(level.var_bfab55c68d5dee05);
                self.currentvisionset = level.var_bfab55c68d5dee05;
            } else {
                gunner killstreak_setmainvision(var_b050705ce498bcb2);
                self.currentvisionset = var_b050705ce498bcb2;
            }
            var_c550a393da085c54 = 0;
            gunner _shellshock("killstreak_veh_camera_mp", "top", self.timeout, 0);
            gunner setclientomnvar("ui_killstreak_thermal_mode", 0);
            gunner setthermalvision(0);
        }
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69f3
// Size: 0xce
function gunship_getdofinfobyweapon(var_5c3f9357f11d2223) {
    var_6d34d38793b8fcca = spawnstruct();
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["gunship"];
    if (var_5c3f9357f11d2223 == bundle.var_b702d1aa92e3f7dc) {
        var_6d34d38793b8fcca.fstop = 8;
        var_6d34d38793b8fcca.focusdistance = 600;
    } else if (var_5c3f9357f11d2223 == bundle.var_2cb6918da56b085b) {
        var_6d34d38793b8fcca.fstop = 8;
        var_6d34d38793b8fcca.focusdistance = 600;
    } else if (var_5c3f9357f11d2223 == bundle.var_2b83894fc24a37fc) {
        var_6d34d38793b8fcca.fstop = 8;
        var_6d34d38793b8fcca.focusdistance = 3500;
    }
    return var_6d34d38793b8fcca;
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ac9
// Size: 0x9b
function gunship_watchthermalflashlightpos(gunship, gunner) {
    self endon("death");
    level endon("game_ended");
    var_9acf6ade59c12899 = 1;
    /#
        var_c8823e8c933ef356 = getdvarint(@"hash_f49f4fd233809e37", 0);
        if (var_c8823e8c933ef356) {
            var_9acf6ade59c12899 = 0;
        }
    #/
    while (isdefined(gunship) && isdefined(gunner)) {
        self.origin = gunship.origin;
        if (istrue(var_9acf6ade59c12899)) {
            self.angles = gunner getplayerangles();
        }
        wait(0.05);
    }
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b6b
// Size: 0x72
function gunship_showflashlight() {
    self endon("death");
    level endon("game_ended");
    playfxontag(getfx("camera_spotlight"), self, "tag_origin");
    while (1) {
        level waittill("player_enabled_nvgs");
        stopfxontag(getfx("camera_spotlight"), self, "tag_origin");
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(0.1);
        playfxontag(getfx("camera_spotlight"), self, "tag_origin");
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6be4
// Size: 0x204
function gunship_weaponreload(weapon, gunship) {
    gunship endon("death");
    gunship endon("crashing");
    gunship endon("leaving");
    self endon("disconnect");
    level endon("game_ended");
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["gunship"];
    var_49e6ef3edadd524e = getgunshipweaponrootname(weapon);
    reloadsound = var_49e6ef3edadd524e + "_mp_reload";
    var_dd020944ee631ba8 = strtok(var_49e6ef3edadd524e, "_");
    if (var_dd020944ee631ba8[0] == "gunship") {
        reloadsound = "ac130";
        for (i = 1; i < var_dd020944ee631ba8.size; i++) {
            var_6712915fc5b2de68 = var_dd020944ee631ba8[i];
            if (var_6712915fc5b2de68 == "hellfire") {
                var_6712915fc5b2de68 = "105mm";
            }
            reloadsound = reloadsound + "_" + var_6712915fc5b2de68;
        }
        reloadsound = reloadsound + "_mp_reload";
    }
    self playlocalsound(reloadsound);
    if (weapon.basename == bundle.var_b702d1aa92e3f7dc) {
        gunship.var_d933dae6a2be2faf = 0;
    }
    gunship_waitforweaponreloadtime(weapon, var_49e6ef3edadd524e);
    var_239a0fd1534c98 = var_49e6ef3edadd524e + "_reload";
    playkillstreakoperatordialog("gunship", var_239a0fd1534c98, undefined, undefined, "pilot");
    maxammo = weaponmaxammo(weapon);
    self setweaponammoclip(weapon, maxammo);
    if (weapon.basename == bundle.var_b702d1aa92e3f7dc) {
        gunship.var_d933dae6a2be2faf = 1;
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

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6def
// Size: 0xc3
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
    while (1) {
        wait(0.05);
        reloadtime = reloadtime - 0.05;
        if (reloadtime <= 0) {
            break;
        }
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6eb9
// Size: 0x54
function getgunshipweaponrootname(weapon) {
    index = 0;
    weaponname = weapon.basename;
    tokens = strtok(weaponname, "_");
    return tokens[index] + "_" + tokens[index + 1];
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f15
// Size: 0xb6
function gunship_playpilotfx(pilot) {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    level endon("game_ended");
    /#
        var_c8823e8c933ef356 = getdvarint(@"hash_f49f4fd233809e37", 0);
        if (var_c8823e8c933ef356) {
            return;
        }
    #/
    pilot.gunship_cloudsfx = spawn("script_model", pilot geteye());
    pilot.gunship_cloudsfx setmodel("tag_origin");
    pilot.gunship_cloudsfx linkto(pilot, "tag_eye");
    waitframe();
    playfxontagforclients(getfx("clouds"), pilot.gunship_cloudsfx, "tag_origin", pilot);
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6fd2
// Size: 0x22
function deleteaftertime(delay) {
    self endon("death");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(delay);
    self delete();
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ffb
// Size: 0x30
function gunship_crash(gunner) {
    self notify("crashing");
    self.crashed = 1;
    thread function_43c36396180ee798(gunner);
    thread gunship_movetocrashpos();
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7032
// Size: 0xfe
function function_43c36396180ee798(gunner) {
    if (!isdefined(gunner)) {
        return;
    }
    if (isdefined(self)) {
        self endon("death");
        gunner endon("disconnect");
        thread gunship_returnplayer(gunner, 1);
        if (isdefined(self.gunshipintro) && level.var_faf1aba229e3e2a9 == 0) {
            self.gunshipintro function_7eb343dd6a3f639(gunner, "light_interior_outro", "on", "ks_gunship_interior_outro", 0.5);
            self playsoundtoplayer("iw9_gunship_plr_outro", gunner);
            gunner playkillstreakoperatordialog("gunship", "gunship" + "_crash", 1, undefined, "pilot");
            var_fbde3ff0d883172a = function_52351c3338da63f4("gunship", "outro_gunner");
            gunner thread gunship_crashexplosionradiostatic(var_fbde3ff0d883172a);
            gunner function_fa9987de43a6169b(self.gunshipintro, "outro");
            self.gunshipintro function_7eb343dd6a3f639(gunner, "light_interior_outro", "off", "ks_gunship_interior_outro", 0);
        }
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7137
// Size: 0x2fc
function gunship_movetocrashpos() {
    level endon("game_ended");
    self.leftwingfxent setscriptablepartstate("engine_blowout", "off");
    self.rightwingfxent setscriptablepartstate("engine_blowout", "off");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(3);
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
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["gunship"];
    var_ce1134ba0cda2fb9 = spawn("script_model", self.origin);
    var_ce1134ba0cda2fb9 setmodel(bundle.var_579059c670a08df4);
    var_ce1134ba0cda2fb9.angles = self.angles;
    var_ce1134ba0cda2fb9.animname = self.streakinfo.streakname;
    var_ce1134ba0cda2fb9 namespace_bc4a4b9456315863::setanimtree();
    var_9b7aa4db8d96367f = spawn("script_model", self.origin);
    var_9b7aa4db8d96367f setmodel("ks_gunship_mp");
    var_9b7aa4db8d96367f.angles = self.angles;
    var_9b7aa4db8d96367f linkto(var_ce1134ba0cda2fb9, "tag_body", (0, 0, -10), (0, 0, 0));
    /#
    #/
    var_d4a561cabc248249 = "crash_air";
    var_9b7aa4db8d96367f setscriptablepartstate(var_d4a561cabc248249, "on", 0);
    if (issharedfuncdefined("entity", "delayEntDelete")) {
        var_9b7aa4db8d96367f thread [[ getsharedfunc("entity", "delayEntDelete") ]](10);
        var_ce1134ba0cda2fb9 thread [[ getsharedfunc("entity", "delayEntDelete") ]](10);
    }
    var_ce1134ba0cda2fb9 thread gunship_crash_audio();
    var_1041b7883e5d3da5 = "outro_gunship_death";
    var_f7380e0ba9c6762f = function_52351c3338da63f4("gunship", var_1041b7883e5d3da5);
    thread gunship_delayhide();
    thread gunship_crashexplosionscreenshake(var_f7380e0ba9c6762f);
    self.var_ba27aac5a0f799e0 namespace_bc4a4b9456315863::anim_single_solo(var_ce1134ba0cda2fb9, var_1041b7883e5d3da5);
    self.var_ba27aac5a0f799e0 delete();
    gunship_removeplane(1);
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x743a
// Size: 0x17
function gunship_delayhide() {
    level endon("game_ended");
    wait(0.05);
    self hide();
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7458
// Size: 0x9b
function gunship_crashexplosionscreenshake(delaytime) {
    level endon("game_ended");
    var_14b1d0692795af2f = delaytime - 2;
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_14b1d0692795af2f);
    foreach (player in level.players) {
        if (player namespace_f8065cafc523dba5::_isalive()) {
            player earthquakeforplayer(0.25, 2, self.origin, 30000);
        }
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74fa
// Size: 0x2c
function gunship_crashexplosionradiostatic(delaytime) {
    level endon("game_ended");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(delaytime);
    function_5a9772411551e56e("gunship", "pilot");
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x752d
// Size: 0x54
function gunship_crash_audio() {
    waitframe();
    playsoundatpos(self.origin, "iw8_ks_ac130_explo_main");
    playsoundatpos(self.origin, "iw8_ks_ac130_explo_low_02");
    playsoundatpos(self.origin, "iw8_ks_ac130_shake_explo");
    playsoundatpos(self.origin, "iw8_ks_ac130_whine");
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7588
// Size: 0x13d
function gunship_removeplane(var_4fac8b8ce36e09f1) {
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
    if (isdefined(self.var_f07dc7f04d04af5f)) {
        self.var_f07dc7f04d04af5f delete();
    }
    if (isdefined(self.minimapid)) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "returnObjectiveID")) {
            [[ namespace_3c37cb17ade254d::getsharedfunc("game", "returnObjectiveID") ]](self.minimapid);
        }
        self.minimapid = undefined;
    }
    self.streakinfo.expiredbydeath = istrue(var_4fac8b8ce36e09f1);
    if (isdefined(self.owner)) {
        self.owner namespace_9abe40d2af041eb2::recordkillstreakendstats(self.streakinfo);
    }
    self delete();
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76cc
// Size: 0xd2
function function_3856d3338b2c7ebf(gunshipintro) {
    if (isdefined(gunshipintro)) {
        if (isdefined(gunshipintro.var_ba27aac5a0f799e0)) {
            gunshipintro.var_ba27aac5a0f799e0 delete();
        }
        if (isent(gunshipintro)) {
            gunshipintro setscriptablepartstate("clouds_intro", "off", 0);
            gunshipintro setscriptablepartstate("bodyFX_intro", "off", 0);
            gunshipintro delete();
        } else if (isdefined(gunshipintro.var_5cb1f0f95e16878e)) {
            foreach (var_b2a3f9abcee9d071 in gunshipintro.var_5cb1f0f95e16878e) {
                if (isdefined(var_b2a3f9abcee9d071)) {
                    var_b2a3f9abcee9d071 delete();
                }
            }
        }
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77a5
// Size: 0x86
function function_5efa20e5c624be8f(gunshipintro) {
    if (isdefined(gunshipintro)) {
        if (isdefined(gunshipintro.var_5cb1f0f95e16878e)) {
            foreach (var_b2a3f9abcee9d071 in gunshipintro.var_5cb1f0f95e16878e) {
                if (isdefined(var_b2a3f9abcee9d071)) {
                    var_b2a3f9abcee9d071 hidefromplayer(gunshipintro.var_dee7149209c9df8c);
                }
            }
        }
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7832
// Size: 0x2dc
function function_fa9987de43a6169b(gunshipintro, sequence) {
    self endon("disconnect");
    var_c8823e8c933ef356 = 0;
    /#
        var_c8823e8c933ef356 = getdvarint(@"hash_f49f4fd233809e37", 0);
    #/
    if (!isdefined(gunshipintro.var_dee7149209c9df8c)) {
        gunshipintro.var_dee7149209c9df8c = self;
    }
    if (isdefined(gunshipintro) && isdefined(sequence)) {
        thread function_d13d2a81214fbfb8("80_instant_noscale", 1);
        if (sequence == "intro_gunship_exterior") {
            var_d0b97be6dc1a3eba = gunshipintro.var_5cb1f0f95e16878e["gunship_exterior"];
            var_258b660f7db9aba6 = function_52351c3338da63f4("gunship", sequence);
            var_d0b97be6dc1a3eba showtoplayer(gunshipintro.var_dee7149209c9df8c);
            var_d0b97be6dc1a3eba setscriptablepartstate("clouds_intro", "old", 0);
            var_d0b97be6dc1a3eba setscriptablepartstate("bodyFX_intro", "on", 0);
            gunshipintro.var_ba27aac5a0f799e0 thread namespace_bc4a4b9456315863::anim_single_solo(var_d0b97be6dc1a3eba, sequence);
            if (!var_c8823e8c933ef356) {
                gunshipintro.var_dee7149209c9df8c cameralinkto(var_d0b97be6dc1a3eba, "tag_player", 1, 1);
            }
            var_d0b97be6dc1a3eba thread gunship_startintroshake(var_258b660f7db9aba6, self, sequence);
            var_d0b97be6dc1a3eba thread function_c285675bee6618a3(var_258b660f7db9aba6, self, sequence);
            var_d0b97be6dc1a3eba thread function_2be9ae7928984f8(var_258b660f7db9aba6, self);
            wait(var_258b660f7db9aba6);
            if (!var_c8823e8c933ef356) {
                gunshipintro.var_dee7149209c9df8c cameraunlink();
            }
        } else {
            if (sequence == "intro") {
                var_d0b97be6dc1a3eba = gunshipintro.var_5cb1f0f95e16878e["gunship_exterior"];
                var_d0b97be6dc1a3eba setscriptablepartstate("clouds_intro", "off", 0);
                var_d0b97be6dc1a3eba setscriptablepartstate("bodyFX_intro", "off", 0);
            }
            if (isdefined(gunshipintro.var_5cb1f0f95e16878e)) {
                foreach (modelindex, var_b2a3f9abcee9d071 in gunshipintro.var_5cb1f0f95e16878e) {
                    if (isdefined(var_b2a3f9abcee9d071)) {
                        if (modelindex == "gunship_exterior") {
                            continue;
                        }
                        var_b2a3f9abcee9d071 showtoplayer(gunshipintro.var_dee7149209c9df8c);
                        if (modelindex == "gunship_interior") {
                            continue;
                        }
                        var_465db5572e637fb7 = sequence + "_" + modelindex;
                        gunshipintro.var_ba27aac5a0f799e0 thread namespace_bc4a4b9456315863::anim_single_solo(var_b2a3f9abcee9d071, var_465db5572e637fb7);
                        if (!var_c8823e8c933ef356 && modelindex == "gunner") {
                            gunshipintro.var_dee7149209c9df8c cameralinkto(var_b2a3f9abcee9d071, "tag_camera", 1, 1);
                            var_9adc9e34bc4e0c77 = function_52351c3338da63f4("gunship", sequence + "_gunner");
                            var_b2a3f9abcee9d071 thread function_c285675bee6618a3(var_9adc9e34bc4e0c77, self, sequence);
                        }
                    }
                }
                var_258b660f7db9aba6 = function_52351c3338da63f4("gunship", sequence + "_gunner");
                wait(var_258b660f7db9aba6);
            }
        }
        self notify("finished_gunship_anim_" + sequence);
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b15
// Size: 0x253
function function_d176c031e49a9127(var_5e0676140eecdf2d, var_d2d59b55e30230d3) {
    var_9d01f34ccffdac1c = 1;
    var_cf01d7be22198c56 = spawnstruct();
    probe = getent(var_5e0676140eecdf2d, "script_noteworthy");
    if (!isdefined(probe)) {
        /#
            /#
                assertex(0, "binder");
            #/
            self iprintln("binder");
        #/
        return undefined;
    }
    var_8bdf4260870ec3d6 = getentarray(var_d2d59b55e30230d3, "targetname");
    if (!isdefined(var_8bdf4260870ec3d6)) {
        /#
            /#
                assertex(0, "binder");
            #/
            self iprintln("binder");
        #/
        return undefined;
    }
    var_cf01d7be22198c56.probe = probe;
    var_cf01d7be22198c56.var_8bdf4260870ec3d6 = var_8bdf4260870ec3d6;
    var_ad02eaa051593bff = [];
    var_4662a9052a5547bd = [];
    var_ad02eaa051593bff["pos"] = probe.origin;
    var_ad02eaa051593bff["rot"] = probe.angles;
    var_cf01d7be22198c56.var_af2c99167339224 = var_ad02eaa051593bff;
    foreach (index, brush in var_8bdf4260870ec3d6) {
        var_3c1fb3060fc3306c = [];
        var_3c1fb3060fc3306c["pos"] = brush.origin;
        var_3c1fb3060fc3306c["rot"] = brush.angles;
        var_4662a9052a5547bd[index] = var_3c1fb3060fc3306c;
    }
    var_cf01d7be22198c56.var_959ac8221d7965be = var_4662a9052a5547bd;
    foreach (var_6c3d15091efa3c48 in level.players) {
        probe hidefromplayer(var_6c3d15091efa3c48);
        probe thread gunship_hideintromodelonplayerconnect(self);
        foreach (brush in var_8bdf4260870ec3d6) {
            brush hidefromplayer(var_6c3d15091efa3c48);
            brush thread gunship_hideintromodelonplayerconnect(self);
        }
    }
    return var_cf01d7be22198c56;
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d70
// Size: 0xf1
function function_4293b1250d8a40ec(owner, var_cf01d7be22198c56, var_6da471e460c9b62c) {
    if (istrue(var_6da471e460c9b62c)) {
        var_cf01d7be22198c56.probe showtoplayer(owner);
        foreach (brush in var_cf01d7be22198c56.var_8bdf4260870ec3d6) {
            brush showtoplayer(owner);
        }
    } else {
        var_cf01d7be22198c56.probe hidefromplayer(owner);
        foreach (brush in var_cf01d7be22198c56.var_8bdf4260870ec3d6) {
            brush hidefromplayer(owner);
        }
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e68
// Size: 0x43
function function_4d00f78750774093(var_cf01d7be22198c56) {
    if (!isdefined(var_cf01d7be22198c56)) {
        return;
    }
    var_cf01d7be22198c56.probe linkto(self, "tag_origin", (100, 0, 115), (0, 0, 0));
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7eb2
// Size: 0x88
function function_bbfa3bca65cb8e4c(var_cf01d7be22198c56) {
    if (!isdefined(var_cf01d7be22198c56)) {
        return;
    }
    foreach (brush in var_cf01d7be22198c56.var_8bdf4260870ec3d6) {
        brush linkto(self, "tag_origin", (0, 0, 0), (0, 0, 0));
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f41
// Size: 0x71
function function_38101db6ed950f17(var_cf01d7be22198c56) {
    if (!isdefined(var_cf01d7be22198c56)) {
        return;
    }
    var_cf01d7be22198c56.probe unlink();
    var_cf01d7be22198c56.probe.origin = var_cf01d7be22198c56.var_af2c99167339224["pos"];
    var_cf01d7be22198c56.probe.angles = var_cf01d7be22198c56.var_af2c99167339224["rot"];
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fb9
// Size: 0x7c
function function_fff560b330fd842d() {
    if (getdvarint(@"hash_e6afce2cf5cf7515") == 0) {
        var_152974660457623 = getentarray("ks_gunship_light_only", "script_noteworthy");
        foreach (m in var_152974660457623) {
            m hide();
        }
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x803c
// Size: 0xa6
function function_ecc286c2d3dcb77d(var_cf01d7be22198c56) {
    if (!isdefined(var_cf01d7be22198c56)) {
        return;
    }
    foreach (index, brush in var_cf01d7be22198c56.var_8bdf4260870ec3d6) {
        brush unlink();
        brush.origin = var_cf01d7be22198c56.var_959ac8221d7965be[index]["pos"];
        brush.angles = var_cf01d7be22198c56.var_959ac8221d7965be[index]["rot"];
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80e9
// Size: 0x138
function function_7eb343dd6a3f639(player, var_8a46c62f0a756dd3, state, visionset_name, time) {
    var_c8823e8c933ef356 = undefined;
    /#
        var_c8823e8c933ef356 = getdvarint(@"hash_f49f4fd233809e37", 0);
        if (istrue(var_c8823e8c933ef356)) {
            return;
        }
    #/
    if (!isdefined(player)) {
        return;
    }
    if (state == "on") {
        self.var_3589ad3885d61683 function_4293b1250d8a40ec(player, self.var_9bc4ed07a250f4d3, 1);
        self.var_3589ad3885d61683 function_4d00f78750774093(self.var_9bc4ed07a250f4d3);
        self.var_3589ad3885d61683 function_bbfa3bca65cb8e4c(self.var_9bc4ed07a250f4d3);
        self.var_3589ad3885d61683 setscriptablepartstate(var_8a46c62f0a756dd3, "on");
        player visionsetnakedforplayer(visionset_name, time);
    } else if (state == "off") {
        self.var_3589ad3885d61683 function_4293b1250d8a40ec(player, self.var_9bc4ed07a250f4d3, 0);
        function_38101db6ed950f17(self.var_9bc4ed07a250f4d3);
        function_ecc286c2d3dcb77d(self.var_9bc4ed07a250f4d3);
        self.var_3589ad3885d61683 setscriptablepartstate(var_8a46c62f0a756dd3, "off");
        player visionsetnakedforplayer("", time);
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8228
// Size: 0x5c
function function_eb2299f7c29ac70c(gunshipintro, var_b2a3f9abcee9d071, var_465db5572e637fb7) {
    /#
        var_b2a3f9abcee9d071 endon("light");
        self notifyonplayercommand("hitequip", "attachXRays");
        while (1) {
            self waittill("hitequip");
            gunshipintro.var_ba27aac5a0f799e0 thread namespace_bc4a4b9456315863::anim_single_solo(var_b2a3f9abcee9d071, var_465db5572e637fb7);
        }
    #/
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x828b
// Size: 0x334
function gunship_control_bot_aiming() {
    var_4ac4b608421ecbbb = undefined;
    var_4d571df5f3a8befc = undefined;
    var_f3ff73980fae5db1 = undefined;
    var_befbf47bff2227bd = 0;
    var_ea189b55de5c8fa7 = 0;
    var_ab3e79c5f7d858af = undefined;
    var_4174d86981043509 = (self botgetdifficultysetting("minInaccuracy") + self botgetdifficultysetting("maxInaccuracy")) / 2;
    var_def9c228381a493a = 0;
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["gunship"];
    while (1) {
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
                var_def9c228381a493a = var_def9c228381a493a + 0.05;
                if (var_def9c228381a493a > 5) {
                    var_d430bcda6275a38b = 0;
                }
            }
        }
        if (var_d430bcda6275a38b) {
            if (isdefined(var_4ac4b608421ecbbb)) {
                var_f3ff73980fae5db1 = var_4ac4b608421ecbbb;
            }
            if (issharedfuncdefined("bots", "bot_body_is_dead")) {
                if (var_4b05a8497817406a && (self [[ getsharedfunc("bots", "bot_body_is_dead") ]]() || distancesquared(var_f3ff73980fae5db1, level.gunship.origin) > level.physicssphereradius[bundle.var_b702d1aa92e3f7dc] * level.physicssphereradius[bundle.var_b702d1aa92e3f7dc])) {
                    self botpressbutton("attack");
                }
            }
            if (gettime() > var_ea189b55de5c8fa7 + 500) {
                var_bcfec646853a95c1 = randomfloatrange(-1 * var_4174d86981043509 / 2, var_4174d86981043509 / 2);
                var_bcfec546853a938e = randomfloatrange(-1 * var_4174d86981043509 / 2, var_4174d86981043509 / 2);
                var_bcfec446853a915b = randomfloatrange(-1 * var_4174d86981043509 / 2, var_4174d86981043509 / 2);
                var_ab3e79c5f7d858af = (150 * var_bcfec646853a95c1, 150 * var_bcfec546853a938e, 150 * var_bcfec446853a915b);
                var_ea189b55de5c8fa7 = gettime();
            }
            var_f3ff73980fae5db1 = var_f3ff73980fae5db1 + var_ab3e79c5f7d858af;
        } else if (gettime() > var_befbf47bff2227bd) {
            var_befbf47bff2227bd = gettime() + randomintrange(1000, 2000);
            var_f3ff73980fae5db1 = undefined;
            if (issharedfuncdefined("bots", "get_random_outside_target")) {
                var_f3ff73980fae5db1 = [[ getsharedfunc("bots", "get_random_outside_target") ]]();
            }
        }
        self botlookatpoint(var_f3ff73980fae5db1, 0.2, "script_forced");
        wait(0.05);
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85c6
// Size: 0x1c7
function gunship_handlemissiledetection(player, var_82fd3ee8fbace30e, missiletarget, var_5991f0e5da9f9bd5) {
    self endon("death");
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
            missiletarget thread gunship_playflaresfx(var_5991f0e5da9f9bd5);
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
            var_cbbb045b041ffebe = weapongetdamagemax(self.weapon_name);
            if (isdefined(self.owner)) {
                missiletarget dodamage(var_cbbb045b041ffebe, self.owner.origin, self.owner, self, "MOD_EXPLOSIVE", self.weapon_name);
            }
            self delete();
        }
        waitframe();
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8794
// Size: 0x84
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
    wait(2);
    self setscriptablepartstate("fake_missile_expl_" + self.missileexplcounter, "off", 0);
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x881f
// Size: 0x74
function gunship_playflaresfx(var_5991f0e5da9f9bd5) {
    var_23e275144756d0 = "tag_origin";
    if (isdefined(var_5991f0e5da9f9bd5)) {
        var_23e275144756d0 = var_5991f0e5da9f9bd5;
    }
    playsoundatpos(self gettagorigin(var_23e275144756d0), "ks_ac130_flares");
    playfxontag(getfx("gunship_flares"), self, var_23e275144756d0);
    var_f013ad964dee7733 = self.flaresreservecount + 1;
    self setscriptablepartstate("fake_flares_" + var_f013ad964dee7733, "on", 0);
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x889a
// Size: 0xd
function isusinggunship() {
    return isdefined(self.usinggunship);
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88af
// Size: 0x41
function gunship_linklightfxent() {
    self endon("death");
    level endon("game_ended");
    wait(0.05);
    var_5b4bfd7150e39ee0 = anglestoforward(self.angles);
    self setscriptablepartstate("lights", "on");
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88f7
// Size: 0x16c
function gunship_linkwingfxents() {
    self endon("death");
    level endon("game_ended");
    wait(0.05);
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

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8a6a
// Size: 0x4e
function function_9a76988758d4b96d(var_61529f08d2aec035) {
    /#
        self endon("light");
        level endon("ui_gunship_coord2_posz");
        while (1) {
            sphere(var_61529f08d2aec035.origin, 100, (1, 0, 0), 0, 1);
            wait(0.05);
        }
    #/
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8abf
// Size: 0x1cd
function gunship_watchtargets(gunner) {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    level endon("game_ended");
    gunner endon("disconnect");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(5);
    while (1) {
        var_c26b9f481753e189 = [];
        foreach (player in level.players) {
            if (!isdefined(player) || !player namespace_f8065cafc523dba5::_isalive()) {
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
                var_c26b9f481753e189 = gunship_getnearbytargets(player);
                break;
            }
            wait(0.05);
        }
        if (var_c26b9f481753e189.size > 0 && var_c26b9f481753e189.size < 2) {
            gunner playkillstreakoperatordialog("gunship", "gunship" + "_spotted_single_target", undefined, undefined, "pilot");
        } else if (var_c26b9f481753e189.size >= 2) {
            gunner playkillstreakoperatordialog("gunship", "gunship" + "_spotted_single_multi", undefined, undefined, "pilot");
        }
        wait(randomintrange(5, 15));
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c93
// Size: 0xcc
function gunship_getnearbytargets(var_50ed806f04c63d) {
    var_69338ca0bf9d8d91 = utility::playersinsphere(var_50ed806f04c63d.origin, 300);
    var_bc19a29ed084d79c = [];
    foreach (player in var_69338ca0bf9d8d91) {
        if (level.teambased && player.team != var_50ed806f04c63d.team) {
            continue;
        }
        if (!level.teambased && player == self.owner) {
            continue;
        }
        var_bc19a29ed084d79c[var_bc19a29ed084d79c.size] = player;
    }
    return var_bc19a29ed084d79c;
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d67
// Size: 0xbe
function function_39464052869b655d(gunner) {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    level endon("game_ended");
    gunner endon("disconnect");
    self.var_d743ac65ecce766 = 0;
    childthread gunship_watchkills();
    childthread function_c8437bfb873fd165();
    while (1) {
        if (self.var_d743ac65ecce766 != 0) {
            wait(2);
            if (self.var_d743ac65ecce766 >= 1) {
                playkillstreakoperatordialog("gunship", "gunship" + "_hit_target", undefined, undefined, "pilot");
            } else {
                playkillstreakoperatordialog("gunship", "gunship" + "_miss_target", undefined, undefined, "pilot");
            }
            self.var_d743ac65ecce766 = 0;
            wait(1);
        }
        waitframe();
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e2c
// Size: 0x40
function gunship_watchkills() {
    while (1) {
        weaponname = var_e4c6376813e5a077 = self.owner waittill("update_rapid_kill_buffered");
        if (isdefined(var_e4c6376813e5a077)) {
            self.var_d743ac65ecce766++;
        }
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e73
// Size: 0x40
function function_c8437bfb873fd165() {
    while (1) {
        weaponname = var_e4c6376813e5a077 = self.owner waittill("update_rapid_agent_kill_buffered");
        if (isdefined(var_e4c6376813e5a077)) {
            self.var_d743ac65ecce766++;
        }
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8eba
// Size: 0x6e
function gunship_iskillstreakweapon(weaponname) {
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["gunship"];
    return ter_op(isdefined(weaponname) && (weaponname == bundle.var_b702d1aa92e3f7dc || weaponname == bundle.var_2cb6918da56b085b || weaponname == bundle.var_2b83894fc24a37fc), 1, 0);
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8f30
// Size: 0x3a
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

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f72
// Size: 0xe7
function gunship_allowstances(boolean) {
    if (!istrue(boolean)) {
        self.gunship_disabledstances = [];
        currentstance = self getstance();
        switch (currentstance) {
        case #"hash_c6775c88e38f7803":
            self.gunship_disabledstances = [0:"crouch", 1:"prone"];
            break;
        case #"hash_3fed0cbd303639eb":
            self.gunship_disabledstances = [0:"stand", 1:"prone"];
            break;
        case #"hash_d91940431ed7c605":
            self.gunship_disabledstances = [0:"stand", 1:"crouch"];
            break;
        }
        val::function_2d6e7e0b80767910("gunshipStance", self.gunship_disabledstances);
        val::function_3633b947164be4f3("gunshipStance", 0);
    } else {
        val::function_588f2307a3040610("gunshipStance");
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9060
// Size: 0x32
function function_486b043f227fca86() {
    self endon("death");
    level waittill("game_ended");
    level.var_1217e6483e1a18a0 = array_remove(level.var_1217e6483e1a18a0, self);
    self delete();
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9099
// Size: 0x45
function function_f14aa90c4ef905d2(ent) {
    self endon("death");
    ent waittill_any_2("leaving", "death");
    level.var_1217e6483e1a18a0 = array_remove(level.var_1217e6483e1a18a0, self);
    self delete();
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90e5
// Size: 0x64
function function_aafc33d685563aa4(owner) {
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    owner endon("disconnect");
    level endon("game_ended");
    while (1) {
        targetpos = function_cdf6e1bdfe5b42b5(owner);
        if (isdefined(targetpos)) {
            self.var_f07dc7f04d04af5f.origin = targetpos;
        }
        waitframe();
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9150
// Size: 0x144
function function_5fbd9704078207ad(owner) {
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    owner endon("disconnect");
    level endon("game_ended");
    var_bd96b768daae9f1 = 65;
    lerptime = 0.2;
    currentfov = var_bd96b768daae9f1;
    var_d54d564805c29b7b = undefined;
    var_91c95e88f4de9ed7 = 0;
    var_7b2d7a7927e3e11e = 0;
    owner setclientomnvar("ui_killstreak_zoom_fov", currentfov);
    while (1) {
        if (!isdefined(self.var_5496ff174012e0e0)) {
            waitframe();
            continue;
        }
        if (owner adsbuttonpressed()) {
            var_91c95e88f4de9ed7 = var_91c95e88f4de9ed7 + 0.05;
            if (var_91c95e88f4de9ed7 >= lerptime) {
                var_91c95e88f4de9ed7 = lerptime;
            }
            if (!istrue(var_7b2d7a7927e3e11e)) {
                owner function_58707ddfdd9744fa("killstreak_ads_shutter");
                var_7b2d7a7927e3e11e = 1;
            }
        } else if (var_91c95e88f4de9ed7 > 0) {
            var_91c95e88f4de9ed7 = var_91c95e88f4de9ed7 - 0.05;
            if (var_91c95e88f4de9ed7 <= 0) {
                var_91c95e88f4de9ed7 = 0;
            }
            if (istrue(var_7b2d7a7927e3e11e)) {
                var_7b2d7a7927e3e11e = 0;
            }
        }
        if (var_91c95e88f4de9ed7 >= 0) {
            var_d54d564805c29b7b = self.var_5496ff174012e0e0;
            var_f29615bfb202e7d4 = var_91c95e88f4de9ed7 / lerptime * 100;
            currentfov = int(var_f29615bfb202e7d4 * (var_d54d564805c29b7b - var_bd96b768daae9f1) / 100 + var_bd96b768daae9f1);
        }
        owner setclientomnvar("ui_killstreak_zoom_fov", currentfov);
        wait(0.05);
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x929b
// Size: 0xaf
function function_cdf6e1bdfe5b42b5(owner) {
    content = [0:"physicscontents_clipshot", 1:"physicscontents_missileclip", 2:"physicscontents_vehicleclip"];
    contentoverride = physics_createcontents(content);
    starttrace = owner getvieworigin();
    endtrace = starttrace + anglestoforward(owner getplayerangles()) * 50000;
    ignoreents = owner playerkillstreakgetownerlookatignoreents();
    trace = namespace_2a184fc4902783dc::ray_trace(starttrace, endtrace, ignoreents, contentoverride);
    endpos = trace["position"];
    return endpos;
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9352
// Size: 0x74
function function_9214536761e6be23(var_8ddcee7f743ee3a8) {
    self endon("death");
    self notify("gunhip_storing_fov");
    self endon("gunship_storing_fov");
    while (1) {
        currentplayerweapon = self.owner getcurrentweapon();
        if (isdefined(currentplayerweapon) && currentplayerweapon.basename == var_8ddcee7f743ee3a8) {
            break;
        }
        waitframe();
    }
    self.var_5496ff174012e0e0 = self.owner playergetzoomfov();
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93cd
// Size: 0xcf
function function_ccaa72b347c823bb(gunship, gunner, var_5c3f9357f11d2223) {
    gunship endon("death");
    gunship endon("leaving");
    gunship endon("crashing");
    gunner endon("disconnect");
    self waittill("death");
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["gunship"];
    if (var_5c3f9357f11d2223 == bundle.var_2b83894fc24a37fc) {
        return;
    }
    var_465f0d60f080d408 = bundle.var_ee69fd7db3c43c73;
    if (var_5c3f9357f11d2223 == bundle.var_b702d1aa92e3f7dc) {
        var_465f0d60f080d408 = bundle.var_1773b3703b61838e;
        earthquake(0.125, 0.5, gunship.origin, 1000);
    }
    gunner function_58707ddfdd9744fa(var_465f0d60f080d408);
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x94a3
// Size: 0x21
function function_aaedf89b93495d4f(data) {
    if (isdefined(self)) {
        gunship_crash(self.owner);
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x94cb
// Size: 0x201
function function_377ab89187436937(data) {
    self endon("death");
    self notify("gunship_mini_emp_hit");
    self endon("gunship_mini_emp_hit");
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
        if (namespace_3c37cb17ade254d::issharedfuncdefined("player", "doScoreEvent")) {
            data.attacker thread [[ namespace_3c37cb17ade254d::getsharedfunc("player", "doScoreEvent") ]]("emped_killstreak");
        }
    } else if (self.flaresreservecount > 0 && self.var_e8d88b601e41fba5 <= gettime() - 10000) {
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
        if (namespace_3c37cb17ade254d::issharedfuncdefined("player", "doScoreEvent")) {
            data.attacker thread [[ namespace_3c37cb17ade254d::getsharedfunc("player", "doScoreEvent") ]]("emped_killstreak");
        }
    }
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x96d3
// Size: 0xe4
function function_ae468fe5beababc0(var_2136b63785ee0579) {
    /#
        self endon("light");
        self.owner endon("ui_killstreak_weapon_2_ammo");
        self.owner endon("selectweapon1");
        while (1) {
            trace = namespace_2a184fc4902783dc::ray_trace(self.origin, self.origin - (0, 0, 40000), self);
            line(self.origin, trace["iw8_ks_ac130_explo_main"], (1, 1, 1), 1, 0, 1);
            sphere(var_2136b63785ee0579.origin, 50, (1, 1, 0), 0, 1);
            self.owner iprintlnbold("script_noteworthy" + distance(self.origin, trace["iw8_ks_ac130_explo_main"]));
            waitframe();
        }
    #/
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x97be
// Size: 0x117
function function_9d69dd8c1ff1265c(tagname, var_22c53c353885fe59) {
    /#
        self endon("light");
        while (1) {
            var_55c90b7fe840f6bb = self.origin;
            if (isdefined(tagname)) {
                var_55c90b7fe840f6bb = self gettagorigin(tagname);
            }
            sphere(var_55c90b7fe840f6bb, 100, (1, 1, 1), 0, 1);
            if (istrue(var_22c53c353885fe59)) {
                var_2e7cd5cf380e26b6 = anglestoforward(self.angles);
                var_56f3b0da31462a71 = anglestoright(self.angles);
                var_36a9564bf283f04c = anglestoup(self.angles);
                line(var_55c90b7fe840f6bb, var_55c90b7fe840f6bb + var_2e7cd5cf380e26b6 * 1000, (1, 0, 0), 1, 0, 1);
                line(var_55c90b7fe840f6bb, var_55c90b7fe840f6bb + var_56f3b0da31462a71 * 1000, (0, 1, 0), 1, 0, 1);
                line(var_55c90b7fe840f6bb, var_55c90b7fe840f6bb + var_36a9564bf283f04c * 1000, (0, 0, 1), 1, 0, 1);
            }
            wait(0.05);
        }
    #/
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x98dc
// Size: 0x17b
function function_45ad456c933cbb32() {
    /#
        self endon("light");
        self endon("script_forced");
        self endon("ks_ac130_flares");
        self.owner notifyonplayercommand("ui_killstreak_weapon_2_ammo", "_spotted_single_multi");
        self.owner notifyonplayercommand("selectweapon1", "physicscontents_missileclip");
        self.owner notifyonplayercommand("selectweapon1", "script_model");
        self.flashlight notify("vm_ks_gunship_clipboard2_intro");
        bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["vm_ks_gunship_joystick_intro"];
        weaponstocycle = [0:bundle.var_b702d1aa92e3f7dc, 1:bundle.var_2cb6918da56b085b, 2:bundle.var_2b83894fc24a37fc];
        currentdebugweaponindex = 0;
        currentdebugweapon = weaponstocycle[0];
        while (1) {
            result = self.owner waittill_any_return_2("ui_killstreak_weapon_2_ammo", "selectweapon1");
            if (!isdefined(result)) {
                waitframe();
                continue;
            }
            if (result == "ui_killstreak_weapon_2_ammo") {
                currentdebugweaponindex++;
                if (currentdebugweaponindex > 2) {
                    currentdebugweaponindex = 0;
                }
                currentdebugweapon = weaponstocycle[currentdebugweaponindex];
                self.owner iprintlnbold("vm_ks_gunship_clipboard1_outro" + currentdebugweapon);
            } else {
                var_4d9c1a0e282c25ea = function_120feaa7e2f0658b(self.owner);
                thread function_4f101b253c661e40(var_4d9c1a0e282c25ea, currentdebugweapon);
            }
        }
    #/
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9a5e
// Size: 0x16
function function_ce1591d034df25ad(weapon) {
    /#
        return weaponfiretime(weapon);
    #/
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9a7b
// Size: 0xa7
function function_120feaa7e2f0658b(owner) {
    /#
        content = [0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>"];
        contentoverride = physics_createcontents(content);
        starttrace = owner getvieworigin();
        endtrace = starttrace + anglestoforward(owner getplayerangles()) * 50000;
        trace = namespace_2a184fc4902783dc::ray_trace(starttrace, endtrace, level.characters, contentoverride);
        endpos = trace["iw8_ks_ac130_explo_main"];
        return endpos;
    #/
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9b29
// Size: 0x168
function function_4f101b253c661e40(var_4d9c1a0e282c25ea, currentdebugweapon) {
    /#
        self endon("light");
        self endon("script_forced");
        self endon("ks_ac130_flares");
        self.owner endon("ui_killstreak_weapon_2_ammo");
        self.owner endon("selectweapon1");
        while (1) {
            sphere(var_4d9c1a0e282c25ea, 10, (1, 1, 0), 0, 60);
            self.owner iprintlnbold("<unknown string>" + currentdebugweapon + "<unknown string>" + var_4d9c1a0e282c25ea + "<unknown string>" + getweaponexplosionradius(currentdebugweapon));
            var_4f04b15053655ba = weaponmaxammo(currentdebugweapon);
            thread function_5d02a3b580b4d80e(var_4d9c1a0e282c25ea);
            while (var_4f04b15053655ba > 0) {
                var_e84b952249e4abe = undefined;
                if (issharedfuncdefined("vm_ks_gunship_joystick_intro", "<unknown string>")) {
                    var_e84b952249e4abe = [[ getsharedfunc("vm_ks_gunship_joystick_intro", "<unknown string>") ]](var_4d9c1a0e282c25ea, 100);
                }
                projectile = _magicbullet(makeweapon(currentdebugweapon), self.origin, var_e84b952249e4abe, self.owner);
                var_4f04b15053655ba--;
                if (var_4f04b15053655ba == 0) {
                    wait(1);
                    var_1aeb3c9f2e6b11b9 = level.weaponreloadtime[currentdebugweapon];
                    while (var_1aeb3c9f2e6b11b9 > 0) {
                        self.owner iprintlnbold("<unknown string>" + currentdebugweapon);
                        var_1aeb3c9f2e6b11b9--;
                        wait(1);
                    }
                }
                wait(function_ce1591d034df25ad(currentdebugweapon));
            }
        }
    #/
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9c98
// Size: 0x91
function function_5d02a3b580b4d80e(var_4d9c1a0e282c25ea) {
    /#
        self endon("light");
        self endon("script_forced");
        self endon("ks_ac130_flares");
        self.owner endon("ui_killstreak_weapon_2_ammo");
        self.owner endon("selectweapon1");
        while (1) {
            self.flashlight.angles = vectortoangles(var_4d9c1a0e282c25ea - self.origin);
            line(self.origin, var_4d9c1a0e282c25ea, (1, 1, 1), 1, 0, 1);
            waitframe();
        }
    #/
}

// Namespace gunship/namespace_e21c52e4e1a72be6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9d30
// Size: 0x55
function function_66f838db99a91aa3() {
    /#
        self endon("light");
        wait(10);
        data = namespace_169cd7a8fbc76ee5::packdamagedata(self.owner, self, 1, self.currentprimaryweapon, "<unknown string>", self);
        function_377ab89187436937(data);
        wait(10);
        function_377ab89187436937(data);
    #/
}

