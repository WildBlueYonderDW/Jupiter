#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using script_44b8991c2b01716a;

#namespace namespace_af989994e05fbdcb;

// Namespace namespace_af989994e05fbdcb / namespace_923440a69c7ffdbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c8
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
// Checksum 0x0, Offset: 0x5c8
// Size: 0x34
function private function_a20fb4fd7a73c944() {
    self setcandamage(1);
    scripts\cp_mp\vehicles\vehicle_damage::vehicle_damage_disablestatedamagefloor(1);
    self dodamage(self.health, self.origin, undefined, undefined, "MOD_EXPLOSIVE");
}

// Namespace namespace_af989994e05fbdcb / namespace_923440a69c7ffdbe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x604
// Size: 0x2c0
function function_5dd9c0f6e90a13b0(instance) {
    level endon("game_ended");
    self endon("death");
    var_e4fd501f7b60e19f = getdvarint(@"hash_c1bc548080309d13", 1);
    if (var_e4fd501f7b60e19f) {
        return;
    }
    if (!function_5a758c8d306f92ed() || !scripts\engine\utility::flag("jump_scares_ready")) {
        return;
    }
    var_e7a7e20ec68138e3 = scripts\cp_mp\utility\game_utility::isbrstylegametype() && !scripts\mp\flags::gameflag("prematch_done");
    if (var_e7a7e20ec68138e3) {
        return;
    }
    assert(isdefined(instance));
    assert(isdefined(self));
    if (!isdefined(instance) || !isdefined(instance.type) || !isdefined(self)) {
        return;
    }
    var_1247e7bf97720271 = self function_928fe2f2298beac(22);
    if (istrue(var_1247e7bf97720271)) {
        return;
    }
    println("<dev string:x1c>" + instance.type);
    switch (instance.type) {
    case #"hash_8e4985ef9e8400c":
    case #"hash_183cb58bad34bd86":
    case #"hash_2eeb1cff3469628b":
    case #"hash_33a1ab3969e0b64e":
    case #"hash_39e3bc45cc6f31c1":
    case #"hash_5bbda41f2e59fbef":
    case #"hash_8193a20e7851382b":
    case #"hash_8387e0bfe22abc5d":
    case #"hash_8944097b14faec32":
    case #"hash_977234c8cfd0030e":
    case #"hash_9c4e1145f143be53":
    case #"hash_ac6eb824cf784951":
    case #"hash_ac6eb924cf784ae4":
    case #"hash_b1814c3921b5bcf2":
    case #"hash_b5b4216883bf84b8":
    case #"hash_c7ea6790348315ee":
    case #"hash_d0c62925db452771":
    case #"hash_dac14bda4e7d32e3":
    case #"hash_eae2c1b7c001285b":
    case #"hash_f1db14019ca6a516":
    case #"hash_f326eb800177a762":
    case #"hash_f5d89706e98ccd46":
    case #"hash_fd428ac2a2886e03":
    case #"hash_fd428fc2a28875e2":
        return;
    default:
        break;
    }
    var_4e1f73945da1f162 = self function_928fe2f2298beac(int(11209));
    var_1fbafacb2ed42a71 = getdvarfloat(@"hash_d934ab0506ce0113", 0.033);
    if (istrue(var_4e1f73945da1f162) && randomfloat(1) < var_1fbafacb2ed42a71) {
        if (namespace_2db04a57a1b9bf62::function_b67f0b02f25b1af(self, 1, 1)) {
            self function_7647367aee494091(11209, "Jump Scare Execute", 1);
            var_119ab6bdd211c7a = getdvarfloat(@"hash_5c126d873a7bc274", 0.5);
            wait var_119ab6bdd211c7a;
            self suicide();
            println("<dev string:x43>");
        }
        return;
    }
}

