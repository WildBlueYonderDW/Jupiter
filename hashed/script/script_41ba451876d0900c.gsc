// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_48814951e916af89;
#using script_5def7af2a9f04234;
#using script_1f97a44d1761c919;
#using script_41ba451876d0900c;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;

#namespace namespace_88b738f3cc56f24f;

// Namespace namespace_88b738f3cc56f24f/namespace_6a3f8c14894f44be
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24c
// Size: 0x2ee
function function_9a7305ea8ee1e807() {
    if (getdvarint(@"hash_365d77262b3a350e", 1) == 0) {
        return;
    }
    level.var_1a6233bc0d61faf = spawnstruct();
    level.var_1a6233bc0d61faf.var_764198b598038f7a = getdvarfloat(@"hash_2c3eabf4a542ff3c", -0.5);
    level.var_1a6233bc0d61faf.var_814b1ca190ceb025 = getdvarfloat(@"hash_bff507e30583af77", 2);
    level.var_1a6233bc0d61faf.var_3459e3d70ae933c3 = getdvarfloat(@"hash_2230fc7a68495b75", 0.75);
    level.var_1a6233bc0d61faf.var_7de1d17b0ef9138 = getdvarfloat(@"hash_5c438007433d1392", 10);
    level.var_1a6233bc0d61faf.var_b286a53c1d03306d = [];
    level.var_1a6233bc0d61faf.var_b286a53c1d03306d[0] = getdvarint(@"hash_2e473219b28f0957", 0);
    level.var_1a6233bc0d61faf.var_b286a53c1d03306d[1] = getdvarint(@"hash_2e473119b28f0724", 10);
    level.var_1a6233bc0d61faf.var_b286a53c1d03306d[2] = getdvarint(@"hash_2e473419b28f0dbd", 10);
    level.var_1a6233bc0d61faf.var_b286a53c1d03306d[3] = getdvarint(@"hash_2e473319b28f0b8a", 15);
    level.var_1a6233bc0d61faf.var_694f28d3324ac95d = getdvarint(@"hash_3fd4229cd74ff0a9", 60);
    level.var_1a6233bc0d61faf.var_69271d52a93b872c = [];
    level.var_1a6233bc0d61faf.var_69271d52a93b872c[0] = "star_0";
    level.var_1a6233bc0d61faf.var_69271d52a93b872c[1] = "star_1";
    level.var_1a6233bc0d61faf.var_69271d52a93b872c[2] = "star_2";
    level.var_1a6233bc0d61faf.var_69271d52a93b872c[3] = "star_3";
    level.var_1a6233bc0d61faf.var_69271d52a93b872c[4] = "star_4";
    /#
        level thread function_78e5d6d49021b584();
    #/
    function_88faf0c0e9782e83();
    if (function_47d356083884f913()) {
        level.var_2eb4c3a1badaf4eb = [];
        foreach (var_171f90b9c4c76d44, poi in level.poi) {
            level.var_2eb4c3a1badaf4eb[var_171f90b9c4c76d44] = function_ba305299cfc33c17(var_171f90b9c4c76d44);
            level thread function_d1e1692b79b44bf7(level.var_2eb4c3a1badaf4eb[var_171f90b9c4c76d44]);
        }
    } else {
        level.var_2eb4c3a1badaf4eb = function_ba305299cfc33c17();
        level thread function_d1e1692b79b44bf7(level.var_2eb4c3a1badaf4eb);
    }
}

// Namespace namespace_88b738f3cc56f24f/namespace_6a3f8c14894f44be
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x541
// Size: 0x6
function function_88faf0c0e9782e83() {
    /#
    #/
}

// Namespace namespace_88b738f3cc56f24f/namespace_6a3f8c14894f44be
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54e
// Size: 0xd
function function_ab9d237321cb489b() {
    return isdefined(level.var_1a6233bc0d61faf);
}

