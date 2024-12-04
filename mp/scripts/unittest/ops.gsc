#using scripts\unittest\util;

#namespace unittest_ops;

// Namespace unittest_ops / scripts\unittest\ops
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x286
// Size: 0x3a
function plus(x, y) {
    z = x + y;
    test_print(x + " + " + y + " = " + z);
}

// Namespace unittest_ops / scripts\unittest\ops
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2c8
// Size: 0x3a
function minus(x, y) {
    z = x - y;
    test_print(x + " - " + y + " = " + z);
}

// Namespace unittest_ops / scripts\unittest\ops
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x30a
// Size: 0x3a
function mul(x, y) {
    z = x * y;
    test_print(x + " * " + y + " = " + z);
}

// Namespace unittest_ops / scripts\unittest\ops
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x34c
// Size: 0x3a
function div(x, y) {
    z = x / y;
    test_print(x + " / " + y + " = " + z);
}

// Namespace unittest_ops / scripts\unittest\ops
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x38e
// Size: 0x3a
function mod(x, y) {
    z = x % y;
    test_print(x + " % " + y + " = " + z);
}

// Namespace unittest_ops / scripts\unittest\ops
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3d0
// Size: 0x5a
function eq(x, y, xstr, ystr) {
    z = x == y;
    if (!isdefined(xstr)) {
        xstr = x;
    }
    if (!isdefined(ystr)) {
        ystr = y;
    }
    test_print(xstr + " == " + ystr + ": " + z);
}

// Namespace unittest_ops / scripts\unittest\ops
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x432
// Size: 0x5a
function ne(x, y, xstr, ystr) {
    z = x != y;
    if (!isdefined(xstr)) {
        xstr = x;
    }
    if (!isdefined(ystr)) {
        ystr = y;
    }
    test_print(xstr + " != " + ystr + ": " + z);
}

// Namespace unittest_ops / scripts\unittest\ops
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x494
// Size: 0x3a
function lt(x, y) {
    z = x < y;
    test_print(x + " < " + y + ": " + z);
}

// Namespace unittest_ops / scripts\unittest\ops
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4d6
// Size: 0x3a
function le(x, y) {
    z = x <= y;
    test_print(x + " <= " + y + ": " + z);
}

// Namespace unittest_ops / scripts\unittest\ops
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x518
// Size: 0x3a
function gt(x, y) {
    z = x > y;
    test_print(x + " > " + y + ": " + z);
}

// Namespace unittest_ops / scripts\unittest\ops
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x55a
// Size: 0x3a
function ge(x, y) {
    z = x >= y;
    test_print(x + " >= " + y + ": " + z);
}

// Namespace unittest_ops / scripts\unittest\ops
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x59c
// Size: 0x3a
function sl(x, y) {
    z = x << y;
    test_print(x + " << " + y + " = " + z);
}

// Namespace unittest_ops / scripts\unittest\ops
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5de
// Size: 0x3a
function sr(x, y) {
    z = x >> y;
    test_print(x + " >> " + y + " = " + z);
}

// Namespace unittest_ops / scripts\unittest\ops
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x620
// Size: 0x23
function limit(i, str) {
    test_print(i + " == " + str);
}

