// mwiii decomp prototype
#using script_372d8c5f69b0ae2e;
#using scripts\common\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\engine\utility.gsc;
#using script_3433ee6b63c7e243;
#using scripts\sp\fakeactor.gsc;

#namespace namespace_491e31b31cdf2a0a;

// Namespace namespace_491e31b31cdf2a0a/namespace_8938ef39370f4a55
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xac4
// Size: 0x137
function init() {
    if (!isdefined(level.scripted_melee)) {
        level.scripted_melee = spawnstruct();
    }
    if (istrue(level.scripted_melee.disabled)) {
        return;
    }
    level.scripted_melee.var_1fc4fd3ef975e8c8 = &function_78748799de25da5f;
    level.scripted_melee.var_2ec260ca66f2378 = &function_65bbb083561fa648;
    level.scripted_melee.var_efaa5d51e08521eb = &function_6c512ed7af23eb04;
    level.scripted_melee.var_3522908002cc5af = &function_b3cab4bbbd2f27bf;
    level.scripted_melee.var_16a2ad3bccc62bb5 = &function_53bc249de0d47b05;
    level.scripted_melee.var_2eda72772d041081 = &function_6410c0421b1874ac;
    level.scripted_melee.var_fbd8726770c4c39 = &function_d8f48ab0dfd5ef51;
    level.scripted_melee.var_8a66fb76621b9c84 = &function_91c24157247ef2fc;
    level.scripted_melee.var_5415e799cae1bac7 = &function_497a27b31d43d6af;
    level.scripted_melee.playerlinkeduselinkedvelocity = &function_5e2b19fd9204a302;
    namespace_db6d5eb4a31b23a::main();
}

// Namespace namespace_491e31b31cdf2a0a/namespace_8938ef39370f4a55
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc02
// Size: 0x229
function function_78748799de25da5f() {
    function_b0c99390cdb7edd5();
    anims = [];
    anims["vm_sp_takedown_knife_left_02"] = generic_human%vm_sp_takedown_knife_left_02_enemy;
    anims["vm_sp_takedown_knife_right_01"] = generic_human%vm_sp_takedown_knife_right_01_enemy;
    anims["vm_sp_takedown_knife_front_03"] = generic_human%vm_sp_takedown_knife_front_03_enemy;
    anims["vm_sp_takedown_knife_back_01"] = generic_human%vm_sp_takedown_knife_back_01_enemy;
    anims["vm_sp_takedown_knife_left_03"] = generic_human%vm_sp_takedown_knife_left_03_enemy;
    anims["vm_sp_takedown_knife_right_03"] = generic_human%vm_sp_takedown_knife_right_03_enemy;
    anims["vm_sp_takedown_knife_front_04"] = generic_human%vm_sp_takedown_knife_front_04_enemy;
    anims["vm_sp_takedown_knife_back_02"] = generic_human%vm_sp_takedown_knife_back_02_enemy;
    anims["vm_sp_takedown_pistol_left_01"] = generic_human%vm_sp_takedown_pistol_left_01_enemy;
    anims["vm_sp_takedown_pistol_right_01"] = generic_human%vm_sp_takedown_pistol_right_01_enemy;
    anims["vm_sp_takedown_pistol_front_01"] = generic_human%vm_sp_takedown_pistol_front_01_enemy;
    anims["vm_sp_takedown_pistol_back_01"] = generic_human%vm_sp_takedown_pistol_back_01_enemy;
    anims["vm_sp_takedown_pistol_left_02"] = generic_human%vm_sp_takedown_pistol_left_02_enemy;
    anims["vm_sp_takedown_pistol_right_02"] = generic_human%vm_sp_takedown_pistol_right_02_enemy;
    anims["vm_sp_takedown_pistol_front_02"] = generic_human%vm_sp_takedown_pistol_front_02_enemy;
    anims["vm_sp_takedown_pistol_back_02"] = generic_human%vm_sp_takedown_pistol_back_02_enemy;
    anims["vm_sp_takedown_knife_crouch_back_01"] = generic_human%vm_sp_takedown_knife_crouch_back_01_enemy;
    anims["vm_sp_takedown_knife_crouch_back_02"] = generic_human%vm_sp_takedown_knife_crouch_back_02_enemy;
    anims["vm_sp_takedown_knife_crouch_left_01"] = generic_human%vm_sp_takedown_knife_crouch_left_01_enemy;
    anims["vm_sp_takedown_knife_crouch_left_02"] = generic_human%vm_sp_takedown_knife_crouch_left_02_enemy;
    anims["vm_sp_takedown_knife_crouch_right_01"] = generic_human%vm_sp_takedown_knife_crouch_right_01_enemy;
    anims["vm_sp_takedown_knife_crouch_right_02"] = generic_human%vm_sp_takedown_knife_crouch_right_02_enemy;
    foreach (key, var_4f3089070d8b1e24 in anims) {
        level.scr_anim["generic"][key] = var_4f3089070d8b1e24;
        namespace_bc4a4b9456315863::addnotetrack_customfunction("generic", "cm_death", &function_d8f48ab0dfd5ef51, key);
        namespace_bc4a4b9456315863::addnotetrack_customfunction("generic", "cm_ragdoll", &function_91c24157247ef2fc, key);
        namespace_bc4a4b9456315863::addnotetrack_customfunction("generic", "cm_fx", &function_497a27b31d43d6af, key);
    }
}

