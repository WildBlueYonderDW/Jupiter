// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace vision_utility;

// Namespace vision_utility / namespace_6c72573a48881070
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd
// Size: 0x95
function function_27a921508cb04613(visionset, transitionduration) {
    /#
        assertex(isdefined(visionset) || visionset == "", "AddVisionSetNakedForPlayer(): needs to have a valid visionSet");
    #/
    if (!isdefined(transitionduration)) {
        transitionduration = 0;
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
        thread function_47c42aba7e6b41e3(visionset, transitionduration);
    }
}

// Namespace vision_utility / namespace_6c72573a48881070
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x169
// Size: 0xc8
function function_9a92ae402e209ecc(visionset, removeduration) {
    if (!isdefined(self.activevisionsetlist)) {
        return;
    }
    if (!isdefined(self.activevisionsetlist[visionset])) {
        return;
    }
    self.activevisionsetlist[visionset]--;
    if (self.activevisionsetlist[visionset] == 0) {
        var_bfd32f432f9daccf = [];
        foreach (visionindex, visionsetcount in self.activevisionsetlist) {
            if (visionindex == visionset) {
                continue;
            }
            var_bfd32f432f9daccf[visionindex] = visionsetcount;
        }
        self.activevisionsetlist = var_bfd32f432f9daccf;
        thread function_5936afcd0e190a3b(removeduration);
    }
}

// Namespace vision_utility / namespace_6c72573a48881070
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x238
// Size: 0x28
function function_cb1caaf18300a508() {
    thread function_47c42aba7e6b41e3("", 0);
    if (isdefined(self.activevisionsetlist)) {
        self.activevisionsetlist = undefined;
    }
}

// Namespace vision_utility / namespace_6c72573a48881070
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x267
// Size: 0x40
function function_8e888e08a6ab22d3(visionset) {
    if (!isdefined(self.activevisionsetlist) || !isdefined(self.activevisionsetlist[visionset])) {
        return false;
    }
    if (self.activevisionsetlist[visionset] > 0) {
        return true;
    }
    return false;
}

// Namespace vision_utility / namespace_6c72573a48881070
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2af
// Size: 0x9d
function private function_5936afcd0e190a3b(removeduration) {
    self endon("disconnect");
    level endon("game_ended");
    dur = 0;
    if (isdefined(removeduration)) {
        dur = removeduration;
    }
    thread function_47c42aba7e6b41e3("", dur);
    if (dur > 0) {
        wait(dur);
        waitframe();
    }
    foreach (visionindex, visionsetcount in self.activevisionsetlist) {
        thread function_47c42aba7e6b41e3(visionindex, dur);
        waitframe();
    }
}

// Namespace vision_utility / namespace_6c72573a48881070
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x353
// Size: 0x5a
function private function_47c42aba7e6b41e3(visionset, transitionduration) {
    self endon("disconnect");
    level endon("game_ended");
    while (istrue(self.var_679f06b0517f5168)) {
        waitframe();
    }
    self.var_679f06b0517f5168 = 1;
    self visionsetnakedforplayer(visionset, transitionduration);
    if (transitionduration > 0) {
        wait(transitionduration);
    }
    waitframe();
    self.var_679f06b0517f5168 = undefined;
}

