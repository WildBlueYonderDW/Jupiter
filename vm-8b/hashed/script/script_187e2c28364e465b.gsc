#using scripts\common\devgui.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\mp_agent.gsc;

#namespace namespace_cbf64df67c956f3c;

// Namespace namespace_cbf64df67c956f3c / namespace_bc9acb05ff207ddd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x145
// Size: 0x40
function init() {
    if (getdvarint(@"hash_1196c97cf6cee66e", 0)) {
        function_c601738431d10af5();
        level.var_57ebe7619b06b864 = getdvarint(@"hash_8db2a71a503618ca", 150);
        /#
            level thread function_7f6e135f90bd62a0();
        #/
    }
}

// Namespace namespace_cbf64df67c956f3c / namespace_bc9acb05ff207ddd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x18d
// Size: 0x98
function function_4fa29d44e69039cb(origin, angles) {
    var_58fefdfcd93bc64d = scripts\mp\mp_agent::spawnnewagentaitype("actor_jup_spawner_zombie_base_wm", origin, angles, "team_two_hundred");
    if (isdefined(var_58fefdfcd93bc64d)) {
        if (istrue(level.var_2b3c3eb6681278d6)) {
            var_58fefdfcd93bc64d thread function_346d8332b7c75c38();
        }
        if (isdefined(level.var_57ebe7619b06b864)) {
            var_58fefdfcd93bc64d.maxhealth = level.var_57ebe7619b06b864;
            var_58fefdfcd93bc64d.health = var_58fefdfcd93bc64d.maxhealth;
        }
        var_58fefdfcd93bc64d callback::add("on_zombie_ai_killed", &function_2e97441e00b9a886);
    }
    return var_58fefdfcd93bc64d;
}

// Namespace namespace_cbf64df67c956f3c / namespace_bc9acb05ff207ddd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x22e
// Size: 0xd3
function function_2e97441e00b9a886(params) {
    if (isdefined(params.eattacker) && isdefined(params.smeansofdeath) && params.smeansofdeath != "MOD_SUICIDE") {
        player = undefined;
        if (isplayer(params.eattacker)) {
            player = params.eattacker;
        } else if (isdefined(params.eattacker.owner) && isplayer(params.eattacker.owner)) {
            player = params.eattacker.owner;
        }
        if (isdefined(player)) {
            player points::doScoreEvent(#"zombie_kia");
        }
    }
}

// Namespace namespace_cbf64df67c956f3c / namespace_bc9acb05ff207ddd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x309
// Size: 0x51
function function_346d8332b7c75c38() {
    self endon("death");
    var_f43f4f0822bef9f1 = randomfloat(2);
    wait var_f43f4f0822bef9f1;
    while (true) {
        pinglocationenemyteams(self.origin, "axis");
        pinglocationenemyteams(self.origin, "allies");
        wait 3;
    }
}

// Namespace namespace_cbf64df67c956f3c / namespace_bc9acb05ff207ddd
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x362
// Size: 0x41
function function_ce8588d31df66dd8(origin, angles, var_7b3c7dc07cbe43b1) {
    var_6b8ae74960e802f2 = ter_op(istrue(var_7b3c7dc07cbe43b1), 1, 0);
    return utility::function_ec8a443fe8165fe4("jup_pi_raygun_mp", origin, [], angles, var_6b8ae74960e802f2);
}

// Namespace namespace_cbf64df67c956f3c / namespace_bc9acb05ff207ddd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ac
// Size: 0x44
function function_c601738431d10af5() {
    if (!isdefined(level.var_f1339ee09ea219d8)) {
        level.var_f1339ee09ea219d8 = [];
    }
    level.var_f1339ee09ea219d8 = array_add(level.var_f1339ee09ea219d8, "jup_pi_raygun_mp");
    level.var_517ae1797c9e1995 = &function_aa2be556dc1c242;
}

// Namespace namespace_cbf64df67c956f3c / namespace_bc9acb05ff207ddd
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x3f8
// Size: 0x64
function function_aa2be556dc1c242(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, objweapon) {
    if (isdefined(objweapon)) {
        if (objweapon.basename == "jup_pi_raygun_mp" && is_equal(eattacker, victim)) {
            return 15;
        }
    }
    return idamage;
}

/#

    // Namespace namespace_cbf64df67c956f3c / namespace_bc9acb05ff207ddd
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x465
    // Size: 0xae
    function private function_7f6e135f90bd62a0() {
        while (true) {
            var_9352b6ee7bdc7741 = getdvarint(@"hash_79fb288119ec1063", 0);
            if (var_9352b6ee7bdc7741) {
                setdvar(@"hash_79fb288119ec1063", 0);
                origin = function_9b4c82dba041b23d();
                function_4fa29d44e69039cb(origin, (0, 0, 0));
            }
            var_505f91e3aae6e10d = getdvarint(@"hash_8234e6abb2fdcfc7", 0);
            if (var_505f91e3aae6e10d) {
                setdvar(@"hash_8234e6abb2fdcfc7", 0);
                origin = function_9b4c82dba041b23d();
                function_ce8588d31df66dd8(origin, (0, 0, 0));
            }
            wait 1;
        }
    }

#/
