#using script_15de7dc4d21f1da3;
#using script_2669878cf5a1b6bc;
#using script_436add9de781cdfb;
#using script_7ef95bba57dc4b82;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\cp_mp\utility\damage_utility;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\vehicles\vehicle;
#using scripts\cp_mp\vehicles\vehicle_occupancy;
#using scripts\engine\utility;

#namespace talking_gun;

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x777
// Size: 0x8a
function function_ce3fed6316f195b9(tablename) {
    for (row = 0; true; row++) {
        eventname = tablelookupbyrow(tablename, row, 1);
        delay = tablelookupbyrow(tablename, row, 3);
        globalcooldown = tablelookupbyrow(tablename, row, 4);
        linecooldown = tablelookupbyrow(tablename, row, 5);
        if (eventname == "") {
            break;
        }
        function_81e38b9504bed322(eventname, delay, globalcooldown, linecooldown);
    }
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x809
// Size: 0x74
function function_81e38b9504bed322(eventname, delay, globalcooldown, linecooldown) {
    result = spawnstruct();
    result.delay = delay;
    result.globalcooldown = globalcooldown;
    result.linecooldown = linecooldown;
    result.lines = [];
    level.var_20e6a6f36157adc[eventname] = result;
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x885
// Size: 0x75
function function_ebda2510d1d4f81d(tablename) {
    for (row = 0; true; row++) {
        eventtablename = tablelookupbyrow(tablename, row, 0);
        eventname = tablelookupbyrow(tablename, row, 1);
        playaudio = tablelookupbyrow(tablename, row, 2);
        if (eventtablename == "") {
            break;
        }
        function_6b8aa0609ecb3cbd(row, eventtablename, eventname, playaudio);
    }
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x902
// Size: 0x49
function function_6b8aa0609ecb3cbd(index, eventtablename, eventname, playaudio) {
    level.var_20e6a6f36157adc[eventname].lines[eventtablename] = playaudio;
    level.var_3c611fe759d6cf8d[playaudio] = index;
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x953
// Size: 0x51
function function_c961767b96992af9() {
    thread function_b77041c06bd0e53a();
    thread function_e8084259d5e9e5a6();
    thread function_2f181c374b1af79d();
    /#
        thread function_3d9dc061bbfb25ab();
    #/
    level.var_20e6a6f36157adc = [];
    level.var_3c611fe759d6cf8d = [];
    function_ce3fed6316f195b9("talkinggunscreen_lines.csv");
    function_ebda2510d1d4f81d("talkinggunscreen_lines.csv");
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9ac
// Size: 0x10c
function function_b04504ffd83192e1() {
    self.var_d1d541d826231cad = spawnstruct();
    self.var_d1d541d826231cad.var_b364fee4d7c7a6d7 = 0;
    self.var_d1d541d826231cad.var_49e5355e2642f48d = 0;
    self.var_d1d541d826231cad.var_56560380a4b1a392 = [];
    self.var_d1d541d826231cad.var_759862146a4569cb = 0;
    self.var_d1d541d826231cad.var_76665eaaaabda31 = 0;
    self.var_d1d541d826231cad.var_b303cb73dd6407f5 = 0;
    self.var_d1d541d826231cad.var_e759da6edf27a220 = 0;
    self.var_d1d541d826231cad.lastdamagedtime = 0;
    self.var_d1d541d826231cad.var_6a8d989a494b74c4 = 1;
    self.var_d1d541d826231cad.lastdeploy = 0;
    self.var_d1d541d826231cad.var_cf433c13dd493f3f = [];
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xac0
// Size: 0x13b
function function_2f181c374b1af79d() {
    level endon("game_ended");
    while (true) {
        wait 0.5;
        foreach (player in level.var_1642386c8e73a981) {
            if (!isdefined(player) || !isdefined(player.var_d1d541d826231cad)) {
                continue;
            }
            carryinggameobject = isdefined(player.carryobject);
            touchinggameobject = isdefined(player.touchinggameobjects) && player.touchinggameobjects.size > 0;
            usinggameobject = isdefined(player.usinggameobjects) && player.usinggameobjects.size > 0;
            activeobjective = carryinggameobject || touchinggameobject || usinggameobject;
            if (activeobjective) {
                if (!istrue(player.var_d1d541d826231cad.onobj)) {
                    function_55b08d6d71b41402(player, "obj_capture");
                }
            }
            player.var_d1d541d826231cad.onobj = activeobjective;
        }
    }
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc03
// Size: 0x21f
function function_b77041c06bd0e53a() {
    level endon("game_ended");
    while (true) {
        wait 1;
        time = gettime() / 1000;
        foreach (player in level.var_1642386c8e73a981) {
            if (!isdefined(player) || !isdefined(player.var_d1d541d826231cad) || !isdefined(player.pers["totalDistTraveled"])) {
                continue;
            }
            if (!isdefined(player.var_d1d541d826231cad.currentidletime)) {
                player.var_d1d541d826231cad.currentidletime = 0;
            }
            if (!isdefined(player.var_d1d541d826231cad.var_62fb673b6d0038e4)) {
                player.var_d1d541d826231cad.var_62fb673b6d0038e4 = player.pers["totalDistTraveled"];
            }
            var_db19fbcd5af07943 = player.pers["totalDistTraveled"] - player.var_d1d541d826231cad.var_62fb673b6d0038e4;
            player.var_d1d541d826231cad.var_62fb673b6d0038e4 = player.pers["totalDistTraveled"];
            var_7855fd9575dfd1bf = player getstance() == "prone";
            if (var_db19fbcd5af07943 < 100) {
                player.var_d1d541d826231cad.currentidletime += 1;
                if (time > player.var_d1d541d826231cad.var_49e5355e2642f48d + 30 && !var_7855fd9575dfd1bf && player.var_d1d541d826231cad.currentidletime > 15) {
                    function_55b08d6d71b41402(player, "idle");
                }
                continue;
            }
            player.var_d1d541d826231cad.currentidletime = 0;
        }
    }
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe2a
// Size: 0x154
function function_e8084259d5e9e5a6() {
    self endon("game_ended");
    while (true) {
        wait 0.1;
        time = gettime() / 1000;
        if (isdefined(level.var_1642386c8e73a981) && level.var_1642386c8e73a981.size > 0) {
            foreach (player in level.var_1642386c8e73a981) {
                if (!isdefined(player)) {
                    continue;
                }
                var_94df8a1c478efe5c = player playerads() > 0.3;
                if (var_94df8a1c478efe5c) {
                    if (player.var_d1d541d826231cad.var_759862146a4569cb == 0) {
                        player.var_d1d541d826231cad.var_759862146a4569cb = time;
                    }
                    if (time - player.var_d1d541d826231cad.var_759862146a4569cb > 4) {
                        function_55b08d6d71b41402(player, "aiming_idle");
                    }
                    continue;
                }
                if (player.var_d1d541d826231cad.var_759862146a4569cb != 0) {
                    player.var_d1d541d826231cad.var_759862146a4569cb = 0;
                }
            }
        }
    }
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf86
// Size: 0x92
function function_b97b71722a3dc5f0(player, eventname) {
    if (!isdefined(player.var_d1d541d826231cad)) {
        return false;
    }
    if (!isdefined(player.var_d1d541d826231cad.var_56560380a4b1a392[eventname])) {
        return false;
    }
    timeseconds = gettime() / 1000;
    event = level.var_20e6a6f36157adc[eventname];
    return timeseconds < player.var_d1d541d826231cad.var_56560380a4b1a392[eventname] + event.linecooldown;
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1021
// Size: 0xb1
function function_7b50742a287d3ca1(player) {
    if (!isdefined(player.var_d1d541d826231cad)) {
        return false;
    }
    if (player.var_d1d541d826231cad.active) {
        return true;
    }
    if (function_b52945d0ec45b0cc(player)) {
        if (function_d8239f9d7164d68e(player.primaryweaponobj)) {
            return true;
        }
        foreach (weapon in player.primaryweapons) {
            if (function_d8239f9d7164d68e(weapon)) {
                return true;
            }
        }
    }
    return false;
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10db
// Size: 0x32
function function_b52945d0ec45b0cc(player) {
    if (scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_occupantisvehicledriver(player)) {
        return true;
    }
    if (player scripts\common\utility::isusingremote()) {
        return true;
    }
    if (player ishanging()) {
        return true;
    }
    return false;
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1116
// Size: 0x3b
function function_547117b1a7105f45(player, delay, line) {
    player endon("death_or_disconnect");
    wait delay;
    player setclientomnvar("ui_talkinggun_soundid", level.var_3c611fe759d6cf8d[line]);
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1159
// Size: 0x79
function function_a1e1b35a0bd2f57c(player, eventname) {
    if (!function_7b50742a287d3ca1(player)) {
        return false;
    }
    if (!isdefined(level.var_20e6a6f36157adc)) {
        function_c961767b96992af9();
    }
    event = level.var_20e6a6f36157adc[eventname];
    if (!isdefined(event) || !isdefined(event.lines[player.var_d1d541d826231cad.guntype])) {
        return false;
    }
    return true;
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11db
// Size: 0x5a
function function_e4d7e0e2fa1fe358() {
    if (issharedfuncdefined("game", "gameFlag")) {
        prematchdone = [[ getsharedfunc("game", "gameFlag") ]]("prematch_done");
        if (scripts\cp_mp\utility\game_utility::isbrstylegametype() && !istrue(level.skipprematch) && !prematchdone) {
            return 1;
        }
        return prematchdone;
    }
    return 1;
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x123e
// Size: 0x10d
function function_cd101ca0e17cfd60(player, eventname) {
    if (!function_7b50742a287d3ca1(player)) {
        return false;
    }
    if (!function_e4d7e0e2fa1fe358()) {
        return false;
    }
    if (!isdefined(level.var_20e6a6f36157adc)) {
        function_c961767b96992af9();
    }
    event = level.var_20e6a6f36157adc[eventname];
    if (!function_a1e1b35a0bd2f57c(player, eventname)) {
        return false;
    }
    timeseconds = gettime() / 1000;
    if (timeseconds < player.var_d1d541d826231cad.var_b364fee4d7c7a6d7) {
        return false;
    }
    if (function_b97b71722a3dc5f0(player, eventname)) {
        return false;
    }
    player.var_d1d541d826231cad.var_b364fee4d7c7a6d7 = timeseconds + event.globalcooldown + event.delay;
    player.var_d1d541d826231cad.var_49e5355e2642f48d = timeseconds;
    player.var_d1d541d826231cad.var_56560380a4b1a392[eventname] = timeseconds + event.delay;
    return true;
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1354
// Size: 0x7a
function function_55b08d6d71b41402(player, eventname) {
    if (!function_cd101ca0e17cfd60(player, eventname)) {
        return;
    }
    /#
        iprintlnbold("<dev string:x1c>" + eventname);
    #/
    event = level.var_20e6a6f36157adc[eventname];
    thread function_547117b1a7105f45(player, event.delay, event.lines[player.var_d1d541d826231cad.guntype]);
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13d6
// Size: 0xb3
function function_c5f05871ba7c3aa3() {
    currentstock = self getweaponammostock(self.currentweapon);
    maxstock = weaponmaxammo(self.currentweapon);
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype() && issharedfuncdefined("br_weapons", "br_ammo_type_for_weapon")) {
        ammotype = [[ getsharedfunc("br_weapons", "br_ammo_type_for_weapon") ]](self.currentweapon);
        if (isdefined(ammotype)) {
            maxstock = level.var_e6ea72fc5e3fcd00[ammotype];
        }
    }
    if (currentstock > maxstock * 0.3) {
        function_55b08d6d71b41402(self, "reload_start");
        return;
    }
    function_55b08d6d71b41402(self, "ammo_reserve_low");
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1491
// Size: 0x18
function function_81f5578aed261da1(player) {
    function_55b08d6d71b41402(player, "loot_found");
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x14b1
// Size: 0xbf
function function_44cdb18eb18593de(team, activity) {
    if (isdefined(activity) && isdefined(activity.name) && activity.name == "hold") {
        return;
    }
    wait 1;
    if (isdefined(level.var_1642386c8e73a981)) {
        foreach (player in level.var_1642386c8e73a981) {
            if (!isdefined(player)) {
                continue;
            }
            if (player.team == team) {
                function_55b08d6d71b41402(player, "contract_start");
            }
        }
    }
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1578
// Size: 0x1e
function function_952d1a246a3ece86(player) {
    wait 2;
    function_55b08d6d71b41402(player, "activate_uav");
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x159e
// Size: 0x86
function function_bf5315076804b215(team) {
    if (isdefined(level.var_1642386c8e73a981)) {
        foreach (player in level.var_1642386c8e73a981) {
            if (!isdefined(player)) {
                continue;
            }
            if (player.team == team) {
                function_55b08d6d71b41402(player, "contract_complete");
            }
        }
    }
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x162c
// Size: 0x71
function function_4cca00246f03b1f2(player, droppedweapon, soundposition) {
    guntype = player.var_d1d541d826231cad.guntype;
    while (true) {
        wait 20;
        if (!isdefined(droppedweapon)) {
            return;
        }
        playsoundatpos(soundposition, level.var_20e6a6f36157adc["no_user_bark"].lines[guntype]);
    }
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x16a5
// Size: 0x96
function function_aba04688789ce643(droppedweapon, objweapon, var_cdce80998ec668ee) {
    if (!function_d8239f9d7164d68e(droppedweapon)) {
        return;
    }
    if (!function_cd101ca0e17cfd60(self, "dropped")) {
        return;
    }
    if (isdefined(var_cdce80998ec668ee)) {
        soundposition = var_cdce80998ec668ee;
    } else {
        soundposition = droppedweapon.origin;
    }
    playsoundatpos(soundposition, level.var_20e6a6f36157adc["dropped"].lines[self.var_d1d541d826231cad.guntype]);
    thread function_4cca00246f03b1f2(self, droppedweapon, soundposition);
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1743
// Size: 0x29
function function_bd70b31dd13292bc(player) {
    player endon("death_or_disconnect");
    level endon("game_ended");
    wait 2;
    function_55b08d6d71b41402(player, "player_death_revived_teammate");
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1774
// Size: 0x69
function function_bd70a21dd1326d59(player) {
    player endon("death_or_disconnect");
    level endon("game_ended");
    if (isdefined(player.var_d1d541d826231cad) && istrue(player.var_d1d541d826231cad.var_6a8d989a494b74c4)) {
        player.var_d1d541d826231cad.var_6a8d989a494b74c4 = 0;
    }
    wait 2;
    function_55b08d6d71b41402(player, "teammate_death_revived_me");
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17e5
// Size: 0x59e
function function_14c5b1a6f5a9f37c(data) {
    if (isdefined(data.victim.var_d1d541d826231cad)) {
        data.victim.var_d1d541d826231cad.var_e759da6edf27a220 = 0;
        data.victim.var_d1d541d826231cad.var_56560380a4b1a392 = [];
        data.victim.var_d1d541d826231cad.var_6a8d989a494b74c4 = 1;
    }
    if (data.attacker == data.victim) {
        return;
    }
    if (!isplayer(data.attacker)) {
        return;
    }
    foreach (otherplayer in level.var_1642386c8e73a981) {
        if (!isdefined(otherplayer)) {
            continue;
        }
        if (otherplayer == data.attacker || otherplayer == data.victim) {
            continue;
        }
        if (!isdefined(otherplayer.var_d1d541d826231cad)) {
            continue;
        }
        if (!isdefined(otherplayer.var_d1d541d826231cad.var_cf433c13dd493f3f[data.victim.guid])) {
            continue;
        }
        if (gettime() / 1000 < otherplayer.var_d1d541d826231cad.var_cf433c13dd493f3f[data.victim.guid] + 1) {
            function_55b08d6d71b41402(otherplayer, "kill_steal");
        }
    }
    if (!isdefined(data.attacker.var_d1d541d826231cad)) {
        return;
    }
    data.attacker.var_d1d541d826231cad.var_e759da6edf27a220 += 1;
    if (function_a1e1b35a0bd2f57c(data.attacker, "close_call") && gettime() / 1000 < data.attacker.var_d1d541d826231cad.lastdamagedtime + 2 && data.attacker.health < 50) {
        if (randomfloat(1) < 0.5) {
            function_55b08d6d71b41402(data.attacker, "close_call");
            return;
        }
    }
    if (string_starts_with(data.weaponfullstring, "throwingknife_mp")) {
        function_55b08d6d71b41402(data.attacker, "throwing_knife_kill");
    }
    if (isdefined(data.attacker.vehicle) && data.meansofdeath == "MOD_CRUSH") {
        function_55b08d6d71b41402(data.attacker, "enemy_rammed");
    }
    if (!namespace_e0ee43ef2dddadaa::isspreadweapon(data.objweapon) && scripts\cp_mp\utility\damage_utility::isheadshot(data.hitloc, data.meansofdeath, data.attacker)) {
        function_55b08d6d71b41402(data.attacker, "headshot_kill");
    } else if (data.objweapon issilenced()) {
        function_55b08d6d71b41402(data.attacker, "stealth_kill");
    } else if (data.meansofdeath == "MOD_MELEE") {
        function_55b08d6d71b41402(data.attacker, "melee_kill");
    }
    if (isdefined(data.attacker.recentkillcount) && data.attacker.recentkillcount > 1) {
        if (data.attacker.recentkillcount == 2) {
            function_55b08d6d71b41402(data.attacker, "killed_enemy_double");
        } else if (data.attacker.recentkillcount == 3) {
            function_55b08d6d71b41402(data.attacker, "killed_enemy_triple");
        } else {
            function_55b08d6d71b41402(data.attacker, "killed_enemy_multi");
        }
    }
    if (data.attacker.var_d1d541d826231cad.var_e759da6edf27a220 == 5) {
        function_55b08d6d71b41402(data.attacker, "killed_enemy_5x");
        return;
    }
    if (data.attacker.var_d1d541d826231cad.var_e759da6edf27a220 == 10) {
        function_55b08d6d71b41402(data.attacker, "killed_enemy_10x");
        return;
    }
    if (data.attacker.var_d1d541d826231cad.var_e759da6edf27a220 == 15) {
        function_55b08d6d71b41402(data.attacker, "killed_enemy_15x");
        return;
    }
    if (data.attacker.var_d1d541d826231cad.var_e759da6edf27a220 == 20) {
        function_55b08d6d71b41402(data.attacker, "killed_enemy_20x");
        return;
    }
    function_55b08d6d71b41402(data.attacker, "killed_enemy");
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d8b
// Size: 0xa8
function function_27fe46449778a3e3(winner) {
    if (isdefined(level.var_1642386c8e73a981)) {
        foreach (player in level.var_1642386c8e73a981) {
            if (!isdefined(player)) {
                continue;
            }
            if (!isdefined(player.team)) {
                continue;
            }
            if (player.team == winner) {
                function_55b08d6d71b41402(player, "round_won");
                continue;
            }
            function_55b08d6d71b41402(player, "round_lost");
        }
    }
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1e3b
// Size: 0x108
function function_967de5f2484e51ef(player, killstreakname) {
    wait 1;
    if (killstreakname == "uav") {
        function_55b08d6d71b41402(self, "activate_uav");
    } else if (killstreakname == "scrambler_drone_guard") {
        function_55b08d6d71b41402(self, "activate_counter_uav");
    } else if (killstreakname == "cruise_predator" || killstreakname == "chopper_gunner" || killstreakname == "gunship" || killstreakname == "pac_sentry") {
        function_55b08d6d71b41402(self, "activate_rided");
    } else if (killstreakname == "precision_airstrike" || killstreakname == "toma_strike" || killstreakname == "directional_uav" || killstreakname == "fuel_airstrike" || killstreakname == "hover_jet" || killstreakname == "auto_drone" || killstreakname == "airdrop_escort") {
        function_55b08d6d71b41402(self, "activate_guided");
    } else if (killstreakname == "assault_drone") {
        function_55b08d6d71b41402(self, "activate_drone");
    }
    function_55b08d6d71b41402(self, "killstreak_used");
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1f4b
// Size: 0x30
function function_d0c66e5691fa4856(player, event) {
    level endon("game_ended");
    player endon("death_or_disconnect");
    wait 2;
    function_55b08d6d71b41402(player, event);
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f83
// Size: 0x33
function function_556866c3c047a8b8(victim) {
    level endon("game_ended");
    victim endon("death_or_disconnect");
    self endon("death_or_disconnect");
    wait 0.5;
    function_55b08d6d71b41402(self, "enemy_armor_depleted");
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1fbe
// Size: 0x3f
function function_f0b105c339fb3e1(objweapon) {
    weapongroup = function_f3bb4f4911a1beb2("weapons", "getWeaponGroup", objweapon);
    return isdefined(weapongroup) && (weapongroup == "weapon_sniper" || weapongroup == "weapon_dmr");
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2006
// Size: 0x306
function function_a81df078cbb965a5() {
    self endon("game_ended");
    while (true) {
        self waittill("post_player_damaged", einflictor, eattacker, victim, idamage, idflags, smeansofdeath, objweapon, var_fcdf19e3cdd29669, vpoint, vdir, shitloc, psoffsettime, modelindex, partname);
        if (!isdefined(victim) || !isdefined(eattacker)) {
            /#
                iprintln("<dev string:x4b>");
            #/
            continue;
        }
        if (!function_7b50742a287d3ca1(eattacker) && !function_7b50742a287d3ca1(victim)) {
            continue;
        }
        if (eattacker == victim) {
            continue;
        }
        brcircledamage = isdefined(objweapon.basename) && objweapon.basename == "danger_circle_br";
        if (brcircledamage) {
            continue;
        }
        sniperdistance = distancesquared(victim.origin, eattacker.origin) > 250000;
        if (isplayer(victim) && victim.health > 1) {
            if (smeansofdeath == "MOD_EXPLOSIVE" || smeansofdeath == "MOD_PROJECTILE_SPLASH" || smeansofdeath == "MOD_GRENADE_SPLASH") {
                thread function_d0c66e5691fa4856(victim, "player_damaged_explosive");
            } else if (victim.health < 30) {
                thread function_d0c66e5691fa4856(victim, "health_low");
            } else if (function_f0b105c339fb3e1(objweapon) && istrue(sniperdistance)) {
                thread function_d0c66e5691fa4856(victim, "player_damaged_sniper");
            } else {
                thread function_d0c66e5691fa4856(victim, "player_damaged");
            }
            if (isdefined(victim.var_d1d541d826231cad) && victim.var_d1d541d826231cad.var_759862146a4569cb != 0) {
                victim.var_d1d541d826231cad.var_759862146a4569cb = gettime() / 1000;
            }
            if (isdefined(victim.var_d1d541d826231cad)) {
                victim.var_d1d541d826231cad.lastdamagedtime = gettime() / 1000;
            }
        }
        if (isplayer(eattacker) && victim.health > 1) {
            if (isdefined(eattacker.var_d1d541d826231cad)) {
                eattacker.var_d1d541d826231cad.var_cf433c13dd493f3f[victim.guid] = gettime() / 1000;
            }
            if (function_f0b105c339fb3e1(objweapon) && istrue(sniperdistance)) {
                thread function_d0c66e5691fa4856(eattacker, "enemy_damaged_sniper");
                continue;
            }
            thread function_d0c66e5691fa4856(eattacker, "enemy_damaged");
        }
    }
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2314
// Size: 0xe5
function function_3addbb064480340() {
    self endon("game_ended");
    while (true) {
        currenttime = gettime() / 1000;
        for (k = 0; k < level.var_1642386c8e73a981.size; k++) {
            if (!isplayer(level.var_1642386c8e73a981[k])) {
                continue;
            }
            if (currenttime < level.var_1642386c8e73a981[k].var_d1d541d826231cad.lastdeploy + 10) {
                continue;
            }
            if (level.var_1642386c8e73a981[k] issprinting()) {
                if (randomfloat(1) < 0.3) {
                    function_55b08d6d71b41402(level.var_1642386c8e73a981[k], "sprint");
                    continue;
                }
                function_cd101ca0e17cfd60(level.var_1642386c8e73a981[k], "sprint");
            }
        }
        wait 0.3;
    }
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2401
// Size: 0x1b9
function function_eb8660dbfa7117b5() {
    self endon("disconnect");
    self endon("remove_talking_gun");
    while (true) {
        self waittill("weapon_fired");
        firetime = weaponfiretime(self.currentweapon.basename);
        time = gettime() / 1000;
        if (isdefined(self.var_d1d541d826231cad)) {
            if (isdefined(self.var_d1d541d826231cad) && self.var_d1d541d826231cad.var_759862146a4569cb != 0) {
                self.var_d1d541d826231cad.var_759862146a4569cb = gettime() / 1000;
            }
            if (self.var_d1d541d826231cad.var_76665eaaaabda31 == 0) {
                self.var_d1d541d826231cad.var_76665eaaaabda31 = time;
                self.var_d1d541d826231cad.var_b303cb73dd6407f5 = time + firetime + 0.1;
            } else if (time < self.var_d1d541d826231cad.var_b303cb73dd6407f5) {
                if (time > self.var_d1d541d826231cad.var_76665eaaaabda31 + 1.5) {
                    function_55b08d6d71b41402(self, "war_cry");
                    self.var_d1d541d826231cad.var_76665eaaaabda31 = 0;
                } else {
                    self.var_d1d541d826231cad.var_b303cb73dd6407f5 = time + firetime + 0.1;
                }
            } else {
                self.var_d1d541d826231cad.var_76665eaaaabda31 = 0;
            }
        }
        if (self getcurrentweaponclipammo() == 0 && self getweaponammostock(self.currentweapon) == 0) {
            function_55b08d6d71b41402(self, "player_zero_ammo");
        }
    }
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25c2
// Size: 0x2d
function function_cd39869120c7218() {
    self endon("disconnect");
    self endon("remove_talking_gun");
    while (true) {
        self waittill("weapon_inspect");
        function_55b08d6d71b41402(self, "weapon_inspect");
    }
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x25f7
// Size: 0x26d
function function_26acd7206ca70734(sparams) {
    var_51ba34154a645b70 = isdefined(self.bossname);
    var_1ab543205027c0a8 = isdefined(sparams.eattacker) && sparams.eattacker scripts\cp_mp\vehicles\vehicle::isvehicle() && isdefined(sparams.eattacker.owner) && isplayer(sparams.eattacker.owner);
    if ((!isdefined(sparams.eattacker) || !isplayer(sparams.eattacker)) && !var_1ab543205027c0a8) {
        return;
    }
    if (var_51ba34154a645b70) {
        function_55b08d6d71b41402(sparams.eattacker, "dmz_boss_kill");
        return;
    }
    if (function_a1e1b35a0bd2f57c(sparams.eattacker, "close_call") && gettime() / 1000 < sparams.eattacker.var_d1d541d826231cad.lastdamagedtime + 2 && sparams.eattacker.health < 50) {
        if (randomfloat(1) < 0.5) {
            function_55b08d6d71b41402(sparams.eattacker, "close_call");
            return;
        }
        return;
    }
    if (var_1ab543205027c0a8 && sparams.smeansofdeath == "MOD_CRUSH") {
        function_55b08d6d71b41402(sparams.eattacker.owner, "enemy_rammed");
        return;
    }
    if (!namespace_e0ee43ef2dddadaa::isspreadweapon(sparams.sweapon) && scripts\cp_mp\utility\damage_utility::isheadshot(sparams.shitloc, sparams.smeansofdeath, sparams.eattacker)) {
        function_55b08d6d71b41402(sparams.eattacker, "headshot_kill");
        return;
    }
    if (sparams.sweapon issilenced()) {
        function_55b08d6d71b41402(sparams.eattacker, "stealth_kill");
        return;
    }
    if (sparams.smeansofdeath == "MOD_MELEE") {
        function_55b08d6d71b41402(sparams.eattacker, "melee_kill");
        return;
    }
    function_55b08d6d71b41402(sparams.eattacker, "player_killed_agent");
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x286c
// Size: 0x94
function function_aea35499f76041bb() {
    self endon("death_or_disconnect");
    self endon("remove_talking_gun");
    self.var_d1d541d826231cad.lastdeploy = gettime() / 1000;
    if (issharedfuncdefined("game", "gameFlag") && ![[ getsharedfunc("game", "gameFlag") ]]("prematch_done")) {
        level waittill("prematch_done");
        wait 5;
    }
    self.var_d1d541d826231cad.lastdeploy = gettime() / 1000;
    function_55b08d6d71b41402(self, "deploy");
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2908
// Size: 0x181
function function_d8239f9d7164d68e(droppedweapon) {
    if (!isdefined(droppedweapon)) {
        return false;
    }
    weapontocheck = undefined;
    if (isweapon(droppedweapon) && !isnullweapon(droppedweapon)) {
        weapontocheck = droppedweapon;
    } else if (isdefined(droppedweapon.objweapon)) {
        if (isnullweapon(droppedweapon.objweapon)) {
            return false;
        }
        weapontocheck = droppedweapon.objweapon;
    } else if (isdefined(droppedweapon.classname) && droppedweapon.classname == "scriptable") {
        if (!isdefined(droppedweapon.customweaponname)) {
            return false;
        }
        weapontocheck = droppedweapon.customweaponname;
    } else {
        /#
            iprintlnbold("<dev string:x8a>");
        #/
        return false;
    }
    attachments = getweaponattachments(weapontocheck);
    foreach (attachment in attachments) {
        perks = namespace_e0ee43ef2dddadaa::attachmentperkmap(weapontocheck, attachment);
        foreach (perk in perks) {
            if (string_starts_with(perk, "specialty_talkinggun")) {
                return true;
            }
        }
    }
    return false;
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a92
// Size: 0x3c
function function_7fd5a6abcd15e5ba() {
    self endon("game_ended");
    while (true) {
        level waittill("enter_vehicle", vehicle, player);
        function_55b08d6d71b41402(player, "vehicle_enter");
    }
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ad6
// Size: 0x42
function function_7143e9d45cff1d4c() {
    self endon("game_ended");
    while (true) {
        level waittill("exit_vehicle", vehicle, player);
        wait 0.1;
        function_55b08d6d71b41402(player, "vehicle_exit");
    }
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b20
// Size: 0x8c
function function_572b61079927196b() {
    while (true) {
        level waittill("br_ending_start", winners);
        foreach (player in level.var_1642386c8e73a981) {
            if (isdefined(winners) && array_contains(winners, player)) {
                function_55b08d6d71b41402(player, "round_won");
            }
            function_f70b3ce9138e10b(player);
        }
    }
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2bb4
// Size: 0xf8
function function_ef6885141252869(player, grenade) {
    issuper = function_f3bb4f4911a1beb2("weapons", "isSuperWeapon", grenade.weapon_object);
    if (issuper) {
        function_55b08d6d71b41402(player, "equipment_deployed");
        return;
    }
    if (namespace_4fb9dddfb8c1a67a::isequipmentlethal(grenade.equipmentref)) {
        if (grenade.equipmentref != "equip_throwing_knife") {
            function_55b08d6d71b41402(player, "grenade_lethal_used");
        }
        return;
    }
    if (namespace_4fb9dddfb8c1a67a::isequipmenttactical(grenade.equipmentref)) {
        switch (grenade.equipmentref) {
        case #"hash_6d194c409057b2":
        case #"hash_4b4a6458f00d9319":
        case #"hash_7c09786dbc292c05":
        case #"hash_8770d1da0d7395b9":
            break;
        default:
            function_55b08d6d71b41402(player, "grenade_tactical_used");
            break;
        }
    }
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2cb4
// Size: 0x1fe
function function_2cc0d17b7e641e00(player, guntype) {
    playdeploy = !isdefined(player.var_d1d541d826231cad) || player.var_d1d541d826231cad.var_6a8d989a494b74c4;
    if (!isdefined(level.var_1642386c8e73a981)) {
        level.var_1642386c8e73a981 = [];
    }
    if (!isdefined(player.var_d1d541d826231cad)) {
        player function_b04504ffd83192e1();
    }
    player.var_d1d541d826231cad.guntype = guntype;
    player.var_d1d541d826231cad.active = 1;
    player.var_d1d541d826231cad.var_6a8d989a494b74c4 = 0;
    level.var_1642386c8e73a981[level.var_1642386c8e73a981.size] = player;
    if (!isdefined(level.var_3f30d667ff99b732)) {
        level.var_3f30d667ff99b732 = 1;
        level scripts\common\callbacks::add("player_death", &function_14c5b1a6f5a9f37c);
        namespace_a2c409363d7f24e7::function_ba46cf958ae0cbda(&function_aba04688789ce643);
        namespace_a2c409363d7f24e7::function_39027364b9c16127(&function_aba04688789ce643);
        level scripts\common\callbacks::add("on_ai_killed", &function_26acd7206ca70734);
        level thread function_a81df078cbb965a5();
        level thread function_3addbb064480340();
        level thread function_7fd5a6abcd15e5ba();
        level thread function_7143e9d45cff1d4c();
        if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            namespace_d9d9691c846bdad7::function_3a363ae38f309166(&function_c5f05871ba7c3aa3);
            level thread function_572b61079927196b();
        }
    }
    player thread function_eb8660dbfa7117b5();
    player thread function_cd39869120c7218();
    weaponname = getcompleteweaponname(player.currentweapon);
    if (isdefined(player.tookweaponfrom) && isdefined(player.tookweaponfrom[weaponname])) {
        if (player.tookweaponfrom[weaponname] == player) {
            function_55b08d6d71b41402(self, "reunited_deploy");
        } else {
            function_55b08d6d71b41402(self, "stranger_deploy");
        }
    } else if (playdeploy) {
        player thread function_aea35499f76041bb();
    }
    player setclientomnvar("ui_talkinggun_faceid", guntype);
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2eba
// Size: 0xbf
function function_f70b3ce9138e10b(player) {
    if (!isdefined(player)) {
        return;
    }
    if (!isdefined(player.var_d1d541d826231cad)) {
        return;
    }
    player notify("remove_talking_gun");
    player.var_d1d541d826231cad.active = 0;
    for (k = 0; k < level.var_1642386c8e73a981.size; k++) {
        if (level.var_1642386c8e73a981[k] == player) {
            var_321cffbb6b6baa79 = level.var_1642386c8e73a981.size - 1;
            level.var_1642386c8e73a981[k] = level.var_1642386c8e73a981[var_321cffbb6b6baa79];
            level.var_1642386c8e73a981[var_321cffbb6b6baa79] = undefined;
            break;
        }
    }
    player setclientomnvar("ui_talkinggun_faceid", "none");
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f81
// Size: 0xa
function function_da3d9f34d24ac85a() {
    function_f70b3ce9138e10b(self);
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f93
// Size: 0x21
function function_96f59fefd781e47() {
    if (!getdvarint(@"hash_18bf04d5c5766462")) {
        return;
    }
    function_2cc0d17b7e641e00(self, "announcer");
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2fbc
// Size: 0x21
function function_96f5afefd78207a() {
    if (!getdvarint(@"hash_18bf04d5c5766462")) {
        return;
    }
    function_2cc0d17b7e641e00(self, "robot");
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2fe5
// Size: 0x21
function function_96f5bfefd7822ad() {
    if (!getdvarint(@"hash_18bf04d5c5766462")) {
        return;
    }
    function_2cc0d17b7e641e00(self, "hypeman");
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x300e
// Size: 0x21
function function_96f54fefd781348() {
    if (!getdvarint(@"hash_18bf04d5c5766462")) {
        return;
    }
    function_2cc0d17b7e641e00(self, "blackcell");
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3037
// Size: 0xf
function function_fc6e0b02abb995cb() {
    function_2cc0d17b7e641e00(self, "announcer");
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x304e
// Size: 0xf
function function_73e4ae4f932e9f30() {
    function_2cc0d17b7e641e00(self, "robot");
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3065
// Size: 0xf
function function_cc0fddfe26b772a7() {
    function_2cc0d17b7e641e00(self, "blackcell");
}

// Namespace talking_gun / namespace_27c74152ccb91331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x307c
// Size: 0xf
function function_fc09644394bf843f() {
    function_2cc0d17b7e641e00(self, "npc");
}

/#

    // Namespace talking_gun / namespace_27c74152ccb91331
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3093
    // Size: 0x93
    function function_3d9dc061bbfb25ab() {
        while (true) {
            eventname = getdvar(@"hash_53cb08e924ea65a4");
            if (eventname != "<dev string:xd7>") {
                event = level.var_20e6a6f36157adc[eventname];
                thread function_547117b1a7105f45(self, event.delay, event.lines[self.var_d1d541d826231cad.guntype]);
                setdvar(@"hash_53cb08e924ea65a4", "<dev string:xd7>");
            }
            wait 0.05;
        }
    }

#/
