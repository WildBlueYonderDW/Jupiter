// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_3214e6fcdce468a7;
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

// Namespace challenges/namespace_aad14af462a74d08
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
    level.var_1850e46a71d6e72d = throttle::function_e4c99b0f178ffb98("reportKillChallengeEvent", 1, level.framedurationseconds);
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
    registersharedfunc("challenges", "reportChallengeUserSerializedEventWrapper", &reportchallengeuserserializedeventwrapper);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26fe
// Size: 0x4c
function function_4f4a046a372e8158() {
    /#
        while (1) {
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

// Namespace challenges/namespace_aad14af462a74d08
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2751
// Size: 0x4b8
function setupchallengelocales() {
    level.localetriggers = [];
    var_d09aecdb0d855501 = getentarray("location_volume", "targetname");
    if (isdefined(var_d09aecdb0d855501) && var_d09aecdb0d855501.size > 0) {
        foreach (area in var_d09aecdb0d855501) {
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
        level.localetriggers = var_d09aecdb0d855501;
    }
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c10
// Size: 0xc
function challengesenabled() {
    return level.challengesallowed;
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c24
// Size: 0x72
function challengesenabledforplayer() {
    if (!challengesenabled()) {
        return 0;
    }
    if (!isplayer(self) || isai(self)) {
        return 0;
    }
    if (istrue(level.challengesdisabled)) {
        return 0;
    }
    if (isdefined(self.var_56f36fd7cc3d8098)) {
        return 0;
    }
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        if (!istrue(level.br_prematchstarted) && getdvarint(@"hash_e76748b9932f4dbd", 0) == 0) {
            return 0;
        }
    }
    return 1;
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c9e
// Size: 0x31
function function_5c7e8bcdc167fd84() {
    if (!isdefined(level.var_31fe2d8a33b25b91)) {
        level.var_31fe2d8a33b25b91 = getdvarint(@"hash_5fe27d3efac4a807", 0);
    }
    return level.var_31fe2d8a33b25b91;
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cd7
// Size: 0x1f
function challengetimersenabledforplayer() {
    if (!istrue(level.challengetimersenabled)) {
        return 0;
    }
    if (!challengesenabledforplayer()) {
        return 0;
    }
    return 1;
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cfe
// Size: 0x2e
function validchallengetimer(challengename) {
    if (!isdefined(self.challengestarttime)) {
        return 0;
    }
    if (!isdefined(self.challengestarttime[challengename])) {
        return 0;
    }
    return 1;
}

// Namespace challenges/namespace_aad14af462a74d08
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

// Namespace challenges/namespace_aad14af462a74d08
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

// Namespace challenges/namespace_aad14af462a74d08
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
            function_b7de4afaf79ff9b5(challengename, var_ac846be90e9552ab);
        }
        self.challengestarttime[challengename] = 0;
    }
}

// Namespace challenges/namespace_aad14af462a74d08
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
            function_b7de4afaf79ff9b5(challengename, var_ac846be90e9552ab);
            self.challengestarttime[challengename] = gettime();
        }
    }
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2eb6
// Size: 0x7c
function trackchallengetimers() {
    level endon("game_ended");
    while (1) {
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

// Namespace challenges/namespace_aad14af462a74d08
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f39
// Size: 0x4d
function function_11cf26edf87d512() {
    /#
        while (1) {
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

// Namespace challenges/namespace_aad14af462a74d08
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
        var_11288e5c048db2f8 = getdvar(@"hash_4164d219a03096db", "weapon");
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
            fprintln(level.var_37bf270d2c55a0c7, "<unknown string>" + var_11288e5c048db2f8 + "<unknown string>");
            level.var_8a69c8a5e52a8a84 = level.var_8a69c8a5e52a8a84 + 1;
            level.var_ba27ec806279b044 = [];
            var_9bb3e1549c6b2cd8 = -1;
            while (1) {
                var_9bb3e1549c6b2cd8 = var_9bb3e1549c6b2cd8 + 1;
                if (var_9bb3e1549c6b2cd8 >= tablelookupgetnumrows("<unknown string>")) {
                    break;
                }
                eventkeys = tablelookupbyrow("<unknown string>", var_9bb3e1549c6b2cd8, 5);
                if (!isdefined(eventkeys) || eventkeys == "<unknown string>") {
                    continue;
                }
                var_e69af3c2055e35eb = int(tablelookupbyrow("<unknown string>", var_9bb3e1549c6b2cd8, 0));
                foreach (keyname in strtok(eventkeys, "<unknown string>")) {
                    var_c94a0bb0d9c971a2 = int(tablelookup("<unknown string>", 1, keyname, 0));
                    keytype = tablelookup("<unknown string>", 1, keyname, 2);
                    var_289dd4d247bd6d9d = tablelookup("<unknown string>", 1, keyname, 3);
                    level.var_ba27ec806279b044[var_e69af3c2055e35eb]["<unknown string>"][var_c94a0bb0d9c971a2]["<unknown string>"] = keyname;
                    level.var_ba27ec806279b044[var_e69af3c2055e35eb]["<unknown string>"][var_c94a0bb0d9c971a2]["<unknown string>"] = keytype;
                    bitfield = [];
                    foreach (var_546f224388accf90 in strtok(var_289dd4d247bd6d9d, "<unknown string>")) {
                        var_2f4385dec49b4cbf = strtok(var_546f224388accf90, "<unknown string>");
                        bitname = var_2f4385dec49b4cbf[0];
                        var_4b617b0e0811ea78 = int(var_2f4385dec49b4cbf[1]);
                        bitfield[var_4b617b0e0811ea78] = bitname;
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
        k = 0;
        while (k < params.size) {
            key = params[k];
            value = params[k + 1];
            keystring = "<unknown string>";
            keytype = "<unknown string>";
            var_d99158046dc76232 = "<unknown string>";
            if (isdefined(level.var_ba27ec806279b044[int(event)]["<unknown string>"][key])) {
                var_b7166e5e134ce8e0 = level.var_ba27ec806279b044[int(event)]["<unknown string>"][key];
                keystring = var_b7166e5e134ce8e0["<unknown string>"];
                keytype = var_b7166e5e134ce8e0["<unknown string>"];
                var_289dd4d247bd6d9d = var_b7166e5e134ce8e0["<unknown string>"];
                if (isdefined(value)) {
                    if (keytype == "<unknown string>") {
                        bitarray = function_3005ef56488df9be(value);
                        for (n = 0; n < var_289dd4d247bd6d9d.size; n++) {
                            if (!isdefined(bitarray[n]) || !bitarray[n]) {
                                continue;
                            }
                            if (var_d99158046dc76232.size > 0) {
                                var_d99158046dc76232 = var_d99158046dc76232 + "<unknown string>";
                            }
                            var_d99158046dc76232 = var_d99158046dc76232 + var_289dd4d247bd6d9d[n];
                        }
                        if (var_d99158046dc76232 == "<unknown string>") {
                            var_d99158046dc76232 = "<unknown string>";
                        }
                        var_d99158046dc76232 = "<unknown string>" + var_d99158046dc76232;
                    } else if (keystring == "<unknown string>" || keystring == "<unknown string>" || keystring == "<unknown string>") {
                        var_d99158046dc76232 = "<unknown string>" + tablelookup("<unknown string>", 0, value, 1);
                    } else if (keystring == "<unknown string>" || keystring == "<unknown string>" || keystring == "<unknown string>" || keystring == "<unknown string>") {
                        var_d99158046dc76232 = "<unknown string>" + tablelookup("<unknown string>", 0, value, 2) + "<unknown string>" + tablelookup("<unknown string>", 0, value, 1) + "<unknown string>";
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
            fprintln(level.var_37bf270d2c55a0c7, "<unknown string>" + comment + "<unknown string>" + key + "<unknown string>" + value + "<unknown string>" + keystring + "<unknown string>" + var_d99158046dc76232);
            k = k + 2;
        }
        fprintln(level.var_37bf270d2c55a0c7, "<unknown string>");
        level.var_8a69c8a5e52a8a84 = level.var_8a69c8a5e52a8a84 + 1;
    #/
}

// Namespace challenges/namespace_aad14af462a74d08
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
            objweapon = attacker namespace_45ecbe78f599af72::function_1e3102980c3a4cc1(objweapon);
            var_425d52c81f1883fc = 0;
            var_425d55c81f188a95 = 0;
            var_425d54c81f188862 = 0;
            var_3a33b126031be677 = 0;
            hitloc = 0;
            if (isdefined(modifiers)) {
                var_425d52c81f1883fc = modifiers["mask"];
                if (isdefined(modifiers["mask2"])) {
                    var_425d55c81f188a95 = modifiers["mask2"];
                }
                if (isdefined(modifiers["mask3"])) {
                    var_425d54c81f188862 = modifiers["mask3"];
                }
                var_3a33b126031be677 = modifiers["attachment_flags"];
                hitloc = modifiers["hit_loc"];
            }
            var_3a99d1cafe4a4bac = function_137b512700167b00(attacker, victim);
            reportkillchallengeevent(attacker, var_3a99d1cafe4a4bac, var_425d52c81f1883fc, var_425d55c81f188a95, var_425d54c81f188862, objweapon, damage, meansofdeath, var_3a33b126031be677, hitloc);
        }
    }
}

// Namespace challenges/namespace_aad14af462a74d08
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
        objweapon = attacker namespace_45ecbe78f599af72::function_1e3102980c3a4cc1(objweapon);
        var_425d52c81f1883fc = 0;
        var_425d55c81f188a95 = 0;
        var_425d54c81f188862 = 0;
        var_3a33b126031be677 = 0;
        hitloc = 0;
        if (isdefined(modifiers)) {
            var_425d52c81f1883fc = modifiers["mask"];
            if (isdefined(modifiers["mask2"])) {
                var_425d55c81f188a95 = modifiers["mask2"];
            }
            if (isdefined(modifiers["mask3"])) {
                var_425d54c81f188862 = modifiers["mask3"];
            }
            var_3a33b126031be677 = modifiers["attachment_flags"];
            hitloc = modifiers["hit_loc"];
        }
        reportkillchallengeevent(attacker, var_bafbdb422ea9eaae, var_425d52c81f1883fc, var_425d55c81f188a95, var_425d54c81f188862, objweapon, damage, meansofdeath, var_3a33b126031be677, hitloc, var_1d68c79557cc54ea);
    }
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39a0
// Size: 0x417
function vehiclekilled(vehicle, attacker, damage, objweapon) {
    if (!attacker challengesenabledforplayer()) {
        return;
    }
    victim = vehicle;
    objweapon = attacker namespace_45ecbe78f599af72::function_1e3102980c3a4cc1(objweapon);
    meansofdeath = "MOD_UNKNOWN";
    var_425d52c81f1883fc = 0;
    var_425d55c81f188a95 = 0;
    var_425d54c81f188862 = 0;
    var_3a33b126031be677 = 0;
    hitloc = 0;
    var_4866e2c44a0b5b1e = attacker namespace_e47104b48662385b::getvehicle(1);
    if (isdefined(var_4866e2c44a0b5b1e)) {
        var_425d52c81f1883fc = namespace_aad14af462a74d08::function_6d40f12a09494350(var_425d52c81f1883fc, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"invehicle"));
        if (var_4866e2c44a0b5b1e namespace_dbbb37eb352edf96::ishelicopter()) {
            var_425d55c81f188a95 = namespace_aad14af462a74d08::function_6d40f12a09494350(var_425d55c81f188a95, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_ae1d6543f4912eab"));
        } else if (var_4866e2c44a0b5b1e.vehiclename == "veh9_mil_lnd_mrap") {
            var_425d55c81f188a95 = namespace_aad14af462a74d08::function_6d40f12a09494350(var_425d55c81f188a95, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_dbaf3685f1412e50"));
        }
    }
    platform = attacker getmovingplatformparent();
    if (isdefined(platform) && platform namespace_1f188a13f7e79610::isvehicle()) {
        if (istrue(platform.isheli)) {
            var_425d55c81f188a95 = namespace_aad14af462a74d08::function_6d40f12a09494350(var_425d55c81f188a95, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_ae1d6543f4912eab"));
            ref = platform namespace_1f188a13f7e79610::function_d93ec4635290febd();
            if (ref == "veh9_palfa") {
                var_425d55c81f188a95 = function_6d40f12a09494350(var_425d55c81f188a95, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_71e5f339792a9ef6"));
            }
        }
        if (!isdefined(var_4866e2c44a0b5b1e) || platform != var_4866e2c44a0b5b1e) {
            ref = namespace_9db09f982acd35b4::function_e58b746157089c68(platform);
            if (isdefined(ref) && (ref == "cargo_train" || ref == "br_passenger_train")) {
                var_425d52c81f1883fc = namespace_aad14af462a74d08::function_6d40f12a09494350(var_425d52c81f1883fc, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"ontrain"));
                if (ref == "cargo_train") {
                    var_425d55c81f188a95 = namespace_aad14af462a74d08::function_6d40f12a09494350(var_425d55c81f188a95, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_7d4ca6b82b853a92"));
                } else if (ref == "br_passenger_train") {
                    var_425d55c81f188a95 = namespace_aad14af462a74d08::function_6d40f12a09494350(var_425d55c81f188a95, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_8345a13afbaa0f66"));
                }
            } else {
                var_425d52c81f1883fc = namespace_aad14af462a74d08::function_6d40f12a09494350(var_425d52c81f1883fc, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"vehiclesurf"));
                if (platform.classname == "script_vehicle" && platform vehicle_getspeed() > 25) {
                    var_425d52c81f1883fc = function_6d40f12a09494350(var_425d52c81f1883fc, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"infastvehicle"));
                }
            }
        }
    }
    if (issharedfuncdefined("pmc_missions", "onVehicleDestroyed")) {
        level thread [[ getsharedfunc("pmc_missions", "onVehicleDestroyed") ]](vehicle);
    }
    var_3a99d1cafe4a4bac = function_137b512700167b00(attacker, victim);
    if (isdefined(level.var_9dd45392c2bffc71) && isdefined(level.var_9dd45392c2bffc71["id_assignPlayerKillModifiersTrimmed"])) {
        attacker [[ level.var_9dd45392c2bffc71["id_assignPlayerKillModifiersTrimmed"] ]](var_3a99d1cafe4a4bac, objweapon, meansofdeath, attacker);
        modifiers = attacker.modifiers;
        if (isdefined(var_3a99d1cafe4a4bac.team) && isdefined(attacker.team) && var_3a99d1cafe4a4bac.team != attacker.team) {
            var_425d52c81f1883fc = 0;
            var_425d55c81f188a95 = 0;
            var_425d54c81f188862 = 0;
            var_3a33b126031be677 = 0;
            hitloc = 0;
            if (isdefined(modifiers)) {
                var_425d52c81f1883fc = modifiers["mask"];
                if (isdefined(modifiers["mask2"])) {
                    var_425d55c81f188a95 = modifiers["mask2"];
                }
                if (isdefined(modifiers["mask3"])) {
                    var_425d54c81f188862 = modifiers["mask3"];
                }
                var_3a33b126031be677 = modifiers["attachment_flags"];
                hitloc = modifiers["hit_loc"];
            }
        }
    }
    reportkillchallengeevent(attacker, var_3a99d1cafe4a4bac, var_425d52c81f1883fc, var_425d55c81f188a95, var_425d54c81f188862, objweapon, damage, meansofdeath, var_3a33b126031be677, hitloc);
}

// Namespace challenges/namespace_aad14af462a74d08
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
            objweapon = attacker namespace_45ecbe78f599af72::function_1e3102980c3a4cc1(objweapon);
            var_425d52c81f1883fc = 0;
            var_425d55c81f188a95 = 0;
            var_425d54c81f188862 = 0;
            var_3a33b126031be677 = 0;
            if (isdefined(modifiers)) {
                var_425d52c81f1883fc = modifiers["mask"];
                if (isdefined(modifiers["mask2"])) {
                    var_425d55c81f188a95 = modifiers["mask2"];
                }
                if (isdefined(modifiers["mask3"])) {
                    var_425d54c81f188862 = modifiers["mask3"];
                }
                var_3a33b126031be677 = modifiers["attachment_flags"];
            }
            var_3a99d1cafe4a4bac = function_137b512700167b00(attacker, victim);
            reportkillchallengeevent(attacker, var_3a99d1cafe4a4bac, var_425d52c81f1883fc, var_425d55c81f188a95, var_425d54c81f188862, objweapon, damage, meansofdeath, var_3a33b126031be677, hitloc);
        }
    }
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f38
// Size: 0x1ee
function killstreakkilled(killstreakname, owner, var_168cf91a2552500c, attacker, damage, damagetype, objweapon, scorepopupname) {
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
            objweapon = attacker namespace_45ecbe78f599af72::function_1e3102980c3a4cc1(objweapon);
            meansofdeath = "MOD_UNKNOWN";
            var_425d52c81f1883fc = 0;
            var_425d55c81f188a95 = 0;
            var_425d54c81f188862 = 0;
            var_3a33b126031be677 = 0;
            hitloc = 0;
            if (isdefined(attacker.modifiers)) {
                if (isdefined(attacker.modifiers["mask"])) {
                    var_425d52c81f1883fc = attacker.modifiers["mask"];
                }
                if (isdefined(attacker.modifiers["mask2"])) {
                    var_425d55c81f188a95 = attacker.modifiers["mask2"];
                }
                if (isdefined(attacker.modifiers["mask3"])) {
                    var_425d54c81f188862 = attacker.modifiers["mask3"];
                }
                if (isdefined(attacker.modifiers["attachment_flags"])) {
                    var_3a33b126031be677 = attacker.modifiers["attachment_flags"];
                }
            }
            var_3a99d1cafe4a4bac = function_137b512700167b00(attacker, victim);
            reportkillchallengeevent(attacker, var_3a99d1cafe4a4bac, var_425d52c81f1883fc, var_425d55c81f188a95, var_425d54c81f188862, objweapon, damage, meansofdeath, var_3a33b126031be677, hitloc);
        }
    }
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x412d
// Size: 0x41
function function_5b2c23ea4889f30b(var_1a265c496508b47b) {
    var_9d9f97a53c1e5d06 = var_1a265c496508b47b;
    if (issharedfuncdefined("poi", "try_TranslatePOI")) {
        var_9d9f97a53c1e5d06 = [[ getsharedfunc("poi", "try_TranslatePOI") ]](var_9d9f97a53c1e5d06);
    }
    return var_9d9f97a53c1e5d06;
}

// Namespace challenges/namespace_aad14af462a74d08
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
    var_3fcdc20d65de43cd = 0;
    if (isdefined(var_f237807396377232)) {
        var_3fcdc20d65de43cd = var_f237807396377232.rarity;
    }
    gamemode = getchallengegamemode(player);
    gametype = function_17c5d7feb226e256();
    location = 0;
    var_fcf7b6e6d8c41c8 = 0;
    typeid = 0;
    if (isdefined(type)) {
        typeid = namespace_ec6836c9475c9d18::function_7042dad035dc176c(type);
    }
    if (isdefined(player.var_da28916e7827af7c)) {
        location = getlocation(function_5b2c23ea4889f30b(player.var_da28916e7827af7c));
        var_fcf7b6e6d8c41c8 = function_55be16fb0f5f4a19(function_5b2c23ea4889f30b(player.var_da28916e7827af7c));
    }
    var_7c6183ce9e04512e = #"collect_item";
    gamemode = function_68ffb11dc4c6b979(gamemode, var_7c6183ce9e04512e);
    gametype = function_68ffb11dc4c6b979(gametype, var_7c6183ce9e04512e);
    typeid = function_68ffb11dc4c6b979(typeid, var_7c6183ce9e04512e);
    location = function_68ffb11dc4c6b979(location, var_7c6183ce9e04512e);
    var_fcf7b6e6d8c41c8 = function_68ffb11dc4c6b979(var_fcf7b6e6d8c41c8, var_7c6183ce9e04512e);
    var_3fcdc20d65de43cd = function_68ffb11dc4c6b979(var_3fcdc20d65de43cd, var_7c6183ce9e04512e);
    quantity = function_68ffb11dc4c6b979(quantity, var_7c6183ce9e04512e);
    lootid = function_68ffb11dc4c6b979(lootid, var_7c6183ce9e04512e);
    function_8e81148472fb520a(player, var_7c6183ce9e04512e, [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_ad78fa4f448cdf42"), 3:typeid, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"value"), 5:quantity, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 7:gamemode, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 9:gametype, 10:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_92939ab8dccb3d82"), 11:location, 12:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_dc0d981f2d59d210"), 13:var_fcf7b6e6d8c41c8, 14:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"loot_id"), 15:lootid, 16:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_48f6b92ad0c610b2"), 17:var_3fcdc20d65de43cd], var_afda85311c8ed272);
}

// Namespace challenges/namespace_aad14af462a74d08
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
    var_49e5a39d5614bebe = function_8435d79a41ea37b0(vehicle);
    gametype = function_17c5d7feb226e256();
    typeid = namespace_ec6836c9475c9d18::function_7042dad035dc176c(type);
    location = 0;
    var_fcf7b6e6d8c41c8 = 0;
    if (isdefined(self.var_da28916e7827af7c)) {
        location = getlocation(function_5b2c23ea4889f30b(self.var_da28916e7827af7c));
        var_fcf7b6e6d8c41c8 = function_55be16fb0f5f4a19(function_5b2c23ea4889f30b(self.var_da28916e7827af7c));
    }
    gamemode = getchallengegamemode(self);
    var_7c6183ce9e04512e = #"vehicle";
    gamemode = function_68ffb11dc4c6b979(gamemode, var_7c6183ce9e04512e);
    gametype = function_68ffb11dc4c6b979(gametype, var_7c6183ce9e04512e);
    typeid = function_68ffb11dc4c6b979(typeid, var_7c6183ce9e04512e);
    location = function_68ffb11dc4c6b979(location, var_7c6183ce9e04512e);
    var_fcf7b6e6d8c41c8 = function_68ffb11dc4c6b979(var_fcf7b6e6d8c41c8, var_7c6183ce9e04512e);
    vehiclename = function_68ffb11dc4c6b979(vehiclename, var_7c6183ce9e04512e);
    var_49e5a39d5614bebe = function_68ffb11dc4c6b979(var_49e5a39d5614bebe, var_7c6183ce9e04512e);
    function_8e81148472fb520a(self, var_7c6183ce9e04512e, [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_ad78fa4f448cdf42"), 3:typeid, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 5:gamemode, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 7:gametype, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_92939ab8dccb3d82"), 9:location, 10:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_dc0d981f2d59d210"), 11:var_fcf7b6e6d8c41c8, 12:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e2f5c601b57b3960"), 13:vehiclename, 14:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_22d8c6e760626656"), 15:var_49e5a39d5614bebe]);
    /#
        println("<unknown string>" + type);
    #/
}

// Namespace challenges/namespace_aad14af462a74d08
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
    typeid = namespace_ec6836c9475c9d18::function_7042dad035dc176c(type);
    location = 0;
    var_fcf7b6e6d8c41c8 = 0;
    if (isdefined(player.var_da28916e7827af7c)) {
        location = getlocation(function_5b2c23ea4889f30b(player.var_da28916e7827af7c));
        var_fcf7b6e6d8c41c8 = function_55be16fb0f5f4a19(function_5b2c23ea4889f30b(player.var_da28916e7827af7c));
    }
    gamemode = getchallengegamemode(player);
    var_7c6183ce9e04512e = #"unlock";
    function_8e81148472fb520a(player, var_7c6183ce9e04512e, [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_ad78fa4f448cdf42"), 3:typeid, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"value"), 5:quantity, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 7:gamemode, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 9:gametype, 10:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_92939ab8dccb3d82"), 11:location, 12:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_dc0d981f2d59d210"), 13:var_fcf7b6e6d8c41c8], var_afda85311c8ed272);
    /#
        println("<unknown string>" + type);
    #/
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47b4
// Size: 0x1f1
function function_b0f754c8a379154e(equipment, player, dist, var_363274577dc0543e) {
    if (!player challengesenabledforplayer()) {
        return;
    }
    gamemode = getchallengegamemode(player);
    gametype = function_17c5d7feb226e256();
    var_7fb63b7fac6d1698 = function_3ea2b9fa713d6ed3(player);
    location = 0;
    var_fcf7b6e6d8c41c8 = 0;
    if (isdefined(player.var_da28916e7827af7c)) {
        location = getlocation(function_5b2c23ea4889f30b(player.var_da28916e7827af7c));
        var_fcf7b6e6d8c41c8 = function_55be16fb0f5f4a19(function_5b2c23ea4889f30b(player.var_da28916e7827af7c));
    }
    var_f275474aacd30c96 = 0;
    var_f275474aacd30c96 = loot::getlootidfromref(equipment);
    bitfield = 0;
    bitfield = function_6d40f12a09494350(bitfield, var_363274577dc0543e);
    var_7c6183ce9e04512e = #"equipment";
    function_8e81148472fb520a(player, var_7c6183ce9e04512e, [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 1:gamemode, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 3:gametype, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 5:1, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_92939ab8dccb3d82"), 7:location, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_dc0d981f2d59d210"), 9:var_fcf7b6e6d8c41c8, 10:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"loot_id"), 11:var_f275474aacd30c96, 12:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"distance"), 13:dist, 14:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_bd518e95df4103fe"), 15:var_7fb63b7fac6d1698, 16:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_83a2d67994d7e295"), 17:bitfield]);
}

