// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\engine\throttle.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\common\vehicle.gsc;
#using script_600b944a95c3a7bf;
#using script_2669878cf5a1b6bc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_58be75c518bf0d40;
#using scripts\cp_mp\challenges.gsc;
#using scripts\cp_mp\utility\train_utility.gsc;
#using script_4b87f2871b6b025c;

#namespace challenges;

// Namespace challenges / scripts/cp_mp/challenges
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25fd
// Size: 0xfa
function init() {
    if (!challengesenabled()) {
        return;
    }
    var_5ee013539b0ea23c = 0;
    if (utility::issharedfuncdefined("game", "isBRStyleGameType")) {
        if ([[ utility::getsharedfunc("game", "isBRStyleGameType") ]]()) {
            var_5ee013539b0ea23c = 1;
        }
    }
    level.var_1850e46a71d6e72d = throttle::throttle_initialize("reportKillChallengeEvent", 1, level.framedurationseconds);
    if (!var_5ee013539b0ea23c && utility::issharedfuncdefined("game", "getGameType")) {
        gametype = [[ utility::getsharedfunc("game", "getGameType") ]]();
        if (isdefined(gametype) && (gametype == "brtdm" || gametype == "brtdm_mgl")) {
            var_5ee013539b0ea23c = 1;
        }
    }
    if (var_5ee013539b0ea23c) {
        level.challengetimersenabled = 1;
        level setupchallengelocales();
        level thread trackchallengetimers();
    }
    /#
        thread function_4f4a046a372e8158();
    #/
    registersharedfunc("challenges", "reportChallengeUserSerializedEventWrapper", &reportChallengeUserSerializedEventWrapper);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26fe
// Size: 0x4c
function function_4f4a046a372e8158() {
    /#
        while (true) {
            wait(1);
            if (!getdvarint(@"hash_48ae63d778571691", 0)) {
                continue;
            }
            setdvar(@"hash_37acf332efd205cc", 1);
            setdvar(@"hash_5a8c71e376f35349", 1);
            return;
        }
    #/
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2751
// Size: 0x4b8
function setupchallengelocales() {
    level.localetriggers = [];
    areas = getentarray("location_volume", "targetname");
    if (isdefined(areas) && areas.size > 0) {
        foreach (area in areas) {
            if (!isdefined(area.script_noteworthy)) {
                continue;
            }
            area.sprayid = -1;
            switch (area.script_noteworthy) {
            case #"hash_c51c246fdee94629":
                area.localeid = 1;
                area.sprayid = 0;
                break;
            case #"hash_3c20c20dc3935d6f":
                area.localeid = 2;
                area.sprayid = 1;
                break;
            case #"hash_2175f0b29e606ca5":
                area.localeid = 3;
                break;
            case #"hash_f48a166c03bb39c1":
                area.localeid = 4;
                break;
            case #"hash_2c5efc9850d0cbb5":
                area.localeid = 5;
                area.sprayid = 2;
                break;
            case #"hash_4b7c435745b1ad5e":
                area.localeid = 6;
                break;
            case #"hash_663b0900ff0e81c7":
                area.localeid = 7;
                break;
            case #"hash_959ab3efc8aa213":
                area.localeid = 8;
                area.sprayid = 3;
                break;
            case #"hash_2e0fe9d434d05e53":
                area.localeid = 9;
                break;
            case #"hash_209449a3db12c20f":
                area.localeid = 10;
                break;
            case #"hash_da04b46361bbb6a6":
                area.localeid = 11;
                break;
            case #"hash_1e6d9b2fb4016d60":
                area.localeid = 12;
                break;
            case #"hash_f00def58cc755ceb":
                area.localeid = 13;
                break;
            case #"hash_c72bae84b209b719":
                area.localeid = 14;
                break;
            case #"hash_5f22fd847b75bb06":
                area.localeid = 15;
                area.sprayid = 4;
                break;
            case #"hash_b445759ac0026f01":
                area.localeid = 16;
                break;
            case #"hash_6d93eae7a4e766a3":
                area.localeid = 17;
                break;
            case #"hash_7bff460df380c895":
                area.localeid = 18;
                break;
            case #"hash_fd6fbb1e09e1badf":
                area.localeid = 19;
                break;
            case #"hash_a86d6bdba8e7b140":
                area.localeid = 20;
                break;
            case #"hash_cc19bd6dfdb67a5e":
                area.localeid = 21;
                break;
            case #"hash_767c3e737b99b886":
                area.localeid = 22;
                break;
            case #"hash_dd3b42930dae140c":
                area.localeid = 23;
                break;
            case #"hash_7ae544b2ed0f7ef8":
                area.localeid = 24;
                break;
            case #"hash_69232c6439af5a83":
                area.localeid = 25;
                break;
            case #"hash_d10975a23b5f41c4":
                area.localeid = 26;
                break;
            case #"hash_58d20d02347be1fe":
                area.localeid = 27;
                break;
            case #"hash_c9e5d8c5fe0b0a49":
                area.localeid = 28;
                break;
            case #"hash_40928bf425cff80d":
                area.localeid = 29;
                break;
            case #"hash_afae508b9d633a55":
                area.localeid = 30;
                break;
            case #"hash_e534fd8ec73eafb4":
                area.localeid = 31;
                break;
            case #"hash_2094a957c0515134":
                area.localeid = 32;
                break;
            case #"hash_c0087eafd38b4fed":
                area.localeid = 33;
                break;
            }
        }
        level.localetriggers = areas;
    }
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c10
// Size: 0xc
function challengesenabled() {
    return level.challengesallowed;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c24
// Size: 0x72
function challengesenabledforplayer() {
    if (!challengesenabled()) {
        return false;
    }
    if (!isplayer(self) || isai(self)) {
        return false;
    }
    if (istrue(level.challengesdisabled)) {
        return false;
    }
    if (isdefined(self.var_56f36fd7cc3d8098)) {
        return false;
    }
    if (scripts/cp_mp/utility/game_utility::isbrstylegametype()) {
        if (!istrue(level.br_prematchstarted) && getdvarint(@"hash_e76748b9932f4dbd", 0) == 0) {
            return false;
        }
    }
    return true;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c9e
// Size: 0x31
function function_5c7e8bcdc167fd84() {
    if (!isdefined(level.var_31fe2d8a33b25b91)) {
        level.var_31fe2d8a33b25b91 = getdvarint(@"hash_5fe27d3efac4a807", 0);
    }
    return level.var_31fe2d8a33b25b91;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cd7
// Size: 0x1f
function challengetimersenabledforplayer() {
    if (!istrue(level.challengetimersenabled)) {
        return false;
    }
    if (!challengesenabledforplayer()) {
        return false;
    }
    return true;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cfe
// Size: 0x2e
function validchallengetimer(challengename) {
    if (!isdefined(self.challengestarttime)) {
        return false;
    }
    if (!isdefined(self.challengestarttime[challengename])) {
        return false;
    }
    return true;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d34
// Size: 0x2e
function resetchallengetimer(challengename) {
    if (!challengetimersenabledforplayer()) {
        return;
    }
    if (!validchallengetimer(challengename)) {
        return;
    }
    self.challengestarttime[challengename] = 0;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d69
// Size: 0x5a
function startchallengetimer(challengename) {
    if (!challengetimersenabledforplayer()) {
        return;
    }
    if (!isdefined(self.challengestarttime)) {
        self.challengestarttime = [];
    }
    if (!isdefined(self.challengestarttime[challengename])) {
        self.challengestarttime[challengename] = 0;
    }
    self.challengestarttime[challengename] = gettime();
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dca
// Size: 0x69
function stopchallengetimer(challengename) {
    if (!challengetimersenabledforplayer()) {
        return;
    }
    if (!validchallengetimer(challengename)) {
        return;
    }
    if (self.challengestarttime[challengename] > 0) {
        var_ac846be90e9552ab = gettime() - self.challengestarttime[challengename];
        if (var_ac846be90e9552ab > 0) {
            reportstat(challengename, var_ac846be90e9552ab);
        }
        self.challengestarttime[challengename] = 0;
    }
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e3a
// Size: 0x75
function checkandreportchallengetimer(challengename, elapsedtime) {
    if (!challengetimersenabledforplayer()) {
        return;
    }
    if (!validchallengetimer(challengename)) {
        return;
    }
    if (self.challengestarttime[challengename] > 0) {
        var_ac846be90e9552ab = gettime() - self.challengestarttime[challengename];
        if (var_ac846be90e9552ab >= elapsedtime) {
            reportstat(challengename, var_ac846be90e9552ab);
            self.challengestarttime[challengename] = gettime();
        }
    }
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2eb6
// Size: 0x7c
function trackchallengetimers() {
    level endon("game_ended");
    while (true) {
        if (isdefined(level.players)) {
            totalplayers = level.players.size;
            for (i = 0; i < totalplayers; i++) {
                if (isalive(level.players[i])) {
                    level.players[i] checkandreportchallengetimer("driving", 60000);
                }
            }
        }
        wait(1);
    }
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f39
// Size: 0x4d
function function_11cf26edf87d512() {
    /#
        while (true) {
            wait(0.1);
            if (getdvarint(@"hash_48ae63d778571691", 0)) {
                continue;
            }
            level.var_9d841fd2fd3b4182 = 0;
            closefile(level.var_37bf270d2c55a0c7);
            level.var_37bf270d2c55a0c7 = undefined;
            return;
        }
    #/
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f8d
// Size: 0x6f3
function function_7d97a2a745e514c4(event, params) {
    /#
        if (!getdvarint(@"hash_48ae63d778571691", 0)) {
            return;
        }
        if (!isdefined(level.var_9d841fd2fd3b4182)) {
            thread function_11cf26edf87d512();
            level.var_9d841fd2fd3b4182 = 1;
        }
        filename = getdvar(@"hash_7276451aeafc2854", "onVehicleDestroyed");
        activatechallengeid = getdvar(@"hash_4164d219a03096db", "weapon");
        if (!isdefined(level.var_37bf270d2c55a0c7)) {
            level.var_8a69c8a5e52a8a84 = 0;
            level.var_37bf270d2c55a0c7 = openfile(filename, "equip_throwing_knife_fire");
            fprintln(level.var_37bf270d2c55a0c7, "iw9_br_msecho");
            fprintln(level.var_37bf270d2c55a0c7, "melee");
            fprintln(level.var_37bf270d2c55a0c7, "specialty_hijacked_iff_strobe");
            fprintln(level.var_37bf270d2c55a0c7, "specialty_taccom_system" + level.var_8a69c8a5e52a8a84 + "_comp_02");
            fprintln(level.var_37bf270d2c55a0c7, "isVehicleWeapon");
            fprintln(level.var_37bf270d2c55a0c7, "dmz_boss_chopper");
            fprintln(level.var_37bf270d2c55a0c7, "mummy");
            fprintln(level.var_37bf270d2c55a0c7, "<unknown string>");
            fprintln(level.var_37bf270d2c55a0c7, "<unknown string>" + activatechallengeid + "<unknown string>");
            level.var_8a69c8a5e52a8a84 = level.var_8a69c8a5e52a8a84 + 1;
            level.var_ba27ec806279b044 = [];
            nextrow = -1;
            while (true) {
                nextrow = nextrow + 1;
                if (nextrow >= tablelookupgetnumrows("<unknown string>")) {
                    break;
                }
                eventkeys = tablelookupbyrow("<unknown string>", nextrow, 5);
                if (!isdefined(eventkeys) || eventkeys == "<unknown string>") {
                    continue;
                }
                var_e69af3c2055e35eb = int(tablelookupbyrow("<unknown string>", nextrow, 0));
                foreach (keyname in strtok(eventkeys, "<unknown string>")) {
                    var_c94a0bb0d9c971a2 = int(tablelookup("<unknown string>", 1, keyname, 0));
                    keytype = tablelookup("<unknown string>", 1, keyname, 2);
                    var_289dd4d247bd6d9d = tablelookup("<unknown string>", 1, keyname, 3);
                    level.var_ba27ec806279b044[var_e69af3c2055e35eb]["<unknown string>"][var_c94a0bb0d9c971a2]["<unknown string>"] = keyname;
                    level.var_ba27ec806279b044[var_e69af3c2055e35eb]["<unknown string>"][var_c94a0bb0d9c971a2]["<unknown string>"] = keytype;
                    bitfield = [];
                    foreach (bitpair in strtok(var_289dd4d247bd6d9d, "<unknown string>")) {
                        var_2f4385dec49b4cbf = strtok(bitpair, "<unknown string>");
                        bitname = var_2f4385dec49b4cbf[0];
                        bitshift = int(var_2f4385dec49b4cbf[1]);
                        bitfield[bitshift] = bitname;
                    }
                    level.var_ba27ec806279b044[var_e69af3c2055e35eb]["<unknown string>"][var_c94a0bb0d9c971a2]["<unknown string>"] = bitfield;
                }
            }
        }
        eventstring = tablelookup("<unknown string>", 0, event, 1);
        fprintln(level.var_37bf270d2c55a0c7, "<unknown string>");
        fprintln(level.var_37bf270d2c55a0c7, "iw9_br_msecho");
        fprintln(level.var_37bf270d2c55a0c7, "<unknown string>" + eventstring);
        fprintln(level.var_37bf270d2c55a0c7, "<unknown string>" + event);
        fprintln(level.var_37bf270d2c55a0c7, "specialty_taccom_system" + level.var_8a69c8a5e52a8a84 + "_comp_02");
        fprintln(level.var_37bf270d2c55a0c7, "<unknown string>" + eventstring);
        fprintln(level.var_37bf270d2c55a0c7, "dmz_boss_chopper");
        for (k = 0; k < params.size; k = k + 2) {
            key = params[k];
            value = params[k + 1];
            keystring = "<unknown string>";
            keytype = "<unknown string>";
            keydescription = "<unknown string>";
            if (isdefined(level.var_ba27ec806279b044[int(event)]["<unknown string>"][key])) {
                keydata = level.var_ba27ec806279b044[int(event)]["<unknown string>"][key];
                keystring = keydata["<unknown string>"];
                keytype = keydata["<unknown string>"];
                var_289dd4d247bd6d9d = keydata["<unknown string>"];
                if (isdefined(value)) {
                    if (keytype == "<unknown string>") {
                        bitarray = function_3005ef56488df9be(value);
                        for (n = 0; n < var_289dd4d247bd6d9d.size; n++) {
                            if (!isdefined(bitarray[n]) || !bitarray[n]) {
                                continue;
                            }
                            if (keydescription.size > 0) {
                                keydescription = keydescription + "<unknown string>";
                            }
                            keydescription = keydescription + var_289dd4d247bd6d9d[n];
                        }
                        if (keydescription == "<unknown string>") {
                            keydescription = "<unknown string>";
                        }
                        keydescription = "<unknown string>" + keydescription;
                    } else if (keystring == "<unknown string>" || keystring == "<unknown string>" || keystring == "<unknown string>") {
                        keydescription = "<unknown string>" + tablelookup("<unknown string>", 0, value, 1);
                    } else if (keystring == "<unknown string>" || keystring == "<unknown string>" || keystring == "<unknown string>" || keystring == "<unknown string>") {
                        keydescription = "<unknown string>" + tablelookup("<unknown string>", 0, value, 2) + "<unknown string>" + tablelookup("<unknown string>", 0, value, 1) + "<unknown string>";
                    }
                }
            } else {
                keystring = tablelookup("<unknown string>", 0, key, 1) + "<unknown string>";
            }
            comment = "<unknown string>";
            if (!isdefined(value)) {
                comment = "<unknown string>";
                value = "<unknown string>";
            }
            fprintln(level.var_37bf270d2c55a0c7, "<unknown string>" + comment + "<unknown string>" + key + "<unknown string>" + value + "<unknown string>" + keystring + "<unknown string>" + keydescription);
        }
        fprintln(level.var_37bf270d2c55a0c7, "<unknown string>");
        level.var_8a69c8a5e52a8a84 = level.var_8a69c8a5e52a8a84 + 1;
    #/
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3687
// Size: 0x165
function onplayerkilled(inflictor, attacker, damage, damageflags, meansofdeath, objweapon, hitloc, modifiers) {
    if (!attacker challengesenabledforplayer()) {
        return;
    }
    victim = self;
    if (!isplayer(attacker)) {
        if (isdefined(inflictor) && isplayer(inflictor)) {
            attacker = inflictor;
        } else {
            return;
        }
    }
    if (utility::issharedfuncdefined("player", "isFriendly")) {
        if (![[ utility::getsharedfunc("player", "isFriendly") ]](attacker.team, victim)) {
            objweapon = attacker weapon_utility::function_1e3102980c3a4cc1(objweapon);
            modifiers1 = 0;
            modifiers2 = 0;
            modifiers3 = 0;
            attachmentflags = 0;
            hitloc = 0;
            if (isdefined(modifiers)) {
                modifiers1 = modifiers["mask"];
                if (isdefined(modifiers["mask2"])) {
                    modifiers2 = modifiers["mask2"];
                }
                if (isdefined(modifiers["mask3"])) {
                    modifiers3 = modifiers["mask3"];
                }
                attachmentflags = modifiers["attachment_flags"];
                hitloc = modifiers["hit_loc"];
            }
            victimstruct = function_137b512700167b00(attacker, victim);
            reportKillChallengeEvent(attacker, victimstruct, modifiers1, modifiers2, modifiers3, objweapon, damage, meansofdeath, attachmentflags, hitloc);
        }
    }
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37f3
// Size: 0x1a6
function function_5a0ae8bc2b80c0c0(inflictor, attacker, damage, meansofdeath, objweapon, hitloc, modifiers, var_1d68c79557cc54ea, victim_team, var_bafbdb422ea9eaae) {
    if (!isdefined(inflictor)) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    if (!isdefined(attacker)) {
        /#
            assertmsg("Challenges.gsc - onAgentKilled was passed an undefined attacker entity");
        #/
        return;
    }
    if (!isdefined(meansofdeath) || meansofdeath.size == 0) {
        /#
            assertmsg("Challenges.gsc - onAgentKilled was passed an undefined meansOfDeath entity");
        #/
        return;
    }
    if (!isdefined(objweapon)) {
        /#
            assertmsg("Challenges.gsc - onAgentKilled was passed an undefined objWeapon");
        #/
        return;
    }
    if (!attacker challengesenabledforplayer()) {
        return;
    }
    if (!isplayer(attacker)) {
        if (isdefined(inflictor) && isplayer(inflictor)) {
            attacker = inflictor;
        } else {
            return;
        }
    }
    if (isdefined(victim_team) && isdefined(attacker.team) && victim_team != attacker.team) {
        objweapon = attacker weapon_utility::function_1e3102980c3a4cc1(objweapon);
        modifiers1 = 0;
        modifiers2 = 0;
        modifiers3 = 0;
        attachmentflags = 0;
        hitloc = 0;
        if (isdefined(modifiers)) {
            modifiers1 = modifiers["mask"];
            if (isdefined(modifiers["mask2"])) {
                modifiers2 = modifiers["mask2"];
            }
            if (isdefined(modifiers["mask3"])) {
                modifiers3 = modifiers["mask3"];
            }
            attachmentflags = modifiers["attachment_flags"];
            hitloc = modifiers["hit_loc"];
        }
        reportKillChallengeEvent(attacker, var_bafbdb422ea9eaae, modifiers1, modifiers2, modifiers3, objweapon, damage, meansofdeath, attachmentflags, hitloc, var_1d68c79557cc54ea);
    }
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39a0
// Size: 0x417
function vehiclekilled(vehicle, attacker, damage, objweapon) {
    if (!attacker challengesenabledforplayer()) {
        return;
    }
    victim = vehicle;
    objweapon = attacker weapon_utility::function_1e3102980c3a4cc1(objweapon);
    meansofdeath = "MOD_UNKNOWN";
    modifiers1 = 0;
    modifiers2 = 0;
    modifiers3 = 0;
    attachmentflags = 0;
    hitloc = 0;
    attackervehicle = attacker player_utility::getvehicle(1);
    if (isdefined(attackervehicle)) {
        modifiers1 = scripts/cp_mp/challenges::function_6d40f12a09494350(modifiers1, ae_utility::function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"invehicle"));
        if (attackervehicle scripts/common/vehicle::ishelicopter()) {
            modifiers2 = scripts/cp_mp/challenges::function_6d40f12a09494350(modifiers2, ae_utility::function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"from_helicopter"));
        } else if (attackervehicle.vehiclename == "veh9_mil_lnd_mrap") {
            modifiers2 = scripts/cp_mp/challenges::function_6d40f12a09494350(modifiers2, ae_utility::function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_dbaf3685f1412e50"));
        }
    }
    platform = attacker getmovingplatformparent();
    if (isdefined(platform) && platform scripts/cp_mp/vehicles/vehicle::isvehicle()) {
        if (istrue(platform.isheli)) {
            modifiers2 = scripts/cp_mp/challenges::function_6d40f12a09494350(modifiers2, ae_utility::function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"from_helicopter"));
            ref = platform scripts/cp_mp/vehicles/vehicle::function_d93ec4635290febd();
            if (ref == "veh9_palfa") {
                modifiers2 = function_6d40f12a09494350(modifiers2, ae_utility::function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_71e5f339792a9ef6"));
            }
        }
        if (!isdefined(attackervehicle) || platform != attackervehicle) {
            ref = scripts/cp_mp/utility/train_utility::function_e58b746157089c68(platform);
            if (isdefined(ref) && (ref == "cargo_train" || ref == "br_passenger_train")) {
                modifiers1 = scripts/cp_mp/challenges::function_6d40f12a09494350(modifiers1, ae_utility::function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"ontrain"));
                if (ref == "cargo_train") {
                    modifiers2 = scripts/cp_mp/challenges::function_6d40f12a09494350(modifiers2, ae_utility::function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_7d4ca6b82b853a92"));
                } else if (ref == "br_passenger_train") {
                    modifiers2 = scripts/cp_mp/challenges::function_6d40f12a09494350(modifiers2, ae_utility::function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_8345a13afbaa0f66"));
                }
            } else {
                modifiers1 = scripts/cp_mp/challenges::function_6d40f12a09494350(modifiers1, ae_utility::function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"vehiclesurf"));
                if (platform.classname == "script_vehicle" && platform vehicle_getspeed() > 25) {
                    modifiers1 = function_6d40f12a09494350(modifiers1, ae_utility::function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"infastvehicle"));
                }
            }
        }
    }
    if (issharedfuncdefined("pmc_missions", "onVehicleDestroyed")) {
        level thread [[ getsharedfunc("pmc_missions", "onVehicleDestroyed") ]](vehicle);
    }
    victimstruct = function_137b512700167b00(attacker, victim);
    if (isdefined(level.var_9dd45392c2bffc71) && isdefined(level.var_9dd45392c2bffc71["id_assignPlayerKillModifiersTrimmed"])) {
        attacker [[ level.var_9dd45392c2bffc71["id_assignPlayerKillModifiersTrimmed"] ]](victimstruct, objweapon, meansofdeath, attacker);
        modifiers = attacker.modifiers;
        if (isdefined(victimstruct.team) && isdefined(attacker.team) && victimstruct.team != attacker.team) {
            modifiers1 = 0;
            modifiers2 = 0;
            modifiers3 = 0;
            attachmentflags = 0;
            hitloc = 0;
            if (isdefined(modifiers)) {
                modifiers1 = modifiers["mask"];
                if (isdefined(modifiers["mask2"])) {
                    modifiers2 = modifiers["mask2"];
                }
                if (isdefined(modifiers["mask3"])) {
                    modifiers3 = modifiers["mask3"];
                }
                attachmentflags = modifiers["attachment_flags"];
                hitloc = modifiers["hit_loc"];
            }
        }
    }
    reportKillChallengeEvent(attacker, victimstruct, modifiers1, modifiers2, modifiers3, objweapon, damage, meansofdeath, attachmentflags, hitloc);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dbe
// Size: 0x173
function equipmentdestroyed(inflictor, attacker, damage, damageflags, meansofdeath, objweapon, hitloc, modifiers) {
    if (!attacker challengesenabledforplayer()) {
        return;
    }
    victim = self;
    if (!isplayer(attacker)) {
        if (isdefined(inflictor) && isplayer(inflictor)) {
            attacker = inflictor;
        } else {
            return;
        }
    }
    if (!isdefined(victim.owner)) {
        return;
    }
    if (utility::issharedfuncdefined("player", "isFriendly")) {
        if (![[ utility::getsharedfunc("player", "isFriendly") ]](attacker.team, victim.owner)) {
            objweapon = attacker weapon_utility::function_1e3102980c3a4cc1(objweapon);
            modifiers1 = 0;
            modifiers2 = 0;
            modifiers3 = 0;
            attachmentflags = 0;
            if (isdefined(modifiers)) {
                modifiers1 = modifiers["mask"];
                if (isdefined(modifiers["mask2"])) {
                    modifiers2 = modifiers["mask2"];
                }
                if (isdefined(modifiers["mask3"])) {
                    modifiers3 = modifiers["mask3"];
                }
                attachmentflags = modifiers["attachment_flags"];
            }
            victimstruct = function_137b512700167b00(attacker, victim);
            reportKillChallengeEvent(attacker, victimstruct, modifiers1, modifiers2, modifiers3, objweapon, damage, meansofdeath, attachmentflags, hitloc);
        }
    }
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f38
// Size: 0x1ee
function killstreakkilled(killstreakname, owner, streakent, attacker, damage, damagetype, objweapon, scorepopupname) {
    if (!isdefined(attacker) || !attacker challengesenabledforplayer()) {
        return;
    }
    victim = self;
    if (!isplayer(attacker)) {
        return;
    }
    if (!isdefined(victim.owner)) {
        return;
    }
    if (utility::issharedfuncdefined("player", "isFriendly")) {
        if (![[ utility::getsharedfunc("player", "isFriendly") ]](attacker.team, victim.owner)) {
            objweapon = attacker weapon_utility::function_1e3102980c3a4cc1(objweapon);
            meansofdeath = "MOD_UNKNOWN";
            modifiers1 = 0;
            modifiers2 = 0;
            modifiers3 = 0;
            attachmentflags = 0;
            hitloc = 0;
            if (isdefined(attacker.modifiers)) {
                if (isdefined(attacker.modifiers["mask"])) {
                    modifiers1 = attacker.modifiers["mask"];
                }
                if (isdefined(attacker.modifiers["mask2"])) {
                    modifiers2 = attacker.modifiers["mask2"];
                }
                if (isdefined(attacker.modifiers["mask3"])) {
                    modifiers3 = attacker.modifiers["mask3"];
                }
                if (isdefined(attacker.modifiers["attachment_flags"])) {
                    attachmentflags = attacker.modifiers["attachment_flags"];
                }
            }
            victimstruct = function_137b512700167b00(attacker, victim);
            reportKillChallengeEvent(attacker, victimstruct, modifiers1, modifiers2, modifiers3, objweapon, damage, meansofdeath, attachmentflags, hitloc);
        }
    }
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x412d
// Size: 0x41
function function_5b2c23ea4889f30b(invalue) {
    var_9d9f97a53c1e5d06 = invalue;
    if (issharedfuncdefined("poi", "try_TranslatePOI")) {
        var_9d9f97a53c1e5d06 = [[ getsharedfunc("poi", "try_TranslatePOI") ]](var_9d9f97a53c1e5d06);
    }
    return var_9d9f97a53c1e5d06;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4176
// Size: 0x25b
function function_8359cadd253f9604(player, type, quantity, var_afda85311c8ed272, lootid, var_f237807396377232) {
    if (!player challengesenabledforplayer()) {
        return;
    }
    if (!isdefined(var_afda85311c8ed272)) {
        var_afda85311c8ed272 = 1;
    }
    itemrarity = 0;
    if (isdefined(var_f237807396377232)) {
        itemrarity = var_f237807396377232.rarity;
    }
    gamemode = getchallengegamemode(player);
    gametype = function_17c5d7feb226e256();
    location = 0;
    location2 = 0;
    typeid = 0;
    if (isdefined(type)) {
        typeid = ae_utility::function_7042dad035dc176c(type);
    }
    if (isdefined(player.closestpoi)) {
        location = getlocation(function_5b2c23ea4889f30b(player.closestpoi));
        location2 = function_55be16fb0f5f4a19(function_5b2c23ea4889f30b(player.closestpoi));
    }
    aeeventname = #"collect_item";
    gamemode = function_68ffb11dc4c6b979(gamemode, aeeventname);
    gametype = function_68ffb11dc4c6b979(gametype, aeeventname);
    typeid = function_68ffb11dc4c6b979(typeid, aeeventname);
    location = function_68ffb11dc4c6b979(location, aeeventname);
    location2 = function_68ffb11dc4c6b979(location2, aeeventname);
    itemrarity = function_68ffb11dc4c6b979(itemrarity, aeeventname);
    quantity = function_68ffb11dc4c6b979(quantity, aeeventname);
    lootid = function_68ffb11dc4c6b979(lootid, aeeventname);
    function_8e81148472fb520a(player, aeeventname, [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"string_ref"), typeid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"value"), quantity, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_92939ab8dccb3d82"), location, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_dc0d981f2d59d210"), location2, ae_utility::function_d6f771aedba70ce7(aeeventname, #"loot_id"), lootid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"zm_rarity"), itemrarity], var_afda85311c8ed272);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43d8
// Size: 0x220
function function_5c3aa65db46763ff(vehicle, type) {
    if (!challengesenabledforplayer()) {
        return;
    }
    if (!isdefined(vehicle) || !isdefined(type)) {
        return;
    }
    vehiclename = findenemytype(vehicle)[0];
    vehiclename2 = function_8435d79a41ea37b0(vehicle);
    gametype = function_17c5d7feb226e256();
    typeid = ae_utility::function_7042dad035dc176c(type);
    location = 0;
    location2 = 0;
    if (isdefined(self.closestpoi)) {
        location = getlocation(function_5b2c23ea4889f30b(self.closestpoi));
        location2 = function_55be16fb0f5f4a19(function_5b2c23ea4889f30b(self.closestpoi));
    }
    gamemode = getchallengegamemode(self);
    aeeventname = #"vehicle";
    gamemode = function_68ffb11dc4c6b979(gamemode, aeeventname);
    gametype = function_68ffb11dc4c6b979(gametype, aeeventname);
    typeid = function_68ffb11dc4c6b979(typeid, aeeventname);
    location = function_68ffb11dc4c6b979(location, aeeventname);
    location2 = function_68ffb11dc4c6b979(location2, aeeventname);
    vehiclename = function_68ffb11dc4c6b979(vehiclename, aeeventname);
    vehiclename2 = function_68ffb11dc4c6b979(vehiclename2, aeeventname);
    function_8e81148472fb520a(self, aeeventname, [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"string_ref"), typeid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_92939ab8dccb3d82"), location, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_dc0d981f2d59d210"), location2, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_e2f5c601b57b3960"), vehiclename, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_22d8c6e760626656"), vehiclename2]);
    /#
        println("<unknown string>" + type);
    #/
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45ff
// Size: 0x1ae
function function_70abd486ae26235(player, type, quantity, var_afda85311c8ed272) {
    if (!isplayer(player)) {
        return;
    }
    if (!player challengesenabledforplayer()) {
        return;
    }
    gametype = function_17c5d7feb226e256();
    typeid = ae_utility::function_7042dad035dc176c(type);
    location = 0;
    location2 = 0;
    if (isdefined(player.closestpoi)) {
        location = getlocation(function_5b2c23ea4889f30b(player.closestpoi));
        location2 = function_55be16fb0f5f4a19(function_5b2c23ea4889f30b(player.closestpoi));
    }
    gamemode = getchallengegamemode(player);
    aeeventname = #"unlock";
    function_8e81148472fb520a(player, aeeventname, [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"string_ref"), typeid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"value"), quantity, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_92939ab8dccb3d82"), location, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_dc0d981f2d59d210"), location2], var_afda85311c8ed272);
    /#
        println("<unknown string>" + type);
    #/
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47b4
// Size: 0x1f1
function function_b0f754c8a379154e(equipment, player, dist, eventtypebit) {
    if (!player challengesenabledforplayer()) {
        return;
    }
    gamemode = getchallengegamemode(player);
    gametype = function_17c5d7feb226e256();
    var_7fb63b7fac6d1698 = function_3ea2b9fa713d6ed3(player);
    location = 0;
    location2 = 0;
    if (isdefined(player.closestpoi)) {
        location = getlocation(function_5b2c23ea4889f30b(player.closestpoi));
        location2 = function_55be16fb0f5f4a19(function_5b2c23ea4889f30b(player.closestpoi));
    }
    equipmentid = 0;
    equipmentid = loot::getlootidfromref(equipment);
    bitfield = 0;
    bitfield = function_6d40f12a09494350(bitfield, eventtypebit);
    aeeventname = #"equipment";
    function_8e81148472fb520a(player, aeeventname, [ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype, ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_92939ab8dccb3d82"), location, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_dc0d981f2d59d210"), location2, ae_utility::function_d6f771aedba70ce7(aeeventname, #"loot_id"), equipmentid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"distance"), dist, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_bd518e95df4103fe"), var_7fb63b7fac6d1698, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_83a2d67994d7e295"), bitfield]);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49ac
// Size: 0x671
function function_b5929663421247fa(player, result, winner) {
    if (!isdefined(player)) {
        /#
            assertmsg("Challenges.gsc - reportEndMatchChallengeEvent was passed an undefined player");
        #/
        return;
    }
    if (!player challengesenabledforplayer()) {
        return;
    }
    operatorlootid = player function_aff35122a61a900b(player.team);
    if (!isdefined(operatorlootid)) {
        operatorlootid = 0;
    }
    gamemode = getchallengegamemode(player);
    teamsize = 0;
    if (gamemode & 8) {
        teamsize = scripts/cp_mp/utility/game_utility::function_4fb37368ae3585bb();
    }
    placement = 0;
    if (isdefined(player.teamplacement) && player.teamplacement > 0) {
        placement = player.teamplacement;
    }
    playlistid = getplaylistid();
    lobbyid = function_4f9373a1227db35c();
    location = 0;
    location2 = 0;
    if (isdefined(player.closestpoi)) {
        location = getlocation(function_5b2c23ea4889f30b(player.closestpoi));
        location2 = function_55be16fb0f5f4a19(function_5b2c23ea4889f30b(player.closestpoi));
    }
    var_8142a29197569218 = 0;
    if (isdefined(player.pers) && isdefined(player.pers["kills"])) {
        if (player.pers["kills"] >= 15) {
            var_8142a29197569218 = function_6d40f12a09494350(var_8142a29197569218, ae_utility::function_e2ff8f4b4e94f723(#"hash_8dd9828579063e7", #"15kills"));
        }
    }
    if (!istrue(player.disconnecting) || isdefined(level.endgamewinner)) {
        if (utility::issharedfuncdefined("score", "getHighestScoringPlayer")) {
            winningplayer = [[ utility::getsharedfunc("score", "getHighestScoringPlayer") ]]();
            if (isdefined(winningplayer) && winningplayer == player) {
                var_8142a29197569218 = function_6d40f12a09494350(var_8142a29197569218, ae_utility::function_e2ff8f4b4e94f723(#"hash_8dd9828579063e7", #"hash_de6c2ec52bf2a850"));
            }
        }
    }
    if (isdefined(level.secondaryvictory) && istrue(player.extracted)) {
        var_8142a29197569218 = function_6d40f12a09494350(var_8142a29197569218, ae_utility::function_e2ff8f4b4e94f723(#"hash_8dd9828579063e7", #"hash_cca3beee360a3bdd"));
    }
    if (isdefined(level.var_8fc589b1edff1fb2) && istrue(level.var_8fc589b1edff1fb2[player.guid])) {
        var_8142a29197569218 = function_6d40f12a09494350(var_8142a29197569218, ae_utility::function_e2ff8f4b4e94f723(#"hash_8dd9828579063e7", #"hash_600ba733abaa2896"));
    }
    if (istrue(player.var_ded04cdd264a7e00)) {
        var_8142a29197569218 = function_6d40f12a09494350(var_8142a29197569218, ae_utility::function_e2ff8f4b4e94f723(#"hash_8dd9828579063e7", #"hash_4f5ea2cfeb163c9d"));
    }
    var_6bd1aebdc320269c = getdvarint(@"hash_d5a1ed391dd67630", 0);
    if (var_6bd1aebdc320269c) {
        var_8142a29197569218 = function_6d40f12a09494350(var_8142a29197569218, ae_utility::function_e2ff8f4b4e94f723(#"hash_8dd9828579063e7", #"hash_f04084f13423c3b4"));
    }
    if (isdefined(level.arrow)) {
        if (istrue(level.arrow.var_c93fb612b08a50d1) && isdefined(level.arrow.var_a21db1ee260a96c3) && level.arrow.var_a21db1ee260a96c3 == player.team) {
            var_8142a29197569218 = function_6d40f12a09494350(var_8142a29197569218, ae_utility::function_e2ff8f4b4e94f723(#"hash_8dd9828579063e7", #"hash_e4efa895facf6b7b"));
        }
        if (istrue(level.arrow.endingdetonated)) {
            var_8142a29197569218 = function_6d40f12a09494350(var_8142a29197569218, ae_utility::function_e2ff8f4b4e94f723(#"hash_8dd9828579063e7", #"hash_65ecff89121dd351"));
        }
    }
    objtime = 0;
    if (isdefined(player.pers) && isdefined(player.pers["objTime"])) {
        objtime = player.pers["objTime"];
    }
    gametype = function_17c5d7feb226e256();
    var_bb38571cca0414f = function_c1945f26d99b0ed9(player);
    aeeventname = #"end_match";
    aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
    params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype, ae_utility::function_d6f771aedba70ce7(aeeventname, #"match_result"), result, ae_utility::function_d6f771aedba70ce7(aeeventname, #"operator_id"), operatorlootid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_8dd9828579063e7"), var_8142a29197569218, ae_utility::function_d6f771aedba70ce7(aeeventname, #"placement"), placement, ae_utility::function_d6f771aedba70ce7(aeeventname, #"playlist_id"), playlistid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"team_size"), teamsize, ae_utility::function_d6f771aedba70ce7(aeeventname, #"lobby_id"), lobbyid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_f3287b83e723dcd4"), var_bb38571cca0414f[0], ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_f3287c83e723de87"), var_bb38571cca0414f[1], ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_f3287d83e723e03a"), var_bb38571cca0414f[2], ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_f3287e83e723e1ed"), var_bb38571cca0414f[3], ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_f3287783e723d608"), var_bb38571cca0414f[4], ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_92939ab8dccb3d82"), location, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_dc0d981f2d59d210"), location2, ae_utility::function_d6f771aedba70ce7(aeeventname, #"match_id"), function_94c7ae7049488358(), ae_utility::function_d6f771aedba70ce7(aeeventname, #"objective_time"), objtime];
    /#
        function_7d97a2a745e514c4(aeeventid, params);
    #/
    player reportChallengeUserSerializedEventWrapper(aeeventid, params);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5024
// Size: 0x10
function function_8df2c1c1377b79be(cashvalue) {
    return cashvalue * 10;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x503c
// Size: 0x99
function function_dc52e14b64052dda(lootid, quantity) {
    if (isdefined(lootid)) {
        scriptablename = loot::getScriptableFromLootID(lootid);
        if (isdefined(scriptablename)) {
            if (lootid == 8395) {
                return function_8df2c1c1377b79be(quantity);
            }
            if (utility::issharedfuncdefined("pickups", "isDogTag") && [[ utility::getsharedfunc("pickups", "isDogTag") ]](scriptablename) || utility::issharedfuncdefined("pickups", "isGasMask") && [[ utility::getsharedfunc("pickups", "isGasMask") ]](scriptablename)) {
                return 1;
            }
        }
    }
    return quantity;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50dd
// Size: 0x39d
function function_1ba256da09a9878a(player, lootid, lootref, loottype, quantity, cashvalue, var_e7d05247043893ad, var_f237807396377232) {
    if (!player challengesenabledforplayer()) {
        return;
    }
    gametype = function_17c5d7feb226e256();
    gamemode = getchallengegamemode(player);
    var_99bd169488e48ac1 = 0;
    typeid = 0;
    if (!isdefined(var_f237807396377232)) {
        if (isdefined(lootref)) {
            var_99bd169488e48ac1 = ae_utility::function_7042dad035dc176c(lootref);
        }
        if (isdefined(lootid)) {
            typeid = function_c43d8b7a5461cdce(lootid);
        } else if (isdefined(loottype)) {
            typeid = ae_utility::function_7042dad035dc176c(loottype);
        }
        quantity = function_dc52e14b64052dda(lootid, quantity);
        cashvalue = function_8df2c1c1377b79be(cashvalue);
    }
    location = 0;
    location2 = 0;
    if (isdefined(self.closestpoi)) {
        location = getlocation(function_5b2c23ea4889f30b(self.closestpoi));
        location2 = function_55be16fb0f5f4a19(function_5b2c23ea4889f30b(self.closestpoi));
    }
    aeeventname = #"buy_item";
    itemrarity = 0;
    var_7d9803744a905b95 = 0;
    var_48c0c20123a7896a = 0;
    if (isdefined(var_f237807396377232)) {
        itemrarity = var_f237807396377232.rarity;
        var_7d9803744a905b95 = var_f237807396377232.var_7d9803744a905b95;
        var_48c0c20123a7896a = var_f237807396377232.pap_level;
    }
    gamemode = function_68ffb11dc4c6b979(gamemode, aeeventname);
    gametype = function_68ffb11dc4c6b979(gametype, aeeventname);
    typeid = function_68ffb11dc4c6b979(typeid, aeeventname);
    location = function_68ffb11dc4c6b979(location, aeeventname);
    location2 = function_68ffb11dc4c6b979(location2, aeeventname);
    itemrarity = function_68ffb11dc4c6b979(itemrarity, aeeventname);
    quantity = function_68ffb11dc4c6b979(quantity, aeeventname);
    var_e7d05247043893ad = function_68ffb11dc4c6b979(var_e7d05247043893ad, aeeventname);
    var_99bd169488e48ac1 = function_68ffb11dc4c6b979(var_99bd169488e48ac1, aeeventname);
    lootid = function_68ffb11dc4c6b979(lootid, aeeventname);
    cashvalue = function_68ffb11dc4c6b979(cashvalue, aeeventname);
    var_7d9803744a905b95 = function_68ffb11dc4c6b979(var_7d9803744a905b95, aeeventname);
    var_48c0c20123a7896a = function_68ffb11dc4c6b979(var_48c0c20123a7896a, aeeventname);
    params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"string_ref"), var_99bd169488e48ac1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"value"), quantity, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype, ae_utility::function_d6f771aedba70ce7(aeeventname, #"loot_id"), lootid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_d7806c74c1d4a500"), typeid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"cash_value"), cashvalue, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_80f9b45ba3e6882e"), var_e7d05247043893ad, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_92939ab8dccb3d82"), location, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_dc0d981f2d59d210"), location2, ae_utility::function_d6f771aedba70ce7(aeeventname, #"zm_rarity"), itemrarity, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_e6b742f2dbcdaa7a"), var_7d9803744a905b95, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_c1df2daa62247afe"), var_48c0c20123a7896a];
    function_8e81148472fb520a(player, aeeventname, params);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5481
// Size: 0x16a
function function_affb3af6af110594(player, activitytype, poi) {
    gametype = function_17c5d7feb226e256();
    gamemode = getchallengegamemode(player);
    location = 0;
    location2 = 0;
    if (isdefined(poi)) {
        location = getlocation(poi);
        location2 = function_55be16fb0f5f4a19(poi);
    }
    aeeventname = #"start_activity";
    aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
    params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"value"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype, ae_utility::function_d6f771aedba70ce7(aeeventname, #"activity_type"), activitytype ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_92939ab8dccb3d82"), location, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_dc0d981f2d59d210"), location2];
    /#
        function_7d97a2a745e514c4(aeeventid, params);
    #/
    player reportChallengeUserSerializedEventWrapper(aeeventid, params);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55f2
// Size: 0x16a
function function_2635cdb5e985eaab(player, activitytype, poi) {
    gametype = function_17c5d7feb226e256();
    gamemode = getchallengegamemode(player);
    location = 0;
    location2 = 0;
    if (isdefined(poi)) {
        location = getlocation(poi);
        location2 = function_55be16fb0f5f4a19(poi);
    }
    aeeventname = #"end_activity";
    aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
    params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"value"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype, ae_utility::function_d6f771aedba70ce7(aeeventname, #"activity_type"), activitytype ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_92939ab8dccb3d82"), location, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_dc0d981f2d59d210"), location2];
    /#
        function_7d97a2a745e514c4(aeeventid, params);
    #/
    player reportChallengeUserSerializedEventWrapper(aeeventid, params);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5763
// Size: 0x158
function function_f4d8c689aaf296e5(player, weapon, healthdamage, armordamage) {
    if (!player challengesenabledforplayer()) {
        return;
    }
    if (isagent(player)) {
        return;
    }
    if (!isdefined(weapon)) {
        return;
    }
    var_b28608820870666 = function_ce112254f7cba89e(weapon);
    if (!isdefined(var_b28608820870666)) {
        return;
    }
    gamemode = getchallengegamemode(player);
    gametype = function_17c5d7feb226e256();
    damagetotal = healthdamage + armordamage;
    aeeventname = #"weapon_damage";
    aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
    params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_a0dd9c7405f2d85e"), var_b28608820870666, ae_utility::function_d6f771aedba70ce7(aeeventname, #"value"), damagetotal];
    /#
        function_7d97a2a745e514c4(aeeventid, params);
    #/
    player reportChallengeUserSerializedEventWrapper(aeeventid, params);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58c2
// Size: 0x2e5
function function_4ab6f9fba6bb9cc5(player, healthdamage, armordamage) {
    if (!player challengesenabledforplayer()) {
        return;
    }
    if (isagent(player)) {
        return;
    }
    if (!isdefined(healthdamage)) {
        healthdamage = 0;
    }
    healthdamage = int(healthdamage);
    if (!isdefined(armordamage)) {
        armordamage = 0;
    }
    armordamage = int(armordamage);
    var_6ddcf3c092eaf383 = level.var_ec851999e0e99879;
    if (!isdefined(var_6ddcf3c092eaf383)) {
        var_6ddcf3c092eaf383 = function_6b7aeb2012efc4af();
    }
    aeeventname = #"damaged";
    aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
    if (!isdefined(level.var_1511634f42f188a6)) {
        level.var_1511634f42f188a6 = [];
    }
    if (!isdefined(level.var_a7f8fb431b350d82)) {
        level.var_a7f8fb431b350d82 = [];
    }
    if (!istrue(level.var_a7f8fb431b350d82[#"reportstats"])) {
        level.var_1511634f42f188a6[#"version"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"version");
        level.var_1511634f42f188a6[#"gamemode"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode");
        level.var_1511634f42f188a6[#"gametype"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype");
        level.var_1511634f42f188a6[#"damage_type"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"damage_type");
        level.var_1511634f42f188a6[#"value"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"value");
        level.var_1511634f42f188a6[#"hash_2330531abd5ccdac"] = ae_utility::function_e2ff8f4b4e94f723(#"damage_type", #"health");
        level.var_1511634f42f188a6[#"hash_756cdafda9ab288d"] = ae_utility::function_e2ff8f4b4e94f723(#"damage_type", #"armor");
    }
    paramcache = level.var_1511634f42f188a6;
    var_eeff650640a93fe1 = 0;
    if (healthdamage > 0) {
        var_eeff650640a93fe1 = function_6d40f12a09494350(var_eeff650640a93fe1, paramcache[#"hash_2330531abd5ccdac"]);
    }
    if (armordamage > 0) {
        var_eeff650640a93fe1 = function_6d40f12a09494350(var_eeff650640a93fe1, paramcache[#"hash_756cdafda9ab288d"]);
    }
    eventparams = [paramcache[#"version"], 1, paramcache[#"gamemode"], var_6ddcf3c092eaf383.gamemode, paramcache[#"gametype"], var_6ddcf3c092eaf383.gametype, paramcache[#"damage_type"], var_eeff650640a93fe1, paramcache[#"value"], healthdamage + armordamage];
    /#
        function_7d97a2a745e514c4(aeeventid, eventparams);
    #/
    player reportChallengeUserSerializedEventWrapper(aeeventid, eventparams);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5bae
// Size: 0x188
function function_b4b8d881af22f7bd(player, weapon) {
    if (!player challengesenabledforplayer()) {
        return;
    }
    if (isagent(player)) {
        return;
    }
    if (!isdefined(weapon)) {
        return;
    }
    var_b28608820870666 = function_ce112254f7cba89e(weapon);
    weaponlootid = weapon::getweaponlootid(weapon);
    if (!isdefined(var_b28608820870666) || !isdefined(weaponlootid)) {
        return;
    }
    gamemode = getchallengegamemode(player);
    gametype = function_17c5d7feb226e256();
    aeeventname = #"reload";
    aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
    var_c78bf6b063fc5789 = default_to(player.var_c78bf6b063fc5789, 0);
    params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_a0dd9c7405f2d85e"), var_b28608820870666, ae_utility::function_d6f771aedba70ce7(aeeventname, #"weapon_loot_id"), weaponlootid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_365c4ef34bc9c239"), var_c78bf6b063fc5789];
    /#
        function_7d97a2a745e514c4(aeeventid, params);
    #/
    reportChallengeUserSerializedEventWrapper(aeeventid, params);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d3d
// Size: 0xce
function function_fb2db8647d693699(player) {
    if (!player challengesenabledforplayer()) {
        return;
    }
    gamemode = getchallengegamemode(player);
    gametype = function_17c5d7feb226e256();
    aeeventname = #"downed";
    aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
    params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype];
    /#
        function_7d97a2a745e514c4(aeeventid, params);
    #/
    player reportChallengeUserSerializedEventWrapper(aeeventid, params);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e12
// Size: 0xf6
function function_b8e86c6dea0ac027(player, streak) {
    if (!player challengesenabledforplayer()) {
        return;
    }
    gamemode = getchallengegamemode(player);
    gametype = function_17c5d7feb226e256();
    aeeventname = #"squad_wiped";
    aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
    params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype];
    if (isdefined(streak)) {
        params[params.size] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"squad_wipe_streak");
        params[params.size] = streak;
    }
    function_7d97a2a745e514c4(aeeventid, params);
    player reportChallengeUserSerializedEventWrapper(aeeventid, params);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f0f
// Size: 0x168
function ondeath(inflictor, attacker, damage, damageflags, meansofdeath, objweapon, hitloc, modifiers) {
    if (!challengesenabledforplayer()) {
        return;
    }
    gamemode = getchallengegamemode(self);
    gametype = function_17c5d7feb226e256();
    teamsize = 0;
    if (gamemode & 8) {
        teamsize = scripts/cp_mp/utility/game_utility::function_4fb37368ae3585bb();
    }
    in_prematch = istrue(level.inprematch);
    aeeventname = #"death";
    aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
    params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype, ae_utility::function_d6f771aedba70ce7(aeeventname, #"team_size"), teamsize, ae_utility::function_d6f771aedba70ce7(aeeventname, #"in_prematch"), in_prematch];
    /#
        function_7d97a2a745e514c4(aeeventid, params);
    #/
    reportChallengeUserSerializedEventWrapper(aeeventid, params);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x607e
// Size: 0xcc
function function_868b6d4fbec3938c(player) {
    if (!challengesenabledforplayer()) {
        return;
    }
    gamemode = getchallengegamemode(player);
    gametype = function_17c5d7feb226e256();
    aeeventname = #"hash_672d2c0185c09e4e";
    aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
    params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype];
    /#
        function_7d97a2a745e514c4(aeeventid, params);
    #/
    reportChallengeUserSerializedEventWrapper(aeeventid, params);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6151
// Size: 0x113
function function_5d99311b5a7dffda() {
    var_4fd3df97f86a664c = getdvarint(@"hash_bd0f7ad1bb2671a5", -1);
    if (var_4fd3df97f86a664c >= 0) {
        return var_4fd3df97f86a664c;
    }
    if (scripts/cp_mp/utility/game_utility::isbrstylegametype()) {
        if (!isdefined(level.var_67b3435949f31707)) {
            level.var_67b3435949f31707 = 0;
            foreach (team in level.teamnamelist) {
                teamcount = level.teamdata[team]["teamCount"];
                if (isdefined(level.var_7b37b2193f163b9b)) {
                    teamcount = teamcount + level.teamdata[team]["UIBotCount"];
                }
                if (teamcount) {
                    level.var_67b3435949f31707++;
                }
            }
        }
        return (level.var_67b3435949f31707 - 1);
    }
    if (isdefined(level.teamswithplayers)) {
        return int(max(level.teamswithplayers.size - 1, 0));
    }
    return 0;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x626c
// Size: 0x3a8
function function_247ba07507f78ac2(victim, attacker) {
    if (!attacker challengesenabledforplayer()) {
        return;
    }
    if (utility::issharedfuncdefined("player", "isFriendly")) {
        if (![[ utility::getsharedfunc("player", "isFriendly") ]](attacker.team, victim)) {
            gamemode = getchallengegamemode(attacker);
            gametype = function_17c5d7feb226e256();
            var_3fff36caeace1b84 = function_5d99311b5a7dffda();
            if (isdefined(level.var_c596a10a13c5cd7c)) {
                var_3fff36caeace1b84 = [[ level.var_c596a10a13c5cd7c ]](var_3fff36caeace1b84, victim);
            }
            weaponlootid = undefined;
            if (isdefined(attacker.primaryweaponobj)) {
                weaponlootid = weapon::getweaponlootid(attacker.primaryweaponobj);
            }
            if (!isdefined(weaponlootid)) {
                weaponlootid = 0;
            }
            if (issharedfuncdefined("weapons", "recommendedStatusBySeason")) {
                var_2420b2d3569c0c6 = [[ utility::getsharedfunc("weapons", "recommendedStatusBySeason") ]](attacker.primaryweaponobj, attacker);
                var_158bd631747ae80 = 0;
                if (isdefined(var_2420b2d3569c0c6)) {
                    if (var_2420b2d3569c0c6[0]) {
                        var_158bd631747ae80 = function_6d40f12a09494350(var_158bd631747ae80, ae_utility::function_e2ff8f4b4e94f723(#"hash_2d6d28e2d2af4ddc", #"recommended_season_0"));
                    }
                    if (var_2420b2d3569c0c6[1]) {
                        var_158bd631747ae80 = function_6d40f12a09494350(var_158bd631747ae80, ae_utility::function_e2ff8f4b4e94f723(#"hash_2d6d28e2d2af4ddc", #"recommended_season_1"));
                    }
                    if (var_2420b2d3569c0c6[2]) {
                        var_158bd631747ae80 = function_6d40f12a09494350(var_158bd631747ae80, ae_utility::function_e2ff8f4b4e94f723(#"hash_2d6d28e2d2af4ddc", #"recommended_season_2"));
                    }
                    if (var_2420b2d3569c0c6[3]) {
                        var_158bd631747ae80 = function_6d40f12a09494350(var_158bd631747ae80, ae_utility::function_e2ff8f4b4e94f723(#"hash_2d6d28e2d2af4ddc", #"recommended_season_3"));
                    }
                    if (var_2420b2d3569c0c6[4]) {
                        var_158bd631747ae80 = function_6d40f12a09494350(var_158bd631747ae80, ae_utility::function_e2ff8f4b4e94f723(#"hash_2d6d28e2d2af4ddc", #"recommended_season_4"));
                    }
                    if (var_2420b2d3569c0c6[5]) {
                        var_158bd631747ae80 = function_6d40f12a09494350(var_158bd631747ae80, ae_utility::function_e2ff8f4b4e94f723(#"hash_2d6d28e2d2af4ddc", #"recommended_season_5"));
                    }
                    if (var_2420b2d3569c0c6[6]) {
                        var_158bd631747ae80 = function_6d40f12a09494350(var_158bd631747ae80, ae_utility::function_e2ff8f4b4e94f723(#"hash_2d6d28e2d2af4ddc", #"recommended_season_6"));
                    }
                }
            }
            weaponclassarray = getweaponclassarray();
            var_b28608820870666 = 0;
            var_b28608820870666 = function_ce112254f7cba89e(attacker.primaryweaponobj);
            in_prematch = istrue(level.inprematch);
            aeeventname = #"assist";
            aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
            params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_a0dd9c7405f2d85e"), var_b28608820870666, ae_utility::function_d6f771aedba70ce7(aeeventname, #"weapon_loot_id"), weaponlootid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_ab2e7c9b727a3d6c"), var_3fff36caeace1b84, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_2d6d28e2d2af4ddc"), var_158bd631747ae80, ae_utility::function_d6f771aedba70ce7(aeeventname, #"in_prematch"), in_prematch];
            /#
                function_7d97a2a745e514c4(aeeventid, params);
            #/
            attacker reportChallengeUserSerializedEventWrapper(aeeventid, params);
        }
    }
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x661b
// Size: 0x1b0
function function_817629c461ea3540(victim, var_815f9c7c319d9eac, attacker) {
    if (!var_815f9c7c319d9eac challengesenabledforplayer()) {
        return;
    }
    if (utility::issharedfuncdefined("player", "isFriendly")) {
        if (![[ utility::getsharedfunc("player", "isFriendly") ]](attacker.team, victim) && [[ utility::getsharedfunc("player", "isFriendly") ]](var_815f9c7c319d9eac.team, attacker)) {
            gamemode = getchallengegamemode(var_815f9c7c319d9eac);
            gametype = function_17c5d7feb226e256();
            var_3fff36caeace1b84 = function_5d99311b5a7dffda();
            if (isdefined(level.var_c596a10a13c5cd7c)) {
                var_3fff36caeace1b84 = [[ level.var_c596a10a13c5cd7c ]](var_3fff36caeace1b84, victim);
            }
            in_prematch = istrue(level.inprematch);
            aeeventname = #"unassisted_kill";
            aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
            params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_ab2e7c9b727a3d6c"), var_3fff36caeace1b84, ae_utility::function_d6f771aedba70ce7(aeeventname, #"in_prematch"), in_prematch];
            /#
                function_7d97a2a745e514c4(aeeventid, params);
            #/
            var_815f9c7c319d9eac reportChallengeUserSerializedEventWrapper(aeeventid, params);
        }
    }
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67d2
// Size: 0x7f
function function_d8f43796d36ed5bf(ref, source) {
    if (!challengesenabledforplayer()) {
        return;
    }
    aeeventname = #"killstreak_available";
    aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
    params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1];
    /#
        function_7d97a2a745e514c4(aeeventid, params);
    #/
    reportChallengeUserSerializedEventWrapper(aeeventid, params);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6858
// Size: 0x1e1
function function_597bc208d923a465(ref, totalkills) {
    if (!challengesenabledforplayer()) {
        return;
    }
    if (!isdefined(ref) || !isdefined(totalkills)) {
        return;
    }
    gametype = function_17c5d7feb226e256();
    gamemode = getchallengegamemode(self);
    bitfield = 0;
    total_kills = totalkills;
    operatorlootid = function_aff35122a61a900b(self.team);
    if (!isdefined(operatorlootid)) {
        operatorlootid = 0;
    }
    killstreak_lootid = loot::getlootidfromref(ref);
    var_35529beecc177a27 = function_3ea2b9fa713d6ed3(self);
    aeeventname = #"killstreak_end";
    gametype = function_68ffb11dc4c6b979(gametype, aeeventname);
    gamemode = function_68ffb11dc4c6b979(gamemode, aeeventname);
    total_kills = function_68ffb11dc4c6b979(total_kills, aeeventname);
    operatorlootid = function_68ffb11dc4c6b979(operatorlootid, aeeventname);
    killstreak_lootid = function_68ffb11dc4c6b979(killstreak_lootid, aeeventname);
    var_35529beecc177a27 = function_68ffb11dc4c6b979(var_35529beecc177a27, aeeventname);
    bitfield = function_68ffb11dc4c6b979(bitfield, aeeventname);
    function_8e81148472fb520a(self, aeeventname, [ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_d404f427903135e"), total_kills, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_834ae5ef756e04aa"), operatorlootid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_797a1495585997f4"), bitfield, ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"weapon_loot_id"), killstreak_lootid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_bd518e95df4103fe"), var_35529beecc177a27]);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a40
// Size: 0x73
function function_68ffb11dc4c6b979(value, aeeventname) {
    if (isdefined(value) && !isint(value) && !isstring(value)) {
        /#
            println("<unknown string>" + value + "<unknown string>" + function_3c8848a3a11b2553(aeeventname));
        #/
        return int(0);
    }
    if (!isdefined(value)) {
        /#
            println("<unknown string>" + function_3c8848a3a11b2553(aeeventname));
        #/
        return int(0);
    }
    return value;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6abb
// Size: 0x216
function function_d997435895422ecc(ref, eventtypebit, value) {
    if (!challengesenabledforplayer()) {
        return;
    }
    var_335ba1ebe269094 = 0;
    gametype = function_17c5d7feb226e256();
    gamemode = getchallengegamemode(self);
    if (isdefined(value) && value < 0) {
        value = 1;
    }
    var_335ba1ebe269094 = loot::getlootidfromref(ref);
    /#
        if (!isdefined(var_335ba1ebe269094) || var_335ba1ebe269094 == 0) {
            println("<unknown string>" + ref + "<unknown string>");
        }
    #/
    location = 0;
    location2 = 0;
    if (isdefined(self.closestpoi)) {
        location = getlocation(function_5b2c23ea4889f30b(self.closestpoi));
        location2 = function_55be16fb0f5f4a19(function_5b2c23ea4889f30b(self.closestpoi));
    }
    var_7fb63b7fac6d1698 = function_3ea2b9fa713d6ed3(self);
    bitfield = 0;
    bitfield = function_6d40f12a09494350(bitfield, eventtypebit);
    aeeventname = #"field_upgrade";
    function_8e81148472fb520a(self, aeeventname, [ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype, ae_utility::function_d6f771aedba70ce7(aeeventname, #"value"), value, ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"loot_id"), var_335ba1ebe269094, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_83a2d67994d7e295"), bitfield, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_92939ab8dccb3d82"), location, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_dc0d981f2d59d210"), location2, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_bd518e95df4103fe"), var_7fb63b7fac6d1698]);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6cd8
// Size: 0xa0
function function_bd59aa7e8cece1ab(ref, value) {
    if (!challengesenabledforplayer()) {
        return;
    }
    field_upgrade = ref;
    amount = value;
    aeeventname = #"field_end";
    function_8e81148472fb520a(self, aeeventname, [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"string_ref"), field_upgrade, ae_utility::function_d6f771aedba70ce7(aeeventname, #"value"), amount]);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6d7f
// Size: 0x1ae
function oncapture(modifiers) {
    if (!isplayer(self)) {
        if (istrue(level.var_c48ab672d4fb36a) && isdefined(self.subclass) && self.subclass == "capture_bot" || !istrue(level.var_c48ab672d4fb36a) && issharedfuncdefined("super_capture_bot", "captureBot_isGrenadeEntity") && function_f3bb4f4911a1beb2("super_capture_bot", "captureBot_isGrenadeEntity")) {
            owner = self.owner;
            if (utility::issharedfuncdefined("player", "getCurrentSuperRef")) {
                superref = owner [[ utility::getsharedfunc("player", "getCurrentSuperRef") ]]();
                lootid = loot::getlootidfromref(superref);
            }
        } else {
            return;
        }
    } else {
        owner = self;
        lootid = 0;
    }
    if (!owner challengesenabledforplayer()) {
        return;
    }
    aeeventname = #"capture";
    aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
    params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"loot_id"), lootid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"value"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), getchallengegamemode(), ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), function_17c5d7feb226e256()];
    owner reportChallengeUserSerializedEventWrapper(aeeventid, params);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f34
// Size: 0xa4
function function_c51330573171a1be(player) {
    if (!player challengesenabledforplayer()) {
        return;
    }
    gamemode = getchallengegamemode(player);
    gametype = function_17c5d7feb226e256();
    aeeventname = #"defuse";
    function_8e81148472fb520a(player, aeeventname, [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype]);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6fdf
// Size: 0xd
function onplant() {
    function_4fb61d33f02e8203(self, 1);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ff3
// Size: 0xe9
function function_f05d761dc1bfa1b5() {
    if (!challengesenabledforplayer()) {
        return;
    }
    aeeventname = #"hash_372efa96b8695b65";
    aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
    weaponlootid = undefined;
    if (isdefined(self.currentprimaryweapon)) {
        weaponlootid = weapon::getweaponlootid(self.currentprimaryweapon);
    }
    if (!isdefined(weaponlootid)) {
        weaponlootid = 0;
    }
    params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), getchallengegamemode(), ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), function_17c5d7feb226e256(), ae_utility::function_d6f771aedba70ce7(aeeventname, #"weapon_loot_id"), weaponlootid];
    reportChallengeUserSerializedEventWrapper(aeeventid, params);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x70e3
// Size: 0x84
function onstun(equipment) {
    if (!challengesenabledforplayer()) {
        return;
    }
    aeeventname = #"stun";
    aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
    params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_e2a522a357642b64"), equipment, ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1];
    reportChallengeUserSerializedEventWrapper(aeeventid, params);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x716e
// Size: 0x84
function onstim(health_recovered) {
    if (!challengesenabledforplayer()) {
        return;
    }
    aeeventname = #"stim";
    aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
    params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"value"), health_recovered, ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1];
    reportChallengeUserSerializedEventWrapper(aeeventid, params);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x71f9
// Size: 0x1b5
function onhack(equipment) {
    if (isdefined(self.equipmentref) && self.equipmentref == "equip_capture_bot") {
        if (!self.owner challengesenabledforplayer()) {
            return;
        }
    } else if (!challengesenabledforplayer()) {
        return;
    }
    aeeventname = #"hack";
    aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
    owner = self;
    var_6172623b415f2e5e = 0;
    var_5ea1e2f4234ceef0 = 0;
    if (isdefined(self.equipmentref) && self.equipmentref == "equip_capture_bot") {
        owner = self.owner;
        if (utility::issharedfuncdefined("player", "getCurrentSuperRef")) {
            superref = owner [[ utility::getsharedfunc("player", "getCurrentSuperRef") ]]();
            var_6172623b415f2e5e = loot::getlootidfromref(superref);
        }
    }
    if (isdefined(getlootidfromref(equipment))) {
        var_5ea1e2f4234ceef0 = getlootidfromref(equipment);
    }
    params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_1e968d7574076fcd"), var_5ea1e2f4234ceef0, ae_utility::function_d6f771aedba70ce7(aeeventname, #"loot_id"), var_6172623b415f2e5e, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), getchallengegamemode(), ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), function_17c5d7feb226e256()];
    owner reportChallengeUserSerializedEventWrapper(aeeventid, params);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x73b5
// Size: 0xd8
function gettouchinglocaletriggers(attacker, victim) {
    buffer = "";
    if (!isdefined(level.localetriggers)) {
        return buffer;
    }
    found = 0;
    foreach (trigger in level.localetriggers) {
        if (attacker istouching(trigger) || isdefined(victim) && victim istouching(trigger)) {
            if (isdefined(trigger.localeid)) {
                if (found) {
                    buffer = buffer + "|";
                }
                buffer = buffer + trigger.localeid;
                found = 1;
            }
        }
    }
    return buffer;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7495
// Size: 0x12a
function gettouchingspraylocaletriggers(player) {
    if (!isdefined(level.localetriggers)) {
        return -1;
    }
    foreach (trigger in level.localetriggers) {
        if (player istouching(trigger)) {
            valid_spray = isdefined(trigger.sprayid) && trigger.sprayid > -1;
            var_50ba7204daa28034 = isdefined(player.sprayed) && player.sprayed & 1 << trigger.sprayid;
            if (valid_spray && !var_50ba7204daa28034) {
                if (!isdefined(player.sprayed)) {
                    player.sprayed = 0;
                }
                player.sprayed = player.sprayed | 1 << trigger.sprayid;
                return trigger.sprayid;
            }
        }
    }
    return -1;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75c7
// Size: 0x1b5
function oncontractstart(contractid, var_a705a5a5884ebf9c) {
    if (!challengesenabledforplayer()) {
        return;
    }
    gamemode = getchallengegamemode(self);
    gametype = function_17c5d7feb226e256();
    operatorlootid = function_aff35122a61a900b(self.team);
    location = 0;
    location2 = 0;
    if (isdefined(var_a705a5a5884ebf9c) && isdefined(var_a705a5a5884ebf9c.closestpoi)) {
        location = getlocation(function_5b2c23ea4889f30b(var_a705a5a5884ebf9c.closestpoi));
        location2 = function_55be16fb0f5f4a19(function_5b2c23ea4889f30b(var_a705a5a5884ebf9c.closestpoi));
    }
    aeeventname = #"contract_start";
    aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
    params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype, ae_utility::function_d6f771aedba70ce7(aeeventname, #"value"), contractid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"operator_id"), operatorlootid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_92939ab8dccb3d82"), location, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_dc0d981f2d59d210"), location2];
    /#
        function_7d97a2a745e514c4(aeeventid, params);
    #/
    reportChallengeUserSerializedEventWrapper(aeeventid, params);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7783
// Size: 0x324
function oncontractend(contractid, completed, var_1229758a8a60ba86, startingpoi) {
    if (!challengesenabledforplayer()) {
        return;
    }
    gamemode = getchallengegamemode(self);
    gametype = function_17c5d7feb226e256();
    operatorlootid = function_aff35122a61a900b(self.team);
    location = 0;
    location2 = 0;
    if (isdefined(startingpoi)) {
        location = getlocation(startingpoi);
        location2 = function_55be16fb0f5f4a19(startingpoi);
    }
    var_98ffdd148b962576 = 0;
    if (isalive(self)) {
        var_98ffdd148b962576 = function_6d40f12a09494350(var_98ffdd148b962576, ae_utility::function_e2ff8f4b4e94f723(#"hash_bf1744b6c07743aa", #"alive"));
    }
    if (completed) {
        var_98ffdd148b962576 = function_6d40f12a09494350(var_98ffdd148b962576, ae_utility::function_e2ff8f4b4e94f723(#"hash_bf1744b6c07743aa", #"completed"));
    } else {
        var_98ffdd148b962576 = function_6d40f12a09494350(var_98ffdd148b962576, ae_utility::function_e2ff8f4b4e94f723(#"hash_bf1744b6c07743aa", #"failed"));
    }
    if (var_1229758a8a60ba86 == 1) {
        var_98ffdd148b962576 = function_6d40f12a09494350(var_98ffdd148b962576, ae_utility::function_e2ff8f4b4e94f723(#"hash_bf1744b6c07743aa", #"team1"));
    } else if (var_1229758a8a60ba86 == 2) {
        var_98ffdd148b962576 = function_6d40f12a09494350(var_98ffdd148b962576, ae_utility::function_e2ff8f4b4e94f723(#"hash_bf1744b6c07743aa", #"team2"));
    }
    var_bb38571cca0414f = function_c1945f26d99b0ed9(self);
    aeeventname = #"contract_end";
    aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
    params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype, ae_utility::function_d6f771aedba70ce7(aeeventname, #"value"), contractid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"operator_id"), operatorlootid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_92939ab8dccb3d82"), location, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_dc0d981f2d59d210"), location2, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_bf1744b6c07743aa"), var_98ffdd148b962576, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_f3287b83e723dcd4"), var_bb38571cca0414f[0], ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_f3287c83e723de87"), var_bb38571cca0414f[1], ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_f3287d83e723e03a"), var_bb38571cca0414f[2], ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_f3287e83e723e1ed"), var_bb38571cca0414f[3], ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_f3287783e723d608"), var_bb38571cca0414f[4]];
    /#
        function_7d97a2a745e514c4(aeeventid, params);
    #/
    reportChallengeUserSerializedEventWrapper(aeeventid, params);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7aae
// Size: 0x547
function private function_417907aeeb08baac(instancetype) {
    switch (instancetype) {
    case #"hash_6d3a7f28d4e30af0":
        return function_6d40f12a09494350(0, ae_utility::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"bar_cabinet"));
    case #"hash_2808ce3c4558142d":
    case #"hash_93553b29704c0d3":
        return function_6d40f12a09494350(0, ae_utility::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"cash_register"));
    case #"hash_2cbf29aaf45c022d":
        return function_6d40f12a09494350(0, ae_utility::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"clothes"));
    case #"hash_44904bb5898785d9":
        return function_6d40f12a09494350(0, ae_utility::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"computer"));
    case #"hash_8387e0bfe22abc5d":
    case #"hash_f1db14019ca6a516":
        return function_6d40f12a09494350(0, ae_utility::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"dmz_dead_drop"));
    case #"hash_3b6111354af78459":
    case #"hash_8193a20e7851382b":
    case #"hash_a7972bf23ae4418b":
        return function_6d40f12a09494350(0, ae_utility::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"hash_b7a47ac5e86a7c8"));
    case #"hash_be635d272d652f68":
    case #"hash_42af86e7be283722":
    case #"hash_8756bee9b861200":
    case #"hash_1c5319d275640df":
        return function_6d40f12a09494350(0, ae_utility::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"dmz_safe"));
    case #"hash_5fb47d4344357148":
        return function_6d40f12a09494350(0, ae_utility::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"hash_4b14731043e2457a"));
    case #"hash_993262832973e0d":
    case #"hash_61f36140da68c992":
    case #"hash_5fe210289499bd6e":
        return function_6d40f12a09494350(0, ae_utility::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"dmz_supply_drop"));
    case #"hash_15ffdff5c5e4cca2":
        return function_6d40f12a09494350(0, ae_utility::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"dresser"));
    case #"hash_7635d9926e3b434":
    case #"hash_763609926e3b8ed":
        return function_6d40f12a09494350(0, ae_utility::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"duffel_bag"));
    case #"hash_50e52e4dc37fb7a8":
        return function_6d40f12a09494350(0, ae_utility::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"hash_40ad471432d12503"));
    case #"hash_a6fd900b15b2be21":
    case #"hash_acc339f27e6535d8":
    case #"hash_acc33cf27e653a91":
    case #"hash_bd0a50437d51e6e7":
    case #"hash_bd0a51437d51e87a":
    case #"hash_8a31c0680349ff7b":
        return function_6d40f12a09494350(0, ae_utility::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"fridge"));
    case #"hash_f5264031983561d3":
    case #"hash_f526413198356366":
        return function_6d40f12a09494350(0, ae_utility::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"locker"));
    case #"hash_9c4e1145f143be53":
    case #"hash_ac6eb824cf784951":
    case #"hash_ac6eb924cf784ae4":
    case #"hash_fd428ac2a2886e03":
    case #"hash_fd428fc2a28875e2":
        return function_6d40f12a09494350(0, ae_utility::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"loot_backpack"));
    case #"hash_f086d807b107cbfd":
        return function_6d40f12a09494350(0, ae_utility::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"mail_kiosk"));
    case #"hash_469a90a45e97eda9":
        return function_6d40f12a09494350(0, ae_utility::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"hash_e57057f8c389d76"));
    case #"hash_c82c626607f41c61":
        return function_6d40f12a09494350(0, ae_utility::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"office_cabinet"));
    case #"hash_183cb58bad34bd86":
    case #"hash_33a1ab3969e0b64e":
    case #"hash_b5b4216883bf84b8":
    case #"hash_b1814c3921b5bcf2":
        return function_6d40f12a09494350(0, ae_utility::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"pack"));
    case #"hash_19ba8d41970911ad":
    case #"hash_8944097b14faec32":
    case #"hash_4ca1dc2e1b0de0d3":
    case #"hash_4654cfd269b6fc02":
    case #"hash_417c605750c7baa5":
    case #"hash_9c5f01407ae504fc":
    case #"hash_a10a247457819cda":
        return function_6d40f12a09494350(0, ae_utility::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"supply_box"));
    case #"hash_4c9cda73b7cb8b41":
        return function_6d40f12a09494350(0, ae_utility::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"tool_box"));
    case #"hash_1a50c41f80fb532b":
        return function_6d40f12a09494350(0, ae_utility::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"weapon_locker"));
    default:
        return 0;
    }
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ffc
// Size: 0x1f0
function function_da9003df08944b01(instance) {
    if (!challengesenabledforplayer()) {
        return;
    }
    if (!isdefined(instance) && !isdefined(instance.type)) {
        return;
    }
    gamemode = getchallengegamemode(self);
    gametype = function_17c5d7feb226e256();
    operatorlootid = function_aff35122a61a900b(self.team);
    location = 0;
    location2 = 0;
    if (isdefined(self.closestpoi)) {
        location = getlocation(function_5b2c23ea4889f30b(self.closestpoi));
        location2 = function_55be16fb0f5f4a19(function_5b2c23ea4889f30b(self.closestpoi));
    }
    var_8f3a85e26344fedf = function_417907aeeb08baac(instance.type);
    var_b17708bcdca61ba6 = 0;
    var_b17708bcdca61ba6 = function_6d40f12a09494350(var_b17708bcdca61ba6, ae_utility::function_e2ff8f4b4e94f723(#"hash_f42835693a3d7da5", #"hash_d77de70746f0150e"));
    aeeventname = #"loot_cache";
    function_8e81148472fb520a(self, aeeventname, [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype, ae_utility::function_d6f771aedba70ce7(aeeventname, #"operator_id"), operatorlootid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_92939ab8dccb3d82"), location, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_dc0d981f2d59d210"), location2, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_1e306cba757eda6f"), var_8f3a85e26344fedf, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_f42835693a3d7da5"), var_b17708bcdca61ba6]);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81f3
// Size: 0x64
function onkioskpurchaseitem(itemtyperef, itemref, lootid, quantity, cashvalue) {
    var_707bc435f8518b62 = function_6d40f12a09494350(0, ae_utility::function_e2ff8f4b4e94f723(#"hash_80f9b45ba3e6882e", #"buy"));
    function_1ba256da09a9878a(self, lootid, itemref, itemtyperef, quantity, cashvalue, var_707bc435f8518b62);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x825e
// Size: 0x6e
function function_ea50038423fc4cfc(itemtyperef, itemref, lootid, quantity, cashvalue, var_f237807396377232) {
    var_707bc435f8518b62 = function_6d40f12a09494350(0, ae_utility::function_e2ff8f4b4e94f723(#"hash_80f9b45ba3e6882e", #"sell"));
    function_1ba256da09a9878a(self, lootid, itemref, itemtyperef, quantity, cashvalue, var_707bc435f8518b62, var_f237807396377232);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82d3
// Size: 0x9c
function function_7ba17fb69c312e2c(itemtyperef, itemref, lootid, quantity, cashvalue) {
    var_707bc435f8518b62 = function_6d40f12a09494350(0, ae_utility::function_e2ff8f4b4e94f723(#"hash_80f9b45ba3e6882e", #"trade"));
    function_1ba256da09a9878a(self, lootid, itemref, itemtyperef, quantity, cashvalue, var_707bc435f8518b62);
    loot_method = function_6d40f12a09494350(0, ae_utility::function_e2ff8f4b4e94f723(#"hash_2af1f13aa6ae3b5f", #"loot"));
    function_d24138b32084fc3e(self, lootid, itemtyperef, loot_method, quantity);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8376
// Size: 0x64
function function_c2c80007aff49924(itemtyperef, itemref, lootid, quantity, cashvalue) {
    var_707bc435f8518b62 = scripts/cp_mp/challenges::function_6d40f12a09494350(0, ae_utility::function_e2ff8f4b4e94f723(#"hash_80f9b45ba3e6882e", #"hash_8007c41db906acd9"));
    function_1ba256da09a9878a(self, lootid, itemref, itemtyperef, quantity, cashvalue, var_707bc435f8518b62);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83e1
// Size: 0x64
function function_3d8a8b0878f9f129(itemtyperef, itemref, lootid, quantity, cashvalue) {
    var_707bc435f8518b62 = scripts/cp_mp/challenges::function_6d40f12a09494350(0, ae_utility::function_e2ff8f4b4e94f723(#"hash_80f9b45ba3e6882e", #"hash_23f44b864cfb53cd"));
    function_1ba256da09a9878a(self, lootid, itemref, itemtyperef, quantity, cashvalue, var_707bc435f8518b62);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x844c
// Size: 0x4d
function onpickupitem(itemtyperef) {
    if (!challengesenabledforplayer()) {
        return;
    }
    pickupweapon = 0;
    pickupplunder = 0;
    if (itemtyperef == "weapon") {
        pickupweapon = 1;
        return;
    }
    if (itemtyperef == "plunder") {
        pickupplunder = 1;
    }
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84a0
// Size: 0x22d
function onPickupWeapon(objweapon) {
    if (!challengesenabledforplayer()) {
        return;
    }
    aeeventname = #"pickup_weapon";
    aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
    gamemode = getchallengegamemode(self);
    gametype = function_17c5d7feb226e256();
    var_349e390338192305 = findgunsmithattachments(objweapon);
    weaponlootid = weapon::function_89a83ae9a4c4142a(objweapon);
    if (!isdefined(weaponlootid)) {
        weaponlootid = 0;
    }
    params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype, ae_utility::function_d6f771aedba70ce7(aeeventname, #"weapon_loot_id"), weaponlootid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_af7cd8c514ea5582"), var_349e390338192305[0], ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_af7cd7c514ea53cf"), var_349e390338192305[1], ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_af7cd6c514ea521c"), var_349e390338192305[2], ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_af7cd5c514ea5069"), var_349e390338192305[3], ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_af7cd4c514ea4eb6"), var_349e390338192305[4], ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_af7cd3c514ea4d03"), var_349e390338192305[5], ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_af7cd2c514ea4b50"), var_349e390338192305[6], ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_af7ce1c514ea64cd"), var_349e390338192305[7], ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_af7ce0c514ea631a"), var_349e390338192305[8], ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_1b7a08e28a2f9d76"), var_349e390338192305[9]];
    reportChallengeUserSerializedEventWrapper(aeeventid, params);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86d4
// Size: 0x29
function oncollectitem(itemtyperef) {
    if (!challengesenabledforplayer()) {
        return;
    }
    self reportchallengeuserevent("collect_item", itemtyperef, getoperators());
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8704
// Size: 0x20
function onuseitem(type) {
    if (!challengesenabledforplayer()) {
        return;
    }
    function_cfeb523fd3aa9ecf(self, undefined, type);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x872b
// Size: 0x23
function onunlockitem(itemunlockref) {
    if (!challengesenabledforplayer()) {
        return;
    }
    self reportchallengeuserevent("collect_item", itemunlockref);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8755
// Size: 0x84
function onloadout(loadouttype) {
    if (!challengesenabledforplayer()) {
        return;
    }
    aeeventname = #"loadout";
    aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
    params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"value"), loadouttype, ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1];
    reportChallengeUserSerializedEventWrapper(aeeventid, params);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87e0
// Size: 0x16
function onping(pingtype) {
    if (!challengesenabledforplayer()) {
        return;
    }
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87fd
// Size: 0x230
function onlaststandrevive(reviver, revivee) {
    gamemode = getchallengegamemode(reviver);
    gametype = function_17c5d7feb226e256();
    if (reviver challengesenabledforplayer()) {
        aeeventname = #"revive";
        var_160460001cc37359 = 0;
        var_160460001cc37359 = function_6d40f12a09494350(var_160460001cc37359, ae_utility::function_e2ff8f4b4e94f723(#"hash_c6554ef3de205884", #"reviver"));
        operatorlootid = reviver function_aff35122a61a900b(reviver.team);
        if (reviver == revivee) {
            var_160460001cc37359 = function_6d40f12a09494350(var_160460001cc37359, ae_utility::function_e2ff8f4b4e94f723(#"hash_c6554ef3de205884", #"revivee"));
        }
        function_8e81148472fb520a(reviver, aeeventname, [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype, ae_utility::function_d6f771aedba70ce7(aeeventname, #"operator_id"), operatorlootid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_c6554ef3de205884"), var_160460001cc37359]);
    }
    if (reviver != revivee && revivee challengesenabledforplayer()) {
        aeeventname = #"revive";
        var_160460001cc37359 = 0;
        var_160460001cc37359 = function_6d40f12a09494350(var_160460001cc37359, ae_utility::function_e2ff8f4b4e94f723(#"hash_c6554ef3de205884", #"revivee"));
        operatorlootid = revivee function_aff35122a61a900b(revivee.team);
        function_8e81148472fb520a(revivee, aeeventname, [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype, ae_utility::function_d6f771aedba70ce7(aeeventname, #"operator_id"), operatorlootid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_c6554ef3de205884"), var_160460001cc37359]);
    }
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a34
// Size: 0x1a5
function function_b2306d0693ba65c1(iswinner) {
    if (!challengesenabledforplayer()) {
        return;
    }
    gamemode = getchallengegamemode(self);
    gametype = function_17c5d7feb226e256();
    operatorlootid = function_aff35122a61a900b(self.team);
    var_9c46b4c2597d7b03 = 0;
    if (iswinner) {
        var_9c46b4c2597d7b03 = function_6d40f12a09494350(var_9c46b4c2597d7b03, ae_utility::function_e2ff8f4b4e94f723(#"hash_2614881933cc996e", #"win"));
    } else {
        var_9c46b4c2597d7b03 = function_6d40f12a09494350(var_9c46b4c2597d7b03, ae_utility::function_e2ff8f4b4e94f723(#"hash_2614881933cc996e", #"loss"));
    }
    teamsize = 0;
    if (gamemode & 8) {
        teamsize = scripts/cp_mp/utility/game_utility::function_4fb37368ae3585bb();
    }
    aeeventname = #"gulag_end";
    aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
    params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype, ae_utility::function_d6f771aedba70ce7(aeeventname, #"operator_id"), operatorlootid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_2614881933cc996e"), var_9c46b4c2597d7b03, ae_utility::function_d6f771aedba70ce7(aeeventname, #"team_size"), teamsize];
    /#
        function_7d97a2a745e514c4(aeeventid, params);
    #/
    reportChallengeUserSerializedEventWrapper(aeeventid, params);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8be0
// Size: 0x94
function onspray() {
    if (!challengesenabledforplayer()) {
        return;
    }
    locale = gettouchingspraylocaletriggers(self);
    if (locale != -1) {
        aeeventname = #"spray";
        aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
        params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"value"), locale, ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1];
        reportChallengeUserSerializedEventWrapper(aeeventid, params);
    }
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c7b
// Size: 0xc8
function function_f09e914e200d1a42(objweapon) {
    weaponname = undefined;
    if (!isdefined(objweapon) || !isdefined(objweapon.basename)) {
        weaponname = "";
    }
    if (!isdefined(weaponname)) {
        weaponname = "";
        if (utility::issharedfuncdefined("equipment", "getEquipmentRefFromWeapon")) {
            weaponname = [[ utility::getsharedfunc("equipment", "getEquipmentRefFromWeapon") ]](objweapon);
        }
        if (!isdefined(weaponname)) {
            if (utility::issharedfuncdefined("weapons", "getDefaultWeaponBaseName")) {
                weaponname = [[ utility::getsharedfunc("weapons", "getDefaultWeaponBaseName") ]](objweapon.basename);
            }
        }
        if (weaponname == "equip_throwing_knife_fire" || weaponname == "equip_throwing_knife_electric" || weaponname == "equip_shuriken") {
            weaponname = "equip_throwing_knife";
        }
    }
    return weaponname;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d4b
// Size: 0x298
function function_ce112254f7cba89e(objweapon) {
    weaponclassarray = getweaponclassarray();
    if (!isdefined(objweapon)) {
        return 0;
    }
    weaponname = undefined;
    if (isweapon(objweapon)) {
        weaponname = objweapon.basename;
    } else {
        /#
            assert(isstring(objweapon));
        #/
        weaponname = objweapon;
    }
    if (!isdefined(weaponname)) {
        return 0;
    }
    weaponroot = weapon::getweaponrootname(objweapon);
    if (isdefined(level.weaponmapdata[weaponroot]) && isdefined(level.weaponmapdata[weaponroot].group)) {
        weapongroup = level.weaponmapdata[weaponroot].group;
    } else {
        return 0;
    }
    var_b28608820870666 = 0;
    if (weaponroot == "iw9_ar_golf3" || weaponname == "iw9_ar_schotel" || weaponname == "iw9_br_msecho" || weaponname == "iw9_br_soscar14") {
        var_b28608820870666 = function_6d40f12a09494350(var_b28608820870666, weaponclassarray["battle"]);
        return var_b28608820870666;
    }
    switch (weapongroup) {
    case #"hash_8af0086b038622b5":
        var_b28608820870666 = function_6d40f12a09494350(var_b28608820870666, weaponclassarray["rifle"]);
        break;
    case #"hash_47368bc0d2ef1565":
        var_b28608820870666 = function_6d40f12a09494350(var_b28608820870666, weaponclassarray["marksman"]);
        break;
    case #"hash_c095d67337b1f5a1":
        var_b28608820870666 = function_6d40f12a09494350(var_b28608820870666, weaponclassarray["sniper"]);
        break;
    case #"hash_9d18adab1b65a661":
        var_b28608820870666 = function_6d40f12a09494350(var_b28608820870666, weaponclassarray["rocketlauncher"]);
        break;
    case #"hash_bef5ec0b3e197ae":
        var_b28608820870666 = function_6d40f12a09494350(var_b28608820870666, weaponclassarray["mg"]);
        break;
    case #"hash_34340d457a63e7f1":
        var_b28608820870666 = function_6d40f12a09494350(var_b28608820870666, weaponclassarray["pistol"]);
        break;
    case #"hash_16cf6289ab06bd30":
        var_b28608820870666 = function_6d40f12a09494350(var_b28608820870666, weaponclassarray["spread"]);
        break;
    case #"hash_ab10f9c080fe4faf":
        var_b28608820870666 = function_6d40f12a09494350(var_b28608820870666, weaponclassarray["smg"]);
        break;
    case #"hash_dd616da0b395a0b0":
        var_b28608820870666 = function_6d40f12a09494350(var_b28608820870666, weaponclassarray["battle"]);
        break;
    case #"hash_86b11ac21f992552":
        var_b28608820870666 = function_6d40f12a09494350(var_b28608820870666, weaponclassarray["melee_primary"]);
        var_b28608820870666 = function_6d40f12a09494350(var_b28608820870666, weaponclassarray["melee"]);
        break;
    case #"hash_a1f27f97be15d620":
        var_b28608820870666 = function_6d40f12a09494350(var_b28608820870666, weaponclassarray["melee_secondary"]);
        var_b28608820870666 = function_6d40f12a09494350(var_b28608820870666, weaponclassarray["melee"]);
        break;
    default:
        return 0;
    }
    return var_b28608820870666;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8feb
// Size: 0x79
function function_6d40f12a09494350(bitfield, bit) {
    if (!isdefined(level.aedisabled)) {
        level.aedisabled = getdvarint(@"hash_f0c3671383d467f8", 0) > 0;
    }
    if (level.aedisabled) {
        return 0;
    }
    if (!isdefined(bit)) {
        return bitfield;
    }
    if (bit > 31 || isstring(bitfield)) {
        return function_1db72f37b2e59440(bitfield + "", bit);
    }
    return bitfield | 1 << bit;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x906b
// Size: 0x13f
function function_3005ef56488df9be(bitfield) {
    var_cc819de748cb6689 = bitfield + "";
    stringlength = var_cc819de748cb6689.size;
    characters = [];
    for (k = 0; k < stringlength; k++) {
        characters[stringlength - k - 1] = int(var_cc819de748cb6689[stringlength - k - 1]);
    }
    lastcharacter = stringlength - 1;
    result = [];
    nextresult = 0;
    while (true) {
        mod2 = characters[lastcharacter] % 2;
        result[nextresult] = mod2 == 1;
        nextresult = nextresult + 1;
        if (mod2 == 1) {
            characters[lastcharacter] = characters[lastcharacter] - 1;
        }
        allzero = 1;
        for (k = 0; k < stringlength; k++) {
            character = characters[stringlength - k - 1];
            if (character != 0) {
                allzero = 0;
            }
            if (character % 2 == 1) {
                characters[stringlength - k] = characters[stringlength - k] + 5;
            }
            characters[stringlength - k - 1] = int(character / 2);
        }
        if (allzero) {
            return result;
        }
    }
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x91b1
// Size: 0x19a
function getchallengegamemode(player) {
    gamemode = 0;
    if (game_utility::function_21322da268e71c19()) {
        gamemode = function_6d40f12a09494350(gamemode, 5);
    }
    if (istrue(level.var_ec2fb549b15ad827)) {
        gamemode = function_6d40f12a09494350(gamemode, 6);
        return gamemode;
    }
    if (istrue(level.var_5ac73e9eb9eea898)) {
        gamemode = function_6d40f12a09494350(gamemode, 10);
        return gamemode;
    }
    if (istrue(level.var_77907d733abe8b63)) {
        gamemode = function_6d40f12a09494350(gamemode, 7);
        return gamemode;
    }
    if (utility::issharedfuncdefined("game", "isBRStyleGameType")) {
        if ([[ utility::getsharedfunc("game", "isBRStyleGameType") ]]()) {
            gamemode = function_6d40f12a09494350(gamemode, 3);
            return gamemode;
        }
    }
    if (utility::issharedfuncdefined("game", "getGameType")) {
        gametype = [[ utility::getsharedfunc("game", "getGameType") ]]();
        if (isdefined(gametype)) {
            if (gametype == "brtdm" || gametype == "brtdm_mgl") {
                gamemode = function_6d40f12a09494350(gamemode, 3);
                return gamemode;
            } else if (utility::iscp()) {
                gamemode = function_6d40f12a09494350(gamemode, 2);
                return gamemode;
            } else if (utility::issp()) {
                gamemode = function_6d40f12a09494350(gamemode, 0);
                return gamemode;
            } else if (isdefined(level.gamemodebundle) && isdefined(level.gamemodebundle.aegamemode) && level.gamemodebundle.aegamemode == "OB") {
                gamemode = function_6d40f12a09494350(gamemode, 9);
                return gamemode;
            } else {
                gamemode = function_6d40f12a09494350(gamemode, 1);
                return gamemode;
            }
        }
    }
    return 0;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9353
// Size: 0x68
function function_aff35122a61a900b(team) {
    if (isdefined(team) && utility::issharedfuncdefined("player", "lookupCurrentOperator")) {
        operatorref = self [[ utility::getsharedfunc("player", "lookupCurrentOperator") ]](team);
        lootid = loot::getlootidfromref(operatorref);
        if (!isdefined(lootid) || lootid < 0) {
            return 0;
        }
        return lootid;
    }
    return 0;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x93c3
// Size: 0x262
function private function_261cfb5c8119ea2b(gametypekey) {
    if (!isdefined(gametypekey)) {
        return 0;
    }
    if (!isdefined(level.challengeandeventglobals.game_type_col) || !isdefined(level.challengeandeventglobals.game_type_col[gametypekey])) {
        return 0;
    }
    if (getdvarint(@"hash_2be93dd484220a45", 0) == 1) {
        return ae_utility::function_b40278e5e468c6c1(#"gametype", #"hash_ddfda95920353859");
    }
    if (getdvarint(@"hash_6f887eb688322ea9", 0)) {
        if (utility::issharedfuncdefined("game", "isBRStyleGameType")) {
            if ([[ utility::getsharedfunc("game", "isBRStyleGameType") ]]()) {
                if (isdefined(level.brgametype) && isdefined(level.brgametype.var_88f31052c5135f3b)) {
                    switch (level.brgametype.var_88f31052c5135f3b) {
                    case #"hash_59b8e9d05b31ff9":
                        return ae_utility::function_b40278e5e468c6c1(#"gametype", #"hash_731d29529dec358d");
                    case #"hash_b4335cd2907efd5e":
                        return ae_utility::function_b40278e5e468c6c1(#"gametype", #"hash_67fa599409d2c6d2");
                    case #"hash_c188f70415de474e":
                        return ae_utility::function_b40278e5e468c6c1(#"gametype", #"hash_1c7e60f30e7507d2");
                    case #"hash_9b9519b2b0a96f04":
                        return ae_utility::function_b40278e5e468c6c1(#"gametype", #"hash_e69084c35403cc98");
                    case #"hash_cfb0c3041d1bdc10":
                    case #"hash_f4afff6c03d92aa0":
                        return ae_utility::function_b40278e5e468c6c1(#"gametype", #"hash_a418775e254600ac");
                    case #"hash_dddecc2751311914":
                        return ae_utility::function_b40278e5e468c6c1(#"gametype", #"hash_f619a150a59cd8b8");
                    case #"hash_16dd223e5a8b22c8":
                        return ae_utility::function_b40278e5e468c6c1(#"gametype", #"hash_1c4004bc52aa7574");
                    case #"hash_4ce2691f06f171fc":
                        return ae_utility::function_b40278e5e468c6c1(#"gametype", #"hash_5e0811865efa4064");
                    case #"hash_3c1c1566d7b3b870":
                    case #"":
                        break;
                    default:
                        break;
                    }
                }
            }
        }
    }
    return level.challengeandeventglobals.game_type_col[gametypekey];
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x962d
// Size: 0x81
function function_17c5d7feb226e256() {
    if (!getdvarint(@"hash_78653010d584aa6e")) {
        gametype = undefined;
        if (utility::issharedfuncdefined("game", "getGameType")) {
            gametype = [[ utility::getsharedfunc("game", "getGameType") ]]();
        }
        if (!isdefined(gametype)) {
            gametype = scripts/cp_mp/utility/game_utility::getgametype();
        }
        gametypecol = function_261cfb5c8119ea2b(gametype);
        return gametypecol;
    }
    return function_261cfb5c8119ea2b(level.gametypebundle.var_d20acad05758f0d8);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x96b6
// Size: 0x460
function getweaponclassarray() {
    if (!isdefined(level.weaponclassarray)) {
        level.weaponclassarray = spawnstruct();
        level.weaponclassarray.classes = [];
        level.weaponclassarray.classes["none"] = ae_utility::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"none");
        level.weaponclassarray.classes["sniper"] = ae_utility::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"sniper");
        level.weaponclassarray.classes["mg"] = ae_utility::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"lmg");
        level.weaponclassarray.classes["smg"] = ae_utility::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"smg");
        level.weaponclassarray.classes["spread"] = ae_utility::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"shotgun");
        level.weaponclassarray.classes["pistol"] = ae_utility::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"pistol");
        level.weaponclassarray.classes["grenade"] = ae_utility::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"grenade");
        level.weaponclassarray.classes["rocketlauncher"] = ae_utility::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"launcher");
        level.weaponclassarray.classes["turret"] = ae_utility::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"turret");
        level.weaponclassarray.classes["throwingknife"] = ae_utility::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"throwing_knife");
        level.weaponclassarray.classes["non-player"] = ae_utility::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"non_player");
        level.weaponclassarray.classes["item"] = ae_utility::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"item");
        level.weaponclassarray.classes["beam"] = ae_utility::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"beam");
        level.weaponclassarray.classes["ball"] = ae_utility::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"ball");
        level.weaponclassarray.classes["rifle"] = ae_utility::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"assault");
        level.weaponclassarray.classes["battle"] = ae_utility::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"battle");
        level.weaponclassarray.classes["marksman"] = ae_utility::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"marksman");
        level.weaponclassarray.classes["killstreak"] = ae_utility::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"killstreak");
        level.weaponclassarray.classes["melee_primary"] = ae_utility::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"melee_primary");
        level.weaponclassarray.classes["melee_secondary"] = ae_utility::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"melee_secondary");
        level.weaponclassarray.classes["melee"] = ae_utility::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"melee");
    }
    return level.weaponclassarray.classes;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b1e
// Size: 0xac3
function function_d6973792fd45b035() {
    if (!isdefined(level.var_e4f4a057080c0ed5)) {
        level.var_e4f4a057080c0ed5 = [];
        level.var_e4f4a057080c0ed5["specialty_survivor"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_survivor");
        level.var_e4f4a057080c0ed5["specialty_extra_tactical"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_extra_tactical");
        level.var_e4f4a057080c0ed5["specialty_overwatch"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_overwatch");
        level.var_e4f4a057080c0ed5["specialty_grenade_expert"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_grenade_expert");
        level.var_e4f4a057080c0ed5["specialty_eod"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_eod");
        level.var_e4f4a057080c0ed5["specialty_focus"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_focus");
        level.var_e4f4a057080c0ed5["specialty_restock"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_restock");
        level.var_e4f4a057080c0ed5["specialty_overcharge_field_upgrade"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_overcharge_field_upgrade");
        level.var_e4f4a057080c0ed5["specialty_warhead"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_warhead");
        level.var_e4f4a057080c0ed5["specialty_munitions_2"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_munitions_2");
        level.var_e4f4a057080c0ed5["specialty_scavenger_plus"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_scavenger");
        level.var_e4f4a057080c0ed5["specialty_guerrilla"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_guerrilla");
        level.var_e4f4a057080c0ed5["specialty_hardline"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_hardline");
        level.var_e4f4a057080c0ed5["specialty_huntmaster"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_huntmaster");
        level.var_e4f4a057080c0ed5["specialty_tactical_recon"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_tactical_recon");
        level.var_e4f4a057080c0ed5["specialty_hustle"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_hustle");
        level.var_e4f4a057080c0ed5["specialty_covert_ops"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_covert_ops");
        level.var_e4f4a057080c0ed5["specialty_tac_resist"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"hash_228c132d78456c6");
        level.var_e4f4a057080c0ed5["specialty_surveillance"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"hash_b3aa7c0a8c7ed3ac");
        level.var_e4f4a057080c0ed5["specialty_quick_fix"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"hash_b7589c37d759ad90");
        level.var_e4f4a057080c0ed5["specialty_null"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"hash_208442e5e74e8368");
        level.var_e4f4a057080c0ed5["specialty_tac_mask"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_tac_mask");
        level.var_e4f4a057080c0ed5["specialty_hijacked_iff_strobe"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_hijacked_iff_strobe");
        level.var_e4f4a057080c0ed5["specialty_high_gain_antenna"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_high_gain_antenna");
        level.var_e4f4a057080c0ed5["specialty_tac_gloves"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_tac_gloves");
        level.var_e4f4a057080c0ed5["specialty_acoustic_sensor"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_acoustic_sensor");
        level.var_e4f4a057080c0ed5["specialty_lr_detector"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_lr_detector");
        level.var_e4f4a057080c0ed5["specialty_signal_jammer"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_signal_jammer");
        level.var_e4f4a057080c0ed5["specialty_monomer_plate"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_monomer_plate");
        level.var_e4f4a057080c0ed5["specialty_thermal_camo"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_thermal_camo");
        level.var_e4f4a057080c0ed5["specialty_elasomer_pads"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_elasomer_pads");
        level.var_e4f4a057080c0ed5["specialty_dex_gloves"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_dex_gloves");
        level.var_e4f4a057080c0ed5["specialty_canvas_sneakers"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_canvas_sneakers");
        level.var_e4f4a057080c0ed5["specialty_maritime_boots"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_maritime_boots");
        level.var_e4f4a057080c0ed5["specialty_ultra_light_boots"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_ultra_light_boots");
        level.var_e4f4a057080c0ed5["specialty_extra_deadly"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_extra_deadly");
        level.var_e4f4a057080c0ed5["specialty_blacklight_flashlight"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_blacklight_flashlight");
        level.var_e4f4a057080c0ed5["specialty_taccom_system"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_taccom_system");
        level.var_e4f4a057080c0ed5["specialty_bone_conduction"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_bone_conduction");
        level.var_e4f4a057080c0ed5["specialty_nods"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_nods");
        level.var_e4f4a057080c0ed5["specialty_dauntless_boots"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_dauntless_boots");
        level.var_e4f4a057080c0ed5["specialty_intel_jacker"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_intel_jacker");
        level.var_e4f4a057080c0ed5["specialty_shielded_carrier"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_shielded_carrier");
        level.var_e4f4a057080c0ed5["specialty_suspension_pads"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_suspension_pads");
        level.var_e4f4a057080c0ed5["specialty_flame_res_insulation"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_flame_res_insulation");
        level.var_e4f4a057080c0ed5["specialty_cct_vest"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_cct_vest");
        level.var_e4f4a057080c0ed5["specialty_assault_gloves"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_assault_gloves");
        level.var_e4f4a057080c0ed5["specialty_silicon_gloves"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_silicon_gloves");
        level.var_e4f4a057080c0ed5["specialty_impact_res_gloves"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_impact_res_gloves");
        level.var_e4f4a057080c0ed5["specialty_custom_gloves"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_custom_gloves");
        level.var_e4f4a057080c0ed5["specialty_tac_pads"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_tac_pads");
        level.var_e4f4a057080c0ed5["specialty_running_sneakers"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_running_sneakers");
        level.var_e4f4a057080c0ed5["specialty_treadless_boots"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_treadless_boots");
        level.var_e4f4a057080c0ed5["specialty_eod_vest"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_eod_vest");
        level.var_e4f4a057080c0ed5["specialty_infantry_vest"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_infantry_vest");
        level.var_e4f4a057080c0ed5["specialty_ghost_camo"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_ghost_camo");
        level.var_e4f4a057080c0ed5["specialty_grenadier_vest"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_grenadier_vest");
        level.var_e4f4a057080c0ed5["specialty_scout_vest"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_scout_vest");
        level.var_e4f4a057080c0ed5["specialty_overkill_vest"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_overkill_vest");
        level.var_e4f4a057080c0ed5["specialty_tac_vest"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_tac_vest");
        level.var_e4f4a057080c0ed5["specialty_black_market_phone"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_black_market_phone");
        level.var_e4f4a057080c0ed5["specialty_stalker_boots"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_stalker_boots");
        level.var_e4f4a057080c0ed5["specialty_marksman_gloves"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_marksman_gloves");
        level.var_e4f4a057080c0ed5["specialty_gunner_vest"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_gunner_vest");
        level.var_e4f4a057080c0ed5["specialty_fast_reload"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_fast_reload");
        level.var_e4f4a057080c0ed5["specialty_ninja_vest"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"specialty_ninja_vest");
        level.var_e4f4a057080c0ed5["none"] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"hash_208442e5e74e8368");
        level.var_e4f4a057080c0ed5[""] = function_e2ff8f4b4e94f723(#"hash_bd518e95df4103fe", #"hash_208442e5e74e8368");
    }
    return level.var_e4f4a057080c0ed5;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa5e9
// Size: 0xd7b
function getlocation(poi, sublocation) {
    location = 0;
    if (isdefined(level.mapname)) {
        switch (level.mapname) {
        case #"hash_57eba45b7ddbdcd6":
        case #"hash_63326ac3e12f8da0":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"mp_saba"));
            break;
        case #"hash_4617d802bdced46":
        case #"hash_a82a4d91a314a926":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_9991289102a4a906"));
            break;
        case #"hash_c0437228d481a553":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_18fcdac82044e5b3"));
            break;
        case #"hash_721bd15904e6ff51":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"mp_bio_lab"));
            break;
        case #"hash_3eff14ec1d9395c1":
        case #"hash_636b409bbce21729":
        case #"hash_e817308cc606e9e1":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"mp_delta"));
            break;
        case #"hash_73e90c896fdaebc3":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"mp_jup_bigmap_wz2"));
            break;
        default:
            break;
        }
    }
    if (isdefined(poi)) {
        if (!isdefined(level.var_93d766d265995ec6)) {
            level.var_93d766d265995ec6 = [];
        }
        if (isdefined(level.var_93d766d265995ec6[poi])) {
            var_b8d53bb8326b1bbb = level.var_93d766d265995ec6[poi];
        } else {
            var_b8d53bb8326b1bbb = poi;
        }
        switch (var_b8d53bb8326b1bbb) {
        case #"hash_2fc7c295b037f8c8":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"saba_airport"));
            break;
        case #"hash_323a903afe21c55":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_c0b040a45d7f0a35"));
            break;
        case #"hash_55998447da820c51":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_9fee7ac96c9e2af1"));
            break;
        case #"hash_bf64f3350855cdc0":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_7fe2e7b481144a0"));
            break;
        case #"hash_8c3b9af8bb8c1820":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_89a211bd5655c200"));
            break;
        case #"hash_bfacd3c12e3210d5":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_6a081a3989640435"));
            break;
        case #"hash_7c61ad10d89b8ce6":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"saba_oasis"));
            break;
        case #"hash_24913acf39b1b9d":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"saba_oilfield"));
            break;
        case #"hash_e9beb39bd45dace9":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"saba_caves"));
            break;
        case #"hash_37758f87479407e4":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"saba_fort"));
            break;
        case #"hash_f18f60036d48d0f":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"saba_observatory"));
            break;
        case #"hash_c95fc729a312805c":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_d78794a4c71719c"));
            break;
        case #"hash_c8ec8fdd7804347d":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_68cbc9667238f93d"));
            break;
        case #"hash_8d517c7cd4c59daf":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"saba_oldtwn"));
            break;
        case #"hash_94cea40522328dd7":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"saba_mtntwn"));
            break;
        case #"hash_3ca65c5d8ac073f1":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"saba_exhume"));
            break;
        case #"hash_ceed33ec74498ad9":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"saba_cemetery"));
            break;
        case #"hash_1488720cef98266d":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"saba_hydro"));
            break;
        case #"hash_cf5e052f7a158621":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_7d3886434243a401"));
            break;
        case #"hash_cf5e022f7a158168":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_7d38834342439ee8"));
            break;
        case #"hash_cf5e032f7a1582fb":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_7d3884434243a09b"));
            break;
        case #"hash_cf5e082f7a158ada":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_7d3889434243a91a"));
            break;
        case #"hash_cf5e092f7a158c6d":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_7d388a434243aacd"));
            break;
        case #"hash_cf5e062f7a1587b4":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_7d3887434243a5b4"));
            break;
        case #"hash_cf5e072f7a158947":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_7d3888434243a767"));
            break;
        case #"hash_cf5dfc2f7a1577f6":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_7d387d43424394b6"));
            break;
        case #"hash_cf5dfd2f7a157989":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_7d387e4342439669"));
            break;
        case #"hash_cf610a2f7a17cc97":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_7d3b8b434245e257"));
            break;
        case #"hash_cf61092f7a17cb04":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_7d3b8a434245e0a4"));
            break;
        case #"hash_cf610c2f7a17cfbd":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_7d3b8d434245e5bd"));
            break;
        case #"hash_cf610b2f7a17ce2a":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_7d3b8c434245e40a"));
            break;
        case #"hash_cf61062f7a17c64b":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_7d3b87434245db8b"));
            break;
        case #"hash_c45f27b96f2ad068":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_8ff0c309b1a1908"));
            break;
        case #"hash_fea386fb2aa41ed6":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"sealion_beachclub"));
            break;
        case #"hash_ee3a4e86c1774bb7":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"sealion_castle"));
            break;
        case #"hash_b74d2013e0a73b91":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"sealion_coastalruins"));
            break;
        case #"hash_42039e0dfa3b0be4":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_5d07baf686ac81a4"));
            break;
        case #"hash_425ebb3f3dd8bf73":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_ff40b181aa9cecf3"));
            break;
        case #"hash_c5c4b2288656dc11":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_6fb5a791f63fb951"));
            break;
        case #"hash_202632819760f0f3":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"sealion_residential"));
            break;
        case #"hash_a15a99827cbcb8cd":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_2c100bd4079345ad"));
            break;
        case #"hash_45a8eb1e8a07af8a":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_76b4cdd1fe62556a"));
            break;
        case #"hash_c3ce7ba6414ef022":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_4ad336a27b70ccc2"));
            break;
        case #"hash_f58c21f8c451efe6":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"sealion_waterways"));
            break;
        case #"hash_5065eaea648578ee":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"delta_castle"));
            break;
        case #"hash_b4fec2c123adbfd2":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"delta_cemetary"));
            break;
        case #"hash_14bbe6b90c8369ca":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"delta_cityhall"));
            break;
        case #"hash_4f1ad34662aa3a82":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"delta_firestation"));
            break;
        case #"hash_53022f086491e02a":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"delta_fleamarket"));
            break;
        case #"hash_5b71b0ea2ed56595":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_97f878cab4a2b055"));
            break;
        case #"hash_239a49cd4504b4dd":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"delta_library"));
            break;
        case #"hash_acf6b546ae4484dc":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_e4b969708fad633c"));
            break;
        case #"hash_ee6fcf2d91c2b6ca":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"delta_museum"));
            break;
        case #"hash_ae4c218f1f8dd217":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_9938a76de295bb97"));
            break;
        case #"hash_2b66f465e931d3c4":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_b49b4b47ef66b904"));
            break;
        case #"hash_b4fe333572abf8ec":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_737542d6543379cc"));
            break;
        case #"hash_e26564d1e7044875":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"delta_stadium"));
            break;
        case #"hash_b4aa823331182196":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"delta_station"));
            break;
        case #"hash_c6f07a0b07c6b7b2":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"delta_terminal"));
            break;
        default:
            break;
        }
    }
    if (isdefined(sublocation)) {
        switch (sublocation) {
        case #"hash_95e472767d515c8b":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"sira_mall"));
            break;
        case #"hash_7c61ad10d89b8ce6":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"saba_oasis"));
            break;
        }
    }
    return location;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb36c
// Size: 0x9f8
function function_55be16fb0f5f4a19(poi, sublocation) {
    location = 0;
    if (isdefined(level.mapname)) {
        switch (level.mapname) {
        case #"hash_5d52d1f62d321d14":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"mp_biobunker"));
            break;
        case #"hash_73e90c896fdaebc3":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"mp_jup_bigmap_wz2"));
            break;
        case #"hash_da8f14763f037922":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_6540a118cbb56ca2"));
            break;
        default:
            break;
        }
    }
    if (isdefined(poi)) {
        if (isdefined(level.var_93d766d265995ec6[poi])) {
            var_b8d53bb8326b1bbb = level.var_93d766d265995ec6[poi];
        } else {
            var_b8d53bb8326b1bbb = poi;
        }
        switch (var_b8d53bb8326b1bbb) {
        case #"hash_ba41f5c24ec17e19":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_49a924e7bcee6519"));
            break;
        case #"hash_ba41f2c24ec17960":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_49a921e7bcee6000"));
            break;
        case #"hash_ba41f3c24ec17af3":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_49a922e7bcee61b3"));
            break;
        case #"hash_ba41f8c24ec182d2":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_49a927e7bcee6a32"));
            break;
        case #"hash_ba41f9c24ec18465":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_49a928e7bcee6be5"));
            break;
        case #"hash_ba41f6c24ec17fac":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_49a925e7bcee66cc"));
            break;
        case #"hash_ba41f7c24ec1813f":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_49a926e7bcee687f"));
            break;
        case #"hash_15cac143ca27b652":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_67df5469f1d7ca92"));
            break;
        case #"hash_bca86ea7c2b31316":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"delta_zoo"));
            break;
        case #"hash_e1decce80236cc9c":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"biobunker_radiation"));
            break;
        case #"hash_82f3ea371858dcb6":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_c9755af2f26af356"));
            break;
        case #"hash_56a519e2698f4c00":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_cfb48576228a3860"));
            break;
        case #"hash_195a417c219fffbd":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_636e6ce763a20fdd"));
            break;
        case #"hash_c143cfedc1927b39":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_4bc4bb88131e8699"));
            break;
        case #"hash_cdd6ca24ce96d8bd":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_2640ec84b0693edd"));
            break;
        case #"hash_59a0dd972742aeb9":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_eb18e172e159e319"));
            break;
        case #"hash_7fbb5f9f358faed0":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_154b12368f20d3d0"));
            break;
        case #"hash_d992c10dffeca81e":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_ba30c3078a84ef9e"));
            break;
        case #"hash_ef4466fc27e2335b":
        case #"hash_70e8ff17062df539":
        case #"hash_ca6f3ef251522f6e":
        case #"hash_d840fc340f4fb2a9":
        case #"hash_4405af9f9355826f":
        case #"hash_9f0c1996da0a141d":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_702d936788ebb392"));
            break;
        case #"hash_9895bca361f5ee79":
        case #"hash_6345a03814056e63":
        case #"hash_4c0ccbf75bd12a9e":
        case #"hash_5f470fe723f4ac62":
        case #"hash_3a3e3fad3c7e0fd8":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_6c9971dc95f5ea2e"));
            break;
        case #"hash_40e5919a85ef9bc0":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_4a491dc568ffb351"));
            break;
        case #"hash_b23f3c4bcab3389f":
        case #"hash_e9f055c957f58c7b":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_dac79abf66b30786"));
            break;
        case #"hash_48248177a355e6d0":
        case #"hash_29b5b1340ca62859":
        case #"hash_cf710b2d0741957":
        case #"hash_d56f56b926ffa5a8":
        case #"hash_67f0b15012940b27":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_cf02ca46b264404b"));
            break;
        case #"hash_473f3b59733c607":
        case #"hash_cbc8b9454f10b472":
        case #"hash_56ce07d688a8cc35":
        case #"hash_86be6f0df24e7175":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_3153e18b02a7b2fe"));
            break;
        case #"hash_ad290bc3879a61a5":
        case #"hash_7f9fd6541d224e4f":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_cc47ef5350239996"));
            break;
        case #"hash_6742dc8335627d03":
        case #"hash_d21569d9eedad28b":
        case #"hash_e49fb665377a1c78":
        case #"hash_f1f4f066db011804":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_5e5c0da166eb1c7c"));
            break;
        case #"hash_58caefecc905d836":
        case #"hash_540ae336fcf22f3c":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_d796dffa9020677"));
            break;
        case #"hash_7589f405905760b3":
        case #"hash_3b58e913535cb270":
        case #"hash_c729f1b3c5ef3ba8":
        case #"hash_8a71d33feb6bee7e":
        case #"hash_76200439abcbd7af":
        case #"hash_edfe2d2de8981b7e":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_3e2b15e9829ad6ad"));
            break;
        case #"hash_d19eb1aec32470c4":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_6e6cd64e3490034c"));
            break;
        case #"hash_1ed8b86f1253b1fc":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_2244f829f0e6ae94"));
            break;
        case #"hash_ba9cee5d40a7497a":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_4ab90ab25ca1ed92"));
            break;
        case #"hash_82db018a89c6de96":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_688f3f5fa37effe"));
            break;
        case #"hash_e1010cf5f9ff611e":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_81b484874993bc6"));
            break;
        case #"hash_2dda946f40437647":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_7f91b27c1cb28baf"));
            break;
        case #"hash_7339d9dfecd6190e":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_10b5c24cd8264496"));
            break;
        case #"hash_2d220dd03338f263":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_b2964fcc2da9f2cb"));
            break;
        case #"hash_fd9536afdcfc38a4":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_3a93b1226ffdc3dc"));
            break;
        case #"hash_bf0e37b587735c83":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_478b09adb6177c5b"));
            break;
        case #"hash_a7bad6b83859d887":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_8661390318e942ef"));
            break;
        default:
            break;
        }
    }
    if (isdefined(sublocation)) {
        switch (sublocation) {
        case #"hash_70402ffb70386a5c":
            location = function_6d40f12a09494350(location, ae_utility::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"saba_sandstorm"));
            break;
        }
    }
    return location;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd6c
// Size: 0xaf
function function_3ea2b9fa713d6ed3(player) {
    loadout_perks = findloadoutperks(player);
    var_e4f4a057080c0ed5 = function_d6973792fd45b035();
    var_7fb63b7fac6d1698 = 0;
    foreach (perk in loadout_perks) {
        if (isdefined(var_e4f4a057080c0ed5[perk])) {
            var_7fb63b7fac6d1698 = function_6d40f12a09494350(var_7fb63b7fac6d1698, var_e4f4a057080c0ed5[perk]);
        }
        /#
            assertex(isdefined(var_e4f4a057080c0ed5[perk]), "Player's equipped perk " + perk + " is not defined in loadout_perk_bits, please add it");
        #/
    }
    return var_7fb63b7fac6d1698;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe23
// Size: 0x1dc
function function_b050ed1983293d8(player, eventtypebit, perkref, value) {
    if (!player challengesenabledforplayer()) {
        return;
    }
    gamemode = getchallengegamemode(player);
    gametype = function_17c5d7feb226e256();
    if (isdefined(value) && value < 0) {
        value = 1;
    }
    perkid = 0;
    if (isdefined(perkref)) {
        perkid = loot::getlootidfromref(perkref);
    }
    bitfield = 0;
    bitfield = function_6d40f12a09494350(bitfield, eventtypebit);
    location = 0;
    location2 = 0;
    if (isdefined(player.closestpoi)) {
        location = getlocation(function_5b2c23ea4889f30b(player.closestpoi));
        location2 = function_55be16fb0f5f4a19(function_5b2c23ea4889f30b(player.closestpoi));
    }
    aeeventname = #"perk";
    function_8e81148472fb520a(player, aeeventname, [ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype, ae_utility::function_d6f771aedba70ce7(aeeventname, #"value"), value, ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_92939ab8dccb3d82"), location, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_dc0d981f2d59d210"), location2, ae_utility::function_d6f771aedba70ce7(aeeventname, #"loot_id"), perkid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_83a2d67994d7e295"), bitfield]);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xc006
// Size: 0xb0
function function_2aff99309a417c21(eventparamsstruct, aeeventname, aekeyname, value) {
    keyid = ae_utility::function_d6f771aedba70ce7(aeeventname, aekeyname);
    /#
        assertex(isdefined(keyid), "Undefined keyID for kill event param " + function_3c8848a3a11b2553(aekeyname) + " will break the eventParams array");
    #/
    /#
        assertex(isdefined(value), "Undefined value for kill event param " + function_3c8848a3a11b2553(aekeyname) + " will break the eventParams array");
    #/
    if (isdefined(keyid) && isdefined(value)) {
        eventparamsstruct.eventparams[eventparamsstruct.eventparams.size] = keyid;
        eventparamsstruct.eventparams[eventparamsstruct.eventparams.size] = value;
    }
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc0bd
// Size: 0x115
function function_137b512700167b00(attacker, victim) {
    victimstruct = spawnstruct();
    victimstruct.var_e4738651e7e13c78 = function_9da07c7f4a49e349(victim);
    var_c00a30624996364f = findenemytype(victim);
    victimstruct.var_7b718ef6c64f049f = var_c00a30624996364f[1];
    victimstruct.enemytype = var_c00a30624996364f[0];
    victimstruct.var_14edc6d1db3695bc = isdefined(victim.var_d37b75616f7c2ee) && victim.var_d37b75616f7c2ee.var_14edc6d1db3695bc;
    victimstruct.v_distance = int(distance(attacker.origin, victim.origin));
    victimstruct.origin = victim.origin;
    victimstruct.team = victim.team;
    victimstruct.on_zipline = victim isonzipline();
    victimstruct.var_379d31f8d73d8b2f = 1;
    return victimstruct;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc1da
// Size: 0x138c
function reportKillChallengeEvent(attacker, victimstruct, modifiers1, modifiers2, modifiers3, objweapon, damage, meansofdeath, attachmentflags, hitloc, var_1d68c79557cc54ea) {
    if (!isdefined(attacker)) {
        /#
            assertmsg("Challenges.gsc - reportKillChallengeEvent was passed an undefined attacker entity");
        #/
        return;
    }
    var_6ddcf3c092eaf383 = level.var_ec851999e0e99879;
    if (!isdefined(var_6ddcf3c092eaf383)) {
        var_6ddcf3c092eaf383 = function_6b7aeb2012efc4af();
    }
    modifiers1 = default_to(modifiers1, 0);
    modifiers2 = default_to(modifiers2, 0);
    modifiers3 = default_to(modifiers3, 0);
    attachmentflags = default_to(attachmentflags, 0);
    hitloc = default_to(hitloc, 0);
    gametype = var_6ddcf3c092eaf383.gametype;
    gamemode = var_6ddcf3c092eaf383.gamemode;
    enemytype = victimstruct.enemytype;
    var_7b718ef6c64f049f = victimstruct.var_7b718ef6c64f049f;
    var_e4738651e7e13c78 = victimstruct.var_e4738651e7e13c78;
    if (!isdefined(attacker.criticalstreak)) {
        attacker.criticalstreak = 0;
    }
    if (istrue(victimstruct.var_14edc6d1db3695bc)) {
        attacker.criticalstreak++;
    } else {
        attacker.criticalstreak = 0;
    }
    criticalstreak = isdefined(attacker.criticalstreak) ? attacker.criticalstreak : 0;
    if (!isdefined(attacker.var_a0595326ca4cf35d)) {
        attacker.var_a0595326ca4cf35d = 0;
    }
    attacker.var_a0595326ca4cf35d++;
    var_a0595326ca4cf35d = attacker.var_a0595326ca4cf35d;
    v_distance = victimstruct.v_distance;
    victim = undefined;
    killing_event = spawnstruct();
    throttle::function_f632348cbb773537(level.var_1850e46a71d6e72d, killing_event);
    var_349e390338192305 = findgunsmithattachments(objweapon);
    var_7fb63b7fac6d1698 = function_3ea2b9fa713d6ed3(attacker);
    var_b5eec3b49cf346d2 = [damage, 0];
    var_a5958dc7369199c7 = "none";
    if (isdefined(attacker.super) && isdefined(attacker.super.staticdata) && isdefined(attacker.super.staticdata.ref) && attacker.super.isactive) {
        var_a5958dc7369199c7 = attacker.super.staticdata.ref;
    }
    var_c0d251f100091822 = loot::getlootidfromref(var_a5958dc7369199c7);
    operatorlootid = attacker function_aff35122a61a900b(attacker.team);
    if (!isdefined(operatorlootid)) {
        operatorlootid = 0;
    }
    weaponlootid = weapon::function_89a83ae9a4c4142a(objweapon);
    if (!isdefined(weaponlootid)) {
        weaponlootid = 0;
    }
    var_9eeb614f9aee06b3 = 0;
    weaponcamo = 0;
    if (isdefined(objweapon) && isdefined(objweapon.camo)) {
        var_a79c87a31042789a = objweapon.camo;
        if (utility::issharedfuncdefined("zombie", "get_pap_level")) {
            var_29a8ba8c9dd43fd2 = attacker utility::function_f3bb4f4911a1beb2("zombie", "get_pap_level", objweapon);
            var_3a56a10345d2e89a = objweapon.var_9d7facbe889e667c;
            if (isarray(attacker.var_c37e65eb7cc773eb) && isdefined(var_3a56a10345d2e89a) && isdefined(var_29a8ba8c9dd43fd2) && var_29a8ba8c9dd43fd2 != 0) {
                overridecamo = attacker.var_c37e65eb7cc773eb[var_3a56a10345d2e89a];
                if (isdefined(overridecamo)) {
                    var_a79c87a31042789a = overridecamo;
                }
            }
        }
        if (issubstr(var_a79c87a31042789a, "_comp_01")) {
            if (issubstr(var_a79c87a31042789a, "_ob_")) {
                weaponcamo = ae_utility::function_b40278e5e468c6c1(#"hash_e378877c59549e7d", #"hash_1425cef80244bd8a");
            } else {
                weaponcamo = ae_utility::function_b40278e5e468c6c1(#"hash_e378877c59549e7d", #"hash_65dcc57b79ab8156");
            }
        } else if (issubstr(var_a79c87a31042789a, "_comp_02")) {
            if (issubstr(var_a79c87a31042789a, "_ob_")) {
                weaponcamo = ae_utility::function_b40278e5e468c6c1(#"hash_e378877c59549e7d", #"hash_90d460c1776ac629");
            } else {
                weaponcamo = ae_utility::function_b40278e5e468c6c1(#"hash_e378877c59549e7d", #"hash_48176e29e2d06ab3");
            }
        } else if (issubstr(var_a79c87a31042789a, "_comp_03")) {
            if (issubstr(var_a79c87a31042789a, "_ob_")) {
                weaponcamo = ae_utility::function_b40278e5e468c6c1(#"hash_e378877c59549e7d", #"hash_47b3cb5f609633a5");
            } else {
                weaponcamo = ae_utility::function_b40278e5e468c6c1(#"hash_e378877c59549e7d", #"hash_f91aeaf4d59447e7");
            }
        } else if (issubstr(var_a79c87a31042789a, "_comp_04")) {
            if (issubstr(var_a79c87a31042789a, "_ob_")) {
                weaponcamo = ae_utility::function_b40278e5e468c6c1(#"hash_e378877c59549e7d", #"hash_14352924a5376243");
            } else {
                weaponcamo = ae_utility::function_b40278e5e468c6c1(#"hash_e378877c59549e7d", #"hash_6245cc85524cc965");
            }
        }
    }
    weaponclassarray = getweaponclassarray();
    var_b28608820870666 = 0;
    var_b28608820870666 = function_ce112254f7cba89e(objweapon);
    iskillstreak = weapon::iskillstreakweapon(objweapon) || istrue(attacker.isjuggernaut);
    isvehicle = utility::issharedfuncdefined("vehicle", "isVehicleWeapon") && [[ utility::getsharedfunc("vehicle", "isVehicleWeapon") ]](objweapon);
    isequipment = 0;
    equipmentid = 0;
    if (weaponlootid == 0) {
        equipmentweaponname = function_f09e914e200d1a42(objweapon);
        equipmentstruct = level.equipment.table[equipmentweaponname];
        if (isdefined(equipmentstruct)) {
            weaponlootid = loot::getlootidfromref(equipmentstruct.ref);
            isequipment = 1;
        }
    }
    if (isequipment) {
        if (!isdefined(var_b28608820870666)) {
            var_b28608820870666 = 0;
        }
        if (isdefined(attacker) && isdefined(objweapon) && isdefined(weaponclassarray[weaponclass(objweapon)])) {
            var_b28608820870666 = function_6d40f12a09494350(var_b28608820870666, weaponclassarray[weaponclass(objweapon)]);
        }
    }
    location = 0;
    location2 = 0;
    if (isdefined(attacker.closestpoi)) {
        location = getlocation(function_5b2c23ea4889f30b(attacker.closestpoi), attacker.sublocation);
        location2 = function_55be16fb0f5f4a19(function_5b2c23ea4889f30b(attacker.closestpoi), attacker.sublocation);
    }
    if (iskillstreak) {
        if (!isdefined(var_b28608820870666)) {
            var_b28608820870666 = 0;
        }
        var_b28608820870666 = function_6d40f12a09494350(var_b28608820870666, weaponclassarray["killstreak"]);
        if (isdefined(level.killstreakweaponmap)) {
            killstreakweaponname = level.killstreakweaponmap[objweapon.basename];
            if (isdefined(killstreakweaponname)) {
                weaponlootid = loot::getlootidfromref(killstreakweaponname);
            }
        }
    }
    var_bb38571cca0414f = function_c1945f26d99b0ed9(attacker);
    var_3fff36caeace1b84 = function_5d99311b5a7dffda();
    if (isdefined(level.var_c596a10a13c5cd7c)) {
        var_3fff36caeace1b84 = [[ level.var_c596a10a13c5cd7c ]](var_3fff36caeace1b84, victim);
    }
    in_prematch = istrue(level.inprematch);
    teamsize = var_6ddcf3c092eaf383.teamsize;
    if (issharedfuncdefined("pmc_missions", "onEnemyKilled")) {
        attacker thread [[ getsharedfunc("pmc_missions", "onEnemyKilled") ]](attacker, victim, objweapon, modifiers1);
    }
    if (!isdefined(attacker.var_c78bf6b063fc5789)) {
        attacker.var_c78bf6b063fc5789 = 0;
    }
    attacker.var_c78bf6b063fc5789 = attacker.var_c78bf6b063fc5789 + 1;
    var_4a7a1118f15a4c9 = attacker.var_c78bf6b063fc5789;
    if (!isdefined(attacker.var_79a1a1fe9f3bf357)) {
        attacker.var_79a1a1fe9f3bf357 = 0;
    }
    if (objweapon == attacker getcurrentweapon()) {
        attacker.var_79a1a1fe9f3bf357 = attacker.var_79a1a1fe9f3bf357 + 1;
    }
    var_79a1a1fe9f3bf357 = attacker.var_79a1a1fe9f3bf357;
    victim_on_zipline = victimstruct.on_zipline;
    aeeventname = #"kill";
    aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
    playlistid = getplaylistid();
    if (!isdefined(level.var_a3dfc554743efd89)) {
        level.var_a3dfc554743efd89 = [];
    }
    if (!isdefined(level.var_a7f8fb431b350d82)) {
        level.var_a7f8fb431b350d82 = [];
    }
    if (!istrue(level.var_a7f8fb431b350d82[#"reportKillChallengeEvent"])) {
        level.var_a3dfc554743efd89[#"gamemode"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode");
        level.var_a3dfc554743efd89[#"hash_834ae5ef756e04aa"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_834ae5ef756e04aa");
        level.var_a3dfc554743efd89[#"weapon_loot_id"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"weapon_loot_id");
        level.var_a3dfc554743efd89[#"gametype"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype");
        level.var_a3dfc554743efd89[#"version"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"version");
        level.var_a3dfc554743efd89[#"hash_af7cd8c514ea5582"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_af7cd8c514ea5582");
        level.var_a3dfc554743efd89[#"hash_af7cd7c514ea53cf"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_af7cd7c514ea53cf");
        level.var_a3dfc554743efd89[#"hash_af7cd6c514ea521c"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_af7cd6c514ea521c");
        level.var_a3dfc554743efd89[#"hash_af7cd5c514ea5069"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_af7cd5c514ea5069");
        level.var_a3dfc554743efd89[#"hash_af7cd4c514ea4eb6"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_af7cd4c514ea4eb6");
        level.var_a3dfc554743efd89[#"hash_af7cd3c514ea4d03"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_af7cd3c514ea4d03");
        level.var_a3dfc554743efd89[#"hash_af7cd2c514ea4b50"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_af7cd2c514ea4b50");
        level.var_a3dfc554743efd89[#"hash_af7ce1c514ea64cd"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_af7ce1c514ea64cd");
        level.var_a3dfc554743efd89[#"hash_af7ce0c514ea631a"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_af7ce0c514ea631a");
        level.var_a3dfc554743efd89[#"hash_1b7a08e28a2f9d76"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_1b7a08e28a2f9d76");
        level.var_a3dfc554743efd89[#"hash_a0dd9c7405f2d85e"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_a0dd9c7405f2d85e");
        level.var_a3dfc554743efd89[#"hash_7f94e81c1787ff7a"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_7f94e81c1787ff7a");
        level.var_a3dfc554743efd89[#"hash_7f94e71c1787fdc7"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_7f94e71c1787fdc7");
        level.var_a3dfc554743efd89[#"hash_7f94e61c1787fc14"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_7f94e61c1787fc14");
        level.var_a3dfc554743efd89[#"hash_e2f5c601b57b3960"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_e2f5c601b57b3960");
        level.var_a3dfc554743efd89[#"hash_92939ab8dccb3d82"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_92939ab8dccb3d82");
        level.var_a3dfc554743efd89[#"hash_dc0d981f2d59d210"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_dc0d981f2d59d210");
        level.var_a3dfc554743efd89[#"hash_bd518e95df4103fe"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_bd518e95df4103fe");
        level.var_a3dfc554743efd89[#"loot_id"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"loot_id");
        level.var_a3dfc554743efd89[#"distance"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"distance");
        level.var_a3dfc554743efd89[#"hash_1ce058287dc8c73b"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_1ce058287dc8c73b");
        level.var_a3dfc554743efd89[#"weapon_camo"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"weapon_camo");
        level.var_a3dfc554743efd89[#"hit_loc"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"hit_loc");
        level.var_a3dfc554743efd89[#"team_size"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"team_size");
        level.var_a3dfc554743efd89[#"hash_ab2e7c9b727a3d6c"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_ab2e7c9b727a3d6c");
        level.var_a3dfc554743efd89[#"hash_365c4ef34bc9c239"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_365c4ef34bc9c239");
        level.var_a3dfc554743efd89[#"hash_2f109e5ad9e45eff"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_2f109e5ad9e45eff");
        level.var_a3dfc554743efd89[#"hash_7e912c64fa5c6cde"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_7e912c64fa5c6cde");
        level.var_a3dfc554743efd89[#"hash_16db99d7417ef29d"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_16db99d7417ef29d");
        level.var_a3dfc554743efd89[#"hash_22d8c6e760626656"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_22d8c6e760626656");
        level.var_a3dfc554743efd89[#"playlist_id"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"playlist_id");
        level.var_a3dfc554743efd89[#"victim_on_zipline"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"victim_on_zipline");
        level.var_a3dfc554743efd89[#"hash_648b2ad7f16589f0"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_648b2ad7f16589f0");
        level.var_a3dfc554743efd89[#"hash_3e038eef2f8914a6"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_3e038eef2f8914a6");
        level.var_a3dfc554743efd89[#"hash_4a2a8345ce12358"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_4a2a8345ce12358");
        level.var_a3dfc554743efd89[#"hash_37ac48cb5a8cddea"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_37ac48cb5a8cddea");
        level.var_a7f8fb431b350d82[#"reportKillChallengeEvent"] = 1;
    }
    paramcache = level.var_a3dfc554743efd89;
    eventparams = [paramcache[#"gamemode"], gamemode, paramcache[#"hash_834ae5ef756e04aa"], operatorlootid, paramcache[#"weapon_loot_id"], weaponlootid, paramcache[#"gametype"], gametype, paramcache[#"version"], 1, paramcache[#"hash_af7cd8c514ea5582"], var_349e390338192305[0], paramcache[#"hash_af7cd7c514ea53cf"], var_349e390338192305[1], paramcache[#"hash_af7cd6c514ea521c"], var_349e390338192305[2], paramcache[#"hash_af7cd5c514ea5069"], var_349e390338192305[3], paramcache[#"hash_af7cd4c514ea4eb6"], var_349e390338192305[4], paramcache[#"hash_af7cd3c514ea4d03"], var_349e390338192305[5], paramcache[#"hash_af7cd2c514ea4b50"], var_349e390338192305[6], paramcache[#"hash_af7ce1c514ea64cd"], var_349e390338192305[7], paramcache[#"hash_af7ce0c514ea631a"], var_349e390338192305[8], paramcache[#"hash_1b7a08e28a2f9d76"], var_349e390338192305[9], paramcache[#"hash_a0dd9c7405f2d85e"], var_b28608820870666, paramcache[#"hash_7f94e81c1787ff7a"], modifiers1, paramcache[#"hash_7f94e71c1787fdc7"], modifiers2, paramcache[#"hash_e2f5c601b57b3960"], enemytype, paramcache[#"hash_92939ab8dccb3d82"], location, paramcache[#"hash_dc0d981f2d59d210"], location2, paramcache[#"hash_bd518e95df4103fe"], var_7fb63b7fac6d1698, paramcache[#"loot_id"], var_c0d251f100091822, paramcache[#"distance"], v_distance, paramcache[#"hash_1ce058287dc8c73b"], attachmentflags, paramcache[#"weapon_camo"], weaponcamo, paramcache[#"hit_loc"], hitloc, paramcache[#"team_size"], teamsize, paramcache[#"hash_ab2e7c9b727a3d6c"], var_3fff36caeace1b84, paramcache[#"hash_365c4ef34bc9c239"], var_4a7a1118f15a4c9, paramcache[#"hash_2f109e5ad9e45eff"], criticalstreak, paramcache[#"hash_7e912c64fa5c6cde"], var_79a1a1fe9f3bf357, paramcache[#"hash_16db99d7417ef29d"], var_a0595326ca4cf35d, paramcache[#"hash_22d8c6e760626656"], var_7b718ef6c64f049f, paramcache[#"hash_7f94e61c1787fc14"], modifiers3, paramcache[#"playlist_id"], playlistid, paramcache[#"victim_on_zipline"], victim_on_zipline];
    if (isdefined(var_1d68c79557cc54ea)) {
        if (isdefined(var_1d68c79557cc54ea[0])) {
            eventparams[eventparams.size] = paramcache[#"hash_648b2ad7f16589f0"];
            eventparams[eventparams.size] = var_1d68c79557cc54ea[0];
        }
        if (isdefined(var_1d68c79557cc54ea[1])) {
            eventparams[eventparams.size] = paramcache[#"hash_3e038eef2f8914a6"];
            eventparams[eventparams.size] = var_1d68c79557cc54ea[1];
        }
        if (isdefined(var_1d68c79557cc54ea[2])) {
            eventparams[eventparams.size] = paramcache[#"hash_4a2a8345ce12358"];
            eventparams[eventparams.size] = var_1d68c79557cc54ea[2];
        }
    }
    if (var_e4738651e7e13c78 > 0) {
        eventparams[eventparams.size] = paramcache[#"hash_37ac48cb5a8cddea"];
        eventparams[eventparams.size] = var_e4738651e7e13c78;
    }
    attacker reportChallengeUserSerializedEventWrapper(aeeventid, eventparams);
    eventparamssquad = [];
    if (isdefined(var_1d68c79557cc54ea)) {
        if (isdefined(var_1d68c79557cc54ea[0])) {
            eventparamssquad[eventparamssquad.size] = paramcache[#"hash_648b2ad7f16589f0"];
            eventparamssquad[eventparamssquad.size] = var_1d68c79557cc54ea[0];
        }
        if (isdefined(var_1d68c79557cc54ea[1])) {
            eventparamssquad[eventparamssquad.size] = paramcache[#"hash_3e038eef2f8914a6"];
            eventparamssquad[eventparamssquad.size] = var_1d68c79557cc54ea[1];
        }
        if (isdefined(var_1d68c79557cc54ea[2])) {
            eventparamssquad[eventparamssquad.size] = paramcache[#"hash_4a2a8345ce12358"];
            eventparamssquad[eventparamssquad.size] = var_1d68c79557cc54ea[2];
        }
    }
    if (isdefined(victimstruct) && istrue(victimstruct.var_379d31f8d73d8b2f)) {
        function_fee0bee456eac877(attacker, aeeventname, eventparamssquad, victimstruct);
    }
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd56d
// Size: 0x1b7
function function_e6ba0866eca5b87b(attacker, iskillstreak) {
    if (!isdefined(attacker)) {
        /#
            assertmsg("Challenges.gsc - reportKillChallengeEvent was passed an undefined attacker entity");
        #/
        return;
    }
    var_9b8336914d1339a9 = attacker.currentmultikill;
    if (!isdefined(var_9b8336914d1339a9) || !isdefined(iskillstreak)) {
        return;
    }
    gamemode = getchallengegamemode(attacker);
    gametype = function_17c5d7feb226e256();
    aeeventname = #"multikill";
    aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
    objweapon = attacker getcurrentweapon();
    if (isdefined(objweapon)) {
        weaponlootid = weapon::function_89a83ae9a4c4142a(objweapon);
        if (!isdefined(weaponlootid)) {
            weaponlootid = 0;
        }
        if (weaponlootid == 0) {
            equipmentweaponname = function_f09e914e200d1a42(objweapon);
            equipmentstruct = level.equipment.table[equipmentweaponname];
            if (isdefined(equipmentstruct)) {
                weaponlootid = loot::getlootidfromref(equipmentstruct.ref);
            }
        }
    }
    params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_d404f427903135e"), var_9b8336914d1339a9, ae_utility::function_d6f771aedba70ce7(aeeventname, #"weapon_loot_id"), weaponlootid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"is_killstreak"), iskillstreak];
    attacker reportChallengeUserSerializedEventWrapper(aeeventid, params);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd72b
// Size: 0x30a
function function_c43d8b7a5461cdce(lootid) {
    var_25978461c6e4f61b = loot::getScriptableFromLootID(lootid);
    itemtype = undefined;
    if (!isdefined(var_25978461c6e4f61b)) {
        itemtype = loot::function_282cf83c9eeda744(lootid);
        if (!isdefined(itemtype)) {
            return undefined;
        }
    } else {
        itemtype = level.br_pickups.br_itemtype[var_25978461c6e4f61b];
    }
    switch (itemtype) {
    case #"ammo":
        return ae_utility::function_b40278e5e468c6c1(#"itemtypes", #"hash_390ee15442e26b5a");
    case #"gear":
        return ae_utility::function_b40278e5e468c6c1(#"itemtypes", #"hash_586b8242aa331357");
    case #"health":
        return ae_utility::function_b40278e5e468c6c1(#"itemtypes", #"hash_5eb3ab4da847b262");
    case #"revive":
        return ae_utility::function_b40278e5e468c6c1(#"itemtypes", #"hash_6c8b69bd795806f5");
    case #"lethal":
        return ae_utility::function_b40278e5e468c6c1(#"itemtypes", #"hash_60a1e08b6f7a43fe");
    case #"tactical":
        return ae_utility::function_b40278e5e468c6c1(#"itemtypes", #"hash_66450f4f8837c2d9");
    case #"killstreak":
        return ae_utility::function_b40278e5e468c6c1(#"itemtypes", #"hash_98c2539a8ef0aef6");
    case #"super":
        return ae_utility::function_b40278e5e468c6c1(#"itemtypes", #"hash_722533776029e257");
    case #"weapon":
        return ae_utility::function_b40278e5e468c6c1(#"itemtypes", #"hash_f10ff7a627660838");
    case #"plunder":
        return ae_utility::function_b40278e5e468c6c1(#"itemtypes", #"hash_36993f9c4257b726");
    case #"attachment":
        return ae_utility::function_b40278e5e468c6c1(#"itemtypes", #"hash_729a9e5d9c8e2de1");
    case #"plate_carrier":
        return ae_utility::function_b40278e5e468c6c1(#"itemtypes", #"hash_aab4443965fdeddf");
    case #"keycard":
        return ae_utility::function_b40278e5e468c6c1(#"itemtypes", #"hash_27c621c0e4e32925");
    case #"key":
        return ae_utility::function_b40278e5e468c6c1(#"itemtypes", #"hash_59f198f5cae765f3");
    case #"valuable":
        return ae_utility::function_b40278e5e468c6c1(#"itemtypes", #"hash_10f39a5c7ed87e9e");
    case #"personal":
        return ae_utility::function_b40278e5e468c6c1(#"itemtypes", #"hash_796e898cedfe7de4");
    case #"dogtag":
        return ae_utility::function_b40278e5e468c6c1(#"itemtypes", #"hash_896fd6caf251de1e");
    case #"weaponcase":
        return ae_utility::function_b40278e5e468c6c1(#"itemtypes", #"hash_6f88af36718a54b1");
    default:
        return undefined;
    }
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda3c
// Size: 0x24a
function function_cfeb523fd3aa9ecf(player, lootid, type, method, quantity, var_f237807396377232) {
    if (!player challengesenabledforplayer()) {
        return 0;
    }
    if (!isdefined(quantity)) {
        quantity = 1;
    }
    gamemode = scripts/cp_mp/challenges::getchallengegamemode(player);
    gametype = scripts/cp_mp/challenges::function_17c5d7feb226e256();
    aeeventname = #"use_item";
    typeid = 0;
    if (isdefined(type)) {
        typeid = ae_utility::function_7042dad035dc176c(type);
    }
    itemrarity = 0;
    if (isdefined(var_f237807396377232)) {
        itemrarity = var_f237807396377232.rarity;
    }
    if (!isdefined(method)) {
        method = 0;
        method = scripts/cp_mp/challenges::function_6d40f12a09494350(method, ae_utility::function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
    }
    operatorlootid = player function_aff35122a61a900b(player.team);
    gametype = function_68ffb11dc4c6b979(gametype, aeeventname);
    gamemode = function_68ffb11dc4c6b979(gamemode, aeeventname);
    quantity = function_68ffb11dc4c6b979(quantity, aeeventname);
    operatorlootid = function_68ffb11dc4c6b979(operatorlootid, aeeventname);
    lootid = function_68ffb11dc4c6b979(lootid, aeeventname);
    itemrarity = function_68ffb11dc4c6b979(itemrarity, aeeventname);
    typeid = function_68ffb11dc4c6b979(typeid, aeeventname);
    method = function_68ffb11dc4c6b979(method, aeeventname);
    function_8e81148472fb520a(player, aeeventname, [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"value"), quantity, ae_utility::function_d6f771aedba70ce7(aeeventname, #"loot_id"), lootid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype, ae_utility::function_d6f771aedba70ce7(aeeventname, #"string_ref"), typeid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_83a2d67994d7e295"), method, ae_utility::function_d6f771aedba70ce7(aeeventname, #"operator_id"), operatorlootid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"zm_rarity"), itemrarity]);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc8d
// Size: 0x36e
function function_d24138b32084fc3e(player, lootid, type, method, quantity, source, poi) {
    if (!player challengesenabledforplayer()) {
        return 0;
    }
    gamemode = getchallengegamemode(player);
    gametype = function_17c5d7feb226e256();
    typeid = undefined;
    if (isdefined(type)) {
        typeid = ae_utility::function_7042dad035dc176c(type);
    }
    loottype = undefined;
    if (isdefined(lootid)) {
        loottype = function_c43d8b7a5461cdce(lootid);
    }
    location = 0;
    location2 = 0;
    location = getlocation(utility::ter_op(isdefined(poi), poi, function_5b2c23ea4889f30b(player.closestpoi)));
    location2 = function_55be16fb0f5f4a19(utility::ter_op(isdefined(poi), poi, function_5b2c23ea4889f30b(player.closestpoi)));
    quantity = function_dc52e14b64052dda(lootid, quantity);
    if (isdefined(typeid) && typeid < 0) {
        logstring("IW9-592971: reportLootItemEvent::typeID is negative");
    }
    if (isdefined(quantity) && quantity < 0) {
        logstring("IW9-592971: reportLootItemEvent::quantity is negative");
    }
    if (isdefined(gamemode) && gamemode < 0) {
        logstring("IW9-592971: reportLootItemEvent::gameMode is negative");
    }
    if (isdefined(gametype) && gametype < 0) {
        logstring("IW9-592971: reportLootItemEvent::gameType is negative");
    }
    if (isdefined(location) && isint(location) && location < 0) {
        logstring("IW9-592971: reportLootItemEvent::location is negative");
    }
    if (isdefined(lootid) && lootid < 0) {
        logstring("IW9-592971: reportLootItemEvent::lootID is negative");
    }
    if (isdefined(method) && isint(method) && method < 0) {
        logstring("IW9-592971: reportLootItemEvent::method is negative");
    }
    if (isdefined(loottype) && loottype < 0) {
        logstring("IW9-592971: reportLootItemEvent::lootType is negative");
    }
    if (isdefined(source) && isint(source) && source < 0) {
        logstring("IW9-592971: reportLootItemEvent::source is negative");
    }
    aeeventname = #"loot_item";
    function_8e81148472fb520a(player, aeeventname, [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"string_ref"), typeid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"value"), quantity, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_92939ab8dccb3d82"), location, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_dc0d981f2d59d210"), location2, ae_utility::function_d6f771aedba70ce7(aeeventname, #"loot_id"), lootid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_2af1f13aa6ae3b5f"), method, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_d7806c74c1d4a500"), loottype, ae_utility::function_d6f771aedba70ce7(aeeventname, #"loot_source"), source]);
    /#
        println("<unknown string>");
    #/
    if (isdefined(level.var_97ea4daf8989e0c6)) {
        return [[ level.var_97ea4daf8989e0c6 ]](player, lootid, loottype);
    }
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe002
// Size: 0x4aa
function private reportstat(statname, amount) {
    if (!challengesenabledforplayer()) {
        return;
    }
    if (amount <= 0) {
        return;
    }
    var_e3fbce1c8509474f = hashcat(@"hash_af7cfd1e80e4fb55", statname);
    var_a75e138cb4bcfef8 = getdvarint(var_e3fbce1c8509474f, 0);
    if (var_a75e138cb4bcfef8 > 0) {
        return;
    }
    reportstats = 0;
    damage_amount = 0;
    var_cfb8ab0eb8945dbe = 0;
    time_driving = 0;
    var_6eae97b1c039638c = 0;
    var_8dbdb5edd5a730f9 = 0;
    switch (statname) {
    case #"hash_1cc8a923a608c2a0":
        damage_amount = amount;
        reportstats = 1;
        break;
    case #"hash_2c58990905f03e75":
        var_cfb8ab0eb8945dbe = amount;
        reportstats = 1;
        break;
    case #"hash_32e41af5a3ef1340":
        time_driving = amount;
        reportstats = 1;
        break;
    case #"hash_76c0ec96dd3ab432":
        var_6eae97b1c039638c = int(amount / 1000);
        reportstats = 1;
        break;
    case #"hash_8d8693c020b1c720":
        var_8dbdb5edd5a730f9 = amount;
        reportstats = 1;
        break;
    case #"hash_804c8279b22808c2":
        break;
    case #"hash_3440d3368c358eaf":
        break;
    case #"hash_f402bcef661bfd9b":
        break;
    case #"hash_5b0b9aa2fec5584d":
        break;
    case #"hash_e85acef6a699314d":
        break;
    case #"hash_f3cef86f1056f64a":
        break;
    case #"hash_80804c8d4d60b774":
        break;
    }
    if (reportstats) {
        var_6ddcf3c092eaf383 = level.var_ec851999e0e99879;
        if (!isdefined(var_6ddcf3c092eaf383)) {
            var_6ddcf3c092eaf383 = function_6b7aeb2012efc4af();
        }
        aeeventname = #"stats";
        if (!isdefined(level.var_d44156bac78184ca)) {
            level.var_d44156bac78184ca = [];
        }
        if (!isdefined(level.var_a7f8fb431b350d82)) {
            level.var_a7f8fb431b350d82 = [];
        }
        if (!istrue(level.var_a7f8fb431b350d82[#"reportstats"])) {
            level.var_d44156bac78184ca[#"version"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"version");
            level.var_d44156bac78184ca[#"gamemode"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode");
            level.var_d44156bac78184ca[#"gametype"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype");
            level.var_d44156bac78184ca[#"damage"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"damage");
            level.var_d44156bac78184ca[#"score"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"score");
            level.var_d44156bac78184ca[#"team_size"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"team_size");
            level.var_d44156bac78184ca[#"time_driving"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"time_driving");
            level.var_d44156bac78184ca[#"value"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"value");
            level.var_d44156bac78184ca[#"hash_6ee3cf6540c5bcac"] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_6ee3cf6540c5bcac");
        }
        paramcache = level.var_d44156bac78184ca;
        eventparams = [paramcache[#"version"], 1, paramcache[#"gamemode"], var_6ddcf3c092eaf383.gamemode, paramcache[#"gametype"], var_6ddcf3c092eaf383.gametype, paramcache[#"damage"], damage_amount, paramcache[#"score"], var_cfb8ab0eb8945dbe, paramcache[#"team_size"], var_6ddcf3c092eaf383.teamsize, paramcache[#"time_driving"], time_driving, paramcache[#"value"], var_6eae97b1c039638c, paramcache[#"hash_6ee3cf6540c5bcac"], var_8dbdb5edd5a730f9];
        if (!isdefined(level.var_6de4f66f58ecd7b1)) {
            level.var_6de4f66f58ecd7b1 = [];
        }
        aeeventid = level.var_6de4f66f58ecd7b1[aeeventname];
        if (!isdefined(aeeventid)) {
            aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
            level.var_6de4f66f58ecd7b1[aeeventname] = aeeventid;
        }
        /#
            function_7d97a2a745e514c4(aeeventid, eventparams);
        #/
        reportChallengeUserSerializedEventWrapper(aeeventid, eventparams);
    }
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe4b3
// Size: 0x76
function private function_6b7aeb2012efc4af() {
    gamemode = getchallengegamemode(self);
    gametype = function_17c5d7feb226e256();
    teamsize = 0;
    if (gamemode & 8) {
        teamsize = scripts/cp_mp/utility/game_utility::function_4fb37368ae3585bb();
    }
    basevalues = {teamsize:teamsize, gametype:gametype, gamemode:gamemode};
    level.var_ec851999e0e99879 = basevalues;
    return basevalues;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe531
// Size: 0x32
function function_8a0395089290faf6(player) {
    function_b050ed1983293d8(player, ae_utility::function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"hit"), "specialty_scavenger_plus", undefined);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe56a
// Size: 0x64
function function_563606223ef09517(player, amount) {
    method = function_6d40f12a09494350(0, ae_utility::function_e2ff8f4b4e94f723(#"hash_2af1f13aa6ae3b5f", #"loot"));
    function_d24138b32084fc3e(player, 8395, ae_utility::function_b40278e5e468c6c1(#"itemtypes", #"hash_36993f9c4257b726"), method, amount, 0);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe5d5
// Size: 0x144
function findgunsmithattachments(objweapon) {
    var_349e390338192305 = [];
    if (!utility::issharedfuncdefined("weapons", "isCACPrimaryOrSecondary") || [[ utility::getsharedfunc("weapons", "isCACPrimaryOrSecondary") ]](objweapon)) {
        if (isdefined(objweapon.attachments)) {
            var_49e6ef3edadd524e = weapon::getweaponrootname(objweapon);
            var_7208e21ea18240fb = 0;
            foreach (attachment in objweapon.attachments) {
                if (issubstr(attachment, "snprscope")) {
                    var_7208e21ea18240fb = 1;
                }
                if (utility::issharedfuncdefined("weapons", "attachmentIsSelectable")) {
                    if ([[ utility::getsharedfunc("weapons", "attachmentIsSelectable") ]](objweapon, attachment)) {
                        var_349e390338192305[var_349e390338192305.size] = weapon::function_693e108cb61ceeb5(var_49e6ef3edadd524e, attachment);
                    }
                }
            }
            if (var_7208e21ea18240fb) {
                var_349e390338192305[var_349e390338192305.size] = weapon::function_693e108cb61ceeb5(var_49e6ef3edadd524e, "default_sniper_scope");
            }
        }
    }
    for (attachindex = var_349e390338192305.size; attachindex < 10; attachindex++) {
        var_349e390338192305[attachindex] = 0;
    }
    return var_349e390338192305;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe721
// Size: 0x112
function findloadoutperks(attacker) {
    loadout_perks = [];
    if (isdefined(attacker.classstruct)) {
        if (isdefined(attacker.classstruct.loadoutperks)) {
            foreach (perk in attacker.classstruct.loadoutperks) {
                loadout_perks = utility::array_add(loadout_perks, perk);
            }
        }
        if (isdefined(attacker.classstruct.var_15f3e6df722fb1cf)) {
            loadout_perks = utility::array_add(loadout_perks, attacker.classstruct.var_15f3e6df722fb1cf);
        }
        if (isdefined(attacker.classstruct.var_15f3e5df722faf9c)) {
            loadout_perks = utility::array_add(loadout_perks, attacker.classstruct.var_15f3e5df722faf9c);
        }
    }
    return loadout_perks;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe83b
// Size: 0x1a7
function function_9da07c7f4a49e349(victim) {
    var_e4738651e7e13c78 = 0;
    if (!isdefined(victim.agent_type)) {
        return var_e4738651e7e13c78;
    }
    if (issubstr(victim.agent_type, "enemy_warlord_")) {
        if (issubstr(victim.agent_type, "_rushhour")) {
            return 1;
        } else if (issubstr(victim.agent_type, "_gunslinger")) {
            return 2;
        } else if (issubstr(victim.agent_type, "_shadow")) {
            return 3;
        } else if (issubstr(victim.agent_type, "_chemist")) {
            return 4;
        } else if (issubstr(victim.agent_type, "_hammernaut")) {
            return 5;
        } else if (issubstr(victim.agent_type, "_phalanx")) {
            return 6;
        } else if (issubstr(victim.agent_type, "_techmaestro")) {
            return 7;
        } else if (issubstr(victim.agent_type, "_rainmaker")) {
            return 8;
        } else if (issubstr(victim.agent_type, "_allforone")) {
            return 9;
        } else if (issubstr(victim.agent_type, "_md")) {
            return 10;
        } else if (issubstr(victim.agent_type, "_vera")) {
            return 11;
        } else if (issubstr(victim.agent_type, "_jugg")) {
            return 5;
        }
    }
    return var_e4738651e7e13c78;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe9ea
// Size: 0xa95
function findenemytype(victim) {
    enemytype = 0;
    var_7b718ef6c64f049f = 0;
    if (isplayer(victim)) {
        enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"player"));
    }
    isground = 0;
    var_ae8eb6d66c120397 = 0;
    issupport = 0;
    var_24f040a6728b6dc4 = 0;
    var_b93834c5c289dcdc = 0;
    if (isdefined(victim.streakinfo)) {
        enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"killstreak"));
        killstreakname = victim.streakinfo.streakname;
        var_b93834c5c289dcdc = iskillstreakvehicle(killstreakname);
        switch (killstreakname) {
        case #"hash_10e585c25e7e9f60":
        case #"hash_4220be38a5f150b8":
        case #"hash_4d35eb58f9d545f0":
        case #"hash_56979e0566996b2e":
        case #"hash_b161e185f1b8e117":
        case #"hash_b571a6187bf67f9e":
        case #"hash_ed469a6bfff6b265":
            var_24f040a6728b6dc4 = 1;
            break;
        case #"hash_4ad475e6e15635bd":
        case #"hash_4d5aa76e8707f47b":
        case #"hash_52d9b7ed584bec3e":
        case #"hash_cd0a0403551fc411":
        case #"hash_cf0ef5bef19a311b":
        case #"hash_e477c24ee18bb2f6":
            isground = 1;
            break;
        case #"hash_195360490caa3220":
        case #"hash_28d0236400e33fd0":
        case #"hash_349713b5ad494dda":
        case #"hash_413c38e72fe8b5bf":
        case #"hash_691f39dddd9116b8":
        case #"hash_a1031216158c7882":
        case #"hash_e6bea339d3cbd3e8":
            var_ae8eb6d66c120397 = 1;
            break;
        case #"hash_f64c697bfb4c6b54":
        case #"hash_27002778019fb447":
        case #"hash_e51f2e3d5cdd8ed8":
            var_ae8eb6d66c120397 = 1;
            issupport = 1;
            break;
        case #"hash_19dd9a3a4147e09e":
            isground = 1;
            var_24f040a6728b6dc4 = 1;
            break;
        case #"hash_2289ec11d77bce8f":
            issupport = 1;
            var_24f040a6728b6dc4 = 1;
            break;
        case #"hash_b4ac3581c343a029":
        case #"hash_8c766d6477287bb6":
        case #"hash_bf2f9adbd2b41d5":
        case #"hash_7a687f6a4d685110":
        case #"hash_6362d6aae3e5a62e":
            var_ae8eb6d66c120397 = 1;
            var_24f040a6728b6dc4 = 1;
            break;
        case #"hash_e171e5b86ef0a4cc":
        case #"hash_887ad77192b9c4fb":
        case #"hash_634b246c3da5c56f":
            var_ae8eb6d66c120397 = 1;
            issupport = 1;
            var_24f040a6728b6dc4 = 1;
            break;
        }
        if (isground) {
            enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"ground"));
        }
        if (var_ae8eb6d66c120397) {
            enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"aerial"));
        }
        if (issupport) {
            enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"support"));
        }
        if (var_24f040a6728b6dc4) {
            var_7b718ef6c64f049f = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_22d8c6e760626656", #"auto_killstreak"));
        } else {
            var_7b718ef6c64f049f = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_22d8c6e760626656", #"hash_26588836ee582767"));
        }
    }
    if (isdefined(victim.vehiclename)) {
        enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"vehicle"));
        canfly = istrue(victim vehicle::vehiclecanfly());
        isboat = istrue(victim vehicle::isvehicleboat());
        if (isground && !canfly && !isboat) {
            enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"ground"));
        } else if (var_ae8eb6d66c120397 || canfly) {
            enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"aerial"));
        }
        if (victim.vehiclename == "dmz_boss_chopper") {
            enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"boss"));
            enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"chopper_boss"));
            enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"aerial"));
        } else if (victim.vehiclename == "pac_sentry") {
            enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"boss"));
            enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"hash_6e1270aafc6b28fc"));
        } else if (victim.vehiclename == "veh9_armored_acv_6x6") {
            enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"hash_12648e6785f3475b"));
            enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"boss"));
        }
        vehicletype = undefined;
        switch (victim.vehiclename) {
        case #"hash_c93466c10cc10ba":
            vehicletype = ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"atv");
            break;
        case #"hash_7c54070d9b704f70":
            vehicletype = ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"light_tank");
            break;
        case #"hash_9d4e22a00fc630b5":
            vehicletype = ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"little_bird");
            break;
        case #"hash_112ffa8db1ed9ebd":
            vehicletype = ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_acv_6x6");
            break;
        case #"hash_2ddb1b1fa5093dd1":
            vehicletype = ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_apc_8x8");
            break;
        case #"hash_835a3b4bb4e34233":
            vehicletype = ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_blima");
            break;
        case #"hash_b8b8fefba61ac382":
            vehicletype = ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"hash_bbeb472fbad33a42");
            break;
        case #"hash_cb2498c4a1e415fd":
            vehicletype = ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_cougar");
            break;
        case #"hash_cbbafedb48ea9aea":
            vehicletype = ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_hummer");
            break;
        case #"hash_d63b8f48fb92540d":
            vehicletype = ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_jltv_mg");
            break;
        case #"hash_d212f4961f28eb58":
            vehicletype = ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_jltv");
            break;
        case #"hash_f9260a8d132b789":
            vehicletype = ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_mil_cargo_truck");
            break;
        case #"hash_5211f142350a63e1":
            vehicletype = ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_overland_2016");
            break;
        case #"hash_66c8846b85d8c948":
            vehicletype = ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_palfa");
            break;
        case #"hash_a2c475614741731":
            vehicletype = ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_patrol_boat");
            break;
        case #"hash_d589a6a019e9defe":
            vehicletype = ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_pickup_2014");
            break;
        case #"hash_81ea99824b4eacca":
            vehicletype = ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_pwc");
            break;
        case #"hash_44d67727616d3059":
            vehicletype = ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_rhib");
            break;
        case #"hash_228830c793bd36cb":
            vehicletype = ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_sedan_hatchback_1985");
            break;
        case #"hash_f690b9139a2baa7e":
            vehicletype = ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_suv_1996");
            break;
        case #"hash_cb367b51338c9d6":
            vehicletype = ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_techo_rebel_armor");
            break;
        case #"hash_a7bdb3825f53a60d":
            vehicletype = ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_utv");
            break;
        }
        if (isdefined(vehicletype)) {
            enemytype = function_6d40f12a09494350(enemytype, vehicletype);
        }
        if (isdefined(victim.riders)) {
            enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"ai_vehicle"));
            if (victim.vehiclename == "little_bird" || victim.vehiclename == "veh9_blima") {
                enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"reinforcement_chopper"));
            }
        }
        if (vehicle::vehicle_isenemytoplayer(victim, self)) {
            enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"enemy_vehicle"));
        }
    } else if (var_b93834c5c289dcdc) {
        enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"vehicle"));
    }
    if (isdefined(victim.equipmentref)) {
        enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"equipment"));
    }
    if (isagent(victim)) {
        if (isdefined(victim.aitype)) {
            enemytype = return_enemy_type_mask(enemytype, victim);
        } else if (isdefined(victim.agent_type)) {
            var_c00a336249963ce8 = function_e9dc49603ac403d(enemytype, var_7b718ef6c64f049f, victim);
            var_7b718ef6c64f049f = var_c00a336249963ce8[1];
            enemytype = var_c00a336249963ce8[0];
        }
    }
    return [enemytype, var_7b718ef6c64f049f];
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf487
// Size: 0x1cd
function function_8435d79a41ea37b0(victim) {
    enemytype = 0;
    vehicletype = undefined;
    if (isdefined(victim) && isdefined(victim.vehiclename)) {
        switch (victim.vehiclename) {
        case #"hash_8b763c32b6a3f882":
            vehicletype = ae_utility::function_e2ff8f4b4e94f723(#"hash_22d8c6e760626656", #"veh_jup_jltv_mg");
            break;
        case #"hash_885f51af68244d3":
            vehicletype = ae_utility::function_e2ff8f4b4e94f723(#"hash_22d8c6e760626656", #"veh_jup_suv_1996");
            break;
        case #"hash_c9d9aa17e7c175a5":
            vehicletype = ae_utility::function_e2ff8f4b4e94f723(#"hash_22d8c6e760626656", #"veh_jup_pickup_2014");
            break;
        case #"hash_a4c3ae5c9f3a69f":
            vehicletype = ae_utility::function_e2ff8f4b4e94f723(#"hash_22d8c6e760626656", #"hash_f56b6b0fcad9f6bf");
            break;
        case #"hash_c7645976ba1894f":
            vehicletype = ae_utility::function_e2ff8f4b4e94f723(#"hash_22d8c6e760626656", #"veh9_motorcycle_blood_burner_physics");
            break;
        case #"hash_b5677ac5bf174357":
            vehicletype = ae_utility::function_e2ff8f4b4e94f723(#"hash_22d8c6e760626656", #"veh_jup_orav");
            break;
        case #"hash_63cf913c1ee55d64":
            vehicletype = ae_utility::function_e2ff8f4b4e94f723(#"hash_22d8c6e760626656", #"veh_jup_razorback");
            break;
        case #"hash_6437bb8a3a27be5e":
            vehicletype = ae_utility::function_e2ff8f4b4e94f723(#"hash_22d8c6e760626656", #"veh_jup_truck_tech_hmg");
            break;
        case #"hash_da4cefbee9ff0d74":
            vehicletype = ae_utility::function_e2ff8f4b4e94f723(#"hash_22d8c6e760626656", #"hash_48bbae067d189af4");
            break;
        }
    }
    if (isdefined(vehicletype)) {
        enemytype = function_6d40f12a09494350(enemytype, vehicletype);
    }
    return enemytype;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf65c
// Size: 0x3a
function function_c7496288999ac847(agenttype, subcategory) {
    return issubstr(agenttype, "cartel") || function_7ee65fae13124702() && isdefined(subcategory) && subcategory == "elimTarget";
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf69e
// Size: 0x708
function function_e9dc49603ac403d(enemytype, var_7b718ef6c64f049f, victim) {
    enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"agent"));
    if (issubstr(victim.agent_type, "civilian")) {
        enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"civilian"));
    } else {
        var_86df29145c484d9c = issubstr(victim.agent_type, "biolab") || issubstr(victim.agent_type, "merc");
        if (!var_86df29145c484d9c) {
            enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"combatant"));
        }
        if (issubstr(victim.agent_type, "jugg")) {
            enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"juggernaut"));
        } else if (issubstr(victim.agent_type, "riotshield")) {
            enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"riotshield"));
        } else if (issubstr(victim.agent_type, "velikan")) {
            enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"boss"));
            enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"hash_eff939dd79f60271"));
        } else if (issubstr(victim.agent_type, "firebug")) {
            enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"firebug"));
        } else if (issubstr(victim.agent_type, "butcher")) {
            var_7b718ef6c64f049f = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_22d8c6e760626656", #"hash_e016c28fc0fa9c90"));
        } else if (issubstr(victim.agent_type, "swamp")) {
            var_7b718ef6c64f049f = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_22d8c6e760626656", #"hash_d3d79e53ba73ecf1"));
        } else if (issubstr(victim.agent_type, "mummy")) {
            var_7b718ef6c64f049f = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_22d8c6e760626656", #"hash_529b2a005c09f2a4"));
        } else {
            enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"soldier"));
        }
        if (utility::issharedfuncdefined("ai_mp_controller", "agentPers_getAgentPersData")) {
            var_3b341f9dc3b7ffb4 = utility::getsharedfunc("ai_mp_controller", "agentPers_getAgentPersData");
            if (istrue([[ var_3b341f9dc3b7ffb4 ]](victim, "elite"))) {
                enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"elite"));
            }
            tier = [[ var_3b341f9dc3b7ffb4 ]](victim, "tier");
            if (isdefined(tier)) {
                if (tier == 1) {
                    enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"tier1"));
                } else if (tier == 2) {
                    enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"tier2"));
                } else {
                    enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"tier3"));
                }
                if (tier == 2 || tier == 3) {
                    enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"armored"));
                }
            }
            category = [[ var_3b341f9dc3b7ffb4 ]](victim, "category");
            subcategory = [[ var_3b341f9dc3b7ffb4 ]](victim, "subcategory");
            if (issubstr(victim.agent_type, "aq")) {
                enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"aq"));
            } else if (var_86df29145c484d9c) {
                enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"hash_4ece742ef2d8f981"));
            } else if (function_c7496288999ac847(victim.agent_type, subcategory)) {
                enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"cartel"));
            } else if (issubstr(victim.agent_type, "ru")) {
                enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"russian"));
            }
            if (isdefined(category) && isdefined(subcategory)) {
                if (category == "mission" && subcategory == "elimTarget") {
                    enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"elim_target"));
                }
                if (category == "bosses") {
                    enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"boss"));
                    if (subcategory == "jugg") {
                        enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"juggernaut_boss"));
                    } else if (subcategory == "chemistBoss") {
                        enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"hash_a5d8aa404113c12c"));
                    } else if (subcategory == "trapperBoss") {
                        enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"trapper_boss"));
                    } else if (subcategory == " pyroBoss") {
                        enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"pyro_boss"));
                    } else if (subcategory == "ratBoss") {
                        enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"hash_5c831c5541c13764"));
                    } else if (subcategory == "sniperBoss") {
                        enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"sniper_boss"));
                    } else if (subcategory == "rusherBoss") {
                        enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"rusher_boss"));
                    } else if (subcategory == "jailerBoss") {
                        var_7b718ef6c64f049f = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_22d8c6e760626656", #"rat_boss"));
                    }
                }
                if (subcategory == "jailerBossMinion") {
                    var_7b718ef6c64f049f = function_6d40f12a09494350(enemytype, function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"rat"));
                }
            }
        }
    }
    return [enemytype, var_7b718ef6c64f049f];
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfdae
// Size: 0x129
function return_enemy_type_mask(enemytype, victim) {
    if (!isdefined(victim.aitype)) {
        return enemytype;
    }
    switch (victim.aitype) {
    case #"hash_44aaeb0edd152195":
        enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"soldier"));
        break;
    case #"hash_4ad475e6e15635bd":
        enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"juggernaut"));
        break;
    case #"hash_1403dfb5d1265ddc":
        enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"suicidebomber"));
        break;
    case #"hash_321a9678047d0a4e":
        enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"riotshield"));
        break;
    default:
        enemytype = function_6d40f12a09494350(enemytype, ae_utility::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"agent"));
        break;
    }
    return enemytype;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfedf
// Size: 0x1a0
function private function_742decc7f891bb0e(var_9c46b4c2597d7b03) {
    if (!challengesenabledforplayer()) {
        return;
    }
    gamemode = getchallengegamemode(self);
    gametype = function_17c5d7feb226e256();
    operatorlootid = function_aff35122a61a900b(self.team);
    location = 0;
    location2 = 0;
    if (isdefined(self.closestpoi)) {
        location = getlocation(function_5b2c23ea4889f30b(self.closestpoi));
        location2 = function_55be16fb0f5f4a19(function_5b2c23ea4889f30b(self.closestpoi));
    }
    aeeventname = #"hash_6a5ad49f1800e512";
    aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
    params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype, ae_utility::function_d6f771aedba70ce7(aeeventname, #"operator_id"), operatorlootid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_92939ab8dccb3d82"), location, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_dc0d981f2d59d210"), location2, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_ecf2f40148801ac5"), var_9c46b4c2597d7b03];
    /#
        function_7d97a2a745e514c4(aeeventid, params);
    #/
    reportChallengeUserSerializedEventWrapper(aeeventid, params);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10086
// Size: 0x23
function function_3d871e989c0bdb6d() {
    if (!isdefined(self.var_d405f79d63134727)) {
        self.var_d405f79d63134727 = 0;
    }
    return self.var_d405f79d63134727;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x100b1
// Size: 0x64
function function_ca0ab723ebcf6d79() {
    if (!isdefined(self.var_d405f79d63134727)) {
        self.var_d405f79d63134727 = 0;
    }
    self.var_d405f79d63134727 = self.var_d405f79d63134727 + 1;
    awardflag = 0;
    awardflag = function_6d40f12a09494350(awardflag, ae_utility::function_e2ff8f4b4e94f723(#"hash_ecf2f40148801ac5", #"hash_972a0e505ecce104"));
    function_742decc7f891bb0e(awardflag);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1011c
// Size: 0x72
function function_8935e658d461fc50() {
    if (!isdefined(self.var_d405f79d63134727)) {
        self.var_d405f79d63134727 = 0;
    }
    if (self.var_d405f79d63134727 > 0) {
        self.var_d405f79d63134727 = self.var_d405f79d63134727 - 1;
        var_bc2c612dd7d7cf33 = 0;
        var_bc2c612dd7d7cf33 = function_6d40f12a09494350(var_bc2c612dd7d7cf33, ae_utility::function_e2ff8f4b4e94f723(#"hash_ecf2f40148801ac5", #"hash_33af2318f82518f3"));
        function_742decc7f891bb0e(var_bc2c612dd7d7cf33);
    }
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10195
// Size: 0x1b6
function private function_8feb2dc462cfc7f4(command, var_9c46b4c2597d7b03) {
    if (!challengesenabledforplayer()) {
        return;
    }
    gamemode = getchallengegamemode(self);
    gametype = function_17c5d7feb226e256();
    operatorlootid = function_aff35122a61a900b(self.team);
    location = 0;
    location2 = 0;
    if (isdefined(self.closestpoi)) {
        location = getlocation(function_5b2c23ea4889f30b(self.closestpoi));
        location2 = function_55be16fb0f5f4a19(function_5b2c23ea4889f30b(self.closestpoi));
    }
    aeeventname = #"game_flags";
    aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
    params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype, ae_utility::function_d6f771aedba70ce7(aeeventname, #"operator_id"), operatorlootid, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_92939ab8dccb3d82"), location, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_dc0d981f2d59d210"), location2, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_7164db7c4d5bdb1c"), command, ae_utility::function_d6f771aedba70ce7(aeeventname, #"hash_4a7f024e87253788"), var_9c46b4c2597d7b03];
    reportChallengeUserSerializedEventWrapper(aeeventid, params);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10352
// Size: 0x16
function initgameflags(var_c770d7c80bb5d9ac) {
    self.var_c770d7c80bb5d9ac = var_c770d7c80bb5d9ac;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1036f
// Size: 0xd
function function_9293fc45cc7e5634() {
    return isdefined(self.var_c770d7c80bb5d9ac);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10384
// Size: 0x54
function function_cfe6dcedf7278543(var_df866e95f432cbd7) {
    if (!isdefined(self.var_c770d7c80bb5d9ac)) {
        self.var_c770d7c80bb5d9ac = 0;
        return 0;
    }
    bitflag = 0;
    bitflag = function_6d40f12a09494350(bitflag, var_df866e95f432cbd7);
    isset = (self.var_c770d7c80bb5d9ac & bitflag) != 0;
    return isset;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x103e0
// Size: 0x6d
function function_b7793133df5fb0df(var_df866e95f432cbd7) {
    if (!isdefined(self.var_c770d7c80bb5d9ac)) {
        self.var_c770d7c80bb5d9ac = 0;
    }
    bitflag = 0;
    bitflag = function_6d40f12a09494350(bitflag, var_df866e95f432cbd7);
    function_8feb2dc462cfc7f4(ae_utility::function_e2ff8f4b4e94f723(#"hash_7164db7c4d5bdb1c", #"set_flag"), bitflag);
    self.var_c770d7c80bb5d9ac = self.var_c770d7c80bb5d9ac | bitflag;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10454
// Size: 0x6e
function function_5b58181f4c00ba56(var_df866e95f432cbd7) {
    if (!isdefined(self.var_c770d7c80bb5d9ac)) {
        self.var_c770d7c80bb5d9ac = 0;
    }
    bitflag = 0;
    bitflag = scripts/cp_mp/challenges::function_6d40f12a09494350(bitflag, var_df866e95f432cbd7);
    function_8feb2dc462cfc7f4(ae_utility::function_e2ff8f4b4e94f723(#"hash_7164db7c4d5bdb1c", #"clear_flag"), bitflag);
    self.var_c770d7c80bb5d9ac = self.var_c770d7c80bb5d9ac & ~bitflag;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x104c9
// Size: 0x23
function function_38e2bca264061aa0() {
    gametype = function_17c5d7feb226e256();
    function_8359cadd253f9604(self, "complete_blacksite", 1);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x104f3
// Size: 0x23
function function_45ab928fbc73f76c() {
    gametype = function_17c5d7feb226e256();
    function_8359cadd253f9604(self, "complete_stronghold", 1);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1051d
// Size: 0x14
function onplayerteamrevive(reviver, revivee) {
    
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10538
// Size: 0xc
function onsuccessfulhit(objweapon) {
    
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1054b
// Size: 0xb
function onspawn() {
    thread watchPlayerUnderwater();
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1055d
// Size: 0x4f
function watchPlayerUnderwater() {
    player = self;
    player notify("watchPlayerUnderwater");
    player endon("watchPlayerUnderwater");
    player endon("death_or_disconnect");
    player endon("game_ended");
    while (true) {
        if (player namespace_8ade6bdb04213c12::isplayerunderwater()) {
            player childthread function_f71341a16372f41c();
        }
        player waittill("scr_change_breath_state");
    }
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x105b3
// Size: 0x28
function function_f71341a16372f41c() {
    player = self;
    player endon("scr_change_breath_state");
    wait(35);
    function_8359cadd253f9604(player, "underwater_challenge_completed", 1);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x105e2
// Size: 0x101
function function_565d6af7da923110(success) {
    if (!challengesenabledforplayer()) {
        return;
    }
    gamemode = getchallengegamemode(self);
    gametype = function_17c5d7feb226e256();
    operatorlootid = function_aff35122a61a900b(self.team);
    aeeventname = #"hash_8f093c85d9262e5d";
    aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
    params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype, ae_utility::function_d6f771aedba70ce7(aeeventname, #"completed"), istrue(success)];
    /#
        function_7d97a2a745e514c4(aeeventid, params);
    #/
    reportChallengeUserSerializedEventWrapper(aeeventid, params);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x106ea
// Size: 0xdd
function function_7c5850e37b6857dc() {
    if (!challengesenabledforplayer()) {
        return;
    }
    gamemode = getchallengegamemode(self);
    gametype = function_17c5d7feb226e256();
    operatorlootid = function_aff35122a61a900b(self.team);
    aeeventname = #"hash_ff0f2afd6e4375e9";
    aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
    params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype];
    /#
        function_7d97a2a745e514c4(aeeventid, params);
    #/
    reportChallengeUserSerializedEventWrapper(aeeventid, params);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x107ce
// Size: 0x14
function updatesuperweaponkills(objweapon, inflictor) {
    
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x107e9
// Size: 0x1c
function updatesuperkills(superref, meansofdeath, var_b34cda8a56dd46c5) {
    
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1080c
// Size: 0xc
function resistedstun(attacker) {
    
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1081f
// Size: 0x3
function triggereddelayedexplosion() {
    
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10829
// Size: 0x1c
function minedestroyed(mine, attacker, type) {
    
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1084c
// Size: 0x3
function roundbegin() {
    
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10856
// Size: 0xc
function roundend(winnerstring) {
    
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10869
// Size: 0x3e
function playerdamaged(inflictor, attacker, damage, meansofdeath, objweapon, shitloc) {
    self.var_a0595326ca4cf35d = 0;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x108ae
// Size: 0x14
function processuavassist(owner, uavtype) {
    
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x108c9
// Size: 0x2c
function killstreakdamaged(killstreakname, owner, attacker, weapon, damage) {
    
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x108fc
// Size: 0x49
function iskillstreakvehicle(killstreakname) {
    switch (killstreakname) {
    case #"hash_28d0236400e33fd0":
    case #"hash_4ad475e6e15635bd":
    case #"hash_4d5aa76e8707f47b":
    case #"hash_52d9b7ed584bec3e":
        return false;
    }
    return true;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1094d
// Size: 0x14
function processfinalkillchallenges(attacker, victim) {
    
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10968
// Size: 0xc
function usedkillstreak(streakname) {
    
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1097b
// Size: 0x90
function getoperators() {
    operators = [];
    if (utility::issharedfuncdefined("player", "lookupCurrentOperator")) {
        operators[0] = self [[ utility::getsharedfunc("player", "lookupCurrentOperator") ]](self.team);
    } else {
        operators[0] = "";
    }
    if (utility::issharedfuncdefined("player", "lookupOtherOperator")) {
        operators[1] = self [[ utility::getsharedfunc("player", "lookupOtherOperator") ]](self.team);
    } else {
        operators[1] = "";
    }
    return operators;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10a13
// Size: 0x22
function function_73317c391c8e6d10(player, amount) {
    player reportstat("damage", amount);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10a3c
// Size: 0x22
function function_cf995e658ab79867(player, points) {
    player reportstat("score", points);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10a65
// Size: 0xd9
function function_4fb61d33f02e8203(player, increment) {
    if (!player challengesenabledforplayer()) {
        return;
    }
    gamemode = getchallengegamemode(player);
    gametype = function_17c5d7feb226e256();
    aeeventname = #"capture";
    aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
    params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype];
    /#
        function_7d97a2a745e514c4(aeeventid, params);
    #/
    player reportChallengeUserSerializedEventWrapper(aeeventid, params);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10b45
// Size: 0x102
function function_58e830149fcb9a1e(player, increment) {
    if (!player challengesenabledforplayer()) {
        return;
    }
    gamemode = getchallengegamemode(player);
    gametype = function_17c5d7feb226e256();
    playlistid = getplaylistid();
    aeeventname = #"confirmed_kill";
    aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
    params = [ae_utility::function_d6f771aedba70ce7(aeeventname, #"version"), 1, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gamemode"), gamemode, ae_utility::function_d6f771aedba70ce7(aeeventname, #"gametype"), gametype, ae_utility::function_d6f771aedba70ce7(aeeventname, #"playlist_id"), playlistid];
    /#
        function_7d97a2a745e514c4(aeeventid, params);
    #/
    player reportChallengeUserSerializedEventWrapper(aeeventid, params);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c4e
// Size: 0x7c
function function_8e81148472fb520a(eventplayer, aeeventname, params, var_afda85311c8ed272) {
    aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
    if (!isdefined(aeeventid) || !isint(aeeventid) && !isstring(aeeventid) || !isdefined(params)) {
        /#
            iprintln("<unknown string>");
        #/
        return;
    }
    /#
        function_7d97a2a745e514c4(aeeventid, params);
    #/
    eventplayer reportChallengeUserSerializedEventWrapper(aeeventid, params);
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10cd1
// Size: 0x1f5
function function_fee0bee456eac877(player, aeeventname, params, victimstruct) {
    if (!isdefined(player)) {
        return;
    }
    aeeventid = ae_utility::function_6e2deb013c9ca85e(aeeventname);
    if (!isdefined(aeeventid) || !isint(aeeventid) && !isstring(aeeventid)) {
        /#
            iprintln("<unknown string>");
        #/
        return;
    }
    if (isdefined(victimstruct) && isdefined(victimstruct.var_21a8839dd03e31cd)) {
        if (isarray(victimstruct.var_21a8839dd03e31cd)) {
            foreach (assistplayer in victimstruct.var_21a8839dd03e31cd) {
                if (assistplayer == player) {
                    continue;
                }
                assistplayer reportChallengeUserSerializedEventWrapper(aeeventid, params);
                assistplayer.var_4f4d3b6fe9b3e3c9 = 1;
            }
        }
    }
    if (issharedfuncdefined("squad_utility", "getSquadMembers")) {
        squad = player [[ getsharedfunc("squad_utility", "getSquadMembers") ]]();
    }
    if (isdefined(squad)) {
        params[params.size] = ae_utility::function_d6f771aedba70ce7(aeeventname, #"squad_event");
        params[params.size] = 1;
        foreach (squadmember in squad) {
            if (isdefined(squadmember) && player != squadmember) {
                if (!isdefined(squadmember.var_4f4d3b6fe9b3e3c9)) {
                    squadmember.var_4f4d3b6fe9b3e3c9 = 0;
                }
                if (!istrue(squadmember.var_4f4d3b6fe9b3e3c9)) {
                    squadmember reportChallengeUserSerializedEventWrapper(aeeventid, params);
                }
                squadmember.var_4f4d3b6fe9b3e3c9 = 0;
            }
        }
    }
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ecd
// Size: 0xa4
function function_c1945f26d99b0ed9(player) {
    var_a8af9a2935dd804f = [];
    if (isagent(player) || !istrue(level.onlinegame)) {
        for (index = 0; index < 5; index++) {
            var_a8af9a2935dd804f[index] = 0;
        }
        return var_a8af9a2935dd804f;
    }
    squadmates = player getfireteammembers();
    for (index = 0; index < 5; index++) {
        if (isdefined(var_a8af9a2935dd804f) && isdefined(squadmates[index]) && squadmates[index] function_7a32b0201993d7f7() != "") {
            var_a8af9a2935dd804f[index] = squadmates[index] function_7a32b0201993d7f7();
            continue;
        }
        var_a8af9a2935dd804f[index] = 0;
    }
    return var_a8af9a2935dd804f;
}

// Namespace challenges / scripts/cp_mp/challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f79
// Size: 0x37
function reportChallengeUserSerializedEventWrapper(eventid, params) {
    if (isdefined(level.challengesallowed) && level.challengesallowed) {
        self function_db073176839d77fb(eventid, params);
    }
}

