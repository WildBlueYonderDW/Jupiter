#using scripts\common\utility;
#using scripts\engine\utility;
#using scripts\mp\utility\game;

#namespace dialog_utility;

// Namespace dialog_utility / scripts\cp_mp\utility\dialog_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5ec
// Size: 0x243
function function_39dc350193dd4bc4() {
    level.dialogmap = [];
    var_d4ee35db6dbb7975 = tablelookupgetnumrows("sound/tables/s6/dialog/gamedef_ref_table.csv");
    for (rownum = 0; rownum < var_d4ee35db6dbb7975; rownum++) {
        deftype = tablelookupbyrow("sound/tables/s6/dialog/gamedef_ref_table.csv", rownum, 0);
        if (!function_7b8ed176d07a4820(deftype)) {
            continue;
        }
        parentref = tablelookupbyrow("sound/tables/s6/dialog/gamedef_ref_table.csv", rownum, 3);
        if (!function_1d467e88533267f6(parentref, deftype)) {
            continue;
        }
        longname = tablelookupbyrow("sound/tables/s6/dialog/gamedef_ref_table.csv", rownum, 1);
        if (!function_13bccd41285b29fc(longname, deftype, parentref)) {
            continue;
        }
        if (longname == "remote_turret") {
            longname = "sentry_gun";
        } else if (longname == "Kortac EMP Plane Pilot") {
            longname = "KorTac EMP Plane Pilot";
        }
        if (!isdefined(level.dialogmap[deftype])) {
            level.dialogmap[deftype] = [];
        }
        dialoginfo = spawnstruct();
        dialoginfo.longname = longname;
        dialoginfo.shortname = tablelookupbyrow("sound/tables/s6/dialog/gamedef_ref_table.csv", rownum, 2);
        dialoginfo.parent = parentref;
        level.dialogmap[deftype][level.dialogmap[deftype].size] = dialoginfo;
    }
    if (!getdvarint(@"hash_cda8c6774f4bd53c", 1)) {
        return;
    }
    level.var_bb06a7f803299c8c = [];
    var_d4ee35db6dbb7975 = tablelookupgetnumrows("sound/tables/iw9/dialog/gamedef_ref_table.csv");
    for (rownum = 0; rownum < var_d4ee35db6dbb7975; rownum++) {
        deftype = tablelookupbyrow("sound/tables/iw9/dialog/gamedef_ref_table.csv", rownum, 0);
        if (!function_7b8ed176d07a4820(deftype)) {
            continue;
        }
        parentref = tablelookupbyrow("sound/tables/iw9/dialog/gamedef_ref_table.csv", rownum, 3);
        if (!function_1d467e88533267f6(parentref, deftype)) {
            continue;
        }
        longname = tablelookupbyrow("sound/tables/iw9/dialog/gamedef_ref_table.csv", rownum, 1);
        if (!function_13bccd41285b29fc(longname, deftype, parentref)) {
            continue;
        }
        if (!isdefined(level.var_bb06a7f803299c8c[deftype])) {
            level.var_bb06a7f803299c8c[deftype] = [];
        }
        dialoginfo = spawnstruct();
        dialoginfo.longname = longname;
        dialoginfo.shortname = tablelookupbyrow("sound/tables/iw9/dialog/gamedef_ref_table.csv", rownum, 2);
        dialoginfo.parent = parentref;
        level.var_bb06a7f803299c8c[deftype][level.var_bb06a7f803299c8c[deftype].size] = dialoginfo;
    }
}

// Namespace dialog_utility / scripts\cp_mp\utility\dialog_utility
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x837
// Size: 0xcd
function private function_6b50082c54e1a0d3(deftype, longname) {
    if (deftype != "Character") {
        return false;
    }
    substrlist = ["Operator", "Chopper Gunner", "Chopper Pilot", "Drone Pilot", "Gunship Nav", "Gunship Pilot", "Gunship Sensor", "Helo Pilot", "Mortar Gunner"];
    foreach (str in substrlist) {
        if (issubstr(longname, str)) {
            return true;
        }
    }
    return false;
}

// Namespace dialog_utility / scripts\cp_mp\utility\dialog_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x90d
// Size: 0xb7
function function_5b0451cdda5803e8(longname) {
    streaklist = ["uav", "airdrop", "airdrop_escort", "airdrop_multiple", "assault_drone", "auto_drone", "chopper_gunner", "gunship", "cruise_predator", "directional_uav", "fuel_airstrike", "hover_jet", "scrambler_drone_guard", "toma_strike", "precision_airstrike", "juggernaut"];
    if (array_contains(streaklist, longname)) {
        return true;
    }
    return false;
}

// Namespace dialog_utility / scripts\cp_mp\utility\dialog_utility
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x9cd
// Size: 0x5b
function private function_7b8ed176d07a4820(deftype) {
    if (!isdefined(deftype)) {
        return false;
    }
    switch (deftype) {
    case #"hash_1ffc0efa5ad2a952":
    case #"hash_3ba2e9bad3b576e6":
    case #"hash_6129c50ada7bcca3":
    case #"hash_6f6034fb855eddca":
    case #"hash_7d493ed7181c2fae":
        return false;
    }
    return true;
}

