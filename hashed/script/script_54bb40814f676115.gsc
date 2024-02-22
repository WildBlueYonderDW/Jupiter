// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_5def7af2a9f04234;
#using scripts\engine\scriptable.gsc;
#using script_6a8ec730b2bfa844;
#using scripts\mp\utility\teams.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_396a814d39e7044f;
#using scripts\mp\music_and_dialog.gsc;
#using script_5307834cd39b435c;

#namespace namespace_5c7d8b54a2108062;

// Namespace namespace_5c7d8b54a2108062/namespace_ceb9fbcb3a67e85
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x294
// Size: 0x29c
function function_b0daef016957df38() {
    if (getdvarint(@"hash_244dc0b0c771cd3d", 1) == 0) {
        return;
    }
    wait(3);
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("map_transition_prompt", &function_7e2e0f563fa9008a);
    level.var_a05f3bd63f29eff9 = spawnstruct();
    level.var_a05f3bd63f29eff9.var_cc41b5d31d55087b = [];
    level.var_a05f3bd63f29eff9.var_9ba3e89771b7d811 = [];
    level.var_a05f3bd63f29eff9.var_4261399ce533359a = getdvarint(@"hash_5bb49886b748ab20", 25);
    var_ca410f77e36eb494 = getdvarint(@"hash_4499b8ecf41e59ce", 2048);
    level.var_a05f3bd63f29eff9.var_ca410f77e36eb494 = var_ca410f77e36eb494 * var_ca410f77e36eb494;
    var_3abe37fea6ec6fef = getdvarint(@"hash_5ea0b9183c001e76", 4096);
    level.var_a05f3bd63f29eff9.var_3abe37fea6ec6fef = var_3abe37fea6ec6fef * var_3abe37fea6ec6fef;
    function_80e7f41f01ef7496("biobunker", getdvarint(@"hash_b6445fc691760f92", 136));
    level.var_a05f3bd63f29eff9.var_87e9c184bcdfd9f5 = getdvarint(@"hash_196cdab33a3f0148", 1);
    level.var_a05f3bd63f29eff9.var_e5ee4cca24584650 = [];
    var_fc18d697a917021d = getdvarint(@"hash_dd30517391ddf811", 1);
    if (!var_fc18d697a917021d) {
        level.var_a05f3bd63f29eff9.var_e5ee4cca24584650[level.var_a05f3bd63f29eff9.var_e5ee4cca24584650.size] = "oasis";
    }
    var_fc18d697a917021d = getdvarint(@"hash_ec51bbfc3dc4418f", 1);
    if (!var_fc18d697a917021d) {
        level.var_a05f3bd63f29eff9.var_e5ee4cca24584650[level.var_a05f3bd63f29eff9.var_e5ee4cca24584650.size] = "wartorn";
    }
    var_fc18d697a917021d = getdvarint(@"hash_e274c3aea0268188", 1);
    if (!var_fc18d697a917021d) {
        level.var_a05f3bd63f29eff9.var_e5ee4cca24584650[level.var_a05f3bd63f29eff9.var_e5ee4cca24584650.size] = "oilfield";
    }
    var_fc18d697a917021d = getdvarint(@"hash_905734eb55454584", 1);
    if (!var_fc18d697a917021d) {
        level.var_a05f3bd63f29eff9.var_e5ee4cca24584650[level.var_a05f3bd63f29eff9.var_e5ee4cca24584650.size] = "moderncity";
    }
    function_334a8a419bfc02c5("oasis", 1);
    function_334a8a419bfc02c5("wartorn", 2);
    function_334a8a419bfc02c5("oilfield", 3);
    function_334a8a419bfc02c5("moderncity", 4);
    function_954713c561c4cc55();
}