// Namespace unittest_ops / scripts\unittest\ops
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x64b
// Size: 0x77b
function binary() {
    plus(0, 1);
    plus(0, -1);
    plus("hi", "bye");
    plus("hi", 0);
    plus(0, 1);
    plus(0, -1);
    plus((0, 1, 2), (3, 4, 5));
    minus(1, 0);
    minus(0, 1);
    minus(1, 0);
    minus(0, 1);
    minus((3, 4, 5), (0, 1, 2));
    mul(1, 1);
    mul(1, 0);
    mul(0, 1);
    mul(2, 3);
    mul(2, -1);
    mul(1, 1);
    mul(1, 2);
    mul(2, -3);
    mul((1, 2, 3), (3, 4, 5));
    div(0, 1);
    div(2, 1);
    div(9, 3);
    div(9, 2);
    div(4, -2);
    div(4, 1);
    div(5, -1);
    div((12, 9, 8), (4, 3, 2));
    mod(0, 1);
    mod(2, 1);
    mod(5, 2);
    mod(5.1, 3);
    mod(4, 2);
    mod(-4, 2);
    eq(0, 0);
    eq(1, -1);
    eq(3, 4);
    eq(3, 3);
    eq(-1, -1);
    eq("hi", "hi1");
    eq("hi", "hi");
    eq((1, 2, 3), (1, 2, 4));
    eq((1, 2, 3), (1, 2, 3));
    eq(&plus, &plus, "plus", "plus");
    eq(&plus, &minus, "plus", "minus");
    eq(&allowfire, &allowfire, "AllowFire", "AllowFire");
    eq(&allowfire, &allowjump, "AllowFire", "AllowJump");
    ne(0, 0);
    ne(1, -1);
    ne(3, 4);
    ne(3, 3);
    ne(-1, -1);
    ne("hi", "hi1");
    ne("hi", "hi");
    ne((1, 2, 3), (1, 2, 4));
    ne((1, 2, 3), (1, 2, 3));
    ne(&plus, &plus, "plus", "plus");
    ne(&plus, &minus, "plus", "minus");
    ne(&allowfire, &allowfire, "AllowFire", "AllowFire");
    ne(&allowfire, &allowjump, "AllowFire", "AllowJump");
    lt(0, 0);
    lt(0, -1);
    lt(1, 2);
    lt(2, 1);
    lt(1, 2);
    lt(1, 2);
    lt(3, 4);
    lt(-3, 4);
    le(0, 0);
    le(0, -1);
    le(1, 2);
    le(2, 1);
    le(1, 2);
    le(1, 2);
    le(3, 4);
    le(-3, 4);
    gt(0, 0);
    gt(0, -1);
    gt(1, 2);
    gt(2, 1);
    gt(1, 2);
    gt(1, 2);
    gt(3, 4);
    gt(-3, 4);
    ge(0, 0);
    ge(0, -1);
    ge(1, 2);
    ge(2, 1);
    ge(1, 2);
    ge(1, 2);
    ge(3, 4);
    ge(-3, 4);
    sl(0, 0);
    sl(1, 0);
    sl(1, 2);
    sl(2, 2);
    sr(0, 0);
    sr(1, 0);
    sr(1, 2);
    sr(2, 1);
    sr(4, 1);
    limit(0, "0");
    limit(1, "1");
    limit(255, "255");
    limit(-254, "-254");
    limit(-255, "-255");
    limit(65535, "65535");
    limit(-65535, "-65535");
    limit(-65536, "-65536");
    limit(-2147483647, "-2147483647");
    limit(-2147483648, "-2147483648");
    limit(-2147483649, "-2147483649");
    limit(2147483647, "2147483647");
    limit(2147483648, "2147483648");
    limit(-4294967295, "-4294967295");
    limit(-4294967296, "-4294967296");
    limit(-4294967297, "-4294967297");
    limit(4294967295, "4294967295");
    limit(4294967296, "4294967296");
    limit(-9223372036854775807, "-9223372036854775807");
    limit(-9223372036854775807, "-9223372036854775807");
    limit(9223372036854775806, "9223372036854775806");
    limit(9223372036854775807, "9223372036854775807");
}

// Namespace unittest_ops / scripts\unittest\ops
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdce
// Size: 0xb6
function types() {
    x = 1;
    y = 2;
    z0 = x + y + x;
    test_print("z0: " + z0);
    z1 = z0 + x + y;
    test_print("z1: " + z1);
    z2 = z1 + 1;
    test_print("z2: " + z2);
    z3 = z2 + "ok";
    test_print("z3: " + z3);
    z4 = z3 + "bye";
    test_print("z4: " + z4);
}

// Namespace unittest_ops / scripts\unittest\ops
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe8c
// Size: 0x28
function main() {
    test_begin("ops");
    binary();
    types();
    test_end("ops");
}

