#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\mp\gametypes\br_dev.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using script_3aacf02225ca0da5;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using scripts\mp\poi.gsc;
#using script_600b944a95c3a7bf;
#using scripts\mp\gametypes\br_lootcache.gsc;

#namespace namespace_bcb933b4628a0583;

// Namespace namespace_bcb933b4628a0583 / namespace_c4ee18ac2340c4
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x12f
// Size: 0x4d
function autoexec init() {
    wcEnabled = getmatchrulesdata("brData", "wcEnabled");
    if (!istrue(wcEnabled)) {
        return;
    }
    level thread scripts\common\callbacks::add("cache_opened", &function_aa629573b9b452b7);
    /#
        scripts\mp\gametypes\br_dev::registerhandlecommand(&function_6a7b9641a3a20e1f);
    #/
    level thread function_48f199019893233();
}

/#

    // Namespace namespace_bcb933b4628a0583 / namespace_c4ee18ac2340c4
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x184
    // Size: 0x4c
    function function_6a7b9641a3a20e1f(command, args) {
        switch (command) {
        case #"hash_17dfdff470b29d21": 
            function_cb7c4514a72932eb();
            break;
        case #"hash_7c73180505697cb8": 
            function_7e20c3b647ab66af(args);
            break;
        }
    }

    // Namespace namespace_bcb933b4628a0583 / namespace_c4ee18ac2340c4
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x1d8
    // Size: 0x90
    function private function_cb7c4514a72932eb() {
        dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
        player = scripts\mp\gametypes\br_dev::function_69dffe7a5cb1b4b9();
        droporigin = player.origin;
        dropangles = player.angles;
        var_203302b9ac91e7f4 = scripts\mp\gametypes\br_pickups::getitemdroporiginandangles(dropstruct, droporigin, dropangles, player);
        var_8cb92419e054019d = level.var_53f1209f53f48f29.scriptablename;
        namespace_a8b2b88699fc40fb::function_1bafb1f579534ef6(var_203302b9ac91e7f4, undefined, var_8cb92419e054019d);
    }

    // Namespace namespace_bcb933b4628a0583 / namespace_c4ee18ac2340c4
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x270
    // Size: 0x255
    function private function_7e20c3b647ab66af(args) {
        splash = args[0];
        if (!isdefined(splash)) {
            return;
        }
        player = scripts\mp\gametypes\br_dev::function_69dffe7a5cb1b4b9();
        switch (splash) {
        case #"hash_1774ceaa0777e27a": 
            splash = level.var_53f1209f53f48f29.locatedsplash;
            if (isdefined(splash) && splash != "<dev string:x41>") {
                scripts\mp\gametypes\br_gametype_dmz::showdmzsplash(splash, [player], scripts\mp\poi::function_6cc445c02b5effac((0, 0, 0), undefined, undefined, 1));
            }
            break;
        case #"hash_8465013d72aff5d3": 
            splash = level.var_53f1209f53f48f29.pickedupsplash;
            if (isdefined(splash) && splash != "<dev string:x41>") {
                scripts\mp\gametypes\br_gametype_dmz::showdmzsplash(splash, [player], scripts\mp\poi::function_6cc445c02b5effac((0, 0, 0), undefined, undefined, 1));
            }
            break;
        case #"hash_972a17c0ca228175": 
            splash = level.var_53f1209f53f48f29.transfersplash;
            if (isdefined(splash) && splash != "<dev string:x41>") {
                scripts\mp\gametypes\br_gametype_dmz::showdmzsplash(splash, [player], scripts\mp\poi::function_6cc445c02b5effac((0, 0, 0), undefined, undefined, 1));
            }
            break;
        case #"hash_66a7a00142df674a": 
            splash = level.var_53f1209f53f48f29.var_a57c046cc112e52e;
            if (isdefined(splash) && splash != "<dev string:x41>") {
                scripts\mp\gametypes\br_gametype_dmz::showdmzsplash(splash, [player], undefined, undefined, player);
            }
            break;
        case #"hash_429fcf861cfd9831": 
            splash = level.var_53f1209f53f48f29.var_370a2e386a4e87c5;
            if (isdefined(splash) && splash != "<dev string:x41>") {
                scripts\mp\gametypes\br_gametype_dmz::showdmzsplash(splash, [player], undefined, undefined, player);
            }
            break;
        case #"hash_2e0a5db971121efd": 
            splash = level.var_53f1209f53f48f29.var_77e9cba9da41c3a1;
            if (isdefined(splash) && splash != "<dev string:x41>") {
                scripts\mp\gametypes\br_gametype_dmz::showdmzsplash(splash, [player]);
            }
            break;
        case #"hash_e8288fd182a3928c": 
            splash = level.var_53f1209f53f48f29.var_eb67bce2db34d570;
            if (isdefined(splash) && splash != "<dev string:x41>") {
                showdmzsplash(splash, [player]);
            }
            break;
        }
    }

