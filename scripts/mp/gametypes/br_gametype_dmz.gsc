// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\sound.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gamescore.gsc;
#using script_7ab5b649fa408138;
#using scripts\cp_mp\utility\omnvar_utility.gsc;
#using script_6fc415ff6a905dc1;
#using script_14d3930854cb398c;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_15ca41a3fbb0e379;
#using script_784aa75d4a32fa24;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using script_5307834cd39b435c;
#using script_2cc6455920627806;
#using script_1174abedbefe9ada;
#using script_34874c98ab154f37;
#using script_b7a9ce0a2282b79;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using script_35de402efc5acfb3;
#using script_26660ae1076e2d99;
#using script_42db00fecb0fa74d;
#using script_2d9d24f7c63ac143;
#using scripts\mp\flags.gsc;
#using script_304f476283f6d36e;
#using script_3314add7998ab13;
#using script_79d4b1c751a51f03;
#using script_662cbac61c1ae7e2;
#using script_28bee6f49336b0a8;
#using script_67015c88c47ec4f8;
#using script_5c55c87b89467a29;
#using script_371b4c2ab5861e62;
#using script_4948cdf739393d2d;
#using script_57d3850a12cf1d8f;
#using script_7c03ab87c5f9f420;
#using script_6d337a1fd1d54c5f;
#using script_268c4da1ef6a20a8;
#using script_48814951e916af89;
#using script_1c47017ba325709a;
#using script_2bc0b0102f9b7751;
#using script_640cf1641c03e2a0;
#using script_6153e980b3eb0e1b;
#using script_2b736eb3fdd9b328;
#using script_590d4c1aaf3a5235;
#using script_5def7af2a9f04234;
#using script_2391409ef7b431e1;
#using scripts\mp\gametypes\br_pickups.gsc;
#using script_3aacf02225ca0da5;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\challenges.gsc;
#using script_6a8ec730b2bfa844;
#using scripts\mp\class.gsc;
#using script_1f97a44d1761c919;
#using script_530f3ea26428deba;
#using scripts\mp\rank.gsc;
#using script_697b7ae06ba9b28c;
#using scripts\mp\utility\lower_message.gsc;
#using script_600b944a95c3a7bf;
#using scripts\mp\gametypes\br_weapons.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_7c40fa80892a721;
#using scripts\mp\teamrevive.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\utility\dialog.gsc;
#using script_5bab271917698dc4;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\equipment.gsc;
#using script_58fe895fd0fbe620;
#using script_c00335a7aeb2728;
#using script_46b3c7d0a4338d8;
#using script_3665d737b10b78d9;
#using script_419eebc6f24e287;
#using script_6b7618d5ead05b66;
#using script_7fba4131729fe74d;
#using script_2e2e13d44d465832;
#using script_241ff3c86d02a28d;
#using script_495022338d50407e;
#using script_a62705cb078ec0a;
#using script_3e32e216ce730ac2;
#using script_1193c0b83fce13b;
#using script_64acb6ce534155b7;
#using scripts\mp\gametypes\br_vehicles.gsc;
#using script_15cba36f180ab171;
#using script_1fa444cdc9dbf364;
#using scripts\mp\equipment\throwing_knife_mp.gsc;

