// mwiii decomp prototype
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using script_2669878cf5a1b6bc;
#using script_4c770a9a4ad7659c;
#using scripts\mp\killstreaks\target_marker.gsc;
#using scripts\mp\killstreaks\mapselect.gsc;
#using scripts\mp\killstreaks\throwback_marker.gsc;
#using scripts\mp\killstreaks\helicopter.gsc;
#using script_368c8ef99587dfe3;
#using scripts\mp\killstreaks\deployablebox.gsc;
#using scripts\mp\killstreaks\remotetank.gsc;
#using scripts\mp\killstreaks\remoteturret.gsc;
#using scripts\mp\killstreaks\death_switch.gsc;
#using scripts\mp\killstreaks\circle_peek.gsc;
#using scripts\cp_mp\utility\dialog_utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\mp\killstreaks\cruise_predator_mp.gsc;
#using scripts\mp\killstreaks\sentry_gun_mp.gsc;
#using scripts\mp\killstreaks\airstrike_mp.gsc;
#using scripts\mp\killstreaks\juggernaut_mp.gsc;
#using scripts\mp\killstreaks\airdrop_mp.gsc;
#using scripts\mp\killstreaks\airdrop_multiple_mp.gsc;
#using script_6041bc662a0442e;
#using scripts\mp\killstreaks\white_phosphorus_mp.gsc;
#using scripts\mp\killstreaks\gunship_mp.gsc;
#using scripts\mp\killstreaks\manual_turret_mp.gsc;
#using scripts\mp\killstreaks\toma_strike_mp.gsc;
#using scripts\mp\killstreaks\chopper_gunner_mp.gsc;
#using scripts\mp\killstreaks\chopper_support_mp.gsc;
#using scripts\mp\killstreaks\uav_mp.gsc;
#using script_594aedcdfa46e3d7;
#using scripts\mp\killstreaks\emp_drone_mp.gsc;
#using scripts\mp\killstreaks\emp_drone_targeted_mp.gsc;
#using scripts\mp\killstreaks\helper_drone_mp.gsc;
#using scripts\mp\killstreaks\nuke_mp.gsc;
#using script_2f5a7fde37cb4ee8;
#using script_51a20fbac8b22816;
#using script_62172000a46a1193;
#using scripts\mp\outofbounds.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\utility\lui_game_event_aggregator.gsc;

#namespace init_mp;

