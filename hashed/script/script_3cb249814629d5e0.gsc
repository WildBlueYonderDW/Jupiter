// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using scripts\engine\utility.gsc;
#using script_5120873d6d2bb7e2;
#using scripts\engine\trace.gsc;

#namespace namespace_439cb71f7bbf05ac;

// Namespace namespace_439cb71f7bbf05ac/namespace_f8811166da0885e6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6
// Size: 0x11
function function_eda57308516bfc5f() {
    return function_bffb5b682a4ef6a2(&function_e0844a2b7f904b14, undefined, 250);
}

// Namespace namespace_439cb71f7bbf05ac/namespace_f8811166da0885e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf
// Size: 0xf0
function function_e0844a2b7f904b14(bot) {
    var_1ba734c0960ed497 = undefined;
    var_55110dce256e40cd = undefined;
    var_fdf6f26abee82b42 = bot namespace_27cc7cdc2e4475be::function_7e7ddfa33eff2c11();
    foreach (vehicle in var_fdf6f26abee82b42) {
        hittime = function_88cc28b68d5fbef8(bot, vehicle);
        if (isdefined(hittime) && (!isdefined(var_55110dce256e40cd) || hittime < var_55110dce256e40cd)) {
            var_1ba734c0960ed497 = vehicle;
            var_55110dce256e40cd = hittime;
        }
    }
    if (!isdefined(var_1ba734c0960ed497)) {
        return 0;
    }
    self.var_df9d35d9b4bee654 = function_ff35a4d756374ede("Evade Cars", var_1ba734c0960ed497, "main", var_1ba734c0960ed497.unique_id, &function_35671b7b1a04bf58, self);
    return self.constants.basescore;
}

// Namespace namespace_439cb71f7bbf05ac/namespace_f8811166da0885e6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b7
// Size: 0x2e7
function function_88cc28b68d5fbef8(bot, vehicle) {
    /#
        assert(isdefined(bot) && isdefined(vehicle));
    #/
    var_b671dda1c1164ec4 = vehicle vehicle_getvelocity();
    speed = length(var_b671dda1c1164ec4) * self.constants.var_3b344b36c6469a5d;
    /#
        assert(speed != 0);
    #/
    size = vehicle function_80715c3a9a2ddf68();
    var_f07a9688d1ebc137 = size[2];
    var_aa060da5901da660 = min(size[0], size[1]);
    ignore = array_combine([0:vehicle], vehicle.owners);
    var_c1998072ee17bf47 = var_b671dda1c1164ec4 * self.constants.var_3b344b36c6469a5d;
    if (length(var_c1998072ee17bf47) < self.constants.var_bd58d59c468151dd) {
        var_c1998072ee17bf47 = vectornormalize(var_b671dda1c1164ec4) * self.constants.var_bd58d59c468151dd;
    }
    var_c62e720e2d862648 = axistoangles(anglestoforward(vehicle.angles), anglestoup(vehicle.angles), anglestoleft(vehicle.angles));
    var_8bc8bdb284860e7e = var_f07a9688d1ebc137;
    var_dae54575a795336 = max(var_aa060da5901da660 + self.constants.var_e41be6ba8b297901, var_8bc8bdb284860e7e);
    tracestart = vehicle.origin + anglestoright(vehicle.angles) * var_dae54575a795336 + (0, 0, 45);
    traceend = tracestart + var_c1998072ee17bf47;
    trace = namespace_2a184fc4902783dc::capsule_trace(tracestart, traceend, var_8bc8bdb284860e7e, var_dae54575a795336 * 2, var_c62e720e2d862648, ignore);
    /#
        if (getdvarint(@"hash_1dc83ffcca238cbf", 0)) {
            color = (0, 1, 0);
            if (isdefined(trace["<unknown string>"]) && trace["<unknown string>"] == bot) {
                color = (1, 0, 0);
                print3d(bot.origin + (0, 0, 50), "<unknown string>" + distance(bot.origin, vehicle.origin), (1, 0, 0), 1, 1, 2);
            }
            namespace_2a184fc4902783dc::draw_trace(trace, color, 1, 2);
        }
    #/
    if (isdefined(trace["entity"]) && trace["entity"] == bot) {
        return (distance(bot.origin, vehicle.origin) / speed);
    }
    return undefined;
}

// Namespace namespace_439cb71f7bbf05ac/namespace_f8811166da0885e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a6
// Size: 0x19e
function function_35671b7b1a04bf58(bot) {
    vehicle = self.var_ec02147fee952ce2;
    /#
        assert(isdefined(vehicle));
    #/
    var_aa4c489ca6dbf82f = anglestoforward(bot.angles);
    var_b671dda1c1164ec4 = vehicle vehicle_getvelocity();
    var_efaa9ab3c88c72d8 = vectornormalize(var_b671dda1c1164ec4);
    dot = vectordot(var_aa4c489ca6dbf82f, var_efaa9ab3c88c72d8);
    var_313dfd46e0bdd035 = abs(dot) < 0.7;
    var_e4ce48294cfee033 = vectorcross(var_efaa9ab3c88c72d8, vectornormalize(bot.origin - vehicle.origin))[2] < 0;
    angledelta = 0;
    if (var_313dfd46e0bdd035) {
        moveforward = var_e4ce48294cfee033;
        var_1ed1d46da636e25 = vectorcross(var_aa4c489ca6dbf82f, vectornormalize(vehicle.origin - bot.origin))[2] < 0;
        if (!var_1ed1d46da636e25) {
            moveforward = !moveforward;
        }
        angledelta = ter_op(moveforward, 0, -180);
    } else {
        moveright = var_e4ce48294cfee033;
        if (dot > 0) {
            moveright = !moveright;
        }
        angledelta = ter_op(moveright, 90, -90);
    }
    yaw = angleclamp(bot.angles[1] + angledelta);
    var_9c3a2316a9fb0dcc = 1;
    bot botsetscriptmove(yaw, var_9c3a2316a9fb0dcc, 1);
    bot botpressbutton("sprint", var_9c3a2316a9fb0dcc);
}

