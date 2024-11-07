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

// Namespace namespace_76b8c9d9aeef6321 / namespace_9e3a2df040c9b328
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2c4
// Size: 0x36b
function setupobjective(trigger, skipobjid, var_5ddbc1faed2c56e6, var_3c2389ba69e5822b) {
    visual[0] = spawn("script_model", trigger.origin);
    ownerteam = function_2e3b4aa15c51aa90(trigger.script_label);
    alloweduser = function_a7de388c32637f42(trigger.script_label);
    moneypile = createuseobject(ownerteam, trigger, visual, (0, 0, 64), var_3c2389ba69e5822b, skipobjid);
    moneypile setvisibleteam("any");
    moneypile allowuse(alloweduser);
    moneypile.trigger setusepriority(-1 - 1 - 1 - 1);
    moneypile.trigger setuseholdduration("duration_short");
    moneypile.trigger sethintonobstruction("show");
    moneypile requestid(1, 1, var_3c2389ba69e5822b);
    moneypile.exclusiveuse = 0;
    moneypile.clientprogress = [];
    moneypile.checkuseconditioninthink = 1;
    moneypile.var_2efb40714a6e9468 = 1;
    moneypile.allowsweapon = 0;
    moneypile.var_cc367d287df0480b = 0;
    if (ownerteam == "neutral") {
        moneypile setobjectivestatusicons(level.var_909dfa41d4c004d8, level.var_909dfa41d4c004d8);
        currentmoney = ter_op(getdvarint(@"hash_4e4da58f88e22860", 0), 20, 1000);
        moneypile.currentmoney = currentmoney;
        moneypile setusetime(level.neutralcapturetime);
    } else {
        moneypile setobjectivestatusicons(level.var_46d190af0e774ad, level.iconsteal);
        moneypile.currentmoney = 0;
        moneypile setusetime(level.enemycapturetime);
        if (game["switchedsides"]) {
            if (ownerteam == "allies") {
                moneypile.currentmoney = game["attackerGoldBars"];
            } else {
                moneypile.currentmoney = game["defenderGoldBars"];
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
        clonetrigger = spawn("trigger_radius", trigger.origin, 0, 90, 128);
        clonetrigger.script_label = trigger.script_label;
        clonetrigger.moneypile = moneypile;
        thread function_28d3a4d017b4d4a5(clonetrigger);
        moneypile thread function_b41e97065e86a3ea();
    }
    moneypile.trigger.moneypile = moneypile;
    moneypile.trigger namespace_5775ad2badedbcaa::function_e6c63f16f2258b80(&function_a31737d625cdf5eb);
    return moneypile;
}

// Namespace namespace_76b8c9d9aeef6321 / namespace_9e3a2df040c9b328
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x638
// Size: 0x8f
function function_a31737d625cdf5eb(usable, player) {
    if (isdefined(player) && isdefined(usable)) {
        if (usable.moneypile function_d154043bb1c69c98(player)) {
            return {#string:%MP/TAKE_GOLD, #type:"HINT_NOBUTTON"};
        } else {
            return {#string:%, #type:"HINT_NOICON"};
        }
    }
    return {#string:%, #type:"HINT_NOICON"};
}

// Namespace namespace_76b8c9d9aeef6321 / namespace_9e3a2df040c9b328
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6d0
// Size: 0x159
function function_28d3a4d017b4d4a5(dropzone) {
    level endon("game_ended");
    while (true) {
        dropzone waittill("trigger", player);
        if (level.gameended) {
            return;
        }
        if (!isplayer(player)) {
            continue;
        }
        if (dropzone.moneypile.ownerteam == player.team && player.currentmoney > 0) {
            for (i = 0; i < player.currentmoney; i++) {
                player thread doScoreEvent(#"gold_secure");
            }
            player incpersstat("gold_secure", player.currentmoney);
            player setextrascore0(player.pers["gold_secure"]);
            dropzone.moneypile.currentmoney += player.currentmoney;
            player.currentmoney = 0;
            player setclientomnvar("ui_gold", player.currentmoney);
            function_f01b3311ea2144e(dropzone.moneypile);
            player playsound("br_pickup_cash_vlrg_01");
        }
    }
}

// Namespace namespace_76b8c9d9aeef6321 / namespace_9e3a2df040c9b328
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x831
// Size: 0x41
function function_b41e97065e86a3ea() {
    level waittill("round_end_finished");
    if (self.ownerteam == "allies") {
        game["attackerGoldBars"] = self.currentmoney;
        return;
    }
    game["defenderGoldBars"] = self.currentmoney;
}

// Namespace namespace_76b8c9d9aeef6321 / namespace_9e3a2df040c9b328
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x87a
// Size: 0x45
function function_d154043bb1c69c98(player) {
    if (self.currentmoney <= 0 || player.currentmoney >= player.maxmoney || level.gameended) {
        return false;
    }
    return true;
}

// Namespace namespace_76b8c9d9aeef6321 / namespace_9e3a2df040c9b328
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8c8
// Size: 0x11a
function function_cc1facd3f297a76c(player) {
    player.currentmoney += 1;
    player setclientomnvar("ui_gold", player.currentmoney);
    player updateuiprogress(self, 0);
    self.currentmoney -= 1;
    player playsound("br_pickup_cash_lrg_01");
    if (self.ownerteam != "neutral") {
        function_f01b3311ea2144e(self);
        player thread doScoreEvent(#"gold_steal");
        player incpersstat("gold_steal", 1);
        player setextrascore1(player.pers["gold_steal"]);
        function_d626b8e88755fe64(player);
        return;
    }
    player thread doScoreEvent(#"gold_collect");
    if (getdvarint(@"hash_4e4da58f88e22860", 0) && self.currentmoney <= 0) {
        function_896249bc3c12863d();
        function_9030f4d114a157df(level.var_ecec7a4115b35c9[level.var_9916fff305749068]);
    }
}

// Namespace namespace_76b8c9d9aeef6321 / namespace_9e3a2df040c9b328
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9ea
// Size: 0x98
function function_d626b8e88755fe64(player) {
    otherteam = getotherteam(player.team)[0];
    otherteamflag = ter_op(otherteam == "axis", "axis_team_splash_appeared", "allies_team_splash_appeared");
    if (!flag(otherteamflag)) {
        flag_set(otherteamflag);
        assertex(isdefined(level.var_9105385a7ecadc0c), "<dev string:x1c>");
        showsplashtoteam(otherteam, "gold_rush_steal", undefined, undefined, undefined, undefined, level.var_9105385a7ecadc0c);
        thread function_87134192ff77be44(otherteamflag);
    }
}

// Namespace namespace_76b8c9d9aeef6321 / namespace_9e3a2df040c9b328
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa8a
// Size: 0x16
function function_87134192ff77be44(otherteamflag) {
    wait 10;
    flag_clear(otherteamflag);
}

// Namespace namespace_76b8c9d9aeef6321 / namespace_9e3a2df040c9b328
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaa8
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

// Namespace namespace_76b8c9d9aeef6321 / namespace_9e3a2df040c9b328
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb1a
// Size: 0x3c
function function_a7de388c32637f42(objectivekey) {
    if (objectivekey == "_a" || objectivekey == "_b") {
        ownerteam = "enemy";
    } else {
        ownerteam = "any";
    }
    return ownerteam;
}

// Namespace namespace_76b8c9d9aeef6321 / namespace_9e3a2df040c9b328
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb5f
// Size: 0x55
function function_f01b3311ea2144e(moneypile) {
    scripts\mp\gamescore::_setteamscore(moneypile.ownerteam, moneypile.currentmoney);
    if (moneypile.currentmoney == 0) {
        moneypile scripts\mp\gameobjects::setvisibleteam("friendly");
        return;
    }
    moneypile scripts\mp\gameobjects::setvisibleteam("any");
}

// Namespace namespace_76b8c9d9aeef6321 / namespace_9e3a2df040c9b328
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbbc
// Size: 0x31
function function_896249bc3c12863d() {
    if (level.var_ecec7a4115b35c9.size == level.var_9916fff305749068) {
        level.var_9916fff305749068 = 1;
        return;
    }
    level.var_9916fff305749068++;
}

// Namespace namespace_76b8c9d9aeef6321 / namespace_9e3a2df040c9b328
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbf5
// Size: 0x77
function function_9030f4d114a157df(var_6a0664dbed9c56fc) {
    foreach (var_963ddbf1bda4c460 in level.var_ecec7a4115b35c9) {
        if (var_963ddbf1bda4c460 == var_6a0664dbed9c56fc) {
            thread function_c9dce10ad224933a(var_963ddbf1bda4c460);
            continue;
        }
        function_e61ac104d25c6faa(var_963ddbf1bda4c460, "none", 0);
    }
}

// Namespace namespace_76b8c9d9aeef6321 / namespace_9e3a2df040c9b328
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc74
// Size: 0x1d
function function_c9dce10ad224933a(var_963ddbf1bda4c460) {
    wait 5;
    function_e61ac104d25c6faa(var_963ddbf1bda4c460, "any", 20);
}

// Namespace namespace_76b8c9d9aeef6321 / namespace_9e3a2df040c9b328
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc99
// Size: 0xcf
function function_e61ac104d25c6faa(var_963ddbf1bda4c460, visibility, currentmoney) {
    var_963ddbf1bda4c460 setvisibleteam(visibility);
    var_963ddbf1bda4c460 allowuse(visibility);
    var_963ddbf1bda4c460.currentmoney = currentmoney;
    foreach (var_5658359672a6082c in level.var_c78ba5dba4b7d426) {
        if (int(var_5658359672a6082c.script_objective) == int(var_963ddbf1bda4c460.trigger.script_objective)) {
            if (visibility == "any") {
                var_5658359672a6082c show();
                continue;
            }
            var_5658359672a6082c hide();
        }
    }
}

