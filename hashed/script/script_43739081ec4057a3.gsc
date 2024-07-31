#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\cp_mp\execution.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\common\values.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\mp\laststand.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\gameobjects.gsc;
#using script_5762ac2f22202ba2;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\hud_message.gsc;

#namespace slam;

// Namespace slam / namespace_43e92069a3483f97
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x7e6
// Size: 0x9c
function autoexec main() {
    registersharedfunc("slam", "init", &function_99c2893e90fac8b);
    registersharedfunc("slam", "setLastStandMessage", &function_c88bd46173b8ea14);
    registersharedfunc("slam", "onNormalDeath", &function_14712550e86f996f);
    registersharedfunc("slam", "onPlayerConnect", &function_57e9047c08ccd941);
    registersharedfunc("slam", "initializeMatchRules", &function_b818eedef86c1a7b);
    registersharedfunc("slam", "isSlamAnnouncerLine", &function_5febe066472a9de5);
    registersharedfunc("slam", "getSoundName", &function_6abe4ad568596595);
}

// Namespace slam / namespace_43e92069a3483f97
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x88a
// Size: 0xf9
function function_99c2893e90fac8b() {
    level.var_b57e01a4f8558a6b = &function_5f480f5e6055cc0b;
    level.var_a0fbb4b3fcdcc138 = &function_2ecd88252e67c89a;
    level.var_c53947782c7460f6 = 1;
    level.var_74fe55f9c2b0222 = 1;
    level.var_7607dacdbd5ba02 = 1;
    level.var_425a393024ec491f = 1;
    level.var_9af86da599e041f = 1;
    level.addlaststandoverheadiconcallback = &function_7bb83dadb9e6cd29;
    level.modifyplayerdamage = &function_67022d6a7b9cc0b7;
    level callback::add("player_laststand", &function_a5957986356a54cf);
    level callback::add("player_revived", &function_4d4c9064d5060fa4);
    level.var_7b95bf8778b8724e = ["jup_mp_execution_caramel_01_slam", "jup_mp_execution_mochi_01_slam", "jup_mp_execution_gelato_01_slam", "jup_mp_execution_chair_01_slam", "jup_mp_execution_pbomb_01_slam"];
    function_d1706ac032d53d89();
    function_d0b0c15fe651dd0f();
    /#
        level thread scripts\cp_mp\utility\debug_utility::waitfordvar(@"hash_ca17e0de7b7a9fa3", "<dev string:x1c>", &function_10d71f04bcc13032);
    #/
}

// Namespace slam / namespace_43e92069a3483f97
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x98b
// Size: 0x12
function function_b818eedef86c1a7b() {
    setdynamicdvar(@"hash_683d3e309194e766", 0);
}

// Namespace slam / namespace_43e92069a3483f97
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9a5
// Size: 0x1a
function function_57e9047c08ccd941() {
    thread function_86fe7027eb5a831e();
    thread function_440ab83a1d4f23b();
    thread function_c99f94326ccb590a();
}

// Namespace slam / namespace_43e92069a3483f97
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9c7
// Size: 0xd1
function function_5f480f5e6055cc0b() {
    self endon("death_or_disconnect");
    self endon("last_stand_finished");
    self endon("last_stand_heal_active");
    level endon("game_ended");
    thread scripts\mp\laststand::showsuicidehintstring();
    var_797160dfebc76fdf = 0;
    while (self.timeuntilbleedout > level.framedurationseconds) {
        waitframe();
        if (!function_f88619eaafbd0adb()) {
            var_797160dfebc76fdf += level.framedurationseconds;
            if (var_797160dfebc76fdf >= 0.75) {
                self notify("last_stand_bleedout");
                return;
            }
        }
        if (self isinexecutionvictim()) {
            continue;
        } else if (istrue(self.beingrevived)) {
            continue;
        }
        self.timeuntilbleedout -= level.framedurationseconds;
    }
    if (function_afc2fae8e95d004e()) {
        self notify("last_stand_self_revive");
        return;
    }
    self notify("last_stand_bleedout");
}

