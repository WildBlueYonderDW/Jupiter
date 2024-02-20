// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_f15b4b82e231cf42;

// Namespace namespace_f15b4b82e231cf42/namespace_6c72573a48881070
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd
// Size: 0x95
function function_27a921508cb04613(visionset, var_647b7cd7ece0574a) {
    /#
        assertex(isdefined(visionset) || visionset == "", "AddVisionSetNakedForPlayer(): needs to have a valid visionSet");
    #/
    if (!isdefined(var_647b7cd7ece0574a)) {
        var_647b7cd7ece0574a = 0;
    }
    if (!isdefined(self.activevisionsetlist)) {
        self.activevisionsetlist = [];
    }
    if (!isdefined(self.activevisionsetlist[visionset])) {
        self.activevisionsetlist[visionset] = 1;
    } else {
        self.activevisionsetlist[visionset]++;
    }
    if (self.activevisionsetlist[visionset] == 1) {
        thread function_47c42aba7e6b41e3(visionset, var_647b7cd7ece0574a);
    }
}

// Namespace namespace_f15b4b82e231cf42/namespace_6c72573a48881070
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x169
// Size: 0xc8
function function_9a92ae402e209ecc(visionset, var_2bd38f3d3755f971) {
    if (!isdefined(self.activevisionsetlist)) {
        return;
    }
    if (!isdefined(self.activevisionsetlist[visionset])) {
        return;
    }
    self.activevisionsetlist[visionset]--;
    if (self.activevisionsetlist[visionset] == 0) {
        var_bfd32f432f9daccf = [];
        foreach (var_b830ab0b24e02ba3, var_c901fc1c126661a in self.activevisionsetlist) {
            if (var_b830ab0b24e02ba3 == visionset) {
                continue;
            }
            var_bfd32f432f9daccf[var_b830ab0b24e02ba3] = var_c901fc1c126661a;
        }
        self.activevisionsetlist = var_bfd32f432f9daccf;
        thread function_5936afcd0e190a3b(var_2bd38f3d3755f971);
    }
}

// Namespace namespace_f15b4b82e231cf42/namespace_6c72573a48881070
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x238
// Size: 0x28
function function_cb1caaf18300a508() {
    thread function_47c42aba7e6b41e3("", 0);
    if (isdefined(self.activevisionsetlist)) {
        self.activevisionsetlist = undefined;
    }
}

// Namespace namespace_f15b4b82e231cf42/namespace_6c72573a48881070
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x267
// Size: 0x40
function function_8e888e08a6ab22d3(visionset) {
    if (!isdefined(self.activevisionsetlist) || !isdefined(self.activevisionsetlist[visionset])) {
        return 0;
    }
    if (self.activevisionsetlist[visionset] > 0) {
        return 1;
    }
    return 0;
}

// Namespace namespace_f15b4b82e231cf42/namespace_6c72573a48881070
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2af
// Size: 0x9d
function private function_5936afcd0e190a3b(var_2bd38f3d3755f971) {
    self endon("disconnect");
    level endon("game_ended");
    var_d4400603d79f0cf4 = 0;
    if (isdefined(var_2bd38f3d3755f971)) {
        var_d4400603d79f0cf4 = var_2bd38f3d3755f971;
    }
    thread function_47c42aba7e6b41e3("", var_d4400603d79f0cf4);
    if (var_d4400603d79f0cf4 > 0) {
        wait(var_d4400603d79f0cf4);
        waitframe();
    }
    foreach (var_b830ab0b24e02ba3, var_c901fc1c126661a in self.activevisionsetlist) {
        thread function_47c42aba7e6b41e3(var_b830ab0b24e02ba3, var_d4400603d79f0cf4);
        waitframe();
    }
}

// Namespace namespace_f15b4b82e231cf42/namespace_6c72573a48881070
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x353
// Size: 0x5a
function private function_47c42aba7e6b41e3(visionset, var_647b7cd7ece0574a) {
    self endon("disconnect");
    level endon("game_ended");
    while (istrue(self.var_679f06b0517f5168)) {
        waitframe();
    }
    self.var_679f06b0517f5168 = 1;
    self visionsetnakedforplayer(visionset, var_647b7cd7ece0574a);
    if (var_647b7cd7ece0574a > 0) {
        wait(var_647b7cd7ece0574a);
    }
    waitframe();
    self.var_679f06b0517f5168 = undefined;
}

