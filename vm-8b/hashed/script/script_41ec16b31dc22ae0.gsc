#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;

#namespace namespace_af989994e05fbdcb;

// Namespace namespace_af989994e05fbdcb / namespace_923440a69c7ffdbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xea
// Size: 0x1f8
function function_112e55565cbd70d9() {
    if (!isdefined(level.vehicle)) {
        return;
    }
    var_1a568248956830ad = getdvarint(@"hash_9efe102fcea86b8d", 1);
    if (var_1a568248956830ad) {
        return;
    }
    var_e7a7e20ec68138e3 = scripts\cp_mp\utility\game_utility::isbrstylegametype() && !scripts\mp\flags::gameflag("prematch_done");
    if (var_e7a7e20ec68138e3) {
        return;
    }
    if (istrue(self.isempty)) {
        return;
    }
    var_6464b76feb090e36 = scripts\common\vehicle::ishelicopter() || scripts\common\vehicle::isairplane();
    var_74015caabcae6148 = 0;
    seatids = vehicle_occupancy_getallvehicleseats(self);
    if (!isdefined(seatids)) {
        return;
    }
    foreach (seatid in seatids) {
        player = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getseatoccupant(self, seatid, 0);
        if (!isdefined(player)) {
            continue;
        }
        if (!player ispcplayer() || !player function_793f941d7dff15ed() || !isdefined(player.vehicle)) {
            continue;
        }
        var_1247e7bf97720271 = player function_928fe2f2298beac(22);
        if (istrue(var_1247e7bf97720271)) {
            continue;
        }
        var_31383f2915b38252 = getdvarint(@"hash_1434cd22109378de", 6000);
        var_75f3844ff7b3eee6 = player.vehicle.origin[2] >= var_31383f2915b38252;
        var_53fd253f86fc40e = player function_928fe2f2298beac(11211);
        var_70f57c300f436c05 = player function_f4c27b5a9b70addc(33554432);
        if (istrue(var_70f57c300f436c05)) {
            player function_86e7dd0942dd21de(33554432);
            var_74015caabcae6148 = 1;
            break;
        }
        if (istrue(var_53fd253f86fc40e) && var_75f3844ff7b3eee6 && !var_6464b76feb090e36) {
            player function_7647367aee494091(11211, "Boom", 1);
            var_74015caabcae6148 = 1;
            break;
        }
    }
    if (var_74015caabcae6148) {
        function_a20fb4fd7a73c944();
    }
}

// Namespace namespace_af989994e05fbdcb / namespace_923440a69c7ffdbe
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2ea
// Size: 0x34
function private function_a20fb4fd7a73c944() {
    self setcandamage(1);
    scripts\cp_mp\vehicles\vehicle_damage::vehicle_damage_disablestatedamagefloor(1);
    self dodamage(self.health, self.origin, undefined, undefined, "MOD_EXPLOSIVE");
}

