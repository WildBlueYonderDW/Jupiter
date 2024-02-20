// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_5d813d45c6b1b1be;
#using script_4c770a9a4ad7659c;
#using script_64316dc775e91122;
#using script_443d99fe707f1d9f;
#using script_7b2517368c79e5bc;
#using script_6bffae1b97f70547;
#using script_2583ee5680cf4736;
#using script_2669878cf5a1b6bc;

#namespace namespace_fcdac53e90589a14;

// Namespace namespace_fcdac53e90589a14/namespace_d7f8af4d4a7ac24b
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x209
// Size: 0xf8
function private function_de6fbb5c61ddf941() {
    var_5179c48492d1d2c2 = function_441cb85860275371("mrp_respect_challenge");
    if (!isdefined(var_5179c48492d1d2c2)) {
        return;
    }
    var_45d9cbef149301da = getstruct(var_5179c48492d1d2c2.target, "targetname");
    /#
        assertex(isdefined(var_45d9cbef149301da), "No Grave Struct found for MRP Respect!");
    #/
    function_efabc5ae0422de9e(var_5179c48492d1d2c2);
    grave = spawnscriptable("ob_jup_item_cache_mrp_grave", var_45d9cbef149301da.origin, var_45d9cbef149301da.angles);
    var_5820f9f37c14b3fb = var_45d9cbef149301da.origin + (0, 0, 45);
    var_c29b03c22a69b0b2 = namespace_5775ad2badedbcaa::function_90472496b91b94b3(var_5820f9f37c14b3fb, 70, &function_e33d81ae37e492cf, "JUP_OB_OBJECTIVES/MRP_PAY_RESPECTS");
    var_c29b03c22a69b0b2.var_45d9cbef149301da = var_45d9cbef149301da;
    /#
        sphere(var_c29b03c22a69b0b2.origin, 30, (0, 0, 1), 0, 1);
    #/
}

// Namespace namespace_fcdac53e90589a14/namespace_d7f8af4d4a7ac24b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x308
// Size: 0x9a
function function_e33d81ae37e492cf(player) {
    if (!isplayer(player)) {
        return;
    }
    if (istrue(player.inlaststand) || !isalive(player)) {
        return;
    }
    if (player isreloading() || player isgestureplaying()) {
        return;
    }
    self disableplayeruse(player);
    rewards = player function_36f8ec252902994();
    time = randomfloatrange(3, 5);
    player playsoundtoplayer("evt_ob_mrpeeks_stinger_activation", player, player);
    wait(time);
    namespace_8eedd8f6cf5d9f19::function_a4dfabe55dd4a652(player, self.var_45d9cbef149301da, rewards);
}

// Namespace namespace_fcdac53e90589a14/namespace_d7f8af4d4a7ac24b
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3a9
// Size: 0x102
function private function_36f8ec252902994() {
    currentweapon = self getcurrentweapon();
    var_3a184548fcafff38 = currentweapon getnoaltweapon();
    var_362a3a0a1e485bf6 = function_d4897d4fc2a76e56(currentweapon);
    weapon_rarity = function_75e73212bbe447d9(var_3a184548fcafff38);
    var_594b03a08ee56c4a = get_pap_level(var_3a184548fcafff38);
    rewards = function_396c7e713507f53a(weapon_rarity, var_594b03a08ee56c4a, var_362a3a0a1e485bf6);
    if (!isweapon(var_3a184548fcafff38)) {
        return rewards;
    }
    if (weapon_rarity == 0 && var_594b03a08ee56c4a == 0 && var_362a3a0a1e485bf6 == "") {
        return rewards;
    }
    if (weapon_rarity < 5) {
        function_3a0412b800f3331d(var_3a184548fcafff38, 0);
    }
    w_new = function_f2dd15c78e013bd7(var_3a184548fcafff38);
    var_7d014f270bcc9853 = undefined;
    if (var_3a184548fcafff38 != currentweapon) {
        var_7d014f270bcc9853 = w_new getaltweapon();
    }
    self takeweapon(var_3a184548fcafff38);
    self giveweapon(w_new);
    self switchtoweapon(function_53c4c53197386572(var_7d014f270bcc9853, w_new));
    namespace_2e04133215e83a48::function_b4da81e43557ada1(w_new);
    return rewards;
}

