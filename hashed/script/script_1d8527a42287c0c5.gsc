// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_77c18cdedec620b3;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\utility\game.gsc;
#using script_58f20490049af6ac;
#using scripts\common\anim.gsc;
#using script_5def7af2a9f04234;
#using script_4c53d55a9c6ea4c2;
#using script_3736cbcffe5aaf3e;
#using script_39bf998c0c9f3c4;
#using scripts\mp\load.gsc;
#using scripts\common\create_script_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_4ff6c6ed304e05bb;
#using script_55bc5525a33f6acf;
#using script_48e346d60cda7a1f;
#using script_3b9cd620dfbf096b;
#using script_1fd613cd0dd414ab;
#using script_1c88d328faa3d14f;
#using script_5c7bb8a12ccbe71f;
#using script_386b1e00067e9ef3;
#using script_550d4afc42895693;
#using script_77cf57049c85d0df;
#using script_147448f3f080c636;
#using scripts\mp\compass.gsc;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using script_48814951e916af89;
#using script_5f903436642211af;
#using script_72af5a878a9d3397;
#using script_261f1b574c15eab1;
#using script_3a535b44f9ecc6df;
#using script_2d3fead1b9e1d7e5;
#using script_69a61780e1cc21a9;
#using script_49314540c657d352;
#using script_36967ce8ee2ea745;
#using script_66e0e331f9783820;
#using script_7abaa04d5f9fc22e;
#using script_1d1428a3b7b402b0;
#using script_248ec5040062d3ce;
#using script_2d4b9c58ed0e3d91;
#using script_38eb8f4be20d54f4;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\gametypes\br_c130.gsc;
#using scripts\cp_mp\parachute.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\gametypes\br.gsc;
#using script_4a0d1f5f6be0f8c7;

#namespace mp_jup_bigmap;

