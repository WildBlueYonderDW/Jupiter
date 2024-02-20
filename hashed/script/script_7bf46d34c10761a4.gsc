// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using script_59ff79d681bb860c;
#using scripts\engine\utility.gsc;
#using script_47366beb5ba9fa22;
#using scripts\mp\bots\bots_gametype_common.gsc;

#namespace namespace_dddb86cf5c28d24f;

// Namespace namespace_dddb86cf5c28d24f/namespace_ef3d9df38f736e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf2
// Size: 0xe
function function_eda57308516bfc5f() {
    return function_bffb5b682a4ef6a2(&function_e0844a2b7f904b14);
}

// Namespace namespace_dddb86cf5c28d24f/namespace_ef3d9df38f736e0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x108
// Size: 0x135
function function_e0844a2b7f904b14(bot) {
    var_d93c7eeced9fd57 = bot namespace_45524b6bc7f1f3ac::function_7e7ddfa33eff2c11()[0];
    var_6f378a329663705a = var_d93c7eeced9fd57.numtouching[bot.team];
    var_b5aeb4a2ae3657fd = (level.var_a18063a06c258143 - gettime()) / 1000;
    var_72bb89e60d3674df = self.constants.basescore;
    var_72bb89e60d3674df = var_72bb89e60d3674df + function_9d1ab012058221bb(var_b5aeb4a2ae3657fd, self.constants.var_50cf5a797d61ae47, self.constants.var_f65cad93a3671678);
    var_72bb89e60d3674df = var_72bb89e60d3674df + self.constants.var_224fd0f99e59f420[var_6f378a329663705a];
    var_5ff767c78f89f018 = var_d93c7eeced9fd57;
    if (var_72bb89e60d3674df < self.constants.var_cc2f39e2d76f6b7d) {
        var_72bb89e60d3674df = self.constants.var_cc2f39e2d76f6b7d;
        var_5ff767c78f89f018 = namespace_45524b6bc7f1f3ac::function_b4e30a9548aa351b();
    }
    self.var_df9d35d9b4bee654 = function_ff35a4d756374ede("Capture Flag", var_5ff767c78f89f018, "main", var_5ff767c78f89f018.objectivekey, &function_35671b7b1a04bf58, self);
    return var_72bb89e60d3674df;
}

// Namespace namespace_dddb86cf5c28d24f/namespace_ef3d9df38f736e0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x245
// Size: 0xb2
function function_35671b7b1a04bf58(bot) {
    /#
        assert(isdefined(self.var_ec02147fee952ce2));
    #/
    var_c915dfaebd848f45 = self.var_ec02147fee952ce2;
    var_9920c1b439193f77 = 10;
    nodes = function_62f98fd3d37278dc(var_c915dfaebd848f45);
    while (1) {
        var_e12d35dc8d670c95 = function_7a2aaa4a09a4d250(nodes);
        bot function_9e400058ef021b03(var_e12d35dc8d670c95.origin, var_9920c1b439193f77);
        result = waittill_any_ents_or_timeout_return(15, bot, "bad_path", bot, "long_path", bot, "goal");
        if (result == "goal") {
            wait(1);
        }
    }
}

// Namespace namespace_dddb86cf5c28d24f/namespace_ef3d9df38f736e0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fe
// Size: 0x135
function function_62f98fd3d37278dc(var_c915dfaebd848f45, var_e88e1be231eb03b) {
    nodes = [];
    if (isdefined(var_c915dfaebd848f45.trigger)) {
        if (!isdefined(var_c915dfaebd848f45.nodes)) {
            nodes = namespace_bab4a9f27a71083a::bot_get_valid_nodes_in_trigger(var_c915dfaebd848f45.trigger);
        }
        if (nodes.size <= 0 && isdefined(var_c915dfaebd848f45.trigger.target)) {
            target = var_c915dfaebd848f45.trigger.target;
            var_6f0350c82fc94c38 = getentarray("script_origin", "classname");
            if (isdefined(var_6f0350c82fc94c38)) {
                foreach (ent in var_6f0350c82fc94c38) {
                    if (isdefined(ent.targetname) && ent.targetname == target) {
                        nodes[nodes.size] = ent;
                    }
                }
            }
        }
    }
    if (!istrue(var_e88e1be231eb03b)) {
        /#
            assertex(nodes.size > 0, "Fail to find nodes in hardPoint");
        #/
    }
    return nodes;
}

