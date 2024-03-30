// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_5bc86a57086a4774;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_8dea0c1922c392c6;

// Namespace namespace_8dea0c1922c392c6 / namespace_8073b31fb342e7bb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x141
// Size: 0x5b
function inittask() {
    function_ac97a4f2ab8c2d53("tablet", "tryAssignTask", &function_8a64133f5d5f7dd);
    function_ac97a4f2ab8c2d53("tablet", "checkTaskValid", &checkTaskValid);
    function_ac97a4f2ab8c2d53("tablet", "tryBindObjective", &tryBindObjective);
    function_ac97a4f2ab8c2d53("tablet", "removeObjectiveInfo", &function_53053ea95e1148c2);
}

// Namespace namespace_8dea0c1922c392c6 / namespace_8073b31fb342e7bb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a3
// Size: 0x97
function function_8a64133f5d5f7dd(taskinstance) {
    var_2e16d30576073b00 = level.teamdata[taskinstance.team]["alivePlayers"][0];
    instance = function_e92b6ecc9ab0f07a(taskinstance.info.ref, var_2e16d30576073b00);
    instance.taskinfo = taskinstance.info;
    instance thread oncontractend(taskinstance);
    instance thread function_a24a232718dd45b7(taskinstance);
    scripts/mp/gametypes/br_quest_util::onquesttablethide(instance);
    var_2e16d30576073b00 scripts/mp/gametypes/br_quest_util::takequesttablet(instance);
}

// Namespace namespace_8dea0c1922c392c6 / namespace_8073b31fb342e7bb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x241
// Size: 0x1ae
function function_e92b6ecc9ab0f07a(taskref, var_2e16d30576073b00) {
    if (!isdefined(var_2e16d30576073b00)) {
        return undefined;
    }
    var_173cbd75083beba4 = level.taskinfo.tabletsearchradius;
    var_441c690181a13ac = var_173cbd75083beba4 * var_173cbd75083beba4;
    targettablet = undefined;
    players = level.teamdata[var_2e16d30576073b00.team]["players"];
    tabletname = scripts/mp/gametypes/br_quest_util::getlootname(taskref);
    targettablets = getlootscriptablearrayinradius(tabletname, undefined, var_2e16d30576073b00.origin, var_173cbd75083beba4);
    foreach (tablet in targettablets) {
        if (!isdefined(level.questinfo.activetablets["" + tablet.index]) || istrue(tablet.startdisabled)) {
            continue;
        }
        foreach (player in players) {
            tabletdistancesq = distance2dsquared(tablet.origin, player.origin);
            if (tabletdistancesq < var_441c690181a13ac) {
                targettablet = tablet;
                var_441c690181a13ac = tabletdistancesq;
            }
        }
    }
    return targettablet;
}

// Namespace namespace_8dea0c1922c392c6 / namespace_8073b31fb342e7bb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f7
// Size: 0x64
function oncontractend(taskinstance) {
    level endon("game_ended");
    team, result = self waittill("questEnded");
    if (isdefined(result) && result == "success") {
        getscore(taskinstance);
    }
    self.taskinfo = undefined;
    scripts/mp/gametypes/br_quest_util::activatetablet(self);
    ontaskend(taskinstance, result);
}

// Namespace namespace_8dea0c1922c392c6 / namespace_8073b31fb342e7bb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x462
// Size: 0xfb
function function_a24a232718dd45b7(taskinstance) {
    level endon("game_ended");
    self endon("questEnded");
    taskinstance endon("task_end");
    locale = level waittill("quest_objective_updated_" + taskinstance.team);
    taskinstance.locale = locale;
    players = level.teamdata[taskinstance.team]["players"];
    foreach (player in players) {
        if (isdefined(locale.objectiveiconid) && isdefined(player.objectiveinfo) && player.objectiveinfo.taskinstance != taskinstance) {
            locale scripts/mp/gametypes/br_quest_util::hidequestobjiconfromplayer(player);
        }
    }
}

// Namespace namespace_8dea0c1922c392c6 / namespace_8073b31fb342e7bb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x564
// Size: 0x58
function checkTaskValid(selectedtask, team) {
    var_2e16d30576073b00 = level.teamdata[team]["players"][0];
    instance = function_e92b6ecc9ab0f07a(selectedtask.ref, var_2e16d30576073b00);
    if (!isdefined(instance)) {
        return false;
    }
    return true;
}

// Namespace namespace_8dea0c1922c392c6 / namespace_8073b31fb342e7bb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c4
// Size: 0x8c
function tryBindObjective(taskinstance) {
    locale = taskinstance.locale;
    if (!isdefined(locale)) {
        return;
    }
    objectiveinfo = spawnstruct();
    objectiveinfo.item = locale;
    objectiveinfo.taskinstance = taskinstance;
    self.objectiveinfo = objectiveinfo;
    if (isdefined(locale.objectiveiconid)) {
        locale scripts/mp/gametypes/br_quest_util::showquestobjicontoplayer(self);
    }
    if (isdefined(locale.mapcircle)) {
        locale scripts/cp_mp/utility/game_utility::function_cfd53c8f6878014f(self);
    }
}

// Namespace namespace_8dea0c1922c392c6 / namespace_8073b31fb342e7bb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x657
// Size: 0x7b
function function_53053ea95e1148c2() {
    locale = self.objectiveinfo.taskinstance.locale;
    if (!isdefined(locale)) {
        return;
    }
    if (isdefined(locale.objectiveiconid)) {
        locale scripts/mp/gametypes/br_quest_util::hidequestobjiconfromplayer(self);
    }
    if (isdefined(locale.mapcircle)) {
        locale scripts/cp_mp/utility/game_utility::function_d7d113d56ef0ef5b(self);
    }
    self.objectiveinfo notify("objective_removed");
    self.objectiveinfo = undefined;
}

