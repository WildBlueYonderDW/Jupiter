// mwiii decomp prototype
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\engine\utility.gsc;

#namespace meatshield;

// Namespace meatshield/namespace_9ba985cbac6de93c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x140
// Size: 0x76
function init() {
    setdvarifuninitialized(@"hash_c345ae56660f18a9", 2);
    setdvarifuninitialized(@"hash_5e634bc109c427be", 10000);
    setdvarifuninitialized(@"hash_325e0d531141e772", 500);
    setdvarifuninitialized(@"hash_28aaa289c1be569", 5000);
    setdvarifuninitialized(@"hash_933400a8bdb6c6c9", 0);
    setdvarifuninitialized(@"hash_c06ce4e11c644c9b", 1);
    /#
        thread function_23f1fe988c0500d1();
    #/
}

// Namespace meatshield/namespace_9ba985cbac6de93c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bd
// Size: 0x46
function function_8f2f9f02b630ed27() {
    player = self;
    player.var_8a075d261f93c84d = 0;
    player.var_57685043ac8c8721 = 0;
    player.var_5a36dc72bf7db414 = 0;
    thread function_8562e6b396459b10();
    thread function_aaf92259b5005889();
}

// Namespace meatshield/namespace_9ba985cbac6de93c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20a
// Size: 0x4c
function function_8562e6b396459b10() {
    self endon("disconnect");
    level endon("game_ended");
    player = self;
    while (1) {
        player waittill("meatshield_victim_start");
        function_a29f3f8e24309d49();
        player thread function_3f6c57b19f80fbd9();
        player waittill("meatshield_victim_stop");
        function_139a67a31afc452b();
    }
}

// Namespace meatshield/namespace_9ba985cbac6de93c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25d
// Size: 0xe5
function function_3f6c57b19f80fbd9() {
    self endon("meatshield_victim_stop");
    self endon("disconnect");
    level endon("game_ended");
    player = self;
    var_9acb83ae781d5fb4 = (player.var_57685043ac8c8721 - player.var_5a36dc72bf7db414) * 0.001;
    damagepersecond = player.var_423a9f9e23833f65 / (var_9acb83ae781d5fb4 + 1);
    while (1) {
        var_7f9ee04a290a5b86 = getdvarint(@"hash_c345ae56660f18a9", 2);
        if (var_7f9ee04a290a5b86 == 1) {
            if (player.var_5a36dc72bf7db414 < gettime()) {
                function_afdf3e6cbe0522d7(damagepersecond, 0);
            }
        } else if (var_7f9ee04a290a5b86 == 2) {
            if (player.var_57685043ac8c8721 < gettime()) {
                function_afdf3e6cbe0522d7(player.var_423a9f9e23833f65, 0);
            }
        }
        wait(1);
    }
}

// Namespace meatshield/namespace_9ba985cbac6de93c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x349
// Size: 0xaf
function function_a29f3f8e24309d49() {
    player = self;
    player.var_8a075d261f93c84d = 0;
    player.var_57685043ac8c8721 = gettime() + getdvarint(@"hash_5e634bc109c427be", 10000);
    player.var_423a9f9e23833f65 = getdvarint(@"hash_325e0d531141e772", 500);
    player.var_5a36dc72bf7db414 = gettime() + getdvarint(@"hash_28aaa289c1be569", 5000);
    player.var_5a36dc72bf7db414 = min(player.var_5a36dc72bf7db414, player.var_57685043ac8c8721);
    player function_90c280e11232303b(0);
}

// Namespace meatshield/namespace_9ba985cbac6de93c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ff
// Size: 0x4d
function function_139a67a31afc452b() {
    player = self;
    player.var_ed4c85bc969627fd = 0;
    player.var_5a36dc72bf7db414 = 0;
    player.var_57685043ac8c8721 = 0;
    player.var_8a075d261f93c84d = 0;
    player function_90c280e11232303b(1);
}

// Namespace meatshield/namespace_9ba985cbac6de93c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x453
// Size: 0x2e
function function_90c280e11232303b(enabled) {
    self allowprone(enabled);
    self allowcrouch(enabled);
    val::set("meatshield", "killstreaks", enabled);
}

// Namespace meatshield/namespace_9ba985cbac6de93c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x488
// Size: 0x6a
function function_afdf3e6cbe0522d7(damage, var_a6bb61971108293a) {
    player = self;
    player.var_8a075d261f93c84d = player.var_8a075d261f93c84d + damage;
    if (player.var_8a075d261f93c84d >= player.var_423a9f9e23833f65) {
        player.var_8a075d261f93c84d = 0;
        player function_fbcd049be1f07a3b(1, var_a6bb61971108293a);
    }
}

