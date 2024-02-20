// mwiii decomp prototype
#using scripts\unittest\util.gsc;

#namespace namespace_898dcfe71d46487e;

// Namespace namespace_898dcfe71d46487e/namespace_5e1f129e724f851
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x160
// Size: 0xa6
function for_simple() {
    test_print("for simple");
    for (i = 0; i < 10; i++) {
        test_print("for: " + i);
    }
    x = 0;
    test_print("for 2 cond");
    for (i = 0; i < 10 && x < 20; i++) {
        x = x + i;
        test_print("for: " + i);
    }
    test_print("for empty");
    for (i = 0; ; i++) {
        test_print("for: " + i);
        if (i >= 9) {
            break;
        }
    }
}

// Namespace namespace_898dcfe71d46487e/namespace_5e1f129e724f851
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x20d
// Size: 0xbe
function foreach_shared_variables(x) {
    test_print("foreach_shared_variables");
    if (isdefined(x)) {
        foreach (a in x) {
            test_print(" " + a);
        }
    } else {
        return;
    }
    foreach (a in x) {
        test_print(" " + a);
    }
}

// Namespace namespace_898dcfe71d46487e/namespace_5e1f129e724f851
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d2
// Size: 0x94
function foreach_mutable_key() {
    test_print("foreach_mutable_key");
    a = [0:1, 1:2, 2:3, 3:4];
    foreach (x, y in a) {
        test_print(" " + x + "," + y);
        x = x + 1;
    }
}

// Namespace namespace_898dcfe71d46487e/namespace_5e1f129e724f851
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36d
// Size: 0xf3
function foreach_simple() {
    test_print("foreach_simple");
    a = [0:1, 1:2, 2:3, 3:4];
    foreach (x in a) {
        test_print(" " + x);
    }
    test_print("foreach_simple(x,y)");
    foreach (x, y in a) {
        test_print(" " + x + "," + y);
    }
    foreach_shared_variables(a);
    foreach_mutable_key();
}

// Namespace namespace_898dcfe71d46487e/namespace_5e1f129e724f851
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x467
// Size: 0xab
function while_simple() {
    test_print("while simple");
    for (i = 0; i < 10; i++) {
        test_print("while: " + i);
    }
    test_print("while 2 cond");
    x = 0;
    for (i = 0; i < 10 && x < 20; i++) {
        x = x + i;
        test_print("while: " + i);
    }
    test_print("while true");
    for (i = 0; 1; i++) {
        test_print("while: " + i);
        if (i >= 9) {
            break;
        }
    }
}

// Namespace namespace_898dcfe71d46487e/namespace_5e1f129e724f851
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x519
// Size: 0x97
function loop_control() {
    test_print("for control");
    for (i = 0; i < 1; i++) {
        if (i % 1) {
            var_be66de030b25508c = 1;
        } else {
            var_be66de030b25508c = 0;
        }
        test_print("for var exposed: sum: " + var_be66de030b25508c);
    }
    for (;;) {
        q = 1;
        break;
    }
    test_print("for break: q: " + q);
    while (1) {
        z = 2;
        break;
    }
    test_print("while break: z: " + z);
}

// Namespace namespace_898dcfe71d46487e/namespace_5e1f129e724f851
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b7
// Size: 0x37
function main() {
    test_begin("Loops");
    for_simple();
    foreach_simple();
    while_simple();
    loop_control();
    test_end("Loops");
}

