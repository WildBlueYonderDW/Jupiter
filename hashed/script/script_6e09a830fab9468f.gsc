#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp\utility.gsc;
#using scripts\engine\math.gsc;
#using script_5af9038262d22c96;
#using script_6f1e07ce9ff97d5f;
#using script_12e2fb553ec1605e;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_74502a9e0ef1f19c;
#using script_189b67b2735b981d;
#using script_7c40fa80892a721;
#using script_7ef95bba57dc4b82;
#using scripts\cp\loot_system.gsc;
#using scripts\cp\cp_outline_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp\perks\cp_perks.gsc;

#namespace perks;

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x163e
// Size: 0x10
function initperks() {
    init_core_mp_perks();
    function_fe0d47259cb779c3();
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1656
// Size: 0x2a4
function init_each_perk() {
    if (!isdefined(level.health_scalar)) {
        level.health_scalar = 1;
    }
    level.extra_charge_func = &should_give_extra_charge;
    self.perk_data = [];
    self.perk_data["max_health"] = 100 * level.health_scalar;
    self.perk_data["regen_time_scalar"] = 1;
    self.perk_data["melee_scalar"] = 1;
    self.perk_data["melee_stun_radius"] = 0;
    self.perk_data["revive_time_scalar"] = 1;
    self.perk_data["move_speed_scalar"] = 1;
    self.perk_data["revive_damage_scalar"] = 1;
    self.perk_data["explosive_damage_scalar"] = 1;
    self.perk_data["offhand_count"] = 1;
    self.perk_data["launcher_ammo"] = 4;
    self.perk_data["friendly_explosive_damage_reduction"] = 1;
    self.perk_data["enemy_explosive_damage_reduction"] = 1;
    self.perk_data["bullet_damage_scalar"] = 1;
    self.perk_data["stealth_dist_scalar"] = 1;
    self.perk_data["stealth_velocity_override"] = 0;
    self.perk_data["stealth_weapon_noise_scalar"] = 1;
    self.perk_data["short_range_damage_scalar"] = 1;
    self.perk_data["hipfire_damage_scalar"] = 1;
    self.perk_data["sprint_damage_scalar"] = 1;
    self.perk_data["carrying_melee_damage_scalar"] = 1;
    self.perk_data["increased_materials"] = 0;
    self.perk_data["increased_materials_wallet"] = 0;
    self.perk_data["additional_crafting_items"] = 0;
    self.perk_data["cheap_crafting_recipe"] = 0;
    self.perk_data["increased_materials"] = 0;
    self.perk_data["increased_materials_wallet"] = 0;
    self.perk_data["additional_crafting_items"] = 0;
    self.perk_data["cheap_crafting_recipe"] = 0;
    self.perk_data["super_fill_scalar"] = 1;
    self.perk_data["weapons_have_full_ammo"] = 1;
    self.perk_data["enemy_damage_to_player_armor_scalar"] = 1;
    self.perk_data["damage_to_enemy_armor_scalar"] = 1;
    self.perk_data["hack_speed_boost"] = 0;
    thread namespace_dba31853823d1b3::track_consecutive_kills();
    init_class_changed_values();
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1902
// Size: 0x5d
function init_class_changed_values() {
    self setaimspreadmovementscale(1);
    self notify("end_medic_health_regen");
    if (isdefined(self.old_view_kick)) {
        self setviewkickscale(self.old_view_kick);
        self.old_view_kick = undefined;
    }
    if (isdefined(self.old_recoil_scale)) {
        self player_recoilscaleon(100);
        self.old_recoil_scale = undefined;
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1967
// Size: 0x26
function get_perk(var_ab4a6235827672a0) {
    if (isdefined(self.perk_data[var_ab4a6235827672a0])) {
        return self.perk_data[var_ab4a6235827672a0];
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1995
// Size: 0x2f
function set_perk(var_ab4a6235827672a0, value) {
    if (isdefined(self.perk_data[var_ab4a6235827672a0])) {
        self.perk_data[var_ab4a6235827672a0] = value;
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19cc
// Size: 0x2
function blank() {
    
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19d6
// Size: 0x2d
function medic_speed_buff() {
    self.perk_data["move_speed_scalar"] = 1.12;
    self.movespeedscaler = 1.12;
    thread namespace_751288259782653c::updatemovespeedscale();
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a0b
// Size: 0xd0
function medic_health_regen(dist_sqr) {
    self endon("death");
    self endon("disconnect");
    self endon("end_medic_health_regen");
    self endon("giving_class");
    var_55edbc76cb692e0a = dist_sqr > 0;
    while (true) {
        foreach (player in level.players) {
            if (player scripts\cp_mp\utility\player_utility::_isalive() && !isdefined(player.medic_regeneration)) {
                if (var_55edbc76cb692e0a && distancesquared(self.origin, player.origin) > dist_sqr) {
                }
            }
        }
        wait 1;
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ae3
// Size: 0x56
function medic_regenerate_health_once() {
    self endon("death");
    self endon("disconnect");
    self.medic_regeneration = 1;
    wait 1;
    self.health = int(min(self.maxhealth, self.health + 5));
    self.medic_regeneration = undefined;
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b41
// Size: 0xd5
function should_give_extra_charge(equipment) {
    if (isdefined(equipment)) {
        switch (equipment) {
        case #"hash_142a787e36d7d7ce":
        case #"hash_2354208d9af64220":
        case #"hash_3995658e01f4fac1":
        case #"hash_4320d77f90725183":
        case #"hash_4f62b5fa00ecd075":
        case #"hash_5fca4943a78ace9c":
        case #"hash_70200b060d09d860":
        case #"hash_8c7819f0a3fbd1e0":
        case #"hash_9ba0a6ff6081954e":
        case #"hash_de4641ddbc44a7ba":
        case #"hash_e156752cb79526e8":
        case #"hash_f0907f858c134cb4":
        case #"hash_fb6b649176cec75d": 
            return self.perk_data["offhand_count"];
        default: 
            break;
        }
    }
    return undefined;
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c1f
// Size: 0x77
function reload_on_kill() {
    while (true) {
        self waittill("kill_score");
        curweap = self getcurrentprimaryweapon();
        total_ammo = self getammocount(curweap);
        clip_size = int(min(total_ammo, weaponclipsize(curweap)));
        remaining_stock = total_ammo - clip_size;
        self setweaponammoclip(curweap, clip_size);
        self setweaponammostock(curweap, remaining_stock);
        wait 0.1;
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c9e
// Size: 0x44
function reduce_recoil() {
    self.old_view_kick = self getviewkickscale();
    self.overchargeviewkickscale = 0;
    self.old_recoil_scale = self player_getrecoilscale();
    self player_recoilscaleon(0);
    self.onhelisniper = 1;
    namespace_a0628d6954815ef8::updateviewkickscale();
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cea
// Size: 0x5f
function remove_reduce_recoil() {
    if (isdefined(self.old_recoil_scale)) {
        if (self.old_recoil_scale != -1) {
            self player_recoilscaleon(self.old_recoil_scale);
        } else {
            self player_recoilscaleon(100);
        }
        self.old_recoil_scale = undefined;
    }
    self.overchargeviewkickscale = undefined;
    self.onhelisniper = undefined;
    namespace_a0628d6954815ef8::updateviewkickscale();
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d51
// Size: 0x1a
function reduce_bullet_spread() {
    giveperk("specialty_bulletaccuracy");
    self setaimspreadmovementscale(0.1);
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d73
// Size: 0xaf
function run_deadeye_charge_watcher() {
    self endon("disconnect");
    self endon("end_deadeye_charge_watcher");
    self endon("giving_class");
    self.deadeye_charge = undefined;
    var_f45f84783a1cc4d2 = undefined;
    var_bc4b686e2f1d19e2 = undefined;
    var_5c36fc93f90947f5 = 500;
    while (true) {
        if (self adsbuttonpressed()) {
            cur_time = gettime();
            if (!isdefined(var_f45f84783a1cc4d2)) {
                var_f45f84783a1cc4d2 = cur_time;
                var_bc4b686e2f1d19e2 = cur_time + var_5c36fc93f90947f5;
            } else if (cur_time > var_bc4b686e2f1d19e2) {
                if (istrue(self.deadeye_charge)) {
                }
                self.deadeye_charge = 1;
            }
        } else {
            self.deadeye_charge = undefined;
            var_f45f84783a1cc4d2 = undefined;
            var_bc4b686e2f1d19e2 = undefined;
        }
        wait 0.05;
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e2a
// Size: 0x898
function init_core_mp_perks() {
    level.perksetfuncs = [];
    level.scriptperks = [];
    level.perksetfuncs = [];
    level.perkunsetfuncs = [];
    level.scriptperks["specialty_falldamage"] = 1;
    level.scriptperks["specialty_armorpiercing"] = 1;
    level.scriptperks["specialty_gung_ho"] = 1;
    level.scriptperks["specialty_momentum"] = 1;
    level.scriptperks["specialty_remote_defuse"] = 1;
    level.perksetfuncs["specialty_momentum"] = &setmomentum;
    level.perkunsetfuncs["specialty_momentum"] = &unsetmomentum;
    level.perksetfuncs["specialty_falldamage"] = &setfreefall;
    level.perkunsetfuncs["specialty_falldamage"] = &unsetfreefall;
    level.perksetfuncs["specialty_remote_defuse"] = &setremotedefuse;
    level.perkunsetfuncs["specialty_remote_defuse"] = &unsetremotedefuse;
    level.scriptperks["specialty_hustle"] = 1;
    level.extraperkmap["specialty_hustle"] = ["specialty_supersprint_enhanced", "specialty_fastcrouchmovement", "specialty_stalker", "specialty_quickdraw", "specialty_fastreload", "specialty_quickswap"];
    level.scriptperks["specialty_bulletdamage"] = 1;
    level.extraperkmap["specialty_bulletdamage"] = ["specialty_overcharge"];
    level.perksetfuncs["specialty_overcharge"] = &setovercharge;
    level.perkunsetfuncs["specialty_overcharge"] = &unsetovercharge;
    registerscriptperk("specialty_restock", undefined, undefined, ["specialty_recharge_equipment"]);
    registerscriptperk("specialty_recharge_equipment", &give_restock, &take_restock);
    registerscriptperk("specialty_tune_up", undefined, undefined, ["specialty_improved_field_upgrades", "specialty_faster_field_upgrade"]);
    registerscriptperk("specialty_improved_field_upgrades");
    registerscriptperk("specialty_faster_field_upgrade", &give_tune_up, &take_tune_up);
    registerscriptperk("specialty_quick_fix", undefined, undefined, ["specialty_reduce_regen_delay_on_kill", "specialty_reduce_regen_delay_on_objective"]);
    registerscriptperk("specialty_reduce_regen_delay_on_kill", &setreduceregendelayonkills, &unsetreduceregendelayonkills);
    registerscriptperk("specialty_reduce_regen_delay_on_objective", &setreduceregendelayonobjective, &unsetreduceregendelayonobjective);
    registerscriptperk("specialty_hardline", &sethardline, &unsethardline);
    registerscriptperk("specialty_extra_tactical", &setExtraTacticalEquipment, &function_c6df31f2ee8fe243);
    registerscriptperk("specialty_extra_deadly", &setExtraPrimaryEquipment, &function_3ba1ba85aad48a42);
    registerscriptperk("specialty_extra_equipment", undefined, undefined, ["specialty_extra_deadly", "specialty_extra_tactical"]);
    registerscriptperk("specialty_warhead", &give_amped, &take_amped, ["specialty_fastreload_launchers"]);
    registerscriptperk("specialty_fastreload_launchers", &setfastreloadlaunchers, &unsetfastreloadlaunchers);
    registerscriptperk("specialty_munitions_2", undefined, undefined, ["specialty_twoprimaries"]);
    registerscriptperk("specialty_twoprimaries", &setoverkill, &unsetoverkill, []);
    registerscriptperk("specialty_strategist", undefined, undefined, ["specialty_killstreak_to_scorestreak"]);
    registerscriptperk("specialty_killstreak_to_scorestreak", &setkillstreaktoscorestreak, &unsetkillstreaktoscorestreak);
    registerscriptperk("specialty_surveillance", undefined, undefined, ["specialty_sixth_sense"]);
    registerscriptperk("specialty_sixth_sense", &function_378625a93d79fdc2, &function_1a4d7090fc81e97);
    registerscriptperk("specialty_extra_shrapnel", undefined, undefined, ["specialty_extra_deadly", "specialty_shrapnel"]);
    registerscriptperk("specialty_shrapnel");
    registerscriptperk("specialty_scavenger_plus", undefined, undefined, ["specialty_scavenger"]);
    registerscriptperk("specialty_guerrilla", undefined, undefined, ["specialty_ghost", "specialty_silentkill", "specialty_sixth_sense_immune", "specialty_heartbreaker"]);
    registerscriptperk("specialty_ghost", &setghost, &unsetghost, ["specialty_gpsjammer"]);
    registerscriptperk("specialty_silentkill");
    registerscriptperk("specialty_sixth_sense_immune");
    registerscriptperk("specialty_tac_resist", undefined, undefined, ["specialty_stun_resistance", "specialty_emp_resist", "specialty_gas_grenade_resist", "specialty_scrambler_resist"]);
    registerscriptperk("specialty_stun_resistance", &setstunresistance, &unsetstunresistance, ["specialty_hard_shell"]);
    registerscriptperk("specialty_emp_resist");
    registerscriptperk("specialty_hard_shell", &sethardshell, &unsethardshell);
    registerscriptperk("specialty_gas_grenade_resist", &setgasgrenaderesist, &unsetgasgrenaderesist);
    registerscriptperk("specialty_scrambler_resist");
    registerscriptperk("specialty_covert_ops", undefined, undefined, ["specialty_noscopeoutline", "specialty_coldblooded", "specialty_noplayertarget", "specialty_snapshot_immunity"]);
    registercodeperkinfo("specialty_blindeye", &setblindeye, &unsetblindeye);
    registerscriptperk("specialty_noscopeoutline", &setnoscopeoutline, &unsetnoscopeoutline);
    registerscriptperk("specialty_snapshot_immunity");
    registerscriptperk("specialty_heavy_metal", undefined, undefined, ["specialty_chain_killstreaks"]);
    registerscriptperk("specialty_chain_killstreaks");
    registerscriptperk("specialty_tactical_recon", undefined, undefined, ["specialty_engineer", "specialty_markequipment"]);
    registerscriptperk("specialty_engineer", &setengineer, &unsetengineer, ["specialty_outlinekillstreaks"]);
    registerscriptperk("specialty_markequipment", &setmarkequipment, &unsetmarkequipment);
    registerscriptperk("specialty_outlinekillstreaks", &setoutlinekillstreaks, &unsetoutlinekillstreaks);
    level thread set_mark_distances();
    registerscriptperk("specialty_eod", undefined, undefined, ["specialty_blastshield", "specialty_hack", "specialty_throwback", "specialty_shrapnel_resist"]);
    registerscriptperk("specialty_blastshield", &setblastshield, &unsetblastshield);
    registerscriptperk("specialty_hack");
    registerscriptperk("specialty_shrapnel_resist");
    registerscriptperk("specialty_huntmaster", undefined, undefined, ["specialty_tracker", "specialty_kill_report"]);
    registerscriptperk("specialty_tracker", &settracker, &unsettracker, ["specialty_tracker_pro"]);
    registerscriptperk("specialty_kill_report");
    registercodeperkinfo("specialty_snakecam");
    registerscriptperk("specialty_bulletsuppress", &function_7cfa6000210cbd68, &function_f1a813fe1b8a2275);
    registerscriptperk("specialty_armorpiercingks");
    registerscriptperk("specialty_glintxsml");
    registerscriptperk("specialty_glintsml");
    registerscriptperk("specialty_glintmed");
    registerscriptperk("specialty_glintlrg");
    registerscriptperk("specialty_glintxlrg");
    registerscriptperk("specialty_ammo_disabling");
    registerscriptperk("specialty_viewkickoverride", &setviewkickoverride, &unsetviewkickoverride);
    registerscriptperk("specialty_delayhealing");
    registerscriptperk("specialty_hardmelee", &set_heavy_hitter, &unset_heavy_hitter);
    registerscriptperk("specialty_block_health_regen", &setblockhealthregen, &unsetblockhealthregen);
    registercodeperkinfo("specialty_spygame");
    registerscriptperk("specialty_swimming", undefined, undefined, ["specialty_spygame", "specialty_coldblooded"]);
    registerscriptperk("specialty_pitcher", &setpitcher, &unsetpitcher);
    registerscriptperk("specialty_flashlight");
    registerscriptperk("specialty_wounding");
    registerscriptperk("specialty_incendiary");
    registerscriptperk("specialty_smags");
    registerscriptperk("specialty_akimbo");
    registerscriptperk("specialty_explosivebullet");
    registerscriptperk("specialty_gunmelee");
    registerscriptperk("specialty_talkinggun_test1", &namespace_27c74152ccb91331::function_96f59fefd781e47, &namespace_27c74152ccb91331::function_da3d9f34d24ac85a);
    registerscriptperk("specialty_talkinggun_test2", &namespace_27c74152ccb91331::function_96f5afefd78207a, &namespace_27c74152ccb91331::function_da3d9f34d24ac85a);
    registerscriptperk("specialty_talkinggun_test3", &namespace_27c74152ccb91331::function_96f5bfefd7822ad, &namespace_27c74152ccb91331::function_da3d9f34d24ac85a);
    registerscriptperk("specialty_talkinggun_test4", &namespace_27c74152ccb91331::function_96f54fefd781348, &namespace_27c74152ccb91331::function_da3d9f34d24ac85a);
    registerscriptperk("specialty_talkinggun_announcer", &namespace_27c74152ccb91331::function_fc6e0b02abb995cb, &namespace_27c74152ccb91331::function_da3d9f34d24ac85a);
    registerscriptperk("specialty_talkinggun_robot", &namespace_27c74152ccb91331::function_73e4ae4f932e9f30, &namespace_27c74152ccb91331::function_da3d9f34d24ac85a);
    registerscriptperk("specialty_talkinggun_blackcell", &namespace_27c74152ccb91331::function_cc0fddfe26b772a7, &namespace_27c74152ccb91331::function_da3d9f34d24ac85a);
    registerscriptperk("specialty_talkinggun_npc", &namespace_27c74152ccb91331::function_fc09644394bf843f, &namespace_27c74152ccb91331::function_da3d9f34d24ac85a);
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26ca
// Size: 0x74
function function_fe0d47259cb779c3() {
    registerscriptperk("specialty_fast_health_regen");
    registerscriptperk("specialty_quick_revive");
    registerscriptperk("specialty_extra_armor", &function_221c99519fbcdcea, &function_aadef05e93ad3aa3);
    registerscriptperk("specialty_extra_weapon");
    registerscriptperk("specialty_armor_satchel");
    registerscriptperk("specialty_increased_armor_health", &function_e12e572d8ce0f156, &function_91d0e484a126db5f);
    registerscriptperk("specialty_elasomer_pads", &function_cc2cf1db71343d8f, &function_5ab8f9c4d813c44a);
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2746
// Size: 0x10
function function_7cfa6000210cbd68() {
    self setclientomnvar("ui_overcharge", 2);
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x275e
// Size: 0xf
function function_f1a813fe1b8a2275() {
    self setclientomnvar("ui_overcharge", 0);
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2775
// Size: 0xb
function function_221c99519fbcdcea() {
    namespace_f8d3520d3483c1::initarmor(1);
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2788
// Size: 0xb
function function_aadef05e93ad3aa3() {
    namespace_f8d3520d3483c1::initarmor(1);
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x279b
// Size: 0x5a
function setExtraTacticalEquipment() {
    self endon("disconnect");
    self endon("setExtraTacticalEquipment");
    level endon("game_ended");
    if (istrue(self.gettingloadout)) {
        self waittill("loadout_given");
    }
    ref = namespace_4fb9dddfb8c1a67a::getcurrentequipment("secondary");
    if (isdefined(ref) && ref != "none") {
        namespace_4fb9dddfb8c1a67a::incrementequipmentammo(ref);
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27fd
// Size: 0xa
function function_c6df31f2ee8fe243() {
    self notify("setExtraTacticalEquipment");
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x280f
// Size: 0x5a
function setExtraPrimaryEquipment() {
    self endon("disconnect");
    self endon("setExtraPrimaryEquipment");
    level endon("game_ended");
    if (istrue(self.gettingloadout)) {
        self waittill("loadout_given");
    }
    ref = namespace_4fb9dddfb8c1a67a::getcurrentequipment("primary");
    if (isdefined(ref) && ref != "none") {
        namespace_4fb9dddfb8c1a67a::incrementequipmentammo(ref);
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2871
// Size: 0xa
function function_3ba1ba85aad48a42() {
    self notify("setExtraPrimaryEquipment");
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2883
// Size: 0x20
function function_e12e572d8ce0f156() {
    self.var_163e87b7d147df4e = 1;
    namespace_f8d3520d3483c1::initarmor();
    self.spawnarmor = 450;
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28ab
// Size: 0xc
function function_91d0e484a126db5f() {
    self.var_163e87b7d147df4e = undefined;
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28bf
// Size: 0xa
function setpitcher() {
    thread setpitcherinternal();
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28d1
// Size: 0x1c
function unsetpitcher() {
    self setgrenadecookscale(1);
    self setgrenadethrowscale(1);
    self notify("unsetPitcher");
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28f5
// Size: 0x99
function setpitcherinternal() {
    self endon("death_or_disconnect");
    self endon("unsetPitcher");
    level endon("game_ended");
    self setgrenadecookscale(1.5);
    for (;;) {
        self setgrenadethrowscale(1.5);
        objweapon = self waittill("grenade_pullback");
        grenadename = objweapon.basename;
        if (grenadename == "airdrop_marker_mp" || grenadename == "deployable_vest_marker_mp" || grenadename == "deployable_weapon_crate_marker_mp") {
            self setgrenadethrowscale(1);
        }
        grenade, objweapon = self waittill("grenade_fire");
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2996
// Size: 0x30
function registerscriptperk(perkname, setfunc, unsetfunc, extraperkmap) {
    registerperk(perkname, 1, setfunc, unsetfunc, extraperkmap);
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x29ce
// Size: 0x2f
function registercodeperkinfo(perkname, setfunc, unsetfunc, extraperkmap) {
    registerperk(perkname, 0, setfunc, unsetfunc, extraperkmap);
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x2a05
// Size: 0xc9
function registerperk(perkname, var_9aa715f8120f5692, setfunc, unsetfunc, extraperkmap) {
    assert(isdefined(perkname));
    assert(!isdefined(level.scriptperks[perkname]), "Cannot register two perks to the name: " + perkname);
    if (istrue(var_9aa715f8120f5692)) {
        level.scriptperks[perkname] = 1;
    }
    if (isdefined(setfunc)) {
        assert(isfunction(setfunc));
        level.perksetfuncs[perkname] = setfunc;
    }
    if (isdefined(unsetfunc)) {
        assert(isfunction(unsetfunc));
        level.perkunsetfuncs[perkname] = unsetfunc;
    }
    if (isdefined(extraperkmap)) {
        assert(isarray(extraperkmap));
        level.extraperkmap[perkname] = extraperkmap;
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ad6
// Size: 0x10
function setovercharge() {
    self setclientomnvar("ui_overcharge", 1);
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2aee
// Size: 0xf
function unsetovercharge() {
    self setclientomnvar("ui_overcharge", 0);
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b05
// Size: 0x2
function setfreefall() {
    
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b0f
// Size: 0x2
function unsetfreefall() {
    
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b19
// Size: 0x2
function setremotedefuse() {
    
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b23
// Size: 0x2
function unsetremotedefuse() {
    
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b2d
// Size: 0x10
function sethardshell() {
    self.shellshockreduction = 0.25;
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b45
// Size: 0xc
function unsethardshell() {
    self.shellshockreduction = 0;
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b59
// Size: 0xc
function setgasgrenaderesist() {
    if (scripts\cp_mp\utility\player_utility::_isalive()) {
        return;
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b6d
// Size: 0xc
function unsetgasgrenaderesist() {
    if (scripts\cp_mp\utility\player_utility::_isalive()) {
        return;
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b81
// Size: 0x2
function setreduceregendelayonkills() {
    
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b8b
// Size: 0x2
function unsetreduceregendelayonkills() {
    
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b95
// Size: 0x2
function setreduceregendelayonobjective() {
    
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b9f
// Size: 0x2
function unsetreduceregendelayonobjective() {
    
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ba9
// Size: 0x33
function sethardline() {
    self endon("death_or_disconnect");
    self endon("perk_end_hardline");
    if (is_specops_gametype()) {
        return;
    }
    thread run_kill_watcher();
    self.hardlineactive["assists"] = 0;
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2be4
// Size: 0x14
function unsethardline() {
    self.hardlineactive = undefined;
    self notify("perk_end_hardline");
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c00
// Size: 0x50
function run_kill_watcher() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("perk_end_hardline");
    var_6d85d0102fd52796 = 7;
    while (true) {
        if (isdefined(self.consecutive_kills) && self.consecutive_kills > var_6d85d0102fd52796) {
            give_random_munition();
        }
        waitframe();
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c58
// Size: 0x4a
function give_random_munition() {
    types = undefined;
    types = ["brloot_munition_ammo", "brloot_munition_grenade_crate", "brloot_munition_armor"];
    loot_type = random(types);
    scripts\cp\loot_system::give_munition(loot_type, self);
    wait 10;
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2caa
// Size: 0x2
function setfastreloadlaunchers() {
    
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cb4
// Size: 0x2
function unsetfastreloadlaunchers() {
    
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cbe
// Size: 0x2
function setoverkill() {
    
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cc8
// Size: 0x2
function unsetoverkill() {
    
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cd2
// Size: 0x2
function setkillstreaktoscorestreak() {
    
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cdc
// Size: 0x2
function unsetkillstreaktoscorestreak() {
    
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ce6
// Size: 0x17
function setghost() {
    self.perk_data["stealth_dist_scalar"] = 0.5;
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d05
// Size: 0x14
function unsetghost() {
    self.perk_data["stealth_dist_scalar"] = 1;
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d21
// Size: 0x3d
function setstunresistance(var_49e6ba16eaed299c) {
    if (!isdefined(var_49e6ba16eaed299c)) {
        var_49e6ba16eaed299c = 4;
    }
    var_49e6ba16eaed299c = int(var_49e6ba16eaed299c);
    if (var_49e6ba16eaed299c == 10) {
        self.stunscalar = 0;
        return;
    }
    self.stunscalar = var_49e6ba16eaed299c / 10;
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d66
// Size: 0xd
function unsetstunresistance() {
    self.stunscalar = 1;
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d7b
// Size: 0x2
function setblindeye() {
    
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d85
// Size: 0x2
function unsetblindeye() {
    
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d8f
// Size: 0x2
function setnoscopeoutline() {
    
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d99
// Size: 0x2
function unsetnoscopeoutline() {
    
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2da3
// Size: 0xa
function setengineer() {
    thread engineer_enablemarksafterprematch();
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2db5
// Size: 0x2d
function engineer_enablemarksafterprematch() {
    self endon("unsetEngineer");
    self enableentitymarks("equipment", 1000000);
    self.perkengineerset = 1;
    thread markedentities_think();
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2dea
// Size: 0x2d
function unsetengineer() {
    if (istrue(self.perkengineerset)) {
        self disableentitymarks("equipment");
        self.perkengineerset = undefined;
    }
    self notify("unsetEngineer");
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e1f
// Size: 0x178
function allow_br_loot_to_br_marked() {
    if (!isdefined(level.teamdata)) {
        level.teamdata = [];
    }
    if (!isdefined(level.teamdata["allies"])) {
        level.teamdata["allies"] = [];
    }
    if (!isdefined(level.teamdata["allies"]["players"])) {
        level.teamdata["allies"]["players"] = level.players;
    }
    var_792740c4c87cf9fa = getentitylessscriptablearray(undefined, undefined, self.origin, 2000);
    foreach (thing in var_792740c4c87cf9fa) {
        if (issubstr(thing.type, "brloot_munition")) {
            thing.fake_model = spawn("script_model", thing.origin);
            thing.fake_model.angles = thing.angles;
            thing.fake_model setmodel("container_ammo_box_01_nophysics_cp");
            thing.fake_model enableplayermarks("equipment");
            scripts\cp\cp_outline_utility::outlineenableforplayer(thing.fake_model, self, "spotter_notarget_equipment", "perk");
        }
        waitframe();
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f9f
// Size: 0x179
function make_sure_loot_is_visible() {
    var_7507f409fee2b657 = ["brloot_munition", "brloot_munition_airdrop", "brloot_munition_ammo", "brloot_munition_armor", "brloot_munition_c4_launcher", "brloot_munition_cluster_strike", "brloot_munition_cruise_missile", "brloot_munition_cruise_predator", "brloot_munition_deployable_cover", "brloot_munition_grenade_crate", "brloot_munition_grenade_launcher", "brloot_munition_juggernaut", "brloot_munition_precision_airstrike", "brloot_munition_thermite_launcher", "brloot_munition_trophysystem", "brloot_munition_turret", "brloot_munition_uav", "brloot_munition_white_phos"];
    foreach (name in var_7507f409fee2b657) {
        var_792740c4c87cf9fa = getentitylessscriptablearray(undefined, undefined, undefined, undefined, name);
        count = 0;
        foreach (var_31f869647e8740b4 in var_792740c4c87cf9fa) {
            var_31f869647e8740b4 setscriptablepartstate(name, "visible");
            count++;
            if (count % 20) {
                wait 0.1;
            }
        }
        wait 0.1;
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3120
// Size: 0xb5
function make_outline_ents() {
    var_58a11d31a3c59e82 = 10;
    level.outline_ents = [];
    level.outline_ent_index = [];
    for (i = 0; i < var_58a11d31a3c59e82; i++) {
        level.outline_ents[i] = spawn("script_model", (0, 0, 0));
        level.outline_ents[i].angles = (0, 0, 0);
        level.outline_ents[i] setmodel("container_ammo_box_01_nophysics_cp");
        level.outline_ents[i] enableplayermarks("equipment");
    }
    thread monitor_outline_ents();
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31dd
// Size: 0x2c
function monitor_outline_ents() {
    level endon("game_ended");
    while (true) {
        if (_hasperk("specialty_engineer")) {
            get_closest_munitions();
        }
        wait 0.1;
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3211
// Size: 0x339
function get_closest_munitions() {
    var_b69312781edc9ea6 = 1000;
    var_58a11d31a3c59e82 = 10;
    var_7507f409fee2b657 = ["brloot_munition", "brloot_munition_airdrop", "brloot_munition_ammo", "brloot_munition_armor", "brloot_munition_c4_launcher", "brloot_munition_cluster_strike", "brloot_munition_cruise_missile", "brloot_munition_cruise_predator", "brloot_munition_deployable_cover", "brloot_munition_grenade_crate", "brloot_munition_grenade_launcher", "brloot_munition_juggernaut", "brloot_munition_precision_airstrike", "brloot_munition_thermite_launcher", "brloot_munition_trophysystem", "brloot_munition_turret", "brloot_munition_uav", "brloot_munition_white_phos"];
    var_1d88cbbb14926330 = [];
    foreach (name in var_7507f409fee2b657) {
        var_792740c4c87cf9fa = getentitylessscriptablearray(undefined, undefined, self.origin, var_b69312781edc9ea6, name);
        foreach (var_31f869647e8740b4 in var_792740c4c87cf9fa) {
            var_1d88cbbb14926330[var_1d88cbbb14926330.size] = var_31f869647e8740b4;
        }
    }
    var_1d88cbbb14926330 = sortbydistance(var_1d88cbbb14926330, self.origin);
    var_93dff4684377d4c0 = level.outline_ents;
    var_586b9984fdeb517b = [];
    new_list = [];
    for (i = 0; i < var_1d88cbbb14926330.size; i++) {
        if (!isdefined(level.outline_ent_index[var_1d88cbbb14926330[i].index])) {
            new_list[new_list.size] = var_1d88cbbb14926330[i];
        }
    }
    if (new_list.size > 0) {
        outline_ent_index = 0;
        for (i = 0; i < min(new_list.size, var_58a11d31a3c59e82); i++) {
            for (j = 0; j < level.outline_ents.size; j++) {
                if (isdefined(var_586b9984fdeb517b[j])) {
                    continue;
                }
                if (isdefined(level.outline_ents[j])) {
                    level.outline_ents[j] dontinterpolate();
                }
                level.outline_ents[j].origin = new_list[i].origin;
                level.outline_ents[j].angles = new_list[i].angles;
                level.outline_ents[j].index = new_list[i].index;
                level.outline_ent_index[level.outline_ents[j].index] = undefined;
                level.outline_ent_index[new_list[i].index] = level.outline_ents[j];
                unmarkent(level.outline_ents[j]);
                var_586b9984fdeb517b[j] = new_list[i];
                break;
            }
        }
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3552
// Size: 0x50
function unmarkent(markedent) {
    markedent filterinplayermarks(undefined);
    self.markequipmentstate.markedents = array_remove(self.markequipmentstate.markedents, markedent);
    markedent notify("unmarkEnt_" + self getentitynumber());
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35aa
// Size: 0x11
function setmarkequipment() {
    self enabletargetmarks();
    thread markequipment_monitorlook();
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35c3
// Size: 0x88
function unsetmarkequipment() {
    if (isdefined(self.markequipmentstate)) {
        foreach (ent in self.markequipmentstate.markedents) {
            if (isdefined(ent)) {
                unmarkent(ent);
            }
        }
    }
    self.markequipmentstate = undefined;
    self disabletargetmarks();
    self notify("mark_equip_ended");
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3653
// Size: 0x124
function markequipment_monitorlook() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("mark_equip_ended");
    if (!isdefined(self.markequipmentstate)) {
        self.markequipmentstate = spawnstruct();
        self.markequipmentstate.markingtime = 0;
        self.markequipmentstate.markingent = undefined;
        self.markequipmentstate.markedents = [];
        self.markequipmentstate.markedentindex = 0;
        self.markequipmentstate.pastmarkedents = [];
        self.markequipmentstate.pastmarkedentindex = 0;
    }
    while (true) {
        ent = self waittill("marks_target_changed");
        startmarking = isdefined(ent) && !isdefined(self.markequipmentstate.markingent);
        self.markequipmentstate.markingent = ent;
        self.markequipmentstate.markingtime = 0;
        if (startmarking) {
            thread markequipment_updatestate();
        }
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x377f
// Size: 0x26
function set_mark_distances() {
    level.see_air_killstreak_dist = 6000;
    level.see_killstreak_dist = 1500;
    level.see_equipment_dist = 1000;
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x37ad
// Size: 0x3db
function markequipment_updatestate() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("mark_equip_ended");
    lasttime = gettime();
    maxdist = 0;
    if (self entityhasmark("air_killstreak", self.markequipmentstate.markingent)) {
        maxdist = level.see_air_killstreak_dist;
    } else if (self entityhasmark("killstreak", self.markequipmentstate.markingent)) {
        maxdist = level.see_killstreak_dist;
    } else if (self entityhasmark("equipment", self.markequipmentstate.markingent)) {
        maxdist = level.see_equipment_dist;
    } else {
        assert(0, "Marking Ent did not belong to one of these mark groups. Are we not taking one into account?");
    }
    maxdistsqrd = maxdist * maxdist;
    while (isdefined(self.markequipmentstate.markingent) && !istrue(self.ishacking)) {
        if (self entitymarkfilteredin(self.markequipmentstate.markingent)) {
            break;
        }
        if (isdefined(self.vehicle) && self.vehicle == self.markequipmentstate.markingent) {
            break;
        }
        if (scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_occupantisvehicledriver(self)) {
            break;
        }
        if (distancesquared(self.origin, self.markequipmentstate.markingent.origin) > maxdistsqrd) {
            break;
        }
        currenttime = gettime();
        deltatime = currenttime - lasttime;
        self.markequipmentstate.markingtime += deltatime;
        if (!array_contains(self.markequipmentstate.markedents, self.markequipmentstate.markingent)) {
            if (isplayerads()) {
                markindex = self.markequipmentstate.markedentindex;
                ent = self.markequipmentstate.markedents[markindex];
                if (isdefined(ent)) {
                    ent filterinplayermarks(undefined);
                    outlinehelper_updateentityoutline(ent);
                }
                self.markequipmentstate.markingent filterinplayermarks(self.team);
                outlinehelper_updateentityoutline(self.markequipmentstate.markingent);
                self.markequipmentstate.markedents[markindex] = self.markequipmentstate.markingent;
                self.markequipmentstate.markedentindex = (markindex + 1) % 999;
                if (!array_contains(self.markequipmentstate.pastmarkedents, self.markequipmentstate.markingent)) {
                    self.markequipmentstate.pastmarkedents[self.markequipmentstate.pastmarkedentindex] = self.markequipmentstate.markingent;
                    self.markequipmentstate.pastmarkedentindex++;
                }
                thread unmarkafterduration(self.markequipmentstate.markingent);
                break;
            }
        }
        lasttime = currenttime;
        waitframe();
    }
    if (!istrue(self.ishacking)) {
        self setclientomnvar("ui_securing", 0);
        self setclientomnvar("ui_securing_progress", 0);
    }
    self.markequipmentstate.markingent = undefined;
    self.markequipmentstate.markingtime = 0;
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b90
// Size: 0x50
function unmarkafterduration(markedent) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("mark_equip_ended");
    self endon("unmarkEnt_" + self getentitynumber());
    wait getdvarint(@"perk_mark_equipment_duration");
    if (isdefined(markedent) && isdefined(self)) {
        unmarkent(markedent);
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3be8
// Size: 0x3c
function unmarkonownershipchange(markedent) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("mark_equip_ended");
    self endon("unmarkEnt_" + self getentitynumber());
    while (true) {
        wait 0.5;
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c2c
// Size: 0x31
function outlinehelper_updateentityoutline(ent) {
    if (isdefined(ent)) {
        entitynum = ent getentitynumber();
        outlinehelper_disableentityoutline(entitynum);
        outlinehelper_enableentityoutline(ent);
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c65
// Size: 0x32c
function outlinehelper_enableentityoutline(ent) {
    if (!isdefined(ent)) {
        return;
    }
    entitynum = ent getentitynumber();
    entitydata = self.entityoutlines[entitynum];
    if (isdefined(entitydata)) {
        return;
    }
    outlinedata = undefined;
    if (self entitymarkfilteredin(ent)) {
        outlinedata = spawnstruct();
        outlinedata.prioritygroup = "perk_superior";
        outlinedata.hudoutlineassetname = "spotter_target";
        outlinehelper_verifydata(outlinedata);
    }
    ismarked = self entitymarkfilteredin(ent);
    if (self entityhasmark("air_killstreak", ent)) {
        if (!isdefined(ent.model)) {
            return;
        }
        outlinedata = spawnstruct();
        if (ismarked) {
            outlinedata.prioritygroup = "perk_superior";
            outlinedata.hudoutlineassetname = "spotter_target_killstreak_air";
        } else {
            outlinedata.prioritygroup = "perk";
            outlinedata.hudoutlineassetname = "spotter_notarget_killstreak_air";
        }
        outlinehelper_verifydata(outlinedata);
    } else if (self entityhasmark("killstreak", ent)) {
        if (!isdefined(ent.model)) {
            return;
        }
        outlinedata = spawnstruct();
        if (ismarked) {
            outlinedata.prioritygroup = "perk_superior";
            outlinedata.hudoutlineassetname = "spotter_target_killstreak";
        } else {
            outlinedata.prioritygroup = "perk";
            outlinedata.hudoutlineassetname = "spotter_notarget_killstreak";
        }
        outlinehelper_verifydata(outlinedata);
    } else if (self entityhasmark("equipment", ent)) {
        if (isdefined(ent.equipmentref) && ent.equipmentref == "equip_tac_cover") {
            return;
        }
        outlinedata = spawnstruct();
        if (ismarked) {
            outlinedata.prioritygroup = "perk_superior";
            outlinedata.hudoutlineassetname = "spotter_target_equipment";
        } else {
            outlinedata.prioritygroup = "perk";
            outlinedata.hudoutlineassetname = "spotter_notarget_equipment";
        }
        outlinehelper_verifydata(outlinedata);
    }
    if (isdefined(outlinedata)) {
        entitydata = spawnstruct();
        self.entityoutlines[entitynum] = entitydata;
        entitydata.list = [];
        entitydata.ent = ent;
        childents = getchildoutlineents(ent);
        foreach (child in childents) {
            entoutlineid = scripts\cp\cp_outline_utility::outlineenableforplayer(child, self, outlinedata.hudoutlineassetname, outlinedata.prioritygroup);
            outline = spawnstruct();
            outline.ent = child;
            outline.id = entoutlineid;
            childnum = child getentitynumber();
            entitydata.list[childnum] = outline;
        }
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f99
// Size: 0x33
function getchildoutlineents(ent) {
    if (!isdefined(ent)) {
        return [];
    }
    if (!isdefined(ent.childoutlineents)) {
        return [ent];
    }
    return ent.childoutlineents;
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3fd5
// Size: 0xb6
function outlinehelper_verifydata(outlinedata) {
    assert(isdefined(outlinedata));
    if (!isdefined(outlinedata.getplayers)) {
        outlinedata.getplayers = &outlinehelper_getallplayers;
    }
    if (!isdefined(outlinedata.validplayer)) {
        outlinedata.validplayer = &outlinehelper_validplayer;
    }
    if (!isdefined(outlinedata.hudoutlineassetname)) {
        outlinedata.hudoutlineassetname = "spotter_notarget";
    }
    if (!isdefined(outlinedata.prioritygroup)) {
        outlinedata.prioritygroup = "perk";
    }
    if (!isdefined(outlinedata.waittime)) {
        outlinedata.waittime = 0.1;
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4093
// Size: 0x1c
function outlinehelper_getallplayers(ent, outlinedata) {
    return level.players;
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x40b8
// Size: 0xd
function outlinehelper_validplayer(player) {
    return true;
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x40ce
// Size: 0x9e
function outlinehelper_disableentityoutline(entnum) {
    if (isdefined(entnum)) {
        entitydata = self.entityoutlines[entnum];
        if (isdefined(entitydata)) {
            foreach (outline in entitydata.list) {
                scripts\cp\cp_outline_utility::outlinedisable(outline.id, outline.ent);
            }
            self.entityoutlines[entnum] = undefined;
        }
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4174
// Size: 0xa
function setoutlinekillstreaks() {
    thread outlinekillstreaks_enablemarksafterprematch();
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4186
// Size: 0x36
function outlinekillstreaks_enablemarksafterprematch() {
    self endon("unsetOutlineKillstreak");
    self enableentitymarks("killstreak", 1000000);
    self enableentitymarks("air_killstreak", 1000000);
    self.perkoutlinekillstreaksset = 1;
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x41c4
// Size: 0x39
function unsetoutlinekillstreaks() {
    if (istrue(self.perkoutlinekillstreaksset)) {
        self disableentitymarks("killstreak");
        self disableentitymarks("air_killstreak");
        self.perkoutlinekillstreaksset = undefined;
    }
    self notify("unsetOutlineKillstreak");
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4205
// Size: 0x89
function markedentities_removeentsbyindex(entarray, var_223829bbefc81935) {
    var_5877436cc451fa7d = [];
    foreach (ent in entarray) {
        if (isdefined(ent)) {
            entnum = ent getentitynumber();
            if (!array_contains(var_223829bbefc81935, entnum)) {
                var_5877436cc451fa7d[var_5877436cc451fa7d.size] = ent;
            }
        }
    }
    return var_5877436cc451fa7d;
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4297
// Size: 0x1cb
function markedentities_think() {
    self endon("disconnect");
    level endon("game_ended");
    self.entityoutlines = [];
    while (true) {
        var_b56ac8b012f37095, var_7b50cc9c94be9505, var_c5dda6b7a37d4129 = self waittill("marks_changed");
        if (isdefined(var_b56ac8b012f37095)) {
            foreach (var_e0abeaa6ef08e178 in var_b56ac8b012f37095) {
                outlinehelper_disableentityoutline(var_e0abeaa6ef08e178);
            }
            if (isdefined(self.markequipmentstate)) {
                self.markequipmentstate.markedents = markedentities_removeentsbyindex(self.markequipmentstate.markedents, var_b56ac8b012f37095);
                if (self.markequipmentstate.markedentindex > self.markequipmentstate.markedents.size) {
                    self.markequipmentstate.markedentindex = self.markequipmentstate.markedents.size;
                }
            }
        }
        if (isdefined(var_7b50cc9c94be9505)) {
            foreach (var_4905d157180507c8 in var_7b50cc9c94be9505) {
                outlinehelper_disableentityoutline(var_4905d157180507c8);
            }
        }
        if (isdefined(var_c5dda6b7a37d4129)) {
            foreach (addedent in var_c5dda6b7a37d4129) {
                outlinehelper_enableentityoutline(addedent);
            }
        }
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x446a
// Size: 0x13
function setblastshield() {
    set_perk("enemy_explosive_damage_reduction", 0.5);
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4485
// Size: 0x10
function unsetblastshield() {
    set_perk("enemy_explosive_damage_reduction", 1);
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x449d
// Size: 0x12
function settracker() {
    thread runtrackkillstreakuse();
    thread run_track_enemy_patrollers();
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x44b7
// Size: 0xa
function unsettracker() {
    self notify("tracker_removed");
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x44c9
// Size: 0x4b
function runtrackkillstreakuse() {
    self endon("death_or_disconnect");
    self endon("track_killstreak_end");
    while (true) {
        if (isusingremote()) {
            waitframe();
            takeperk("specialty_tracker");
            while (isusingremote()) {
                waitframe();
            }
            giveperk("specialty_tracker");
            break;
        }
        waitframe();
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x451c
// Size: 0x1ae
function run_track_enemy_patrollers() {
    self endon("death_or_disconnect");
    self endon("tracker_removed");
    var_89640ca652887743 = cos(70);
    var_820e590cb5620371 = 0;
    self.view_list = [];
    self.outlineids = [];
    var_2ab4eb5f9bf4dd77 = 5000;
    while (true) {
        enemy_list = level.agentarray;
        foreach (guy in enemy_list) {
            if (var_820e590cb5620371 >= 20) {
                var_820e590cb5620371 = 0;
                waitframe();
            }
            if (!isdefined(guy)) {
                continue;
            }
            var_820e590cb5620371++;
            entnum = guy getentitynumber();
            var_25ab57d46f5f99f9 = within_fov(self geteye(), self getplayerangles(), guy.origin, var_89640ca652887743);
            if (!var_25ab57d46f5f99f9) {
                continue;
            }
            passed = sighttracepassed(self geteye(), guy geteye(), 0, undefined);
            if (!passed) {
                if (isdefined(self.view_list[entnum])) {
                    cur_time = gettime();
                    var_77c5b5dd30fc2909 = cur_time - var_2ab4eb5f9bf4dd77;
                    if (self.view_list[entnum] < var_77c5b5dd30fc2909) {
                    } else {
                        guy add_outline(entnum, self);
                        guy thread untrack_enemy(self, 5);
                    }
                }
                continue;
            }
            cur_time = gettime();
            self.view_list[entnum] = cur_time;
            guy remove_outline(entnum, self);
        }
        var_820e590cb5620371 = 0;
        waitframe();
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x46d2
// Size: 0x1a8
function function_d0eb3583cf0cdf66(var_b76712bde7c371e4) {
    self endon("death_or_disconnect");
    self notify("tracker_removed");
    self endon("tracker_removed");
    var_89640ca652887743 = cos(70);
    var_820e590cb5620371 = 0;
    self.view_list = [];
    self.outlineids = [];
    var_2ab4eb5f9bf4dd77 = 5000;
    while (true) {
        enemy_list = level.agentarray;
        foreach (guy in enemy_list) {
            if (var_820e590cb5620371 >= 20) {
                var_820e590cb5620371 = 0;
                waitframe();
            }
            if (!isdefined(guy)) {
                continue;
            }
            var_820e590cb5620371++;
            entnum = guy getentitynumber();
            target = guy geteye();
            if (!isdefined(target)) {
                target = guy.origin;
            }
            var_25ab57d46f5f99f9 = within_fov(self geteye(), self getplayerangles(), target, var_89640ca652887743);
            if (!var_25ab57d46f5f99f9) {
                continue;
            }
            passed = sighttracepassed(self geteye(), guy geteye(), 0, undefined);
            if (istrue(var_b76712bde7c371e4) || !passed || istrue(self.var_2332678633fe1728)) {
                if (istrue(guy.reconmarked)) {
                    guy add_outline(entnum, self);
                }
                continue;
            }
            if (istrue(guy.reconmarked)) {
                guy remove_outline(entnum, self);
            }
        }
        var_820e590cb5620371 = 0;
        waitframe();
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4882
// Size: 0x44
function add_outline(entnum, player) {
    if (!isdefined(player.outlineids[entnum])) {
        player.outlineids[entnum] = scripts\cp\cp_outline_utility::outlineenableforplayer(self, player, "snapshotgrenade", "equipment");
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x48ce
// Size: 0x20
function function_bc0b60676ef3d606(perk_name) {
    self [[ scripts\engine\utility::getsharedfunc("perk", "removePerk") ]](perk_name);
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x48f6
// Size: 0x4b
function untrack_enemy(player, timer) {
    entnum = self getentitynumber();
    if (isdefined(timer)) {
        wait timer;
    }
    if (isdefined(self.reconmarked)) {
        self.reconmarked = undefined;
    }
    remove_outline(entnum, player);
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4949
// Size: 0x46
function remove_outline(entnum, player) {
    outlineid = player.outlineids[entnum];
    if (isdefined(outlineid)) {
        scripts\cp\cp_outline_utility::outlinedisable(outlineid, self);
        player.outlineids[entnum] = undefined;
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4997
// Size: 0x41
function setviewkickoverride() {
    self.overrideviewkickscale = 0.5;
    self.overrideviewkickscaledmr = 0.5;
    self.overrideviewkickscalesniper = 0.5;
    self.overrideviewkickscalepistol = 0.5;
    namespace_a0628d6954815ef8::updateviewkickscale();
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x49e0
// Size: 0x31
function unsetviewkickoverride() {
    self.overrideviewkickscale = undefined;
    self.overrideviewkickscaledmr = undefined;
    self.overrideviewkickscalesniper = undefined;
    self.overrideviewkickscalepistol = undefined;
    namespace_a0628d6954815ef8::updateviewkickscale();
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a19
// Size: 0x14
function set_heavy_hitter() {
    self.perk_data["melee_scalar"] = 2;
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a35
// Size: 0x14
function unset_heavy_hitter() {
    self.perk_data["melee_scalar"] = 1;
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a51
// Size: 0x13
function give_tune_up() {
    set_perk("super_fill_scalar", 1.3);
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a6c
// Size: 0x10
function take_tune_up() {
    set_perk("super_fill_scalar", 1);
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a84
// Size: 0xc
function give_restock() {
    thread recharge_lethals_over_time(60);
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a98
// Size: 0xa
function take_restock() {
    self notify("take_restock");
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4aaa
// Size: 0x100
function recharge_lethals_over_time(timer) {
    self endon("death");
    level endon("game_ended");
    self endon("take_restock");
    thread reset_restock_flag();
    thread reset_recharge_after_respawn();
    while (true) {
        grenade, objweapon, tickpercent, originalowner = self waittill("grenade_fire");
        if (!isdefined(grenade.equipmentref)) {
            return;
        }
        var_d690ef8fdb341e60 = namespace_4fb9dddfb8c1a67a::getcurrentequipment("primary");
        if (grenade.equipmentref == var_d690ef8fdb341e60) {
            thread function_b705cd6e9764d5b5(timer, "primary");
            thread function_b732b7db9744396e("primary");
        }
        var_ddca460ea9f6d6c5 = namespace_4fb9dddfb8c1a67a::getcurrentequipment("secondary");
        if (grenade.equipmentref == var_ddca460ea9f6d6c5) {
            thread function_b705cd6e9764d5b5(timer, "secondary");
            thread function_b732b7db9744396e("secondary");
        }
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4bb2
// Size: 0x4d
function reset_restock_flag() {
    level endon("game_ended");
    self waittill("take_restock");
    self.waiting_for_tactical_restock = undefined;
    self.waiting_for_lethal_restock = undefined;
    self setclientomnvar("ui_recharge_notify", -1);
    self setclientomnvar("ui_lethal_recharge_progress", 0);
    self setclientomnvar("ui_tactical_recharge_progress", 0);
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c07
// Size: 0x97
function reset_recharge_after_respawn() {
    level endon("game_ended");
    self endon("take_restock");
    timer = 60;
    self waittill("landed_after_respawn");
    var_15dc79d0e74115b6 = namespace_4fb9dddfb8c1a67a::getcurrentequipment("primary");
    if (isdefined(var_15dc79d0e74115b6) && namespace_4fb9dddfb8c1a67a::getequipmentammo(var_15dc79d0e74115b6) < namespace_4fb9dddfb8c1a67a::getequipmentmaxammo(var_15dc79d0e74115b6)) {
        thread function_b705cd6e9764d5b5(timer, "primary");
    }
    var_bbfd67040e7c52f6 = namespace_4fb9dddfb8c1a67a::getcurrentequipment("secondary");
    if (namespace_4fb9dddfb8c1a67a::getequipmentammo(var_bbfd67040e7c52f6) < namespace_4fb9dddfb8c1a67a::getequipmentmaxammo(var_bbfd67040e7c52f6)) {
        thread function_b705cd6e9764d5b5(timer, "secondary");
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4ca6
// Size: 0x11a
function function_b705cd6e9764d5b5(timer, slot) {
    self endon("death");
    level endon("game_ended");
    self endon("take_restock");
    self endon("stop_restock_recharge");
    equipmentref = namespace_4fb9dddfb8c1a67a::getcurrentequipment(slot);
    self endon("equipment_taken_" + equipmentref);
    if (slot == "primary" && istrue(self.waiting_for_lethal_restock)) {
        return;
    }
    if (slot == "secondary" && istrue(self.waiting_for_tactical_restock)) {
        return;
    }
    if (slot == "primary") {
        thread stop_restock_recharge("ui_lethal_recharge_progress", slot);
        self.waiting_for_lethal_restock = 1;
        update_restock_ui("ui_lethal_recharge_progress", timer, 0);
        self.waiting_for_lethal_restock = undefined;
    } else {
        thread stop_restock_recharge("ui_tactical_recharge_progress", slot);
        self.waiting_for_tactical_restock = 1;
        update_restock_ui("ui_tactical_recharge_progress", timer, 0);
        self.waiting_for_tactical_restock = undefined;
    }
    namespace_4fb9dddfb8c1a67a::incrementequipmentammo(equipmentref);
    if (namespace_4fb9dddfb8c1a67a::getequipmentammo(equipmentref) < namespace_4fb9dddfb8c1a67a::getequipmentmaxammo(equipmentref)) {
        thread function_b705cd6e9764d5b5(timer, slot);
        return;
    }
    self notify("restock_done");
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4dc8
// Size: 0xcd
function update_restock_ui(omnvar, timer, slot) {
    self setclientomnvar("ui_recharge_notify", -1);
    start_time = gettime();
    end_time = start_time + timer * 1000;
    cur_time = gettime();
    while (cur_time < end_time) {
        while (istrue(self.inlaststand)) {
            self setclientomnvar("ui_recharge_notify", -1);
            self setclientomnvar(omnvar, 0);
            waitframe();
        }
        cur_time = gettime();
        progress = (cur_time - start_time) / (end_time - start_time);
        self setclientomnvar(omnvar, progress);
        wait 0.1;
    }
    self setclientomnvar("ui_recharge_notify", slot);
    self setclientomnvar(omnvar, 0);
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4e9d
// Size: 0xae
function stop_restock_recharge(omnvar, slot) {
    self endon("death");
    level endon("game_ended");
    self endon("take_restock");
    self endon("restock_done");
    equipment = namespace_4fb9dddfb8c1a67a::getcurrentequipment(slot);
    self endon("equipment_taken_" + equipment);
    while (istrue(self.inlaststand) || namespace_4fb9dddfb8c1a67a::getequipmentammo(equipment) < namespace_4fb9dddfb8c1a67a::getequipmentmaxammo(equipment)) {
        waitframe();
    }
    self notify("stop_restock_recharge");
    if (slot == "primary") {
        self.waiting_for_lethal_restock = undefined;
    } else {
        self.waiting_for_tactical_restock = undefined;
    }
    self setclientomnvar("ui_recharge_notify", -1);
    self setclientomnvar(omnvar, 0);
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4f53
// Size: 0x8c
function function_b732b7db9744396e(slot) {
    self endon("death");
    level endon("game_ended");
    self endon("take_restock");
    self endon("restock_done");
    equipment = namespace_4fb9dddfb8c1a67a::getcurrentequipment(slot);
    self waittill("equipment_taken_" + equipment);
    if (slot == "primary") {
        self.waiting_for_lethal_restock = undefined;
        self setclientomnvar("ui_lethal_recharge_progress", 0);
    } else {
        self.waiting_for_tactical_restock = undefined;
        self setclientomnvar("ui_tactical_recharge_progress", 0);
    }
    self setclientomnvar("ui_recharge_notify", -1);
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4fe7
// Size: 0x32
function give_amped() {
    scripts\cp\utility::giveperk("specialty_quickdraw");
    scripts\cp\utility::giveperk("specialty_quickswap");
    scripts\cp\utility::giveperk("specialty_fastoffhand");
    scripts\cp\utility::giveperk("specialty_fastsprintrecovery");
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5021
// Size: 0x2
function take_amped() {
    
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x502b
// Size: 0x2
function give_shrapnel() {
    
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5035
// Size: 0x2
function take_shrapnel() {
    
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x503f
// Size: 0xa
function setmomentum() {
    thread runmomentum();
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5051
// Size: 0x5a
function runmomentum() {
    self endon("death");
    self endon("disconnect");
    self endon("momentum_unset");
    while (true) {
        if (self issprinting()) {
            graduallyincreasespeed();
            self.movespeedscaler = 1;
            if (isdefined(level.move_speed_scale)) {
                self [[ level.move_speed_scale ]]();
            }
        }
        wait 0.1;
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x50b3
// Size: 0xb2
function graduallyincreasespeed() {
    self endon("death");
    self endon("disconnect");
    self endon("momentum_reset");
    self endon("momentum_unset");
    thread momentum_monitormovement();
    thread momentum_monitordamage();
    for (var_51438b11657961cc = 0; var_51438b11657961cc < 0.08; var_51438b11657961cc += 0.01) {
        self.movespeedscaler += 0.01;
        if (isdefined(level.move_speed_scale)) {
            self [[ level.move_speed_scale ]]();
        }
        wait 0.035 / 0.08;
    }
    self playlocalsound("ftl_phase_in");
    self notify("momentum_max_speed");
    thread momentum_endaftermax();
    self waittill("momentum_reset");
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x516d
// Size: 0x1d
function momentum_endaftermax() {
    self endon("momentum_unset");
    self waittill("momentum_reset");
    self playlocalsound("ftl_phase_out");
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5192
// Size: 0x81
function momentum_monitormovement() {
    self endon("death");
    self endon("disconnect");
    self endon("momentum_unset");
    while (true) {
        if (!self issprinting() || self issprintsliding() || !self isonground() || self iswallrunning()) {
            wait 0.25;
            if (!self issprinting() || self issprintsliding() || !self isonground() || self iswallrunning()) {
                self notify("momentum_reset");
                break;
            }
        }
        waitframe();
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x521b
// Size: 0x20
function momentum_monitordamage() {
    self endon("death");
    self endon("disconnect");
    self waittill("damage");
    self notify("momentum_reset");
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5243
// Size: 0xa
function unsetmomentum() {
    self notify("momentum_unset");
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5255
// Size: 0xf9
function watchcombatspeedscaler() {
    self endon("death");
    self endon("disconnect");
    self endon("last_stand");
    self.pistolcombatspeedscalar = 1;
    self.aliensnarespeedscalar = 1;
    self.aliensnarecount = 0;
    self.combatspeedscalar = getcombatspeedscalar();
    self [[ level.move_speed_scale ]]();
    while (true) {
        objweapon = self waittill("weapon_change");
        currentweapon = self getcurrentweapon();
        baseweapon = getrawbaseweaponname(currentweapon);
        if (isdefined(baseweapon)) {
            if (baseweapon == "nrg" || baseweapon == "zmagnum" || baseweapon == "zg18" || baseweapon == "emc") {
                self.pistolcombatspeedscalar = 1.1;
            } else {
                self.pistolcombatspeedscalar = 1;
            }
            wait 0.05;
            updatecombatspeedscalar();
        }
        wait 0.05;
    }
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5356
// Size: 0x1e
function updatecombatspeedscalar() {
    self.combatspeedscalar = getcombatspeedscalar();
    self [[ level.move_speed_scale ]]();
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x537c
// Size: 0x15
function getcombatspeedscalar() {
    return self.pistolcombatspeedscalar * self.aliensnarespeedscalar;
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x539a
// Size: 0x55
function removeperk(perkname) {
    assertex(isdefined(perkname), "removePerk perkName not defined and should be");
    assertex(perkname != "specialty_null", "removePerk perkName shouldn't be specialty_null");
    assertex(perkname != "none", "removePerk perkName shouldn't be none");
    scripts\cp\utility::_unsetperk(perkname);
    scripts\cp\utility::_unsetextraperks(perkname);
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x53f7
// Size: 0x15
function setblockhealthregen() {
    self.healthregendisabled = 1;
    self notify("force_regeneration");
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5414
// Size: 0x14
function unsetblockhealthregen() {
    self.healthregendisabled = undefined;
    self notify("force_regeneration");
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5430
// Size: 0x10
function function_cc2cf1db71343d8f() {
    self.var_4aec8a632dc40e2c = &function_5790c8111baf94d3;
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5448
// Size: 0xc
function function_5ab8f9c4d813c44a() {
    self.var_4aec8a632dc40e2c = undefined;
}

// Namespace perks / namespace_c4cab616edf9b2b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x545c
// Size: 0xe
function function_5790c8111baf94d3() {
    scripts\cp\perks\cp_perks::activatePerk("specialty_elasomer_pads");
}