// Namespace namespace_5c7d8b54a2108062/namespace_ceb9fbcb3a67e85
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x537
// Size: 0x121
function function_954713c561c4cc55() {
    var_70dadff71bcc3340 = array_combine(getstructarray("map2map_usePrompt", "script_noteworthy"), getstructarray("map2map_usePrompt_instant", "script_noteworthy"));
    foreach (var_1e88d0b4c5322e0e in var_70dadff71bcc3340) {
        var_742517198d568ea = function_88ca4dca7931b39b(var_1e88d0b4c5322e0e);
        if (isdefined(var_742517198d568ea) && !isdefined(level.var_a05f3bd63f29eff9.var_cc41b5d31d55087b[var_742517198d568ea.locname])) {
            level.var_a05f3bd63f29eff9.var_cc41b5d31d55087b[var_742517198d568ea.locname] = var_742517198d568ea;
        }
        if (istrue(level.var_a05f3bd63f29eff9.var_87e9c184bcdfd9f5) && var_1e88d0b4c5322e0e.targetname != "map2map_biobunker_oasis") {
            var_6451879e18908224 = spawnscriptable("map2map_tacmap_location_scriptable", var_1e88d0b4c5322e0e.origin);
        }
    }
}

// Namespace namespace_5c7d8b54a2108062/namespace_ceb9fbcb3a67e85
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x65f
// Size: 0x19c
function function_88ca4dca7931b39b(var_1e88d0b4c5322e0e) {
    var_742517198d568ea = spawnstruct();
    tokens = strtok(var_1e88d0b4c5322e0e.targetname, "_");
    mapname = tolower(tokens[1]);
    var_742517198d568ea.var_d99531c79fcae1f0 = mapname;
    locname = tolower(tokens[2]);
    var_742517198d568ea.locname = locname;
    if (array_contains(level.var_a05f3bd63f29eff9.var_e5ee4cca24584650, locname)) {
        var_742517198d568ea = undefined;
        return;
    }
    var_742517198d568ea.useprompt = function_7e139d3ab9acb1a9(var_1e88d0b4c5322e0e);
    var_742517198d568ea.useprompt.var_d99531c79fcae1f0 = var_742517198d568ea.var_d99531c79fcae1f0;
    var_742517198d568ea.useprompt.var_756408641d217b57 = function_5ee910117a53f7e0(locname);
    var_742517198d568ea.useprompt.locname = locname;
    if (!istrue(var_742517198d568ea.useprompt.var_586e6ffc8bef794)) {
        triggers = function_f159c10d5cf8f0b4(var_1e88d0b4c5322e0e.targetname, "targetname");
        if (isdefined(triggers)) {
            var_742517198d568ea.useprompt.trigger = triggers[0];
        }
        var_742517198d568ea.useprompt thread function_e43e0f078b1006ce(var_742517198d568ea.useprompt.trigger, var_742517198d568ea.useprompt.var_756408641d217b57);
    }
    return var_742517198d568ea;
}

// Namespace namespace_5c7d8b54a2108062/namespace_ceb9fbcb3a67e85
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x803
// Size: 0x64
function function_7e139d3ab9acb1a9(var_1e88d0b4c5322e0e) {
    scriptable = spawnscriptable("map_transition_prompt", var_1e88d0b4c5322e0e.origin);
    scriptable setscriptablepartstate("map_transition_prompt", "on");
    if (issubstr(var_1e88d0b4c5322e0e.script_noteworthy, "_instant")) {
        scriptable.var_586e6ffc8bef794 = 1;
    }
    return scriptable;
}

// Namespace namespace_5c7d8b54a2108062/namespace_ceb9fbcb3a67e85
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x86f
// Size: 0x14a
function function_7e2e0f563fa9008a(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (isdefined(instance.locname) && instance.locname == "oasis") {
        namespace_8361bad7391de074::function_b49c89ad7edcf17b(player);
    }
    if (istrue(instance.var_586e6ffc8bef794)) {
        var_e2b2bbd9e6539f11 = namespace_54d20dd0dd79277f::getfriendlyplayers(player.team, 1);
        function_3209b7c7f08a12da(var_e2b2bbd9e6539f11, instance.var_d99531c79fcae1f0, instance.var_756408641d217b57);
        return;
    }
    if (isdefined(level.var_a05f3bd63f29eff9.var_9ba3e89771b7d811[player.team])) {
        return;
    }
    function_dce86bbe8b64b892(player.team, instance);
    if (getdvarint(@"hash_fdf7b751c4c1aa5c", 1) == 1) {
        function_db49fa5c1ee8814d(player.team);
    }
    instance thread function_5b878641633e68b1(player.team, level.var_a05f3bd63f29eff9.var_4261399ce533359a, instance.var_d99531c79fcae1f0, instance.var_756408641d217b57);
}

