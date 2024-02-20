// mwiii decomp prototype
#using scripts\engine\utility.gsc;

#namespace namespace_a131188218d8b5c3;

// Namespace namespace_a131188218d8b5c3/namespace_d26d07590ff1b1d2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x151
// Size: 0x67
function function_766b80da1f882fc3() {
    /#
        assert(isdefined(level.var_1a2b600a06ec21f4) && isdefined(level.var_1a2b600a06ec21f4.ranktable), "ranktable in gamemodebundle is required.");
    #/
    var_348e4c074cbecc5d = getscriptbundle(level.var_1a2b600a06ec21f4.ranktable);
    /#
        assert(isdefined(var_348e4c074cbecc5d), "mp ranktable undefined");
    #/
    return var_348e4c074cbecc5d;
}

// Namespace namespace_a131188218d8b5c3/namespace_d26d07590ff1b1d2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c0
// Size: 0x2e
function function_3c76fde811a422e1(var_78303afdb17711a0) {
    var_fb74bb671e80d5fb = getscriptbundle(var_78303afdb17711a0);
    /#
        assert(isdefined(var_fb74bb671e80d5fb), "rank bundle undefined");
    #/
    return var_fb74bb671e80d5fb;
}

// Namespace namespace_a131188218d8b5c3/namespace_d26d07590ff1b1d2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f6
// Size: 0x55
function function_f44d7988af879414(rankid) {
    var_348e4c074cbecc5d = function_766b80da1f882fc3();
    /#
        assert(length(var_348e4c074cbecc5d.var_5ccc0a3d783236c3) > rankid);
    #/
    return function_3c76fde811a422e1(var_348e4c074cbecc5d.var_5ccc0a3d783236c3[rankid].rank);
}

// Namespace namespace_a131188218d8b5c3/namespace_d26d07590ff1b1d2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x253
// Size: 0x1d
function function_cd47cbfaa2de3623(rankid) {
    return function_f44d7988af879414(rankid).var_7118a72fe332609d;
}

// Namespace namespace_a131188218d8b5c3/namespace_d26d07590ff1b1d2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x278
// Size: 0x6d
function getrankinfoicon(rankid, var_66753f64e5cd3e9) {
    var_348e4c074cbecc5d = function_766b80da1f882fc3();
    if (isdefined(var_348e4c074cbecc5d.var_cdd7517c09cf8381) && length(var_348e4c074cbecc5d.var_cdd7517c09cf8381) > var_66753f64e5cd3e9) {
        return var_348e4c074cbecc5d.var_cdd7517c09cf8381[var_66753f64e5cd3e9];
    } else {
        return function_f44d7988af879414(rankid).icon;
    }
}

// Namespace namespace_a131188218d8b5c3/namespace_d26d07590ff1b1d2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ec
// Size: 0x1d
function getrankinfolevel(rankid) {
    return function_f44d7988af879414(rankid).var_8aeda55662b96f7e;
}

// Namespace namespace_a131188218d8b5c3/namespace_d26d07590ff1b1d2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x311
// Size: 0x1e
function getrankinfominxp(rankid) {
    return int(level.ranktable[rankid][0]);
}

// Namespace namespace_a131188218d8b5c3/namespace_d26d07590ff1b1d2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x337
// Size: 0x1f
function getrankinfoxpamt(rankid) {
    return int(level.ranktable[rankid][1]);
}

// Namespace namespace_a131188218d8b5c3/namespace_d26d07590ff1b1d2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35e
// Size: 0x1f
function getrankinfomaxxp(rankid) {
    return int(level.ranktable[rankid][2]);
}

// Namespace namespace_a131188218d8b5c3/namespace_d26d07590ff1b1d2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x385
// Size: 0x1d
function function_997e0cd870844c1b(rankid) {
    return function_f44d7988af879414(rankid).var_7118a72fe332609d;
}

// Namespace namespace_a131188218d8b5c3/namespace_d26d07590ff1b1d2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3aa
// Size: 0x64
function getrank() {
    rankxp = function_f3bb4f4911a1beb2("stats", "getPersStat", "rankxp");
    rankid = function_f3bb4f4911a1beb2("stats", "getPersStat", "rank");
    if (rankxp < getrankinfominxp(rankid) + getrankinfoxpamt(rankid)) {
        return rankid;
    } else {
        return getrankforxp(rankxp);
    }
}

// Namespace namespace_a131188218d8b5c3/namespace_d26d07590ff1b1d2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x415
// Size: 0x64
function getrankforxp(var_9f9dfaa0dd863910) {
    rankid = level.maxrank;
    if (var_9f9dfaa0dd863910 >= getrankinfominxp(rankid)) {
        return rankid;
    } else {
        rankid--;
    }
    while (rankid > 0) {
        if (var_9f9dfaa0dd863910 >= getrankinfominxp(rankid) && var_9f9dfaa0dd863910 < getrankinfominxp(rankid) + getrankinfoxpamt(rankid)) {
            return rankid;
        }
        rankid--;
    }
    return rankid;
}

// Namespace namespace_a131188218d8b5c3/namespace_d26d07590ff1b1d2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x481
// Size: 0x67
function function_b1e11b17e1fbded3() {
    /#
        assert(isdefined(level.var_1a2b600a06ec21f4) && isdefined(level.var_1a2b600a06ec21f4.weaponranktable), "weaponranktable in gamemodebundle is required.");
    #/
    var_c6e3b34739982959 = getscriptbundle(level.var_1a2b600a06ec21f4.weaponranktable);
    /#
        assert(isdefined(var_c6e3b34739982959), "weapon ranktable asset undefined");
    #/
    return var_c6e3b34739982959;
}

// Namespace namespace_a131188218d8b5c3/namespace_d26d07590ff1b1d2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f0
// Size: 0x2e
function function_91ce54da71d1008d(var_78303afdb17711a0) {
    var_4734e0b215da1e17 = getscriptbundle(var_78303afdb17711a0);
    /#
        assert(isdefined(var_4734e0b215da1e17), "weapon rank bundle undefined");
    #/
    return var_4734e0b215da1e17;
}

// Namespace namespace_a131188218d8b5c3/namespace_d26d07590ff1b1d2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x526
// Size: 0x55
function function_6bb67ea6b4f510ed(rankid) {
    var_348e4c074cbecc5d = function_b1e11b17e1fbded3();
    /#
        assert(length(var_348e4c074cbecc5d.var_ba0e98d9b58661d7) > rankid);
    #/
    return function_3c76fde811a422e1(var_348e4c074cbecc5d.var_ba0e98d9b58661d7[rankid].rank);
}

