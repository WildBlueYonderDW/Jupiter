#using script_6dcc0d17d865af91;
#using scripts\mp\compass;

#namespace mp_jup_shipment_alt_3;

// Namespace mp_jup_shipment_alt_3 / scripts\mp\maps\mp_jup_shipment_alt_3\mp_jup_shipment_alt_3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe1
// Size: 0x2d
function main() {
    namespace_508f32749fc055ad::main();
    scripts\mp\compass::setupminimap("compass_map_mp_jup_shipment_xmas");
    level.kill_border_triggers = getentarray("kill_border_trigger", "targetname");
}

