#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_9594a2086a980562;

// Namespace namespace_9594a2086a980562 / namespace_499370a154b38804
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xca
// Size: 0xa
function main() {
    thread function_d2b21d3eeb9a5054();
}

// Namespace namespace_9594a2086a980562 / namespace_499370a154b38804
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdc
// Size: 0x34
function function_d2b21d3eeb9a5054() {
    light = getent("lgt_rescue_light", "targetname");
    light rotatevelocity((0, 1000, 0), 50000);
}

