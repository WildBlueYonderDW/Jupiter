// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\math.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\common\anim.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\cp_mp\hostmigration.gsc;

#namespace namespace_be7e08635722cc83;

// Namespace namespace_be7e08635722cc83/namespace_b1af0fcaf4ad16d6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34b
// Size: 0x67
function function_3e3a73f1039ca16d() {
    level.scr_anim["cargo_delivery_extract"]["heli_in"] = mp_vehicles_always_loaded%iw9_dmz_cargo_heli_in;
    level.scr_anim["cargo_delivery_extract"]["heli_loop"] = mp_vehicles_always_loaded%iw9_dmz_cargo_heli_loop;
    level.scr_anim["cargo_delivery_extract"]["heli_out"] = mp_vehicles_always_loaded%iw9_dmz_cargo_heli_out;
    function_885b229aee63b402();
}

// Namespace namespace_be7e08635722cc83/namespace_b1af0fcaf4ad16d6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b9
// Size: 0xcf
function function_885b229aee63b402() {
    level.scr_animtree["cargo_delivery_extract_props"] = %script_model;
    level.scr_anim["cargo_delivery_extract_props"]["rope_in"] = script_model%iw9_dmz_cargo_heli_rope_in;
    level.scr_anim["cargo_delivery_extract_props"]["rope_loop"] = script_model%iw9_dmz_cargo_heli_rope_loop;
    level.scr_anim["cargo_delivery_extract_props"]["rope_out"] = script_model%iw9_dmz_cargo_heli_rope_out;
    level.scr_anim["cargo_delivery_extract_props"]["hook_in"] = script_model%iw9_dmz_cargo_heli_hook_in;
    level.scr_anim["cargo_delivery_extract_props"]["hook_loop"] = script_model%iw9_dmz_cargo_heli_hook_loop;
    level.scr_anim["cargo_delivery_extract_props"]["hook_out"] = script_model%iw9_dmz_cargo_heli_hook_out;
}

// Namespace namespace_be7e08635722cc83/namespace_b1af0fcaf4ad16d6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48f
// Size: 0x3a1
function function_5a081e065a93bd08(var_b4ef83e4ca39c8ec, offset, var_367433161de52ca2) {
    extractgroundpos = getgroundposition(var_b4ef83e4ca39c8ec, 1) + offset;
    var_db4adba9675a31aa = extractgroundpos + (0, 0, 4000);
    var_cc089176a2d8ab71 = extractgroundpos + (0, 0, 8000);
    var_7ce2ef2a1efe71a6 = extractgroundpos + (0, 0, 850);
    flightyaw = 0;
    var_fda870b32ab92c1f = (0, 0, 0);
    flightyaw = function_b89378e2e51cf825(var_cc089176a2d8ab71, var_db4adba9675a31aa);
    var_fda870b32ab92c1f = (0, flightyaw, 0);
    var_16cedb94faf4d596 = var_cc089176a2d8ab71 - anglestoforward(var_fda870b32ab92c1f) * 20000;
    var_87cef10bf5729579 = 1;
    var_1d4278103ba47a16 = vectortoangles(var_db4adba9675a31aa * (1, 1, 0) - var_16cedb94faf4d596 * (1, 1, 0));
    spawndata = spawnstruct();
    spawndata.origin = var_16cedb94faf4d596;
    spawndata.angles = var_1d4278103ba47a16;
    if (istrue(var_367433161de52ca2)) {
        heli = vehicle_spawn("veh_jup_blima", spawndata);
    } else {
        heli = vehicle_spawn("veh9_blima", spawndata);
    }
    if (!isdefined(heli)) {
        return;
    }
    namespace_141c4634b6ea7b27::vehicle_interact_makeunusable(heli);
    heli function_247ad6a91f6a4ffe(1);
    heli vehphys_forcekeyframedmotion();
    heli.speed = 100;
    heli.accel = 125;
    heli.health = 999999;
    heli.maxhealth = heli.health;
    heli.lifeid = 0;
    heli.flaresreservecount = var_87cef10bf5729579;
    heli.enterpos = var_16cedb94faf4d596;
    heli.descendpos = var_db4adba9675a31aa;
    heli.hoverpos = var_7ce2ef2a1efe71a6;
    heli.extractgroundpos = extractgroundpos;
    heli.sceneangles = var_1d4278103ba47a16;
    heli.animname = "cargo_delivery_extract";
    heli namespace_5a0f3ca265d3a4c8::vehicle_damage_setcandamage(0);
    heli setmaxpitchroll(10, 25);
    heli vehicle_setspeed(heli.speed, heli.accel);
    heli sethoverparams(1, 1, 1);
    heli setturningability(0.05);
    heli setyawspeed(45, 25, 25, 0.5);
    if (isent(self)) {
        if (isdefined(self.team)) {
            heli.team = self.team;
        }
        heli.owner = self;
        heli setotherent(self);
    }
    heli setscriptablepartstate("engine", "on");
    heli setscriptablepartstate("running_lights", "on");
    heli setscriptablepartstate("infil_lights", "on");
    heli.scenenode = spawn("script_model", var_b4ef83e4ca39c8ec + (0, 0, -15) + offset);
    heli.scenenode.angles = heli.sceneangles;
    heli.scenenode setmodel("tag_origin");
    heli.scenenode namespace_bc4a4b9456315863::anim_first_frame_solo(heli, "heli_in");
    level.var_f3b18a363ae14d7a = heli;
    function_542344d67fb5ee7a(heli);
    heli thread function_b525fa38baf87839(var_b4ef83e4ca39c8ec + offset);
    return heli;
}

