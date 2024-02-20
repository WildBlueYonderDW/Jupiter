// mwiii decomp prototype
#using scripts\unittest\util.gsc;

#namespace namespace_6d6ccf11835bebe0;

// Namespace namespace_6d6ccf11835bebe0/namespace_2daabfd41316c417
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6e3
// Size: 0x4d3
function vars() {
    x = 0;
    y = 1;
    a = x < y;
    test_print("x < y: " + a);
    a = !(x < y);
    test_print("!(x < y): " + a);
    a = !x;
    test_print("!x: " + a);
    a = !x + y;
    test_print("!x + y: " + a);
    a = !(!x + y);
    test_print("!(!x + y): " + a);
    a = x != y && y != x;
    test_print("(x != y) && (y != x): " + a);
    a = !(x != y) && !(y != x);
    test_print("!(x != y) && !(y != x): " + a);
    a = !(!(x != y) && !(y != x));
    test_print("!(!(x != y) && !(y != x)): " + a);
    a = x != y || y != x;
    test_print("(x != y) || (y != x): " + a);
    a = !(x != y) || !(y != x);
    test_print("!(x != y) || !(y != x): " + a);
    a = !(!(x != y) || !(y != x));
    test_print("!(!(x != y) || !(y != x)): " + a);
    a = 1 && x;
    test_print("ONE && x: " + a);
    a = x && 1;
    test_print("x && ONE: " + a);
    a = 1 || x;
    test_print("ONE || x: " + a);
    a = x || 1;
    test_print("x || ONE: " + a);
    a = 2 && x;
    test_print("TWOF && x: " + a);
    a = x && 2;
    test_print("x && TWOF: " + a);
    a = 2 || x;
    test_print("TWOF || x: " + a);
    a = x || 2;
    test_print("x || TWOF: " + a);
    a = x && 0;
    test_print("x && F: " + a);
    a = 0 && x;
    test_print("F && x: " + a);
    a = x || 0;
    test_print("x || F: " + a);
    a = 0 || x;
    test_print("F || x: " + a);
    a = 0 && x;
    test_print("!ONE && x: " + a);
    a = x && 0;
    test_print("x && !ONE: " + a);
    a = 0 || x;
    test_print("!ONE || x: " + a);
    a = x || 0;
    test_print("x || !ONE: " + a);
    a = !2 && x;
    test_print("!TWOF && x: " + a);
    a = x && !2;
    test_print("x && !TWOF: " + a);
    a = !2 || x;
    test_print("!TWOF || x: " + a);
    a = x || !2;
    test_print("x || !TWOF: " + a);
    a = x && 1;
    test_print("x && !F: " + a);
    a = 1 && x;
    test_print("!F && x: " + a);
    a = x || 1;
    test_print("x || !F: " + a);
    a = 1 || x;
    test_print("!F || x: " + a);
    a = x && y;
    test_print("x && y: " + a);
    a = !x && y;
    test_print("!x && y: " + a);
    a = x && !y;
    test_print("x && !y: " + a);
    a = !x && !y;
    test_print("!x && !y: " + a);
    a = x || y;
    test_print("x || y: " + a);
    a = !x || y;
    test_print("!x || y: " + a);
    a = x || !y;
    test_print("x || !y: " + a);
    a = !x || !y;
    test_print("!x || !y: " + a);
    a = !(x && y);
    test_print("!(x && y): " + a);
    a = !(!x && y);
    test_print("!(!x && y): " + a);
    a = !(x && !y);
    test_print("!(x && !y): " + a);
    a = !(!x && !y);
    test_print("!(!x && !y): " + a);
    a = !(x || y);
    test_print("!(x || y): " + a);
    a = !(!x || y);
    test_print("!(!x || y): " + a);
    a = !(x || !y);
    test_print("!(x || !y): " + a);
    a = !(!x || !y);
    test_print("!(!x || !y): " + a);
}

