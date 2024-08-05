#using scripts\cp\utility.gsc;
#using script_354c862768cfe202;
#using scripts\cp\powers\cp_tactical_cover.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\ai.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_2669878cf5a1b6bc;
#using script_cbb0697de4c5728;
#using scripts\cp\utility\spawn_event_aggregator.gsc;
#using script_74502a9e0ef1f19c;
#using scripts\cp\cp_weapons.gsc;
#using scripts\cp\cp_outline_utility.gsc;
#using scripts\cp\powers\coop_molotov.gsc;
#using scripts\cp\cp_claymore.gsc;
#using scripts\cp_mp\equipment\throwing_knife.gsc;
#using script_6a858966978cd595;
#using scripts\cp\equipment\cp_at_mine.gsc;
#using scripts\cp\cp_accessories.gsc;
#using script_7b6642e374dc6e4c;
#using script_737f801e6beb18c7;
#using scripts\cp\equipment\cp_stinger.gsc;
#using scripts\cp\equipment\cp_javelin.gsc;
#using script_293bc33bd79cabd1;
#using script_12e2fb553ec1605e;
#using script_6e09a830fab9468f;
#using script_afb7e332aee4bf2;
#using scripts\cp\equipment\cp_thermite.gsc;
#using scripts\cp\equipment\cp_snapshot_grenade.gsc;
#using scripts\cp\cp_c4.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\cp\equipment\cp_adrenaline.gsc;
#using scripts\cp\cp_missilelauncher.gsc;
#using scripts\cp_mp\crossbow.gsc;
#using scripts\cp_mp\xmike109.gsc;
#using scripts\cp\equipment\cp_gas_grenade.gsc;
#using script_511e19d41c23e8aa;
#using scripts\cp\equipment\cp_trophy_system.gsc;
#using script_37257c344663c658;
#using script_14e0aec82ef0352c;
#using script_130b90141eb30189;
#using scripts\cp\cp_hud_message.gsc;
#using script_3b8ef7abd8107d82;
#using scripts\cp\cp_player_battlechatter.gsc;
#using script_189b67b2735b981d;
#using script_1db8d0e02a99c5e2;
#using scripts\cp\cp_agent_utils.gsc;
#using scripts\engine\trace.gsc;
#using script_25845aca699d038d;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_66122a002aff5d57;
#using script_7ef95bba57dc4b82;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using scripts\cp\cp_movers.gsc;
#using scripts\cp\killstreaks\juggernaut_cp.gsc;
#using scripts\cp\cp_checkpoint.gsc;
#using script_3bcaa2cbaf54abdd;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp\cp_debug.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_600b944a95c3a7bf;
#using scripts\cp_mp\challenges.gsc;
#using scripts\cp\utility\player.gsc;
#using scripts\cp_mp\ent_manager.gsc;
#using scripts\cp\cp_loadout.gsc;

