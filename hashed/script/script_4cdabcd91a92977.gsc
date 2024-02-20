// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_247745a526421ba7;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using script_293ba44c408fef1;
#using scripts\cp_mp\challenges.gsc;
#using script_4cdabcd91a92977;

#namespace namespace_bd89c4c41be78d43;

// Namespace namespace_bd89c4c41be78d43/namespace_bf9ffd2b22c7d819
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c9
// Size: 0x130
function main() {
    if (!getdvarint(@"hash_22eddf44003baf9", 0)) {
        return;
    }
    level.lobbyid = function_4f9373a1227db35c();
    level.var_73e946a3eadc84be = function_8345f2ac499e5ab();
    level.var_f60ab21fbeb423c = undefined;
    level.var_37767375d12e7150 = [];
    level.var_3da7cf812433fd50 = getdvarint(@"hash_35fe3b926d86a034", 1);
    level.var_e20af527a1d336f6 = getdvarint(@"hash_d5ff0d8a153049ed", 1);
    level.var_93535d58322394f6 = getdvarint(@"hash_52278a2e894c7b5b", 5);
    level.var_41a1383064b06b78 = getdvarint(@"hash_730841e9076cb2d7", 1) == 1;
    level.var_a92efeef2c4f6e45 = getdvarint(@"hash_5d13c057b0e9cc7b", 0) == 1;
    level.var_8c4a1a7b619d8e7c = getdvarint(@"hash_ae52a11cd305ab26", 1) == 1;
    level.var_bcd757fb7c2137b1 = getdvarfloat(@"hash_522795feb86c7c2a", 1);
    level.var_83b8cf86ae62e3da = undefined;
    if (!isdefined(game["rejoinedPlayers"])) {
        game["rejoinedPlayers"] = [];
    }
    level thread function_860ade42d09bcc50();
    level thread function_990e6e94fef53e1a();
}

// Namespace namespace_bd89c4c41be78d43/namespace_bf9ffd2b22c7d819
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x400
// Size: 0x25
function function_e3bd94413509bc25() {
    return getdvarint(@"hash_925f7dceb8e6205e", 0) && getdvarint(@"hash_22eddf44003baf9", 0);
}

// Namespace namespace_bd89c4c41be78d43/namespace_bf9ffd2b22c7d819
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42d
// Size: 0x16
function function_8ce5b106fbba9e9f(var_abe916e564c32276) {
    level.var_f60ab21fbeb423c = var_abe916e564c32276;
}

// Namespace namespace_bd89c4c41be78d43/namespace_bf9ffd2b22c7d819
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44a
// Size: 0x4c
function function_8fe6d6539ed31a88(var_abe916e564c32276) {
    if (!getdvarint(@"hash_22eddf44003baf9", 0)) {
        return;
    }
    if (!isdefined(level.var_37767375d12e7150)) {
        level.var_37767375d12e7150 = [];
    }
    level.var_37767375d12e7150[level.var_37767375d12e7150.size] = var_abe916e564c32276;
}

// Namespace namespace_bd89c4c41be78d43/namespace_bf9ffd2b22c7d819
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49d
// Size: 0x29
function function_ead10448a780a58(var_abe916e564c32276) {
    if (!getdvarint(@"hash_22eddf44003baf9", 0)) {
        return;
    }
    level.var_83b8cf86ae62e3da = var_abe916e564c32276;
}

// Namespace namespace_bd89c4c41be78d43/namespace_bf9ffd2b22c7d819
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cd
// Size: 0x28
function function_884994e73914ee32(var_7c6183ce9e04512e) {
    if (isdefined(level.var_f60ab21fbeb423c)) {
        return [[ level.var_f60ab21fbeb423c ]](self, var_7c6183ce9e04512e);
    }
    return [];
}

// Namespace namespace_bd89c4c41be78d43/namespace_bf9ffd2b22c7d819
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fd
// Size: 0x29
function function_19f146e8ffa78ff9(var_934dc135aaf6f953) {
    if (isdefined(level.var_83b8cf86ae62e3da)) {
        return [[ level.var_83b8cf86ae62e3da ]](self, var_934dc135aaf6f953);
    }
    return 1;
}

