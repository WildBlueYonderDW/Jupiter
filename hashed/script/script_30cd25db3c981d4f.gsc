// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\ai.gsc;
#using script_247745a526421ba7;
#using scripts\mp\killstreaks\mapselect.gsc;
#using scripts\mp\supers.gsc;
#using script_2aabac61f2ae422;
#using script_1ed1214969b5eba7;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\common\anim.gsc;
#using script_736dec95a49487a6;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\mp\damage.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\mp\bots\bots.gsc;
#using scripts\cp_mp\ent_manager.gsc;

#namespace namespace_db64b978d03226b;

// Namespace namespace_db64b978d03226b/namespace_71c9e937b8c408a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x470
// Size: 0x2e
function function_d1f6522bc93ed94e() {
    level._effect["vfx/iw9/fieldupgrades/smokeairdrop/vfx_fieldup_smokeairdrop.vfx"] = loadfx("vfx/iw9/fieldupgrades/smokeairdrop/vfx_fieldup_smokeairdrop.vfx");
    function_7fcfdd32159bbacc();
    level.var_92e2c130a8ea2b6c = [];
}

// Namespace namespace_db64b978d03226b/namespace_71c9e937b8c408a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a5
// Size: 0x91
function function_7fcfdd32159bbacc() {
    level.scr_animtree["super_smoke_airdrop"] = %script_model;
    level.scr_anim["super_smoke_airdrop"]["activate_drone_1"] = script_model%wm_smoke_airdrop_drone_01;
    level.scr_anim["super_smoke_airdrop"]["activate_drone_2"] = script_model%wm_smoke_airdrop_drone_02;
    level.scr_anim["super_smoke_airdrop"]["activate_drone_3"] = script_model%wm_smoke_airdrop_drone_03;
    level.scr_anim["super_smoke_airdrop"]["activate_drone_4"] = script_model%wm_smoke_airdrop_drone_04;
}

// Namespace namespace_db64b978d03226b/namespace_71c9e937b8c408a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53d
// Size: 0x17
function function_685e618d30da1588() {
    result = thread function_5e73f80daa45f50c();
    return 1;
}

// Namespace namespace_db64b978d03226b/namespace_71c9e937b8c408a1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55c
// Size: 0x1f
function function_cd3021441020e8e5(var_19163e14365d9264) {
    namespace_bc3bdbac7cebdc14::function_90f093ca8576232f(0, 1, "short_arrow", undefined, var_19163e14365d9264);
    return 1;
}

// Namespace namespace_db64b978d03226b/namespace_71c9e937b8c408a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x583
// Size: 0xb
function function_269055d8846e4665() {
    self notify("cancel_all_super_deployments");
}

// Namespace namespace_db64b978d03226b/namespace_71c9e937b8c408a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x595
// Size: 0x22
function function_21c87ff403d1baf6() {
    while (!istrue(namespace_85d036cb78063c4a::getcurrentsuper().isinuse)) {
        waitframe();
    }
    namespace_85d036cb78063c4a::refundsuper();
}

