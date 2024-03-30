// mwiii decomp prototype
#namespace benchmark;

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x561
// Size: 0x1d
function function_63abc2408f9ef4ba(name) {
    level.var_2b911118b9f2e6c0[name] = getsystemtimeinmicroseconds();
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x585
// Size: 0x69
function function_b41d4c50a5cb0a36(name) {
    time = getsystemtimeinmicroseconds();
    if (!isdefined(level.var_5abcc6f847b4e3ee[name])) {
        level.var_5abcc6f847b4e3ee[name] = 0;
    }
    diff = time - level.var_2b911118b9f2e6c0[name];
    level.var_5abcc6f847b4e3ee[name] = level.var_5abcc6f847b4e3ee[name] + diff;
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f5
// Size: 0x5d
function function_988c6c7c7776406c() {
    /#
        println("Fields_Level_Nested");
    #/
    max_iterations = getdvarint(@"hash_939ffa702b7da068", 10000);
    function_63abc2408f9ef4ba("ForLoopRef");
    for (i = 0; i < max_iterations; i++) {
    }
    function_b41d4c50a5cb0a36("ForLoopRef");
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x659
// Size: 0x117
function bench_foreach() {
    /#
        println("0");
    #/
    max_iterations = getdvarint(@"hash_939ffa702b7da068", 10000);
    a = [];
    for (i = 0; i < 10000; i++) {
        a[i] = i;
    }
    function_63abc2408f9ef4ba("ForEach");
    foreach (v in a) {
    }
    function_b41d4c50a5cb0a36("ForEach");
    function_63abc2408f9ef4ba("ForEach_Val");
    foreach (x in a) {
    }
    function_b41d4c50a5cb0a36("ForEach_Val");
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x777
// Size: 0x125
function function_18cb5fb798c607cd() {
    /#
        println("C");
    #/
    max_iterations = getdvarint(@"hash_939ffa702b7da068", 10000);
    a = [];
    a[0] = 0;
    function_63abc2408f9ef4ba("ForEachSetup");
    for (i = 0; i < max_iterations; i++) {
        foreach (v in a) {
        }
    }
    function_b41d4c50a5cb0a36("ForEachSetup");
    function_63abc2408f9ef4ba("ForEachSetup_Val");
    for (i = 0; i < max_iterations; i++) {
        foreach (x in a) {
        }
    }
    function_b41d4c50a5cb0a36("ForEachSetup_Val");
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8a3
// Size: 0xbe
function function_e4e266c2c4ebf49e() {
    /#
        println("<unknown string>");
    #/
    max_iterations = getdvarint(@"hash_939ffa702b7da068", 10000);
    a = [];
    function_63abc2408f9ef4ba("ForArray");
    function_63abc2408f9ef4ba("ForArray_Init");
    for (i = 0; i < 10000; i++) {
        a[i] = i;
    }
    function_b41d4c50a5cb0a36("ForArray_Init");
    function_63abc2408f9ef4ba("ForArray_Eval");
    for (i = 0; i < a.size; i++) {
        t = a[i];
    }
    function_b41d4c50a5cb0a36("ForArray_Eval");
    function_b41d4c50a5cb0a36("ForArray");
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x968
// Size: 0x76
function function_723ebfcdaa798c34() {
    /#
        println("<unknown string>");
    #/
    max_iterations = getdvarint(@"hash_939ffa702b7da068", 10000);
    function_63abc2408f9ef4ba("ForLoopSetup");
    for (i = 0; i < max_iterations; i++) {
        for (j = 0; j < 1; j++) {
        }
    }
    function_b41d4c50a5cb0a36("ForLoopSetup");
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9e5
// Size: 0x7a
function function_10f6d810677cee84() {
    /#
        println("<unknown string>");
    #/
    max_iterations = getdvarint(@"hash_939ffa702b7da068", 10000);
    a = 1;
    function_63abc2408f9ef4ba("IfElse");
    for (i = 0; i < max_iterations; i++) {
        if (a == 0) {
            a = 1;
            continue;
        }
        a = 0;
    }
    function_b41d4c50a5cb0a36("IfElse");
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa66
// Size: 0x99
function function_9628bf5282b8bafc() {
    /#
        println("<unknown string>");
    #/
    max_iterations = getdvarint(@"hash_939ffa702b7da068", 10000);
    a = 0;
    function_63abc2408f9ef4ba("AllocVar");
    for (i = 0; i < max_iterations; i++) {
        if (i & 1) {
            x = 0;
            y = 1;
            z = 2;
        }
        a++;
    }
    function_b41d4c50a5cb0a36("AllocVar");
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb06
// Size: 0x3
function function_41d5b4596b4cf805() {
    
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb10
// Size: 0x64
function function_dff6885d265db0fd() {
    /#
        println("<unknown string>");
    #/
    max_iterations = getdvarint(@"hash_939ffa702b7da068", 10000);
    function_63abc2408f9ef4ba("MinScriptFunction");
    for (i = 0; i < max_iterations; i++) {
        function_41d5b4596b4cf805();
    }
    function_b41d4c50a5cb0a36("MinScriptFunction");
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb7b
// Size: 0xc
function function_efadcc2e0fb51aaa(a) {
    
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb8e
// Size: 0x71
function function_2308f139d0ffbc41() {
    /#
        println("<unknown string>");
    #/
    max_iterations = getdvarint(@"hash_939ffa702b7da068", 10000);
    a = 0;
    function_63abc2408f9ef4ba("OneArgScriptFunction");
    for (i = 0; i < max_iterations; i++) {
        function_efadcc2e0fb51aaa(a);
    }
    function_b41d4c50a5cb0a36("OneArgScriptFunction");
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0xc06
// Size: 0x54
function function_c7c4508ca492914f(a, b, c, d, e, f, g, h, j, k) {
    
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc61
// Size: 0xf5
function function_76d6d0feedd3126b() {
    /#
        println("<unknown string>");
    #/
    max_iterations = getdvarint(@"hash_939ffa702b7da068", 10000);
    a = 0;
    b = 1;
    c = 2;
    d = 3;
    e = 4;
    f = 5;
    g = 6;
    h = 7;
    j = 8;
    k = 9;
    function_63abc2408f9ef4ba("MaxScriptFunc");
    for (i = 0; i < max_iterations; i++) {
        function_c7c4508ca492914f(a, b, c, d, e, f, g, h, j, k);
    }
    function_b41d4c50a5cb0a36("MaxScriptFunc");
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd5d
// Size: 0x6d
function function_589fd6b13ca60155() {
    /#
        println("<unknown string>");
    #/
    max_iterations = getdvarint(@"hash_939ffa702b7da068", 10000);
    function_63abc2408f9ef4ba("BuiltinFunction");
    for (i = 0; i < max_iterations; i++) {
        t = gettime();
    }
    function_b41d4c50a5cb0a36("BuiltinFunction");
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdd1
// Size: 0xa2
function function_cae58617e7945254() {
    /#
        println("<unknown string>");
    #/
    max_iterations = getdvarint(@"hash_939ffa702b7da068", 10000);
    p = level.players[0];
    if (!isdefined(p)) {
        function_63abc2408f9ef4ba("BuiltinMethod");
        function_b41d4c50a5cb0a36("BuiltinMethod");
        return;
    }
    function_63abc2408f9ef4ba("BuiltinMethod");
    for (i = 0; i < max_iterations; i++) {
        p allowfire(0);
    }
    function_b41d4c50a5cb0a36("BuiltinMethod");
    p allowfire(1);
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe7a
// Size: 0xe0
function bench_variables() {
    /#
        println("<unknown string>");
    #/
    max_iterations = getdvarint(@"hash_939ffa702b7da068", 10000);
    function_63abc2408f9ef4ba("Variables");
    for (i = 0; i < max_iterations; i++) {
        a = 0;
        b = 1;
        c = 2;
        d = 3;
        e = 4;
        f = 5;
        g = 6;
        h = 7;
        j = 8;
        k = 9;
    }
    function_b41d4c50a5cb0a36("Variables");
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf61
// Size: 0xff
function bench_strings() {
    /#
        println("<unknown string>");
    #/
    max_iterations = getdvarint(@"hash_939ffa702b7da068", 10000);
    function_63abc2408f9ef4ba("Strings");
    for (i = 0; i < max_iterations; i++) {
        a = "foo";
        b = "foo";
        c = "foo2";
        d = "foo2";
        e = a == b;
        f = c == a;
        g = a + b;
        h = c + d;
        j = a + c;
        k = d + a;
    }
    function_b41d4c50a5cb0a36("Strings");
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1067
// Size: 0xf8
function function_add278ceb4188914() {
    /#
        println("<unknown string>");
    #/
    max_iterations = getdvarint(@"hash_939ffa702b7da068", 10000);
    function_63abc2408f9ef4ba("Arrays");
    for (i = 0; i < max_iterations; i++) {
        function_63abc2408f9ef4ba("Arrays_Number");
        a = [];
        a[0] = 0;
        a[1] = 1;
        x = a[0] + a[1];
        a[0] = undefined;
        a[1] = undefined;
        function_b41d4c50a5cb0a36("Arrays_Number");
        function_63abc2408f9ef4ba("Arrays_String");
        a = [];
        a["foo"] = 0;
        a["bar"] = 1;
        x = a["foo"] + a["bar"];
        a["foo"] = undefined;
        a["bar"] = undefined;
        function_b41d4c50a5cb0a36("Arrays_String");
    }
    function_b41d4c50a5cb0a36("Arrays");
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1166
// Size: 0x29a
function bench_fields() {
    /#
        println("<unknown string>");
    #/
    max_iterations = getdvarint(@"hash_939ffa702b7da068", 10000);
    s = spawnstruct();
    level.s = spawnstruct();
    function_63abc2408f9ef4ba("Fields");
    for (i = 0; i < max_iterations; i++) {
        function_63abc2408f9ef4ba("Fields_Local");
        s.foo = 0;
        s.bar = 1;
        s.sum = s.foo + s.bar;
        s.foo = "hi";
        s.msg = s.foo + s.bar;
        s.foo = undefined;
        s.bar = undefined;
        function_b41d4c50a5cb0a36("Fields_Local");
        function_63abc2408f9ef4ba("Fields_Level");
        level.foo = 0;
        level.bar = 1;
        level.sum = level.foo + level.bar;
        level.foo = "hi";
        level.msg = level.foo + level.bar;
        level.foo = undefined;
        level.bar = undefined;
        function_b41d4c50a5cb0a36("Fields_Level");
        function_63abc2408f9ef4ba("Fields_Level_Nested");
        level.s.foo = 0;
        level.s.bar = 1;
        level.s.sum = level.s.foo + level.s.bar;
        level.s.foo = "hi";
        level.s.msg = level.s.foo + level.s.bar;
        level.s.foo = undefined;
        level.s.bar = undefined;
        function_b41d4c50a5cb0a36("Fields_Level_Nested");
    }
    function_b41d4c50a5cb0a36("Fields");
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1407
// Size: 0x1aa
function function_713ed9ae70c22b36() {
    /#
        println("<unknown string>");
    #/
    max_iterations = getdvarint(@"hash_939ffa702b7da068", 10000);
    s = spawnstruct();
    function_63abc2408f9ef4ba("Ops");
    x = 0;
    s.x = 0;
    for (i = 0; i < max_iterations; i++) {
        function_63abc2408f9ef4ba("Ops_Local");
        x = x + i;
        x = x + 2;
        function_b41d4c50a5cb0a36("Ops_Local");
        function_63abc2408f9ef4ba("Ops_Object");
        s.x = s.x + i;
        s.x = s.x + 2;
        function_b41d4c50a5cb0a36("Ops_Object");
    }
    function_b41d4c50a5cb0a36("Ops");
    function_63abc2408f9ef4ba("OpsCast");
    x = "a";
    s.x = "a";
    for (i = 0; i < max_iterations; i++) {
        function_63abc2408f9ef4ba("OpsCast_Local");
        y = x + i;
        y = x + 2;
        function_b41d4c50a5cb0a36("OpsCast_Local");
        function_63abc2408f9ef4ba("OpsCast_Object");
        s.y = s.x + i;
        s.y = s.x + 2;
        function_b41d4c50a5cb0a36("OpsCast_Object");
    }
    function_b41d4c50a5cb0a36("OpsCast");
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15b8
// Size: 0x3
function function_9cd6cc4b2f8e5e8f() {
    
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15c2
// Size: 0x71
function function_c0c13c7d2f02753b() {
    /#
        println("<unknown string>");
    #/
    max_iterations = getdvarint(@"hash_939ffa702b7da068", 10000);
    f = &function_9cd6cc4b2f8e5e8f;
    function_63abc2408f9ef4ba("FunctionPointer");
    for (i = 0; i < max_iterations; i++) {
        [[ f ]]();
    }
    function_b41d4c50a5cb0a36("FunctionPointer");
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x163a
// Size: 0x82
function function_56f6defb83c08190() {
    /#
        println("<unknown string>");
    #/
    max_iterations = getdvarint(@"hash_939ffa702b7da068", 10000);
    f = &function_9cd6cc4b2f8e5e8f;
    s = spawnstruct();
    function_63abc2408f9ef4ba("MethodPointer");
    for (i = 0; i < max_iterations; i++) {
        s [[ f ]]();
    }
    function_b41d4c50a5cb0a36("MethodPointer");
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x16c3
// Size: 0xac
function function_e9372cb2b92b01e7(waittime, var_8942d67f3b4bb0f) {
    level endon("bench_thread_end");
    while (true) {
        wait(waittime);
        function_63abc2408f9ef4ba("Thread_Function");
        f0 = 0;
        f1 = 1;
        even = 0;
        for (i = 0; i < var_8942d67f3b4bb0f; i++) {
            f = f0 + f1;
            f0 = f1;
            f1 = f;
            if (f % 2 == 0) {
                val = 1;
                continue;
            }
            val = 0;
        }
        function_b41d4c50a5cb0a36("Thread_Function");
    }
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1776
// Size: 0xaa
function bench_threads() {
    /#
        println("<unknown string>");
    #/
    max_threads = 100;
    function_63abc2408f9ef4ba("Threads");
    waittime = 0.01;
    for (i = 0; i < max_threads; i++) {
        level thread function_e9372cb2b92b01e7(waittime, i);
        waittime = waittime + 0.01;
        if (waittime > 0.5) {
            waittime = 0.01;
        }
    }
    function_b41d4c50a5cb0a36("Threads");
    /#
        println("<unknown string>");
    #/
    wait(1);
    /#
        println("<unknown string>");
    #/
    level notify("bench_thread_end");
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1827
// Size: 0x79
function function_1cb0315d0cdacba4() {
    /#
        println("<unknown string>");
    #/
    max_iterations = getdvarint(@"hash_939ffa702b7da068", 10000);
    function_63abc2408f9ef4ba("GetDvars");
    for (i = 0; i < max_iterations; i++) {
        test = getdvarint(@"hash_939ffa702b7da068", 10000);
    }
    function_b41d4c50a5cb0a36("GetDvars");
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18a7
// Size: 0x6d
function function_d5bce87878a08018() {
    /#
        println("<unknown string>");
    #/
    max_iterations = getdvarint(@"hash_939ffa702b7da068", 10000);
    function_63abc2408f9ef4ba("SetDvars");
    for (i = 0; i < max_iterations; i++) {
        setdvar(@"hash_e717cc3034fbdf76", i);
    }
    function_b41d4c50a5cb0a36("SetDvars");
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x191b
// Size: 0x31
function function_8193a06614f54e87() {
    /#
        println("<unknown string>");
    #/
    i = 0;
    level.var_2b911118b9f2e6c0 = [];
    level.var_5abcc6f847b4e3ee = [];
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1953
// Size: 0x102
function function_4912bd03f307546c() {
    /#
        println("<unknown string>");
    #/
    i = 0;
    s = "
";
    foreach (k, v in level.var_5abcc6f847b4e3ee) {
        s = s + k;
        s = s + ",";
    }
    /#
        println(s);
    #/
    s = "";
    foreach (v in level.var_5abcc6f847b4e3ee) {
        s = s + v / 1000;
        s = s + ",";
    }
    s = s + "
";
    /#
        println(s);
    #/
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a5c
// Size: 0x2ba
function benchmark() {
    test_vars = [];
    if (getdvarint(@"hash_44e9f4a106f9b4a1", 0) > 0) {
        num_vars = getdvarint(@"hash_44e9f4a106f9b4a1", 0);
        for (i = 0; i < num_vars; i++) {
            test_vars[i] = i;
        }
    }
    function_8193a06614f54e87();
    if (shouldbench("0")) {
        function_988c6c7c7776406c();
        wait(0.05);
    }
    if (shouldbench("I")) {
        function_723ebfcdaa798c34();
        wait(0.05);
    }
    if (shouldbench("1")) {
        function_e4e266c2c4ebf49e();
        wait(0.05);
    }
    if (shouldbench("J")) {
        function_18cb5fb798c607cd();
        wait(0.05);
    }
    if (shouldbench("2")) {
        bench_foreach();
        wait(0.05);
    }
    if (shouldbench("3")) {
        function_10f6d810677cee84();
        wait(0.05);
    }
    if (shouldbench("K")) {
        function_9628bf5282b8bafc();
        wait(0.05);
    }
    if (shouldbench("4")) {
        function_dff6885d265db0fd();
        wait(0.05);
    }
    if (shouldbench("5")) {
        function_2308f139d0ffbc41();
        wait(0.05);
    }
    if (shouldbench("6")) {
        function_76d6d0feedd3126b();
        wait(0.05);
    }
    if (shouldbench("7")) {
        function_589fd6b13ca60155();
        wait(0.05);
    }
    if (shouldbench("8")) {
        function_cae58617e7945254();
        wait(0.05);
    }
    if (shouldbench("9")) {
        bench_variables();
        wait(0.05);
    }
    if (shouldbench("A")) {
        function_add278ceb4188914();
        wait(0.05);
    }
    if (shouldbench("B")) {
        bench_fields();
        wait(0.05);
    }
    if (shouldbench("C")) {
        function_713ed9ae70c22b36();
        wait(0.05);
    }
    if (shouldbench("D")) {
        function_c0c13c7d2f02753b();
        wait(0.05);
    }
    if (shouldbench("E")) {
        function_56f6defb83c08190();
        wait(0.05);
    }
    if (shouldbench("F")) {
        bench_threads();
        wait(0.05);
    }
    if (shouldbench("G")) {
        function_1cb0315d0cdacba4();
        wait(0.05);
    }
    if (shouldbench("H")) {
        function_d5bce87878a08018();
        wait(0.05);
    }
    if (shouldbench("L")) {
        bench_strings();
        wait(0.05);
    }
    function_4912bd03f307546c();
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d1d
// Size: 0x32
function shouldbench(a) {
    if (issubstr(getdvar(@"hash_86ef66e581c77f50", ""), a + ",")) {
        return true;
    }
    return false;
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d57
// Size: 0x8b
function main() {
    level thread function_41e013dcb5b7b2a();
    setdvarifuninitialized(@"hash_939ffa702b7da068", 10000);
    setdvarifuninitialized(@"hash_5217b32eb9c32512", 0);
    setdvarifuninitialized(@"hash_44e9f4a106f9b4a1", 0);
    setdvarifuninitialized(@"hash_86ef66e581c77f50", "0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,I,J,K,L,");
    while (true) {
        while (getdvarint(@"hash_5217b32eb9c32512", 0) == 0) {
            wait(1);
        }
        benchmark();
        setdvar(@"hash_5217b32eb9c32512", 0);
    }
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1de9
// Size: 0x3d
function leak() {
    a = spawnstruct();
    b = spawnstruct();
    a.next = b;
    b.next = a;
}

// Namespace benchmark / namespace_299f9e9612d25bc1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e2d
// Size: 0x4c
function function_41e013dcb5b7b2a() {
    setdvarifuninitialized(@"hash_8c14a9cfaca224d4", 0);
    while (true) {
        while (getdvarint(@"hash_8c14a9cfaca224d4", 0) == 0) {
            wait(1);
        }
        leak();
        setdvar(@"hash_8c14a9cfaca224d4", 0);
    }
}

