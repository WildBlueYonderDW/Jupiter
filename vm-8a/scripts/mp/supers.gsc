#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_1ed1214969b5eba7;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_407c3adf846b725b;
#using scripts\mp\equipment\tactical_cover.gsc;
#using scripts\mp\equipment\support_box.gsc;
#using scripts\mp\supers\super_stoppingpower.gsc;
#using script_1311c5c284dd1537;
#using script_51f5154861435b1e;
#using script_34e2c429f1463c06;
#using script_5e2dcb7fb9811781;
#using script_30cd25db3c981d4f;
#using script_28b451b2ea6dae46;
#using script_45c10ca5cb8409bf;
#using script_4bef961309209288;
#using script_19818a4d668d8841;
#using script_1d393929cf0bd6a2;
#using script_41297c155fdee34;
#using script_22115fec83741670;
#using script_556b8aeaa691317f;
#using script_1b4114093cd44368;
#using script_104e3370b024f998;
#using script_328ceebb19c9cf51;
#using script_24933bc598a88c61;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\analyticslog.gsc;
#using scripts\mp\perks\perkpackage.gsc;
#using scripts\mp\perks\perkfunctions.gsc;
#using script_548072087c9fd504;
#using scripts\mp\supers.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\arbitrary_up.gsc;
#using script_b7a9ce0a2282b79;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\supers\super_deadsilence.gsc;
#using script_19fd5b5d73d44c18;
#using script_601a3d850e6b66eb;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\cp_mp\killstreaks\helper_drone.gsc;
#using scripts\mp\equipment\trophy_system.gsc;
#using scripts\mp\equipment\tac_insert.gsc;
#using script_1cf2ed809496bf4e;
#using script_6d68cfdf0836123c;
#using scripts\cp_mp\killstreaks\emp_drone_targeted.gsc;
#using scripts\mp\supers\laststand_heal.gsc;
#using scripts\mp\equipment\weapon_drop.gsc;
#using script_7ec79670452ec186;
#using script_63634d9fa080435a;
#using script_a698cf430108fb7;
#using script_268c558ddb2267aa;
#using script_676f8221e501bed1;
#using scripts\mp\outofbounds.gsc;

