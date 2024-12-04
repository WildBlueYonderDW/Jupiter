#using script_189b67b2735b981d;
#using script_354c862768cfe202;
#using script_56ef8d52fe1b48a1;
#using script_74502a9e0ef1f19c;
#using script_afb7e332aee4bf2;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp\cp_player_battlechatter;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\inventory_utility;
#using scripts\cp_mp\utility\shellshock_utility;
#using scripts\cp_mp\utility\weapon_utility;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace namespace_4ffa252800297747;

// Namespace namespace_4ffa252800297747 / namespace_ce29426d87a9df99
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x35a
// Size: 0x6c
function function_62123c11d393ef66(reviver) {
    self endon("last_stand_finished");
    self endon("last_stand_heal_active");
    level endon("game_ended");
    for (;;) {
        while (!reviver isonground()) {
            waitframe();
        }
        revived = 0;
        self notify("handle_revive_message");
        reviver.revivingteammate = 1;
        if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        }
        revived = 1;
        reviver notify("finish_buddy_reviving");
        if (revived) {
            return;
        }
    }
}

// Namespace namespace_4ffa252800297747 / namespace_ce29426d87a9df99
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3ce
// Size: 0x34
function function_76ca0b3d8b2555ca(weaponobj) {
    if (!isdefined(weaponobj)) {
        return false;
    }
    if (isstring(weaponobj)) {
        return (weaponobj == "iw9_pi_stimpistol_mp");
    }
    return weaponobj.basename == "iw9_pi_stimpistol_mp";
}

// Namespace namespace_4ffa252800297747 / namespace_ce29426d87a9df99
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x40b
// Size: 0x12
function function_31afe9d7b373900f() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    waitframe();
    waitframe();
}

// Namespace namespace_4ffa252800297747 / namespace_ce29426d87a9df99
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x425
// Size: 0x30
function function_807b3b0a3b4128f9() {
    if (isdefined(self.var_b24e609023ce8208)) {
        self.var_b24e609023ce8208 = undefined;
    }
    if (isdefined(self.var_98d31d9ce04b2b81)) {
        self.var_98d31d9ce04b2b81 = undefined;
    }
}

