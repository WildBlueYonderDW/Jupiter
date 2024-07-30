#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_2707474774db34b;
#using script_185660037b9236c1;
#using script_413d0426f154bd91;

#namespace namespace_cfbb837b74e21e93;

// Namespace namespace_cfbb837b74e21e93 / namespace_262d6474998a2356
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x133
// Size: 0x3b
function function_61cd287166c3f695(StringReference) {
    activityinstance = self;
    assertex(namespace_68dc261109a9503f::function_1c67ae607a61c6bb(activityinstance));
    activityinstance function_eefe3b65a6590ed2(StringReference, activityinstance.var_6c29f2fdb0054bbe);
}

// Namespace namespace_cfbb837b74e21e93 / namespace_262d6474998a2356
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x176
// Size: 0x39
function function_eefe3b65a6590ed2(StringReference, players) {
    activityinstance = self;
    assertex(namespace_68dc261109a9503f::function_1c67ae607a61c6bb(activityinstance));
    function_686af2a965066763(activityinstance, StringReference, players);
}

// Namespace namespace_cfbb837b74e21e93 / namespace_262d6474998a2356
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b7
// Size: 0x1d
function function_641bc1548cff8210(StringReference, players) {
    function_686af2a965066763(undefined, StringReference, players);
}

// Namespace namespace_cfbb837b74e21e93 / namespace_262d6474998a2356
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dc
// Size: 0x31
function function_716949a1eeeb1f47() {
    activityinstance = self;
    assertex(namespace_68dc261109a9503f::function_1c67ae607a61c6bb(activityinstance));
    activityinstance function_96517b0d8aacf068(activityinstance.var_6c29f2fdb0054bbe);
}

// Namespace namespace_cfbb837b74e21e93 / namespace_262d6474998a2356
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x215
// Size: 0x36
function function_96517b0d8aacf068(players) {
    activityinstance = self;
    assertex(namespace_68dc261109a9503f::function_1c67ae607a61c6bb(activityinstance));
    function_5ce919b476495152(players, activityinstance, "ui_br_objective_index", 0);
}

// Namespace namespace_cfbb837b74e21e93 / namespace_262d6474998a2356
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x253
// Size: 0x5d
function function_b8b15f7f0820954e(players) {
    foreach (player in players) {
        player setclientomnvar("ui_br_objective_index", 0);
    }
}

// Namespace namespace_cfbb837b74e21e93 / namespace_262d6474998a2356
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b8
// Size: 0x3b
function function_c661dba3e304266b(value) {
    activityinstance = self;
    assertex(namespace_68dc261109a9503f::function_1c67ae607a61c6bb(activityinstance));
    activityinstance function_5f6fd55a55ffbc6c(value, activityinstance.var_6c29f2fdb0054bbe);
}

// Namespace namespace_cfbb837b74e21e93 / namespace_262d6474998a2356
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fb
// Size: 0x1dc
function function_5f6fd55a55ffbc6c(value, players) {
    activityinstance = self;
    assertex(namespace_68dc261109a9503f::function_1c67ae607a61c6bb(activityinstance));
    /#
        var_3bc5bab0e50c10e3 = namespace_e82a1efb852543c9::function_6a26856f16c6a207("<dev string:x1c>");
        if (istrue(var_3bc5bab0e50c10e3)) {
            var_5ce85f49892885d8 = namespace_68dc261109a9503f::function_297dc42ebf4f3b04(activityinstance, "<dev string:x1c>");
            var_5ce85f49892885d8 = tablelookuprownum("<dev string:x32>", 0, var_5ce85f49892885d8);
            var_999f08c4e99afaac = tablelookupbyrow("<dev string:x32>", var_5ce85f49892885d8, 10);
            var_aad88477a8d4a46f = tablelookupbyrow("<dev string:x32>", var_5ce85f49892885d8, 1);
            if (var_999f08c4e99afaac != "<dev string:x45>") {
                assertmsg("<dev string:x47>" + "<dev string:x32>" + "<dev string:x72>" + var_aad88477a8d4a46f + "<dev string:x96>");
            }
            var_828020d43184936c = tablelookupbyrow("<dev string:x32>", var_5ce85f49892885d8, 9);
            if (isint(value) && var_828020d43184936c != "<dev string:xe6>") {
                assertmsg("<dev string:xe8>" + "<dev string:x32>" + "<dev string:x108>" + var_aad88477a8d4a46f + "<dev string:x12c>");
            } else if (isfloat(value) && var_828020d43184936c != "<dev string:x17b>") {
                assertmsg("<dev string:xe8>" + "<dev string:x32>" + "<dev string:x17d>" + var_aad88477a8d4a46f + "<dev string:x1a1>");
            } else if (isplayer(value) && var_828020d43184936c != "<dev string:x1ed>") {
                assertmsg("<dev string:xe8>" + "<dev string:x32>" + "<dev string:x1ef>" + var_aad88477a8d4a46f + "<dev string:x213>");
            } else if (isstring(value) && var_828020d43184936c != "<dev string:x260>") {
                assertmsg("<dev string:xe8>" + "<dev string:x32>" + "<dev string:x262>" + var_aad88477a8d4a46f + "<dev string:x286>");
            }
        }
    #/
    function_5ce919b476495152(players, activityinstance, "ui_br_objective_param", value);
}