// Namespace namespace_bd89c4c41be78d43/namespace_bf9ffd2b22c7d819
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52e
// Size: 0xae
function function_71fbbbf19edcef28() {
    if (istrue(level.var_e20af527a1d336f6)) {
        teammates = level.teamdata[self.team]["alivePlayers"];
        var_ffc368c1d2a95b7b = 0;
        if (isdefined(teammates) && teammates.size > 0) {
            foreach (teammate in teammates) {
                if (self == teammate) {
                    continue;
                }
                var_ffc368c1d2a95b7b++;
            }
        }
        if (var_ffc368c1d2a95b7b > 0) {
            return 1;
        } else {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_bd89c4c41be78d43/namespace_bf9ffd2b22c7d819
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e4
// Size: 0xb3
function function_c9b26cfb4d93ae50() {
    if (isdefined(level.var_93535d58322394f6) && level.var_93535d58322394f6 >= 1) {
        var_75a8eb8af196b837 = 0;
        foreach (entry in level.teamnamelist) {
            alivecount = level.teamdata[entry]["aliveCount"];
            if (alivecount > 0) {
                var_75a8eb8af196b837++;
            }
            if (var_75a8eb8af196b837 >= level.var_93535d58322394f6) {
                return 1;
            }
        }
        return 0;
    }
    return 1;
}

// Namespace namespace_bd89c4c41be78d43/namespace_bf9ffd2b22c7d819
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69f
// Size: 0x126
function function_87fc9992c0b60276(var_c4f3e9732aa81389) {
    var_9642449afa2ebf37 = 0;
    switch (var_c4f3e9732aa81389) {
    case 0:
        var_9642449afa2ebf37 = 0;
        break;
    case 1:
    case 2:
        var_9642449afa2ebf37 = getdvarint(@"hash_1839b10b70a97d91", 0);
        break;
    case 3:
        var_9642449afa2ebf37 = getdvarint(@"hash_f690f29f47f7a379", 0);
        break;
    case 6:
        var_9642449afa2ebf37 = getdvarint(@"hash_b37dbaa903c45ccd", 1);
        break;
    case 7:
        var_9642449afa2ebf37 = getdvarint(@"hash_bea9cf0dccf411ec", 0);
        break;
    case 14:
        var_9642449afa2ebf37 = getdvarint(@"hash_8f3adc0694ded53c", 0);
        break;
    default:
        var_9642449afa2ebf37 = 1;
        break;
    }
    if (!var_9642449afa2ebf37) {
        return 0;
    }
    var_9642449afa2ebf37 = function_19f146e8ffa78ff9(var_c4f3e9732aa81389);
    if (!var_9642449afa2ebf37) {
        return 0;
    }
    var_9642449afa2ebf37 = function_c9b26cfb4d93ae50();
    if (!var_9642449afa2ebf37) {
        return 0;
    }
    var_9642449afa2ebf37 = function_71fbbbf19edcef28();
    if (!var_9642449afa2ebf37) {
        return 0;
    }
    return 1;
}

// Namespace namespace_bd89c4c41be78d43/namespace_bf9ffd2b22c7d819
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7cd
// Size: 0x306
function function_69359e69555329ac(var_934dc135aaf6f953) {
    player = self;
    level endon("game_ended");
    player notify("rejoin_analytics_start");
    player endon("rejoin_analytics_start");
    isplayeronground = player isonground();
    isplayerinvehicle = player namespace_f8065cafc523dba5::isinvehicle();
    var_56fbbe6c2c822322 = player isswimming();
    var_15ad7f4a17476a54 = player ispcplayer();
    var_7d723d78c14b4a78 = player usinggamepad();
    playerorigin = player.origin;
    var_79544f8fc581743a = gettime();
    playerteam = player.team;
    var_3ee23976deb888b9 = player waittill_any_return_2("successfully_disconnect_rejoin", "rejected_disconnect_rejoin");
    if (!isdefined(player)) {
        return;
    }
    eventparams = [];
    eventparams[eventparams.size] = "is_rejoin_successful";
    var_65fe6e16a63f6fe2 = 0;
    if (isdefined(var_3ee23976deb888b9)) {
        var_65fe6e16a63f6fe2 = ter_op(var_3ee23976deb888b9 == "successfully_disconnect_rejoin", 1, 0);
    }
    eventparams[eventparams.size] = var_65fe6e16a63f6fe2;
    eventparams[eventparams.size] = "rejoin_type";
    eventparams[eventparams.size] = var_934dc135aaf6f953;
    eventparams[eventparams.size] = "rejoin_duration";
    var_2a52633a34d255c = -1;
    if (isdefined(var_79544f8fc581743a)) {
        var_2a52633a34d255c = (gettime() - var_79544f8fc581743a) / 1000;
    }
    eventparams[eventparams.size] = var_2a52633a34d255c;
    eventparams[eventparams.size] = "player_x";
    eventparams[eventparams.size] = playerorigin[0];
    eventparams[eventparams.size] = "player_y";
    eventparams[eventparams.size] = playerorigin[1];
    eventparams[eventparams.size] = "player_z";
    eventparams[eventparams.size] = playerorigin[2];
    eventparams[eventparams.size] = "squad_size";
    var_52c67013bd17e0e0 = -1;
    if (isdefined(level.teamdata)) {
        var_52c67013bd17e0e0 = int(level.teamdata[playerteam]["players"].size);
    }
    eventparams[eventparams.size] = var_52c67013bd17e0e0;
    eventparams[eventparams.size] = "player_platform";
    eventparams[eventparams.size] = var_15ad7f4a17476a54;
    eventparams[eventparams.size] = "player_input";
    eventparams[eventparams.size] = var_7d723d78c14b4a78;
    eventparams[eventparams.size] = "match_alive_players_left";
    var_1f7bcaa53ca6d399 = -1;
    if (isdefined(level.teamnamelist) && isdefined(level.teamdata)) {
        foreach (entry in level.teamnamelist) {
            var_1f7bcaa53ca6d399 = var_1f7bcaa53ca6d399 + level.teamdata[entry]["aliveCount"];
        }
        var_1f7bcaa53ca6d399++;
    }
    eventparams[eventparams.size] = var_1f7bcaa53ca6d399;
    eventparams[eventparams.size] = "is_player_swimming";
    eventparams[eventparams.size] = var_56fbbe6c2c822322;
    eventparams[eventparams.size] = "is_player_in_vehicle";
    eventparams[eventparams.size] = isplayerinvehicle;
    eventparams[eventparams.size] = "is_player_on_ground";
    eventparams[eventparams.size] = isplayeronground;
    player dlog_recordplayerevent("dlog_event_br_disconnect_rejoin", eventparams);
}

// Namespace namespace_bd89c4c41be78d43/namespace_bf9ffd2b22c7d819
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xada
// Size: 0x3e
function function_2e8537357f01a56b(var_1e904d14a41d4385, key) {
    i = 0;
    while (i < var_1e904d14a41d4385.size - 1) {
        if (var_1e904d14a41d4385[i] == key) {
            return i;
        }
        i = i + 2;
    }
    return undefined;
}

// Namespace namespace_bd89c4c41be78d43/namespace_bf9ffd2b22c7d819
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb20
// Size: 0x19b
function function_2fcdc8c12f068abb(array1, array2, var_e1e0e4a54c3d275c) {
    combined = [];
    if (!isarray(array1) || array1.size % 2 != 0 || !isarray(array2) || array2.size % 2 != 0) {
        namespace_3c37cb17ade254d::error("called rejoin_utility::combineKVPArrays with invalid array");
        return combined;
    }
    keys = [];
    values = [];
    i = 0;
    j = 0;
    while (i < array1.size - 1 || j < array2.size - 1) {
        if (i < array1.size - 1 && !namespace_3c37cb17ade254d::array_contains(keys, array1[i])) {
            keys[keys.size] = array1[i];
            values[values.size] = array1[i + 1];
        }
        if (j < array2.size - 1 && !namespace_3c37cb17ade254d::array_contains(keys, array2[j])) {
            keys[keys.size] = array2[j];
            values[values.size] = array2[j + 1];
        }
        i = i + 2;
        j = j + 2;
    }
    var_71eb150f91b3456b = namespace_3c37cb17ade254d::ter_op(istrue(var_e1e0e4a54c3d275c), array2, array1);
    i = 0;
    while (i < var_71eb150f91b3456b.size - 1) {
        key = var_71eb150f91b3456b[i];
        var_2172db62590952ae = namespace_3c37cb17ade254d::array_find(keys, key);
        if (isdefined(var_2172db62590952ae)) {
            values[var_2172db62590952ae] = var_71eb150f91b3456b[i + 1];
        }
        i = i + 2;
    }
    for (i = 0; i < keys.size; i++) {
        combined[combined.size] = keys[i];
        combined[combined.size] = values[i];
    }
    return combined;
}

// Namespace namespace_bd89c4c41be78d43/namespace_bf9ffd2b22c7d819
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcc3
// Size: 0x53
function function_dc60e20e9216b5b2() {
    if (!level.onlinegame) {
        /#
            println("challenges");
        #/
        return;
    }
    if (!getdvarint(@"hash_22eddf44003baf9", 0)) {
        return;
    }
    var_ba664f53dea8a25c = getdvarint(@"hash_925f7dceb8e6205e", 0);
    function_c5728699e6b79552(var_ba664f53dea8a25c);
}

// Namespace namespace_bd89c4c41be78d43/namespace_bf9ffd2b22c7d819
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd1d
// Size: 0x2e
function function_4064a2271de12b97() {
    if (!getdvarint(@"hash_22eddf44003baf9", 0)) {
        return;
    }
    function_c5728699e6b79552(0);
    setdvar(@"hash_925f7dceb8e6205e", 0);
}

// Namespace namespace_bd89c4c41be78d43/namespace_bf9ffd2b22c7d819
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd52
// Size: 0x7b
function function_342af7ea8a120b16() {
    if (!level.onlinegame) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    if (!getdvarint(@"hash_22eddf44003baf9", 0)) {
        return;
    }
    var_ba664f53dea8a25c = getdvarint(@"hash_925f7dceb8e6205e", 0);
    var_7c6183ce9e04512e = #"hash_693c31bc8b685cab";
    if (var_ba664f53dea8a25c) {
        function_74b707898164ed78(0, 0, var_7c6183ce9e04512e, []);
    } else {
        function_e90d7800fb5eec03(0, var_7c6183ce9e04512e, []);
    }
}

// Namespace namespace_bd89c4c41be78d43/namespace_bf9ffd2b22c7d819
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd4
// Size: 0x18f
function function_59121677f31f75a5() {
    self endon("disconnect");
    level endon("game_ended");
    if (!getdvarint(@"hash_22eddf44003baf9", 0)) {
        return;
    }
    xuid = self getxuid();
    if (getdvarint(@"hash_7d06167bc4176e5e", 0)) {
        if (isdefined(level.var_67a646dc2b984dac)) {
            self thread [[ level.var_67a646dc2b984dac ]]();
        }
        if (isdefined(level.var_62a7b43f2b60646d)) {
            self [[ level.var_62a7b43f2b60646d ]]();
        }
    }
    if (!array_contains(game["rejoinedPlayers"], xuid)) {
        /#
            println("<unknown string>" + self.name + "<unknown string>" + xuid + "<unknown string>");
        #/
        game["rejoinedPlayers"] = array_add_safe(game["rejoinedPlayers"], xuid);
    } else {
        /#
            println("<unknown string>" + self.name + "<unknown string>" + xuid + "<unknown string>");
        #/
    }
    self.var_632bad3edb4e449e = 0;
    self notify("successfully_disconnect_rejoin");
    self notify("afk_tracking_resume");
    self.var_cbece90c5beea82 = 0;
    if (isdefined(level.var_2f60d02380cd603d)) {
        self [[ level.var_2f60d02380cd603d ]]();
    }
    if (isdefined(level.var_37767375d12e7150)) {
        foreach (callback in level.var_37767375d12e7150) {
            [[ callback ]](self);
        }
    }
}

// Namespace namespace_bd89c4c41be78d43/namespace_bf9ffd2b22c7d819
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf6a
// Size: 0x1bc
function function_8cf8ff669ac52156(var_934dc135aaf6f953, var_cf51d5a9282df88b) {
    var_7c6183ce9e04512e = #"hash_693c31bc8b685cab";
    var_400cd07ec60d425c = function_884994e73914ee32(var_7c6183ce9e04512e);
    var_ba664f53dea8a25c = getdvarint(@"hash_925f7dceb8e6205e", 0);
    if (getdvarint(@"hash_22eddf44003baf9", 0) != 0 && var_ba664f53dea8a25c) {
        var_c4f3e9732aa81389 = function_4f6df967144e2cb4(var_934dc135aaf6f953);
        if (isdefined(var_cf51d5a9282df88b) && var_cf51d5a9282df88b) {
            self.var_632bad3edb4e449e = 1;
        }
        var_38968ef355b4d2ec = 0;
        if (var_c4f3e9732aa81389 != 0) {
            var_38968ef355b4d2ec = function_87fc9992c0b60276(var_c4f3e9732aa81389);
            if (var_38968ef355b4d2ec) {
                xuid = self getxuid();
                if (array_contains(game["rejoinedPlayers"], xuid)) {
                    var_c4f3e9732aa81389 = 5;
                    var_38968ef355b4d2ec = getdvarint(@"hash_42d413a1a32e906f", 0);
                }
            }
        }
        if (!istrue(var_cf51d5a9282df88b)) {
            var_38968ef355b4d2ec = 0;
        }
        if (var_38968ef355b4d2ec) {
            function_74b707898164ed78(var_c4f3e9732aa81389, 1, var_7c6183ce9e04512e, var_400cd07ec60d425c);
            thread function_69359e69555329ac(var_c4f3e9732aa81389);
            self.var_cbece90c5beea82 = 1;
            if (istrue(level.var_41a1383064b06b78)) {
                wait(level.var_bcd757fb7c2137b1);
                vehicle = self.vehicle;
                if (isdefined(vehicle)) {
                    driver = namespace_1fbd40990ee60ede::vehicle_occupancy_getdriver(vehicle);
                    if (isdefined(driver) && driver == self) {
                        thread namespace_1fbd40990ee60ede::vehicle_occupancy_exit(vehicle, undefined, self, undefined, 1);
                    }
                }
            }
            if (istrue(level.var_a92efeef2c4f6e45)) {
                wait(level.var_bcd757fb7c2137b1);
                self suicide();
            }
        } else {
            function_e90d7800fb5eec03(var_c4f3e9732aa81389, var_7c6183ce9e04512e, var_400cd07ec60d425c);
            self notify("rejected_disconnect_rejoin");
        }
    } else {
        function_13399aa20634edce(var_7c6183ce9e04512e, var_400cd07ec60d425c);
    }
}

// Namespace namespace_bd89c4c41be78d43/namespace_bf9ffd2b22c7d819
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x112d
// Size: 0x128
function private function_860ade42d09bcc50() {
    level endon("game_ended");
    while (1) {
        var_c248456fe9648490 = getdvarint(@"hash_cb027608b7396745", 30);
        if (var_c248456fe9648490 <= 10) {
            var_c248456fe9648490 = 10;
        }
        wait(var_c248456fe9648490);
        var_a1e7045e3e4ca353 = [];
        if (!isdefined(level.players) || level.players.size == 0) {
            continue;
        }
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            if (isdefined(player.var_632bad3edb4e449e) && player.var_632bad3edb4e449e == 1) {
                if (isdefined(player.var_2ff6825157b156e) && player.var_2ff6825157b156e == 1) {
                    var_a1e7045e3e4ca353[var_a1e7045e3e4ca353.size] = player;
                }
            }
        }
        var_f0fa8d0645074b69 = getdvarint(@"hash_3c26c38af324c343", 7446);
        function_10a17a516d1e84ed(var_a1e7045e3e4ca353, var_f0fa8d0645074b69);
    }
}

// Namespace namespace_bd89c4c41be78d43/namespace_bf9ffd2b22c7d819
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x125c
// Size: 0x152
function private function_990e6e94fef53e1a() {
    level endon("game_ended");
    while (1) {
        var_c248456fe9648490 = getdvarint(@"hash_e1b1c0bfb40859f", 1);
        if (var_c248456fe9648490 <= 1) {
            var_c248456fe9648490 = 1;
        }
        wait(var_c248456fe9648490);
        if (!isdefined(level.players) || level.players.size == 0) {
            continue;
        }
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            if (isdefined(player.var_97ca959a561f976e) && player.var_97ca959a561f976e == 1) {
                kick(player getentitynumber(), "EXE/PLAYERKICKED_REJOIN");
            } else if (isdefined(player.var_632bad3edb4e449e) && player.var_632bad3edb4e449e == 1) {
                if (isdefined(player.var_2ff6825157b156e) && player.var_2ff6825157b156e == 0) {
                    /#
                        logstring("<unknown string>" + player getxuid() + "<unknown string>");
                    #/
                    kick(player getentitynumber(), "EXE/PLAYERKICKED_REJOIN");
                }
            }
        }
    }
}

// Namespace namespace_bd89c4c41be78d43/namespace_bf9ffd2b22c7d819
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b5
// Size: 0x151
function function_a1b2dc3090437789(var_4b86a4e17c656399, var_534bd24a37e5d78a) {
    var_f0fa8d0645074b69 = getdvarint(@"hash_3c26c38af324c343", 7446);
    if (var_4b86a4e17c656399 == var_f0fa8d0645074b69) {
        var_2a7a539b9d1d9972 = namespace_c8d5de7d515ce477::function_691880160b33d133("sub_progress");
        var_abc57bb73d4bf1a = 0;
        for (index = 0; index < var_534bd24a37e5d78a.var_d0eca76a743a7085.size; index++) {
            var_5a55c21dfb8c9f92 = var_534bd24a37e5d78a.var_d0eca76a743a7085[index].var_5a55c21dfb8c9f92;
            if (var_2a7a539b9d1d9972 == var_5a55c21dfb8c9f92) {
                var_abc57bb73d4bf1a = var_534bd24a37e5d78a.var_d0eca76a743a7085[index].progress;
                break;
            }
        }
        /#
            println("<unknown string>" + self.name + "<unknown string>" + var_4b86a4e17c656399 + "<unknown string>" + var_abc57bb73d4bf1a);
        #/
        if (var_abc57bb73d4bf1a == 10) {
            /#
                logstring("<unknown string>" + self getxuid() + "<unknown string>");
            #/
            self.var_97ca959a561f976e = 1;
        } else if (var_abc57bb73d4bf1a == 11) {
            /#
                logstring("<unknown string>" + self getxuid() + "<unknown string>");
            #/
            self.var_97ca959a561f976e = 1;
            self.var_5bf9e082ad798489 = 1;
        }
    }
}

// Namespace namespace_bd89c4c41be78d43/namespace_bf9ffd2b22c7d819
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x150d
// Size: 0xaa
function function_c5728699e6b79552(var_38968ef355b4d2ec) {
    var_ba664f53dea8a25c = getdvarint(@"hash_925f7dceb8e6205e", 0);
    var_7c6183ce9e04512e = #"hash_693c31bc8b685cab";
    foreach (player in level.players) {
        if (var_ba664f53dea8a25c && var_38968ef355b4d2ec) {
            player function_74b707898164ed78(0, 0, var_7c6183ce9e04512e, []);
        } else {
            player function_e90d7800fb5eec03(0, var_7c6183ce9e04512e, []);
        }
    }
}

// Namespace namespace_bd89c4c41be78d43/namespace_bf9ffd2b22c7d819
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15be
// Size: 0x46
function function_fb67b62bbd718b34() {
    now = getsystemtime();
    rejoin_duration = getdvarint(@"hash_f4417cc21744fb67", 0);
    var_1517a9cfb1f4de62 = namespace_3c37cb17ade254d::ter_op(rejoin_duration == 0, 0, now + rejoin_duration);
    return var_1517a9cfb1f4de62;
}

// Namespace namespace_bd89c4c41be78d43/namespace_bf9ffd2b22c7d819
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x160c
// Size: 0x239
function function_74b707898164ed78(reason, var_21907994a349f164, var_7c6183ce9e04512e, var_400cd07ec60d425c) {
    if (!level.onlinegame) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    if (!getdvarint(@"hash_925f7dceb8e6205e", 0)) {
        /#
            println("<unknown string>" + self.name + "<unknown string>");
        #/
        return;
    }
    if (!isdefined(reason)) {
        /#
            println("<unknown string>" + self.name + "<unknown string>");
        #/
        return;
    }
    if (!isint(reason)) {
        /#
            println("<unknown string>" + self.name + "<unknown string>");
        #/
        return;
    }
    self.var_2ff6825157b156e = 1;
    gamemode = namespace_aad14af462a74d08::getchallengegamemode(self);
    var_1517a9cfb1f4de62 = 0;
    if (var_21907994a349f164) {
        var_1517a9cfb1f4de62 = namespace_bf9ffd2b22c7d819::function_fb67b62bbd718b34();
        /#
            println("<unknown string>" + self.name + "<unknown string>" + reason + "<unknown string>" + level.var_73e946a3eadc84be + "<unknown string>" + level.lobbyid + "<unknown string>" + var_1517a9cfb1f4de62);
        #/
    }
    var_bd15d7d46de8f2de = [0:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_b212dbb46f19de20"), 1:1, 2:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"disconnect_reason"), 3:reason, 4:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_5fba2f25f07000f5"), 5:level.var_73e946a3eadc84be, 6:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 7:gamemode, 8:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_d8d873c978f56981"), 9:level.lobbyid, 10:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_ab984d923d5f2c96"), 11:var_1517a9cfb1f4de62, 12:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"playlist_version"), 13:getplaylistversion()];
    if (isdefined(var_400cd07ec60d425c) && var_400cd07ec60d425c.size > 0) {
        var_bd15d7d46de8f2de = function_2fcdc8c12f068abb(var_bd15d7d46de8f2de, var_400cd07ec60d425c, 1);
    }
    function_13399aa20634edce(var_7c6183ce9e04512e, var_bd15d7d46de8f2de);
    self function_10f8291e7ffed82c(1, var_1517a9cfb1f4de62);
}

