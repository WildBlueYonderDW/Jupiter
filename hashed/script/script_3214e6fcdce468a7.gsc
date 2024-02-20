// mwiii decomp prototype
#using scripts\engine\utility.gsc;

#namespace throttle;

// Namespace throttle/namespace_f6b8dbdf5c7eed7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3a9
// Size: 0x35
function private function_9520a7d8b5aee737(throttle) {
    throttle endon(throttle.var_a7774b82d7309ed7);
    while (isdefined(throttle)) {
        function_4707c765d202d592(throttle);
        wait(throttle.updaterate_);
    }
}

// Namespace throttle/namespace_f6b8dbdf5c7eed7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3e5
// Size: 0xb1
function private function_4707c765d202d592(throttle) {
    processed = 0;
    foreach (item in throttle.queue_) {
        if (!isdefined(item)) {
            continue;
        }
        throttle.queue_ = array_remove(throttle.queue_, item);
        item notify(throttle.var_35615e062783af3e);
        processed++;
        if (processed >= throttle.processlimit_) {
            break;
        }
    }
}

// Namespace throttle/namespace_f6b8dbdf5c7eed7
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49d
// Size: 0xcf
function function_e4c99b0f178ffb98(name, processlimit, updaterate, var_7ce3ddc2c6ea96ff) {
    processlimit = function_53c4c53197386572(processlimit, 1);
    if (processlimit == 0) {
        return undefined;
    }
    /#
        assert(isdefined(name) && isstring(name));
    #/
    throttle = spawnstruct();
    throttle.queue_ = [];
    throttle.var_35615e062783af3e = name + "_wake_up";
    throttle.var_a7774b82d7309ed7 = name + "_stop_threads";
    throttle.processlimit_ = processlimit;
    throttle.updaterate_ = function_53c4c53197386572(updaterate, level.framedurationseconds);
    throttle.var_93b7535b75e941e0 = var_7ce3ddc2c6ea96ff;
    thread function_9520a7d8b5aee737(throttle);
    return throttle;
}

// Namespace throttle/namespace_f6b8dbdf5c7eed7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x574
// Size: 0x22
function function_e70f01b44a09852c(throttle) {
    if (isdefined(throttle)) {
        throttle notify(throttle.var_a7774b82d7309ed7);
        throttle = undefined;
    }
}

// Namespace throttle/namespace_f6b8dbdf5c7eed7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59d
// Size: 0xee
function function_f632348cbb773537(throttle, entity) {
    /#
        /#
            assertex(!isdefined(throttle.gate), "Ent 3 in queue: ");
        #/
    #/
    throttle endon(throttle.var_a7774b82d7309ed7);
    if (!isdefined(throttle)) {
        /#
            assertmsg("Throttle is not defined!");
        #/
        return;
    }
    while (isdefined(throttle.var_93b7535b75e941e0) && throttle.queue_.size > throttle.var_93b7535b75e941e0) {
        function_4707c765d202d592(throttle);
    }
    if (!isdefined(entity)) {
        return;
    }
    if (!isent(entity) && !isstruct(entity)) {
        return;
    }
    if (!function_fc64178f71375137(throttle.queue_, entity)) {
        throttle.queue_[throttle.queue_.size] = entity;
    }
    entity endon("death");
    entity endon("delete");
    entity waittill(throttle.var_35615e062783af3e);
}

// Namespace throttle/namespace_f6b8dbdf5c7eed7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x692
// Size: 0x26
function function_11ab6d104bf77779(throttle, entity) {
    return array_contains(throttle.queue_, entity);
}

// Namespace throttle/namespace_f6b8dbdf5c7eed7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c0
// Size: 0x32
function function_8ce6c42c18618555(throttle, entity) {
    throttle.queue_ = array_remove(throttle.queue_, entity);
}

// Namespace throttle/namespace_f6b8dbdf5c7eed7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f9
// Size: 0xaf
function function_af33edfaf05fc572(name, processlimit, updaterate) {
    processlimit = function_53c4c53197386572(processlimit, 1);
    if (processlimit == 0) {
        return undefined;
    }
    /#
        assert(isdefined(name) && isstring(name));
    #/
    throttle = spawnstruct();
    throttle.var_a7774b82d7309ed7 = name + "_stop_threads";
    throttle.var_be94a08fd7e08d14 = 0;
    throttle.processlimit_ = processlimit;
    throttle.updaterate_ = function_53c4c53197386572(updaterate, level.framedurationseconds);
    /#
        throttle.gate = 1;
    #/
    return throttle;
}

