// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\gameskill.gsc;

#namespace namespace_3dfa6eb6c5741630;

// Namespace namespace_3dfa6eb6c5741630/namespace_310bdaa3cf041c47
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41d
// Size: 0xa
function init_gameskill() {
    setskill();
}

// Namespace namespace_3dfa6eb6c5741630/namespace_310bdaa3cf041c47
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42e
// Size: 0x1c
function set_gameskill() {
    level.gameskill = getdvarint(@"hash_2ca7440fd32bd772", 1);
}

// Namespace namespace_3dfa6eb6c5741630/namespace_310bdaa3cf041c47
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x451
// Size: 0xc
function get_gameskill() {
    return level.gameskill;
}

// Namespace namespace_3dfa6eb6c5741630/namespace_310bdaa3cf041c47
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x465
// Size: 0xc8e
function setskill(reset) {
    if (!istrue(reset)) {
        if (isdefined(level.gameskill)) {
            return;
        }
        level.difficultytype[0] = "easy";
        level.difficultytype[1] = "normal";
        level.difficultytype[2] = "hardened";
        level.difficultytype[3] = "veteran";
        level.difficultystring["easy"] = "GAMESKILL_EASY";
        level.difficultystring["normal"] = "GAMESKILL_NORMAL";
        level.difficultystring["hardened"] = "GAMESKILL_HARDENED";
        level.difficultystring["veteran"] = "GAMESKILL_VETERAN";
    }
    anim.run_accuracy = 0.5;
    anim.walk_accuracy = 0.8;
    level.mg42badplace_mintime = 8;
    level.mg42badplace_maxtime = 16;
    level.difficultysettings["playerGrenadeBaseTime"]["easy"] = 40000;
    level.difficultysettings["playerGrenadeBaseTime"]["normal"] = 35000;
    level.difficultysettings["playerGrenadeBaseTime"]["hardened"] = 25000;
    level.difficultysettings["playerGrenadeBaseTime"]["veteran"] = 25000;
    level.difficultysettings["playerGrenadeRangeTime"]["easy"] = 20000;
    level.difficultysettings["playerGrenadeRangeTime"]["normal"] = 15000;
    level.difficultysettings["playerGrenadeRangeTime"]["hardened"] = 10000;
    level.difficultysettings["playerGrenadeRangeTime"]["veteran"] = 10000;
    level.difficultysettings["playerDoubleGrenadeTime"]["easy"] = 3600000;
    level.difficultysettings["playerDoubleGrenadeTime"]["normal"] = 150000;
    level.difficultysettings["playerDoubleGrenadeTime"]["hardened"] = 90000;
    level.difficultysettings["playerDoubleGrenadeTime"]["veteran"] = 45000;
    level.difficultysettings["double_grenades_allowed"]["easy"] = 0;
    level.difficultysettings["double_grenades_allowed"]["normal"] = 1;
    level.difficultysettings["double_grenades_allowed"]["hardened"] = 1;
    level.difficultysettings["double_grenades_allowed"]["veteran"] = 1;
    level.difficultysettings["threatbias"]["easy"] = 100;
    level.difficultysettings["threatbias"]["normal"] = 150;
    level.difficultysettings["threatbias"]["hardened"] = 200;
    level.difficultysettings["threatbias"]["veteran"] = 400;
    level.difficultysettings["base_enemy_accuracy"]["easy"] = 0.9;
    level.difficultysettings["base_enemy_accuracy"]["normal"] = 1;
    level.difficultysettings["base_enemy_accuracy"]["hardened"] = 1.15;
    level.difficultysettings["base_enemy_accuracy"]["veteran"] = 1.5;
    level.difficultysettings["accuracyDistScale"]["easy"] = 1;
    level.difficultysettings["accuracyDistScale"]["normal"] = 1;
    level.difficultysettings["accuracyDistScale"]["hardened"] = 0.8;
    level.difficultysettings["accuracyDistScale"]["veteran"] = 0.5;
    level.difficultysettings["min_sniper_burst_delay_time"]["easy"] = 3;
    level.difficultysettings["min_sniper_burst_delay_time"]["normal"] = 2;
    level.difficultysettings["min_sniper_burst_delay_time"]["hardened"] = 1.5;
    level.difficultysettings["min_sniper_burst_delay_time"]["veteran"] = 0.75;
    level.difficultysettings["sniper_converge_scale"]["easy"] = 1.3;
    level.difficultysettings["sniper_converge_scale"]["normal"] = 1.1;
    level.difficultysettings["sniper_converge_scale"]["hardened"] = 0.9;
    level.difficultysettings["sniper_converge_scale"]["veteran"] = 0.45;
    level.difficultysettings["sniperAccuDiffScale"]["easy"] = 1;
    level.difficultysettings["sniperAccuDiffScale"]["normal"] = 1.6;
    level.difficultysettings["sniperAccuDiffScale"]["hardened"] = 1.6;
    level.difficultysettings["sniperAccuDiffScale"]["veteran"] = 2.5;
    level.difficultysettings["max_sniper_burst_delay_time"]["easy"] = 4;
    level.difficultysettings["max_sniper_burst_delay_time"]["normal"] = 3;
    level.difficultysettings["max_sniper_burst_delay_time"]["hardened"] = 2;
    level.difficultysettings["max_sniper_burst_delay_time"]["veteran"] = 1.1;
    level.difficultysettings["pain_test"]["easy"] = &always_pain;
    level.difficultysettings["pain_test"]["normal"] = &always_pain;
    level.difficultysettings["pain_test"]["hardened"] = &namespace_2f36c2cc5a44d845::pain_protection;
    level.difficultysettings["pain_test"]["veteran"] = &namespace_2f36c2cc5a44d845::pain_protection;
    level.difficultysettings["missTimeConstant"]["easy"] = 1;
    level.difficultysettings["missTimeConstant"]["normal"] = 0.05;
    level.difficultysettings["missTimeConstant"]["hardened"] = 0.03;
    level.difficultysettings["missTimeConstant"]["veteran"] = 0.02;
    level.difficultysettings["missTimeDistanceFactor"]["easy"] = 0.0008;
    level.difficultysettings["missTimeDistanceFactor"]["normal"] = 0.0001;
    level.difficultysettings["missTimeDistanceFactor"]["hardened"] = 5e-05;
    level.difficultysettings["missTimeDistanceFactor"]["veteran"] = 3e-05;
    level.difficultysettings["player_maxFlashBangTime"]["easy"] = 6;
    level.difficultysettings["player_maxFlashBangTime"]["normal"] = 8;
    level.difficultysettings["player_maxFlashBangTime"]["hardened"] = 9;
    level.difficultysettings["player_maxFlashBangTime"]["veteran"] = 10;
    level.difficultysettings["invulTime_onDamageMin"]["easy"] = 0.35;
    level.difficultysettings["invulTime_onDamageMin"]["normal"] = 0.3;
    level.difficultysettings["invulTime_onDamageMin"]["hardened"] = 0.2;
    level.difficultysettings["invulTime_onDamageMin"]["veteran"] = 0.2;
    level.difficultysettings["invulTime_onDamageMax"]["easy"] = 0.35;
    level.difficultysettings["invulTime_onDamageMax"]["normal"] = 0.3;
    level.difficultysettings["invulTime_onDamageMax"]["hardened"] = 0.2;
    level.difficultysettings["invulTime_onDamageMax"]["veteran"] = 0.2;
    level.difficultysettings["invulTime_onDamage"]["easy"] = 0.35;
    level.difficultysettings["invulTime_onDamage"]["normal"] = 0.3;
    level.difficultysettings["invulTime_onDamage"]["hardened"] = 0.2;
    level.difficultysettings["invulTime_onDamage"]["veteran"] = 0.2;
    level.difficultysettings["invulTime_deathShieldDuration"]["easy"] = 2;
    level.difficultysettings["invulTime_deathShieldDuration"]["normal"] = 1;
    level.difficultysettings["invulTime_deathShieldDuration"]["hardened"] = 0.5;
    level.difficultysettings["invulTime_deathShieldDuration"]["veteran"] = 0.25;
    level.difficultysettings["player_deathsDoorDuration"]["easy"] = 4;
    level.difficultysettings["player_deathsDoorDuration"]["normal"] = 4;
    level.difficultysettings["player_deathsDoorDuration"]["hardened"] = 4;
    level.difficultysettings["player_deathsDoorDuration"]["veteran"] = 4;
    level.difficultysettings["player_healthRegenDelayMin"]["easy"] = 2.1;
    level.difficultysettings["player_healthRegenDelayMin"]["normal"] = 1.85;
    level.difficultysettings["player_healthRegenDelayMin"]["hardened"] = 2.7;
    level.difficultysettings["player_healthRegenDelayMin"]["veteran"] = 3.25;
    level.difficultysettings["player_healthRegenDelayMax"]["easy"] = 4.35;
    level.difficultysettings["player_healthRegenDelayMax"]["normal"] = 5;
    level.difficultysettings["player_healthRegenDelayMax"]["hardened"] = 6;
    level.difficultysettings["player_healthRegenDelayMax"]["veteran"] = 7.05;
    level.difficultysettings["player_healthRegenDelay"]["easy"] = 2.5;
    level.difficultysettings["player_healthRegenDelay"]["normal"] = 3;
    level.difficultysettings["player_healthRegenDelay"]["hardened"] = 4;
    level.difficultysettings["player_healthRegenDelay"]["veteran"] = 5.05;
    level.difficultysettings["player_healthRegenRateMin"]["easy"] = 1.25;
    level.difficultysettings["player_healthRegenRateMin"]["normal"] = 0.65;
    level.difficultysettings["player_healthRegenRateMin"]["hardened"] = 0.25;
    level.difficultysettings["player_healthRegenRateMin"]["veteran"] = 0.05;
    level.difficultysettings["player_healthRegenRateMax"]["easy"] = 18.85;
    level.difficultysettings["player_healthRegenRateMax"]["normal"] = 14.65;
    level.difficultysettings["player_healthRegenRateMax"]["hardened"] = 10.55;
    level.difficultysettings["player_healthRegenRateMax"]["veteran"] = 9.2;
    level.difficultysettings["player_healthRegenRate"]["easy"] = 40;
    level.difficultysettings["player_healthRegenRate"]["normal"] = 40;
    level.difficultysettings["player_healthRegenRate"]["hardened"] = 40;
    level.difficultysettings["player_healthRegenRate"]["veteran"] = 40;
    level.difficultysettings["player_health"]["easy"] = 355;
    level.difficultysettings["player_health"]["normal"] = 180;
    level.difficultysettings["player_health"]["hardened"] = 140;
    level.difficultysettings["player_health"]["veteran"] = 80;
    level.difficultysettings["player_diedRecentlyCooldown"]["easy"] = 70;
    level.difficultysettings["player_diedRecentlyCooldown"]["normal"] = 30;
    level.difficultysettings["player_diedRecentlyCooldown"]["hardened"] = 0;
    level.difficultysettings["player_diedRecentlyCooldown"]["veteran"] = 0;
    level.lastplayersighted = 0;
    level.playermeleedamagemultiplier_dvar = 0.8;
    init_mgturretsettings();
    updategameskill();
    updatealldifficulty();
}