// Namespace namespace_5c7d8b54a2108062/namespace_ceb9fbcb3a67e85
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9c0
// Size: 0x8e
function function_db49fa5c1ee8814d(team) {
    if (!issharedfuncdefined("teamAssim", "disablePlayer")) {
        return;
    }
    foreach (player in level.teamdata[team]["players"]) {
        [[ getsharedfunc("teamAssim", "disablePlayer") ]](player, "map2map_warp");
    }
}

// Namespace namespace_5c7d8b54a2108062/namespace_ceb9fbcb3a67e85
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa55
// Size: 0x8e
function function_c6b9237b5132ce26(team) {
    if (!issharedfuncdefined("teamAssim", "enablePlayer")) {
        return;
    }
    foreach (player in level.teamdata[team]["players"]) {
        [[ getsharedfunc("teamAssim", "enablePlayer") ]](player, "map2map_warp");
    }
}

// Namespace namespace_5c7d8b54a2108062/namespace_ceb9fbcb3a67e85
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xaea
// Size: 0x39c
function function_5b878641633e68b1(team, time, var_d99531c79fcae1f0, var_756408641d217b57) {
    useprompt = self;
    level endon("game_ended");
    var_e2297e7e8e96de9f = namespace_54d20dd0dd79277f::getfriendlyplayers(team);
    var_b440527ad8cb0b15 = [];
    foreach (player in var_e2297e7e8e96de9f) {
        if (isdefined(player) && !player namespace_f8065cafc523dba5::_isalive()) {
            var_b440527ad8cb0b15[var_b440527ad8cb0b15.size] = player;
        }
    }
    trigger = useprompt.trigger;
    if (isdefined(team) && !isdefined(level.var_a05f3bd63f29eff9.var_9ba3e89771b7d811[team])) {
        level endon("map2map_warp_cancel" + team);
        level.var_a05f3bd63f29eff9.var_9ba3e89771b7d811[team] = time;
    } else {
        return;
    }
    while (level.var_a05f3bd63f29eff9.var_9ba3e89771b7d811[team] >= 0) {
        var_e2b2bbd9e6539f11 = namespace_54d20dd0dd79277f::getfriendlyplayers(team);
        playersintrigger = function_f1097a7ba31434e4(team, useprompt.trigger);
        if (!isdefined(playersintrigger) || playersintrigger.size == 0) {
            function_ed32d36f2bb763ee(team, useprompt);
        } else if (var_e2b2bbd9e6539f11.size == playersintrigger.size) {
            if (level.var_a05f3bd63f29eff9.var_9ba3e89771b7d811[team] > 5) {
                level.var_a05f3bd63f29eff9.var_9ba3e89771b7d811[team] = 5;
            }
        }
        foreach (player in var_e2b2bbd9e6539f11) {
            if (!isdefined(player)) {
                continue;
            }
            useprompt disablescriptableplayeruse(player);
            player setclientomnvar("ui_dmz_map_to_map_prompt_visible", 0);
            player setclientomnvar("ui_dmz_warp_hazard", function_e0947372b9a0f240(var_756408641d217b57));
            if (player namespace_f8065cafc523dba5::_isalive() && array_contains(var_b440527ad8cb0b15, player)) {
                var_b440527ad8cb0b15 = array_remove(var_b440527ad8cb0b15, player);
            } else if (!player namespace_f8065cafc523dba5::_isalive() && !array_contains(var_b440527ad8cb0b15, player)) {
                var_b440527ad8cb0b15[var_b440527ad8cb0b15.size] = player;
                if (distance2dsquared(player.origin, useprompt.origin) < level.var_a05f3bd63f29eff9.var_ca410f77e36eb494) {
                    function_ed32d36f2bb763ee(team, useprompt);
                }
            }
            if (array_contains(playersintrigger, player)) {
                player setclientomnvar("ui_dmz_warp_proximity", 0);
            } else if (distance2dsquared(player.origin, useprompt.origin) < level.var_a05f3bd63f29eff9.var_3abe37fea6ec6fef) {
                player setclientomnvar("ui_dmz_warp_proximity", 1);
            } else {
                player setclientomnvar("ui_dmz_warp_proximity", 2);
            }
            player setclientomnvar("ui_dmz_warp_timer", level.var_a05f3bd63f29eff9.var_9ba3e89771b7d811[team]);
        }
        wait(1);
        level.var_a05f3bd63f29eff9.var_9ba3e89771b7d811[team] = level.var_a05f3bd63f29eff9.var_9ba3e89771b7d811[team] - 1;
    }
    function_c03a8f0cf1d4156f(team, useprompt);
    level.var_a05f3bd63f29eff9.var_9ba3e89771b7d811[team] = undefined;
}

