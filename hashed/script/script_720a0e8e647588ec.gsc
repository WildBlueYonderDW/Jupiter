// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_16ea1b94f0f381b3;
#using script_3b64eb40368c1450;
#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\spawnlogic.gsc;
#using script_38eb8f4be20d54f4;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\weaponrank.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\mp\utility\weapon.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_3f8889c16399185c;
#using script_2669878cf5a1b6bc;
#using scripts\cp_mp\utility\inventory_utility.gsc;

#namespace namespace_c5a3307389b271ae;

// Namespace namespace_c5a3307389b271ae/namespace_143053cbd5a5349c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a8
// Size: 0x48
function private onplayerconnect(params) {
    var_5c9f21448aa0c962 = getdvarint(@"hash_5e68ed857a17e11", 0);
    if (var_5c9f21448aa0c962 > 0) {
        level.dontendonscore = 1;
        if (!isbot(self)) {
            thread function_d579c78c2ac10132();
        }
    }
}

// Namespace namespace_c5a3307389b271ae/namespace_143053cbd5a5349c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1f7
// Size: 0x14
function private init() {
    callback::add("player_connect", &onplayerconnect);
}

// Namespace namespace_c5a3307389b271ae/namespace_143053cbd5a5349c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x212
// Size: 0xdb
function private function_d579c78c2ac10132() {
    self notify("player_rankup_loop_singleton");
    self endon("player_rankup_loop_singleton");
    level endon("game_ended");
    self endon("disconnect");
    level waittill("matchStartTimer_done");
    while (!isalive(self)) {
        wait(1);
    }
    thread function_f2d9a40693e59a95();
    while (0) {
        if (isalive(self)) {
            var_4a8f5643e919524 = self getcurrentweapon();
            if (function_e16bb69fe1ca890a(var_4a8f5643e919524)) {
                var_874ea2d44683fe55 = getweaponrootname(var_4a8f5643e919524);
                rank = function_37f14fd361bd3290(var_874ea2d44683fe55);
                var_d4c3f5da29696e6a = level.weaponranktable.maxweaponranks[var_874ea2d44683fe55];
                if (rank >= var_d4c3f5da29696e6a - 1) {
                    var_4a28b8d0d1e1c195 = function_8fd5629428f0752b();
                    if (!isdefined(var_4a28b8d0d1e1c195)) {
                        break;
                    }
                    _switchtoweapon(var_4a28b8d0d1e1c195);
                }
            }
        }
        wait(2);
    }
}

// Namespace namespace_c5a3307389b271ae/namespace_143053cbd5a5349c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f4
// Size: 0xb3
function private function_8fd5629428f0752b() {
    foreach (weap, rank in level.weaponranktable.maxweaponranks) {
        if (!isdefined(weap)) {
            continue;
        }
        rootweapon = getweaponrootname(weap);
        if (function_e16bb69fe1ca890a(rootweapon)) {
            rank = function_37f14fd361bd3290(rootweapon);
            var_d4c3f5da29696e6a = level.weaponranktable.maxweaponranks[rootweapon];
            if (rank < var_d4c3f5da29696e6a - 1) {
                return rootweapon;
            }
        }
    }
    return undefined;
}

// Namespace namespace_c5a3307389b271ae/namespace_143053cbd5a5349c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3af
// Size: 0x8d
function private _switchtoweapon(weap) {
    if (!isdefined(weap)) {
        return;
    }
    var_4a8f5643e919524 = self getcurrentweapon();
    var_874ea2d44683fe55 = getweaponrootname(var_4a8f5643e919524);
    namespace_df5cfdbe6e2d3812::_takeweapon(var_4a8f5643e919524);
    rootweapon = getweaponrootname(weap);
    weapon = buildweapon(rootweapon);
    self giveweapon(weapon);
    self setweaponammoclip(weapon, weaponclipsize(weapon));
    self setweaponammostock(weapon, weaponmaxammo(weapon));
    self switchtoweaponimmediate(weapon);
}

// Namespace namespace_c5a3307389b271ae/namespace_143053cbd5a5349c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x443
// Size: 0x42
function private function_604e6c056c7de43d() {
    self notify("player_shooting_loop");
    self endon("player_shooting_loop");
    level endon("game_ended");
    self endon("disconnect");
    while (1) {
        self startforcedfire();
        wait(0.2);
        self stopforcedfire();
        wait(0.2);
    }
}

// Namespace namespace_c5a3307389b271ae/namespace_143053cbd5a5349c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x48c
// Size: 0xd4
function private function_f2d9a40693e59a95() {
    self notify("player_aim_loop");
    self endon("player_aim_loop");
    level endon("game_ended");
    self endon("disconnect");
    targetpos = getdvarvector(@"hash_47b188962f53ea3b", (-2269, -705, 258));
    targetangles = getdvarvector(@"hash_4bd47ef19661c575", (0, 177, 0));
    while (1) {
        pos = self getorigin();
        angles = self getplayerangles();
        delta = distance(pos, targetpos);
        if (delta > 3) {
            pos = self setorigin(targetpos);
        }
        delta = distance(angles, targetangles);
        if (delta > 2) {
            pos = self setplayerangles(targetangles);
        }
        wait(10);
    }
}

// Namespace namespace_c5a3307389b271ae/namespace_143053cbd5a5349c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x567
// Size: 0x103
function private function_37f14fd361bd3290(weaponname) {
    var_32e9d6e2b27343b9 = self getplayerdata(level.loadoutdata, "squadMembers", "weapon_xp", weaponname);
    curxp = 0;
    foreach (elem in self.pers["weaponStats"]) {
        var_abe2391d33914bb2 = getweaponrootname(elem.weapon);
        if (var_abe2391d33914bb2 == weaponname && isdefined(elem.stats["xp_earned"])) {
            curxp = curxp + elem.stats["xp_earned"];
        }
    }
    var_1305bdce0015b2c = var_32e9d6e2b27343b9 + curxp;
    rank = getweaponrankforxp(var_1305bdce0015b2c);
    return rank;
}

// Namespace namespace_c5a3307389b271ae/namespace_143053cbd5a5349c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x672
// Size: 0x3e
function private function_e0b315bd88e9f0d5(weaponname) {
    if (isweapon(weaponname) && isnullweapon(weaponname)) {
        return 0;
    }
    if (isstring(weaponname) && weaponname == "none") {
        return 0;
    }
    return weaponname == "iw9_me_riotshield";
}

// Namespace namespace_c5a3307389b271ae/namespace_143053cbd5a5349c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6b8
// Size: 0x35
function private function_74011548c1c0e996(weaponname) {
    ismeleeweapon = isknifeonly(weaponname) || isakimbomeleeweapon(weaponname) || isaxeweapon(weaponname);
    return ismeleeweapon;
}

// Namespace namespace_c5a3307389b271ae/namespace_143053cbd5a5349c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6f5
// Size: 0x5d
function private function_e16bb69fe1ca890a(weapon) {
    if (!isdefined(weapon)) {
        return 0;
    }
    weaponname = undefined;
    if (isweapon(weapon)) {
        weaponname = getweaponrootname(weapon);
    } else {
        weaponname = weapon;
    }
    if (function_74011548c1c0e996(weaponname)) {
        return 0;
    }
    if (function_e0b315bd88e9f0d5(weaponname)) {
        return 0;
    }
    if (!weaponshouldgetxp(weaponname)) {
        return 0;
    }
    return 1;
}

