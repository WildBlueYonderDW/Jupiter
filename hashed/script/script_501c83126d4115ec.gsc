// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using scripts\mp\bots\bots_gametype_br.gsc;
#using script_40e63dd222434655;
#using script_59ff79d681bb860c;
#using scripts\engine\utility.gsc;
#using scripts\mp\gamelogic.gsc;
#using script_58f20490049af6ac;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\flags.gsc;

#namespace escape_gas;

// Namespace escape_gas/namespace_83735fc2f7d3661a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11c
// Size: 0x13
function function_eda57308516bfc5f() {
    return function_bffb5b682a4ef6a2(&function_e0844a2b7f904b14, &createaction);
}

// Namespace escape_gas/namespace_83735fc2f7d3661a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x137
// Size: 0xed
function function_e0844a2b7f904b14(bot) {
    if (namespace_d576b6dc7cef9c62::function_1147bbc93ea9b83c()) {
        return 0;
    }
    var_a0f36ff3eae203ae = level.br_circle.circleindex + 1 >= level.br_level.br_circlecenters.size - level.br_level.br_movingcirclecount;
    if (!var_a0f36ff3eae203ae) {
        var_7d9a6d00a336393b = namespace_bbc79db4c3949a5c::gettimetilldangerforpoint(bot.origin);
        if (var_7d9a6d00a336393b >= 0) {
            var_72bb89e60d3674df = function_9d1ab012058221bb(var_7d9a6d00a336393b, self.constants.var_3dd54452af7d2b91, self.constants.var_49e2976ca0c853ef);
            var_72bb89e60d3674df = var_72bb89e60d3674df + function_4e58bf49977d1bfd();
            return var_72bb89e60d3674df;
        }
    } else if (bot function_68aa3c169a03e3b9()) {
        return self.constants.var_5518deaf35f7b0ce;
    }
    return 0;
}

// Namespace escape_gas/namespace_83735fc2f7d3661a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22c
// Size: 0x53
function createaction(bot) {
    return function_ff35a4d756374ede("escape_gas", undefined, "main", "", &function_35671b7b1a04bf58, self, &function_f4caae7e8af9d32c, self.constants.var_57228f75b014a7b8, self.constants.var_daec6fd98c7cee50);
}

// Namespace escape_gas/namespace_83735fc2f7d3661a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x287
// Size: 0x119
function function_35671b7b1a04bf58(bot) {
    bot allowreload(0);
    pointonnavmesh = bot function_bf97a7a48fa19ed3();
    stuckcount = 0;
    while (1) {
        if (!isdefined(pointonnavmesh)) {
            return "No destination";
        }
        bot function_9e400058ef021b03(pointonnavmesh, 64);
        bot botpressbutton("sprint", 1);
        var_f0a8757aa739b804 = bot.origin;
        result = bot waittill_any_in_array_or_timeout([0:"goal", 1:"bad_path"], 1);
        if (result == "bad_path") {
            pointonnavmesh = bot function_bf97a7a48fa19ed3(1);
            stuckcount = 0;
        } else if (result == "timeout") {
            var_889f315f34195c15 = 225;
            if (distancesquared(bot.origin, var_f0a8757aa739b804) > var_889f315f34195c15) {
                stuckcount = 0;
            } else {
                stuckcount++;
                if (stuckcount >= 5) {
                    pointonnavmesh = bot function_bf97a7a48fa19ed3(1);
                    stuckcount = 0;
                }
            }
        } else if (result == "goal") {
            break;
        }
    }
    bot notify("dormant_bot_suspending_chance");
}

// Namespace escape_gas/namespace_83735fc2f7d3661a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a7
// Size: 0x5a
function function_bf97a7a48fa19ed3(var_28bfddf285650387) {
    var_c4ca8c2703d417d4 = 400;
    var_7ba79e92efeee9cd = 4000;
    destination = function_e5b4b5992cddb221().origin;
    if (istrue(var_28bfddf285650387)) {
        destination = namespace_c5622898120e827f::getrandompointincircle(destination, var_c4ca8c2703d417d4);
    }
    return function_207ba502560fa1d2(destination, var_7ba79e92efeee9cd);
}

// Namespace escape_gas/namespace_83735fc2f7d3661a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x409
// Size: 0xbc
function function_68aa3c169a03e3b9() {
    if (!namespace_4b0406965e556711::gameflag("graceperiod_done")) {
        return 0;
    }
    if (!isvalidplayer(self)) {
        return 0;
    }
    if (function_d987886bb9de9137() > 1 && !namespace_bbc79db4c3949a5c::function_29e8194ff7e13e2e()) {
        return 0;
    }
    circleorigin = namespace_c5622898120e827f::getdangercircleorigin();
    circleradius = namespace_c5622898120e827f::getdangercircleradius();
    if (istrue(level.circleclosing)) {
        circleorigin = namespace_c5622898120e827f::getsafecircleorigin();
        circleradius = namespace_c5622898120e827f::getsafecircleradius();
    }
    var_fbadf88256285b55 = 0.7;
    var_dcd37eb0f547595 = 320;
    nearradius = max(circleradius * var_fbadf88256285b55, circleradius - var_dcd37eb0f547595);
    return !ispointinsidecircle(self.origin, circleorigin, nearradius);
}

// Namespace escape_gas/namespace_83735fc2f7d3661a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cd
// Size: 0x1e
function function_f4caae7e8af9d32c(action) {
    if (function_d57dd414963503d1()) {
        self allowreload(1);
    }
}

