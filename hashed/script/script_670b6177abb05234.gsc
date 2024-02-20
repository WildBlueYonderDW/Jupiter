// mwiii decomp prototype
#using script_7b2517368c79e5bc;
#using scripts\mp\supers.gsc;
#using script_4c770a9a4ad7659c;
#using script_3e2f8cc477d57433;
#using scripts\mp\perks\perkpackage.gsc;

#namespace namespace_fe6cb1145ab372e6;

// Namespace namespace_fe6cb1145ab372e6/namespace_82ee1eb29fe2bc66
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd3
// Size: 0x67
function function_618664c61d5fc27b() {
    function_900f562c61c6a5d6("super", &function_60d5792bbc2fd0b4, &function_e887a53cc71c3aa8, undefined, &function_cff48a3ed0e1c4b9, &function_e03ac9e2c2b89d1f);
    function_900f562c61c6a5d6("zmsuper", &function_60d5792bbc2fd0b4, &function_e887a53cc71c3aa8, undefined, &function_cff48a3ed0e1c4b9, &function_e03ac9e2c2b89d1f);
    callback::add("player_spawned", &on_player_spawned);
    callback::add("on_super_use_finished", &on_super_use_finished);
}

// Namespace namespace_fe6cb1145ab372e6/namespace_82ee1eb29fe2bc66
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x141
// Size: 0x25
function function_9f7dc3012db92250() {
    return istrue(level.var_921200c3b5274d3e) || istrue(level.var_62f6f7640e4431e3.var_fa35afda033c6691);
}

// Namespace namespace_fe6cb1145ab372e6/namespace_82ee1eb29fe2bc66
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16e
// Size: 0x31
function on_player_spawned(var_d27680ff86693f5c) {
    if (!function_9f7dc3012db92250() && isdefined(self.super)) {
        givesuperpoints(getsuperpointsneeded());
    }
}

// Namespace namespace_fe6cb1145ab372e6/namespace_82ee1eb29fe2bc66
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a6
// Size: 0x44
function function_60d5792bbc2fd0b4(itembundle, item) {
    if (!function_9f7dc3012db92250()) {
        namespace_727d2aa1d6c72038::perkpackage_giveimmediate(itembundle.ref);
        return (item.count - 1);
    } else {
        return 1;
    }
}

// Namespace namespace_fe6cb1145ab372e6/namespace_82ee1eb29fe2bc66
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f1
// Size: 0x3f
function function_e887a53cc71c3aa8(itembundle, item, var_b2635db617b09abd, var_8bd8fa2792aa0511) {
    if (issuperready() || issuperinuse()) {
        return 0;
    } else {
        return 1;
    }
}

// Namespace namespace_fe6cb1145ab372e6/namespace_82ee1eb29fe2bc66
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x237
// Size: 0xb6
function function_cff48a3ed0e1c4b9() {
    itembundle = undefined;
    quantity = 0;
    if (isdefined(self.super)) {
        if (issuperinuse()) {
            namespace_85d036cb78063c4a::superusefinished(undefined, undefined, undefined, 1);
        } else if (issuperready()) {
            var_ebec497ff8b18a45 = self.super.staticdata.ref;
            if (!isdefined(var_ebec497ff8b18a45)) {
                return [0:itembundle, 1:quantity];
            }
            var_2e7e6cde22741ab3 = function_61d960957fcf3ca0(var_ebec497ff8b18a45);
            if (isdefined(var_2e7e6cde22741ab3)) {
                itembundle = getscriptbundle("itemspawnentry:" + var_2e7e6cde22741ab3);
                quantity = 1;
            }
        }
    }
    return [0:itembundle, 1:quantity];
}

// Namespace namespace_fe6cb1145ab372e6/namespace_82ee1eb29fe2bc66
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f5
// Size: 0x1a
function function_e03ac9e2c2b89d1f() {
    setsuperbasepoints(0, 0);
    namespace_727d2aa1d6c72038::perkpackage_giveoverridefieldupgrades();
    clearsuper();
}

// Namespace namespace_fe6cb1145ab372e6/namespace_82ee1eb29fe2bc66
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x316
// Size: 0x26
function on_super_use_finished(var_d27680ff86693f5c) {
    if (function_a50a7be98d81e4fd() && !function_9f7dc3012db92250()) {
        function_e03ac9e2c2b89d1f();
    }
}

