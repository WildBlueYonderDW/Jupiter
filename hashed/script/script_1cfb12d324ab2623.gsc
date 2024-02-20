// mwiii decomp prototype
#namespace dev;

// Namespace dev/namespace_f761f08357d3baa1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x68
// Size: 0x14
function init() {
    /#
        function_45f38d9c4f09112b();
        function_e726b604876ebd84();
    #/
}

// Namespace dev/namespace_f761f08357d3baa1
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x83
// Size: 0x1a
function private function_45f38d9c4f09112b() {
    /#
        setdevdvarifuninitialized(@"hash_ebdec3f29783ea70", "<unknown string>");
    #/
}

// Namespace dev/namespace_f761f08357d3baa1
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xa4
// Size: 0xe
function private function_e726b604876ebd84() {
    /#
        thread function_945e8b4a4a05b526();
    #/
}

// Namespace dev/namespace_f761f08357d3baa1
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xb9
// Size: 0x91b
function private function_945e8b4a4a05b526() {
    /#
        white = (1, 1, 1);
        red = (1, 0, 0);
        green = (0, 1, 0);
        blue = (0, 0, 1);
        while (1) {
            if (getdvarint(@"hash_ebdec3f29783ea70") > 0) {
                script_models = getentarray("<unknown string>", "<unknown string>");
                script_origins = getentarray("<unknown string>", "<unknown string>");
                var_980f79a1d2b97db = spawnstruct();
                var_980f79a1d2b97db.var_d70420e55117ef07 = [];
                var_980f79a1d2b97db.var_262d7a960bcf0e2c = [];
                var_980f79a1d2b97db.var_c36f7d52959c900f = 0;
                var_980f79a1d2b97db.var_f6496cc6c6cd9606 = [];
                var_980f79a1d2b97db.var_14a5f24d72a497bf = [];
                var_980f79a1d2b97db.var_174f250d6560ec80 = 0;
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
                        if (isdefined(var_980f79a1d2b97db.var_d70420e55117ef07[ent.targetname])) {
                            var_980f79a1d2b97db.var_d70420e55117ef07[ent.targetname] = var_980f79a1d2b97db.var_d70420e55117ef07[ent.targetname] + 1;
                        } else {
                            var_980f79a1d2b97db.var_d70420e55117ef07[ent.targetname] = 1;
                        }
                    } else if (isdefined(ent.script_noteworthy)) {
                        if (isdefined(var_980f79a1d2b97db.var_262d7a960bcf0e2c[ent.script_noteworthy])) {
                            var_980f79a1d2b97db.var_262d7a960bcf0e2c[ent.script_noteworthy] = var_980f79a1d2b97db.var_262d7a960bcf0e2c[ent.script_noteworthy] + 1;
                        } else {
                            var_980f79a1d2b97db.var_262d7a960bcf0e2c[ent.script_noteworthy] = 1;
                        }
                    } else {
                        var_980f79a1d2b97db.var_c36f7d52959c900f = var_980f79a1d2b97db.var_c36f7d52959c900f + 1;
                    }
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
                        if (isdefined(var_980f79a1d2b97db.var_f6496cc6c6cd9606[ent.targetname])) {
                            var_980f79a1d2b97db.var_f6496cc6c6cd9606[ent.targetname] = var_980f79a1d2b97db.var_f6496cc6c6cd9606[ent.targetname] + 1;
                        } else {
                            var_980f79a1d2b97db.var_f6496cc6c6cd9606[ent.targetname] = 1;
                        }
                    } else if (isdefined(ent.script_noteworthy)) {
                        if (isdefined(var_980f79a1d2b97db.var_14a5f24d72a497bf[ent.script_noteworthy])) {
                            var_980f79a1d2b97db.var_14a5f24d72a497bf[ent.script_noteworthy] = var_980f79a1d2b97db.var_14a5f24d72a497bf[ent.script_noteworthy] + 1;
                        } else {
                            var_980f79a1d2b97db.var_14a5f24d72a497bf[ent.script_noteworthy] = 1;
                        }
                    } else {
                        var_980f79a1d2b97db.var_174f250d6560ec80 = var_980f79a1d2b97db.var_174f250d6560ec80 + 1;
                    }
                }
                var_bc545feded2c6a23 = 400;
                var_bc545eeded2c67f0 = 50;
                var_916c5c90b430d951 = 15;
                printtoscreen2d(var_bc545feded2c6a23, var_bc545eeded2c67f0, "<unknown string>");
                var_bc545eeded2c67f0 = var_bc545eeded2c67f0 + var_916c5c90b430d951;
                printtoscreen2d(var_bc545feded2c6a23, var_bc545eeded2c67f0, "<unknown string>");
                var_bc545eeded2c67f0 = var_bc545eeded2c67f0 + var_916c5c90b430d951;
                printtoscreen2d(var_bc545feded2c6a23, var_bc545eeded2c67f0, "<unknown string>" + var_980f79a1d2b97db.var_c36f7d52959c900f);
                var_bc545eeded2c67f0 = var_bc545eeded2c67f0 + var_916c5c90b430d951;
                printtoscreen2d(var_bc545feded2c6a23, var_bc545eeded2c67f0, "<unknown string>");
                var_bc545eeded2c67f0 = var_bc545eeded2c67f0 + var_916c5c90b430d951;
                foreach (targetname, targetcount in var_980f79a1d2b97db.var_d70420e55117ef07) {
                    printtoscreen2d(var_bc545feded2c6a23, var_bc545eeded2c67f0, targetname + "<unknown string>" + targetcount);
                    var_bc545eeded2c67f0 = var_bc545eeded2c67f0 + var_916c5c90b430d951;
                }
                printtoscreen2d(var_bc545feded2c6a23, var_bc545eeded2c67f0, "<unknown string>");
                var_bc545eeded2c67f0 = var_bc545eeded2c67f0 + var_916c5c90b430d951;
                foreach (var_3f890441a294987d, var_67799141c385d4fd in var_980f79a1d2b97db.var_262d7a960bcf0e2c) {
                    printtoscreen2d(var_bc545feded2c6a23, var_bc545eeded2c67f0, var_3f890441a294987d + "<unknown string>" + var_67799141c385d4fd);
                    var_bc545eeded2c67f0 = var_bc545eeded2c67f0 + var_916c5c90b430d951;
                }
                printtoscreen2d(var_bc545feded2c6a23, var_bc545eeded2c67f0, "<unknown string>");
                var_bc545eeded2c67f0 = var_bc545eeded2c67f0 + var_916c5c90b430d951;
                printtoscreen2d(var_bc545feded2c6a23, var_bc545eeded2c67f0, "<unknown string>" + var_980f79a1d2b97db.var_174f250d6560ec80);
                var_bc545eeded2c67f0 = var_bc545eeded2c67f0 + var_916c5c90b430d951;
                printtoscreen2d(var_bc545feded2c6a23, var_bc545eeded2c67f0, "<unknown string>");
                var_bc545eeded2c67f0 = var_bc545eeded2c67f0 + var_916c5c90b430d951;
                foreach (targetname, targetcount in var_980f79a1d2b97db.var_f6496cc6c6cd9606) {
                    printtoscreen2d(var_bc545feded2c6a23, var_bc545eeded2c67f0, targetname + "<unknown string>" + targetcount);
                    var_bc545eeded2c67f0 = var_bc545eeded2c67f0 + var_916c5c90b430d951;
                }
                printtoscreen2d(var_bc545feded2c6a23, var_bc545eeded2c67f0, "<unknown string>");
                var_bc545eeded2c67f0 = var_bc545eeded2c67f0 + var_916c5c90b430d951;
                foreach (var_3f890441a294987d, var_67799141c385d4fd in var_980f79a1d2b97db.var_14a5f24d72a497bf) {
                    printtoscreen2d(var_bc545feded2c6a23, var_bc545eeded2c67f0, var_3f890441a294987d + "<unknown string>" + var_67799141c385d4fd);
                    var_bc545eeded2c67f0 = var_bc545eeded2c67f0 + var_916c5c90b430d951;
                }
            }
            wait(0.05);
        }
    #/
}