// Namespace namespace_db64b978d03226b/namespace_71c9e937b8c408a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5be
// Size: 0x3f
function function_9815deed1e75ef69() {
    if (!self isonground() && !self isswimming()) {
        return 0;
    }
    if (self isonladder()) {
        return 0;
    }
    if (istrue(self.super.isdeploying)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_db64b978d03226b/namespace_71c9e937b8c408a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x605
// Size: 0xde
function function_5e73f80daa45f50c() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("remove_super");
    if (!function_9815deed1e75ef69()) {
        function_21c87ff403d1baf6();
        return;
    }
    var_19163e14365d9264 = namespace_85d036cb78063c4a::getcurrentsuper();
    var_9b1deb5e9d32bbe3 = namespace_49492dacb8708592::function_8300ec48c43363d6(var_19163e14365d9264, makeweapon("super_remote_map_mp"), 1, &function_cd3021441020e8e5);
    if (!istrue(var_9b1deb5e9d32bbe3)) {
        function_21c87ff403d1baf6();
        return;
    }
    self playlocalsound("iw9_ks_tablet_ui_screen_plr");
    mappointinfo = namespace_bc3bdbac7cebdc14::function_a5839924b6723eac(var_19163e14365d9264, 1, 1);
    if (!isdefined(mappointinfo)) {
        function_21c87ff403d1baf6();
        return;
    }
    self notify("super_finished_with_deploy_weapon");
    self playlocalsound("iw9_ks_tablet_ui_select_final_plr");
    thread function_5ea4c63126ad14fc(var_19163e14365d9264, mappointinfo);
    if (issharedfuncdefined("supers", "superUseFinished")) {
        self [[ getsharedfunc("supers", "superUseFinished") ]]();
    }
}

// Namespace namespace_db64b978d03226b/namespace_71c9e937b8c408a1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ea
// Size: 0xc5
function function_5ea4c63126ad14fc(streakinfo, mappointinfo) {
    level endon("game_ended");
    self endon("disconnect");
    waittime = getdvarfloat(@"hash_9c4a873bf6fcab41", 1.5);
    wait(waittime);
    foreach (var_470c049a636db53d in mappointinfo) {
        var_e2b7f60365cba129 = var_470c049a636db53d.location;
        directionyaw = var_470c049a636db53d.angles;
        function_645ff6d87a68eb7e(var_e2b7f60365cba129, directionyaw, streakinfo);
        wait(1);
    }
}

// Namespace namespace_db64b978d03226b/namespace_71c9e937b8c408a1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b6
// Size: 0x3b4
function function_645ff6d87a68eb7e(droplocation, directionyaw, streakinfo) {
    level endon("game_ended");
    bundle = namespace_4a3033eafa6fd07::function_bf9c7e9dd30180e3("super_smoke_airdrop");
    midpoint = droplocation;
    halfdistance = 1000;
    var_ec85ed3e96dae633 = (0, directionyaw, 0);
    var_801d37e9149bbc7c = anglestoforward(var_ec85ed3e96dae633);
    var_ede169ee001cb3cf = anglestoright(var_ec85ed3e96dae633);
    startpoint = midpoint + var_801d37e9149bbc7c * -1 * halfdistance;
    endpoint = midpoint + var_801d37e9149bbc7c * halfdistance;
    currentpoint = startpoint;
    totaldistance = halfdistance * 2;
    var_c622144d94ae6d95 = getdvarint(@"hash_d6117e0006347933", bundle.var_c622144d94ae6d95);
    var_ecb39c9eecbd70ad = getdvarint(@"hash_80d60fd8731d5fbf", 2000);
    contents = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 0, 0, 0, 0, 0, 0);
    var_4c1fc889585f5df5 = [];
    var_e767d0cb155a0e85 = [];
    for (i = 0; i < var_c622144d94ae6d95; i++) {
        /#
            level thread namespace_d028276791d9cff6::drawsphere(currentpoint, 10, 100, (1, 0, 0));
        #/
        var_409cf6f9fe71f7d2 = 0;
        var_f8126431cc8d7b75 = anglestoup(var_ec85ed3e96dae633);
        var_265ac1f6b1f28744 = currentpoint;
        var_314159fc90761894 = currentpoint + anglestoup(var_ec85ed3e96dae633) * var_ecb39c9eecbd70ad;
        var_80c9138be290d6e7 = currentpoint + anglestoup(var_ec85ed3e96dae633) * var_ecb39c9eecbd70ad * -1;
        var_4ee1c3d63bd43d9a = namespace_2a184fc4902783dc::ray_trace(var_314159fc90761894, var_80c9138be290d6e7, undefined, contents);
        if (var_4ee1c3d63bd43d9a["hittype"] != "hittype_none") {
            var_265ac1f6b1f28744 = var_4ee1c3d63bd43d9a["position"];
            /#
                level thread namespace_d028276791d9cff6::drawsphere(var_265ac1f6b1f28744, 10, 100, (0, 1, 0));
            #/
        }
        var_5573665c23482d35 = getdvarfloat(@"hash_fae98b333c47d007", 2000);
        var_5573665c23482d35 = var_5573665c23482d35 * var_5573665c23482d35;
        if (distancesquared(var_265ac1f6b1f28744, currentpoint) > var_5573665c23482d35) {
            var_409cf6f9fe71f7d2 = 1;
        }
        if (!var_409cf6f9fe71f7d2) {
            index = var_e767d0cb155a0e85.size;
            var_e767d0cb155a0e85[index] = function_495ebe31c275c3c5(var_265ac1f6b1f28744, var_ec85ed3e96dae633, var_ecb39c9eecbd70ad, index);
            var_4c1fc889585f5df5[index] = var_265ac1f6b1f28744;
        }
        currentpoint = currentpoint + totaldistance / var_c622144d94ae6d95 * var_801d37e9149bbc7c;
    }
    var_7e544f0d6d580e78 = 0;
    var_a093aaec0039f208 = 100;
    var_35efd96aa054a86f = 300;
    for (j = 0; j < var_e767d0cb155a0e85.size; j++) {
        var_e767d0cb155a0e85[j].var_70cb65f6b1d7d192 = 0;
        if (!var_7e544f0d6d580e78 && distancesquared(var_4c1fc889585f5df5[j], droplocation) < squared(var_a093aaec0039f208)) {
            var_e767d0cb155a0e85[j].var_70cb65f6b1d7d192 = 1;
            var_7e544f0d6d580e78 = 1;
        }
        for (p = 0; p < var_4c1fc889585f5df5.size; p++) {
            if (distancesquared(var_4c1fc889585f5df5[p], var_4c1fc889585f5df5[j]) < squared(var_35efd96aa054a86f) && var_4c1fc889585f5df5[j] != var_4c1fc889585f5df5[p] && var_e767d0cb155a0e85[p].playsmokesound == 1) {
                var_e767d0cb155a0e85[j].playsmokesound = 0;
                break;
            }
        }
        var_e767d0cb155a0e85[j] childthread function_1ebb9b9e63a4df54(var_4c1fc889585f5df5[j], var_ede169ee001cb3cf);
    }
    namespace_aad14af462a74d08::function_d997435895422ecc("super_smoke_airdrop", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
}

// Namespace namespace_db64b978d03226b/namespace_71c9e937b8c408a1
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb71
// Size: 0x149
function function_495ebe31c275c3c5(var_265ac1f6b1f28744, var_ec85ed3e96dae633, var_ecb39c9eecbd70ad, index) {
    bundle = namespace_4a3033eafa6fd07::function_bf9c7e9dd30180e3("super_smoke_airdrop");
    var_1e829ee170ce2414 = spawn("script_model", var_265ac1f6b1f28744 + anglestoup(var_ec85ed3e96dae633) * var_ecb39c9eecbd70ad);
    var_1e829ee170ce2414 setmodel(bundle.var_a42506617ec25a81);
    var_1e829ee170ce2414.owner = self;
    var_1e829ee170ce2414.angles = var_ec85ed3e96dae633;
    var_1e829ee170ce2414.playsmokesound = 1;
    var_1e829ee170ce2414.index = index + 1;
    var_1e829ee170ce2414.animname = "super_smoke_airdrop";
    var_1e829ee170ce2414 namespace_bc4a4b9456315863::setanimtree();
    var_1e829ee170ce2414 setscriptablepartstate("smokeDeploy", "deployStart", 0);
    var_1e829ee170ce2414 namespace_b6b4a3ac458ab6e2::function_172d848d58051fdf(&function_1d7362315a15c932);
    var_1e829ee170ce2414 namespace_5a51aa78ea0b1b9f::set_start_emp_callback(&function_14e878fafff171e9);
    var_1e829ee170ce2414 function_5226227bce83ebe9(3, var_1e829ee170ce2414.owner.team);
    function_6ae953c4b9e1cd89(var_1e829ee170ce2414);
    if (getdvarint(@"hash_819d904fd33aad", bundle.var_3718be0adde01a9d)) {
        var_1e829ee170ce2414 thread namespace_3e725f3cc58bddd3::monitordamage(bundle.var_f823fa9135f1f5a2, "hitequip", &function_7a3c1b282cbfd3ab);
    }
    return var_1e829ee170ce2414;
}

// Namespace namespace_db64b978d03226b/namespace_71c9e937b8c408a1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc2
// Size: 0xba
function function_1d7362315a15c932(data) {
    attacker = data.attacker;
    if (!isdefined(attacker)) {
        return;
    }
    self dodamage(self.maxhealth / 10, self.origin, attacker, data.inflictor);
    if (isdefined(self.damagetaken) && self.damagetaken >= 100) {
        if (!isdefined(self.owner) || namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker)) {
            attacker notify("destroyed_equipment");
            attacker thread namespace_48a08c5037514e04::doscoreevent(#"destroyed_equipment");
            attacker namespace_25c5a6f43bb97b43::equipmentdestroyed(self);
        }
        function_7a3c1b282cbfd3ab(data);
    }
}

// Namespace namespace_db64b978d03226b/namespace_71c9e937b8c408a1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd83
// Size: 0x88
function function_14e878fafff171e9(data) {
    attacker = data.attacker;
    if (!isdefined(attacker)) {
        return;
    }
    if (!isdefined(self.owner) || namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker) || getdvarint(@"hash_58254c61de76bffe", 0)) {
        attacker notify("destroyed_equipment");
        attacker thread namespace_48a08c5037514e04::doscoreevent(#"hash_6408c284f316c1d9");
        attacker namespace_25c5a6f43bb97b43::equipmentdestroyed(self);
    }
    function_7a3c1b282cbfd3ab(data);
}

// Namespace namespace_db64b978d03226b/namespace_71c9e937b8c408a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe12
// Size: 0x65
function function_799d835745d0b892() {
    if (self.index == 1) {
        return 4.3;
    } else if (self.index == 2) {
        return 5.5;
    } else if (self.index == 3) {
        return 5.5;
    } else if (self.index == 4) {
        return 4.8;
    }
    return 0;
}

// Namespace namespace_db64b978d03226b/namespace_71c9e937b8c408a1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe7f
// Size: 0x48
function function_3f0235f3c067371d(drone) {
    level endon("game_ended");
    drone endon("death");
    var_65dc1767352c19cd = "activate_drone_" + drone.index;
    namespace_bc4a4b9456315863::anim_single_solo(drone, var_65dc1767352c19cd);
    drone thread function_9353aa49397987c8();
}

// Namespace namespace_db64b978d03226b/namespace_71c9e937b8c408a1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xece
// Size: 0x202
function function_1ebb9b9e63a4df54(point, var_ede169ee001cb3cf) {
    self endon("death");
    var_83c576c6df21df13 = self.origin;
    var_e99b8e5a3e9c2979 = getdvarfloat(@"hash_96d7e827843e457", 3);
    offset = getdvarfloat(@"hash_320be90fa91ee74b", 1.5);
    deploytime = function_799d835745d0b892();
    var_c6e1701a6e24d511 = point + anglestoup(self.angles) * 350;
    var_7622a5ad898bdbd1 = vectortoangles(var_ede169ee001cb3cf);
    var_2937b8a737595e2a = spawnstruct();
    var_2937b8a737595e2a.origin = var_c6e1701a6e24d511;
    var_2937b8a737595e2a.angles = var_7622a5ad898bdbd1;
    var_2937b8a737595e2a thread function_3f0235f3c067371d(self);
    if (self.var_70cb65f6b1d7d192) {
        self playsound("iw9_smoke_airdrop_center_incoming");
    } else {
        self playsound("iw9_smoke_airdrop_travel_incoming");
    }
    wait(deploytime);
    self setscriptablepartstate("smokeDeploy", "settle", 0);
    if (getdvarint(@"hash_abe45e35ef030a56") == 1) {
        if (getdvarint(@"hash_39c3947a2e4f5f9e", 0)) {
            thread namespace_6205bc7c5e394598::function_f8903387ea945165(point, 3);
        } else {
            function_8a09c0e5fa78a48c(point, 18, 300, 250);
        }
    } else {
        thread namespace_e4a5fcd525f0b19b::create_smoke_occluder(point, 18);
    }
    if (self.index == 1) {
        self.owner thread namespace_48a08c5037514e04::doscoreevent(#"super_smoke_airdrop");
    }
    self playsound("iw9_smoke_airdrop_release");
    if (self.playsmokesound) {
        thread function_1f3e2f430f67a00b(23, self.origin - (0, 0, 100));
    }
    if (self.var_70cb65f6b1d7d192) {
        self playsound("iw9_smoke_airdrop_center_outgoing");
    } else {
        self playsound("iw9_smoke_airdrop_travel_outgoing");
    }
}

// Namespace namespace_db64b978d03226b/namespace_71c9e937b8c408a1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10d7
// Size: 0x7b
function function_1f3e2f430f67a00b(var_4feffeb82828cfd3, position) {
    var_4cf58793cc4f1ad6 = spawn("script_origin", position);
    var_4cf58793cc4f1ad6 playsound("iw9_smoke_airdrop_smoke_start");
    var_4cf58793cc4f1ad6 playloopsound("iw9_smoke_airdrop_smoke_lp");
    var_4cf58793cc4f1ad6 namespace_2a9588dfac284b77::registerspawncount(1);
    wait(var_4feffeb82828cfd3 - 3);
    thread play_sound_in_space("iw9_smoke_airdrop_smoke_tail", position);
    wait(0.3);
    var_4cf58793cc4f1ad6 namespace_2a9588dfac284b77::deregisterspawn();
    var_4cf58793cc4f1ad6 stoploopsound();
    var_4cf58793cc4f1ad6 delete();
}

// Namespace namespace_db64b978d03226b/namespace_71c9e937b8c408a1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1159
// Size: 0x5b
function function_9353aa49397987c8(data) {
    level endon("game_ended");
    if (istrue(self.isdestroyed)) {
        return;
    }
    self.isdestroyed = 1;
    self notify("death");
    self setscriptablepartstate("smokeDeploy", "deployEnd", 0);
    wait(0.35);
    function_d0326bad3508b303(self);
    self delete();
}

// Namespace namespace_db64b978d03226b/namespace_71c9e937b8c408a1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11bb
// Size: 0x26
function function_7a3c1b282cbfd3ab(data) {
    self setscriptablepartstate("destroy", "on", 0);
    function_9353aa49397987c8(data);
}

// Namespace namespace_db64b978d03226b/namespace_71c9e937b8c408a1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11e8
// Size: 0x1e
function function_6ae953c4b9e1cd89(drone) {
    level.var_92e2c130a8ea2b6c[drone getentitynumber()] = drone;
}

// Namespace namespace_db64b978d03226b/namespace_71c9e937b8c408a1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x120d
// Size: 0x1c
function function_d0326bad3508b303(drone) {
    level.var_92e2c130a8ea2b6c[drone getentitynumber()] = undefined;
}

