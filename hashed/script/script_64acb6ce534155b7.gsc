// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_3214e6fcdce468a7;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using script_5238dee479bbf7fb;
#using script_3ff084f114b7f6c9;
#using scripts\mp\utility\lui_game_event_aggregator.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\gametypes\br_dom_quest.gsc;
#using scripts\mp\gametypes\br_assassination_quest.gsc;
#using scripts\mp\gametypes\br_vip_quest.gsc;
#using scripts\mp\gametypes\br_scavenger_quest.gsc;
#using scripts\mp\gametypes\br_timedrun_quest.gsc;
#using script_4e77eb48df5875ee;
#using script_1c9fa9bfb0a2fd44;
#using script_29e75e5ebeca383d;
#using script_7cf8223c43bbe80b;
#using script_28a1eb678d22e4e3;
#using script_2190c693b7121ab3;
#using script_4948cdf739393d2d;
#using script_5def7af2a9f04234;
#using scripts\mp\gametypes\br_analytics.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using script_58f20490049af6ac;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_1f97a44d1761c919;
#using script_728ffcee8cbf30ee;
#using script_189b67b2735b981d;
#using script_3ff2458477d23489;

#namespace namespace_c133516bfc1d803c;

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf74
// Size: 0x21b
function function_bf4fd0b5a7c2f528() {
    if (!getdvarint(@"hash_56d4c1121bffcdf1", 1)) {
        return;
    }
    if (game_utility::getsubgametype() == "dmz" || game_utility::getsubgametype() == "exgm") {
        return;
    }
    level.var_41f4bc9ee8c7c9c6 = spawnstruct();
    function_7630fa0c7b8a8999();
    inittablets();
    namespace_758f4cbc8c088674::registerondisconnecteventcallback(&onplayerdisconnect);
    namespace_1a2fa2b6ae5d223c::setupcirclepeek();
    namespace_6bf5a85a2b78b77a::registerTeamAssimilateCallback(&function_6bdc6f56944dc3aa);
    namespace_95a52c4860eaf4dd::registeronluieventcallback(&function_7871e27c25160f63);
    /#
        assert(isdefined(game["dialog"]));
    #/
    game["dialog"]["mission_gen_accept"] = "gnrc_grav_msns";
    game["dialog"]["mission_misc_success"] = "gnrc_grav_msnc";
    game["dialog"]["mission_obj_change"] = "gnrc_grav_bjcn";
    game["dialog"]["mission_obj_moved"] = "gnrc_grav_bjcr";
    game["dialog"]["mission_obj_next_ptarget"] = "gnrc_grav_trgn";
    game["dialog"]["mission_obj_next_nptarget"] = "gnrc_grav_bjcn";
    game["dialog"]["mission_obj_warning_time"] = "gnrc_grav_mstw";
    game["dialog"]["mission_obj_warning_capture"] = "mission_mission_obj_warning_capture";
    game["dialog"]["mission_obj_circle_fail"] = "gnrc_grav_msfr";
    game["dialog"]["mission_gen_fail"] = "gnrc_grav_msnf";
    game["dialog"]["mission_gen_fail_time"] = "gnrc_grav_mstt";
    game["dialog"]["mission_teammate_down"] = "tmmd_grav_mssn";
    game["dialog"]["mission_enemy_down"] = "nmyd_grav_mssn";
    level._effect["vfx_dom_flare"] = loadfx("vfx/iw8_br/gameplay/vfx_br_flare_dom");
    level._effect["vfx_revive_flare"] = loadfx("vfx/iw8_br/gameplay/vfx_br_flare_revive");
    level._effect["vfx_smktrail_mortar"] = loadfx("vfx/iw8_br/gameplay/vfx_br_flare_smktrail");
    level._effect["vfx_marker_base_orange_pulse"] = loadfx("vfx/iw8_br/gameplay/vfx_br_tr_marker.vfx");
    level.brmodevariantrewardcullfunc = undefined;
    br_circle::function_eca79fa0f341ee08(3, &dangercircletick, &function_1a1709943670772a, &function_6ac289b030b7cabe);
    /#
        thread function_870ec8b83fc533fd();
    #/
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1196
// Size: 0x6b9
function function_7630fa0c7b8a8999() {
    level.var_41f4bc9ee8c7c9c6.var_7ba7458b5fc820f7 = [];
    level.var_41f4bc9ee8c7c9c6.var_766f9de01948c219 = [];
    level.var_41f4bc9ee8c7c9c6.var_8764d5e454e66ea3 = [];
    level.var_41f4bc9ee8c7c9c6.var_b6fae9c9655c73bf = [];
    level.var_41f4bc9ee8c7c9c6.var_ab841cfaca2f23ad = [];
    level.var_41f4bc9ee8c7c9c6.var_8f51bbe0d6629b2c = [];
    level.var_41f4bc9ee8c7c9c6.var_8e0f287a7b13da80 = [];
    level.var_41f4bc9ee8c7c9c6.defaultfilter = [];
    level.var_41f4bc9ee8c7c9c6.defaultfilter[0] = &filtercondition_isdead;
    level.var_41f4bc9ee8c7c9c6.defaultfilter[1] = &filtercondition_ingulag;
    level.var_41f4bc9ee8c7c9c6.var_2bdaf97f6bfeab76 = getdvarint(@"hash_f6a77ffd2ac4d6d1", 1);
    level.var_41f4bc9ee8c7c9c6.rewards = spawnstruct();
    level.var_41f4bc9ee8c7c9c6.rewards.categorytogroup = [];
    level.var_41f4bc9ee8c7c9c6.rewards.grouptorewards = [];
    level.var_41f4bc9ee8c7c9c6.rewards.scalertoscaleinfo = [];
    level.var_41f4bc9ee8c7c9c6.rewards.rewardtotype = [];
    level.var_41f4bc9ee8c7c9c6.rewards.rewardtovalue = [];
    level.var_41f4bc9ee8c7c9c6.tiers = [];
    level.var_41f4bc9ee8c7c9c6.var_5c6031bde94872a7 = "MP_BR_INGAME/CONTRACT_CANCEL_TIME";
    level.var_41f4bc9ee8c7c9c6.var_8084cac3d31a6bee = "MP_BR_INGAME/CONTRACT_CANCEL";
    level.var_41f4bc9ee8c7c9c6.var_1108707ce662e831 = 2.5;
    if (!isdefined(level.var_62f6f7640e4431e3)) {
        var_a52e57a689222a7c = %"hash_e921a882197419d";
    } else {
        var_a52e57a689222a7c = level.var_62f6f7640e4431e3.var_49c199d2911ac097;
    }
    var_49c199d2911ac097 = getscriptbundle(var_a52e57a689222a7c).var_49c199d2911ac097;
    for (var_cf471964fc31f4ee = 0; var_cf471964fc31f4ee < var_49c199d2911ac097.size; var_cf471964fc31f4ee++) {
        if (!isdefined(var_49c199d2911ac097[var_cf471964fc31f4ee].contract)) {
            continue;
        }
        var_fb4895dbd3f68bd7 = getscriptbundle(var_49c199d2911ac097[var_cf471964fc31f4ee].contract);
        var_7ba7458b5fc820f7 = spawnstruct();
        var_7ba7458b5fc820f7.index = var_cf471964fc31f4ee;
        var_7ba7458b5fc820f7.enabled = var_fb4895dbd3f68bd7.enabled;
        var_7ba7458b5fc820f7.ref = var_fb4895dbd3f68bd7.name;
        var_7ba7458b5fc820f7.var_a0ce8000d303764c = var_fb4895dbd3f68bd7.var_e9f8a69b179ad10a;
        var_7ba7458b5fc820f7.funcs = [];
        var_7ba7458b5fc820f7.var_8d4889067c776936 = function_854eaac890bc7c17(var_7ba7458b5fc820f7.ref, 22, -1);
        var_7ba7458b5fc820f7.var_839e7395b90ff0ec = function_854eaac890bc7c17(var_7ba7458b5fc820f7.ref, 23, -1);
        var_7ba7458b5fc820f7.var_a517ddce5d9509a8 = function_854eaac890bc7c17(var_7ba7458b5fc820f7.ref, 24, 0);
        var_7ba7458b5fc820f7.var_17e740da24ef39aa = function_854eaac890bc7c17(var_7ba7458b5fc820f7.ref, 25, -1);
        if (issharedfuncdefined(var_7ba7458b5fc820f7.ref, "get_contract_data")) {
            function_f3bb4f4911a1beb2(var_7ba7458b5fc820f7.ref, "get_contract_data", var_7ba7458b5fc820f7);
        } else {
            switch (var_7ba7458b5fc820f7.ref) {
            case #"hash_f4a9126c03d3385b":
                namespace_564346a19fee25e0::function_fb7271d5ee18b98d(var_7ba7458b5fc820f7);
                break;
            case #"hash_96e641d7fe5b1cf1":
                namespace_1570f123b2a33e9e::function_fb7271d5ee18b98d(var_7ba7458b5fc820f7);
                break;
            case #"hash_f81960af7095fbde":
                namespace_1570f123b2a33e9e::function_fb7271d5ee18b98d(var_7ba7458b5fc820f7, "master");
                break;
            case #"hash_7b0c576c4a7e4890":
                namespace_b5b2280a66414fff::function_fb7271d5ee18b98d(var_7ba7458b5fc820f7);
                break;
            case #"hash_5c57b61aa79410db":
                namespace_f7cd931cfeef0f34::function_fb7271d5ee18b98d(var_7ba7458b5fc820f7);
                break;
            case #"hash_d0eb63c46c25ef55":
                namespace_52c3511331e3262::function_fb7271d5ee18b98d(var_7ba7458b5fc820f7);
                break;
            case #"hash_cf3abe09f0094696":
                namespace_78324ffeb3033698::function_fb7271d5ee18b98d(var_7ba7458b5fc820f7);
                break;
            case #"hash_bf5597954aaed3d7":
                namespace_a12ab42942591824::function_fb7271d5ee18b98d(var_7ba7458b5fc820f7);
                break;
            case #"hash_d22bc78737d8a069":
                namespace_cc15148f4ce22771::function_fb7271d5ee18b98d(var_7ba7458b5fc820f7);
                break;
            case #"hash_69146251ab5ca13a":
                namespace_6c622b52017c6808::function_fb7271d5ee18b98d(var_7ba7458b5fc820f7);
                break;
            case #"hash_4aae0f3e58abb932":
                namespace_522ef15f95ed6589::function_fb7271d5ee18b98d(var_7ba7458b5fc820f7);
                break;
            case #"hash_9bcbe04c85a6a767":
                namespace_6a760ad730220f95::function_fb7271d5ee18b98d(var_7ba7458b5fc820f7);
                break;
            case #"hash_73f686029a5278dc":
                namespace_97c4e054660113b7::function_fb7271d5ee18b98d(var_7ba7458b5fc820f7);
                break;
            case #"hash_74ed0c0772e5616":
            case #"hash_3684a21686064f80":
            case #"hash_55cbaf99a55ad833":
            case #"hash_74becfc3db09261d":
            case #"hash_c13e659fe3bd1db3":
            case #"hash_d055a3a4707f4721":
            case #"hash_e2589cebce7ef39c":
                break;
            default:
                /#
                    assertmsg("Unhandled contract type: " + var_7ba7458b5fc820f7.ref);
                #/
                break;
            }
        }
        level.var_41f4bc9ee8c7c9c6.var_7ba7458b5fc820f7[level.var_41f4bc9ee8c7c9c6.var_7ba7458b5fc820f7.size] = var_7ba7458b5fc820f7;
        level.var_41f4bc9ee8c7c9c6.var_766f9de01948c219[var_7ba7458b5fc820f7.ref] = var_7ba7458b5fc820f7;
        level.var_41f4bc9ee8c7c9c6.var_8764d5e454e66ea3[var_7ba7458b5fc820f7.var_a0ce8000d303764c] = var_7ba7458b5fc820f7;
    }
    var_4db88b018963d039 = tablelookupgetnumrows("mp/brmissions.csv");
    for (var_82a1684fcfe6e4f5 = 0; var_82a1684fcfe6e4f5 < var_4db88b018963d039; var_82a1684fcfe6e4f5++) {
        state = spawnstruct();
        state.index = int(tablelookupbyrow("mp/brmissions.csv", var_82a1684fcfe6e4f5, 0));
        state.ref = tablelookupbyrow("mp/brmissions.csv", var_82a1684fcfe6e4f5, 1);
        state.var_1bbeb265ef74bc60 = tablelookupbyrow("mp/brmissions.csv", var_82a1684fcfe6e4f5, 18);
        level.var_41f4bc9ee8c7c9c6.var_8f51bbe0d6629b2c[state.ref] = state;
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1856
// Size: 0xc85
function inittablets() {
    level.var_41f4bc9ee8c7c9c6.activetablets = [];
    level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46 = [];
    level.var_41f4bc9ee8c7c9c6.var_a140d7e8412b4051 = [];
    level.var_41f4bc9ee8c7c9c6.var_546b3948246e4aa3 = [];
    level.var_41f4bc9ee8c7c9c6.var_b6012b6ffdb53601 = [];
    var_64d2f24df5d49616 = 0;
    var_d1358da240d157c5 = getdvarfloat(@"hash_4ec62b4599196026", 0.667);
    var_18d89c513b75caf6 = [];
    var_7b18bf75c63cf8be = getdvarint(@"hash_61d045aa9b2d5565", 3);
    var_4c41f1d284a449f2 = getdvarint(@"hash_3b86f15e6ab5c0b0", 0);
    if (var_7b18bf75c63cf8be > 0 && isdefined(level.var_dbb3dd5ab77ccd48)) {
        foreach (poi in level.var_dbb3dd5ab77ccd48) {
            poiName = namespace_37f0fb6355a4618a::function_150af7f3a2874667(poi);
            var_18d89c513b75caf6[poiName] = var_7b18bf75c63cf8be;
        }
    }
    var_f7561229eb9c2c64 = 0;
    foreach (type in level.var_41f4bc9ee8c7c9c6.var_7ba7458b5fc820f7) {
        if (!isdefined(type.var_57bedc271771b7a6) || !istrue(type.var_57bedc271771b7a6)) {
            var_e0d1e3a2b6f5323a = getentitylessscriptablearray(type.var_a0ce8000d303764c);
        } else {
            var_e0d1e3a2b6f5323a = [[ type.funcs["spawnScriptables"] ]]();
        }
        if (!type.enabled) {
            foreach (tablet in var_e0d1e3a2b6f5323a) {
                function_2aa2583aa4c84697(tablet);
            }
        } else {
            level.var_41f4bc9ee8c7c9c6.var_546b3948246e4aa3[type.var_a0ce8000d303764c] = 0;
            level.var_41f4bc9ee8c7c9c6.var_b6012b6ffdb53601[type.var_a0ce8000d303764c] = 0;
            if (isdefined(type.var_2f8b14dbb63cc32a)) {
                var_64d2f24df5d49616 = type.var_2f8b14dbb63cc32a;
            } else {
                var_64d2f24df5d49616 = var_d1358da240d157c5;
            }
            var_6d130ebb53ad2136 = getdvarfloat(@"hash_341fd6b76f01c2e8", 1200);
            if (var_6d130ebb53ad2136 > 0 && var_e0d1e3a2b6f5323a.size > 0) {
                foreach (kiosk in level.br_armory_kiosk.scriptables) {
                    var_7ba908d45c350ca4 = getlootscriptablearrayinradius(type.var_a0ce8000d303764c, undefined, kiosk.origin, var_6d130ebb53ad2136);
                    foreach (var_edba0a1c91ab84bf in var_7ba908d45c350ca4) {
                        var_edba0a1c91ab84bf.var_bb2cd2998cc6e4ab = 1;
                    }
                }
                for (i = var_e0d1e3a2b6f5323a.size - 1; i >= 0; i--) {
                    if (!istrue(var_e0d1e3a2b6f5323a[i].var_bb2cd2998cc6e4ab)) {
                        continue;
                    }
                    var_e0d1e3a2b6f5323a[i].var_bb2cd2998cc6e4ab = undefined;
                    result = function_2aa2583aa4c84697(var_e0d1e3a2b6f5323a[i]);
                    /#
                        assertex(result, "Contract added to hideForever list twice when not expected");
                    #/
                    var_e0d1e3a2b6f5323a[i] = var_e0d1e3a2b6f5323a[var_e0d1e3a2b6f5323a.size - 1];
                    var_e0d1e3a2b6f5323a[var_e0d1e3a2b6f5323a.size - 1] = undefined;
                }
            }
            for (i = var_e0d1e3a2b6f5323a.size - 1; i >= 0; i--) {
                tablet = var_e0d1e3a2b6f5323a[i];
                tablet tabletinit(type);
                if (!tablet.init || namespace_6c6c9cbca3ea8e6e::function_f0201365c368cf88(tablet.origin) || !br_circle::function_d449927f9683e871(tablet.origin) || function_60094dbeee6e39b0(tablet.origin)) {
                    result = function_2aa2583aa4c84697(tablet);
                    /#
                        assertex(result, "Contract added to hideForever list twice when not expected");
                    #/
                    var_e0d1e3a2b6f5323a[i] = var_e0d1e3a2b6f5323a[var_e0d1e3a2b6f5323a.size - 1];
                    var_e0d1e3a2b6f5323a[var_e0d1e3a2b6f5323a.size - 1] = undefined;
                }
            }
            var_f7561229eb9c2c64 = var_f7561229eb9c2c64 + var_e0d1e3a2b6f5323a.size;
            if (var_e0d1e3a2b6f5323a.size) {
                setobjectivetypesomvarbit(type);
            }
            if (type.var_8d4889067c776936 > 0) {
                var_5731f7181809474a = var_e0d1e3a2b6f5323a.size;
            } else {
                var_2c3363605abb4836 = var_e0d1e3a2b6f5323a.size * var_64d2f24df5d49616;
                var_5731f7181809474a = int(var_2c3363605abb4836);
                var_c678b652d11243b9 = var_2c3363605abb4836 - var_5731f7181809474a;
                if (randomfloat(1) < var_c678b652d11243b9) {
                    var_5731f7181809474a++;
                }
            }
            for (i = 0; i < var_5731f7181809474a; i++) {
                randindex = randomintrange(0, var_e0d1e3a2b6f5323a.size);
                tablet = var_e0d1e3a2b6f5323a[randindex];
                level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46[level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46.size] = var_e0d1e3a2b6f5323a[randindex];
                var_e0d1e3a2b6f5323a[randindex] = var_e0d1e3a2b6f5323a[var_e0d1e3a2b6f5323a.size - 1];
                var_e0d1e3a2b6f5323a[var_e0d1e3a2b6f5323a.size - 1] = undefined;
            }
            foreach (tablet in var_e0d1e3a2b6f5323a) {
                if (var_18d89c513b75caf6.size > 0) {
                    poi = poi::function_6cc445c02b5effac(tablet.origin);
                    poiName = namespace_37f0fb6355a4618a::function_150af7f3a2874667(poi);
                    if (isdefined(poiName) && isdefined(var_18d89c513b75caf6[poiName])) {
                        var_18d89c513b75caf6[poiName]--;
                        if (!var_18d89c513b75caf6[poiName]) {
                            var_18d89c513b75caf6[poiName] = undefined;
                        }
                    }
                }
            }
            foreach (tablet in var_e0d1e3a2b6f5323a) {
                if (var_4c41f1d284a449f2 > 0) {
                    if (br_circle::function_d449927f9683e871(tablet.origin)) {
                        var_4c41f1d284a449f2--;
                    }
                }
            }
            foreach (tablet in var_e0d1e3a2b6f5323a) {
                tablet tabletshow();
            }
        }
    }
    if (var_18d89c513b75caf6.size) {
        level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46 = utility::array_randomize(level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46);
        for (i = level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46.size - 1; i >= 0; i--) {
            tablet = level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46[i];
            poi = poi::function_6cc445c02b5effac(tablet.origin);
            poiName = namespace_37f0fb6355a4618a::function_150af7f3a2874667(poi);
            if (isdefined(poiName) && isdefined(var_18d89c513b75caf6[poiName]) && function_d857e2fd8227f1bd(tablet.task.type, 1) == 1) {
                level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46[i] = level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46[level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46.size - 1];
                level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46[level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46.size - 1] = undefined;
                tablet tabletshow();
                var_18d89c513b75caf6[poiName]--;
                if (!var_18d89c513b75caf6[poiName]) {
                    var_18d89c513b75caf6[poiName] = undefined;
                    if (!var_18d89c513b75caf6.size) {
                        break;
                    }
                }
            }
        }
    }
    if (var_4c41f1d284a449f2 > 0) {
        level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46 = utility::array_randomize(level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46);
        for (i = level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46.size - 1; i >= 0; i--) {
            tablet = level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46[i];
            if (br_circle::function_d449927f9683e871(tablet.origin) && function_d857e2fd8227f1bd(tablet.task.type, 1) == 1) {
                level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46[i] = level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46[level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46.size - 1];
                level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46[level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46.size - 1] = undefined;
                tablet tabletshow();
                var_4c41f1d284a449f2--;
                if (var_4c41f1d284a449f2 == 0) {
                    break;
                }
            }
        }
    }
    var_391489a137dd38a1 = squared(getdvarint(@"hash_526a7311f94ae394", 0));
    if (var_391489a137dd38a1 > 0) {
        var_380e9cbe80c1f6ca = 0;
        var_65462a5df4649b45 = [];
        for (i = level.var_41f4bc9ee8c7c9c6.activetablets.size - 1; i >= 0; i--) {
            tablet = level.var_41f4bc9ee8c7c9c6.activetablets[i];
            if (tablet function_26073a27a7bc12e1(var_391489a137dd38a1, level.var_41f4bc9ee8c7c9c6.activetablets)) {
                level.var_41f4bc9ee8c7c9c6.activetablets[i] = level.var_41f4bc9ee8c7c9c6.activetablets[level.var_41f4bc9ee8c7c9c6.activetablets.size - 1];
                level.var_41f4bc9ee8c7c9c6.activetablets[level.var_41f4bc9ee8c7c9c6.activetablets.size - 1] = undefined;
                var_65462a5df4649b45[var_65462a5df4649b45.size] = tablet;
                var_380e9cbe80c1f6ca++;
            }
        }
        level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46 = utility::array_randomize(level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46);
        for (i = level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46.size - 1; i >= 0; i--) {
            if (var_380e9cbe80c1f6ca == 0) {
                break;
            }
            tablet = level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46[i];
            if (!tablet function_26073a27a7bc12e1(var_391489a137dd38a1, level.var_41f4bc9ee8c7c9c6.activetablets) && function_d857e2fd8227f1bd(tablet.task.type, 1) == 1) {
                tablet tabletshow();
                level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46[i] = level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46[level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46.size - 1];
                level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46[level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46.size - 1] = undefined;
                var_380e9cbe80c1f6ca--;
            }
        }
        level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46 = utility::array_combine(level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46, var_65462a5df4649b45);
    }
    level thread function_968df0af5e2d28ea();
    var_3cd9b1b9f24084fa = level.var_41f4bc9ee8c7c9c6.activetablets.size;
    var_89053505da6157d0 = level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46.size;
    level thread function_2651277c09935bde(160000);
    namespace_9cb8bb5897c3d5b2::branalytics_inittablets(var_f7561229eb9c2c64, var_3cd9b1b9f24084fa, var_89053505da6157d0, var_64d2f24df5d49616);
    if (namespace_b8ca654fc4c2dd79::isfeatureenabled("tabletReplace")) {
        level.var_41f4bc9ee8c7c9c6 thread tabletreplace();
    } else {
        level.var_41f4bc9ee8c7c9c6 thread delayedshowtablets();
    }
    level notify("contractmanager_inittablets_done");
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24e2
// Size: 0xa2
function function_531ddda805acc45a(var_4073dfe8bf38ba47, var_a682e84261a6b971) {
    if (!isdefined(var_a682e84261a6b971)) {
        var_a682e84261a6b971 = level.var_41f4bc9ee8c7c9c6.activetablets;
    }
    var_231903ff37014ed2 = sqrt(var_4073dfe8bf38ba47);
    var_a682e84261a6b971 = sortbydistancecullbyradius(var_a682e84261a6b971, self.origin, var_231903ff37014ed2);
    foreach (tablet in var_a682e84261a6b971) {
        if (tablet == self) {
            continue;
        }
        return tablet;
    }
    return undefined;
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x258c
// Size: 0x29
function function_26073a27a7bc12e1(var_4073dfe8bf38ba47, var_a682e84261a6b971) {
    var_793904681e7afa5a = function_531ddda805acc45a(var_4073dfe8bf38ba47, var_a682e84261a6b971);
    return isdefined(var_793904681e7afa5a);
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25bd
// Size: 0x5a
function setobjectivetypesomvarbit(type) {
    index = function_3d262d56274bd22e(type.ref);
    /#
        assertex(index < 32, "Quest type " + type.ref + " has index >= 32");
    #/
    setomnvarbit("ui_br_objective_types", index, 1);
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x261e
// Size: 0x106
function tabletreplace() {
    if (!isdefined(level.br_level)) {
        return;
    }
    flags::gameflagwait("prematch_done");
    level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46 = utility::array_randomize(level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46);
    var_fb4145cf6a25541e = 0;
    var_40fb495a4451d505 = level.tabletreplacefrequency;
    i = 0;
    while (i < level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46.size) {
        tablet = level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46[i];
        level waittill("quest_started");
        if (isdefined(level.tabletreplacefrequency) && level.tabletreplacefrequency != -1) {
            var_fb4145cf6a25541e++;
            if (var_fb4145cf6a25541e >= var_40fb495a4451d505) {
                tablet tabletshow();
                var_40fb495a4451d505 = var_40fb495a4451d505 + level.tabletreplacefrequency;
                i++;
            }
        } else {
            tablet tabletshow();
            i++;
        }
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x272b
// Size: 0xd3
function function_fe5d4d0a6a530b1e(var_1bbeb265ef74bc60, origin, angles, iselite) {
    foreach (data in level.var_41f4bc9ee8c7c9c6.var_7ba7458b5fc820f7) {
        ref = data.ref;
        if (ref == var_1bbeb265ef74bc60) {
            var_ee6ea77813e3c559 = spawnscriptable(data.var_a0ce8000d303764c, origin, angles);
            br_pickups::registerscriptableinstance(var_ee6ea77813e3c559);
            var_ee6ea77813e3c559 tabletinit(data, iselite);
            var_ee6ea77813e3c559 tabletshow();
            return var_ee6ea77813e3c559;
        }
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2805
// Size: 0x595
function delayedshowtablets() {
    if (!isdefined(level.br_level)) {
        return;
    }
    var_46599dab79a549 = level.br_level.br_circledelaytimes.size - 1 - getdvarint(@"hash_96878da693689ccd", 4);
    var_f5f66e7f9cb52c09 = getdvarfloat(@"hash_743253d28cd0d1f7", 0.3);
    flags::gameflagwait("prematch_done");
    var_495d2ed937e965e = [];
    for (i = 0; i < level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46.size; i++) {
        tablet = level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46[i];
        tablet.circleindex = namespace_553788426d0f4133::function_d5cf183ee258befb(tablet.origin);
        if (tablet.circleindex >= 0) {
            var_495d2ed937e965e[var_495d2ed937e965e.size] = tablet;
        }
    }
    level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46 = utility::array_randomize(var_495d2ed937e965e);
    while (1) {
        level waittill("br_circle_set");
        if (!level.br_circle.circleindex) {
            namespace_9cb8bb5897c3d5b2::branalytics_delayedshowtablets(0, var_f5f66e7f9cb52c09, var_495d2ed937e965e.size, 0);
            continue;
        }
        var_391489a137dd38a1 = squared(getdvarint(@"hash_526a7311f94ae394", 0));
        var_842f8fcc3ce6073 = [];
        var_91c73aa76ed988d0 = [];
        foreach (type in level.var_41f4bc9ee8c7c9c6.var_7ba7458b5fc820f7) {
            var_91c73aa76ed988d0[type.var_a0ce8000d303764c] = 0;
            if (function_d857e2fd8227f1bd(type) != 1) {
                var_842f8fcc3ce6073[type.var_a0ce8000d303764c] = 0;
            } else {
                var_842f8fcc3ce6073[type.var_a0ce8000d303764c] = type.var_a517ddce5d9509a8;
            }
        }
        var_495d2ed937e965e = [];
        var_4766325b60cdd3b6 = [];
        var_5fa48cf439502688 = [];
        for (i = 0; i < level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46.size; i++) {
            tablet = level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46[i];
            if (tablet.circleindex >= level.br_circle.circleindex) {
                if (!function_ebdf8f6e61c84882(tablet)) {
                    continue;
                }
                result = function_d857e2fd8227f1bd(tablet.task.type);
                if (result == -1) {
                    continue;
                } else if (result == 0) {
                    var_5fa48cf439502688[var_5fa48cf439502688.size] = tablet;
                    continue;
                }
                if (var_391489a137dd38a1 > 0) {
                    if (tablet function_26073a27a7bc12e1(var_391489a137dd38a1, level.var_41f4bc9ee8c7c9c6.activetablets)) {
                        var_5fa48cf439502688[var_5fa48cf439502688.size] = tablet;
                        continue;
                    }
                    jumpiffalse(tablet function_26073a27a7bc12e1(var_391489a137dd38a1, var_495d2ed937e965e)) LOC_00000371;
                    var_5fa48cf439502688[var_5fa48cf439502688.size] = tablet;
                } else if (var_842f8fcc3ce6073[tablet.type] > 0) {
                    var_4766325b60cdd3b6[var_4766325b60cdd3b6.size] = tablet;
                    var_842f8fcc3ce6073[tablet.type]--;
                } else {
                    var_495d2ed937e965e[var_495d2ed937e965e.size] = tablet;
                }
            }
        }
        var_8fa722572853ffb7 = int(ceil(var_495d2ed937e965e.size * var_f5f66e7f9cb52c09));
        var_cf6dc40ca9d1b393 = int(max(0, getdvarint(@"hash_6cd10c5d6e2a6220", 100) - level.var_41f4bc9ee8c7c9c6.activetablets.size) - getdvarint(@"hash_48094445b4d0cade", 20) * level.br_circle.circleindex);
        var_8fa722572853ffb7 = int(min(var_8fa722572853ffb7, var_cf6dc40ca9d1b393));
        var_c03697880b987159 = 0;
        foreach (tablet in var_4766325b60cdd3b6) {
            if (!isdefined(tablet)) {
                continue;
            }
            tablet tabletshow();
            var_91c73aa76ed988d0[tablet.type]++;
            var_c03697880b987159++;
        }
        foreach (tablet in var_495d2ed937e965e) {
            if (var_c03697880b987159 >= var_8fa722572853ffb7) {
                var_5fa48cf439502688[var_5fa48cf439502688.size] = tablet;
            } else if (var_91c73aa76ed988d0[tablet.type] >= level.var_41f4bc9ee8c7c9c6.var_8764d5e454e66ea3[tablet.type].var_17e740da24ef39aa && level.var_41f4bc9ee8c7c9c6.var_8764d5e454e66ea3[tablet.type].var_17e740da24ef39aa >= 0) {
                var_5fa48cf439502688[var_5fa48cf439502688.size] = tablet;
            } else {
                tablet tabletshow();
                var_91c73aa76ed988d0[tablet.type]++;
                var_c03697880b987159++;
            }
        }
        level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46 = var_5fa48cf439502688;
        namespace_9cb8bb5897c3d5b2::branalytics_delayedshowtablets(level.br_circle.circleindex, var_f5f66e7f9cb52c09, var_495d2ed937e965e.size, var_c03697880b987159);
        if (level.br_circle.circleindex >= var_46599dab79a549) {
            break;
        }
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2da1
// Size: 0x6a
function function_ebdf8f6e61c84882(tablet) {
    if (isdefined(tablet.task.type.funcs["validateContractNotInStronghold"])) {
        return tablet.task [[ tablet.task.type.funcs["validateContractNotInStronghold"] ]]();
    }
    return 1;
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e13
// Size: 0xe5
function function_1c1f9f1aa4944459() {
    self endon("game_ended");
    while (!isdefined(level.var_49a5d647639e781e) || level.var_49a5d647639e781e.size < 1) {
        wait(0.5);
    }
    foreach (tablet in level.var_41f4bc9ee8c7c9c6.activetablets) {
        if (isdefined(tablet.task.type.funcs["validateContractNotInStronghold"])) {
            tablet.task [[ tablet.task.type.funcs["validateContractNotInStronghold"] ]]();
        }
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2eff
// Size: 0xd0
function disablealltablets() {
    foreach (type in level.var_41f4bc9ee8c7c9c6.var_7ba7458b5fc820f7) {
        var_e0d1e3a2b6f5323a = getlootscriptablearray(type.var_a0ce8000d303764c);
        if (type.enabled) {
            foreach (tablet in var_e0d1e3a2b6f5323a) {
                tablet tablethide();
            }
        }
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fd6
// Size: 0x84
function function_2aa2583aa4c84697(tablet) {
    if (flags::gameflag("prematch_done")) {
        /#
            assertmsg("hideForverAfterPrematch Called after prematch");
        #/
        return;
    }
    if (istrue(tablet.var_f1d383d9d3b40188)) {
        return 0;
    } else {
        count = level.var_41f4bc9ee8c7c9c6.var_a140d7e8412b4051.size;
        level.var_41f4bc9ee8c7c9c6.var_a140d7e8412b4051[count] = tablet;
        tablet.var_f1d383d9d3b40188 = 1;
        return 1;
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3061
// Size: 0x1af
function function_968df0af5e2d28ea() {
    flags::gameflagwait("prematch_done");
    var_d1c571c1e3ed81ca = getdvarint(@"hash_88cc8ac36a3c2863", 32);
    var_b670b0d091f6de9a = throttle::function_af33edfaf05fc572("tablet", var_d1c571c1e3ed81ca);
    foreach (tablet in level.var_41f4bc9ee8c7c9c6.var_a140d7e8412b4051) {
        throttle::function_6f7b33660ae155ef(var_b670b0d091f6de9a);
        tablet thread tablethide();
        tablet.var_f1d383d9d3b40188 = undefined;
    }
    level.var_41f4bc9ee8c7c9c6.var_a140d7e8412b4051 = undefined;
    foreach (tablet in level.var_41f4bc9ee8c7c9c6.var_294684d6a0deef46) {
        throttle::function_6f7b33660ae155ef(var_b670b0d091f6de9a);
        tablet thread tablethide();
    }
    foreach (tablet in level.var_41f4bc9ee8c7c9c6.activetablets) {
        if (istrue(tablet.startdisabled)) {
            throttle::function_6f7b33660ae155ef(var_b670b0d091f6de9a);
            tablet.startdisabled = undefined;
            tablet thread tablethide();
        }
    }
    throttle::function_e70f01b44a09852c(var_b670b0d091f6de9a);
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3217
// Size: 0x8e
function tablethide(var_17076274943ed9bc) {
    self endon("show");
    if (istrue(var_17076274943ed9bc)) {
        self.var_9b0dd38e2592be58 = 1;
    }
    if (isdefined(level.var_41f4bc9ee8c7c9c6.var_b6012b6ffdb53601) && isdefined(level.var_41f4bc9ee8c7c9c6.var_b6012b6ffdb53601[self.type])) {
        level.var_41f4bc9ee8c7c9c6.var_b6012b6ffdb53601[self.type]++;
    }
    flags::gameflagwait("prematch_done");
    br_pickups::loothide(self);
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32ac
// Size: 0x8f
function function_6ac289b030b7cabe(obj) {
    if (isdefined(obj.tablettype) && !istrue(obj.var_9b0dd38e2592be58)) {
        var_65906228324b791b = 1;
        if (isdefined(obj.tablettype.funcs["onShowAgain"])) {
            var_65906228324b791b = obj.task [[ obj.tablettype.funcs["onShowAgain"] ]]();
        }
        if (var_65906228324b791b) {
            obj tabletshow(1);
        }
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3342
// Size: 0xf3
function tabletshow(var_132f5385c2f23a96) {
    /#
        assert(isdefined(self.init));
    #/
    if (isdefined(level.var_41f4bc9ee8c7c9c6.var_546b3948246e4aa3) && isdefined(level.var_41f4bc9ee8c7c9c6.var_546b3948246e4aa3[self.type])) {
        level.var_41f4bc9ee8c7c9c6.var_546b3948246e4aa3[self.type]++;
    }
    self notify("show");
    part = self.type;
    self setscriptablepartstate(part, "visible");
    if (!utility::array_contains(level.var_41f4bc9ee8c7c9c6.activetablets, self)) {
        level.var_41f4bc9ee8c7c9c6.activetablets[level.var_41f4bc9ee8c7c9c6.activetablets.size] = self;
    }
    if (!istrue(var_132f5385c2f23a96)) {
        namespace_9cb8bb5897c3d5b2::branalytics_spawntablet(self);
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x343c
// Size: 0xd0
function tabletinit(type, iselite) {
    if (isdefined(self.init)) {
        return;
    }
    self.init = 1;
    self.tablettype = type;
    tabletinit = type.funcs["onInit"];
    if (isdefined(tabletinit)) {
        task = spawnstruct();
        task.teams = [];
        task.type = type;
        task.iselite = iselite;
        self.task = task;
        task.tablet = self;
        self.init = task [[ tabletinit ]]();
        if (!self.init) {
            namespace_9cb8bb5897c3d5b2::branalytics_invalidtablet(self);
        }
    }
    return self.init;
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3514
// Size: 0xc7
function function_4d5dd20e109455f2(instance) {
    level.var_41f4bc9ee8c7c9c6.activetablets = utility::array_remove(level.var_41f4bc9ee8c7c9c6.activetablets, instance);
    instance notify("onTabletHidden");
    if (isdefined(instance) && isdefined(instance.tablettype) && isdefined(instance.tablettype.ref)) {
        var_7ba7458b5fc820f7 = function_2a81be592adacdaa(instance.tablettype.ref);
        if (isdefined(var_7ba7458b5fc820f7) && isdefined(var_7ba7458b5fc820f7.funcs["onTabletHidden"])) {
            [[ var_7ba7458b5fc820f7.funcs["onTabletHidden"] ]](instance);
        }
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35e2
// Size: 0x166
function function_8ad1b4ddc1fd852a(team, player) {
    namespace_9cb8bb5897c3d5b2::branalytics_missionstart(self, player);
    level.var_41f4bc9ee8c7c9c6.var_b6fae9c9655c73bf[team] = self;
    level.var_41f4bc9ee8c7c9c6.var_8e0f287a7b13da80[level.var_41f4bc9ee8c7c9c6.var_8e0f287a7b13da80.size] = self;
    if (!isdefined(self.teams)) {
        self.teams = [];
    }
    self.teams[self.teams.size] = team;
    self.var_d154ac2657c5f44 = player;
    if (isdefined(player) && isdefined(player.var_da28916e7827af7c)) {
        self.var_cdbb609588ac1fbb = player.var_da28916e7827af7c;
    }
    function_473ab9452660e60f(self.type.ref);
    players = teams::getteamdata(team, "players");
    foreach (var_736d8d9188ccbd45 in players) {
        var_736d8d9188ccbd45 challenges::oncontractstart(self.type.index, player);
        namespace_27c74152ccb91331::function_55b08d6d71b41402(var_736d8d9188ccbd45, "contract_start");
    }
    level notify("quest_started", team);
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x374f
// Size: 0x45c
function function_93663fe58d95f174(var_5e671fc71e72d5e8, results, var_752106078fe9b8fc, var_4048d341197bbe4b) {
    if (namespace_b8ca654fc4c2dd79::isbrgametypefuncdefined("contractEnd")) {
        namespace_b8ca654fc4c2dd79::function_d72afdccedfc9b07("contractEnd", self, self.teams[0], isdefined(var_5e671fc71e72d5e8) && var_5e671fc71e72d5e8 == self.teams[0]);
    }
    var_c893965b0b5cc806 = isdefined(var_5e671fc71e72d5e8);
    var_ef08909f6cbf35fc = 0;
    foreach (team in self.teams) {
        /#
            assertex(isdefined(level.var_41f4bc9ee8c7c9c6.var_b6fae9c9655c73bf[team]), "releaseTeamOnQuest called for unregistered team '" + team + "'");
        #/
        var_da1e4a8f39765732 = var_c893965b0b5cc806 && var_5e671fc71e72d5e8 == team;
        if (!istrue(self.iselite)) {
            uiobjectivehidefromteam(team);
            level.var_41f4bc9ee8c7c9c6.var_b6fae9c9655c73bf[team] = undefined;
        }
        if (var_da1e4a8f39765732) {
            players = teams::getteamdata(team, "players");
            var_ef08909f6cbf35fc = players.size;
            foreach (player in players) {
                if (!isdefined(player.brmissionscompleted)) {
                    player.brmissionscompleted = 0;
                }
                player.brmissionscompleted++;
                if (level.var_58adce74179ab9ef) {
                    player stats::incpersstat("objectivesCompleted", 1);
                    player namespace_a548bd428a566cf3::updatebrscoreboardstat("missionsCompleted", player stats::getpersstat("objectivesCompleted"));
                } else {
                    player namespace_a548bd428a566cf3::updatebrscoreboardstat("missionsCompleted", player.brmissionscompleted);
                }
                player namespace_aad14af462a74d08::oncontractend(self.type.index, 1, 1, self.var_cdbb609588ac1fbb);
            }
            if (!isdefined(level.var_41f4bc9ee8c7c9c6.var_ab841cfaca2f23ad[team])) {
                level.var_41f4bc9ee8c7c9c6.var_ab841cfaca2f23ad[team] = 0;
            }
            level.var_41f4bc9ee8c7c9c6.var_ab841cfaca2f23ad[team]++;
        } else {
            players = teams::getteamdata(team, "players");
            foreach (player in players) {
                player challenges::oncontractend(self.type.index, 0, 1);
            }
            if (isdefined(var_752106078fe9b8fc)) {
                var_da60ac7aae847d8 = teams::getteamdata(var_752106078fe9b8fc, "players");
                foreach (var_c92902ad553e3854 in var_da60ac7aae847d8) {
                    var_c92902ad553e3854 challenges::oncontractend(self.type.index, 1, 2);
                }
            }
        }
    }
    var_de7b4aaabe650264 = spawnstruct();
    var_de7b4aaabe650264.questcategory = self.category;
    if (var_c893965b0b5cc806) {
        var_de7b4aaabe650264.result = "success";
    } else {
        var_de7b4aaabe650264.result = "failure";
    }
    if (isdefined(self.tablet)) {
        var_de7b4aaabe650264.missionid = utility::string(self.tablet.index);
        var_de7b4aaabe650264.var_4048d341197bbe4b = var_4048d341197bbe4b;
        if (!isdefined(results)) {
            results = [];
        }
        namespace_9cb8bb5897c3d5b2::branalytics_missionend(var_de7b4aaabe650264, 1, results, var_ef08909f6cbf35fc);
    }
    if (!istrue(self.iselite)) {
        level.var_41f4bc9ee8c7c9c6.var_8e0f287a7b13da80 = utility::array_remove(level.var_41f4bc9ee8c7c9c6.var_8e0f287a7b13da80, self);
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bb2
// Size: 0x160
function function_bb413728bc5231d0(instance) {
    var_a0ce8000d303764c = instance.type;
    if (isdefined(level.var_41f4bc9ee8c7c9c6.var_8764d5e454e66ea3[var_a0ce8000d303764c].funcs["onTeamAssigned"])) {
        if (function_7094c7010c5e3827(self.team)) {
            /#
                assertmsg(self.team + " tried to pickup a contract but was already in teamsOnContract!");
            #/
            return;
        }
        giveteampoints(self.team, #"hash_67eb4b642067882a");
        instance tablethide();
        instance.task function_8ad1b4ddc1fd852a(self.team, self);
        instance.task.var_7ca287a82f54e4f6 = self;
        instance.task [[ level.var_41f4bc9ee8c7c9c6.var_8764d5e454e66ea3[var_a0ce8000d303764c].funcs["onTeamAssigned"] ]]();
        br_plunder::modify_plunder_itemsinworld("brloot_mission_tablet", -1);
        if (namespace_b8ca654fc4c2dd79::isbrgametypefuncdefined("contractStart")) {
            namespace_b8ca654fc4c2dd79::runbrgametypefunc("contractStart", instance.task, self.team);
        }
    } else {
        /#
            assertmsg("onTeamAssigned function has not been defined for " + instance.type.ref);
        #/
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d19
// Size: 0x48
function function_7094c7010c5e3827(team) {
    return isdefined(level.var_41f4bc9ee8c7c9c6) && isdefined(level.var_41f4bc9ee8c7c9c6.var_b6fae9c9655c73bf) && isdefined(level.var_41f4bc9ee8c7c9c6.var_b6fae9c9655c73bf[team]);
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d69
// Size: 0x48
function function_22239d4cff05d0a1(team) {
    if (isdefined(level.var_41f4bc9ee8c7c9c6) && isdefined(level.var_41f4bc9ee8c7c9c6.var_b6fae9c9655c73bf)) {
        return level.var_41f4bc9ee8c7c9c6.var_b6fae9c9655c73bf[team];
    }
    return undefined;
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3db9
// Size: 0x2f5
function dangercircletick(var_819edacdacb810e4, var_e86632d645c137d0, var_5d954f1724092f5a) {
    var_52d59c928eb97c81 = var_e86632d645c137d0 + var_5d954f1724092f5a;
    activetablets = [];
    if (!game_utility::function_fa7bfcc1d68b7b73()) {
        if (!isdefined(level.var_41f4bc9ee8c7c9c6) || !isdefined(level.var_41f4bc9ee8c7c9c6.activetablets)) {
            return;
        } else {
            activetablets = level.var_41f4bc9ee8c7c9c6.activetablets;
        }
        foreach (contract in level.var_41f4bc9ee8c7c9c6.var_7ba7458b5fc820f7) {
            if (isdefined(contract.funcs["circleTick"])) {
                foreach (task in level.var_41f4bc9ee8c7c9c6.var_8e0f287a7b13da80) {
                    if (contract.ref == task.type.ref) {
                        task [[ contract.funcs["circleTick"] ]](var_819edacdacb810e4, var_52d59c928eb97c81);
                    }
                }
            }
        }
    } else {
        if (!isdefined(level.questinfo)) {
            return;
        } else {
            activetablets = level.questinfo.activetablets;
        }
        foreach (quest in level.questinfo.quests) {
            if (isdefined(quest.funcs["circleTick"])) {
                foreach (instance in quest.instances) {
                    instance [[ quest.funcs["circleTick"] ]](var_819edacdacb810e4, var_52d59c928eb97c81);
                }
            }
        }
    }
    foreach (tablet in activetablets) {
        if (distance2dsquared(var_819edacdacb810e4, tablet.origin) > var_52d59c928eb97c81 * var_52d59c928eb97c81) {
            br_pickups::loothide(tablet);
            br_plunder::modify_plunder_itemsinworld("brloot_mission_tablet", -1);
        }
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40b5
// Size: 0x1fb
function function_1a1709943670772a() {
    if (!isdefined(level.var_41f4bc9ee8c7c9c6)) {
        return;
    }
    foreach (contract in level.var_41f4bc9ee8c7c9c6.var_7ba7458b5fc820f7) {
        if (isdefined(contract.funcs["circleTick"])) {
            foreach (task in level.var_41f4bc9ee8c7c9c6.var_8e0f287a7b13da80) {
                if (contract.ref == task.type.ref) {
                    task [[ contract.funcs["circleTick"] ]]();
                }
            }
        }
    }
    var_294684d6a0deef46 = [];
    foreach (tablet in level.var_41f4bc9ee8c7c9c6.activetablets) {
        if (!isdefined(tablet) || !isdefined(tablet.type)) {
            continue;
        }
        if (!br_pickups::isquesttablet(tablet.type)) {
            continue;
        }
        if (!isdefined(tablet.origin)) {
            logstring("br_contract_manager::dangerMultiCircleTick tablet does not have an origin! " + tablet.type);
        } else if (!namespace_553788426d0f4133::function_ee854fdd1e77efc4(tablet.origin)) {
            var_294684d6a0deef46[var_294684d6a0deef46.size] = tablet;
            br_pickups::loothide(tablet);
            br_plunder::modify_plunder_itemsinworld("brloot_mission_tablet", -1);
        }
    }
    return var_294684d6a0deef46;
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42b8
// Size: 0x12a
function onplayerkilled(attacker, victim) {
    if (!isdefined(level.var_41f4bc9ee8c7c9c6) || !isdefined(victim)) {
        return;
    }
    foreach (contract in level.var_41f4bc9ee8c7c9c6.var_7ba7458b5fc820f7) {
        if (isdefined(contract.funcs["onPlayerKilled"])) {
            foreach (task in level.var_41f4bc9ee8c7c9c6.var_8e0f287a7b13da80) {
                if (contract.ref == task.type.ref) {
                    task [[ contract.funcs["onPlayerKilled"] ]](attacker, victim);
                }
            }
        }
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43e9
// Size: 0x56
function onplayerconnect(player) {
    if (!isdefined(player.team) || !isdefined(level.var_41f4bc9ee8c7c9c6)) {
        return;
    }
    setquestrewardtier(player.team, getquestrewardtier(player.team));
    player function_ab19a58fc4be9ce2();
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4446
// Size: 0x120
function onplayerdisconnect(player) {
    if (!isdefined(level.var_41f4bc9ee8c7c9c6) || !isdefined(player)) {
        return;
    }
    foreach (contract in level.var_41f4bc9ee8c7c9c6.var_7ba7458b5fc820f7) {
        if (isdefined(contract.funcs["onPlayerDisconnect"])) {
            foreach (task in level.var_41f4bc9ee8c7c9c6.var_8e0f287a7b13da80) {
                if (contract.ref == task.type.ref) {
                    task [[ contract.funcs["onPlayerDisconnect"] ]](player);
                }
            }
        }
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x456d
// Size: 0x99
function onplayerentergulag() {
    if (!isdefined(level.var_41f4bc9ee8c7c9c6)) {
        return;
    }
    if (function_7094c7010c5e3827(self.team)) {
        task = function_22239d4cff05d0a1(self.team);
        if (isdefined(task.type.funcs["onEnterGulag"])) {
            task [[ task.type.funcs["onEnterGulag"] ]](self);
        }
        if (isdefined(task.var_972eddbdcf30619c)) {
            function_1e64ea5eb68d8119();
        }
    }
    onGlobalPlayerEnterGulag();
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x460d
// Size: 0x100
function onGlobalPlayerEnterGulag() {
    foreach (contract in level.var_41f4bc9ee8c7c9c6.var_7ba7458b5fc820f7) {
        if (isdefined(contract.funcs["onGlobalPlayerEnterGulag"])) {
            foreach (task in level.var_41f4bc9ee8c7c9c6.var_8e0f287a7b13da80) {
                if (contract.ref == task.type.ref) {
                    task [[ contract.funcs["onGlobalPlayerEnterGulag"] ]](self);
                }
            }
        }
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4714
// Size: 0xaa
function onplayerrespawn() {
    if (!isdefined(level.var_41f4bc9ee8c7c9c6)) {
        return;
    }
    self setclientomnvar("ui_player_spawned_notify", gettime());
    if (function_7094c7010c5e3827(self.team)) {
        task = function_22239d4cff05d0a1(self.team);
        if (isdefined(task.type.funcs["onPlayerRespawn"])) {
            task [[ task.type.funcs["onPlayerRespawn"] ]](self);
        }
        if (isdefined(task.var_972eddbdcf30619c)) {
            function_1e64ea5eb68d8119();
        }
    }
    onGlobalPlayerRespawn();
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47c5
// Size: 0x100
function onGlobalPlayerRespawn() {
    foreach (contract in level.var_41f4bc9ee8c7c9c6.var_7ba7458b5fc820f7) {
        if (isdefined(contract.funcs["onGlobalPlayerRespawn"])) {
            foreach (task in level.var_41f4bc9ee8c7c9c6.var_8e0f287a7b13da80) {
                if (contract.ref == task.type.ref) {
                    task [[ contract.funcs["onGlobalPlayerRespawn"] ]](self);
                }
            }
        }
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48cc
// Size: 0x52
function packsplashparambits(var_d4fc3b4e84704775, var_501265b5fe210821) {
    /#
        assert(var_d4fc3b4e84704775 >= 0 && var_d4fc3b4e84704775 < 64);
    #/
    /#
        assert(var_501265b5fe210821 >= 0 && var_501265b5fe210821 < 8192);
    #/
    value = var_d4fc3b4e84704775;
    value = value | var_501265b5fe210821 << 5;
    return value;
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4926
// Size: 0xc7
function function_878ebcc241b54505(var_f7b6cc6c062a7a43, var_d4fc3b4e84704775, var_501265b5fe210821, team, delay, var_42b1e877ab187c6) {
    if (isdefined(delay) && delay > 0) {
        wait(delay);
    }
    params = packsplashparambits(var_d4fc3b4e84704775, var_501265b5fe210821);
    players = teams::getteamdata(team, "players");
    foreach (player in players) {
        player thread hud_message::showsplash(var_f7b6cc6c062a7a43, params, undefined, undefined, undefined, var_42b1e877ab187c6);
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49f4
// Size: 0x58
function displayteamsplash(team, var_e9ae765e2c4fe816, params, var_42b1e877ab187c6) {
    /#
        assertex(isdefined(var_e9ae765e2c4fe816), "No splash_key defined for message being displayed to '" + team);
    #/
    players = teams::getteamdata(team, "players");
    displaysplashtoplayers(players, var_e9ae765e2c4fe816, params, var_42b1e877ab187c6);
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a53
// Size: 0xd4
function displaysplashtoplayers(players, var_e9ae765e2c4fe816, params, var_42b1e877ab187c6) {
    /#
        assertex(isdefined(var_e9ae765e2c4fe816), "No splash_key defined for message being displayed");
    #/
    foreach (player in players) {
        if (player namespace_a548bd428a566cf3::isplayeringulag()) {
            continue;
        }
        if (isbot(player) && namespace_a548bd428a566cf3::istutorial()) {
            continue;
        }
        if (isdefined(params)) {
            jumpiffalse(isdefined(params.excludedplayers)) LOC_000000b5;
            jumpiffalse(utility::array_contains(params.excludedplayers, player)) LOC_000000b5;
        } else {
        LOC_000000b5:
            displayplayersplash(player, var_e9ae765e2c4fe816, params, var_42b1e877ab187c6);
        }
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b2e
// Size: 0xb1
function displayplayersplash(player, var_e9ae765e2c4fe816, params, var_42b1e877ab187c6) {
    /#
        assertex(isdefined(var_e9ae765e2c4fe816), "No splash_key defined for message being displayed to '" + player.name);
    #/
    if (isdefined(params) && isdefined(params.packedbits)) {
        player thread hud_message::showsplash(var_e9ae765e2c4fe816, params.packedbits, undefined, undefined, undefined, var_42b1e877ab187c6);
    } else if (isdefined(params) && isdefined(params.intvar)) {
        player thread hud_message::showsplash(var_e9ae765e2c4fe816, params.intvar, undefined, undefined, undefined, var_42b1e877ab187c6);
    } else {
        player thread hud_message::showsplash(var_e9ae765e2c4fe816, undefined, undefined, undefined, undefined, var_42b1e877ab187c6);
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4be6
// Size: 0x6b
function displaysquadmessagetoplayer(var_939b8e8818bfd5ae, state, missionid) {
    player = var_939b8e8818bfd5ae getentitynumber();
    if (!isdefined(state)) {
        state = 0;
    }
    if (!isdefined(player)) {
        player = 0;
    }
    if (!isdefined(missionid)) {
        missionid = 0;
    }
    value = 0;
    value = missionid << 12 | player << 4 | state;
    self setclientomnvar("ui_br_expanded_obit_message", value);
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c58
// Size: 0x80
function displaysquadmessagetoteam(team, var_939b8e8818bfd5ae, state, missionid) {
    foreach (player in teams::getteamdata(team, "players")) {
        player displaysquadmessagetoplayer(var_939b8e8818bfd5ae, state, missionid);
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4cdf
// Size: 0x1e
function giveplayerpoints(player, ref) {
    player thread points::doScoreEvent(ref);
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d04
// Size: 0x6e
function giveteampoints(team, ref) {
    foreach (player in teams::getteamdata(team, "players")) {
        player thread points::doScoreEvent(ref);
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4d79
// Size: 0x10c
function giveteamplunderflat(team, amount) {
    var_8e3c5f90e4f80a58 = getdvarfloat(@"hash_7165dad703502609", 0.4);
    var_2cefa8f8a2ba6bfe = 0;
    foreach (player in teams::getteamdata(team, "players")) {
        if (isbot(player) && namespace_a548bd428a566cf3::istutorial()) {
            continue;
        }
        var_36773a58eb035bff = amount;
        if (!player::isreallyalive(player)) {
            var_36773a58eb035bff = int(amount * var_8e3c5f90e4f80a58);
        } else {
            var_36773a58eb035bff = int(var_36773a58eb035bff * function_fd4c76c90a1a0333(player));
        }
        player br_plunder::playerplunderpickup(var_36773a58eb035bff);
        level.br_plunder.plunder_awarded_by_missions_total = level.br_plunder.plunder_awarded_by_missions_total + var_36773a58eb035bff;
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4e8c
// Size: 0xde
function giveteamplunderdistributive(players, amount) {
    var_6eebcda719cd18a1 = int(amount / players.size);
    foreach (player in players) {
        if (isbot(player) && namespace_a548bd428a566cf3::istutorial()) {
            continue;
        }
        var_18417c862feb0b9e = int(var_6eebcda719cd18a1 * function_fd4c76c90a1a0333(player));
        player br_plunder::playerplunderpickup(var_18417c862feb0b9e);
        level.br_plunder.plunder_awarded_by_missions_total = level.br_plunder.plunder_awarded_by_missions_total + var_18417c862feb0b9e;
        namespace_9cb8bb5897c3d5b2::trackcashevent(player, "mission", var_18417c862feb0b9e);
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4f71
// Size: 0x315
function dropplunder(ammount, var_5b7bf3433d244cdf, var_76212928fed46301, var_41271de03a84a690) {
    if (!istrue(level.br_plunder_enabled)) {
        return;
    }
    var_5c2ad86c68eab7e9 = 0;
    var_168ea84f2950fe38 = 1;
    var_b590c41d9f9ce9f3 = 2;
    var_82c3fc1e774a5a35[0] = [0:"brloot_plunder_cash_uncommon_3", 1:level.br_plunder.quantityepic, 2:getdvarfloat(@"hash_53dd15287f7df644", 0.2)];
    var_82c3fc1e774a5a35[1] = [0:"brloot_plunder_cash_uncommon_2", 1:level.br_plunder.quantityrare, 2:getdvarfloat(@"hash_8fa17586ac872da9", 0.3)];
    var_82c3fc1e774a5a35[2] = [0:"brloot_plunder_cash_uncommon_1", 1:level.br_plunder.quantitycommon, 2:getdvarfloat(@"hash_30bf1dd438567db0", 0.5)];
    var_403adfafce8e54ae = 0;
    for (i = 0; i < var_82c3fc1e774a5a35.size; i++) {
        info = var_82c3fc1e774a5a35[i];
        var_403adfafce8e54ae = var_403adfafce8e54ae + info[var_b590c41d9f9ce9f3];
    }
    plundertotal = 0;
    for (i = 0; i < var_82c3fc1e774a5a35.size; i++) {
        info = var_82c3fc1e774a5a35[i];
        info[var_b590c41d9f9ce9f3] = info[var_b590c41d9f9ce9f3] / var_403adfafce8e54ae;
        plundertotal = plundertotal + info[var_168ea84f2950fe38] * info[var_b590c41d9f9ce9f3];
    }
    var_ce1bd3fdf0fcecf = ammount / plundertotal;
    var_f278eb5eb7f1e8be = ammount;
    var_c75b43b86b00cb9d = [];
    for (i = 0; i < var_82c3fc1e774a5a35.size; i++) {
        info = var_82c3fc1e774a5a35[i];
        var_c75b43b86b00cb9d[i] = int(var_ce1bd3fdf0fcecf * info[var_b590c41d9f9ce9f3]);
        var_f278eb5eb7f1e8be = var_f278eb5eb7f1e8be - var_c75b43b86b00cb9d[i] * info[var_168ea84f2950fe38];
    }
    if (var_f278eb5eb7f1e8be > 0) {
        for (i = 0; i < var_82c3fc1e774a5a35.size; i++) {
            info = var_82c3fc1e774a5a35[i];
            extra = int(var_f278eb5eb7f1e8be / info[var_168ea84f2950fe38]);
            var_c75b43b86b00cb9d[i] = var_c75b43b86b00cb9d[i] + extra;
            var_f278eb5eb7f1e8be = var_f278eb5eb7f1e8be - extra * info[var_168ea84f2950fe38];
        }
    }
    var_1473580ac7cfa299 = [];
    for (i = 0; i < var_c75b43b86b00cb9d.size; i++) {
        for (j = 0; j < var_c75b43b86b00cb9d[i]; j++) {
            var_1473580ac7cfa299[var_1473580ac7cfa299.size] = i;
        }
    }
    var_1473580ac7cfa299 = utility::array_randomize(var_1473580ac7cfa299);
    dropstruct = br_pickups::function_7b9f3966a7a42003();
    for (i = 0; i < var_1473580ac7cfa299.size; i++) {
        var_cb4fad49263e20c4 = br_pickups::getitemdroporiginandangles(dropstruct, var_5b7bf3433d244cdf, var_76212928fed46301, var_41271de03a84a690);
        br_pickups::spawnpickup(var_82c3fc1e774a5a35[var_1473580ac7cfa299[i]][var_5c2ad86c68eab7e9], var_cb4fad49263e20c4, var_82c3fc1e774a5a35[var_1473580ac7cfa299[i]][var_168ea84f2950fe38], 1);
    }
    level.br_plunder.plunder_awarded_by_missions_total = level.br_plunder.plunder_awarded_by_missions_total + ammount;
    level thread br_plunder::dropplundersounds(var_5b7bf3433d244cdf, var_1473580ac7cfa299.size);
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x528d
// Size: 0x56
function function_d282041688c032b5(category) {
    var_1bbeb265ef74bc60 = tablelookup("mp/brmissions.csv", 1, category, 18);
    var_fb4895dbd3f68bd7 = function_99b5f579a15f808d(var_1bbeb265ef74bc60);
    var_723b8f7cb71ceb11 = var_fb4895dbd3f68bd7.var_723b8f7cb71ceb11;
    if (!isdefined(var_723b8f7cb71ceb11)) {
        return 0;
    }
    return var_723b8f7cb71ceb11;
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52eb
// Size: 0x5f
function function_854eaac890bc7c17(category, column, var_272ceb39dc069746) {
    if (category == "intel") {
        category = "intel_upload";
    }
    data = tablelookup("mp/brmissions.csv", 1, category, column);
    if (!isdefined(data) || data == "") {
        return var_272ceb39dc069746;
    }
    return int(data);
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5352
// Size: 0x92
function function_d857e2fd8227f1bd(type, nocircle) {
    var_117411866e283ab3 = type.var_8d4889067c776936;
    var_6681dea3e8e5a399 = type.var_839e7395b90ff0ec;
    if (istrue(nocircle)) {
        if (var_117411866e283ab3 <= 0) {
            return 1;
        } else {
            return 0;
        }
    }
    if (level.br_circle.circleindex < var_117411866e283ab3) {
        return 0;
    }
    if (level.br_circle.circleindex > var_6681dea3e8e5a399 && var_6681dea3e8e5a399 != -1) {
        return -1;
    }
    return 1;
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53ec
// Size: 0x73
function function_d212a5e7a40d7c8d(var_5a4d4a174ea2eac, team, var_4e031b1c97a51f99) {
    var_fb4895dbd3f68bd7 = function_99b5f579a15f808d(var_5a4d4a174ea2eac);
    var_2f0b8c1f978fd835 = var_fb4895dbd3f68bd7.var_fa69571549e78551;
    if (isdefined(var_2f0b8c1f978fd835) && var_2f0b8c1f978fd835 != "") {
        return namespace_bd5b51637804dbad::givequestrewardgroup(var_2f0b8c1f978fd835, team, var_4e031b1c97a51f99.origin, var_4e031b1c97a51f99.angles);
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5466
// Size: 0x4b
function function_6ddd1eecbe562acf(var_2f0b8c1f978fd835, team, var_4e031b1c97a51f99) {
    if (isdefined(var_2f0b8c1f978fd835) && var_2f0b8c1f978fd835 != "") {
        return namespace_bd5b51637804dbad::givequestrewardgroup(var_2f0b8c1f978fd835, team, var_4e031b1c97a51f99.origin, var_4e031b1c97a51f99.angles);
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54b8
// Size: 0x2b
function function_3d262d56274bd22e(ref) {
    return level.var_41f4bc9ee8c7c9c6.var_766f9de01948c219[ref].index;
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54eb
// Size: 0x2b
function getquestindex(ref) {
    return level.var_41f4bc9ee8c7c9c6.var_8f51bbe0d6629b2c[ref].index;
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x551e
// Size: 0x2b
function getquesttableindex(ref) {
    index = int(tablelookup("mp/brmissions.csv", 1, ref, 0));
    return index;
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5551
// Size: 0x35
function uiobjectiveshow(ref) {
    /#
        assert(isplayer(self));
    #/
    index = getquestindex(ref);
    setquestindexomnvar(index);
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x558d
// Size: 0x6d
function uiobjectiveshowtoteam(ref, team) {
    foreach (player in teams::getteamdata(team, "players")) {
        player uiobjectiveshow(ref);
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5601
// Size: 0x1a
function uiobjectivehide() {
    /#
        assert(isplayer(self));
    #/
    setquestindexomnvar(0);
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5622
// Size: 0x64
function uiobjectivehidefromteam(team) {
    foreach (player in teams::getteamdata(team, "players")) {
        player uiobjectivehide();
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x568d
// Size: 0x78
function function_e2aa45e2c6b5dec1(value, value2) {
    foreach (player in teams::getteamdata(self.teams[0], "players")) {
        player uiobjectivesetparameter(value, value2);
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x570c
// Size: 0x52
function uiobjectivesetparameter(value, value2) {
    /#
        assert(isplayer(self));
    #/
    self setclientomnvar("ui_br_objective_param", value);
    if (isdefined(value2)) {
        /#
            assertex(isdefined(value), "First parameter should be defined before setting extra parameter.");
        #/
        self setclientomnvar("ui_br_objective_extraParam", value2);
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5765
// Size: 0x28
function uiobjectivesetlootid(value) {
    /#
        assert(isplayer(self));
    #/
    self setclientomnvar("ui_br_objective_loot_id", value);
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5794
// Size: 0xb6
function createquestobjicon(var_cb8e582431cf1641, state, var_38116998df9814d4) {
    self.objectiveiconid = namespace_6c8a837ec98fe0b8::requestobjectiveid(1);
    if (self.objectiveiconid != -1) {
        namespace_6c8a837ec98fe0b8::objective_add_objective(self.objectiveiconid, state, (0, 0, 0), var_cb8e582431cf1641);
        namespace_6c8a837ec98fe0b8::update_objective_setbackground(self.objectiveiconid, 4);
        objective_showtoplayersinmask(self.objectiveiconid);
        namespace_6c8a837ec98fe0b8::objective_set_play_intro(self.objectiveiconid, 1);
        if (isdefined(var_38116998df9814d4)) {
            movequestobjicon(var_38116998df9814d4);
        }
    } else {
        /#
            println(self.category + "vfx/iw8_br/gameplay/vfx_br_flare_dom");
        #/
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5851
// Size: 0x1d
function movequestobjicon(neworigin) {
    namespace_6c8a837ec98fe0b8::update_objective_position(self.objectiveiconid, neworigin);
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5875
// Size: 0x1c
function showquestobjicontoplayer(player) {
    objective_addclienttomask(self.objectiveiconid, player);
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5898
// Size: 0x13
function showquestobjicontoall(objid) {
    objective_addalltomask(objid);
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58b2
// Size: 0x1c
function hidequestobjiconfromplayer(player) {
    objective_removeclientfrommask(self.objectiveiconid, player);
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58d5
// Size: 0xd
function checkforactiveobjicon() {
    return isdefined(self.objectiveiconid);
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58ea
// Size: 0x23
function deletequestobjicon() {
    namespace_6c8a837ec98fe0b8::objective_playermask_hidefromall(self.objectiveiconid);
    namespace_6c8a837ec98fe0b8::returnobjectiveid(self.objectiveiconid);
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5914
// Size: 0x8d
function function_425f0abdafad5a76(var_161b92fd052449c7, teamname) {
    players = getteamdata(teamname, "players");
    foreach (player in players) {
        if (isreallyalive(player) && !player namespace_d3d40f75bb4e4c32::isplayeringulag()) {
            objective_addclienttomask(var_161b92fd052449c7, player);
        }
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59a8
// Size: 0xa8
function function_ead4d06481b4437e(var_161b92fd052449c7, teamname) {
    level endon("game_ended");
    wait(level.var_41f4bc9ee8c7c9c6.var_1108707ce662e831);
    players = getteamdata(teamname, "players");
    foreach (player in players) {
        if (isreallyalive(player) && !player namespace_d3d40f75bb4e4c32::isplayeringulag()) {
            objective_addclienttomask(var_161b92fd052449c7, player);
        }
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a57
// Size: 0x4c
function function_42a0806457ea8039(player) {
    if (!isdefined(player.team) || !isdefined(self.teams[0])) {
        return 0;
    }
    if (player.team == self.teams[0]) {
        return 1;
    }
    return 0;
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5aab
// Size: 0x1be
function utilflare_shootflare(spawn_origin, var_1da50610f94e1bfb, var_30a49dc77e377647, var_ff51d4e9d2fae932) {
    level endon("game_ended");
    var_3e146ed5e207e635 = trace::create_contents(0, 1, 0, 1, 0, 0, 0);
    new_position = trace::ray_trace(spawn_origin + (0, 0, 4000), spawn_origin, undefined, var_3e146ed5e207e635, undefined, 1)["position"];
    if (!isdefined(var_30a49dc77e377647)) {
        var_30a49dc77e377647 = 0;
    }
    if (istrue(var_30a49dc77e377647)) {
        flare = spawn("script_model", spawn_origin);
    } else {
        flare = spawn("script_model", new_position);
    }
    if (!isdefined(flare)) {
        return;
    }
    start_pos = flare.origin;
    flare.angles = vectortoangles((0, 0, 1));
    if (isdefined(var_ff51d4e9d2fae932)) {
        flare setmodel("equip_flare_ob");
    } else {
        flare setmodel("equip_flare_br");
    }
    wait(0.5);
    if (isdefined(var_1da50610f94e1bfb) && flare getscriptableparthasstate("launch", "start_" + var_1da50610f94e1bfb)) {
        goto LOC_00000147;
    }
    var_bf90cb052be008c9 = "start";
    flare setscriptablepartstate("launch", var_bf90cb052be008c9, 0);
    var_dd8972a1ae79c2e3 = isdefined(var_1da50610f94e1bfb) && flare getscriptableparthasstate("travel", "start_" + var_1da50610f94e1bfb) ? "start_" + var_1da50610f94e1bfb : "start";
    if (isdefined(var_1da50610f94e1bfb)) {
        if (var_1da50610f94e1bfb == "4th_july") {
            playsoundatpos(start_pos, "mus_iw9_flare_launch_stinger_july4");
        }
    }
    flare setscriptablepartstate("travel", var_dd8972a1ae79c2e3, 0);
    flare thread _utilflare_lerpflare(var_1da50610f94e1bfb);
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c70
// Size: 0x53
function _utilflare_lerpflare(var_1da50610f94e1bfb) {
    self endon("death");
    level endon("game_ended");
    movetime = 3.125;
    self moveto(self.origin + (0, 0, 2500), movetime);
    wait(movetime);
    _utilflare_flareexplode(var_1da50610f94e1bfb);
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5cca
// Size: 0x74
function _utilflare_flareexplode(var_1da50610f94e1bfb) {
    if (!isdefined(var_1da50610f94e1bfb)) {
        var_1da50610f94e1bfb = "<undefined>";
    }
    self setscriptablepartstate("travel", "off", 0);
    if (!_utilflare_isvalidflaretype(var_1da50610f94e1bfb)) {
        /#
            assertmsg("util flared called with invalid flare type string '" + var_1da50610f94e1bfb + "'");
        #/
        return;
    }
    var_44a98e57feb74898 = "start_" + var_1da50610f94e1bfb;
    self setscriptablepartstate("explode", var_44a98e57feb74898, 0);
    thread sfx_br_flare_phosphorus(var_1da50610f94e1bfb);
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d45
// Size: 0x76
function _utilflare_isvalidflaretype(var_1da50610f94e1bfb) {
    var_3ba45e0e07877b7 = 0;
    if (isdefined(var_1da50610f94e1bfb)) {
        switch (var_1da50610f94e1bfb) {
        case #"hash_81d3708cb9f6fbd":
        case #"hash_3d59be23329d4272":
        case #"hash_46a03ade8d786057":
        case #"hash_b06d15a59bd8ea50":
        case #"hash_c03ed6f6f4fe9dad":
        case #"hash_f4a9126c03d3385b":
            var_3ba45e0e07877b7 = 1;
            break;
        }
    }
    return var_3ba45e0e07877b7;
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5dc3
// Size: 0x159
function sfx_br_flare_phosphorus(var_1da50610f94e1bfb) {
    self endon("death");
    level endon("game_ended");
    if (isdefined(var_1da50610f94e1bfb) && self getscriptableparthasstate("phosphorus", "start_" + var_1da50610f94e1bfb)) {
        goto LOC_0000005d;
    }
    var_779efa68800909d1 = "start";
    if (isdefined(var_1da50610f94e1bfb) && self getscriptableparthasstate("phosphorus_loop", "start_" + var_1da50610f94e1bfb)) {
        goto LOC_00000089;
    }
    var_7593f454aad2cf18 = "start";
    if (isdefined(var_1da50610f94e1bfb) && self getscriptableparthasstate("phosphorus", "end_" + var_1da50610f94e1bfb)) {
        goto LOC_000000b5;
    }
    var_c18aafa4107a3316 = "end";
    self setscriptablepartstate("phosphorus", var_779efa68800909d1, 0);
    wait(0.3);
    self setscriptablepartstate("phosphorus_loop", var_7593f454aad2cf18, 0);
    switch (var_1da50610f94e1bfb) {
    case #"hash_46a03ade8d786057":
        wait(40);
        break;
    case #"hash_f4a9126c03d3385b":
        break;
    case #"hash_81d3708cb9f6fbd":
        wait(2);
        break;
    default:
        wait(12);
        break;
    }
    self setscriptablepartstate("phosphorus", var_c18aafa4107a3316, 0);
    wait(0.3);
    self setscriptablepartstate("phosphorus_loop", "off", 0);
    wait(5);
    self delete();
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5f23
// Size: 0x5f
function questpointgetradius(point) {
    radius = 0;
    if (point.spawnflags & 4) {
        radius = 256;
    } else if (point.spawnflags & 2) {
        radius = 128;
    } else if (point.spawnflags & 1) {
        radius = 168;
    }
    return radius;
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f8a
// Size: 0x20
function function_99b5f579a15f808d(var_5a4d4a174ea2eac) {
    return getscriptbundle(function_2ef675c13ca1c4af(%"hash_371be13214f11a56", var_5a4d4a174ea2eac));
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5fb2
// Size: 0x3c
function function_ea591c2a379e3424(category) {
    var_fb4895dbd3f68bd7 = function_99b5f579a15f808d(category);
    var_70fc6efcae372ede = var_fb4895dbd3f68bd7.var_70fc6efcae372ede;
    if (!isdefined(var_70fc6efcae372ede)) {
        return 0;
    }
    return var_70fc6efcae372ede;
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ff6
// Size: 0x49
function function_2a81be592adacdaa(var_1bbeb265ef74bc60) {
    if (!isdefined(level.var_41f4bc9ee8c7c9c6) || !isdefined(level.var_41f4bc9ee8c7c9c6.var_766f9de01948c219)) {
        return undefined;
    }
    return level.var_41f4bc9ee8c7c9c6.var_766f9de01948c219[var_1bbeb265ef74bc60];
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6047
// Size: 0x45
function function_5a15174d34f0670c(time, var_9707ff10d99d386) {
    if (!isdefined(var_9707ff10d99d386)) {
        var_9707ff10d99d386 = 0;
    }
    totaltime = time + var_9707ff10d99d386;
    self.missiontime = gettime() + totaltime * 1000;
    function_51d3a2b4cde79545();
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6093
// Size: 0x2b
function function_5606274c76b4a2df(time) {
    self.missiontime = self.missiontime + time * 1000;
    function_51d3a2b4cde79545();
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60c5
// Size: 0x71
function function_234c4428a084ca58(time) {
    if (self.missiontime - gettime() <= 1000) {
        return;
    }
    if (self.missiontime - gettime() - time * 1000 <= 0) {
        self.missiontime = gettime() + 1000;
    } else {
        self.missiontime = self.missiontime - time * 1000;
    }
    function_51d3a2b4cde79545();
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x613d
// Size: 0xb9
function function_51d3a2b4cde79545() {
    foreach (player in teams::getteamdata(self.teams[0], "players")) {
        player setclientomnvar("ui_br_objective_countdown_timer", self.missiontime);
    }
    var_7ba7458b5fc820f7 = function_2a81be592adacdaa(self.category);
    updatefunc = var_7ba7458b5fc820f7.funcs["onTimerUpdate"];
    if (isdefined(updatefunc)) {
        [[ updatefunc ]]();
    }
    thread function_b58cd7d548d363b4();
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61fd
// Size: 0xac
function function_b58cd7d548d363b4() {
    self notify("updatecontractTimer");
    self endon("game_ended");
    self endon("updatecontractTimer");
    self endon("task_ended");
    waittime = (self.missiontime - gettime()) / 1000;
    if (waittime < 0) {
        self.missiontime = gettime() + 1000;
        waittime = (self.missiontime - gettime()) / 1000;
    }
    wait(waittime);
    var_7ba7458b5fc820f7 = function_2a81be592adacdaa(self.category);
    var_73eedca966115848 = var_7ba7458b5fc820f7.funcs["onTimerExpired"];
    if (isdefined(var_73eedca966115848)) {
        [[ var_73eedca966115848 ]]();
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62b0
// Size: 0x14
function questrewardcirclepeek(team) {
    namespace_1a2fa2b6ae5d223c::function_647a8c40104e4866(team);
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62cb
// Size: 0xde
function function_496ed653faacacd2(var_30f14ef6cd430297) {
    var_20bf70e9bc435ed5 = self;
    if (isdefined(var_20bf70e9bc435ed5) && player::isreallyalive(var_20bf70e9bc435ed5) && !var_20bf70e9bc435ed5 namespace_a548bd428a566cf3::isplayeringulag()) {
        var_20bf70e9bc435ed5 br_pickups::forcegivesuper("super_supply_drop", 1, 0, 0, 0);
    } else {
        foreach (player in teams::getteamdata(var_30f14ef6cd430297, "players")) {
            if (!isdefined(player)) {
                continue;
            }
            if (isdefined(var_20bf70e9bc435ed5) && player == var_20bf70e9bc435ed5) {
                continue;
            }
            if (!player::isreallyalive(player)) {
                continue;
            }
            if (player namespace_a548bd428a566cf3::isplayeringulag()) {
                continue;
            }
            player br_pickups::forcegivesuper("super_supply_drop", 1, 0, 0, 0);
            break;
        }
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63b0
// Size: 0x2a
function function_9b6275085fbcb8f4(time) {
    if (namespace_b8ca654fc4c2dd79::isbrgametypefuncdefined("contractTimeModify")) {
        time = namespace_b8ca654fc4c2dd79::runbrgametypefunc("contractTimeModify", self, time);
    }
    return time;
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63e2
// Size: 0x2a
function function_f69c3e487b364f2f(time) {
    if (namespace_b8ca654fc4c2dd79::isbrgametypefuncdefined("contractTimeAddModify")) {
        time = namespace_b8ca654fc4c2dd79::runbrgametypefunc("contractTimeAddModify", self, time);
    }
    return time;
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6414
// Size: 0x36
function getquestrewardtier(team) {
    tier = level.var_41f4bc9ee8c7c9c6.tiers[team];
    if (!isdefined(tier)) {
        tier = 1;
    }
    return tier;
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6452
// Size: 0x41
function setquestrewardtier(team, tier) {
    if (isdefined(level.var_41f4bc9ee8c7c9c6)) {
        level.var_41f4bc9ee8c7c9c6.tiers[team] = tier;
    }
    setquestrewardtierteamomnvar(team, tier);
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x649a
// Size: 0x25
function addquestrewardtier(team, value) {
    setquestrewardtier(team, getquestrewardtier(team) + value);
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x64c6
// Size: 0x26
function addquestrewardtierframeend(team, value) {
    waittillframeend();
    setquestrewardtier(team, getquestrewardtier(team) + value);
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64f3
// Size: 0xd3
function function_473ab9452660e60f(ref) {
    index = getquesttableindex(ref);
    foreach (team in self.teams) {
        players = teams::getteamdata(team, "players");
        foreach (player in players) {
            player setquestindexomnvar(index);
        }
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65cd
// Size: 0x6d
function setquestindexteamomnvar(team, var_5e9b1036a4cae82f) {
    foreach (player in teams::getteamdata(team, "players")) {
        player setquestindexomnvar(var_5e9b1036a4cae82f);
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6641
// Size: 0x19
function setquestindexomnvar(var_5e9b1036a4cae82f) {
    self setclientomnvar("ui_br_objective_index", var_5e9b1036a4cae82f);
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6661
// Size: 0x6d
function setquestrewardtierteamomnvar(team, tier) {
    foreach (player in teams::getteamdata(team, "players")) {
        player setquestrewardtieromnvar(tier);
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66d5
// Size: 0x19
function setquestrewardtieromnvar(tier) {
    self setclientomnvar("ui_br_objective_reward_tier", tier);
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66f5
// Size: 0x70
function function_19582ba0dbcc0ab0(targetplayer, threatlevel) {
    if (isdefined(self.aq_targethudenabled) && self.aq_targethudenabled && isdefined(targetplayer)) {
        entitynumber = targetplayer getentitynumber();
    } else {
        entitynumber = -1;
    }
    entitynumber = entitynumber + 1;
    value = threatlevel << 8 | entitynumber;
    self setclientomnvar("ui_br_assassination_target", value);
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x676c
// Size: 0xff
function function_ab19a58fc4be9ce2() {
    player = self;
    level endon("game_ended");
    player endon("disconnect");
    if (!level.var_41f4bc9ee8c7c9c6.var_2bdaf97f6bfeab76 || isbot(player)) {
        return;
    }
    namespace_4b0406965e556711::gameflagwait("infil_animatic_complete");
    while (level.var_41f4bc9ee8c7c9c6.activetablets.size > 0) {
        var_db3ef040d8f07322 = notification = player waittill("calloutmarkerping_notifyhandled");
        if (notification != "custom_loot_card_update") {
            continue;
        }
        /#
            assert(isdefined(var_db3ef040d8f07322));
        #/
        if (!var_db3ef040d8f07322 || !istrue(player.var_45b8e84de48bb89f) || !isreallyalive(player)) {
            continue;
        }
        var_30a99625b9f5d98c = function_c1ac85f526f2b937(level.var_41f4bc9ee8c7c9c6.activetablets, player.origin, 400);
        if (isdefined(var_30a99625b9f5d98c)) {
            namespace_735f8af4d2aa34fb::function_4f6916c4e48cc55(var_30a99625b9f5d98c, player);
        }
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6872
// Size: 0x101
function private function_2651277c09935bde(mindistancesq) {
    level endon("game_ended");
    level waittill("infils_ready");
    foreach (phone in level.var_41f4bc9ee8c7c9c6.activetablets) {
        foreach (var_db1022d1312eb1eb in level.var_41f4bc9ee8c7c9c6.activetablets) {
            if (phone == var_db1022d1312eb1eb) {
                continue;
            }
            if (distancesquared(phone.origin, var_db1022d1312eb1eb.origin) <= mindistancesq) {
                /#
                    println("show");
                #/
            }
        }
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x697a
// Size: 0x38c
function function_6bdc6f56944dc3aa(player, oldteam, newteam) {
    foreach (task in level.var_41f4bc9ee8c7c9c6.var_8e0f287a7b13da80) {
        if (task.type.ref == "assassination") {
            if (task.targetplayer == player) {
                if (isdefined(task.type.funcs["onTargetAssimilated"])) {
                    task [[ task.type.funcs["onTargetAssimilated"] ]](player, oldteam, newteam);
                }
            } else if (task.targetplayer.team == oldteam) {
                if (isdefined(task.type.funcs["onTargetTeamTearDown"])) {
                    task [[ task.type.funcs["onTargetTeamTearDown"] ]](player, oldteam, newteam);
                }
            } else if (task.targetplayer.team == newteam) {
                if (isdefined(task.type.funcs["onTargetTeamAssimilated"])) {
                    task [[ task.type.funcs["onTargetTeamAssimilated"] ]](player, oldteam, newteam);
                }
            }
        }
    }
    if (isdefined(level.var_41f4bc9ee8c7c9c6.var_b6fae9c9655c73bf[oldteam])) {
        if (isdefined(level.var_41f4bc9ee8c7c9c6.var_b6fae9c9655c73bf[oldteam].type.funcs["onPlayerTearDown"])) {
            foreach (task in level.var_41f4bc9ee8c7c9c6.var_8e0f287a7b13da80) {
                if (level.var_41f4bc9ee8c7c9c6.var_b6fae9c9655c73bf[oldteam].teams[0] == task.teams[0]) {
                    task [[ task.type.funcs["onPlayerTearDown"] ]](player, oldteam, newteam);
                }
            }
        }
    }
    if (isdefined(level.var_41f4bc9ee8c7c9c6.var_b6fae9c9655c73bf[newteam])) {
        if (isdefined(level.var_41f4bc9ee8c7c9c6.var_b6fae9c9655c73bf[newteam].type.funcs["onPlayerAssimilated"])) {
            foreach (task in level.var_41f4bc9ee8c7c9c6.var_8e0f287a7b13da80) {
                if (level.var_41f4bc9ee8c7c9c6.var_b6fae9c9655c73bf[newteam].teams[0] == task.teams[0]) {
                    task thread function_17d78a198feb85d5(player, oldteam, newteam);
                }
            }
        }
    }
    namespace_1a2fa2b6ae5d223c::function_b8022b0e5e976f66(oldteam, newteam);
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d0d
// Size: 0x4b
function function_17d78a198feb85d5(player, oldteam, newteam) {
    level endon("game_ended");
    self endon("task_ended");
    waitframe();
    self [[ self.type.funcs["onPlayerAssimilated"] ]](player, oldteam, newteam);
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d5f
// Size: 0x9f
function function_8a25384bacdd7b79(var_ee6ea77813e3c559, var_a0ce8000d303764c) {
    if (!isdefined(level.var_41f4bc9ee8c7c9c6.var_7ba7458b5fc820f7)) {
        return;
    }
    foreach (data in level.var_41f4bc9ee8c7c9c6.var_7ba7458b5fc820f7) {
        if (data.var_a0ce8000d303764c == var_a0ce8000d303764c) {
            var_ee6ea77813e3c559 tabletinit(data);
            break;
        }
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6e05
// Size: 0x4e3
function function_870ec8b83fc533fd() {
    /#
        level endon("<unknown string>");
        while (1) {
            foreach (data in level.var_41f4bc9ee8c7c9c6.var_7ba7458b5fc820f7) {
                ref = data.ref;
                dvar = function_2ef675c13ca1c4af(@"hash_1fbd753c98c4b8b4", ref);
                if (getdvarint(dvar, 0)) {
                    setdvar(dvar, 0);
                    foreach (tablet in level.var_41f4bc9ee8c7c9c6.activetablets) {
                        if (tablet.type == data.var_a0ce8000d303764c) {
                            level.players[0] function_bb413728bc5231d0(tablet);
                            break;
                        }
                    }
                }
                dvar = @"hash_79cdeeba217bc3d8";
                if (getdvarint(dvar, 0)) {
                    setdvar(dvar, 0);
                    task = level.var_41f4bc9ee8c7c9c6.var_b6fae9c9655c73bf[level.players[0].team];
                    task function_93663fe58d95f174(task.teams[0]);
                }
                dvar = @"hash_99194b03dd977e5";
                if (getdvarint(dvar, 0)) {
                    setdvar(dvar, 0);
                    task = level.var_41f4bc9ee8c7c9c6.var_b6fae9c9655c73bf[level.players[0].team];
                    task function_93663fe58d95f174(undefined);
                }
                dvar = function_2ef675c13ca1c4af(@"hash_8f2895efe9ecd943", ref);
                if (getdvarint(dvar, 0)) {
                    setdvar(dvar, 0);
                    tablet = spawnscriptable(data.var_a0ce8000d303764c, level.players[0].origin);
                    br_pickups::registerscriptableinstance(tablet);
                    tablet tabletinit(data);
                    tablet tabletshow();
                }
                dvar = function_2ef675c13ca1c4af(@"hash_511c5d962c539aa8", ref);
                if (getdvarint(dvar, 0)) {
                    setdvar(dvar, 0);
                    foreach (teamdata in level.teamdata) {
                        if (istrue(teamdata["<unknown string>"].size > 0)) {
                            if (teamdata["<unknown string>"][0].team != level.players[0].team) {
                                function_22671614e8f79513(teamdata["<unknown string>"][0], ref);
                            }
                        }
                    }
                }
                dvar = function_2ef675c13ca1c4af(@"hash_7b9d7f89b65a3054", ref);
                if (getdvarint(dvar, 0)) {
                    setdvar(dvar, 0);
                    foreach (teamdata in level.teamdata) {
                        if (istrue(teamdata["<unknown string>"].size > 0)) {
                            if (isdefined(level.var_41f4bc9ee8c7c9c6) && isdefined(level.var_41f4bc9ee8c7c9c6.var_b6fae9c9655c73bf)) {
                                jumpiffalse(isdefined(level.var_41f4bc9ee8c7c9c6.var_b6fae9c9655c73bf[teamdata["<unknown string>"][0].team])) LOC_000003dc;
                            } else if (teamdata["<unknown string>"][0].team != level.players[0].team) {
                                function_22671614e8f79513(teamdata["<unknown string>"][0], ref);
                                break;
                            }
                        }
                    }
                }
            }
            var_6be853beafdcc6f2 = getdvarint(@"hash_86d0a6d671419333", 0);
            if (var_6be853beafdcc6f2 > 0) {
                setdvar(@"hash_86d0a6d671419333", 0);
                var_6be853beafdcc6f2 = min(var_6be853beafdcc6f2, level.var_41f4bc9ee8c7c9c6.activetablets.size);
                foreach (tablet in level.var_41f4bc9ee8c7c9c6.activetablets) {
                    tablet tablethide();
                    var_6be853beafdcc6f2 = var_6be853beafdcc6f2 - 1;
                    if (var_6be853beafdcc6f2 <= 0) {
                        break;
                    }
                }
            }
            wait(0.5);
        }
    #/
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x72ef
// Size: 0x171
function function_22671614e8f79513(player, var_1bbeb265ef74bc60) {
    /#
        if (!isdefined(player.team) || !isdefined(level.var_41f4bc9ee8c7c9c6.var_7ba7458b5fc820f7) || !isdefined(level.var_41f4bc9ee8c7c9c6.var_766f9de01948c219[var_1bbeb265ef74bc60])) {
            return;
        }
        var_ee6ea77813e3c559 = undefined;
        foreach (data in level.var_41f4bc9ee8c7c9c6.var_7ba7458b5fc820f7) {
            ref = data.ref;
            if (ref == var_1bbeb265ef74bc60) {
                var_ee6ea77813e3c559 = spawnscriptable(data.var_a0ce8000d303764c, (0, 0, 0), (0, 0, 0));
                br_pickups::registerscriptableinstance(var_ee6ea77813e3c559);
                var_ee6ea77813e3c559 tabletinit(data);
                break;
            }
        }
        if (!isdefined(var_ee6ea77813e3c559)) {
            return;
        }
        var_ee6ea77813e3c559.task function_8ad1b4ddc1fd852a(player.team, player);
        var_ee6ea77813e3c559.task [[ level.var_41f4bc9ee8c7c9c6.var_766f9de01948c219[var_1bbeb265ef74bc60].funcs["<unknown string>"] ]]();
    #/
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7467
// Size: 0x19
function filtercondition_isdead(player) {
    if (!isalive(player)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7488
// Size: 0x1a
function filtercondition_ingulag(player) {
    if (player namespace_a548bd428a566cf3::isplayerinorgoingtogulag()) {
        return 0;
    }
    return 1;
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74aa
// Size: 0x85
function function_eb0a92e43754af9f(team) {
    validplayers = [];
    foreach (player in teams::getteamdata(team, "players")) {
        if (!player namespace_a548bd428a566cf3::isplayerinorgoingtogulag() && player::isreallyalive(player)) {
            validplayers[validplayers.size] = player;
        }
    }
    return validplayers;
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7537
// Size: 0x295
function function_581c09aed5aa4ed7(team) {
    var_f67f078b2693e6c8 = getdvarint(@"hash_9d25d6735879edd5", 1);
    var_e2fcc37fccc34974 = getdvarint(@"hash_896b3c10c7a229fa", 1);
    var_ddb222c7faf5ab50 = getdvarint(@"hash_6d95fadfacaba24f", 60);
    if (!isdefined(level.teamdata[team]["currentContractCancels"])) {
        level.teamdata[team]["currentContractCancels"] = 0;
    }
    if (var_f67f078b2693e6c8 > 0) {
        if (level.teamdata[team]["currentContractCancels"] == var_f67f078b2693e6c8 - 1 && var_e2fcc37fccc34974) {
            level.teamdata[team]["cancelDelayTime"] = gettime() + var_ddb222c7faf5ab50 * 1000;
            level.teamdata[team]["currentContractCancels"]++;
            return 1;
        } else if (level.teamdata[team]["currentContractCancels"] >= var_f67f078b2693e6c8) {
            if (var_e2fcc37fccc34974) {
                if (gettime() < level.teamdata[team]["cancelDelayTime"]) {
                    self.var_972eddbdcf30619c = [];
                    var_e2b2bbd9e6539f11 = function_eb0a92e43754af9f(team);
                    foreach (player in var_e2b2bbd9e6539f11) {
                        n = (level.teamdata[team]["cancelDelayTime"] - gettime()) / 1000;
                        n = int(max(0, ceil(n)));
                        player hud_message::showerrormessage(level.var_41f4bc9ee8c7c9c6.var_5c6031bde94872a7, n);
                    }
                    return 0;
                }
                level.teamdata[team]["cancelDelayTime"] = gettime() + var_ddb222c7faf5ab50 * 1000;
                level.teamdata[team]["currentContractCancels"]++;
                return 1;
            } else {
                self.var_972eddbdcf30619c = [];
                var_e2b2bbd9e6539f11 = function_eb0a92e43754af9f(team);
                foreach (player in var_e2b2bbd9e6539f11) {
                    player hud_message::showerrormessage(level.var_41f4bc9ee8c7c9c6.var_8084cac3d31a6bee);
                }
                return 0;
            }
        }
    }
    level.teamdata[team]["currentContractCancels"]++;
    return 1;
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77d4
// Size: 0x48
function function_31378ee55a2fb527(team) {
    if (isdefined(self.type.funcs["onCancel"])) {
        self thread [[ self.type.funcs["onCancel"] ]](team);
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7823
// Size: 0x9d
function function_c142d6b260f19ee7(team) {
    if (!isdefined(self.var_972eddbdcf30619c)) {
        self.var_972eddbdcf30619c = [];
    }
    numplayers = 0;
    var_e2b2bbd9e6539f11 = function_eb0a92e43754af9f(team);
    foreach (player in var_e2b2bbd9e6539f11) {
        if (utility::array_contains(self.var_972eddbdcf30619c, player)) {
            numplayers++;
        }
    }
    return numplayers;
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78c8
// Size: 0xf0
function function_1d3d389050ddce74(team) {
    if (!isdefined(self.var_972eddbdcf30619c)) {
        self.var_972eddbdcf30619c = [];
    }
    var_e2b2bbd9e6539f11 = function_eb0a92e43754af9f(team);
    if (function_c142d6b260f19ee7(team) == var_e2b2bbd9e6539f11.size && function_581c09aed5aa4ed7(team)) {
        level thread overlord::function_9793a81bc3bc19e9("mission_cancel_complete", team, 1);
        function_31378ee55a2fb527(team);
        foreach (player in var_e2b2bbd9e6539f11) {
            player setclientomnvar("ui_br_contract_cancellation_state", 0);
        }
        level thread namespace_a548bd428a566cf3::brleaderdialogteam("mission_gen_fail", team, 1, 2);
        displayteamsplash(team, "br_contract_cancelled_" + self.type.ref);
        return 1;
    }
    return 0;
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79c0
// Size: 0x250
function function_db96249c7bfdec0b() {
    if (isdefined(self) && isdefined(self.team) && function_7094c7010c5e3827(self.team)) {
        contract = function_22239d4cff05d0a1(self.team);
        if (!isdefined(contract)) {
            /#
                assertmsg("contract team has a mission that returned true but the task is undefined!");
            #/
            return;
        }
        if (!isdefined(contract.type.funcs["onCancel"])) {
            /#
                assertmsg("contract team has a mission that does not have a cancel function!");
            #/
            return;
        }
        if (!isdefined(contract.var_972eddbdcf30619c)) {
            contract.var_972eddbdcf30619c = [];
        }
        if (utility::array_contains(contract.var_972eddbdcf30619c, self)) {
            contract function_1d3d389050ddce74(self.team);
            return;
        }
        contract.var_972eddbdcf30619c[contract.var_972eddbdcf30619c.size] = self;
        if (!contract function_1d3d389050ddce74(self.team)) {
            var_607da387f3617ed1 = function_eb0a92e43754af9f(self.team);
            overlord::function_d87d5deb069bf8e5("mission_cancel_request", utility::array_remove_array(var_607da387f3617ed1, contract.var_972eddbdcf30619c));
            var_7aa06be6f06bef26 = contract function_c142d6b260f19ee7(self.team);
            totalplayers = var_607da387f3617ed1.size;
            var_587ec5b2038407de = var_7aa06be6f06bef26 | totalplayers << 3;
            foreach (player in var_607da387f3617ed1) {
                player setclientomnvar("ui_br_contract_cancellation_state", var_587ec5b2038407de);
            }
            if (contract.var_972eddbdcf30619c.size > 0) {
                foreach (player in var_607da387f3617ed1) {
                    if (!utility::array_contains(contract.var_972eddbdcf30619c, player)) {
                        displayplayersplash(player, "br_" + contract.type.ref + "_quest_pending");
                    }
                }
            }
        }
        goto LOC_0000024e;
    }
LOC_0000024e:
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c17
// Size: 0x18a
function function_1e64ea5eb68d8119() {
    if (isdefined(self) && isdefined(self.team) && function_7094c7010c5e3827(self.team)) {
        contract = function_22239d4cff05d0a1(self.team);
        var_607da387f3617ed1 = function_eb0a92e43754af9f(self.team);
        if (!isdefined(contract)) {
            /#
                assertmsg("contract team has a mission that returned true but the task is undefined!");
            #/
            return;
        }
        if (!isdefined(contract.var_972eddbdcf30619c)) {
            return;
        }
        if (utility::array_contains(contract.var_972eddbdcf30619c, self)) {
            if (namespace_a548bd428a566cf3::isplayerinorgoingtogulag() || !player::isreallyalive(self)) {
                contract.var_972eddbdcf30619c = utility::array_remove(contract.var_972eddbdcf30619c, self);
            }
        }
        if (!contract function_1d3d389050ddce74(self.team)) {
            overlord::function_d87d5deb069bf8e5("mission_cancel_request", utility::array_remove_array(var_607da387f3617ed1, contract.var_972eddbdcf30619c));
            var_7aa06be6f06bef26 = contract function_c142d6b260f19ee7(self.team);
            totalplayers = var_607da387f3617ed1.size;
            var_587ec5b2038407de = var_7aa06be6f06bef26 | totalplayers << 3;
            foreach (player in var_607da387f3617ed1) {
                player setclientomnvar("ui_br_contract_cancellation_state", var_587ec5b2038407de);
            }
        }
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7da8
// Size: 0x38
function function_7871e27c25160f63(notification, value) {
    if (isdefined(notification)) {
        switch (notification) {
        case #"hash_9fd64c8b171158f":
            function_db96249c7bfdec0b();
            break;
        }
    }
}

// Namespace namespace_c133516bfc1d803c/namespace_1eb3c4e0e28fac71
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7de7
// Size: 0x45
function private function_60094dbeee6e39b0(var_54e0d8f4c18ce037) {
    isunderwater = 0;
    var_e7547f5ae5c57f3f = function_b81e710fd636efab(var_54e0d8f4c18ce037);
    if (isdefined(var_e7547f5ae5c57f3f)) {
        var_90d06784580a349c = var_54e0d8f4c18ce037[2] - var_e7547f5ae5c57f3f;
        isunderwater = var_90d06784580a349c < 0;
    }
    return isunderwater;
}

