// mwiii decomp prototype
#using script_7b2517368c79e5bc;
#using script_639bf783929acf9b;

#namespace namespace_f9e8a327d793c098;

// Namespace namespace_f9e8a327d793c098/namespace_3bb9f9a385df1918
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf0
// Size: 0x3a
function function_b60c68caa2f279ab() {
    if (isdefined(level.var_27475bb0d1b06044)) {
        [[ level.var_27475bb0d1b06044 ]]();
    } else {
        function_900f562c61c6a5d6("currency", &function_1c4d7b495f377496, &function_794ffcdb7828ea7a, &function_794ffcdb7828ea7a);
    }
}

// Namespace namespace_f9e8a327d793c098/namespace_3bb9f9a385df1918
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x131
// Size: 0x26
function function_794ffcdb7828ea7a(itembundle, item, var_11648d9cb3869a36, var_18fc734ec7194ede) {
    return 1;
}

// Namespace namespace_f9e8a327d793c098/namespace_3bb9f9a385df1918
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15f
// Size: 0xc2
function function_1c4d7b495f377496(itembundle, item, var_11648d9cb3869a36) {
    var_8d02a463027120aa = itembundle.subtype;
    var_3d7ffadeef043c6 = function_b8bfea9514c89a77(item.count);
    if (!isdefined(var_8d02a463027120aa) || var_8d02a463027120aa == "") {
        var_fbe755f0978c0369 = function_2cdc55ba39d97d70(item.type);
        /#
            assertmsg("CommonItemERROR: Attempted to pick up currency item [" + var_fbe755f0978c0369 + "] with undefined currency type (bundle.subtype)");
        #/
        return 0;
    }
    if (var_8d02a463027120aa == "essence" && isdefined(self.zombie_point_scalar)) {
        var_3d7ffadeef043c6 = var_3d7ffadeef043c6 * self.zombie_point_scalar;
    }
    namespace_7dfc6454a70f3f39::function_3036cef61495210f(var_8d02a463027120aa, var_3d7ffadeef043c6);
    return 0;
}