// Namespace namespace_3dfa6eb6c5741630/namespace_310bdaa3cf041c47
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10fa
// Size: 0xa
function updatealldifficulty() {
    setglobaldifficulty();
}

// Namespace namespace_3dfa6eb6c5741630/namespace_310bdaa3cf041c47
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x110b
// Size: 0x297
function init_mgturretsettings() {
    level.mgturretsettings["easy"]["convergenceTime"] = 2.5;
    level.mgturretsettings["easy"]["suppressionTime"] = 3;
    level.mgturretsettings["easy"]["accuracy"] = 0.38;
    level.mgturretsettings["easy"]["aiSpread"] = 2;
    level.mgturretsettings["easy"]["playerSpread"] = 0.5;
    level.mgturretsettings["medium"]["convergenceTime"] = 1.5;
    level.mgturretsettings["medium"]["suppressionTime"] = 3;
    level.mgturretsettings["medium"]["accuracy"] = 0.38;
    level.mgturretsettings["medium"]["aiSpread"] = 2;
    level.mgturretsettings["medium"]["playerSpread"] = 0.5;
    level.mgturretsettings["hard"]["convergenceTime"] = 0.8;
    level.mgturretsettings["hard"]["suppressionTime"] = 3;
    level.mgturretsettings["hard"]["accuracy"] = 0.38;
    level.mgturretsettings["hard"]["aiSpread"] = 2;
    level.mgturretsettings["hard"]["playerSpread"] = 0.5;
    level.mgturretsettings["veteran"]["convergenceTime"] = 0.8;
    level.mgturretsettings["veteran"]["suppressionTime"] = 3;
    level.mgturretsettings["veteran"]["accuracy"] = 0.38;
    level.mgturretsettings["veteran"]["aiSpread"] = 2;
    level.mgturretsettings["veteran"]["playerSpread"] = 0.5;
    level.mgturretsettings["fu"]["convergenceTime"] = 0.4;
    level.mgturretsettings["fu"]["suppressionTime"] = 3;
    level.mgturretsettings["fu"]["accuracy"] = 0.38;
    level.mgturretsettings["fu"]["aiSpread"] = 2;
    level.mgturretsettings["fu"]["playerSpread"] = 0.5;
}

