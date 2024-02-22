// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\hud_util.gsc;
#using script_2583ee5680cf4736;
#using scripts\mp\gamescore.gsc;

#namespace namespace_76b8c9d9aeef6321;

// Namespace namespace_76b8c9d9aeef6321/namespace_9e3a2df040c9b328
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x26c
// Size: 0x370
function setupobjective(trigger, var_8b9949739f4e0f6, var_5ddbc1faed2c56e6, var_3c2389ba69e5822b) {
    visual[0] = spawn("script_model", trigger.origin);
    ownerteam = function_2e3b4aa15c51aa90(trigger.script_label);
    var_f68bd377b932ee64 = function_a7de388c32637f42(trigger.script_label);
    moneypile = createuseobject(ownerteam, trigger, visual, (0, 0, 64), var_3c2389ba69e5822b, var_8b9949739f4e0f6);
    moneypile setvisibleteam("any");
    moneypile allowuse(var_f68bd377b932ee64);
    moneypile.trigger setusepriority(-1 - 1 - 1 - 1);
    moneypile.trigger setuseholdduration("duration_short");
    moneypile.trigger sethintonobstruction("show");
    moneypile requestid(1, 1, var_3c2389ba69e5822b);
    moneypile.exclusiveuse = 0;
    moneypile.var_2361cb77c7226f85 = [];
    moneypile.checkuseconditioninthink = 1;
    moneypile.var_2efb40714a6e9468 = 1;
    moneypile.var_bd91d0c9c243b0df = 0;
    moneypile.var_cc367d287df0480b = 0;
    if (ownerteam == "neutral") {
        moneypile setobjectivestatusicons(level.var_909dfa41d4c004d8, level.var_909dfa41d4c004d8);
        var_d412ecbe461759fe = ter_op(getdvarint(@"hash_4e4da58f88e22860", 0), 20, 1000);
        moneypile.var_d412ecbe461759fe = var_d412ecbe461759fe;
        moneypile setusetime(level.var_33e1ab49db4cb12f);
    } else {
        moneypile setobjectivestatusicons(level.var_46d190af0e774ad, level.var_a93b79fb9e061647);
        moneypile.var_d412ecbe461759fe = 0;
        moneypile setusetime(level.var_c4bf2b151014aa16);
        if (game["switchedsides"]) {
            if (ownerteam == "allies") {
                moneypile.var_d412ecbe461759fe = game["attackerGoldBars"];
            } else {
                moneypile.var_d412ecbe461759fe = game["defenderGoldBars"];
            }
        }
        function_f01b3311ea2144e(moneypile);
    }
    moneypile.id = "moneypile";
    moneypile.onuse = &function_cc1facd3f297a76c;
    moneypile.usecondition = &function_d154043bb1c69c98;
    moneypile.var_53f88be23696a633 = &function_d154043bb1c69c98;
    moneypile.var_3c2389ba69e5822b = var_3c2389ba69e5822b;
    moneypile.ownerteam = ownerteam;
    moneypile.origin = trigger.origin;
    if (trigger.script_label == "_a" || trigger.script_label == "_b") {
        var_25d213b4714288ce = spawn("trigger_radius", trigger.origin, 0, 90, 128);
        var_25d213b4714288ce.script_label = trigger.script_label;
        var_25d213b4714288ce.moneypile = moneypile;
        thread function_28d3a4d017b4d4a5(var_25d213b4714288ce);
        moneypile thread function_b41e97065e86a3ea();
    }
    moneypile.trigger.moneypile = moneypile;
    moneypile.trigger namespace_5775ad2badedbcaa::function_e6c63f16f2258b80(&function_a31737d625cdf5eb);
    return moneypile;
}

// Namespace namespace_76b8c9d9aeef6321/namespace_9e3a2df040c9b328
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5e4
// Size: 0x90
function function_a31737d625cdf5eb(usable, player) {
    if (isdefined(player) && isdefined(usable)) {
        if (usable.moneypile function_d154043bb1c69c98(player)) {
            return {string:"MP/TAKE_GOLD", type:"HINT_NOBUTTON"};
        } else {
            return {string:"", type:"HINT_NOICON"};
        }
    }
    return {string:"", type:"HINT_NOICON"};
}

