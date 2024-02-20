// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using script_600b944a95c3a7bf;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_5def7af2a9f04234;
#using script_6a8ec730b2bfa844;
#using script_1f97a44d1761c919;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using scripts\mp\gametypes\br_public.gsc;

#namespace namespace_f3c34c81dcc60eda;

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x4ab
// Size: 0xc2
function autoexec init() {
    wcEnabled = getmatchrulesdata("brData", "wcEnabled");
    if (!istrue(wcEnabled)) {
        return;
    }
    wcData = getmatchrulesdata("brData", "wcData");
    if (!isdefined(wcData) || wcData == "") {
        return 0;
    }
    var_706c4249fa554e88 = function_2ef675c13ca1c4af(%"hash_31706c654b9d3b54", wcData);
    var_53f1209f53f48f29 = getscriptbundle(var_706c4249fa554e88);
    level.var_53f1209f53f48f29 = var_53f1209f53f48f29;
    callback::add(#"hash_c15c682d6a5dcae0", &onplayerentergulag);
    callback::add(#"hash_438552ad6e5b08a0", &function_3b3d0d8621983ff4);
    game["dialog"]["weaponcase_myTeam_found"] = "flyb_grav_brwe";
}

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x574
// Size: 0xba
function function_94b502046c767cd1() {
    if (isdefined(level.var_94b502046c767cd1)) {
        return level.var_94b502046c767cd1;
    }
    if (namespace_cd0b2d039510b38d::getsubgametype() != "dmz") {
        level.var_94b502046c767cd1 = "no_one";
        return level.var_94b502046c767cd1;
    }
    if (namespace_36f464722d326bbe::function_7ee65fae13124702() || level.mapname == "mp_br_mechanics") {
        var_33967fc4f4ceb489 = getdvarint(@"hash_5c2cb9fc4042e027", 40);
        if (var_33967fc4f4ceb489 > 0 && randomint(100) < var_33967fc4f4ceb489) {
            level.var_94b502046c767cd1 = "train";
            return level.var_94b502046c767cd1;
        }
    }
    level.var_94b502046c767cd1 = "boss";
    return level.var_94b502046c767cd1;
}

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x636
// Size: 0x6c
function function_1bafb1f579534ef6(var_cb4fad49263e20c4, player, scriptablename) {
    if (isdefined(level.var_b220727281972841)) {
        return undefined;
    }
    function_f9ec88c3d71324cd(scriptablename);
    var_918249fd5219a579 = namespace_cb965d2f71fefddc::spawnpickup(level.var_1e8771caf5122101, var_cb4fad49263e20c4, 1, 1);
    if (!isdefined(var_918249fd5219a579)) {
        return undefined;
    }
    function_3e7ee85cb0d3504c(var_918249fd5219a579, var_cb4fad49263e20c4.instance);
}

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a9
// Size: 0xc3
function function_3e7ee85cb0d3504c(scriptable, instance) {
    if (isdefined(level.var_b220727281972841)) {
        return;
    }
    function_f9ec88c3d71324cd(scriptable.type);
    level.var_b220727281972841 = spawnstruct();
    level.var_b220727281972841.scriptable = scriptable;
    level.var_b220727281972841.instance = instance;
    scriptable.var_bbc200bc77c5db2b = 1;
    if (level.var_86b2cfc21b9abcf8) {
        function_9b0ef508769a0a0f(scriptable.origin);
    } else {
        level.var_b220727281972841.objidnum = -1;
    }
    function_147936bfe8fd8d7e(scriptable.origin);
}

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x773
// Size: 0xaf
function function_f9ec88c3d71324cd(scriptablename) {
    if (isdefined(level.var_1e8771caf5122101)) {
        return;
    }
    scriptablename = function_53c4c53197386572(scriptablename, level.var_53f1209f53f48f29.scriptablename);
    level.var_1e8771caf5122101 = scriptablename;
    if (scriptablename == "brloot_weaponcase_black") {
        level.var_9a327d6ca5e25308 = 1;
    }
    lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(scriptablename);
    namespace_3c37cb17ade254d::registersharedfunc(scriptablename, "delete", &function_fbaa37f0a39a0d07);
    namespace_3c37cb17ade254d::registersharedfunc(scriptablename, "dropped", &function_f69e3d324a1172c6);
    namespace_3c37cb17ade254d::registersharedfunc(lootid, "addedToContainer", &function_22e6cb66ccb56285);
    namespace_3c37cb17ade254d::registersharedfunc(lootid, "pickedUp", &function_803a95e4e6cd2538);
}

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x829
// Size: 0x13f
function private function_fbaa37f0a39a0d07() {
    if (isdefined(self.var_bf8e5f003146af44) && self.var_bf8e5f003146af44 namespace_1f188a13f7e79610::isvehicle() && self.var_bf8e5f003146af44 namespace_1f188a13f7e79610::function_d93ec4635290febd() == "veh9_palfa") {
        return 0;
    }
    contents = namespace_2a184fc4902783dc::create_itemclip_contents();
    trace = namespace_2a184fc4902783dc::ray_trace(self.origin, self.origin - (0, 0, 10000), undefined, contents);
    if (!isdefined(trace["position"]) || !isdefined(trace["fraction"]) || trace["fraction"] >= 0.99 || namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(trace["position"])) {
        var_ab2d20734dd55190 = getclosestpointonnavmesh(self.origin);
        trace = namespace_2a184fc4902783dc::ray_trace(var_ab2d20734dd55190, var_ab2d20734dd55190 - (0, 0, 1000), undefined, contents);
    }
    if (!isdefined(trace["position"]) || !isdefined(trace["normal"]) || !isdefined(trace["fraction"]) || trace["fraction"] >= 0.99) {
        return 0;
    }
    utility::function_cefc758e6b25a243();
    self.origin = trace["position"];
    return 1;
}

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x970
// Size: 0x6f
function function_4e271ae7bc17f13c(player, dropstruct) {
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, player.origin, player.angles, player);
    var_918249fd5219a579 = namespace_cb965d2f71fefddc::spawnpickup(level.var_1e8771caf5122101, var_cb4fad49263e20c4, 1);
    function_f69e3d324a1172c6(var_918249fd5219a579, player, var_cb4fad49263e20c4.origin);
    return var_918249fd5219a579;
}

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9e7
// Size: 0x1c3
function private function_f69e3d324a1172c6(scriptable, owner, var_d7a9fdc121364c8d) {
    /#
        assert(isdefined(owner));
    #/
    if (!isdefined(level.var_b220727281972841)) {
        /#
            assertmsg("Attempted to drop an weaponCase when no info existed for it");
        #/
        return;
    }
    level.var_b220727281972841.var_c0b463e7d8cbfb91 = undefined;
    level.var_b220727281972841.scriptable = scriptable;
    scriptable.var_bbc200bc77c5db2b = 1;
    if (level.var_86b2cfc21b9abcf8 && level.var_b220727281972841.objidnum != -1) {
        level notify("interuptWeaponCaseShow");
        objective_setplayintro(level.var_b220727281972841.objidnum, 0);
        function_d76cc64b205084a3(level.var_b220727281972841.objidnum, istrue(level.var_53f1209f53f48f29.var_6342a4ff1d4cd212));
        namespace_5a22b6f3a56f7e9b::function_df6a3e032fa07d22(level.var_b220727281972841.objidnum);
    }
    if (level.var_509664f56a31278f) {
        splash = level.var_53f1209f53f48f29.var_370a2e386a4e87c5;
        if (isdefined(splash) && splash != "") {
            teammates = array_remove(level.teamdata[owner.team]["players"], owner);
            showDMZSplash(splash, teammates, undefined, undefined, owner);
        }
        splash = level.var_53f1209f53f48f29.var_eb67bce2db34d570;
        if (isdefined(splash) && splash != "") {
            showDMZSplash(splash, [0:owner]);
        }
    }
    function_d88e40b4707fdabd(owner, owner.health <= 0);
}

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbb1
// Size: 0xf2
function private function_22e6cb66ccb56285(container, owner) {
    if (!isdefined(level.var_b220727281972841)) {
        /#
            assertmsg("Attempted to add an weaponCase to a container when no info existed the weaponCase");
        #/
        return;
    }
    level.var_b220727281972841.var_c0b463e7d8cbfb91 = undefined;
    level.var_b220727281972841.scriptable = container;
    if (level.var_b220727281972841.objidnum != -1) {
        level notify("interuptWeaponCaseShow");
        objective_setplayintro(level.var_b220727281972841.objidnum, 0);
        function_d76cc64b205084a3(level.var_b220727281972841.objidnum, istrue(level.var_53f1209f53f48f29.var_10ba92c5298ab10b) || istrue(level.var_53f1209f53f48f29.var_6342a4ff1d4cd212));
        namespace_5a22b6f3a56f7e9b::function_df6a3e032fa07d22(level.var_b220727281972841.objidnum);
    }
}

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcaa
// Size: 0x523
function private function_803a95e4e6cd2538(scriptable, player) {
    if (!isdefined(level.var_b220727281972841)) {
        function_f9ec88c3d71324cd("brloot_weaponcase_black");
        level.var_b220727281972841 = spawnstruct();
        level.var_b220727281972841.var_c0b463e7d8cbfb91 = player;
        if (level.var_86b2cfc21b9abcf8) {
            function_9b0ef508769a0a0f(player.origin);
        }
    }
    objid = level.var_b220727281972841.objidnum;
    var_2db2f4dfa0a0d05f = 0;
    if (!isdefined(level.var_b220727281972841.lastteam) || isdefined(player.team) && player.team != level.var_b220727281972841.lastteam) {
        if (objid != -1) {
            objective_setownerteam(objid, player.team);
            objective_setprogressteam(objid, player.team);
            objective_setpulsate(objid, 1);
        }
        if (level.var_509664f56a31278f) {
            var_2db2f4dfa0a0d05f = 1;
            var_f84975dd9ca58ab9 = level.var_53f1209f53f48f29.var_a2ddfde0dd7a462f;
            if (isdefined(level.var_9d7687867d52ac75)) {
                var_f84975dd9ca58ab9 = [[ level.var_9d7687867d52ac75 ]]();
            }
            splash = ter_op(istrue(level.var_b220727281972841.var_50b1b1a351f6095b), level.var_53f1209f53f48f29.var_d65b997143e18fd9, var_f84975dd9ca58ab9);
            level.var_b220727281972841.var_50b1b1a351f6095b = 1;
            if (isdefined(splash) && splash != "") {
                players = level.players;
                if (isdefined(level.var_53f1209f53f48f29.var_77e9cba9da41c3a1) && level.var_53f1209f53f48f29.var_77e9cba9da41c3a1 != "") {
                    players = array_remove(level.players, player);
                }
                showDMZSplash(splash, players, namespace_37f0fb6355a4618a::function_6cc445c02b5effac(player.origin, undefined, undefined, 1));
            }
            level thread function_31a079a1fe9caa2(player);
        }
        if (namespace_36f464722d326bbe::function_5e0e3a24dbb1fae1() && namespace_8361bad7391de074::function_bebcefbd95a287ec(player)) {
            namespace_446fc987a980892f::function_9793a81bc3bc19e9("faction_e_fearless_on_weaponcase_pickup", player.team);
        } else {
            namespace_446fc987a980892f::function_9793a81bc3bc19e9("weapon_case_pickup_self", player.team);
        }
        if (level.mapname != "mp_bio_lab") {
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("weapon_case_pickup_enemy", array_difference(level.players, getteamdata(player.team, "players")));
        }
        if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
            exfils = getteamdata(player.team, "exfils");
            if (exfils.size > 0) {
                var_ef5c2361236a6ba9 = sortbydistance(exfils, player.origin)[0].ent;
                if (isdefined(var_ef5c2361236a6ba9)) {
                    player namespace_ede58c1e66c2c280::calloutmarkerping_createcallout(18, var_ef5c2361236a6ba9.origin, <error objectid>.index, var_ef5c2361236a6ba9 getlinkedscriptableinstance());
                }
            }
        }
    }
    if (objid != -1) {
        if (istrue(level.var_53f1209f53f48f29.var_10ba92c5298ab10b) || istrue(level.var_53f1209f53f48f29.var_6342a4ff1d4cd212)) {
            function_d76cc64b205084a3(objid, istrue(level.var_53f1209f53f48f29.var_10ba92c5298ab10b) || istrue(level.var_53f1209f53f48f29.var_6342a4ff1d4cd212));
            namespace_ede58c1e66c2c280::function_cd96f73dbca496b8(objid);
        }
    }
    if (level.var_509664f56a31278f) {
        splash = level.var_53f1209f53f48f29.var_a57c046cc112e52e;
        if (isdefined(splash) && splash != "") {
            teammates = array_remove(getteamdata(player.team, "players"), player);
            showDMZSplash(splash, teammates, undefined, undefined, player);
        }
        splash = level.var_53f1209f53f48f29.var_77e9cba9da41c3a1;
        if (isdefined(splash) && splash != "") {
            showDMZSplash(splash, [0:player]);
        }
    }
    if (objid != -1 && !var_2db2f4dfa0a0d05f) {
        namespace_5a22b6f3a56f7e9b::function_df6a3e032fa07d22(objid);
    }
    if (!isdefined(level.var_b220727281972841.lastteam) || level.var_b220727281972841.lastteam != player.team) {
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("weaponcase_myTeam_found", player.team, 1, 2, undefined);
    }
    level.var_b220727281972841.var_c0b463e7d8cbfb91 = player;
    level.var_b220727281972841.lastteam = player.team;
    level.var_b220727281972841.scriptable = undefined;
    function_ab9f38ae158a284c(player);
}

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11d4
// Size: 0x38
function function_55f0daea8408e3a9(lootid) {
    if (!isdefined(level.var_1e8771caf5122101)) {
        return 0;
    }
    var_3f7778cdb72a4a08 = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(level.var_1e8771caf5122101);
    return lootid == var_3f7778cdb72a4a08;
}

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1214
// Size: 0x3a
function function_c320904c58171311() {
    if (function_94333580dc2b96b(self) && isalive(self) && !istrue(self.extracted) && !istrue(self.var_ded04cdd264a7e00)) {
        function_5128a1edcec1c6e0();
    }
}

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1255
// Size: 0x65
function function_5128a1edcec1c6e0() {
    if (istrue(self.extracted)) {
        return;
    }
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(self.origin, self.angles);
    var_918249fd5219a579 = namespace_cb965d2f71fefddc::spawnpickup(level.var_1e8771caf5122101, var_cb4fad49263e20c4, 1);
    function_f69e3d324a1172c6(var_918249fd5219a579, self, var_cb4fad49263e20c4.origin);
}

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12c1
// Size: 0x8f
function private function_31a079a1fe9caa2(var_480f8576be141bb4) {
    objid = level.var_b220727281972841.objidnum;
    if (level.var_86b2cfc21b9abcf8 && objid != -1) {
        objective_setplayintro(level.var_b220727281972841.objidnum, 0);
        level notify("interuptWeaponCaseShow");
        level endon("interuptWeaponCaseShow");
        namespace_5a22b6f3a56f7e9b::function_f5862ad1ad967602(objid);
        wait(3.8);
        objective_setplayintro(objid, 1);
        namespace_5a22b6f3a56f7e9b::function_df6a3e032fa07d22(objid);
        waitframe();
        objective_setplayintro(objid, 0);
    }
}

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1357
// Size: 0x80
function function_5704ab2a9381630f(player) {
    if (function_94333580dc2b96b(player)) {
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(level.var_b220727281972841.objidnum);
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("weapon_case_extract_self", player.team);
        namespace_446fc987a980892f::function_d87d5deb069bf8e5("weapon_case_extract_enemy", array_difference(level.players, getteamdata(player.team, "players")));
        level notify("weaponCase_extracted");
    }
}

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13de
// Size: 0x30
function function_5a7168b0b511bec3(player) {
    return isdefined(level.var_8fc589b1edff1fb2) && istrue(level.var_8fc589b1edff1fb2[player.guid]);
}

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1416
// Size: 0x18c
function function_25a4b6a2083e2ab(players) {
    if (!isdefined(level.var_b220727281972841)) {
        return;
    }
    if (!isdefined(level.var_8fc589b1edff1fb2)) {
        level.var_8fc589b1edff1fb2 = [];
    }
    owner = level.var_b220727281972841.var_c0b463e7d8cbfb91;
    if (isdefined(owner) && array_contains(players, owner)) {
        foreach (teammember in players) {
            if (!isdefined(teammember)) {
                continue;
            }
            if (!is_equal(teammember.team, owner.team)) {
                continue;
            }
            level.var_8fc589b1edff1fb2[teammember.guid] = 1;
        }
        var_d64bef4dd271a622 = array_remove_array(level.players, players);
        if (isdefined(level.var_b220727281972841.instance) && isdefined(level.var_b220727281972841.instance.var_9329e0d3ce1d5ca8)) {
            showDMZSplash("dmz_lootbox_extracted_" + level.var_b220727281972841.instance.var_9329e0d3ce1d5ca8, var_d64bef4dd271a622, owner.var_da28916e7827af7c);
        } else {
            showDMZSplash("dmz_lootbox_extracted_generic", var_d64bef4dd271a622, owner.var_da28916e7827af7c);
        }
    }
}

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15a9
// Size: 0xb3
function function_baf5e17d7033a223(player) {
    if (!isdefined(level.var_8fc589b1edff1fb2)) {
        level.var_8fc589b1edff1fb2 = [];
    }
    var_5b6d15e33cb2eb51 = level.var_8fc589b1edff1fb2[player.guid];
    var_f260f6aff9ac7f06 = ter_op(isdefined(function_84d052fbd32e9c5b(player)), 1, 0);
    if (!isdefined(var_5b6d15e33cb2eb51)) {
        return 0;
    }
    /#
        assert(var_5b6d15e33cb2eb51 >= var_f260f6aff9ac7f06, "Player had more weaponCases than their team, which should be impossible");
    #/
    if (isdefined(level.var_8fc589b1edff1fb2[player.guid])) {
        return ((var_5b6d15e33cb2eb51 - var_f260f6aff9ac7f06) * level.br_pickups.var_d93566a78e29d583[level.var_1e8771caf5122101]);
    }
    return 0;
}

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1664
// Size: 0x12c
function function_8f6753648e94e7ec(player) {
    if (!isdefined(level.var_8fc589b1edff1fb2)) {
        level.var_8fc589b1edff1fb2 = [];
    }
    var_5b6d15e33cb2eb51 = level.var_8fc589b1edff1fb2[player.guid];
    if (!isdefined(var_5b6d15e33cb2eb51) || var_5b6d15e33cb2eb51 == 0) {
        return [];
    }
    if (!isdefined(level.br_pickups) || !isdefined(level.br_pickups.br_weapontoscriptable)) {
        /#
            assertmsg("getWeaponCaseRewardItems: level.br_pickups.br_weaponToScriptable was undefined");
        #/
        return [];
    }
    if (!isdefined(level.var_4cb4bde4ae44acba)) {
        level.var_4cb4bde4ae44acba = array_randomize(array_convert_keys_to_ints(level.br_pickups.br_weapontoscriptable));
    }
    if (!isdefined(level.var_a03d3949856a0ac2)) {
        level.var_a03d3949856a0ac2 = 0;
    }
    rewards = [];
    rewards[0] = level.br_pickups.var_7b2bff2d04ee1017[level.var_4cb4bde4ae44acba[level.var_a03d3949856a0ac2]];
    level.var_a03d3949856a0ac2 = (level.var_a03d3949856a0ac2 + 1) % level.var_4cb4bde4ae44acba.size;
    return rewards;
}

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1798
// Size: 0xd
function function_fc1ce25282bcba83() {
    return isdefined(level.var_b220727281972841);
}

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ad
// Size: 0x14
function function_94333580dc2b96b(player) {
    return isdefined(function_84d052fbd32e9c5b(player));
}

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17c9
// Size: 0x41
function function_84d052fbd32e9c5b(player) {
    if (isdefined(level.var_b220727281972841) && is_equal(level.var_b220727281972841.var_c0b463e7d8cbfb91, player)) {
        return level.var_b220727281972841;
    }
}

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1811
// Size: 0x150
function private function_9b0ef508769a0a0f(origin) {
    objid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
    level.var_b220727281972841.objidnum = objid;
    if (objid == -1) {
        return;
    }
    objective_setlabel(objid, level.var_53f1209f53f48f29.var_cda6dc299fe91ee2);
    objective_setpings(objid, 1);
    objective_setzoffset(objid, (0, 0, 80)[2]);
    objective_icon(objid, level.var_53f1209f53f48f29.var_ad643c538be8b717);
    function_a13e72e0427ecad2(objid, function_c87fc2417a4251fa());
    objective_setbackground(objid, 1);
    objective_state(objid, "current");
    objective_position(objid, origin + (0, 0, 30) - (0, 0, 80));
    objective_setownerteam(objid, undefined);
    objective_setprogressteam(objid, undefined);
    function_c047d7ffe7a83501(objid, level.var_53f1209f53f48f29.var_a7c6c5d6c3d369aa, level.var_53f1209f53f48f29.var_467f4d9b8d9063b);
    function_d76cc64b205084a3(objid, istrue(level.var_53f1209f53f48f29.var_6342a4ff1d4cd212));
    namespace_5a22b6f3a56f7e9b::function_79a1a16de6b22b2d(objid, 16);
    objective_setplayintro(objid, 0);
    namespace_5a22b6f3a56f7e9b::function_df6a3e032fa07d22(objid);
    level thread function_3de46c194ccd92d8();
}

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1968
// Size: 0x5a
function private onplayerentergulag(options) {
    if (!isdefined(level.var_b220727281972841)) {
        return;
    }
    objid = level.var_b220727281972841.objidnum;
    if (!isdefined(objid) || objid == -1) {
        return;
    }
    namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(objid, options.player);
}

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x19c9
// Size: 0x5a
function private function_3b3d0d8621983ff4(options) {
    if (!isdefined(level.var_b220727281972841)) {
        return;
    }
    objid = level.var_b220727281972841.objidnum;
    if (!isdefined(objid) || objid == -1) {
        return;
    }
    namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(objid, options.player);
}

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a2a
// Size: 0x1a1
function private function_3de46c194ccd92d8() {
    level endon("game_ended");
    level endon("weaponCase_extracted");
    var_b6b08a6a6f96b5c4 = ter_op(istrue(level.var_9a327d6ca5e25308), getdvarfloat(@"hash_886c13ade3501edf", 6), level.var_53f1209f53f48f29.var_88d998501e573978);
    while (1) {
        if (isdefined(level.var_b220727281972841.var_c0b463e7d8cbfb91)) {
            if (istrue(level.var_9a327d6ca5e25308)) {
                objective_position(level.var_b220727281972841.objidnum, level.var_b220727281972841.var_c0b463e7d8cbfb91.origin + (0, 0, 30) - (0, 0, 80));
            } else {
                objective_onentity(level.var_b220727281972841.objidnum, level.var_b220727281972841.var_c0b463e7d8cbfb91);
            }
        } else if (isdefined(level.var_b220727281972841.scriptable)) {
            objective_position(level.var_b220727281972841.objidnum, level.var_b220727281972841.scriptable.origin + (0, 0, 30) - (0, 0, 80));
        } else {
            namespace_5a22b6f3a56f7e9b::returnobjectiveid(level.var_b220727281972841.objidnum);
            return;
        }
        objective_ping(level.var_b220727281972841.objidnum);
        wait(var_b6b08a6a6f96b5c4);
    }
}

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bd2
// Size: 0x30
function function_95d2129bcec4692(origin) {
    var_cd25725fb0c8fc73 = level.players[0];
    var_cd25725fb0c8fc73 function_c20b29a0d9d6ccaf("init", origin);
}

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c09
// Size: 0x30
function private function_147936bfe8fd8d7e(origin) {
    var_cd25725fb0c8fc73 = level.players[0];
    var_cd25725fb0c8fc73 function_c20b29a0d9d6ccaf("spawned", origin);
}

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c40
// Size: 0x24
function private function_ab9f38ae158a284c(player) {
    player function_c20b29a0d9d6ccaf("pickup", player.origin);
}

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c6b
// Size: 0x2d
function private function_d88e40b4707fdabd(player, var_76941f891909e174) {
    player function_c20b29a0d9d6ccaf("drop", player.origin, var_76941f891909e174);
}

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c9f
// Size: 0x1ae
function private function_c20b29a0d9d6ccaf(type, position, var_76941f891909e174) {
    var_76941f891909e174 = function_53c4c53197386572(var_76941f891909e174, 0);
    eventparams = [];
    eventparams[eventparams.size] = "event_type";
    eventparams[eventparams.size] = type;
    /#
        assert(isstring(eventparams[eventparams.size - 1]));
    #/
    eventparams[eventparams.size] = "team_name";
    eventparams[eventparams.size] = self.team;
    /#
        assert(isstring(eventparams[eventparams.size - 1]));
    #/
    eventparams[eventparams.size] = "playlist_name";
    eventparams[eventparams.size] = getplaylistname();
    /#
        assert(isstring(eventparams[eventparams.size - 1]));
    #/
    eventparams[eventparams.size] = "circle_index";
    eventparams[eventparams.size] = function_8c7948c2206bdba1();
    /#
        assert(isnumber(eventparams[eventparams.size - 1]));
    #/
    eventparams[eventparams.size] = "map_name";
    eventparams[eventparams.size] = level.mapname;
    /#
        assert(isstring(eventparams[eventparams.size - 1]));
    #/
    eventparams[eventparams.size] = "position_x";
    eventparams[eventparams.size] = position[0];
    /#
        assert(isnumber(eventparams[eventparams.size - 1]));
    #/
    eventparams[eventparams.size] = "position_y";
    eventparams[eventparams.size] = position[1];
    /#
        assert(isnumber(eventparams[eventparams.size - 1]));
    #/
    eventparams[eventparams.size] = "position_z";
    eventparams[eventparams.size] = position[2];
    /#
        assert(isnumber(eventparams[eventparams.size - 1]));
    #/
    eventparams[eventparams.size] = "owner_killed";
    eventparams[eventparams.size] = var_76941f891909e174;
    /#
        assert(function_c86457bdd073e07b(eventparams[eventparams.size - 1]));
    #/
    self dlog_recordplayerevent("dlog_event_br_weapon_case", eventparams);
}

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e54
// Size: 0x4b
function private function_8c7948c2206bdba1() {
    circleindex = -1;
    if (isdefined(level.br_circle) && isdefined(level.br_circle.circleindex)) {
        circleindex = level.br_circle.circleindex;
    }
    return circleindex;
}

// Namespace namespace_f3c34c81dcc60eda/namespace_a8b2b88699fc40fb
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1ea7
// Size: 0x21
function private function_c86457bdd073e07b(value) {
    return isnumber(value) && (value == 1 || value == 0);
}

