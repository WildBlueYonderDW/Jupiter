// mwiii decomp prototype
#using scripts\mp\bots\bots_util.gsc;
#using script_3d2770dc09c1243;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;

#namespace namespace_90fdb6fb49847e53;

// Namespace namespace_90fdb6fb49847e53/namespace_40f17d09cd6b145
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x109
// Size: 0x11b
function init() {
    var_7603e82423679fc0 = [];
    foreach (loot in getlootscriptablearray()) {
        if (issubstr(loot.type, "panel")) {
            continue;
        }
        var_7603e82423679fc0[var_7603e82423679fc0.size] = loot;
    }
    foreach (ent in getentitylessscriptablearray()) {
        if (issubstr(ent.classname, "cache")) {
            var_7603e82423679fc0[var_7603e82423679fc0.size] = ent;
        }
    }
    level.var_367c15041e69a2a9.loot = spawnstruct();
    level.var_367c15041e69a2a9.loot.var_7603e82423679fc0 = var_7603e82423679fc0;
}

// Namespace namespace_90fdb6fb49847e53/namespace_40f17d09cd6b145
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22b
// Size: 0xb9
function function_5d1148bbed9fc1d7() {
    var_74510c9a259939ad = 10;
    i = 0;
    while (i < level.var_367c15041e69a2a9.loot.var_7603e82423679fc0.size) {
        loops = min(var_74510c9a259939ad, level.var_367c15041e69a2a9.loot.var_7603e82423679fc0.size - i);
        for (j = 0; j < loops; j++) {
            function_f69f070e260b70ad(level.var_367c15041e69a2a9.loot.var_7603e82423679fc0[i + j]);
        }
        waitframe();
        i = i + var_74510c9a259939ad;
    }
}

// Namespace namespace_90fdb6fb49847e53/namespace_40f17d09cd6b145
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2eb
// Size: 0x12a
function private function_f69f070e260b70ad(loot) {
    var_afe002bfe37369a = 250;
    var_92ae02e0013916b6 = 1024;
    var_acd7c234093147f0 = 10;
    var_5e100759d6a30ae5 = -30;
    contents = namespace_2a184fc4902783dc::create_world_contents() + namespace_2a184fc4902783dc::create_item_contents();
    clip = namespace_3c37cb17ade254d::drop_to_ground(loot.origin, var_acd7c234093147f0, var_5e100759d6a30ae5, undefined, contents);
    noclip = function_2227fe7b9c3e31a3(clip[2] - loot.origin[2], var_5e100759d6a30ae5, 1);
    if (noclip) {
        report("no clip", loot);
        return;
    }
    navmeshpoint = function_f8350ab882cc2439(clip);
    var_ab1a67a4635adc46 = distance2dsquared(navmeshpoint, clip);
    verticaloffset = abs(navmeshpoint[2] - clip[2]);
    comment = "";
    if (var_ab1a67a4635adc46 > var_92ae02e0013916b6 || verticaloffset > var_afe002bfe37369a) {
        report("no navmesh", loot, sqrt(var_ab1a67a4635adc46), verticaloffset, navmeshpoint, clip);
    }
}

// Namespace namespace_90fdb6fb49847e53/namespace_40f17d09cd6b145
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x41c
// Size: 0x17c
function private report(var_889f3d7e1c1ea6b, loot, hoffset, var_86c0dc18ea9cd66a, navmeshpoint, var_db5b4ca80697cb67) {
    if (!istrue(level.var_367c15041e69a2a9.loot.var_65054b8e184ecece)) {
        header = "#time; #situation; #lootType; #lootOrigin; #hOffset; #vOffset; #navmeshPoint; #clipPoint";
        function_9a0a24de119b078a("Loot", header);
        level.var_367c15041e69a2a9.loot.var_65054b8e184ecece = 1;
    }
    var_5577636292591c8b = "";
    if (isdefined(loot) && isdefined(loot.type)) {
        var_5577636292591c8b = loot.type;
    }
    var_b3488060af5fc5dd = "";
    if (isdefined(loot) && isdefined(loot.origin)) {
        var_b3488060af5fc5dd = loot.origin;
    }
    var_444a5451f436094a = gettime() + "; " + var_889f3d7e1c1ea6b + "; " + var_5577636292591c8b + "; " + var_b3488060af5fc5dd + "; " + function_53c4c53197386572(hoffset, "") + "; " + function_53c4c53197386572(var_86c0dc18ea9cd66a, "") + "; " + function_53c4c53197386572(navmeshpoint, "") + "; " + function_53c4c53197386572(var_db5b4ca80697cb67, "");
    function_9a0a24de119b078a("Loot", var_444a5451f436094a);
}