// Namespace namespace_be7e08635722cc83/namespace_b1af0fcaf4ad16d6
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x838
// Size: 0x144
function private function_542344d67fb5ee7a(heli) {
    rope = spawn("script_model", (0, 0, 0));
    rope setmodel("misc_rapelling_rope_01_fiber_br");
    rope linkto(heli, "origin_animate_jnt", (0, 0, 0), (0, 0, 0));
    rope notsolid();
    rope show();
    rope.animname = "cargo_delivery_extract_props";
    rope namespace_bc4a4b9456315863::setanimtree();
    heli namespace_bc4a4b9456315863::anim_first_frame_solo(rope, "rope_in", "origin_animate_jnt");
    crate = spawn("script_model", (0, 0, 0));
    crate setmodel("construction_lattice_boom_crane_01_hook");
    crate linkto(heli, "origin_animate_jnt", (0, 0, 0), (0, 0, 0));
    crate notsolid();
    crate show();
    crate.animname = "cargo_delivery_extract_props";
    crate namespace_bc4a4b9456315863::setanimtree();
    heli namespace_bc4a4b9456315863::anim_first_frame_solo(crate, "hook_in", "origin_animate_jnt");
    heli.rope = rope;
    heli.crate = crate;
}

// Namespace namespace_be7e08635722cc83/namespace_b1af0fcaf4ad16d6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x983
// Size: 0x92
function function_8a0f37ea918fa970(var_c45865d4c48493c1, var_88125f10d2b34aa3, var_b2bdd90249635576) {
    var_3d0ec1c05f1e1001 = var_c45865d4c48493c1 * 1.57828e-05;
    a = 0.5 * var_b2bdd90249635576;
    b = var_88125f10d2b34aa3;
    c = -1 * var_3d0ec1c05f1e1001;
    flytime = (-1 * b + sqrt(b * b - 4 * a * c)) / 2 * a;
    flytime = flytime * 3600;
    flytime = flytime + 1.5;
    return flytime;
}

// Namespace namespace_be7e08635722cc83/namespace_b1af0fcaf4ad16d6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa1d
// Size: 0x4f
function function_63e41ce3a6457cc1(var_625180ce8d2f8f77) {
    var_5301ebed8d610fdb = function_8a0f37ea918fa970(20000, 100, 125);
    var_eb0fae3483a10d88 = function_8a0f37ea918fa970(var_625180ce8d2f8f77, 25, 31.25);
    totaltime = var_5301ebed8d610fdb + var_eb0fae3483a10d88;
    return totaltime;
}

// Namespace namespace_be7e08635722cc83/namespace_b1af0fcaf4ad16d6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa74
// Size: 0xad
function function_b525fa38baf87839(var_3d5095c68e5c2b99) {
    self endon("death");
    self endon("leaving");
    groundz = self.extractgroundpos[2];
    var_625180ce8d2f8f77 = self.descendpos[2] - groundz;
    self.flytime = function_63e41ce3a6457cc1(var_625180ce8d2f8f77);
    thread function_f5d7c70a275e3c17();
    self.preventleave = 1;
    function_e3a16387941bbbc8();
    self.preventleave = undefined;
    self setscriptablepartstate("vector_field", "on");
    if (istrue(level.gameended)) {
        thread function_acd83be80ff2e711();
        return;
    }
    thread function_acd83be80ff2e711();
}

// Namespace namespace_be7e08635722cc83/namespace_b1af0fcaf4ad16d6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb28
// Size: 0xf8
function function_b89378e2e51cf825(var_e58119f7c6eb5b4d, var_d3970a3e6c77212e) {
    var_3fb4a86293ed25a6 = 10;
    contents = create_contents(0, 1, 1, 1, 1, 0, 1, 1, 0);
    var_3674d96c61e2dd0d = 0;
    yaw = 0;
    while (yaw < 360) {
        var_3674d96c61e2dd0d = var_3674d96c61e2dd0d + yaw;
        testangles = (0, var_3674d96c61e2dd0d, 0);
        var_29006f80487a7787 = var_e58119f7c6eb5b4d - anglestoforward(testangles) * 20000;
        var_dd77d0a6d708ac18 = var_d3970a3e6c77212e;
        var_d4eb961f60968a16 = sphere_trace(var_29006f80487a7787, var_dd77d0a6d708ac18, 100, undefined, contents, 1);
        if (var_d4eb961f60968a16["fraction"] == 1) {
            /#
                line(var_29006f80487a7787, var_dd77d0a6d708ac18, (0, 1, 0), 1, 0, 2000);
            #/
            return var_3674d96c61e2dd0d;
        }
        /#
        #/
        if (yaw % 3 == 0) {
            waitframe();
        }
        yaw = yaw + var_3fb4a86293ed25a6;
    }
    return var_3674d96c61e2dd0d;
}

