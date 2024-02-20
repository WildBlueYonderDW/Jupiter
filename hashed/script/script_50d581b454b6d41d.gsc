// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_5bc86a57086a4774;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_8dea0c1922c392c6;

// Namespace namespace_8dea0c1922c392c6/namespace_8073b31fb342e7bb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x141
// Size: 0x5b
function function_fe852f92145c24a6() {
    function_ac97a4f2ab8c2d53("tablet", "tryAssignTask", &function_8a64133f5d5f7dd);
    function_ac97a4f2ab8c2d53("tablet", "checkTaskValid", &checkTaskValid);
    function_ac97a4f2ab8c2d53("tablet", "tryBindObjective", &tryBindObjective);
    function_ac97a4f2ab8c2d53("tablet", "removeObjectiveInfo", &function_53053ea95e1148c2);
}

// Namespace namespace_8dea0c1922c392c6/namespace_8073b31fb342e7bb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a3
// Size: 0x97
function function_8a64133f5d5f7dd(var_17953215dd7c5f9b) {
    var_2e16d30576073b00 = level.teamdata[var_17953215dd7c5f9b.team]["alivePlayers"][0];
    instance = function_e92b6ecc9ab0f07a(var_17953215dd7c5f9b.info.ref, var_2e16d30576073b00);
    instance.taskinfo = var_17953215dd7c5f9b.info;
    instance thread oncontractend(var_17953215dd7c5f9b);
    instance thread function_a24a232718dd45b7(var_17953215dd7c5f9b);
    namespace_4bc0ead8d2af3d84::onquesttablethide(instance);
    var_2e16d30576073b00 namespace_4bc0ead8d2af3d84::takequesttablet(instance);
}

// Namespace namespace_8dea0c1922c392c6/namespace_8073b31fb342e7bb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x241
// Size: 0x1ae
function function_e92b6ecc9ab0f07a(var_15ad24e2fbeee5d, var_2e16d30576073b00) {
    if (!isdefined(var_2e16d30576073b00)) {
        return undefined;
    }
    var_173cbd75083beba4 = level.taskinfo.var_7e96a4cd28c47df;
    var_441c690181a13ac = var_173cbd75083beba4 * var_173cbd75083beba4;
    var_e34d653f9277d8a4 = undefined;
    players = level.teamdata[var_2e16d30576073b00.team]["players"];
    var_a35449152eff0eee = namespace_4bc0ead8d2af3d84::getlootname(var_15ad24e2fbeee5d);
    var_5b0e81cf1d91e0d5 = getlootscriptablearrayinradius(var_a35449152eff0eee, undefined, var_2e16d30576073b00.origin, var_173cbd75083beba4);
    foreach (tablet in var_5b0e81cf1d91e0d5) {
        if (!isdefined(level.questinfo.activetablets["" + tablet.index]) || istrue(tablet.startdisabled)) {
            continue;
        }
        foreach (player in players) {
            var_3c0080d63118991e = distance2dsquared(tablet.origin, player.origin);
            if (var_3c0080d63118991e < var_441c690181a13ac) {
                var_e34d653f9277d8a4 = tablet;
                var_441c690181a13ac = var_3c0080d63118991e;
            }
        }
    }
    return var_e34d653f9277d8a4;
}

// Namespace namespace_8dea0c1922c392c6/namespace_8073b31fb342e7bb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f7
// Size: 0x64
function oncontractend(var_17953215dd7c5f9b) {
    level endon("game_ended");
    result = team = self waittill("questEnded");
    if (isdefined(result) && result == "success") {
        function_c70072a3cf2befdf(var_17953215dd7c5f9b);
    }
    self.taskinfo = undefined;
    namespace_4bc0ead8d2af3d84::function_8e57889ac5dda0bc(self);
    function_9aad50cbcb9b942e(var_17953215dd7c5f9b, result);
}

// Namespace namespace_8dea0c1922c392c6/namespace_8073b31fb342e7bb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x462
// Size: 0xfb
function function_a24a232718dd45b7(var_17953215dd7c5f9b) {
    level endon("game_ended");
    self endon("questEnded");
    var_17953215dd7c5f9b endon("task_end");
    locale = level waittill("quest_objective_updated_" + var_17953215dd7c5f9b.team);
    var_17953215dd7c5f9b.locale = locale;
    players = level.teamdata[var_17953215dd7c5f9b.team]["players"];
    foreach (player in players) {
        if (isdefined(locale.objectiveiconid) && isdefined(player.var_b8abadd2c4d56fd8) && player.var_b8abadd2c4d56fd8.var_17953215dd7c5f9b != var_17953215dd7c5f9b) {
            locale namespace_4bc0ead8d2af3d84::hidequestobjiconfromplayer(player);
        }
    }
}

// Namespace namespace_8dea0c1922c392c6/namespace_8073b31fb342e7bb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x564
// Size: 0x58
function checkTaskValid(var_be80583079ec3e95, team) {
    var_2e16d30576073b00 = level.teamdata[team]["players"][0];
    instance = function_e92b6ecc9ab0f07a(var_be80583079ec3e95.ref, var_2e16d30576073b00);
    if (!isdefined(instance)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_8dea0c1922c392c6/namespace_8073b31fb342e7bb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c4
// Size: 0x8c
function tryBindObjective(var_17953215dd7c5f9b) {
    locale = var_17953215dd7c5f9b.locale;
    if (!isdefined(locale)) {
        return;
    }
    var_b8abadd2c4d56fd8 = spawnstruct();
    var_b8abadd2c4d56fd8.item = locale;
    var_b8abadd2c4d56fd8.var_17953215dd7c5f9b = var_17953215dd7c5f9b;
    self.var_b8abadd2c4d56fd8 = var_b8abadd2c4d56fd8;
    if (isdefined(locale.objectiveiconid)) {
        locale namespace_4bc0ead8d2af3d84::showquestobjicontoplayer(self);
    }
    if (isdefined(locale.mapcircle)) {
        locale namespace_36f464722d326bbe::function_cfd53c8f6878014f(self);
    }
}

// Namespace namespace_8dea0c1922c392c6/namespace_8073b31fb342e7bb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x657
// Size: 0x7b
function function_53053ea95e1148c2() {
    locale = self.var_b8abadd2c4d56fd8.var_17953215dd7c5f9b.locale;
    if (!isdefined(locale)) {
        return;
    }
    if (isdefined(locale.objectiveiconid)) {
        locale namespace_4bc0ead8d2af3d84::hidequestobjiconfromplayer(self);
    }
    if (isdefined(locale.mapcircle)) {
        locale namespace_36f464722d326bbe::function_d7d113d56ef0ef5b(self);
    }
    self.var_b8abadd2c4d56fd8 notify("objective_removed");
    self.var_b8abadd2c4d56fd8 = undefined;
}

