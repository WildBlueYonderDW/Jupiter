// mwiii decomp prototype
#using scripts\unittest\util.gsc;

#namespace namespace_eb31a7ea746bf7d0;

// Namespace namespace_eb31a7ea746bf7d0/namespace_5c22773341178193
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ee
// Size: 0x3e0d
function function_29315e279f8c2ec1() {
    while (!(isdefined(level.players[0]) && isdefined(level.players) && isdefined(level.players[0].pers))) {
        waitframe();
    }
    test_begin("player.pers");
    player = level.players[0];
    var_252e3cc32bf76d20 = undefined;
    var_b74dcecaf09f8607 = undefined;
    var_7e7b315fcb2b9159 = undefined;
    arraycopy = undefined;
    test_print("-------------------------------------------------------------------------------");
    test_print("" + "Baseline");
    test_print("    player.pers.size             - " + (isdefined(player.pers) && isdefined(player.pers.size) ? "" + player.pers.size : "<UNDEFINED>"));
    test_print("    player.pers['ut_var']        - " + (isdefined(player.pers) && isdefined(player.pers["ut_var"]) ? "" + player.pers["ut_var"] : "<UNDEFINED>"));
    if (isdefined(player.pers["ut_struct"]) && isdefined(player.pers) && isdefined(player.pers["ut_struct"].b)) {
        goto LOC_000001c4;
    }
    test_print("" + player.pers["ut_struct"].b + "<UNDEFINED>", "    player.pers['ut_struct'].b   - ");
    test_print("    player.pers['ut_struct'].c   - " + (isdefined(player.pers["ut_struct"]) && isdefined(player.pers) && isdefined(player.pers["ut_struct"].c) ? "" + player.pers["ut_struct"].c : "<UNDEFINED>"));
    if (isdefined(player.pers["ut_array"]) && isdefined(player.pers) && isdefined(player.pers["ut_array"].size)) {
        goto LOC_000002a4;
    }
    test_print("" + player.pers["ut_array"].size + "<UNDEFINED>", "    player.pers['ut_array'].size - ");
    test_print("    player.pers['ut_array']['d'] - " + (isdefined(player.pers["ut_array"]) && isdefined(player.pers) && isdefined(player.pers["ut_array"]["d"]) ? "" + player.pers["ut_array"]["d"] : "<UNDEFINED>"));
    if (isdefined(player.pers["ut_array"]) && isdefined(player.pers) && isdefined(player.pers["ut_array"]["e"])) {
        goto LOC_00000386;
    }
    test_print("" + player.pers["ut_array"]["e"] + "<UNDEFINED>", "    player.pers['ut_array']['e'] - ");
    if (isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20.size)) {
        goto LOC_000003ae;
    }
    test_print("" + var_252e3cc32bf76d20.size + "<UNDEFINED>", "    persCopy.size                - ");
    if (isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_var"])) {
        goto LOC_000003e0;
    }
    test_print("" + var_252e3cc32bf76d20["ut_var"] + "<UNDEFINED>", "    persCopy['ut_var']           - ");
    test_print("    persCopy['ut_struct'].b      - " + (isdefined(var_252e3cc32bf76d20["ut_struct"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_struct"].b) ? "" + var_252e3cc32bf76d20["ut_struct"].b : "<UNDEFINED>"));
    if (isdefined(var_252e3cc32bf76d20["ut_struct"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_struct"].c)) {
        goto LOC_00000482;
    }
    test_print("" + var_252e3cc32bf76d20["ut_struct"].c + "<UNDEFINED>", "    persCopy['ut_struct'].c      - ");
    test_print("    persCopy['ut_array'].size    - " + (isdefined(var_252e3cc32bf76d20["ut_array"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_array"].size) ? "" + var_252e3cc32bf76d20["ut_array"].size : "<UNDEFINED>"));
    if (isdefined(var_252e3cc32bf76d20["ut_array"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_array"]["d"])) {
        goto LOC_0000050a;
    }
    test_print("" + var_252e3cc32bf76d20["ut_array"]["d"] + "<UNDEFINED>", "    persCopy['ut_array']['d']    - ");
    test_print("    persCopy['ut_array']['e']    - " + (isdefined(var_252e3cc32bf76d20["ut_array"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_array"]["e"]) ? "" + var_252e3cc32bf76d20["ut_array"]["e"] : "<UNDEFINED>"));
    if (isdefined(var_b74dcecaf09f8607)) {
        goto LOC_00000574;
    }
    test_print("" + var_b74dcecaf09f8607 + "<UNDEFINED>", "    varCopy                      - ");
    if (isdefined(var_7e7b315fcb2b9159) && isdefined(var_7e7b315fcb2b9159.b)) {
        goto LOC_000005ae;
    }
    test_print("" + var_7e7b315fcb2b9159.b + "<UNDEFINED>", "    structCopy.b                 - ");
    if (isdefined(var_7e7b315fcb2b9159) && isdefined(var_7e7b315fcb2b9159.c)) {
        goto LOC_000005e8;
    }
    test_print("" + var_7e7b315fcb2b9159.c + "<UNDEFINED>", "    structCopy.c                 - ");
    if (isdefined(arraycopy) && isdefined(arraycopy.size)) {
        goto LOC_00000610;
    }
    test_print("" + arraycopy.size + "<UNDEFINED>", "    arrayCopy.size               - ");
    if (isdefined(arraycopy) && isdefined(arraycopy["d"])) {
        goto LOC_00000642;
    }
    test_print("" + arraycopy["d"] + "<UNDEFINED>", "    arrayCopy['d']               - ");
    if (isdefined(arraycopy) && isdefined(arraycopy["e"])) {
        goto LOC_00000674;
    }
    test_print("" + arraycopy["e"] + "<UNDEFINED>", "    arrayCopy['e']               - ");
    var_b74dcecaf09f8607 = player.pers["ut_var"];
    var_7e7b315fcb2b9159 = player.pers["ut_struct"];
    arraycopy = player.pers["ut_array"];
    test_print("-------------------------------------------------------------------------------");
    test_print("" + "Read non-existent variables");
    test_print("    player.pers.size             - " + (isdefined(player.pers) && isdefined(player.pers.size) ? "" + player.pers.size : "<UNDEFINED>"));
    test_print("    player.pers['ut_var']        - " + (isdefined(player.pers) && isdefined(player.pers["ut_var"]) ? "" + player.pers["ut_var"] : "<UNDEFINED>"));
    if (isdefined(player.pers["ut_struct"]) && isdefined(player.pers) && isdefined(player.pers["ut_struct"].b)) {
        goto LOC_000007da;
    }
    test_print("" + player.pers["ut_struct"].b + "<UNDEFINED>", "    player.pers['ut_struct'].b   - ");
    test_print("    player.pers['ut_struct'].c   - " + (isdefined(player.pers["ut_struct"]) && isdefined(player.pers) && isdefined(player.pers["ut_struct"].c) ? "" + player.pers["ut_struct"].c : "<UNDEFINED>"));
    if (isdefined(player.pers["ut_array"]) && isdefined(player.pers) && isdefined(player.pers["ut_array"].size)) {
        goto LOC_000008ba;
    }
    test_print("" + player.pers["ut_array"].size + "<UNDEFINED>", "    player.pers['ut_array'].size - ");
    test_print("    player.pers['ut_array']['d'] - " + (isdefined(player.pers["ut_array"]) && isdefined(player.pers) && isdefined(player.pers["ut_array"]["d"]) ? "" + player.pers["ut_array"]["d"] : "<UNDEFINED>"));
    if (isdefined(player.pers["ut_array"]) && isdefined(player.pers) && isdefined(player.pers["ut_array"]["e"])) {
        goto LOC_0000099c;
    }
    test_print("" + player.pers["ut_array"]["e"] + "<UNDEFINED>", "    player.pers['ut_array']['e'] - ");
    if (isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20.size)) {
        goto LOC_000009c4;
    }
    test_print("" + var_252e3cc32bf76d20.size + "<UNDEFINED>", "    persCopy.size                - ");
    if (isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_var"])) {
        goto LOC_000009f6;
    }
    test_print("" + var_252e3cc32bf76d20["ut_var"] + "<UNDEFINED>", "    persCopy['ut_var']           - ");
    test_print("    persCopy['ut_struct'].b      - " + (isdefined(var_252e3cc32bf76d20["ut_struct"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_struct"].b) ? "" + var_252e3cc32bf76d20["ut_struct"].b : "<UNDEFINED>"));
    if (isdefined(var_252e3cc32bf76d20["ut_struct"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_struct"].c)) {
        goto LOC_00000a98;
    }
    test_print("" + var_252e3cc32bf76d20["ut_struct"].c + "<UNDEFINED>", "    persCopy['ut_struct'].c      - ");
    test_print("    persCopy['ut_array'].size    - " + (isdefined(var_252e3cc32bf76d20["ut_array"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_array"].size) ? "" + var_252e3cc32bf76d20["ut_array"].size : "<UNDEFINED>"));
    if (isdefined(var_252e3cc32bf76d20["ut_array"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_array"]["d"])) {
        goto LOC_00000b20;
    }
    test_print("" + var_252e3cc32bf76d20["ut_array"]["d"] + "<UNDEFINED>", "    persCopy['ut_array']['d']    - ");
    test_print("    persCopy['ut_array']['e']    - " + (isdefined(var_252e3cc32bf76d20["ut_array"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_array"]["e"]) ? "" + var_252e3cc32bf76d20["ut_array"]["e"] : "<UNDEFINED>"));
    if (isdefined(var_b74dcecaf09f8607)) {
        goto LOC_00000b8a;
    }
    test_print("" + var_b74dcecaf09f8607 + "<UNDEFINED>", "    varCopy                      - ");
    if (isdefined(var_7e7b315fcb2b9159) && isdefined(var_7e7b315fcb2b9159.b)) {
        goto LOC_00000bc4;
    }
    test_print("" + var_7e7b315fcb2b9159.b + "<UNDEFINED>", "    structCopy.b                 - ");
    if (isdefined(var_7e7b315fcb2b9159) && isdefined(var_7e7b315fcb2b9159.c)) {
        goto LOC_00000bfe;
    }
    test_print("" + var_7e7b315fcb2b9159.c + "<UNDEFINED>", "    structCopy.c                 - ");
    if (isdefined(arraycopy) && isdefined(arraycopy.size)) {
        goto LOC_00000c26;
    }
    test_print("" + arraycopy.size + "<UNDEFINED>", "    arrayCopy.size               - ");
    if (isdefined(arraycopy) && isdefined(arraycopy["d"])) {
        goto LOC_00000c58;
    }
    test_print("" + arraycopy["d"] + "<UNDEFINED>", "    arrayCopy['d']               - ");
    if (isdefined(arraycopy) && isdefined(arraycopy["e"])) {
        goto LOC_00000c8a;
    }
    test_print("" + arraycopy["e"] + "<UNDEFINED>", "    arrayCopy['e']               - ");
    var_252e3cc32bf76d20 = player.pers;
    test_print("-------------------------------------------------------------------------------");
    test_print("" + "Make copy of player.pers");
    test_print("    player.pers.size             - " + (isdefined(player.pers) && isdefined(player.pers.size) ? "" + player.pers.size : "<UNDEFINED>"));
    test_print("    player.pers['ut_var']        - " + (isdefined(player.pers) && isdefined(player.pers["ut_var"]) ? "" + player.pers["ut_var"] : "<UNDEFINED>"));
    if (isdefined(player.pers["ut_struct"]) && isdefined(player.pers) && isdefined(player.pers["ut_struct"].b)) {
        goto LOC_00000dc4;
    }
    test_print("" + player.pers["ut_struct"].b + "<UNDEFINED>", "    player.pers['ut_struct'].b   - ");
    test_print("    player.pers['ut_struct'].c   - " + (isdefined(player.pers["ut_struct"]) && isdefined(player.pers) && isdefined(player.pers["ut_struct"].c) ? "" + player.pers["ut_struct"].c : "<UNDEFINED>"));
    if (isdefined(player.pers["ut_array"]) && isdefined(player.pers) && isdefined(player.pers["ut_array"].size)) {
        goto LOC_00000ea4;
    }
    test_print("" + player.pers["ut_array"].size + "<UNDEFINED>", "    player.pers['ut_array'].size - ");
    test_print("    player.pers['ut_array']['d'] - " + (isdefined(player.pers["ut_array"]) && isdefined(player.pers) && isdefined(player.pers["ut_array"]["d"]) ? "" + player.pers["ut_array"]["d"] : "<UNDEFINED>"));
    if (isdefined(player.pers["ut_array"]) && isdefined(player.pers) && isdefined(player.pers["ut_array"]["e"])) {
        goto LOC_00000f86;
    }
    test_print("" + player.pers["ut_array"]["e"] + "<UNDEFINED>", "    player.pers['ut_array']['e'] - ");
    if (isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20.size)) {
        goto LOC_00000fae;
    }
    test_print("" + var_252e3cc32bf76d20.size + "<UNDEFINED>", "    persCopy.size                - ");
    if (isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_var"])) {
        goto LOC_00000fe0;
    }
    test_print("" + var_252e3cc32bf76d20["ut_var"] + "<UNDEFINED>", "    persCopy['ut_var']           - ");
    test_print("    persCopy['ut_struct'].b      - " + (isdefined(var_252e3cc32bf76d20["ut_struct"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_struct"].b) ? "" + var_252e3cc32bf76d20["ut_struct"].b : "<UNDEFINED>"));
    if (isdefined(var_252e3cc32bf76d20["ut_struct"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_struct"].c)) {
        goto LOC_00001082;
    }
    test_print("" + var_252e3cc32bf76d20["ut_struct"].c + "<UNDEFINED>", "    persCopy['ut_struct'].c      - ");
    test_print("    persCopy['ut_array'].size    - " + (isdefined(var_252e3cc32bf76d20["ut_array"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_array"].size) ? "" + var_252e3cc32bf76d20["ut_array"].size : "<UNDEFINED>"));
    if (isdefined(var_252e3cc32bf76d20["ut_array"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_array"]["d"])) {
        goto LOC_0000110a;
    }
    test_print("" + var_252e3cc32bf76d20["ut_array"]["d"] + "<UNDEFINED>", "    persCopy['ut_array']['d']    - ");
    test_print("    persCopy['ut_array']['e']    - " + (isdefined(var_252e3cc32bf76d20["ut_array"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_array"]["e"]) ? "" + var_252e3cc32bf76d20["ut_array"]["e"] : "<UNDEFINED>"));
    if (isdefined(var_b74dcecaf09f8607)) {
        goto LOC_00001174;
    }
    test_print("" + var_b74dcecaf09f8607 + "<UNDEFINED>", "    varCopy                      - ");
    if (isdefined(var_7e7b315fcb2b9159) && isdefined(var_7e7b315fcb2b9159.b)) {
        goto LOC_000011ae;
    }
    test_print("" + var_7e7b315fcb2b9159.b + "<UNDEFINED>", "    structCopy.b                 - ");
    if (isdefined(var_7e7b315fcb2b9159) && isdefined(var_7e7b315fcb2b9159.c)) {
        goto LOC_000011e8;
    }
    test_print("" + var_7e7b315fcb2b9159.c + "<UNDEFINED>", "    structCopy.c                 - ");
    if (isdefined(arraycopy) && isdefined(arraycopy.size)) {
        goto LOC_00001210;
    }
    test_print("" + arraycopy.size + "<UNDEFINED>", "    arrayCopy.size               - ");
    if (isdefined(arraycopy) && isdefined(arraycopy["d"])) {
        goto LOC_00001242;
    }
    test_print("" + arraycopy["d"] + "<UNDEFINED>", "    arrayCopy['d']               - ");
    if (isdefined(arraycopy) && isdefined(arraycopy["e"])) {
        goto LOC_00001274;
    }
    test_print("" + arraycopy["e"] + "<UNDEFINED>", "    arrayCopy['e']               - ");
    player.pers["ut_var"] = "a";
    s1 = spawnstruct();
    s1.b = "b";
    s1.c = "c";
    player.pers["ut_struct"] = s1;
    var_ce0ee878f55f5e93 = [];
    var_ce0ee878f55f5e93["d"] = "d";
    var_ce0ee878f55f5e93["e"] = "e";
    player.pers["ut_array"] = var_ce0ee878f55f5e93;
    test_print("-------------------------------------------------------------------------------");
    test_print("" + "Add new fields to player.pers");
    test_print("    player.pers.size             - " + (isdefined(player.pers) && isdefined(player.pers.size) ? "" + player.pers.size : "<UNDEFINED>"));
    test_print("    player.pers['ut_var']        - " + (isdefined(player.pers) && isdefined(player.pers["ut_var"]) ? "" + player.pers["ut_var"] : "<UNDEFINED>"));
    if (isdefined(player.pers["ut_struct"]) && isdefined(player.pers) && isdefined(player.pers["ut_struct"].b)) {
        goto LOC_00001424;
    }
    test_print("" + player.pers["ut_struct"].b + "<UNDEFINED>", "    player.pers['ut_struct'].b   - ");
    test_print("    player.pers['ut_struct'].c   - " + (isdefined(player.pers["ut_struct"]) && isdefined(player.pers) && isdefined(player.pers["ut_struct"].c) ? "" + player.pers["ut_struct"].c : "<UNDEFINED>"));
    if (isdefined(player.pers["ut_array"]) && isdefined(player.pers) && isdefined(player.pers["ut_array"].size)) {
        goto LOC_00001504;
    }
    test_print("" + player.pers["ut_array"].size + "<UNDEFINED>", "    player.pers['ut_array'].size - ");
    test_print("    player.pers['ut_array']['d'] - " + (isdefined(player.pers["ut_array"]) && isdefined(player.pers) && isdefined(player.pers["ut_array"]["d"]) ? "" + player.pers["ut_array"]["d"] : "<UNDEFINED>"));
    if (isdefined(player.pers["ut_array"]) && isdefined(player.pers) && isdefined(player.pers["ut_array"]["e"])) {
        goto LOC_000015e6;
    }
    test_print("" + player.pers["ut_array"]["e"] + "<UNDEFINED>", "    player.pers['ut_array']['e'] - ");
    if (isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20.size)) {
        goto LOC_0000160e;
    }
    test_print("" + var_252e3cc32bf76d20.size + "<UNDEFINED>", "    persCopy.size                - ");
    if (isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_var"])) {
        goto LOC_00001640;
    }
    test_print("" + var_252e3cc32bf76d20["ut_var"] + "<UNDEFINED>", "    persCopy['ut_var']           - ");
    test_print("    persCopy['ut_struct'].b      - " + (isdefined(var_252e3cc32bf76d20["ut_struct"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_struct"].b) ? "" + var_252e3cc32bf76d20["ut_struct"].b : "<UNDEFINED>"));
    if (isdefined(var_252e3cc32bf76d20["ut_struct"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_struct"].c)) {
        goto LOC_000016e2;
    }
    test_print("" + var_252e3cc32bf76d20["ut_struct"].c + "<UNDEFINED>", "    persCopy['ut_struct'].c      - ");
    test_print("    persCopy['ut_array'].size    - " + (isdefined(var_252e3cc32bf76d20["ut_array"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_array"].size) ? "" + var_252e3cc32bf76d20["ut_array"].size : "<UNDEFINED>"));
    if (isdefined(var_252e3cc32bf76d20["ut_array"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_array"]["d"])) {
        goto LOC_0000176a;
    }
    test_print("" + var_252e3cc32bf76d20["ut_array"]["d"] + "<UNDEFINED>", "    persCopy['ut_array']['d']    - ");
    test_print("    persCopy['ut_array']['e']    - " + (isdefined(var_252e3cc32bf76d20["ut_array"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_array"]["e"]) ? "" + var_252e3cc32bf76d20["ut_array"]["e"] : "<UNDEFINED>"));
    if (isdefined(var_b74dcecaf09f8607)) {
        goto LOC_000017d4;
    }
    test_print("" + var_b74dcecaf09f8607 + "<UNDEFINED>", "    varCopy                      - ");
    if (isdefined(var_7e7b315fcb2b9159) && isdefined(var_7e7b315fcb2b9159.b)) {
        goto LOC_0000180e;
    }
    test_print("" + var_7e7b315fcb2b9159.b + "<UNDEFINED>", "    structCopy.b                 - ");
    if (isdefined(var_7e7b315fcb2b9159) && isdefined(var_7e7b315fcb2b9159.c)) {
        goto LOC_00001848;
    }
    test_print("" + var_7e7b315fcb2b9159.c + "<UNDEFINED>", "    structCopy.c                 - ");
    if (isdefined(arraycopy) && isdefined(arraycopy.size)) {
        goto LOC_00001870;
    }
    test_print("" + arraycopy.size + "<UNDEFINED>", "    arrayCopy.size               - ");
    if (isdefined(arraycopy) && isdefined(arraycopy["d"])) {
        goto LOC_000018a2;
    }
    test_print("" + arraycopy["d"] + "<UNDEFINED>", "    arrayCopy['d']               - ");
    if (isdefined(arraycopy) && isdefined(arraycopy["e"])) {
        goto LOC_000018d4;
    }
    test_print("" + arraycopy["e"] + "<UNDEFINED>", "    arrayCopy['e']               - ");
    var_252e3cc32bf76d20 = player.pers;
    var_b74dcecaf09f8607 = player.pers["ut_var"];
    var_7e7b315fcb2b9159 = player.pers["ut_struct"];
    arraycopy = player.pers["ut_array"];
    test_print("-------------------------------------------------------------------------------");
    test_print("" + "Re-copy everything from player.pers");
    if (isdefined(player.pers) && isdefined(player.pers.size)) {
        goto LOC_0000197e;
    }
    test_print("" + player.pers.size + "<UNDEFINED>", "    player.pers.size             - ");
    if (isdefined(player.pers) && isdefined(player.pers["ut_var"])) {
        goto LOC_000019ce;
    }
    test_print("" + player.pers["ut_var"] + "<UNDEFINED>", "    player.pers['ut_var']        - ");
    test_print("    player.pers['ut_struct'].b   - " + (isdefined(player.pers["ut_struct"]) && isdefined(player.pers) && isdefined(player.pers["ut_struct"].b) ? "" + player.pers["ut_struct"].b : "<UNDEFINED>"));
    if (isdefined(player.pers["ut_struct"]) && isdefined(player.pers) && isdefined(player.pers["ut_struct"].c)) {
        goto LOC_00001ac0;
    }
    test_print("" + player.pers["ut_struct"].c + "<UNDEFINED>", "    player.pers['ut_struct'].c   - ");
    test_print("    player.pers['ut_array'].size - " + (isdefined(player.pers["ut_array"]) && isdefined(player.pers) && isdefined(player.pers["ut_array"].size) ? "" + player.pers["ut_array"].size : "<UNDEFINED>"));
    if (isdefined(player.pers["ut_array"]) && isdefined(player.pers) && isdefined(player.pers["ut_array"]["d"])) {
        goto LOC_00001b98;
    }
    test_print("" + player.pers["ut_array"]["d"] + "<UNDEFINED>", "    player.pers['ut_array']['d'] - ");
    test_print("    player.pers['ut_array']['e'] - " + (isdefined(player.pers["ut_array"]) && isdefined(player.pers) && isdefined(player.pers["ut_array"]["e"]) ? "" + player.pers["ut_array"]["e"] : "<UNDEFINED>"));
    test_print("    persCopy.size                - " + (isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20.size) ? "" + var_252e3cc32bf76d20.size : "<UNDEFINED>"));
    test_print("    persCopy['ut_var']           - " + (isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_var"]) ? "" + var_252e3cc32bf76d20["ut_var"] : "<UNDEFINED>"));
    if (isdefined(var_252e3cc32bf76d20["ut_struct"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_struct"].b)) {
        goto LOC_00001cb4;
    }
    test_print("" + var_252e3cc32bf76d20["ut_struct"].b + "<UNDEFINED>", "    persCopy['ut_struct'].b      - ");
    test_print("    persCopy['ut_struct'].c      - " + (isdefined(var_252e3cc32bf76d20["ut_struct"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_struct"].c) ? "" + var_252e3cc32bf76d20["ut_struct"].c : "<UNDEFINED>"));
    if (isdefined(var_252e3cc32bf76d20["ut_array"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_array"].size)) {
        goto LOC_00001d44;
    }
    test_print("" + var_252e3cc32bf76d20["ut_array"].size + "<UNDEFINED>", "    persCopy['ut_array'].size    - ");
    test_print("    persCopy['ut_array']['d']    - " + (isdefined(var_252e3cc32bf76d20["ut_array"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_array"]["d"]) ? "" + var_252e3cc32bf76d20["ut_array"]["d"] : "<UNDEFINED>"));
    if (isdefined(var_252e3cc32bf76d20["ut_array"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_array"]["e"])) {
        goto LOC_00001dd6;
    }
    test_print("" + var_252e3cc32bf76d20["ut_array"]["e"] + "<UNDEFINED>", "    persCopy['ut_array']['e']    - ");
    test_print("    varCopy                      - " + (isdefined(var_b74dcecaf09f8607) ? "" + var_b74dcecaf09f8607 : "<UNDEFINED>"));
    test_print("    structCopy.b                 - " + (isdefined(var_7e7b315fcb2b9159) && isdefined(var_7e7b315fcb2b9159.b) ? "" + var_7e7b315fcb2b9159.b : "<UNDEFINED>"));
    test_print("    structCopy.c                 - " + (isdefined(var_7e7b315fcb2b9159) && isdefined(var_7e7b315fcb2b9159.c) ? "" + var_7e7b315fcb2b9159.c : "<UNDEFINED>"));
    test_print("    arrayCopy.size               - " + (isdefined(arraycopy) && isdefined(arraycopy.size) ? "" + arraycopy.size : "<UNDEFINED>"));
    test_print("    arrayCopy['d']               - " + (isdefined(arraycopy) && isdefined(arraycopy["d"]) ? "" + arraycopy["d"] : "<UNDEFINED>"));
    test_print("    arrayCopy['e']               - " + (isdefined(arraycopy) && isdefined(arraycopy["e"]) ? "" + arraycopy["e"] : "<UNDEFINED>"));
    var_252e3cc32bf76d20["ut_var"] = "aa";
    var_252e3cc32bf76d20["ut_struct"].b = "bb";
    var_252e3cc32bf76d20["ut_struct"].c = "cc";
    var_252e3cc32bf76d20["ut_array"]["d"] = "dd";
    var_252e3cc32bf76d20["ut_array"]["e"] = "ee";
    test_print("-------------------------------------------------------------------------------");
    test_print("" + "Update player.pers copy fields");
    if (isdefined(player.pers) && isdefined(player.pers.size)) {
        goto LOC_00001fbc;
    }
    test_print("" + player.pers.size + "<UNDEFINED>", "    player.pers.size             - ");
    if (isdefined(player.pers) && isdefined(player.pers["ut_var"])) {
        goto LOC_0000200c;
    }
    test_print("" + player.pers["ut_var"] + "<UNDEFINED>", "    player.pers['ut_var']        - ");
    test_print("    player.pers['ut_struct'].b   - " + (isdefined(player.pers["ut_struct"]) && isdefined(player.pers) && isdefined(player.pers["ut_struct"].b) ? "" + player.pers["ut_struct"].b : "<UNDEFINED>"));
    if (isdefined(player.pers["ut_struct"]) && isdefined(player.pers) && isdefined(player.pers["ut_struct"].c)) {
        goto LOC_000020fe;
    }
    test_print("" + player.pers["ut_struct"].c + "<UNDEFINED>", "    player.pers['ut_struct'].c   - ");
    test_print("    player.pers['ut_array'].size - " + (isdefined(player.pers["ut_array"]) && isdefined(player.pers) && isdefined(player.pers["ut_array"].size) ? "" + player.pers["ut_array"].size : "<UNDEFINED>"));
    if (isdefined(player.pers["ut_array"]) && isdefined(player.pers) && isdefined(player.pers["ut_array"]["d"])) {
        goto LOC_000021d6;
    }
    test_print("" + player.pers["ut_array"]["d"] + "<UNDEFINED>", "    player.pers['ut_array']['d'] - ");
    test_print("    player.pers['ut_array']['e'] - " + (isdefined(player.pers["ut_array"]) && isdefined(player.pers) && isdefined(player.pers["ut_array"]["e"]) ? "" + player.pers["ut_array"]["e"] : "<UNDEFINED>"));
    test_print("    persCopy.size                - " + (isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20.size) ? "" + var_252e3cc32bf76d20.size : "<UNDEFINED>"));
    test_print("    persCopy['ut_var']           - " + (isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_var"]) ? "" + var_252e3cc32bf76d20["ut_var"] : "<UNDEFINED>"));
    if (isdefined(var_252e3cc32bf76d20["ut_struct"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_struct"].b)) {
        goto LOC_000022f2;
    }
    test_print("" + var_252e3cc32bf76d20["ut_struct"].b + "<UNDEFINED>", "    persCopy['ut_struct'].b      - ");
    test_print("    persCopy['ut_struct'].c      - " + (isdefined(var_252e3cc32bf76d20["ut_struct"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_struct"].c) ? "" + var_252e3cc32bf76d20["ut_struct"].c : "<UNDEFINED>"));
    if (isdefined(var_252e3cc32bf76d20["ut_array"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_array"].size)) {
        goto LOC_00002382;
    }
    test_print("" + var_252e3cc32bf76d20["ut_array"].size + "<UNDEFINED>", "    persCopy['ut_array'].size    - ");
    test_print("    persCopy['ut_array']['d']    - " + (isdefined(var_252e3cc32bf76d20["ut_array"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_array"]["d"]) ? "" + var_252e3cc32bf76d20["ut_array"]["d"] : "<UNDEFINED>"));
    if (isdefined(var_252e3cc32bf76d20["ut_array"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_array"]["e"])) {
        goto LOC_00002414;
    }
    test_print("" + var_252e3cc32bf76d20["ut_array"]["e"] + "<UNDEFINED>", "    persCopy['ut_array']['e']    - ");
    test_print("    varCopy                      - " + (isdefined(var_b74dcecaf09f8607) ? "" + var_b74dcecaf09f8607 : "<UNDEFINED>"));
    test_print("    structCopy.b                 - " + (isdefined(var_7e7b315fcb2b9159) && isdefined(var_7e7b315fcb2b9159.b) ? "" + var_7e7b315fcb2b9159.b : "<UNDEFINED>"));
    test_print("    structCopy.c                 - " + (isdefined(var_7e7b315fcb2b9159) && isdefined(var_7e7b315fcb2b9159.c) ? "" + var_7e7b315fcb2b9159.c : "<UNDEFINED>"));
    test_print("    arrayCopy.size               - " + (isdefined(arraycopy) && isdefined(arraycopy.size) ? "" + arraycopy.size : "<UNDEFINED>"));
    test_print("    arrayCopy['d']               - " + (isdefined(arraycopy) && isdefined(arraycopy["d"]) ? "" + arraycopy["d"] : "<UNDEFINED>"));
    test_print("    arrayCopy['e']               - " + (isdefined(arraycopy) && isdefined(arraycopy["e"]) ? "" + arraycopy["e"] : "<UNDEFINED>"));
    var_b74dcecaf09f8607 = "aaa";
    var_7e7b315fcb2b9159.b = "bbb";
    var_7e7b315fcb2b9159.c = "ccc";
    arraycopy["d"] = "ddd";
    arraycopy["e"] = "eee";
    test_print("-------------------------------------------------------------------------------");
    test_print("" + "Update the copies");
    if (isdefined(player.pers) && isdefined(player.pers.size)) {
        goto LOC_000025dc;
    }
    test_print("" + player.pers.size + "<UNDEFINED>", "    player.pers.size             - ");
    if (isdefined(player.pers) && isdefined(player.pers["ut_var"])) {
        goto LOC_0000262c;
    }
    test_print("" + player.pers["ut_var"] + "<UNDEFINED>", "    player.pers['ut_var']        - ");
    test_print("    player.pers['ut_struct'].b   - " + (isdefined(player.pers["ut_struct"]) && isdefined(player.pers) && isdefined(player.pers["ut_struct"].b) ? "" + player.pers["ut_struct"].b : "<UNDEFINED>"));
    if (isdefined(player.pers["ut_struct"]) && isdefined(player.pers) && isdefined(player.pers["ut_struct"].c)) {
        goto LOC_0000271e;
    }
    test_print("" + player.pers["ut_struct"].c + "<UNDEFINED>", "    player.pers['ut_struct'].c   - ");
    test_print("    player.pers['ut_array'].size - " + (isdefined(player.pers["ut_array"]) && isdefined(player.pers) && isdefined(player.pers["ut_array"].size) ? "" + player.pers["ut_array"].size : "<UNDEFINED>"));
    if (isdefined(player.pers["ut_array"]) && isdefined(player.pers) && isdefined(player.pers["ut_array"]["d"])) {
        goto LOC_000027f6;
    }
    test_print("" + player.pers["ut_array"]["d"] + "<UNDEFINED>", "    player.pers['ut_array']['d'] - ");
    test_print("    player.pers['ut_array']['e'] - " + (isdefined(player.pers["ut_array"]) && isdefined(player.pers) && isdefined(player.pers["ut_array"]["e"]) ? "" + player.pers["ut_array"]["e"] : "<UNDEFINED>"));
    test_print("    persCopy.size                - " + (isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20.size) ? "" + var_252e3cc32bf76d20.size : "<UNDEFINED>"));
    test_print("    persCopy['ut_var']           - " + (isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_var"]) ? "" + var_252e3cc32bf76d20["ut_var"] : "<UNDEFINED>"));
    if (isdefined(var_252e3cc32bf76d20["ut_struct"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_struct"].b)) {
        goto LOC_00002912;
    }
    test_print("" + var_252e3cc32bf76d20["ut_struct"].b + "<UNDEFINED>", "    persCopy['ut_struct'].b      - ");
    test_print("    persCopy['ut_struct'].c      - " + (isdefined(var_252e3cc32bf76d20["ut_struct"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_struct"].c) ? "" + var_252e3cc32bf76d20["ut_struct"].c : "<UNDEFINED>"));
    if (isdefined(var_252e3cc32bf76d20["ut_array"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_array"].size)) {
        goto LOC_000029a2;
    }
    test_print("" + var_252e3cc32bf76d20["ut_array"].size + "<UNDEFINED>", "    persCopy['ut_array'].size    - ");
    test_print("    persCopy['ut_array']['d']    - " + (isdefined(var_252e3cc32bf76d20["ut_array"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_array"]["d"]) ? "" + var_252e3cc32bf76d20["ut_array"]["d"] : "<UNDEFINED>"));
    if (isdefined(var_252e3cc32bf76d20["ut_array"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_array"]["e"])) {
        goto LOC_00002a34;
    }
    test_print("" + var_252e3cc32bf76d20["ut_array"]["e"] + "<UNDEFINED>", "    persCopy['ut_array']['e']    - ");
    test_print("    varCopy                      - " + (isdefined(var_b74dcecaf09f8607) ? "" + var_b74dcecaf09f8607 : "<UNDEFINED>"));
    test_print("    structCopy.b                 - " + (isdefined(var_7e7b315fcb2b9159) && isdefined(var_7e7b315fcb2b9159.b) ? "" + var_7e7b315fcb2b9159.b : "<UNDEFINED>"));
    test_print("    structCopy.c                 - " + (isdefined(var_7e7b315fcb2b9159) && isdefined(var_7e7b315fcb2b9159.c) ? "" + var_7e7b315fcb2b9159.c : "<UNDEFINED>"));
    test_print("    arrayCopy.size               - " + (isdefined(arraycopy) && isdefined(arraycopy.size) ? "" + arraycopy.size : "<UNDEFINED>"));
    test_print("    arrayCopy['d']               - " + (isdefined(arraycopy) && isdefined(arraycopy["d"]) ? "" + arraycopy["d"] : "<UNDEFINED>"));
    test_print("    arrayCopy['e']               - " + (isdefined(arraycopy) && isdefined(arraycopy["e"]) ? "" + arraycopy["e"] : "<UNDEFINED>"));
    var_252e3cc32bf76d20 = player.pers;
    var_b74dcecaf09f8607 = player.pers["ut_var"];
    var_7e7b315fcb2b9159 = player.pers["ut_struct"];
    arraycopy = player.pers["ut_array"];
    test_print("-------------------------------------------------------------------------------");
    test_print("" + "Re-copy everything from player.pers");
    test_print("    player.pers.size             - " + (isdefined(player.pers) && isdefined(player.pers.size) ? "" + player.pers.size : "<UNDEFINED>"));
    test_print("    player.pers['ut_var']        - " + (isdefined(player.pers) && isdefined(player.pers["ut_var"]) ? "" + player.pers["ut_var"] : "<UNDEFINED>"));
    if (isdefined(player.pers["ut_struct"]) && isdefined(player.pers) && isdefined(player.pers["ut_struct"].b)) {
        goto LOC_00002cc8;
    }
    test_print("" + player.pers["ut_struct"].b + "<UNDEFINED>", "    player.pers['ut_struct'].b   - ");
    test_print("    player.pers['ut_struct'].c   - " + (isdefined(player.pers["ut_struct"]) && isdefined(player.pers) && isdefined(player.pers["ut_struct"].c) ? "" + player.pers["ut_struct"].c : "<UNDEFINED>"));
    if (isdefined(player.pers["ut_array"]) && isdefined(player.pers) && isdefined(player.pers["ut_array"].size)) {
        goto LOC_00002da8;
    }
    test_print("" + player.pers["ut_array"].size + "<UNDEFINED>", "    player.pers['ut_array'].size - ");
    test_print("    player.pers['ut_array']['d'] - " + (isdefined(player.pers["ut_array"]) && isdefined(player.pers) && isdefined(player.pers["ut_array"]["d"]) ? "" + player.pers["ut_array"]["d"] : "<UNDEFINED>"));
    if (isdefined(player.pers["ut_array"]) && isdefined(player.pers) && isdefined(player.pers["ut_array"]["e"])) {
        goto LOC_00002e8a;
    }
    test_print("" + player.pers["ut_array"]["e"] + "<UNDEFINED>", "    player.pers['ut_array']['e'] - ");
    if (isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20.size)) {
        goto LOC_00002eb2;
    }
    test_print("" + var_252e3cc32bf76d20.size + "<UNDEFINED>", "    persCopy.size                - ");
    if (isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_var"])) {
        goto LOC_00002ee4;
    }
    test_print("" + var_252e3cc32bf76d20["ut_var"] + "<UNDEFINED>", "    persCopy['ut_var']           - ");
    test_print("    persCopy['ut_struct'].b      - " + (isdefined(var_252e3cc32bf76d20["ut_struct"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_struct"].b) ? "" + var_252e3cc32bf76d20["ut_struct"].b : "<UNDEFINED>"));
    if (isdefined(var_252e3cc32bf76d20["ut_struct"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_struct"].c)) {
        goto LOC_00002f86;
    }
    test_print("" + var_252e3cc32bf76d20["ut_struct"].c + "<UNDEFINED>", "    persCopy['ut_struct'].c      - ");
    test_print("    persCopy['ut_array'].size    - " + (isdefined(var_252e3cc32bf76d20["ut_array"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_array"].size) ? "" + var_252e3cc32bf76d20["ut_array"].size : "<UNDEFINED>"));
    if (isdefined(var_252e3cc32bf76d20["ut_array"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_array"]["d"])) {
        goto LOC_0000300e;
    }
    test_print("" + var_252e3cc32bf76d20["ut_array"]["d"] + "<UNDEFINED>", "    persCopy['ut_array']['d']    - ");
    test_print("    persCopy['ut_array']['e']    - " + (isdefined(var_252e3cc32bf76d20["ut_array"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_array"]["e"]) ? "" + var_252e3cc32bf76d20["ut_array"]["e"] : "<UNDEFINED>"));
    if (isdefined(var_b74dcecaf09f8607)) {
        goto LOC_00003078;
    }
    test_print("" + var_b74dcecaf09f8607 + "<UNDEFINED>", "    varCopy                      - ");
    if (isdefined(var_7e7b315fcb2b9159) && isdefined(var_7e7b315fcb2b9159.b)) {
        goto LOC_000030b2;
    }
    test_print("" + var_7e7b315fcb2b9159.b + "<UNDEFINED>", "    structCopy.b                 - ");
    if (isdefined(var_7e7b315fcb2b9159) && isdefined(var_7e7b315fcb2b9159.c)) {
        goto LOC_000030ec;
    }
    test_print("" + var_7e7b315fcb2b9159.c + "<UNDEFINED>", "    structCopy.c                 - ");
    if (isdefined(arraycopy) && isdefined(arraycopy.size)) {
        goto LOC_00003114;
    }
    test_print("" + arraycopy.size + "<UNDEFINED>", "    arrayCopy.size               - ");
    if (isdefined(arraycopy) && isdefined(arraycopy["d"])) {
        goto LOC_00003146;
    }
    test_print("" + arraycopy["d"] + "<UNDEFINED>", "    arrayCopy['d']               - ");
    if (isdefined(arraycopy) && isdefined(arraycopy["e"])) {
        goto LOC_00003178;
    }
    test_print("" + arraycopy["e"] + "<UNDEFINED>", "    arrayCopy['e']               - ");
    player.pers["ut_var"] = "aaaa";
    player.pers["ut_struct"].b = "bbbb";
    player.pers["ut_struct"].c = "cccc";
    player.pers["ut_array"]["d"] = "dddd";
    player.pers["ut_array"]["e"] = "eeee";
    test_print("-------------------------------------------------------------------------------");
    test_print("" + "Update player.pers fields");
    test_print("    player.pers.size             - " + (isdefined(player.pers) && isdefined(player.pers.size) ? "" + player.pers.size : "<UNDEFINED>"));
    test_print("    player.pers['ut_var']        - " + (isdefined(player.pers) && isdefined(player.pers["ut_var"]) ? "" + player.pers["ut_var"] : "<UNDEFINED>"));
    if (isdefined(player.pers["ut_struct"]) && isdefined(player.pers) && isdefined(player.pers["ut_struct"].b)) {
        goto LOC_00003338;
    }
    test_print("" + player.pers["ut_struct"].b + "<UNDEFINED>", "    player.pers['ut_struct'].b   - ");
    test_print("    player.pers['ut_struct'].c   - " + (isdefined(player.pers["ut_struct"]) && isdefined(player.pers) && isdefined(player.pers["ut_struct"].c) ? "" + player.pers["ut_struct"].c : "<UNDEFINED>"));
    if (isdefined(player.pers["ut_array"]) && isdefined(player.pers) && isdefined(player.pers["ut_array"].size)) {
        goto LOC_00003418;
    }
    test_print("" + player.pers["ut_array"].size + "<UNDEFINED>", "    player.pers['ut_array'].size - ");
    test_print("    player.pers['ut_array']['d'] - " + (isdefined(player.pers["ut_array"]) && isdefined(player.pers) && isdefined(player.pers["ut_array"]["d"]) ? "" + player.pers["ut_array"]["d"] : "<UNDEFINED>"));
    if (isdefined(player.pers["ut_array"]) && isdefined(player.pers) && isdefined(player.pers["ut_array"]["e"])) {
        goto LOC_000034fa;
    }
    test_print("" + player.pers["ut_array"]["e"] + "<UNDEFINED>", "    player.pers['ut_array']['e'] - ");
    if (isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20.size)) {
        goto LOC_00003522;
    }
    test_print("" + var_252e3cc32bf76d20.size + "<UNDEFINED>", "    persCopy.size                - ");
    if (isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_var"])) {
        goto LOC_00003554;
    }
    test_print("" + var_252e3cc32bf76d20["ut_var"] + "<UNDEFINED>", "    persCopy['ut_var']           - ");
    test_print("    persCopy['ut_struct'].b      - " + (isdefined(var_252e3cc32bf76d20["ut_struct"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_struct"].b) ? "" + var_252e3cc32bf76d20["ut_struct"].b : "<UNDEFINED>"));
    if (isdefined(var_252e3cc32bf76d20["ut_struct"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_struct"].c)) {
        goto LOC_000035f6;
    }
    test_print("" + var_252e3cc32bf76d20["ut_struct"].c + "<UNDEFINED>", "    persCopy['ut_struct'].c      - ");
    test_print("    persCopy['ut_array'].size    - " + (isdefined(var_252e3cc32bf76d20["ut_array"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_array"].size) ? "" + var_252e3cc32bf76d20["ut_array"].size : "<UNDEFINED>"));
    if (isdefined(var_252e3cc32bf76d20["ut_array"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_array"]["d"])) {
        goto LOC_0000367e;
    }
    test_print("" + var_252e3cc32bf76d20["ut_array"]["d"] + "<UNDEFINED>", "    persCopy['ut_array']['d']    - ");
    test_print("    persCopy['ut_array']['e']    - " + (isdefined(var_252e3cc32bf76d20["ut_array"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_array"]["e"]) ? "" + var_252e3cc32bf76d20["ut_array"]["e"] : "<UNDEFINED>"));
    if (isdefined(var_b74dcecaf09f8607)) {
        goto LOC_000036e8;
    }
    test_print("" + var_b74dcecaf09f8607 + "<UNDEFINED>", "    varCopy                      - ");
    if (isdefined(var_7e7b315fcb2b9159) && isdefined(var_7e7b315fcb2b9159.b)) {
        goto LOC_00003722;
    }
    test_print("" + var_7e7b315fcb2b9159.b + "<UNDEFINED>", "    structCopy.b                 - ");
    if (isdefined(var_7e7b315fcb2b9159) && isdefined(var_7e7b315fcb2b9159.c)) {
        goto LOC_0000375c;
    }
    test_print("" + var_7e7b315fcb2b9159.c + "<UNDEFINED>", "    structCopy.c                 - ");
    if (isdefined(arraycopy) && isdefined(arraycopy.size)) {
        goto LOC_00003784;
    }
    test_print("" + arraycopy.size + "<UNDEFINED>", "    arrayCopy.size               - ");
    if (isdefined(arraycopy) && isdefined(arraycopy["d"])) {
        goto LOC_000037b6;
    }
    test_print("" + arraycopy["d"] + "<UNDEFINED>", "    arrayCopy['d']               - ");
    if (isdefined(arraycopy) && isdefined(arraycopy["e"])) {
        goto LOC_000037e8;
    }
    test_print("" + arraycopy["e"] + "<UNDEFINED>", "    arrayCopy['e']               - ");
    player.pers["ut_var"] = undefined;
    player.pers["ut_struct"] = undefined;
    player.pers["ut_array"] = undefined;
    test_print("-------------------------------------------------------------------------------");
    test_print("" + "Delete player.pers fields");
    test_print("    player.pers.size             - " + (isdefined(player.pers) && isdefined(player.pers.size) ? "" + player.pers.size : "<UNDEFINED>"));
    test_print("    player.pers['ut_var']        - " + (isdefined(player.pers) && isdefined(player.pers["ut_var"]) ? "" + player.pers["ut_var"] : "<UNDEFINED>"));
    if (isdefined(player.pers["ut_struct"]) && isdefined(player.pers) && isdefined(player.pers["ut_struct"].b)) {
        goto LOC_00003948;
    }
    test_print("" + player.pers["ut_struct"].b + "<UNDEFINED>", "    player.pers['ut_struct'].b   - ");
    test_print("    player.pers['ut_struct'].c   - " + (isdefined(player.pers["ut_struct"]) && isdefined(player.pers) && isdefined(player.pers["ut_struct"].c) ? "" + player.pers["ut_struct"].c : "<UNDEFINED>"));
    if (isdefined(player.pers["ut_array"]) && isdefined(player.pers) && isdefined(player.pers["ut_array"].size)) {
        goto LOC_00003a28;
    }
    test_print("" + player.pers["ut_array"].size + "<UNDEFINED>", "    player.pers['ut_array'].size - ");
    test_print("    player.pers['ut_array']['d'] - " + (isdefined(player.pers["ut_array"]) && isdefined(player.pers) && isdefined(player.pers["ut_array"]["d"]) ? "" + player.pers["ut_array"]["d"] : "<UNDEFINED>"));
    if (isdefined(player.pers["ut_array"]) && isdefined(player.pers) && isdefined(player.pers["ut_array"]["e"])) {
        goto LOC_00003b0a;
    }
    test_print("" + player.pers["ut_array"]["e"] + "<UNDEFINED>", "    player.pers['ut_array']['e'] - ");
    if (isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20.size)) {
        goto LOC_00003b32;
    }
    test_print("" + var_252e3cc32bf76d20.size + "<UNDEFINED>", "    persCopy.size                - ");
    if (isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_var"])) {
        goto LOC_00003b64;
    }
    test_print("" + var_252e3cc32bf76d20["ut_var"] + "<UNDEFINED>", "    persCopy['ut_var']           - ");
    test_print("    persCopy['ut_struct'].b      - " + (isdefined(var_252e3cc32bf76d20["ut_struct"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_struct"].b) ? "" + var_252e3cc32bf76d20["ut_struct"].b : "<UNDEFINED>"));
    if (isdefined(var_252e3cc32bf76d20["ut_struct"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_struct"].c)) {
        goto LOC_00003c06;
    }
    test_print("" + var_252e3cc32bf76d20["ut_struct"].c + "<UNDEFINED>", "    persCopy['ut_struct'].c      - ");
    test_print("    persCopy['ut_array'].size    - " + (isdefined(var_252e3cc32bf76d20["ut_array"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_array"].size) ? "" + var_252e3cc32bf76d20["ut_array"].size : "<UNDEFINED>"));
    if (isdefined(var_252e3cc32bf76d20["ut_array"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_array"]["d"])) {
        goto LOC_00003c8e;
    }
    test_print("" + var_252e3cc32bf76d20["ut_array"]["d"] + "<UNDEFINED>", "    persCopy['ut_array']['d']    - ");
    test_print("    persCopy['ut_array']['e']    - " + (isdefined(var_252e3cc32bf76d20["ut_array"]) && isdefined(var_252e3cc32bf76d20) && isdefined(var_252e3cc32bf76d20["ut_array"]["e"]) ? "" + var_252e3cc32bf76d20["ut_array"]["e"] : "<UNDEFINED>"));
    if (isdefined(var_b74dcecaf09f8607)) {
        goto LOC_00003cf8;
    }
    test_print("" + var_b74dcecaf09f8607 + "<UNDEFINED>", "    varCopy                      - ");
    if (isdefined(var_7e7b315fcb2b9159) && isdefined(var_7e7b315fcb2b9159.b)) {
        goto LOC_00003d32;
    }
    test_print("" + var_7e7b315fcb2b9159.b + "<UNDEFINED>", "    structCopy.b                 - ");
    if (isdefined(var_7e7b315fcb2b9159) && isdefined(var_7e7b315fcb2b9159.c)) {
        goto LOC_00003d6c;
    }
    test_print("" + var_7e7b315fcb2b9159.c + "<UNDEFINED>", "    structCopy.c                 - ");
    if (isdefined(arraycopy) && isdefined(arraycopy.size)) {
        goto LOC_00003d94;
    }
    test_print("" + arraycopy.size + "<UNDEFINED>", "    arrayCopy.size               - ");
    if (isdefined(arraycopy) && isdefined(arraycopy["d"])) {
        goto LOC_00003dc6;
    }
    test_print("" + arraycopy["d"] + "<UNDEFINED>", "    arrayCopy['d']               - ");
    if (isdefined(arraycopy) && isdefined(arraycopy["e"])) {
        goto LOC_00003df8;
    }
    test_print("" + arraycopy["e"] + "<UNDEFINED>", "    arrayCopy['e']               - ");
    test_end("player.pers");
}

// Namespace namespace_eb31a7ea746bf7d0/namespace_5c22773341178193
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4302
// Size: 0xa
function main() {
    function_29315e279f8c2ec1();
}

