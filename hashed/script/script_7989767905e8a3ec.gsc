// mwiii decomp prototype
#using script_38eb8f4be20d54f4;
#using scripts\engine\utility.gsc;
#using scripts\mp\hud_message.gsc;

#namespace namespace_58d533f0698acd6e;

// Namespace namespace_58d533f0698acd6e/namespace_ac5318af4e6838ee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x80
// Size: 0x192
function init() {
    /#
        var_f7d29cef55a5fb26 = function_58629fa086464ceb(level.var_1a2b600a06ec21f4.var_f7d29cef55a5fb26);
        if (isdefined(var_f7d29cef55a5fb26)) {
            namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>");
            foreach (splash in var_f7d29cef55a5fb26.var_194df4fe813ae6d7) {
                splashname = function_3c8848a3a11b2553(splash.ref);
                if (string_starts_with(splashname, "<unknown string>") || string_starts_with(splashname, "<unknown string>")) {
                    namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1(splashname, "<unknown string>" + splashname + "<unknown string>" + level.var_1a2b600a06ec21f4.var_f7d29cef55a5fb26, &function_652ce4b2c3591175);
                }
            }
            namespace_b032b0cc17b10064::function_fe953f000498048f();
        }
        var_f7d29cef55a5fb26 = function_58629fa086464ceb("<unknown string>");
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>");
        foreach (splash in var_f7d29cef55a5fb26.var_194df4fe813ae6d7) {
            splashname = function_3c8848a3a11b2553(splash.ref);
            namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1(splashname, "<unknown string>" + splashname + "<unknown string>" + "<unknown string>", &function_652ce4b2c3591175);
        }
        namespace_b032b0cc17b10064::function_fe953f000498048f();
    #/
}

// Namespace namespace_58d533f0698acd6e/namespace_ac5318af4e6838ee
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x219
// Size: 0x4b
function private function_58629fa086464ceb(var_c1c3e6a4f162ab45) {
    /#
        if (!isdefined(var_c1c3e6a4f162ab45)) {
            return undefined;
        }
        if (function_73e183e02834309d(var_c1c3e6a4f162ab45)) {
            var_f7d29cef55a5fb26 = getscriptbundle(var_c1c3e6a4f162ab45);
        } else {
            var_f7d29cef55a5fb26 = getscriptbundle(function_2ef675c13ca1c4af(%"hash_7ac5a0b15c7d50e5", var_c1c3e6a4f162ab45));
        }
        return var_f7d29cef55a5fb26;
    #/
}

// Namespace namespace_58d533f0698acd6e/namespace_ac5318af4e6838ee
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x26b
// Size: 0x95
function private function_652ce4b2c3591175(params) {
    /#
        var_f7b6cc6c062a7a43 = params[0];
        var_f7d29cef55a5fb26 = params[1];
        if (!isdefined(var_f7b6cc6c062a7a43) || !isdefined(var_f7d29cef55a5fb26)) {
            return;
        }
        foreach (player in level.players) {
            if (isdefined(player)) {
                player namespace_44abc05161e2e2cb::function_51614e8fce37b07f(var_f7b6cc6c062a7a43, var_f7d29cef55a5fb26);
            }
        }
    #/
}

