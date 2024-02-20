// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_18c0c1ddac39266a;

// Namespace namespace_18c0c1ddac39266a/namespace_d2b94521fd636348
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d5
// Size: 0x248
function function_39dc350193dd4bc4() {
    level.var_c9cb1071ea249e41 = [];
    var_d4ee35db6dbb7975 = tablelookupgetnumrows("sound/tables/s6/dialog/gamedef_ref_table.csv");
    for (rownum = 0; rownum < var_d4ee35db6dbb7975; rownum++) {
        var_c8e0895d07762040 = tablelookupbyrow("sound/tables/s6/dialog/gamedef_ref_table.csv", rownum, 0);
        if (!function_7b8ed176d07a4820(var_c8e0895d07762040)) {
            continue;
        }
        var_5c1182cb547ca916 = tablelookupbyrow("sound/tables/s6/dialog/gamedef_ref_table.csv", rownum, 3);
        if (!function_1d467e88533267f6(var_5c1182cb547ca916, var_c8e0895d07762040)) {
            continue;
        }
        var_1f9cca93e19cf99c = tablelookupbyrow("sound/tables/s6/dialog/gamedef_ref_table.csv", rownum, 1);
        if (!function_13bccd41285b29fc(var_1f9cca93e19cf99c, var_c8e0895d07762040, var_5c1182cb547ca916)) {
            continue;
        }
        if (var_1f9cca93e19cf99c == "remote_turret") {
            var_1f9cca93e19cf99c = "sentry_gun";
        } else if (var_1f9cca93e19cf99c == "Kortac EMP Plane Pilot") {
            var_1f9cca93e19cf99c = "KorTac EMP Plane Pilot";
        }
        if (!isdefined(level.var_c9cb1071ea249e41[var_c8e0895d07762040])) {
            level.var_c9cb1071ea249e41[var_c8e0895d07762040] = [];
        }
        var_a6461de9055834b5 = spawnstruct();
        var_a6461de9055834b5.var_1f9cca93e19cf99c = var_1f9cca93e19cf99c;
        var_a6461de9055834b5.var_5b5ee73adfddd952 = tablelookupbyrow("sound/tables/s6/dialog/gamedef_ref_table.csv", rownum, 2);
        var_a6461de9055834b5.parent = var_5c1182cb547ca916;
        level.var_c9cb1071ea249e41[var_c8e0895d07762040][level.var_c9cb1071ea249e41[var_c8e0895d07762040].size] = var_a6461de9055834b5;
    }
    if (!getdvarint(@"hash_cda8c6774f4bd53c", 1)) {
        return;
    }
    level.var_bb06a7f803299c8c = [];
    var_d4ee35db6dbb7975 = tablelookupgetnumrows("sound/tables/iw9/dialog/gamedef_ref_table.csv");
    for (rownum = 0; rownum < var_d4ee35db6dbb7975; rownum++) {
        var_c8e0895d07762040 = tablelookupbyrow("sound/tables/iw9/dialog/gamedef_ref_table.csv", rownum, 0);
        if (!function_7b8ed176d07a4820(var_c8e0895d07762040)) {
            continue;
        }
        var_5c1182cb547ca916 = tablelookupbyrow("sound/tables/iw9/dialog/gamedef_ref_table.csv", rownum, 3);
        if (!function_1d467e88533267f6(var_5c1182cb547ca916, var_c8e0895d07762040)) {
            continue;
        }
        var_1f9cca93e19cf99c = tablelookupbyrow("sound/tables/iw9/dialog/gamedef_ref_table.csv", rownum, 1);
        if (!function_13bccd41285b29fc(var_1f9cca93e19cf99c, var_c8e0895d07762040, var_5c1182cb547ca916)) {
            continue;
        }
        if (!isdefined(level.var_bb06a7f803299c8c[var_c8e0895d07762040])) {
            level.var_bb06a7f803299c8c[var_c8e0895d07762040] = [];
        }
        var_a6461de9055834b5 = spawnstruct();
        var_a6461de9055834b5.var_1f9cca93e19cf99c = var_1f9cca93e19cf99c;
        var_a6461de9055834b5.var_5b5ee73adfddd952 = tablelookupbyrow("sound/tables/iw9/dialog/gamedef_ref_table.csv", rownum, 2);
        var_a6461de9055834b5.parent = var_5c1182cb547ca916;
        level.var_bb06a7f803299c8c[var_c8e0895d07762040][level.var_bb06a7f803299c8c[var_c8e0895d07762040].size] = var_a6461de9055834b5;
    }
}