// Namespace mp_jup_bigmap/namespace_e109e6b1b4b14f49
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x546
// Size: 0x618
function main() {
    level thread namespace_37f0fb6355a4618a::function_c08668fe290fc31a();
    namespace_ca94ffbe7d5d87fe::main();
    namespace_5d1f902c9c718dc::main();
    namespace_55b161d83c1313ca::main();
    initvehicles();
    namespace_3ee2bb4833156856::main();
    namespace_a0229183a28ffd3::initialize_create_script();
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        namespace_eb1b5a598c9a5b07::init();
        level.outofboundstriggersplanetrace = getentarray("OutOfBounds", "targetname");
        level thread namespace_47431acb1419bed7::main();
        level thread namespace_a7074a12ed8cb3cf::main();
        level thread namespace_c05f1e879b7dd6a3::main();
        level thread namespace_1a1c54306fee9573::main();
        level thread namespace_a5edacb4e0415bcf::main();
        level thread namespace_2b5068fbec01a917::main();
        level thread namespace_1cf8ccfcb88ef3a3::main();
        level thread namespace_767ecc6f463d2d63::main();
        level thread namespace_ca4e5ac2a7fe2887::main();
        level.var_bbd8a18655d9495b = &namespace_2b520709cc9e7442::function_405bf7cde917b70e;
        level.var_f29702ddc09d1002 = &namespace_2b520709cc9e7442::function_384465a3a8aa24f7;
        level.var_ffa48a6a79a7224 = &namespace_2b520709cc9e7442::function_47c84e03dcbc5aa7;
    }
    if (!isdefined(level.outofboundstriggers)) {
        level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    }
    level.kill_border_triggers = getentarray("kill_border_trigger", "targetname");
    level.var_63a70ff2d38d8bee = getdvarint(@"hash_433fa7ca2836c6f1", 0);
    level.var_f0872e42daf6d4d5 = getclosestpointonnavmesh((554, 979, -5349));
    setdvar(@"hash_7686fcb92ccc5edb", 8);
    setdvar(@"hash_71fe8b216d50a24c", 1);
    setdvar(@"hash_402173c7dbee15d9", 4);
    setdvar(@"hash_656131a98e0d2c9d", 50);
    setdvar(@"hash_6a4705943fd574b8", 0.7);
    setdvar(@"hash_d0658156fb7f2311", 2);
    setdvar(@"hash_595f2292597ec0c7", (1, 0, 0));
    setdvar(@"hash_da8fd34f1f588a6b", 3000);
    setdvar(@"hash_f750bb7a6b8915f0", 1500);
    setdvar(@"hash_646ca256ecff2627", "-65504 -65504 0");
    setdvar(@"hash_a734a8dc8ef7627e", "131008 131008");
    setdvar(@"hash_23bb35bbc2d79a8", 3000);
    setdvar(@"hash_27fa9f4c8976e565", 10000);
    setdvar(@"hash_bf2f16bd0028f6e3", "0.90 0.80 0.55");
    setdvar(@"hash_33a035c99cb048b1", 5e-05);
    setdvar(@"hash_99863fd36f21e4", 0.15);
    setdvar(@"hash_43b1bfe24b9db3c5", 0.05);
    setdvar(@"hash_70640ce906e6d9c2", 0.05);
    setdvar(@"hash_5bb234e77e6e8500", 1);
    setdvar(@"hash_248d3e2385cacb9b", 1);
    setdvar(@"hash_2f948c271d3b0e2e", 2);
    setdvar(@"hash_7623bd064c30088c", 0);
    setdvar(@"hash_446ed387d5a2467b", 300);
    setdvar(@"hash_d5be9cf5305a87c0", 0.99);
    setdvar(@"hash_383eb0dc42a487be", 20);
    setdvar(@"hash_6587b19cde46756e", "1.0 0.5 0.5");
    setdvar(@"hash_198bc49639574b81", 600);
    setdvar(@"hash_b7ba2258818c9f3d", 1);
    setdvar(@"hash_b7972c5881666d83", 0);
    setdvar(@"hash_9e9f4b1cab77df95", 0.03038);
    setdvar(@"hash_9ad4ff0067a34902", 0.15);
    setdvar(@"hash_6a4a2521dfc436d3", 14.1421);
    setdvar(@"hash_bd8a970582340989", "clouds_mp_saba_section_1");
    setdvar(@"hash_66bdfcbe954f0f83", "vol_clouds_noise_midway_32");
    setdvar(@"hash_fcad48046518ef67", 0.2);
    setdvar(@"hash_173fd72936a4128a", 3.42214);
    setdvar(@"hash_a51fe16d9e863ec3", 0.5);
    setdvar(@"hash_10c2ad088dc85d91", 0.5);
    namespace_3e528bdeb387613a::setupminimap("compass_map_mp_jup_bigmap_ob", undefined, 16);
    if (getsubgametype() == "dmz") {
        namespace_d696adde758cbe79::function_dd432354af4c9024();
    }
    namespace_36f464722d326bbe::function_35f5b4e643757db7();
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    if (getgametype() == "br") {
        if (getsubgametype() == "dmz") {
            function_eb7f544259415a09("mp_jup_bigmap_dmz");
        } else {
            function_eb7f544259415a09("mp_jup_bigmap_br");
        }
    } else if (getgametype() == "ob") {
        function_eb7f544259415a09("mp_jup_bigmap_ob");
    }
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        brinit();
    }
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        var_4557a9f6c57d2fbd = getdvar(@"hash_7a9791e29aa436af", "");
        if (var_4557a9f6c57d2fbd != "" && getdvarint(@"hash_2d0860b4e6eefba5", 0)) {
            level thread function_6eda5db03e992d7b(var_4557a9f6c57d2fbd);
        }
    }
    level thread function_ef079ee3d6b651ad();
    if (istrue(level.var_289df80e1ded586f)) {
        level thread namespace_bfef6903bca5845d::function_c8393014dd7f8ab6();
    }
    level thread namespace_272931699e2fe8e9::function_d8de1e0bc05f3b3a();
    if (getsubgametype() != "ob") {
        mdl_clip = getent("clip_subbase", "targetname");
        if (isdefined(mdl_clip)) {
            mdl_clip delete();
        }
        var_607fd6c265fe2a0 = getentarray("clip_zombie_breach", "targetname");
        foreach (mdl_clip in var_607fd6c265fe2a0) {
            if (isdefined(mdl_clip)) {
                mdl_clip connectpaths();
            }
            waitframe();
            if (isdefined(mdl_clip)) {
                mdl_clip delete();
            }
        }
    }
    /#
        function_691203aeee9e9cf2();
    #/
    namespace_92443376a63aa4bd::function_f6c977ad89f51b9c(level.script, level.mapcorners);
}

