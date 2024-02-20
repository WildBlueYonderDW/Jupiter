// mwiii decomp prototype
#namespace namespace_ef5ace8ba0e01c9d;

// Namespace namespace_ef5ace8ba0e01c9d/namespace_e0a7597be4f2b843
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x68
// Size: 0x7a
function setcachedgameomnvar(omnvar, value) {
    if (!isdefined(omnvar) || !isdefined(value)) {
        return;
    }
    if (!isdefined(level.cachedomnars)) {
        level.cachedomnars = [];
    }
    var_7551517e1be634ee = !isdefined(level.cachedomnars[omnvar]) || level.cachedomnars[omnvar] != value;
    level.cachedomnars[omnvar] = value;
    if (var_7551517e1be634ee) {
        setomnvar(omnvar, value);
    }
}

// Namespace namespace_ef5ace8ba0e01c9d/namespace_e0a7597be4f2b843
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe9
// Size: 0x81
function setcachedclientomnvar(omnvar, value) {
    if (!isdefined(self) || !isdefined(omnvar) || !isdefined(value)) {
        return;
    }
    if (!isdefined(self.cachedomnars)) {
        self.cachedomnars = [];
    }
    var_7551517e1be634ee = !isdefined(self.cachedomnars[omnvar]) || self.cachedomnars[omnvar] != value;
    self.cachedomnars[omnvar] = value;
    if (var_7551517e1be634ee) {
        self setclientomnvar(omnvar, value);
    }
}

// Namespace namespace_ef5ace8ba0e01c9d/namespace_e0a7597be4f2b843
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x171
// Size: 0x7f
function function_8b532402ee55336e(var_64571e3aeccd1a07, var_8534515023afc188, var_49f3b7a464f1d70d, newvalue) {
    mask = int(pow(2, var_8534515023afc188)) - 1;
    var_a463992091f1d483 = (newvalue & mask) << var_64571e3aeccd1a07;
    var_f8f977081d3da8b4 = ~(mask << var_64571e3aeccd1a07);
    var_ed711aeaf5e8cb76 = var_49f3b7a464f1d70d & var_f8f977081d3da8b4;
    var_82a90e56e416fa55 = var_ed711aeaf5e8cb76 + var_a463992091f1d483;
    return var_82a90e56e416fa55;
}

// Namespace namespace_ef5ace8ba0e01c9d/namespace_e0a7597be4f2b843
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f8
// Size: 0x48
function function_9719833960bacf54(var_64571e3aeccd1a07, var_8534515023afc188, var_81dab8953b9df82) {
    mask = int(pow(2, var_8534515023afc188)) - 1;
    var_a463992091f1d483 = (var_81dab8953b9df82 & mask) << var_64571e3aeccd1a07;
    return var_a463992091f1d483;
}

// Namespace namespace_ef5ace8ba0e01c9d/namespace_e0a7597be4f2b843
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x248
// Size: 0x5a
function function_63437fca39c681dc(var_e9d476a3809cb3f1, var_64571e3aeccd1a07, var_8534515023afc188, value) {
    var_ee27f3f198276535 = self getclientomnvar(var_e9d476a3809cb3f1);
    var_82a90e56e416fa55 = function_8b532402ee55336e(var_64571e3aeccd1a07, var_8534515023afc188, var_ee27f3f198276535, value);
    if (var_ee27f3f198276535 != var_82a90e56e416fa55) {
        self setclientomnvar(var_e9d476a3809cb3f1, var_82a90e56e416fa55);
    }
}

// Namespace namespace_ef5ace8ba0e01c9d/namespace_e0a7597be4f2b843
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a9
// Size: 0x58
function function_d3cf7ff1a257e2c3(var_e9d476a3809cb3f1, var_64571e3aeccd1a07, var_8534515023afc188, value) {
    var_ee27f3f198276535 = getomnvar(var_e9d476a3809cb3f1);
    var_82a90e56e416fa55 = function_8b532402ee55336e(var_64571e3aeccd1a07, var_8534515023afc188, var_ee27f3f198276535, value);
    if (var_ee27f3f198276535 != var_82a90e56e416fa55) {
        setomnvar(var_e9d476a3809cb3f1, var_82a90e56e416fa55);
    }
}

// Namespace namespace_ef5ace8ba0e01c9d/namespace_e0a7597be4f2b843
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x308
// Size: 0x42
function function_610e0cca26bba2f(var_e9d476a3809cb3f1, var_64571e3aeccd1a07, var_8534515023afc188) {
    value = getomnvar(var_e9d476a3809cb3f1);
    var_26a6c0adbaffb03f = function_9719833960bacf54(var_64571e3aeccd1a07, var_8534515023afc188, value);
    return var_26a6c0adbaffb03f;
}

