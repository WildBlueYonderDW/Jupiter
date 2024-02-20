// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;
#using scripts\asm\asm.gsc;
#using script_2669878cf5a1b6bc;
#using script_64316dc775e91122;

#namespace namespace_96c4059aa2eabfb8;

// Namespace namespace_96c4059aa2eabfb8/namespace_a05299df599aac8f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b7
// Size: 0x4c2
function function_5108bb8dbe090131() {
    var_24a27db3db646d0f = level.var_1a2b600a06ec21f4.var_c38f402fed776720;
    if (!isdefined(var_24a27db3db646d0f)) {
        /#
            assertmsg("no weapon meta data list set for mode");
        #/
        return;
    }
    s_bundle = getscriptbundle("weaponmetadata:" + var_24a27db3db646d0f);
    level.var_96c4059aa2eabfb8 = [];
    level.var_96c4059aa2eabfb8["rarity_settings"] = spawnstruct();
    level.var_96c4059aa2eabfb8["pap_settings"] = spawnstruct();
    level.var_96c4059aa2eabfb8["magicbox_settings"] = spawnstruct();
    level.var_96c4059aa2eabfb8["wallbuy_settings"] = spawnstruct();
    level.var_96c4059aa2eabfb8["rarity_settings"].var_64962e0b6ed91567 = s_bundle.var_64962e0b6ed91567;
    level.var_96c4059aa2eabfb8["rarity_settings"].var_3fc24ec0bc2de11d = s_bundle.var_3fc24ec0bc2de11d;
    level.var_96c4059aa2eabfb8["rarity_settings"].var_52dff081b694390 = s_bundle.var_52dff081b694390;
    level.var_96c4059aa2eabfb8["rarity_settings"].var_2f4f5451344c144a = s_bundle.var_2f4f5451344c144a;
    level.var_96c4059aa2eabfb8["rarity_settings"].var_827b0c41035f0386 = s_bundle.var_827b0c41035f0386;
    level.var_96c4059aa2eabfb8["rarity_settings"].var_827b0c41035f0386 = s_bundle.var_827b0c41035f0386;
    level.var_96c4059aa2eabfb8["pap_settings"].var_e007ac5715f424ab = s_bundle.var_e007ac5715f424ab;
    level.var_96c4059aa2eabfb8["pap_settings"].var_ac1ba74bafe62262 = s_bundle.var_ac1ba74bafe62262;
    level.var_96c4059aa2eabfb8["pap_settings"].var_a887a8da61532b15 = s_bundle.var_a887a8da61532b15;
    level.var_96c4059aa2eabfb8["magicbox_settings"].var_9a8c86f79a583c89 = s_bundle.var_9230e85c0b586bc1;
    level.var_96c4059aa2eabfb8["magicbox_settings"].var_c20d40efaeea2f37 = s_bundle.var_92e3f80b8009f89f;
    level.var_96c4059aa2eabfb8["magicbox_settings"].var_b47fbd87c991c558 = s_bundle.var_3b8ef64a96947290;
    level.var_96c4059aa2eabfb8["wallbuy_settings"].var_2e57b9b53a463b3b = s_bundle.var_2e57b9b53a463b3b;
    if (isdefined(s_bundle.var_13d48225bc483f59)) {
        var_2de54af70b9cbe75 = getscriptbundle("currency:" + s_bundle.var_13d48225bc483f59);
        level.var_96c4059aa2eabfb8["wallbuy_settings"].var_13d48225bc483f59 = var_2de54af70b9cbe75.var_54d8fe06789b6851;
    }
    foreach (s_weapon in s_bundle.weaponslist) {
        /#
            assertex(isdefined(s_weapon.weapon), "Make sure there is a weapon defined in " + var_24a27db3db646d0f);
        #/
        weapon = makeweapon(s_weapon.weapon);
        str_weapon_name = weapon.var_9d7facbe889e667c;
        if (!isdefined(str_weapon_name) || str_weapon_name == "" || str_weapon_name == %"none") {
            str_weapon_name = s_weapon.weapon;
        }
        level.var_96c4059aa2eabfb8[str_weapon_name] = s_weapon;
    }
    level.var_7843c346baff928f["none"] = 0;
    level.var_7843c346baff928f["fire"] = 1;
    level.var_7843c346baff928f["cold"] = 2;
    level.var_7843c346baff928f["toxic"] = 3;
    level.var_7843c346baff928f["electrical"] = 4;
    level.var_7843c346baff928f["dark"] = 5;
    level.var_7843c346baff928f["light"] = 6;
    level.var_294d0b1503a8ccb9["fire"] = "hitelementfire";
    level.var_294d0b1503a8ccb9["cold"] = "hitelementcold";
    level.var_294d0b1503a8ccb9["toxic"] = "hitelementtoxic";
    level.var_294d0b1503a8ccb9["electrical"] = "hitelementelectrical";
    level.var_294d0b1503a8ccb9["dark"] = "hitelementfire";
    level.var_294d0b1503a8ccb9["light"] = "hitelementfire";
    level.var_fa6563c6f00a1ef1 = &function_4c8abc7b4eff6212;
}

// Namespace namespace_96c4059aa2eabfb8/namespace_a05299df599aac8f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x680
// Size: 0x133
function function_e52c71c96d93174b(n_level) {
    currentweapon = self getcurrentweapon();
    camo = getweaponcamoname(currentweapon);
    reticle = getweaponreticlename(currentweapon);
    variantid = getweaponvariantindex(currentweapon);
    w_take = currentweapon;
    stickers = [0:currentweapon.stickerslot0, 1:currentweapon.stickerslot1, 2:currentweapon.stickerslot2, 3:currentweapon.stickerslot3, 4:currentweapon.var_b39ac546cc8621f8];
    var_dfaf5dd7fb4c5238 = currentweapon.attachments;
    var_261e95dabfb8d55f = currentweapon.attachmentvarindices;
    w_new = namespace_e0ee43ef2dddadaa::buildweapon(currentweapon.basename, var_dfaf5dd7fb4c5238, camo, reticle, variantid, var_261e95dabfb8d55f, undefined, stickers);
    self takeweapon(w_take);
    self giveweapon(w_new);
    self switchtoweapon(w_new);
    self givemaxammo(w_new);
    namespace_a4ff02beedc1bce8::function_2756cd1449650568(currentweapon, n_level);
}

// Namespace namespace_96c4059aa2eabfb8/namespace_a05299df599aac8f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ba
// Size: 0x4e
function function_4c8abc7b4eff6212(weapon) {
    var_88260bb1ed608124 = weapon.var_9d7facbe889e667c;
    if (isdefined(level.var_96c4059aa2eabfb8[var_88260bb1ed608124])) {
        if (istrue(level.var_96c4059aa2eabfb8[var_88260bb1ed608124].var_2ae3eb7748601877)) {
            return 1;
        }
    }
    return 0;
}

