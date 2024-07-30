#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\weapon.gsc;

#namespace namespace_4925be476a433a59;

// Namespace namespace_4925be476a433a59 / namespace_6b49ddb858f34366
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x608
// Size: 0x40
function function_9c138fdbc077542() {
    if (getdvarint(@"hash_2c0a995859575abf", 1) == 0) {
        return false;
    }
    if (issp() || iscp() || getgametype() == "ob") {
        return false;
    }
    return true;
}

// Namespace namespace_4925be476a433a59 / namespace_6b49ddb858f34366
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x651
// Size: 0xac
function private function_7e3861fd7026453() {
    if (!isplayer(self) || isai(self)) {
        return 0;
    }
    if (scripts\mp\gamelogic::inprematch()) {
        return 0;
    }
    if (!getdvarint(@"hash_fb8b7d9d75c19daf", 0) && scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        return 0;
    }
    if (isdefined(self.var_e557be412f9c91ab)) {
        return self.var_e557be412f9c91ab;
    }
    if (!function_9c138fdbc077542()) {
        self.var_e557be412f9c91ab = 0;
        return 0;
    }
    if (istrue(level.var_f20fe98bf14887b6)) {
        self.var_e557be412f9c91ab = 0;
        return 0;
    }
    if (!isdefined(getpersstat("weapKills"))) {
        function_69043ccdd6af91e1();
        return 0;
    }
    self.var_e557be412f9c91ab = 1;
    return 1;
}

// Namespace namespace_4925be476a433a59 / namespace_6b49ddb858f34366
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x706
// Size: 0x31
function function_e6dddb660c52817() {
    self endon("disconnect");
    if (!function_7e3861fd7026453()) {
        return;
    }
    if (isplayer(self)) {
        function_69043ccdd6af91e1();
        function_adcb155953291ec7();
        function_15f9e82b69d4c27a();
    }
}

// Namespace namespace_4925be476a433a59 / namespace_6b49ddb858f34366
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73f
// Size: 0xfa
function function_15f9e82b69d4c27a() {
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        self setclientomnvar("ui_gameplay_telemetry_operatorsDown", isdefined(getpersstat("operatorsDown")) ? getpersstat("operatorsDown") : 0);
        self setclientomnvar("ui_gameplay_telemetry_teamRevive", isdefined(getpersstat("teamRevive")) ? getpersstat("teamRevive") : 0);
        self setclientomnvar("ui_gameplay_telemetry_teamWipe", isdefined(getpersstat("teamWipe")) ? getpersstat("teamWipe") : 0);
    } else {
        childthread function_7018e21062adbaa();
        function_d8eb5fb3b35ed1a1();
        function_f1b4726896f5c0c9();
        self setclientomnvar("ui_gameplay_telemetry_lastkill_dist", isdefined(getpersstat("lastKillRange")) ? getpersstat("lastKillRange") : 0);
    }
    function_298b6dd0b26f13bd();
    self.damagedealt = isdefined(getpersstat("damageDealt")) ? getpersstat("damageDealt") : 0;
}

// Namespace namespace_4925be476a433a59 / namespace_6b49ddb858f34366
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x841
// Size: 0xea
function function_69043ccdd6af91e1() {
    if (!isdefined(getpersstat("weapKills"))) {
        if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            self.pers["weapDowned"] = [];
            self.pers["weapLastKillDistance"] = [];
            self.pers["weapLongestKillDistance"] = [];
        } else {
            self.pers["weapDeaths"] = [];
            self.pers["weapKDRatio"] = [];
            self.pers["weapHeadShotCount"] = [];
            self.pers["weapHeadShotAccuracy"] = [];
        }
        self.pers["weapKills"] = [];
        self.pers["weapShotFired"] = [];
        self.pers["weapShotHit"] = [];
        self.pers["weapAccuracy"] = [];
        self.pers["weapDamageDealt"] = [];
        waitframe();
    }
}

// Namespace namespace_4925be476a433a59 / namespace_6b49ddb858f34366
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x933
// Size: 0x58
function function_ac584dc244d416b1() {
    self endon("disconnect");
    if (!function_7e3861fd7026453() || !scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        return;
    }
    initpersstat("operatorsDown");
    self.pers["operatorsDown"]++;
    self setclientomnvar("ui_gameplay_telemetry_operatorsDown", getpersstat("operatorsDown"));
    function_c29690d78b252bb1();
}

