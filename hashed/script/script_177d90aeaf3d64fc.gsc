// mwiii decomp prototype
#using scripts\engine\math.gsc;
#using scripts\engine\utility.gsc;
#using script_38eb8f4be20d54f4;
#using script_4c770a9a4ad7659c;

#namespace namespace_5b218477be05886c;

// Namespace namespace_5b218477be05886c/namespace_2b394cef24a1daec
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11d
// Size: 0x2b
function function_845878bc3f891199() {
    if (!isdefined(level.var_e2dd33ac17a3b091)) {
        level.var_e2dd33ac17a3b091 = [];
    }
    function_6d507460d23bd8b2("yellow_cargo", "ob_jup_items_reward_region_cache_cargo");
}

// Namespace namespace_5b218477be05886c/namespace_2b394cef24a1daec
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14f
// Size: 0x94
function function_6d507460d23bd8b2(var_168c108518d4bac9, var_8943bcdf726f10bf) {
    if (!isdefined(level.var_e2dd33ac17a3b091)) {
        level.var_e2dd33ac17a3b091 = [];
    }
    if (isdefined(level.var_e2dd33ac17a3b091[var_168c108518d4bac9])) {
        /#
            assertmsg("Region "" + var_168c108518d4bac9 + "" is already defined.");
        #/
        return;
    }
    var_9560f99f5fb06178 = getscriptbundle("itemspawnlist:" + var_8943bcdf726f10bf);
    if (isdefined(var_9560f99f5fb06178)) {
        level.var_e2dd33ac17a3b091[var_168c108518d4bac9] = var_8943bcdf726f10bf;
    } else {
        /#
            assertmsg("Region Drop List "" + var_8943bcdf726f10bf + "" is not a valid itemspawnlist.");
        #/
        return;
    }
}

