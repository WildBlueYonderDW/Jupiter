// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_2707474774db34b;
#using script_185660037b9236c1;
#using script_413d0426f154bd91;

#namespace namespace_cfbb837b74e21e93;

// Namespace namespace_cfbb837b74e21e93 / namespace_262d6474998a2356
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x133
// Size: 0x3c
function function_61cd287166c3f695(StringReference) {
    activityinstance = self;
    /#
        assertex(namespace_68dc261109a9503f::function_1c67ae607a61c6bb(activityinstance));
    #/
    activityinstance function_eefe3b65a6590ed2(StringReference, activityinstance.var_6c29f2fdb0054bbe);
}

// Namespace namespace_cfbb837b74e21e93 / namespace_262d6474998a2356
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x176
// Size: 0x3a
function function_eefe3b65a6590ed2(StringReference, players) {
    activityinstance = self;
    /#
        assertex(namespace_68dc261109a9503f::function_1c67ae607a61c6bb(activityinstance));
    #/
    function_686af2a965066763(activityinstance, StringReference, players);
}

// Namespace namespace_cfbb837b74e21e93 / namespace_262d6474998a2356
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b7
// Size: 0x1e
function function_641bc1548cff8210(StringReference, players) {
    function_686af2a965066763(undefined, StringReference, players);
}

// Namespace namespace_cfbb837b74e21e93 / namespace_262d6474998a2356
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dc
// Size: 0x32
function function_716949a1eeeb1f47() {
    activityinstance = self;
    /#
        assertex(namespace_68dc261109a9503f::function_1c67ae607a61c6bb(activityinstance));
    #/
    activityinstance function_96517b0d8aacf068(activityinstance.var_6c29f2fdb0054bbe);
}

// Namespace namespace_cfbb837b74e21e93 / namespace_262d6474998a2356
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x215
// Size: 0x37
function function_96517b0d8aacf068(players) {
    activityinstance = self;
    /#
        assertex(namespace_68dc261109a9503f::function_1c67ae607a61c6bb(activityinstance));
    #/
    function_5ce919b476495152(players, activityinstance, "ui_br_objective_index", 0);
}

// Namespace namespace_cfbb837b74e21e93 / namespace_262d6474998a2356
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x253
// Size: 0x5e
function function_b8b15f7f0820954e(players) {
    foreach (player in players) {
        player setclientomnvar("ui_br_objective_index", 0);
    }
}

// Namespace namespace_cfbb837b74e21e93 / namespace_262d6474998a2356
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b8
// Size: 0x3c
function function_c661dba3e304266b(value) {
    activityinstance = self;
    /#
        assertex(namespace_68dc261109a9503f::function_1c67ae607a61c6bb(activityinstance));
    #/
    activityinstance function_5f6fd55a55ffbc6c(value, activityinstance.var_6c29f2fdb0054bbe);
}

// Namespace namespace_cfbb837b74e21e93 / namespace_262d6474998a2356
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fb
// Size: 0x1dd
function function_5f6fd55a55ffbc6c(value, players) {
    activityinstance = self;
    /#
        assertex(namespace_68dc261109a9503f::function_1c67ae607a61c6bb(activityinstance));
    #/
    /#
        var_3bc5bab0e50c10e3 = namespace_e82a1efb852543c9::function_6a26856f16c6a207("<unknown string>");
        if (istrue(var_3bc5bab0e50c10e3)) {
            var_5ce85f49892885d8 = namespace_68dc261109a9503f::function_297dc42ebf4f3b04(activityinstance, "<unknown string>");
            var_5ce85f49892885d8 = tablelookuprownum("<unknown string>", 0, var_5ce85f49892885d8);
            var_999f08c4e99afaac = tablelookupbyrow("<unknown string>", var_5ce85f49892885d8, 10);
            var_aad88477a8d4a46f = tablelookupbyrow("<unknown string>", var_5ce85f49892885d8, 1);
            if (var_999f08c4e99afaac != "<unknown string>") {
                /#
                    assertmsg("<unknown string>" + "<unknown string>" + "<unknown string>" + var_aad88477a8d4a46f + "<unknown string>");
                #/
            }
            var_828020d43184936c = tablelookupbyrow("<unknown string>", var_5ce85f49892885d8, 9);
            if (isint(value) && var_828020d43184936c != "<unknown string>") {
                /#
                    assertmsg("<unknown string>" + "<unknown string>" + "<unknown string>" + var_aad88477a8d4a46f + "<unknown string>");
                #/
            } else if (isfloat(value) && var_828020d43184936c != "<unknown string>") {
                /#
                    assertmsg("<unknown string>" + "<unknown string>" + "<unknown string>" + var_aad88477a8d4a46f + "<unknown string>");
                #/
            } else if (isplayer(value) && var_828020d43184936c != "<unknown string>") {
                /#
                    assertmsg("<unknown string>" + "<unknown string>" + "<unknown string>" + var_aad88477a8d4a46f + "<unknown string>");
                #/
            } else if (isstring(value) && var_828020d43184936c != "<unknown string>") {
                /#
                    assertmsg("<unknown string>" + "<unknown string>" + "<unknown string>" + var_aad88477a8d4a46f + "<unknown string>");
                #/
            }
        }
    #/
    function_5ce919b476495152(players, activityinstance, "ui_br_objective_param", value);
}