#namespace weapon;

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x39f3
// Size: 0x282
function weaponsinit() {
    scripts\cp\utility\spawn_event_aggregator::registeronplayerspawncallback(&function_9ba246f8c51923da);
    level.maxperplayerexplosives = max(getintproperty(@"scr_maxperplayerexplosives", 2), 4);
    level.riotshieldxpbullets = getintproperty(@"scr_riotshieldxpbullets", 15);
    level.build_weapon_name_func = &_buildweaponcustom;
    level.has_weapon_variation = &has_weapon_variation;
    level.get_weapon_level = &get_weapon_level;
    level.can_upgrade = &can_upgrade;
    level.weaponconfigs = [];
    level.pap = [];
    level.dropped_weapons = [];
    level.invalid_drop_weapons = ["iw9_lm_dblmg2_cp"];
    level.wavessurvivedthroughweapon = 0;
    level.weaponobtained = 0;
    level.downswithweapon = 0;
    level.weaponkills = 0;
    level.dropped_weapon_func = &drop_script_weapon_from_ai;
    level.fnbuildweapon = &buildweapon;
    level.fnscriptedweaponassignment = &getscriptedweapon;
    namespace_e0ee43ef2dddadaa::function_5238382582ce39fa();
    namespace_a0628d6954815ef8::function_2d291cfd98fd0d8e();
    /#
        thread function_2778968efa18eb6a();
        thread watchgunsmithdebugui();
    #/
    scripts\cp\cp_weapons::cp_weapons_init();
    level.var_f9e0e2877b743202 = makeweapon("iw9_me_diveknife_mp");
    if (getdvarint(@"hash_e6afce2cf5cf7515", 0) == 0) {
        level.var_a2df868742d5f192 = buildweapon("iw9_me_climbfists");
    }
    level.bot_smoke_sight_clip_large = getent("smoke_grenade_sight_clip_256", "targetname");
    if (!isdefined(level.bot_smoke_sight_clip_large)) {
        println("<dev string:x1c>" + "<dev string:x7e>");
    }
    initeffects();
    setupminesettings();
    setupconfigs();
    level.custom_proj_func = [];
    level thread custom_gl_proj_func_init();
    level thread onplayerconnect();
    iteminits();
    scripts\cp\cp_outline_utility::initoutlineoccluders();
    array_thread(getentarray("misc_turret", "classname"), &turret_monitoruse);
    thread scripts\cp\powers\coop_molotov::molotov_init();
    if (isdefined(level.custom_initializeweaponpickups)) {
        [[ level.custom_initializeweaponpickups ]]();
    } else {
        initializeweaponpickups();
    }
    thread scripts\cp\cp_claymore::claymore_init();
    thread scripts\cp\powers\cp_tactical_cover::tac_cover_init();
    thread scripts\cp_mp\equipment\throwing_knife::throwing_knife_init();
    thread namespace_97bfc19addb080f3::bottle_init();
    thread scripts\cp\equipment\cp_at_mine::at_mine_init();
    thread scripts\cp\cp_accessories::init();
    thread namespace_e31e5dae9e397e2::decoy_init();
    thread namespace_e875ad14b292bd61::function_69e63e3462f94600();
    if (getdvarint(@"hash_e6afce2cf5cf7515", 0) == 0) {
        level thread hackexclusionlist();
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c7d
// Size: 0x2da
function hackexclusionlist() {
    var_acd56378e87382db = [makeweapon(level.sentrysettings["sentry_turret"].weaponinfo), makeweapon("tur_gun_decho_cp"), makeweapon("iw9_mg_jltv_mp"), makeweapon("jup_mg_jltv_mp"), makeweapon("jup_mg_jltv_dungeons_cp"), makeweapon("iw8_gunless_infil"), makeweapon("deploy_manual_turret_mp"), makeweapon("manual_turret_mp"), makeweapon("deploy_tactical_cover_mp"), makeweapon("tac_cover_mp"), makeweapon("gunship_25mm_mp"), makeweapon("gunship_40mm_mp"), makeweapon("gunship_105mm_mp"), makeweapon("gunship_hellfire_mp"), makeweapon("iw8_ammo_marker_cp"), makeweapon("iw8_armor_marker_cp"), makeweapon("vip_carry_cp"), makeweapon("deploy_sentry_mp"), makeweapon("ks_generic_mp"), makeweapon("ks_remote_gauntlet_mp"), makeweapon("ks_remote_map_cp"), makeweapon("ks_remote_map_mp"), makeweapon("ks_remote_device_mp"), makeweapon("ks_remote_target_mp"), makeweapon("ks_gesture_generic_mp"), makeweapon("ks_gesture_phone_mp"), makeweapon("deploy_dronepackage_mp"), makeweapon("deploy_warden_mp"), makeweapon("deploy_box_marker_mp"), makeweapon("deploy_pac_sentry_mp"), makeweapon("iw8_nukecore_mp"), makeweapon("iw9_mg_light_tank_mp"), makeweapon("iw9_mg_mrap_mp"), makeweapon("iw9_tur_mrap_mp"), makeweapon("iw8_spotter_scope_mp"), makeweapon("iw9_la_mike32_mp"), makeweapon("iw8_green_beam_mp"), makeweapon("iw9_minigunksjugg_mp"), makeweapon("ks_remote_drone_mp"), makeweapon("ks_assault_drone_mp"), makeweapon("ks_assault_drone_cp"), level.var_f9e0e2877b743202, makeweapon("iw9_swimfists_mp"), makeweapon("iw8_gunless"), makeweapon("iw9_me_climbfists"), makeweapon("cluster_spike_mp"), makeweapon("iw9_pi_stimpistol_mp"), makeweapon("deploy_missileturret_jup_mp")];
    level.additional_laststand_weapon_exclusion = scripts\engine\utility::array_combine(level.additional_laststand_weapon_exclusion, var_acd56378e87382db);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f5f
// Size: 0x26
function function_f2525bf18abad733(basename) {
    level.additional_laststand_weapon_exclusion[level.additional_laststand_weapon_exclusion.size] = makeweapon(basename);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f8d
// Size: 0xb
function blank(power) {
    
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3fa0
// Size: 0x16e
function initeffects() {
    level._effect["weap_blink_friend"] = loadfx("vfx/core/mp/killstreaks/vfx_detonator_blink_cyan.vfx");
    level._effect["weap_blink_enemy"] = loadfx("vfx/core/mp/killstreaks/vfx_detonator_blink_cyan.vfx");
    level._effect["emp_stun"] = loadfx("vfx/core/mp/equipment/vfx_emp_grenade");
    level._effect["equipment_explode_big"] = loadfx("vfx/core/mp/killstreaks/vfx_ims_explosion");
    level._effect["equipment_smoke"] = loadfx("vfx/core/mp/killstreaks/vfx_sg_damage_blacksmoke");
    level._effect["equipment_sparks"] = loadfx("vfx/core/mp/killstreaks/vfx_sentry_gun_explosion.vfx");
    level.kinetic_pulse_fx["spark"] = loadfx("vfx/iw7/_requests/mp/vfx_kinetic_pulse_shock");
    level._effect["gas_grenade_smoke_enemy"] = loadfx("vfx/iw8_mp/equipment/smoke_grenade/vfx_smoke_gren_mp.vfx");
    level._effect["equipment_smoke"] = loadfx("vfx/core/mp/killstreaks/vfx_sg_damage_blacksmoke");
    level._effect["placeEquipmentFailed"] = loadfx("vfx/iw7/_requests/mp/vfx_generic_equipment_exp.vfx");
    level._effect["penetration_railgun_explosion"] = loadfx("vfx/iw7/core/expl/weap/chargeshot/vfx_expl_chargeshot.vfx");
    level._effect["flash_bang_explode"] = loadfx("vfx/iw8_mp/equipment/flashbang/vfx_flash_bang.vfx");
    level._effect["glsmoke"] = loadfx("vfx/iw8_mp/equipment/smoke_grenade/vfx_smoke_gren_ch.vfx");
    level._effect["xmike109ThermiteBounce"] = loadfx("vfx/iw8_mp/equipment/vfx_xmike109_thermite_bounce");
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4116
// Size: 0xea
function setupminesettings() {
    var_1fcc848e179898ee = 70;
    level.claymoredetectiondot = cos(var_1fcc848e179898ee);
    level.claymoredetectionmindist = 20;
    level.claymoredetectiongraceperiod = 0.75;
    level.claymoredetonateradius = 192;
    level.minedetectiongraceperiod = 0.3;
    level.minedetectionradius = 150;
    level.minedetectionheight = 20;
    level.minedamageradius = 256;
    level.minedamagemin = 600;
    level.minedamagemax = 1200;
    level.minedamagehalfheight = 300;
    level.mineselfdestructtime = 600;
    level.mine_launch = loadfx("vfx/core/impacts/bouncing_betty_launch_dirt");
    level.mine_explode = loadfx("vfx/core/expl/bouncing_betty_explosion.vfx");
    level.delayminetime = 1.5;
    level.c4explodethisframe = 0;
    level.mines = [];
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4208
// Size: 0x13b
function setupconfigs() {
    config = spawnstruct();
    config.mine_beacon["enemy"] = loadfx("vfx/core/equipment/light_c4_blink.vfx");
    config.mine_beacon["friendly"] = loadfx("vfx/misc/light_mine_blink_friendly");
    level.weaponconfigs["c4_mp"] = config;
    config = spawnstruct();
    config.armingdelay = 1.5;
    config.detectionradius = 232;
    config.detectionheight = 512;
    config.detectiongraceperiod = 1;
    config.headiconoffset = 20;
    config.killcamoffset = 12;
    level.weaponconfigs["proximity_explosive_mp"] = config;
    config = spawnstruct();
    var_504e2e39dfc3b1f9 = 800;
    var_502b2039df9d4b77 = 200;
    config.radius_max_sq = var_504e2e39dfc3b1f9 * var_504e2e39dfc3b1f9;
    config.radius_min_sq = var_502b2039df9d4b77 * var_502b2039df9d4b77;
    config.onexplodesfx = "iw9_flash_grenade_expl_trans";
    config.vfxradius = 72;
    level.weaponconfigs["flash_grenade_mp"] = config;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x434b
// Size: 0x10
function iteminits() {
    clustergrenadeinit();
    throwingknifec4init();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4363
// Size: 0x1c
function throwingknifec4init() {
    level._effect["throwingknifec4_explode"] = loadfx("vfx/iw7/_requests/mp/power/vfx_bio_spike_exp.vfx");
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4387
// Size: 0x1c
function clustergrenadeinit() {
    level._effect["clusterGrenade_explode"] = loadfx("vfx/iw7/_requests/mp/vfx_cluster_gren_single_runner.vfx");
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x43ab
// Size: 0x59
function getweapongunsmithattachmenttable(weapon) {
    weaponname = undefined;
    if (isweapon(weapon)) {
        weaponname = weapon.basename;
    } else {
        weaponname = weapon;
    }
    var_49e6ef3edadd524e = getweaponrootname(weaponname);
    return "mp/gunsmith/" + getsubstr(var_49e6ef3edadd524e, 4) + "_attachments.csv";
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x440d
// Size: 0x1a7
function getcompletenameforweapon(weapon, var_c44a5d7d1f872568, var_20d38453281f31fc, weaponreticle, var_fedb77aad2340743, var_69416784e234e68f, var_11852da97169016b) {
    weaponname = weapon;
    tokens = strtok(weaponname, "_");
    index = 0;
    if (tokens[0] == "alt") {
        index++;
    }
    if (tokens[index] == "iw7") {
        /#
            iprintln("<dev string:x9b>");
        #/
        return;
    }
    if (tokens[index] == "iw8") {
        rootname = weapon;
        if (!isdefined(var_c44a5d7d1f872568)) {
            attachments = ["none", "none", "none", "none", "none", "none"];
        } else {
            attachments = var_c44a5d7d1f872568;
        }
        if (!isdefined(var_20d38453281f31fc)) {
            camo = "none";
        } else {
            camo = var_20d38453281f31fc;
        }
        if (!isdefined(weaponreticle)) {
            reticle = "none";
        } else {
            reticle = weaponreticle;
        }
        if (!isdefined(var_fedb77aad2340743)) {
            variantid = -1;
        } else {
            variantid = var_fedb77aad2340743;
        }
        if (!isdefined(var_69416784e234e68f)) {
            var_b022d4bb3c3772b3 = 0;
        } else {
            var_b022d4bb3c3772b3 = var_69416784e234e68f;
        }
        if (!isdefined(var_11852da97169016b)) {
            cosmeticattachment = "none";
        } else {
            cosmeticattachment = var_11852da97169016b;
        }
        /#
        #/
        return getcompleteweaponname(buildweapon(rootname, attachments, camo, reticle, variantid, 1, 1, var_b022d4bb3c3772b3, cosmeticattachment));
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x45bc
// Size: 0x36
function getcompleteweaponnamenoalt(objweapon) {
    fullname = getcompleteweaponname(objweapon);
    if (istrue(objweapon.isalternate)) {
        fullname = getsubstr(fullname, 4);
    }
    return fullname;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x45fb
// Size: 0x2c
function isattachmentselectfire(weapon, attachment) {
    basetype = function_7c612ac92ba98dcb(weapon, attachment);
    return basetype == "selectfire";
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4630
// Size: 0x21
function turret_monitoruse() {
    for (;;) {
        player = self waittill("trigger");
        thread turret_playerthread(player);
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4659
// Size: 0x3c
function turret_playerthread(player) {
    player endon("death");
    player endon("disconnect");
    player notify("weapon_change", nullweapon());
    self waittill("turret_deactivate");
    player notify("weapon_change", player getcurrentweapon());
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x469d
// Size: 0x64
function onplayerconnect() {
    for (;;) {
        player = level waittill("connected");
        player.hits = 0;
        player thread onplayerspawned();
        player thread watchmissileusage();
        player thread sniperdustwatcher();
        player thread watchjavelinusage();
        player thread updatelastweapon();
        player thread watchchangeweapon();
        player thread scripts\cp\equipment\cp_stinger::watchlauncherusage();
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4709
// Size: 0x9
function watchjavelinusage() {
    scripts\cp\equipment\cp_javelin::javelinusageloop();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x471a
// Size: 0x3e
function watchchangeweapon() {
    self endon("disconnect");
    level endon("game_ended");
    while (true) {
        objweapon = self getcurrentweapon();
        if (isdefined(objweapon)) {
            dochangeweapon(objweapon);
        }
        self waittill("weapon_change");
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4760
// Size: 0x47
function dochangeweapon(objweapon) {
    updateweaponspeed(objweapon);
    updatelastweaponobj(objweapon);
    updatelauncherusage();
    updatedragonsbreath(objweapon);
    updateweaponperks();
    updatedefaultflinchreduction();
    namespace_22a50d845d3deb2d::updateweaponchangetime();
    riotshieldonweaponchange(objweapon);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x47af
// Size: 0x36
function updatedragonsbreath(objweapon) {
    self notify("end_dragBreath");
    if (getweapongroup(objweapon) == "weapon_shotgun") {
        if (isdragonsbreathweapon(objweapon)) {
            thread initdragonsbreathusage(objweapon);
        }
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x47ed
// Size: 0x22
function initdragonsbreathusage(objweapon) {
    objweapon.isdragonsbreath = 1;
    thread stopdragonsbreath(objweapon);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4817
// Size: 0x33
function stopdragonsbreath(objweapon) {
    self endon("disconnect");
    waittill_any_2("end_dragBreath", "death");
    if (isdefined(objweapon)) {
        objweapon.isdragonsbreath = undefined;
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4852
// Size: 0x27
function isdragonsbreathweapon(objweapon) {
    ammotype = getweaponammopoolname(objweapon);
    return ammotype == %"hash_2c53556f245be704";
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4882
// Size: 0xaa
function updateweaponspeed(objnewweapon) {
    if (objnewweapon.basename == "none") {
        return;
    } else if (issuperweapon(objnewweapon.basename)) {
        namespace_751288259782653c::updatemovespeedscale();
        return;
    } else if (iskillstreakweapon(objnewweapon.basename)) {
        return;
    } else if (objnewweapon.basename == "iw9_me_fists_mp_ls") {
        namespace_751288259782653c::updatemovespeedscale();
        return;
    } else if (objnewweapon.inventorytype != "primary" && objnewweapon.inventorytype != "altmode") {
        return;
    }
    namespace_751288259782653c::updatemovespeedscale();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4934
// Size: 0x68
function updatedefaultflinchreduction() {
    if (isagent(self)) {
        return;
    }
    scale = undefined;
    var_6651def69449c4a3 = weapongetflinchtype(self.currentweapon);
    if (var_6651def69449c4a3 == 4) {
        scale = 1;
    } else if (var_6651def69449c4a3 == 3) {
        scale = 1;
    } else if (var_6651def69449c4a3 == 1) {
        scale = 1;
    } else {
        scale = 1;
    }
    updateviewkickscale(scale);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x49a4
// Size: 0xff
function updateviewkickscale(perc) {
    if (isdefined(perc)) {
        self.viewkickscale = perc;
    }
    if (isdefined(self.overchargeviewkickscale)) {
        perc = self.overchargeviewkickscale;
    } else if (isdefined(self.overrideviewkickscale)) {
        perc = self.overrideviewkickscale;
        var_6651def69449c4a3 = weapongetflinchtype(self getcurrentweapon());
        if (var_6651def69449c4a3 == 1) {
            perc = self.overrideviewkickscalepistol;
        } else if (var_6651def69449c4a3 == 3) {
            perc = self.overrideviewkickscaledmr;
        } else if (var_6651def69449c4a3 == 4) {
            perc = self.overrideviewkickscalesniper;
        }
    } else if (isdefined(self.viewkickscale)) {
        perc = self.viewkickscale;
    } else {
        perc = 1;
    }
    assertex(perc >= 0 && perc <= 1, "updateViewKickScale() called with value outside of 0.0 - 1.0");
    perc = clamp(perc, 0, 1);
    self setviewkickscale(perc);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4aab
// Size: 0x95
function weapongetflinchtype(weaponobj) {
    class = "none";
    var_6651def69449c4a3 = -1;
    if (isdefined(weaponobj) && !isnullweapon(weaponobj)) {
        class = weaponclass(weaponobj);
        switch (class) {
        case #"hash_719417cb1de832b6": 
            var_6651def69449c4a3 = 1;
            break;
        case #"hash_6191aaef9f922f96": 
            if (getweapongroup(weaponobj) == "weapon_dmr") {
                var_6651def69449c4a3 = 3;
            } else {
                var_6651def69449c4a3 = 4;
            }
            break;
        default: 
            var_6651def69449c4a3 = 0;
            break;
        }
    }
    return var_6651def69449c4a3;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b49
// Size: 0x1a
function updateweaponperks() {
    self.prevweaponobj = doweaponperkupdate(self.prevweaponobj);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4b6b
// Size: 0x2f
function doweaponperkupdate(prevweaponobj) {
    currweaponobj = self getcurrentweapon();
    weaponattachmentperkupdate(currweaponobj, prevweaponobj);
    weaponperkupdate(currweaponobj, prevweaponobj);
    return currweaponobj;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4ba3
// Size: 0x9b
function weaponperkupdate(currweaponobj, prevweaponobj) {
    if (!isundefinedweapon(prevweaponobj)) {
        var_9586602ebc60b765 = getweaponrootname(prevweaponobj.basename);
        perkremove = weaponperkmap(var_9586602ebc60b765);
        if (isdefined(perkremove)) {
            namespace_c4cab616edf9b2b9::removeperk(perkremove);
        }
    }
    if (!isundefinedweapon(currweaponobj)) {
        var_98efd9d21da41d1a = getweaponrootname(currweaponobj.basename);
        perkadd = weaponperkmap(var_98efd9d21da41d1a);
        if (isdefined(perkadd)) {
            giveperk(perkadd);
        }
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4c46
// Size: 0x63
function weaponperkmap(weaponroot) {
    assertex(isdefined(level.weaponmapdata), "weaponPerkMap() called without first calling buildWeaponMap().");
    if (isdefined(level.weaponmapdata[weaponroot]) && isdefined(level.weaponmapdata[weaponroot].perk)) {
        return level.weaponmapdata[weaponroot].perk;
    }
    return undefined;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4cb2
// Size: 0x1b2
function weaponattachmentperkupdate(currweaponobj, prevweaponobj) {
    var_503110dc18b08ab9 = undefined;
    var_88c1658d6b22a174 = undefined;
    if (!isundefinedweapon(prevweaponobj)) {
        var_88c1658d6b22a174 = getweaponattachments(prevweaponobj);
        if (isdefined(var_88c1658d6b22a174) && var_88c1658d6b22a174.size > 0) {
            foreach (oldattach in var_88c1658d6b22a174) {
                perks = namespace_e0ee43ef2dddadaa::attachmentperkmap(prevweaponobj, oldattach);
                if (!isdefined(perks)) {
                    continue;
                }
                foreach (perk in perks) {
                    namespace_c4cab616edf9b2b9::removeperk(perk);
                }
            }
        }
    }
    if (!isundefinedweapon(currweaponobj)) {
        var_503110dc18b08ab9 = getweaponattachments(currweaponobj);
        if (isdefined(var_503110dc18b08ab9) && var_503110dc18b08ab9.size > 0) {
            foreach (newattach in var_503110dc18b08ab9) {
                perks = namespace_e0ee43ef2dddadaa::attachmentperkmap(currweaponobj, newattach);
                if (!isdefined(perks)) {
                    continue;
                }
                foreach (perk in perks) {
                    giveperk(perk);
                }
            }
        }
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4e6c
// Size: 0x6c
function updatelastweaponobj(objnewweapon) {
    var_dd9181eb18c4db69 = objnewweapon getnoaltweapon();
    if (isnullweapon(var_dd9181eb18c4db69)) {
        var_dd9181eb18c4db69 = objnewweapon;
    }
    self.lastweaponobj = objnewweapon;
    if (isnormallastweapon(objnewweapon)) {
        self.lastnormalweaponobj = objnewweapon;
    }
    if (isdroppableweapon(var_dd9181eb18c4db69)) {
        setlastdroppableweaponobj(var_dd9181eb18c4db69);
    }
    if (iscacprimaryorsecondary(objnewweapon)) {
        self.lastcacweaponobj = objnewweapon;
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4ee0
// Size: 0x2f
function setlastdroppableweaponobj(weaponobj) {
    self.lastdroppableweaponobj = weaponobj;
    if (isdefined(level.lastdroppableweaponchanged)) {
        self [[ level.lastdroppableweaponchanged ]]();
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f17
// Size: 0x57
function trackriotshield_grenadepullbackforc4() {
    while (true) {
        grenade = self waittill("grenade_pullback");
        if (!isnullweapon(grenade) && grenade.basename == "c4_mp" && isriotshield(self getcurrentweapon())) {
            self.onriotshieldstow_force = 1;
        }
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f76
// Size: 0x65
function trackriotshield_updateoffhandstowignorec4() {
    if (!istrue(self.onriotshieldstow_force)) {
        weaponobj = self getheldoffhand();
        if (!isnullweapon(weaponobj) && weaponobj.basename != "c4_mp" && isriotshield(self getcurrentweapon()) && istwohandedoffhand(weaponobj)) {
            self.onriotshieldstow_force = 1;
        }
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4fe3
// Size: 0x1cb
function trackriotshield_monitorshieldattach(wasinlaststand) {
    self notify("trackRiotShield_monitorShieldAttach");
    self endon("trackRiotShield_monitorShieldAttach");
    self endon("death_or_disconnect");
    self endon("faux_spawn");
    self endon("riotshield_detach");
    childthread trackriotshield_grenadepullbackforc4();
    if (isdefined(wasinlaststand)) {
        self.wasinlaststand = wasinlaststand;
    } else if (!isdefined(self.wasinlaststand)) {
        self.wasinlaststand = 0;
    }
    while (riotshield_hasweapon()) {
        trackriotshield_updateoffhandstowignorec4();
        isinlaststand = namespace_d4aab8c9cb8ecb14::player_in_laststand(self);
        if (!isinlaststand) {
            if (istrue(self.wasinlaststand)) {
                self.laststandforceback = 1;
                self.laststandforcebackendtime = gettime() + 1300;
            } else if (isdefined(self.laststandforcebackendtime) && gettime() >= self.laststandforcebackendtime) {
                self.laststandforceback = undefined;
                self.laststandforcebackendtime = undefined;
            }
            self.wasinlaststand = 0;
        } else {
            self.laststandforceback = undefined;
            self.laststandforcebackendtime = undefined;
            self.wasinlaststand = 1;
        }
        if (self isonladder()) {
            trackriotshield_tryback();
        } else if (self isinexecutionattack()) {
            trackriotshield_tryback();
        } else if (self isinexecutionvictim()) {
            trackriotshield_trydetach();
        } else if (self isparachuting() || self isskydiving()) {
            trackriotshield_tryback();
        } else if (istrue(self.laststandforceback)) {
            trackriotshield_tryback();
        } else if (istrue(self.onriotshieldstow_force)) {
            if (isnullweapon(self getheldoffhand())) {
                self.onriotshieldstow_force = undefined;
                trackriotshield_tryreset();
            } else {
                trackriotshield_tryback();
            }
        } else {
            trackriotshield_tryreset();
        }
        waitframe();
    }
    trackriotshield_tryreset();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x51b6
// Size: 0x4e
function trackriotshield_tryback() {
    onarm = isdefined(self.riotshieldmodel);
    onback = isdefined(self.riotshieldmodelstowed);
    if (!onback) {
        if (onarm) {
            riotshield_move(1);
            return;
        }
        riotshield_attach(0, riotshield_getmodel());
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x520c
// Size: 0x4e
function trackriotshield_tryarm() {
    onarm = isdefined(self.riotshieldmodel);
    onback = isdefined(self.riotshieldmodelstowed);
    if (!onarm) {
        if (onback) {
            riotshield_move(0);
            return;
        }
        riotshield_attach(1, riotshield_getmodel());
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5262
// Size: 0x45
function trackriotshield_trydetach() {
    onarm = isdefined(self.riotshieldmodel);
    onback = isdefined(self.riotshieldmodelstowed);
    if (onarm) {
        riotshield_detach(1);
    }
    if (onback) {
        riotshield_detach(0);
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x52af
// Size: 0x7d
function trackriotshield_tryreset() {
    if (riotshield_hasweapon()) {
        holdingshield = isriotshield(self getcurrentweapon());
        if (holdingshield) {
            trackriotshield_tryarm();
        } else {
            trackriotshield_tryback();
        }
        return;
    }
    onarm = isdefined(self.riotshieldmodel);
    onback = isdefined(self.riotshieldmodelstowed);
    if (onarm) {
        riotshield_detach(1);
    }
    if (onback) {
        riotshield_detach(0);
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5334
// Size: 0x35
function riotshieldonweaponchange(objweapon) {
    if (riotshield_hasweapon()) {
        thread trackriotshield_monitorshieldattach();
        return;
    }
    trackriotshield_tryreset();
    riotshieldclearvars();
    self notify("riotshield_detach");
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5371
// Size: 0x56
function riotshieldclearvars(fromdeath) {
    self.laststandforceback = undefined;
    self.laststandforcebackendtime = undefined;
    self.wasinlaststand = undefined;
    if (istrue(fromdeath)) {
        self.hasriotshield = undefined;
        self.hasriotshieldequipped = undefined;
        self.riotshieldmodel = undefined;
        self.riotshieldmodelstowed = undefined;
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x53cf
// Size: 0xa0
function sniperdustwatcher() {
    self endon("death");
    self endon("disconnect");
    level endon("game_ended");
    for (var_1c3dd0ef777cf9b5 = undefined; ; var_1c3dd0ef777cf9b5 = gettime()) {
        self waittill("weapon_fired");
        if (self getstance() != "prone") {
            continue;
        }
        weap = self getcurrentweapon();
        if (weap.classname != "weapon_sniper") {
            continue;
        }
        playerforward = anglestoforward(self.angles);
        if (!isdefined(var_1c3dd0ef777cf9b5) || gettime() - var_1c3dd0ef777cf9b5 > 2000) {
        }
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5477
// Size: 0x41
function unset_scriptable_part_state_after_time(timer, player) {
    self endon("death");
    wait timer;
    self setscriptablepartstate("projectile", "inactive");
    player notify("ranged_katana_missile_done");
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x54c0
// Size: 0x1d2
function watchmissileusage() {
    self endon("disconnect");
    thread listen_for_custom_proj_dvar();
    for (;;) {
        missile = waittill_missile_fire();
        missiletarget = undefined;
        switch (missile.weapon_name) {
        case #"hash_3e782fd775b72022":
        case #"hash_6b9700922cc910a9":
        case #"hash_a9e31b8ffd42a67b": 
            missiletarget = self.missilelaunchertarget;
            break;
        case #"hash_5cbb3a1a84d47f1d": 
            missiletarget = self.javelin.target;
            break;
        case #"hash_a86d4075406d2de4": 
            missile thread launch_custom_gl_projectile(missile.owner);
            break;
        case #"hash_9987aeedf4f345b3": 
            missile thread grenade_earthquake();
            break;
        case #"hash_b283838fbedf9fb7": 
            missile thread smokegrenadeused(1);
            break;
        case #"hash_a057fdb295ad07f3": 
            missile thread watchconcussiongrenadeexplode();
            break;
        case #"hash_5b21bf4471535b2c": 
            break;
        case #"hash_94b2fc3e696775bc": 
            thread scripts\cp\equipment\cp_thermite::thermite_used(missile, 1);
            break;
        case #"hash_b295af524a2cce5a": 
            thread scripts\cp\equipment\cp_snapshot_grenade::snapshot_grenade_used(missile, 1);
            break;
        default: 
            break;
        }
        if (islockonlauncher(missile.weapon_name) && isdefined(missiletarget)) {
            missile.lockontarget = missiletarget;
            level notify("stinger_fired", self, missile, missiletarget);
            thread watchtargetlockedontobyprojectile(missiletarget, missile);
            if (isdefined(level.var_325647bb596f072c)) {
                level thread [[ level.var_325647bb596f072c ]](missile);
            }
        }
        if (isplayer(self) && isdefined(missile)) {
            missile.adsfire = isplayerads();
        }
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x569a
// Size: 0xc
function issmallmissile(weapon) {
    return false;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x56af
// Size: 0x65
function isexplosivemissile(weapon) {
    baseweaponname = getweaponbasename(weapon);
    switch (baseweaponname) {
    case #"hash_1e6ad4ef0904a0f1":
    case #"hash_1ee2bbd1bc80ea9a":
    case #"hash_4f9064f9a7a4b7d1":
    case #"hash_b833f98278746f9b":
    case #"hash_fe08358bc8f9a34a": 
        return false;
    }
    return true;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x571d
// Size: 0x49
function listen_for_custom_proj_dvar() {
    self endon("disconnect");
    while (true) {
        var_93d22093ddebd2ca = getdvar(@"hash_25d23f0aaaed8d2e", "none");
        if (var_93d22093ddebd2ca != "none") {
            self.gl_proj_override = var_93d22093ddebd2ca;
        }
        wait 0.1;
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x576e
// Size: 0x49
function launch_custom_gl_projectile(missile_owner) {
    var_ae593c6c69ef7d27 = get_custom_gl_projectile(missile_owner);
    if (isdefined(var_ae593c6c69ef7d27)) {
        self delete();
        if (isdefined(level.custom_proj_func[var_ae593c6c69ef7d27])) {
            level thread [[ level.custom_proj_func[var_ae593c6c69ef7d27] ]](missile_owner);
        }
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x57bf
// Size: 0x27
function get_custom_gl_projectile(missile_owner) {
    if (isdefined(missile_owner.gl_proj_override)) {
        return missile_owner.gl_proj_override;
    }
    return undefined;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57ef
// Size: 0x6b
function custom_gl_proj_func_init() {
    level.custom_proj_func["concertina"] = &launchconcertinabomb;
    level.custom_proj_func["thermite"] = &launchthermite;
    level.custom_proj_func["molotov"] = &launchmolotov;
    level.custom_proj_func["semtex"] = &launchstickytimedgrenade;
    level.custom_proj_func["c4"] = &launchc4grenade;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5862
// Size: 0x81
function create_new_projectile(weapon_name, missile_owner) {
    vec = anglestoforward(missile_owner getplayerangles());
    vec *= 2000;
    if (missile_owner tagexists("tag_flash")) {
        var_435a01fbcdf2d764 = missile_owner gettagorigin("tag_flash");
    } else {
        var_435a01fbcdf2d764 = missile_owner geteye();
    }
    gren = missile_owner launchgrenade(weapon_name, var_435a01fbcdf2d764, vec);
    gren.owner = missile_owner;
    return gren;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x58ec
// Size: 0x2c
function launchthermite(missile_owner) {
    gren = create_new_projectile("thermite_proj_cp", missile_owner);
    missile_owner thread scripts\cp\equipment\cp_thermite::thermite_used(gren);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5920
// Size: 0x33
function launchmolotov(missile_owner) {
    gren = create_new_projectile("molotov_mp", missile_owner);
    missile_owner thread scripts\cp\powers\coop_molotov::molotov_used(gren);
    self delete();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x595b
// Size: 0x33
function launchstickytimedgrenade(missile_owner) {
    gren = create_new_projectile("semtex_mp", missile_owner);
    missile_owner thread semtexused(gren);
    self delete();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5996
// Size: 0x33
function launchc4grenade(missile_owner) {
    gren = create_new_projectile("c4_mp", missile_owner);
    missile_owner thread scripts\cp\cp_c4::c4_used(gren);
    self delete();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x59d1
// Size: 0x105
function launchexplosivetiplogic(owner) {
    origin, normal, velocity, entity = self waittill("explode");
    owner endon("disconnect");
    owner endon("joined_team");
    owner endon("joined_spectators");
    model = spawn("script_model", origin);
    model setmodel("offhand_wm_grenade_thermite");
    model setscriptablepartstate("effects", "impact", 0);
    model.trigger = spawn("trigger_radius", model.origin, 0, 125, 72);
    model.trigger thread watch_for_thermite_triggered(owner);
    wait 0.5;
    ticks = 1;
    while (ticks <= 10) {
        curtick = ticks + 1;
        ticks = curtick;
        wait 0.5;
    }
    model thread bolt_destroy();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5ade
// Size: 0x90
function wait_for_crate_drop_to_ground(dropcrate) {
    ground_pos = drop_to_ground(dropcrate.origin + (0, 0, -100), 0, -5000);
    var_6d3a9738e44f853d = 900;
    var_1a352d2b513c6da9 = 1000;
    time_passed = 0;
    while (true) {
        if (distancesquared(dropcrate.origin, ground_pos) <= var_6d3a9738e44f853d) {
            return ground_pos;
        }
        if (time_passed >= var_1a352d2b513c6da9) {
            return ground_pos;
        }
        time_passed += 50;
        waitframe();
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5b76
// Size: 0x94
function watch_for_thermite_triggered(owner) {
    self endon("end_thermite_trigger");
    self endon("death");
    while (true) {
        victim = self waittill("trigger");
        if (isplayer(victim)) {
            continue;
        }
        if (!victim is_soldier_agent()) {
            continue;
        }
        if (isalive(victim) && !istrue(victim.marked_for_death)) {
            victim.marked_for_death = 1;
            thread watch_for_victim_death(victim);
            victim thread damage_over_time(victim, owner, 2.5, 100, "MOD_EXPLOSIVE");
        }
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5c12
// Size: 0x4c
function watch_for_victim_death(victim) {
    self endon("death");
    victim waittill("death");
    victim.marked_for_death = undefined;
    playfx(level._effect["vfx_thermite_end"], victim.origin);
    self delete();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5c66
// Size: 0x3f
function bolt_destroy() {
    self setscriptablepartstate("effects", "burnEnd", 0);
    self notify("end_thermite_trigger");
    if (isdefined(self.trigger)) {
        self.trigger delete();
    }
    self delete();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5cad
// Size: 0x81
function waitfortriggernotify(player) {
    self endon("death");
    while (true) {
        victim = self waittill("trigger");
        if (isplayer(victim)) {
            continue;
        }
        if (!victim is_soldier_agent()) {
            continue;
        }
        if (isalive(victim) && !istrue(victim.marked_for_death)) {
            victim.marked_for_death = 1;
            victim thread damage_over_time(victim, player, 5, 100, "MOD_EXPLOSIVE");
        }
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5d36
// Size: 0x61
function launchconcertinabomb(player) {
    stuckto, stuckpart = self waittill("missile_stuck");
    trigger = spawn("trigger_radius", self.origin, 0, 500, 72);
    trigger thread waitfortriggernotify(player);
    wait 6;
    trigger delete();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5d9f
// Size: 0x41
function removelinkafterdelay(var_c9c04a2e50ed1560, delay) {
    wait delay;
    if (array_contains(level.strrazorlinks, var_c9c04a2e50ed1560)) {
        level.strrazorlinks = array_remove(level.strrazorlinks, var_c9c04a2e50ed1560);
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5de8
// Size: 0x5b6
function lockonlaunchers_gettargetarray(addcharacters) {
    targets = [];
    var_e688b198aa9a4b3f = 0;
    /#
        var_e688b198aa9a4b3f = getdvarint(@"hash_10368af4dee3ba2c", 0);
    #/
    if (level.teambased) {
        if (isdefined(addcharacters) && addcharacters == 1) {
            foreach (char in level.characters) {
                if (isdefined(char) && isalive(char) && (char.team != self.team || var_e688b198aa9a4b3f)) {
                    targets[targets.size] = char;
                }
            }
        }
        if (isdefined(level.activekillstreaks)) {
            foreach (streak in level.activekillstreaks) {
                if (isdefined(streak.affectedbylockon) && (streak.team != self.team || var_e688b198aa9a4b3f)) {
                    targets[targets.size] = streak;
                }
            }
        }
        if (isdefined(level.special_lockon_target_list)) {
            foreach (special_target in level.special_lockon_target_list) {
                targets[targets.size] = special_target;
            }
        }
        if (isdefined(level.cratedropdata)) {
            if (isdefined(level.cratedropdata.ac130s)) {
                foreach (ac130 in level.cratedropdata.ac130s) {
                    if (ac130.team != self.team || var_e688b198aa9a4b3f) {
                        targets[targets.size] = ac130;
                    }
                }
            }
        }
        foreach (vehicleref in scripts\cp_mp\vehicles\vehicle::function_9005b7fc076293f8()) {
            vehicles = scripts\cp_mp\vehicles\vehicle_tracking::vehicle_tracking_getgameinstances(vehicleref);
            foreach (vehicle in vehicles) {
                if (!scripts\cp_mp\vehicles\vehicle::vehicle_isfriendlytoplayer(vehicle, self) || var_e688b198aa9a4b3f) {
                    targets[targets.size] = vehicle;
                }
            }
        }
    } else {
        if (isdefined(addcharacters) && addcharacters == 1) {
            foreach (char in level.characters) {
                if ((!isdefined(char) || !isalive(char)) && !var_e688b198aa9a4b3f) {
                    continue;
                }
                targets[targets.size] = char;
            }
        }
        if (isdefined(level.activekillstreaks)) {
            foreach (streak in level.activekillstreaks) {
                if (isdefined(streak.affectedbylockon) && (isdefined(streak.owner) && streak.owner != self || var_e688b198aa9a4b3f)) {
                    targets[targets.size] = streak;
                }
            }
        }
        if (isdefined(level.cratedropdata)) {
            if (isdefined(level.cratedropdata.ac130s)) {
                foreach (ac130 in level.cratedropdata.ac130s) {
                    if (ac130.owner != self || var_e688b198aa9a4b3f) {
                        targets[targets.size] = ac130;
                    }
                }
            }
        }
        foreach (vehicleref in scripts\cp_mp\vehicles\vehicle::function_9005b7fc076293f8()) {
            vehicles = scripts\cp_mp\vehicles\vehicle_tracking::vehicle_tracking_getgameinstances(vehicleref);
            foreach (vehicle in vehicles) {
                if (!isdefined(vehicle.owner)) {
                    targets[targets.size] = vehicle;
                    continue;
                }
                if (vehicle.owner != self || var_e688b198aa9a4b3f) {
                    targets[targets.size] = vehicle;
                }
            }
        }
    }
    foreach (target in targets) {
        if (!isvector(target.origin)) {
            targets = array_remove(targets, target);
        }
    }
    return targets;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x63a7
// Size: 0x4e
function add_to_special_lockon_target_list(target) {
    if (!isdefined(level.special_lockon_target_list)) {
        level.special_lockon_target_list = [];
    }
    if (!scripts\engine\utility::array_contains(level.special_lockon_target_list, target)) {
        level.special_lockon_target_list = scripts\engine\utility::array_add(level.special_lockon_target_list, target);
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x63fd
// Size: 0x4e
function remove_from_special_lockon_target_list(target) {
    if (!isdefined(level.special_lockon_target_list)) {
        level.special_lockon_target_list = [];
    }
    if (scripts\engine\utility::array_contains(level.special_lockon_target_list, target)) {
        level.special_lockon_target_list = scripts\engine\utility::array_remove(level.special_lockon_target_list, target);
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6453
// Size: 0xd3
function getrandomdirection(startpoint, var_349d8e7cd03aa703) {
    var_a788fb3849c0448 = anglestoup(var_349d8e7cd03aa703);
    var_eb1a50452e343bfd = anglestoright(var_349d8e7cd03aa703);
    var_d2afe6f56551b342 = anglestoforward(var_349d8e7cd03aa703);
    var_9baaaa8b62b09702 = randomint(360);
    var_39ccad51d40f1872 = randomint(360);
    x = cos(var_39ccad51d40f1872) * sin(var_9baaaa8b62b09702);
    y = sin(var_39ccad51d40f1872) * sin(var_9baaaa8b62b09702);
    z = cos(var_9baaaa8b62b09702);
    delta = (x * var_eb1a50452e343bfd + y * var_d2afe6f56551b342 + z * var_a788fb3849c0448) / 0.33;
    return -1 * delta;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x652f
// Size: 0xb4
function waittill_missile_fire() {
    missile, objweapon = self waittill("missile_fire");
    if (isdefined(missile)) {
        if (!isdefined(missile.weapon_name)) {
            if (objweapon.isalternate) {
                missile.weapon_name = objweapon.underbarrel;
            } else {
                missile.weapon_name = objweapon.basename;
            }
        }
        if (!isdefined(missile.owner)) {
            missile.owner = self;
        }
        if (!isdefined(missile.team)) {
            missile.team = self.team;
        }
    }
    return missile;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x65ec
// Size: 0x113
function onplayerspawned() {
    self endon("disconnect");
    for (;;) {
        self waittill("spawned_player");
        self.currentweaponatspawn = self getcurrentweapon();
        self.empendtime = 0;
        self.concussionendtime = 0;
        self.hits = 0;
        if (!isdefined(self.trackingweapon)) {
            self.trackingweapon = nullweapon();
            self.trackingweaponshots = 0;
            self.trackingweaponkills = 0;
            self.var_e16d751a51153a7b = 0;
            self.trackingweaponhits = 0;
            self.trackingweaponheadshots = 0;
            self.trackingweapondeaths = 0;
        }
        riotshieldclearvars(1);
        thread watchgrenadeusage();
        thread player_watchWeaponClip();
        thread scripts\cp\equipment\cp_adrenaline::listen_for_adrenaline_use();
        thread stancerecoiladjuster();
        thread initlauncherlogic();
        self.lasthittime = [];
        self.droppeddeathweapon = undefined;
        self.tookweaponfrom = [];
        thread watchforweaponchange();
        thread watchforweapondropped();
        thread monitorlauncherspawnedgrenades();
        self.currentweaponatspawn = undefined;
        self.trophyremainingammo = undefined;
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6707
// Size: 0x60
function initlauncherlogic() {
    weapon = self getcurrentweapon();
    switch (weapon.basename) {
    case #"hash_3e782fd775b72022":
    case #"hash_a9e31b8ffd42a67b": 
        thread scripts\cp\cp_missilelauncher::missilelauncherusageloop();
        break;
    case #"hash_5c272c0617caebf0": 
        thread scripts\cp\equipment\cp_javelin::javelinusageloop();
        break;
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x676f
// Size: 0x1eb
function updatelauncherusage() {
    weapon = self getcurrentweapon();
    switch (weapon.basename) {
    case #"hash_3e782fd775b72022":
    case #"hash_a07a7676714a498f":
    case #"hash_a9e31b8ffd42a67b": 
        thread scripts\cp\cp_missilelauncher::initmissilelauncherusage();
        break;
    case #"hash_5c272c0617caebf0":
    case #"hash_5cbb3a1a84d47f1d": 
        thread scripts\cp\equipment\cp_javelin::javelin_reset();
        break;
    case #"hash_47a0edaf0798f8c4":
    case #"hash_87262a67e163f7c9":
    case #"hash_8d9ae5e5dd390b4b": 
        thread scripts\cp_mp\crossbow::initcrossbowusage();
        break;
    case #"hash_78063db94e7df144": 
        thread scripts\cp_mp\xmike109::initusage();
        break;
    default: 
        break;
    }
    self notify("end_launcher");
    if (_hasperk("specialty_fastreload_launchers")) {
        islauncher = weaponclass(weapon.basename) == "rocketlauncher";
        if (islauncher && !istrue(self.fastreloadlaunchers)) {
            giveperk("specialty_fastreload");
            self.fastreloadlaunchers = 1;
        } else if (istrue(self.fastreloadlaunchers)) {
            _unsetperk("specialty_fastreload");
            self.fastreloadlaunchers = undefined;
        }
    }
    switch (weapon.basename) {
    case #"hash_87262a67e163f7c9":
    case #"hash_9a855bc1e9e860f6": 
        thread scripts\cp_mp\crossbow::crossbowusageloop(weapon);
        break;
    case #"hash_3e782fd775b72022":
    case #"hash_a9e31b8ffd42a67b": 
        thread scripts\cp\cp_missilelauncher::missilelauncherusageloop();
        break;
    case #"hash_5c272c0617caebf0": 
        thread scripts\cp\equipment\cp_javelin::javelinusageloop();
        break;
    case #"hash_78063db94e7df144": 
        thread scripts\cp_mp\xmike109::usageloop(weapon);
        break;
    default: 
        break;
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6962
// Size: 0x5e
function watchforweapondropped() {
    self endon("disconnect");
    self notify("watchForWeaponDropped");
    self endon("watchForWeaponDropped");
    while (true) {
        droppedent, objweapon = self waittill("weapon_dropped");
        if (isdefined(droppedent) && isdefined(objweapon)) {
            self.storedweapons[objweapon.basename] = undefined;
        }
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x69c8
// Size: 0x93
function monitorlauncherspawnedgrenades() {
    self endon("disconnect");
    self endon("death");
    self endon("faux_spawn");
    for (;;) {
        grenade = waittill_grenade_fire();
        if (isdefined(grenade.weapon_name)) {
            if (glprox_trygetweaponname(grenade.weapon_name) == "stickglprox") {
                semtexused(grenade);
            }
            switch (grenade.weapon_name) {
            case #"hash_4c7de5619284e175":
            case #"hash_7077355e40138b5f": 
                thread scripts\cp\equipment\cp_thermite::thermite_used(grenade);
                break;
            }
        }
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6a63
// Size: 0xa7
function glprox_trygetweaponname(weapon) {
    if (isweapon(weapon) && isnullweapon(weapon)) {
        return weapon;
    }
    if (isstring(weapon) && weapon == "none") {
        return weapon;
    }
    if (getweaponbasename(weapon) == "iw7_glprox_mp") {
        if (isstring(weapon) && isaltmodeweapon(weapon) || isweapon(weapon) && weapon.isalternate) {
            attachments = getweaponattachments(weapon);
            assertex(attachments.size == 1, "The iw7_glprox_mp should only ever have one attachment that is an underbarrel.");
            weapon = attachments[0];
        } else {
            weapon = getweaponbasename(weapon);
        }
    }
    return weapon;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b13
// Size: 0x112
function stancerecoiladjuster() {
    self endon("death");
    self endon("disconnect");
    self endon("faux_spawn");
    if (!isplayer(self)) {
        return;
    }
    self notifyonplayercommand("adjustedStance", "+stance");
    self notifyonplayercommand("adjustedStance", "+goStand");
    if (!self isconsoleplayer() && !isai(self)) {
        self notifyonplayercommand("adjustedStance", "+togglecrouch");
        self notifyonplayercommand("adjustedStance", "toggleprone");
        self notifyonplayercommand("adjustedStance", "+movedown");
        self notifyonplayercommand("adjustedStance", "-movedown");
        self notifyonplayercommand("adjustedStance", "+prone");
        self notifyonplayercommand("adjustedStance", "-prone");
    }
    for (;;) {
        waittill_any_3("adjustedStance", "sprint_begin", "weapon_change");
        wait 0.5;
        if (isdefined(self.onhelisniper) && self.onhelisniper) {
            continue;
        }
        stance = self getstance();
        stancerecoilupdate(stance);
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6c2d
// Size: 0x142
function stancerecoilupdate(stance) {
    weapon = self getcurrentprimaryweapon();
    sniperreduction = 0;
    if (isrecoilreducingweapon(weapon)) {
        sniperreduction = getrecoilreductionvalue();
    }
    if (stance == "prone") {
        weapclass = weapon.classname;
        if (isdefined(weapclass)) {
            if (weapclass == "weapon_lmg") {
                setrecoilscale(0, 40);
            } else if (weapclass == "weapon_sniper") {
                if (weapon hasattachment("barrelbored")) {
                    setrecoilscale(0, 20 + sniperreduction);
                } else {
                    setrecoilscale(0, 40 + sniperreduction);
                }
            }
        } else {
            setrecoilscale();
        }
        return;
    }
    if (stance == "crouch") {
        weapclass = weapon.classname;
        if (isdefined(weapclass)) {
            if (weapclass == "weapon_lmg") {
                setrecoilscale(0, 10);
            } else if (weapclass == "weapon_sniper") {
                if (weapon hasattachment("barrelbored")) {
                    setrecoilscale(0, 10 + sniperreduction);
                } else {
                    setrecoilscale(0, 20 + sniperreduction);
                }
            }
        } else {
            setrecoilscale();
        }
        return;
    }
    if (sniperreduction > 0) {
        setrecoilscale(0, sniperreduction);
        return;
    }
    setrecoilscale();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6d77
// Size: 0xc0
function setrecoilscale(scaler, scaleoverride) {
    if (!isdefined(scaler)) {
        scaler = 0;
    }
    if (!isdefined(self.recoilscale)) {
        self.recoilscale = scaler;
    } else {
        self.recoilscale += scaler;
    }
    if (isdefined(scaleoverride)) {
        if (isdefined(self.recoilscale) && scaleoverride < self.recoilscale) {
            scaleoverride = self.recoilscale;
        }
        scale = 100 - scaleoverride;
    } else {
        scale = 100 - self.recoilscale;
    }
    if (scale < 0) {
        scale = 0;
    }
    if (scale > 100) {
        scale = 100;
    }
    if (scale == 100) {
        self player_recoilscaleoff();
        return;
    }
    self player_recoilscaleon(scale);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6e3f
// Size: 0xc
function isrecoilreducingweapon(weapon) {
    return false;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6e54
// Size: 0x38
function getrecoilreductionvalue() {
    if (!isdefined(self.pers["recoilReduceKills"])) {
        self.pers["recoilReduceKills"] = 0;
    }
    return self.pers["recoilReduceKills"] * 40;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6e95
// Size: 0x12f
function watchforweaponchange() {
    self endon("death");
    self endon("disconnect");
    self endon("faux_spawn");
    self notify("watchForWeaponChange");
    self endon("watchForWeaponChange");
    for (;;) {
        objweapon = self waittill("weapon_change");
        if (isnullweapon(objweapon)) {
            continue;
        }
        if (isvalidweapon(objweapon)) {
            self.last_valid_weapon = objweapon;
        }
        if (!isdefined(self.storedweapons)) {
            self.storedweapons = [];
        }
        if (!isdefined(self.storedweapons[objweapon.basename])) {
            self.storedweapons[objweapon.basename] = getcompleteweaponname(objweapon);
        }
        thread updatelauncherusage();
        if (iskillstreakweapon(objweapon)) {
            continue;
        }
        if (is_launcher(objweapon) && !is_killstreak_weapon(objweapon)) {
            objweapon = remove_launcher_xmags(objweapon);
            if (isdefined(level.set_relics)) {
                if (isdefined(level.set_relics["relic_rocket_kill_ammo"])) {
                    self disableemptyclipweaponswitch(1);
                }
            }
            continue;
        }
        if (isdefined(level.set_relics)) {
            if (isdefined(level.set_relics["relic_rocket_kill_ammo"])) {
                self disableemptyclipweaponswitch(0);
            }
        }
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6fcc
// Size: 0xbf
function drop_minigun(player) {
    player notify("dropping_minigun");
    miniguns = ["iw9_minigunksjugg_mp", "iw9_lm_dblmg2_cp"];
    var_1edb8d5c60b8182a = "iw9_lm_dblmg2_cp";
    foreach (var_37ede289a37ef621 in miniguns) {
        if (player hasweapon(var_37ede289a37ef621)) {
            var_1edb8d5c60b8182a = var_37ede289a37ef621;
        }
    }
    currentweapon = makeweapon(var_1edb8d5c60b8182a);
    droppedgun = player dropitem(currentweapon);
    droppedgun thread watchweaponpickup();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7093
// Size: 0x68
function watch_minigun_ammo_depleted(player, objweapon) {
    player endon("death");
    player endon("disconnect");
    player endon("faux_spawn");
    player endon("dropping_minigun");
    player notify("watchMinigunAmmo");
    player endon("watchMinigunAmmo");
    while (true) {
        var_5831ba9bb12b4d9b = player getweaponammoclip(objweapon);
        if (var_5831ba9bb12b4d9b <= 0) {
            player takeweapon(objweapon);
            return;
        }
        waitframe();
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7103
// Size: 0x3a
function picking_up_minigun(objweapon) {
    if (objweapon.basename == "iw9_lm_dblmg2_cp") {
        return true;
    }
    if (objweapon.basename == "iw9_minigunksjugg_mp") {
        return true;
    }
    return false;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7146
// Size: 0x46
function switch_weapon_from_minigun(player, objweapon) {
    if (objweapon.basename == "iw9_lm_dblmg2_cp") {
        return 0;
    }
    if (objweapon.basename == "iw9_minigunksjugg_mp") {
        return 0;
    }
    return player_has_minigun(player);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7195
// Size: 0x90
function player_has_minigun(player) {
    miniguns = ["iw9_minigunksjugg_mp", "iw9_lm_dblmg2_cp"];
    foreach (var_37ede289a37ef621 in miniguns) {
        if (player hasweapon(var_37ede289a37ef621)) {
            return true;
        }
        if (player getcurrentweapon().basename == var_37ede289a37ef621) {
            return true;
        }
    }
    return false;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x722e
// Size: 0x7c
function is_launcher(weapon) {
    class = weaponclass(weapon);
    if (class == "rocketlauncher") {
        return true;
    }
    switch (weapon.basename) {
    case #"hash_3e782fd775b72022":
    case #"hash_5cbb3a1a84d47f1d":
    case #"hash_a9e31b8ffd42a67b":
    case #"hash_e704ecf8710c6f57":
    case #"hash_f55c20924061bd15": 
        return true;
    }
    return false;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x72b3
// Size: 0x47
function is_killstreak_weapon(weapon) {
    switch (weapon.basename) {
    case #"hash_1e63c8ef08fe7ddf":
    case #"hash_1ecfb7d1bc71d9c4": 
        return 1;
    default: 
        return 0;
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7302
// Size: 0xb8
function add_launcher_xmags(weapon) {
    attachment = "xmags_cp_gromeo";
    switch (weapon.basename) {
    case #"hash_3e782fd775b72022":
    case #"hash_a9e31b8ffd42a67b": 
        attachment = "xmags_cp_gromeo";
        break;
    case #"hash_5cbb3a1a84d47f1d": 
        attachment = "xmags_cp_juliet";
        break;
    case #"hash_e704ecf8710c6f57": 
        attachment = "xmags_cp_kgolf";
        break;
    case #"hash_f55c20924061bd15": 
        attachment = "xmags_cp_rpapa7";
        break;
    default: 
        break;
    }
    if (!weapon hasattachment(attachment)) {
        weapon = addattachmenttoweapon(weapon, attachment, 1);
    }
    return weapon;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x73c3
// Size: 0xb6
function remove_launcher_xmags(weapon) {
    attachment = "xmags_cp_gromeo";
    switch (weapon.basename) {
    case #"hash_3e782fd775b72022":
    case #"hash_a9e31b8ffd42a67b": 
        attachment = "xmags_cp_gromeo";
        break;
    case #"hash_5cbb3a1a84d47f1d": 
        attachment = "xmags_cp_juliet";
        break;
    case #"hash_e704ecf8710c6f57": 
        attachment = "xmags_cp_kgolf";
        break;
    case #"hash_f55c20924061bd15": 
        attachment = "xmags_cp_rpapa7";
        break;
    default: 
        break;
    }
    if (weapon hasattachment(attachment)) {
        remove_attachment(attachment, self, weapon);
    }
    return weapon;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7482
// Size: 0x1b
function isfistweapon(weapon) {
    weapon = getweaponrootname(weapon);
    return weapon == "iw9_me_fists";
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x74a6
// Size: 0x67
function isgunlessweapon(weapon) {
    weapname = undefined;
    if (isweapon(weapon)) {
        if (isnullweapon(weapon)) {
            return false;
        }
        weapname = weapon.basename;
    } else {
        if (weapon == "none") {
            return false;
        }
        weapname = weapon;
    }
    return weapname == "iw8_gunless" || weapname == "iw8_gunless_infil" || weapname == "iw8_gunless_last_stand_enter";
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7516
// Size: 0x7a
function isvalidweapon(newweapon) {
    exclusionlist = level.additional_laststand_weapon_exclusion;
    newweaponobj = undefined;
    if (isweapon(newweapon)) {
        newweaponobj = newweapon;
    } else {
        newweaponobj = makeweaponfromstring(newweapon);
    }
    if (isnullweapon(newweaponobj)) {
        return 0;
    }
    if (isdefined(exclusionlist) && array_contains(exclusionlist, newweaponobj)) {
        return 0;
    }
    if (is_melee_weapon(newweaponobj, 1)) {
        return 0;
    }
    return 1;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7598
// Size: 0xb1
function ai_offhandfiremanager() {
    self endon("death");
    while (true) {
        grenade, weapon = self waittill("grenade_fire");
        grenade.owner = self;
        switch (weapon.basename) {
        case #"hash_ab3485fa6834de47": 
            level thread scripts\cp\powers\coop_molotov::ai_molotov_used(self, grenade);
            break;
        case #"hash_4cd748aa3895508a": 
            thread scripts\cp\equipment\cp_gas_grenade::gas_used(grenade);
            break;
        case #"hash_34e7a4cd11aed6bc": 
            grenade thread watchconcussiongrenadeexplode();
            break;
        case #"hash_4c7de5619284e175": 
            grenade thread scripts\cp\equipment\cp_thermite::thermite_watchstuck();
            break;
        }
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7651
// Size: 0xe6
function watchgrenadeusage() {
    self notify("watchGrenadeUsage");
    self endon("watchGrenadeUsage");
    self endon("spawned_player");
    self endon("disconnect");
    self endon("faux_spawn");
    self.throwinggrenade = undefined;
    self.gotpullbacknotify = 0;
    if (!isdefined(self.plantedlethalequip)) {
        self.plantedlethalequip = [];
        self.plantedtacticalequip = [];
    }
    while (true) {
        objweapon = self waittill("grenade_pullback");
        var_d9bcccd17a53d67b = self getthrowbackweapon();
        if (!isnullweapon(var_d9bcccd17a53d67b)) {
            continue;
        }
        weaponname = objweapon.basename;
        thread watchoffhandcancel();
        self.throwinggrenade = weaponname;
        if (weaponname == "c4_mp") {
            thread beginc4tracking();
        }
        begingrenadetracking();
        thread namespace_751288259782653c::function_48c0bdf6dd0f6dde();
        self.throwinggrenade = undefined;
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x773f
// Size: 0x51
function watchoffhandcancel() {
    self endon("death");
    self endon("disconnect");
    self endon("faux_spawn");
    self endon("grenade_fire");
    self waittill("offhand_end");
    if (isdefined(self.changingweapon) && self.changingweapon != self getcurrentweapon()) {
        self.changingweapon = undefined;
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7798
// Size: 0x3f
function beginc4tracking() {
    self notify("beginC4Tracking");
    self endon("beginC4Tracking");
    self endon("death");
    self endon("disconnect");
    waittill_any_3("grenade_fire", "weapon_change", "offhand_end");
    self.changingweapon = undefined;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x77df
// Size: 0x6c
function dudgrenadeused(owner) {
    owner endon("disconnect");
    thread ownerdisconnectcleanup(owner);
    thread notifyafterframeend("death", "end_explode");
    self endon("end_explode");
    position = self waittill("explode");
    /#
        owner iprintln("<dev string:xe1>");
        wait 1;
        owner iprintln("<dev string:xfc>");
    #/
    self delete();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7853
// Size: 0x85b
function begingrenadetracking() {
    self endon("offhand_end");
    starttime = gettime();
    grenade = waittill_grenade_fire();
    if (!isdefined(grenade)) {
        return;
    }
    if (!isdefined(grenade.weapon_name)) {
        return;
    }
    var_49e6ef3edadd524e = grenade.weapon_name;
    if (isdefined(grenade.weapon_object)) {
        var_49e6ef3edadd524e = function_f581838ce4328f7a(grenade.weapon_object);
    }
    if (!isdefined(var_49e6ef3edadd524e)) {
        var_49e6ef3edadd524e = grenade.weapon_name;
    }
    self.changingweapon = undefined;
    switch (var_49e6ef3edadd524e) {
    case #"hash_42dcb6ce7ecb709c":
    case #"hash_aedcc540fcb8773a":
    case #"hash_aec9c140fca96664": 
        thread scripts\cp\equipment\cp_snapshot_grenade::snapshot_grenade_used(grenade);
        break;
    case #"hash_c675eaaa9ab95a7":
    case #"hash_c3b4aaaa988e3e9":
    case #"hash_ab0871fa68122c89":
    case #"hash_ab3485fa6834de47":
    case #"hash_c9a436974fe60919":
    case #"hash_9b7aae34cefc69f2": 
        thread scripts\cp\powers\coop_molotov::molotov_used(grenade);
        self.last_molotov_throw_time = gettime();
        break;
    case #"hash_53b56552dcba7edd":
    case #"hash_da7316c483b6c780":
    case #"hash_3847373267d18fbd":
    case #"hash_839f6714e63befbe": 
        namespace_f5646b93b4a7b6d4::throwcrate(grenade);
        break;
    case #"hash_3ffc3493f76d6b47":
    case #"hash_5f4edaea7e49dd41": 
        grenade thread dudgrenadeused(self);
        grenade thread grenade_earthquake();
        break;
    case #"hash_5e4ccaa178cac19c":
    case #"hash_dd4d572af14a12c2":
    case #"hash_7c03088193266bc4":
    case #"hash_81b07c7e9a3e0da2":
    case #"hash_5e2ccea178b13002":
    case #"hash_5e7bbfa178ef8124":
    case #"hash_81d0787e9a579f3c": 
        if (gettime() - starttime > 1000) {
            grenade.iscooked = 1;
        }
        grenade thread watchfraggrenadeexplode();
        grenade.originalowner = self;
        break;
    case #"hash_a0319e349a692b8f":
    case #"hash_4cf48e05bdc8cd55":
    case #"hash_4cd49205bdaf3bbb":
    case #"hash_4c7de5619284e175":
    case #"hash_4c5de961926b4fdb": 
        thread scripts\cp\equipment\cp_thermite::thermite_used(grenade);
        break;
    case #"hash_140bbbbf54acf7c":
    case #"hash_67e9c23b56b755dc": 
        grenade.clusterticks = grenade.ticks;
        if (grenade.ticks >= 1) {
            grenade.iscooked = 1;
        }
        grenade.originalowner = self;
        grenade thread clustergrenadeused();
        grenade thread grenade_earthquake();
        break;
    case #"hash_5d11ac1131cddab1":
    case #"hash_37ad8039ea91a8a5":
    case #"hash_4b87af60037f526f":
    case #"hash_4ba3c260039536a7": 
        thread semtexused(grenade);
        break;
    case #"hash_8059d93d3568c07":
    case #"hash_fb36696c0708bf42":
    case #"hash_cac2107b8e726d9d":
    case #"hash_cad4f47b8e814c13": 
        thread scripts\cp\equipment\cp_gas_grenade::gas_used(grenade);
        break;
    case #"hash_cedad6d52b2b36c2":
    case #"hash_7983828e72e83a3e":
    case #"hash_22f1c67a16accbe": 
        if (issharedfuncdefined("super_hb_sensor", "hb_sensor_used")) {
            thread function_f3bb4f4911a1beb2("super_hb_sensor", "hb_sensor_used", grenade);
        }
        break;
    case #"hash_fa1e80f6bd5b8e72":
    case #"hash_c45a15aa87087124":
    case #"hash_c46d19aa871781fa":
    case #"hash_56ee829cc162271a": 
        thread scripts\cp\cp_c4::c4_used(grenade);
        break;
    case #"hash_435258fc47768fa7":
    case #"hash_36b7174a04de8799":
    case #"hash_432644fc4753dde9":
    case #"hash_6a2e4f9c54756dc7": 
        thread scripts\cp\cp_claymore::claymore_use(grenade);
        break;
    case #"hash_5e8f81314553dd36":
    case #"hash_9d57562863499a06": 
        thread scripts\cp\equipment\cp_at_mine::at_mine_use(grenade);
        break;
    case #"hash_13d1f84d0ae96a5f":
    case #"hash_5e3fa526a48eaaa5":
    case #"hash_5e1fa926a475190b": 
        thread scripts\cp\equipment\cp_trophy_system::trophy_used(grenade);
        break;
    case #"hash_a68928468343f517":
    case #"hash_af8ceb5f2fc2f9cd": 
        if (issharedfuncdefined("super_tac_insert", "tac_insert_used")) {
            self thread [[ getsharedfunc("super_tac_insert", "tac_insert_used") ]](grenade);
        }
        break;
    case #"hash_8670ac083666f3a4":
    case #"hash_34e7a4cd11aed6bc": 
        grenade thread watchconcussiongrenadeexplode();
        break;
    case #"hash_eeb591a8f50a5869":
    case #"hash_d9cbc629e947d1b7": 
        thread mineused(grenade, &spawnmine);
        break;
    case #"hash_34c66d62f0d29ab0":
    case #"hash_2ab98cab4066a74e":
    case #"hash_34f28162f0f54c6e":
    case #"hash_b0e358318ab96277": 
        scripts\cp_mp\equipment\throwing_knife::throwing_knife_used(grenade);
        break;
    case #"hash_aa2662d15f62dc87": 
        level thread function_756a543a0b8f6670(self, grenade, grenade.weapon_name);
        break;
    case #"hash_23ca89fe3813464":
    case #"hash_7990c79c9b8e6b7c": 
        grenade delete();
        break;
    case #"hash_e3575fdd14663ca9":
    case #"hash_e1f6f84e4cd950eb": 
        grenade thread smokegrenadeused();
        break;
    case #"hash_eec4a41906598dfc":
    case #"hash_2f4cc7cb802a8be4": 
        break;
    case #"hash_e042760d17966848":
    case #"hash_3dbe213ef2fabb76":
    case #"hash_3dc42d3ef2ff4b88":
    case #"hash_d06b94adddd3dd56":
    case #"hash_d072a0adddda0068": 
        grenade.ninebangticks = grenade.ticks;
        grenade thread watchflashgrenadeexplode();
        if (grenade.ticks >= 1) {
            grenade.iscooked = 1;
        }
        break;
    case #"hash_d197e38e5fa659dd":
    case #"hash_6d18de18477a4e33": 
        thread function_3d5c1674387c936e(grenade);
        break;
    case #"hash_333525cef39d0c66":
    case #"hash_9ca85335d506dad6": 
        thread namespace_e31e5dae9e397e2::decoy_used(grenade);
        break;
    case #"hash_7ae0f6243b0109fa":
    case #"hash_954bb5f200a1b95a":
    case #"hash_11a03a12f93f62b2": 
        thread namespace_48d31ba9c6709870::function_54655641d3957e3(grenade);
        break;
    case #"hash_4a85ee2b82965fe2":
    case #"hash_64358af9c6c1edea": 
        thread namespace_c0f5082c23e045e0::function_2d117eeb564f6ea3(grenade);
        break;
    case #"hash_d6565ec12efca627":
    case #"hash_d9108a0595d7d0b9": 
        thread namespace_eaad1691b6207457::function_3d78dd516c25ef77(grenade);
        break;
    case #"hash_dcbfe1b308421be9":
    case #"hash_91ae9356f1911e97":
    case #"hash_f29daff1ad509837": 
        thread namespace_97bfc19addb080f3::bottle_used(grenade);
        break;
    case #"hash_b4a17c60413030e7":
    case #"hash_6bc36a1e4f485a79":
    case #"hash_7e0a03ed7c4c87be":
    case #"hash_f2e793d6a4fe013e": 
        namespace_f5646b93b4a7b6d4::throwcrate(grenade);
        break;
    case #"hash_17d5fde761fc574b":
    case #"hash_e4aed4089cbf3bc9": 
        success = tac_cover_on_fired(undefined, undefined, undefined, 1);
        if (istrue(success)) {
            thread scripts\cp\powers\cp_tactical_cover::tac_cover_used(grenade);
            foreach (player in level.players) {
                player thread scripts\cp\cp_hud_message::showsplash("cp_used_deployable_cover", undefined, self);
            }
        }
        break;
    case #"hash_17c70dc48424ba92": 
        thread namespace_24eab479b5a8280c::breacher_drone_used(grenade);
        break;
    }
    if (isdefined(grenade)) {
        grenade thread scripts\cp\cp_player_battlechatter::grenadeproximitytracking();
        scripts\cp\cp_player_battlechatter::ongrenadeuse(grenade);
        namespace_27c74152ccb91331::function_ef6885141252869(self, grenade);
    }
    if (isdefined(grenade) && isdefined(grenade.equipmentref)) {
        namespace_47366e00aa4211f4::autorefillequipmentammo(grenade.equipmentref);
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x80b6
// Size: 0x20
function function_3d5c1674387c936e(grenade) {
    waitframe();
    if (isdefined(grenade)) {
        grenade delete();
    }
    self notify("geigercounter_putaway");
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x80de
// Size: 0x59
function rat_executevisuals(var_31ed809382e5c603) {
    level endon("game_ended");
    self endon("disconnect");
    self playlocalsound("eye_pulse_plr_lr");
    self setscriptablepartstate("rat_eye_pulse", "active");
    waittill_any_timeout_2(var_31ed809382e5c603, "last_stand", "death");
    self setscriptablepartstate("rat_eye_pulse", "inactive");
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x813f
// Size: 0xd2
function placeequipmentfailed(weapon, showfx, position, angles) {
    assert(isdefined(showfx) && isdefined(position) || !isdefined(showfx) && !isdefined(position));
    if (isplayer(self)) {
        self playlocalsound("scavenger_pack_pickup");
    }
    if (istrue(showfx)) {
        fxent = undefined;
        if (isplayer(self)) {
            if (isdefined(angles)) {
                fxent = spawnfxforclient(getfx("placeEquipmentFailed"), position, self, anglestoforward(angles), anglestoup(angles));
            } else {
                fxent = spawnfxforclient(getfx("placeEquipmentFailed"), position, self);
            }
        } else {
            fxent = spawnfx(getfx("placeEquipmentFailed"), position);
        }
        triggerfx(fxent);
        thread placeequipmentfailedcleanup(fxent);
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8219
// Size: 0x15
function placeequipmentfailedcleanup(fxent) {
    wait 2;
    fxent delete();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x8236
// Size: 0x1be
function spawnmine(origin, owner, weaponname, angles) {
    assert(isdefined(owner));
    if (!isdefined(angles)) {
        angles = (0, randomfloat(360), 0);
    }
    config = level.weaponconfigs[weaponname];
    assert(isdefined(config));
    mine = spawn("script_model", origin);
    mine.angles = angles;
    mine.owner = owner;
    mine.weapon_name = weaponname;
    mine.config = config;
    mine setmodel(config.model);
    mine setotherent(owner);
    mine.killcamoffset = (0, 0, 4);
    mine.killcament = spawn("script_model", mine.origin + mine.killcamoffset);
    mine.killcament setscriptmoverkillcam("explosive");
    owner onlethalequipmentplanted(mine);
    if (isdefined(config.mine_beacon)) {
        mine thread doblinkinglight("tag_fx", config.mine_beacon["friendly"], config.mine_beacon["enemy"]);
    }
    var_88cce618c00d03c = undefined;
    if (self != level) {
        var_88cce618c00d03c = self getlinkedparent();
    }
    mine explosivehandlemovers(var_88cce618c00d03c);
    mine thread mineproximitytrigger(var_88cce618c00d03c);
    mine thread grenade_earthquake();
    mine thread mineselfdestruct();
    mine thread mineexplodeonnotify();
    level thread monitordisownedequipment(owner, mine);
    return mine;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x83fd
// Size: 0x3c
function mineselfdestruct() {
    self endon("mine_triggered");
    self endon("mine_destroyed");
    self endon("death");
    wait level.mineselfdestructtime + randomfloat(0.4);
    self notify("mine_selfdestruct");
    self notify("detonateExplosive");
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8441
// Size: 0x202
function mineexplodeonnotify() {
    self endon("death");
    level endon("game_ended");
    attacker = self waittill("detonateExplosive");
    if (!isdefined(self) || !isdefined(self.owner)) {
        return;
    }
    if (!isdefined(attacker)) {
        attacker = self.owner;
    }
    config = self.config;
    vfxtag = config.vfxtag;
    if (!isdefined(vfxtag)) {
        vfxtag = "tag_fx";
    }
    tagorigin = self gettagorigin(vfxtag);
    if (!isdefined(tagorigin)) {
        tagorigin = self gettagorigin("tag_origin");
    }
    self notify("explode", tagorigin);
    wait 0.05;
    if (!isdefined(self) || !isdefined(self.owner)) {
        return;
    }
    self hide();
    if (isdefined(config.onexplodefunc)) {
        self thread [[ config.onexplodefunc ]]();
    }
    if (isdefined(config.onexplodesfx)) {
        self playsound(config.onexplodesfx);
    }
    onexplodevfx = ter_op(isdefined(config.onexplodevfx), config.onexplodevfx, level.mine_explode);
    minedamagemin = ter_op(isdefined(config.minedamagemin), config.minedamagemin, level.minedamagemin);
    minedamagemax = ter_op(isdefined(config.minedamagemax), config.minedamagemax, level.minedamagemax);
    minedamageradius = ter_op(isdefined(config.minedamageradius), config.minedamageradius, level.minedamageradius);
    self radiusdamage(self.origin, minedamageradius, minedamagemax, minedamagemin, attacker, "MOD_EXPLOSIVE", self.weapon_name);
    wait 0.2;
    deleteexplosive();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x864b
// Size: 0x1a0
function mineproximitytrigger(var_88cce618c00d03c) {
    self endon("mine_destroyed");
    self endon("mine_selfdestruct");
    self endon("death");
    self endon("disabled");
    config = self.config;
    wait config.armtime;
    if (isdefined(config.mine_beacon)) {
        thread doblinkinglight("tag_fx", config.mine_beacon["friendly"], config.mine_beacon["enemy"]);
    }
    trigger = spawn("trigger_radius", self.origin, 0, level.minedetectionradius, level.minedetectionheight);
    trigger.owner = self;
    trigger.team = trigger.owner.team;
    thread minedeletetrigger(trigger);
    if (isdefined(var_88cce618c00d03c)) {
        trigger enablelinkto();
        trigger linkto(var_88cce618c00d03c);
    }
    self.damagearea = trigger;
    while (true) {
        player = trigger waittill("trigger");
        if (isplayer(player)) {
            wait 0.05;
            continue;
        }
        if (player damageconetrace(self.origin, self) > 0) {
            break;
        }
    }
    self notify("mine_triggered");
    self playsound(self.config.ontriggeredsfx);
    explosivetrigger(player, level.minedetectiongraceperiod, "mine");
    self thread [[ self.config.ontriggeredfunc ]]();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x87f3
// Size: 0x32
function minedeletetrigger(trigger) {
    waittill_any_4("mine_triggered", "mine_destroyed", "mine_selfdestruct", "death");
    if (isdefined(trigger)) {
        trigger delete();
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x882d
// Size: 0x85
function doblinkinglight(tagname, var_a351267a57d8cc5a, var_5e0e0d71b0b44f35) {
    if (!isdefined(var_a351267a57d8cc5a)) {
        var_a351267a57d8cc5a = getfx("weap_blink_friend");
    }
    if (!isdefined(var_5e0e0d71b0b44f35)) {
        var_5e0e0d71b0b44f35 = getfx("weap_blink_enemy");
    }
    self.blinkinglightfx["friendly"] = var_a351267a57d8cc5a;
    self.blinkinglightfx["enemy"] = var_5e0e0d71b0b44f35;
    self.blinkinglighttag = tagname;
    thread updateblinkinglight(var_a351267a57d8cc5a, var_5e0e0d71b0b44f35, tagname);
    self waittill("death");
    stopblinkinglight();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x88ba
// Size: 0xfa
function updateblinkinglight(var_a351267a57d8cc5a, var_5e0e0d71b0b44f35, tagname) {
    self endon("death");
    self endon("carried");
    self endon("emp_damage");
    checkfunc = &checkteam;
    if (!level.teambased) {
        checkfunc = &checkplayer;
    }
    delay = randomfloatrange(0.05, 0.25);
    wait delay;
    childthread onjointeamblinkinglight(var_a351267a57d8cc5a, var_5e0e0d71b0b44f35, tagname, checkfunc);
    foreach (player in level.players) {
        if (isdefined(player)) {
            if (self.owner [[ checkfunc ]](player)) {
                playfxontagforclients(var_a351267a57d8cc5a, self, tagname, player);
            } else {
                playfxontagforclients(var_5e0e0d71b0b44f35, self, tagname, player);
            }
            wait 0.05;
        }
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x89bc
// Size: 0xe
function checkplayer(other) {
    return self == other;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x89d3
// Size: 0x20
function checkteam(other) {
    return self.team == other.team;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x89fc
// Size: 0x7a
function onjointeamblinkinglight(var_a351267a57d8cc5a, var_5e0e0d71b0b44f35, tagname, checkfunc) {
    self endon("death");
    level endon("game_ended");
    self endon("emp_damage");
    while (true) {
        player = level waittill("joined_team");
        if (self.owner [[ checkfunc ]](player)) {
            playfxontagforclients(var_a351267a57d8cc5a, self, tagname, player);
            continue;
        }
        playfxontagforclients(var_5e0e0d71b0b44f35, self, tagname, player);
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8a7e
// Size: 0x6b
function stopblinkinglight() {
    if (isalive(self) && isdefined(self.blinkinglightfx)) {
        stopfxontag(self.blinkinglightfx["friendly"], self, self.blinkinglighttag);
        stopfxontag(self.blinkinglightfx["enemy"], self, self.blinkinglighttag);
        self.blinkinglightfx = undefined;
        self.blinkinglighttag = undefined;
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8af1
// Size: 0x42
function watchfraggrenadeexplode() {
    grenade_owner_name = self.owner.name;
    position = self waittill("explode");
    level notify("grenade_exploded_during_stealth", position, "frag_grenade_mp", grenade_owner_name);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8b3b
// Size: 0x42
function watchflashgrenadeexplode() {
    grenade_owner_name = self.owner.name;
    position = self waittill("explode");
    level notify("grenade_exploded_during_stealth", position, "flash_grenade_mp", grenade_owner_name);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8b85
// Size: 0x136
function function_756a543a0b8f6670(owner, grenade, weaponname) {
    if (weaponname == "throwingknifec4_mp") {
        grenade makeunusable();
        grenade thread recordthrowingknifetraveldist();
    }
    thread throwingknifedamagedvictim(owner, grenade);
    stuckto = undefined;
    stuckpart = undefined;
    stuckto, stuckpart = grenade waittill("missile_stuck");
    hitshield = isdefined(stuckpart) && stuckpart == "tag_flicker";
    hitweapon = isdefined(stuckpart) && stuckpart == "tag_weapon";
    if (isdefined(stuckto) && (isplayer(stuckto) || isagent(stuckto)) && hitshield) {
        stuckto notify("shield_hit", grenade);
    }
    if (isdefined(stuckto) && (isplayer(stuckto) || isagent(stuckto)) && !hitweapon && !hitshield) {
        if (weaponname == "throwingknifec4_mp") {
            throwingknifec4detonate(grenade, stuckto, owner);
        }
    }
    if (isdefined(stuckto) && istrue(stuckto.var_a8622ecf49acda6e)) {
        grenade delete();
        return;
    }
    grenade.equipmentref = "equip_throwing_knife";
    grenade thread watchgrenadedeath();
    /#
        grenade thread function_dec7a62735f22d28();
    #/
}

/#

    // Namespace weapon / namespace_a0628d6954815ef8
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x8cc3
    // Size: 0x50
    function function_dec7a62735f22d28() {
        self endon("<dev string:x107>");
        while (true) {
            if (getdvarint(@"hash_a8d9e3f367c7effc") > 0) {
                cylinder(self.origin, self.origin + (0, 0, 64), 64);
            }
            waitframe();
        }
    }

#/

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8d1b
// Size: 0xc4
function throwingknifedamagedvictim(attacker, knife) {
    knife endon("death");
    attacker endon("death");
    attacker endon("disconnect");
    while (true) {
        victim, einflictor, idamage, idflags, smeansofdeath, sweapon = attacker waittill("victim_damaged");
        if (isdefined(einflictor) && einflictor == knife) {
            if (sweapon == "throwingknifeteleport_mp" && !isdefined(knife.knifeteleownerinvalid)) {
                throwingknifeteleport(knife, victim, attacker, 1);
                knife.giveknifeback = 1;
            }
            break;
        }
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8de7
// Size: 0x26
function watchgrenadedeath() {
    self waittill("death");
    if (isdefined(self.knife_trigger)) {
        self.knife_trigger delete();
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x8e15
// Size: 0x274
function throwingknifeteleport(knife, victim, attacker, lerp) {
    attacker playlocalsound("blinkknife_teleport");
    attacker playsoundonmovingent("blinkknife_teleport_npc");
    playsoundatpos(knife.origin, "blinkknife_impact");
    thread throwingknifeteleport_fxstartburst(attacker, victim);
    corpse = victim getcorpseentity();
    if (isdefined(corpse)) {
        corpse notsolid();
    }
    validenemies = [];
    foreach (char in level.characters) {
        if (!isdefined(char) || !isalive(char) || char == victim || char == attacker || !attacker isenemy(char)) {
            continue;
        }
        validenemies[validenemies.size] = char;
    }
    validenemies = sortbydistance(validenemies, victim.origin);
    var_e898076217b2e8c3 = attacker gettagorigin("TAG_EYE");
    endpos = victim.origin;
    var_8bb380999ecb6bd9 = victim.origin + (0, 0, var_e898076217b2e8c3[2] - attacker.origin[2]);
    endangles = attacker.angles;
    foreach (e in validenemies) {
        var_cc3fa02194191300 = (e.origin[0], e.origin[1], e gettagorigin("TAG_EYE")[2]);
        if (distancesquared(e.origin, victim.origin) < 230400 && sighttracepassed(var_8bb380999ecb6bd9, var_cc3fa02194191300, 0, undefined)) {
            endangles = vectortoangles(var_cc3fa02194191300 - var_8bb380999ecb6bd9);
            break;
        }
    }
    attacker setorigin(victim.origin, !lerp);
    attacker setplayerangles(endangles);
    throwingknifeteleport_fxendburst(attacker, victim);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9091
// Size: 0x1e6
function throwingknifeteleport_fxstartburst(player, victim) {
    var_825a40a809006091 = victim.origin - player.origin;
    var_a8c3fbfd6c157049 = player.origin + (0, 0, 32);
    forward = vectornormalize(var_825a40a809006091);
    right = vectornormalize(vectorcross(var_825a40a809006091, (0, 0, 1)));
    up = vectorcross(right, forward);
    angles = axistoangles(forward, right, up);
    var_8cbee39de74c5db1 = 0;
    if (var_8cbee39de74c5db1) {
        fxent = spawn("script_model", var_a8c3fbfd6c157049);
        fxent.angles = angles;
        fxent setmodel("tag_origin");
        fxent hidefromplayer(player);
        waitframe();
        playfxontagforteam(getfx("vfx_knife_tele_start_friendly"), fxent, "tag_origin", player.team);
        wait 3;
        fxent delete();
        return;
    }
    var_348daf7ac25e8901 = spawn("script_model", var_a8c3fbfd6c157049);
    var_348daf7ac25e8901.angles = angles;
    var_348daf7ac25e8901 setmodel("tag_origin");
    var_348daf7ac25e8901 hidefromplayer(player);
    waitframe();
    foreach (otherplayer in level.players) {
        var_348daf7ac25e8901 hidefromplayer(otherplayer);
    }
    playfxontag(getfx("vfx_tele_start_friendly"), var_348daf7ac25e8901, "tag_origin");
    wait 3;
    var_348daf7ac25e8901 delete();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x927f
// Size: 0xac
function recordthrowingknifetraveldist() {
    level endon("game_ended");
    self.owner endon("disconnect");
    self.disttravelled = 0;
    lastpos = self.origin;
    while (true) {
        waitresult = waittill_any_timeout_2(0.15, "death", "missile_stuck");
        if (!isdefined(self)) {
            break;
        }
        disttravelled = distance(lastpos, self.origin);
        self.disttravelled += disttravelled;
        lastpos = self.origin;
        if (waitresult != "timeout") {
            break;
        }
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9333
// Size: 0x13
function throwingknifeteleport_fxendburst(player, victim) {
    
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x934e
// Size: 0x91
function throwingknifec4detonate(knife, victim, attacker) {
    victim playsound("biospike_explode");
    playfx(getfx("throwingknifec4_explode"), knife.origin);
    knife radiusdamage(knife.origin, 180, 1200, 600, attacker, "MOD_EXPLOSIVE", knife.weapon_name);
    knife thread grenade_earthquake();
    knife notify("explode", knife.origin);
    knife delete();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x93e7
// Size: 0x75
function watchconcussiongrenadeexplode() {
    thread endondeath();
    self endon("end_explode");
    grenade_owner_name = self.owner.name;
    position = self waittill("explode");
    level notify("grenade_exploded_during_stealth", position, "concussion_grenade_mp", grenade_owner_name);
    childthread stunenemiesinrange(position, self.owner);
    childthread stunplayersinrange(position, self.owner);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9464
// Size: 0xa3
function stunplayersinrange(position, owner) {
    players = level.players;
    closestplayers = get_array_of_closest(position, players, undefined, 24, 256);
    foreach (victim in closestplayers) {
        if ((is_friendly_damage(victim, owner) && victim != owner) == 0) {
            victim thread stundamageonplayers(victim, owner, position);
        }
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x950f
// Size: 0xcb
function stundamageonplayers(victim, owner, position) {
    var_73dc87c72d7f6c03 = 3;
    var_636c8be8a25f3a8 = 3;
    if (victim == owner) {
        var_73dc87c72d7f6c03 = 2;
        var_636c8be8a25f3a8 = 2;
    }
    scale = 1 - distance(victim.origin, position) / 512;
    if (scale < 0) {
        scale = 0;
    }
    time = var_73dc87c72d7f6c03 + var_636c8be8a25f3a8 * scale;
    owner notify("stun_hit");
    victim notify("concussed", owner);
    victim utility::setplayerstunned();
    victim thread cleanupconcussionstun(time);
    victim shellshock("concussion_grenade_mp", time);
    victim.concussionendtime = gettime() + time * 1000;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x95e2
// Size: 0xc6
function stunenemiesinrange(position, owner) {
    enemies = array_combine(scripts\cp\cp_agent_utils::getaliveagentsofteam("axis"), scripts\cp\cp_agent_utils::getaliveagentsofteam("team_three"));
    closestenemies = get_array_of_closest(position, enemies, undefined, 24, 500);
    foreach (victim in closestenemies) {
        if (isagent(victim)) {
            victim notify("flashbang", victim.origin, 1, 1, owner, "axis");
        }
        victim thread fx_stun_damage(victim, owner);
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x96b0
// Size: 0xf3
function fx_stun_damage(victim, eattacker) {
    victim endon("death");
    if (isdefined(victim.stun_hit_time)) {
        if (gettime() > victim.stun_hit_time) {
            victim.allowpain = 1;
            victim.stun_hit_time = gettime() + 1000;
            victim.stunned = 1;
            victim thread reduce_accuracy_while_stunned();
        } else {
            return;
        }
    } else {
        victim.allowpain = 1;
        victim.stun_hit_time = gettime() + 1000;
        victim.stunned = 1;
        victim thread reduce_accuracy_while_stunned();
    }
    victim dodamage(1, victim.origin, eattacker, eattacker, "MOD_GRENADE_SPLASH", "concussion_grenade_mp");
    wait 10;
    victim.allowpain = 0;
    victim.stunned = undefined;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x97ab
// Size: 0x72
function reduce_accuracy_while_stunned() {
    self endon("death");
    self notify("sturn_accuracy_reduction");
    self endon("sturn_accuracy_reduction");
    if (self.baseaccuracy != 0) {
        self.old_accuracy = self.baseaccuracy;
    }
    self.baseaccuracy = 0;
    while (istrue(self.stunned)) {
        waitframe();
    }
    if (isdefined(self.old_accuracy)) {
        self.baseaccuracy = self.old_accuracy;
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9825
// Size: 0x3a
function mineused(grenade, spawnfunc) {
    if (!isalive(self)) {
        grenade delete();
        return;
    }
    grenade thread minethrown(self, grenade.weapon_name, spawnfunc);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x9867
// Size: 0x16a
function minethrown(owner, weaponname, spawnfunc, var_fbf2bd8b1706fe46) {
    self.owner = owner;
    stuckto = self waittill("missile_stuck");
    if (!isdefined(owner)) {
        return;
    }
    if (weaponname != "trip_mine_mp") {
        if (isdefined(stuckto) && isdefined(stuckto.owner)) {
            if (isdefined(var_fbf2bd8b1706fe46)) {
                self.owner [[ var_fbf2bd8b1706fe46 ]](self);
            }
            self delete();
            return;
        }
    }
    trace = scripts\engine\trace::_bullet_trace(self.origin + (0, 0, 4), self.origin - (0, 0, 4), 0, self);
    pos = trace["position"];
    if (trace["fraction"] == 1) {
        pos = getgroundposition(self.origin, 12, 0, 32);
        trace["normal"] = trace["normal"] * -1;
    }
    normal = vectornormalize(trace["normal"]);
    var_97019a6d379d522 = vectortoangles(normal);
    var_97019a6d379d522 += (90, 0, 0);
    mine = [[ spawnfunc ]](pos, owner, weaponname, var_97019a6d379d522);
    mine thread minedamagemonitor();
    self delete();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x99d9
// Size: 0x1ed
function minedamagemonitor() {
    self endon("mine_triggered");
    self endon("mine_selfdestruct");
    self endon("death");
    self setcandamage(1);
    self.maxhealth = 100000;
    self.health = self.maxhealth;
    attacker = undefined;
    while (true) {
        damage, attacker, direction_vec, point, type, modelname, tagname, partname, idflags, objweapon, inflictor = self waittill("damage");
        if (is_hive_explosion(attacker, type)) {
            break;
        }
        if (!isplayer(attacker) && !isagent(attacker)) {
            if (!isdefined(attacker.owner) || !isplayer(attacker.owner)) {
                continue;
            } else {
                attacker = attacker.owner;
            }
        }
        if (isdefined(objweapon) && isendstr(objweapon.basename, "betty_mp")) {
            continue;
        }
        if (!namespace_1b51be0488919ce5::friendlyfirecheck(self.owner, attacker)) {
            continue;
        }
        if (non_player_should_ignore_damage(attacker, objweapon, inflictor, type)) {
            continue;
        }
        break;
    }
    self notify("mine_destroyed");
    if (isdefined(type) && (issubstr(type, "MOD_GRENADE") || issubstr(type, "MOD_EXPLOSIVE"))) {
        self.waschained = 1;
    }
    if (isdefined(idflags) && idflags & 8) {
        self.wasdamagedfrombulletpenetration = 1;
    }
    self.wasdamaged = 1;
    if (isdefined(attacker)) {
        self.damagedby = attacker;
    }
    self notify("detonateExplosive", attacker);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9bce
// Size: 0x47
function is_hive_explosion(attacker, type) {
    if (!isdefined(attacker) || !isdefined(attacker.classname)) {
        return false;
    }
    return attacker.classname == "scriptable" && type == "MOD_EXPLOSIVE";
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x9c1e
// Size: 0x6e
function explosivetrigger(target, graceperiod, notifystr) {
    self setscriptablepartstate("arm", "neutral", 0);
    self setscriptablepartstate("trigger", "active", 0);
    if (isplayer(target) && target _hasperk("specialty_delaymine")) {
        target notify("triggeredExpl", notifystr);
        graceperiod = level.delayminetime;
    }
    wait graceperiod;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9c94
// Size: 0xb8
function shouldaffectclaymore(claymore) {
    if (isdefined(claymore.disabled)) {
        return false;
    }
    pos = self.origin + (0, 0, 32);
    dirtopos = pos - claymore.origin;
    var_3ed85f41db72266a = anglestoforward(claymore.angles);
    dist = vectordot(dirtopos, var_3ed85f41db72266a);
    if (dist < level.claymoredetectionmindist) {
        return false;
    }
    dirtopos = vectornormalize(dirtopos);
    dot = vectordot(dirtopos, var_3ed85f41db72266a);
    return dot > level.claymoredetectiondot;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9d55
// Size: 0x57
function deleteondeath(ent) {
    self waittill("death");
    self setscriptablepartstate("destroy", "active", 0);
    wait 0.05;
    if (isdefined(ent)) {
        if (isdefined(ent.trigger)) {
            ent.trigger delete();
        }
        ent delete();
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x9db4
// Size: 0xbf
function onlethalequipmentplanted(var_40d7ea0d7a20a4e3, powername, var_959103ee6629ea1d) {
    if (self.plantedlethalequip.size) {
        self.plantedlethalequip = array_removeundefined(self.plantedlethalequip);
        if (self.plantedlethalequip.size >= level.maxperplayerexplosives) {
            if (istrue(var_959103ee6629ea1d)) {
                self.plantedlethalequip[0] notify("detonateExplosive");
            } else {
                self.plantedlethalequip[0] deleteexplosive();
            }
        }
    }
    self.plantedlethalequip[self.plantedlethalequip.size] = var_40d7ea0d7a20a4e3;
    entnum = var_40d7ea0d7a20a4e3 getentitynumber();
    level.mines[entnum] = var_40d7ea0d7a20a4e3;
    level notify("mine_planted");
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9e7b
// Size: 0x29
function add_to_mine_list(var_40d7ea0d7a20a4e3) {
    entnum = var_40d7ea0d7a20a4e3 getentitynumber();
    level.mines[entnum] = var_40d7ea0d7a20a4e3;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9eac
// Size: 0x1ae
function clustergrenadeused() {
    owner = self.originalowner;
    owner endon("disconnect");
    thread ownerdisconnectcleanup(owner);
    delays = [];
    for (i = 0; i < 4; i++) {
        delays[i] = 0.2;
    }
    var_3faad2422c09b784 = 0;
    foreach (delay in delays) {
        var_3faad2422c09b784 += delay;
    }
    killcament = spawn("script_model", self.origin);
    killcament linkto(self);
    killcament setmodel("tag_origin");
    killcament setscriptmoverkillcam("explosive");
    killcament thread deathdelaycleanup(self, var_3faad2422c09b784 + 5);
    killcament thread ownerdisconnectcleanup(self.owner);
    killcament.threwback = self.threwback;
    var_d5eeaa5b2b8b2f6f = owner _launchgrenade("cluster_grenade_indicator_mp", self.origin, (0, 0, 0));
    var_d5eeaa5b2b8b2f6f linkto(self);
    var_d5eeaa5b2b8b2f6f thread deathdelaycleanup(self, var_3faad2422c09b784);
    var_d5eeaa5b2b8b2f6f thread ownerdisconnectcleanup(self.owner);
    thread notifyafterframeend("death", "end_explode");
    self endon("end_explode");
    position = self waittill("explode");
    thread clustergrenadeexplode(position, delays, owner, killcament);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xa062
// Size: 0x2f7
function clustergrenadeexplode(position, delays, owner, killcament) {
    owner endon("disconnect");
    contents = scripts\engine\trace::create_contents(0, 1, 1, 0, 1, 0, 0);
    var_3234df3086482e07 = 0;
    start = position + (0, 0, 3);
    end = start + (0, 0, -5);
    castresults = physics_raycast(start, end, contents, undefined, 0, "physicsquery_closest");
    if (isdefined(castresults) && castresults.size > 0) {
        var_3234df3086482e07 = 1;
    }
    posoffset = ter_op(var_3234df3086482e07, (0, 0, 32), (0, 0, 2));
    fxposition = position + posoffset;
    var_39a64ef99549e28e = randomint(90) - 45;
    /#
    #/
    contents = scripts\engine\trace::create_contents(0, 1, 1, 0, 1, 0, 0);
    for (i = 0; i < 4; i++) {
        killcament.shellshockondamage = ter_op(i == 0, 1, undefined);
        killcament radiusdamage(position, 256, 800, 400, owner, "MOD_EXPLOSIVE", "cluster_grenade_zm");
        yaw = ter_op(i < 4, 90 * i + var_39a64ef99549e28e, randomint(360));
        var_8870c770846c1a02 = ter_op(var_3234df3086482e07, 110, 90);
        pitchrange = ter_op(var_3234df3086482e07, 12, 45);
        pitch = var_8870c770846c1a02 + randomint(pitchrange * 2) - pitchrange;
        dist = randomint(60) + 30;
        x = cos(yaw) * sin(pitch);
        y = sin(yaw) * sin(pitch);
        z = cos(pitch);
        offset = (x, y, z) * dist;
        start = fxposition;
        end = fxposition + offset;
        castresults = physics_raycast(start, end, contents, undefined, 0, "physicsquery_closest");
        if (isdefined(castresults) && castresults.size > 0) {
            end = castresults[0]["position"];
        }
        /#
        #/
        playfx(getfx("clusterGrenade_explode"), end);
        switch (i) {
        case 0: 
            playsoundatpos(end, "iw9_frag_grenade_expl_trans");
            break;
        case 3: 
            playsoundatpos(end, "cluster_explode_end");
            break;
        default: 
            playsoundatpos(end, "cluster_explode_mid");
            break;
        }
        wait delays[i];
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa361
// Size: 0x2b
function deathdelaycleanup(grenade, duration) {
    self endon("death");
    grenade waittill("death");
    wait duration;
    self delete();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa394
// Size: 0x21
function ownerdisconnectcleanup(owner) {
    self endon("death");
    owner waittill("disconnect");
    self delete();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa3bd
// Size: 0x14b
function semtexused(grenade) {
    if (!isdefined(grenade)) {
        return;
    }
    grenade.originalowner = self;
    grenade setentityowner(self);
    grenade setotherent(self);
    grenade thread semtex_watch_cleanup();
    grenade thread semtex_watch_fuse();
    grenade_owner_name = grenade.owner.name;
    stuckto = grenade waittill("missile_stuck");
    if (isagent(stuckto)) {
        function_216c67ab6749137a(stuckto, undefined, "semtex_stuck");
    }
    if (isagent(stuckto) && !istrue(stuckto.var_274d3a7704e351ef)) {
        if (!isdefined(stuckto.var_f8ecc64162438d76)) {
            stuckto.var_f8ecc64162438d76 = [];
        } else {
            stuckto.var_f8ecc64162438d76 = array_removedead(stuckto.var_f8ecc64162438d76);
        }
        stuckto.var_f8ecc64162438d76 = array_add(stuckto.var_f8ecc64162438d76, grenade);
        assertex(stuckto.health > 0, "Agent with a semtex stuck to is dead already.");
        function_60daa23100a2b874(grenade, stuckto);
    }
    level notify("grenade_exploded_during_stealth", grenade.origin, "semtex_mp", grenade_owner_name);
    grenade thread grenade_earthquake();
    grenade explosivehandlemovers(undefined);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa510
// Size: 0x14
function semtex_watch_fuse() {
    self endon("death");
    wait 2;
    thread semtex_explode();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa52c
// Size: 0xf
function semtex_explode() {
    thread semtex_delete(0.1);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa543
// Size: 0xf
function semtex_destroy() {
    thread semtex_delete(0.1);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa55a
// Size: 0x27
function semtex_delete(delay) {
    self notify("death");
    self.exploding = 1;
    wait delay;
    self delete();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa589
// Size: 0x1d
function semtex_watch_cleanup() {
    self endon("death");
    semtex_watch_cleanup_end_early();
    if (isdefined(self)) {
        thread semtex_destroy();
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa5ae
// Size: 0x3f
function semtex_watch_cleanup_end_early() {
    self.owner endon("disconnect");
    self.owner endon("joined_team");
    self.owner endon("joined_spectators");
    level endon("game_ended");
    while (true) {
        waitframe();
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa5f5
// Size: 0x7d
function attachmentisdefault(attachmentbasename) {
    return isdefined(attachmentbasename) && (string_starts_with(attachmentbasename, "rec") || string_starts_with(attachmentbasename, "front") || string_starts_with(attachmentbasename, "back") || string_starts_with(attachmentbasename, "mag") || string_starts_with(attachmentbasename, "guard") || string_starts_with(attachmentbasename, "triggrip") || string_starts_with(attachmentbasename, "toprail"));
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa67b
// Size: 0x24e
function remove_attachment(attachment, player, weapon) {
    if (!isdefined(attachment) && !isdefined(player)) {
        return;
    }
    weapons = [];
    var_ceb40e0d9504f27a = undefined;
    objnewweapon = undefined;
    if (isdefined(weapon)) {
        if (isweapon(weapon)) {
            weapons[weapons.size] = weapon;
        } else {
            weapons[weapons.size] = makeweaponfromstring(weapon);
        }
    } else {
        weapons = player getweaponslistall();
    }
    foreach (item in weapons) {
        if (item hasattachment(attachment)) {
            var_62e770ea80d43309 = getrawbaseweaponname(item);
            baseweapon = getweaponbasename(item);
            player takeweapon(item);
            attachments = getweaponattachments(item);
            foreach (piece in attachments) {
                if (issubstr(piece, attachment)) {
                    attachments = array_remove(attachments, piece);
                    break;
                }
            }
            if (isdefined(level.build_weapon_name_func)) {
                objnewweapon = player [[ level.build_weapon_name_func ]](baseweapon, attachments);
            }
            if (isdefined(objnewweapon)) {
                weapons = self getweaponslistprimaries();
                foreach (weapon in weapons) {
                    if (issubstr(weapon.basename, objnewweapon.basename)) {
                        if (weapon.isalternate) {
                            baseweapon = getweaponbasename(weapon);
                            if (isdefined(level.alt_mode_weapons_allowed) && array_contains(level.alt_mode_weapons_allowed, baseweapon)) {
                                objnewweapon = objnewweapon getaltweapon();
                                break;
                            }
                        }
                    }
                }
                player _giveweapon(objnewweapon, -1, -1, 1);
                player switchtoweapon(objnewweapon);
            }
        }
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa8d1
// Size: 0xb6
function has_weapon_variation(weapon) {
    primaries = self getweaponslistall();
    weaponname = undefined;
    if (isweapon(weapon)) {
        weaponname = weapon.basename;
    } else {
        weaponname = weapon;
    }
    foreach (primaryweapon in primaries) {
        baseweapon = getrawbaseweaponname(weaponname);
        var_442713efdf839b74 = getrawbaseweaponname(primaryweapon);
        if (baseweapon == var_442713efdf839b74) {
            return true;
        }
    }
    return false;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa990
// Size: 0xc7
function get_weapon_variation_obj(weapon) {
    primaries = self getweaponslistall();
    result = [];
    weaponname = undefined;
    if (isweapon(weapon)) {
        weaponname = weapon.basename;
    } else {
        weaponname = weapon;
    }
    foreach (primaryweapon in primaries) {
        baseweapon = getrawbaseweaponname(weaponname);
        var_442713efdf839b74 = getrawbaseweaponname(primaryweapon);
        if (baseweapon == var_442713efdf839b74) {
            result[result.size] = primaryweapon;
        }
    }
    return result;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaa60
// Size: 0x10d
function grenade_earthquake(var_7bb0eac0599aa23d) {
    self notify("grenade_earthQuake");
    self endon("grenade_earthQuake");
    thread endondeath();
    self endon("end_explode");
    position = undefined;
    if (!isdefined(var_7bb0eac0599aa23d) || var_7bb0eac0599aa23d) {
        position = self waittill("explode");
    } else {
        position = self.origin;
    }
    playrumbleonposition("grenade_rumble", position);
    earthquake(0.5, 0.75, position, 800);
    foreach (player in level.players) {
        if (player isusingremote()) {
            continue;
        }
        if (distancesquared(position, player.origin) > 360000) {
            continue;
        }
        if (player damageconetrace(position)) {
            player thread dirteffect(position);
        }
        player setclientomnvar("ui_hud_shake", 1);
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xab75
// Size: 0x13
function endondeath() {
    self waittill("death");
    waittillframeend();
    self notify("end_explode");
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xab90
// Size: 0x13f
function dirteffect(position) {
    self notify("dirtEffect");
    self endon("dirtEffect");
    self endon("disconnect");
    if (!scripts\cp_mp\utility\player_utility::_isalive()) {
        return;
    }
    forwardvec = vectornormalize(anglestoforward(self.angles));
    rightvec = vectornormalize(anglestoright(self.angles));
    var_2281000002d7b901 = vectornormalize(position - self.origin);
    fdot = vectordot(var_2281000002d7b901, forwardvec);
    rdot = vectordot(var_2281000002d7b901, rightvec);
    string_array = ["death", "damage"];
    currentweapon = self getcurrentweapon();
    if (fdot > 0 && fdot > 0.5 && currentweapon.basename != "iw6_riotshield_mp") {
        waittill_any_in_array_or_timeout(string_array, 2);
        return;
    }
    if (abs(fdot) < 0.866) {
        if (rdot > 0) {
            waittill_any_in_array_or_timeout(string_array, 2);
            return;
        }
        waittill_any_in_array_or_timeout(string_array, 2);
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xacd7
// Size: 0x9d
function shellshockondamage(cause, damage) {
    if (isflashbanged()) {
        return;
    }
    if (cause == "MOD_EXPLOSIVE" || cause == "MOD_GRENADE" || cause == "MOD_GRENADE_SPLASH" || cause == "MOD_PROJECTILE" || cause == "MOD_PROJECTILE_SPLASH") {
        if (damage > 10) {
            if (isdefined(self.shellshockreduction) && self.shellshockreduction) {
                self shellshock("damage_cp", self.shellshockreduction);
                return;
            }
            self shellshock("damage_cp", 0.5);
        }
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xad7c
// Size: 0x1f
function isflashbanged() {
    return isdefined(self.flashendtime) && gettime() < self.flashendtime;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xada4
// Size: 0x77
function isakimbo(weapon) {
    if (isdefined(weapon.others)) {
        foreach (attachment in weapon.others) {
            if (issubstr(attachment, "akimbo")) {
                return true;
            }
        }
    }
    return false;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xae24
// Size: 0x1a3
function waittill_grenade_fire() {
    while (true) {
        grenade, objweapon, tickpercent, originalowner = self waittill("grenade_fire");
        if (isdefined(self.throwinggrenade) && objweapon.basename != self.throwinggrenade) {
            continue;
        }
        if (isdefined(grenade)) {
            if (!isdefined(grenade.weapon_obj)) {
                grenade.weapon_obj = objweapon;
            }
            if (!isdefined(grenade.weapon_name)) {
                grenade.weapon_name = objweapon.basename;
            }
            if (!isdefined(grenade.owner)) {
                grenade.owner = self;
            }
            if (!isdefined(grenade.team)) {
                grenade.team = self.team;
            }
            if (!isdefined(grenade.ticks) && isdefined(self.throwinggrenade)) {
                grenade.ticks = roundup(4 * tickpercent);
            }
        }
        grenadeinitialize(grenade, objweapon, tickpercent, originalowner);
        if (!scripts\cp_mp\utility\player_utility::_isalive() && !isdefined(self.throwndyinggrenade)) {
            self notify("grenade_fire_dead", grenade, objweapon.basename);
            self.throwndyinggrenade = 1;
        }
        if (istrue(grenade.threwback)) {
            if (isdefined(namespace_6250b14b3f614101::getcurrentequipment("primary"))) {
                if (namespace_4fb9dddfb8c1a67a::getequipmentslotammo("primary") >= 1) {
                    namespace_4fb9dddfb8c1a67a::function_91bd2a98062313cb("primary", 1);
                }
            }
        }
        return grenade;
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xafcf
// Size: 0x1ba
function grenadestuckto(grenade, stuckto, ignoresplash) {
    if (!isdefined(self)) {
        grenade.stuckenemyentity = stuckto;
        stuckto.stuckbygrenade = grenade;
        return;
    }
    if (level.teambased && is_equal(stuckto.team, self.team)) {
        grenade.isstuck = "friendly";
        return;
    }
    var_d658f0b6bc4fd513 = undefined;
    var_d5f11d86f917656 = undefined;
    if (!isdefined(grenade.weapon_name)) {
        return;
    }
    switch (grenade.weapon_name) {
    case #"hash_4b87af60037f526f": 
        var_d658f0b6bc4fd513 = "semtex_stuck";
        var_d5f11d86f917656 = #"bc_flavor_player_surprise";
        break;
    case #"hash_ab3485fa6834de47": 
        var_d658f0b6bc4fd513 = "molotov_stuck";
        var_d5f11d86f917656 = #"bc_flavor_player_surprise";
        break;
    case #"hash_b833f98278746f9b": 
        var_d658f0b6bc4fd513 = "flare_gun_attacker_stuck";
        break;
    case #"hash_4c7de5619284e175": 
        var_d658f0b6bc4fd513 = "thermite_attacker_stuck";
        var_d5f11d86f917656 = #"bc_flavor_player_surprise";
        break;
    case #"hash_4a85ee2b82965fe2": 
        var_d658f0b6bc4fd513 = "sonar_pulse_stuck";
        break;
    case #"hash_954bb5f200a1b95a": 
        var_d658f0b6bc4fd513 = "shock_stick_stuck";
        var_d5f11d86f917656 = #"bc_flavor_player_surprise";
        break;
    case #"hash_d6565ec12efca627": 
        var_d658f0b6bc4fd513 = "bunkerbuster_stuck";
        var_d5f11d86f917656 = #"bc_flavor_player_surprise";
        break;
    }
    grenade.isstuck = "enemy";
    grenade.stuckenemyentity = stuckto;
    stuckto.stuckbygrenade = grenade;
    self notify("grenade_stuck_enemy");
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb191
// Size: 0x53
function grenadestucktosplash(var_d658f0b6bc4fd513, stuckto) {
    player = self;
    if (isplayer(stuckto) && isdefined(var_d658f0b6bc4fd513)) {
        if (isdefined(player.owner)) {
            player = player.owner;
        }
        player scripts\cp\cp_hud_message::showsplash(var_d658f0b6bc4fd513);
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb1ec
// Size: 0x32
function get_possible_attachments_by_weaponclass(weapclass, weapon, var_effb4ae1788a8b10) {
    if (!isdefined(weapclass)) {
        return false;
    }
    if (!isdefined(weapon)) {
        return false;
    }
    if (!isdefined(var_effb4ae1788a8b10)) {
        return false;
    }
    return true;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb227
// Size: 0xc2
function getattachmenttypeslist(weaponname, var_2fbd0e943f095064) {
    attachments = getweaponattachmentarrayfromstats(weaponname);
    list = [];
    foreach (attachment in attachments) {
        attachmenttype = getattachmenttype(attachment);
        if (isdefined(var_2fbd0e943f095064) && listhasattachment(var_2fbd0e943f095064, attachment)) {
            continue;
        }
        if (!isdefined(list[attachmenttype])) {
            list[attachmenttype] = [];
        }
        attachmentlist = list[attachmenttype];
        attachmentlist[attachmentlist.size] = attachment;
        list[attachmenttype] = attachmentlist;
    }
    return list;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb2f2
// Size: 0xed
function getattachmentlistbasenames() {
    attachmentlist = [];
    tables = ["mp/attachmenttable.csv", "cp/cp_attachmenttable.csv"];
    foreach (table in tables) {
        numrows = tablelookupgetnumrows(table);
        for (index = 0; index < numrows; index++) {
            attachmentname = tablelookupbyrow(table, index, 5);
            group = tablelookupbyrow(table, index, 2);
            if (attachmentname != "" && group != "none" && !array_contains(attachmentlist, attachmentname)) {
                attachmentlist[attachmentlist.size] = attachmentname;
            }
        }
    }
    return attachmentlist;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb3e8
// Size: 0xa
function function_9ba246f8c51923da() {
    thread setweaponlaser_internal();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb3fa
// Size: 0xa4
function setweaponlaser_internal() {
    self endon("death_or_disconnect");
    self endon("unsetWeaponLaser");
    self.perkweaponlaseron = 0;
    weapon = self getcurrentweapon();
    while (true) {
        setweaponlaser_waitforlaserweapon(weapon);
        if (self.perkweaponlaseron == 0) {
            self.perkweaponlaseron = 1;
            enableweaponlaser();
        }
        childthread setweaponlaser_monitorads();
        childthread setweaponlaser_monitorweaponswitchstart(1);
        self.perkweaponlaseroffforswitchstart = undefined;
        weapon = self waittill("weapon_change");
        if (self.perkweaponlaseron == 1) {
            self.perkweaponlaseron = 0;
            disableweaponlaser();
        }
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb4a6
// Size: 0x5e
function setweaponlaser_waitforlaserweapon(weapon) {
    while (true) {
        assert(isweapon(weapon));
        if (isdefined(weapon) && (weapon.basename == "iw6_kac_mp" || weapon.basename == "iw6_arx160_mp")) {
            break;
        }
        weapon = self waittill("weapon_change");
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb50c
// Size: 0x81
function setweaponlaser_monitorads() {
    self endon("weapon_change");
    while (true) {
        if (!isdefined(self.perkweaponlaseroffforswitchstart) || self.perkweaponlaseroffforswitchstart == 0) {
            if (self playerads() > 0.6) {
                if (self.perkweaponlaseron == 1) {
                    self.perkweaponlaseron = 0;
                    disableweaponlaser();
                }
            } else if (self.perkweaponlaseron == 0) {
                self.perkweaponlaseron = 1;
                enableweaponlaser();
            }
        }
        waitframe();
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb595
// Size: 0x2b
function setweaponlaser_monitorweaponswitchstart(offtime) {
    self endon("weapon_change");
    while (true) {
        self waittill("weapon_switch_started");
        childthread setweaponlaser_onweaponswitchstart(offtime);
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb5c8
// Size: 0x81
function setweaponlaser_onweaponswitchstart(offtime) {
    self notify("setWeaponLaser_onWeaponSwitchStart");
    self endon("setWeaponLaser_onWeaponSwitchStart");
    if (self.perkweaponlaseron == 1) {
        self.perkweaponlaseroffforswitchstart = 1;
        self.perkweaponlaseron = 0;
        disableweaponlaser();
    }
    wait offtime;
    self.perkweaponlaseroffforswitchstart = undefined;
    if (self.perkweaponlaseron == 0 && self playerads() <= 0.6) {
        self.perkweaponlaseron = 1;
        enableweaponlaser();
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb651
// Size: 0x2a
function enableweaponlaser() {
    if (!isdefined(self.weaponlasercalls)) {
        self.weaponlasercalls = 0;
    }
    self.weaponlasercalls++;
    self laseron();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb683
// Size: 0x5c
function disableweaponlaser() {
    assertex(isdefined(self.weaponlasercalls), "disableWeaponLaser() called before at least one enableWeaponLaser() call.");
    self.weaponlasercalls--;
    assertex(self.weaponlasercalls >= 0, "disableWeaponLaser() called at least one more time than enableWeaponLaser() causing a negative call count.");
    if (self.weaponlasercalls == 0) {
        self laseroff();
        self.weaponlasercalls = undefined;
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb6e7
// Size: 0x61
function ondetonateexplosive(notifystring) {
    self endon("death");
    level endon("game_ended");
    thread cleanupexplosivesondeath();
    self waittill("detonateExplosive");
    if (isdefined(notifystring)) {
        self.owner notify(notifystring, 1);
    } else {
        self.owner notify("powers_c4_used", 1);
    }
    self detonate(self.owner);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb750
// Size: 0x70
function cleanupexplosivesondeath() {
    self endon("deleted_equipment");
    level endon("game_ended");
    equipnum = self getentitynumber();
    equipkillcament = self.killcament;
    equiptrigger = self.trigger;
    var_150bc605dfcc72b9 = self.sensor;
    self waittill("death");
    cleanupequipment(equipnum, equipkillcament, equiptrigger, var_150bc605dfcc72b9);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xb7c8
// Size: 0x11f
function cleanupequipment(equipnum, equipkillcament, equiptrigger, var_150bc605dfcc72b9) {
    if (isdefined(self.weapon_name)) {
        if (self.weapon_name == "c4_mp") {
            self.owner notify("c4_update", 0);
        } else if (self.weapon_name == "bouncing_betty_mp") {
            self.owner notify("bouncing_betty_update", 0);
        } else if (self.weapon_name == "sticky_mine_mp") {
            self.owner notify("sticky_mine_update", 0);
        } else if (self.weapon_name == "trip_mine_mp") {
            self.owner notify("trip_mine_update", 0);
        } else if (self.weapon_name == "cryo_grenade_mp") {
            self.owner notify("restart_cryo_grenade_cooldown", 0);
        }
    }
    if (isdefined(equipnum)) {
        level.mines[equipnum] = undefined;
    }
    if (isdefined(equipkillcament)) {
        equipkillcament delete();
    }
    if (isdefined(equiptrigger)) {
        equiptrigger delete();
    }
    if (isdefined(var_150bc605dfcc72b9)) {
        var_150bc605dfcc72b9 delete();
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xb8ef
// Size: 0x207
function monitordamage(maxhealth, damagefeedback, ondeathfunc, var_d7b6456018542238, biskillstreak, rumble) {
    self endon("death");
    level endon("game_ended");
    if (!isdefined(rumble)) {
        rumble = 0;
    }
    self setcandamage(1);
    self.health = 9999999;
    self.maxhealth = maxhealth;
    self.damagetaken = 0;
    if (!isdefined(biskillstreak)) {
        biskillstreak = 0;
    }
    for (running = 1; running; running = monitordamageoneshot(damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, objweapon, inflictor, damagefeedback, ondeathfunc, var_d7b6456018542238, biskillstreak)) {
        damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, objweapon, origin, angles, normal, inflictor = self waittill("damage");
        if (rumble) {
            self playrumbleonentity("damage_light");
        }
        if (isdefined(self.helitype) && self.helitype == "littlebird") {
            if (!isdefined(self.attackers)) {
                self.attackers = [];
            }
            uniqueid = "";
            if (isdefined(attacker) && isplayer(attacker)) {
                uniqueid = attacker getuniqueid();
            }
            if (isdefined(self.attackers[uniqueid])) {
                self.attackers[uniqueid] = self.attackers[uniqueid] + damage;
                continue;
            }
            self.attackers[uniqueid] = damage;
        }
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbafe
// Size: 0x44
function monitordamageend() {
    self notify("monitorDamageEnd");
    self.damagetaken = undefined;
    self.attackers = undefined;
    self.wasdamaged = undefined;
    self.wasdamagedfrombulletpenetration = undefined;
    self.wasdamagedfrombulletricochet = undefined;
    self setcandamage(0);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 15, eflags: 0x0
// Checksum 0x0, Offset: 0xbb4a
// Size: 0x1c9
function monitordamageoneshot(damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, objweapon, inflictor, damagefeedback, ondeathfunc, var_d7b6456018542238, biskillstreak) {
    if (!isdefined(self)) {
        return false;
    }
    if (isdefined(attacker) && !namespace_1b51be0488919ce5::friendlyfirecheck(self.owner, attacker)) {
        if (isdefined(self.equipmentref) && self.equipmentref == "equip_tac_cover") {
        } else {
            return true;
        }
    }
    modifieddamage = damage;
    if (isdefined(objweapon)) {
        if (non_player_should_ignore_damage(attacker, objweapon, inflictor, meansofdeath)) {
            return true;
        }
    }
    damagedata = scripts\cp_mp\utility\damage_utility::packdamagedata(attacker, self, damage, objweapon, meansofdeath, inflictor, point, direction_vec, modelname, partname, tagname, idflags);
    if (!isdefined(var_d7b6456018542238)) {
        var_d7b6456018542238 = &namespace_1b51be0488919ce5::modifydamage;
    }
    modifieddamage = self [[ var_d7b6456018542238 ]](damagedata);
    if (modifieddamage <= 0) {
        return true;
    }
    self.wasdamaged = 1;
    self.damagetaken += modifieddamage;
    self.health = 2147483647;
    if (istrue(biskillstreak)) {
        scripts\cp\utility::killstreakhit(attacker, objweapon, self, meansofdeath, modifieddamage);
    }
    if (isdefined(attacker)) {
        if (isplayer(attacker)) {
            attacker namespace_3d3d5211c3029f82::updatedamagefeedback(damagefeedback);
        }
    }
    if (self.damagetaken >= self.maxhealth) {
        damagedata = scripts\cp_mp\utility\damage_utility::packdamagedata(attacker, self, damage, objweapon, meansofdeath, inflictor, point, direction_vec, modelname, partname, tagname, idflags);
        self thread [[ ondeathfunc ]](damagedata);
        return false;
    }
    return true;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xbd1c
// Size: 0x1e2
function non_player_should_ignore_damage(attacker, objweapon, inflictor, meansofdeath) {
    if (non_player_should_ignore_damage_signature(attacker, objweapon, inflictor, meansofdeath)) {
        return true;
    }
    if (isdefined(objweapon) && isdefined(objweapon.basename)) {
        var_e36d0c5378e4855b = objweapon.basename;
        var_e36d0c5378e4855b = strip_suffix(var_e36d0c5378e4855b, "_mp");
        var_e36d0c5378e4855b = strip_suffix(var_e36d0c5378e4855b, "_cp");
        if (meansofdeath != "MOD_MELEE") {
            switch (var_e36d0c5378e4855b) {
            case #"hash_7a7616547d22d1d4":
            case #"hash_cf4e7cba76f5287f":
            case #"hash_ec99c59936c1a84a": 
                return true;
            }
        }
        if (meansofdeath == "MOD_IMPACT") {
            switch (var_e36d0c5378e4855b) {
            case #"hash_36b7174a04de8799":
            case #"hash_3b51e79b2c293f51":
            case #"hash_5d11ac1131cddab1":
            case #"hash_9d57562863499a06":
            case #"hash_a0319e349a692b8f":
            case #"hash_d60cefc9485f062f":
            case #"hash_d9108a0595d7d0b9":
            case #"hash_f29476a8c0915592":
            case #"hash_fa1e80f6bd5b8e72":
            case #"hash_fe5ec41137ca1d39": 
                return true;
            }
        } else {
            switch (var_e36d0c5378e4855b) {
            case #"hash_1768b8fe4480e4b":
            case #"hash_8059d93d3568c07":
            case #"hash_1b4881cfd42bb6d8":
            case #"hash_42dcb6ce7ecb709c":
            case #"hash_45125a8f171b4fb9":
            case #"hash_4c57dd619266bfc9":
            case #"hash_63d44e71602ef0a0":
            case #"hash_752a9051bc22d228":
            case #"hash_8670ac083666f3a4":
            case #"hash_e042760d17966848":
            case #"hash_e1f6f84e4cd950eb":
            case #"hash_fb36696c0708bf42": 
                return true;
            }
        }
    }
    return false;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xbf07
// Size: 0x1a8
function non_player_should_ignore_damage_signature(attacker, objweapon, inflictor, meansofdeath) {
    if (!isdefined(self.ignoredamagesignatures)) {
        return false;
    }
    if (isdefined(objweapon) && isstring(objweapon)) {
        objweapon = makeweapon(objweapon);
    }
    foreach (signature in self.ignoredamagesignatures) {
        if (!isdefined(signature)) {
            return false;
        }
        if (signature.checkattacker) {
            if (!isdefined(signature.attacker)) {
                non_player_remove_ignore_damage_signature(signature.id);
                continue;
            } else if (!isdefined(attacker)) {
                continue;
            } else if (attacker != signature.attacker) {
                continue;
            }
        }
        if (signature.checkobjweapon) {
            if (!isdefined(objweapon) || isnullweapon(objweapon)) {
                continue;
            } else if (objweapon != signature.objweapon) {
                continue;
            }
        }
        if (signature.checkinflictor) {
            if (!isdefined(signature.inflictor)) {
                non_player_remove_ignore_damage_signature(signature.id);
                continue;
            } else if (!isdefined(inflictor)) {
                continue;
            } else if (inflictor != signature.inflictor) {
                continue;
            }
        }
        if (signature.checkmeansofdeath) {
            if (!isdefined(meansofdeath)) {
                continue;
            } else if (meansofdeath != signature.meansofdeath) {
                continue;
            }
        }
        return true;
    }
    return false;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc0b8
// Size: 0x24
function non_player_remove_ignore_damage_signature(id) {
    if (!isdefined(self.ignoredamagesignatures)) {
        return;
    }
    self.ignoredamagesignatures[id] = undefined;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xc0e4
// Size: 0x127
function non_player_add_ignore_damage_signature(attacker, objweapon, inflictor, meansofdeath) {
    if (!isdefined(self.ignoredamageid)) {
        self.ignoredamageid = 0;
    }
    if (!isdefined(self.ignoredamagesignatures)) {
        self.ignoredamagesignatures = [];
    }
    id = self.ignoredamageid;
    self.ignoredamageid++;
    if (isdefined(objweapon) && isstring(objweapon)) {
        objweapon = makeweapon(objweapon);
    }
    signature = spawnstruct();
    signature.id = id;
    signature.attacker = attacker;
    signature.objweapon = objweapon;
    signature.inflictor = inflictor;
    signature.meansofdeath = meansofdeath;
    signature.checkattacker = isdefined(attacker);
    signature.checkobjweapon = isdefined(objweapon) && !isnullweapon(objweapon);
    signature.checkinflictor = isdefined(inflictor);
    signature.checkmeansofdeath = isdefined(meansofdeath);
    self.ignoredamagesignatures[id] = signature;
    return id;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc214
// Size: 0x77
function explosivehandlemovers(parent, var_b5f7c0806632d99b) {
    data = spawnstruct();
    data.linkparent = parent;
    data.deathoverridecallback = &movingplatformdetonate;
    data.endonstring = "death";
    if (!isdefined(var_b5f7c0806632d99b) || !var_b5f7c0806632d99b) {
        data.invalidparentoverridecallback = &scripts\cp\cp_movers::moving_platform_empty_func;
    }
    thread scripts\cp\cp_movers::handle_moving_platforms(data);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc293
// Size: 0x56
function movingplatformdetonate(data) {
    if (!isdefined(data.lasttouchedplatform) || !isdefined(data.lasttouchedplatform.destroyexplosiveoncollision) || data.lasttouchedplatform.destroyexplosiveoncollision) {
        self notify("detonateExplosive");
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc2f1
// Size: 0x6f
function makeexplosiveusable() {
    if (self.owner scripts\cp_mp\utility\player_utility::_isalive()) {
        self setotherent(self.owner);
        self.trigger = spawn("script_origin", self.origin + getexplosiveusableoffset());
        self.trigger.owner = self;
        thread equipmentwatchuse(self.owner, 1);
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc368
// Size: 0x2c
function isplantedequipment(ent) {
    return isdefined(level.mines[ent getentitynumber()]) || istrue(ent.planted);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc39d
// Size: 0xe9
function equipmentwatchuse(owner, var_51bae54bde94fb33) {
    self notify("equipmentWatchUse");
    self endon("spawned_player");
    self endon("disconnect");
    self endon("equipmentWatchUse");
    self.trigger setcursorhint("HINT_NOICON");
    self.trigger namespace_47366e00aa4211f4::setexplosiveusablehintstring(self.weapon_name);
    self.trigger setselfusable(owner);
    self.trigger thread notusableforjoiningplayers(owner);
    if (isdefined(var_51bae54bde94fb33) && var_51bae54bde94fb33) {
        thread updatetriggerposition();
    }
    for (;;) {
        owner = self.trigger waittill("trigger");
        owner notify("pickup_equipment", self.weapon_name);
        owner setweaponammostock(self.weapon_name, owner getweaponammostock(self.weapon_name) + 1);
        deleteexplosive();
        self notify("death");
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc48e
// Size: 0x77
function updatetriggerposition() {
    self endon("death");
    for (;;) {
        if (isdefined(self) && isdefined(self.trigger)) {
            self.trigger.origin = self.origin + getexplosiveusableoffset();
            if (isdefined(self.bombsquadmodel)) {
                self.bombsquadmodel.origin = self.origin;
            }
        } else {
            return;
        }
        wait 0.05;
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc50d
// Size: 0x9d
function deleteexplosive(pickedup) {
    if (isdefined(self)) {
        if (isdefined(self.deletefunc)) {
            self thread [[ self.deletefunc ]]();
            self notify("deleted_equipment");
            return;
        }
        equipnum = self getentitynumber();
        equipkillcament = self.killcament;
        equiptrigger = self.trigger;
        var_150bc605dfcc72b9 = self.sensor;
        cleanupequipment(equipnum, equipkillcament, equiptrigger, var_150bc605dfcc72b9);
        self notify("deleted_equipment");
        self delete();
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc5b2
// Size: 0xe8
function ontacticalequipmentplanted(var_290d0681688fc94c, equipmentref, deletefunc) {
    var_290d0681688fc94c.equipmentref = equipmentref;
    var_290d0681688fc94c.deletefunc = deletefunc;
    var_290d0681688fc94c.planted = 1;
    if (!istrue(var_290d0681688fc94c.issuper)) {
        if (self.plantedtacticalequip.size) {
            self.plantedtacticalequip = array_removeundefined(self.plantedtacticalequip);
            if (self.plantedtacticalequip.size && self.plantedtacticalequip.size >= getmaxplantedtacticalequip(self)) {
                self.plantedtacticalequip[0] deleteexplosive();
            }
        }
        self.plantedtacticalequip[self.plantedtacticalequip.size] = var_290d0681688fc94c;
    }
    entnum = var_290d0681688fc94c getentitynumber();
    level.mines[entnum] = var_290d0681688fc94c;
    level notify("mine_planted");
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc6a2
// Size: 0x1c
function getmaxplantedtacticalequip(player) {
    var_30dc1c5e4b8568b0 = 0;
    var_30dc1c5e4b8568b0 = 4;
    return var_30dc1c5e4b8568b0;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc6c7
// Size: 0x5a
function equipmentdeathvfx(sfx) {
    fxent = spawnfx(getfx("equipment_sparks"), self.origin);
    triggerfx(fxent);
    if (!isdefined(sfx) || sfx == 0) {
        self playsound("sentry_explode");
    }
    fxent thread delayentdelete(1);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc729
// Size: 0x44
function equipmentdeletevfx() {
    fxent = spawnfx(getfx("placeEquipmentFailed"), self.origin);
    triggerfx(fxent);
    self playsound("mp_killstreak_disappear");
    fxent thread delayentdelete(1);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc775
// Size: 0x71
function monitordisownedequipment(player, equipment, var_93494d8d17d67d84) {
    level endon("game_ended");
    equipment endon("death");
    equipment notify("monitorDisownedEquipment()");
    equipment endon("monitorDisownedEquipment()");
    if (istrue(var_93494d8d17d67d84)) {
        player waittill_any_2("joined_team", "disconnect");
    } else {
        player waittill_any_3("joined_team", "joined_spectators", "disconnect");
    }
    equipment deleteexplosive();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc7ee
// Size: 0xba
function isprimaryweapon(weapon) {
    if (isweapon(weapon) && isnullweapon(weapon)) {
        return 0;
    }
    if (isstring(weapon) && weapon == "none") {
        return 0;
    }
    if (weaponinventorytype(weapon) != "primary") {
        return 0;
    }
    switch (weaponclass(weapon)) {
    case #"hash_690c0d6a821b42e":
    case #"hash_6191aaef9f922f96":
    case #"hash_61e969dacaaf9881":
    case #"hash_719417cb1de832b6":
    case #"hash_8cdaf2e4ecfe5b51":
    case #"hash_900cb96c552c5e8e":
    case #"hash_fa24dff6bd60a12d": 
        return 1;
    default: 
        return 0;
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc8b0
// Size: 0x1f
function getexplosiveusableoffset() {
    upvec = anglestoup(self.angles);
    return 10 * upvec;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc8d8
// Size: 0x57
function is_incompatible_weapon(weapon) {
    weaponname = undefined;
    if (isweapon(weapon)) {
        weaponname = weapon.basename;
    } else {
        weaponname = weapon;
    }
    if (isdefined(level.ammoincompatibleweaponslist)) {
        if (array_contains(level.ammoincompatibleweaponslist, weaponname)) {
            return true;
        }
    }
    return false;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc938
// Size: 0xa7
function get_weapon_level(weapon) {
    if (!isplayer(self)) {
        return int(1);
    }
    weaponname = undefined;
    if (isweapon(weapon)) {
        weaponname = weapon.basename;
    } else {
        weaponname = weapon;
    }
    if (isdefined(self.pap[weaponname])) {
        return self.pap[weaponname].lvl;
    }
    var_9211cdaadb7bca55 = getrawbaseweaponname(weaponname);
    if (isdefined(self.pap[var_9211cdaadb7bca55])) {
        return self.pap[var_9211cdaadb7bca55].lvl;
    }
    return int(1);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc9e8
// Size: 0x14
function can_upgrade(weapon, var_eb2e85b24c206ea5) {
    return false;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xca05
// Size: 0x28
function get_pap_camo(var_ceb40e0d9504f27a, baseweapon, currentweapon) {
    camo = undefined;
    return camo;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xca36
// Size: 0x50
function validate_current_weapon(var_ceb40e0d9504f27a, baseweapon, currentweapon) {
    if (isdefined(level.weapon_upgrade_path) && isdefined(level.weapon_upgrade_path[getweaponbasename(currentweapon)])) {
        currentweapon = level.weapon_upgrade_path[getweaponbasename(currentweapon)];
    }
    return currentweapon;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xca8f
// Size: 0x42
function getitemweaponname() {
    classname = self.classname;
    assert(getsubstr(classname, 0, 7) == "weapon_");
    weapname = getsubstr(classname, 7);
    return weapname;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xcada
// Size: 0x1ee
function watchweaponpickup(clip, stockammo) {
    level endon("game_ended");
    weapname = getitemweaponname();
    while (true) {
        player, droppeditem = self waittill("trigger");
        if (isdefined(player) && istestclient(player)) {
            continue;
        }
        currweapon = player getcurrentweapon();
        player thread watchpickupcomplete(weapname, currweapon, clip, stockammo);
        player notify("weapon_pickup", weapname);
        dirty = namespace_e0ee43ef2dddadaa::fixupplayerweapons(player, weapname);
        if (isdefined(droppeditem) || dirty) {
            break;
        }
    }
    assert(isdefined(player.tookweaponfrom));
    if (isdefined(droppeditem)) {
        player notify("manual_switch_from_minigun");
        droppedweaponname = droppeditem getitemweaponname();
        objweapon = makeweaponfromstring(droppedweaponname);
        if (isdefined(player.tookweaponfrom[droppedweaponname])) {
            droppeditem.owner = player.tookweaponfrom[droppedweaponname];
            player.tookweaponfrom[droppedweaponname] = undefined;
        }
        droppeditem.objweapon = objweapon.basename;
        droppeditem.targetname = "dropped_weapon";
        if (istrue(level.clearstockondrop)) {
            stockammo = 0;
        } else {
            stockammo = weaponstartammo(droppeditem);
        }
        weaponbasename = getweaponbasename(objweapon);
        if (isdefined(player.var_7aa597d25db76e44[weaponbasename])) {
            clip = player.var_7aa597d25db76e44[weaponbasename];
            player.var_7aa597d25db76e44[weaponbasename] = undefined;
        } else {
            clip = weaponclipsize(droppeditem);
        }
        droppeditem itemweaponsetammo(clip, stockammo);
        droppeditem thread watchweaponpickup(clip, stockammo);
    }
    player.tookweaponfrom[weapname] = self.owner;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xccd0
// Size: 0x1e0
function watchpickupcomplete(desiredweapon, previousweapon, clip, stockammo) {
    self endon("death");
    self endon("disconnect");
    self notify("watchPickupComplete()");
    self endon("watchPickupComplete()");
    startingweapon = self.currentweapon;
    success = 0;
    if (isstring(desiredweapon)) {
        desiredweapon = makeweaponfromstring(desiredweapon);
    }
    if (startingweapon == desiredweapon) {
        success = 1;
    } else {
        while (true) {
            waitframe();
            currentweapon = self.currentweapon;
            if (issameweapon(startingweapon, currentweapon, 0)) {
                continue;
            }
            if (issameweapon(desiredweapon, currentweapon, 0)) {
                success = 1;
            } else {
                success = 0;
            }
            break;
        }
    }
    if (success) {
        ammotype = namespace_6250b14b3f614101::br_ammo_type_for_weapon(desiredweapon);
        if (isdefined(ammotype)) {
            if (isdefined(stockammo)) {
                stock = stockammo + get_int_or_0(self.br_ammo[ammotype]);
            } else {
                stock = get_int_or_0(self.br_ammo[ammotype]);
            }
            self.br_ammo[ammotype] = stock;
            self setweaponammostock(desiredweapon, stock);
        }
        if (desiredweapon.basename == "iw9_lm_dblmg2_cp") {
            scripts\cp\killstreaks\juggernaut_cp::juggernautweaponpickedup(desiredweapon, previousweapon);
        }
        checkpoint = scripts\cp\cp_checkpoint::function_9eed75023a958c18();
        if (isdefined(checkpoint) && checkpoint != "" && isdefined(self.pers["last_checkpoint"]) && self.pers["last_checkpoint"] != checkpoint) {
            thread namespace_751288259782653c::function_7da7bd24b280d295();
        }
        weaponbasename = getweaponbasename(desiredweapon);
        self.var_7aa597d25db76e44[weaponbasename] = self getweaponammoclip(desiredweapon);
        thread notifyuiofpickedupweapon();
        self notify("finish_pickup_of_weapon", desiredweapon, previousweapon);
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xceb8
// Size: 0xf
function notifyuiofpickedupweapon() {
    self setclientomnvar("ui_weapon_pickup", 0);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcecf
// Size: 0x9b
function player_watchWeaponClip() {
    self endon("death_or_disconnect");
    self endon("faux_spawn");
    level endon("game_ended");
    self notify("player_watchWeaponClip");
    self endon("player_watchWeaponClip");
    self.var_7aa597d25db76e44 = [];
    for (;;) {
        objweapon = self waittill("weapon_fired");
        currentweapon = self getcurrentweapon();
        if (!isdefined(currentweapon) || isnullweapon(currentweapon)) {
            continue;
        }
        if (!isinventoryprimaryweapon(currentweapon)) {
            continue;
        }
        weaponbasename = getweaponbasename(currentweapon);
        self.var_7aa597d25db76e44[weaponbasename] = self getweaponammoclip(currentweapon);
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcf72
// Size: 0x190
function watchweaponusage(weaponhand) {
    self endon("death");
    self endon("disconnect");
    self endon("faux_spawn");
    level endon("game_ended");
    self notify("watchWeaponUsage");
    self endon("watchWeaponUsage");
    for (;;) {
        objweapon = self waittill("weapon_fired");
        currentweapon = self getcurrentweapon();
        if (!isdefined(currentweapon) || isnullweapon(currentweapon)) {
            continue;
        }
        if (!isinventoryprimaryweapon(currentweapon)) {
            continue;
        }
        if (isdefined(level.updateonusepassivesfunc)) {
            thread [[ level.updateonusepassivesfunc ]](self, getcompleteweaponname(currentweapon));
        }
        curtime = gettime();
        if (!isdefined(self.lastshotfiredtime)) {
            self.lastshotfiredtime = 0;
        }
        var_d6df3d735d181a6e = gettime() - self.lastshotfiredtime;
        self.lastshotfiredtime = curtime;
        if (isai(self)) {
            continue;
        }
        weaponbasename = getweaponbasename(currentweapon);
        if (!isdefined(self.shotsfiredwithweapon[weaponbasename])) {
            self.shotsfiredwithweapon[weaponbasename] = 1;
        } else {
            self.shotsfiredwithweapon[weaponbasename]++;
        }
        self.var_7aa597d25db76e44[weaponbasename] = self getweaponammoclip(currentweapon);
        if (!isdefined(self.accuracy_shots_fired)) {
            self.accuracy_shots_fired = 1;
        } else {
            self.accuracy_shots_fired++;
        }
        namespace_6c67e93a4c487d83::increment_player_career_shots_fired(self);
        if (isdefined(weaponbasename)) {
            if (isdefined(self.hitsthismag[weaponbasename])) {
                thread hitsthismag_update(weaponbasename, currentweapon);
            }
        }
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd10a
// Size: 0x80
function hitsthismag_update(baseweaponname, objweapon) {
    assert(isweapon(objweapon));
    self endon("death");
    self endon("disconnect");
    baseweaponname = objweapon.basename;
    self endon("updateMagShots_" + baseweaponname);
    self.hitsthismag[baseweaponname]--;
    wait 0.1;
    self notify("shot_missed", objweapon);
    self.consecutivehitsperweapon[baseweaponname] = 0;
    self.hitsthismag[baseweaponname] = weaponclipsize(objweapon);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd192
// Size: 0xa2
function watchweaponchange() {
    self endon("death");
    self endon("disconnect");
    self endon("faux_spawn");
    self notify("watchWeaponChange");
    self endon("watchWeaponChange");
    self.hitsthismag = [];
    weaponname = getweaponbasename(self getcurrentweapon());
    hitsthismag_init(weaponname);
    while (true) {
        objweapon = self waittill("weapon_change");
        weaponname = objweapon.basename;
        weapontracking_init(weaponname);
        if (isdefined(self.weapon_passives[objweapon.basename])) {
        }
        hitsthismag_init(weaponname);
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0xd23c
// Size: 0x1d8
function harpoon_impale_additional_func(weapon, eattacker, victim, vpoint, vdir, shitloc, spartname, var_19f6f25777706f34) {
    if (!issubstr(weapon, "harpoon")) {
        return;
    }
    victim startragdoll();
    contents = physics_createcontents(["physicscontents_solid", "physicscontents_glass", "physicscontents_missileclip", "physicscontents_vehicle"]);
    endpoint = vpoint + vdir * 4096;
    trace = scripts\engine\trace::ray_trace_detail(vpoint, endpoint, undefined, contents, undefined, 1);
    endpoint = trace["position"] - vdir * 12;
    flightdist = length(endpoint - vpoint);
    flighttime = flightdist / 1250;
    flighttime = clamp(flighttime, 0.05, 1);
    wait 0.05;
    var_a0480a10ee4e345f = vdir;
    var_c323f0cb880a051f = anglestoup(eattacker.angles);
    var_c1148ff802be2880 = vectorcross(var_a0480a10ee4e345f, var_c323f0cb880a051f);
    railent = spawn_tag_origin(vpoint, axistoangles(var_a0480a10ee4e345f, var_c1148ff802be2880, var_c323f0cb880a051f));
    railent moveto(endpoint, flighttime);
    constraint = spawnragdollconstraint(victim, shitloc, spartname, var_19f6f25777706f34);
    constraint.origin = railent.origin;
    constraint.angles = railent.angles;
    constraint linkto(railent);
    thread play_explosion_post_impale(endpoint, eattacker);
    thread impale_cleanup(victim, railent, flighttime + 0.05, constraint);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xd41c
// Size: 0x44
function impale_cleanup(evictim, railent, time, constraint) {
    evictim waittill_any_timeout_2(time, "death", "disconnect");
    constraint delete();
    railent delete();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd468
// Size: 0x43
function play_explosion_post_impale(explosion_location, player) {
    wait 2;
    player radiusdamage(explosion_location, 500, 1000, 500, player, "MOD_EXPLOSIVE");
    playfx(level._effect["penetration_railgun_explosion"], explosion_location);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd4b3
// Size: 0xc6
function weapontracking_init(weaponname) {
    if (!isdefined(weaponname) || weaponname == "none") {
        return;
    }
    if (!isdefined(self.shotsfiredwithweapon[weaponname])) {
        self.shotsfiredwithweapon[weaponname] = 0;
    }
    if (!isdefined(self.shotsontargetwithweapon[weaponname])) {
        self.shotsontargetwithweapon[weaponname] = 0;
    }
    if (!isdefined(self.headshots[weaponname])) {
        self.headshots[weaponname] = 0;
    }
    if (!isdefined(self.wavesheldwithweapon[weaponname])) {
        self.wavesheldwithweapon[weaponname] = 1;
    }
    if (!isdefined(self.downsperweaponlog[weaponname])) {
        self.downsperweaponlog[weaponname] = 0;
    }
    if (!isdefined(self.killsperweaponlog[weaponname])) {
        self.killsperweaponlog[weaponname] = 0;
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd581
// Size: 0x49
function hitsthismag_init(weaponname) {
    if (!isdefined(weaponname) || weaponname == "none") {
        return;
    }
    if (isinventoryprimaryweapon(weaponname) && !isdefined(self.hitsthismag[weaponname])) {
        self.hitsthismag[weaponname] = weaponclipsize(weaponname);
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xd5d2
// Size: 0x178
function addattachmenttoweapon(newweapon, var_effb4ae1788a8b10, maxammo) {
    currentweapon = self.currentweapon;
    weaponobj = currentweapon;
    newweapon = undefined;
    var_1c1a1a6f472d6e7a = 0;
    if (currentweapon.attachments.size == 0) {
        if (weaponobj canuseattachment(var_effb4ae1788a8b10)) {
            var_1c1a1a6f472d6e7a = 1;
        } else {
            var_1c1a1a6f472d6e7a = 0;
        }
    } else {
        for (j = 0; j < currentweapon.attachments.size; j++) {
            if (weaponobj canuseattachment(var_effb4ae1788a8b10) && attachmentsconflict(currentweapon.attachments[j], var_effb4ae1788a8b10, weaponobj) == "") {
                var_1c1a1a6f472d6e7a = 1;
                continue;
            }
            var_1c1a1a6f472d6e7a = 0;
            break;
        }
    }
    if (var_1c1a1a6f472d6e7a) {
        newweapon = weaponobj withattachment(var_effb4ae1788a8b10);
    }
    if (!isdefined(newweapon)) {
        if (!isbot(self)) {
            /#
                self iprintlnbold("<dev string:x10d>" + var_effb4ae1788a8b10);
            #/
        }
        return undefined;
    }
    clip_ammo = self getweaponammoclip(newweapon);
    stock_ammo = self getweaponammostock(newweapon);
    if (istrue(maxammo)) {
        clip_ammo = weaponclipsize(newweapon);
        stock_ammo = scripts\cp\utility::function_ed18a118c6fa5c4f(newweapon);
    }
    scripts\cp_mp\utility\inventory_utility::_takeweapon(currentweapon);
    self giveweapon(newweapon);
    self setweaponammoclip(newweapon, clip_ammo);
    self setweaponammostock(newweapon, stock_ammo);
    scripts\cp_mp\utility\inventory_utility::_switchtoweaponimmediate(newweapon);
    namespace_e0ee43ef2dddadaa::fixupplayerweapons(self, newweapon);
    return newweapon;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0xd753
// Size: 0x14c
function _buildweaponcustom(weapon, attachments, camo, reticle, variantid, attachmentids, cosmeticattachment, stickers, var_11a1fa68aeb971c0) {
    weaponname = weapon;
    tokens = strtok(weaponname, "_");
    index = 0;
    if (tokens[0] == "alt") {
        index++;
    }
    if (tokens[index] == "iw7") {
        /#
            self iprintln("<dev string:x9b>");
        #/
        return;
    }
    if (tokens[index] == "iw8") {
        rootname = weapon;
        if (!isdefined(attachments)) {
            attachments = [];
        }
        if (!isdefined(camo)) {
            camo = "none";
        }
        if (!isdefined(reticle)) {
            reticle = "none";
        }
        if (!isdefined(variantid)) {
            variantid = -1;
        }
        if (!isdefined(attachmentids)) {
            attachmentids = [];
        }
        if (!isdefined(cosmeticattachment)) {
            cosmeticattachment = "none";
        }
        if (!isdefined(stickers)) {
            stickers = [];
        }
        if (!isdefined(var_11a1fa68aeb971c0)) {
            var_11a1fa68aeb971c0 = 0;
        }
        if (!isplayer(self)) {
            return buildweapon(rootname, attachments, camo, reticle, variantid, attachmentids, cosmeticattachment, stickers, var_11a1fa68aeb971c0);
        }
        return buildweapon(rootname, attachments, camo, reticle, variantid, attachmentids, cosmeticattachment, stickers, var_11a1fa68aeb971c0);
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd8a7
// Size: 0x93
function checkforinvalidattachments(attachments, var_c7bd95b10c89cff8) {
    weaponobj = makeweapon(var_c7bd95b10c89cff8);
    var_503110dc18b08ab9 = [];
    foreach (attachment in attachments) {
        if (weaponobj canuseattachment(attachment)) {
            var_503110dc18b08ab9[var_503110dc18b08ab9.size] = attachment;
            continue;
        }
        /#
            thread invalidattachmentwarning(attachment, var_c7bd95b10c89cff8);
        #/
    }
    return var_503110dc18b08ab9;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xd943
// Size: 0x1f2
function function_29ba39c7e2adb57b(rootname, attachments, variantid) {
    if (isdefined(variantid) && variantid < 0) {
        variantid = undefined;
    }
    attachments = namespace_e0ee43ef2dddadaa::weaponattachremoveextraattachments(attachments);
    attachments = array_remove(attachments, "none");
    assertex(attachments.size <= 12, "buildWeapon() passed attachment array that was too large. Weapons only support up to 8 attachments.");
    attachdefaults = weaponattachdefaultmap(rootname);
    var_ac82e189f4d06152 = array_combine_unique(attachments, attachdefaults);
    var_c7bd95b10c89cff8 = weaponassetnamemap(rootname, variantid);
    if (var_ac82e189f4d06152.size > 0) {
        var_ac82e189f4d06152 = filterattachments(var_ac82e189f4d06152);
    }
    attachmentsextra = [];
    foreach (a in var_ac82e189f4d06152) {
        extra = attachmentmap_toextra(a);
        if (isdefined(extra)) {
            foreach (extraattach in extra) {
                attachmentsextra[attachmentsextra.size] = extraattach;
            }
        }
    }
    if (attachmentsextra.size > 0) {
        var_ac82e189f4d06152 = array_combine_unique(var_ac82e189f4d06152, attachmentsextra);
    }
    assertex(var_ac82e189f4d06152.size <= 12, "buildWeapon() ended up with over 12 attachments after mods and defaults were added.");
    if (isdefined(variantid)) {
        var_3482901e4b0e85e4 = getweaponvariantattachments(var_c7bd95b10c89cff8, variantid);
        foreach (var_9aa34a1fe21f66ff in var_3482901e4b0e85e4) {
            var_ac82e189f4d06152[var_ac82e189f4d06152.size] = var_9aa34a1fe21f66ff;
        }
    }
    var_580837ba9de8f3d4 = undefined;
    return var_ac82e189f4d06152;
}

/#

    // Namespace weapon / namespace_a0628d6954815ef8
    // Params 6, eflags: 0x0
    // Checksum 0x0, Offset: 0xdb3e
    // Size: 0x107
    function debug_circle(center, radius, duration, color, startdelay, var_d5c216e05ee2afc5) {
        circle_sides = 16;
        anglefrac = 360 / circle_sides;
        circlepoints = [];
        for (i = 0; i < circle_sides; i++) {
            angle = anglefrac * i;
            var_8a9f895755fd607e = cos(angle) * radius;
            var_d867033ab311670b = sin(angle) * radius;
            x = center[0] + var_8a9f895755fd607e;
            y = center[1] + var_d867033ab311670b;
            z = center[2];
            circlepoints[circlepoints.size] = (x, y, z);
        }
        if (isdefined(startdelay)) {
            wait startdelay;
        }
        thread function_74b455b83954e07b(circlepoints, duration, color, var_d5c216e05ee2afc5, center);
    }

    // Namespace weapon / namespace_a0628d6954815ef8
    // Params 5, eflags: 0x0
    // Checksum 0x0, Offset: 0xdc4d
    // Size: 0xa8
    function function_74b455b83954e07b(circlepoints, duration, color, var_d5c216e05ee2afc5, center) {
        if (!isdefined(var_d5c216e05ee2afc5)) {
            var_d5c216e05ee2afc5 = 0;
        }
        if (!isdefined(center)) {
            var_d5c216e05ee2afc5 = 0;
        }
        for (i = 0; i < circlepoints.size; i++) {
            start = circlepoints[i];
            if (i + 1 >= circlepoints.size) {
                end = circlepoints[0];
            } else {
                end = circlepoints[i + 1];
            }
            thread scripts\cp\cp_debug::debug_line(start, end, duration, color);
            if (var_d5c216e05ee2afc5) {
                thread scripts\cp\cp_debug::debug_line(center, start, duration, color);
            }
        }
    }

    // Namespace weapon / namespace_a0628d6954815ef8
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xdcfd
    // Size: 0xc2
    function function_2778968efa18eb6a() {
        level endon("<dev string:x13f>");
        flag_init("<dev string:x14a>");
        while (true) {
            flag_wait("<dev string:x14a>");
            flag_clear("<dev string:x14a>");
            var_adf413595ed38fe3 = setdvar(@"hash_2e8bd550ed0544cd", 1);
            camos = setdvar(@"hash_900dcba8cdf5e65c", 1);
            attachments = setdvar(@"hash_99387041680b1bdf", 1);
            variants = setdvar(@"hash_ca742b19bf89b13d", 1);
            var_c2ffa607013ba4b2 = setdvar(@"hash_a473ce988b9649e", "<dev string:x15d>");
        }
    }

    // Namespace weapon / namespace_a0628d6954815ef8
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xddc7
    // Size: 0x7c
    function function_f81df2bd8c245b4e(var_66acbb61c1a9e1e, var_c2ffa607013ba4b2) {
        weapontokens = strtok(var_c2ffa607013ba4b2, "<dev string:x15e>");
        foreach (token in weapontokens) {
            if (issubstr(var_66acbb61c1a9e1e, token)) {
                return 1;
            }
        }
        return 0;
    }

#/

// Namespace weapon / namespace_a0628d6954815ef8
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xde4b
// Size: 0x27e
function applyflashfromdamage(victim, attacker, origin, var_73c2061b38dc4d56) {
    victim endon("death");
    if (isdefined(victim.usingremote)) {
        return false;
    }
    if (isdefined(victim.vehicle)) {
        return false;
    }
    if (!victim scripts\cp_mp\utility\player_utility::_isalive()) {
        return false;
    }
    if (is_friendly_damage(victim, attacker) && victim != attacker) {
        return false;
    }
    dist = distance(origin, victim.origin);
    var_cb2d2cdf15da89ff = 0;
    if (attacker == victim) {
        if (dist > 384) {
            return false;
        } else {
            var_cb2d2cdf15da89ff = 1;
        }
    }
    var_782c6796f4c5a826 = 0;
    var_3baba845edbbe939 = 0;
    var_4447761ae0fff3f = isagent(attacker) || isplayer(attacker);
    if (dist >= 512 || var_4447761ae0fff3f && !scripts\engine\utility::within_fov(attacker.origin, attacker getplayerangles(), origin, 0.5)) {
        var_782c6796f4c5a826 = 3;
        var_3baba845edbbe939 = 0.25;
    } else if (dist <= 256) {
        var_782c6796f4c5a826 = 5;
        var_3baba845edbbe939 = 0.75;
    } else {
        ratio = 1 - (dist - 256) / 256;
        var_782c6796f4c5a826 = 3 + ratio * 2;
        var_3baba845edbbe939 = 0.25 + ratio * 0.5;
    }
    if (var_73c2061b38dc4d56) {
        victim = attacker;
        var_782c6796f4c5a826 = max(3, var_782c6796f4c5a826 * 0.75);
        var_3baba845edbbe939 = max(0.25, var_3baba845edbbe939 * 0.75);
    } else if (var_cb2d2cdf15da89ff) {
        var_782c6796f4c5a826 = max(3, var_782c6796f4c5a826 * 0.75);
        var_3baba845edbbe939 = max(0.25, var_3baba845edbbe939 * 0.75);
    }
    if (isplayer(victim)) {
        victim shellshock("flashbang_mp", var_782c6796f4c5a826);
        victim.flashendtime = gettime() + int(var_782c6796f4c5a826 * 1000);
        victim thread flashrumbleloop(var_3baba845edbbe939);
    } else if (victim is_zombie_agent() || victim.agent_type == "soldier_agent" || victim.unittype == "soldier") {
        stunenemiesinrange(origin, attacker);
    } else {
        victim shellshock("flashbang_mp", var_782c6796f4c5a826);
        victim.flashendtime = gettime() + int(var_782c6796f4c5a826 * 1000);
        victim thread flashrumbleloop(var_3baba845edbbe939);
    }
    return true;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe0d2
// Size: 0x65
function isflashgrenadedamage(objweapon, smeansofdeath) {
    var_a62c0688fcaa530d = objweapon.basename == "flash_grenade_mp" || objweapon.basename == "flash_grenade_cp" || objweapon.basename == "jup_flash_grenade_cp";
    return var_a62c0688fcaa530d && smeansofdeath != "MOD_IMPACT";
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe140
// Size: 0x56
function flashrumbleloop(duration) {
    self endon("stop_monitoring_flash");
    self endon("flash_rumble_loop");
    self notify("flash_rumble_loop");
    goaltime = gettime() + duration * 1000;
    while (gettime() < goaltime) {
        self playrumbleonentity("damage_heavy");
        wait 0.05;
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe19e
// Size: 0x80
function giveequipmentasaweapon(equipmentname) {
    switch (equipmentname) {
    case #"hash_c9a436974fe60919": 
        self.last_weapon = self getcurrentweapon();
        self giveweapon("iw8_molotov_zm");
        self switchtoweapon("iw8_molotov_zm");
        break;
    case #"hash_abe1faf5b315f711": 
        self.last_weapon = self getcurrentweapon();
        self giveweapon("c4_mp");
        self switchtoweapon("c4_mp");
        break;
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe226
// Size: 0x6e
function watch_for_dropped_weapons() {
    while (true) {
        level waittill("ai_weapon_dropped");
        dropped_weapons = getweaponarray();
        foreach (weap in dropped_weapons) {
            weap setusepriority(1, 1);
        }
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe29c
// Size: 0x1c7
function drop_script_weapon_from_ai(droppedweapon, position) {
    if (istrue(level.var_624ba233506a543e) && !istrue(self.var_ced8415aaad3ff6d) || istrue(self.var_a0cb39f1fce66086)) {
        return;
    }
    name = droppedweapon.basename;
    if (isdefined(self.var_857ff4a1e09042d4)) {
        name = self.var_857ff4a1e09042d4.basename;
    }
    if (array_contains(level.invalid_drop_weapons, name)) {
        return;
    }
    attachments = droppedweapon.attachments;
    if (scripts\cp_mp\utility\game_utility::function_d2d2b803a7b741a4()) {
        if (droppedweapon canuseattachment("laserir_box")) {
            droppedweapon = droppedweapon withattachment("laserir_box");
        }
        if (droppedweapon canuseattachment("laserir_pstl")) {
            droppedweapon = droppedweapon withattachment("laserir_pstl");
        }
        if (droppedweapon canuseattachment("laserir_cyl")) {
            droppedweapon = droppedweapon withattachment("laserir_cyl");
        }
    }
    dvar = getdvar(@"hash_f12ca0fa2674622f", "");
    if (dvar != "") {
        if (name == "iw8_sn_xmike109_mp") {
        } else {
            attachments = array_add(attachments, dvar);
        }
    }
    if (player_has_nvg()) {
        var_6e9bbc4d48f38065 = 1;
    } else {
        var_6e9bbc4d48f38065 = undefined;
    }
    if (utility::iscp()) {
        var_3ace5ac9c7d6fa44 = undefined;
        if (isagent(self) && self isinexecutionvictim()) {
            var_3ace5ac9c7d6fa44 = 1;
        }
        weapon = namespace_6250b14b3f614101::function_8a9c22c541e0dd5b(droppedweapon, var_3ace5ac9c7d6fa44);
        return;
    }
    weapon = namespace_6250b14b3f614101::createspawnweaponatpos(self.origin + (0, 0, 32), self.angles, droppedweapon);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe46b
// Size: 0x3b
function player_has_nvg() {
    if (istrue(level.nightmap)) {
        return true;
    }
    if (level.script == "cp_so_estate" || level.script == "cp_mission_bads") {
        return true;
    }
    return false;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe4af
// Size: 0x58
function delete_weapon_after_time() {
    level endon("game_ended");
    self endon("death");
    self endon("entitydeleted");
    if (getdvarint(@"hash_c564069ec13375cb", 0) != 0) {
        return;
    }
    if (isdefined(level.var_4b47eedac44a48)) {
        wait level.var_4b47eedac44a48;
    } else {
        wait 30;
    }
    remove_from_weapon_array(self);
    self delete();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe50f
// Size: 0x16
function update_dropped_weapon_priorities() {
    self setusepriority(1, 1);
    self setuserange(72);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe52d
// Size: 0x42b
function initializeweaponpickups() {
    if (isdefined(level.custom_allowedweaponnames)) {
        var_e6aa5314b387ae5 = level.custom_allowedweaponnames;
    } else {
        var_e6aa5314b387ae5 = ["iw8_ar_falpha", "iw8_sm_papa90", "iw8_sm_augolf", "iw8_lm_pkilo", "iw8_sn_alpha50", "iw8_pi_mike1911", "iw8_ar_mike4", "iw8_ar_akilo47", "iw8_sm_mpapa5", "iw8_sh_dpapa12", "iw8_lm_kilo121", "iw8_sn_mike14", "iw8_sn_kilo98", "iw8_pi_golf21", "iw8_sn_crossbow"];
    }
    var_bf8fe275eba37cc1 = getstructarray("weapon_pickup", "script_noteworthy");
    foreach (st in var_bf8fe275eba37cc1) {
        if (isdefined(st.script_parameters)) {
            name = getcompletenameforweapon(st.script_parameters + "_mp");
            println("<dev string:x160>" + name);
            weapon = spawn("weapon_" + name, st.origin);
            weapon itemweaponsetammo(weaponclipsize(name), scripts\cp\utility::function_ed18a118c6fa5c4f(name));
            weapon thread watchweaponpickup();
            var_bf8fe275eba37cc1 = array_remove(var_bf8fe275eba37cc1, st);
        }
    }
    weapons = [];
    attachmentsarray = [];
    foreach (root, data in level.weaponmapdata) {
        foreach (name in var_e6aa5314b387ae5) {
            if (root == name) {
                var_52222e4fa76f795e = strtok(root, "_");
                if (var_52222e4fa76f795e[0] == "iw8") {
                    weapons[weapons.size] = root;
                    level.attachmentmap[root] = pullattachmentsforweapon(root);
                }
            }
        }
    }
    weapons = eliminatenullweapons(weapons);
    weaponindex = 0;
    counter = 0;
    var_ca5370d04fce3797 = var_bf8fe275eba37cc1.size;
    while (counter < var_ca5370d04fce3797) {
        weaponindex = randomintrange(0, weapons.size);
        attachments = attachmentroll(weapons[weaponindex]);
        foreach (attachment in attachments) {
            foreach (att in attachments) {
                if (attachment == att) {
                    continue;
                }
                if (attachmentsconflict(attachment, att, weapons[weaponindex])) {
                    attachments = array_remove(attachments, att);
                }
            }
        }
        name = getcompletenameforweapon(weapons[weaponindex]);
        println("<dev string:x160>" + weapons[weaponindex]);
        weapon = spawn("weapon_" + name, var_bf8fe275eba37cc1[counter].origin);
        if (isdefined(var_bf8fe275eba37cc1[counter].angles)) {
            weapon.angles = var_bf8fe275eba37cc1[counter].angles;
        } else {
            weapon.angles = (0, 0, 0);
        }
        weapon itemweaponsetammo(weaponclipsize(name), scripts\cp\utility::function_ed18a118c6fa5c4f(name));
        weapon thread watchweaponpickup();
        counter++;
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe960
// Size: 0x7c
function attachmentroll(rootname) {
    attachments = [];
    if (isdefined(level.attachmentmap[rootname])) {
        var_d7af4ffcc6535706 = array_randomize(level.attachmentmap[rootname]);
        var_a8e6266c4ed31034 = attachmentrollcount();
        for (idx = 0; idx < var_a8e6266c4ed31034 && idx < var_d7af4ffcc6535706.size; idx++) {
            attachments[attachments.size] = var_d7af4ffcc6535706[idx];
        }
    }
    return attachments;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe9e5
// Size: 0x62
function attachmentrollcount() {
    roll = randomint(80 + 15 + 5);
    if (roll < 50) {
        return 0;
    } else if (roll < 80) {
        return 1;
    } else if (roll < 80 + 15) {
        return 2;
    } else if (roll < 80 + 15 + 5) {
        return 3;
    }
    assertmsg("attachmentRollCount() has a rolled value greater than it's max possible value. Recheck the Weight Rolls");
    return 0;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xea50
// Size: 0xb0
function pullattachmentsforweapon(weaponname) {
    assertex(isdefined(weaponname), "Please pass a defined value for weaponName");
    attachmentslots = namespace_e0ee43ef2dddadaa::function_c471a035d22df5eb();
    rootname = getweaponrootname(weaponname);
    var_c7bd95b10c89cff8 = weaponassetnamemap(rootname);
    foreach (attachmentslot in attachmentslots) {
        var_800dfe719bf87a3f = function_75b035199842693d(var_c7bd95b10c89cff8, attachmentslot);
        return returnarraywithoutdefaults(var_800dfe719bf87a3f, weaponname);
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xeb08
// Size: 0xf0
function returnarraywithoutdefaults(attachmentarray, weaponname) {
    assertex(isdefined(weaponname), "Please pass a defined value for weaponName");
    assertex(isdefined(attachmentarray), "Please pass a defined value for attachmentArray");
    assertex(attachmentarray.size > 0, "Please pass a NON-EMPTY attachmentArray");
    foreach (struct in level.weaponmapdata) {
        if (weaponname == rootname) {
            if (array_contains(attachmentarray, "doubletap")) {
                attachmentarray = array_remove(attachmentarray, "doubletap");
            }
            if (array_contains(attachmentarray, "reconsilencer_cp")) {
                attachmentarray = array_remove(attachmentarray, "reconsilencer_cp");
            }
            if (isdefined(struct.attachdefaults)) {
                return array_remove_array(attachmentarray, struct.attachdefaults);
            }
        }
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xec00
// Size: 0xd5
function eliminatenullweapons(weaponsarray) {
    array = ["iw8_knife", "iw9_me_fists", "iw9_knifestab", "none", "speciality_null", "iw8_ar_dummycp", "iw8_ar_dummycs", "iw8_me_riotshield"];
    newarray = [];
    if (isstruct(random(weaponsarray))) {
        foreach (basename, struct in weaponsarray) {
            if (!array_contains(array, basename)) {
                newarray[basename] = struct;
            }
        }
        return newarray;
    }
    return array_remove_array(weaponsarray, array);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xecde
// Size: 0x86
function choosepassive() {
    while (true) {
        var_a6af9f073d6e07c2 = random(level.lootpassivesstructs);
        foreach (struct in level.cp_weapon_passives) {
            if (var_a6af9f073d6e07c2.name == passive) {
                return var_a6af9f073d6e07c2;
            }
        }
        waitframe();
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xed6c
// Size: 0xe
function grenadeinpullback() {
    return !isnullweapon(self getheldoffhand());
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xed83
// Size: 0x174
function grenadeinitialize(grenade, weapon_object, tickpercent, originalowner) {
    assert(isdefined(self), "grenadeInitialize called on undefined entity");
    assert(isdefined(grenade), "grenadeInitialize called with undefined param: grenade");
    if (!isdefined(grenade.weapon_object)) {
        grenade.weapon_object = weapon_object;
    }
    if (!isdefined(grenade.weapon_name)) {
        grenade.weapon_name = weapon_object.basename;
    }
    if (!isdefined(grenade.owner)) {
        grenade.owner = self;
    }
    if (!isdefined(grenade.team)) {
        grenade.team = self.team;
    }
    if (!isdefined(grenade.tickpercent)) {
        grenade.tickpercent = tickpercent;
    }
    if (!isdefined(grenade.ticks) && isdefined(grenade.tickpercent)) {
        grenade.ticks = roundup(4 * tickpercent);
    }
    equipmentref = namespace_4fb9dddfb8c1a67a::getequipmentreffromweapon(weapon_object);
    if (isdefined(equipmentref)) {
        grenade.equipmentref = equipmentref;
        grenade.isequipment = 1;
        grenade.bundle = namespace_4fb9dddfb8c1a67a::function_2113b6f7cb462692(grenade.weapon_name);
    }
    grenade.threwback = isdefined(originalowner);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xeeff
// Size: 0x3b
function function_f69ed22535d90b78() {
    self endon("death");
    level endon("game_ended");
    stuckdata = spawnstruct();
    childthread function_bdde0931accf955b(stuckdata);
    childthread function_449e67a68fa04968(stuckdata);
    self waittill("missile_impact");
    return stuckdata;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xef43
// Size: 0x3f
function function_bdde0931accf955b(stuckdata) {
    self endon("missile_impact");
    stuckto = self waittill("missile_stuck");
    if (isdefined(stuckto)) {
        stuckdata.stuckto = stuckto;
    }
    self notify("missile_impact");
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xef8a
// Size: 0x30
function function_449e67a68fa04968(stuckdata) {
    self endon("missile_impact");
    self waittill("missile_water_impact");
    stuckdata.isunderwater = 1;
    self notify("missile_impact");
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xefc2
// Size: 0x5e
function function_4af015619e2534ba(stuckto, destroyfunc, isimmediate) {
    level endon("game_ended");
    self endon("death");
    if (isdefined(self.owner)) {
        self.owner endon("disconnect");
    }
    stuckto waittill_any_2("death", "destroy");
    self thread [[ destroyfunc ]](isimmediate);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf028
// Size: 0x120
function updatelastweapon() {
    self endon("disconnect");
    self endon("faux_spawn");
    self.lastnormalweaponobj = ter_op(isdefined(self.spawnweaponobj), self.spawnweaponobj, nullweapon());
    self.lastweaponobj = ter_op(isdefined(self.spawnweaponobj), self.spawnweaponobj, nullweapon());
    self.lastdroppableweaponobj = ter_op(isdefined(self.spawnweaponobj), self.spawnweaponobj, nullweapon());
    self.lastcacweaponobj = ter_op(isdefined(self.spawnweaponobj) && iscacprimaryorsecondary(self.spawnweaponobj), self.spawnweaponobj, nullweapon());
    while (true) {
        objnewweapon = self waittill("weapon_change");
        self.lastweaponobj = objnewweapon;
        if (isnormallastweapon(objnewweapon)) {
            self.lastnormalweaponobj = objnewweapon;
        }
        if (isdroppableweapon(objnewweapon)) {
            self.lastdroppableweaponobj = objnewweapon;
        }
        if (iscacprimaryorsecondary(objnewweapon)) {
            self.lastcacweaponobj = objnewweapon;
        }
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf150
// Size: 0x90
function isnormallastweapon(objweapon) {
    if (objweapon.basename == "none") {
        return false;
    }
    if (objweapon.classname == "turret") {
        return false;
    }
    if (issuperweapon(objweapon.basename)) {
        return false;
    }
    if (iskillstreakweapon(objweapon.basename)) {
        return false;
    }
    if (objweapon.inventorytype != "primary" && objweapon.inventorytype != "altmode") {
        return false;
    }
    return true;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf1e9
// Size: 0x196
function getweapontype(weapon) {
    if (!isdefined(weapon)) {
        assertmsg("getWeaponType called without a weapon name passed in");
        return;
    }
    if (iscacprimaryweapon(weapon)) {
        return "primary";
    }
    if (iscacsecondaryweapon(weapon)) {
        return "secondary";
    }
    if (iskillstreakweapon(weapon)) {
        return "killstreak";
    }
    if (issuperweapon(weapon)) {
        return "super";
    }
    if (isdefined(level.weaponattachments[weapon])) {
        return "attachment";
    }
    if (weapon == "iw8_turret_50cal_mp") {
        return "turret";
    }
    if (weapon == "rock_mp") {
        return "rock";
    }
    if (string_starts_with(weapon, "destructible_")) {
        return "destructible";
    }
    if (isvehicleweapon(weapon)) {
        return "vehicle";
    }
    if (isspecialmeleeweapon(weapon) || weapon == "iw8_defibrillator_mp") {
        return "special_melee";
    }
    if (isenvironmentweapon(weapon)) {
        return "environment";
    }
    equipmenttype = getequipmenttype(weapon);
    if (isdefined(equipmenttype)) {
        return equipmenttype;
    }
    if (weapon == "none") {
        return "worldspawn";
    }
    if (weapon == "bomb_site_mp") {
        return weapon;
    }
    if (weapon == "iw9_racecar_mp") {
        return weapon;
    }
    if (weapon == "iw8_gunless") {
        return "gunless";
    }
    if (isstring(weapon) && (weapon == "iw8_armor_marker_cp" || weapon == "ks_assault_drone_mp" || weapon == "ks_assault_drone_cp" || weapon == "sonar_pulse_mp" || weapon == "ks_remote_drone_mp" || weapon == "deploy_sentry_mp")) {
        return "super";
    }
    assertmsg("unknown weapon type: " + weapon);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf387
// Size: 0x8b
function iscacprimaryweapon(weapon) {
    switch (getweapongroup(weapon)) {
    case #"hash_bef5ec0b3e197ae":
    case #"hash_16cf6289ab06bd30":
    case #"hash_47368bc0d2ef1565":
    case #"hash_86b11ac21f992552":
    case #"hash_8af0086b038622b5":
    case #"hash_ab10f9c080fe4faf":
    case #"hash_c095d67337b1f5a1":
    case #"hash_dd616da0b395a0b0": 
        return 1;
    default: 
        return 0;
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf41a
// Size: 0x5e
function isspecialmeleeweapon(weapon) {
    if (ismeleeoverrideweapon(weapon)) {
        return true;
    }
    weapname = undefined;
    if (isweapon(weapon)) {
        if (isnullweapon(weapon)) {
            return false;
        }
        weapname = weapon.basename;
    } else {
        if (weapon == "none") {
            return false;
        }
        weapname = weapon;
    }
    return weapname == "iw9_me_fists_mp_ls";
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf481
// Size: 0x63
function ismeleeoverrideweapon(weapon) {
    if (isweapon(weapon)) {
        weaponname = weapon.basename;
    } else {
        weaponname = weapon;
    }
    return weaponname == "iw9_knifestab_mp" || weaponname == "iw9_me_climbfists" || weaponname == "iw9_knifestab_mp" || weaponname == "iw8_throwingknife_fire_melee_mp" || weaponname == "iw8_throwingknife_electric_melee_mp";
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf4ed
// Size: 0xc1
function getweapongroup(weapon) {
    if (!isdefined(weapon)) {
        return "other";
    }
    if (isweapon(weapon) && isnullweapon(weapon)) {
        return "other";
    }
    if (isstring(weapon) && (weapon == "none" || weapon == "alt_none")) {
        return "other";
    }
    rootname = getweaponrootname(weapon);
    group = weapongroupmap(rootname);
    if (!isdefined(group)) {
        if (issuperweapon(weapon)) {
            group = "super";
        } else if (isenvironmentweapon(weapon)) {
            group = "weapon_mg";
        } else if (iskillstreakweapon(weapon)) {
            group = "killstreak";
        } else {
            group = "other";
        }
    }
    return group;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf5b7
// Size: 0x73
function iscacsecondaryweapon(weapon) {
    switch (getweapongroup(weapon)) {
    case #"hash_6f796b5c69cec63":
    case #"hash_34340d457a63e7f1":
    case #"hash_46b22b021532342e":
    case #"hash_9d18adab1b65a661":
    case #"hash_a1f27f97be15d620":
    case #"hash_c9c190665b9c4a1d": 
        return 1;
    default: 
        return 0;
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf632
// Size: 0x1d
function iscacprimaryorsecondary(weapon) {
    return iscacprimaryweapon(weapon) || iscacsecondaryweapon(weapon);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf658
// Size: 0xd2
function isdroppableweapon(objweapon) {
    if (objweapon.basename == "none") {
        return false;
    }
    if (isfistweapon(objweapon.basename)) {
        return false;
    }
    if (isdefined(self) && istrue(self.inlaststand)) {
        return false;
    }
    if (iskillstreakweapon(objweapon.basename)) {
        return false;
    }
    if (issuperweapon(objweapon.basename)) {
        return false;
    }
    if (objweapon.inventorytype != "primary") {
        return false;
    }
    if (objweapon.classname == "turret") {
        return false;
    }
    if (!iscacprimaryweapon(objweapon.basename) && !iscacsecondaryweapon(objweapon.basename)) {
        return false;
    }
    return true;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf733
// Size: 0x89
function gui_giveattachment() {
    var_effb4ae1788a8b10 = getdvar(@"hash_c87017f600b49447");
    if (isdefined(var_effb4ae1788a8b10)) {
        foreach (player in level.players) {
            gui_giveattachment_internal(player, var_effb4ae1788a8b10);
        }
    }
    /#
        setdevdvar(@"hash_c87017f600b49447", "<dev string:x15d>");
    #/
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf7c4
// Size: 0x214
function gui_giveattachment_internal(player, var_effb4ae1788a8b10) {
    newweapon = player.currentweapon;
    player dropitem(newweapon);
    newweapon = newweapon getnoaltweapon();
    var_be36140d4ad4c0b5 = getweaponattachments(newweapon);
    var_a3a475e000c0fa3f = 0;
    if (array_contains(var_be36140d4ad4c0b5, var_effb4ae1788a8b10)) {
        var_a3a475e000c0fa3f = 1;
    } else if (!newweapon canuseattachment(var_effb4ae1788a8b10)) {
        if (!isbot(player)) {
            player iprintlnbold("Invalid attachment for this weapon: " + var_effb4ae1788a8b10);
        }
        var_a3a475e000c0fa3f = 1;
    }
    if (var_a3a475e000c0fa3f) {
        player giveweapon(newweapon);
        return;
    }
    var_503110dc18b08ab9 = var_be36140d4ad4c0b5;
    var_503110dc18b08ab9[var_503110dc18b08ab9.size] = var_effb4ae1788a8b10;
    var_98efd9d21da41d1a = getweaponrootname(newweapon.basename);
    var_16d54486f31e87bb = function_29ba39c7e2adb57b(var_98efd9d21da41d1a, var_503110dc18b08ab9, -1);
    if (isdefined(newweapon.attachments)) {
        foreach (attachment in newweapon.attachments) {
            newweapon = newweapon withoutattachment(attachment);
        }
    }
    foreach (var_b75325027baaf52f in var_16d54486f31e87bb) {
        newweapon = newweapon withattachment(var_b75325027baaf52f);
    }
    attachments = getweaponattachments(newweapon);
    if (attachments.size > 12) {
        player iprintlnbold("Player / Bot already has 12 attachments: " + getcompleteweaponname(newweapon));
        return;
    }
    player giveweapon(newweapon);
    player setweaponammoclip(newweapon, weaponclipsize(newweapon));
    player setweaponammostock(newweapon, scripts\cp\utility::function_ed18a118c6fa5c4f(newweapon));
    player scripts\cp_mp\utility\inventory_utility::_switchtoweaponimmediate(newweapon);
    namespace_e0ee43ef2dddadaa::fixupplayerweapons(player, newweapon);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf9e0
// Size: 0x26
function watchgunsmithdebugui() {
    while (true) {
        player = level waittill("connected");
        player thread watchplayergunsmithdebugui();
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfa0e
// Size: 0x54
function watchplayergunsmithdebugui() {
    self endon("disconnect");
    while (true) {
        message, lootid = self waittill("luinotifyserver");
        if (message == "debug_attach_select") {
            ref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
            gui_giveattachment_internal(self, ref);
        }
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfa6a
// Size: 0xd9
function create_weapon_pickups() {
    var_e6191409b81f0bac = getstructarray("weapon_pickup", "targetname");
    for (i = 0; i < var_e6191409b81f0bac.size; i++) {
        toks = strtok(var_e6191409b81f0bac[i].script_noteworthy, "+");
        weapon = toks[0];
        attachments = [];
        if (toks.size > 1) {
            var_c0a8e96ce567d71 = strtok(toks[1], " ");
            for (j = 0; j < var_c0a8e96ce567d71.size; j++) {
                attachments[attachments.size] = var_c0a8e96ce567d71[j];
            }
        }
        weapon = spawn_script_weapon(weapon, attachments, var_e6191409b81f0bac[i].origin, var_e6191409b81f0bac[i].angles);
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xfb4b
// Size: 0x116
function spawn_script_weapon(weapon_name, attachments, spawn_origin, spawn_angles, var_6e9bbc4d48f38065) {
    if (!isdefined(attachments)) {
        attachments = [];
    }
    if (!isarray(attachments)) {
        attachments = [attachments];
    }
    weapon_obj = undefined;
    if (getdvarint(@"hash_4ca94ec2dbfb6d2f", 0) != 0) {
        weapon_obj = buildweaponwithrandomattachments(weapon_name, attachments);
    } else {
        weapon_obj = buildweapon(weapon_name, attachments, "none", "none", -1, undefined, undefined, undefined, var_6e9bbc4d48f38065);
    }
    name = getcompleteweaponname(weapon_obj);
    weapon = spawn("weapon_" + name, spawn_origin);
    if (isdefined(weapon)) {
        if (is_wave_gametype()) {
            weapon itemweaponsetammo(weaponclipsize(weapon), 0);
        } else {
            weapon itemweaponsetammo(weaponclipsize(weapon), weaponclipsize(weapon));
        }
        weapon.angles = spawn_angles;
        add_to_weapon_array(weapon);
        weapon thread thread_on_notify_no_endon_death("death", &remove_from_weapon_array);
    }
    return weapon;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfc6a
// Size: 0x21
function add_to_weapon_array(weapon) {
    level.dropped_weapons[level.dropped_weapons.size] = weapon;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfc93
// Size: 0x3c
function remove_from_weapon_array(weapon) {
    if (isdefined(weapon)) {
        if (array_contains(level.dropped_weapons, weapon)) {
            level.dropped_weapons = array_remove(level.dropped_weapons, weapon);
        }
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfcd7
// Size: 0x112
function smokegrenadeused(isgl) {
    thread notifyafterframeend("death", "end_explode");
    self endon("end_explode");
    thread function_e4f6e856495dbafb();
    if (istrue(isgl)) {
        stuckto, hitent, surfacetype, velocity, position, normal = self waittill("missile_stuck");
        thread smokeglvfx(position);
    } else {
        position = self waittill("explode");
    }
    if (getdvarint(@"hash_abe45e35ef030a56") == 0) {
        thread create_smoke_occluder(position);
    }
    thread smokegrenadeexplode(position);
    thread sfx_smoke_grenade_smoke(position);
    if (isdefined(self) && isdefined(self.owner)) {
        self.owner thread monitorsmokeactive();
        scripts\cp_mp\challenges::function_b0f754c8a379154e("equip_smoke", self.owner, undefined, function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfdf1
// Size: 0xc4
function create_smoke_occluder(origin) {
    if (isdefined(level.bot_smoke_sight_clip_large)) {
        occluder = spawn("script_model", origin);
        occluder show();
        wait 1;
        occluder clonebrushmodeltoscriptmodel(level.bot_smoke_sight_clip_large);
        occluder setmovertransparentvolume();
        wait 8.75;
        occluder delete();
        return;
    }
    occluder = spawn("script_model", origin);
    occluder setmodel("ainosight256x256x256");
    occluder show();
    origin = occluder gettagorigin("tag_origin");
    thread draw_line_for_time(origin, origin + (0, 0, 128), 1, 0, 0, 8.75);
    wait 1;
    occluder setmovertransparentvolume();
    wait 8.75;
    occluder delete();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xfebd
// Size: 0x33
function private function_e4f6e856495dbafb() {
    self endon("explode");
    self endon("death");
    impactdata = self waittill("missile_water_impact");
    self notify("end_explode");
    thread function_9e58baa59719d027();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xfef8
// Size: 0x6d
function private function_9e58baa59719d027() {
    self endon("explode");
    self endon("death");
    stuckdata = self waittill("missile_stuck");
    position = self.origin;
    thread smokegrenadeexplode(position);
    thread sfx_smoke_grenade_smoke(position);
    if (isdefined(self) && isdefined(self.owner)) {
        self.owner thread monitorsmokeactive();
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xff6d
// Size: 0x5d
function smokegrenadeexplode(position) {
    level endon("game_ended");
    wait 1;
    thread smokegrenadegiveblindeye(position);
    if (getdvarint(@"hash_abe45e35ef030a56") == 1) {
        function_8a09c0e5fa78a48c(position);
    }
    id = scripts\cp\cp_outline_utility::addoutlineoccluder(position, 330);
    wait 8.25;
    scripts\cp\cp_outline_utility::removeoutlineoccluder(id);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xffd2
// Size: 0xa0
function smokegrenadegiveblindeye(position) {
    level endon("game_ended");
    struct = spawnstruct();
    struct.blindeyerecipients = [];
    smokegrenademonitorblindeyerecipients(struct, position);
    foreach (recipient in struct.blindeyerecipients) {
        if (isdefined(recipient) && scripts\cp\utility\player::isreallyalive(recipient)) {
            recipient namespace_c4cab616edf9b2b9::removeperk("specialty_blindeye");
        }
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1007a
// Size: 0x1c5
function smokegrenademonitorblindeyerecipients(struct, position) {
    level endon("game_ended");
    endtime = gettime() + 8.25 * 1000;
    players = [];
    while (gettime() < endtime) {
        players = getplayersinradius(position, 330);
        foreach (var_6758a6f2fd1b6491, recipient in struct.blindeyerecipients) {
            if (!isdefined(recipient)) {
                struct.blindeyerecipients[var_6758a6f2fd1b6491] = undefined;
                continue;
            }
            playersid = array_find(players, recipient);
            if (!isdefined(playersid) || !scripts\cp\utility\player::isreallyalive(recipient)) {
                recipient namespace_c4cab616edf9b2b9::removeperk("specialty_blindeye");
                struct.blindeyerecipients[var_6758a6f2fd1b6491] = undefined;
            }
            if (isdefined(playersid)) {
                players[playersid] = undefined;
            }
        }
        foreach (player in players) {
            if (!isdefined(player) || !isplayer(player)) {
                continue;
            }
            player.lastinsmoketime = gettime();
            if (isdefined(struct.blindeyerecipients[player getentitynumber()])) {
                continue;
            }
            if (!scripts\cp\utility\player::isreallyalive(player)) {
                continue;
            }
            player giveperk("specialty_blindeye");
            if (isdefined(self) && isdefined(self.owner)) {
            }
            struct.blindeyerecipients[player getentitynumber()] = player;
        }
        waitframe();
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10247
// Size: 0x72
function sfx_smoke_grenade_smoke(position) {
    wait 0.2;
    soundorg = spawn("script_origin", position);
    soundorg playloopsound("smoke_grenade_smoke_lp");
    soundorg scripts\cp_mp\ent_manager::registerspawncount(1);
    wait 5.25;
    thread play_sound_in_space("smoke_grenade_smoke_tail", position);
    wait 0.3;
    if (isdefined(soundorg)) {
        soundorg stoploopsound();
    }
    soundorg scripts\cp_mp\ent_manager::deregisterspawn();
    soundorg delete();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x102c1
// Size: 0x37
function smokeglvfx(position, normal) {
    playfx(getfx("glsmoke"), position, anglestoup((0, 90, 0)));
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10300
// Size: 0x69
function monitorsmokeactive() {
    self endon("disconnect");
    level endon("game_ended");
    self notify("monitorSmokeActive()");
    self endon("monitorSmokeActive()");
    printgameaction("smoke grenade activated", self);
    self.hasactivesmokegrenade = 1;
    result = waittill_any_timeout_1(9.25, "death");
    self.hasactivesmokegrenade = 0;
    printgameaction("smoke grenade deactivated", self);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0x10371
// Size: 0x93
function buildweaponwithrandomattachments(rootname, attachments, camo, reticle, variantid, var_d1fd16429ab57618, var_fd85da04b063943, var_b022d4bb3c3772b3, cosmeticattachment, var_11a1fa68aeb971c0, var_341394bbceb99516) {
    basename = getweaponrootname(rootname);
    if ((!isdefined(var_341394bbceb99516) || var_341394bbceb99516) && !!isai(self)) {
        return;
    }
    return getweapon(basename, weaponclass(rootname));
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1040d
// Size: 0x81
function getweapon(weaponname, weapontype) {
    weaponarray = [];
    if (isarray(weaponname)) {
        weaponarray = weaponname;
        weaponname = weaponname[randomint(weaponname.size)];
    } else {
        weaponarray = [weaponname];
    }
    if (true) {
        return getweapon_aq(weapontype, weaponname, weaponarray);
    }
    if (issubstr(tolower(self.classname), "_alq_")) {
        return getweapon_aq(weapontype, weaponname, weaponarray);
    } else {
        return buildweapon(weaponname);
    }
    return weaponname;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10497
// Size: 0x1c9
function getweapon_hero(weaponname, weaponarray) {
    if (issubstr(tolower(self.classname), "_hero_alex")) {
        switch (weaponname) {
        case #"hash_fbeff8fdb669137d": 
            return make_weapon_special("alex_sniper");
        }
    } else if (issubstr(tolower(self.classname), "_hero_kyle")) {
        switch (weaponname) {
        case #"hash_73c7376a3c1f158c": 
            return make_weapon_special("iw9_ar_mcharlie_v2_cp");
        }
    } else if (issubstr(tolower(self.classname), "_hero_price")) {
        switch (weaponname) {
        case #"hash_aa7128e54a430c9": 
            return make_weapon_special("iw9_ar_mike4_v1_cp");
        }
    } else if (issubstr(tolower(self.classname), "_hero_farah")) {
        switch (weaponname) {
        case #"hash_a8cf45756fcfd951": 
            return make_weapon_special("iw9_ar_akilo_v4_cp");
        }
    } else if (issubstr(tolower(self.classname), "_hero_ghost")) {
        switch (weaponname) {
        case #"hash_b4bf8f1d146067f9": 
            return make_weapon_special("iw9_ar_mcbravo_v1_cp");
        }
    } else if (issubstr(tolower(self.classname), "_villain_makarov")) {
    } else if (issubstr(tolower(self.classname), "_villain_nolan")) {
    } else if (issubstr(tolower(self.classname), "_villain_resort")) {
    }
    if (getdvarint(@"hash_45281f93550798")) {
        iprintln("not whitelisted!  skipping scripted build.");
    }
    return make_weapon(weaponname, []);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x10669
// Size: 0xde
function getweapon_aq(type, weaponname, weaponarray) {
    var_e052c0161d3ef54 = [];
    var_c8f4fe738c61245a = [];
    switch (type) {
    case #"hash_8cdaf2e4ecfe5b51":
    case #"hash_fa18d2f6bd57925a": 
        break;
    case #"hash_f4b0076c03d93738": 
        break;
    case #"hash_9196025f8ae8e51e": 
        return "iw8_lm_dblmg";
    case #"hash_ba39cac9c099d4f1": 
        return "iw8_la_rpapa7";
    case #"hash_2f2d546c2247838f": 
        break;
    case #"hash_719417cb1de832b6": 
        break;
    case #"hash_23209741b93850b5": 
        break;
    case #"hash_900cb96c552c5e8e": 
        break;
    case #"hash_6191aaef9f922f96": 
        break;
    }
    return randomize_weapon(weaponname, var_e052c0161d3ef54, var_c8f4fe738c61245a);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10750
// Size: 0x3db
function make_weapon_special(weapon) {
    assertex(isdefined(weapon), "Must specify a string/weapon");
    var_21d502659c8814 = [];
    var_3a5e71fc5a9c9ac0 = [];
    var_d9706f4f3cf9777f = [];
    switch (weapon) {
    case #"hash_c1fc89a8ac555a73": 
        var_21d502659c8814 = ["rec_mcbravo", "bar_ar_light_p08", "grip_vertshort03", "lasercyl_ads01", "mag_ar_heavy_p08", "reflex07_tall", "stock_ar_tactical_p08_mcbravo"];
        var_d9706f4f3cf9777f = [1, 1, 1, 2, 1, 0, 2];
        weapon = namespace_e0ee43ef2dddadaa::buildweapon("iw9_ar_mcbravo_mp", var_21d502659c8814, undefined, undefined, undefined, var_d9706f4f3cf9777f);
        break;
    case #"hash_bbb27740720fed58": 
        var_21d502659c8814 = ["bar_ar_hvyshort_p04_akilo", "mag_ar_p04_akilo", "pgrip_aim_p04", "rec_akilo", "reflex03_tall", "stock_ar_light_p04_akilo"];
        var_d9706f4f3cf9777f = [1, 1, 1, 1, 1, 1];
        weapon = namespace_e0ee43ef2dddadaa::buildweapon("iw9_ar_akilo_mp", var_21d502659c8814, undefined, undefined, undefined, var_d9706f4f3cf9777f);
        break;
    case #"hash_b99458d5c4578fd": 
        var_21d502659c8814 = ["bar_ar_short_p01_mike4", "grip_vert02", "iw9_rec_mike4", "laserbox_ads01", "mag_ar_p01", "pgrip_p01", "reflex02_tall", "silencer07_ar", "stock_ar_p01_mike4"];
        var_d9706f4f3cf9777f = [2, 1, 1, 1, 1, 2, 2, 1, 4];
        weapon = namespace_e0ee43ef2dddadaa::buildweapon("iw9_ar_mike4_mp", var_21d502659c8814, undefined, undefined, undefined, var_d9706f4f3cf9777f);
        break;
    case #"hash_71e1f4484078683e": 
        var_21d502659c8814 = ["arscope_vz02", "bar_dm_p18_mike14", "grip_vertshort03", "iw9_rec_mike14", "mag_sn_large_p18", "pgrip_dm_p18", "stock_dm_light_p18_mike14"];
        var_d9706f4f3cf9777f = [1, 1, 2, 1, 1, 1, 1];
        weapon = namespace_e0ee43ef2dddadaa::buildweapon("iw9_dm_mike14_mp", var_21d502659c8814, undefined, undefined, undefined, var_d9706f4f3cf9777f);
        break;
    case #"hash_61884231066b896a": 
        var_21d502659c8814 = ["bar_sn_light_p20_xmike2010", "bipod01", "bolt_p20", "mike24_scope", "pgrip_p20_xmike2010", "rec_xmike2010", "stock_sn_heavy_p20"];
        var_d9706f4f3cf9777f = [1, 3, 1, 1, 1, 1, 1];
        weapon = namespace_e0ee43ef2dddadaa::buildweapon("iw9_dm_xmike2010_mp", var_21d502659c8814, undefined, undefined, undefined, var_d9706f4f3cf9777f);
        break;
    case #"hash_d4a3fd9a177df455": 
        var_21d502659c8814 = ["bar_ar_short_p08", "grip_angled01", "holo01", "iw9_rec_mcharlie", "mag_ar_p08", "pgrip_ar_p08", "stock_sm_p08_mcharlie"];
        var_d9706f4f3cf9777f = [1, 1, 0, 1, 1, 1, 1];
        weapon = namespace_e0ee43ef2dddadaa::buildweapon("iw9_ar_mcharlie_mp", var_21d502659c8814, undefined, undefined, undefined, var_d9706f4f3cf9777f);
        break;
    default: 
        println("<dev string:x17d>" + weapon + "<dev string:x186>");
        weapon = undefined;
        break;
    }
    return weapon;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x10b34
// Size: 0x2ac
function make_weapon(basename, attachments, reticle, camo, lootid, var_ccbab88fc1e2b3da) {
    if (!isdefined(level._weapons)) {
        level._weapons = spawnstruct();
    }
    if (!isdefined(attachments)) {
        attachments = [];
    }
    if (!isweapon(basename)) {
        tok = strtok(basename, "+");
        if (tok.size > 1) {
            basename = tok[0];
            attachments = array_combine(attachments, array_remove(tok, tok[0]));
        }
    } else {
        if (isnullweapon(basename)) {
            return basename;
        }
        basename = getweaponbasename(basename);
    }
    if (istrue(var_ccbab88fc1e2b3da)) {
        var_8b5443598fc587bf = &makealtweapon;
    } else {
        var_8b5443598fc587bf = &makeweapon;
    }
    rootname = basename;
    if (issubstr(basename, "_mp")) {
        rootname = getweaponrootname(basename);
    }
    defaults = namespace_e0ee43ef2dddadaa::function_d7f1989d63343007(basename);
    defaults = utility::removeconflictingattachments(attachments, defaults, rootname);
    attachments = array_combine(attachments, defaults);
    var_c7bd95b10c89cff8 = weaponassetnamemap(rootname, lootid);
    var_31792301aa1f7373 = [];
    foreach (attachment in attachments) {
        if (issubstr(attachment, "|")) {
            attachments = array_remove(attachments, attachment);
            attachments[attachments.size] = strtok(attachment, "|")[0];
            var_31792301aa1f7373[var_31792301aa1f7373.size] = attachment;
        }
    }
    var_5b3be55212a58ff = function_29ba39c7e2adb57b(rootname, attachments, lootid);
    var_5b3be55212a58ff = checkforinvalidattachments(var_5b3be55212a58ff, var_c7bd95b10c89cff8);
    attachments = var_5b3be55212a58ff;
    if (isdefined(lootid)) {
        weapon = builtin [[ var_8b5443598fc587bf ]](var_c7bd95b10c89cff8, attachments, reticle, camo, lootid);
    } else if (isdefined(camo)) {
        weapon = builtin [[ var_8b5443598fc587bf ]](var_c7bd95b10c89cff8, attachments, reticle, camo);
    } else if (isdefined(reticle)) {
        weapon = builtin [[ var_8b5443598fc587bf ]](var_c7bd95b10c89cff8, attachments, reticle);
    } else if (isdefined(attachments)) {
        weapon = builtin [[ var_8b5443598fc587bf ]](var_c7bd95b10c89cff8, attachments);
    } else {
        weapon = builtin [[ var_8b5443598fc587bf ]](var_c7bd95b10c89cff8);
    }
    foreach (attachment in var_31792301aa1f7373) {
        tok = strtok(attachment, "|");
        weapon = weapon withattachment(tok[0], int(tok[1]));
    }
    return weapon;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x10de9
// Size: 0x258
function randomize_weapon(weaponname, var_e052c0161d3ef54, var_c8f4fe738c61245a) {
    attachments = utility::get_random_attachments(var_e052c0161d3ef54, var_c8f4fe738c61245a);
    weapon = make_weapon(weaponname, attachments);
    /#
        if (getdvarint(@"hash_45281f93550798")) {
            if (!isdefined(weapon)) {
                complete_weapon = weaponname;
                foreach (attachment in attachments) {
                    complete_weapon += "<dev string:x196>" + attachment;
                }
                iprintlnbold(complete_weapon + "<dev string:x198>");
                return [[ level.fnbuildweapon ]](weaponname);
            }
            var_84dc1762e26a54bb = undefined;
            attachment_models = getweaponattachmentworldmodels(weapon);
            foreach (attachment_model in attachment_models) {
                part_num = getnumparts(attachment_model);
                for (i = 0; i < part_num; i++) {
                    if (getpartname(attachment_model, i) == "<dev string:x1a9>") {
                        var_84dc1762e26a54bb = 1;
                        break;
                    }
                }
            }
            if (!isdefined(var_84dc1762e26a54bb) && !issubstr(weaponname, "<dev string:x1b2>") && !issubstr(weaponname, "<dev string:x1b7>") && !issubstr(weaponname, "<dev string:x1bc>")) {
                iprintlnbold(getcompleteweaponname(weapon) + "<dev string:x1c1>");
            }
            var_a1b938aeb3589f83 = 1;
            foreach (var_47540d918dff6040 in var_e052c0161d3ef54) {
                probability_100 = 0;
                if (isint(var_47540d918dff6040[0]) && var_47540d918dff6040[0] == 100) {
                    probability_100 = -1;
                }
                var_a1b938aeb3589f83 *= var_47540d918dff6040.size + probability_100;
            }
            println("<dev string:x1d9>" + weaponname + "<dev string:x1e5>" + var_a1b938aeb3589f83);
        }
    #/
    return weapon;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1104a
// Size: 0xae
function getscriptedweapon(weaponname, weaponposition) {
    /#
        setdvarifuninitialized(@"hash_45281f93550798", 0);
    #/
    if (!isdefined(weaponname)) {
        return nullweapon();
    }
    if (!isarray(weaponname) && weaponname == "") {
        return nullweapon();
    }
    if (isdefined(weaponposition) && weaponposition == "sidearm") {
        weapon = getweapon(weaponname, "pistol");
    } else {
        weapon = getweapon(weaponname, self.scriptedweaponclassprimary);
    }
    /#
        if (getdvarint(@"hash_45281f93550798")) {
            if (!isstring(weapon)) {
                thread printweapon();
            }
        }
    #/
    return weapon;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11101
// Size: 0x18d
function printweapon() {
    self notify("stop printWeapon");
    self endon("death");
    self endon("stop printWeapon");
    for (;;) {
        start_height = 72;
        if (isdefined(self) && isdefined(self.weapon)) {
            /#
                print3d(self.origin + (0, 0, 0), self.classname, (1, 1, 1), 1, 0.1, 1, 1);
            #/
            if (isdefined(self.weapon.basename)) {
                /#
                    print3d(self.origin + (0, 0, start_height), self.weapon.basename, (1, 0, 0), 1, 0.15, 1);
                #/
            }
            if (isdefined(self.weapon.attachments)) {
                var_627fb8865600bd0a = start_height - 1.5;
                foreach (attachment in self.weapon.attachments) {
                    /#
                        print3d(self.origin + (0, 0, var_627fb8865600bd0a), "<dev string:x1f5>" + attachment, (1, 1, 1), 1, 0.1, 1);
                    #/
                    var_627fb8865600bd0a -= 1.4;
                }
            }
        }
        waitframe();
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11296
// Size: 0x4b
function monitordisownedgrenade(player, grenade) {
    level endon("game_ended");
    grenade endon("death");
    grenade endon("mine_planted");
    player waittill_any_3("joined_team", "joined_spectators", "disconnect");
    if (isdefined(grenade)) {
        grenade delete();
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x112e9
// Size: 0xf7
function riotshield_getmodel() {
    weaponlist = self getweaponslistprimaries();
    foreach (weapon in weaponlist) {
        switch (weapon.basename) {
        case #"hash_decd8473cdd1b5a9": 
            return "weapon_wm_riotshield_p34";
        case #"hash_c8526723dbf948fb": 
            return "weapon_wm_riotshield_v7";
        case #"hash_c8526623dbf94768": 
            return "weapon_wm_riotshield_v6";
        case #"hash_c8526923dbf94c21": 
            return "weapon_wm_riotshield_v5";
        case #"hash_c8526823dbf94a8e": 
            return "weapon_wm_riotshield_v4";
        case #"hash_c8526b23dbf94f47": 
            return "weapon_wm_riotshield_v3";
        case #"hash_c8526a23dbf94db4": 
            return "weapon_wm_riotshield_v2";
        case #"hash_f8aa17c22c36cdcc": 
            return "weapon_wm_riotshield";
        }
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x113e8
// Size: 0xd
function setignoreriotshieldxp() {
    self.ignoreriotshieldxp = 1;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x113fd
// Size: 0xc
function clearignoreriotshieldxp() {
    self.ignoreriotshieldxp = undefined;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11411
// Size: 0xd9
function ispickedupweapon(weapon) {
    if (iscacprimaryweapon(weapon) || iscacsecondaryweapon(weapon)) {
        weapname = undefined;
        if (isweapon(weapon)) {
            weapname = getcompleteweaponname(weapon getnoaltweapon());
        } else if (isstring(weapon)) {
            weapname = weapon;
            if (issubstr(weapname, "alt_")) {
                weapname = getsubstr(weapname, 4, weapon.size);
            }
        }
        var_d721c63a9570d5c = isdefined(self.pers["primaryWeapon"]) && self.pers["primaryWeapon"] == weapname;
        var_7df1c1394810bf14 = isdefined(self.pers["secondaryWeapon"]) && self.pers["secondaryWeapon"] == weapname;
        if (!var_d721c63a9570d5c && !var_7df1c1394810bf14) {
            return true;
        }
    }
    return false;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x114f3
// Size: 0x305
function isvehicleweapon(weapon) {
    weaponname = undefined;
    if (isweapon(weapon)) {
        weaponname = weapon.basename;
    } else {
        weaponname = weapon;
    }
    switch (weaponname) {
    case #"hash_79ee9dd492804fa":
    case #"hash_996455d7b14b362":
    case #"hash_12a2863ecf2eeecd":
    case #"hash_1ba6982534c8d1d6":
    case #"hash_1cb3f2dbe85b8540":
    case #"hash_20305144649233ed":
    case #"hash_254b6e155434f84d":
    case #"hash_259ae6e25d936c3e":
    case #"hash_25fc06d658620968":
    case #"hash_2f1a9d8e2f127205":
    case #"hash_3226ebed78234b14":
    case #"hash_33aef56fb95396fd":
    case #"hash_359ac460bda5f9b8":
    case #"hash_3eff7af9e42baade":
    case #"hash_3f2944fd91792508":
    case #"hash_471c36daeb2a655a":
    case #"hash_4e213f6d3f76b400":
    case #"hash_4fd5d83c1a7f06a7":
    case #"hash_51f4f5345b01f136":
    case #"hash_62a9688b69906271":
    case #"hash_6ac8f418ee829465":
    case #"hash_708fb6e22f87a3a4":
    case #"hash_73b4956c8f4b5217":
    case #"hash_806bdb595fd497d7":
    case #"hash_82a5b9368f3f35ae":
    case #"hash_85af56f5faab2a04":
    case #"hash_892911bfe6164871":
    case #"hash_8d7aa4b158a0e9a9":
    case #"hash_9386cafe3d8d6d59":
    case #"hash_9a70af630b5b1849":
    case #"hash_a0bfc30978e56904":
    case #"hash_a622e958420b92a0":
    case #"hash_a9e5050965551dca":
    case #"hash_acaf314732f4c8e4":
    case #"hash_aef479d2af969a2d":
    case #"hash_af540b603005b109":
    case #"hash_b1d4d0d68c2b0c0f":
    case #"hash_bac656916e53b91c":
    case #"hash_badacfdae124cc01":
    case #"hash_bb463b7f255eafce":
    case #"hash_be853f8547df0df3":
    case #"hash_cd6b1f03c24c25ff":
    case #"hash_cf8515f17748a7d2":
    case #"hash_d1ffad9819388638":
    case #"hash_d30fa952a74e1642":
    case #"hash_d4532f8e0fa86548":
    case #"hash_d6d8360ddf1f4d6b":
    case #"hash_d7f368cf53337cfd":
    case #"hash_e9ee40174ddfa406":
    case #"hash_ec580a77ee20c7bd":
    case #"hash_edf51f8e5118b630":
    case #"hash_f003a3dc14dbdf3f":
    case #"hash_f1450013ec0ad0d5":
    case #"hash_f816d2efb1dcbed0":
    case #"hash_fbca161190fca27d":
    case #"hash_fc4c0a8ee31549bb":
    case #"hash_fd79e0693da4a728":
    case #"hash_fd9c279f85990dad": 
        return 1;
    default: 
        return 0;
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11800
// Size: 0x3f
function attachmentlogsstats(var_e3f6cca91074060e, weapon) {
    if (attachmentiscosmetic(var_e3f6cca91074060e)) {
        return false;
    }
    if (!attachmentisselectable(weapon, var_e3f6cca91074060e)) {
        return false;
    }
    if (string_starts_with(var_e3f6cca91074060e, "laststand_")) {
        return false;
    }
    return true;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11848
// Size: 0x2d
function attachmentisselectable(weaponobj, attachment) {
    rootname = getweaponrootname(weaponobj);
    return scripts\cp\cp_loadout::attachmentisselectablerootname(rootname, attachment);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1187e
// Size: 0x13e
function mapweapon(objweapon, inflictor, var_a2c7a399ae430eb) {
    var_eef5ad438e5fa0c2 = objweapon;
    if (!isdefined(objweapon)) {
        var_eef5ad438e5fa0c2 = makeweapon("none");
    }
    var_ea958bd2fa62a2fa = 0;
    if (var_eef5ad438e5fa0c2.basename != "none") {
        switch (var_eef5ad438e5fa0c2.basename) {
        case #"hash_b833f98278746f9b": 
            var_eef5ad438e5fa0c2 = makeweapon("pop_rocket_mp");
            break;
        case #"hash_9a3452323e288ff3":
        case #"hash_c05ea160f6d9bb25": 
            var_eef5ad438e5fa0c2 = makeweapon("iw8_turret_50cal_mp");
            break;
        case #"hash_5f2ad7140f378ee1": 
            var_eef5ad438e5fa0c2 = makeweapon("none");
            break;
        }
    } else if (isdefined(inflictor)) {
        if (isdefined(inflictor.objweapon)) {
            var_eef5ad438e5fa0c2 = makeweapon(inflictor.objweapon.basename);
            var_ea958bd2fa62a2fa = 1;
        } else if (isdefined(inflictor.weapon_name)) {
            var_eef5ad438e5fa0c2 = makeweapon(inflictor.weapon_name);
            var_ea958bd2fa62a2fa = 1;
        }
    }
    if (var_ea958bd2fa62a2fa && !istrue(var_a2c7a399ae430eb)) {
        var_eef5ad438e5fa0c2 = mapweapon(var_eef5ad438e5fa0c2, inflictor, 1);
    }
    return var_eef5ad438e5fa0c2;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x119c5
// Size: 0x11
function makeexplosiveunusuabletag() {
    self notify("makeExplosiveUnusable");
    self makeunusable();
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x119de
// Size: 0x81
function attachmentsfilterforstats(attachments, weapon) {
    filtered = [];
    if (isdefined(attachments) && isarray(attachments)) {
        foreach (a in attachments) {
            if (attachmentlogsstats(a, weapon)) {
                filtered[filtered.size] = a;
            }
        }
    }
    return filtered;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11a68
// Size: 0xc0
function function_2f4d1cda9bc48e6a(weaponobj) {
    var_6e92bbbc0d0d8c94 = 0;
    currentweapon = weaponobj;
    newweapon = undefined;
    var_59f6b815c04d4e52 = function_dde0cce873a8c5a2(getcompleteweaponname(currentweapon), "silencer")[0];
    for (j = 0; j < currentweapon.attachments.size; j++) {
        if (isdefined(var_59f6b815c04d4e52) && weaponobj canuseattachment(var_59f6b815c04d4e52) && namespace_e0ee43ef2dddadaa::attachmentsconflict(currentweapon.attachments[j], var_59f6b815c04d4e52, weaponobj) == "") {
            var_6e92bbbc0d0d8c94 = 1;
            continue;
        }
        var_6e92bbbc0d0d8c94 = 0;
        break;
    }
    if (var_6e92bbbc0d0d8c94) {
        newweapon = weaponobj withattachment(var_59f6b815c04d4e52);
    }
    if (!isdefined(newweapon)) {
        return weaponobj;
    }
    return newweapon;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11b31
// Size: 0xa4
function add_attachment(attachment) {
    var_c7dac5e40890251a = 0;
    currentweapon = self;
    newweaponobj = undefined;
    if (self canuseattachment(attachment)) {
        var_c7dac5e40890251a = 1;
        for (i = 0; i < currentweapon.attachments.size; i++) {
            if (namespace_e0ee43ef2dddadaa::attachmentsconflict(currentweapon.attachments[i], attachment, self) != "") {
                newweaponobj = self withoutattachment(currentweapon.attachments[i]);
            }
        }
        newweaponobj = self withattachment(attachment);
    }
    if (!isdefined(newweaponobj)) {
        return self;
    }
    return newweaponobj;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11bde
// Size: 0x971
function function_2d291cfd98fd0d8e() {
    level endon("game_ended");
    level.var_bcd25cd23011249 = [];
    /#
        if (getdvarint(@"hash_e6afce2cf5cf7515", 0)) {
            return;
        }
    #/
    if (getdvarint(@"hash_742caa13b3c2e685", 0)) {
        return;
    }
    /#
        thread function_a5ad598dd7668b55();
    #/
    keys = getarraykeys(level.weapongroupdata);
    for (i = 0; i < keys.size; i++) {
        for (j = 0; j < level.weapongroupdata[keys[i]].size; j++) {
            function_41f42cde8798905f(level.weapongroupdata[keys[i]][j] + "_mp", keys[i]);
        }
    }
    function_41f42cde8798905f("iw9_ar_golf3_mp", undefined, 1);
    function_41f42cde8798905f("iw9_ar_kilo53_mp", undefined, 1);
    function_41f42cde8798905f("iw9_ar_mike4_mp", undefined, 1);
    function_41f42cde8798905f("iw9_ar_mike16_mp", undefined, 1);
    function_41f42cde8798905f("iw9_ar_akilo_mp", undefined, 1);
    function_41f42cde8798905f("iw9_ar_akilo105_mp", undefined, 1);
    function_41f42cde8798905f("iw9_ar_akilo74_mp", undefined, 1);
    function_41f42cde8798905f("iw9_ar_schotel_mp", undefined, 1);
    function_41f42cde8798905f("iw9_ar_augolf_mp", undefined, 1);
    function_41f42cde8798905f("iw9_ar_mcharlie_mp", undefined, 1);
    function_41f42cde8798905f("iw9_ar_scharlie_mp", undefined, 1);
    function_41f42cde8798905f("iw9_ar_mcbravo_mp", undefined, 1);
    function_41f42cde8798905f("iw9_br_msecho_mp", undefined, 1);
    function_41f42cde8798905f("iw9_br_soscar14_mp", undefined, 1);
    function_41f42cde8798905f("iw9_sm_aviktor_mp", undefined, 1);
    function_41f42cde8798905f("iw9_sm_alpha57_mp", undefined, 1);
    function_41f42cde8798905f("iw9_sm_mpapa5_mp", undefined, 1);
    function_41f42cde8798905f("iw9_sm_mpapa7_mp", undefined, 1);
    function_41f42cde8798905f("iw9_sm_beta_mp", undefined, 1);
    function_41f42cde8798905f("iw9_sm_victor_mp", undefined, 1);
    function_41f42cde8798905f("iw9_sm_apapa_mp", undefined, 1);
    function_41f42cde8798905f("iw9_sm_papa90_mp", undefined, 1);
    function_41f42cde8798905f("iw9_pi_decho_mp", undefined, 1);
    function_41f42cde8798905f("iw9_pi_papa220_mp", undefined, 1);
    function_41f42cde8798905f("iw9_pi_golf17_mp", undefined, 1);
    function_41f42cde8798905f("iw9_pi_golf18_mp", undefined, 1);
    function_41f42cde8798905f("iw9_sn_mromeo_mp", undefined, 1);
    function_41f42cde8798905f("iw9_sn_limax_mp", undefined, 1);
    function_41f42cde8798905f("iw9_sn_india_mp", undefined, 1);
    function_41f42cde8798905f("iw9_lm_kilo21_mp", undefined, 1);
    function_41f42cde8798905f("iw9_lm_slima_mp", undefined, 1);
    function_41f42cde8798905f("iw9_lm_foxtrot_mp", undefined, 1);
    function_41f42cde8798905f("iw9_lm_rkilo_mp", undefined, 1);
    function_41f42cde8798905f("iw9_lm_ahotel_mp", undefined, 1);
    function_41f42cde8798905f("iw9_lm_ngolf7_mp", undefined, 1);
    function_41f42cde8798905f("iw9_sh_mbravo_mp", undefined, 1);
    function_41f42cde8798905f("iw9_sh_charlie725_mp", undefined, 1);
    function_41f42cde8798905f("iw9_sh_mike1014_mp", undefined, 1);
    function_41f42cde8798905f("iw9_sh_mviktor_mp", undefined, 1);
    function_41f42cde8798905f("iw9_dm_mike24_mp", undefined, 1);
    function_41f42cde8798905f("iw9_dm_sa700_mp", undefined, 1);
    function_41f42cde8798905f("iw9_dm_la700_mp", undefined, 1);
    function_41f42cde8798905f("iw9_dm_pgolf1_mp", undefined, 1);
    function_41f42cde8798905f("iw9_dm_xmike2010_mp", undefined, 1);
    function_41f42cde8798905f("iw9_dm_sbeta_mp", undefined, 1);
    function_41f42cde8798905f("iw9_dm_mike14_mp", undefined, 1);
    function_41f42cde8798905f("iw9_dm_scromeo_mp", undefined, 1);
    function_41f42cde8798905f("iw9_la_rpapa7_mp", undefined, 1);
    function_41f42cde8798905f("iw9_la_juliet_mp", undefined, 1);
    function_41f42cde8798905f("iw9_la_mike32_mp", undefined, 1);
    function_41f42cde8798905f("iw9_la_gromeo_mp", undefined, 1);
    function_41f42cde8798905f("iw9_la_kgolf_mp", undefined, 1);
    function_41f42cde8798905f("iw9_pi_stimpistol_mp", undefined, 1);
    level.var_bcd25cd23011249["akilo"] = level.var_bcd25cd23011249["iw9_ar_akilo_mp"];
    level.var_bcd25cd23011249["mike4"] = level.var_bcd25cd23011249["iw9_ar_mike4_mp"];
    level.var_bcd25cd23011249["akilo105"] = level.var_bcd25cd23011249["iw9_ar_akilo105_mp"];
    level.var_bcd25cd23011249["akilo74"] = level.var_bcd25cd23011249["iw9_ar_akilo74_mp"];
    level.var_bcd25cd23011249["augolf"] = level.var_bcd25cd23011249["iw9_ar_augolf_mp"];
    level.var_bcd25cd23011249["kilo53"] = level.var_bcd25cd23011249["iw9_ar_kilo53_mp"];
    level.var_bcd25cd23011249["scharlie"] = level.var_bcd25cd23011249["iw9_ar_scharlie_mp"];
    level.var_bcd25cd23011249["mcharlie"] = level.var_bcd25cd23011249["iw9_ar_mcharlie_mp"];
    level.var_bcd25cd23011249["schotel"] = level.var_bcd25cd23011249["iw9_ar_schotel_mp"];
    level.var_bcd25cd23011249["decho"] = level.var_bcd25cd23011249["iw9_pi_decho_mp"];
    level.var_bcd25cd23011249["golf17"] = level.var_bcd25cd23011249["iw9_pi_golf17_mp"];
    level.var_bcd25cd23011249["golf18"] = level.var_bcd25cd23011249["iw9_pi_golf18_mp"];
    level.var_bcd25cd23011249["papa220"] = level.var_bcd25cd23011249["iw9_pi_papa220_mp"];
    level.var_bcd25cd23011249["aviktor"] = level.var_bcd25cd23011249["iw9_sm_aviktor_mp"];
    level.var_bcd25cd23011249["beta"] = level.var_bcd25cd23011249["iw9_sm_beta_mp"];
    level.var_bcd25cd23011249["mpapa5"] = level.var_bcd25cd23011249["iw9_sm_mpapa5_mp"];
    level.var_bcd25cd23011249["mpapa7"] = level.var_bcd25cd23011249["iw9_sm_mpapa7_mp"];
    level.var_bcd25cd23011249["victor"] = level.var_bcd25cd23011249["iw9_sm_victor_mp"];
    level.var_bcd25cd23011249["alpha57"] = level.var_bcd25cd23011249["iw9_sm_alpha57_mp"];
    level.var_bcd25cd23011249["charlie725"] = level.var_bcd25cd23011249["iw9_sh_charlie725_mp"];
    level.var_bcd25cd23011249["mbravo"] = level.var_bcd25cd23011249["iw9_sh_mbravo_mp"];
    level.var_bcd25cd23011249["mike1014"] = level.var_bcd25cd23011249["iw9_sh_mike1014_mp"];
    level.var_bcd25cd23011249["kilo21"] = level.var_bcd25cd23011249["iw9_lm_kilo21_mp"];
    level.var_bcd25cd23011249["slima"] = level.var_bcd25cd23011249["iw9_lm_slima_mp"];
    level.var_bcd25cd23011249["ngolf7"] = level.var_bcd25cd23011249["iw9_lm_ngolf7_mp"];
    level.var_bcd25cd23011249["la700"] = level.var_bcd25cd23011249["iw9_dm_la700_mp"];
    level.var_bcd25cd23011249["mike24"] = level.var_bcd25cd23011249["iw9_dm_mike24_mp"];
    level.var_bcd25cd23011249["mike14"] = level.var_bcd25cd23011249["iw9_dm_mike14_mp"];
    level.var_bcd25cd23011249["pgolf1"] = level.var_bcd25cd23011249["iw9_dm_pgolf1_mp"];
    level.var_bcd25cd23011249["sa700"] = level.var_bcd25cd23011249["iw9_dm_sa700_mp"];
    level.var_bcd25cd23011249["sbeta"] = level.var_bcd25cd23011249["iw9_dm_sbeta_mp"];
    level.var_bcd25cd23011249["xmike2010"] = level.var_bcd25cd23011249["iw9_dm_xmike2010_mp"];
    level.var_bcd25cd23011249["alpha50"] = level.var_bcd25cd23011249["iw9_sn_alpha50_mp"];
    level.var_bcd25cd23011249["limax"] = level.var_bcd25cd23011249["iw9_sn_limax_mp"];
    level.var_bcd25cd23011249["india"] = level.var_bcd25cd23011249["iw9_sn_india_mp"];
    level.var_bcd25cd23011249["mromeo"] = level.var_bcd25cd23011249["iw9_sn_mromeo_mp"];
    level.var_bcd25cd23011249["rpapa7"] = level.var_bcd25cd23011249["iw9_la_rpapa7_mp"];
    level.var_bcd25cd23011249["kgolf"] = level.var_bcd25cd23011249["iw9_la_kgolf_mp"];
    level.var_bcd25cd23011249["gromeo"] = level.var_bcd25cd23011249["iw9_la_gromeo_mp"];
    level.var_bcd25cd23011249["mike32"] = level.var_bcd25cd23011249["iw9_la_mike32_mp"];
    level.var_bcd25cd23011249["knife"] = makeweaponfromstring("iw9_me_knife_mp+iw9_me_knife");
    level.var_bcd25cd23011249["super_stimpistol"] = makeweaponfromstring("iw9_pi_stimpistol_mp");
    level.var_bcd25cd23011249["fists"] = makeweaponfromstring("iw9_me_fists_mp");
    /#
        if (getdvarint(@"hash_7e7d59df2e5dc031", 0)) {
            println("<dev string:x1f9>");
            keys = getarraykeys(level.var_bcd25cd23011249);
            for (i = 0; i < keys.size; i++) {
                println(keys[i] + "<dev string:x240>" + getcompleteweaponname(level.var_bcd25cd23011249[keys[i]]) + "<dev string:x245>");
            }
            println("<dev string:x1f9>");
        }
    #/
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12557
// Size: 0x74
function function_6c30de47f7befbac() {
    level endon("game_ended");
    flag_wait("level_ready_for_script");
    level.var_bd8c1f8f6677e0ef = getstructarray("perm_wall_weapon", "targetname");
    flag_wait("default_weapons_created");
    keys = getarraykeys(level.var_bcd25cd23011249);
    for (i = 0; i < level.var_bd8c1f8f6677e0ef.size; i++) {
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x125d3
// Size: 0x2
function function_7544739099d55631() {
    
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x125dd
// Size: 0xe7
function function_41f42cde8798905f(weapon_string, weapon_class, var_22c173e9283d2e0d, var_7064974a67473784) {
    var_51a91ceb6cc9ad2f = weapon_string;
    objweapon = scripts\cp_mp\utility\weapon_utility::function_eeaa22f0cd1ff845(weapon_string);
    if (!istrue(var_7064974a67473784)) {
        objweapon = objweapon namespace_a0628d6954815ef8::function_dcb52bcbbcb80b00("silencer");
    }
    if (!isdefined(weapon_class)) {
        weapon_class = "No Class Assigned";
    }
    if (weapon_class == "weapon_pistol") {
        weaponobj = objweapon namespace_a0628d6954815ef8::function_dcb52bcbbcb80b00("pgrip_tac");
    }
    level.var_bcd25cd23011249[var_51a91ceb6cc9ad2f] = objweapon;
    if (istrue(var_22c173e9283d2e0d)) {
        return;
    }
    thread function_8cffc9416e0ab766(var_51a91ceb6cc9ad2f, weapon_class);
    path = weapon_class + "/" + var_51a91ceb6cc9ad2f + "/Default";
    cmd = "devgui_cmd \"CP Debug:2 / Weapons /" + path + "\" \"set scr_debug debugGiveWeapon_+" + var_51a91ceb6cc9ad2f + "\" \n";
    addentrytodevgui(cmd);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x126cc
// Size: 0x126
function function_a5ad598dd7668b55() {
    level endon("game_ended");
    if (!getdvarint(@"hash_cdff493fb526772c", 0)) {
        return;
    }
    flag_wait("level_ready_for_script");
    if (!isdefined(level.var_6e48aedc6bc2557f)) {
        level.var_6e48aedc6bc2557f = getstructarray("perm_wall_weapon", "targetname");
    }
    struct_array = level.var_6e48aedc6bc2557f;
    keys = getarraykeys(level.var_bcd25cd23011249);
    for (i = 0; i < struct_array.size; i++) {
        struct = struct_array[i];
        weaponobj = level.var_bcd25cd23011249[keys[i]];
        weapon = namespace_6250b14b3f614101::createspawnweaponatpos(struct.origin + (5, 0, 0), (0, -90, -90), weaponobj, 1);
        if (isdefined(weapon)) {
            weapon namespace_6250b14b3f614101::function_86321fc8f45c2a9b(1);
            weapon namespace_6250b14b3f614101::function_b10ee40ed82d45c9(1);
            continue;
        }
        /#
            if (isdefined(weaponobj)) {
                test = 1;
            }
        #/
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x127fa
// Size: 0x1c6
function function_8cffc9416e0ab766(default_weapon, weapon_class) {
    weaponroot = getweaponrootname(default_weapon);
    index = 0;
    var_928c1cac31ea99e5 = weaponroot + "|" + index;
    var_44482bf78727b6ea = [];
    var_44482bf78727b6ea["iw9_lm_mkilo3"] = [2];
    var_44482bf78727b6ea["iw9_ar_akilo"] = [2];
    var_44482bf78727b6ea["iw9_pi_papa220"] = [2];
    for (var_830c168ba5b1b399 = 1; var_830c168ba5b1b399; var_830c168ba5b1b399 = 0) {
        waitframe();
        if (isdefined(level.weaponlootmapdata[var_928c1cac31ea99e5])) {
            var_6eeaeb3717f8724c = 0;
            if (isdefined(var_44482bf78727b6ea[weaponroot])) {
                for (i = 0; i < var_44482bf78727b6ea[weaponroot].size; i++) {
                    if (var_44482bf78727b6ea[weaponroot][i] == index) {
                        var_6eeaeb3717f8724c = 1;
                        break;
                    }
                }
            }
            if (var_6eeaeb3717f8724c) {
                index++;
                var_928c1cac31ea99e5 = weaponroot + "|" + index;
                continue;
            }
            weaponobj = namespace_e0ee43ef2dddadaa::buildweapon_blueprint(weaponroot, "none", "none", index, undefined, undefined, 1);
            if (!isdefined(weaponobj)) {
                println("<dev string:x248>" + weaponroot + "<dev string:x258>" + index + "<dev string:x261>");
            }
            level.var_bcd25cd23011249[default_weapon + "|" + index] = weaponobj;
            path = weapon_class + "/" + default_weapon + "/Variants/" + index;
            cmd = "devgui_cmd \"CP Debug:2 / Weapons /" + path + "\" \"set scr_debug debugGiveWeapon_+" + default_weapon + "|" + index + "\" \n";
            addentrytodevgui(cmd);
            index++;
            var_928c1cac31ea99e5 = weaponroot + "|" + index;
            continue;
        }
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x129c8
// Size: 0x5c
function function_f123cc18b09056d1(weapon) {
    var_441f289555e2ccf = [];
    attachments = function_75b035199842693d(weapon, "frontpiece");
    for (i = 0; i < attachments.size; i++) {
        if (namespace_e0ee43ef2dddadaa::issilencerattach(weapon, attachments[i])) {
            var_441f289555e2ccf[var_441f289555e2ccf.size] = attachments[i];
        }
    }
    return var_441f289555e2ccf;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12a2d
// Size: 0x62
function function_b65ad646eb126204(var_f82a37450b9de94d) {
    level endon("game_ended");
    flag_wait("level_ready_for_script");
    weapon_obj = level.var_bcd25cd23011249[var_f82a37450b9de94d];
    if (isdefined(weapon_obj)) {
        currentweapon = self getcurrentprimaryweapon();
        scripts\cp_mp\utility\inventory_utility::_takeweapon(currentweapon);
        scripts\cp_mp\utility\inventory_utility::_giveweapon(weapon_obj);
        scripts\cp_mp\utility\inventory_utility::_switchtoweaponimmediate(weapon_obj);
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12a97
// Size: 0x2d
function function_768c9a047aed19f4(var_f82a37450b9de94d) {
    weapon_obj = level.var_bcd25cd23011249[var_f82a37450b9de94d];
    if (isdefined(weapon_obj)) {
        return weapon_obj;
    }
    return undefined;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12acc
// Size: 0x32
function function_9b46467a26f087ea(var_f82a37450b9de94d) {
    weapon_obj = level.var_bcd25cd23011249[var_f82a37450b9de94d];
    if (isdefined(weapon_obj)) {
        return getcompleteweaponname(weapon_obj);
    }
    return undefined;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12b06
// Size: 0x1f8
function function_dcb52bcbbcb80b00(var_c4d6b4cfa2d186c) {
    if (isdefined(var_c4d6b4cfa2d186c) && isstring(var_c4d6b4cfa2d186c)) {
        var_c4d6b4cfa2d186c = [var_c4d6b4cfa2d186c];
    }
    weaponobj = self;
    var_539cfff6632d4fce = namespace_e0ee43ef2dddadaa::function_c471a035d22df5eb();
    attachments = namespace_e0ee43ef2dddadaa::function_91d352b50d9a0630(weaponobj);
    var_be5b251708f24afd = getarraykeys(attachments);
    var_952f1674fa8d734f = [];
    returnweapon = namespace_e0ee43ef2dddadaa::buildweapon(namespace_e0ee43ef2dddadaa::getweaponrootname(weaponobj), undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
    foreach (var_121b7c7197b1c746 in var_539cfff6632d4fce) {
        var_7ad9eba0904383b1 = function_75b035199842693d(weaponobj, var_121b7c7197b1c746);
        var_2c68a0515f3ce810 = undefined;
        if (var_7ad9eba0904383b1.size == 0) {
            continue;
        }
        if (isdefined(var_c4d6b4cfa2d186c)) {
            foreach (var_d9fdb7f121a35197 in var_c4d6b4cfa2d186c) {
                for (i = 0; i < var_7ad9eba0904383b1.size; i++) {
                    if (issubstr(var_7ad9eba0904383b1[i], var_d9fdb7f121a35197)) {
                        var_2c68a0515f3ce810 = i;
                        break;
                    }
                }
                if (isdefined(var_2c68a0515f3ce810)) {
                    break;
                }
            }
        }
        if (isdefined(var_2c68a0515f3ce810) && isdefined(var_7ad9eba0904383b1[var_2c68a0515f3ce810])) {
            var_effb4ae1788a8b10 = var_7ad9eba0904383b1[var_2c68a0515f3ce810];
            if (isdefined(var_effb4ae1788a8b10)) {
                var_952f1674fa8d734f[var_952f1674fa8d734f.size] = var_effb4ae1788a8b10;
            }
        }
    }
    foreach (var_931fb1b8d01470ec in var_952f1674fa8d734f) {
        returnweapon = returnweapon withattachment(var_931fb1b8d01470ec);
    }
    return returnweapon;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12d07
// Size: 0x35
function ismeleeonly(weapon) {
    if (isstring(weapon)) {
        assertmsg("<isMeleeOnly> requires an objweapon, <" + weapon + "> is a string");
    }
    return weapon.ismelee;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12d45
// Size: 0x1a5
function getammooverride(weaponobj) {
    baseweapon = weaponobj getbaseweapon();
    baseclipsize = weaponclipsize(baseweapon);
    var_2be3302e3767cc7d = weaponclipsize(weaponobj);
    clipsize = baseclipsize;
    switch (weaponobj.basename) {
    case #"hash_19ebb23fa0a07e22":
    case #"hash_3940f50aabe54489":
    case #"hash_dcb334c6ac945942": 
        break;
    default: 
        clipsize = int(min(baseclipsize, var_2be3302e3767cc7d));
        break;
    }
    rootname = getweaponrootname(weaponobj);
    ammooverride = 30;
    if (weaponobj.isalternate) {
    } else {
        switch (weaponobj.classname) {
        case #"hash_690c0d6a821b42e": 
            switch (rootname) {
            case #"hash_30551216cbfc3a26": 
                ammooverride = 6;
                break;
            case #"hash_68a11d587d71608f": 
                ammooverride = 8;
                break;
            default: 
                ammooverride = int(min(clipsize, 30));
                break;
            }
            break;
        case #"hash_6191aaef9f922f96": 
            switch (rootname) {
            case #"hash_92c6f0344e086ec6": 
                ammooverride = 3;
                break;
            default: 
                ammooverride = int(min(clipsize, 30));
                break;
            }
            break;
        default: 
            ammooverride = int(min(clipsize, 30));
            break;
        }
    }
    return ammooverride;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x12ef3
// Size: 0xa6
function onequipmentplanted(newequipment, equipmentref, deletefunc) {
    newequipment.equipmentref = equipmentref;
    newequipment.deletefunc = deletefunc;
    newequipment.planted = 1;
    entnum = newequipment getentitynumber();
    level.mines[entnum] = newequipment;
    if (equipmentref != "equip_tac_cover") {
        newequipment enableplayermarks("equipment");
        if (level.teambased) {
            newequipment filteroutplayermarks(self.team);
        } else {
            newequipment filteroutplayermarks(self);
        }
    }
    newequipment notify("mine_planted");
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12fa1
// Size: 0x66
function issmallsplashdamage(objweapon) {
    if (objweapon.basename == "semtex_xmike109_splash_mp" || objweapon.basename == "thermite_xmike109_radius_mp" || objweapon.basename == "semtex_bolt_splash_mp" || objweapon.basename == "thermite_bolt_radius_mp") {
        return 1;
    }
    return 0;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1300f
// Size: 0xa9
function getweaponvariantids(weaponroot, blockedids) {
    assertex(isdefined(level.weaponlootmapdata), "getWeaponValidVariantIDs() called without level.weaponLootMapData being populated.");
    if (!isdefined(blockedids)) {
        blockedids = [];
    }
    id = 1;
    variantids = [];
    while (true) {
        variantkey = weaponroot + "|" + id;
        if (!isdefined(level.weaponlootmapdata[variantkey])) {
            break;
        }
        if (!level.weaponlootmapdata[variantkey].islocked && !array_contains(blockedids, id)) {
            variantids[variantids.size] = id;
        }
        id++;
    }
    return variantids;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x130c1
// Size: 0x65
function getweaponrandomvariantid(weaponroot, blockedids) {
    assertex(isdefined(level.weaponlootmapdata), "getWeaponRandomValidVariantID() called without level.weaponLootMapData being populated.");
    if (!isdefined(blockedids)) {
        blockedids = [];
    }
    id = 0;
    validids = getweaponvariantids(weaponroot, blockedids);
    if (validids.size > 0) {
        id = validids[randomint(validids.size)];
    }
    return id;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1312f
// Size: 0x84
function weaponisvalid(weaponroot, variantid) {
    validroot = weaponexistsinstatstable(weaponroot);
    validvariant = 1;
    if (validroot) {
        if (isdefined(isdefined(variantid)) && variantid > 0) {
            variantkey = weaponroot + "|" + variantid;
            validvariant = isdefined(level.weaponlootmapdata[variantkey]) && !level.weaponlootmapdata[variantkey].islocked;
        }
    }
    return validroot && validvariant;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x131bc
// Size: 0x17
function weaponexistsinstatstable(weaponroot) {
    return isdefined(level.weaponmapdata[weaponroot]);
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x131dc
// Size: 0x3c
function getallselectableattachments(weapon) {
    weaponname = getweaponrootname(weapon);
    attachments = level.weaponattachments[weaponname];
    if (!isdefined(attachments)) {
        attachments = [];
    }
    return attachments;
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13221
// Size: 0x9a
function issinglehitweapon(weaponname) {
    weaponname = getweaponbasenamescript(weaponname);
    switch (weaponname) {
    case #"hash_1717a0115ff7a1c4":
    case #"hash_172aa4116006b29a":
    case #"hash_3e782fd775b72022":
    case #"hash_3e982bd775d0b1bc":
    case #"hash_986ff62872c35e67":
    case #"hash_a86d4075406d2de4":
    case #"hash_a8804475407c3eba":
    case #"hash_d2d2f2854b7d8b7d":
    case #"hash_d5c469762100543e": 
        return 1;
    default: 
        return 0;
    }
}

// Namespace weapon / namespace_a0628d6954815ef8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x132c3
// Size: 0x40
function getweaponbasenamescript(weapon) {
    if (isweapon(weapon)) {
        return weapon.basename;
    }
    if (isstring(weapon) && weapon == "none") {
        return "none";
    }
    return getweaponbasename(weapon);
}