#namespace supers;

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1571
// Size: 0x379
function init() {
    if (!isdefined(level.supertable)) {
        if (isdefined(level.gametypebundle) && isdefined(level.gametypebundle.super_list)) {
            level.supertable = "superlist:" + level.gametypebundle.super_list;
        } else if (isdefined(level.gamemodebundle) && isdefined(level.gamemodebundle.super_list)) {
            level.supertable = "superlist:" + level.gamemodebundle.super_list;
        }
        assertex(isdefined(level.supertable), "Define Super List asset for the gamemodebundle asset for this mode or override level.superTable in script");
    }
    globals = spawnstruct();
    level.superglobals = globals;
    globals.staticsuperdata = [];
    globals.superweapons = [];
    globals.supersbyid = [];
    globals.supersbyoffhand = [];
    globals.supersbyextraweapon = [];
    globals.pointeventdata = [];
    function_f0327aead8f016e2(globals);
    namespace_4a3033eafa6fd07::function_e3234be372f6209d(level.supertable);
    registersupers();
    var_d6ee83b63aa9f11d = spawnstruct();
    var_d6ee83b63aa9f11d.var_47ce480103f7129f = &function_53110a12409d01da;
    callback::callback(#"register_super", var_d6ee83b63aa9f11d);
    callback::remove(#"register_super", #"all");
    initsuperdvars();
    scripts\mp\utility\spawn_event_aggregator::registeronplayerspawncallback(&clearsuperreminderondeath);
    thread watchforgameend();
    if (getdvarint(@"hash_350b9a835c1f30b8", 0) > 0) {
        thread watchsuperlottery();
    }
    if (level.allowsupers || scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        level thread handlesuperearnovertime();
    }
    level notify("init_supers");
    namespace_35cf33c9c2941133::function_bfeeefe1b4413ef0();
    scripts\mp\equipment\tactical_cover::tac_cover_init();
    scripts\mp\equipment\support_box::supportbox_init();
    scripts\mp\supers\super_stoppingpower::stoppingpower_init();
    namespace_5633828963c62e57::function_e24031140ed11f4f();
    namespace_ec12f2e19aa34cc8::function_5027f03acd35a5ca();
    namespace_87a763dd2088afea::function_c35f8fe1f419bb40();
    namespace_15f48ac5c4673765::function_dca5550c46b2a111();
    namespace_71c9e937b8c408a1::function_d1f6522bc93ed94e();
    namespace_6042a7b1a31aaedc::function_a09bd8d12b478568();
    namespace_f4f0e3ec4c6dce27::function_735ed2b006dce0eb();
    namespace_ed60dc1153ae1c06::function_d0930f871341093c();
    namespace_ccba935845e72677::function_68300cd2b488ba4d();
    namespace_eaf4e9860fe32d68::function_9b095d72f2911ec8();
    if (issharedfuncdefined("super_capture_bot", "init")) {
        [[ getsharedfunc("super_capture_bot", "init") ]]();
    }
    namespace_9bdcf9f3e8428ce0::function_4beb6ea484d2db90();
    namespace_c8c97309eacd3392::function_d8b2df497e0b97f();
    namespace_833bd5cc623ca701::function_c916427f116f1206();
    namespace_86d0d418da518a0e::function_234851f94416f178();
    if (issharedfuncdefined("super_med_box", "init")) {
        [[ getsharedfunc("super_med_box", "init") ]]();
    }
    if (issharedfuncdefined("super_comm_scrambler", "init")) {
        [[ getsharedfunc("super_comm_scrambler", "init") ]]();
    }
    if (istrue(level.var_7ebad80a50484a39)) {
        namespace_416e533f6ed17708::init();
        namespace_d287cdac8347c2c7::function_38a4f67440cf220e();
        namespace_5f3bfac07f561003::function_9e8a4373c9755f3d();
    }
    if (issharedfuncdefined("super_hb_sensor", "init")) {
        [[ getsharedfunc("super_hb_sensor", "init") ]]();
    }
    if (issharedfuncdefined("super_launcher", "init")) {
        [[ getsharedfunc("super_launcher", "init") ]]();
    }
    waittillframeend();
    scripts\mp\utility\spawn_event_aggregator::registeronplayerspawncallback(&super_onspawned);
    level.var_3e969a1cc0ad79cc = strtok(getdvar(@"hash_51bbc6411bd93fea", ""), " ");
}

// Namespace supers / scripts\mp\supers
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x18f2
// Size: 0x52
function function_4bdddfbb49e54102(var_511f1c7eaf0d2df7, initfunc) {
    if (!isdefined(level.var_db30cf1837ca94fd)) {
        level.var_db30cf1837ca94fd = [];
    }
    assertex(!isdefined(level.var_db30cf1837ca94fd[var_511f1c7eaf0d2df7]), "Super Init function redefinition.");
    level.var_db30cf1837ca94fd[var_511f1c7eaf0d2df7] = initfunc;
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x194c
// Size: 0xa2
function function_f0327aead8f016e2(globals) {
    if (isdefined(level.gametypebundle)) {
        globals.var_2652b1ba218bbaf5 = istrue(level.gametypebundle.var_2652b1ba218bbaf5);
        globals.var_a33f6855d9867dbf = istrue(level.gametypebundle.var_a33f6855d9867dbf);
        globals.var_5b66ed80c98f795b = istrue(level.gametypebundle.var_5b66ed80c98f795b);
        return;
    }
    globals.var_2652b1ba218bbaf5 = 0;
    globals.var_a33f6855d9867dbf = 0;
    globals.var_5b66ed80c98f795b = 0;
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x19f6
// Size: 0x3a
function private initializesuper(var_511f1c7eaf0d2df7) {
    if (!isdefined(level.var_db30cf1837ca94fd)) {
        return;
    }
    initfunc = level.var_db30cf1837ca94fd[var_511f1c7eaf0d2df7];
    if (!isdefined(initfunc)) {
        return;
    }
    level [[ initfunc ]]();
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a38
// Size: 0x34
function function_22bff45fcf920417(var_a5f886642fea5345) {
    assert(!isdefined(level.var_7de15b4c7f0a425));
    level.var_7de15b4c7f0a425 = [];
    level.var_a5f886642fea5345 = istrue(var_a5f886642fea5345);
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a74
// Size: 0x3f
function function_18a7c22094077fe9(var_db0176d05c1d9564) {
    var_db0176d05c1d9564 = default_to(var_db0176d05c1d9564, 96);
    var_7bfb992cee74d051 = 0.05 * var_db0176d05c1d9564 / 60;
    function_4d75a970580a253c(#"time", var_7bfb992cee74d051);
}

// Namespace supers / scripts\mp\supers
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1abb
// Size: 0x64
function function_4d75a970580a253c(eventref, points) {
    if (!isdefined(points)) {
        return;
    }
    assert(function_d03495fe6418377b(eventref));
    assert(isdefined(level.var_7de15b4c7f0a425));
    if (level.var_a5f886642fea5345 && eventref != #"time") {
        return;
    }
    level.var_7de15b4c7f0a425[eventref] = points;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b27
// Size: 0x5b7
function registersupers() {
    if (getdvarint(@"hash_742caa13b3c2e685")) {
        return;
    }
    function_53110a12409d01da("super_test", undefined, undefined, &testsuperbeginuse, undefined, undefined, undefined, undefined);
    function_53110a12409d01da("super_br_extract", undefined, undefined, &brcircleextract, undefined, undefined, undefined, undefined);
    function_53110a12409d01da("super_tac_cover", undefined, &taccoverunset, &taccoverbeginuse, undefined, undefined, undefined, undefined);
    function_53110a12409d01da("super_recon_drone", undefined, &recondroneunset, &recondronebeginuse, &recondroneenduse, &function_3529248aa2d81abc, undefined, undefined);
    function_53110a12409d01da("super_support_box", undefined, &supportboxunset, &stoppingpowerbeginuse, undefined, undefined, undefined, undefined);
    function_53110a12409d01da("super_trophy", &trophyonset, undefined, undefined, undefined, undefined, undefined, undefined);
    function_53110a12409d01da("super_scramble", undefined, undefined, &scramblebeginuse, &scrambleusefinished, undefined, undefined, undefined);
    function_53110a12409d01da("super_deadsilence", undefined, undefined, &deadsilencebeginuse, &deadsilenceenduse, undefined, undefined, undefined);
    function_53110a12409d01da("super_tac_insert", &tacinsertonset, &tacinsertonunset, undefined, undefined, undefined, undefined, undefined);
    function_53110a12409d01da("super_weapon_drop", undefined, undefined, &superweapondropbeginuse, undefined, undefined, undefined, undefined);
    function_53110a12409d01da("super_select", &superselectonset, &superselectonunset, &superselectbeginuse, undefined, undefined, &function_baf9eeef4cf2bac5, &function_fad6d78d6b3b3359);
    function_53110a12409d01da("super_fulton", undefined, undefined, &superfultonbeginuse, undefined, undefined, undefined, undefined);
    function_53110a12409d01da("super_supply_drop", undefined, undefined, &supersupplydropbeginuse, undefined, undefined, undefined, undefined);
    function_53110a12409d01da("super_tac_camera", &function_d1bd30be0c5ec282, &function_2ef8268013bdbe57, undefined, undefined, undefined, &function_dfc3421815005e62, &function_2b9e988cdb17f507);
    function_53110a12409d01da("super_recon_dart", &function_fad76ffce1bc5317, &function_af1d2e4473f5057e, undefined, undefined, undefined, undefined, undefined);
    function_53110a12409d01da("super_suppression_rounds", undefined, &suppressunset, &function_66c2b6fb2734cbae, undefined, undefined, undefined, undefined);
    function_53110a12409d01da("super_emp_pulse", undefined, &emppulseunset, &function_2de710d6b3c9388e, &function_ca449b017d946d26, undefined, &function_d93f331b74c647f2, undefined);
    function_53110a12409d01da("super_battlerage", undefined, undefined, &function_81a2df228546136e, &function_d1b35aa1689beb06, undefined, undefined, undefined);
    function_53110a12409d01da("super_stimpistol", &function_afd34c64e8c8d5d, &function_90a74a57a43c9808, &function_53025970eb68a86b, &function_fdfae98bcfbf8c7f, undefined, undefined, undefined);
    function_53110a12409d01da("super_smoke_airdrop", undefined, &function_2e14b99891ecbbf4, &function_14761663823dbcb7, undefined, undefined, undefined, undefined);
    function_53110a12409d01da("super_balloon_extract", undefined, undefined, &superfultonbeginuse, undefined, undefined, undefined, undefined);
    function_53110a12409d01da("super_loadout_drop", undefined, undefined, &function_8d6d142bceb819f2, undefined, undefined, undefined, undefined);
    function_53110a12409d01da("super_door_barricade", undefined, undefined, &function_9c38f7ea2223b47c, undefined, undefined, undefined, undefined);
    function_53110a12409d01da("super_deployed_decoy", undefined, &deployeddecoyunset, undefined, undefined, undefined, undefined, &function_25b1b1c8cae25c68);
    function_53110a12409d01da("super_oxygen_mask", undefined, undefined, &namespace_86d0d418da518a0e::give_oxygenmask, undefined, &function_e3c0d84aa4294ee9, undefined, undefined);
    function_53110a12409d01da("super_deployable_kiosk", undefined, undefined, &function_3bc4f06f06e9c62, undefined, undefined, undefined, undefined);
    function_53110a12409d01da("super_fulton", undefined, undefined, &superfultonbeginuse, undefined, undefined, undefined, undefined);
    function_53110a12409d01da("super_supply_drop", undefined, undefined, &supersupplydropbeginuse, undefined, undefined, undefined, undefined);
    function_53110a12409d01da("super_tac_camera", &function_d1bd30be0c5ec282, &function_2ef8268013bdbe57, undefined, undefined, undefined, &function_dfc3421815005e62, &function_2b9e988cdb17f507);
    function_53110a12409d01da("super_recon_dart", &function_fad76ffce1bc5317, &function_af1d2e4473f5057e, undefined, undefined, undefined, undefined, undefined);
    function_53110a12409d01da("super_suppression_rounds", undefined, &suppressunset, &function_66c2b6fb2734cbae, undefined, undefined, undefined, undefined);
    function_53110a12409d01da("super_emp_pulse", undefined, &emppulseunset, &function_2de710d6b3c9388e, &function_ca449b017d946d26, undefined, &function_d93f331b74c647f2, undefined);
    function_53110a12409d01da("super_battlerage", undefined, undefined, &function_81a2df228546136e, &function_d1b35aa1689beb06, undefined, undefined, undefined);
    function_53110a12409d01da("super_smoke_airdrop", undefined, &function_2e14b99891ecbbf4, &function_14761663823dbcb7, undefined, undefined, undefined, undefined);
    function_53110a12409d01da("super_balloon_extract", undefined, undefined, &superfultonbeginuse, undefined, undefined, undefined, undefined);
    function_53110a12409d01da("super_loadout_drop", undefined, undefined, &function_8d6d142bceb819f2, undefined, undefined, undefined, undefined);
    function_53110a12409d01da("super_honeypot", undefined, undefined, &function_b8e4c757481c3bf2, &function_20d973416d5e8d9a, undefined, undefined, undefined);
    function_53110a12409d01da("super_door_barricade", undefined, undefined, &function_9c38f7ea2223b47c, undefined, undefined, undefined, undefined);
    function_53110a12409d01da("super_deployed_decoy", undefined, &deployeddecoyunset, undefined, undefined, undefined, undefined, &function_25b1b1c8cae25c68);
    function_53110a12409d01da("super_laststand_syringe", undefined, undefined, &function_77a8296b67aa7a1c, &function_25ea1075448678c, undefined, undefined, undefined);
    function_53110a12409d01da("super_spykit", undefined, undefined, undefined, &function_e285dcf9693ca723, undefined, undefined, undefined);
    function_53110a12409d01da("super_vehicle_drop", undefined, undefined, &function_7eead274ef83e1b9, undefined, undefined, undefined, undefined);
    function_53110a12409d01da("super_temp_v", undefined, undefined, &function_19b0130d94d96b0b, &function_34956da8dd3afd1f, undefined, &function_cf347a049095421b, undefined);
    function_53110a12409d01da("super_laser_charge", undefined, undefined, &function_fc34a7d0e83b6d77, &function_a7043870418bf96b, undefined, undefined, undefined);
    function_53110a12409d01da("super_high_jump", undefined, undefined, &function_f98d4ec41407bc75, &function_975965422d6bcb49, undefined, undefined, undefined);
    function_53110a12409d01da("super_teleport_deploy", undefined, undefined, &function_e9993ee767c0acf5, &function_ec715b4038ae47c9, undefined, undefined, undefined);
    function_53110a12409d01da("super_melee_jugg", undefined, undefined, &function_e67d9c8005d3f178, &function_13214dc30f36bf08, undefined, undefined, undefined);
    function_53110a12409d01da("super_electric_discharge", undefined, undefined, &function_8d08654f0023d631, &function_2b9dfa62d7e245f5, &function_3a1b0ee4f020ab35, undefined, undefined);
    function_53110a12409d01da("super_hb_sensor", undefined, undefined, undefined, undefined, undefined, &function_6129eaac0c283bb7, &function_96042b357c338ada);
    function_53110a12409d01da("super_evg", undefined, undefined, undefined, undefined, undefined, &function_63cb15591c54cb1, &function_971b383d95556418);
    if (isdefined(level.var_762c63041675c851)) {
        [[ level.var_762c63041675c851 ]]();
    }
    registersuperextraweapon("super_emp_drone", "emp_drone_player_mp");
    registersuperextraweapon("super_emp_drone", "emp_drone_non_player_mp");
    registersuperextraweapon("super_emp_drone", "emp_drone_non_player_direct_mp");
    registersuperextraweapon("super_weapon_drop", "deploy_weapondrop_mp");
}

// Namespace supers / scripts\mp\supers
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20e6
// Size: 0x10f
function function_53110a12409d01da(ref, setfunc, unsetfunc, beginusefunc, endusefunc, var_e0af69536a727f03, var_70b09ed29c10732f, var_1bb8c2de6198881a) {
    staticdata = level.superglobals.staticsuperdata[ref];
    if (!isdefined(staticdata)) {
        println("<dev string:x1c>" + ref + "<dev string:x46>" + level.supertable);
        return;
    }
    staticdata.setfunc = setfunc;
    staticdata.unsetfunc = unsetfunc;
    staticdata.beginusefunc = beginusefunc;
    staticdata.endusefunc = endusefunc;
    staticdata.var_e0af69536a727f03 = var_e0af69536a727f03;
    staticdata.var_70b09ed29c10732f = var_70b09ed29c10732f;
    staticdata.var_1bb8c2de6198881a = var_1bb8c2de6198881a;
    if (!isdefined(var_e0af69536a727f03) && istrue(staticdata.var_ff2e3a3658646a3f)) {
        staticdata.var_e0af69536a727f03 = &function_97eecce0124a7b50;
    }
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21fd
// Size: 0x5a
function function_b11714522b76c040() {
    scripts\engine\utility::registersharedfunc("supers", "setSuperIsActive", &setSuperIsActive);
    scripts\engine\utility::registersharedfunc("supers", "isUsingSuperWeapon", &isUsingSuperWeapon);
    scripts\engine\utility::registersharedfunc("supers", "superHasTimedUsage", &superHasTimedUsage);
    scripts\engine\utility::registersharedfunc("supers", "superHasAmmoUsage", &superHasAmmoUsage);
}

// Namespace supers / scripts\mp\supers
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x225f
// Size: 0x96
function registersuperextraweapon(ref, weapon) {
    if (!isstring(weapon)) {
        weapon = weapon.basename;
    }
    staticdata = level.superglobals.staticsuperdata[ref];
    if (!isdefined(staticdata)) {
        println("<dev string:x7b>" + ref + "<dev string:x8e>");
        return;
    }
    staticdata.extraweapons[staticdata.extraweapons.size] = weapon;
    level.superglobals.supersbyextraweapon[weapon] = staticdata;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22fd
// Size: 0x52
function super_onspawned() {
    if (isdefined(self.super) && level.superglobals.var_2652b1ba218bbaf5) {
        givesuperpoints(getsuperpointsneeded(), undefined, 0);
        thread function_66cc363da0bf8520();
    }
    updatesuperuiprogress();
    updatesuperuistate();
    function_e20ab7a8971ee3f2();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2357
// Size: 0x3c
function function_66cc363da0bf8520() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    self notify("supers_watchingLoadoutchange");
    self endon("supers_watchingLoadoutChange");
    while (true) {
        self waittill("super_set");
        givesuperpoints(getsuperpointsneeded());
    }
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x239b
// Size: 0x27
function function_9d0de1f8996c57f8(superref) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    waitframe();
    self setclientomnvar("ui_super_ref", superref);
}

// Namespace supers / scripts\mp\supers
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23ca
// Size: 0x42c
function givesuper(superref, var_6c70bf5ad211f464, immediate, blueprintindex) {
    if (getdvarint(@"hash_64156ad0392158e4") != 0) {
        return;
    }
    clearsuper(var_6c70bf5ad211f464, superref);
    assertex(!issuperinuse(), "Attempting to give a new super while a super is currently being used. Not supported.");
    if (superref == "") {
        return;
    }
    staticdata = level.superglobals.staticsuperdata[superref];
    if (!isdefined(staticdata)) {
        assertmsg("giveSuper() called for unknown super \"" + superref + "\", make sure it's included in " + level.supertable);
        return;
    }
    superinfo = spawnstruct();
    self.super = superinfo;
    superinfo.staticdata = staticdata;
    superinfo.allowrefund = 1;
    superinfo.numkills = 0;
    superinfo.wasrefunded = 0;
    superinfo.canstow = 0;
    superinfo.lifeid = scripts\cp_mp\utility\killstreak_utility::getcurrentplayerlifeidforkillstreak();
    superinfo.basepoints = 0;
    superinfo.extrapoints = 0;
    superinfo.usestarttime = undefined;
    superinfo.usepercent = 0;
    superinfo.overridepointsneeded = undefined;
    superinfo.var_2d439ede1c8ec8b9 = 0;
    superinfo.var_b0104dddec932264 = 0;
    superinfo.var_7da7aeb063e429ee = 1;
    superinfo.weaponobj = namespace_4a3033eafa6fd07::buildsuper(staticdata.weapon, blueprintindex);
    superinfo.blueprintindex = blueprintindex;
    function_1029081898b028c(0);
    setsuperisinuse(0);
    setSuperIsActive(0);
    if (isdefined(superinfo.staticdata.useweapon)) {
        function_9aa5fdb675559e34();
    }
    superonset(superref);
    thread function_9d0de1f8996c57f8(superref);
    superBasePoints = self.pers["superBasePoints"];
    if (!isdefined(superBasePoints)) {
        superBasePoints = 0;
    }
    self.pers["superBasePoints"] = undefined;
    setsuperbasepoints(superBasePoints);
    superExtraPoints = self.pers["superExtraPoints"];
    if (!isdefined(superExtraPoints)) {
        superExtraPoints = 0;
    }
    self.pers["superExtraPoints"] = undefined;
    setsuperextrapoints(superExtraPoints);
    if (!isdefined(self.pers["superExpended"])) {
        setsuperexpended(0);
    }
    if (istrue(immediate)) {
        givesuperpoints(getsuperpointsneeded());
        superinfo.madeavailabletime = gettime();
        scripts\mp\analyticslog::logevent_superearned(superinfo.madeavailabletime);
    }
    _giveweapon(superinfo.weaponobj);
    ammo = ter_op(issuperready(), 1, 0);
    self setweaponammoclip(superinfo.weaponobj, ammo);
    firstupgrade = level.superglobals.staticsuperdata[scripts\mp\perks\perkpackage::perkpackage_getfirstfieldupgrade()];
    secondupgrade = level.superglobals.staticsuperdata[scripts\mp\perks\perkpackage::perkpackage_getsecondfieldupgrade()];
    var_4e7ea53a34c37fbe = "none";
    var_294b52d8009b81da = "none";
    if (isdefined(firstupgrade) && firstupgrade != staticdata) {
        var_4e7ea53a34c37fbe = firstupgrade.weapon;
    }
    if (isdefined(secondupgrade) && secondupgrade != staticdata) {
        var_294b52d8009b81da = secondupgrade.weapon;
    }
    self assignweaponoffhandspecial(superinfo.weaponobj, var_4e7ea53a34c37fbe, var_294b52d8009b81da);
    params = spawnstruct();
    params.player = self;
    params.superref = superref;
    callback::callback("equipped_super", params);
    thread watchforsuperusebegin();
    thread handlespectating();
    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype() || level.allowsupers) {
        thread watchforrespawn();
        thread storesupercooldownforroundchange();
        thread handleteamchange();
    }
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27fe
// Size: 0x199
function handlesuperearnovertime() {
    level endon("game_ended");
    if (level.superglobals.var_a33f6855d9867dbf) {
        return;
    }
    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        scripts\mp\flags::gameflagwait("prematch_done");
    }
    starttime = gettime();
    waitframe();
    while (true) {
        if (istrue(level.var_d659494e95bd9496)) {
            starttime = gettime();
            waitframe();
            continue;
        }
        playercount = level.players.size;
        var_5c504378bde978e1 = (gettime() - starttime) / 50;
        if (var_5c504378bde978e1 < 11) {
            wait (11 - var_5c504378bde978e1) * 0.05;
            var_5c504378bde978e1 = 11;
        }
        starttime = gettime();
        allowsupers = istrue(level.allowsupers);
        for (startplayer = 0; startplayer < playercount; startplayer += 15) {
            for (updateindex = 0; updateindex < 15; updateindex++) {
                playerindex = startplayer + updateindex;
                player = level.players[playerindex];
                if (!isdefined(player)) {
                    continue;
                }
                if (istrue(player.pausesuperpointsovertime)) {
                    continue;
                }
                if (!(istrue(player.var_678855513f5076ca) || allowsupers)) {
                    continue;
                }
                if (!isreallyalive(player)) {
                    continue;
                }
                currentsuper = player getcurrentsuper();
                if (isdefined(currentsuper) && !currentsuper.isinuse) {
                    player givesuperpoints(0, #"time", 0, var_5c504378bde978e1);
                }
            }
            waitframe();
        }
        waitframe();
    }
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x299f
// Size: 0x103
function function_50f445936b3ddd9e(var_d220971ffe40c601) {
    if (!isdefined(var_d220971ffe40c601)) {
        return 1;
    }
    if (!isdefined(self.perkpackagedata)) {
        return 1;
    }
    if (var_d220971ffe40c601 == "super_select") {
        return 0;
    }
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        if (self.perkpackagedata.firstupgrade == var_d220971ffe40c601) {
            return 0;
        } else {
            return 1;
        }
    }
    var_b4a8899a61e7eee9 = self.perkpackagedata.lastsuper;
    if (!isdefined(var_b4a8899a61e7eee9)) {
        return 1;
    }
    if (var_d220971ffe40c601 == var_b4a8899a61e7eee9) {
        return 1;
    }
    var_1647b158aa996cf8 = function_4b10d71720fc4a4(var_b4a8899a61e7eee9);
    var_327fc859a32ae60 = function_4b10d71720fc4a4(var_d220971ffe40c601);
    var_35b042c5224a1646 = function_d8f9e4158e12de6b();
    if (var_327fc859a32ae60) {
        if (!isdefined(var_35b042c5224a1646) || var_35b042c5224a1646 != var_d220971ffe40c601) {
            function_26f98b45fb791c0e();
        }
        superonunset(var_b4a8899a61e7eee9);
        return 1;
    }
    if (var_1647b158aa996cf8 && !var_327fc859a32ae60) {
        function_7abbee267d3aad2f(var_b4a8899a61e7eee9);
        return 0;
    }
    superonunset(var_b4a8899a61e7eee9);
    return 1;
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2aaa
// Size: 0x3e
function function_4b10d71720fc4a4(superref) {
    staticdata = level.superglobals.staticsuperdata[superref];
    if (!isdefined(staticdata)) {
        return false;
    }
    return istrue(staticdata.var_6af942bb3f913f9f);
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2af1
// Size: 0x38
function function_7abbee267d3aad2f(superref) {
    if (isdefined(self.var_35b042c5224a1646) && self.var_35b042c5224a1646 != superref) {
        function_26f98b45fb791c0e();
    }
    self.var_35b042c5224a1646 = superref;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b31
// Size: 0x72
function function_26f98b45fb791c0e() {
    if (!isdefined(self.var_35b042c5224a1646)) {
        return;
    }
    if (istrue(self.var_3a4fe3013eb35ea0)) {
        return;
    }
    staticdata = level.superglobals.staticsuperdata[self.var_35b042c5224a1646];
    unsetfunc = staticdata.unsetfunc;
    if (!isdefined(unsetfunc)) {
        return;
    }
    self thread [[ unsetfunc ]]();
    self.var_35b042c5224a1646 = undefined;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bab
// Size: 0xb
function function_d8f9e4158e12de6b() {
    return self.var_35b042c5224a1646;
}

// Namespace supers / scripts\mp\supers
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bbf
// Size: 0x167
function clearsuper(var_6c70bf5ad211f464, var_d220971ffe40c601, playerkilled) {
    superinfo = getcurrentsuper();
    var_fa91721e4a69c230 = scripts\mp\perks\perkfunctions::function_66f0cbd5ff8458fe();
    if (issuperinuse() && (istrue(superinfo.staticdata.persistondeath) || superHasTimedUsage() || isUsingSuperWeapon())) {
        superusefinished(0, istrue(playerkilled), 0, 0, 0, 1);
    }
    if (isdefined(superinfo) && isdefined(superinfo.staticdata)) {
        if (function_50f445936b3ddd9e(var_d220971ffe40c601)) {
            superonunset(superinfo.staticdata.ref);
        }
    }
    if (istrue(var_6c70bf5ad211f464) && isdefined(superinfo)) {
        storesuperpoints();
    }
    self clearoffhandspecial();
    if (isdefined(superinfo)) {
        _takeweapon(superinfo.weaponobj);
    }
    if (istrue(level.codcasterenabled) && !isagent(self)) {
        self setspecialactive(0);
    }
    self notify("remove_super");
    self.super = undefined;
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype() && !var_fa91721e4a69c230) {
        self.var_1066fbd86c88a6df = 0;
    }
    thread function_bdcbe42d37001209(0);
    thread function_93b5448ea8f6277b(0);
    self setclientomnvar("ui_super_second_progress", 0);
    self setclientomnvar("ui_super_ref", "none");
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d2e
// Size: 0xd5
function superonset(superref) {
    if (!isdefined(superref)) {
        return;
    }
    if (superref == "none" || superref == "") {
        return;
    }
    staticdata = level.superglobals.staticsuperdata[superref];
    if (!isdefined(staticdata)) {
        return;
    }
    clientnum = self getentitynumber();
    namespace_f5675568ccc8acc6::function_f63556dc2aa67fdc(2, clientnum, undefined);
    if (isdefined(staticdata.var_e0af69536a727f03)) {
        self setclientomnvar("ui_block_fu_not_ready_error", 1);
    }
    self notify("super_set");
    setfunc = staticdata.setfunc;
    if (!isdefined(setfunc)) {
        return;
    }
    if (level.superglobals.var_2652b1ba218bbaf5) {
        givesuperpoints(getsuperpointsneeded(), undefined, 0);
    }
    self thread [[ setfunc ]]();
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e0b
// Size: 0x93
function superonunset(superref) {
    if (!isdefined(superref)) {
        return;
    }
    if (superref == "none" || superref == "") {
        return;
    }
    staticdata = level.superglobals.staticsuperdata[superref];
    if (!isdefined(staticdata)) {
        return;
    }
    if (isdefined(staticdata.var_e0af69536a727f03)) {
        self setclientomnvar("ui_block_fu_not_ready_error", 0);
    }
    self notify("unset_super");
    unsetfunc = staticdata.unsetfunc;
    if (!isdefined(unsetfunc)) {
        return;
    }
    self thread [[ unsetfunc ]]();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ea6
// Size: 0x4b
function function_6a13616c0032bf21() {
    setsuperbasepoints(scripts\mp\supers::getsuperpointsneeded(), 1);
    updatesuperuiprogress();
    updatesuperuistate();
    function_e20ab7a8971ee3f2();
    superinfo = getcurrentsuper();
    self setweaponammoclip(superinfo.weaponobj, 1);
}

// Namespace supers / scripts\mp\supers
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ef9
// Size: 0x78
function setsuperbasepoints(points, setonly, var_5e5d91e0ed56109e) {
    assert(isdefined(points));
    superinfo = getcurrentsuper();
    assertex(!superinfo.isinuse, "setSuperBasePoints() called while the super is in use.");
    superinfo.basepoints = clamp(points, 0, getsuperpointsneeded());
    if (istrue(setonly)) {
        return;
    }
    superpointschanged(var_5e5d91e0ed56109e);
}

// Namespace supers / scripts\mp\supers
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f79
// Size: 0x6f
function setsuperextrapoints(points, setonly) {
    assert(isdefined(points));
    superinfo = getcurrentsuper();
    assertex(!superinfo.isinuse, "setSuperExtraPoints() called while the super is in use.");
    superinfo.extrapoints = clamp(points, 0, getsuperpointsneeded());
    if (istrue(setonly)) {
        return;
    }
    superpointschanged();
}

// Namespace supers / scripts\mp\supers
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ff0
// Size: 0x7d
function function_8c7b1312cf5986b(points, setonly) {
    assert(isdefined(points));
    superinfo = getcurrentsuper();
    if (isdefined(self.overclockcharge) && scripts\mp\utility\perk::_hasperk("specialty_overcharge_field_upgrade")) {
        self.overclockcharge = clamp(points, 0, getsuperpointsneeded());
        if (!istrue(setonly)) {
            function_b3d636936ec98aa0(self.overclockcharge);
            function_e20ab7a8971ee3f2();
        }
    }
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3075
// Size: 0x63
function superpointschanged(var_5e5d91e0ed56109e) {
    superinfo = getcurrentsuper();
    if (getcurrentsuperpoints() >= getsuperpointsneeded()) {
        superearned();
    } else if (!istrue(var_5e5d91e0ed56109e)) {
        self setweaponammoclip(superinfo.weaponobj, 0);
    }
    updatesuperuiprogress();
    updatesuperuistate();
    function_e20ab7a8971ee3f2();
}

// Namespace supers / scripts\mp\supers
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30e0
// Size: 0x27f
function givesuperpoints(points, scoreevent, var_b4b593facaa83af7, pointsmultiplier, var_2569ec7d8016f67f, var_7601733fb3a9ae73) {
    if (istrue(game["isLaunchChunk"]) || !level.allowsupers && !isdefined(self.var_678855513f5076ca)) {
        return;
    }
    if (!scripts\mp\perks\perkfunctions::function_66f0cbd5ff8458fe()) {
        return;
    }
    assert(isdefined(points));
    if (getdvarint(@"hash_eba0ef12e9c9260b", 0) && !istrue(var_b4b593facaa83af7)) {
        return;
    }
    if (isdefined(scoreevent)) {
        points = getsuperpointsforevent(scoreevent);
    }
    if (isdefined(pointsmultiplier)) {
        points *= pointsmultiplier;
    }
    if (scripts\mp\utility\perk::_hasperk("specialty_faster_field_upgrade") && !isdefined(var_2569ec7d8016f67f)) {
        if (isdefined(self.perktunables) && isnumber(self.perktunables.var_d7d948c55db143ae)) {
            points *= self.perktunables.var_d7d948c55db143ae;
        } else {
            points *= getdvarfloat(@"hash_28e84932a9fb43fd");
        }
    }
    if (isdefined(scoreevent) && scoreevent == #"time") {
        modifiedpoints = points * level.superfastchargerate;
    } else if (level.superglobals.var_2652b1ba218bbaf5) {
        modifiedpoints = points;
    } else {
        modifiedpoints = points * level.superpointsmod;
    }
    if (modifiedpoints <= 0) {
        return;
    }
    superinfo = getcurrentsuper();
    if (level.superglobals.var_2652b1ba218bbaf5) {
        superinfo.var_7d00742b258a5aad = 1;
        skiprefill = 0;
    } else {
        skiprefill = issuperready();
    }
    if (!istrue(var_7601733fb3a9ae73)) {
        if (!isdefined(superinfo) || skiprefill || superinfo.isinuse) {
            doovercharge = !scripts\cp_mp\utility\game_utility::isbrstylegametype() || istrue(self.var_514192f8282796c);
            if (isdefined(superinfo) && isdefined(self.overclockcharge) && scripts\mp\utility\perk::_hasperk("specialty_overcharge_field_upgrade") && doovercharge) {
                function_8c7b1312cf5986b(self.overclockcharge + modifiedpoints);
            }
            updatesppm(points, 0, scoreevent);
            return;
        }
    }
    newpointtotal = min(modifiedpoints + superinfo.basepoints, getsuperpointsneeded());
    setsuperbasepoints(newpointtotal);
    updatesppm(points, 1, scoreevent);
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3367
// Size: 0x119
function function_e20ab7a8971ee3f2() {
    superinfo = getcurrentsuper();
    if (!isdefined(superinfo)) {
        return;
    }
    if (isinkillcam() || !isalive(self)) {
        self.var_6b4b4c0692f7bf67 = undefined;
        return;
    }
    if (!isdefined(self.var_491f93d0219d8d44)) {
        self.var_491f93d0219d8d44 = 1;
    }
    pointsneeded = getsuperpointsneeded();
    progress = 0;
    if (superinfo.isinuse) {
        progress = getsuperuseuiprogress();
    } else if (pointsneeded > 0) {
        progress = clamp(getcurrentsuperbasepoints() / pointsneeded, 0, 1);
    }
    var_f52e8a5add0f7ff8 = 0;
    if (isdefined(self.overclockcharge)) {
        if (pointsneeded > 0) {
            var_f52e8a5add0f7ff8 = clamp(self.overclockcharge / pointsneeded, 0, 1);
        }
    }
    if (self.var_491f93d0219d8d44 > 0) {
        var_9cf33e852e0e768a = progress + var_f52e8a5add0f7ff8;
        self setplayersupermeterprogress(var_9cf33e852e0e768a);
    }
    self.var_6b4b4c0692f7bf67 = self.var_491f93d0219d8d44;
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3488
// Size: 0xb9
function function_b3d636936ec98aa0(overclockprogress) {
    superinfo = getcurrentsuper();
    if (!isdefined(superinfo)) {
        return;
    }
    if (!isdefined(self.overclockcharge)) {
        return;
    }
    if (isinkillcam() || !isalive(self)) {
        self.var_2c0bf62a8db71fd0 = undefined;
        return;
    }
    pointsneeded = getsuperpointsneeded();
    progress = 0;
    if (pointsneeded > 0) {
        progress = clamp(overclockprogress / pointsneeded, 0, 1);
    }
    if (!isdefined(self.var_2c0bf62a8db71fd0) || progress != self.var_2c0bf62a8db71fd0) {
        self setclientomnvar("ui_super_second_progress", progress);
    }
    self.var_2c0bf62a8db71fd0 = progress;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3549
// Size: 0xc8
function updatesuperuiprogress() {
    superinfo = getcurrentsuper();
    if (!isdefined(superinfo)) {
        return;
    }
    if (isinkillcam() || !isalive(self)) {
        superinfo.oldprogress = undefined;
        return;
    }
    progress = 0;
    if (superinfo.isinuse) {
        progress = getsuperuseuiprogress();
    } else {
        pointsneeded = getsuperpointsneeded();
        if (pointsneeded > 0) {
            progress = clamp(getcurrentsuperbasepoints() / pointsneeded, 0, 1);
        }
    }
    if (!isdefined(superinfo.oldprogress) || progress != superinfo.oldprogress) {
        thread function_93b5448ea8f6277b(progress);
    }
    superinfo.oldprogress = progress;
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3619
// Size: 0x3d
function function_bdcbe42d37001209(state) {
    self endon("disconnect");
    self endon("remove_super");
    level endon("game_ended");
    self notify("super_state_change");
    self endon("super_state_change");
    waittillframeend();
    self setclientomnvar("ui_super_state", state);
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x365e
// Size: 0x3d
function function_93b5448ea8f6277b(progress) {
    self endon("disconnect");
    self endon("remove_super");
    level endon("game_ended");
    self notify("super_progress_change");
    self endon("super_progress_change");
    waittillframeend();
    self setclientomnvar("ui_super_progress", progress);
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36a3
// Size: 0xd8
function updatesuperuistate() {
    superinfo = getcurrentsuper();
    if (!isdefined(superinfo)) {
        return;
    }
    if (!isdefined(superinfo.isactive)) {
        return;
    }
    if (isinkillcam() || !isalive(self)) {
        superinfo.state = undefined;
        return;
    }
    oldstate = superinfo.state;
    state = 1;
    if (issuperexpended()) {
        state = 4;
    } else if (issuperready()) {
        self setclientomnvar("ui_super_can_use", 1);
        state = 2;
    } else if (issuperinuse()) {
        state = 3;
    }
    if (!isdefined(oldstate) || state != oldstate) {
        if (state == 1) {
            self notify("super_use_charging");
        }
        thread function_bdcbe42d37001209(state);
    }
    superinfo.state = state;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3783
// Size: 0x39
function watchforrespawn() {
    superinfo = getcurrentsuper();
    self endon("disconnect");
    self endon("remove_super");
    while (true) {
        self waittill("spawned_player");
        givesuperweapon(superinfo);
    }
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37c4
// Size: 0x2f
function storesupercooldownforroundchange() {
    self endon("disconnect");
    self endon("remove_super");
    scripts\mp\flags::levelflagwait("game_over");
    if (istrue(game["practiceRound"])) {
        return;
    }
    storesuperpoints();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37fb
// Size: 0x2c
function handlespectating() {
    self endon("disconnect");
    self endon("remove_super");
    self waittill("joined_spectators");
    if (issuperinuse()) {
        waitframe();
    }
    thread clearsuper(1);
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x382f
// Size: 0x58
function handleteamchange() {
    self endon("disconnect");
    self endon("remove_super");
    oldteam = self.team;
    self waittill("joined_team");
    if (issuperinuse()) {
        waitframe();
    }
    if (self.team != oldteam) {
        self.currentfirstupgrade = undefined;
        thread clearsuper(1);
    }
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x388f
// Size: 0x8c
function handlepointdecay() {
    self endon("disconnect");
    self endon("remove_super");
    level endon("game_ended");
    superinfo = getcurrentsuper();
    pointreduction = getdvarfloat(@"hash_e1d7f49648b75f36", 6) * level.framedurationseconds;
    while (true) {
        if (!issupercharging()) {
            waitframe();
            continue;
        }
        points = max(superinfo.extrapoints - pointreduction, 0);
        setsuperextrapoints(points);
        waitframe();
    }
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3923
// Size: 0x224
function superearned() {
    superinfo = getcurrentsuper();
    if (superinfo.blueprintindex > 0 && isdefined(superinfo.staticdata.bundle.var_d96d3e6ceed581fd.blueprints) && isdefined(superinfo.staticdata.bundle.var_d96d3e6ceed581fd.blueprints[superinfo.blueprintindex - 1])) {
        var_9b32d1936831f5aa = superinfo.staticdata.bundle.var_d96d3e6ceed581fd.blueprints[superinfo.blueprintindex - 1].genericblueprint;
        self function_53c61cc39f6a3b11(var_9b32d1936831f5aa);
    }
    self setweaponammoclip(superinfo.weaponobj, 1);
    wasearned = !superinfo.wasrefunded && !istrue(superinfo.var_7d00742b258a5aad);
    superinfo.var_7d00742b258a5aad = undefined;
    self notify("super_ready", wasearned);
    thread watchForSuperHold();
    if (isdefined(superinfo.staticdata.useweapon)) {
        function_9aa5fdb675559e34();
    }
    if (isdefined(superinfo.staticdata.var_70b09ed29c10732f)) {
        self thread [[ superinfo.staticdata.var_70b09ed29c10732f ]]();
    }
    if (wasearned) {
        self.pers["supersEarned"]++;
        self notify("super_earned");
        recordsuperearnedanalytics(superinfo);
    }
    superinfo.madeavailabletime = gettime();
    superinfo.numkills = 0;
    scripts\mp\analyticslog::logevent_superearned(superinfo.madeavailabletime);
    setsuperextrapoints(0, 1);
    setsuperbasepoints(getsuperpointsneeded(), 1);
    if (isdefined(self.matchdatalifeindex)) {
        scripts\mp\analyticslog::logevent_fieldupgradeearned(self, superinfo.staticdata.id);
    }
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b4f
// Size: 0xd5
function watchforsuperusebegin() {
    self endon("disconnect");
    self endon("remove_super");
    while (true) {
        objweapon = self waittill("special_weapon_fired");
        var_113e50541adbc51f = trysuperusebegin(objweapon);
        if (!istrue(var_113e50541adbc51f)) {
            if (getdvarint(@"hash_c8b6c4e40dcae41e", 1) == 1) {
                currentsuper = getcurrentsuper();
                if (isdefined(currentsuper) && isdefined(currentsuper.staticdata) && isdefined(currentsuper.weaponobj) && isdefined(objweapon) && objweapon.basename == currentsuper.weaponobj.basename) {
                    refundsuper();
                }
            } else {
                refundsuper();
            }
            continue;
        }
        self waittill("super_use_finished");
    }
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c2c
// Size: 0x13e
function watchForSuperHold() {
    self endon("disconnect");
    self endon("remove_super");
    self endon("super_use_finished");
    self notify("watchForSuperHold");
    self endon("watchForSuperHold");
    while (true) {
        superinfo = getcurrentsuper();
        if (isdefined(self.var_333e1986ecf511ba)) {
            self.var_333e1986ecf511ba = undefined;
        }
        self.var_333e1986ecf511ba = spawnstruct();
        childthread function_c1b1e5be45024c77(superinfo);
        waittill_any_3("weapon_switch_started", "perkPackage_endThink", "grenade_pullback");
        childthread function_bad0aa1c878da781();
        childthread function_45b568a3dc8beade();
        msg = waittill_any_return_2("superWeaponHoldFail", "superWeaponHoldSucceed");
        if (isdefined(msg) && msg == "superWeaponHoldSucceed") {
            if (isdefined(superinfo) && isdefined(superinfo.weaponobj)) {
                objweapon = superinfo.weaponobj;
                if (self superbuttonpressed() || istrue(self.var_333e1986ecf511ba.var_77c833f50a563d4e)) {
                    if (isdefined(superinfo.staticdata.var_1bb8c2de6198881a)) {
                        self thread [[ superinfo.staticdata.var_1bb8c2de6198881a ]](objweapon);
                    }
                }
            }
        }
    }
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d72
// Size: 0xc5
function function_c1b1e5be45024c77(superinfo) {
    self endon("superHoldMonitoringOffhands");
    while (true) {
        weapon = self waittill("offhand_pullback");
        var_6cbf70934193b715 = 0;
        if (isdefined(superinfo) && isdefined(superinfo.staticdata) && isdefined(weapon.basename)) {
            var_7906bdc926143b34 = superinfo.weaponobj.basename;
            if (weapon.basename == var_7906bdc926143b34) {
                var_6cbf70934193b715 = 1;
            }
        }
        if (var_6cbf70934193b715) {
            self.var_333e1986ecf511ba.var_e8042a24357a2e1e = gettime();
            self.var_333e1986ecf511ba.objweapon = weapon;
        }
        waitframe();
    }
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e3f
// Size: 0x23
function function_45b568a3dc8beade() {
    waitframe();
    childthread function_f605d1759fb37327();
    childthread function_fabca6d2e89350c5();
    childthread function_6e3d8c7959967643();
    childthread function_be547df7936c91dd();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e6a
// Size: 0x18
function function_be547df7936c91dd() {
    self waittill("superWeaponForceHoldSucceed");
    wait 0.3;
    self notify("superWeaponHoldSucceed");
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e8a
// Size: 0x27
function function_f605d1759fb37327() {
    self endon("superWeaponHoldFail");
    self endon("superWeaponHoldSucceed");
    self endon("superWeaponForceHoldSucceed");
    self waittill("weapon_change");
    self notify("superWeaponHoldFail");
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3eb9
// Size: 0x20
function function_fabca6d2e89350c5() {
    self endon("superWeaponHoldFail");
    self endon("superWeaponHoldSucceed");
    self waittill("death");
    self notify("superWeaponHoldFail");
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ee1
// Size: 0x127
function function_6e3d8c7959967643() {
    self endon("superWeaponHoldFail");
    self endon("superWeaponForceHoldSucceed");
    self notify("superHoldMonitoringOffhands");
    objweapon = undefined;
    struct = self.var_333e1986ecf511ba;
    var_503d210471627672 = 0;
    if (isdefined(struct.var_e8042a24357a2e1e)) {
        if (gettime() - struct.var_e8042a24357a2e1e < 500) {
            objweapon = struct.objweapon;
            var_503d210471627672 = 1;
        }
    } else {
        objweapon = self waittill("offhand_pullback");
    }
    if (!isdefined(objweapon)) {
        self notify("superWeaponHoldFail");
        return;
    }
    var_4adc98643bc5e471 = 1;
    if (!isreallyalive(self)) {
        var_4adc98643bc5e471 = 0;
    }
    super = getcurrentsuper();
    if (isdefined(super) && objweapon.basename != super.weaponobj.basename) {
        var_4adc98643bc5e471 = 0;
    }
    if (!val::get("supers")) {
        var_4adc98643bc5e471 = 0;
    }
    if (var_4adc98643bc5e471) {
        if (var_503d210471627672) {
            waitframe();
            self notify("superWeaponForceHoldSucceed");
        } else {
            self notify("superWeaponHoldSucceed");
        }
        return;
    }
    self notify("superWeaponHoldFail");
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4010
// Size: 0x75
function function_bad0aa1c878da781() {
    self notify("checkSuperButtonHeld");
    self endon("checkSuperButtonHeld");
    counter = 0;
    while (self superbuttonpressed()) {
        self setclientomnvar("ui_super_activation_button_held", 1);
        if (counter >= 0.75) {
            self.var_333e1986ecf511ba.var_77c833f50a563d4e = 1;
            break;
        }
        counter += level.framedurationseconds;
        waitframe();
    }
    self setclientomnvar("ui_super_activation_button_held", 0);
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x408d
// Size: 0x58
function trysuperusebegin(objweapon) {
    if (!isreallyalive(self)) {
        return 0;
    }
    if (objweapon.basename != getcurrentsuper().weaponobj.basename) {
        return 0;
    }
    if (!val::get("supers")) {
        return 0;
    }
    return beginsuperuse();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40ee
// Size: 0x5e7
function beginsuperuse() {
    self endon("disconnect");
    superinfo = getcurrentsuper();
    self notify("super_started");
    scripts\mp\gamelogic::sethasdonecombat(self, 1);
    if (superinfo.weaponobj.basename == "support_box_mp") {
        self playlocalsound("iw9_support_box_bring_up_plr_1");
    } else if (superinfo.weaponobj.basename == "tempv_mp" && soundexists("iw9_mtx_tb_stim_activate_plr")) {
        self playsoundtoplayer("iw9_mtx_tb_stim_activate_plr", self);
        if (isdefined(self.team) && soundexists("iw9_mtx_tb_stim_activate_npc")) {
            self playsoundtoteam("iw9_mtx_tb_stim_activate_npc", self.team, self, self);
        }
    }
    var_ba41d234ae2de809 = isdefined(superinfo);
    superisinuse = var_ba41d234ae2de809 && istrue(superinfo.isinuse);
    var_f579d98fe982ce3e = var_ba41d234ae2de809 && isdefined(superinfo.staticdata) && istrue(superinfo.staticdata.var_f579d98fe982ce3e);
    params = spawnstruct();
    params.player = self;
    params.superinfo = superinfo;
    callback::callback("on_used_super", params);
    if (!superisinuse && !var_f579d98fe982ce3e) {
        laststanduse = !istrue(self.inlaststand) || istrue(superinfo.staticdata.canuseinlaststand);
        var_c34782e615981851 = scripts\mp\perks\perkpackage::function_3f7b66d60199a6a6();
        function_c0fe8dee01b2adac(1);
        var_1338411613704f7a = 1;
        if (isdefined(superinfo.staticdata.useweapon)) {
            if (scripts\mp\arbitrary_up::isinarbitraryup() && superdisabledinarbitraryup(superinfo.staticdata.ref)) {
                superdisabledinarbitraryupmessage();
                var_1338411613704f7a = 0;
            } else if (!laststanduse) {
                var_1338411613704f7a = 0;
            } else {
                clipammo = superinfo.staticdata.useweaponclipammo;
                stockammo = superinfo.staticdata.useweaponstockammo;
                if (isdefined(superinfo.var_2ebcbd70919376a7)) {
                    clipammo = superinfo.var_2ebcbd70919376a7.clipammo;
                    stockammo = superinfo.var_2ebcbd70919376a7.stockammo;
                }
                if (var_c34782e615981851) {
                    clipammo = self.perkpackagedata.weaponclipammo[superinfo.staticdata.ref];
                    stockammo = self.perkpackagedata.weaponstockammo[superinfo.staticdata.ref];
                    self.super.var_3d2b63c4e181029d = clipammo;
                    self.super.var_b9ef26fa33686273 = stockammo;
                }
                var_1338411613704f7a = trygiveuseweapon(superinfo.staticdata.useweapon, clipammo, stockammo);
            }
        }
        if (istrue(var_1338411613704f7a) && istrue(laststanduse)) {
            printgameaction("super use started - " + superinfo.staticdata.ref, self);
            if (!isdefined(superinfo.staticdata.beginusefunc) || istrue(self [[ superinfo.staticdata.beginusefunc ]]())) {
                function_c0fe8dee01b2adac(0);
                var_612c93cfb9f62839 = [];
                var_612c93cfb9f62839[0] = "super_use_finished_lb";
                var_612c93cfb9f62839[1] = "super_switched";
                setsuperbasepoints(0);
                setsuperextrapoints(0);
                setsuperisinuse(1);
                setSuperIsActive(1);
                if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
                    self.var_1066fbd86c88a6df = 0;
                }
                superinfo.allowrefund = ter_op(superinfo.staticdata.graceperiod > 0, 1, 0);
                superinfo.usestarttime = gettime();
                superinfo.usepercent = 1;
                self notify("super_use_started");
                thread function_15fe9c03174d698d();
                function_ea2a406d00e424f2();
                if (isdefined(self.matchdatalifeindex)) {
                    scripts\mp\analyticslog::logevent_fieldupgradeactivated(self, superinfo.staticdata.id);
                }
                combatrecordsuperuse(superinfo.staticdata.ref);
                if (istrue(level.codcasterenabled)) {
                    self setspecialactive(1);
                    clientnum = self getentitynumber();
                    namespace_f5675568ccc8acc6::function_f63556dc2aa67fdc(3, clientnum, undefined);
                }
                if (isdefined(self.var_d0c1f5bbf172f9d9)) {
                    self.var_d0c1f5bbf172f9d9 = undefined;
                }
                if (isdefined(superinfo.staticdata.bundle.var_a2d48adbe4702769)) {
                    level thread battlechatter_mp::trysaylocalsound(self, superinfo.staticdata.bundle.var_a2d48adbe4702769);
                }
                return true;
            } else {
                setsuperbasepoints(0);
                setsuperextrapoints(0);
                refundsuper();
                function_c0fe8dee01b2adac(0);
                return false;
            }
        } else {
            if (isdefined(superinfo.staticdata.useweapon) && istrue(var_1338411613704f7a)) {
                thread switchandtakesuperuseweapon();
            }
            if (!istrue(var_1338411613704f7a)) {
                function_c0fe8dee01b2adac(0);
                setsuperbasepoints(0);
                setsuperextrapoints(0);
                setsuperisinuse(1);
                superusefinished(1);
            }
        }
        if (function_565913010c84ffca()) {
            function_c0fe8dee01b2adac(0);
        }
    }
    return false;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46de
// Size: 0x8d
function function_ea2a406d00e424f2() {
    superinfo = getcurrentsuper();
    assertex(isdefined(superinfo.staticdata.var_5c8e66e22b288b33), "No Super Use Type found. Please check the Super's GDT file to make sure a Use Type is being used.");
    var_5c8e66e22b288b33 = superinfo.staticdata.var_5c8e66e22b288b33;
    if (var_5c8e66e22b288b33 == "ONUSE" || var_5c8e66e22b288b33 == "TIME") {
        thread updateusetimedecay();
        return;
    }
    if (var_5c8e66e22b288b33 == "AMMO") {
        thread function_c4c44e009d4f4c6b();
        return;
    }
    return;
}

// Namespace supers / scripts\mp\supers
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4773
// Size: 0xbb
function activatesuper(altmode, var_1e71e1f458960b93) {
    superinfo = getcurrentsuper();
    if (!isdefined(altmode)) {
        altmode = 0;
    }
    assertex(superinfo.isinuse, "activateSuper() called, but the super is not currently being used!");
    if (altmode && isdefined(superinfo.staticdata.activatepenaltyalt)) {
        reducesuperusepercent(superinfo.staticdata.activatepenaltyalt, var_1e71e1f458960b93);
    } else if (isdefined(superinfo.staticdata.activatepenalty)) {
        reducesuperusepercent(superinfo.staticdata.activatepenalty, var_1e71e1f458960b93);
    }
    return true;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4837
// Size: 0xca
function function_15fe9c03174d698d() {
    self endon("disconnect");
    self endon("game_ended");
    self endon("super_use_finished");
    superinfo = getcurrentsuper();
    if (!isdefined(superinfo.staticdata.usetime)) {
        return;
    }
    while (true) {
        waitframe();
        success = 0;
        if (isbot(self)) {
            return;
        }
        success = function_49983afe0a8eb2b1();
        if (!success) {
            continue;
        }
        if (!issuperinuse()) {
            continue;
        }
        if (function_c3479770ffec05e2()) {
            continue;
        }
        repeatresult = function_ada5045140ee0fdf();
        if (!istrue(repeatresult)) {
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                self [[ getsharedfunc("hud", "showErrorMessage") ]]("MP/SUPERS_UNAVAILABLE");
            }
        }
    }
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4909
// Size: 0x89
function function_49983afe0a8eb2b1() {
    childthread function_c4c39359ee1fdecb();
    childthread function_e440752fbbed0dd5();
    childthread function_885e7d0266b391ee();
    msg = self waittill("superRepeatUse");
    self notifyonplayercommandremove("tacButtonPress", "+smoke");
    self notifyonplayercommandremove("tacButtonPress", "+actionslot 1");
    self notifyonplayercommandremove("fragButtonPress", "+frag");
    self notifyonplayercommandremove("fragButtonPress", "+equip_toggle_throw");
    self notifyonplayercommandremove("repeatUseActivate", "+special");
    return msg == "success";
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x499b
// Size: 0x2f
function function_c4c39359ee1fdecb() {
    self endon("superRepeatUse");
    self notifyonplayercommand("repeatUseActivate", "+special");
    self waittill("repeatUseActivate");
    self notify("superRepeatUse", "success");
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49d2
// Size: 0x7d
function function_e440752fbbed0dd5() {
    self endon("superRepeatUse");
    self notifyonplayercommand("tacButtonPress", "+smoke");
    self notifyonplayercommand("fragButtonPress", "+frag");
    var_bd1267e9dea3dba9 = ["tacButtonPress", "fragButtonPress"];
    thread function_8d6d95114b2c9b0d(var_bd1267e9dea3dba9, ["superRepeatUse"], 0.75);
    msg = self waittill("controllerSuperPress");
    self notify("superRepeatUse", msg);
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a57
// Size: 0x7d
function function_885e7d0266b391ee() {
    self endon("superRepeatUse");
    self notifyonplayercommand("tacButtonPress", "+actionslot 1");
    self notifyonplayercommand("fragButtonPress", "+equip_toggle_throw");
    var_bd1267e9dea3dba9 = ["tacButtonPress", "fragButtonPress"];
    thread function_8d6d95114b2c9b0d(var_bd1267e9dea3dba9, ["superRepeatUse"], 0.75);
    msg = self waittill("controllerSuperPress");
    self notify("superRepeatUse", msg);
}

// Namespace supers / scripts\mp\supers
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4adc
// Size: 0x18d
function function_8d6d95114b2c9b0d(var_cf95e74ffd3666c0, var_ad02f85b88a0b345, time) {
    level endon("game_ended");
    ent = spawnstruct();
    ent.threads = 0;
    foreach (endonnotify in var_ad02f85b88a0b345) {
        self endon(endonnotify);
    }
    foreach (stringnotify in var_cf95e74ffd3666c0) {
        childthread waittill_string_no_endon_death(stringnotify, ent);
        ent.threads++;
    }
    while (ent.threads) {
        if (ent.threads == 1) {
            if (isdefined(time)) {
                ent childthread timeout_struct(time);
                msg = ent waittill("returned");
                if (msg == "timeout") {
                    self notify("controllerSuperPress", "timeout");
                } else {
                    self notify("controllerSuperPress", "success");
                }
                ent.threads--;
            }
            continue;
        }
        message = ent waittill("returned");
        ent.threads--;
    }
    ent notify("die");
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c71
// Size: 0xbc
function function_ada5045140ee0fdf() {
    if (!isreallyalive(self)) {
        return 0;
    }
    if (!val::get("supers")) {
        return 0;
    }
    if (isusingremote()) {
        return 0;
    }
    if (istrue(self.oob)) {
        return 0;
    }
    if (self isonladder()) {
        return 0;
    }
    if (self ismantling()) {
        return 0;
    }
    if (!self isonground()) {
        if (self isparachuting() || self isinfreefall()) {
            return 0;
        }
    }
    superinfo = getcurrentsuper();
    repeatresult = 0;
    if (isdefined(superinfo.staticdata.var_e0af69536a727f03)) {
        repeatresult = [[ superinfo.staticdata.var_e0af69536a727f03 ]]();
    }
    return repeatresult;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d36
// Size: 0x184
function function_c4c44e009d4f4c6b() {
    self endon("disconnect");
    self endon("game_ended");
    self endon("super_use_finished");
    self endon("unset_super");
    superinfo = getcurrentsuper();
    usinguseweapon = isdefined(superinfo.staticdata.useweapon);
    useweaponclipammo = superinfo.staticdata.useweaponclipammo;
    var_cca155763701359 = superinfo.staticdata.weaponammo;
    if ((!usinguseweapon || useweaponclipammo < 1) && var_cca155763701359 <= 1) {
        return;
    }
    weaponnotify = "weapon_fired";
    if (!usinguseweapon) {
        weaponnotify = "offhand_fired";
    }
    var_354f8655b711b4b1 = ter_op(usinguseweapon, superinfo.staticdata.useweapon, superinfo.weaponobj);
    if (istrue(superinfo.staticdata.var_ff2e3a3658646a3f)) {
        allowsuperweaponstow();
    }
    var_569d925e5a25df1 = function_395a9cb3ebe25d55(superinfo);
    bulletsfired = scripts\mp\supers::function_45c01cf6ebb2ba62();
    thread function_a4496878854ae85b(superinfo.staticdata.useweapon, var_354f8655b711b4b1, var_569d925e5a25df1 * bulletsfired + 0.001);
    while (true) {
        firedweapon = self waittill(weaponnotify);
        thread function_a4496878854ae85b(firedweapon, var_354f8655b711b4b1, var_569d925e5a25df1);
    }
}

// Namespace supers / scripts\mp\supers
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ec2
// Size: 0xe8
function function_a4496878854ae85b(firedweapon, superweapon, percentreduced) {
    superinfo = getcurrentsuper();
    if (!isdefined(superweapon)) {
        if (!isdefined(superinfo) || !isdefined(superinfo.staticdata)) {
            return;
        }
        superweapon = ter_op(isdefined(superinfo.staticdata.useweapon), superinfo.staticdata.useweapon, superinfo.weaponobj);
    }
    issameweapon = 0;
    if (isweapon(firedweapon)) {
        firedweapon = firedweapon.basename;
    }
    if (isweapon(superweapon)) {
        superweapon = superweapon.basename;
    }
    if (firedweapon == superweapon) {
        function_22e13024dc2774e9();
        reducesuperusepercent(percentreduced);
        updatesuperuiprogress();
        updatesuperuistate();
        function_e20ab7a8971ee3f2();
    }
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fb2
// Size: 0x62
function function_45c01cf6ebb2ba62() {
    ammo = function_3889d69492a93008();
    maxammo = getcurrentsuper().staticdata.useweaponstockammo + getcurrentsuper().staticdata.useweaponclipammo;
    ammoused = maxammo - ammo;
    return ammoused;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x501d
// Size: 0x91
function function_9aa5fdb675559e34() {
    superinfo = getcurrentsuper();
    if (!isdefined(self.super.var_2ebcbd70919376a7)) {
        superinfo.var_2ebcbd70919376a7 = spawnstruct();
    }
    superinfo.var_2ebcbd70919376a7.clipammo = superinfo.staticdata.useweaponclipammo;
    superinfo.var_2ebcbd70919376a7.stockammo = superinfo.staticdata.useweaponstockammo;
}

// Namespace supers / scripts\mp\supers
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50b6
// Size: 0x17b
function function_60e9ab8c0ad6a01c(ammo, type) {
    superinfo = getcurrentsuper();
    if (!isdefined(superinfo)) {
        return;
    }
    if (issharedfuncdefined(superinfo.staticdata.ref, "setAmmo")) {
        self [[ getsharedfunc(superinfo.staticdata.ref, "setAmmo") ]](ammo);
    }
    ammostruct = superinfo.var_2ebcbd70919376a7;
    if (!isdefined(ammostruct)) {
        return;
    }
    useweapon = superinfo.staticdata.useweapon;
    if (!isdefined(useweapon)) {
        return;
    }
    if (!isdefined(type)) {
        type = "all";
    }
    maxclipammo = weaponclipsize(useweapon);
    remainder = 0;
    if (type == "clip" || type == "all") {
        if (ammo > maxclipammo) {
            remainder = ammo - maxclipammo;
            ammo = maxclipammo;
        }
        ammostruct.clipammo = ammo;
    }
    if (type == "stock") {
        ammostruct.stockammo = ammo;
        return;
    }
    if (type == "clip") {
        ammostruct.stockammo += remainder;
        return;
    }
    if (type == "all") {
        ammostruct.stockammo = remainder;
        return;
    }
    assertex(0, "setSuperWeaponAmmo() passed an invalid ammo type to set. Please check your args.");
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5239
// Size: 0xad
function isUsingSuperWeapon() {
    if (!isdefined(self.super)) {
        return false;
    }
    hasammostruct = isdefined(self.super.var_2ebcbd70919376a7);
    hasammocallbacks = isdefined(self.super.staticdata) && issharedfuncdefined(self.super.staticdata.ref, "getAmmo") && issharedfuncdefined(self.super.staticdata.ref, "setAmmo");
    return hasammostruct || hasammocallbacks;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52ef
// Size: 0x42
function function_c2432256b64355ce() {
    superinfo = getcurrentsuper();
    if (!isdefined(superinfo)) {
        return 0;
    }
    ammostruct = superinfo.var_2ebcbd70919376a7;
    if (!isdefined(ammostruct)) {
        return 0;
    }
    return ammostruct.clipammo;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x533a
// Size: 0x42
function function_1f4b9f3ad4696db6() {
    superinfo = getcurrentsuper();
    if (!isdefined(superinfo)) {
        return 0;
    }
    ammostruct = superinfo.var_2ebcbd70919376a7;
    if (!isdefined(ammostruct)) {
        return 0;
    }
    return ammostruct.stockammo;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5385
// Size: 0xa5
function function_3889d69492a93008() {
    superinfo = getcurrentsuper();
    if (!isdefined(superinfo)) {
        return 0;
    }
    if (isdefined(superinfo.staticdata) && issharedfuncdefined(superinfo.staticdata.ref, "getAmmo")) {
        return self [[ getsharedfunc(superinfo.staticdata.ref, "getAmmo") ]]();
    }
    ammostruct = superinfo.var_2ebcbd70919376a7;
    if (!isdefined(ammostruct)) {
        return 0;
    }
    return ammostruct.stockammo + ammostruct.clipammo;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5433
// Size: 0x24
function function_36246fa2b22036ab() {
    superinfo = getcurrentsuper();
    if (!isdefined(superinfo)) {
        return;
    }
    superinfo.var_2ebcbd70919376a7 = undefined;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x545f
// Size: 0x6c
function function_22e13024dc2774e9() {
    superinfo = getcurrentsuper();
    useweapon = superinfo.staticdata.useweapon;
    if (!isdefined(useweapon)) {
        return;
    }
    clipammo = self getweaponammoclip(useweapon);
    stockammo = self getweaponammostock(useweapon);
    function_60e9ab8c0ad6a01c(clipammo + stockammo, "all");
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54d3
// Size: 0x160
function updateusetimedecay() {
    self endon("disconnect");
    self endon("game_ended");
    self endon("super_use_finished");
    self endon("unset_super");
    superinfo = getcurrentsuper();
    if (!isdefined(superinfo.staticdata.usetime) || superinfo.staticdata.usetime == 0) {
        waitframe();
        superusefinished();
        return;
    }
    if (superinfo.staticdata.usetime < 0) {
        return;
    }
    while (true) {
        waitframe();
        if (isdefined(superinfo.staticdata.usedelay)) {
            usedtime = gettime() - superinfo.usestarttime;
            if (usedtime < superinfo.staticdata.usedelay) {
                continue;
            }
        }
        percentreduction = level.framedurationseconds / superinfo.staticdata.usetime;
        if (function_43ec2fc7986c3310()) {
            percentreduction = 0;
        }
        var_c047144a8d9939fe = function_415ab9351849fba8(superinfo) / superinfo.staticdata.usetime;
        reducesuperusepercent(percentreduction - var_c047144a8d9939fe);
        updatesuperuiprogress();
        updatesuperuistate();
        function_e20ab7a8971ee3f2();
    }
}

// Namespace supers / scripts\mp\supers
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x563b
// Size: 0x93
function reducesuperusepercent(percentoff, var_1e71e1f458960b93, var_80bd4dd71b59356b) {
    superinfo = getcurrentsuper();
    assertex(superinfo.isinuse, "reduceSuperUsePercent() called while the super is not in use.");
    superinfo.usepercent = clamp(superinfo.usepercent - percentoff, 0, 1);
    if (istrue(var_1e71e1f458960b93)) {
        superinfo.allowrefund = 0;
    }
    if (!isdefined(var_80bd4dd71b59356b) || var_80bd4dd71b59356b == 0) {
        superusedurationupdated();
    }
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56d6
// Size: 0x51
function function_a2a1403d5924109(percentage) {
    superinfo = getcurrentsuper();
    var_b4588f310900dba5 = superinfo.usepercent + percentage;
    superinfo.usepercent = clamp(var_b4588f310900dba5, 0, 1);
    return var_b4588f310900dba5;
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5730
// Size: 0x77
function function_7c67c8e12db38300(seconds) {
    superinfo = getcurrentsuper();
    maxseconds = superinfo.staticdata.usetime;
    if (!isdefined(seconds)) {
        return 0;
    }
    if (seconds <= 0) {
        return 0;
    }
    if (seconds > maxseconds) {
        seconds = maxseconds;
    }
    percentage = 0;
    if (maxseconds > 0) {
        percentage = seconds / maxseconds;
    }
    function_a2a1403d5924109(percentage);
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57af
// Size: 0x44
function resetsuperusepercent() {
    superinfo = getcurrentsuper();
    assertex(superinfo.isinuse, "resetSuperUsePercent() called while the super is not in use.");
    superinfo.usepercent = 1;
    superusedurationupdated();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57fb
// Size: 0x2e
function superusedurationupdated() {
    superinfo = getcurrentsuper();
    if (superinfo.usepercent <= 0) {
        superusefinished();
    }
}

// Namespace supers / scripts\mp\supers
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5831
// Size: 0x493
function superusefinished(var_3179afaa208defa2, fromdeath, var_e68637fb8c1c346b, var_e743a22765d93795, attacker, fromclear) {
    superinfo = getcurrentsuper();
    self notify("super_use_finished_lb");
    clientnum = self getentitynumber();
    namespace_f5675568ccc8acc6::function_f63556dc2aa67fdc(4, clientnum, undefined);
    if (isdefined(superinfo)) {
        shouldrefund = 0;
        if (!istrue(var_3179afaa208defa2) && !istrue(var_e743a22765d93795)) {
            shouldrefund = shouldrefundsuper();
        }
        setsuperisinuse(0);
        setSuperIsActive(0);
        superinfo.canstow = 0;
        var_e2c5bb15593b4812 = undefined;
        if (isdefined(superinfo.staticdata.endusefunc)) {
            if (!isdefined(fromdeath)) {
                fromdeath = 0;
            }
            var_e2c5bb15593b4812 = self [[ superinfo.staticdata.endusefunc ]](fromdeath, attacker);
        }
        if (shouldrefund || istrue(var_3179afaa208defa2) || istrue(var_e2c5bb15593b4812)) {
            setsuperexpended(0);
            refundsuper();
        } else if (istrue(var_e68637fb8c1c346b)) {
            setsuperexpended(0);
            var_8f0a7c929337d710 = getsuperpointsneeded() * superinfo.usepercent;
            superinfo.wasrefunded = 1;
            setsuperbasepoints(var_8f0a7c929337d710);
        } else if (istrue(self.var_678855513f5076ca) && scripts\mp\perks\perkfunctions::function_66f0cbd5ff8458fe() || !istrue(self.var_678855513f5076ca) && isdefined(self.overclockcharge) && scripts\mp\utility\perk::_hasperk("specialty_overcharge_field_upgrade")) {
            setsuperexpended(0);
            setsuperbasepoints(self.overclockcharge);
            function_8c7b1312cf5986b(0);
            superinfo.lastfinishtime = gettime();
            superinfo.wasrefunded = 0;
        } else if (!istrue(fromclear)) {
            thread function_e648b6fc93bbc0e0();
            superinfo.lastfinishtime = gettime();
            superinfo.wasrefunded = 0;
        }
        thread switchandtakesuperuseweapon(1, 1);
        if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            if (!level.allowsupers && !isdefined(self.var_678855513f5076ca)) {
                if (!istrue(var_3179afaa208defa2)) {
                    self setclientomnvar("ui_perk_package_state", 0);
                    thread function_93b5448ea8f6277b(0);
                    namespace_a38a2e1fe7519183::function_351fe4ac57ca37e5(self, "super");
                    self.var_1066fbd86c88a6df = 0;
                    if (function_f95bcca44e8cba53(superinfo.staticdata.ref)) {
                        scripts\mp\supers::clearsuper();
                    }
                }
            } else if (isdefined(superinfo.staticdata.brsingleuse) || function_f95bcca44e8cba53(superinfo.staticdata.ref)) {
                scripts\mp\supers::clearsuper();
                thread function_93b5448ea8f6277b(0);
                thread function_bdcbe42d37001209(0);
            }
        }
        if (isdefined(superinfo.blueprintindex) && superinfo.blueprintindex > 0 && isdefined(superinfo.staticdata.bundle.var_d96d3e6ceed581fd.blueprints) && isdefined(superinfo.staticdata.bundle.var_d96d3e6ceed581fd.blueprints[superinfo.blueprintindex - 1])) {
            var_9b32d1936831f5aa = superinfo.staticdata.bundle.var_d96d3e6ceed581fd.blueprints[superinfo.blueprintindex - 1].genericblueprint;
            self function_9bc014e7042e8339(var_9b32d1936831f5aa);
        }
        if (isdefined(superinfo.usestarttime) && isdefined(superinfo.madeavailabletime)) {
            timedifference = superinfo.usestarttime - superinfo.madeavailabletime;
            scripts\mp\analyticslog::logevent_superended(superinfo.staticdata.ref, timedifference, 0, superinfo.numkills);
        }
        printgameaction("super use ended - " + superinfo.staticdata.ref, self);
    }
    if (istrue(level.codcasterenabled)) {
        self setspecialactive(0);
    }
    level.var_44c84134585ab85b = 1;
    callback::callback("on_super_use_finished", superinfo);
    self notify("super_use_finished");
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ccc
// Size: 0x22
function function_e648b6fc93bbc0e0() {
    level endon("game_ended");
    self endon("disconnect");
    setsuperexpended(1);
    waitframe();
    setsuperexpended(0);
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5cf6
// Size: 0xd4
function refundsuper() {
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        if (isdefined(self.equipment["super"])) {
            scripts\mp\gametypes\br_pickups::function_1615eaec0c470f4f(self.equipment["super"], self.super.staticdata.ref);
        }
        return;
    }
    superinfo = getcurrentsuper();
    if (superinfo.isinuse) {
        superusefinished(1);
    }
    if (isdefined(superinfo)) {
        self.super.wasrefunded = 1;
        if (superinfo.isinuse) {
            superusefinished(0);
        }
        givesuperpoints(getsuperpointsneeded(), undefined, undefined, undefined, undefined, 1);
        self setweaponammoclip(superinfo.weaponobj, 1);
    }
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5dd2
// Size: 0x7f
function handledeath(attacker) {
    self endon("disconnect");
    if (!issuperinuse()) {
        return;
    }
    superinfo = getcurrentsuper();
    var_3179afaa208defa2 = superinfo.staticdata.refundondeath;
    persistondeath = superinfo.staticdata.persistondeath;
    if (!istrue(persistondeath)) {
        superusefinished(var_3179afaa208defa2, 1, undefined, undefined, attacker);
    }
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5e59
// Size: 0x47
function monitoruseweaponfiring(var_354f8655b711b4b1) {
    self endon("death_or_disconnect");
    self endon("super_use_finished");
    self endon("remove_super");
    while (true) {
        objweapon = self waittill("weapon_fired");
        if (issameweapon(objweapon, var_354f8655b711b4b1, 1)) {
        }
    }
}

// Namespace supers / scripts\mp\supers
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ea8
// Size: 0x98
function trygiveuseweapon(useweapon, clipammo, stockammo) {
    self endon("death_or_disconnect");
    _giveweapon(useweapon);
    if (!isdefined(clipammo)) {
        clipammo = function_c2432256b64355ce();
    }
    if (!isdefined(stockammo)) {
        stockammo = function_1f4b9f3ad4696db6();
    }
    if (clipammo + stockammo == 0) {
        return false;
    }
    self setweaponammoclip(useweapon, clipammo);
    self setweaponammostock(useweapon, stockammo);
    switchresult = domonitoredweaponswitch(useweapon, isbot(self));
    if (switchresult) {
        thread function_573f49bb5d5a86ea(useweapon);
        function_22e13024dc2774e9();
        return true;
    }
    abortmonitoredweaponswitch(useweapon);
    return false;
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5f49
// Size: 0xc9
function manageuseweapon(useweapon) {
    self endon("death_or_disconnect");
    self endon("super_use_finished");
    superinfo = getcurrentsuper();
    superinfo.useweaponswapped = undefined;
    var_9de0ea5672c044fc = 0;
    while (true) {
        weapon = self getcurrentweapon();
        if (!istrue(superinfo.canstow) && !issameweapon(useweapon, weapon, 1)) {
            if (weapon.basename == "iw7_uplinkball_mp" || weapon.basename == "iw7_tdefball_mp") {
                var_9de0ea5672c044fc = 1;
            }
            break;
        }
        waitframe();
    }
    if (issuperinuse()) {
        superinfo.useweaponswapped = 1;
        superusefinished(undefined, undefined, var_9de0ea5672c044fc);
    }
}

// Namespace supers / scripts\mp\supers
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x601a
// Size: 0x7c
function function_ff3b77706565dacf(useweapon, newweapon) {
    if (!issameweapon(useweapon, newweapon, 1) && newweapon.basename != "iw9_knifestab_mp" && newweapon.basename != "iw9_lm_dblmg_execution_mp" && newweapon.basename != "iw9_gunless" && newweapon.basename != "none") {
        return 1;
    }
    return 0;
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x609e
// Size: 0x64
function function_573f49bb5d5a86ea(useweapon) {
    self endon("death_or_disconnect");
    self endon("super_use_finished");
    useweapon = self waittill("weapon_change");
    while (true) {
        newweapon = self waittill("weapon_change");
        weapon = self getcurrentweapon();
        if (function_ff3b77706565dacf(useweapon, newweapon)) {
            switchandtakesuperuseweapon(1);
            return;
        }
    }
}

// Namespace supers / scripts\mp\supers
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x610a
// Size: 0xa1
function switchandtakesuperuseweapon(cacheammo, onend) {
    self endon("death");
    superinfo = getcurrentsuper();
    useweapon = superinfo.staticdata.useweapon;
    if (!isdefined(useweapon)) {
        return;
    }
    if (istrue(cacheammo) && issameweapon(self getcurrentweapon(), useweapon)) {
        function_22e13024dc2774e9();
    }
    if (isswitchingtoweaponwithmonitoring(useweapon)) {
        abortmonitoredweaponswitch(useweapon);
    }
    if (istrue(onend)) {
        self notify("super_switched");
    }
    getridofweapon(useweapon);
    if (!istrue(onend)) {
        setSuperIsActive(0);
    }
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61b3
// Size: 0xdc
function storesuperpoints() {
    superinfo = getcurrentsuper();
    if (!isdefined(superinfo)) {
        return;
    }
    if (issupercharging() || issuperready()) {
        self.pers["superBasePoints"] = superinfo.basepoints;
        self.pers["superExtraPoints"] = superinfo.extrapoints;
        return;
    }
    if (issuperinuse() && shouldrefundsuper()) {
        pointsneeded = getsuperpointsneeded();
        self.pers["superPoints"] = superinfo.usepercent * pointsneeded;
        self.pers["superExtraPoints"] = 0;
        return;
    }
    self.pers["superBasePoints"] = 0;
    self.pers["superExtraPoints"] = 0;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6297
// Size: 0x3a
function getsuperuseuiprogress() {
    superinfo = getcurrentsuper();
    assertex(superinfo.isinuse, "getSuperUseProgress() called when super is not in use.");
    /#
    #/
    return superinfo.usepercent;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62da
// Size: 0x12
function getcurrentsuperbasepoints() {
    return getcurrentsuper().basepoints;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62f5
// Size: 0x12
function getcurrentsuperextrapoints() {
    return getcurrentsuper().basepoints;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6310
// Size: 0x2a
function getcurrentsuperpoints() {
    superinfo = getcurrentsuper();
    return superinfo.basepoints + superinfo.extrapoints;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6343
// Size: 0x68
function getsuperpointsneeded() {
    superinfo = getcurrentsuper();
    pointsneeded = 0;
    if (isdefined(superinfo)) {
        pointsneeded = superinfo.staticdata.pointsneeded;
    }
    if (isdefined(self.perkpackagedata.overridepointsneeded)) {
        pointsneeded = self.perkpackagedata.overridepointsneeded;
    }
    return pointsneeded;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63b4
// Size: 0x4e
function issuperready() {
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        return self.var_1066fbd86c88a6df;
    }
    superinfo = getcurrentsuper();
    if (!isdefined(superinfo) || superinfo.isinuse) {
        return 0;
    }
    return getcurrentsuperpoints() >= getsuperpointsneeded();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x640a
// Size: 0x59
function function_6c06220f8b5b7079() {
    superinfo = getcurrentsuper();
    if (!isdefined(superinfo) || superinfo.isinuse) {
        return false;
    }
    if (!isdefined(self.overclockcharge) || !scripts\mp\utility\perk::_hasperk("specialty_overcharge_field_upgrade")) {
        return false;
    }
    return self.overclockcharge >= getsuperpointsneeded();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x646c
// Size: 0x1d
function function_c3479770ffec05e2() {
    return isdefined(getcurrentsuper()) && getcurrentsuper().isactive;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6492
// Size: 0x1d
function issuperinuse() {
    return isdefined(getcurrentsuper()) && getcurrentsuper().isinuse;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64b8
// Size: 0xc
function function_565913010c84ffca() {
    return istrue(self.var_65bd32c9df8d4292);
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64cd
// Size: 0x15
function function_c0fe8dee01b2adac(var_623c13007339ec2f) {
    self.var_65bd32c9df8d4292 = var_623c13007339ec2f;
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64ea
// Size: 0x29
function function_1029081898b028c(ispaused) {
    superinfo = getcurrentsuper();
    superinfo.var_6b24c44c436dd911 = ispaused;
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x651b
// Size: 0x30
function setsuperisinuse(isinuse) {
    superinfo = getcurrentsuper();
    superinfo.isinuse = isinuse;
    updatesuperuistate();
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6553
// Size: 0x56
function setSuperIsActive(isactive) {
    superinfo = getcurrentsuper();
    superinfo.isactive = isactive;
    if (!isactive && issuperinuse()) {
        self setclientomnvar("ui_super_can_use", 1);
        return;
    }
    self setclientomnvar("ui_super_can_use", 0);
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65b1
// Size: 0x13
function issupercharging() {
    return !issuperready() && !issuperinuse();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65cd
// Size: 0xe
function issuperexpended() {
    return istrue(getpersstat("superExpended"));
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65e4
// Size: 0x3c
function function_f95bcca44e8cba53(superref) {
    if (!isdefined(superref)) {
        return 0;
    }
    if (!isdefined(level.var_3e969a1cc0ad79cc)) {
        return 0;
    }
    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        return 0;
    }
    return array_contains(level.var_3e969a1cc0ad79cc, superref);
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6629
// Size: 0x23
function setsuperexpended(var_a6b84f600dc33630) {
    self.pers["superExpended"] = var_a6b84f600dc33630;
    updatesuperuistate();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6654
// Size: 0xb
function getcurrentsuper() {
    return self.super;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6668
// Size: 0x2f
function getcurrentsuperref() {
    superinfo = getcurrentsuper();
    if (!isdefined(superinfo)) {
        return undefined;
    }
    return superinfo.staticdata.ref;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66a0
// Size: 0x36
function function_43ec2fc7986c3310() {
    superinfo = getcurrentsuper();
    if (!isdefined(superinfo)) {
        return 0;
    }
    if (!isdefined(superinfo.var_6b24c44c436dd911)) {
        return 0;
    }
    return superinfo.var_6b24c44c436dd911;
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66df
// Size: 0x78
function function_415ab9351849fba8(superinfo) {
    if (!superinfo.isinuse) {
        return;
    }
    var_adb9fb37d7698f6c = max(0, superinfo.var_2d439ede1c8ec8b9 - superinfo.var_b0104dddec932264);
    refillrate = min(superinfo.var_7da7aeb063e429ee, var_adb9fb37d7698f6c);
    superinfo.var_b0104dddec932264 += refillrate;
    return refillrate;
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6760
// Size: 0x51
function function_b5e551ba033bbd3b(seconds) {
    superinfo = getcurrentsuper();
    if (!isdefined(superinfo) || !superinfo.isinuse) {
        return;
    }
    superinfo.var_2d439ede1c8ec8b9 += max(0, seconds);
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x67b9
// Size: 0x35
function function_c018f54841eb7b(var_500338cbcd60c91e) {
    superinfo = getcurrentsuper();
    if (!isdefined(superinfo)) {
        return;
    }
    superinfo.var_7da7aeb063e429ee = max(0, var_500338cbcd60c91e);
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67f6
// Size: 0x94
function shouldrefundsuper() {
    assert(issuperinuse());
    superinfo = getcurrentsuper();
    graceperiod = superinfo.staticdata.graceperiod;
    if (!isdefined(superinfo.usestarttime)) {
        return 0;
    }
    usedtime = gettime() - superinfo.usestarttime;
    if (usedtime >= graceperiod) {
        return 0;
    }
    if (superinfo.numkills > 0) {
        return 0;
    }
    return superinfo.allowrefund;
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6893
// Size: 0x82
function getsuperrefforsuperuseweapon(weapon) {
    if (!isstring(weapon)) {
        weapon = weapon.basename;
    }
    if (!isdefined(level.superglobals) || !isdefined(level.superglobals.superweapons) || !isdefined(level.superglobals.superweapons[weapon])) {
        return undefined;
    }
    return level.superglobals.superweapons[weapon].ref;
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x691e
// Size: 0x5b
function getsuperrefforsuperoffhand(weapon) {
    if (!isstring(weapon)) {
        weapon = weapon.basename;
    }
    if (!isdefined(level.superglobals.supersbyoffhand[weapon])) {
        return undefined;
    }
    return level.superglobals.supersbyoffhand[weapon].ref;
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6982
// Size: 0x5b
function getsuperrefforsuperextraweapon(weapon) {
    if (!isstring(weapon)) {
        weapon = weapon.basename;
    }
    if (!isdefined(level.superglobals.supersbyextraweapon[weapon])) {
        return undefined;
    }
    return level.superglobals.supersbyextraweapon[weapon].ref;
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69e6
// Size: 0xb2
function getsuperrefforsuperweapon(weapon) {
    if (!isdefined(level.superglobals)) {
        return undefined;
    }
    if (!isstring(weapon)) {
        weapon = weapon.basename;
    }
    superuseweapon = getsuperrefforsuperuseweapon(weapon);
    if (isdefined(superuseweapon)) {
        return superuseweapon;
    }
    superoffhand = getsuperrefforsuperoffhand(weapon);
    if (isdefined(superoffhand)) {
        return superoffhand;
    }
    superoffhand = getsuperrefforsuperextraweapon(weapon);
    if (isdefined(superoffhand)) {
        return superoffhand;
    }
    switch (weapon) {
    case #"hash_1a30d3a1753a5b6": 
        return "super_tac_insert";
    case #"hash_e2c74e289201361": 
        return "super_loadout_drop";
    case #"hash_10480ca9423043c7": 
        return "super_laser_charge";
    }
    return undefined;
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6aa1
// Size: 0x4f
function shouldtracksuperweaponstats(objweapon) {
    ref = getsuperrefforsuperweapon(objweapon);
    if (isdefined(ref)) {
        data = level.superglobals.staticsuperdata[ref];
        return data.useweapontrackstats;
    }
    return undefined;
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6af9
// Size: 0x7d
function getsuperid(superref) {
    if (!isdefined(superref) || !isdefined(level.superglobals) || !isdefined(level.superglobals.staticsuperdata) || !isdefined(level.superglobals.staticsuperdata[superref]) || superref == "none") {
        return 0;
    }
    return level.superglobals.staticsuperdata[superref].id;
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b7f
// Size: 0x43
function getmovespeedforsuperweapon(objweapon) {
    ref = getsuperrefforsuperweapon(objweapon);
    if (!isdefined(ref)) {
        return undefined;
    }
    return level.superglobals.staticsuperdata[ref].movespeed;
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6bcb
// Size: 0x13
function getrootsuperref(superref) {
    return getsubstr(superref, 6);
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6be7
// Size: 0x45
function function_eb25267ee439cabe(superref) {
    if (isdefined(level.superglobals.staticsuperdata[superref])) {
        return level.superglobals.staticsuperdata[superref].weapon;
    }
    return undefined;
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c35
// Size: 0x54
function function_83a68723acc3296d(weaponname) {
    superref = getsuperrefforsuperoffhand(weaponname);
    if (isdefined(superref)) {
        superdata = level.superglobals.staticsuperdata[superref];
        if (isdefined(superdata)) {
            return superdata.bundle;
        }
    }
    return undefined;
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c92
// Size: 0x3d
function function_5cc7d8c432d5d6c1(superref) {
    superdata = level.superglobals.staticsuperdata[superref];
    if (isdefined(superdata)) {
        return superdata.var_94deac09d462d41e;
    }
    return undefined;
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6cd8
// Size: 0x3d
function function_c519ae03535afe0f(superref) {
    superdata = level.superglobals.staticsuperdata[superref];
    if (isdefined(superdata)) {
        return superdata.var_41f94bca374ed58a;
    }
    return undefined;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d1e
// Size: 0x37
function allowsuperweaponstow() {
    superinfo = getcurrentsuper();
    if (!isdefined(superinfo) || !superinfo.isinuse) {
        return;
    }
    superinfo.canstow = 1;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d5d
// Size: 0x89
function unstowsuperweapon() {
    superinfo = getcurrentsuper();
    if (!isdefined(superinfo) || !superinfo.canstow) {
        return;
    }
    if (!superinfo.isinuse || !isdefined(superinfo.staticdata.useweapon)) {
        superinfo.canstow = 0;
        return;
    }
    domonitoredweaponswitch(superinfo.staticdata.useweapon);
    superinfo.canstow = 0;
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6dee
// Size: 0x55
function getsuperpointsforevent(eventref) {
    if (!function_d03495fe6418377b(eventref)) {
        assertex(1, eventref);
        eventref = function_1823ff50bb28148d(eventref);
    }
    if (!isdefined(level.var_7de15b4c7f0a425)) {
        return 0;
    }
    points = level.var_7de15b4c7f0a425[eventref];
    if (!isdefined(points)) {
        return 0;
    }
    return points;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e4c
// Size: 0x68
function watchforgameend() {
    level waittill("game_ended");
    if (waslastround()) {
        foreach (player in level.players) {
            player writesppmstats();
        }
    }
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ebc
// Size: 0xc2
function getsppmdata() {
    if (getdvarint(@"hash_a3220d5d00c60fc0", 0) == 0) {
        return;
    }
    if (isai(self)) {
        return;
    }
    if (!isdefined(self.sppmdata)) {
        self.sppmdata = self.pers["sppmData"];
        if (!isdefined(self.sppmdata)) {
            self.sppmdata = spawnstruct();
            self.sppmdata.totalpoints = 0;
            self.sppmdata.totalappliedpoints = 0;
            self.sppmdata.eventtotals = [];
            self.pers["sppmData"] = self.sppmdata;
        }
    }
    return self.sppmdata;
}

// Namespace supers / scripts\mp\supers
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f87
// Size: 0xce
function updatesppm(pointsearned, var_f3b601e04de761d9, eventref) {
    if (getdvarint(@"hash_a3220d5d00c60fc0", 0) == 0) {
        return;
    }
    if (isai(self)) {
        return;
    }
    data = getsppmdata();
    data.totalpoints += pointsearned;
    if (istrue(var_f3b601e04de761d9)) {
        data.totalappliedpoints += pointsearned;
    }
    if (!isdefined(eventref)) {
        eventref = "undefined";
    }
    if (!isdefined(data.eventtotals[eventref])) {
        data.eventtotals[eventref] = pointsearned;
        return;
    }
    data.eventtotals[eventref] = data.eventtotals[eventref] + pointsearned;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x705d
// Size: 0x1ab
function writesppmstats() {
    if (getdvarint(@"hash_a3220d5d00c60fc0", 0) == 0) {
        return;
    }
    if (isai(self)) {
        return;
    }
    data = getsppmdata();
    totaltime = scripts\mp\persistence::statgetchildbuffered("round", "timePlayed", 1) / 60;
    sppm = 0;
    appliedsppm = 0;
    if (totaltime > 0) {
        sppm = data.totalpoints / totaltime;
        appliedsppm = data.totalappliedpoints / totaltime;
    }
    bestevent = "";
    var_be43446b63cc7949 = -1;
    foreach (event, eventtotal in data.eventtotals) {
        if (eventtotal > var_be43446b63cc7949) {
            var_be43446b63cc7949 = eventtotal;
            bestevent = event;
        }
    }
    if (function_d03495fe6418377b(bestevent)) {
        bestevent = function_f28fd66285fa2c9(bestevent);
    }
    dlog_recordevent("mpscript_sppm", ["sppm", sppm, "sppm_applied", appliedsppm, "gamemode", getgametype(), "kills", self.kills, "time_played", totaltime, "best_event", bestevent, "script_version", getscriptdataversion()]);
}

// Namespace supers / scripts\mp\supers
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x7210
// Size: 0x6d
function modifysuperequipmentdamage(attacker, objweapon, type, damage, idflags) {
    modifieddamage = damage;
    if (isdefined(self.owner) && isdefined(attacker) && attacker == self.owner) {
        modifieddamage = int(ceil(damage * 0.5));
    }
    return modifieddamage;
}

// Namespace supers / scripts\mp\supers
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7286
// Size: 0x252
function updateactivesupers(einflictor, attacker, victim, idamage, smeansofdeath, objweapon, shitloc, vdir) {
    var_c3a55ee9f23fb616 = isdefined(einflictor) && isplayer(einflictor);
    var_d758f68157febc76 = objweapon.basename == "throwingknife_mp" || objweapon.basename == "throwingknife_fire_mp" || objweapon.basename == "throwingknife_electric_mp" || objweapon.basename == "shuriken_mp" || objweapon.basename == "throwstar_mp";
    var_4f5e5bf85bdb8c7a = var_d758f68157febc76 && isdefined(einflictor) && isdefined(einflictor.classname) && einflictor.classname == "grenade";
    var_99d1abc1148a35ad = isdefined(attacker) && isplayer(attacker) && attacker != victim;
    if (var_99d1abc1148a35ad) {
        var_7639389406e14c2e = attacker scripts\mp\supers::getcurrentsuper();
        if (var_c3a55ee9f23fb616 || var_4f5e5bf85bdb8c7a) {
            if (isdefined(var_7639389406e14c2e) && attacker issuperinuse() && isplayer(victim) && scripts\cp_mp\utility\player_utility::playersareenemies(attacker, victim)) {
                if (var_7639389406e14c2e.staticdata.ref == "super_deadsilence") {
                    attacker thread scripts\mp\supers\super_deadsilence::superdeadsilence_onkill();
                }
                if (var_7639389406e14c2e.staticdata.ref == "super_battlerage" || var_7639389406e14c2e.staticdata.ref == "super_squadrage") {
                    attacker thread namespace_e6ac9d98b8876b98::function_fe088cdea420c6d6();
                }
                if (var_7639389406e14c2e.staticdata.ref == "super_honeypot") {
                    attacker thread namespace_a958914ab5b08b6d::function_9bc4debdef524e6a();
                }
            }
        }
        if (var_c3a55ee9f23fb616) {
            if (einflictor scripts\mp\utility\perk::_hasperk("specialty_bulletdamage")) {
                attacker thread scripts\mp\supers\super_stoppingpower::stoppingpower_onkill(objweapon);
            }
            if (einflictor scripts\mp\utility\perk::_hasperk("specialty_bulletsuppress") && scripts\mp\utility\perk::_hasperk("specialty_bulletpenetration")) {
                attacker thread namespace_ed60dc1153ae1c06::function_8f9a9c04e9e4b5af(objweapon);
            }
        }
    }
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74e0
// Size: 0xe4
function watchsuperdelay() {
    level endon("super_delay_end");
    level endon("round_end");
    level endon("game_ended");
    if (isanymlgmatch()) {
        level.superdelay = 0;
    } else {
        level.superdelay = getdvarfloat(@"hash_2748b78a2910ca11", 0);
    }
    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        scripts\mp\flags::gameflagwait("prematch_done");
    }
    if (level.superdelay == 0) {
        level.superdelaystarttime = gettime();
        level.superdelayendtime = level.superdelaystarttime;
        level notify("super_delay_end");
    }
    level.superdelaystarttime = gettime();
    level.superdelayendtime = level.superdelaystarttime + level.superdelay * 1000;
    level notify("super_delay_start");
    while (gettime() < level.superdelayendtime) {
        waitframe();
    }
    level notify("super_delay_end");
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75cc
// Size: 0x61
function watchplayersuperdelayweapon() {
    level endon("round_end");
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("clearedAllows");
    self notify("watchPlayerSuperDelayWeapon");
    if (superdelaypassed()) {
        return;
    }
    val::set("super_delay", "supers", 0);
    waittill_any_ents(level, "super_delay_end", self, "watchPlayerSuperDelayWeapon");
    val::reset_all("super_delay");
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7635
// Size: 0x1f
function superdelaypassed() {
    return isdefined(level.superdelayendtime) && gettime() >= level.superdelayendtime;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x765d
// Size: 0x34
function cancelsuperdelay() {
    level.superdelay = 0;
    level.superdelaystarttime = gettime();
    level.superdelayendtime = level.superdelaystarttime;
    level notify("super_delay_end");
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7699
// Size: 0x70
function givesuperweapon(superinfo) {
    if (!self hasweapon(superinfo.weaponobj)) {
        ammo = ter_op(issuperready(), 1, 0);
        _giveweapon(superinfo.weaponobj);
        self setweaponammoclip(superinfo.weaponobj, ammo);
        self assignweaponoffhandspecial(superinfo.weaponobj);
    }
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7711
// Size: 0xe
function issuperdisabled() {
    return !scripts\common\values::get("supers");
}

// Namespace supers / scripts\mp\supers
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7728
// Size: 0x9f
function watchobjuse(drainrate, var_1507e598e016eb8) {
    self endon("death_or_disconnect");
    self endon("obj_drain_end");
    self endon("ball_dropped");
    if (getbasegametype() == "sd" || getgametype() == "sr" || getgametype() == "dd") {
        if (istrue(var_1507e598e016eb8)) {
            self waittill("super_obj_drain");
        }
    } else if (!isdefined(self.carryobject)) {
        self waittill("obj_picked_up");
    } else {
        wait 0.05;
    }
    while (issuperinuse()) {
        reducesuperusepercent(drainrate);
        wait 0.05;
    }
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77cf
// Size: 0x63
function combatrecordsuperuse(super) {
    if (!canrecordcombatrecordstats()) {
        return;
    }
    oldvalue = self getplayerdata(level.var_5d69837cf4db0407, "playerStats", "superStats", super, "uses");
    self setplayerdata(level.var_5d69837cf4db0407, "playerStats", "superStats", super, "uses", oldvalue + 1);
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x783a
// Size: 0x63
function combatrecordsuperkill(super) {
    if (!canrecordcombatrecordstats()) {
        return;
    }
    oldvalue = self getplayerdata(level.var_5d69837cf4db0407, "playerStats", "superStats", super, "kills");
    self setplayerdata(level.var_5d69837cf4db0407, "playerStats", "superStats", super, "kills", oldvalue + 1);
}

// Namespace supers / scripts\mp\supers
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78a5
// Size: 0x5b
function combatrecordsupermisc(super, increment) {
    if (!canrecordcombatrecordstats()) {
        return;
    }
    if (!isdefined(increment)) {
        increment = 1;
    }
    oldvalue = getcombatrecordsupermisc(super);
    self setplayerdata(level.var_5d69837cf4db0407, "playerStats", "superStats", super, "misc1", oldvalue + increment);
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7908
// Size: 0x2a
function getcombatrecordsupermisc(super) {
    return self getplayerdata(level.var_5d69837cf4db0407, "playerStats", "superStats", super, "misc1");
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x793b
// Size: 0x24
function superdisabledinarbitraryup(superref) {
    if (superref == "super_microturret" || superref == "super_supertrophy") {
        return true;
    }
    return false;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7968
// Size: 0xe
function superdisabledinarbitraryupmessage() {
    scripts\mp\hud_message::showerrormessage("MP/SUPERS_UNAVAILABLE_ARB_UP");
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x797e
// Size: 0xd
function choppergunnerbeginuse() {
    return scripts\mp\killstreaks\killstreaks::trytriggerkillstreakfromsuper("chopper_gunner");
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7994
// Size: 0xd
function cruisepredatorbeginuse() {
    return scripts\mp\killstreaks\killstreaks::trytriggerkillstreakfromsuper("cruise_predator");
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79aa
// Size: 0xc3
function scramblebeginuse() {
    scrambleent = spawn("script_model", self.origin + (0, 0, 400));
    self.scrambleent = scrambleent;
    self.scrambleent setmodel("super_scramble_mp");
    self.scrambleent linkto(self);
    self.scrambleent.owner = self;
    self.scrambleent.team = self.team;
    self.scrambleent setotherent(self);
    self.scrambleent setscriptablepartstate("scramble_sfx", "on", 0);
    thread scripts\cp_mp\killstreaks\helper_drone::helperdrone_watchscramblereffectdist(self);
    return true;
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a76
// Size: 0x30
function scrambleusefinished(fromdeath) {
    self.scrambleent unlink();
    self.scrambleent delete();
    scripts\cp_mp\killstreaks\helper_drone::helperdrone_endscramblereffect();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7aae
// Size: 0x8
function trophyonset() {
    return scripts\mp\equipment\trophy_system::trophy_onsuperset();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7abf
// Size: 0x9
function tacinsertonset() {
    scripts\mp\equipment\tac_insert::tacinsert_set();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ad0
// Size: 0x9
function tacinsertonunset() {
    scripts\mp\equipment\tac_insert::tacinsert_unset();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7ae1
// Size: 0x2
function remotedetonateonset() {
    
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7aeb
// Size: 0x2
function remotedetonatebeginuse() {
    
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7af5
// Size: 0xd
function precisionairstrikebeginuse() {
    return scripts\mp\killstreaks\killstreaks::trytriggerkillstreakfromsuper("precision_airstrike");
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7b0b
// Size: 0xd
function tomastrikebeginuse() {
    return scripts\mp\killstreaks\killstreaks::trytriggerkillstreakfromsuper("toma_strike");
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7b21
// Size: 0xd
function pacsentrybeginuse() {
    return scripts\mp\killstreaks\killstreaks::trytriggerkillstreakfromsuper("pac_sentry");
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b37
// Size: 0x2
function brcircleextract() {
    
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7b41
// Size: 0xd
function uavbeginuse() {
    return scripts\mp\killstreaks\killstreaks::trytriggerkillstreakfromsuper("uav");
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b57
// Size: 0x8
function taccoverbeginuse() {
    return scripts\mp\equipment\tactical_cover::tac_cover_on_fired_super();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b68
// Size: 0x8
function taccoverunset() {
    return scripts\mp\equipment\tactical_cover::tac_cover_on_take_super();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b79
// Size: 0x8
function function_9c38f7ea2223b47c() {
    return namespace_35cf33c9c2941133::function_2e07802ab9938047();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b8a
// Size: 0x4
function function_3bc4f06f06e9c62() {
    return true;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b97
// Size: 0x8
function function_d1bd30be0c5ec282() {
    return namespace_ec12f2e19aa34cc8::tacticalCamera_set();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ba8
// Size: 0x8
function function_2ef8268013bdbe57() {
    return namespace_ec12f2e19aa34cc8::tacticalCamera_unset();
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bb9
// Size: 0x12
function function_2b9e988cdb17f507(objweapon) {
    return namespace_ec12f2e19aa34cc8::function_1af63adb97f131a1(objweapon);
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bd4
// Size: 0x8
function function_dfc3421815005e62() {
    return namespace_ec12f2e19aa34cc8::function_60367230245c7390();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7be5
// Size: 0x8
function deployeddecoyunset() {
    return namespace_861236fa8235a2ba::deployedDecoy_unset();
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bf6
// Size: 0x12
function function_25b1b1c8cae25c68(objweapon) {
    return namespace_861236fa8235a2ba::function_786a7189ad105a77(objweapon);
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c11
// Size: 0x35
function function_96042b357c338ada(objweapon) {
    if (issharedfuncdefined("super_hb_sensor", "onSuperButtonHold")) {
        return function_f3bb4f4911a1beb2("super_hb_sensor", "onSuperButtonHold", objweapon);
    }
    return undefined;
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c4e
// Size: 0x35
function function_6129eaac0c283bb7(objweapon) {
    if (issharedfuncdefined("super_hb_sensor", "given")) {
        return function_f3bb4f4911a1beb2("super_hb_sensor", "given", objweapon);
    }
    return undefined;
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c8b
// Size: 0x35
function function_971b383d95556418(objweapon) {
    if (issharedfuncdefined("super_evg", "onSuperButtonPressed")) {
        return function_f3bb4f4911a1beb2("super_evg", "onSuperButtonPressed", objweapon);
    }
    return undefined;
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7cc8
// Size: 0x35
function function_63cb15591c54cb1(objweapon) {
    if (issharedfuncdefined("super_evg", "given")) {
        return function_f3bb4f4911a1beb2("super_evg", "given", objweapon);
    }
    return undefined;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d05
// Size: 0x8
function function_fad76ffce1bc5317() {
    return namespace_87a763dd2088afea::function_2cf7e1e0b6513c6f();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d16
// Size: 0x8
function function_af1d2e4473f5057e() {
    return namespace_87a763dd2088afea::function_79893d5ed21ae366();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d27
// Size: 0x8
function recondronebeginuse() {
    return namespace_893ac0cf28c5af44::recondrone_beginsuper();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d38
// Size: 0x8
function function_3529248aa2d81abc() {
    return namespace_893ac0cf28c5af44::function_439e22ca27f68ce3();
}

// Namespace supers / scripts\mp\supers
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d49
// Size: 0x1a
function recondroneenduse(fromdeath, attacker) {
    return namespace_893ac0cf28c5af44::recondrone_endsuper(fromdeath);
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d6c
// Size: 0x9
function recondroneunset() {
    namespace_893ac0cf28c5af44::recondrone_unsetsuper();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7d7d
// Size: 0x8
function empdronebeginuse() {
    return scripts\cp_mp\killstreaks\emp_drone_targeted::empdrone_beginsuper();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d8e
// Size: 0x8
function deadsilencebeginuse() {
    return scripts\mp\supers\super_deadsilence::superdeadsilence_beginsuper();
}

// Namespace supers / scripts\mp\supers
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d9f
// Size: 0x1a
function deadsilenceenduse(fromdeath, attacker) {
    return scripts\mp\supers\super_deadsilence::superdeadsilence_endsuper(fromdeath);
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7dc2
// Size: 0x9
function supportboxunset() {
    scripts\mp\equipment\support_box::supportbox_unset();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7dd3
// Size: 0x8
function laststandhealonset() {
    return scripts\mp\supers\laststand_heal::laststandheal_onset();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7de4
// Size: 0x8
function laststandhealunset() {
    return scripts\mp\supers\laststand_heal::laststandheal_unset();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7df5
// Size: 0x8
function laststandhealbeginuse() {
    return scripts\mp\supers\laststand_heal::laststandheal_beginuse();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e06
// Size: 0x8
function stoppingpowerbeginuse() {
    return scripts\mp\supers\super_stoppingpower::stoppingpower_beginuse();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e17
// Size: 0x8
function superweapondropbeginuse() {
    return scripts\mp\equipment\weapon_drop::weapondrop_beginsuper();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e28
// Size: 0x9
function suppressunset() {
    namespace_ed60dc1153ae1c06::function_b2d2056ee8b00689();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e39
// Size: 0x8
function function_66c2b6fb2734cbae() {
    return namespace_ed60dc1153ae1c06::function_55aae48e013652fa();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e4a
// Size: 0x8
function function_2de710d6b3c9388e() {
    return namespace_15f48ac5c4673765::function_f62e25cb503d7bab();
}

// Namespace supers / scripts\mp\supers
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e5b
// Size: 0x19
function function_ca449b017d946d26(fromdeath, attacker) {
    return namespace_15f48ac5c4673765::function_2f0d9315ab20c4bf();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e7d
// Size: 0x8
function function_d93f331b74c647f2() {
    return namespace_15f48ac5c4673765::function_e83e2d8dc74ffdbb();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e8e
// Size: 0x8
function emppulseunset() {
    return namespace_15f48ac5c4673765::emppulse_unset();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e9f
// Size: 0x8
function function_81a2df228546136e() {
    return namespace_e6ac9d98b8876b98::function_905b7bada6fd91cb();
}

// Namespace supers / scripts\mp\supers
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7eb0
// Size: 0x19
function function_d1b35aa1689beb06(fromdeath, attacker) {
    return namespace_e6ac9d98b8876b98::function_739a5f064c7debdf();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ed2
// Size: 0x8
function function_14761663823dbcb7() {
    return namespace_71c9e937b8c408a1::function_685e618d30da1588();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ee3
// Size: 0x8
function function_2e14b99891ecbbf4() {
    return namespace_71c9e937b8c408a1::function_269055d8846e4665();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7ef4
// Size: 0x8
function blindingturretunset() {
    return namespace_2db0b5db4c5dfc98::blindingturret_unset();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f05
// Size: 0x8
function function_53025970eb68a86b() {
    return namespace_833bd5cc623ca701::function_321c7891711e583f();
}

// Namespace supers / scripts\mp\supers
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f16
// Size: 0x1a
function function_fdfae98bcfbf8c7f(fromdeath, attacker) {
    return namespace_833bd5cc623ca701::function_f5037ba4a5399b63(fromdeath);
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7f39
// Size: 0x8
function function_dec15d25ce41a183() {
    return namespace_833bd5cc623ca701::function_a377d33613e0c83();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7f4a
// Size: 0x28
function launcherset() {
    if (issharedfuncdefined("super_launcher", "launcher_set")) {
        return [[ getsharedfunc("super_launcher", "launcher_set") ]]();
    }
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7f7b
// Size: 0x28
function launcherunset() {
    if (issharedfuncdefined("super_launcher", "launcher_unset")) {
        return [[ getsharedfunc("super_launcher", "launcher_unset") ]]();
    }
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7fac
// Size: 0x28
function launcherbeginuse() {
    if (issharedfuncdefined("super_launcher", "launcher_begin_use")) {
        return [[ getsharedfunc("super_launcher", "launcher_begin_use") ]]();
    }
}

// Namespace supers / scripts\mp\supers
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7fdd
// Size: 0x3a
function launcherenduse(fromdeath, attacker) {
    if (issharedfuncdefined("super_launcher", "launcher_end_use")) {
        return [[ getsharedfunc("super_launcher", "launcher_end_use") ]](fromdeath);
    }
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8020
// Size: 0x28
function function_b8ba0f8c9f136125() {
    if (issharedfuncdefined("super_launcher", "launcher_repeat")) {
        return [[ getsharedfunc("super_launcher", "launcher_repeat") ]]();
    }
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8051
// Size: 0x8
function function_8d6d142bceb819f2() {
    return namespace_ccba935845e72677::function_40f1163063c26637();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8062
// Size: 0x23
function function_e3c0d84aa4294ee9() {
    success = 0;
    success = function_97eecce0124a7b50();
    if (success) {
        success = namespace_86d0d418da518a0e::function_2e4cd4d627c30c24();
    }
    return success;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x808e
// Size: 0x8
function function_cf347a049095421b() {
    return namespace_416e533f6ed17708::function_d3f8e1c800b2e8c0();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x809f
// Size: 0x8
function function_19b0130d94d96b0b() {
    return namespace_416e533f6ed17708::function_4364c764fcf6194d();
}

// Namespace supers / scripts\mp\supers
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80b0
// Size: 0x19
function function_34956da8dd3afd1f(fromdeath, attacker) {
    return namespace_416e533f6ed17708::tempv_end();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80d2
// Size: 0x8
function function_fc34a7d0e83b6d77() {
    return namespace_d287cdac8347c2c7::function_37ddcde87b74cc48();
}

// Namespace supers / scripts\mp\supers
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80e3
// Size: 0x19
function function_a7043870418bf96b(fromdeath, attacker) {
    return namespace_d287cdac8347c2c7::function_4595a2e368e64b18();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8105
// Size: 0x8
function function_f98d4ec41407bc75() {
    return namespace_1f2efdb89e5f3a6e::function_d45fd98510d7b7e9();
}

// Namespace supers / scripts\mp\supers
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8116
// Size: 0x19
function function_975965422d6bcb49(fromdeath, attacker) {
    return namespace_1f2efdb89e5f3a6e::function_e0a9daa14c0b948b();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8138
// Size: 0x8
function function_e9993ee767c0acf5() {
    return namespace_9f9a23de1f1dc7ff::function_cfb677b5f7d5e644();
}

// Namespace supers / scripts\mp\supers
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8149
// Size: 0x15
function function_ec715b4038ae47c9(fromdeath, attacker) {
    return true;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8167
// Size: 0x8
function function_e67d9c8005d3f178() {
    return namespace_314b181252bf1520::function_c54f7da664700b4b();
}

// Namespace supers / scripts\mp\supers
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8178
// Size: 0x13
function function_13214dc30f36bf08(fromdeath, attacker) {
    
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8193
// Size: 0x8
function function_8d08654f0023d631() {
    return namespace_5f3bfac07f561003::function_c0327b881b392647();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81a4
// Size: 0x8
function function_3a1b0ee4f020ab35() {
    return namespace_5f3bfac07f561003::function_e721c06d0e8502bf();
}

// Namespace supers / scripts\mp\supers
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81b5
// Size: 0x1a
function function_2b9dfa62d7e245f5(fromdeath, attacker) {
    return namespace_5f3bfac07f561003::function_456170ef7257430b(fromdeath);
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81d8
// Size: 0x8
function function_b8e4c757481c3bf2() {
    return namespace_a958914ab5b08b6d::function_99877ccd9f1a6857();
}

// Namespace supers / scripts\mp\supers
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81e9
// Size: 0x1a
function function_20d973416d5e8d9a(fromdeath, attacker) {
    return namespace_a958914ab5b08b6d::function_c91188ff5b13a34b(attacker);
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x820c
// Size: 0x4e
function superselectonset() {
    firstupgrade = scripts\mp\perks\perkpackage::perkpackage_getfirstfieldupgrade();
    self.super.firstupgrade = firstupgrade;
    secondupgrade = scripts\mp\perks\perkpackage::perkpackage_getsecondfieldupgrade();
    self.super.secondupgrade = secondupgrade;
}

// Namespace supers / scripts\mp\supers
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8262
// Size: 0xc7
function function_c9491df86b072612(firstupgrade, secondupgrade) {
    if (!isdefined(firstupgrade)) {
        firstupgrade = scripts\mp\perks\perkpackage::perkpackage_getfirstfieldupgrade();
    }
    if (!isdefined(secondupgrade)) {
        secondupgrade = scripts\mp\perks\perkpackage::perkpackage_getsecondfieldupgrade();
    }
    staticdata = level.superglobals.staticsuperdata[firstupgrade];
    var_d5c938e8c28ec207 = 0;
    if (isdefined(staticdata)) {
        var_d5c938e8c28ec207 = staticdata.pointsneeded;
    }
    staticdata = level.superglobals.staticsuperdata[secondupgrade];
    var_55fca3a9d50b3bb3 = 0;
    if (isdefined(staticdata)) {
        var_55fca3a9d50b3bb3 = staticdata.pointsneeded;
    }
    var_f50865a8840fa2b7 = max(var_d5c938e8c28ec207, var_55fca3a9d50b3bb3);
    self.perkpackagedata.overridepointsneeded = var_f50865a8840fa2b7;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8331
// Size: 0x15
function function_e78f07efbcdb9e97() {
    self.perkpackagedata.overridepointsneeded = undefined;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x834e
// Size: 0x9
function superselectonunset() {
    function_ddeb08081f6fabea();
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x835f
// Size: 0x69
function function_fad6d78d6b3b3359(objweapon) {
    if (isdefined(self.var_35b042c5224a1646)) {
        var_908084e5cdd0ae1a = level.superglobals.staticsuperdata[self.var_35b042c5224a1646];
        if (isdefined(var_908084e5cdd0ae1a.var_1bb8c2de6198881a)) {
            if (istrue([[ var_908084e5cdd0ae1a.var_1bb8c2de6198881a ]](objweapon))) {
                self notify("perkPackageMenu_close");
            }
        }
    }
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83d0
// Size: 0x8
function superselectbeginuse() {
    return scripts\mp\perks\perkpackage::perkpackage_openselect();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83e1
// Size: 0x7a
function function_baf9eeef4cf2bac5() {
    firstupgrade = scripts\mp\perks\perkpackage::perkpackage_getfirstfieldupgrade();
    secondupgrade = scripts\mp\perks\perkpackage::perkpackage_getsecondfieldupgrade();
    if (!isdefined(self.var_35b042c5224a1646) || isdefined(self.var_35b042c5224a1646) && self.var_35b042c5224a1646 == "super_emp_pulse") {
        if (firstupgrade == "super_emp_pulse" || secondupgrade == "super_emp_pulse") {
            scripts\mp\supers::function_7203e7aa96ff0ba9(30);
            namespace_15f48ac5c4673765::function_75baa17a54260f6f(1);
        }
    }
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8463
// Size: 0xc
function testsuperbeginuse() {
    thread testsuperrefundwatcher();
    return true;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8478
// Size: 0x4
function superfultonbeginuse() {
    return true;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8485
// Size: 0x4
function supersupplydropbeginuse() {
    return true;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8492
// Size: 0x8
function function_7eead274ef83e1b9() {
    return namespace_6340662230fe40b3::function_172a790b85bbc40b();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84a3
// Size: 0x8
function function_afd34c64e8c8d5d() {
    return namespace_833bd5cc623ca701::function_9db6a100a4046d0c();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84b4
// Size: 0x8
function function_90a74a57a43c9808() {
    return namespace_833bd5cc623ca701::function_3f29f7ceb8c0ec6d();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84c5
// Size: 0x3b
function function_77a8296b67aa7a1c() {
    if (issharedfuncdefined(#"super_laststand_syringe", #"beginuse", 1)) {
        return [[ getsharedfunc(#"super_laststand_syringe", #"beginuse") ]]();
    }
    return 0;
}

// Namespace supers / scripts\mp\supers
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8509
// Size: 0x4d
function function_25ea1075448678c(fromdeath, attacker) {
    if (issharedfuncdefined(#"super_laststand_syringe", #"enduse", 1)) {
        return [[ getsharedfunc(#"super_laststand_syringe", #"enduse") ]](fromdeath);
    }
    return 0;
}

// Namespace supers / scripts\mp\supers
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x855f
// Size: 0x4d
function function_e285dcf9693ca723(fromdeath, attacker) {
    if (issharedfuncdefined(#"super_spykit", #"enduse", 1)) {
        return [[ getsharedfunc(#"super_spykit", #"enduse") ]](fromdeath);
    }
    return 0;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85b5
// Size: 0x45
function testsuperrefundwatcher() {
    self endon("super_use_finished");
    while (true) {
        if (self buttonpressed("BUTTON_X")) {
            superusefinished(0, 0, 1);
        } else if (self buttonpressed("BUTTON_Y")) {
            superusefinished(1);
        }
        waitframe();
    }
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8602
// Size: 0x68
function showsuperremindersplash() {
    self endon("disconnect");
    if (!istrue(self.superreminderset)) {
        self notify("showSuperReminderSplash");
        self endon("showSuperReminderSplash");
        self.superreminderset = 1;
        self setclientomnvar("ui_super_reminder", 1);
        wait 0.5;
        thread clearsuperremindersplash();
        return;
    }
    thread clearsuperremindersplash();
    self endon("showSuperReminderSplash");
    waitframe();
    thread showsuperremindersplash();
    return;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8672
// Size: 0x21
function clearsuperremindersplash() {
    self notify("showSuperReminderSplash");
    self.superreminderset = undefined;
    self setclientomnvar("ui_super_reminder", 0);
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x869b
// Size: 0x1e
function clearsuperreminderondeath(player) {
    if (!isplayer(player)) {
        return;
    }
    thread clearsuperreminderondeathinternal(player);
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86c1
// Size: 0x22
function clearsuperreminderondeathinternal(player) {
    player endon("disconnect");
    player waittill("death");
    player clearsuperremindersplash();
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86eb
// Size: 0xaf
function initsuperdvars() {
    /#
        setdevdvarifuninitialized(@"hash_eba0ef12e9c9260b", 0);
        setdevdvarifuninitialized(@"hash_350b9a835c1f30b8", 0);
        setdevdvarifuninitialized(@"hash_89ab277fb91d0852", 60);
        setdevdvarifuninitialized(@"hash_eea9235538d727fe", 45);
        setdevdvarifuninitialized(@"hash_ee86355538b107dc", 90);
        setdevdvarifuninitialized(@"hash_71b04bfc490e137a", 0);
    #/
    setdvarifuninitialized(@"hash_e1d7f49648b75f36", 6);
    var_25303120c23ade8d = getdvarint(@"hash_71b04bfc490e137a", 0);
    if (var_25303120c23ade8d) {
        level.superglobals.var_2652b1ba218bbaf5 = var_25303120c23ade8d;
    }
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87a2
// Size: 0x2cb
function watchsuperlottery() {
    level endon("game_ended");
    var_69f8c933a9416fd4 = getdvarint(@"hash_89ab277fb91d0852", 60);
    var_ceb102618af8a2a0 = getdvarint(@"hash_eea9235538d727fe", 45);
    var_ce8d18618ad0584a = getdvarint(@"hash_ee86355538b107dc", 90);
    var_c2c32ebb75125711 = var_ce8d18618ad0584a - var_ceb102618af8a2a0;
    assert(var_ceb102618af8a2a0 > 0 && var_ceb102618af8a2a0 < var_ce8d18618ad0584a);
    waitframe();
    if (!istrue(gameflag("prematch_done"))) {
        level waittill("prematch_over");
    }
    wait var_69f8c933a9416fd4;
    var_650c8acdffcc5af7 = undefined;
    superLotteryEnabled = undefined;
    var_6b769601e87e9c1e = [];
    var_2f915c7e43a8c53c = [];
    foreach (entry in level.teamnamelist) {
        var_6b769601e87e9c1e[entry] = undefined;
        var_2f915c7e43a8c53c[entry] = [];
    }
    while (true) {
        var_650c8acdffcc5af7 = superLotteryEnabled;
        superLotteryEnabled = getdvarint(@"hash_350b9a835c1f30b8", 0) > 0;
        if (!isdefined(var_650c8acdffcc5af7) || var_650c8acdffcc5af7 != superLotteryEnabled) {
            if (superLotteryEnabled) {
                level notify("superLotteryEnabled");
            } else {
                level notify("superLotteryDisabled");
            }
        }
        foreach (entry in level.teamnamelist) {
            if (!isdefined(var_6b769601e87e9c1e[entry])) {
                var_6b769601e87e9c1e[entry] = gettime() + (var_ceb102618af8a2a0 + randomint(var_c2c32ebb75125711)) * 1000;
                continue;
            }
            if (var_6b769601e87e9c1e[entry] <= gettime()) {
                players = getteamdata(entry, "players");
                if (players.size > 0) {
                    players = array_randomize(players);
                    var_760ebc212d9d24e1 = [];
                    bestplayer = undefined;
                    foreach (player in players) {
                        if (!array_contains(var_2f915c7e43a8c53c[entry], player)) {
                            if (isdefined(player getcurrentsuper())) {
                                bestplayer = player;
                                break;
                            }
                            continue;
                        }
                        if (isdefined(player getcurrentsuper())) {
                            var_760ebc212d9d24e1[var_760ebc212d9d24e1.size] = player;
                        }
                    }
                    if (!isdefined(bestplayer)) {
                        if (isdefined(var_760ebc212d9d24e1[0])) {
                            bestplayer = var_760ebc212d9d24e1[0];
                        } else {
                            bestplayer = players[0];
                        }
                    }
                    if (superLotteryEnabled) {
                        childthread awardsuperlottery(bestplayer);
                    }
                    var_2f915c7e43a8c53c[var_2f915c7e43a8c53c.size] = bestplayer;
                }
                var_6b769601e87e9c1e[entry] = undefined;
            }
        }
        waitframe();
    }
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a75
// Size: 0x6e
function awardsuperlottery(player) {
    player endon("disconnect");
    player endon("joined_team");
    level endon("superLotteryDisabled");
    player notify("awardSuperLottery");
    player endon("awardSuperLottery");
    while (true) {
        superinfo = player getcurrentsuper();
        if (!isdefined(superinfo)) {
            return;
        }
        if (!player issuperinuse()) {
            break;
        }
        waitframe();
    }
    player givesuperpoints(getsuperpointsneeded(), undefined, 1);
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8aeb
// Size: 0x32
function getscriptdataversion() {
    if (getdvarint(@"hash_6af7e4425b1f5d10", 0) != 0) {
        return 254;
    }
    if (getdvarint(@"hash_ff689af941dd10a1", 0) != 0) {
        return 7;
    }
    return 254;
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b26
// Size: 0xc1
function recordsuperearnedanalytics(superinfo) {
    if (getdvarint(@"hash_13856880331b5596", 0) == 0) {
        return;
    }
    timeplayed = scripts\mp\persistence::statgetchildbuffered("round", "timePlayed", 1) / 60;
    dlog_recordevent("mpscript_super_earning", ["super_ref", superinfo.staticdata.ref, "earn_time", timeplayed, "gamemode", getgametype(), "script_version", getscriptdataversion(), "earned_count", self.pers["supersEarned"]]);
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bef
// Size: 0xdd
function function_395a9cb3ebe25d55(superinfo) {
    var_f3ee0300341f6d5 = isdefined(superinfo.staticdata.useweapon);
    superweapon = ter_op(var_f3ee0300341f6d5, superinfo.staticdata.useweapon, superinfo.weaponobj);
    maxclipammo = weaponmaxammo(superweapon);
    ammopool = 0;
    if (var_f3ee0300341f6d5) {
        ammopool += superinfo.staticdata.useweaponclipammo;
        ammopool += min(maxclipammo, superinfo.staticdata.useweaponstockammo);
    } else {
        ammopool += min(maxclipammo, superinfo.staticdata.weaponammo);
    }
    return 1 / ammopool;
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8cd5
// Size: 0x199
function private function_af7e8fca939f7347(superinfo) {
    if (!isdefined(level.gamemodebundle) || !istrue(level.gamemodebundle.var_e12ed09bf2e43167)) {
        return 0;
    }
    if (!isdefined(self.perkpackagedata) || !isdefined(self.perkpackagedata.weaponclipammo) || !isdefined(self.perkpackagedata.weaponstockammo) || !isdefined(self.perkpackagedata.weaponclipammo[superinfo.staticdata.ref]) || !isdefined(self.perkpackagedata.weaponstockammo[superinfo.staticdata.ref])) {
        return 0;
    }
    maxclipammo = weaponmaxammo(superinfo.staticdata.useweapon);
    ammopool = 0;
    ammopool += superinfo.staticdata.useweaponclipammo;
    ammopool += min(maxclipammo, superinfo.staticdata.useweaponstockammo);
    curammo = self.perkpackagedata.weaponclipammo[superinfo.staticdata.ref] + self.perkpackagedata.weaponstockammo[superinfo.staticdata.ref];
    return ammopool - curammo;
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e77
// Size: 0x64
function function_235470b268f029ca(destroyfunc) {
    isoob = scripts\mp\outofbounds::ispointinoutofbounds(self.origin, self.owner.team);
    if (isoob) {
        if (isdefined(destroyfunc)) {
            self thread [[ destroyfunc ]]();
        }
        if (isdefined(self.owner)) {
            self.owner refundsuper();
        }
    }
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ee3
// Size: 0xe9
function function_ddeb08081f6fabea() {
    fullclear = 0;
    if (isdefined(self.var_35b042c5224a1646)) {
        var_6e77f955d2c33644 = level.superglobals.staticsuperdata[self.var_35b042c5224a1646].var_f6604eebabcac6c2;
        if (!isdefined(var_6e77f955d2c33644)) {
            fullclear = 1;
        } else {
            id = level.superglobals.staticsuperdata[self.var_35b042c5224a1646].id;
            var_86747f1f24df567b = [[ level.superglobals.staticsuperdata[self.var_35b042c5224a1646].var_f6604eebabcac6c2 ]]();
            if (istrue(var_86747f1f24df567b)) {
                scripts\mp\supers::function_7203e7aa96ff0ba9(id, 0, 1);
            } else {
                fullclear = 1;
            }
        }
    } else {
        fullclear = 1;
    }
    if (fullclear) {
        scripts\mp\supers::function_7203e7aa96ff0ba9(0);
    }
}

// Namespace supers / scripts\mp\supers
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8fd4
// Size: 0x1ab
function function_7203e7aa96ff0ba9(superid, var_86c4bb77bc9871cd, forceshow) {
    assertex(isdefined(superid), "supers.gsc: Field Upgrade Widget tried to show without a superID reference");
    if (superid == 0) {
        self setclientomnvar("ui_field_upgrade_use", superid);
        if (!istrue(var_86c4bb77bc9871cd)) {
            self.var_57d85036ea10552d = undefined;
        }
        return;
    }
    canshow = 0;
    if (!isdefined(self.super)) {
        return;
    }
    if (istrue(self.perkpackagedata.istwomode) && !istrue(forceshow)) {
        if (!isdefined(self.perkpackagedata.lastsuper)) {
            canshow = 1;
        } else if (isdefined(self.var_57d85036ea10552d)) {
            var_902970e912ecfbd5 = level.superglobals.supersbyid[self.var_57d85036ea10552d];
            var_6cfeb740aa80163a = level.superglobals.supersbyid[superid];
            var_fe1ca90a8e7694a0 = level.superglobals.staticsuperdata[var_902970e912ecfbd5].var_d835cd7abd661b88;
            var_857bc7a94ecf5791 = level.superglobals.staticsuperdata[var_6cfeb740aa80163a].var_d835cd7abd661b88;
            if (var_857bc7a94ecf5791 == -1) {
                canshow = 0;
            } else if (var_857bc7a94ecf5791 <= var_fe1ca90a8e7694a0) {
                canshow = 1;
            } else {
                canshow = 1;
                superid = self.var_57d85036ea10552d;
            }
        } else {
            canshow = 1;
        }
    } else {
        canshow = 1;
    }
    if (canshow || istrue(forceshow)) {
        self setclientomnvar("ui_field_upgrade_use", superid);
        self.var_57d85036ea10552d = superid;
    }
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9187
// Size: 0x59
function function_a465412785d4c550(objweapon) {
    weaponname = undefined;
    if (!isdefined(objweapon)) {
        return false;
    }
    switch (objweapon.basename) {
    case #"hash_e2c74e289201361":
    case #"hash_c0d55eb64b4656ff":
    case #"hash_ca1eabc559246db2": 
        return true;
    }
    return false;
}

// Namespace supers / scripts\mp\supers
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x91e9
// Size: 0x11f
function function_c1c41a5273f29351(objweapon, isimmediate) {
    self endon("death");
    self endon("disconnect");
    if (!isweapon(objweapon)) {
        if (isstring(objweapon)) {
            objweapon = makeweapon(objweapon);
        }
        assert(isweapon(objweapon), "giveAndFireOffhandReliable() requires a weapon string or object");
    }
    if (!val::get("supers")) {
        return 0;
    }
    if (!isweapon(objweapon)) {
        self notify("giveAndFireSuperWeaponFailed", objweapon);
        return 0;
    }
    if (objweapon.classname == "grenade") {
        self giveandfireoffhand(objweapon);
    } else {
        return domonitoredweaponswitch(objweapon, isimmediate);
    }
    if (!self hasweapon(objweapon)) {
        self notify("giveAndFireSuperWeaponFailed", objweapon);
        return 0;
    }
    result = spawnstruct();
    result childthread function_ed75f819472ffe84(self, objweapon);
    result childthread function_bedc88d54e2c0015(self, objweapon);
    result waittill("race_start");
    waittillframeend();
    result notify("race_end");
    if (istrue(result.success)) {
        self notify("giveAndFireOffhandReliableSucceeded", objweapon);
        return 1;
    }
    if (istrue(result.failure)) {
        self notify("giveAndFireOffhandReliableFailed", objweapon);
        return 0;
    }
}

// Namespace supers / scripts\mp\supers
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9310
// Size: 0x38
function function_ed75f819472ffe84(player, objweapon) {
    self endon("race_end");
    player waittillmatch("offhand_fired", objweapon);
    self.success = 1;
    self notify("race_start");
}

// Namespace supers / scripts\mp\supers
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9350
// Size: 0x4a
function function_bedc88d54e2c0015(player, objweapon) {
    self endon("race_end");
    while (player hasweapon(objweapon) && val::get("supers")) {
        waitframe();
    }
    self.failure = 1;
    self notify("race_start");
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93a2
// Size: 0x6a
function superHasTimedUsage(superinfo) {
    if (!isdefined(superinfo)) {
        superinfo = getcurrentsuper();
    }
    if (!isdefined(superinfo)) {
        return false;
    }
    assertex(isdefined(superinfo.staticdata.var_5c8e66e22b288b33), "No Super Use Type found. Please check the Super's GDT file to make sure a Use Type is being used.");
    var_5c8e66e22b288b33 = superinfo.staticdata.var_5c8e66e22b288b33;
    return var_5c8e66e22b288b33 == "TIME";
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9415
// Size: 0x6a
function superHasAmmoUsage(superinfo) {
    if (!isdefined(superinfo)) {
        superinfo = getcurrentsuper();
    }
    if (!isdefined(superinfo)) {
        return false;
    }
    assertex(isdefined(superinfo.staticdata.var_5c8e66e22b288b33), "No Super Use Type found. Please check the Super's GDT file to make sure a Use Type is being used.");
    var_5c8e66e22b288b33 = superinfo.staticdata.var_5c8e66e22b288b33;
    return var_5c8e66e22b288b33 == "AMMO";
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9488
// Size: 0xdb
function function_97eecce0124a7b50() {
    setSuperIsActive(1);
    superinfo = getcurrentsuper();
    clipammo = superinfo.staticdata.useweaponclipammo;
    stockammo = superinfo.staticdata.useweaponstockammo;
    if (isdefined(superinfo.var_2ebcbd70919376a7)) {
        clipammo = superinfo.var_2ebcbd70919376a7.clipammo;
        stockammo = superinfo.var_2ebcbd70919376a7.stockammo;
    }
    result = trygiveuseweapon(superinfo.staticdata.useweapon, clipammo, stockammo);
    if (istrue(result)) {
        setSuperIsActive(1);
    } else {
        setSuperIsActive(0);
    }
    return result;
}

// Namespace supers / scripts\mp\supers
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x956c
// Size: 0x2f
function function_ac471719698c7ddf() {
    superinfo = getcurrentsuper();
    if (isdefined(superinfo)) {
        return superinfo.staticdata.ref;
    }
    return undefined;
}

// Namespace supers / scripts\mp\supers
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95a4
// Size: 0x56
function function_907944a173ed27e1(superref) {
    switch (superref) {
    case #"hash_758dccf604db9844":
    case #"hash_7fabc8194cf34999":
    case #"hash_d90c2bd8c6e12ea2":
    case #"hash_d9df50cd7638b51d": 
        return true;
    default: 
        return false;
    }
    return false;
}