// Namespace dialog_utility / scripts\cp_mp\utility\dialog_utility
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xa31
// Size: 0x81
function private function_1d467e88533267f6(parentref, deftype) {
    if (!isdefined(parentref) || parentref == "" && deftype != "Character") {
        return false;
    }
    tokens = strtok(parentref, "_");
    if (tokens.size == 0 || tokens[0] == "mp") {
        return true;
    }
    if (tokens.size > 0 && scripts\mp\utility\game::function_d75b73c443421047() && tokens[0] == "br") {
        return true;
    }
    return false;
}

// Namespace dialog_utility / scripts\cp_mp\utility\dialog_utility
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0xabb
// Size: 0x257
function private function_13bccd41285b29fc(longname, deftype, parentref) {
    if (!isdefined(longname) || longname == "") {
        return false;
    }
    switch (deftype) {
    case #"hash_174c0a6c9c845cf1":
        tokens = strtok(longname, "_");
        if (tokens.size > 0 && isdefined(tokens[1]) && (tokens[1] == "killstreak" || tokens[1] == "fieldupgrade" || tokens[1] == "equipment" || tokens[1] == "core")) {
            return true;
        }
        if (scripts\mp\utility\game::function_d75b73c443421047() && tokens.size > 1 && tokens[0] == "br" && tokens[1] == "cashews") {
            return true;
        }
        break;
    case #"hash_c75355ed41b5bc53":
        tokens = strtok(longname, "_");
        if (isdefined(tokens[0]) && tokens[0] == "announcer" && parentref == "mp_core") {
            return true;
        }
        if (scripts\mp\utility\game::function_d75b73c443421047() && tokens.size > 1 && tokens[0] == "br" && tokens[1] == "cashews") {
            return true;
        }
        if (isdefined(parentref)) {
            tokens = strtok(parentref, "_");
            if (tokens.size > 0 && isdefined(tokens[1]) && (tokens[1] == "killstreak" || tokens[1] == "fieldupgrade" || tokens[1] == "equipment")) {
                return true;
            }
        }
        break;
    case #"hash_fa9a9f82be7c7750":
        tokens = strtok(longname, " ");
        if (tokens.size > 0 && (isdefined(tokens[0]) && function_3f64deb57a4966b2(tokens[0]) || isdefined(tokens[1]) && tokens[1] == "Team")) {
            return true;
        }
        break;
    case #"hash_6f8dfe52d0c03fdf":
        tokens = strtok(longname, "_");
        if (tokens.size > 0 && isdefined(tokens[2]) && (tokens[2] == "leader" || tokens[2] == "operator")) {
            return true;
        } else if (tokens.size > 0 && isdefined(tokens[1]) && tokens[1] == "ims") {
            return true;
        }
        break;
    }
    return false;
}

// Namespace dialog_utility / scripts\cp_mp\utility\dialog_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd1b
// Size: 0xcd
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
    }
}

// Namespace dialog_utility / scripts\cp_mp\utility\dialog_utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xdf0
// Size: 0xeb
function function_309f1876dda94360(typeref, var_f8853606de474ae1, parentref) {
    assertex(isdefined(level.dialogmap), "<dev string:x1c>");
    var_f69d15d42339af79 = level.dialogmap[typeref];
    if (!isdefined(var_f69d15d42339af79)) {
        /#
            iprintln("<dev string:x91>" + typeref);
        #/
    }
    aliascode = undefined;
    foreach (dialoginfo in var_f69d15d42339af79) {
        if (dialoginfo.longname != var_f8853606de474ae1) {
            continue;
        }
        if (isdefined(parentref)) {
            if (dialoginfo.parent != parentref) {
                continue;
            }
        }
        aliascode = dialoginfo.shortname;
        break;
    }
    return aliascode;
}

// Namespace dialog_utility / scripts\cp_mp\utility\dialog_utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xee4
// Size: 0xeb
function function_c23431e49ed43c57(typeref, var_f8853606de474ae1, parentref) {
    assertex(isdefined(level.var_bb06a7f803299c8c), "<dev string:x1c>");
    var_f69d15d42339af79 = level.var_bb06a7f803299c8c[typeref];
    if (!isdefined(var_f69d15d42339af79)) {
        /#
            iprintln("<dev string:x91>" + typeref);
        #/
    }
    aliascode = undefined;
    foreach (dialoginfo in var_f69d15d42339af79) {
        if (dialoginfo.longname != var_f8853606de474ae1) {
            continue;
        }
        if (isdefined(parentref)) {
            if (dialoginfo.parent != parentref) {
                continue;
            }
        }
        aliascode = dialoginfo.shortname;
        break;
    }
    return aliascode;
}