// Namespace throttle/namespace_f6b8dbdf5c7eed7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b0
// Size: 0x88
function function_6f7b33660ae155ef(throttle) {
    /#
        /#
            assertex(throttle.gate, "<unknown string>");
        #/
    #/
    if (!isdefined(throttle)) {
        /#
            assertmsg("Throttle is not defined!");
        #/
        return;
    }
    if (throttle.var_be94a08fd7e08d14 >= throttle.processlimit_) {
        throttle endon(throttle.var_a7774b82d7309ed7);
        wait(throttle.updaterate_);
        throttle.var_be94a08fd7e08d14 = 0;
    }
    throttle.var_be94a08fd7e08d14++;
}

// Namespace throttle/namespace_f6b8dbdf5c7eed7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x83f
// Size: 0x26
function function_ffc20a0cd9408d3e() {
    function_b997916f30000d4a();
    function_f0e537fab28ca40b();
    function_ee075c49b3a71bc5();
    function_7402d747b0d4d1eb();
    function_682c4176f0ccf633();
}

// Namespace throttle/namespace_f6b8dbdf5c7eed7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86c
// Size: 0x1f
function test_print(msg) {
    /#
        msg = "<unknown string>" + msg;
        println(msg);
    #/
}

// Namespace throttle/namespace_f6b8dbdf5c7eed7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x892
// Size: 0x259
function function_b997916f30000d4a() {
    test_print("BEGIN throttle_UT_initialize");
    var_577d39197b4842c6 = function_e4c99b0f178ffb98("test_throttle_1", 1, level.framedurationseconds);
    test_print("CALL - throttle_initialize( test_throttle_1, " + 1 + ", " + level.framedurationseconds + ")");
    /#
        assert(isarray(var_577d39197b4842c6.queue_) && var_577d39197b4842c6.queue_.size == 0);
    #/
    /#
        assert(var_577d39197b4842c6.var_35615e062783af3e == "test_throttle_1" + "_wake_up");
    #/
    /#
        assert(var_577d39197b4842c6.processlimit_ == 1);
    #/
    /#
        assert(var_577d39197b4842c6.updaterate_ == level.framedurationseconds);
    #/
    /#
        assert(var_577d39197b4842c6.var_93b7535b75e941e0 == undefined);
    #/
    var_577d39197b4842c6 = function_e4c99b0f178ffb98("test_throttle_2", 2, level.framedurationseconds);
    test_print("CALL - throttle_initialize( test_throttle_2, " + 2 + ", " + level.framedurationseconds + ")");
    /#
        assert(var_577d39197b4842c6.processlimit_ == 2);
    #/
    var_577d39197b4842c6 = function_e4c99b0f178ffb98("test_throttle_queueLimit", 1, level.framedurationseconds, 3);
    test_print("CALL - throttle_initialize( test_throttle_queueLimit, " + 1 + ", " + level.framedurationseconds + ", " + 3 + ")");
    /#
        assert(var_577d39197b4842c6.var_93b7535b75e941e0 == 3);
    #/
    var_577d39197b4842c6 = function_e4c99b0f178ffb98("test_throttle_defaults");
    test_print("CALL - throttle_initialize( test_throttle_defaults )");
    /#
        assert(isarray(var_577d39197b4842c6.queue_) && var_577d39197b4842c6.queue_.size == 0);
    #/
    /#
        assert(var_577d39197b4842c6.var_35615e062783af3e == "test_throttle_defaults" + "_wake_up");
    #/
    /#
        assert(var_577d39197b4842c6.processlimit_ == 1);
    #/
    /#
        assert(var_577d39197b4842c6.updaterate_ == level.framedurationseconds);
    #/
    /#
        assert(var_577d39197b4842c6.var_93b7535b75e941e0 == undefined);
    #/
    test_print("END throttle_UT_initialize");
}

