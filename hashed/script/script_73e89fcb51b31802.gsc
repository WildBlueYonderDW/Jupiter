#namespace namespace_c4a35109adf81593;

// Namespace namespace_c4a35109adf81593 / namespace_318af18595992d06
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbe
// Size: 0xc
function main() {
    level.var_e5e4f305f88c0782 = undefined;
}

// Namespace namespace_c4a35109adf81593 / namespace_318af18595992d06
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xd2
// Size: 0x75
function function_4b119908bdf12329(var_f5713abc5f165cfa, fade_out_time, fade_in_time) {
    if (isdefined(level.var_e5e4f305f88c0782)) {
        if (isdefined(var_f5713abc5f165cfa)) {
            if (var_f5713abc5f165cfa == level.var_e5e4f305f88c0782) {
                return;
            }
        }
        level.player clearsoundsubmix(level.var_e5e4f305f88c0782, fade_out_time);
    }
    level.var_e5e4f305f88c0782 = var_f5713abc5f165cfa;
    if (isdefined(var_f5713abc5f165cfa)) {
        level.player setsoundsubmix(var_f5713abc5f165cfa, fade_in_time);
    }
}

// Namespace namespace_c4a35109adf81593 / namespace_318af18595992d06
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x14f
// Size: 0x5b
function function_fcdf5a0628a1911a(var_a4fa05d4abb688b6, fade_out_time, fade_in_time) {
    if (isdefined(level.var_e5e4f305f88c0782)) {
        level.player clearsoundsubmix(level.var_e5e4f305f88c0782, fade_out_time);
    }
    if (function_9b578c5917366e94(var_a4fa05d4abb688b6)) {
        level.player setsoundsubmix(var_a4fa05d4abb688b6, fade_in_time);
    }
}

// Namespace namespace_c4a35109adf81593 / namespace_318af18595992d06
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1b2
// Size: 0x5b
function function_c7c5c2ca61454c41(var_a4fa05d4abb688b6, fade_out_time, fade_in_time) {
    if (function_9b578c5917366e94(var_a4fa05d4abb688b6)) {
        level.player clearsoundsubmix(var_a4fa05d4abb688b6, fade_out_time);
    }
    if (isdefined(level.var_e5e4f305f88c0782)) {
        level.player setsoundsubmix(level.var_e5e4f305f88c0782, fade_in_time);
    }
}

// Namespace namespace_c4a35109adf81593 / namespace_318af18595992d06
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x215
// Size: 0x81
function function_7dff40c0e5cc9dbe() {
    var_f13cf7e07e066520 = (1970, 3704, -408);
    level.alarment = spawn("script_model", var_f13cf7e07e066520);
    level.alarment playloopsound("scn_jup_lower_base_security_alarm");
    wait 23;
    level.alarment stoploopsound("scn_jup_lower_base_security_alarm", 1);
    level.alarment playsound("scn_jup_lower_base_security_alarm_tail");
    wait 2;
    level.alarment delete();
}