// Namespace challenges/namespace_aad14af462a74d08
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
    var_a74fc57fb4a4d3e6 = player function_aff35122a61a900b(player.team);
    if (!isdefined(var_a74fc57fb4a4d3e6)) {
        var_a74fc57fb4a4d3e6 = 0;
    }
    gamemode = getchallengegamemode(player);
    teamsize = 0;
    if (gamemode & 8) {
        teamsize = namespace_36f464722d326bbe::function_4fb37368ae3585bb();
    }
    placement = 0;
    if (isdefined(player.teamplacement) && player.teamplacement > 0) {
        placement = player.teamplacement;
    }
    playlistid = getplaylistid();
    lobbyid = function_4f9373a1227db35c();
    location = 0;
    var_fcf7b6e6d8c41c8 = 0;
    if (isdefined(player.var_da28916e7827af7c)) {
        location = getlocation(function_5b2c23ea4889f30b(player.var_da28916e7827af7c));
        var_fcf7b6e6d8c41c8 = function_55be16fb0f5f4a19(function_5b2c23ea4889f30b(player.var_da28916e7827af7c));
    }
    var_8142a29197569218 = 0;
    if (isdefined(player.pers) && isdefined(player.pers["kills"])) {
        if (player.pers["kills"] >= 15) {
            var_8142a29197569218 = function_6d40f12a09494350(var_8142a29197569218, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_8dd9828579063e7", #"hash_5e8da3330ec52748"));
        }
    }
    if (!istrue(player.disconnecting) || isdefined(level.var_3940d363b8fb58c3)) {
        if (utility::issharedfuncdefined("score", "getHighestScoringPlayer")) {
            var_6dd753add7d1c236 = [[ utility::getsharedfunc("score", "getHighestScoringPlayer") ]]();
            if (isdefined(var_6dd753add7d1c236) && var_6dd753add7d1c236 == player) {
                var_8142a29197569218 = function_6d40f12a09494350(var_8142a29197569218, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_8dd9828579063e7", #"hash_de6c2ec52bf2a850"));
            }
        }
    }
    if (isdefined(level.var_db78248e94853165) && istrue(player.extracted)) {
        var_8142a29197569218 = function_6d40f12a09494350(var_8142a29197569218, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_8dd9828579063e7", #"hash_cca3beee360a3bdd"));
    }
    if (isdefined(level.var_8fc589b1edff1fb2) && istrue(level.var_8fc589b1edff1fb2[player.guid])) {
        var_8142a29197569218 = function_6d40f12a09494350(var_8142a29197569218, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_8dd9828579063e7", #"hash_600ba733abaa2896"));
    }
    if (istrue(player.var_ded04cdd264a7e00)) {
        var_8142a29197569218 = function_6d40f12a09494350(var_8142a29197569218, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_8dd9828579063e7", #"hash_4f5ea2cfeb163c9d"));
    }
    var_6bd1aebdc320269c = getdvarint(@"hash_d5a1ed391dd67630", 0);
    if (var_6bd1aebdc320269c) {
        var_8142a29197569218 = function_6d40f12a09494350(var_8142a29197569218, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_8dd9828579063e7", #"hash_f04084f13423c3b4"));
    }
    if (isdefined(level.arrow)) {
        if (istrue(level.arrow.var_c93fb612b08a50d1) && isdefined(level.arrow.var_a21db1ee260a96c3) && level.arrow.var_a21db1ee260a96c3 == player.team) {
            var_8142a29197569218 = function_6d40f12a09494350(var_8142a29197569218, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_8dd9828579063e7", #"hash_e4efa895facf6b7b"));
        }
        if (istrue(level.arrow.var_b9650014f2689b72)) {
            var_8142a29197569218 = function_6d40f12a09494350(var_8142a29197569218, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_8dd9828579063e7", #"hash_65ecff89121dd351"));
        }
    }
    objtime = 0;
    if (isdefined(player.pers) && isdefined(player.pers["objTime"])) {
        objtime = player.pers["objTime"];
    }
    gametype = function_17c5d7feb226e256();
    var_bb38571cca0414f = function_c1945f26d99b0ed9(player);
    var_7c6183ce9e04512e = #"end_match";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 1:gamemode, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 3:gametype, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"match_result"), 5:result, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_578439261b0ec47b"), 7:var_a74fc57fb4a4d3e6, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_8dd9828579063e7"), 9:var_8142a29197569218, 10:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"placement"), 11:placement, 12:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"playlist_id"), 13:playlistid, 14:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"team_size"), 15:teamsize, 16:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"lobby_id"), 17:lobbyid, 18:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_f3287b83e723dcd4"), 19:var_bb38571cca0414f[0], 20:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_f3287c83e723de87"), 21:var_bb38571cca0414f[1], 22:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_f3287d83e723e03a"), 23:var_bb38571cca0414f[2], 24:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_f3287e83e723e1ed"), 25:var_bb38571cca0414f[3], 26:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_f3287783e723d608"), 27:var_bb38571cca0414f[4], 28:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_92939ab8dccb3d82"), 29:location, 30:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_dc0d981f2d59d210"), 31:var_fcf7b6e6d8c41c8, 32:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"match_id"), 33:function_94c7ae7049488358(), 34:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"objective_time"), 35:objtime];
    /#
        function_7d97a2a745e514c4(var_a7a6077754bbc2f8, params);
    #/
    player reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5024
// Size: 0x10
function function_8df2c1c1377b79be(var_b87f7fae01ce754f) {
    return var_b87f7fae01ce754f * 10;
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x503c
// Size: 0x99
function function_dc52e14b64052dda(lootid, quantity) {
    if (isdefined(lootid)) {
        scriptablename = loot::getscriptablefromlootid(lootid);
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

// Namespace challenges/namespace_aad14af462a74d08
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50dd
// Size: 0x39d
function function_1ba256da09a9878a(player, lootid, var_a0ce8000d303764c, var_5577636292591c8b, quantity, var_b87f7fae01ce754f, var_e7d05247043893ad, var_f237807396377232) {
    if (!player challengesenabledforplayer()) {
        return;
    }
    gametype = function_17c5d7feb226e256();
    gamemode = getchallengegamemode(player);
    var_99bd169488e48ac1 = 0;
    typeid = 0;
    if (!isdefined(var_f237807396377232)) {
        if (isdefined(var_a0ce8000d303764c)) {
            var_99bd169488e48ac1 = namespace_ec6836c9475c9d18::function_7042dad035dc176c(var_a0ce8000d303764c);
        }
        if (isdefined(lootid)) {
            typeid = function_c43d8b7a5461cdce(lootid);
        } else if (isdefined(var_5577636292591c8b)) {
            typeid = namespace_ec6836c9475c9d18::function_7042dad035dc176c(var_5577636292591c8b);
        }
        quantity = function_dc52e14b64052dda(lootid, quantity);
        var_b87f7fae01ce754f = function_8df2c1c1377b79be(var_b87f7fae01ce754f);
    }
    location = 0;
    var_fcf7b6e6d8c41c8 = 0;
    if (isdefined(self.var_da28916e7827af7c)) {
        location = getlocation(function_5b2c23ea4889f30b(self.var_da28916e7827af7c));
        var_fcf7b6e6d8c41c8 = function_55be16fb0f5f4a19(function_5b2c23ea4889f30b(self.var_da28916e7827af7c));
    }
    var_7c6183ce9e04512e = #"hash_90993ca8dac666d3";
    var_3fcdc20d65de43cd = 0;
    var_7d9803744a905b95 = 0;
    var_48c0c20123a7896a = 0;
    if (isdefined(var_f237807396377232)) {
        var_3fcdc20d65de43cd = var_f237807396377232.rarity;
        var_7d9803744a905b95 = var_f237807396377232.var_7d9803744a905b95;
        var_48c0c20123a7896a = var_f237807396377232.var_5c63b3413b883ca7;
    }
    gamemode = function_68ffb11dc4c6b979(gamemode, var_7c6183ce9e04512e);
    gametype = function_68ffb11dc4c6b979(gametype, var_7c6183ce9e04512e);
    typeid = function_68ffb11dc4c6b979(typeid, var_7c6183ce9e04512e);
    location = function_68ffb11dc4c6b979(location, var_7c6183ce9e04512e);
    var_fcf7b6e6d8c41c8 = function_68ffb11dc4c6b979(var_fcf7b6e6d8c41c8, var_7c6183ce9e04512e);
    var_3fcdc20d65de43cd = function_68ffb11dc4c6b979(var_3fcdc20d65de43cd, var_7c6183ce9e04512e);
    quantity = function_68ffb11dc4c6b979(quantity, var_7c6183ce9e04512e);
    var_e7d05247043893ad = function_68ffb11dc4c6b979(var_e7d05247043893ad, var_7c6183ce9e04512e);
    var_99bd169488e48ac1 = function_68ffb11dc4c6b979(var_99bd169488e48ac1, var_7c6183ce9e04512e);
    lootid = function_68ffb11dc4c6b979(lootid, var_7c6183ce9e04512e);
    var_b87f7fae01ce754f = function_68ffb11dc4c6b979(var_b87f7fae01ce754f, var_7c6183ce9e04512e);
    var_7d9803744a905b95 = function_68ffb11dc4c6b979(var_7d9803744a905b95, var_7c6183ce9e04512e);
    var_48c0c20123a7896a = function_68ffb11dc4c6b979(var_48c0c20123a7896a, var_7c6183ce9e04512e);
    params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_ad78fa4f448cdf42"), 3:var_99bd169488e48ac1, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"value"), 5:quantity, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 7:gamemode, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 9:gametype, 10:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"loot_id"), 11:lootid, 12:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_d7806c74c1d4a500"), 13:typeid, 14:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_60b4c2039c94d60c"), 15:var_b87f7fae01ce754f, 16:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_80f9b45ba3e6882e"), 17:var_e7d05247043893ad, 18:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_92939ab8dccb3d82"), 19:location, 20:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_dc0d981f2d59d210"), 21:var_fcf7b6e6d8c41c8, 22:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_48f6b92ad0c610b2"), 23:var_3fcdc20d65de43cd, 24:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e6b742f2dbcdaa7a"), 25:var_7d9803744a905b95, 26:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_c1df2daa62247afe"), 27:var_48c0c20123a7896a];
    function_8e81148472fb520a(player, var_7c6183ce9e04512e, params);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5481
// Size: 0x16a
function function_affb3af6af110594(player, var_af0662d6485d5d58, poi) {
    gametype = function_17c5d7feb226e256();
    gamemode = getchallengegamemode(player);
    location = 0;
    var_fcf7b6e6d8c41c8 = 0;
    if (isdefined(poi)) {
        location = getlocation(poi);
        var_fcf7b6e6d8c41c8 = function_55be16fb0f5f4a19(poi);
    }
    var_7c6183ce9e04512e = #"hash_79a1f2a3be7b1ebd";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"value"), 3:1, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 5:gamemode, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 7:gametype, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"activity_type"), 9:var_af0662d6485d5d58 namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_92939ab8dccb3d82"), 10:location, 11:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_dc0d981f2d59d210"), 12:var_fcf7b6e6d8c41c8];
    /#
        function_7d97a2a745e514c4(var_a7a6077754bbc2f8, params);
    #/
    player reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55f2
// Size: 0x16a
function function_2635cdb5e985eaab(player, var_af0662d6485d5d58, poi) {
    gametype = function_17c5d7feb226e256();
    gamemode = getchallengegamemode(player);
    location = 0;
    var_fcf7b6e6d8c41c8 = 0;
    if (isdefined(poi)) {
        location = getlocation(poi);
        var_fcf7b6e6d8c41c8 = function_55be16fb0f5f4a19(poi);
    }
    var_7c6183ce9e04512e = #"hash_9fc2564f412be74e";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"value"), 3:1, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 5:gamemode, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 7:gametype, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"activity_type"), 9:var_af0662d6485d5d58 namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_92939ab8dccb3d82"), 10:location, 11:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_dc0d981f2d59d210"), 12:var_fcf7b6e6d8c41c8];
    /#
        function_7d97a2a745e514c4(var_a7a6077754bbc2f8, params);
    #/
    player reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5763
// Size: 0x158
function function_f4d8c689aaf296e5(player, weapon, var_ed76db33212e6a92, var_ae0f808555c671f9) {
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
    var_6ae633608e2ad8ee = var_ed76db33212e6a92 + var_ae0f808555c671f9;
    var_7c6183ce9e04512e = #"weapon_damage";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 3:gamemode, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 5:gametype, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_a0dd9c7405f2d85e"), 7:var_b28608820870666, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"value"), 9:var_6ae633608e2ad8ee];
    /#
        function_7d97a2a745e514c4(var_a7a6077754bbc2f8, params);
    #/
    player reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58c2
// Size: 0x2e5
function function_4ab6f9fba6bb9cc5(player, var_ed76db33212e6a92, var_ae0f808555c671f9) {
    if (!player challengesenabledforplayer()) {
        return;
    }
    if (isagent(player)) {
        return;
    }
    if (!isdefined(var_ed76db33212e6a92)) {
        var_ed76db33212e6a92 = 0;
    }
    var_ed76db33212e6a92 = int(var_ed76db33212e6a92);
    if (!isdefined(var_ae0f808555c671f9)) {
        var_ae0f808555c671f9 = 0;
    }
    var_ae0f808555c671f9 = int(var_ae0f808555c671f9);
    var_6ddcf3c092eaf383 = level.var_ec851999e0e99879;
    if (!isdefined(var_6ddcf3c092eaf383)) {
        var_6ddcf3c092eaf383 = function_6b7aeb2012efc4af();
    }
    var_7c6183ce9e04512e = #"damaged";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    if (!isdefined(level.var_1511634f42f188a6)) {
        level.var_1511634f42f188a6 = [];
    }
    if (!isdefined(level.var_a7f8fb431b350d82)) {
        level.var_a7f8fb431b350d82 = [];
    }
    if (!istrue(level.var_a7f8fb431b350d82[#"hash_e4fafe747c649576"])) {
        level.var_1511634f42f188a6[#"version"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version");
        level.var_1511634f42f188a6[#"gamemode"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode");
        level.var_1511634f42f188a6[#"gametype"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype");
        level.var_1511634f42f188a6[#"damage_type"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"damage_type");
        level.var_1511634f42f188a6[#"value"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"value");
        level.var_1511634f42f188a6[#"hash_2330531abd5ccdac"] = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"damage_type", #"health");
        level.var_1511634f42f188a6[#"hash_756cdafda9ab288d"] = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"damage_type", #"armor");
    }
    var_acfb29aa2dab39ac = level.var_1511634f42f188a6;
    var_eeff650640a93fe1 = 0;
    if (var_ed76db33212e6a92 > 0) {
        var_eeff650640a93fe1 = function_6d40f12a09494350(var_eeff650640a93fe1, var_acfb29aa2dab39ac[#"hash_2330531abd5ccdac"]);
    }
    if (var_ae0f808555c671f9 > 0) {
        var_eeff650640a93fe1 = function_6d40f12a09494350(var_eeff650640a93fe1, var_acfb29aa2dab39ac[#"hash_756cdafda9ab288d"]);
    }
    eventparams = [0:var_acfb29aa2dab39ac[#"version"], 1:1, 2:var_acfb29aa2dab39ac[#"gamemode"], 3:var_6ddcf3c092eaf383.gamemode, 4:var_acfb29aa2dab39ac[#"gametype"], 5:var_6ddcf3c092eaf383.gametype, 6:var_acfb29aa2dab39ac[#"damage_type"], 7:var_eeff650640a93fe1, 8:var_acfb29aa2dab39ac[#"value"], 9:var_ed76db33212e6a92 + var_ae0f808555c671f9];
    /#
        function_7d97a2a745e514c4(var_a7a6077754bbc2f8, eventparams);
    #/
    player reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, eventparams);
}

// Namespace challenges/namespace_aad14af462a74d08
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
    var_904c82687ddfeb02 = weapon::function_9c331f88be5a1478(weapon);
    if (!isdefined(var_b28608820870666) || !isdefined(var_904c82687ddfeb02)) {
        return;
    }
    gamemode = getchallengegamemode(player);
    gametype = function_17c5d7feb226e256();
    var_7c6183ce9e04512e = #"reload";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    var_c78bf6b063fc5789 = function_53c4c53197386572(player.var_c78bf6b063fc5789, 0);
    params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 3:gamemode, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 5:gametype, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_a0dd9c7405f2d85e"), 7:var_b28608820870666, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_786f9c01adc0d384"), 9:var_904c82687ddfeb02, 10:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_365c4ef34bc9c239"), 11:var_c78bf6b063fc5789];
    /#
        function_7d97a2a745e514c4(var_a7a6077754bbc2f8, params);
    #/
    reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d3d
// Size: 0xce
function function_fb2db8647d693699(player) {
    if (!player challengesenabledforplayer()) {
        return;
    }
    gamemode = getchallengegamemode(player);
    gametype = function_17c5d7feb226e256();
    var_7c6183ce9e04512e = #"downed";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 3:gamemode, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 5:gametype];
    /#
        function_7d97a2a745e514c4(var_a7a6077754bbc2f8, params);
    #/
    player reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e12
// Size: 0xf6
function function_b8e86c6dea0ac027(player, streak) {
    if (!player challengesenabledforplayer()) {
        return;
    }
    gamemode = getchallengegamemode(player);
    gametype = function_17c5d7feb226e256();
    var_7c6183ce9e04512e = #"squad_wiped";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 3:gamemode, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 5:gametype];
    if (isdefined(streak)) {
        params[params.size] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_7399c3c6a8e2d7c0");
        params[params.size] = streak;
    }
    function_7d97a2a745e514c4(var_a7a6077754bbc2f8, params);
    player reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
}

// Namespace challenges/namespace_aad14af462a74d08
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
        teamsize = namespace_36f464722d326bbe::function_4fb37368ae3585bb();
    }
    var_9c98419964190a71 = istrue(level.var_1147bbc93ea9b83c);
    var_7c6183ce9e04512e = #"death";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 3:gamemode, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 5:gametype, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"team_size"), 7:teamsize, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_7b4e654ec1d01385"), 9:var_9c98419964190a71];
    /#
        function_7d97a2a745e514c4(var_a7a6077754bbc2f8, params);
    #/
    reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x607e
// Size: 0xcc
function function_868b6d4fbec3938c(player) {
    if (!challengesenabledforplayer()) {
        return;
    }
    gamemode = getchallengegamemode(player);
    gametype = function_17c5d7feb226e256();
    var_7c6183ce9e04512e = #"hash_672d2c0185c09e4e";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 3:gamemode, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 5:gametype];
    /#
        function_7d97a2a745e514c4(var_a7a6077754bbc2f8, params);
    #/
    reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6151
// Size: 0x113
function function_5d99311b5a7dffda() {
    var_4fd3df97f86a664c = getdvarint(@"hash_bd0f7ad1bb2671a5", -1);
    if (var_4fd3df97f86a664c >= 0) {
        return var_4fd3df97f86a664c;
    }
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
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

// Namespace challenges/namespace_aad14af462a74d08
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
            var_904c82687ddfeb02 = undefined;
            if (isdefined(attacker.primaryweaponobj)) {
                var_904c82687ddfeb02 = weapon::function_9c331f88be5a1478(attacker.primaryweaponobj);
            }
            if (!isdefined(var_904c82687ddfeb02)) {
                var_904c82687ddfeb02 = 0;
            }
            if (issharedfuncdefined("weapons", "recommendedStatusBySeason")) {
                var_2420b2d3569c0c6 = [[ utility::getsharedfunc("weapons", "recommendedStatusBySeason") ]](attacker.primaryweaponobj, attacker);
                var_158bd631747ae80 = 0;
                if (isdefined(var_2420b2d3569c0c6)) {
                    if (var_2420b2d3569c0c6[0]) {
                        var_158bd631747ae80 = function_6d40f12a09494350(var_158bd631747ae80, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_2d6d28e2d2af4ddc", #"recommended_season_0"));
                    }
                    if (var_2420b2d3569c0c6[1]) {
                        var_158bd631747ae80 = function_6d40f12a09494350(var_158bd631747ae80, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_2d6d28e2d2af4ddc", #"recommended_season_1"));
                    }
                    if (var_2420b2d3569c0c6[2]) {
                        var_158bd631747ae80 = function_6d40f12a09494350(var_158bd631747ae80, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_2d6d28e2d2af4ddc", #"recommended_season_2"));
                    }
                    if (var_2420b2d3569c0c6[3]) {
                        var_158bd631747ae80 = function_6d40f12a09494350(var_158bd631747ae80, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_2d6d28e2d2af4ddc", #"recommended_season_3"));
                    }
                    if (var_2420b2d3569c0c6[4]) {
                        var_158bd631747ae80 = function_6d40f12a09494350(var_158bd631747ae80, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_2d6d28e2d2af4ddc", #"recommended_season_4"));
                    }
                    if (var_2420b2d3569c0c6[5]) {
                        var_158bd631747ae80 = function_6d40f12a09494350(var_158bd631747ae80, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_2d6d28e2d2af4ddc", #"recommended_season_5"));
                    }
                    if (var_2420b2d3569c0c6[6]) {
                        var_158bd631747ae80 = function_6d40f12a09494350(var_158bd631747ae80, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_2d6d28e2d2af4ddc", #"recommended_season_6"));
                    }
                }
            }
            weaponclassarray = function_5af37ce2c176c946();
            var_b28608820870666 = 0;
            var_b28608820870666 = function_ce112254f7cba89e(attacker.primaryweaponobj);
            var_9c98419964190a71 = istrue(level.var_1147bbc93ea9b83c);
            var_7c6183ce9e04512e = #"assist";
            var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
            params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 3:gamemode, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 5:gametype, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_a0dd9c7405f2d85e"), 7:var_b28608820870666, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_786f9c01adc0d384"), 9:var_904c82687ddfeb02, 10:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_ab2e7c9b727a3d6c"), 11:var_3fff36caeace1b84, 12:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_2d6d28e2d2af4ddc"), 13:var_158bd631747ae80, 14:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_7b4e654ec1d01385"), 15:var_9c98419964190a71];
            /#
                function_7d97a2a745e514c4(var_a7a6077754bbc2f8, params);
            #/
            attacker reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
        }
    }
}

// Namespace challenges/namespace_aad14af462a74d08
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
            var_9c98419964190a71 = istrue(level.var_1147bbc93ea9b83c);
            var_7c6183ce9e04512e = #"hash_fd6dc0a51fc82dcd";
            var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
            params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 3:gamemode, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 5:gametype, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_ab2e7c9b727a3d6c"), 7:var_3fff36caeace1b84, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_7b4e654ec1d01385"), 9:var_9c98419964190a71];
            /#
                function_7d97a2a745e514c4(var_a7a6077754bbc2f8, params);
            #/
            var_815f9c7c319d9eac reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
        }
    }
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67d2
// Size: 0x7f
function function_d8f43796d36ed5bf(ref, source) {
    if (!challengesenabledforplayer()) {
        return;
    }
    var_7c6183ce9e04512e = #"hash_4d1091c42d080753";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1];
    /#
        function_7d97a2a745e514c4(var_a7a6077754bbc2f8, params);
    #/
    reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
}

// Namespace challenges/namespace_aad14af462a74d08
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
    var_a74fc57fb4a4d3e6 = function_aff35122a61a900b(self.team);
    if (!isdefined(var_a74fc57fb4a4d3e6)) {
        var_a74fc57fb4a4d3e6 = 0;
    }
    var_6fb9cc872b9f6eb3 = loot::getlootidfromref(ref);
    var_35529beecc177a27 = function_3ea2b9fa713d6ed3(self);
    var_7c6183ce9e04512e = #"hash_a61186865297432d";
    gametype = function_68ffb11dc4c6b979(gametype, var_7c6183ce9e04512e);
    gamemode = function_68ffb11dc4c6b979(gamemode, var_7c6183ce9e04512e);
    total_kills = function_68ffb11dc4c6b979(total_kills, var_7c6183ce9e04512e);
    var_a74fc57fb4a4d3e6 = function_68ffb11dc4c6b979(var_a74fc57fb4a4d3e6, var_7c6183ce9e04512e);
    var_6fb9cc872b9f6eb3 = function_68ffb11dc4c6b979(var_6fb9cc872b9f6eb3, var_7c6183ce9e04512e);
    var_35529beecc177a27 = function_68ffb11dc4c6b979(var_35529beecc177a27, var_7c6183ce9e04512e);
    bitfield = function_68ffb11dc4c6b979(bitfield, var_7c6183ce9e04512e);
    function_8e81148472fb520a(self, var_7c6183ce9e04512e, [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 1:gamemode, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 3:gametype, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_d404f427903135e"), 5:total_kills, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_834ae5ef756e04aa"), 7:var_a74fc57fb4a4d3e6, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_797a1495585997f4"), 9:bitfield, 10:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 11:1, 12:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_786f9c01adc0d384"), 13:var_6fb9cc872b9f6eb3, 14:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_bd518e95df4103fe"), 15:var_35529beecc177a27]);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a40
// Size: 0x73
function function_68ffb11dc4c6b979(value, var_7c6183ce9e04512e) {
    if (isdefined(value) && !isint(value) && !isstring(value)) {
        /#
            println("<unknown string>" + value + "<unknown string>" + function_3c8848a3a11b2553(var_7c6183ce9e04512e));
        #/
        return int(0);
    }
    if (!isdefined(value)) {
        /#
            println("<unknown string>" + function_3c8848a3a11b2553(var_7c6183ce9e04512e));
        #/
        return int(0);
    }
    return value;
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6abb
// Size: 0x216
function function_d997435895422ecc(ref, var_363274577dc0543e, value) {
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
    var_fcf7b6e6d8c41c8 = 0;
    if (isdefined(self.var_da28916e7827af7c)) {
        location = getlocation(function_5b2c23ea4889f30b(self.var_da28916e7827af7c));
        var_fcf7b6e6d8c41c8 = function_55be16fb0f5f4a19(function_5b2c23ea4889f30b(self.var_da28916e7827af7c));
    }
    var_7fb63b7fac6d1698 = function_3ea2b9fa713d6ed3(self);
    bitfield = 0;
    bitfield = function_6d40f12a09494350(bitfield, var_363274577dc0543e);
    var_7c6183ce9e04512e = #"field_upgrade";
    function_8e81148472fb520a(self, var_7c6183ce9e04512e, [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 1:gamemode, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 3:gametype, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"value"), 5:value, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 7:1, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"loot_id"), 9:var_335ba1ebe269094, 10:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_83a2d67994d7e295"), 11:bitfield, 12:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_92939ab8dccb3d82"), 13:location, 14:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_dc0d981f2d59d210"), 15:var_fcf7b6e6d8c41c8, 16:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_bd518e95df4103fe"), 17:var_7fb63b7fac6d1698]);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6cd8
// Size: 0xa0
function function_bd59aa7e8cece1ab(ref, value) {
    if (!challengesenabledforplayer()) {
        return;
    }
    field_upgrade = ref;
    amount = value;
    var_7c6183ce9e04512e = #"hash_4d0325c2cf7a83ad";
    function_8e81148472fb520a(self, var_7c6183ce9e04512e, [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_ad78fa4f448cdf42"), 3:field_upgrade, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"value"), 5:amount]);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6d7f
// Size: 0x1ae
function oncapture(modifiers) {
    if (!isplayer(self)) {
        if (istrue(level.var_c48ab672d4fb36a) && isdefined(self.subclass) && self.subclass == "capture_bot" || !istrue(level.var_c48ab672d4fb36a) && issharedfuncdefined("super_capture_bot", "captureBot_isGrenadeEntity") && function_f3bb4f4911a1beb2("super_capture_bot", "captureBot_isGrenadeEntity")) {
            owner = self.owner;
            if (utility::issharedfuncdefined("player", "getCurrentSuperRef")) {
                var_ebec497ff8b18a45 = owner [[ utility::getsharedfunc("player", "getCurrentSuperRef") ]]();
                lootid = loot::getlootidfromref(var_ebec497ff8b18a45);
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
    var_7c6183ce9e04512e = #"capture";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"loot_id"), 3:lootid, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"value"), 5:1, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 7:getchallengegamemode(), 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 9:function_17c5d7feb226e256()];
    owner reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f34
// Size: 0xa4
function function_c51330573171a1be(player) {
    if (!player challengesenabledforplayer()) {
        return;
    }
    gamemode = getchallengegamemode(player);
    gametype = function_17c5d7feb226e256();
    var_7c6183ce9e04512e = #"defuse";
    function_8e81148472fb520a(player, var_7c6183ce9e04512e, [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 3:gamemode, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 5:gametype]);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6fdf
// Size: 0xd
function onplant() {
    function_4fb61d33f02e8203(self, 1);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ff3
// Size: 0xe9
function function_f05d761dc1bfa1b5() {
    if (!challengesenabledforplayer()) {
        return;
    }
    var_7c6183ce9e04512e = #"hash_372efa96b8695b65";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    var_904c82687ddfeb02 = undefined;
    if (isdefined(self.currentprimaryweapon)) {
        var_904c82687ddfeb02 = weapon::function_9c331f88be5a1478(self.currentprimaryweapon);
    }
    if (!isdefined(var_904c82687ddfeb02)) {
        var_904c82687ddfeb02 = 0;
    }
    params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 3:getchallengegamemode(), 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 5:function_17c5d7feb226e256(), 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_786f9c01adc0d384"), 7:var_904c82687ddfeb02];
    reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x70e3
// Size: 0x84
function onstun(equipment) {
    if (!challengesenabledforplayer()) {
        return;
    }
    var_7c6183ce9e04512e = #"stun";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e2a522a357642b64"), 1:equipment, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 3:1];
    reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x716e
// Size: 0x84
function onstim(var_6c53f7d5fc456351) {
    if (!challengesenabledforplayer()) {
        return;
    }
    var_7c6183ce9e04512e = #"stim";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"value"), 1:var_6c53f7d5fc456351, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 3:1];
    reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
}

// Namespace challenges/namespace_aad14af462a74d08
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
    var_7c6183ce9e04512e = #"hack";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    owner = self;
    var_6172623b415f2e5e = 0;
    var_5ea1e2f4234ceef0 = 0;
    if (isdefined(self.equipmentref) && self.equipmentref == "equip_capture_bot") {
        owner = self.owner;
        if (utility::issharedfuncdefined("player", "getCurrentSuperRef")) {
            var_ebec497ff8b18a45 = owner [[ utility::getsharedfunc("player", "getCurrentSuperRef") ]]();
            var_6172623b415f2e5e = loot::getlootidfromref(var_ebec497ff8b18a45);
        }
    }
    if (isdefined(getlootidfromref(equipment))) {
        var_5ea1e2f4234ceef0 = getlootidfromref(equipment);
    }
    params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_1e968d7574076fcd"), 3:var_5ea1e2f4234ceef0, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"loot_id"), 5:var_6172623b415f2e5e, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 7:getchallengegamemode(), 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 9:function_17c5d7feb226e256()];
    owner reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
}

// Namespace challenges/namespace_aad14af462a74d08
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

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7495
// Size: 0x12a
function gettouchingspraylocaletriggers(player) {
    if (!isdefined(level.localetriggers)) {
        return -1;
    }
    foreach (trigger in level.localetriggers) {
        if (player istouching(trigger)) {
            var_8f194056385ae0a7 = isdefined(trigger.sprayid) && trigger.sprayid > -1;
            var_50ba7204daa28034 = isdefined(player.sprayed) && player.sprayed & 1 << trigger.sprayid;
            if (var_8f194056385ae0a7 && !var_50ba7204daa28034) {
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

// Namespace challenges/namespace_aad14af462a74d08
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75c7
// Size: 0x1b5
function oncontractstart(contractid, var_a705a5a5884ebf9c) {
    if (!challengesenabledforplayer()) {
        return;
    }
    gamemode = getchallengegamemode(self);
    gametype = function_17c5d7feb226e256();
    var_a74fc57fb4a4d3e6 = function_aff35122a61a900b(self.team);
    location = 0;
    var_fcf7b6e6d8c41c8 = 0;
    if (isdefined(var_a705a5a5884ebf9c) && isdefined(var_a705a5a5884ebf9c.var_da28916e7827af7c)) {
        location = getlocation(function_5b2c23ea4889f30b(var_a705a5a5884ebf9c.var_da28916e7827af7c));
        var_fcf7b6e6d8c41c8 = function_55be16fb0f5f4a19(function_5b2c23ea4889f30b(var_a705a5a5884ebf9c.var_da28916e7827af7c));
    }
    var_7c6183ce9e04512e = #"contract_start";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 3:gamemode, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 5:gametype, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"value"), 7:contractid, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_578439261b0ec47b"), 9:var_a74fc57fb4a4d3e6, 10:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_92939ab8dccb3d82"), 11:location, 12:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_dc0d981f2d59d210"), 13:var_fcf7b6e6d8c41c8];
    /#
        function_7d97a2a745e514c4(var_a7a6077754bbc2f8, params);
    #/
    reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7783
// Size: 0x324
function oncontractend(contractid, completed, var_1229758a8a60ba86, var_cdbb609588ac1fbb) {
    if (!challengesenabledforplayer()) {
        return;
    }
    gamemode = getchallengegamemode(self);
    gametype = function_17c5d7feb226e256();
    var_a74fc57fb4a4d3e6 = function_aff35122a61a900b(self.team);
    location = 0;
    var_fcf7b6e6d8c41c8 = 0;
    if (isdefined(var_cdbb609588ac1fbb)) {
        location = getlocation(var_cdbb609588ac1fbb);
        var_fcf7b6e6d8c41c8 = function_55be16fb0f5f4a19(var_cdbb609588ac1fbb);
    }
    var_98ffdd148b962576 = 0;
    if (isalive(self)) {
        var_98ffdd148b962576 = function_6d40f12a09494350(var_98ffdd148b962576, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_bf1744b6c07743aa", #"alive"));
    }
    if (completed) {
        var_98ffdd148b962576 = function_6d40f12a09494350(var_98ffdd148b962576, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_bf1744b6c07743aa", #"completed"));
    } else {
        var_98ffdd148b962576 = function_6d40f12a09494350(var_98ffdd148b962576, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_bf1744b6c07743aa", #"failed"));
    }
    if (var_1229758a8a60ba86 == 1) {
        var_98ffdd148b962576 = function_6d40f12a09494350(var_98ffdd148b962576, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_bf1744b6c07743aa", #"team1"));
    } else if (var_1229758a8a60ba86 == 2) {
        var_98ffdd148b962576 = function_6d40f12a09494350(var_98ffdd148b962576, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_bf1744b6c07743aa", #"team2"));
    }
    var_bb38571cca0414f = function_c1945f26d99b0ed9(self);
    var_7c6183ce9e04512e = #"hash_37e7fee4c79581a9";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 3:gamemode, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 5:gametype, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"value"), 7:contractid, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_578439261b0ec47b"), 9:var_a74fc57fb4a4d3e6, 10:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_92939ab8dccb3d82"), 11:location, 12:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_dc0d981f2d59d210"), 13:var_fcf7b6e6d8c41c8, 14:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_bf1744b6c07743aa"), 15:var_98ffdd148b962576, 16:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_f3287b83e723dcd4"), 17:var_bb38571cca0414f[0], 18:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_f3287c83e723de87"), 19:var_bb38571cca0414f[1], 20:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_f3287d83e723e03a"), 21:var_bb38571cca0414f[2], 22:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_f3287e83e723e1ed"), 23:var_bb38571cca0414f[3], 24:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_f3287783e723d608"), 25:var_bb38571cca0414f[4]];
    /#
        function_7d97a2a745e514c4(var_a7a6077754bbc2f8, params);
    #/
    reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7aae
// Size: 0x547
function private function_417907aeeb08baac(var_d0e95c16b3f9546e) {
    switch (var_d0e95c16b3f9546e) {
    case #"hash_6d3a7f28d4e30af0":
        return function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"hash_a3bfdcce6f11683d"));
    case #"hash_2808ce3c4558142d":
    case #"hash_93553b29704c0d3":
        return function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"hash_45c41c3b2e6d475a"));
    case #"hash_2cbf29aaf45c022d":
        return function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"hash_5fb570df55c517fb"));
    case #"hash_44904bb5898785d9":
        return function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"computer"));
    case #"hash_8387e0bfe22abc5d":
    case #"hash_f1db14019ca6a516":
        return function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"dmz_dead_drop"));
    case #"hash_3b6111354af78459":
    case #"hash_8193a20e7851382b":
    case #"hash_a7972bf23ae4418b":
        return function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"hash_b7a47ac5e86a7c8"));
    case #"hash_be635d272d652f68":
    case #"hash_42af86e7be283722":
    case #"hash_8756bee9b861200":
    case #"hash_1c5319d275640df":
        return function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"dmz_safe"));
    case #"hash_5fb47d4344357148":
        return function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"hash_4b14731043e2457a"));
    case #"hash_993262832973e0d":
    case #"hash_61f36140da68c992":
    case #"hash_5fe210289499bd6e":
        return function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"dmz_supply_drop"));
    case #"hash_15ffdff5c5e4cca2":
        return function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"hash_711c2ddf8582b207"));
    case #"hash_7635d9926e3b434":
    case #"hash_763609926e3b8ed":
        return function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"hash_64f687fff06916de"));
    case #"hash_50e52e4dc37fb7a8":
        return function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"hash_40ad471432d12503"));
    case #"hash_a6fd900b15b2be21":
    case #"hash_acc339f27e6535d8":
    case #"hash_acc33cf27e653a91":
    case #"hash_bd0a50437d51e6e7":
    case #"hash_bd0a51437d51e87a":
    case #"hash_8a31c0680349ff7b":
        return function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"hash_a9c1a9a872d57cb4"));
    case #"hash_f5264031983561d3":
    case #"hash_f526413198356366":
        return function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"locker"));
    case #"hash_9c4e1145f143be53":
    case #"hash_ac6eb824cf784951":
    case #"hash_ac6eb924cf784ae4":
    case #"hash_fd428ac2a2886e03":
    case #"hash_fd428fc2a28875e2":
        return function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"hash_73cc9cc7141597e"));
    case #"hash_f086d807b107cbfd":
        return function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"hash_ce6082b2d94b54da"));
    case #"hash_469a90a45e97eda9":
        return function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"hash_e57057f8c389d76"));
    case #"hash_c82c626607f41c61":
        return function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"hash_49d76238ba69c8ba"));
    case #"hash_183cb58bad34bd86":
    case #"hash_33a1ab3969e0b64e":
    case #"hash_b5b4216883bf84b8":
    case #"hash_b1814c3921b5bcf2":
        return function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"pack"));
    case #"hash_19ba8d41970911ad":
    case #"hash_8944097b14faec32":
    case #"hash_4ca1dc2e1b0de0d3":
    case #"hash_4654cfd269b6fc02":
    case #"hash_417c605750c7baa5":
    case #"hash_9c5f01407ae504fc":
    case #"hash_a10a247457819cda":
        return function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"hash_5d46732677b9c784"));
    case #"hash_4c9cda73b7cb8b41":
        return function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"hash_a423bb2fde5e9441"));
    case #"hash_1a50c41f80fb532b":
        return function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_1e306cba757eda6f", #"hash_d594288b25c9fc26"));
    default:
        return 0;
        break;
    }
}

