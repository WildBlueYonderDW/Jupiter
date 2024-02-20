// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\stealth\utility.gsc;

#namespace utility;

// Namespace utility/namespace_4d62562249d2171e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x24e
// Size: 0x20
function function_a464c293616a3a6(debug_string) {
    /#
        if (!function_e39a555170607456()) {
            return;
        }
        iprintln(debug_string);
    #/
}

// Namespace utility/namespace_4d62562249d2171e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x275
// Size: 0x18
function function_e39a555170607456() {
    /#
        return getdvarint(@"hash_6d78d3cf7d56cdd5", 0) != 0;
    #/
}

// Namespace utility/namespace_4d62562249d2171e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x294
// Size: 0x2a
function function_f9dd1250ea99d251(val) {
    if (isplayer(self)) {
        function_50c9c1c52c852f54(val);
    } else {
        self.attackeraccuracy = val;
    }
}

// Namespace utility/namespace_4d62562249d2171e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c5
// Size: 0x3d
function function_50c9c1c52c852f54(val) {
    self.scriptedattackeraccuracy = val;
    if (namespace_3c37cb17ade254d::issharedfuncdefined("gameskill", "updatePlayerAttackerAccuracy")) {
        self [[ namespace_3c37cb17ade254d::getsharedfunc("gameskill", "updatePlayerAttackerAccuracy") ]]();
    }
}

// Namespace utility/namespace_4d62562249d2171e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x309
// Size: 0x33
function function_ed5b4517dc3fa185() {
    perkname = "specialty_sixth_sense";
    return isdefined(perkname) && isdefined(self.perks) && isdefined(self.perks[perkname]);
}

// Namespace utility/namespace_4d62562249d2171e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x344
// Size: 0x33
function function_7043a32c6ff5835a() {
    perkname = "specialty_ai_stealth_sixth_sense";
    return isdefined(perkname) && isdefined(self.perks) && isdefined(self.perks[perkname]);
}

// Namespace utility/namespace_4d62562249d2171e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37f
// Size: 0x17
function function_e33c1a98de731caf() {
    if (namespace_36f464722d326bbe::function_42e2dcfd4571b89b()) {
        return "all";
    }
    return "bad_guys";
}

