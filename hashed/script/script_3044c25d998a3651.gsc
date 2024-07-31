#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\common\values.gsc;
#using scripts\common\callbacks.gsc;
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
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;

#namespace missile_drone;

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x1b8f
// Size: 0x18
function autoexec main() {
    function_df7ab5b0f898e8bc(function_1823ff50bb28148d("missile_drone"), &init);
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1baf
// Size: 0x13b
function init() {
    if (issharedfuncdefined("killstreak", "registerKillstreak")) {
        [[ getsharedfunc("killstreak", "registerKillstreak") ]]("missile_drone", &function_c02ec136b61774c7);
    }
    bundle = level.streakglobals.streakbundles["missile_drone"];
    if (!isdefined(bundle)) {
        return;
    }
    /#
        setdevdvarifuninitialized(@"hash_9408f57f293556f8", bundle.var_add70aea96644ae7);
        setdevdvarifuninitialized(@"hash_2af3c80dd9b7877c", 0);
        setdevdvarifuninitialized(@"hash_504246b3cc306ce3", 0);
        setdevdvarifuninitialized(@"hash_d07a2098671cd8a0", 0);
        setdevdvarifuninitialized(@"hash_2e5e9981030fb41d", 0);
        setdevdvarifuninitialized(@"hash_6a166afbe2341a95", 0);
        setdevdvarifuninitialized(@"hash_13a6507815632fec", 0);
        setdevdvarifuninitialized(@"hash_2f3ae2569a0dee58", 0);
        setdevdvarifuninitialized(@"hash_c8695e521ed5faf1", 0);
    #/
    level thread function_1cd11c6f0c051cdd();
    level function_39b0f1f060c13982();
    level function_2e34e3b637838a30();
    level function_3ad16832e078048f();
    level function_a108cf47f68d34cc();
    level function_a14fde47f6dc1839();
    level function_31303a706f015e();
    thread function_fff560b330fd842d();
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1cf2
// Size: 0xd
function function_62380ee42a08020c(streakinfo) {
    return true;
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d08
// Size: 0xb4
function function_1cd11c6f0c051cdd() {
    level endon("game_ended");
    flag_wait("onStartGameTypeFinished");
    if (isdefined(level.mapcenter)) {
        level.var_9d7c686bc04408b7 = level.mapcenter;
    } else {
        level.var_9d7c686bc04408b7 = (0, 0, 0);
    }
    if (level.mapname == "mp_jup_dubai") {
        level.var_9d7c686bc04408b7 += (0, -500, 0);
        return;
    }
    if (level.mapname == "mp_jup_emergency") {
        level.var_9d7c686bc04408b7 += (-500, -500, 0);
    }
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1dc4
// Size: 0xd6
function function_39b0f1f060c13982() {
    bundle = level.streakglobals.streakbundles["missile_drone"];
    level.var_49c7b401bdf0c0af["move"] = 250;
    level.var_49c7b401bdf0c0af["rotate"] = 120;
    level.var_7b7eec26880df4cc = makeweapon(bundle.deployweaponname);
    level.physicssphereradius[bundle.var_483b0b941a89a454] = 1000;
    level.physicssphereforce[bundle.var_483b0b941a89a454] = 6;
    level.weaponreloadtime[bundle.var_483b0b941a89a454] = bundle.var_6b93dbd076d9fee5;
    level.var_be36c8da670087a8 = [];
    registervisibilityomnvarforkillstreak("missile_drone", "on", 17);
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ea2
// Size: 0xb5
function function_2e34e3b637838a30() {
    val::group_register("missileDroneIntro", ["allow_jump", "usability", "killstreaks", "supers", "gesture", "fire", "weapon_switch", "allow_movement", "offhand_weapons", "shellshock"]);
    val::group_register("missileDroneUse", ["usability", "killstreaks", "supers", "gesture", "weapon_switch", "allow_movement", "shellshock"]);
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f5f
// Size: 0x576
function function_3ad16832e078048f() {
    level.scr_animtree["missile_drone"] = %script_model;
    animindex = "intro_missile_drone";
    level.scr_anim["missile_drone"][animindex] = script_model%mp_acharlie130_intro;
    animindex = "intro_missile_drone_exterior";
    level.scr_anim["missile_drone"][animindex] = script_model%iw9_mp_acharlie130_intro;
    animindex = "intro_gunner";
    level.scr_anim["missile_drone"][animindex] = script_model%vm_ks_gunship_player_intro;
    animindex = "intro_co_gunner";
    level.scr_anim["missile_drone"][animindex] = script_model%wm_ks_gunship_pilot2_intro;
    animindex = "intro_desk";
    level.scr_anim["missile_drone"][animindex] = script_model%vm_ks_gunship_desk_intro;
    animindex = "intro_clipboard_1";
    level.scr_anim["missile_drone"][animindex] = script_model%vm_ks_gunship_clipboard1_intro;
    animindex = "intro_clipboard_2";
    level.scr_anim["missile_drone"][animindex] = script_model%vm_ks_gunship_clipboard2_intro;
    animindex = "intro_paper";
    level.scr_anim["missile_drone"][animindex] = script_model%vm_ks_gunship_paper1_intro;
    animindex = "intro_pen_1";
    level.scr_anim["missile_drone"][animindex] = script_model%vm_ks_gunship_pen1_intro;
    animindex = "intro_pen_2";
    level.scr_anim["missile_drone"][animindex] = script_model%vm_ks_gunship_pen2_intro;
    animindex = "intro_smartphone";
    level.scr_anim["missile_drone"][animindex] = script_model%vm_ks_gunship_smartphone1_intro;
    animindex = "intro_tablet";
    level.scr_anim["missile_drone"][animindex] = script_model%vm_ks_gunship_tablet1_intro;
    animindex = "intro_binder";
    level.scr_anim["missile_drone"][animindex] = script_model%vm_ks_gunship_binder_intro;
    animindex = "intro_joystick";
    level.scr_anim["missile_drone"][animindex] = script_model%vm_ks_gunship_joystick_intro;
    animindex = "outro_gunner";
    level.scr_anim["missile_drone"][animindex] = script_model%vm_ks_gunship_player_outro;
    animindex = "outro_co_gunner";
    level.scr_anim["missile_drone"][animindex] = script_model%wm_ks_gunship_pilot2_outro;
    animindex = "outro_desk";
    level.scr_anim["missile_drone"][animindex] = script_model%vm_ks_gunship_desk_outro;
    animindex = "outro_clipboard_1";
    level.scr_anim["missile_drone"][animindex] = script_model%vm_ks_gunship_clipboard1_outro;
    animindex = "outro_clipboard_2";
    level.scr_anim["missile_drone"][animindex] = script_model%vm_ks_gunship_clipboard2_outro;
    animindex = "outro_paper";
    level.scr_anim["missile_drone"][animindex] = script_model%vm_ks_gunship_paper1_outro;
    animindex = "outro_pen_1";
    level.scr_anim["missile_drone"][animindex] = script_model%vm_ks_gunship_pen1_outro;
    animindex = "outro_pen_2";
    level.scr_anim["missile_drone"][animindex] = script_model%vm_ks_gunship_pen2_outro;
    animindex = "outro_smartphone";
    level.scr_anim["missile_drone"][animindex] = script_model%vm_ks_gunship_smartphone1_outro;
    animindex = "outro_tablet";
    level.scr_anim["missile_drone"][animindex] = script_model%vm_ks_gunship_tablet1_outro;
    animindex = "outro_binder";
    level.scr_anim["missile_drone"][animindex] = script_model%vm_ks_gunship_binder_outro;
    animindex = "outro_joystick";
    level.scr_anim["missile_drone"][animindex] = script_model%vm_ks_gunship_joystick_outro;
    animindex = "outro_gunship_death";
    level.scr_anim["missile_drone"][animindex] = script_model%mp_acharlie130_death;
    foreach (animindex, scr_anim in level.scr_anim["missile_drone"]) {
        level.var_539e9dc23256f26d["missile_drone"][animindex] = function_52351c3338da63f4("missile_drone", animindex);
    }
    bundle = level.streakglobals.streakbundles["missile_drone"];
    level.var_a0549a6c6ac1f437 = [];
    level.var_a0549a6c6ac1f437["missile_drone_exterior"] = bundle.var_73f887915f8a78c3;
    level.var_a0549a6c6ac1f437["gunner"] = "body_sp_ally_sensor_operator_vm_1_1_noface";
    level.var_a0549a6c6ac1f437["co_gunner"] = "fullbody_sp_ally_sensor_operator_wm_1_1";
    level.var_a0549a6c6ac1f437["desk"] = "misc_gunship_interior_desk";
    level.var_a0549a6c6ac1f437["clipboard_1"] = "misc_un_office_clipboard_01";
    level.var_a0549a6c6ac1f437["clipboard_2"] = "misc_un_office_clipboard_01";
    level.var_a0549a6c6ac1f437["paper"] = "misc_un_office_paper_01";
    level.var_a0549a6c6ac1f437["pen_1"] = "misc_un_office_pen_01";
    level.var_a0549a6c6ac1f437["pen_2"] = "misc_un_office_pen_01";
    level.var_a0549a6c6ac1f437["smartphone"] = "offhand1h_smartphone_static_v0";
    level.var_a0549a6c6ac1f437["tablet"] = "offhand2h_tablet_static_v0";
    level.var_a0549a6c6ac1f437["binder"] = "misc_un_office_binder_open";
    level.var_a0549a6c6ac1f437["joystick"] = "misc_gunship_interior_joystick";
    level.var_5b9861f19d4aa681 = getdvarint(@"hash_504246b3cc306ce3", 0);
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24dd
// Size: 0x1d3
function function_a108cf47f68d34cc() {
    game["dialog"]["missile_drone" + "_use"] = "killstreak_remote_operator" + "_request_response";
    game["dialog"]["missile_drone" + "_leave"] = "killstreak_remote_operator" + "_leave";
    game["dialog"]["missile_drone" + "_engage"] = "killstreak_remote_operator" + "_engage";
    game["dialog"]["missile_drone" + "_random_radio"] = "killstreak_remote_operator" + "_radio_chatter";
    game["dialog"]["missile_drone" + "_flares"] = "killstreak_remote_operator" + "_flare_release";
    game["dialog"]["missile_drone" + "_light_damage"] = "killstreak_remote_operator" + "_light_damage";
    game["dialog"]["missile_drone" + "_med_damage"] = "killstreak_remote_operator" + "_med_damage";
    game["dialog"]["missile_drone" + "_heavy_damage"] = "killstreak_remote_operator" + "_heavy_damage";
    game["dialog"]["missile_drone" + "_lockedon"] = "killstreak_remote_operator" + "_missile_lock_warning";
    game["dialog"]["missile_drone" + "_crash"] = "killstreak_remote_operator" + "_crash";
    game["dialog"]["missile_drone" + "_hit_target"] = "killstreak_remote_operator" + "_hit_target";
    game["dialog"]["missile_drone" + "_miss_target"] = "killstreak_remote_operator" + "_miss_target";
    game["dialog"]["missile_drone" + "_spotted_single_target"] = "killstreak_remote_operator" + "_target_spotted_single";
    game["dialog"]["missile_drone" + "_spotted_multi_target"] = "killstreak_remote_operator" + "_miss_target";
    game["dialog"]["missile_drone" + "_hellfire_reload"] = "killstreak_remote_operator" + "_hellfire_reload";
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26b8
// Size: 0x50
function function_a14fde47f6dc1839() {
    level._effect["clouds"] = loadfx("vfx/iw8_mp/killstreak/vfx_ac130_view_clouds.vfx");
    level._effect["gunship_flares"] = loadfx("vfx/iw8_mp/killstreak/vfx_ac130_flares.vfx");
    level._effect["camera_spotlight"] = loadfx("vfx/iw8_mp/killstreak/vfx_ac130_ir_spotlight.vfx");
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2710
// Size: 0x77
function function_31303a706f015e() {
    if (isdefined(level.var_c5517afe5895d28d)) {
        function_c0b0a582ff9e4d57(level.var_c5517afe5895d28d);
    }
    bundle = level.streakglobals.streakbundles["missile_drone"];
    function_c0b0a582ff9e4d57("gunship_color_mp");
    function_c0b0a582ff9e4d57("gunship_color_fog_mp");
    function_c0b0a582ff9e4d57("gunship_hellfire_crt", 0.1, 0.2, 0.5);
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x278f
// Size: 0x22
function function_f8a7db702dbfd424(streakinfo) {
    streakinfo.owner setclientomnvar("ui_mobile_killstreak_is_deploying", 0);
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x27b9
// Size: 0x10c
function function_c02ec136b61774c7(streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    if (!isdefined(streakinfo)) {
        streakinfo = createstreakinfo("missile_drone", self);
    }
    self notify("using_remote");
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return 0;
        }
    }
    deployresult = scripts\cp_mp\killstreaks\killstreakdeploy::streakdeploy_doweapontabletdeploy(streakinfo, &function_62380ee42a08020c);
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
    result = function_8c158c00964032fb(self, streakinfo);
    if (!istrue(result)) {
        if (scripts\engine\utility::issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ scripts\engine\utility::getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/AIR_SPACE_TOO_CROWDED");
        }
        streakinfo notify("killstreak_finished_with_deploy_weapon");
        return 0;
    }
    utility::delaythread(1, &function_f8a7db702dbfd424, streakinfo);
    return result;
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x28ce
// Size: 0x70
function function_db39a901a1eb2961(owner, streakinfo) {
    level endon("game_ended");
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    owner endon("disconnect");
    if (issharedfuncdefined("killstreak", "allowRideKillstreakPlayerExit")) {
        self thread [[ getsharedfunc("killstreak", "allowRideKillstreakPlayerExit") ]]();
    }
    self waittill("killstreakExit");
    thread function_a524164379e50fcb(owner, streakinfo);
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2946
// Size: 0x5f7
function function_8c158c00964032fb(player, streakinfo) {
    level endon("game_ended");
    if (issharedfuncdefined("game", "disable_backpack_inventory")) {
        player [[ getsharedfunc("game", "disable_backpack_inventory") ]](1);
    }
    launchorigin = level.var_9d7c686bc04408b7;
    if (islargemap()) {
        if (level.gametype == "arm" || level.gametype == "conflict" || level.gametype == "gwtdm") {
            if (isdefined(level.hqmidpoint)) {
                launchorigin = level.hqmidpoint;
            } else if (isdefined(level.var_3a8876197cd8b5a)) {
                launchorigin = level.var_3a8876197cd8b5a;
            }
        } else {
            launchorigin = player.origin;
        }
    }
    var_5118005380cb1d91 = function_30d9d17051520c48(player, launchorigin);
    if (!isdefined(var_5118005380cb1d91)) {
        return false;
    }
    bundle = level.streakglobals.streakbundles["missile_drone"];
    var_8945c22a67231e20 = randomint(360);
    radiusoffset = 9000;
    zoffset = 6000;
    foreach (map in bundle.var_dcc338e6e046f73b) {
        if (issubstr(level.mapname, map.name)) {
            if (isdefined(map.var_7b9c0c070e919cad)) {
                radiusoffset = map.var_7b9c0c070e919cad;
            }
            if (isdefined(map.var_e3519eeae4ea6a0d)) {
                zoffset += map.var_e3519eeae4ea6a0d;
            }
            break;
        }
    }
    if (utility::iscp()) {
        player.start_position = player.origin;
        if (isdefined(level.var_9801e74c34ba0476)) {
            var_8945c22a67231e20 = level.var_9801e74c34ba0476;
        }
    }
    /#
        var_dcb306290be402aa = getdvarint(@"hash_2f3ae2569a0dee58", 0);
        zoffset += var_dcb306290be402aa;
        radiusoffsetoverride = getdvarint(@"hash_2914c9ca6529eeb5", 0);
        if (radiusoffsetoverride != 0) {
            radiusoffset = radiusoffsetoverride;
        }
        zoffsetoverride = getdvarint(@"hash_8d62398cbb806fe7", 0);
        if (zoffsetoverride != 0) {
            zoffset = 6000 + zoffsetoverride;
        }
    #/
    xoffset = cos(var_8945c22a67231e20) * radiusoffset;
    yoffset = sin(var_8945c22a67231e20) * radiusoffset;
    var_78ac3c5ef5263d4f = vectornormalize((xoffset, yoffset, zoffset));
    var_78ac3c5ef5263d4f *= zoffset;
    level.var_ebed708841f09623 = 1;
    missileDroneIntro = function_6d7d875b0d6d2608(player, streakinfo, var_8945c22a67231e20, var_78ac3c5ef5263d4f, var_5118005380cb1d91);
    if (!isdefined(missileDroneIntro)) {
        level.var_ebed708841f09623 = 0;
        return false;
    }
    missiledrone = function_81736201e5e2e11b(player, streakinfo, var_8945c22a67231e20, var_78ac3c5ef5263d4f, missileDroneIntro, var_5118005380cb1d91);
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        missiledrone [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_a97a45c5bcdf7177);
    }
    if (!isdefined(missiledrone)) {
        level.var_ebed708841f09623 = 0;
        return false;
    }
    if (utility::iscp()) {
        level.missiledrone = missiledrone;
        level.missiledrone.var_e173900642ce57f = bundle.var_483b0b941a89a454;
    }
    if (issharedfuncdefined("hud", "teamPlayerCardSplash")) {
        thread [[ getsharedfunc("hud", "teamPlayerCardSplash") ]]("used_missile_drone", player);
    }
    if (getdvarint(@"camera_thirdPerson")) {
        if (issharedfuncdefined("player", "setThirdPersonDOF")) {
            player [[ getsharedfunc("player", "setThirdPersonDOF") ]](0);
        }
    }
    if (issharedfuncdefined("killstreak", "addToActiveKillstreakList")) {
        missiledrone [[ getsharedfunc("killstreak", "addToActiveKillstreakList") ]](missiledrone.streakinfo.streakname, "Killstreak_Air", player);
    }
    setlockedoncallback(missiledrone, &function_4303ddf58d0b4c9c);
    setlockedonremovedcallback(missiledrone, &function_7d7d3fc47e51dcf2);
    missiledrone thread function_9606c15566d61486(player);
    missiledrone thread function_17184b70f0bb1fd0(player);
    missiledrone thread function_8f9ac2ebbb4f7815(player);
    missiledrone thread function_6f740ebda17653c2(player);
    missiledrone thread function_abe9d1a8f9f94dd6(player);
    missiledrone thread function_cc8a7a4a6e6336a(player, streakinfo);
    missiledrone thread function_805dc4b378be50a2(player, streakinfo);
    missiledrone thread function_8aa94ec41c3e88cc(player);
    missiledrone thread function_2c910042f77e1aa5(player);
    missiledrone thread function_f655625d476b6a88(player, "disconnect", streakinfo);
    missiledrone thread function_f655625d476b6a88(player, "joined_team", streakinfo);
    missiledrone thread function_f655625d476b6a88(player, "joined_spectators", streakinfo);
    missiledrone thread function_f655625d476b6a88(player, "team_kill_punish", streakinfo);
    missiledrone thread function_f655625d476b6a88(player, "player_fatal_death", streakinfo);
    missiledrone thread function_10f1246952e7502e(player);
    missiledrone thread function_9897e70f93923dcf();
    missiledrone thread function_db39a901a1eb2961(player, streakinfo);
    missiledrone thread function_ff57916d5a301e2c(player);
    missiledrone thread function_64a14223afd3adcb(player);
    missiledrone thread function_b9ab0154dac4fa55(player);
    /#
        thirdpersoncam = getdvarint(@"hash_2af3c80dd9b7877c", 0);
        if (thirdpersoncam) {
            missiledrone thread function_a7ae61ca6cbcb70a();
            missiledrone thread function_86d2c07ecf9891c8(var_5118005380cb1d91);
        }
    #/
    if (issharedfuncdefined("flares", "handleIncomingStinger")) {
        missiledrone thread [[ getsharedfunc("flares", "handleIncomingStinger") ]](&function_531405487af921f1);
    }
    missiledrone playloopsound("kls_jup_missile_drone_lp_close");
    missiledrone setscriptablepartstate("camera_engine_lp", "on");
    if (istrue(player.ksempd)) {
        missiledrone thread function_e5c3f1d81fd3f22f(player);
    }
    return true;
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2f46
// Size: 0xe6
function function_30d9d17051520c48(owner, launchorigin) {
    var_894a1909efd041cb = undefined;
    if (!islargemap()) {
        if (isdefined(level.var_be36c8da670087a8) && level.var_be36c8da670087a8.size > 0) {
            var_894a1909efd041cb = level.var_be36c8da670087a8[0];
        }
    } else if (isdefined(level.var_be36c8da670087a8) && level.var_be36c8da670087a8.size >= 1) {
        return undefined;
    }
    if (!isdefined(var_894a1909efd041cb)) {
        var_894a1909efd041cb = spawn("script_model", launchorigin);
        var_894a1909efd041cb setmodel("tag_origin");
        var_894a1909efd041cb.angles = (0, 115, 0);
        var_894a1909efd041cb hide();
        level.var_be36c8da670087a8[level.var_be36c8da670087a8.size] = var_894a1909efd041cb;
        var_894a1909efd041cb thread function_354ec367a597df9b();
        if (!islargemap()) {
            var_894a1909efd041cb thread function_a69bf71155feb4e();
        }
    }
    return var_894a1909efd041cb;
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3035
// Size: 0x3b
function function_4303ddf58d0b4c9c() {
    playkillstreakoperatordialog("missile_drone", "missile_drone" + "_lockedon", 1, undefined, "pilot");
    scripts\cp_mp\utility\vehicle_omnvar_utility::vehomn_showwarning("missileLocking", self.owner, "killstreak");
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3078
// Size: 0x1c
function function_7d7d3fc47e51dcf2() {
    scripts\cp_mp\utility\vehicle_omnvar_utility::vehomn_hidewarning("missileLocking", self.owner, "killstreak");
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x309c
// Size: 0x133
function function_6d7d875b0d6d2608(player, streakinfo, angle, anglevector, var_5118005380cb1d91) {
    player endon("disconnect");
    level endon("game_ended");
    thirdpersoncam = 0;
    /#
        thirdpersoncam = getdvarint(@"hash_2af3c80dd9b7877c", 0);
        if (thirdpersoncam) {
            streakinfo notify("<dev string:x1c>");
        }
    #/
    streakinfo endon("killstreak_finished_with_deploy_weapon");
    player disablephysicaldepthoffieldscripting();
    player function_2a0298fbe5f18722(0);
    player setsoundsubmix("jup_kls_missile_drone");
    if (!thirdpersoncam) {
        player _stopshellshock();
        player val::group_set("missileDroneIntro", 0);
    }
    missileDroneIntro = undefined;
    bundle = level.streakglobals.streakbundles["missile_drone"];
    /#
        level.var_5b9861f19d4aa681 = getdvarint(@"hash_504246b3cc306ce3", 0);
    #/
    missileDroneIntro = spawnstruct();
    missileDroneIntro.owner = player;
    missileDroneIntro notify("missile_drone_end_intro");
    if (!thirdpersoncam) {
        player disablephysicaldepthoffieldscripting();
        _stopshellshock();
        player val::group_reset("missileDroneIntro");
    }
    return missileDroneIntro;
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x31d8
// Size: 0x5e
function function_3bafd58eb00dd62f(action, streakinfo) {
    self endon("death");
    self endon("missile_drone_end_intro");
    level endon("game_ended");
    var_fa643f00a940e086 = self.owner;
    var_fa643f00a940e086 waittill(action);
    if (action == "disconnect") {
        level.var_ebed708841f09623 = 0;
    }
    function_38f7b42a53263e60(var_fa643f00a940e086, streakinfo);
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x323e
// Size: 0xcd
function function_38f7b42a53263e60(owner, streakinfo) {
    thirdpersoncam = 0;
    /#
        thirdpersoncam = getdvarint(@"hash_2af3c80dd9b7877c", 0);
    #/
    if (isdefined(owner) && !thirdpersoncam) {
        owner cameraunlink();
        owner _stopshellshock();
        owner disablephysicaldepthoffieldscripting();
        owner val::group_reset("missileDroneIntro");
        owner _setvisibiilityomnvarforkillstreak(streakinfo.streakname, "off");
        owner setclientomnvar("ui_missile_drone_hud", 0);
        owner painvisionon();
        owner killstreak_restorenvgstate();
        owner killstreak_setMainVision("");
        owner function_8b676f496920e2ab();
        owner notify("detach_missile_drone_intro");
        level thread scripts\cp_mp\utility\game_utility::fadetoblackforplayer(owner, 0);
    }
    streakinfo notify("killstreak_finished_with_deploy_weapon");
    function_be60e349949d9e87(self);
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3313
// Size: 0x3d
function function_db2de60186f3a10b(owner) {
    self endon("death");
    owner endon("disconnect");
    while (true) {
        player = level waittill("connected");
        self hidefromplayer(player);
    }
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3358
// Size: 0x139
function function_9a5d614fcfd652b(animlength, owner, introsequence) {
    self endon("death");
    owner endon("disconnect");
    owner endon("detach_missile_drone_intro");
    owner enablephysicaldepthoffieldscripting();
    if (isdefined(introsequence)) {
        if (introsequence == "intro_missile_drone_exterior") {
            owner setphysicaldepthoffield(1.4, 87, 10, 10);
            phase1dof = animlength * 0.25;
            phase2dof = animlength * 0.65;
            thread function_b302a1a5a4bbea3b(owner, phase1dof, 2.2, 87, 50, 50);
            thread function_b302a1a5a4bbea3b(owner, phase2dof, 4, 350, 1, 1);
            return;
        }
        if (introsequence == "intro") {
            owner setphysicaldepthoffield(1.4, 21, 1000, 1000);
            phase1dof = animlength * 0.8;
            thread function_b302a1a5a4bbea3b(owner, phase1dof, 1.4, 43, 50, 50);
            return;
        }
        owner setphysicaldepthoffield(1.4, 43, 1000, 1000);
        phase1dof = animlength * 0.5;
        phase2dof = animlength * 0.7;
        thread function_b302a1a5a4bbea3b(owner, phase1dof, 1.4, 20, 50, 50);
        thread function_b302a1a5a4bbea3b(owner, phase2dof, 3, 100, 50, 50);
    }
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x3499
// Size: 0x55
function function_b302a1a5a4bbea3b(owner, delaytime, fstop, focusdistance, focusspeed, var_5587778bb9d6e798) {
    self endon("death");
    owner endon("disconnect");
    owner endon("detach_missile_drone_intro");
    wait delaytime;
    owner setphysicaldepthoffield(fstop, focusdistance, focusspeed, var_5587778bb9d6e798);
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x34f6
// Size: 0xe3
function function_1c58d316ba362c44(animlength, owner, introsequence) {
    self endon("death");
    owner endon("disconnect");
    owner endon("detach_missile_drone_intro");
    animtime = animlength;
    eqscale = 0.45;
    shaketime = 0.05;
    if (isdefined(introsequence)) {
        if (introsequence == "intro_missile_drone_exterior") {
            eqscale = 0.01;
            shaketime = 0.25;
        }
    }
    while (animtime > 0) {
        owner earthquakeforplayer(eqscale, shaketime, self.origin, 5000);
        if (isdefined(introsequence)) {
            if (introsequence == "intro_missile_drone_exterior") {
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

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x35e1
// Size: 0x60
function function_7aa4f7c9f7b0880f(animlength, owner) {
    self endon("death");
    owner endon("disconnect");
    owner endon("detach_missile_drone_intro");
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(animlength - 0.2);
    owner killstreak_setMainVision("killstreak_slamzoom");
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(0.1);
    level thread scripts\cp_mp\utility\game_utility::fadetoblackforplayer(owner, 1, 0.1);
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3649
// Size: 0x48
function function_131a8cac896bb430(owner) {
    owner endon("disconnect");
    level endon("game_ended");
    level thread scripts\cp_mp\utility\game_utility::fadetoblackforplayer(owner, 1, 0.2);
    wait 0.2;
    level thread scripts\cp_mp\utility\game_utility::fadetoblackforplayer(owner, 0, 0.2);
    self notify("missileDrone_fadeScreenComplete");
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3699
// Size: 0x2f6
function function_cf067ca1169bed53(player, crashing) {
    level callback::callback("killstreak_finish_use", {#streakinfo:self.streakinfo});
    if (isdefined(player)) {
        player endon("disconnect");
        thirdpersoncam = 0;
        /#
            thirdpersoncam = getdvarint(@"hash_2af3c80dd9b7877c", 0);
        #/
        if (!thirdpersoncam) {
            player _stopshellshock();
        }
        player setclientomnvar("ui_killstreak_thermal_mode", 0);
        player setthermalvision(0);
        player _setvisibiilityomnvarforkillstreak(self.streakinfo.streakname, "off");
        player setclientomnvar("ui_missile_drone_hud", 0);
        player stoplocalsound("kls_jup_missile_drone_105mm_mp_reload");
        player stoploopsound();
        player killstreak_setMainVision("");
        player clearclienttriggeraudiozone(0.5);
        player painvisionon();
        player _stopshellshock();
        player clearsoundsubmix("jup_kls_missile_drone");
        player clearcinematicmotionoverride();
        if (issharedfuncdefined("game", "disable_backpack_inventory")) {
            player [[ getsharedfunc("game", "disable_backpack_inventory") ]](0);
        }
        player val::reset("missile_drone_weap_swap_safety", "weapon_switch");
        player thread function_131a8cac896bb430(player);
        player waittill("missileDrone_fadeScreenComplete");
        player notify("returning_killstreak_player");
        player.var_2bd14eb14d3e8f41 = undefined;
        if (getdvarint(@"camera_thirdPerson")) {
            if (issharedfuncdefined("player", "setThirdPersonDOF")) {
                player [[ getsharedfunc("player", "setThirdPersonDOF") ]](1);
            }
        }
        if (isdefined(player.var_75324e1b7130d2e4)) {
            player.var_75324e1b7130d2e4 delete();
        }
        if (!thirdpersoncam) {
            if (player scripts\cp_mp\utility\player_utility::_isalive()) {
                player _giveweapon(level.var_7b7eec26880df4cc);
                player _switchtoweaponimmediate(level.var_7b7eec26880df4cc);
            }
            player unlink();
            if (istrue(crashing) && level.var_5b9861f19d4aa681 == 0) {
                player killstreak_setMainVision("killstreak_static");
                wait 1;
                player cameraunlink();
                player killstreak_setMainVision("");
            }
            player val::group_reset("missileDroneUse");
            player function_2a0298fbe5f18722(1);
            player function_8b676f496920e2ab();
            player killstreak_restorenvgstate();
            player thread function_b9abd8c489937d57(self.streakinfo);
        } else {
            /#
                self.streakinfo notify("<dev string:x1c>");
            #/
        }
    }
    function_be60e349949d9e87(self.missileDroneIntro);
    function_7d7d3fc47e51dcf2();
    if (isdefined(self.enemytargetmarkergroup)) {
        scripts\cp_mp\targetmarkergroups::targetmarkergroup_off(self.enemytargetmarkergroup);
    }
    if (isdefined(self.friendlytargetmarkergroup)) {
        scripts\cp_mp\targetmarkergroups::targetmarkergroup_off(self.friendlytargetmarkergroup);
    }
    if (issharedfuncdefined("gunship", "br_respawn")) {
        [[ getsharedfunc("gunship", "br_respawn") ]](player);
    }
    level.var_ebed708841f09623 = 0;
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3997
// Size: 0x100
function function_b9abd8c489937d57(streakinfo) {
    self endon("disconnect");
    streakinfo notify("killstreak_finished_with_deploy_weapon");
    var_263d5a6c4338e56c = getanimlength(script_model%vm_ks_tablet_drop);
    bundle = level.streakglobals.streakbundles["missile_drone"];
    if (_isalive()) {
        val::set("missileDroneExit", "fire", 0);
        val::set("missileDroneExit", "allow_movement", 0);
        val::set("missileDroneExit", "offhand_weapons", 0);
        val::set("missileDroneExit", "mantle", 0);
        val::set("missileDroneExit", "melee", 0);
        wait 0.05;
        _switchtoweapon(self.lastdroppableweaponobj);
        wait var_263d5a6c4338e56c;
        _takeweapon(bundle.var_483b0b941a89a454);
        _takeweapon(level.var_7b7eec26880df4cc);
        val::reset_all("missileDroneExit");
    }
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a9f
// Size: 0x4ca
function function_abe9d1a8f9f94dd6(gunner) {
    self endon("death");
    self endon("crashing");
    level endon("game_ended");
    self.damagetaken = 0;
    self.attractor = missile_createattractorent(self, 1000, 4096);
    bundle = level.streakglobals.streakbundles["missile_drone"];
    while (true) {
        damage, attacker, direction_vec, point, smeansofdeath, modelname, tagname, partname, idflags, objweapon = self waittill("damage");
        thirdpersoncam = undefined;
        debugdamage = undefined;
        /#
            thirdpersoncam = getdvarint(@"hash_2af3c80dd9b7877c", 0);
            debugdamage = istrue(self.debugdamage);
        #/
        if (isdefined(level.teambased) && isplayer(attacker) && attacker.team == self.team && (!isdefined(thirdpersoncam) || !thirdpersoncam) && (!isdefined(debugdamage) || !debugdamage)) {
            continue;
        }
        if (smeansofdeath == "MOD_RIFLE_BULLET" || smeansofdeath == "MOD_PISTOL_BULLET" || smeansofdeath == "MOD_EXPLOSIVE_BULLET") {
            continue;
        }
        if (isdefined(gunner) && gunner function_37aa153b0366cc11()) {
            var_bb22d61320ffe92d = "light";
            if (isexplosivedamagemod(smeansofdeath)) {
                if (ceil(damage / self.maxhealth) >= bundle.var_49ad84fa2780082a) {
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
            thread function_e5c3f1d81fd3f22f(gunner);
        }
    }
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f71
// Size: 0x7d
function function_bf8fd9a25ca54d8a() {
    self setscriptablepartstate("body_damage_light", "on");
    gunner = self.owner;
    if (isdefined(gunner) && gunner function_37aa153b0366cc11()) {
        self.flashlight setscriptablepartstate("camera_damage_light", "on");
        gunner playkillstreakoperatordialog("missile_drone", "missile_drone" + "_light_damage", 1, undefined, "pilot");
        gunner playlocalsound("kls_jup_missile_drone_damage_light");
    }
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ff6
// Size: 0x90
function function_5673c34db51b275f() {
    self setscriptablepartstate("body_damage_light", "off");
    self setscriptablepartstate("body_damage_medium", "on");
    gunner = self.owner;
    if (isdefined(gunner) && gunner function_37aa153b0366cc11()) {
        self.flashlight setscriptablepartstate("camera_damage_medium", "on");
        gunner playkillstreakoperatordialog("missile_drone", "missile_drone" + "_med_damage", 1, undefined, "pilot");
        gunner setclienttriggeraudiozone("gunship_killstreak_damaged", 2);
    }
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x408e
// Size: 0x8a
function function_203aef5b54babd0f() {
    self setscriptablepartstate("body_damage_medium", "off");
    self setscriptablepartstate("contrails", "off");
    thread function_93a48e1984430560();
    gunner = self.owner;
    if (isdefined(gunner) && gunner function_37aa153b0366cc11()) {
        self.flashlight setscriptablepartstate("camera_damage_heavy", "on");
        gunner playkillstreakoperatordialog("missile_drone", "missile_drone" + "_heavy_damage", 1, undefined, "pilot");
    }
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4120
// Size: 0x2b
function function_93a48e1984430560() {
    level endon("game_ended");
    self setscriptablepartstate("engine_blowout", "on");
    self setscriptablepartstate("body_damage_heavy", "on");
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4153
// Size: 0x49
function function_cc8a7a4a6e6336a(gunner, streakinfo) {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    level endon("game_ended");
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(self.timeout);
    thread function_a524164379e50fcb(gunner, streakinfo);
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x41a4
// Size: 0x44
function function_805dc4b378be50a2(gunner, streakinfo) {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    level waittill_any_2("start_game_ended", "game_ended");
    thread function_a524164379e50fcb(gunner, streakinfo);
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x41f0
// Size: 0xfa
function function_a524164379e50fcb(gunner, streakinfo) {
    self endon("death");
    self endon("crashing");
    level endon("game_ended");
    self notify("leaving");
    self unlink();
    self rotateroll(30, 3);
    currentangles = self.angles;
    currentdir = anglestoforward(currentangles);
    self playsoundonmovingent("kls_jup_missile_drone_exit");
    if (isdefined(self.owner)) {
        self.owner playkillstreakoperatordialog("missile_drone", "missile_drone" + "_leave", 1, undefined, "pilot");
    }
    thread function_cf067ca1169bed53(gunner);
    self moveto(self.origin + currentdir * 50000, 10, 5);
    self.owner scripts\cp_mp\utility\killstreak_utility::recordkillstreakendstats(streakinfo);
    function_4350b2bdabf0cce2(self.origin + currentdir * 50000);
    function_389bbae7183fba66(0);
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x42f2
// Size: 0x23
function function_4350b2bdabf0cce2(destination) {
    while (isdefined(self) && self.origin != destination) {
        waitframe();
    }
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x431d
// Size: 0x5b
function function_f655625d476b6a88(gunner, var_304d14a0f176d5c3, streakinfo) {
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    level endon("game_ended");
    gunner waittill(var_304d14a0f176d5c3);
    if (var_304d14a0f176d5c3 == "player_fatal_death") {
        thread function_a524164379e50fcb(gunner, streakinfo);
        return;
    }
    thread function_e5c3f1d81fd3f22f(gunner);
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4380
// Size: 0x5c
function function_10f1246952e7502e(gunner) {
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    gunner endon("disconnect");
    level waittill("game_ended");
    gunner _setvisibiilityomnvarforkillstreak(self.streakinfo.streakname, "off");
    gunner setclientomnvar("ui_missile_drone_hud", 0);
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x43e4
// Size: 0x87
function function_ff57916d5a301e2c(gunner) {
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

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x4473
// Size: 0x373
function function_81736201e5e2e11b(owner, streakinfo, angle, anglevector, missileDroneIntro, var_5118005380cb1d91) {
    bundle = level.streakglobals.streakbundles["missile_drone"];
    missiledrone = spawn("script_model", var_5118005380cb1d91.origin);
    missiledrone setmodel(bundle.var_26c20e191809651b);
    missiledrone setcandamage(1);
    missiledrone.currenthealth = bundle.maxhealth;
    missiledrone.maxhealth = missiledrone.currenthealth;
    missiledrone.health = 99999;
    missiledrone.owner = owner;
    missiledrone.team = owner.team;
    missiledrone.missileDroneIntro = missileDroneIntro;
    missiledrone.var_5118005380cb1d91 = var_5118005380cb1d91;
    missiledrone.ispiloted = 1;
    missiledrone.timeout = bundle.var_add70aea96644ae7;
    if (issharedfuncdefined("gunship", "attachXRays")) {
        missiledrone = [[ getsharedfunc("gunship", "attachXRays") ]](missiledrone);
    }
    missiledrone.hellfireloaded = 1;
    hellfiretarget = spawn("script_model", missiledrone.origin);
    hellfiretarget setmodel("ks_missile_drone_laser_mp");
    missiledrone.hellfiretarget = hellfiretarget;
    missiledrone.hellfiretarget setscriptablepartstate("marker_placed", "onEveryone", 0);
    missiledrone.hellfiretarget hide();
    if (islargemap()) {
        var_5118005380cb1d91 thread function_399152c6672be76a(missiledrone);
    }
    missiledrone scripts\mp\sentientpoolmanager::registersentient("Killstreak_Air", owner, undefined, undefined, 1, 0);
    missiledrone function_cfc5e3633ef950fd(1, bundle.var_42c4a1be2caceedb, &function_bf8fd9a25ca54d8a);
    missiledrone function_cfc5e3633ef950fd(2, bundle.var_9eb58f77ff18a79c, &function_5673c34db51b275f);
    missiledrone function_cfc5e3633ef950fd(3, bundle.var_dd995975f3fa81d, &function_203aef5b54babd0f);
    /#
        timeoutoverride = getdvarint(@"hash_9408f57f293556f8", bundle.var_add70aea96644ae7);
        var_2a98d1683cf44153 = getdvarint(@"hash_2c01d701bac5d9d3", 0);
        if (var_2a98d1683cf44153) {
            timeoutoverride = 9999;
        }
        missiledrone.timeout = timeoutoverride;
    #/
    if (isdefined(level.var_947707feadbc74fe)) {
        missiledrone.timeout = level.var_947707feadbc74fe;
    }
    missiledrone.flaresreservecount = bundle.var_85e1658276ce35e8;
    missiledrone.streakinfo = streakinfo;
    missiledrone scriptmoveroutline();
    missiledrone scriptmoverthermal();
    missiledrone setotherent(owner);
    minimapid = undefined;
    if (scripts\engine\utility::issharedfuncdefined("game", "createObjective")) {
        minimapid = missiledrone [[ scripts\engine\utility::getsharedfunc("game", "createObjective") ]]("jup_hud_icon_minimap_killstreak_missile_drone", missiledrone.team, 0, 1, 1);
    }
    missiledrone.minimapid = minimapid;
    missiledrone linkto(var_5118005380cb1d91, "tag_origin", anglevector, (0, angle + 90, -30));
    level notify("matchrecording_plane", missiledrone);
    return missiledrone;
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x47ef
// Size: 0x4f
function function_970fae719e73bb11(plane) {
    plane endon("death");
    plane endon("crashing");
    plane endon("leaving");
    self endon("disconnect");
    level endon("game_ended");
    wait 0.05;
    thread function_83970e7a3032f374(plane);
    thread function_39246ee5f77f5891(plane);
    thread function_6d0704818ddf4f84(plane);
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4846
// Size: 0x98
function function_83970e7a3032f374(plane) {
    plane endon("death");
    plane endon("crashing");
    plane endon("leaving");
    self endon("disconnect");
    level endon("game_ended");
    while (true) {
        self setclientomnvar("ui_missile_drone_coord1_posx", int(plane.origin[0]));
        self setclientomnvar("ui_missile_drone_coord1_posy", int(plane.origin[1]));
        self setclientomnvar("ui_missile_drone_coord1_posz", int(plane.origin[2]));
        wait 0.5;
    }
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x48e6
// Size: 0x85
function function_39246ee5f77f5891(plane) {
    plane endon("death");
    plane endon("crashing");
    plane endon("leaving");
    self endon("disconnect");
    level endon("game_ended");
    waitframe();
    self setclientomnvar("ui_missile_drone_coord2_posx", int(self.origin[0]));
    self setclientomnvar("ui_missile_drone_coord2_posy", int(self.origin[1]));
    self setclientomnvar("ui_missile_drone_coord2_posz", int(self.origin[2]));
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4973
// Size: 0xb8
function function_6d0704818ddf4f84(plane) {
    plane endon("death");
    plane endon("crashing");
    plane endon("leaving");
    self endon("disconnect");
    level endon("game_ended");
    while (true) {
        starttrace = self getvieworigin();
        endtrace = starttrace + anglestoforward(self getplayerangles()) * 15000;
        endpos = physicstrace(starttrace, endtrace);
        self setclientomnvar("ui_missile_drone_coord3_posx", int(endpos[0]));
        self setclientomnvar("ui_missile_drone_coord3_posy", int(endpos[1]));
        self setclientomnvar("ui_missile_drone_coord3_posz", int(endpos[2]));
        wait 0.1;
    }
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a33
// Size: 0xbb
function function_354ec367a597df9b() {
    self endon("death");
    var_25bb708a7d591131 = 10;
    rotatetime = level.var_49c7b401bdf0c0af["rotate"] / 360 * var_25bb708a7d591131;
    self rotateyaw(self.angles[2] + var_25bb708a7d591131, rotatetime, rotatetime, 0);
    degreespersecond = 360 / level.var_49c7b401bdf0c0af["rotate"];
    var_31fc5244269dae18 = degreespersecond * 0.0174533;
    level.var_b6134f835a919c22 = var_31fc5244269dae18 * 9000;
    while (true) {
        self rotateyaw(360, level.var_49c7b401bdf0c0af["rotate"]);
        wait level.var_49c7b401bdf0c0af["rotate"];
    }
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4af6
// Size: 0x459
function function_9606c15566d61486(gunner) {
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    gunner killstreak_setMainVision("");
    /#
        thirdpersoncam = getdvarint(@"hash_2af3c80dd9b7877c", 0);
        if (thirdpersoncam) {
            if (level.var_5b9861f19d4aa681 == 1) {
                function_be60e349949d9e87(self.missileDroneIntro);
            } else {
                gunner function_20836c46516ad037(self.missileDroneIntro);
            }
            self.streakinfo notify("<dev string:x1c>");
            return;
        }
    #/
    bundle = level.streakglobals.streakbundles["missile_drone"];
    gunner _giveweapon(bundle.var_483b0b941a89a454);
    gunner _switchtoweaponimmediate(bundle.var_483b0b941a89a454);
    gunner val::set("missile_drone_weap_swap_safety", "weapon_switch", 0);
    if (isdefined(level.var_c5517afe5895d28d)) {
        self.currentvisionset = level.var_c5517afe5895d28d;
    } else {
        self.currentvisionset = "gunship_color_mp";
        if (isdefined(level.mapname) && (issubstr(level.mapname, "_shipment") || issubstr(level.mapname, "mp_skerries"))) {
            self.currentvisionset = "gunship_color_fog_mp";
        }
    }
    waitframe();
    gunner cameraunlink();
    if (level.var_5b9861f19d4aa681 == 1) {
        function_be60e349949d9e87(self.missileDroneIntro);
    } else {
        gunner function_20836c46516ad037(self.missileDroneIntro);
    }
    var_c5f1da4a2dfcdcb0 = self gettagorigin("tag_player") - (0, 0, 5);
    self.camera = spawn("script_model", var_c5f1da4a2dfcdcb0);
    self.camera setmodel("tag_player");
    self.camera.angles = vectortoangles(self.var_5118005380cb1d91.origin - self.camera.origin);
    self.camera linkto(self);
    if (isbot(gunner)) {
        gunner cameralinkto(self.camera, "tag_player");
        return;
    }
    arcclamps = function_ad3e744a5b339fe4(bundle);
    gunner playkillstreakoperatordialog("missile_drone", "missile_drone" + "_engage", 1, undefined, "pilot");
    gunner.var_2bd14eb14d3e8f41 = 1;
    gunner playerlinkweaponviewtodelta(self.camera, "tag_player", 1, arcclamps[0], arcclamps[1], arcclamps[2], arcclamps[3], 0, 1, 1);
    gunner playerlinkedsetviewznear(0);
    gunner killstreak_setMainVision(self.currentvisionset);
    gunner setclienttriggeraudiozone("gunship_killstreak", 2);
    gunner setplayerangles(self.camera.angles);
    gunner val::set("missileDroneUse", "ads", 1);
    gunner setcinematicmotionoverride("player_gunship_ride_mp");
    gunner thread function_d13d2a81214fbfb8("65_instant_noscale");
    gunner _setvisibiilityomnvarforkillstreak(self.streakinfo.streakname, "on");
    gunner setclientomnvar("ui_missile_drone_hud", 1);
    gunner setclientomnvar("ui_killstreak_weapon_1_ammo", gunner getweaponammoclip(bundle.var_483b0b941a89a454));
    gunner setclientomnvar("ui_killstreak_countdown", gettime() + int(self.timeout * 1000));
    gunner setclientomnvar("ui_killstreak_health", self.maxhealth);
    gunner setclientomnvar("ui_killstreak_flares", self.flaresreservecount);
    gunner setclientomnvar("ui_killstreak_damage_state", 0);
    gunner _shellshock("killstreak_veh_camera_mp", "top", self.timeout, 0);
    gunner _stopshellshock();
    gunner val::group_set("missileDroneUse", 0);
    if (issharedfuncdefined("gunship", "assignTargetMarkers")) {
        self thread [[ getsharedfunc("gunship", "assignTargetMarkers") ]](gunner);
    }
    gunner thread function_970fae719e73bb11(self);
    thread function_ef631bb902b0143b(bundle.var_483b0b941a89a454);
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4f57
// Size: 0x1cd
function function_ad3e744a5b339fe4(bundle) {
    rightarcclamp = 60;
    leftarcclamp = 45;
    toparcclamp = 10;
    bottomarcclamp = 90;
    foreach (map in bundle.var_dcc338e6e046f73b) {
        if (issubstr(level.mapname, map.name)) {
            if (isdefined(map.var_efbf01c2a0e6da99)) {
                rightarcclamp = map.var_efbf01c2a0e6da99;
            }
            if (isdefined(map.var_5e455560773f279a)) {
                leftarcclamp = map.var_5e455560773f279a;
            }
            if (isdefined(map.var_6d639fd32cf63738)) {
                toparcclamp = map.var_6d639fd32cf63738;
            }
            if (isdefined(map.var_62f0dc4cf8c337c0)) {
                bottomarcclamp = map.var_62f0dc4cf8c337c0;
            }
            break;
        }
    }
    /#
        if (getdvarint(@"hash_981e8192bcbe37ff", -1) >= 0) {
            rightarcclamp = getdvarint(@"hash_981e8192bcbe37ff", -1);
        }
        if (getdvarint(@"hash_21d83c272dd28670", -1) >= 0) {
            leftarcclamp = getdvarint(@"hash_21d83c272dd28670", -1);
        }
        if (getdvarint(@"hash_afc0c9bb123f652c", -1) >= 0) {
            toparcclamp = getdvarint(@"hash_afc0c9bb123f652c", -1);
        }
        if (getdvarint(@"hash_6fb4c0869abb309e", -1) >= 0) {
            bottomarcclamp = getdvarint(@"hash_6fb4c0869abb309e", -1);
        }
    #/
    return [rightarcclamp, leftarcclamp, toparcclamp, bottomarcclamp];
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x512d
// Size: 0x5f
function function_17184b70f0bb1fd0(gunner) {
    gunner endon("disconnect");
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    level endon("game_ended");
    /#
        thirdpersoncam = getdvarint(@"hash_2af3c80dd9b7877c", 0);
        if (thirdpersoncam) {
            return;
        }
    #/
    gunner setclientomnvar("ui_killstreak_weapon", 3);
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5194
// Size: 0x15c
function function_8f9ac2ebbb4f7815(gunner) {
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    level endon("game_ended");
    /#
        thirdpersoncam = getdvarint(@"hash_2af3c80dd9b7877c", 0);
        if (thirdpersoncam) {
            return;
        }
    #/
    streakinfo = self.streakinfo;
    bundle = level.streakglobals.streakbundles["missile_drone"];
    while (true) {
        projectile = gunner waittill("missile_fire");
        self.hellfiretarget show();
        projectile.streakinfo = streakinfo;
        streakinfo.shots_fired++;
        weapon = gunner getcurrentweapon();
        currentammo = gunner getweaponammoclip(weapon);
        if (weapon.basename == bundle.var_483b0b941a89a454) {
            earthquake(0.2, 1, self.origin, 1000);
            gunner setclientomnvar("ui_killstreak_weapon_1_ammo", currentammo);
            projectile thread function_6e4f826f6f06f7f2(self, gunner);
        }
        projectile thread function_b16043b8aa64aa83(self, gunner, weapon.basename);
        if (currentammo == 0) {
            gunner thread function_80144ddd67d04fed(weapon, self);
        }
    }
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x52f8
// Size: 0xaa
function function_6e4f826f6f06f7f2(missiledrone, gunner) {
    missiledrone endon("death");
    missiledrone endon("leaving");
    missiledrone endon("crashing");
    gunner endon("disconnect");
    self endon("death");
    targetent = missiledrone.hellfiretarget;
    if (isdefined(gunner.missilelaunchertarget) && isdefined(gunner.missilelauncherstage) && gunner.missilelauncherstage == 2) {
        targetent = gunner.missilelaunchertarget;
        missiledrone notify("missile_drone_reset_hellfire_lockon");
    }
    self missile_settargetent(targetent);
    gunner waittill("gunship_hellfire_disable_tracking");
    self missile_cleartarget();
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x53aa
// Size: 0x3c
function function_6f740ebda17653c2(gunner) {
    if (!isai(gunner)) {
        gunner thread watchthermalinputchange();
    }
    function_c34bf26ae4a7084f(gunner);
    if (isdefined(gunner) && !isai(gunner)) {
        gunner stopwatchingthermalinputchange();
    }
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x53ee
// Size: 0x357
function function_c34bf26ae4a7084f(gunner) {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    gunner endon("disconnect");
    level endon("game_ended");
    self.flashlight = spawn("script_model", self.origin);
    self.flashlight setmodel("ks_gunship_mp");
    self.flashlight dontinterpolate();
    self.flashlight thread function_9820f2512425d34e(self, gunner);
    if (isnightmap()) {
        self.flashlight thread function_24616cc755cc01fb();
    }
    togglethermal = 0;
    var_9b037229590a3dc2 = 1;
    bundle = level.streakglobals.streakbundles["missile_drone"];
    /#
        thirdpersoncam = getdvarint(@"hash_2af3c80dd9b7877c", 0);
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
        var_a2f6d1877f033b10 = gunner getcurrentweapon();
        dofinfo = function_78cf37cb70874140(var_a2f6d1877f033b10.basename);
        if (!istrue(togglethermal)) {
            gunner setthermalvision(1, dofinfo.fstop, dofinfo.focusdistance);
            self.currentvisionset = thermalvisionset;
            togglethermal = 1;
            gunner _shellshock("killstreak_veh_camera_flir_mp", "top", self.timeout, 0);
            gunner setclientomnvar("ui_killstreak_thermal_mode", 1);
            gunner killstreak_setMainVision(thermalvisionset);
            continue;
        }
        defaultvisionset = "gunship_color_mp";
        if (isdefined(level.mapname) && (issubstr(level.mapname, "_shipment") || issubstr(level.mapname, "mp_skerries") || getdvarint(@"hash_955ca5a1f2f45e90", 0))) {
            defaultvisionset = "gunship_color_fog_mp";
        }
        if (isdefined(level.var_c5517afe5895d28d)) {
            gunner killstreak_setMainVision(level.var_c5517afe5895d28d);
            self.currentvisionset = level.var_c5517afe5895d28d;
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

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x574d
// Size: 0x6d
function function_78cf37cb70874140(weaponbasename) {
    dofinfo = spawnstruct();
    bundle = level.streakglobals.streakbundles["missile_drone"];
    if (weaponbasename == bundle.var_483b0b941a89a454) {
        dofinfo.fstop = 8;
        dofinfo.focusdistance = 600;
    }
    return dofinfo;
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x57c3
// Size: 0x9a
function function_9820f2512425d34e(missiledrone, gunner) {
    self endon("death");
    level endon("game_ended");
    useplayerangles = 1;
    /#
        thirdpersoncam = getdvarint(@"hash_2af3c80dd9b7877c", 0);
        if (thirdpersoncam) {
            useplayerangles = 0;
        }
    #/
    while (isdefined(missiledrone) && isdefined(gunner)) {
        self.origin = missiledrone.origin;
        if (istrue(useplayerangles)) {
            self.angles = gunner getplayerangles();
        }
        wait 0.05;
    }
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5865
// Size: 0x71
function function_24616cc755cc01fb() {
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

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x58de
// Size: 0x168
function function_80144ddd67d04fed(weapon, missiledrone) {
    missiledrone endon("death");
    missiledrone endon("crashing");
    missiledrone endon("leaving");
    self endon("disconnect");
    level endon("game_ended");
    bundle = level.streakglobals.streakbundles["missile_drone"];
    var_49e6ef3edadd524e = function_21c6809e6006460e(weapon);
    self playlocalsound("kls_jup_missile_drone_105mm_mp_reload");
    if (weapon.basename == bundle.var_483b0b941a89a454) {
        missiledrone.hellfireloaded = 0;
    }
    self setclientomnvar("ui_missile_drone_reloading", 1);
    self setclientomnvar("ui_missile_drone_fire_time", gettime());
    function_bd38f2af58223930(weapon, var_49e6ef3edadd524e);
    self setclientomnvar("ui_missile_drone_reloading", 0);
    reloaddialog = var_49e6ef3edadd524e + "_reload";
    playkillstreakoperatordialog("missile_drone", reloaddialog, undefined, undefined, "pilot");
    maxammo = weaponmaxammo(weapon);
    self setweaponammoclip(weapon, maxammo);
    if (weapon.basename == bundle.var_483b0b941a89a454) {
        missiledrone.hellfireloaded = 1;
    }
    var_f3fc82c371854578 = undefined;
    switch (var_49e6ef3edadd524e) {
    case #"hash_97ef219efca7be18": 
        var_f3fc82c371854578 = "ui_killstreak_weapon_1_ammo";
        break;
    }
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5a4e
// Size: 0x7e
function function_bd38f2af58223930(weapon, var_49e6ef3edadd524e) {
    reloadtime = level.weaponreloadtime[weapon.basename];
    var_d7dac94935945aab = undefined;
    switch (var_49e6ef3edadd524e) {
    case #"hash_97ef219efca7be18": 
        var_d7dac94935945aab = "ui_killstreak_weapon_1_reloadtime";
        break;
    }
    while (true) {
        wait 0.05;
        reloadtime -= 0.05;
        if (reloadtime <= 0) {
            break;
        }
    }
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5ad4
// Size: 0x52
function function_21c6809e6006460e(weapon) {
    index = 0;
    weaponname = weapon.basename;
    tokens = strtok(weaponname, "_");
    return tokens[index] + "_" + tokens[index + 1];
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5b2f
// Size: 0x21
function deleteaftertime(delay) {
    self endon("death");
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(delay);
    self delete();
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5b58
// Size: 0x2f
function function_e5c3f1d81fd3f22f(gunner) {
    self notify("crashing");
    self.crashed = 1;
    thread function_65e8d13e7627aa30(gunner);
    thread function_4f343c3570ec8c83();
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5b8f
// Size: 0x56
function function_65e8d13e7627aa30(gunner) {
    if (!isdefined(gunner)) {
        return;
    }
    if (isdefined(self)) {
        self endon("death");
        gunner endon("disconnect");
        thread function_cf067ca1169bed53(gunner);
        if (isdefined(self.missileDroneIntro) && level.var_5b9861f19d4aa681 == 0) {
            self playsoundtoplayer("kls_jup_missile_drone_damage_static_final", gunner);
        }
    }
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5bed
// Size: 0x2a
function function_4f343c3570ec8c83() {
    level endon("game_ended");
    self setscriptablepartstate("crash_air", "on", 0);
    wait 0.5;
    function_389bbae7183fba66(1);
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5c1f
// Size: 0x16
function function_8c83bb59a3b39d63() {
    level endon("game_ended");
    wait 0.05;
    self hide();
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5c3d
// Size: 0x98
function function_89e2c5d8943c1d34(delaytime) {
    level endon("game_ended");
    var_14b1d0692795af2f = delaytime - 2;
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(var_14b1d0692795af2f);
    foreach (player in level.players) {
        if (player scripts\cp_mp\utility\player_utility::_isalive()) {
            player earthquakeforplayer(0.25, 2, self.origin, 30000);
        }
    }
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5cdd
// Size: 0x2b
function function_b0907b95aa104523(delaytime) {
    level endon("game_ended");
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(delaytime);
    function_5a9772411551e56e("missile_drone", "pilot");
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d10
// Size: 0x3
function function_b6b762b383a503ea() {
    waitframe();
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5d1b
// Size: 0xe8
function function_389bbae7183fba66(wasdestroyed) {
    if (isdefined(self.flashlight)) {
        self.flashlight delete();
    }
    if (isdefined(self.camera)) {
        self.camera delete();
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

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5e0b
// Size: 0xac
function function_be60e349949d9e87(intro) {
    if (isdefined(intro)) {
        if (isdefined(intro.var_ba27aac5a0f799e0)) {
            intro.var_ba27aac5a0f799e0 delete();
        }
        if (isent(intro)) {
            intro delete();
            return;
        }
        if (isdefined(intro.var_5cb1f0f95e16878e)) {
            foreach (animent in intro.var_5cb1f0f95e16878e) {
                if (isdefined(animent)) {
                    animent delete();
                }
            }
        }
    }
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5ebf
// Size: 0x84
function function_20836c46516ad037(intro) {
    if (isdefined(intro)) {
        if (isdefined(intro.var_5cb1f0f95e16878e)) {
            foreach (animent in intro.var_5cb1f0f95e16878e) {
                if (isdefined(animent)) {
                    animent hidefromplayer(intro.var_dee7149209c9df8c);
                }
            }
        }
    }
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5f4b
// Size: 0x27d
function function_54bfc1d6d0f13763(intro, sequence) {
    self endon("disconnect");
    thirdpersoncam = 0;
    /#
        thirdpersoncam = getdvarint(@"hash_2af3c80dd9b7877c", 0);
    #/
    if (!isdefined(intro.var_dee7149209c9df8c)) {
        intro.var_dee7149209c9df8c = self;
    }
    if (isdefined(intro) && isdefined(sequence)) {
        thread function_d13d2a81214fbfb8("80_instant_noscale", 1);
        if (sequence == "intro_missile_drone_exterior") {
            var_1e2cc86d6cbceaa2 = intro.var_5cb1f0f95e16878e["missile_drone_exterior"];
            var_b648d67484907f7e = function_52351c3338da63f4("missile_drone", sequence);
            var_1e2cc86d6cbceaa2 showtoplayer(intro.var_dee7149209c9df8c);
            intro.var_ba27aac5a0f799e0 thread scripts\common\anim::anim_single_solo(var_1e2cc86d6cbceaa2, sequence);
            if (!thirdpersoncam) {
                intro.var_dee7149209c9df8c cameralinkto(var_1e2cc86d6cbceaa2, "tag_player", 1, 1);
            }
            var_1e2cc86d6cbceaa2 thread function_1c58d316ba362c44(var_b648d67484907f7e, self, sequence);
            var_1e2cc86d6cbceaa2 thread function_9a5d614fcfd652b(var_b648d67484907f7e, self, sequence);
            wait var_b648d67484907f7e;
            if (!thirdpersoncam) {
                intro.var_dee7149209c9df8c cameraunlink();
            }
        } else {
            if (sequence == "intro") {
                var_1e2cc86d6cbceaa2 = intro.var_5cb1f0f95e16878e["missile_drone_exterior"];
            }
            if (isdefined(intro.var_5cb1f0f95e16878e)) {
                foreach (modelindex, animent in intro.var_5cb1f0f95e16878e) {
                    if (isdefined(animent)) {
                        if (modelindex == "missile_drone_exterior") {
                            continue;
                        }
                        animent showtoplayer(intro.var_dee7149209c9df8c);
                        if (modelindex == "missile_drone_interior") {
                            continue;
                        }
                        var_465db5572e637fb7 = sequence + "_" + modelindex;
                        intro.var_ba27aac5a0f799e0 thread scripts\common\anim::anim_single_solo(animent, var_465db5572e637fb7);
                        if (!thirdpersoncam && modelindex == "gunner") {
                            intro.var_dee7149209c9df8c cameralinkto(animent, "tag_camera", 1, 1);
                            var_9adc9e34bc4e0c77 = function_52351c3338da63f4("missile_drone", sequence + "_gunner");
                            animent thread function_9a5d614fcfd652b(var_9adc9e34bc4e0c77, self, sequence);
                        }
                    }
                }
                var_b648d67484907f7e = function_52351c3338da63f4("missile_drone", sequence + "_gunner");
                wait var_b648d67484907f7e;
            }
        }
        self notify("finished_gunship_anim_" + sequence);
    }
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x61d0
// Size: 0x245
function function_d176c031e49a9127(var_5e0676140eecdf2d, brush_name) {
    init_succeed = 1;
    lighting_info = spawnstruct();
    probe = getent(var_5e0676140eecdf2d, "script_noteworthy");
    if (!isdefined(probe)) {
        /#
            assertex(0, "<dev string:x46>");
            self iprintln("<dev string:x46>");
        #/
        return undefined;
    }
    shadow_brushes = getentarray(brush_name, "targetname");
    if (!isdefined(shadow_brushes)) {
        /#
            assertex(0, "<dev string:x46>");
            self iprintln("<dev string:x46>");
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
    foreach (index, brush in shadow_brushes) {
        brush_t = [];
        brush_t["pos"] = brush.origin;
        brush_t["rot"] = brush.angles;
        var_4662a9052a5547bd[index] = brush_t;
    }
    lighting_info.var_959ac8221d7965be = var_4662a9052a5547bd;
    foreach (var_6c3d15091efa3c48 in level.players) {
        probe hidefromplayer(var_6c3d15091efa3c48);
        probe thread function_db2de60186f3a10b(self);
        foreach (brush in shadow_brushes) {
            brush hidefromplayer(var_6c3d15091efa3c48);
            brush thread function_db2de60186f3a10b(self);
        }
    }
    return lighting_info;
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x641e
// Size: 0xed
function function_59fe44dabb80351e(owner, lighting_info, showlighting) {
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

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6513
// Size: 0x42
function function_a9b2c690b95247eb(lighting_info) {
    if (!isdefined(lighting_info)) {
        return;
    }
    lighting_info.probe linkto(self, "tag_origin", (100, 0, 115), (0, 0, 0));
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x655d
// Size: 0x86
function function_58320b18c3e339fe(lighting_info) {
    if (!isdefined(lighting_info)) {
        return;
    }
    foreach (brush in lighting_info.shadow_brushes) {
        brush linkto(self, "tag_origin", (0, 0, 0), (0, 0, 0));
    }
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x65eb
// Size: 0x70
function function_38101db6ed950f17(lighting_info) {
    if (!isdefined(lighting_info)) {
        return;
    }
    lighting_info.probe unlink();
    lighting_info.probe.origin = lighting_info.var_af2c99167339224["pos"];
    lighting_info.probe.angles = lighting_info.var_af2c99167339224["rot"];
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6663
// Size: 0x79
function function_fff560b330fd842d() {
    if (getdvarint(@"hash_e6afce2cf5cf7515") == 0) {
        capture_model = getentarray("ks_gunship_light_only", "script_noteworthy");
        foreach (m in capture_model) {
            m hide();
        }
    }
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x66e4
// Size: 0xa4
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

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x6790
// Size: 0x138
function function_c97862ceafbf17b1(player, var_8a46c62f0a756dd3, state, visionset_name, time) {
    thirdpersoncam = undefined;
    /#
        thirdpersoncam = getdvarint(@"hash_2af3c80dd9b7877c", 0);
        if (istrue(thirdpersoncam)) {
            return;
        }
    #/
    if (!isdefined(player)) {
        return;
    }
    if (state == "on") {
        self.var_b8a91529c0cae39b function_59fe44dabb80351e(player, self.var_de54d075a4e276fb, 1);
        self.var_b8a91529c0cae39b function_a9b2c690b95247eb(self.var_de54d075a4e276fb);
        self.var_b8a91529c0cae39b function_58320b18c3e339fe(self.var_de54d075a4e276fb);
        self.var_b8a91529c0cae39b setscriptablepartstate(var_8a46c62f0a756dd3, "on");
        player visionsetnakedforplayer(visionset_name, time);
        return;
    }
    if (state == "off") {
        self.var_b8a91529c0cae39b function_59fe44dabb80351e(player, self.var_de54d075a4e276fb, 0);
        function_38101db6ed950f17(self.var_de54d075a4e276fb);
        unlink_brushes(self.var_de54d075a4e276fb);
        self.var_b8a91529c0cae39b setscriptablepartstate(var_8a46c62f0a756dd3, "off");
        player visionsetnakedforplayer("", time);
    }
}

/#

    // Namespace missile_drone / namespace_fda4252c4b9127f5
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x68d0
    // Size: 0x5b
    function function_c0266d473bad8324(intro, animent, var_465db5572e637fb7) {
        animent endon("<dev string:xb7>");
        self notifyonplayercommand("<dev string:xc0>", "<dev string:xd3>");
        while (true) {
            self waittill("<dev string:xc0>");
            intro.var_ba27aac5a0f799e0 thread scripts\common\anim::anim_single_solo(animent, var_465db5572e637fb7);
        }
    }

#/

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6933
// Size: 0x325
function function_bb02235216647beb() {
    var_4ac4b608421ecbbb = undefined;
    var_4d571df5f3a8befc = undefined;
    target_loc = undefined;
    var_befbf47bff2227bd = 0;
    var_ea189b55de5c8fa7 = 0;
    inaccuracy_vector = undefined;
    bot_inaccuracy = (self botgetdifficultysetting("minInaccuracy") + self botgetdifficultysetting("maxInaccuracy")) / 2;
    var_def9c228381a493a = 0;
    bundle = level.streakglobals.streakbundles["missile_drone"];
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
                if (var_4b05a8497817406a && (self [[ getsharedfunc("bots", "bot_body_is_dead") ]]() || distancesquared(target_loc, level.gunship.origin) > level.physicssphereradius[bundle.var_483b0b941a89a454] * level.physicssphereradius[bundle.var_483b0b941a89a454])) {
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

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x6c60
// Size: 0x140
function function_531405487af921f1(player, missileteam, missiletarget, fxtagoverride) {
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
            missiletarget thread function_d16a3ecb8c5bc2a1(fxtagoverride);
            missiletarget playkillstreakoperatordialog("missile_drone", "missile_drone" + "_flares", 1, undefined, "pilot");
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
        }
        waitframe();
    }
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6da8
// Size: 0x83
function function_da9aa7a5e0fe681e() {
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

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6e33
// Size: 0x73
function function_d16a3ecb8c5bc2a1(fxtagoverride) {
    flarestag = "tag_origin";
    if (isdefined(fxtagoverride)) {
        flarestag = fxtagoverride;
    }
    playsoundatpos(self gettagorigin(flarestag), "ks_ac130_flares");
    playfxontag(getfx("gunship_flares"), self, flarestag);
    flaresgroup = self.flaresreservecount + 1;
    self setscriptablepartstate("fake_flares_" + flaresgroup, "on", 0);
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6eae
// Size: 0xc
function function_37aa153b0366cc11() {
    return isdefined(self.var_2bd14eb14d3e8f41);
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6ec3
// Size: 0x27
function function_9897e70f93923dcf() {
    self endon("death");
    level endon("game_ended");
    wait 0.05;
    self setscriptablepartstate("contrails", "on");
}

/#

    // Namespace missile_drone / namespace_fda4252c4b9127f5
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x6ef2
    // Size: 0x4d
    function function_9a76988758d4b96d(wingfxent) {
        self endon("<dev string:xb7>");
        level endon("<dev string:xdf>");
        while (true) {
            sphere(wingfxent.origin, 100, (1, 0, 0), 0, 1);
            wait 0.05;
        }
    }

#/

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6f47
// Size: 0x1ca
function function_64a14223afd3adcb(gunner) {
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
                visibletargets = function_13c4d6f32613eca7(player);
                break;
            }
            wait 0.05;
        }
        if (visibletargets.size > 0 && visibletargets.size < 2) {
            gunner playkillstreakoperatordialog("missile_drone", "missile_drone" + "_spotted_single_target", undefined, undefined, "pilot");
        } else if (visibletargets.size >= 2) {
            gunner playkillstreakoperatordialog("missile_drone", "missile_drone" + "_spotted_single_multi", undefined, undefined, "pilot");
        }
        wait randomintrange(5, 15);
    }
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7119
// Size: 0xc8
function function_13c4d6f32613eca7(maintarget) {
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

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x71ea
// Size: 0xbd
function function_b9ab0154dac4fa55(gunner) {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    level endon("game_ended");
    gunner endon("disconnect");
    self.var_d743ac65ecce766 = 0;
    childthread function_d4f51332e1325a1c();
    childthread function_112adc3b48b77e0d();
    while (true) {
        if (self.var_d743ac65ecce766 != 0) {
            wait 2;
            if (self.var_d743ac65ecce766 >= 1) {
                playkillstreakoperatordialog("missile_drone", "missile_drone" + "_hit_target", undefined, undefined, "pilot");
            } else {
                playkillstreakoperatordialog("missile_drone", "missile_drone" + "_miss_target", undefined, undefined, "pilot");
            }
            self.var_d743ac65ecce766 = 0;
            wait 1;
        }
        waitframe();
    }
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x72af
// Size: 0x3f
function function_d4f51332e1325a1c() {
    while (true) {
        recentkills, weaponname = self.owner waittill("update_rapid_kill_buffered");
        if (isdefined(recentkills)) {
            self.var_d743ac65ecce766++;
        }
    }
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x72f6
// Size: 0x3f
function function_112adc3b48b77e0d() {
    while (true) {
        recentkills, weaponname = self.owner waittill("update_rapid_agent_kill_buffered");
        if (isdefined(recentkills)) {
            self.var_d743ac65ecce766++;
        }
    }
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x733d
// Size: 0x4c
function function_a4f2e5aac86b9ee(weaponname) {
    bundle = level.streakglobals.streakbundles["missile_drone"];
    return ter_op(isdefined(weaponname) && weaponname == bundle.var_483b0b941a89a454, 1, 0);
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7392
// Size: 0x39
function function_aedf1601f279fceb() {
    largemap = islargemap();
    /#
        crashtype = getdvarint(@"hash_2e5e9981030fb41d", 0);
        if (crashtype) {
            largemap = 1;
        }
    #/
    return largemap;
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x73d4
// Size: 0xe7
function function_2a0298fbe5f18722(boolean) {
    if (!istrue(boolean)) {
        self.var_abe24c03a3f72c45 = [];
        currentstance = self getstance();
        switch (currentstance) {
        case #"hash_c6775c88e38f7803": 
            self.var_abe24c03a3f72c45 = ["crouch", "prone"];
            break;
        case #"hash_3fed0cbd303639eb": 
            self.var_abe24c03a3f72c45 = ["stand", "prone"];
            break;
        case #"hash_d91940431ed7c605": 
            self.var_abe24c03a3f72c45 = ["stand", "crouch"];
            break;
        }
        val::group_register("missileDroneStance", self.var_abe24c03a3f72c45);
        val::group_set("missileDroneStance", 0);
        return;
    }
    val::group_reset("missileDroneStance");
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x74c3
// Size: 0x31
function function_a69bf71155feb4e() {
    self endon("death");
    level waittill("game_ended");
    level.var_be36c8da670087a8 = array_remove(level.var_be36c8da670087a8, self);
    self delete();
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x74fc
// Size: 0x44
function function_399152c6672be76a(ent) {
    self endon("death");
    ent waittill_any_2("leaving", "death");
    level.var_be36c8da670087a8 = array_remove(level.var_be36c8da670087a8, self);
    self delete();
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7548
// Size: 0x64
function function_8aa94ec41c3e88cc(owner) {
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    owner endon("disconnect");
    level endon("game_ended");
    while (true) {
        targetpos = function_a35bbae32a730b2d(owner);
        if (isdefined(targetpos)) {
            self.hellfiretarget.origin = targetpos;
        }
        waitframe();
    }
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x75b4
// Size: 0x158
function function_2c910042f77e1aa5(owner) {
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    owner endon("disconnect");
    level endon("game_ended");
    var_a0148589752bb7e9 = 65;
    lerptime = 0.2;
    currentfov = var_a0148589752bb7e9;
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
                owner playlocalsound("kls_jup_missile_drone_zoom_in");
            }
        } else if (timeheld > 0) {
            timeheld -= 0.05;
            if (timeheld <= 0) {
                timeheld = 0;
                owner playlocalsound("kls_jup_missile_drone_zoom_out");
            }
            if (istrue(playedvision)) {
                playedvision = 0;
            }
        }
        if (timeheld >= 0) {
            var_d54d564805c29b7b = self.var_5496ff174012e0e0;
            timeperc = timeheld / lerptime * 100;
            currentfov = int(timeperc * (var_d54d564805c29b7b - var_a0148589752bb7e9) / 100 + var_a0148589752bb7e9);
        }
        owner setclientomnvar("ui_killstreak_zoom_fov", currentfov);
        wait 0.05;
    }
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7714
// Size: 0xab
function function_a35bbae32a730b2d(owner) {
    content = ["physicscontents_clipshot", "physicscontents_missileclip", "physicscontents_vehicleclip"];
    contentoverride = physics_createcontents(content);
    starttrace = owner getvieworigin();
    endtrace = starttrace + anglestoforward(owner getplayerangles()) * 5000000;
    ignoreents = owner playerkillstreakgetownerlookatignoreents();
    trace = scripts\engine\trace::ray_trace(starttrace, endtrace, ignoreents, contentoverride);
    endpos = trace["position"];
    return endpos;
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x77c8
// Size: 0x74
function function_ef631bb902b0143b(targetweapon) {
    self endon("death");
    self notify("missileDrone_storing_fov");
    self endon("missileDrone_storing_fov");
    while (true) {
        currentplayerweapon = self.owner getcurrentweapon();
        if (isdefined(currentplayerweapon) && currentplayerweapon.basename == targetweapon) {
            break;
        }
        waitframe();
    }
    self.var_5496ff174012e0e0 = self.owner playergetzoomfov();
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7844
// Size: 0xb7
function function_b16043b8aa64aa83(missiledrone, gunner, weaponbasename) {
    missiledrone endon("death");
    missiledrone endon("leaving");
    missiledrone endon("crashing");
    gunner endon("disconnect");
    self waittill("death");
    bundle = level.streakglobals.streakbundles["missile_drone"];
    missiledrone.hellfiretarget hide();
    var_465f0d60f080d408 = "gunship_hellfire_crt";
    earthquake(0.125, 0.5, missiledrone.origin, 1000);
    gunner playlocalsound("kls_jup_missile_drone_exp_radio_hellfire_dist");
    gunner function_58707ddfdd9744fa(var_465f0d60f080d408);
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7903
// Size: 0x20
function function_a97a45c5bcdf7177(data) {
    if (isdefined(self)) {
        function_e5c3f1d81fd3f22f(self.owner);
    }
}

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x792b
// Size: 0x226
function function_30cc55dbff70c92f(data) {
    self endon("death");
    self notify("missile_drone_mini_emp_hit");
    self endon("missile_drone_mini_emp_hit");
    self.owner endon("detach_missile_drone_intro");
    self.owner endon("returning_killstreak_player");
    thread function_54dc6e57b9bebd23();
    if (!isdefined(self.var_e8d88b601e41fba5) && self.flaresreservecount > 0) {
        self.var_e8d88b601e41fba5 = gettime();
        if (issharedfuncdefined("flares", "reduceReserves")) {
            [[ getsharedfunc("flares", "reduceReserves") ]](self);
        }
        thread function_d16a3ecb8c5bc2a1();
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
        thread function_d16a3ecb8c5bc2a1();
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

// Namespace missile_drone / namespace_fda4252c4b9127f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7b59
// Size: 0x177
function function_54dc6e57b9bebd23() {
    self.owner _setvisibiilityomnvarforkillstreak(self.streakname, "off");
    result = waittill_any_ents_or_timeout_return(0.1, self.owner, "detach_missile_drone_intro", self.owner, "returning_killstreak_player", self, "death");
    if (!isdefined(result) || result != "timeout" || !isdefined(self) || !isalive(self)) {
        return;
    }
    self.owner _setvisibiilityomnvarforkillstreak(self.streakname, "on");
    result = waittill_any_ents_or_timeout_return(0.05, self.owner, "detach_missile_drone_intro", self.owner, "returning_killstreak_player", self, "death");
    if (!isdefined(result) || result != "timeout" || !isdefined(self) || !isalive(self)) {
        return;
    }
    self.owner _setvisibiilityomnvarforkillstreak(self.streakname, "off");
    result = waittill_any_ents_or_timeout_return(0.25, self.owner, "detach_missile_drone_intro", self.owner, "returning_killstreak_player", self, "death");
    if (!isdefined(result) || result != "timeout" || !isdefined(self) || !isalive(self)) {
        return;
    }
    self.owner _setvisibiilityomnvarforkillstreak(self.streakname, "on");
}

/#

    // Namespace missile_drone / namespace_fda4252c4b9127f5
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x7cd8
    // Size: 0xe4
    function function_86d2c07ecf9891c8(var_5118005380cb1d91) {
        self endon("<dev string:xb7>");
        self.owner endon("<dev string:xed>");
        self.owner endon("<dev string:x112>");
        while (true) {
            trace = scripts\engine\trace::ray_trace(self.origin, self.origin - (0, 0, 40000), self);
            line(self.origin, trace["<dev string:x138>"], (1, 1, 1), 1, 0, 1);
            sphere(var_5118005380cb1d91.origin, 50, (1, 1, 0), 0, 1);
            self.owner iprintlnbold("<dev string:x144>" + distance(self.origin, trace["<dev string:x138>"]));
            waitframe();
        }
    }

    // Namespace missile_drone / namespace_fda4252c4b9127f5
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x7dc4
    // Size: 0x114
    function function_9d69dd8c1ff1265c(tagname, var_22c53c353885fe59) {
        self endon("<dev string:xb7>");
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

    // Namespace missile_drone / namespace_fda4252c4b9127f5
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x7ee0
    // Size: 0x158
    function function_a7ae61ca6cbcb70a() {
        self endon("<dev string:xb7>");
        self endon("<dev string:x152>");
        self endon("<dev string:x15d>");
        self.owner notifyonplayercommand("<dev string:xed>", "<dev string:x169>");
        self.owner notifyonplayercommand("<dev string:x112>", "<dev string:x176>");
        self.owner notifyonplayercommand("<dev string:x112>", "<dev string:x183>");
        self.flashlight notify("<dev string:x191>");
        bundle = level.streakglobals.streakbundles["<dev string:x1a2>"];
        weaponstocycle = [bundle.var_483b0b941a89a454];
        currentdebugweaponindex = 0;
        currentdebugweapon = weaponstocycle[0];
        while (true) {
            result = self.owner waittill_any_return_2("<dev string:xed>", "<dev string:x112>");
            if (!isdefined(result)) {
                waitframe();
                continue;
            }
            if (result == "<dev string:xed>") {
                currentdebugweaponindex++;
                if (currentdebugweaponindex > 2) {
                    currentdebugweaponindex = 0;
                }
                currentdebugweapon = weaponstocycle[currentdebugweaponindex];
                self.owner iprintlnbold("<dev string:x1b3>" + currentdebugweapon);
                continue;
            }
            shotgoal = function_1a59507eefd55d13(self.owner);
            thread function_91136bd1e9d68478(shotgoal, currentdebugweapon);
        }
    }

    // Namespace missile_drone / namespace_fda4252c4b9127f5
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x8040
    // Size: 0x15
    function function_4dbd9a1ea2d94c05(weapon) {
        return weaponfiretime(weapon);
    }

    // Namespace missile_drone / namespace_fda4252c4b9127f5
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x805d
    // Size: 0xa2
    function function_1a59507eefd55d13(owner) {
        content = ["<dev string:x1d1>", "<dev string:x1ed>", "<dev string:x20c>"];
        contentoverride = physics_createcontents(content);
        starttrace = owner getvieworigin();
        endtrace = starttrace + anglestoforward(owner getplayerangles()) * 50000;
        trace = scripts\engine\trace::ray_trace(starttrace, endtrace, level.characters, contentoverride);
        endpos = trace["<dev string:x138>"];
        return endpos;
    }

    // Namespace missile_drone / namespace_fda4252c4b9127f5
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x8107
    // Size: 0x165
    function function_91136bd1e9d68478(shotgoal, currentdebugweapon) {
        self endon("<dev string:xb7>");
        self endon("<dev string:x152>");
        self endon("<dev string:x15d>");
        self.owner endon("<dev string:xed>");
        self.owner endon("<dev string:x112>");
        while (true) {
            sphere(shotgoal, 10, (1, 1, 0), 0, 60);
            self.owner iprintlnbold("<dev string:x227>" + currentdebugweapon + "<dev string:x232>" + shotgoal + "<dev string:x23a>" + getweaponexplosionradius(currentdebugweapon));
            ammoleft = weaponmaxammo(currentdebugweapon);
            thread function_4edd23e2f400d3c6(shotgoal);
            while (ammoleft > 0) {
                var_e84b952249e4abe = undefined;
                if (issharedfuncdefined("<dev string:x24f>", "<dev string:x25a>")) {
                    var_e84b952249e4abe = [[ getsharedfunc("<dev string:x24f>", "<dev string:x25a>") ]](shotgoal, 100);
                }
                projectile = _magicbullet(makeweapon(currentdebugweapon), self.origin, var_e84b952249e4abe, self.owner);
                ammoleft--;
                if (ammoleft == 0) {
                    wait 1;
                    reloadtimer = level.weaponreloadtime[currentdebugweapon];
                    while (reloadtimer > 0) {
                        self.owner iprintlnbold("<dev string:x26d>" + currentdebugweapon);
                        reloadtimer--;
                        wait 1;
                    }
                }
                wait function_4dbd9a1ea2d94c05(currentdebugweapon);
            }
        }
    }

    // Namespace missile_drone / namespace_fda4252c4b9127f5
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x8274
    // Size: 0x90
    function function_4edd23e2f400d3c6(shotgoal) {
        self endon("<dev string:xb7>");
        self endon("<dev string:x152>");
        self endon("<dev string:x15d>");
        self.owner endon("<dev string:xed>");
        self.owner endon("<dev string:x112>");
        while (true) {
            self.flashlight.angles = vectortoangles(shotgoal - self.origin);
            line(self.origin, shotgoal, (1, 1, 1), 1, 0, 1);
            waitframe();
        }
    }

    // Namespace missile_drone / namespace_fda4252c4b9127f5
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x830c
    // Size: 0x55
    function function_b4f83c42aa587a5b() {
        self endon("<dev string:xb7>");
        wait 10;
        data = scripts\cp_mp\utility\damage_utility::packdamagedata(self.owner, self, 1, self.currentprimaryweapon, "<dev string:x27b>", self);
        function_30cc55dbff70c92f(data);
        wait 10;
        function_30cc55dbff70c92f(data);
    }

#/