// Namespace challenges/namespace_aad14af462a74d08
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
    var_a74fc57fb4a4d3e6 = function_aff35122a61a900b(self.team);
    location = 0;
    var_fcf7b6e6d8c41c8 = 0;
    if (isdefined(self.var_da28916e7827af7c)) {
        location = getlocation(function_5b2c23ea4889f30b(self.var_da28916e7827af7c));
        var_fcf7b6e6d8c41c8 = function_55be16fb0f5f4a19(function_5b2c23ea4889f30b(self.var_da28916e7827af7c));
    }
    var_8f3a85e26344fedf = function_417907aeeb08baac(instance.type);
    var_b17708bcdca61ba6 = 0;
    var_b17708bcdca61ba6 = function_6d40f12a09494350(var_b17708bcdca61ba6, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_f42835693a3d7da5", #"hash_d77de70746f0150e"));
    var_7c6183ce9e04512e = #"loot_cache";
    function_8e81148472fb520a(self, var_7c6183ce9e04512e, [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 3:gamemode, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 5:gametype, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_578439261b0ec47b"), 7:var_a74fc57fb4a4d3e6, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_92939ab8dccb3d82"), 9:location, 10:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_dc0d981f2d59d210"), 11:var_fcf7b6e6d8c41c8, 12:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_1e306cba757eda6f"), 13:var_8f3a85e26344fedf, 14:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_f42835693a3d7da5"), 15:var_b17708bcdca61ba6]);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81f3
// Size: 0x64
function onkioskpurchaseitem(var_7e1bfbe3f25f5583, var_cb325ddb4a764623, lootid, quantity, var_b87f7fae01ce754f) {
    var_707bc435f8518b62 = function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_80f9b45ba3e6882e", #"buy"));
    function_1ba256da09a9878a(self, lootid, var_cb325ddb4a764623, var_7e1bfbe3f25f5583, quantity, var_b87f7fae01ce754f, var_707bc435f8518b62);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x825e
// Size: 0x6e
function function_ea50038423fc4cfc(var_7e1bfbe3f25f5583, var_cb325ddb4a764623, lootid, quantity, var_b87f7fae01ce754f, var_f237807396377232) {
    var_707bc435f8518b62 = function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_80f9b45ba3e6882e", #"hash_2d19df18d4078885"));
    function_1ba256da09a9878a(self, lootid, var_cb325ddb4a764623, var_7e1bfbe3f25f5583, quantity, var_b87f7fae01ce754f, var_707bc435f8518b62, var_f237807396377232);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82d3
// Size: 0x9c
function function_7ba17fb69c312e2c(var_7e1bfbe3f25f5583, var_cb325ddb4a764623, lootid, quantity, var_b87f7fae01ce754f) {
    var_707bc435f8518b62 = function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_80f9b45ba3e6882e", #"hash_debb6ea6c4e2f4d9"));
    function_1ba256da09a9878a(self, lootid, var_cb325ddb4a764623, var_7e1bfbe3f25f5583, quantity, var_b87f7fae01ce754f, var_707bc435f8518b62);
    var_d739aa04b56dc7ad = function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_2af1f13aa6ae3b5f", #"loot"));
    function_d24138b32084fc3e(self, lootid, var_7e1bfbe3f25f5583, var_d739aa04b56dc7ad, quantity);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8376
// Size: 0x64
function function_c2c80007aff49924(var_7e1bfbe3f25f5583, var_cb325ddb4a764623, lootid, quantity, var_b87f7fae01ce754f) {
    var_707bc435f8518b62 = namespace_aad14af462a74d08::function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_80f9b45ba3e6882e", #"hash_8007c41db906acd9"));
    function_1ba256da09a9878a(self, lootid, var_cb325ddb4a764623, var_7e1bfbe3f25f5583, quantity, var_b87f7fae01ce754f, var_707bc435f8518b62);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83e1
// Size: 0x64
function function_3d8a8b0878f9f129(var_7e1bfbe3f25f5583, var_cb325ddb4a764623, lootid, quantity, var_b87f7fae01ce754f) {
    var_707bc435f8518b62 = namespace_aad14af462a74d08::function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_80f9b45ba3e6882e", #"hash_23f44b864cfb53cd"));
    function_1ba256da09a9878a(self, lootid, var_cb325ddb4a764623, var_7e1bfbe3f25f5583, quantity, var_b87f7fae01ce754f, var_707bc435f8518b62);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x844c
// Size: 0x4d
function onpickupitem(var_7e1bfbe3f25f5583) {
    if (!challengesenabledforplayer()) {
        return;
    }
    var_a700f4673c85c915 = 0;
    var_455145acf02e9f8d = 0;
    if (var_7e1bfbe3f25f5583 == "weapon") {
        var_a700f4673c85c915 = 1;
    } else if (var_7e1bfbe3f25f5583 == "plunder") {
        var_455145acf02e9f8d = 1;
    }
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84a0
// Size: 0x22d
function onpickupweapon(objweapon) {
    if (!challengesenabledforplayer()) {
        return;
    }
    var_7c6183ce9e04512e = #"hash_660c7f50b46c079e";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    gamemode = getchallengegamemode(self);
    gametype = function_17c5d7feb226e256();
    var_349e390338192305 = findgunsmithattachments(objweapon);
    var_904c82687ddfeb02 = weapon::function_89a83ae9a4c4142a(objweapon);
    if (!isdefined(var_904c82687ddfeb02)) {
        var_904c82687ddfeb02 = 0;
    }
    params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 3:gamemode, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 5:gametype, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_786f9c01adc0d384"), 7:var_904c82687ddfeb02, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_af7cd8c514ea5582"), 9:var_349e390338192305[0], 10:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_af7cd7c514ea53cf"), 11:var_349e390338192305[1], 12:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_af7cd6c514ea521c"), 13:var_349e390338192305[2], 14:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_af7cd5c514ea5069"), 15:var_349e390338192305[3], 16:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_af7cd4c514ea4eb6"), 17:var_349e390338192305[4], 18:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_af7cd3c514ea4d03"), 19:var_349e390338192305[5], 20:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_af7cd2c514ea4b50"), 21:var_349e390338192305[6], 22:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_af7ce1c514ea64cd"), 23:var_349e390338192305[7], 24:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_af7ce0c514ea631a"), 25:var_349e390338192305[8], 26:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_1b7a08e28a2f9d76"), 27:var_349e390338192305[9]];
    reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86d4
// Size: 0x29
function oncollectitem(var_7e1bfbe3f25f5583) {
    if (!challengesenabledforplayer()) {
        return;
    }
    self reportchallengeuserevent("collect_item", var_7e1bfbe3f25f5583, getoperators());
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8704
// Size: 0x20
function onuseitem(type) {
    if (!challengesenabledforplayer()) {
        return;
    }
    function_cfeb523fd3aa9ecf(self, undefined, type);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x872b
// Size: 0x23
function onunlockitem(var_443f88e60a6c1697) {
    if (!challengesenabledforplayer()) {
        return;
    }
    self reportchallengeuserevent("collect_item", var_443f88e60a6c1697);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8755
// Size: 0x84
function onloadout(loadouttype) {
    if (!challengesenabledforplayer()) {
        return;
    }
    var_7c6183ce9e04512e = #"loadout";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"value"), 1:loadouttype, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 3:1];
    reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87e0
// Size: 0x16
function onping(pingtype) {
    if (!challengesenabledforplayer()) {
        return;
    }
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87fd
// Size: 0x230
function onlaststandrevive(reviver, revivee) {
    gamemode = getchallengegamemode(reviver);
    gametype = function_17c5d7feb226e256();
    if (reviver challengesenabledforplayer()) {
        var_7c6183ce9e04512e = #"revive";
        var_160460001cc37359 = 0;
        var_160460001cc37359 = function_6d40f12a09494350(var_160460001cc37359, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_c6554ef3de205884", #"reviver"));
        var_a74fc57fb4a4d3e6 = reviver function_aff35122a61a900b(reviver.team);
        if (reviver == revivee) {
            var_160460001cc37359 = function_6d40f12a09494350(var_160460001cc37359, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_c6554ef3de205884", #"revivee"));
        }
        function_8e81148472fb520a(reviver, var_7c6183ce9e04512e, [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 3:gamemode, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 5:gametype, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_578439261b0ec47b"), 7:var_a74fc57fb4a4d3e6, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_c6554ef3de205884"), 9:var_160460001cc37359]);
    }
    if (reviver != revivee && revivee challengesenabledforplayer()) {
        var_7c6183ce9e04512e = #"revive";
        var_160460001cc37359 = 0;
        var_160460001cc37359 = function_6d40f12a09494350(var_160460001cc37359, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_c6554ef3de205884", #"revivee"));
        var_a74fc57fb4a4d3e6 = revivee function_aff35122a61a900b(revivee.team);
        function_8e81148472fb520a(revivee, var_7c6183ce9e04512e, [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 3:gamemode, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 5:gametype, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_578439261b0ec47b"), 7:var_a74fc57fb4a4d3e6, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_c6554ef3de205884"), 9:var_160460001cc37359]);
    }
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a34
// Size: 0x1a5
function function_b2306d0693ba65c1(iswinner) {
    if (!challengesenabledforplayer()) {
        return;
    }
    gamemode = getchallengegamemode(self);
    gametype = function_17c5d7feb226e256();
    var_a74fc57fb4a4d3e6 = function_aff35122a61a900b(self.team);
    var_9c46b4c2597d7b03 = 0;
    if (iswinner) {
        var_9c46b4c2597d7b03 = function_6d40f12a09494350(var_9c46b4c2597d7b03, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_2614881933cc996e", #"win"));
    } else {
        var_9c46b4c2597d7b03 = function_6d40f12a09494350(var_9c46b4c2597d7b03, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_2614881933cc996e", #"loss"));
    }
    teamsize = 0;
    if (gamemode & 8) {
        teamsize = namespace_36f464722d326bbe::function_4fb37368ae3585bb();
    }
    var_7c6183ce9e04512e = #"gulag_end";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 3:gamemode, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 5:gametype, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_578439261b0ec47b"), 7:var_a74fc57fb4a4d3e6, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_2614881933cc996e"), 9:var_9c46b4c2597d7b03, 10:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"team_size"), 11:teamsize];
    /#
        function_7d97a2a745e514c4(var_a7a6077754bbc2f8, params);
    #/
    reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8be0
// Size: 0x94
function onspray() {
    if (!challengesenabledforplayer()) {
        return;
    }
    locale = gettouchingspraylocaletriggers(self);
    if (locale != -1) {
        var_7c6183ce9e04512e = #"spray";
        var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
        params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"value"), 1:locale, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 3:1];
        reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
    }
}

// Namespace challenges/namespace_aad14af462a74d08
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

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d4b
// Size: 0x298
function function_ce112254f7cba89e(objweapon) {
    weaponclassarray = function_5af37ce2c176c946();
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
    var_4bb9768282d4260d = weapon::getweaponrootname(objweapon);
    if (isdefined(level.weaponmapdata[var_4bb9768282d4260d]) && isdefined(level.weaponmapdata[var_4bb9768282d4260d].group)) {
        var_cf4209c200f8bbf4 = level.weaponmapdata[var_4bb9768282d4260d].group;
    } else {
        return 0;
    }
    var_b28608820870666 = 0;
    if (var_4bb9768282d4260d == "iw9_ar_golf3" || weaponname == "iw9_ar_schotel" || weaponname == "iw9_br_msecho" || weaponname == "iw9_br_soscar14") {
        var_b28608820870666 = function_6d40f12a09494350(var_b28608820870666, weaponclassarray["battle"]);
        return var_b28608820870666;
    }
    switch (var_cf4209c200f8bbf4) {
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
        break;
    }
    return var_b28608820870666;
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8feb
// Size: 0x79
function function_6d40f12a09494350(bitfield, bit) {
    if (!isdefined(level.var_24e5af1c3b08501f)) {
        level.var_24e5af1c3b08501f = getdvarint(@"hash_f0c3671383d467f8", 0) > 0;
    }
    if (level.var_24e5af1c3b08501f) {
        return 0;
    }
    if (!isdefined(bit)) {
        return bitfield;
    }
    if (bit > 31 || isstring(bitfield)) {
        return function_1db72f37b2e59440(bitfield + "", bit);
    } else {
        return (bitfield | 1 << bit);
    }
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x906b
// Size: 0x13f
function function_3005ef56488df9be(bitfield) {
    var_cc819de748cb6689 = bitfield + "";
    var_6d39d9505a5bd620 = var_cc819de748cb6689.size;
    characters = [];
    for (k = 0; k < var_6d39d9505a5bd620; k++) {
        characters[var_6d39d9505a5bd620 - k - 1] = int(var_cc819de748cb6689[var_6d39d9505a5bd620 - k - 1]);
    }
    var_cd2a94dbc798fbf0 = var_6d39d9505a5bd620 - 1;
    result = [];
    var_2ff1cef579ba3705 = 0;
    while (1) {
        var_1e43090ecbae17d7 = characters[var_cd2a94dbc798fbf0] % 2;
        result[var_2ff1cef579ba3705] = var_1e43090ecbae17d7 == 1;
        var_2ff1cef579ba3705 = var_2ff1cef579ba3705 + 1;
        if (var_1e43090ecbae17d7 == 1) {
            characters[var_cd2a94dbc798fbf0] = characters[var_cd2a94dbc798fbf0] - 1;
        }
        var_17c1a7159d6ce06a = 1;
        for (k = 0; k < var_6d39d9505a5bd620; k++) {
            character = characters[var_6d39d9505a5bd620 - k - 1];
            if (character != 0) {
                var_17c1a7159d6ce06a = 0;
            }
            if (character % 2 == 1) {
                characters[var_6d39d9505a5bd620 - k] = characters[var_6d39d9505a5bd620 - k] + 5;
            }
            characters[var_6d39d9505a5bd620 - k - 1] = int(character / 2);
        }
        if (var_17c1a7159d6ce06a) {
            return result;
        }
    }
}

// Namespace challenges/namespace_aad14af462a74d08
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
            } else if (isdefined(level.var_1a2b600a06ec21f4) && isdefined(level.var_1a2b600a06ec21f4.var_c7cd8a0b0b75a4f2) && level.var_1a2b600a06ec21f4.var_c7cd8a0b0b75a4f2 == "OB") {
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

// Namespace challenges/namespace_aad14af462a74d08
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

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x93c3
// Size: 0x262
function private function_261cfb5c8119ea2b(var_576499139629f6fa) {
    if (!isdefined(var_576499139629f6fa)) {
        return 0;
    }
    if (!isdefined(level.challengeandeventglobals.game_type_col) || !isdefined(level.challengeandeventglobals.game_type_col[var_576499139629f6fa])) {
        return 0;
    }
    if (getdvarint(@"hash_2be93dd484220a45", 0) == 1) {
        return namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"gametype", #"hash_ddfda95920353859");
    }
    if (getdvarint(@"hash_6f887eb688322ea9", 0)) {
        if (utility::issharedfuncdefined("game", "isBRStyleGameType")) {
            if ([[ utility::getsharedfunc("game", "isBRStyleGameType") ]]()) {
                if (isdefined(level.brgametype) && isdefined(level.brgametype.var_88f31052c5135f3b)) {
                    switch (level.brgametype.var_88f31052c5135f3b) {
                    case #"hash_59b8e9d05b31ff9":
                        return namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"gametype", #"hash_731d29529dec358d");
                    case #"hash_b4335cd2907efd5e":
                        return namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"gametype", #"hash_67fa599409d2c6d2");
                    case #"hash_c188f70415de474e":
                        return namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"gametype", #"hash_1c7e60f30e7507d2");
                    case #"hash_9b9519b2b0a96f04":
                        return namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"gametype", #"hash_e69084c35403cc98");
                    case #"hash_cfb0c3041d1bdc10":
                    case #"hash_f4afff6c03d92aa0":
                        return namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"gametype", #"hash_a418775e254600ac");
                    case #"hash_dddecc2751311914":
                        return namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"gametype", #"hash_f619a150a59cd8b8");
                    case #"hash_16dd223e5a8b22c8":
                        return namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"gametype", #"hash_1c4004bc52aa7574");
                    case #"hash_4ce2691f06f171fc":
                        return namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"gametype", #"hash_5e0811865efa4064");
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
    return level.challengeandeventglobals.game_type_col[var_576499139629f6fa];
}

// Namespace challenges/namespace_aad14af462a74d08
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
            gametype = namespace_36f464722d326bbe::getgametype();
        }
        var_e37d5a134143cc83 = function_261cfb5c8119ea2b(gametype);
        return var_e37d5a134143cc83;
    }
    return function_261cfb5c8119ea2b(level.var_62f6f7640e4431e3.var_d20acad05758f0d8);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x96b6
// Size: 0x460
function function_5af37ce2c176c946() {
    if (!isdefined(level.weaponclassarray)) {
        level.weaponclassarray = spawnstruct();
        level.weaponclassarray.classes = [];
        level.weaponclassarray.classes["none"] = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"none");
        level.weaponclassarray.classes["sniper"] = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"sniper");
        level.weaponclassarray.classes["mg"] = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"lmg");
        level.weaponclassarray.classes["smg"] = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"smg");
        level.weaponclassarray.classes["spread"] = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"shotgun");
        level.weaponclassarray.classes["pistol"] = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"pistol");
        level.weaponclassarray.classes["grenade"] = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"grenade");
        level.weaponclassarray.classes["rocketlauncher"] = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"launcher");
        level.weaponclassarray.classes["turret"] = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"turret");
        level.weaponclassarray.classes["throwingknife"] = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"throwing_knife");
        level.weaponclassarray.classes["non-player"] = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"non_player");
        level.weaponclassarray.classes["item"] = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"item");
        level.weaponclassarray.classes["beam"] = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"beam");
        level.weaponclassarray.classes["ball"] = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"ball");
        level.weaponclassarray.classes["rifle"] = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"assault");
        level.weaponclassarray.classes["battle"] = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"battle");
        level.weaponclassarray.classes["marksman"] = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"marksman");
        level.weaponclassarray.classes["killstreak"] = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"killstreak");
        level.weaponclassarray.classes["melee_primary"] = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"melee_primary");
        level.weaponclassarray.classes["melee_secondary"] = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"melee_secondary");
        level.weaponclassarray.classes["melee"] = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_a0dd9c7405f2d85e", #"melee");
    }
    return level.weaponclassarray.classes;
}

