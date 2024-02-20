// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;

#namespace namespace_9e577779991b200c;

// Namespace namespace_9e577779991b200c/namespace_8be37ac443f7f654
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48c
// Size: 0x6d
function init() {
    level.var_cebc8cc0640fe57 = spawnstruct();
    level.var_cebc8cc0640fe57.loadouts = [];
    level.var_cebc8cc0640fe57.var_e1f5513362a6c2aa = [];
    level.var_cebc8cc0640fe57.initialized = 0;
    function_13edd4d60268005f();
    level.var_cebc8cc0640fe57.initialized = 1;
}

// Namespace namespace_9e577779991b200c/namespace_8be37ac443f7f654
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x500
// Size: 0x378
function private function_13edd4d60268005f() {
    var_2c01e192ee48a8a9 = level.var_1a2b600a06ec21f4.var_3d5c458ede7b8a36;
    var_5cfbd0f1b8a69ed9 = getscriptbundle(function_2ef675c13ca1c4af(%"hash_2c353b56cfc15851", var_2c01e192ee48a8a9));
    if (!isdefined(var_5cfbd0f1b8a69ed9)) {
        /#
            assertmsg("bot_loadout_init_script_bundle: Unable to find script bundle for bot loadout list: " + function_53c4c53197386572(var_2c01e192ee48a8a9, "undefined"));
        #/
        return;
    }
    foreach (var_4ce3ef82d7b573e in var_5cfbd0f1b8a69ed9.var_e2eb85f16407d26a) {
        var_2637bff642ea1c8d = getscriptbundle("botloadout:" + var_4ce3ef82d7b573e.loadout);
        if (!isdefined(var_2637bff642ea1c8d)) {
            /#
                assertmsg("bot_loadout_init_script_bundle: Unable to find script bundle for bot loadout");
            #/
        } else {
            level.var_cebc8cc0640fe57.loadouts[var_4ce3ef82d7b573e.loadout] = var_2637bff642ea1c8d;
            var_45760037594a027 = [];
            var_482bfdbcc9cca6c4 = [];
            if (isdefined(var_2637bff642ea1c8d.personality)) {
                if (istrue(var_2637bff642ea1c8d.personality.camper)) {
                    var_45760037594a027[var_45760037594a027.size] = "camper";
                }
                if (istrue(var_2637bff642ea1c8d.personality.var_65638b1a080a38d3)) {
                    var_45760037594a027[var_45760037594a027.size] = "run_and_gun";
                }
                if (istrue(var_2637bff642ea1c8d.personality.cqb)) {
                    var_45760037594a027[var_45760037594a027.size] = "cqb";
                }
            }
            if (isdefined(var_2637bff642ea1c8d.difficulty)) {
                if (istrue(var_2637bff642ea1c8d.difficulty.recruit)) {
                    var_482bfdbcc9cca6c4[var_482bfdbcc9cca6c4.size] = "recruit";
                }
                if (istrue(var_2637bff642ea1c8d.difficulty.regular)) {
                    var_482bfdbcc9cca6c4[var_482bfdbcc9cca6c4.size] = "regular";
                }
                if (istrue(var_2637bff642ea1c8d.difficulty.hardened)) {
                    var_482bfdbcc9cca6c4[var_482bfdbcc9cca6c4.size] = "hardened";
                }
                if (istrue(var_2637bff642ea1c8d.difficulty.veteran)) {
                    var_482bfdbcc9cca6c4[var_482bfdbcc9cca6c4.size] = "veteran";
                }
            }
            if (isdefined(var_2637bff642ea1c8d.archetype)) {
                foreach (personality in var_45760037594a027) {
                    foreach (difficulty in var_482bfdbcc9cca6c4) {
                        var_cdce92e2f99a113d = function_b1cbf0185df8c1a8(personality, difficulty, "archetype_" + tolower(var_2637bff642ea1c8d.archetype));
                        if (!isdefined(level.var_cebc8cc0640fe57.var_e1f5513362a6c2aa[var_cdce92e2f99a113d])) {
                            level.var_cebc8cc0640fe57.var_e1f5513362a6c2aa[var_cdce92e2f99a113d] = [];
                        }
                        var_b9fb2de33b94c967 = level.var_cebc8cc0640fe57.var_e1f5513362a6c2aa[var_cdce92e2f99a113d].size;
                        level.var_cebc8cc0640fe57.var_e1f5513362a6c2aa[var_cdce92e2f99a113d][var_b9fb2de33b94c967] = var_4ce3ef82d7b573e.loadout;
                    }
                }
            }
        }
    }
}

// Namespace namespace_9e577779991b200c/namespace_8be37ac443f7f654
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x87f
// Size: 0x2d
function private function_b1cbf0185df8c1a8(personality, difficulty, archetype) {
    return personality + "_" + difficulty + "_" + archetype;
}

