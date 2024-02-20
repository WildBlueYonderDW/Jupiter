// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_32d93a194074fa6a;

#namespace namespace_a17b9a0132e7fbfc;

// Namespace namespace_a17b9a0132e7fbfc/namespace_8dfd86bc6ebc750d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf7
// Size: 0x65
function function_9c8e6a1620edc3b9(var_b8df88d128399821) {
    /#
        assert(isplayer(self));
    #/
    var_20a11c870d111377 = function_7052cffee37e6327(var_b8df88d128399821);
    if (!isdefined(var_20a11c870d111377)) {
        /#
            assertmsg("ftue_tip_getTipBundle_internal() called for ref "" + var_b8df88d128399821 + "" but could not find it in " + level.var_cf6b53e10210d950);
        #/
        return;
    }
    self function_14a669727e767840(level.var_1986e4576cc38610[var_20a11c870d111377]);
}

// Namespace namespace_a17b9a0132e7fbfc/namespace_8dfd86bc6ebc750d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x163
// Size: 0x1a
function function_c858a1889a6cc094() {
    /#
        assert(isplayer(self));
    #/
    self function_14a669727e767840(0);
}

// Namespace namespace_a17b9a0132e7fbfc/namespace_8dfd86bc6ebc750d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x184
// Size: 0xa
function function_e9bceeafa296cb55() {
    function_f6586fa40d64f63e();
}

// Namespace namespace_a17b9a0132e7fbfc/namespace_8dfd86bc6ebc750d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x195
// Size: 0xf6
function private function_f6586fa40d64f63e() {
    level.var_1986e4576cc38610 = [];
    var_20a3c208a35ff465 = getscriptbundle("ftuehudvisibilitylist:ftuehudvisibility_list_mgl").var_ce22599a7f93f1c3;
    foreach (var_e98d60032aa37ef6 in level.var_cf6b53e10210d950) {
        var_f4685368dcf821c5 = function_6a36b14e6b79459(function_2ef675c13ca1c4af(%"hash_6b016976aff9ae9f", var_e98d60032aa37ef6.bundle), #"hash_aa8c9b14160855e5");
        if (isdefined(var_f4685368dcf821c5)) {
            for (var_fccc3e3abfa0e121 = 0; var_20a3c208a35ff465[var_fccc3e3abfa0e121].bundle != var_f4685368dcf821c5 && var_fccc3e3abfa0e121 < var_20a3c208a35ff465.size; var_fccc3e3abfa0e121++) {
            }
            level.var_1986e4576cc38610[var_e98d60032aa37ef6.bundle] = var_fccc3e3abfa0e121 + 1;
        }
    }
}