// Namespace namespace_4ffa252800297747 / namespace_ce29426d87a9df99
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x45d
// Size: 0xe3
function private super_stimPistol_watchHits() {
    self notify("super_stimPistol_watchHits");
    self endon("super_stimPistol_watchHits");
    self endon("death_or_disconnect");
    while (true) {
        self waittill("bullet_first_impact", var_9d7ca6252f103a3b, hitent, hitentpart, surfacenormal, surfacetype, weapon, bulletdir, impactpos, hitloc);
        if (isdefined(hitent)) {
            function_8a99cebbc265563e(hitent, impactpos, weapon);
            continue;
        }
        if (isdefined(function_3dc5bb206e7e98ac(impactpos))) {
            hitplayer = function_3dc5bb206e7e98ac(impactpos, 1);
            if (isdefined(hitplayer)) {
                function_8a99cebbc265563e(hitplayer, impactpos, weapon);
            }
            continue;
        }
        level thread scripts\cp\cp_player_battlechatter::trysaylocalsound(self, #"bc_flavor_player_negative");
    }
}

// Namespace namespace_4ffa252800297747 / namespace_ce29426d87a9df99
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x548
// Size: 0x103
function private function_8a99cebbc265563e(hitent, impactpos, weapon) {
    if (!istrue(function_76ca0b3d8b2555ca(weapon))) {
        return 0;
    }
    if (!istrue(isplayer(hitent) || isagent(hitent))) {
        return 0;
    }
    if (isai(hitent)) {
        return 0;
    }
    if (hitent.team != self.team) {
        return 0;
    }
    revivetrigger = hitent.reviveent;
    if (isdefined(revivetrigger)) {
        namespace_3d3d5211c3029f82::updatedamagefeedback("hitlaststand_stimpistol");
        revivetrigger thread namespace_d4aab8c9cb8ecb14::function_656840b28eb4c279(self.team, 1, self);
        level thread scripts\cp\cp_player_battlechatter::trysaylocalsound(self, #"bc_status_action_reviving");
        return;
    }
    if (namespace_d4aab8c9cb8ecb14::player_in_laststand(hitent) && !istrue(hitent.beingrevived)) {
        namespace_3d3d5211c3029f82::updatedamagefeedback("hitlaststand_stimpistol");
        hitent thread namespace_d4aab8c9cb8ecb14::function_656840b28eb4c279(self.team, 1, self);
        level thread scripts\cp\cp_player_battlechatter::trysaylocalsound(self, #"bc_status_action_reviving");
    }
}

// Namespace namespace_4ffa252800297747 / namespace_ce29426d87a9df99
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x653
// Size: 0xc0
function private function_ada94a4d4deecf34(revivetrigger, reviver) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (isdefined(revivetrigger.onbeginuse)) {
        revivetrigger [[ revivetrigger.onbeginuse ]](reviver, 0);
    }
    thread function_2ed51b25df0d7d8(reviver, revivetrigger, function_5acb5dca46088661());
    reviver thread super_stimPistol_progressReviverUi(reviver, revivetrigger, function_5acb5dca46088661());
    thread function_5b9f43d57bfbaddf(revivetrigger);
    self waittill("super_stim_revive_other_end");
    if (isdefined(revivetrigger.onenduse)) {
        revivetrigger [[ revivetrigger.onenduse ]](reviver.team, reviver, 1, 0);
    }
    waitframe();
    if (isdefined(revivetrigger.onuse)) {
        revivetrigger [[ revivetrigger.onuse ]](reviver);
    }
}

// Namespace namespace_4ffa252800297747 / namespace_ce29426d87a9df99
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x71b
// Size: 0x1d
function private function_5acb5dca46088661() {
    return ter_op(isdefined(level.teamReviveTime), level.teamReviveTime, 5);
}

// Namespace namespace_4ffa252800297747 / namespace_ce29426d87a9df99
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x741
// Size: 0x91
function private super_stimPistol_progressReviverUi(reviver, revivetrigger, durationseconds) {
    self notify("super_stimPistol_progressReviverUi");
    self endon("super_stimPistol_progressReviverUi");
    self endon("death_or_disconnect");
    level endon("game_ended");
    durationprogress = 0;
    self setclientomnvar("ui_securing", 5);
    while (durationprogress < durationseconds) {
        durationprogress += level.framedurationseconds;
        self setclientomnvar("ui_securing_progress", clamp(durationprogress / durationseconds, 0.01, 1));
        waitframe();
    }
    self setclientomnvar("ui_securing", 0);
}

// Namespace namespace_4ffa252800297747 / namespace_ce29426d87a9df99
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x7da
// Size: 0xaa
function private function_2ed51b25df0d7d8(reviver, revivetrigger, durationseconds) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    durationprogress = 0;
    self setclientomnvar("ui_securing", 6);
    self setclientomnvar("ui_reviver_id", self getentitynumber());
    while (durationprogress < durationseconds) {
        durationprogress += level.framedurationseconds;
        self setclientomnvar("ui_securing_progress", clamp(durationprogress / durationseconds, 0.01, 1));
        waitframe();
    }
    self setclientomnvar("ui_securing", 0);
    self setclientomnvar("ui_reviver_id", -1);
    self notify("super_stim_revive_other_end");
}

// Namespace namespace_4ffa252800297747 / namespace_ce29426d87a9df99
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x88c
// Size: 0x79
function function_5b9f43d57bfbaddf(revivetrigger, reviver) {
    level endon("game_ended");
    self endon("super_stim_revive_other_end");
    revivetrigger.deadplayer waittill_any_4("death_or_disconnect", "last_stand_finished", "trigger_removed", "team_eliminated");
    if (isdefined(revivetrigger) && isdefined(revivetrigger.onenduse)) {
        revivetrigger [[ revivetrigger.onenduse ]](reviver.team, reviver, 0, 0);
    }
}

// Namespace namespace_4ffa252800297747 / namespace_ce29426d87a9df99
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x90d
// Size: 0x5f
function function_3dc5bb206e7e98ac(impactpos, var_7fbfca7ebe515d0b) {
    nearbyplayer = getclosest(impactpos, level.players, 32);
    if (istrue(var_7fbfca7ebe515d0b) && isdefined(nearbyplayer)) {
        trace = scripts\engine\trace::ray_trace_passed(impactpos, nearbyplayer.origin);
        if (!trace) {
            return undefined;
        }
    }
    return nearbyplayer;
}

// Namespace namespace_4ffa252800297747 / namespace_ce29426d87a9df99
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x975
// Size: 0x41
function function_321c7891711e583f() {
    thread function_f9fca902e11f439c();
    namespace_27c74152ccb91331::function_55b08d6d71b41402(self, "equipment_deployed");
    thread super_stimPistol_watchHits();
    function_ad32396bd89936bb(0);
    thread function_6be5eea08181b5e5();
    thread function_f5037ba4a5399b63();
    thread function_c65a15def6a7073c();
    return true;
}

// Namespace namespace_4ffa252800297747 / namespace_ce29426d87a9df99
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9bf
// Size: 0x8f
function function_6be5eea08181b5e5() {
    self endon("super_use_finished");
    superinfo = namespace_44edfb3e2b433c17::getcurrentsuper();
    weaponobj = superinfo.staticdata.useweapon;
    currweapon = undefined;
    while (true) {
        self waittill("weapon_change", var_8173b64cdecf7890);
        if (var_8173b64cdecf7890 != weaponobj && function_76ca0b3d8b2555ca(currweapon)) {
            break;
        }
        currweapon = self getcurrentweapon();
        continue;
    }
    thread function_c45aed53e3c471d2();
    namespace_44edfb3e2b433c17::superusefinished();
}

// Namespace namespace_4ffa252800297747 / namespace_ce29426d87a9df99
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xa56
// Size: 0x1a
function private function_c45aed53e3c471d2() {
    self waittill("stim_pistol_returned");
    wait 0.2;
    namespace_44edfb3e2b433c17::increase_super_progress(965);
}

// Namespace namespace_4ffa252800297747 / namespace_ce29426d87a9df99
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa78
// Size: 0x9d
function function_f5037ba4a5399b63(fromdeath, var_2c718d1dc61a2d27) {
    self endon("disconnect");
    if (!istrue(var_2c718d1dc61a2d27)) {
        self waittill("out_of_ammo");
    }
    self notify("super_stimPistol_watchHits");
    function_ad32396bd89936bb(1);
    self.var_bf5b10918f8418a1 = undefined;
    self.super_activated = 0;
    namespace_44edfb3e2b433c17::end_super_meter_progress_early();
    val::reset_all("stim_pistol");
    namespace_44edfb3e2b433c17::function_c5ea07dac9d83685();
    clientnum = self getentitynumber();
    setomnvar("ui_class_power_reloading", clientnum);
    namespace_44edfb3e2b433c17::setsuperisinuse(0);
    self.var_4b6e638cb12a3e90 = 0;
    self notify("stim_pistol_returned");
}

// Namespace namespace_4ffa252800297747 / namespace_ce29426d87a9df99
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb1d
// Size: 0xda
function function_c65a15def6a7073c() {
    superinfo = namespace_44edfb3e2b433c17::getcurrentsuper();
    weaponobj = superinfo.staticdata.useweapon;
    self waittill("super_use_finished");
    wait 0.3;
    if (!istrue(self.insertingarmorplate) && istrue(function_76ca0b3d8b2555ca(self getcurrentprimaryweapon()))) {
        var_509d86412c9d7426 = self getweaponslistprimaries();
        foreach (weap in var_509d86412c9d7426) {
            if (function_76ca0b3d8b2555ca(weap)) {
                continue;
            }
            self switchtoweapon(weap);
            break;
        }
    }
    self takeweapon(weaponobj);
    self notify("out_of_ammo");
}

// Namespace namespace_4ffa252800297747 / namespace_ce29426d87a9df99
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xbff
// Size: 0x2c4
function private function_f9fca902e11f439c() {
    self endon("disconnect");
    self.super_activated = 1;
    weaponobj = namespace_a0628d6954815ef8::function_768c9a047aed19f4("iw9_pi_stimpistol_mp");
    self notify("super_started");
    superinfo = namespace_44edfb3e2b433c17::getcurrentsuper();
    superinfo.usepercent = 0;
    namespace_44edfb3e2b433c17::setsuperisinuse(0);
    superinfo.staticdata.useweapon = weaponobj;
    superinfo.staticdata.useweaponclipammo = 1;
    superinfo.staticdata.useweaponstockammo = 0;
    superinfo.staticdata.usedelay = 10;
    if (issharedfuncdefined("game", "setHasDoneCombat")) {
        [[ getsharedfunc("game", "setHasDoneCombat") ]](self, 1);
    }
    if (isdefined(superinfo) && !superinfo.isinuse) {
        laststanduse = !istrue(self.inlaststand) || istrue(superinfo.staticdata.canuseinlaststand);
        var_1338411613704f7a = 1;
        if (isdefined(superinfo.staticdata.useweapon)) {
            if (!laststanduse) {
                var_1338411613704f7a = 0;
            } else {
                var_1338411613704f7a = namespace_44edfb3e2b433c17::trygiveuseweapon(superinfo.staticdata.useweapon, superinfo.staticdata.useweaponclipammo, superinfo.staticdata.useweaponstockammo);
            }
        }
        if (istrue(var_1338411613704f7a) && istrue(laststanduse) && (!isdefined(superinfo.staticdata.beginusefunc) || istrue(self [[ superinfo.staticdata.beginusefunc ]]()))) {
            var_612c93cfb9f62839 = [];
            var_612c93cfb9f62839[0] = "super_use_finished_lb";
            var_612c93cfb9f62839[1] = "super_switched";
            superinfo.basepoints = 0;
            superinfo.extrapoints = 0;
            val::set("stim_pistol", "weapon_pickup", 0);
            namespace_44edfb3e2b433c17::setsuperisinuse(1);
            namespace_44edfb3e2b433c17::setSuperIsActive(1);
            superinfo.usestarttime = gettime();
            superinfo.usepercent = 1;
            self notify("super_use_started");
            thread namespace_44edfb3e2b433c17::function_15fe9c03174d698d();
            thread namespace_44edfb3e2b433c17::function_c4c44e009d4f4c6b();
            thread scripts\cp\cp_player_battlechatter::function_204aeba40a2aa027("super_stimpistol");
            self.super_activated = 1;
            self.var_4b6e638cb12a3e90 = 1;
            return true;
        } else {
            wait 0.2;
            thread function_c45aed53e3c471d2();
            namespace_44edfb3e2b433c17::superusefinished();
            return false;
        }
    }
    iprintlnbold("Failed to give player stim pistol.");
    return false;
}

// Namespace namespace_4ffa252800297747 / namespace_ce29426d87a9df99
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xecc
// Size: 0x16
function function_3f29f7ceb8c0ec6d() {
    self.var_b24e609023ce8208 = undefined;
    self.var_98d31d9ce04b2b81 = undefined;
}

// Namespace namespace_4ffa252800297747 / namespace_ce29426d87a9df99
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xeea
// Size: 0x28
function function_ad32396bd89936bb(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (b_value) {
        self enableweaponpickup();
        return;
    }
    self disableweaponpickup();
}

