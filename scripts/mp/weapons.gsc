// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\ai.gsc;
#using script_4c770a9a4ad7659c;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\callback_group.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_2669878cf5a1b6bc;
#using script_cbb0697de4c5728;
#using scripts\cp_mp\dragonsbreath.gsc;
#using scripts\mp\equipment\trophy_system.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\perks\weaponpassives.gsc;
#using scripts\mp\playerstats_interface.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\usability.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\utility\perk.gsc;
#using script_5762ac2f22202ba2;
#using scripts\mp\codcasterclientmatchdata.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\perks\perkfunctions.gsc;
#using scripts\mp\events.gsc;
#using scripts\mp\class.gsc;
#using scripts\cp_mp\gestures.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\missilelauncher.gsc;
#using scripts\mp\javelin.gsc;
#using scripts\cp_mp\crossbow.gsc;
#using script_202d9f0ea7db3a23;
#using scripts\cp_mp\xmike109.gsc;
#using script_4a6760982b403bad;
#using scripts\mp\persistence.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\cp_mp\ent_manager.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\perks\perks.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\movers.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\damage.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using script_600b944a95c3a7bf;
#using script_3b8ef7abd8107d82;
#using scripts\mp\equipment\snapshot_grenade.gsc;
#using scripts\mp\equipment\decoy_grenade.gsc;
#using script_3214e6fcdce468a7;
#using script_15eddb0fac236a22;
#using scripts\mp\killstreaks\juggernaut_mp.gsc;
#using scripts\mp\potg_events.gsc;
#using script_189b67b2735b981d;
#using script_6a8ec730b2bfa844;
#using scripts\mp\shellshock.gsc;
#using scripts\mp\equipment\wristrocket.gsc;
#using scripts\mp\equipment\c4.gsc;
#using scripts\mp\equipment\emp_grenade.gsc;
#using script_4b6cdcd3c396abab;
#using script_528b573c2e6fc70a;
#using scripts\mp\equipment\claymore.gsc;
#using scripts\mp\equipment\at_mine.gsc;
#using script_2bada07de712df57;
#using scripts\cp_mp\equipment\throwing_knife.gsc;
#using scripts\mp\equipment\molotov.gsc;
#using scripts\mp\equipment\thermite.gsc;
#using scripts\mp\supers\spawnbeacon.gsc;
#using scripts\mp\equipment\support_box.gsc;
#using scripts\mp\equipment\gas_grenade.gsc;
#using scripts\mp\equipment\binoculars.gsc;
#using scripts\mp\equipment\tactical_cover.gsc;
#using scripts\mp\equipment\tac_insert.gsc;
#using scripts\mp\equipment\advanced_supply_drop.gsc;
#using scripts\mp\equipment\weapon_drop.gsc;
#using script_51f5154861435b1e;
#using script_28b451b2ea6dae46;
#using script_681c3db54537afa6;
#using script_45c10ca5cb8409bf;
#using script_479e458f6f530f0d;
#using script_1cf2ed809496bf4e;
#using script_a35012b9b75a996;
#using script_6e2bb9330396afcb;
#using script_5876130c2d1591f9;
#using script_c0f9f3b00e6dbcc;
#using script_22115fec83741670;
#using script_7ec79670452ec186;
#using script_19818a4d668d8841;
#using script_156835ef9924856a;
#using script_52d91cb28006a5bd;
#using script_13f9dde7eecfbc71;
#using script_69d4ade76a80c6fe;
#using script_35e8be7f3fa3f35e;
#using script_3ef6c4fbba18bfa4;
#using script_19fd5b5d73d44c18;
#using script_676f8221e501bed1;
#using scripts\mp\equipment\concussion_grenade.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using script_2d9d24f7c63ac143;
#using scripts\cp_mp\utility\train_utility.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\mp\killstreaks\remotetank.gsc;
#using script_7e994e91383c7ba;
#using script_1eddec53abf6e24c;
#using scripts\cp_mp\killstreaks\chopper_gunner.gsc;
#using scripts\cp_mp\killstreaks\gunship.gsc;
#using scripts\cp_mp\emp_debuff.gsc;