// Namespace namespace_4925be476a433a59 / namespace_6b49ddb858f34366
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x993
// Size: 0x51
function function_b821fe623180790() {
    self endon("disconnect");
    if (!function_7e3861fd7026453() || !scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        return;
    }
    initpersstat("teamRevive");
    self.pers["teamRevive"]++;
    self setclientomnvar("ui_gameplay_telemetry_teamRevive", getpersstat("teamRevive"));
}

// Namespace namespace_4925be476a433a59 / namespace_6b49ddb858f34366
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ec
// Size: 0x51
function function_8c38798d6a558ad0() {
    self endon("disconnect");
    if (!function_7e3861fd7026453() || !scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        return;
    }
    initpersstat("teamWipe");
    self.pers["teamWipe"]++;
    self setclientomnvar("ui_gameplay_telemetry_teamWipe", getpersstat("teamWipe"));
}

// Namespace namespace_4925be476a433a59 / namespace_6b49ddb858f34366
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa45
// Size: 0x6e
function function_298b6dd0b26f13bd() {
    self endon("disconnect");
    if (!function_7e3861fd7026453() || scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        return;
    }
    totalshots = getpersstat("shotsFired");
    totalhits = getpersstat("shotsBulletHit");
    if (isdefined(totalshots) && isdefined(totalhits)) {
        self setclientomnvar("ui_gameplay_telemetry_shotAccuracy", totalhits / max(totalshots, 1) * 100);
    }
}

// Namespace namespace_4925be476a433a59 / namespace_6b49ddb858f34366
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xabb
// Size: 0x3c
function function_f1b4726896f5c0c9() {
    if (!function_7e3861fd7026453() || scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        return;
    }
    totalheadshot = getpersstat("headshots");
    if (isdefined(totalheadshot)) {
        self.headshotcount = totalheadshot;
    }
}

// Namespace namespace_4925be476a433a59 / namespace_6b49ddb858f34366
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaff
// Size: 0x44
function function_d8eb5fb3b35ed1a1() {
    if (!function_7e3861fd7026453() || scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        return;
    }
    killstreakcount = getpersstat("cur_kill_streak");
    if (isdefined(killstreakcount)) {
        self setclientomnvar("ui_gameplay_telemetry_killstreakCount", int(killstreakcount));
    }
}

// Namespace namespace_4925be476a433a59 / namespace_6b49ddb858f34366
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb4b
// Size: 0x62
function function_964e22a27383117d(killdistance) {
    self endon("disconnect");
    if (!function_7e3861fd7026453() || scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        return;
    }
    if (!isdefined(killdistance) || !isnumber(killdistance)) {
        return;
    }
    initpersstat("lastKillRange");
    self.pers["lastKillRange"] = killdistance;
    self setclientomnvar("ui_gameplay_telemetry_lastkill_dist", killdistance);
}

// Namespace namespace_4925be476a433a59 / namespace_6b49ddb858f34366
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb5
// Size: 0x57
function function_7018e21062adbaa() {
    level notify("gameplaytelemetry_finished");
    level endon("gameplayTelemetry_finished");
    level endon("game_ended");
    refresh_rate = 1;
    if (!function_7e3861fd7026453() || scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        return;
    }
    initpersstat("SPM");
    while (true) {
        function_4781d3b961760043();
        wait refresh_rate;
    }
}

// Namespace namespace_4925be476a433a59 / namespace_6b49ddb858f34366
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc14
// Size: 0x4b
function private function_4781d3b961760043() {
    if (!function_7e3861fd7026453() || scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        return;
    }
    spm = function_18fdff35aee0a387();
    self.pers["SPM"] = spm;
    self setclientomnvar("ui_gameplay_telemetry_SPM", int(spm));
}

// Namespace namespace_4925be476a433a59 / namespace_6b49ddb858f34366
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc67
// Size: 0x5f
function function_f9b01f503cdbfd7d(damagevalue) {
    if (!function_7e3861fd7026453()) {
        return;
    }
    scripts\mp\utility\stats::initpersstat("damageDealt");
    incpersstat("damageDealt", damagevalue);
    damagedealt = getpersstat("damageDealt");
    damagedealt = int(clamp(damagedealt, 0, 65535));
    self.damagedealt = damagedealt;
}

