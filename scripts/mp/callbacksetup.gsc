// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using script_439fa02b5251fa5b;
#using script_4a6760982b403bad;
#using scripts\common\vehicle.gsc;

#namespace namespace_5d8e4effaf93a63f;

// Namespace namespace_5d8e4effaf93a63f/namespace_f5624e0046cb228a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x160
// Size: 0x54
function codecallback_startgametype() {
    if (getdvar(@"hash_e6afce2cf5cf7515") == "1") {
        level waittill("eternity");
    }
    if (!isdefined(level.gametypestarted) || !level.gametypestarted) {
        [[ level.callbackstartgametype ]]();
        level.gametypestarted = 1;
    }
}

// Namespace namespace_5d8e4effaf93a63f/namespace_f5624e0046cb228a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bb
// Size: 0x42
function codecallback_playeractive() {
    if (getdvar(@"hash_e6afce2cf5cf7515") == "1") {
        level waittill("eternity");
    }
    self endon("disconnect");
    if (isdefined(level.callbackplayeractive)) {
        [[ level.callbackplayeractive ]]();
    }
}

// Namespace namespace_5d8e4effaf93a63f/namespace_f5624e0046cb228a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x204
// Size: 0x41
function codecallback_playerconnect() {
    if (getdvar(@"hash_e6afce2cf5cf7515") == "1") {
        level waittill("eternity");
    }
    self endon("disconnect");
    [[ level.callbackplayerconnect ]]();
    callback::callback("player_connect");
}

// Namespace namespace_5d8e4effaf93a63f/namespace_f5624e0046cb228a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24c
// Size: 0xb6
function codecallback_playerdisconnect(reason) {
    self notify("disconnect");
    self notify("death_or_disconnect");
    self.isdisconnecting = 1;
    var_f325fe524d4336b = self function_3b6bbfec65cc4ee3();
    if (var_f325fe524d4336b) {
        var_16c2d930984f2fef = self isreloading();
        if (var_16c2d930984f2fef) {
            var_5814d27874b48e54 = spawnstruct();
            var_5814d27874b48e54.player = self;
            var_5814d27874b48e54.var_c739ba1eb6635b73 = getsystemtimeinmicroseconds();
            var_5814d27874b48e54.var_c198f7ca473378fb = "DISCONNECT";
            namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_reload_cancel", var_5814d27874b48e54);
        }
    }
    [[ level.callbackplayerdisconnect ]](reason);
    callback::callback("player_disconnect");
}

// Namespace namespace_5d8e4effaf93a63f/namespace_f5624e0046cb228a
// Params 15, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x309
// Size: 0xc5
function codecallback_playerdamage(einflictor, eattacker, idamage, idflags, smeansofdeath, var_d7bc24cd73dfc712, objweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, var_b0fc59ff15058522, var_be4285b26ed99ab1) {
    self endon("disconnect");
    if (isdefined(level.weaponmapfunc)) {
        objweapon = [[ level.weaponmapfunc ]](objweapon, einflictor);
    }
    [[ level.callbackplayerdamage ]](einflictor, eattacker, idamage, idflags, smeansofdeath, var_d7bc24cd73dfc712, objweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, var_b0fc59ff15058522, var_be4285b26ed99ab1);
}

// Namespace namespace_5d8e4effaf93a63f/namespace_f5624e0046cb228a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d5
// Size: 0x73
function codecallback_playerfinishweaponchange(var_492b944276064f63, var_82533969b4683de4) {
    self endon("disconnect");
    if (isdefined(level.weaponmapfunc)) {
        [[ level.weaponmapfunc ]](var_492b944276064f63);
        [[ level.weaponmapfunc ]](var_82533969b4683de4);
    }
    if (isdefined(level.callbackfinishweaponchange)) {
        [[ level.callbackfinishweaponchange ]](var_82533969b4683de4, var_492b944276064f63, var_82533969b4683de4.isalternate, var_492b944276064f63.isalternate);
    }
}

