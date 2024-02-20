// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_347e655acacdace;

#namespace namespace_a81ff4b57c69b411;

// Namespace namespace_a81ff4b57c69b411/namespace_3ab0c2d9cd55890e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d1
// Size: 0xd
function function_25599e7b57187fba() {
    self.var_e3d833b1e5d30b03 = [];
}

// Namespace namespace_a81ff4b57c69b411/namespace_3ab0c2d9cd55890e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e5
// Size: 0x13
function function_2cd8a95641b4e4f1() {
    return isdefined(self) && isdefined(self.var_e3d833b1e5d30b03);
}

// Namespace namespace_a81ff4b57c69b411/namespace_3ab0c2d9cd55890e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x200
// Size: 0x45
function function_6ef305e92aa56110(var_d389f1191e609479) {
    /#
        assertex(function_2cd8a95641b4e4f1(), "SetUpAsProgressTrackerContainer was not called on this container");
    #/
    /#
        assertex(isdefined(self.var_e3d833b1e5d30b03[var_d389f1191e609479]), "This progress tracker is not a part of the container and so can't be removed");
    #/
    return self.var_e3d833b1e5d30b03[var_d389f1191e609479];
}

// Namespace namespace_a81ff4b57c69b411/namespace_3ab0c2d9cd55890e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24d
// Size: 0x59
function function_53a8c0ab528f44cd(var_d389f1191e609479, ProgressTracker) {
    /#
        assertex(function_2cd8a95641b4e4f1(), "SetUpAsProgressTrackerContainer was not called on this container");
    #/
    /#
        assertex(!isdefined(self.var_e3d833b1e5d30b03[var_d389f1191e609479]), "A progress tracker with the same unique name has already been added to this container");
    #/
    ProgressTracker function_5cd1865af5a5edcf(var_d389f1191e609479);
    self.var_e3d833b1e5d30b03[var_d389f1191e609479] = ProgressTracker;
}

// Namespace namespace_a81ff4b57c69b411/namespace_3ab0c2d9cd55890e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ad
// Size: 0x57
function function_11bf7ad9c1fdc527(var_d389f1191e609479) {
    /#
        assertex(function_2cd8a95641b4e4f1(), "SetUpAsProgressTrackerContainer was not called on this container");
    #/
    /#
        assertex(isdefined(self.var_e3d833b1e5d30b03[var_d389f1191e609479]), "This progress tracker is not a part of the container and so can't be removed");
    #/
    self.var_e3d833b1e5d30b03[var_d389f1191e609479] notify("progress_tracking_concluded");
    self.var_e3d833b1e5d30b03[var_d389f1191e609479] = undefined;
}

// Namespace namespace_a81ff4b57c69b411/namespace_3ab0c2d9cd55890e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x30b
// Size: 0x55
function function_a1a1d73d3e5772a5(var_d389f1191e609479, var_d2194902e87613eb) {
    /#
        assertex(function_2cd8a95641b4e4f1(), "SetUpAsProgressTrackerContainer was not called on this container");
    #/
    /#
        assertex(isdefined(self.var_e3d833b1e5d30b03[var_d389f1191e609479]), "This progress tracker is not a part of the container and so can't be incremented");
    #/
    self.var_e3d833b1e5d30b03[var_d389f1191e609479] function_a370b85e4225923c(var_d2194902e87613eb);
}

// Namespace namespace_a81ff4b57c69b411/namespace_3ab0c2d9cd55890e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x367
// Size: 0x55
function function_a6663c5b87c63d51(var_d389f1191e609479, var_2289d03a794e6eff) {
    /#
        assertex(function_2cd8a95641b4e4f1(), "SetUpAsProgressTrackerContainer was not called on this container");
    #/
    /#
        assertex(isdefined(self.var_e3d833b1e5d30b03[var_d389f1191e609479]), "This progress tracker is not a part of the container and so can't be incremented");
    #/
    self.var_e3d833b1e5d30b03[var_d389f1191e609479] function_1e9e5153831d8c68(var_2289d03a794e6eff);
}

// Namespace namespace_a81ff4b57c69b411/namespace_3ab0c2d9cd55890e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c3
// Size: 0x55
function function_82a2f59593fe059e(var_d389f1191e609479, var_b0fb203598f9de63) {
    /#
        assertex(function_2cd8a95641b4e4f1(), "SetUpAsProgressTrackerContainer was not called on this container");
    #/
    /#
        assertex(isdefined(self.var_e3d833b1e5d30b03[var_d389f1191e609479]), "This progress tracker is not a part of the container and so can't be incremented");
    #/
    self.var_e3d833b1e5d30b03[var_d389f1191e609479] function_7681e7890758b69b(var_b0fb203598f9de63);
}

// Namespace namespace_a81ff4b57c69b411/namespace_3ab0c2d9cd55890e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x41f
// Size: 0x55
function function_34a7c2ed4dbe722b(var_d389f1191e609479, var_32e688c1e2cf28c0) {
    /#
        assertex(function_2cd8a95641b4e4f1(), "SetUpAsProgressTrackerContainer was not called on this container");
    #/
    /#
        assertex(isdefined(self.var_e3d833b1e5d30b03[var_d389f1191e609479]), "This progress tracker is not a part of the container and so can't be incremented");
    #/
    self.var_e3d833b1e5d30b03[var_d389f1191e609479] function_ea45d380408d2922(var_32e688c1e2cf28c0);
}

