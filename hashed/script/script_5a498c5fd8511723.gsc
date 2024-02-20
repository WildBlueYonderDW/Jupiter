// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_24f248b33b79e48d;
#using script_6617e2f2bb62b52b;
#using script_6d3eb7a3bb982cc6;
#using scripts\mp\hud_message.gsc;
#using script_7ab5b649fa408138;
#using script_1f97a44d1761c919;

#namespace namespace_3de30dc9c2f4b908;

// Namespace namespace_3de30dc9c2f4b908/namespace_96a55c613106c121
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15f
// Size: 0x2e
function function_b128dd1bd8150fb3(players, var_8c3a7a19c10ecf05, var_283e7af20911133a, var_7bf6ef44012436e7) {
    namespace_62c11776e6b6ad74::function_516fd8a6749c3726(players, var_8c3a7a19c10ecf05, var_283e7af20911133a);
}

// Namespace namespace_3de30dc9c2f4b908/namespace_96a55c613106c121
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x194
// Size: 0x10d
function function_c235ffb8f79c155a(players, var_fd3a1a12222b4b9a, var_8c3a7a19c10ecf05, var_283e7af20911133a) {
    var_e9e6321a1c31c89c = function_f26baa739c00a3c7(var_8c3a7a19c10ecf05);
    var_daf9aec8006b0c35 = function_dbb11dc6ea65794e(var_8c3a7a19c10ecf05);
    if (var_283e7af20911133a == 0 || var_283e7af20911133a == 1) {
        if (!isarray(players)) {
            players = [0:players];
        }
        var_6d205bc49d8616d5 = undefined;
        var_949db43ec6f96c1e = function_684411bce1d1c8bc(var_fd3a1a12222b4b9a, var_8c3a7a19c10ecf05, 0);
        if (isdefined(var_949db43ec6f96c1e) && var_949db43ec6f96c1e.type == "Integer") {
            var_6d205bc49d8616d5 = var_949db43ec6f96c1e.value;
        }
        foreach (player in players) {
            player thread namespace_44abc05161e2e2cb::showsplash(var_e9e6321a1c31c89c, var_6d205bc49d8616d5, undefined, undefined, 1, var_daf9aec8006b0c35);
        }
    }
}

// Namespace namespace_3de30dc9c2f4b908/namespace_96a55c613106c121
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a8
// Size: 0xcd
function function_a40cc36677592f02(players, var_8c3a7a19c10ecf05, var_283e7af20911133a) {
    music = function_79dc6a4dd519d5cd(var_8c3a7a19c10ecf05);
    music = function_53c4c53197386572(music, "");
    delay = function_8cc6c17907ab41bf(var_8c3a7a19c10ecf05);
    delay = function_53c4c53197386572(delay, 0);
    if (!isarray(players)) {
        players = [0:players];
    }
    if (var_283e7af20911133a == 0 || var_283e7af20911133a == 1) {
        var_f1e5dd9037c67cd6 = namespace_e688cd9db0404268::function_17ee301cf0b5ba85(music);
        if (var_f1e5dd9037c67cd6 == "" && music != "") {
            var_f1e5dd9037c67cd6 = music;
        }
        level delaythread(delay, &namespace_e688cd9db0404268::function_fe75a89529dd0fd0, players, var_f1e5dd9037c67cd6);
    } else if (var_283e7af20911133a == 2) {
        level namespace_e688cd9db0404268::function_fe75a89529dd0fd0(players, "");
    }
}

// Namespace namespace_3de30dc9c2f4b908/namespace_96a55c613106c121
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37c
// Size: 0xb3
function function_28b732afbadec198(players, var_8c3a7a19c10ecf05, var_283e7af20911133a) {
    var_af517be3a4fc936d = function_84ac089886facee5(var_8c3a7a19c10ecf05);
    var_68065a8cd9f9f25f = function_ffbb8d6b4076cfa7(var_8c3a7a19c10ecf05);
    var_68065a8cd9f9f25f = function_53c4c53197386572(var_68065a8cd9f9f25f, 0);
    var_384817145e09d4c6 = function_5be1a4fd3bd9c0a7(var_8c3a7a19c10ecf05);
    var_9a3d6fbdec2364cf = function_63b7c6f0e6f2a9f7(var_8c3a7a19c10ecf05);
    if (var_283e7af20911133a == 0 || var_283e7af20911133a == 1) {
        if (!isarray(players)) {
            players = [0:players];
        }
        if (var_384817145e09d4c6) {
            thread namespace_446fc987a980892f::function_c1c677ed7a1b1128(var_af517be3a4fc936d, players, var_68065a8cd9f9f25f, var_9a3d6fbdec2364cf);
        } else {
            thread namespace_446fc987a980892f::function_d87d5deb069bf8e5(var_af517be3a4fc936d, players, var_68065a8cd9f9f25f);
        }
    }
}

