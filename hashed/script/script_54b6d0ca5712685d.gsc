#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\anim.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\game.gsc;
#using script_6e3db491c970b3a;
#using script_422ba34057947a06;
#using script_36e4a3d00dda972c;
#using script_7ca048e8d55705bc;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;

#namespace namespace_cc6c150573ea8ff3;

// Namespace namespace_cc6c150573ea8ff3 / namespace_6c58f90216a71281
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a3
// Size: 0xc0
function main() {
    namespace_a23d4b3ae436bc36::main();
    namespace_6fa6cc1ce1c2ccc4::main();
    namespace_26815fd94e19c1d2::main();
    namespace_ac70533ae544eff4::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_waterfront");
    setdvar(@"r_umbraMinObjectContribution", 8);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    level thread function_1682cf22619a5e55();
    while (true) {
        level thread function_1e575c6c1a602ca2();
        level thread function_93ccf1601bcde22d();
        wait 15;
        level thread function_ec71e0ae9a43c755();
        wait 30;
    }
}

// Namespace namespace_cc6c150573ea8ff3 / namespace_6c58f90216a71281
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36b
// Size: 0x95
function function_93ccf1601bcde22d() {
    var_573498b6d349be06 = getstructarray("bus_start", "script_noteworthy");
    foreach (var_25c4448fdb8fcb80 in var_573498b6d349be06) {
        var_872fe47787e8589a = spawn_model("veh8_civ_lnd_buniform_uk_static_closed", var_25c4448fdb8fcb80.origin, var_25c4448fdb8fcb80.angles);
        var_25c4448fdb8fcb80 thread function_7696438520baea79(var_872fe47787e8589a);
    }
}

// Namespace namespace_cc6c150573ea8ff3 / namespace_6c58f90216a71281
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x408
// Size: 0x121
function function_1e575c6c1a602ca2() {
    var_573498b6d349be06 = getstructarray("car_start", "script_noteworthy");
    foreach (var_25c4448fdb8fcb80 in var_573498b6d349be06) {
        var_bc22b8fed0d6d1fe = randomint(3);
        if (var_bc22b8fed0d6d1fe == 0) {
            var_872fe47787e8589a = spawn_model("veh8_civ_lnd_buniform_uk_static_closed", var_25c4448fdb8fcb80.origin, var_25c4448fdb8fcb80.angles);
            thread namespace_ac70533ae544eff4::function_3befcbe893e66878(var_872fe47787e8589a);
        } else if (var_bc22b8fed0d6d1fe == 1) {
            var_872fe47787e8589a = spawn_model("veh9_civ_lnd_van_palfa_static", var_25c4448fdb8fcb80.origin, var_25c4448fdb8fcb80.angles);
            thread namespace_ac70533ae544eff4::function_aef01500296afdf7(var_872fe47787e8589a);
        } else if (var_bc22b8fed0d6d1fe == 2) {
            var_872fe47787e8589a = spawn_model("jup_surge_veh8_civ_lnd_victor40", var_25c4448fdb8fcb80.origin, var_25c4448fdb8fcb80.angles);
            thread namespace_ac70533ae544eff4::function_2b4aaee7bdcaf838(var_872fe47787e8589a);
        }
        var_25c4448fdb8fcb80 thread function_7696438520baea79(var_872fe47787e8589a);
    }
}

// Namespace namespace_cc6c150573ea8ff3 / namespace_6c58f90216a71281
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x531
// Size: 0xb8
function function_ec71e0ae9a43c755() {
    var_43d4efeadf93a39e = getstructarray("train_start", "script_noteworthy");
    foreach (var_2d32422f90ea0d48 in var_43d4efeadf93a39e) {
        trainmodel = spawn_model("jup_machinery_london_train_carriage_01", var_2d32422f90ea0d48.origin, var_2d32422f90ea0d48.angles);
        var_2d32422f90ea0d48 thread function_7696438520baea79(trainmodel);
        if (isdefined(var_2d32422f90ea0d48.script_parameters)) {
            thread namespace_ac70533ae544eff4::function_42c043cc7fa69f50(trainmodel, var_2d32422f90ea0d48.script_parameters);
        }
    }
}

// Namespace namespace_cc6c150573ea8ff3 / namespace_6c58f90216a71281
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5f1
// Size: 0x9e
function function_7696438520baea79(vehmodel) {
    targetpoint = getstruct(self.target, "targetname");
    currentpoint = self;
    while (isdefined(targetpoint)) {
        var_7a7468a3f3fd54b = distance(currentpoint.origin, targetpoint.origin);
        var_4187040fa98742ee = var_7a7468a3f3fd54b / 400;
        thread function_bd3aa5ee59da5a59(vehmodel, targetpoint.origin, targetpoint.angles, var_4187040fa98742ee);
        wait var_4187040fa98742ee;
        vehmodel delete();
        break;
    }
}

// Namespace namespace_cc6c150573ea8ff3 / namespace_6c58f90216a71281
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x697
// Size: 0x39
function function_bd3aa5ee59da5a59(vehmodel, targetorigin, targetangle, var_4187040fa98742ee) {
    vehmodel moveto(targetorigin, var_4187040fa98742ee);
    vehmodel rotateto(targetangle, 0.1);
}

// Namespace namespace_cc6c150573ea8ff3 / namespace_6c58f90216a71281
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6d8
// Size: 0x40
function function_1682cf22619a5e55() {
    level waittill("infil_setup_complete");
    var_6120df12544987e8 = getent("static_infil_van", "targetname");
    if (gameflag("infil_will_run") && isdefined(var_6120df12544987e8)) {
        var_6120df12544987e8 hide();
    }
}

