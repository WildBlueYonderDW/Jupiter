#namespace namespace_58100fa81aea9f8e;

// Namespace namespace_58100fa81aea9f8e / namespace_a5fe37d0551722c6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc7
// Size: 0xa
function main() {
    thread function_7144210e1f4103e8();
}

// Namespace namespace_58100fa81aea9f8e / namespace_a5fe37d0551722c6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd9
// Size: 0x4e
function function_7144210e1f4103e8() {
    if (istrue(level.snowballfight)) {
        level endon("game_ended");
        level.var_d13ed50cfe72fa6a = spawn("script_model", (1953, -199, 412));
        level.var_d13ed50cfe72fa6a playloopsound("amb_shipment_emt_xmas_music_lp");
        return;
    }
    return;
}

