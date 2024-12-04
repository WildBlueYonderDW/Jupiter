#using script_35ee5e2cef30eea2;
#using script_4a6760982b403bad;
#using script_6981400abfcd765c;

#namespace namespace_22b726fd154d6e15;

// Namespace namespace_22b726fd154d6e15 / namespace_b4dcb4af7024df52
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x205
// Size: 0x35
function function_34c0594d8a03efe4(context) {
    if (istrue(level.var_b203a586f65ac136)) {
        return;
    }
    function_4d9d174fbee35b79();
    level.var_4d4bb45e5a0967a3 = context;
    level.var_b203a586f65ac136 = 1;
}

// Namespace namespace_22b726fd154d6e15 / namespace_b4dcb4af7024df52
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x242
// Size: 0x74
function function_86403e1b6ec0b2f6(matchid) {
    data = spawnstruct();
    data.player = self;
    data.stepname = function_63b9f951b5057272(matchid);
    data.stepnumber = 1000;
    data.var_8c3c07d02de9a304 = 1;
    data.var_c999cc7a0d182b0 = 1;
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("mobile_ftue_step_start", data);
}

// Namespace namespace_22b726fd154d6e15 / namespace_b4dcb4af7024df52
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2be
// Size: 0x8b
function function_5b53803303e63eb(matchid, stepnumber) {
    data = spawnstruct();
    data.player = self;
    data.stepname = function_63b9f951b5057272(matchid);
    data.stepnumber = stepnumber;
    data.var_8c3c07d02de9a304 = 1;
    data.var_c999cc7a0d182b0 = 1;
    data.result = "SUCCESS";
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("mobile_ftue_step_finished", data);
}

// Namespace namespace_22b726fd154d6e15 / namespace_b4dcb4af7024df52
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x351
// Size: 0x35
function private function_4d9d174fbee35b79() {
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("mobile_ftue_step_start", &function_ea6f670b79578ba0);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("mobile_ftue_step_finished", &function_54dca51d6309297a);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("mobile_ftue_step_single", &function_9ba5bff1f30b7938);
}

// Namespace namespace_22b726fd154d6e15 / namespace_b4dcb4af7024df52
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x38e
// Size: 0x29
function private function_ea6f670b79578ba0(data) {
    data.player dlog_recordplayerevent("dlog_event_ftue_step_start", function_c86ff8cfc88b4677(data), 0);
}

// Namespace namespace_22b726fd154d6e15 / namespace_b4dcb4af7024df52
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3bf
// Size: 0x3f
function private function_54dca51d6309297a(data) {
    var_5814d27874b48e54 = function_c86ff8cfc88b4677(data);
    var_5814d27874b48e54 = function_7fadd2dc679f8f4c(var_5814d27874b48e54, data);
    data.player dlog_recordplayerevent("dlog_event_ftue_step_finished", var_5814d27874b48e54);
}

// Namespace namespace_22b726fd154d6e15 / namespace_b4dcb4af7024df52
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x406
// Size: 0x56
function private function_9ba5bff1f30b7938(data) {
    var_5814d27874b48e54 = function_c86ff8cfc88b4677(data);
    data.player dlog_recordplayerevent("dlog_event_ftue_step_start", var_5814d27874b48e54);
    var_5814d27874b48e54 = function_7fadd2dc679f8f4c(var_5814d27874b48e54, data);
    data.player dlog_recordplayerevent("dlog_event_ftue_step_finished", var_5814d27874b48e54);
}

// Namespace namespace_22b726fd154d6e15 / namespace_b4dcb4af7024df52
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x464
// Size: 0x12c
function private function_c86ff8cfc88b4677(data) {
    rank = data.player function_217fab64becd170a();
    expertise = data.player function_7fbc76f1aefc8fc5();
    stepnumber = 0;
    if (isdefined(data.stepnumber)) {
        stepnumber = int(data.stepnumber);
    }
    return ["context", level.var_4d4bb45e5a0967a3, "step_name", data.stepname, "step_number", stepnumber, "tutorial_type", "GAME", "tutorial_expertise", expertise, "mandatory_step", istrue(data.var_8c3c07d02de9a304), "player_rank", rank, "automatic", istrue(data.var_c999cc7a0d182b0), "ftue_version", "0.0.0", "progress_version", 0];
}

// Namespace namespace_22b726fd154d6e15 / namespace_b4dcb4af7024df52
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x599
// Size: 0x2e
function private function_7fadd2dc679f8f4c(var_88a0dcbea6a169c2, data) {
    var_88a0dcbea6a169c2[var_88a0dcbea6a169c2.size] = "result";
    var_88a0dcbea6a169c2[var_88a0dcbea6a169c2.size] = data.result;
    return var_88a0dcbea6a169c2;
}

// Namespace namespace_22b726fd154d6e15 / namespace_b4dcb4af7024df52
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5d0
// Size: 0x12
function private function_63b9f951b5057272(matchid) {
    return "ftue_match_" + matchid;
}

