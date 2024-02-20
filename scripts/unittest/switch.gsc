// mwiii decomp prototype
#using scripts\unittest\util.gsc;

#namespace namespace_89c902463f02748c;

// Namespace namespace_89c902463f02748c/namespace_9bf67152cdd35093
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ee
// Size: 0x6f9
function switch_case() {
    var_ce5805b01262ae30 = [0:2, 1:1, 2:4, 3:3, 4:0];
    foreach (c in var_ce5805b01262ae30) {
        switch (c) {
        case 0:
            test_print("number 0");
            break;
        case 1:
            test_print("number 1");
            break;
        case 2:
            test_print("number 2");
            break;
        case 3:
            test_print("number 3");
            break;
        }
    }
    var_60baac5a33171d69 = [0:"b", 1:"a", 2:"foo", 3:"d", 4:"c"];
    foreach (c in var_60baac5a33171d69) {
        switch (c) {
        case #"hash_31103fbc01bd840c":
            test_print("string a");
            break;
        case #"hash_311042bc01bd88c5":
            test_print("string b");
            break;
        case #"hash_311041bc01bd8732":
            test_print("string c");
            break;
        case #"hash_31103cbc01bd7f53":
            test_print("string d");
            break;
        case #"hash_7038dec66d8275be":
            test_print("string default: " + c);
            break;
        }
    }
    var_d00b61b1f0e46841 = [0:"a", 1:2, 2:0, 3:"foo", 4:"b", 5:1];
    foreach (c in var_d00b61b1f0e46841) {
        switch (c) {
        case #"hash_31103fbc01bd840c":
            test_print("mixed a");
            break;
        case 0:
            test_print("mixed 0");
            break;
        case #"hash_311042bc01bd88c5":
            test_print("mixed b");
            break;
        case #"hash_31100fbc01bd387c":
            test_print("mixed 1");
            break;
        default:
            test_print("mixed default: " + c);
            break;
        }
    }
    var_4532b9e018851ec3 = [0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8];
    foreach (c in var_4532b9e018851ec3) {
        switch (c) {
        case 0:
        case 1:
            test_print("skip 0: " + c);
            break;
        case 2:
        case 3:
            if (c % 1) {
                x = 1;
            } else {
                x = 0;
            }
            test_print("skip 1: " + c + " x: " + x);
        case 4:
            test_print("skip 1.1: " + c);
            break;
        case 5:
        case 6:
        default:
            test_print("skip 2: " + c);
            break;
        }
    }
    var_5fd7177feb6ad53 = [0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7];
    foreach (c in var_5fd7177feb6ad53) {
        switch (c) {
        case 0:
        case 1:
        case 2:
        case 3:
            test_print("combine 1: " + c);
            break;
        case 4:
        case 5:
        default:
            test_print("combine 2: " + c);
            break;
        }
    }
    var_5fd7177feb6ad53 = [0:"foo_a", 1:"foo_b", 2:"foo_c", 3:"foo_d"];
    foreach (c in var_5fd7177feb6ad53) {
        switch (c) {
        case #"hash_bec7864bdc9acd1b":
        case #"hash_bec7874bdc9aceae":
        case #"hash_bec7884bdc9ad041":
            test_print("combine str: " + c);
            break;
        }
    }
    var_1cebe1079ed86b6 = [0:0, 1:1, 2:2, 3:3];
    foreach (c in var_1cebe1079ed86b6) {
        switch (c) {
        default:
            test_print("single: " + c);
            break;
        }
    }
    var_1cebe1079ed86b6 = [0:"foo_a", 1:"foo_b", 2:"foo_c", 3:"foo_d"];
    foreach (c in var_1cebe1079ed86b6) {
        switch (c) {
        case #"hash_bec7874bdc9aceae":
            test_print("single_str: " + c);
            break;
        }
    }
}

// Namespace namespace_89c902463f02748c/namespace_9bf67152cdd35093
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8ee
// Size: 0x18f
function switch_nest() {
    test_print("switch_nest");
    var_ce5805b01262ae30 = [0:0, 1:0, 2:0, 3:1, 4:0, 5:2, 6:1, 7:0, 8:1, 9:1, 10:1, 11:2];
    i = 0;
    while (i < var_ce5805b01262ae30.size) {
        c0 = var_ce5805b01262ae30[i];
        c1 = var_ce5805b01262ae30[i + 1];
        switch (c0) {
        case 0:
            switch (c1) {
            case 0:
                test_print("nest 0 0");
                break;
            case 1:
                test_print("nest 0 1");
                break;
            case 2:
                test_print("nest 0 2");
                break;
            }
            break;
        case 1:
            switch (c1) {
            case 0:
                test_print("nest 1 0");
                break;
            case 1:
                test_print("nest 1 1");
                break;
            case 2:
                test_print("nest 1 2");
                break;
            }
            break;
        default:
            test_print("nest bad");
            break;
        }
        i = i + 2;
    }
}

// Namespace namespace_89c902463f02748c/namespace_9bf67152cdd35093
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa84
// Size: 0x71
function switch_loop() {
    for (i = 0; i < 10; i++) {
        switch (i) {
        case 0:
            for (j = 0; j < 5; j++) {
                if (j > 2) {
                    break;
                }
            }
            test_print("switch_loop: " + j);
            continue;
        default:
            continue;
        }
    }
}

// Namespace namespace_89c902463f02748c/namespace_9bf67152cdd35093
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xafc
// Size: 0x30
function main() {
    test_begin("Switch");
    switch_case();
    switch_nest();
    switch_loop();
    test_end("Switch");
}

