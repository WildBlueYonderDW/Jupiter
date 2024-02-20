// mwiii decomp prototype
#using scripts\engine\utility.gsc;

#namespace namespace_c45ac99c4997e722;

// Namespace namespace_c45ac99c4997e722/namespace_7349d2dcd492da87
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x291
// Size: 0x505
function function_1c355f42faf7f4bb() {
    var_bed41d880242e6cd = [];
    teamhasuav = undefined;
    if (namespace_3c37cb17ade254d::issharedfuncdefined("killstreak", "teamHasUAV")) {
        teamhasuav = [[ namespace_3c37cb17ade254d::getsharedfunc("killstreak", "teamHasUAV") ]](self.team);
    }
    var_497a07fc95e86184 = undefined;
    var_c50ffd3dda50ebfc = undefined;
    if (namespace_3c37cb17ade254d::issharedfuncdefined("perk", "hasPerk")) {
        var_497a07fc95e86184 = self [[ namespace_3c37cb17ade254d::getsharedfunc("perk", "hasPerk") ]]("specialty_quieter");
        var_c50ffd3dda50ebfc = self [[ namespace_3c37cb17ade254d::getsharedfunc("perk", "hasPerk") ]]("specialty_bulletdamage");
    }
    if (istrue(teamhasuav)) {
        var_bed41d880242e6cd[var_bed41d880242e6cd.size] = "UAV_ACTIVE";
    }
    if (istrue(var_497a07fc95e86184)) {
        var_bed41d880242e6cd[var_bed41d880242e6cd.size] = "DEADSILENCE_ACTIVE";
    }
    if (istrue(var_c50ffd3dda50ebfc)) {
        var_bed41d880242e6cd[var_bed41d880242e6cd.size] = "HAS_STOPPING_POWER";
    }
    curtime = gettime();
    enemyhascuav = undefined;
    if (namespace_3c37cb17ade254d::issharedfuncdefined("killstreak", "enemyHasCUAV")) {
        enemyhascuav = [[ namespace_3c37cb17ade254d::getsharedfunc("killstreak", "enemyHasCUAV") ]](self.team);
    }
    ismarked = undefined;
    if (namespace_3c37cb17ade254d::issharedfuncdefined("killstreak", "helper_drone_isTargetMarked")) {
        ismarked = self [[ namespace_3c37cb17ade254d::getsharedfunc("killstreak", "helper_drone_isTargetMarked") ]]();
    }
    isflashed = istrue(self.flashbanged);
    isstunned = istrue(self.concussiongrenadefx);
    var_6fd2d9a208cef69b = isdefined(self.gastriggerstouching) && self.gastriggerstouching.size > 0 || isdefined(self.lastgastouchtime) && self.lastgastouchtime + 5000 > curtime;
    var_96a6ae39774be3dd = isdefined(self.burninginfo) || isdefined(self.lastburntime) && self.lastburntime + 5000 > curtime;
    var_db1ee1676a83e16e = isdefined(self.lastsnapshotgrenadetime) && self.lastsnapshotgrenadetime + 5000 > curtime;
    insmoke = isdefined(self.lastinsmoketime) && self.lastinsmoketime + 5000 > curtime;
    isemped = istrue(self.empcount);
    var_2ca1cc391a5049b1 = istrue(self.wphealthblock);
    baseweapon = undefined;
    if (isdefined(self.lastweaponused)) {
        currentweapon = self.lastweaponused;
        baseweapon = getweaponbasename(currentweapon);
    }
    if (istrue(enemyhascuav)) {
        var_bed41d880242e6cd[var_bed41d880242e6cd.size] = "CUAV_ACTIVE";
    }
    if (istrue(ismarked)) {
        var_bed41d880242e6cd[var_bed41d880242e6cd.size] = "IS_MARKED";
    }
    if (istrue(isflashed)) {
        var_bed41d880242e6cd[var_bed41d880242e6cd.size] = "IS_FLASHED";
    }
    if (istrue(isstunned)) {
        var_bed41d880242e6cd[var_bed41d880242e6cd.size] = "IS_STUNNED";
    }
    if (istrue(var_6fd2d9a208cef69b)) {
        var_bed41d880242e6cd[var_bed41d880242e6cd.size] = "IN_GAS";
    }
    if (istrue(var_96a6ae39774be3dd)) {
        var_bed41d880242e6cd[var_bed41d880242e6cd.size] = "IN_BURNING";
    }
    if (istrue(var_db1ee1676a83e16e)) {
        var_bed41d880242e6cd[var_bed41d880242e6cd.size] = "IS_SNAPSHOTTED";
    }
    if (istrue(insmoke)) {
        var_bed41d880242e6cd[var_bed41d880242e6cd.size] = "IN_SMOKE";
    }
    if (istrue(isemped)) {
        var_bed41d880242e6cd[var_bed41d880242e6cd.size] = "IS_EMPED";
    }
    if (istrue(var_2ca1cc391a5049b1)) {
        var_bed41d880242e6cd[var_bed41d880242e6cd.size] = "IN_WHITE_PHOSPHOROUS";
    }
    if (self isnightvisionon()) {
        var_bed41d880242e6cd[var_bed41d880242e6cd.size] = "NVG_ENABLED";
    }
    if (isdefined(self.modifiers)) {
        if (istrue(self.modifiers["headshot"])) {
            var_bed41d880242e6cd[var_bed41d880242e6cd.size] = "HEADSHOT";
        }
        if (istrue(self.modifiers["avenger"])) {
            var_bed41d880242e6cd[var_bed41d880242e6cd.size] = "AVENGER";
        }
        if (istrue(self.modifiers["defender"])) {
            var_bed41d880242e6cd[var_bed41d880242e6cd.size] = "DEFENDER";
        }
        if (istrue(self.modifiers["posthumous"])) {
            var_bed41d880242e6cd[var_bed41d880242e6cd.size] = "POSTHUMOUS";
        }
        if (istrue(self.modifiers["revenge"])) {
            var_bed41d880242e6cd[var_bed41d880242e6cd.size] = "REVENGE";
        }
        if (istrue(self.modifiers["buzzkill"])) {
            var_bed41d880242e6cd[var_bed41d880242e6cd.size] = "BUZZKILL";
        }
        if (istrue(self.modifiers["firstblood"])) {
            var_bed41d880242e6cd[var_bed41d880242e6cd.size] = "FIRSTBLOOD";
        }
        if (istrue(self.modifiers["comeback"])) {
            var_bed41d880242e6cd[var_bed41d880242e6cd.size] = "COMEBACK";
        }
        if (istrue(self.modifiers["longshot"])) {
            var_bed41d880242e6cd[var_bed41d880242e6cd.size] = "LONGSHOT";
        }
        if (istrue(self.modifiers["pointblank"])) {
            var_bed41d880242e6cd[var_bed41d880242e6cd.size] = "POINTBLANK";
        }
        if (istrue(self.modifiers["assistedsuicide"])) {
            var_bed41d880242e6cd[var_bed41d880242e6cd.size] = "ASSISTED_SUICIDE";
        }
        if (isdefined(baseweapon) && namespace_3c37cb17ade254d::issharedfuncdefined("killstreak", "isKillstreakWeapon") && istrue([[ namespace_3c37cb17ade254d::getsharedfunc("killstreak", "isKillstreakWeapon") ]](baseweapon))) {
            var_bed41d880242e6cd[var_bed41d880242e6cd.size] = "KILLSTREAK";
        }
    }
    return var_bed41d880242e6cd;
}