// Namespace challenges/namespace_aad14af462a74d08
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

// Namespace challenges/namespace_aad14af462a74d08
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa5e9
// Size: 0xd7b
function getlocation(poi, var_fb6bafb61d5c3d4a) {
    location = 0;
    if (isdefined(level.mapname)) {
        switch (level.mapname) {
        case #"hash_57eba45b7ddbdcd6":
        case #"hash_63326ac3e12f8da0":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"mp_saba"));
            break;
        case #"hash_4617d802bdced46":
        case #"hash_a82a4d91a314a926":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_9991289102a4a906"));
            break;
        case #"hash_c0437228d481a553":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_18fcdac82044e5b3"));
            break;
        case #"hash_721bd15904e6ff51":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"mp_bio_lab"));
            break;
        case #"hash_3eff14ec1d9395c1":
        case #"hash_636b409bbce21729":
        case #"hash_e817308cc606e9e1":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_d5da22a3ce3a6fe1"));
            break;
        case #"hash_73e90c896fdaebc3":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"mp_jup_bigmap_wz2"));
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
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"saba_airport"));
            break;
        case #"hash_323a903afe21c55":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_c0b040a45d7f0a35"));
            break;
        case #"hash_55998447da820c51":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_9fee7ac96c9e2af1"));
            break;
        case #"hash_bf64f3350855cdc0":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_7fe2e7b481144a0"));
            break;
        case #"hash_8c3b9af8bb8c1820":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_89a211bd5655c200"));
            break;
        case #"hash_bfacd3c12e3210d5":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_6a081a3989640435"));
            break;
        case #"hash_7c61ad10d89b8ce6":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"saba_oasis"));
            break;
        case #"hash_24913acf39b1b9d":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"saba_oilfield"));
            break;
        case #"hash_e9beb39bd45dace9":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"saba_caves"));
            break;
        case #"hash_37758f87479407e4":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"saba_fort"));
            break;
        case #"hash_f18f60036d48d0f":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"saba_observatory"));
            break;
        case #"hash_c95fc729a312805c":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_d78794a4c71719c"));
            break;
        case #"hash_c8ec8fdd7804347d":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_68cbc9667238f93d"));
            break;
        case #"hash_8d517c7cd4c59daf":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"saba_oldtwn"));
            break;
        case #"hash_94cea40522328dd7":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"saba_mtntwn"));
            break;
        case #"hash_3ca65c5d8ac073f1":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"saba_exhume"));
            break;
        case #"hash_ceed33ec74498ad9":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"saba_cemetery"));
            break;
        case #"hash_1488720cef98266d":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"saba_hydro"));
            break;
        case #"hash_cf5e052f7a158621":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_7d3886434243a401"));
            break;
        case #"hash_cf5e022f7a158168":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_7d38834342439ee8"));
            break;
        case #"hash_cf5e032f7a1582fb":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_7d3884434243a09b"));
            break;
        case #"hash_cf5e082f7a158ada":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_7d3889434243a91a"));
            break;
        case #"hash_cf5e092f7a158c6d":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_7d388a434243aacd"));
            break;
        case #"hash_cf5e062f7a1587b4":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_7d3887434243a5b4"));
            break;
        case #"hash_cf5e072f7a158947":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_7d3888434243a767"));
            break;
        case #"hash_cf5dfc2f7a1577f6":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_7d387d43424394b6"));
            break;
        case #"hash_cf5dfd2f7a157989":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_7d387e4342439669"));
            break;
        case #"hash_cf610a2f7a17cc97":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_7d3b8b434245e257"));
            break;
        case #"hash_cf61092f7a17cb04":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_7d3b8a434245e0a4"));
            break;
        case #"hash_cf610c2f7a17cfbd":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_7d3b8d434245e5bd"));
            break;
        case #"hash_cf610b2f7a17ce2a":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_7d3b8c434245e40a"));
            break;
        case #"hash_cf61062f7a17c64b":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_7d3b87434245db8b"));
            break;
        case #"hash_c45f27b96f2ad068":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_8ff0c309b1a1908"));
            break;
        case #"hash_fea386fb2aa41ed6":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"sealion_beachclub"));
            break;
        case #"hash_ee3a4e86c1774bb7":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"sealion_castle"));
            break;
        case #"hash_b74d2013e0a73b91":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"sealion_coastalruins"));
            break;
        case #"hash_42039e0dfa3b0be4":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_5d07baf686ac81a4"));
            break;
        case #"hash_425ebb3f3dd8bf73":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_ff40b181aa9cecf3"));
            break;
        case #"hash_c5c4b2288656dc11":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_6fb5a791f63fb951"));
            break;
        case #"hash_202632819760f0f3":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"sealion_residential"));
            break;
        case #"hash_a15a99827cbcb8cd":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_2c100bd4079345ad"));
            break;
        case #"hash_45a8eb1e8a07af8a":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_76b4cdd1fe62556a"));
            break;
        case #"hash_c3ce7ba6414ef022":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_4ad336a27b70ccc2"));
            break;
        case #"hash_f58c21f8c451efe6":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"sealion_waterways"));
            break;
        case #"hash_5065eaea648578ee":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"delta_castle"));
            break;
        case #"hash_b4fec2c123adbfd2":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_eb6df0f8d10fe512"));
            break;
        case #"hash_14bbe6b90c8369ca":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"delta_cityhall"));
            break;
        case #"hash_4f1ad34662aa3a82":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"delta_firestation"));
            break;
        case #"hash_53022f086491e02a":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"delta_fleamarket"));
            break;
        case #"hash_5b71b0ea2ed56595":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_97f878cab4a2b055"));
            break;
        case #"hash_239a49cd4504b4dd":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_ffcecf9e41b05c5d"));
            break;
        case #"hash_acf6b546ae4484dc":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_e4b969708fad633c"));
            break;
        case #"hash_ee6fcf2d91c2b6ca":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_5da329203432016a"));
            break;
        case #"hash_ae4c218f1f8dd217":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_9938a76de295bb97"));
            break;
        case #"hash_2b66f465e931d3c4":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_b49b4b47ef66b904"));
            break;
        case #"hash_b4fe333572abf8ec":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_737542d6543379cc"));
            break;
        case #"hash_e26564d1e7044875":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"delta_stadium"));
            break;
        case #"hash_b4aa823331182196":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"hash_e12cd26f627d46f6"));
            break;
        case #"hash_c6f07a0b07c6b7b2":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"delta_terminal"));
            break;
        default:
            break;
        }
    }
    if (isdefined(var_fb6bafb61d5c3d4a)) {
        switch (var_fb6bafb61d5c3d4a) {
        case #"hash_95e472767d515c8b":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"sira_mall"));
            break;
        case #"hash_7c61ad10d89b8ce6":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_92939ab8dccb3d82", #"saba_oasis"));
            break;
        }
    }
    return location;
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb36c
// Size: 0x9f8
function function_55be16fb0f5f4a19(poi, var_fb6bafb61d5c3d4a) {
    location = 0;
    if (isdefined(level.mapname)) {
        switch (level.mapname) {
        case #"hash_5d52d1f62d321d14":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"mp_biobunker"));
            break;
        case #"hash_73e90c896fdaebc3":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"mp_jup_bigmap_wz2"));
            break;
        case #"hash_da8f14763f037922":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_6540a118cbb56ca2"));
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
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_49a924e7bcee6519"));
            break;
        case #"hash_ba41f2c24ec17960":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_49a921e7bcee6000"));
            break;
        case #"hash_ba41f3c24ec17af3":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_49a922e7bcee61b3"));
            break;
        case #"hash_ba41f8c24ec182d2":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_49a927e7bcee6a32"));
            break;
        case #"hash_ba41f9c24ec18465":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_49a928e7bcee6be5"));
            break;
        case #"hash_ba41f6c24ec17fac":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_49a925e7bcee66cc"));
            break;
        case #"hash_ba41f7c24ec1813f":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_49a926e7bcee687f"));
            break;
        case #"hash_15cac143ca27b652":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_67df5469f1d7ca92"));
            break;
        case #"hash_bca86ea7c2b31316":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_26b0381c2079b336"));
            break;
        case #"hash_e1decce80236cc9c":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"biobunker_radiation"));
            break;
        case #"hash_82f3ea371858dcb6":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_c9755af2f26af356"));
            break;
        case #"hash_56a519e2698f4c00":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_cfb48576228a3860"));
            break;
        case #"hash_195a417c219fffbd":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_636e6ce763a20fdd"));
            break;
        case #"hash_c143cfedc1927b39":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_4bc4bb88131e8699"));
            break;
        case #"hash_cdd6ca24ce96d8bd":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_2640ec84b0693edd"));
            break;
        case #"hash_59a0dd972742aeb9":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_eb18e172e159e319"));
            break;
        case #"hash_7fbb5f9f358faed0":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_154b12368f20d3d0"));
            break;
        case #"hash_d992c10dffeca81e":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_ba30c3078a84ef9e"));
            break;
        case #"hash_ef4466fc27e2335b":
        case #"hash_70e8ff17062df539":
        case #"hash_ca6f3ef251522f6e":
        case #"hash_d840fc340f4fb2a9":
        case #"hash_4405af9f9355826f":
        case #"hash_9f0c1996da0a141d":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_702d936788ebb392"));
            break;
        case #"hash_9895bca361f5ee79":
        case #"hash_6345a03814056e63":
        case #"hash_4c0ccbf75bd12a9e":
        case #"hash_5f470fe723f4ac62":
        case #"hash_3a3e3fad3c7e0fd8":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_6c9971dc95f5ea2e"));
            break;
        case #"hash_40e5919a85ef9bc0":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_4a491dc568ffb351"));
            break;
        case #"hash_b23f3c4bcab3389f":
        case #"hash_e9f055c957f58c7b":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_dac79abf66b30786"));
            break;
        case #"hash_48248177a355e6d0":
        case #"hash_29b5b1340ca62859":
        case #"hash_cf710b2d0741957":
        case #"hash_d56f56b926ffa5a8":
        case #"hash_67f0b15012940b27":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_cf02ca46b264404b"));
            break;
        case #"hash_473f3b59733c607":
        case #"hash_cbc8b9454f10b472":
        case #"hash_56ce07d688a8cc35":
        case #"hash_86be6f0df24e7175":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_3153e18b02a7b2fe"));
            break;
        case #"hash_ad290bc3879a61a5":
        case #"hash_7f9fd6541d224e4f":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_cc47ef5350239996"));
            break;
        case #"hash_6742dc8335627d03":
        case #"hash_d21569d9eedad28b":
        case #"hash_e49fb665377a1c78":
        case #"hash_f1f4f066db011804":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_5e5c0da166eb1c7c"));
            break;
        case #"hash_58caefecc905d836":
        case #"hash_540ae336fcf22f3c":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_d796dffa9020677"));
            break;
        case #"hash_7589f405905760b3":
        case #"hash_3b58e913535cb270":
        case #"hash_c729f1b3c5ef3ba8":
        case #"hash_8a71d33feb6bee7e":
        case #"hash_76200439abcbd7af":
        case #"hash_edfe2d2de8981b7e":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_3e2b15e9829ad6ad"));
            break;
        case #"hash_d19eb1aec32470c4":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_6e6cd64e3490034c"));
            break;
        case #"hash_1ed8b86f1253b1fc":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_2244f829f0e6ae94"));
            break;
        case #"hash_ba9cee5d40a7497a":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_4ab90ab25ca1ed92"));
            break;
        case #"hash_82db018a89c6de96":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_688f3f5fa37effe"));
            break;
        case #"hash_e1010cf5f9ff611e":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_81b484874993bc6"));
            break;
        case #"hash_2dda946f40437647":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_7f91b27c1cb28baf"));
            break;
        case #"hash_7339d9dfecd6190e":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_10b5c24cd8264496"));
            break;
        case #"hash_2d220dd03338f263":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_b2964fcc2da9f2cb"));
            break;
        case #"hash_fd9536afdcfc38a4":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_3a93b1226ffdc3dc"));
            break;
        case #"hash_bf0e37b587735c83":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_478b09adb6177c5b"));
            break;
        case #"hash_a7bad6b83859d887":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"hash_8661390318e942ef"));
            break;
        default:
            break;
        }
    }
    if (isdefined(var_fb6bafb61d5c3d4a)) {
        switch (var_fb6bafb61d5c3d4a) {
        case #"hash_70402ffb70386a5c":
            location = function_6d40f12a09494350(location, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_dc0d981f2d59d210", #"saba_sandstorm"));
            break;
        }
    }
    return location;
}

// Namespace challenges/namespace_aad14af462a74d08
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

// Namespace challenges/namespace_aad14af462a74d08
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe23
// Size: 0x1dc
function function_b050ed1983293d8(player, var_363274577dc0543e, perkref, value) {
    if (!player challengesenabledforplayer()) {
        return;
    }
    gamemode = getchallengegamemode(player);
    gametype = function_17c5d7feb226e256();
    if (isdefined(value) && value < 0) {
        value = 1;
    }
    var_8852e1da266fea14 = 0;
    if (isdefined(perkref)) {
        var_8852e1da266fea14 = loot::getlootidfromref(perkref);
    }
    bitfield = 0;
    bitfield = function_6d40f12a09494350(bitfield, var_363274577dc0543e);
    location = 0;
    var_fcf7b6e6d8c41c8 = 0;
    if (isdefined(player.var_da28916e7827af7c)) {
        location = getlocation(function_5b2c23ea4889f30b(player.var_da28916e7827af7c));
        var_fcf7b6e6d8c41c8 = function_55be16fb0f5f4a19(function_5b2c23ea4889f30b(player.var_da28916e7827af7c));
    }
    var_7c6183ce9e04512e = #"perk";
    function_8e81148472fb520a(player, var_7c6183ce9e04512e, [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 1:gamemode, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 3:gametype, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"value"), 5:value, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 7:1, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_92939ab8dccb3d82"), 9:location, 10:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_dc0d981f2d59d210"), 11:var_fcf7b6e6d8c41c8, 12:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"loot_id"), 13:var_8852e1da266fea14, 14:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_83a2d67994d7e295"), 15:bitfield]);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xc006
// Size: 0xb0
function function_2aff99309a417c21(var_6770d32b0fd3b84, var_7c6183ce9e04512e, var_787db0cb007fb955, value) {
    var_35fa1149ae3912e5 = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, var_787db0cb007fb955);
    /#
        assertex(isdefined(var_35fa1149ae3912e5), "Undefined keyID for kill event param " + function_3c8848a3a11b2553(var_787db0cb007fb955) + " will break the eventParams array");
    #/
    /#
        assertex(isdefined(value), "Undefined value for kill event param " + function_3c8848a3a11b2553(var_787db0cb007fb955) + " will break the eventParams array");
    #/
    if (isdefined(var_35fa1149ae3912e5) && isdefined(value)) {
        var_6770d32b0fd3b84.eventparams[var_6770d32b0fd3b84.eventparams.size] = var_35fa1149ae3912e5;
        var_6770d32b0fd3b84.eventparams[var_6770d32b0fd3b84.eventparams.size] = value;
    }
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc0bd
// Size: 0x115
function function_137b512700167b00(attacker, victim) {
    var_3a99d1cafe4a4bac = spawnstruct();
    var_3a99d1cafe4a4bac.var_e4738651e7e13c78 = function_9da07c7f4a49e349(victim);
    var_c00a30624996364f = findenemytype(victim);
    var_3a99d1cafe4a4bac.var_7b718ef6c64f049f = var_c00a30624996364f[1];
    var_3a99d1cafe4a4bac.var_c5b28f88d9b3bfd7 = var_c00a30624996364f[0];
    var_3a99d1cafe4a4bac.var_14edc6d1db3695bc = isdefined(victim.var_d37b75616f7c2ee) && victim.var_d37b75616f7c2ee.var_14edc6d1db3695bc;
    var_3a99d1cafe4a4bac.var_66323722274a7b15 = int(distance(attacker.origin, victim.origin));
    var_3a99d1cafe4a4bac.origin = victim.origin;
    var_3a99d1cafe4a4bac.team = victim.team;
    var_3a99d1cafe4a4bac.var_fd67373057dae83a = victim function_8a1087376937edb9();
    var_3a99d1cafe4a4bac.var_379d31f8d73d8b2f = 1;
    return var_3a99d1cafe4a4bac;
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc1da
// Size: 0x138c
function reportkillchallengeevent(attacker, var_3a99d1cafe4a4bac, var_425d52c81f1883fc, var_425d55c81f188a95, var_425d54c81f188862, objweapon, damage, meansofdeath, var_3a33b126031be677, hitloc, var_1d68c79557cc54ea) {
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
    var_425d52c81f1883fc = function_53c4c53197386572(var_425d52c81f1883fc, 0);
    var_425d55c81f188a95 = function_53c4c53197386572(var_425d55c81f188a95, 0);
    var_425d54c81f188862 = function_53c4c53197386572(var_425d54c81f188862, 0);
    var_3a33b126031be677 = function_53c4c53197386572(var_3a33b126031be677, 0);
    hitloc = function_53c4c53197386572(hitloc, 0);
    gametype = var_6ddcf3c092eaf383.gametype;
    gamemode = var_6ddcf3c092eaf383.gamemode;
    var_c5b28f88d9b3bfd7 = var_3a99d1cafe4a4bac.var_c5b28f88d9b3bfd7;
    var_7b718ef6c64f049f = var_3a99d1cafe4a4bac.var_7b718ef6c64f049f;
    var_e4738651e7e13c78 = var_3a99d1cafe4a4bac.var_e4738651e7e13c78;
    if (!isdefined(attacker.var_4b46a244e524a126)) {
        attacker.var_4b46a244e524a126 = 0;
    }
    if (istrue(var_3a99d1cafe4a4bac.var_14edc6d1db3695bc)) {
        attacker.var_4b46a244e524a126++;
    } else {
        attacker.var_4b46a244e524a126 = 0;
    }
    var_4b46a244e524a126 = isdefined(attacker.var_4b46a244e524a126) ? 0 : attacker.var_4b46a244e524a126;
    if (!isdefined(attacker.var_a0595326ca4cf35d)) {
        attacker.var_a0595326ca4cf35d = 0;
    }
    attacker.var_a0595326ca4cf35d++;
    var_a0595326ca4cf35d = attacker.var_a0595326ca4cf35d;
    var_66323722274a7b15 = var_3a99d1cafe4a4bac.var_66323722274a7b15;
    victim = undefined;
    var_fe5a1e73a59d3b04 = spawnstruct();
    throttle::function_f632348cbb773537(level.var_1850e46a71d6e72d, var_fe5a1e73a59d3b04);
    var_349e390338192305 = findgunsmithattachments(objweapon);
    var_7fb63b7fac6d1698 = function_3ea2b9fa713d6ed3(attacker);
    var_b5eec3b49cf346d2 = [0:damage, 1:0];
    var_a5958dc7369199c7 = "none";
    if (isdefined(attacker.super) && isdefined(attacker.super.staticdata) && isdefined(attacker.super.staticdata.ref) && attacker.super.isactive) {
        var_a5958dc7369199c7 = attacker.super.staticdata.ref;
    }
    var_c0d251f100091822 = loot::getlootidfromref(var_a5958dc7369199c7);
    var_a74fc57fb4a4d3e6 = attacker function_aff35122a61a900b(attacker.team);
    if (!isdefined(var_a74fc57fb4a4d3e6)) {
        var_a74fc57fb4a4d3e6 = 0;
    }
    var_904c82687ddfeb02 = weapon::function_89a83ae9a4c4142a(objweapon);
    if (!isdefined(var_904c82687ddfeb02)) {
        var_904c82687ddfeb02 = 0;
    }
    var_9eeb614f9aee06b3 = 0;
    weaponcamo = 0;
    if (isdefined(objweapon) && isdefined(objweapon.camo)) {
        var_a79c87a31042789a = objweapon.camo;
        if (utility::issharedfuncdefined("zombie", "get_pap_level")) {
            var_29a8ba8c9dd43fd2 = attacker utility::function_f3bb4f4911a1beb2("zombie", "get_pap_level", objweapon);
            var_3a56a10345d2e89a = objweapon.var_9d7facbe889e667c;
            if (isarray(attacker.var_c37e65eb7cc773eb) && isdefined(var_3a56a10345d2e89a) && isdefined(var_29a8ba8c9dd43fd2) && var_29a8ba8c9dd43fd2 != 0) {
                var_83d8ff298781a595 = attacker.var_c37e65eb7cc773eb[var_3a56a10345d2e89a];
                if (isdefined(var_83d8ff298781a595)) {
                    var_a79c87a31042789a = var_83d8ff298781a595;
                }
            }
        }
        if (issubstr(var_a79c87a31042789a, "_comp_01")) {
            if (issubstr(var_a79c87a31042789a, "_ob_")) {
                weaponcamo = namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"hash_e378877c59549e7d", #"hash_1425cef80244bd8a");
            } else {
                weaponcamo = namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"hash_e378877c59549e7d", #"hash_65dcc57b79ab8156");
            }
        } else if (issubstr(var_a79c87a31042789a, "_comp_02")) {
            if (issubstr(var_a79c87a31042789a, "_ob_")) {
                weaponcamo = namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"hash_e378877c59549e7d", #"hash_90d460c1776ac629");
            } else {
                weaponcamo = namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"hash_e378877c59549e7d", #"hash_48176e29e2d06ab3");
            }
        } else if (issubstr(var_a79c87a31042789a, "_comp_03")) {
            if (issubstr(var_a79c87a31042789a, "_ob_")) {
                weaponcamo = namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"hash_e378877c59549e7d", #"hash_47b3cb5f609633a5");
            } else {
                weaponcamo = namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"hash_e378877c59549e7d", #"hash_f91aeaf4d59447e7");
            }
        } else if (issubstr(var_a79c87a31042789a, "_comp_04")) {
            if (issubstr(var_a79c87a31042789a, "_ob_")) {
                weaponcamo = namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"hash_e378877c59549e7d", #"hash_14352924a5376243");
            } else {
                weaponcamo = namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"hash_e378877c59549e7d", #"hash_6245cc85524cc965");
            }
        }
    }
    weaponclassarray = function_5af37ce2c176c946();
    var_b28608820870666 = 0;
    var_b28608820870666 = function_ce112254f7cba89e(objweapon);
    iskillstreak = weapon::iskillstreakweapon(objweapon) || istrue(attacker.isjuggernaut);
    isvehicle = utility::issharedfuncdefined("vehicle", "isVehicleWeapon") && [[ utility::getsharedfunc("vehicle", "isVehicleWeapon") ]](objweapon);
    isequipment = 0;
    var_f275474aacd30c96 = 0;
    if (var_904c82687ddfeb02 == 0) {
        var_84caef0d45386390 = function_f09e914e200d1a42(objweapon);
        var_5c32b638bb67c982 = level.equipment.table[var_84caef0d45386390];
        if (isdefined(var_5c32b638bb67c982)) {
            var_904c82687ddfeb02 = loot::getlootidfromref(var_5c32b638bb67c982.ref);
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
    var_fcf7b6e6d8c41c8 = 0;
    if (isdefined(attacker.var_da28916e7827af7c)) {
        location = getlocation(function_5b2c23ea4889f30b(attacker.var_da28916e7827af7c), attacker.var_fb6bafb61d5c3d4a);
        var_fcf7b6e6d8c41c8 = function_55be16fb0f5f4a19(function_5b2c23ea4889f30b(attacker.var_da28916e7827af7c), attacker.var_fb6bafb61d5c3d4a);
    }
    if (iskillstreak) {
        if (!isdefined(var_b28608820870666)) {
            var_b28608820870666 = 0;
        }
        var_b28608820870666 = function_6d40f12a09494350(var_b28608820870666, weaponclassarray["killstreak"]);
        if (isdefined(level.killstreakweaponmap)) {
            killstreakweaponname = level.killstreakweaponmap[objweapon.basename];
            if (isdefined(killstreakweaponname)) {
                var_904c82687ddfeb02 = loot::getlootidfromref(killstreakweaponname);
            }
        }
    }
    var_bb38571cca0414f = function_c1945f26d99b0ed9(attacker);
    var_3fff36caeace1b84 = function_5d99311b5a7dffda();
    if (isdefined(level.var_c596a10a13c5cd7c)) {
        var_3fff36caeace1b84 = [[ level.var_c596a10a13c5cd7c ]](var_3fff36caeace1b84, victim);
    }
    var_9c98419964190a71 = istrue(level.var_1147bbc93ea9b83c);
    teamsize = var_6ddcf3c092eaf383.teamsize;
    if (issharedfuncdefined("pmc_missions", "onEnemyKilled")) {
        attacker thread [[ getsharedfunc("pmc_missions", "onEnemyKilled") ]](attacker, victim, objweapon, var_425d52c81f1883fc);
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
    victim_on_zipline = var_3a99d1cafe4a4bac.var_fd67373057dae83a;
    var_7c6183ce9e04512e = #"kill";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    playlistid = getplaylistid();
    if (!isdefined(level.var_a3dfc554743efd89)) {
        level.var_a3dfc554743efd89 = [];
    }
    if (!isdefined(level.var_a7f8fb431b350d82)) {
        level.var_a7f8fb431b350d82 = [];
    }
    if (!istrue(level.var_a7f8fb431b350d82[#"reportkillchallengeevent"])) {
        level.var_a3dfc554743efd89[#"gamemode"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode");
        level.var_a3dfc554743efd89[#"hash_834ae5ef756e04aa"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_834ae5ef756e04aa");
        level.var_a3dfc554743efd89[#"hash_786f9c01adc0d384"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_786f9c01adc0d384");
        level.var_a3dfc554743efd89[#"gametype"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype");
        level.var_a3dfc554743efd89[#"version"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version");
        level.var_a3dfc554743efd89[#"hash_af7cd8c514ea5582"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_af7cd8c514ea5582");
        level.var_a3dfc554743efd89[#"hash_af7cd7c514ea53cf"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_af7cd7c514ea53cf");
        level.var_a3dfc554743efd89[#"hash_af7cd6c514ea521c"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_af7cd6c514ea521c");
        level.var_a3dfc554743efd89[#"hash_af7cd5c514ea5069"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_af7cd5c514ea5069");
        level.var_a3dfc554743efd89[#"hash_af7cd4c514ea4eb6"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_af7cd4c514ea4eb6");
        level.var_a3dfc554743efd89[#"hash_af7cd3c514ea4d03"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_af7cd3c514ea4d03");
        level.var_a3dfc554743efd89[#"hash_af7cd2c514ea4b50"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_af7cd2c514ea4b50");
        level.var_a3dfc554743efd89[#"hash_af7ce1c514ea64cd"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_af7ce1c514ea64cd");
        level.var_a3dfc554743efd89[#"hash_af7ce0c514ea631a"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_af7ce0c514ea631a");
        level.var_a3dfc554743efd89[#"hash_1b7a08e28a2f9d76"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_1b7a08e28a2f9d76");
        level.var_a3dfc554743efd89[#"hash_a0dd9c7405f2d85e"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_a0dd9c7405f2d85e");
        level.var_a3dfc554743efd89[#"hash_7f94e81c1787ff7a"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_7f94e81c1787ff7a");
        level.var_a3dfc554743efd89[#"hash_7f94e71c1787fdc7"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_7f94e71c1787fdc7");
        level.var_a3dfc554743efd89[#"hash_7f94e61c1787fc14"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_7f94e61c1787fc14");
        level.var_a3dfc554743efd89[#"hash_e2f5c601b57b3960"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_e2f5c601b57b3960");
        level.var_a3dfc554743efd89[#"hash_92939ab8dccb3d82"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_92939ab8dccb3d82");
        level.var_a3dfc554743efd89[#"hash_dc0d981f2d59d210"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_dc0d981f2d59d210");
        level.var_a3dfc554743efd89[#"hash_bd518e95df4103fe"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_bd518e95df4103fe");
        level.var_a3dfc554743efd89[#"loot_id"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"loot_id");
        level.var_a3dfc554743efd89[#"distance"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"distance");
        level.var_a3dfc554743efd89[#"hash_1ce058287dc8c73b"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_1ce058287dc8c73b");
        level.var_a3dfc554743efd89[#"weapon_camo"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"weapon_camo");
        level.var_a3dfc554743efd89[#"hit_loc"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hit_loc");
        level.var_a3dfc554743efd89[#"team_size"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"team_size");
        level.var_a3dfc554743efd89[#"hash_ab2e7c9b727a3d6c"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_ab2e7c9b727a3d6c");
        level.var_a3dfc554743efd89[#"hash_365c4ef34bc9c239"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_365c4ef34bc9c239");
        level.var_a3dfc554743efd89[#"hash_2f109e5ad9e45eff"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_2f109e5ad9e45eff");
        level.var_a3dfc554743efd89[#"hash_7e912c64fa5c6cde"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_7e912c64fa5c6cde");
        level.var_a3dfc554743efd89[#"hash_16db99d7417ef29d"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_16db99d7417ef29d");
        level.var_a3dfc554743efd89[#"hash_22d8c6e760626656"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_22d8c6e760626656");
        level.var_a3dfc554743efd89[#"playlist_id"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"playlist_id");
        level.var_a3dfc554743efd89[#"victim_on_zipline"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"victim_on_zipline");
        level.var_a3dfc554743efd89[#"hash_648b2ad7f16589f0"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_648b2ad7f16589f0");
        level.var_a3dfc554743efd89[#"hash_3e038eef2f8914a6"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_3e038eef2f8914a6");
        level.var_a3dfc554743efd89[#"hash_4a2a8345ce12358"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_4a2a8345ce12358");
        level.var_a3dfc554743efd89[#"hash_37ac48cb5a8cddea"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_37ac48cb5a8cddea");
        level.var_a7f8fb431b350d82[#"reportkillchallengeevent"] = 1;
    }
    var_acfb29aa2dab39ac = level.var_a3dfc554743efd89;
    eventparams = [0:var_acfb29aa2dab39ac[#"gamemode"], 1:gamemode, 2:var_acfb29aa2dab39ac[#"hash_834ae5ef756e04aa"], 3:var_a74fc57fb4a4d3e6, 4:var_acfb29aa2dab39ac[#"hash_786f9c01adc0d384"], 5:var_904c82687ddfeb02, 6:var_acfb29aa2dab39ac[#"gametype"], 7:gametype, 8:var_acfb29aa2dab39ac[#"version"], 9:1, 10:var_acfb29aa2dab39ac[#"hash_af7cd8c514ea5582"], 11:var_349e390338192305[0], 12:var_acfb29aa2dab39ac[#"hash_af7cd7c514ea53cf"], 13:var_349e390338192305[1], 14:var_acfb29aa2dab39ac[#"hash_af7cd6c514ea521c"], 15:var_349e390338192305[2], 16:var_acfb29aa2dab39ac[#"hash_af7cd5c514ea5069"], 17:var_349e390338192305[3], 18:var_acfb29aa2dab39ac[#"hash_af7cd4c514ea4eb6"], 19:var_349e390338192305[4], 20:var_acfb29aa2dab39ac[#"hash_af7cd3c514ea4d03"], 21:var_349e390338192305[5], 22:var_acfb29aa2dab39ac[#"hash_af7cd2c514ea4b50"], 23:var_349e390338192305[6], 24:var_acfb29aa2dab39ac[#"hash_af7ce1c514ea64cd"], 25:var_349e390338192305[7], 26:var_acfb29aa2dab39ac[#"hash_af7ce0c514ea631a"], 27:var_349e390338192305[8], 28:var_acfb29aa2dab39ac[#"hash_1b7a08e28a2f9d76"], 29:var_349e390338192305[9], 30:var_acfb29aa2dab39ac[#"hash_a0dd9c7405f2d85e"], 31:var_b28608820870666, 32:var_acfb29aa2dab39ac[#"hash_7f94e81c1787ff7a"], 33:var_425d52c81f1883fc, 34:var_acfb29aa2dab39ac[#"hash_7f94e71c1787fdc7"], 35:var_425d55c81f188a95, 36:var_acfb29aa2dab39ac[#"hash_e2f5c601b57b3960"], 37:var_c5b28f88d9b3bfd7, 38:var_acfb29aa2dab39ac[#"hash_92939ab8dccb3d82"], 39:location, 40:var_acfb29aa2dab39ac[#"hash_dc0d981f2d59d210"], 41:var_fcf7b6e6d8c41c8, 42:var_acfb29aa2dab39ac[#"hash_bd518e95df4103fe"], 43:var_7fb63b7fac6d1698, 44:var_acfb29aa2dab39ac[#"loot_id"], 45:var_c0d251f100091822, 46:var_acfb29aa2dab39ac[#"distance"], 47:var_66323722274a7b15, 48:var_acfb29aa2dab39ac[#"hash_1ce058287dc8c73b"], 49:var_3a33b126031be677, 50:var_acfb29aa2dab39ac[#"weapon_camo"], 51:weaponcamo, 52:var_acfb29aa2dab39ac[#"hit_loc"], 53:hitloc, 54:var_acfb29aa2dab39ac[#"team_size"], 55:teamsize, 56:var_acfb29aa2dab39ac[#"hash_ab2e7c9b727a3d6c"], 57:var_3fff36caeace1b84, 58:var_acfb29aa2dab39ac[#"hash_365c4ef34bc9c239"], 59:var_4a7a1118f15a4c9, 60:var_acfb29aa2dab39ac[#"hash_2f109e5ad9e45eff"], 61:var_4b46a244e524a126, 62:var_acfb29aa2dab39ac[#"hash_7e912c64fa5c6cde"], 63:var_79a1a1fe9f3bf357, 64:var_acfb29aa2dab39ac[#"hash_16db99d7417ef29d"], 65:var_a0595326ca4cf35d, 66:var_acfb29aa2dab39ac[#"hash_22d8c6e760626656"], 67:var_7b718ef6c64f049f, 68:var_acfb29aa2dab39ac[#"hash_7f94e61c1787fc14"], 69:var_425d54c81f188862, 70:var_acfb29aa2dab39ac[#"playlist_id"], 71:playlistid, 72:var_acfb29aa2dab39ac[#"victim_on_zipline"], 73:victim_on_zipline];
    if (isdefined(var_1d68c79557cc54ea)) {
        if (isdefined(var_1d68c79557cc54ea[0])) {
            eventparams[eventparams.size] = var_acfb29aa2dab39ac[#"hash_648b2ad7f16589f0"];
            eventparams[eventparams.size] = var_1d68c79557cc54ea[0];
        }
        if (isdefined(var_1d68c79557cc54ea[1])) {
            eventparams[eventparams.size] = var_acfb29aa2dab39ac[#"hash_3e038eef2f8914a6"];
            eventparams[eventparams.size] = var_1d68c79557cc54ea[1];
        }
        if (isdefined(var_1d68c79557cc54ea[2])) {
            eventparams[eventparams.size] = var_acfb29aa2dab39ac[#"hash_4a2a8345ce12358"];
            eventparams[eventparams.size] = var_1d68c79557cc54ea[2];
        }
    }
    if (var_e4738651e7e13c78 > 0) {
        eventparams[eventparams.size] = var_acfb29aa2dab39ac[#"hash_37ac48cb5a8cddea"];
        eventparams[eventparams.size] = var_e4738651e7e13c78;
    }
    attacker reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, eventparams);
    var_f896467ad490a545 = [];
    if (isdefined(var_1d68c79557cc54ea)) {
        if (isdefined(var_1d68c79557cc54ea[0])) {
            var_f896467ad490a545[var_f896467ad490a545.size] = var_acfb29aa2dab39ac[#"hash_648b2ad7f16589f0"];
            var_f896467ad490a545[var_f896467ad490a545.size] = var_1d68c79557cc54ea[0];
        }
        if (isdefined(var_1d68c79557cc54ea[1])) {
            var_f896467ad490a545[var_f896467ad490a545.size] = var_acfb29aa2dab39ac[#"hash_3e038eef2f8914a6"];
            var_f896467ad490a545[var_f896467ad490a545.size] = var_1d68c79557cc54ea[1];
        }
        if (isdefined(var_1d68c79557cc54ea[2])) {
            var_f896467ad490a545[var_f896467ad490a545.size] = var_acfb29aa2dab39ac[#"hash_4a2a8345ce12358"];
            var_f896467ad490a545[var_f896467ad490a545.size] = var_1d68c79557cc54ea[2];
        }
    }
    if (isdefined(var_3a99d1cafe4a4bac) && istrue(var_3a99d1cafe4a4bac.var_379d31f8d73d8b2f)) {
        function_fee0bee456eac877(attacker, var_7c6183ce9e04512e, var_f896467ad490a545, var_3a99d1cafe4a4bac);
    }
}

// Namespace challenges/namespace_aad14af462a74d08
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
    var_7c6183ce9e04512e = #"multikill";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    objweapon = attacker getcurrentweapon();
    if (isdefined(objweapon)) {
        var_904c82687ddfeb02 = weapon::function_89a83ae9a4c4142a(objweapon);
        if (!isdefined(var_904c82687ddfeb02)) {
            var_904c82687ddfeb02 = 0;
        }
        if (var_904c82687ddfeb02 == 0) {
            var_84caef0d45386390 = function_f09e914e200d1a42(objweapon);
            var_5c32b638bb67c982 = level.equipment.table[var_84caef0d45386390];
            if (isdefined(var_5c32b638bb67c982)) {
                var_904c82687ddfeb02 = loot::getlootidfromref(var_5c32b638bb67c982.ref);
            }
        }
    }
    params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 1:gamemode, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 3:gametype, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_d404f427903135e"), 5:var_9b8336914d1339a9, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_786f9c01adc0d384"), 7:var_904c82687ddfeb02, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_a8486f6c36866dc8"), 9:iskillstreak];
    attacker reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd72b
// Size: 0x30a
function function_c43d8b7a5461cdce(lootid) {
    var_25978461c6e4f61b = loot::getscriptablefromlootid(lootid);
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
        return namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"itemtypes", #"hash_390ee15442e26b5a");
    case #"gear":
        return namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"itemtypes", #"hash_586b8242aa331357");
    case #"health":
        return namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"itemtypes", #"hash_5eb3ab4da847b262");
    case #"revive":
        return namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"itemtypes", #"hash_6c8b69bd795806f5");
    case #"lethal":
        return namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"itemtypes", #"hash_60a1e08b6f7a43fe");
    case #"tactical":
        return namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"itemtypes", #"hash_66450f4f8837c2d9");
    case #"killstreak":
        return namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"itemtypes", #"hash_98c2539a8ef0aef6");
    case #"super":
        return namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"itemtypes", #"hash_722533776029e257");
    case #"weapon":
        return namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"itemtypes", #"hash_f10ff7a627660838");
    case #"plunder":
        return namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"itemtypes", #"hash_36993f9c4257b726");
    case #"attachment":
        return namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"itemtypes", #"hash_729a9e5d9c8e2de1");
    case #"plate_carrier":
        return namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"itemtypes", #"hash_aab4443965fdeddf");
    case #"keycard":
        return namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"itemtypes", #"hash_27c621c0e4e32925");
    case #"key":
        return namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"itemtypes", #"hash_59f198f5cae765f3");
    case #"valuable":
        return namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"itemtypes", #"hash_10f39a5c7ed87e9e");
    case #"personal":
        return namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"itemtypes", #"hash_796e898cedfe7de4");
    case #"dogtag":
        return namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"itemtypes", #"hash_896fd6caf251de1e");
    case #"weaponcase":
        return namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"itemtypes", #"hash_6f88af36718a54b1");
    default:
        return undefined;
        break;
    }
}

// Namespace challenges/namespace_aad14af462a74d08
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
    gamemode = namespace_aad14af462a74d08::getchallengegamemode(player);
    gametype = namespace_aad14af462a74d08::function_17c5d7feb226e256();
    var_7c6183ce9e04512e = #"hash_2ff82d5ab2587aa";
    typeid = 0;
    if (isdefined(type)) {
        typeid = namespace_ec6836c9475c9d18::function_7042dad035dc176c(type);
    }
    var_3fcdc20d65de43cd = 0;
    if (isdefined(var_f237807396377232)) {
        var_3fcdc20d65de43cd = var_f237807396377232.rarity;
    }
    if (!isdefined(method)) {
        method = 0;
        method = namespace_aad14af462a74d08::function_6d40f12a09494350(method, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
    }
    var_a74fc57fb4a4d3e6 = player function_aff35122a61a900b(player.team);
    gametype = function_68ffb11dc4c6b979(gametype, var_7c6183ce9e04512e);
    gamemode = function_68ffb11dc4c6b979(gamemode, var_7c6183ce9e04512e);
    quantity = function_68ffb11dc4c6b979(quantity, var_7c6183ce9e04512e);
    var_a74fc57fb4a4d3e6 = function_68ffb11dc4c6b979(var_a74fc57fb4a4d3e6, var_7c6183ce9e04512e);
    lootid = function_68ffb11dc4c6b979(lootid, var_7c6183ce9e04512e);
    var_3fcdc20d65de43cd = function_68ffb11dc4c6b979(var_3fcdc20d65de43cd, var_7c6183ce9e04512e);
    typeid = function_68ffb11dc4c6b979(typeid, var_7c6183ce9e04512e);
    method = function_68ffb11dc4c6b979(method, var_7c6183ce9e04512e);
    function_8e81148472fb520a(player, var_7c6183ce9e04512e, [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"value"), 3:quantity, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"loot_id"), 5:lootid, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 7:gamemode, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 9:gametype, 10:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_ad78fa4f448cdf42"), 11:typeid, 12:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_83a2d67994d7e295"), 13:method, 14:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_578439261b0ec47b"), 15:var_a74fc57fb4a4d3e6, 16:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_48f6b92ad0c610b2"), 17:var_3fcdc20d65de43cd]);
}

// Namespace challenges/namespace_aad14af462a74d08
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
        typeid = namespace_ec6836c9475c9d18::function_7042dad035dc176c(type);
    }
    var_5577636292591c8b = undefined;
    if (isdefined(lootid)) {
        var_5577636292591c8b = function_c43d8b7a5461cdce(lootid);
    }
    location = 0;
    var_fcf7b6e6d8c41c8 = 0;
    location = getlocation(utility::ter_op(isdefined(poi), poi, function_5b2c23ea4889f30b(player.var_da28916e7827af7c)));
    var_fcf7b6e6d8c41c8 = function_55be16fb0f5f4a19(utility::ter_op(isdefined(poi), poi, function_5b2c23ea4889f30b(player.var_da28916e7827af7c)));
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
    if (isdefined(var_5577636292591c8b) && var_5577636292591c8b < 0) {
        logstring("IW9-592971: reportLootItemEvent::lootType is negative");
    }
    if (isdefined(source) && isint(source) && source < 0) {
        logstring("IW9-592971: reportLootItemEvent::source is negative");
    }
    var_7c6183ce9e04512e = #"hash_a78fdd75c1277ee7";
    function_8e81148472fb520a(player, var_7c6183ce9e04512e, [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_ad78fa4f448cdf42"), 3:typeid, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"value"), 5:quantity, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 7:gamemode, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 9:gametype, 10:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_92939ab8dccb3d82"), 11:location, 12:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_dc0d981f2d59d210"), 13:var_fcf7b6e6d8c41c8, 14:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"loot_id"), 15:lootid, 16:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_2af1f13aa6ae3b5f"), 17:method, 18:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_d7806c74c1d4a500"), 19:var_5577636292591c8b, 20:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_570fd18b83e115ad"), 21:source]);
    /#
        println("<unknown string>");
    #/
    if (isdefined(level.var_97ea4daf8989e0c6)) {
        return [[ level.var_97ea4daf8989e0c6 ]](player, lootid, var_5577636292591c8b);
    }
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe002
// Size: 0x4aa
function private function_b7de4afaf79ff9b5(statname, amount) {
    if (!challengesenabledforplayer()) {
        return;
    }
    if (amount <= 0) {
        return;
    }
    var_e3fbce1c8509474f = function_2ef675c13ca1c4af(@"hash_af7cfd1e80e4fb55", statname);
    var_a75e138cb4bcfef8 = getdvarint(var_e3fbce1c8509474f, 0);
    if (var_a75e138cb4bcfef8 > 0) {
        return;
    }
    var_fdd8abee94d24e72 = 0;
    damage_amount = 0;
    var_cfb8ab0eb8945dbe = 0;
    var_6404fb8da529be30 = 0;
    var_6eae97b1c039638c = 0;
    var_8dbdb5edd5a730f9 = 0;
    switch (statname) {
    case #"hash_1cc8a923a608c2a0":
        damage_amount = amount;
        var_fdd8abee94d24e72 = 1;
        break;
    case #"hash_2c58990905f03e75":
        var_cfb8ab0eb8945dbe = amount;
        var_fdd8abee94d24e72 = 1;
        break;
    case #"hash_32e41af5a3ef1340":
        var_6404fb8da529be30 = amount;
        var_fdd8abee94d24e72 = 1;
        break;
    case #"hash_76c0ec96dd3ab432":
        var_6eae97b1c039638c = int(amount / 1000);
        var_fdd8abee94d24e72 = 1;
        break;
    case #"hash_8d8693c020b1c720":
        var_8dbdb5edd5a730f9 = amount;
        var_fdd8abee94d24e72 = 1;
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
    if (var_fdd8abee94d24e72) {
        var_6ddcf3c092eaf383 = level.var_ec851999e0e99879;
        if (!isdefined(var_6ddcf3c092eaf383)) {
            var_6ddcf3c092eaf383 = function_6b7aeb2012efc4af();
        }
        var_7c6183ce9e04512e = #"stats";
        if (!isdefined(level.var_d44156bac78184ca)) {
            level.var_d44156bac78184ca = [];
        }
        if (!isdefined(level.var_a7f8fb431b350d82)) {
            level.var_a7f8fb431b350d82 = [];
        }
        if (!istrue(level.var_a7f8fb431b350d82[#"hash_e4fafe747c649576"])) {
            level.var_d44156bac78184ca[#"version"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version");
            level.var_d44156bac78184ca[#"gamemode"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode");
            level.var_d44156bac78184ca[#"gametype"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype");
            level.var_d44156bac78184ca[#"damage"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"damage");
            level.var_d44156bac78184ca[#"score"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"score");
            level.var_d44156bac78184ca[#"team_size"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"team_size");
            level.var_d44156bac78184ca[#"hash_825e7b5a1375a994"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_825e7b5a1375a994");
            level.var_d44156bac78184ca[#"value"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"value");
            level.var_d44156bac78184ca[#"hash_6ee3cf6540c5bcac"] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_6ee3cf6540c5bcac");
        }
        var_acfb29aa2dab39ac = level.var_d44156bac78184ca;
        eventparams = [0:var_acfb29aa2dab39ac[#"version"], 1:1, 2:var_acfb29aa2dab39ac[#"gamemode"], 3:var_6ddcf3c092eaf383.gamemode, 4:var_acfb29aa2dab39ac[#"gametype"], 5:var_6ddcf3c092eaf383.gametype, 6:var_acfb29aa2dab39ac[#"damage"], 7:damage_amount, 8:var_acfb29aa2dab39ac[#"score"], 9:var_cfb8ab0eb8945dbe, 10:var_acfb29aa2dab39ac[#"team_size"], 11:var_6ddcf3c092eaf383.teamsize, 12:var_acfb29aa2dab39ac[#"hash_825e7b5a1375a994"], 13:var_6404fb8da529be30, 14:var_acfb29aa2dab39ac[#"value"], 15:var_6eae97b1c039638c, 16:var_acfb29aa2dab39ac[#"hash_6ee3cf6540c5bcac"], 17:var_8dbdb5edd5a730f9];
        if (!isdefined(level.var_6de4f66f58ecd7b1)) {
            level.var_6de4f66f58ecd7b1 = [];
        }
        var_a7a6077754bbc2f8 = level.var_6de4f66f58ecd7b1[var_7c6183ce9e04512e];
        if (!isdefined(var_a7a6077754bbc2f8)) {
            var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
            level.var_6de4f66f58ecd7b1[var_7c6183ce9e04512e] = var_a7a6077754bbc2f8;
        }
        /#
            function_7d97a2a745e514c4(var_a7a6077754bbc2f8, eventparams);
        #/
        reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, eventparams);
    }
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe4b3
// Size: 0x76
function private function_6b7aeb2012efc4af() {
    gamemode = getchallengegamemode(self);
    gametype = function_17c5d7feb226e256();
    teamsize = 0;
    if (gamemode & 8) {
        teamsize = namespace_36f464722d326bbe::function_4fb37368ae3585bb();
    }
    var_73e6a52dac8d0c32 = {teamsize:teamsize, gametype:gametype, gamemode:gamemode};
    level.var_ec851999e0e99879 = var_73e6a52dac8d0c32;
    return var_73e6a52dac8d0c32;
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe531
// Size: 0x32
function function_8a0395089290faf6(player) {
    function_b050ed1983293d8(player, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"hit"), "specialty_scavenger_plus", undefined);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe56a
// Size: 0x64
function function_563606223ef09517(player, amount) {
    method = function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_2af1f13aa6ae3b5f", #"loot"));
    function_d24138b32084fc3e(player, 8395, namespace_ec6836c9475c9d18::function_b40278e5e468c6c1(#"itemtypes", #"hash_36993f9c4257b726"), method, amount, 0);
}

// Namespace challenges/namespace_aad14af462a74d08
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
    for (var_40e4b9c48b36c9ec = var_349e390338192305.size; var_40e4b9c48b36c9ec < 10; var_40e4b9c48b36c9ec++) {
        var_349e390338192305[var_40e4b9c48b36c9ec] = 0;
    }
    return var_349e390338192305;
}

// Namespace challenges/namespace_aad14af462a74d08
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

// Namespace challenges/namespace_aad14af462a74d08
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

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe9ea
// Size: 0xa95
function findenemytype(victim) {
    var_c5b28f88d9b3bfd7 = 0;
    var_7b718ef6c64f049f = 0;
    if (isplayer(victim)) {
        var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"player"));
    }
    var_4c20e5abf3ce9872 = 0;
    var_ae8eb6d66c120397 = 0;
    var_b786822d9a87ab34 = 0;
    var_24f040a6728b6dc4 = 0;
    var_b93834c5c289dcdc = 0;
    if (isdefined(victim.streakinfo)) {
        var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"killstreak"));
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
            var_4c20e5abf3ce9872 = 1;
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
            var_b786822d9a87ab34 = 1;
            break;
        case #"hash_19dd9a3a4147e09e":
            var_4c20e5abf3ce9872 = 1;
            var_24f040a6728b6dc4 = 1;
            break;
        case #"hash_2289ec11d77bce8f":
            var_b786822d9a87ab34 = 1;
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
            var_b786822d9a87ab34 = 1;
            var_24f040a6728b6dc4 = 1;
            break;
        }
        if (var_4c20e5abf3ce9872) {
            var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"ground"));
        }
        if (var_ae8eb6d66c120397) {
            var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"hash_5f1ee1e6e0788d3b"));
        }
        if (var_b786822d9a87ab34) {
            var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"support"));
        }
        if (var_24f040a6728b6dc4) {
            var_7b718ef6c64f049f = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_22d8c6e760626656", #"hash_4ce842b3430d0755"));
        } else {
            var_7b718ef6c64f049f = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_22d8c6e760626656", #"hash_26588836ee582767"));
        }
    }
    if (isdefined(victim.vehiclename)) {
        var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"vehicle"));
        canfly = istrue(victim vehicle::vehiclecanfly());
        var_941d95491d4d4817 = istrue(victim vehicle::function_7c62ca52f72901a1());
        if (var_4c20e5abf3ce9872 && !canfly && !var_941d95491d4d4817) {
            var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"ground"));
        } else if (var_ae8eb6d66c120397 || canfly) {
            var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"hash_5f1ee1e6e0788d3b"));
        }
        if (victim.vehiclename == "dmz_boss_chopper") {
            var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"boss"));
            var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"chopper_boss"));
            var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"hash_5f1ee1e6e0788d3b"));
        } else if (victim.vehiclename == "pac_sentry") {
            var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"boss"));
            var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"hash_6e1270aafc6b28fc"));
        } else if (victim.vehiclename == "veh9_armored_acv_6x6") {
            var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"hash_12648e6785f3475b"));
            var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"boss"));
        }
        vehicletype = undefined;
        switch (victim.vehiclename) {
        case #"hash_c93466c10cc10ba":
            vehicletype = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"atv");
            break;
        case #"hash_7c54070d9b704f70":
            vehicletype = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"light_tank");
            break;
        case #"hash_9d4e22a00fc630b5":
            vehicletype = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"little_bird");
            break;
        case #"hash_112ffa8db1ed9ebd":
            vehicletype = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_acv_6x6");
            break;
        case #"hash_2ddb1b1fa5093dd1":
            vehicletype = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_apc_8x8");
            break;
        case #"hash_835a3b4bb4e34233":
            vehicletype = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_blima");
            break;
        case #"hash_b8b8fefba61ac382":
            vehicletype = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"hash_bbeb472fbad33a42");
            break;
        case #"hash_cb2498c4a1e415fd":
            vehicletype = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_cougar");
            break;
        case #"hash_cbbafedb48ea9aea":
            vehicletype = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_hummer");
            break;
        case #"hash_d63b8f48fb92540d":
            vehicletype = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_jltv_mg");
            break;
        case #"hash_d212f4961f28eb58":
            vehicletype = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_jltv");
            break;
        case #"hash_f9260a8d132b789":
            vehicletype = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_mil_cargo_truck");
            break;
        case #"hash_5211f142350a63e1":
            vehicletype = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_overland_2016");
            break;
        case #"hash_66c8846b85d8c948":
            vehicletype = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_palfa");
            break;
        case #"hash_a2c475614741731":
            vehicletype = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_patrol_boat");
            break;
        case #"hash_d589a6a019e9defe":
            vehicletype = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_pickup_2014");
            break;
        case #"hash_81ea99824b4eacca":
            vehicletype = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_pwc");
            break;
        case #"hash_44d67727616d3059":
            vehicletype = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_rhib");
            break;
        case #"hash_228830c793bd36cb":
            vehicletype = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_sedan_hatchback_1985");
            break;
        case #"hash_f690b9139a2baa7e":
            vehicletype = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_suv_1996");
            break;
        case #"hash_cb367b51338c9d6":
            vehicletype = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_techo_rebel_armor");
            break;
        case #"hash_a7bdb3825f53a60d":
            vehicletype = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"veh9_utv");
            break;
        }
        if (isdefined(vehicletype)) {
            var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, vehicletype);
        }
        if (isdefined(victim.riders)) {
            var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"hash_92f1c5423a74e4d0"));
            if (victim.vehiclename == "little_bird" || victim.vehiclename == "veh9_blima") {
                var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"hash_a98d334a4acd1532"));
            }
        }
        if (vehicle::vehicle_isenemytoplayer(victim, self)) {
            var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"enemy_vehicle"));
        }
    } else if (var_b93834c5c289dcdc) {
        var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"vehicle"));
    }
    if (isdefined(victim.equipmentref)) {
        var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"equipment"));
    }
    if (isagent(victim)) {
        if (isdefined(victim.aitype)) {
            var_c5b28f88d9b3bfd7 = return_enemy_type_mask(var_c5b28f88d9b3bfd7, victim);
        } else if (isdefined(victim.agent_type)) {
            var_c00a336249963ce8 = function_e9dc49603ac403d(var_c5b28f88d9b3bfd7, var_7b718ef6c64f049f, victim);
            var_7b718ef6c64f049f = var_c00a336249963ce8[1];
            var_c5b28f88d9b3bfd7 = var_c00a336249963ce8[0];
        }
    }
    return [0:var_c5b28f88d9b3bfd7, 1:var_7b718ef6c64f049f];
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf487
// Size: 0x1cd
function function_8435d79a41ea37b0(victim) {
    var_c5b28f88d9b3bfd7 = 0;
    vehicletype = undefined;
    if (isdefined(victim) && isdefined(victim.vehiclename)) {
        switch (victim.vehiclename) {
        case #"hash_8b763c32b6a3f882":
            vehicletype = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_22d8c6e760626656", #"veh_jup_jltv_mg");
            break;
        case #"hash_885f51af68244d3":
            vehicletype = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_22d8c6e760626656", #"veh_jup_suv_1996");
            break;
        case #"hash_c9d9aa17e7c175a5":
            vehicletype = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_22d8c6e760626656", #"veh_jup_pickup_2014");
            break;
        case #"hash_a4c3ae5c9f3a69f":
            vehicletype = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_22d8c6e760626656", #"hash_f56b6b0fcad9f6bf");
            break;
        case #"hash_c7645976ba1894f":
            vehicletype = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_22d8c6e760626656", #"veh9_motorcycle_blood_burner_physics");
            break;
        case #"hash_b5677ac5bf174357":
            vehicletype = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_22d8c6e760626656", #"veh_jup_orav");
            break;
        case #"hash_63cf913c1ee55d64":
            vehicletype = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_22d8c6e760626656", #"veh_jup_razorback");
            break;
        case #"hash_6437bb8a3a27be5e":
            vehicletype = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_22d8c6e760626656", #"veh_jup_truck_tech_hmg");
            break;
        case #"hash_da4cefbee9ff0d74":
            vehicletype = namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_22d8c6e760626656", #"hash_48bbae067d189af4");
            break;
        }
    }
    if (isdefined(vehicletype)) {
        var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, vehicletype);
    }
    return var_c5b28f88d9b3bfd7;
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf65c
// Size: 0x3a
function function_c7496288999ac847(agenttype, subcategory) {
    return issubstr(agenttype, "cartel") || function_7ee65fae13124702() && isdefined(subcategory) && subcategory == "elimTarget";
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf69e
// Size: 0x708
function function_e9dc49603ac403d(var_c5b28f88d9b3bfd7, var_7b718ef6c64f049f, victim) {
    var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"agent"));
    if (issubstr(victim.agent_type, "civilian")) {
        var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"civilian"));
    } else {
        var_86df29145c484d9c = issubstr(victim.agent_type, "biolab") || issubstr(victim.agent_type, "merc");
        if (!var_86df29145c484d9c) {
            var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"combatant"));
        }
        if (issubstr(victim.agent_type, "jugg")) {
            var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"juggernaut"));
        } else if (issubstr(victim.agent_type, "riotshield")) {
            var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"riotshield"));
        } else if (issubstr(victim.agent_type, "velikan")) {
            var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"boss"));
            var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"hash_eff939dd79f60271"));
        } else if (issubstr(victim.agent_type, "firebug")) {
            var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"firebug"));
        } else if (issubstr(victim.agent_type, "butcher")) {
            var_7b718ef6c64f049f = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_22d8c6e760626656", #"hash_e016c28fc0fa9c90"));
        } else if (issubstr(victim.agent_type, "swamp")) {
            var_7b718ef6c64f049f = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_22d8c6e760626656", #"hash_d3d79e53ba73ecf1"));
        } else if (issubstr(victim.agent_type, "mummy")) {
            var_7b718ef6c64f049f = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_22d8c6e760626656", #"hash_529b2a005c09f2a4"));
        } else {
            var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"soldier"));
        }
        if (utility::issharedfuncdefined("ai_mp_controller", "agentPers_getAgentPersData")) {
            var_3b341f9dc3b7ffb4 = utility::getsharedfunc("ai_mp_controller", "agentPers_getAgentPersData");
            if (istrue([[ var_3b341f9dc3b7ffb4 ]](victim, "elite"))) {
                var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"elite"));
            }
            tier = [[ var_3b341f9dc3b7ffb4 ]](victim, "tier");
            if (isdefined(tier)) {
                if (tier == 1) {
                    var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"tier1"));
                } else if (tier == 2) {
                    var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"tier2"));
                } else {
                    var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"tier3"));
                }
                if (tier == 2 || tier == 3) {
                    var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"armored"));
                }
            }
            category = [[ var_3b341f9dc3b7ffb4 ]](victim, "category");
            subcategory = [[ var_3b341f9dc3b7ffb4 ]](victim, "subcategory");
            if (issubstr(victim.agent_type, "aq")) {
                var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"aq"));
            } else if (var_86df29145c484d9c) {
                var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"hash_4ece742ef2d8f981"));
            } else if (function_c7496288999ac847(victim.agent_type, subcategory)) {
                var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"cartel"));
            } else if (issubstr(victim.agent_type, "ru")) {
                var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"russian"));
            }
            if (isdefined(category) && isdefined(subcategory)) {
                if (category == "mission" && subcategory == "elimTarget") {
                    var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"elim_target"));
                }
                if (category == "bosses") {
                    var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"boss"));
                    if (subcategory == "jugg") {
                        var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"hash_a69181af9db44117"));
                    } else if (subcategory == "chemistBoss") {
                        var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"hash_a5d8aa404113c12c"));
                    } else if (subcategory == "trapperBoss") {
                        var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"hash_d7ae373118c5d5e3"));
                    } else if (subcategory == " pyroBoss") {
                        var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"hash_57fbf0aec8c5a6e7"));
                    } else if (subcategory == "ratBoss") {
                        var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"hash_5c831c5541c13764"));
                    } else if (subcategory == "sniperBoss") {
                        var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"hash_1e3223af992239a"));
                    } else if (subcategory == "rusherBoss") {
                        var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"hash_dbf8cc8fb7bac314"));
                    } else if (subcategory == "jailerBoss") {
                        var_7b718ef6c64f049f = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_22d8c6e760626656", #"hash_ca57955d23f965cc"));
                    }
                }
                if (subcategory == "jailerBossMinion") {
                    var_7b718ef6c64f049f = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"rat"));
                }
            }
        }
    }
    return [0:var_c5b28f88d9b3bfd7, 1:var_7b718ef6c64f049f];
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfdae
// Size: 0x129
function return_enemy_type_mask(var_c5b28f88d9b3bfd7, victim) {
    if (!isdefined(victim.aitype)) {
        return var_c5b28f88d9b3bfd7;
    }
    switch (victim.aitype) {
    case #"hash_44aaeb0edd152195":
        var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"soldier"));
        break;
    case #"hash_4ad475e6e15635bd":
        var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"juggernaut"));
        break;
    case #"hash_1403dfb5d1265ddc":
        var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"suicidebomber"));
        break;
    case #"hash_321a9678047d0a4e":
        var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"riotshield"));
        break;
    default:
        var_c5b28f88d9b3bfd7 = function_6d40f12a09494350(var_c5b28f88d9b3bfd7, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e2f5c601b57b3960", #"agent"));
        break;
    }
    return var_c5b28f88d9b3bfd7;
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfedf
// Size: 0x1a0
function private function_742decc7f891bb0e(var_9c46b4c2597d7b03) {
    if (!challengesenabledforplayer()) {
        return;
    }
    gamemode = getchallengegamemode(self);
    gametype = function_17c5d7feb226e256();
    var_a74fc57fb4a4d3e6 = function_aff35122a61a900b(self.team);
    location = 0;
    var_fcf7b6e6d8c41c8 = 0;
    if (isdefined(self.var_da28916e7827af7c)) {
        location = getlocation(function_5b2c23ea4889f30b(self.var_da28916e7827af7c));
        var_fcf7b6e6d8c41c8 = function_55be16fb0f5f4a19(function_5b2c23ea4889f30b(self.var_da28916e7827af7c));
    }
    var_7c6183ce9e04512e = #"hash_6a5ad49f1800e512";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 3:gamemode, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 5:gametype, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_578439261b0ec47b"), 7:var_a74fc57fb4a4d3e6, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_92939ab8dccb3d82"), 9:location, 10:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_dc0d981f2d59d210"), 11:var_fcf7b6e6d8c41c8, 12:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_ecf2f40148801ac5"), 13:var_9c46b4c2597d7b03];
    /#
        function_7d97a2a745e514c4(var_a7a6077754bbc2f8, params);
    #/
    reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10086
// Size: 0x23
function function_3d871e989c0bdb6d() {
    if (!isdefined(self.var_d405f79d63134727)) {
        self.var_d405f79d63134727 = 0;
    }
    return self.var_d405f79d63134727;
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x100b1
// Size: 0x64
function function_ca0ab723ebcf6d79() {
    if (!isdefined(self.var_d405f79d63134727)) {
        self.var_d405f79d63134727 = 0;
    }
    self.var_d405f79d63134727 = self.var_d405f79d63134727 + 1;
    var_f0b126b5b59eae44 = 0;
    var_f0b126b5b59eae44 = function_6d40f12a09494350(var_f0b126b5b59eae44, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_ecf2f40148801ac5", #"hash_972a0e505ecce104"));
    function_742decc7f891bb0e(var_f0b126b5b59eae44);
}

// Namespace challenges/namespace_aad14af462a74d08
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
        var_bc2c612dd7d7cf33 = function_6d40f12a09494350(var_bc2c612dd7d7cf33, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_ecf2f40148801ac5", #"hash_33af2318f82518f3"));
        function_742decc7f891bb0e(var_bc2c612dd7d7cf33);
    }
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10195
// Size: 0x1b6
function private function_8feb2dc462cfc7f4(command, var_9c46b4c2597d7b03) {
    if (!challengesenabledforplayer()) {
        return;
    }
    gamemode = getchallengegamemode(self);
    gametype = function_17c5d7feb226e256();
    var_a74fc57fb4a4d3e6 = function_aff35122a61a900b(self.team);
    location = 0;
    var_fcf7b6e6d8c41c8 = 0;
    if (isdefined(self.var_da28916e7827af7c)) {
        location = getlocation(function_5b2c23ea4889f30b(self.var_da28916e7827af7c));
        var_fcf7b6e6d8c41c8 = function_55be16fb0f5f4a19(function_5b2c23ea4889f30b(self.var_da28916e7827af7c));
    }
    var_7c6183ce9e04512e = #"hash_bfaee2eafd4adedb";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 3:gamemode, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 5:gametype, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_578439261b0ec47b"), 7:var_a74fc57fb4a4d3e6, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_92939ab8dccb3d82"), 9:location, 10:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_dc0d981f2d59d210"), 11:var_fcf7b6e6d8c41c8, 12:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_7164db7c4d5bdb1c"), 13:command, 14:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_4a7f024e87253788"), 15:var_9c46b4c2597d7b03];
    reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10352
// Size: 0x16
function initgameflags(var_c770d7c80bb5d9ac) {
    self.var_c770d7c80bb5d9ac = var_c770d7c80bb5d9ac;
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1036f
// Size: 0xd
function function_9293fc45cc7e5634() {
    return isdefined(self.var_c770d7c80bb5d9ac);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10384
// Size: 0x54
function function_cfe6dcedf7278543(var_df866e95f432cbd7) {
    if (!isdefined(self.var_c770d7c80bb5d9ac)) {
        self.var_c770d7c80bb5d9ac = 0;
        return 0;
    }
    var_8295378fd0a88106 = 0;
    var_8295378fd0a88106 = function_6d40f12a09494350(var_8295378fd0a88106, var_df866e95f432cbd7);
    isset = (self.var_c770d7c80bb5d9ac & var_8295378fd0a88106) != 0;
    return isset;
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x103e0
// Size: 0x6d
function function_b7793133df5fb0df(var_df866e95f432cbd7) {
    if (!isdefined(self.var_c770d7c80bb5d9ac)) {
        self.var_c770d7c80bb5d9ac = 0;
    }
    var_8295378fd0a88106 = 0;
    var_8295378fd0a88106 = function_6d40f12a09494350(var_8295378fd0a88106, var_df866e95f432cbd7);
    function_8feb2dc462cfc7f4(namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_7164db7c4d5bdb1c", #"set_flag"), var_8295378fd0a88106);
    self.var_c770d7c80bb5d9ac = self.var_c770d7c80bb5d9ac | var_8295378fd0a88106;
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10454
// Size: 0x6e
function function_5b58181f4c00ba56(var_df866e95f432cbd7) {
    if (!isdefined(self.var_c770d7c80bb5d9ac)) {
        self.var_c770d7c80bb5d9ac = 0;
    }
    var_8295378fd0a88106 = 0;
    var_8295378fd0a88106 = namespace_aad14af462a74d08::function_6d40f12a09494350(var_8295378fd0a88106, var_df866e95f432cbd7);
    function_8feb2dc462cfc7f4(namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_7164db7c4d5bdb1c", #"clear_flag"), var_8295378fd0a88106);
    self.var_c770d7c80bb5d9ac = self.var_c770d7c80bb5d9ac & ~var_8295378fd0a88106;
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x104c9
// Size: 0x23
function function_38e2bca264061aa0() {
    gametype = function_17c5d7feb226e256();
    function_8359cadd253f9604(self, "complete_blacksite", 1);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x104f3
// Size: 0x23
function function_45ab928fbc73f76c() {
    gametype = function_17c5d7feb226e256();
    function_8359cadd253f9604(self, "complete_stronghold", 1);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1051d
// Size: 0x14
function onplayerteamrevive(reviver, revivee) {
    
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10538
// Size: 0xc
function onsuccessfulhit(objweapon) {
    
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1054b
// Size: 0xb
function onspawn() {
    thread watchplayerunderwater();
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1055d
// Size: 0x4f
function watchplayerunderwater() {
    player = self;
    player notify("watchPlayerUnderwater");
    player endon("watchPlayerUnderwater");
    player endon("death_or_disconnect");
    player endon("game_ended");
    while (1) {
        if (player namespace_8ade6bdb04213c12::isplayerunderwater()) {
            player childthread function_f71341a16372f41c();
        }
        player waittill("scr_change_breath_state");
    }
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x105b3
// Size: 0x28
function function_f71341a16372f41c() {
    player = self;
    player endon("scr_change_breath_state");
    wait(35);
    function_8359cadd253f9604(player, "underwater_challenge_completed", 1);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x105e2
// Size: 0x101
function function_565d6af7da923110(success) {
    if (!challengesenabledforplayer()) {
        return;
    }
    gamemode = getchallengegamemode(self);
    gametype = function_17c5d7feb226e256();
    var_a74fc57fb4a4d3e6 = function_aff35122a61a900b(self.team);
    var_7c6183ce9e04512e = #"hash_8f093c85d9262e5d";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 3:gamemode, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 5:gametype, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"completed"), 7:istrue(success)];
    /#
        function_7d97a2a745e514c4(var_a7a6077754bbc2f8, params);
    #/
    reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x106ea
// Size: 0xdd
function function_7c5850e37b6857dc() {
    if (!challengesenabledforplayer()) {
        return;
    }
    gamemode = getchallengegamemode(self);
    gametype = function_17c5d7feb226e256();
    var_a74fc57fb4a4d3e6 = function_aff35122a61a900b(self.team);
    var_7c6183ce9e04512e = #"hash_ff0f2afd6e4375e9";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 3:gamemode, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 5:gametype];
    /#
        function_7d97a2a745e514c4(var_a7a6077754bbc2f8, params);
    #/
    reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x107ce
// Size: 0x14
function updatesuperweaponkills(objweapon, inflictor) {
    
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x107e9
// Size: 0x1c
function updatesuperkills(var_ebec497ff8b18a45, meansofdeath, var_b34cda8a56dd46c5) {
    
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1080c
// Size: 0xc
function resistedstun(attacker) {
    
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1081f
// Size: 0x3
function triggereddelayedexplosion() {
    
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10829
// Size: 0x1c
function minedestroyed(mine, attacker, type) {
    
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1084c
// Size: 0x3
function roundbegin() {
    
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10856
// Size: 0xc
function roundend(var_8415802b3cfb809b) {
    
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10869
// Size: 0x3e
function playerdamaged(inflictor, attacker, damage, meansofdeath, objweapon, shitloc) {
    self.var_a0595326ca4cf35d = 0;
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x108ae
// Size: 0x14
function processuavassist(owner, uavtype) {
    
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x108c9
// Size: 0x2c
function killstreakdamaged(killstreakname, owner, attacker, weapon, damage) {
    
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x108fc
// Size: 0x49
function iskillstreakvehicle(killstreakname) {
    switch (killstreakname) {
    case #"hash_28d0236400e33fd0":
    case #"hash_4ad475e6e15635bd":
    case #"hash_4d5aa76e8707f47b":
    case #"hash_52d9b7ed584bec3e":
        return 0;
        break;
    }
    return 1;
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1094d
// Size: 0x14
function processfinalkillchallenges(attacker, victim) {
    
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10968
// Size: 0xc
function usedkillstreak(streakname) {
    
}

// Namespace challenges/namespace_aad14af462a74d08
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

// Namespace challenges/namespace_aad14af462a74d08
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10a13
// Size: 0x22
function function_73317c391c8e6d10(player, amount) {
    player function_b7de4afaf79ff9b5("damage", amount);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10a3c
// Size: 0x22
function function_cf995e658ab79867(player, points) {
    player function_b7de4afaf79ff9b5("score", points);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10a65
// Size: 0xd9
function function_4fb61d33f02e8203(player, increment) {
    if (!player challengesenabledforplayer()) {
        return;
    }
    gamemode = getchallengegamemode(player);
    gametype = function_17c5d7feb226e256();
    var_7c6183ce9e04512e = #"capture";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 3:gamemode, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 5:gametype];
    /#
        function_7d97a2a745e514c4(var_a7a6077754bbc2f8, params);
    #/
    player reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
}

// Namespace challenges/namespace_aad14af462a74d08
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
    var_7c6183ce9e04512e = #"hash_d02f135f2d30c63";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 3:gamemode, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 5:gametype, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"playlist_id"), 7:playlistid];
    /#
        function_7d97a2a745e514c4(var_a7a6077754bbc2f8, params);
    #/
    player reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c4e
// Size: 0x7c
function function_8e81148472fb520a(var_196ef0fa8094fcba, var_7c6183ce9e04512e, params, var_afda85311c8ed272) {
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    if (!isdefined(var_a7a6077754bbc2f8) || !isint(var_a7a6077754bbc2f8) && !isstring(var_a7a6077754bbc2f8) || !isdefined(params)) {
        /#
            iprintln("<unknown string>");
        #/
        return;
    }
    /#
        function_7d97a2a745e514c4(var_a7a6077754bbc2f8, params);
    #/
    var_196ef0fa8094fcba reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10cd1
// Size: 0x1f5
function function_fee0bee456eac877(player, var_7c6183ce9e04512e, params, var_3a99d1cafe4a4bac) {
    if (!isdefined(player)) {
        return;
    }
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    if (!isdefined(var_a7a6077754bbc2f8) || !isint(var_a7a6077754bbc2f8) && !isstring(var_a7a6077754bbc2f8)) {
        /#
            iprintln("<unknown string>");
        #/
        return;
    }
    if (isdefined(var_3a99d1cafe4a4bac) && isdefined(var_3a99d1cafe4a4bac.var_21a8839dd03e31cd)) {
        if (isarray(var_3a99d1cafe4a4bac.var_21a8839dd03e31cd)) {
            foreach (var_65607a614b78736b in var_3a99d1cafe4a4bac.var_21a8839dd03e31cd) {
                if (var_65607a614b78736b == player) {
                    continue;
                }
                var_65607a614b78736b reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
                var_65607a614b78736b.var_4f4d3b6fe9b3e3c9 = 1;
            }
        }
    }
    if (issharedfuncdefined("squad_utility", "getSquadMembers")) {
        squad = player [[ getsharedfunc("squad_utility", "getSquadMembers") ]]();
    }
    if (isdefined(squad)) {
        params[params.size] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_f5fd838522276c46");
        params[params.size] = 1;
        foreach (squadmember in squad) {
            if (isdefined(squadmember) && player != squadmember) {
                if (!isdefined(squadmember.var_4f4d3b6fe9b3e3c9)) {
                    squadmember.var_4f4d3b6fe9b3e3c9 = 0;
                }
                if (!istrue(squadmember.var_4f4d3b6fe9b3e3c9)) {
                    squadmember reportchallengeuserserializedeventwrapper(var_a7a6077754bbc2f8, params);
                }
                squadmember.var_4f4d3b6fe9b3e3c9 = 0;
            }
        }
    }
}

// Namespace challenges/namespace_aad14af462a74d08
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
    var_607da387f3617ed1 = player getfireteammembers();
    for (index = 0; index < 5; index++) {
        if (isdefined(var_a8af9a2935dd804f) && isdefined(var_607da387f3617ed1[index]) && var_607da387f3617ed1[index] function_7a32b0201993d7f7() != "") {
            var_a8af9a2935dd804f[index] = var_607da387f3617ed1[index] function_7a32b0201993d7f7();
        } else {
            var_a8af9a2935dd804f[index] = 0;
        }
    }
    return var_a8af9a2935dd804f;
}

// Namespace challenges/namespace_aad14af462a74d08
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f79
// Size: 0x37
function reportchallengeuserserializedeventwrapper(eventid, params) {
    if (isdefined(level.challengesallowed) && level.challengesallowed) {
        self function_db073176839d77fb(eventid, params);
    }
}