// Namespace mp_jup_bigmap/namespace_e109e6b1b4b14f49
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb65
// Size: 0x5b
function initvehicles() {
    level.var_1b4da6b781c9dfbd = 1;
    namespace_8db7d778efdc3d65::main();
    namespace_15896d40cab0d429::main();
    namespace_a8c01726524388f5::main();
    namespace_d8c2d739478db8bb::main();
    namespace_a8b2611e1c2c0f9c::main();
    namespace_65ad5249b19d5d41::main();
    namespace_9972b4aee3d673ca::main();
    namespace_a5c3c313b4f6886a::main();
    namespace_3568ab3cfd523b38::main();
    namespace_405c71940c7ec9ea::main();
    namespace_8624e3257d13b029::main();
}

// Namespace mp_jup_bigmap/namespace_e109e6b1b4b14f49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbc7
// Size: 0x163
function function_691203aeee9e9cf2() {
    /#
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("mp/jup_bigmap_br_locations.csv");
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("marshlands", "script_model", &function_ae5f5802b8c421c2);
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ae5f5802b8c421c2);
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ae5f5802b8c421c2);
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ae5f5802b8c421c2);
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ae5f5802b8c421c2);
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ae5f5802b8c421c2);
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ae5f5802b8c421c2);
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ae5f5802b8c421c2);
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ae5f5802b8c421c2);
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ae5f5802b8c421c2);
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ae5f5802b8c421c2);
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ae5f5802b8c421c2);
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ae5f5802b8c421c2);
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ae5f5802b8c421c2);
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ae5f5802b8c421c2);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
    #/
}

// Namespace mp_jup_bigmap/namespace_e109e6b1b4b14f49
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd31
// Size: 0x29
function function_ae5f5802b8c421c2(param) {
    /#
        level.players[0] setorigin(stringtovec3(param[0]));
    #/
}

