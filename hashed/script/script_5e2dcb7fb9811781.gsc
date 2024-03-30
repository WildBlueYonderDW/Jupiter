// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\throttle.gsc;
#using script_247745a526421ba7;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\callback_group.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\engine\trace.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\cp_mp\challenges.gsc;
#using script_189b67b2735b981d;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_58be75c518bf0d40;
#using scripts\mp\gamescore.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace super_emp_pulse;

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47b
// Size: 0x65
function function_dca5550c46b2a111() {
    if (!isdefined(level.superglobals.staticsuperdata["super_emp_pulse"])) {
        return;
    }
    level.superglobals.staticsuperdata["super_emp_pulse"].var_f6604eebabcac6c2 = &function_f41bae22bcc2bde7;
    level.super_emp_pulse_throttle = throttle_initialize("super_emp_pulse_throttle", 1, 0.3);
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e7
// Size: 0x5
function function_f41bae22bcc2bde7() {
    return true;
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f4
// Size: 0x15
function function_f62e25cb503d7bab() {
    result = function_e192d40d87bd55a9();
    return result;
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x511
// Size: 0x1b
function emppulse_unset() {
    function_75baa17a54260f6f(0);
    scripts/mp/supers::function_7203e7aa96ff0ba9(0);
    self notify("empPulse_unset");
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x533
// Size: 0x1d
function function_e83e2d8dc74ffdbb() {
    scripts/mp/supers::function_7203e7aa96ff0ba9(30);
    function_75baa17a54260f6f(1);
    thread function_3f97c8a2961e9d18();
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x557
// Size: 0x51
function function_3f97c8a2961e9d18() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("super_use_finished");
    self endon("empPulse_unset");
    while (true) {
        self waittill("super_use_charging");
        if (issuperready()) {
            continue;
        }
        if (issuperinuse()) {
            continue;
        }
        emppulse_unset();
        break;
    }
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5af
// Size: 0x12
function function_c2ca731bdb780549() {
    function_75baa17a54260f6f(0);
    function_ddeb08081f6fabea();
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c8
// Size: 0x40
function function_e192d40d87bd55a9() {
    objweapon = makeweapon("emp_pulse_device_mp");
    deploysuccess = giveandfireoffhandreliable(objweapon);
    if (istrue(deploysuccess)) {
        return function_4941256ee86725f8();
    }
    return refundsuper();
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60f
// Size: 0x83
function function_4941256ee86725f8() {
    time = getdvarfloat(@"hash_e347daec58694e5", 0.65);
    self setclientomnvar("ui_super_ddos_screen_on", 1);
    wait(time);
    function_c2ca731bdb780549();
    thread function_58634008ff0b995();
    thread function_a2b3da8c5c455aa9();
    thread function_68474541e3f6e6c3();
    scripts/cp_mp/challenges::function_d997435895422ecc("super_emp_pulse", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
    namespace_27c74152ccb91331::function_55b08d6d71b41402(self, "equipment_deployed");
    return true;
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69a
// Size: 0x3e
function function_75baa17a54260f6f(isenabled) {
    if (isenabled) {
        self setclientomnvar("ui_emp_target_detector_on_give_widget", 1);
        thread function_a985f47623d10ac();
        return;
    }
    self notify("empPulse_disableOnGiveWidget");
    self setclientomnvar("ui_emp_target_detector_on_give_widget", 0);
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6df
// Size: 0xa6
function function_a985f47623d10ac() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("empPulse_disableOnGiveWidget");
    maxdist = sqrt(5000000);
    while (true) {
        numents = function_63973975ceee9dda(empdebuff_get_emp_ents(self.origin, maxdist), self.origin, self.angles).size;
        numents = int(clamp(numents, 0, 5));
        widgetval = numents + 1;
        self setclientomnvar("ui_emp_target_detector_on_give_widget", widgetval);
        function_f632348cbb773537(level.super_emp_pulse_throttle, self);
    }
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78c
// Size: 0x24
function function_68474541e3f6e6c3() {
    level endon("game_ended");
    self endon("disconnect");
    wait(0.88);
    self setclientomnvar("ui_super_ddos_screen_on", 0);
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b7
// Size: 0x46
function function_58634008ff0b995() {
    self endon("disconnect");
    level endon("game_ended");
    self setscriptablepartstate("DDoSPulse", "pulse", 0);
    waittill_any_2("death", "scramble_clear");
    self setscriptablepartstate("DDoSPulse", "off", 0);
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x804
// Size: 0x2c7
function function_f83892872eaf9d79(objweapon) {
    self endon("disconnect");
    level endon("game_ended");
    level endon("round_end");
    var_170b85c668cf4b59 = self.angles;
    blastorigin = self.origin;
    step = 100;
    maxdist = 1000;
    waittime = 0.1;
    currentdist = step;
    empdist = sqrt(5000000);
    possibleplayers = getplayersinradius(self.origin, empdist);
    possibleents = empdebuff_get_emp_ents(self.origin, empdist);
    var_dbee2266e7253dcd = function_65eb2204db38221a(possibleplayers, blastorigin, var_170b85c668cf4b59);
    var_9b64bcbed677462b = function_63973975ceee9dda(possibleents, blastorigin, var_170b85c668cf4b59, 1);
    while (currentdist <= maxdist) {
        currentdistsq = currentdist * currentdist;
        playersleft = [];
        for (i = 0; i < var_dbee2266e7253dcd.size; i++) {
            victim = var_dbee2266e7253dcd[i]["player"];
            if (!function_641436d9bd65f63c(self, victim)) {
                continue;
            }
            if (istrue(var_dbee2266e7253dcd[i]["isPulsed"])) {
                continue;
            }
            horizDistSq = var_dbee2266e7253dcd[i]["horizDistSq"];
            vertDistSq = var_dbee2266e7253dcd[i]["vertDistSq"];
            if (horizDistSq * vertDistSq <= currentdist) {
                data = packdamagedata(self, victim, 1, objweapon, "MOD_EXPLOSIVE", self, self.origin);
                thread empPulse_apply_player(data, function_8abf731d992d2081(victim));
                var_dbee2266e7253dcd[i]["isPulsed"] = 1;
                continue;
            }
            playersleft[playersleft.size] = var_dbee2266e7253dcd[i];
        }
        var_dbee2266e7253dcd = playersleft;
        entsleft = [];
        for (j = 0; j < var_9b64bcbed677462b.size; j++) {
            ent = var_9b64bcbed677462b[j]["entity"];
            if (!function_641436d9bd65f63c(self, ent)) {
                continue;
            }
            if (istrue(var_9b64bcbed677462b[j]["isPulsed"])) {
                continue;
            }
            if (var_9b64bcbed677462b[j]["horizDistSq"] <= currentdistsq) {
                if (var_9b64bcbed677462b[j]["vertDistSq"] <= 4000000) {
                    data = packdamagedata(self, ent, 1, objweapon, "MOD_EXPLOSIVE", self, self.origin);
                    thread function_25310643899068a8(data, function_8abf731d992d2081(ent));
                    var_9b64bcbed677462b[j]["isPulsed"] = 1;
                }
                continue;
            }
            entsleft[entsleft.size] = var_9b64bcbed677462b[j];
        }
        var_9b64bcbed677462b = entsleft;
        currentdist = currentdist + step;
        wait(waittime);
    }
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad2
// Size: 0x26d
function function_641436d9bd65f63c(attacker, victim) {
    if (!isdefined(victim)) {
        return false;
    }
    if (isdefined(victim.towerstruct) && isdefined(victim.towerstruct.uav_station)) {
        if (!isdefined(victim.towerstruct.uav_station.activeteam)) {
            return true;
        } else {
            return !istrue(victim.towerstruct.uav_station.activeteam == attacker.team);
        }
    }
    if (isdefined(victim.stronghold)) {
        if (!isdefined(victim.stronghold.capturedteam)) {
            return true;
        } else {
            return !istrue(victim.stronghold.capturedteam == attacker.team);
        }
    }
    if (isagent(victim)) {
        return false;
    }
    if (isplayer(victim)) {
        if (victim isplayerheadless()) {
            return false;
        }
        if (victim == attacker) {
            return false;
        }
        if (!isreallyalive(victim)) {
            return false;
        }
        if (!istrue(scripts/cp_mp/utility/player_utility::playersareenemies(attacker, victim)) && !istrue(getdvarint(@"hash_58254c61de76bffe", 0))) {
            return false;
        }
        if (victim isusingremote()) {
            return false;
        }
        if (isdefined(victim.var_9d3e90085b3f0da3)) {
            return false;
        } else {
            return true;
        }
    } else {
        if (istrue(victim.isdestroyed)) {
            return false;
        }
        entowner = victim.owner;
        if (isdefined(entowner)) {
            if (entowner == attacker && !istrue(getdvarint(@"hash_58254c61de76bffe", 0))) {
                return false;
            }
            if (!istrue(scripts/cp_mp/utility/player_utility::playersareenemies(attacker, entowner)) && !istrue(getdvarint(@"hash_58254c61de76bffe", 0))) {
                return false;
            }
        }
        team = victim.team;
        if (isdefined(team)) {
            if (team == attacker.team && !istrue(getdvarint(@"hash_58254c61de76bffe", 0))) {
                return false;
            }
        }
        if (victim scripts/cp_mp/vehicles/vehicle::isvehicle() && !scripts/cp_mp/vehicles/vehicle::vehicle_isenemytoplayer(victim, attacker)) {
            return false;
        }
        if (isdefined(victim.vehicle) && victim.vehicle scripts/cp_mp/vehicles/vehicle::isvehicle() && !scripts/cp_mp/vehicles/vehicle::vehicle_isenemytoplayer(victim.vehicle, attacker)) {
            return false;
        }
        return true;
    }
    return false;
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd47
// Size: 0x2e
function private function_150ef769c933224a(a, b) {
    if (a["horizDistSq"] < b["horizDistSq"]) {
        return 1;
    }
    return 0;
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd7c
// Size: 0x19a
function function_65eb2204db38221a(sourcearray, reforigin, var_47b3acf386b6f5a) {
    filteredplayers = [];
    foreach (player in sourcearray) {
        if (!function_641436d9bd65f63c(self, player)) {
            continue;
        }
        sourceforward = anglestoforward(var_47b3acf386b6f5a);
        sourceup = anglestoup(var_47b3acf386b6f5a);
        var_426aca92d85b305c = flatten_vector(player.origin - reforigin);
        vertdist = vectordot(var_426aca92d85b305c, sourceup);
        horizdist = vectordot(var_426aca92d85b305c, sourceforward);
        if (abs(vertdist) > 2000) {
            continue;
        }
        if (abs(horizdist) > 1000) {
            continue;
        }
        var_df44da7768cc370f = anglestoforward(var_47b3acf386b6f5a);
        anglediff = math::anglebetweenvectorssigned(var_df44da7768cc370f, var_426aca92d85b305c, (0, 0, 1));
        if (abs(anglediff) > 110) {
            continue;
        }
        index = filteredplayers.size;
        filteredplayers[index]["player"] = player;
        filteredplayers[index]["vertDistSq"] = vertdist * vertdist;
        filteredplayers[index]["horizDistSq"] = horizdist * horizdist;
        filteredplayers[index]["isPulsed"] = 0;
    }
    filteredplayers = array_sort_with_func(filteredplayers, &function_150ef769c933224a);
    return filteredplayers;
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf1e
// Size: 0x1c0
function function_63973975ceee9dda(sourcearray, reforigin, var_47b3acf386b6f5a, sort) {
    filteredents = [];
    sourceforward = anglestoforward(var_47b3acf386b6f5a);
    sourceup = anglestoup(var_47b3acf386b6f5a);
    sourceside = anglestoright(var_47b3acf386b6f5a);
    foreach (ent in sourcearray) {
        if (!istrue(function_641436d9bd65f63c(self, ent))) {
            continue;
        }
        var_426aca92d85b305c = ent.origin - reforigin;
        vertdist = vectordot(var_426aca92d85b305c, sourceup);
        if (abs(vertdist) > 2000) {
            continue;
        }
        horizDistSq = pow(vectordot(var_426aca92d85b305c, sourceforward), 2) + pow(abs(vectordot(var_426aca92d85b305c, sourceside)), 2);
        if (abs(horizDistSq) > 1000000) {
            continue;
        }
        anglediff = math::anglebetweenvectorssigned(sourceforward, var_426aca92d85b305c, (0, 0, 1));
        if (abs(anglediff) > 110) {
            continue;
        }
        index = filteredents.size;
        filteredents[index]["entity"] = ent;
        filteredents[index]["horizDistSq"] = horizDistSq;
        filteredents[index]["vertDistSq"] = vertdist * vertdist;
        filteredents[index]["isPulsed"] = 0;
    }
    if (istrue(sort)) {
        filteredents = array_sort_with_func(filteredents, &function_150ef769c933224a);
    }
    return filteredents;
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e6
// Size: 0x59
function function_a2b3da8c5c455aa9() {
    self endon("disconnect");
    objweapon = makeweapon("emp_pulse_mp");
    thread function_757161adb13d0e4c();
    self earthquakeforplayer(0.2, 1, self.origin, 2000);
    thread function_cf17a9452e2260df(objweapon);
    function_f83892872eaf9d79(objweapon);
    function_2f0d9315ab20c4bf();
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1146
// Size: 0x4b
function function_757161adb13d0e4c() {
    self endon("disconnect");
    level endon("game_ended");
    self setscriptablepartstate("DDoSBlast", "initial_blast", 0);
    waittill_any_timeout_2(1, "death", "scramble_clear");
    self setscriptablepartstate("DDoSBlast", "off", 0);
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1198
// Size: 0x11c
function function_cf17a9452e2260df(objweapon) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    self notify("empPulse_scrambling");
    self endon("empPulse_scrambling");
    var_8ee201a397cd1843 = gettime() + 6000;
    waittime = 0.1;
    while (gettime() < var_8ee201a397cd1843) {
        players = getplayersinradius(self.origin, 500);
        foreach (player in players) {
            if (!function_641436d9bd65f63c(self, player)) {
                continue;
            }
            if (!isdefined(player.var_9d3e90085b3f0da3)) {
                data = packdamagedata(self, player, 1, objweapon, "MOD_EXPLOSIVE", self, self.origin);
                player thread empPulse_apply_player(data, function_8abf731d992d2081(player));
            }
        }
        wait(waittime);
    }
    self notify("scramble_clear");
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12bb
// Size: 0x102
function function_194f1400b244a82b(target) {
    if (!isdefined(self.var_3ff0b2483ea046e3)) {
        self.var_3ff0b2483ea046e3 = [];
    }
    entitynum = target getentitynumber();
    lifeindex = ter_op(isdefined(self.matchdatalifeindex), self.matchdatalifeindex, 0);
    if (!isdefined(self.var_3ff0b2483ea046e3[entitynum]) || self.var_3ff0b2483ea046e3[entitynum] > lifeindex) {
        self.var_3ff0b2483ea046e3[entitynum] = lifeindex;
        if (scripts/engine/utility::issharedfuncdefined("player", "doScoreEvent")) {
            self thread [[ scripts/engine/utility::getsharedfunc("player", "doScoreEvent") ]]("emped_player");
        }
        if (isdefined(self.super)) {
            if (!isdefined(self.super.hitcount)) {
                self.super.hitcount = 1;
            }
            self.super.hitcount++;
        }
    }
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13c4
// Size: 0x123
function function_25310643899068a8(data, time) {
    var_d5c235d554645bbc = 0;
    if (getdvarint(@"hash_10320e52e3e9ab5c", 0)) {
        var_d5c235d554645bbc = 1;
    }
    attacker = self;
    var_9cc7d33e2e2ebfef = function_59dd501e1d9eb7bf(self);
    victim = data.victim;
    data.time = time;
    if (!isdefined(attacker) || !isdefined(victim)) {
        return;
    }
    if (isdefined(victim.var_af81370570c04ca) && victim.var_af81370570c04ca > 0) {
        emptime = victim.var_af81370570c04ca;
    }
    if (isdefined(victim.type) && istrue(victim.type == "dmz_uav_tower")) {
    } else if (isdefined(var_9cc7d33e2e2ebfef) && victim.classname != "trigger_radius") {
        thread function_6b8603ff55f4ed2c([victim], self, var_9cc7d33e2e2ebfef, time, "ddos_target_non_player", "perk_superior");
    }
    thread function_662905d3b9455612(data, time, var_d5c235d554645bbc);
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14ee
// Size: 0x9d
function function_59dd501e1d9eb7bf(attacker) {
    var_91954ef8d7823ca4 = getdvarint(@"hash_8863a21e430252d5", 0) == 1;
    if (!isagent(attacker)) {
        if (!level.teambased || var_91954ef8d7823ca4) {
            return [attacker];
        }
        if (namespace_ca7b90256548aa40::shouldmodesetsquads()) {
            return level.squaddata[attacker.team][attacker.sessionsquadid].players;
        }
        return getteamdata(attacker.team, "players");
    }
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1592
// Size: 0x170
function empPulse_apply_player(data, overridetime) {
    data.victim notify("empPulse_apply_player");
    data.victim endon("empPulse_apply_player");
    apply_emp_struct(data, 0);
    self function_9b28bd480aaad85f(1);
    data.victim thread function_64d9a2632f1a99c7(data.attacker);
    data.attacker thread function_194f1400b244a82b(data.victim);
    scripts/mp/gamescore::trackdebuffassist(data.attacker, data.victim, data.objweapon.basename);
    data.victim function_954bd233e4e1a4ab(1);
    msg = function_1a710e4b1d09123b(data, overridetime);
    data.victim function_954bd233e4e1a4ab(0);
    if (isdefined(data.victim)) {
        data.victim remove_emp();
        if (isdefined(data.attacker) && isreallyalive(data.attacker)) {
            scripts/mp/gamescore::untrackdebuffassist(data.attacker, data.victim, data.objweapon.basename);
        }
        self function_9b28bd480aaad85f(0);
    }
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1709
// Size: 0x45
function function_954bd233e4e1a4ab(var_befbe3bc1857da1b) {
    if (!scripts/cp_mp/utility/game_utility::function_d2d2b803a7b741a4()) {
        return;
    }
    /#
        assertex(isdefined(var_befbe3bc1857da1b), "NVG Scramble attempted to be set without specifying a state value. Please set isOn to toggle on / off.");
    #/
    if (var_befbe3bc1857da1b) {
        self visionsetnightforplayer("iw9_mp_nvg_base_color_ddos");
        return;
    }
    self visionsetnightforplayer("iw9_mp_nvg_base_color");
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1755
// Size: 0x5c
function function_1a710e4b1d09123b(data, overridetime) {
    data.victim endon("death_or_disconnect");
    level endon("game_ended");
    time = 6;
    if (isdefined(overridetime)) {
        time = overridetime;
    }
    msg = waittill_notify_or_timeout_return("emp_cleared", time);
    return msg;
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17b9
// Size: 0x91
function function_8abf731d992d2081(victim) {
    defaulttime = getdvarfloat(@"hash_44c4511516eafbbe", 6);
    if (victim scripts/cp_mp/vehicles/vehicle::isvehicle()) {
        defaulttime = ter_op(getdvarint(@"hash_10320e52e3e9ab5c", 0), defaulttime, getdvarfloat(@"hash_820929aec8056e07", 3.5));
    }
    if (!getcurrentsuper().isinuse) {
        return defaulttime;
    }
    return clamp(getcurrentsuper().usepercent * defaulttime, 0, defaulttime);
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1851
// Size: 0x5e
function function_64d9a2632f1a99c7(jammerent) {
    self endon("disconnect");
    self endon("emp_scramble_off");
    if (isdefined(self.var_9d3e90085b3f0da3)) {
        function_ffa0f84dfa2faf4d();
    }
    self.var_9d3e90085b3f0da3 = jammerent;
    thread function_36bfca5111b03188(jammerent);
    function_7bdae2425bb328d2(jammerent);
    if (isdefined(self.var_9d3e90085b3f0da3)) {
        function_ffa0f84dfa2faf4d(jammerent);
    }
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18b6
// Size: 0x4e
function function_7bdae2425bb328d2(jammerent) {
    level endon("game_ended");
    jammerent endon("disconnect");
    self endon("disconnect");
    jammerent childthread function_46e4db17237e26b9(self);
    childthread function_243384fbcfc9cc34();
    waittill_any_timeout_3(6, "empPulse_ownerDeath", "empPulse_victimDeath", "ddos_ended_early");
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x190b
// Size: 0x1d
function function_ffa0f84dfa2faf4d(jammerent) {
    self.var_9d3e90085b3f0da3 = undefined;
    scripts/cp_mp/emp_debuff::function_f7c6d776d032122f();
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x192f
// Size: 0x1c
function function_46e4db17237e26b9(victim) {
    self waittill("death");
    victim notify("empPulse_ownerDeath");
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1952
// Size: 0x13
function function_243384fbcfc9cc34() {
    self waittill("death");
    self notify("empPulse_victimDeath");
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x196c
// Size: 0x77
function function_36bfca5111b03188(jammerent) {
    self endon("death_or_disconnect");
    self endon("emp_scramble_off");
    jammerent endon("death_or_disconnect");
    previousstrength = 0;
    scramblerstrength = 0;
    while (true) {
        scramblerstrength = function_74b2449af1d5f763(jammerent);
        var_4893b9a18cf47d6c = scramblerstrength != previousstrength;
        if (previousstrength == 0 || var_4893b9a18cf47d6c) {
            scripts/cp_mp/emp_debuff::stop_emp_scramble(previousstrength);
            scripts/cp_mp/emp_debuff::play_emp_scramble(scramblerstrength);
            previousstrength = scramblerstrength;
        }
        waitframe();
    }
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19ea
// Size: 0xb5
function function_74b2449af1d5f763(jammerent) {
    scramblerradius = 500;
    var_f3b7cc3138382dfb = scramblerradius * scramblerradius;
    distancechecksq = distance2dsquared(jammerent.origin, self.origin);
    scramblerstrength = 0;
    if (distancechecksq > var_f3b7cc3138382dfb) {
        scramblerstrength = 0;
    } else if (distancechecksq >= var_f3b7cc3138382dfb * 0.8) {
        scramblerstrength = 1;
    } else if (distancechecksq >= var_f3b7cc3138382dfb * 0.6) {
        scramblerstrength = 2;
    } else if (distancechecksq >= var_f3b7cc3138382dfb * 0.4) {
        scramblerstrength = 3;
    } else if (distancechecksq >= var_f3b7cc3138382dfb * 0.2) {
        scramblerstrength = 4;
    } else {
        scramblerstrength = 5;
    }
    return scramblerstrength;
}

// Namespace super_emp_pulse / namespace_15f48ac5c4673765
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aa7
// Size: 0x7c
function function_2f0d9315ab20c4bf() {
    if (isdefined(self.super) && isdefined(self.super.hitcount)) {
        scripts/cp_mp/challenges::function_d997435895422ecc("super_emp_pulse", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"end"), self.super.hitcount);
        self.super.hitcount = undefined;
    }
    self.var_3ff0b2483ea046e3 = undefined;
}

