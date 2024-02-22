// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using script_59ff79d681bb860c;
#using scripts\engine\utility.gsc;
#using scripts\mp\gameobjects.gsc;
#using script_47366beb5ba9fa22;
#using scripts\engine\trace.gsc;

#namespace capture_flag;

// Namespace capture_flag/namespace_4c49d1b7e0800f5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc3
// Size: 0xe
function function_eda57308516bfc5f() {
    return function_bffb5b682a4ef6a2(&function_e0844a2b7f904b14);
}

// Namespace capture_flag/namespace_4c49d1b7e0800f5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd9
// Size: 0xb8
function function_e0844a2b7f904b14(bot) {
    domflag = undefined;
    if (isdefined(self.var_13b45daa3e1c211a) && bot.team != self.var_13b45daa3e1c211a namespace_19b4203b51d56488::getownerteam()) {
        domflag = self.var_13b45daa3e1c211a;
    } else {
        self.var_13b45daa3e1c211a = undefined;
        domflags = bot namespace_45524b6bc7f1f3ac::function_7e7ddfa33eff2c11();
        if (domflags.size <= 0) {
            return 0;
        }
        domflag = function_2613aec5fa0a8620(domflags);
    }
    self.var_df9d35d9b4bee654 = function_ff35a4d756374ede("Capture Flag", domflag, "main", "", &function_35671b7b1a04bf58, self);
    return self.constants.basescore;
}

// Namespace capture_flag/namespace_4c49d1b7e0800f5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x199
// Size: 0xb4
function function_2613aec5fa0a8620(domflags) {
    weights = self.constants.var_563192eda3cf18c5;
    var_803eaa59e4a3ca2b = min(weights.size, domflags.size);
    var_15bc73511322996c = 0;
    for (i = 0; i < var_803eaa59e4a3ca2b; i++) {
        var_15bc73511322996c = var_15bc73511322996c + weights[i];
    }
    index = 0;
    var_77b777bd75db2ff0 = 0;
    weight = randomintrange(0, var_15bc73511322996c);
    while (index < var_803eaa59e4a3ca2b) {
        var_77b777bd75db2ff0 = var_77b777bd75db2ff0 + weights[index];
        if (weight < var_77b777bd75db2ff0) {
            break;
        }
        index++;
    }
    return domflags[index];
}

// Namespace capture_flag/namespace_4c49d1b7e0800f5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x255
// Size: 0xf1
function function_35671b7b1a04bf58(bot) {
    /#
        assert(isdefined(self.var_ec02147fee952ce2));
    #/
    domflag = self.var_ec02147fee952ce2;
    self.decision.var_13b45daa3e1c211a = domflag;
    var_9920c1b439193f77 = 16;
    while (bot.team != domflag namespace_19b4203b51d56488::getownerteam()) {
        randompoint = function_6f7d8428f06122a7(domflag.curorigin, domflag.trigger.radius, domflag.trigger.height, var_9920c1b439193f77);
        bot function_9e400058ef021b03(randompoint, var_9920c1b439193f77);
        result = waittill_any_ents_or_timeout_return(15, bot, "bad_path", bot, "long_path", bot, "goal");
        if (result == "goal") {
            wait(1);
        }
    }
}

// Namespace capture_flag/namespace_4c49d1b7e0800f5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34d
// Size: 0xcc
function function_6f7d8428f06122a7(flagorigin, var_76e5266fe1566069, var_cb08bfacc151cae4, var_eb4e83bdeb266116) {
    var_4b623d88fd385c86 = (var_76e5266fe1566069 - var_eb4e83bdeb266116) / var_76e5266fe1566069;
    r = randomfloatrange(0, var_76e5266fe1566069 * var_4b623d88fd385c86);
    theta = randomfloat(360);
    offset = (r * cos(theta), r * sin(theta), 0);
    var_c1d1fc4d9d46438d = (var_cb08bfacc151cae4 + 30) * -1;
    contents = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 0, 0, 1);
    randompoint = namespace_3c37cb17ade254d::drop_to_ground(flagorigin + offset, var_cb08bfacc151cae4, var_c1d1fc4d9d46438d, undefined, contents);
    return getclosestpointonnavmesh(randompoint);
}