// Namespace namespace_491e31b31cdf2a0a/namespace_8938ef39370f4a55
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe32
// Size: 0x655
function function_b0c99390cdb7edd5() {
    level.scr_animtree["scripted_melee_player_rig"] = %player;
    if (!isdefined(level.scr_model) || !isdefined(level.scr_model["scripted_melee_player_rig"])) {
        level.scr_model["scripted_melee_player_rig"] = "viewhands_base_fullbody_iw8";
    }
    level.scr_anim["scripted_melee_player_rig"]["vm_sp_takedown_knife_left_02"] = player%vm_sp_takedown_knife_left_02_player;
    level.scr_anim["scripted_melee_player_rig"]["vm_sp_takedown_knife_right_01"] = player%vm_sp_takedown_knife_right_01_player;
    level.scr_anim["scripted_melee_player_rig"]["vm_sp_takedown_knife_front_03"] = player%vm_sp_takedown_knife_front_03_player;
    level.scr_anim["scripted_melee_player_rig"]["vm_sp_takedown_knife_back_01"] = player%vm_sp_takedown_knife_back_01_player;
    utility::function_7a5a6498179656fc("vm_sp_takedown_knife_left_02", "left", &function_a3356321f4375b10, undefined, undefined, undefined, undefined, undefined, undefined, "TAG_ACCESSORY_LEFT");
    utility::function_7a5a6498179656fc("vm_sp_takedown_knife_right_01", "right", &function_a3356321f4375b10, undefined, undefined, undefined, undefined, undefined, undefined, "TAG_ACCESSORY_LEFT");
    utility::function_7a5a6498179656fc("vm_sp_takedown_knife_front_03", "front", &function_b767805ca0e381e);
    utility::function_7a5a6498179656fc("vm_sp_takedown_knife_back_01", "back", &function_279a32b2cdce2b2b);
    level.scr_anim["scripted_melee_player_rig"]["vm_sp_takedown_knife_left_03"] = player%vm_sp_takedown_knife_left_03_player;
    level.scr_anim["scripted_melee_player_rig"]["vm_sp_takedown_knife_right_03"] = player%vm_sp_takedown_knife_right_03_player;
    level.scr_anim["scripted_melee_player_rig"]["vm_sp_takedown_knife_front_04"] = player%vm_sp_takedown_knife_front_04_player;
    level.scr_anim["scripted_melee_player_rig"]["vm_sp_takedown_knife_back_02"] = player%vm_sp_takedown_knife_back_02_player;
    utility::function_7a5a6498179656fc("vm_sp_takedown_knife_left_03", "left", &function_a3356321f4375b10);
    utility::function_7a5a6498179656fc("vm_sp_takedown_knife_right_03", "right", &function_a3356321f4375b10);
    utility::function_7a5a6498179656fc("vm_sp_takedown_knife_front_04", "front", &function_b767805ca0e381e, undefined, undefined, undefined, undefined, undefined, undefined, "TAG_ACCESSORY_LEFT");
    utility::function_7a5a6498179656fc("vm_sp_takedown_knife_back_02", "back", &function_279a32b2cdce2b2b);
    level.scr_anim["scripted_melee_player_rig"]["vm_sp_takedown_pistol_left_01"] = player%vm_sp_takedown_pistol_left_01_player;
    level.scr_anim["scripted_melee_player_rig"]["vm_sp_takedown_pistol_right_01"] = player%vm_sp_takedown_pistol_right_01_player;
    level.scr_anim["scripted_melee_player_rig"]["vm_sp_takedown_pistol_front_01"] = player%vm_sp_takedown_pistol_front_01_player;
    level.scr_anim["scripted_melee_player_rig"]["vm_sp_takedown_pistol_back_01"] = player%vm_sp_takedown_pistol_back_01_player;
    utility::function_7a5a6498179656fc("vm_sp_takedown_pistol_left_01", "left", &function_199c2718c1a3385f, undefined, undefined, undefined, undefined, undefined, 1);
    utility::function_7a5a6498179656fc("vm_sp_takedown_pistol_right_01", "right", &function_199c2718c1a3385f, undefined, undefined, undefined, undefined, undefined, 1);
    utility::function_7a5a6498179656fc("vm_sp_takedown_pistol_front_01", "front", &function_199c2718c1a3385f, undefined, undefined, undefined, undefined, undefined, 1);
    utility::function_7a5a6498179656fc("vm_sp_takedown_pistol_back_01", "back", &function_fdfbaa517a1c4018, undefined, undefined, undefined, undefined, undefined, 1);
    namespace_bc4a4b9456315863::addnotetrack_customfunction("scripted_melee_player_rig", "fire", &function_ebea6b350af8fb8d, "vm_sp_takedown_pistol_left_01");
    namespace_bc4a4b9456315863::addnotetrack_customfunction("scripted_melee_player_rig", "fire", &function_ebea6b350af8fb8d, "vm_sp_takedown_pistol_right_01");
    namespace_bc4a4b9456315863::addnotetrack_customfunction("scripted_melee_player_rig", "fire", &function_ebea6b350af8fb8d, "vm_sp_takedown_pistol_front_01");
    namespace_bc4a4b9456315863::addnotetrack_customfunction("scripted_melee_player_rig", "fire", &function_ebea6b350af8fb8d, "vm_sp_takedown_pistol_back_01");
    level.scr_anim["scripted_melee_player_rig"]["vm_sp_takedown_pistol_left_02"] = player%vm_sp_takedown_pistol_left_02_player;
    level.scr_anim["scripted_melee_player_rig"]["vm_sp_takedown_pistol_right_02"] = player%vm_sp_takedown_pistol_right_02_player;
    level.scr_anim["scripted_melee_player_rig"]["vm_sp_takedown_pistol_front_02"] = player%vm_sp_takedown_pistol_front_02_player;
    level.scr_anim["scripted_melee_player_rig"]["vm_sp_takedown_pistol_back_02"] = player%vm_sp_takedown_pistol_back_02_player;
    utility::function_7a5a6498179656fc("vm_sp_takedown_pistol_left_02", "left", &function_199c2718c1a3385f, undefined, undefined, undefined, undefined, undefined, 1);
    utility::function_7a5a6498179656fc("vm_sp_takedown_pistol_right_02", "right", &function_199c2718c1a3385f, undefined, undefined, undefined, undefined, undefined, 1);
    utility::function_7a5a6498179656fc("vm_sp_takedown_pistol_front_02", "front", &function_199c2718c1a3385f, undefined, undefined, undefined, undefined, undefined, 1);
    utility::function_7a5a6498179656fc("vm_sp_takedown_pistol_back_02", "back", &function_fdfbaa517a1c4018, undefined, undefined, undefined, undefined, undefined, 1);
    namespace_bc4a4b9456315863::addnotetrack_customfunction("scripted_melee_player_rig", "fire", &function_ebea6b350af8fb8d, "vm_sp_takedown_pistol_left_02");
    namespace_bc4a4b9456315863::addnotetrack_customfunction("scripted_melee_player_rig", "fire", &function_ebea6b350af8fb8d, "vm_sp_takedown_pistol_right_02");
    namespace_bc4a4b9456315863::addnotetrack_customfunction("scripted_melee_player_rig", "fire", &function_ebea6b350af8fb8d, "vm_sp_takedown_pistol_front_02");
    namespace_bc4a4b9456315863::addnotetrack_customfunction("scripted_melee_player_rig", "fire", &function_ebea6b350af8fb8d, "vm_sp_takedown_pistol_back_02");
    level.scr_anim["scripted_melee_player_rig"]["vm_sp_takedown_knife_crouch_back_01"] = player%vm_sp_takedown_knife_crouch_back_01_player;
    level.scr_anim["scripted_melee_player_rig"]["vm_sp_takedown_knife_crouch_back_02"] = player%vm_sp_takedown_knife_crouch_back_02_player;
    level.scr_anim["scripted_melee_player_rig"]["vm_sp_takedown_knife_crouch_left_01"] = player%vm_sp_takedown_knife_crouch_left_01_player;
    level.scr_anim["scripted_melee_player_rig"]["vm_sp_takedown_knife_crouch_left_02"] = player%vm_sp_takedown_knife_crouch_left_02_player;
    level.scr_anim["scripted_melee_player_rig"]["vm_sp_takedown_knife_crouch_right_01"] = player%vm_sp_takedown_knife_crouch_right_01_player;
    level.scr_anim["scripted_melee_player_rig"]["vm_sp_takedown_knife_crouch_right_02"] = player%vm_sp_takedown_knife_crouch_right_02_player;
    utility::function_7a5a6498179656fc("vm_sp_takedown_knife_crouch_back_01", "back", &function_fa7cc1ad28b01833, undefined, "crouch", "crouch", undefined, undefined, undefined, "TAG_ACCESSORY_LEFT");
    utility::function_7a5a6498179656fc("vm_sp_takedown_knife_crouch_back_02", "back", &function_fa7cc1ad28b01833, undefined, "crouch", "crouch");
    utility::function_7a5a6498179656fc("vm_sp_takedown_knife_crouch_left_01", "left", &function_65931e2cbca86748, undefined, "crouch", "crouch");
    utility::function_7a5a6498179656fc("vm_sp_takedown_knife_crouch_left_02", "left", &function_65931e2cbca86748, undefined, "crouch", "crouch");
    utility::function_7a5a6498179656fc("vm_sp_takedown_knife_crouch_right_01", "right", &function_65931e2cbca86748, undefined, "crouch", "crouch");
    utility::function_7a5a6498179656fc("vm_sp_takedown_knife_crouch_right_02", "right", &function_65931e2cbca86748, undefined, "crouch", "crouch");
}