// Namespace namespace_5c7d8b54a2108062/namespace_ceb9fbcb3a67e85
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe8d
// Size: 0xd3
function function_ed32d36f2bb763ee(team, useprompt) {
    function_f7a553353c2c4f99(team, useprompt);
    var_e2b2bbd9e6539f11 = namespace_54d20dd0dd79277f::getfriendlyplayers(team);
    foreach (player in var_e2b2bbd9e6539f11) {
        useprompt enablescriptableplayeruse(player);
        player setclientomnvar("ui_dmz_map_to_map_prompt_visible", 1);
        player.var_1f313499d1f87a24 = undefined;
        player namespace_314d49cda6272573::function_24a08f8a03be8244();
        player setplayermusicstate("");
        player.var_43653d344aa392af = undefined;
    }
    level.var_a05f3bd63f29eff9.var_9ba3e89771b7d811[team] = undefined;
    level notify("map2map_warp_cancel" + team);
}

// Namespace namespace_5c7d8b54a2108062/namespace_ceb9fbcb3a67e85
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf67
// Size: 0x1b
function function_51aad52cc5171df3(var_f3b6838b04870fc4) {
    if (var_f3b6838b04870fc4) {
        self.var_1f313499d1f87a24 = 1;
    }
}

// Namespace namespace_5c7d8b54a2108062/namespace_ceb9fbcb3a67e85
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf89
// Size: 0x494
function function_c03a8f0cf1d4156f(team, useprompt) {
    level endon("map2map_warp_cancel" + team);
    level.var_a05f3bd63f29eff9.var_9ba3e89771b7d811[team] = 30;
    var_c8b6a0cfa05e1ccc = 0;
    var_e0a412433514e56a = namespace_54d20dd0dd79277f::getfriendlyplayers(team);
    while (!var_c8b6a0cfa05e1ccc) {
        playersintrigger = function_f1097a7ba31434e4(team, useprompt.trigger);
        if (playersintrigger.size == 0 || level.var_a05f3bd63f29eff9.var_9ba3e89771b7d811[team] == 0) {
            function_ed32d36f2bb763ee(team, useprompt);
        }
        foreach (player in playersintrigger) {
            if (!isdefined(player.var_43653d344aa392af)) {
                player thread namespace_3bde6869e44a2770::function_c080ebbcdcc3176f();
            }
            player setclientomnvar("ui_dmz_warp_state", 3);
            if (!player namespace_314d49cda6272573::function_74c8eb2aaf9f5d14(5)) {
                player thread namespace_314d49cda6272573::function_36edf91561322753(5, level.var_a05f3bd63f29eff9.var_9ba3e89771b7d811[team], &function_51aad52cc5171df3);
            }
            if (isdefined(player.var_1f313499d1f87a24)) {
                var_c8b6a0cfa05e1ccc = 1;
            }
        }
        foreach (player in var_e0a412433514e56a) {
            if (array_contains(playersintrigger, player)) {
                player setclientomnvar("ui_dmz_warp_proximity", 0);
            } else {
                if (player namespace_314d49cda6272573::function_74c8eb2aaf9f5d14(5)) {
                    player namespace_314d49cda6272573::function_24a08f8a03be8244();
                }
                if (distance2dsquared(player.origin, useprompt.origin) < level.var_a05f3bd63f29eff9.var_3abe37fea6ec6fef) {
                    player setclientomnvar("ui_dmz_warp_proximity", 1);
                } else {
                    player setclientomnvar("ui_dmz_warp_proximity", 2);
                }
            }
            player setclientomnvar("ui_dmz_warp_timer", level.var_a05f3bd63f29eff9.var_9ba3e89771b7d811[team]);
        }
        wait(1);
        var_e0a412433514e56a = namespace_54d20dd0dd79277f::getfriendlyplayers(team);
        level.var_a05f3bd63f29eff9.var_9ba3e89771b7d811[team] = level.var_a05f3bd63f29eff9.var_9ba3e89771b7d811[team] - 1;
        if (level.var_a05f3bd63f29eff9.var_9ba3e89771b7d811[team] < 0) {
            level.var_a05f3bd63f29eff9.var_9ba3e89771b7d811[team] = 0;
        }
    }
    var_e0a412433514e56a = namespace_54d20dd0dd79277f::getfriendlyplayers(team);
    playersintrigger = function_f1097a7ba31434e4(team, useprompt.trigger);
    var_7073126d9ed50bf2 = [];
    var_797722ced855104 = [];
    foreach (player in var_e0a412433514e56a) {
        var_f5a62ea4f4c7f032 = 0;
        if (array_contains(playersintrigger, player)) {
            var_f5a62ea4f4c7f032 = 1;
        }
        if (player namespace_f8065cafc523dba5::_isalive() && var_f5a62ea4f4c7f032) {
            var_7073126d9ed50bf2[var_7073126d9ed50bf2.size] = player;
        } else {
            player setplayermusicstate("");
            player.var_43653d344aa392af = undefined;
            var_797722ced855104[var_797722ced855104.size] = player;
        }
    }
    playsoundatpos(useprompt.origin, "dmz_biobunker_radiation_vault_door_open");
    function_3209b7c7f08a12da(var_7073126d9ed50bf2, useprompt.var_d99531c79fcae1f0, useprompt.var_756408641d217b57);
    foreach (player in var_797722ced855104) {
        player setclientomnvar("ui_dmz_warp_state", 4);
    }
    wait(5);
    if (getdvarint(@"hash_fdf7b751c4c1aa5c", 1) == 1) {
        function_c6b9237b5132ce26(team);
    }
    foreach (player in var_797722ced855104) {
        if (!isdefined(player)) {
            continue;
        }
        useprompt enablescriptableplayeruse(player);
        player setclientomnvar("ui_dmz_map_to_map_prompt_visible", 1);
        player setclientomnvar("ui_dmz_warp_state", 5);
    }
}