// Namespace meatshield/namespace_9ba985cbac6de93c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f9
// Size: 0x43
function function_aaf92259b5005889() {
    self endon("disconnect");
    level endon("game_ended");
    player = self;
    while (1) {
        player waittill("meatshield_attacker_start");
        function_7e80a2f5d64a4196();
        player waittill("meatshield_attacker_stop");
        function_a7db18d919050692();
    }
}

// Namespace meatshield/namespace_9ba985cbac6de93c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x543
// Size: 0x32
function function_7e80a2f5d64a4196() {
    player = self;
    player function_d8aeb1fac2d32123();
    player val::set("meatshield", "killstreaks", 0);
    level notify("uav_update");
}

// Namespace meatshield/namespace_9ba985cbac6de93c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57c
// Size: 0x33
function function_a7db18d919050692() {
    player = self;
    player function_7b59a9e133d4cb45();
    player val::set("meatshield", "killstreaks", 1);
    level notify("uav_update");
}

// Namespace meatshield/namespace_9ba985cbac6de93c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b6
// Size: 0x55
function function_d8aeb1fac2d32123() {
    player = self;
    if (!player function_1dc5d0827fd48729()) {
        player.switchweapon = player getcurrentweapon();
        var_a6a2e5fe25ca0f2b = namespace_d325722f2754c2c4::function_eeaa22f0cd1ff845("t10_pi_p13_usugar9_mp");
        player giveweapon(var_a6a2e5fe25ca0f2b);
        player.var_121bfda4d22eca4 = var_a6a2e5fe25ca0f2b;
    }
}

// Namespace meatshield/namespace_9ba985cbac6de93c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x612
// Size: 0x59
function function_7b59a9e133d4cb45() {
    player = self;
    if (isdefined(player.var_121bfda4d22eca4)) {
        player takeweapon(player.var_121bfda4d22eca4);
        player.var_121bfda4d22eca4 = undefined;
        player namespace_df5cfdbe6e2d3812::domonitoredweaponswitch(player.switchweapon);
        player.switchweapon = undefined;
    }
}

// Namespace meatshield/namespace_9ba985cbac6de93c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x672
// Size: 0x34
function function_10de2964abd64e1f() {
    if (namespace_19b4203b51d56488::function_781844c0c05b5ac7()) {
        return 1;
    }
    if (!self function_fc05ebabfbf10e33()) {
        return 1;
    }
    if (getdvarint(@"hash_933400a8bdb6c6c9", 0) == 1) {
        return 1;
    }
    return 0;
}

// Namespace meatshield/namespace_9ba985cbac6de93c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6ae
// Size: 0x1f8
function function_23f1fe988c0500d1() {
    /#
        setdevdvarifuninitialized(@"hash_752231be3b803e3d", -1);
        setdevdvarifuninitialized(@"hash_ec059bc7573bd896", -1);
        var_be7af47bf33d6b22 = [];
        while (1) {
            wait(1);
            attackerentnum = getdvarint(@"hash_752231be3b803e3d", -1);
            victimentnum = getdvarint(@"hash_ec059bc7573bd896", -1);
            if (attackerentnum == -2 || victimentnum == -2) {
                for (i = 0; i < var_be7af47bf33d6b22.size; i++) {
                    victim = var_be7af47bf33d6b22[i].victim;
                    attacker = var_be7af47bf33d6b22[i].attacker;
                    if (!isdefined(victim) || !isdefined(attacker) || !isplayer(victim) || !isplayer(attacker)) {
                        continue;
                    }
                    if (victim function_fc05ebabfbf10e33() && attacker function_a237aba99cf26050()) {
                        victim function_fbcd049be1f07a3b(0, 0);
                    }
                }
                attackerentnum = setdvar(@"hash_752231be3b803e3d", -1);
                victimentnum = setdvar(@"hash_ec059bc7573bd896", -1);
                var_be7af47bf33d6b22 = [];
                continue;
            }
            if (attackerentnum == -1 || victimentnum == -1) {
                continue;
            }
            var_3b77b9fd262214be = getentbynum(victimentnum);
            attackerent = getentbynum(attackerentnum);
            if (!isdefined(var_3b77b9fd262214be) || !isdefined(attackerent) || !isplayer(var_3b77b9fd262214be) || !isplayer(attackerent)) {
                continue;
            }
            var_11074bfcf9ce9e2b = spawnstruct();
            var_11074bfcf9ce9e2b.attacker = attackerent;
            var_11074bfcf9ce9e2b.victim = var_3b77b9fd262214be;
            var_be7af47bf33d6b22 = namespace_3c37cb17ade254d::array_add(var_be7af47bf33d6b22, var_11074bfcf9ce9e2b);
            var_3b77b9fd262214be function_50d80b68bdd765d9(attackerent);
            attackerentnum = setdvar(@"hash_752231be3b803e3d", -1);
            victimentnum = setdvar(@"hash_ec059bc7573bd896", -1);
        }
    #/
}

