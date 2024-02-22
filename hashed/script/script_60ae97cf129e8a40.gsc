// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\gametypes\br_ai_encounters.gsc;
#using scripts\mp\gametypes\br_maphints.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_4a0d1f5f6be0f8c7;
#using script_4ff6c6ed304e05bb;
#using scripts\mp\gametypes\br_c130.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\gametypes\br.gsc;

#namespace namespace_79e590f683734378;

// Namespace namespace_79e590f683734378/namespace_33063826a342704e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x102
// Size: 0xf3
function function_733b23bb49feb5c3() {
    level thread namespace_33ca1c63d4300adc::init();
    level thread namespace_ebc037f6b65487ff::init();
    /#
        println("<unknown string>");
    #/
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        function_a94c90dc6c858da4();
        if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
            spawnorigin = (603, 2705, 1306);
            if (isdefined(level.var_5b908ce3cca6a715.var_f1ad02bc8d519e7b)) {
                spawnorigin = level.var_5b908ce3cca6a715.var_f1ad02bc8d519e7b;
            }
            var_9f4a3632d9f75d32 = (-15604, 6617, -1000);
            if (isdefined(level.var_5b908ce3cca6a715.var_c51425c87647226b)) {
                var_9f4a3632d9f75d32 = level.var_5b908ce3cca6a715.var_c51425c87647226b;
            }
            spawnangle = (0, 60, 0);
            namespace_bd131dfa920d03b9::function_7e904ff184e6794c(var_9f4a3632d9f75d32, undefined, undefined, spawnorigin, spawnangle);
        }
        function_eb7f544259415a09("mp_escape3");
    }
}