// Namespace namespace_18c0c1ddac39266a/namespace_d2b94521fd636348
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x724
// Size: 0xd0
function private function_6b50082c54e1a0d3(var_c8e0895d07762040, var_1f9cca93e19cf99c) {
    if (var_c8e0895d07762040 != "Character") {
        return 0;
    }
    var_cdd017ce39251474 = [0:"Operator", 1:"Chopper Gunner", 2:"Chopper Pilot", 3:"Drone Pilot", 4:"Gunship Nav", 5:"Gunship Pilot", 6:"Gunship Sensor", 7:"Helo Pilot", 8:"Mortar Gunner"];
    foreach (str in var_cdd017ce39251474) {
        if (issubstr(var_1f9cca93e19cf99c, str)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_18c0c1ddac39266a/namespace_d2b94521fd636348
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fc
// Size: 0xb7
function function_5b0451cdda5803e8(var_1f9cca93e19cf99c) {
    var_400d80e48322c797 = [0:"uav", 1:"airdrop", 2:"airdrop_escort", 3:"airdrop_multiple", 4:"assault_drone", 5:"auto_drone", 6:"chopper_gunner", 7:"gunship", 8:"cruise_predator", 9:"directional_uav", 10:"fuel_airstrike", 11:"hover_jet", 12:"scrambler_drone_guard", 13:"toma_strike", 14:"precision_airstrike", 15:"juggernaut"];
    if (array_contains(var_400d80e48322c797, var_1f9cca93e19cf99c)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_18c0c1ddac39266a/namespace_d2b94521fd636348
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8bb
// Size: 0x5c
function private function_7b8ed176d07a4820(var_c8e0895d07762040) {
    if (!isdefined(var_c8e0895d07762040)) {
        return 0;
    }
    switch (var_c8e0895d07762040) {
    case #"hash_1ffc0efa5ad2a952":
    case #"hash_3ba2e9bad3b576e6":
    case #"hash_6129c50ada7bcca3":
    case #"hash_6f6034fb855eddca":
    case #"hash_7d493ed7181c2fae":
        return 0;
        break;
    }
    return 1;
}

// Namespace namespace_18c0c1ddac39266a/namespace_d2b94521fd636348
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x91f
// Size: 0x60
function private function_1d467e88533267f6(var_5c1182cb547ca916, var_c8e0895d07762040) {
    if (!isdefined(var_5c1182cb547ca916) || var_5c1182cb547ca916 == "" && var_c8e0895d07762040 != "Character") {
        return 0;
    }
    tokens = strtok(var_5c1182cb547ca916, "_");
    if (tokens.size == 0 || tokens[0] == "mp") {
        return 1;
    }
    return 0;
}

// Namespace namespace_18c0c1ddac39266a/namespace_d2b94521fd636348
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x987
// Size: 0x196
function private function_13bccd41285b29fc(var_1f9cca93e19cf99c, var_c8e0895d07762040, var_5c1182cb547ca916) {
    if (!isdefined(var_1f9cca93e19cf99c) || var_1f9cca93e19cf99c == "") {
        return 0;
    }
    switch (var_c8e0895d07762040) {
    case #"hash_174c0a6c9c845cf1":
        tokens = strtok(var_1f9cca93e19cf99c, "_");
        if (tokens.size > 0 && isdefined(tokens[1]) && (tokens[1] == "killstreak" || tokens[1] == "fieldupgrade" || tokens[1] == "equipment")) {
            return 1;
        }
        break;
    case #"hash_c75355ed41b5bc53":
        if (isdefined(var_5c1182cb547ca916)) {
            tokens = strtok(var_5c1182cb547ca916, "_");
            if (tokens.size > 0 && isdefined(tokens[1]) && (tokens[1] == "killstreak" || tokens[1] == "fieldupgrade" || tokens[1] == "equipment")) {
                return 1;
            }
        }
        break;
    case #"hash_fa9a9f82be7c7750":
        tokens = strtok(var_1f9cca93e19cf99c, " ");
        if (tokens.size > 0 && (isdefined(tokens[0]) && function_3f64deb57a4966b2(tokens[0]) || isdefined(tokens[1]) && tokens[1] == "Team")) {
            return 1;
        }
        break;
    case #"hash_6f8dfe52d0c03fdf":
        tokens = strtok(var_1f9cca93e19cf99c, "_");
        if (tokens.size > 0 && isdefined(tokens[2]) && (tokens[2] == "leader" || tokens[2] == "operator")) {
            return 1;
        }
        break;
    }
    return 0;
}

// Namespace namespace_18c0c1ddac39266a/namespace_d2b94521fd636348
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb25
// Size: 0xce
function function_3f64deb57a4966b2(ref) {
    switch (ref) {
    case #"hash_1f2f530b7da0d4ba":
    case #"hash_2892a50b525254f1":
    case #"hash_30f1996ee57c42bd":
    case #"hash_332a13e51c2db6b1":
    case #"hash_3a46650ad52c6c11":
    case #"hash_3b16a09f5f1b3166":
    case #"hash_3c2a798e47904879":
    case #"hash_5cf7a3d66f350a91":
    case #"hash_61d85e6b18faf229":
    case #"hash_6e4683d5f1bfa231":
    case #"hash_9915ff80cffdfc33":
    case #"hash_9b5058cbb64f5c19":
    case #"hash_ced4765484d765a9":
    case #"hash_f88271914675e646":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace namespace_18c0c1ddac39266a/namespace_d2b94521fd636348
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbfa
// Size: 0xef
function function_309f1876dda94360(typeref, var_f8853606de474ae1, var_5c1182cb547ca916) {
    /#
        assertex(isdefined(level.var_c9cb1071ea249e41), "getDialogShortName: There is no valid dialog map defined.  Please make sure you are calling into initDialogMap().");
    #/
    var_f69d15d42339af79 = level.var_c9cb1071ea249e41[typeref];
    if (!isdefined(var_f69d15d42339af79)) {
        /#
            iprintln("scrambler_drone_guard" + typeref);
        #/
    }
    var_b7a853cc2321f34a = undefined;
    foreach (var_a6461de9055834b5 in var_f69d15d42339af79) {
        if (var_a6461de9055834b5.var_1f9cca93e19cf99c != var_f8853606de474ae1) {
            continue;
        }
        if (isdefined(var_5c1182cb547ca916)) {
            jumpiffalse(var_a6461de9055834b5.parent != var_5c1182cb547ca916) LOC_000000ca;
        } else {
        LOC_000000ca:
            var_b7a853cc2321f34a = var_a6461de9055834b5.var_5b5ee73adfddd952;
            break;
        }
    }
    return var_b7a853cc2321f34a;
}

// Namespace namespace_18c0c1ddac39266a/namespace_d2b94521fd636348
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf1
// Size: 0xef
function function_c23431e49ed43c57(typeref, var_f8853606de474ae1, var_5c1182cb547ca916) {
    /#
        assertex(isdefined(level.var_bb06a7f803299c8c), "getDialogShortName: There is no valid dialog map defined.  Please make sure you are calling into initDialogMap().");
    #/
    var_f69d15d42339af79 = level.var_bb06a7f803299c8c[typeref];
    if (!isdefined(var_f69d15d42339af79)) {
        /#
            iprintln("scrambler_drone_guard" + typeref);
        #/
    }
    var_b7a853cc2321f34a = undefined;
    foreach (var_a6461de9055834b5 in var_f69d15d42339af79) {
        if (var_a6461de9055834b5.var_1f9cca93e19cf99c != var_f8853606de474ae1) {
            continue;
        }
        if (isdefined(var_5c1182cb547ca916)) {
            jumpiffalse(var_a6461de9055834b5.parent != var_5c1182cb547ca916) LOC_000000ca;
        } else {
        LOC_000000ca:
            var_b7a853cc2321f34a = var_a6461de9055834b5.var_5b5ee73adfddd952;
            break;
        }
    }
    return var_b7a853cc2321f34a;
}

// Namespace namespace_18c0c1ddac39266a/namespace_d2b94521fd636348
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde8
// Size: 0x210
function function_b847c6a9ca912337(var_9e06d56df7f6385f, var_8406c878f4fc7dda, var_127d392e2057f2b0, var_817b24cc21ede559, eventref) {
    prefix = "dx";
    mode = var_9e06d56df7f6385f;
    map = function_309f1876dda94360("Map", var_8406c878f4fc7dda, var_9e06d56df7f6385f);
    scene = function_309f1876dda94360("Scene", var_127d392e2057f2b0, var_8406c878f4fc7dda);
    character = function_309f1876dda94360("Character", var_817b24cc21ede559);
    event = function_309f1876dda94360("Event", eventref, var_9e06d56df7f6385f);
    dialogalias = prefix;
    if (isdefined(mode)) {
        dialogalias = dialogalias + "_" + mode;
    }
    if (isdefined(map)) {
        dialogalias = dialogalias + "_" + map;
    }
    if (isdefined(scene)) {
        dialogalias = dialogalias + "_" + scene;
    }
    if (isdefined(character)) {
        dialogalias = dialogalias + "_" + character;
    }
    if (isdefined(event)) {
        if (eventref == "killstreak_team_leader_enemy_callout") {
            if (var_127d392e2057f2b0 == "lrad" || var_127d392e2057f2b0 == "sentry_gun" || var_127d392e2057f2b0 == "switchblade_drone") {
                event = "euse";
            } else {
                event = "ktle";
            }
        }
        if (eventref == "killstreak_remote_operator_request_response") {
            if (var_127d392e2057f2b0 == "emp_plane") {
                event = "empd";
            } else if (var_127d392e2057f2b0 == "drone_swarm") {
                event = "dsdp";
            }
        }
        dialogalias = dialogalias + "_" + event;
    }
    if (var_127d392e2057f2b0 == "lrad" || var_127d392e2057f2b0 == "switchblade_drone") {
        var_7747e23a2a062f09 = undefined;
        switch (var_127d392e2057f2b0) {
        case #"hash_19dd9a3a4147e09e":
            var_7747e23a2a062f09 = "guar";
            break;
        case #"hash_7a687f6a4d685110":
            var_7747e23a2a062f09 = "mosq";
            break;
        }
        if (!isdefined(event)) {
            event = eventref;
        }
        if (!isdefined(character)) {
            character = var_817b24cc21ede559;
        }
        dialogalias = prefix + "_" + mode + "_jkil_" + var_7747e23a2a062f09 + "_" + character + "_" + event;
    }
    return dialogalias;
}

// Namespace namespace_18c0c1ddac39266a/namespace_d2b94521fd636348
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1000
// Size: 0x10d
function function_cb073025f309906a(var_9e06d56df7f6385f, var_8406c878f4fc7dda, var_127d392e2057f2b0, var_817b24cc21ede559, eventref) {
    prefix = "dx";
    mode = var_9e06d56df7f6385f;
    map = function_c23431e49ed43c57("Map", var_8406c878f4fc7dda, var_9e06d56df7f6385f);
    scene = function_c23431e49ed43c57("Scene", var_127d392e2057f2b0, var_8406c878f4fc7dda);
    character = function_c23431e49ed43c57("Character", var_817b24cc21ede559);
    event = function_c23431e49ed43c57("Event", eventref, var_9e06d56df7f6385f);
    dialogalias = prefix;
    if (isdefined(mode)) {
        dialogalias = dialogalias + "_" + mode;
    }
    if (isdefined(map)) {
        dialogalias = dialogalias + "_" + map;
    }
    if (isdefined(scene)) {
        dialogalias = dialogalias + "_" + scene;
    }
    if (isdefined(character)) {
        dialogalias = dialogalias + "_" + character;
    }
    if (isdefined(event)) {
        dialogalias = dialogalias + "_" + event;
    }
    return dialogalias;
}

// Namespace namespace_18c0c1ddac39266a/namespace_d2b94521fd636348
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1115
// Size: 0x25
function function_d3c62d251d2af8e6(team) {
    teamref = function_592c1f6b3e44ac25(team);
    if (!isdefined(teamref)) {
        return;
    }
    return teamref;
}

// Namespace namespace_18c0c1ddac39266a/namespace_d2b94521fd636348
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1142
// Size: 0x1a1
function function_592c1f6b3e44ac25(team) {
    var_4fdf99c19de6454 = isdefined(team) && array_contains(level.teamnamelist, team);
    if (!istrue(var_4fdf99c19de6454)) {
        /#
            iprintln("<unknown string>");
        #/
        return;
    }
    teamfaction = undefined;
    switch (game[team]) {
    case #"hash_6182550308f4c7e":
    case #"hash_aec089865f37db9e":
    case #"hash_d5db7454b6a73a3d":
        teamfaction = "RS";
        break;
    case #"hash_6151370d8d0dafbd":
    case #"hash_de67d44ee82442a5":
        teamfaction = "SA";
        break;
    case #"hash_16af78da11bad4f5":
    case #"hash_7e32e56cd23412de":
    case #"hash_d56d8529d86b9c8d":
        teamfaction = "UK";
        break;
    case #"hash_253aa9d445fc8bc7":
    case #"hash_7e4b9c6cd24727ab":
        teamfaction = "DE";
        break;
    case #"hash_e1df00fac0b78d5c":
        teamfaction = "Militia";
        break;
    case #"hash_2892a50b525254f1":
        teamfaction = "Navy Seals";
        break;
    case #"hash_9b5058cbb64f5c19":
        teamfaction = "OpFor";
        break;
    case #"hash_61d85e6b18faf229":
        teamfaction = "Rangers";
        break;
    case #"hash_f88271914675e646":
        teamfaction = "Spetsnaz";
        break;
    case #"hash_332a13e51c2db6b1":
        teamfaction = "TF141";
        break;
    default:
        /#
            iprintln("<unknown string>");
        #/
        teamfaction = "UK";
        break;
    }
    return teamfaction;
}

// Namespace namespace_18c0c1ddac39266a/namespace_d2b94521fd636348
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x12eb
// Size: 0xad
function function_13c4ff9b1a423445(dialog, group, excludelist, var_61acbeb6cccd6bd, var_7f23d950a1672f12) {
    if (!isdefined(game["dialog"][dialog])) {
        /#
            println("<unknown string>" + dialog + "<unknown string>");
        #/
        return;
    }
    foreach (player in level.players) {
        function_e71772de3d54144f(dialog, group, excludelist, var_61acbeb6cccd6bd, var_7f23d950a1672f12);
    }
}

// Namespace namespace_18c0c1ddac39266a/namespace_d2b94521fd636348
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x139f
// Size: 0x13b
function function_3b08be23bf113fcf(dialog, team, group, excludelist, var_61acbeb6cccd6bd, var_7f23d950a1672f12) {
    if (!isdefined(game["dialog"][dialog])) {
        /#
            println("<unknown string>" + dialog + "<unknown string>");
        #/
        return;
    }
    if (!isdefined(team)) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    playerlist = undefined;
    if (isdefined(team)) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "getTeamData")) {
            playerlist = [[ namespace_3c37cb17ade254d::getsharedfunc("game", "getTeamData") ]](team, "players");
        }
    }
    if (isdefined(playerlist) && playerlist.size > 0) {
        foreach (player in playerlist) {
            if (isdefined(excludelist) && array_contains(excludelist, player)) {
                continue;
            }
            if (player issplitscreenplayer() && !player issplitscreenplayerprimary()) {
                continue;
            }
            function_e71772de3d54144f(dialog, player, group, var_61acbeb6cccd6bd, var_7f23d950a1672f12);
        }
    }
}

// Namespace namespace_18c0c1ddac39266a/namespace_d2b94521fd636348
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14e1
// Size: 0x181
function function_e71772de3d54144f(dialog, player, group, var_61acbeb6cccd6bd, var_7f23d950a1672f12) {
    if (!isdefined(game["dialog"][dialog])) {
        /#
            println("<unknown string>" + dialog + "<unknown string>");
        #/
        return;
    }
    if (!isdefined(player)) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    if (!istrue(var_7f23d950a1672f12)) {
        if (istrue(level.disableannouncer)) {
            return;
        }
        if (isdefined(level.modeplayerskipdialog) && self [[ level.modeplayerskipdialog ]](dialog)) {
            return;
        }
    }
    dialogalias = game["dialog"][dialog];
    if (isdefined(var_61acbeb6cccd6bd)) {
        var_9e06d56df7f6385f = var_61acbeb6cccd6bd.mode;
        var_8406c878f4fc7dda = var_61acbeb6cccd6bd.map;
        var_127d392e2057f2b0 = var_61acbeb6cccd6bd.scene;
        var_817b24cc21ede559 = var_61acbeb6cccd6bd.character;
        eventref = var_61acbeb6cccd6bd.event;
        dialogalias = "dx_" + var_9e06d56df7f6385f + "_" + var_8406c878f4fc7dda + "_" + var_127d392e2057f2b0 + "_" + var_817b24cc21ede559 + "tl_" + eventref;
    }
    var_cb3339ece72dbdeb = tolower(dialogalias);
    if (function_d03495fe6418377b(dialog)) {
        dialog = function_f28fd66285fa2c9(dialog);
    }
    player queuedialogforplayer(var_cb3339ece72dbdeb, dialog, 2, group);
}

