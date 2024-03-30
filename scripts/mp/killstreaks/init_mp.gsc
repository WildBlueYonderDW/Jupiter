// mwiii decomp prototype
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\common\callbacks.gsc;
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

// Namespace init_mp / scripts/mp/killstreaks/init_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e9
// Size: 0x371
function init() {
    level.killstreaktriggeredfunc = &scripts/mp/killstreaks/killstreaks::streakglobals_onkillstreaktriggered;
    level.killstreakbeginusefunc = &scripts/mp/killstreaks/killstreaks::streakglobals_onkillstreakbeginuse;
    callback::add("killstreak_finish_use", &scripts/mp/killstreaks/killstreaks::streakglobals_onkillstreakfinishuse);
    initkillstreakdata();
    if (!isdefined(level.killstreaksetups)) {
        level.killstreaksetups = [];
    }
    thread scripts/mp/killstreaks/target_marker::init();
    thread scripts/mp/killstreaks/mapselect::init();
    thread scripts/mp/killstreaks/throwback_marker::init();
    thread scripts/mp/killstreaks/helicopter::init();
    if (getdvarint(@"hash_41e841cf6efad236", 0) || getdvar(@"hash_e65e9a96eb2ff62b", "") == "conf_jugg") {
        level.var_f483855733b6ebd9 = 1;
        thread namespace_f280858cfad8e545::init();
    }
    thread scripts/mp/killstreaks/deployablebox::init();
    thread scripts/mp/killstreaks/remotetank::init();
    thread scripts/mp/killstreaks/remoteturret::init();
    thread scripts/mp/killstreaks/death_switch::init();
    thread scripts/mp/killstreaks/circle_peek::init();
    thread scripts/cp_mp/utility/dialog_utility::function_39dc350193dd4bc4();
    scripts/engine/utility::registersharedfunc("cruise_predator", "init", &scripts/mp/killstreaks/cruise_predator_mp::init);
    scripts/engine/utility::registersharedfunc("sentry_gun", "init", &scripts/mp/killstreaks/sentry_gun_mp::init);
    scripts/engine/utility::registersharedfunc("airstrike", "init", &scripts/mp/killstreaks/airstrike_mp::init);
    scripts/engine/utility::registersharedfunc("juggernaut", "init", &scripts/mp/killstreaks/juggernaut_mp::init);
    scripts/engine/utility::registersharedfunc("airdrop", "init", &scripts/mp/killstreaks/airdrop_mp::init);
    scripts/engine/utility::registersharedfunc("airdrop_multiple", "init", &scripts/mp/killstreaks/airdrop_multiple_mp::airdrop_multiple_init);
    scripts/engine/utility::registersharedfunc("airdrop_escort", "init", &namespace_cf330d307304e7fc::function_f383491974a17b9a);
    scripts/engine/utility::registersharedfunc("white_phosphorus", "init", &scripts/mp/killstreaks/white_phosphorus_mp::init);
    scripts/engine/utility::registersharedfunc("gunship", "init", &scripts/mp/killstreaks/gunship_mp::init);
    scripts/engine/utility::registersharedfunc("manual_turret", "init", &scripts/mp/killstreaks/manual_turret_mp::init);
    scripts/engine/utility::registersharedfunc("toma_strike", "init", &scripts/mp/killstreaks/toma_strike_mp::init);
    scripts/engine/utility::registersharedfunc("chopper_gunner", "init", &scripts/mp/killstreaks/chopper_gunner_mp::init);
    scripts/engine/utility::registersharedfunc("chopper_support", "init", &scripts/mp/killstreaks/chopper_support_mp::init);
    scripts/engine/utility::registersharedfunc("uav", "init", &scripts/mp/killstreaks/uav_mp::init_uav_mp);
    scripts/engine/utility::registersharedfunc("uav_bigmap", "init", &namespace_9e7b04da80a97ce9::init);
    scripts/engine/utility::registersharedfunc("emp_drone", "init", &scripts/mp/killstreaks/emp_drone_mp::init);
    scripts/engine/utility::registersharedfunc("emp_drone_targeted", "init", &scripts/mp/killstreaks/emp_drone_targeted_mp::init);
    scripts/engine/utility::registersharedfunc("helper_drone", "init", &scripts/mp/killstreaks/helper_drone_mp::helper_drone_init);
    scripts/engine/utility::registersharedfunc("nuke", "init", &scripts/mp/killstreaks/nuke_mp::init);
    scripts/engine/utility::registersharedfunc("hover_jet", "init", &namespace_3f6c2ec2b6aeead8::init);
    scripts/engine/utility::registersharedfunc("auto_drone", "init", &namespace_cfea762da482df00::init);
    scripts/engine/utility::registersharedfunc("cluster_spike", "init", &namespace_c6f145eb7c1cd71f::init);
    function_b4b623b6321cd521();
    if (isdefined(level.mapcustomkillstreakfunc)) {
        [[ level.mapcustomkillstreakfunc ]]();
    }
    level.killstreakrounddelay = getintproperty(@"hash_336f868b4d4b223", 12);
    level.killstreakactivatedtime = [];
    level thread scripts/mp/killstreaks/killstreaks::onplayerconnect();
    level thread scripts/mp/killstreaks/killstreaks::storescorestreakpointsongameend();
    scripts/mp/outofbounds::killstreakregisteroobcallbacks();
    scripts/mp/utility/spawn_event_aggregator::registeronplayerspawncallback(&scripts/mp/killstreaks/killstreaks::onplayerspawned);
    scripts/mp/utility/lui_game_event_aggregator::registeronluieventcallback(&scripts/mp/killstreaks/killstreaks::listenkillstreakaction);
    scripts/mp/utility/lui_game_event_aggregator::registeronluieventcallback(&scripts/mp/killstreaks/killstreaks::function_c2861bf9018ab964);
    level thread function_29e99a60706e08b1();
    /#
        setdevdvarifuninitialized(@"hash_2c01d701bac5d9d3", 0);
        setdevdvarifuninitialized(@"hash_698613e6c8c52243", 0);
    #/
}

