// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using script_59ff79d681bb860c;
#using scripts\engine\utility.gsc;
#using script_67bad8bd9685e057;
#using scripts\mp\gameobjects.gsc;
#using script_7bf46d34c10761a4;

#namespace namespace_d42bf3250caf5083;

// Namespace namespace_d42bf3250caf5083/namespace_500245c51ae01944
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc6
// Size: 0xe
function function_eda57308516bfc5f() {
    return function_bffb5b682a4ef6a2(&function_e0844a2b7f904b14);
}

// Namespace namespace_d42bf3250caf5083/namespace_500245c51ae01944
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc
// Size: 0x7c
function function_e0844a2b7f904b14(bot) {
    score = namespace_4c49d1b7e0800f5::function_e0844a2b7f904b14(bot);
    if (score == 0) {
        return 0;
    }
    flag = self.var_df9d35d9b4bee654.var_ec02147fee952ce2;
    self.var_df9d35d9b4bee654 = function_ff35a4d756374ede("Capture Flag GW", flag, "main", "", &function_35671b7b1a04bf58, self);
    return self.constants.basescore;
}

// Namespace namespace_d42bf3250caf5083/namespace_500245c51ae01944
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x160
// Size: 0x13a
function function_35671b7b1a04bf58(bot) {
    /#
        assert(isdefined(self.var_ec02147fee952ce2));
    #/
    flag = self.var_ec02147fee952ce2;
    self.decision.var_13b45daa3e1c211a = flag;
    var_9920c1b439193f77 = 16;
    while (bot.team != flag namespace_19b4203b51d56488::getownerteam()) {
        nodes = namespace_ef3d9df38f736e0::function_62f98fd3d37278dc(flag, 1);
        if (nodes.size == 0) {
            var_1018c65664d1acb7 = 200;
            var_a3f666a60afd099e = 50;
            var_89fc75b7256a3949 = spawnstruct();
            var_89fc75b7256a3949.origin = namespace_4c49d1b7e0800f5::function_6f7d8428f06122a7(flag.curorigin, var_1018c65664d1acb7, var_a3f666a60afd099e, var_9920c1b439193f77);
            nodes[nodes.size] = var_89fc75b7256a3949;
        }
        randompoint = function_7a2aaa4a09a4d250(nodes);
        bot function_9e400058ef021b03(randompoint.origin, var_9920c1b439193f77);
        result = waittill_any_ents_or_timeout_return(15, bot, "bad_path", bot, "long_path", bot, "goal");
        if (result == "goal") {
            wait(1);
        }
    }
}

