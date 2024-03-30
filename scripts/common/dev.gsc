// mwiii decomp prototype
#namespace dev;

// Namespace dev / scripts/common/dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x68
// Size: 0x14
function init() {
    /#
        initdvars();
        initthreads();
    #/
}

// Namespace dev / scripts/common/dev
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x83
// Size: 0x1a
function private initdvars() {
    /#
        setdevdvarifuninitialized(@"hash_ebdec3f29783ea70", "<unknown string>");
    #/
}

// Namespace dev / scripts/common/dev
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xa4
// Size: 0xe
function private initthreads() {
    /#
        thread function_945e8b4a4a05b526();
    #/
}

// Namespace dev / scripts/common/dev
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xb9
// Size: 0x91b
function private function_945e8b4a4a05b526() {
    /#
        white = (1, 1, 1);
        red = (1, 0, 0);
        green = (0, 1, 0);
        blue = (0, 0, 1);
        while (true) {
            if (getdvarint(@"hash_ebdec3f29783ea70") > 0) {
                script_models = getentarray("<unknown string>", "<unknown string>");
                script_origins = getentarray("<unknown string>", "<unknown string>");
                scriptmovercounts = spawnstruct();
                scriptmovercounts.scriptmodeltargets = [];
                scriptmovercounts.scriptmodelnoteworthy = [];
                scriptmovercounts.scriptmodelmisc = 0;
                scriptmovercounts.var_f6496cc6c6cd9606 = [];
                scriptmovercounts.var_14a5f24d72a497bf = [];
                scriptmovercounts.var_174f250d6560ec80 = 0;
                foreach (ent in script_models) {
                    line(ent.origin, ent.origin + anglestoforward(ent.angles) * 10, red);
                    line(ent.origin, ent.origin + anglestoright(ent.angles) * 10, green);
                    line(ent.origin, ent.origin + anglestoup(ent.angles) * 10, blue);
                    if (isdefined(ent.targetname)) {
                        color = white;
                        alpha = 1;
                        scale = 1;
                        print3d(ent.origin, ent.targetname, color, alpha, scale);
                        originstring = "<unknown string>" + ent.origin[0] + "<unknown string>" + ent.origin[1] + "<unknown string>" + ent.origin[2] + "<unknown string>";
                        print3d(ent.origin + (0, 0, -20), originstring, color, alpha, scale);
                        if (isdefined(scriptmovercounts.scriptmodeltargets[ent.targetname])) {
                            scriptmovercounts.scriptmodeltargets[ent.targetname] = scriptmovercounts.scriptmodeltargets[ent.targetname] + 1;
                        } else {
                            scriptmovercounts.scriptmodeltargets[ent.targetname] = 1;
                        }
                        continue;
                    }
                    if (isdefined(ent.script_noteworthy)) {
                        if (isdefined(scriptmovercounts.scriptmodelnoteworthy[ent.script_noteworthy])) {
                            scriptmovercounts.scriptmodelnoteworthy[ent.script_noteworthy] = scriptmovercounts.scriptmodelnoteworthy[ent.script_noteworthy] + 1;
                        } else {
                            scriptmovercounts.scriptmodelnoteworthy[ent.script_noteworthy] = 1;
                        }
                        continue;
                    }
                    scriptmovercounts.scriptmodelmisc = scriptmovercounts.scriptmodelmisc + 1;
                }
                foreach (ent in script_origins) {
                    line(ent.origin, ent.origin + anglestoforward(ent.angles) * 10, red);
                    line(ent.origin, ent.origin + anglestoright(ent.angles) * 10, green);
                    line(ent.origin, ent.origin + anglestoup(ent.angles) * 10, blue);
                    if (isdefined(ent.targetname)) {
                        color = white;
                        alpha = 1;
                        scale = 1;
                        switch (ent.targetname) {
                        case #"hash_b1841f3499756c6a":
                            color = red;
                            scale = 3;
                            break;
                        case #"hash_18b8d1ddd9bd830d":
                        case #"hash_c7f2713f8146c2fe":
                            color = green;
                            scale = 3;
                            break;
                        }
                        print3d(ent.origin, ent.targetname, color, alpha, scale);
                        originstring = "<unknown string>" + ent.origin[0] + "<unknown string>" + ent.origin[1] + "<unknown string>" + ent.origin[2] + "<unknown string>";
                        print3d(ent.origin + (0, 0, -20), originstring, color, alpha, scale);
                        if (isdefined(scriptmovercounts.var_f6496cc6c6cd9606[ent.targetname])) {
                            scriptmovercounts.var_f6496cc6c6cd9606[ent.targetname] = scriptmovercounts.var_f6496cc6c6cd9606[ent.targetname] + 1;
                        } else {
                            scriptmovercounts.var_f6496cc6c6cd9606[ent.targetname] = 1;
                        }
                        continue;
                    }
                    if (isdefined(ent.script_noteworthy)) {
                        if (isdefined(scriptmovercounts.var_14a5f24d72a497bf[ent.script_noteworthy])) {
                            scriptmovercounts.var_14a5f24d72a497bf[ent.script_noteworthy] = scriptmovercounts.var_14a5f24d72a497bf[ent.script_noteworthy] + 1;
                        } else {
                            scriptmovercounts.var_14a5f24d72a497bf[ent.script_noteworthy] = 1;
                        }
                        continue;
                    }
                    scriptmovercounts.var_174f250d6560ec80 = scriptmovercounts.var_174f250d6560ec80 + 1;
                }
                var_bc545feded2c6a23 = 400;
                var_bc545eeded2c67f0 = 50;
                var_916c5c90b430d951 = 15;
                printtoscreen2d(var_bc545feded2c6a23, var_bc545eeded2c67f0, "<unknown string>");
                var_bc545eeded2c67f0 = var_bc545eeded2c67f0 + var_916c5c90b430d951;
                printtoscreen2d(var_bc545feded2c6a23, var_bc545eeded2c67f0, "<unknown string>");
                var_bc545eeded2c67f0 = var_bc545eeded2c67f0 + var_916c5c90b430d951;
                printtoscreen2d(var_bc545feded2c6a23, var_bc545eeded2c67f0, "<unknown string>" + scriptmovercounts.scriptmodelmisc);
                var_bc545eeded2c67f0 = var_bc545eeded2c67f0 + var_916c5c90b430d951;
                printtoscreen2d(var_bc545feded2c6a23, var_bc545eeded2c67f0, "<unknown string>");
                var_bc545eeded2c67f0 = var_bc545eeded2c67f0 + var_916c5c90b430d951;
                foreach (targetname, targetcount in scriptmovercounts.scriptmodeltargets) {
                    printtoscreen2d(var_bc545feded2c6a23, var_bc545eeded2c67f0, targetname + "<unknown string>" + targetcount);
                    var_bc545eeded2c67f0 = var_bc545eeded2c67f0 + var_916c5c90b430d951;
                }
                printtoscreen2d(var_bc545feded2c6a23, var_bc545eeded2c67f0, "<unknown string>");
                var_bc545eeded2c67f0 = var_bc545eeded2c67f0 + var_916c5c90b430d951;
                foreach (noteworthyname, noteworthycount in scriptmovercounts.scriptmodelnoteworthy) {
                    printtoscreen2d(var_bc545feded2c6a23, var_bc545eeded2c67f0, noteworthyname + "<unknown string>" + noteworthycount);
                    var_bc545eeded2c67f0 = var_bc545eeded2c67f0 + var_916c5c90b430d951;
                }
                printtoscreen2d(var_bc545feded2c6a23, var_bc545eeded2c67f0, "<unknown string>");
                var_bc545eeded2c67f0 = var_bc545eeded2c67f0 + var_916c5c90b430d951;
                printtoscreen2d(var_bc545feded2c6a23, var_bc545eeded2c67f0, "<unknown string>" + scriptmovercounts.var_174f250d6560ec80);
                var_bc545eeded2c67f0 = var_bc545eeded2c67f0 + var_916c5c90b430d951;
                printtoscreen2d(var_bc545feded2c6a23, var_bc545eeded2c67f0, "<unknown string>");
                var_bc545eeded2c67f0 = var_bc545eeded2c67f0 + var_916c5c90b430d951;
                foreach (targetname, targetcount in scriptmovercounts.var_f6496cc6c6cd9606) {
                    printtoscreen2d(var_bc545feded2c6a23, var_bc545eeded2c67f0, targetname + "<unknown string>" + targetcount);
                    var_bc545eeded2c67f0 = var_bc545eeded2c67f0 + var_916c5c90b430d951;
                }
                printtoscreen2d(var_bc545feded2c6a23, var_bc545eeded2c67f0, "<unknown string>");
                var_bc545eeded2c67f0 = var_bc545eeded2c67f0 + var_916c5c90b430d951;
                foreach (noteworthyname, noteworthycount in scriptmovercounts.var_14a5f24d72a497bf) {
                    printtoscreen2d(var_bc545feded2c6a23, var_bc545eeded2c67f0, noteworthyname + "<unknown string>" + noteworthycount);
                    var_bc545eeded2c67f0 = var_bc545eeded2c67f0 + var_916c5c90b430d951;
                }
            }
            wait(0.05);
        }
    #/
}

