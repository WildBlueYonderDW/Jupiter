// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;

#namespace currency;

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2db
// Size: 0x13
function function_73faeac34c359ddb() {
    function_68a07bf45b0ba30a();
    level thread function_c1674a2bf8fcb89a();
}

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f5
// Size: 0x4
function function_c1674a2bf8fcb89a() {
    waitframe();
}

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x300
// Size: 0x26a
function function_68a07bf45b0ba30a() {
    if (isdefined(level.var_1a2b600a06ec21f4.var_e52f2b651f47e502) && !isdefined(level.var_4ae3d29e068b4901)) {
        level.var_4ae3d29e068b4901 = getscriptbundle("pricelist:" + level.var_1a2b600a06ec21f4.var_e52f2b651f47e502);
        level.var_4ae3d29e068b4901.var_163ce105edf9e5de = [];
        level.var_4ae3d29e068b4901.var_1982789b1e12442b = [];
        /#
            assertex(isdefined(level.var_4ae3d29e068b4901.var_d5753c1d2046e1c4), "Define starting currencies in " + level.var_1a2b600a06ec21f4.var_e52f2b651f47e502 + " for all currencies used in this mode, even if player starts with 0");
        #/
        foreach (var_98249fc6e5334ea1 in level.var_4ae3d29e068b4901.var_d5753c1d2046e1c4) {
            if (!isdefined(level.var_4ae3d29e068b4901.var_163ce105edf9e5de[var_98249fc6e5334ea1.var_645b9579909be3f8])) {
                level.var_4ae3d29e068b4901.var_163ce105edf9e5de[var_98249fc6e5334ea1.var_645b9579909be3f8] = getscriptbundle("currency:" + var_98249fc6e5334ea1.var_645b9579909be3f8);
            }
        }
        foreach (var_be041469fc4704b in level.var_4ae3d29e068b4901.var_36a99886b712dcc3) {
            if (isdefined(var_be041469fc4704b.var_3fd8eff0621723c9) && isdefined(var_be041469fc4704b.var_af40863a32d7792b)) {
                level.var_4ae3d29e068b4901.var_1982789b1e12442b[var_be041469fc4704b.var_3fd8eff0621723c9] = spawnstruct();
                level.var_4ae3d29e068b4901.var_1982789b1e12442b[var_be041469fc4704b.var_3fd8eff0621723c9].value = var_be041469fc4704b.var_af40863a32d7792b;
                level.var_4ae3d29e068b4901.var_1982789b1e12442b[var_be041469fc4704b.var_3fd8eff0621723c9].currency = var_be041469fc4704b.var_38d055f24fe64e71;
            }
        }
    }
}

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x571
// Size: 0xc
function function_2e815a7b6d0bbcf6() {
    return level.var_4ae3d29e068b4901;
}

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x585
// Size: 0x21
function function_7714028270738890(var_147708c583186e71) {
    return level.var_4ae3d29e068b4901.var_163ce105edf9e5de[var_147708c583186e71];
}

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ae
// Size: 0xd9
function function_7dfe1b812431019f(var_1df6de077e30f8c2) {
    if (isdefined(level.var_4ae3d29e068b4901) && isdefined(level.var_4ae3d29e068b4901.var_d5753c1d2046e1c4)) {
        foreach (var_98249fc6e5334ea1 in level.var_4ae3d29e068b4901.var_d5753c1d2046e1c4) {
            if (isdefined(var_98249fc6e5334ea1.var_645b9579909be3f8) && level.var_4ae3d29e068b4901.var_163ce105edf9e5de[var_98249fc6e5334ea1.var_645b9579909be3f8].var_54d8fe06789b6851 == var_1df6de077e30f8c2) {
                return function_53c4c53197386572(var_98249fc6e5334ea1.var_9247b3a807fe55ec, 0);
            }
        }
    }
}

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68e
// Size: 0x21
function function_3321003104b9507e(var_3719061529ddd848) {
    return level.var_4ae3d29e068b4901.var_1982789b1e12442b[var_3719061529ddd848];
}

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b7
// Size: 0x2f
function get_perk_machine_cost(str_perk) {
    var_2d823173121c345a = function_ea6ad508534fc509(str_perk);
    if (!isdefined(var_2d823173121c345a)) {
        return;
    }
    return var_2d823173121c345a.var_10d2cda4ce007c3b;
}

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ee
// Size: 0x9e
function function_bc4d94fa05ac7078(str_perk) {
    var_2d823173121c345a = function_ea6ad508534fc509(str_perk);
    if (!isdefined(var_2d823173121c345a)) {
        return "essence";
    } else if (isdefined(var_2d823173121c345a.var_3995211e6d9a4259)) {
        var_2de54af70b9cbe75 = function_7714028270738890(var_2d823173121c345a.var_3995211e6d9a4259);
        return var_2de54af70b9cbe75.var_54d8fe06789b6851;
    }
    /#
        println("<unknown string>" + level.var_1a2b600a06ec21f4.var_e52f2b651f47e502 + "<unknown string>" + str_perk + "<unknown string>" + "<unknown string>");
    #/
    return "essence";
}

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x794
// Size: 0xcd
function private function_ea6ad508534fc509(str_perk) {
    var_c82bc608d1423259 = function_2e815a7b6d0bbcf6();
    if (isdefined(var_c82bc608d1423259) && isdefined(var_c82bc608d1423259.var_fff87512f24a9908)) {
        foreach (var_3cdbf17f49ef52e8 in var_c82bc608d1423259.var_fff87512f24a9908) {
            if (isdefined(var_3cdbf17f49ef52e8.var_cb1f5a302f01f831) && var_3cdbf17f49ef52e8.var_cb1f5a302f01f831 == str_perk) {
                return var_3cdbf17f49ef52e8;
            }
        }
        /#
            println("<unknown string>" + level.var_1a2b600a06ec21f4.var_e52f2b651f47e502 + "<unknown string>" + str_perk);
        #/
    }
}

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x868
// Size: 0x65
function function_51ff679cabccfcd0() {
    if (!isdefined(level.var_1a2b600a06ec21f4.var_e52f2b651f47e502)) {
        return;
    }
    var_c82bc608d1423259 = function_2e815a7b6d0bbcf6();
    /#
        assertex(isdefined(var_c82bc608d1423259.var_63f11055773fb7d6), "Define a Mystery Box Price in " + level.var_1a2b600a06ec21f4.var_e52f2b651f47e502);
    #/
    return var_c82bc608d1423259.var_63f11055773fb7d6;
}

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d5
// Size: 0x65
function function_fd307a39427b77da() {
    if (!isdefined(level.var_1a2b600a06ec21f4.var_e52f2b651f47e502)) {
        return;
    }
    var_c82bc608d1423259 = function_2e815a7b6d0bbcf6();
    /#
        assertex(isdefined(var_c82bc608d1423259.var_f26b80cb6833eb9), "Define a Mystery Box fire sale Price in " + level.var_1a2b600a06ec21f4.var_e52f2b651f47e502);
    #/
    return var_c82bc608d1423259.var_f26b80cb6833eb9;
}

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x942
// Size: 0x91
function function_86ff2975af8e08be() {
    if (!isdefined(level.var_1a2b600a06ec21f4.var_e52f2b651f47e502)) {
        return;
    }
    var_c82bc608d1423259 = function_2e815a7b6d0bbcf6();
    var_2de54af70b9cbe75 = function_7714028270738890(var_c82bc608d1423259.var_8e4ed0273dc8b664);
    /#
        assertex(isdefined(var_c82bc608d1423259.var_8e4ed0273dc8b664) && isdefined(var_2de54af70b9cbe75.var_54d8fe06789b6851), "Define a Mystery Box Currency in " + level.var_1a2b600a06ec21f4.var_e52f2b651f47e502);
    #/
    return var_2de54af70b9cbe75.var_54d8fe06789b6851;
}

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9db
// Size: 0xbb
function private function_a6b6cc77c4485d21(var_545dc2e67db04095) {
    if (!isdefined(level.var_1a2b600a06ec21f4.var_e52f2b651f47e502)) {
        return;
    }
    var_c82bc608d1423259 = function_2e815a7b6d0bbcf6();
    if (isdefined(var_c82bc608d1423259) && isdefined(var_c82bc608d1423259.var_1f851a428523f96b)) {
        foreach (var_7b9786d925211f8c in var_c82bc608d1423259.var_1f851a428523f96b) {
            if (isdefined(var_7b9786d925211f8c.var_3a186553b8a52af5) && var_7b9786d925211f8c.var_3a186553b8a52af5 == var_545dc2e67db04095) {
                return var_7b9786d925211f8c;
            }
        }
    }
}

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa9d
// Size: 0x2f
function function_93cabb608eabdb7c(var_545dc2e67db04095) {
    var_7b9786d925211f8c = function_a6b6cc77c4485d21(var_545dc2e67db04095);
    if (!isdefined(var_7b9786d925211f8c)) {
        return;
    }
    return var_7b9786d925211f8c.var_4e0e100f89227f67;
}

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad4
// Size: 0x2f
function function_57e6c79279b89596(var_545dc2e67db04095) {
    var_7b9786d925211f8c = function_a6b6cc77c4485d21(var_545dc2e67db04095);
    if (!isdefined(var_7b9786d925211f8c)) {
        return;
    }
    return var_7b9786d925211f8c.var_e6e7b751029bb9dc;
}

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb0b
// Size: 0x91
function function_98aedb8cf660c612(var_545dc2e67db04095) {
    var_7b9786d925211f8c = function_a6b6cc77c4485d21(var_545dc2e67db04095);
    if (!isdefined(var_7b9786d925211f8c)) {
        return;
    }
    var_2de54af70b9cbe75 = function_7714028270738890(var_7b9786d925211f8c.var_e7a5769148797e0d);
    /#
        assertex(isdefined(var_7b9786d925211f8c.var_e7a5769148797e0d) && isdefined(var_2de54af70b9cbe75.var_54d8fe06789b6851), "Define a Buy Station Item Currency in " + level.var_1a2b600a06ec21f4.var_e52f2b651f47e502 + " for " + var_545dc2e67db04095);
    #/
    return var_2de54af70b9cbe75.var_54d8fe06789b6851;
}

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba4
// Size: 0x164
function function_cca1bcebd7aa11cf(var_8d02a463027120aa, var_cc66984bdffd7369, setfunc, addfunc, var_e0bcb3598d5e6f6b, var_116f75870a15dcae, var_18f0b5cf9ead4f5a) {
    if (isdefined(level.currency) && isdefined(level.currency[var_8d02a463027120aa])) {
        /#
            assert("Currency: " + var_8d02a463027120aa + " is already defined");
        #/
        return;
    } else {
        level.currency = function_53c4c53197386572(level.currency, []);
    }
    var_af9d6b40bd46422f = spawnstruct();
    level.currency[var_8d02a463027120aa] = var_af9d6b40bd46422f;
    level.currency[var_8d02a463027120aa].var_8d02a463027120aa = var_8d02a463027120aa;
    level.currency[var_8d02a463027120aa].var_cc66984bdffd7369 = var_cc66984bdffd7369;
    level.currency[var_8d02a463027120aa].setfunc = setfunc;
    level.currency[var_8d02a463027120aa].addfunc = addfunc;
    level.currency[var_8d02a463027120aa].var_e0bcb3598d5e6f6b = var_e0bcb3598d5e6f6b;
    level.currency[var_8d02a463027120aa].var_116f75870a15dcae = var_116f75870a15dcae;
    level.currency[var_8d02a463027120aa].var_18f0b5cf9ead4f5a = var_18f0b5cf9ead4f5a;
    /#
        level thread function_2e0cc380e14c340b(var_8d02a463027120aa);
    #/
}

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd0f
// Size: 0x62
function function_adc47eed1b02ec05(var_8d02a463027120aa, var_978799e2da3eab39) {
    if (!isplayer(self)) {
        /#
            assert("self not a player");
        #/
        return;
    }
    if (!isdefined(var_978799e2da3eab39)) {
        var_978799e2da3eab39 = 0;
    }
    function_d0948454b7f94d18(var_8d02a463027120aa, var_978799e2da3eab39);
    if (getdvarint(@"hash_bc19129b877ec86b", 0)) {
        thread function_d67d3f6e87682c71(self.currency.size, var_8d02a463027120aa);
    }
}

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd78
// Size: 0xb8
function function_3036cef61495210f(var_8d02a463027120aa, amount, reason) {
    var_65b4e89f87e61c2 = amount;
    if (isdefined(level.currency[var_8d02a463027120aa].addfunc)) {
        self [[ level.currency[var_8d02a463027120aa].addfunc ]](amount);
    } else {
        function_8301d03eb828b5a5(amount, var_8d02a463027120aa);
    }
    var_d27680ff86693f5c = spawnstruct();
    var_d27680ff86693f5c.var_65b4e89f87e61c2 = var_65b4e89f87e61c2;
    var_d27680ff86693f5c.var_8d02a463027120aa = var_8d02a463027120aa;
    var_d27680ff86693f5c.amount = amount;
    var_d27680ff86693f5c.reason = reason;
    callback::callback("currency_add", var_d27680ff86693f5c);
}

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe37
// Size: 0x5a
function function_8301d03eb828b5a5(amount, var_8d02a463027120aa) {
    var_3d7ffadeef043c6 = function_15975e20bbd2c824(var_8d02a463027120aa);
    var_3fa041e4f059bc71 = var_3d7ffadeef043c6 + amount;
    if (amount > 0 && var_3fa041e4f059bc71 < var_3d7ffadeef043c6) {
        var_3fa041e4f059bc71 = 2147483647;
    }
    if (var_3fa041e4f059bc71 < 0) {
        var_3fa041e4f059bc71 = 0;
    }
    function_d0948454b7f94d18(var_8d02a463027120aa, var_3fa041e4f059bc71);
}

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe98
// Size: 0xcd
function function_a06aa3b8c98e131e(var_8d02a463027120aa, amount, reason, info) {
    var_65b4e89f87e61c2 = amount;
    if (isdefined(level.currency[var_8d02a463027120aa].var_e0bcb3598d5e6f6b)) {
        self [[ level.currency[var_8d02a463027120aa].var_e0bcb3598d5e6f6b ]](amount);
    } else {
        function_76906efe4e7c93fc(amount, var_8d02a463027120aa);
    }
    var_d27680ff86693f5c = spawnstruct();
    var_d27680ff86693f5c.var_65b4e89f87e61c2 = var_65b4e89f87e61c2;
    var_d27680ff86693f5c.var_8d02a463027120aa = var_8d02a463027120aa;
    var_d27680ff86693f5c.amount = amount;
    var_d27680ff86693f5c.reason = reason;
    var_d27680ff86693f5c.info = info;
    callback::callback("currency_sub", var_d27680ff86693f5c);
}

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf6c
// Size: 0x5a
function function_76906efe4e7c93fc(amount, var_8d02a463027120aa) {
    var_3d7ffadeef043c6 = function_15975e20bbd2c824(var_8d02a463027120aa);
    var_3fa041e4f059bc71 = var_3d7ffadeef043c6 - amount;
    if (amount < 0 && var_3fa041e4f059bc71 < var_3d7ffadeef043c6) {
        var_3fa041e4f059bc71 = 2147483647;
    }
    if (var_3fa041e4f059bc71 < 0) {
        var_3fa041e4f059bc71 = 0;
    }
    function_d0948454b7f94d18(var_8d02a463027120aa, var_3fa041e4f059bc71);
}

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfcd
// Size: 0xcf
function function_d0948454b7f94d18(var_8d02a463027120aa, amount, reason) {
    var_65b4e89f87e61c2 = amount;
    if (isdefined(self.currency) && isdefined(var_8d02a463027120aa) && isdefined(self.currency[var_8d02a463027120aa])) {
        var_65b4e89f87e61c2 = self.currency[var_8d02a463027120aa];
    }
    var_becfac3d1b3aa3dc = level.currency[var_8d02a463027120aa].setfunc;
    if (isdefined(var_becfac3d1b3aa3dc)) {
        self [[ var_becfac3d1b3aa3dc ]](amount);
    } else {
        function_c6f24e4d5f1dcba(amount, var_8d02a463027120aa);
    }
    var_d27680ff86693f5c = {reason:reason, amount:amount, var_8d02a463027120aa:var_8d02a463027120aa, var_65b4e89f87e61c2:var_65b4e89f87e61c2};
    callback::callback("currency_set", var_d27680ff86693f5c);
}

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10a3
// Size: 0x21
function function_c6f24e4d5f1dcba(amount, var_8d02a463027120aa) {
    self.currency[var_8d02a463027120aa] = amount;
}

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10cb
// Size: 0x48
function function_15975e20bbd2c824(var_8d02a463027120aa) {
    if (isdefined(level.currency[var_8d02a463027120aa].var_cc66984bdffd7369)) {
        return [[ level.currency[var_8d02a463027120aa].var_cc66984bdffd7369 ]]();
    } else {
        return function_65e84417bc4c405e(var_8d02a463027120aa);
    }
}

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x111a
// Size: 0x17
function function_65e84417bc4c405e(var_8d02a463027120aa) {
    return self.currency[var_8d02a463027120aa];
}

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1139
// Size: 0x3d
function function_bcc79745d547a99c(var_8d02a463027120aa, cost) {
    var_7965af849f61fa07 = 1;
    var_dfe39d340d15cb99 = function_15975e20bbd2c824(var_8d02a463027120aa);
    if (cost > var_dfe39d340d15cb99) {
        var_7965af849f61fa07 = 0;
    }
    return var_7965af849f61fa07;
}

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x117e
// Size: 0x112
function function_301addb53c1df990(var_8d02a463027120aa, cost, var_92f8f0879c089e9, var_b138a0b1e1a62a04, reason, info) {
    if (function_bcc79745d547a99c(var_8d02a463027120aa, cost)) {
        function_a06aa3b8c98e131e(var_8d02a463027120aa, cost, reason, info);
        if (isdefined(level.currency[var_8d02a463027120aa].var_116f75870a15dcae) && !istrue(var_92f8f0879c089e9)) {
            self playsoundtoplayer(level.currency[var_8d02a463027120aa].var_116f75870a15dcae, self);
        }
        if (!isdefined(self.pers["currency_spent"])) {
            self.pers["currency_spent"] = cost;
        } else {
            self.pers["currency_spent"] = self.pers["currency_spent"] + cost;
        }
        return 1;
    } else {
        if (isdefined(level.currency[var_8d02a463027120aa].var_18f0b5cf9ead4f5a) && !istrue(var_b138a0b1e1a62a04)) {
            self playsoundtoplayer(level.currency[var_8d02a463027120aa].var_18f0b5cf9ead4f5a, self);
        }
        return 0;
    }
}

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1297
// Size: 0x2b
function function_fc06aafd52e1707b(var_8d02a463027120aa, var_f184c2d57255363) {
    level.currency[var_8d02a463027120aa].displayname = var_f184c2d57255363;
}

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12c9
// Size: 0x231
function function_d67d3f6e87682c71(var_f246314e1dbaefea, var_8d02a463027120aa) {
    level endon("game_ended");
    self endon("disconnect");
    var_5454163114cd6502 = newclienthudelem(self);
    var_5454163114cd6502.x = -20;
    var_5454163114cd6502.y = 380 - 15 * var_f246314e1dbaefea;
    var_5454163114cd6502.alignx = "center";
    var_5454163114cd6502.aligny = "top";
    var_5454163114cd6502.vertalign = "fullscreen";
    var_5454163114cd6502.var_406fd34934f7e3d2 = "fullscreen";
    var_5454163114cd6502.font = "smallfixed";
    var_5454163114cd6502.fontscale = 0.75;
    var_6dfa383229c11ead = newclienthudelem(self);
    var_6dfa383229c11ead.x = 60;
    var_6dfa383229c11ead.y = 380 - 15 * var_f246314e1dbaefea;
    var_6dfa383229c11ead.alignx = "center";
    var_6dfa383229c11ead.aligny = "top";
    var_6dfa383229c11ead.vertalign = "fullscreen";
    var_6dfa383229c11ead.var_406fd34934f7e3d2 = "fullscreen";
    var_6dfa383229c11ead.font = "smallfixed";
    var_6dfa383229c11ead.fontscale = 0.75;
    while (1) {
        if (var_8d02a463027120aa == "essence") {
            var_5454163114cd6502 settext("SHARED_HINTSTRINGS/CURRENCY_HUDELEM_ESSENCE");
            var_6dfa383229c11ead setvalue(self.currency["essence"]);
        } else if (var_8d02a463027120aa == "salvage") {
            var_5454163114cd6502 settext("SHARED_HINTSTRINGS/CURRENCY_HUDELEM_SALVAGE");
            var_6dfa383229c11ead setvalue(self.currency["salvage"]);
        } else if (var_8d02a463027120aa == "rare_salvage") {
            var_5454163114cd6502 settext("SHARED_HINTSTRINGS/CURRENCY_HUDELEM_RARE_SALVAGE");
            var_6dfa383229c11ead setvalue(self.currency["rare_salvage"]);
        } else if (isdefined(level.currency[var_8d02a463027120aa].displayname)) {
            var_5454163114cd6502 settext(level.currency[var_8d02a463027120aa].displayname);
            var_6dfa383229c11ead setvalue(self.currency[var_8d02a463027120aa]);
        }
        waitframe();
    }
}

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1501
// Size: 0x3d
function function_2e0cc380e14c340b(var_267293b6df9817) {
    /#
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>");
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>" + var_267293b6df9817, "<unknown string>" + var_267293b6df9817, &function_382bfcbb2e043576, 0);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
    #/
}

// Namespace currency/namespace_7dfc6454a70f3f39
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1545
// Size: 0x95
function function_382bfcbb2e043576(params) {
    /#
        var_267293b6df9817 = params[0];
        foreach (player in level.players) {
            if (isdefined(level.currency[var_267293b6df9817])) {
                player function_3036cef61495210f(var_267293b6df9817, 10000);
            } else {
                iprintln(var_267293b6df9817 + "<unknown string>");
            }
        }
    #/
}

