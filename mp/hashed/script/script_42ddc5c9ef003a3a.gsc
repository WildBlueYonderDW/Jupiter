#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\common\devgui.gsc;
#using script_600b944a95c3a7bf;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\utility\trigger.gsc;
#using script_610f57bddd265be2;
#using scripts\mp\gametypes\br_bunker_utility.gsc;
#using script_2d9d24f7c63ac143;
#using scripts\mp\hud_message.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\common\utility.gsc;
#using script_58f20490049af6ac;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\gametypes\br_dev.gsc;
#using scripts\mp\gamelogic.gsc;

#namespace namespace_db1a5a61b2f193c1;

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0xaf5
// Size: 0x58e
function autoexec init() {
    level.var_cdc0b4ad36375763 = getentitylessscriptablearray("bunker_exterior_door", "script_noteworthy");
    level.var_b8e3a1a7470e8e9d = getentitylessscriptablearray("bunker_interior_door", "script_noteworthy");
    level.var_d6551492e20f6902 = getentitylessscriptablearray("bunker_treasury_door", "script_noteworthy");
    level.var_84a9ffacd501b871 = function_f159c10d5cf8f0b4("bunker_interior_trigger", "script_noteworthy");
    level.var_cf5c5baf6a57f293 = getentitylessscriptablearray("bunker_escape_hatch", "script_noteworthy");
    level.var_770b15c8cf662749 = getentitylessscriptablearray("bunker_redeploy_struct", "script_noteworthy");
    level.var_290c4e649c2ae935 = getentitylessscriptablearray("bunker_keypad", "script_noteworthy");
    level.var_2330b8479f14e5d0 = [];
    level.var_2330b8479f14e5d0[0] = getent("adler_treasure_light_01", "targetname");
    level.var_2330b8479f14e5d0[1] = getent("adler_treasure_light_02", "targetname");
    level.var_2330b8479f14e5d0[2] = getent("adler_treasure_light_03", "targetname");
    level.var_9ca9c72dba26aedd = getentitylessscriptablearray("bunker_graffiti_numbers", "script_noteworthy");
    if (level.var_cdc0b4ad36375763.size == 0) {
        return;
    }
    waitframe();
    var_5f9ff1a7e606fade = getdvarint(@"hash_11d4f36434972569", 1) == 1 && scripts\cp_mp\utility\game_utility::isbrstylegametype();
    if (!var_5f9ff1a7e606fade) {
        return;
    }
    level.var_20a50d2446c9f3f8 = getstructarray("bunker_redeploy_struct", "script_noteworthy");
    level.var_b8871c817ad78bca = [];
    level.var_8783f613a9288126 = getstructarray("bunker_graffiti", "script_noteworthy");
    level.var_d72704dda367f25f = getdvarint(@"hash_7d76e3be9116d824", 1);
    if (level.var_d72704dda367f25f) {
        level.var_803d5772d8304d67 = getstructarray("bunker_cache", "script_noteworthy");
    }
    level.var_3a9d7f51ba51512 = [];
    level.var_3a9d7f51ba51512[0] = getstruct("bunker_books", "script_noteworthy");
    level.var_3a9d7f51ba51512[1] = getstruct("bunker_picture", "script_noteworthy");
    level.var_3a9d7f51ba51512 = array_combine(level.var_3a9d7f51ba51512, getstructarray("bunker_poster", "script_noteworthy"));
    registersharedfunc("br_bunkers", "devSetupBunkerDoor", &devSetupBunkerDoor);
    registersharedfunc("br_bunkers", "onBunkerKeycardPickup", &onBunkerKeycardPickup);
    level.var_d432f6b3d679c326 = namespace_38b993c4618e76cd::getlootidfromref("brloot_access_card_bunker");
    scripts\engine\scriptable::scriptable_addusedcallbackbypart("bunker_hint", &function_ca99372711c88ea8);
    scripts\engine\scriptable::scriptable_addusedcallbackbypart("pc_monitor", &function_57dcf788fec9fd2f);
    scripts\engine\scriptable::scriptable_addusedcallbackbypart("interact_map", &function_e33b4d4ab4129418);
    level.var_250aec27a78884a = getdvarint(@"hash_fccd9e55436c5c9f", 4000);
    level.var_53e6ee1d07920c1 = getdvarint(@"hash_6b31ad1fb47e8908", 30);
    level.var_21ea71a5d52c2de0 = getdvarint(@"hash_cb7065bc9834c7e3", 60);
    level.var_cdb24d59c2bf8c15 = getdvarint(@"hash_592468e4939cf77e", 0);
    level.var_bfb3f734bfbfd303 = getdvarint(@"hash_2a589ea8e1f1fcb6", 0);
    level.var_7c6ef5f214a71f23 = getdvarint(@"hash_5f82f0e7227f490c", 0);
    level.var_7999e6ec073b3900 = getdvarint(@"hash_8ddb602e3762b54c", 1);
    level.var_c1beb9ab59838d62 = getdvarint(@"hash_6d0340da710039e9", 60);
    self.var_5f65843850735d54 = getdvarint(@"hash_fff2bfa78e277881", 2);
    if (level.var_7999e6ec073b3900) {
        assert(isdefined(game["<dev string:x1c>"]));
        game["dialog"]["br_bunker_exterior_deny"] = "urzk_grav_onbk";
        game["dialog"]["br_bunker_treasure_deny"] = "urzk_grav_ontk";
        game["dialog"]["br_bunker_key_first_pick"] = "urzk_grav_onbm";
    }
    scripts\engine\scriptable::scriptable_addusedcallbackbypart("bunker_graffiti", &function_c49de466dc9bd0a8);
    scripts\engine\scriptable::scriptable_addusedcallbackbypart("bunker_keypad", &function_27322f324a65f978);
    if (istrue(level.var_bfb3f734bfbfd303)) {
        var_6f1f3de499fedcdf = function_cc3c75e13749b1ea((12040, 11988, 2001), (0, 92, 0), (50, 50, 20), (50, 50, 20), "bunker_07", "bunker_interior_door");
        level.var_84a9ffacd501b871 = array_add(level.var_84a9ffacd501b871, var_6f1f3de499fedcdf);
        var_acd7fc9b5a628e3d = function_cc3c75e13749b1ea((11933, 10967, 1880), (0, 272, 0), (1500, 650, 215), (1500, 650, 150), "bunker_07");
        scripts\mp\utility\trigger::makeenterexittrigger(var_acd7fc9b5a628e3d, &function_17224b22a47cbf2b, &function_e6a5226749e068ff);
    } else {
        foreach (keypad in level.var_290c4e649c2ae935) {
            if (isdefined(keypad.targetname) && keypad.targetname == "bunker_07") {
                keypad setscriptablepartstate("bunker_keypad", "off");
            }
        }
    }
    if (istrue(level.var_7c6ef5f214a71f23)) {
        scripts\engine\scriptable::scriptable_addusedcallbackbypart("bunker_document", &function_fc14fcc137d9fc2d);
    }
    /#
        init_debug();
    #/
    thread function_3ff9908670522756();
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x108b
// Size: 0x2c2
function function_3ff9908670522756() {
    level waittill("prematch_done");
    foreach (bunker in level.var_cdc0b4ad36375763) {
        function_2b91f8c6824f36af(bunker);
    }
    foreach (trigger in level.var_84a9ffacd501b871) {
        thread function_5e3613d57820ecc4(trigger);
        thread function_bf75d660afd25576(trigger);
    }
    foreach (door in level.var_d6551492e20f6902) {
        function_d5472a4eacd6fe36(door);
    }
    foreach (struct in level.var_20a50d2446c9f3f8) {
        thread function_d21a8f0b64b5d065(struct);
    }
    foreach (keypad in level.var_290c4e649c2ae935) {
        function_37e00e1115eec7c2(keypad);
    }
    if (istrue(level.var_bfb3f734bfbfd303)) {
        function_558642d7ad336985();
    }
    if (istrue(level.var_7c6ef5f214a71f23)) {
        function_b67874af021d327f();
    }
    if (level.var_2330b8479f14e5d0.size > 0) {
        thread function_d81207e42f47509d();
    }
    if (level.var_d72704dda367f25f) {
        foreach (struct in level.var_803d5772d8304d67) {
            function_441e0fbd8c77779a(struct);
        }
    }
    interiordoor = function_78bbcf05169f763("bunker_13", level.var_b8e3a1a7470e8e9d);
    if (isdefined(interiordoor)) {
        interiordoor setscriptablepartstate("bunker_door", "closed");
    }
    thread function_6c4c860d64bcad1b(bunker);
    if (getdvarint(@"hash_bf95b38fe7240d7", 1)) {
        spawnscriptable("ee_pillar_airport_tunnel_concrete_01", (2, 26885, 553), (0, 345, 0));
    }
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1355
// Size: 0x72
function function_2b91f8c6824f36af(bunker) {
    bunker setscriptablepartstate("bunker_door", "closed");
    bunker setscriptablepartstate("bunker_hint", "usable");
    if (isdefined(bunker.targetname) && bunker.targetname == "bunker_07" && isdefined(level.var_290c4e649c2ae935[0])) {
        bunker setscriptablepartstate("bunker_hint", "disabled");
    }
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13cf
// Size: 0x2d
function function_d5472a4eacd6fe36(door) {
    door setscriptablepartstate("bunker_door", "closed");
    door setscriptablepartstate("bunker_hint", "usable");
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1404
// Size: 0xa3
function function_d21a8f0b64b5d065(struct) {
    var_5c5b88ce7ae1228e = spawnscriptable("scriptable_redeploy_drone", struct.origin, struct.angles);
    var_5c5b88ce7ae1228e.var_47d27267be4655fb = 1;
    var_5c5b88ce7ae1228e.var_3ab975339452a8a9 = struct.targetname;
    var_5c5b88ce7ae1228e.var_7a6430ba88c4d983 = struct.origin;
    var_5c5b88ce7ae1228e thread namespace_2c2703f78fc59600::spawn_redeploy_drone();
    var_5c5b88ce7ae1228e setscriptablepartstate("redeploy_drone", "unavailable");
    level.var_b8871c817ad78bca[level.var_b8871c817ad78bca.size] = var_5c5b88ce7ae1228e;
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14af
// Size: 0x19f
function function_37e00e1115eec7c2(keypad) {
    if (isdefined(keypad.targetname) && keypad.targetname == "bunker_07") {
        codestruct = spawnstruct();
        codestruct.code = [];
        codestruct.code["array"] = [7, 2, 5, 5, 9];
        codestruct.code["string"] = string_join([7, 2, 5, 5, 9]);
        keypad.code = codestruct.code;
        keypad.codelength = 5;
        keypad.successfunction = &function_824219d6af679a49;
        return;
    }
    if (isdefined(keypad.targetname) && keypad.targetname == "bunker_13") {
        codestruct = spawnstruct();
        scripts\mp\gametypes\br_bunker_utility::generatenumbercode(4, codestruct, 0, 0);
        keypad.code = codestruct.code;
        keypad.codelength = 4;
        keypad.successfunction = &function_6ff32ae26d76be30;
        function_48cdf0627c93167f(codestruct.code["array"]);
        if (getdvarint(@"hash_fb0558fae13c214d", 1)) {
            thread function_a2268d34c58bd593(codestruct.code["array"]);
        }
    }
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1656
// Size: 0xb1
function function_48cdf0627c93167f(code) {
    foreach (scriptable in level.var_9ca9c72dba26aedd) {
        var_5af8fdea692bc574 = function_d2d3ddcb3e9a534d(scriptable);
        if (getdvarint(@"hash_fb0558fae13c214d", 1) && (var_5af8fdea692bc574 == 3 || var_5af8fdea692bc574 == 4)) {
            continue;
        }
        codenumber = code[var_5af8fdea692bc574 - 1];
        scriptable setscriptablepartstate("bunker_graffiti", "number_" + codenumber);
    }
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x170f
// Size: 0xed
function function_a2268d34c58bd593(code) {
    level endon("game_ended");
    for (var_7c6a9af699806d2b = 0; true; var_7c6a9af699806d2b = 0) {
        delaytime = randomfloat(getdvarint(@"hash_fb0558fae13c214d", 3));
        wait delaytime;
        foreach (scriptable in level.var_9ca9c72dba26aedd) {
            var_5af8fdea692bc574 = function_d2d3ddcb3e9a534d(scriptable);
            if (var_5af8fdea692bc574 == 3 || var_5af8fdea692bc574 == 4) {
                continue;
            }
            codenumber = code[var_5af8fdea692bc574 + var_7c6a9af699806d2b - 1];
            scriptable setscriptablepartstate("bunker_graffiti", "number_" + codenumber);
        }
        var_7c6a9af699806d2b += 2;
        if (var_7c6a9af699806d2b >= 4) {
        }
    }
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1804
// Size: 0x35
function function_d2d3ddcb3e9a534d(scriptable) {
    var_5af8fdea692bc574 = function_2e84a570d6af300a(scriptable.targetname, "graffiti_");
    var_5af8fdea692bc574 = int(var_5af8fdea692bc574);
    return var_5af8fdea692bc574;
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1842
// Size: 0xb4
function function_d81207e42f47509d() {
    foreach (light in level.var_2330b8479f14e5d0) {
        light setlightintensity(0);
    }
    level.var_2330b8479f14e5d0[0].var_3910dfdf86082a33 = 1100 * 7.95545e-05;
    level.var_2330b8479f14e5d0[1].var_3910dfdf86082a33 = 500 * 7.95545e-05;
    level.var_2330b8479f14e5d0[2].var_3910dfdf86082a33 = 50 * 7.95545e-05;
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18fe
// Size: 0x97
function function_558642d7ad336985() {
    foreach (struct in level.var_8783f613a9288126) {
        var_3847cc5d0555f73d = spawnscriptable("scriptable_jup_bunker_01_graffiti", struct.origin, struct.angles + (90, 0, 0));
        var_3847cc5d0555f73d setscriptablepartstate("bunker_graffiti", "on");
    }
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x199d
// Size: 0x10b
function function_b67874af021d327f() {
    foreach (struct in level.var_3a9d7f51ba51512) {
        scriptablename = undefined;
        switch (struct.script_noteworthy) {
        case #"hash_f2dfad9bf3d36039":
            scriptablename = "stationary_livingston_brief_01";
            break;
        case #"hash_341fa752f5e67d94":
            scriptablename = "decor_wanted_poster_01";
            break;
        case #"hash_6db3c965896ac591":
            scriptablename = "decor_memorial_poster_01";
            break;
        default:
            break;
        }
        var_8e99797ee3845048 = spawnscriptable(scriptablename, struct.origin, struct.angles);
        var_8e99797ee3845048.var_7acff0291e4e0204 = struct.script_noteworthy;
        var_8e99797ee3845048 setscriptablepartstate("bunker_document", "on");
    }
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ab0
// Size: 0x6a
function function_441e0fbd8c77779a(struct) {
    type = struct.targetname;
    if (type == "br_loot_cache_bunker_lege") {
        type = "br_loot_cache_lege";
    }
    scriptable = spawnscriptable(type, struct.origin, struct.angles);
    scriptable setscriptablepartstate("body", "closed_usable");
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b22
// Size: 0x6f
function function_e7459c662d778e9b(drone) {
    var_1f47ee8f1ad1320b = function_78bbcf05169f763(drone.var_3ab975339452a8a9, level.var_770b15c8cf662749);
    var_1f47ee8f1ad1320b.var_7a6430ba88c4d983 = drone.origin;
    if (isdefined(var_1f47ee8f1ad1320b)) {
        drone setscriptablepartstate("redeploy_drone", "available");
        drone namespace_2c2703f78fc59600::redeploy_drone_relocate(var_1f47ee8f1ad1320b, 1, 1, 1, 1);
    }
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b99
// Size: 0x2a7
function function_5e3613d57820ecc4(trigger) {
    level endon("game_ended");
    while (true) {
        trigger waittill("trigger", player);
        var_f76b3deb413c5757 = function_78bbcf05169f763(trigger.targetname, level.var_cdc0b4ad36375763);
        if (isdefined(var_f76b3deb413c5757) && var_f76b3deb413c5757 function_1267c4df411653a6()) {
            if (!var_f76b3deb413c5757 function_f6514ceaf551efaa(player)) {
                var_f76b3deb413c5757 function_e6911a79b259ee30(player);
            }
        }
        interiordoor = function_78bbcf05169f763(trigger.targetname, level.var_b8e3a1a7470e8e9d);
        if (isdefined(interiordoor) && !istrue(interiordoor.opened)) {
            thread function_226d75fce239ea20(interiordoor);
            interiordoor.opened = 1;
        }
        var_c5d32ee62e82490 = function_78bbcf05169f763(trigger.targetname, level.var_cf5c5baf6a57f293);
        if (isdefined(var_c5d32ee62e82490) && !istrue(var_c5d32ee62e82490.opened)) {
            var_c5d32ee62e82490 setscriptablepartstate("base", "opening");
            var_c5d32ee62e82490.opened = 1;
        }
        drone = function_9115eda389d3622b(trigger.targetname);
        if (isdefined(drone) && !istrue(drone.launched)) {
            function_e7459c662d778e9b(drone);
            drone.launched = 1;
        }
        if (isdefined(trigger.targetname) && trigger.targetname == "bunker_07") {
            if (!istrue(level.var_a4760c354b01a17a)) {
                foreach (light in level.var_2330b8479f14e5d0) {
                    function_b4a58174f360218b(light);
                }
                foreach (player in level.var_e53c561b323bd33b) {
                    if (isdefined(player) && isplayer(player) && isalive(player) && !istrue(player.gulag) && !istrue(player.var_8de39950bc563d97) && !istrue(player.var_3128ea12e6ec94e2)) {
                        player preloadcinematicforplayer("jup_wz_bunker_pc_sequence", 1, 1);
                        player.var_8de39950bc563d97 = 1;
                    }
                }
                level.var_a4760c354b01a17a = 1;
            }
        }
    }
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e48
// Size: 0x1d
function function_b4a58174f360218b(light) {
    light setlightintensity(light.var_3910dfdf86082a33);
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e6d
// Size: 0xa8
function function_bf75d660afd25576(trigger) {
    trigger waittill("trigger");
    if (isdefined(trigger.targetname) && trigger.targetname == "bunker_07") {
        foreach (light in level.var_2330b8479f14e5d0) {
            playsoundatpos(light.origin + (0, 0, -5), "evt_br_bunker_light_switch");
            return;
        }
    }
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f1d
// Size: 0x26
function function_226d75fce239ea20(interiordoor) {
    wait level.var_cdb24d59c2bf8c15;
    interiordoor setscriptablepartstate("bunker_door", "opening");
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1f4b
// Size: 0x2d0
function function_ca99372711c88ea8(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (player namespace_aead94004cf4c147::function_36b1968bfe78916b(level.var_d432f6b3d679c326)) {
        player namespace_aead94004cf4c147::function_6f39f9916649ac48(level.var_d432f6b3d679c326, 1);
        instance setscriptablepartstate("bunker_door", "opening");
        instance setscriptablepartstate("bunker_hint", "disabled");
        instance.opened = 1;
        if (instance.script_noteworthy == "bunker_exterior_door") {
            if (isdefined(instance.targetname)) {
                id = function_ab7b14c6776b7aa9(instance.targetname);
                squadmates = level.teamdata[player.team]["players"];
                foreach (squadmate in squadmates) {
                    squadmate scripts\mp\hud_message::showsplash("br_bunker_unlock", id, player);
                }
            }
            if (instance function_acaa75ca8754452e()) {
                instance function_af5604ce591768e1();
                instance notify("circle_deleted");
            }
        } else if (instance.script_noteworthy == "bunker_treasury_door") {
            if (isdefined(instance.targetname) && instance.targetname == "bunker_13") {
                squadmates = level.teamdata[player.team]["players"];
                foreach (squadmate in squadmates) {
                    scripts\cp_mp\challenges::function_8359cadd253f9604(squadmate, "BR_EASTEREGG_BUNKER13", 1);
                }
            }
        }
        return;
    }
    if (!istrue(instance.var_20fd4ea446d61d3e)) {
        instance.var_20fd4ea446d61d3e = 1;
        if (istrue(level.var_7999e6ec073b3900)) {
            if (instance.script_noteworthy == "bunker_exterior_door") {
                level thread scripts\mp\gametypes\br_public::brleaderdialogplayer("br_bunker_exterior_deny", player, 1, undefined, 0, undefined, "dx_br_urzi_");
            } else if (instance.script_noteworthy == "bunker_treasury_door") {
                level thread scripts\mp\gametypes\br_public::brleaderdialogplayer("br_bunker_treasure_deny", player, 1, undefined, 0, undefined, "dx_br_urzi_");
            }
        }
        instance setscriptablepartstate("bunker_hint", "missing");
        player playlocalsound("br_pickup_deny_lyr");
        wait 3;
        instance setscriptablepartstate("bunker_hint", "usable");
        instance.var_20fd4ea446d61d3e = 0;
    }
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x2223
// Size: 0x143
function function_57dcf788fec9fd2f(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    level notify("bunker_pc_used");
    if (!isdefined(level.var_e9198597ca44a070)) {
        level.var_e9198597ca44a070 = instance;
    }
    instance setscriptablepartstate("pc_monitor", "message_2");
    thread function_e3070b55b216fa35(instance, player);
    nearbyplayers = level.var_e53c561b323bd33b;
    foreach (player in nearbyplayers) {
        if (isdefined(player) && isalive(player) && !istrue(player.gulag) && !istrue(player.var_3128ea12e6ec94e2)) {
            thread function_86e11b0e03845f1c(instance, player);
            player.var_3128ea12e6ec94e2 = 1;
            instance disablescriptableplayeruse(player);
            scripts\cp_mp\challenges::function_8359cadd253f9604(player, "br_cerb_reveal_computer_used", 1);
        }
    }
    playsoundatpos(instance.origin + (0, 0, 5), "evt_br_bunker_keyboard_interact");
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x236e
// Size: 0x9d
function function_17224b22a47cbf2b(player, trigger) {
    if (!isplayer(player)) {
        return;
    }
    if (!isdefined(level.var_e53c561b323bd33b)) {
        level.var_e53c561b323bd33b = [];
    }
    if (istrue(level.var_a4760c354b01a17a)) {
        if (!istrue(player.var_8de39950bc563d97) && !istrue(player.var_3128ea12e6ec94e2)) {
            player preloadcinematicforplayer("jup_wz_bunker_pc_sequence", 1, 1);
            player.var_8de39950bc563d97 = 1;
        }
    }
    level.var_e53c561b323bd33b[level.var_e53c561b323bd33b.size] = player;
    level notify("player_in_bunker_7");
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2413
// Size: 0xd7
function function_e6a5226749e068ff(player, trigger) {
    if (!isplayer(player) || !arraycontains(level.var_e53c561b323bd33b, player)) {
        return;
    }
    level.var_e53c561b323bd33b = arrayremove(level.var_e53c561b323bd33b, player);
    if (level.var_e53c561b323bd33b.size == 0 && isdefined(level.var_e9198597ca44a070)) {
        thread function_3648beb32a1c197f(level.var_e9198597ca44a070);
    }
    if (istrue(player.var_8de39950bc563d97) && !istrue(player.var_3128ea12e6ec94e2)) {
        player setclientdvar(@"hash_993a0956fe832477", 0);
        player stopcinematicforplayer(1, 1);
        player.var_8de39950bc563d97 = 0;
        wait 0.5;
        player setclientdvar(@"hash_993a0956fe832477", 1);
    }
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x24f2
// Size: 0x8d
function function_e3070b55b216fa35(instance, player) {
    player waittill("pc_bink_end");
    wait 3.5;
    instance setscriptablepartstate("pc_monitor", "off");
    foreach (player in level.players) {
        if (istrue(player.var_3128ea12e6ec94e2)) {
            instance disablescriptableplayeruse(player);
        }
    }
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2587
// Size: 0x41
function function_3648beb32a1c197f(instance) {
    level endon("game_ended");
    level endon("bunker_pc_used");
    level endon("player_in_bunker_7");
    if (level.var_c1beb9ab59838d62 <= 0) {
        return;
    }
    wait level.var_c1beb9ab59838d62;
    function_a754e1ff09435068(instance);
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x25d0
// Size: 0xd0
function function_a754e1ff09435068(instance) {
    instance setscriptablepartstate("pc_monitor", "off");
    level.var_a4760c354b01a17a = undefined;
    foreach (player in level.players) {
        player.var_8de39950bc563d97 = undefined;
    }
    foreach (light in level.var_2330b8479f14e5d0) {
        light setlightintensity(0);
    }
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x26a8
// Size: 0x4d
function function_27322f324a65f978(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    instance.player = player;
    scripts\mp\gametypes\br_bunker_utility::keypadscriptableused(instance, part, state, player, var_a5b2c541413aa895, usestring);
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x26fd
// Size: 0x12a
function function_824219d6af679a49(instance) {
    var_7fc38859872ab8fc = function_78bbcf05169f763("bunker_07", level.var_cdc0b4ad36375763);
    if (isdefined(var_7fc38859872ab8fc)) {
        var_7fc38859872ab8fc setscriptablepartstate("bunker_door", "opening");
        var_7fc38859872ab8fc setscriptablepartstate("bunker_hint", "disabled");
        var_7fc38859872ab8fc.opened = 1;
        instance setscriptablepartstate("bunker_keypad", "off");
        if (isdefined(var_7fc38859872ab8fc.targetname)) {
            id = function_ab7b14c6776b7aa9(var_7fc38859872ab8fc.targetname);
            player = instance.player;
            squadmates = level.teamdata[player.team]["players"];
            foreach (squadmate in squadmates) {
                squadmate scripts\mp\hud_message::showsplash("br_bunker_unlock_keypad", id, player);
            }
        }
    }
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x282f
// Size: 0x118
function function_6ff32ae26d76be30(instance) {
    var_7fc38859872ab8fc = function_78bbcf05169f763("bunker_13", level.var_b8e3a1a7470e8e9d);
    if (isdefined(var_7fc38859872ab8fc)) {
        var_7fc38859872ab8fc setscriptablepartstate("bunker_door", "opening");
        var_7fc38859872ab8fc.opened = 1;
        instance setscriptablepartstate("bunker_keypad", "off");
        if (isdefined(var_7fc38859872ab8fc.targetname)) {
            id = function_ab7b14c6776b7aa9(var_7fc38859872ab8fc.targetname);
            player = instance.player;
            squadmates = level.teamdata[player.team]["players"];
            foreach (squadmate in squadmates) {
                squadmate scripts\mp\hud_message::showsplash("br_bunker_unlock_keypad", id, player);
            }
        }
    }
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x294f
// Size: 0x41
function function_e33b4d4ab4129418(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    player setclientomnvar("ui_br_bunker_map_overlay_active", 1);
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2998
// Size: 0x1b4
function onBunkerKeycardPickup(player) {
    var_bcae3770b384f578 = function_e36158c63e83456e(player);
    if (!isdefined(var_bcae3770b384f578)) {
        logprint("No unopened bunkers found in area");
        return;
    }
    if (!var_bcae3770b384f578 function_acaa75ca8754452e()) {
        spawnpoint = var_bcae3770b384f578.origin;
        if (isnavmeshloaded()) {
            spawnpoint = scripts\common\utility::function_c62375923163b86c(var_bcae3770b384f578.origin, 1000);
        }
        var_bcae3770b384f578 function_6b6b6273f8180522("bunker_mystery_circle", spawnpoint, 2000);
        var_bcae3770b384f578 function_4eaf685bc40a3b9();
        thread function_c05a2d1841ff3069(var_bcae3770b384f578);
    }
    squadmates = level.teamdata[player.team]["players"];
    foreach (squadmate in squadmates) {
        function_d7fc4a6a17f0d218(var_bcae3770b384f578, squadmate);
        if (!isdefined(squadmate.var_a1cc159ab34cac12)) {
            squadmate.var_a1cc159ab34cac12 = 0;
        }
        if (istrue(level.var_7999e6ec073b3900) && squadmate.var_a1cc159ab34cac12 <= 0) {
            level thread scripts\mp\gametypes\br_public::brleaderdialogplayer("br_bunker_key_first_pick", squadmate, 1, undefined, 1.5, undefined, "dx_br_urzi_");
        }
        squadmate.var_a1cc159ab34cac12 += 1;
        if (self.var_5f65843850735d54 < 0 || squadmate.var_a1cc159ab34cac12 <= self.var_5f65843850735d54) {
            squadmate scripts\mp\hud_message::showsplash("br_bunker_keycard_pickup", undefined, player);
        }
    }
    thread function_71c5ccf1e31e2ec7(var_bcae3770b384f578, player);
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b54
// Size: 0x28
function function_ab7b14c6776b7aa9(targetname) {
    id = function_2e84a570d6af300a(targetname, "bunker_");
    return int(id);
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b85
// Size: 0xa7
function function_435e8557b5c3d2fb(player) {
    var_65e3837494be9dc7 = sortbydistancecullbyradius(level.var_cdc0b4ad36375763, player.origin, level.var_250aec27a78884a);
    for (i = 0; i < var_65e3837494be9dc7.size; i++) {
        if (istrue(var_65e3837494be9dc7[i].opened)) {
            continue;
        }
        if (!isdefined(var_65e3837494be9dc7[i].targetname)) {
            continue;
        }
        if (var_65e3837494be9dc7[i].targetname == "bunker_07") {
            continue;
        }
        return function_ab7b14c6776b7aa9(var_65e3837494be9dc7[i].targetname);
    }
    return 0;
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c35
// Size: 0xf8
function function_e36158c63e83456e(player) {
    var_65e3837494be9dc7 = sortbydistance(level.var_cdc0b4ad36375763, player.origin);
    foreach (bunker in var_65e3837494be9dc7) {
        if (isdefined(bunker.targetname) && bunker.targetname == "bunker_07") {
            continue;
        }
        if (!level.br_circle_disabled) {
            var_bd9c01677ccc133b = namespace_bbc79db4c3949a5c::gettimetilldangerforpoint(bunker.origin);
            if (scripts\mp\gametypes\br_circle::function_24c5a8d31ae262f(bunker.origin) || var_bd9c01677ccc133b <= level.var_21ea71a5d52c2de0) {
                continue;
            }
        }
        if (!istrue(bunker.opened)) {
            return bunker;
        }
    }
    return undefined;
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d36
// Size: 0x49
function function_c05a2d1841ff3069(bunker) {
    level endon("game_ended");
    bunker endon("circle_deleted");
    radius = 0;
    while (true) {
        bunker function_4584ad1c0e2c58ec(radius);
        radius += 20;
        if (radius > 2000) {
            radius = 0;
        }
        waitframe();
    }
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2d87
// Size: 0x5c
function function_d7fc4a6a17f0d218(bunker, player) {
    if (isdefined(player.var_cdf418568fa426a4)) {
        player.var_cdf418568fa426a4 hidefromplayer(player);
    }
    player notify("bunker_quest_circle_show");
    bunker function_cfd53c8f6878014f(player);
    player.var_cdf418568fa426a4 = bunker.mapcircle;
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2deb
// Size: 0x194
function function_86e11b0e03845f1c(var_d408a87ac65916ae, player) {
    level endon("game_ended");
    player endon("disconnect");
    player endon("death");
    player setclientdvar(@"hash_993a0956fe832477", 0);
    player function_786fee88b4749dff(0, 1);
    thread watchplayerdeath(player);
    wait 5;
    player scripts\mp\utility\lower_message::setlowermessageomnvar("br_bunker_pc_monitor_message_2", undefined, 1.5);
    wait 1.5;
    player scripts\mp\utility\lower_message::setlowermessageomnvar("br_bunker_pc_monitor_message_2_2", undefined, 1.5);
    wait 1.5;
    player scripts\mp\utility\lower_message::setlowermessageomnvar("br_bunker_pc_monitor_message_2_3", undefined, 1.5);
    wait 1.5;
    player scripts\mp\utility\lower_message::setlowermessageomnvar("br_bunker_pc_monitor_message_2_4", undefined, 1.5);
    wait 1.5;
    player scripts\mp\utility\lower_message::setlowermessageomnvar("br_bunker_pc_monitor_message_2_5", undefined, 1.5);
    wait 1.5;
    player scripts\mp\utility\lower_message::setlowermessageomnvar("br_bunker_pc_monitor_message_2_6", undefined, 1.5);
    wait 1.5;
    player scripts\mp\utility\lower_message::setlowermessageomnvar("br_bunker_pc_monitor_message_2_7", undefined, 1.5);
    wait 1.5;
    player scripts\mp\utility\lower_message::setlowermessageomnvar("br_bunker_pc_monitor_message_2_8", undefined, 1.5);
    wait 1.5;
    player scripts\mp\utility\lower_message::setlowermessageomnvar("br_bunker_pc_monitor_message_2_9", undefined, 1.5);
    wait 1.5;
    player scripts\mp\utility\lower_message::setlowermessageomnvar("br_bunker_pc_monitor_message_2_10", undefined, 1.5);
    wait 1.5;
    player scripts\mp\utility\lower_message::setlowermessageomnvar("br_bunker_pc_monitor_message_2_11", undefined, 2);
    wait 2;
    player scripts\mp\utility\lower_message::setlowermessageomnvar("br_bunker_pc_monitor_message_3", undefined, 3);
    wait 3;
    player stopcinematicforplayer(1, 1);
    player setclientdvar(@"hash_993a0956fe832477", 1);
    player notify("pc_bink_end");
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f87
// Size: 0x4d
function watchplayerdeath(player) {
    level endon("game_ended");
    player endon("pc_bink_end");
    player endon("disconnect");
    player waittill("death");
    player function_786fee88b4749dff(1, 1);
    player setclientdvar(@"hash_993a0956fe832477", 1);
    player scripts\mp\utility\lower_message::clearlowermessages();
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x2fdc
// Size: 0x58
function function_c49de466dc9bd0a8(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    level endon("game_ended");
    player endon("disconnect");
    player endon("death");
    player scripts\mp\utility\lower_message::setlowermessageomnvar("br_bunker_graffiti_message", undefined, 3);
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x303c
// Size: 0x113
function function_fc14fcc137d9fc2d(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    level endon("game_ended");
    player endon("disconnect");
    player endon("death");
    switch (instance.var_7acff0291e4e0204) {
    case #"hash_f2dfad9bf3d36039":
        player scripts\mp\utility\lower_message::setlowermessageomnvar("br_bunker_brief_message_01", undefined, 3);
        wait 3;
        player scripts\mp\utility\lower_message::setlowermessageomnvar("br_bunker_brief_message_02", undefined, 3);
        wait 3;
        player scripts\mp\utility\lower_message::setlowermessageomnvar("br_bunker_brief_message_03", undefined, 3);
        break;
    case #"hash_341fa752f5e67d94":
        player scripts\mp\utility\lower_message::setlowermessageomnvar("br_bunker_wanted_message_01", undefined, 3);
        wait 3;
        player scripts\mp\utility\lower_message::setlowermessageomnvar("br_bunker_wanted_message_02", undefined, 5);
        wait 5;
        player scripts\mp\utility\lower_message::setlowermessageomnvar("br_bunker_wanted_message_03", undefined, 5);
        break;
    case #"hash_6db3c965896ac591":
        player scripts\mp\utility\lower_message::setlowermessageomnvar("br_bunker_memorial_message", undefined, 3);
        break;
    default:
        break;
    }
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3157
// Size: 0x87
function function_6c4c860d64bcad1b(bunker) {
    level endon("game_ended");
    while (true) {
        foreach (player in level.players) {
            var_1ffbfd896a3002f9 = function_435e8557b5c3d2fb(player);
            player setclientomnvar("ui_br_bunker_doors_player_nearby", var_1ffbfd896a3002f9);
        }
        wait 2;
    }
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x31e6
// Size: 0xa7
function function_71c5ccf1e31e2ec7(bunker, player) {
    level endon("game_ended");
    bunker endon("circle_deleted");
    player endon("bunker_quest_circle_show");
    wait level.var_53e6ee1d07920c1;
    squadmates = level.teamdata[player.team]["players"];
    foreach (player in squadmates) {
        bunker function_d7d113d56ef0ef5b(player);
        player.var_cdf418568fa426a4 = undefined;
    }
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3295
// Size: 0x79
function function_78bbcf05169f763(targetname, var_d6c04a6d8c7b7693) {
    foreach (scriptable in var_d6c04a6d8c7b7693) {
        if (isdefined(scriptable.targetname)) {
            if (scriptable.targetname == targetname) {
                return scriptable;
            }
        }
    }
    return undefined;
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3317
// Size: 0x79
function function_9115eda389d3622b(targetname) {
    foreach (scriptable in level.var_b8871c817ad78bca) {
        if (isdefined(scriptable.var_3ab975339452a8a9)) {
            if (scriptable.var_3ab975339452a8a9 == targetname) {
                return scriptable;
            }
        }
    }
    return undefined;
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3399
// Size: 0x6d
function devSetupBunkerDoor(origin, angles, doortype) {
    bunker = undefined;
    switch (doortype) {
    case #"hash_fab600f6bdd31942":
        bunker = spawnscriptable("scriptable_jup_door_blast_bunker_01_door", origin, angles);
        break;
    default:
        bunker = undefined;
        break;
    }
    if (isdefined(bunker)) {
        function_2b91f8c6824f36af(bunker);
    }
}

// Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x340e
// Size: 0x76
function function_cc3c75e13749b1ea(origin, angles, var_872fff8a91852c9f, var_870c0d8a915cd0b1, targetname, script_noteworthy) {
    triggervolume = spawn("noent_volume_trigger_box", origin, 0, var_872fff8a91852c9f, var_870c0d8a915cd0b1);
    triggervolume.script_noteworthy = script_noteworthy;
    triggervolume.targetname = targetname;
    triggervolume.angles = angles;
    return triggervolume;
}

/#

    // Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x348d
    // Size: 0x35
    function init_debug() {
        function_6e7290c8ee4f558b("<dev string:x26>");
        function_a2fe753948998c89("<dev string:x40>", "<dev string:x51>");
        function_fe953f000498048f();
        scripts\mp\gametypes\br_dev::registerhandlecommand(&function_c96d7535862e245c);
    }

    // Namespace namespace_db1a5a61b2f193c1 / namespace_4333fea8ff2c3ddc
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x34ca
    // Size: 0x54e
    function function_c96d7535862e245c(command, args) {
        host = scripts\mp\gamelogic::gethostplayer();
        if (!isdefined(host)) {
            foreach (player in level.players) {
                if (!isai(player) && !player isplayerheadless()) {
                    host = player;
                    break;
                }
            }
        }
        spawnorigin = host.origin + anglestoforward(host.angles) * 100 + (0, 0, 30);
        switch (command) {
        case #"hash_76bdc23ccfab0c99":
            if (!isdefined(args[0])) {
                break;
            }
            switch (args[0]) {
            case #"hash_d747fa3ff1b78b29":
                foreach (var_c5d32ee62e82490 in level.var_cf5c5baf6a57f293) {
                    var_c5d32ee62e82490 setscriptablepartstate("<dev string:x95>", "<dev string:x9d>");
                    var_c5d32ee62e82490.opened = 1;
                    if (isdefined(var_c5d32ee62e82490.targetname)) {
                        drone = function_9115eda389d3622b(var_c5d32ee62e82490.targetname);
                        if (isdefined(drone)) {
                            function_e7459c662d778e9b(drone);
                            drone.launched = 1;
                        }
                    }
                }
                break;
            case #"hash_a140edb8b517af03":
                foreach (var_c5d32ee62e82490 in level.var_cf5c5baf6a57f293) {
                    var_c5d32ee62e82490 setscriptablepartstate("<dev string:x95>", "<dev string:xb1>");
                    var_c5d32ee62e82490.opened = 0;
                }
                break;
            default:
                break;
            }
            break;
        case #"hash_229e773318a253d":
            if (!isdefined(args[0])) {
                break;
            }
            switch (args[0]) {
            case #"hash_819aac6f5ae2fb78":
                level.var_b5f05f99018b165 = spawnscriptable("<dev string:xd9>", spawnorigin);
                break;
            case #"hash_fa2ad6f6bd651030":
                if (isdefined(level.var_b5f05f99018b165)) {
                    thread function_86e11b0e03845f1c(level.var_b5f05f99018b165, host);
                }
                break;
            case #"hash_3699ac6c262c25ea":
                if (isdefined(level.var_b5f05f99018b165)) {
                    level.var_b5f05f99018b165 setscriptablepartstate("<dev string:x107>", "<dev string:x100>");
                }
                break;
            default:
                break;
            }
        case #"hash_98b2ab59713eb959":
            host = scripts\mp\gamelogic::gethostplayer();
            level.var_ab224cd39fe26b2d = spawnscriptable("<dev string:x129>", spawnorigin);
            break;
        case #"hash_ce6a5bc8660dc619":
            if (!isdefined(args[0])) {
                break;
            }
            switch (args[0]) {
            case #"hash_819aac6f5ae2fb78":
                level.bunker_keypad = spawnscriptable("<dev string:x158>", spawnorigin);
                function_37e00e1115eec7c2(level.bunker_keypad);
                break;
            default:
                break;
            }
            break;
        case #"hash_eb5f2dee735740a7":
            if (!isdefined(args[0])) {
                break;
            }
            scriptable = undefined;
            switch (args[0]) {
            case #"hash_5c75a89521616a81":
                var_3847cc5d0555f73d = spawnscriptable("<dev string:x193>", spawnorigin);
                if (istrue(level.var_bfb3f734bfbfd303)) {
                    var_3847cc5d0555f73d setscriptablepartstate("<dev string:x1b8>", "<dev string:xfa>");
                }
                break;
            case #"hash_57a7bc028fc9b87f":
                scriptable = spawnscriptable("<dev string:x1d4>", spawnorigin);
                scriptable.var_7acff0291e4e0204 = "<dev string:x1f6>";
                break;
            case #"hash_5c10d9bd5595f96":
                scriptable = spawnscriptable("<dev string:x217>", spawnorigin);
                scriptable.var_7acff0291e4e0204 = "<dev string:x231>";
                break;
            case #"hash_dc82315419b37899":
                scriptable = spawnscriptable("<dev string:x255>", spawnorigin);
                scriptable.var_7acff0291e4e0204 = "<dev string:x271>";
                break;
            default:
                break;
            }
            if (isdefined(scriptable)) {
                if (istrue(level.var_7c6ef5f214a71f23)) {
                    scriptable setscriptablepartstate("<dev string:x283>", "<dev string:xfa>");
                }
            }
            break;
        case #"hash_2cb507aedb703b0d":
            if (!isdefined(args[0])) {
                break;
            }
            switch (args[0]) {
            case #"hash_819aac6f5ae2fb78":
                level.var_cdc73823f527577b = spawnscriptable("<dev string:x2af>", spawnorigin);
                break;
            case #"hash_b73d9f776062ae65":
                if (!isdefined(args[1])) {
                    break;
                }
                level.var_cdc73823f527577b setscriptablepartstate("<dev string:x1b8>", "<dev string:x2e0>" + args[1]);
                break;
            default:
                break;
            }
            break;
        default:
            break;
        }
    }

#/