// Namespace namespace_5c7d8b54a2108062/namespace_ceb9fbcb3a67e85
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1424
// Size: 0x79
function function_dce86bbe8b64b892(team, instance) {
    var_e2b2bbd9e6539f11 = namespace_54d20dd0dd79277f::getfriendlyplayers(team);
    foreach (player in var_e2b2bbd9e6539f11) {
        player setclientomnvar("ui_dmz_warp_state", 2);
    }
}

// Namespace namespace_5c7d8b54a2108062/namespace_ceb9fbcb3a67e85
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x14a4
// Size: 0x96
function function_f7a553353c2c4f99(team, instance) {
    var_e2b2bbd9e6539f11 = namespace_54d20dd0dd79277f::getfriendlyplayers(team);
    foreach (player in var_e2b2bbd9e6539f11) {
        player setclientomnvar("ui_dmz_warp_state", 0);
    }
    if (getdvarint(@"hash_fdf7b751c4c1aa5c", 1) == 1) {
        function_c6b9237b5132ce26(team);
    }
}

// Namespace namespace_5c7d8b54a2108062/namespace_ceb9fbcb3a67e85
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1541
// Size: 0xa7
function function_3209b7c7f08a12da(players, var_d99531c79fcae1f0, var_756408641d217b57) {
    foreach (player in players) {
        player.var_ded04cdd264a7e00 = 1;
        player.var_1f313499d1f87a24 = undefined;
        player setclientomnvar("ui_dmz_warp_state", 5);
        player notify("map_to_map_warp");
        player namespace_25b25d188ef778c4::function_df3bfe2c77975120();
    }
    function_d296788a307d5162(players, function_2364a3ae41c2ce7f(var_d99531c79fcae1f0), var_756408641d217b57);
}