// Namespace dialog_utility / scripts\cp_mp\utility\dialog_utility
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xfd8
// Size: 0x209
function createdialogalias(moderef, mapref, sceneref, characterref, eventref) {
    prefix = "dx";
    mode = moderef;
    map = function_309f1876dda94360("Map", mapref, moderef);
    scene = function_309f1876dda94360("Scene", sceneref, mapref);
    character = function_309f1876dda94360("Character", characterref);
    event = function_309f1876dda94360("Event", eventref, moderef);
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
            if (sceneref == "lrad" || sceneref == "sentry_gun" || sceneref == "switchblade_drone") {
                event = "euse";
            } else {
                event = "ktle";
            }
        }
        if (eventref == "killstreak_remote_operator_request_response") {
            if (sceneref == "emp_plane") {
                event = "empd";
            } else if (sceneref == "drone_swarm") {
                event = "dsdp";
            }
        }
        dialogalias = dialogalias + "_" + event;
    }
    if (sceneref == "lrad" || sceneref == "switchblade_drone") {
        var_7747e23a2a062f09 = undefined;
        switch (sceneref) {
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
            character = characterref;
        }
        dialogalias = prefix + "_" + mode + "_jkil_" + var_7747e23a2a062f09 + "_" + character + "_" + event;
    }
    return dialogalias;
}

// Namespace dialog_utility / scripts\cp_mp\utility\dialog_utility
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x11ea
// Size: 0x107
function function_cb073025f309906a(moderef, mapref, sceneref, characterref, eventref) {
    prefix = "dx";
    mode = moderef;
    map = function_c23431e49ed43c57("Map", mapref, moderef);
    scene = function_c23431e49ed43c57("Scene", sceneref, mapref);
    character = function_c23431e49ed43c57("Character", characterref);
    event = function_c23431e49ed43c57("Event", eventref, moderef);
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

// Namespace dialog_utility / scripts\cp_mp\utility\dialog_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12fa
// Size: 0x25
function function_d3c62d251d2af8e6(team) {
    teamref = function_592c1f6b3e44ac25(team);
    if (!isdefined(teamref)) {
        return;
    }
    return teamref;
}

// Namespace dialog_utility / scripts\cp_mp\utility\dialog_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1328
// Size: 0x1a0
function function_592c1f6b3e44ac25(team) {
    validteam = isdefined(team) && array_contains(level.teamnamelist, team);
    if (!istrue(validteam)) {
        /#
            iprintln("<dev string:xce>");
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
            iprintln("<dev string:xf9>");
        #/
        teamfaction = "UK";
        break;
    }
    return teamfaction;
}

// Namespace dialog_utility / scripts\cp_mp\utility\dialog_utility
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x14d1
// Size: 0xab
function function_13c4ff9b1a423445(dialog, group, excludelist, var_61acbeb6cccd6bd, forceplay) {
    if (!isdefined(game["dialog"][dialog])) {
        println("<dev string:x139>" + dialog + "<dev string:x14f>");
        return;
    }
    foreach (player in level.players) {
        function_e71772de3d54144f(dialog, group, excludelist, var_61acbeb6cccd6bd, forceplay);
    }
}

// Namespace dialog_utility / scripts\cp_mp\utility\dialog_utility
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1584
// Size: 0x138
function function_3b08be23bf113fcf(dialog, team, group, excludelist, var_61acbeb6cccd6bd, forceplay) {
    if (!isdefined(game["dialog"][dialog])) {
        println("<dev string:x17c>" + dialog + "<dev string:x14f>");
        return;
    }
    if (!isdefined(team)) {
        println("<dev string:x193>");
        return;
    }
    playerlist = undefined;
    if (isdefined(team)) {
        if (scripts\engine\utility::issharedfuncdefined("game", "getTeamData")) {
            playerlist = [[ scripts\engine\utility::getsharedfunc("game", "getTeamData") ]](team, "players");
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
            function_e71772de3d54144f(dialog, player, group, var_61acbeb6cccd6bd, forceplay);
        }
    }
}

// Namespace dialog_utility / scripts\cp_mp\utility\dialog_utility
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x16c4
// Size: 0x17b
function function_e71772de3d54144f(dialog, player, group, var_61acbeb6cccd6bd, forceplay) {
    if (!isdefined(game["dialog"][dialog])) {
        println("<dev string:x212>" + dialog + "<dev string:x14f>");
        return;
    }
    if (!isdefined(player)) {
        println("<dev string:x22b>");
        return;
    }
    if (!istrue(forceplay)) {
        if (istrue(level.disableannouncer)) {
            return;
        }
        if (isdefined(level.modeplayerskipdialog) && self [[ level.modeplayerskipdialog ]](dialog)) {
            return;
        }
    }
    dialogalias = game["dialog"][dialog];
    if (isdefined(var_61acbeb6cccd6bd)) {
        moderef = var_61acbeb6cccd6bd.mode;
        mapref = var_61acbeb6cccd6bd.map;
        sceneref = var_61acbeb6cccd6bd.scene;
        characterref = var_61acbeb6cccd6bd.character;
        eventref = var_61acbeb6cccd6bd.event;
        dialogalias = "dx_" + moderef + "_" + mapref + "_" + sceneref + "_" + characterref + "tl_" + eventref;
    }
    soundname = tolower(dialogalias);
    if (function_d03495fe6418377b(dialog)) {
        dialog = function_f28fd66285fa2c9(dialog);
    }
    player queuedialogforplayer(soundname, dialog, 2, group);
}

