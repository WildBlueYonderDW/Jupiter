#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\gametypes\br_publicevents.gsc;
#using script_294dda4a4b00ffe3;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\utility\game.gsc;

#namespace namespace_cf78b6cd5dc7768c;

// Namespace namespace_cf78b6cd5dc7768c / namespace_babd9ed67c85ef19
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x2b2
// Size: 0x35
function autoexec main() {
    scripts\mp\gametypes\br_publicevents::function_dbc8f6cb3760cd82("bloodmoney", &function_9aa5ae7661a3a913);
    scripts\mp\gametypes\br_publicevents::function_dbc8f6cb3760cd82("contractor", &initcontractor);
    scripts\mp\gametypes\br_publicevents::function_dbc8f6cb3760cd82("moneysiphon", &function_1cac290201dd47fc);
}

// Namespace namespace_cf78b6cd5dc7768c / namespace_babd9ed67c85ef19
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ef
// Size: 0x163
function function_9aa5ae7661a3a913(config) {
    if (!isdefined(level.var_16ef52214ac3a63f)) {
        level.var_16ef52214ac3a63f = spawnstruct();
    }
    bloodmoney = spawnstruct();
    bloodmoney.validatefunc = &function_e7a80b9a5971257a;
    bloodmoney.weight = config.weight;
    bloodmoney.activatefunc = &function_41b1afbe1c7af99;
    bloodmoney.waitfunc = &function_aec5c0a5b73ae7c5;
    bloodmoney.postinitfunc = &function_adc3e7f53e3456d0;
    bloodmoney.var_d72a1842c5b57d1d = config.maxtimes;
    bloodmoney.circleeventweights = scripts\mp\gametypes\br_publicevents::function_8fc51a5af06412cf(config.circleweights);
    bloodmoney.var_b9b56551e1acfee2 = namespace_c711384b1335919::function_8be9bae8228a91f7("bloodmoney");
    bloodmoney.timertype = 10;
    bloodmoney.var_45620a2820463e6e = getdvarint(@"hash_290bf19648dc8eb2", 2);
    bloodmoney.var_ee5fb771f83add5e = getdvarfloat(@"hash_8685285f3db98a1c", 2);
    bloodmoney.duration = getdvarint(@"hash_4e87bb76afe4eb45", 120);
    bloodmoney.type = 12;
    scripts\mp\gametypes\br_publicevents::function_5b7d8ca93f8705f1(bloodmoney, "bloodmoney");
    scripts\mp\gametypes\br_publicevents::registerpublicevent(12, bloodmoney);
}

// Namespace namespace_cf78b6cd5dc7768c / namespace_babd9ed67c85ef19
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45a
// Size: 0x147
function initcontractor(config) {
    if (!isdefined(level.var_16ef52214ac3a63f)) {
        level.var_16ef52214ac3a63f = spawnstruct();
    }
    contractor = spawnstruct();
    contractor.validatefunc = &function_6150c8f67e691807;
    contractor.weight = config.weight;
    contractor.activatefunc = &function_5d935db1c627d80;
    contractor.waitfunc = &contractor_waitfunc;
    contractor.postinitfunc = &function_3c14f9df7efc9951;
    contractor.var_d72a1842c5b57d1d = config.maxtimes;
    contractor.circleeventweights = scripts\mp\gametypes\br_publicevents::function_8fc51a5af06412cf(config.circleweights);
    contractor.var_b9b56551e1acfee2 = namespace_c711384b1335919::function_8be9bae8228a91f7("contractor");
    contractor.timertype = 11;
    contractor.var_46a451f9012bd1c = getdvarint(@"hash_f4f0d78ce0da6030", 2);
    contractor.duration = getdvarint(@"hash_5b1205ec7121272c", 120);
    contractor.type = 15;
    scripts\mp\gametypes\br_publicevents::function_5b7d8ca93f8705f1(contractor, "contractor");
    scripts\mp\gametypes\br_publicevents::registerpublicevent(15, contractor);
}