#namespace namespace_9a3cc734bcf13a48;

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f0f
// Size: 0x18
function main() {
    level.var_cdc15ee14362fbf = &namespace_d696adde758cbe79::init;
    namespace_d20f8ef223912e12::main();
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f2e
// Size: 0x986
function init() {
    namespace_36f464722d326bbe::removematchingents_bykey("delete_on_load", "targetname");
    function_c2a1bc0c5a905217();
    function_a96666bc3e3d2cb0();
    function_81b59887710baf14();
    if (issharedfuncdefined("dmz_s5_reveal", "init")) {
        level thread [[ getsharedfunc("dmz_s5_reveal", "init") ]]();
    }
    level thread initdialog();
    level thread initfx();
    level thread function_f269438f48049613();
    level thread initpostmain();
    level thread function_f16652e1462a3739();
    level thread function_4fb6f74e053a49d6();
    /#
        level thread namespace_d1a9ca87d78d9813::function_df414d6582eeca3();
    #/
    /#
        level thread function_ea8ed4c3ddc61883();
    #/
    /#
        level thread function_f7920586b5a59226();
    #/
    /#
        level thread function_2ff493cd8ff03634();
    #/
    /#
        level thread function_f917fde1df9c5506();
    #/
    /#
        level thread function_37eaf2bc0bb3e28a();
    #/
    /#
        level thread function_dc98aeb4dd4b727a();
    #/
    /#
        level thread function_459e2558e6d936ed();
    #/
    /#
        level thread namespace_8c3daeeca6bd42c0::debug();
    #/
    /#
        level thread function_b0d036699b334631();
    #/
    level thread function_e1fa80f536692a32();
    setdvar(@"hash_da4f64f6eb4d97da", 3);
    setdvar(@"hash_f6f24e020168ade8", "nothing");
    setdvar(@"hash_a85ba82ffd9faefe", 0);
    setdvar(@"hash_2c9195a6f431585d", 1);
    setdvar(@"hash_58a078a367c02ab3", 1);
    setdvar(@"hash_c5d765aefb9658bd", 2200);
    setdvarifuninitialized(@"hash_a44cf32ff2620bc2", 9);
    setdvarifuninitialized(@"hash_8d9ad523f40be455", 10000);
    setomnvar("ui_br_circle_state", 5);
    setomnvar("ui_gulag_state", 1);
    setomnvar("ui_hide_redeploy_timer", 1);
    var_35a334482f930be6 = getdvarint(@"hash_b773758221a0c100", -1);
    if (var_35a334482f930be6 == -1) {
        setdvar(@"hash_b773758221a0c100", 10);
    }
    level.var_e4a482edc1542597 = getdvarint(@"hash_bb9178da63ce4b9", 1) == 1;
    level.var_d040719163e20394 = 1;
    level.var_78db23c4f4816114 = 1;
    level.var_ece60df4b8bc448 = 1;
    level.var_5dee688f6db9ad0b = 1;
    level.var_b9c6856f5ab5f70f = 1;
    level.var_f60a3be40c34023d = 1;
    level.var_c3d1e9e6a5024479 = 1;
    level.var_82ef5f20ebbf6b59 = 1;
    level.var_b7ad06255200033c = 1;
    setdvar(@"hash_e57fc6a3ec1c560b", 0);
    level.var_82a0e660e66306dc = 1;
    level.var_faec6e12b831873d = 1;
    level.var_749783dc3aa20c72 = 1;
    level.var_b75e093e97f9e931 = 1;
    level.var_2690bfebdead0396 = 1;
    level.var_48154008716f7116 = 1;
    level.var_b9abf4fc2d1f7fcd = &function_b9abf4fc2d1f7fcd;
    if (getdvarint(@"hash_4e758755f5217912", 1) == 1) {
        level.var_924a9707bdcbfc46 = &function_f6843e3a71516b3e;
    }
    level.var_d191ab4628e775cd = getdvarint(@"hash_942e15dcd26fb29e", 20);
    level.skipprematchdropspawn = 1;
    level.skipplaybodycountsound = 1;
    level.brdisablefinalkillcam = 1;
    level.br_prematchffa = 0;
    level.var_59ff09549058dda2 = getdvarint(@"hash_f1b1048e888610e9", 1) && getdvarint(@"hash_ff65c25889692db8", 0) != 1;
    level.giveloadouteverytime = getdvarint(@"hash_f38399dadd8dbb3c", 1);
    level.var_fc90401f4ae3f765 = getdvarint(@"hash_bb1dcc8bdbf24ff", 0) == 1;
    level.skipprematch = getdvarint(@"hash_cb643d3f8e15dc02", 0);
    level.allowprematchdamage = 0;
    level.var_8281a47e2cecb257 = 1;
    level.var_eef1d450c2d5d682 = getdvarint(@"hash_dcf2ce95246dd428", 1);
    if (level.var_eef1d450c2d5d682) {
        namespace_71073fa38f11492::disablefeature("littleBirdSpawns");
    }
    level.var_e00997af1f830a38 = 1;
    level.var_e148f7d0b42fe6da = getdvarfloat(@"hash_c8c9056814e8241c", 1);
    level.var_be39d6b46044f344 = getdvarfloat(@"hash_685be141b7e436ee", 40);
    level.instantbleedoutsquadwipe = getdvarint(@"hash_76a23e670fcf02b5", 1);
    level.var_d21c4a649c5aca6c = getdvarint(@"hash_445f250f74c53306", 0);
    level.respawnheightoverride = getdvarint(@"hash_1cfe5b8f1beeb2c6", 5000);
    level.parachutedeploydelay = getdvarfloat(@"hash_bf323f012d271c0", 0.5);
    level.autoassignfirstquest = getdvarint(@"hash_c2bdab0e90057ed", 0);
    level.tabletreplacefrequency = getdvarfloat(@"hash_c9e99ca095302d5e", 1.5);
    level.objectivescaler = 1;
    level.var_644a33d86d8514bf = getdvarint(@"hash_36b76adbfa9d12c5", 1) == 1;
    level.skipweapondropondeath = getdvarint(@"hash_d9f08c101634f72e", 0);
    level.skipequipmentdropondeath = getdvarint(@"hash_3b11aff9dadd9d22", 0);
    level.allowfultondropondeath = getdvarint(@"hash_906f1e617463438e", 1);
    level.var_545cddf92da82a04 = getdvarint(@"hash_f924e428ae42dc96", 0);
    level.var_36827f5d10328424 = &function_f1ad30efc5733caf;
    level.var_57ece26e490ad8c4 = getdvarint(@"hash_31afd0e1d896114a", 1);
    level.var_e4623740d9b51824 = getdvarint(@"hash_eefb9c49e01093a6", 1);
    level.var_595938569c3fe806 = getdvarint(@"hash_c43f4c79f914aee", 1);
    level.var_f4b090dbbd2b125b = getdvarint(@"hash_9b11f9106fb2721", 0);
    level.var_e028ca551ecc95a3 = getdvarint(@"hash_1107caf2e45b5ccd", 1);
    level.var_cc9e990b6e83975b = getdvarint(@"hash_c39067c564e9be9", 1);
    level.var_a101059dea76957c = getdvarint(@"hash_9aff44dbd6467cb1", 1);
    level.var_2c93542553c664f5 = getdvarint(@"hash_850bde4c8d2d482b", 0);
    level.var_472d7a6d15e57940 = getdvarint(@"hash_586d32848f833922", 1);
    level.var_1d814f83596d0a02 = getdvarint(@"hash_7a1da73fa673ed8", 1);
    level.var_8dea6607b3189a60 = getdvarint(@"hash_32c09327627c883c", 1);
    level.minplunderdropondeath = getdvarint(@"hash_e0a487b88d0e4410", 0);
    level.var_f478c1f94caa7e9 = getdvarint(@"hash_4f0a12b17756a2d0", 1);
    level.var_7d17e26667be2792 = getdvarint(@"hash_55d9444d8a3ce31a", 1);
    guns = getdvar(@"hash_53bc1dfee47e5c6d", "brloot_weapon_ar_schotel_lege,brloot_weapon_ar_golf3_lege,brloot_weapon_br_msecho_lege,brloot_weapon_br_soscar14_lege,brloot_weapon_ar_mike4_lege,brloot_weapon_ar_mike16_lege,brloot_weapon_ar_akilo_lege");
    level.var_808a69414f52f6bc = strtok(guns, ",");
    level.var_184726567a9f58d8 = getdvarfloat(@"hash_d2b4c84cdda73751", 0.02);
    level.var_e5993849fc7d5987 = getdvarint(@"hash_beb500581164e4bc", 1);
    level.var_38ae6e498db315ff = getdvarint(@"hash_fe9052d4aaa052e0", 1000);
    level.var_499b5e2905bfa698 = getdvarint(@"hash_19476575934ab4ce", 4);
    level.var_3c8e175d92be01ea = &function_daf5cd1e02931ea7;
    level.disablewinonscore = getdvarint(@"hash_4a9c110cfc54a4c5", 0);
    level.var_ef3e0eb58d1263c5 = getdvarint(@"hash_8985888259fde494", 30);
    level.var_44691e82f0c05d37 = &function_adc51ade78872d95;
    level.var_376762409014cc8e = getdvarint(@"hash_d7b1d34d99c190a8", 0);
    level.var_87a4731d4dce4c3f = &function_9df0ee7fcb9589d4;
    level.var_8973f9da378e47d = 0;
    level.var_af010715d9de37a1 = getdvarfloat(@"hash_daf598646a54a4b7", 0.4);
    level.var_d034183abf2e274d = getdvarint(@"hash_64be202f01a8b591", 1);
    level.var_87deb8f6a4c7d50e = getdvarfloat(@"hash_3895fe2399dd9e41", 512);
    level.var_719b61ca626125ff = getdvarfloat(@"hash_86a034ed5d293bec", 256);
    level.var_7a36d824da6087ef = getdvarint(@"hash_744188cc6b4d2af0", 1);
    level.var_c7aedf1af259f045 = 1;
    level.var_fb7d41d7c65922b7 = getdvarint(@"hash_60642a632ab9baeb", 1);
    if (level.var_fb7d41d7c65922b7) {
        level.var_76eba5facacd254b = &function_bfd9f11e955ace89;
    }
    level.var_74e0aae435a09a51 = &function_d056e6d06ba65ca8;
    setdvar(@"hash_a6a3fd965485d4bc", 2);
    level thread function_62b40b6a6c2cf37a();
    level thread function_3114e3023d0edf66();
    level thread checkendgame();
    if (istrue(level.var_c7aedf1af259f045)) {
        namespace_25b25d188ef778c4::function_36f1bd0f5d72054a();
    }
    level thread namespace_b66505f20cbf2570::function_476ba78d85b349ea();
    if (getdvarint(@"hash_696cde56698dcc68", 1) == 1) {
        thread namespace_7789f919216d38a2::function_3acf5939a1db7a7();
    }
    if (getdvarint(@"hash_7afd7ac5e611d8ad", 1) == 1) {
        level thread namespace_c50aac14f506294b::function_414e92de6d8a19ad();
    }
    /#
        if (getdvarint(@"hash_a6efeb74a267da10", 0)) {
            level thread function_3fd2d65f62ca31b0();
        }
        setdvar(@"hash_f79cd84983250eda", 0);
    #/
    if (namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
        function_d2c13fc95e4e8962(1);
        namespace_a38a2e1fe7519183::init();
    }
    level thread function_f3a2435f8e39438b();
    function_fba25ae643dd02e8();
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38bb
// Size: 0xc8
function function_b52f35a3ff450ecd() {
    var_a620cb0e6444887f = getdvarint(@"hash_a0c7b324fe8c09c6", 3);
    if (var_a620cb0e6444887f <= 0 || istrue(level.var_291b51c7af8d1204)) {
        return;
    }
    structs = level.var_e4669b797013d077;
    if (!isdefined(structs) || structs.size == 0) {
        return;
    }
    foreach (struct in array_slice(array_randomize(structs), 0, var_a620cb0e6444887f)) {
        var_efb5620deead5e9b = namespace_1f188a13f7e79610::vehicle_spawn("veh9_mil_lnd_mrap", struct);
        var_efb5620deead5e9b namespace_1fbd40990ee60ede::function_ac0a3326d43eb8fd();
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x398a
// Size: 0xc3
function function_c2a1bc0c5a905217() {
    var_2957de46170adad1 = spawnstruct();
    var_2957de46170adad1.var_fd6906dc66b503b4 = getdvarint(@"hash_3ce6579b3e9456de", 10);
    var_2957de46170adad1.var_4c433dc943a4b16e = getdvarint(@"hash_5973b1ca7fd76fe0", 20);
    var_2957de46170adad1.var_ac5d474ffe947f53 = getdvarint(@"hash_41027aea8f94bf2d", 7);
    var_2957de46170adad1.var_8fb4e94454c2b089 = getdvarint(@"hash_4769e3057df7eaef", 15);
    var_2957de46170adad1.var_de220ee05772f786 = getdvarint(@"hash_94b723881ade691c", 1);
    var_2957de46170adad1.var_d4692deec4b3b23c = getdvarint(@"hash_787efbd4ed18ab72", 2);
    namespace_378f8281e2d12ced::function_33bdd4ad6aa14edc(var_2957de46170adad1);
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a54
// Size: 0x11
function function_fba25ae643dd02e8() {
    namespace_8042e17e26cb2c7f::init();
    namespace_1bfb3e255db0a9f1::function_5ba1bb4933edc5da();
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a6c
// Size: 0xe7
function function_a96666bc3e3d2cb0() {
    namespace_71073fa38f11492::disablefeature("circle");
    namespace_71073fa38f11492::disablefeature("gulag");
    namespace_71073fa38f11492::disablefeature("dropbag");
    namespace_71073fa38f11492::disablefeature("plunderSites");
    namespace_71073fa38f11492::disablefeature("circle");
    namespace_71073fa38f11492::disablefeature("brQuests");
    if (getdvarint(@"hash_c3a2e929e971289a", 1) == 0) {
        namespace_71073fa38f11492::disablefeature("teamSpectate");
    }
    if (getdvarint(@"hash_18984a982b2ffc8f", 0) == 0) {
        namespace_71073fa38f11492::disablefeature("spectateOnDeath");
    }
    if (getdvarint(@"hash_cf460f5e17cacbe6", 1) == 0) {
        namespace_71073fa38f11492::disablefeature("kiosk");
    }
    namespace_71073fa38f11492::enablefeature("allowLateJoiners");
    if (getdvarint(@"hash_38723bbb368f3f8c", 1) == 1) {
        namespace_71073fa38f11492::enablefeature("tabletReplace");
    }
    namespace_71073fa38f11492::enablefeature("infilParachuteVfx");
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b5a
// Size: 0x96
function function_81b59887710baf14() {
    namespace_71073fa38f11492::registerbrgametypefunc("playerShouldRespawn", &playershouldrespawn);
    namespace_71073fa38f11492::registerbrgametypefunc("spawnHandled", &spawnhandled);
    namespace_71073fa38f11492::registerbrgametypefunc("playerWelcomeSplashes", &playerwelcomesplashes);
    namespace_71073fa38f11492::registerbrgametypefunc("onPlayerConnect", &onplayerconnect);
    namespace_71073fa38f11492::registerbrgametypefunc("isValidSpectateTarget", &isvalidspectatetarget);
    namespace_71073fa38f11492::registerbrgametypefunc("playerSkipLootPickup", &playerskiplootpickup);
    namespace_71073fa38f11492::registerbrgametypefunc("onStartGameType", &onstartgametype);
    level.filtervehiclespawnstructsfunc = &filtervehiclespawnstructs;
    level.modeiskillstreakallowed = &function_f1c3982d13453d32;
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bf7
// Size: 0x92b
function initdialog() {
    level endon("game_ended");
    level.var_92b187a00d3dd091 = 1;
    level waittill("br_dialog_initialized");
    game["dialog"]["gametype"] = "gametype_dmz";
    game["dialog"]["prematch_enter_mission"] = "gamestate_prematch_enter_mission_tutorial";
    game["dialog"]["prematch_enter_gear"] = "gamestate_prematch_enter_death_tutorial";
    game["dialog"]["prematch_end"] = "gamestate_prematch_end";
    game["dialog"]["dmz_infil_end"] = "gamestate_prematch_end_dmz";
    game["dialog"]["dmz_tutorial_end"] = "gametype_tutorial_match_end";
    game["dialog"]["dmz_tutorial_exfil"] = "gametype_tutorial_exfil";
    game["dialog"]["dmz_radiation_east"] = "gamestate_match_end_indicator_east";
    game["dialog"]["dmz_radiation_north"] = "gamestate_match_end_indicator_north";
    game["dialog"]["dmz_radiation_west"] = "gamestate_match_end_indicator_west";
    game["dialog"]["dmz_radiation_south"] = "gamestate_match_end_indicator_south";
    game["dialog"]["dmz_radiation_north_west"] = "gamestate_match_end_indicator_northwest";
    game["dialog"]["dmz_radiation_north_east"] = "gamestate_match_end_indicator_northeast";
    game["dialog"]["dmz_radiation_south_west"] = "gamestate_match_end_indicator_southwest";
    game["dialog"]["dmz_radiation_sound_east"] = "gamestate_match_end_indicator_southeast";
    game["dialog"]["dmz_exfil_pilot_inbound"] = "dx_mpo_usop_exfil_inbound_landing";
    game["dialog"]["dmz_exfil_pilot_lz_clear"] = "dx_mpo_usop_lz_clear";
    game["dialog"]["dmz_exfil_pilot_lz_hot"] = "dx_mpo_usop_lz_hot";
    game["dialog"]["dmz_exfil_inbound"] = "gamestate_exfil_inbound";
    game["dialog"]["dmz_exfil_leaving_generic"] = "gamestate_exfil_leaving_generic";
    game["dialog"]["dmz_exfil_leaving_train"] = "gamestate_exfil_leaving_train";
    game["dialog"]["dmz_exfil_leaving_sewers"] = "gamestate_exfil_leaving_sewers";
    game["dialog"]["dmz_exfil_leaving_cliffs"] = "gamestate_exfil_leaving_cliffs";
    game["dialog"]["dmz_exfil_leaving_forest"] = "gamestate_exfil_leaving_forest";
    game["dialog"]["dmz_exfil_leaving_van"] = "gamestate_exfil_leaving_van";
    game["dialog"]["dmz_exfil_leaving_fire_rd"] = "gamestate_exfil_leaving_fire_rd";
    game["dialog"]["dmz_exfil_leaving_heli"] = "gamestate_exfil_leaving_heli";
    game["dialog"]["dmz_exfil_fail"] = "gamestate_exfil_fail";
    game["dialog"]["dmz_exfil_success_squadmates_dead"] = "gamestate_exfil_success_squadmates_dead";
    game["dialog"]["dmz_exfil_success_personal_dead"] = "gamestate_exfil_success_personal_dead";
    game["dialog"]["dmz_exfil_success_contract_failed_squadmates_dead"] = "gamestate_exfil_success_contract_failed_squadmates_dead";
    game["dialog"]["dmz_exfil_success_contract_failed_personal_dead"] = "gamestate_exfil_success_contract_failed_personal_dead";
    game["dialog"]["dmz_team_revive"] = "gamestate_team_revive";
    game["dialog"]["dmz_team_ally_death"] = "gamestate_ally_death";
    game["dialog"]["dmz_team_last_player"] = "gamestate_ally_death_last_player";
    game["dialog"]["dmz_exfil_intro"] = "dx_br_dmzo_sqst_ovld_main";
    game["dialog"]["dmz_exfil_activity_new"] = "dx_br_dmzo_sqst_ovld_accg";
    game["dialog"]["dmz_exfil_activity_remind"] = "dx_br_dmzo_sqst_ovld_acco";
    game["dialog"]["dmz_exfil_pilot_called_gas"] = "dx_br_dmzc_exfi_depi_ecga";
    game["dialog"]["dmz_exfil_pilot_called_hotzone"] = "dx_br_dmzc_exfi_depi_echz";
    game["dialog"]["dmz_exfil_pilot_called_default"] = "dx_br_dmzc_exfi_depi_ecde";
    game["dialog"]["dmz_exfil_pilot_called_timeout"] = "dx_br_dmzc_exfi_depi_ecti";
    game["dialog"]["dmz_exfil_pilot_called_masks"] = "dx_br_dmzc_exfi_depi_ecma";
    game["dialog"]["dmz_exfil_pilot_called_shortcut"] = "dx_br_dmzc_exfi_depi_ecsc";
    game["dialog"]["dmz_exfil_pilot_called_touchdown"] = "dx_br_dmzc_exfi_depi_ectd";
    game["dialog"]["dmz_exfil_pilot_called_close"] = "dx_br_dmzc_exfi_depi_ecla";
    game["dialog"]["dmz_exfil_pilot_called_15out"] = "dx_br_dmzc_exfi_depi_ec15";
    game["dialog"]["dmz_exfil_pilot_called_30out"] = "dx_br_dmzc_exfi_depi_ec30";
    game["dialog"]["dmz_exfil_pilot_called_final"] = "dx_br_dmzc_exfi_depi_ecfi";
    game["dialog"]["dmz_exfil_pilot_called_final_warning"] = "dx_br_dmzc_exfi_depi_ecfw";
    game["dialog"]["dmz_exfil_pilot_called_final_leaving"] = "dx_br_dmzc_exfi_depi_ecfl";
    game["dialog"]["dmz_exfil_pilot_called_final_gone"] = "dx_br_dmzo_sqst_ovld_enre";
    game["dialog"]["dmz_contract_complete_1"] = "gamestate_exfil_inbound_contract_complete";
    game["dialog"]["dmz_contract_complete_2"] = "gamestate_contract_complete";
    game["dialog"]["dmz_all_contract_complete"] = "gamestate_all_contracts_complete";
    game["dialog"]["dmz_new_contract"] = "gamestate_new_contract";
    game["dialog"]["dmz_mission_direction_north"] = "mission_mission_direction_north";
    game["dialog"]["dmz_mission_direction_south"] = "mission_mission_direction_south";
    game["dialog"]["dmz_mission_direction_west"] = "mission_mission_direction_west";
    game["dialog"]["dmz_mission_direction_east"] = "mission_mission_direction_east";
    game["dialog"]["dmz_mission_direction_northwest"] = "mission_mission_direction_northwest";
    game["dialog"]["dmz_mission_direction_northeast"] = "mission_mission_direction_northeast";
    game["dialog"]["dmz_mission_direction_southwest"] = "mission_mission_direction_southwest";
    game["dialog"]["dmz_mission_direction_southeast"] = "mission_mission_direction_southeast";
    game["dialog"]["dmz_mission_ass_accept"] = "mission_assassination_intro";
    game["dialog"]["dmz_mission_ass_target_nearby"] = "mission_assassination_target_near_player";
    game["dialog"]["dmz_mission_ass_target_killed"] = "mission_assassination_target_killed_player";
    game["dialog"]["dmz_mission_ass_target_killed_by_enemy"] = "mission_assassination_target_killed_enemy_team";
    game["dialog"]["dmz_mission_extract_assigned"] = "mission_extract_mission_assigned";
    game["dialog"]["dmz_mission_mass_assigned"] = "mission_extract_mission_assigned";
    game["dialog"]["dmz_mission_ass_intro_gl"] = "dx_mpm_unca_assassination_mission_mission_intro_10";
    game["dialog"]["dmz_mission_ass_accept_gl"] = "assassination_mission_mission_assigned";
    game["dialog"]["dmz_mission_ass_target_nearby_gl"] = "assassination_mission_mission_yegorclose";
    game["dialog"]["dmz_mission_ass_target_killed_gl"] = "assassination_mission_mission_yegorkilled";
    game["dialog"]["dmz_mission_ass_target_killed_by_enemy_gl"] = "assassination_mission_mission_yegorkilled";
    game["dialog"]["dmz_mission_ass_confirmed_kill_gl"] = "assassination_mission_mission_yegorkiaconfed";
    game["dialog"]["dmz_mission_scav_accept"] = "mission_mission_scavenger_intro";
    game["dialog"]["dmz_mission_scav_first_cache"] = "mission_mission_scavenger_first_cache_secured";
    game["dialog"]["dmz_mission_scav_second_cache"] = "mission_mission_scavenger_second_cache_secured";
    game["dialog"]["dmz_mission_scav_third_cache"] = "mission_mission_scavenger_third_cache_secured";
    game["dialog"]["dmz_mission_search_assigned"] = "mission_search_mission_assigned";
    game["dialog"]["dmz_mission_trap_intro"] = "dx_mpm_unca_search_mission_mission_recieved_part1_10";
    game["dialog"]["dmz_mission_trap_assigned"] = "search_mission_mission_recieved_part2";
    game["dialog"]["dmz_mission_trap_near"] = "search_mission_approaching_targetlocation";
    game["dialog"]["dmz_mission_survive_assigned"] = "trap_mission_mission_assigned";
    game["dialog"]["dmz_mission_survive_complete"] = "trap_mission_mission_lockerunlocked";
    game["dialog"]["dmz_mission_loot_complete"] = "trap_mission_mission_extractremind";
    game["dialog"]["dmz_mission_recon_accept"] = "mission_recon_intro";
    game["dialog"]["dmz_mission_recon_target_near"] = "mission_recon_target_near_player";
    game["dialog"]["dmz_mission_recon_upload_start"] = "mission_recon_upload_start_player";
    game["dialog"]["dmz_mission_recon_upload_complete"] = "mission_recon_upload_upload_complete";
    game["dialog"]["dmz_mission_bounty_accept"] = "mission_mission_grunt_bounty_hunter_intro";
    game["dialog"]["dmz_mission_bounty_first_kill"] = "mission_mission_grunt_bounty_first_kill";
    game["dialog"]["dmz_mission_bounty_second_kill"] = "mission_mission_grunt_bounty_second_kill";
    game["dialog"]["dmz_mission_bounty_third_kill"] = "mission_mission_grunt_bounty_third_kill";
    game["dialog"]["dmz_mission_hostage_assigned"] = "trap_mission_mission_assigned";
    game["dialog"]["dmz_mission_hostage_success"] = "trap_mission_mission_lockerunlocked";
    game["dialog"]["dmz_mission_hostage_failure"] = "trap_mission_mission_lockerunlocked";
    game["dialog"]["dmz_mission_safe_opening"] = "dx_br_dmzo_cost_ovld_ultra1beadvisedthats";
    game["dialog"]["dmz_mission_safe_opening_other_team"] = "dx_br_dmzo_cost_ovld_ultra1enemyoperators";
    game["dialog"]["dmz_mission_safe_unlocked"] = "dx_br_dmzo_cost_ovld_ultra1thesafeisopens";
    game["dialog"]["dmz_mission_clear_assigned"] = "dx_br_dmzo_clfa_ovld_cfas";
    game["dialog"]["dmz_mission_clear_approach"] = "dx_br_dmzo_clfa_ovld_cfnr";
    game["dialog"]["dmz_mission_clear_entered"] = "dx_br_dmzo_clfa_ovld_cfen";
    game["dialog"]["dmz_mission_clear_success"] = "dx_br_dmzo_clfa_ovld_cfcl";
    game["dialog"]["dmz_mission_clear_stealth"] = "dx_br_dmzo_clfa_ovld_cfst";
    game["dialog"]["dmz_mission_clear_loud"] = "dx_br_dmzo_clfa_ovld_cfld";
    game["dialog"]["dmz_mission_destroy_sam_assigned"] = "dx_br_dmzo_cost_ovld_dsas";
    game["dialog"]["dmz_mission_destroy_sam_approach"] = "dx_br_dmzo_cost_ovld_dsnr";
    game["dialog"]["dmz_mission_destroy_sam_close"] = "dx_br_dmzo_cost_ovld_dsar";
    game["dialog"]["dmz_mission_destroy_sam_planted"] = "dx_br_dmzo_cost_ovld_dspl";
    game["dialog"]["dmz_mission_destroy_sam_invited"] = "dx_br_dmzo_cost_ovld_dsiv";
    game["dialog"]["dmz_mission_destroy_sam_hostiles"] = "dx_br_dmzo_cost_ovld_dsin";
    game["dialog"]["dmz_mission_destroy_sam_defusing"] = "dx_br_dmzo_cost_ovld_dsdg";
    game["dialog"]["dmz_mission_destroy_sam_defused"] = "dx_br_dmzo_cost_ovld_dsde";
    game["dialog"]["dmz_mission_destroy_sam_invite_defuse"] = "dx_br_dmzo_cost_ovld_dsiw";
    game["dialog"]["dmz_mission_destroy_sam_success"] = "dx_br_dmzo_cost_ovld_dsex";
    game["dialog"]["dmz_mission_vehicledrive_accept"] = "dx_br_dmzo_cost_ovld_aivd";
    game["dialog"]["dmz_mission_vehicledrive_open_door"] = "dx_br_dmzo_cost_ovld_vdad";
    game["dialog"]["dmz_mission_vehicledrive_extract_inbound"] = "dx_br_dmzo_cost_ovld_vdar";
    game["dialog"]["dmz_mission_vehicledrive_destination"] = "dx_br_dmzo_cost_ovld_vhdd";
    game["dialog"]["dmz_mission_vehicledrive_assigned"] = "dx_br_dmzo_cost_ovld_vhda";
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4529
// Size: 0x5d
function initfx() {
    if (!isdefined(level._effect["cargo_pallet_destruction"])) {
        level._effect["cargo_pallet_destruction"] = loadfx("vfx/iw9/veh/scriptables/death/vfx_veh_cargo_dest.vfx");
    }
    if (!isdefined(level._effect["gunship_flares"])) {
        level._effect["gunship_flares"] = loadfx("vfx/iw8_mp/killstreak/vfx_ac130_flares.vfx");
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x458d
// Size: 0x3d
function function_4fb6f74e053a49d6() {
    level.nosuspensemusic = 1;
    if (getdvarint(@"hash_9c43b60485fbd92e", 0) != 1) {
        level waittill("prematch_fade_done");
    } else {
        wait(5);
    }
    function_f1aed36ab4598ea("mp_gamemode_dmz");
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45d1
// Size: 0xa
function function_f269438f48049613() {
    level endon("game_ended");
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45e2
// Size: 0x282
function initpostmain() {
    level endon("game_ended");
    level.var_f38e7b13448998b4 = &function_f38e7b13448998b4;
    if (getdvarint(@"hash_ff65c25889692db8", 0) == 0) {
        namespace_71073fa38f11492::registerbrgametypefunc("infilSequence", &function_73bdf8b18e29b13f);
    }
    namespace_3c37cb17ade254d::registersharedfunc("hud", "showDMZSplash", &namespace_d696adde758cbe79::showdmzsplash);
    namespace_3c37cb17ade254d::registersharedfunc("inventory", "isBackpackInventoryEnabled", &namespace_aead94004cf4c147::isbackpackinventoryenabled);
    waittillframeend();
    namespace_4b0406965e556711::gameflaginit("start_fortress_spawns", 0);
    nojip = getdvarint(@"hash_c26ef34f769bd14f", 1) == 1;
    setnojiptime(nojip, 1);
    setnojipscore(nojip, 1);
    level.nojip = nojip;
    if (!nojip) {
        level thread function_ffc9bebe581e6fa();
    }
    level thread namespace_18e0fd353e69a0b2::function_d197edbd2618c9d1();
    level.getspawnpoint = &getspawnpoint;
    level.var_c11104510d66e98 = &getspawnpoint;
    level.modemayconsiderplayerdead = &brmayconsiderplayerdead;
    level.brmodevariantrewardcullfunc = &function_3acbbd83af4bcd34;
    level.ononeleftevent = &function_7ce541f0d7227ab;
    level.onplayerdisconnect = &onplayerdisconnect;
    level.onplayerkilled = &onplayerkilled;
    level.onpostkillcamcallback = &onpostkillcamcallback;
    level.ontimelimit = &ontimelimit;
    level.bypassclasschoicefunc = &pickclassbr;
    level.validautoassignquests = [];
    level.validautoassignquests[0] = "assassination";
    level.validautoassignquests[1] = "domination";
    level.validautoassignquests[2] = "scavenger";
    level thread namespace_244fdc99ed0f5d2b::function_df15f72187363229();
    if (issharedfuncdefined("dmz_bosses", "initBosses")) {
        level thread [[ getsharedfunc("dmz_bosses", "initBosses") ]]();
    }
    level thread namespace_7afff53e7b73476b::function_ad4172a44f169cb6();
    level thread namespace_abc7ed0cde8527d4::function_3e18070e9c4c07db();
    if (level.var_eef1d450c2d5d682) {
        level thread function_d8431975bbec1179();
    }
    if (level.mapname != "mp_ai_firefight") {
        namespace_8fb3ba83379e798c::init();
    }
    if (!namespace_36f464722d326bbe::function_ffbbb4525b11d5a2()) {
        level.var_1a6c1600565c49a = &namespace_e0526929a9f43046::function_df0fe5ac51164868;
    }
    namespace_3a88b1955556fd::function_209b4f3cbe639411();
    namespace_14d36171baccf528::function_9ec5f9cfc835208e();
    level thread function_11750957aa915a23();
    level thread eomawardplayerxp();
    level thread function_d236513e49e4e740();
    level thread namespace_9823ee6035594d67::function_b6db5c2031ed059a();
    level thread namespace_58dcf42cf567f34f::init();
    level thread namespace_58dcf42cf567f34f::function_2a56c656879dbf63();
    level thread namespace_58dcf42cf567f34f::function_a894d6041798cc06();
    level thread namespace_c39580665208f0a4::function_83599506981c29cd();
    level thread function_3403c13cec1cea46();
    level thread namespace_232c174d637e4b1d::function_9c85640063aa1a62();
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x486b
// Size: 0x40
function function_ffc9bebe581e6fa() {
    var_b2b90c3aad0f71a4 = getdvarint(@"hash_56bec729cfb5d24c", 300);
    wait(var_b2b90c3aad0f71a4);
    setnojiptime(1, 1);
    setnojipscore(1, 1);
    level.nojip = 1;
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x48b2
// Size: 0x3
function function_811855d1edeef614() {
    
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48bc
// Size: 0x15a
function function_f16652e1462a3739() {
    if (getdvarint(@"hash_973e5e3debca8d24", 0) != 1) {
        level.var_428703950599c9e9 = &namespace_b27abd42d87cb8c0::function_428703950599c9e9;
        namespace_bfef6903bca5845d::init();
        level thread namespace_b27abd42d87cb8c0::init();
        level thread namespace_43bf74a2ee9234c0::function_7f4d3080c6e8748b();
        level thread namespace_7ae25d9e5d5a28ef::function_d0ffcd08e0870cf2();
        level thread namespace_885300a47c2b51e6::function_ca39a413ace3c168();
        level thread namespace_ab6776a0c2e19905::function_48e19aa598e95954();
        namespace_3c37cb17ade254d::registersharedfunc("paraReinforce", "onChutePull", &namespace_885300a47c2b51e6::function_6a8ad55c5a4036d1);
        var_8c3ec2d4f32359d0 = getdvarint(@"hash_878b14b03d2a762", 1);
        if (var_8c3ec2d4f32359d0) {
            namespace_d2c35aa0ab3fe2d2::function_a9e26388b8dc22b3();
        }
        namespace_bfef6903bca5845d::function_2fc80954fa70d153();
        if (var_8c3ec2d4f32359d0) {
            level thread namespace_d2c35aa0ab3fe2d2::function_cbae2bd62d2e7086();
        }
        level thread namespace_e5a48e48e132c025::function_2e887982267d85a8();
        /#
            level thread namespace_d2c35aa0ab3fe2d2::function_6994a068636ec457();
        #/
        if (!istrue(level.var_4cfd75aa6ddde156) || getdvarint(@"hash_6c875cdb8f27302e", 0) == 1) {
            if (issharedfuncdefined("dmz_bosses", "spawnMatchStartBosses")) {
                level thread [[ getsharedfunc("dmz_bosses", "spawnMatchStartBosses") ]]();
            }
        }
        namespace_bfef6903bca5845d::function_80cd0109b7f5161d();
        namespace_4b0406965e556711::gameflagset("start_fortress_spawns");
        level thread namespace_bfef6903bca5845d::function_b4367b762ab15e1f();
        if (getdvarint(@"hash_5fc378f6fc9470f7", 0)) {
            level thread namespace_c50aac14f506294b::function_918a46f20addf647();
        }
        level thread namespace_bfef6903bca5845d::function_51014d65a15cf0f9();
    } else {
        /#
            level thread namespace_bfef6903bca5845d::function_576ed049f93d9496();
        #/
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a1d
// Size: 0x47
function onplayerconnect(player) {
    player setclientomnvar("ui_br_infiled", 1);
    if (namespace_244fdc99ed0f5d2b::function_5ea5a722c499078f(player.team)) {
        namespace_244fdc99ed0f5d2b::function_64623e2ff7409f39(player, 0);
    }
    namespace_7789f919216d38a2::function_1509b788f4410b94(player);
    namespace_14d36171baccf528::function_3a458af8ab69f4e(player);
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a6b
// Size: 0x4e
function function_26f93cc0ad9b7c39() {
    self endon("disconnect");
    function_2fe5ef40dc48daf0();
    if (getdvarint(@"hash_8da4a5e690432cd0", 1) == 0) {
        return;
    }
    if (!self istacmapactive()) {
        self setclientomnvar("ui_dmz_mission_overlay", 1);
    }
    wait(1);
    self setclientomnvar("ui_dmz_mission_overlay", 0);
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ac0
// Size: 0x178
function function_2fe5ef40dc48daf0() {
    self endon("tac_map_toggle");
    self endon("disconnect");
    self endon("screen_completely_black");
    while (!self istacmapactive()) {
        if (isdefined(self) && isdefined(self.origin)) {
            if (namespace_37f0fb6355a4618a::function_47d356083884f913() && isdefined(level.teamdata) && isdefined(self.team) && isdefined(level.teamdata[self.team]) && isdefined(level.teamdata[self.team]["startPoint"]) && isdefined(level.teamdata[self.team]["startPoint"].poi)) {
                poi = level.teamdata[self.team]["startPoint"].poi;
                var_bef13f1e36d7dcd9 = namespace_37f0fb6355a4618a::function_d2ed76e2bedd339e(poi);
                if (isdefined(var_bef13f1e36d7dcd9) && distance(var_bef13f1e36d7dcd9, self.origin) < 13000) {
                    namespace_d20f8ef223912e12::function_258c4f40dee8189a(var_bef13f1e36d7dcd9[0], var_bef13f1e36d7dcd9[1], 1);
                } else {
                    namespace_d20f8ef223912e12::function_258c4f40dee8189a(self.origin[0], self.origin[1], 1);
                }
            } else {
                namespace_d20f8ef223912e12::function_258c4f40dee8189a(self.origin[0], self.origin[1], 1);
            }
        }
        wait(1);
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c3f
// Size: 0x50
function brmayconsiderplayerdead(player) {
    if (isdefined(level.checkforlaststandwipe)) {
        [[ level.checkforlaststandwipe ]](player);
    }
    if (istrue(self.squadwiped)) {
        player setplayermusicstate("mp_lose_2");
        namespace_25b25d188ef778c4::function_2eda2621150bd589([0:player], 4);
    }
    return 1;
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c97
// Size: 0x19
function function_3acbbd83af4bcd34(rewards) {
    var_36f04620526242ff = [];
    return var_36f04620526242ff;
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cb8
// Size: 0xec
function filtervehiclespawnstructs(var_7a2113183150c910) {
    if (getdvarint(@"hash_2cc531e644d4fdb3", 1) == 0) {
        return var_7a2113183150c910;
    }
    if (!namespace_37f0fb6355a4618a::function_7e9cbc0f32de6578()) {
        return [];
    }
    if (!isdefined(level.var_ab20b3a256911579) || level.var_ab20b3a256911579.size == 0) {
        return var_7a2113183150c910;
    }
    var_7cb19f95dbc68942 = [];
    foreach (struct in var_7a2113183150c910) {
        if (!isdefined(struct.origin)) {
            continue;
        }
        poi = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(struct.origin, 1);
        if (array_contains(level.var_ab20b3a256911579, poi)) {
            continue;
        }
        var_7cb19f95dbc68942[var_7cb19f95dbc68942.size] = struct;
    }
    return var_7cb19f95dbc68942;
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4dac
// Size: 0xc
function function_7ce541f0d7227ab(team) {
    
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4dbf
// Size: 0xed
function onplayerdisconnect(player) {
    if (getdvarint(@"hash_8f63416f53600636", 1) && function_ad443bbcdcf37b85(player) && !istrue(player.extracted) && !istrue(player.var_ded04cdd264a7e00)) {
        if (namespace_aead94004cf4c147::function_720d227d0e55a960()) {
            namespace_85cd45b4fe0d86fb::function_f6d685cabfad2ce9(player);
        }
        dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
        player namespace_aead94004cf4c147::function_c6b3799b231916bb(player, dropstruct);
        if (namespace_cb965d2f71fefddc::function_990be1aa4ad3c9d4()) {
            player namespace_cb965d2f71fefddc::function_c15a28fc6247ad60(dropstruct);
        }
    } else {
        player namespace_a8b2b88699fc40fb::function_c320904c58171311();
        if (isdefined(player.var_5f6d702bc79161f8)) {
            namespace_5a22b6f3a56f7e9b::returnobjectiveid(player.var_5f6d702bc79161f8);
        }
    }
    if (!istrue(player.extracted) && !istrue(player.var_ded04cdd264a7e00)) {
        namespace_aad14af462a74d08::function_b8e86c6dea0ac027(player);
    }
    function_c227bd210d16e07c(player);
    level thread function_da0fa1afaa8835cf();
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4eb3
// Size: 0xbc
function function_c227bd210d16e07c(player) {
    if (istrue(player.var_84d661ff601a2f9f)) {
        return;
    }
    if (istrue(player.var_ded04cdd264a7e00)) {
        if (namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
            namespace_a38a2e1fe7519183::function_cd234cdd6b1b3699(player);
        }
    } else if (!istrue(player.extracted)) {
        if (namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7() && namespace_a38a2e1fe7519183::function_dedf2039edee97d0()) {
            namespace_a38a2e1fe7519183::function_868b6d4fbec3938c(player);
        } else {
            player namespace_aead94004cf4c147::function_5c5e6619f0b24f90();
            namespace_aead94004cf4c147::function_954372d604277278(player);
        }
        namespace_aad14af462a74d08::function_868b6d4fbec3938c(player);
    } else {
        namespace_a38a2e1fe7519183::function_2495dd1dde4756fb(player);
        namespace_a38a2e1fe7519183::function_ea65e35c77f7679b(player);
    }
    player.var_84d661ff601a2f9f = 1;
    if (!istrue(player.var_ded04cdd264a7e00)) {
        namespace_8361bad7391de074::function_b0ca76f04ad0e0c3(player);
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f76
// Size: 0x118
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    namespace_d20f8ef223912e12::onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00);
    if (!istrue(level.var_fc90401f4ae3f765)) {
        self.class = "gamemode";
        self.pers["gamemodeLoadout"] = [];
        namespace_d19129e4fa5d176::respawnitems_clear();
    }
    var_f3990d8529de3a54 = namespace_aead94004cf4c147::function_c4f1bd7a01a307fa(self);
    namespace_aead94004cf4c147::function_5c5e6619f0b24f90(var_f3990d8529de3a54);
    namespace_aead94004cf4c147::function_954372d604277278(self);
    if (isdefined(self.var_5f6d702bc79161f8)) {
        attacker namespace_c50aac14f506294b::function_a5d597201278c71c(self);
    }
    if (namespace_71073fa38f11492::isfeatureenabled("pleaForHelp")) {
        self thread [[ namespace_3c37cb17ade254d::getsharedfunc("pleaForHelp", "callForHelp") ]]();
    }
    namespace_1bfb3e255db0a9f1::function_47ef2434c27b063c(self, attacker, smeansofdeath);
    level thread function_da0fa1afaa8835cf();
    level thread function_265afd733ff97699(self);
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5095
// Size: 0xa8
function function_265afd733ff97699(var_f99d56bcb582a8ba) {
    var_f99d56bcb582a8ba notify("revive_timer_watch");
    var_f99d56bcb582a8ba endon("revive_timer_watch");
    var_f99d56bcb582a8ba endon("revivedAlive");
    var_f99d56bcb582a8ba endon("restored_loot");
    var_f99d56bcb582a8ba endon("disconnect");
    level endon("game_ended");
    if (!isdefined(var_f99d56bcb582a8ba.team) || !isdefined(var_f99d56bcb582a8ba.var_ff97225579de16a)) {
        return;
    }
    wait(getdvarint(@"hash_9a366844ff95b5d7", 90));
    teamplayers = namespace_54d20dd0dd79277f::getsquadmates(var_f99d56bcb582a8ba.team, var_f99d56bcb582a8ba.var_ff97225579de16a, 1);
    if (teamplayers.size <= 1) {
        return;
    }
    namespace_446fc987a980892f::function_d87d5deb069bf8e5("squad_revive_reminder", teamplayers);
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5144
// Size: 0x41
function function_1714ffea633dcfed(team) {
    if (team == "all" || !namespace_51790b5acb47a506::function_4db915a9ce0e903a() || !getdvarint(@"hash_a5bfce6c742aa583", 1)) {
        return 0;
    }
    thread function_ed7a5462253ebdef(team);
    return 1;
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x518d
// Size: 0xa9
function function_ed7a5462253ebdef(team) {
    level endon("game_ended");
    namespace_244fdc99ed0f5d2b::function_adc51ade78872d95(team);
    players = namespace_54d20dd0dd79277f::getteamdata(team, "players");
    foreach (player in players) {
        if (!namespace_51790b5acb47a506::ispleading(player)) {
            player notify("check_for_plea");
            waitframe();
            if (!namespace_51790b5acb47a506::function_bfdfd3c9ba0cc7cb(player)) {
                thread function_74e0aae435a09a51(player);
            } else {
                thread function_5df318837f8d78a2(player);
            }
        }
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x523d
// Size: 0x25a
function function_74e0aae435a09a51(player) {
    namespace_25b25d188ef778c4::function_2eda2621150bd589([0:player], 4);
    player.squadwiped = 1;
    if (!istrue(player.extracted) && namespace_3c37cb17ade254d::issharedfuncdefined("dmz_bosses", "onPlayerSquadWiped")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("dmz_bosses", "onPlayerSquadWiped") ]](player);
    }
    player setclientomnvar("ui_league_play_br_leave_penalty_timer", 0);
    remainingteams = [];
    remainingplayers = 0;
    foreach (entry in level.teamnamelist) {
        if (entry == player.team) {
            continue;
        }
        var_849d01afb2fc0f0a = namespace_d20f8ef223912e12::function_99e3948bfd8a99b8(entry);
        if (var_849d01afb2fc0f0a > 0) {
            remainingteams[remainingteams.size] = entry;
            remainingplayers = remainingplayers + var_849d01afb2fc0f0a;
        }
    }
    teamplacement = remainingteams.size + 1;
    var_57ac4dc40b2e376 = player namespace_d20f8ef223912e12::calculatebrbonusxp(teamplacement, player.team);
    var_d6a23fdabd1d282c = var_57ac4dc40b2e376[2];
    var_1b70c48b930405f0 = var_57ac4dc40b2e376[1];
    var_b5d67493fb854f58 = var_57ac4dc40b2e376[0];
    var_b01aca3236595958 = namespace_b5e6108f786dfb5a::function_87ecb716bc207294(player);
    player namespace_d20f8ef223912e12::givebrbonusxp(var_b5d67493fb854f58, undefined, "squadEliminated", var_b01aca3236595958);
    player.matchbonus = namespace_62c556437da28f50::function_c18c8bb0776284c6(var_1b70c48b930405f0, var_b01aca3236595958);
    player.placementbonus = namespace_62c556437da28f50::function_9e1336d25eb66326(var_d6a23fdabd1d282c, var_b01aca3236595958);
    player thread namespace_d20f8ef223912e12::handlebrdefeatedpostgamestate(teamplacement);
    player namespace_d20f8ef223912e12::setplacementstats(teamplacement);
    player namespace_d20f8ef223912e12::stopchallengetimers();
    namespace_d576b6dc7cef9c62::_setplayerteamrank(player, teamplacement);
    namespace_d20f8ef223912e12::updateclientmatchdata(player);
    if (istrue(level.var_77907d733abe8b63)) {
        player namespace_2c7976a64ea24d6a::match_end(teamplacement, 1, 0);
    }
    result = undefined;
    if (istrue(player.pers["hasDoneAnyCombat"]) || istrue(player.pers["participation"])) {
        result = "eliminated";
    }
    player namespace_36f464722d326bbe::stopkeyearning(result);
    function_eb1a045a6d299c6a();
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x549e
// Size: 0x90
function function_4253eec492c87aa() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("spawned");
    starttime = gettime();
    if (level.killcam) {
        while (!isdefined(self.var_7c813e50ff75be27)) {
            timeelapsed = gettime() - starttime;
            if (timeelapsed >= 1000) {
                return;
            }
            waitframe();
        }
        if (level.killcam && istrue(self.killcam)) {
            waittill_any_3("killcam_ended", "killcam_canceled", "abort_killcam");
        }
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5535
// Size: 0x133
function function_5df318837f8d78a2(player) {
    player notify("waiting_for_plea");
    level endon("game_ended");
    player endon("disconnect");
    player endon("revivedAlive");
    player endon("waiting_for_plea");
    player endon("plea_created");
    teammates = getteamdata(player.team, "players");
    foreach (member in teammates) {
        if (isdefined(member)) {
            member endon("spawned_player");
        }
    }
    player setclientomnvar("ui_show_spectateHud", player getentitynumber());
    player.var_7c813e50ff75be27 = undefined;
    player function_4253eec492c87aa();
    waitframe();
    player setclientomnvar("ui_waiting_for_aar", 1);
    endtime = int(gettime() + getdvarint(@"hash_e323d1171dab7bff", 20) * 1000);
    player.var_6af52e47cbd09141 = endtime;
    player namespace_58fb4f2e73fd41a0::setlowermessageomnvar("plea_time", endtime);
    namespace_51790b5acb47a506::function_d8b32f106816afc1(player);
    thread function_74e0aae435a09a51(player);
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x566f
// Size: 0x289
function function_d056e6d06ba65ca8(player) {
    namespace_25b25d188ef778c4::function_2eda2621150bd589([0:player], 4);
    player.squadwiped = 1;
    if (!istrue(player.extracted) && namespace_3c37cb17ade254d::issharedfuncdefined("dmz_bosses", "onPlayerSquadWiped")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("dmz_bosses", "onPlayerSquadWiped") ]](player);
    }
    player setclientomnvar("ui_league_play_br_leave_penalty_timer", 0);
    remainingteams = [];
    remainingplayers = 0;
    foreach (entry in level.teamnamelist) {
        if (entry == player.team) {
            continue;
        }
        var_849d01afb2fc0f0a = namespace_d20f8ef223912e12::function_99e3948bfd8a99b8(entry);
        if (var_849d01afb2fc0f0a > 0) {
            remainingteams[remainingteams.size] = entry;
            remainingplayers = remainingplayers + var_849d01afb2fc0f0a;
        }
    }
    teamplacement = remainingteams.size + 1;
    var_c00a2d6249962fb6 = player namespace_d20f8ef223912e12::calculatebrbonusxp(teamplacement, player.team);
    var_d6a23fdabd1d282c = var_c00a2d6249962fb6[2];
    var_1b70c48b930405f0 = var_c00a2d6249962fb6[1];
    var_b5d67493fb854f58 = var_c00a2d6249962fb6[0];
    var_b01aca3236595958 = namespace_b5e6108f786dfb5a::function_87ecb716bc207294(player);
    player namespace_d20f8ef223912e12::givebrbonusxp(var_b5d67493fb854f58, undefined, "squadEliminated", var_b01aca3236595958);
    player.matchbonus = namespace_62c556437da28f50::function_c18c8bb0776284c6(var_1b70c48b930405f0, var_b01aca3236595958);
    player.placementbonus = namespace_62c556437da28f50::function_9e1336d25eb66326(var_d6a23fdabd1d282c, var_b01aca3236595958);
    if (issharedfuncdefined("seasonalevents", "getFieldRepEventActive")) {
        if (function_f3bb4f4911a1beb2("seasonalevents", "getFieldRepEventActive")) {
            function_3f2ab7272697e5b8(player);
        }
    }
    player thread namespace_d20f8ef223912e12::handlebrdefeatedpostgamestate(teamplacement);
    player namespace_d20f8ef223912e12::setplacementstats(teamplacement);
    player namespace_d20f8ef223912e12::stopchallengetimers();
    namespace_d576b6dc7cef9c62::_setplayerteamrank(player, teamplacement);
    namespace_d20f8ef223912e12::updateclientmatchdata(player);
    if (istrue(level.var_77907d733abe8b63)) {
        player namespace_2c7976a64ea24d6a::match_end(teamplacement, 1, 0);
    }
    result = undefined;
    if (istrue(player.pers["hasDoneAnyCombat"]) || istrue(player.pers["participation"])) {
        result = "eliminated";
    }
    player namespace_36f464722d326bbe::stopkeyearning(result);
    function_eb1a045a6d299c6a();
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58ff
// Size: 0x15b
function function_adc51ade78872d95(team) {
    if (team == "all") {
        foreach (player in level.players) {
            if (isdefined(player)) {
                player.squadwiped = 1;
                player thread namespace_d20f8ef223912e12::handlebrdefeatedpostgamestate();
                player namespace_d20f8ef223912e12::stopchallengetimers();
                namespace_25b25d188ef778c4::function_2eda2621150bd589([0:player], 4);
                namespace_d20f8ef223912e12::updateclientmatchdata(player);
            }
        }
    } else {
        players = namespace_54d20dd0dd79277f::getteamdata(team, "players");
        namespace_25b25d188ef778c4::function_2eda2621150bd589(players, 4);
        foreach (var_736d8d9188ccbd45 in players) {
            var_736d8d9188ccbd45.squadwiped = 1;
            if (!istrue(var_736d8d9188ccbd45.extracted)) {
                if (namespace_3c37cb17ade254d::issharedfuncdefined("dmz_bosses", "onPlayerSquadWiped")) {
                    [[ namespace_3c37cb17ade254d::getsharedfunc("dmz_bosses", "onPlayerSquadWiped") ]](var_736d8d9188ccbd45);
                }
            }
        }
        namespace_244fdc99ed0f5d2b::function_adc51ade78872d95(team);
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a61
// Size: 0x3f
function function_f1ad30efc5733caf() {
    self notify("reconcileLoot");
    self endon("reconcileLoot");
    self endon("disconnect");
    self endon("restored_loot");
    level endon("game_ended");
    self waittill("revivedAlive");
    thread function_f0e913c037010a9();
    thread function_707d956bdbd4b134();
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5aa7
// Size: 0xd8e
function function_707d956bdbd4b134() {
    self notify("restored_loot");
    self endon("death");
    self endon("disconnect");
    level endon("game_ended");
    namespace_a38a2e1fe7519183::function_f30f21d87c483297(self);
    self.var_4f7710ecff5b1619 = undefined;
    self.var_457667014505e1f9 = undefined;
    if (isdefined(self.var_ba19d6a40e652dd6)) {
        var_176ecfacee5f2ef4 = self.var_ba19d6a40e652dd6;
        var_bf334f5702551108 = self.var_cd82e790e825db2;
        if (istrue(level.var_813b4b2211fbaf1d) && isdefined(self.var_6a4360dcf2a8f3d4) && isdefined(self.var_6a4360dcf2a8f3d4.var_bf23a60678978c19) && isdefined(self.var_6a4360dcf2a8f3d4.var_bf23a60678978c19[9]) && !istrue(self.var_6a4360dcf2a8f3d4.var_bf23a60678978c19[9]["lootID"])) {
            var_bf334f5702551108 = undefined;
            var_176ecfacee5f2ef4 = 5;
        }
        namespace_aead94004cf4c147::function_d28f52da6ede0191(self, var_176ecfacee5f2ef4, undefined, var_bf334f5702551108);
        if (isdefined(var_bf334f5702551108)) {
            namespace_a38a2e1fe7519183::function_92d947129ea5ba6e(self, var_bf334f5702551108);
        }
    }
    if (isdefined(self.var_6a4360dcf2a8f3d4) && isdefined(self.var_6a4360dcf2a8f3d4.contents)) {
        backpacksize = namespace_aead94004cf4c147::function_b13e35608b336d65(self);
        var_65b695f0c0d909ed = 0;
        dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
        foreach (item in self.var_6a4360dcf2a8f3d4.contents) {
            if (isdefined(item)) {
                lootid = item["lootID"];
                quantity = item["quantity"];
                if (var_65b695f0c0d909ed >= backpacksize && lootid > 0 && quantity > 0) {
                    if (!getdvarint(@"hash_f48ef3a11b86b06d", 1)) {
                        break;
                    }
                    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, self.origin, self.angles, self);
                    scriptablename = namespace_38b993c4618e76cd::getscriptablefromlootid(lootid);
                    var_87583859f07b58e3 = namespace_cb965d2f71fefddc::spawnpickup(scriptablename, var_cb4fad49263e20c4, quantity, 1);
                } else {
                    namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2(lootid, "pickedUp", self.var_6a4360dcf2a8f3d4, self);
                    namespace_aead94004cf4c147::function_11f48ae5b87b4525(self, var_65b695f0c0d909ed, lootid, quantity);
                }
                var_65b695f0c0d909ed++;
            }
        }
        if (isdefined(self.var_6a4360dcf2a8f3d4.var_4f6cde716e0c3d7) && isdefined(self.var_6a4360dcf2a8f3d4.var_6fb67c8525b1d79e)) {
            weapon = self.var_6a4360dcf2a8f3d4.var_6fb67c8525b1d79e;
            namespace_aead94004cf4c147::function_e35a7cb7e7c8c17e(self, weapon, undefined, self.var_6a4360dcf2a8f3d4.metadata);
            namespace_3bcd40a3005712ec::function_ae30366a2d519a57(self, 2, self.var_6a4360dcf2a8f3d4.var_275f4441ab7920c8);
        }
        if (!istrue(level.var_813b4b2211fbaf1d)) {
            namespace_cb965d2f71fefddc::loothide(self.var_6a4360dcf2a8f3d4);
        }
    }
    var_ebc7c27c25633bb7 = undefined;
    if (!istrue(level.var_51225d738094457d) && isdefined(self.var_d2dbb2fa012e6d9c)) {
        weaponcount = 0;
        isweaponpickup = 0;
        foreach (key, item in self.var_d2dbb2fa012e6d9c) {
            if (isdefined(item)) {
                if (isdefined(item.customweaponname) && !namespace_3bbb5a98b932c46f::isfistweapon(item.customweaponname)) {
                    if (!isdefined(var_ebc7c27c25633bb7)) {
                        var_ebc7c27c25633bb7 = item.customweaponname;
                    }
                    weaponcount++;
                    isweaponpickup = 1;
                } else if (isdefined(item.type) && isdefined(level.br_lootiteminfo) && isdefined(level.br_lootiteminfo[item.type]) && isdefined(level.br_lootiteminfo[item.type].fullweaponname) && !namespace_3bbb5a98b932c46f::isfistweapon(level.br_lootiteminfo[item.type].fullweaponname)) {
                    if (!isdefined(var_ebc7c27c25633bb7)) {
                        var_ebc7c27c25633bb7 = level.br_lootiteminfo[item.type].fullweaponname;
                    }
                    weaponcount++;
                    isweaponpickup = 1;
                }
                if (weaponcount == 3 && isweaponpickup) {
                    weaponcount = 0;
                    pickup = spawnstruct();
                    pickup.scriptablename = item.type;
                    pickup.count = namespace_cb965d2f71fefddc::loot_getitemcount(item);
                    pickup.countlefthand = namespace_cb965d2f71fefddc::loot_getitemcountlefthand(item);
                    pickup.var_e97d731bedd44c63 = namespace_cb965d2f71fefddc::function_3a5f7703319142dd(item);
                    pickup.instance = item;
                    if (isdefined(item.customweaponname)) {
                        pickup.customweaponname = item.customweaponname;
                    }
                    var_7f6369eca6d7c141 = namespace_3bcd40a3005712ec::function_55c5d35c8c76a95b(pickup);
                    newweapon = var_7f6369eca6d7c141[0];
                    namespace_aead94004cf4c147::function_e35a7cb7e7c8c17e(self, newweapon);
                    namespace_3bcd40a3005712ec::function_ae30366a2d519a57(self, 2, item.var_e1147886ccf51970);
                    namespace_cb965d2f71fefddc::loothide(item);
                } else {
                    namespace_cb965d2f71fefddc::lootused(item, item.type, "visible", self, 0, item.type);
                }
                self.var_d2dbb2fa012e6d9c[key] = undefined;
                isweaponpickup = 0;
            }
        }
    }
    if (istrue(level.var_51225d738094457d) && isdefined(self.var_77893f01ee39c62e) && isdefined(self.var_77893f01ee39c62e.contents)) {
        foreach (item in self.var_77893f01ee39c62e.contents) {
            if (isdefined(item)) {
                lootid = item["lootID"];
                quantity = item["quantity"];
                if (lootid == 0 || quantity == 0) {
                    continue;
                }
                if (namespace_85cd45b4fe0d86fb::function_3c17a26ce6a4668(lootid)) {
                    var_bffcbc62498722ae = namespace_85cd45b4fe0d86fb::getdogtagvictimandkiller(quantity);
                    _ = var_bffcbc62498722ae[1];
                    victimindex = var_bffcbc62498722ae[0];
                    if (isdefined(level.dogtaginfo[victimindex].player)) {
                        namespace_85cd45b4fe0d86fb::function_8e643d6706defeea(level.dogtaginfo[victimindex].player, quantity);
                    }
                    if (isdefined(level.var_547167a7517600fb) && isdefined(level.var_547167a7517600fb.var_5b72b9e0891944ae)) {
                        [[ level.var_547167a7517600fb.var_5b72b9e0891944ae ]](self);
                    }
                } else {
                    namespace_cb965d2f71fefddc::function_fe539e37b6579930(lootid, quantity);
                }
            }
        }
        if (isdefined(self.var_77893f01ee39c62e.var_4f6cde716e0c3d7) && isdefined(self.var_77893f01ee39c62e.var_6fb67c8525b1d79e)) {
            weapon = self.var_77893f01ee39c62e.var_6fb67c8525b1d79e;
            fullname = getcompleteweaponname(weapon);
            basename = undefined;
            if (isdefined(weapon.basename)) {
                basename = weapon.basename;
            } else {
                basename = getweaponbasename(weapon);
            }
            success = namespace_3bcd40a3005712ec::br_forcegivecustomweapon(self, weapon, fullname, basename, undefined, undefined, undefined, self.var_77893f01ee39c62e.metadata);
            weaponindex = namespace_3bcd40a3005712ec::function_2ab3bda08c595a32(self, weapon);
            if (isdefined(weaponindex)) {
                namespace_3bcd40a3005712ec::function_ae30366a2d519a57(self, weaponindex, self.var_77893f01ee39c62e.var_275f4441ab7920c8);
            }
        }
        namespace_cb965d2f71fefddc::loothide(self.var_77893f01ee39c62e);
    }
    if (istrue(level.var_813b4b2211fbaf1d)) {
        if (isdefined(self.var_d2dbb2fa012e6d9c) && self.var_d2dbb2fa012e6d9c.size > 0) {
            self.var_c7fd13c53dbdc4f6 = 1;
            foreach (item in self.var_d2dbb2fa012e6d9c) {
                namespace_cb965d2f71fefddc::lootused(item, item.type, "visible", self, 0, item.type);
            }
            self.var_c7fd13c53dbdc4f6 = undefined;
            self.var_d2dbb2fa012e6d9c = [];
        }
        if (isdefined(self.var_6a4360dcf2a8f3d4) && isdefined(self.var_6a4360dcf2a8f3d4.var_bf23a60678978c19)) {
            foreach (item in self.var_6a4360dcf2a8f3d4.var_bf23a60678978c19) {
                if (isdefined(item)) {
                    lootid = item["lootID"];
                    quantity = item["quantity"];
                    if (lootid == 0 || quantity == 0) {
                        continue;
                    }
                    scriptablename = namespace_38b993c4618e76cd::getscriptablefromlootid(lootid);
                    if (namespace_85cd45b4fe0d86fb::function_3c17a26ce6a4668(lootid)) {
                        var_bffcc16249872dad = namespace_85cd45b4fe0d86fb::getdogtagvictimandkiller(quantity);
                        _ = var_bffcc16249872dad[1];
                        victimindex = var_bffcc16249872dad[0];
                        if (isdefined(level.dogtaginfo[victimindex].player)) {
                            namespace_85cd45b4fe0d86fb::function_8e643d6706defeea(level.dogtaginfo[victimindex].player, quantity);
                        }
                        if (isdefined(level.var_547167a7517600fb) && isdefined(level.var_547167a7517600fb.var_5b72b9e0891944ae)) {
                            [[ level.var_547167a7517600fb.var_5b72b9e0891944ae ]](self);
                        }
                    } else if (namespace_cb965d2f71fefddc::function_b1e944a2b3e15e9d(scriptablename)) {
                        continue;
                    } else {
                        if (namespace_d3d40f75bb4e4c32::isarmorplate(scriptablename)) {
                            self.var_d4bfb0d4d797f448 = 1;
                        }
                        namespace_cb965d2f71fefddc::function_fe539e37b6579930(lootid, quantity);
                    }
                }
            }
            if (isdefined(self.var_6a4360dcf2a8f3d4.var_a06e7128c001851d) && isdefined(self.var_6a4360dcf2a8f3d4.var_a0e9fef038504bd0)) {
                weapon = self.var_6a4360dcf2a8f3d4.var_a0e9fef038504bd0;
                fullname = getcompleteweaponname(weapon);
                basename = undefined;
                if (isdefined(weapon.basename)) {
                    basename = weapon.basename;
                } else {
                    basename = getweaponbasename(weapon);
                }
                success = namespace_3bcd40a3005712ec::br_forcegivecustomweapon(self, weapon, fullname, basename, undefined, undefined, undefined, self.var_6a4360dcf2a8f3d4.var_bb6791b7369ef71a);
                weaponindex = namespace_3bcd40a3005712ec::function_2ab3bda08c595a32(self, weapon);
                if (isdefined(weaponindex)) {
                    namespace_3bcd40a3005712ec::function_ae30366a2d519a57(self, weaponindex, self.var_6a4360dcf2a8f3d4.var_c31356a794d8cb46);
                }
            }
        }
        if (isdefined(self.var_6a4360dcf2a8f3d4)) {
            namespace_cb965d2f71fefddc::loothide(self.var_6a4360dcf2a8f3d4);
        }
    }
    if (istrue(level.var_51225d738094457d)) {
        if (isdefined(self.var_3480393dc131952a)) {
            item = self.var_3480393dc131952a;
            if (!isdefined(var_ebc7c27c25633bb7)) {
                if (isdefined(item.customweaponname) && !namespace_3bbb5a98b932c46f::isfistweapon(item.customweaponname)) {
                    var_ebc7c27c25633bb7 = item.customweaponname;
                } else if (isdefined(item.type) && isdefined(level.br_lootiteminfo) && isdefined(level.br_lootiteminfo[item.type]) && isdefined(level.br_lootiteminfo[item.type].fullweaponname) && !namespace_3bbb5a98b932c46f::isfistweapon(level.br_lootiteminfo[item.type].fullweaponname)) {
                    var_ebc7c27c25633bb7 = level.br_lootiteminfo[item.type].fullweaponname;
                }
            }
            namespace_cb965d2f71fefddc::lootused(item, item.type, "visible", self, 0, item.type);
        }
        if (isdefined(self.dogtag) && !istrue(level.var_813b4b2211fbaf1d)) {
            namespace_cb965d2f71fefddc::lootused(self.dogtag, self.dogtag.type, "visible", self, 0, self.dogtag.type);
        }
    }
    if (isdefined(self.var_73bb45340691326c)) {
        self.br_ammo = self.var_73bb45340691326c;
        namespace_3bcd40a3005712ec::br_ammo_update_weapons(self);
    }
    if (istrue(level.var_51225d738094457d) && isdefined(self.var_620f2a17df977448)) {
        item = self.var_620f2a17df977448;
        namespace_cb965d2f71fefddc::lootused(item, item.type, "visible", self, 0, item.type);
    }
    self.dogtag = undefined;
    waitframe();
    if (isdefined(var_ebc7c27c25633bb7) && self hasweapon(var_ebc7c27c25633bb7)) {
        self switchtoweaponimmediate(var_ebc7c27c25633bb7);
    }
    if (isdefined(self.equipment) && !isdefined(self.equipment["health"])) {
        namespace_f8d3520d3483c1::function_be5c0cdfa0202544();
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x683c
// Size: 0xc0
function function_c3f3fceeddda6f6(var_c2fc8bf80c1b0aa2) {
    /#
        assertex(isplayer(self), "attachBag() should only be called on a Player Entity type ");
    #/
    if (!getdvarint(@"hash_df3d4c7861e822b4", 1)) {
        return;
    }
    if (isdefined(self.attached_bag)) {
        function_6d569066ac5f3df0();
    }
    self attach(var_c2fc8bf80c1b0aa2, "tag_stowed_back3", 1, 1);
    if (!isdefined(self.operatorcustomization) || !isdefined(self.operatorcustomization.body) || self.operatorcustomization.body != "body_mp_gus_iw9_1_1") {
        if (self tagexists("TAG_STOWED_BACKPACK_HIDE")) {
            self hidepart("TAG_STOWED_BACKPACK_HIDE");
        }
    }
    self.attached_bag = var_c2fc8bf80c1b0aa2;
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6903
// Size: 0x59
function function_6d569066ac5f3df0() {
    /#
        assertex(isplayer(self), "detachBag() should only be called on a Player Entity type ");
    #/
    if (!getdvarint(@"hash_df3d4c7861e822b4", 1) || !isdefined(self.attached_bag)) {
        return;
    }
    self detach(self.attached_bag, "tag_stowed_back3");
    self.attached_bag = undefined;
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6963
// Size: 0x3
function onpostkillcamcallback() {
    
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x696d
// Size: 0x40
function ontimelimit() {
    if (isdefined(level.var_aab9f6cfc50f372f)) {
        [[ level.var_aab9f6cfc50f372f ]]();
    } else if (!istrue(level.var_99eadae60b4b76e4)) {
        level thread namespace_7789f919216d38a2::function_a01f654e559ee5ec();
        level.var_99eadae60b4b76e4 = 1;
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69b4
// Size: 0x1ad
function checkendgame() {
    level endon("dmzDeathEnd");
    level waittill("dmz_radiation_complete");
    wait(level.var_ef3e0eb58d1263c5);
    var_5d292910802798b2 = 2;
    level.var_999d19ffa4f37df9 = 1;
    foreach (player in level.players) {
        if (isdefined(player) && isreallyalive(player) && !istrue(player.extracted)) {
            player thread function_fc71eb3ba70583a1(var_5d292910802798b2);
        }
    }
    if (isdefined(level.revivetriggers)) {
        foreach (guid, revivetrigger in level.revivetriggers) {
            if (isdefined(revivetrigger.victim)) {
                revivetrigger.victim thread namespace_7db13bdf599e41a6::removetrigger(guid);
            }
        }
    }
    wait(var_5d292910802798b2 + 5);
    level notify("dmzTimerEnd");
    foreach (player in level.players) {
        function_c227bd210d16e07c(player);
    }
    namespace_d576b6dc7cef9c62::endgame_regularmp("none", game["end_reason"]["time_limit_reached"], game["end_reason"]["time_limit_reached"]);
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b68
// Size: 0x7c
function function_fc71eb3ba70583a1(var_5d292910802798b2) {
    self endon("disconnect");
    utility::hidehudenable();
    level thread namespace_36f464722d326bbe::fadetoblackforplayer(self, 1, var_5d292910802798b2);
    wait(var_5d292910802798b2);
    namespace_446fc987a980892f::function_d87d5deb069bf8e5("exfil_none", [0:self]);
    self dodamage(999999, self.origin, self, undefined, "MOD_TRIGGER_HURT", "danger_circle_br");
    self freezecontrols(1);
    wait(2);
    utility::hidehuddisable();
    level thread namespace_36f464722d326bbe::fadetoblackforplayer(self, 0, 1);
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6beb
// Size: 0x17b
function function_da0fa1afaa8835cf() {
    level notify("checkEndGameDeathDmz");
    level endon("checkEndGameDeathDmz");
    level endon("dmzTimerEnd");
    wait(25);
    foreach (entry in level.teamnamelist) {
        alivecount = getteamdata(entry, "aliveCount");
        if (alivecount) {
            aliveplayers = getteamdata(entry, "alivePlayers");
            foreach (player in aliveplayers) {
                if (isdefined(player) && !istrue(player.extracted)) {
                    return;
                }
            }
        }
    }
    wait(1);
    foreach (player in level.players) {
        if (isdefined(player)) {
            function_c227bd210d16e07c(player);
        }
    }
    level notify("dmzDeathEnd");
    namespace_d576b6dc7cef9c62::endgame_regularmp("none", game["end_reason"]["time_limit_reached"], game["end_reason"]["time_limit_reached"]);
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6d6d
// Size: 0x3d
function function_ea8ed4c3ddc61883() {
    /#
        while (1) {
            if (getdvarint(@"hash_18ee31f4b5470139", 0) == 1) {
                ontimelimit();
                setdvar(@"hash_18ee31f4b5470139", 0);
            }
            wait(1);
        }
    #/
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6db1
// Size: 0x15f
function function_d236513e49e4e740() {
    var_f49539f37fc54aba = namespace_d576b6dc7cef9c62::gettimeremaining() / 1000 / 60;
    level.var_5ea7c93b496821ea = [];
    level.var_cca4e7f5433dd7d8 = 0;
    level.var_ccadf0f543480a51 = 0;
    level.var_ccadf3f5434810ea = 0;
    level.var_fc4b2bcc24f36e2a = 0;
    level.var_fc4b28cc24f36791 = 0;
    if (!level.var_cca4e7f5433dd7d8 && var_f49539f37fc54aba < 30) {
        level.var_cca4e7f5433dd7d8 = 1;
        namespace_446fc987a980892f::function_d87d5deb069bf8e5("match_remaining_30", level.players);
    }
    if (!level.var_ccadf0f543480a51 && var_f49539f37fc54aba < 15) {
        level.var_ccadf0f543480a51 = 1;
        namespace_446fc987a980892f::function_d87d5deb069bf8e5("match_remaining_15", level.players);
    }
    if (!level.var_ccadf3f5434810ea && var_f49539f37fc54aba < 10) {
        level.var_ccadf3f5434810ea = 1;
        namespace_446fc987a980892f::function_d87d5deb069bf8e5("match_remaining_10", level.players);
    }
    if (!level.var_fc4b2bcc24f36e2a && var_f49539f37fc54aba < 5) {
        level.var_fc4b2bcc24f36e2a = 1;
        namespace_446fc987a980892f::function_d87d5deb069bf8e5("match_remaining_5", level.players);
    }
    if (!level.var_fc4b28cc24f36791 && var_f49539f37fc54aba <= 0) {
        level.var_fc4b28cc24f36791 = 1;
        namespace_446fc987a980892f::function_d87d5deb069bf8e5("match_remaining_0", level.players);
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f17
// Size: 0xc
function pickclassbr() {
    return self.class;
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f2b
// Size: 0x1b
function playershouldrespawn(data) {
    if (istrue(game["inLiveLobby"])) {
        return 1;
    }
    return 0;
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f4e
// Size: 0x27
function spawnhandled(player) {
    return istrue(player.br_infilstarted) && namespace_4b0406965e556711::gameflag("prematch_done");
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f7d
// Size: 0xa9
function playerwelcomesplashes(data) {
    self endon("disconnect");
    self waittill("spawned_player");
    wait(1);
    namespace_44abc05161e2e2cb::showsplash("br_prematch_welcome");
    namespace_4b0406965e556711::gameflagwait("prematch_fade_done");
    wait(1);
    /#
        if (level.mapname == "playerSkipLootPickup" && getdvarint(@"hash_7713e10380b6cb97", 0) == 0) {
            if (isdefined(self.plotarmor)) {
                self.plotarmor = undefined;
            }
        }
    #/
    namespace_44abc05161e2e2cb::showsplash("br_welcome");
    if (istrue(level.autoassignfirstquest) && istrue(level.br_prematchstarted)) {
        autoassignquest(self);
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x702d
// Size: 0x2c
function function_e283c6996bfad7ae() {
    self endon("disconnect");
    level endon("game_ended");
    namespace_944ddf7b8df1b0e3::leaderdialogonplayer("prematch_enter_mission");
    wait(3);
    namespace_944ddf7b8df1b0e3::leaderdialogonplayer("prematch_enter_gear");
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7060
// Size: 0x1b7
function function_73bdf8b18e29b13f(players) {
    if (!namespace_71073fa38f11492::isfeaturedisabled("oneLife")) {
        setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_numLives"), 1);
    }
    while (!isdefined(level.players) || level.players.size == 0) {
        waitframe();
    }
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        player namespace_8bfdb6eb5a3df67a::function_334a8fe67e88bbe7();
        player thread function_8aa3182c50a3094();
    }
    startpoints = [];
    foreach (teamdata in level.teamdata) {
        if (isdefined(teamdata["startPoint"])) {
            startpoints[startpoints.size] = teamdata["startPoint"].origin;
        }
    }
    namespace_bfef6903bca5845d::function_a767dbcb4dd41ce(startpoints);
    wait(2);
    namespace_4b0406965e556711::gameflagset("prematch_fade_done");
    wait(2);
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        player thread function_927a1c74689ce55a();
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x721e
// Size: 0x49
function function_daf5cd1e02931ea7(player) {
    var_2e1d1af8afe39ba8 = player getplayerdata(level.var_5d69837cf4db0407, "dmzPlateCarrierLevel");
    var_9a5097fe8a19dcfd = namespace_f8d3520d3483c1::function_1348b97715104fe2() * var_2e1d1af8afe39ba8;
    return [0:var_9a5097fe8a19dcfd, 1:var_2e1d1af8afe39ba8];
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x726f
// Size: 0x26
function function_8aa3182c50a3094() {
    var_14a780f439cfff1d = getspawnpoint();
    self function_670863fc4008c3d8(var_14a780f439cfff1d.origin);
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x729c
// Size: 0x86
function function_927a1c74689ce55a() {
    namespace_d3d40f75bb4e4c32::playerwaittillstreamhintcomplete();
    spawnpoint = getspawnpoint();
    spawnorigin = spawnpoint.origin;
    spawnangles = spawnpoint.angles;
    self setorigin(spawnorigin, 1);
    self setplayerangles(spawnangles);
    namespace_8bfdb6eb5a3df67a::function_e68e4bb4f65f5fe4();
    self.plotarmor = undefined;
    self clearsoundsubmix("mp_br_lobby_fade", 1.5);
    self.var_d68b9f006bc2a1cb = 1;
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7329
// Size: 0xc7
function function_f6843e3a71516b3e() {
    self endon("disconnect");
    namespace_99ac021a7547cae3::spawnplayer(undefined, 0);
    if (getdvarint(@"hash_5fa01de35b23eee0", 1) == 1) {
        timeouttime = getdvarint(@"hash_c483c0cfe7219133", 15000);
        level thread namespace_36f464722d326bbe::fadetoblackforplayer(self, 1, 0);
        _enableignoreme();
        self freezecontrols(1);
        self function_b88c89bb7cd1ab8e(self.origin);
        starttime = gettime();
        while (!self ispredictedstreamposready() && gettime() - starttime < timeouttime) {
            waitframe();
        }
        _disableignoreme();
        self freezecontrols(0);
        level thread namespace_36f464722d326bbe::fadetoblackforplayer(self, 0, 0.5);
    }
    self.var_d68b9f006bc2a1cb = 1;
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73f7
// Size: 0xa7
function function_f38e7b13448998b4() {
    self endon("disconnect");
    if (!namespace_4b0406965e556711::gameflag("prematch_values_reset")) {
        namespace_4b0406965e556711::gameflagwait("prematch_values_reset");
    }
    namespace_d20f8ef223912e12::brgivestartfieldupgrade();
    function_7460b890072bffbe();
    function_f09e47b124561928();
    function_f0e913c037010a9();
    function_12b9bc0f30aa8f5d();
    function_1ebd7d347b85cae3();
    namespace_3bcd40a3005712ec::br_ammo_update_weapons(self);
    if (getdvarint(@"hash_4b6b3f032485abf8", 0)) {
        function_cd59d6be22c74107();
    }
    var_4185480fa177ddb5 = getdvar(@"hash_65a264cd9d78ee69", "");
    if (var_4185480fa177ddb5 != "") {
        namespace_aead94004cf4c147::function_c2f16e2bbb4e38c0(var_4185480fa177ddb5);
    }
    thread function_b68a411adf965e7f();
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74a5
// Size: 0x18d
function function_cd59d6be22c74107() {
    if (isdefined(self.var_bed158a6dfac230d) && self.var_bed158a6dfac230d < 3) {
        var_347aa4935f42810 = namespace_d3d40f75bb4e4c32::function_c2f2bb9e0ae9a454(3);
        namespace_cb965d2f71fefddc::function_e98a5a4e0e001ac3(self, var_347aa4935f42810);
    }
    var_31dafc6ba15dfbc9 = namespace_aead94004cf4c147::function_b13e35608b336d65(self);
    if (var_31dafc6ba15dfbc9 < 9) {
        lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("brloot_backpack_large");
        namespace_a38a2e1fe7519183::function_5b7dc44bb66553a6(self);
        namespace_a38a2e1fe7519183::function_92d947129ea5ba6e(self, lootid);
        namespace_aead94004cf4c147::function_d28f52da6ede0191(self, 9, undefined, lootid);
    }
    if (!namespace_d3d40f75bb4e4c32::hasselfrevivetoken()) {
        namespace_cb965d2f71fefddc::addselfrevivetoken(1);
    }
    if (!namespace_aead94004cf4c147::function_efab78b72d131d76(self)) {
        weaponobj = namespace_cb965d2f71fefddc::getfullweaponobjforscriptablepartname("brloot_weapon_sm_victor_lege");
        namespace_aead94004cf4c147::function_e35a7cb7e7c8c17e(self, weaponobj, 1);
    }
    var_eb061c2e39f5d6f7 = [0:"brloot_valuable_car_battery", 1:"brloot_valuable_jumper_cables", 2:"brloot_super_oxygenmask"];
    foreach (item in var_eb061c2e39f5d6f7) {
        var_65b695f0c0d909ed = namespace_aead94004cf4c147::getavailabledmzbackpackindex();
        if (!isdefined(var_65b695f0c0d909ed)) {
            break;
        }
        var_60227bff1e9478cc = spawnstruct();
        var_60227bff1e9478cc.scriptablename = item;
        var_60227bff1e9478cc.count = 1;
        lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(item);
        namespace_aead94004cf4c147::additemtobackpack(lootid, var_60227bff1e9478cc);
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7639
// Size: 0x3b
function function_7460b890072bffbe() {
    killstreakref = self.classstruct.loadoutkillstreak1;
    if (isdefined(killstreakref) && killstreakref != "none") {
        namespace_cb965d2f71fefddc::forcegivekillstreak(killstreakref, 0, 0);
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x767b
// Size: 0x373
function function_62b40b6a6c2cf37a() {
    level.var_65f3f1fef64ffa68 = spawnstruct();
    level.var_f38aec9b79359af1 = getdvarint(@"hash_1e556ff10b892938", 0) == 1;
    level.var_65f3f1fef64ffa68.perks = [];
    level.var_65f3f1fef64ffa68.perks["specialty_hustle"] = namespace_38b993c4618e76cd::getlootidfromref("specialty_hustle");
    level.var_65f3f1fef64ffa68.perks["specialty_tac_resist"] = namespace_38b993c4618e76cd::getlootidfromref("specialty_tac_resist");
    level.var_65f3f1fef64ffa68.perks["specialty_eod"] = namespace_38b993c4618e76cd::getlootidfromref("specialty_eod");
    level.var_65f3f1fef64ffa68.perks["specialty_scavenger_plus"] = namespace_38b993c4618e76cd::getlootidfromref("specialty_scavenger_plus");
    level.var_65f3f1fef64ffa68.perks["specialty_grenade_expert"] = namespace_38b993c4618e76cd::getlootidfromref("specialty_grenade_expert");
    level.var_65f3f1fef64ffa68.perks["specialty_focus"] = namespace_38b993c4618e76cd::getlootidfromref("specialty_focus");
    level.var_65f3f1fef64ffa68.perks["specialty_warhead"] = namespace_38b993c4618e76cd::getlootidfromref("specialty_warhead");
    level.var_65f3f1fef64ffa68.perks["specialty_covert_ops"] = namespace_38b993c4618e76cd::getlootidfromref("specialty_covert_ops");
    level.var_65f3f1fef64ffa68.perks["specialty_quick_fix"] = namespace_38b993c4618e76cd::getlootidfromref("specialty_quick_fix");
    level.var_65f3f1fef64ffa68.perks["specialty_guerrilla"] = namespace_38b993c4618e76cd::getlootidfromref("specialty_guerrilla");
    level.var_65f3f1fef64ffa68.perks["specialty_tactical_recon"] = namespace_38b993c4618e76cd::getlootidfromref("specialty_tactical_recon");
    level.var_65f3f1fef64ffa68.var_21832626a15c50da = [];
    level.var_65f3f1fef64ffa68.var_21832626a15c50da[0] = [0:level.var_65f3f1fef64ffa68.perks["specialty_hustle"], 1:level.var_65f3f1fef64ffa68.perks["specialty_tac_resist"], 2:level.var_65f3f1fef64ffa68.perks["specialty_eod"], 3:level.var_65f3f1fef64ffa68.perks["specialty_scavenger_plus"], 4:level.var_65f3f1fef64ffa68.perks["specialty_grenade_expert"]];
    level.var_65f3f1fef64ffa68.var_21832626a15c50da[1] = [0:level.var_65f3f1fef64ffa68.perks["specialty_focus"], 1:level.var_65f3f1fef64ffa68.perks["specialty_warhead"], 2:level.var_65f3f1fef64ffa68.perks["specialty_covert_ops"]];
    level.var_65f3f1fef64ffa68.var_21832626a15c50da[2] = [0:level.var_65f3f1fef64ffa68.perks["specialty_quick_fix"], 1:level.var_65f3f1fef64ffa68.perks["specialty_guerrilla"], 2:level.var_65f3f1fef64ffa68.perks["specialty_tactical_recon"]];
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79f5
// Size: 0x289
function function_53109b63a7168074() {
    currentstreak = self getplayerdata(level.var_5d69837cf4db0407, "currentStreakCount");
    beststreak = self getplayerdata(level.var_5d69837cf4db0407, "bestStreakCount");
    if (!function_61f9109d0eb76f19()) {
        self setplayerdata(level.var_5d69837cf4db0407, "currentStreakGainedProgress", 0);
        self setplayerdata(level.var_5d69837cf4db0407, "bestStreakGainedProgress", 0);
        return;
    }
    var_9215d4aee874a4db = currentstreak + 1;
    self setplayerdata(level.var_5d69837cf4db0407, "currentStreakGainedProgress", 1);
    self setplayerdata(level.var_5d69837cf4db0407, "currentStreakCount", var_9215d4aee874a4db);
    if (var_9215d4aee874a4db > beststreak) {
        self setplayerdata(level.var_5d69837cf4db0407, "bestStreakGainedProgress", 1);
        self setplayerdata(level.var_5d69837cf4db0407, "bestStreakCount", var_9215d4aee874a4db);
    } else {
        self setplayerdata(level.var_5d69837cf4db0407, "bestStreakGainedProgress", 0);
    }
    var_203eac7388d590a9 = int(tablelookupbyrow("mp/dmz_streakrewards.csv", var_9215d4aee874a4db + 1, 1));
    var_652429904b5eb1c5 = undefined;
    if (isdefined(level.var_65f3f1fef64ffa68.var_21832626a15c50da[var_203eac7388d590a9])) {
        var_e59eccd90c6407da = [];
        var_df9fb2cbd434f334 = undefined;
        for (i = 0; i < 10; i++) {
            lootid = self getplayerdata(level.var_5d69837cf4db0407, "DMZExfilPerkStreak", i, "lootID");
            if (lootid != 0) {
                var_e59eccd90c6407da[var_e59eccd90c6407da.size] = lootid;
            } else if (!isdefined(var_df9fb2cbd434f334)) {
                var_df9fb2cbd434f334 = i;
            }
        }
        if (isdefined(var_df9fb2cbd434f334) && var_e59eccd90c6407da.size < level.var_65f3f1fef64ffa68.perks.size) {
            perks = array_randomize(level.var_65f3f1fef64ffa68.var_21832626a15c50da[var_203eac7388d590a9]);
            foreach (var_d933a3a8c547998e in perks) {
                if (!array_contains(var_e59eccd90c6407da, var_d933a3a8c547998e)) {
                    self setplayerdata(level.var_5d69837cf4db0407, "DMZExfilPerkStreak", var_df9fb2cbd434f334, "lootID", var_d933a3a8c547998e);
                    var_652429904b5eb1c5 = var_d933a3a8c547998e;
                    break;
                }
            }
        }
    }
    if (isdefined(var_652429904b5eb1c5)) {
        namespace_a38a2e1fe7519183::function_80a3ed28ed1b33a1(self, var_9215d4aee874a4db, var_652429904b5eb1c5);
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c85
// Size: 0x115
function function_470b4aaafd986a0d(player) {
    if (!namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
        return;
    }
    player setplayerdata(level.var_5d69837cf4db0407, "currentStreakGainedProgress", 0);
    player setplayerdata(level.var_5d69837cf4db0407, "bestStreakGainedProgress", 0);
    var_c017376249a45a39 = namespace_a38a2e1fe7519183::function_1558f8fb859c492a(player);
    perks = var_c017376249a45a39[1];
    streak = var_c017376249a45a39[0];
    if (streak > 0) {
        player setplayerdata(level.var_5d69837cf4db0407, "currentStreakCount", streak);
        perkindex = 0;
        foreach (var_d933a3a8c547998e in perks) {
            if (var_d933a3a8c547998e != 0) {
                player setplayerdata(level.var_5d69837cf4db0407, "DMZExfilPerkStreak", perkindex, "lootID", var_d933a3a8c547998e);
                perkindex++;
            }
        }
    } else {
        function_1a425272955d5f75();
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7da1
// Size: 0xbb
function function_f0e913c037010a9() {
    var_f42ae929dc77a767 = [];
    for (i = 0; i < 10; i++) {
        lootid = self getplayerdata(level.var_5d69837cf4db0407, "DMZExfilPerkStreak", i, "lootID");
        if (lootid != 0) {
            var_f42ae929dc77a767[var_f42ae929dc77a767.size] = lootid;
        }
    }
    if (level.var_f38aec9b79359af1) {
        foreach (lootid in var_f42ae929dc77a767) {
            perk = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
            namespace_82dcd1d5ae30ff7::giveperk(perk);
        }
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e63
// Size: 0x16a
function function_1ebd7d347b85cae3() {
    player = self;
    player.var_a6dd5c7e74106ce3 = [];
    if (!getdvarint(@"hash_3d25f67e59d61b96", 1)) {
        return;
    }
    foreach (weapon in player.equippedweapons) {
        equipmentref = namespace_1a507865f681850e::getequipmentreffromweapon(weapon);
        if (!isdefined(equipmentref) || !isdefined(weapon.weaponblueprint) || !isdefined(weapon.variantid)) {
            continue;
        }
        slot = namespace_1a507865f681850e::findequipmentslot(equipmentref);
        currentammo = namespace_1a507865f681850e::getequipmentslotammo(slot);
        namespace_1a507865f681850e::takeequipment(slot);
        namespace_1a507865f681850e::giveequipment(equipmentref, slot, undefined, weapon.variantid);
        player.var_a6dd5c7e74106ce3[equipmentref] = weapon.variantid;
    }
    /#
        if (getdvarint(@"hash_4106b1f86a235e22", 0)) {
            slot = namespace_1a507865f681850e::findequipmentslot("dmz_tutorial_end");
            currentammo = namespace_1a507865f681850e::getequipmentslotammo(slot);
            namespace_1a507865f681850e::takeequipment(slot);
            namespace_1a507865f681850e::giveequipment("dmz_tutorial_end", slot, 1);
            player.var_a6dd5c7e74106ce3["dmz_tutorial_end"] = 1;
        }
    #/
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fd4
// Size: 0x31
function function_12b9bc0f30aa8f5d() {
    if (!istrue(level.var_7f3aafcf56c9ce14) || !isdefined(self.var_4045f099f3da4bd)) {
        return;
    }
    namespace_cb965d2f71fefddc::function_6523c0535fdb1f1f(self, self.var_4045f099f3da4bd);
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x800c
// Size: 0x88
function function_1a425272955d5f75() {
    if (istrue(self.extracted)) {
        return;
    }
    self setplayerdata(level.var_5d69837cf4db0407, "currentStreakGainedProgress", 0);
    self setplayerdata(level.var_5d69837cf4db0407, "currentStreakCount", 0);
    self setplayerdata(level.var_5d69837cf4db0407, "bestStreakGainedProgress", 0);
    for (i = 0; i < 10; i++) {
        self setplayerdata(level.var_5d69837cf4db0407, "DMZExfilPerkStreak", i, "lootID", 0);
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x809b
// Size: 0x35
function function_61f9109d0eb76f19() {
    if (level.mapname == "mp_bio_lab" || level.mapname == "mp_biobunker") {
        return 1;
    }
    return istrue(self.brmissionscompleted);
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80d8
// Size: 0x50
function function_1be19e52e991d817(player) {
    player notify("overlord_extraction_streak");
    player endon("overlord_extraction_streak");
    player endon("last_stand_start");
    player endon("death");
    player endon("disconnect");
    level endon("game_ended");
    wait(getdvarint(@"hash_12db8f9058061d1b", 10));
    function_adf1fe22b2cd5bd2(player);
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x812f
// Size: 0xad
function function_adf1fe22b2cd5bd2(player) {
    if (!isdefined(player) || !isreallyalive(player)) {
        return;
    }
    if (istrue(player.var_496a6ea8cb39cd1d)) {
        return;
    }
    currentstreak = player getplayerdata(level.var_5d69837cf4db0407, "currentStreakCount");
    if (getdvarint(@"hash_1ec9ac9ef82212cc", 0) > 0) {
        currentstreak = getdvarint(@"hash_1ec9ac9ef82212cc", 0);
    }
    if (isdefined(currentstreak) && currentstreak >= getdvarint(@"hash_f5ffdc69acc2ed9e", 2)) {
        namespace_446fc987a980892f::function_d87d5deb069bf8e5("streak_reminder", [0:player]);
        player.var_496a6ea8cb39cd1d = 1;
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81e3
// Size: 0x218
function function_b68a411adf965e7f() {
    level endon("game_ended");
    if (!isdefined(self.team)) {
        return;
    }
    if (!isdefined(level.var_538b75512b4726a8)) {
        level.var_538b75512b4726a8 = [];
    }
    var_e1b5345b16363c30 = self.team;
    if (istrue(level.var_538b75512b4726a8[var_e1b5345b16363c30])) {
        return;
    }
    if (!isdefined(level.var_538b75512b4726a8[var_e1b5345b16363c30])) {
        level.var_538b75512b4726a8[var_e1b5345b16363c30] = 1;
    }
    wait(120);
    while (1) {
        alivecount = getteamdata(var_e1b5345b16363c30, "aliveCount");
        if (!isdefined(alivecount) || alivecount <= 0) {
            return;
        }
        players = getteamdata(var_e1b5345b16363c30, "players");
        if (!isdefined(players) || players.size <= 1) {
            wait(getdvarint(@"hash_69b4eb1d49243c68", 120));
            continue;
        }
        aliveplayers = [];
        foreach (player in players) {
            if (isreallyalive(player)) {
                aliveplayers[aliveplayers.size] = player;
            }
        }
        if (aliveplayers.size <= 1) {
            wait(getdvarint(@"hash_69b4eb1d49243c68", 120));
            continue;
        }
        var_c4b81997f0120a97 = undefined;
        foreach (player in aliveplayers) {
            if (!isdefined(var_c4b81997f0120a97)) {
                var_c4b81997f0120a97 = player;
            } else {
                dist = distance2d(player.origin, var_c4b81997f0120a97.origin);
                if (dist >= getdvarint(@"hash_f49edd0604d1e232", 7500)) {
                    namespace_446fc987a980892f::function_d87d5deb069bf8e5("teammates_far_away_nag", aliveplayers);
                    break;
                }
            }
        }
        wait(getdvarint(@"hash_69b4eb1d49243c68", 120));
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8402
// Size: 0xeb
function getdefaultweaponammo(weapon, maxammo) {
    ammotype = namespace_3bcd40a3005712ec::br_ammo_type_for_weapon(weapon);
    var_b7e1758e56028b63 = 100;
    if (isdefined(ammotype) && isdefined(level.br_pickups.counts[ammotype])) {
        var_b7e1758e56028b63 = level.br_pickups.counts[ammotype];
    }
    var_28aebe3dd6733ed3 = ter_op(weaponclipsize(weapon) < var_b7e1758e56028b63 || istrue(maxammo), weaponclipsize(weapon), var_b7e1758e56028b63);
    var_961012dd15fa29ee = 0;
    if (weapon.hasalternate) {
        var_5d9b5b689a1846c8 = weapon getaltweapon();
        var_961012dd15fa29ee = ter_op(weaponclipsize(var_5d9b5b689a1846c8) < var_b7e1758e56028b63 || istrue(maxammo), weaponclipsize(var_5d9b5b689a1846c8), var_b7e1758e56028b63);
    }
    return [0:var_28aebe3dd6733ed3, 1:var_28aebe3dd6733ed3, 2:var_961012dd15fa29ee];
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84f5
// Size: 0xd1
function showdmzsplash(splash, playerlist, poiname, optionalnumber, playerforplayercard, var_42b1e877ab187c6) {
    temp = level.var_cc9e990b6e83975b;
    level.var_cc9e990b6e83975b = 0;
    foreach (player in playerlist) {
        if (isplayer(player)) {
            player setclientomnvar("ui_dmz_poi_name", namespace_37f0fb6355a4618a::function_80cdaea4bd3ecf70(poiname));
            player thread namespace_44abc05161e2e2cb::showsplash(splash, optionalnumber, playerforplayercard, undefined, 1, var_42b1e877ab187c6);
        }
    }
    level.var_cc9e990b6e83975b = temp;
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x85cd
// Size: 0x10b
function function_f7920586b5a59226() {
    /#
        while (1) {
            type = getdvarint(@"hash_aa489f8b09e8c2a3", 0);
            if (type) {
                setdvar(@"hash_aa489f8b09e8c2a3", 0);
                poiname = undefined;
                if (namespace_37f0fb6355a4618a::function_47d356083884f913()) {
                    poiname = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(level.players[0].origin, 1);
                }
                splash = undefined;
                switch (type) {
                case 2:
                    splash = "gamestate_match_end_indicator_northwest";
                    break;
                case 3:
                    splash = "gamestate_exfil_leaving_heli";
                    break;
                case 4:
                    splash = "dx_br_dmzc_exfi_depi_ecti";
                    break;
                case 5:
                    splash = "mission_mission_direction_north";
                    break;
                default:
                    splash = "dmz_mission_ass_accept_gl";
                    break;
                }
                namespace_d696adde758cbe79::showdmzsplash(splash, level.players, poiname);
            }
            wait(1);
        }
    #/
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x86df
// Size: 0x1c3
function function_2ff493cd8ff03634() {
    /#
        while (1) {
            type = getdvarint(@"hash_4febbe2aa9ddab48", 0);
            if (type) {
                setdvar(@"hash_4febbe2aa9ddab48", 0);
                splash = "trap_mission_mission_extractremind";
                poiname = undefined;
                if (type == 2) {
                    splash = "dmz_mission_hostage_assigned";
                }
                if (type == 3) {
                    splash = "dmz_mission_destroy_sam_approach";
                }
                if (type == 4) {
                    splash = "dx_br_dmzo_cost_ovld_vdad";
                }
                if (type == 5) {
                    splash = "dmz_bosses";
                }
                poiname = "check_for_plea";
                if (type == 6) {
                    splash = "waiting_for_plea";
                }
                poiname = "check_for_plea";
                if (type == 7) {
                    splash = "end_reason";
                }
                if (type == 8) {
                    var_587ec5b2038407de = 2 | 48;
                    splash = "specialty_scavenger_plus";
                    level.var_cc9e990b6e83975b = 0;
                    level.players[0] namespace_44abc05161e2e2cb::showsplash(splash, var_587ec5b2038407de, undefined, undefined, 1);
                    level.var_cc9e990b6e83975b = 1;
                    continue;
                }
                if (type == 9) {
                    splash = "mp_br_mechanics";
                }
                if (type == 10) {
                    splash = "scriptable_dmz_tripwire";
                }
                namespace_d696adde758cbe79::showdmzsplash(splash, level.players, poiname);
            }
            state = getdvarint(@"hash_6d5dafa13d3a8b94", -1);
            if (state != -1) {
                setdvar(@"hash_6d5dafa13d3a8b94", -1);
                level.players[0] setclientomnvar("saba", state);
            }
            state = getdvarint(@"hash_5e0729bf2d69d066", 0);
            if (state) {
                setdvar(@"hash_5e0729bf2d69d066", 0);
                level.players[0] setclientomnvar("<unknown string>", 1);
            }
            wait(1);
        }
    #/
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x88a9
// Size: 0x1be
function function_f917fde1df9c5506() {
    /#
        while (1) {
            if (getdvarint(@"hash_44bd790b3a453d80", 0) == 1) {
                setdvar(@"hash_44bd790b3a453d80", 0);
                namespace_25b25d188ef778c4::function_309c0a11484cc0db(level.players);
            }
            if (getdvarint(@"hash_84a792cec0ba5b7c", 0) == 1) {
                var_27964dbaca1842f0 = [];
                setdvar(@"hash_84a792cec0ba5b7c", 0);
                foreach (team in level.teamnamelist) {
                    players = level.teamdata[team]["<unknown string>"];
                    if (isdefined(players)) {
                        targetplayer = players[0];
                        foreach (player in players) {
                            if (isdefined(player) && isreallyalive(player) && !istrue(player.extracted)) {
                                targetplayer = player;
                                if (getdvarint(@"hash_533162a7d43f948f", 0) == 1) {
                                    break;
                                }
                            }
                        }
                        var_27964dbaca1842f0[var_27964dbaca1842f0.size] = targetplayer;
                    }
                }
                namespace_25b25d188ef778c4::function_309c0a11484cc0db(var_27964dbaca1842f0);
            }
            if (getdvarint(@"hash_31f19312965b3b78", 0) == 1) {
                setdvar(@"hash_31f19312965b3b78", 0);
                level.players[0] namespace_25b25d188ef778c4::function_7ff5e35e992df372();
            }
            wait(1);
        }
    #/
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8a6e
// Size: 0x1f8
function function_459e2558e6d936ed() {
    /#
        while (1) {
            if (getdvarint(@"hash_b72ce628db69ef4b", 0)) {
                setdvar(@"hash_b72ce628db69ef4b", 0);
                restock = spawnscriptable("<unknown string>", level.players[0].origin, level.players[0].angles);
            }
            if (getdvarint(@"hash_edc010da9e9d687b", 0)) {
                setdvar(@"hash_edc010da9e9d687b", 0);
                cache = spawnscriptable("<unknown string>", level.players[0].origin, level.players[0].angles);
                cache setscriptablepartstate("<unknown string>", "<unknown string>");
            }
            if (getdvarint(@"hash_25f4358ca3b846e3", 0)) {
                setdvar(@"hash_25f4358ca3b846e3", 0);
                cache = spawnscriptable("<unknown string>", level.players[0].origin, level.players[0].angles);
                cache setscriptablepartstate("<unknown string>", "<unknown string>");
            }
            if (getdvarint(@"hash_8ca28a9d28344f", 0)) {
                setdvar(@"hash_8ca28a9d28344f", 0);
                laptop = spawnscriptable("<unknown string>", level.players[0].origin, level.players[0].angles);
                var_c2fee681e05824c8 = spawnscriptable("<unknown string>", level.players[0].origin, level.players[0].angles);
                laptop.var_c2fee681e05824c8 = var_c2fee681e05824c8;
            }
            waitframe();
        }
    #/
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8c6d
// Size: 0x1ac
function function_dc98aeb4dd4b727a() {
    /#
        while (1) {
            if (getdvarint(@"hash_f2cfce8dc99e0fd4", 0)) {
                setdvar(@"hash_f2cfce8dc99e0fd4", 0);
                hostage = spawnscriptable("<unknown string>", level.players[0].origin, level.players[0].angles);
                hostage setscriptablepartstate("<unknown string>", "<unknown string>");
                for (i = 0; i < 5; i++) {
                    plate = spawnscriptable("<unknown string>", level.players[0].origin + 32 * function_6174330574a2a273(), level.players[0].angles);
                    plate setscriptablepartstate("<unknown string>", "<unknown string>");
                }
            }
            if (getdvarint(@"hash_db675935826560a", 0)) {
                setdvar(@"hash_db675935826560a", 0);
                spawnscriptable("<unknown string>", level.players[0].origin, level.players[0].angles);
                for (i = 0; i < 5; i++) {
                    plate = spawnscriptable("<unknown string>", level.players[0].origin + 32 * function_6174330574a2a273(), level.players[0].angles);
                    plate setscriptablepartstate("<unknown string>", "<unknown string>");
                }
            }
            waitframe();
        }
    #/
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8e20
// Size: 0x3e8
function function_37eaf2bc0bb3e28a() {
    /#
        while (!getdvarint(@"hash_cd6f9528a14b2504", 0) || !isdefined(level.var_1b7407dffe81e6e8) || !isdefined(level.var_1b7407dffe81e6e8.var_b2f15037287a033a)) {
            wait(1);
        }
        nodes = [];
        foreach (name, data in level.var_1b7407dffe81e6e8.var_b2f15037287a033a) {
            if (name == "<unknown string>") {
                nodes[name] = namespace_5ffce5a43b2d1ec2::function_a07f7c4c0c4ef8e3();
            }
            if (name == "<unknown string>") {
                nodes[name] = namespace_e1bfa87a2a692d3c::function_a07f7c4c0c4ef8e3();
            }
            if (name == "<unknown string>") {
                nodes[name] = namespace_4f4cbea0f5b0bdb8::function_a07f7c4c0c4ef8e3();
            }
            if (name == "<unknown string>") {
                nodes[name] = namespace_300f9f7dca7fc109::function_a07f7c4c0c4ef8e3();
            }
            if (name == "<unknown string>") {
                nodes[name] = namespace_b11859036e02907d::function_a07f7c4c0c4ef8e3();
            }
            if (name == "<unknown string>") {
                nodes[name] = namespace_fa9fd40f68ab8478::function_a07f7c4c0c4ef8e3();
            }
            if (name == "<unknown string>") {
                nodes[name] = namespace_b8c00f1eafbbd213::function_a07f7c4c0c4ef8e3();
            }
            if (name == "<unknown string>") {
                nodes[name] = namespace_30baceecda213256::function_a07f7c4c0c4ef8e3();
            }
            if (name == "<unknown string>") {
                nodes[name] = namespace_232aeaeb467df5bd::function_a07f7c4c0c4ef8e3();
            }
            if (name == "<unknown string>") {
                nodes[name] = namespace_38da3c68826ceb02::function_a07f7c4c0c4ef8e3();
            }
            if (name == "<unknown string>") {
                nodes[name] = namespace_168c086126cfa488::function_a07f7c4c0c4ef8e3();
            }
            if (name == "<unknown string>") {
                nodes[name] = namespace_d0483bb41cd4e112::function_a07f7c4c0c4ef8e3();
            }
            if (name == "<unknown string>") {
                nodes[name] = namespace_210d6dd43cfaf195::function_a07f7c4c0c4ef8e3();
            }
        }
        nodes["<unknown string>"] = getstructarray("<unknown string>", "<unknown string>");
        nodes["<unknown string>"] = getstructarray("<unknown string>", "<unknown string>");
        nodes["<unknown string>"] = getstructarray("<unknown string>", "<unknown string>");
        nodes["<unknown string>"] = getstructarray("<unknown string>", "<unknown string>");
        nodes["<unknown string>"] = getstructarray("<unknown string>", "<unknown string>");
        nodes["<unknown string>"] = getstructarray("<unknown string>", "<unknown string>");
        nodes["<unknown string>"] = getstructarray("<unknown string>", "<unknown string>");
        nodes["<unknown string>"] = getstructarray("<unknown string>", "<unknown string>");
        nodes["<unknown string>"] = getstructarray("<unknown string>", "<unknown string>");
        nodes["<unknown string>"] = getstructarray("<unknown string>", "<unknown string>");
        nodes["<unknown string>"] = getstructarray("<unknown string>", "<unknown string>");
        nodes["<unknown string>"] = getstructarray("<unknown string>", "<unknown string>");
        nodes["<unknown string>"] = getstructarray("<unknown string>", "<unknown string>");
        nodes["<unknown string>"] = getentitylessscriptablearray("<unknown string>", "<unknown string>");
        while (1) {
            dvar = getdvar(@"hash_5d80cf4f5ced4150", "<unknown string>");
            if (dvar != "<unknown string>") {
                if (isdefined(nodes[dvar])) {
                    foreach (node in nodes[dvar]) {
                        if (distance2dsquared(level.players[0].origin, node.origin) < 100000000) {
                            sphere(node.origin, 50, (1, 0, 0), 0, 1);
                        }
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x920f
// Size: 0xa6
function function_b0d036699b334631() {
    /#
        while (1) {
            if (getdvarint(@"hash_8aae452771dc0496", 0)) {
                setdvar(@"hash_8aae452771dc0496", 0);
                foreach (player in level.players) {
                    if (isbot(player)) {
                        namespace_aead94004cf4c147::function_8107fe0feec27866(player, level.players[0].primaryweapons[0]);
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92bc
// Size: 0x104
function function_e1fa80f536692a32() {
    while (1) {
        dvar = getdvar(@"hash_911645dd41a57d5d", "");
        if (isdefined(dvar) && dvar != "") {
            setdvar(@"hash_911645dd41a57d5d", "");
            item = spawnscriptable(dvar, level.players[0].origin, level.players[0].angles);
            if (isdefined(item)) {
                namespace_cb965d2f71fefddc::registerscriptableinstance(item);
            }
        }
        if (getdvarint(@"hash_77012bc5215f715e", 0)) {
            setdvar(@"hash_77012bc5215f715e", 0);
            items = getentitylessscriptablearray(undefined, undefined, undefined, undefined, "brloot_black_mous_intel");
            /#
                printtoscreen2d(50, 50, "<unknown string>" + items.size);
            #/
            level.players[0] setorigin(items[0].origin);
        }
        waitframe();
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93c7
// Size: 0xc
function function_b9abf4fc2d1f7fcd(var_9156b53bcf7ce573) {
    
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93da
// Size: 0x26
function function_181a43d54c23236() {
    if (namespace_36f464722d326bbe::function_7ee65fae13124702()) {
        return 0;
    }
    if (namespace_36f464722d326bbe::function_e21746abaaaf8414()) {
        return 0;
    }
    if (namespace_36f464722d326bbe::function_5e0e3a24dbb1fae1()) {
        return 0;
    }
    return 1;
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9408
// Size: 0xe
function function_dbe369af1abc2991() {
    level.var_a06b389554958a4a = 1;
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x941d
// Size: 0xd
function function_4e5ca94d32370a5a() {
    return istrue(level.var_a06b389554958a4a);
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9432
// Size: 0x2b4
function function_63a938bfc7ba5c2b(nodes) {
    startpoints = spawnstruct();
    startpoints.points = [];
    startpoints.var_f700d2836aab75a4 = [];
    startpoints.var_f700d2836aab75a4[0] = [];
    startpoints.var_f700d2836aab75a4[1] = [];
    startpoints.var_f700d2836aab75a4[2] = [];
    startpoints.var_f700d2836aab75a4[3] = [];
    if (!function_4e5ca94d32370a5a()) {
        var_4efc16030b7ac1f9 = array_randomize(nodes);
    } else {
        var_4efc16030b7ac1f9 = nodes;
    }
    foreach (node in var_4efc16030b7ac1f9) {
        if (isdefined(level.var_ab20b3a256911579) && level.var_e5993849fc7d5987 == 0 && (!isdefined(node.poi) || array_contains(level.var_ab20b3a256911579, node.poi)) && namespace_37f0fb6355a4618a::function_7e9cbc0f32de6578()) {
            continue;
        }
        startpoint = spawnstruct();
        startpoint.poi = node.poi;
        startpoint.origin = node.origin;
        startpoint.angles = node.angles;
        startpoint.team = undefined;
        if (isdefined(node.target)) {
            startpoint.target = node.target;
        }
        if (isdefined(node.script_label)) {
            startpoint.script_label = node.script_label;
        }
        if (isdefined(node.var_78c002be5bc09aea)) {
            startpoint.var_78c002be5bc09aea = int(node.var_78c002be5bc09aea);
            startpoints.points[startpoint.var_78c002be5bc09aea] = startpoint;
        } else {
            startpoints.points[startpoints.points.size] = startpoint;
        }
    }
    level.var_c137999ba28087df = 0;
    startpoints.var_f700d2836aab75a4[0] = startpoints.points;
    startpoints.var_f700d2836aab75a4[1] = startpoints.points;
    startpoints.var_f700d2836aab75a4[2] = startpoints.points;
    startpoints.var_f700d2836aab75a4[3] = startpoints.points;
    return startpoints;
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x96ee
// Size: 0x35
function function_7eb9b366e7ee262e() {
    if (namespace_36f464722d326bbe::function_7ee65fae13124702()) {
        return "mp/dmz_spawnpoints.csv";
    }
    if (namespace_36f464722d326bbe::function_e21746abaaaf8414()) {
        return "mp/dmz_sealion_spawnpoints.csv";
    }
    if (namespace_36f464722d326bbe::function_5e0e3a24dbb1fae1()) {
        return "mp/dmz_delta_spawnpoints.csv";
    }
    return "mp/dmz_spawnpoints.csv";
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x972b
// Size: 0x52d
function function_effb4f29bf72a97b(var_df08a16a5e6579c3) {
    startpoints = spawnstruct();
    startpoints.points = [];
    startpoints.var_f700d2836aab75a4 = [];
    startpoints.var_f700d2836aab75a4[0] = [];
    startpoints.var_f700d2836aab75a4[1] = [];
    startpoints.var_f700d2836aab75a4[2] = [];
    startpoints.var_f700d2836aab75a4[3] = [];
    var_be2db88fa84d30d3 = getstructarray(var_df08a16a5e6579c3, "script_noteworthy");
    var_d159d4c99e9374bd = [];
    foreach (point in var_be2db88fa84d30d3) {
        if (isdefined(point.script_label) && point.script_label != "") {
            var_d159d4c99e9374bd[point.script_label] = point;
        }
    }
    var_701a116fe9041dc2 = function_7eb9b366e7ee262e();
    rownum = tablelookupgetnumrows(var_701a116fe9041dc2);
    var_af29a901b9609348 = 0;
    for (rowindex = 0; rowindex < rownum; rowindex++) {
        poi = tablelookupbyrow(var_701a116fe9041dc2, rowindex, 0);
        if (isdefined(level.var_ab20b3a256911579) && level.var_e5993849fc7d5987 == 0 && (!isdefined(poi) || array_contains(level.var_ab20b3a256911579, poi)) && namespace_37f0fb6355a4618a::function_7e9cbc0f32de6578()) {
            continue;
        }
        noteworthy = tablelookupbyrow(var_701a116fe9041dc2, rowindex, 5);
        if (noteworthy != var_df08a16a5e6579c3) {
            continue;
        }
        var_51ce8d39afd59b34 = tablelookupbyrow(var_701a116fe9041dc2, rowindex, 14);
        if (!isdefined(var_51ce8d39afd59b34) || var_51ce8d39afd59b34 == "") {
            continue;
        }
        if (!isdefined(var_d159d4c99e9374bd[var_51ce8d39afd59b34])) {
            continue;
        }
        point = var_d159d4c99e9374bd[var_51ce8d39afd59b34];
        startpoint = spawnstruct();
        startpoint.poi = ter_op(isdefined(point.poi), point.poi, "");
        startpoint.origin = point.origin;
        startpoint.angles = ter_op(isdefined(point.angles), point.angles, (0, 0, 0));
        startpoint.team = undefined;
        if (isdefined(point.target)) {
            startpoint.target = point.target;
        }
        if (isdefined(point.script_label)) {
            startpoint.script_label = point.script_label;
        }
        startpoints.points[startpoints.points.size] = startpoint;
    }
    level.var_c137999ba28087df = 0;
    foreach (point in startpoints.points) {
        index = ter_op(point.origin[0] < 0, -1, 0) + ter_op(point.origin[1] < 0, 3, 1);
        if (level.var_497daac5a6d4041b[index] != 0) {
            continue;
        }
        startpoints.var_f700d2836aab75a4[index][startpoints.var_f700d2836aab75a4[index].size] = point;
    }
    var_3bafc217f6706130 = function_47fd8fcdf90b0e() & 65535;
    var_2cb677e3452c5eeb = var_3bafc217f6706130;
    for (i = 0; i < startpoints.var_f700d2836aab75a4.size; i++) {
        var_2cb677e3452c5eeb = (var_2cb677e3452c5eeb * 29 + 19) % 65535;
        var_795a46d2f3321b31 = var_2cb677e3452c5eeb % startpoints.var_f700d2836aab75a4.size;
        tmp = startpoints.var_f700d2836aab75a4[i];
        startpoints.var_f700d2836aab75a4[i] = startpoints.var_f700d2836aab75a4[var_795a46d2f3321b31];
        startpoints.var_f700d2836aab75a4[var_795a46d2f3321b31] = tmp;
    }
    var_3bafc217f6706130 = function_47fd8fcdf90b0e() & 65535;
    var_2cb677e3452c5eeb = var_3bafc217f6706130;
    foreach (index, quad in startpoints.var_f700d2836aab75a4) {
        for (i = 0; i < quad.size; i++) {
            var_2cb677e3452c5eeb = (var_2cb677e3452c5eeb * 29 + 19) % 65535;
            var_795a46d2f3321b31 = var_2cb677e3452c5eeb % quad.size;
            tmp = quad[i];
            quad[i] = quad[var_795a46d2f3321b31];
            quad[var_795a46d2f3321b31] = tmp;
        }
        startpoints.var_f700d2836aab75a4[index] = quad;
    }
    /#
        println("<unknown string>" + var_3bafc217f6706130);
    #/
    return startpoints;
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c60
// Size: 0x435
function function_3114e3023d0edf66() {
    level.spawnheight = getdvarfloat(@"hash_1cdb6b91e9c4a104", 1);
    level.var_497daac5a6d4041b = [0:getdvarint(@"hash_3ec0c24faa920e9d", 0), 1:getdvarint(@"hash_3ec0d04faa922d67", 0), 2:getdvarint(@"hash_3ef9c24faad08988", 0), 3:getdvarint(@"hash_3ef9b44faad06abe", 0)];
    var_80905631869fb395 = 0;
    foreach (quad in level.var_497daac5a6d4041b) {
        if (quad == 0) {
            var_80905631869fb395++;
        }
    }
    level.var_68aaa2c8668cc4fb = var_80905631869fb395;
    level.startpoints = [];
    while (!isdefined(level.struct_class_names)) {
        waitframe();
    }
    primary = [];
    if (function_181a43d54c23236() && !isdefined(level.var_744dfabb8f946331)) {
        primary = getstructarray("dmz_squadSpawnPoint_GLOuterEdge1", "script_noteworthy");
    }
    if (primary.size == 0) {
        if (level.mapname == "mp_fortress_tm") {
            startpoint = spawnstruct();
            startpoint.origin = (-599, -1298, 111);
            startpoint.team = undefined;
            primary[primary.size] = startpoint;
            startpoint = spawnstruct();
            startpoint.origin = (525, -1298, 111);
            startpoint.team = undefined;
            primary[primary.size] = startpoint;
            startpoint = spawnstruct();
            startpoint.origin = (167, -1778, 113);
            startpoint.team = undefined;
            primary[primary.size] = startpoint;
        } else if (level.mapname == "mp_ai_firefight") {
            startpoint = spawnstruct();
            startpoint.origin = (1707, 1965, 204);
            startpoint.angles = (0, 180, 0);
            startpoint.team = undefined;
            primary[primary.size] = startpoint;
            startpoint = spawnstruct();
            startpoint.origin = (1707, 1965, 204);
            startpoint.angles = (0, 180, 0);
            startpoint.team = undefined;
            primary[primary.size] = startpoint;
        } else if (issubstr(level.mapname, "mp_stronghold")) {
            startpoint = spawnstruct();
            startpoint.origin = (0, 0, 60);
            startpoint.team = undefined;
            primary[primary.size] = startpoint;
            startpoint = spawnstruct();
            startpoint.origin = (0, 0, 60);
            startpoint.team = undefined;
            primary[primary.size] = startpoint;
        } else if (level.mapname == "mp_br_mechanics") {
            startpoint = spawnstruct();
            startpoint.origin = (-2861, 2762, 58);
            startpoint.team = undefined;
            primary[primary.size] = startpoint;
            startpoint = spawnstruct();
            startpoint.origin = (-2861, 2762, 58);
            startpoint.team = undefined;
            primary[primary.size] = startpoint;
        } else if (isdefined(level.var_744dfabb8f946331)) {
            primary = [[ level.var_744dfabb8f946331 ]]();
        }
    }
    if (primary.size == 0 && !function_181a43d54c23236()) {
        level.startpoints[0] = function_effb4f29bf72a97b("dmz_squadSpawnPoint_GLOuterEdge1");
    } else {
        level.startpoints[0] = function_63a938bfc7ba5c2b(primary);
        level.var_68aaa2c8668cc4fb = 4;
    }
    if (function_181a43d54c23236()) {
        level.startpoints[1] = function_63a938bfc7ba5c2b(getstructarray("dmz_squadSpawnPoint_GLOuterEdge2", "script_noteworthy"));
    } else {
        level.startpoints[1] = function_effb4f29bf72a97b("dmz_squadSpawnPoint_GLOuterEdge2");
    }
    level.var_41bf3dea04371564 = [];
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa09c
// Size: 0x91c
function getspawnpoint() {
    teamindex = 0;
    foreach (index, team in level.allteamnamelist) {
        if (team == self.sessionteam) {
            teamindex = index;
            break;
        }
    }
    if (!isdefined(level.startpoints)) {
        function_3114e3023d0edf66();
    }
    var_cfc2ca5ebfa83db2 = undefined;
    if (isdefined(level.var_98ae8dc756286aca)) {
        var_cfc2ca5ebfa83db2 = self [[ level.var_98ae8dc756286aca ]](level.startpoints[0].var_f700d2836aab75a4);
    }
    spawnpointindex = undefined;
    if (!isdefined(var_cfc2ca5ebfa83db2)) {
        spawnpointindex = int(floor(teamindex / level.var_68aaa2c8668cc4fb));
    }
    quadindex = int(teamindex % level.var_68aaa2c8668cc4fb);
    if (!isdefined(self.team) || !isdefined(level.teamdata) || !isdefined(level.teamdata[self.team])) {
        point = undefined;
        if (isdefined(var_cfc2ca5ebfa83db2)) {
            point = var_cfc2ca5ebfa83db2;
        } else if (isdefined(level.startpoints[0].var_f700d2836aab75a4[quadindex][spawnpointindex])) {
            point = level.startpoints[0].var_f700d2836aab75a4[quadindex][spawnpointindex];
        } else if (isdefined(level.startpoints[1].var_f700d2836aab75a4[quadindex][spawnpointindex - level.startpoints[0].var_f700d2836aab75a4[quadindex].size + 1])) {
            point = level.startpoints[1].var_f700d2836aab75a4[quadindex][spawnpointindex];
        }
        if (!isdefined(point)) {
            point = spawnstruct();
            point.origin = (0, 0, 0);
        }
        /#
            println("<unknown string>" + self.name);
            println("<unknown string>" + self.sessionteam);
            println("<unknown string>" + "<unknown string>" + point.origin[0] + "<unknown string>" + point.origin[1] + "<unknown string>" + point.origin[2] + "<unknown string>");
        #/
        spawnpoint = spawnstruct();
        spawnpoint.origin = point.origin;
        spawnpoint.angles = ter_op(isdefined(point.angles), point.angles, (0, 0, 0));
        spawnpoint.time = gettime();
        spawnpoint.team = undefined;
        spawnpoint.index = -1;
        spawnpoint.lifeid = self.lifeid;
        return spawnpoint;
    }
    var_6373489ac2aeff2b = [];
    if (!isdefined(level.teamdata[self.team]["startPoint"])) {
        var_50387780d85adca4 = level.var_c137999ba28087df;
        var_7f6ed4bcf0db77db = 0;
        if (isdefined(var_cfc2ca5ebfa83db2)) {
            startpoint = var_cfc2ca5ebfa83db2;
            level.teamdata[self.team]["startPoint"] = startpoint;
            startpoint.team = self.team;
        } else if (isdefined(level.startpoints[0].var_f700d2836aab75a4[quadindex][spawnpointindex]) && !isdefined(level.startpoints[0].var_f700d2836aab75a4[quadindex][spawnpointindex].team)) {
            startpoint = level.startpoints[0].var_f700d2836aab75a4[quadindex][spawnpointindex];
            level.teamdata[self.team]["startPoint"] = startpoint;
            startpoint.team = self.team;
        } else if (isdefined(level.startpoints[1].var_f700d2836aab75a4[quadindex][spawnpointindex - level.startpoints[0].var_f700d2836aab75a4[quadindex].size + 1]) && !isdefined(level.startpoints[1].var_f700d2836aab75a4[quadindex][spawnpointindex - level.startpoints[0].var_f700d2836aab75a4[quadindex].size + 1].team)) {
            startpoint = level.startpoints[1].var_f700d2836aab75a4[quadindex][spawnpointindex - level.startpoints[0].var_f700d2836aab75a4[quadindex].size + 1];
            level.teamdata[self.team]["startPoint"] = startpoint;
            startpoint.team = self.team;
        } else {
            while (!isdefined(level.teamdata[self.team]["startPoint"]) && var_7f6ed4bcf0db77db < level.startpoints.size) {
                foreach (startpoint in level.startpoints[var_7f6ed4bcf0db77db].var_f700d2836aab75a4[level.var_c137999ba28087df]) {
                    if (isdefined(startpoint.team)) {
                        continue;
                    }
                    level.teamdata[self.team]["startPoint"] = startpoint;
                    startpoint.team = self.team;
                    break;
                }
                level.var_c137999ba28087df++;
                if (level.var_c137999ba28087df > 3) {
                    level.var_c137999ba28087df = 0;
                }
                if (var_50387780d85adca4 == level.var_c137999ba28087df) {
                    var_7f6ed4bcf0db77db++;
                }
            }
        }
        /#
            if (isdefined(self.team)) {
                namespace_d1a9ca87d78d9813::function_9533653868e59fb6("<unknown string>", self.team, undefined, undefined, undefined, undefined, level.teamdata[self.team]["<unknown string>"].poi, level.teamdata[self.team]["<unknown string>"].origin);
            }
        #/
    }
    /#
        assertex(isdefined(level.teamdata[self.team]["startPoint"]), "No valid spawn found for team");
    #/
    spawnorigin = level.teamdata[self.team]["startPoint"].origin;
    spawnangles = level.teamdata[self.team]["startPoint"].angles;
    var_a17ad319dc0e4b41 = array_find(level.teamdata[self.team]["players"], self);
    if (isdefined(var_a17ad319dc0e4b41)) {
        if (isdefined(level.var_fc458ddec84c95a0)) {
            point = [[ level.var_fc458ddec84c95a0 ]](level.teamdata[self.team]["startPoint"], var_a17ad319dc0e4b41);
            if (isdefined(point)) {
                spawnorigin = point.origin;
                spawnangles = point.angles;
            }
        } else {
            spawnorigin = spawnorigin + function_9ec9c03926f7b11c(var_a17ad319dc0e4b41, level.maxteamsize);
        }
    }
    if (!isdefined(level.teamdata[self.team]["startPoint"].script_label) || level.teamdata[self.team]["startPoint"].script_label != "InteriorSpawnPoint") {
        var_fbcabd62b8f66eb8 = namespace_2a184fc4902783dc::create_default_contents(1);
        result = namespace_2a184fc4902783dc::ray_trace(spawnorigin + (0, 0, 10000), spawnorigin - (0, 0, 20000), undefined, var_fbcabd62b8f66eb8)["position"];
        spawnorigin = (spawnorigin[0], spawnorigin[1], result[2] + level.spawnheight);
    }
    spawnpoint = spawnstruct();
    spawnpoint.origin = spawnorigin;
    spawnpoint.angles = ter_op(isdefined(spawnangles), spawnangles, (0, 0, 0));
    spawnpoint.time = gettime();
    spawnpoint.team = self.team;
    spawnpoint.index = -1;
    spawnpoint.lifeid = self.lifeid;
    return spawnpoint;
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa9c0
// Size: 0x59
function function_9ec9c03926f7b11c(index, var_165262bff9d18643) {
    spawnoffset = ter_op(istrue(level.var_359d1318419a254d), 0, 100);
    angle = index / var_165262bff9d18643 * 360;
    return (cos(angle) * spawnoffset, sin(angle) * spawnoffset, 0);
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaa21
// Size: 0x172
function function_be92590a9b41dea8(var_592e60649ea08687) {
    var_701a116fe9041dc2 = function_7eb9b366e7ee262e();
    rownum = tablelookupgetnumrows(var_701a116fe9041dc2);
    var_af29a901b9609348 = 0;
    for (rowindex = 0; rowindex < rownum; rowindex++) {
        id = tablelookupbyrow(var_701a116fe9041dc2, rowindex, 13);
        if (int(id) == var_592e60649ea08687) {
            var_af29a901b9609348 = rowindex;
            break;
        }
    }
    poi = tablelookupbyrow(var_701a116fe9041dc2, var_af29a901b9609348, 0);
    var_22bcd0fb063692b5 = tablelookupbyrow(var_701a116fe9041dc2, var_af29a901b9609348, 1);
    var_9c8e5dab0e4fea3a = tablelookupbyrow(var_701a116fe9041dc2, var_af29a901b9609348, 2);
    var_7c4e2c6a50914434 = strtok(var_22bcd0fb063692b5, ", ");
    var_b91d15a3a3340001 = strtok(var_9c8e5dab0e4fea3a, ", ");
    spawnorigin = (float(var_7c4e2c6a50914434[0]), float(var_7c4e2c6a50914434[1]), float(var_7c4e2c6a50914434[2]));
    spawnangles = (float(var_b91d15a3a3340001[0]), float(var_b91d15a3a3340001[1]), float(var_b91d15a3a3340001[2]));
    output = spawnstruct();
    output.poi = poi;
    output.origin = spawnorigin;
    output.angles = spawnangles;
    return output;
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab9b
// Size: 0x57
function isvalidspectatetarget(player) {
    if (!isdefined(player) || !isdefined(player.team) || !isalive(player) || !isdefined(self) || !isdefined(self.team)) {
        return 0;
    }
    return player.team == self.team;
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xabfa
// Size: 0x192
function autoassignquest(player) {
    if (!isdefined(level.questinfo.teamsonquests) || array_contains(level.questinfo.teamsonquests, player.team)) {
        return;
    }
    var_73a1687c46c4d341 = [];
    foreach (type in level.validautoassignquests) {
        var_73a1687c46c4d341 = array_combine(var_73a1687c46c4d341, getlootscriptablearray("brloot_" + type + "_tablet"));
    }
    var_73a1687c46c4d341 = array_randomize(var_73a1687c46c4d341);
    var_d62cc2e2bfa94d60 = undefined;
    var_31a0a0ed9e70e900 = undefined;
    foreach (var_670aa0df96f7de65 in var_73a1687c46c4d341) {
        dist = distance_2d_squared(player.origin, var_670aa0df96f7de65.origin);
        if (dist <= 16777216 && dist >= 16384) {
            player namespace_1eb3c4e0e28fac71::function_bb413728bc5231d0(var_670aa0df96f7de65);
            return;
        }
        if (!isdefined(var_d62cc2e2bfa94d60) || dist < var_31a0a0ed9e70e900) {
            var_d62cc2e2bfa94d60 = var_670aa0df96f7de65;
            var_31a0a0ed9e70e900 = dist;
        }
    }
    if (isdefined(var_d62cc2e2bfa94d60)) {
        player namespace_1eb3c4e0e28fac71::function_bb413728bc5231d0(var_d62cc2e2bfa94d60);
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad93
// Size: 0x8e
function function_11750957aa915a23() {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    timer = getdvarint(@"hash_e022fd0199a95f84");
    level thread function_18f66bbf9aa3c9af(timer);
    /#
        var_9ee9d4d0c69f33cc = timer;
        while (var_9ee9d4d0c69f33cc == timer) {
            var_9ee9d4d0c69f33cc = getdvarint(@"hash_e022fd0199a95f84");
            wait(1);
        }
        level notify("<unknown string>");
        setomnvar("<unknown string>", 5);
        level waittill("<unknown string>");
        setomnvar("<unknown string>", 9);
    #/
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae28
// Size: 0x4b
function function_18f66bbf9aa3c9af(timer) {
    /#
        level endon("<unknown string>");
    #/
    wait(int(max(timer - timer - 600, 0)));
    setomnvar("ui_br_circle_state", 5);
    level waittill("start_dmz_extracts");
    setomnvar("ui_br_circle_state", 9);
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae7a
// Size: 0xb
function eomawardplayerxp() {
    level waittill("give_match_bonus");
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae8c
// Size: 0x49
function function_f1c3982d13453d32(var_16efcf27e6efcbe8, var_15314da30b44470) {
    if (getdvarint(@"hash_3d843517229cd382", 1) && isdefined(level.var_cf3feeaa65a4e3f0)) {
        if (namespace_7afff53e7b73476b::function_f3354ddc02e867c9(var_16efcf27e6efcbe8)) {
            return 0;
        }
    }
    return namespace_d20f8ef223912e12::briskillstreakallowed(var_16efcf27e6efcbe8, var_15314da30b44470);
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaedd
// Size: 0x141
function function_dd432354af4c9024() {
    level.outofboundstriggers = [];
    var_ccfdb06748d7f326 = getentarray("OutOfBounds", "targetname");
    var_d204f6a98a5be26f = getdvarint(@"hash_a4617fb891ca21cb", 0) == 1;
    if (var_d204f6a98a5be26f) {
        foreach (trigger in var_ccfdb06748d7f326) {
            if (isdefined(trigger.script_noteworthy) && trigger.script_noteworthy == "locale_32") {
                level.outofboundstriggers[level.outofboundstriggers.size] = trigger;
            } else {
                trigger delete();
            }
        }
    } else {
        foreach (trigger in var_ccfdb06748d7f326) {
            if (!isdefined(trigger.script_noteworthy)) {
                level.outofboundstriggers[level.outofboundstriggers.size] = trigger;
            } else {
                trigger delete();
            }
        }
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb025
// Size: 0x309
function function_d8431975bbec1179() {
    waitframe();
    while (!isdefined(level.struct_class_names)) {
        waitframe();
    }
    namespace_bfef6903bca5845d::function_2fc80954fa70d153();
    var_1bc434e0a66f7db6 = array_randomize(getstructarray("heli_loc_protected", "script_noteworthy"));
    if (namespace_37f0fb6355a4618a::function_47d356083884f913()) {
        var_50f783a5617f8940 = [];
        foreach (loc in var_1bc434e0a66f7db6) {
            if (!isdefined(loc.poi)) {
                loc.poi = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(loc.origin, 1);
            }
            if (isdefined(loc.poi) && namespace_37f0fb6355a4618a::poi_ispoiactive(loc.poi)) {
                subarea = namespace_bfef6903bca5845d::function_a44e168e8cced18(loc.origin, loc.poi);
                loc.var_71ad22c5d093d90b = subarea.var_71ad22c5d093d90b;
                var_50f783a5617f8940[var_50f783a5617f8940.size] = loc;
            }
        }
        var_1bc434e0a66f7db6 = var_50f783a5617f8940;
    }
    var_387e5f09ea0603e8 = getdvarint(@"hash_673ec70c6eff1e18", 2);
    for (i = 0; i < var_387e5f09ea0603e8; i++) {
        spawndata = spawnstruct();
        if (!isdefined(var_1bc434e0a66f7db6[i])) {
            continue;
        }
        spawndata.origin = var_1bc434e0a66f7db6[i].origin;
        spawndata.angles = var_1bc434e0a66f7db6[i].angles;
        namespace_15d3019056d1bcea::spawnavehicle("little_bird", spawndata);
        var_da8b6c7c8ad40ce1 = getstructarray(var_1bc434e0a66f7db6[i].target, "targetname");
        if (!isdefined(var_da8b6c7c8ad40ce1)) {
            continue;
        }
        foreach (node in var_da8b6c7c8ad40ce1) {
            if (isdefined(node.script_noteworthy)) {
                node.poi = var_1bc434e0a66f7db6[i].poi;
                node.var_71ad22c5d093d90b = var_1bc434e0a66f7db6[i].var_71ad22c5d093d90b;
                script_noteworthy = tolower(node.script_noteworthy);
                if (issubstr(script_noteworthy, "guard")) {
                    namespace_bfef6903bca5845d::function_591b22e0ca8a8be1(node, 1, 1, "medium", "extraGuards");
                } else if (script_noteworthy == "patrolstart" || issubstr(script_noteworthy, "patrolpath")) {
                    pathstruct = namespace_bfef6903bca5845d::function_9edcf99159abb0b(node, issubstr(script_noteworthy, "looped"));
                    namespace_bfef6903bca5845d::function_3dcf83bcef7081ba(pathstruct, 1, 2, undefined, "high", "extraPatrols");
                }
            }
        }
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb335
// Size: 0x107
function function_3403c13cec1cea46() {
    namespace_3c37cb17ade254d::registersharedfunc("lasertrap", "createLootDropInfo", &createlootdropinfo);
    namespace_3c37cb17ade254d::registersharedfunc("lasertrap", "spawnPickup", &namespace_cb965d2f71fefddc::spawnpickup);
    while (!isdefined(level.var_f1073fbd45b59a06) || !istrue(level.var_f1073fbd45b59a06.var_9b87fdb80920f442)) {
        waitframe();
    }
    if (isdefined(level.var_f1bff73a86c35c52)) {
        [[ level.var_f1bff73a86c35c52 ]]();
    }
    if (isdefined(level.aisentryturrets) && isdefined(level.aisentryturrets.var_325f9f15252b4928)) {
        level thread [[ level.aisentryturrets.var_325f9f15252b4928 ]]();
    }
    if (isdefined(level.var_d49fe7f07f2ba493) && isdefined(level.var_d49fe7f07f2ba493.var_325f9f15252b4928)) {
        level thread [[ level.var_d49fe7f07f2ba493.var_325f9f15252b4928 ]]();
    }
    if (namespace_36f464722d326bbe::function_e21746abaaaf8414()) {
        level thread namespace_5fa40aef0a0c4a61::function_7142c6e9236c9683();
        level thread namespace_437d750db8e68984::function_f04c619138baafd8();
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb443
// Size: 0x5d
function createlootdropinfo(baseorigin, baseangles, ignoreent, var_8a600b6102da9f9b, var_f71d4f78d508da69, var_6fe2ff802d5192d4, var_3ace5ac9c7d6fa44) {
    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    return namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, baseorigin, baseangles, ignoreent, var_8a600b6102da9f9b, var_f71d4f78d508da69, var_6fe2ff802d5192d4, var_3ace5ac9c7d6fa44);
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb4a8
// Size: 0x47
function function_9df0ee7fcb9589d4(player, slot, var_c0fce415cdb283c2) {
    namespace_a38a2e1fe7519183::function_351fe4ac57ca37e5(player, slot);
    namespace_aead94004cf4c147::function_8237b4eeab275f08(player, slot, var_c0fce415cdb283c2);
    if (isdefined(var_c0fce415cdb283c2) && var_c0fce415cdb283c2 == "equip_throwing_knife") {
        player namespace_6402197089c71f13::throwing_knife_mp_ontake();
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb4f6
// Size: 0x1fd
function function_5e77414cc166e514() {
    var_1642f84b31faa340 = namespace_37f0fb6355a4618a::function_47d356083884f913();
    if (var_1642f84b31faa340) {
        namespace_37f0fb6355a4618a::function_44739fe1cf82e29a("tripwires");
    }
    tripwires = array_randomize(getentitylessscriptablearray("scriptable_dmz_tripwire", "classname"));
    var_7c17c2fa4ed014b4 = [];
    foreach (tripwire in tripwires) {
        if (istrue(tripwire.var_aad14f891fb70d86)) {
            continue;
        }
        if (!isdefined(tripwire.target)) {
            continue;
        }
        var_3a6b42ab825a103e = tripwire.origin + anglestoforward(tripwire.angles) * 45;
        fortress = namespace_9823ee6035594d67::function_c0a211a69f5f8f2f(var_3a6b42ab825a103e);
        if (isdefined(fortress)) {
            if (var_1642f84b31faa340) {
                namespace_37f0fb6355a4618a::function_d0e7647e5538eb9d(fortress.poi, "tripwires", tripwire);
            }
            if (!isdefined(fortress.tripwires)) {
                fortress.tripwires = [];
            }
            fortress.tripwires[fortress.tripwires.size] = tripwire;
        } else {
            var_7c17c2fa4ed014b4[var_7c17c2fa4ed014b4.size] = tripwire;
        }
    }
    var_bb07898ec09c0f96 = getdvarint(@"hash_b458c6effe039abd", 15);
    var_7c17c2fa4ed014b4 = array_randomize(var_7c17c2fa4ed014b4);
    foreach (index, tripwire in var_7c17c2fa4ed014b4) {
        if (index < var_bb07898ec09c0f96) {
            if (isdefined(level.var_e9a6fc11b0aa7eb2)) {
                [[ level.var_e9a6fc11b0aa7eb2 ]](tripwire);
            }
        } else if (isdefined(level.var_d9d80893720b39df)) {
            [[ level.var_d9d80893720b39df ]](tripwire);
        }
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb6fa
// Size: 0x147
function function_f3a2435f8e39438b() {
    namespace_4b0406965e556711::function_1240434f4201ac9d("prematch_done");
    wait(getdvarint(@"hash_4ef15172b2450728", 240));
    var_32ca6d3e9bc8e099 = getdvarint(@"hash_f8ce5d52364013ce", 5);
    foreach (player in level.players) {
        if (!isdefined(player.team)) {
            continue;
        }
        if (isdefined(player.brmissionscompleted) && player.brmissionscompleted > 0) {
            continue;
        }
        if (namespace_244fdc99ed0f5d2b::function_5ea5a722c499078f(player.team)) {
            continue;
        }
        matchcount = player getplayerdata(level.var_5d69837cf4db0407, "playerStats", "modeStats", "br_dmz", "gamesPlayed");
        if (level.mapname != "mp_bio_lab" && isdefined(matchcount) && matchcount < var_32ca6d3e9bc8e099) {
            namespace_446fc987a980892f::function_d87d5deb069bf8e5(random([0:"mission_reminder_1", 1:"mission_reminder_2"]), [0:player]);
        }
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb848
// Size: 0xb9
function playerskiplootpickup(instance, var_b2635db617b09abd) {
    if (istrue(self.var_859654e0445a36d9) && isdefined(instance) && isdefined(instance.type) && instance.type != "dmz_hostage") {
        var_60227bff1e9478cc = spawnstruct();
        var_60227bff1e9478cc.scriptablename = instance.type;
        var_60227bff1e9478cc.weapon = instance.weapon;
        if (!namespace_cb965d2f71fefddc::isweaponpickupitem(var_60227bff1e9478cc)) {
            return 0;
        }
        if (!istrue(var_b2635db617b09abd)) {
            namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.var_355cddb773cb000d);
        }
        return 1;
    }
    return 0;
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb909
// Size: 0xa95
function function_865b1a5a62c49d7(var_74753a0c1c255400) {
    if (!isdefined(self) || isdefined(self.disconnecting)) {
        return;
    }
    if (istrue(self.var_3716375613ca89fd)) {
        return;
    }
    poisvisited = undefined;
    if (namespace_8361bad7391de074::function_cff2f4f168b29b81()) {
        poisvisited = namespace_54d20dd0dd79277f::getteamdata(self.team, "poisVisited");
    }
    if (isdefined(poisvisited)) {
        poisvisited = poisvisited.size;
    } else {
        poisvisited = 0;
    }
    explorationxp = function_53c4c53197386572(self.pers["explorationXP"], 0);
    var_d961222798f5d01a = function_53c4c53197386572(self.var_79c8f592b7c3c2d6, 0);
    lootingxp = function_53c4c53197386572(self.pers["lootingXP"], 0);
    var_56a4e98c643a1e2d = function_53c4c53197386572(self.var_56a4e98c643a1e2d, 0);
    missionxp = function_53c4c53197386572(self.pers["missionXP"], 0);
    var_b3a234477420dccd = function_53c4c53197386572(self.brmissionscompleted, 0);
    contractxp = function_53c4c53197386572(self.pers["contractXP"], 0);
    var_8ae6c90597daa60a = function_53c4c53197386572(self.var_8ae6c90597daa60a, 0);
    var_ec9a1b9484844fbe = function_53c4c53197386572(self.var_ec9a1b9484844fbe, 0);
    var_fd5c87130f304833 = function_53c4c53197386572(self.var_fd5c87130f304833, 0);
    var_c26450f6e6e47b84 = function_53c4c53197386572(self.var_c26450f6e6e47b84, 0);
    uavtowerxp = function_53c4c53197386572(self.pers["uavTowerXP"], 0);
    var_35b94c88cc1cea97 = function_53c4c53197386572(self.var_35b94c88cc1cea97, 0);
    safeopenedxp = function_53c4c53197386572(self.pers["safeOpenedXP"], 0);
    var_bd3fcbfdeda97e97 = function_53c4c53197386572(self.var_bd3fcbfdeda97e97, 0);
    areaunlockedxp = function_53c4c53197386572(self.pers["areaUnlockedXP"], 0);
    var_320a8ba98ae41575 = function_53c4c53197386572(self.var_320a8ba98ae41575, 0);
    supplydropsopenedxp = function_53c4c53197386572(self.pers["supplyDropsOpenedXP"], 0);
    var_3ae8206b7e8cc06 = function_53c4c53197386572(namespace_62c556437da28f50::getscoreinfovalue(#"kill"), 0);
    var_a8469fc3ed757f0d = function_53c4c53197386572(getdvarint(@"hash_defd7006efde9127", 100), 0);
    var_eb583c04711378a8 = function_53c4c53197386572(getdvarint(@"hash_dfcad66b7ba8da13", 500), 0);
    agentkills = function_53c4c53197386572(self.agentkills, 0);
    var_9ae2028bc0b28ab2 = var_3ae8206b7e8cc06 * agentkills;
    var_32ea0136e9afcd9a = function_53c4c53197386572(self.kills, 0);
    operatorxp = var_a8469fc3ed757f0d * var_32ea0136e9afcd9a;
    var_8c8050d7d861d06c = function_53c4c53197386572(self.var_8c8050d7d861d06c, 0);
    var_6aa094bd7b024408 = function_53c4c53197386572(self.var_6aa094bd7b024408, var_eb583c04711378a8 * var_8c8050d7d861d06c);
    revives = function_53c4c53197386572(self.pers["revives"], 0);
    revivexp = function_53c4c53197386572(self.pers["reviveXP"], 0);
    combatxp = function_53c4c53197386572(self.pers["combatXP"], 0);
    var_cd58b8ffbeb66495 = combatxp - revivexp - var_6aa094bd7b024408 - operatorxp - var_9ae2028bc0b28ab2;
    extractionxp = 0;
    if (istrue(self.extracted) || istrue(var_74753a0c1c255400)) {
        var_33e0291812d90fc1 = namespace_62c556437da28f50::getscoreinfoxp(#"hash_a664e407eb3e39d4");
        if (namespace_85cd45b4fe0d86fb::function_c07675f2ce32fcb5(self)) {
            var_33e0291812d90fc1 = var_33e0291812d90fc1 + getdvarint(@"hash_2b3cb1f1b979a35b", 500);
        }
        extractionxp = function_53c4c53197386572(var_33e0291812d90fc1, 0);
    }
    var_e7faf08f327b0fb5 = function_53c4c53197386572(self.var_e7faf08f327b0fb5, 0);
    if (istrue(level.var_fe38a7ece3409052)) {
        poisvisited = poisvisited + self getplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 0);
        explorationxp = explorationxp + self getplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 1);
        var_d961222798f5d01a = var_d961222798f5d01a + self getplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 2);
        lootingxp = lootingxp + self getplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 3);
        var_56a4e98c643a1e2d = var_56a4e98c643a1e2d + self getplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 4);
        missionxp = missionxp + self getplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 5);
        var_b3a234477420dccd = var_b3a234477420dccd + self getplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 6);
        contractxp = contractxp + self getplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 7);
        var_8ae6c90597daa60a = var_8ae6c90597daa60a + self getplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 8);
        var_ec9a1b9484844fbe = var_ec9a1b9484844fbe + self getplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 9);
        var_c26450f6e6e47b84 = var_c26450f6e6e47b84 + self getplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 10);
        uavtowerxp = uavtowerxp + self getplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 11);
        var_35b94c88cc1cea97 = var_35b94c88cc1cea97 + self getplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 12);
        safeopenedxp = safeopenedxp + self getplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 13);
        var_bd3fcbfdeda97e97 = var_bd3fcbfdeda97e97 + self getplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 14);
        areaunlockedxp = areaunlockedxp + self getplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 15);
        var_320a8ba98ae41575 = var_320a8ba98ae41575 + self getplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 16);
        supplydropsopenedxp = supplydropsopenedxp + self getplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 17);
        agentkills = agentkills + self getplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 18);
        var_9ae2028bc0b28ab2 = var_9ae2028bc0b28ab2 + self getplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 19);
        var_32ea0136e9afcd9a = var_32ea0136e9afcd9a + self getplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 20);
        operatorxp = operatorxp + self getplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 21);
        var_8c8050d7d861d06c = var_8c8050d7d861d06c + self getplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 22);
        var_6aa094bd7b024408 = var_6aa094bd7b024408 + self getplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 23);
        revives = revives + self getplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 24);
        revivexp = revivexp + self getplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 25);
        var_cd58b8ffbeb66495 = var_cd58b8ffbeb66495 + self getplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 26);
        extractionxp = extractionxp + self getplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 27);
        var_e7faf08f327b0fb5 = var_e7faf08f327b0fb5 + self getplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 28);
        var_fd5c87130f304833 = var_fd5c87130f304833 + self getplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 29);
    }
    self setplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 0, poisvisited);
    self setplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 1, explorationxp);
    self setplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 2, var_d961222798f5d01a);
    self setplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 3, lootingxp);
    self setplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 4, var_56a4e98c643a1e2d);
    self setplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 5, missionxp);
    self setplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 6, var_b3a234477420dccd);
    self setplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 7, contractxp);
    self setplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 8, var_8ae6c90597daa60a);
    self setplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 9, var_ec9a1b9484844fbe);
    self setplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 10, var_c26450f6e6e47b84);
    self setplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 11, uavtowerxp);
    self setplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 12, var_35b94c88cc1cea97);
    self setplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 13, safeopenedxp);
    self setplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 14, var_bd3fcbfdeda97e97);
    self setplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 15, areaunlockedxp);
    self setplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 16, var_320a8ba98ae41575);
    self setplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 17, supplydropsopenedxp);
    self setplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 18, agentkills);
    self setplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 19, var_9ae2028bc0b28ab2);
    self setplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 20, var_32ea0136e9afcd9a);
    self setplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 21, operatorxp);
    self setplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 22, var_8c8050d7d861d06c);
    self setplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 23, var_6aa094bd7b024408);
    self setplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 24, revives);
    self setplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 25, revivexp);
    self setplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 26, var_cd58b8ffbeb66495);
    self setplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 27, extractionxp);
    self setplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 28, var_e7faf08f327b0fb5);
    self setplayerdata(level.var_5d69837cf4db0407, "DMZaarValue", 29, var_fd5c87130f304833);
    self.var_3716375613ca89fd = 1;
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc3a5
// Size: 0x38
function onstartgametype() {
    if (namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
        namespace_a38a2e1fe7519183::initteamdatafields();
    }
    level.br_plunder.plunderlimit = getdvarint(@"hash_81ed5b282707434c", 25000);
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc3e4
// Size: 0x25
function function_a7f9424636f37fb1() {
    return level.mapname != "mp_saba" && level.mapname != "mp_saba2";
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc411
// Size: 0xce
function function_bfd9f11e955ace89(player) {
    if (!isdefined(player)) {
        return 0;
    }
    if (!isdefined(level.var_fe2e551da0962c3c) || level.var_fe2e551da0962c3c.size == 0) {
        return 0;
    }
    dist = getdvarint(@"hash_57797986a6d60476", 4096);
    distsq = dist * dist;
    foreach (exfil in level.var_fe2e551da0962c3c) {
        if (distancesquared(exfil.origin, player.origin) < distsq) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc4e7
// Size: 0x251
function function_b71560b07a8f979d(var_d52eae4d954f9a1b) {
    if (getdvarint(@"hash_2fda550ad7ec197f", 1) == 0) {
        return;
    }
    /#
        level thread function_83068181cca9a6ce();
        level thread function_6a65488b49f1f350();
        level thread function_c574618f682ba25e();
        level thread function_53542cd8fe181d7();
    #/
    var_cbbc69e627ec4ae0 = function_91a28c56c45a736f();
    level.var_34858ba8086735c6 = [];
    foreach (var_5e803928bc35a4d6 in var_cbbc69e627ec4ae0) {
        zonename = function_aae8b5dc22c12d2c(var_5e803928bc35a4d6);
        if (issubstr(zonename, var_d52eae4d954f9a1b)) {
            level.var_34858ba8086735c6[level.var_34858ba8086735c6.size] = zonename;
        }
    }
    if (namespace_3c37cb17ade254d::issharedfuncdefined("dmzWar", "poiNameFixer")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("dmzWar", "poiNameFixer") ]]();
    }
    var_50f783a5617f8940 = [];
    foreach (poiname in level.var_34858ba8086735c6) {
        if (array_contains(level.var_dbb3dd5ab77ccd48, poiname)) {
            var_50f783a5617f8940[var_50f783a5617f8940.size] = poiname;
        }
    }
    level.var_34858ba8086735c6 = var_50f783a5617f8940;
    level.var_34858ba8086735c6 = array_remove_duplicates(level.var_34858ba8086735c6);
    level.var_e3e83f2c87707af3 = [];
    if (issubstr(level.mapname, "saba")) {
        level.var_c129fa020d92b91[0] = "aq";
        level.var_c129fa020d92b91[1] = "ru";
    } else if (issubstr(level.mapname, "sealion")) {
        level.var_c129fa020d92b91[0] = "merc";
        level.var_c129fa020d92b91[1] = "ru";
    } else if (issubstr(level.mapname, "delta")) {
        level.var_c129fa020d92b91[0] = "merc";
        level.var_c129fa020d92b91[1] = "ru";
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc73f
// Size: 0x2b
function function_7a7aa3b5455f0412(poiname) {
    if (!isdefined(level.var_34858ba8086735c6)) {
        return 0;
    }
    return array_contains(level.var_34858ba8086735c6, poiname);
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc772
// Size: 0x7e
function function_a1e18f290954a5e9() {
    if (!isdefined(level.var_34858ba8086735c6)) {
        return;
    }
    function_3e8d58a34eb71817();
    function_676d1e19647f363b();
    foreach (poiname in level.var_34858ba8086735c6) {
        function_32eeb14c9c5932ab(poiname);
        level thread function_75512afd0c09ad03(poiname);
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc7f7
// Size: 0xc4
function function_3e8d58a34eb71817() {
    var_3e73140b5586c6ba = getstructarray("dmzWar_fireLoc", "script_noteworthy");
    namespace_37f0fb6355a4618a::function_44739fe1cf82e29a("warFireLocs");
    level.var_d12e916057cf5f18 = getdvarint(@"hash_aa44e542c9b99fe9", 3);
    foreach (var_6c48e2c4741a282d in var_3e73140b5586c6ba) {
        if (isdefined(var_6c48e2c4741a282d.poi) && function_7a7aa3b5455f0412(var_6c48e2c4741a282d.poi)) {
            namespace_37f0fb6355a4618a::function_d0e7647e5538eb9d(var_6c48e2c4741a282d.poi, "warFireLocs", var_6c48e2c4741a282d);
        }
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc8c2
// Size: 0x1ad
function function_32eeb14c9c5932ab(poiname) {
    var_3e73140b5586c6ba = namespace_37f0fb6355a4618a::function_1af8a41e4c1252c7(poiname, "warFireLocs");
    if (var_3e73140b5586c6ba.size == 0) {
        loc = spawnstruct();
        loc.origin = level.var_acf99124377543bb[poiname];
        loc.angles = (0, 0, 0);
        var_3e73140b5586c6ba[var_3e73140b5586c6ba.size] = loc;
    }
    if (!isdefined(level.var_cbe618f35b332990)) {
        level.var_cbe618f35b332990 = spawn("script_origin", (0, 0, 0));
    }
    var_3e73140b5586c6ba = array_randomize(var_3e73140b5586c6ba);
    for (i = 0; i < level.var_d12e916057cf5f18; i++) {
        var_6c48e2c4741a282d = var_3e73140b5586c6ba[i];
        if (!isdefined(var_6c48e2c4741a282d)) {
            break;
        }
        if (!isdefined(var_6c48e2c4741a282d.script_parameters)) {
            continue;
        }
        tokens = strtok(var_6c48e2c4741a282d.script_parameters, " ");
        var_1d01475f82a8218e = random(tokens);
        if (!isdefined(var_1d01475f82a8218e)) {
            break;
        }
        if (var_1d01475f82a8218e == "largefire") {
            var_1d01475f82a8218e = "fire_plume";
        } else if (var_1d01475f82a8218e == "medfire") {
            var_1d01475f82a8218e = "fire_plume_02";
        } else if (var_1d01475f82a8218e == "smoke") {
            var_1d01475f82a8218e = "fire_plume_03";
        }
        var_74484087f576ef7b = spawn("script_model", var_6c48e2c4741a282d.origin);
        var_74484087f576ef7b setmodel(var_1d01475f82a8218e);
        var_74484087f576ef7b forcenetfieldhighlod(1);
        if (var_1d01475f82a8218e != "fire_plume_03") {
            level thread function_7d89b4a3c059dad5(var_74484087f576ef7b, 100);
        }
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca76
// Size: 0x87
function function_7d89b4a3c059dad5(object, radius) {
    level endon("game_ended");
    navobstacle = createnavobstaclebybounds(object.origin, (radius, radius, radius), object.angles);
    while (1) {
        level.var_cbe618f35b332990 radiusdamage(object.origin, radius, 5, 5, level.var_cbe618f35b332990, "MOD_FIRE", "molotov_mp", 0, 0);
        wait(1);
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb04
// Size: 0x21c
function function_676d1e19647f363b() {
    killstreaklocs = getstructarray("killstreakLoc", "script_noteworthy");
    namespace_37f0fb6355a4618a::function_44739fe1cf82e29a("killstreakLocs");
    level.var_b97a5a45a2dba6c = getdvarint(@"hash_f181834d0fddd688", 45);
    level.var_d5c63047751cf4fa = getdvarint(@"hash_d9c60a3d6d9109f2", 10);
    level.var_d1f13aadf10414cc = [];
    level.var_5d440f3b81a8afbf = [];
    level.var_5d440f3b81a8afbf["precision"] = &namespace_bfef6903bca5845d::function_46c2d826ebb9e2cc;
    level.var_5d440f3b81a8afbf["mortar"] = &namespace_bfef6903bca5845d::function_4a618b49270cfd25;
    if (getdvarint(@"hash_a003311e2a2ce147", 1) == 1) {
        level.var_d1f13aadf10414cc[level.var_d1f13aadf10414cc.size] = "precision";
    }
    if (getdvarint(@"hash_c79b251ca40d012c", 1) == 1) {
        level.var_d1f13aadf10414cc[level.var_d1f13aadf10414cc.size] = "mortar";
    }
    foreach (killstreakloc in killstreaklocs) {
        if (isdefined(killstreakloc.poi) && function_7a7aa3b5455f0412(killstreakloc.poi)) {
            tokens = strtok(killstreakloc.script_parameters, " ");
            killstreakloc.var_a6850967c471d767 = [];
            foreach (token in tokens) {
                if (array_contains(level.var_d1f13aadf10414cc, token)) {
                    killstreakloc.var_a6850967c471d767[killstreakloc.var_a6850967c471d767.size] = token;
                }
            }
            namespace_37f0fb6355a4618a::function_d0e7647e5538eb9d(killstreakloc.poi, "killstreakLocs", killstreakloc);
        }
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd27
// Size: 0x161
function function_75512afd0c09ad03(poiname) {
    level endon("game_ended");
    killstreaklocs = namespace_37f0fb6355a4618a::function_1af8a41e4c1252c7(poiname, "killstreakLocs");
    while (1) {
        wait(level.var_b97a5a45a2dba6c + randomintrange(level.var_d5c63047751cf4fa * -1, level.var_d5c63047751cf4fa + 1));
        var_1c4f6d991c751924 = array_randomize(function_7e3f22e620f3f71e(poiname, "everybody"));
        foreach (agent in var_1c4f6d991c751924) {
            if (isdefined(agent) && isagent(agent) && isalive(agent)) {
                killstreakloc = random(killstreaklocs);
                if (!isdefined(agent) || !isdefined(killstreakloc)) {
                    break;
                }
                var_2a011a206cde6940 = random(killstreakloc.var_a6850967c471d767);
                var_2884adc8d320f897 = namespace_bfef6903bca5845d::function_af3034a7c69d7edb(agent.team);
                if (!isdefined(var_2884adc8d320f897)) {
                    continue;
                }
                [[ level.var_5d440f3b81a8afbf[var_2a011a206cde6940] ]](var_2884adc8d320f897, killstreakloc.origin, killstreakloc.radius);
                break;
            }
        }
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xce8f
// Size: 0x144
function function_39aceb03c0aace46(player, meansofdeath) {
    if (!isdefined(level.var_a3de977788317ef5)) {
        level.var_a3de977788317ef5 = getdvarint(@"hash_ec07295b05c0fe7b", 10);
    }
    if (!isdefined(player.var_c669906a542b9baf)) {
        return;
    }
    foreach (nationality, var_cb2f0f5908924bc1 in player.var_c669906a542b9baf) {
        var_24316e3669fb6dda = namespace_14d36171baccf528::function_1bca33010b895b0b(nationality);
        if (var_cb2f0f5908924bc1 >= level.var_a3de977788317ef5 || isdefined(meansofdeath) && meansofdeath == "MOD_EXECUTION") {
            namespace_14d36171baccf528::function_ab491b16f8423c8e(player, var_24316e3669fb6dda, 0);
            group = namespace_14d36171baccf528::function_ed5140c225d4f337(player);
            namespace_14d36171baccf528::function_ca2adce5c7865c20(player, group);
            player thread namespace_44abc05161e2e2cb::showsplash("dmz_friendly_faction_turned_sc", undefined, undefined, undefined, undefined, undefined, 1);
        } else if (var_cb2f0f5908924bc1 == int(level.var_a3de977788317ef5 / 3) && namespace_14d36171baccf528::function_46c0de7595d8cab2(player, var_24316e3669fb6dda)) {
            player thread namespace_44abc05161e2e2cb::showsplash("dmz_friendly_faction_warning_sc", undefined, undefined, undefined, undefined, undefined, 1);
        }
    }
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcfda
// Size: 0xe8
function function_83068181cca9a6ce() {
    /#
        level endon("<unknown string>");
        setdvar(@"hash_178542258ddf9919", 0);
        while (1) {
            var_9f9c381ae9df11a9 = getdvarint(@"hash_178542258ddf9919", 0);
            if (var_9f9c381ae9df11a9 == 1) {
                foreach (poiname in level.var_34858ba8086735c6) {
                    sphere(level.var_acf99124377543bb[poiname], 512, (0, 1, 0));
                    print3d(level.var_acf99124377543bb[poiname] + (0, 0, 552), poiname, (1, 1, 1), 1, 10, 20);
                }
            }
            waitframe();
        }
    #/
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd0c9
// Size: 0x222
function function_6a65488b49f1f350() {
    /#
        level endon("<unknown string>");
        setdvar(@"hash_80402b3ce6537b32", 0);
        while (1) {
            var_9f9c381ae9df11a9 = getdvarint(@"hash_80402b3ce6537b32", 0);
            if (var_9f9c381ae9df11a9 == 1) {
                foreach (poiname in level.var_34858ba8086735c6) {
                    agents = function_7e3f22e620f3f71e(poiname, "<unknown string>");
                    foreach (agent in agents) {
                        if (isagent(agent) && isalive(agent)) {
                            if (issubstr(agent.agent_type, level.var_c129fa020d92b91[0])) {
                                sphere(agent.origin, 64, (1, 0, 0));
                            } else if (issubstr(agent.agent_type, level.var_c129fa020d92b91[1])) {
                                sphere(agent.origin, 64, (0, 0, 1));
                            }
                        } else if (isint(agent)) {
                            var_46c4d85528ff976f = namespace_14d36171baccf528::function_2b0e82156fa6075b(agent);
                            if (issubstr(var_46c4d85528ff976f.aitype, level.var_c129fa020d92b91[0])) {
                                sphere(var_46c4d85528ff976f.origin, 64, (0.45, 0, 0.2));
                            } else if (issubstr(var_46c4d85528ff976f.aitype, level.var_c129fa020d92b91[1])) {
                                sphere(var_46c4d85528ff976f.origin, 64, (0.3, 0.6, 1));
                            }
                        }
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd2f2
// Size: 0x158
function function_c574618f682ba25e() {
    /#
        level endon("<unknown string>");
        setdvar(@"hash_55d29f88459810f", 0);
        while (1) {
            var_9f9c381ae9df11a9 = getdvarint(@"hash_55d29f88459810f", 0);
            if (var_9f9c381ae9df11a9 == 1) {
                foreach (poiname in level.var_34858ba8086735c6) {
                    killstreaklocs = namespace_37f0fb6355a4618a::function_1af8a41e4c1252c7(poiname, "<unknown string>");
                    foreach (killstreakloc in killstreaklocs) {
                        sphere(killstreakloc.origin, killstreakloc.radius, (0, 1, 1));
                        print3d(killstreakloc.origin + (0, 0, 296), killstreakloc.script_parameters, (1, 1, 1), 1, 10, 20);
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd451
// Size: 0x161
function function_53542cd8fe181d7() {
    /#
        level endon("<unknown string>");
        setdvar(@"hash_6b3e8a08b753e1c8", 0);
        while (1) {
            var_9f9c381ae9df11a9 = getdvarint(@"hash_6b3e8a08b753e1c8", 0);
            if (var_9f9c381ae9df11a9 == 1) {
                foreach (poiname in level.var_34858ba8086735c6) {
                    var_3e73140b5586c6ba = namespace_37f0fb6355a4618a::function_1af8a41e4c1252c7(poiname, "<unknown string>");
                    foreach (var_6c48e2c4741a282d in var_3e73140b5586c6ba) {
                        if (!isdefined(var_6c48e2c4741a282d.script_parameters)) {
                            continue;
                        }
                        sphere(var_6c48e2c4741a282d.origin, 128, (0, 1, 1));
                        print3d(var_6c48e2c4741a282d.origin + (0, 0, 296), var_6c48e2c4741a282d.script_parameters, (1, 1, 1), 1, 5, 20);
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace namespace_9a3cc734bcf13a48/namespace_d696adde758cbe79
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd5b9
// Size: 0xbc
function function_3fd2d65f62ca31b0() {
    /#
        while (!isdefined(level.br_pickups)) {
            waitframe();
        }
        wait(1);
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo((16445, -979, 240), (0, 0, 0));
        pickup = namespace_cb965d2f71fefddc::spawnpickup("<unknown string>", var_cb4fad49263e20c4);
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo((49287, -30290, 220), (0, 0, 0));
        pickup = namespace_cb965d2f71fefddc::spawnpickup("<unknown string>", var_cb4fad49263e20c4);
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo((49323, -30377, 220), (0, 0, 0));
        pickup = namespace_cb965d2f71fefddc::spawnpickup("<unknown string>", var_cb4fad49263e20c4);
    #/
}

