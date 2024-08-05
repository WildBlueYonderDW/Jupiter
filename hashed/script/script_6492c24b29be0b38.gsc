#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\sp\equipment\offhands.gsc;
#using scripts\sp\player\cursor_hint.gsc;
#using scripts\anim\face.gsc;

#namespace gas_trap;

// Namespace gas_trap / namespace_67ede21d42cae784
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f2
// Size: 0x50
function precache(offhand) {
    level.offhands.var_85514a13c82068fd = spawnstruct();
    level.offhands.var_85514a13c82068fd.var_83fc771306eded0f = [];
    registeroffhandfirefunc(offhand, &function_6d77cb0b51cbbb04);
}

// Namespace gas_trap / namespace_67ede21d42cae784
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x24a
// Size: 0x35
function function_6d77cb0b51cbbb04(grenade, weapon) {
    if (!isdefined(grenade)) {
        return;
    }
    self notify("player_gasTrapPlaced");
    thread function_d66e2c658314e5ac(grenade, self, self.team, weapon);
}

// Namespace gas_trap / namespace_67ede21d42cae784
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x287
// Size: 0x12d
function function_d66e2c658314e5ac(grenade, mineowner, team, var_750c0edec8558bf1) {
    grenade endon("entitydeleted");
    grenade endon("death");
    grenade setentityowner(mineowner);
    grenade setotherent(mineowner);
    grenade makeunusable();
    grenade.targetname = "offhand_car_grenade";
    var_ce3e248b427582f1 = grenade.model;
    stuckto, var_75ac1fbce3945650, surfacetype, velocity, position, hitnormal = grenade waittill("missile_stuck");
    thread function_6e5ce23490c6fea6(grenade, var_750c0edec8558bf1, %EQUIPMENT/IMPROVISED_MINE_PICKUP);
    childthread function_c79a9033e727667f(grenade, mineowner, team);
    childthread function_1e004fb8a230e0b(grenade);
    level.offhands.var_85514a13c82068fd.var_83fc771306eded0f = array_add(level.offhands.var_85514a13c82068fd.var_83fc771306eded0f, grenade);
}

// Namespace gas_trap / namespace_67ede21d42cae784
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3bc
// Size: 0xa0
function function_601bfa752385fed2(grenade, mineowner) {
    nearbyenemies = getaiarrayinradius(grenade.origin, 200, "axis");
    foreach (var_a09e6d340590460a in nearbyenemies) {
        if (!isdefined(var_a09e6d340590460a.stealth)) {
            continue;
        }
        var_a09e6d340590460a aieventlistenerevent("investigate", grenade, grenade.origin);
    }
}

// Namespace gas_trap / namespace_67ede21d42cae784
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x464
// Size: 0x17a
function function_5f0f344f30a1f4b(grenade, mineowner, var_ff882f75755f7367) {
    mineowner endon("death");
    while (true) {
        interact = spawnstruct();
        interact.origin = grenade.origin + (0, 0, 5);
        interact scripts\sp\player\cursor_hint::create_cursor_hint(undefined, (0, 0, 0), %EQUIPMENT/IMPROVISED_MINE_PICKUP, 55, 100, 70, 0);
        thread function_922f5f6ae49a1314(grenade, interact);
        event = function_7b9e0e7ca4b3b940(grenade, "entitydeleted", interact, "trigger");
        if (event == "trigger") {
            if (isdefined(level.offhands.var_b57472ecae671752["gas_trap"])) {
                currentammo = [[ level.offhands.var_b57472ecae671752["gas_trap"] ]]("gas_trap");
            } else {
                currentammo = level.player getweaponammoclip(var_ff882f75755f7367);
            }
            if (currentammo < 4) {
                level.player thread play_sound_on_entity("weap_pickup");
                level.player notify("player_gasTrapPickedUp");
                level.player give_offhand(var_ff882f75755f7367.basename, currentammo + 1);
                function_d05d967e8630a32a(grenade);
                grenade delete();
                break;
            }
            continue;
        }
        interact notify("entitydeleted");
        break;
    }
}

// Namespace gas_trap / namespace_67ede21d42cae784
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5e6
// Size: 0x162
function function_922f5f6ae49a1314(grenade, interact) {
    grenade endon("entitydeleted");
    interact endon("trigger");
    if (isdefined(level.offhands.var_b57472ecae671752["gas_trap"])) {
        currentammo = [[ level.offhands.var_b57472ecae671752["gas_trap"] ]]("gas_trap");
    } else {
        currentammo = level.player getweaponammoclip("gas_trap");
    }
    var_d5f6f287ac22711a = currentammo;
    if (currentammo >= 4) {
        interact.cursor_hint_ent sethintstring(%EQUIPMENT/FULL);
    } else {
        interact.cursor_hint_ent sethintstring(%EQUIPMENT/IMPROVISED_MINE_PICKUP);
    }
    while (true) {
        if (isdefined(level.offhands.var_b57472ecae671752["gas_trap"])) {
            currentammo = [[ level.offhands.var_b57472ecae671752["gas_trap"] ]]("gas_trap");
        } else {
            currentammo = level.player getweaponammoclip("gas_trap");
        }
        if (currentammo != var_d5f6f287ac22711a) {
            if (currentammo >= 4) {
                interact.cursor_hint_ent sethintstring(%EQUIPMENT/FULL);
            } else {
                interact.cursor_hint_ent sethintstring(%EQUIPMENT/IMPROVISED_MINE_PICKUP);
            }
        }
        var_d5f6f287ac22711a = currentammo;
        waitframe();
    }
}

