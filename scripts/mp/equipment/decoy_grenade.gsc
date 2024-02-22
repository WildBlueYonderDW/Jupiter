// mwiii decomp prototype
#using script_16ea1b94f0f381b3;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_247745a526421ba7;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\utility\player.gsc;
#using script_7ef95bba57dc4b82;
#using script_736dec95a49487a6;
#using scripts\mp\weapons.gsc;
#using scripts\mp\damage.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\utility\stats.gsc;
#using script_74b851b7aa1ef32d;
#using scripts\mp\utility\points.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\utility\debug.gsc;

#namespace decoy_grenade;

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x302
// Size: 0x3
function decoy_init() {
    
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30c
// Size: 0x2d5
function decoy_used(grenade) {
    grenade endon("death");
    if (issharedfuncdefined(#"hash_d8976e21a6adafba", #"hash_ca0042e3cac99672")) {
        grenade [[ getsharedfunc(#"hash_d8976e21a6adafba", #"hash_ca0042e3cac99672") ]](grenade);
    }
    ref = namespace_4fb9dddfb8c1a67a::function_7f245729fcb6414d(grenade.weapon_name);
    grenade.var_8bf83d28be4c2d4f = namespace_4fb9dddfb8c1a67a::getequipmenttableinfo(ref);
    bundle = grenade.var_8bf83d28be4c2d4f.bundle;
    if (!isdefined(grenade.var_8bf83d28be4c2d4f.bundle)) {
        /#
            assertmsg("Decoy Grenade needs a bundle.");
        #/
    }
    if (istrue(bundle.var_f2f8c61e14fa90c5)) {
        if (!isdefined(self.var_2ee95d3eae4fce60)) {
            self.var_2ee95d3eae4fce60 = [];
            callback::add("onPlayerSpawn_destroyEquipment", &function_f2f8c61e14fa90c5);
        }
        self.var_2ee95d3eae4fce60[self.var_2ee95d3eae4fce60.size] = grenade;
    }
    printgameaction("decoy grenade spawn", grenade.owner);
    grenade.playersdebuffed = [];
    grenade.decoyassists = 0;
    grenade namespace_b6b4a3ac458ab6e2::function_172d848d58051fdf(&function_9d529f508702dfe8);
    function_641996b5e113c5c6(grenade, &decoy_empapplied);
    thread namespace_3bbb5a98b932c46f::monitordisownedgrenade(self, grenade);
    if (istrue(bundle.var_92f375a60e3b214f)) {
        grenade allow_emp(0);
        wait(0.4);
        grenade allow_emp(1);
        var_b38858f84e7951fd = function_53c4c53197386572(bundle.var_e6573bda1f59c5b8, 19);
        grenade thread namespace_3e725f3cc58bddd3::monitordamage(var_b38858f84e7951fd, "hitequip", &decoy_handlefataldamage, &decoy_handledamage);
        grenade thread decoy_monitorposition();
        wait(0.6);
        endtime = gettime() + 5 * 1000;
        var_5db609b6270b36f5 = gettime();
        var_edaa2169ec420478 = 3;
        while (gettime() < endtime) {
            if (gettime() >= var_5db609b6270b36f5) {
                var_5db609b6270b36f5 = gettime() + 200;
                if (grenade decoy_isonground()) {
                    var_edaa2169ec420478--;
                    if (var_edaa2169ec420478 == 0) {
                        break;
                    }
                } else {
                    var_edaa2169ec420478 = 3;
                }
            }
            wait(0.2);
        }
    } else {
        var_a681b7890cd017c7 = grenade function_8100d200f92c6518();
        var_b38858f84e7951fd = function_53c4c53197386572(bundle.var_e6573bda1f59c5b8, 19);
        grenade thread namespace_3e725f3cc58bddd3::monitordamage(var_b38858f84e7951fd, "hitequip", &decoy_handlefataldamage, &decoy_handledamage);
        armtime = function_53c4c53197386572(bundle.var_8e21af8d205f8107, 0.5);
        wait(armtime);
    }
    grenade thread decoy_monitorfuse();
    grenade thread decoy_activated();
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e8
// Size: 0x11e
function decoy_activated() {
    self endon("death");
    bundle = self.var_8bf83d28be4c2d4f.bundle;
    self setotherent(self.owner);
    if (self.weapon_name == "t10_decoy_grenade_mp") {
        self setscriptablepartstate("beacon", "t10Active", 0);
    } else {
        self setscriptablepartstate("beacon", "active", 0);
    }
    firetype = decoy_getfiretype();
    self.var_10ce829c0f6c6ce4 = [];
    if (istrue(bundle.var_3c615c401a26ba90)) {
        self.var_10ce829c0f6c6ce4["footFallSoundsPlayedTime"] = undefined;
    }
    self notify("decoy_activated");
    namespace_aad14af462a74d08::function_b0f754c8a379154e("equip_decoy", self.owner, undefined, function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
    self notify("decoy_sequence_started", self.origin);
    while (1) {
        if (!istrue(self.isjammed)) {
            function_e089ba219ba4b6e9(firetype);
        }
        wait(randomfloatrange(1.5, 3.5));
    }
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70d
// Size: 0x8a
function function_e089ba219ba4b6e9(firetype) {
    bundle = self.var_8bf83d28be4c2d4f.bundle;
    if (istrue(bundle.var_3c615c401a26ba90) && function_4ef2fc84cdc52176()) {
        var_eac15a3e39a5b1ab = randomint(100);
        if (istrue(bundle.var_3c2f3b4105ab254c) || var_eac15a3e39a5b1ab > 35) {
            function_61daabf7ad718d7c();
        }
    }
    if (istrue(bundle.var_825d16386fe4c4a4)) {
        decoy_firesequence(firetype);
    }
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79e
// Size: 0x34
function decoy_destroy() {
    self setscriptablepartstate("destroy", "active", 0);
    self setscriptablepartstate("beacon", "neutral", 0);
    thread decoy_delete(0.1);
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d9
// Size: 0x77
function decoy_delete(delay) {
    if (!isdefined(delay)) {
        delay = 0;
    }
    self notify("death");
    self.exploding = 1;
    function_83cebe0ae5318a7f(self);
    namespace_3e725f3cc58bddd3::monitordamageend();
    wait(delay);
    if (issharedfuncdefined(#"hash_d8976e21a6adafba", #"hash_c33ceb91d0ca7a9d")) {
        self [[ getsharedfunc(#"hash_d8976e21a6adafba", #"hash_c33ceb91d0ca7a9d") ]](self);
    }
    self delete();
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x857
// Size: 0x7d
function function_f2f8c61e14fa90c5(params) {
    if (isdefined(self.var_2ee95d3eae4fce60)) {
        foreach (decoy in self.var_2ee95d3eae4fce60) {
            if (isdefined(decoy)) {
                decoy decoy_destroy();
            }
        }
        self.var_2ee95d3eae4fce60 = [];
    }
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8db
// Size: 0x62
function decoy_firesequence(firetype) {
    firecount = 1 + randomint(firetype.var_88f7dabec7a7b3b1);
    while (1) {
        firecount--;
        decoy_fireevent(firetype);
        if (firecount == 0) {
            break;
        }
        wait(randomfloatrange(firetype.var_4c90875a14ef20ce, firetype.var_3768c97bd2a961e8));
    }
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x944
// Size: 0x9d
function function_61daabf7ad718d7c() {
    self.var_8549d8b383189c34 = 1;
    var_e62ac38633d5dad = function_100765fe9abe8d6d();
    stepcount = var_e62ac38633d5dad.var_6a2c0f46b832c6fa + randomint(var_e62ac38633d5dad.var_cf7d2640e0d98e84);
    while (1) {
        stepcount--;
        function_a7201449be7399ab(var_e62ac38633d5dad);
        if (stepcount == 0) {
            break;
        }
        wait(randomfloatrange(var_e62ac38633d5dad.var_597caffb4585d369, var_e62ac38633d5dad.var_bcfbe97a5148e25b));
    }
    self.var_10ce829c0f6c6ce4["footFallSoundsPlayedTime"] = gettime();
    self.var_8549d8b383189c34 = 0;
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e8
// Size: 0x114
function function_a7201449be7399ab(var_3c8b1cbfa325c448) {
    if (istrue(self.var_8bf83d28be4c2d4f.bundle.var_92f375a60e3b214f)) {
        origin = self.origin + (0, 0, 1.5);
        velocity = decoy_getvelocity(origin);
        angles = decoy_getfireeventangles(velocity);
        impulse = function_3d4031d0ff8cdb6(velocity, var_3c8b1cbfa325c448, angles);
        var_f24845eeaeedc946 = self.owner getheldoffhand();
        if (!isdefined(var_f24845eeaeedc946) || function_f581838ce4328f7a(var_f24845eeaeedc946) != "frag_grenade") {
            self.owner namespace_68e641469fde3fa7::_launchgrenade("decoy_grenade_mp", origin, impulse, 100, 1, self);
        }
        self setcandamage(1);
    }
    decoy_debuffenemiesinrange();
    var_10bd16c4adfe80d8 = var_3c8b1cbfa325c448.var_a3bdf3f3509252c9;
    self setscriptablepartstate(function_d08f9a08afaed2f5(), var_10bd16c4adfe80d8, 0);
    wait(var_3c8b1cbfa325c448.var_635a91d2dd01551d);
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb03
// Size: 0x70
function function_d08f9a08afaed2f5() {
    bundle = self.var_8bf83d28be4c2d4f.bundle;
    if (istrue(self.var_c99e4c450c908f1c)) {
        self.var_c99e4c450c908f1c = 0;
        return function_53c4c53197386572(bundle.var_ed2d8117c9ed9ecb, "footFallPartA");
    }
    self.var_c99e4c450c908f1c = 1;
    return function_53c4c53197386572(bundle.var_ed2d8217c9eda0fe, "footFallPartB");
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb7b
// Size: 0x15b
function decoy_fireevent(firetype) {
    if (istrue(self.var_8bf83d28be4c2d4f.bundle.var_92f375a60e3b214f)) {
        origin = self.origin + (0, 0, 1.5);
        velocity = decoy_getvelocity(origin);
        angles = decoy_getfireeventangles(velocity);
        impulse = decoy_getfireeventimpulse(velocity, firetype, angles);
        var_f24845eeaeedc946 = self.owner getheldoffhand();
        if (!isdefined(var_f24845eeaeedc946) || function_f581838ce4328f7a(var_f24845eeaeedc946) != "frag_grenade") {
            self.owner namespace_68e641469fde3fa7::_launchgrenade("decoy_grenade_mp", self.origin, impulse, 100, 1, self);
        }
        self setcandamage(1);
    }
    self setscriptablepartstate("beacon", "active", 0);
    self setscriptablepartstate("weaponFire", firetype.var_4c34cca2def2821a, 0);
    self setscriptablepartstate("weaponSounds", firetype.var_4c34cca2def2821a, 0);
    pinglocationenemyteams(self.origin, self.team, self.owner);
    decoy_debuffenemiesinrange(1);
    wait(firetype.var_1d7ba3e3088449d);
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcdd
// Size: 0x32
function function_87152dfc9a628684() {
    if (!isdefined(self.var_10ce829c0f6c6ce4["footFallSoundsPlayedTime"])) {
        return 1;
    }
    return gettime() - self.var_10ce829c0f6c6ce4["footFallSoundsPlayedTime"] > 2000;
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd17
// Size: 0x1c8
function decoy_debuffenemiesinrange(var_fce8828abf8327b) {
    var_617fcc52969f24b8 = function_53c4c53197386572(self.var_8bf83d28be4c2d4f.bundle.var_77b64bf7dea3506b, 800);
    var_7e9c12829ca09ca7 = function_53c4c53197386572(self.var_8bf83d28be4c2d4f.bundle.var_3b8cd7cf44335571, 2000);
    var_46f5efb8178285e9 = max(var_617fcc52969f24b8, var_7e9c12829ca09ca7);
    var_5a532b3d41b19c7a = utility::function_98a826b6b6d0d118(self.origin, var_46f5efb8178285e9);
    var_5e048634c072b43b = undefined;
    foreach (enemy in var_5a532b3d41b19c7a) {
        if (isplayer(enemy) && !enemy namespace_f8065cafc523dba5::_isalive()) {
            continue;
        }
        if (!istrue(namespace_f8065cafc523dba5::playersareenemies(self.owner, enemy))) {
            continue;
        }
        if (isplayer(enemy)) {
            var_5e048634c072b43b = distance(enemy.origin, self.origin);
            if (var_5e048634c072b43b > var_617fcc52969f24b8) {
                continue;
            }
            thread decoy_debuffenemy(enemy);
        } else if (istrue(var_fce8828abf8327b)) {
            enemy aieventlistenerevent("gunshot", self, self.origin);
        } else {
            enemy aieventlistenerevent("decoy_grenade", self, self.origin);
        }
        if (isplayer(self.owner)) {
            self.owner namespace_3e725f3cc58bddd3::combatrecordtacticalstat("equip_decoy");
            self.owner namespace_3c5a4254f2b957ea::incpersstat("decoyHits", 1);
        }
    }
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xee6
// Size: 0x17a
function decoy_debuffenemy(player) {
    player endon("disconnect");
    self endon("death");
    owner = self.owner;
    owner endon("disconnect");
    self notify("decoy_debuffEnemy_" + player getentitynumber());
    self endon("decoy_debuffEnemy_" + player getentitynumber());
    if (!isdefined(self.playersdebuffed[player getentitynumber()])) {
        self.playersdebuffed[player getentitynumber()] = player;
        if (player != owner) {
            namespace_a850435086c88de3::doonactionscoreevent(0, "decoyDebuffed");
        }
    }
    result = player namespace_3c37cb17ade254d::waittill_notify_or_timeout_return("death", 5);
    self.playersdebuffed[player getentitynumber()] = undefined;
    if (isdefined(player.lastkilledby) && player.lastkilledby != owner) {
        if (result == "death" && istrue(namespace_f8065cafc523dba5::playersareenemies(player, owner))) {
            if (!istrue(self.var_8bf83d28be4c2d4f.bundle.var_b20a3c4b142951e7) || self.decoyassists < (isdefined(self.var_8bf83d28be4c2d4f.bundle.var_dcc444b82ee2ea4a) ? 3 : self.var_8bf83d28be4c2d4f.bundle.var_dcc444b82ee2ea4a)) {
                owner thread namespace_48a08c5037514e04::doscoreevent(#"assist_decoy");
                self.decoyassists++;
            }
        }
    }
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1067
// Size: 0x31
function decoy_monitorposition() {
    self endon("death");
    while (1) {
        oldposition = self.origin;
        waitframe();
        self.oldposition = oldposition;
    }
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x109f
// Size: 0x44
function decoy_monitorfuse() {
    self endon("death");
    var_2870c09375c519e7 = function_53c4c53197386572(self.var_8bf83d28be4c2d4f.bundle.var_e4ce5a32b20aca32, 15);
    wait(var_2870c09375c519e7);
    thread decoy_destroy();
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ea
// Size: 0x4f
function decoy_empapplied(var_e527f023260c562c) {
    self notify("enemy_destroyed_equipment", var_e527f023260c562c.attacker);
    var_e527f023260c562c.victim decoy_givepointsfordestroy(var_e527f023260c562c.attacker);
    var_e527f023260c562c.victim thread decoy_destroy();
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1140
// Size: 0x3c
function function_9d529f508702dfe8(data) {
    data.victim decoy_givepointsfordestroy(data.attacker);
    data.victim thread decoy_destroy();
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1183
// Size: 0x48
function decoy_handledamage(data) {
    namespace_3bbb5a98b932c46f::equipmenthit(self.owner, data.attacker, data.objweapon, data.meansofdeath);
    return data.damage;
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11d3
// Size: 0x44
function decoy_handlefataldamage(data) {
    self notify("enemy_destroyed_equipment", data.attacker);
    decoy_givepointsfordestroy(data.attacker, data.objweapon);
    thread decoy_destroy();
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x121e
// Size: 0xa7
function function_100765fe9abe8d6d() {
    var_a78dc38b12eafeba = 0;
    var_2873368d0cd5753f = [];
    var_4bb47473cc0e8dc1 = self.var_8bf83d28be4c2d4f.bundle.var_5f1da0fe731d593e;
    if (!isdefined(var_4bb47473cc0e8dc1)) {
        return undefined;
    }
    for (i = 0; i < var_4bb47473cc0e8dc1.size; i++) {
        var_a78dc38b12eafeba = var_a78dc38b12eafeba + var_4bb47473cc0e8dc1[i].var_90b63d94c68dade5;
        var_2873368d0cd5753f[i] = var_a78dc38b12eafeba;
    }
    weightvalue = randomint(var_a78dc38b12eafeba);
    for (i = 0; i < var_2873368d0cd5753f.size; i++) {
        if (weightvalue < var_2873368d0cd5753f[i]) {
            return var_4bb47473cc0e8dc1[i];
        }
    }
    return undefined;
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12cd
// Size: 0xd4
function decoy_getfiretype() {
    /#
        var_32e256b98b7aebf0 = getdvar(@"hash_621c6f1da92a54d5", "physicsquery_closest");
        if (var_32e256b98b7aebf0 != "physicsquery_closest") {
            return var_32e256b98b7aebf0;
        }
    #/
    var_a78dc38b12eafeba = 0;
    var_2873368d0cd5753f = [];
    firetypes = self.var_8bf83d28be4c2d4f.bundle.var_d9f404803ed8ba5;
    if (!isdefined(firetypes)) {
        return undefined;
    }
    for (i = 0; i < firetypes.size; i++) {
        var_a78dc38b12eafeba = var_a78dc38b12eafeba + firetypes[i].var_f7dff98a85f6c2cc;
        var_2873368d0cd5753f[i] = var_a78dc38b12eafeba;
    }
    weightvalue = randomint(var_a78dc38b12eafeba);
    for (i = 0; i < var_2873368d0cd5753f.size; i++) {
        if (weightvalue < var_2873368d0cd5753f[i]) {
            return firetypes[i];
        }
    }
    return undefined;
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a9
// Size: 0x30
function decoy_getvelocity(origin) {
    if (!isdefined(self.oldposition)) {
        return undefined;
    }
    return (origin - self.oldposition) / level.framedurationseconds;
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e1
// Size: 0xc6
function decoy_getfireeventangles(velocity) {
    angles = undefined;
    if (!isdefined(velocity)) {
        angles = (0, randomint(360), 0);
    } else if (velocity * (1, 1, 0) == (0, 0, 0)) {
        angles = (0, randomint(360), 0);
    } else if (randomint(100) < 20) {
        angles = (0, randomint(360), 0);
    } else {
        angles = vectortoangles(velocity * (1, 1, 0));
        yaw = angleclamp180(angles[1]);
        yaw = yaw + angleclamp(-30 + randomint(61));
        angles = (angles[0], yaw, angles[2]);
    }
    return angles;
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14af
// Size: 0xc2
function decoy_getfireeventimpulse(velocity, firetype, var_7f51bb920d03d261) {
    var_738862482821aad9 = function_53c4c53197386572(firetype.var_c67aa30b2d6cf40c, 0);
    var_a824a799de1219c3 = function_53c4c53197386572(firetype.var_f1e7b4bc211c9fae, 0);
    var_bcfd5ca36fa3b723 = function_53c4c53197386572(firetype.var_a83b60306fb524ac, 0);
    var_256cb1561781b97d = function_53c4c53197386572(firetype.var_c41faee37562060e, 0);
    impulse = velocity;
    impulse = impulse + anglestoup(var_7f51bb920d03d261) * randomfloatrange(var_738862482821aad9, var_a824a799de1219c3);
    impulse = impulse + anglestoforward(var_7f51bb920d03d261) * randomfloatrange(var_bcfd5ca36fa3b723, var_256cb1561781b97d);
    return impulse;
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1579
// Size: 0xc2
function function_3d4031d0ff8cdb6(velocity, var_3c8b1cbfa325c448, var_7f51bb920d03d261) {
    var_738862482821aad9 = function_53c4c53197386572(var_3c8b1cbfa325c448.var_ef5c03d1ea3bfa59, 0);
    var_a824a799de1219c3 = function_53c4c53197386572(var_3c8b1cbfa325c448.var_23f84923a02c6943, 0);
    var_bcfd5ca36fa3b723 = function_53c4c53197386572(var_3c8b1cbfa325c448.var_63edec7b060e35a3, 0);
    var_256cb1561781b97d = function_53c4c53197386572(var_3c8b1cbfa325c448.var_cc5d412dadec37fd, 0);
    impulse = velocity;
    impulse = impulse + anglestoup(var_7f51bb920d03d261) * randomfloatrange(var_738862482821aad9, var_a824a799de1219c3);
    impulse = impulse + anglestoforward(var_7f51bb920d03d261) * randomfloatrange(var_bcfd5ca36fa3b723, var_256cb1561781b97d);
    return impulse;
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1643
// Size: 0x40
function decoy_isonground() {
    vel = decoy_getvelocity(self.origin);
    if (!isdefined(vel) || abs(vel[2]) <= 200) {
        if (decoy_isongroundraycastonly()) {
            return 1;
        }
    }
    return 0;
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x168b
// Size: 0x89
function decoy_isongroundraycastonly() {
    contents = namespace_2a184fc4902783dc::create_contents(0, 1, 0, 0, 1, 1);
    caststart = self.origin + (0, 0, 1);
    castend = caststart + (0, 0, -1) * 5;
    var_e021c2744cc7ed68 = physics_raycast(caststart, castend, contents, self, 0, "physicsquery_closest", 1);
    if (isdefined(var_e021c2744cc7ed68) && var_e021c2744cc7ed68.size > 0) {
        return 1;
    }
    return 0;
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x171c
// Size: 0x3a
function decoy_givepointsfordestroy(attacker, objweapon) {
    if (istrue(namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker))) {
        attacker notify("destroyed_equipment");
        attacker namespace_58a74e7d54b56e8d::givescoreforequipment(self, objweapon);
    }
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x175d
// Size: 0x36
function function_4ef2fc84cdc52176() {
    if (istrue(self.var_8bf83d28be4c2d4f.bundle.var_3c2f3b4105ab254c)) {
        return !istrue(self.var_8549d8b383189c34);
    }
    return function_87152dfc9a628684();
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x179b
// Size: 0x42
function function_8100d200f92c6518() {
    self endon("death");
    level endon("game_ended");
    self.owner endon("disconnect");
    var_a681b7890cd017c7 = spawnstruct();
    childthread function_3217c8851124ab5f(var_a681b7890cd017c7);
    self waittill("missile_impact");
    return var_a681b7890cd017c7;
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17e5
// Size: 0x40
function function_3217c8851124ab5f(var_a681b7890cd017c7) {
    self endon("missile_impact");
    stuckto = self waittill("missile_stuck");
    if (isdefined(stuckto)) {
        var_a681b7890cd017c7.stuckto = stuckto;
    }
    self notify("missile_impact");
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x182c
// Size: 0x45
function function_3576a1db2837369e(color) {
    /#
        self endon("destroyed_equipment");
        while (1) {
            thread namespace_d028276791d9cff6::drawsphere(self.origin, 2, level.framedurationseconds, color);
            wait(level.framedurationseconds);
        }
    #/
}

// Namespace decoy_grenade/namespace_85b18538a4f2be70
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1878
// Size: 0xb6
function function_2e44aa26dbb0cd3c() {
    /#
        self endon("destroyed_equipment");
        while (1) {
            vel = decoy_getvelocity(self.origin);
            if (isdefined(vel)) {
                speed = length(vel);
                if (speed != 0) {
                    var_9f243a3bda63e14a = vel / speed;
                    speed = clamp(speed, 0, 350);
                    var_b34cc5e74a23a75e = speed / 350;
                    thread namespace_d028276791d9cff6::drawline(self.origin, self.origin + var_9f243a3bda63e14a * var_b34cc5e74a23a75e * 25, level.framedurationseconds, (0, 0, 1));
                }
            }
            wait(level.framedurationseconds);
        }
    #/
}