#namespace weapons;

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3258
// Size: 0x1b
function attachmentgroup(attachmentname) {
    return tablelookup("mp/attachmenttable.csv", 4, attachmentname, 2);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x327b
// Size: 0x350
function init() {
    level.var_b2b35840c12ce55c = utility::function_53c4c53197386572(level.var_b2b35840c12ce55c, []);
    level.scavenger_altmode = 1;
    level.scavenger_secondary = 1;
    level.maxperplayerexplosives = max(namespace_9a8c945fe45c8e5::getintproperty(@"hash_b62eac49cca8c84b", 2), 1);
    level.riotshieldxpbullets = namespace_9a8c945fe45c8e5::getintproperty(@"hash_ecd162ffa953cac1", 15);
    level.var_34777cc7c85edbe6 = getdvarint(@"hash_17eb9db052738f30", 96);
    switch (namespace_9a8c945fe45c8e5::getintproperty(@"hash_efe12003ddfaa46e", 0)) {
    case 1:
        level.scavenger_altmode = 0;
        break;
    case 2:
        level.scavenger_secondary = 0;
        break;
    case 3:
        level.scavenger_altmode = 0;
        level.scavenger_secondary = 0;
        break;
    }
    weapon::function_5238382582ce39fa();
    level._effect["emp_stun"] = loadfx("vfx/core/mp/equipment/vfx_emp_grenade");
    level._effect["equipment_explode"] = loadfx("vfx/iw7/_requests/mp/vfx_generic_equipment_exp.vfx");
    level._effect["equipment_smoke"] = loadfx("vfx/core/mp/killstreaks/vfx_sg_damage_blacksmoke");
    level._effect["equipment_sparks"] = loadfx("vfx/core/mp/killstreaks/vfx_sentry_gun_explosion");
    level._effect["glsmoke"] = loadfx("vfx/iw8_mp/equipment/smoke_grenade/vfx_smoke_gren_ch");
    level._effect["xmike109ThermiteBounce"] = loadfx("vfx/iw8_mp/equipment/vfx_xmike109_thermite_bounce");
    level._effect["penetration_railgun_impact"] = loadfx("vfx/iw7/_requests/mp/vfx_penetration_railgun_impact.vfx");
    level._effect["sentry_gun_stun_fx"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_sentry_emp_disable.vfx");
    entity::placeequipmentfailedinit();
    level.weaponconfigs = [];
    if (!isdefined(level.weapondropfunction)) {
        level.weapondropfunction = &dropweaponfordeath;
    }
    var_7522d80d673f6f7 = 25;
    level.sticky_minedetectiondot = cos(var_7522d80d673f6f7);
    level.sticky_minedetectionmindist = 15;
    level.sticky_minedetectiongraceperiod = 0.35;
    level.sticky_minedetonateradius = 256;
    level.minedetectiongraceperiod = 0.3;
    level.primary_weapon_array = [];
    level.side_arm_array = [];
    level.grenade_array = [];
    level.missile_array = [];
    level.inventory_array = [];
    level.mines = [];
    namespace_b8f8e2f86acf53ed::registeronplayerspawncallback(&onplayerspawned);
    level thread onplayerconnect();
    outline::initoutlineoccluders();
    init_function_refs();
    level.onweapondropcreated = namespace_e23d6eb3062a75be::callback_create();
    level.onweapondroppickedup = namespace_e23d6eb3062a75be::callback_create();
    level.var_30b163d5fb8dc7d9 = namespace_f6b8dbdf5c7eed7::function_e4c99b0f178ffb98("DroneLauncher", 10, level.framedurationseconds, 50);
    level.weaponnone = makeweapon("none");
    if (getdvarint(@"hash_eb1e94069d5150f2") == 1) {
        level thread savegraverobberammo();
    }
    registersharedfunc("weapons", "recommendedStatusBySeason", &recommendedStatusBySeason);
    /#
        setdevdvar(@"hash_10368af4dee3ba2c", 0);
        setdevdvarifuninitialized(@"hash_eb7d16d9fa10a208", 625000000);
    #/
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35d2
// Size: 0x25f
function savegraverobberammo() {
    while (1) {
        if (isdefined(level.players)) {
            foreach (player in level.players) {
                if (!isdefined(player)) {
                    continue;
                }
                if (player perk::_hasperk("specialty_scrap_weapons")) {
                    weapon = player getcurrentweapon();
                    player getcurrentweapon();
                    if (!isdefined(weapon)) {
                        continue;
                    }
                    if (!isdefined(player.graverobberammo)) {
                        player.graverobberammo = spawnstruct();
                        player.graverobberammo = spawnstruct();
                        player.graverobberammo = spawnstruct();
                    }
                    if (isdefined(player.graverobberammo.currentweapon) && player.graverobberammo.currentweapon.weapon.basename != "none" && player.graverobberammo.currentweapon.weapon != weapon) {
                        player.graverobberammo.lastweapon = player.graverobberammo.currentweapon;
                        player.graverobberammo.currentweapon = spawnstruct();
                    }
                    player.graverobberammo.currentweapon = spawnstruct();
                    player.graverobberammo.currentweapon.weapon = weapon;
                    player.graverobberammo.currentweapon.rightclip = player getweaponammoclip(weapon, "right");
                    player.graverobberammo.currentweapon.leftclip = player getweaponammoclip(weapon, "left");
                    player.graverobberammo.currentweapon.stock = player getweaponammostock(weapon);
                } else {
                    player.graverobberammo = undefined;
                }
            }
        }
        waitframe();
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3838
// Size: 0x14
function enablevisibilitycullingforclient(client) {
    self hudoutlinedisableforclient(client);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3853
// Size: 0x77
function onplayerconnect() {
    for (;;) {
        player = level waittill("connected");
        player.hits = [];
        player.var_5ffaa0ceb1f66708 = [];
        player.var_c63a7f2980c7d596 = [];
        gamelogic::sethasdonecombat(player, 0);
        player thread watchmissileusage();
        if (getdvarint(@"hash_7a52196ce3c53c73", 0) && game_utility::function_2d79a7a3b91c4c3e()) {
            player thread function_627adf66cf046c65();
        }
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38d1
// Size: 0x4d4
function function_627adf66cf046c65() {
    self endon("disconnect");
    logstring("watch_mobile_cheat_loadouts finished setup.");
    while (1) {
        var_2150015540242e9e = message = self waittill("luinotifyserver");
        if (message == "mobile_debug_give_killstreak") {
            killstreakref = undefined;
            switch (var_2150015540242e9e) {
            case 0:
                killstreakref = "toma_strike";
                break;
            case 1:
                killstreakref = "precision_airstrike";
                break;
            case 2:
                killstreakref = "uav";
                break;
            case 4:
                killstreakref = "scrambler_drone_guard";
                break;
            case 5:
                killstreakref = "directional_uav";
                break;
            case 6:
                killstreakref = "assault_drone";
                break;
            case 7:
                killstreakref = "airdrop";
                break;
            case 8:
                killstreakref = "fuel_airstrike";
                break;
            case 9:
                killstreakref = "hover_jet";
                break;
            case 10:
                killstreakref = "airdrop_escort";
                break;
            case 11:
                killstreakref = "auto_drone";
                break;
            case 12:
                killstreakref = "chopper_gunner";
                break;
            case 13:
                killstreakref = "airdrop_multiple";
                break;
            case 14:
                killstreakref = "gunship";
                break;
            case 15:
                killstreakref = "juggernaut";
                break;
            case 16:
                killstreakref = "cruise_predator";
                break;
            case 17:
                killstreakref = "sentry_gun";
                break;
            case 18:
                killstreakref = "pac_sentry";
                break;
            }
            if (isdefined(killstreakref)) {
                killstreaks::awardkillstreak(killstreakref, "other");
            }
        } else if (message == "mobile_debug_give_fieldupgrade") {
            var_d782e69ca6374ba6 = undefined;
            switch (var_2150015540242e9e) {
            case 0:
                var_d782e69ca6374ba6 = "super_tac_cover";
                break;
            case 1:
                var_d782e69ca6374ba6 = "super_trophy";
                break;
            case 2:
                var_d782e69ca6374ba6 = "super_deadsilence";
                break;
            case 3:
                var_d782e69ca6374ba6 = "super_support_box";
                break;
            case 4:
                var_d782e69ca6374ba6 = "super_ammo_drop";
                break;
            case 5:
                var_d782e69ca6374ba6 = "super_armor_drop";
                break;
            case 6:
                var_d782e69ca6374ba6 = "super_battlerage";
                break;
            }
            if (isdefined(var_d782e69ca6374ba6)) {
                supers::givesuper(var_d782e69ca6374ba6, 0, 1);
            }
        } else if (message == "mobile_debug_give_equipment") {
            equipmentref = undefined;
            switch (var_2150015540242e9e) {
            case 0:
                equipmentref = "equip_frag";
                break;
            case 1:
                equipmentref = "equip_at_mine";
                break;
            case 2:
                equipmentref = "equip_claymore";
                break;
            case 3:
                equipmentref = "equip_molotov";
                break;
            case 4:
                equipmentref = "equip_semtex";
                break;
            case 5:
                equipmentref = "equip_thermite";
                break;
            case 6:
                equipmentref = "equip_throwing_knife";
                break;
            case 7:
                equipmentref = "equip_throwing_knife_fire";
                break;
            case 10:
                equipmentref = "equip_adrenaline";
                break;
            case 11:
                equipmentref = "equip_concussion";
                break;
            case 12:
                equipmentref = "equip_decoy";
                break;
            case 13:
                equipmentref = "equip_flash";
                break;
            case 14:
                equipmentref = "equip_gas_grenade";
                break;
            case 15:
                equipmentref = "equip_hb_sensor";
                break;
            case 16:
                equipmentref = "equip_smoke";
                break;
            case 17:
                equipmentref = "equip_snapshot_grenade";
                break;
            case 20:
                equipmentref = "equip_armorplate";
                break;
            case 21:
                equipmentref = "equip_binoculars";
                break;
            case 22:
                equipmentref = "equip_bunkerbuster";
                break;
            case 23:
                equipmentref = "equip_shockstick";
                break;
            case 24:
                equipmentref = "equip_c4";
                break;
            }
            if (isdefined(equipmentref)) {
                slot = equipment::getdefaultslot(equipmentref);
                equipment::giveequipment(equipmentref, slot);
            }
        }
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dac
// Size: 0x93
function watchchangeweapon() {
    self endon("death_or_disconnect");
    self endon("joined_spectators");
    self endon("faux_spawn");
    level endon("game_ended");
    var_8d9fb0db0c319184 = spawnstruct();
    lastweapon = undefined;
    while (1) {
        objweapon = self getcurrentweapon();
        if (isdefined(objweapon)) {
            dochangeweapon(objweapon);
            var_8d9fb0db0c319184.lastweapon = lastweapon;
            var_8d9fb0db0c319184.weapon = objweapon;
            callback::callback("player_weapon_change", var_8d9fb0db0c319184);
        }
        self waittill("weapon_change");
        lastweapon = objweapon;
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e46
// Size: 0x85
function dochangeweapon(objweapon) {
    logchangeweapon(objweapon);
    updateweaponspeed(objweapon);
    function_c49a0d832ace8e5e();
    updatelastweaponobj(objweapon);
    savealtstates();
    updatelauncherusage();
    updateweaponperks();
    updatesniperglint(objweapon);
    namespace_e2785bb1da360f91::function_b939bc4f3a6d4fdc(objweapon);
    scriptedMountDisable(objweapon);
    namespace_30a6d7a07831c1e2::updatedefaultflinchreduction();
    events::updateweaponchangetime();
    class::riotshieldonweaponchange(objweapon);
    namespace_30a6d7a07831c1e2::updateweaponkick();
    thread gestures::tryreenablescriptablevfx();
    function_82a0e6138ba06718(objweapon);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ed2
// Size: 0x50
function scriptedMountDisable(objweapon) {
    if (istrue(level.disablemount)) {
        return;
    }
    if (function_dd461671d4007c1f(objweapon)) {
        val::set("scriptedMountDisable", "mount_top", 0);
        val::set("scriptedMountDisable", "mount_side", 0);
        thread function_5845dd5192f930b7();
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f29
// Size: 0x27
function function_5845dd5192f930b7() {
    self endon("disconnect");
    utility::waittill_any_2("death", "weapon_change");
    val::function_c9d0b43701bdba00("scriptedMountDisable");
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f57
// Size: 0x3b
function function_dd461671d4007c1f(objweapon) {
    rootname = weapon::getweaponrootname(objweapon);
    if (rootname == "iw8_lm_sierrax" && objweapon hasattachment("stocksaw_sierrax")) {
        return 1;
    }
    return 0;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f9a
// Size: 0x144
function logchangeweapon(objweapon) {
    if (!istrue(self.canlogchangeweapon)) {
        self.canlogchangeweapon = 1;
        return;
    }
    currentweaponname = objweapon.basename;
    secondaryweaponname = "none";
    if (!isdefined(currentweaponname) || currentweaponname == "none") {
        return;
    }
    if (isdefined(self.lastweaponobj) && objweapon == self.lastweaponobj) {
        return;
    }
    if (self.equippedweapons.size > 1) {
        secondaryweaponname = self.equippedweapons[1].basename;
        if (secondaryweaponname == currentweaponname) {
            secondaryweaponname = self.equippedweapons[0].basename;
        }
    }
    if (isdefined(self.primaryweaponobj)) {
        self setclientweaponinfo(0, getcompleteweaponname(self.primaryweaponobj));
    }
    if (isdefined(self.secondaryweaponobj)) {
        self setclientweaponinfo(1, getcompleteweaponname(self.secondaryweaponobj));
    }
    if (getdvarint(@"hash_4b12bceaccf1e3bb", 0) == 1) {
        self dlog_recordplayerevent("dlog_event_weapon_change", [0:"current_weapon", 1:currentweaponname, 2:"secondary_weapon", 3:secondaryweaponname]);
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40e5
// Size: 0x1b
function updateweaponperks() {
    self.prevweaponobj = doweaponperkupdate(self.prevweaponobj);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4107
// Size: 0x1f
function updatesniperglint(objweapon) {
    if (sniperglint_supported(objweapon)) {
        childthread sniperglint_manage(objweapon);
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x412d
// Size: 0x2b
function function_daef03172b217e78(objweapon) {
    if (1) {
        var_1960b715abe16306 = function_b3e5f50a0d4a9c86(objweapon);
        function_a7adacdb4c7641c9(var_1960b715abe16306);
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x415f
// Size: 0x257
function updatelauncherusage() {
    weapon = self getcurrentweapon();
    var_21c8aabcb09f7094 = isdefined(game["inLiveLobby"]);
    if (!var_21c8aabcb09f7094 && !flags::gameflag("prematch_done") && namespace_45ecbe78f599af72::islockonlauncher(weapon)) {
        val::set("prematch", "ads", 0);
    }
    rootname = weapon::getweaponrootname(weapon.basename);
    switch (rootname) {
    default:
        break;
    case #"hash_1f15297cd7a481c1":
    case #"hash_326dc2026394652a":
        thread namespace_25f632c5311f7107::initmissilelauncherusage();
        break;
    case #"hash_60bbbd68c3990680":
        thread javelin::javelin_reset();
        break;
    case #"hash_8d9ae5e5dd390b4b":
        thread crossbow::initcrossbowusage();
        break;
    case #"hash_d2b54efbd2b4a293":
        thread namespace_4d6911a5d970ff49::initcrossbowusage();
        break;
    }
    self notify("end_launcher");
    if (perk::_hasperk("specialty_fastreload_launchers")) {
        islauncher = weaponclass(weapon.basename) == "rocketlauncher" || weapon.basename == "iw8_la_kgolf_mp";
        if (islauncher && !istrue(self.fastreloadlaunchers)) {
            perk::giveperk("specialty_fastreload");
            self.fastreloadlaunchers = 1;
        } else if (istrue(self.fastreloadlaunchers)) {
            perk::removeperk("specialty_fastreload");
            self.fastreloadlaunchers = undefined;
        }
    }
    switch (weapon.basename) {
    default:
        break;
    case #"hash_13a265ac820ea0df":
    case #"hash_3e782fd775b72022":
    case #"hash_a9e31b8ffd42a67b":
        thread namespace_25f632c5311f7107::missilelauncherusageloop();
        break;
    case #"hash_5c272c0617caebf0":
    case #"hash_5cbb3a1a84d47f1d":
        thread javelin::javelinusageloop();
        break;
    case #"hash_87262a67e163f7c9":
    case #"hash_9a855bc1e9e860f6":
        thread crossbow::crossbowusageloop(weapon);
        break;
    case #"hash_377cd64db0638901":
        thread namespace_4d6911a5d970ff49::crossbowusageloop(weapon);
        break;
    case #"hash_78063db94e7df144":
        thread xmike109::usageloop(weapon);
        break;
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43bd
// Size: 0x30
function setlastdroppableweaponobj(weaponobj) {
    self.lastdroppableweaponobj = weaponobj;
    if (isdefined(level.lastdroppableweaponchanged)) {
        self [[ level.lastdroppableweaponchanged ]]();
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43f4
// Size: 0x6d
function updatelastweaponobj(var_82533969b4683de4) {
    var_dd9181eb18c4db69 = var_82533969b4683de4 getnoaltweapon();
    if (isnullweapon(var_dd9181eb18c4db69)) {
        var_dd9181eb18c4db69 = var_82533969b4683de4;
    }
    self.lastweaponobj = var_82533969b4683de4;
    if (isnormallastweapon(var_82533969b4683de4)) {
        self.lastnormalweaponobj = var_82533969b4683de4;
    }
    if (isdroppableweapon(var_dd9181eb18c4db69)) {
        setlastdroppableweaponobj(var_dd9181eb18c4db69);
    }
    if (weapon::iscacprimaryorsecondary(var_82533969b4683de4)) {
        self.lastcacweaponobj = var_82533969b4683de4;
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4468
// Size: 0xba
function updateweaponspeed(var_82533969b4683de4) {
    function_9085d7f0321ea2a4(var_82533969b4683de4);
    if (var_82533969b4683de4.basename == "none") {
        return;
    } else if (weapon::issuperweapon(var_82533969b4683de4.basename)) {
        updatemovespeedscale();
        return;
    } else if (weapon::iskillstreakweapon(var_82533969b4683de4.basename)) {
        updatemovespeedscale();
        return;
    } else if (var_82533969b4683de4.basename == "iw9_me_fists_mp_ls") {
        updatemovespeedscale();
        return;
    } else if (var_82533969b4683de4.inventorytype != "primary" && var_82533969b4683de4.inventorytype != "altmode") {
        return;
    }
    updatemovespeedscale();
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4529
// Size: 0x42
function function_9085d7f0321ea2a4(objweapon) {
    var_de17420c437b06b3 = 1;
    if (namespace_45ecbe78f599af72::isriotshield(objweapon.basename)) {
        var_de17420c437b06b3 = 0;
    }
    val::set("weaponJogState", "jog", var_de17420c437b06b3);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4572
// Size: 0x148
function function_c49a0d832ace8e5e() {
    if (isdefined(self.lastweaponobj)) {
        weaponname = self.lastweaponobj.basename;
        var_33802b6339ad8b00 = getsubstr(weaponname, 0, 3);
        if (var_33802b6339ad8b00 == "iw8" || var_33802b6339ad8b00 == "s4_") {
            weaponname = weapon::getweaponrootname(self.lastweaponobj);
        }
        currenttime = namespace_c45ac99c4997e722::function_1b15450e092933cf(gettime()) / 1000;
        initpersstat("currentWeaponStartTime");
        totaltime = currenttime - namespace_3c5a4254f2b957ea::getpersstat("currentWeaponStartTime");
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.weaponname = weaponname;
        var_7e2c53b0bcf117d9.fullweaponname = getcompleteweaponname(self.lastweaponobj);
        var_7e2c53b0bcf117d9.statname = "timeUsed";
        var_7e2c53b0bcf117d9.var_a1d4e7d5ef9da660 = totaltime;
        var_7e2c53b0bcf117d9.variantid = getweaponvariantindex(self.lastweaponobj);
        var_7e2c53b0bcf117d9.weaponobj = self.lastweaponobj;
        namespace_c45ac99c4997e722::function_80820d6d364c1836("callback_update_weapon_stats", var_7e2c53b0bcf117d9);
        self.pers["currentWeaponStartTime"] = currenttime;
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46c1
// Size: 0x1c3
function onplayerspawned() {
    gamelogic::sethasdonecombat(self, 0);
    if (!isdefined(self.trackingweapon)) {
        persistence::persclear_stats();
    }
    if (!isdefined(self.plantedlethalequip)) {
        self.plantedlethalequip = [];
    }
    if (!isdefined(self.plantedtacticalequip)) {
        self.plantedtacticalequip = [];
    }
    if (!isdefined(self.plantedsuperequip)) {
        self.plantedsuperequip = [];
    }
    if (!isdefined(self.plantedhackedequip)) {
        self.plantedhackedequip = [];
    }
    self.prevweaponobj = undefined;
    thread watchchangeweapon();
    thread watchweaponusage();
    thread watchgrenadeusage();
    thread watchequipmentonspawn();
    if (game_utility::onlinestatsenabled()) {
        thread watchfornearmisswhizby();
    }
    if (!game_utility::runleanthreadmode()) {
        thread watchdropweapons();
    }
    self.lasthittime = [];
    self.droppeddeathweapon = undefined;
    self.tookweaponfrom = [];
    self.lastnormalweaponobj = utility::ter_op(isdefined(self.spawnweaponobj), self.spawnweaponobj, nullweapon());
    self.lastweaponobj = utility::ter_op(isdefined(self.spawnweaponobj), self.spawnweaponobj, nullweapon());
    self.lastcacweaponobj = utility::ter_op(isdefined(self.spawnweaponobj) && weapon::iscacprimaryorsecondary(self.spawnweaponobj), self.spawnweaponobj, nullweapon());
    setlastdroppableweaponobj(utility::ter_op(isdefined(self.spawnweaponobj), self.spawnweaponobj, nullweapon()));
    gamescore::initassisttrackers();
    var_b029006befa9cf56 = getweaponcamoname(self getcurrentweapon());
    thread runcamoscripts(var_b029006befa9cf56);
    self.var_85dc59c6a906819f = undefined;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x488b
// Size: 0xed
function savealtstates() {
    self.pers["altStates"] = [];
    weapons = self.primaryinventory;
    foreach (objweapon in weapons) {
        if (!isundefinedweapon(self.primaryweaponobj) && objweapon == self.primaryweaponobj || !isundefinedweapon(self.secondaryweaponobj) && objweapon == self.secondaryweaponobj) {
            if (shouldweaponsavealtstate(objweapon) && self isalternatemode(objweapon, 1)) {
                var_366b0ecc2f28aead = weapon::getcompleteweaponnamenoalt(objweapon);
                self.pers["altStates"][var_366b0ecc2f28aead] = 1;
            }
        }
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x497f
// Size: 0x16e
function savetogglescopestates() {
    self.pers["toggleScopeStates"] = [];
    self.pers["tacticalADSStates"] = [];
    weapons = self.primaryinventory;
    foreach (objweapon in weapons) {
        if (!isundefinedweapon(self.primaryweaponobj) && objweapon == self.primaryweaponobj || !isundefinedweapon(self.secondaryweaponobj) && objweapon == self.secondaryweaponobj) {
            var_366b0ecc2f28aead = undefined;
            if (isdefined(objweapon.scope) && istogglescope(objweapon, objweapon.scope)) {
                var_366b0ecc2f28aead = weapon::getcompleteweaponnamenoalt(objweapon);
                self.pers["toggleScopeStates"][var_366b0ecc2f28aead] = self gethybridscopestate(objweapon);
            }
            if (self function_f033d1a86348766a(objweapon)) {
                if (!isdefined(var_366b0ecc2f28aead)) {
                    var_366b0ecc2f28aead = weapon::getcompleteweaponnamenoalt(objweapon);
                }
                self.pers["tacticalADSStates"][var_366b0ecc2f28aead] = self function_c603bed3b1c8d11(objweapon, 1);
                if (!isalive(self) && self function_ad155da412bac439()) {
                    self.pers["tacticalADSStates"][var_366b0ecc2f28aead] = 0;
                }
            }
        }
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4af4
// Size: 0xac
function updatetogglescopestate(objweapon) {
    var_366b0ecc2f28aead = weapon::getcompleteweaponnamenoalt(objweapon);
    if (isdefined(namespace_3c5a4254f2b957ea::getpersstat("toggleScopeStates")) && isdefined(namespace_3c5a4254f2b957ea::getpersstat("toggleScopeStates")[var_366b0ecc2f28aead])) {
        self sethybridscopestate(objweapon, namespace_3c5a4254f2b957ea::getpersstat("toggleScopeStates")[var_366b0ecc2f28aead]);
    } else if (function_dab7bc436f0b0bde(objweapon)) {
        self sethybridscopestate(objweapon, 1);
    }
    if (isdefined(namespace_3c5a4254f2b957ea::getpersstat("tacticalADSStates")) && isdefined(namespace_3c5a4254f2b957ea::getpersstat("tacticalADSStates")[var_366b0ecc2f28aead]) && self function_f033d1a86348766a(objweapon)) {
        self function_ed96bc79d7607d3d(objweapon, namespace_3c5a4254f2b957ea::getpersstat("tacticalADSStates")[var_366b0ecc2f28aead]);
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ba7
// Size: 0x5e
function function_dab7bc436f0b0bde(objweapon) {
    if (isdefined(objweapon.scope) && (objweapon.scope == "hybrid03" || objweapon.scope == "hybridtherm01" || objweapon.scope == "hybridrange01")) {
        return 1;
    }
    return 0;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c0d
// Size: 0x8e
function updatesavedaltstate(objweapon) {
    /#
        assertex(!objweapon.isalternate, "updateAltScopeState() passed weapon already in alt mode.");
    #/
    if (isdefined(self.pers["altStates"]) && istrue(objweapon.hasalternate)) {
        var_366b0ecc2f28aead = weapon::getcompleteweaponnamenoalt(objweapon);
        if (isdefined(self.pers["altStates"][var_366b0ecc2f28aead]) && self.pers["altStates"][var_366b0ecc2f28aead]) {
            objweapon = objweapon getaltweapon();
        }
    }
    return objweapon;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ca3
// Size: 0x34
function istogglescope(weapon, attachment) {
    if (!isdefined(attachment)) {
        return 0;
    }
    var_1439f86640d42e34 = function_7c612ac92ba98dcb(weapon, attachment);
    return var_1439f86640d42e34 == "hybrid";
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cdf
// Size: 0x34
function shouldweaponsavealtstate(objweapon) {
    if (istrue(objweapon.hasalternate)) {
        if (shouldattachmentsavealtstate(objweapon, objweapon.underbarrel)) {
            return 1;
        }
    }
    return 0;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d1b
// Size: 0x1c
function shouldattachmentsavealtstate(objweapon, var_acd3280c3e566807) {
    return isattachmentselectfire(objweapon, var_acd3280c3e566807);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d3f
// Size: 0x2d
function isattachmentselectfire(weapon, attachment) {
    var_1439f86640d42e34 = function_7c612ac92ba98dcb(weapon, attachment);
    return var_1439f86640d42e34 == "selectfire";
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d74
// Size: 0xd
function isattachmentgrenadelauncher(var_acd3280c3e566807) {
    return 0;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d89
// Size: 0x9c
function weaponperkupdate(var_4da99b8aaff6e52a, prevweaponobj) {
    if (!isundefinedweapon(prevweaponobj)) {
        var_9586602ebc60b765 = weapon::getweaponrootname(prevweaponobj.basename);
        var_b46ba6b5339521f1 = weapon::weaponperkmap(var_9586602ebc60b765);
        if (isdefined(var_b46ba6b5339521f1)) {
            function_ec132c173d4532ee(var_b46ba6b5339521f1);
        }
    }
    if (!isundefinedweapon(var_4da99b8aaff6e52a)) {
        var_98efd9d21da41d1a = weapon::getweaponrootname(var_4da99b8aaff6e52a.basename);
        var_ca1ccac233079978 = weapon::weaponperkmap(var_98efd9d21da41d1a);
        if (isdefined(var_ca1ccac233079978)) {
            function_dd1698252c31d637(var_ca1ccac233079978);
        }
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e2c
// Size: 0x1c3
function weaponattachmentperkupdate(var_4da99b8aaff6e52a, prevweaponobj) {
    var_503110dc18b08ab9 = undefined;
    var_88c1658d6b22a174 = undefined;
    if (!isundefinedweapon(prevweaponobj)) {
        var_88c1658d6b22a174 = getweaponattachments(prevweaponobj);
        if (isdefined(var_88c1658d6b22a174) && var_88c1658d6b22a174.size > 0) {
            foreach (var_4b974a0c3ae8192b in var_88c1658d6b22a174) {
                perks = weapon::attachmentperkmap(prevweaponobj, var_4b974a0c3ae8192b);
                if (!isdefined(perks)) {
                    continue;
                }
                foreach (perk in perks) {
                    function_ec132c173d4532ee(perk);
                }
            }
        }
    }
    if (!isundefinedweapon(var_4da99b8aaff6e52a)) {
        var_503110dc18b08ab9 = getweaponattachments(var_4da99b8aaff6e52a);
        if (isdefined(var_503110dc18b08ab9) && var_503110dc18b08ab9.size > 0) {
            foreach (var_8ec829625d9ffe8c in var_503110dc18b08ab9) {
                perks = weapon::attachmentperkmap(var_4da99b8aaff6e52a, var_8ec829625d9ffe8c);
                if (!isdefined(perks)) {
                    continue;
                }
                foreach (perk in perks) {
                    function_dd1698252c31d637(perk);
                }
            }
        }
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ff6
// Size: 0x30
function doweaponperkupdate(prevweaponobj) {
    var_4da99b8aaff6e52a = self getcurrentweapon();
    weaponattachmentperkupdate(var_4da99b8aaff6e52a, prevweaponobj);
    weaponperkupdate(var_4da99b8aaff6e52a, prevweaponobj);
    return var_4da99b8aaff6e52a;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x502e
// Size: 0x3d
function watchweaponperkupdates() {
    self endon("death_or_disconnect");
    self endon("faux_spawn");
    self endon("giveLoadout_start");
    prevweaponobj = undefined;
    while (1) {
        prevweaponobj = doweaponperkupdate(prevweaponobj);
        self waittill("weapon_change");
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5072
// Size: 0x2b
function function_a7adacdb4c7641c9(var_89b8f50d9a20f2ab) {
    if (var_89b8f50d9a20f2ab) {
        self function_5762cf97c6f1a2c1("first_person");
    } else {
        self function_5762cf97c6f1a2c1("third_person");
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50a4
// Size: 0x70
function sniperglint_supported(weapon) {
    if (isnullweapon(weapon) || !isdefined(weapon.scope) || weaponclass(weapon) == "rocketlauncher") {
        return 0;
    }
    class = weaponclass(weapon);
    if (self isalternatemode(weapon) && (class == "grenade" || class == "spread")) {
        return 0;
    }
    return function_cb81eb90ddc79ab7();
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x511c
// Size: 0x51
function function_cb81eb90ddc79ab7() {
    if (perk::_hasperk("specialty_glintxsml") || perk::_hasperk("specialty_glintsml") || perk::_hasperk("specialty_glintmed") || perk::_hasperk("specialty_glintlrg") || perk::_hasperk("specialty_glintxlrg")) {
        return 1;
    }
    return 0;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5175
// Size: 0x75
function function_b3e5f50a0d4a9c86(weapon) {
    if (isnullweapon(weapon) || !isdefined(weapon.scope)) {
        return 0;
    }
    if (issubstr(weapon.scope, "snprscope") || issubstr(weapon.scope, "vzscope") || issubstr(weapon.scope, "thermal")) {
        return 1;
    }
    return 0;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51f2
// Size: 0xae
function sniperglint_manage(objweapon) {
    self notify("manageSniperGlint");
    self endon("manageSniperGlint");
    self endon("weapon_change");
    waitframe();
    thread sniperglint_cleanup();
    self.glinton = 0;
    istogglescope = istogglescope(objweapon, objweapon.scope);
    while (1) {
        if (self playerads() > 0.5 && self hasweapon(objweapon) && !(istogglescope && self gethybridscopestate(objweapon))) {
            if (!self.glinton) {
                sniperglint_add();
            }
        } else if (self.glinton) {
            sniperglint_remove();
        }
        waitframe();
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52a7
// Size: 0x3f
function sniperglint_cleanup() {
    utility::waittill_any_2("death_or_disconnect", "weapon_change");
    if (isdefined(self.glinton) && self.glinton) {
        sniperglint_remove();
        self.glinton = undefined;
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52ed
// Size: 0xfa
function sniperglint_add() {
    /#
        assertex(isdefined(self.glinton), "sniperGlint_add() called on player with no glint setting.");
    #/
    /#
        assertex(!isdefined(self.glinton) || self.glinton == 0, "sniperGlint_add() called on player glint already set to true.");
    #/
    if (_hasperk("specialty_glintxsml")) {
        self setscriptablepartstate("sniperGlint", "sniperGlintXsml", 0);
    } else if (_hasperk("specialty_glintsml")) {
        self setscriptablepartstate("sniperGlint", "sniperGlintSml", 0);
    } else if (_hasperk("specialty_glintmed")) {
        self setscriptablepartstate("sniperGlint", "sniperGlintMed", 0);
    } else if (_hasperk("specialty_glintlrg")) {
        self setscriptablepartstate("sniperGlint", "sniperGlintLrg", 0);
    } else if (_hasperk("specialty_glintxlrg")) {
        self setscriptablepartstate("sniperGlint", "sniperGlintXlrg", 0);
    }
    self.glinton = 1;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53ee
// Size: 0x65
function sniperglint_remove() {
    /#
        assertex(isdefined(self.glinton), "sniperGlint_remove() called on player with no glint setting.");
    #/
    /#
        assertex(!isdefined(self.glinton) || self.glinton == 1, "sniperGlint_remove() called on player glint already set to false.");
    #/
    if (isdefined(self)) {
        self setscriptablepartstate("sniperGlint", "sniperGlintOff", 0);
        self.glinton = 0;
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x545a
// Size: 0x64
function sniperadsblur(weapon) {
    self endon("weapon_change");
    self.sniperblur = 0;
    while (1) {
        if (self playerads() > 0.65 && !self.sniperblur) {
            thread sniperadsblur_execute(weapon);
        } else if (self playerads() <= 0.65) {
            sniperadsblur_remove();
        }
        waitframe();
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54c5
// Size: 0x49
function sniperadsblur_execute(weapon) {
    self notify("sniperBlurReset");
    self endon("sniperBlurReset");
    self.sniperblur = 1;
    self setblurforplayer(25, 0.1);
    wait(0.1);
    self setblurforplayer(0, getsniperadsblurtime(weapon));
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5515
// Size: 0x1e
function sniperadsblur_remove() {
    self notify("sniperBlurReset");
    self setblurforplayer(0, 0);
    self.sniperblur = 0;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x553a
// Size: 0x72
function getsniperadsblurtime(weapon) {
    var_6159317eb912f3e5 = 0.3;
    switch (weapon.basename) {
    case #"hash_720415103e03ae2":
        var_6159317eb912f3e5 = 0.18;
        break;
    case #"hash_b9e0da8080aefc13":
        var_6159317eb912f3e5 = 0.12;
        break;
    case #"hash_1c4e9e71e522fc4f":
        var_6159317eb912f3e5 = 0.12;
        break;
    }
    return var_6159317eb912f3e5;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x55b4
// Size: 0x106
function watchsniperboltactionkills() {
    self endon("death_or_disconnect");
    thread watchsniperboltactionkills_ondeath();
    if (!isdefined(self.pers["recoilReduceKills"])) {
        self.pers["recoilReduceKills"] = 0;
    }
    self setclientomnvar("weap_sniper_display_state", self.pers["recoilReduceKills"]);
    while (1) {
        meansofdeath = sweapon = victim = self waittill("got_a_kill");
        weapon = makeweaponfromstring(sweapon);
        if (isrecoilreducingweapon(weapon)) {
            kills = self.pers["recoilReduceKills"] + 1;
            self.pers["recoilReduceKills"] = int(min(kills, 4));
            self setclientomnvar("weap_sniper_display_state", self.pers["recoilReduceKills"]);
            if (kills <= 4) {
                stancerecoilupdate(self getstance());
            }
        }
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56c1
// Size: 0x32
function watchsniperboltactionkills_ondeath() {
    self notify("watchSniperBoltActionKills_onDeath");
    self endon("watchSniperBoltActionKills_onDeath");
    self endon("disconnect");
    self waittill("death");
    self.pers["recoilReduceKills"] = 0;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56fa
// Size: 0xd
function isrecoilreducingweapon(weapon) {
    return 0;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x570f
// Size: 0x39
function getrecoilreductionvalue() {
    if (!isdefined(self.pers["recoilReduceKills"])) {
        self.pers["recoilReduceKills"] = 0;
    }
    return self.pers["recoilReduceKills"] * 3;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5750
// Size: 0x3d
function ishackweapon(weapon) {
    if (weapon == "radar_mp" || weapon == "airstrike_mp" || weapon == "helicopter_mp") {
        return 1;
    }
    if (weapon == "briefcase_bomb_mp") {
        return 1;
    }
    return 0;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5795
// Size: 0x1c
function isfistweapon(weapon) {
    weapon = getweaponrootname(weapon);
    return weapon == "iw9_me_fists";
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57b9
// Size: 0x3f
function isbombplantweapon(weapon) {
    return weapon == "briefcase_bomb_mp" || weapon == "briefcase_bomb_defuse_mp" || weapon == "briefcase_silent_mp" || weapon == "briefcase_defuse_silent_mp" || weapon == "briefcase_bomb_mp_nuke";
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5800
// Size: 0x2d2
function dropweaponfordeath(attacker, smeansofdeath, weaponoverride, damage) {
    if (isdefined(level.blockweapondrops)) {
        return;
    }
    if (isdefined(self.droppeddeathweapon)) {
        return;
    }
    if (isdefined(attacker) && attacker == self || smeansofdeath == "MOD_SUICIDE") {
        return;
    }
    objweapon = self.lastdroppableweaponobj;
    if (isdefined(weaponoverride)) {
        objweapon = weaponoverride;
    }
    if (!isdefined(objweapon)) {
        /#
            if (getdvar(@"hash_c957077792ded7fd") == "mobile_debug_give_killstreak") {
                println("precision_airstrike");
            }
        #/
        return;
    }
    if (objweapon.basename == "none") {
        /#
            if (getdvar(@"hash_c957077792ded7fd") == "mobile_debug_give_killstreak") {
                println("equip_thermite");
            }
        #/
        return;
    }
    if (!self hasweapon(objweapon)) {
        /#
            if (getdvar(@"hash_c957077792ded7fd") == "mobile_debug_give_killstreak") {
                println("end_launcher" + objweapon.basename + "sniperGlintLrg");
            }
        #/
        return;
    }
    if (isdefined(level.gamemodemaydropweapon) && !self [[ level.gamemodemaydropweapon ]](objweapon)) {
        return;
    }
    objweapon = objweapon getnoaltweapon();
    var_e44ee9f7066f4d05 = 0;
    var_e44efbf7066f749b = 0;
    stockammo = 0;
    if (!isriotshield(objweapon.basename)) {
        if (!self anyammoforweaponmodes(objweapon)) {
            return;
        }
        var_e44ee9f7066f4d05 = self getweaponammoclip(objweapon, "right");
        var_e44efbf7066f749b = self getweaponammoclip(objweapon, "left");
        if (!var_e44ee9f7066f4d05 && !var_e44efbf7066f749b) {
            return;
        }
        stockammo = self getweaponammostock(objweapon);
        stockmax = weaponmaxammo(objweapon);
        if (stockammo > stockmax) {
            stockammo = stockmax;
        }
        item = self dropitem(objweapon);
        if (!isdefined(item)) {
            return;
        }
        if (istrue(level.clearstockondrop)) {
            stockammo = 0;
        }
        item itemweaponsetammo(var_e44ee9f7066f4d05, stockammo, var_e44efbf7066f749b);
        var_cf4209c200f8bbf4 = namespace_68e641469fde3fa7::getweapongroup(objweapon);
        if (smeansofdeath != "MOD_EXECUTION") {
            thread dropweaponfordeathlaunch(item, var_cf4209c200f8bbf4, damage, self.angles);
        }
    } else {
        item = self dropitem(objweapon);
        if (!isdefined(item)) {
            return;
        }
        item itemweaponsetammo(1, 1, 0);
    }
    item sethintdisplayrange(96);
    item setuserange(96);
    self.droppeddeathweapon = 1;
    item.owner = self;
    item.targetname = "dropped_weapon";
    item.objweapon = objweapon;
    item thread watchpickup(self);
    item thread deletepickupafterawhile();
    item thread function_ea90a9bb06631b2b(self);
    item thread function_aeabbb3b58e1d822(self);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ad9
// Size: 0x75
function function_ea90a9bb06631b2b(player) {
    if (!isdefined(player)) {
        return;
    }
    if (!namespace_cd0b2d039510b38d::isteamreviveenabled()) {
        return;
    }
    self endon("death");
    player endon("disconnect");
    wait(2);
    distsq = distance2dsquared(player.origin, self.origin);
    var_be2072900a2685da = level.var_34777cc7c85edbe6;
    if (distsq < var_be2072900a2685da * var_be2072900a2685da) {
        function_3c4a286cb4cf549e(self);
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b55
// Size: 0x24e
function forcedropweapon(weaponoverride) {
    if (isdefined(level.blockweapondrops)) {
        return 0;
    }
    if (isdefined(self.droppeddeathweapon)) {
        return 0;
    }
    objweapon = self.lastdroppableweaponobj;
    if (isdefined(weaponoverride)) {
        objweapon = weaponoverride;
    }
    if (!isdefined(objweapon)) {
        /#
            if (getdvar(@"hash_c957077792ded7fd") == "mobile_debug_give_killstreak") {
                println("precision_airstrike");
            }
        #/
        return 0;
    }
    if (objweapon.basename == "none") {
        /#
            if (getdvar(@"hash_c957077792ded7fd") == "mobile_debug_give_killstreak") {
                println("equip_thermite");
            }
        #/
        return 0;
    }
    if (!self hasweapon(objweapon)) {
        /#
            if (getdvar(@"hash_c957077792ded7fd") == "mobile_debug_give_killstreak") {
                println("end_launcher" + objweapon.basename + "sniperGlintLrg");
            }
        #/
        return -1;
    }
    if (isdefined(level.gamemodemaydropweapon) && !self [[ level.gamemodemaydropweapon ]](objweapon)) {
        return 0;
    }
    objweapon = objweapon getnoaltweapon();
    var_e44ee9f7066f4d05 = 0;
    var_e44efbf7066f749b = 0;
    stockammo = 0;
    if (!isriotshield(objweapon.basename)) {
        if (!self anyammoforweaponmodes(objweapon)) {
            return 0;
        }
        var_e44ee9f7066f4d05 = self getweaponammoclip(objweapon, "right");
        var_e44efbf7066f749b = self getweaponammoclip(objweapon, "left");
        if (!var_e44ee9f7066f4d05 && !var_e44efbf7066f749b) {
            return 0;
        }
        stockammo = self getweaponammostock(objweapon);
        stockmax = weaponmaxammo(objweapon);
        if (stockammo > stockmax) {
            stockammo = stockmax;
        }
        item = self dropitem(objweapon);
        if (!isdefined(item)) {
            return 0;
        }
        if (istrue(level.clearstockondrop)) {
            stockammo = 0;
        }
        item itemweaponsetammo(var_e44ee9f7066f4d05, stockammo, var_e44efbf7066f749b);
    } else {
        item = self dropitem(objweapon);
        if (!isdefined(item)) {
            return 0;
        }
        item itemweaponsetammo(1, 1, 0);
    }
    item sethintdisplayrange(96);
    item setuserange(96);
    item.owner = self;
    item.targetname = "dropped_weapon";
    item.objweapon = objweapon;
    item thread watchpickup(self);
    item thread deletepickupafterawhile();
    return 1;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5dab
// Size: 0xbb
function detachifattached(model, var_a666a0c4297f3f54) {
    attachsize = self getattachsize();
    for (i = 0; i < attachsize; i++) {
        attach = self getattachmodelname(i);
        if (attach != model) {
            continue;
        }
        tag = self getattachtagname(i);
        self detach(model, tag);
        if (tag != var_a666a0c4297f3f54) {
            attachsize = self getattachsize();
            for (i = 0; i < attachsize; i++) {
                tag = self getattachtagname(i);
                if (tag != var_a666a0c4297f3f54) {
                    continue;
                }
                model = self getattachmodelname(i);
                self detach(model, tag);
                break;
            }
        }
        return 1;
    }
    return 0;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e6e
// Size: 0x15
function deletepickupafterawhile() {
    self endon("death");
    wait(60);
    function_3c4a286cb4cf549e(self);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e8a
// Size: 0x2a
function function_aeabbb3b58e1d822(player) {
    self endon("death");
    player endon("death_or_disconnect");
    player waittill("trigger_removed");
    function_3c4a286cb4cf549e(self);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ebb
// Size: 0x21
function function_3c4a286cb4cf549e(pickup) {
    if (!isdefined(pickup)) {
        return;
    }
    pickup notify("weapon_pickup_cancelled");
    pickup delete();
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ee3
// Size: 0x43
function getitemweaponname() {
    classname = self.classname;
    /#
        assert(getsubstr(classname, 0, 7) == "weapon_");
    #/
    weapname = getsubstr(classname, 7);
    return weapname;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f2e
// Size: 0x5d2
function watchpickup(droppingplayer) {
    self endon("weapon_pickup_cancelled");
    var_3f6103d9666b07cc = self.owner;
    weaponobj = self.objweapon;
    level.onweapondropcreated callback_trigger(self, droppingplayer, weaponobj);
    weapname = getitemweaponname();
    while (1) {
        droppeditem = player = self waittill("trigger");
        previousweapon = undefined;
        var_70582da4ff904336 = isdefined(level.cyberemp) && isdefined(level.cyberemp.carrier) && level.cyberemp.carrier == player;
        var_280079773a9459a5 = getgametype() == "cyber" && (isdefined(droppeditem) || var_70582da4ff904336) && istrue(level.allowEMPWeapon);
        if (var_280079773a9459a5) {
            weapons = player namespace_df5cfdbe6e2d3812::getcurrentprimaryweaponsminusalt();
            if (weapons.size > 2) {
                var_66c1bf2eadf04d65 = 0;
                var_4819a5499215519 = 0;
                var_fc41e0bc6c702a3a = 0;
                var_964b30d2f3cdedc4 = 0;
                var_5b70a9307f104360 = 0;
                foreach (weapon in weapons) {
                    if (weapon.basename == "iw9_cyberemp_mp") {
                        var_66c1bf2eadf04d65 = 1;
                    }
                    if (ismeleeoverrideweapon(weapon)) {
                        var_4819a5499215519 = 1;
                    }
                    if (function_d3c77884d93d850(weapon)) {
                        var_fc41e0bc6c702a3a = 1;
                    }
                    if (function_3f15e5e526ff94ce(weapon)) {
                        var_964b30d2f3cdedc4 = 1;
                    }
                    if (weapon.basename == "iw8_lm_dblmg_mp") {
                        var_5b70a9307f104360 = 1;
                    }
                }
                if (isdefined(player.primaryweapon) && player.primaryweapon != "iw9_cyberemp_mp") {
                    previousweapon = player.primaryweaponobj;
                } else if (isdefined(player.secondaryweapon) && player.secondaryweapon != "iw9_cyberemp_mp") {
                    previousweapon = player.secondaryweaponobj;
                }
                weaponcount = weapons.size;
                if (var_4819a5499215519) {
                    weaponcount--;
                }
                if (var_5b70a9307f104360) {
                    weaponcount--;
                }
                if (var_fc41e0bc6c702a3a) {
                    weaponcount--;
                }
                if (var_964b30d2f3cdedc4) {
                    weaponcount--;
                }
                if (!var_66c1bf2eadf04d65 || weaponcount > 3) {
                    var_ae8c4b58168da1a2 = undefined;
                    if (previousweapon.basename != "none") {
                        var_ae8c4b58168da1a2 = previousweapon;
                    }
                    result = player forcedropweapon(var_ae8c4b58168da1a2);
                    if (var_70582da4ff904336) {
                        player val::set("cyber_emp", "weapon_switch", 0);
                        player val::set("cyber_emp", "weapon_pickup", 0);
                        player val::set("cyber_emp", "usability", 0);
                        player thread waitthengivecyberweapon(result == 0);
                    }
                    if (result == 1) {
                        goto LOC_0000037c;
                    }
                    if (result == 0) {
                        player val::function_c9d0b43701bdba00("cyber_emp");
                        return;
                    } else if (result == -1) {
                    LOC_0000037c:
                    }
                LOC_0000037c:
                }
            LOC_0000037c:
            } else if (var_70582da4ff904336) {
                player val::set("cyber_emp", "weapon_switch", 0);
                player val::set("cyber_emp", "weapon_pickup", 0);
                player val::set("cyber_emp", "usability", 0);
                player thread waitthengivecyberweapon();
            } else if (isdefined(droppeditem)) {
                previousweapon = player.lastdroppableweaponobj;
            } else {
                previousweapon = player getcurrentweapon();
            }
        } else if (isdefined(droppeditem)) {
            previousweapon = player.lastdroppableweaponobj;
        } else {
            previousweapon = player getcurrentweapon();
        }
        var_fee12400d8814b47 = player _hasperk("specialty_scrap_weapons") && getdvarint(@"hash_eb1e94069d5150f2") == 1;
        player thread watchpickupcomplete(weaponobj, previousweapon, var_fee12400d8814b47);
        level.onweapondroppickedup callback_trigger(self, player, weaponobj);
        player notify("weapon_pickup", weaponobj);
        if (isdefined(droppeditem)) {
            player.lastweaponpickuptime = gettime();
            player namespace_3c5a4254f2b957ea::incpersstat("weaponPickups", 1);
        }
        dirty = namespace_e0ee43ef2dddadaa::fixupplayerweapons(player, weapname);
        if (dirty) {
            if (weaponobj.basename == player.primaryweaponobj.basename) {
                player namespace_6b49ddb858f34366::function_adcb155953291ec7(1, 0);
            } else if (weaponobj.basename == player.secondaryweaponobj.basename) {
                player namespace_6b49ddb858f34366::function_adcb155953291ec7(0, 0);
            }
        }
        if (isdefined(droppeditem) && var_fee12400d8814b47) {
            droppeditem delete();
        }
    }
LOC_00000520:
    /#
        assert(isdefined(player.tookweaponfrom));
    #/
    if (isdefined(droppeditem)) {
        var_66da0a5f69e8dd56 = droppeditem getitemweaponname();
        objweapon = makeweaponfromstring(var_66da0a5f69e8dd56);
        if (isdefined(player.tookweaponfrom[var_66da0a5f69e8dd56])) {
            droppeditem.owner = player.tookweaponfrom[var_66da0a5f69e8dd56];
            player.tookweaponfrom[var_66da0a5f69e8dd56] = undefined;
        } else {
            droppeditem.owner = player;
        }
        droppeditem.objweapon = objweapon;
        droppeditem.targetname = "dropped_weapon";
        droppeditem thread watchpickup(player);
    }
    player.tookweaponfrom[weapname] = var_3f6103d9666b07cc;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6507
// Size: 0x77
function waitthengivecyberweapon(var_8a5abcce61604b23) {
    self endon("death_or_disconnect");
    self notify("cancelGiveEmp");
    self endon("cancelGiveEmp");
    while (isdefined(self.currentweapon.basename) && self.currentweapon.basename == "none") {
        waitframe();
    }
    _giveweapon("iw9_cyberemp_mp");
    if (!istrue(var_8a5abcce61604b23)) {
        val::function_c9d0b43701bdba00("cyber_emp");
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6585
// Size: 0xdb
function watchpickupcomplete(var_f42f309550e65575, previousweapon, var_fee12400d8814b47) {
    self endon("death_or_disconnect");
    self notify("watchPickupComplete()");
    self endon("watchPickupComplete()");
    startingweapon = self.currentweapon;
    success = 0;
    if (startingweapon == var_f42f309550e65575) {
        success = 1;
    } else {
        while (1) {
            waitframe();
            currentweapon = self.currentweapon;
            if (issameweapon(startingweapon, currentweapon, 0)) {
                continue;
            }
            if (issameweapon(var_f42f309550e65575, currentweapon, 0)) {
                success = 1;
            } else {
                success = 0;
            }
            break;
        }
    }
    if (success) {
        if (isminigunweapon(var_f42f309550e65575)) {
            namespace_2e44b3b70cdb0992::juggernautweaponpickedup(var_f42f309550e65575, previousweapon);
        }
        thread notifyuiofpickedupweapon();
        if (isdefined(level.onweapontaken)) {
            [[ level.onweapontaken ]](var_f42f309550e65575);
        }
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6667
// Size: 0x15
function getrandomgraverobberattachment(currentweapon, var_79583f5b5010a954) {
    return undefined;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6684
// Size: 0x2b0
function addattachmenttoweapon(newweapon, var_effb4ae1788a8b10) {
    variantid = getweaponvariantindex(newweapon);
    newweapon = newweapon getnoaltweapon();
    var_91bbf8d2294a656e = newweapon.attachmentvarindices;
    attachments = [];
    foreach (attachment, id in var_91bbf8d2294a656e) {
        attachments[attachments.size] = attachment;
    }
    failed = 0;
    if (array_contains(attachments, var_effb4ae1788a8b10)) {
        failed = 1;
    } else if (!newweapon canuseattachment(var_effb4ae1788a8b10)) {
        failed = 1;
    }
    if (failed) {
        return undefined;
    }
    attachments = namespace_e0ee43ef2dddadaa::weaponattachremoveextraattachments(attachments);
    var_7809ad191e44fe6a = [];
    foreach (idx, attachment in attachments) {
        var_7809ad191e44fe6a[idx] = var_91bbf8d2294a656e[attachment];
    }
    attachments[attachments.size] = var_effb4ae1788a8b10;
    var_7809ad191e44fe6a[var_7809ad191e44fe6a.size] = 0;
    camo = newweapon.camo;
    stickers = [];
    if (isdefined(newweapon.stickerslot0)) {
        stickers[stickers.size] = newweapon.stickerslot0;
    }
    if (isdefined(newweapon.stickerslot1)) {
        stickers[stickers.size] = newweapon.stickerslot1;
    }
    if (isdefined(newweapon.stickerslot2)) {
        stickers[stickers.size] = newweapon.stickerslot2;
    }
    if (isdefined(newweapon.stickerslot3)) {
        stickers[stickers.size] = newweapon.stickerslot3;
    }
    if (isdefined(newweapon.var_b39ac546cc8621f8)) {
        stickers[stickers.size] = newweapon.var_b39ac546cc8621f8;
    }
    var_11a1fa68aeb971c0 = namespace_36f464722d326bbe::function_d2d2b803a7b741a4();
    var_c1f45bf103f82583 = function_4add228b999c26aa(newweapon, var_effb4ae1788a8b10);
    foreach (idx, a in attachments) {
        var_e571ecdd21ddcee6 = function_4add228b999c26aa(newweapon, attachments[idx]);
        if (var_c1f45bf103f82583 == var_e571ecdd21ddcee6 && var_c1f45bf103f82583 != "other") {
            attachments[idx] = var_effb4ae1788a8b10;
        }
    }
    newweapon = namespace_e0ee43ef2dddadaa::buildweapon(getweaponrootname(newweapon), attachments, camo, "none", variantid, var_7809ad191e44fe6a, undefined, stickers, var_11a1fa68aeb971c0);
    return newweapon;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x693c
// Size: 0xd4
function function_71dc088dc384ef8d(weaponname, var_c8616c37bc30098b, var_a4d5e0f6b90df7eb) {
    var_72672cd81ec1093d = weaponname;
    var_66b3db972ac1531e = undefined;
    if (!isweapon(weaponname)) {
        var_72672cd81ec1093d = makeweapon(weaponname);
    }
    attachments = function_8df87e6b1d13c15a(var_72672cd81ec1093d, var_c8616c37bc30098b, var_a4d5e0f6b90df7eb);
    foreach (attachment in attachments) {
        var_66b3db972ac1531e = addattachmenttoweapon(var_72672cd81ec1093d, attachment);
        if (isdefined(var_66b3db972ac1531e)) {
            var_72672cd81ec1093d = var_66b3db972ac1531e;
        }
        /#
            if (!isdefined(var_66b3db972ac1531e)) {
                iprintlnbold("sniperGlint_remove() called on player with no glint setting." + weaponname + "dropped_weapon" + attachment);
            }
        #/
    }
    return var_72672cd81ec1093d;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a18
// Size: 0x24f
function function_8df87e6b1d13c15a(weaponobj, var_c8616c37bc30098b, var_a4d5e0f6b90df7eb, var_2ba199c424905fb6, minpriority) {
    var_d7cb31ea2a8b6e87 = [];
    var_738063f99716d177 = weapon::function_c471a035d22df5eb();
    var_738063f99716d177 = utility::array_randomize(var_738063f99716d177);
    if (isdefined(var_2ba199c424905fb6)) {
        foreach (slot in var_2ba199c424905fb6) {
            if (array_contains(var_738063f99716d177, slot)) {
                var_738063f99716d177 = array_remove(var_738063f99716d177, slot);
            }
        }
    }
    foreach (var_bf0cc21ade72123c in var_738063f99716d177) {
        if (istrue(var_a4d5e0f6b90df7eb) && var_bf0cc21ade72123c == "scope") {
            continue;
        }
        var_39acc07a4f70f5ca = function_75b035199842693d(weaponobj, var_bf0cc21ade72123c);
        if (var_39acc07a4f70f5ca.size > 0 && var_d7cb31ea2a8b6e87.size < var_c8616c37bc30098b) {
            if (isdefined(minpriority)) {
                var_e4d2b96bef75b948 = getcompleteweaponname(weaponobj);
                var_6121d10df35555a6 = [];
                foreach (attachment in var_39acc07a4f70f5ca) {
                    var_f875c9e7727e3228 = function_1dd1f56bc3d72b7e(var_e4d2b96bef75b948, attachment);
                    if (var_f875c9e7727e3228 < minpriority) {
                        continue;
                    }
                    var_6121d10df35555a6[var_6121d10df35555a6.size] = attachment;
                }
                var_39acc07a4f70f5ca = var_6121d10df35555a6;
            }
            if (var_39acc07a4f70f5ca.size > 0) {
                var_109ebf347b2f2ece = randomint(var_39acc07a4f70f5ca.size);
                var_d7cb31ea2a8b6e87 = utility::array_add(var_d7cb31ea2a8b6e87, var_39acc07a4f70f5ca[var_109ebf347b2f2ece]);
            }
        }
        if (var_d7cb31ea2a8b6e87.size >= var_c8616c37bc30098b) {
            break;
        }
    }
    if (istrue(var_a4d5e0f6b90df7eb)) {
        var_cbdd60dfee68493d = function_75b035199842693d(weaponobj, "scope");
        if (var_cbdd60dfee68493d.size > 0) {
            var_109ebf347b2f2ece = randomint(var_cbdd60dfee68493d.size);
            var_d7cb31ea2a8b6e87 = utility::array_add(var_d7cb31ea2a8b6e87, var_cbdd60dfee68493d[var_109ebf347b2f2ece]);
            if (var_d7cb31ea2a8b6e87.size > var_c8616c37bc30098b) {
                var_d7cb31ea2a8b6e87 = utility::array_remove_index(var_d7cb31ea2a8b6e87, 0);
            }
        }
    }
    return var_d7cb31ea2a8b6e87;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c6f
// Size: 0x18d
function getammooverride(weaponobj, var_d5afa107bac810b7) {
    if (!isdefined(var_d5afa107bac810b7)) {
        var_d5afa107bac810b7 = 0;
    }
    if (var_d5afa107bac810b7) {
        return weaponclipsize(weaponobj);
    }
    baseweapon = weaponobj getbaseweapon();
    var_a7cf832e6613fc43 = weaponclipsize(baseweapon);
    var_2be3302e3767cc7d = weaponclipsize(weaponobj);
    clipsize = var_a7cf832e6613fc43;
    if (function_f30a6d3194f97c09(weaponobj, "specialty_smags")) {
        clipsize = int(max(var_a7cf832e6613fc43, var_2be3302e3767cc7d));
    }
    rootname = weapon::getweaponrootname(weaponobj);
    var_6c79b6b69a253e2b = 30;
    if (weaponobj.isalternate) {
        goto LOC_0000018a;
    }
    switch (weaponobj.classname) {
    case #"hash_690c0d6a821b42e":
        switch (rootname) {
        case #"hash_30551216cbfc3a26":
            var_6c79b6b69a253e2b = 6;
            break;
        case #"hash_68a11d587d71608f":
            var_6c79b6b69a253e2b = 8;
            break;
        default:
            var_6c79b6b69a253e2b = int(min(clipsize, 30));
            break;
        }
        break;
    case #"hash_6191aaef9f922f96":
        switch (rootname) {
        case #"hash_8d9ae5e5dd390b4b":
            var_6c79b6b69a253e2b = 3;
            break;
        default:
            var_6c79b6b69a253e2b = int(min(clipsize, 30));
            break;
        }
        break;
    default:
        var_6c79b6b69a253e2b = int(min(clipsize, 30));
        break;
    }
LOC_0000018a:
    return var_6c79b6b69a253e2b;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6e04
// Size: 0x86
function isgraverobberattachment(weapon, var_55f8624e7216d9aa) {
    if (!weapon::attachmentisselectable(weapon, var_55f8624e7216d9aa)) {
        return 0;
    }
    switch (var_55f8624e7216d9aa) {
    case #"hash_46abc44d4b683c0c":
    case #"hash_ae7694515b4b215c":
    case #"hash_cace574b66d79951":
        return 0;
        break;
    }
    if (issubstr(var_55f8624e7216d9aa, "thermal")) {
        return 0;
    }
    if (issubstr(var_55f8624e7216d9aa, "burst")) {
        return 0;
    }
    if (getsubstr(var_55f8624e7216d9aa, 0, 3) == "cal") {
        return 0;
    }
    return 1;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e92
// Size: 0x3
function notifyuiofpickedupweapon() {
    
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6e9c
// Size: 0x5c
function itemremoveammofromaltmodes() {
    var_b2cac67dce789126 = getitemweaponname();
    var_f3a75b200cedf31f = weaponaltweaponname(var_b2cac67dce789126);
    for (altindex = 1; var_f3a75b200cedf31f != "none" && var_f3a75b200cedf31f != var_b2cac67dce789126; altindex++) {
        self itemweaponsetammo(0, 0, 0, altindex);
        var_f3a75b200cedf31f = weaponaltweaponname(var_f3a75b200cedf31f);
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6eff
// Size: 0x58
function function_7e895e1c85354e17(attacker, meansofdeath) {
    self endon("spawned_player");
    level endon("game_ended");
    if (!function_8380039e393ec43a(attacker, meansofdeath)) {
        return;
    }
    if (isdefined(meansofdeath) && meansofdeath == "MOD_EXECUTION") {
        wait(1.5);
        if (!function_8380039e393ec43a(attacker, meansofdeath)) {
            return;
        }
    }
    function_1e5278055e7032ee(attacker);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f5e
// Size: 0x30
function function_8380039e393ec43a(attacker, meansofdeath) {
    if (!isdefined(attacker)) {
        return 0;
    }
    if (attacker == self) {
        return 0;
    }
    if (!isplayer(attacker)) {
        return 0;
    }
    return 1;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f96
// Size: 0xc5
function function_1e5278055e7032ee(attacker) {
    if (!isdefined(self)) {
        return;
    }
    droparmor = self dropscavengerbag("armor_mp", "j_head");
    if (!isdefined(droparmor)) {
        return;
    }
    droparmor namespace_cd074ac917dcd87a::registerspawn(2, &function_a642b6997daab69a);
    droparmor function_dfb78b3e724ad620(0);
    droparmor showonlytoplayer(attacker);
    droparmor.owner = attacker;
    droparmor.team = attacker.team;
    droparmor.count = 1;
    droparmor thread function_40c995b337d540b5();
    droparmor thread function_cb9c3a8ed8dae404();
    droparmor thread function_6b7147d3c072f4bd();
    droparmor thread function_8dd67f32058884cf();
    outlineid = outline::outlineenableforplayer(droparmor, attacker, "shimmer_default", "level_script");
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7062
// Size: 0x1d
function function_b7a869197c8b89e8(player) {
    self.var_59111d316d2ebee5 notify("scavenger", player);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7086
// Size: 0xdf
function function_40c995b337d540b5() {
    self endon("armorRemoved");
    level endon("game_ended");
    player = undefined;
    while (1) {
        player = self waittill("scavenger_armor");
        /#
            assert(isdefined(player));
        #/
        if (player == self.owner && !player namespace_e47104b48662385b::isinvehicle()) {
            break;
        }
    }
    player = self.owner;
    player notify("armor_pickup");
    result = player function_2be53701abcf1e63(self);
    if (!isdefined(player.pers["armorPickedUp"])) {
        player.pers["armorPickedUp"] = 0;
    }
    player stats::incpersstat("armorPickedUp", 1);
    if (isdefined(self.useobj)) {
        self.useobj delete();
    }
    self notify("death");
    self notify("armorRemoved");
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x716c
// Size: 0x12e
function function_2be53701abcf1e63(armor) {
    if (br_pickups::pickupissameasequipmentslot("equip_armorplate", "health")) {
        if (perk::_hasperk("specialty_fast_armor") && isdefined(self.armorhealth) && isdefined(self.var_8790c077c95db752) && self.armorhealth < self.var_8790c077c95db752) {
            result = namespace_30a6d7a07831c1e2::function_c5d5909e07c87005(armor);
            if (result == 1) {
                return 1;
            }
        }
        if (function_934801be51b4393f()) {
            var_5324597edfaff57c = equipment::getequipmentslotammo("health");
            var_b5cdf4d935e6ac13 = equipment::getequipmentmaxammo("equip_armorplate");
            var_97c23a1323acc7df = var_b5cdf4d935e6ac13 - var_5324597edfaff57c;
            equipment::incrementequipmentslotammo("health", 1);
            return 1;
        } else {
            return 0;
        }
    } else {
        if (!isdefined(self.equipment["health"]) || equipment::getequipmentslotammo("health") == 0) {
            var_b5cdf4d935e6ac13 = equipment::getequipmentmaxammo("equip_armorplate");
            equipment::giveequipment("equip_armorplate", "health");
            equipment::setequipmentammo("equip_armorplate", 1);
            return 1;
        }
        return 0;
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72a1
// Size: 0x26
function function_a642b6997daab69a() {
    if (isdefined(self.useobj)) {
        self.useobj delete();
    }
    self delete();
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72ce
// Size: 0x51
function function_cb9c3a8ed8dae404() {
    self endon("death");
    level endon("game_ended");
    utility::waittill_any_2("armorRemoved", "armor_timeout");
    if (isdefined(self)) {
        if (isdefined(self.useobj)) {
            self.useobj delete();
        }
        namespace_cd074ac917dcd87a::deregisterspawn();
        self delete();
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7326
// Size: 0x30
function function_6b7147d3c072f4bd() {
    self endon("death");
    self.owner endon("disconnect");
    level endon("game_ended");
    wait(30);
    if (isdefined(self)) {
        self notify("armor_timeout");
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x735d
// Size: 0x22
function function_8dd67f32058884cf() {
    self endon("armorRemoved");
    level endon("game_ended");
    self waittill("death");
    waittillframeend();
    self notify("armorRemoved");
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7386
// Size: 0x21
function function_934801be51b4393f() {
    if (equipment::getequipmentslotammo("health") < equipment::getequipmentmaxammo("equip_armorplate")) {
        return 1;
    }
    return 0;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73af
// Size: 0x115
function onscavengerbagpickup(player) {
    if (isdefined(level.onscavengerbagpickup)) {
        [[ level.onscavengerbagpickup ]](player);
    } else {
        var_9d8419379ac383f1 = self.owner perk::_hasperk("specialty_intel_jacker");
        var_943425e20021c5e1 = self.owner perk::_hasperk("specialty_scavenger_plus");
        if (var_943425e20021c5e1) {
            scavengergiveammo(player);
            player equipment::function_312cbcf07904565d();
        }
        if (var_9d8419379ac383f1) {
            player function_722431104048241d(player.origin);
            if (isdefined(player.var_78ede70519cfb53b)) {
                foreach (ally in player.var_78ede70519cfb53b) {
                    ally function_722431104048241d(player.origin);
                }
            }
        }
        if (function_44e99168f6830136(player)) {
            player equipment::givescavengerammo();
        }
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x74cb
// Size: 0x39
function private function_44e99168f6830136(player) {
    var_9dffd6323feab1e8 = 0;
    var_7e245bdd13045367 = player perk::_hasperk("specialty_scavenger_equipment");
    if (istrue(var_7e245bdd13045367)) {
        var_9dffd6323feab1e8 = 1;
    }
    return var_9dffd6323feab1e8;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x750c
// Size: 0xc8
function handlescavengerbagpickup(var_2a1c444def60a416) {
    self endon("scavengerBagRemoved");
    level endon("game_ended");
    /#
        assert(isdefined(var_2a1c444def60a416));
    #/
    player = undefined;
    while (1) {
        player = self waittill("scavenger");
        /#
            assert(isdefined(player));
        #/
        if (!player namespace_e47104b48662385b::isinvehicle()) {
            break;
        }
    }
    player notify("scavenger_pickup");
    onscavengerbagpickup(player);
    player stats::initpersstat("scavengerPickedUp");
    player stats::incpersstat("scavengerPickedUp", 1);
    player perks::activatePerk("specialty_scavenger_plus");
    challenges::function_8a0395089290faf6(player);
    if (isdefined(self.useobj)) {
        self.useobj delete();
    }
    self notify("death");
    self notify("scavengerBagRemoved");
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75db
// Size: 0x22
function function_208e1193f12b970a() {
    self endon("scavengerBagRemoved");
    level endon("game_ended");
    self waittill("death");
    waittillframeend();
    self notify("scavengerBagRemoved");
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7604
// Size: 0x17
function function_722431104048241d(location) {
    triggerportableradarping(location, self, 1300);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7622
// Size: 0x6d
function scavengergiveammo(player) {
    primaryweapons = player getweaponslistprimaries();
    foreach (primary in primaryweapons) {
        addscavengercliptoweapon(player, primary, 1);
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7696
// Size: 0xbc
function addscavengercliptoweapon(player, weapon, var_b153a3f2c4662b5e) {
    if (!weapon::iscacprimaryweapon(weapon) && !level.scavenger_secondary) {
        return;
    }
    if (weapon.isalternate) {
        return;
    }
    if (weapon::getweapongroup(weapon) == "weapon_projectile") {
        return;
    }
    if (weapon.basename == "iw9_pi_stimpistol_mp") {
        return;
    }
    var_9938d9499df221d6 = player getweaponammostock(weapon);
    var_410e327689185850 = getammooverride(weapon);
    var_410e327689185850 = int(ceil(var_b153a3f2c4662b5e * var_410e327689185850));
    if (weapon.isdualwield) {
        var_410e327689185850 = var_410e327689185850 * 1;
    }
    player setweaponammostock(weapon, var_9938d9499df221d6 + var_410e327689185850);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7759
// Size: 0x26
function scavenger_budget_delete() {
    if (isdefined(self.useobj)) {
        self.useobj delete();
    }
    self delete();
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7786
// Size: 0x8c
function dropscavengerfordeath(attacker, meansofdeath) {
    self endon("spawned_player");
    level endon("game_ended");
    if (!shoulddropscavengerbag(attacker, meansofdeath)) {
        return;
    }
    delay = 0;
    if (isdefined(meansofdeath) && meansofdeath == "MOD_EXECUTION") {
        delay = 1.5;
    }
    wait(delay);
    if (delay > 0 && !shoulddropscavengerbag(attacker, meansofdeath)) {
        return;
    }
    if (isdefined(level.var_d1df695cab85185c)) {
        self [[ level.var_d1df695cab85185c ]](attacker);
    } else {
        dropscavengerfordeathinternal(attacker);
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7819
// Size: 0xcf
function dropscavengerfordeathinternal(attacker) {
    if (!isdefined(self)) {
        return;
    }
    dropbag = self dropscavengerbag("scavenger_bag_mp", "j_head");
    if (!isdefined(dropbag)) {
        return;
    }
    dropbag namespace_cd074ac917dcd87a::registerspawn(2, &scavenger_budget_delete);
    dropbag function_dfb78b3e724ad620(0);
    dropbag.owner = attacker;
    dropbag.team = attacker.team;
    dropbag thread handlescavengerbagpickup(self);
    dropbag thread scavengerbagcleanupthink();
    dropbag thread scavengerbagtimeoutthink();
    dropbag thread function_208e1193f12b970a();
    function_653e9f15896017ed(self);
    if (isdefined(level.bot_funcs) && isdefined(level.bot_funcs["bots_add_scavenger_bag"])) {
        [[ level.bot_funcs["bots_add_scavenger_bag"] ]](dropbag);
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78ef
// Size: 0x25
function shoulddropscavengerbag(attacker, meansofdeath) {
    if (!isdefined(attacker)) {
        return 0;
    }
    if (attacker == self) {
        return 0;
    }
    return 1;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x791c
// Size: 0x5f
function scavengerbagcleanupthink() {
    self endon("death");
    level endon("game_ended");
    self.owner utility::waittill_any_3("death_or_disconnect", "joined_team", "bag_timeout");
    if (isdefined(self)) {
        if (isdefined(self.useobj)) {
            self.useobj delete();
        }
        namespace_cd074ac917dcd87a::deregisterspawn();
        self delete();
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7982
// Size: 0x38
function scavengerbagtimeoutthink() {
    self endon("death");
    self.owner endon("disconnect");
    level endon("game_ended");
    wait(20);
    if (isdefined(self)) {
        self.owner notify("bag_timeout");
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x79c1
// Size: 0x17e
function scavengerbagusesetup() {
    self endon("death");
    self.owner endon("disconnect");
    level endon("game_ended");
    hintstring = "PERKS/HOLD_TO_SCAVENGE";
    self.useobj = gameobjects::createhintobject(self.origin + anglestoup(self.angles) * 1, "HINT_BUTTON", undefined, hintstring, undefined, undefined, "show", 200, 160, 100, 160);
    self.useobj.owner = self.owner;
    self.useobj.team = self.team;
    self.useobj linkto(self);
    foreach (player in level.players) {
        self.useobj disableplayeruse(player);
    }
    thread scavengebagthink();
    thread scavengebagusemonitoring();
    for (;;) {
        player = self waittill("pickedUpScavengerBag");
        if (isplayer(player)) {
            player notify("scavenger_pickup");
            onscavengerbagpickup(player);
            player perks::activatePerk("specialty_scavenger_plus");
            if (isdefined(self.useobj)) {
                self.useobj delete();
            }
            self notify("death");
        }
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b46
// Size: 0xdd
function scavengebagusemonitoring() {
    self endon("death");
    self.owner endon("disconnect");
    level endon("game_ended");
    var_e82152475c1ca370 = 1;
    while (var_e82152475c1ca370) {
        wait(0.1);
        foreach (player in level.players) {
            if (!isdefined(self)) {
                var_e82152475c1ca370 = 0;
            } else if (player.team != self.team || player perk::_hasperk("specialty_scavenger")) {
                self.useobj disableplayeruse(player);
            } else {
                self.useobj enableplayeruse(player);
            }
        }
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c2a
// Size: 0xc1
function scavengebagthink() {
    self endon("restarting_physics");
    usetrigger = self.useobj;
    useent = undefined;
    if (istrue(level.gameended) && !isdefined(usetrigger)) {
        return;
    }
    while (isdefined(self)) {
        player = usetrigger waittill("trigger");
        player.iscapturingcrate = 1;
        useent = createuseent();
        useent.id = "use";
        result = useent useholdthink(player, getdvarfloat(@"hash_e9cbdb751424e4ab"));
        if (!isdefined(player)) {
            return;
        }
        player.iscapturingcrate = 0;
        if (result) {
            self notify("pickedUpScavengerBag", player);
        }
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7cf2
// Size: 0x4d
function function_653e9f15896017ed(victim) {
    if (!getmatchrulesdata("brData", "scavengerGiveArmor")) {
        return;
    }
    if (isdefined(victim)) {
        var_cb4fad49263e20c4 = br_pickups::getitemdropinfo(victim.origin);
        br_pickups::spawnpickup("brloot_armor_plate", var_cb4fad49263e20c4);
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d46
// Size: 0xa9
function useholdthink(player, usetime) {
    self.curprogress = 0;
    self.inuse = 1;
    self.userate = 0;
    self.usetime = usetime;
    movers::script_mover_link_to_use_object(player);
    player val::set("useHold", "weapon", 0);
    result = useholdthinkloop(player);
    if (isalive(player)) {
        player val::function_c9d0b43701bdba00("useHold");
    }
    if (isdefined(player)) {
        movers::script_mover_unlink_from_use_object(player);
    }
    if (!isdefined(self)) {
        return 0;
    }
    self.inuse = 0;
    self.curprogress = 0;
    return result;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7df7
// Size: 0x2f
function useholdthinkloop(player) {
    result = internal_useholdthinkloop(player);
    if (isdefined(self)) {
        player gameobjects::updateuiprogress(self, 0);
    }
    return istrue(result);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e2e
// Size: 0xaf
function internal_useholdthinkloop(player) {
    self endon("endUseHoldThink");
    while (player isplayerusing(self)) {
        if (!player movers::script_mover_use_can_link(self)) {
            return 0;
        }
        self.curprogress = self.curprogress + level.framedurationseconds * self.userate;
        if (isdefined(self.objectivescaler)) {
            self.userate = 1 * self.objectivescaler;
        } else {
            self.userate = 1;
        }
        player gameobjects::updateuiprogress(self, 1);
        if (self.curprogress >= self.usetime) {
            return player::isreallyalive(player);
        }
        waitframe();
    }
    return 0;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ee5
// Size: 0x7f
function createuseent() {
    useent = spawn("script_origin", self.origin);
    useent.curprogress = 0;
    useent.usetime = 0;
    useent.userate = 3000;
    useent.inuse = 0;
    useent.id = self.id;
    useent linkto(self);
    useent thread deleteuseent(self);
    return useent;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f6c
// Size: 0x94
function deleteuseent(owner) {
    self endon("death");
    owner waittill("death");
    if (isdefined(self.usedby)) {
        foreach (player in self.usedby) {
            player setclientomnvar("ui_securing", 0);
            player.ui_securing = undefined;
        }
    }
    self delete();
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8007
// Size: 0x7c
function isplayerusing(weapon) {
    return !level.gameended && isdefined(weapon) && player::isreallyalive(self) && self usebuttonpressed() && !self isonladder() && !self meleebuttonpressed() && weapon.curprogress < weapon.usetime && (!isdefined(self.teleporting) || !self.teleporting);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x808b
// Size: 0x48
function weaponcanstoreaccuracystats(objweapon) {
    if (iscacmeleeweapon(objweapon.basename)) {
        return 0;
    }
    return iscacprimaryweapon(objweapon.basename) || iscacsecondaryweapon(objweapon.basename);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80db
// Size: 0x2f
function setweaponstat(weapon, var_a1d4e7d5ef9da660, statname, otherent) {
    namespace_d576b6dc7cef9c62::setweaponstat(weapon, var_a1d4e7d5ef9da660, statname, otherent);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8111
// Size: 0x7b
function watchweaponusage(var_e9a9dc280d811788) {
    self endon("death_or_disconnect");
    self endon("faux_spawn");
    level endon("game_ended");
    for (;;) {
        objweapon = self waittill("weapon_fired");
        if (weaponclass(objweapon) == "rocketlauncher") {
            continue;
        }
        if (weaponclass(objweapon) == "grenade") {
            jumpiffalse(issubstr(objweapon.basename, "la_mike32")) LOC_0000006e;
        } else {
        LOC_0000006e:
            onweaponfired(objweapon);
        }
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8193
// Size: 0xe5
function onweaponfired(objweapon, var_85fa2cdcb19d076c) {
    namespace_d576b6dc7cef9c62::sethasdonecombat(self, 1);
    self.lastshotfiredtime = gettime();
    namespace_b919c4be206d3c80::function_1882f80b14421089(0, 1);
    if (!istrue(self.var_d4102e2eff8e8a45)) {
        self.var_d4102e2eff8e8a45 = 1;
        namespace_3c5a4254f2b957ea::initpersstat("shotsFired");
    }
    if (isai(self)) {
        if (istrue(level.var_c1d58bf29dcae79)) {
            namespace_3c5a4254f2b957ea::incpersstat("shotsFired", 1);
        }
        var_366b0ecc2f28aead = getcompleteweaponname(objweapon);
        if (issubstr(var_366b0ecc2f28aead, "jup_jp22_la_dromeo")) {
            self setweaponammoclip(objweapon, 999);
            var_a2cfbc2c4f504a0e = getgametype() == "ob";
            if (var_a2cfbc2c4f504a0e) {
                thread function_aa3939ed0f60d04e(objweapon, var_85fa2cdcb19d076c);
            } else {
                thread function_e0780928b2591268(objweapon, var_85fa2cdcb19d076c);
            }
        }
        return;
    }
    thread function_f092173e435bb0f1(objweapon, var_85fa2cdcb19d076c);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x827f
// Size: 0x319
function function_f092173e435bb0f1(objweapon, var_85fa2cdcb19d076c) {
    self endon("disconnect");
    var_366b0ecc2f28aead = getcompleteweaponname(objweapon);
    self notify("processActiveShots_" + var_366b0ecc2f28aead);
    self endon("processActiveShots_" + var_366b0ecc2f28aead);
    if (!isdefined(self.var_f0006748b1b1efb0)) {
        self.var_f0006748b1b1efb0 = [];
    }
    if (!isdefined(self.var_f0006748b1b1efb0[var_366b0ecc2f28aead])) {
        self.var_f0006748b1b1efb0[var_366b0ecc2f28aead] = 0;
    }
    self.var_f0006748b1b1efb0[var_366b0ecc2f28aead]++;
    if (!isdefined(self.var_3fea9f1abbe349e2)) {
        self.var_3fea9f1abbe349e2 = [];
    }
    if (issubstr(var_366b0ecc2f28aead, "jup_jp22_la_dromeo")) {
        self setweaponammoclip(objweapon, 999);
        var_a2cfbc2c4f504a0e = getgametype() == "ob";
        if (var_a2cfbc2c4f504a0e) {
            thread function_aa3939ed0f60d04e(objweapon, var_85fa2cdcb19d076c);
        } else {
            thread function_e0780928b2591268(objweapon, var_85fa2cdcb19d076c);
        }
    }
    if (isdefined(var_85fa2cdcb19d076c)) {
        if (!isdefined(self.var_3fea9f1abbe349e2[var_366b0ecc2f28aead])) {
            self.var_3fea9f1abbe349e2[var_366b0ecc2f28aead] = [];
        }
        self.var_3fea9f1abbe349e2[var_366b0ecc2f28aead][self.var_3fea9f1abbe349e2[var_366b0ecc2f28aead].size] = var_85fa2cdcb19d076c;
    }
    setweaponstat(objweapon, 1, "shots");
    namespace_3c5a4254f2b957ea::incpersstat("shotsFired", 1);
    thread namespace_6b49ddb858f34366::function_298b6dd0b26f13bd();
    thread namespace_6b49ddb858f34366::function_2efd6926efd58b49(0);
    watchformiss(objweapon, var_366b0ecc2f28aead);
    totalShots = self.var_f0006748b1b1efb0[var_366b0ecc2f28aead];
    var_7eb0ccf010359357 = isdefined(self.hits[var_366b0ecc2f28aead]) ? 0 : self.hits[var_366b0ecc2f28aead];
    var_a35ea66201ac92e8 = isdefined(self.var_5ffaa0ceb1f66708[var_366b0ecc2f28aead]) ? 0 : self.var_5ffaa0ceb1f66708[var_366b0ecc2f28aead];
    var_202acce87e9d7f6 = isdefined(self.var_c63a7f2980c7d596[var_366b0ecc2f28aead]) ? 0 : self.var_c63a7f2980c7d596[var_366b0ecc2f28aead];
    var_1f4904b24e56faf5 = totalShots - var_7eb0ccf010359357;
    if (weaponcanstoreaccuracystats(objweapon)) {
        setweaponstat(objweapon, var_7eb0ccf010359357, "hits");
        setweaponstat(objweapon, var_a35ea66201ac92e8, "ai_hits");
        setweaponstat(objweapon, var_202acce87e9d7f6, "player_hits");
        if (onlinestatsenabled()) {
            var_6d598f3a5a0c87f3 = getplayerstat("combatStats", "totalShots");
            var_914ecbde7394d0ef = getplayerstat("combatStats", "misses");
            setplayerstatbuffered(var_6d598f3a5a0c87f3 + totalShots, "combatStats", "totalShots");
            setplayerstatbuffered(var_914ecbde7394d0ef + var_1f4904b24e56faf5, "combatStats", "misses");
        }
    }
    namespace_391de535501b0143::shotmissed(totalShots, var_7eb0ccf010359357);
    namespace_391de535501b0143::function_cf1cfbbec7d07d44(totalShots, var_1f4904b24e56faf5);
    self.var_f0006748b1b1efb0[var_366b0ecc2f28aead] = 0;
    self.hits[var_366b0ecc2f28aead] = 0;
    self.var_5ffaa0ceb1f66708[var_366b0ecc2f28aead] = 0;
    self.var_c63a7f2980c7d596[var_366b0ecc2f28aead] = 0;
    if (isdefined(self.var_3fea9f1abbe349e2[var_366b0ecc2f28aead])) {
        self.var_3fea9f1abbe349e2[var_366b0ecc2f28aead] = [];
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x859f
// Size: 0xa8
function private watchformiss(objweapon, var_366b0ecc2f28aead) {
    self endon("disconnect");
    if (isdefined(self.var_3fea9f1abbe349e2[var_366b0ecc2f28aead])) {
        while (1) {
            var_3fea9f1abbe349e2 = 0;
            foreach (missile in self.var_3fea9f1abbe349e2[var_366b0ecc2f28aead]) {
                if (isdefined(missile)) {
                    var_3fea9f1abbe349e2++;
                }
            }
            if (var_3fea9f1abbe349e2 == 0) {
                break;
            }
            waitframe();
        }
    } else {
        wait(6);
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x864e
// Size: 0x3b
function watchfornearmisswhizby() {
    self endon("death_or_disconnect");
    self endon("faux_spawn");
    level endon("game_ended");
    while (1) {
        self waittill("attackerbulletwhizby");
        addtoplayerstatbuffered(1, "combatStats", "nearMisses");
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8690
// Size: 0x598
function checkhit(objweapon, victim, shitloc, idamage) {
    self endon("disconnect");
    if (function_483cc81bff18273b(self)) {
        return;
    }
    var_366b0ecc2f28aead = getcompleteweaponname(objweapon);
    if (objweapon.isalternate) {
        attachments = getweaponattachments(objweapon);
        if (array_contains(attachments, "shotgun") || array_contains(attachments, "gl") || array_contains(attachments, "glsmoke") || array_contains(attachments, "glgas") || array_contains(attachments, "glconc") || array_contains(attachments, "glflash") || array_contains(attachments, "glincendiary") || array_contains(attachments, "glsemtex") || array_contains(attachments, "glsnap")) {
            self.hits[var_366b0ecc2f28aead] = 1;
            if (isdefined(victim)) {
                if (isagent(victim)) {
                    self.var_5ffaa0ceb1f66708[var_366b0ecc2f28aead] = 1;
                } else if (isplayer(victim)) {
                    self.var_c63a7f2980c7d596[var_366b0ecc2f28aead] = 1;
                }
            }
        }
    }
    if (!weaponcanstoreaccuracystats(objweapon)) {
        return;
    }
    var_881576b7106f54ce = self meleebuttonpressed();
    if (var_881576b7106f54ce && objweapon.basename != "iw8_knife_mp") {
        return;
    }
    if (!isdefined(self.hits[var_366b0ecc2f28aead])) {
        self.hits[var_366b0ecc2f28aead] = 0;
    }
    if (!isdefined(self.var_5ffaa0ceb1f66708[var_366b0ecc2f28aead])) {
        self.var_5ffaa0ceb1f66708[var_366b0ecc2f28aead] = 0;
    }
    if (!isdefined(self.var_c63a7f2980c7d596[var_366b0ecc2f28aead])) {
        self.var_c63a7f2980c7d596[var_366b0ecc2f28aead] = 0;
    }
    switch (weaponclass(objweapon)) {
    case #"hash_6191aaef9f922f96":
    case #"hash_719417cb1de832b6":
    case #"hash_8cdaf2e4ecfe5b51":
    case #"hash_900cb96c552c5e8e":
    case #"hash_fa24dff6bd60a12d":
        self.hits[var_366b0ecc2f28aead]++;
        if (isagent(victim)) {
            self.var_5ffaa0ceb1f66708[var_366b0ecc2f28aead]++;
        } else if (isplayer(victim)) {
            self.var_c63a7f2980c7d596[var_366b0ecc2f28aead]++;
        }
        break;
    case #"hash_690c0d6a821b42e":
        self.hits[var_366b0ecc2f28aead] = 1;
        if (isagent(victim)) {
            self.var_5ffaa0ceb1f66708[var_366b0ecc2f28aead] = 1;
        } else if (isplayer(victim)) {
            self.var_c63a7f2980c7d596[var_366b0ecc2f28aead] = 1;
        }
        break;
    case #"hash_61e969dacaaf9881":
        self.hits[var_366b0ecc2f28aead] = 1;
        if (isagent(victim)) {
            self.var_5ffaa0ceb1f66708[var_366b0ecc2f28aead] = 1;
        } else if (isplayer(victim)) {
            self.var_c63a7f2980c7d596[var_366b0ecc2f28aead] = 1;
        }
        break;
    case #"hash_e224d0b635d0dadd":
        self.hits[var_366b0ecc2f28aead] = 1;
        if (isagent(victim)) {
            self.var_5ffaa0ceb1f66708[var_366b0ecc2f28aead] = 1;
        } else if (isplayer(victim)) {
            self.var_c63a7f2980c7d596[var_366b0ecc2f28aead] = 1;
        }
        break;
    default:
        break;
    }
    if (isriotshield(objweapon.basename) || objweapon.basename == "iw8_knife_mp") {
        thread namespace_d576b6dc7cef9c62::threadedsetweaponstatbyname(var_366b0ecc2f28aead, self.hits[var_366b0ecc2f28aead], "hits");
        self.hits[var_366b0ecc2f28aead] = 0;
        thread namespace_d576b6dc7cef9c62::threadedsetweaponstatbyname(var_366b0ecc2f28aead, self.var_5ffaa0ceb1f66708[var_366b0ecc2f28aead], "ai_hits");
        self.var_5ffaa0ceb1f66708[var_366b0ecc2f28aead] = 0;
        thread namespace_d576b6dc7cef9c62::threadedsetweaponstatbyname(var_366b0ecc2f28aead, self.var_c63a7f2980c7d596[var_366b0ecc2f28aead], "player_hits");
        self.var_c63a7f2980c7d596[var_366b0ecc2f28aead] = 0;
    }
    if (!var_881576b7106f54ce) {
        namespace_b919c4be206d3c80::function_1882f80b14421089(1, 1);
    }
    if (!isdefined(self.lasthittime[var_366b0ecc2f28aead])) {
        self.lasthittime[var_366b0ecc2f28aead] = 0;
    }
    if (self.lasthittime[var_366b0ecc2f28aead] == gettime()) {
        return;
    }
    self.lasthittime[var_366b0ecc2f28aead] = gettime();
    if (onlinestatsenabled()) {
        totalShots = getplayerstat("combatStats", "totalShots");
        hits = getplayerstat("combatStats", "hits") + 1;
        if (hits <= totalShots) {
            setplayerstatbuffered(hits, "combatStats", "hits");
            setplayerstatbuffered(int(totalShots - hits), "combatStats", "misses");
        }
    }
    thread namespace_aad14af462a74d08::onsuccessfulhit(objweapon);
    thread namespace_391de535501b0143::shothit();
    thread namespace_391de535501b0143::function_2fca19675eb69f1a(victim, shitloc, idamage);
    var_cf4209c200f8bbf4 = getweapongroup(objweapon.basename);
    if (var_cf4209c200f8bbf4 == "weapon_lmg") {
        if (!isdefined(self.shotslandedlmg)) {
            self.shotslandedlmg = 1;
        } else {
            self.shotslandedlmg++;
        }
    }
    currenttime = gettime();
    self.pers["lastDamageTime"] = currenttime;
    if (isdefined(victim)) {
        victim.lasttimedamaged = currenttime;
        if (istrue(victim.var_381cb6b216dfa1a5) && !isinlaststand(victim)) {
            victim.lastshottime = currenttime;
        }
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c2f
// Size: 0x108
function friendlyfirecheck(owner, attacker, forcedfriendlyfirerule, forced) {
    if (!isdefined(owner) || !isdefined(owner.team)) {
        return 1;
    }
    if (!level.teambased) {
        return 1;
    }
    friendlyfirerule = level.friendlyfire;
    if (isdefined(forcedfriendlyfirerule)) {
        friendlyfirerule = forcedfriendlyfirerule;
    }
    if (friendlyfirerule != 0) {
        return 1;
    }
    if (attacker == owner || isdefined(attacker.owner) && attacker.owner == owner) {
        return 1;
    }
    attackerteam = undefined;
    if (isdefined(attacker.owner)) {
        attackerteam = attacker.owner.team;
    } else if (isdefined(attacker.team)) {
        attackerteam = attacker.team;
    }
    if (!isdefined(attackerteam)) {
        return 1;
    }
    if (attackerteam != owner.team) {
        return 1;
    }
    return 0;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d3f
// Size: 0xc3
function watchequipmentonspawn() {
    self notify("watchEquipmentOnSpawn");
    self endon("watchEquipmentOnSpawn");
    self endon("spawned_player");
    self endon("disconnect");
    self endon("faux_spawn");
    deletedisparateplacedequipment();
    var_7a9a49126147a952 = getintproperty(@"hash_b287e80bc7b40ea8", 1) && (!_hasperk("specialty_rugged_eqp") || !checkequipforrugged());
    if (var_7a9a49126147a952) {
        deleteplacedequipment();
    }
    var_194edbe6d906c4e6 = self.plantedtacticalequip.size;
    var_c7e5188314606729 = self.plantedlethalequip.size;
    var_9df2225241e8340a = self.plantedsuperequip.size;
    var_a81b9997da958d97 = self.plantedhackedequip.size;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e09
// Size: 0x8c
function getallequip() {
    var_7c3ce7ff13fbd7fc = [];
    if (isdefined(self.plantedlethalequip)) {
        var_7c3ce7ff13fbd7fc = array_combine(var_7c3ce7ff13fbd7fc, self.plantedlethalequip);
    }
    if (isdefined(self.plantedtacticalequip)) {
        var_7c3ce7ff13fbd7fc = array_combine(var_7c3ce7ff13fbd7fc, self.plantedtacticalequip);
    }
    if (isdefined(self.plantedsuperequip)) {
        var_7c3ce7ff13fbd7fc = array_combine(var_7c3ce7ff13fbd7fc, self.plantedsuperequip);
    }
    if (isdefined(self.plantedhackedequip)) {
        var_7c3ce7ff13fbd7fc = array_combine(var_7c3ce7ff13fbd7fc, self.plantedhackedequip);
    }
    return var_7c3ce7ff13fbd7fc;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e9d
// Size: 0xa4
function removeequip(equip) {
    if (isdefined(self.plantedlethalequip)) {
        self.plantedlethalequip = array_remove(self.plantedlethalequip, equip);
    }
    if (isdefined(self.plantedtacticalequip)) {
        self.plantedtacticalequip = array_remove(self.plantedtacticalequip, equip);
    }
    if (isdefined(self.plantedsuperequip)) {
        self.plantedsuperequip = array_remove(self.plantedsuperequip, equip);
    }
    if (isdefined(self.plantedhackedequip)) {
        self.plantedhackedequip = array_remove(self.plantedhackedequip, equip);
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f48
// Size: 0x7e
function checkequipforrugged() {
    equipment = array_combine(self.plantedtacticalequip, self.plantedlethalequip);
    foreach (equip in equipment) {
        if (isdefined(equip.hasruggedeqp)) {
            return 1;
        }
    }
    return 0;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8fce
// Size: 0x36
function watchgrenadeusage() {
    self notify("watchGrenadeUsage");
    self endon("watchGrenadeUsage");
    self endon("spawned_player");
    self endon("disconnect");
    self endon("faux_spawn");
    while (1) {
        watchgrenadethrows();
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x900b
// Size: 0x33
function watchgrenadethrows() {
    grenade = waittill_grenade_throw();
    grenadeUsed(grenade);
    if (isdefined(grenade)) {
        grenade function_5226227bce83ebe9(3, self.team);
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9045
// Size: 0x53
function function_1bacc798ac81809a(var_3e6c39a65d0cfc00, callback) {
    if (!isdefined(level.var_b2b35840c12ce55c)) {
        level.var_b2b35840c12ce55c = [];
    }
    /#
        assertex(!isdefined(level.var_b2b35840c12ce55c[var_3e6c39a65d0cfc00]), "GrenadeUsedCallbacks redefinition.");
    #/
    level.var_b2b35840c12ce55c[var_3e6c39a65d0cfc00] = callback;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x909f
// Size: 0xb12
function grenadeUsed(grenade) {
    if (!isdefined(grenade)) {
        return;
    }
    if (!isdefined(grenade.weapon_name)) {
        return;
    }
    var_49e6ef3edadd524e = function_f581838ce4328f7a(grenade.weapon_object);
    if (isplayer(self)) {
        setweaponstat(grenade.weapon_object, 1, "shots");
        namespace_25c5a6f43bb97b43::ongrenadeuse(grenade);
        namespace_d576b6dc7cef9c62::sethasdonecombat(self, 1);
        if (isdefined(grenade.equipmentref)) {
            var_4918b66cebc7fbe7 = namespace_1a507865f681850e::isequipmentlethal(grenade.equipmentref);
            istactical = namespace_1a507865f681850e::isequipmenttactical(grenade.equipmentref);
            namespace_57f20ee4fe3eebba::grenadethrownevent(var_4918b66cebc7fbe7);
            if (isdefined(istactical) && self isthrowingbackgrenade() && getdvarint(@"hash_61a8d5707f364581", 1)) {
                self function_9b5704d0633b87fa();
                objweapon = makeweapon(grenade.weapon_name);
                ammo = self getweaponammoclip(objweapon);
                newammo = int(max(ammo - 1, 0));
                self setweaponammoclip(objweapon, newammo);
            }
        }
        namespace_27c74152ccb91331::function_ef6885141252869(self, grenade);
        if (namespace_68e641469fde3fa7::issuperweapon(grenade.weapon_object)) {
            if (!namespace_1cd9f6896754adb0::get("supers") || istrue(self.var_859654e0445a36d9)) {
                if (namespace_36f464722d326bbe::isBRStyleGameType()) {
                    if (isinlaststand(self)) {
                        var_ebec497ff8b18a45 = namespace_85d036cb78063c4a::getsuperrefforsuperweapon(grenade.weapon_object);
                        self.var_a188fba649ffd953 = var_ebec497ff8b18a45;
                    }
                }
                grenade delete();
                return;
            }
        }
    }
    if (isaxeweapon(grenade.weapon_name)) {
        grenade thread watchgrenadeaxepickup(self);
        return;
    }
    grenade thread namespace_25c5a6f43bb97b43::grenadeproximitytracking();
    grenade.spawnpos = grenade.origin;
    namespace_8361bad7391de074::ongrenadeused(grenade, self, var_49e6ef3edadd524e);
    if (isdefined(level.var_b2b35840c12ce55c[var_49e6ef3edadd524e])) {
        self thread [[ level.var_b2b35840c12ce55c[var_49e6ef3edadd524e] ]](grenade);
    } else {
        switch (var_49e6ef3edadd524e) {
        case #"hash_7c03088193266bc4":
            if (grenade.ticks >= 1) {
                grenade.iscooked = 1;
            }
            grenade.originalowner = self;
            grenade thread namespace_6de0840c25c8dc22::grenade_earthquake();
            break;
        case #"hash_965fb4c0595f06cd":
            if (grenade.ticks >= 1) {
                grenade.iscooked = 1;
            }
            grenade.originalowner = self;
            thread namespace_44f7e377356e9926::wristrocketused(grenade);
            grenade thread namespace_6de0840c25c8dc22::grenade_earthquake(0.6);
            break;
        case #"hash_5d11ac1131cddab1":
            thread semtex_used(grenade);
            grenade thread namespace_6de0840c25c8dc22::grenade_earthquake();
            break;
        case #"hash_fa4b81880311c2b":
            thread namespace_7381a1f17171d16c::c4_used(grenade);
            var_d7b337718e8ecf0e = spawnstruct();
            var_d7b337718e8ecf0e.grenade = grenade;
            callback("dao_c4_used", var_d7b337718e8ecf0e);
            break;
        case #"hash_fa1e80f6bd5b8e72":
            thread namespace_7381a1f17171d16c::c4_used(grenade);
            break;
        case #"hash_3c2d21aea30374d4":
            namespace_42677e50338056c6::emp_grenade_used(grenade);
            break;
        case #"hash_42dcb6ce7ecb709c":
            thread namespace_ce72036f17f28af2::snapshot_grenade_used(grenade, 0);
            break;
        case #"hash_e1f6f84e4cd950eb":
            grenade thread namespace_14181962862cf569::smokegrenadeused(0);
            break;
        case #"hash_13d1f84d0ae96a5f":
            if (isplayer(self)) {
                thread trophy_used(grenade);
            }
            break;
        case #"hash_36b7174a04de8799":
            if (isagent(self)) {
                thread namespace_d4389b4b98ee0dc0::function_af4eb22319ad376(grenade);
            } else {
                thread namespace_8c5b266f689b1e0b::claymore_use(grenade);
            }
            break;
        case #"hash_9d57562863499a06":
            thread namespace_3953fa5589223b8::at_mine_use(grenade);
            break;
        case #"hash_530ba8d82158ca97":
            thread namespace_d8f7634b48937d6d::function_81863480a8885799(grenade);
            break;
        case #"hash_b7f5380094623046":
        case #"hash_2ab98cab4066a74e":
            thread namespace_eb0feb5c721a9f11::throwing_knife_used(grenade);
            break;
        case #"hash_c9a436974fe60919":
            grenade thread namespace_6de0840c25c8dc22::grenade_earthquake();
            thread namespace_df478cc572a311d3::molotov_used(grenade);
            break;
        case #"hash_a0319e349a692b8f":
            thread namespace_8a5c6d833b2eeab1::thermite_used(grenade);
            break;
        case #"hash_3cc897796b318cd9":
            thread namespace_e610e1eacc6214ce::thrown(grenade);
            break;
        case #"hash_7e0a03ed7c4c87be":
        case #"hash_7a494a6441a8df6":
        case #"hash_f0c0b9ea65729629":
        case #"hash_cd2d060ee0632a30":
        case #"hash_6bc36a1e4f485a79":
        case #"hash_526718f50b85440e":
        case #"hash_69bb92722794d72f":
            thread namespace_f9accfe6b1adc8f4::supportbox_used(grenade);
            break;
        case #"hash_333525cef39d0c66":
            thread namespace_85b18538a4f2be70::decoy_used(grenade);
            break;
        case #"hash_fb36696c0708bf42":
            thread namespace_d39a86483d995ed1::gas_used(grenade);
            break;
        case #"hash_cedad6d52b2b36c2":
        case #"hash_7983828e72e83a3e":
            if (issharedfuncdefined("super_hb_sensor", "hb_sensor_used")) {
                thread function_f3bb4f4911a1beb2("super_hb_sensor", "hb_sensor_used", grenade);
            }
            break;
        case #"hash_e61f1a05dec2770":
            thread namespace_7111b1420b25d0ad::binoculars_used(grenade);
            break;
        case #"hash_17d5fde761fc574b":
            thread namespace_e76aa51cbf8812ee::tac_cover_used(grenade);
            break;
        case #"hash_7fd9546fa84e64a5":
        case #"hash_a68928468343f517":
            if (istrue(self.var_8e61d4338428b3bd)) {
                self.var_8e61d4338428b3bd = 0;
                grenade delete();
                break;
            }
            thread namespace_add8ab90fc53d7f7::tacinsert_used(grenade);
            break;
        case #"hash_e5163523e542c46c":
            thread namespace_bfc508e9af237b9b::advanced_supply_drop_marker_used(grenade);
            break;
        case #"hash_26f2bb279cde043f":
            if (isdefined(level.var_ff4bbeb786042d78)) {
                self thread [[ level.var_ff4bbeb786042d78 ]](grenade);
            }
            break;
        case #"hash_8596111ca1d99c77":
            thread namespace_bfc508e9af237b9b::function_f3e74468f0e5f521(grenade);
            break;
        case #"hash_8ae2b02f9a08357a":
            thread namespace_7f468c66c778cc41::weapondrop_used(grenade);
            break;
        case #"hash_8670ac083666f3a4":
            grenade thread concussionused();
            break;
        case #"hash_c749c88b18be256f":
            thread namespace_ec12f2e19aa34cc8::function_dbeca4d95f44293d(grenade);
            break;
        case #"hash_64358af9c6c1edea":
            thread namespace_6042a7b1a31aaedc::function_2d117eeb564f6ea3(grenade);
            break;
        case #"hash_1ff8309cfb0a09c5":
            if (isagent(self)) {
                thread namespace_ade096b4b575e46c::function_7b988e1bb56ca747(grenade);
            } else {
                thread namespace_f4f0e3ec4c6dce27::function_6d91f8514005d18(grenade);
            }
            break;
        case #"hash_d197e38e5fa659dd":
            thread namespace_96abc792b7f61807::function_3d5c1674387c936e(grenade);
            break;
        case #"hash_2994f46753d1edff":
            if (issharedfuncdefined("equip_aethercounter", "used")) {
                thread function_f3bb4f4911a1beb2("equip_aethercounter", "used", grenade);
            }
            break;
        case #"hash_b97f84c02b147504":
            thread namespace_861236fa8235a2ba::function_255bed505249bc85(grenade);
            break;
        case #"hash_11a03a12f93f62b2":
            thread namespace_742e7eca5294ecdc::function_54655641d3957e3(grenade, 0);
            break;
        case #"hash_d9108a0595d7d0b9":
            thread namespace_14ec1bc880a07c3b::function_3d78dd516c25ef77(grenade);
            break;
        case #"hash_4714926c2f3e2d15":
            thread namespace_80fd9fce6a4434f::function_3f0911714ab49503(grenade);
            break;
        case #"hash_f7d2b3d20ecdcc2c":
            thread namespace_b93a97d16ff2ddc6::function_477d655fc0ede218(grenade);
            break;
        case #"hash_2d5c96c5718a6446":
            grenade thread namespace_6de0840c25c8dc22::grenade_earthquake();
            break;
        case #"hash_15c765aa76e58c8a":
            if (issharedfuncdefined(#"hash_3e1f3a354ee4ffcb", #"use", 1)) {
                damage = [[ getsharedfunc(#"hash_3e1f3a354ee4ffcb", #"use") ]](grenade);
            }
            break;
        case #"hash_94584bc84d5262fb":
            thread namespace_c8c97309eacd3392::function_9eb2b20f81d7c464(grenade);
            break;
        case #"hash_41250f0591c8ecae":
            thread namespace_2db0b5db4c5dfc98::function_b02438cf4822a79e(grenade);
            break;
        case #"hash_72d6951f1472c8b3":
            thread namespace_ccba935845e72677::function_4ca6b5feba808692(grenade);
            break;
        case #"hash_85d7e1863dca54c4":
            thread namespace_4033b03dc100de62::function_7214173379da1591(grenade);
            break;
        case #"hash_c03ed6f6f4fe9dad":
        case #"hash_22dbe57b7df54899":
            self thread [[ namespace_3c37cb17ade254d::getsharedfunc(var_49e6ef3edadd524e, "grenadeUsed") ]](grenade);
            break;
        case #"hash_8747706404533493":
            thread namespace_9cff5695f11e1c45::function_709581d70ebb07cd(grenade);
            break;
        case #"hash_f219d5163a73c117":
            thread namespace_c0468fb70a78d525::function_230403b8cf5ea1e8(grenade);
            break;
        case #"hash_444e24c19329aec0":
            thread namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2("pmc_missions", "onFlarePlaced", grenade);
            break;
        case #"hash_151a2c18538b6dc4":
            thread namespace_85e02c5451bdc1e2::function_ba4f176b24eb2f54(grenade);
            break;
        case #"hash_4091bf4696831b2a":
            thread namespace_2685021acd20134::function_b46c661d38c61aa2(grenade);
            break;
        case #"hash_849c32fe9df2b823":
            if (namespace_3c37cb17ade254d::issharedfuncdefined("super_capture_bot", "captureBot_used")) {
                self thread [[ namespace_3c37cb17ade254d::getsharedfunc("super_capture_bot", "captureBot_used") ]](grenade);
            }
            break;
        case #"hash_5f29cda9550e6a3a":
            thread namespace_b96a346cb4f3959c::function_539f38f444d5b41a(grenade);
            break;
        case #"hash_17c70dc48424ba92":
            if (issharedfuncdefined("breacher_drone", "breacher_drone_used")) {
                self thread [[ getsharedfunc("breacher_drone", "breacher_drone_used") ]](grenade);
            }
            break;
        case #"hash_37f0e5959e7222f":
            if (namespace_3c37cb17ade254d::issharedfuncdefined("super_med_box", "medBox_used")) {
                self thread [[ namespace_3c37cb17ade254d::getsharedfunc("super_med_box", "medBox_used") ]](grenade);
            }
            break;
        case #"hash_606cb2a6a1a3bd0a":
            if (issharedfuncdefined("thermobaric_grenade", "thermobaric_grenade_used")) {
                self thread [[ getsharedfunc("thermobaric_grenade", "thermobaric_grenade_used") ]](grenade);
            }
            break;
        case #"hash_80e255f3c96bc326":
            thread namespace_e6ac9d98b8876b98::function_905b7bada6fd91cb();
            break;
        case #"hash_24fa33b49ea5081":
            if (issharedfuncdefined("super_comm_scrambler", "commScrambler_used")) {
                self thread [[ getsharedfunc("super_comm_scrambler", "commScrambler_used") ]](grenade);
            }
            break;
        case #"hash_ed63836c000de77f":
            if (issharedfuncdefined("super_evg", "evg_used")) {
                self thread [[ getsharedfunc("super_evg", "evg_used") ]](grenade);
            }
            break;
        case #"hash_74ea92f6d496465f":
            thread namespace_6340662230fe40b3::function_604ed6f2f8323ea6(grenade);
            break;
        default:
            if (isdefined(level.ongrenadeused)) {
                [[ level.ongrenadeused ]](grenade.weapon_name, grenade);
            }
            break;
        }
    }
    if (isplayer(self)) {
        logequipmentuse(grenade);
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9bb8
// Size: 0x6d
function logequipmentuse(grenade) {
    if (!isdefined(grenade)) {
        return;
    }
    equipment_type = getequipmenttype(grenade.weapon_object);
    if (!isdefined(equipment_type)) {
        equipment_type = "none";
    }
    self dlog_recordplayerevent("dlog_event_equipment_use", [0:"weapon_used", 1:grenade.weapon_name, 2:"equipment_type", 3:equipment_type]);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c2c
// Size: 0x4d
function concussionused() {
    thread notifyafterframeend("death", "end_explode");
    self endon("end_explode");
    owner = self.owner;
    position = self waittill("explode");
    thread namespace_bcc915524a9a5eba::onexplode(owner, position);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c80
// Size: 0x43
function watchgrenadedeath() {
    self waittill("death");
    if (isdefined(self.knife_trigger)) {
        self.knife_trigger delete();
    }
    if (isdefined(self.useobj_trigger)) {
        self.useobj_trigger delete();
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9cca
// Size: 0x39
function function_e00b77a9cb4d8322(target) {
    if (!isdefined(level.special_lockon_target_list)) {
        level.special_lockon_target_list = [];
    }
    level.special_lockon_target_list[level.special_lockon_target_list.size] = target;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d0a
// Size: 0x3c
function function_1a33bd42949ccbda(target) {
    if (!isdefined(level.special_lockon_target_list)) {
        level.special_lockon_target_list = [];
    }
    level.special_lockon_target_list = namespace_3c37cb17ade254d::array_remove(level.special_lockon_target_list, target);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d4d
// Size: 0x63a
function lockonlaunchers_gettargetarray(var_fe608d14719843bc) {
    targets = [];
    var_e688b198aa9a4b3f = 0;
    /#
        var_e688b198aa9a4b3f = getdvarint(@"hash_10368af4dee3ba2c", 0);
    #/
    if (isdefined(level.special_lockon_target_list)) {
        level.special_lockon_target_list = array_removeundefined(level.special_lockon_target_list);
        foreach (special_target in level.special_lockon_target_list) {
            targets[targets.size] = special_target;
        }
    }
    if (level.teambased) {
        if (isdefined(var_fe608d14719843bc) && var_fe608d14719843bc == 1) {
            foreach (char in level.characters) {
                if (isdefined(char) && isalive(char) && (char.team != self.team || var_e688b198aa9a4b3f)) {
                    targets[targets.size] = char;
                }
            }
        }
        if (isdefined(level.activekillstreaks)) {
            foreach (streak in level.activekillstreaks) {
                if (isdefined(streak) && isdefined(streak.affectedbylockon) && (streak.team != self.team || var_e688b198aa9a4b3f)) {
                    targets[targets.size] = streak;
                }
            }
        }
        if (isdefined(level.cratedropdata)) {
            if (isdefined(level.cratedropdata.ac130s)) {
                foreach (ac130 in level.cratedropdata.ac130s) {
                    if (isdefined(ac130) && (ac130.team != self.team || var_e688b198aa9a4b3f)) {
                        targets[targets.size] = ac130;
                    }
                }
            }
        }
        foreach (vehicleRef in namespace_1f188a13f7e79610::function_9005b7fc076293f8()) {
            vehicles = namespace_f64231d5b7a2c3c4::vehicle_tracking_getgameinstances(vehicleRef);
            foreach (vehicle in vehicles) {
                if (isdefined(vehicle) && !istrue(vehicle.var_ec60570ddbb987b1) && (!namespace_1f188a13f7e79610::vehicle_isfriendlytoplayer(vehicle, self) || var_e688b198aa9a4b3f)) {
                    targets[targets.size] = vehicle;
                }
            }
        }
        if (isdefined(level.loot_choppers)) {
            foreach (var_ad23e3d265548e7e in level.loot_choppers) {
                if (isdefined(var_ad23e3d265548e7e)) {
                    targets[targets.size] = var_ad23e3d265548e7e;
                }
            }
        }
    } else {
        if (isdefined(var_fe608d14719843bc) && var_fe608d14719843bc == 1) {
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
        foreach (vehicleRef in namespace_1f188a13f7e79610::function_9005b7fc076293f8()) {
            vehicles = namespace_f64231d5b7a2c3c4::vehicle_tracking_getgameinstances(vehicleRef);
            foreach (vehicle in vehicles) {
                if (istrue(vehicle.var_ec60570ddbb987b1)) {
                    continue;
                }
                if (!isdefined(vehicle.owner)) {
                    targets[targets.size] = vehicle;
                } else if (vehicle.owner != self || var_e688b198aa9a4b3f) {
                    targets[targets.size] = vehicle;
                }
            }
        }
    }
    return targets;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa38f
// Size: 0x4d
function watchmissileusage() {
    self endon("disconnect");
    for (;;) {
        var_c00e2f62499a29f3 = waittill_missile_fire();
        missile = var_c00e2f62499a29f3[1];
        objweapon = var_c00e2f62499a29f3[0];
        updatemissilefire(missile);
        onweaponfired(objweapon, missile);
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa3e3
// Size: 0x42f
function updatemissilefire(missile) {
    missiletarget = undefined;
    var_54a24336cc9a143d = 0;
    switch (missile.weapon_name) {
    case #"hash_13a265ac820ea0df":
    case #"hash_3e782fd775b72022":
        missiletarget = self.missilelaunchertarget;
        level thread namespace_25c5a6f43bb97b43::launcherfired(missile);
        break;
    case #"hash_5c272c0617caebf0":
        missiletarget = self.javelin.target;
        level thread namespace_25c5a6f43bb97b43::javelinfired(self.team, self.javelin.target.origin);
        break;
    case #"hash_c072f6a196dbf40":
    case #"hash_d691d2856bc1a843":
    case #"hash_bf9c1865fe3169c8":
    case #"hash_38dc6dbb8eff7509":
    case #"hash_b47addb656374bd0":
    case #"hash_4abff18a90f4694d":
    case #"hash_a8d2c4797815ac75":
    case #"hash_4ecb6207eebc4cec":
    case #"hash_a9624944fea13b90":
    case #"hash_c7fd45d736bb0811":
    case #"hash_d09faed5f3b6a217":
    case #"hash_d37e55e926fd69e0":
    case #"hash_db59530b972470ab":
        var_54a24336cc9a143d = 1;
        break;
    case #"hash_6839e0fa25920b48":
    case #"hash_76330cd4249843b0":
    case #"hash_b1efce72d7907146":
        var_54a24336cc9a143d = 1;
        missile thread namespace_14181962862cf569::smokegrenadeused(1);
        break;
    case #"hash_1ebf04f1936c518":
    case #"hash_4782fb1d8fe443b3":
    case #"hash_3402dcecc4fdd15e":
    case #"hash_52bcd2bfaa128ca2":
        var_54a24336cc9a143d = 1;
        thread namespace_d39a86483d995ed1::gas_used(missile);
        break;
    case #"hash_bf9186d366bb0638":
    case #"hash_46f5e5d5dcc40a15":
    case #"hash_4adaf4a688093960":
    case #"hash_d376328b0052cc6d":
    case #"hash_4aeb965aa988c369":
    case #"hash_d78170432d48ea13":
    case #"hash_91c4e6c99dbd12fa":
    case #"hash_e6645051b5b4b0d4":
        var_54a24336cc9a143d = 1;
        break;
    case #"hash_9bdd4a77de2178e1":
    case #"hash_1e9751b75f7cf232":
    case #"hash_a29ecb3d754c1403":
    case #"hash_a3991996e09eb513":
        var_54a24336cc9a143d = 1;
        missile thread namespace_6de0840c25c8dc22::grenade_earthquake();
        thread namespace_8a5c6d833b2eeab1::thermite_used(missile, 1);
        break;
    case #"hash_1f2ad6f0a8a0da6b":
    case #"hash_a54bf40834af0df5":
    case #"hash_64b33ac96ed2f791":
    case #"hash_4d0defb6d4c7dd6c":
        var_54a24336cc9a143d = 1;
        break;
    case #"hash_f8bbf06ce7865e4":
    case #"hash_9d6247f9047b296c":
    case #"hash_c3d0fe2d2f18a4fa":
    case #"hash_75e72e81c0590e87":
    case #"hash_e1e8d438ee4215de":
        var_54a24336cc9a143d = 1;
        thread namespace_14ec1bc880a07c3b::function_d5fe78860931c577(missile);
        break;
    default:
        break;
    }
    if (islockonlauncher(missile.weapon_name) && isdefined(missiletarget)) {
        missile.lockontarget = missiletarget;
        level notify("stinger_fired", self);
        thread watchtargetlockedontobyprojectile(missiletarget, missile);
    }
    if (isplayer(self)) {
        missile.adsfire = isplayerads();
    }
    if (!var_54a24336cc9a143d && isexplosivemissile(missile.weapon_name) && !function_63de97cb47983c1b(missile.weapon_name)) {
        scale = 1;
        if (issmallmissile(missile.weapon_name)) {
            scale = 0.65;
        }
        if (missile.weapon_name == "jup_pi_goldengun_mp") {
            scale = getdvarfloat(@"hash_76a9ec5284933d62", 0.2);
            missile thread namespace_6de0840c25c8dc22::grenade_earthquake(scale);
        } else {
            missile thread namespace_6de0840c25c8dc22::grenade_earthquake(scale);
        }
    }
    namespace_391de535501b0143::missilefired(missile);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa819
// Size: 0xd
function issmallmissile(weapon) {
    return 0;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa82e
// Size: 0x66
function isexplosivemissile(weapon) {
    var_92fce7b1696254e3 = getweaponbasename(weapon);
    switch (var_92fce7b1696254e3) {
    case #"hash_1e6ad4ef0904a0f1":
    case #"hash_1ee2bbd1bc80ea9a":
    case #"hash_4f9064f9a7a4b7d1":
    case #"hash_b833f98278746f9b":
    case #"hash_fe08358bc8f9a34a":
        return 0;
        break;
    }
    return 1;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa89c
// Size: 0x38
function function_63de97cb47983c1b(weapon_name) {
    if (!isdefined(level.var_f1339ee09ea219d8)) {
        return 0;
    }
    if (isdefined(weapon_name) && array_contains(level.var_f1339ee09ea219d8, weapon_name)) {
        return 1;
    }
    return 0;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa8dc
// Size: 0x57
function movingplatformdetonate(data) {
    if (!isdefined(data.lasttouchedplatform) || !isdefined(data.lasttouchedplatform.destroyexplosiveoncollision) || data.lasttouchedplatform.destroyexplosiveoncollision) {
        self notify("detonateExplosive");
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa93a
// Size: 0x72
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

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa9b3
// Size: 0x54
function monitordisownedgrenade(player, grenade) {
    level endon("game_ended");
    grenade endon("death");
    grenade endon("mine_planted");
    waittill_any_ents(player, "joined_team", player, "joined_spectators", player, "disconnect", level, "prematch_cleanup");
    if (isdefined(grenade)) {
        grenade delete();
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa0e
// Size: 0x2d
function isplantedequipment(ent) {
    return isdefined(level.mines[ent getentitynumber()]) || istrue(ent.planted);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa43
// Size: 0x6a
function getmaxplantedlethalequip(player) {
    var_e416de928081866d = function_53c4c53197386572(level.var_1a2b600a06ec21f4.var_e0fd3aaac88168f, 2);
    if (_hasperk("specialty_extra_planted_equipment")) {
        var_e416de928081866d++;
    }
    /#
        var_786dc59a2e215fc5 = getdvarint(@"hash_f35cb6d0fbb90304", 0);
        if (var_786dc59a2e215fc5 > 0) {
            var_e416de928081866d = var_786dc59a2e215fc5;
        }
    #/
    return var_e416de928081866d;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaab5
// Size: 0x6a
function getmaxplantedtacticalequip(player) {
    var_30dc1c5e4b8568b0 = function_53c4c53197386572(level.var_1a2b600a06ec21f4.var_3f2010af8effc1a2, 2);
    if (_hasperk("specialty_extra_planted_equipment")) {
        var_30dc1c5e4b8568b0++;
    }
    /#
        var_786dc59a2e215fc5 = getdvarint(@"hash_fa291a82a43e1ab1", 0);
        if (var_786dc59a2e215fc5 > 0) {
            var_30dc1c5e4b8568b0 = var_786dc59a2e215fc5;
        }
    #/
    return var_30dc1c5e4b8568b0;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab27
// Size: 0x1a
function getmaxplantedsuperequip(equipmentref) {
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        return 1;
    }
    return 2;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab49
// Size: 0x5
function function_80809994f5a396d0() {
    return 2;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab56
// Size: 0x5
function getmaxplantedhackedequip() {
    return 3;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab63
// Size: 0xbc
function onequipmentplanted(var_feba29ce82d4980f, equipmentref, deletefunc, var_e12df308e25f92c3) {
    var_feba29ce82d4980f.equipmentref = equipmentref;
    var_feba29ce82d4980f.deletefunc = deletefunc;
    var_feba29ce82d4980f.planted = 1;
    if (!istrue(var_e12df308e25f92c3)) {
        updateplantedarray(var_feba29ce82d4980f);
    }
    entnum = var_feba29ce82d4980f getentitynumber();
    level.mines[entnum] = var_feba29ce82d4980f;
    if (equipmentref != "equip_tac_cover") {
        var_feba29ce82d4980f enableplayermarks("equipment");
        if (level.teambased) {
            var_feba29ce82d4980f filteroutplayermarks(self.team);
        } else {
            var_feba29ce82d4980f filteroutplayermarks(self);
        }
    }
    var_feba29ce82d4980f notify("mine_planted");
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac26
// Size: 0x2cc
function updateplantedarray(equipment) {
    var_749469570d9d7cbc = undefined;
    var_20f2244c14cd5d6c = 0;
    slot = namespace_1a507865f681850e::findequipmentslot(equipment.equipmentref);
    if (istrue(equipment.ishacked)) {
        var_749469570d9d7cbc = equipment.owner.plantedhackedequip;
        var_20f2244c14cd5d6c = getmaxplantedhackedequip();
    } else if (istrue(equipment.issuper)) {
        if (equipment.equipmentref == "equip_tac_cover") {
            var_20f2244c14cd5d6c = function_80809994f5a396d0();
            var_749469570d9d7cbc = equipment.owner.plantedsuperequip;
        } else {
            var_749469570d9d7cbc = equipment.owner.plantedsuperequip;
            var_20f2244c14cd5d6c = getmaxplantedsuperequip(equipment.equipmentref);
        }
    } else if (isdefined(slot) && slot == "primary" || namespace_1a507865f681850e::isequipmentlethal(equipment.equipmentref)) {
        var_749469570d9d7cbc = equipment.owner.plantedlethalequip;
        var_20f2244c14cd5d6c = getmaxplantedlethalequip(self);
    } else if (isdefined(slot) && slot == "secondary" || namespace_1a507865f681850e::isequipmenttactical(equipment.equipmentref)) {
        var_749469570d9d7cbc = equipment.owner.plantedtacticalequip;
        var_20f2244c14cd5d6c = getmaxplantedtacticalequip(self);
    }
    if (!isdefined(var_749469570d9d7cbc)) {
        message = "isSuper: " + equipment.issuper + ", slot: " + slot + ", equipmentRef: " + equipment.equipmentref + ", allowed: " + namespace_1a507865f681850e::is_equipment_slot_allowed("super");
        namespace_9c840bb9f2ecbf00::demoforcesre(message);
    }
    if (var_749469570d9d7cbc.size > 0) {
        if (var_749469570d9d7cbc.size && var_749469570d9d7cbc.size >= var_20f2244c14cd5d6c) {
            var_e472d6dedb41acfd = var_749469570d9d7cbc[0];
            var_749469570d9d7cbc = array_remove(var_749469570d9d7cbc, var_e472d6dedb41acfd);
            var_e472d6dedb41acfd deleteexplosive();
        }
    }
    var_749469570d9d7cbc[var_749469570d9d7cbc.size] = equipment;
    if (istrue(equipment.ishacked)) {
        equipment.owner.plantedhackedequip = var_749469570d9d7cbc;
    } else if (istrue(equipment.issuper)) {
        equipment.owner.plantedsuperequip = var_749469570d9d7cbc;
    } else if (isdefined(slot) && slot == "primary" || namespace_1a507865f681850e::isequipmentlethal(equipment.equipmentref)) {
        equipment.owner.plantedlethalequip = var_749469570d9d7cbc;
    } else if (isdefined(slot) && slot == "secondary" || namespace_1a507865f681850e::isequipmenttactical(equipment.equipmentref)) {
        equipment.owner.plantedtacticalequip = var_749469570d9d7cbc;
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaef9
// Size: 0xc0
function setplantedequipmentuse(enabled) {
    var_7c3ce7ff13fbd7fc = getallequip();
    foreach (equip in var_7c3ce7ff13fbd7fc) {
        if (isdefined(equip.trigger) && isdefined(equip.owner)) {
            if (enabled) {
                equip.trigger enableplayeruse(equip.owner);
            } else {
                equip.trigger disableplayeruse(equip.owner);
            }
        }
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xafc0
// Size: 0x44
function cleanupequipment(var_3397ec8092bcdde5, var_e9cae9957eacb9fb, var_63b78a72aa2df5f9) {
    if (isdefined(var_3397ec8092bcdde5)) {
        level.mines[var_3397ec8092bcdde5] = undefined;
    }
    if (isdefined(var_e9cae9957eacb9fb)) {
        var_e9cae9957eacb9fb delete();
    }
    if (isdefined(var_63b78a72aa2df5f9)) {
        var_63b78a72aa2df5f9 delete();
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb00b
// Size: 0x1d0
function equipmenthit(owner, attacker, objweapon, meansofdeath) {
    if (namespace_f8065cafc523dba5::playersareenemies(attacker, owner)) {
        if (!isdefined(objweapon)) {
            return;
        }
        if (iskillstreakweapon(objweapon.basename)) {
            return;
        }
        var_366b0ecc2f28aead = getcompleteweaponname(objweapon);
        if (!isdefined(attacker.lasthittime)) {
            attacker.lasthittime = [];
        }
        if (!isdefined(attacker.lasthittime[var_366b0ecc2f28aead])) {
            attacker.lasthittime[var_366b0ecc2f28aead] = 0;
        }
        if (attacker.lasthittime[var_366b0ecc2f28aead] == gettime()) {
            return;
        }
        attacker.lasthittime[var_366b0ecc2f28aead] = gettime();
        attacker thread namespace_d576b6dc7cef9c62::threadedsetweaponstatbyname(var_366b0ecc2f28aead, 1, "hits");
        if (onlinestatsenabled()) {
            totalShots = attacker getplayerstat("combatStats", "totalShots");
            hits = attacker getplayerstat("combatStats", "hits") + 1;
            if (hits <= totalShots) {
                setplayerstatbuffered(hits, "combatStats", "hits");
                setplayerstatbuffered(int(totalShots - hits), "combatStats", "misses");
            }
        }
        if (isdefined(meansofdeath) && isbulletdamage(meansofdeath) || isprojectiledamage(meansofdeath)) {
            attacker.pers["lastDamageTime"] = gettime();
            var_cf4209c200f8bbf4 = getweapongroup(objweapon.basename);
            if (var_cf4209c200f8bbf4 == "weapon_lmg") {
                if (!isdefined(attacker.shotslandedlmg)) {
                    attacker.shotslandedlmg = 1;
                } else {
                    attacker.shotslandedlmg++;
                }
            }
        }
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb1e2
// Size: 0xb1
function deleteexplosive() {
    if (!isdefined(self)) {
        return;
    }
    namespace_6d9917c3dc05dbe9::unregistersentient(self.sentientpool, self.sentientpoolindex);
    var_3397ec8092bcdde5 = self getentitynumber();
    level.mines[var_3397ec8092bcdde5] = undefined;
    self disableplayermarks("equipment");
    if (isdefined(self.deletefunc)) {
        self thread [[ self.deletefunc ]]();
        self notify("deleted_equipment");
    } else {
        var_e9cae9957eacb9fb = self.killcament;
        var_63b78a72aa2df5f9 = self.trigger;
        cleanupequipment(var_3397ec8092bcdde5, var_e9cae9957eacb9fb, var_63b78a72aa2df5f9);
        self notify("deleted_equipment");
        self delete();
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb29a
// Size: 0x8f
function makeexplosiveusable(offset) {
    /#
        assert(isdefined(self.owner));
    #/
    self setotherent(self.owner);
    if (!isdefined(offset)) {
        offset = 10;
    }
    trigger = spawn("script_origin", self.origin + offset * anglestoup(self.angles));
    trigger linkto(self);
    self.trigger = trigger;
    trigger.owner = self;
    thread makeexplosiveusableinternal();
    return trigger;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb331
// Size: 0x4b
function makeexplosiveusableinternal() {
    self endon("makeExplosiveUnusable");
    trigger = self.trigger;
    watchexplosiveusable();
    if (isdefined(self)) {
        trigger = self.trigger;
        self.trigger = undefined;
    }
    if (isdefined(trigger)) {
        trigger delete();
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb383
// Size: 0x35
function makeexplosiveunusable() {
    self notify("makeExplosiveUnusable");
    trigger = self.trigger;
    self.trigger = undefined;
    if (isdefined(trigger)) {
        trigger delete();
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb3bf
// Size: 0x144
function watchexplosiveusable() {
    owner = self.owner;
    trigger = self.trigger;
    self endon("death");
    trigger endon("death");
    owner endon("disconnect");
    level endon("game_ended");
    trigger setcursorhint("HINT_NOICON");
    trigger setselfusable(owner);
    trigger childthread notusableforjoiningplayers(owner);
    trigger childthread notusableafterownerchange(owner, self);
    trigger setexplosiveusablehintstring(self.weapon_name);
    while (1) {
        trigger waittillmatch("trigger", owner);
        if (isdefined(self.weapon_name)) {
            switch (self.weapon_name) {
            case #"hash_5e3fa526a48eaaa5":
                thread namespace_832187ad8517bd27::trophy_pickup();
                break;
            }
            owner thread namespace_7381a1f17171d16c::c4_resetaltdetonpickup();
        }
        owner playlocalsound("scavenger_pack_pickup");
        owner notify("scavenged_ammo", self.weapon_name);
        equipmentref = namespace_1a507865f681850e::getequipmentreffromweapon(makeweapon(self.weapon_name));
        if (isdefined(equipmentref) && self.owner namespace_1a507865f681850e::hasequipment(equipmentref)) {
            self.owner namespace_1a507865f681850e::incrementequipmentammo(equipmentref, 1);
        }
        thread deleteexplosive();
        return;
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb50a
// Size: 0x6c
function private function_1d982537b9dcb924(player) {
    if (!isplayer(player)) {
        return 0;
    }
    if (issharedfuncdefined("game", "isCommonItemEnabled")) {
        if (!function_f3bb4f4911a1beb2("game", "isCommonItemEnabled")) {
            return 0;
        }
        if (!(issharedfuncdefined("game", "obtainItemEquip") && issharedfuncdefined("game", "getItemBundleNameFromRef"))) {
            return 0;
        }
        return 1;
    }
    return 0;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb57e
// Size: 0x400
function makeexplosiveusabletag(tagname, isgrenade) {
    self endon("death");
    self endon("makeExplosiveUnusable");
    owner = self.owner;
    weaponname = self.weapon_name;
    if (!isdefined(isgrenade)) {
        isgrenade = 0;
    }
    setselfusable(owner);
    if (isgrenade) {
        self enablemissilehint(1);
    } else {
        self setcursorhint("HINT_NOICON");
    }
    self sethinttag(tagname);
    self setuserange(72);
    setexplosiveusablehintstring(self.weapon_name);
    childthread notusableforjoiningplayers(owner);
    childthread notusableafterownerchange(owner, self);
    while (1) {
        self waittillmatch("trigger", owner);
        if (!isdefined(owner)) {
            continue;
        }
        if (istrue(owner.isjuggernaut)) {
            if (namespace_3c37cb17ade254d::issharedfuncdefined("hud", "showErrorMessage")) {
                owner [[ namespace_3c37cb17ade254d::getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/JUGG_CANNOT_BE_PICKED_UP");
            }
            continue;
        }
        objweapon = undefined;
        if (isdefined(weaponname)) {
            switch (weaponname) {
            case #"hash_5e3fa526a48eaaa5":
                thread namespace_832187ad8517bd27::trophy_pickup();
                break;
            }
            owner thread namespace_7381a1f17171d16c::c4_resetaltdetonpickup();
            owner notify("scavenged_ammo", weaponname);
            attachments = function_6527364c1ecca6c6(weaponname);
            objweapon = makeweapon(weaponname, attachments);
        }
        if (isdefined(objweapon)) {
            equipmentref = namespace_1a507865f681850e::getequipmentreffromweapon(objweapon);
            if (isdefined(equipmentref)) {
                if (owner namespace_1a507865f681850e::hasequipment(equipmentref)) {
                    if (namespace_36f464722d326bbe::isBRStyleGameType() && namespace_aead94004cf4c147::function_7e103028c464ab9a(namespace_38b993c4618e76cd::function_b88cfb4893ceedac(equipmentref)) && owner namespace_1a507865f681850e::getequipmentammo(equipmentref) >= owner namespace_1a507865f681850e::getequipmentmaxammo(equipmentref)) {
                        lootid = namespace_38b993c4618e76cd::getLootIDFromRef(equipmentref);
                        result = owner namespace_aead94004cf4c147::function_e01d9736b2d100ac(lootid, 1);
                        if (istrue(result)) {
                            var_60227bff1e9478cc = spawnstruct();
                            var_60227bff1e9478cc.scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
                            var_60227bff1e9478cc.count = 1;
                            owner namespace_aead94004cf4c147::addItemToBackpack(lootid, var_60227bff1e9478cc);
                        }
                    } else if (owner namespace_1a507865f681850e::getequipmentammo(equipmentref) < owner namespace_1a507865f681850e::getequipmentmaxammo(equipmentref)) {
                        owner namespace_1a507865f681850e::incrementequipmentammo(equipmentref, 1);
                    } else {
                        self.owner namespace_44abc05161e2e2cb::showerrormessage("MP/DENY_EQUIP_PICKUP");
                        continue;
                    }
                } else if (isdefined(level.onnewequipmentpickup)) {
                    [[ level.onnewequipmentpickup ]](self.owner, equipmentref);
                } else if (function_1d982537b9dcb924(self.owner)) {
                    var_fbe755f0978c0369 = function_f3bb4f4911a1beb2("game", "getItemBundleNameFromRef", equipmentref);
                    itembundle = getscriptbundle("itemspawnentry:" + var_fbe755f0978c0369);
                    var_636981592f381ebf = spawnstruct();
                    var_636981592f381ebf.count = 1;
                    var_636981592f381ebf.type = itembundle.scriptable;
                    self.owner function_f3bb4f4911a1beb2("game", "obtainItemEquip", var_636981592f381ebf, 0);
                }
            }
        }
        if (isdefined(weaponname)) {
            switch (weaponname) {
            case #"hash_5e8f81314553dd36":
                var_9d5bc8e32ee3635 = "iw9_proximity_mine_pickup";
                break;
            case #"hash_56ee829cc162271a":
                var_9d5bc8e32ee3635 = "iw9_c4_pickup";
                break;
            case #"hash_6a2e4f9c54756dc7":
                var_9d5bc8e32ee3635 = "iw9_claymore_pickup";
                break;
            case #"hash_432644fc4753dde9":
            case #"hash_435258fc47768fa7":
                var_9d5bc8e32ee3635 = "iw9_claymore_pickup";
                break;
            default:
                var_9d5bc8e32ee3635 = "scavenger_pack_pickup";
                break;
            }
            owner playlocalsound(var_9d5bc8e32ee3635);
        }
        if (isdefined(self.useobj)) {
            self.useobj delete();
        }
        thread deleteexplosive();
        return;
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb985
// Size: 0x12
function makeexplosiveunusuabletag() {
    self notify("makeExplosiveUnusable");
    self makeunusable();
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb99e
// Size: 0xd8
function setexplosiveusablehintstring(weaponname) {
    switch (weaponname) {
    case #"hash_56ee829cc162271a":
    case #"hash_a6444ed2a144f878":
    case #"hash_c466ffaa8712dbde":
    case #"hash_c46d19aa871781fa":
        self sethintstring("EQUIPMENT_HINTS/PICKUP_C4");
        break;
    case #"hash_5e8f81314553dd36":
    case #"hash_e651e30fb2abcd7a":
        self sethintstring("EQUIPMENT_HINTS/PICKUP_AT_MINE");
        break;
    case #"hash_434c3afc4771e33f":
    case #"hash_6a2e4f9c54756dc7":
        self sethintstring("EQUIPMENT_HINTS/PICKUP_CLAYMORE");
        break;
    case #"hash_cac2107b8e726d9d":
        self sethintstring("EQUIPMENT_HINTS/PICKUP_GAS_GRENADE");
        break;
    case #"hash_5e3fa526a48eaaa5":
        self sethintstring("EQUIPMENT_HINTS/PICKUP_TROPHY");
        break;
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba7d
// Size: 0x99
function explosivehandlemovers(parent, var_b5f7c0806632d99b) {
    data = spawnstruct();
    data.linkparent = parent;
    data.deathoverridecallback = &movingplatformdetonate;
    data.endonstring = "death";
    if (namespace_9db09f982acd35b4::is_train_ent(parent)) {
        data.var_49cb2c45d3230ed8 = 1;
        self function_7e73001e97fe87b9(1);
    }
    if (!isdefined(var_b5f7c0806632d99b) || !var_b5f7c0806632d99b) {
        data.invalidparentoverridecallback = &namespace_d7b023c7eb3949d0::moving_platform_empty_func;
    }
    thread namespace_d7b023c7eb3949d0::handle_moving_platforms(data);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb1d
// Size: 0x4b
function explosivetrigger(target, graceperiod, notifystr) {
    if (isplayer(target) && target _hasperk("specialty_delaymine")) {
        target thread namespace_aad14af462a74d08::triggereddelayedexplosion();
        graceperiod = level.delayminetime;
    }
    wait(graceperiod);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xbb6f
// Size: 0x4d3
function getdamageableents(pos, radius, dolos, startradius) {
    ents = [];
    if (!isdefined(dolos)) {
        dolos = 0;
    }
    if (!isdefined(startradius)) {
        startradius = 0;
    }
    radiussq = radius * radius;
    players = level.players;
    for (i = 0; i < players.size; i++) {
        if (!isalive(players[i]) || players[i].sessionstate != "playing") {
            continue;
        }
        playerpos = get_damageable_player_pos(players[i]);
        distsq = distancesquared(pos, playerpos);
        if (distsq < radiussq && (!dolos || weapondamagetracepassed(pos, playerpos, startradius, players[i]))) {
            ents[ents.size] = get_damageable_player(players[i], playerpos);
        }
    }
    grenades = getentarray("grenade", "classname");
    for (i = 0; i < grenades.size; i++) {
        entpos = get_damageable_grenade_pos(grenades[i]);
        distsq = distancesquared(pos, entpos);
        if (distsq < radiussq && (!dolos || weapondamagetracepassed(pos, entpos, startradius, grenades[i]))) {
            ents[ents.size] = get_damageable_grenade(grenades[i], entpos);
        }
    }
    destructibles = getentarray("destructible", "targetname");
    for (i = 0; i < destructibles.size; i++) {
        entpos = destructibles[i].origin;
        distsq = distancesquared(pos, entpos);
        if (distsq < radiussq && (!dolos || weapondamagetracepassed(pos, entpos, startradius, destructibles[i]))) {
            newent = spawnstruct();
            newent.isplayer = 0;
            newent.isadestructable = 0;
            newent.entity = destructibles[i];
            newent.damagecenter = entpos;
            ents[ents.size] = newent;
        }
    }
    destructables = getentarray("destructable", "targetname");
    for (i = 0; i < destructables.size; i++) {
        entpos = destructables[i].origin;
        distsq = distancesquared(pos, entpos);
        if (distsq < radiussq && (!dolos || weapondamagetracepassed(pos, entpos, startradius, destructables[i]))) {
            newent = spawnstruct();
            newent.isplayer = 0;
            newent.isadestructable = 1;
            newent.entity = destructables[i];
            newent.damagecenter = entpos;
            ents[ents.size] = newent;
        }
    }
    var_b261b594e5c09a86 = getentarray("misc_turret", "classname");
    foreach (sentry in var_b261b594e5c09a86) {
        entpos = sentry.origin + (0, 0, 32);
        distsq = distancesquared(pos, entpos);
        if (distsq < radiussq && (!dolos || weapondamagetracepassed(pos, entpos, startradius, sentry))) {
            switch (sentry.model) {
            case #"hash_599bc2324c763cb":
            case #"hash_b0754ce41d06cdb":
            case #"hash_cc323017c363eb7d":
            case #"hash_fb287221737ad80c":
                ents[ents.size] = get_damageable_sentry(sentry, entpos);
                break;
            }
        }
    }
    mines = getentarray("script_model", "classname");
    foreach (mine in mines) {
        if (mine.model != "projectile_bouncing_betty_grenade" && mine.model != "ims_scorpion_body") {
            continue;
        }
        entpos = mine.origin + (0, 0, 32);
        distsq = distancesquared(pos, entpos);
        if (distsq < radiussq && (!dolos || weapondamagetracepassed(pos, entpos, startradius, mine))) {
            ents[ents.size] = get_damageable_mine(mine, entpos);
        }
    }
    return ents;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc04a
// Size: 0x163
function weapondamagetracepassed(from, to, startradius, ent) {
    midpos = undefined;
    diff = to - from;
    if (lengthsquared(diff) < startradius * startradius) {
        return 1;
    }
    dir = vectornormalize(diff);
    midpos = from + (dir[0] * startradius, dir[1] * startradius, dir[2] * startradius);
    trace = namespace_2a184fc4902783dc::_bullet_trace(midpos, to, 0, ent);
    if (getdvarint(@"hash_cfa904aa467801d6") != 0 || getdvarint(@"hash_135469cd54831746") != 0) {
        thread debugprint(from, ".dmg");
        if (isdefined(ent)) {
            thread debugprint(to, "." + ent.classname);
        } else {
            thread debugprint(to, ".undefined");
        }
        if (trace["fraction"] == 1) {
            thread debugline(midpos, to, (1, 1, 1));
        } else {
            thread debugline(midpos, trace["position"], (1, 0.9, 0.8));
            thread debugline(trace["position"], to, (1, 0.4, 0.3));
        }
    }
    return trace["fraction"] == 1;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xc1b5
// Size: 0x12f
function damageent(einflictor, eattacker, idamage, smeansofdeath, objweapon, damagepos, damagedir) {
    if (isplayer(self)) {
        self.damageorigin = damagepos;
        self.entity thread [[ level.callbackplayerdamage ]](einflictor, eattacker, idamage, 0, smeansofdeath, objweapon, damagepos, damagedir, "none", 0);
    } else {
        if (self.isadestructable && (objweapon.basename == "artillery_mp" || objweapon.basename == "claymore_mp" || objweapon.basename == "jup_claymore_mp" || objweapon.basename == "jup_claymore_cp" || objweapon.basename == "stealth_bomb_mp")) {
            return;
        }
        self.entity notify("damage", idamage);
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc2eb
// Size: 0x48
function debugline(a, b, color) {
    /#
        for (i = 0; i < 600; i++) {
            line(a, b, color);
            wait(0.05);
        }
    #/
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xc33a
// Size: 0x130
function debugcircle(center, radius, color, segments) {
    /#
        if (!isdefined(segments)) {
            segments = 16;
        }
        anglefrac = 360 / segments;
        var_8af33769f877b5d6 = [];
        for (i = 0; i < segments; i++) {
            angle = anglefrac * i;
            var_8a9f895755fd607e = cos(angle) * radius;
            var_d867033ab311670b = sin(angle) * radius;
            x = center[0] + var_8a9f895755fd607e;
            y = center[1] + var_d867033ab311670b;
            z = center[2];
            var_8af33769f877b5d6[var_8af33769f877b5d6.size] = (x, y, z);
        }
        for (i = 0; i < var_8af33769f877b5d6.size; i++) {
            start = var_8af33769f877b5d6[i];
            if (i + 1 >= var_8af33769f877b5d6.size) {
                end = var_8af33769f877b5d6[0];
            } else {
                end = var_8af33769f877b5d6[i + 1];
            }
            thread debugline(start, end, color);
        }
    #/
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc471
// Size: 0x3f
function debugprint(var_cdcd3178f5176585, var_e94b62032a5ae9c3) {
    /#
        for (i = 0; i < 600; i++) {
            print3d(var_cdcd3178f5176585, var_e94b62032a5ae9c3);
            wait(0.05);
        }
    #/
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc4b7
// Size: 0x16f
function onweapondamage(einflictor, objweapon, meansofdeath, damage, eattacker) {
    self endon("death_or_disconnect");
    if (!isreallyalive(self)) {
        return;
    }
    var_49e6ef3edadd524e = function_f581838ce4328f7a(objweapon);
    switch (var_49e6ef3edadd524e) {
    case #"hash_cd288ca229b9529":
    case #"hash_45125a8f171b4fb9":
    case #"hash_4c57dd619266bfc9":
    case #"hash_4c57df619266c2ef":
    case #"hash_8670ac083666f3a4":
    case #"hash_89a5836ac6557236":
    case #"hash_c9a436974fe60919":
    case #"hash_e042760d17966848":
        break;
    case #"hash_a0319e349a692b8f":
        _shellshock("thermite_mp", "explosion", 0.5);
        break;
    case #"hash_36b7174a04de8799":
    case #"hash_5d11ac1131cddab1":
    case #"hash_7c03088193266bc4":
    case #"hash_9d57562863499a06":
    case #"hash_fa1e80f6bd5b8e72":
        _shellshock("frag_grenade_mp", "explosion", 2);
        break;
    case #"hash_76e24481ceb557a7":
        _shellshock("light_damage_mp", "damage", 0.2);
        break;
    default:
        namespace_6de0840c25c8dc22::shellshockondamage(meansofdeath, damage);
        break;
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc62d
// Size: 0x11d
function updatelastweapon() {
    self endon("death_or_disconnect");
    self endon("faux_spawn");
    self.lastnormalweaponobj = ter_op(isdefined(self.spawnweaponobj), self.spawnweaponobj, nullweapon());
    self.lastweaponobj = ter_op(isdefined(self.spawnweaponobj), self.spawnweaponobj, nullweapon());
    self.lastcacweaponobj = ter_op(isdefined(self.spawnweaponobj) && iscacprimaryorsecondary(self.spawnweaponobj), self.spawnweaponobj, nullweapon());
    setlastdroppableweaponobj(ter_op(isdefined(self.spawnweaponobj), self.spawnweaponobj, nullweapon()));
    while (1) {
        var_82533969b4683de4 = self waittill("weapon_change");
        self.lastweaponobj = var_82533969b4683de4;
        if (isnormallastweapon(var_82533969b4683de4)) {
            self.lastnormalweaponobj = var_82533969b4683de4;
        }
        if (isdroppableweapon(var_82533969b4683de4)) {
            setlastdroppableweaponobj(var_82533969b4683de4);
        }
        if (iscacprimaryorsecondary(var_82533969b4683de4)) {
            self.lastcacweaponobj = var_82533969b4683de4;
        }
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc751
// Size: 0xb5
function isnormallastweapon(objweapon) {
    if (objweapon.basename == "none") {
        return 0;
    }
    if (objweapon.classname == "turret") {
        return 0;
    }
    if (issuperweapon(objweapon.basename)) {
        return 0;
    }
    if (iskillstreakweapon(objweapon.basename)) {
        return 0;
    }
    if (isspecialmeleeweapon(objweapon)) {
        return 0;
    }
    if (isgunlessweapon(objweapon)) {
        return 0;
    }
    if (function_3f15e5e526ff94ce(objweapon)) {
        return 0;
    }
    if (objweapon.inventorytype != "primary" && objweapon.inventorytype != "altmode") {
        return 0;
    }
    return 1;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc80e
// Size: 0xe0
function isdroppableweapon(objweapon) {
    if (objweapon.basename == "none") {
        return 0;
    }
    if (isfistweapon(objweapon.basename)) {
        return 0;
    }
    if (isbombplantweapon(objweapon.basename)) {
        return 0;
    }
    if (iskillstreakweapon(objweapon.basename)) {
        return 0;
    }
    if (issuperweapon(objweapon.basename)) {
        return 0;
    }
    if (objweapon.inventorytype != "primary") {
        return 0;
    }
    if (objweapon.classname == "turret") {
        return 0;
    }
    if (!iscacprimaryweapon(objweapon.basename) && !iscacsecondaryweapon(objweapon.basename)) {
        return 0;
    }
    if (class::function_72ce982d9fc26f1c(objweapon)) {
        return 0;
    }
    return 1;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc8f6
// Size: 0xd5
function updatemovespeedonweaponchange() {
    self endon("death_or_disconnect");
    self endon("faux_spawn");
    while (1) {
        var_82533969b4683de4 = self waittill("weapon_change");
        if (var_82533969b4683de4.basename == "none") {
            continue;
        } else if (issuperweapon(var_82533969b4683de4.basename)) {
            updatemovespeedscale();
            continue;
        } else if (iskillstreakweapon(var_82533969b4683de4.basename)) {
            continue;
        } else if (var_82533969b4683de4.basename == "iw9_me_fists_mp_ls") {
            updatemovespeedscale();
            continue;
        } else if (var_82533969b4683de4.inventorytype != "primary" && var_82533969b4683de4.inventorytype != "altmode") {
            continue;
        }
        updatemovespeedscale();
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9d2
// Size: 0x111
function getweaponspeedslowest() {
    var_6155ff1652d3374f = 2;
    self.weaponlist = self getweaponslistprimaries();
    if (self.weaponlist.size) {
        foreach (weapon in self.weaponlist) {
            if (issuperweapon(weapon)) {
                weaponspeed = namespace_85d036cb78063c4a::getmovespeedforsuperweapon(weapon);
            } else if (iskillstreakweapon(weapon)) {
                weaponspeed = namespace_9abe40d2af041eb2::function_3f76336d7d0b7587(weapon);
            } else if (isgamemodeweapon(weapon)) {
                weaponspeed = getgamemodeweaponspeed(weapon);
            } else {
                weaponspeed = getweaponspeed(weapon);
            }
            if (weaponspeed == 0) {
                continue;
            }
            if (weaponspeed < var_6155ff1652d3374f) {
                var_6155ff1652d3374f = weaponspeed;
            }
        }
        /#
            if (var_6155ff1652d3374f == 2) {
                /#
                    assertmsg("weapon_pickup_cancelled");
                #/
            }
        #/
    } else {
        var_6155ff1652d3374f = 0.85;
    }
    var_6155ff1652d3374f = clampweaponspeed(var_6155ff1652d3374f);
    return var_6155ff1652d3374f;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcaeb
// Size: 0xc5
function getweaponspeed(weapon) {
    rootweapon = getweaponrootname(weapon);
    /#
        if (isdefined(rootweapon) && (!isdefined(level.weaponmapdata[rootweapon]) || !isdefined(level.weaponmapdata[rootweapon].speed))) {
            println("armor_timeout" + rootweapon + "attackerbulletwhizby");
            return 1;
        }
    #/
    if (!isdefined(rootweapon) || !isdefined(level.weaponmapdata[rootweapon]) || !isdefined(level.weaponmapdata[rootweapon].speed)) {
        /#
            assertmsg("Invalid weapon passed to getWeaponSpeed(): " + rootweapon);
        #/
        return 1;
    }
    return level.weaponmapdata[rootweapon].speed;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcbb8
// Size: 0x11
function getgamemodeweaponspeed(weapon) {
    return 0.93;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcbd1
// Size: 0x3e
function clampweaponspeed(value) {
    /#
        assertex(value >= 0 && value <= 1, "clampWeaponSpeed() passed invalid value: " + value);
    #/
    return clamp(value, 0, 1);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc17
// Size: 0x100
function updateviewkickscale(perc) {
    if (isdefined(perc)) {
        self.viewkickscale = perc;
    }
    if (isdefined(self.overchargeviewkickscale)) {
        perc = self.overchargeviewkickscale;
    } else if (isdefined(self.overrideviewkickscale)) {
        perc = self.overrideviewkickscale;
        var_6651def69449c4a3 = weapon::weapongetflinchtype(self getcurrentweapon());
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
    /#
        assertex(perc >= 0 && perc <= 1, "updateViewKickScale() called with value outside of 0.0 - 1.0");
    #/
    perc = clamp(perc, 0, 1);
    self setviewkickscale(perc);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd1e
// Size: 0x3b5
function updatemovespeedscale() {
    var_8f053b6f8634c100 = undefined;
    if (isdefined(self.playerstreakspeedscale)) {
        var_8f053b6f8634c100 = 1;
        var_8f053b6f8634c100 = var_8f053b6f8634c100 + self.playerstreakspeedscale;
    } else {
        var_8f053b6f8634c100 = getplayerspeedbyweapon(self);
        if (isdefined(self.overrideweaponspeed_speedscale)) {
            var_8f053b6f8634c100 = self.overrideweaponspeed_speedscale;
        }
        var_f30c40867c01e4f9 = self.chill_data;
        if (isdefined(var_f30c40867c01e4f9) && isdefined(var_f30c40867c01e4f9.speedmod)) {
            var_8f053b6f8634c100 = var_8f053b6f8634c100 + var_f30c40867c01e4f9.speedmod;
        }
        if (isdefined(self.gasspeedmod)) {
            var_8f053b6f8634c100 = var_8f053b6f8634c100 + self.gasspeedmod;
        }
        if (isdefined(self.var_2ceb4ad39cf2f904)) {
            var_8f053b6f8634c100 = var_8f053b6f8634c100 + self.var_2ceb4ad39cf2f904;
        }
        if (isdefined(self.disabledspeedmod)) {
            var_8f053b6f8634c100 = var_8f053b6f8634c100 + self.disabledspeedmod;
        }
        if (isdefined(self.var_529eb36595b1d4bf)) {
            var_8f053b6f8634c100 = var_8f053b6f8634c100 + self.var_529eb36595b1d4bf;
        }
        if (isdefined(self.var_db8213973d2bb844)) {
            var_8f053b6f8634c100 = var_8f053b6f8634c100 + self.var_db8213973d2bb844;
        }
        if (isdefined(self.speedonkillmod)) {
            var_8f053b6f8634c100 = var_8f053b6f8634c100 + self.speedonkillmod;
        }
        if (isdefined(self.momentumspeedincrease)) {
            var_8f053b6f8634c100 = var_8f053b6f8634c100 + self.momentumspeedincrease;
        }
    }
    self.weaponspeed = var_8f053b6f8634c100;
    /#
        assert(isdefined(self.weaponspeed));
    #/
    /#
        assert(isdefined(self.movespeedscaler));
    #/
    if (!isdefined(self.combatspeedscalar)) {
        self.combatspeedscalar = 1;
    }
    var_8f053b6f8634c100 = var_8f053b6f8634c100 + self.movespeedscaler - 1;
    var_8f053b6f8634c100 = var_8f053b6f8634c100 + self.combatspeedscalar - 1;
    if (isdefined(self.var_aa6c008d413b90cb)) {
        foreach (var_f0e117a5cc9f6c88 in self.var_aa6c008d413b90cb) {
            var_8f053b6f8634c100 = var_8f053b6f8634c100 + var_f0e117a5cc9f6c88;
        }
    }
    if (isdefined(self.var_c2549f6bfa6abbd7)) {
        foreach (var_e6e22cd7f000a9f8 in self.var_c2549f6bfa6abbd7) {
            var_8f053b6f8634c100 = var_8f053b6f8634c100 * var_e6e22cd7f000a9f8;
        }
    }
    var_4c58179ed4c648b = ter_op(_hasperk("specialty_super_speed_script"), getdvarfloat(@"hash_94084550cb0f64e7", 2), 1.08);
    var_8f053b6f8634c100 = clamp(var_8f053b6f8634c100, 0, var_4c58179ed4c648b);
    if (isdefined(self.var_86d77db605c0c948)) {
        var_8f053b6f8634c100 = var_8f053b6f8634c100 + self.var_86d77db605c0c948 - 1;
    }
    if (isdefined(self.fastcrouchspeedmod)) {
        var_8f053b6f8634c100 = var_8f053b6f8634c100 + self.fastcrouchspeedmod;
    }
    if (!isdefined(self.playerstreakspeedscale) && isdefined(self.var_740c1298f33f5910)) {
        var_8f053b6f8634c100 = var_8f053b6f8634c100 + self.var_740c1298f33f5910;
    }
    if (isdefined(self.var_9aa499f0db2dcb35)) {
        var_8f053b6f8634c100 = var_8f053b6f8634c100 + self.var_9aa499f0db2dcb35;
    }
    if (isdefined(self.var_4d52ef6a17e52924) && istrue(self.inlaststand) && !isdefined(self.var_12bfb031c0a0efd8)) {
        var_8f053b6f8634c100 = var_8f053b6f8634c100 + self.var_4d52ef6a17e52924;
    }
    if (isdefined(self.var_ce58e8eff85f7366)) {
        var_8f053b6f8634c100 = var_8f053b6f8634c100 + self.var_ce58e8eff85f7366;
    }
    if (isdefined(self.var_7e94104134f2f40b)) {
        var_8f053b6f8634c100 = var_8f053b6f8634c100 + self.var_7e94104134f2f40b;
    }
    self setmovespeedscale(var_8f053b6f8634c100);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd0da
// Size: 0x38
function addExtraMoveSpeed(str_id, value) {
    if (!isdefined(self.var_aa6c008d413b90cb)) {
        self.var_aa6c008d413b90cb = [];
    }
    self.var_aa6c008d413b90cb[str_id] = value;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd119
// Size: 0x3d
function removeExtraMoveSpeed(str_id) {
    /#
        assert(isdefined(self.var_aa6c008d413b90cb), "it must have added extra move speed");
    #/
    self.var_aa6c008d413b90cb = utility::array_remove_key(self.var_aa6c008d413b90cb, str_id);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd15d
// Size: 0x38
function function_6ebef9d9e0d137b2(str_id, value) {
    if (!isdefined(self.var_c2549f6bfa6abbd7)) {
        self.var_c2549f6bfa6abbd7 = [];
    }
    self.var_c2549f6bfa6abbd7[str_id] = value;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd19c
// Size: 0x3d
function function_20187c06010f854f(str_id) {
    /#
        assert(isdefined(self.var_c2549f6bfa6abbd7), "it must have added scale move speed");
    #/
    self.var_c2549f6bfa6abbd7 = utility::array_remove_key(self.var_c2549f6bfa6abbd7, str_id);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd1e0
// Size: 0x3
function function_e5642864900c1064() {
    
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd1ea
// Size: 0x55
function function_dd1698252c31d637(perkname) {
    if (!isdefined(self.var_b6ad5b4211aca6f2)) {
        self.var_b6ad5b4211aca6f2 = [];
    }
    if (array_contains(self.var_b6ad5b4211aca6f2, perkname)) {
        return;
    }
    perk::giveperk(perkname);
    self.var_b6ad5b4211aca6f2[self.var_b6ad5b4211aca6f2.size] = perkname;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd246
// Size: 0xa7
function function_ec132c173d4532ee(perkname) {
    if (isdefined(self.var_b6ad5b4211aca6f2)) {
        var_5de1358070f8daaf = 0;
        var_716f88efb2a15bfd = [];
        foreach (var_780be7dac4190bb5 in self.var_b6ad5b4211aca6f2) {
            if (!var_5de1358070f8daaf) {
                jumpiffalse(var_780be7dac4190bb5 == perkname) LOC_00000083;
                perk::removeperk(var_780be7dac4190bb5);
                var_5de1358070f8daaf = 1;
            } else {
            LOC_00000083:
                var_716f88efb2a15bfd[var_716f88efb2a15bfd.size] = var_780be7dac4190bb5;
            }
        }
        self.var_b6ad5b4211aca6f2 = var_716f88efb2a15bfd;
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd2f4
// Size: 0x2b
function function_4c614e296b3a410a(perkname) {
    if (!isdefined(self.var_b6ad5b4211aca6f2)) {
        return 0;
    }
    return array_contains(self.var_b6ad5b4211aca6f2, perkname);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd327
// Size: 0x1ba
function getplayerspeedbyweapon(player) {
    weaponspeed = 1;
    self.weaponlist = self getweaponslistprimaries();
    if (!self.weaponlist.size) {
        weaponspeed = 0.85;
    } else {
        objweapon = self getcurrentweapon();
        if (!isdefined(objweapon)) {
            weaponspeed = getweaponspeedslowest();
        } else if (weapon::issuperweapon(objweapon.basename)) {
            weaponspeed = supers::getmovespeedforsuperweapon(objweapon);
        } else if (weapon::isgamemodeweapon(objweapon.basename)) {
            weaponspeed = getgamemodeweaponspeed(objweapon);
        } else if (weapon::iskillstreakweapon(objweapon.basename)) {
            weaponspeed = namespace_8319cdbe938cd234::function_3f76336d7d0b7587(objweapon);
        } else if (weapon::isgunlessweapon(objweapon.basename)) {
            weaponspeed = 0.85;
        } else {
            if (objweapon.inventorytype != "primary" && objweapon.inventorytype != "altmode" || weapon::ismeleeoverrideweapon(objweapon)) {
                if (isdefined(self.lastnormalweaponobj)) {
                    objweapon = self.lastnormalweaponobj;
                } else {
                    objweapon = undefined;
                }
            }
            if (!self hasweapon(objweapon)) {
                weaponspeed = getweaponspeedslowest();
            } else {
                weaponspeed = getweaponspeed(objweapon);
                /#
                    if (!isdefined(weaponspeed) || weaponspeed == 0) {
                        weaponspeed = 1;
                    }
                #/
                if (game_utility::function_b2c4b42f9236924()) {
                    class = weaponclass(objweapon);
                    if (isdefined(level.var_26109c02a53cea84) && isdefined(level.var_26109c02a53cea84[class])) {
                        weaponspeed = level.var_26109c02a53cea84[class];
                    }
                }
            }
        }
    }
    weaponspeed = clampweaponspeed(weaponspeed);
    return weaponspeed;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd4e9
// Size: 0xef
function stancerecoiladjuster() {
    if (!isplayer(self)) {
        return;
    }
    self endon("death_or_disconnect");
    self endon("faux_spawn");
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
        utility::waittill_any_3("adjustedStance", "sprint_begin", "weapon_change");
        wait(0.5);
        stance = self getstance();
        stancerecoilupdate(stance);
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd5df
// Size: 0x12b
function stancerecoilupdate(stance) {
    weapon = self getcurrentprimaryweapon();
    var_8f7fad0b4f9853bf = 0;
    if (isrecoilreducingweapon(weapon)) {
        var_8f7fad0b4f9853bf = getrecoilreductionvalue();
    }
    if (stance == "prone") {
        var_3a88df1a7869a537 = weapon::getweapongroup(weapon);
        if (var_3a88df1a7869a537 == "weapon_lmg") {
            weapon::setrecoilscale(0, 0);
        } else if (var_3a88df1a7869a537 == "weapon_sniper") {
            if (weapon hasattachment("barrelbored")) {
                weapon::setrecoilscale(0, 0 + var_8f7fad0b4f9853bf);
            } else {
                weapon::setrecoilscale(0, 0 + var_8f7fad0b4f9853bf);
            }
        } else {
            weapon::setrecoilscale();
        }
    } else if (stance == "crouch") {
        var_3a88df1a7869a537 = weapon::getweapongroup(weapon);
        if (var_3a88df1a7869a537 == "weapon_lmg") {
            weapon::setrecoilscale(0, 0);
        } else if (var_3a88df1a7869a537 == "weapon_sniper") {
            if (weapon hasattachment("barrelbored")) {
                weapon::setrecoilscale(0, 0 + var_8f7fad0b4f9853bf);
            } else {
                weapon::setrecoilscale(0, 0 + var_8f7fad0b4f9853bf);
            }
        } else {
            weapon::setrecoilscale();
        }
    } else if (var_8f7fad0b4f9853bf > 0) {
        weapon::setrecoilscale(0, var_8f7fad0b4f9853bf);
    } else {
        weapon::setrecoilscale();
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd711
// Size: 0x105
function deleteallgrenades() {
    if (isdefined(level.grenades)) {
        foreach (grenade in level.grenades) {
            if (isdefined(grenade) && !istrue(grenade.exploding) && !isplantedequipment(grenade)) {
                grenade delete();
            }
        }
    }
    if (isdefined(level.missiles)) {
        foreach (missile in level.missiles) {
            if (isdefined(missile) && !istrue(missile.exploding) && !isplantedequipment(missile)) {
                missile delete();
            }
        }
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd81d
// Size: 0x5
function minegettwohitthreshold() {
    return 80;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd82a
// Size: 0x482
function minedamagemonitor(var_ed674bb1196f8987) {
    self endon("mine_selfdestruct");
    self endon("death");
    self setcandamage(1);
    self.maxhealth = 100000;
    self.health = self.maxhealth;
    attacker = undefined;
    hits = utility::function_53c4c53197386572(var_ed674bb1196f8987, 1);
    damagefeedback = "hitequip";
    while (1) {
        inflictor = normal = angles = origin = objweapon = idflags = partname = tagname = modelname = type = point = direction_vec = attacker = damage = self waittill("damage");
        objweapon = weapon::mapweapon(objweapon, inflictor);
        var_7a541e653b7997db = attacker;
        if (!isplayer(attacker) && !isagent(attacker)) {
            if (isdefined(attacker.owner) && isplayer(attacker.owner)) {
                var_7a541e653b7997db = attacker.owner;
            }
        }
        if (!isplayer(var_7a541e653b7997db) && !isagent(var_7a541e653b7997db)) {
            continue;
        }
        if (isdefined(objweapon) && isendstr(objweapon.basename, "betty_mp")) {
            continue;
        }
        if (!friendlyfirecheck(self.owner, var_7a541e653b7997db)) {
            continue;
        }
        if (damage::non_player_should_ignore_damage(var_7a541e653b7997db, objweapon, inflictor, type)) {
            continue;
        }
        if (istrue(objweapon.isemp)) {
            continue;
        }
        var_8c97d5d29e3f5523 = damage::isfmjdamage(objweapon, type) || damage >= 80 ? 2 : 1;
        hits = hits - var_8c97d5d29e3f5523;
        equipmenthit(self.owner, var_7a541e653b7997db, objweapon, type);
        if (hits <= 0) {
            break;
        } else {
            var_7a541e653b7997db damagefeedback::updatedamagefeedback(damagefeedback);
        }
    }
    self notify("mine_destroyed");
    self notify("enemy_destroyed_equipment", attacker);
    if (isdefined(type) && (issubstr(type, "MOD_GRENADE") || issubstr(type, "MOD_EXPLOSIVE"))) {
        self.waschained = 1;
    }
    if (isdefined(idflags) && idflags & 8) {
        self.wasdamagedfrombulletpenetration = 1;
    }
    if (isdefined(idflags) && idflags & 256) {
        self.wasdamagedfrombulletricochet = 1;
    }
    self.wasdamaged = 1;
    if (isdefined(var_7a541e653b7997db)) {
        self.damagedby = var_7a541e653b7997db;
    }
    if (isdefined(self.killcament)) {
        self.killcament.damagedby = var_7a541e653b7997db;
    }
    if (isplayer(var_7a541e653b7997db)) {
        var_7a541e653b7997db damagefeedback::updatedamagefeedback(damagefeedback);
        if (var_7a541e653b7997db != self.owner && isdefined(self.owner.team) && var_7a541e653b7997db.team != self.owner.team) {
            var_7a541e653b7997db killstreaks::givescoreforequipment(self, objweapon);
            var_7a541e653b7997db namespace_20260f65229aa888::equipmentdestroyed(self);
            challenges::equipmentdestroyed(inflictor, attacker, damage, idflags, undefined, objweapon, undefined, var_7a541e653b7997db.modifiers);
        }
    }
    if (level.teambased) {
        if (!istrue(self.var_e926abd3e5970492) && isdefined(var_7a541e653b7997db) && isdefined(var_7a541e653b7997db.pers) && isdefined(var_7a541e653b7997db.pers["team"]) && isdefined(self.owner) && isdefined(self.owner.pers) && isdefined(self.owner.pers["team"])) {
            if (var_7a541e653b7997db.pers["team"] != self.owner.pers["team"]) {
                var_7a541e653b7997db notify("destroyed_equipment");
            }
        }
    } else if (isdefined(self.owner) && isdefined(var_7a541e653b7997db) && var_7a541e653b7997db != self.owner) {
        var_7a541e653b7997db notify("destroyed_equipment");
    }
    challenges::minedestroyed(self, var_7a541e653b7997db, type);
    self notify("detonateExplosive", var_7a541e653b7997db);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdcb3
// Size: 0x3d
function mineselfdestruct() {
    self endon("mine_triggered");
    self endon("mine_destroyed");
    self endon("death");
    wait(level.mineselfdestructtime + randomfloat(0.4));
    self notify("mine_selfdestruct");
    self notify("detonateExplosive");
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdcf7
// Size: 0x23a
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
    waitframe();
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
    onexplodevfx = utility::ter_op(isdefined(config.onexplodevfx), config.onexplodevfx, level.mine_explode);
    playfx(onexplodevfx, tagorigin);
    minedamagemin = utility::ter_op(isdefined(config.minedamagemin), config.minedamagemin, level.minedamagemin);
    minedamagemax = utility::ter_op(isdefined(config.minedamagemax), config.minedamagemax, level.minedamagemax);
    minedamageradius = utility::ter_op(isdefined(config.minedamageradius), config.minedamageradius, level.minedamageradius);
    if (minedamagemax > 0) {
        self radiusdamage(self.origin, minedamageradius, minedamagemax, minedamagemin, attacker, "MOD_EXPLOSIVE", self.weapon_name);
    }
    if (isdefined(self.owner)) {
        self.owner thread dialog::leaderdialogonplayer("mine_destroyed", undefined, undefined, self.origin);
    }
    wait(0.2);
    deleteexplosive();
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf38
// Size: 0x22e
function deleteplacedequipment(var_475474534fba73ef) {
    if (isdefined(self.plantedlethalequip)) {
        foreach (equip in self.plantedlethalequip) {
            if (isdefined(equip)) {
                equip deleteexplosive();
            }
        }
    }
    self.plantedlethalequip = [];
    if (isdefined(self.plantedtacticalequip)) {
        foreach (equip in self.plantedtacticalequip) {
            if (isdefined(equip)) {
                equip deleteexplosive();
            }
        }
    }
    self.plantedtacticalequip = [];
    var_8442dbb6e918259f = game_utility::isanymlgmatch() || istrue(level.superglobals.var_5b66ed80c98f795b);
    if (isdefined(var_475474534fba73ef)) {
        var_8442dbb6e918259f = var_475474534fba73ef;
    }
    if (isdefined(self.plantedhackedequip)) {
        foreach (index, equip in self.plantedhackedequip) {
            if (isdefined(equip) && (!var_8442dbb6e918259f || !istrue(equip.issuper))) {
                equip deleteexplosive();
                self.plantedhackedequip[index] = undefined;
            }
        }
        self.plantedhackedequip = utility::array_removeundefined(self.plantedhackedequip);
    }
    if (var_8442dbb6e918259f && isdefined(self.plantedsuperequip)) {
        foreach (index, equip in self.plantedsuperequip) {
            equip deleteexplosive();
            self.plantedsuperequip[index] = undefined;
        }
        self.plantedsuperequip = utility::array_removeundefined(self.plantedsuperequip);
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe16d
// Size: 0x12a
function deletedisparateplacedequipment() {
    lethal = equipment::getcurrentequipment("primary");
    foreach (equip in self.plantedlethalequip) {
        if (isdefined(equip)) {
            if (!isdefined(equip.equipmentref) || !isdefined(lethal) || equip.equipmentref != lethal) {
                equip deleteexplosive();
            }
        }
    }
    tactical = equipment::getcurrentequipment("secondary");
    foreach (equip in self.plantedtacticalequip) {
        if (isdefined(equip)) {
            if (!isdefined(equip.equipmentref) || !isdefined(tactical) || equip.equipmentref != tactical) {
                equip deleteexplosive();
            }
        }
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe29e
// Size: 0x10b
function equipmentdeletevfx(position, angles) {
    if (isdefined(position)) {
        if (isdefined(angles)) {
            forward = anglestoforward(angles);
            up = anglestoup(angles);
            playfx(utility::getfx("equipment_explode"), position, forward, up);
            playfx(utility::getfx("equipment_smoke"), position, forward, up);
        } else {
            playfx(utility::getfx("equipment_explode"), position);
            playfx(utility::getfx("equipment_smoke"), position);
        }
        playsoundatpos(position, "mp_killstreak_disappear");
    } else if (isdefined(self)) {
        origin = self.origin;
        forward = anglestoforward(self.angles);
        up = anglestoup(self.angles);
        playfx(utility::getfx("equipment_explode"), origin, forward, up);
        playfx(utility::getfx("equipment_smoke"), origin, forward, up);
        self playsound("mp_killstreak_disappear");
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3b0
// Size: 0x202
function grenadestuckto(grenade, stuckto, var_5f6265d8d7ee3c8) {
    if (!isdefined(grenade)) {
        return;
    }
    if (!isdefined(self)) {
        grenade.stuckenemyentity = stuckto;
        stuckto.stuckbygrenade = grenade;
        stuckto.stuckbygrenadeowner = grenade.owner;
    } else if (level.teambased && utility::is_equal(stuckto.team, self.team)) {
        grenade.isstuck = "friendly";
    } else {
        var_d658f0b6bc4fd513 = undefined;
        var_d5f11d86f917656 = undefined;
        if (isdefined(grenade.weapon_name)) {
            switch (grenade.weapon_name) {
            case #"hash_4b87af60037f526f":
                var_d658f0b6bc4fd513 = "semtex_stuck";
                var_d5f11d86f917656 = #"hash_cafa7ad7442c35d5";
                break;
            case #"hash_ab3485fa6834de47":
                var_d658f0b6bc4fd513 = "molotov_stuck";
                var_d5f11d86f917656 = #"hash_cafa7ad7442c35d5";
                break;
            case #"hash_4c7de5619284e175":
                var_d658f0b6bc4fd513 = "thermite_attacker_stuck";
                var_d5f11d86f917656 = #"hash_cafa7ad7442c35d5";
                break;
            case #"hash_4a85ee2b82965fe2":
                var_d658f0b6bc4fd513 = "sonar_pulse_stuck";
                break;
            case #"hash_954bb5f200a1b95a":
                var_d658f0b6bc4fd513 = "shock_stick_stuck";
                var_d5f11d86f917656 = #"hash_cafa7ad7442c35d5";
                break;
            case #"hash_c4b9b21ecac2ced4":
            case #"hash_d6565ec12efca627":
                var_d658f0b6bc4fd513 = "bunkerbuster_stuck";
                var_d5f11d86f917656 = #"hash_cafa7ad7442c35d5";
                break;
            }
        }
        grenade.isstuck = "enemy";
        grenade.stuckenemyentity = stuckto;
        stuckto.stuckbygrenade = grenade;
        stuckto.stuckbygrenadeowner = grenade.owner;
        self notify("grenade_stuck_enemy");
        if (isdefined(var_d5f11d86f917656)) {
            level thread namespace_20260f65229aa888::trysaylocalsound(stuckto, var_d5f11d86f917656);
        }
        if (!istrue(var_5f6265d8d7ee3c8)) {
            grenadestucktosplash(var_d658f0b6bc4fd513, stuckto);
        }
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe5b9
// Size: 0x86
function grenadestucktosplash(var_d658f0b6bc4fd513, stuckto) {
    player = self;
    if ((isplayer(stuckto) || isagent(stuckto)) && isdefined(var_d658f0b6bc4fd513)) {
        if (isdefined(player.owner)) {
            player = player.owner;
        }
        if (function_3cb5da19764baa3() != "JUP") {
            player hud_message::showsplash(var_d658f0b6bc4fd513, undefined, undefined, undefined, 1, undefined, 1);
        }
    }
    player thread points::doScoreEvent(#"hash_3b7863dcdff98b13");
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe646
// Size: 0xc
function outlineequipmentforowner(equipment) {
    
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe659
// Size: 0x37
function outlinesuperequipment(equipment, player) {
    if (level.teambased) {
        thread outlinesuperequipmentforteam(equipment, player);
    } else {
        thread outlinesuperequipmentforplayer(equipment, player);
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe697
// Size: 0x4c
function outlinesuperequipmentforteam(equipment, player) {
    id = outline::outlineenableforteam(equipment, player.team, "outline_nodepth_cyan", "killstreak");
    equipment waittill("death");
    outline::outlinedisable(id, equipment);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe6ea
// Size: 0x42
function outlinesuperequipmentforplayer(equipment, player) {
    id = outline::outlineenableforplayer(equipment, player, "outline_nodepth_cyan", "killstreak");
    equipment waittill("death");
    outline::outlinedisable(id, equipment);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe733
// Size: 0xd
function grenadeheldatdeath() {
    return istrue(self.grenadeheldatdeath);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe748
// Size: 0x18
function grenadehealthatdeathframeupdatecallback() {
    self.grenadeheldatdeath = !isnullweapon(self getheldoffhand());
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe767
// Size: 0x6a
function trace_impale(vpoint, endpoint) {
    contents = physics_createcontents([0:"physicscontents_glass", 1:"physicscontents_missileclip", 2:"physicscontents_vehicle", 3:"physicscontents_item"]);
    trace = trace::ray_trace_detail(vpoint, endpoint, level.players, contents, undefined, 1);
    return trace;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe7d9
// Size: 0x27
function impale_endpoint(vpoint, vdir) {
    endpoint = vpoint + vdir * 4096;
    return endpoint;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe808
// Size: 0x227
function impale(eattacker, evictim, objweapon, var_f98a651c69c13cba, vpoint, vdir, shitloc, var_920ff4456ce9a2fc, var_19f6f25777706f34) {
    evictim endon("death_or_disconnect");
    if (!isdefined(evictim.body)) {
        return;
    }
    playfx(utility::getfx("penetration_railgun_impact"), vpoint);
    endpoint = impale_endpoint(vpoint, vdir);
    trace = trace_impale(vpoint, endpoint);
    endpoint = trace["position"] - vdir * 12;
    var_80c97b146b16be3f = length(endpoint - vpoint);
    flighttime = var_80c97b146b16be3f / 1000;
    flighttime = max(flighttime, 0.05);
    /#
        assertex(var_80c97b146b16be3f / flighttime <= 1100, "Impaling projectile moving too fast!  Ragdoll will be unstable.");
    #/
    if (trace["hittype"] != "hittype_world") {
        flighttime = 0;
    }
    var_6cb8a80078d195d0 = flighttime > 0.05;
    if (isdefined(evictim)) {
        evictim.body startragdoll();
    }
    waitframe();
    if (var_6cb8a80078d195d0) {
        var_a0480a10ee4e345f = vdir;
        var_c323f0cb880a051f = anglestoup(eattacker.angles);
        var_c1148ff802be2880 = vectorcross(var_a0480a10ee4e345f, var_c323f0cb880a051f);
        var_483e4e4e5b094be2 = utility::spawn_tag_origin(vpoint, axistoangles(var_a0480a10ee4e345f, var_c1148ff802be2880, var_c323f0cb880a051f));
        var_483e4e4e5b094be2 moveto(endpoint, flighttime);
        constraint = spawnragdollconstraint(evictim.body, shitloc, var_920ff4456ce9a2fc, var_19f6f25777706f34);
        constraint.origin = var_483e4e4e5b094be2.origin;
        constraint.angles = var_483e4e4e5b094be2.angles;
        constraint linkto(var_483e4e4e5b094be2);
        if (flighttime > 1) {
            thread impale_detachaftertime(constraint, 1);
        }
        thread impale_cleanup(evictim, var_483e4e4e5b094be2, flighttime + 0.25);
        var_483e4e4e5b094be2 thread impale_effects(endpoint, flighttime);
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xea36
// Size: 0x22
function impale_detachaftertime(constraint, time) {
    wait(time);
    if (isdefined(constraint)) {
        constraint delete();
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xea5f
// Size: 0x3a
function impale_effects(endpoint, time) {
    wait(clamp(time - 0.05, 0.05, 20));
    playfx(utility::getfx("penetration_railgun_impact"), endpoint);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeaa0
// Size: 0x36
function impale_cleanup(evictim, var_483e4e4e5b094be2, time) {
    if (isdefined(evictim)) {
        evictim utility::waittill_any_timeout_1(time, "death_or_disconnect");
    }
    var_483e4e4e5b094be2 delete();
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeadd
// Size: 0x27
function codecallback_getprojectilespeedscale(attackerentity, objweapon) {
    return [0:1, 1:1];
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb0c
// Size: 0x21
function isstunned() {
    return isdefined(self.debuffedbyplayers) && isdefined(self.debuffedbyplayers["concussion_grenade_mp"]);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xeb35
// Size: 0x28
function setplayerblinded() {
    if (!isdefined(self.isblinded)) {
        self.isblinded = 1;
    } else {
        self.isblinded++;
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xeb64
// Size: 0x3e
function setplayerunblinded() {
    /#
        assertex(isdefined(self.isblinded), "Attempting to un-blind a player, but that player has not been blinded this life");
    #/
    /#
        assertex(self.isblinded > 0, "Attempting to un-blind a player, but that player has already been marked as unblinded. Too many calls to setPlayerUnblinded()");
    #/
    self.isblinded--;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeba9
// Size: 0x21
function isblinded() {
    return isdefined(self.debuffedbyplayers) && isdefined(self.debuffedbyplayers["flash_grenade_mp"]);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xebd2
// Size: 0x67
function isblindedby(player) {
    if (!isdefined(player)) {
        return 0;
    }
    weapon = "flash_grenade_mp";
    entnum = player getentitynumber();
    if (isdefined(self.debuffedbyplayers) && isdefined(self.debuffedbyplayers[weapon]) && isdefined(self.debuffedbyplayers[weapon][entnum])) {
        return 1;
    }
    return 0;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xec41
// Size: 0x67
function isstunnedby(player) {
    if (!isdefined(player)) {
        return 0;
    }
    weapon = "concussion_grenade_mp";
    entnum = player getentitynumber();
    if (isdefined(self.debuffedbyplayers) && isdefined(self.debuffedbyplayers[weapon]) && isdefined(self.debuffedbyplayers[weapon][entnum])) {
        return 1;
    }
    return 0;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xecb0
// Size: 0x13
function isstunnedorblinded() {
    return isblinded() || isstunned();
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xeccb
// Size: 0x41
function applyweaponsonicstun() {
    self endon("death_or_disconnect");
    wait(0.1);
    if (isdefined(self) && isplayer(self) && !isbot(self)) {
        self playlocalsound("sonic_shotgun_debuff");
        self setsoundsubmix("sonic_shotgun_impact");
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xed13
// Size: 0x6f
function watchinvalidweaponchange() {
    self endon("death_or_disconnect");
    while (1) {
        var_ddf65301f7d23098 = self waittill("weapon_switch_invalid");
        currentweapon = self getcurrentweapon();
        if (currentweapon.inventorytype == "item" || currentweapon.inventorytype == "exclusive") {
            namespace_8b68a49ebf57ab74::_switchtoweapon(self.lastdroppableweaponobj);
        }
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xed89
// Size: 0xa1
function weaponhasselectableoptic(fullweaponname) {
    rootweapon = weapon::getweaponrootname(fullweaponname);
    attachments = getweaponattachments(fullweaponname);
    foreach (attachment in attachments) {
        group = attachmentgroup(attachment);
        if (group == "rail") {
            if (weapon::attachmentisselectable(rootweapon, attachment)) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xee32
// Size: 0x92
function watchdropweapons() {
    self endon("disconnect");
    self notify("watchDropWeapons");
    self endon("watchDropWeapons");
    while (1) {
        objweapon = var_47dcfbc98e2103ee = self waittill("weapon_dropped");
        if (isdefined(var_47dcfbc98e2103ee) && isdefined(objweapon) && (!weapon::ismeleeonly(objweapon) && !weapon::ismeleeoverrideweapon(objweapon) && !namespace_45ecbe78f599af72::isknifeonly(objweapon) || namespace_45ecbe78f599af72::function_f0cf737b5d0ccda5(objweapon))) {
            if (var_47dcfbc98e2103ee physics_getnumbodies() > 0) {
                var_47dcfbc98e2103ee physics_registerforcollisioncallback();
                var_47dcfbc98e2103ee thread weapondrop_physics_callback_monitor();
            }
        }
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeecb
// Size: 0x145
function weapondrop_physics_callback_monitor() {
    self endon("death");
    self endon("timeout");
    thread weapondrop_physics_timeout(2);
    ent = impulse = normal = position = flag1 = flag0 = body1 = body0 = self waittill("collision");
    surface = physics_getsurfacetypefromflags(flag1);
    surfacetype = utility::function_53c4c53197386572(surface["name"], "");
    wpn_name = self.classname;
    var_164379da1f8761c0 = "";
    if (isdefined(self.objweapon) && isstring(self.objweapon.basename) && isstring(self.objweapon.material)) {
        wpn_name = self.objweapon.basename;
        var_164379da1f8761c0 = self.objweapon.material;
    }
    function_e7dbbe9220d5e27b(surfacetype);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf017
// Size: 0x6c
function function_e7dbbe9220d5e27b(surfacetype) {
    /#
        assertex(isstring(surfacetype), "weapondrop_play_surface_sound: surfacetype is not a string");
    #/
    surfacetype = function_2e84a570d6af300a(surfacetype, "surftype_");
    if (isstartstr(surfacetype, "user_terrain")) {
        var_9f558bb94aec6f2 = function_95c6391212a25f7c(function_2e84a570d6af300a(surfacetype, "user_terrain"), "_");
        surfacetype = "user_terrain_" + var_9f558bb94aec6f2;
    }
    self function_7d738013c1cfbc9d(surfacetype);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf08a
// Size: 0x16
function weapondrop_physics_timeout(time) {
    wait(time);
    self notify("timeout");
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf0a7
// Size: 0x1c6
function watchgrenadeaxepickup(player, var_b37714a572b93f0e) {
    self endon("death");
    level endon("game_ended");
    if (!isdefined(self.weapon_name) && isdefined(var_b37714a572b93f0e)) {
        self.weapon_name = var_b37714a572b93f0e;
    }
    var_16a48d7056e5c472 = stuckto = self waittill("missile_stuck");
    if (isdefined(stuckto) && (isplayer(stuckto) || isagent(stuckto))) {
        var_e24a4c740b224aa0 = var_16a48d7056e5c472 == "tag_flicker";
        var_853178727321999c = stuckto perk::_hasperk("specialty_rearguard") && var_16a48d7056e5c472 == "tag_origin";
        var_e13e382321a8580b = isdefined(var_16a48d7056e5c472) && (var_e24a4c740b224aa0 || var_853178727321999c);
        var_582286af4ffe5b36 = isdefined(var_16a48d7056e5c472) && var_16a48d7056e5c472 == "tag_weapon";
        if (var_e13e382321a8580b) {
            playfx(utility::getfx("shield_metal_impact"), self.origin);
            if (isdefined(self.owner)) {
                var_3f6103d9666b07cc = self.owner;
                relaunchaxe(self.weapon_name, var_3f6103d9666b07cc);
                return;
            }
        } else if (!istrue(var_e13e382321a8580b) && isplayer(stuckto) && !player::isreallyalive(stuckto) && (level.mapname == "mp_neon" || istrue(level.ragdollzerog))) {
            return;
        }
    }
    var_25e0203a75558aba = 45;
    thread watchaxetimeout(var_25e0203a75558aba);
    thread watchgrenadedeath();
    objweapon = makeweaponfromstring(self.weapon_name);
    thread watchaxeuse(player, objweapon);
    thread watchaxeautopickup(player, objweapon);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf274
// Size: 0xcf
function axedetachfromcorpse(var_b368413898131a3c) {
    level endon("game_ended");
    var_be8ac1d2583caef7 = var_b368413898131a3c getlinkedchildren();
    foreach (ent in var_be8ac1d2583caef7) {
        if (!isdefined(ent)) {
            continue;
        }
        weaponname = ent.weapon_name;
        var_3f6103d9666b07cc = ent.owner;
        var_8802742623974077 = ent.origin;
        if (isdefined(weaponname) && weapon::isaxeweapon(weaponname)) {
            ent relaunchaxe(weaponname, var_3f6103d9666b07cc);
        }
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf34a
// Size: 0x8f
function relaunchaxe(weaponname, var_3f6103d9666b07cc) {
    self unlink();
    var_8ee870eb33c71cd1 = weapon::getweaponbasenamescript(weaponname);
    var_61d4c6a9eee46112 = getsubstr(weaponname, var_8ee870eb33c71cd1.size);
    var_45d1215a74e32613 = var_3f6103d9666b07cc weapon::_launchgrenade("iw7_axe_mp_dummy" + var_61d4c6a9eee46112, self.origin, (0, 0, 0), 100, 1, self);
    var_45d1215a74e32613 setentityowner(var_3f6103d9666b07cc);
    var_45d1215a74e32613 thread watchgrenadeaxepickup(var_3f6103d9666b07cc, self.weapon_name);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf3e0
// Size: 0x29
function watchaxetimeout(timeoutduration) {
    self endon("death");
    level endon("game_ended");
    hostmigration::waitlongdurationwithhostmigrationpause(timeoutduration);
    self delete();
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf410
// Size: 0xb1
function watchaxeautopickup(player, weapon) {
    self endon("death");
    level endon("game_ended");
    trigger = spawn("trigger_radius", self.origin - (0, 0, 40), 0, 64, 64);
    trigger enablelinkto();
    trigger linkto(self);
    self.knife_trigger = trigger;
    trigger endon("death");
    while (1) {
        player = trigger waittill("trigger");
        if (!isplayer(player)) {
            continue;
        }
        if (player playercanautopickupaxe(self)) {
            player playerpickupaxe(weapon, 1);
            self delete();
            break;
        }
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf4c8
// Size: 0xc6
function watchaxeuse(player, weapon) {
    self endon("death");
    level endon("game_ended");
    useobj = spawn("script_model", self.origin);
    useobj linkto(self);
    self.useobj_trigger = useobj;
    useobj makeusable();
    useobj setcursorhint("HINT_NOICON");
    useobj sethintonobstruction("show");
    useobj sethintstring("WEAPON/PICKUP_AXE");
    useobj sethintdisplayfov(360);
    useobj setusefov(360);
    useobj sethintdisplayrange(64);
    useobj setuserange(64);
    useobj setusepriority(0);
    player = useobj waittill("trigger");
    player playerpickupaxe(weapon, 0);
    self delete();
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf595
// Size: 0xf6
function playercanautopickupaxe(var_44de964e96e8ec24) {
    if (isdefined(var_44de964e96e8ec24.owner) && self != var_44de964e96e8ec24.owner) {
        return 0;
    }
    var_849c1df4114e0a37 = self getweaponslistprimaries();
    var_d2472bb1c9e89dee = 0;
    var_d3cca4d847be4fa4 = 0;
    foreach (weapon in var_849c1df4114e0a37) {
        if (weapon::isaxeweapon(weapon) && self getweaponammoclip(weapon) == 0) {
            var_d2472bb1c9e89dee = 1;
            break;
        }
        if (issubstr(weapon.basename, "iw9_me_fists_mp")) {
            var_d2472bb1c9e89dee = 1;
            break;
        }
        if (!weapon.isalternate) {
            var_d3cca4d847be4fa4++;
        }
    }
    if (var_d3cca4d847be4fa4 < 2) {
        var_d2472bb1c9e89dee = 1;
    }
    return var_d2472bb1c9e89dee;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf693
// Size: 0x3cb
function playerpickupaxe(objweapon, var_796c07fe4c856a8e) {
    /#
        assert(isweapon(objweapon));
    #/
    var_aaa00e27a60773a1 = objweapon getnoaltweapon();
    currentweapon = self getcurrentweapon();
    var_849c1df4114e0a37 = self getweaponslistprimaries();
    if (self hasweapon(objweapon)) {
        ammoinclip = self getweaponammoclip(objweapon);
        if (!var_796c07fe4c856a8e && ammoinclip > 0) {
            self dropitem(objweapon);
            namespace_8b68a49ebf57ab74::_giveweapon(var_aaa00e27a60773a1);
        } else if (!issubstr(currentweapon.basename, objweapon.basename)) {
            namespace_8b68a49ebf57ab74::_takeweapon(objweapon);
            namespace_8b68a49ebf57ab74::_giveweapon(var_aaa00e27a60773a1);
        }
        var_3bcedee676d43cf1 = self getweaponammoclip(currentweapon) == 0 && weapon::isaxeweapon(currentweapon);
        var_8a1ef5886931af59 = issubstr(currentweapon.basename, "iw9_me_fists_mp");
        if (!var_796c07fe4c856a8e || var_8a1ef5886931af59 || var_3bcedee676d43cf1) {
            namespace_8b68a49ebf57ab74::_switchtoweapon(var_aaa00e27a60773a1);
        }
        self setweaponammoclip(var_aaa00e27a60773a1, 1);
        hud_message::showmiscmessage("axe");
        return;
    }
    var_53c6dcc71b89288f = undefined;
    var_303858271584eb48 = 0;
    foreach (weapon in var_849c1df4114e0a37) {
        if (weapon.isalternate) {
            continue;
        }
        if (issubstr(weapon.basename, "uplinkball")) {
            continue;
        }
        var_cb54202af3c4e5b8 = self getweaponammoclip(weapon) == 0 && weapon::isaxeweapon(weapon);
        if (!isdefined(var_53c6dcc71b89288f) && (weaponispreferreddrop(weapon) || var_cb54202af3c4e5b8)) {
            var_53c6dcc71b89288f = weapon;
        }
        var_303858271584eb48++;
    }
    /#
        assert(!var_796c07fe4c856a8e || isdefined(var_53c6dcc71b89288f) || var_303858271584eb48 < 2);
    #/
    var_ec22a950f210e39 = undefined;
    if (isdefined(var_53c6dcc71b89288f)) {
        var_ec22a950f210e39 = var_53c6dcc71b89288f;
    } else if (var_303858271584eb48 >= 2) {
        var_ec22a950f210e39 = currentweapon;
    }
    var_107f42911b64ccb4 = !var_796c07fe4c856a8e || isdefined(var_ec22a950f210e39) && issubstr(currentweapon.basename, var_ec22a950f210e39.basename);
    if (isdefined(var_ec22a950f210e39)) {
        var_cb54202af3c4e5b8 = self getweaponammoclip(var_ec22a950f210e39) == 0 && weapon::isaxeweapon(var_ec22a950f210e39);
        var_4dc7fa49d0968728 = var_ec22a950f210e39.basename == "iw9_me_fists_mp";
        candrop = weaponcandrop(var_ec22a950f210e39) && !var_cb54202af3c4e5b8;
        if (candrop) {
            droppeditem = self dropitem(var_ec22a950f210e39);
            if (isdefined(droppeditem)) {
                dropweaponname = getcompleteweaponname(var_ec22a950f210e39);
                if (isdefined(self.tookweaponfrom[dropweaponname])) {
                    droppeditem.owner = self.tookweaponfrom[dropweaponname];
                    self.tookweaponfrom[dropweaponname] = undefined;
                } else {
                    droppeditem.owner = self;
                }
                droppeditem.targetname = "dropped_weapon";
                droppeditem.objweapon = var_ec22a950f210e39;
                droppeditem thread watchpickup(self);
                droppeditem thread deletepickupafterawhile();
            }
        } else if (!candrop && !(var_4dc7fa49d0968728 && var_303858271584eb48 < 2) && !(var_cb54202af3c4e5b8 && var_303858271584eb48 < 2)) {
            self takeweapon(var_ec22a950f210e39);
        }
    }
    namespace_8b68a49ebf57ab74::_giveweapon(var_aaa00e27a60773a1);
    self setweaponammoclip(var_aaa00e27a60773a1, 1);
    if (var_107f42911b64ccb4) {
        namespace_8b68a49ebf57ab74::_switchtoweapon(var_aaa00e27a60773a1);
    }
    hud_message::showmiscmessage("axe");
    weapon::fixupplayerweapons(self, var_aaa00e27a60773a1);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa65
// Size: 0x10b
function callback_finishweaponchange(var_82533969b4683de4, var_492b944276064f63, var_6f14f21684b6976d, var_14f4860c3d155d12) {
    updatecamoscripts(var_82533969b4683de4, var_492b944276064f63);
    updateweaponscriptvfx(var_82533969b4683de4, var_492b944276064f63, var_6f14f21684b6976d, var_14f4860c3d155d12);
    callbackdata = self.weaponchangecallbacks;
    if (isdefined(callbackdata)) {
        foreach (callback in callbackdata.callbacks) {
            self [[ callback ]](var_82533969b4683de4, var_492b944276064f63);
        }
        foreach (callback in callbackdata.oneshotcallbacks) {
            self [[ callback ]](var_82533969b4683de4, var_492b944276064f63);
        }
        callbackdata.oneshotcallbacks = [];
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb77
// Size: 0x8c
function updateweaponscriptvfx(newweapon, oldweapon, var_6f14f21684b6976d, var_14f4860c3d155d12) {
    if ((oldweapon.basename == "none" || oldweapon.basename == "alt_none") && isdefined(self.lastdroppableweapon)) {
        if (oldweapon == "alt_none") {
            var_14f4860c3d155d12 = 1;
        } else {
            var_14f4860c3d155d12 = 0;
        }
        oldweapon = self.lastdroppableweapon;
    }
    clearweaponscriptvfx(oldweapon, var_14f4860c3d155d12);
    runweaponscriptvfx(newweapon, var_6f14f21684b6976d);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc0a
// Size: 0x4b
function runweaponscriptvfx(newweapon, var_6f14f21684b6976d) {
    if (!isdefined(newweapon)) {
        return;
    }
    if (isdefined(var_6f14f21684b6976d) && var_6f14f21684b6976d == 1) {
        var_3eceb0eb18d0e47b = "alt_" + weapon::getweaponbasenamescript(newweapon);
    } else {
        var_3eceb0eb18d0e47b = weapon::getweaponbasenamescript(newweapon);
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc5c
// Size: 0x21f
function clearweaponscriptvfx(oldweapon, var_14f4860c3d155d12) {
    if (!isdefined(oldweapon)) {
        return;
    }
    if (isdefined(var_14f4860c3d155d12) && var_14f4860c3d155d12 == 1) {
        var_bf67671ce57d3a6c = "alt_" + weapon::getweaponbasenamescript(oldweapon);
    } else {
        var_bf67671ce57d3a6c = weapon::getweaponbasenamescript(oldweapon);
    }
    switch (var_bf67671ce57d3a6c) {
    case #"hash_16a70270ad1be05":
    case #"hash_720415103e03ae2":
    case #"hash_ccb7e0ca94ee5c9":
    case #"hash_1a3a5f8a962ed552":
    case #"hash_1c4e9e71e522fc4f":
    case #"hash_1ca5befa8dd4212c":
    case #"hash_373244181c39a617":
    case #"hash_3aebbd4d39af2e1d":
    case #"hash_3e782fd775b72022":
    case #"hash_4da38b8f68dd24e9":
    case #"hash_55daa19b03d3c0a3":
    case #"hash_5c272c0617caebf0":
    case #"hash_5cbb3a1a84d47f1d":
    case #"hash_5d0a7e04f70f7955":
    case #"hash_69dc59a2931615bb":
    case #"hash_734b74361301068b":
    case #"hash_7c2cc72e0303a1ed":
    case #"hash_802c4ea270fb6875":
    case #"hash_8cc23b82a1e96d05":
    case #"hash_a4d841e3a2ddbb29":
    case #"hash_a9e31b8ffd42a67b":
    case #"hash_ad8e0c890ec0cc34":
    case #"hash_ada149b6511e694f":
    case #"hash_b1d476fe8b4f829a":
    case #"hash_b5e9f2d6fac1a505":
    case #"hash_b9e0da8080aefc13":
    case #"hash_bd614182e9e39950":
    case #"hash_c3b4676d5e812262":
    case #"hash_c7149abad793a9b1":
    case #"hash_cfce2a2737ab1be6":
    case #"hash_d2d2f2854b7d8b7d":
    case #"hash_da6958311b58f75b":
    case #"hash_e1a2fa29b8332d53":
    case #"hash_e704ecf8710c6f57":
    case #"hash_eecff3f23eb2fa44":
    case #"hash_f3248b9b1283bc96":
    case #"hash_f55c20924061bd15":
    case #"hash_f733f426b27679a6":
        break;
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe82
// Size: 0x2e
function updatecamoscripts(var_82533969b4683de4, var_492b944276064f63) {
    clearcamoscripts(getweaponcamoname(var_492b944276064f63));
    runcamoscripts(getweaponcamoname(var_82533969b4683de4));
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfeb7
// Size: 0x32
function runcamoscripts(camo) {
    if (!isdefined(camo)) {
        return;
    }
    switch (camo) {
    case #"hash_321cd27e72303c85":
        thread blood_camo_84();
        break;
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfef0
// Size: 0x32
function clearcamoscripts(camo) {
    if (!isdefined(camo)) {
        return;
    }
    switch (camo) {
    case #"hash_321cd27e72303c85":
        self notify("blood_camo_84");
        break;
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xff29
// Size: 0x90
function blood_camo_84() {
    self endon("death_or_disconnect");
    self endon("blood_camo_84");
    if (isdefined(self.bloodcamokillcount)) {
        self setscriptablepartstate("camo_84", self.bloodcamokillcount + "_kills");
    } else {
        self.bloodcamokillcount = 0;
    }
    while (self.bloodcamokillcount < 13) {
        self waittill("kill_event_buffered");
        self.bloodcamokillcount = self.bloodcamokillcount + 1;
        self setscriptablepartstate("camo_84", self.bloodcamokillcount + "_kills");
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xffc0
// Size: 0x12
function getactiveequipmentarray() {
    return utility::array_remove_duplicates(level.mines);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xffda
// Size: 0x11
function init_function_refs() {
    level.getactiveequipmentarray = &getactiveequipmentarray;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfff2
// Size: 0x49
function doesshareammo(objweapon) {
    return objweapon.isalternate && !issubstr(objweapon.underbarrel, "gl") && issubstr(objweapon.underbarrel, "shotgun");
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10043
// Size: 0x99
function waittill_grenade_throw() {
    while (1) {
        originalowner = tickpercent = objweapon = grenade = self waittill("grenade_fire");
        if (!weapon::grenadethrown(grenade)) {
            continue;
        }
        grenadeinitialize(grenade, objweapon, tickpercent, originalowner);
        if (isdefined(originalowner) && originalowner != self) {
            level thread namespace_20260f65229aa888::trysaylocalsound(self, #"hash_84afbf61450b581d");
        }
        self.var_318e9ed18014aada = gettime();
        self.var_9df92c66c8402503 = grenade;
        self notify("grenade_thrown", grenade);
        return grenade;
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x100e3
// Size: 0x198
function grenadeinitialize(grenade, weapon_object, tickpercent, originalowner) {
    /#
        assert(isdefined(self), "grenadeInitialize called on undefined entity");
    #/
    /#
        assert(isdefined(grenade), "grenadeInitialize called with undefined param: grenade");
    #/
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
        grenade.ticks = script::roundup(4 * tickpercent);
    }
    equipmentref = equipment::getequipmentreffromweapon(weapon_object);
    if (isdefined(equipmentref)) {
        grenade.equipmentref = equipmentref;
        grenade.isequipment = 1;
        grenade.bundle = equipment::function_2113b6f7cb462692(grenade.weapon_name);
        if (equipmentref == "equip_smoke") {
            grenade.owner stats::incpersstat("smokesUsed", 1);
        }
    }
    grenade.threwback = isdefined(originalowner);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10282
// Size: 0xea
function waittill_missile_fire() {
    objweapon = missile = self waittill("missile_fire");
    if (isdefined(missile)) {
        if (!isdefined(missile.weapon_name)) {
            if (objweapon.isalternate) {
                missile.weapon_name = weapon::getaltmodeweapon(objweapon);
                missile.var_939636f512801e8e = weapon::function_b53839dc08a64fde(objweapon);
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
        if (!isdefined(missile.weapon_object)) {
            missile.weapon_object = objweapon;
        }
    }
    return [0:objweapon, 1:missile];
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10374
// Size: 0x5e
function enableburnfx(var_e63d4b8bbf87b92, var_ee8fa35daedf8c6b) {
    if (!isdefined(self.burnfxstates)) {
        self.burnfxstates = [];
    }
    if (!isdefined(var_ee8fa35daedf8c6b)) {
        var_ee8fa35daedf8c6b = "active";
    }
    if (!istrue(var_e63d4b8bbf87b92)) {
        thread enableburnsfx();
    }
    self.burnfxstates[getburnfxstatepriority(var_ee8fa35daedf8c6b)] = var_ee8fa35daedf8c6b;
    startburnfx();
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x103d9
// Size: 0x50
function getburnfxstatepriority(state) {
    switch (state) {
    case #"hash_9943bf0047670307":
        return 3;
    case #"hash_7173532436329889":
        return 2;
    case #"hash_bee8aefcdf5a9a8f":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10430
// Size: 0x41
function gethightestpriotiryactiveburnstate(burnfxstates) {
    i = 3;
    var_45cf691069c4e2c = undefined;
    while (i >= 0) {
        if (isdefined(burnfxstates[i])) {
            var_45cf691069c4e2c = burnfxstates[i];
            break;
        }
        i--;
    }
    return var_45cf691069c4e2c;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10479
// Size: 0xbb
function enableburnsfx() {
    self notify("updateBurnSFX");
    self endon("death_or_disconnect");
    self endon("updateBurnSFX");
    if (!isdefined(self.burnsfxenabled)) {
        self.burnsfxenabled = 0;
    }
    if (!isdefined(self.burnsfx)) {
        self.burnsfx = spawn("script_origin", self.origin);
        self.burnsfx linkto(self);
        self.burnsfx namespace_cd074ac917dcd87a::registerspawncount(1);
        wait(0.05);
    }
    if (self.burnsfxenabled == 0) {
        if (isdefined(self.burnsfx)) {
            self.burnsfx playloopsound("iw9_weap_molotov_fire_enemy_burn");
            self.burnsfxenabled = 1;
        }
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1053b
// Size: 0x5d
function enableburnfxfortime(duration, var_ee8fa35daedf8c6b) {
    if (!isdefined(var_ee8fa35daedf8c6b)) {
        var_ee8fa35daedf8c6b = "active";
    }
    var_67d4fce90b90214a = "endon_burnfxForTime_" + var_ee8fa35daedf8c6b;
    self notify(var_67d4fce90b90214a);
    self endon("disconnect");
    self endon("clearBurnFX");
    self endon(var_67d4fce90b90214a);
    thread enableburnfx(0, var_ee8fa35daedf8c6b);
    wait(duration);
    thread disableburnfx(0, var_ee8fa35daedf8c6b);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1059f
// Size: 0x93
function disableburnfx(var_e63d4b8bbf87b92, burningstate) {
    if (!isdefined(self.burnfxstates)) {
        self.burnfxstates = [];
    }
    if (isdefined(burningstate)) {
        self.burnfxstates[getburnfxstatepriority(burningstate)] = undefined;
        self.burnfxstates = utility::array_removeundefined(self.burnfxstates);
    } else {
        self.burnfxstates = [];
    }
    if (self.burnfxstates.size > 0) {
        startburnfx();
    } else {
        stopburnfx();
        if (!istrue(var_e63d4b8bbf87b92)) {
            thread disable_burnsfx();
        }
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10639
// Size: 0x7a
function disable_burnsfx() {
    self notify("updateBurnSFX");
    self endon("death_or_disconnect");
    self endon("updateBurnSFX");
    wait(0.5);
    if (isdefined(self.burnsfxenabled) && self.burnsfxenabled == 1) {
        if (!isdefined(self.var_aaa78716e99a2760) || self.var_aaa78716e99a2760) {
            self playsound("iw9_weap_molotov_fire_enemy_burn_end");
        }
        self.var_aaa78716e99a2760 = undefined;
        wait(0.15);
        function_d9fcebdb704a67fa();
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x106ba
// Size: 0x29
function function_6b4a68dbdae21499(var_f60ee8b9e17970e6) {
    function_9fd9dc9d9d3a0bc4();
    function_22d1fced237d6878();
    clearburnfx(var_f60ee8b9e17970e6);
    function_d9fcebdb704a67fa();
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x106ea
// Size: 0x68
function private clearburnfx(var_f60ee8b9e17970e6) {
    self notify("clearBurnFX");
    function_11bc0d93953a155a();
    if (istrue(var_f60ee8b9e17970e6)) {
        if (isdefined(self.corpsetablefuncs) && isdefined(self.corpsetablefuncs["burning"])) {
            namespace_3e725f3cc58bddd3::dequeuecorpsetablefunc("burning");
        }
        function_fc27c713595c6a00();
    }
    self.burnfxplaying = undefined;
    self.burnfxstates = undefined;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10759
// Size: 0x77
function startburnfx() {
    var_ee8fa35daedf8c6b = gethightestpriotiryactiveburnstate(self.burnfxstates);
    self setscriptablepartstate("burning", var_ee8fa35daedf8c6b);
    self.burnfxplaying = var_ee8fa35daedf8c6b;
    function_fc27c713595c6a00(var_ee8fa35daedf8c6b);
    if (!isdefined(self.corpsetablefuncs) || !isdefined(self.corpsetablefuncs["burning"])) {
        damage::enqueuecorpsetablefunc("burning", &burnfxcorpstablefunc);
    }
    thread function_4a895aafec5dd891();
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x107d7
// Size: 0x2b
function function_4a895aafec5dd891() {
    self notify("stop_burnFxInfilCleanupThread");
    self endon("death_or_disconnect");
    self endon("stop_burnFxInfilCleanupThread");
    self waittill("beginC130");
    thread function_6b4a68dbdae21499(1);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10809
// Size: 0x128
function function_fc27c713595c6a00(var_ee8fa35daedf8c6b) {
    if (isdefined(var_ee8fa35daedf8c6b)) {
        if (var_ee8fa35daedf8c6b == "nuke_active" || var_ee8fa35daedf8c6b == "wp_active" || var_ee8fa35daedf8c6b == "active") {
            var_ee8fa35daedf8c6b = "flareUp";
        } else {
            switch (var_ee8fa35daedf8c6b) {
            case #"hash_aff60910f2d22661":
                var_ee8fa35daedf8c6b = "al_to_ar_";
                break;
            case #"hash_e375a3f665d58036":
                var_ee8fa35daedf8c6b = "al_to_ll_";
                break;
            case #"hash_32f426f68ef33047":
            case #"hash_56dae623a0537cab":
            case #"hash_94143bf6c209d5b9":
                var_ee8fa35daedf8c6b = "to_ar_lr";
                break;
            case #"hash_79ca5b8a91fe4b3f":
            case #"hash_8b427f4805eb13fc":
            case #"hash_b81e7b23d386c21a":
                var_ee8fa35daedf8c6b = "to_ll_lr";
                break;
            case #"hash_384a0d26e7095bf9":
            case #"hash_4fa5087b17ea1b62":
            case #"hash_78a25902c839c2bc":
            case #"hash_a6405a3db3fbeda8":
            case #"hash_d00a40c1f19a1a07":
            case #"hash_d56c02428470d154":
                var_ee8fa35daedf8c6b = "flareUp";
                break;
            }
        }
    }
    self.var_14d194d29991df6b = var_ee8fa35daedf8c6b;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10938
// Size: 0x3c
function stopburnfx() {
    if (isdefined(self.burnfxplaying)) {
        function_11bc0d93953a155a();
        damage::dequeuecorpsetablefunc("burning");
        function_fc27c713595c6a00();
        self.burnfxplaying = undefined;
    }
    self notify("stop_burnFxInfilCleanupThread");
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1097b
// Size: 0x1d
function function_11bc0d93953a155a() {
    if (self isscriptable()) {
        self setscriptablepartstate("burning", "neutral");
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1099f
// Size: 0x77
function function_d9fcebdb704a67fa() {
    if (isdefined(self.burnsfxenabled) && self.burnsfxenabled == 1) {
        if (isdefined(self.burnsfx)) {
            self.burnsfx stoploopsound("iw9_weap_molotov_fire_enemy_burn");
        }
        self.burnsfxenabled = 0;
    }
    if (isdefined(self.burnsfx)) {
        self.burnsfx namespace_cd074ac917dcd87a::deregisterspawn();
        self.burnsfx delete();
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10a1d
// Size: 0x48
function burnfxcorpstablefunc(var_3741ea5b9fb53ec3) {
    burningstate = "flareUp";
    if (isdefined(self) && isdefined(self.var_14d194d29991df6b)) {
        burningstate = self.var_14d194d29991df6b;
    }
    var_3741ea5b9fb53ec3 setscriptablepartstate("burning", burningstate, 0);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10a6c
// Size: 0x114
function semtex_used(grenade) {
    self endon("disconnect");
    grenade endon("death");
    grenade.bundle = equipment::function_2113b6f7cb462692(grenade.weapon_name);
    stuckto = grenade waittill("missile_stuck");
    if (isplayer(stuckto) || isagent(stuckto)) {
        thread grenadestuckto(grenade, stuckto);
        if (isagent(stuckto)) {
            function_216c67ab6749137a(stuckto, undefined, "semtex_stuck");
        }
        if (isagent(stuckto) && !istrue(stuckto.var_274d3a7704e351ef)) {
            if (!isdefined(stuckto.var_f8ecc64162438d76)) {
                stuckto.var_f8ecc64162438d76 = [];
            } else {
                stuckto.var_f8ecc64162438d76 = utility::array_removedead(stuckto.var_f8ecc64162438d76);
            }
            stuckto.var_f8ecc64162438d76 = utility::array_add(stuckto.var_f8ecc64162438d76, grenade);
            /#
                assertex(stuckto.health > 0, "Agent with a semtex stuck to is dead already.");
            #/
            ai::function_60daa23100a2b874(grenade, stuckto);
        }
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10b87
// Size: 0xc9
function semtex_stuckplayer(grenade, stuckto) {
    self endon("disconnect");
    grenade endon("end_explode");
    stuckto endon("death_or_disconnect");
    grenade thread script::notifyafterframeend("death", "end_explode");
    position = grenade waittill("explode");
    var_33e2d54d8812e8ce = stuckto.maxhealth;
    if (isdefined(grenade.bundle)) {
        var_33e2d54d8812e8ce = utility::function_53c4c53197386572(grenade.bundle.var_dc6074bf92aed826, stuckto.maxhealth);
        var_33e2d54d8812e8ce = var_33e2d54d8812e8ce * utility::function_53c4c53197386572(grenade.bundle.var_43f9a1342da4e1a0, 1);
    }
    thread function_c50caf1f56ecf73(stuckto, position, var_33e2d54d8812e8ce, grenade);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c57
// Size: 0x87
function function_c50caf1f56ecf73(stuckto, position, var_33e2d54d8812e8ce, var_68647a50e85e8152) {
    var_31bbffe8512c7c8a = distancesquared(position, stuckto.origin);
    var_1c6cdb959bb1bf2a = 5000;
    if (var_31bbffe8512c7c8a > var_1c6cdb959bb1bf2a) {
        return;
    }
    stuckto namespace_25ead30c6ed027fb::forcestuckdamage();
    if (!isdefined(var_68647a50e85e8152)) {
        var_68647a50e85e8152 = self;
    }
    stuckto dodamage(var_33e2d54d8812e8ce, position, self, var_68647a50e85e8152, "MOD_EXPLOSIVE", makeweapon("semtex_mp"));
    stuckto namespace_25ead30c6ed027fb::forcestuckdamageclear();
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ce5
// Size: 0x37
function function_7a91162092cc11ec(lootid) {
    var_93b3002ebef628b = loot::function_793e8a72cedb8ef3(lootid);
    var_7956cc8a3f6e983d = weapon::getweaponrootname(var_93b3002ebef628b);
    return loot::getLootIDFromRef(var_7956cc8a3f6e983d);
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10d24
// Size: 0x9a
function function_15abe90be101ffc8(var_c7bd95b10c89cff8, attachment, var_d7305e20a538a9a1) {
    blueprints = function_4527f44d851c9afd(var_c7bd95b10c89cff8, attachment);
    foreach (variantindex, attachmentdata in blueprints) {
        var_4f13b964ab82fe13 = attachmentdata.lootid;
        if (isdefined(var_4f13b964ab82fe13) && var_d7305e20a538a9a1 == var_4f13b964ab82fe13) {
            return variantindex;
        }
    }
    return 0;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10dc6
// Size: 0x87
function function_1c6803f36c2ea0a6(var_c7bd95b10c89cff8, attachment, variantid) {
    blueprints = function_4527f44d851c9afd(var_c7bd95b10c89cff8, attachment);
    foreach (variantindex, attachmentdata in blueprints) {
        if (variantindex == variantid) {
            return attachmentdata.lootid;
        }
    }
    return undefined;
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e55
// Size: 0x2c
function function_82a0e6138ba06718(objweapon) {
    self.var_888410f22da94ad0 = undefined;
    if (objweapon hasattachment("trigger_heavy_p14")) {
        thread function_f0ab1405beddd91f();
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e88
// Size: 0x53
function function_f0ab1405beddd91f() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("weapon_taken");
    self endon("weapon_change");
    while (1) {
        if (self getcurrentweaponclipammo() == 1) {
            self.var_888410f22da94ad0 = 1;
        } else {
            self.var_888410f22da94ad0 = undefined;
        }
        self waittill("reload");
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ee2
// Size: 0x19c0
function function_e0780928b2591268(objweapon, var_85fa2cdcb19d076c) {
    level endon("game_ended");
    viewangles = self getplayerangles();
    var_9476c342add1a849 = self geteye();
    playerforward = anglestoforward(viewangles);
    var_93c7fda3630b8af9 = var_9476c342add1a849 + playerforward * 6000;
    var_217857c69d3e9a04 = 400;
    var_504eac462f9531a4 = getdvarint(@"hash_8a17c968aa5c8fd1", -1);
    if (var_504eac462f9531a4 > 0) {
        var_93c7fda3630b8af9 = var_9476c342add1a849 + playerforward * var_504eac462f9531a4;
    }
    var_7e8fdab2d6343efc = getdvarint(@"hash_1e45eef33a3b63", -1);
    if (var_7e8fdab2d6343efc > 0) {
        var_217857c69d3e9a04 = var_7e8fdab2d6343efc;
    }
    var_1a1b6c4c33f1b3b8 = trace::create_contents(1, 0, 0, 0, 0, 1);
    var_3f8e37b81bd4d351 = (0, 0, 10);
    var_b83b0fc6a542638 = 0;
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        var_b83b0fc6a542638 = getdvarint(@"hash_31c5e6d57a1104e1", 1);
    }
    var_c8863cdecb0560f4 = [];
    var_38b853e7e5c069f8 = [];
    var_e228b6eb479306d = trace::sphere_trace_get_all_results(var_9476c342add1a849, var_93c7fda3630b8af9, 60, self, var_1a1b6c4c33f1b3b8, 0, 1);
    foreach (result in var_e228b6eb479306d) {
        if (isdefined(result["entity"])) {
            ent = result["entity"];
            if (sighttracepassed(var_9476c342add1a849, result["position"], 0, ent, undefined, 1)) {
                var_c8863cdecb0560f4 = function_6d6af8144a5131f1(var_c8863cdecb0560f4, ent);
            }
        }
    }
    if (getdvarint(@"hash_e11b62d8bc4f25da", 1) == 1) {
        var_b1ca25a639f7dd44 = getentitiesinradius(var_9476c342add1a849, var_217857c69d3e9a04, undefined, undefined, trace::create_default_contents(0));
        foreach (ent in var_b1ca25a639f7dd44) {
            if (self worldpointinreticle_circle(ent.origin, 65, 120) == 1) {
                var_c8863cdecb0560f4 = array_add(var_c8863cdecb0560f4, ent);
            }
        }
        if (var_b83b0fc6a542638) {
            var_32680e06caf9feb2 = getentitylessscriptablearray(undefined, undefined, var_9476c342add1a849, var_217857c69d3e9a04, "dmz_uav_tower");
            foreach (scriptable in var_32680e06caf9feb2) {
                if (isdefined(scriptable.var_3545410459b16762)) {
                    if (self worldpointinreticle_circle(scriptable.origin + var_3f8e37b81bd4d351, 65, 120) == 1) {
                        var_38b853e7e5c069f8 = function_6d6af8144a5131f1(var_38b853e7e5c069f8, scriptable);
                    }
                }
            }
        }
    }
    if (isdefined(level.activekillstreaks)) {
        foreach (ent in level.activekillstreaks) {
            if (sighttracepassed(var_9476c342add1a849, ent.origin, 0, ent, var_85fa2cdcb19d076c, 1) && self worldpointinreticle_circle(ent.origin, 65, 50) == 1) {
                var_c8863cdecb0560f4 = array_add(var_c8863cdecb0560f4, ent);
            }
        }
    }
    foreach (ent in getactiveequipmentarray()) {
        if (sighttracepassed(var_9476c342add1a849, ent.origin, 0, var_85fa2cdcb19d076c, undefined, 1) && self worldpointinreticle_circle(ent.origin, 65, 50) == 1) {
            var_c8863cdecb0560f4 = array_add(var_c8863cdecb0560f4, ent);
        }
    }
    foreach (ent in level.grenades) {
        if (!isdefined(ent)) {
            continue;
        }
        if (sighttracepassed(var_9476c342add1a849, (ent.origin[0], ent.origin[1], ent.origin[2] + 5), 0, var_85fa2cdcb19d076c, undefined, 1) && self worldpointinreticle_circle(ent.origin, 65, 50) == 1) {
            var_c8863cdecb0560f4 = array_add(var_c8863cdecb0560f4, ent);
        }
    }
    var_c8863cdecb0560f4 = array_remove_duplicates(var_c8863cdecb0560f4);
    var_1fa763edf5f1cc00 = trace::create_contents(0, 1, 1, 1);
    if (isdefined(level.brgametype) && isdefined(level.brgametype.var_84b0d6cec49dc02b)) {
        foreach (var_db662a244a03025a in level.brgametype.var_84b0d6cec49dc02b) {
            if (distancesquared(self.origin, var_db662a244a03025a.origin) <= 640000) {
                if (self worldpointinreticle_circle(var_db662a244a03025a.origin, 65, 90) == 1) {
                    var_8bd607a2b7bbf567 = ray_trace(var_9476c342add1a849, var_db662a244a03025a.origin, var_85fa2cdcb19d076c, var_1fa763edf5f1cc00, 0, 1, 1);
                    if (isdefined(var_8bd607a2b7bbf567) && isdefined(var_8bd607a2b7bbf567["scriptable"]) && isdefined(var_8bd607a2b7bbf567["scriptable"].type) && var_8bd607a2b7bbf567["scriptable"].type == "ob_aethernest_cyst_scriptable") {
                        var_38b853e7e5c069f8 = array_add(var_38b853e7e5c069f8, var_db662a244a03025a);
                    }
                }
            }
        }
    }
    if (var_b83b0fc6a542638 && isdefined(level.var_a1141d47ab94d2a1)) {
        foreach (tower in level.var_a1141d47ab94d2a1) {
            if (distancesquared(self.origin, tower.origin + var_3f8e37b81bd4d351) <= 3841600) {
                if (self worldpointinreticle_circle(tower.origin + var_3f8e37b81bd4d351, 65, 90) == 1) {
                    var_c97f2e648d93f66b = ray_trace(var_9476c342add1a849, tower.origin + var_3f8e37b81bd4d351, var_85fa2cdcb19d076c, undefined, 0, 1, 1);
                    if (isdefined(var_c97f2e648d93f66b) && isdefined(var_c97f2e648d93f66b["scriptable"]) && isdefined(var_c97f2e648d93f66b["scriptable"].type) && var_c97f2e648d93f66b["scriptable"].type == "dmz_uav_tower" && isdefined(var_c97f2e648d93f66b["scriptable"].var_3545410459b16762)) {
                        var_38b853e7e5c069f8 = function_6d6af8144a5131f1(var_38b853e7e5c069f8, var_c97f2e648d93f66b["scriptable"]);
                    }
                }
            }
        }
    }
    foreach (ent in var_c8863cdecb0560f4) {
        if (ent namespace_dbbb37eb352edf96::isvehicle()) {
            if (namespace_1f188a13f7e79610::vehicle_isfriendlytoplayer(ent, self)) {
                continue;
            }
            jumpiffalse(getdvarint(@"hash_be23c0cca5ddca69", 1) && !istrue(ent.israllypointvehicle)) LOC_00000820;
            occupants = namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(ent, 0);
            jumpiffalse(isdefined(occupants) && occupants == 0) LOC_00000820;
        } else if (isdefined(ent.team) && ent.team == self.team) {
            if (isplayer(ent)) {
                ent notify("stop_tracker_grenade_thirdparty", self);
            }
        } else {
            if (isdefined(ent.owner) && ent.owner.team == self.team) {
                continue;
            }
            if (var_b83b0fc6a542638) {
                if (isdefined(ent.domflag) && isdefined(ent.domflag.trigger) && isdefined(ent.domflag.trigger.var_3545410459b16762)) {
                    if (isdefined(ent.domflag.trigger.stronghold) && isdefined(ent.domflag.trigger.stronghold.var_4756733ecc825a2) && istrue(ent.domflag.trigger.stronghold.var_4756733ecc825a2 == self.team)) {
                        continue;
                    }
                    data = spawnstruct();
                    data.time = 5;
                    data.attacker = self;
                    data.reason = "STORMENDER";
                    ent.domflag.trigger thread [[ ent.domflag.trigger.var_3545410459b16762 ]](data);
                }
            }
            if (isplayer(ent)) {
                ent thread function_a0a176ec45783695(self, 5);
            } else if (isagent(ent) && isdefined(ent.team) && ent.team != self.team) {
                jumpiffalse(isdefined(ent.unittype)) LOC_00000afa;
                if (ent.unittype == "zombie") {
                    ent val::set("drone_launcher", "pain", 0);
                    var_ee67fb3e8bee9a6e = getdvarint(@"hash_245a8ac774461e4a", 40);
                    ent dodamage(var_ee67fb3e8bee9a6e, self.origin, self, self, "MOD_UNKNOWN", self.currentprimaryweapon);
                    ent val::reset("drone_launcher", "pain");
                    continue;
                }
                jumpiffalse(ent.unittype == "soldier") LOC_00000afa;
                var_12c07b09a7777175 = getdvarint(@"hash_7cdb49e8f87074af", 20);
                ent dodamage(var_12c07b09a7777175, self.origin, self, self, "MOD_UNKNOWN", self.currentprimaryweapon);
            } else if (isdefined(ent.var_93083caf1530fefa) && ent.var_93083caf1530fefa.equipmentref == "equip_butterfly_mine") {
                ent dodamage(9999, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
            } else if (isdefined(ent.streakname)) {
                if (ent.streakname == "radar_drone_recon") {
                    ent dodamage(9999, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                } else if (ent.streakname == "uav") {
                    ent dodamage(250, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                } else if (ent.streakname == "missile_turret") {
                    ent dodamage(130, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    if (!istrue(ent.var_12bfb031c0a0efd8)) {
                        function_1475aa09aebba72(ent);
                        ent thread function_4e9544f537fa99d6(self);
                    }
                } else if (ent.streakname == "assault_drone") {
                    ent dodamage(1, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    data = namespace_25ead30c6ed027fb::packdamagedata(self, ent, 1, self.currentprimaryweapon, "MOD_EXPLOSIVE", self);
                    ent thread [[ ent.var_3545410459b16762 ]](data);
                    ent thread function_258b974cf7d16877(self);
                } else if (ent.streakname == "lrad") {
                    ent dodamage(250, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    function_1475aa09aebba72(ent);
                    ent thread function_258b974cf7d16877(self);
                } else if (ent.streakname == "airdrop") {
                    ent dodamage(10, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                } else if (ent.streakname == "switchblade_drone") {
                    function_1475aa09aebba72(ent);
                    ent thread function_258b974cf7d16877(self);
                } else if (ent.streakname == "scrambler_drone_guard") {
                    ent dodamage(300, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                } else if (ent.streakname == "cluster_spike") {
                    ent dodamage(100, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                } else if (ent.streakname == "cruise_predator") {
                    ent dodamage(1, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    if (getdvarint(@"hash_82fc9d1ee58b396", 1) == 1) {
                        function_1475aa09aebba72(ent);
                        ent thread function_258b974cf7d16877(self);
                    }
                } else if (ent.streakname == "bunker_buster") {
                    ent dodamage(1, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    if (getdvarint(@"hash_82fc9d1ee58b396", 1) == 1) {
                        function_1475aa09aebba72(ent);
                        ent thread function_258b974cf7d16877(self);
                    }
                } else if (ent.streakname == "pac_sentry") {
                    ent dodamage(30, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    data = namespace_169cd7a8fbc76ee5::packdamagedata(self, ent, 1, self.currentprimaryweapon, "MOD_EXPLOSIVE", self);
                    if (!istrue(ent.var_195cf5a953ae9265)) {
                        ent thread namespace_6ca1587edcca0018::function_876be54dd49f69a9(data);
                    }
                } else if (ent.streakname == "airdrop_escort") {
                    ent dodamage(5, (0, 0, 0), self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    function_1475aa09aebba72(ent);
                    data = namespace_25ead30c6ed027fb::packdamagedata(self, ent, 1, self.currentprimaryweapon, "MOD_EXPLOSIVE", self);
                    function_1475aa09aebba72(ent);
                    ent thread namespace_33ee5ceeb5f1d380::function_dbfa95f808879295(data, 5);
                } else if (ent.streakname == "hover_jet") {
                    ent dodamage(5, (0, 0, 0), self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    data = namespace_25ead30c6ed027fb::packdamagedata(self, ent, 1, self.currentprimaryweapon, "MOD_EXPLOSIVE", self);
                    ent thread namespace_e70862d8d2eb291c::function_8b040f320bd1e206(data);
                } else if (ent.streakname == "chopper_gunner") {
                    ent dodamage(10, (0, 0, 0), self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    data = namespace_25ead30c6ed027fb::packdamagedata(self, ent, 1, self.currentprimaryweapon, "MOD_EXPLOSIVE", self);
                    ent thread namespace_b1378d83bac67c85::function_d33b650337c6008b(data);
                } else if (ent.streakname == "gunship") {
                    ent dodamage(10, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    data = namespace_25ead30c6ed027fb::packdamagedata(self, ent, 1, self.currentprimaryweapon, "MOD_EXPLOSIVE", self);
                    ent namespace_e21c52e4e1a72be6::function_377ab89187436937(data);
                } else if (ent.streakname == "remote_turret") {
                    ent dodamage(70, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    function_1475aa09aebba72(ent);
                    ent thread function_4e9544f537fa99d6(self);
                } else if (ent.streakname == "drone_swarm") {
                    ent dodamage(50, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                }
            } else if (isdefined(ent.equipmentref) && utility::array_contains(getactiveequipmentarray(), ent)) {
                equipmentname = ent.equipmentref;
                if (issubstr(ent.equipmentref, "_jup")) {
                    equipmentname = function_95c6391212a25f7c(equipmentname, "_jup");
                }
                switch (ent.equipmentref) {
                case #"hash_4320d77f90725183":
                    ent dodamage(1, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    break;
                case #"hash_2354208d9af64220":
                    ent dodamage(1, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    break;
                case #"hash_3995658e01f4fac1":
                    ent dodamage(1, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    break;
                case #"hash_c848458cca24d656":
                    ent dodamage(9999, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    break;
                case #"hash_cbcb2b145327e750":
                    ent dodamage(9999, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    break;
                case #"hash_29972969a98220a1":
                case #"hash_ecd28780631ff043":
                    ent dodamage(9999, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    break;
                case #"hash_91076f076ee682f4":
                    ent dodamage(9999, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    break;
                case #"hash_1602aabae23dc4b7":
                    ent dodamage(9999, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    break;
                case #"hash_1eeb976ed8edf3e2":
                    ent dodamage(9999, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    break;
                case #"hash_f4e4d96da65cbe0c":
                    ent dodamage(9999, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    break;
                case #"hash_7c09786dbc292c05":
                    ent dodamage(9999, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    break;
                case #"hash_b64c903871503d5d":
                    ent dodamage(9999, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    break;
                case #"hash_731f922359382673":
                    ent dodamage(9999, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    break;
                case #"hash_c613333b4f1bbb78":
                    ent dodamage(9999, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    break;
                case #"hash_33dc79aea3c12e98":
                    ent dodamage(9999, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    break;
                case #"hash_1a5a56a6fdfa6d6b":
                    ent dodamage(9999, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    break;
                case #"hash_4a85ee2b82965fe2":
                    ent dodamage(9999, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    break;
                default:
                    break;
                }
            } else if (isdefined(ent.classname)) {
                if (ent.classname == "grenade" && isdefined(ent.equipmentref)) {
                    if (ent.equipmentref == "sonar_pulse_mp") {
                        ent dodamage(9999, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    } else if (ent.equipmentref == "equip_breacher_drone") {
                        ent thread breacher_drone::function_42393d355d1090ff(0);
                    } else if (ent.equipmentref == "equip_snapshot_grenade") {
                        ent dodamage(9999, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    } else if (ent.equipmentref == "equip_decoy") {
                        ent thread decoy_grenade::decoy_destroy();
                    } else if (ent.equipmentref == "equip_shockstick") {
                        ent dodamage(9999, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    } else if (ent.equipmentref == "equip_tracker_grenade") {
                        ent dodamage(9999, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    } else if (ent.equipmentref == "equip_bunkerbuster") {
                        ent thread namespace_14ec1bc880a07c3b::function_a5a20b852c325190();
                    }
                } else if (ent.classname == "misc_turret") {
                    if (isdefined(ent.var_8862825a0618bda) && ent.var_8862825a0618bda == "tacCam") {
                        ent dodamage(9999, self.origin, self, self, "MOD_EXPLOSIVE", self.currentprimaryweapon);
                    }
                } else if (ent.classname == "script_vehicle") {
                    ent thread function_4e9544f537fa99d6(self);
                } else if (ent.classname == "script_model" && isdefined(ent.weapon_name) && ent.weapon_name == "deployed_decoy_mp") {
                    ent dodamage(50, self.origin, self, self, undefined, self.currentprimaryweapon);
                } else if (ent.classname == "script_model" && isdefined(ent.animname) && ent.animname == "super_smoke_airdrop") {
                    ent dodamage(50, self.origin, self, self, undefined, self.currentprimaryweapon);
                } else if (ent.classname == "scriptable_bomb_01") {
                    ent dodamage(50, self.origin, self, self, undefined, self.currentprimaryweapon);
                } else if (ent.classname == "scriptable_bomb_c4_large_double_01") {
                    ent dodamage(50, self.origin, self, self, undefined, self.currentprimaryweapon);
                }
            } else if (isdefined(ent.animname) && ent.animname == "super_smoke_airdrop") {
                data = namespace_25ead30c6ed027fb::packdamagedata(self, ent, 1, self.currentprimaryweapon, "MOD_EXPLOSIVE", self);
                ent thread [[ ent.empstartcallback ]](data);
            }
        }
    }
    foreach (scriptable in var_38b853e7e5c069f8) {
        if (scriptable.classname == "scriptable") {
            if (scriptable.type == "ob_aethernest_cyst_scriptable") {
                scriptable function_b85de89251e1fe76(200, self, self);
            } else if (scriptable.type == "jup_ob_zombie_control_spore") {
                scriptable function_b85de89251e1fe76(200, self, self);
            } else if (scriptable.type == "dmz_uav_tower") {
                if (var_b83b0fc6a542638) {
                    if (isdefined(scriptable.var_dcc5f31ec71d6d8a) && istrue(scriptable.var_dcc5f31ec71d6d8a == self.team)) {
                        continue;
                    }
                    data = spawnstruct();
                    data.time = 5;
                    data.attacker = self;
                    data.reason = "STORMENDER";
                    scriptable.var_73bdebbc7da468a3.var_107d6e8fc82a82a8 thread [[ scriptable.var_3545410459b16762 ]](data);
                }
            }
        }
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x128a9
// Size: 0x1166
function function_aa3939ed0f60d04e(objweapon, var_85fa2cdcb19d076c) {
    level endon("game_ended");
    self endon("death");
    if (!isalive(self)) {
        return;
    }
    viewangles = self getplayerangles();
    var_9476c342add1a849 = self geteye();
    playerforward = anglestoforward(viewangles);
    var_22cd3471507bf946 = var_9476c342add1a849 + playerforward * 3500;
    var_6405edb8ef20fe35 = trace::create_contents(1, 0, 0, 0, 0, 1);
    waittillframeend();
    var_9b80af519ecdb255 = [];
    var_c8863cdecb0560f4 = [];
    var_38b853e7e5c069f8 = [];
    var_f2577c0ea89a8e3 = trace::sphere_trace_get_all_results(var_9476c342add1a849, var_22cd3471507bf946, 60, self, var_6405edb8ef20fe35, 0, 1);
    foreach (result in var_f2577c0ea89a8e3) {
        if (isdefined(result["entity"])) {
            var_9b80af519ecdb255 = array_add(var_9b80af519ecdb255, result["entity"]);
        } else if (isdefined(result["scriptable"])) {
            if (sighttracepassed(var_9476c342add1a849, result["position"], 0, undefined, undefined, 1)) {
                var_38b853e7e5c069f8 = array_add(var_38b853e7e5c069f8, result["scriptable"]);
            }
        }
    }
    var_275d78a9e8d113aa = 0;
    sortbydistance(var_9b80af519ecdb255, self.origin);
    foreach (var_bfc17b7a8425418 in var_9b80af519ecdb255) {
        if (isdefined(var_bfc17b7a8425418.team) && var_bfc17b7a8425418.team == self.team) {
            continue;
        }
        if (isdefined(var_bfc17b7a8425418.owner) && isdefined(var_bfc17b7a8425418.owner.team) && var_bfc17b7a8425418.owner.team == self.team) {
            continue;
        }
        if (isdefined(level.var_250dc4a23947d41) && function_fc64178f71375137(level.var_250dc4a23947d41, var_bfc17b7a8425418)) {
            continue;
        }
        if (var_275d78a9e8d113aa < 4) {
            if (isdefined(var_bfc17b7a8425418)) {
                hitlocation = var_bfc17b7a8425418 getcentroid();
                hitlocation = (hitlocation[0], hitlocation[1], hitlocation[2] + var_bfc17b7a8425418 getboundshalfsize()[2]);
            }
            if (sighttracepassed(var_9476c342add1a849, hitlocation, 0, var_bfc17b7a8425418, undefined, 1)) {
                var_c8863cdecb0560f4 = array_add(var_c8863cdecb0560f4, var_bfc17b7a8425418);
                var_275d78a9e8d113aa++;
            }
        }
    }
    var_1fa763edf5f1cc00 = trace::create_contents(0, 1, 1, 1);
    if (isdefined(level.ob.var_84b0d6cec49dc02b)) {
        foreach (var_db662a244a03025a in level.ob.var_84b0d6cec49dc02b) {
            if (!isdefined(var_db662a244a03025a) || !isdefined(var_db662a244a03025a.origin)) {
                continue;
            }
            if (isdefined(var_db662a244a03025a.var_fe06362889e1c0ec)) {
                var_6eaae03404b05a0 = anglestoup(var_db662a244a03025a.var_fe06362889e1c0ec.angles);
                var_6cd94f42dce2a663 = var_db662a244a03025a.origin + var_6eaae03404b05a0 * 10;
            } else {
                var_6cd94f42dce2a663 = var_db662a244a03025a.origin;
            }
            if (distancesquared(self.origin, var_6cd94f42dce2a663) <= 12250000) {
                if (self worldpointinreticle_circle(var_6cd94f42dce2a663, 65, 90) == 1) {
                    var_8bd607a2b7bbf567 = ray_trace(var_9476c342add1a849, var_6cd94f42dce2a663, var_85fa2cdcb19d076c, var_1fa763edf5f1cc00, 0, 1, 1);
                    if (isdefined(var_8bd607a2b7bbf567) && isdefined(var_8bd607a2b7bbf567["scriptable"]) && isdefined(var_8bd607a2b7bbf567["scriptable"].type) && var_8bd607a2b7bbf567["scriptable"].type == "ob_aethernest_cyst_scriptable") {
                        var_38b853e7e5c069f8 = array_add(var_38b853e7e5c069f8, var_db662a244a03025a);
                    }
                }
            }
        }
    }
    if (isdefined(level.ob.var_3a9a102c22457907)) {
        foreach (spore in level.ob.var_3a9a102c22457907) {
            if (isdefined(spore.var_6a81cc50540523c3) && spore.var_6a81cc50540523c3 == "inactive" && isdefined(spore.shield)) {
                shield = spore.shield;
                var_a7901d75f7306461 = (shield.origin[0], shield.origin[1], shield.origin[2] + 30);
                if (distancesquared(self.origin, var_a7901d75f7306461) <= 12250000) {
                    if (self worldpointinreticle_circle(var_a7901d75f7306461, 65, 100) == 1) {
                        if (sighttracepassed(var_9476c342add1a849, var_a7901d75f7306461, 0, shield, var_85fa2cdcb19d076c, 1)) {
                            var_c8863cdecb0560f4 = array_add(var_c8863cdecb0560f4, shield);
                        }
                    }
                }
            }
        }
    }
    if (isdefined(level.activekillstreaks)) {
        foreach (ent in level.activekillstreaks) {
            if (isdefined(ent.team) && ent.team == self.team) {
                continue;
            }
            if (isdefined(ent.owner) && isdefined(ent.owner.team) && ent.owner.team == self.team) {
                continue;
            }
            if (distancesquared(self.origin, ent.origin) <= 12250000) {
                if (sighttracepassed(var_9476c342add1a849, ent.origin, 0, ent, var_85fa2cdcb19d076c, 1) && self worldpointinreticle_circle(ent.origin, 65, 50) == 1) {
                    var_c8863cdecb0560f4 = array_add(var_c8863cdecb0560f4, ent);
                }
            }
        }
    }
    foreach (ent in getactiveequipmentarray()) {
        if (isdefined(ent.team) && ent.team == self.team) {
            continue;
        }
        if (isdefined(ent.owner) && isdefined(ent.owner.team) && ent.owner.team == self.team) {
            continue;
        }
        var_54ceffc61f7e4aee = distancesquared(self.origin, ent.origin);
        if (var_54ceffc61f7e4aee > 12250000) {
            continue;
        }
        if (var_54ceffc61f7e4aee > 160000 && !sighttracepassed(var_9476c342add1a849, ent.origin, 0, ent, var_85fa2cdcb19d076c, 1)) {
            continue;
        }
        if (self worldpointinreticle_circle(ent.origin, 65, 50) == 1) {
            var_c8863cdecb0560f4 = array_add(var_c8863cdecb0560f4, ent);
        }
    }
    foreach (ent in level.grenades) {
        if (!isdefined(ent)) {
            continue;
        }
        if (isdefined(ent.team) && ent.team == self.team) {
            continue;
        }
        if (isdefined(ent.owner) && isdefined(ent.owner.team) && ent.owner.team == self.team) {
            continue;
        }
        var_88e33e4830ac7d47 = (ent.origin[0], ent.origin[1], ent.origin[2] + 15);
        var_54ceffc61f7e4aee = distancesquared(self.origin, var_88e33e4830ac7d47);
        if (var_54ceffc61f7e4aee > 12250000) {
            continue;
        }
        if (var_54ceffc61f7e4aee > 160000 && !sighttracepassed(var_9476c342add1a849, var_88e33e4830ac7d47, 0, ent, var_85fa2cdcb19d076c, 1)) {
            continue;
        }
        if (self worldpointinreticle_circle(var_88e33e4830ac7d47, 65, 50) == 1) {
            var_c8863cdecb0560f4 = array_add(var_c8863cdecb0560f4, ent);
        }
    }
    if (isdefined(level.supportdrones)) {
        foreach (drone in level.supportdrones) {
            if (distancesquared(self.origin, drone.origin) <= 12250000) {
                if (sighttracepassed(var_9476c342add1a849, drone.origin, 0, drone, var_85fa2cdcb19d076c, 1)) {
                    if (self worldpointinreticle_circle(drone.origin, 65, 90) == 1) {
                        var_c8863cdecb0560f4 = array_add(var_c8863cdecb0560f4, drone);
                    }
                }
            }
        }
    }
    if (isdefined(level.aiSentryTurrets) && isdefined(level.aiSentryTurrets.var_a4cd5b9ae4a509f4)) {
        foreach (sentry in level.aiSentryTurrets.var_a4cd5b9ae4a509f4) {
            var_bf6447599b22469f = (sentry.origin[0], sentry.origin[1], sentry.origin[2] + 30);
            if (distancesquared(self.origin, var_bf6447599b22469f) <= 12250000) {
                if (sighttracepassed(var_9476c342add1a849, var_bf6447599b22469f, 0, sentry, var_85fa2cdcb19d076c, 1)) {
                    if (self worldpointinreticle_circle(var_bf6447599b22469f, 65, 120) == 1) {
                        var_c8863cdecb0560f4 = array_add(var_c8863cdecb0560f4, sentry);
                    }
                }
            }
        }
    }
    if (isdefined(level.ob.var_7dd4780d4e4bff4d)) {
        foreach (var_1d073bb10ada5aca in level.ob.var_7dd4780d4e4bff4d) {
            if (isdefined(var_1d073bb10ada5aca.var_b261b594e5c09a86)) {
                foreach (sentry in var_1d073bb10ada5aca.var_b261b594e5c09a86) {
                    if (isalive(sentry)) {
                        var_bf6447599b22469f = (sentry.origin[0], sentry.origin[1], sentry.origin[2] + 60);
                        if (distancesquared(self.origin, var_bf6447599b22469f) <= 12250000) {
                            if (sighttracepassed(var_9476c342add1a849, var_bf6447599b22469f, 0, sentry, var_85fa2cdcb19d076c, 1)) {
                                if (self worldpointinreticle_circle(var_bf6447599b22469f, 65, 120) == 1) {
                                    var_c8863cdecb0560f4 = array_add(var_c8863cdecb0560f4, sentry);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (isdefined(level.ob.var_86a8bab4c9f7bf4f)) {
        foreach (var_8460ea35acc6e0ee in level.ob.var_86a8bab4c9f7bf4f) {
            if (isdefined(var_8460ea35acc6e0ee.move)) {
                var_f3cc54b3055c4a06 = var_8460ea35acc6e0ee.move;
                var_b19662f14c0684f8 = var_f3cc54b3055c4a06.origin;
                if (distancesquared(self.origin, var_b19662f14c0684f8) <= 12250000) {
                    if (sighttracepassed(var_9476c342add1a849, var_b19662f14c0684f8, 0, var_f3cc54b3055c4a06, var_85fa2cdcb19d076c, 1)) {
                        if (self worldpointinreticle_circle(var_b19662f14c0684f8, 65, 120) == 1) {
                            var_c8863cdecb0560f4 = array_add(var_c8863cdecb0560f4, var_f3cc54b3055c4a06);
                        }
                    }
                }
            }
        }
    }
    var_c8863cdecb0560f4 = array_remove_duplicates(var_c8863cdecb0560f4);
    var_c8863cdecb0560f4 = sortbydistance(var_c8863cdecb0560f4, self.origin);
    var_6b89c719fde173c1 = self.currentprimaryweapon;
    damageorigin = self.origin;
    foreach (ent in var_c8863cdecb0560f4) {
        if (isdefined(ent.team) && ent.team == self.team) {
            continue;
        }
        if (isdefined(ent.owner) && isdefined(ent.owner.team) && ent.owner.team == self.team) {
            continue;
        }
        if (isagent(ent) && isdefined(ent.team) && ent.team != self.team) {
            if (isdefined(ent.unittype)) {
                if (ent.unittype == "zombie") {
                    var_ee67fb3e8bee9a6e = getdvarint(@"hash_245a8ac774461e4a", 40);
                    ent thread function_bdeef7bfa895108c(var_ee67fb3e8bee9a6e, self, damageorigin, var_6b89c719fde173c1, 1);
                    continue;
                } else if (ent.unittype == "soldier") {
                    var_12c07b09a7777175 = getdvarint(@"hash_7cdb49e8f87074af", 20);
                    ent thread function_bdeef7bfa895108c(var_12c07b09a7777175, self, damageorigin, var_6b89c719fde173c1, 0);
                    continue;
                }
            }
        } else if (isdefined(ent.classname)) {
            if (ent.classname == "script_vehicle") {
                if (isdefined(ent.helperdronetype) && ent.helperdronetype == "scrambler_drone_guard") {
                    ent dodamage(250, damageorigin, self, self, "MOD_EXPLOSIVE", var_6b89c719fde173c1);
                    continue;
                } else if (isdefined(ent.var_9359753a6347dd67)) {
                    ent dodamage(25, damageorigin, self, self, "MOD_EXPLOSIVE", var_6b89c719fde173c1);
                    ent thread function_4e9544f537fa99d6(self);
                    continue;
                } else if (isdefined(ent.subclass) && issubstr(ent.subclass, "helicopter")) {
                    ent dodamage(275, damageorigin, self, self, "MOD_EXPLOSIVE", var_6b89c719fde173c1);
                    continue;
                } else if (isdefined(ent.targetname) && ent.targetname == "remote_tank") {
                    ent dodamage(275, damageorigin, self, self, "MOD_EXPLOSIVE", var_6b89c719fde173c1);
                    ent thread function_4e9544f537fa99d6(self);
                    continue;
                } else if (isdefined(ent.var_aa6fe6af4cbbdd47)) {
                    ent thread function_4e9544f537fa99d6(self);
                }
            } else if (ent.classname == "grenade") {
                ent dodamage(200, damageorigin, self, self, "MOD_EXPLOSIVE", var_6b89c719fde173c1);
            } else if (ent.classname == "misc_turret") {
                ent dodamage(200, damageorigin, self, self, "MOD_EXPLOSIVE", var_6b89c719fde173c1);
                ent thread function_e1e1af51fbad6907();
            }
        }
        ent dodamage(200, self.origin, self, self, "MOD_EXPLOSIVE", var_6b89c719fde173c1);
        continue;
    }
    foreach (scriptable in var_38b853e7e5c069f8) {
        if (scriptable.classname == "scriptable") {
            if (scriptable.type == "ob_aethernest_cyst_scriptable") {
                scriptable function_b85de89251e1fe76(300, self, self);
            }
        }
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a16
// Size: 0x85
function function_bdeef7bfa895108c(damage, attacker, origin, weapon, var_8df4d6ecebcb0faf) {
    self endon("death");
    function_f632348cbb773537(level.var_30b163d5fb8dc7d9, self);
    if (isdefined(attacker)) {
        if (var_8df4d6ecebcb0faf) {
            val::set("drone_launcher", "pain", 0);
        }
        self dodamage(damage, origin, attacker, attacker, "MOD_UNKNOWN", weapon);
        if (var_8df4d6ecebcb0faf) {
            val::reset("drone_launcher", "pain");
        }
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13aa2
// Size: 0xf7
function function_a0a176ec45783695(attacker, time) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    self dodamage(1, self.origin, attacker, attacker, "MOD_EXPLOSIVE", attacker.currentprimaryweapon, undefined, undefined);
    if (namespace_5a51aa78ea0b1b9f::can_be_empd() == 1 && !istrue(self.var_85dc59c6a906819f)) {
        attacker thread namespace_58a74e7d54b56e8d::givescoreforempedplayer();
        attacker thread namespace_aad14af462a74d08::function_f05d761dc1bfa1b5();
        if (issharedfuncdefined("emp", "watch_checkForLauncherWeapons")) {
            self thread [[ getsharedfunc("emp", "watch_checkForLauncherWeapons") ]]();
        }
        self notify("emp_started");
        self notify("emp_applied");
        self.var_85dc59c6a906819f = 1;
        thread namespace_5a51aa78ea0b1b9f::function_9d31a370d60f86da(self, 2);
    } else {
        return;
    }
    wait(time);
    self.var_85dc59c6a906819f = undefined;
    self notify("dronegun_emp_cleared");
    if (!isdefined(self.var_5c079aa1be2b9bb)) {
        self notify("emp_cleared");
        self notify("stopLauncherCheck");
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ba0
// Size: 0x83
function function_258b974cf7d16877(attackingplayer) {
    level endon("game_ended");
    self notify("object_hit_by_dronegun");
    self endon("object_hit_by_dronegun");
    data = namespace_25ead30c6ed027fb::packdamagedata(attackingplayer, self, 1, attackingplayer.currentprimaryweapon, "MOD_EXPLOSIVE", attackingplayer);
    if (isdefined(self.var_5d67315cdcf62026)) {
        self thread [[ self.var_5d67315cdcf62026 ]](data);
    }
    wait(5);
    if (isdefined(self.var_2ba749157b05bad7)) {
        self thread [[ self.var_2ba749157b05bad7 ]](data);
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13c2a
// Size: 0x83
function function_4e9544f537fa99d6(attackingplayer) {
    level endon("game_ended");
    self notify("object_hit_by_dronegun");
    self endon("object_hit_by_dronegun");
    data = namespace_25ead30c6ed027fb::packdamagedata(attackingplayer, self, 1, attackingplayer.currentprimaryweapon, "MOD_EXPLOSIVE", attackingplayer);
    if (isdefined(self.var_aa6fe6af4cbbdd47)) {
        self thread [[ self.var_aa6fe6af4cbbdd47 ]](data);
    }
    wait(5);
    if (isdefined(self.var_2ca1a8cc9f467817)) {
        self thread [[ self.var_2ca1a8cc9f467817 ]](data);
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13cb4
// Size: 0x7a
function function_1475aa09aebba72(var_d7eea22a14a52fd0) {
    if (!isdefined(self.var_48acfe82a1d42d61)) {
        self.var_48acfe82a1d42d61 = [];
    }
    self.var_48acfe82a1d42d61 = array_removeundefined(self.var_48acfe82a1d42d61);
    if (!array_contains(self.var_48acfe82a1d42d61, var_d7eea22a14a52fd0)) {
        self.var_48acfe82a1d42d61 = array_add(self.var_48acfe82a1d42d61, var_d7eea22a14a52fd0);
        thread killstreaks::givescoreforempedkillstreak();
        thread function_2b68ad55a6fdd0d4(var_d7eea22a14a52fd0, 3);
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13d35
// Size: 0x57
function function_2b68ad55a6fdd0d4(var_d7eea22a14a52fd0, timer) {
    level endon("game_ended");
    wait(timer);
    if (isdefined(self.var_48acfe82a1d42d61) && array_contains(self.var_48acfe82a1d42d61, var_d7eea22a14a52fd0)) {
        self.var_48acfe82a1d42d61 = array_remove(self.var_48acfe82a1d42d61, var_d7eea22a14a52fd0);
    }
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13d93
// Size: 0x65
function function_e1e1af51fbad6907() {
    self endon("death");
    self setmode("sentry_offline");
    playfxontag(getfx("sentry_gun_stun_fx"), self, "tag_aim_pivot");
    self laseroff();
    wait(2);
    stopfxontag(level._effect["sentry_gun_stun_fx"], self, "tag_aim_pivot");
    self setmode("sentry");
    self laseron();
}

// Namespace weapons/namespace_3bbb5a98b932c46f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13dff
// Size: 0x11e
function recommendedStatusBySeason(objweapon, inflictor) {
    var_55a3d589b1919af0 = [];
    if (isdefined(objweapon)) {
        var_18cfb23a952605a8 = namespace_e0ee43ef2dddadaa::getweaponrootname(objweapon);
        var_85240ff9a325f4d = namespace_e0ee43ef2dddadaa::function_8477d8595e0364a7(var_18cfb23a952605a8, [0:#"hash_c598198697548df4"]);
        if (isdefined(var_85240ff9a325f4d)) {
            if (isdefined(var_85240ff9a325f4d.var_26755ea5f1d38138)) {
                foreach (index, var_e6f430a0bb5a26a3 in var_85240ff9a325f4d.var_26755ea5f1d38138) {
                    if (isdefined(var_85240ff9a325f4d.var_26755ea5f1d38138[index].priority)) {
                        var_55a3d589b1919af0[var_55a3d589b1919af0.size] = var_85240ff9a325f4d.var_26755ea5f1d38138[index].priority;
                    } else {
                        var_55a3d589b1919af0[var_55a3d589b1919af0.size] = 0;
                    }
                }
                while (var_55a3d589b1919af0.size < 7) {
                    var_55a3d589b1919af0[var_55a3d589b1919af0.size] = 0;
                }
                return var_55a3d589b1919af0;
            } else {
                return undefined;
            }
        } else {
            return undefined;
        }
    } else {
        return undefined;
    }
}

