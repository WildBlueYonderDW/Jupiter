// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_347e655acacdace;

#namespace namespace_a81ff4b57c69b411;

// Namespace namespace_a81ff4b57c69b411 / namespace_3ab0c2d9cd55890e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d1
// Size: 0xd
function function_25599e7b57187fba() {
    self.var_e3d833b1e5d30b03 = [];
}

// Namespace namespace_a81ff4b57c69b411 / namespace_3ab0c2d9cd55890e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e5
// Size: 0x13
function function_2cd8a95641b4e4f1() {
    return isdefined(self) && isdefined(self.var_e3d833b1e5d30b03);
}

// Namespace namespace_a81ff4b57c69b411 / namespace_3ab0c2d9cd55890e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x200
// Size: 0x45
function function_6ef305e92aa56110(uniquename) {
    /#
        assertex(function_2cd8a95641b4e4f1(), "SetUpAsProgressTrackerContainer was not called on this container");
    #/
    /#
        assertex(isdefined(self.var_e3d833b1e5d30b03[uniquename]), "This progress tracker is not a part of the container and so can't be removed");
    #/
    return self.var_e3d833b1e5d30b03[uniquename];
}

// Namespace namespace_a81ff4b57c69b411 / namespace_3ab0c2d9cd55890e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24d
// Size: 0x59
function function_53a8c0ab528f44cd(uniquename, ProgressTracker) {
    /#
        assertex(function_2cd8a95641b4e4f1(), "SetUpAsProgressTrackerContainer was not called on this container");
    #/
    /#
        assertex(!isdefined(self.var_e3d833b1e5d30b03[uniquename]), "A progress tracker with the same unique name has already been added to this container");
    #/
    ProgressTracker function_5cd1865af5a5edcf(uniquename);
    self.var_e3d833b1e5d30b03[uniquename] = ProgressTracker;
}

// Namespace namespace_a81ff4b57c69b411 / namespace_3ab0c2d9cd55890e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ad
// Size: 0x57
function function_11bf7ad9c1fdc527(uniquename) {
    /#
        assertex(function_2cd8a95641b4e4f1(), "SetUpAsProgressTrackerContainer was not called on this container");
    #/
    /#
        assertex(isdefined(self.var_e3d833b1e5d30b03[uniquename]), "This progress tracker is not a part of the container and so can't be removed");
    #/
    self.var_e3d833b1e5d30b03[uniquename] notify("progress_tracking_concluded");
    self.var_e3d833b1e5d30b03[uniquename] = undefined;
}

// Namespace namespace_a81ff4b57c69b411 / namespace_3ab0c2d9cd55890e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x30b
// Size: 0x55
function function_a1a1d73d3e5772a5(uniquename, incrementvalue) {
    /#
        assertex(function_2cd8a95641b4e4f1(), "SetUpAsProgressTrackerContainer was not called on this container");
    #/
    /#
        assertex(isdefined(self.var_e3d833b1e5d30b03[uniquename]), "This progress tracker is not a part of the container and so can't be incremented");
    #/
    self.var_e3d833b1e5d30b03[uniquename] function_a370b85e4225923c(incrementvalue);
}

// Namespace namespace_a81ff4b57c69b411 / namespace_3ab0c2d9cd55890e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x367
// Size: 0x55
function function_a6663c5b87c63d51(uniquename, decrementvalue) {
    /#
        assertex(function_2cd8a95641b4e4f1(), "SetUpAsProgressTrackerContainer was not called on this container");
    #/
    /#
        assertex(isdefined(self.var_e3d833b1e5d30b03[uniquename]), "This progress tracker is not a part of the container and so can't be incremented");
    #/
    self.var_e3d833b1e5d30b03[uniquename] function_1e9e5153831d8c68(decrementvalue);
}

// Namespace namespace_a81ff4b57c69b411 / namespace_3ab0c2d9cd55890e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c3
// Size: 0x55
function function_82a2f59593fe059e(uniquename, progressvalue) {
    /#
        assertex(function_2cd8a95641b4e4f1(), "SetUpAsProgressTrackerContainer was not called on this container");
    #/
    /#
        assertex(isdefined(self.var_e3d833b1e5d30b03[uniquename]), "This progress tracker is not a part of the container and so can't be incremented");
    #/
    self.var_e3d833b1e5d30b03[uniquename] function_7681e7890758b69b(progressvalue);
}

// Namespace namespace_a81ff4b57c69b411 / namespace_3ab0c2d9cd55890e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x41f
// Size: 0x55
function function_34a7c2ed4dbe722b(uniquename, finalvalue) {
    /#
        assertex(function_2cd8a95641b4e4f1(), "SetUpAsProgressTrackerContainer was not called on this container");
    #/
    /#
        assertex(isdefined(self.var_e3d833b1e5d30b03[uniquename]), "This progress tracker is not a part of the container and so can't be incremented");
    #/
    self.var_e3d833b1e5d30b03[uniquename] function_ea45d380408d2922(finalvalue);
}

