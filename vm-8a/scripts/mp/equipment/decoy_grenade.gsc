#using script_16ea1b94f0f381b3;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
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

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x302
// Size: 0x2
function decoy_init() {
    
}

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30c
// Size: 0x2d4
function decoy_used(grenade) {
    grenade endon("death");
    if (issharedfuncdefined(#"hash_d8976e21a6adafba", #"hash_ca0042e3cac99672")) {
        grenade [[ getsharedfunc(#"hash_d8976e21a6adafba", #"hash_ca0042e3cac99672") ]](grenade);
    }
    ref = namespace_4fb9dddfb8c1a67a::function_7f245729fcb6414d(grenade.weapon_name);
    grenade.tableinfo = namespace_4fb9dddfb8c1a67a::getequipmenttableinfo(ref);
    bundle = grenade.tableinfo.bundle;
    if (!isdefined(grenade.tableinfo.bundle)) {
        assertmsg("Decoy Grenade needs a bundle.");
    }
    if (istrue(bundle.var_f2f8c61e14fa90c5)) {
        if (!isdefined(self.decoys)) {
            self.decoys = [];
            callback::add("onPlayerSpawn_destroyEquipment", &function_f2f8c61e14fa90c5);
        }
        self.decoys[self.decoys.size] = grenade;
    }
    printgameaction("decoy grenade spawn", grenade.owner);
    grenade.playersdebuffed = [];
    grenade.decoyassists = 0;
    grenade namespace_b6b4a3ac458ab6e2::function_172d848d58051fdf(&function_9d529f508702dfe8);
    function_641996b5e113c5c6(grenade, &decoy_empapplied);
    thread scripts\mp\weapons::monitordisownedgrenade(self, grenade);
    if (istrue(bundle.var_92f375a60e3b214f)) {
        grenade allow_emp(0);
        wait 0.4;
        grenade allow_emp(1);
        decoymaxhealth = default_to(bundle.decoy_maxhealth, 19);
        grenade thread scripts\mp\damage::monitordamage(decoymaxhealth, "hitequip", &decoy_handlefataldamage, &decoy_handledamage);
        grenade thread decoy_monitorposition();
        wait 0.6;
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
            wait 0.2;
        }
    } else {
        stuckdata = grenade function_8100d200f92c6518();
        decoymaxhealth = default_to(bundle.decoy_maxhealth, 19);
        grenade thread scripts\mp\damage::monitordamage(decoymaxhealth, "hitequip", &decoy_handlefataldamage, &decoy_handledamage);
        armtime = default_to(bundle.var_8e21af8d205f8107, 0.5);
        wait armtime;
    }
    grenade thread decoy_monitorfuse();
    grenade thread decoy_activated();
}

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e8
// Size: 0x11d
function decoy_activated() {
    self endon("death");
    bundle = self.tableinfo.bundle;
    self setotherent(self.owner);
    if (self.weapon_name == "t10_decoy_grenade_mp") {
        self setscriptablepartstate("beacon", "t10Active", 0);
    } else {
        self setscriptablepartstate("beacon", "active", 0);
    }
    firetype = decoy_getfiretype();
    self.sequencedata = [];
    if (istrue(bundle.var_3c615c401a26ba90)) {
        self.sequencedata["footFallSoundsPlayedTime"] = undefined;
    }
    self notify("decoy_activated");
    scripts\cp_mp\challenges::function_b0f754c8a379154e("equip_decoy", self.owner, undefined, function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
    self notify("decoy_sequence_started", self.origin);
    while (true) {
        if (!istrue(self.isjammed)) {
            function_e089ba219ba4b6e9(firetype);
        }
        wait randomfloatrange(1.5, 3.5);
    }
}

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70d
// Size: 0x89
function function_e089ba219ba4b6e9(firetype) {
    bundle = self.tableinfo.bundle;
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

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79e
// Size: 0x33
function decoy_destroy() {
    self setscriptablepartstate("destroy", "active", 0);
    self setscriptablepartstate("beacon", "neutral", 0);
    thread decoy_delete(0.1);
}

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d9
// Size: 0x76
function decoy_delete(delay) {
    if (!isdefined(delay)) {
        delay = 0;
    }
    self notify("death");
    self.exploding = 1;
    function_83cebe0ae5318a7f(self);
    scripts\mp\damage::monitordamageend();
    wait delay;
    if (issharedfuncdefined(#"hash_d8976e21a6adafba", #"hash_c33ceb91d0ca7a9d")) {
        self [[ getsharedfunc(#"hash_d8976e21a6adafba", #"hash_c33ceb91d0ca7a9d") ]](self);
    }
    self delete();
}

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x857
// Size: 0x7c
function function_f2f8c61e14fa90c5(params) {
    if (isdefined(self.decoys)) {
        foreach (decoy in self.decoys) {
            if (isdefined(decoy)) {
                decoy decoy_destroy();
            }
        }
        self.decoys = [];
    }
}

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8db
// Size: 0x61
function decoy_firesequence(firetype) {
    firecount = 1 + randomint(firetype.var_88f7dabec7a7b3b1);
    while (true) {
        firecount--;
        decoy_fireevent(firetype);
        if (firecount == 0) {
            break;
        }
        wait randomfloatrange(firetype.var_4c90875a14ef20ce, firetype.var_3768c97bd2a961e8);
    }
}

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x944
// Size: 0x9c
function function_61daabf7ad718d7c() {
    self.playingfootsteps = 1;
    var_e62ac38633d5dad = function_100765fe9abe8d6d();
    stepcount = var_e62ac38633d5dad.var_6a2c0f46b832c6fa + randomint(var_e62ac38633d5dad.var_cf7d2640e0d98e84);
    while (true) {
        stepcount--;
        function_a7201449be7399ab(var_e62ac38633d5dad);
        if (stepcount == 0) {
            break;
        }
        wait randomfloatrange(var_e62ac38633d5dad.var_597caffb4585d369, var_e62ac38633d5dad.var_bcfbe97a5148e25b);
    }
    self.sequencedata["footFallSoundsPlayedTime"] = gettime();
    self.playingfootsteps = 0;
}

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e8
// Size: 0x113
function function_a7201449be7399ab(var_3c8b1cbfa325c448) {
    if (istrue(self.tableinfo.bundle.var_92f375a60e3b214f)) {
        origin = self.origin + (0, 0, 1.5);
        velocity = decoy_getvelocity(origin);
        angles = decoy_getfireeventangles(velocity);
        impulse = function_3d4031d0ff8cdb6(velocity, var_3c8b1cbfa325c448, angles);
        heldoffhand = self.owner getheldoffhand();
        if (!isdefined(heldoffhand) || function_f581838ce4328f7a(heldoffhand) != "frag_grenade") {
            self.owner scripts\mp\utility\weapon::_launchgrenade("decoy_grenade_mp", origin, impulse, 100, 1, self);
        }
        self setcandamage(1);
    }
    decoy_debuffenemiesinrange();
    var_10bd16c4adfe80d8 = var_3c8b1cbfa325c448.var_a3bdf3f3509252c9;
    self setscriptablepartstate(function_d08f9a08afaed2f5(), var_10bd16c4adfe80d8, 0);
    wait var_3c8b1cbfa325c448.var_635a91d2dd01551d;
}

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb03
// Size: 0x6f
function function_d08f9a08afaed2f5() {
    bundle = self.tableinfo.bundle;
    if (istrue(self.var_c99e4c450c908f1c)) {
        self.var_c99e4c450c908f1c = 0;
        return default_to(bundle.var_ed2d8117c9ed9ecb, "footFallPartA");
    }
    self.var_c99e4c450c908f1c = 1;
    return default_to(bundle.var_ed2d8217c9eda0fe, "footFallPartB");
}

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb7b
// Size: 0x15a
function decoy_fireevent(firetype) {
    if (istrue(self.tableinfo.bundle.var_92f375a60e3b214f)) {
        origin = self.origin + (0, 0, 1.5);
        velocity = decoy_getvelocity(origin);
        angles = decoy_getfireeventangles(velocity);
        impulse = decoy_getfireeventimpulse(velocity, firetype, angles);
        heldoffhand = self.owner getheldoffhand();
        if (!isdefined(heldoffhand) || function_f581838ce4328f7a(heldoffhand) != "frag_grenade") {
            self.owner scripts\mp\utility\weapon::_launchgrenade("decoy_grenade_mp", self.origin, impulse, 100, 1, self);
        }
        self setcandamage(1);
    }
    self setscriptablepartstate("beacon", "active", 0);
    self setscriptablepartstate("weaponFire", firetype.var_4c34cca2def2821a, 0);
    self setscriptablepartstate("weaponSounds", firetype.var_4c34cca2def2821a, 0);
    pinglocationenemyteams(self.origin, self.team, self.owner);
    decoy_debuffenemiesinrange(1);
    wait firetype.var_1d7ba3e3088449d;
}

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcdd
// Size: 0x31
function function_87152dfc9a628684() {
    if (!isdefined(self.sequencedata["footFallSoundsPlayedTime"])) {
        return true;
    }
    return gettime() - self.sequencedata["footFallSoundsPlayedTime"] > 2000;
}

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd17
// Size: 0x1c7
function decoy_debuffenemiesinrange(var_fce8828abf8327b) {
    var_617fcc52969f24b8 = default_to(self.tableinfo.bundle.var_77b64bf7dea3506b, 800);
    var_7e9c12829ca09ca7 = default_to(self.tableinfo.bundle.var_3b8cd7cf44335571, 2000);
    var_46f5efb8178285e9 = max(var_617fcc52969f24b8, var_7e9c12829ca09ca7);
    nearbyenemies = utility::function_98a826b6b6d0d118(self.origin, var_46f5efb8178285e9);
    currentrange = undefined;
    foreach (enemy in nearbyenemies) {
        if (isplayer(enemy) && !enemy scripts\cp_mp\utility\player_utility::_isalive()) {
            continue;
        }
        if (!istrue(scripts\cp_mp\utility\player_utility::playersareenemies(self.owner, enemy))) {
            continue;
        }
        if (isplayer(enemy)) {
            currentrange = distance(enemy.origin, self.origin);
            if (currentrange > var_617fcc52969f24b8) {
                continue;
            }
            thread decoy_debuffenemy(enemy);
        } else if (istrue(var_fce8828abf8327b)) {
            enemy aieventlistenerevent("gunshot", self, self.origin);
        } else {
            enemy aieventlistenerevent("decoy_grenade", self, self.origin);
        }
        if (isplayer(self.owner)) {
            self.owner scripts\mp\damage::combatrecordtacticalstat("equip_decoy");
            self.owner scripts\mp\utility\stats::incpersstat("decoyHits", 1);
        }
    }
}

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xee6
// Size: 0x179
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
    result = player scripts\engine\utility::waittill_notify_or_timeout_return("death", 5);
    self.playersdebuffed[player getentitynumber()] = undefined;
    if (isdefined(player.lastkilledby) && player.lastkilledby != owner) {
        if (result == "death" && istrue(scripts\cp_mp\utility\player_utility::playersareenemies(player, owner))) {
            if (!istrue(self.tableinfo.bundle.var_b20a3c4b142951e7) || self.decoyassists < (isdefined(self.tableinfo.bundle.var_dcc444b82ee2ea4a) ? self.tableinfo.bundle.var_dcc444b82ee2ea4a : 3)) {
                owner thread scripts\mp\utility\points::doScoreEvent(#"assist_decoy");
                self.decoyassists++;
            }
        }
    }
}

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1067
// Size: 0x30
function decoy_monitorposition() {
    self endon("death");
    while (true) {
        oldposition = self.origin;
        waitframe();
        self.oldposition = oldposition;
    }
}

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x109f
// Size: 0x43
function decoy_monitorfuse() {
    self endon("death");
    decoyduration = default_to(self.tableinfo.bundle.var_e4ce5a32b20aca32, 15);
    wait decoyduration;
    thread decoy_destroy();
}

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ea
// Size: 0x4e
function decoy_empapplied(empstruct) {
    self notify("enemy_destroyed_equipment", empstruct.attacker);
    empstruct.victim decoy_givepointsfordestroy(empstruct.attacker);
    empstruct.victim thread decoy_destroy();
}

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1140
// Size: 0x3b
function function_9d529f508702dfe8(data) {
    data.victim decoy_givepointsfordestroy(data.attacker);
    data.victim thread decoy_destroy();
}

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1183
// Size: 0x47
function decoy_handledamage(data) {
    scripts\mp\weapons::equipmenthit(self.owner, data.attacker, data.objweapon, data.meansofdeath);
    return data.damage;
}

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11d3
// Size: 0x43
function decoy_handlefataldamage(data) {
    self notify("enemy_destroyed_equipment", data.attacker);
    decoy_givepointsfordestroy(data.attacker, data.objweapon);
    thread decoy_destroy();
}

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x121e
// Size: 0xa6
function function_100765fe9abe8d6d() {
    totalweightvalue = 0;
    maxweightvalues = [];
    var_4bb47473cc0e8dc1 = self.tableinfo.bundle.var_5f1da0fe731d593e;
    if (!isdefined(var_4bb47473cc0e8dc1)) {
        return undefined;
    }
    for (i = 0; i < var_4bb47473cc0e8dc1.size; i++) {
        totalweightvalue += var_4bb47473cc0e8dc1[i].var_90b63d94c68dade5;
        maxweightvalues[i] = totalweightvalue;
    }
    weightvalue = randomint(totalweightvalue);
    for (i = 0; i < maxweightvalues.size; i++) {
        if (weightvalue < maxweightvalues[i]) {
            return var_4bb47473cc0e8dc1[i];
        }
    }
    return undefined;
}

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12cd
// Size: 0xd3
function decoy_getfiretype() {
    /#
        dvarfiretype = getdvar(@"hash_621c6f1da92a54d5", "<dev string:x1c>");
        if (dvarfiretype != "<dev string:x1c>") {
            return dvarfiretype;
        }
    #/
    totalweightvalue = 0;
    maxweightvalues = [];
    firetypes = self.tableinfo.bundle.var_d9f404803ed8ba5;
    if (!isdefined(firetypes)) {
        return undefined;
    }
    for (i = 0; i < firetypes.size; i++) {
        totalweightvalue += firetypes[i].var_f7dff98a85f6c2cc;
        maxweightvalues[i] = totalweightvalue;
    }
    weightvalue = randomint(totalweightvalue);
    for (i = 0; i < maxweightvalues.size; i++) {
        if (weightvalue < maxweightvalues[i]) {
            return firetypes[i];
        }
    }
    return undefined;
}

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a9
// Size: 0x2f
function decoy_getvelocity(origin) {
    if (!isdefined(self.oldposition)) {
        return undefined;
    }
    return (origin - self.oldposition) / level.framedurationseconds;
}

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e1
// Size: 0xc5
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
        yaw += angleclamp(-30 + randomint(61));
        angles = (angles[0], yaw, angles[2]);
    }
    return angles;
}

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14af
// Size: 0xc1
function decoy_getfireeventimpulse(velocity, firetype, fireangles) {
    var_738862482821aad9 = default_to(firetype.var_c67aa30b2d6cf40c, 0);
    var_a824a799de1219c3 = default_to(firetype.var_f1e7b4bc211c9fae, 0);
    var_bcfd5ca36fa3b723 = default_to(firetype.var_a83b60306fb524ac, 0);
    var_256cb1561781b97d = default_to(firetype.var_c41faee37562060e, 0);
    impulse = velocity;
    impulse += anglestoup(fireangles) * randomfloatrange(var_738862482821aad9, var_a824a799de1219c3);
    impulse += anglestoforward(fireangles) * randomfloatrange(var_bcfd5ca36fa3b723, var_256cb1561781b97d);
    return impulse;
}

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1579
// Size: 0xc1
function function_3d4031d0ff8cdb6(velocity, var_3c8b1cbfa325c448, fireangles) {
    var_738862482821aad9 = default_to(var_3c8b1cbfa325c448.var_ef5c03d1ea3bfa59, 0);
    var_a824a799de1219c3 = default_to(var_3c8b1cbfa325c448.var_23f84923a02c6943, 0);
    var_bcfd5ca36fa3b723 = default_to(var_3c8b1cbfa325c448.var_63edec7b060e35a3, 0);
    var_256cb1561781b97d = default_to(var_3c8b1cbfa325c448.var_cc5d412dadec37fd, 0);
    impulse = velocity;
    impulse += anglestoup(fireangles) * randomfloatrange(var_738862482821aad9, var_a824a799de1219c3);
    impulse += anglestoforward(fireangles) * randomfloatrange(var_bcfd5ca36fa3b723, var_256cb1561781b97d);
    return impulse;
}

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1643
// Size: 0x3f
function decoy_isonground() {
    vel = decoy_getvelocity(self.origin);
    if (!isdefined(vel) || abs(vel[2]) <= 200) {
        if (decoy_isongroundraycastonly()) {
            return true;
        }
    }
    return false;
}

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x168b
// Size: 0x88
function decoy_isongroundraycastonly() {
    contents = scripts\engine\trace::create_contents(0, 1, 0, 0, 1, 1);
    caststart = self.origin + (0, 0, 1);
    castend = caststart + (0, 0, -1) * 5;
    castresults = physics_raycast(caststart, castend, contents, self, 0, "physicsquery_closest", 1);
    if (isdefined(castresults) && castresults.size > 0) {
        return true;
    }
    return false;
}

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x171c
// Size: 0x39
function decoy_givepointsfordestroy(attacker, objweapon) {
    if (istrue(scripts\cp_mp\utility\player_utility::playersareenemies(self.owner, attacker))) {
        attacker notify("destroyed_equipment");
        attacker scripts\mp\killstreaks\killstreaks::givescoreforequipment(self, objweapon);
    }
}

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x175d
// Size: 0x35
function function_4ef2fc84cdc52176() {
    if (istrue(self.tableinfo.bundle.var_3c2f3b4105ab254c)) {
        return !istrue(self.playingfootsteps);
    }
    return function_87152dfc9a628684();
}

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x179b
// Size: 0x41
function function_8100d200f92c6518() {
    self endon("death");
    level endon("game_ended");
    self.owner endon("disconnect");
    stuckdata = spawnstruct();
    childthread function_3217c8851124ab5f(stuckdata);
    self waittill("missile_impact");
    return stuckdata;
}

// Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17e5
// Size: 0x3f
function function_3217c8851124ab5f(stuckdata) {
    self endon("missile_impact");
    stuckto = self waittill("missile_stuck");
    if (isdefined(stuckto)) {
        stuckdata.stuckto = stuckto;
    }
    self notify("missile_impact");
}

/#

    // Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x182c
    // Size: 0x44
    function function_3576a1db2837369e(color) {
        self endon("<dev string:x1d>");
        while (true) {
            thread scripts\mp\utility\debug::drawsphere(self.origin, 2, level.framedurationseconds, color);
            wait level.framedurationseconds;
        }
    }

    // Namespace decoy_grenade / scripts\mp\equipment\decoy_grenade
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1878
    // Size: 0xb5
    function function_2e44aa26dbb0cd3c() {
        self endon("<dev string:x1d>");
        while (true) {
            vel = decoy_getvelocity(self.origin);
            if (isdefined(vel)) {
                speed = length(vel);
                if (speed != 0) {
                    velnorm = vel / speed;
                    speed = clamp(speed, 0, 350);
                    lineratio = speed / 350;
                    thread scripts\mp\utility\debug::drawline(self.origin, self.origin + velnorm * lineratio * 25, level.framedurationseconds, (0, 0, 1));
                }
            }
            wait level.framedurationseconds;
        }
    }

#/