// Namespace mp_jup_bigmap/namespace_e109e6b1b4b14f49
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd61
// Size: 0xb44
function brinit() {
    namespace_71073fa38f11492::enablefeature("circleSnapToNavMesh");
    level.onlowpopstart = &function_865dd7703c23c87;
    level.br_level = spawnstruct();
    var_fdfe2d4aaf8ec33d = 16000;
    var_47c567a3b8b1e5e0 = getdvarint(@"hash_512a3982cfb227fa", -1);
    if (var_47c567a3b8b1e5e0 != -1) {
        var_fdfe2d4aaf8ec33d = var_47c567a3b8b1e5e0;
    }
    namespace_ad389306d44fc6b4::setc130heightoverrides(var_fdfe2d4aaf8ec33d);
    var_1642d587a6f7f5ee = getdvarfloat(@"hash_575da0cef7432907", 0.8);
    minx = level.mapcorners[0].origin[0] * var_1642d587a6f7f5ee;
    maxx = level.mapcorners[1].origin[0] * var_1642d587a6f7f5ee;
    miny = level.mapcorners[1].origin[1] * var_1642d587a6f7f5ee;
    maxy = level.mapcorners[0].origin[1] * var_1642d587a6f7f5ee;
    level.br_level.br_mapbounds = [];
    level.br_level.br_mapbounds[0] = (maxx, maxy, 0);
    level.br_level.br_mapbounds[1] = (minx, miny, 0);
    minx = level.mapcorners[0].origin[0];
    maxx = level.mapcorners[1].origin[0];
    miny = level.mapcorners[1].origin[1];
    maxy = level.mapcorners[0].origin[1];
    level.br_level.br_mapboundsfull = [];
    level.br_level.br_mapboundsfull[0] = (maxx, maxy, 0);
    level.br_level.br_mapboundsfull[1] = (minx, miny, 0);
    level.br_level.br_mapcenter = ((minx + maxx) / 2, (miny + maxy) / 2, 0);
    var_fdfe2d4aaf8ec33d = namespace_5078ee98abb32db9::getc130height();
    var_33dd915945fca005 = namespace_5078ee98abb32db9::getc130sealevel();
    level.br_level.br_mapsize = (abs(maxx - minx), abs(maxy - miny), abs(var_fdfe2d4aaf8ec33d - var_33dd915945fca005));
    level.br_level.var_257dee2bbc2480f5 = getdvar(@"hash_6484277e4bb431cd", "mp/jup_bigmap_br_locations.csv");
    if (isdefined(level.var_e486acb8f70c45a2)) {
        level.br_level.br_circleclosetimes = [0:level.var_e486acb8f70c45a2.var_4f81729168c0b8a, 1:3000, 2:3000];
        level.br_level.br_circledelaytimes = [0:level.var_e486acb8f70c45a2.delaytime, 1:3000, 2:3000];
        level.br_level.br_circleshowdelaydanger = [0:level.var_e486acb8f70c45a2.delaytime, 1:0, 2:0];
    } else if (getsubgametype() == "mini" || getsubgametype() == "mini_mgl") {
        level.br_level.br_circleclosetimes = [0:1, 1:200, 2:130, 3:90, 4:50, 5:100];
        level.br_level.br_circledelaytimes = [0:1, 1:120, 2:75, 3:60, 4:45, 5:0];
        level.br_level.br_circleshowdelaydanger = [0:1, 1:0, 2:0, 3:0, 4:0, 5:0];
    } else if (getsubgametype() == "resurgence") {
        level.br_level.br_circleclosetimes = [0:1, 1:110, 2:90, 3:75, 4:75, 5:120];
        level.br_level.br_circledelaytimes = [0:1, 1:150, 2:110, 3:75, 4:60, 5:0];
        level.br_level.br_circleshowdelaydanger = [0:1, 1:0, 2:0, 3:0, 4:0, 5:0];
    } else {
        level.br_level.br_circleclosetimes = [0:270, 1:220, 2:170, 3:110, 4:70, 5:50, 6:50, 7:100];
        level.br_level.br_circledelaytimes = [0:150, 1:75, 2:60, 3:60, 4:45, 5:30, 6:30, 7:0];
        level.br_level.br_circleshowdelaydanger = [0:150, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0];
    }
    if (isdefined(level.var_e486acb8f70c45a2)) {
        level.br_level.br_circleshowdelaysafe = [0:level.var_e486acb8f70c45a2.delaytime, 1:3000, 2:3000];
        level.br_level.br_circleminimapradii = [0:10500, 1:10500, 2:10500];
        level.br_level.br_circleradii = [0:81600, 1:level.var_e486acb8f70c45a2.circleradius, 2:200, 3:0];
    } else if (getsubgametype() == "mini" || getsubgametype() == "mini_mgl") {
        level.br_level.br_circleshowdelaysafe = [0:0, 1:0, 2:0, 3:0, 4:0, 5:0];
        level.br_level.br_circleminimapradii = [0:10500, 1:10500, 2:10500, 3:9000, 4:8000, 5:5500];
        if (istrue(level.var_63a70ff2d38d8bee)) {
            level.br_level.br_circleradii = [0:19000, 1:12500, 2:7500, 3:3500, 4:1000, 5:250, 6:0];
        } else {
            level.br_level.br_circleradii = [0:75000, 1:45000, 2:20000, 3:7000, 4:3500, 5:1500, 6:0];
        }
    } else if (getsubgametype() == "resurgence") {
        level.br_level.br_circleshowdelaysafe = [0:0, 1:0, 2:0, 3:0, 4:0, 5:0];
        level.br_level.br_circleminimapradii = [0:7500, 1:7500, 2:6500, 3:5500, 4:5000, 5:4500];
        level.br_level.br_circleradii = [0:22000, 1:22000, 2:12000, 3:8000, 4:4500, 5:1500, 6:0];
    } else {
        level.br_level.br_circleshowdelaysafe = [0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0];
        level.br_level.br_circleminimapradii = [0:10500, 1:10500, 2:10500, 3:10500, 4:10500, 5:9000, 6:8000, 7:5500];
        level.br_level.br_circleradii = [0:81600, 1:57300, 2:37500, 3:22200, 4:12300, 5:6000, 6:3000, 7:1500, 8:0];
    }
    if (isdefined(level.br_circle_init_func)) {
        [[ level.br_circle_init_func ]]();
    }
    namespace_c5622898120e827f::applycirclesettings();
    level.br_prematchspawnlocations = [0:namespace_d20f8ef223912e12::createspawnlocation((-31536, 30148, 1500), 0, 7000), 1:namespace_d20f8ef223912e12::createspawnlocation((1632, 25644, 1500), 0, 700), 2:namespace_d20f8ef223912e12::createspawnlocation((30752, 27476, 1515), 0, 7500), 3:namespace_d20f8ef223912e12::createspawnlocation((-31312, 4964, 1000), 0, 7000), 4:namespace_d20f8ef223912e12::createspawnlocation((-11568, 7116, 1056), 0, 7000), 5:namespace_d20f8ef223912e12::createspawnlocation((2588, 12, 2020), 0, 9000), 6:namespace_d20f8ef223912e12::createspawnlocation((16812, -5728, 1648), 0, 7000), 7:namespace_d20f8ef223912e12::createspawnlocation((38704, -5896, 2964), 0, 7000), 8:namespace_d20f8ef223912e12::createspawnlocation((-16336, -25180, 1748), 0, 17000), 9:namespace_d20f8ef223912e12::createspawnlocation((7492, -32964, 2000), 0, 9000), 10:namespace_d20f8ef223912e12::createspawnlocation((26040, -28664, 3504), 0, 7000)];
    level.br_badcircleareas = [0:namespace_c5622898120e827f::createinvalidcirclearea((-33022, -37501, 2622), 5000), 1:namespace_c5622898120e827f::createinvalidcirclearea((-29550, -41060, 2903), 5000), 2:namespace_c5622898120e827f::createinvalidcirclearea((41433, -35444, 3408), 3300), 3:namespace_c5622898120e827f::createinvalidcirclearea((19990, -40209, 3187), 3300), 4:namespace_c5622898120e827f::createinvalidcirclearea((45891, 16077, 3048), 3300)];
    if (namespace_36f464722d326bbe::function_6493ec89ae923684()) {
        function_3574f80a3eb07f0d();
        var_9f4a3632d9f75d32 = (-38486, 45758, 2022);
        namespace_bd131dfa920d03b9::function_7e904ff184e6794c(var_9f4a3632d9f75d32, -10000);
    }
}