// Namespace namespace_cf78b6cd5dc7768c / namespace_babd9ed67c85ef19
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a9
// Size: 0xf3
function function_1cac290201dd47fc(config) {
    if (!isdefined(level.var_16ef52214ac3a63f)) {
        level.var_16ef52214ac3a63f = spawnstruct();
    }
    moneysiphon = spawnstruct();
    moneysiphon.validatefunc = &function_98e0aab5f4a07947;
    moneysiphon.weight = config.weight;
    moneysiphon.activatefunc = &function_8645e7ba0e3942c0;
    moneysiphon.waitfunc = &function_b44e7b12bcdc2c14;
    moneysiphon.postinitfunc = &function_ef3989dd64896a91;
    moneysiphon.var_d72a1842c5b57d1d = config.maxtimes;
    moneysiphon.circleeventweights = scripts\mp\gametypes\br_publicevents::function_8fc51a5af06412cf(config.circleweights);
    moneysiphon.var_b9b56551e1acfee2 = namespace_c711384b1335919::function_8be9bae8228a91f7("moneysiphon");
    scripts\mp\gametypes\br_publicevents::function_5b7d8ca93f8705f1(moneysiphon, "moneysiphon");
    scripts\mp\gametypes\br_publicevents::registerpublicevent(14, moneysiphon);
}

// Namespace namespace_cf78b6cd5dc7768c / namespace_babd9ed67c85ef19
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a4
// Size: 0x1d0
function function_ca6e399c0a8a91b6(eventstruct, eventname) {
    level endon("game_ended");
    scripts\mp\gametypes\br_publicevents::showsplashtoall("br_plunder_pe_" + eventname + "_active", "splash_list_br_plunder_iw9_mp");
    scripts\mp\gametypes\br_public::brleaderdialog("public_events_" + eventname + "_start");
    setomnvar("ui_minimap_pulse", 1);
    setomnvar("ui_publicevent_timer_type", eventstruct.timertype);
    eventduration = eventstruct.duration;
    eventendtime = gettime() + eventduration * 1000;
    setomnvar("ui_publicevent_timer", eventendtime);
    clockobject = spawn("script_origin", (0, 0, 0));
    clockobject hide();
    if (isdefined(eventstruct.onstart)) {
        [[ eventstruct.onstart ]]();
    } else {
        eventstruct.active = 1;
    }
    thread function_23913a35c5ebd726(eventname);
    var_49978e5850a50d57 = 5;
    if (eventduration > var_49978e5850a50d57) {
        wait eventduration - var_49978e5850a50d57;
    } else {
        var_49978e5850a50d57 = int(eventduration);
    }
    for (i = 0; i < var_49978e5850a50d57; i++) {
        clockobject playsound("ui_mp_fire_sale_timer");
        wait 1;
    }
    if (isdefined(eventstruct.onend)) {
        [[ eventstruct.onend ]]();
    } else {
        eventstruct.active = 0;
    }
    scripts\mp\gametypes\br_publicevents::function_2907d01a7d692108(eventstruct.type);
    level notify("public_event_" + eventname + "_end");
    scripts\mp\gametypes\br_public::brleaderdialog("public_events_" + eventname + "_end");
    setomnvar("ui_minimap_pulse", 0);
    setomnvar("ui_publicevent_timer_type", 0);
    clockobject delete();
}

// Namespace namespace_cf78b6cd5dc7768c / namespace_babd9ed67c85ef19
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87c
// Size: 0x22
function function_23913a35c5ebd726(eventname) {
    wait 2;
    scripts\mp\gametypes\br_public::brleaderdialog("public_events_" + eventname + "_active");
}

// Namespace namespace_cf78b6cd5dc7768c / namespace_babd9ed67c85ef19
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a6
// Size: 0x28
function function_adc3e7f53e3456d0() {
    game["dialog"]["public_events_blood_money_start"] = "bldm_grav_name";
    game["dialog"]["public_events_blood_money_active"] = "bldm_grav_boos";
}

// Namespace namespace_cf78b6cd5dc7768c / namespace_babd9ed67c85ef19
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d6
// Size: 0xe
function function_e7a80b9a5971257a() {
    return scripts\mp\utility\game::getsubgametype() == "plunder";
}

// Namespace namespace_cf78b6cd5dc7768c / namespace_babd9ed67c85ef19
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ed
// Size: 0x2
function function_aec5c0a5b73ae7c5() {
    
}

// Namespace namespace_cf78b6cd5dc7768c / namespace_babd9ed67c85ef19
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f7
// Size: 0x21
function function_41b1afbe1c7af99() {
    level endon("game_ended");
    function_ca6e399c0a8a91b6(level.br_pe_data[12], "blood_money");
}

// Namespace namespace_cf78b6cd5dc7768c / namespace_babd9ed67c85ef19
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x920
// Size: 0x28
function function_3c14f9df7efc9951() {
    game["dialog"]["public_events_contractor_start"] = "ctrc_grav_name";
    game["dialog"]["public_events_contractor_active"] = "ctrc_grav_boos";
}

