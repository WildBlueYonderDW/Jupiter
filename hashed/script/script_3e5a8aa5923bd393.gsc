// mwiii decomp prototype
#using script_5a37c8d34c31ea89;
#using script_5dfa1fb6b030bdcb;
#using script_6981400abfcd765c;
#using script_5693b37bfb748170;
#using script_32d93a194074fa6a;
#using script_530f3ea26428deba;
#using scripts\mp\utility\game.gsc;
#using scripts\engine\utility.gsc;
#using script_239a365a92ee4476;
#using script_782ed84671b152fb;
#using script_44102c05f33e9b1e;
#using scripts\mp\gametypes\br_dev.gsc;

#namespace namespace_80433d506bc4a412;

// Namespace namespace_80433d506bc4a412/namespace_13e4e9def5bc390d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf7
// Size: 0x59
function init() {
    function_c5ebc1fd82f62050();
    if (function_94b952789d039abb()) {
        function_a6ca80cf4f22e262("ftuetiplist:ftuetips_list_br");
        function_34c0594d8a03efe4("JUP_BR");
        function_8d0bcd24e525ca55();
        thread namespace_91fad7208d9cd856::init(&namespace_a1922e5b976f9ad7::function_9fcc9920ba3dbe3, undefined, &namespace_a1922e5b976f9ad7::function_8d9c94a186b2f39a, &namespace_d3289d7a0f087014::function_58583531a63a9abb);
        /#
            namespace_e4c20df2c9115a56::registerhandlecommand(&function_f0581ccaa73a651d);
        #/
    }
}

// Namespace namespace_80433d506bc4a412/namespace_13e4e9def5bc390d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x157
// Size: 0x11
function private function_c5ebc1fd82f62050() {
    level.var_114256fded8103cd = "ftueDataWZ";
}

// Namespace namespace_80433d506bc4a412/namespace_13e4e9def5bc390d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x16f
// Size: 0x3
function private function_6a00940e598a7d11() {
    
}

// Namespace namespace_80433d506bc4a412/namespace_13e4e9def5bc390d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x179
// Size: 0xf9
function function_f0581ccaa73a651d(command, args) {
    /#
        switch (command) {
        case #"hash_b5a6af7cf5041e12":
            namespace_91fad7208d9cd856::function_69d2bf97401ca611(args[0]);
            break;
        case #"hash_a68a5252e80fe0a7":
            if (!isdefined(args) || args.size == 0) {
                var_40145099a2bf47ca = 0;
            } else {
                var_40145099a2bf47ca = namespace_b97271dc63a81cc0::function_1e6d534caef3039f();
                foreach (var_4b2538e850df3357 in args) {
                    var_34e326b47a846f0b = namespace_91fad7208d9cd856::function_b4641ae08979f8ce(var_4b2538e850df3357);
                    if (isdefined(var_34e326b47a846f0b)) {
                        mask = 1 << var_34e326b47a846f0b;
                        var_40145099a2bf47ca = var_40145099a2bf47ca & ~mask;
                    }
                }
            }
            namespace_b97271dc63a81cc0::function_a25d14ecf8dcb49e(var_40145099a2bf47ca);
            break;
        default:
            break;
        }
    #/
}