// Namespace namespace_5d8e4effaf93a63f/namespace_f5624e0046cb228a
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44f
// Size: 0x7c
function codecallback_playerimpaled(eattacker, objweapon, var_f98a651c69c13cba, vpoint, vdir, shitloc, var_920ff4456ce9a2fc, var_19f6f25777706f34) {
    self endon("disconnect");
    if (isdefined(level.weaponmapfunc)) {
        [[ level.weaponmapfunc ]](objweapon);
    }
    [[ level.callbackplayerimpaled ]](eattacker, objweapon, var_f98a651c69c13cba, vpoint, vdir, shitloc, var_920ff4456ce9a2fc, var_19f6f25777706f34);
}

// Namespace namespace_5d8e4effaf93a63f/namespace_f5624e0046cb228a
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d2
// Size: 0x91
function codecallback_playerkilled(einflictor, eattacker, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, timeoffset, deathanimduration) {
    self endon("disconnect");
    if (isdefined(level.weaponmapfunc)) {
        [[ level.weaponmapfunc ]](objweapon, einflictor);
    }
    [[ level.callbackplayerkilled ]](einflictor, eattacker, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, timeoffset, deathanimduration);
}

// Namespace namespace_5d8e4effaf93a63f/namespace_f5624e0046cb228a
// Params 14, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56a
// Size: 0x1b8
function codecallback_vehicledamage(inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, var_799f234362adb813, partname, eventid) {
    partname = namespace_dbbb37eb352edf96::function_8ed0ffa3f8be7c75(partname);
    var_799f234362adb813 = namespace_dbbb37eb352edf96::function_8ed0ffa3f8be7c75(var_799f234362adb813);
    if (isdefined(self.nullownerdamagefunc)) {
        var_4111acfb7f567d31 = [[ self.nullownerdamagefunc ]](attacker);
        if (isdefined(var_4111acfb7f567d31) && var_4111acfb7f567d31) {
            return;
        }
    }
    if (isdefined(level.weaponmapfunc)) {
        objweapon = [[ level.weaponmapfunc ]](objweapon, inflictor);
    }
    if (isdefined(self.var_e913079a5ffda56d)) {
        damage = getmodifieddamageusingdamagetuning(attacker, objweapon, meansofdeath, damage, self.maxhealth, self.var_e913079a5ffda56d);
    }
    if (isdefined(self.damagecallback)) {
        self [[ self.damagecallback ]](inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, var_799f234362adb813, partname, eventid);
    } else if (isdefined(level.vehicles) && isdefined(level.vehicles.damagecallback) && isdefined(self.vehiclename)) {
        self [[ level.vehicles.damagecallback ]](inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, var_799f234362adb813, partname, eventid);
    } else {
        self vehicle_finishdamage(inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, var_799f234362adb813, partname);
    }
}

// Namespace namespace_5d8e4effaf93a63f/namespace_f5624e0046cb228a
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x729
// Size: 0xee
function codecallback_playerlaststand(einflictor, eattacker, idamage, smeansofdeath, objweapon, vdir, shitloc, timeoffset, deathanimduration) {
    self endon("disconnect");
    if (isdefined(self.perks) && (isdefined(self.perks["specialty_pistoldeath"]) || isdefined(self.perks["specialty_survivor"]))) {
        if (isdefined(level.weaponmapfunc)) {
            [[ level.weaponmapfunc ]](objweapon, einflictor);
        }
        return [[ level.callbackplayerlaststand ]](einflictor, eattacker, idamage, smeansofdeath, objweapon, vdir, shitloc, timeoffset, deathanimduration);
    } else {
        if (isdefined(eattacker) && isdefined(eattacker.team)) {
            level notify("down_enemy_laststand_" + eattacker.team, eattacker);
        }
        return 0;
    }
}

// Namespace namespace_5d8e4effaf93a63f/namespace_f5624e0046cb228a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81e
// Size: 0x26
function codecallback_spawnpointsprecalc(team) {
    if (isdefined(level.callbackspawnpointprecalc)) {
        [[ level.callbackspawnpointprecalc ]](team);
    }
}

// Namespace namespace_5d8e4effaf93a63f/namespace_f5624e0046cb228a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84b
// Size: 0x3d
function codecallback_spawnpointscore(player, spawnpoint, team) {
    if (isdefined(level.callbackspawnpointscore)) {
        return player [[ level.callbackspawnpointscore ]](spawnpoint, team);
    }
    return 0;
}