// Namespace namespace_cfbb837b74e21e93 / namespace_262d6474998a2356
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4df
// Size: 0x3b
function function_474722293c221d5c(timeinseconds) {
    activityinstance = self;
    assertex(namespace_68dc261109a9503f::function_1c67ae607a61c6bb(activityinstance));
    activityinstance function_c1c25690399031a3(timeinseconds, activityinstance.var_6c29f2fdb0054bbe);
}

// Namespace namespace_cfbb837b74e21e93 / namespace_262d6474998a2356
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x522
// Size: 0x109
function function_c1c25690399031a3(timeinseconds, players) {
    activityinstance = self;
    assertex(namespace_68dc261109a9503f::function_1c67ae607a61c6bb(activityinstance));
    /#
        var_3bc5bab0e50c10e3 = namespace_e82a1efb852543c9::function_6a26856f16c6a207("<dev string:x1c>");
        if (istrue(var_3bc5bab0e50c10e3)) {
            var_5ce85f49892885d8 = namespace_68dc261109a9503f::function_297dc42ebf4f3b04(activityinstance, "<dev string:x1c>");
            var_5ce85f49892885d8 = tablelookuprownum("<dev string:x32>", 0, var_5ce85f49892885d8);
            var_4d662194144d997f = tablelookupbyrow("<dev string:x32>", var_5ce85f49892885d8, 8);
            var_aad88477a8d4a46f = tablelookupbyrow("<dev string:x32>", var_5ce85f49892885d8, 1);
            if (var_4d662194144d997f != "<dev string:x45>") {
                assertmsg("<dev string:x2d3>" + "<dev string:x32>" + "<dev string:x72>" + var_aad88477a8d4a46f + "<dev string:x2ee>");
            }
        }
    #/
    var_ea2c1a117f714d0c = int(timeinseconds) * 1000;
    var_c7f1f3c8a79d424d = gettime() + var_ea2c1a117f714d0c;
    function_5ce919b476495152(players, activityinstance, "ui_br_objective_countdown_timer", var_c7f1f3c8a79d424d);
}

// Namespace namespace_cfbb837b74e21e93 / namespace_262d6474998a2356
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x633
// Size: 0x44
function function_f0361294db9d74a7(var_e953cfb99ec0d4ac, var_dea46a181189fa4b) {
    activityinstance = self;
    assertex(namespace_68dc261109a9503f::function_1c67ae607a61c6bb(activityinstance));
    activityinstance function_24d7e633e4a9c5c8(var_e953cfb99ec0d4ac, var_dea46a181189fa4b, activityinstance.var_6c29f2fdb0054bbe);
}

// Namespace namespace_cfbb837b74e21e93 / namespace_262d6474998a2356
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67f
// Size: 0x5d
function function_24d7e633e4a9c5c8(var_e953cfb99ec0d4ac, var_dea46a181189fa4b, players) {
    activityinstance = self;
    assertex(namespace_68dc261109a9503f::function_1c67ae607a61c6bb(activityinstance));
    if (isdefined(var_dea46a181189fa4b)) {
        function_5ce919b476495152(players, activityinstance, "ui_br_objective_progress_bar_threshold", var_dea46a181189fa4b, 0);
    }
    function_5ce919b476495152(players, activityinstance, "ui_br_objective_progress_bar", var_e953cfb99ec0d4ac, -1);
}

// Namespace namespace_cfbb837b74e21e93 / namespace_262d6474998a2356
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6e4
// Size: 0x114
function private function_686af2a965066763(activityinstance, StringReference, players) {
    var_5ce85f49892885d8 = tablelookuprownum("ob/ob_missions.csv", 1, StringReference);
    var_f1a21b880815d306 = var_5ce85f49892885d8 != -1;
    if (var_f1a21b880815d306) {
        contractindexstring = tablelookupbyrow("ob/ob_missions.csv", var_5ce85f49892885d8, 0);
        contractindex = int(contractindexstring);
        if (isdefined(activityinstance) && namespace_68dc261109a9503f::function_1c67ae607a61c6bb(activityinstance)) {
            function_5ce919b476495152(players, activityinstance, "ui_br_objective_index", contractindex, 0);
        } else {
            foreach (player in players) {
                player setclientomnvar("ui_br_objective_index", contractindex);
            }
        }
        return;
    }
    assertmsg("<dev string:x313>" + StringReference + "<dev string:x326>" + "<dev string:x32>" + "<dev string:x33c>");
}