// Namespace utility/namespace_4d62562249d2171e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39e
// Size: 0x50e
function function_7f12653d04730492() {
    var_1572384ef9f3dbe2 = 1;
    if (getdvarint(@"hash_4096753656b86302", 0)) {
        var_1572384ef9f3dbe2 = 0;
    }
    if (flag("stealth_spotted") && var_1572384ef9f3dbe2) {
        foreach (guy in level.players) {
            guy setclientomnvar("ui_ai_stealth_edge_glow", 0);
        }
        return;
    }
    var_fbcabd62b8f66eb8 = namespace_2a184fc4902783dc::create_default_contents(1);
    var_c0269881cb3b186 = 0;
    /#
        var_c0269881cb3b186 = getdvarint(@"hash_3a87475a75de0350") == 1;
    #/
    var_7a25ddb41e7358db = undefined;
    var_746071ab06f38fd = undefined;
    foreach (num, player in level.var_97068503cee0ee88) {
        if (!isdefined(player)) {
            level.var_97068503cee0ee88[num] = undefined;
            break;
        }
        if (istrue(player.ignoreme) || istrue(player.notarget)) {
            continue;
        }
        player.process = 0;
        var_75abbf0830c5d3fa = 0;
        var_f9bc699768a98866 = 0;
        playerpos = player geteye();
        playerteam = player.team;
        var_10e9894dc0eb9765 = anglestoforward(player getplayerangles());
        foreach (otherplayer in getaiarray(function_e33c1a98de731caf())) {
            if (player.process >= 25) {
                player.process = 0;
                waitframe();
            }
            if (!isdefined(player)) {
                level.var_97068503cee0ee88[num] = undefined;
                break;
            }
            if (!player function_ed5b4517dc3fa185() && !player function_7043a32c6ff5835a()) {
                continue;
            }
            if (istrue(player.ignoreme) || istrue(player.notarget)) {
                continue;
            }
            if (!player namespace_f8065cafc523dba5::_isalive()) {
                continue;
            }
            if (!isdefined(otherplayer)) {
                continue;
            }
            if (!isdefined(otherplayer.stealth)) {
                continue;
            }
            if (!otherplayer namespace_f8065cafc523dba5::_isalive()) {
                continue;
            }
            if (istrue(otherplayer.ignoreall)) {
                continue;
            }
            if (otherplayer.team == playerteam) {
                continue;
            }
            if (distancesquared(otherplayer.origin, playerpos) > 16000000) {
                continue;
            }
            if (!otherplayer function_830f660f7a75ee82(player)) {
                continue;
            }
            player.process++;
            if (!otherplayer cansee(player)) {
                continue;
            }
            var_f5aa6039efdcff26 = otherplayer geteye();
            var_ed6e173aa5e562a5 = anglestoforward(otherplayer getplayerangles());
            var_577d4bc399877ae4 = playerpos - var_f5aa6039efdcff26;
            var_7a25ddb41e7358db = var_f5aa6039efdcff26 - playerpos;
            dot = vectordot(var_10e9894dc0eb9765, vectornormalize(var_7a25ddb41e7358db));
            player.process = player.process + 2;
            var_75abbf0830c5d3fa = var_75abbf0830c5d3fa | player function_9af348cfa1145f9c(otherplayer);
            if (otherplayer namespace_e124d8b75dab4be0::function_6a86dd83c01f8faa() && !isdefined(otherplayer.var_bb5d687f2f98454a)) {
                var_f9bc699768a98866 = var_f9bc699768a98866 | player function_9af348cfa1145f9c(otherplayer);
                if (var_f9bc699768a98866 > 0) {
                    if (!isdefined(player.var_80221e9c5627503a)) {
                        player.var_80221e9c5627503a = gettime();
                    }
                    if (gettime() >= player.var_80221e9c5627503a) {
                        player.var_80221e9c5627503a = gettime() + 5000;
                    }
                }
            } else {
                if (isdefined(level.var_28c0d60e971ff699)) {
                    var_451b85725d725ac9 = [0:"left", 1:"right", 2:"lower", 3:"upper"];
                    foreach (dir in var_451b85725d725ac9) {
                        active = function_d075e24b4fdf7c87(dir, var_75abbf0830c5d3fa);
                        spotted = function_d075e24b4fdf7c87(dir, var_f9bc699768a98866);
                        player function_6186bf9e7a357a3e(dir, active, spotted, var_75abbf0830c5d3fa, var_f9bc699768a98866);
                        player thread [[ level.var_28c0d60e971ff699 ]](dir, active, spotted);
                    }
                }
                break;
            }
        }
        if (var_1572384ef9f3dbe2) {
            player function_39af3dff662a71d0(var_75abbf0830c5d3fa);
        }
    }
}

// Namespace utility/namespace_4d62562249d2171e
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b3
// Size: 0xec
function function_6186bf9e7a357a3e(dir, active, spotted, var_75abbf0830c5d3fa, var_f9bc699768a98866) {
    if (var_75abbf0830c5d3fa > 0) {
        if (var_f9bc699768a98866 == 0 && function_eac0cd99c9c6d8ee() != "spotted") {
            if (!isdefined(self.var_33df676309c77fc4)) {
                self.var_33df676309c77fc4 = gettime();
            }
            if (gettime() >= self.var_33df676309c77fc4) {
                self.var_33df676309c77fc4 = gettime() + 5000;
                self playlocalsound("ui_stealth_threat_hud_periph_vision");
            }
        }
    }
    if (var_f9bc699768a98866 > 0 || istrue(spotted) || function_eac0cd99c9c6d8ee() == "spotted") {
        if (!isdefined(self.var_80221e9c5627503a)) {
            self.var_80221e9c5627503a = gettime();
        }
        if (gettime() >= self.var_80221e9c5627503a) {
            self.var_80221e9c5627503a = gettime() + 5000;
        }
    }
}

// Namespace utility/namespace_4d62562249d2171e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a6
// Size: 0x10f
function function_d075e24b4fdf7c87(dir, mask) {
    var_91c0d90230d51049 = [];
    switch (dir) {
    case #"hash_c9b3133a17a3b2d0":
        var_91c0d90230d51049 = [0:128, 1:32];
        break;
    case #"hash_96815ce4f2a3dbc5":
        var_91c0d90230d51049 = [0:64, 1:8];
        break;
    case #"hash_1e6b44ab584b8527":
        var_91c0d90230d51049 = [0:4, 1:2, 2:1];
        break;
    case #"hash_c325f7340a63499a":
        var_91c0d90230d51049 = [0:16];
        break;
    default:
        /#
            assertmsg("SIXTH SENSE: Unrecognized direction " + dir);
        #/
        break;
    }
    foreach (constvalue in var_91c0d90230d51049) {
        if (mask & constvalue) {
            return 1;
        }
    }
    return 0;
}