// Namespace namespace_5c7d8b54a2108062/namespace_ceb9fbcb3a67e85
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x15ef
// Size: 0xe2
function function_e43e0f078b1006ce(trigger, var_756408641d217b57) {
    level endon("game_ended");
    if (!namespace_37f0fb6355a4618a::function_47d356083884f913()) {
        thread function_8ad822e2a2cefa44(trigger, var_756408641d217b57);
        return;
    }
    poiname = function_6cc445c02b5effac(trigger.origin);
    while (1) {
        if (isdefined(level.poi[poiname]) && isdefined(level.poi[poiname]["players"])) {
            foreach (player in level.poi[poiname]["players"]) {
                if (ispointinvolume(player.origin, trigger)) {
                }
            }
        }
        waitframe();
    }
}

// Namespace namespace_5c7d8b54a2108062/namespace_ceb9fbcb3a67e85
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x16d8
// Size: 0x85
function function_8ad822e2a2cefa44(trigger, var_756408641d217b57) {
    level endon("game_ended");
    while (1) {
        foreach (player in level.players) {
            if (ispointinvolume(player.origin, trigger)) {
            }
        }
        waitframe();
    }
}

// Namespace namespace_5c7d8b54a2108062/namespace_ceb9fbcb3a67e85
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1764
// Size: 0x95
function function_f1097a7ba31434e4(team, trigger) {
    var_e2b2bbd9e6539f11 = namespace_54d20dd0dd79277f::getfriendlyplayers(team, 1);
    playersintrigger = [];
    foreach (player in var_e2b2bbd9e6539f11) {
        if (ispointinvolume(player.origin, trigger)) {
            playersintrigger[playersintrigger.size] = player;
        }
    }
    return playersintrigger;
}

// Namespace namespace_5c7d8b54a2108062/namespace_ceb9fbcb3a67e85
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1801
// Size: 0x57
function function_80e7f41f01ef7496(var_7040af990f6ce27a, playlistid) {
    if (!isdefined(level.var_a05f3bd63f29eff9.var_b700a350075400c3)) {
        level.var_a05f3bd63f29eff9.var_b700a350075400c3 = [];
    }
    level.var_a05f3bd63f29eff9.var_b700a350075400c3[var_7040af990f6ce27a] = playlistid;
}

// Namespace namespace_5c7d8b54a2108062/namespace_ceb9fbcb3a67e85
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x185f
// Size: 0x21
function function_2364a3ae41c2ce7f(var_7040af990f6ce27a) {
    return level.var_a05f3bd63f29eff9.var_b700a350075400c3[var_7040af990f6ce27a];
}

// Namespace namespace_5c7d8b54a2108062/namespace_ceb9fbcb3a67e85
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1888
// Size: 0x57
function function_334a8a419bfc02c5(locstring, id) {
    if (!isdefined(level.var_a05f3bd63f29eff9.var_756408641d217b57)) {
        level.var_a05f3bd63f29eff9.var_756408641d217b57 = [];
    }
    level.var_a05f3bd63f29eff9.var_756408641d217b57[locstring] = id;
}

// Namespace namespace_5c7d8b54a2108062/namespace_ceb9fbcb3a67e85
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18e6
// Size: 0x21
function function_5ee910117a53f7e0(locstring) {
    return level.var_a05f3bd63f29eff9.var_756408641d217b57[locstring];
}

// Namespace namespace_5c7d8b54a2108062/namespace_ceb9fbcb3a67e85
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x190f
// Size: 0x5d
function function_e0947372b9a0f240(var_756408641d217b57) {
    switch (var_756408641d217b57) {
    case 1:
        return 2;
    case 2:
        return 1;
    case 3:
        return 0;
    case 4:
        return 0;
    default:
        return 0;
        break;
    }
}

