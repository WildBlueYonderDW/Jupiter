// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using scripts\mp\bots\bots_gametype_br.gsc;
#using script_40e63dd222434655;
#using script_59ff79d681bb860c;
#using scripts\engine\utility.gsc;
#using scripts\mp\gametypes\br_armory_kiosk.gsc;

#namespace namespace_21b0fdaf3b4a63b2;

// Namespace namespace_21b0fdaf3b4a63b2/namespace_ca8eb8c7f624c164
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9
// Size: 0x45
function createaction(target) {
    return function_ff35a4d756374ede("Buy", target, "main", target.channel + "/" + target.itemname, &function_35671b7b1a04bf58, self, &function_f4caae7e8af9d32c);
}

// Namespace namespace_21b0fdaf3b4a63b2/namespace_ca8eb8c7f624c164
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x116
// Size: 0x1e9
function function_35671b7b1a04bf58(bot) {
    target = self.var_ec02147fee952ce2;
    if (!isdefined(target)) {
        return "Target is undefined";
    }
    targetpos = function_b454fb48a26aa2c7(target.buystation);
    bot function_9e400058ef021b03(targetpos, 32);
    while (1) {
        result = bot waittill_any_in_array_or_timeout([0:"goal", 1:"bad_path"], 15);
        if (result == "goal") {
            bot setvelocity((0, 0, 0));
            waitframe();
            bot function_8b201bccc0aa3695(target.buystation.origin, 0.5);
            bot botpressbutton("use", 0.25);
            /#
                function_f3cf203834e48c6d("<unknown string>");
            #/
            wait(1.5);
            var_4f98c366c1ba6f75 = bot.plundercount;
            bot.armorykioskpurchaseallowed = 1;
            bot namespace_a4b43c1cf86c6fe5::onarmorykioskpurchase(target.channel, target.var_1657e74c9190d2a2);
            if (bot.plundercount >= var_4f98c366c1ba6f75) {
                function_6789bd08cbabdb47(target.buystation, bot);
            }
            var_be48ed4e05efe5cf = 45;
            var_60c1a9bc1584ef28 = 1.5;
            bot function_d1acad1ee42b2b2f(target.buystation, var_60c1a9bc1584ef28, var_be48ed4e05efe5cf);
            break;
        } else if (result == "bad_path") {
            /#
                println("<unknown string>" + self.decision.name + "<unknown string>" + target.buystation.origin + "<unknown string>" + bot.origin);
            #/
            return result;
        }
    }
}

// Namespace namespace_21b0fdaf3b4a63b2/namespace_ca8eb8c7f624c164
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x306
// Size: 0x48
function function_b454fb48a26aa2c7(buystation) {
    var_90a93951e4c15e03 = 48;
    pos = buystation.origin + anglestoforward(buystation.angles) * var_90a93951e4c15e03;
    return getclosestpointonnavmesh(pos);
}

// Namespace namespace_21b0fdaf3b4a63b2/namespace_ca8eb8c7f624c164
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x356
// Size: 0x4d
function function_6789bd08cbabdb47(buystation, bot) {
    if (!isdefined(buystation.var_19c6f51451310013)) {
        buystation.var_19c6f51451310013 = [];
    }
    buystation.var_19c6f51451310013[bot.entity_number] = gettime();
}

// Namespace namespace_21b0fdaf3b4a63b2/namespace_ca8eb8c7f624c164
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3aa
// Size: 0x1f
function function_f4caae7e8af9d32c(action) {
    if (function_d57dd414963503d1()) {
        self.armorykioskpurchaseallowed = undefined;
    }
}