// Namespace utility/namespace_4d62562249d2171e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xabd
// Size: 0x8f
function function_df271fffca002529(weapon) {
    if (isweapon(weapon) && isnullweapon(weapon)) {
        return "other";
    }
    if (isstring(weapon) && (weapon == "none" || weapon == "alt_none")) {
        return "other";
    }
    rootname = getweaponrootname(weapon);
    group = weapongroupmap(rootname);
    if (!isdefined(group)) {
        if (iskillstreakweapon(weapon)) {
            group = "killstreak";
        } else {
            group = "other";
        }
    }
    return group;
}

// Namespace utility/namespace_4d62562249d2171e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb54
// Size: 0xfa
function function_830f660f7a75ee82(player) {
    if (istrue(self.juggernaut)) {
        return 1;
    }
    if (isdefined(self.unittype) && self.unittype == "suicidebomber") {
        return 1;
    }
    objweapon = self.weapon;
    var_cf4209c200f8bbf4 = function_df271fffca002529(objweapon);
    switch (var_cf4209c200f8bbf4) {
    case #"hash_bef5ec0b3e197ae":
    case #"hash_47368bc0d2ef1565":
    case #"hash_8af0086b038622b5":
    case #"hash_9d18adab1b65a661":
    case #"hash_ab10f9c080fe4faf":
    case #"hash_c095d67337b1f5a1":
    case #"hash_dd616da0b395a0b0":
        return 1;
    case #"hash_16cf6289ab06bd30":
        if (distancesquared(self.origin, player.origin) > 160000) {
            return 1;
        }
        break;
    }
    return 0;
}

// Namespace utility/namespace_4d62562249d2171e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc56
// Size: 0x1d
function function_a5ff5e1965faf40e() {
    level.var_97068503cee0ee88 = [];
    while (1) {
        waitframe();
        function_7f12653d04730492();
    }
}

// Namespace utility/namespace_4d62562249d2171e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc7a
// Size: 0x3d
function function_378625a93d79fdc2() {
    self.var_27e6cfd1a20ca927 = 0;
    self.var_de2a54afecc91d1 = 0;
    function_39af3dff662a71d0(0);
    playernum = self getentitynumber();
    level.var_97068503cee0ee88[playernum] = self;
}

// Namespace utility/namespace_4d62562249d2171e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcbe
// Size: 0x4d
function function_1a4d7090fc81e97() {
    function_39af3dff662a71d0(0);
    self.var_27e6cfd1a20ca927 = undefined;
    self.var_de2a54afecc91d1 = undefined;
    self.var_1e85d2f7fb6bd099 = undefined;
    self notify("removeSixthSense");
    playernum = self getentitynumber();
    level.var_97068503cee0ee88[playernum] = undefined;
}

// Namespace utility/namespace_4d62562249d2171e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd12
// Size: 0x19
function function_39af3dff662a71d0(var_75abbf0830c5d3fa) {
    self setclientomnvar("ui_ai_stealth_edge_glow", var_75abbf0830c5d3fa);
}

// Namespace utility/namespace_4d62562249d2171e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd32
// Size: 0x13e
function function_9af348cfa1145f9c(enemy) {
    forward = anglestoforward(self getplayerangles());
    forward2d = (forward[0], forward[1], forward[2]);
    forward2d = vectornormalize(forward2d);
    toenemy = enemy.origin - self.origin;
    var_4720fae3929bbdba = (toenemy[0], toenemy[1], toenemy[2]);
    var_4720fae3929bbdba = vectornormalize(var_4720fae3929bbdba);
    dot = vectordot(forward2d, var_4720fae3929bbdba);
    if (dot >= 0.92388) {
        return 2;
    } else if (dot >= 0.5) {
        return ter_op(isleft2d(self.origin, forward2d, enemy.origin), 4, 1);
    } else if (dot >= 0.5) {
        return ter_op(isleft2d(self.origin, forward2d, enemy.origin), 128, 64);
    } else if (dot >= -0.707107) {
        return ter_op(isleft2d(self.origin, forward2d, enemy.origin), 32, 8);
    } else {
        return 16;
    }
}

