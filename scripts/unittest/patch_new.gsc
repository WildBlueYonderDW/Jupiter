// mwiii decomp prototype
#using scripts\unittest\util.gsc;

#namespace patch_new;

// Namespace patch_new / scripts/unittest/patch_new
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9b
// Size: 0xf
function patch_new() {
    test_print("patch_new");
}

// Namespace patch_new / scripts/unittest/patch_new
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb1
// Size: 0x16
function patch_new2() {
    test_print("patch_new2");
    patch_new3();
}

// Namespace patch_new / scripts/unittest/patch_new
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xce
// Size: 0xf
function patch_new3() {
    test_print("patch_new3");
}

// Namespace patch_new / scripts/unittest/patch_new
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe4
// Size: 0xf
function patch_new4() {
    test_print("patch_new4");
}