// Namespace namespace_bd89c4c41be78d43/namespace_bf9ffd2b22c7d819
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x184c
// Size: 0x1c5
function function_e90d7800fb5eec03(reason, var_7c6183ce9e04512e, var_400cd07ec60d425c) {
    if (!level.onlinegame) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    if (!isdefined(reason)) {
        /#
            println("<unknown string>" + self.name + "<unknown string>");
        #/
        return;
    }
    if (!isint(reason)) {
        /#
            println("<unknown string>" + self.name + "<unknown string>");
        #/
        return;
    }
    /#
        println("<unknown string>" + self.name + "<unknown string>" + reason + "<unknown string>" + level.var_73e946a3eadc84be + "<unknown string>" + level.lobbyid + "<unknown string>");
    #/
    self.var_2ff6825157b156e = 0;
    gamemode = namespace_aad14af462a74d08::getchallengegamemode(self);
    var_bd15d7d46de8f2de = [0:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_b212dbb46f19de20"), 1:0, 2:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"disconnect_reason"), 3:reason, 4:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_5fba2f25f07000f5"), 5:level.var_73e946a3eadc84be, 6:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 7:gamemode, 8:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_d8d873c978f56981"), 9:level.lobbyid, 10:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"playlist_version"), 11:getplaylistversion()];
    if (isdefined(var_400cd07ec60d425c) && var_400cd07ec60d425c.size > 0) {
        var_bd15d7d46de8f2de = function_2fcdc8c12f068abb(var_bd15d7d46de8f2de, var_400cd07ec60d425c, 1);
    }
    function_13399aa20634edce(var_7c6183ce9e04512e, var_bd15d7d46de8f2de);
    self function_10f8291e7ffed82c(0);
}

