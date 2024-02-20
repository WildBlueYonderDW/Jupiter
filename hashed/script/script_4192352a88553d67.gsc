// mwiii decomp prototype
#namespace telemetry;

// Namespace telemetry/namespace_627d023f48c9561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72
// Size: 0xa9
function init() {
    if (isdefined(game)) {
        if (!isdefined(game["telemetry"])) {
            game["telemetry"] = spawnstruct();
        }
        if (!isdefined(game["telemetry"].var_af0f7bfff116dfe5)) {
            game["telemetry"].var_af0f7bfff116dfe5 = 0;
        }
        if (!isdefined(game["telemetry"].life_count)) {
            game["telemetry"].life_count = 0;
        }
        if (!isdefined(game["telemetry"].var_19eb71d207a4b2b8)) {
            game["telemetry"].var_19eb71d207a4b2b8 = 0;
        }
    } else {
        /#
            println("<unknown string>");
        #/
    }
}