// Namespace namespace_79e590f683734378/namespace_33063826a342704e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fc
// Size: 0xfa8
function function_a94c90dc6c858da4() {
    namespace_eb1b5a598c9a5b07::init();
    level.br_level = spawnstruct();
    level.br_level.br_corners = [];
    level.br_level.br_corners[0] = (5800, -12000, 200);
    level.br_level.br_corners[1] = (-7000, 14000, 200);
    var_45accff1681e0276 = 6000;
    if (getgametype() == "arm" || getgametype() == "conflict") {
        var_45accff1681e0276 = 8000;
    } else if (namespace_36f464722d326bbe::isbrstylegametype()) {
        var_b83c1c9cb27cc9d7 = -1;
        brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
        if (brgametype == "dmz" || brgametype == "plunder") {
            var_b83c1c9cb27cc9d7 = getdvarint(@"hash_e432209cc5fbc970", 18000);
        } else {
            var_b83c1c9cb27cc9d7 = getdvarint(@"hash_e432209cc5fbc970", -1);
        }
        if (var_b83c1c9cb27cc9d7 != -1) {
            var_45accff1681e0276 = var_b83c1c9cb27cc9d7;
        }
    }
    namespace_ad389306d44fc6b4::setc130heightoverrides(var_45accff1681e0276, 65);
    level.br_level.c130_speedoverride = 2000;
    minx = min(level.br_level.br_corners[0][0], level.br_level.br_corners[1][0]);
    maxx = max(level.br_level.br_corners[0][0], level.br_level.br_corners[1][0]);
    miny = min(level.br_level.br_corners[1][1], level.br_level.br_corners[0][1]);
    maxy = max(level.br_level.br_corners[1][1], level.br_level.br_corners[0][1]);
    level.br_level.br_mapboundsfull = [];
    level.br_level.br_mapboundsfull[0] = (maxx, maxy, 0);
    level.br_level.br_mapboundsfull[1] = (minx, miny, 0);
    minx = level.br_level.br_corners[0][0] * 0.8;
    maxx = level.br_level.br_corners[1][0] * 0.8;
    miny = level.br_level.br_corners[1][0] * 0.8;
    maxy = level.br_level.br_corners[1][1] * 0.8;
    level.br_level.br_mapbounds = [];
    level.br_level.br_mapbounds[0] = (maxx, maxy, 0);
    level.br_level.br_mapbounds[1] = (minx, miny, 0);
    level.br_level.br_mapcenter = ((minx + maxx) / 2, (miny + maxy) / 2, 0);
    level.br_level.br_mapsize = (abs(maxx - minx), abs(maxy - miny), abs(level.br_level.c130_heightoverride - level.br_level.c130_sealeveloverride));
    if (getdvarint(@"hash_ffce528e382df177", 0)) {
        level.br_level.br_circleclosetimes = [0:360, 1:270, 2:225, 3:135, 4:90, 5:60, 6:45, 7:90];
        level.br_level.br_circledelaytimes = [0:60, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0];
        level.br_level.br_circleshowdelaydanger = [0:60, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0];
    } else if (getdvarint(@"hash_cf84a5d55b19b30e", 0)) {
        level.br_level.br_circleclosetimes = [0:270, 1:150, 2:120, 3:90, 4:60, 5:45, 6:45, 7:90];
        level.br_level.br_circledelaytimes = [0:60, 1:10, 2:10, 3:10, 4:10, 5:10, 6:10, 7:0];
        level.br_level.br_circleshowdelaydanger = [0:60, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0];
    } else if (getsubgametype() == "mini" || getsubgametype() == "mini_mgl") {
        level.br_level.br_circleclosetimes = [0:1, 1:200, 2:130, 3:90, 4:50, 5:100];
        level.br_level.br_circledelaytimes = [0:1, 1:120, 2:75, 3:60, 4:45, 5:0];
        level.br_level.br_circleshowdelaydanger = [0:1, 1:0, 2:0, 3:0, 4:0, 5:0];
    } else if (getsubgametype() == "rebirth") {
        level.br_level.br_circleclosetimes = [0:90, 1:45, 2:45, 3:45, 4:105];
        level.br_level.br_circledelaytimes = [0:120, 1:90, 2:60, 3:60, 4:0];
        level.br_level.br_circleshowdelaydanger = [0:120, 1:0, 2:0, 3:0, 4:0];
    } else if (getsubgametype() == "vanilla") {
        level.br_level.br_circleclosetimes = [0:90, 1:60, 2:60, 3:30, 4:100];
        level.br_level.br_circledelaytimes = [0:75, 1:60, 2:60, 3:60, 4:30];
        level.br_level.br_circleshowdelaydanger = [0:75, 1:0, 2:0, 3:0, 4:0];
    } else {
        level.br_level.br_circleclosetimes = [0:135, 1:110, 2:85, 3:55, 4:35, 5:25, 6:25, 7:50];
        level.br_level.br_circledelaytimes = [0:110, 1:45, 2:37, 3:30, 4:30, 5:22, 6:15, 7:0];
        level.br_level.br_circleshowdelaydanger = [0:20, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0];
    }
    if (getsubgametype() == "mini" || getsubgametype() == "mini_mgl") {
        level.br_level.br_circleshowdelaysafe = [0:0, 1:0, 2:0, 3:0, 4:0, 5:0];
        level.br_level.br_circleminimapradii = [0:10500, 1:10500, 2:10500, 3:9000, 4:8000, 5:5500];
        var_5068e43680808e5b = getdvarint(@"hash_e84ce12f7a01a55a", 0);
        if (var_5068e43680808e5b == 1) {
            level.br_level.br_circleradii = [0:75000, 1:45000, 2:20000, 3:7000, 4:3500, 5:1500, 6:0];
        } else {
            level.br_level.br_circleradii = [0:60000, 1:30000, 2:15000, 3:7000, 4:3500, 5:1500, 6:0];
        }
    } else if (getsubgametype() == "rebirth") {
        level.br_level.br_circleshowdelaysafe = [0:0, 1:0, 2:0, 3:0, 4:0];
        level.br_level.br_circleminimapradii = [0:10500, 1:10500, 2:10500, 3:9000, 4:5500];
        level.br_level.br_circleradii = [0:12000, 1:10000, 2:8000, 3:5000, 4:1500, 5:0];
    } else if (getsubgametype() == "vanilla") {
        level.br_level.br_circleshowdelaysafe = [0:0, 1:0, 2:0, 3:0, 4:0];
        level.br_level.br_circleminimapradii = [0:7500, 1:6500, 2:5500, 3:5000, 4:4500];
        level.br_level.br_circleradii = [0:16000, 1:11000, 2:7500, 3:4000, 4:1500, 5:0];
    } else {
        level.br_level.br_circleshowdelaysafe = [0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0];
        level.br_level.br_circleminimapradii = [0:10500, 1:10500, 2:10500, 3:10500, 4:10500, 5:9000, 6:8000, 7:5500];
        level.br_level.br_circleradii = [0:9600, 1:5300, 2:2500, 3:1200, 4:800, 5:500, 6:200, 7:50, 8:0];
    }
    if (isdefined(level.br_circle_init_func)) {
        [[ level.br_circle_init_func ]]();
    }
    namespace_c5622898120e827f::applycirclesettings();
    level.br_prematchspawnlocations = [0:namespace_d20f8ef223912e12::createspawnlocation((-1261, -10218.5, 519.66), 0, 500), 1:namespace_d20f8ef223912e12::createspawnlocation((301.573, -6134.04, 692.001), 0, 500), 2:namespace_d20f8ef223912e12::createspawnlocation((-3932.99, -2860.85, 622.534), 0, 500), 3:namespace_d20f8ef223912e12::createspawnlocation((3565.82, -6494.82, 497.727), 0, 500), 4:namespace_d20f8ef223912e12::createspawnlocation((2784.2, -1387.21, 839.998), 0, 500)];
    level.br_badcircleareas = [0:namespace_c5622898120e827f::createinvalidcirclearea((-18691, 12376, 200), 15000), 1:namespace_c5622898120e827f::createinvalidcirclearea((-19459, -12712, 200), 15000), 2:namespace_c5622898120e827f::createinvalidcirclearea((19261, -12712, 200), 15000), 3:namespace_c5622898120e827f::createinvalidcirclearea((18493, 12376, 200), 15000), 4:namespace_c5622898120e827f::createinvalidcirclearea((-707, 20888, 200), 8000), 5:namespace_c5622898120e827f::createinvalidcirclearea((-707, -22632, 200), 8000), 6:namespace_c5622898120e827f::createinvalidcirclearea((5255, -15805, 200), 4500), 7:namespace_c5622898120e827f::createinvalidcirclearea((8323, -9836, 200), 4500), 8:namespace_c5622898120e827f::createinvalidcirclearea((8642, 3052, 200), 4500), 9:namespace_c5622898120e827f::createinvalidcirclearea((7015, 9413, 200), 4500), 10:namespace_c5622898120e827f::createinvalidcirclearea((4349, 13144, 200), 4500), 11:namespace_c5622898120e827f::createinvalidcirclearea((-7087, 13998, 200), 4500), 12:namespace_c5622898120e827f::createinvalidcirclearea((-8292, 8684, 200), 4500), 13:namespace_c5622898120e827f::createinvalidcirclearea((-9920, 2816, 200), 4500), 14:namespace_c5622898120e827f::createinvalidcirclearea((-8292, 8684, 200), 4500), 15:namespace_c5622898120e827f::createinvalidcirclearea((-9088, -5312, 200), 4500), 16:namespace_c5622898120e827f::createinvalidcirclearea((-7424, -12800, 200), 4500), 17:namespace_c5622898120e827f::createinvalidcirclearea((-1600, -17344, 200), 4500), 18:namespace_c5622898120e827f::createinvalidcirclearea((9923, -2860, 200), 4500), 19:namespace_c5622898120e827f::createinvalidcirclearea((-1859, 16600, 200), 4500), 20:namespace_c5622898120e827f::createinvalidcirclearea((2388, -11256, 200), 2400), 21:namespace_c5622898120e827f::createinvalidcirclearea((-4140, -8184, 200), 2000), 22:namespace_c5622898120e827f::createinvalidcirclearea((-6085, 2857, 200), 1100), 23:namespace_c5622898120e827f::createinvalidcirclearea((-92, 12848, 200), 1100), 24:namespace_c5622898120e827f::createinvalidcirclearea((-4582, 10069, 200), 1100), 25:namespace_c5622898120e827f::createinvalidcirclearea((4957, 4374, 200), 1100), 26:namespace_c5622898120e827f::createinvalidcirclearea((4579, 6143, 200), 1100), 27:namespace_c5622898120e827f::createinvalidcirclearea((-6700, -824, 200), 1100), 28:namespace_c5622898120e827f::createinvalidcirclearea((-3820, -9656, 200), 1100), 29:namespace_c5622898120e827f::createinvalidcirclearea((1556, -13880, 200), 1100)];
    setdvar(@"hash_4aea002979a25696", 10);
}