// Namespace namespace_76b8c9d9aeef6321/namespace_9e3a2df040c9b328
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x67c
// Size: 0x15a
function function_28d3a4d017b4d4a5(dropzone) {
    level endon("game_ended");
    while (1) {
        player = dropzone waittill("trigger");
        if (level.gameended) {
            return;
        }
        if (!isplayer(player)) {
            continue;
        }
        if (dropzone.moneypile.ownerteam == player.team && player.var_d412ecbe461759fe > 0) {
            for (i = 0; i < player.var_d412ecbe461759fe; i++) {
                player thread doscoreevent(#"gold_secure");
            }
            player incpersstat("gold_secure", player.var_d412ecbe461759fe);
            player setextrascore0(player.pers["gold_secure"]);
            dropzone.moneypile.var_d412ecbe461759fe = dropzone.moneypile.var_d412ecbe461759fe + player.var_d412ecbe461759fe;
            player.var_d412ecbe461759fe = 0;
            player setclientomnvar("ui_gold", player.var_d412ecbe461759fe);
            function_f01b3311ea2144e(dropzone.moneypile);
            player playsound("br_pickup_cash_vlrg_01");
        }
    }
}

// Namespace namespace_76b8c9d9aeef6321/namespace_9e3a2df040c9b328
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7dd
// Size: 0x42
function function_b41e97065e86a3ea() {
    level waittill("round_end_finished");
    if (self.ownerteam == "allies") {
        game["attackerGoldBars"] = self.var_d412ecbe461759fe;
    } else {
        game["defenderGoldBars"] = self.var_d412ecbe461759fe;
    }
}

// Namespace namespace_76b8c9d9aeef6321/namespace_9e3a2df040c9b328
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x826
// Size: 0x46
function function_d154043bb1c69c98(player) {
    if (self.var_d412ecbe461759fe <= 0 || player.var_d412ecbe461759fe >= player.var_9bbec58d3647abff || level.gameended) {
        return 0;
    }
    return 1;
}

// Namespace namespace_76b8c9d9aeef6321/namespace_9e3a2df040c9b328
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x874
// Size: 0x11b
function function_cc1facd3f297a76c(player) {
    player.var_d412ecbe461759fe = player.var_d412ecbe461759fe + 1;
    player setclientomnvar("ui_gold", player.var_d412ecbe461759fe);
    player updateuiprogress(self, 0);
    self.var_d412ecbe461759fe = self.var_d412ecbe461759fe - 1;
    player playsound("br_pickup_cash_lrg_01");
    if (self.ownerteam != "neutral") {
        function_f01b3311ea2144e(self);
        player thread doscoreevent(#"gold_steal");
        player incpersstat("gold_steal", 1);
        player setextrascore1(player.pers["gold_steal"]);
        function_d626b8e88755fe64(player);
    } else {
        player thread doscoreevent(#"hash_e23c154d554b16a6");
        if (getdvarint(@"hash_4e4da58f88e22860", 0) && self.var_d412ecbe461759fe <= 0) {
            function_896249bc3c12863d();
            function_9030f4d114a157df(level.var_ecec7a4115b35c9[level.var_9916fff305749068]);
        }
    }
}

// Namespace namespace_76b8c9d9aeef6321/namespace_9e3a2df040c9b328
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x996
// Size: 0x99
function function_d626b8e88755fe64(player) {
    otherteam = getotherteam(player.team)[0];
    var_3c366d97c1d245a2 = ter_op(otherteam == "axis", "axis_team_splash_appeared", "allies_team_splash_appeared");
    if (!flag(var_3c366d97c1d245a2)) {
        flag_set(var_3c366d97c1d245a2);
        /#
            assertex(isdefined(level.var_9105385a7ecadc0c), "Please define the gold rush splash list");
        #/
        showsplashtoteam(otherteam, "gold_rush_steal", undefined, undefined, undefined, undefined, level.var_9105385a7ecadc0c);
        thread function_87134192ff77be44(var_3c366d97c1d245a2);
    }
}

// Namespace namespace_76b8c9d9aeef6321/namespace_9e3a2df040c9b328
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa36
// Size: 0x17
function function_87134192ff77be44(var_3c366d97c1d245a2) {
    wait(10);
    flag_clear(var_3c366d97c1d245a2);
}

// Namespace namespace_76b8c9d9aeef6321/namespace_9e3a2df040c9b328
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa54
// Size: 0x69
function function_2e3b4aa15c51aa90(objectivekey) {
    if (objectivekey == "_a") {
        ownerteam = ter_op(game["switchedsides"], "axis", "allies");
    } else if (objectivekey == "_b") {
        ownerteam = ter_op(game["switchedsides"], "allies", "axis");
    } else {
        ownerteam = "neutral";
    }
    return ownerteam;
}

// Namespace namespace_76b8c9d9aeef6321/namespace_9e3a2df040c9b328
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xac5
// Size: 0x3c
function function_a7de388c32637f42(objectivekey) {
    if (objectivekey == "_a" || objectivekey == "_b") {
        ownerteam = "enemy";
    } else {
        ownerteam = "any";
    }
    return ownerteam;
}

// Namespace namespace_76b8c9d9aeef6321/namespace_9e3a2df040c9b328
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb09
// Size: 0x56
function function_f01b3311ea2144e(moneypile) {
    namespace_e8a49b70d0769b66::_setteamscore(moneypile.ownerteam, moneypile.var_d412ecbe461759fe);
    if (moneypile.var_d412ecbe461759fe == 0) {
        moneypile namespace_19b4203b51d56488::setvisibleteam("friendly");
    } else {
        moneypile namespace_19b4203b51d56488::setvisibleteam("any");
    }
}

// Namespace namespace_76b8c9d9aeef6321/namespace_9e3a2df040c9b328
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb66
// Size: 0x32
function function_896249bc3c12863d() {
    if (level.var_ecec7a4115b35c9.size == level.var_9916fff305749068) {
        level.var_9916fff305749068 = 1;
    } else {
        level.var_9916fff305749068++;
    }
}

// Namespace namespace_76b8c9d9aeef6321/namespace_9e3a2df040c9b328
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb9f
// Size: 0x79
function function_9030f4d114a157df(var_6a0664dbed9c56fc) {
    foreach (var_963ddbf1bda4c460 in level.var_ecec7a4115b35c9) {
        if (var_963ddbf1bda4c460 == var_6a0664dbed9c56fc) {
            thread function_c9dce10ad224933a(var_963ddbf1bda4c460);
        } else {
            function_e61ac104d25c6faa(var_963ddbf1bda4c460, "none", 0);
        }
    }
}

// Namespace namespace_76b8c9d9aeef6321/namespace_9e3a2df040c9b328
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc1f
// Size: 0x1e
function function_c9dce10ad224933a(var_963ddbf1bda4c460) {
    wait(5);
    function_e61ac104d25c6faa(var_963ddbf1bda4c460, "any", 20);
}

// Namespace namespace_76b8c9d9aeef6321/namespace_9e3a2df040c9b328
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc44
// Size: 0xd1
function function_e61ac104d25c6faa(var_963ddbf1bda4c460, visibility, var_d412ecbe461759fe) {
    var_963ddbf1bda4c460 setvisibleteam(visibility);
    var_963ddbf1bda4c460 allowuse(visibility);
    var_963ddbf1bda4c460.var_d412ecbe461759fe = var_d412ecbe461759fe;
    foreach (var_5658359672a6082c in level.var_c78ba5dba4b7d426) {
        if (int(var_5658359672a6082c.script_objective) == int(var_963ddbf1bda4c460.trigger.script_objective)) {
            if (visibility == "any") {
                var_5658359672a6082c show();
            } else {
                var_5658359672a6082c hide();
            }
        }
    }
}