// Namespace namespace_4925be476a433a59 / namespace_6b49ddb858f34366
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcce
// Size: 0x73
function function_99b3339dca12abde(damagevalue) {
    if (!function_7e3861fd7026453()) {
        return;
    }
    damagevalue = int(clamp(damagevalue, 0, 65535));
    scripts\mp\utility\stats::initpersstat("damageReceived");
    var_e7ec701163e1b30c = int(clamp(getpersstat("damageReceived") + damagevalue, 0, 65535));
    self.pers["damageReceived"] = var_e7ec701163e1b30c;
    self.damageReceived = var_e7ec701163e1b30c;
}

// Namespace namespace_4925be476a433a59 / namespace_6b49ddb858f34366
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd49
// Size: 0x156
function function_4552872977024e34(victim) {
    self endon("disconnect");
    if (!function_7e3861fd7026453()) {
        return;
    }
    if (isai(victim) && scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        return;
    }
    currentweap = self getcurrentweapon();
    if (!isnullweapon(currentweap)) {
        currweapname = currentweap.basename;
        if (!isdefined(getpersstat("weapKills")[currweapname])) {
            self.pers["weapKills"][currweapname] = 0;
        }
        var_43b647370ff5e8e = 1;
        isprimary = 1;
        if (isdefined(self.primaryweaponobj) && self.primaryweaponobj.basename == currweapname) {
            self setclientomnvar("ui_gameplay_telemetry_weap_pri_kills", getpersstat("weapKills")[currweapname] + 1);
        } else if (isdefined(self.secondaryweaponobj) && self.secondaryweaponobj.basename == currweapname) {
            isprimary = 0;
            self setclientomnvar("ui_gameplay_telemetry_weap_sec_kills", getpersstat("weapKills")[currweapname] + 1);
        } else {
            var_43b647370ff5e8e = 0;
        }
        if (var_43b647370ff5e8e) {
            self.pers["weapKills"][currweapname]++;
            function_51b30814ed768ae6(currweapname, isprimary);
            function_3f473cca053bcacb(currweapname, isprimary);
        }
    }
}

// Namespace namespace_4925be476a433a59 / namespace_6b49ddb858f34366
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xea7
// Size: 0x106
function function_221ea9f08eaf2346() {
    self endon("disconnect");
    if (!function_7e3861fd7026453() || scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        return;
    }
    currentweap = self getcurrentweapon();
    if (!isnullweapon(currentweap)) {
        currweapname = currentweap.basename;
        if (!isdefined(getpersstat("weapDeaths")[currweapname])) {
            self.pers["weapDeaths"][currweapname] = 0;
        }
        var_43b647370ff5e8e = 1;
        isprimary = undefined;
        if (isdefined(self.primaryweaponobj) && self.primaryweaponobj.basename == currweapname) {
            isprimary = 1;
        } else if (isdefined(self.secondaryweaponobj) && self.secondaryweaponobj.basename == currweapname) {
            isprimary = 0;
        } else {
            var_43b647370ff5e8e = 0;
        }
        if (var_43b647370ff5e8e) {
            self.pers["weapDeaths"][currweapname]++;
            function_51b30814ed768ae6(currweapname, isprimary);
        }
    }
}

// Namespace namespace_4925be476a433a59 / namespace_6b49ddb858f34366
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb5
// Size: 0x11a
function function_c29690d78b252bb1() {
    if (!function_7e3861fd7026453() || !scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        return;
    }
    currentweap = self getcurrentweapon();
    if (!isnullweapon(currentweap)) {
        currweapname = currentweap.basename;
        if (!isdefined(getpersstat("weapDowned")[currweapname])) {
            self.pers["weapDowned"][currweapname] = 0;
        }
        var_43b647370ff5e8e = 1;
        isprimary = undefined;
        self.pers["weapDowned"][currweapname]++;
        if (isdefined(self.primaryweaponobj) && self.primaryweaponobj.basename == currweapname) {
            self setclientomnvar("ui_gameplay_telemetry_weap_pri_downs", getpersstat("weapDowned")[currweapname]);
            return;
        }
        if (isdefined(self.secondaryweaponobj) && self.secondaryweaponobj.basename == currweapname) {
            isprimary = 0;
            self setclientomnvar("ui_gameplay_telemetry_weap_sec_downs", getpersstat("weapDowned")[currweapname]);
        }
    }
}

