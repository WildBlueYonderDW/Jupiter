#using scripts\common\callbacks.gsc;
#using script_16ea1b94f0f381b3;
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\scriptable.gsc;
#using script_7b2517368c79e5bc;
#using script_43971bbeefd98f05;
#using script_22f1701e151b9d12;
#using script_7153ce70c6d8ab9b;
#using script_3d3d1ef33cecfb62;
#using scripts\common\system.gsc;
#using script_19c169a442d5975a;
#using script_57bdd8aff28a4717;
#using script_345253ecdfc854;
#using script_58be75c518bf0d40;
#using script_3e2f8cc477d57433;
#using script_2583ee5680cf4736;
#using script_1f97a44d1761c919;
#using script_4e6e58ab5d96c2b0;
#using script_2590b7a7de3dfc79;
#using scripts\mp\mp_agent.gsc;
#using script_638d701d263ee1ed;
#using script_482376d10f69832c;

#namespace namespace_dc0140c0d20a7e8f;

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xb0e
// Size: 0x19
function private autoexec __init__system__() {
    system::register(#"hash_4d85fa813d39fbeb", undefined, undefined, &init);
}

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0xb2f
// Size: 0x374
function function_d99864f8b4032562(element, base_struct, var_5f8bb464b19d1f53, var_e59e6534e5fee18a, var_fc394e11bae17823, var_f5acf56d7a0a1404, var_7eb73407060d7cb6, var_42679ba6cdba9ee1, alignment) {
    var_7bd2768769ec27ca = base_struct;
    obelisk = spawnscriptable("jup_zm_activity_spatial_pedestal_top_scriptable", var_7bd2768769ec27ca.origin + (0, 0, 40), var_7bd2768769ec27ca.angles);
    obelisk setscriptablepartstate("fx", "off");
    obelisk setscriptablepartstate("body", "end");
    obelisk setscriptablepartstate("sfx", "off");
    obelisk.state = 0;
    obelisk.killcount = 0;
    obelisk.playerdeaths = 0;
    obelisk.element = element;
    obelisk.completed = 0;
    obelisk.unique_name = var_7bd2768769ec27ca.targetname;
    obelisk.players = undefined;
    obelisk.var_e00ac5b70d752deb = undefined;
    obelisk.var_fa9e06a77032916e = 0;
    obelisk.var_7bcdf31ed38b3a6f = 0;
    obelisk.var_fc394e11bae17823 = var_fc394e11bae17823;
    obelisk.var_f5acf56d7a0a1404 = var_f5acf56d7a0a1404;
    obelisk.season = 3;
    if (isdefined(var_7eb73407060d7cb6)) {
        assert(isfunction(var_7eb73407060d7cb6));
        obelisk.var_7eb73407060d7cb6 = var_7eb73407060d7cb6;
    }
    var_5f455dd46c21dbee = spawnscriptable("jup_zm_activity_spatial_pedestal_base_scriptable", var_7bd2768769ec27ca.origin, var_7bd2768769ec27ca.angles);
    var_5f455dd46c21dbee setscriptablepartstate("body", "end");
    var_5f455dd46c21dbee setscriptablepartstate("interact", "off");
    var_5f8bb464b19d1f53 = array_randomize(var_5f8bb464b19d1f53);
    obelisk.var_f63a6dcface15ba1 = namespace_26050772d3578b37::function_b7c2ddf5f84c1f61(array_slice(var_5f8bb464b19d1f53, 0, 3), obelisk.unique_name);
    obelisk.base = var_5f455dd46c21dbee;
    var_5f455dd46c21dbee.obelisk = obelisk;
    if (!isdefined(var_e59e6534e5fee18a)) {
        obelisk.var_e59e6534e5fee18a = spawnstruct();
        obelisk.var_e59e6534e5fee18a.origin = var_5f455dd46c21dbee.origin + (0, 0, 40);
        obelisk.var_e59e6534e5fee18a.angles = var_5f455dd46c21dbee.angles;
    } else {
        obelisk.var_e59e6534e5fee18a = var_e59e6534e5fee18a;
    }
    if (isdefined(var_42679ba6cdba9ee1)) {
        obelisk.var_42679ba6cdba9ee1 = var_42679ba6cdba9ee1;
    }
    if (isdefined(alignment)) {
        obelisk.alignment = alignment.origin;
        obelisk.var_713f07f1f3d7b5f7 = 1;
        obelisk.var_d78aa2c1e9b26780 = 1;
        obelisk.var_b2bbfacd2020b27e = 1;
        obelisk.season = 5;
    }
    var_9dc936b99badc73 = namespace_9866a3bced571d62::function_54b2c5a00ed87d60(obelisk.element);
    itembundle = getscriptbundle("itemspawnentry:" + "ob_jup_item_key_rift_gate_season3_" + var_9dc936b99badc73);
    lootid = namespace_2abc885019e1956::function_6d15e119c2779a93(itembundle);
    obelisk.var_18375599dbd96dd2 = lootid;
    level thread function_6abd388d691cb822(obelisk);
    return obelisk;
}

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xeac
// Size: 0x150
function init() {
    load_vfx();
    setdvarifuninitialized(@"hash_5a8ca99f137d0a44", 0);
    level flag_wait("ob_infil_completed");
    level.var_f607826b73b56d1c = [5, 3.75, 2.5];
    level.var_50f9183dc541bd7d["ice"] = "jup_spawner_zombie_mimic_hvt_spatial";
    level.var_50f9183dc541bd7d["toxic"] = "jup_spawner_zombie_mangler_hvt_spatial";
    if (istrue(level.var_90744c9d7cb71043)) {
        assertmsg("<dev string:x1c>");
    } else {
        level callback::add("on_ai_killed", &function_6e42339d9503b6b7);
        level.var_90744c9d7cb71043 = 1;
    }
    if (istrue(level.var_4bf569cf41d32514)) {
        assertmsg("<dev string:x5f>");
    } else {
        level callback::add("player_laststand", &function_35682bc06e3a7d3a);
        level.var_4bf569cf41d32514 = 1;
    }
    level.var_4ff113324b51bedd = [];
    level.var_db65e387ed5c1ef5 = getdvarfloat(@"hash_2676fd5c44bd192b", 1500);
    level.var_d6f622d1668f0b04 = getdvarfloat(@"hash_7f90626745758176", 1500);
    namespace_26050772d3578b37::function_a110e6203cd98cc9();
    namespace_26050772d3578b37::function_98264e8b6400bc85("complete", &function_4f321c7904a7562b);
    namespace_26050772d3578b37::function_f35c102a1c5f2a6d(&function_9b4b90d44dc1c350);
}

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1004
// Size: 0x50
function load_vfx() {
    level._effect["zombie_death"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_obelisk_soul_spawn.vfx");
    level._effect["zombie_soul"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_obelisk_soul_trail.vfx");
    level._effect["zombie_soul_impact"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_obelisk_soul_impact.vfx");
}

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x105c
// Size: 0x342
function function_5a3e2f3da27cb304() {
    obelisk = self;
    obelisk endon("spatial_puzzle_completed");
    obelisk endon("spatial_puzzle_reset");
    level endon("game_ended");
    var_e01fa63c6df4dad7 = obelisk.base.origin;
    if (isdefined(obelisk.alignment)) {
        var_e01fa63c6df4dad7 = obelisk.alignment;
    }
    if (obelisk.element == "air") {
        obelisk.var_ff38c4cac94dd8da = spawn("noent_volume_trigger_radius", var_e01fa63c6df4dad7, 0, 400, 400);
    } else if (obelisk.element == "land") {
        obelisk.var_ff38c4cac94dd8da = spawn("noent_volume_trigger_radius", var_e01fa63c6df4dad7, 0, 15, 100);
    } else {
        obelisk.var_ff38c4cac94dd8da = spawn("noent_volume_trigger_radius", var_e01fa63c6df4dad7, 0, 60, 100);
    }
    while (true) {
        if (istrue(obelisk.var_e00ac5b70d752deb)) {
            assert(isdefined(obelisk.players));
            function_1831b668cb43b6c9(obelisk, 1);
        } else if (!istrue(obelisk.var_713f07f1f3d7b5f7)) {
            obelisk.potential_players = [];
            players_in_range = getplayersinradius(obelisk.var_ff38c4cac94dd8da.origin, 60);
            foreach (player in players_in_range) {
                if (!isdefined(player)) {
                    continue;
                }
                obelisk.potential_players = function_fdc9d5557c53078e(obelisk.potential_players);
                if (obelisk.potential_players.size != 0 && array_contains_key(obelisk.potential_players, player)) {
                    continue;
                }
                var_2c687310d2f87d67 = player namespace_ca7b90256548aa40::getsquadmembers();
                foreach (var_c71c4fde114ce2f7 in var_2c687310d2f87d67) {
                    backpackindex = var_c71c4fde114ce2f7 namespace_feea61bc660e9e0f::function_4776284a348ebb6a(obelisk.var_18375599dbd96dd2);
                    if (backpackindex > -1 || getdvarint(@"hash_90ad914fd463e008", 0)) {
                        if (!istrue(obelisk.var_ff9089bede742254)) {
                            obelisk.base setscriptablepartstate("interact", "on");
                            obelisk.var_ff9089bede742254 = 1;
                        }
                        if (!istrue(obelisk.var_e1d182b0ee52d43e)) {
                            namespace_5775ad2badedbcaa::function_32645103f7520635(obelisk.base, &function_c0b488aa76c77316, undefined, undefined);
                            obelisk.var_e1d182b0ee52d43e = 1;
                            obelisk.base namespace_5775ad2badedbcaa::function_e6c63f16f2258b80(&function_a8e7372d3c4366e);
                        }
                        obelisk.potential_players = array_combine(obelisk.potential_players, var_2c687310d2f87d67);
                        break;
                    }
                }
            }
            if (isdefined(obelisk.players)) {
                function_1831b668cb43b6c9(obelisk, 0);
            }
        }
        waitframe();
    }
}

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x13a6
// Size: 0x1a0
function function_1831b668cb43b6c9(obelisk, should_notify) {
    obelisk.players = function_fdc9d5557c53078e(obelisk.players);
    foreach (player in obelisk.players) {
        if (player istouching(obelisk.var_ff38c4cac94dd8da)) {
            if (!istrue(player.var_338560ff664aecb3)) {
                if (!istrue(obelisk.var_d78aa2c1e9b26780)) {
                    if (isdefined(obelisk.var_42679ba6cdba9ee1) && !within_fov(player.origin, player.angles, obelisk.var_42679ba6cdba9ee1.origin, 0.766)) {
                        continue;
                    }
                }
                if (obelisk.element == "land" && player getstance() != "prone") {
                    continue;
                }
                player playrumbleonentity("heavy_3s");
                player earthquakeforplayer(0.5, 3, player.origin, 500);
                player.var_338560ff664aecb3 = 1;
                if (should_notify) {
                    obelisk notify("player_at_spatial_activation");
                }
            }
            if (!player function_8e888e08a6ab22d3("jup_ob_spatial_puzzle")) {
                player vision_utility::function_27a921508cb04613("jup_ob_spatial_puzzle");
            }
            continue;
        }
        if (player function_8e888e08a6ab22d3("jup_ob_spatial_puzzle")) {
            player vision_utility::function_9a92ae402e209ecc("jup_ob_spatial_puzzle");
        }
    }
}

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x154e
// Size: 0x23
function function_4f321c7904a7562b(var_96ae350eff4a278d, eattacker) {
    level notify(var_96ae350eff4a278d + "_initialized", "ee", eattacker);
}

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1579
// Size: 0x18
function function_9b4b90d44dc1c350(eattacker) {
    return !istrue(eattacker.var_fdbbf03042084910);
}

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x159a
// Size: 0x1a0
function function_6abd388d691cb822(obelisk) {
    level endon("game_ended");
    obelisk endon("spatial_puzzle_reset");
    obelisk thread function_5a3e2f3da27cb304();
    msg, eattacker = level waittill(obelisk.unique_name + "_initialized");
    if (msg == "ee") {
        /#
            iprintlnbold("<dev string:xa2>");
        #/
        obelisk.var_7bcdf31ed38b3a6f = 1;
        if (isdefined(obelisk.var_7eb73407060d7cb6)) {
            obelisk thread [[ obelisk.var_7eb73407060d7cb6 ]](obelisk.var_7bcdf31ed38b3a6f);
        }
        obelisk.var_e00ac5b70d752deb = 1;
        obelisk.players = eattacker namespace_ca7b90256548aa40::getsquadmembers();
        obelisk.players = function_fdc9d5557c53078e(obelisk.players);
        foreach (player in obelisk.players) {
            player.var_fdbbf03042084910 = 1;
        }
        thread timeout_watcher(obelisk, 300, 1);
        if (obelisk.season == 5) {
            thread namespace_446fc987a980892f::playevent("STY_S5_5_SPEEQ_Activate", obelisk.players);
        } else {
            thread namespace_446fc987a980892f::playevent("STY_S3_5_SPEEQ_Activate", obelisk.players);
        }
        obelisk waittill("player_at_spatial_activation");
        obelisk.base function_c0b488aa76c77316();
    }
}

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1742
// Size: 0x181
function function_a8e7372d3c4366e(var_5f455dd46c21dbee, player) {
    if (isdefined(var_5f455dd46c21dbee.obelisk.players)) {
        if (!array_contains(var_5f455dd46c21dbee.obelisk.players, player)) {
            return {#string:%JUP_OB_S1/SEAL_ALREADY_ACTIVE, #type:"HINT_NOBUTTON"};
        } else {
            return {#string:%JUP_OB_S3/CALL_THE_NEGOTIATOR, #type:"HINT_BUTTON"};
        }
        return;
    }
    if (!isdefined(var_5f455dd46c21dbee.obelisk.potential_players) || !array_contains(var_5f455dd46c21dbee.obelisk.potential_players, player)) {
        return {#string:%, #type:"HINT_NOBUTTON"};
    }
    if (isdefined(var_5f455dd46c21dbee.obelisk.var_42679ba6cdba9ee1) && !within_fov(player.origin, player.angles, var_5f455dd46c21dbee.obelisk.var_42679ba6cdba9ee1.origin, 0.766)) {
        return {#string:%, #type:"HINT_NOBUTTON"};
    }
    return {#string:%JUP_OB_S3/CALL_THE_NEGOTIATOR, #type:"HINT_BUTTON"};
}

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18cb
// Size: 0x56b
function function_c0b488aa76c77316(player) {
    obelisk = self.obelisk;
    if (!istrue(obelisk.var_713f07f1f3d7b5f7)) {
        if (isdefined(obelisk.players)) {
            foreach (var_ef17f7d006ab32f0 in obelisk.players) {
                backpackindex = var_ef17f7d006ab32f0 namespace_feea61bc660e9e0f::function_4776284a348ebb6a(obelisk.var_18375599dbd96dd2);
                if (backpackindex > -1 || getdvarint(@"hash_90ad914fd463e008", 0)) {
                    var_2c687310d2f87d67 = var_ef17f7d006ab32f0 namespace_ca7b90256548aa40::getsquadmembers();
                    obelisk.potential_players = var_2c687310d2f87d67;
                    if (!istrue(obelisk.var_ff9089bede742254)) {
                        obelisk.base setscriptablepartstate("interact", "on");
                        obelisk.var_ff9089bede742254 = 1;
                    }
                    if (!istrue(obelisk.var_e1d182b0ee52d43e)) {
                        namespace_5775ad2badedbcaa::function_32645103f7520635(obelisk.base, &function_c0b488aa76c77316, undefined, undefined);
                        obelisk.var_e1d182b0ee52d43e = 1;
                        obelisk.base namespace_5775ad2badedbcaa::function_e6c63f16f2258b80(&function_a8e7372d3c4366e);
                    }
                    break;
                }
            }
        }
        if (!istrue(obelisk.var_e00ac5b70d752deb) || obelisk.var_7bcdf31ed38b3a6f == 2 || obelisk.var_7bcdf31ed38b3a6f == 3) {
            obelisk.var_e00ac5b70d752deb = 0;
            obelisk.var_f63a6dcface15ba1 function_a63a2112c7b585e5();
            obelisk.players = player namespace_ca7b90256548aa40::getsquadmembers();
            obelisk.players = function_fdc9d5557c53078e(obelisk.players);
            foreach (player in obelisk.players) {
                player.var_fdbbf03042084910 = 1;
            }
            obelisk.var_152662fdff5f3b47 = [];
            foreach (var_ef17f7d006ab32f0 in obelisk.players) {
                if (var_ef17f7d006ab32f0 namespace_feea61bc660e9e0f::function_181a584e4a68d5d6(obelisk.var_18375599dbd96dd2)) {
                    obelisk.var_152662fdff5f3b47 = array_add(obelisk.var_152662fdff5f3b47, var_ef17f7d006ab32f0);
                }
            }
            obelisk.base setscriptablepartstate("interact", "off");
            if (obelisk.var_7bcdf31ed38b3a6f == 2) {
                return;
            }
        }
    }
    obelisk notify("spatial_obelisk_started");
    level thread namespace_b3f32c8cb80b8124::function_115bd456be8e071d(obelisk.players, "ob_contract_action_loop");
    if (!istrue(obelisk.var_713f07f1f3d7b5f7)) {
        if (obelisk.potential_players.size == 0) {
            obelisk.base setscriptablepartstate("interact", "off");
        }
    }
    obelisk.base setscriptablepartstate("body", "active_" + "electric");
    obelisk setscriptablepartstate("sfx", "activated");
    obelisk.var_68d7534b8c965ed9 = spawnscriptable("jup_zm_rift_pedestal_orb_scriptable", obelisk.var_e59e6534e5fee18a.origin, obelisk.var_e59e6534e5fee18a.angles);
    obelisk.var_7bcdf31ed38b3a6f = 2;
    if (isdefined(obelisk.var_7eb73407060d7cb6)) {
        obelisk thread [[ obelisk.var_7eb73407060d7cb6 ]](obelisk.var_7bcdf31ed38b3a6f);
    }
    /#
        iprintlnbold("<dev string:xe8>");
    #/
    if (istrue(obelisk.var_e00ac5b70d752deb)) {
        if (obelisk.season == 5) {
            thread namespace_446fc987a980892f::playevent("STY_S5_5_SPEEQ_Visualized", obelisk.players, 3);
        } else {
            thread namespace_446fc987a980892f::playevent("STY_S3_5_SPEEQ_Visualized", obelisk.players, 3);
        }
    } else if (!istrue(obelisk.var_e00ac5b70d752deb)) {
        thread namespace_446fc987a980892f::playevent("RFT_S3_5_RGUQ_Accept_Unattuned", obelisk.players, 3);
    }
    thread timeout_watcher(obelisk, 300, 2);
    var_587ea45bcb61087f = getdvarint(@"hash_86a96d7e221cbf1e", 30);
    var_8aebfae0dba02157 = getdvarfloat(@"hash_78d6cb32428c66fc", 0.3);
    obelisk.var_3144cc2ba8121676 = var_587ea45bcb61087f * (1 + var_8aebfae0dba02157 * (min(obelisk.players.size, 3) - 1));
    obelisk.var_6d298bb3b2c8bf0 = 0;
    level.var_4ff113324b51bedd = array_add(level.var_4ff113324b51bedd, obelisk);
    function_606642b946a01237(obelisk.unique_name, self.origin, 1500, 1);
    obelisk function_6094ec6f1a58a381(obelisk);
    obelisk thread function_658b421b37fd7662();
    wait 5;
    obelisk.var_21dcf44eef6e9fa2 = 1;
}

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e3e
// Size: 0x5f
function function_da098c7b6ef1993e(var_2eb33feb1aba5335) {
    var_44b27a8e32ebe296 = spawn_request(var_2eb33feb1aba5335, self.origin, level.var_d6f622d1668f0b04, 1, 1, 0);
    function_bc5315dc37ae4cf(var_44b27a8e32ebe296, &function_b07493f60764eed4, self);
    function_73147cdf5c28d10c(var_44b27a8e32ebe296, &function_64f4df7704af6dc2, self);
    function_e4a67fe4ddca7ed5(var_44b27a8e32ebe296, &function_5d1738a71dc36fa0, self);
}

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ea5
// Size: 0xde
function function_6094ec6f1a58a381(obelisk) {
    if (isdefined(obelisk.element)) {
        switch (obelisk.element) {
        case #"hash_ceb098150f024a39": 
            function_da098c7b6ef1993e("ai_flood_fill_encounter:ob_activity_spatial_obelisk_encounter_fire");
            break;
        case #"hash_6fe0d38b135245cc": 
            function_da098c7b6ef1993e("ai_flood_fill_encounter:ob_activity_spatial_obelisk_encounter");
            break;
        case #"hash_47276d6c2f4cfd60": 
            function_da098c7b6ef1993e("ai_flood_fill_encounter:ob_activity_spatial_obelisk_encounter");
            break;
        case #"hash_7651db02434beff0": 
            function_da098c7b6ef1993e("ai_flood_fill_encounter:ob_s5_activity_spatial_obelisk_encounter_water");
            break;
        case #"hash_c574c6c109cbbf7": 
            function_da098c7b6ef1993e("ai_flood_fill_encounter:ob_s5_activity_spatial_obelisk_encounter_air");
            break;
        case #"hash_aaf97f3a074169fc": 
            function_da098c7b6ef1993e("ai_flood_fill_encounter:ob_s5_activity_spatial_obelisk_encounter_land");
            break;
        default: 
            break;
        }
    }
}

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f8b
// Size: 0x1b0
function function_658b421b37fd7662() {
    level endon("game_ended");
    self endon("spatial_puzzle_reset");
    while (self.var_7bcdf31ed38b3a6f == 2) {
        var_f911aed45eb961a3 = getaiarrayinradius(self.origin, level.var_d6f622d1668f0b04);
        foreach (zombie in var_f911aed45eb961a3) {
            if (isdefined(zombie.var_66c1831357048c02)) {
                continue;
            }
            if (!isdefined(zombie.var_f89106513931332c)) {
                zombie.var_f89106513931332c = 0;
            }
            var_52d83275cdaec498 = distance2dsquared(zombie.origin, self.origin) < level.var_db65e387ed5c1ef5 * level.var_db65e387ed5c1ef5;
            if (var_52d83275cdaec498 == 1 && zombie.var_f89106513931332c == 0 && isalive(zombie)) {
                zombie function_3ab9164ef76940fd("obelisk_vfx", "electric");
                zombie.var_f89106513931332c = 1;
                continue;
            }
            if (var_52d83275cdaec498 == 0 && zombie.var_f89106513931332c == 1) {
                zombie function_3ab9164ef76940fd("obelisk_vfx", "off");
                zombie.var_f89106513931332c = 0;
            }
        }
        /#
            cylinder(self.origin, self.origin + (0, 0, 100), level.var_db65e387ed5c1ef5, (0, 0, 1), 0, 4);
        #/
        wait 0.2;
    }
}

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2143
// Size: 0x108
function function_35682bc06e3a7d3a(params) {
    foreach (obelisk in level.var_4ff113324b51bedd) {
        if (obelisk.var_7bcdf31ed38b3a6f == 2 && obelisk.var_6d298bb3b2c8bf0 == 0) {
            if (distance2dsquared(self.origin, obelisk.origin) < level.var_d6f622d1668f0b04 * level.var_d6f622d1668f0b04) {
                if (obelisk.playerdeaths < level.var_f607826b73b56d1c.size) {
                    obelisk.var_6d298bb3b2c8bf0 = level.var_f607826b73b56d1c[obelisk.playerdeaths];
                    obelisk.playerdeaths++;
                    wait obelisk.var_6d298bb3b2c8bf0;
                    obelisk.var_7e133de1e5867d3c = 0;
                }
            }
        }
    }
}

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2253
// Size: 0x107
function function_b07493f60764eed4(requestid, obelisk) {
    if (obelisk.var_7bcdf31ed38b3a6f != 2) {
        return 0;
    }
    squadsize = obelisk.players.size;
    var_b4a0bb985e832edf = obelisk.killcount / obelisk.var_3144cc2ba8121676;
    var_b15b75e63e5adfff = 1 / pow(squadsize, 1.5);
    waveinterval = var_b15b75e63e5adfff * (1 + 0.5 * (1 - var_b4a0bb985e832edf));
    /#
        iprintln("<dev string:x104>" + waveinterval + obelisk.var_6d298bb3b2c8bf0);
    #/
    /#
        iprintln("<dev string:x117>" + var_b4a0bb985e832edf + "<dev string:x129>" + obelisk.killcount + "<dev string:x130>" + obelisk.var_3144cc2ba8121676);
    #/
    wait waveinterval + obelisk.var_6d298bb3b2c8bf0;
    if (obelisk.var_7bcdf31ed38b3a6f == 2) {
        return 1;
    }
    return 0;
}

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2362
// Size: 0x2c
function function_64f4df7704af6dc2(requestid, obelisk) {
    if (obelisk.var_7bcdf31ed38b3a6f == 2) {
        return 0;
    }
    return 1;
}

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2396
// Size: 0x44
function function_5d1738a71dc36fa0(requestid, obelisk, zombie, ai_data) {
    zombie function_65cdab0fc78aba8f(obelisk.origin, level.var_db65e387ed5c1ef5 * 1.5);
}

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23e2
// Size: 0x1d1
function function_6e42339d9503b6b7(params) {
    self function_9322f3cb1cd4111a();
    function_3ab9164ef76940fd("obelisk_vfx", "off");
    foreach (obelisk in level.var_4ff113324b51bedd) {
        var_3e5bef4b6dd3e32a = obelisk.origin;
        if (distance2dsquared(self.origin, var_3e5bef4b6dd3e32a) < level.var_db65e387ed5c1ef5 * level.var_db65e387ed5c1ef5) {
            playfx(getfx("zombie_death"), self.origin);
            if (obelisk.killcount < obelisk.var_3144cc2ba8121676 && istrue(obelisk.var_21dcf44eef6e9fa2)) {
                obelisk.killcount++;
                function_2b6783f1c69393ff(self.origin + (0, 0, 40), obelisk.var_e59e6534e5fee18a.origin, 0.25, obelisk);
                if (obelisk.killcount == obelisk.var_3144cc2ba8121676 / 2) {
                    if (istrue(obelisk.var_e00ac5b70d752deb)) {
                        if (obelisk.season == 5) {
                            thread namespace_446fc987a980892f::playevent("STY_S5_5_SPEEQ_50_Charged", obelisk.players, 1);
                        } else {
                            thread namespace_446fc987a980892f::playevent("STY_S3_5_SPEEQ_50_Charged", obelisk.players, 1);
                        }
                        continue;
                    }
                    if (!istrue(obelisk.var_e00ac5b70d752deb)) {
                        thread namespace_446fc987a980892f::playevent("RFT_S3_5_RGUQ_50_Charged", obelisk.players);
                    }
                }
            }
        }
    }
}

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x25bb
// Size: 0x82
function function_2b6783f1c69393ff(spawn_origin, goal_position, var_6feb1183955c97a0, obelisk) {
    var_6feb1183955c97a0 = utility::default_to(var_6feb1183955c97a0, 0);
    trail = utility::spawn_model("tag_origin", spawn_origin);
    trail.goal_position = goal_position + (0, 0, 170);
    playfxontag(getfx("zombie_soul"), trail, "tag_origin");
    trail thread function_57961c5b765c270(var_6feb1183955c97a0, obelisk);
}

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2645
// Size: 0xbe
function function_57961c5b765c270(var_6feb1183955c97a0, obelisk) {
    level endon("game_ended");
    obelisk endon("spatial_puzzle_reset");
    self endon("death");
    self playsound("evt_ob_rr_obelisk_soul_spawn");
    self playloopsound("evt_ob_rr_obelisk_soul_lp");
    if (var_6feb1183955c97a0 > 0) {
        wait var_6feb1183955c97a0;
    }
    self moveto(self.goal_position, 0.8, 0.2);
    self waittill("movedone");
    playfx(getfx("zombie_soul_impact"), self.goal_position);
    killfxontag(getfx("zombie_soul"), self, "tag_origin");
    playsoundatpos(self.origin, "evt_ob_rr_obelisk_soul_impact");
    function_4234407e34a559f9(obelisk);
    self delete();
}

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x270b
// Size: 0x6c
function function_4234407e34a559f9(obelisk) {
    var_2da558e8c88e09c = min(obelisk.killcount / obelisk.var_3144cc2ba8121676, 1);
    if (var_2da558e8c88e09c >= 1) {
        obelisk_completed(obelisk);
        return;
    }
    if (var_2da558e8c88e09c * 4 >= obelisk.state + 1) {
        obelisk.state++;
    }
}

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x277f
// Size: 0x1e8
function function_8a3426e6c80d8b35(obelisk) {
    if (!istrue(obelisk.var_713f07f1f3d7b5f7)) {
        obelisk setscriptablepartstate("fx", obelisk.element + "_done");
    }
    obelisk.var_68d7534b8c965ed9 setscriptablepartstate("body", "done");
    obelisk.state = 0;
    obelisk.playerdeaths = 0;
    obelisk.killcount = 0;
    level.var_4ff113324b51bedd = array_remove(level.var_4ff113324b51bedd, obelisk);
    obelisk.base setscriptablepartstate("body", "end");
    obelisk setscriptablepartstate("sfx", "activated");
    function_c7311cb3f768f21e(obelisk.unique_name, 10);
    explosionzombies = getaiarrayinradius(obelisk.origin, level.var_db65e387ed5c1ef5, "team_two_hundred");
    foreach (zombie in explosionzombies) {
        if (isalive(zombie)) {
            zombie function_3ab9164ef76940fd("obelisk_vfx", "off");
            zombie kill();
            corpse = zombie getcorpseentity();
            if (isdefined(corpse)) {
                var_a33d2a2c3ffecb81 = corpse.origin - obelisk.origin + (0, 0, 60);
                var_83fd98f3ac829176 = max(500 - distance2d(corpse.origin, obelisk.origin), 0) / 4;
                corpse startragdollfromimpact("torso_upper", var_a33d2a2c3ffecb81 * var_83fd98f3ac829176);
            }
        }
    }
}

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x296f
// Size: 0x118
function obelisk_completed(obelisk) {
    obelisk.var_7bcdf31ed38b3a6f = 3;
    if (isdefined(obelisk.var_7eb73407060d7cb6)) {
        obelisk thread [[ obelisk.var_7eb73407060d7cb6 ]](obelisk.var_7bcdf31ed38b3a6f);
    }
    thread timeout_watcher(obelisk, 300, 3);
    function_8a3426e6c80d8b35(obelisk);
    level thread namespace_b3f32c8cb80b8124::function_115bd456be8e071d(obelisk.players, "ob_contract_win");
    obelisk.players = function_fdc9d5557c53078e(obelisk.players);
    foreach (player in obelisk.players) {
        player namespace_301533d2f1378cb9::function_b5b4f530f1c579aa(2000);
    }
    waitframe();
    if (!obelisk.var_e00ac5b70d752deb) {
        function_de57fa38335a4b65(obelisk);
        return;
    }
    obelisk.var_fa9e06a77032916e = 1;
    spawn_reward(obelisk);
}

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a8f
// Size: 0xd2
function function_8001cd21bb9c2165() {
    obelisk = self;
    while (true) {
        var_f27c366795e1174c = 0;
        obelisk.players = function_fdc9d5557c53078e(obelisk.players);
        foreach (player in obelisk.players) {
            if (distance2dsquared(player.origin, obelisk.origin) < 6250000) {
                var_f27c366795e1174c = 1;
                break;
            }
        }
        if (!var_f27c366795e1174c) {
            if (!istrue(obelisk.var_b2bbfacd2020b27e)) {
                obelisk notify("players_out_of_range");
            }
        }
        waitframe();
    }
}

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2b69
// Size: 0x87
function timeout_watcher(obelisk, time, var_d7bbb055fc183403) {
    level endon("game_ended");
    obelisk notify("timeout_watcher");
    obelisk endon("timeout_watcher");
    obelisk endon("spatial_puzzle_reset");
    if (obelisk.var_7bcdf31ed38b3a6f > 1) {
        obelisk childthread function_8001cd21bb9c2165();
    }
    function_cf308f348d516c65(time, obelisk, "players_out_of_range");
    if (var_d7bbb055fc183403 == obelisk.var_7bcdf31ed38b3a6f) {
        /#
            iprintlnbold("<dev string:x135>");
        #/
        thread function_d321e9c93f097199(obelisk);
    }
}

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2bf8
// Size: 0x2c9
function function_d321e9c93f097199(obelisk) {
    /#
        iprintlnbold("<dev string:x151>");
    #/
    assert(obelisk.var_7bcdf31ed38b3a6f != 0);
    if (obelisk.var_7bcdf31ed38b3a6f == 1) {
        obelisk.base setscriptablepartstate("interact", "off");
    } else if (obelisk.var_7bcdf31ed38b3a6f == 2) {
        function_8a3426e6c80d8b35(obelisk);
    } else if (obelisk.var_7bcdf31ed38b3a6f == 3) {
        if (isdefined(obelisk.var_db918367a232870d)) {
            obelisk.var_db918367a232870d callback::remove("on_zombie_ai_killed", &function_7c0957e4e8184593);
            obelisk.var_db918367a232870d kill();
            obelisk.var_db918367a232870d = undefined;
        }
        if (isdefined(obelisk.rewardrift)) {
            function_6099c5a2ad80e231(obelisk.rewardrift);
            obelisk.rewardrift = undefined;
        }
    }
    if (!istrue(obelisk.var_fa9e06a77032916e) || getdvarint(@"hash_5a8ca99f137d0a44", 0)) {
        obelisk.var_f63a6dcface15ba1 function_24e03be2bc20e57b();
    }
    obelisk notify("spatial_puzzle_reset");
    waitframe();
    obelisk.players = function_fdc9d5557c53078e(obelisk.players);
    foreach (player in obelisk.players) {
        player.var_338560ff664aecb3 = 0;
        if (player function_8e888e08a6ab22d3("jup_ob_spatial_puzzle")) {
            player vision_utility::function_9a92ae402e209ecc("jup_ob_spatial_puzzle");
        }
    }
    if (isdefined(obelisk.var_ff38c4cac94dd8da)) {
        obelisk.var_ff38c4cac94dd8da delete();
    }
    obelisk.var_7bcdf31ed38b3a6f = 0;
    if (isdefined(obelisk.var_7eb73407060d7cb6)) {
        obelisk thread [[ obelisk.var_7eb73407060d7cb6 ]](obelisk.var_7bcdf31ed38b3a6f);
    }
    obelisk.var_e00ac5b70d752deb = undefined;
    foreach (player in obelisk.players) {
        if (isdefined(player)) {
            player.var_fdbbf03042084910 = 0;
        }
    }
    obelisk.players = undefined;
    obelisk.potential_players = undefined;
    obelisk.var_152662fdff5f3b47 = undefined;
    obelisk.var_ff9089bede742254 = undefined;
    obelisk.var_21dcf44eef6e9fa2 = undefined;
    level thread function_6abd388d691cb822(obelisk);
}

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ec9
// Size: 0x1e8
function function_de57fa38335a4b65(obelisk) {
    var_4d360185b902dcca = obelisk.var_fc394e11bae17823;
    if (obelisk.element == "fire") {
        obelisk.var_ab4d4020e9dafd85 = 0;
        obelisk.var_a17335bae5bfec86 = 0;
        while (obelisk.var_ab4d4020e9dafd85 < 6) {
            if (obelisk.var_ab4d4020e9dafd85 == 5) {
                var_db918367a232870d = scripts\mp\mp_agent::spawnnewagentaitype("jup_spawner_zombie_hellhound_spatial", var_4d360185b902dcca.origin, undefined, "team_two_hundred");
                var_db918367a232870d namespace_4df2ab39b0e96ec7::function_4a4fab5fd0b06d7b("difficulty_hard");
                var_db918367a232870d callback::add("on_zombie_ai_killed", &on_dog_killed, obelisk);
                obelisk.var_ab4d4020e9dafd85++;
                continue;
            }
            var_db918367a232870d = scripts\mp\mp_agent::spawnnewagentaitype("jup_spawner_zombie_hellhound", var_4d360185b902dcca.origin, undefined, "team_two_hundred");
            var_db918367a232870d namespace_4df2ab39b0e96ec7::function_4a4fab5fd0b06d7b("difficulty_hard");
            var_db918367a232870d callback::add("on_zombie_ai_killed", &on_dog_killed, obelisk);
            obelisk.var_ab4d4020e9dafd85++;
            wait 1;
        }
        thread namespace_446fc987a980892f::playevent("RFT_S3_5_RGUQ_Negotiator_Spawn_Drawing", obelisk.players);
        return;
    }
    var_db918367a232870d = scripts\mp\mp_agent::spawnnewagentaitype(level.var_50f9183dc541bd7d[obelisk.element], var_4d360185b902dcca.origin, undefined, "team_two_hundred");
    if (obelisk.element == "ice") {
        thread namespace_446fc987a980892f::playevent("RFT_S3_5_RGUQ_Negotiator_Spawn_Laptop", obelisk.players);
    } else if (obelisk.element == "toxic") {
        thread namespace_446fc987a980892f::playevent("RFT_S3_5_RGUQ_Negotiator_Spawn_Journal", obelisk.players);
    }
    var_db918367a232870d namespace_4df2ab39b0e96ec7::function_4a4fab5fd0b06d7b("difficulty_hard");
    var_db918367a232870d callback::add("on_zombie_ai_killed", &function_7c0957e4e8184593, obelisk);
    obelisk.var_db918367a232870d = var_db918367a232870d;
}

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x30b9
// Size: 0x38
function on_dog_killed(params, obelisk) {
    obelisk.var_a17335bae5bfec86++;
    if (obelisk.var_a17335bae5bfec86 >= 6) {
        spawn_reward(obelisk);
    }
}

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x30f9
// Size: 0x26
function function_7c0957e4e8184593(params, obelisk) {
    obelisk.var_db918367a232870d = undefined;
    spawn_reward(obelisk);
}

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3127
// Size: 0x47
function function_510aa363d2583f0(params) {
    cache = spawnstruct();
    items = function_bc2f4857c90f5344("ob_jup_items_activity_spatial", 3);
    common_cache::function_fd95ef820bb2b980(items, cache);
    return cache.contents;
}

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3177
// Size: 0x74
function function_ae2ad994e01b239e(var_ed118e6dd8c246) {
    cache = spawnstruct();
    var_9dc936b99badc73 = namespace_9866a3bced571d62::function_54b2c5a00ed87d60(var_ed118e6dd8c246.obelisk.element);
    items = function_bc2f4857c90f5344("ob_jup_hydro_obelisk_reward_" + var_9dc936b99badc73 + "_attuned_s3", 1);
    common_cache::function_fd95ef820bb2b980(items, cache);
    return cache.contents;
}

// Namespace namespace_dc0140c0d20a7e8f / namespace_1ebb55028b525060
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x31f4
// Size: 0x398
function spawn_reward(obelisk) {
    level endon("game_ended");
    obelisk endon("spatial_puzzle_reset");
    obelisk notify("spatial_puzzle_completed");
    obelisk.players = function_fdc9d5557c53078e(obelisk.players);
    foreach (player in obelisk.players) {
        if (player function_8e888e08a6ab22d3("jup_ob_spatial_puzzle")) {
            player vision_utility::function_9a92ae402e209ecc("jup_ob_spatial_puzzle");
        }
    }
    a_players = obelisk.players;
    if (!isarray(a_players)) {
        return;
    }
    if (a_players.size == 0) {
        return;
    }
    /#
        iprintlnbold("<dev string:x16d>");
    #/
    reward_groups = [];
    foreach (player in a_players) {
        reward_groups[reward_groups.size] = [player];
    }
    if (istrue(obelisk.var_e00ac5b70d752deb)) {
        namespace_e8853d3344e33cf6::function_863be9e39e19fe2f(reward_groups, obelisk.var_f5acf56d7a0a1404, &function_510aa363d2583f0, undefined, obelisk);
        if (obelisk.season == 5) {
            thread namespace_446fc987a980892f::playevent("STY_S5_5_SPEEQ_Complete", obelisk.players, 3);
        } else {
            i = randomint(3);
            switch (i) {
            case 0: 
                thread namespace_446fc987a980892f::playconversation("STY_S3_5_SPEEQ_Complete_Alt01", obelisk.players, 5);
                break;
            case 1: 
                thread namespace_446fc987a980892f::playconversation("STY_S3_5_SPEEQ_Complete_Alt02", obelisk.players, 5);
                break;
            case 2: 
                thread namespace_446fc987a980892f::playconversation("STY_S3_5_SPEEQ_Complete_Alt03", obelisk.players, 5);
                break;
            }
        }
    } else {
        var_ed118e6dd8c246 = spawnstruct();
        var_ed118e6dd8c246.obelisk = obelisk;
        reward_groups = [];
        foreach (player in obelisk.var_152662fdff5f3b47) {
            if (isdefined(player)) {
                reward_groups[reward_groups.size] = [player];
            }
        }
        namespace_e8853d3344e33cf6::function_863be9e39e19fe2f(reward_groups, obelisk.var_f5acf56d7a0a1404, &function_ae2ad994e01b239e, var_ed118e6dd8c246, obelisk);
        if (obelisk.element == "fire") {
            thread namespace_446fc987a980892f::playevent("RFT_S3_5_RGUQ_Collect_Journal", obelisk.players, 3);
        } else if (obelisk.element == "ice") {
            thread namespace_446fc987a980892f::playevent("RFT_S3_5_RGUQ_Collect_Laptop", obelisk.players, 3);
        } else if (obelisk.element == "toxic") {
            thread namespace_446fc987a980892f::playevent("RFT_S3_5_RGUQ_Collect_Drawing", obelisk.players, 3);
        }
    }
    rewardrift = obelisk waittill("managed_reward_cache_spawn_done");
    obelisk.rewardrift = rewardrift;
    rewardrift waittill("managed_reward_cache_despawned");
    obelisk.rewardrift = undefined;
    if (obelisk.var_7bcdf31ed38b3a6f != 2) {
        thread function_d321e9c93f097199(obelisk);
    }
}