// Namespace namespace_cfbb837b74e21e93 / namespace_262d6474998a2356
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4df
// Size: 0x3c
function function_474722293c221d5c(timeinseconds) {
    activityinstance = self;
    /#
        assertex(namespace_68dc261109a9503f::function_1c67ae607a61c6bb(activityinstance));
    #/
    activityinstance function_c1c25690399031a3(timeinseconds, activityinstance.var_6c29f2fdb0054bbe);
}

// Namespace namespace_cfbb837b74e21e93 / namespace_262d6474998a2356
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x522
// Size: 0x10a
function function_c1c25690399031a3(timeinseconds, players) {
    activityinstance = self;
    /#
        assertex(namespace_68dc261109a9503f::function_1c67ae607a61c6bb(activityinstance));
    #/
    /#
        var_3bc5bab0e50c10e3 = namespace_e82a1efb852543c9::function_6a26856f16c6a207("<unknown string>");
        if (istrue(var_3bc5bab0e50c10e3)) {
            var_5ce85f49892885d8 = namespace_68dc261109a9503f::function_297dc42ebf4f3b04(activityinstance, "<unknown string>");
            var_5ce85f49892885d8 = tablelookuprownum("<unknown string>", 0, var_5ce85f49892885d8);
            var_4d662194144d997f = tablelookupbyrow("<unknown string>", var_5ce85f49892885d8, 8);
            var_aad88477a8d4a46f = tablelookupbyrow("<unknown string>", var_5ce85f49892885d8, 1);
            if (var_4d662194144d997f != "<unknown string>") {
                /#
                    assertmsg("<unknown string>" + "<unknown string>" + "<unknown string>" + var_aad88477a8d4a46f + "<unknown string>");
                #/
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
// Size: 0x45
function function_f0361294db9d74a7(var_e953cfb99ec0d4ac, var_dea46a181189fa4b) {
    activityinstance = self;
    /#
        assertex(namespace_68dc261109a9503f::function_1c67ae607a61c6bb(activityinstance));
    #/
    activityinstance function_24d7e633e4a9c5c8(var_e953cfb99ec0d4ac, var_dea46a181189fa4b, activityinstance.var_6c29f2fdb0054bbe);
}

// Namespace namespace_cfbb837b74e21e93 / namespace_262d6474998a2356
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67f
// Size: 0x5e
function function_24d7e633e4a9c5c8(var_e953cfb99ec0d4ac, var_dea46a181189fa4b, players) {
    activityinstance = self;
    /#
        assertex(namespace_68dc261109a9503f::function_1c67ae607a61c6bb(activityinstance));
    #/
    if (isdefined(var_dea46a181189fa4b)) {
        function_5ce919b476495152(players, activityinstance, "ui_br_objective_progress_bar_threshold", var_dea46a181189fa4b, 0);
    }
    function_5ce919b476495152(players, activityinstance, "ui_br_objective_progress_bar", var_e953cfb99ec0d4ac, -1);
}

// Namespace namespace_cfbb837b74e21e93 / namespace_262d6474998a2356
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6e4
// Size: 0x115
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
    /#
        /#
            assertmsg("<unknown string>" + StringReference + "<unknown string>" + "<unknown string>" + "<unknown string>");
        #/
    #/
}