// Namespace slam / namespace_43e92069a3483f97
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaa0
// Size: 0x28
function function_f88619eaafbd0adb() {
    if (self getstanceblocked("stand") || self isswimming() || self isswimunderwater()) {
        return false;
    }
    return true;
}

// Namespace slam / namespace_43e92069a3483f97
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xad1
// Size: 0x9c
function function_c88bd46173b8ea14() {
    if (istrue(getbeingrevivedinternal())) {
        setlowermessageomnvar("being_revived");
        return;
    }
    if (isdefined(self.timeuntilbleedout)) {
        time = int(gettime() + self.timeuntilbleedout * 1000);
        if (function_e7667a0205b50f63()) {
            setlowermessageomnvar("slam_mash_back_up", time);
        } else if (function_afc2fae8e95d004e()) {
            setlowermessageomnvar("slam_get_up", time);
        } else {
            setlowermessageomnvar("slam_bleedout", time);
        }
        return;
    }
    assertmsg("<dev string:x25>");
}

// Namespace slam / namespace_43e92069a3483f97
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb75
// Size: 0x5f
function function_a5957986356a54cf(params) {
    attacker = self.laststandattacker;
    if (isdefined(attacker)) {
        attacker scripts\mp\utility\stats::incpersstat("downs", 1);
        attacker setextrascore2(attacker.pers["downs"]);
        attacker thread scripts\mp\utility\points::doScoreEvent(#"hash_645acd0ffdb61b01");
    }
}

// Namespace slam / namespace_43e92069a3483f97
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbdc
// Size: 0x4f
function function_4d4c9064d5060fa4(params) {
    reviver = params.reviver;
    if (isdefined(reviver)) {
        reviver scripts\mp\utility\stats::incpersstat("rescues", 1);
        reviver setextrascore1(reviver.pers["rescues"]);
    }
}

// Namespace slam / namespace_43e92069a3483f97
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc33
// Size: 0x10b
function function_7bb83dadb9e6cd29() {
    offset = 25;
    var_e0e11f3b4551be11 = 1;
    var_c5409ca7522182b3 = 1280;
    naturaldist = 250;
    delaytime = undefined;
    var_fa4cf28a58192889 = undefined;
    var_b3ea37733a1577e5 = 0;
    overrideorigin = undefined;
    showonminimap = 0;
    selfteam = self.team;
    var_460a6f9561179887 = "hud_realism_head_revive";
    enemyteam = scripts\mp\utility\teams::getenemyteams(selfteam)[0];
    var_a03e6a46d16f28e3 = "icon_obit_execution_slam";
    var_2b6cf74ebb0a149 = scripts\cp_mp\entityheadicons::setheadicon_singleimage(selfteam, var_460a6f9561179887, offset, var_e0e11f3b4551be11, var_c5409ca7522182b3, naturaldist, delaytime, var_fa4cf28a58192889, var_b3ea37733a1577e5, overrideorigin, showonminimap);
    var_3d4e7bbef551ad7b = scripts\cp_mp\entityheadicons::setheadicon_singleimage(enemyteam, var_a03e6a46d16f28e3, offset, var_e0e11f3b4551be11, var_c5409ca7522182b3, naturaldist, delaytime, var_fa4cf28a58192889, var_b3ea37733a1577e5, overrideorigin, showonminimap);
    thread function_832c04af9af32c16([var_2b6cf74ebb0a149, var_3d4e7bbef551ad7b]);
}

// Namespace slam / namespace_43e92069a3483f97
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd46
// Size: 0x74
function function_832c04af9af32c16(images) {
    level endon("game_ended");
    waittill_any_3("death_or_disconnect", "last_stand_finished", "execution_begin_victim");
    foreach (image in images) {
        scripts\cp_mp\entityheadicons::setheadicon_deleteicon(image);
    }
}

// Namespace slam / namespace_43e92069a3483f97
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdc2
// Size: 0x14
function function_afc2fae8e95d004e() {
    return getdvarint(@"hash_c9aee891770c0b8d", 0) == 1;
}

// Namespace slam / namespace_43e92069a3483f97
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xddf
// Size: 0x109
function function_2ecd88252e67c89a() {
    if (!function_e7667a0205b50f63()) {
        return;
    }
    triggerent = self;
    downedplayer = triggerent.owner;
    level endon("game_ended");
    triggerent endon("death");
    downedplayer endon("death_or_disconnect");
    downedplayer endon("last_stand_revived");
    downedplayer thread scripts\mp\utility\dialog::leaderdialogonplayer("slam_selfRevive");
    triggerent.usetime = getdvarfloat(@"hash_885ea9873e03f006", 4) * 1000;
    downedplayer childthread function_59a3ed040fd89cce(triggerent);
    downedplayer childthread function_4bb9fe8f98ebfde6(triggerent);
    if (!isdefined(self.curprogress)) {
        self.curprogress = 0;
    }
    while (true) {
        if (downedplayer function_f1853bfc82db2449(triggerent) && !istrue(downedplayer.isselfreviving) && !istrue(downedplayer.beingrevived) && (downedplayer isonground() || downedplayer isswimming())) {
            triggerent notify("self_revive_start");
            downedplayer setlaststandselfreviving(1, 0);
            triggerent thread function_abcabdf4cfdbfaad();
        }
        waitframe();
    }
}

// Namespace slam / namespace_43e92069a3483f97
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xef0
// Size: 0x278
function function_abcabdf4cfdbfaad() {
    downedplayer = self.owner;
    triggerent = self;
    level endon("game_ended");
    downedplayer endon("death_or_disconnect");
    downedplayer endon("last_stand_finished");
    triggerent.waitingforteammaterevive = 0;
    triggerent thread scripts\mp\laststand::selfrevivebuttonpresscleanup();
    while (isreallyalive(downedplayer) && downedplayer function_f1853bfc82db2449(triggerent) && triggerent.curprogress < triggerent.usetime) {
        var_2cecc553e0f567e5 = downedplayer function_f1853bfc82db2449(triggerent);
        while (!(downedplayer isonground() || downedplayer isswimming()) && var_2cecc553e0f567e5 && !istrue(downedplayer.isselfreviving)) {
            waitframe();
        }
        if (downedplayer isinexecutionvictim()) {
            break;
        }
        if (istrue(downedplayer.ishaywire)) {
            break;
        }
        if (istrue(downedplayer.beingrevived)) {
            downedplayer scripts\mp\gameobjects::updateuiprogress(triggerent, 1);
            break;
        }
        if (!istrue(downedplayer.isselfreviving)) {
            downedplayer val::group_reset("laststand");
            downedplayer val::set("_group_laststand", "weapon_pickup", 0);
            teststring = downedplayer val::get("gesture");
            downedplayer.isselfreviving = 1;
            downedplayer allowmovement(0);
        }
        triggerent.inuse = 1;
        if (!(downedplayer isonground() || downedplayer isswimming())) {
            break;
        }
        if (triggerent.var_707980067507ff4c) {
            triggerent.curprogress += level.frameduration;
            var_825200ac5ccaaa3e = 1;
        } else if (triggerent.var_f044256ff0d621f2) {
            var_315edb94134021b1 = getdvarfloat(@"hash_b773851f2626c29", 0.04);
            triggerent.curprogress += var_315edb94134021b1 * triggerent.usetime;
            triggerent.var_f044256ff0d621f2 = 0;
            var_825200ac5ccaaa3e = 1;
        } else {
            var_825200ac5ccaaa3e = 0;
        }
        if (var_825200ac5ccaaa3e) {
            downedplayer scripts\mp\gameobjects::updateuiprogress(triggerent, 1);
            if (triggerent.curprogress >= triggerent.usetime) {
                downedplayer finishreviveplayer("self_revive_success", downedplayer);
                return;
            }
        }
        waitframe();
    }
    if (!istrue(downedplayer.beingrevived)) {
        triggerent thread scripts\mp\laststand::decayreviveprogress();
    }
    downedplayer notify("stopped_self_revive");
}

// Namespace slam / namespace_43e92069a3483f97
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1170
// Size: 0x25
function function_f1853bfc82db2449(triggerent) {
    return triggerent.var_707980067507ff4c || triggerent.var_b9f8728be52ed0f4;
}

// Namespace slam / namespace_43e92069a3483f97
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x119e
// Size: 0x95
function function_59a3ed040fd89cce(triggerent) {
    triggerent.var_707980067507ff4c = 0;
    holdtimer = 0;
    while (true) {
        buttonpressed = function_a574593a33de24fc();
        if (buttonpressed && !triggerent.var_707980067507ff4c) {
            if (holdtimer > 0.5) {
                triggerent.var_707980067507ff4c = 1;
            }
            holdtimer += level.framedurationseconds;
        } else if (!buttonpressed && holdtimer > 0) {
            holdtimer = 0;
            triggerent.var_707980067507ff4c = 0;
        }
        waitframe();
    }
}

// Namespace slam / namespace_43e92069a3483f97
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x123b
// Size: 0x100
function function_4bb9fe8f98ebfde6(triggerent) {
    var_5fa2750c58029d0f = 500;
    var_e3832c2eb6ac986f = 100;
    var_e622dabf426fe14 = 0;
    triggerent.var_b9f8728be52ed0f4 = 0;
    triggerent.var_f044256ff0d621f2 = 0;
    var_77e7923a9367562a = 0;
    while (true) {
        buttonpressed = function_a574593a33de24fc();
        if (buttonpressed) {
            var_77e7923a9367562a = 1;
        } else {
            if (var_77e7923a9367562a && !triggerent.var_707980067507ff4c) {
                var_a99de052781ec047 = gettime() - var_e622dabf426fe14;
                if (var_a99de052781ec047 > var_e3832c2eb6ac986f) {
                    var_e622dabf426fe14 = gettime();
                    triggerent.var_b9f8728be52ed0f4 = 1;
                    triggerent.var_f044256ff0d621f2 = 1;
                    self playsound("mp_jup_slam_self_revive_beep");
                }
            }
            var_77e7923a9367562a = 0;
        }
        if (var_e622dabf426fe14 > 0) {
            var_a99de052781ec047 = gettime() - var_e622dabf426fe14;
            if (var_a99de052781ec047 >= var_5fa2750c58029d0f) {
                triggerent.var_b9f8728be52ed0f4 = 0;
                var_e622dabf426fe14 = 0;
            }
        }
        waitframe();
    }
}

// Namespace slam / namespace_43e92069a3483f97
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1343
// Size: 0x1c
function function_a574593a33de24fc() {
    if (self usinggamepad()) {
        return self weaponswitchbuttonpressed();
    }
    return self activatekeypressed();
}

// Namespace slam / namespace_43e92069a3483f97
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1367
// Size: 0x15
function function_e7667a0205b50f63() {
    return getdvarint(@"hash_334ecdb5ff00736e", 1) == 1;
}

// Namespace slam / namespace_43e92069a3483f97
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1385
// Size: 0x40
function function_440ab83a1d4f23b() {
    level endon("game_ended");
    self endon("disconnect");
    while (true) {
        victiment = self waittill("execution_begin");
        self playsound("mp_jup_slam_deathmatch_takedown_bell");
        childthread function_c2a3a2e3045a1cb2();
    }
}

// Namespace slam / namespace_43e92069a3483f97
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13cd
// Size: 0x154
function function_c2a3a2e3045a1cb2() {
    self notify("kill_slam_aura");
    self endon("kill_slam_aura");
    currentstate = self getscriptablepartstate("slam_aura", 1);
    if (!isdefined(currentstate) || currentstate != "on") {
        self setscriptablepartstate("slam_aura", "fade_in", 0);
        enemyteam = scripts\mp\utility\teams::getenemyteams(self.team)[0];
        var_4430b08d5a2d47bf = getdvar(@"hash_ede65e6befd755cd", "outline_nodepth_slam_aura");
        self.var_fc71f1119a8ec847 = outlineenableforteam(self, enemyteam, var_4430b08d5a2d47bf, "lowest");
        wait getdvarfloat(@"hash_64865e773fd023c0", 0.25);
    }
    self setscriptablepartstate("slam_aura", "on", 0);
    val::set("slam_aura", "execution_victim", 0);
    while (self isinexecutionattack()) {
        waitframe();
    }
    wait getdvarfloat(@"hash_1057326b2b3c848f", 3);
    self setscriptablepartstate("slam_aura", "fade_out", 0);
    wait getdvarfloat(@"hash_ac65b5019b915e24", 0.5);
    self setscriptablepartstate("slam_aura", "off", 0);
    outlinedisable(self.var_fc71f1119a8ec847, self);
    self.var_fc71f1119a8ec847 = undefined;
    val::reset_all("slam_aura");
}

// Namespace slam / namespace_43e92069a3483f97
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0x1529
// Size: 0x13b
function function_67022d6a7b9cc0b7(einflictor, victim, eattacker, idamage, smeansofdeath, objweapon, vpoint, vdir, shitloc, idflags, var_be4285b26ed99ab1) {
    var_bda16165c7ad56e4 = victim getscriptablepartstate("slam_aura", 1);
    if (!isdefined(var_bda16165c7ad56e4)) {
        return idamage;
    }
    var_d56e77df51048a93 = getdvarint(@"hash_2455cde97d8db2d0", 1) == 1;
    var_9a8aa3a71bce962 = isdefined(eattacker) && istrue(eattacker.var_f90321da34fafbe5);
    var_8d5389838b26e3bb = var_d56e77df51048a93 && var_9a8aa3a71bce962;
    if (var_8d5389838b26e3bb) {
        victim thread function_78cce736b3f7cd37();
    }
    if (var_bda16165c7ad56e4 == "on") {
        if (var_8d5389838b26e3bb) {
            eattacker damagefeedback::updatedamagefeedback("standard");
        } else {
            eattacker namespace_e072c8407b2a861c::updatedamagefeedback("hitnobulletdamage");
            eattacker playlocalsound("hit_marker_dud");
        }
        return 0;
    }
    if (var_bda16165c7ad56e4 == "fade_out") {
        return (idamage * getdvarfloat(@"hash_447a7caf6eb11aa", 1));
    }
    return idamage;
}

// Namespace slam / namespace_43e92069a3483f97
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x166c
// Size: 0x29
function function_86fe7027eb5a831e() {
    self endon("disconnect");
    level endon("game_ended");
    while (true) {
        self waittill("giveLoadout");
        function_794f0ecfdb065aab(1);
    }
}

// Namespace slam / namespace_43e92069a3483f97
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x169d
// Size: 0xf5
function function_14712550e86f996f(victim, attacker, meansofdeath) {
    if (isdefined(attacker)) {
        attackerteam = attacker.pers["team"];
        if (meansofdeath == "MOD_EXECUTION") {
            if (isdefined(victim.laststandattacker) && victim.laststandattacker != attacker) {
                victim.laststandattacker thread scripts\mp\utility\points::doScoreEvent(#"hash_182b223f67e39ef6");
            }
            attacker function_2d23fda08e64a18a();
            attacker function_794f0ecfdb065aab(0);
            attacker incpersstat("slams", 1);
            attacker setextrascore0(attacker.pers["slams"]);
            var_45ab8896b9f3b36e = getdvarint(@"hash_734eb77424a9cbad", 3);
        } else {
            var_45ab8896b9f3b36e = getdvarint(@"hash_734eb77424a9cbad", 1);
        }
        scripts\mp\gamescore::giveteamscoreforobjective(attackerteam, var_45ab8896b9f3b36e, 0);
    }
}

// Namespace slam / namespace_43e92069a3483f97
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x179a
// Size: 0x145
function function_794f0ecfdb065aab(var_81b876a9a88f82b5) {
    var_a46e27b9cddbcc3e = -1;
    /#
        var_a46e27b9cddbcc3e = getdvarint(@"hash_d6b402f91d329f0c", -1);
    #/
    if (var_81b876a9a88f82b5 && isdefined(self.var_5684c475e6051dd5) && isdefined(self.var_b817fbd95c75c732) && self.lifeid == self.var_5684c475e6051dd5) {
        var_c53d598f47a74ec8 = self.var_b817fbd95c75c732;
    } else if (var_a46e27b9cddbcc3e > -1) {
        if (var_a46e27b9cddbcc3e >= level.var_7b95bf8778b8724e.size) {
            /#
                iprintlnbold("<dev string:x4d>" + level.var_7b95bf8778b8724e.size - 1 + "<dev string:x9f>");
            #/
            return;
        }
        var_c53d598f47a74ec8 = level.var_7b95bf8778b8724e[var_a46e27b9cddbcc3e];
    } else {
        if (isdefined(self.var_b817fbd95c75c732) && level.var_7b95bf8778b8724e.size > 1) {
            var_fb4a6a4e2bbaa66 = array_difference(level.var_7b95bf8778b8724e, [self.var_b817fbd95c75c732]);
        } else {
            var_fb4a6a4e2bbaa66 = level.var_7b95bf8778b8724e;
        }
        var_c53d598f47a74ec8 = array_random(var_fb4a6a4e2bbaa66);
    }
    _giveexecution(var_c53d598f47a74ec8, 0);
    self.var_b817fbd95c75c732 = var_c53d598f47a74ec8;
    self.var_5684c475e6051dd5 = self.lifeid;
}

// Namespace slam / namespace_43e92069a3483f97
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18e7
// Size: 0x101
function function_2d23fda08e64a18a() {
    if (isdefined(self.executionref)) {
        switch (self.executionref) {
        case #"hash_35045a42d684bc52": 
            thread scripts\mp\utility\points::doScoreEvent(#"hash_1678ecd83348b794");
            thread function_4e219021780ba52e("slam_splash_gelato");
            break;
        case #"hash_982264d83dbf6f8d": 
            thread scripts\mp\utility\points::doScoreEvent(#"hash_b6fa59f40f21b237");
            thread function_4e219021780ba52e("slam_splash_caramel");
            break;
        case #"hash_17f631e350a58072": 
            thread scripts\mp\utility\points::doScoreEvent(#"hash_7c22a7db9e8d45b4");
            thread function_4e219021780ba52e("slam_splash_mochi");
            break;
        case #"hash_84b68933c178cd09": 
            thread scripts\mp\utility\points::doScoreEvent(#"hash_a96f715246b2ce8b");
            thread function_4e219021780ba52e("slam_splash_chair");
            break;
        case #"hash_f4ad44ebf245e754": 
            thread scripts\mp\utility\points::doScoreEvent(#"hash_f7b146f7f6eef81b");
            thread function_4e219021780ba52e("slam_splash_pbomb");
            break;
        }
    }
}

// Namespace slam / namespace_43e92069a3483f97
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19f0
// Size: 0x33
function function_4e219021780ba52e(splash) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (self isinexecutionattack()) {
        wait 0.1;
    }
    scripts\mp\hud_message::showsplash(splash);
}

// Namespace slam / namespace_43e92069a3483f97
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a2b
// Size: 0x50
function function_d1706ac032d53d89() {
    level._effect["slam_phd_explode_sm"] = loadfx("vfx/jup/modes/vfx_powerup_dive.vfx");
    level._effect["slam_phd_explode_md"] = loadfx("vfx/jup/modes/vfx_powerup_dive_med.vfx");
    level._effect["slam_phd_explode_lg"] = loadfx("vfx/jup/modes/vfx_powerup_dive_lrg.vfx");
}

// Namespace slam / namespace_43e92069a3483f97
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a83
// Size: 0xf5
function function_c99f94326ccb590a() {
    self endon("disconnect");
    level endon("game_ended");
    var_4376bdd48580556a = 0;
    var_53280e126ee4cdf5 = undefined;
    while (true) {
        if (isreallyalive(self) && !isinlaststand(self)) {
            var_e57af20a66773aa7 = undefined;
            if (self function_c36cfe1c6acaef46()) {
                if (!var_4376bdd48580556a) {
                    var_4376bdd48580556a = 1;
                    var_53280e126ee4cdf5 = self.origin[2];
                }
                if (self isonground() && var_4376bdd48580556a) {
                    var_e57af20a66773aa7 = var_53280e126ee4cdf5 - self.origin[2];
                    level childthread function_61b2d4babb5a23c0(self, var_e57af20a66773aa7);
                    var_53280e126ee4cdf5 = undefined;
                    var_4376bdd48580556a = 0;
                    while (self function_c36cfe1c6acaef46()) {
                        wait 0.1;
                    }
                }
            } else if (self isparachuting() || self isinfreefall()) {
                var_53280e126ee4cdf5 = undefined;
                var_4376bdd48580556a = 0;
            } else if (var_4376bdd48580556a) {
                var_e57af20a66773aa7 = var_53280e126ee4cdf5 - self.origin[2];
                level childthread function_61b2d4babb5a23c0(self, var_e57af20a66773aa7);
                var_53280e126ee4cdf5 = undefined;
                var_4376bdd48580556a = 0;
            }
        }
        waitframe();
    }
}

// Namespace slam / namespace_43e92069a3483f97
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b80
// Size: 0x250
function function_61b2d4babb5a23c0(attacker, height) {
    var_e2421ad69dcbdfcb = getdvarint(@"hash_6ab626df6cd7618c", 0);
    var_acb2d21bae49cb2b = getdvarint(@"hash_ce4d0284ee95f1b6", 125);
    var_1e8299f8103a63d3 = getdvarint(@"hash_d68ff3aa72a4f354", 300);
    var_6a8e583f0b3abbc3 = getdvarint(@"hash_e2e678fe79ef290b", 75);
    damageMedium = getdvarint(@"hash_84b12d022fd0456b", 150);
    var_8aee446bebe070b = getdvarint(@"hash_1abff81fe7855113", 150);
    var_c0dcd0122430509e = getdvarint(@"hash_84fc25281456f868", 100);
    var_6e1e771ffcf07060 = getdvarint(@"hash_e4ea5b789d3542ea", 175);
    var_32c29e69ff9a79aa = getdvarint(@"hash_42e45479cc85b240", 400);
    var_5ac1568ba1c913a9 = "none";
    if ((height >= var_e2421ad69dcbdfcb || var_e2421ad69dcbdfcb <= 0) && height < var_acb2d21bae49cb2b) {
        fx = getfx("slam_phd_explode_sm");
        radius = var_c0dcd0122430509e;
        damage = var_6a8e583f0b3abbc3;
        var_5ac1568ba1c913a9 = "Small";
    } else if (height >= var_acb2d21bae49cb2b && height < var_1e8299f8103a63d3) {
        fx = getfx("slam_phd_explode_md");
        radius = var_6e1e771ffcf07060;
        damage = damageMedium;
        var_5ac1568ba1c913a9 = "Medium";
    } else if (height >= var_1e8299f8103a63d3) {
        fx = getfx("slam_phd_explode_lg");
        radius = var_32c29e69ff9a79aa;
        damage = var_8aee446bebe070b;
        var_5ac1568ba1c913a9 = "Large";
    } else {
        return;
    }
    /#
        thread function_db9bef6bd4a145cf(var_5ac1568ba1c913a9, height);
    #/
    playerforward = anglestoforward(attacker.angles);
    vfxoffset = (playerforward[0], playerforward[1], 0) * getdvarfloat(@"hash_91bca76427b5f040", 50);
    playfx(fx, attacker.origin + vfxoffset);
    attacker.var_f90321da34fafbe5 = 1;
    attacker radiusdamage(attacker.origin, radius, damage, damage, attacker, "MOD_CRUSH");
    waitframe();
    attacker.var_f90321da34fafbe5 = 0;
}

// Namespace slam / namespace_43e92069a3483f97
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1dd8
// Size: 0xa4
function function_78cce736b3f7cd37() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    var_bda16165c7ad56e4 = self getscriptablepartstate("slam_aura", 1);
    if (!isdefined(var_bda16165c7ad56e4) || var_bda16165c7ad56e4 == "off") {
        return;
    }
    if (self isinexecutionattack()) {
        childthread function_bf3ceb7f135c7288();
        wait getdvarfloat(@"hash_764b5b9c32a8a3d5", 0.5);
    }
    val::reset_all("slam_aura");
    self setscriptablepartstate("slam_aura", "off", 0);
    if (isdefined(self.var_fc71f1119a8ec847)) {
        outlinedisable(self.var_fc71f1119a8ec847, self);
    }
    self notify("kill_slam_aura");
}

// Namespace slam / namespace_43e92069a3483f97
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e84
// Size: 0x11
function function_bf3ceb7f135c7288() {
    self disableexecutionattack();
    waitframe();
    self enableexecutionattack();
}

// Namespace slam / namespace_43e92069a3483f97
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e9d
// Size: 0x5c
function function_d0b0c15fe651dd0f() {
    game["dialog"]["gametype"] = "dx_mp_mpct_mode_ctrd_name";
    game["dialog"]["offense_obj"] = "dx_mp_mpct_mode_ctrd_bost";
    game["dialog"]["defense_obj"] = "dx_mp_mpct_mode_ctrd_bost";
    game["dialog"]["slam_selfRevive"] = "dx_mp_mpct_mode_ctrd_gsrv";
    level.var_97a53e173c277570 = 2;
}

// Namespace slam / namespace_43e92069a3483f97
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f01
// Size: 0x3d
function function_5febe066472a9de5(dialog) {
    if (issubstr(dialog, "gmst_anno") || dialog == "dx_mp_mpct_mode_ctrd_name" || dialog == "dx_mp_mpct_mode_ctrd_bost" || dialog == "dx_mp_mpct_mode_ctrd_gsrv") {
        return 1;
    }
}

// Namespace slam / namespace_43e92069a3483f97
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f46
// Size: 0x4b
function function_6abe4ad568596595(dialog) {
    if (issubstr(dialog, "gmst_anno")) {
        prefix = "dx_mp_mpct_mode_ctrd_";
        var_9ae55bedba1d14d6 = strtok(dialog, "_");
        return (prefix + var_9ae55bedba1d14d6[5]);
    }
    return dialog;
}

/#

    // Namespace slam / namespace_43e92069a3483f97
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1f99
    // Size: 0x18
    function function_10d71f04bcc13032(newvalue) {
        level.laststandtimer = newvalue;
    }

    // Namespace slam / namespace_43e92069a3483f97
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x1fb9
    // Size: 0x4c
    function function_db9bef6bd4a145cf(var_5ac1568ba1c913a9, height) {
        if (getdvarint(@"hash_620591c9220c726d", 0) == 1) {
            wait 0.5;
            iprintlnbold("<dev string:xa4>" + var_5ac1568ba1c913a9 + "<dev string:xae>" + height + "<dev string:x9f>");
        }
    }

#/