// Namespace namespace_4925be476a433a59 / namespace_6b49ddb858f34366
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10d7
// Size: 0xd8
function private function_51b30814ed768ae6(currweapname, isprimary) {
    if (!function_7e3861fd7026453() || scripts\cp_mp\utility\game_utility::isbrstylegametype() || !isdefined(currweapname) || !isdefined(isprimary)) {
        return;
    }
    weapkillcount = ter_op(isdefined(getpersstat("weapKills")[currweapname]), getpersstat("weapKills")[currweapname], 0);
    weapdeathcount = ter_op(isdefined(getpersstat("weapDeaths")[currweapname]), getpersstat("weapDeaths")[currweapname], 1);
    weapKDRatio = weapkillcount / max(weapdeathcount, 1);
    self.pers["weapKDRatio"][currweapname] = weapKDRatio;
    if (isprimary) {
        self setclientomnvar("ui_gameplay_telemetry_weap_pri_kdratio", weapKDRatio);
        return;
    }
    self setclientomnvar("ui_gameplay_telemetry_weap_sec_kdratio", weapKDRatio);
}

// Namespace namespace_4925be476a433a59 / namespace_6b49ddb858f34366
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11b7
// Size: 0x10b
function function_e08012bdba393c79(damagingweapon, damagevalue) {
    self endon("disconnect");
    if (!function_7e3861fd7026453() || isnullweapon(damagingweapon)) {
        return;
    }
    damagingweaponname = damagingweapon.basename;
    if (!isdefined(getpersstat("weapDamageDealt")[damagingweaponname])) {
        self.pers["weapDamageDealt"][damagingweaponname] = 0;
    }
    self.pers["weapDamageDealt"][damagingweaponname] = getpersstat("weapDamageDealt")[damagingweaponname] + damagevalue;
    if (isdefined(self.primaryweaponobj) && self.primaryweaponobj.basename == damagingweaponname) {
        self setclientomnvar("ui_gameplay_telemetry_weap_pri_damagedealt", getpersstat("weapDamageDealt")[damagingweaponname]);
        return;
    }
    if (isdefined(self.secondaryweaponobj) && self.secondaryweaponobj.basename == damagingweaponname) {
        self setclientomnvar("ui_gameplay_telemetry_weap_sec_damagedealt", getpersstat("weapDamageDealt")[damagingweaponname]);
    }
}

// Namespace namespace_4925be476a433a59 / namespace_6b49ddb858f34366
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ca
// Size: 0x147
function function_a4bd960925ab1205() {
    self endon("disconnect");
    if (!function_7e3861fd7026453() || scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        return;
    }
    currentweap = self getcurrentweapon();
    if (isnullweapon(currentweap) || scripts\mp\utility\weapon::iscacmeleeweapon(currentweap)) {
        return;
    }
    currweapname = currentweap.basename;
    if (!isdefined(getpersstat("weapHeadShotCount")[currweapname])) {
        self.pers["weapHeadShotCount"][currweapname] = 0;
    }
    var_43b647370ff5e8e = 1;
    isprimary = 1;
    if (isdefined(self.primaryweaponobj) && self.primaryweaponobj.basename == currweapname) {
        self setclientomnvar("ui_gameplay_telemetry_weap_pri_headshot_count", getpersstat("weapHeadShotCount")[currweapname] + 1);
    } else if (isdefined(self.secondaryweaponobj) && self.secondaryweaponobj.basename == currweapname) {
        isprimary = 0;
        self setclientomnvar("ui_gameplay_telemetry_weap_sec_headshot_count", getpersstat("weapHeadShotCount")[currweapname] + 1);
    } else {
        var_43b647370ff5e8e = 0;
    }
    if (var_43b647370ff5e8e) {
        self.pers["weapHeadShotCount"][currweapname]++;
        function_3f473cca053bcacb(currweapname, isprimary);
    }
}