// Namespace namespace_5d8e4effaf93a63f/namespace_f5624e0046cb228a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x890
// Size: 0x71
function codecallback_spawnpointcritscore(player, spawnpoint, team) {
    result = "primary";
    if (isdefined(level.callbackspawnpointcritscore)) {
        result = player [[ level.callbackspawnpointcritscore ]](spawnpoint, team);
    }
    if (result == "primary") {
        return 100;
    } else if (result == "secondary") {
        return 50;
    }
    return 0;
}

// Namespace namespace_5d8e4effaf93a63f/namespace_f5624e0046cb228a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x909
// Size: 0x16
function codecallback_playermigrated() {
    self endon("disconnect");
    [[ level.callbackplayermigrated ]]();
}

// Namespace namespace_5d8e4effaf93a63f/namespace_f5624e0046cb228a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x926
// Size: 0xf
function codecallback_hostmigration() {
    [[ level.callbackhostmigration ]]();
}

// Namespace namespace_5d8e4effaf93a63f/namespace_f5624e0046cb228a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x93c
// Size: 0x35
function function_99f3c84cf3b7ceb8() {
    if (getdvar(@"hash_e6afce2cf5cf7515") == "1") {
        level waittill("eternity");
    }
    self endon("disconnect");
    [[ level.var_42d9b617bbca6a42 ]]();
}

// Namespace namespace_5d8e4effaf93a63f/namespace_f5624e0046cb228a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x978
// Size: 0x21
function function_dbf77b841cfb8d59(reason) {
    self notify("disconnectmayrejoin");
    [[ level.var_935c97aa3757676f ]](reason);
}

// Namespace namespace_5d8e4effaf93a63f/namespace_f5624e0046cb228a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a0
// Size: 0x22
function function_c305fc8bed32b81e(var_4b86a4e17c656399, var_534bd24a37e5d78a) {
    [[ level.var_cda3af1f73639c7c ]](var_4b86a4e17c656399, var_534bd24a37e5d78a);
}

// Namespace namespace_5d8e4effaf93a63f/namespace_f5624e0046cb228a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9c9
// Size: 0x44
function function_493bb22764bc865() {
    if (!isdefined(level.var_f162a4362b2b7718)) {
        return 0;
    }
    /#
        assert(isdefined(level.var_f162a4362b2b7718.var_f189ca4555aa689e));
    #/
    return [[ level.var_f162a4362b2b7718.var_f189ca4555aa689e ]]();
}

// Namespace namespace_5d8e4effaf93a63f/namespace_f5624e0046cb228a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa15
// Size: 0x19
function function_216b4c739c8bf413() {
    [[ level.var_f162a4362b2b7718.var_c214b782db6525f ]]();
}

// Namespace namespace_5d8e4effaf93a63f/namespace_f5624e0046cb228a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa35
// Size: 0x19
function function_c45c947888c3a913() {
    [[ level.var_f162a4362b2b7718.var_205cb63b80da5b ]]();
}

// Namespace namespace_5d8e4effaf93a63f/namespace_f5624e0046cb228a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa55
// Size: 0xd4
function abortlevel() {
    /#
        println("<unknown string>");
    #/
    level.callbackstartgametype = &callbackvoid;
    level.callbackplayeractive = &callbackvoid;
    level.callbackplayerconnect = &callbackvoid;
    level.callbackplayerdisconnect = &callbackvoid;
    level.callbackplayerdamage = &callbackvoid;
    level.callbackplayerimpaled = &callbackvoid;
    level.callbackplayerkilled = &callbackvoid;
    level.callbackplayerlaststand = &callbackvoid;
    level.callbackplayermigrated = &callbackvoid;
    level.callbackhostmigration = &callbackvoid;
    level.var_42d9b617bbca6a42 = &callbackvoid;
    level.var_935c97aa3757676f = &callbackvoid;
    setdvar(@"hash_8fe3271cd74f65a2", "dm");
    exitlevel(0);
}

// Namespace namespace_5d8e4effaf93a63f/namespace_f5624e0046cb228a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb30
// Size: 0x3
function callbackvoid() {
    
}

