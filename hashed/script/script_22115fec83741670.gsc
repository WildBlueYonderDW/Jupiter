// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\weapons.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\equipment.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\perk.gsc;
#using script_5762ac2f22202ba2;
#using scripts\mp\utility\print.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using script_16ea1b94f0f381b3;
#using script_1ed1214969b5eba7;
#using scripts\mp\supers.gsc;
#using scripts\cp_mp\ent_manager.gsc;
#using scripts\mp\movers.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\mp\equipment_interact.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\cp_mp\vehicles\vehicle_mines.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\cp_mp\killstreaks\white_phosphorus.gsc;

#namespace gas_trap;

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fe
// Size: 0x163
function function_d8b2df497e0b97f() {
    var_91153e08aa50531e = namespace_4a3033eafa6fd07::function_bf9c7e9dd30180e3("super_gas_trap");
    level.var_3ad99a60ec62068f = spawnstruct();
    level.var_3ad99a60ec62068f.maxtime = 7;
    level.var_3ad99a60ec62068f.var_4873abd0407e7e54 = 250;
    level.var_3ad99a60ec62068f.var_218d7dd5b17234f4 = 0.1;
    level.var_3ad99a60ec62068f.var_605bc8d3bfb20d0d = 10;
    level.var_3ad99a60ec62068f.var_3340b02ebf8649d5 = 6;
    if (isdefined(var_91153e08aa50531e)) {
        level.var_3ad99a60ec62068f.maxtime = function_53c4c53197386572(var_91153e08aa50531e.var_889e00d6ac48d183, 7);
        level.var_3ad99a60ec62068f.var_4873abd0407e7e54 = function_53c4c53197386572(var_91153e08aa50531e.var_bfb71d4446e67684, 250);
        level.var_3ad99a60ec62068f.var_218d7dd5b17234f4 = function_53c4c53197386572(var_91153e08aa50531e.var_c5d3380c0a1b7004, 0.1);
        level.var_3ad99a60ec62068f.var_605bc8d3bfb20d0d = function_53c4c53197386572(var_91153e08aa50531e.var_232365acb42a921d, 10);
        level.var_3ad99a60ec62068f.var_3340b02ebf8649d5 = function_53c4c53197386572(var_91153e08aa50531e.var_e7563888658cad65, 6);
    }
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x668
// Size: 0x199
function function_9eb2b20f81d7c464(grenade) {
    self endon("disconnect");
    grenade endon("death");
    if (issharedfuncdefined(#"hash_d8976e21a6adafba", #"hash_ca0042e3cac99672")) {
        grenade [[ getsharedfunc(#"hash_d8976e21a6adafba", #"hash_ca0042e3cac99672") ]](grenade);
    }
    if (_hasperk("specialty_rugged_eqp")) {
        grenade.hasruggedeqp = 1;
    }
    grenade.issuper = 1;
    grenade.bundle = namespace_85d036cb78063c4a::function_83a68723acc3296d(grenade.weapon_name);
    grenade namespace_2a9588dfac284b77::registerspawn(2, &function_ba58a20b3013d0e8);
    thread namespace_3bbb5a98b932c46f::monitordisownedgrenade(self, grenade);
    grenade thread function_c1abefb71b068a39();
    data = spawnstruct();
    data.endonstring = "mine_destroyed";
    data.skipdeath = 1;
    grenade thread namespace_d7b023c7eb3949d0::handle_moving_platform_touch(data);
    normal = position = velocity = surfacetype = hitent = stuckto = grenade waittill("missile_stuck");
    if (isdefined(stuckto)) {
        if (isent(stuckto) && is_train_ent(stuckto)) {
            grenade.origin = grenade.origin + (0, 0, 1.6);
        }
        grenade linkto(stuckto);
    }
    thread function_28f1150ddecc322e(grenade, surfacetype);
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x808
// Size: 0x94
function function_a9ef871da48567b1() {
    if (istrue(level.dangerzoneskipequipment)) {
        return;
    }
    if (isdefined(self.dangerzone)) {
        namespace_b2d5aa2baf2b5701::removespawndangerzone(self.dangerzone);
    }
    var_e1ac53d2b841f96c = function_53c4c53197386572(self.bundle.var_9ece98992bdf7d1e, namespace_b2d5aa2baf2b5701::getdefaultminedangerzoneradiussize());
    self.dangerzone = namespace_b2d5aa2baf2b5701::addspawndangerzone(self.origin, var_e1ac53d2b841f96c, 72, self.owner.team, undefined, self.owner, 0, self, 1);
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a3
// Size: 0x155
function function_28f1150ddecc322e(grenade, surfacetype) {
    grenade endon("mine_destroyed");
    grenade endon("death");
    grenade setotherent(self);
    grenade setentityowner(self);
    grenade missilethermal();
    grenade missileoutline();
    grenade setnodeploy(1);
    onequipmentplanted(grenade, "equip_gas_trap_plantable", &function_293cb1a08a85b8b6);
    thread monitordisownedequipment(self, grenade);
    grenade namespace_6d9917c3dc05dbe9::registersentient("Lethal_Static", grenade.owner, 1);
    var_f5d36c635cc8546b = function_53c4c53197386572(grenade.bundle.var_8e44dea5fb0fd8c1, 1);
    grenade thread minedamagemonitor(var_f5d36c635cc8546b);
    grenade thread function_49d67701924d486d();
    grenade function_641996b5e113c5c6(grenade, &function_12130c6112bc91e);
    grenade thread namespace_43a68cf8c122ab9::remoteinteractsetup(&function_583dd854dcee63c9, 0, 1);
    grenade function_a9ef871da48567b1();
    wait(0.75);
    if (istrue(grenade.touchedmovingplatform)) {
        grenade thread function_c313265bf3cab1e0();
    }
    wait(0.75);
    grenade thread function_e4221c03bb28d13f();
    /#
        if (getdvarint(@"hash_656462250876637a", 0)) {
            grenade thread function_f539d5d6dc0cc4a7();
        }
    #/
    thread namespace_3bbb5a98b932c46f::outlineequipmentforowner(grenade);
    grenade.headiconid = grenade namespace_7bdde15c3500a23f::setheadicon_factionimage(0, 2, undefined, undefined, undefined, 0.1, 1);
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ff
// Size: 0x8e
function function_7250c5a8ae9c2d87(vehicle) {
    var_9030149b0a44a43a = namespace_85d036cb78063c4a::function_eb25267ee439cabe("super_gas_trap");
    gas_trap_weapon = makeweapon(var_9030149b0a44a43a);
    vehicle dodamage(25, self.origin, self.owner, self, "MOD_EXPLOSIVE", gas_trap_weapon);
    ignoredamageid = vehicle namespace_a12dc1d0c8a64946::non_player_add_ignore_damage_signature(self.owner, gas_trap_weapon, self, "MOD_EXPLOSIVE");
    thread function_42b544f5fa77cee9();
    waitframe();
    if (isdefined(vehicle)) {
        vehicle namespace_a12dc1d0c8a64946::non_player_remove_ignore_damage_signature(ignoredamageid);
    }
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa94
// Size: 0x24
function function_42b544f5fa77cee9() {
    thread function_293cb1a08a85b8b6(2);
    self setentityowner(self.owner);
    self clearscriptabledamageowner();
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xabf
// Size: 0x25
function function_e015ee383cd188f5(attacker) {
    thread function_293cb1a08a85b8b6(2);
    self setentityowner(attacker);
    self clearscriptabledamageowner();
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaeb
// Size: 0x16
function function_583dd854dcee63c9(attacker) {
    thread function_293cb1a08a85b8b6(2);
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb08
// Size: 0x125
function function_293cb1a08a85b8b6(var_cbf7be4f62a0ddb2) {
    self notify("death");
    level.mines[self getentitynumber()] = undefined;
    self setscriptablepartstate("destroy", "active", 0);
    self setcandamage(0);
    makeexplosiveunusuabletag();
    namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.headiconid);
    self.headiconid = undefined;
    self.exploding = 1;
    if (isdefined(self.dangerzone)) {
        namespace_b2d5aa2baf2b5701::removespawndangerzone(self.dangerzone);
        self.dangerzone = undefined;
    }
    if (isdefined(self.owner)) {
        self.owner removeequip(self);
    }
    if (isdefined(self.var_793f8ee348966508)) {
        self.var_793f8ee348966508 delete();
    }
    if (issharedfuncdefined(#"hash_d8976e21a6adafba", #"hash_c33ceb91d0ca7a9d")) {
        self [[ getsharedfunc(#"hash_d8976e21a6adafba", #"hash_c33ceb91d0ca7a9d") ]](self);
    }
    function_83cebe0ae5318a7f(self);
    if (isdefined(var_cbf7be4f62a0ddb2)) {
        wait(var_cbf7be4f62a0ddb2);
    }
    namespace_2a9588dfac284b77::deregisterspawn();
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc34
// Size: 0x75
function function_c313265bf3cab1e0() {
    self endon("mine_triggered");
    self endon("mine_destroyed");
    self endon("death");
    self.attachedvelocity = (0, 0, 0);
    update_interval = 0.2;
    while (1) {
        old_origin = self.origin;
        wait(update_interval);
        self.attachedvelocity = 1 / update_interval * (self.origin - old_origin);
    }
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcb0
// Size: 0x38
function function_71e843b2ae312076(mine) {
    return isdefined(mine) && isdefined(mine.attachedvelocity) && length2dsquared(mine.attachedvelocity) > 0.01;
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf0
// Size: 0x11b
function function_e4221c03bb28d13f() {
    self endon("mine_triggered");
    self endon("mine_destroyed");
    self endon("death");
    while (1) {
        var_f9b008542cd70a05 = self waittill("trigger_grenade");
        /#
            assert(isdefined(var_f9b008542cd70a05));
        #/
        if (istrue(self.isdisabled) || istrue(self.isjammed)) {
            continue;
        }
        foreach (ent in var_f9b008542cd70a05) {
            if (ent.classname == "script_vehicle") {
                if (ent namespace_739a1beacdad3457::vehicle_mines_isfriendlytomine(self)) {
                    continue;
                }
                if (!namespace_739a1beacdad3457::vehicle_mines_shouldvehicletriggermine(ent, self)) {
                    continue;
                }
                namespace_739a1beacdad3457::vehicle_mines_minetrigger(ent, self);
                break;
            }
            if (isagent(ent) || isplayer(ent)) {
                if (isdefined(ent.vehicle)) {
                    continue;
                }
                if (!isreallyalive(ent)) {
                    continue;
                }
                thread function_e7eb101b2882a52f(ent);
                break;
            }
        }
    }
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe12
// Size: 0x117
function function_f539d5d6dc0cc4a7() {
    /#
        self endon("gas_trap_play_gunfire");
        self endon("gas_trap_exited");
        self endon("<unknown string>");
        if (isdefined(self.var_b04988253314171f)) {
            self.var_b04988253314171f delete();
        }
        self.var_b04988253314171f = spawn("<unknown string>", self.origin, 0, 48, 48);
        self.var_b04988253314171f enablelinkto();
        self.var_b04988253314171f linkto(self);
        cylinder(self.origin, self.origin + (0, 0, 48), 48, (1, 1, 0), 0, 100);
        while (1) {
            ent = self.var_b04988253314171f waittill("<unknown string>");
            /#
                assert(isdefined(ent));
            #/
            self notify("<unknown string>", [0:ent]);
            print3d(self.origin, "<unknown string>", (1, 1, 0), 1, 0.5, 100, 1);
        }
    #/
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf30
// Size: 0x8e
function function_e7eb101b2882a52f(ent) {
    self endon("mine_destroyed");
    self endon("death");
    self notify("mine_triggered");
    self.triggeredbyplayer = 1;
    makeexplosiveunusuabletag();
    self setscriptablepartstate("effects", "active", 0);
    position = self.origin + (0, 0, 10);
    self.var_93af2771622642d7 = 1;
    thread function_b6591a59ba8c122a(position, self.owner, self.team);
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xfc5
// Size: 0x53
function function_9a40b84c61fcf698(vehicle, mine) {
    mine endon("mine_destroyed");
    mine endon("death");
    mine.owner endon("disconnect");
    mine notify("mine_triggered");
    mine makeexplosiveunusuabletag();
    wait(0.2);
    mine thread function_7250c5a8ae9c2d87(vehicle);
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x101f
// Size: 0x6f
function function_12130c6112bc91e(data) {
    attacker = data.attacker;
    self notify("enemy_destroyed_equipment", attacker);
    if (istrue(namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker))) {
        attacker notify("destroyed_equipment");
        attacker namespace_58a74e7d54b56e8d::givescoreforequipment(self);
    }
    if (isplayer(attacker)) {
        attacker updatedamagefeedback("");
    }
    thread function_583dd854dcee63c9(attacker);
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1095
// Size: 0x57
function function_49d67701924d486d() {
    self endon("death");
    attacker = self waittill("detonateExplosive");
    if (isdefined(attacker)) {
        thread function_e015ee383cd188f5(attacker);
    } else if (isdefined(self.owner)) {
        thread function_e015ee383cd188f5(self.owner);
    } else {
        thread function_583dd854dcee63c9();
    }
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f3
// Size: 0x2b
function function_c1abefb71b068a39() {
    self endon("mine_destroyed");
    self endon("death");
    level waittill_any_2("game_ended", "bro_shot_start");
    thread function_583dd854dcee63c9();
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1125
// Size: 0x22
function function_62a347ed3920d124(var_793f8ee348966508) {
    var_793f8ee348966508 endon("death");
    self waittill("death");
    var_793f8ee348966508 delete();
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x114e
// Size: 0x40
function function_c80f2e10e46fac9f(attacker) {
    self endon("death");
    attacker thread namespace_48a08c5037514e04::doscoreevent(#"hash_4af2232e0f83610b");
    self.isdisabled = 1;
    wait(6);
    self.isdisabled = 0;
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1195
// Size: 0x14a
function function_b6591a59ba8c122a(position, owner, team, duration, scale) {
    self setcandamage(0);
    if (!isdefined(duration)) {
        duration = function_53c4c53197386572(self.bundle.var_9d2049d108bea937, 2);
    }
    if (!isdefined(scale)) {
        scale = 1;
    }
    var_211c83b2cec04736 = ter_op(isdefined(self.bundle.var_86263e241d6d10b1), int(self.bundle.var_86263e241d6d10b1), int(256 * scale));
    trigger = spawn("trigger_radius", position + (0, 0, int(-57.75 * scale)), 0, var_211c83b2cec04736, int(175 * scale));
    trigger namespace_2a9588dfac284b77::registerspawn(1, &sweepgas);
    trigger endon("death");
    trigger.owner = owner;
    trigger.team = team;
    trigger.trap = self;
    trigger.playersintrigger = [];
    trigger thread function_24b91e463e75891f();
    trigger thread function_cdf66f292a6d921b();
    wait(duration);
    thread function_583dd854dcee63c9();
    trigger thread function_673266358e778a6c();
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12e6
// Size: 0xb
function sweepgas() {
    thread function_673266358e778a6c();
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12f8
// Size: 0x75
function function_673266358e778a6c() {
    foreach (player in self.playersintrigger) {
        if (!isdefined(player)) {
            continue;
        }
        player thread function_779cd9adc64d02e9(self getentitynumber());
    }
    namespace_2a9588dfac284b77::deregisterspawn();
    self delete();
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1374
// Size: 0x85
function function_e58fc6a1208d483d(trigger) {
    if (!isdefined(self.gastriggerstouching)) {
        self.gastriggerstouching = [];
    }
    entnum = trigger getentitynumber();
    self.gastriggerstouching[entnum] = trigger;
    self.lastgastouchtime = gettime();
    if (!isdefined(self.var_a8005043799ca23)) {
        thread function_e527fb1c56a67ed2(trigger);
    } else {
        self.var_a8005043799ca23 = level.var_3ad99a60ec62068f.maxtime;
    }
    return entnum;
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1401
// Size: 0x35
function function_779cd9adc64d02e9(var_b2907a4520674f1a) {
    /#
        assertex(isdefined(var_b2907a4520674f1a), "gas_trap_gasOnExitTrigger called with an invalid trigger ID.");
    #/
    self.gastriggerstouching[var_b2907a4520674f1a] = undefined;
    self.lastgastouchtime = gettime();
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x143d
// Size: 0x14a
function function_24b91e463e75891f() {
    self endon("death");
    while (1) {
        player = self waittill("trigger");
        if (!isplayer(player)) {
            continue;
        }
        if (player namespace_a2f809133c566621::isjuggernaut()) {
            continue;
        }
        if (function_da8a31143b88e833(player)) {
            continue;
        }
        if (!player namespace_f8065cafc523dba5::_isalive()) {
            continue;
        }
        if (isdefined(self.playersintrigger[player getentitynumber()])) {
            continue;
        }
        if (level.teambased) {
            if (isdefined(self.owner) && isalive(self.owner)) {
                if (player != self.owner && !namespace_f8065cafc523dba5::playersareenemies(player, self.owner)) {
                    continue;
                }
            } else if (namespace_f8065cafc523dba5::isfriendly(self.team, player)) {
                continue;
            }
        }
        if (player == self.owner) {
            continue;
        }
        self.playersintrigger[player getentitynumber()] = player;
        player thread function_e58fc6a1208d483d(self);
        if (istrue(self.trap.var_93af2771622642d7)) {
            self.trap.var_93af2771622642d7 = 0;
            self.trap setscriptablepartstate("hack_usable", "off");
        }
    }
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x158e
// Size: 0xb7
function function_cdf66f292a6d921b() {
    self endon("death");
    while (1) {
        foreach (id, player in self.playersintrigger) {
            if (!isdefined(player)) {
                self.playersintrigger[id] = undefined;
            } else {
                if (!player namespace_f8065cafc523dba5::_isalive()) {
                    continue;
                }
                if (player istouching(self) && !function_da8a31143b88e833(player)) {
                    continue;
                }
                self.playersintrigger[player getentitynumber()] = undefined;
                player thread function_779cd9adc64d02e9(self getentitynumber());
            }
        }
        waitframe();
    }
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x164c
// Size: 0x14
function function_c0aa33366b33ddfa() {
    self waittill("death_or_disconnect");
    function_3d115d834192a21f(1);
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1667
// Size: 0x1be
function function_e527fb1c56a67ed2(trigger) {
    thread function_c0aa33366b33ddfa();
    self endon("death_or_disconnect");
    var_91153e08aa50531e = namespace_4a3033eafa6fd07::function_bf9c7e9dd30180e3("super_gas_trap");
    if (_hasperk("specialty_hallucination_immunity")) {
        return;
    }
    self.var_a8005043799ca23 = level.var_3ad99a60ec62068f.maxtime;
    attacker = trigger.owner;
    var_a2d4da59b401c41f = getdvarint(@"hash_65b2a1e4bfb18c81", 0) == 0;
    if (isdefined(var_91153e08aa50531e)) {
        while (self.var_a8005043799ca23 > 0) {
            wait(level.var_3ad99a60ec62068f.var_218d7dd5b17234f4);
            self.var_a8005043799ca23 = self.var_a8005043799ca23 - level.var_3ad99a60ec62068f.var_218d7dd5b17234f4;
            if (isdefined(trigger) && isdefined(trigger.playersintrigger[self getentitynumber()])) {
                self dodamage(level.var_3ad99a60ec62068f.var_4873abd0407e7e54, trigger.origin, attacker, trigger.trap);
            }
            if (self.gastriggerstouching.size >= 1) {
                self.var_a8005043799ca23 = level.var_3ad99a60ec62068f.maxtime;
            }
            if (!istrue(self.var_72a699992f3bb880)) {
                function_c0545824b502e347(0);
                childthread function_bfc451da8aefa61f(attacker);
            }
            if (var_a2d4da59b401c41f) {
                childthread function_ac8305738ed64f77();
            }
            if (!istrue(self.gascoughinprogress)) {
                function_cb203bea4d439b8b(0);
                if (istrue(var_91153e08aa50531e.var_809cef87d94991dd)) {
                    childthread function_223c69b4c52f810(attacker, 0);
                    namespace_e765f0aad2368473::enableloopingcoughaudio();
                }
            }
        }
        function_3d115d834192a21f(0);
    }
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x182c
// Size: 0x1e
function function_c0545824b502e347(var_fcef8d217a441961) {
    self notify("gas_trap_play_gunfire");
    self.var_72a699992f3bb880 = undefined;
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1851
// Size: 0x167
function function_bfc451da8aefa61f(attacker) {
    self notify("gas_trap_play_gunfire");
    self endon("gas_trap_play_gunfire");
    var_e38a0e40421d2365 = [0:"ar", 1:"smg", 2:"sn"];
    var_e51767e71f37fdba = spawn("script_model", self.origin);
    self.var_72a699992f3bb880 = 1;
    pinglocationenemyteams(self.origin, attacker.team, self, level.var_3ad99a60ec62068f.var_3340b02ebf8649d5, level.var_3ad99a60ec62068f.var_605bc8d3bfb20d0d, self);
    var_bd5f9b66c652f447 = randomfloatrange(-1000, 1000);
    var_bd5f9a66c652f214 = randomfloatrange(-1000, 1000);
    var_e51767e71f37fdba.origin = self.origin + (var_bd5f9b66c652f447, var_bd5f9a66c652f214, 0);
    firetype = var_e38a0e40421d2365[randomint(var_e38a0e40421d2365.size)];
    var_90e6bc3a37537c77 = "iw8_decoy_grenade_" + firetype + "_fire";
    self playsoundtoplayer(var_90e6bc3a37537c77, self, var_e51767e71f37fdba);
    wait(0.1);
    self playsoundtoplayer(var_90e6bc3a37537c77, self, var_e51767e71f37fdba);
    wait(0.1);
    self playsoundtoplayer(var_90e6bc3a37537c77, self, var_e51767e71f37fdba);
    wait(randomfloatrange(0.5, 2));
    self.var_72a699992f3bb880 = 0;
    var_e51767e71f37fdba delete();
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19bf
// Size: 0x110
function function_ac8305738ed64f77() {
    self endon("death_or_disconnect");
    self notify("gas_trap_modify_blur");
    self endon("gas_trap_modify_blur");
    self visionsetnakedforplayer("cer_gas_mp");
    var_22f87c8bf7c4616b = "cer_gas_trap_heavy_mp";
    if (namespace_82dcd1d5ae30ff7::_hasperk("specialty_gas_trap_resist")) {
        var_22f87c8bf7c4616b = "cer_gas_trap_light_mp";
    } else if (isdefined(self.gastriggerstouching)) {
        foreach (trigger in self.gastriggerstouching) {
            if (isdefined(trigger) && isdefined(trigger.owner) && trigger.owner == self) {
                /#
                    if (getdvarint(@"hash_6c7fd12a611ca1e8", 0) == 1) {
                        goto LOC_000000e9;
                    }
                #/
                var_22f87c8bf7c4616b = "cer_gas_trap_light_mp";
            }
        }
    }
    while (1) {
        _shellshock(var_22f87c8bf7c4616b, "gas", 0.5, 0);
        wait(0.2);
    }
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ad6
// Size: 0x2c
function function_142d2f94dd33931a(var_fcef8d217a441961) {
    self notify("gas_trap_modify_blur");
    self visionsetnakedforplayer("");
    if (!istrue(var_fcef8d217a441961)) {
        _stopshellshock();
    }
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b09
// Size: 0x9e
function function_223c69b4c52f810(attacker, var_e81764066eb9bacb) {
    var_a15ffac7e41222a2 = namespace_82dcd1d5ae30ff7::_hasperk("specialty_gas_grenade_resist");
    var_8907f741f3a7b3f7 = isdefined(attacker) && self == attacker;
    if (!var_8907f741f3a7b3f7 && var_a15ffac7e41222a2) {
        return;
    }
    var_dd1cf0b2b3066ed4 = 0;
    if (istrue(var_e81764066eb9bacb)) {
        var_dd1cf0b2b3066ed4 = 1;
        if (var_8907f741f3a7b3f7) {
            var_dd1cf0b2b3066ed4 = 0;
            /#
                if (getdvarint(@"hash_6c7fd12a611ca1e8", 0) == 1) {
                    var_dd1cf0b2b3066ed4 = 1;
                }
            #/
        }
    }
    if (!istrue(self.gascoughinprogress) || istrue(var_e81764066eb9bacb)) {
        thread function_6c75b9d6b11459c5(var_dd1cf0b2b3066ed4);
    }
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bae
// Size: 0xd8
function function_6c75b9d6b11459c5(var_dd1cf0b2b3066ed4) {
    self endon("death_or_disconnect");
    self endon("gas_trap_clear_cough");
    self endon("gas_trap_exited");
    self notify("gas_trap_queue_cough");
    self endon("gas_trap_queue_cough");
    var_fff525b27a42fc40 = gettime() + 1000;
    while (function_b1c95073710796b8()) {
        waitframe();
    }
    if (var_dd1cf0b2b3066ed4 && gettime() > var_fff525b27a42fc40) {
        var_dd1cf0b2b3066ed4 = 0;
    }
    var_81b4070b5858078d = getdvarint(@"hash_827901421ad0679", 1) == 1;
    if (var_81b4070b5858078d) {
        thread function_d96f17418ee81a89(var_dd1cf0b2b3066ed4);
    } else {
        self endon("gas_trap_begin_coughing");
        self.gascoughinprogress = 1;
        if (var_dd1cf0b2b3066ed4) {
            self playgestureviewmodel("iw9_ges_gas_cough_long");
            wait(3.33);
        } else {
            self playgestureviewmodel("iw9_ges_gas_cough");
            wait(1.833);
        }
        self.gascoughinprogress = undefined;
    }
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c8d
// Size: 0x10b
function function_d96f17418ee81a89(var_dd1cf0b2b3066ed4) {
    self endon("death_or_disconnect");
    self endon("gas_trap_clear_cough");
    self notify("gas_trap_begin_coughing");
    self endon("gas_trap_begin_coughing");
    self.gascoughinprogress = 1;
    if (self hasweapon(makeweapon("gas_cough_light_mp"))) {
        _takeweapon("gas_cough_light_mp");
    }
    if (self hasweapon(makeweapon("gas_cough_heavy_mp"))) {
        _takeweapon("gas_cough_heavy_mp");
    }
    weaponobj = ter_op(istrue(var_dd1cf0b2b3066ed4), makeweapon("gas_cough_heavy_mp"), makeweapon("gas_cough_light_mp"));
    duration = ter_op(istrue(var_dd1cf0b2b3066ed4), 3.33, 1.833);
    self giveandfireoffhand(weaponobj);
    childthread function_7003ab18f0d40f9e(weaponobj);
    childthread function_cd8cb96396c7e7bd(weaponobj);
    childthread function_3b420f49c5a08c56(duration);
    waittill_any_3("gas_trap_coughWeaponFired", "gas_trap_coughWeaponTaken", "gas_trap_coughDuration");
    if (self hasweapon(weaponobj)) {
        _takeweapon(weaponobj);
    }
    self.gascoughinprogress = undefined;
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d9f
// Size: 0x26
function function_e320f43bc3d01434(var_fcef8d217a441961) {
    self notify("gas_trap_queue_cough");
    self notify("gas_trap_begin_coughing");
    self.gascoughinprogress = undefined;
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dcc
// Size: 0xad
function function_cb203bea4d439b8b(var_fcef8d217a441961) {
    self notify("gas_trap");
    self notify("gas_trap_begin_coughing");
    self.gascoughinprogress = undefined;
    namespace_e765f0aad2368473::disableloopingcoughaudio();
    if (!istrue(var_fcef8d217a441961)) {
        var_81b4070b5858078d = getdvarint(@"hash_827901421ad0679", 1) == 1;
        if (var_81b4070b5858078d) {
            if (self hasweapon(makeweapon("gas_cough_light_mp"))) {
                _takeweapon("gas_cough_light_mp");
            }
            if (self hasweapon(makeweapon("gas_cough_heavy_mp"))) {
                _takeweapon("gas_cough_heavy_mp");
            }
        } else {
            self stopgestureviewmodel("iw9_ges_gas_cough");
            self stopgestureviewmodel("iw9_ges_gas_cough_long");
        }
    }
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e80
// Size: 0x4a
function function_7003ab18f0d40f9e(var_33f644489e4f15ae) {
    self endon("gas_trap_coughWeaponTaken");
    self endon("gas_trap_coughDuration");
    while (1) {
        weaponobj = self waittill("offhand_fired");
        if (issameweapon(weaponobj, var_33f644489e4f15ae)) {
            break;
        }
    }
    self notify("gas_trap_coughWeaponFired");
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ed1
// Size: 0x30
function function_cd8cb96396c7e7bd(var_33f644489e4f15ae) {
    self endon("gas_trap_coughWeaponFired");
    self endon("gas_trap_coughDuration");
    while (self hasweapon(var_33f644489e4f15ae)) {
        waitframe();
    }
    self notify("gas_trap_coughWeaponTaken");
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f08
// Size: 0x24
function function_3b420f49c5a08c56(var_dc7d7db6d1535605) {
    self endon("gas_trap_coughWeaponTaken");
    self endon("gas_trap_coughWeaponFired");
    wait(var_dc7d7db6d1535605);
    self notify("gas_trap_coughDuration");
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f33
// Size: 0x26
function function_b1c95073710796b8() {
    if (!val::get("cough_gesture")) {
        return 1;
    }
    if (!val::get("offhand_weapons")) {
        return 1;
    }
    return 0;
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f61
// Size: 0xac
function function_3d115d834192a21f(var_fcef8d217a441961) {
    self.var_a8005043799ca23 = undefined;
    function_142d2f94dd33931a(var_fcef8d217a441961);
    function_cb203bea4d439b8b(var_fcef8d217a441961);
    function_c0545824b502e347(var_fcef8d217a441961);
    if (isdefined(self.gastriggerstouching)) {
        foreach (trigger in self.gastriggerstouching) {
            if (!isdefined(trigger)) {
                continue;
            }
            trigger.playersintrigger[self getentitynumber()] = undefined;
        }
    }
    self.gastriggerstouching = undefined;
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2014
// Size: 0x19
function function_da8a31143b88e833(player) {
    if (player function_7ee20cf3c0390e21()) {
        return 1;
    }
    return 0;
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2035
// Size: 0xa0
function is_train_ent(hitent) {
    if (isdefined(level.wztrain_info)) {
        foreach (ent in level.wztrain_info.train_array) {
            if (ent == hitent) {
                return 1;
            } else if (isdefined(ent.linked_model) && ent.linked_model == hitent) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace gas_trap/namespace_c8c97309eacd3392
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20dd
// Size: 0xb
function function_ba58a20b3013d0e8() {
    function_293cb1a08a85b8b6(0);
}

