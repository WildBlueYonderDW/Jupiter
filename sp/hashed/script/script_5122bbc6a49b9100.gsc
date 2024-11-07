#using scripts\engine\utility.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\sp\equipment\offhands.gsc;
#using scripts\sp\player\cursor_hint.gsc;
#using scripts\common\vehicle.gsc;

#namespace namespace_79dd814cec8ea0d2;

// Namespace namespace_79dd814cec8ea0d2 / namespace_fcb25c7f5ae9ffb2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x211
// Size: 0x50
function precache(offhand) {
    level.offhands.var_cbf61c5c5c449f1f = spawnstruct();
    level.offhands.var_cbf61c5c5c449f1f.var_83fc771306eded0f = [];
    registeroffhandfirefunc(offhand, &function_6ff21d428c0f908a);
}

// Namespace namespace_79dd814cec8ea0d2 / namespace_fcb25c7f5ae9ffb2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x269
// Size: 0x35
function function_6ff21d428c0f908a(grenade, weapon) {
    if (!isdefined(grenade)) {
        return;
    }
    self notify("player_ATMinePlaced");
    thread function_8ca9a700b45814e2(grenade, self, self.team, weapon);
}

// Namespace namespace_79dd814cec8ea0d2 / namespace_fcb25c7f5ae9ffb2
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2a6
// Size: 0x1a2
function function_8ca9a700b45814e2(grenade, mineowner, team, var_750c0edec8558bf1) {
    grenade endon("entitydeleted");
    grenade endon("death");
    flag_wait("scriptables_ready");
    grenade setscriptablepartstate("visibility", "show", 0);
    grenade setscriptablepartstate("floats", "hide", 0);
    level.offhands.var_cbf61c5c5c449f1f.var_83fc771306eded0f = array_add(level.offhands.var_cbf61c5c5c449f1f.var_83fc771306eded0f, grenade);
    if (isdefined(mineowner)) {
        grenade.team = default_to(mineowner.team, team);
        grenade setentityowner(mineowner);
        grenade setotherent(mineowner);
    } else {
        grenade.team = default_to(team, "axis");
    }
    grenade makeunusable();
    grenade.targetname = "offhand_car_grenade";
    grenade.in_water = 0;
    grenade childthread function_427845ab37c184cd();
    grenade waittill("missile_stuck");
    if (isdefined(grenade)) {
        grenade setscriptablepartstate("plant", "active", 0);
        grenade setcandamage(1);
        if (isplayer(mineowner)) {
            mineowner setscriptablepartstate("equipATMineFXView", "plant", 0);
        }
        wait 2;
        if (isdefined(grenade)) {
            grenade notify("missile_stuck_land");
            if (isplayer(mineowner)) {
                mineowner thread function_6e5ce23490c6fea6(grenade, var_750c0edec8558bf1, %EQUIPMENT/IMPROVISED_MINE_PICKUP);
            }
            grenade thread function_285754702166e469(mineowner);
            grenade childthread function_22846f2eee7f6a8d(mineowner);
        }
    }
}

// Namespace namespace_79dd814cec8ea0d2 / namespace_fcb25c7f5ae9ffb2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x450
// Size: 0x23
function function_5d168aee5b11f8eb() {
    scripts\sp\player\cursor_hint::create_cursor_hint(undefined, (0, 0, 8), %EQUIPMENT/IMPROVISED_MINE_PICKUP, 55, 100, 70, 0);
}

// Namespace namespace_79dd814cec8ea0d2 / namespace_fcb25c7f5ae9ffb2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x47b
// Size: 0x2e
function function_427845ab37c184cd() {
    self endon("missile_stuck_land");
    self waittill("missile_water_impact");
    self setscriptablepartstate("floats", "show", 0);
    self.in_water = 1;
}

// Namespace namespace_79dd814cec8ea0d2 / namespace_fcb25c7f5ae9ffb2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b1
// Size: 0x8b
function function_f926047e96a9a040() {
    nearbyenemies = getaiarrayinradius(self.origin, 200, "axis");
    foreach (var_a09e6d340590460a in nearbyenemies) {
        if (!isdefined(var_a09e6d340590460a.stealth)) {
            continue;
        }
        var_a09e6d340590460a aieventlistenerevent("investigate", self, self.origin);
    }
}

// Namespace namespace_79dd814cec8ea0d2 / namespace_fcb25c7f5ae9ffb2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x544
// Size: 0xaf
function function_22846f2eee7f6a8d(mineowner) {
    self setscriptablepartstate("arm", "active", 0);
    var_2087e4030aa793b = undefined;
    while (isdefined(self)) {
        self waittill("trigger_grenade", var_2087e4030aa793b);
        if (!is_equal(var_2087e4030aa793b.team, self.team)) {
            if (istrue(self.in_water)) {
                break;
            }
            if (isdefined(var_2087e4030aa793b)) {
                dist = distancesquared(self.origin, var_2087e4030aa793b.origin);
                if (dist < 3025) {
                    break;
                }
            }
        }
    }
    thread function_fb1870077181b550(default_to(mineowner, var_2087e4030aa793b));
}

// Namespace namespace_79dd814cec8ea0d2 / namespace_fcb25c7f5ae9ffb2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5fb
// Size: 0xaf
function function_285754702166e469(mineowner) {
    self endon("death");
    self.health = 99999;
    while (true) {
        self waittill("damage", null, attacker, null, null, meansofdeath);
        if (isplayer(mineowner) && !isplayer(attacker)) {
            continue;
        }
        if (meansofdeath == "MOD_MELEE") {
            continue;
        }
        if (meansofdeath == "MOD_IMPACT" && is_equal(attacker.team, self.team)) {
            continue;
        }
        thread function_fb1870077181b550(attacker);
        break;
    }
}

// Namespace namespace_79dd814cec8ea0d2 / namespace_fcb25c7f5ae9ffb2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6b2
// Size: 0x106
function function_fb1870077181b550(attacker) {
    playsoundatpos(self.origin + (0, 0, 20), "minefield_click");
    wait 0.35;
    if (isdefined(self)) {
        scripts\sp\player\cursor_hint::remove_cursor_hint();
        self clearscriptabledamageowner();
        self setscriptablepartstate("arm", "neutral", 0);
        self setscriptablepartstate("hacked", "neutral", 0);
        self setscriptablepartstate("launch", "neutral", 0);
        self setscriptablepartstate("trigger", "neutral", 0);
        if (isdefined(attacker)) {
            if (attacker scripts\common\vehicle::isvehicle()) {
                self setscriptablepartstate("explode", "fromVehicle", 0);
            } else if (isplayer(attacker)) {
                self setscriptablepartstate("explode", "fromPlayer", 0);
            } else {
                self setscriptablepartstate("explode", "fromDamage", 0);
            }
        } else {
            self setscriptablepartstate("explode", "fromDamage", 0);
        }
        wait 3;
        if (isdefined(self)) {
            self delete();
        }
    }
}

// Namespace namespace_79dd814cec8ea0d2 / namespace_fcb25c7f5ae9ffb2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7c0
// Size: 0x44
function function_c32ae958d66a887c() {
    level.offhands.var_cbf61c5c5c449f1f.var_83fc771306eded0f = array_remove(level.offhands.var_cbf61c5c5c449f1f.var_83fc771306eded0f, self);
}

