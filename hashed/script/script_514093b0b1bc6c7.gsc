// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_5d813d45c6b1b1be;
#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;

#namespace namespace_6dc1999f395c1510;

// Namespace namespace_6dc1999f395c1510/namespace_634b04db85eaefa7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf6
// Size: 0x25
function init(var_5179c48492d1d2c2) {
    function_efabc5ae0422de9e(var_5179c48492d1d2c2, 1, undefined, "sitting");
    thread function_58381d6b9dd9c2a0(var_5179c48492d1d2c2);
}

// Namespace namespace_6dc1999f395c1510/namespace_634b04db85eaefa7
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x122
// Size: 0x368
function private function_58381d6b9dd9c2a0(var_5179c48492d1d2c2, scriptable) {
    var_5179c48492d1d2c2.var_81bad48b48c61861 = [];
    var_5179c48492d1d2c2.var_e83e872f34fafad0 = [];
    while (1) {
        foreach (player in level.players) {
            var_8efef5b1e4d79b79 = player getentitynumber();
            if (player playerads() == 1) {
                zoom = player playergetzoomfov();
                if (zoom > 25) {
                    function_c92c4f30fa8e4969(var_5179c48492d1d2c2, var_8efef5b1e4d79b79);
                } else if (!player isonground()) {
                    function_c92c4f30fa8e4969(var_5179c48492d1d2c2, var_8efef5b1e4d79b79);
                } else {
                    var_fe7e24eb370a20d4 = anglestoforward(player getplayerangles());
                    var_8ba00f8d0fda6308 = vectornormalize(var_5179c48492d1d2c2.origin - (0, 0, 53) - player.origin);
                    dot = vectordot(var_fe7e24eb370a20d4, var_8ba00f8d0fda6308);
                    if (dot < 0.99) {
                        function_c92c4f30fa8e4969(var_5179c48492d1d2c2, var_8efef5b1e4d79b79);
                    } else {
                        dist_sq = distancesquared(var_5179c48492d1d2c2.origin, player.origin);
                        if (dist_sq > 100000000 || dist_sq < 160000) {
                            /#
                                iprintlnbold("<unknown string>");
                            #/
                            function_c92c4f30fa8e4969(var_5179c48492d1d2c2, var_8efef5b1e4d79b79);
                        } else {
                            trace = player trace::function_559be9820cd98ca4();
                            if (isdefined(trace["entity"]) && trace["entity"] == var_5179c48492d1d2c2.models[0]) {
                                if (!isdefined(var_5179c48492d1d2c2.var_e83e872f34fafad0[var_8efef5b1e4d79b79])) {
                                    var_5179c48492d1d2c2.var_e83e872f34fafad0[var_8efef5b1e4d79b79] = spawn_model("ob_mrp", player.origin - (0, 0, 100));
                                    foreach (other_player in level.players) {
                                        if (other_player != player) {
                                            var_5179c48492d1d2c2.var_e83e872f34fafad0[var_8efef5b1e4d79b79] hidefromplayer(other_player);
                                        }
                                    }
                                } else {
                                    var_5179c48492d1d2c2.var_e83e872f34fafad0[var_8efef5b1e4d79b79].origin = player.origin - (0, 0, 100);
                                }
                                if (isdefined(var_5179c48492d1d2c2.var_81bad48b48c61861[var_8efef5b1e4d79b79])) {
                                    if (gettime() - var_5179c48492d1d2c2.var_81bad48b48c61861[var_8efef5b1e4d79b79] > 2000) {
                                        /#
                                            iprintlnbold("<unknown string>");
                                        #/
                                        thread function_4593a32e87f51fe4(var_5179c48492d1d2c2, player, var_5179c48492d1d2c2.var_e83e872f34fafad0[var_8efef5b1e4d79b79]);
                                        return;
                                    }
                                } else {
                                    var_5179c48492d1d2c2.var_81bad48b48c61861[var_8efef5b1e4d79b79] = gettime();
                                }
                            } else {
                                /#
                                    iprintlnbold("<unknown string>");
                                #/
                                function_c92c4f30fa8e4969(var_5179c48492d1d2c2, var_8efef5b1e4d79b79);
                                var_5179c48492d1d2c2.var_81bad48b48c61861[var_8efef5b1e4d79b79] = undefined;
                            }
                        }
                    }
                }
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_6dc1999f395c1510/namespace_634b04db85eaefa7
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x491
// Size: 0x52
function private function_c92c4f30fa8e4969(var_5179c48492d1d2c2, var_8efef5b1e4d79b79) {
    if (isdefined(var_5179c48492d1d2c2.var_e83e872f34fafad0[var_8efef5b1e4d79b79])) {
        var_5179c48492d1d2c2.var_e83e872f34fafad0[var_8efef5b1e4d79b79] delete();
    }
    var_5179c48492d1d2c2.var_81bad48b48c61861[var_8efef5b1e4d79b79] = undefined;
    var_5179c48492d1d2c2.var_e83e872f34fafad0[var_8efef5b1e4d79b79] = undefined;
}

// Namespace namespace_6dc1999f395c1510/namespace_634b04db85eaefa7
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4ea
// Size: 0x1d2
function private function_4593a32e87f51fe4(var_5179c48492d1d2c2, player, var_e20fb1ee13d195b5) {
    var_302e67a0664597b8 = var_5179c48492d1d2c2.models[0];
    offset = anglestoforward(player getplayerangles()) * 45;
    down = anglestoup(player getplayerangles()) * -10;
    angle = vectortoangles(player geteye() - var_302e67a0664597b8.origin);
    position = player geteye() + offset + down;
    var_e20fb1ee13d195b5.origin = position;
    var_e20fb1ee13d195b5.angles = angle;
    player playsoundtoplayer("evt_ob_mrpeeks_stinger_jump_scare", player, player);
    var_37f0849ceb07378d = lookupsoundlength("evt_ob_mrpeeks_stinger_jump_scare");
    var_4cb4b9d33d495913 = float(var_37f0849ceb07378d);
    var_4cb4b9d33d495913 = var_4cb4b9d33d495913 / 1000;
    wait(1.5);
    var_e8093c11592ea8ec = spawnscriptable("ob_mrp_vanish", var_302e67a0664597b8.origin, var_302e67a0664597b8.angles);
    var_7af7f827219d603a = spawnscriptable("ob_mrp_vanish", var_e20fb1ee13d195b5.origin, var_e20fb1ee13d195b5.angles);
    reward_struct = spawnstruct();
    reward_struct.angles = var_e20fb1ee13d195b5.angles;
    reward_struct.origin = getgroundposition(var_e20fb1ee13d195b5.origin, 64);
    var_302e67a0664597b8 delete();
    var_e20fb1ee13d195b5 delete();
    wait(var_4cb4b9d33d495913 * 0.3);
    namespace_8eedd8f6cf5d9f19::function_a4dfabe55dd4a652(player, reward_struct, "ob_jup_items_activity_mrp_crane");
    var_e8093c11592ea8ec freescriptable();
    var_7af7f827219d603a freescriptable();
}

