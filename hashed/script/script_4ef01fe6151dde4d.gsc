// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_347e655acacdace;
#using script_7f9409b703dad400;
#using script_3e31016b9c11a616;
#using script_41387eecc35b88bf;
#using script_3ab210ea917601e7;
#using script_3ac7886f9e4eceef;
#using script_413d0426f154bd91;
#using script_185660037b9236c1;

#namespace namespace_a8e6d792fb89051e;

// Namespace namespace_a8e6d792fb89051e/namespace_2bb19978a7035533
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22f
// Size: 0x5f
function function_b05f987b9adfdc21(var_d389f1191e609479, var_cc3e7fbaface5a17, var_b76b3aee05993635, var_bd79f5517caf011) {
    ProgressTracker = function_b58813f6489727f2(var_cc3e7fbaface5a17, var_b76b3aee05993635);
    function_5d8afaa62329ec72(var_d389f1191e609479, ProgressTracker, var_bd79f5517caf011);
    function_c662924b60a37407("Progress Tracker: " + var_d389f1191e609479 + " was added to an Activity.", @"hash_c6dd0e44e8224971", self);
}

// Namespace namespace_a8e6d792fb89051e/namespace_2bb19978a7035533
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x295
// Size: 0x56
function function_76c04b66e3485690(var_d389f1191e609479, var_84b03d3d5cf4dd29, var_bd79f5517caf011) {
    var_eec7d321c580f401 = function_eb40bea3220ba871(var_84b03d3d5cf4dd29);
    function_5d8afaa62329ec72(var_d389f1191e609479, var_eec7d321c580f401, var_bd79f5517caf011);
    function_c662924b60a37407("Stopwatch Progress Tracker: " + var_d389f1191e609479 + " was added to an Activity.", @"hash_c6dd0e44e8224971", self);
}

// Namespace namespace_a8e6d792fb89051e/namespace_2bb19978a7035533
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f2
// Size: 0x56
function function_95f8d1b9f6685b61(var_d389f1191e609479, timeinseconds, var_bd79f5517caf011) {
    var_62f399d3210cb2a6 = function_3eec8a169e8a0936(timeinseconds);
    function_5d8afaa62329ec72(var_d389f1191e609479, var_62f399d3210cb2a6, var_bd79f5517caf011);
    function_c662924b60a37407("Countdown Progress Tracker: " + var_d389f1191e609479 + " was added to an Activity.", @"hash_c6dd0e44e8224971", self);
}

// Namespace namespace_a8e6d792fb89051e/namespace_2bb19978a7035533
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x34f
// Size: 0x56
function function_6a79e7a24a17e101(var_d389f1191e609479, var_ded14ae1ea8c4446, var_bd79f5517caf011) {
    var_ad4459eadc3dee86 = function_194d5c2394f0c8f6(var_ded14ae1ea8c4446);
    function_5d8afaa62329ec72(var_d389f1191e609479, var_ad4459eadc3dee86, var_bd79f5517caf011);
    function_c662924b60a37407("Kill Progress Tracker: " + var_d389f1191e609479 + " was added to an Activity.", @"hash_c6dd0e44e8224971", self);
}

// Namespace namespace_a8e6d792fb89051e/namespace_2bb19978a7035533
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ac
// Size: 0x61
function function_f3a73e1c537a55ae() {
    if (function_2cd8a95641b4e4f1()) {
        foreach (ProgressTracker in self.var_e3d833b1e5d30b03) {
            function_2d8ae6d7b07724e2(ProgressTracker);
        }
    }
}

// Namespace namespace_a8e6d792fb89051e/namespace_2bb19978a7035533
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x414
// Size: 0x42
function function_b0afa182f3914d4f(var_d389f1191e609479) {
    ProgressTracker = self.var_e3d833b1e5d30b03[var_d389f1191e609479];
    /#
        assertex(isdefined(ProgressTracker), "Trying to end " + var_d389f1191e609479 + " progress tracker but that was not found on this activity.");
    #/
    function_2d8ae6d7b07724e2(ProgressTracker);
}

// Namespace namespace_a8e6d792fb89051e/namespace_2bb19978a7035533
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x45d
// Size: 0xb1
function function_9ff369ea020a30a6(var_d389f1191e609479, pausetimer) {
    ProgressTracker = self.var_e3d833b1e5d30b03[var_d389f1191e609479];
    /#
        assertex(isdefined(ProgressTracker), "Trying to pause " + var_d389f1191e609479 + " progress tracker but that was not found on this activity.");
    #/
    /#
        assertex(isdefined(ProgressTracker.paused), "Trying to pause " + var_d389f1191e609479 + " progress tracker but this is not a time-based tracker.");
    #/
    if (pausetimer && !ProgressTracker.paused) {
        ProgressTracker.paused = 1;
    } else if (!pausetimer && ProgressTracker.paused) {
        ProgressTracker.paused = 0;
        ProgressTracker notify("resume");
    }
}

// Namespace namespace_a8e6d792fb89051e/namespace_2bb19978a7035533
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x515
// Size: 0x54
function private function_5d8afaa62329ec72(var_d389f1191e609479, ProgressTracker, var_bd79f5517caf011) {
    ProgressTracker function_af4d87f338d86a53(self, &function_864b19ca6e4a3a81);
    if (isdefined(var_bd79f5517caf011)) {
        ProgressTracker function_af4d87f338d86a53(self, var_bd79f5517caf011);
    }
    function_53a8c0ab528f44cd(var_d389f1191e609479, ProgressTracker);
    namespace_e82a1efb852543c9::function_e4b4be816ed43365(var_d389f1191e609479, ProgressTracker);
    namespace_68dc261109a9503f::function_ce906635a152d2d0(self, var_d389f1191e609479);
}

// Namespace namespace_a8e6d792fb89051e/namespace_2bb19978a7035533
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x570
// Size: 0x74
function private function_864b19ca6e4a3a81(ProgressTracker) {
    var_d389f1191e609479 = ProgressTracker namespace_96552c234e66ebee::function_4f3f1f9cedf2d883();
    namespace_e82a1efb852543c9::function_5aa098a0e2a91e3e(var_d389f1191e609479);
    function_c662924b60a37407("Progress Tracker: " + var_d389f1191e609479 + " 's value has been updated. Progress Remaining: " + ProgressTracker namespace_96552c234e66ebee::function_cfeb21bf93c30dae(), @"hash_c6dd0e44e8224971", self);
    if (ProgressTracker iscomplete()) {
        function_c662924b60a37407("Progress Tracker: " + var_d389f1191e609479 + " is complete.", @"hash_c6dd0e44e8224971", self);
    }
}

// Namespace namespace_a8e6d792fb89051e/namespace_2bb19978a7035533
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5eb
// Size: 0x5d
function private function_2d8ae6d7b07724e2(ProgressTracker) {
    var_d389f1191e609479 = ProgressTracker function_4f3f1f9cedf2d883();
    namespace_e82a1efb852543c9::function_7548a706b47c1eb1(var_d389f1191e609479);
    function_f2a618a7ad2f558d(var_d389f1191e609479, self.var_6c29f2fdb0054bbe);
    function_11bf7ad9c1fdc527(var_d389f1191e609479);
    function_c662924b60a37407("Progress Tracker: " + var_d389f1191e609479 + " has ended for the activity. ", @"hash_c6dd0e44e8224971", self);
}

