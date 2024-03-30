// mwiii decomp prototype
#using scripts\engine\utility.gsc;

#namespace namespace_c45ac99c4997e722;

// Namespace namespace_c45ac99c4997e722 / namespace_7349d2dcd492da87
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x291
// Size: 0x505
function function_1c355f42faf7f4bb() {
    deathmodifiers = [];
    teamhasuav = undefined;
    if (scripts/engine/utility::issharedfuncdefined("killstreak", "teamHasUAV")) {
        teamhasuav = [[ scripts/engine/utility::getsharedfunc("killstreak", "teamHasUAV") ]](self.team);
    }
    var_497a07fc95e86184 = undefined;
    var_c50ffd3dda50ebfc = undefined;
    if (scripts/engine/utility::issharedfuncdefined("perk", "hasPerk")) {
        var_497a07fc95e86184 = self [[ scripts/engine/utility::getsharedfunc("perk", "hasPerk") ]]("specialty_quieter");
        var_c50ffd3dda50ebfc = self [[ scripts/engine/utility::getsharedfunc("perk", "hasPerk") ]]("specialty_bulletdamage");
    }
    if (istrue(teamhasuav)) {
        deathmodifiers[deathmodifiers.size] = "UAV_ACTIVE";
    }
    if (istrue(var_497a07fc95e86184)) {
        deathmodifiers[deathmodifiers.size] = "DEADSILENCE_ACTIVE";
    }
    if (istrue(var_c50ffd3dda50ebfc)) {
        deathmodifiers[deathmodifiers.size] = "HAS_STOPPING_POWER";
    }
    curtime = gettime();
    enemyhascuav = undefined;
    if (scripts/engine/utility::issharedfuncdefined("killstreak", "enemyHasCUAV")) {
        enemyhascuav = [[ scripts/engine/utility::getsharedfunc("killstreak", "enemyHasCUAV") ]](self.team);
    }
    ismarked = undefined;
    if (scripts/engine/utility::issharedfuncdefined("killstreak", "helper_drone_isTargetMarked")) {
        ismarked = self [[ scripts/engine/utility::getsharedfunc("killstreak", "helper_drone_isTargetMarked") ]]();
    }
    isflashed = istrue(self.flashbanged);
    isstunned = istrue(self.concussiongrenadefx);
    ingas = isdefined(self.gastriggerstouching) && self.gastriggerstouching.size > 0 || isdefined(self.lastgastouchtime) && self.lastgastouchtime + 5000 > curtime;
    inburning = isdefined(self.burninginfo) || isdefined(self.lastburntime) && self.lastburntime + 5000 > curtime;
    issnapshotted = isdefined(self.lastsnapshotgrenadetime) && self.lastsnapshotgrenadetime + 5000 > curtime;
    insmoke = isdefined(self.lastinsmoketime) && self.lastinsmoketime + 5000 > curtime;
    isemped = istrue(self.empcount);
    inwhitephosphorous = istrue(self.wphealthblock);
    baseweapon = undefined;
    if (isdefined(self.lastweaponused)) {
        currentweapon = self.lastweaponused;
        baseweapon = getweaponbasename(currentweapon);
    }
    if (istrue(enemyhascuav)) {
        deathmodifiers[deathmodifiers.size] = "CUAV_ACTIVE";
    }
    if (istrue(ismarked)) {
        deathmodifiers[deathmodifiers.size] = "IS_MARKED";
    }
    if (istrue(isflashed)) {
        deathmodifiers[deathmodifiers.size] = "IS_FLASHED";
    }
    if (istrue(isstunned)) {
        deathmodifiers[deathmodifiers.size] = "IS_STUNNED";
    }
    if (istrue(ingas)) {
        deathmodifiers[deathmodifiers.size] = "IN_GAS";
    }
    if (istrue(inburning)) {
        deathmodifiers[deathmodifiers.size] = "IN_BURNING";
    }
    if (istrue(issnapshotted)) {
        deathmodifiers[deathmodifiers.size] = "IS_SNAPSHOTTED";
    }
    if (istrue(insmoke)) {
        deathmodifiers[deathmodifiers.size] = "IN_SMOKE";
    }
    if (istrue(isemped)) {
        deathmodifiers[deathmodifiers.size] = "IS_EMPED";
    }
    if (istrue(inwhitephosphorous)) {
        deathmodifiers[deathmodifiers.size] = "IN_WHITE_PHOSPHOROUS";
    }
    if (self isnightvisionon()) {
        deathmodifiers[deathmodifiers.size] = "NVG_ENABLED";
    }
    if (isdefined(self.modifiers)) {
        if (istrue(self.modifiers["headshot"])) {
            deathmodifiers[deathmodifiers.size] = "HEADSHOT";
        }
        if (istrue(self.modifiers["avenger"])) {
            deathmodifiers[deathmodifiers.size] = "AVENGER";
        }
        if (istrue(self.modifiers["defender"])) {
            deathmodifiers[deathmodifiers.size] = "DEFENDER";
        }
        if (istrue(self.modifiers["posthumous"])) {
            deathmodifiers[deathmodifiers.size] = "POSTHUMOUS";
        }
        if (istrue(self.modifiers["revenge"])) {
            deathmodifiers[deathmodifiers.size] = "REVENGE";
        }
        if (istrue(self.modifiers["buzzkill"])) {
            deathmodifiers[deathmodifiers.size] = "BUZZKILL";
        }
        if (istrue(self.modifiers["firstblood"])) {
            deathmodifiers[deathmodifiers.size] = "FIRSTBLOOD";
        }
        if (istrue(self.modifiers["comeback"])) {
            deathmodifiers[deathmodifiers.size] = "COMEBACK";
        }
        if (istrue(self.modifiers["longshot"])) {
            deathmodifiers[deathmodifiers.size] = "LONGSHOT";
        }
        if (istrue(self.modifiers["pointblank"])) {
            deathmodifiers[deathmodifiers.size] = "POINTBLANK";
        }
        if (istrue(self.modifiers["assistedsuicide"])) {
            deathmodifiers[deathmodifiers.size] = "ASSISTED_SUICIDE";
        }
        if (isdefined(baseweapon) && scripts/engine/utility::issharedfuncdefined("killstreak", "isKillstreakWeapon") && istrue([[ scripts/engine/utility::getsharedfunc("killstreak", "isKillstreakWeapon") ]](baseweapon))) {
            deathmodifiers[deathmodifiers.size] = "KILLSTREAK";
        }
    }
    return deathmodifiers;
}

