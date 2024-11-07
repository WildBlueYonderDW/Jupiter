#using scripts\engine\utility.gsc;

#namespace throttle;

// Namespace throttle / scripts\engine\throttle
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x382
// Size: 0x27
function private function_9520a7d8b5aee737(throttle) {
    while (isdefined(throttle)) {
        function_4707c765d202d592(throttle);
        wait throttle.updaterate_;
    }
}

// Namespace throttle / scripts\engine\throttle
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3b1
// Size: 0xac
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

// Namespace throttle / scripts\engine\throttle
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x465
// Size: 0xb0
function throttle_initialize(name, processlimit, updaterate, queuelimit) {
    assert(isdefined(name) && isstring(name));
    throttle = spawnstruct();
    throttle.queue_ = [];
    throttle.var_35615e062783af3e = name + "_wake_up";
    throttle.processlimit_ = default_to(processlimit, 1);
    throttle.updaterate_ = default_to(updaterate, level.framedurationseconds);
    throttle.queuelimit_ = queuelimit;
    thread function_9520a7d8b5aee737(throttle);
    return throttle;
}

// Namespace throttle / scripts\engine\throttle
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x51e
// Size: 0xae
function function_f632348cbb773537(throttle, entity) {
    while (isdefined(throttle.queuelimit_) && throttle.queue_.size > throttle.queuelimit_) {
        function_4707c765d202d592(throttle);
    }
    if (!isdefined(entity)) {
        return;
    }
    if (!isent(entity) && !isstruct(entity)) {
        return;
    }
    if (!arraycontains(throttle.queue_, entity)) {
        throttle.queue_[throttle.queue_.size] = entity;
    }
    entity endon("death");
    entity endon("delete");
    entity waittill(throttle.var_35615e062783af3e);
}

// Namespace throttle / scripts\engine\throttle
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5d4
// Size: 0x25
function function_11ab6d104bf77779(throttle, entity) {
    return array_contains(throttle.queue_, entity);
}

// Namespace throttle / scripts\engine\throttle
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x602
// Size: 0x31
function function_8ce6c42c18618555(throttle, entity) {
    throttle.queue_ = array_remove(throttle.queue_, entity);
}

// Namespace throttle / scripts\engine\throttle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x63b
// Size: 0x25
function function_ffc20a0cd9408d3e() {
    function_b997916f30000d4a();
    function_f0e537fab28ca40b();
    function_ee075c49b3a71bc5();
    function_7402d747b0d4d1eb();
    function_682c4176f0ccf633();
}

// Namespace throttle / scripts\engine\throttle
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x668
// Size: 0x1e
function test_print(msg) {
    /#
        msg = "<dev string:x1c>" + msg;
        println(msg);
    #/
}

// Namespace throttle / scripts\engine\throttle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x68e
// Size: 0x258
function function_b997916f30000d4a() {
    test_print("BEGIN throttle_UT_initialize");
    test_throttle = throttle_initialize("test_throttle_1", 1, level.framedurationseconds);
    test_print("CALL - throttle_initialize( test_throttle_1, " + 1 + ", " + level.framedurationseconds + ")");
    assert(isarray(test_throttle.queue_) && test_throttle.queue_.size == 0);
    assert(test_throttle.var_35615e062783af3e == "test_throttle_1" + "_wake_up");
    assert(test_throttle.processlimit_ == 1);
    assert(test_throttle.updaterate_ == level.framedurationseconds);
    assert(test_throttle.queuelimit_ == undefined);
    test_throttle = throttle_initialize("test_throttle_2", 2, level.framedurationseconds);
    test_print("CALL - throttle_initialize( test_throttle_2, " + 2 + ", " + level.framedurationseconds + ")");
    assert(test_throttle.processlimit_ == 2);
    test_throttle = throttle_initialize("test_throttle_queueLimit", 1, level.framedurationseconds, 3);
    test_print("CALL - throttle_initialize( test_throttle_queueLimit, " + 1 + ", " + level.framedurationseconds + ", " + 3 + ")");
    assert(test_throttle.queuelimit_ == 3);
    test_throttle = throttle_initialize("test_throttle_defaults");
    test_print("CALL - throttle_initialize( test_throttle_defaults )");
    assert(isarray(test_throttle.queue_) && test_throttle.queue_.size == 0);
    assert(test_throttle.var_35615e062783af3e == "test_throttle_defaults" + "_wake_up");
    assert(test_throttle.processlimit_ == 1);
    assert(test_throttle.updaterate_ == level.framedurationseconds);
    assert(test_throttle.queuelimit_ == undefined);
    test_print("END throttle_UT_initialize");
}

