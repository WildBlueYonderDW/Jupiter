// mwiii decomp prototype
#using script_3b78d23dad7ec5be;
#using script_4c770a9a4ad7659c;
#using script_7edf952f8921aa6b;

#namespace namespace_7062ba3752363b0;

// Namespace namespace_7062ba3752363b0/namespace_93602eb41105ea2a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80
// Size: 0x27
function function_bf2be6d286aa478() {
    function_b5e57408c7878df7(&on_damaged);
    self.var_99ec7e2fb7ae4d79 = self.health * 0.01;
}

// Namespace namespace_7062ba3752363b0/namespace_93602eb41105ea2a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xae
// Size: 0x88
function private on_damaged(params) {
    if (isexplosivedamagemod(params.smeansofdeath) && (!isdefined(params.einflictor) || !istrue(params.einflictor.var_ee4c6b12c2b086d6))) {
        if (params.idamage > self.var_99ec7e2fb7ae4d79) {
            if (!function_e67a89537ae7d4b7()) {
                function_e96aac065abbec4e(params.vpoint);
            }
        }
    }
    return params.idamage;
}

