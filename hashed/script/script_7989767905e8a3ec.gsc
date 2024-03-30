// mwiii decomp prototype
#using scripts\common\devgui.gsc;
#using scripts\engine\utility.gsc;
#using scripts\mp\hud_message.gsc;

#namespace ob_splashes;

// Namespace ob_splashes / namespace_ac5318af4e6838ee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x80
// Size: 0x192
function init() {
    /#
        splashlist = function_58629fa086464ceb(level.gamemodebundle.splashlist);
        if (isdefined(splashlist)) {
            scripts/common/devgui::function_6e7290c8ee4f558b("<unknown string>");
            foreach (splash in splashlist.splash_list) {
                splashname = function_3c8848a3a11b2553(splash.ref);
                if (string_starts_with(splashname, "<unknown string>") || string_starts_with(splashname, "<unknown string>")) {
                    scripts/common/devgui::function_b23a59dfb4ca49a1(splashname, "<unknown string>" + splashname + "<unknown string>" + level.gamemodebundle.splashlist, &function_652ce4b2c3591175);
                }
            }
            scripts/common/devgui::function_fe953f000498048f();
        }
        splashlist = function_58629fa086464ceb("<unknown string>");
        scripts/common/devgui::function_6e7290c8ee4f558b("<unknown string>");
        foreach (splash in splashlist.splash_list) {
            splashname = function_3c8848a3a11b2553(splash.ref);
            scripts/common/devgui::function_b23a59dfb4ca49a1(splashname, "<unknown string>" + splashname + "<unknown string>" + "<unknown string>", &function_652ce4b2c3591175);
        }
        scripts/common/devgui::function_fe953f000498048f();
    #/
}

// Namespace ob_splashes / namespace_ac5318af4e6838ee
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x219
// Size: 0x4b
function private function_58629fa086464ceb(var_c1c3e6a4f162ab45) {
    /#
        if (!isdefined(var_c1c3e6a4f162ab45)) {
            return undefined;
        }
        if (function_73e183e02834309d(var_c1c3e6a4f162ab45)) {
            splashlist = getscriptbundle(var_c1c3e6a4f162ab45);
        } else {
            splashlist = getscriptbundle(hashcat(%"hash_7ac5a0b15c7d50e5", var_c1c3e6a4f162ab45));
        }
        return splashlist;
    #/
}

// Namespace ob_splashes / namespace_ac5318af4e6838ee
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x26b
// Size: 0x95
function private function_652ce4b2c3591175(params) {
    /#
        splashref = params[0];
        splashlist = params[1];
        if (!isdefined(splashref) || !isdefined(splashlist)) {
            return;
        }
        foreach (player in level.players) {
            if (isdefined(player)) {
                player scripts/mp/hud_message::function_51614e8fce37b07f(splashref, splashlist);
            }
        }
    #/
}