// Namespace namespace_3de30dc9c2f4b908/namespace_96a55c613106c121
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x436
// Size: 0x1a2
function function_ade09b145f54d395(players, var_fd3a1a12222b4b9a, var_8c3a7a19c10ecf05, var_283e7af20911133a) {
    var_c10415b6394096cc = function_61d68ed67d014ce9(var_8c3a7a19c10ecf05);
    var_951f3c1cbdaaf7f7 = function_35f7a3c169395432(var_8c3a7a19c10ecf05);
    var_ca55cf4e0ae3bd64 = function_2e71b566ccbca32a(var_8c3a7a19c10ecf05);
    if (var_283e7af20911133a == 0 || var_283e7af20911133a == 1) {
        var_24db96216c5f6124 = undefined;
        if (var_951f3c1cbdaaf7f7 == "dynamic") {
            var_949db43ec6f96c1e = function_684411bce1d1c8bc(var_fd3a1a12222b4b9a, var_8c3a7a19c10ecf05, 0);
            if (isdefined(var_949db43ec6f96c1e)) {
                if (var_949db43ec6f96c1e.type == "ProgressTracker") {
                    var_5414a0c8b564c288 = var_949db43ec6f96c1e.value;
                    var_282d8fbc14c52547 = function_298a9e5ee57b3737(var_949db43ec6f96c1e.format, var_5414a0c8b564c288.var_cc3e7fbaface5a17, var_5414a0c8b564c288.var_621cb2c0d9b1cdae, var_5414a0c8b564c288.var_b76b3aee05993635);
                    var_24db96216c5f6124 = [0:0];
                } else {
                    var_24db96216c5f6124 = var_949db43ec6f96c1e.value;
                }
            }
        } else {
            var_24db96216c5f6124 = function_5a2dda4763cf5dcb(var_8c3a7a19c10ecf05);
        }
        if (istrue(var_ca55cf4e0ae3bd64)) {
            if (!isarray(players)) {
                players = [0:players];
            }
            foreach (player in players) {
                player setclientomnvar(var_c10415b6394096cc, var_24db96216c5f6124);
            }
        } else {
            setomnvar(var_c10415b6394096cc, var_24db96216c5f6124);
        }
    }
}

// Namespace namespace_3de30dc9c2f4b908/namespace_96a55c613106c121
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5df
// Size: 0xab
function function_cae24eff8bdddc4(players, var_fd3a1a12222b4b9a, var_283e7af20911133a) {
    /#
        assert(var_fd3a1a12222b4b9a function_54ad2295d6995862() == "TitleSplash");
    #/
    var_d9772a53958eabc6 = var_fd3a1a12222b4b9a function_7437a8d48556e45e();
    if (var_d9772a53958eabc6.size == 0) {
        return;
    }
    for (var_e544eba5148ba75e = 0; var_e544eba5148ba75e < var_d9772a53958eabc6.size; var_e544eba5148ba75e++) {
        var_479a4f2240611b51 = var_d9772a53958eabc6[var_e544eba5148ba75e];
        if (function_feb90d1dee0c97d1(var_479a4f2240611b51) == "Types_Activity_SplashReferenceData") {
            function_c235ffb8f79c155a(players, var_fd3a1a12222b4b9a, var_479a4f2240611b51, var_283e7af20911133a);
        } else {
            /#
                assertmsg("Default handling of BroadcastType_TitleSplash doesn't yet support the data object type: " + var_479a4f2240611b51.type);
            #/
        }
    }
}

// Namespace namespace_3de30dc9c2f4b908/namespace_96a55c613106c121
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x691
// Size: 0x7d
function function_ef5f9ace0e2bad4e(players, broadcast, var_283e7af20911133a) {
    /#
        assert(broadcast function_54ad2295d6995862() == "Music");
    #/
    var_d9772a53958eabc6 = broadcast function_7437a8d48556e45e();
    if (var_d9772a53958eabc6.size == 0) {
        return;
    }
    for (var_e544eba5148ba75e = 0; var_e544eba5148ba75e < var_d9772a53958eabc6.size; var_e544eba5148ba75e++) {
        var_479a4f2240611b51 = var_d9772a53958eabc6[var_e544eba5148ba75e];
        function_a40cc36677592f02(players, var_479a4f2240611b51, var_283e7af20911133a);
    }
}

// Namespace namespace_3de30dc9c2f4b908/namespace_96a55c613106c121
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x715
// Size: 0x7d
function function_7a518dd08fe0d34e(players, broadcast, var_283e7af20911133a) {
    /#
        assert(broadcast function_54ad2295d6995862() == "Overlord");
    #/
    var_d9772a53958eabc6 = broadcast function_7437a8d48556e45e();
    if (var_d9772a53958eabc6.size == 0) {
        return;
    }
    for (var_e544eba5148ba75e = 0; var_e544eba5148ba75e < var_d9772a53958eabc6.size; var_e544eba5148ba75e++) {
        var_479a4f2240611b51 = var_d9772a53958eabc6[var_e544eba5148ba75e];
        function_28b732afbadec198(players, var_479a4f2240611b51, var_283e7af20911133a);
    }
}

// Namespace namespace_3de30dc9c2f4b908/namespace_96a55c613106c121
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x799
// Size: 0x7e
function function_174054d9a5f63554(players, var_fd3a1a12222b4b9a, var_283e7af20911133a) {
    /#
        assert(var_fd3a1a12222b4b9a function_54ad2295d6995862() == "Omnvar");
    #/
    var_d9772a53958eabc6 = var_fd3a1a12222b4b9a function_7437a8d48556e45e();
    if (var_d9772a53958eabc6.size == 0) {
        return;
    }
    for (var_e544eba5148ba75e = 0; var_e544eba5148ba75e < var_d9772a53958eabc6.size; var_e544eba5148ba75e++) {
        var_479a4f2240611b51 = var_d9772a53958eabc6[var_e544eba5148ba75e];
        function_ade09b145f54d395(players, var_fd3a1a12222b4b9a, var_479a4f2240611b51, var_283e7af20911133a);
    }
}