// Namespace namespace_cf78b6cd5dc7768c / namespace_babd9ed67c85ef19
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x950
// Size: 0xe
function function_6150c8f67e691807() {
    return scripts\mp\utility\game::getsubgametype() == "plunder";
}

// Namespace namespace_cf78b6cd5dc7768c / namespace_babd9ed67c85ef19
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x967
// Size: 0x2
function contractor_waitfunc() {
    
}

// Namespace namespace_cf78b6cd5dc7768c / namespace_babd9ed67c85ef19
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x971
// Size: 0x21
function function_5d935db1c627d80() {
    level endon("game_ended");
    function_ca6e399c0a8a91b6(level.br_pe_data[15], "contractor");
}

// Namespace namespace_cf78b6cd5dc7768c / namespace_babd9ed67c85ef19
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x99a
// Size: 0x2
function function_93ccb74a1d25e826() {
    
}

// Namespace namespace_cf78b6cd5dc7768c / namespace_babd9ed67c85ef19
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9a4
// Size: 0x2
function function_4109d1fefcb9970() {
    
}

// Namespace namespace_cf78b6cd5dc7768c / namespace_babd9ed67c85ef19
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9ae
// Size: 0x2
function heat_waitfunc() {
    
}

// Namespace namespace_cf78b6cd5dc7768c / namespace_babd9ed67c85ef19
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9b8
// Size: 0x2
function function_23bcdfa42a7b068b() {
    
}

// Namespace namespace_cf78b6cd5dc7768c / namespace_babd9ed67c85ef19
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c2
// Size: 0x10b
function function_ef3989dd64896a91() {
    game["dialog"]["public_events_money_siphon_active"] = "csht_grav_boos";
    moneysiphon = spawnstruct();
    moneysiphon.type = 14;
    moneysiphon.timertype = 13;
    moneysiphon.active = 0;
    moneysiphon.var_e8fb817a73e06aba = getdvarint(@"hash_55d165f2f9e49694", 2);
    moneysiphon.var_9714ddda6a6df159 = getdvarint(@"hash_1cc3febe5f5f8883", 100);
    moneysiphon.depositinterval = getdvarfloat(@"hash_23750ae04694dc22", 3);
    moneysiphon.duration = getdvarint(@"hash_1a720e1709ceabf0", 120);
    moneysiphon.var_f9b722c9edce3106 = getdvarint(@"hash_74f7c2602fc10dd8", 120);
    moneysiphon.var_2f1ee623e7fc5c8c = getdvarint(@"hash_2ac717f48aef9bd0", 1);
    level.var_16ef52214ac3a63f.moneysiphon = moneysiphon;
}

// Namespace namespace_cf78b6cd5dc7768c / namespace_babd9ed67c85ef19
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad5
// Size: 0xe
function function_98e0aab5f4a07947() {
    return scripts\mp\utility\game::getsubgametype() == "plunder";
}

// Namespace namespace_cf78b6cd5dc7768c / namespace_babd9ed67c85ef19
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaec
// Size: 0x2
function function_b44e7b12bcdc2c14() {
    
}

// Namespace namespace_cf78b6cd5dc7768c / namespace_babd9ed67c85ef19
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf6
// Size: 0x28
function function_8645e7ba0e3942c0() {
    level endon("game_ended");
    function_ca6e399c0a8a91b6(level.var_16ef52214ac3a63f.moneysiphon, "money_siphon");
}

// Namespace namespace_cf78b6cd5dc7768c / namespace_babd9ed67c85ef19
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb26
// Size: 0x2
function function_7ebdc9e059a1beaf() {
    
}

// Namespace namespace_cf78b6cd5dc7768c / namespace_babd9ed67c85ef19
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb30
// Size: 0xe
function function_6dc1bbc26235ec1d() {
    return scripts\mp\utility\game::getsubgametype() == "plunder";
}

// Namespace namespace_cf78b6cd5dc7768c / namespace_babd9ed67c85ef19
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb47
// Size: 0x2
function function_c6fa8ae160635b3a() {
    
}

// Namespace namespace_cf78b6cd5dc7768c / namespace_babd9ed67c85ef19
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb51
// Size: 0x21
function function_218e108e5da1b92a() {
    level endon("game_ended");
    function_ca6e399c0a8a91b6(level.br_pe_data[16], "cannon_fodder");
}