// Namespace namespace_fcdac53e90589a14/namespace_d7f8af4d4a7ac24b
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4b3
// Size: 0x311
function private function_396c7e713507f53a(rarity, var_ce56f1ad6fb6521b, var_2e04133215e83a48) {
    rewards = [];
    if (isdefined(rarity) && rarity > 0 && rarity < 5) {
        tool = function_bc2f4857c90f5344("ob_jup_respects_tool_" + rarity, 1);
        if (isdefined(tool)) {
            if (isarray(tool)) {
                foreach (t in tool) {
                    rewards[rewards.size] = t;
                }
            } else {
                rewards[rewards.size] = tool;
            }
        }
    }
    if (isdefined(var_ce56f1ad6fb6521b) && var_ce56f1ad6fb6521b > 0) {
        crystal = function_bc2f4857c90f5344("ob_jup_respects_crystal_" + var_ce56f1ad6fb6521b, 1);
        if (isdefined(crystal)) {
            if (isarray(crystal)) {
                foreach (c in crystal) {
                    rewards[rewards.size] = c;
                }
            } else {
                rewards[rewards.size] = crystal;
            }
        }
    }
    if (isdefined(var_2e04133215e83a48)) {
        switch (var_2e04133215e83a48) {
        case #"hash_853faa00a9ff1020":
            mod = function_bc2f4857c90f5344("ob_jup_respects_mod_" + "brainrot", 1);
            break;
        case #"hash_fe0fd5228eda0f07":
            mod = function_bc2f4857c90f5344("ob_jup_respects_mod_" + "cryofreeze", 1);
            break;
        case #"hash_afaaf053b2461f8a":
            mod = function_bc2f4857c90f5344("ob_jup_respects_mod_" + "deadwire", 1);
            break;
        case #"hash_4f5cd54aaf7f106":
            mod = function_bc2f4857c90f5344("ob_jup_respects_mod_" + "napalmburst", 1);
            break;
        case #"hash_41d942d30dd3f804":
            mod = function_bc2f4857c90f5344("ob_jup_respects_mod_" + "shatterblast", 1);
            break;
        default:
            break;
        }
        if (isdefined(mod)) {
            if (isarray(mod)) {
                foreach (item in mod) {
                    rewards[rewards.size] = item;
                }
            } else {
                rewards[rewards.size] = mod;
            }
        }
    }
    if (rewards.size == 0) {
        prize = function_bc2f4857c90f5344("ob_jup_respects_consolation", 1);
        if (isarray(prize)) {
            foreach (item in prize) {
                rewards[rewards.size] = item;
            }
        } else {
            rewards[rewards.size] = prize;
        }
    }
    return rewards;
}

// Namespace namespace_fcdac53e90589a14/namespace_d7f8af4d4a7ac24b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7cc
// Size: 0x1f4
function private function_f2dd15c78e013bd7(currentweapon) {
    reticle = getweaponreticlename(currentweapon);
    if (issubstr(reticle, "scope")) {
        reticle = int(function_95c6391212a25f7c(reticle, "scope"));
        if (reticle == 0) {
            reticle = undefined;
        }
    } else if (!isdefined(namespace_e0ee43ef2dddadaa::getreticleindex(reticle))) {
        reticle = undefined;
    }
    variantid = getweaponvariantindex(currentweapon);
    stickers = [0:currentweapon.stickerslot0, 1:currentweapon.stickerslot1, 2:currentweapon.stickerslot2, 3:currentweapon.stickerslot3, 4:function_53c4c53197386572(currentweapon.var_b39ac546cc8621f8, "none")];
    var_dfaf5dd7fb4c5238 = [];
    var_7c77dea6fd417685 = [];
    foreach (attachment in currentweapon.attachments) {
        if (issubstr(attachment, "_pack")) {
            var_7c77dea6fd417685[var_7c77dea6fd417685.size] = attachment;
        } else {
            var_dfaf5dd7fb4c5238[var_dfaf5dd7fb4c5238.size] = attachment;
        }
    }
    var_261e95dabfb8d55f = [];
    foreach (index, value in currentweapon.attachmentvarindices) {
        if (array_contains(var_7c77dea6fd417685, index)) {
            continue;
        }
        var_261e95dabfb8d55f[index] = value;
    }
    w_new = namespace_e0ee43ef2dddadaa::buildweapon(currentweapon.basename, var_dfaf5dd7fb4c5238, "none", reticle, variantid, var_261e95dabfb8d55f, undefined, stickers);
    return w_new;
}