// Namespace namespace_be7e08635722cc83/namespace_b1af0fcaf4ad16d6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc28
// Size: 0x57
function function_4bba7bf68035a122() {
    if (isdefined(self.rope)) {
        self.rope delete();
    }
    if (isdefined(self.crate)) {
        self.crate delete();
    }
    if (isdefined(self.scenenode)) {
        self.scenenode delete();
    }
}

// Namespace namespace_be7e08635722cc83/namespace_b1af0fcaf4ad16d6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc86
// Size: 0x12
function function_4b7dd160447d4825() {
    function_4bba7bf68035a122();
    namespace_f64231d5b7a2c3c4::_deletevehicle(self);
}

// Namespace namespace_be7e08635722cc83/namespace_b1af0fcaf4ad16d6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9f
// Size: 0xf2
function function_acd83be80ff2e711() {
    if (istrue(self.tryingtoleave) || istrue(self.leaving)) {
        return;
    }
    self endon("death");
    self notify("try_to_leave");
    self.tryingtoleave = 1;
    self waittill("ready_to_leave");
    self notify("leaving");
    self.leaving = 1;
    self.tryingtoleave = undefined;
    var_dbee990416f1879a = getanimlength(level.scr_anim[self.animname]["heli_out"]);
    self.scenenode thread namespace_bc4a4b9456315863::anim_single_solo(self, "heli_out");
    thread namespace_bc4a4b9456315863::anim_single_solo(self.rope, "rope_out", "origin_animate_jnt");
    thread namespace_bc4a4b9456315863::anim_single_solo(self.crate, "hook_out", "origin_animate_jnt");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_dbee990416f1879a);
    self stoploopsound();
    self notify("heli_gone");
    function_4b7dd160447d4825();
}

// Namespace namespace_be7e08635722cc83/namespace_b1af0fcaf4ad16d6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd98
// Size: 0xa0
function function_e3a16387941bbbc8() {
    self endon("death");
    var_228083b1cc503599 = getanimlength(level.scr_anim[self.animname]["heli_in"]);
    self.scenenode thread namespace_bc4a4b9456315863::anim_single_solo(self, "heli_in");
    thread namespace_bc4a4b9456315863::anim_single_solo(self.rope, "rope_in", "origin_animate_jnt");
    thread namespace_bc4a4b9456315863::anim_single_solo(self.crate, "hook_in", "origin_animate_jnt");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_228083b1cc503599);
    thread function_f0f206969743ba63();
    thread function_92a59e0004116c97();
    thread function_106caebe9f0dd820();
}

// Namespace namespace_be7e08635722cc83/namespace_b1af0fcaf4ad16d6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3f
// Size: 0x89
function function_f0f206969743ba63() {
    self endon("death");
    self.scenenode endon("death");
    animtime = getanimlength(level.scr_anim[self.animname]["heli_loop"]);
    while (1) {
        self.scenenode thread namespace_bc4a4b9456315863::anim_single_solo(self, "heli_loop");
        wait(animtime);
        if (istrue(self.readytoleave) && !istrue(self.preventleave)) {
            self notify("ready_to_leave");
            break;
        }
    }
}

// Namespace namespace_be7e08635722cc83/namespace_b1af0fcaf4ad16d6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xecf
// Size: 0x72
function function_92a59e0004116c97() {
    self endon("death");
    animtime = getanimlength(level.scr_anim[self.rope.animname]["rope_loop"]);
    while (1) {
        thread namespace_bc4a4b9456315863::anim_single_solo(self.rope, "rope_loop", "origin_animate_jnt");
        wait(animtime);
        if (istrue(self.readytoleave)) {
            break;
        }
    }
}

// Namespace namespace_be7e08635722cc83/namespace_b1af0fcaf4ad16d6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf48
// Size: 0x72
function function_106caebe9f0dd820() {
    self endon("death");
    animtime = getanimlength(level.scr_anim[self.crate.animname]["hook_loop"]);
    while (1) {
        thread namespace_bc4a4b9456315863::anim_single_solo(self.crate, "hook_loop", "origin_animate_jnt");
        wait(animtime);
        if (istrue(self.readytoleave)) {
            break;
        }
    }
}

// Namespace namespace_be7e08635722cc83/namespace_b1af0fcaf4ad16d6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc1
// Size: 0x21
function function_f5d7c70a275e3c17() {
    self endon("death");
    self endon("try_to_leave");
    level waittill("game_ended");
    thread function_acd83be80ff2e711();
}

