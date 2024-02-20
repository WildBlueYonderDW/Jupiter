// mwiii decomp prototype
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_2636152c566d6c64;
#using script_48814951e916af89;
#using script_371b4c2ab5861e62;
#using scripts\mp\juggernaut.gsc;
#using script_24fbedba9a7a1ef4;

#namespace namespace_66419bf0e1470e9d;

// Namespace namespace_66419bf0e1470e9d/namespace_817a152f5a5554f8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x233
// Size: 0x8e
function function_4c60c607a6e7b9ae() {
    var_aed74300daf62896 = spawnstruct();
    var_aed74300daf62896.var_b586c70b173dd02b = [];
    var_aed74300daf62896.name = "mi8jugg";
    var_aed74300daf62896.uiname = "MP_DMZ_MISSIONS/DMZ_BOSS_JUGG_NAME";
    var_aed74300daf62896.var_ec2ec5f083df61cd = &function_d05835744ff53415;
    var_aed74300daf62896.spawnfunc = &function_7f6818be5068dd4e;
    var_aed74300daf62896.var_e68429b39c75b6ee = &function_7f6818be5068dd4e;
    var_aed74300daf62896.var_4ea49a8926593523 = &function_b97f2c6555713007;
    namespace_cf2b0816e2ab0a06::function_613e13e7416bfaa5(var_aed74300daf62896);
}

// Namespace namespace_66419bf0e1470e9d/namespace_817a152f5a5554f8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c8
// Size: 0xaf
function function_d05835744ff53415(var_aed74300daf62896) {
    level.var_7d967b9b6bb9f893 = getdvarint(@"hash_6fed3b4aab176fe6", 2);
    level.var_e533ab5ac1ba434b = 0;
    level.var_1ab6cf2d7f3a688 = getdvarfloat(@"hash_1099eba3fc541217", 0);
    level.var_1ab6cf2d7f3a688 = level.var_1ab6cf2d7f3a688 * level.var_1ab6cf2d7f3a688;
    level.var_5463147f04a33d36 = getdvarfloat(@"hash_86e760e453e4b70b", 2500);
    level.var_a4123e1a53dea557 = getdvarint(@"hash_86c85cfc843c0b68", 1);
    level.var_d49c99ad85354bd6 = getdvarint(@"hash_a433661e4f79e427", 100);
}

// Namespace namespace_66419bf0e1470e9d/namespace_817a152f5a5554f8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37e
// Size: 0x2a9
function function_7f6818be5068dd4e(node, category) {
    if (!isdefined(category)) {
        category = "elites";
    }
    aitype = undefined;
    var_bdab149ba0058e5a = level.var_13819795c6ee9ff8;
    if (category == "gulag") {
        aitype = "enemy_mp_jugg_gulag";
        var_bdab149ba0058e5a = [0:"neckguard", 1:"backpack", 2:"shoulderpad_l", 3:"shoulderpad_r", 4:"qamis", 5:"thighpad_l", 6:"thighpad_r"];
    } else {
        aitype = namespace_bfef6903bca5845d::function_7f1a2e2ebe0c1693("jugg");
    }
    jugg = namespace_bfef6903bca5845d::ai_mp_requestSpawnAgent(aitype, node.origin, node.angles, "absolute", category, "jugg", undefined, undefined, undefined, node.poi, 1, 0, 0);
    weapon = undefined;
    namespace_14d36171baccf528::function_e43f4000cac35ba2(jugg, weapon);
    jugg namespace_14d36171baccf528::function_1c3709e864d4e8d5(1);
    juggcontext = spawnstruct();
    juggcontext.var_46ad94f231cd4ef3 = [];
    juggcontext.var_46ad94f231cd4ef3["head_health"] = 100;
    juggcontext.var_46ad94f231cd4ef3["damaged_helmet_health"] = 100;
    juggcontext.var_46ad94f231cd4ef3["torso_upper_health"] = 100;
    juggcontext.var_46ad94f231cd4ef3["torso_lower_health"] = 100;
    juggcontext.var_46ad94f231cd4ef3["right_upper_arm_health"] = 100;
    juggcontext.var_46ad94f231cd4ef3["right_lower_arm_health"] = 100;
    juggcontext.var_46ad94f231cd4ef3["left_upper_arm_health"] = 100;
    juggcontext.var_46ad94f231cd4ef3["left_lower_arm_health"] = 100;
    juggcontext.var_46ad94f231cd4ef3["right_leg_health"] = 100;
    juggcontext.var_46ad94f231cd4ef3["left_leg_health"] = 100;
    juggcontext.var_5f03cad2b199e1bc = &function_504b9ffb4562c0bc;
    juggcontext.lastpaintime = 0;
    juggcontext.paindamage = 0;
    juggcontext.var_1bea7c00eb868a40 = 6000;
    juggcontext.var_3d1bbef280ea37b4 = 20000;
    juggcontext.var_a35692b629483499 = 10;
    juggcontext.var_f8236448eb258010 = 0.1;
    juggcontext.lastdamagedtime = 0;
    juggcontext.var_a4dceeab66ec6a3c = 250;
    jugg.juggcontext = juggcontext;
    jugg namespace_68f1873625691c6::function_8e6b2de818370baa(var_bdab149ba0058e5a, "pristine");
    jugg.var_9329e0d3ce1d5ca8 = "mi8jugg";
    jugg namespace_cf2b0816e2ab0a06::function_720c3b7abf4baac8("mi8jugg");
    return jugg;
}

// Namespace namespace_66419bf0e1470e9d/namespace_817a152f5a5554f8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62f
// Size: 0x16
function function_b97f2c6555713007() {
    level endon("game_ended");
    namespace_cf2b0816e2ab0a06::function_c0d4fda4400b5a08("mi8jugg");
}

// Namespace namespace_66419bf0e1470e9d/namespace_817a152f5a5554f8
// Params d, eflags: 0x0
// Checksum 0x0, Offset: 0x64c
// Size: 0x115
function function_9188f360f73c894a(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon) {
    if (level.var_a4123e1a53dea557 == 1) {
        overflow = idamage - level.var_d49c99ad85354bd6;
        if (overflow > 0) {
            idamage = level.var_d49c99ad85354bd6 + sqrt(overflow);
        }
    } else {
        idamage = min(idamage, level.var_d49c99ad85354bd6);
    }
    remaininghealth = self.health - idamage;
    if (remaininghealth <= 0) {
        self notify("mi8jugg_fatal_damage");
    }
    namespace_68f1873625691c6::function_4217f11ffb352425(idamage, shitloc, smeansofdeath, eattacker);
    namespace_daa149ca485fd50a::function_dffac413ed66bcd0(einflictor, eattacker, int(idamage), idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon);
}

// Namespace namespace_66419bf0e1470e9d/namespace_817a152f5a5554f8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x768
// Size: 0xd8
function function_504b9ffb4562c0bc(part, damage) {
    if (isdefined(part) && part == "head_health" && !isdefined(self.juggcontext.var_46ad94f231cd4ef3[part])) {
        if (isdefined(self.juggcontext.var_46ad94f231cd4ef3["damaged_helmet_health"])) {
            self.juggcontext.var_46ad94f231cd4ef3["damaged_helmet_health"] = self.juggcontext.var_46ad94f231cd4ef3["damaged_helmet_health"] - damage;
            if (self.juggcontext.var_46ad94f231cd4ef3["damaged_helmet_health"] <= 0) {
                self.juggcontext.var_46ad94f231cd4ef3["damaged_helmet_health"] = undefined;
                namespace_68f1873625691c6::function_8e6b2de818370baa("head_health", "destroyed");
            }
        }
    }
}