// Namespace namespace_88b738f3cc56f24f/namespace_6a3f8c14894f44be
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x563
// Size: 0x534
function function_ba305299cfc33c17(var_171f90b9c4c76d44) {
    struct = spawnstruct();
    struct.starlevel = 0;
    struct.var_7444b7c0c103ea62 = 0;
    struct.var_bf18e3cc575bc1c8 = 0;
    struct.var_924d5d49fde54cdd = 0;
    struct.poi = var_171f90b9c4c76d44;
    struct.var_19d6896c9e881cc4 = 0;
    struct.var_a93671354b676c18 = 0;
    struct.var_38951249a8cf8968 = 0;
    struct.var_fe385543116077b5 = 0;
    struct.var_55cf9e4f74d2f4c2 = 0;
    struct.var_356bde2b53efa8cf = 0;
    struct.var_78c53731bd6bd662 = getdvarint(@"hash_245660b9079d8b97", 20);
    struct.var_959a2c4ec95e74e4 = getdvarint(@"hash_3ab6352457da46bd", 10);
    struct.var_44d539868962a537 = [];
    struct.var_4c4721224d00c1a6 = [];
    struct.var_9358cad01a18c8c = [];
    struct.var_44d539868962a537[0] = 0;
    struct.var_4c4721224d00c1a6[0] = getdvarint(@"hash_cfaeac4942cbdba", 800);
    struct.var_9358cad01a18c8c[0] = struct.var_44d539868962a537[0] + struct.var_4c4721224d00c1a6[0] * struct.var_959a2c4ec95e74e4;
    struct.var_44d539868962a537[1] = struct.var_44d539868962a537[0] + struct.var_4c4721224d00c1a6[0];
    struct.var_4c4721224d00c1a6[1] = getdvarint(@"hash_1adeab3daea4a349", 800);
    struct.var_9358cad01a18c8c[1] = struct.var_44d539868962a537[1] + struct.var_4c4721224d00c1a6[1] * struct.var_959a2c4ec95e74e4;
    struct.var_44d539868962a537[2] = struct.var_44d539868962a537[1] + struct.var_4c4721224d00c1a6[1];
    struct.var_4c4721224d00c1a6[2] = getdvarint(@"hash_6fc71b67a904a550", 800);
    struct.var_9358cad01a18c8c[2] = struct.var_44d539868962a537[2] + struct.var_4c4721224d00c1a6[2] * struct.var_959a2c4ec95e74e4;
    struct.var_44d539868962a537[3] = struct.var_44d539868962a537[2] + struct.var_4c4721224d00c1a6[2];
    struct.var_4c4721224d00c1a6[3] = getdvarint(@"hash_a93f5b948731e5f", 800);
    struct.var_9358cad01a18c8c[3] = struct.var_44d539868962a537[3] + struct.var_4c4721224d00c1a6[3] * struct.var_959a2c4ec95e74e4;
    struct.var_44d539868962a537[4] = struct.var_44d539868962a537[3] + struct.var_4c4721224d00c1a6[3];
    struct.var_4c4721224d00c1a6[4] = getdvarint(@"hash_1ec9fd7ad7047996", 800);
    struct.var_9358cad01a18c8c[4] = struct.var_44d539868962a537[4] + struct.var_4c4721224d00c1a6[4] * struct.var_959a2c4ec95e74e4;
    struct.var_ef957eb3f2da7e78 = struct.var_44d539868962a537[4] + struct.var_4c4721224d00c1a6[4];
    struct.var_531d3952c9f853f8 = [];
    struct.var_531d3952c9f853f8[1] = &function_980ebd5792a2c6cc;
    struct.var_531d3952c9f853f8[2] = &function_99234bd34375a46e;
    struct.var_531d3952c9f853f8[3] = &function_3b1d1540b3373bf3;
    struct.var_531d3952c9f853f8[4] = &function_48477dcd49a3487c;
    while (!isdefined(level.struct_class_names)) {
        waitframe();
    }
    struct.var_b3e0e8754c8036c1 = [];
    keys = getarraykeys(level.struct_class_names["script_noteworthy"]);
    foreach (key in keys) {
        if (issubstr(key, "star_alarm")) {
            foreach (node in level.struct_class_names["script_noteworthy"][key]) {
                if (!isdefined(var_171f90b9c4c76d44) || isdefined(var_171f90b9c4c76d44) && isdefined(node.poi) && var_171f90b9c4c76d44 == node.poi) {
                    struct.var_b3e0e8754c8036c1[struct.var_b3e0e8754c8036c1.size] = node;
                }
            }
        }
    }
    return struct;
}

// Namespace namespace_88b738f3cc56f24f/namespace_6a3f8c14894f44be
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa9f
// Size: 0xdf
function function_ef4a786f0df1c25(var_171f90b9c4c76d44) {
    level endon("game_ended");
    self endon("death");
    while (1) {
        if (isalive(self)) {
            if (self [[ self.fnisinstealthidle ]]()) {
                function_668252e0e3cbcb41(level.var_1a6233bc0d61faf.var_764198b598038f7a, var_171f90b9c4c76d44);
            } else if (self [[ self.fnisinstealthinvestigate ]]()) {
                function_668252e0e3cbcb41(level.var_1a6233bc0d61faf.var_3459e3d70ae933c3, var_171f90b9c4c76d44);
            } else if (self [[ self.fnisinstealthcombat ]]()) {
                function_668252e0e3cbcb41(level.var_1a6233bc0d61faf.var_7de1d17b0ef9138, var_171f90b9c4c76d44);
            } else if (self [[ self.fnisinstealthhunt ]]()) {
                function_668252e0e3cbcb41(level.var_1a6233bc0d61faf.var_814b1ca190ceb025, var_171f90b9c4c76d44);
            }
        }
        wait(1);
    }
}

// Namespace namespace_88b738f3cc56f24f/namespace_6a3f8c14894f44be
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb85
// Size: 0x99
function function_96b7b6431450dfc0(num, var_171f90b9c4c76d44) {
    if (!isdefined(level.var_2eb4c3a1badaf4eb)) {
        return;
    }
    if (function_47d356083884f913()) {
        if (isdefined(var_171f90b9c4c76d44) && isdefined(level.var_2eb4c3a1badaf4eb[var_171f90b9c4c76d44])) {
            level.var_2eb4c3a1badaf4eb[var_171f90b9c4c76d44].var_a93671354b676c18 = level.var_2eb4c3a1badaf4eb[var_171f90b9c4c76d44].var_a93671354b676c18 + num;
        }
    } else {
        level.var_2eb4c3a1badaf4eb.var_a93671354b676c18 = level.var_2eb4c3a1badaf4eb.var_a93671354b676c18 + num;
    }
}

