// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\aitypes\bt_util.gsc;

#namespace assets;

// Namespace assets/namespace_8bef0f00d6d36a69
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5dd
// Size: 0x3
function main() {
    
}

// Namespace assets/namespace_8bef0f00d6d36a69
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e7
// Size: 0x154
function soldier() {
    if (!function_fca40a005d4059d6("soldier")) {
        level._effect["npc_flashlight"] = loadfx("vfx/iw9/core/flashlight/vfx_flashlight_npc_nolight.vfx");
        level._effect["npc_flashlight_flare"] = loadfx("vfx/iw9/core/flashlight/vfx_flashlight_npc.vfx");
        precachemodel("attachment_wm_tac_light_held");
        precachemodel("offhand_wm_smartphone_on");
        precachemodel("p7_bottle_plastic_16oz_water");
        precachemodel("cp_disco_folding_chair_lod0");
        precachemodel("weapon_wm_pi_mike1911_phys");
        precachemodel("misc_cigarette_01_centered");
        precachemodel("misc_wm_blackbox_laptop");
        level.g_effect["cellphone_glow"] = loadfx("vfx/iw7/levels/piccadilly/vfx_pic_phone_light_01.vfx");
        level.g_effect["cigarette_lit"] = loadfx("vfx/iw8/char/cigarette/vfx_cigarette_lit_hand_01.vfx");
        level.g_effect["cigarette_lit_toss"] = loadfx("vfx/iw8/char/cigarette/vfx_cigarette_lit_hand_01_toss.vfx");
        level.g_effect["cigarette_unlit"] = loadfx("vfx/iw8/char/cigarette/vfx_cigarette_unlit_hand_01.vfx");
        level.g_effect["lighter_glow"] = loadfx("vfx/iw8/char/cigarette/vfx_cigarette_lighter_glow_hand_01.vfx");
        level.g_effect["cigarette_smoke"] = loadfx("vfx/iw8/char/cigarette/vfx_cigarette_smk_blow_01.vfx");
        level._effect["crawling_death_blood_smear"] = loadfx("vfx/core/impacts/blood_smear_decal.vfx");
        function_89bd0a0f1b23fe8d("soldier");
    }
}

// Namespace assets/namespace_8bef0f00d6d36a69
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x742
// Size: 0x3
function civilian() {
    
}

// Namespace assets/namespace_8bef0f00d6d36a69
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x74c
// Size: 0x3
function dog() {
    
}

// Namespace assets/namespace_8bef0f00d6d36a69
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x756
// Size: 0x82
function juggernaut() {
    if (!function_fca40a005d4059d6("juggernaut")) {
        if (!isdefined(level.g_effect)) {
            level.g_effect = [];
        }
        level._effect["npc_flashlight"] = loadfx("vfx/iw9/core/flashlight/vfx_flashlight_npc_nolight.vfx");
        level._effect["npc_flashlight_flare"] = loadfx("vfx/iw9/core/flashlight/vfx_flashlight_npc.vfx");
        level._effect["crawling_death_blood_smear"] = loadfx("vfx/core/impacts/blood_smear_decal.vfx");
        function_89bd0a0f1b23fe8d("juggernaut");
    }
}

// Namespace assets/namespace_8bef0f00d6d36a69
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7df
// Size: 0x9b
function suicidebomber() {
    if (!function_fca40a005d4059d6("suicidebomber")) {
        precachemodel("offhand_wm_clacker");
        if (isdismembermentenabled()) {
            level.g_effect["vfx_suicide_bomber_gib_explode"] = loadfx("vfx/iw8/weap/_explo/suicide/vfx_explo_suicide_bomb.vfx");
        } else {
            level.g_effect["vfx_suicide_bomber_gib_explode"] = loadfx("vfx/core/blank.vfx");
        }
        level.g_effect["vfx_suicide_bomber_no_dismember"] = loadfx("vfx/iw8/weap/_explo/vfx_explo_frag_gren.vfx");
        level._effect["suicide_bomber_clicker_flash"] = loadfx("vfx/_requests/piccadilly/vfx_suicide_bomber_clicker_flash.vfx");
        function_89bd0a0f1b23fe8d("suicidebomber");
    }
}

// Namespace assets/namespace_8bef0f00d6d36a69
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x881
// Size: 0x1d
function zombie() {
    if (!function_fca40a005d4059d6("zombie")) {
        function_89bd0a0f1b23fe8d("zombie");
    }
}

// Namespace assets/namespace_8bef0f00d6d36a69
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a5
// Size: 0x74
function function_89bd0a0f1b23fe8d(type) {
    if (!isdefined(level.var_7d310f9c5a785dcb)) {
        level.var_7d310f9c5a785dcb = [];
    }
    switch (type) {
    case #"hash_1403dfb5d1265ddc":
    case #"hash_44aaeb0edd152195":
    case #"hash_4ad475e6e15635bd":
        function_7d79a3fa97a020cc();
        break;
    default:
        break;
    }
    level.var_7d310f9c5a785dcb[type] = 1;
}

// Namespace assets/namespace_8bef0f00d6d36a69
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x920
// Size: 0x26
function function_fca40a005d4059d6(type) {
    return isdefined(level.var_7d310f9c5a785dcb) && istrue(level.var_7d310f9c5a785dcb[type]);
}

// Namespace assets/namespace_8bef0f00d6d36a69
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x94e
// Size: 0xcc
function function_7d79a3fa97a020cc() {
    if (isdefined(level.g_effect) && isdefined(level.g_effect["human_gib_fullbody"])) {
        return;
    }
    if (isdismembermentenabled()) {
        level.g_effect["human_gib_fullbody"] = loadfx("vfx/iw8/weap/_explo/suicide/vfx_gib_dir1.vfx");
        level.g_effect["human_gib_head"] = loadfx("vfx/iw8/weap/_impact/flesh/vfx_imp_flesh_fatal_head_med_dismb.vfx");
        level.g_effect["human_gib_head_cap"] = loadfx("vfx/iw8/weap/_impact/flesh/vfx_dismemberment_head_cap.vfx");
    } else {
        level.g_effect["human_gib_fullbody"] = loadfx("vfx/core/blank.vfx");
        level.g_effect["human_gib_head"] = loadfx("vfx/core/blank.vfx");
        level.g_effect["human_gib_head_cap"] = loadfx("vfx/core/blank.vfx");
    }
}

