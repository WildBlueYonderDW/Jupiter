#using script_3b78d23dad7ec5be;
#using scripts\common\callbacks.gsc;
#using script_7edf952f8921aa6b;

#namespace namespace_7062ba3752363b0;

// Namespace namespace_7062ba3752363b0 / namespace_93602eb41105ea2a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80
// Size: 0x26
function init_knockdown() {
    function_b5e57408c7878df7(&on_damaged);
    self.knockdowndamagethreshold = self.health * 0.01;
}

// Namespace namespace_7062ba3752363b0 / namespace_93602eb41105ea2a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xae
// Size: 0x87
function private on_damaged(params) {
    if (isexplosivedamagemod(params.smeansofdeath) && (!isdefined(params.einflictor) || !istrue(params.einflictor.prevent_knockdown))) {
        if (params.idamage > self.knockdowndamagethreshold) {
            if (!function_e67a89537ae7d4b7()) {
                function_e96aac065abbec4e(params.vpoint);
            }
        }
    }
    return params.idamage;
}

