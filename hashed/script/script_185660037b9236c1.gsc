// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_413d0426f154bd91;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_3e31016b9c11a616;
#using script_5d8202968463a21d;
#using script_6617e2f2bb62b52b;
#using script_41387eecc35b88bf;
#using script_79deab1955343d5d;
#using script_6cf3c7c08335321b;
#using script_2707474774db34b;
#using script_220d0eb95a8fab7d;
#using script_7956d56c4922bd1;
#using script_4ef01fe6151dde4d;
#using script_4fdefae8b7bcdf73;
#using script_5753ba9c28794a65;
#using script_3ab210ea917601e7;
#using script_24f248b33b79e48d;
#using script_5815a7cb4d944542;
#using script_3ac7886f9e4eceef;
#using script_4d39bd4c621e7680;

#namespace namespace_4fda5d7358015a06;

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xafb
// Size: 0x9c
function function_c71c80e21eeb98b0() {
    function_8b5b2a3392fc7e2a("PlayerJoin", &function_9a40bf3502fe45f);
    function_8b5b2a3392fc7e2a("PlayerLeave", &function_d3d9ead84b5ad147);
    function_8b5b2a3392fc7e2a("PlayerAbandon", &function_236c3a4a9216f248);
    function_8b5b2a3392fc7e2a("InstanceBegin", &function_7a00a458019b00d3);
    function_8b5b2a3392fc7e2a("ActivityBegin", &function_7a00a458019b00d3);
    function_8b5b2a3392fc7e2a("InstanceEnd", &function_7a00a458019b00d3);
    function_8b5b2a3392fc7e2a("ActivityEnd", &function_7a00a458019b00d3);
    function_8b5b2a3392fc7e2a("PlayerJoin", &function_d58bbda1de18e318);
    function_8b5b2a3392fc7e2a("PlayerLeave", &function_d58bbda1de18e318);
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb9e
// Size: 0xbc
function function_67f4d8928c638abb(var_af0662d6485d5d58, var_626b45032e1892da, var_d948c61dfdb971cb, var_9334fa52c33d9f6e) {
    if (!function_34d878874ef424(var_626b45032e1892da)) {
        function_98e66628b697874f([0:var_626b45032e1892da]);
        if (!function_34d878874ef424(var_626b45032e1892da)) {
            /#
                assertmsg("No Activity definitions have been registered with this variant tag: " + var_626b45032e1892da);
            #/
            return;
        }
    }
    var_7669bfa60fd97d51 = level.var_83abcb9b3a5dbe24.var_1d3d12d95e2fc1a5[var_626b45032e1892da];
    var_c8992e431d7ba2c8 = function_5caf0b462f4d7243(var_7669bfa60fd97d51);
    var_c4f9b0bf67170f6f = function_6cf69755ac283f1e(var_626b45032e1892da, var_af0662d6485d5d58, var_c8992e431d7ba2c8, var_9334fa52c33d9f6e);
    function_6d0db4a1a5cc2157(var_c4f9b0bf67170f6f);
    function_f541e4e4edaa8e99(1, [0:var_c4f9b0bf67170f6f, 1:var_d948c61dfdb971cb], 0);
    return var_c4f9b0bf67170f6f;
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc62
// Size: 0x1a
function function_b6fc2c96b463c007(var_e6013eac45290cab) {
    thread function_f020477c47b9be94(var_e6013eac45290cab, "ActiveState");
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc83
// Size: 0x19
function function_4bc22996edea81f1(var_e6013eac45290cab) {
    function_f509fac14c3cdb1d(var_e6013eac45290cab, "CleanupState");
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xca3
// Size: 0x19
function function_556db65cfad56c7c(var_e6013eac45290cab) {
    function_f509fac14c3cdb1d(var_e6013eac45290cab, "ActiveState");
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc3
// Size: 0x53
function function_72e6923833378e5d(var_c1a3a9cf7d2963b8) {
    var_e6013eac45290cab = var_c1a3a9cf7d2963b8[0];
    var_838185e7a405fe33 = var_c1a3a9cf7d2963b8[1];
    var_e6013eac45290cab endon("activity_ended");
    var_e6013eac45290cab endon("instance_destroyed");
    function_1e3f083d84bd04e(var_e6013eac45290cab, var_838185e7a405fe33);
    waitframe();
    function_104adc18c0d699c3(var_e6013eac45290cab, 0);
    waitframe();
    function_84f0d4362b882db3(var_e6013eac45290cab);
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd1d
// Size: 0x62
function function_612d18fdbc979c0b(var_e6013eac45290cab, ActivitySuccess) {
    var_ef64095e6090cac4 = function_73bd348a2ec322cf(var_e6013eac45290cab);
    if (var_ef64095e6090cac4 != "ActiveState") {
        /#
            assertmsg("Attempting to End an activity that is not in its Active state. Current Activity State: " + var_ef64095e6090cac4);
        #/
        return;
    }
    if (ActivitySuccess) {
        function_e56283e3cbfa05ad(var_e6013eac45290cab);
    } else {
        function_27251a5a24d92d28(var_e6013eac45290cab);
    }
    level thread function_c4ea67b937f27c4a(var_e6013eac45290cab);
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd86
// Size: 0xbf
function function_ce906635a152d2d0(var_e6013eac45290cab, var_8436ec5bdd7c457d, var_6f8af5eb76deac21) {
    if (!isdefined(var_6f8af5eb76deac21)) {
        var_6f8af5eb76deac21 = spawnstruct();
    }
    if (!isdefined(var_6f8af5eb76deac21.playerlist)) {
        var_6f8af5eb76deac21.playerlist = var_e6013eac45290cab.var_6c29f2fdb0054bbe;
    }
    var_6f8af5eb76deac21.var_8436ec5bdd7c457d = var_8436ec5bdd7c457d;
    var_e6013eac45290cab function_1281c7fff9456e18(var_8436ec5bdd7c457d, var_6f8af5eb76deac21.playerlist);
    var_e6013eac45290cab function_ca585715158d49fa(var_8436ec5bdd7c457d);
    function_49f447d3531edf7e(var_e6013eac45290cab, "ActivationName", var_8436ec5bdd7c457d, var_6f8af5eb76deac21.var_e0a0dc78cd0e70f3, var_6f8af5eb76deac21.var_44fadde66021a763);
    function_c662924b60a37407("Custom Activity Moment: " + var_8436ec5bdd7c457d, @"hash_22e4e38cab273e93", var_e6013eac45290cab, var_6f8af5eb76deac21.playerlist);
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe4c
// Size: 0xdb
function function_735ee8e9d0f1b00b(var_e6013eac45290cab, var_ffc5db804c3eff2c, var_6f8af5eb76deac21) {
    if (!isdefined(var_6f8af5eb76deac21)) {
        var_6f8af5eb76deac21 = spawnstruct();
    }
    if (!isdefined(var_6f8af5eb76deac21.playerlist)) {
        var_6f8af5eb76deac21.playerlist = var_e6013eac45290cab.var_6c29f2fdb0054bbe;
    }
    var_6f8af5eb76deac21.var_ffc5db804c3eff2c = var_ffc5db804c3eff2c;
    var_e6013eac45290cab function_484f9658b565df53(var_ffc5db804c3eff2c, var_6f8af5eb76deac21.playerlist);
    var_e6013eac45290cab function_8350a7df2508a779(var_ffc5db804c3eff2c);
    function_47a5129abc55bd53(var_e6013eac45290cab, var_ffc5db804c3eff2c);
    namespace_779ebc650a9ef856::function_dfe0a21d9848315e(var_e6013eac45290cab, var_ffc5db804c3eff2c);
    function_49f447d3531edf7e(var_e6013eac45290cab, var_ffc5db804c3eff2c, undefined, var_6f8af5eb76deac21.var_e0a0dc78cd0e70f3, var_6f8af5eb76deac21.var_44fadde66021a763);
    var_e6013eac45290cab function_42ab09fd1c5bf443(var_ffc5db804c3eff2c, var_6f8af5eb76deac21);
    var_e6013eac45290cab notify(var_ffc5db804c3eff2c);
    function_c662924b60a37407("Activity Moment: " + var_ffc5db804c3eff2c, @"hash_22e4e38cab273e93", var_e6013eac45290cab, var_6f8af5eb76deac21.playerlist);
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf2e
// Size: 0x17
function function_f0f498aed6f8fa5d(var_e6013eac45290cab) {
    return var_e6013eac45290cab.id;
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf4d
// Size: 0x17
function function_73bd348a2ec322cf(var_e6013eac45290cab) {
    return var_e6013eac45290cab.state;
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf6c
// Size: 0x18
function function_42a842295fe70a62(var_e6013eac45290cab) {
    return var_e6013eac45290cab.var_6c29f2fdb0054bbe.size;
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf8c
// Size: 0x17
function function_a4748b32a824c79c(var_e6013eac45290cab) {
    return var_e6013eac45290cab.var_626b45032e1892da;
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfab
// Size: 0x17
function function_de53ed8e35d0ed7a(var_e6013eac45290cab) {
    return var_e6013eac45290cab.type;
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfca
// Size: 0x17
function function_511be8bcaede8b52(var_e6013eac45290cab) {
    return var_e6013eac45290cab.category;
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe9
// Size: 0x17
function function_dd58016ab8a9a3e0(var_e6013eac45290cab) {
    return var_e6013eac45290cab.var_34d9cc6234f0bf2e;
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1008
// Size: 0x17
function function_40d5384184be8e3c(var_e6013eac45290cab) {
    return var_e6013eac45290cab.var_17a2361aa0beabb2;
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1027
// Size: 0x17
function function_e931f3b80616c348(var_e6013eac45290cab) {
    return var_e6013eac45290cab.var_1f01d52ce920a114;
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1046
// Size: 0x17
function function_2dabe17056c2563f(var_e6013eac45290cab) {
    return var_e6013eac45290cab.var_c083bd8353c655c1;
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1065
// Size: 0x4c
function function_bdd22095c4312f34(var_e6013eac45290cab) {
    var_ef64095e6090cac4 = function_73bd348a2ec322cf(var_e6013eac45290cab);
    var_3c43be955417f9f8 = var_ef64095e6090cac4 == "EndedState" || var_ef64095e6090cac4 == "CleanupState";
    return var_3c43be955417f9f8 && istrue(var_e6013eac45290cab.var_8b79601f5cca1fa9);
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10b9
// Size: 0x3d
function function_6daf2e19ef224d27(var_e6013eac45290cab, var_8e6c09b94b1b967b) {
    if (!isdefined(var_e6013eac45290cab.var_9a577a7ebc413d46[var_8e6c09b94b1b967b]) || var_e6013eac45290cab.var_9a577a7ebc413d46[var_8e6c09b94b1b967b] == 0) {
        return 1;
    }
    return 0;
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10fe
// Size: 0x22
function function_1c67ae607a61c6bb(var_3737fa2f2fc68a50) {
    return isstruct(var_3737fa2f2fc68a50) && istrue(var_3737fa2f2fc68a50.var_1c67ae607a61c6bb);
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1128
// Size: 0x17
function function_b1e0c431ac8df0ed(var_e6013eac45290cab) {
    return var_e6013eac45290cab.var_14a8920a25d8a7a1;
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1147
// Size: 0x4d
function function_297dc42ebf4f3b04(var_e6013eac45290cab, omnvar) {
    if (!var_e6013eac45290cab function_6a26856f16c6a207(omnvar)) {
        /#
            assertmsg("The Omnvar (" + omnvar + ") value you are asking for was not found on the Activity Instance");
        #/
        return undefined;
    }
    var_f6c1c21bd8e20e52 = var_e6013eac45290cab function_e989e3f023f50368(omnvar);
    return var_f6c1c21bd8e20e52[0];
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x119c
// Size: 0x4e
function function_402e97e252bb33ff(var_e6013eac45290cab, omnvar) {
    if (!var_e6013eac45290cab function_6a26856f16c6a207(omnvar)) {
        /#
            assertmsg("The Omnvar (" + omnvar + ") reset value you are asking for was not found on the Activity Instance");
        #/
        return undefined;
    }
    var_f6c1c21bd8e20e52 = var_e6013eac45290cab function_e989e3f023f50368(omnvar);
    return var_f6c1c21bd8e20e52[1];
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11f2
// Size: 0x52
function function_73354d36b8ec6cb8(var_e6013eac45290cab) {
    var_af0662d6485d5d58 = function_de53ed8e35d0ed7a(var_e6013eac45290cab);
    var_37bed97b2b3d92ab = function_811a0fab09c793ce(var_af0662d6485d5d58, 4);
    var_d041598dbdb3fddd = &function_dfea1c389f5d4f78;
    if (isdefined(var_37bed97b2b3d92ab) && var_37bed97b2b3d92ab != var_d041598dbdb3fddd) {
        return 1;
    }
    return 0;
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x124c
// Size: 0xa5
function function_8988a4c89289d7f4(var_e6013eac45290cab) {
    /#
        assertex(function_1c67ae607a61c6bb(var_e6013eac45290cab), "This function requires that an Activity Instance struct is passed in as an argument");
    #/
    centerpoint = undefined;
    var_af0662d6485d5d58 = function_de53ed8e35d0ed7a(var_e6013eac45290cab);
    if (function_538af8a5b8170d0c(var_af0662d6485d5d58, 4)) {
        centerpoint = function_104adc18c0d699c3(var_e6013eac45290cab, 4);
    }
    if (!isdefined(centerpoint) && isdefined(var_e6013eac45290cab.var_35ee2a06aa1f8973)) {
        centerpoint = var_e6013eac45290cab.var_35ee2a06aa1f8973;
    }
    if (!isdefined(centerpoint)) {
        centerpoint = var_e6013eac45290cab function_dfea1c389f5d4f78();
    }
    /#
        assertex(isdefined(centerpoint), "A center point for this activity is being requested without being specified in the Script Bundle. Add a center struct to the SB or register a center region callback.");
    #/
    var_e6013eac45290cab.var_35ee2a06aa1f8973 = centerpoint;
    return centerpoint;
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12f9
// Size: 0x29
function function_be6214edfe52a31(var_e6013eac45290cab) {
    var_ee373e1060f9863f = function_dd58016ab8a9a3e0(var_e6013eac45290cab);
    return var_ee373e1060f9863f.var_404ec7a436f43edf;
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x132a
// Size: 0x17
function function_4481ee309bf2c75c(var_e6013eac45290cab) {
    return var_e6013eac45290cab.var_92fa97419a712aef;
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1349
// Size: 0x2a
function function_cdea2ef0bf179c63(var_e6013eac45290cab) {
    var_ee373e1060f9863f = function_dd58016ab8a9a3e0(var_e6013eac45290cab);
    return istrue(var_ee373e1060f9863f.var_821230cb7573c0ae);
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x137b
// Size: 0x18
function function_c88d7a6286056b09(var_e6013eac45290cab) {
    return istrue(var_e6013eac45290cab.var_a9eaa93599f7c5c6);
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x139b
// Size: 0x2a
function function_5e6325794597e387(var_e6013eac45290cab) {
    var_ee373e1060f9863f = function_dd58016ab8a9a3e0(var_e6013eac45290cab);
    return istrue(var_ee373e1060f9863f.var_9cc81390bae90155);
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13cd
// Size: 0x53
function function_d079465d310f745b(var_e6013eac45290cab, var_d1593f8a858fd13d) {
    var_e6013eac45290cab.var_c083bd8353c655c1 = function_6d6af8144a5131f1(var_e6013eac45290cab.var_c083bd8353c655c1, var_d1593f8a858fd13d);
    function_c662924b60a37407("List of Players Who Deserve Rewards Updated.", @"hash_22e4e38cab273e93", var_e6013eac45290cab, var_e6013eac45290cab.var_c083bd8353c655c1);
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1427
// Size: 0xec
function function_dca86aca511288f4(var_e6013eac45290cab, var_8e6c09b94b1b967b, var_f15a9eca8a072350) {
    if (!isdefined(var_e6013eac45290cab.var_9a577a7ebc413d46[var_8e6c09b94b1b967b])) {
        var_e6013eac45290cab.var_9a577a7ebc413d46[var_8e6c09b94b1b967b] = 0;
    }
    var_e6013eac45290cab.var_9a577a7ebc413d46[var_8e6c09b94b1b967b] = var_e6013eac45290cab.var_9a577a7ebc413d46[var_8e6c09b94b1b967b] + 1;
    var_fab326681eaecf8f = @"hash_22e4e38cab273e93";
    if (function_2a1e9879f71ab677(var_fab326681eaecf8f)) {
        var_8d76efe839af5d68 = var_e6013eac45290cab.var_9a577a7ebc413d46[var_8e6c09b94b1b967b];
        var_b6444f5d6f018b11 = "State Transition Blocker Added. There are now: " + var_8d76efe839af5d68 + " blockers for this state: " + var_8e6c09b94b1b967b + ".";
        var_41db0942d065e934 = (isdefined(var_f15a9eca8a072350) && isstring(var_f15a9eca8a072350) ? " Reason for additional blocker: " + var_f15a9eca8a072350 : "") + ".";
        function_c662924b60a37407(var_b6444f5d6f018b11 + var_41db0942d065e934, var_fab326681eaecf8f, var_e6013eac45290cab);
    }
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x151a
// Size: 0xec
function function_20e36ec9e5802d01(var_e6013eac45290cab, var_8e6c09b94b1b967b, var_f15a9eca8a072350) {
    if (isdefined(var_e6013eac45290cab.var_9a577a7ebc413d46[var_8e6c09b94b1b967b])) {
        var_e6013eac45290cab.var_9a577a7ebc413d46[var_8e6c09b94b1b967b] = max(var_e6013eac45290cab.var_9a577a7ebc413d46[var_8e6c09b94b1b967b] - 1, 0);
        var_e6013eac45290cab notify("activity_state_transition_blocker_removed");
    }
    var_fab326681eaecf8f = @"hash_22e4e38cab273e93";
    if (function_2a1e9879f71ab677(var_fab326681eaecf8f)) {
        var_8d76efe839af5d68 = var_e6013eac45290cab.var_9a577a7ebc413d46[var_8e6c09b94b1b967b];
        var_b6444f5d6f018b11 = "State Transition Blocker Removed. There are now: " + var_8d76efe839af5d68 + " blockers for this state: " + var_8e6c09b94b1b967b + ".";
        var_41db0942d065e934 = (isdefined(var_f15a9eca8a072350) && isstring(var_f15a9eca8a072350) ? " Reason for blocker removal: " + var_f15a9eca8a072350 : "") + ".";
        function_c662924b60a37407(var_b6444f5d6f018b11 + var_41db0942d065e934, var_fab326681eaecf8f, var_e6013eac45290cab);
    }
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x160d
// Size: 0x78
function function_62b3e2a4e6e15396(var_e6013eac45290cab, var_915dd3ba12be1864, var_4d81c61149496fc4) {
    var_31bde88d6f43cbbf = array_find(var_e6013eac45290cab.var_17a2361aa0beabb2, var_915dd3ba12be1864);
    var_894f71c9809e1a81 = !isdefined(var_31bde88d6f43cbbf);
    if (var_894f71c9809e1a81) {
        var_e6013eac45290cab.var_17a2361aa0beabb2[var_e6013eac45290cab.var_17a2361aa0beabb2.size] = var_915dd3ba12be1864;
        if (istrue(var_4d81c61149496fc4)) {
            namespace_779ebc650a9ef856::function_5b71b730bfefd36a(var_e6013eac45290cab, var_915dd3ba12be1864, "ActivityEnd");
        }
    }
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x168c
// Size: 0x85
function function_26857d3de8354d4e(var_e6013eac45290cab, omnvar, value, var_6040010016e75d95) {
    var_3bc5bab0e50c10e3 = var_e6013eac45290cab function_6a26856f16c6a207(omnvar);
    if (var_3bc5bab0e50c10e3) {
        var_e6013eac45290cab function_db95dd6225b6add8(omnvar, [0:value, 1:var_6040010016e75d95]);
    } else {
        var_e6013eac45290cab function_7d5b3426b48d62f0(omnvar, "Array", [0:value, 1:var_6040010016e75d95]);
        var_e6013eac45290cab.var_14a8920a25d8a7a1[var_e6013eac45290cab.var_14a8920a25d8a7a1.size] = omnvar;
    }
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1718
// Size: 0x6c
function function_e81ff3302ce5788b(var_e6013eac45290cab, var_a9eaa93599f7c5c6) {
    if (function_5e6325794597e387(var_e6013eac45290cab)) {
        var_950f481eaeeab025 = var_e6013eac45290cab.var_a9eaa93599f7c5c6;
        var_e6013eac45290cab.var_a9eaa93599f7c5c6 = var_a9eaa93599f7c5c6;
        if (istrue(var_a9eaa93599f7c5c6) && !var_950f481eaeeab025) {
            function_735ee8e9d0f1b00b(var_e6013eac45290cab, "ActivityStartedHibernation");
        } else if (var_950f481eaeeab025) {
            function_735ee8e9d0f1b00b(var_e6013eac45290cab, "ActivityStoppedHibernating");
        }
    }
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x178b
// Size: 0x24
function function_ff180ac87df3d300() {
    function_c662924b60a37407("No Setup Override Function found for activity. Running the default implementation instead", @"hash_22e4e38cab273e93", self, undefined, 2);
    function_b6fc2c96b463c007(self);
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17b6
// Size: 0x1c
function function_a0a0f0090c79260() {
    function_c662924b60a37407("No Begin Override Function found for activity. Running the default implementation instead", @"hash_22e4e38cab273e93", self, undefined, 2);
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17d9
// Size: 0x1c
function function_7cbe9a82eb78ca2c() {
    function_c662924b60a37407("No End Override Function found for activity. Running the default implementation instead", @"hash_22e4e38cab273e93", self, undefined, 2);
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17fc
// Size: 0x1c
function function_10752dbaaf34420f() {
    function_c662924b60a37407("No Destroy Override Function found for activity. Running the default implementation instead", @"hash_22e4e38cab273e93", self, undefined, 2);
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x181f
// Size: 0x84
function function_dfea1c389f5d4f78() {
    var_e6013eac45290cab = self;
    if (function_1888d1b2aeeda25(var_e6013eac45290cab, "Center_Spatial_Zone")) {
        var_845887ec9fc736c6 = function_5bbdc39a533d9d57(var_e6013eac45290cab, "Center_Spatial_Zone");
        /#
            assertex(var_845887ec9fc736c6.size == 1, "We expect to see only a single sphere definition for the Map Placed Center Zone");
        #/
        var_3cfa85dd68696451 = var_845887ec9fc736c6[0];
        return function_37c1f31d2434f628(var_3cfa85dd68696451);
    }
    function_c662924b60a37407("No Valid Override for activity Get Center function. Returning (0,0,0) instead.", @"hash_22e4e38cab273e93", var_e6013eac45290cab, undefined, 3);
    return (0, 0, 0);
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18ab
// Size: 0x22
function function_ccb42947700f2741() {
    var_92fa97419a712aef = spawnstruct();
    var_92fa97419a712aef.var_8695e1278af3995e = 1;
    return var_92fa97419a712aef;
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18d5
// Size: 0x22
function function_33a37cdc6d192d24(var_9f362f8b6fe8fe53) {
    return isstruct(var_9f362f8b6fe8fe53) && istrue(var_9f362f8b6fe8fe53.var_8695e1278af3995e);
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x18ff
// Size: 0x1c2
function private function_6cf69755ac283f1e(var_626b45032e1892da, var_af0662d6485d5d58, category, var_9334fa52c33d9f6e) {
    if (isdefined(var_9334fa52c33d9f6e)) {
        /#
            assertex(function_33a37cdc6d192d24(var_9334fa52c33d9f6e), "Additional Spawn Data was passed into this instance but it was not in the format of an Activity Instance Additional Spawn Data Struct.");
        #/
    } else {
        var_9334fa52c33d9f6e = function_ccb42947700f2741();
    }
    var_c4f9b0bf67170f6f = spawnstruct();
    var_c4f9b0bf67170f6f.var_626b45032e1892da = var_626b45032e1892da;
    var_c4f9b0bf67170f6f.id = function_43f81a2fd15f456();
    var_c4f9b0bf67170f6f.type = var_af0662d6485d5d58;
    var_c4f9b0bf67170f6f.category = function_53c4c53197386572(category, "None");
    var_c4f9b0bf67170f6f.var_92fa97419a712aef = var_9334fa52c33d9f6e;
    var_c4f9b0bf67170f6f.var_8b79601f5cca1fa9 = 0;
    var_c4f9b0bf67170f6f.score = 0;
    var_c4f9b0bf67170f6f.var_35ee2a06aa1f8973 = undefined;
    var_c4f9b0bf67170f6f.var_d953047f1b4c7c9 = undefined;
    var_c4f9b0bf67170f6f.state = "IdleState";
    var_c4f9b0bf67170f6f.var_1c67ae607a61c6bb = 1;
    var_c4f9b0bf67170f6f.var_a9eaa93599f7c5c6 = 0;
    var_c4f9b0bf67170f6f.var_34d9cc6234f0bf2e = spawnstruct();
    var_c4f9b0bf67170f6f.var_9a577a7ebc413d46 = [];
    var_c4f9b0bf67170f6f.var_6c29f2fdb0054bbe = [];
    var_c4f9b0bf67170f6f.var_c083bd8353c655c1 = [];
    var_c4f9b0bf67170f6f.var_47187a65a8fb783d = [];
    var_c4f9b0bf67170f6f.var_40b691c0a6852f73 = [];
    var_c4f9b0bf67170f6f.var_accc9cb5c57f8687 = [];
    var_c4f9b0bf67170f6f.var_21f1863c6d44d936 = [];
    var_c4f9b0bf67170f6f.var_67c56bf0b03688bf = [];
    var_c4f9b0bf67170f6f.var_17a2361aa0beabb2 = [];
    var_c4f9b0bf67170f6f.var_14a8920a25d8a7a1 = [];
    var_c4f9b0bf67170f6f.var_9767f7738e477df8 = undefined;
    function_99a59990b4652967(var_c4f9b0bf67170f6f);
    namespace_e82a1efb852543c9::function_4d1de11b1a5630ec(var_c4f9b0bf67170f6f);
    var_c4f9b0bf67170f6f namespace_e82a1efb852543c9::function_af4d87f338d86a53(&function_6fe8aa8dfb9111eb);
    return var_c4f9b0bf67170f6f;
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ac9
// Size: 0xa3
function private function_1e3f083d84bd04e(var_e6013eac45290cab, var_838185e7a405fe33) {
    function_290cf2ed36c04f4e(var_e6013eac45290cab);
    if (isdefined(var_838185e7a405fe33)) {
        if (function_1888d1b2aeeda25(var_e6013eac45290cab, "Center_Spatial_Zone")) {
            function_99ea7dc018941548(var_e6013eac45290cab, "Center_Spatial_Zone");
        }
        function_51ad14107ca158fb(var_e6013eac45290cab, "Center_Spatial_Zone", var_838185e7a405fe33);
    }
    if (!function_1888d1b2aeeda25(var_e6013eac45290cab, "Hibernation_Zone")) {
        function_8288c27883885909(var_e6013eac45290cab, "Hibernation_Zone");
    }
    function_bca93bc1f7ac851b(var_e6013eac45290cab);
    var_e6013eac45290cab function_25599e7b57187fba();
    function_4bae1139db07af24(var_e6013eac45290cab, "IdleState", "ActiveState");
    function_60e8ae157274f8a1(var_e6013eac45290cab);
    function_dca86aca511288f4(var_e6013eac45290cab, "ActiveState", "Waiting for initial Instance setup to be complete");
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b73
// Size: 0x33
function private function_84f0d4362b882db3(var_e6013eac45290cab) {
    function_735ee8e9d0f1b00b(var_e6013eac45290cab, "InstanceBegin");
    function_c990ea1181ca3c72(var_e6013eac45290cab);
    function_20e36ec9e5802d01(var_e6013eac45290cab, "ActiveState", "Initial Instance setup is now complete");
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1bad
// Size: 0xa3
function private function_352e2e45216e21e5(var_e6013eac45290cab) {
    function_735ee8e9d0f1b00b(var_e6013eac45290cab, "InstanceEnd");
    function_104adc18c0d699c3(var_e6013eac45290cab, 3);
    namespace_779ebc650a9ef856::function_d81c572daff63cf9(var_e6013eac45290cab);
    var_e6013eac45290cab function_a26e39e03a0d6739();
    function_b648a3057ae14ace(var_e6013eac45290cab);
    if (function_71d38726159c3f12(4)) {
        function_f541e4e4edaa8e99(4, [0:var_e6013eac45290cab], 1);
    }
    if (var_e6013eac45290cab.var_6c29f2fdb0054bbe.size > 0) {
        function_c662924b60a37407("Activity is about to be destroyed but still has participating players. This may be an issue if the activity has already gone through its 'End' state transition since no players are supposed to be participating at that time.", @"hash_22e4e38cab273e93", var_e6013eac45290cab, var_e6013eac45290cab.var_6c29f2fdb0054bbe, 2);
        function_887918ed2a888e8f(var_e6013eac45290cab);
    }
    function_d958ed0ac4ceaa91(var_e6013eac45290cab);
    var_e6013eac45290cab notify("instance_destroyed");
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c57
// Size: 0xa6
function private function_ebb378f45bd03af(var_e6013eac45290cab) {
    var_e6013eac45290cab endon("activity_started");
    function_735ee8e9d0f1b00b(var_e6013eac45290cab, "ActivityBegin");
    function_8e34ea43151530e4(var_e6013eac45290cab);
    foreach (player in var_e6013eac45290cab.var_6c29f2fdb0054bbe) {
        function_8269fc90973cf0f2(var_e6013eac45290cab, player);
    }
    if (function_71d38726159c3f12(2)) {
        function_f541e4e4edaa8e99(2, [0:var_e6013eac45290cab], 1);
    }
    function_104adc18c0d699c3(var_e6013eac45290cab, 1);
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d04
// Size: 0x5e
function private function_cea8c4728964c967(var_e6013eac45290cab) {
    function_735ee8e9d0f1b00b(var_e6013eac45290cab, "ActivityEnd");
    function_104adc18c0d699c3(var_e6013eac45290cab, 2);
    function_9e707430c4d9a988(var_e6013eac45290cab);
    if (function_71d38726159c3f12(3)) {
        function_f541e4e4edaa8e99(3, [0:var_e6013eac45290cab], 1);
    }
    var_e6013eac45290cab notify("activity_ended");
    waitframe();
    thread function_f020477c47b9be94(var_e6013eac45290cab, "CleanupState");
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d69
// Size: 0x87
function private function_e56283e3cbfa05ad(var_e6013eac45290cab) {
    foreach (player in var_e6013eac45290cab.var_6c29f2fdb0054bbe) {
        function_d079465d310f745b(var_e6013eac45290cab, player);
    }
    var_e6013eac45290cab.var_8b79601f5cca1fa9 = 1;
    function_735ee8e9d0f1b00b(var_e6013eac45290cab, "ActivitySuccess");
    var_e6013eac45290cab notify("activity_succeeded");
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1df7
// Size: 0x21
function private function_27251a5a24d92d28(var_e6013eac45290cab) {
    function_735ee8e9d0f1b00b(var_e6013eac45290cab, "ActivityFailure");
    var_e6013eac45290cab notify("activity_failed");
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e1f
// Size: 0x1b
function private function_c4ea67b937f27c4a(var_e6013eac45290cab) {
    waitframe();
    thread function_f020477c47b9be94(var_e6013eac45290cab, "EndedState");
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e41
// Size: 0x3f
function private function_9e707430c4d9a988(var_e6013eac45290cab) {
    var_e6013eac45290cab function_f3a73e1c537a55ae();
    var_e6013eac45290cab function_1c5d0098478465a();
    var_e6013eac45290cab function_f21a2c921f86f5a2(0);
    if (function_94e9b15c2db8c147(var_e6013eac45290cab)) {
        function_a0df260910df9e83(var_e6013eac45290cab);
    }
    function_887918ed2a888e8f(var_e6013eac45290cab);
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e87
// Size: 0x51
function private function_c60416581033254c(var_e6013eac45290cab, var_8f31733913565905, delaytime) {
    var_e6013eac45290cab endon("instance_destroyed");
    function_dca86aca511288f4(var_e6013eac45290cab, var_8f31733913565905, "Waiting for a " + delaytime + " second time delay to elapse");
    wait(delaytime);
    function_20e36ec9e5802d01(var_e6013eac45290cab, var_8f31733913565905, "The " + delaytime + " second time delay is over");
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1edf
// Size: 0x73
function private function_8e34ea43151530e4(var_e6013eac45290cab) {
    foreach (requestid, var_43c9ee7ec9270b3b in var_e6013eac45290cab.var_21f1863c6d44d936) {
        if (var_43c9ee7ec9270b3b.spawntype == 0) {
            function_55caa7ecdad1659c(requestid);
        }
    }
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1f59
// Size: 0xce
function private function_f509fac14c3cdb1d(var_e6013eac45290cab, var_27aead966092b192) {
    var_ef64095e6090cac4 = function_73bd348a2ec322cf(var_e6013eac45290cab);
    if (var_27aead966092b192 == "ActiveState" && var_ef64095e6090cac4 == "IdleState") {
        function_9f615e48fce63bf8(var_e6013eac45290cab, var_27aead966092b192);
        function_ebb378f45bd03af(var_e6013eac45290cab);
    } else if (var_27aead966092b192 == "EndedState" && var_ef64095e6090cac4 == "ActiveState") {
        function_9f615e48fce63bf8(var_e6013eac45290cab, var_27aead966092b192);
        function_4bae1139db07af24(var_e6013eac45290cab, "EndedState", "CleanupState");
        thread function_cea8c4728964c967(var_e6013eac45290cab);
    } else if (var_27aead966092b192 == "CleanupState" && var_ef64095e6090cac4 != "CleanupState") {
        function_9f615e48fce63bf8(var_e6013eac45290cab, var_27aead966092b192);
        if (var_ef64095e6090cac4 == "ActiveState" || var_ef64095e6090cac4 == "IdleState") {
            function_9e707430c4d9a988(var_e6013eac45290cab);
        }
        function_352e2e45216e21e5(var_e6013eac45290cab);
    }
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x202e
// Size: 0x3a
function private function_f020477c47b9be94(var_e6013eac45290cab, var_8e6c09b94b1b967b) {
    var_e6013eac45290cab endon("instance_destroyed");
    while (!function_6daf2e19ef224d27(var_e6013eac45290cab, var_8e6c09b94b1b967b)) {
        var_e6013eac45290cab waittill("activity_state_transition_blocker_removed");
    }
    function_f509fac14c3cdb1d(var_e6013eac45290cab, var_8e6c09b94b1b967b);
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x206f
// Size: 0xc6
function private function_4bae1139db07af24(var_e6013eac45290cab, var_f4db5b4567f88914, var_4048d341197bbe4b) {
    if (function_59244b295f5978b9(var_e6013eac45290cab, var_f4db5b4567f88914, var_4048d341197bbe4b)) {
        var_338c7fad3423f1f0 = function_1acdcfcf43076114(var_e6013eac45290cab, var_f4db5b4567f88914, var_4048d341197bbe4b);
        thread function_4eb3542e564b1ddc(var_e6013eac45290cab, var_4048d341197bbe4b, 1, var_338c7fad3423f1f0);
    }
    if (function_94f74d26e2e01494(var_e6013eac45290cab, var_f4db5b4567f88914, var_4048d341197bbe4b)) {
        radii = function_1eb80c239023070b(var_e6013eac45290cab, var_f4db5b4567f88914, var_4048d341197bbe4b);
        thread function_4eb3542e564b1ddc(var_e6013eac45290cab, var_4048d341197bbe4b, 0, radii);
    }
    if (function_df5092441b879128(var_e6013eac45290cab, var_f4db5b4567f88914, var_4048d341197bbe4b)) {
        if (function_e3a6cc803541a75f(var_e6013eac45290cab) > 0) {
            function_dca86aca511288f4(var_e6013eac45290cab, var_4048d341197bbe4b, "Waiting until minimum player count is met");
        }
    }
    if (function_64245919df413a31(var_e6013eac45290cab, var_f4db5b4567f88914, var_4048d341197bbe4b)) {
        delaytime = function_c4f6cd7b881d2e90(var_e6013eac45290cab, var_f4db5b4567f88914, var_4048d341197bbe4b);
        thread function_c60416581033254c(var_e6013eac45290cab, var_4048d341197bbe4b, delaytime);
    }
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x213c
// Size: 0x79
function private function_9a40bf3502fe45f(var_6f8af5eb76deac21) {
    playerlist = var_6f8af5eb76deac21.playerlist;
    foreach (player in playerlist) {
        if (isplayer(player)) {
            function_8269fc90973cf0f2(self, player);
        }
    }
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x21bc
// Size: 0x79
function private function_d3d9ead84b5ad147(var_6f8af5eb76deac21) {
    playerlist = var_6f8af5eb76deac21.playerlist;
    foreach (player in playerlist) {
        if (isplayer(player)) {
            function_bbf4d209e6b59a36(self, player);
        }
    }
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x223c
// Size: 0x7b
function private function_236c3a4a9216f248(var_6f8af5eb76deac21) {
    var_e6013eac45290cab = self;
    if (var_e6013eac45290cab.var_6c29f2fdb0054bbe.size == 0 && function_190ef47c1d23a8cb(var_e6013eac45290cab)) {
        var_8f31733913565905 = function_73bd348a2ec322cf(var_e6013eac45290cab);
        if (var_8f31733913565905 != "EndedState" && function_32b26700c8790a55(var_e6013eac45290cab)) {
            function_4bae1139db07af24(var_e6013eac45290cab, "EndedState", "CleanupState");
        }
        waitframe();
        function_f020477c47b9be94(var_e6013eac45290cab, "CleanupState");
    }
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x22be
// Size: 0xa1
function private function_8269fc90973cf0f2(var_e6013eac45290cab, player) {
    currentstate = function_73bd348a2ec322cf(var_e6013eac45290cab);
    if (currentstate == "ActiveState") {
        if (function_13d30c9eb7e77d36(var_e6013eac45290cab)) {
            player function_f2c3ee9fded6a3df(1);
        }
        if (function_aa25447f55e47fd0(var_e6013eac45290cab)) {
            player function_cb6c6cd4245c5551(1);
        }
        if (function_11a119965a805599(var_e6013eac45290cab)) {
            player function_aea2aa66a0043475();
        }
        if (function_d9004f88db27af5e(var_e6013eac45290cab)) {
            var_6c2912cf6ca76e62 = function_e8ef53cbeb6ab7e(var_e6013eac45290cab);
            loadout = function_32d0db3e4198e55d(var_6c2912cf6ca76e62);
            player function_76e32a123417cd84(loadout);
        }
    }
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2366
// Size: 0x86
function private function_bbf4d209e6b59a36(var_e6013eac45290cab, player) {
    currentstate = function_73bd348a2ec322cf(var_e6013eac45290cab);
    if (currentstate == "ActiveState" || currentstate == "EndedState") {
        if (function_13d30c9eb7e77d36(var_e6013eac45290cab)) {
            player function_f2c3ee9fded6a3df(0);
        }
        if (function_aa25447f55e47fd0(var_e6013eac45290cab)) {
            player function_cb6c6cd4245c5551(0);
        }
        if (function_11a119965a805599(var_e6013eac45290cab)) {
            player function_d942e259aef953c0();
        }
    }
    if (currentstate == "EndedState") {
        function_1015815db0b598c2(player, self);
    }
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x23f3
// Size: 0x21
function private function_9f615e48fce63bf8(var_e6013eac45290cab, var_37a95d32873b1ccc) {
    var_e6013eac45290cab.state = var_37a95d32873b1ccc;
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x241b
// Size: 0xfd
function private function_4eb3542e564b1ddc(var_e6013eac45290cab, var_8f31733913565905, var_1fb19f97544c77cd, var_3ba893af46bd0cf6) {
    var_e6013eac45290cab endon("instance_destroyed");
    var_fab326681eaecf8f = @"hash_22e4e38cab273e93";
    var_8d52f62e5d1ea317 = "Waiting until Player Proximity Changes";
    if (function_2a1e9879f71ab677(var_fab326681eaecf8f)) {
        if (istrue(var_1fb19f97544c77cd)) {
            var_8d52f62e5d1ea317 = "Waiting until Players are nearby";
        } else {
            var_8d52f62e5d1ea317 = "Waiting until Players are far away";
        }
    }
    function_dca86aca511288f4(var_e6013eac45290cab, var_8f31733913565905, var_8d52f62e5d1ea317);
    while (1) {
        var_e965bce0774276b4 = namespace_8480efeffcd6e233::function_7ec62d1550b9897e(var_e6013eac45290cab, var_3ba893af46bd0cf6);
        if (isdefined(var_e965bce0774276b4) && var_e965bce0774276b4.size > 0 && var_1fb19f97544c77cd) {
            break;
        } else if ((!isdefined(var_e965bce0774276b4) || var_e965bce0774276b4.size == 0) && !var_1fb19f97544c77cd) {
            break;
        }
        wait(1);
    }
    var_8d52f62e5d1ea317 = "Player Proximity Has Appropriately Changed";
    if (function_2a1e9879f71ab677(var_fab326681eaecf8f)) {
        if (istrue(var_1fb19f97544c77cd)) {
            var_8d52f62e5d1ea317 = "Players are now nearby";
        } else {
            var_8d52f62e5d1ea317 = "Players are now far enough away";
        }
    }
    function_20e36ec9e5802d01(var_e6013eac45290cab, var_8f31733913565905, var_8d52f62e5d1ea317);
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x251f
// Size: 0x97
function private function_7a00a458019b00d3(var_6f8af5eb76deac21) {
    var_e6013eac45290cab = self;
    var_7669bfa60fd97d51 = var_e6013eac45290cab function_4188e118731a30f4();
    var_a84449a9bd492279 = function_4c263c3baccae8b(var_7669bfa60fd97d51);
    var_7c0025e4cf44b11a = function_7e5077b9bfb018e2(var_7669bfa60fd97d51);
    if (!function_94e9b15c2db8c147(var_e6013eac45290cab)) {
        if (isdefined(var_a84449a9bd492279) && var_a84449a9bd492279 == var_6f8af5eb76deac21.var_ffc5db804c3eff2c) {
            function_3e33031646de23b0(var_e6013eac45290cab);
        }
    } else if (isdefined(var_7c0025e4cf44b11a) && var_7c0025e4cf44b11a == var_6f8af5eb76deac21.var_ffc5db804c3eff2c) {
        function_a0df260910df9e83(var_e6013eac45290cab);
    }
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x25bd
// Size: 0x6c
function private function_b648a3057ae14ace(var_e6013eac45290cab) {
    var_f0c94f7891c2887f = namespace_8480efeffcd6e233::function_803a3ef29d1b6598(var_e6013eac45290cab);
    foreach (var_3ba893af46bd0cf6 in var_f0c94f7891c2887f) {
        namespace_8480efeffcd6e233::function_d829ceb32b15c66a(var_e6013eac45290cab, var_3ba893af46bd0cf6);
    }
}

// Namespace namespace_4fda5d7358015a06/namespace_68dc261109a9503f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2630
// Size: 0x5f
function private function_bca93bc1f7ac851b(var_e6013eac45290cab) {
    function_caf8f45b7e3b78a2(var_e6013eac45290cab);
    var_ee373e1060f9863f = function_dd58016ab8a9a3e0(var_e6013eac45290cab);
    var_ee373e1060f9863f.var_404ec7a436f43edf = function_ede8352b065f482c(var_e6013eac45290cab);
    var_ee373e1060f9863f.var_821230cb7573c0ae = function_403cb24e07b176b0(var_e6013eac45290cab);
    var_ee373e1060f9863f.var_9cc81390bae90155 = function_602655b21cbe7767(var_e6013eac45290cab);
}

