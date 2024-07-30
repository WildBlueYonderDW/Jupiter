#using scripts\engine\math.gsc;

#namespace namespace_d81cc0392628bc6d;

// Namespace namespace_d81cc0392628bc6d / namespace_991e5edd79e81a10
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86
// Size: 0x42
function function_683c095e6767c4c8(lookatposition, delta, var_70e8a85177297c1) {
    level endon("game_ended");
    self endon("disconnect");
    while (!function_b69898678ed4466d(lookatposition, delta)) {
        waitframe();
    }
    if (isdefined(var_70e8a85177297c1)) {
        self [[ var_70e8a85177297c1 ]]();
    }
}

// Namespace namespace_d81cc0392628bc6d / namespace_991e5edd79e81a10
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd0
// Size: 0x2e
function function_ed838558ef4e4e91(entity, delta, mindistance) {
    return function_b69898678ed4466d(entity.origin, delta, mindistance);
}

// Namespace namespace_d81cc0392628bc6d / namespace_991e5edd79e81a10
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x107
// Size: 0x70
function function_b69898678ed4466d(position, delta, mindistance) {
    if (isdefined(mindistance) && distance2d(self.origin, position) > mindistance) {
        return false;
    }
    forward = anglestoforward(self getplayerangles(0));
    normalized = vectornormalize(position - self geteye());
    return math::anglebetweenvectorsunit(forward, normalized) <= delta;
}

