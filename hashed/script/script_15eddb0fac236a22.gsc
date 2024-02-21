// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\weapon.gsc;

#namespace namespace_4925be476a433a59;

// Namespace namespace_4925be476a433a59/namespace_6b49ddb858f34366
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x608
// Size: 0x41
function function_9c138fdbc077542() {
    if (getdvarint(@"hash_2c0a995859575abf", 1) == 0) {
        return 0;
    }
    if (issp() || iscp() || getgametype() == "ob") {
        return 0;
    }
    return 1;
}

// Namespace namespace_4925be476a433a59/namespace_6b49ddb858f34366
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x651
// Size: 0xad
function private function_7e3861fd7026453() {
    if (!isplayer(self) || isai(self)) {
        return 0;
    }
    if (namespace_d576b6dc7cef9c62::function_1147bbc93ea9b83c()) {
        return 0;
    }
    if (!getdvarint(@"hash_fb8b7d9d75c19daf", 0) && namespace_36f464722d326bbe::function_beff479639e6508()) {
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

// Namespace namespace_4925be476a433a59/namespace_6b49ddb858f34366
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x706
// Size: 0x32
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

// Namespace namespace_4925be476a433a59/namespace_6b49ddb858f34366
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73f
// Size: 0xfb
function function_15f9e82b69d4c27a() {
    if (namespace_36f464722d326bbe::function_beff479639e6508()) {
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

// Namespace namespace_4925be476a433a59/namespace_6b49ddb858f34366
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x841
// Size: 0xeb
function function_69043ccdd6af91e1() {
    if (!isdefined(getpersstat("weapKills"))) {
        if (namespace_36f464722d326bbe::function_beff479639e6508()) {
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

// Namespace namespace_4925be476a433a59/namespace_6b49ddb858f34366
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x933
// Size: 0x59
function function_ac584dc244d416b1() {
    self endon("disconnect");
    if (!function_7e3861fd7026453() || !namespace_36f464722d326bbe::function_beff479639e6508()) {
        return;
    }
    initpersstat("operatorsDown");
    self.pers["operatorsDown"]++;
    self setclientomnvar("ui_gameplay_telemetry_operatorsDown", getpersstat("operatorsDown"));
    function_c29690d78b252bb1();
}

// Namespace namespace_4925be476a433a59/namespace_6b49ddb858f34366
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x993
// Size: 0x52
function function_b821fe623180790() {
    self endon("disconnect");
    if (!function_7e3861fd7026453() || !namespace_36f464722d326bbe::function_beff479639e6508()) {
        return;
    }
    initpersstat("teamRevive");
    self.pers["teamRevive"]++;
    self setclientomnvar("ui_gameplay_telemetry_teamRevive", getpersstat("teamRevive"));
}

// Namespace namespace_4925be476a433a59/namespace_6b49ddb858f34366
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ec
// Size: 0x52
function function_8c38798d6a558ad0() {
    self endon("disconnect");
    if (!function_7e3861fd7026453() || !namespace_36f464722d326bbe::function_beff479639e6508()) {
        return;
    }
    initpersstat("teamWipe");
    self.pers["teamWipe"]++;
    self setclientomnvar("ui_gameplay_telemetry_teamWipe", getpersstat("teamWipe"));
}

// Namespace namespace_4925be476a433a59/namespace_6b49ddb858f34366
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa45
// Size: 0x6f
function function_298b6dd0b26f13bd() {
    self endon("disconnect");
    if (!function_7e3861fd7026453() || namespace_36f464722d326bbe::function_beff479639e6508()) {
        return;
    }
    var_c1480a81b0387196 = getpersstat("shotsFired");
    totalhits = getpersstat("shotsBulletHit");
    if (isdefined(var_c1480a81b0387196) && isdefined(totalhits)) {
        self setclientomnvar("ui_gameplay_telemetry_shotAccuracy", totalhits / max(var_c1480a81b0387196, 1) * 100);
    }
}

// Namespace namespace_4925be476a433a59/namespace_6b49ddb858f34366
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xabb
// Size: 0x3d
function function_f1b4726896f5c0c9() {
    if (!function_7e3861fd7026453() || namespace_36f464722d326bbe::function_beff479639e6508()) {
        return;
    }
    var_905e29bee1ef88cf = getpersstat("headshots");
    if (isdefined(var_905e29bee1ef88cf)) {
        self.var_2c15b791eac7fc46 = var_905e29bee1ef88cf;
    }
}

// Namespace namespace_4925be476a433a59/namespace_6b49ddb858f34366
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaff
// Size: 0x45
function function_d8eb5fb3b35ed1a1() {
    if (!function_7e3861fd7026453() || namespace_36f464722d326bbe::function_beff479639e6508()) {
        return;
    }
    killstreakcount = getpersstat("cur_kill_streak");
    if (isdefined(killstreakcount)) {
        self setclientomnvar("ui_gameplay_telemetry_killstreakCount", int(killstreakcount));
    }
}

// Namespace namespace_4925be476a433a59/namespace_6b49ddb858f34366
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb4b
// Size: 0x63
function function_964e22a27383117d(killdistance) {
    self endon("disconnect");
    if (!function_7e3861fd7026453() || namespace_36f464722d326bbe::function_beff479639e6508()) {
        return;
    }
    if (!isdefined(killdistance) || !isnumber(killdistance)) {
        return;
    }
    initpersstat("lastKillRange");
    self.pers["lastKillRange"] = killdistance;
    self setclientomnvar("ui_gameplay_telemetry_lastkill_dist", killdistance);
}

// Namespace namespace_4925be476a433a59/namespace_6b49ddb858f34366
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb5
// Size: 0x58
function function_7018e21062adbaa() {
    level notify("gameplaytelemetry_finished");
    level endon("gameplayTelemetry_finished");
    level endon("game_ended");
    refresh_rate = 1;
    if (!function_7e3861fd7026453() || namespace_36f464722d326bbe::function_beff479639e6508()) {
        return;
    }
    initpersstat("SPM");
    while (1) {
        function_4781d3b961760043();
        wait(refresh_rate);
    }
}

// Namespace namespace_4925be476a433a59/namespace_6b49ddb858f34366
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc14
// Size: 0x4c
function private function_4781d3b961760043() {
    if (!function_7e3861fd7026453() || namespace_36f464722d326bbe::function_beff479639e6508()) {
        return;
    }
    spm = function_18fdff35aee0a387();
    self.pers["SPM"] = spm;
    self setclientomnvar("ui_gameplay_telemetry_SPM", int(spm));
}

// Namespace namespace_4925be476a433a59/namespace_6b49ddb858f34366
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc67
// Size: 0x60
function function_f9b01f503cdbfd7d(var_588b734c8f3298f5) {
    if (!function_7e3861fd7026453()) {
        return;
    }
    namespace_3c5a4254f2b957ea::initpersstat("damageDealt");
    incpersstat("damageDealt", var_588b734c8f3298f5);
    damagedealt = getpersstat("damageDealt");
    damagedealt = int(clamp(damagedealt, 0, 65535));
    self.damagedealt = damagedealt;
}

// Namespace namespace_4925be476a433a59/namespace_6b49ddb858f34366
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcce
// Size: 0x74
function function_99b3339dca12abde(var_588b734c8f3298f5) {
    if (!function_7e3861fd7026453()) {
        return;
    }
    var_588b734c8f3298f5 = int(clamp(var_588b734c8f3298f5, 0, 65535));
    namespace_3c5a4254f2b957ea::initpersstat("damageReceived");
    var_e7ec701163e1b30c = int(clamp(getpersstat("damageReceived") + var_588b734c8f3298f5, 0, 65535));
    self.pers["damageReceived"] = var_e7ec701163e1b30c;
    self.damageReceived = var_e7ec701163e1b30c;
}

// Namespace namespace_4925be476a433a59/namespace_6b49ddb858f34366
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd49
// Size: 0x157
function function_4552872977024e34(victim) {
    self endon("disconnect");
    if (!function_7e3861fd7026453()) {
        return;
    }
    if (isai(victim) && namespace_36f464722d326bbe::function_beff479639e6508()) {
        return;
    }
    var_1afed0877937f203 = self getcurrentweapon();
    if (!isnullweapon(var_1afed0877937f203)) {
        var_3a9e2d5b7c71aec7 = var_1afed0877937f203.basename;
        if (!isdefined(getpersstat("weapKills")[var_3a9e2d5b7c71aec7])) {
            self.pers["weapKills"][var_3a9e2d5b7c71aec7] = 0;
        }
        var_43b647370ff5e8e = 1;
        isprimary = 1;
        if (isdefined(self.primaryweaponobj) && self.primaryweaponobj.basename == var_3a9e2d5b7c71aec7) {
            self setclientomnvar("ui_gameplay_telemetry_weap_pri_kills", getpersstat("weapKills")[var_3a9e2d5b7c71aec7] + 1);
        } else if (isdefined(self.secondaryweaponobj) && self.secondaryweaponobj.basename == var_3a9e2d5b7c71aec7) {
            isprimary = 0;
            self setclientomnvar("ui_gameplay_telemetry_weap_sec_kills", getpersstat("weapKills")[var_3a9e2d5b7c71aec7] + 1);
        } else {
            var_43b647370ff5e8e = 0;
        }
        if (var_43b647370ff5e8e) {
            self.pers["weapKills"][var_3a9e2d5b7c71aec7]++;
            function_51b30814ed768ae6(var_3a9e2d5b7c71aec7, isprimary);
            function_3f473cca053bcacb(var_3a9e2d5b7c71aec7, isprimary);
        }
    }
}

// Namespace namespace_4925be476a433a59/namespace_6b49ddb858f34366
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xea7
// Size: 0x107
function function_221ea9f08eaf2346() {
    self endon("disconnect");
    if (!function_7e3861fd7026453() || namespace_36f464722d326bbe::function_beff479639e6508()) {
        return;
    }
    var_1afed0877937f203 = self getcurrentweapon();
    if (!isnullweapon(var_1afed0877937f203)) {
        var_3a9e2d5b7c71aec7 = var_1afed0877937f203.basename;
        if (!isdefined(getpersstat("weapDeaths")[var_3a9e2d5b7c71aec7])) {
            self.pers["weapDeaths"][var_3a9e2d5b7c71aec7] = 0;
        }
        var_43b647370ff5e8e = 1;
        isprimary = undefined;
        if (isdefined(self.primaryweaponobj) && self.primaryweaponobj.basename == var_3a9e2d5b7c71aec7) {
            isprimary = 1;
        } else if (isdefined(self.secondaryweaponobj) && self.secondaryweaponobj.basename == var_3a9e2d5b7c71aec7) {
            isprimary = 0;
        } else {
            var_43b647370ff5e8e = 0;
        }
        if (var_43b647370ff5e8e) {
            self.pers["weapDeaths"][var_3a9e2d5b7c71aec7]++;
            function_51b30814ed768ae6(var_3a9e2d5b7c71aec7, isprimary);
        }
    }
}

// Namespace namespace_4925be476a433a59/namespace_6b49ddb858f34366
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb5
// Size: 0x11b
function function_c29690d78b252bb1() {
    if (!function_7e3861fd7026453() || !namespace_36f464722d326bbe::function_beff479639e6508()) {
        return;
    }
    var_1afed0877937f203 = self getcurrentweapon();
    if (!isnullweapon(var_1afed0877937f203)) {
        var_3a9e2d5b7c71aec7 = var_1afed0877937f203.basename;
        if (!isdefined(getpersstat("weapDowned")[var_3a9e2d5b7c71aec7])) {
            self.pers["weapDowned"][var_3a9e2d5b7c71aec7] = 0;
        }
        var_43b647370ff5e8e = 1;
        isprimary = undefined;
        self.pers["weapDowned"][var_3a9e2d5b7c71aec7]++;
        if (isdefined(self.primaryweaponobj) && self.primaryweaponobj.basename == var_3a9e2d5b7c71aec7) {
            self setclientomnvar("ui_gameplay_telemetry_weap_pri_downs", getpersstat("weapDowned")[var_3a9e2d5b7c71aec7]);
        } else if (isdefined(self.secondaryweaponobj) && self.secondaryweaponobj.basename == var_3a9e2d5b7c71aec7) {
            isprimary = 0;
            self setclientomnvar("ui_gameplay_telemetry_weap_sec_downs", getpersstat("weapDowned")[var_3a9e2d5b7c71aec7]);
        }
    }
}

// Namespace namespace_4925be476a433a59/namespace_6b49ddb858f34366
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10d7
// Size: 0xd9
function private function_51b30814ed768ae6(var_3a9e2d5b7c71aec7, isprimary) {
    if (!function_7e3861fd7026453() || namespace_36f464722d326bbe::function_beff479639e6508() || !isdefined(var_3a9e2d5b7c71aec7) || !isdefined(isprimary)) {
        return;
    }
    var_d93bdb2b57d8934b = ter_op(isdefined(getpersstat("weapKills")[var_3a9e2d5b7c71aec7]), getpersstat("weapKills")[var_3a9e2d5b7c71aec7], 0);
    var_8607cdd4fc6d9e95 = ter_op(isdefined(getpersstat("weapDeaths")[var_3a9e2d5b7c71aec7]), getpersstat("weapDeaths")[var_3a9e2d5b7c71aec7], 1);
    weapKDRatio = var_d93bdb2b57d8934b / max(var_8607cdd4fc6d9e95, 1);
    self.pers["weapKDRatio"][var_3a9e2d5b7c71aec7] = weapKDRatio;
    if (isprimary) {
        self setclientomnvar("ui_gameplay_telemetry_weap_pri_kdratio", weapKDRatio);
    } else {
        self setclientomnvar("ui_gameplay_telemetry_weap_sec_kdratio", weapKDRatio);
    }
}

// Namespace namespace_4925be476a433a59/namespace_6b49ddb858f34366
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11b7
// Size: 0x10c
function function_e08012bdba393c79(var_e30664b838a2bd4f, var_588b734c8f3298f5) {
    self endon("disconnect");
    if (!function_7e3861fd7026453() || isnullweapon(var_e30664b838a2bd4f)) {
        return;
    }
    var_4d7825b379a8c68c = var_e30664b838a2bd4f.basename;
    if (!isdefined(getpersstat("weapDamageDealt")[var_4d7825b379a8c68c])) {
        self.pers["weapDamageDealt"][var_4d7825b379a8c68c] = 0;
    }
    self.pers["weapDamageDealt"][var_4d7825b379a8c68c] = getpersstat("weapDamageDealt")[var_4d7825b379a8c68c] + var_588b734c8f3298f5;
    if (isdefined(self.primaryweaponobj) && self.primaryweaponobj.basename == var_4d7825b379a8c68c) {
        self setclientomnvar("ui_gameplay_telemetry_weap_pri_damagedealt", getpersstat("weapDamageDealt")[var_4d7825b379a8c68c]);
    } else if (isdefined(self.secondaryweaponobj) && self.secondaryweaponobj.basename == var_4d7825b379a8c68c) {
        self setclientomnvar("ui_gameplay_telemetry_weap_sec_damagedealt", getpersstat("weapDamageDealt")[var_4d7825b379a8c68c]);
    }
}

// Namespace namespace_4925be476a433a59/namespace_6b49ddb858f34366
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ca
// Size: 0x148
function function_a4bd960925ab1205() {
    self endon("disconnect");
    if (!function_7e3861fd7026453() || namespace_36f464722d326bbe::function_beff479639e6508()) {
        return;
    }
    var_1afed0877937f203 = self getcurrentweapon();
    if (isnullweapon(var_1afed0877937f203) || namespace_68e641469fde3fa7::iscacmeleeweapon(var_1afed0877937f203)) {
        return;
    }
    var_3a9e2d5b7c71aec7 = var_1afed0877937f203.basename;
    if (!isdefined(getpersstat("weapHeadShotCount")[var_3a9e2d5b7c71aec7])) {
        self.pers["weapHeadShotCount"][var_3a9e2d5b7c71aec7] = 0;
    }
    var_43b647370ff5e8e = 1;
    isprimary = 1;
    if (isdefined(self.primaryweaponobj) && self.primaryweaponobj.basename == var_3a9e2d5b7c71aec7) {
        self setclientomnvar("ui_gameplay_telemetry_weap_pri_headshot_count", getpersstat("weapHeadShotCount")[var_3a9e2d5b7c71aec7] + 1);
    } else if (isdefined(self.secondaryweaponobj) && self.secondaryweaponobj.basename == var_3a9e2d5b7c71aec7) {
        isprimary = 0;
        self setclientomnvar("ui_gameplay_telemetry_weap_sec_headshot_count", getpersstat("weapHeadShotCount")[var_3a9e2d5b7c71aec7] + 1);
    } else {
        var_43b647370ff5e8e = 0;
    }
    if (var_43b647370ff5e8e) {
        self.pers["weapHeadShotCount"][var_3a9e2d5b7c71aec7]++;
        function_3f473cca053bcacb(var_3a9e2d5b7c71aec7, isprimary);
    }
}

// Namespace namespace_4925be476a433a59/namespace_6b49ddb858f34366
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1419
// Size: 0xdc
function private function_3f473cca053bcacb(var_3a9e2d5b7c71aec7, isprimary) {
    if (!function_7e3861fd7026453() || namespace_36f464722d326bbe::function_beff479639e6508() || !isdefined(var_3a9e2d5b7c71aec7) || !isdefined(isprimary)) {
        return;
    }
    var_d93bdb2b57d8934b = ter_op(isdefined(getpersstat("weapKills")[var_3a9e2d5b7c71aec7]), getpersstat("weapKills")[var_3a9e2d5b7c71aec7], 1);
    weapHeadShotCount = ter_op(isdefined(getpersstat("weapHeadShotCount")[var_3a9e2d5b7c71aec7]), getpersstat("weapHeadShotCount")[var_3a9e2d5b7c71aec7], 0);
    var_e072c62a7caf0b7a = weapHeadShotCount / max(var_d93bdb2b57d8934b, 1) * 100;
    self.pers["weapHeadShotAccuracy"][var_3a9e2d5b7c71aec7] = var_e072c62a7caf0b7a;
    if (isprimary) {
        self setclientomnvar("ui_gameplay_telemetry_weap_pri_headshot_accuracy", var_e072c62a7caf0b7a);
    } else {
        self setclientomnvar("ui_gameplay_telemetry_weap_sec_headshot_accuracy", var_e072c62a7caf0b7a);
    }
}

// Namespace namespace_4925be476a433a59/namespace_6b49ddb858f34366
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14fc
// Size: 0x17b
function function_2efd6926efd58b49(var_4c5af1436b907718, isprimary) {
    self endon("disconnect");
    if (!function_7e3861fd7026453()) {
        return;
    }
    var_1afed0877937f203 = self getcurrentweapon();
    if (isnullweapon(var_1afed0877937f203) || namespace_68e641469fde3fa7::iscacmeleeweapon(var_1afed0877937f203)) {
        return;
    }
    var_3a9e2d5b7c71aec7 = var_1afed0877937f203.basename;
    if (!isdefined(getpersstat("weapShotFired")[var_3a9e2d5b7c71aec7])) {
        self.pers["weapShotFired"][var_3a9e2d5b7c71aec7] = 0;
        self.pers["weapShotHit"][var_3a9e2d5b7c71aec7] = 0;
    }
    if (var_4c5af1436b907718) {
        self.pers["weapShotHit"][var_3a9e2d5b7c71aec7]++;
    } else {
        self.pers["weapShotFired"][var_3a9e2d5b7c71aec7]++;
    }
    self.pers["weapAccuracy"][var_3a9e2d5b7c71aec7] = getpersstat("weapShotHit")[var_3a9e2d5b7c71aec7] / max(getpersstat("weapShotFired")[var_3a9e2d5b7c71aec7], 1) * 100;
    if (isdefined(self.primaryweaponobj) && self.primaryweaponobj.basename == var_3a9e2d5b7c71aec7) {
        self setclientomnvar("ui_gameplay_telemetry_weap_pri_accuracy", getpersstat("weapAccuracy")[var_3a9e2d5b7c71aec7]);
    } else if (isdefined(self.secondaryweaponobj) && self.secondaryweaponobj.basename == var_3a9e2d5b7c71aec7) {
        self setclientomnvar("ui_gameplay_telemetry_weap_sec_accuracy", getpersstat("weapAccuracy")[var_3a9e2d5b7c71aec7]);
    }
}

// Namespace namespace_4925be476a433a59/namespace_6b49ddb858f34366
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x167e
// Size: 0x140
function function_822c6ec14dbe6941(var_b1b87c549c612576) {
    if (!function_7e3861fd7026453()) {
        return;
    }
    if (!namespace_36f464722d326bbe::function_beff479639e6508()) {
        return;
    }
    if (!isdefined(var_b1b87c549c612576)) {
        return;
    }
    var_1afed0877937f203 = self getcurrentweapon();
    if (isnullweapon(var_1afed0877937f203)) {
        return;
    }
    var_3a9e2d5b7c71aec7 = var_1afed0877937f203.basename;
    if (!isdefined(getpersstat("weapLastKillDistance")[var_3a9e2d5b7c71aec7])) {
        self.pers["weapLastKillDistance"][var_3a9e2d5b7c71aec7] = 0;
    }
    self.pers["weapLastKillDistance"][var_3a9e2d5b7c71aec7] = var_b1b87c549c612576;
    var_43b647370ff5e8e = 1;
    isprimary = 1;
    if (isdefined(self.primaryweaponobj) && self.primaryweaponobj.basename == var_3a9e2d5b7c71aec7) {
        self setclientomnvar("ui_gameplay_telemetry_weap_pri_dist", getpersstat("weapLastKillDistance")[var_3a9e2d5b7c71aec7]);
    } else if (isdefined(self.secondaryweaponobj) && self.secondaryweaponobj.basename == var_3a9e2d5b7c71aec7) {
        isprimary = 0;
        self setclientomnvar("ui_gameplay_telemetry_weap_sec_dist", getpersstat("weapLastKillDistance")[var_3a9e2d5b7c71aec7]);
    } else {
        var_43b647370ff5e8e = 0;
    }
    if (var_43b647370ff5e8e) {
        function_4fe47f76ff9db96b(var_b1b87c549c612576, isprimary, var_1afed0877937f203);
    }
}

// Namespace namespace_4925be476a433a59/namespace_6b49ddb858f34366
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17c5
// Size: 0xc1
function private function_4fe47f76ff9db96b(var_b1b87c549c612576, isprimary, var_1afed0877937f203) {
    if (!isdefined(isprimary)) {
        return;
    }
    var_3a9e2d5b7c71aec7 = var_1afed0877937f203.basename;
    if (!isdefined(getpersstat("weapLongestKillDistance")[var_3a9e2d5b7c71aec7])) {
        self.pers["weapLongestKillDistance"][var_3a9e2d5b7c71aec7] = var_b1b87c549c612576;
    } else if (self.pers["weapLongestKillDistance"][var_3a9e2d5b7c71aec7] < var_b1b87c549c612576) {
        self.pers["weapLongestKillDistance"][var_3a9e2d5b7c71aec7] = var_b1b87c549c612576;
        if (isprimary) {
            self setclientomnvar("ui_gameplay_telemetry_weap_pri_longest_dist", getpersstat("weapLongestKillDistance")[var_3a9e2d5b7c71aec7]);
        } else {
            self setclientomnvar("ui_gameplay_telemetry_weap_sec_longest_dist", getpersstat("weapLongestKillDistance")[var_3a9e2d5b7c71aec7]);
        }
    }
}

// Namespace namespace_4925be476a433a59/namespace_6b49ddb858f34366
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x188d
// Size: 0x5ed
function function_adcb155953291ec7(var_ff9387e409ebe4a2, var_c51f7affa4c0cd0d) {
    if (!function_7e3861fd7026453()) {
        return;
    }
    var_2e5f03c228e30968 = 0;
    isprimary = 0;
    if (!isdefined(var_ff9387e409ebe4a2)) {
        var_2e5f03c228e30968 = 1;
    } else {
        isprimary = var_ff9387e409ebe4a2;
    }
    if (!isdefined(var_c51f7affa4c0cd0d)) {
        var_c51f7affa4c0cd0d = 0;
    }
    if (var_c51f7affa4c0cd0d && isdefined(self.var_2c1e886765f7b608) && isdefined(self.var_2c1e886765f7b608.basename)) {
        weaponname = self.var_2c1e886765f7b608.basename;
    } else if (isdefined(self.primaryweaponobj) && isdefined(self.primaryweaponobj.basename) && (isprimary || var_2e5f03c228e30968)) {
        weaponname = self.primaryweaponobj.basename;
    }
    if (isdefined(weaponname) && (isprimary || var_2e5f03c228e30968)) {
        if (namespace_36f464722d326bbe::function_beff479639e6508()) {
            var_e3d273698f311dc2 = isdefined(getpersstat("weapDowned")[weaponname]) ? getpersstat("weapDowned")[weaponname] : 0;
            self setclientomnvar("ui_gameplay_telemetry_weap_pri_downs", var_e3d273698f311dc2);
            var_c3cce17e819a97e = isdefined(getpersstat("weapLastKillDistance")[weaponname]) ? getpersstat("weapLastKillDistance")[weaponname] : 0;
            self setclientomnvar("ui_gameplay_telemetry_weap_pri_dist", var_c3cce17e819a97e);
            var_9ec85557ffab1f2e = isdefined(getpersstat("weapLongestKillDistance")[weaponname]) ? getpersstat("weapLongestKillDistance")[weaponname] : 0;
            self setclientomnvar("ui_gameplay_telemetry_weap_pri_longest_dist", var_9ec85557ffab1f2e);
        } else {
            var_9414c240815f3569 = isdefined(getpersstat("weapKDRatio")[weaponname]) ? getpersstat("weapKDRatio")[weaponname] : 0;
            self setclientomnvar("ui_gameplay_telemetry_weap_pri_kdratio", var_9414c240815f3569);
            var_7c24d8d7201e0012 = isdefined(getpersstat("weapHeadShotCount")[weaponname]) ? getpersstat("weapHeadShotCount")[weaponname] : 0;
            self setclientomnvar("ui_gameplay_telemetry_weap_pri_headshot_count", var_7c24d8d7201e0012);
            var_215acf2e2d6ff0e9 = isdefined(getpersstat("weapHeadShotAccuracy")[weaponname]) ? getpersstat("weapHeadShotAccuracy")[weaponname] : 0;
            self setclientomnvar("ui_gameplay_telemetry_weap_pri_headshot_accuracy", var_215acf2e2d6ff0e9);
        }
        var_2f852c080f0e1334 = isdefined(getpersstat("weapAccuracy")[weaponname]) ? getpersstat("weapAccuracy")[weaponname] : 0;
        self setclientomnvar("ui_gameplay_telemetry_weap_pri_accuracy", var_2f852c080f0e1334);
        var_91d61208858cfb29 = isdefined(getpersstat("weapKills")[weaponname]) ? getpersstat("weapKills")[weaponname] : 0;
        self setclientomnvar("ui_gameplay_telemetry_weap_pri_kills", var_91d61208858cfb29);
        var_7cbf5e946ef30fb6 = isdefined(getpersstat("weapDamageDealt")[weaponname]) ? getpersstat("weapDamageDealt")[weaponname] : 0;
        self setclientomnvar("ui_gameplay_telemetry_weap_pri_damagedealt", var_7cbf5e946ef30fb6);
    }
    weaponname = undefined;
    if (isdefined(self.secondaryweaponobj) && isdefined(self.secondaryweaponobj.basename) && (!isprimary || var_2e5f03c228e30968)) {
        weaponname = self.secondaryweaponobj.basename;
    }
    if (var_c51f7affa4c0cd0d && isdefined(self.var_f96aba3b2bb21958) && isdefined(self.var_f96aba3b2bb21958.basename)) {
        weaponname = self.var_f96aba3b2bb21958.basename;
    }
    if (isdefined(weaponname) && (!isprimary || var_2e5f03c228e30968)) {
        if (namespace_36f464722d326bbe::function_beff479639e6508()) {
            var_534e9f229a571002 = isdefined(getpersstat("weapDowned")[weaponname]) ? getpersstat("weapDowned")[weaponname] : 0;
            self setclientomnvar("ui_gameplay_telemetry_weap_sec_downs", var_534e9f229a571002);
            var_1e5848ab03f5bd86 = isdefined(getpersstat("weapLastKillDistance")[weaponname]) ? getpersstat("weapLastKillDistance")[weaponname] : 0;
            self setclientomnvar("ui_gameplay_telemetry_weap_sec_dist", var_1e5848ab03f5bd86);
            var_ea726d34f3ebe296 = isdefined(getpersstat("weapLongestKillDistance")[weaponname]) ? getpersstat("weapLongestKillDistance")[weaponname] : 0;
            self setclientomnvar("ui_gameplay_telemetry_weap_sec_longest_dist", var_ea726d34f3ebe296);
        } else {
            var_5c93875db5f997a9 = isdefined(getpersstat("weapKDRatio")[weaponname]) ? getpersstat("weapKDRatio")[weaponname] : 0;
            self setclientomnvar("ui_gameplay_telemetry_weap_sec_kdratio", var_5c93875db5f997a9);
            var_6736d6623a51a752 = isdefined(getpersstat("weapHeadShotCount")[weaponname]) ? getpersstat("weapHeadShotCount")[weaponname] : 0;
            self setclientomnvar("ui_gameplay_telemetry_weap_sec_headshot_count", var_6736d6623a51a752);
            var_3351a10825c2cf29 = isdefined(getpersstat("weapHeadShotAccuracy")[weaponname]) ? getpersstat("weapHeadShotAccuracy")[weaponname] : 0;
            self setclientomnvar("ui_gameplay_telemetry_weap_sec_headshot_accuracy", var_3351a10825c2cf29);
        }
        var_3ae90b2c5e766474 = isdefined(getpersstat("weapAccuracy")[weaponname]) ? getpersstat("weapAccuracy")[weaponname] : 0;
        self setclientomnvar("ui_gameplay_telemetry_weap_sec_accuracy", var_3ae90b2c5e766474);
        secondarykill = isdefined(getpersstat("weapKills")[weaponname]) ? getpersstat("weapKills")[weaponname] : 0;
        self setclientomnvar("ui_gameplay_telemetry_weap_sec_kills", secondarykill);
        var_fe24127f4d77a3f6 = isdefined(getpersstat("weapDamageDealt")[weaponname]) ? getpersstat("weapDamageDealt")[weaponname] : 0;
        self setclientomnvar("ui_gameplay_telemetry_weap_sec_damagedealt", var_fe24127f4d77a3f6);
    }
}

// Namespace namespace_4925be476a433a59/namespace_6b49ddb858f34366
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e81
// Size: 0x8b
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

// Namespace namespace_4925be476a433a59/namespace_6b49ddb858f34366
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f14
// Size: 0x32
function function_e90bd443e0a197dd(primaryweaponobj, secondaryweaponobj) {
    if (!function_7e3861fd7026453()) {
        return;
    }
    self.var_2c1e886765f7b608 = primaryweaponobj;
    self.var_f96aba3b2bb21958 = secondaryweaponobj;
}