// Namespace namespace_4925be476a433a59 / namespace_6b49ddb858f34366
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1419
// Size: 0xdb
function private function_3f473cca053bcacb(currweapname, isprimary) {
    if (!function_7e3861fd7026453() || scripts\cp_mp\utility\game_utility::isbrstylegametype() || !isdefined(currweapname) || !isdefined(isprimary)) {
        return;
    }
    weapkillcount = ter_op(isdefined(getpersstat("weapKills")[currweapname]), getpersstat("weapKills")[currweapname], 1);
    weapHeadShotCount = ter_op(isdefined(getpersstat("weapHeadShotCount")[currweapname]), getpersstat("weapHeadShotCount")[currweapname], 0);
    headshotratio = weapHeadShotCount / max(weapkillcount, 1) * 100;
    self.pers["weapHeadShotAccuracy"][currweapname] = headshotratio;
    if (isprimary) {
        self setclientomnvar("ui_gameplay_telemetry_weap_pri_headshot_accuracy", headshotratio);
        return;
    }
    self setclientomnvar("ui_gameplay_telemetry_weap_sec_headshot_accuracy", headshotratio);
}

// Namespace namespace_4925be476a433a59 / namespace_6b49ddb858f34366
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14fc
// Size: 0x17a
function function_2efd6926efd58b49(hitdetected, isprimary) {
    self endon("disconnect");
    if (!function_7e3861fd7026453()) {
        return;
    }
    currentweap = self getcurrentweapon();
    if (isnullweapon(currentweap) || scripts\mp\utility\weapon::iscacmeleeweapon(currentweap)) {
        return;
    }
    currweapname = currentweap.basename;
    if (!isdefined(getpersstat("weapShotFired")[currweapname])) {
        self.pers["weapShotFired"][currweapname] = 0;
        self.pers["weapShotHit"][currweapname] = 0;
    }
    if (hitdetected) {
        self.pers["weapShotHit"][currweapname]++;
    } else {
        self.pers["weapShotFired"][currweapname]++;
    }
    self.pers["weapAccuracy"][currweapname] = getpersstat("weapShotHit")[currweapname] / max(getpersstat("weapShotFired")[currweapname], 1) * 100;
    if (isdefined(self.primaryweaponobj) && self.primaryweaponobj.basename == currweapname) {
        self setclientomnvar("ui_gameplay_telemetry_weap_pri_accuracy", getpersstat("weapAccuracy")[currweapname]);
        return;
    }
    if (isdefined(self.secondaryweaponobj) && self.secondaryweaponobj.basename == currweapname) {
        self setclientomnvar("ui_gameplay_telemetry_weap_sec_accuracy", getpersstat("weapAccuracy")[currweapname]);
    }
}

// Namespace namespace_4925be476a433a59 / namespace_6b49ddb858f34366
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x167e
// Size: 0x13f
function function_822c6ec14dbe6941(lastkilldistance) {
    if (!function_7e3861fd7026453()) {
        return;
    }
    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        return;
    }
    if (!isdefined(lastkilldistance)) {
        return;
    }
    currentweap = self getcurrentweapon();
    if (isnullweapon(currentweap)) {
        return;
    }
    currweapname = currentweap.basename;
    if (!isdefined(getpersstat("weapLastKillDistance")[currweapname])) {
        self.pers["weapLastKillDistance"][currweapname] = 0;
    }
    self.pers["weapLastKillDistance"][currweapname] = lastkilldistance;
    var_43b647370ff5e8e = 1;
    isprimary = 1;
    if (isdefined(self.primaryweaponobj) && self.primaryweaponobj.basename == currweapname) {
        self setclientomnvar("ui_gameplay_telemetry_weap_pri_dist", getpersstat("weapLastKillDistance")[currweapname]);
    } else if (isdefined(self.secondaryweaponobj) && self.secondaryweaponobj.basename == currweapname) {
        isprimary = 0;
        self setclientomnvar("ui_gameplay_telemetry_weap_sec_dist", getpersstat("weapLastKillDistance")[currweapname]);
    } else {
        var_43b647370ff5e8e = 0;
    }
    if (var_43b647370ff5e8e) {
        function_4fe47f76ff9db96b(lastkilldistance, isprimary, currentweap);
    }
}

