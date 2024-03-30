// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_16ea1b94f0f381b3;
#using scripts\common\values.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\common\devgui.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\weaponrank.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_3f8889c16399185c;
#using script_2669878cf5a1b6bc;
#using scripts\cp_mp\utility\inventory_utility.gsc;

#namespace rankup;

// Namespace rankup / namespace_143053cbd5a5349c
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

// Namespace rankup / namespace_143053cbd5a5349c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1f7
// Size: 0x14
function private init() {
    callback::add("player_connect", &onplayerconnect);
}

// Namespace rankup / namespace_143053cbd5a5349c
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
    while (false) {
        if (isalive(self)) {
            curweap = self getcurrentweapon();
            if (function_e16bb69fe1ca890a(curweap)) {
                currootweapon = getweaponrootname(curweap);
                rank = function_37f14fd361bd3290(currootweapon);
                numranks = level.weaponranktable.maxweaponranks[currootweapon];
                if (rank >= numranks - 1) {
                    nextweap = function_8fd5629428f0752b();
                    if (!isdefined(nextweap)) {
                        break;
                    }
                    _switchtoweapon(nextweap);
                }
            }
        }
        wait(2);
    }
}

// Namespace rankup / namespace_143053cbd5a5349c
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
            numranks = level.weaponranktable.maxweaponranks[rootweapon];
            if (rank < numranks - 1) {
                return rootweapon;
            }
        }
    }
    return undefined;
}

// Namespace rankup / namespace_143053cbd5a5349c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3af
// Size: 0x8d
function private _switchtoweapon(weap) {
    if (!isdefined(weap)) {
        return;
    }
    curweap = self getcurrentweapon();
    currootweapon = getweaponrootname(curweap);
    scripts/cp_mp/utility/inventory_utility::_takeweapon(curweap);
    rootweapon = getweaponrootname(weap);
    weapon = buildweapon(rootweapon);
    self giveweapon(weapon);
    self setweaponammoclip(weapon, weaponclipsize(weapon));
    self setweaponammostock(weapon, weaponmaxammo(weapon));
    self switchtoweaponimmediate(weapon);
}

// Namespace rankup / namespace_143053cbd5a5349c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x443
// Size: 0x42
function private function_604e6c056c7de43d() {
    self notify("player_shooting_loop");
    self endon("player_shooting_loop");
    level endon("game_ended");
    self endon("disconnect");
    while (true) {
        self startforcedfire();
        wait(0.2);
        self stopforcedfire();
        wait(0.2);
    }
}

// Namespace rankup / namespace_143053cbd5a5349c
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
    while (true) {
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

// Namespace rankup / namespace_143053cbd5a5349c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x567
// Size: 0x103
function private function_37f14fd361bd3290(weaponname) {
    var_32e9d6e2b27343b9 = self getplayerdata(level.loadoutdata, "squadMembers", "weapon_xp", weaponname);
    curxp = 0;
    foreach (elem in self.pers["weaponStats"]) {
        elemrootweapon = getweaponrootname(elem.weapon);
        if (elemrootweapon == weaponname && isdefined(elem.stats["xp_earned"])) {
            curxp = curxp + elem.stats["xp_earned"];
        }
    }
    weapxp = var_32e9d6e2b27343b9 + curxp;
    rank = getweaponrankforxp(weapxp);
    return rank;
}

// Namespace rankup / namespace_143053cbd5a5349c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x672
// Size: 0x3e
function private _isriotshield(weaponname) {
    if (isweapon(weaponname) && isnullweapon(weaponname)) {
        return false;
    }
    if (isstring(weaponname) && weaponname == "none") {
        return false;
    }
    return weaponname == "iw9_me_riotshield";
}

// Namespace rankup / namespace_143053cbd5a5349c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6b8
// Size: 0x35
function private _ismeleeweapon(weaponname) {
    ismeleeweapon = isknifeonly(weaponname) || isakimbomeleeweapon(weaponname) || isaxeweapon(weaponname);
    return ismeleeweapon;
}

// Namespace rankup / namespace_143053cbd5a5349c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6f5
// Size: 0x5d
function private function_e16bb69fe1ca890a(weapon) {
    if (!isdefined(weapon)) {
        return false;
    }
    weaponname = undefined;
    if (isweapon(weapon)) {
        weaponname = getweaponrootname(weapon);
    } else {
        weaponname = weapon;
    }
    if (_ismeleeweapon(weaponname)) {
        return false;
    }
    if (_isriotshield(weaponname)) {
        return false;
    }
    if (!weaponshouldgetxp(weaponname)) {
        return false;
    }
    return true;
}