// Namespace throttle/namespace_f6b8dbdf5c7eed7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf2
// Size: 0xc4
function function_f0e537fab28ca40b() {
    test_print("BEGIN throttle_UT_queue");
    var_577d39197b4842c6 = function_e4c99b0f178ffb98("test_throttle_wait", 1, level.framedurationseconds);
    test_print("CALL - throttle_initialize( " + 1 + ", " + level.framedurationseconds + ")");
    entity = spawn("script_model", (0, 0, 0));
    function_f632348cbb773537(var_577d39197b4842c6, entity);
    test_print("CALL - wait_in_queue");
    var_415a37c3a18ff3c5 = function_11ab6d104bf77779(var_577d39197b4842c6, entity);
    test_print("Ent in queue: " + var_415a37c3a18ff3c5);
    /#
        assert(!var_415a37c3a18ff3c5);
    #/
    test_print("END throttle_UT_queue");
}

// Namespace throttle/namespace_f6b8dbdf5c7eed7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbbd
// Size: 0x11a
function function_ee075c49b3a71bc5() {
    test_print("BEGIN throttle_UT_queue_10");
    var_577d39197b4842c6 = function_e4c99b0f178ffb98("test_throttle_wait", 1, level.framedurationseconds);
    test_print("CALL - throttle_initialize( " + 1 + ", " + level.framedurationseconds + ")");
    ents = [];
    for (i = 1; i <= 10; i++) {
        ents[ents.size] = spawn("script_model", (0, 0, 0));
        function_f632348cbb773537(var_577d39197b4842c6, ents[ents.size - 1]);
        test_print("CALL - wait_in_queue " + i);
        test_print("Time - " + gettime());
        test_print("Ents in Queue - " + var_577d39197b4842c6.queue_.size);
    }
    var_415a37c3a18ff3c5 = function_11ab6d104bf77779(var_577d39197b4842c6, ents[3]);
    test_print("Ent 3 in queue: " + var_415a37c3a18ff3c5);
    /#
        assert(!var_415a37c3a18ff3c5);
    #/
    test_print("END throttle_UT_queue_10");
}

// Namespace throttle/namespace_f6b8dbdf5c7eed7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcde
// Size: 0x11a
function function_7402d747b0d4d1eb() {
    test_print("BEGIN throttle_UT_queue_10_threaded");
    var_577d39197b4842c6 = function_e4c99b0f178ffb98("test_throttle_wait", 1, level.framedurationseconds);
    test_print("CALL - throttle_initialize( " + 1 + ", " + level.framedurationseconds + ")");
    ents = [];
    for (i = 1; i <= 10; i++) {
        ents[ents.size] = spawn("script_model", (0, 0, 0));
        thread function_f632348cbb773537(var_577d39197b4842c6, ents[ents.size - 1]);
        test_print("CALL - wait_in_queue " + i);
        test_print("Time - " + gettime());
        test_print("Ents in Queue - " + var_577d39197b4842c6.queue_.size);
    }
    var_415a37c3a18ff3c5 = function_11ab6d104bf77779(var_577d39197b4842c6, ents[3]);
    test_print("Ent 3 in queue: " + var_415a37c3a18ff3c5);
    /#
        assert(var_415a37c3a18ff3c5);
    #/
    test_print("END throttle_UT_queue_10_threaded");
}

// Namespace throttle/namespace_f6b8dbdf5c7eed7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdff
// Size: 0x13f
function function_682c4176f0ccf633() {
    test_print("BEGIN throttle_UT_leave_queue");
    var_577d39197b4842c6 = function_e4c99b0f178ffb98("test_throttle_wait", 1, level.framedurationseconds);
    test_print("CALL - throttle_initialize( " + 1 + ", " + level.framedurationseconds + ")");
    ents = [];
    for (i = 1; i <= 10; i++) {
        ents[ents.size] = spawn("script_model", (0, 0, 0));
        thread function_f632348cbb773537(var_577d39197b4842c6, ents[ents.size - 1]);
        test_print("CALL - wait_in_queue " + i);
        test_print("Time - " + gettime());
    }
    var_415a37c3a18ff3c5 = function_11ab6d104bf77779(var_577d39197b4842c6, ents[3]);
    test_print("ent 3 in queue: " + var_415a37c3a18ff3c5);
    /#
        assert(var_415a37c3a18ff3c5);
    #/
    function_8ce6c42c18618555(var_577d39197b4842c6, ents[3]);
    test_print("CALL - leave_queue");
    var_415a37c3a18ff3c5 = function_11ab6d104bf77779(var_577d39197b4842c6, ents[3]);
    test_print("ent 3 in queue: " + var_415a37c3a18ff3c5);
    /#
        assert(!var_415a37c3a18ff3c5);
    #/
    test_print("END throttle_UT_leave_queue");
}