// Namespace namespace_4925be476a433a59 / namespace_6b49ddb858f34366
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17c5
// Size: 0xc0
function private function_4fe47f76ff9db96b(lastkilldistance, isprimary, currentweap) {
    if (!isdefined(isprimary)) {
        return;
    }
    currweapname = currentweap.basename;
    if (!isdefined(getpersstat("weapLongestKillDistance")[currweapname])) {
        self.pers["weapLongestKillDistance"][currweapname] = lastkilldistance;
        return;
    }
    if (self.pers["weapLongestKillDistance"][currweapname] < lastkilldistance) {
        self.pers["weapLongestKillDistance"][currweapname] = lastkilldistance;
        if (isprimary) {
            self setclientomnvar("ui_gameplay_telemetry_weap_pri_longest_dist", getpersstat("weapLongestKillDistance")[currweapname]);
            return;
        }
        self setclientomnvar("ui_gameplay_telemetry_weap_sec_longest_dist", getpersstat("weapLongestKillDistance")[currweapname]);
    }
}

// Namespace namespace_4925be476a433a59 / namespace_6b49ddb858f34366
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x188d
// Size: 0x5ec
function function_adcb155953291ec7(var_ff9387e409ebe4a2, var_c51f7affa4c0cd0d) {
    if (!function_7e3861fd7026453()) {
        return;
    }
    checkboth = 0;
    isprimary = 0;
    if (!isdefined(var_ff9387e409ebe4a2)) {
        checkboth = 1;
    } else {
        isprimary = var_ff9387e409ebe4a2;
    }
    if (!isdefined(var_c51f7affa4c0cd0d)) {
        var_c51f7affa4c0cd0d = 0;
    }
    if (var_c51f7affa4c0cd0d && isdefined(self.var_2c1e886765f7b608) && isdefined(self.var_2c1e886765f7b608.basename)) {
        weaponname = self.var_2c1e886765f7b608.basename;
    } else if (isdefined(self.primaryweaponobj) && isdefined(self.primaryweaponobj.basename) && (isprimary || checkboth)) {
        weaponname = self.primaryweaponobj.basename;
    }
    if (isdefined(weaponname) && (isprimary || checkboth)) {
        if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            primarydowns = isdefined(getpersstat("weapDowned")[weaponname]) ? getpersstat("weapDowned")[weaponname] : 0;
            self setclientomnvar("ui_gameplay_telemetry_weap_pri_downs", primarydowns);
            var_c3cce17e819a97e = isdefined(getpersstat("weapLastKillDistance")[weaponname]) ? getpersstat("weapLastKillDistance")[weaponname] : 0;
            self setclientomnvar("ui_gameplay_telemetry_weap_pri_dist", var_c3cce17e819a97e);
            var_9ec85557ffab1f2e = isdefined(getpersstat("weapLongestKillDistance")[weaponname]) ? getpersstat("weapLongestKillDistance")[weaponname] : 0;
            self setclientomnvar("ui_gameplay_telemetry_weap_pri_longest_dist", var_9ec85557ffab1f2e);
        } else {
            primarykdratio = isdefined(getpersstat("weapKDRatio")[weaponname]) ? getpersstat("weapKDRatio")[weaponname] : 0;
            self setclientomnvar("ui_gameplay_telemetry_weap_pri_kdratio", primarykdratio);
            var_7c24d8d7201e0012 = isdefined(getpersstat("weapHeadShotCount")[weaponname]) ? getpersstat("weapHeadShotCount")[weaponname] : 0;
            self setclientomnvar("ui_gameplay_telemetry_weap_pri_headshot_count", var_7c24d8d7201e0012);
            var_215acf2e2d6ff0e9 = isdefined(getpersstat("weapHeadShotAccuracy")[weaponname]) ? getpersstat("weapHeadShotAccuracy")[weaponname] : 0;
            self setclientomnvar("ui_gameplay_telemetry_weap_pri_headshot_accuracy", var_215acf2e2d6ff0e9);
        }
        var_2f852c080f0e1334 = isdefined(getpersstat("weapAccuracy")[weaponname]) ? getpersstat("weapAccuracy")[weaponname] : 0;
        self setclientomnvar("ui_gameplay_telemetry_weap_pri_accuracy", var_2f852c080f0e1334);
        primarykill = isdefined(getpersstat("weapKills")[weaponname]) ? getpersstat("weapKills")[weaponname] : 0;
        self setclientomnvar("ui_gameplay_telemetry_weap_pri_kills", primarykill);
        primarydamagedealt = isdefined(getpersstat("weapDamageDealt")[weaponname]) ? getpersstat("weapDamageDealt")[weaponname] : 0;
        self setclientomnvar("ui_gameplay_telemetry_weap_pri_damagedealt", primarydamagedealt);
    }
    weaponname = undefined;
    if (isdefined(self.secondaryweaponobj) && isdefined(self.secondaryweaponobj.basename) && (!isprimary || checkboth)) {
        weaponname = self.secondaryweaponobj.basename;
    }
    if (var_c51f7affa4c0cd0d && isdefined(self.var_f96aba3b2bb21958) && isdefined(self.var_f96aba3b2bb21958.basename)) {
        weaponname = self.var_f96aba3b2bb21958.basename;
    }
    if (isdefined(weaponname) && (!isprimary || checkboth)) {
        if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            secondarydowns = isdefined(getpersstat("weapDowned")[weaponname]) ? getpersstat("weapDowned")[weaponname] : 0;
            self setclientomnvar("ui_gameplay_telemetry_weap_sec_downs", secondarydowns);
            secondarykilldistance = isdefined(getpersstat("weapLastKillDistance")[weaponname]) ? getpersstat("weapLastKillDistance")[weaponname] : 0;
            self setclientomnvar("ui_gameplay_telemetry_weap_sec_dist", secondarykilldistance);
            var_ea726d34f3ebe296 = isdefined(getpersstat("weapLongestKillDistance")[weaponname]) ? getpersstat("weapLongestKillDistance")[weaponname] : 0;
            self setclientomnvar("ui_gameplay_telemetry_weap_sec_longest_dist", var_ea726d34f3ebe296);
        } else {
            secondarykdratio = isdefined(getpersstat("weapKDRatio")[weaponname]) ? getpersstat("weapKDRatio")[weaponname] : 0;
            self setclientomnvar("ui_gameplay_telemetry_weap_sec_kdratio", secondarykdratio);
            var_6736d6623a51a752 = isdefined(getpersstat("weapHeadShotCount")[weaponname]) ? getpersstat("weapHeadShotCount")[weaponname] : 0;
            self setclientomnvar("ui_gameplay_telemetry_weap_sec_headshot_count", var_6736d6623a51a752);
            var_3351a10825c2cf29 = isdefined(getpersstat("weapHeadShotAccuracy")[weaponname]) ? getpersstat("weapHeadShotAccuracy")[weaponname] : 0;
            self setclientomnvar("ui_gameplay_telemetry_weap_sec_headshot_accuracy", var_3351a10825c2cf29);
        }
        var_3ae90b2c5e766474 = isdefined(getpersstat("weapAccuracy")[weaponname]) ? getpersstat("weapAccuracy")[weaponname] : 0;
        self setclientomnvar("ui_gameplay_telemetry_weap_sec_accuracy", var_3ae90b2c5e766474);
        secondarykill = isdefined(getpersstat("weapKills")[weaponname]) ? getpersstat("weapKills")[weaponname] : 0;
        self setclientomnvar("ui_gameplay_telemetry_weap_sec_kills", secondarykill);
        secondarydamagedealt = isdefined(getpersstat("weapDamageDealt")[weaponname]) ? getpersstat("weapDamageDealt")[weaponname] : 0;
        self setclientomnvar("ui_gameplay_telemetry_weap_sec_damagedealt", secondarydamagedealt);
    }
}

// Namespace namespace_4925be476a433a59 / namespace_6b49ddb858f34366
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e81
// Size: 0x8a
function private function_18fdff35aee0a387() {
    if (!isplayer(self) || isai(self)) {
        return 0;
    }
    currentscore = level.teambased ? self.score : getpersstat("gamemodeScore");
    if (!isdefined(currentscore)) {
        return 0;
    }
    minutespassed = getgamelength() / 60000;
    if (minutespassed <= 0) {
        return 0;
    }
    spm = currentscore / minutespassed;
    if (spm > 100000) {
        spm = 100000;
    }
    return spm;
}

// Namespace namespace_4925be476a433a59 / namespace_6b49ddb858f34366
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f14
// Size: 0x31
function function_e90bd443e0a197dd(primaryweaponobj, secondaryweaponobj) {
    if (!function_7e3861fd7026453()) {
        return;
    }
    self.var_2c1e886765f7b608 = primaryweaponobj;
    self.var_f96aba3b2bb21958 = secondaryweaponobj;
}

