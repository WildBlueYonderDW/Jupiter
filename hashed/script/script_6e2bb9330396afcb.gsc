// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\utility\weapon.gsc;
#using script_7556d6ff132b5aa;
#using scripts\mp\weapons.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;

#namespace bunkerbuster;

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45f
// Size: 0x26e
function function_d5fe78860931c577(glgrenade, objweapon) {
    glgrenade endon("death");
    self endon("disconnect");
    self endon("joined_team");
    self endon("joined_spectators");
    var_a681b7890cd017c7 = spawnstruct();
    childthread function_9c3216631600c8a9(glgrenade, var_a681b7890cd017c7);
    childthread function_2db5f44dbf46ae26(glgrenade, var_a681b7890cd017c7);
    normal = position = velocity = surfacetype = var_16a48d7056e5c472 = stuckto = glgrenade waittill("missile_stuck");
    waittillframeend();
    self notify("stopBunkerbusterStuckMonitors");
    var_8775d2527b5d0349 = function_5c205dc5e843711c(glgrenade);
    grenade = namespace_68e641469fde3fa7::_launchgrenade(var_8775d2527b5d0349, glgrenade.origin, (0, 0, 0));
    namespace_3bbb5a98b932c46f::grenadeinitialize(grenade, makeweapon(var_8775d2527b5d0349));
    grenade.angles = glgrenade.angles;
    grenade.glgrenadeparent = self getcurrentweapon();
    grenade.glgrenade = glgrenade;
    grenade.var_805fe3e45f3bcbe0 = 1;
    grenade.var_a681b7890cd017c7 = var_a681b7890cd017c7;
    grenade.var_939636f512801e8e = glgrenade.var_939636f512801e8e;
    if (isdefined(stuckto)) {
        if (isplayer(stuckto) || isagent(stuckto)) {
            if (stuckto namespace_f8065cafc523dba5::_isalive()) {
                thread namespace_3bbb5a98b932c46f::grenadestuckto(grenade, stuckto);
                if (isdefined(var_16a48d7056e5c472)) {
                    grenade linkto(stuckto, var_16a48d7056e5c472);
                } else {
                    grenade linkto(stuckto, "j_spine4", (0, 0, 0));
                }
            }
        } else if (shouldlink(stuckto, var_16a48d7056e5c472)) {
            if (isdefined(var_16a48d7056e5c472) && var_16a48d7056e5c472 != "scriptbrushmodeldummy") {
                grenade linkto(stuckto, var_16a48d7056e5c472);
            } else {
                grenade linkto(stuckto);
            }
        }
        grenade.var_a681b7890cd017c7.stuckto = stuckto;
        grenade thread function_50975e0bbd033649(stuckto);
    } else {
        var_ce509eb5353c18ab = spawn_script_origin(glgrenade.origin, normal);
        grenade linkto(var_ce509eb5353c18ab);
        grenade.var_e14ba1d91faf13c4 = var_ce509eb5353c18ab;
    }
    grenade thread function_ad336c2696abfcc5();
    grenade thread function_f74ede2695719f2f();
    thread function_3d78dd516c25ef77(grenade);
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d4
// Size: 0x3a3
function function_dbfdf0162b929b01(grenade) {
    level.var_f3b51c8f3ab9c3cc = grenade.weapon_name;
    bundle = function_faec1a1cb92464a4(level.var_f3b51c8f3ab9c3cc);
    function_cb722e58dd976a9a(level.var_f3b51c8f3ab9c3cc, #"hash_8572cb2f781f264", @"hash_e3ecbcc6d770d476", bundle.var_c7d84be99c73c520, 50);
    function_cb722e58dd976a9a(level.var_f3b51c8f3ab9c3cc, #"hash_7d3e2837d42baaa5", @"hash_3550d36068c86a93", bundle.var_8bb9972ad3085661, 12);
    function_cb722e58dd976a9a(level.var_f3b51c8f3ab9c3cc, #"hash_a6b93ce1cbf6b921", @"hash_8766c486f2519ffb", bundle.var_4c8914e128ef2605, 300);
    function_cb722e58dd976a9a(level.var_f3b51c8f3ab9c3cc, #"hash_22f9b30f10107181", @"hash_6bffd30022e9bcab", bundle.var_87227a04f37e51e5, 0);
    function_cb722e58dd976a9a(level.var_f3b51c8f3ab9c3cc, #"hash_8cb5066dd43484e", @"hash_e3ecbcc6d770d476", bundle.var_ff04af9e2bf7b3e2, 50);
    function_e3093afa85e28051(level.var_f3b51c8f3ab9c3cc, #"hash_cc1222273c597c90", @"hash_f1406ba08fa573e", bundle.var_10e4c2667d7d851c, 0.25);
    function_cb722e58dd976a9a(level.var_f3b51c8f3ab9c3cc, #"hash_4f2f60d1d1a21c2f", @"hash_36b6fe748db87bee", bundle.var_7585fd3d703bde1b, 20);
    function_cb722e58dd976a9a(level.var_f3b51c8f3ab9c3cc, #"hash_45c7fa11bd67f431", @"hash_d7df18c5f0ec5694", bundle.var_9d3f5f006709ca35, 5);
    function_e3093afa85e28051(level.var_f3b51c8f3ab9c3cc, #"hash_f757078747615c42", @"hash_6eb6ba9e7ce00943", bundle.var_2305f1c0a8f741de, 0.6);
    function_e3093afa85e28051(level.var_f3b51c8f3ab9c3cc, #"hash_528ae073365b6b0a", @"hash_7ecef2f8627473e8", bundle.var_9cdf2295da8cc63e, 1);
    function_e3093afa85e28051(level.var_f3b51c8f3ab9c3cc, #"hash_53efc09cf6ee129e", @"hash_b75d73bdceff168f", bundle.var_486dfacd741d2a32, 0.5);
    level.var_1dc56e18c9b203b4 = spawnstruct();
    level.var_1dc56e18c9b203b4.var_bf09215c8a0c819 = function_53c4c53197386572(bundle.var_bf09215c8a0c819, 200);
    level.var_1dc56e18c9b203b4.var_cb9dab0107e38b86 = function_53c4c53197386572(bundle.var_cb9dab0107e38b86, 8);
    level.var_1dc56e18c9b203b4.var_3539a0cb2c3755ee = function_53c4c53197386572(bundle.var_3539a0cb2c3755ee, 3);
    level.var_1dc56e18c9b203b4.var_a5cefb49928d2725 = function_53c4c53197386572(bundle.var_b212c2eb7a2bb395, 1.5);
    level.var_1dc56e18c9b203b4.var_e52891682a7d9ad5 = function_53c4c53197386572(bundle.var_72b4bab445db4942, "equip_bunkerbuster_burrowed");
    level.var_1dc56e18c9b203b4.var_e0d21e496722f82a = function_53c4c53197386572(bundle.var_f96127390efb07e9, "bunkerbuster_burrowed_mp");
    level.var_1dc56e18c9b203b4.var_bf3aa12b2917fda0 = function_53c4c53197386572(bundle.var_e4cc1d75ee305317, "bunkerbuster_not_burrowed_mp");
    level.var_1dc56e18c9b203b4.var_8a7e743dfeb0998a = function_53c4c53197386572(bundle.var_53c021767c34ecbb, "bunkerbuster_round_mp");
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa7e
// Size: 0x77
function function_3d78dd516c25ef77(grenade) {
    level endon("game_ended");
    self endon("disconnect");
    grenade endon("explode");
    grenade endon("death");
    function_dbfdf0162b929b01(grenade);
    grenade thread function_be84a39b52576d18();
    grenade thread function_e241396812ed67b2();
    if (function_805fe3e45f3bcbe0(grenade)) {
        var_a681b7890cd017c7 = grenade.var_a681b7890cd017c7;
    } else {
        var_a681b7890cd017c7 = grenade namespace_1a507865f681850e::function_f69ed22535d90b78();
    }
    function_2d7c3d3cba3b7824(grenade, var_a681b7890cd017c7);
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xafc
// Size: 0x195
function function_2d7c3d3cba3b7824(grenade, var_a681b7890cd017c7) {
    level endon("game_ended");
    self endon("disconnect");
    grenade endon("death");
    grenade endon("explode");
    var_e29c6802d3127907 = function_74a4a69afb4bc82b(level.var_f3b51c8f3ab9c3cc, #"hash_cc1222273c597c90");
    wait(var_e29c6802d3127907);
    grenade setscriptablepartstate("effects", "plant", 0);
    stuckto = var_a681b7890cd017c7.stuckto;
    isunderwater = var_a681b7890cd017c7.isunderwater;
    if (istrue(isunderwater)) {
        function_ad251ef4525bded7(grenade);
    } else if (isdefined(stuckto)) {
        if (!isplayer(stuckto)) {
            grenade childthread namespace_1a507865f681850e::function_4af015619e2534ba(stuckto, &function_a5a20b852c325190, 0);
        }
        grenade.stuckto = stuckto;
        if (isplayer(stuckto) || isagent(stuckto) && !istrue(stuckto.var_950c1ab89c9c4e2a)) {
            function_34d256476dec6ee7(grenade, stuckto, istrue(grenade.var_16ac6fac07eacbc3));
        } else if (stuckto.classname == "grenade" || stuckto.classname == "misc_turret" || stuckto.classname == "scriptable" || istrue(stuckto.var_950c1ab89c9c4e2a)) {
            function_1a7e2803d7ddf81a(grenade);
        } else if (stuckto.classname == "script_vehicle") {
            function_6e25a608eafbc362(grenade, stuckto);
        } else {
            function_9c1241b88a86e763(grenade);
        }
    } else {
        function_9c1241b88a86e763(grenade);
    }
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc98
// Size: 0x36
function function_ad251ef4525bded7(grenade) {
    var_c39f2c11290b6aea = "dig_fail";
    function_c8fd05bf21971a04(grenade, var_c39f2c11290b6aea);
    function_3a35103112044e22(grenade);
    function_2c9ec2084ca01277(grenade, var_c39f2c11290b6aea);
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd5
// Size: 0x36
function function_1a7e2803d7ddf81a(grenade) {
    var_c39f2c11290b6aea = "dig_fail";
    function_c8fd05bf21971a04(grenade, var_c39f2c11290b6aea);
    function_3a35103112044e22(grenade);
    function_2c9ec2084ca01277(grenade, var_c39f2c11290b6aea);
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd12
// Size: 0x35
function function_34d256476dec6ee7(grenade, stuckto, hasriotshield) {
    if (hasriotshield) {
        function_649e631c4395e0c(grenade, stuckto);
    } else {
        function_e0f1675a8fe53d0(grenade, stuckto);
    }
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd4e
// Size: 0xe3
function function_649e631c4395e0c(grenade, stuckto) {
    victim = stuckto;
    var_c39f2c11290b6aea = "dig_success";
    fwdvec = anglestoup(grenade.angles) * -1;
    var_5cb6e728dfd846f1 = function_74a4a69afb4bc82b(level.var_f3b51c8f3ab9c3cc, #"hash_7d3e2837d42baaa5");
    offset = fwdvec * var_5cb6e728dfd846f1;
    spawnpoint = grenade.origin + offset;
    function_c8fd05bf21971a04(grenade, var_c39f2c11290b6aea, spawnpoint, fwdvec);
    function_88831f8be20721fe(grenade, spawnpoint);
    grenade.var_57a5afd100d3bfda.stuckto = victim;
    thread namespace_3bbb5a98b932c46f::grenadestuckto(grenade.var_57a5afd100d3bfda, victim);
    function_2c9ec2084ca01277(grenade, var_c39f2c11290b6aea);
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe38
// Size: 0x92
function function_e0f1675a8fe53d0(grenade, stuckto) {
    victim = stuckto;
    var_c39f2c11290b6aea = "character_stuck";
    thread namespace_3bbb5a98b932c46f::grenadestuckto(grenade, victim);
    function_c8fd05bf21971a04(grenade, var_c39f2c11290b6aea);
    function_3a35103112044e22(grenade);
    grenade.var_57a5afd100d3bfda.stuckto = victim;
    thread namespace_3bbb5a98b932c46f::grenadestuckto(grenade.var_57a5afd100d3bfda, victim);
    if (!isagent(victim)) {
        victim childthread function_7685538105c42e44(grenade);
    }
    function_2c9ec2084ca01277(grenade, var_c39f2c11290b6aea);
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed1
// Size: 0xe1
function function_7685538105c42e44(grenade) {
    var_e601acf6ad00af27 = function_74a4a69afb4bc82b(level.var_f3b51c8f3ab9c3cc, #"hash_4f2f60d1d1a21c2f");
    var_6a9734d81cbb50e7 = function_74a4a69afb4bc82b(level.var_f3b51c8f3ab9c3cc, #"hash_45c7fa11bd67f431");
    maxtime = function_74a4a69afb4bc82b(level.var_f3b51c8f3ab9c3cc, #"hash_f757078747615c42");
    starttime = gettime();
    self playlocalsound("eqp_bunkerbuster_drill_npc");
    for (var_5fa323075902c461 = 0; var_5fa323075902c461 < var_6a9734d81cbb50e7; var_5fa323075902c461++) {
        self dodamage(var_e601acf6ad00af27, grenade.origin, grenade.owner, grenade, "MOD_RIFLE_BULLET", grenade.weapon_object, "torso_upper");
        wait(maxtime / var_6a9734d81cbb50e7);
    }
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb9
// Size: 0x2a9
function function_9c1241b88a86e763(grenade) {
    level endon("game_ended");
    self endon("disconnect");
    grenade endon("death");
    grenade endon("explode");
    upvec = anglestoup(grenade.angles);
    var_a048549727655a17 = function_c38d0c6d56a3d8bc(grenade);
    var_2fc7b90001702e5c = [0:grenade];
    offset = var_a048549727655a17;
    var_ec9c47f7d01c1033 = grenade.origin;
    surfacenormal = anglestoup(grenade.angles);
    var_5996067fa75e09d4 = 0;
    var_5230e3e1ea57d7f1 = function_b628a9f30e4b39c7(grenade);
    while (offset <= var_5230e3e1ea57d7f1) {
        var_28ae17b3ccee3b7e = upvec * -1 * offset;
        endorigin = grenade.origin + var_28ae17b3ccee3b7e;
        traceback = namespace_2a184fc4902783dc::ray_trace(endorigin, grenade.origin, var_2fc7b90001702e5c, namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 0, 1, 1, 0, 0), 1);
        if (traceback["hittype"] != "hittype_none") {
            var_ec9c47f7d01c1033 = traceback["position"] - grenade.origin;
            surfacenormal = vectornormalize(traceback["position"] - grenade.origin);
            /#
                if (getdvarint(@"hash_bd5518e51571529b", 0)) {
                    level thread draw_line_for_time(var_ec9c47f7d01c1033 + grenade.origin, grenade.origin, 1, 0, 0, 100);
                }
            #/
            var_5996067fa75e09d4 = 1;
            break;
        }
        offset = offset + var_a048549727655a17;
        waitframe();
    }
    if (var_5996067fa75e09d4) {
        var_5996067fa75e09d4 = function_8f7774e4e68d2a43(grenade, var_ec9c47f7d01c1033, surfacenormal);
    }
    worldup = anglestoup(self getworldupreferenceangles());
    var_c83a8d3d629f1dac = anglestoup(grenade.angles);
    var_fccbf8939ad0065 = vectordot(worldup, var_c83a8d3d629f1dac);
    grenade.var_bfcf780c7f28fbd4 = var_fccbf8939ad0065 >= -0.5 && var_fccbf8939ad0065 <= 0.5;
    var_c39f2c11290b6aea = ter_op(var_5996067fa75e09d4, "dig_success", "dig_fail");
    function_c8fd05bf21971a04(grenade, var_c39f2c11290b6aea, var_ec9c47f7d01c1033, surfacenormal);
    var_2a21b9990f69270e = getdvarfloat(@"hash_dcc19c96af625740", 0);
    wait(var_2a21b9990f69270e);
    if (!var_5996067fa75e09d4) {
        function_3a35103112044e22(grenade);
    } else {
        function_5f9b222ef93f265e(grenade, var_ec9c47f7d01c1033, surfacenormal);
    }
    function_2c9ec2084ca01277(grenade, var_c39f2c11290b6aea);
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1269
// Size: 0x19a
function function_c8fd05bf21971a04(grenade, var_318555433a0d7da0, spawnoffset, var_30f3bd16d27cf3bc, var_417c6cdaf53e0dce) {
    level endon("game_ended");
    self endon("disconnect");
    grenade endon("death");
    grenade endon("explode");
    spawnpoint = grenade.origin;
    if (!isdefined(spawnpoint)) {
        spawnpoint = spawnoffset + grenade.origin;
    }
    if (!isdefined(var_30f3bd16d27cf3bc)) {
        var_30f3bd16d27cf3bc = anglestoforward(grenade.angles);
    }
    if (var_318555433a0d7da0 == "dig_fail") {
        var_f2c94ec1c211c6d6 = spawn_script_origin(spawnpoint, grenade.angles);
        grenade.var_f2c94ec1c211c6d6 = var_f2c94ec1c211c6d6;
        grenade setscriptablepartstate("effects", "sizzle-fail", 0);
    } else {
        var_f2c94ec1c211c6d6 = spawn("script_model", spawnpoint);
        var_f2c94ec1c211c6d6.angles = vectortoangles(var_30f3bd16d27cf3bc);
        var_f2c94ec1c211c6d6 setmodel(level.var_1dc56e18c9b203b4.var_e52891682a7d9ad5);
        var_f2c94ec1c211c6d6 linkto(grenade);
        grenade.var_f2c94ec1c211c6d6 = var_f2c94ec1c211c6d6;
        if (var_318555433a0d7da0 == "character_stuck" && isdismembermentenabled() && !istrue(var_417c6cdaf53e0dce)) {
            grenade setscriptablepartstate("effects", "sizzle-player-stuck", 0);
        } else {
            grenade setscriptablepartstate("effects", "sizzle-success", 0);
            var_a2d683023dd73ecc = getdvarfloat(@"hash_dd3f674055086845", 0.75);
            wait(var_a2d683023dd73ecc);
            var_f2c94ec1c211c6d6 setscriptablepartstate("thermal_lance", "active", 0);
        }
    }
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x140a
// Size: 0xaa
function function_2c9ec2084ca01277(grenade, var_c39f2c11290b6aea) {
    level endon("game_ended");
    self endon("disconnect");
    grenade endon("explode");
    grenade endon("death");
    var_ad5532bd0a7f34d7 = function_74a4a69afb4bc82b(level.var_f3b51c8f3ab9c3cc, #"hash_528ae073365b6b0a");
    if (var_c39f2c11290b6aea == "vehicle_stuck") {
        var_ad5532bd0a7f34d7 = level.var_1dc56e18c9b203b4.var_3539a0cb2c3755ee;
    }
    if (var_c39f2c11290b6aea == "player_stuck") {
        var_ad5532bd0a7f34d7 = level.var_1dc56e18c9b203b4.var_a5cefb49928d2725;
    }
    wait(getdvarfloat(@"hash_4e0c2a5ace3abb90", var_ad5532bd0a7f34d7));
    function_500b28a55f3ecc0e(grenade, var_c39f2c11290b6aea);
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14bb
// Size: 0x5c
function function_6e25a608eafbc362(grenade, vehicle) {
    namespace_d325722f2754c2c4::function_69d45a21a6d4e9f8(vehicle, self.team);
    var_c39f2c11290b6aea = "vehicle_stuck";
    grenade.var_a5d118f040f60db0 = vehicle;
    function_c8fd05bf21971a04(grenade, var_c39f2c11290b6aea);
    function_3a35103112044e22(grenade);
    function_2c9ec2084ca01277(grenade, var_c39f2c11290b6aea);
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x151e
// Size: 0x188
function function_5f9b222ef93f265e(grenade, spawnoffset, surfacenormal) {
    spawnpoint = grenade.origin;
    if (isdefined(spawnoffset)) {
        spawnpoint = spawnpoint + spawnoffset;
    }
    var_f3714cd7b3b5526d = function_85123e3a93096cb(grenade);
    grenade.var_57a5afd100d3bfda = _launchgrenade(var_f3714cd7b3b5526d, spawnpoint, (0, 0, 0), 100, 1);
    grenade.var_57a5afd100d3bfda.weapon_object = makeweapon(var_f3714cd7b3b5526d);
    namespace_3bbb5a98b932c46f::grenadeinitialize(grenade.var_57a5afd100d3bfda, grenade.var_57a5afd100d3bfda.weapon_object);
    grenade.var_57a5afd100d3bfda.angles = grenade.var_f2c94ec1c211c6d6.angles;
    grenade.var_57a5afd100d3bfda linkto(grenade.var_f2c94ec1c211c6d6);
    /#
        if (getdvarint(@"hash_bd5518e51571529b", 0)) {
            level thread draw_angles(grenade.var_57a5afd100d3bfda.angles, grenade.var_57a5afd100d3bfda.origin, (1, 0, 0), 1000, 20);
        }
    #/
    grenade setscriptablepartstate("effects", "sizzle-success", 0);
    grenade.var_57a5afd100d3bfda setscriptablepartstate("danger-icon", "on", 0);
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ad
// Size: 0xc0
function function_3a35103112044e22(grenade) {
    var_bed6499e83e9b59e = function_4bdb5fce70a89130(grenade);
    var_f3714cd7b3b5526d = function_85123e3a93096cb(grenade);
    var_57a5afd100d3bfda = _launchgrenade(var_bed6499e83e9b59e, grenade.origin, (0, 0, 0), 100, 1);
    var_57a5afd100d3bfda linkto(grenade.var_f2c94ec1c211c6d6);
    grenade.var_57a5afd100d3bfda = var_57a5afd100d3bfda;
    grenade.var_57a5afd100d3bfda.weapon_object = makeweapon(var_f3714cd7b3b5526d);
    namespace_3bbb5a98b932c46f::grenadeinitialize(grenade.var_57a5afd100d3bfda, grenade.var_57a5afd100d3bfda.weapon_object);
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1774
// Size: 0xbe
function function_88831f8be20721fe(grenade, spawnpoint) {
    var_bed6499e83e9b59e = function_4bdb5fce70a89130(grenade);
    var_f3714cd7b3b5526d = function_85123e3a93096cb(grenade);
    var_57a5afd100d3bfda = _launchgrenade(var_bed6499e83e9b59e, spawnpoint, (0, 0, 0), 100, 1);
    var_57a5afd100d3bfda linkto(grenade.var_f2c94ec1c211c6d6);
    grenade.var_57a5afd100d3bfda = var_57a5afd100d3bfda;
    grenade.var_57a5afd100d3bfda.weapon_object = makeweapon(var_f3714cd7b3b5526d);
    namespace_3bbb5a98b932c46f::grenadeinitialize(grenade.var_57a5afd100d3bfda, grenade.var_57a5afd100d3bfda.weapon_object);
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1839
// Size: 0x7d
function function_8f7774e4e68d2a43(grenade, var_cb3a5854c8269a89, var_2b268884e45f090a) {
    offset = getdvarint(@"hash_8feb82dd51a5a0c2", 25);
    var_256392925c393bd0 = var_cb3a5854c8269a89 + grenade.origin;
    var_256392925c393bd0 = var_256392925c393bd0 + var_2b268884e45f090a * offset;
    isoob = namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(var_256392925c393bd0, self.team);
    if (isoob) {
        return 0;
    } else {
        return 1;
    }
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18bd
// Size: 0x415
function function_500b28a55f3ecc0e(grenade, var_c39f2c11290b6aea) {
    level endon("game_ended");
    self endon("disconnect");
    grenade endon("death");
    grenade endon("explode");
    stuckto = grenade.stuckto;
    if (isdefined(stuckto) && (var_c39f2c11290b6aea == "vehicle_stuck" || var_c39f2c11290b6aea == "character_stuck")) {
        function_1cdf454e2f856a7f(grenade);
    } else if (var_c39f2c11290b6aea == "dig_success") {
        var_c225480c1fd1c87f = grenade.var_f2c94ec1c211c6d6.angles;
        var_160a13625801abec = grenade.var_57a5afd100d3bfda.origin;
        grenade.var_57a5afd100d3bfda unlink();
        grenade.var_57a5afd100d3bfda delete();
        var_6e17d9fbf3b64b04 = (0, 0, 0);
        var_35704482652c4cdc = var_160a13625801abec + anglestoup(grenade.angles) * -1 * 8;
        var_3249cb1787e8b3f = function_802e4fe81feb0dc6(grenade);
        if (isdefined(grenade.var_ce68de48bc529cd2)) {
            if (istrue(self.hasriotshield)) {
                var_35704482652c4cdc = grenade.var_ce68de48bc529cd2 gettagorigin("j_spine4");
            }
        } else {
            var_6e17d9fbf3b64b04 = var_6e17d9fbf3b64b04 + anglestoforward(var_c225480c1fd1c87f) * getdvarint(@"hash_8766c486f2519ffb", 300);
            if (istrue(grenade.var_bfcf780c7f28fbd4)) {
                var_6e17d9fbf3b64b04 = var_6e17d9fbf3b64b04 + anglestoup(var_c225480c1fd1c87f) * getdvarint(@"hash_6bffd30022e9bcab", 0) * -1;
            }
            var_6e17d9fbf3b64b04 = var_6e17d9fbf3b64b04 + function_239a8ac31714b354();
        }
        grenade.var_57a5afd100d3bfda = _launchgrenade(var_3249cb1787e8b3f, var_35704482652c4cdc, var_6e17d9fbf3b64b04, 100, 1);
        grenade.var_57a5afd100d3bfda.weapon_object = makeweapon(var_3249cb1787e8b3f);
        namespace_3bbb5a98b932c46f::grenadeinitialize(grenade.var_57a5afd100d3bfda, grenade.var_57a5afd100d3bfda.weapon_object);
        grenade.var_57a5afd100d3bfda.angles = var_c225480c1fd1c87f;
        grenade.var_57a5afd100d3bfda setscriptablepartstate("shoot", "shoot", 0);
        grenade setscriptablepartstate("effects", "shoot", 0);
        grenade.var_57a5afd100d3bfda setscriptablepartstate("danger-icon", "on", 0);
        if (isdefined(grenade.var_ce68de48bc529cd2) && istrue(grenade.var_ce68de48bc529cd2.hasriotshield)) {
            thread namespace_3bbb5a98b932c46f::grenadestuckto(grenade.var_57a5afd100d3bfda, grenade.var_ce68de48bc529cd2, 1);
        } else {
            var_1ca111ff86819c24 = getdvarfloat(@"hash_b75d73bdceff168f", 0.5);
            grenade.var_57a5afd100d3bfda waittill_any_timeout_1(var_1ca111ff86819c24, "missile_stuck");
        }
        grenade.var_57a5afd100d3bfda.angles = var_c225480c1fd1c87f;
        grenade.var_57a5afd100d3bfda setscriptablepartstate("shoot", "shoot", 0);
        grenade setscriptablepartstate("effects", "shoot", 0);
        grenade.var_57a5afd100d3bfda setscriptablepartstate("danger-icon", "on", 0);
        var_1ca111ff86819c24 = function_74a4a69afb4bc82b(level.var_f3b51c8f3ab9c3cc, #"hash_53efc09cf6ee129e");
        grenade.var_57a5afd100d3bfda waittill_any_timeout_1(var_1ca111ff86819c24, "missile_stuck");
        grenade.var_57a5afd100d3bfda setscriptablepartstate("shoot", "explode", 0);
    } else {
        grenade setscriptablepartstate("effects", "explode", 0);
    }
    wait(0.1);
    if (isdefined(grenade.var_57a5afd100d3bfda)) {
        grenade.var_57a5afd100d3bfda.detonated = 1;
        grenade.var_57a5afd100d3bfda detonate();
    }
    grenade thread function_a5a20b852c325190(0, ter_op(var_c39f2c11290b6aea == "dig_success", 1, 0));
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cd9
// Size: 0x5e
function function_1cdf454e2f856a7f(grenade) {
    stuckto = grenade.stuckto;
    if (stuckto.classname == "script_vehicle") {
        function_e5be7a1f18a659fb(grenade, stuckto);
    } else if (isplayer(stuckto) || isagent(stuckto)) {
        function_e41a24ef376dbf52(grenade, stuckto);
    }
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d3e
// Size: 0x6b
function function_239a8ac31714b354() {
    var_6245153ab14fee9f = (0, 0, 0);
    var_a2731e6d9af15254 = self getmovingplatformparent();
    if (isdefined(var_a2731e6d9af15254)) {
        var_9a0a6e697dac74fe = var_a2731e6d9af15254.velocity;
        if (!isdefined(var_9a0a6e697dac74fe) && var_a2731e6d9af15254 namespace_1f188a13f7e79610::isvehicle()) {
            var_9a0a6e697dac74fe = var_a2731e6d9af15254 vehicle_getvelocity();
        }
        if (isdefined(var_9a0a6e697dac74fe)) {
            var_6245153ab14fee9f = var_6245153ab14fee9f + var_9a0a6e697dac74fe;
        }
    }
    return var_6245153ab14fee9f;
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1db1
// Size: 0x173
function function_e5be7a1f18a659fb(grenade, vehicle) {
    if (isdefined(vehicle)) {
        namespace_d325722f2754c2c4::function_28e583bfecc38a25(vehicle, self.team);
        if (!namespace_1f188a13f7e79610::vehicle_isfriendlytoteam(vehicle, self.team)) {
            var_b259ed77a6cc08 = namespace_5a0f3ca265d3a4c8::function_7aaa7ae503292f43(vehicle.vehiclename);
            damagedata = spawnstruct();
            damagedata.inflictor = grenade;
            damagedata.meansofdeath = "MOD_EXPLOSIVE";
            damagedata.attacker = grenade.owner;
            if (isdefined(var_b259ed77a6cc08)) {
                damagedata.objweapon = makeweapon(var_b259ed77a6cc08);
            }
            var_29187ec6e45d7481 = spawnstruct();
            var_29187ec6e45d7481.nocorpse = 1;
            vehicle namespace_1fbd40990ee60ede::vehicle_occupancy_killoccupants(vehicle, damagedata, var_29187ec6e45d7481);
        }
    }
    if (isdefined(grenade.var_57a5afd100d3bfda)) {
        grenade.var_57a5afd100d3bfda unlink();
        grenade.var_57a5afd100d3bfda = _launchgrenade(function_aaa1f16521b1a40e(1, 1), vehicle.origin, (0, 0, 0), undefined, 1, grenade.var_57a5afd100d3bfda);
        grenade.var_57a5afd100d3bfda setscriptablepartstate("shoot", "explode", 0);
        grenade.var_57a5afd100d3bfda linkto(vehicle, "tag_origin");
    }
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f2b
// Size: 0x57
function function_e41a24ef376dbf52(grenade, player) {
    if (isdismembermentenabled() || isagent(player)) {
        grenade.var_57a5afd100d3bfda setscriptablepartstate("shoot", "explode-player-stuck", 0);
    } else {
        grenade setscriptablepartstate("effects", "explode", 0);
    }
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f89
// Size: 0x38
function function_be84a39b52576d18() {
    level endon("game_ended");
    self endon("explode");
    self.owner waittill_any_3("disconnect", "joined_team", "joined_spectators");
    thread function_a5a20b852c325190();
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fc8
// Size: 0x94
function function_a5a20b852c325190(immediate, var_5996067fa75e09d4) {
    level endon("game_ended");
    self endon("death");
    self notify("explode");
    if (!isdefined(self) || istrue(self.exploding)) {
        return;
    }
    self.exploding = 1;
    if (istrue(var_5996067fa75e09d4)) {
        var_4b54b08a970445f6 = getdvarfloat(@"hash_a72d28a8eef62114", 0.5);
        wait(var_4b54b08a970445f6);
    }
    self setscriptablepartstate("effects", "destroy", 0);
    if (!istrue(immediate)) {
        wait(0.25);
    }
    thread function_f0acd469ce8642b9();
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2063
// Size: 0x19
function function_f0acd469ce8642b9() {
    self notify("death");
    function_7f69923dc06f01d7();
    self delete();
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2083
// Size: 0x20
function function_e241396812ed67b2() {
    level endon("game_ended");
    self endon("explode");
    self waittill("death");
    function_7f69923dc06f01d7();
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20aa
// Size: 0x6f
function function_7f69923dc06f01d7() {
    if (isdefined(self.var_57a5afd100d3bfda) && !istrue(self.var_57a5afd100d3bfda.detonated)) {
        self.var_57a5afd100d3bfda delete();
    }
    if (isdefined(self.var_f2c94ec1c211c6d6)) {
        self.var_f2c94ec1c211c6d6 delete();
    }
    if (isdefined(self.var_ce509eb5353c18ab)) {
        self.var_ce509eb5353c18ab delete();
    }
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2120
// Size: 0x90
function function_66629d921c921905(data) {
    grenade = data.inflictor;
    victim = data.victim;
    if (data.meansofdeath == "MOD_IMPACT") {
        if (isdefined(data.hitloc) && data.hitloc == "shield") {
            grenade.var_16ac6fac07eacbc3 = 1;
            if (isdefined(victim)) {
                grenade.var_ce68de48bc529cd2 = victim;
            }
        }
    }
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x21b7
// Size: 0x90
function function_c4ea262b1d9b9791(data) {
    grenade = data.inflictor;
    victim = data.victim;
    if (data.meansofdeath == "MOD_IMPACT") {
        if (isdefined(data.hitloc) && data.hitloc == "shield") {
            grenade.var_16ac6fac07eacbc3 = 1;
            if (isdefined(victim)) {
                grenade.var_ce68de48bc529cd2 = victim;
            }
        }
    }
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x224e
// Size: 0x1f
function function_b628a9f30e4b39c7(grenade) {
    if (function_805fe3e45f3bcbe0(grenade)) {
        return 120;
    } else {
        return 200;
    }
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2274
// Size: 0x3b
function function_c38d0c6d56a3d8bc(grenade) {
    if (function_805fe3e45f3bcbe0(grenade)) {
        return getdvarint(@"hash_be292c291d5de958", 10);
    } else {
        return getdvarint(@"hash_e3ecbcc6d770d476", 50);
    }
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22b6
// Size: 0x25
function function_5c205dc5e843711c(grenade) {
    if (function_943b92015d44ae1(grenade)) {
        return "bunkerbuster_gl_v2_mp";
    } else {
        return "bunkerbuster_gl_mp";
    }
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22e2
// Size: 0x46
function function_85123e3a93096cb(grenade) {
    if (function_805fe3e45f3bcbe0(grenade)) {
        if (function_943b92015d44ae1(grenade)) {
            return "bunkerbuster_burrowed_gl_v2_mp";
        } else {
            return "bunkerbuster_burrowed_gl_mp";
        }
    } else {
        return level.var_1dc56e18c9b203b4.var_e0d21e496722f82a;
    }
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x232f
// Size: 0x46
function function_4bdb5fce70a89130(grenade) {
    if (function_805fe3e45f3bcbe0(grenade)) {
        if (function_943b92015d44ae1(grenade)) {
            return "bunkerbuster_not_burrowed_gl_v2_mp";
        } else {
            return "bunkerbuster_not_burrowed_gl_mp";
        }
    } else {
        return level.var_1dc56e18c9b203b4.var_bf3aa12b2917fda0;
    }
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x237c
// Size: 0x46
function function_802e4fe81feb0dc6(grenade) {
    if (function_805fe3e45f3bcbe0(grenade)) {
        if (function_943b92015d44ae1(grenade)) {
            return "bunkerbuster_round_gl_v2_mp";
        } else {
            return "bunkerbuster_round_gl_mp";
        }
    } else {
        return level.var_1dc56e18c9b203b4.var_8a7e743dfeb0998a;
    }
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23c9
// Size: 0x18
function function_805fe3e45f3bcbe0(grenade) {
    return isdefined(grenade.var_805fe3e45f3bcbe0);
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23e9
// Size: 0x2a
function function_943b92015d44ae1(grenade) {
    return isdefined(grenade.var_939636f512801e8e) && grenade.var_939636f512801e8e == 2;
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x241b
// Size: 0x3b
function function_9c3216631600c8a9(glgrenade, var_a681b7890cd017c7) {
    self endon("stopBunkerbusterStuckMonitors");
    var_c1d84ab4c521636d = glgrenade waittill("missile_door_stuck");
    var_a681b7890cd017c7.var_972c39a514f196d1 = var_c1d84ab4c521636d;
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x245d
// Size: 0x31
function function_2db5f44dbf46ae26(glgrenade, var_a681b7890cd017c7) {
    self endon("stopBunkerbusterStuckMonitors");
    glgrenade waittill("missile_water_impact");
    var_a681b7890cd017c7.isunderwater = 1;
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2495
// Size: 0x30
function function_ad336c2696abfcc5() {
    level endon("game_ended");
    self endon("explode");
    self endon("death");
    self waittill("unlinkGrenade");
    if (self islinked()) {
        self unlink();
    }
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24cc
// Size: 0x32
function function_50975e0bbd033649(stuckto) {
    level endon("game_ended");
    self endon("explode");
    self endon("death");
    while (isdefined(stuckto)) {
        waitframe();
    }
    self notify("unlinkGrenade");
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2505
// Size: 0xca
function function_f74ede2695719f2f() {
    level endon("game_ended");
    self endon("explode");
    self endon("death");
    if (isdefined(self.var_a681b7890cd017c7.var_972c39a514f196d1) && self.var_a681b7890cd017c7.var_972c39a514f196d1 scriptableisdoor()) {
        var_52b3cf8d2e3c1890 = self.var_a681b7890cd017c7.var_972c39a514f196d1 scriptabledoorangle();
        while (1) {
            wait(0.1);
            if (!isdefined(self.var_a681b7890cd017c7.var_972c39a514f196d1)) {
                break;
            }
            var_1b1ff29fe94010f6 = self.var_a681b7890cd017c7.var_972c39a514f196d1 scriptabledoorangle();
            if (var_1b1ff29fe94010f6 != var_52b3cf8d2e3c1890) {
                break;
            }
        }
        self notify("unlinkGrenade");
    }
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25d6
// Size: 0x42
function shouldlink(stuckto, var_16a48d7056e5c472) {
    if (isdefined(stuckto) && isdefined(stuckto.code_classname) && stuckto.code_classname == "scriptable") {
        return 0;
    }
    return 1;
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2620
// Size: 0x78
function function_eae0802093a7e5f5(weapon) {
    if (!isdefined(weapon) || !isdefined(weapon.weapon_name)) {
        return 0;
    }
    switch (weapon.weapon_name) {
    case #"hash_6547ec525f1340da":
    case #"hash_a009d256608f52ce":
    case #"hash_c4b9b21ecac2ced4":
    case #"hash_d6565ec12efca627":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace bunkerbuster/namespace_14ec1bc880a07c3b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x269f
// Size: 0x67
function function_aaa1f16521b1a40e(var_8bb3fd7399032a6a, var_4e80d1a7264b4b0f) {
    var_597c7c34455965be = level.var_1dc56e18c9b203b4.var_8a7e743dfeb0998a;
    if (istrue(var_8bb3fd7399032a6a)) {
        var_597c7c34455965be = level.var_1dc56e18c9b203b4.var_bf3aa12b2917fda0;
        if (istrue(var_4e80d1a7264b4b0f)) {
            var_597c7c34455965be = level.var_1dc56e18c9b203b4.var_e0d21e496722f82a;
        }
    }
    return var_597c7c34455965be;
}