// Namespace mp_jup_bigmap/namespace_e109e6b1b4b14f49
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18ac
// Size: 0x20a
function function_865dd7703c23c87() {
    if (!namespace_d20f8ef223912e12::lowpopallowtweaks()) {
        return;
    }
    if (getsubgametype() == "mini" || getsubgametype() == "mini_mgl") {
        if (istrue(level.var_63a70ff2d38d8bee)) {
            level.br_level.br_circleradii = [0:22500, 1:12000, 2:7500, 3:4000, 4:1500, 5:500, 6:0];
        } else {
            level.br_level.br_circleradii = [0:57000, 1:27500, 2:12500, 3:6500, 4:3000, 5:1250, 6:0];
        }
        level.br_level.br_circleclosetimes = [0:1, 1:190, 2:120, 3:80, 4:40, 5:90];
        level.br_level.br_circledelaytimes = [0:1, 1:110, 2:65, 3:50, 4:35, 5:0];
    } else {
        level.br_level.br_circleradii = [0:81000, 1:50000, 2:30000, 3:15000, 4:7500, 5:3750, 6:1500, 7:0];
        level.br_level.br_circleclosetimes = [0:270, 1:180, 2:150, 3:60, 4:60, 5:45, 6:90];
        level.br_level.br_circledelaytimes = [0:150, 1:60, 2:60, 3:60, 4:45, 5:30, 6:0];
    }
    namespace_c5622898120e827f::applycirclesettings();
}

