#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\flags.gsc;

#namespace namespace_744a21aacc598d0a;

// Namespace namespace_744a21aacc598d0a / namespace_2fc4dce97ad9b282
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12d
// Size: 0xa
function main() {
    thread function_15ac91b5e59a6c86();
}

// Namespace namespace_744a21aacc598d0a / namespace_2fc4dce97ad9b282
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13f
// Size: 0x7e
function function_15ac91b5e59a6c86() {
    wait 1;
    gameflagwait("infil_started");
    mover = getent("bravo", "targetname");
    probe = getent("helicopter_reflection_probe", "targetname");
    probe linkto(mover, "tag_light_interior_01", (120, 3, -50), (0, 0, 0));
    mover setscriptablepartstate("infil_lights", "on_estate", 0);
}

