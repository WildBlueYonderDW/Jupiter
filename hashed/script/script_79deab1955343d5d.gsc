// mwiii decomp prototype
#using script_6617e2f2bb62b52b;
#using script_3ab210ea917601e7;

#namespace namespace_c605cc31e0e013e6;

// Namespace namespace_c605cc31e0e013e6/namespace_6a4776a9657ff96b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x78
// Size: 0x78
function function_4d4bdc081df1c06b(player, var_626b45032e1892da) {
    if (!isdefined(player.var_83abcb9b3a5dbe24.var_c72815ede3f05a9e)) {
        player.var_83abcb9b3a5dbe24.var_c72815ede3f05a9e = [];
    }
    if (!isdefined(player.var_83abcb9b3a5dbe24.var_c72815ede3f05a9e[var_626b45032e1892da])) {
        player.var_83abcb9b3a5dbe24.var_c72815ede3f05a9e[var_626b45032e1892da] = 0;
    }
}

// Namespace namespace_c605cc31e0e013e6/namespace_6a4776a9657ff96b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf7
// Size: 0x4b
function updatescore(var_ff4e8921b8eca339) {
    self.score = self.score + var_ff4e8921b8eca339;
    /#
        broadcast = function_ab07dddb2e50773b("<unknown string>" + self.score);
        function_2e44f2eaf470e806(broadcast);
    #/
}

// Namespace namespace_c605cc31e0e013e6/namespace_6a4776a9657ff96b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x149
// Size: 0x63
function function_580d48267e3509af(player) {
    var_f3df5cfd2b12a463 = function_c70072a3cf2befdf();
    var_59fc1437f9b55f06 = function_c24c0d4455227010(player, self.var_626b45032e1892da);
    if (var_f3df5cfd2b12a463 > var_59fc1437f9b55f06) {
        player.var_83abcb9b3a5dbe24.var_c72815ede3f05a9e[self.var_626b45032e1892da] = var_f3df5cfd2b12a463;
        return 1;
    }
    return 0;
}

// Namespace namespace_c605cc31e0e013e6/namespace_6a4776a9657ff96b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b4
// Size: 0xd
function function_3a4003f22cdf946() {
    self.score = 0;
}

// Namespace namespace_c605cc31e0e013e6/namespace_6a4776a9657ff96b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c8
// Size: 0xc
function function_c70072a3cf2befdf() {
    return self.score;
}

// Namespace namespace_c605cc31e0e013e6/namespace_6a4776a9657ff96b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dc
// Size: 0x2b
function function_c24c0d4455227010(player, var_626b45032e1892da) {
    return player.var_83abcb9b3a5dbe24.var_c72815ede3f05a9e[var_626b45032e1892da];
}

// Namespace namespace_c605cc31e0e013e6/namespace_6a4776a9657ff96b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x20f
// Size: 0x19
function function_2e68ab6566b199cb(score) {
    /#
        self.score = score;
    #/
}

// Namespace namespace_c605cc31e0e013e6/namespace_6a4776a9657ff96b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x22f
// Size: 0x24
function function_143f23933ce820a2(var_626b45032e1892da) {
    /#
        iprintln("<unknown string>" + self.score);
    #/
}