// Namespace namespace_491e31b31cdf2a0a/namespace_8938ef39370f4a55
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x148e
// Size: 0x41
function function_65bbb083561fa648() {
    self.scripted_melee_player_rig = namespace_a8bfa6bedd2a9d2b::spawn_anim_model("scripted_melee_player_rig", self.origin, self.angles);
    self.scripted_melee_player_rig namespace_bc4a4b9456315863::function_1cb661b457551a3(1, self, 0.35);
}

// Namespace namespace_491e31b31cdf2a0a/namespace_8938ef39370f4a55
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14d6
// Size: 0x80
function function_6c512ed7af23eb04() {
    team3 = namespace_a8bfa6bedd2a9d2b::get_all_closest_living(self.origin, getaiarray("team3"), 128, 0);
    enemies = namespace_a8bfa6bedd2a9d2b::get_all_closest_living(self.origin, getaiarray("axis"), 128, 0);
    var_765a8198c5e89918 = namespace_3c37cb17ade254d::array_combine(team3, enemies);
    namespace_3c37cb17ade254d::array_call(var_765a8198c5e89918, &function_f23f106f8976771d);
    /#
        namespace_3c37cb17ade254d::array_thread(var_765a8198c5e89918, &function_7eaecc1fbfd9ad25, self);
    #/
}