// Namespace namespace_3dfa6eb6c5741630/namespace_310bdaa3cf041c47
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13a9
// Size: 0x2c
function setdifficulty() {
    /#
        assert(isplayer(self));
    #/
    /#
        assert(isdefined(self.gameskill));
    #/
    set_difficulty_from_locked_settings();
}

// Namespace namespace_3dfa6eb6c5741630/namespace_310bdaa3cf041c47
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13dc
// Size: 0x6d
function setglobaldifficulty() {
    var_cddda98c04947a50 = get_skill_from_index(level.gameskill);
    anim.pain_test = get_difficultysetting_global("pain_test");
    function_4afdefc72472a638(get_difficultysetting_global("min_sniper_burst_delay_time"));
    function_5eddc94e0785d7a2(get_difficultysetting_global("max_sniper_burst_delay_time"));
    setsaveddvar(@"hash_25f40faa68cfe5d6", get_difficultysetting_global("accuracyDistScale"));
}

// Namespace namespace_3dfa6eb6c5741630/namespace_310bdaa3cf041c47
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1450
// Size: 0x3c
function updategameskill() {
    if (isdefined(level.forcedgameskill)) {
        level.gameskill = level.forcedgameskill;
    } else {
        set_gameskill();
    }
    setglobaldifficulty();
    return level.gameskill;
}

