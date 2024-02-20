// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_38eb8f4be20d54f4;

#namespace damagefeedback;

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c7
// Size: 0x100
function function_6b5e33c2f005f4a6() {
    level.hitmarkerpriorities = [];
    level.hitmarkerpriorities["standard"] = 40;
    level.hitmarkerpriorities["standardspread"] = 50;
    level.hitmarkerpriorities["standardspreadarmor"] = 70;
    level.hitmarkerpriorities["standardspreadarmorbreak"] = 71;
    level.hitmarkerpriorities["standardarmor"] = 60;
    level.hitmarkerpriorities["standardarmorbreak"] = 61;
    level.hitmarkerpriorities["threeplatearmorbreak"] = 1;
    level.hitmarkerpriorities["temperedarmorbreak"] = 1;
    level.hitmarkerpriorities["hitequip"] = 30;
    level.hitmarkerpriorities["capturebotcapture"] = 1;
    function_25f98f1b652f57ec();
    /#
        level thread function_a76226d272200c64();
    #/
    registersharedfunc("hitmarker", "updateHitMarker_SharedFunc", &updatehitmarker);
    registersharedfunc("hitmarker", "updateDamageFeedback_SharedFunc", &updatedamagefeedback);
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ce
// Size: 0x21
function function_7bc7c3983cef0956(marker, priority) {
    level.hitmarkerpriorities[marker] = priority;
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f6
// Size: 0x37e
function updatedamagefeedback(icontype, var_d7198ceb7d51db5b, headshot, var_b98146816886d3c4, var_62cf84636d4cef2c, var_c4f1516c772b1c2d, targetentnum, var_f7ea2887b1e3535b, var_203066c6662e1f2d) {
    if (!isplayer(self)) {
        return;
    }
    if (!isdefined(var_b98146816886d3c4)) {
        var_b98146816886d3c4 = "standard";
    }
    if (!isdefined(var_62cf84636d4cef2c)) {
        var_62cf84636d4cef2c = 0;
    }
    if ((!isdefined(level.damagefeedbacknosound) || !level.damagefeedbacknosound) && !var_62cf84636d4cef2c) {
        if (!isdefined(self.hitmarkeraudioevents)) {
            self.hitmarkeraudioevents = 0;
        }
        self.hitmarkeraudioevents++;
        self setclientomnvar("ui_hitmarker_audio_events", self.hitmarkeraudioevents % 16);
    }
    switch (icontype) {
    case #"hash_db653a4972b3c13b":
        break;
    case #"hash_c1715405ce8d27ea":
        jumpiffalse(issharedfuncdefined("supers", "hasAPRRounds")) LOC_0000011a;
        jumpiffalse(self [[ getsharedfunc("supers", "hasAPRRounds") ]]()) LOC_0000011a;
        var_7a8a48132995d0fc = "hitsuppression";
        updatehitmarker(var_b98146816886d3c4, var_d7198ceb7d51db5b, headshot, var_c4f1516c772b1c2d, var_7a8a48132995d0fc, targetentnum, undefined, var_203066c6662e1f2d);
        break;
    case #"hash_1c6e430811861ac0":
    case #"hash_1d1421f4263e7b65":
    case #"hash_21506e0eab793b6d":
    case #"hash_251e2c7ad46ab2a1":
    case #"hash_286b270eeb92acab":
    case #"hash_29d29edc3c4bd21f":
    case #"hash_2f87b65a1756fbc1":
    case #"hash_2fc100f2b74f0620":
    case #"hash_302bdfe2981fa111":
    case #"hash_350f19f266bbb791":
    case #"hash_3b8a7e998825e7c0":
    case #"hash_3c687341f7275bb2":
    case #"hash_3dfff68d08667b7e":
    case #"hash_3f1bede7caeea324":
    case #"hash_425f5f52214e9881":
    case #"hash_4b4056ee5e5c3555":
    case #"hash_4bdab969a8904cac":
    case #"hash_5b770c686e85a82a":
    case #"hash_5c035610dbc2c193":
    case #"hash_6145e54d4160575d":
    case #"hash_635a3ba72a0e2577":
    case #"hash_645b9186bb9ba5b1":
    case #"hash_6d93a8d02d1b75e1":
    case #"hash_6eb75fd530d36be9":
    case #"hash_7bee0512ecd80819":
    case #"hash_7df4cd93173dca7c":
    case #"hash_93712eceeb1ff510":
    case #"hash_94d5b36d557e08cd":
    case #"hash_9bddb43d21e0ec36":
    case #"hash_a1c8ae5eec4e0bc2":
    case #"hash_a38fa9efabd2c0a4":
    case #"hash_a54ca25c946c6e33":
    case #"hash_b3b5fb9c8c5f3e09":
    case #"hash_bd3b02ce8ef8b988":
    case #"hash_18392ddb8b61cb4":
    case #"hash_c58cc85ba9fb86d4":
    case #"hash_cbc78f7c7ad72ad1":
    case #"hash_d10b855589d3c416":
    case #"hash_d5081dfa38c24b32":
    case #"hash_d5fcf5b86ed9ef29":
    case #"hash_567a00990919afc":
    case #"hash_dc64d86a5dcc42d3":
    case #"hash_e0acb4f805778e36":
    case #"hash_ff1e12935aa62b10":
    LOC_0000011a:
        updatehitmarker(var_b98146816886d3c4, var_d7198ceb7d51db5b, headshot, var_c4f1516c772b1c2d, icontype, targetentnum, var_f7ea2887b1e3535b, var_203066c6662e1f2d);
        break;
    default:
        updatehitmarker(var_b98146816886d3c4, var_d7198ceb7d51db5b, headshot, var_c4f1516c772b1c2d, undefined, targetentnum, var_f7ea2887b1e3535b, var_203066c6662e1f2d);
        break;
    }
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc7b
// Size: 0x5c8
function updatehitmarker(var_e0ea2c8df06f13eb, var_d7198ceb7d51db5b, headshot, var_c4f1516c772b1c2d, icontype, targetentnum, var_f7ea2887b1e3535b, var_203066c6662e1f2d) {
    if (function_fa167eb35ec0eeea()) {
        return;
    }
    if (!isdefined(var_e0ea2c8df06f13eb)) {
        return;
    }
    if (!isdefined(var_d7198ceb7d51db5b)) {
        var_d7198ceb7d51db5b = 0;
    }
    if (!isdefined(headshot)) {
        headshot = 0;
    }
    if (!isdefined(var_c4f1516c772b1c2d)) {
        var_c4f1516c772b1c2d = 0;
    }
    if (!isdefined(targetentnum)) {
        targetentnum = -1;
    }
    if (!isdefined(var_f7ea2887b1e3535b)) {
        var_f7ea2887b1e3535b = 0;
    }
    if (getdvarint(@"hash_1db87c3b655b5645", 0) == 1) {
        var_6ef23ce7743299e = spawnstruct();
        var_6ef23ce7743299e.var_e0ea2c8df06f13eb = var_e0ea2c8df06f13eb;
        var_6ef23ce7743299e.var_d7198ceb7d51db5b = var_d7198ceb7d51db5b;
        var_6ef23ce7743299e.headshot = headshot;
        var_6ef23ce7743299e.var_c4f1516c772b1c2d = var_c4f1516c772b1c2d;
        var_6ef23ce7743299e.icontype = icontype;
        var_6ef23ce7743299e.targetentnum = targetentnum;
        var_6ef23ce7743299e.timestamp = gettime();
        if (!isdefined(self.var_2e4039d7593ebf54)) {
            self.var_2e4039d7593ebf54 = [];
        }
        self.var_2e4039d7593ebf54[self.var_2e4039d7593ebf54.size] = var_6ef23ce7743299e;
        thread function_6a07ef2910dea0e5();
    } else if (getdvarint(@"hash_2909726ff0e12a7d", 0) == 1 && isdefined(level.var_1a2b600a06ec21f4) && istrue(level.var_1a2b600a06ec21f4.var_e76a5e57e1ff6b9b)) {
        var_490dc8cea6acfcdd = 0;
        if (!isint(var_e0ea2c8df06f13eb)) {
            if (var_e0ea2c8df06f13eb == "hitequip" || isdefined(icontype) && icontype == "hitequip") {
                var_e0ea2c8df06f13eb = 3;
            } else if (var_e0ea2c8df06f13eb == "standard") {
                var_e0ea2c8df06f13eb = 1;
            }
        }
        switch (var_e0ea2c8df06f13eb) {
        case 1:
            var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 0;
            if (var_d7198ceb7d51db5b) {
                var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 1;
            }
            if (isdefined(var_203066c6662e1f2d) && istrue(var_203066c6662e1f2d.isfriendly)) {
                var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 2;
            }
            if (headshot) {
                var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 3;
            }
            if (isdefined(icontype)) {
                switch (icontype) {
                case #"hash_286b270eeb92acab":
                case #"hash_2f87b65a1756fbc1":
                case #"hash_c58cc85ba9fb86d4":
                case #"hash_dc64d86a5dcc42d3":
                    var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 4;
                    break;
                case #"hash_3dfff68d08667b7e":
                case #"hash_635a3ba72a0e2577":
                case #"hash_9bddb43d21e0ec36":
                case #"hash_a38fa9efabd2c0a4":
                case #"hash_a54ca25c946c6e33":
                    var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 5;
                    break;
                }
            }
            if (isdefined(var_203066c6662e1f2d) && istrue(var_203066c6662e1f2d.var_bce5d209227a00cb)) {
                var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 6;
            }
            function_697d593ebcb428dd("damage_feedback_weapon", var_490dc8cea6acfcdd);
            break;
        case 2:
            var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 0;
            if (var_d7198ceb7d51db5b) {
                var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 1;
            }
            if (isdefined(var_203066c6662e1f2d) && istrue(var_203066c6662e1f2d.isfriendly)) {
                var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 2;
            }
            function_697d593ebcb428dd("damage_feedback_equip", var_490dc8cea6acfcdd);
            break;
        case 3:
            var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 0;
            if (var_d7198ceb7d51db5b) {
                var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 1;
            }
            function_697d593ebcb428dd("damage_feedback_hardobject", var_490dc8cea6acfcdd);
            break;
        }
        if (isdefined(icontype) && !istrue(var_d7198ceb7d51db5b)) {
            self setclientomnvar("damage_feedback_icon", icontype);
            self setclientomnvar("damage_feedback_icon_notify", gettime());
        }
        if (isdefined(icontype) && icontype == "hitheadhunter") {
            self setclientomnvar("damage_feedback_icon", icontype);
            self setclientomnvar("damage_feedback_icon_notify", gettime());
        }
        if (isdefined(icontype) && icontype == "hitveharmorbreak") {
            self setclientomnvar("damage_feedback_icon", icontype);
            self setclientomnvar("damage_feedback_icon_notify", gettime());
        }
    } else {
        priority = gethitmarkerpriority(var_e0ea2c8df06f13eb);
        if (isdefined(self.lasthitmarkertime) && self.lasthitmarkertime == gettime() && priority <= self.lasthitmarkerpriority && !var_d7198ceb7d51db5b) {
            return;
        }
        self.lasthitmarkertime = gettime();
        self.lasthitmarkerpriority = priority;
        if (isdefined(icontype) && !istrue(var_d7198ceb7d51db5b)) {
            self setclientomnvar("damage_feedback_icon", icontype);
            self setclientomnvar("damage_feedback_icon_notify", gettime());
        }
        if (isdefined(icontype) && icontype == "hitheadhunter") {
            self setclientomnvar("damage_feedback_icon", icontype);
            self setclientomnvar("damage_feedback_icon_notify", gettime());
        }
        if (isdefined(icontype) && icontype == "hitveharmorbreak") {
            self setclientomnvar("damage_feedback_icon", icontype);
            self setclientomnvar("damage_feedback_icon_notify", gettime());
        }
        if (!isdefined(icontype) || icontype != "hitnobulletdamage" && icontype != "capturebotcapture") {
            self setclientomnvar("damage_feedback", var_e0ea2c8df06f13eb);
            self setclientomnvar("damage_feedback_notify", gettime());
        }
        if (var_d7198ceb7d51db5b) {
            self setclientomnvar("damage_feedback_kill", 1);
        } else {
            self setclientomnvar("damage_feedback_kill", 0);
        }
        if (headshot) {
            self setclientomnvar("damage_feedback_headshot", 1);
        } else {
            self setclientomnvar("damage_feedback_headshot", 0);
        }
        if (var_c4f1516c772b1c2d) {
            self setclientomnvar("damage_feedback_nonplayer", 1);
        } else {
            self setclientomnvar("damage_feedback_nonplayer", 0);
        }
        self setclientomnvar("damage_feedback_armor", int(min(var_f7ea2887b1e3535b, 3)));
        if (targetentnum > -1) {
            self setclientomnvar("damage_feedback_entity", targetentnum);
            self setclientomnvar("damage_feedback_entity_notify", gettime());
        }
    }
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x124a
// Size: 0x28
function gethitmarkerpriority(var_b98146816886d3c4) {
    if (!isdefined(level.hitmarkerpriorities[var_b98146816886d3c4])) {
        return 0;
    }
    return level.hitmarkerpriorities[var_b98146816886d3c4];
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x127a
// Size: 0x309
function hudicontype(var_cdcedb142f61b43e) {
    nosound = 0;
    if (isdefined(level.damagefeedbacknosound) && level.damagefeedbacknosound) {
        nosound = 1;
    }
    if (!isplayer(self)) {
        return;
    }
    switch (var_cdcedb142f61b43e) {
    case #"hash_271ec2370f46ea":
    case #"hash_b8d1ac6e6b8e3230":
    case #"hash_7a494a6441a8df6":
    case #"hash_5c57b61aa79410db":
    case #"hash_18144547f6b061d8":
    case #"hash_d6a7d182fd397b0a":
        if (!nosound) {
            self playlocalsound("scavenger_pack_pickup");
        }
        self setclientomnvar("damage_feedback_other", var_cdcedb142f61b43e);
        break;
    case #"hash_530ba8d82158ca97":
        if (!nosound) {
            self playlocalsound("wpn_combat_axe_pickup_plr");
        }
        self setclientomnvar("damage_feedback_other", var_cdcedb142f61b43e);
        break;
    case #"hash_2610981e9f5db54f":
    case #"hash_2ab98cab4066a74e":
    case #"hash_8747706404533493":
        if (!nosound) {
            self playlocalsound("weap_pickup_knife_plr");
        }
        self setclientomnvar("damage_feedback_other", var_cdcedb142f61b43e);
        break;
    case #"hash_1041aa27487b00f8":
        self setclientomnvar("damage_feedback_other", var_cdcedb142f61b43e);
        break;
    case #"hash_1d28d8c7a5e03548":
    case #"hash_23cdc38a2fa78bb4":
    case #"hash_23f2c68a2fc41281":
    case #"hash_11b2f521291b9664":
    case #"hash_36b7174a04de8799":
    case #"hash_5d11ac1131cddab1":
    case #"hash_7983828e72e83a3e":
    case #"hash_7da1870a0ffb921d":
    case #"hash_80c5f88142053bf4":
    case #"hash_85d7e1863dca54c4":
    case #"hash_66bc333667dfeb53":
    case #"hash_96dd9dc314bcbb3c":
    case #"hash_9d11909dc5bbaa26":
    case #"hash_9d57562863499a06":
    case #"hash_a0319e349a692b8f":
    case #"hash_a68c414683465b09":
    case #"hash_a8e4a914fb03a4d5":
    case #"hash_acd2c79dce3b9907":
    case #"hash_c9a436974fe60919":
    case #"hash_dae956a4a82da2d7":
    case #"hash_d4c33f35d7b04f87":
    case #"hash_d5db533de9b14785":
    case #"hash_d8f795eb14c75e6":
    case #"hash_fa1e80f6bd5b8e72":
    case #"hash_e7803d9decd089c2":
    case #"hash_e91729d4ef79ca26":
    case #"hash_ed1356899cfee3ed":
        self setclientomnvar("damage_feedback_other", var_cdcedb142f61b43e);
        break;
    case #"hash_cd8e1c59636518f2":
        self setclientomnvar("damage_feedback_other", var_cdcedb142f61b43e);
        break;
    case #"hash_cbe9eb1aab764cbc":
        self setclientomnvar("damage_feedback_other", var_cdcedb142f61b43e);
        break;
    case #"hash_2fa014aa1b7da22":
        self setclientomnvar("damage_feedback_other", var_cdcedb142f61b43e);
        break;
    case #"hash_e815145ef7ef1ae7":
        self setclientomnvar("damage_feedback_other", var_cdcedb142f61b43e);
        break;
    }
    thread function_7a129dca534be5f9();
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x158a
// Size: 0x2b
function function_7a129dca534be5f9() {
    self notify("hitIconReset");
    self endon("disconnect");
    self endon("hitIconReset");
    waitframe();
    self setclientomnvar("damage_feedback_other", "standard");
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15bc
// Size: 0x25
function function_fa167eb35ec0eeea() {
    /#
        if (getdvarint(@"hash_6735e9fcb3e821b9", 0)) {
            return 1;
        }
    #/
    return istrue(level.var_f4b090dbbd2b125b);
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15e9
// Size: 0x248
function function_6a07ef2910dea0e5() {
    self notify("hitmarkerStack_singleton");
    self endon("hitmarkerStack_singleton");
    while (isdefined(self.var_2e4039d7593ebf54) && self.var_2e4039d7593ebf54.size != 0) {
        waitframe();
        var_237ea2fb76bea663 = self.var_2e4039d7593ebf54[0];
        self.var_2e4039d7593ebf54[0] = undefined;
        self.var_2e4039d7593ebf54 = array_removeundefined(self.var_2e4039d7593ebf54);
        if (isdefined(var_237ea2fb76bea663.icontype) && !istrue(var_237ea2fb76bea663.var_d7198ceb7d51db5b)) {
            self setclientomnvar("damage_feedback_icon", var_237ea2fb76bea663.icontype);
            self setclientomnvar("damage_feedback_icon_notify", var_237ea2fb76bea663.timestamp);
        }
        if (isdefined(var_237ea2fb76bea663.icontype) && var_237ea2fb76bea663.icontype == "hitheadhunter") {
            self setclientomnvar("damage_feedback_icon", var_237ea2fb76bea663.icontype);
            self setclientomnvar("damage_feedback_icon_notify", var_237ea2fb76bea663.timestamp);
        }
        if (isdefined(var_237ea2fb76bea663.icontype) && var_237ea2fb76bea663.icontype == "hitveharmorbreak") {
            self setclientomnvar("damage_feedback_icon", var_237ea2fb76bea663.icontype);
            self setclientomnvar("damage_feedback_icon_notify", var_237ea2fb76bea663.timestamp);
        }
        self setclientomnvar("damage_feedback", var_237ea2fb76bea663.var_e0ea2c8df06f13eb);
        self setclientomnvar("damage_feedback_notify", var_237ea2fb76bea663.timestamp);
        if (var_237ea2fb76bea663.var_d7198ceb7d51db5b) {
            self setclientomnvar("damage_feedback_kill", 1);
        } else {
            self setclientomnvar("damage_feedback_kill", 0);
        }
        if (var_237ea2fb76bea663.headshot) {
            self setclientomnvar("damage_feedback_headshot", 1);
        } else {
            self setclientomnvar("damage_feedback_headshot", 0);
        }
        if (var_237ea2fb76bea663.var_c4f1516c772b1c2d) {
            self setclientomnvar("damage_feedback_nonplayer", 1);
        } else {
            self setclientomnvar("damage_feedback_nonplayer", 0);
        }
        if (var_237ea2fb76bea663.targetentnum > -1) {
            self setclientomnvar("damage_feedback_entity", var_237ea2fb76bea663.targetentnum);
            self setclientomnvar("damage_feedback_entity_notify", gettime());
        }
    }
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1838
// Size: 0x63
function function_697d593ebcb428dd(var_e9d476a3809cb3f1, flag) {
    self setclientomnvar(var_e9d476a3809cb3f1, flag);
    notifyname = var_e9d476a3809cb3f1 + "_notify";
    var_adbd34525f139fc9 = self getclientomnvar(notifyname);
    self setclientomnvar(notifyname, !var_adbd34525f139fc9);
    /#
        logstring("damage_feedback_headshot" + var_e9d476a3809cb3f1 + "<unknown string>" + flag);
    #/
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18a2
// Size: 0x69
function function_25f98f1b652f57ec() {
    setdvar(@"hash_2951db54014fba41", 6);
    setdvar(@"hash_94b34d23bf532a3f", 6);
    setdvar(@"hash_cfad6a44e0c5cf8f", 6);
    setdvar(@"hash_2974ed540176298f", 3);
    setdvar(@"hash_94903b23bf2cbaf1", 3);
    setdvar(@"hash_cf8a7844e09fa6a1", 3);
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1912
// Size: 0x29e
function function_a76226d272200c64() {
    /#
        if (getdvarint(@"hash_2909726ff0e12a7d", 0) == 1 && isdefined(level.var_1a2b600a06ec21f4) && istrue(level.var_1a2b600a06ec21f4.var_e76a5e57e1ff6b9b)) {
            namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>");
            namespace_b032b0cc17b10064::function_df648211d66cd3dd("<unknown string>", "<unknown string>");
            namespace_b032b0cc17b10064::function_df648211d66cd3dd("<unknown string>", "<unknown string>");
            namespace_b032b0cc17b10064::function_df648211d66cd3dd("<unknown string>", "<unknown string>");
            namespace_b032b0cc17b10064::function_df648211d66cd3dd("<unknown string>", "<unknown string>");
            namespace_b032b0cc17b10064::function_df648211d66cd3dd("<unknown string>", "<unknown string>");
            namespace_b032b0cc17b10064::function_df648211d66cd3dd("<unknown string>", "<unknown string>");
            namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_f4137b4aff2d357f);
            namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_244f7ed1bde7a922);
            namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_9b3b346bf41b42ec);
            namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_dedbab246909a68b);
            namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_e9943edf01fae246);
            namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_12f0988382364fc5);
            namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_aad4b8e06fba7712);
            namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_5ccbb72c64ed64b0);
            namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_a481845bd08b83ea);
            namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_3cef16eb6c7ab7f5);
            namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_4a73df03aaeb1f40);
            namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_4b5b7c47cb916820);
            namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_7d67bfa0977275ef);
            namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_5ba699d40ad475b5);
            namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_847c3a90c31506da);
            namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_ff8a5baefaf2044);
            namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_f1c42880c41252b3);
            namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_c98bce4a7d0771f5);
            namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_21d0791f2931f95);
            namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_a319100f1b453a35);
            namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_fc755361ba8bc81);
            namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_fb89825e361fc1f0);
            namespace_b032b0cc17b10064::function_fe953f000498048f();
        }
    #/
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bb7
// Size: 0x75
function function_f4137b4aff2d357f() {
    /#
        var_490dc8cea6acfcdd = 0;
        var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 0;
        foreach (player in level.players) {
            player function_697d593ebcb428dd("<unknown string>", var_490dc8cea6acfcdd);
        }
    #/
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c33
// Size: 0x7e
function function_244f7ed1bde7a922() {
    /#
        var_490dc8cea6acfcdd = 0;
        var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 0;
        var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 1;
        foreach (player in level.players) {
            player function_697d593ebcb428dd("<unknown string>", var_490dc8cea6acfcdd);
        }
    #/
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cb8
// Size: 0x7e
function function_9b3b346bf41b42ec() {
    /#
        var_490dc8cea6acfcdd = 0;
        var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 0;
        var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 3;
        foreach (player in level.players) {
            player function_697d593ebcb428dd("<unknown string>", var_490dc8cea6acfcdd);
        }
    #/
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d3d
// Size: 0x87
function function_dedbab246909a68b() {
    /#
        var_490dc8cea6acfcdd = 0;
        var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 0;
        var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 3;
        var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 1;
        foreach (player in level.players) {
            player function_697d593ebcb428dd("<unknown string>", var_490dc8cea6acfcdd);
        }
    #/
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1dcb
// Size: 0x7e
function function_e9943edf01fae246() {
    /#
        var_490dc8cea6acfcdd = 0;
        var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 0;
        var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 2;
        foreach (player in level.players) {
            player function_697d593ebcb428dd("<unknown string>", var_490dc8cea6acfcdd);
        }
    #/
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e50
// Size: 0x87
function function_12f0988382364fc5() {
    /#
        var_490dc8cea6acfcdd = 0;
        var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 0;
        var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 2;
        var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 1;
        foreach (player in level.players) {
            player function_697d593ebcb428dd("<unknown string>", var_490dc8cea6acfcdd);
        }
    #/
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ede
// Size: 0x7e
function function_aad4b8e06fba7712() {
    /#
        var_490dc8cea6acfcdd = 0;
        var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 0;
        var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 4;
        foreach (player in level.players) {
            player function_697d593ebcb428dd("<unknown string>", var_490dc8cea6acfcdd);
        }
    #/
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f63
// Size: 0x7e
function function_5ccbb72c64ed64b0() {
    /#
        var_490dc8cea6acfcdd = 0;
        var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 0;
        var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 5;
        foreach (player in level.players) {
            player function_697d593ebcb428dd("<unknown string>", var_490dc8cea6acfcdd);
        }
    #/
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fe8
// Size: 0x7e
function function_a481845bd08b83ea() {
    /#
        var_490dc8cea6acfcdd = 0;
        var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 0;
        var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 6;
        foreach (player in level.players) {
            player function_697d593ebcb428dd("<unknown string>", var_490dc8cea6acfcdd);
        }
    #/
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x206d
// Size: 0x75
function function_3cef16eb6c7ab7f5() {
    /#
        var_490dc8cea6acfcdd = 0;
        var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 0;
        foreach (player in level.players) {
            player function_697d593ebcb428dd("<unknown string>", var_490dc8cea6acfcdd);
        }
    #/
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20e9
// Size: 0x7e
function function_4a73df03aaeb1f40() {
    /#
        var_490dc8cea6acfcdd = 0;
        var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 0;
        var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 1;
        foreach (player in level.players) {
            player function_697d593ebcb428dd("<unknown string>", var_490dc8cea6acfcdd);
        }
    #/
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x216e
// Size: 0x7e
function function_4b5b7c47cb916820() {
    /#
        var_490dc8cea6acfcdd = 0;
        var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 0;
        var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 2;
        foreach (player in level.players) {
            player function_697d593ebcb428dd("<unknown string>", var_490dc8cea6acfcdd);
        }
    #/
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21f3
// Size: 0x87
function function_7d67bfa0977275ef() {
    /#
        var_490dc8cea6acfcdd = 0;
        var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 0;
        var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 2;
        var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 1;
        foreach (player in level.players) {
            player function_697d593ebcb428dd("<unknown string>", var_490dc8cea6acfcdd);
        }
    #/
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2281
// Size: 0x75
function function_5ba699d40ad475b5() {
    /#
        var_490dc8cea6acfcdd = 0;
        var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 0;
        foreach (player in level.players) {
            player function_697d593ebcb428dd("<unknown string>", var_490dc8cea6acfcdd);
        }
    #/
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22fd
// Size: 0x7e
function function_847c3a90c31506da() {
    /#
        var_490dc8cea6acfcdd = 0;
        var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 0;
        var_490dc8cea6acfcdd = var_490dc8cea6acfcdd | 1 << 1;
        foreach (player in level.players) {
            player function_697d593ebcb428dd("<unknown string>", var_490dc8cea6acfcdd);
        }
    #/
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2382
// Size: 0x14
function function_ff8a5baefaf2044() {
    /#
        function_847c3a90c31506da();
        function_4a73df03aaeb1f40();
    #/
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x239d
// Size: 0x14
function function_f1c42880c41252b3() {
    /#
        function_f4137b4aff2d357f();
        function_4a73df03aaeb1f40();
    #/
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23b8
// Size: 0x14
function function_c98bce4a7d0771f5() {
    /#
        function_244f7ed1bde7a922();
        function_5ba699d40ad475b5();
    #/
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23d3
// Size: 0x14
function function_21d0791f2931f95() {
    /#
        function_3cef16eb6c7ab7f5();
        function_aad4b8e06fba7712();
    #/
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23ee
// Size: 0x14
function function_a319100f1b453a35() {
    /#
        function_3cef16eb6c7ab7f5();
        function_244f7ed1bde7a922();
    #/
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2409
// Size: 0x14
function function_fc755361ba8bc81() {
    /#
        function_3cef16eb6c7ab7f5();
        function_244f7ed1bde7a922();
    #/
}

// Namespace damagefeedback/namespace_e072c8407b2a861c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2424
// Size: 0x14
function function_fb89825e361fc1f0() {
    /#
        function_3cef16eb6c7ab7f5();
        function_5ba699d40ad475b5();
    #/
}