// Namespace namespace_491e31b31cdf2a0a/namespace_8938ef39370f4a55
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x155d
// Size: 0x24
function function_b3cab4bbbd2f27bf() {
    if (!getdvarint(@"hash_301100a436cfdb2c")) {
        self enableinvulnerability();
    }
    self enablequickweaponswitch(1);
}

// Namespace namespace_491e31b31cdf2a0a/namespace_8938ef39370f4a55
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1588
// Size: 0x12
function function_53bc249de0d47b05() {
    self disableinvulnerability();
    self enablequickweaponswitch(0);
}

// Namespace namespace_491e31b31cdf2a0a/namespace_8938ef39370f4a55
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15a1
// Size: 0x155
function function_91c24157247ef2fc(guy) {
    debug_print("start ragdoll via note");
    if (!isdefined(guy) && isdefined(guy.var_540e3c006ce71d3a.var_4187711225445340)) {
        foreach (corpse in getcorpsearray()) {
            if (istrue(corpse.var_91c24157247ef2fc)) {
                continue;
            }
            if (corpse isragdoll()) {
                continue;
            }
            var_a4f5fb62ba3a113b = corpse namespace_a8bfa6bedd2a9d2b::get_corpse_origin();
            if (isdefined(var_a4f5fb62ba3a113b) && distancesquared(var_a4f5fb62ba3a113b, guy.var_540e3c006ce71d3a.var_4187711225445340) < squared(60)) {
                debug_print("do ragdoll via note");
                corpse startragdoll();
                corpse.var_91c24157247ef2fc = 1;
            }
        }
    } else if (isdefined(guy) && !istrue(guy.var_91c24157247ef2fc)) {
        guy thread namespace_223959d3e5206cfb::dropallaiweapons();
        debug_print("do ragdoll via note");
        guy startragdoll();
        guy.var_91c24157247ef2fc = 1;
    }
    guy.var_540e3c006ce71d3a.var_4187711225445340 = undefined;
}

// Namespace namespace_491e31b31cdf2a0a/namespace_8938ef39370f4a55
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16fd
// Size: 0x25
function function_6410c0421b1874ac() {
    rules = namespace_3c37cb17ade254d::array_combine(function_e5433a928bc95cca(), [0:&function_29377f3b78dcb609]);
    return rules;
}

// Namespace namespace_491e31b31cdf2a0a/namespace_8938ef39370f4a55
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x172a
// Size: 0x2c
function function_29377f3b78dcb609(player, victim) {
    if (victim namespace_744375947584adb2::is_fakeactor() || !isai(victim)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_491e31b31cdf2a0a/namespace_8938ef39370f4a55
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x175e
// Size: 0x14
function function_5e2b19fd9204a302(bool) {
    self playerlinkeduselinkedvelocity(bool);
}

