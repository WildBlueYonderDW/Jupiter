// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_1a4fc95657361d97;
#using script_7ef95bba57dc4b82;

#namespace namespace_d3075a6edbc6938c;

// Namespace namespace_d3075a6edbc6938c/namespace_d7b9ee5af496e5e7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xff
// Size: 0x60
function init() {
    level.var_6392befa93ae3cc6 = undefined;
    level.var_91ca776f27d516c0 = undefined;
    namespace_bb666c82715fa89d::init();
    namespace_bb666c82715fa89d::function_7a2df9055cb22721("RatGetPlayerTeam", &RatGetPlayerTeam, "string");
    namespace_bb666c82715fa89d::function_7a2df9055cb22721("RatGetTeamCount", &RatGetTeamCount, "int64_t");
    namespace_bb666c82715fa89d::function_7a2df9055cb22721("RatGetPlayerEquipment", &RatGetPlayerEquipment, "string");
}

// Namespace namespace_d3075a6edbc6938c/namespace_d7b9ee5af496e5e7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x166
// Size: 0x29
function RatGetPlayerTeam(params) {
    player = namespace_bb666c82715fa89d::getplayer(params);
    return player.team;
}

// Namespace namespace_d3075a6edbc6938c/namespace_d7b9ee5af496e5e7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x197
// Size: 0x7e
function RatGetTeamCount(params) {
    var_b32a6e22b9cc2580 = function_53c4c53197386572(params.team, "player");
    player_team = RatGetPlayerTeam(params);
    if (var_b32a6e22b9cc2580 == "player") {
        var_b32a6e22b9cc2580 = player_team;
    }
    if (var_b32a6e22b9cc2580 == "enemy") {
        if (player_team == "axis") {
            var_b32a6e22b9cc2580 = "allies";
        } else {
            var_b32a6e22b9cc2580 = "axis";
        }
    }
    return getteamdata(var_b32a6e22b9cc2580, "players").size;
}

// Namespace namespace_d3075a6edbc6938c/namespace_d7b9ee5af496e5e7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21d
// Size: 0x53
function RatGetPlayerEquipment(params) {
    var_313729df937cbe05 = function_53c4c53197386572(params.slot, "primary");
    player = namespace_bb666c82715fa89d::getplayer(params);
    equip = player namespace_4fb9dddfb8c1a67a::getcurrentequipment(var_313729df937cbe05);
    return equip;
}

