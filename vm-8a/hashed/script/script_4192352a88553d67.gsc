#namespace telemetry;

// Namespace telemetry / namespace_627d023f48c9561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72
// Size: 0xa8
function init() {
    if (isdefined(game)) {
        if (!isdefined(game["telemetry"])) {
            game["telemetry"] = spawnstruct();
        }
        if (!isdefined(game["telemetry"].total_player_connections)) {
            game["telemetry"].total_player_connections = 0;
        }
        if (!isdefined(game["telemetry"].life_count)) {
            game["telemetry"].life_count = 0;
        }
        if (!isdefined(game["telemetry"].game_event_count)) {
            game["telemetry"].game_event_count = 0;
        }
        return;
    }
    println("<dev string:x1c>");
}

