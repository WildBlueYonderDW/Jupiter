// mwiii decomp prototype
#using scripts\mp\utility\game.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\utility\points.gsc;

#namespace namespace_40cd4a4db2010f22;

// Namespace namespace_40cd4a4db2010f22/namespace_a850435086c88de3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb
// Size: 0x141
function doonactionscoreevent(eventtype, eventname, cooldown) {
    if (getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", namespace_cd0b2d039510b38d::getsubgametype(), "_disable_onactionscoreevents"), 0) == 1) {
        return;
    }
    if (namespace_cd0b2d039510b38d::getgametype() == "br" && !isdefined(level.prematchendtime)) {
        return;
    }
    if (!isdefined(cooldown)) {
        cooldown = 12;
    }
    var_2bc27cd3d02037d0 = cooldown * 1000;
    var_b7d39a4661f3460 = gettime();
    if (!isdefined(self.var_6d7a36c9233e010d)) {
        self.var_6d7a36c9233e010d = [];
    }
    if (!isdefined(self.var_6d7a36c9233e010d[eventname])) {
        self.var_6d7a36c9233e010d[eventname] = 0;
    } else if (self.var_6d7a36c9233e010d[eventname] > var_b7d39a4661f3460) {
        return;
    }
    self.var_6d7a36c9233e010d[eventname] = var_b7d39a4661f3460 + var_2bc27cd3d02037d0;
    switch (eventtype) {
    case 0:
        function_a56759f3dec70990(eventname);
        break;
    case 1:
        function_e4278547ad0ee8c8(eventname);
        break;
    case 2:
        function_d25feb1da4499bae(eventname);
        break;
    default:
        break;
    }
}

// Namespace namespace_40cd4a4db2010f22/namespace_a850435086c88de3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x223
// Size: 0x2b
function function_a56759f3dec70990(eventname) {
    var_c7cba7d0db108110 = function_1823ff50bb28148d("altScore_equipment_" + eventname);
    function_558e5516ee7925aa(var_c7cba7d0db108110);
}

// Namespace namespace_40cd4a4db2010f22/namespace_a850435086c88de3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x255
// Size: 0x2b
function function_e4278547ad0ee8c8(eventname) {
    var_c7cba7d0db108110 = function_1823ff50bb28148d("altScore_fieldUp_" + eventname);
    function_558e5516ee7925aa(var_c7cba7d0db108110);
}

// Namespace namespace_40cd4a4db2010f22/namespace_a850435086c88de3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x287
// Size: 0x2b
function function_d25feb1da4499bae(eventname) {
    var_c7cba7d0db108110 = function_1823ff50bb28148d("altScore_killstreak_" + eventname);
    function_558e5516ee7925aa(var_c7cba7d0db108110);
}

// Namespace namespace_40cd4a4db2010f22/namespace_a850435086c88de3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b9
// Size: 0x38
function function_558e5516ee7925aa(var_c7cba7d0db108110) {
    points = namespace_62c556437da28f50::getscoreinfovalue(var_c7cba7d0db108110);
    if (isdefined(points)) {
        thread namespace_48a08c5037514e04::doscoreevent(var_c7cba7d0db108110, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
    }
}