// Namespace namespace_3dfa6eb6c5741630/namespace_310bdaa3cf041c47
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1494
// Size: 0x402
function apply_difficulty_settings(var_64e5d13011016a93) {
    self.gs = spawnstruct();
    function_2a781949ace88ca4(get_difficultysetting_frac("player_diedRecentlyCooldown", var_64e5d13011016a93));
    self.gs.maxflashbangtime = get_difficultysetting_frac("player_maxFlashBangTime", var_64e5d13011016a93);
    self.gs.invultime_ondamagemin = get_difficultysetting_frac("invulTime_onDamageMin", var_64e5d13011016a93);
    self.gs.invultime_ondamagemax = get_difficultysetting_frac("invulTime_onDamageMax", var_64e5d13011016a93);
    self.gs.invultime_deathshieldduration = get_difficultysetting_frac("invulTime_deathShieldDuration", var_64e5d13011016a93);
    self.gs.invultime_ondamage = get_difficultysetting_frac("invulTime_onDamage", var_64e5d13011016a93);
    self.gs.deathsdoorduration = get_difficultysetting_frac("player_deathsDoorDuration", var_64e5d13011016a93);
    self.gs.scripteddamagemultiplier = 1;
    self.gs.scripteddeathshielddurationscale = 2;
    self.gs.healthregendelaymin = get_difficultysetting_frac("player_healthRegenDelayMin", var_64e5d13011016a93);
    self.gs.healthregendelaymax = get_difficultysetting_frac("player_healthRegenDelayMax", var_64e5d13011016a93);
    self.gs.healthregendelay = get_difficultysetting_frac("player_healthRegenDelay", var_64e5d13011016a93);
    self.gs.healthregenratemin = get_difficultysetting_frac("player_healthRegenRateMin", var_64e5d13011016a93);
    self.gs.healthregenratemax = get_difficultysetting_frac("player_healthRegenRateMax", var_64e5d13011016a93);
    self.gs.healthregendelay = get_difficultysetting_frac("player_healthRegenDelay", var_64e5d13011016a93);
    self.gs.healthregenrate = get_difficultysetting_frac("player_healthRegenRate", var_64e5d13011016a93);
    self.gs.player_attacker_accuracy = get_difficultysetting_frac("base_enemy_accuracy", var_64e5d13011016a93);
    update_player_attacker_accuracy();
    self.gs.playergrenadebasetime = int(get_difficultysetting_frac("playerGrenadeBaseTime", var_64e5d13011016a93));
    self.gs.playergrenaderangetime = int(get_difficultysetting_frac("playerGrenadeRangeTime", var_64e5d13011016a93));
    self.gs.playerdoublegrenadetime = int(get_difficultysetting_frac("playerDoubleGrenadeTime", var_64e5d13011016a93));
    function_113dc070d175daff(get_difficultysetting_frac("min_sniper_burst_delay_time", var_64e5d13011016a93));
    function_87e4ff0e078152e9(get_difficultysetting_frac("max_sniper_burst_delay_time", var_64e5d13011016a93));
    var_4cc77ae3c5e8921 = 1;
    if (level.gameskill == 0) {
        var_4cc77ae3c5e8921 = 2;
    }
    function_90faf3f11984372a(get_difficultysetting_frac("sniperAccuDiffScale", var_64e5d13011016a93), var_4cc77ae3c5e8921, 1);
    self.gs.damagemultiplierhealth = self.maxhealth / get_difficultysetting_frac("player_health", var_64e5d13011016a93);
    if (utility::playerarmorenabled()) {
        self.gs.armorratiohealthregenthreshold = get_difficultysetting_frac("player_armorRatioHealthRegenThreshold", var_64e5d13011016a93);
        self.gs.armordamagetohealthratiomin = get_difficultysetting_frac("player_armorDamageToHealthRatioMin", var_64e5d13011016a93);
        self.gs.armordamagetohealthratiomax = get_difficultysetting_frac("player_armorDamageToHealthRatioMax", var_64e5d13011016a93);
        self.gs.damagemultiplierarmor = self.armor.maxamount / get_difficultysetting_frac("player_armor", var_64e5d13011016a93);
        self.damagemultiplier = self.gs.damagemultiplierarmor;
    } else {
        self.damagemultiplier = self.gs.damagemultiplierhealth;
    }
    self.threatbias = int(get_difficultysetting_frac("threatbias", var_64e5d13011016a93));
}