// Namespace namespace_88b738f3cc56f24f/namespace_6a3f8c14894f44be
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc25
// Size: 0x19
function function_d31c64471a8c8cdc(var_2eb4c3a1badaf4eb) {
    var_2eb4c3a1badaf4eb.var_a93671354b676c18 = 0;
}

// Namespace namespace_88b738f3cc56f24f/namespace_6a3f8c14894f44be
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc45
// Size: 0x56
function function_508b5fbdfb92174b(var_2eb4c3a1badaf4eb, var_ff838f13c8ca3b6c) {
    var_d20b756c31149d97 = var_2eb4c3a1badaf4eb.starlevel + 1;
    if (!isdefined(var_2eb4c3a1badaf4eb.var_44d539868962a537[var_d20b756c31149d97])) {
        return 0;
    }
    if (var_ff838f13c8ca3b6c > var_2eb4c3a1badaf4eb.var_44d539868962a537[var_d20b756c31149d97]) {
        return 1;
    }
    return 0;
}

// Namespace namespace_88b738f3cc56f24f/namespace_6a3f8c14894f44be
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca3
// Size: 0xbc
function function_2e2c47dffa46541c(var_2eb4c3a1badaf4eb, var_ff838f13c8ca3b6c) {
    var_df84da956c680b60 = 0;
    var_f427145f8d539385 = 0;
    if (var_2eb4c3a1badaf4eb.var_a93671354b676c18 >= level.var_1a6233bc0d61faf.var_b286a53c1d03306d[var_2eb4c3a1badaf4eb.starlevel]) {
        var_df84da956c680b60 = 1;
    }
    var_d20b756c31149d97 = var_2eb4c3a1badaf4eb.starlevel + 1;
    if (isdefined(var_2eb4c3a1badaf4eb.var_44d539868962a537[var_d20b756c31149d97]) && var_ff838f13c8ca3b6c >= var_2eb4c3a1badaf4eb.var_44d539868962a537[var_d20b756c31149d97]) {
        var_f427145f8d539385 = 1;
    }
    var_2eb4c3a1badaf4eb.var_19d6896c9e881cc4 = var_df84da956c680b60 && var_f427145f8d539385;
    return var_2eb4c3a1badaf4eb.var_19d6896c9e881cc4;
}

// Namespace namespace_88b738f3cc56f24f/namespace_6a3f8c14894f44be
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd67
// Size: 0x1cb
function function_49cc3e444148f214(var_2eb4c3a1badaf4eb, var_ff838f13c8ca3b6c) {
    var_2eb4c3a1badaf4eb.starlevel++;
    var_2eb4c3a1badaf4eb.var_7444b7c0c103ea62 = var_ff838f13c8ca3b6c;
    function_d31c64471a8c8cdc(var_2eb4c3a1badaf4eb);
    namespace_bfef6903bca5845d::function_374ecacad63bb411(level.var_1a6233bc0d61faf.var_694f28d3324ac95d, var_2eb4c3a1badaf4eb.poi, "Star Level Up");
    playerlist = level.poi[var_2eb4c3a1badaf4eb.poi]["players"];
    namespace_446fc987a980892f::function_d87d5deb069bf8e5("stars_rank_up", playerlist);
    if (isdefined(var_2eb4c3a1badaf4eb.var_531d3952c9f853f8[var_2eb4c3a1badaf4eb.starlevel])) {
        [[ var_2eb4c3a1badaf4eb.var_531d3952c9f853f8[var_2eb4c3a1badaf4eb.starlevel] ]](var_2eb4c3a1badaf4eb);
    }
    var_805e6e206039fd0a = [];
    if (isdefined(var_2eb4c3a1badaf4eb.poi)) {
        foreach (var_d1cf55b36facf5a8 in level.poi[var_2eb4c3a1badaf4eb.poi]["subAreas"]) {
            var_805e6e206039fd0a = array_combine(var_805e6e206039fd0a, var_d1cf55b36facf5a8.var_3ebb6024e3f220ca);
        }
    } else {
        var_805e6e206039fd0a = level.agentarray;
    }
    foreach (agent in var_805e6e206039fd0a) {
        if (isalive(agent)) {
            namespace_6a3f8c14894f44be::function_e04dbe0bd8a25be7(agent, var_2eb4c3a1badaf4eb.starlevel);
        }
    }
}

// Namespace namespace_88b738f3cc56f24f/namespace_6a3f8c14894f44be
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf39
// Size: 0x60
function function_bea7986171a218fe(var_2eb4c3a1badaf4eb, var_ff838f13c8ca3b6c) {
    var_8e3f400ce6c5fed2 = var_2eb4c3a1badaf4eb.starlevel - 1;
    if (!isdefined(var_2eb4c3a1badaf4eb.var_44d539868962a537[var_8e3f400ce6c5fed2])) {
        return 0;
    }
    if (var_ff838f13c8ca3b6c < var_2eb4c3a1badaf4eb.var_44d539868962a537[var_2eb4c3a1badaf4eb.starlevel]) {
        return 1;
    }
    return 0;
}

