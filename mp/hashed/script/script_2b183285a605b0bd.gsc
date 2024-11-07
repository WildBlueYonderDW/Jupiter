#using script_6dcc0d17d865af91;
#using scripts\mp\compass.gsc;

#namespace namespace_72952d5cbadfd922;

// Namespace namespace_72952d5cbadfd922 / namespace_a281127853db7a21
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe1
// Size: 0x2d
function main() {
    namespace_508f32749fc055ad::main();
    scripts\mp\compass::setupminimap("compass_map_mp_jup_shipment_xmas");
    level.kill_border_triggers = getentarray("kill_border_trigger", "targetname");
}