// Namespace namespace_6d6ccf11835bebe0/namespace_2daabfd41316c417
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbbd
// Size: 0x512
function iftest() {
    x = 0;
    y = 1;
    if (x) {
        test_print("x: true");
    } else {
        test_print("x: false");
    }
    if (y) {
        test_print("y: true");
    } else {
        test_print("y: false");
    }
    if (!x) {
        test_print("!x: true");
    } else {
        test_print("!x: false");
    }
    if (!y) {
        test_print("!y: true");
    } else {
        test_print("!y: false");
    }
    if (!x + y) {
        test_print("!x + y: true");
    } else {
        test_print("!x + y: false");
    }
    if (!(!x + y)) {
        test_print("!(!x + y): true");
    } else {
        test_print("!(!x + y): false");
    }
    if (!(!(x < 0) + y)) {
        test_print("!(!(x < 0) + y): true");
    } else {
        test_print("!(!(x < 0) + y): false");
    }
    if (!(!(x < 0) != y)) {
        test_print("!(!(x < 0) != y): true");
    } else {
        test_print("!(!(x < 0) != y): false");
    }
    if (1) {
        test_print("ONE: true");
    } else {
        test_print("ONE: false");
    }
    if (0) {
        test_print("!ONE: true");
    } else {
        test_print("!ONE: false");
    }
    if (0) {
        test_print("F: true");
    } else {
        test_print("F: false");
    }
    if (1) {
        test_print("!F: true");
    } else {
        test_print("!F: false");
    }
    if (x && 1) {
        test_print("x && ONE: true");
    } else {
        test_print("x && ONE: false");
    }
    if (!x && 1) {
        test_print("!x && ONE: true");
    } else {
        test_print("!x && ONE: false");
    }
    if (x && 0) {
        test_print("x && !ONE: true");
    } else {
        test_print("x && !ONE: false");
    }
    if (!x && 0) {
        test_print("!x && !ONE: true");
    } else {
        test_print("!x && !ONE: false");
    }
    if (x || 1) {
        test_print("x || ONE: true");
    } else {
        test_print("x || ONE: false");
    }
    if (!x || 1) {
        test_print("!x || ONE: true");
    } else {
        test_print("!x || ONE: false");
    }
    if (x || 0) {
        test_print("x || !ONE: true");
    } else {
        test_print("x || !ONE: false");
    }
    if (!x || 0) {
        test_print("!x || !ONE: true");
    } else {
        test_print("!x || !ONE: false");
    }
    if (x && y) {
        test_print("x && y: true");
    } else {
        test_print("x && y: false");
    }
    if (!x && y) {
        test_print("!x && y: true");
    } else {
        test_print("x && y: false");
    }
    if (x && !y) {
        test_print("x && !y: true");
    } else {
        test_print("x && !y: false");
    }
    if (!x && !y) {
        test_print("!x && !y: true");
    } else {
        test_print("!x & !y: false");
    }
    if (x || y) {
        test_print("x || y: true");
    } else {
        test_print("x || y: false");
    }
    if (!x || y) {
        test_print("!x || y: true");
    } else {
        test_print("x || y: false");
    }
    if (x || !y) {
        test_print("x || !y: true");
    } else {
        test_print("x || !y: false");
    }
    if (!x || !y) {
        test_print("!x || !y: true");
    } else {
        test_print("!x & !y: false");
    }
    if (!(x && y)) {
        test_print("!(x && y): true");
    } else {
        test_print("!(x && y): false");
    }
    if (!(!x && y)) {
        test_print("!(!x && y): true");
    } else {
        test_print("!(x && y): false");
    }
    if (!(x && !y)) {
        test_print("!(x && !y): true");
    } else {
        test_print("!(x && !y): false");
    }
    if (!(!x && !y)) {
        test_print("!(!x && !y): true");
    } else {
        test_print("!(!x && !y): false");
    }
    if (!(x || y)) {
        test_print("!(x || y): true");
    } else {
        test_print("!(x || y): false");
    }
    if (!(!x || y)) {
        test_print("!(!x || y): true");
    } else {
        test_print("!(x || y): false");
    }
    if (!(x || !y)) {
        test_print("!(x || !y): true");
    } else {
        test_print("!(x || !y): false");
    }
    if (!(!x || !y)) {
        test_print("!(!x || !y): true");
    } else {
        test_print("!(!x || !y): false");
    }
}

// Namespace namespace_6d6ccf11835bebe0/namespace_2daabfd41316c417
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10d6
// Size: 0x29
function main() {
    test_begin("Cond");
    vars();
    iftest();
    test_end("Cond");
}