// Namespace namespace_3dfa6eb6c5741630/namespace_310bdaa3cf041c47
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x189d
// Size: 0x15
function set_difficulty_from_locked_settings() {
    apply_difficulty_settings(1);
    apply_difficulty_settings_shared(1);
}

// Namespace namespace_3dfa6eb6c5741630/namespace_310bdaa3cf041c47
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18b9
// Size: 0xd
function resetskill() {
    waittillframeend();
    setskill(1);
}

// Namespace namespace_3dfa6eb6c5741630/namespace_310bdaa3cf041c47
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18cd
// Size: 0x24a
function wave_difficulty_update(difficulty) {
    if (getdvarint(@"hash_94ebdb2e64164d03", -1) != -1) {
        difficulty = getdvarint(@"hash_94ebdb2e64164d03", -1);
    }
    setting = level.difficultytype[difficulty];
    foreach (player in level.players) {
        player.gs.player_attacker_accuracy = level.difficultysettings["base_enemy_accuracy"][setting];
        player.attackeraccuracy = player.gs.player_attacker_accuracy;
        player.gs.playergrenadebasetime = int(level.difficultysettings["playerGrenadeBaseTime"][setting]);
        player.gs.playergrenaderangetime = int(level.difficultysettings["playerGrenadeRangeTime"][setting]);
        player.gs.playerdoublegrenadetime = int(level.difficultysettings["playerDoubleGrenadeTime"][setting]);
        player.var_da4b6392c1bec6a1 = level.difficultysettings["missTimeConstant"][setting];
        player.var_cef700ed012e8981 = level.difficultysettings["missTimeDistanceFactor"][setting];
    }
    function_38ae83992c7eb8a5(level.difficultysettings["double_grenades_allowed"][setting]);
    anim.pain_test = level.difficultysettings["pain_test"][setting];
    function_4afdefc72472a638(level.difficultysettings["min_sniper_burst_delay_time"][setting]);
    function_5eddc94e0785d7a2(level.difficultysettings["max_sniper_burst_delay_time"][setting]);
    function_113dc070d175daff(level.difficultysettings["min_sniper_burst_delay_time"][setting]);
    function_87e4ff0e078152e9(level.difficultysettings["max_sniper_burst_delay_time"][setting]);
    setsaveddvar(@"hash_25f40faa68cfe5d6", level.difficultysettings["accuracyDistScale"][setting]);
}

// Namespace namespace_3dfa6eb6c5741630/namespace_310bdaa3cf041c47
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b1e
// Size: 0x6a
function update_player_attacker_accuracy() {
    if (!isdefined(self.baseignorerandombulletdamage)) {
        self.baseignorerandombulletdamage = 0;
    }
    if (!isdefined(self.scriptedattackeraccuracy)) {
        self.scriptedattackeraccuracy = 1;
    }
    self.ignorerandombulletdamage = self.baseignorerandombulletdamage;
    self.attackeraccuracy = self.gs.player_attacker_accuracy * self.scriptedattackeraccuracy;
}

// Namespace namespace_3dfa6eb6c5741630/namespace_310bdaa3cf041c47
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b8f
// Size: 0xc
function get_player_gameskill() {
    return level.gameskill;
}