// Namespace throttle / scripts\engine\throttle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8ee
// Size: 0xc3
function function_f0e537fab28ca40b() {
    test_print("BEGIN throttle_UT_queue");
    test_throttle = throttle_initialize("test_throttle_wait", 1, level.framedurationseconds);
    test_print("CALL - throttle_initialize( " + 1 + ", " + level.framedurationseconds + ")");
    entity = spawn("script_model", (0, 0, 0));
    function_f632348cbb773537(test_throttle, entity);
    test_print("CALL - wait_in_queue");
    var_415a37c3a18ff3c5 = function_11ab6d104bf77779(test_throttle, entity);
    test_print("Ent in queue: " + var_415a37c3a18ff3c5);
    assert(!var_415a37c3a18ff3c5);
    test_print("END throttle_UT_queue");
}

// Namespace throttle / scripts\engine\throttle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9b9
// Size: 0x119
function function_ee075c49b3a71bc5() {
    test_print("BEGIN throttle_UT_queue_10");
    test_throttle = throttle_initialize("test_throttle_wait", 1, level.framedurationseconds);
    test_print("CALL - throttle_initialize( " + 1 + ", " + level.framedurationseconds + ")");
    ents = [];
    for (i = 1; i <= 10; i++) {
        ents[ents.size] = spawn("script_model", (0, 0, 0));
        function_f632348cbb773537(test_throttle, ents[ents.size - 1]);
        test_print("CALL - wait_in_queue " + i);
        test_print("Time - " + gettime());
        test_print("Ents in Queue - " + test_throttle.queue_.size);
    }
    var_415a37c3a18ff3c5 = function_11ab6d104bf77779(test_throttle, ents[3]);
    test_print("Ent 3 in queue: " + var_415a37c3a18ff3c5);
    assert(!var_415a37c3a18ff3c5);
    test_print("END throttle_UT_queue_10");
}

// Namespace throttle / scripts\engine\throttle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xada
// Size: 0x119
function function_7402d747b0d4d1eb() {
    test_print("BEGIN throttle_UT_queue_10_threaded");
    test_throttle = throttle_initialize("test_throttle_wait", 1, level.framedurationseconds);
    test_print("CALL - throttle_initialize( " + 1 + ", " + level.framedurationseconds + ")");
    ents = [];
    for (i = 1; i <= 10; i++) {
        ents[ents.size] = spawn("script_model", (0, 0, 0));
        thread function_f632348cbb773537(test_throttle, ents[ents.size - 1]);
        test_print("CALL - wait_in_queue " + i);
        test_print("Time - " + gettime());
        test_print("Ents in Queue - " + test_throttle.queue_.size);
    }
    var_415a37c3a18ff3c5 = function_11ab6d104bf77779(test_throttle, ents[3]);
    test_print("Ent 3 in queue: " + var_415a37c3a18ff3c5);
    assert(var_415a37c3a18ff3c5);
    test_print("END throttle_UT_queue_10_threaded");
}

// Namespace throttle / scripts\engine\throttle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbfb
// Size: 0x13e
function function_682c4176f0ccf633() {
    test_print("BEGIN throttle_UT_leave_queue");
    test_throttle = throttle_initialize("test_throttle_wait", 1, level.framedurationseconds);
    test_print("CALL - throttle_initialize( " + 1 + ", " + level.framedurationseconds + ")");
    ents = [];
    for (i = 1; i <= 10; i++) {
        ents[ents.size] = spawn("script_model", (0, 0, 0));
        thread function_f632348cbb773537(test_throttle, ents[ents.size - 1]);
        test_print("CALL - wait_in_queue " + i);
        test_print("Time - " + gettime());
    }
    var_415a37c3a18ff3c5 = function_11ab6d104bf77779(test_throttle, ents[3]);
    test_print("ent 3 in queue: " + var_415a37c3a18ff3c5);
    assert(var_415a37c3a18ff3c5);
    function_8ce6c42c18618555(test_throttle, ents[3]);
    test_print("CALL - leave_queue");
    var_415a37c3a18ff3c5 = function_11ab6d104bf77779(test_throttle, ents[3]);
    test_print("ent 3 in queue: " + var_415a37c3a18ff3c5);
    assert(!var_415a37c3a18ff3c5);
    test_print("END throttle_UT_leave_queue");
}