// Namespace namespace_88b738f3cc56f24f/namespace_6a3f8c14894f44be
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa1
// Size: 0x6d
function function_f4b18d11b00160c7(var_2eb4c3a1badaf4eb, var_ff838f13c8ca3b6c) {
    if (var_ff838f13c8ca3b6c <= var_2eb4c3a1badaf4eb.var_44d539868962a537[var_2eb4c3a1badaf4eb.starlevel]) {
        if (!isdefined(var_2eb4c3a1badaf4eb.var_be5918ef95f233b6)) {
            var_2eb4c3a1badaf4eb.var_be5918ef95f233b6 = var_2eb4c3a1badaf4eb.var_78c53731bd6bd662;
        } else if (var_2eb4c3a1badaf4eb.var_be5918ef95f233b6 <= 0) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_88b738f3cc56f24f/namespace_6a3f8c14894f44be
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1016
// Size: 0x195
function function_88249d3440778901(var_2eb4c3a1badaf4eb, var_ff838f13c8ca3b6c) {
    var_2eb4c3a1badaf4eb.starlevel--;
    var_2eb4c3a1badaf4eb.var_7444b7c0c103ea62 = var_ff838f13c8ca3b6c;
    function_d31c64471a8c8cdc(var_2eb4c3a1badaf4eb);
    playerlist = level.poi[var_2eb4c3a1badaf4eb.poi]["players"];
    roll = randomint(100);
    if (roll < 50) {
        namespace_446fc987a980892f::function_d87d5deb069bf8e5("stars_rank_down", playerlist);
    } else {
        namespace_446fc987a980892f::function_d87d5deb069bf8e5("stars_calming_down", playerlist);
    }
    var_805e6e206039fd0a = [];
    if (isdefined(var_2eb4c3a1badaf4eb.poi)) {
        foreach (var_d1cf55b36facf5a8 in level.poi[var_2eb4c3a1badaf4eb.poi]["subAreas"]) {
            var_805e6e206039fd0a = array_combine(var_805e6e206039fd0a, var_d1cf55b36facf5a8.var_3ebb6024e3f220ca);
        }
    } else {
        var_805e6e206039fd0a = level.agentarray;
    }
    foreach (agent in var_805e6e206039fd0a) {
        if (isalive(agent)) {
            namespace_6a3f8c14894f44be::function_e04dbe0bd8a25be7(agent, var_2eb4c3a1badaf4eb.starlevel);
        }
    }
}

// Namespace namespace_88b738f3cc56f24f/namespace_6a3f8c14894f44be
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11b2
// Size: 0x9e
function function_668252e0e3cbcb41(amount, var_171f90b9c4c76d44) {
    if (function_47d356083884f913()) {
        if (isdefined(var_171f90b9c4c76d44) && isdefined(level.var_2eb4c3a1badaf4eb[var_171f90b9c4c76d44])) {
            level.var_2eb4c3a1badaf4eb[var_171f90b9c4c76d44].var_bf18e3cc575bc1c8 = level.var_2eb4c3a1badaf4eb[var_171f90b9c4c76d44].var_bf18e3cc575bc1c8 + amount;
        } else {
            /#
                println("<unknown string>" + var_171f90b9c4c76d44);
            #/
        }
    } else {
        level.var_2eb4c3a1badaf4eb.var_bf18e3cc575bc1c8 = level.var_2eb4c3a1badaf4eb.var_bf18e3cc575bc1c8 + amount;
    }
}

// Namespace namespace_88b738f3cc56f24f/namespace_6a3f8c14894f44be
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1257
// Size: 0x115
function function_640ee18608181b8(var_2eb4c3a1badaf4eb) {
    var_a9c9cb0a720c01f6 = 0;
    var_c00a2d6249962fb6 = function_1d52040f64b0d854(var_2eb4c3a1badaf4eb.poi);
    hunt = var_c00a2d6249962fb6[3];
    combat = var_c00a2d6249962fb6[2];
    investigate = var_c00a2d6249962fb6[1];
    idle = var_c00a2d6249962fb6[0];
    var_2eb4c3a1badaf4eb.var_38951249a8cf8968 = idle;
    var_2eb4c3a1badaf4eb.var_fe385543116077b5 = investigate;
    var_2eb4c3a1badaf4eb.var_55cf9e4f74d2f4c2 = combat;
    var_2eb4c3a1badaf4eb.var_356bde2b53efa8cf = hunt;
    var_a9c9cb0a720c01f6 = var_a9c9cb0a720c01f6 + idle * level.var_1a6233bc0d61faf.var_764198b598038f7a;
    var_a9c9cb0a720c01f6 = var_a9c9cb0a720c01f6 + investigate * level.var_1a6233bc0d61faf.var_3459e3d70ae933c3;
    var_a9c9cb0a720c01f6 = var_a9c9cb0a720c01f6 + combat * level.var_1a6233bc0d61faf.var_7de1d17b0ef9138;
    var_a9c9cb0a720c01f6 = var_a9c9cb0a720c01f6 + hunt * level.var_1a6233bc0d61faf.var_814b1ca190ceb025;
    var_2eb4c3a1badaf4eb.var_bf18e3cc575bc1c8 = var_a9c9cb0a720c01f6;
}

// Namespace namespace_88b738f3cc56f24f/namespace_6a3f8c14894f44be
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1373
// Size: 0x1c6
function function_d1e1692b79b44bf7(var_2eb4c3a1badaf4eb) {
    var_a771008d267585f9 = getdvarint(@"hash_7e30f05f2889dc4d", 15);
    while (1) {
        wait(1);
        function_640ee18608181b8(var_2eb4c3a1badaf4eb);
        var_2eb4c3a1badaf4eb.var_924d5d49fde54cdd = var_2eb4c3a1badaf4eb.var_bf18e3cc575bc1c8;
        if (var_2eb4c3a1badaf4eb.var_bf18e3cc575bc1c8 > var_a771008d267585f9) {
            var_2eb4c3a1badaf4eb.var_bf18e3cc575bc1c8 = var_a771008d267585f9;
        } else if (var_2eb4c3a1badaf4eb.var_bf18e3cc575bc1c8 < var_a771008d267585f9 * -1) {
            var_2eb4c3a1badaf4eb.var_bf18e3cc575bc1c8 = var_a771008d267585f9 * -1;
        }
        var_ff838f13c8ca3b6c = var_2eb4c3a1badaf4eb.var_7444b7c0c103ea62 + var_2eb4c3a1badaf4eb.var_bf18e3cc575bc1c8;
        var_2eb4c3a1badaf4eb.var_bf18e3cc575bc1c8 = 0;
        if (var_ff838f13c8ca3b6c < 0) {
            var_ff838f13c8ca3b6c = 0;
        } else if (var_ff838f13c8ca3b6c > var_2eb4c3a1badaf4eb.var_ef957eb3f2da7e78) {
            var_ff838f13c8ca3b6c = var_2eb4c3a1badaf4eb.var_ef957eb3f2da7e78;
        }
        if (function_508b5fbdfb92174b(var_2eb4c3a1badaf4eb, var_ff838f13c8ca3b6c)) {
            var_4d40608a5b45999a = var_2eb4c3a1badaf4eb.starlevel + 1;
            if (!function_2e2c47dffa46541c(var_2eb4c3a1badaf4eb, var_ff838f13c8ca3b6c)) {
                if (var_ff838f13c8ca3b6c > var_2eb4c3a1badaf4eb.var_44d539868962a537[var_4d40608a5b45999a]) {
                    var_2eb4c3a1badaf4eb.var_7444b7c0c103ea62 = var_2eb4c3a1badaf4eb.var_44d539868962a537[var_4d40608a5b45999a];
                }
            } else {
                function_49cc3e444148f214(var_2eb4c3a1badaf4eb, var_ff838f13c8ca3b6c);
            }
        } else if (function_bea7986171a218fe(var_2eb4c3a1badaf4eb, var_ff838f13c8ca3b6c)) {
            if (!function_f4b18d11b00160c7(var_2eb4c3a1badaf4eb, var_ff838f13c8ca3b6c)) {
                if (var_ff838f13c8ca3b6c < var_2eb4c3a1badaf4eb.var_44d539868962a537[var_2eb4c3a1badaf4eb.starlevel]) {
                    var_2eb4c3a1badaf4eb.var_7444b7c0c103ea62 = var_2eb4c3a1badaf4eb.var_44d539868962a537[var_2eb4c3a1badaf4eb.starlevel];
                }
            } else {
                function_88249d3440778901(var_2eb4c3a1badaf4eb, var_ff838f13c8ca3b6c);
            }
        } else {
            var_2eb4c3a1badaf4eb.var_7444b7c0c103ea62 = var_ff838f13c8ca3b6c;
        }
    }
}

// Namespace namespace_88b738f3cc56f24f/namespace_6a3f8c14894f44be
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1540
// Size: 0xc
function function_980ebd5792a2c6cc(var_2eb4c3a1badaf4eb) {
    
}

// Namespace namespace_88b738f3cc56f24f/namespace_6a3f8c14894f44be
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1553
// Size: 0xc
function function_99234bd34375a46e(var_2eb4c3a1badaf4eb) {
    
}

// Namespace namespace_88b738f3cc56f24f/namespace_6a3f8c14894f44be
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1566
// Size: 0x68
function function_3b1d1540b3373bf3(var_2eb4c3a1badaf4eb) {
    playerlist = level.poi[var_2eb4c3a1badaf4eb.poi]["players"];
    roll = randomint(100);
    if (roll < 50) {
        namespace_446fc987a980892f::function_d87d5deb069bf8e5("dx_br_dmzo_star_ovld_thrs", playerlist);
    } else {
        namespace_446fc987a980892f::function_d87d5deb069bf8e5("dx_br_dmzo_wost_ovld_es01", playerlist);
    }
}

// Namespace namespace_88b738f3cc56f24f/namespace_6a3f8c14894f44be
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15d5
// Size: 0xa8
function function_48477dcd49a3487c(var_2eb4c3a1badaf4eb) {
    players = level.players;
    if (isdefined(var_2eb4c3a1badaf4eb.poi)) {
        players = level.poi[var_2eb4c3a1badaf4eb.poi]["players"];
    }
    playerlist = level.poi[var_2eb4c3a1badaf4eb.poi]["players"];
    roll = randomint(100);
    if (roll < 50) {
        namespace_446fc987a980892f::function_d87d5deb069bf8e5("dx_br_dmzo_star_ovld_frst", playerlist);
    } else {
        namespace_446fc987a980892f::function_d87d5deb069bf8e5("dx_br_dmzo_wost_ovld_es12", playerlist);
    }
}

// Namespace namespace_88b738f3cc56f24f/namespace_6a3f8c14894f44be
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1684
// Size: 0x112
function function_d1c66e3a420a3e98(var_2eb4c3a1badaf4eb) {
    if (getdvarint(@"hash_ed3aab295415580", 1) == 1) {
        return;
    }
    foreach (loc in var_2eb4c3a1badaf4eb.var_b3e0e8754c8036c1) {
        loc.ent = spawn("script_origin", loc.origin);
        loc.ent playsound("mp_dmz_alrm_star");
    }
    wait(10);
    foreach (loc in var_2eb4c3a1badaf4eb.var_b3e0e8754c8036c1) {
        if (isdefined(loc.ent)) {
            loc.ent delete();
        }
    }
}

// Namespace namespace_88b738f3cc56f24f/namespace_6a3f8c14894f44be
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x179d
// Size: 0x6b
function function_5cc0c507e92f7b47(var_171f90b9c4c76d44) {
    if (!function_ab9d237321cb489b()) {
        return 0;
    }
    var_2eb4c3a1badaf4eb = level.var_2eb4c3a1badaf4eb;
    if (function_47d356083884f913()) {
        if (!isdefined(var_171f90b9c4c76d44)) {
            return 0;
        }
        var_2eb4c3a1badaf4eb = level.var_2eb4c3a1badaf4eb[var_171f90b9c4c76d44];
    }
    if (!isdefined(var_2eb4c3a1badaf4eb)) {
        return 0;
    }
    if (!isdefined(var_2eb4c3a1badaf4eb.starlevel)) {
        return 0;
    }
    return var_2eb4c3a1badaf4eb.starlevel;
}

// Namespace namespace_88b738f3cc56f24f/namespace_6a3f8c14894f44be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1810
// Size: 0x13f
function function_5b1718fc79719cee() {
    level endon("game_ended");
    self endon("death");
    self endon("enter_combat");
    while (1) {
        ent_flag_wait("stealth_enabled");
        events = self waittill("ai_events");
        if (!ent_flag("stealth_enabled")) {
            continue;
        }
        foreach (event in events) {
            switch (event.type) {
            case #"hash_412938e72fd9ab35":
            case #"hash_46bae15508b25675":
            case #"hash_4b0ca4ada825424a":
            case #"hash_8c8ad07529b0fca6":
            case #"hash_c910677ee9c31085":
            case #"hash_de811d1d5fa7e6b4":
                break;
            case #"hash_9e02cd4a0f3ca981":
                level.var_2eb4c3a1badaf4eb.combat++;
                thread function_54cf9ed49d765153();
                break;
            default:
                break;
            }
            function_bc6f0a38c4a175ec(event.type);
        }
    }
}

// Namespace namespace_88b738f3cc56f24f/namespace_6a3f8c14894f44be
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1956
// Size: 0x3
function function_54cf9ed49d765153() {
    
}

// Namespace namespace_88b738f3cc56f24f/namespace_6a3f8c14894f44be
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1960
// Size: 0x63
function function_bc6f0a38c4a175ec(eventtype) {
    if (level.var_2eb4c3a1badaf4eb.var_e043daeb0eea11a5 == 10) {
        level.var_2eb4c3a1badaf4eb.var_e043daeb0eea11a5 = 0;
    }
    level.var_2eb4c3a1badaf4eb.var_6bb7cdea823d6703[level.var_2eb4c3a1badaf4eb.var_e043daeb0eea11a5] = eventtype;
}

// Namespace namespace_88b738f3cc56f24f/namespace_6a3f8c14894f44be
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19ca
// Size: 0x147
function function_e04dbe0bd8a25be7(agent, starlevel) {
    if (!function_ab9d237321cb489b()) {
        return;
    }
    var_a938130624194f25 = undefined;
    var_2d7f3cdc8b58d624 = undefined;
    var_8217369571009c81 = 0;
    if (!isdefined(starlevel)) {
        starlevel = 0;
    }
    if (isdefined(level.var_e429f4a597493802) && isdefined(level.var_e429f4a597493802[starlevel])) {
        var_469c0474ca81122 = level.var_e429f4a597493802[starlevel];
    } else {
        var_469c0474ca81122 = level.var_1a6233bc0d61faf.var_69271d52a93b872c[starlevel];
    }
    switch (starlevel) {
    case 0:
        var_a938130624194f25 = var_469c0474ca81122;
        var_2d7f3cdc8b58d624 = 5;
        break;
    case 1:
        var_a938130624194f25 = var_469c0474ca81122;
        var_2d7f3cdc8b58d624 = 6;
        break;
    case 2:
        var_a938130624194f25 = var_469c0474ca81122;
        var_2d7f3cdc8b58d624 = 7;
        break;
    case 3:
        var_a938130624194f25 = var_469c0474ca81122;
        var_2d7f3cdc8b58d624 = 8;
        var_8217369571009c81 = 1;
        break;
    case 4:
        var_a938130624194f25 = var_469c0474ca81122;
        var_2d7f3cdc8b58d624 = 10;
        var_8217369571009c81 = 1;
        break;
    default:
        var_a938130624194f25 = "star_0";
        var_2d7f3cdc8b58d624 = 5;
        break;
    }
    function_c9dad3876b9d8755(agent, var_a938130624194f25);
    function_f55d225b544277e8(agent, var_2d7f3cdc8b58d624);
    agent function_136adff8f817fad6(var_8217369571009c81);
}

// Namespace namespace_88b738f3cc56f24f/namespace_6a3f8c14894f44be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b18
// Size: 0x21c
function function_aea62ab225d060a9() {
    /#
        if (function_47d356083884f913()) {
            foreach (var_171f90b9c4c76d44, poi in level.poi) {
                if (isdefined(level.var_2eb4c3a1badaf4eb[var_171f90b9c4c76d44]) && level.var_2eb4c3a1badaf4eb[var_171f90b9c4c76d44].starlevel <= 4) {
                    if (level.var_2eb4c3a1badaf4eb[var_171f90b9c4c76d44].starlevel == 4) {
                        level.var_2eb4c3a1badaf4eb[var_171f90b9c4c76d44].var_7444b7c0c103ea62 = level.var_2eb4c3a1badaf4eb[var_171f90b9c4c76d44].var_ef957eb3f2da7e78;
                    } else {
                        var_624ebf2f1fe7ae21 = level.var_2eb4c3a1badaf4eb[var_171f90b9c4c76d44].starlevel + 1;
                        level.var_2eb4c3a1badaf4eb[var_171f90b9c4c76d44].var_7444b7c0c103ea62 = level.var_2eb4c3a1badaf4eb[var_171f90b9c4c76d44].var_44d539868962a537[var_624ebf2f1fe7ae21];
                        function_49cc3e444148f214(level.var_2eb4c3a1badaf4eb[var_171f90b9c4c76d44], level.var_2eb4c3a1badaf4eb[var_171f90b9c4c76d44].var_44d539868962a537[var_624ebf2f1fe7ae21]);
                    }
                }
            }
        } else if (isdefined(level.var_2eb4c3a1badaf4eb) && level.var_2eb4c3a1badaf4eb.starlevel < 4) {
            if (level.var_2eb4c3a1badaf4eb.starlevel == 4) {
                level.var_2eb4c3a1badaf4eb.var_7444b7c0c103ea62 = level.var_2eb4c3a1badaf4eb.var_ef957eb3f2da7e78;
            } else {
                var_624ebf2f1fe7ae21 = level.var_2eb4c3a1badaf4eb.starlevel + 1;
                level.var_2eb4c3a1badaf4eb.var_7444b7c0c103ea62 = level.var_2eb4c3a1badaf4eb.var_44d539868962a537[var_624ebf2f1fe7ae21];
                function_49cc3e444148f214(level.var_2eb4c3a1badaf4eb, level.var_2eb4c3a1badaf4eb.var_44d539868962a537[var_624ebf2f1fe7ae21]);
            }
        }
    #/
}

// Namespace namespace_88b738f3cc56f24f/namespace_6a3f8c14894f44be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d3b
// Size: 0x18e
function function_922b62afafec07a5() {
    /#
        if (function_47d356083884f913()) {
            foreach (var_171f90b9c4c76d44, poi in level.poi) {
                if (isdefined(level.var_2eb4c3a1badaf4eb[var_171f90b9c4c76d44]) && level.var_2eb4c3a1badaf4eb[var_171f90b9c4c76d44].starlevel > 0) {
                    var_624ebf2f1fe7ae21 = level.var_2eb4c3a1badaf4eb[var_171f90b9c4c76d44].starlevel - 1;
                    level.var_2eb4c3a1badaf4eb[var_171f90b9c4c76d44].var_7444b7c0c103ea62 = level.var_2eb4c3a1badaf4eb[var_171f90b9c4c76d44].var_44d539868962a537[var_624ebf2f1fe7ae21];
                    function_88249d3440778901(level.var_2eb4c3a1badaf4eb[var_171f90b9c4c76d44], level.var_2eb4c3a1badaf4eb[var_171f90b9c4c76d44].var_44d539868962a537[var_624ebf2f1fe7ae21]);
                }
            }
        } else if (isdefined(level.var_2eb4c3a1badaf4eb) && level.var_2eb4c3a1badaf4eb.starlevel > 0) {
            var_624ebf2f1fe7ae21 = level.var_2eb4c3a1badaf4eb.starlevel - 1;
            level.var_2eb4c3a1badaf4eb.var_7444b7c0c103ea62 = level.var_2eb4c3a1badaf4eb.var_44d539868962a537[var_624ebf2f1fe7ae21];
            function_88249d3440778901(level.var_2eb4c3a1badaf4eb, level.var_2eb4c3a1badaf4eb.var_44d539868962a537[var_624ebf2f1fe7ae21]);
        }
    #/
}

// Namespace namespace_88b738f3cc56f24f/namespace_6a3f8c14894f44be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ed0
// Size: 0xf5
function function_8b9921bd8271144b() {
    /#
        if (function_47d356083884f913()) {
            foreach (var_171f90b9c4c76d44, poi in level.poi) {
                if (isdefined(level.var_2eb4c3a1badaf4eb[var_171f90b9c4c76d44])) {
                    level.var_2eb4c3a1badaf4eb[var_171f90b9c4c76d44].var_a93671354b676c18 = level.var_1a6233bc0d61faf.var_b286a53c1d03306d[level.var_2eb4c3a1badaf4eb[var_171f90b9c4c76d44].starlevel];
                }
            }
        } else if (isdefined(level.var_2eb4c3a1badaf4eb)) {
            level.var_2eb4c3a1badaf4eb.var_a93671354b676c18 = level.var_1a6233bc0d61faf.var_b286a53c1d03306d[level.var_2eb4c3a1badaf4eb.starlevel];
        }
    #/
}

// Namespace namespace_88b738f3cc56f24f/namespace_6a3f8c14894f44be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fcc
// Size: 0x9c
function function_78e5d6d49021b584() {
    /#
        level endon("<unknown string>");
        while (1) {
            if (getdvarint(@"hash_6f76d29ebbddaa3a", 0) == 1) {
                function_aea62ab225d060a9();
                setdevdvar(@"hash_6f76d29ebbddaa3a", 0);
            }
            if (getdvarint(@"hash_404e567fa40e3be2", 0) == 1) {
                function_922b62afafec07a5();
                setdevdvar(@"hash_404e567fa40e3be2", 0);
            }
            if (getdvarint(@"hash_d2ff761cd005bbad", 0) == 1) {
                function_8b9921bd8271144b();
                setdevdvar(@"hash_d2ff761cd005bbad", 0);
            }
            wait(1);
        }
    #/
}

// Namespace namespace_88b738f3cc56f24f/namespace_6a3f8c14894f44be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x206f
// Size: 0x22c
function function_7b3bb02905678cfe() {
    /#
        playerlist = level.players;
        xpos = 700;
        ypos = 500;
        color = (1, 1, 1);
        scale = 2;
        duration = 90;
        waittime = 8;
        printtoscreen2d(xpos, ypos, "<unknown string>", color, scale, duration);
        wait(10);
        while (1) {
            playerlist = level.players;
            thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("<unknown string>", playerlist);
            printtoscreen2d(xpos, ypos, "<unknown string>", color, scale, duration);
            namespace_d696adde758cbe79::showDMZSplash("<unknown string>", level.players, "<unknown string>");
            wait(waittime);
            thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("<unknown string>", playerlist);
            printtoscreen2d(xpos, ypos, "<unknown string>", color, scale, duration);
            wait(waittime);
            thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("<unknown string>", playerlist);
            printtoscreen2d(xpos, ypos, "<unknown string>", color, scale, duration);
            namespace_d696adde758cbe79::showDMZSplash("<unknown string>", level.players, "<unknown string>");
            wait(waittime);
            thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("<unknown string>", playerlist);
            printtoscreen2d(xpos, ypos, "<unknown string>", color, scale, duration);
            wait(waittime);
            thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("<unknown string>", playerlist);
            printtoscreen2d(xpos, ypos, "<unknown string>", color, scale, duration);
            namespace_d696adde758cbe79::showDMZSplash("<unknown string>", level.players, "<unknown string>");
            wait(waittime);
            thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("<unknown string>", playerlist);
            printtoscreen2d(xpos, ypos, "<unknown string>", color, scale, duration);
            wait(waittime);
            thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("<unknown string>", playerlist);
            printtoscreen2d(xpos, ypos, "<unknown string>", color, scale, duration);
            namespace_d696adde758cbe79::showDMZSplash("<unknown string>", level.players, "<unknown string>");
            wait(waittime);
            thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("<unknown string>", playerlist);
            printtoscreen2d(xpos, ypos, "<unknown string>", color, scale, duration);
            wait(waittime);
            thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("<unknown string>", playerlist);
            printtoscreen2d(xpos, ypos, "<unknown string>", color, scale, duration);
            wait(waittime);
        }
    #/
}

// Namespace namespace_88b738f3cc56f24f/namespace_6a3f8c14894f44be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22a2
// Size: 0x267
function function_7273b2652941f86a() {
    /#
        wait(10);
        waittime = 10;
        while (1) {
            namespace_d696adde758cbe79::showDMZSplash("<unknown string>", level.players);
            thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("<unknown string>", level.players);
            wait(waittime);
            namespace_d696adde758cbe79::showDMZSplash("<unknown string>", level.players);
            thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("<unknown string>", level.players);
            wait(waittime);
            namespace_d696adde758cbe79::showDMZSplash("<unknown string>", level.players);
            thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("<unknown string>", level.players);
            wait(waittime);
            namespace_d696adde758cbe79::showDMZSplash("<unknown string>", level.players);
            thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("<unknown string>", level.players);
            wait(waittime);
            namespace_d696adde758cbe79::showDMZSplash("<unknown string>", level.players);
            thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("<unknown string>", level.players);
            wait(waittime);
            namespace_d696adde758cbe79::showDMZSplash("<unknown string>", level.players);
            thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("<unknown string>", level.players);
            wait(waittime);
            namespace_d696adde758cbe79::showDMZSplash("<unknown string>", level.players);
            thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("<unknown string>", level.players);
            wait(waittime);
            namespace_d696adde758cbe79::showDMZSplash("<unknown string>", level.players);
            thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("<unknown string>", level.players);
            wait(waittime);
            namespace_d696adde758cbe79::showDMZSplash("<unknown string>", level.players);
            thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("<unknown string>", level.players);
            wait(waittime);
            namespace_d696adde758cbe79::showDMZSplash("<unknown string>", level.players);
            thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("<unknown string>", level.players);
            wait(waittime);
            namespace_d696adde758cbe79::showDMZSplash("<unknown string>", level.players);
            thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("<unknown string>", level.players);
            wait(waittime);
            namespace_d696adde758cbe79::showDMZSplash("<unknown string>", level.players);
            thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("<unknown string>", level.players);
            wait(waittime);
            namespace_d696adde758cbe79::showDMZSplash("<unknown string>", level.players);
            thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("<unknown string>", level.players);
            wait(waittime);
        }
    #/
}

