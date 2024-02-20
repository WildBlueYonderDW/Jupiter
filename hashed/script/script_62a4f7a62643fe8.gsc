// mwiii decomp prototype
#using script_686729055b66c6e4;
#using script_4fa22bc28608e9bd;
#using scripts\common\ai.gsc;
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;
#using script_16ea1b94f0f381b3;
#using script_3f51a039c4a1a113;
#using scripts\common\utility.gsc;
#using script_22f1701e151b9d12;
#using script_7d3e27aa82b5d70b;
#using script_7b2517368c79e5bc;
#using script_7f5e7a3cb514aca5;
#using script_749ff6f56673a813;
#using script_1f97a44d1761c919;
#using scripts\engine\math.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using script_120270bd0a747a35;
#using script_41387eecc35b88bf;
#using script_220d0eb95a8fab7d;
#using script_a35012b9b75a996;
#using scripts\mp\flags.gsc;
#using scripts\mp\gamelogic.gsc;
#using script_70c2478fc6d8ef;
#using scripts\mp\hud_message.gsc;
#using script_3a13b8032b62a5e6;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\utility\game.gsc;
#using script_645acc6422636f9f;
#using script_4e6e58ab5d96c2b0;
#using script_638d701d263ee1ed;

#namespace namespace_24b61da48c7bdf06;

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xe10
// Size: 0x22
function private autoexec __init__system__() {
    system::register(#"hash_cb4ac9472fc0832", #"radiation", undefined, &function_13dad5c9339829d7);
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe39
// Size: 0x18
function private function_13dad5c9339829d7() {
    function_1e80b64e11b75717(4);
    utility::flag_set("aether_storm_post_main");
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe58
// Size: 0x84d
function init(var_736128b97152603e, var_dd5eef0caa7bd080, var_720da6b14f72fade) {
    if (!isdefined(var_736128b97152603e)) {
        var_736128b97152603e = 0;
    }
    if (!isdefined(var_dd5eef0caa7bd080)) {
        var_dd5eef0caa7bd080 = 0;
    }
    if (!isdefined(var_720da6b14f72fade)) {
        var_720da6b14f72fade = 0;
    }
    if (getdvarint(@"hash_3dd989b5ea61ba6f", 1) == 0) {
        return;
    }
    utility::flag_wait("aether_storm_post_main");
    level.var_24b61da48c7bdf06 = spawnstruct();
    level.var_24b61da48c7bdf06.var_aa29def91aae98bd = getdvarint(@"hash_5a70272ae9c13aba", randomint(4));
    level.var_24b61da48c7bdf06.difficulty = getdvar(@"hash_3570a73528bc6c57", "difficulty_hard");
    level.var_24b61da48c7bdf06.var_d10755c0244b1937 = namespace_f721fc7d0d2d0f47::function_300a6f8c556edf34(level.var_24b61da48c7bdf06.difficulty);
    level.var_24b61da48c7bdf06.var_ad737473be1f0d04 = getdvarfloat(@"hash_48fce4738c89906d", 2);
    level.var_24b61da48c7bdf06.var_ab66a0c49f0e8d6e = getdvarint(@"hash_ef880dd4dd945267", 1);
    level.var_24b61da48c7bdf06.var_9a2fdb386cc15ae0 = getdvarint(@"hash_b1cf46e1d5ae423", 40) / 100;
    level.var_24b61da48c7bdf06.var_31068981fd9277c6 = getdvarint(@"hash_dfb596b3039b2ce8", 4000);
    if (level.var_24b61da48c7bdf06.var_ad737473be1f0d04 == 0) {
        /#
            assertmsg("AetherStormERROR: The base zombie health multiplier can not be zero.");
        #/
        level.var_24b61da48c7bdf06.var_ad737473be1f0d04 = 2;
    }
    level.var_24b61da48c7bdf06.var_4d864f4a66650347 = getdvarfloat(@"hash_189419721d7412a4", 1);
    level.var_24b61da48c7bdf06.var_8f7178eaf2132d21 = getdvarfloat(@"hash_e726f57a75564644", 1);
    level.var_24b61da48c7bdf06.var_d533bb3ee26c1d99 = getdvarfloat(@"hash_73fb2647d04d8532", 150000);
    level.var_24b61da48c7bdf06.var_647bf2cbf73994dd = getdvarfloat(@"hash_fbacce5f528debee", 900);
    if (level.var_24b61da48c7bdf06.var_647bf2cbf73994dd == 0) {
        /#
            assertmsg("AetherStormERROR: The storm expansion duration can not be zero seconds.");
        #/
        level.var_24b61da48c7bdf06.var_647bf2cbf73994dd = 900;
    }
    level.var_24b61da48c7bdf06.var_719deb8a1a45bb85 = var_736128b97152603e;
    level.var_24b61da48c7bdf06.var_be0e041e85848a6d = getdvarfloat(@"hash_def8fa242a39f28a", 120);
    level.var_24b61da48c7bdf06.var_94ea725a035aef57 = getdvarint(@"hash_bd3120ea0bb6d372", 1);
    level.var_24b61da48c7bdf06.var_284270df3a99404 = getdvarint(@"hash_72ba177e9302417d", 4);
    level.var_24b61da48c7bdf06.var_ade6a22953100a52 = getdvarint(@"hash_9d525c99ff116a6b", 5);
    level.var_24b61da48c7bdf06.var_a89d2433198e329e = getdvarint(@"hash_29c4e4b3ff6b2159", 10);
    level.var_24b61da48c7bdf06.var_6da5e5e442abcb81 = getdvarint(@"hash_bff453f82de0cd52", 2000);
    level.var_24b61da48c7bdf06.var_913f0729da2f7bf7 = getdvarint(@"hash_22cc44afa6458c74", 200);
    level.var_24b61da48c7bdf06.var_4f4ea0d0cc4b762e = getdvarint(@"hash_9d54b97a0913a26f", 300);
    level.var_24b61da48c7bdf06.var_100cbabc49ba5983 = getdvarint(@"hash_ec4801d38e2142fa", 1);
    level.var_24b61da48c7bdf06.var_43db6b44cd164b89 = getdvarint(@"hash_10a9552d616d06e", 600);
    level.var_24b61da48c7bdf06.var_a60ecdae78f1434 = getdvarint(@"hash_337a9a81a2f1f609", 1000);
    level.var_24b61da48c7bdf06.var_5712319afa086cc8 = getdvarvector(@"hash_e87112fd790d0025", (0, 0, 0));
    level.var_24b61da48c7bdf06.var_4355367c3316786c = getdvarfloat(@"hash_ca78b25fa9294859", 2048);
    level.var_24b61da48c7bdf06.var_e36b6de5b64686ca = getdvar(@"hash_3129af15e2d3b58d", "Radiation_Ob");
    level.var_24b61da48c7bdf06.var_8b570b76600ddee9 = getdvarint(@"hash_c48e636b439fd3d4", 1);
    level.var_24b61da48c7bdf06.var_a75317daa0bd7ff9 = getdvarint(@"hash_53f5aebc06cfbfaa", 1);
    level.var_24b61da48c7bdf06.var_2115c7dedd7891f6 = getdvarfloat(@"hash_2f9db323da7ff325", 0);
    level.var_24b61da48c7bdf06.var_e2ed7cc207500cb3 = var_dd5eef0caa7bd080;
    level.ontimelimit = &function_6cbfd9827af0e6d1;
    utility::registersharedfunc("exfil", "setupHeliGasmasks", &function_698d99f6cc939e34);
    callback::add("aether_storm_expansion_started", &function_fad17bd00c6aaaa2);
    level.var_5a7da78693d33e77 = &function_d090388a81292bef;
    if (!function_ec3aea190c440d29(@"hash_e87112fd790d0025")) {
        var_6d2dfe648d8964fb = utility::getstructarray("aether_storm_spawnpoint", "targetname");
        if (var_6d2dfe648d8964fb.size == 1) {
            level.var_24b61da48c7bdf06.var_5712319afa086cc8 = var_6d2dfe648d8964fb[0].origin;
        } else if (var_6d2dfe648d8964fb.size > 1) {
            level.var_24b61da48c7bdf06.var_5712319afa086cc8 = var_6d2dfe648d8964fb[randomint(var_6d2dfe648d8964fb.size)].origin;
        }
    }
    /#
        assert(isdefined(level.var_24b61da48c7bdf06.var_5712319afa086cc8));
    #/
    if (!function_ec3aea190c440d29(@"hash_fde13d1db062b032")) {
        var_fc4ffac4746eb217 = namespace_f721fc7d0d2d0f47::function_4d8bb2d866771a10(level.var_24b61da48c7bdf06.var_5712319afa086cc8);
        switch (var_fc4ffac4746eb217) {
        case #"hash_7bb2cd766703d463":
            level.var_24b61da48c7bdf06.difficulty = "difficulty_normal";
            break;
        case #"hash_af83e47edfa8900a":
            level.var_24b61da48c7bdf06.difficulty = "difficulty_hard";
            break;
        }
    }
    /#
        assert(isdefined(level.var_24b61da48c7bdf06.difficulty));
    #/
    /#
        assert(level.var_24b61da48c7bdf06.difficulty != "difficulty_undefined" && level.var_24b61da48c7bdf06.difficulty != "difficulty_easy", "AetherStormERROR: Difficulty must be one greater than the starting region, so it can't be REGION_DIFFICULTY_LVL1 (or REGION_DIFFICULTY_UNDEFINED).");
    #/
    level.var_24b61da48c7bdf06.radiation = radiation::create(level.var_24b61da48c7bdf06.var_5712319afa086cc8, level.var_24b61da48c7bdf06.var_4355367c3316786c, level.var_24b61da48c7bdf06.var_8f7178eaf2132d21, level.var_24b61da48c7bdf06.var_e36b6de5b64686ca, 1);
    level.var_24b61da48c7bdf06.radiation radiation::function_70c6bcd3c644aad9(level.var_24b61da48c7bdf06.var_4d864f4a66650347);
    level.var_24b61da48c7bdf06.radiation callback::add("player_entered_radiation", &function_f4df458e2841cbf1);
    level.var_24b61da48c7bdf06.radiation callback::add("player_exited_radiation", &function_38b3b1600f7440b1);
    level callback::add("player_death", &function_d0f8b9fdea272469);
    if (!istrue(var_720da6b14f72fade)) {
        thread function_a143c9a0fa3af9f6();
        thread function_e427c341b9abc409();
    }
    thread function_d8626a2206442680();
    thread function_db25872d3eb4f360();
    thread function_abc28a284657371f();
    thread function_9a4d5d4bcc9e2c58();
    thread function_ebf8ee98cf7a3be0();
    /#
        thread function_3a2ca530d33dbb7c();
    #/
    utility::flag_set("aether_storm_initialized");
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ac
// Size: 0x23
function function_d090388a81292bef() {
    if (flag("aether_storm_expansion_started")) {
        return getdvarint(@"hash_5dcbbf68e812db67", 60);
    }
    return undefined;
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16d7
// Size: 0x39
function function_1f1b9a49f43638d0() {
    return isdefined(level.var_24b61da48c7bdf06.radiation) && istrue(level.var_24b61da48c7bdf06.radiation.var_55cf46878c46af61);
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1718
// Size: 0x225
function function_6cbfd9827af0e6d1() {
    /#
        assert(isdefined(level.var_24b61da48c7bdf06.radiation), "AetherStormERROR: Must call aether_storm::init() before calling aether_storm::start_expansion()");
    #/
    if (function_1f1b9a49f43638d0() || getdvarint(@"hash_d255f69a6c34b1ac", 0)) {
        return;
    }
    if (!isdefined(level.var_24b61da48c7bdf06.var_3f24322be8ae1969)) {
        if (!level.var_24b61da48c7bdf06.var_719deb8a1a45bb85) {
            /#
                assertmsg("AetherStormERROR: No final exfil was selected before the expansion was started.");
            #/
        }
        level.var_24b61da48c7bdf06.var_3f24322be8ae1969 = level.var_24b61da48c7bdf06.var_647bf2cbf73994dd;
    }
    level.var_24b61da48c7bdf06.radiation callback::add("radiation_transform_update", &function_dd834b585f86b332);
    level.var_24b61da48c7bdf06.radiation callback::add("radiation_transform_completed", &function_8f95016c770a1f8c);
    level.var_24b61da48c7bdf06.radiation radiation::transform(level.var_24b61da48c7bdf06.var_5712319afa086cc8, level.var_24b61da48c7bdf06.var_d533bb3ee26c1d99, level.var_24b61da48c7bdf06.var_3f24322be8ae1969);
    level.var_24b61da48c7bdf06.radiation radiation::function_70c6bcd3c644aad9(getdvarfloat(@"hash_8130f3d5e4e1de85", 2));
    level callback::callback("aether_storm_expansion_started");
    utility::flag_set("aether_storm_expansion_started");
    level thread namespace_27d2b4ad2e567ea4::function_68692864a2e0769b();
    var_edb92fd48d975084 = exfil::function_c51a46f4a60b13d5();
    foreach (exfil in var_edb92fd48d975084) {
        exfil.var_64f10a0f19df265f = "aether_storm_exfil_called_acknowledged";
    }
    setomnvar("ui_dmz_radiation_spreading", 1);
    function_68a343d65f254473(level.var_24b61da48c7bdf06.var_647bf2cbf73994dd);
    function_1e80b64e11b75717(9);
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1944
// Size: 0x24d
function function_dd834b585f86b332(params) {
    if (isdefined(level.var_24b61da48c7bdf06.var_9c3696a34625b700)) {
        return;
    }
    level.var_24b61da48c7bdf06.var_9c3696a34625b700 = 1;
    wait(0.5);
    level.var_24b61da48c7bdf06.var_9c3696a34625b700 = undefined;
    function_3d8d8ad244283e65(#"hash_5657a7ea701d8256");
    if (isdefined(level.var_5b7c4eafd38d35c) && isdefined(level.var_5b7c4eafd38d35c.var_915f0d3c3a61e38)) {
        i = 0;
        while (i < level.var_5b7c4eafd38d35c.var_915f0d3c3a61e38.size) {
            activity_starter = level.var_5b7c4eafd38d35c.var_915f0d3c3a61e38[i];
            if (isdefined(activity_starter) && radiation::function_1b4f63fa623de69a(activity_starter.origin)) {
                level.var_5b7c4eafd38d35c.var_915f0d3c3a61e38[i] namespace_848c7a35c6f1e038::function_9c2b62cf9d5bcdeb();
            }
            i = i + 1;
        }
        level.var_5b7c4eafd38d35c.var_915f0d3c3a61e38 = utility::array_removeundefined(level.var_5b7c4eafd38d35c.var_915f0d3c3a61e38);
    }
    if (!istrue(level.var_24b61da48c7bdf06.var_194513d38c471d7a) && !level.var_24b61da48c7bdf06.var_719deb8a1a45bb85) {
        var_edb92fd48d975084 = exfil::function_c51a46f4a60b13d5();
        var_def119cc47a8fb6f = 0;
        foreach (exfil in var_edb92fd48d975084) {
            if (exfil == level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638) {
                continue;
            }
            if (radiation::function_1b4f63fa623de69a(exfil.origin)) {
                exfil.var_589c572c53eeeeb6 = 1;
                if (!istrue(exfil.b_disabled)) {
                    exfil::function_4b5e408a00f4ddd8(exfil);
                }
            } else if (!istrue(exfil.b_disabled)) {
                var_def119cc47a8fb6f = var_def119cc47a8fb6f + 1;
            }
        }
        if (var_def119cc47a8fb6f == 0) {
            thread function_4b40a61f53dd9122();
        }
    }
    function_7f3923ed3d66f8ad();
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b98
// Size: 0xa2
function function_8f95016c770a1f8c(params) {
    if (level.var_24b61da48c7bdf06.var_719deb8a1a45bb85) {
        wait(5);
    }
    if (!istrue(level.var_24b61da48c7bdf06.var_194513d38c471d7a)) {
        wait(60);
        if (istrue(level.var_24b61da48c7bdf06.var_194513d38c471d7a)) {
            return;
        }
        /#
            assertmsg("AetherStormERROR: The storm's expansion completed before the final exfil has begun. Killing all players then ending the match.");
        #/
    } else {
        level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638 endon("exfil_complete_timeout");
        wait(180);
        /#
            assertmsg("AetherStormERROR: The storm's expansion completed before the final exfil has finished. Killing all players then ending the match.");
        #/
    }
    function_d52bfc09d86c8636();
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c41
// Size: 0x161
function private function_698d99f6cc939e34(heli) {
    if (function_1f1b9a49f43638d0()) {
        var_af1e35abee93b10d = getscriptbundle(%"hash_d03ed75a2d0089");
        if (!isdefined(var_af1e35abee93b10d)) {
            /#
                /#
                    assertmsg("exfil_vehicle_gone" + function_3c8848a3a11b2553(%"hash_d03ed75a2d0089") + "aether_storm_lightning_strike_finished");
                #/
            #/
            return;
        }
        var_bf80f581fdce86d2 = heli.angles + (0, 90, 0);
        var_840c2ee92c8f78fe = [0:(33, 40, -198), 1:(-15, 40, -198), 2:(-58, 40, -198), 3:(-105, 40, -198)];
        foreach (offset in var_840c2ee92c8f78fe) {
            var_9d5552b198734eb8 = heli.origin + rotatevector(offset, heli.angles);
            gasmask = namespace_49e179ec476603d6::function_c465d27f3f6066b4(var_af1e35abee93b10d, var_9d5552b198734eb8, var_bf80f581fdce86d2, 1, 1);
            thread function_6203604aa47a23a3(heli, gasmask);
        }
    }
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1da9
// Size: 0x2b
function private function_6203604aa47a23a3(heli, gasmask) {
    gasmask endon("death");
    heli waittill("exfil_vehicle_gone");
    namespace_49e179ec476603d6::function_c14962ea14e58968(gasmask);
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ddb
// Size: 0x18c
function function_7bf6e6f83216f4bd() {
    if (level.var_2562ea48235e90b5.size == 0) {
        /#
            assertmsg("AetherStormERROR: No exfils were placed in the map, so no final exfil can be selected.");
        #/
        return;
    }
    level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638 = sortbydistance(level.var_2562ea48235e90b5, level.var_24b61da48c7bdf06.var_5712319afa086cc8)[level.var_2562ea48235e90b5.size - 1];
    if (!isdefined(level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638)) {
        /#
            assertmsg("AetherStormERROR: No final exfil was selected, so we can't calculate how long the expansion should last.");
        #/
        level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638 = {origin:(50000, 50000, 0)};
    }
    namespace_4faa6169000e657c::function_86f446036c3c25a3("exfil_final_activity_ob_definition", "FINAL_EXFIL_OB");
    level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.var_8d00284a103c5803 = "FINAL_EXFIL_OB";
    var_daf1699581a0df56 = distance2d(level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.origin, level.var_24b61da48c7bdf06.var_5712319afa086cc8) - level.var_24b61da48c7bdf06.var_4355367c3316786c;
    level.var_24b61da48c7bdf06.var_3f24322be8ae1969 = level.var_24b61da48c7bdf06.var_d533bb3ee26c1d99 / var_daf1699581a0df56 / level.var_24b61da48c7bdf06.var_647bf2cbf73994dd;
    return level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638;
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f6f
// Size: 0x828
function function_4b40a61f53dd9122() {
    if (!isdefined(level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638)) {
        /#
            assertmsg("AetherStormERROR: No final exfil was selected but all other exfils have been consumed. Ending the game once the timer hits zero.");
        #/
        delay = (level.var_24b61da48c7bdf06.var_3d51670b31c0dbc0 - gettime()) / 1000;
        if (delay > 0) {
            wait(delay);
        }
        function_d52bfc09d86c8636();
        return;
    }
    if (istrue(level.var_24b61da48c7bdf06.var_194513d38c471d7a)) {
        return;
    }
    level.var_24b61da48c7bdf06.var_194513d38c471d7a = 1;
    level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.var_d182b8d3f3aaa93b = spawnscriptable("cp_mp_exfil_site_entityless", level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.origin, level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.angles);
    level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.var_d182b8d3f3aaa93b setscriptablepartstate("cp_mp_exfil_site", "standby");
    level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.var_d182b8d3f3aaa93b.n_obj_id = namespace_6c8a837ec98fe0b8::requestobjectiveid(1);
    namespace_6c8a837ec98fe0b8::objective_add_objective(level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.var_d182b8d3f3aaa93b.n_obj_id, "invisible", level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.var_d182b8d3f3aaa93b.origin, "ui_map_icon_cp_mp_exfil", "icon_regular");
    objective_state(level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.var_d182b8d3f3aaa93b.n_obj_id, "current");
    objective_setlabel(level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.var_d182b8d3f3aaa93b.n_obj_id, "JUP_OB/FINAL_EXFIL");
    objective_setplayintro(level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.var_d182b8d3f3aaa93b.n_obj_id, 1);
    foreach (player in level.players) {
        if (isdefined(player) && !player function_aa1f91da154a3d90()) {
            objective_addclienttomask(level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.var_d182b8d3f3aaa93b.n_obj_id, player);
        }
    }
    objective_showtoplayersinmask(level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.var_d182b8d3f3aaa93b.n_obj_id);
    thread overlord::function_d87d5deb069bf8e5("aether_storm_final_exfil_revealed", level.players, 0, 1);
    var_49a313cc785a2410 = (level.var_24b61da48c7bdf06.var_3d51670b31c0dbc0 - gettime()) / 1000;
    var_49a313cc785a2410 = var_49a313cc785a2410 - level.var_24b61da48c7bdf06.var_be0e041e85848a6d;
    var_49a313cc785a2410 = var_49a313cc785a2410 - getdvarint(@"hash_eb873c5e99093d11", 50);
    var_49a313cc785a2410 = var_49a313cc785a2410 - getdvarint(@"hash_346baccb7a031727", 7);
    if (var_49a313cc785a2410 > 0) {
        /#
            level.var_24b61da48c7bdf06.var_e42fed415ee7a4eb = 1;
        #/
        level utility::waittill_notify_or_timeout("aether_storm_force_start_final_exfil", var_49a313cc785a2410);
        /#
            level.var_24b61da48c7bdf06.var_e42fed415ee7a4eb = 0;
        #/
    }
    level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.b_disabled = undefined;
    level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.var_1265336893f89f10 = 1;
    level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.var_81fff6332116316f = level.var_24b61da48c7bdf06.var_be0e041e85848a6d;
    level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.var_74144fabf9631d37 = min(80, level.var_24b61da48c7bdf06.var_be0e041e85848a6d);
    level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.var_9dae2c1a677985a8 = 1;
    level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.var_1c13f1737dccef9a = 1;
    level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.var_bab7d5b1eb545062 = 1;
    level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.var_bff042c325c612a0 = 1;
    level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.var_4cdfc3869e61bd9b = "dmzwhite";
    level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.var_64f10a0f19df265f = "aether_storm_exfil_called_acknowledged";
    level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.var_ba71f0b6b1b651f5 = "aether_storm_final_exfil_leaving";
    level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.var_651b83653ae1f156 = &function_2deaea362f60497a;
    exfil::function_1590a66b9f6c2c3b(level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638, level.var_24b61da48c7bdf06.var_be0e041e85848a6d);
    namespace_4faa6169000e657c::function_8b5b2a3392fc7e2a("PlayerLeave", &function_52be02397ea5f937, "REV_OB_EXFIL");
    namespace_4faa6169000e657c::function_8b5b2a3392fc7e2a("ActivityEnd", &function_52be02397ea5f937, "REV_OB_EXFIL");
    foreach (player in level.players) {
        player thread hud_message::showsplash("aether_storm_final_exfil_inbound", undefined, undefined, undefined, 1, "splash_list_jup_ob");
    }
    while (1) {
        exfil = time_remaining = level waittill("exfil_time_remaining");
        if (exfil != level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638) {
            continue;
        }
        if (time_remaining <= 60) {
            thread overlord::function_d87d5deb069bf8e5("aether_storm_final_exfil_warning", level.players, 0, 1);
            break;
        }
    }
    if (!level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638 ent_flag("exfil_complete_timeout")) {
        level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638 utility::waittill_any_2("exfil_complete_timeout", "exfil_players_dead");
    }
    namespace_6c8a837ec98fe0b8::returnobjectiveid(level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.var_d182b8d3f3aaa93b.n_obj_id);
    level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.var_d182b8d3f3aaa93b.n_obj_id = undefined;
    level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638 utility::waittill_notify_or_timeout("exfil_vehicle_gone", getdvarfloat(@"hash_98a99c8faf0974fd", 20));
    var_a9f9fc95bb88af53 = 1;
    foreach (player in level.players) {
        if (!isdefined(player) || player.sessionstate != "playing") {
            continue;
        }
        if (!istrue(player.var_f52eb40ba99ffa4c) && !istrue(player.var_68b9486f4adbcb62)) {
            var_a9f9fc95bb88af53 = 0;
            break;
        }
    }
    if (var_a9f9fc95bb88af53) {
        goto LOC_00000811;
    }
    thread overlord::function_c1c677ed7a1b1128("aether_storm_final_exfil_missing", "aether_storm_final_exfil_success", level.players);
    wait(5);
    thread function_d52bfc09d86c8636();
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x279e
// Size: 0x61
function function_2deaea362f60497a(var_751df20fceaee5) {
    var_35ef5a1b78538d84 = max(0, (level.var_24b61da48c7bdf06.var_3d51670b31c0dbc0 - gettime()) / 1000);
    level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.var_74144fabf9631d37 = min(80, var_35ef5a1b78538d84);
    return var_35ef5a1b78538d84;
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2807
// Size: 0xa5
function function_52be02397ea5f937(var_7c2773f9b1434787) {
    waitframe();
    foreach (player in var_7c2773f9b1434787.playerlist) {
        if (isalive(player) && player.sessionstate == "playing" && !istrue(player.var_f52eb40ba99ffa4c)) {
            player exfil::function_f4f52d20f1fb7650(level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638);
        }
    }
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28b3
// Size: 0xea
function function_d52bfc09d86c8636(params) {
    foreach (player in level.players) {
        if (isdefined(player) && !istrue(player.var_f52eb40ba99ffa4c)) {
            player thread ob::function_922c3629c545df86();
            if (isalive(player) && player.sessionstate == "playing") {
                player kill();
            }
        }
    }
    if (!istrue(level.gameended)) {
        wait(getdvarint(@"hash_28f9cb938ede4706", 60));
        level notify("game_ended_aether_storm");
        level thread gamelogic::endgame("none", game["end_reason"]["time_limit_reached"], game["end_reason"]["time_limit_reached"]);
    }
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29a4
// Size: 0x18
function function_1e80b64e11b75717(state) {
    setomnvar("ui_br_circle_state", state);
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29c3
// Size: 0x4e
function function_68a343d65f254473(seconds) {
    level.var_24b61da48c7bdf06.var_3d51670b31c0dbc0 = gettime() + int(seconds * 1000);
    setomnvar("ui_hardpoint_timer", level.var_24b61da48c7bdf06.var_3d51670b31c0dbc0);
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2a18
// Size: 0x88
function private function_d8626a2206442680() {
    if (level.var_24b61da48c7bdf06.var_e2ed7cc207500cb3) {
        return;
    }
    flags::gameflagwait("prematch_done");
    level.var_24b61da48c7bdf06.var_d2340d5094319e8 = gettime();
    /#
        childthread function_82d15002698f32a8();
    #/
    if (level.var_24b61da48c7bdf06.var_2115c7dedd7891f6 > 0) {
        wait(level.var_24b61da48c7bdf06.var_2115c7dedd7891f6);
    }
    if (!function_1f1b9a49f43638d0()) {
        function_1e80b64e11b75717(5);
    }
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2aa7
// Size: 0x65
function private function_82d15002698f32a8() {
    /#
        level endon("<unknown string>");
        while (1) {
            level waittill("<unknown string>");
            if (function_1f1b9a49f43638d0()) {
                break;
            }
            if (gettime() >= level.var_24b61da48c7bdf06.var_d2340d5094319e8 + level.var_24b61da48c7bdf06.var_2115c7dedd7891f6) {
                function_1e80b64e11b75717(9);
                break;
            }
        }
    #/
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2b13
// Size: 0x2e1
function private function_abc28a284657371f() {
    level endon("game_ended");
    flags::gameflagwait("prematch_done");
    wait_time = game_utility::gettimelimit() - float(gettime()) / 1000 - 600;
    if (wait_time > 0) {
        utility::waittill_notify_or_timeout("aether_storm_expansion_started", wait_time);
    }
    if (!istrue(utility::flag("aether_storm_expansion_started"))) {
        switch (level.var_24b61da48c7bdf06.var_aa29def91aae98bd) {
        case 0:
            thread overlord::function_c1c677ed7a1b1128("aether_storm_expansion_warning_barrera", level.players);
            break;
        case 1:
            thread overlord::function_c1c677ed7a1b1128("aether_storm_expansion_warning_dobbs", level.players);
            break;
        case 2:
            thread overlord::function_c1c677ed7a1b1128("aether_storm_expansion_warning_kapoor", level.players);
            break;
        case 3:
            thread overlord::function_c1c677ed7a1b1128("aether_storm_expansion_warning_miller", level.players);
            break;
        }
    }
    level utility::flag_wait("aether_storm_expansion_started");
    foreach (player in level.players) {
        player thread hud_message::showsplash("aether_storm_expansion_started", undefined, undefined, undefined, 1, "splash_list_jup_ob");
    }
    switch (level.var_24b61da48c7bdf06.var_aa29def91aae98bd) {
    case 0:
        thread overlord::function_c1c677ed7a1b1128("aether_storm_expansion_started_barrera", level.players);
        break;
    case 1:
        thread overlord::function_c1c677ed7a1b1128("aether_storm_expansion_started_dobbs", level.players);
        break;
    case 2:
        thread overlord::function_c1c677ed7a1b1128("aether_storm_expansion_started_kapoor", level.players);
        break;
    case 3:
        thread overlord::function_c1c677ed7a1b1128("aether_storm_expansion_started_miller", level.players);
        break;
    }
    wait(600);
    switch (level.var_24b61da48c7bdf06.var_aa29def91aae98bd) {
    case 0:
        thread overlord::function_d87d5deb069bf8e5("aether_storm_intensity_increasing_barrera", level.players);
        break;
    case 1:
        thread overlord::function_d87d5deb069bf8e5("aether_storm_intensity_increasing_dobbs", level.players);
        break;
    case 2:
        thread overlord::function_d87d5deb069bf8e5("aether_storm_intensity_increasing_kapoor", level.players);
        break;
    case 3:
        thread overlord::function_d87d5deb069bf8e5("aether_storm_intensity_increasing_miller", level.players);
        break;
    }
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2dfb
// Size: 0x143
function private function_9a4d5d4bcc9e2c58() {
    level endon("game_ended");
    flags::gameflagwait("prematch_done");
    level utility::flag_wait("aether_storm_expansion_started");
    wait(600);
    foreach (player in level.players) {
        if (!istrue(player.defeated) && !istrue(player.var_f52eb40ba99ffa4c) && !istrue(player.var_488872571019cd6c)) {
            player namespace_27d2b4ad2e567ea4::function_2431d3e1b4e70519();
            player setplayermusicstate("mx_jup_ob_storm_1");
        }
    }
    wait(150);
    foreach (player in level.players) {
        if (!istrue(player.defeated) && !istrue(player.var_f52eb40ba99ffa4c) && !istrue(player.var_488872571019cd6c)) {
            player namespace_27d2b4ad2e567ea4::function_2431d3e1b4e70519();
            player setplayermusicstate("mx_jup_ob_storm_2");
        }
    }
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f45
// Size: 0x95
function function_a143c9a0fa3af9f6() {
    if (!level.var_24b61da48c7bdf06.var_ab66a0c49f0e8d6e) {
        return;
    }
    utility::flag_wait("ai_spawn_director_initialized");
    requestid = namespace_1c689dd3986a841c::function_54da428ad4a96f2e(%"hash_35507329b13b885d", level.var_24b61da48c7bdf06.var_5712319afa086cc8, level.var_24b61da48c7bdf06.var_4355367c3316786c, 1, 1, 1);
    function_d37068aac7785c04(requestid, level.var_24b61da48c7bdf06.difficulty, 1);
    namespace_1c689dd3986a841c::function_73147cdf5c28d10c(requestid, &function_8adcb7c5489211ae);
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2fe1
// Size: 0x4b
function private function_8adcb7c5489211ae(requestid, instance, agent, var_5c0a31a149731954) {
    if (function_1f1b9a49f43638d0()) {
        if (getdvarint(@"hash_729c0e8d0666b374", 1)) {
            function_18790a3cb3f88db7(requestid);
        }
        return 1;
    }
    return 0;
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3034
// Size: 0x29b
function function_e427c341b9abc409() {
    if (!level.var_24b61da48c7bdf06.var_8b570b76600ddee9) {
        return;
    }
    utility::flag_wait("ai_spawn_director_initialized");
    spawnpoint = getclosestpointonnavmesh(level.var_24b61da48c7bdf06.var_5712319afa086cc8);
    var_957d0419ff6605b9 = namespace_2b1145f62aa835b8::get_aitype_by_subclass_SharedFunc("zombie_disciple_hvt_stormcaller");
    var_9f578d49d039394b = undefined;
    foreach (aitype in var_957d0419ff6605b9) {
        var_90906ae7ffd6dee3 = aitype.size;
        if (!isdefined(var_9f578d49d039394b) || var_9f578d49d039394b.size > var_90906ae7ffd6dee3) {
            var_9f578d49d039394b = aitype;
        }
    }
    while (!isdefined(level.var_24b61da48c7bdf06.var_86d7ea2e230ecc81)) {
        wait(1);
        level.var_24b61da48c7bdf06.var_86d7ea2e230ecc81 = namespace_2b1145f62aa835b8::spawnNewAIType_SharedFunc(var_9f578d49d039394b, spawnpoint, (0, 0, 0), "team_two_hundred");
    }
    level.var_24b61da48c7bdf06.var_9be93da34100a104 = [];
    level.var_24b61da48c7bdf06.var_86d7ea2e230ecc81._blackboard.var_46621811c1024018 = spawnpoint;
    difficulty = getdvar(@"hash_a80863b2558da960", level.var_24b61da48c7bdf06.difficulty);
    level.var_24b61da48c7bdf06.var_86d7ea2e230ecc81 namespace_f721fc7d0d2d0f47::function_4a4fab5fd0b06d7b(difficulty);
    level.var_24b61da48c7bdf06.var_86d7ea2e230ecc81 callback::add("on_zombie_ai_damaged", &function_ff996236e6d7763e);
    level.var_24b61da48c7bdf06.var_86d7ea2e230ecc81 callback::add("on_zombie_ai_killed", &function_1852c6ed3ffb360e);
    thread function_94ed84e06d08efd3();
    level utility::flag_set("aether_storm_stormcaller_spawned");
    level.var_24b61da48c7bdf06.var_126361603ff7a9b7 = namespace_1c689dd3986a841c::function_54da428ad4a96f2e(%"hash_142f7ced2439e733", level.var_24b61da48c7bdf06.var_5712319afa086cc8, level.var_24b61da48c7bdf06.var_4355367c3316786c, 1, 1);
    function_d37068aac7785c04(level.var_24b61da48c7bdf06.var_126361603ff7a9b7, level.var_24b61da48c7bdf06.difficulty, 1);
    namespace_1c689dd3986a841c::function_e4a67fe4ddca7ed5(level.var_24b61da48c7bdf06.var_126361603ff7a9b7, &function_9b971ebaff7c3eaa);
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x32d6
// Size: 0x77
function private function_9b971ebaff7c3eaa(requestid, instance, agent, var_5c0a31a149731954) {
    waitframe();
    level utility::flag_wait("aether_storm_stormcaller_spawned");
    agent namespace_f721fc7d0d2d0f47::function_4a4fab5fd0b06d7b(level.var_24b61da48c7bdf06.difficulty);
    if (!agent utility::ent_flag("disciple_bound")) {
        level.var_24b61da48c7bdf06.var_86d7ea2e230ecc81 namespace_4d4755f6eec0fa1b::function_1fca749b9ae92b76(agent);
    }
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3354
// Size: 0x82
function private function_ff996236e6d7763e(params) {
    if (isplayer(params.eattacker) && isdefined(params.idamage) && params.idamage >= level.var_24b61da48c7bdf06.var_a75317daa0bd7ff9) {
        level.var_24b61da48c7bdf06.var_9be93da34100a104[params.eattacker getentitynumber()] = params.eattacker;
    }
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x33dd
// Size: 0x209
function private function_1852c6ed3ffb360e(params) {
    if (!isdefined(params.smeansofdeath) || params.smeansofdeath == "MOD_SUICIDE") {
        spawnpoint = getclosestpointonnavmesh(level.var_24b61da48c7bdf06.var_5712319afa086cc8);
        var_957d0419ff6605b9 = namespace_2b1145f62aa835b8::get_aitype_by_subclass_SharedFunc("zombie_disciple_hvt_stormcaller");
        level.var_24b61da48c7bdf06.var_86d7ea2e230ecc81 = namespace_2b1145f62aa835b8::spawnNewAIType_SharedFunc(var_957d0419ff6605b9[0], spawnpoint, (0, 0, 0), "team_two_hundred");
        level.var_24b61da48c7bdf06.var_86d7ea2e230ecc81._blackboard.var_46621811c1024018 = spawnpoint;
        level.var_24b61da48c7bdf06.var_86d7ea2e230ecc81 namespace_f721fc7d0d2d0f47::function_4a4fab5fd0b06d7b(getdvar(@"hash_a80863b2558da960", level.var_24b61da48c7bdf06.difficulty));
        level.var_24b61da48c7bdf06.var_86d7ea2e230ecc81 callback::add("on_zombie_ai_damaged", &function_ff996236e6d7763e);
        level.var_24b61da48c7bdf06.var_86d7ea2e230ecc81 callback::add("on_zombie_ai_killed", &function_1852c6ed3ffb360e);
        return;
    }
    namespace_1c689dd3986a841c::function_9950e6e485bf5261(level.var_24b61da48c7bdf06.var_126361603ff7a9b7);
    foreach (player in level.var_24b61da48c7bdf06.var_9be93da34100a104) {
        player thread hud_message::showsplash("aether_storm_stormcaller_eliminated", undefined, undefined, undefined, 1, "splash_list_jup_ob");
    }
    level.var_24b61da48c7bdf06.var_126361603ff7a9b7 = undefined;
    level.var_24b61da48c7bdf06.var_9be93da34100a104 = undefined;
    level.var_24b61da48c7bdf06.var_86d7ea2e230ecc81 = undefined;
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x35ed
// Size: 0x1d7
function private function_94ed84e06d08efd3() {
    level endon("aether_storm_expansion_started");
    while (isdefined(level.var_24b61da48c7bdf06.var_86d7ea2e230ecc81)) {
        if (distance2dsquared(level.var_24b61da48c7bdf06.var_86d7ea2e230ecc81.origin, level.var_24b61da48c7bdf06.radiation.origin) > level.var_24b61da48c7bdf06.radiation.radiussq * 1.5) {
            wait(30);
            if (isdefined(level.var_24b61da48c7bdf06.var_86d7ea2e230ecc81) && distance2dsquared(level.var_24b61da48c7bdf06.var_86d7ea2e230ecc81.origin, level.var_24b61da48c7bdf06.radiation.origin) > level.var_24b61da48c7bdf06.radiation.radiussq * 1.5) {
                var_923c734b7356524c = level.var_24b61da48c7bdf06.var_86d7ea2e230ecc81.health;
                level.var_24b61da48c7bdf06.var_86d7ea2e230ecc81.var_7e4b076a06c6df27 = 1;
                level.var_24b61da48c7bdf06.var_86d7ea2e230ecc81 kill(level.var_24b61da48c7bdf06.var_86d7ea2e230ecc81.origin, level.var_24b61da48c7bdf06.var_86d7ea2e230ecc81, level.var_24b61da48c7bdf06.var_86d7ea2e230ecc81, "MOD_SUICIDE");
                waitframe();
                level.var_24b61da48c7bdf06.var_86d7ea2e230ecc81.health = var_923c734b7356524c;
            }
        }
        wait(5);
    }
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x37cb
// Size: 0x148
function private function_fad17bd00c6aaaa2(params) {
    while (1) {
        if (!isdefined(level.var_24b61da48c7bdf06.var_86d7ea2e230ecc81)) {
            return;
        }
        var_5414206430871118 = level.var_24b61da48c7bdf06.var_86d7ea2e230ecc81.origin;
        var_f7319d60cb666cf3 = (level.var_24b61da48c7bdf06.radiation.origin[0], level.var_24b61da48c7bdf06.radiation.origin[1], 0) - (var_5414206430871118[0], var_5414206430871118[1], 0);
        var_110ac0502d92849d = length(var_f7319d60cb666cf3);
        var_b5c57e3f326eb194 = var_110ac0502d92849d + level.var_24b61da48c7bdf06.var_4355367c3316786c - level.var_24b61da48c7bdf06.radiation.radius;
        if (var_b5c57e3f326eb194 > 0) {
            push_direction = var_f7319d60cb666cf3 / var_110ac0502d92849d;
            var_5414206430871118 = getclosestpointonnavmesh(var_5414206430871118 + var_b5c57e3f326eb194 * push_direction);
        }
        level.var_24b61da48c7bdf06.var_86d7ea2e230ecc81._blackboard.var_46621811c1024018 = var_5414206430871118;
        wait(5);
    }
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x391a
// Size: 0x5bb
function private function_db25872d3eb4f360() {
    level endon("game_ended");
    level.var_24b61da48c7bdf06.radiation endon("radiation_destroyed");
    var_90c9080889c92f17 = 0;
    var_b31e57d1a1fc8871 = [];
    var_da6f20045ba9ee8 = undefined;
    var_3277e397d70bf9e5 = undefined;
    var_6fd91f67f0ed50e9 = undefined;
    while (level.var_24b61da48c7bdf06.radiation.active) {
        var_b31e57d1a1fc8871 = getaiarrayinradius(level.var_24b61da48c7bdf06.radiation.origin, level.var_24b61da48c7bdf06.radiation.radius * 1.25, "all");
        foreach (agent in var_b31e57d1a1fc8871) {
            if (!isalive(agent) || istrue(agent.var_102a9d2cf99ab325)) {
                var_90c9080889c92f17 = var_90c9080889c92f17 + 0.1;
            } else if (isdefined(agent.agent_type) && (issubstr(agent.agent_type, "warlord") || issubstr(agent.agent_type, "bodyguard"))) {
                var_90c9080889c92f17 = var_90c9080889c92f17 + 0.1;
            } else {
                var_6fd91f67f0ed50e9 = level.var_24b61da48c7bdf06.radiation radiation::function_1b4f63fa623de69a(agent.origin);
                if (agent.type == "zombie") {
                    if (isdefined(level.var_24b61da48c7bdf06.var_86d7ea2e230ecc81) && agent == level.var_24b61da48c7bdf06.var_86d7ea2e230ecc81 || !isdefined(agent.var_47399212b3052720)) {
                        var_90c9080889c92f17 = var_90c9080889c92f17 + 0.1;
                        continue;
                    } else if (var_6fd91f67f0ed50e9) {
                        if (!istrue(agent.var_52e05f199428179)) {
                            agent.var_52e05f199428179 = 1;
                            var_fc4ffac4746eb217 = namespace_f721fc7d0d2d0f47::function_4d8bb2d866771a10(agent.origin);
                            if (agent.difficulty == var_fc4ffac4746eb217) {
                                switch (var_fc4ffac4746eb217) {
                                case #"hash_7bb2cd766703d463":
                                    agent namespace_f721fc7d0d2d0f47::function_4a4fab5fd0b06d7b("difficulty_normal");
                                    break;
                                case #"hash_af83e47edfa8900a":
                                    agent namespace_f721fc7d0d2d0f47::function_4a4fab5fd0b06d7b("difficulty_hard");
                                    break;
                                case #"hash_5343b465e56ec9a4":
                                    agent.var_d10755c0244b1937 = namespace_f721fc7d0d2d0f47::function_300a6f8c556edf34("difficulty_darkaether");
                                    if (isdefined(agent.var_47399212b3052720.var_27c2dce37c7b4774)) {
                                        agent.maxhealth = namespace_22b8ba12655bf3f2::function_cf858e0766110297(agent.var_47399212b3052720.var_27c2dce37c7b4774, agent.var_d10755c0244b1937);
                                    }
                                    namespace_f721fc7d0d2d0f47::function_4fd50faaf7767e65(agent, "difficulty_darkaether", agent.var_d10755c0244b1937);
                                    break;
                                }
                                agent ai::function_dd21d67ede8ba22(int(agent.maxhealth * level.var_24b61da48c7bdf06.var_ad737473be1f0d04));
                                agent.health = agent.maxhealth;
                            }
                            if (issubstr(agent.subclass, "zombie_base") && !agent utility::ent_flag("disciple_bound")) {
                                agent utility::function_3ab9164ef76940fd("bound", "bound_on");
                            }
                        }
                    } else if (istrue(agent.var_52e05f199428179)) {
                        agent.var_52e05f199428179 = 0;
                        old_health = agent.health;
                        agent namespace_f721fc7d0d2d0f47::function_4a4fab5fd0b06d7b(namespace_f721fc7d0d2d0f47::function_4d8bb2d866771a10(agent.origin));
                        if (isdefined(agent.max_health) && old_health < agent.max_health) {
                            agent.health = old_health;
                        }
                        if (issubstr(agent.subclass, "zombie_base") && !agent utility::ent_flag("disciple_bound")) {
                            agent utility::function_3ab9164ef76940fd("bound", "bound_off");
                        }
                    }
                } else {
                    if (var_6fd91f67f0ed50e9) {
                        if (!isdefined(agent.var_fe0cb6be740c6685) || gettime() - agent.var_fe0cb6be740c6685 >= level.var_24b61da48c7bdf06.var_31068981fd9277c6) {
                            damage = (isdefined(agent.maxhealth) ? 100 : agent.maxhealth) * level.var_24b61da48c7bdf06.var_9a2fdb386cc15ae0;
                            agent dodamage(damage, agent.origin, undefined, undefined, "MOD_TRIGGER_HURT", level.radiation.damageweapon, "torso_upper");
                            agent.var_fe0cb6be740c6685 = gettime();
                        }
                    }
                    if (isalive(agent) && !istrue(agent.var_b43f6cad28078a05)) {
                        var_da6f20045ba9ee8 = agent.origin + 2000 * vectornormalize(agent.origin - level.var_24b61da48c7bdf06.radiation.origin);
                        var_3277e397d70bf9e5 = getclosestpointonnavmesh(var_da6f20045ba9ee8);
                        if (lengthsquared(var_da6f20045ba9ee8 - var_3277e397d70bf9e5) < 1000000) {
                            thread namespace_7a13d4762231d63e::function_a5117518725da028(agent, var_da6f20045ba9ee8);
                        }
                    }
                }
                var_90c9080889c92f17 = var_90c9080889c92f17 + 1;
                if (var_90c9080889c92f17 > 5) {
                    var_90c9080889c92f17 = 0;
                    waitframe();
                }
            }
        }
        var_90c9080889c92f17 = 0;
        wait(1);
    }
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3edc
// Size: 0x3bc
function private function_ebf8ee98cf7a3be0() {
    level endon("game_ended");
    level.var_24b61da48c7bdf06.radiation endon("radiation_destroyed");
    /#
        level endon("<unknown string>");
    #/
    if (!level.var_24b61da48c7bdf06.var_94ea725a035aef57) {
        return;
    }
    level.var_24b61da48c7bdf06.var_bcf79bebe2066931 = spawnscriptable(%"hash_67315e48e910687f", level.var_24b61da48c7bdf06.var_5712319afa086cc8);
    scriptable::scriptable_addnotifycallback("aether_storm_lightning_strike_damage", &function_4468673c0ec43cd1);
    scriptable::scriptable_addnotifycallback("aether_storm_lightning_strike_finished", &function_d76103089e8c124e);
    level.var_24b61da48c7bdf06.var_d5422504409025bf = namespace_4e79b99367524a91::function_594acad17d5c9722(%"hash_528cbe8d883829a4");
    namespace_6c8a837ec98fe0b8::function_f21e9b2e78de984b(level.var_24b61da48c7bdf06.var_d5422504409025bf, level.var_24b61da48c7bdf06.var_43db6b44cd164b89, level.var_24b61da48c7bdf06.var_a60ecdae78f1434);
    function_d76cc64b205084a3(level.var_24b61da48c7bdf06.var_d5422504409025bf, 1);
    objective_setpings(level.var_24b61da48c7bdf06.var_d5422504409025bf, 0);
    function_a16750cd44f57931(level.var_24b61da48c7bdf06.var_d5422504409025bf, 0);
    function_1a20f52de11ba2ef(level.var_24b61da48c7bdf06.var_d5422504409025bf, 1);
    players_inside = [];
    var_ddb7fb3558975cac = (0, 0, 0);
    while (1) {
        if (randomintrange(0, 100) < level.var_24b61da48c7bdf06.var_ade6a22953100a52) {
            players_inside = namespace_2b1145f62aa835b8::function_883458a342af3041(level.var_24b61da48c7bdf06.radiation.origin, level.var_24b61da48c7bdf06.radiation.radius);
            if (players_inside.size) {
                random_player = players_inside[randomintrange(0, players_inside.size)];
                var_ddb7fb3558975cac = random_player.origin;
                var_3d6b4222f967d915 = function_767cea82b001f645(var_ddb7fb3558975cac - level.var_24b61da48c7bdf06.radiation.origin);
                var_1970a7d6465931da = level.var_24b61da48c7bdf06.radiation.origin + var_3d6b4222f967d915 * level.var_24b61da48c7bdf06.radiation.radius;
                var_98ccf2925acd2d29 = distance2d(var_ddb7fb3558975cac, var_1970a7d6465931da);
                if (var_98ccf2925acd2d29 < level.var_24b61da48c7bdf06.var_6da5e5e442abcb81) {
                    var_ddb7fb3558975cac = var_1970a7d6465931da + var_3d6b4222f967d915 * -1 * (level.var_24b61da48c7bdf06.var_6da5e5e442abcb81 - var_98ccf2925acd2d29);
                }
            } else {
                var_1b0771204b2e73e4 = randomfloat(360);
                var_a16770fce4e9602d = randomfloat(level.var_24b61da48c7bdf06.radiation.radius);
                var_ddb7fb3558975cac = (level.var_24b61da48c7bdf06.radiation.origin[0] + cos(var_1b0771204b2e73e4) * var_a16770fce4e9602d, level.var_24b61da48c7bdf06.radiation.origin[1] + sin(var_1b0771204b2e73e4) * var_a16770fce4e9602d, level.var_24b61da48c7bdf06.radiation.origin[2]);
            }
            function_ea13f5b63d920d2f(var_ddb7fb3558975cac);
            wait(level.var_24b61da48c7bdf06.var_a89d2433198e329e);
        } else {
            wait(1);
        }
    }
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x429f
// Size: 0x1d0
function function_ea13f5b63d920d2f(var_ddb7fb3558975cac) {
    var_fa5600de20617e5a = undefined;
    var_8e155dfa53d66acb = undefined;
    var_d3f2b3ecab183636 = undefined;
    /#
        level.var_24b61da48c7bdf06.var_6dbf82211b027b64 = var_ddb7fb3558975cac;
    #/
    var_4623b2e21b5dcef3 = 0;
    while (var_4623b2e21b5dcef3 < level.var_24b61da48c7bdf06.var_284270df3a99404) {
        var_fa5600de20617e5a = randomfloat(360);
        var_8e155dfa53d66acb = randomfloat(level.var_24b61da48c7bdf06.var_6da5e5e442abcb81);
        var_d3f2b3ecab183636 = (var_ddb7fb3558975cac[0] + cos(var_fa5600de20617e5a) * var_8e155dfa53d66acb, var_ddb7fb3558975cac[1] + sin(var_fa5600de20617e5a) * var_8e155dfa53d66acb, var_ddb7fb3558975cac[2]);
        var_d3f2b3ecab183636 = getgroundposition(var_d3f2b3ecab183636, 1, 2048, 1024);
        namespace_6c8a837ec98fe0b8::update_objective_position(level.var_24b61da48c7bdf06.var_d5422504409025bf, var_d3f2b3ecab183636);
        namespace_6c8a837ec98fe0b8::update_objective_state(level.var_24b61da48c7bdf06.var_d5422504409025bf, "current");
        namespace_6c8a837ec98fe0b8::objective_playermask_showtoall(level.var_24b61da48c7bdf06.var_d5422504409025bf);
        level.var_24b61da48c7bdf06.var_bcf79bebe2066931.origin = var_d3f2b3ecab183636;
        level.var_24b61da48c7bdf06.var_bcf79bebe2066931 setscriptablepartstate(#"strike", #"on");
        level.var_24b61da48c7bdf06.var_bcf79bebe2066931 waittill("aether_storm_lightning_strike_finished");
        namespace_6c8a837ec98fe0b8::objective_playermask_hidefromall(level.var_24b61da48c7bdf06.var_d5422504409025bf);
        namespace_6c8a837ec98fe0b8::update_objective_state(level.var_24b61da48c7bdf06.var_d5422504409025bf, "empty");
        var_4623b2e21b5dcef3 = var_4623b2e21b5dcef3 + 1;
    }
    /#
        level.var_24b61da48c7bdf06.var_6dbf82211b027b64 = undefined;
    #/
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4476
// Size: 0x27f
function private function_4468673c0ec43cd1(instance, note, param, var_535d9c3fdddab5a9) {
    function_3d8d8ad244283e65(#"hash_a37010fcd4308e33");
    radiusdamage(instance.origin, level.var_24b61da48c7bdf06.var_4f4ea0d0cc4b762e, level.var_24b61da48c7bdf06.var_913f0729da2f7bf7, level.var_24b61da48c7bdf06.var_913f0729da2f7bf7, undefined, undefined, undefined, 1, 1);
    players = namespace_2b1145f62aa835b8::function_883458a342af3041(instance.origin, level.var_24b61da48c7bdf06.var_4f4ea0d0cc4b762e);
    foreach (player in players) {
        thread function_1ccf067179383388(player, level.var_24b61da48c7bdf06.var_100cbabc49ba5983, level.var_24b61da48c7bdf06.var_913f0729da2f7bf7);
    }
    zombies = getaiarrayinradius(instance.origin, level.var_24b61da48c7bdf06.var_4f4ea0d0cc4b762e, "team_two_hundred");
    foreach (zombie in zombies) {
        thread function_1e93e4747cd83387(zombie, level.var_24b61da48c7bdf06.var_100cbabc49ba5983, level.var_24b61da48c7bdf06.var_913f0729da2f7bf7);
    }
    var_1047a207e101159e = getaiarrayinradius(instance.origin, level.var_24b61da48c7bdf06.var_4f4ea0d0cc4b762e, "team_hundred_ninety");
    foreach (soldier in var_1047a207e101159e) {
        thread function_88888e5d4a0feebd(soldier, level.var_24b61da48c7bdf06.var_100cbabc49ba5983, level.var_24b61da48c7bdf06.var_913f0729da2f7bf7);
    }
    function_7f3923ed3d66f8ad();
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x46fc
// Size: 0x2c
function private function_d76103089e8c124e(instance, note, param, var_535d9c3fdddab5a9) {
    instance notify("aether_storm_lightning_strike_finished");
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x472f
// Size: 0x147
function function_1ccf067179383388(victim, var_9d18a5823be25c3a, damage) {
    victim namespace_4f5d52f30ee493ee::function_a9a57668997e3c85(1);
    if (istrue(victim.revivingteammate)) {
        victim.var_4a2f2f50a9020e2e = 1;
    }
    victim utility::function_3ab9164ef76940fd("shockStickVfx", "vfx_start");
    victim dodamage(damage, victim.origin, victim, victim, "MOD_UNKNOWN", undefined, "none", undefined, 65536);
    if (isplayer(victim)) {
        var_405b7207cd5f1b1d = "vm_ges_shockstick_react";
        if (victim getcurrentweapon() == "iw9_me_fists_mp") {
            var_405b7207cd5f1b1d = "vm_ges_shockstick_react_fists";
        }
        attempts = 0;
        while (!victim isgestureplaying(var_405b7207cd5f1b1d) && attempts < 5) {
            victim forceplaygestureviewmodel(var_405b7207cd5f1b1d);
            attempts = attempts + 1;
            waitframe();
        }
    }
    victim StartForcedFire();
    victim namespace_4f5d52f30ee493ee::function_600c7c4c73c6a773(1);
    victim setmovespeedscale(0.8);
    victim setempjammed(1);
    wait(var_9d18a5823be25c3a);
    victim namespace_4f5d52f30ee493ee::function_a9a57668997e3c85(0);
    victim stopgestureviewmodel(var_405b7207cd5f1b1d);
    victim StopForcedFire();
    victim utility::function_3ab9164ef76940fd("shockStickVfx", "off");
    victim namespace_4f5d52f30ee493ee::function_600c7c4c73c6a773(0);
    victim setmovespeedscale(1);
    victim setempjammed(0);
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x487d
// Size: 0x7a
function function_1e93e4747cd83387(victim, var_9d18a5823be25c3a, damage) {
    victim namespace_a624a0178cc156e4::function_2e4d3c67e63f83ac(var_9d18a5823be25c3a);
    victim utility::function_3ab9164ef76940fd("shockStickVfx", "vfx_start");
    victim dodamage(damage, victim.origin, victim, victim, "MOD_UNKNOWN", undefined, "none", undefined, 65536);
    wait(var_9d18a5823be25c3a);
    if (isalive(victim)) {
        victim utility::function_3ab9164ef76940fd("shockStickVfx", "off");
    }
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48fe
// Size: 0xe0
function function_88888e5d4a0feebd(victim, var_9d18a5823be25c3a, damage) {
    var_dba6bbe47bd81571 = gettime() > victim._blackboard.var_dc51d4ea36da3ae1 + 1;
    victim._blackboard.var_dc51d4ea36da3ae1 = gettime();
    if (victim asmhaspainstate(victim.asmname) && var_dba6bbe47bd81571) {
        victim asmevalpaintransition(victim.asmname);
    }
    victim utility::function_3ab9164ef76940fd("shockStickVfx", "vfx_start");
    victim dodamage(damage, victim.origin, victim, victim, "MOD_UNKNOWN", undefined, "none", undefined, 65536);
    wait(var_9d18a5823be25c3a);
    if (isalive(victim)) {
        victim utility::function_3ab9164ef76940fd("shockStickVfx", "off");
    }
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49e5
// Size: 0x39
function function_f4df458e2841cbf1(params) {
    player = params.player;
    if (isdefined(player)) {
        player utility::function_3ab9164ef76940fd("aether_storm_sfx", "activate");
    }
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a25
// Size: 0x39
function function_38b3b1600f7440b1(params) {
    player = params.player;
    if (isdefined(player)) {
        player utility::function_3ab9164ef76940fd("aether_storm_sfx", "off");
    }
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a65
// Size: 0x22
function function_d0f8b9fdea272469(var_d27680ff86693f5c) {
    if (isdefined(self)) {
        utility::function_3ab9164ef76940fd("aether_storm_sfx", "off");
    }
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4a8e
// Size: 0x837
function private function_3a2ca530d33dbb7c() {
    /#
        level endon("<unknown string>");
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_9ecaf8b1fd98837e);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_9ecaf8b1fd98837e);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_9ecaf8b1fd98837e);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_9ecaf8b1fd98837e);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_9ecaf8b1fd98837e);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_9ecaf8b1fd98837e);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_9ecaf8b1fd98837e);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_9ecaf8b1fd98837e);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_9ecaf8b1fd98837e);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_9ecaf8b1fd98837e);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_9ecaf8b1fd98837e);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_9ecaf8b1fd98837e);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_9ecaf8b1fd98837e);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_9ecaf8b1fd98837e);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_9ecaf8b1fd98837e);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_9ecaf8b1fd98837e);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_9ecaf8b1fd98837e);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_9ecaf8b1fd98837e);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_9ecaf8b1fd98837e);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_9ecaf8b1fd98837e);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_9ecaf8b1fd98837e);
        devgui::function_b2159fbbd7ac094e("<unknown string>", @"hash_c970fe9ef25b9a04");
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_108d531ae15fcc87);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_108d531ae15fcc87);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_108d531ae15fcc87);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_108d531ae15fcc87);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_108d531ae15fcc87);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_108d531ae15fcc87);
        devgui::function_b2159fbbd7ac094e("<unknown string>", @"hash_e2d799f3be57182c");
        devgui::function_b2159fbbd7ac094e("<unknown string>", @"hash_15f2625555966cc5");
        devgui::function_b2159fbbd7ac094e("<unknown string>", @"hash_427ed1f525368516");
        devgui::function_b2159fbbd7ac094e("<unknown string>", @"hash_bd3120ea0bb6d372");
        devgui::function_b2159fbbd7ac094e("<unknown string>", @"hash_d6c6f72d0fa198e1");
        devgui::function_b2159fbbd7ac094e("<unknown string>", @"hash_1ba1d0074052d695");
        devgui::function_b2159fbbd7ac094e("<unknown string>", @"hash_e240cfe5c52e96b9");
        devgui::function_b2159fbbd7ac094e("<unknown string>", @"hash_e045509608ce5be3");
        devgui::function_fe953f000498048f();
        thread function_8c073da924b036f8();
        setdvar(@"hash_bd3120ea0bb6d372", level.var_24b61da48c7bdf06.var_94ea725a035aef57);
        while (1) {
            waitframe();
            if (getdvarint(@"hash_c970fe9ef25b9a04", 0)) {
                setdvar(@"hash_c970fe9ef25b9a04", 0);
                println("<unknown string>");
                function_6cbfd9827af0e6d1();
            }
            if (getdvarint(@"hash_578143de415fb426", 0)) {
                percent = getdvarfloat(@"hash_578143de415fb426", 0);
                setdvar(@"hash_578143de415fb426", 0);
                println("<unknown string>" + percent + "<unknown string>");
                if (isdefined(level.var_24b61da48c7bdf06.radiation)) {
                    function_108d531ae15fcc87([0:percent]);
                }
            }
            if (getdvarint(@"hash_15f2625555966cc5", 0)) {
                setdvar(@"hash_15f2625555966cc5", 0);
                if (!isdefined(level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638)) {
                    println("<unknown string>");
                    continue;
                }
                println("<unknown string>" + level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.origin);
                foreach (player in level.players) {
                    x = level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.origin[0];
                    y = level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.origin[1];
                    z = level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.origin[2] + 128;
                    player setorigin((x, y, z));
                }
            }
            if (getdvarint(@"hash_427ed1f525368516", 0)) {
                setdvar(@"hash_427ed1f525368516", 0);
                println("<unknown string>");
                if (!istrue(level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.var_1326008dc390c510) && !istrue(level.var_24b61da48c7bdf06.var_e42fed415ee7a4eb)) {
                    thread function_4b40a61f53dd9122();
                }
                level notify("<unknown string>");
            }
            if (getdvarint(@"hash_bd3120ea0bb6d372", 1) != level.var_24b61da48c7bdf06.var_94ea725a035aef57) {
                level.var_24b61da48c7bdf06.var_94ea725a035aef57 = getdvarint(@"hash_bd3120ea0bb6d372", 1);
                if (level.var_24b61da48c7bdf06.var_94ea725a035aef57) {
                    println("<unknown string>");
                    thread function_ebf8ee98cf7a3be0();
                } else {
                    println("<unknown string>");
                    level notify("<unknown string>");
                }
            }
            if (getdvarint(@"hash_e240cfe5c52e96b9", 0)) {
                setdvar(@"hash_e240cfe5c52e96b9", 0);
                player = level.players[0];
                forward = anglestoforward(player getplayerangles());
                trace = trace::ray_trace(player geteye(), player geteye() + forward * 150000);
                if (isdefined(trace["<unknown string>"]) && isdefined(trace["<unknown string>"]) && trace["<unknown string>"] < 1) {
                    function_ea13f5b63d920d2f(trace["<unknown string>"]);
                }
            }
            if (getdvarint(@"hash_e045509608ce5be3", 0)) {
                setdvar(@"hash_e045509608ce5be3", 0);
                player = level.players[0];
                forward = anglestoforward(player getplayerangles());
                trace = trace::ray_trace(player geteye(), player geteye() + forward * 150000);
                if (isdefined(trace["<unknown string>"]) && isdefined(trace["<unknown string>"]) && trace["<unknown string>"] < 1) {
                    namespace_6c8a837ec98fe0b8::update_objective_position(level.var_24b61da48c7bdf06.var_d5422504409025bf, trace["<unknown string>"]);
                    namespace_6c8a837ec98fe0b8::objective_playermask_showtoall(level.var_24b61da48c7bdf06.var_d5422504409025bf);
                    level.var_24b61da48c7bdf06.var_bcf79bebe2066931.origin = trace["<unknown string>"];
                    level.var_24b61da48c7bdf06.var_bcf79bebe2066931 setscriptablepartstate(#"strike", #"on");
                    level.var_24b61da48c7bdf06.var_bcf79bebe2066931 waittill("<unknown string>");
                    namespace_6c8a837ec98fe0b8::objective_playermask_hidefromall(level.var_24b61da48c7bdf06.var_d5422504409025bf);
                }
            }
        }
    #/
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x52cc
// Size: 0x24e
function private function_8c073da924b036f8() {
    /#
        level endon("<unknown string>");
        timer = 0;
        while (1) {
            if (getdvarint(@"hash_e2d799f3be57182c", 0) && timer == 0) {
                print3d(level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.origin + (0, 0, 300), "<unknown string>", (1, 1, 1), 1, 25, 5, 1);
                sphere(level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.origin, 360, (1, 1, 1), 0, 5);
            }
            if (getdvarint(@"hash_d6c6f72d0fa198e1", 0) && isdefined(level.var_24b61da48c7bdf06.var_6dbf82211b027b64)) {
                cylinder(level.var_24b61da48c7bdf06.var_6dbf82211b027b64, level.var_24b61da48c7bdf06.var_6dbf82211b027b64 + (0, 0, 1), level.var_24b61da48c7bdf06.var_6da5e5e442abcb81, (1, 0, 1), 0, 1);
            }
            if (getdvarint(@"hash_1ba1d0074052d695", 0) && isdefined(level.var_24b61da48c7bdf06.var_bcf79bebe2066931)) {
                cylinder(level.var_24b61da48c7bdf06.var_bcf79bebe2066931.origin, level.var_24b61da48c7bdf06.var_bcf79bebe2066931.origin + (0, 0, 1), level.var_24b61da48c7bdf06.var_4f4ea0d0cc4b762e, (0.5, 0, 1), 0, 1);
                line(level.var_24b61da48c7bdf06.var_bcf79bebe2066931.origin, level.var_24b61da48c7bdf06.var_bcf79bebe2066931.origin + (0, 0, 1024), (0.5, 0, 1), 1, 0, 1);
            }
            waitframe();
            timer++;
            if (timer >= 5) {
                timer = 0;
            }
        }
    #/
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5521
// Size: 0x57e
function function_108d531ae15fcc87(params) {
    /#
        percent = float(params[0]) / 100;
        if (!istrue(level.var_24b61da48c7bdf06.radiation.var_55cf46878c46af61)) {
            function_6cbfd9827af0e6d1();
            waitframe();
        }
        level.var_24b61da48c7bdf06.radiation.var_b6b423f4ed3f7a2d = percent * level.var_24b61da48c7bdf06.var_647bf2cbf73994dd;
        var_29af21d31db6158c = level.var_24b61da48c7bdf06.var_647bf2cbf73994dd - level.var_24b61da48c7bdf06.radiation.var_b6b423f4ed3f7a2d;
        function_68a343d65f254473(var_29af21d31db6158c);
        if (istrue(level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.var_1326008dc390c510) && isdefined(level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.var_18da16a5ee3e8314) && isdefined(level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.var_18da16a5ee3e8314.var_e3d833b1e5d30b03["<unknown string>"])) {
            foreach (player in level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.var_c9164736baf0694a) {
                if (isalive(player) && player.sessionstate == "<unknown string>") {
                    player thread function_836e4857db4bf132(var_29af21d31db6158c, level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638);
                }
            }
            level thread function_55bc26a4fb35966d(level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638, var_29af21d31db6158c);
        }
        progress = level.var_24b61da48c7bdf06.radiation.var_b6b423f4ed3f7a2d / level.var_24b61da48c7bdf06.radiation.var_7bf9ce32347ac445;
        level.var_24b61da48c7bdf06.radiation.origin = vectorlerp(level.var_24b61da48c7bdf06.radiation.var_b70884a49ee01c84, level.var_24b61da48c7bdf06.radiation.var_828323b769725dbf, progress);
        level.var_24b61da48c7bdf06.radiation.radius = math::lerp(level.var_24b61da48c7bdf06.radiation.var_c939535a8d2d4870, level.var_24b61da48c7bdf06.radiation.var_89748805c0fc52e3, progress);
        var_49a313cc785a2410 = (level.var_24b61da48c7bdf06.var_3d51670b31c0dbc0 - gettime()) / 1000;
        var_49a313cc785a2410 = var_49a313cc785a2410 - level.var_24b61da48c7bdf06.var_be0e041e85848a6d;
        var_49a313cc785a2410 = var_49a313cc785a2410 - getdvarint(@"hash_eb873c5e99093d11", 50);
        var_49a313cc785a2410 = var_49a313cc785a2410 - getdvarint(@"hash_346baccb7a031727", 7);
        if (var_49a313cc785a2410 > 0) {
            thread function_fb316270994fd943("<unknown string>", var_49a313cc785a2410);
        } else {
            if (!istrue(level.var_24b61da48c7bdf06.var_6d0f73f4b7d10638.var_1326008dc390c510) && !istrue(level.var_24b61da48c7bdf06.var_e42fed415ee7a4eb)) {
                thread function_4b40a61f53dd9122();
            }
            level notify("<unknown string>");
        }
        if (isdefined(level.var_24b61da48c7bdf06.radiation.var_c075862f37971025)) {
            level.var_24b61da48c7bdf06.radiation.var_c075862f37971025 delete();
            level.var_24b61da48c7bdf06.radiation.var_c075862f37971025 = spawnbrcircle(level.var_24b61da48c7bdf06.radiation.origin[0], level.var_24b61da48c7bdf06.radiation.origin[1], level.var_24b61da48c7bdf06.radiation.radius);
            if (level.var_24b61da48c7bdf06.radiation.var_b6b423f4ed3f7a2d < level.var_24b61da48c7bdf06.radiation.var_7bf9ce32347ac445) {
                level.var_24b61da48c7bdf06.radiation.var_c075862f37971025 brcirclemoveto(level.var_24b61da48c7bdf06.radiation.var_828323b769725dbf[0], level.var_24b61da48c7bdf06.radiation.var_828323b769725dbf[1], level.var_24b61da48c7bdf06.radiation.var_89748805c0fc52e3, level.var_24b61da48c7bdf06.radiation.var_7bf9ce32347ac445 - level.var_24b61da48c7bdf06.radiation.var_b6b423f4ed3f7a2d);
            }
        }
    #/
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5aa6
// Size: 0x39b
function function_9ecaf8b1fd98837e(params) {
    /#
        switch (params[0]) {
        case #"hash_11b12a173b095faa":
        case #"hash_1eac9737b00b8d4f":
        case #"hash_2d4ef0849822310c":
        case #"hash_85c6684d3cc86f5b":
        case #"hash_c579023a5e0694ad":
            foreach (player in level.players) {
                player thread hud_message::showsplash("<unknown string>", undefined, undefined, undefined, 1, "<unknown string>");
            }
            break;
        case #"hash_c0f39f4bc1059d04":
            foreach (player in level.players) {
                player thread hud_message::showsplash("<unknown string>", undefined, undefined, undefined, 1, "<unknown string>");
            }
            break;
        }
        if (params[0] == "<unknown string>") {
            switch (level.var_24b61da48c7bdf06.var_aa29def91aae98bd) {
            case 0:
                thread overlord::function_c1c677ed7a1b1128("<unknown string>", level.players);
                break;
            case 1:
                thread overlord::function_c1c677ed7a1b1128("<unknown string>", level.players);
                break;
            case 2:
                thread overlord::function_c1c677ed7a1b1128("<unknown string>", level.players);
                break;
            case 3:
                thread overlord::function_c1c677ed7a1b1128("<unknown string>", level.players);
                break;
            }
        } else if (params[0] == "<unknown string>") {
            switch (level.var_24b61da48c7bdf06.var_aa29def91aae98bd) {
            case 0:
                thread overlord::function_c1c677ed7a1b1128("<unknown string>", level.players);
                break;
            case 1:
                thread overlord::function_c1c677ed7a1b1128("<unknown string>", level.players);
                break;
            case 2:
                thread overlord::function_c1c677ed7a1b1128("<unknown string>", level.players);
                break;
            case 3:
                thread overlord::function_c1c677ed7a1b1128("<unknown string>", level.players);
                break;
            }
        } else if (params[0] == "<unknown string>") {
            switch (level.var_24b61da48c7bdf06.var_aa29def91aae98bd) {
            case 0:
                thread overlord::function_d87d5deb069bf8e5("<unknown string>", level.players);
                break;
            case 1:
                thread overlord::function_d87d5deb069bf8e5("<unknown string>", level.players);
                break;
            case 2:
                thread overlord::function_d87d5deb069bf8e5("<unknown string>", level.players);
                break;
            case 3:
                thread overlord::function_d87d5deb069bf8e5("<unknown string>", level.players);
                break;
            }
        } else if (params[1] == "<unknown string>") {
            thread overlord::function_c1c677ed7a1b1128(params[0], level.players);
        } else {
            thread overlord::function_d87d5deb069bf8e5(params[0], level.players);
        }
    #/
}

// Namespace namespace_24b61da48c7bdf06/namespace_6776e8e74ed64842
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5e48
// Size: 0x20
function function_fb316270994fd943(notification, delay) {
    /#
        level endon(notification);
        wait(delay);
        level notify(notification);
    #/
}