// Namespace gas_trap / namespace_67ede21d42cae784
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x750
// Size: 0xd2
function function_c79a9033e727667f(grenade, mineowner, team) {
    grenade endon("entitydeleted");
    grenade.trigger = spawn("trigger_radius", grenade.origin, 15, 55, 72);
    wait 2;
    var_2087e4030aa793b = undefined;
    while (true) {
        var_2087e4030aa793b = grenade.trigger waittill("trigger");
        if (!is_equal(var_2087e4030aa793b.team, team)) {
            break;
        }
        if (!isdefined(var_2087e4030aa793b.velocity)) {
            continue;
        }
        if (!length(var_2087e4030aa793b.velocity)) {
            continue;
        }
    }
    grenade.trigger delete();
    thread function_d27019e6b9fd97be(grenade, mineowner);
}

// Namespace gas_trap / namespace_67ede21d42cae784
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x82a
// Size: 0xf1
function function_1e004fb8a230e0b(grenade) {
    grenade endon("entitydeleted");
    scriptmodel = spawn("script_model", grenade.origin);
    scriptmodel.angles = grenade.angles;
    scriptmodel setmodel(grenade.model);
    scriptmodel setcandamage(1);
    scriptmodel.maxhealth = 100000;
    scriptmodel.health = scriptmodel.maxhealth;
    thread function_b0930d0f316c2785(grenade, scriptmodel);
    while (true) {
        null, attacker, null, null, meansofdeath = scriptmodel waittill("damage");
        if (!isplayer(attacker)) {
            continue;
        }
        if (meansofdeath == "MOD_MELEE") {
            continue;
        }
        thread function_d27019e6b9fd97be(grenade, attacker);
        break;
    }
}

// Namespace gas_trap / namespace_67ede21d42cae784
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x923
// Size: 0x22
function function_b0930d0f316c2785(grenade, scriptmodel) {
    grenade waittill("entitydeleted");
    scriptmodel delete();
}

// Namespace gas_trap / namespace_67ede21d42cae784
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x94d
// Size: 0x15a
function function_d27019e6b9fd97be(grenade, mineowner) {
    earthquake(0.25, 0.35, grenade.origin, 1000);
    playrumbleonposition("grenade_rumble", grenade.origin);
    var_a830aa21c1b60a3c = distancesquared(level.player.origin, grenade.origin);
    if (var_a830aa21c1b60a3c <= 22500) {
        thread function_14dd7fe1d23f9dc3("iw9_ges_gas_cough_long", grenade.origin, "gas_trap", 150);
    }
    enemies = getaiarrayinradius(grenade.origin, 350, "axis");
    foreach (enemy in enemies) {
        enemy notify("flashbang", grenade.origin, 1, 1, mineowner, "allies", 9);
        enemy thread function_955e0e9b64ac2b2f(mineowner);
    }
    if (isdefined(grenade.trigger)) {
        grenade.trigger delete();
    }
    function_d05d967e8630a32a(grenade);
    grenade detonate();
}

// Namespace gas_trap / namespace_67ede21d42cae784
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaaf
// Size: 0x4d
function function_d05d967e8630a32a(var_85514a13c82068fd) {
    level.offhands.var_85514a13c82068fd.var_83fc771306eded0f = array_remove(level.offhands.var_85514a13c82068fd.var_83fc771306eded0f, var_85514a13c82068fd);
}

// Namespace gas_trap / namespace_67ede21d42cae784
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb04
// Size: 0xb5
function function_955e0e9b64ac2b2f(mineowner) {
    self notify("stop_gasTrapEffects");
    self endon("stop_gasTrapEffects");
    self endon("death");
    scripts\anim\face::saygenericdialogue("cough_fit");
    self.var_d7a3873a03947a34 = gettime();
    while (true) {
        waitframe();
        if (self isinscriptedstate()) {
            continue;
        }
        if (isflashed()) {
            self.var_d7a3873a03947a34 = gettime();
            continue;
        }
        if (time_has_passed(self.var_d7a3873a03947a34, 15)) {
            self notify("flashbang", self.origin, 1, 1, mineowner, "allies", 3);
            scripts\anim\face::saygenericdialogue("cough_fit");
            self.var_d7a3873a03947a34 = gettime();
        }
    }
}

