#using script_d74ae0b4aa21186;
#using script_59ff79d681bb860c;
#using scripts\engine\utility.gsc;
#using scripts\mp\gametypes\br_circle.gsc;

#namespace combat_action;

// Namespace combat_action / namespace_41cf72abc6042f25
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x142
// Size: 0x57
function createaction(target) {
    assert(isent(target));
    targetname = getentityname(target);
    return createactionbase("combat", target, "main", targetname + "/" + target getentitynumber(), &actionprocess, self, &function_f4caae7e8af9d32c);
}

// Namespace combat_action / namespace_41cf72abc6042f25
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a2
// Size: 0x250
function actionprocess(bot) {
    assert(isplayer(self.argument) || isagent(self.argument));
    target = self.argument;
    target endon("death_or_disconnect");
    meleechargedist = bot botgetdifficultysetting("meleeChargeDist");
    var_7e28dd052f7b8a2c = meleechargedist * meleechargedist;
    var_a8340bae5a5e4ffc = 0;
    modifyinaccuracy(bot);
    while (true) {
        if (!bot isvalidtarget(target)) {
            return "Invalid target";
        }
        bot setenemy(target);
        bot botclearscriptgoal();
        var_33c1b9eb98af9e77 = distancesquared(bot.origin, target.origin) <= var_7e28dd052f7b8a2c;
        if (var_a8340bae5a5e4ffc != var_33c1b9eb98af9e77) {
            var_a8340bae5a5e4ffc = var_33c1b9eb98af9e77;
            var_20158eb686f4b21b = var_33c1b9eb98af9e77 && randomfloat(1) < 0.5 && bot botcanseeentity(target);
            bot botsetflag("prefer_melee", var_20158eb686f4b21b);
        }
        msg = bot waittill_any_in_array_or_timeout(["bad_path", "long_path"], 0.1);
        if (!bot isvalidtarget(target)) {
            return "Invalid target";
        }
        if (!bot botcanseeentity(target)) {
            if (msg == "bad_path") {
                bot setenemy(undefined);
                /#
                    function_f3cf203834e48c6d("<dev string:x1c>");
                #/
                point = scripts\mp\gametypes\br_circle::getrandompointincircle(bot.origin, 200, 0.5, 1, 1, 1);
                reachable_point = bot getclosestreachablepointonnavmesh(point);
                bot function_9e400058ef021b03(reachable_point, 32);
                bot waittill_any_in_array_or_timeout(["goal", "bad_path"], 2);
                if (!bot isvalidtarget(target)) {
                    return "Invalid target";
                }
                /#
                    function_f3cf203834e48c6d("<dev string:x2e>");
                #/
            } else if (msg == "long_path") {
                return msg;
            }
        }
        if (istrue(self.decision.constants.extragrenadethrow)) {
            bot function_cf1a9e98122e3931(target);
        }
    }
}

// Namespace combat_action / namespace_41cf72abc6042f25
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3fa
// Size: 0x88
function modifyinaccuracy(bot) {
    inaccuracymultiplier = self.decision.constants.var_386520f2d17685d5;
    if (isdefined(inaccuracymultiplier) && inaccuracymultiplier != 0 && !isbot(self.argument)) {
        self.var_98a8d73ff5329a01 = bot botgetdifficultysetting("hitInaccuracyScale");
        var_5fc09d1bc4492fc6 = self.var_98a8d73ff5329a01 * inaccuracymultiplier;
        bot botsetdifficultysetting("hitInaccuracyScale", var_5fc09d1bc4492fc6);
    }
}

// Namespace combat_action / namespace_41cf72abc6042f25
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x48a
// Size: 0x47
function function_f4caae7e8af9d32c(action) {
    if (function_d57dd414963503d1()) {
        self botsetflag("prefer_melee", 0);
        if (isdefined(action.var_98a8d73ff5329a01)) {
            self botsetdifficultysetting("hitInaccuracyScale", action.var_98a8d73ff5329a01);
        }
    }
}