// Namespace mp_jup_bigmap/namespace_e109e6b1b4b14f49
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1abd
// Size: 0x162
function function_ef079ee3d6b651ad() {
    if (getdvarint(@"hash_6979a78a1820ac18", 0) != 0) {
        return;
    }
    level waittill("prematch_started");
    while (!isdefined(level.br_ac130)) {
        wait(0.1);
    }
    var_90416d079805b8a5 = level.br_ac130.angles;
    var_90416d079805b8a5 = var_90416d079805b8a5 + (0, -90, 0);
    level.name_fx = [];
    function_fd2dbeae371f9614("airport", (-31536, 30148, 4500), var_90416d079805b8a5);
    function_fd2dbeae371f9614("coastaltown", (1632, 25644, 4500), var_90416d079805b8a5);
    function_fd2dbeae371f9614("fishingvillage", (30752, 27476, 4550), var_90416d079805b8a5);
    function_fd2dbeae371f9614("hydraulic", (-31312, 4964, 4500), var_90416d079805b8a5);
    function_fd2dbeae371f9614("lighthouse", (-11568, 7116, 4556), var_90416d079805b8a5);
    function_fd2dbeae371f9614("marshlands", (2588, 12, 4800), var_90416d079805b8a5);
    function_fd2dbeae371f9614("moderncity", (16812, -5728, 4600), var_90416d079805b8a5);
    function_fd2dbeae371f9614("mountaintown", (-16336, -25180, 5028), var_90416d079805b8a5);
    function_fd2dbeae371f9614("observatory", (26040, -28664, 5004), var_90416d079805b8a5);
    level thread function_5adc69197de334c3();
}

// Namespace mp_jup_bigmap/namespace_e109e6b1b4b14f49
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c26
// Size: 0x50
function function_fd2dbeae371f9614(scriptablestate, loc, var_90416d079805b8a5) {
    if (istrue(level.isx1ops)) {
        function_6482feb0b7568914(scriptablestate + "_re", loc, var_90416d079805b8a5, "name_fx_re");
    } else {
        function_6482feb0b7568914(scriptablestate, loc, var_90416d079805b8a5, "name_fx");
    }
}

// Namespace mp_jup_bigmap/namespace_e109e6b1b4b14f49
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c7d
// Size: 0x8c
function function_6482feb0b7568914(scriptablestate, loc, var_90416d079805b8a5, var_8a46c62f0a756dd3) {
    loc = loc + (0, 0, 500);
    var_b243306d75cc8719 = spawn("script_model", loc);
    var_b243306d75cc8719 setmodel("jup_tag_origin_name_fx");
    var_b243306d75cc8719.angles = var_90416d079805b8a5;
    level.name_fx[level.name_fx.size] = var_b243306d75cc8719;
    var_b243306d75cc8719 setscriptablepartstate(var_8a46c62f0a756dd3, scriptablestate);
    var_b243306d75cc8719 forcenetfieldhighlod(1);
}

// Namespace mp_jup_bigmap/namespace_e109e6b1b4b14f49
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d10
// Size: 0x81
function function_5adc69197de334c3() {
    level thread function_6a0decc2d8ffcaae();
    while (isdefined(level.br_ac130)) {
        wait(0.1);
    }
    wait(90);
    level notify("stop_fx_hide_func");
    foreach (element in level.name_fx) {
        element delete();
    }
}