// Namespace namespace_bd89c4c41be78d43/namespace_bf9ffd2b22c7d819
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a18
// Size: 0x57
function function_13399aa20634edce(var_7c6183ce9e04512e, var_1e904d14a41d4385) {
    if (!isdefined(var_1e904d14a41d4385) || !isdefined(var_1e904d14a41d4385.size) || var_1e904d14a41d4385.size < 2) {
        return;
    }
    if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
        function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", function_6e2deb013c9ca85e(var_7c6183ce9e04512e), var_1e904d14a41d4385);
    }
}

// Namespace namespace_bd89c4c41be78d43/namespace_bf9ffd2b22c7d819
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a76
// Size: 0x96
function function_4f6df967144e2cb4(var_934dc135aaf6f953) {
    if (var_934dc135aaf6f953 == %"EXE/PLAYERKICKED_TEAMKILLS") {
        return 3;
    } else if (var_934dc135aaf6f953 == %"exe/disconnected") {
        return 14;
    } else if (var_934dc135aaf6f953 == %"hash_7ca98f63b2722011") {
        return 2;
    } else if (var_934dc135aaf6f953 == %"hash_7194ffe36169ca7") {
        return 2;
    } else if (var_934dc135aaf6f953 == %"hash_5b309dc0bff1f44d") {
        return 2;
    } else if (var_934dc135aaf6f953 == %"hash_539e18c78905606e") {
        return 6;
    } else if (var_934dc135aaf6f953 == %"EXE/PLAYERKICKED_INACTIVE") {
        return 7;
    }
    return 0;
}