// Namespace init_mp/namespace_98891fc7958a1128
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e9
// Size: 0x371
function init() {
    level.killstreaktriggeredfunc = &namespace_58a74e7d54b56e8d::streakglobals_onkillstreaktriggered;
    level.killstreakbeginusefunc = &namespace_58a74e7d54b56e8d::streakglobals_onkillstreakbeginuse;
    callback::add("killstreak_finish_use", &namespace_58a74e7d54b56e8d::streakglobals_onkillstreakfinishuse);
    initkillstreakdata();
    if (!isdefined(level.killstreaksetups)) {
        level.killstreaksetups = [];
    }
    thread namespace_85d5d0fd4ecd2e9e::init();
    thread namespace_bc3bdbac7cebdc14::init();
    thread namespace_c88f22851fb1a000::init();
    thread namespace_f88f890445eec227::init();
    if (getdvarint(@"hash_41e841cf6efad236", 0) || getdvar(@"hash_e65e9a96eb2ff62b", "") == "conf_jugg") {
        level.var_f483855733b6ebd9 = 1;
        thread namespace_f280858cfad8e545::init();
    }
    thread namespace_ba66181036094c7e::init();
    thread namespace_6ca1587edcca0018::init();
    thread namespace_55e2ccf03df352f2::init();
    thread namespace_232c69b3c0125f49::init();
    thread namespace_5c7553a2489c3374::init();
    thread namespace_d2b94521fd636348::function_39dc350193dd4bc4();
    namespace_3c37cb17ade254d::registersharedfunc("cruise_predator", "init", &namespace_a3bdd3ddc04af0d3::init);
    namespace_3c37cb17ade254d::registersharedfunc("sentry_gun", "init", &namespace_46189c51f4b96e6c::init);
    namespace_3c37cb17ade254d::registersharedfunc("airstrike", "init", &namespace_863bda310707c7c4::init);
    namespace_3c37cb17ade254d::registersharedfunc("juggernaut", "init", &namespace_2e44b3b70cdb0992::init);
    namespace_3c37cb17ade254d::registersharedfunc("airdrop", "init", &namespace_2f2bf98f82838519::init);
    namespace_3c37cb17ade254d::registersharedfunc("airdrop_multiple", "init", &namespace_3413711df74a6e30::airdrop_multiple_init);
    namespace_3c37cb17ade254d::registersharedfunc("airdrop_escort", "init", &namespace_cf330d307304e7fc::function_f383491974a17b9a);
    namespace_3c37cb17ade254d::registersharedfunc("white_phosphorus", "init", &namespace_4fdbf468d74d2995::init);
    namespace_3c37cb17ade254d::registersharedfunc("gunship", "init", &namespace_26fb742f8cb6d602::init);
    namespace_3c37cb17ade254d::registersharedfunc("manual_turret", "init", &namespace_786d7cfd93ab29c1::init);
    namespace_3c37cb17ade254d::registersharedfunc("toma_strike", "init", &namespace_593aa949abab02a4::init);
    namespace_3c37cb17ade254d::registersharedfunc("chopper_gunner", "init", &namespace_f2c70a7ca7be80b7::init);
    namespace_3c37cb17ade254d::registersharedfunc("chopper_support", "init", &namespace_a199bd32d5c14b0b::init);
    namespace_3c37cb17ade254d::registersharedfunc("uav", "init", &namespace_a10a801a5b8ca5be::init_uav_mp);
    namespace_3c37cb17ade254d::registersharedfunc("uav_bigmap", "init", &namespace_9e7b04da80a97ce9::init);
    namespace_3c37cb17ade254d::registersharedfunc("emp_drone", "init", &namespace_357ddee02a59afef::init);
    namespace_3c37cb17ade254d::registersharedfunc("emp_drone_targeted", "init", &namespace_2abc0d4edfa3b1e2::init);
    namespace_3c37cb17ade254d::registersharedfunc("helper_drone", "init", &namespace_220ed8fa6c43602d::helper_drone_init);
    namespace_3c37cb17ade254d::registersharedfunc("nuke", "init", &namespace_69445cba7d4be87d::init);
    namespace_3c37cb17ade254d::registersharedfunc("hover_jet", "init", &namespace_3f6c2ec2b6aeead8::init);
    namespace_3c37cb17ade254d::registersharedfunc("auto_drone", "init", &namespace_cfea762da482df00::init);
    namespace_3c37cb17ade254d::registersharedfunc("cluster_spike", "init", &namespace_c6f145eb7c1cd71f::init);
    function_b4b623b6321cd521();
    if (isdefined(level.mapcustomkillstreakfunc)) {
        [[ level.mapcustomkillstreakfunc ]]();
    }
    level.killstreakrounddelay = getintproperty(@"hash_336f868b4d4b223", 12);
    level.killstreakactivatedtime = [];
    level thread namespace_58a74e7d54b56e8d::onplayerconnect();
    level thread namespace_58a74e7d54b56e8d::storescorestreakpointsongameend();
    namespace_d9c77dc2a6fe29c6::killstreakregisteroobcallbacks();
    namespace_71eef510d7f364cf::registeronplayerspawncallback(&namespace_58a74e7d54b56e8d::onplayerspawned);
    namespace_3846cfb60b2ef12f::registeronluieventcallback(&namespace_58a74e7d54b56e8d::listenkillstreakaction);
    namespace_3846cfb60b2ef12f::registeronluieventcallback(&namespace_58a74e7d54b56e8d::function_c2861bf9018ab964);
    level thread function_29e99a60706e08b1();
    /#
        setdevdvarifuninitialized(@"hash_2c01d701bac5d9d3", 0);
        setdevdvarifuninitialized(@"hash_698613e6c8c52243", 0);
    #/
}