// Namespace mp_jup_bigmap/namespace_e109e6b1b4b14f49
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d98
// Size: 0xdc
function function_6a0decc2d8ffcaae() {
    level endon("game_ended");
    level endon("stop_fx_hide_func");
    throttle = 10;
    var_acacf8ef0144c237 = 0.25;
    while (level.name_fx.size > 0) {
        var_2a29b237dcc66fe5 = level.players;
        for (i = 0; i < var_2a29b237dcc66fe5.size; i++) {
            var_c78bbc68c93bf91b = var_2a29b237dcc66fe5[i];
            if (isdefined(var_c78bbc68c93bf91b) && isalive(var_c78bbc68c93bf91b)) {
                if (isdefined(var_c78bbc68c93bf91b.vehicle)) {
                    for (j = 0; j < level.name_fx.size; j++) {
                        level.name_fx[j] hidefromplayer(var_c78bbc68c93bf91b);
                    }
                }
            }
            if (i % throttle == 0) {
                wait(var_acacf8ef0144c237);
            }
        }
        wait(0.1);
    }
}

// Namespace mp_jup_bigmap/namespace_e109e6b1b4b14f49
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e7b
// Size: 0x89
function function_6eda5db03e992d7b(var_1a12730b9392225) {
    var_f94237d8c14e730d = undefined;
    switch (var_1a12730b9392225) {
    case #"hash_343f1caa2dc07b2c":
        var_f94237d8c14e730d = (41065.4, 13217.8, 1686.36);
        break;
    case #"hash_343f23aa2dc08631":
        var_f94237d8c14e730d = (26564.4, -30964.7, 785.1);
        break;
    default:
        /#
            assertex(0, "Trying to call the circle reroller on a tile it is not set up for, plesae make scr_br_playtest_submap matches and entry in switch statement.");
        #/
        return;
    }
    level waittill("calc_circle_centers");
    namespace_bbc79db4c3949a5c::function_62c8ef916090a2c(var_f94237d8c14e730d);
}

// Namespace mp_jup_bigmap/namespace_e109e6b1b4b14f49
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f0b
// Size: 0x35e
function function_3574f80a3eb07f0d() {
    level.var_301d639da97100c9 = [];
    spot1 = spawnstruct();
    spot1.target = "spot1";
    spot1.origin = (-25616, 32040, 1545);
    spot1.script_parameters = 1;
    level.var_301d639da97100c9[level.var_301d639da97100c9.size] = spot1;
    spot2 = spawnstruct();
    spot2.target = "spot2";
    spot2.origin = (1585, 33139, 1414);
    spot2.script_parameters = 1;
    level.var_301d639da97100c9[level.var_301d639da97100c9.size] = spot2;
    spot3 = spawnstruct();
    spot3.target = "spot3";
    spot3.origin = (32036, 30149, 1411);
    spot3.script_parameters = 1;
    level.var_301d639da97100c9[level.var_301d639da97100c9.size] = spot3;
    spot4 = spawnstruct();
    spot4.target = "spot4";
    spot4.origin = (-21167, 1461, 1469);
    spot4.script_parameters = 1;
    level.var_301d639da97100c9[level.var_301d639da97100c9.size] = spot4;
    spot5 = spawnstruct();
    spot5.target = "spot5";
    spot5.origin = (8369, -583, 2231);
    spot5.script_parameters = 1;
    level.var_301d639da97100c9[level.var_301d639da97100c9.size] = spot5;
    spot6 = spawnstruct();
    spot6.target = "spot6";
    spot6.origin = (34886, -735, 2643);
    spot6.script_parameters = 1;
    level.var_301d639da97100c9[level.var_301d639da97100c9.size] = spot6;
    spot7 = spawnstruct();
    spot7.target = "spot7";
    spot7.origin = (-13198, -21240, 2104);
    spot7.script_parameters = 1;
    level.var_301d639da97100c9[level.var_301d639da97100c9.size] = spot7;
    spot8 = spawnstruct();
    spot8.target = "spot8";
    spot8.origin = (4271, -28614, 2195);
    spot8.script_parameters = 1;
    level.var_301d639da97100c9[level.var_301d639da97100c9.size] = spot8;
    spot9 = spawnstruct();
    spot9.target = "spot9";
    spot9.origin = (26618, -30923, 3630);
    spot9.script_parameters = 1;
    level.var_301d639da97100c9[level.var_301d639da97100c9.size] = spot9;
}

