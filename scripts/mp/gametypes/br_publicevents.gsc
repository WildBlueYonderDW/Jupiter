// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gametypes\br_dev.gsc;
#using script_294dda4a4b00ffe3;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\gametypes\br_analytics.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\utility\script.gsc;

#namespace br_publicevents;

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac5
// Size: 0x1f2
function init() {
    if (getdvarint(@"hash_18afe7a288a4b1e4", 0)) {
        level notify("disable_public_event");
        level.var_34714ce799b6017 = 0;
        return;
    }
    var_37ee364b712c7afc = function_3c3429141b476356();
    if (!isdefined(var_37ee364b712c7afc)) {
        return;
    }
    level.var_34714ce799b6017 = 1;
    level.var_b06bb395c37b7ab8 = getdvarint(@"hash_965692fa542f0728", 1) == 1;
    level.var_3f6a099030787823 = function_ee26a62ef3d1372d(@"hash_b5088319799172eb", 0, var_37ee364b712c7afc.var_bff1bf1b8c888d19);
    level.br_pe_data = [];
    level.var_2a8ce228749bd191 = [];
    level.var_5a7ffdf228d98c9f = function_ee26a62ef3d1372d(@"hash_90afac1657855099", 2, var_37ee364b712c7afc.var_66d81af498488598);
    level.var_6f249acebd235065 = function_ee26a62ef3d1372d(@"hash_23b4b411c19d8090", 5, var_37ee364b712c7afc.initialdelay);
    level.var_98e0b0cb95eacda2 = function_ee26a62ef3d1372d(@"hash_a03801ae050ddf71", 8, var_37ee364b712c7afc.var_19514771c45f18e3);
    level.var_6ed09339da2b5658 = function_8fc51a5af06412cf(function_ba70ea4e80f22895(@"hash_d3da8cf30df8bef5", "", var_37ee364b712c7afc.var_47dc5a64efcc13d8));
    level.var_5e45ff103cde1cc6 = 0;
    level.var_acd63ea948a70083 = getdvarint(@"hash_50e4237b891b5501", 1);
    if (function_b1266056816b8716()) {
        level.var_5c60c997534512df = function_8fc51a5af06412cf(function_ba70ea4e80f22895(@"hash_955b56c18d2a6100", "", var_37ee364b712c7afc.var_9a340a5b7388b5c6));
        level.var_88870d23daafa4a3 = function_c6e4130ba6397d68(var_37ee364b712c7afc);
    }
    function_6de5b883b26a0f41(var_37ee364b712c7afc);
    scripts/mp/gametypes/br_dev::registerhandlecommand(&handledevcommand_publicevents);
    if (namespace_c711384b1335919::function_4ad287e0971672a6()) {
        level thread namespace_c711384b1335919::init();
    }
    if (publiceventsenabled()) {
        if (function_8aaa3648604bf278()) {
            level thread function_a59044c0d9b0988b();
            return;
        }
        level thread publiceventsmanager();
    }
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcbe
// Size: 0xd1
function function_6de5b883b26a0f41(var_37ee364b712c7afc) {
    level notify("init_public_event");
    foreach (var_7e93722a91573842 in var_37ee364b712c7afc.var_b57c449da2d093c3) {
        if (!isdefined(var_7e93722a91573842.event)) {
            continue;
        }
        reference = function_b5db7c8669703c35(var_7e93722a91573842.event);
        publiceventinit(reference, var_7e93722a91573842);
    }
    if (function_8aaa3648604bf278()) {
        var_5648fccda43a39da = spawnstruct();
        var_5648fccda43a39da.weight = 0;
        registerpublicevent(0, var_5648fccda43a39da);
    }
    waittillframeend();
    function_42d775349af86f8b();
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd96
// Size: 0xb3
function function_42d775349af86f8b() {
    foreach (eventdata in level.br_pe_data) {
        if (eventdata.weight <= 0 && !function_beb7ed17efad9bd7(eventdata)) {
            continue;
        }
        if (isdefined(eventdata.validatefunc) && ![[ eventdata.validatefunc ]]()) {
            continue;
        }
        if (isdefined(eventdata.postinitfunc)) {
            eventdata [[ eventdata.postinitfunc ]]();
        }
    }
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe50
// Size: 0xb8
function function_4634160166fb7f8b(eventname, var_7b3a7c3f67ceb677) {
    var_3c5dfe64e9e89eb8 = getdvar(hashcat(@"hash_abb46656d4b7e51c", eventname, "_circle_event_weights"), var_7b3a7c3f67ceb677);
    circleeventweights = [];
    if (var_3c5dfe64e9e89eb8 != "") {
        var_29eeb1cee9703a92 = strtok(var_3c5dfe64e9e89eb8, " ");
        foreach (weight in var_29eeb1cee9703a92) {
            circleeventweights[circleeventweights.size] = float(weight);
        }
    }
    return circleeventweights;
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf10
// Size: 0x7f
function function_8fc51a5af06412cf(string) {
    circleeventweights = [];
    var_29eeb1cee9703a92 = strtok(string, " ");
    foreach (weight in var_29eeb1cee9703a92) {
        circleeventweights[circleeventweights.size] = float(weight);
    }
    return circleeventweights;
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xf97
// Size: 0x163
function function_2c7a9d19dd88858c(defaultlist, listtype, eventname) {
    if (!isdefined(listtype)) {
        listtype = -1;
    }
    listoverride = defaultlist;
    switch (listtype) {
    case 0:
        if (!isdefined(eventname)) {
            eventname = "";
        }
        listoverride = getdvar(hashcat(@"hash_abb46656d4b7e51c", eventname, "_circle_event_weights"), defaultlist);
        break;
    case 1:
        listoverride = getdvar(@"hash_d3da8cf30df8bef5", defaultlist);
        break;
    case 2:
        listoverride = getdvar(@"hash_61457203358fe60e", defaultlist);
        break;
    case 3:
        listoverride = getdvar(@"hash_955b56c18d2a6100", defaultlist);
    default:
        break;
    }
    dvarvalues = [];
    if (listoverride != "") {
        dvarstr = strtok(listoverride, " ");
        foreach (value in dvarstr) {
            dvarvalues[dvarvalues.size] = float(value);
        }
    }
    return dvarvalues;
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1102
// Size: 0xc9
function registerpublicevent(eventtype, eventinfo) {
    /#
        assert(isdefined(level.br_pe_data));
    #/
    /#
        assert(!isdefined(level.br_pe_data[eventtype]));
    #/
    if (!isdefined(eventinfo.weight)) {
        eventinfo.active = 0;
    }
    if (!isdefined(eventinfo.weight)) {
        eventinfo.weight = 1;
    }
    if (function_8aaa3648604bf278()) {
        if (!isdefined(eventinfo.var_d72a1842c5b57d1d)) {
            eventinfo.var_d72a1842c5b57d1d = 1;
        }
        if (!isdefined(eventinfo.blacklist)) {
            eventinfo.blacklist = [];
        }
    }
    level.br_pe_data[eventtype] = eventinfo;
    return eventinfo;
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11d3
// Size: 0x5f
function function_44424d94254dfaf5() {
    cancelupcomingpublicevents();
    foreach (eventtype, eventdata in level.br_pe_data) {
        function_2907d01a7d692108(eventtype);
    }
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1239
// Size: 0x15
function cancelupcomingpublicevents() {
    level notify("cancel_public_event");
    level.var_5e45ff103cde1cc6 = 0;
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1255
// Size: 0x89
function publiceventsenabled() {
    if (!level.var_34714ce799b6017) {
        return 0;
    }
    forceeventtype = getdvarint(@"hash_c164d00b9c54b5b8", 0);
    if (forceeventtype != 0) {
        return 1;
    }
    if (scripts/mp/utility/game::isprophuntgametype()) {
        return 0;
    }
    if (function_8aaa3648604bf278()) {
        return function_79a1303427bfac85();
    }
    eventcount = getpubliceventcount();
    if (!eventcount) {
        return 0;
    }
    eventchance = getpubliceventchance();
    if (eventchance <= 0) {
        return 0;
    }
    return 1;
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12e5
// Size: 0x8d
function shoulddopublicevent(currentcircle) {
    eventchance = getpubliceventchance();
    if (function_8aaa3648604bf278() && isdefined(currentcircle)) {
        if (isdefined(level.var_6ed09339da2b5658[currentcircle])) {
            eventchance = level.var_6ed09339da2b5658[currentcircle];
        } else {
            if (function_b1266056816b8716()) {
                function_1cddcb2898d7667("Public event was not activated due to event chance not being set for time interval " + currentcircle);
            } else {
                function_1cddcb2898d7667("Public event was not activated due to circle event chance not being set for circle " + currentcircle);
            }
            return false;
        }
    }
    if (eventchance <= 0) {
        return false;
    }
    return randomfloat(1) <= eventchance;
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x137a
// Size: 0xe
function function_7ddadb6d5643bee4() {
    return level.var_5e45ff103cde1cc6 > 0;
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1390
// Size: 0x13
function getpubliceventcount() {
    return getdvarint(@"hash_cb12fa4bcd5c4fa3", 1);
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ab
// Size: 0x16
function getpubliceventchance() {
    return getdvarfloat(@"hash_c9060bff9e6d938", 0);
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13c9
// Size: 0x18
function multiplepubliceventsenabled() {
    numevents = getpubliceventcount();
    return numevents != 1;
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e9
// Size: 0xab
function publiceventsmanager() {
    level endon("cancel_public_event");
    scripts/mp/flags::gameflagwait("prematch_done");
    if (multiplepubliceventsenabled()) {
        var_6e6a77283e1803b1 = getdvarfloat(@"hash_a02772622b60d034", 240);
        var_6e8d89283e3e72ff = getdvarfloat(@"hash_a04a60622b86f056", 360);
        for (numevents = getpubliceventcount(); numevents; numevents--) {
            waittime = randomfloatrange(var_6e6a77283e1803b1, var_6e8d89283e3e72ff);
            wait(waittime);
            if (shoulddopublicevent()) {
                choosepubliceventtype(1);
            }
        }
        return;
    }
    if (shoulddopublicevent()) {
        choosepubliceventtype(0);
    }
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x149b
// Size: 0xd9
function validateevents() {
    validtypes = [];
    foreach (eventtype, eventdata in level.br_pe_data) {
        if (eventdata.weight <= 0) {
            function_1cddcb2898d7667(function_b73e6fcfacc71afd(eventtype) + " was invalidated due to 0 weight");
            continue;
        }
        if (isdefined(eventdata.validatefunc) && ![[ eventdata.validatefunc ]]()) {
            function_1cddcb2898d7667(function_b73e6fcfacc71afd(eventtype) + " was invalidated due to failing validate function");
            continue;
        }
        function_1cddcb2898d7667(function_b73e6fcfacc71afd(eventtype) + " was validated");
        validtypes[validtypes.size] = eventtype;
    }
    return validtypes;
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x157c
// Size: 0x16d
function getweightedsum(eventtypes, currentcircle, var_fb5ad7615ebab353, var_4bd41ebbce2d3bb6) {
    weightedsum = 0;
    if (!istrue(var_4bd41ebbce2d3bb6)) {
        foreach (eventtype in eventtypes) {
            eventdata = level.br_pe_data[eventtype];
            /#
                assert(isdefined(eventdata));
            #/
            eventweight = eventdata.weight;
            weights = ter_op(var_fb5ad7615ebab353, eventdata.var_b9b56551e1acfee2, eventdata.circleeventweights);
            if (isdefined(currentcircle) && isdefined(weights) && isdefined(weights[currentcircle])) {
                eventweight = weights[currentcircle];
            }
            weightedsum = weightedsum + eventweight;
        }
    } else {
        weights = level.var_88870d23daafa4a3.weights;
        foreach (eventtype in eventtypes) {
            if (!isdefined(weights[eventtype])) {
                continue;
            }
            weightedsum = weightedsum + weights[eventtype];
        }
    }
    return weightedsum;
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16f1
// Size: 0x1a1
function findeventforchosenweight(eventtypes, var_3163d28d241d4273, currentcircle, var_fb5ad7615ebab353, var_4bd41ebbce2d3bb6) {
    weightedsum = 0;
    if (!eventtypes.size) {
        return 0;
    }
    if (!istrue(var_4bd41ebbce2d3bb6)) {
        foreach (eventtype in eventtypes) {
            eventdata = level.br_pe_data[eventtype];
            /#
                assert(isdefined(eventdata));
            #/
            eventweight = eventdata.weight;
            weights = ter_op(var_fb5ad7615ebab353, eventdata.var_b9b56551e1acfee2, eventdata.circleeventweights);
            if (isdefined(currentcircle) && isdefined(weights) && isdefined(weights[currentcircle])) {
                eventweight = weights[currentcircle];
            }
            weightedsum = weightedsum + eventweight;
            if (var_3163d28d241d4273 <= weightedsum) {
                return eventtype;
            }
        }
    } else {
        weights = level.var_88870d23daafa4a3.weights;
        eventtypes = array_sort_with_func(eventtypes, &function_cf51a2b5438bb8cb);
        foreach (eventtype in eventtypes) {
            if (!isdefined(weights[eventtype])) {
                break;
            }
            weightedsum = weightedsum + weights[eventtype];
            if (var_3163d28d241d4273 <= weightedsum) {
                return eventtype;
            }
        }
    }
    return 0;
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x189a
// Size: 0x17
function function_cf51a2b5438bb8cb(firstnum, secondnum) {
    return firstnum < secondnum;
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18b9
// Size: 0x184
function choosepubliceventtype(skipwait, currentcircle, var_fb5ad7615ebab353, var_4bd41ebbce2d3bb6) {
    if (!isdefined(var_fb5ad7615ebab353)) {
        var_fb5ad7615ebab353 = 0;
    }
    validtypes = undefined;
    if (function_8aaa3648604bf278() && !istrue(var_4bd41ebbce2d3bb6)) {
        function_1cddcb2898d7667("Selecting event for circle#: " + currentcircle);
        validtypes = function_aaee113bdf9d92b9(currentcircle, var_fb5ad7615ebab353);
    } else if (istrue(var_4bd41ebbce2d3bb6)) {
        function_1cddcb2898d7667("Selecting event for overtime");
        validtypes = function_2398e1c3a602751d();
    } else {
        validtypes = validateevents();
    }
    if (function_8aaa3648604bf278()) {
        /#
            assert(validtypes.size != 0, "Zero events were validated, but CONST_BR_PE_TYPE_NONE should always be valid.");
        #/
    }
    weightedsum = getweightedsum(validtypes, currentcircle, var_fb5ad7615ebab353, var_4bd41ebbce2d3bb6);
    randchoice = randomfloat(weightedsum);
    eventtype = findeventforchosenweight(validtypes, randchoice, currentcircle, var_fb5ad7615ebab353, var_4bd41ebbce2d3bb6);
    function_1cddcb2898d7667("Selected event: " + function_b73e6fcfacc71afd(eventtype));
    forceeventtype = getdvarint(@"hash_c164d00b9c54b5b8", 0);
    if (forceeventtype != 0) {
        function_1cddcb2898d7667("Overriding selected event with: " + function_b73e6fcfacc71afd(forceeventtype));
        eventtype = forceeventtype;
    }
    if (isdefined(currentcircle)) {
        /#
            circleindex = ter_op(isdefined(currentcircle), currentcircle, "select_new_event");
            println(" was invalidated due to already activating max times" + circleindex + "CONST_BR_PE_TYPE_ROGUESIGNAL" + function_b73e6fcfacc71afd(eventtype));
        #/
    }
    level runpubliceventoftype(eventtype, skipwait, currentcircle, var_fb5ad7615ebab353, var_4bd41ebbce2d3bb6);
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a44
// Size: 0x5d
function activateevent(eventdata) {
    level endon("game_ended");
    level endon("cancel_public_event");
    level notify("br_pe_start");
    if (isdefined(eventdata.activatefunc)) {
        eventdata [[ eventdata.activatefunc ]]();
    }
    level.var_5e45ff103cde1cc6 = level.var_5e45ff103cde1cc6 - 1;
    level notify("br_pe_end");
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aa8
// Size: 0x79
function function_7ef2b71b1d3c3a01(currenttimeinterval) {
    if (isdefined(currenttimeinterval) && isdefined(level.var_5c60c997534512df[currenttimeinterval + 1])) {
        if (isdefined(level.var_5c60c997534512df[currenttimeinterval])) {
            timetowait = level.var_5c60c997534512df[currenttimeinterval + 1] - level.var_5c60c997534512df[currenttimeinterval];
            if (timetowait < 0) {
                function_1cddcb2898d7667("Time interval at " + currenttimeinterval + " is less than the previous time interval.");
                return -1;
            }
            return timetowait;
        }
    }
    return -1;
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b29
// Size: 0x274
function runpubliceventoftype(eventtype, skipwait, currentcircle, var_fb5ad7615ebab353, var_4bd41ebbce2d3bb6) {
    level endon("game_ended");
    level endon("cancel_public_event");
    if (eventtype == 0 && !function_8aaa3648604bf278()) {
        function_1cddcb2898d7667("No event was valid for this run.");
        return;
    }
    eventdata = level.br_pe_data[eventtype];
    /#
        assert(isdefined(eventdata));
    #/
    if (isdefined(eventdata.waitfunc) && !skipwait) {
        eventdata [[ eventdata.waitfunc ]]();
    }
    if (getdvarint(@"hash_a1b1b3ba057f4935", 1) > 0) {
        while (function_7ddadb6d5643bee4()) {
            level waittill_any_2("br_pe_end", "cancel_public_event");
            waitframe();
        }
    }
    level.var_5e45ff103cde1cc6 = level.var_5e45ff103cde1cc6 + 1;
    eventdata.active = 1;
    scripts/mp/gametypes/br_analytics::branalytics_publiceventstarted(eventtype);
    scripts/mp/gametypes/br_gametypes::runbrgametypefunc("onPublicEvent", eventtype, "start");
    if (function_8aaa3648604bf278()) {
        level.var_608e8df77c8e41c7 = 1;
        function_1cddcb2898d7667("Activating Event: " + function_b73e6fcfacc71afd(eventtype));
        level thread activateevent(eventdata);
        if (!istrue(var_fb5ad7615ebab353)) {
            if (!isdefined(level.var_a926065139739a2d)) {
                level.var_a926065139739a2d = [];
            }
            if (!isdefined(level.var_a926065139739a2d[eventtype])) {
                level.var_a926065139739a2d[eventtype] = 0;
            }
            level.var_a926065139739a2d[eventtype]++;
            if (isdefined(currentcircle)) {
                level.var_deb29f8358c3a6cb[eventtype] = currentcircle;
            }
        }
        var_be7ce9a1e0bed2bc = level.br_pe_data[eventtype].blacklist;
        /#
            assert(isdefined(var_be7ce9a1e0bed2bc));
        #/
        function_e168c332fe66f78f(var_be7ce9a1e0bed2bc);
        if (!istrue(var_4bd41ebbce2d3bb6)) {
            if (function_b1266056816b8716()) {
                waittime = function_7ef2b71b1d3c3a01(currentcircle);
                if (waittime >= 0) {
                    wait(waittime);
                } else {
                    scripts/mp/flags::gameflagwait("overtime_started");
                    level.var_8f19fadbf63fbc0 = 1;
                }
            } else {
                level waittill("br_circle_set");
            }
            function_2907d01a7d692108(eventtype);
            level notify("select_new_event");
        }
        return;
    }
    level activateevent(eventdata);
    if (istrue(eventdata.active)) {
        scripts/mp/gametypes/br_gametypes::runbrgametypefunc("onPublicEvent", eventtype, "end");
    }
    eventdata.active = 0;
    scripts/mp/gametypes/br_analytics::branalytics_publiceventended(eventtype);
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1da4
// Size: 0x71
function function_2907d01a7d692108(eventtype) {
    if (ispubliceventoftypeactive(eventtype)) {
        eventdata = level.br_pe_data[eventtype];
        if (isdefined(eventdata.deactivatefunc)) {
            eventdata [[ eventdata.deactivatefunc ]]();
        }
        scripts/mp/gametypes/br_gametypes::runbrgametypefunc("onPublicEvent", eventtype, "end");
        eventdata.active = 0;
        scripts/mp/gametypes/br_analytics::branalytics_publiceventended(eventtype);
    }
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e1c
// Size: 0x52
function ispubliceventoftypeactive(eventtype) {
    if (!level.var_34714ce799b6017 || !isdefined(level.br_pe_data)) {
        return 0;
    }
    eventdata = level.br_pe_data[eventtype];
    if (!isdefined(eventdata)) {
        return 0;
    }
    return istrue(eventdata.active);
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e76
// Size: 0x6f
function showsplashtoall(splashname, var_42b1e877ab187c6) {
    foreach (player in level.players) {
        player scripts/mp/hud_message::showsplash(splashname, undefined, undefined, undefined, undefined, var_42b1e877ab187c6);
    }
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1eec
// Size: 0x26
function function_6ef55ffe74b87a74(waittime) {
    level endon("game_ended");
    if (isdefined(waittime)) {
        wait(waittime);
    }
    setomnvar("ui_minimap_pulse", 0);
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f19
// Size: 0x33
function function_e37ee072d95a7c98(index) {
    /#
        level notify("CONST_BR_PE_TYPE_DEERHUNT");
        level endon("CONST_BR_PE_TYPE_DEERHUNT");
        level.var_5e45ff103cde1cc6 = 0;
        level runpubliceventoftype(index, 1);
    #/
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f53
// Size: 0x3f
function handledevcommand_publicevents(command, args) {
    /#
        switch (command) {
        case #"hash_94b933c8d88ea90f":
            thread function_e37ee072d95a7c98(int(args[0]));
            break;
        }
    #/
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f99
// Size: 0xd
function function_8aaa3648604bf278() {
    return istrue(level.var_b06bb395c37b7ab8);
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fae
// Size: 0xd
function function_b1266056816b8716() {
    return istrue(level.var_3f6a099030787823);
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fc3
// Size: 0x21
function function_826d1843088ff270() {
    level endon("game_ended");
    level waittill("bmo_overtime_start");
    level thread choosepubliceventtype(1, undefined, 0, 1);
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1feb
// Size: 0xa2
function function_79a1303427bfac85() {
    var_d788440e9c4b0193 = getdvarint(@"hash_f6d47ba2ae075d35", level.br_level.br_circleradii.size - 1);
    if (var_d788440e9c4b0193 <= 0) {
        return 0;
    }
    var_9fa6c50b17cd398e = 0;
    foreach (chance in level.var_6ed09339da2b5658) {
        if (chance > 0) {
            var_9fa6c50b17cd398e = 1;
            break;
        }
    }
    return var_9fa6c50b17cd398e;
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2095
// Size: 0x1ff
function function_a59044c0d9b0988b() {
    level endon("cancel_public_event");
    level endon("game_ended");
    scripts/mp/flags::gameflagwait("prematch_done");
    level.var_a926065139739a2d = [];
    level.var_deb29f8358c3a6cb = [];
    var_93fe8081bd477cb7 = 0;
    var_d788440e9c4b0193 = 0;
    var_1bc1989068d1a2de = 0;
    if (!function_b1266056816b8716()) {
        var_d788440e9c4b0193 = getdvarint(@"hash_f6d47ba2ae075d35", level.br_level.br_circleradii.size - 1);
        var_1bc1989068d1a2de = level.br_level.br_circleradii.size - 1;
    } else {
        var_417eaacaac86d96e = level.var_5c60c997534512df.size;
        var_d788440e9c4b0193 = getdvarint(@"hash_f6d47ba2ae075d35", var_417eaacaac86d96e);
        var_1bc1989068d1a2de = var_417eaacaac86d96e;
    }
    while (var_93fe8081bd477cb7 < var_1bc1989068d1a2de) {
        if (var_93fe8081bd477cb7 == 0) {
            if (!function_b1266056816b8716()) {
                level waittill("br_circle_set");
            } else {
                level thread function_826d1843088ff270();
                wait(level.var_5c60c997534512df[0]);
            }
            wait(level.var_6f249acebd235065);
        } else {
            if (istrue(level.var_608e8df77c8e41c7) || function_b1266056816b8716()) {
                level waittill("select_new_event");
            } else {
                level waittill("br_circle_set");
            }
            wait(level.var_98e0b0cb95eacda2);
        }
        if (isdefined(level.var_383825619799549) && level.var_383825619799549 == 0) {
            skipwait = 0;
        } else {
            skipwait = 1;
        }
        currentcircle = var_93fe8081bd477cb7;
        if (!function_b1266056816b8716()) {
            currentcircle = level.br_circle.circleindex;
        }
        if (istrue(level.var_8f19fadbf63fbc0)) {
            level thread choosepubliceventtype(1, currentcircle, 0, 1);
        } else if (shoulddopublicevent(currentcircle)) {
            level thread choosepubliceventtype(skipwait, currentcircle, 0);
        } else {
            /#
                println(" was invalidated due to already activating max times" + currentcircle + "<unknown string>");
            #/
            level notify("br_pe_no_event");
            level.var_608e8df77c8e41c7 = 0;
        }
        var_93fe8081bd477cb7++;
    }
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x229b
// Size: 0x336
function function_aaee113bdf9d92b9(currentcircle, var_fb5ad7615ebab353) {
    validtypes = [];
    foreach (eventtype, eventdata in level.br_pe_data) {
        if (eventdata.weight <= 0) {
            function_1cddcb2898d7667(function_b73e6fcfacc71afd(eventtype) + " was invalidated due to 0 weight");
            continue;
        }
        if (isdefined(eventdata.validatefunc) && ![[ eventdata.validatefunc ]]()) {
            function_1cddcb2898d7667(function_b73e6fcfacc71afd(eventtype) + " was invalidated due to failing validate function");
            continue;
        }
        if (isdefined(level.var_2a8ce228749bd191) && istrue(level.var_2a8ce228749bd191[eventtype])) {
            function_1cddcb2898d7667(function_b73e6fcfacc71afd(eventtype) + " was invalidated due to this event being on the blacklist");
            continue;
        }
        if (isdefined(eventdata.blacklist)) {
            var_6833992e762847c3 = 0;
            foreach (var_28f4fe0e827b9977 in eventdata.blacklist) {
                if (isdefined(level.var_a926065139739a2d[var_28f4fe0e827b9977])) {
                    if (level.var_a926065139739a2d[var_28f4fe0e827b9977] > 0) {
                        var_6833992e762847c3 = 1;
                        break;
                    }
                }
            }
            if (var_6833992e762847c3) {
                function_1cddcb2898d7667(function_b73e6fcfacc71afd(eventtype) + " was invalidated due to a previously run event to being on this event's blacklist");
                continue;
            }
        }
        weights = ter_op(var_fb5ad7615ebab353, eventdata.var_b9b56551e1acfee2, eventdata.circleeventweights);
        if (isdefined(weights)) {
            if (isdefined(weights[currentcircle]) && weights[currentcircle] <= 0) {
                function_1cddcb2898d7667(function_b73e6fcfacc71afd(eventtype) + " was invalidated due to 0 weight");
                continue;
            } else if (!isdefined(weights[currentcircle])) {
                function_1cddcb2898d7667(function_b73e6fcfacc71afd(eventtype) + " was invalidated due to missing circle event weight for circle" + currentcircle);
                continue;
            }
        }
        if (!istrue(var_fb5ad7615ebab353)) {
            if (isdefined(level.var_a926065139739a2d) && isdefined(level.var_a926065139739a2d[eventtype])) {
                if (isdefined(eventdata.var_d72a1842c5b57d1d) && level.var_a926065139739a2d[eventtype] >= eventdata.var_d72a1842c5b57d1d) {
                    function_1cddcb2898d7667(function_b73e6fcfacc71afd(eventtype) + " was invalidated due to already activating max times");
                    continue;
                }
            }
            if (isdefined(level.var_deb29f8358c3a6cb) && isdefined(level.var_deb29f8358c3a6cb[eventtype])) {
                var_a8239a74fb8ad784 = currentcircle - level.var_deb29f8358c3a6cb[eventtype];
                if (var_a8239a74fb8ad784 >= level.var_5a7ffdf228d98c9f + 1) {
                    level.var_deb29f8358c3a6cb[eventtype] = undefined;
                } else {
                    function_1cddcb2898d7667(function_b73e6fcfacc71afd(eventtype) + " was invalidated due to being a previously ran event within the span of the event repetition buffer.");
                    continue;
                }
            }
        }
        function_1cddcb2898d7667(function_b73e6fcfacc71afd(eventtype) + " was validated");
        validtypes[validtypes.size] = eventtype;
    }
    if (validtypes.size == 0) {
        validtypes[validtypes.size] = 0;
    }
    return validtypes;
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25d9
// Size: 0x2e
function function_1cddcb2898d7667(message) {
    if (getdvarint(@"hash_909fa2d0703b8e6b", 0) == 1) {
        logstring("PE: " + message);
    }
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x260e
// Size: 0x202
function function_b73e6fcfacc71afd(eventtype) {
    /#
        assert(isdefined(eventtype));
    #/
    switch (eventtype) {
    case 0:
        return "CONST_BR_PE_TYPE_NONE";
    case 2:
        return "CONST_BR_PE_TYPE_FIRESALE";
    case 3:
        return "CONST_BR_PE_TYPE_JAILBREAK";
    case 1:
        return "CONST_BR_PE_TYPE_CHOPPERS";
    case 4:
        return "CONST_BR_PE_TYPE_JUGGERNAUT";
    case 5:
        return "CONST_BR_PE_TYPE_BOMBARDMENT";
    case 6:
        return "CONST_BR_PE_TYPE_STRONGHOLD";
    case 7:
        return "CONST_BR_PE_TYPE_RESTOCK";
    case 8:
        return "CONST_BR_PE_TYPE_DATAHEIST";
    case 9:
        return "CONST_BR_PE_TYPE_AUAVSCAN";
    case 10:
        return "CONST_BR_PE_TYPE_BURN";
    case 11:
        return "CONST_BR_PE_TYPE_PLUNDER_CRATE_DROP";
    case 12:
        return "CONST_BR_PE_TYPE_BLOODMONEY";
    case 13:
        return "CONST_BR_PE_TYPE_HEAT";
    case 14:
        return "CONST_BR_PE_TYPE_MONEYSIPHON";
    case 15:
        return "CONST_BR_PE_TYPE_CONTRACTOR";
    case 16:
        return "CONST_BR_PE_TYPE_CANNONFODDER";
    case 17:
        return "CONST_BR_PE_TYPE_CHAMPION_JUGGERNAUT";
    case 18:
        return "CONST_BR_PE_TYPE_CHAMPION_CHOPPER";
    case 19:
        return "CONST_BR_PE_TYPE_DOUBLEXP_CRATE_DROP";
    case 20:
        return "CONST_BR_PE_TYPE_ROGUESIGNAL";
    case 21:
        return "CONST_BR_PE_TYPE_LOADOUTDROP";
    case 22:
        return "CONST_BR_PE_TYPE_HEAVYARMOR";
    case 23:
        return "CONST_BR_PE_TYPE_DEERHUNT";
    case 24:
        return "CONST_BR_PE_TYPE_FLYBUY";
    default:
        scripts/mp/utility/script::demoforcesre("No name is defined for eventType: " + eventtype);
        return "UNKNOWN_TYPE";
    }
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2817
// Size: 0x8c
function function_e168c332fe66f78f(var_723c2b64c6cebc7e) {
    /#
        assert(isdefined(var_723c2b64c6cebc7e));
    #/
    /#
        assert(isdefined(level.var_2a8ce228749bd191));
    #/
    foreach (eventtype in var_723c2b64c6cebc7e) {
        if (!isdefined(level.var_2a8ce228749bd191[eventtype])) {
            level.var_2a8ce228749bd191[eventtype] = 1;
        }
    }
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28aa
// Size: 0x74
function function_beb7ed17efad9bd7(eventdata) {
    if (isdefined(eventdata.var_b9b56551e1acfee2)) {
        foreach (weight in eventdata.var_b9b56551e1acfee2) {
            if (weight > 0) {
                return true;
            }
        }
    }
    return false;
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2926
// Size: 0x68
function function_3c3429141b476356() {
    var_8ab7165a9397f507 = getdvar(@"hash_8f7830432e7b3137", "jup_publiceventlist_none");
    var_37ee364b712c7afc = getscriptbundle("publiceventlist:" + var_8ab7165a9397f507);
    if (!isdefined(var_37ee364b712c7afc)) {
        scripts/mp/utility/script::demoforcesre("Public event list "" + var_8ab7165a9397f507 + "" not found. Make sure it's included in feature target");
        return undefined;
    }
    function_1cddcb2898d7667("Loading public event list: '" + var_8ab7165a9397f507 + "'");
    return var_37ee364b712c7afc;
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2996
// Size: 0x38
function function_dbc8f6cb3760cd82(reference, callback) {
    if (!isdefined(level.var_5f038a998555089e)) {
        level.var_5f038a998555089e = [];
    }
    level.var_5f038a998555089e[reference] = callback;
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29d5
// Size: 0x5c
function publiceventinit(reference, config) {
    if (!isdefined(reference)) {
        return;
    }
    if (!isdefined(level.var_5f038a998555089e) || !isdefined(level.var_5f038a998555089e[reference])) {
        scripts/mp/utility/script::demoforcesre("Public event reference "" + reference + "" found in scriptbundle but not init callback was not registered");
        return;
    }
    [[ level.var_5f038a998555089e[reference] ]](config);
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a38
// Size: 0xef
function function_c6e4130ba6397d68(var_37ee364b712c7afc) {
    overtimeevents = spawnstruct();
    overtimeevents.types = [];
    overtimeevents.weights = [];
    foreach (overtimeevent in var_37ee364b712c7afc.var_68f213b65ed34b12) {
        ref = function_b5db7c8669703c35(overtimeevent.event);
        id = function_75dee2719ee0e3e1(ref);
        if (!isdefined(id)) {
            continue;
        }
        overtimeevents.types[overtimeevents.types.size] = id;
        overtimeevents.weights[id] = overtimeevent.weight;
    }
    return overtimeevents;
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b2f
// Size: 0x130
function function_2398e1c3a602751d() {
    validtypes = [];
    foreach (eventtype in level.var_88870d23daafa4a3.types) {
        if (level.var_88870d23daafa4a3.weights[eventtype] <= 0) {
            function_1cddcb2898d7667(function_b73e6fcfacc71afd(eventtype) + " was invalidated due to 0 weight");
            continue;
        }
        if (!isdefined(level.br_pe_data[eventtype])) {
            scripts/mp/utility/script::demoforcesre("Event ID " + eventtype + " was in 'Overtime Event List', but not in 'Public Event List' in script bundle. Event was never initialized");
            continue;
        }
        if (isdefined(level.br_pe_data[eventtype].validatefunc) && ![[ level.br_pe_data[eventtype].validatefunc ]]()) {
            function_1cddcb2898d7667(function_b73e6fcfacc71afd(eventtype) + " was invalidated due to failing validate function");
            continue;
        }
        function_1cddcb2898d7667(function_b73e6fcfacc71afd(eventtype) + " was validated");
        validtypes[validtypes.size] = eventtype;
    }
    if (validtypes.size == 0) {
        validtypes[validtypes.size] = 0;
    }
    return validtypes;
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c67
// Size: 0x105
function function_75dee2719ee0e3e1(reference) {
    switch (reference) {
    case #"hash_4624daa9491cffa2":
        return 2;
    case #"hash_925d425f6dad8b4":
        return 3;
    case #"hash_6a1e6a1f26ffa72e":
        return 7;
    case #"hash_d9cf7f7fb5441be1":
        return 1;
    case #"hash_4873bdb85bbcd2a6":
        return 5;
    case #"hash_4ad475e6e15635bd":
        return 4;
    case #"hash_f598eb92b5d045aa":
        return 8;
    case #"hash_eefeead2c84a2fb1":
        return 9;
    case #"hash_18e0a53b06412f33":
        return 11;
    case #"hash_1c5ecc623bc8019d":
        return 12;
    case #"hash_2e1d642f7f154c62":
        return 14;
    case #"hash_946605aadc7a1422":
        return 15;
    case #"hash_252a7e579d51707a":
        return 21;
    case #"hash_beb0467de4253023":
        return 6;
    case #"hash_ef5cb5308b913e42":
        return 24;
    }
    scripts/mp/utility/script::demoforcesre("Could not find id for public event reference: " + reference);
    return undefined;
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d74
// Size: 0xbe
function function_5b7d8ca93f8705f1(eventinfo, eventname) {
    dvarbase = hashcat(@"hash_abb46656d4b7e51c", eventname, "_");
    eventinfo.weight = getdvarfloat(hashcat(dvarbase, "weight"), eventinfo.weight);
    eventinfo.var_d72a1842c5b57d1d = getdvarint(hashcat(dvarbase, "max_times"), eventinfo.var_d72a1842c5b57d1d);
    circleweights = getdvar(hashcat(dvarbase, "circle_weights"), "");
    if (circleweights != "") {
        eventinfo.circleeventweights = function_8fc51a5af06412cf(circleweights);
    }
}

// Namespace br_publicevents / scripts/mp/gametypes/br_publicevents
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e39
// Size: 0x43
function function_b5db7c8669703c35(var_a7708841b4fa7e4d) {
    eventbundle = getscriptbundle("publicevent:" + var_a7708841b4fa7e4d);
    if (!isdefined(eventbundle)) {
        scripts/mp/utility/script::demoforcesre("Could not find publicevent asset: " + var_a7708841b4fa7e4d);
        return undefined;
    }
    return eventbundle.ref;
}