// Namespace namespace_9e577779991b200c/namespace_8be37ac443f7f654
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b4
// Size: 0x3cc
function function_70d701f63acab018() {
    defaultLoadout = spawnstruct();
    defaultLoadout.archetype = "assault";
    defaultLoadout.primaryweapon = spawnstruct();
    defaultLoadout.primaryweapon.weapon = "iw9_sm_alpha57";
    defaultLoadout.primaryweapon.attachment1 = "iw9_minireddot03_tall_p01";
    defaultLoadout.primaryweapon.attachment2 = "grip_vert01";
    defaultLoadout.primaryweapon.attachment3 = "barsil_sm_p01";
    defaultLoadout.primaryweapon.attachment4 = "grip_angled01";
    defaultLoadout.primaryweapon.attachment5 = "pgrip_ske_p01";
    defaultLoadout.primaryweapon.attachment6 = "laserbox_ads02";
    defaultLoadout.primaryweapon.camo = "none";
    defaultLoadout.primaryweapon.reticle = "none";
    defaultLoadout.secondaryweapon = spawnstruct();
    defaultLoadout.secondaryweapon.weapon = "iw9_pi_golf17";
    defaultLoadout.secondaryweapon.attachment1 = "bar_pi_heavy_p24";
    defaultLoadout.secondaryweapon.attachment2 = "mag_pi_large_p24";
    defaultLoadout.secondaryweapon.attachment3 = "stockno_pi_p24";
    defaultLoadout.secondaryweapon.attachment4 = "pgrip_aim_p24";
    defaultLoadout.secondaryweapon.attachment5 = "none";
    defaultLoadout.secondaryweapon.camo = "none";
    defaultLoadout.secondaryweapon.reticle = "none";
    defaultLoadout.equipment = spawnstruct();
    defaultLoadout.equipment.primary = "equip_throwing_knife";
    defaultLoadout.equipment.secondary = "equip_shockstick";
    defaultLoadout.var_ad6972268c86a2be = spawnstruct();
    defaultLoadout.var_ad6972268c86a2be.primary = 0;
    defaultLoadout.var_ad6972268c86a2be.secondary = 0;
    defaultLoadout.perks = spawnstruct();
    defaultLoadout.perks.perk1 = "specialty_warhead";
    defaultLoadout.perks.perk2 = "specialty_huntmaster";
    defaultLoadout.perks.perk3 = "specialty_covert_ops";
    defaultLoadout.extraperks = spawnstruct();
    defaultLoadout.extraperks.perk1 = "specialty_guerrilla";
    defaultLoadout.extraperks.perk2 = "specialty_null";
    defaultLoadout.extraperks.perk3 = "specialty_null";
    defaultLoadout.gesture = "iw8_ges_plyr_gesture000";
    defaultLoadout.execution = "neck_stab";
    defaultLoadout.var_7e397f4ce66bffd0 = "none";
    defaultLoadout.var_7e39824ce66c0669 = "none";
    defaultLoadout.role = "role_hunter";
    defaultLoadout.overkill = 0;
    defaultLoadout.specialist = 1;
    return defaultLoadout;
}

// Namespace namespace_9e577779991b200c/namespace_8be37ac443f7f654
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc88
// Size: 0x55
function function_ebe5d810fc2c7196(var_9d601a34d1111b04) {
    /#
        assertex(istrue(level.var_cebc8cc0640fe57.initialized), "bot_loadout_assign_loadout_by_name: Bot loadouts have not been initialized.");
    #/
    if (isdefined(level.var_cebc8cc0640fe57.loadouts[var_9d601a34d1111b04])) {
        self.var_b2f042bf9991295d = var_9d601a34d1111b04;
        return 1;
    }
    return 0;
}

// Namespace namespace_9e577779991b200c/namespace_8be37ac443f7f654
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce5
// Size: 0x9a
function function_4f1b939bbc96291b(personality, difficulty, archetype) {
    /#
        assertex(istrue(level.var_cebc8cc0640fe57.initialized), "bot_loadout_assign_loadout_by_index: Bot loadouts have not been initialized.");
    #/
    var_76cd494d92ac8074 = function_b1cbf0185df8c1a8(personality, difficulty, archetype);
    if (isdefined(level.var_cebc8cc0640fe57.var_e1f5513362a6c2aa[var_76cd494d92ac8074])) {
        var_b2f042bf9991295d = namespace_3c37cb17ade254d::random(level.var_cebc8cc0640fe57.var_e1f5513362a6c2aa[var_76cd494d92ac8074]);
        return function_ebe5d810fc2c7196(var_b2f042bf9991295d);
    }
    return 0;
}

// Namespace namespace_9e577779991b200c/namespace_8be37ac443f7f654
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd87
// Size: 0x4d
function function_a693c24def6fb1ed() {
    if (!isdefined(self.pers["gamemodeLoadout"])) {
        if (istrue(level.var_cebc8cc0640fe57.initialized)) {
            self.classcallback = &function_b606843c205d2dfc;
            return 1;
        }
        /#
            assertmsg("bot_loadout_setup_assignment_callback: Bot loadouts have not been initialized.");
        #/
    }
    return 0;
}

// Namespace namespace_9e577779991b200c/namespace_8be37ac443f7f654
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xddc
// Size: 0xc2
function function_b606843c205d2dfc() {
    /#
        assertex(istrue(level.var_cebc8cc0640fe57.initialized), "bot_loadout_get_assigned_loadout: Bot loadouts have not been initialized.");
    #/
    if (!isdefined(self.var_b2f042bf9991295d)) {
        personality = self botgetpersonality();
        difficulty = self botgetdifficulty();
        var_fae37abacd7bf535 = function_4f1b939bbc96291b(personality, difficulty, "archetype_assault");
        /#
            assertex(var_fae37abacd7bf535, "bot_loadout_get_assigned_loadout: Failed to assign random loadout in set");
        #/
    }
    return ter_op(isdefined(level.var_cebc8cc0640fe57.loadouts[self.var_b2f042bf9991295d]), level.var_cebc8cc0640fe57.loadouts[self.var_b2f042bf9991295d], function_70d701f63acab018());
}