#/

// Namespace namespace_bcb933b4628a0583 / namespace_c4ee18ac2340c4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cd
// Size: 0x299
function function_48f199019893233() {
    level endon("game_ended");
    level waittill("prematch_done");
    assert(isdefined(level.var_53f1209f53f48f29));
    if (!isdefined(level.var_53f1209f53f48f29)) {
        return;
    }
    spawndelayoverride = getdvarfloat(@"hash_f8fd50500de94a36", -1);
    if (spawndelayoverride >= 0) {
        wait spawndelayoverride;
    } else if (isnumber(level.var_53f1209f53f48f29.spawndelay) && level.var_53f1209f53f48f29.spawndelay > 0) {
        wait level.var_53f1209f53f48f29.spawndelay;
    }
    hiddencontainers = getentitylessscriptablearray("dmz_hidden_container_common");
    if (hiddencontainers.size > 0) {
        var_3dac1af17f6649c2 = default_to(level.var_dbf0ea25b5afb2a3, []);
        if (var_3dac1af17f6649c2.size > 0) {
            for (i = 0; i < hiddencontainers.size; i++) {
                origin = hiddencontainers[i].origin;
                if (!isdefined(origin)) {
                    continue;
                }
                if (array_contains(var_3dac1af17f6649c2, origin)) {
                    hiddencontainers = array_remove_index(hiddencontainers, i);
                    i--;
                }
            }
        }
        for (i = 0; i < hiddencontainers.size; i++) {
            state = hiddencontainers[i] getscriptablepartstate("body");
            if (state != "closed_usable") {
                hiddencontainers = array_remove_index(hiddencontainers, i);
                i--;
            }
        }
        assert(hiddencontainers.size > 0);
        if (!hiddencontainers.size) {
            return;
        }
        pick = random(hiddencontainers);
        lootid = namespace_38b993c4618e76cd::getlootidfromref(level.var_53f1209f53f48f29.scriptablename);
        pick scripts\mp\gametypes\br_lootcache::function_d683a60016231237(lootid, 1);
        quest = level;
        var_dc36f97e01fdb3ea = randomfloat(min(getdvarfloat(@"hash_cfc0a28cdf289e24", 1), 1) * level.var_53f1209f53f48f29.var_dc36f97e01fdb3ea);
        origin = pick.origin + math::random_vector_2d() * var_dc36f97e01fdb3ea;
        quest game_utility::function_6b6b6273f8180522(level.var_53f1209f53f48f29.var_e6f187bcb4b1648e, origin, level.var_53f1209f53f48f29.questcircleradius);
        quest game_utility::function_6988310081de7b45();
        level.var_53f1209f53f48f29.quest = quest;
        namespace_a8b2b88699fc40fb::function_95d2129bcec4692(pick.origin);
    }
}

// Namespace namespace_bcb933b4628a0583 / namespace_c4ee18ac2340c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76e
// Size: 0x191
function function_aa629573b9b452b7(var_e384a29fa99c895c) {
    if (!isdefined(level.var_53f1209f53f48f29) || !isdefined(var_e384a29fa99c895c) || !isdefined(var_e384a29fa99c895c.pickupents)) {
        return;
    }
    foreach (ent in var_e384a29fa99c895c.pickupents) {
        if (!isdefined(ent)) {
            continue;
        }
        if (ent.type == level.var_53f1209f53f48f29.scriptablename) {
            namespace_a8b2b88699fc40fb::function_3e7ee85cb0d3504c(ent);
            if (level.var_509664f56a31278f && isdefined(level.var_53f1209f53f48f29)) {
                splash = level.var_53f1209f53f48f29.locatedsplash;
                scriptable = level.var_b220727281972841.scriptable;
                if (isdefined(splash) && splash != "") {
                    scripts\mp\gametypes\br_gametype_dmz::showdmzsplash(splash, level.players, scripts\mp\poi::function_6cc445c02b5effac(scriptable.origin, undefined, undefined, 1));
                }
            }
            if (isdefined(level.var_53f1209f53f48f29.quest)) {
                quest = level.var_53f1209f53f48f29.quest;
                quest game_utility::function_af5604ce591768e1();
                level.var_53f1209f53f48f29.quest = undefined;
            }
            break;
        }
    }
}

