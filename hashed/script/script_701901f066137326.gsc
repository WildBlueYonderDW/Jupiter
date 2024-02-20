// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using script_208955cb4d2c8fb3;
#using script_743e6c2d23e7f91f;
#using script_21862d4e3ad68db8;
#using scripts\mp\mp_agent_damage.gsc;
#using script_5762ac2f22202ba2;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using script_48814951e916af89;
#using script_371b4c2ab5861e62;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\mp\killstreaks\remotetank.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\mp\outofbounds.gsc;
#using script_3214e6fcdce468a7;
#using script_7e41e37180e554f;
#using script_2047cdbf5176ba0;
#using script_5753ba9c28794a65;
#using script_22f1701e151b9d12;
#using script_edb8e725d068ac9;
#using script_b26e8f519926066;
#using script_70c2478fc6d8ef;
#using script_10b6724c15a95e8;
#using script_42adcce5878f583;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using script_24fbedba9a7a1ef4;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using script_736dec95a49487a6;
#using scripts\mp\utility\points.gsc;

#namespace namespace_28488a8b5ddf6dbc;

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0xb31
// Size: 0x57e
function autoexec main() {
    namespace_ad1f398af6f48cb1::function_37ae676661b1fbef("Maestro", "WARLORD_MAESTRO");
    namespace_ad1f398af6f48cb1::function_56e8f78ce1511d35("Maestro", &function_82a88d7e4d54f038);
    namespace_ad1f398af6f48cb1::function_dbfada6bda9049b3("Maestro", &function_325892ecd89575e1);
    namespace_3c37cb17ade254d::registersharedfunc("warlords", "tile_g_warlord_registration", &function_3185a43162bd15e2);
    level.ob.var_bfc5850d296d2ebe["Maestro"].goalvolume = function_f159c10d5cf8f0b4("goalVolume", "script_noteworthy");
    var_da47572a9821e77d = function_f159c10d5cf8f0b4("goalSubVolume", "script_noteworthy");
    level.ob.var_bfc5850d296d2ebe["Maestro"].var_da47572a9821e77d = array_sort_by_script_index(var_da47572a9821e77d);
    foreach (volume in level.ob.var_bfc5850d296d2ebe["Maestro"].goalvolume) {
        if (volume.targetname == "warlord_maestro_encounter") {
            level.ob.var_bfc5850d296d2ebe["Maestro"].goalvolume = volume;
            break;
        }
    }
    registersharedfunc("warlord_maestro", "bombDeathMonitor", &function_dfda2e2f7083463b);
    level._effect["drone_turret_explode"] = loadfx("vfx/iw8_mp/killstreak/vfx_drone_lrg_dest_exp.vfx");
    level.var_86b4835c1806d690 = [];
    while (!isdefined(level.struct_class_names)) {
        waitframe();
    }
    level.ob.var_bfc5850d296d2ebe["Maestro"].var_52d12ef9ecc1c146 = [];
    level.ob.var_bfc5850d296d2ebe["Maestro"].var_52d12ef9ecc1c146[0] = namespace_3c37cb17ade254d::getstructarray("maestro_path_one_point", "script_noteworthy");
    level.ob.var_bfc5850d296d2ebe["Maestro"].var_52d12ef9ecc1c146[1] = namespace_3c37cb17ade254d::getstructarray("maestro_path_two_point", "script_noteworthy");
    level.ob.var_bfc5850d296d2ebe["Maestro"].var_15ee5913a59b8dcf = namespace_3c37cb17ade254d::getstructarray("maestro_lift_point", "script_noteworthy");
    level.ob.var_bfc5850d296d2ebe["Maestro"].var_4d0b3556ea76e2bc = namespace_3c37cb17ade254d::getstructarray("no_drone_safety_zone", "script_noteworthy");
    if (isdefined(level.struct_class_names["script_noteworthy"]["maestro_wheelson_spawn"])) {
        level.ob.var_bfc5850d296d2ebe["Maestro"].var_91baee18646d80bb = level.struct_class_names["script_noteworthy"]["maestro_wheelson_spawn"];
        node = level.ob.var_bfc5850d296d2ebe["Maestro"].var_91baee18646d80bb[0];
        patrolpath = namespace_adc82618e9ef9897::function_45d2e44c40437351(node, "maestro_wheelson_path_primary", "maestro_wheelson_path_secondary");
        level.ob.var_bfc5850d296d2ebe["Maestro"].var_9e6eb7678f5c7ff3 = patrolpath;
        level._effect["vfx_dmz_Wheelson_flashlight"] = loadfx("vfx/iw9/level/mp_dmz_bio_lab/vfx_dmz_wheelson_spotlight.vfx");
    }
    if (isdefined(level.struct_class_names["script_noteworthy"]["maestro_drone_spawner"])) {
        level.ob.var_bfc5850d296d2ebe["Maestro"].var_68e6124a989b5a31 = level.struct_class_names["script_noteworthy"]["maestro_drone_spawner"];
        level.ob.var_bfc5850d296d2ebe["Maestro"].var_5a0e8d4bcd8ac4c2 = level.struct_class_names["script_noteworthy"]["maestro_drone_restock_path"];
        level.ob.var_bfc5850d296d2ebe["Maestro"].var_926ec82bd8dad665 = level.struct_class_names["script_noteworthy"]["maestro_drone_restocking_chokepoint"];
        level.ob.var_bfc5850d296d2ebe["Maestro"].var_784a9ecb89bdd253 = level.struct_class_names["script_noteworthy"]["maestro_drone_ephemeral_chokepoint"];
        level.ob.var_bfc5850d296d2ebe["Maestro"].var_88abc4fb2383bef5 = level.struct_class_names["script_noteworthy"]["maestro_jump_point"];
        level.ob.var_bfc5850d296d2ebe["Maestro"].var_7a60a759219496c8 = level.struct_class_names["script_noteworthy"]["maestro_land_point"];
        level.ob.var_bfc5850d296d2ebe["Maestro"].var_7a60a759219496c8 = array_sort_by_script_index(level.ob.var_bfc5850d296d2ebe["Maestro"].var_7a60a759219496c8);
        level.ob.var_bfc5850d296d2ebe["Maestro"].var_e1c44cca3778fd45 = level.struct_class_names["script_noteworthy"]["maestro_high_point"];
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10b6
// Size: 0x37
function private function_3185a43162bd15e2() {
    if (!istrue(namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2("warlords", "warlordIsDisabled", "WARLORD_MAESTRO"))) {
        namespace_609d2ee77dae3d8c::function_447c6ab4bea16b52("objective", "REV_OB_WARLORD", &namespace_75b9b66caa533c31::function_8abadf3d8f19384a, &namespace_bb6f88126dc368e8::function_fd69cf02ba4d90a2);
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f4
// Size: 0x155
function function_82a88d7e4d54f038(agent, data) {
    var_bfc5850d296d2ebe = namespace_ad1f398af6f48cb1::function_9acf953fd6bf2e46("Maestro");
    level.ob.var_bfc5850d296d2ebe["Maestro"].requestid = agent.var_ad46aadd4e3290d7;
    function_3c85fe57dbc02e4e(agent.var_ad46aadd4e3290d7, &function_a0c7cc505f1c5675, agent);
    function_5b9ffa6991e4d730(agent.var_ad46aadd4e3290d7, &function_a2fef9d268c4b5c2, agent);
    var_dd271c02249f77a6 = function_9a39e23c3c52c2af(agent.var_ad46aadd4e3290d7);
    agent.var_47e0dccd1b8b6d95 = function_54da428ad4a96f2e("ai_flood_fill_encounter:enc_ob_activity_flood_warlord_maestro", var_dd271c02249f77a6.origin, var_dd271c02249f77a6.radius, 1, 1, 0);
    function_c67c7b9e7cbf3821(agent.var_47e0dccd1b8b6d95, &function_20076ce5ca820299, agent);
    function_c6942df117004b8(agent.var_47e0dccd1b8b6d95, &function_6fe30a922ca26cb0, agent);
    function_5b9ffa6991e4d730(agent.var_47e0dccd1b8b6d95, &function_a2fef9d268c4b5c2, agent);
    agent.ob.var_1144fa51d2a07ee4 = 0;
    agent.ob.var_e6d6e2128152581a = 0;
    function_79bb0c9010db500f(agent, var_bfc5850d296d2ebe);
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1250
// Size: 0xfd
function function_325892ecd89575e1(agent, data) {
    self.grenadeammo = 0;
    self.var_5323a94889eff1de = 1;
    if (agent.subclass == "ob_shielded") {
        agent.var_c833409fb72d15fb = 1;
        agent setgoalpos(agent.origin, 256);
    } else {
        volumes = level.ob.var_bfc5850d296d2ebe["Maestro"].var_da47572a9821e77d;
        foreach (goal in volumes) {
            if (ispointinvolume(agent.origin, goal)) {
                agent setgoalvolumeauto(goal, goal.angles);
            }
        }
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 13, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1354
// Size: 0x146
function function_e6b424a8da46b2f0(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon) {
    var_4fb949ce5da41eca = idamage;
    if (isdefined(einflictor) && isdefined(einflictor.var_db8581b0d3afd64c)) {
        var_4fb949ce5da41eca = 0;
    }
    params = level.ob.var_bfc5850d296d2ebe["Maestro"];
    if (function_961d0587afa83609(params)) {
        if (isdefined(sweapon) && is_equal(function_f581838ce4328f7a(sweapon), "blackhole_bomb")) {
            var_4fb949ce5da41eca = 0;
        }
    }
    var_4fb949ce5da41eca = namespace_99e3b18d3c0c359a::function_863ec3e354fbfe1f(einflictor, eattacker, var_4fb949ce5da41eca, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon);
    function_6385032960fc51b1(1);
    if (isdefined(self.escaping) && self.escaping) {
        var_4fb949ce5da41eca = idamage * (1 - getdvarfloat(@"hash_cac25c7fa5bc3cc1", params.var_10822a7e7ccbd521));
    }
    return int(var_4fb949ce5da41eca);
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14a2
// Size: 0x367
function function_79bb0c9010db500f(warlord, params) {
    warlord.var_5323a94889eff1de = 1;
    warlord.suppressionduration = 10;
    warlord.suppressionthreshold = 0.01;
    warlord.suppressiondecrement = 0.25;
    warlord.var_7cea08b66b2ad878 = 0;
    warlord.var_cbd87a0bc497b778 = 1;
    warlord.var_8e3405ac46c40e0f = 0;
    warlord.var_d5e499e7fe2c490b = 0;
    warlord.var_9aa77ab756fdca82 = 10000;
    warlord.var_43e2ad424676b8d4 = 1000;
    warlord.var_7562828a4ad55ff7 = 1;
    warlord.var_8f9e0bd9f1142b53 = 0;
    warlord.var_b8a5d15fbaa9387d = getdvarint(@"hash_312502a35e1237e2", 10000);
    warlord function_f3bb4f4911a1beb2(#"emp", #"hash_a865e3770eb96298", warlord, &function_45294eab84bd3fc4);
    warlord.var_970170ffd4b081ac = &function_e6b424a8da46b2f0;
    warlord.var_d935d530a63e48ba = 0;
    warlord.var_c557ad4f44477f11 = 1;
    warlord.escaping = 0;
    warlord.var_e2fcb999009f71bd = 0;
    warlord.var_5e9eeedc4f37723b = 0;
    warlord.var_d5d75e1d5341e872 = (0, 0, 0);
    if (isdefined(params.var_9e6eb7678f5c7ff3)) {
        var_8a28fd9df2f03764 = warlord thread wheelson_spawn(params.var_9e6eb7678f5c7ff3.path[0].origin, params.var_9e6eb7678f5c7ff3, undefined, undefined, undefined, undefined, warlord);
        var_8a28fd9df2f03764.damagecallback = &function_168280faef14cbf8;
        var_8a28fd9df2f03764.deathcallback = &function_120b1e4e62e7695c;
        var_8a28fd9df2f03764.var_1e0eb63ecb3f1e2 = 1;
        var_8a28fd9df2f03764.var_9d26ac1e325367ce = function_2336488258354fbc(#"aitype", %"hash_166461adeef0ab8d");
        var_8a28fd9df2f03764.var_534e788bc498be9f = getscriptbundle(%"hash_6647d2ce83e8c20a");
        var_8a28fd9df2f03764.subclass = var_8a28fd9df2f03764.var_534e788bc498be9f.name;
        var_8a28fd9df2f03764.var_52dcdba485e7ceeb = "tag_body";
        var_8a28fd9df2f03764.var_af81370570c04ca = 8;
        var_8a28fd9df2f03764.var_7cfe1b189bcf3cad = getdvarint(@"hash_8e928149711b5a66", 10);
        var_8a28fd9df2f03764.var_d04bb72230a5a308 = getdvarint(@"hash_cf673abea9981f79", 3);
    }
    warlord thread function_e39419538782659e(params);
    params.trackers.var_c85cd95d46492795[params.trackers.var_c85cd95d46492795.size] = var_8a28fd9df2f03764;
    warlord.var_a4738c70736d3a61 = &function_fea10e99d08599d7;
    triggers = function_f159c10d5cf8f0b4("reinforcement_trigger", "targetname");
    foreach (trigger in triggers) {
        trigger thread function_4b8b0afabc972cf8(warlord);
    }
    warlord.var_4c72897b1b21ab7f = 1;
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1810
// Size: 0xd2
function private function_961d0587afa83609(params) {
    if (isdefined(params.trackers.var_647a70845738f8bc)) {
        foreach (drone in params.trackers.var_647a70845738f8bc) {
            var_65d5104e6f0ea258 = istrue(drone.var_f781079e220f1cde) && isdefined(drone.behavior) && drone.behavior == "protect";
            if (var_65d5104e6f0ea258 && istrue(drone.var_2a6024dda5bc8738)) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x18ea
// Size: 0x84
function private function_99fedeb298e8b70(params, var_8f9e0bd9f1142b53) {
    var_74e97d68ac1bdeb5 = getdvarint(@"hash_4d77d6ac9d9d5dbc", function_53c4c53197386572(params.var_59eca32f21910808, 7));
    var_e281e480d5e23a85 = getdvarint(@"hash_4fcee75eefec8505", function_53c4c53197386572(params.var_50ca1e6d9f2ca345, 2));
    var_933f3b6a13301e2 = function_53c4c53197386572(var_8f9e0bd9f1142b53, 0);
    return var_74e97d68ac1bdeb5 + var_933f3b6a13301e2 * var_e281e480d5e23a85;
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1976
// Size: 0x84
function private function_c4a3b2f8fe65e727(params, var_8f9e0bd9f1142b53) {
    var_74e97d68ac1bdeb5 = getdvarint(@"hash_86078143dd7cb314", function_53c4c53197386572(params.var_affa9b1c7dd6d033, 2));
    var_e281e480d5e23a85 = getdvarint(@"hash_c3935eeeece426cb", function_53c4c53197386572(params.var_be95333ad2001a2f, 1));
    var_933f3b6a13301e2 = function_53c4c53197386572(var_8f9e0bd9f1142b53, 0);
    return var_74e97d68ac1bdeb5 + var_933f3b6a13301e2 * var_e281e480d5e23a85;
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a02
// Size: 0x1b1
function private function_e39419538782659e(params) {
    self endon("death");
    params.trackers = spawnstruct();
    params.trackers.var_647a70845738f8bc = [];
    params.trackers.var_c85cd95d46492795 = [];
    params.trackers.var_3aef66aa7812fab4 = [];
    params.trackers.var_dd72808b849e4d52 = [];
    params.trackers.var_d5dc746b4c149b00 = [];
    params.trackers.var_f6b4651f19aa358 = 0;
    params.trackers.var_dffa579e39f9bdd5 = 0;
    params.trackers.var_47ed3bc2d55c6fce = 0;
    params.trackers.var_d220d4746b1774d5 = 0;
    params.trackers.var_d6f06f378d054276 = 0;
    params.trackers.var_8c0638b444bc5206 = 0;
    /#
        thread function_289bc4e107d9c7e1(params);
    #/
    thread function_1d511f730cc98a07(params);
    thread function_62883a99c01a4108(params);
    thread function_5bb38d64c886e080(params);
    while (!self.bisincombat) {
        wait(2);
    }
    volume = level.ob.var_bfc5850d296d2ebe["Maestro"].var_da47572a9821e77d[4];
    self setgoalvolumeauto(volume);
    thread function_4f3833106786643e(params);
    level thread function_7dbd5a71beaa0999(self, params.trackers);
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1bba
// Size: 0x27f
function private function_5bb38d64c886e080(params) {
    self endon("death");
    level endon("game_ended");
    var_76b37815fb03f916 = 0;
    while (1) {
        if (self.ob.instancedata.var_6c29f2fdb0054bbe.size > 0) {
            foreach (player in self.ob.instancedata.var_6c29f2fdb0054bbe) {
                if (isinlaststand(player) || istrue(player.notarget) || istrue(player.ignoreme)) {
                    continue;
                }
                if (distance2d(player.origin, self.origin) < getdvarint(@"hash_b7d76b505ece49e4", 4500) && abs(player.origin[2] - self.origin[2]) < getdvarint(@"hash_21f5a00d1f82e4cc", 1000)) {
                    if (!istrue(var_76b37815fb03f916)) {
                        foreach (var_53a758d6af3aa4af in params.trackers.var_d5dc746b4c149b00) {
                            foreach (drone in var_53a758d6af3aa4af) {
                                if (!istrue(drone.var_d13606ca2e7d4328)) {
                                    drone function_7e776322ab6a3ed0(1, drone.var_1a00611a25c12747);
                                }
                            }
                        }
                        self notify("end_patrolling_drones");
                        var_76b37815fb03f916 = 1;
                    }
                    if (isent(player) && isalive(player) && !isinlaststand(player)) {
                        player namespace_d1df78f2235ca173::function_6109bfd0330e0b8f("warlord_maestro", 1);
                    }
                } else if (isent(player) && isalive(player) && !isinlaststand(player)) {
                    player namespace_d1df78f2235ca173::function_6109bfd0330e0b8f("warlord_maestro", 0);
                }
            }
        }
        wait(1);
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1e40
// Size: 0x84
function private function_289bc4e107d9c7e1(params) {
    self endon("death");
    childthread function_fd5be33a0fc04ec4();
    setdvarifuninitialized(@"hash_584aaa9da0bcc0d", 0);
    setdvarifuninitialized(@"hash_8da2e3f75d2bf514", 0);
    setdvarifuninitialized(@"hash_dc1dd1f827d551d3", 0);
    setdvarifuninitialized(@"hash_663fcb5399f02f8b", 0);
    setdvarifuninitialized(@"hash_1a7bfc56667f5bae", 0);
    childthread function_404b2f21d0e54fb1();
    childthread function_76b01f56cccfc5ec(params);
    childthread function_da32a56c837da15a();
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ecb
// Size: 0x3e9
function private function_fd5be33a0fc04ec4() {
    /#
        params = level.ob.var_bfc5850d296d2ebe["warlordIsDisabled"];
        var_272a4532c1306b5b = [0:"reinforcement_trigger", 1:"team_hundred_ninety_five", 2:"damage"];
        while (1) {
            x = 320;
            y = 80;
            if (isdefined(params.trackers.var_647a70845738f8bc) && function_99fedeb298e8b70(params, self.var_8f9e0bd9f1142b53) > 0) {
                printtoscreen2d(x, y, "neutral" + string(params.trackers.var_647a70845738f8bc.size) + "Maestro Drone Behavior: Repopulation Path could not find target " + string(function_99fedeb298e8b70(params, self.var_8f9e0bd9f1142b53)));
                y = y + 18;
            }
            if (isdefined(params.trackers.var_dffa579e39f9bdd5)) {
                curtime = gettime();
                var_3b4b4b21b465271c = clamp(params.trackers.var_dffa579e39f9bdd5 - curtime, 0, (params.var_db9991611a26b0c1 - params.var_cfc9c46afa203cf6 * self.var_8f9e0bd9f1142b53) * 1000);
                printtoscreen2d(x, y, "veh_pac_sentry_amphibious_mp_biolab" + string(var_3b4b4b21b465271c));
                y = y + 18;
            }
            if (isdefined(params.trackers.var_dd72808b849e4d52)) {
                printtoscreen2d(x, y, "<unknown string>" + string(params.trackers.var_dd72808b849e4d52.size));
                y = y + 18;
            }
            if (isdefined(params.trackers.var_f6b4651f19aa358)) {
                printtoscreen2d(x, y, "<unknown string>" + string(params.trackers.var_f6b4651f19aa358));
                y = y + 18;
            }
            if (isdefined(params.trackers.var_dffa579e39f9bdd5)) {
                var_f52279cebc2d0ac = max(params.trackers.var_47ed3bc2d55c6fce - gettime(), 0);
                printtoscreen2d(x, y, "<unknown string>" + string(var_f52279cebc2d0ac));
                y = y + 18;
            }
            if (isdefined(params.trackers.var_d220d4746b1774d5)) {
                var_c311379b07d1700a = max(params.trackers.var_d220d4746b1774d5 - gettime(), 0);
                printtoscreen2d(x, y, "<unknown string>" + string(var_c311379b07d1700a));
                y = y + 18;
            }
            if (isdefined(self.scriptgoalpos)) {
                printtoscreen2d(x, y, "<unknown string>" + string(self.scriptgoalpos));
                y = y + 18;
            }
            if (isdefined(self.var_fbaf86a86d9b2dfa)) {
                printtoscreen2d(x, y, "<unknown string>" + string(self.var_fbaf86a86d9b2dfa));
                y = y + 18;
            }
            if (isdefined(self.var_8f9e0bd9f1142b53)) {
                printtoscreen2d(x, y, "<unknown string>" + string(self.var_8f9e0bd9f1142b53));
                y = y + 18;
            }
            if (isdefined(self.escaping)) {
                printtoscreen2d(x, y, "<unknown string>" + string(self.escaping));
                y = y + 18;
            }
            if (isdefined(self.var_e6d6e2128152581a) && isdefined(self.var_1144fa51d2a07ee4)) {
                printtoscreen2d(x, y, "<unknown string>" + string(self.var_e6d6e2128152581a) + "<unknown string>" + string(self.var_1144fa51d2a07ee4));
                y = y + 18;
            }
            waitframe();
        }
    #/
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22bb
// Size: 0x104
function function_da32a56c837da15a() {
    volumes = level.ob.var_bfc5850d296d2ebe["Maestro"].var_da47572a9821e77d;
    while (1) {
        if (getdvarint(@"hash_dc1dd1f827d551d3", 0)) {
            foreach (volume in volumes) {
                /#
                    sphere(volume.origin, 128, (160, 25, 120));
                    if (isdefined(volume.script_index)) {
                        print3d(volume.origin + (0, 0, 90), string(volume.script_index), (160, 25, 120), 1, 3);
                    }
                #/
            }
        }
        waitframe();
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x23c6
// Size: 0x43
function private function_45294eab84bd3fc4(data) {
    if (!isdefined(self)) {
        return;
    }
    params = namespace_ad1f398af6f48cb1::function_9acf953fd6bf2e46("Maestro");
    params.trackers.var_d6f06f378d054276 = gettime();
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2410
// Size: 0x41e
function function_ecc8e68beaa407af(params) {
    self endon("death");
    while (1) {
        if (self.var_5e9eeedc4f37723b == -1) {
            wait(1.5);
            contents = namespace_2a184fc4902783dc::create_contents(0, 1, 0, 1, 0, 0, 0, 1);
            ignore = [0:self];
            for (i = 0; i < params.trackers.var_647a70845738f8bc.size; i++) {
                ignore[ignore.size] = params.trackers.var_647a70845738f8bc[i];
                ignore[ignore.size] = params.trackers.var_647a70845738f8bc[i].clip;
            }
            for (i = 0; i < params.trackers.var_dd72808b849e4d52.size; i++) {
                ignore[ignore.size] = params.trackers.var_dd72808b849e4d52[i];
            }
            tracepoints = [0:(-70, 0, 0), 1:(70, 0, 0), 2:(0, -70, 0), 3:(0, 70, 0), 4:(50, 50, 0), 5:(50, -50, 0), 6:(-50, -50, 0), 7:(-50, 50, 0)];
            var_2f9e9febf2f3ad33 = [0:(-33, 0, 0), 1:(33, 0, 0), 2:(0, -33, 0), 3:(0, 33, 0), 4:(33, 33, 0), 5:(33, -33, 0), 6:(-33, -33, 0), 7:(-33, 33, 0)];
            var_64c95698ed1716f5 = [0:(0, 10, 10), 1:(0, -10, 10), 2:(-10, 0, 10), 3:(10, 0, 10), 4:(7, -7, 10), 5:(-7, -7, 10), 6:(-7, 7, 10), 7:(7, 7, 0)];
            var_5b36d1353e9a2b32 = [0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0];
            var_6a9c098959579f9 = 0;
            for (i = 0; i < tracepoints.size; i++) {
                var_65a2111dc1e5790c = namespace_2a184fc4902783dc::ray_trace_passed(self.origin + (0, 0, 35), self.origin + (0, 0, 35) + tracepoints[i], ignore, contents);
                if (var_65a2111dc1e5790c) {
                    var_5b36d1353e9a2b32[i] = var_65a2111dc1e5790c;
                    var_6a9c098959579f9++;
                }
            }
            if (var_6a9c098959579f9 == 0 || var_6a9c098959579f9 == 8) {
                self.var_5e9eeedc4f37723b = 0;
                self.var_d5d75e1d5341e872 = (0, 0, 0);
            } else {
                self.var_5e9eeedc4f37723b = var_6a9c098959579f9;
                self.var_8a8bfb7e19f13a33 = [];
                self.var_b8914dd33e1c911d = [];
                for (i = 0; i < tracepoints.size; i++) {
                    if (var_5b36d1353e9a2b32[i]) {
                        self.var_8a8bfb7e19f13a33[self.var_8a8bfb7e19f13a33.size] = var_2f9e9febf2f3ad33[i] + (0, 0, 45);
                        self.var_b8914dd33e1c911d[self.var_b8914dd33e1c911d.size] = var_64c95698ed1716f5[i];
                    }
                }
            }
        }
        waitframe();
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2835
// Size: 0x9f
function function_53c7f9e18848bc61(targetpos, priority) {
    self endon("death");
    self endon("cancel_reposition");
    if (priority > self.var_d935d530a63e48ba) {
        self.var_5e9eeedc4f37723b = 0;
        self.var_d935d530a63e48ba = priority;
        self setgoalpos(self getclosestreachablepointonnavmesh(targetpos), 32);
        self waittill("goal");
        if (isdefined(self) && priority == self.var_d935d530a63e48ba) {
            if (priority >= 2) {
                self.var_e2fcb999009f71bd = 1;
                self notify("reposition_complete");
            }
            self.var_d935d530a63e48ba = 0;
            self.var_5e9eeedc4f37723b = -1;
        }
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28db
// Size: 0x20e
function function_b74a844cdfa3d876(var_54bbcf1fd84a9304, ignorelist) {
    contents = namespace_2a184fc4902783dc::create_contents(0, 1, 0, 1, 0, 0, 0, 1);
    if (0) {
        var_6c28ac76727d0025 = 12;
        tracestart = self.origin + (0, 0, 12);
        /#
            if (getdvarint(@"hash_1a7bfc56667f5bae", 0)) {
                sphere(tracestart, var_6c28ac76727d0025, game["<unknown string>"]["<unknown string>"], 0, 240);
                sphere(var_54bbcf1fd84a9304, var_6c28ac76727d0025, game["<unknown string>"]["<unknown string>"], 0, 240);
                line(tracestart, var_54bbcf1fd84a9304, game["<unknown string>"]["<unknown string>"], 1, 0, 240);
            }
        #/
        return sphere_trace_passed(tracestart, var_54bbcf1fd84a9304, var_6c28ac76727d0025, ignorelist, contents);
    }
    var_fa92b761401c0d98 = [];
    var_5419ef18efa37743 = anglestoforward(self.angles);
    var_5419ef18efa37743 = vectornormalize(var_5419ef18efa37743);
    numtraces = 1;
    var_88b83b0d7a43ea72 = 360 / numtraces;
    for (i = 0; i < numtraces; i++) {
        var_fa92b761401c0d98[i] = self.origin + var_5419ef18efa37743 * 6;
        var_5419ef18efa37743 = rotatevector(var_5419ef18efa37743, (0, var_88b83b0d7a43ea72, 0));
    }
    foreach (var_ed34842d3050147b in var_fa92b761401c0d98) {
        /#
            if (getdvarint(@"hash_1a7bfc56667f5bae", 0)) {
                sphere(var_ed34842d3050147b, 2, game["<unknown string>"]["<unknown string>"], 0, 240);
                line(var_ed34842d3050147b, var_54bbcf1fd84a9304, game["<unknown string>"]["<unknown string>"], 1, 0, 240);
            }
        #/
        if (!namespace_2a184fc4902783dc::ray_trace_passed(var_ed34842d3050147b, var_54bbcf1fd84a9304, ignorelist, contents)) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2af1
// Size: 0x842
function function_2869b451ab993c40(index, params) {
    self endon("death");
    self endon("maestro_escape_forced_end");
    if (istrue(self.var_eebd9b8e103e5d3e)) {
        return;
    }
    if (!istrue(self.escaping)) {
        if (!isdefined(self.var_f6016f5ad62e2993)) {
            self.var_f6016f5ad62e2993 = 1;
        } else {
            self.var_f6016f5ad62e2993 = self.var_f6016f5ad62e2993 + 1;
        }
        var_a39bfa08ac024eb5 = level.ob.var_bfc5850d296d2ebe["Maestro"].var_52d12ef9ecc1c146[self.var_f6016f5ad62e2993 - 1];
        var_15ee5913a59b8dcf = level.ob.var_bfc5850d296d2ebe["Maestro"].var_15ee5913a59b8dcf;
        var_ced0426e7e729ed5 = level.ob.var_bfc5850d296d2ebe["Maestro"].var_7a60a759219496c8[index];
        targetpos = var_ced0426e7e729ed5.origin;
        self.escaping = 1;
        self.var_760f5d16839d683f = 0;
        self.var_c557ad4f44477f11 = 0;
        self.var_f89e16252aec0396 = 1;
        namespace_aebb27832287cd3a::cap_start("cap_maestro_drone_escape", "caps/maestro/cap_maestro_escape");
        while (self.asmname != "cap_maestro_drone_escape" && !self function_e3dadb2823f1da8a(self.asmname)) {
            waitframe();
        }
        var_6909908158d8f59c = spawn("script_model", self gettagorigin("TAG_ACCESSORY_LEFT"));
        var_6909908158d8f59c setmodel("misc_vm_pers_redeploy_drone_ob");
        var_6909908158d8f59c setscriptablepartstate("maestro_prd", "deploy_start", 0);
        var_6909908158d8f59c.angles = (0, self.angles[1], 0);
        var_6909908158d8f59c linkto(self, "TAG_ACCESSORY_LEFT");
        self.var_d1e81d5b45120e8d = var_6909908158d8f59c;
        while (!istrue(self asmeventfired(self.asmname, "linkdrone"))) {
            waitframe();
        }
        var_649dc5f097eb8fe3 = self gettagorigin("j_head");
        drone = namespace_f64231d5b7a2c3c4::_spawnhelicopter(undefined, var_649dc5f097eb8fe3, self.angles, "veh_maestro_bomb_drone_ob", "veh8_mil_air_tuniform_c4_ob");
        drone.owner = self;
        drone.team = "team_hundred_ninety_five";
        drone.health = 999999;
        drone vehicle_setspeedimmediate(20, 200, 200);
        drone vehicleshowonminimap(0);
        drone hide();
        self.var_2cc3a24d5bdf4a35 = drone;
        headoffset = self.origin - var_649dc5f097eb8fe3;
        var_8d7024ab6fd44f2a = drone.origin - drone gettagorigin("j_body");
        self linktomoveoffset(drone, "j_body", headoffset + var_8d7024ab6fd44f2a, (0, 0, 0));
        self playerlinkedoffsetenable();
        self fixlinktointerpolationbug(1);
        while (!istrue(self asmeventfired(self.asmname, "mount_finished"))) {
            waitframe();
        }
        self.var_38e2a82236a1bb9a = 1;
        thread namespace_dc53a27a8db8e6bf::function_29b3cd72300804be();
        var_6909908158d8f59c setscriptablepartstate("maestro_prd", "move_loop", 0);
        forward = anglestoforward(self.angles);
        var_9e9d8f097b724a11 = function_767cea82b001f645(forward);
        ignore = [0:self, 1:var_6909908158d8f59c, 2:drone];
        for (i = 0; i < params.trackers.var_647a70845738f8bc.size; i++) {
            ignore[ignore.size] = params.trackers.var_647a70845738f8bc[i];
            ignore[ignore.size] = params.trackers.var_647a70845738f8bc[i].clip;
        }
        for (i = 0; i < params.trackers.var_dd72808b849e4d52.size; i++) {
            ignore[ignore.size] = params.trackers.var_dd72808b849e4d52[i];
        }
        tracestart = self.origin;
        traceend = self.origin + (0, 0, 200);
        contents = namespace_2a184fc4902783dc::create_contents(0, 1, 0, 1, 0, 0, 0, 1);
        var_5bf0eee5dbbc9e96 = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignore, contents)["position"];
        var_5bf0eee5dbbc9e96 = var_5bf0eee5dbbc9e96 + (0, 0, -12);
        /#
            if (getdvarint(@"hash_1a7bfc56667f5bae", 0)) {
                sphere(tracestart, 2, game["<unknown string>"]["<unknown string>"], 0, 240);
                sphere(traceend, 2, game["<unknown string>"]["<unknown string>"], 0, 240);
                line(tracestart, traceend, game["<unknown string>"]["<unknown string>"], 1, 0, 240);
                sphere(var_5bf0eee5dbbc9e96, 2, game["<unknown string>"]["<unknown string>"], 0, 240);
            }
        #/
        drone setvehgoalpos(var_5bf0eee5dbbc9e96, 1);
        while (distancesquared(drone.origin, var_5bf0eee5dbbc9e96) > 625) {
            waitframe();
        }
        var_9224baea88b1a44b = 0;
        foreach (point in var_a39bfa08ac024eb5) {
            if (point.targetname == "start") {
                startpoint = point;
                break;
            }
        }
        if (isdefined(startpoint) && function_b74a844cdfa3d876(startpoint.origin, ignore)) {
            var_9224baea88b1a44b = 1;
            drone function_6c6b4c655a108706(var_a39bfa08ac024eb5);
        } else {
            var_4f53baa7aedac49b = [];
            foreach (var_24bc53d8054bc186 in var_15ee5913a59b8dcf) {
                if (function_b74a844cdfa3d876(var_24bc53d8054bc186.origin, ignore)) {
                    var_4f53baa7aedac49b[var_4f53baa7aedac49b.size] = var_24bc53d8054bc186;
                }
            }
            if (var_4f53baa7aedac49b.size > 0) {
                mindist = 9999;
                var_71e5df71ee48dee8 = undefined;
                foreach (var_24bc53d8054bc186 in var_4f53baa7aedac49b) {
                    var_d496dbafba2be4fa = distance2d(var_24bc53d8054bc186.origin, self.origin);
                    if (var_d496dbafba2be4fa < mindist) {
                        mindist = var_d496dbafba2be4fa;
                        var_71e5df71ee48dee8 = var_24bc53d8054bc186;
                    }
                }
                if (isdefined(var_71e5df71ee48dee8)) {
                    var_9224baea88b1a44b = 1;
                    drone function_6c6b4c655a108706(var_a39bfa08ac024eb5, var_71e5df71ee48dee8);
                }
            }
        }
        if (!istrue(var_9224baea88b1a44b)) {
            self.var_f6016f5ad62e2993--;
        }
        self unlink();
        var_6909908158d8f59c unlink();
        var_6909908158d8f59c childthread function_df749830a4e50701();
        self.var_760f5d16839d683f = 1;
        self.var_c557ad4f44477f11 = 1;
        self.var_f89e16252aec0396 = 0;
        self.var_38e2a82236a1bb9a = 0;
        self.var_d1e81d5b45120e8d = undefined;
        self.var_2cc3a24d5bdf4a35 = undefined;
        if (index == 0) {
            volume = level.ob.var_bfc5850d296d2ebe["Maestro"].var_da47572a9821e77d[2];
            self setgoalvolumeauto(volume);
        } else if (index == 1) {
            volume = level.ob.var_bfc5850d296d2ebe["Maestro"].var_da47572a9821e77d[0];
            self setgoalvolumeauto(volume);
        }
        drone thread function_a4c9f0c88ae3d01e();
        self.var_d935d530a63e48ba = 0;
        self.escaping = 0;
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x333a
// Size: 0x99
function function_c804500b8ed30f0b() {
    self.var_eebd9b8e103e5d3e = 1;
    self notify("maestro_escape_forced_end");
    self unlink();
    self.var_d935d530a63e48ba = 0;
    self.escaping = 0;
    if (isdefined(self.var_d1e81d5b45120e8d)) {
        self.var_d1e81d5b45120e8d unlink();
        self.var_d1e81d5b45120e8d function_df749830a4e50701();
        self.var_760f5d16839d683f = 1;
        self.var_38e2a82236a1bb9a = 0;
        self.var_d1e81d5b45120e8d = undefined;
    }
    if (isdefined(self.var_2cc3a24d5bdf4a35)) {
        self.var_2cc3a24d5bdf4a35 function_a4c9f0c88ae3d01e();
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33da
// Size: 0x1bf
function function_6c6b4c655a108706(path, var_24bc53d8054bc186) {
    if (isdefined(var_24bc53d8054bc186)) {
        self setvehgoalpos(var_24bc53d8054bc186.origin, 0);
        var_2ff28da0a9ff8959 = vectortoangles(var_24bc53d8054bc186.origin - self.origin);
        self settargetyaw(var_2ff28da0a9ff8959[1]);
        self setyawspeed(400, 300, 270, 0.3);
        while (distancesquared(self.origin, var_24bc53d8054bc186.origin) > 625) {
            waitframe();
        }
    }
    var_2ff28da0a9ff8959 = vectortoangles(path[0].origin - self.origin);
    self settargetyaw(var_2ff28da0a9ff8959[1]);
    self setyawspeed(150, 150, 130, 0.3);
    for (pointindex = 0; pointindex < path.size; pointindex++) {
        point = path[pointindex];
        if (pointindex == path.size - 1) {
            self setvehgoalpos(point.origin, 1);
        } else {
            self setvehgoalpos(point.origin, 0);
        }
        var_3fa1b117f5f4e65e = 0;
        while (distancesquared(self.origin, point.origin) > 625) {
            if (pointindex < path.size - 1 && distancesquared(self.origin, point.origin) <= 40000 && !var_3fa1b117f5f4e65e) {
                var_3fa1b117f5f4e65e = 1;
                var_2ff28da0a9ff8959 = vectortoangles(path[pointindex + 1].origin - path[pointindex].origin);
                self settargetyaw(var_2ff28da0a9ff8959[1]);
            }
            waitframe();
        }
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35a0
// Size: 0x2c
function function_df749830a4e50701() {
    self setscriptablepartstate("maestro_prd", "deploy_end", 0);
    wait(1);
    self notify("death");
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35d3
// Size: 0x1f
function function_a4c9f0c88ae3d01e() {
    self setscriptablepartstate("Spawn_Reveal", "Reveal_Off", 0);
    wait(6);
    self delete();
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 13, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35f9
// Size: 0x3ec
function function_fea10e99d08599d7(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon) {
    params = level.ob.var_bfc5850d296d2ebe["Maestro"];
    if (self.var_8f9e0bd9f1142b53 == 0 && self.armorhealth <= self.var_8790c077c95db752 * 0.9 && self.ob.var_e6d6e2128152581a < 2) {
        self.ob.var_1144fa51d2a07ee4 = 1;
        self.ob.var_e6d6e2128152581a = 2;
    }
    if (self.var_8f9e0bd9f1142b53 == 0 && (self.armorhealth <= self.var_8790c077c95db752 * 0.5 || self.helmethealth <= self.var_cfc69e5588a5bed6 * 0.75 || self.health < self.maxhealth)) {
        self.var_5a856697dd2dab5c = gettime() + self.var_b8a5d15fbaa9387d;
        thread function_2869b451ab993c40(self.var_8f9e0bd9f1142b53, params);
        self.var_8f9e0bd9f1142b53 = 1;
    }
    if (self.var_8f9e0bd9f1142b53 == 1 && self.armorhealth <= self.var_8790c077c95db752 * 0.4 && !self.ob.var_1144fa51d2a07ee4 && self.ob.var_e6d6e2128152581a < 3) {
        self.ob.var_1144fa51d2a07ee4 = 1;
        self.ob.var_e6d6e2128152581a = 3;
    }
    if (self.var_8f9e0bd9f1142b53 == 1 && (self.armorhealth <= 0 || self.helmethealth <= self.var_cfc69e5588a5bed6 * 0.45 || self.health < self.maxhealth * 0.7 && self.health > self.maxhealth * 0.2)) {
        self.var_5a856697dd2dab5c = gettime() + self.var_b8a5d15fbaa9387d;
        thread function_2869b451ab993c40(self.var_8f9e0bd9f1142b53, params);
        self.var_8f9e0bd9f1142b53 = 2;
    }
    params.trackers.var_dffa579e39f9bdd5 = gettime() + (params.var_db9991611a26b0c1 - params.var_cfc9c46afa203cf6 * self.var_8f9e0bd9f1142b53) * 1000;
    if (!istrue(self.var_f89e16252aec0396)) {
        params.trackers.var_8c0638b444bc5206 = 0;
    }
    idamage = namespace_ad1f398af6f48cb1::function_395c3a00db83ba6(idamage, smeansofdeath, objweapon);
    headshot = namespace_169cd7a8fbc76ee5::isheadshot(shitloc, smeansofdeath, eattacker);
    var_aa2437e33b3213db = self.health;
    if (istrue(headshot)) {
        if (self.helmethealth <= 0) {
            var_aa2437e33b3213db = self.health - idamage;
        }
    } else if (self.armorhealth <= 0) {
        var_aa2437e33b3213db = self.health - idamage;
    }
    if (var_aa2437e33b3213db < self.maxhealth * 0.05 && istrue(self.escaping)) {
        function_c804500b8ed30f0b();
    }
    namespace_daa149ca485fd50a::function_dffac413ed66bcd0(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon);
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39ec
// Size: 0x4e0
function function_35a2d548eaf273dd(point, params, var_a4ca108d5180304, var_4c12c9b285fba0f5) {
    startpos = point;
    startang = (0, 0, 0);
    vehicleinfo = "veh_maestro_bomb_drone_ob";
    if (var_a4ca108d5180304) {
        drone = spawnvehicle("veh8_mil_air_tuniform_c4_ob", "drone_turret", vehicleinfo, startpos, startang);
        drone setvehicleteam(self.team);
    } else {
        drone = spawn("script_model", startpos);
        drone setmodel("veh8_mil_air_tuniform_c4_ob");
    }
    var_c1e547baba2e6f87 = "team_hundred_ninety_five";
    if (isdefined(self)) {
        drone.owner = self;
        var_c1e547baba2e6f87 = self.team;
    }
    drone.var_52dcdba485e7ceeb = "j_body";
    drone.team = var_c1e547baba2e6f87;
    drone.var_463aecbced511653 = 0;
    drone.var_2a6024dda5bc8738 = 0;
    drone.maxspeed = float(params.var_79b43d1888144e20);
    drone.var_c1f849cc6244fa6b = params.var_a7cdb2a8ec572747;
    drone.sightdistance = params.var_353ddc1540d767c5;
    drone.exploding = 0;
    drone.var_176f2563dbfd1669 = params.var_176f2563dbfd1669;
    drone.forcestop = 0;
    drone.health = 999999;
    drone.var_9d26ac1e325367ce = function_2336488258354fbc(#"aitype", %"hash_fb34274fe0861d2");
    drone.var_534e788bc498be9f = getscriptbundle(%"hash_781de85130f2625a");
    drone.subclass = drone.var_534e788bc498be9f.name;
    drone.var_1e0eb63ecb3f1e2 = 1;
    drone.var_4919d15787f01154 = 1;
    drone.max_fake_health = params.var_53385b6be5f6c52f;
    drone.fake_health = params.var_53385b6be5f6c52f;
    drone.var_db8581b0d3afd64c = 1;
    drone.var_4d0b3556ea76e2bc = params.var_4d0b3556ea76e2bc;
    drone thread function_301048eaf1a616d(params);
    drone setcandamage(1);
    drone enableaimassist();
    drone.var_aa6fe6af4cbbdd47 = &function_aeaae75fa8cfd4cb;
    drone setscriptabledamageowner(drone.owner);
    drone utility::function_3ab9164ef76940fd("Spawn_Reveal", "Spawn_Reveal");
    if (var_a4ca108d5180304) {
        level.var_86b4835c1806d690[level.var_86b4835c1806d690.size] = drone;
        drone.var_39b4dfdad5a00c8c = 0;
        drone.var_f781079e220f1cde = 1;
        drone thread function_19477228c9b4907b();
        drone thread function_2395aa8d473eb61f();
        if (var_4c12c9b285fba0f5) {
            drone.behavior = "idle";
            drone setscriptablepartstate("lights", "chase", 0);
        } else {
            drone.behavior = "protect";
            for (var_578509d14431fd20 = 0; var_578509d14431fd20 < function_99fedeb298e8b70(params, 0); var_578509d14431fd20++) {
                var_cffb6eae3fe146bb = 1;
                foreach (var_fe1b867fa7691d5f in params.trackers.var_647a70845738f8bc) {
                    if (isdefined(var_fe1b867fa7691d5f.var_1a6a2f69c980829c) && var_fe1b867fa7691d5f.var_1a6a2f69c980829c == var_578509d14431fd20) {
                        var_cffb6eae3fe146bb = 0;
                        break;
                    }
                }
                if (var_cffb6eae3fe146bb == 1) {
                    drone.var_1a6a2f69c980829c = var_578509d14431fd20;
                    break;
                }
            }
            params.trackers.var_647a70845738f8bc[params.trackers.var_647a70845738f8bc.size] = drone;
        }
        drone thread function_dfda2e2f7083463b(params);
        drone vehicle_breakglass(1);
        drone thread function_9d8b7e5c2ee17132(params);
    } else {
        drone.var_f781079e220f1cde = 0;
        drone thread function_d2eaa684b4981192(params);
        drone setscriptablepartstate("lights", "chase", 0);
        drone setscriptablepartstate("engine_sound", "low", 0);
    }
    drone thread function_31bd1c2dc85b7b5c();
    drone thread function_4c99c360d70d867a();
    drone thread function_3e42dda71c258e8a();
    drone function_f3bb4f4911a1beb2(#"emp", #"hash_a865e3770eb96298", drone, &function_7c3b5beb399db271);
    return drone;
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ed4
// Size: 0x13e
function function_aeaae75fa8cfd4cb(var_91beb5c3a5ab6910) {
    level endon("game_ended");
    self endon("death");
    victim = var_91beb5c3a5ab6910.victim;
    attacker = var_91beb5c3a5ab6910.attacker;
    objweapon = var_91beb5c3a5ab6910.objweapon;
    inflictor = var_91beb5c3a5ab6910.inflictor;
    if (isstruct(inflictor)) {
        inflictor = attacker;
    }
    if (self.fake_health > 0) {
        if (!isdefined(level.var_7402bdfcb0d55974)) {
            level.var_7402bdfcb0d55974 = function_e4c99b0f178ffb98("shockStick_haywireDrone", 1, level.framedurationseconds);
        }
        self.var_12bfb031c0a0efd8 = 1;
        function_f632348cbb773537(level.var_7402bdfcb0d55974, self);
        self dodamage(getdvarint(@"hash_ab6ef41d9efbecdf", 15), self.origin, attacker, inflictor, "MOD_ELEMENTAL_ELEC", objweapon, self.var_52dcdba485e7ceeb);
        self notify("drop_shield");
        if (self.fake_health <= getdvarint(@"hash_b70124ef26c0ca73", 0.25) * self.max_fake_health) {
            function_e681027fc9108d7();
        }
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4019
// Size: 0xdf
function function_2395aa8d473eb61f() {
    self endon("death");
    while (1) {
        foreach (player in level.players) {
            showonminimap = 0;
            var_e05a663652679c56 = distancesquared(self.origin, player.origin);
            if (var_e05a663652679c56 <= squared(10000)) {
                var_14d7eaca7130dbe5 = abs(self.origin[2] - player.origin[2]);
                if (var_14d7eaca7130dbe5 <= 500) {
                    showonminimap = 1;
                }
            }
            self vehicleshowonminimapforclient(player, showonminimap);
        }
        wait(2);
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40ff
// Size: 0x2a1
function function_19d48dfe8f3cbc84(var_caafa374b14d72c, drone, params) {
    drone notify("brush_swap");
    if (var_caafa374b14d72c) {
        drone.var_2a6024dda5bc8738 = 1;
        if (isdefined(drone.clip)) {
            drone.clip notify("death");
            drone.clip delete();
        }
        brushmodel = getent("shield_drone_clip", "targetname");
        drone.clip = spawn("script_model", brushmodel.origin);
        drone.clip.angles = brushmodel.angles;
        drone.clip clonebrushmodeltoscriptmodel(brushmodel);
        drone.clip.origin = drone.origin;
        drone.clip.angles = drone.angles;
        drone.clip.parent = drone;
        drone.clip linkto(drone, "j_body");
        drone.clip enableaimassist();
        drone.var_9d26ac1e325367ce = function_2336488258354fbc(#"aitype", %"hash_fb34274fe0861d2");
        drone.var_534e788bc498be9f = getscriptbundle(%"hash_781de85130f2625a");
        drone.subclass = drone.var_534e788bc498be9f.name;
        drone.clip.health = 999999;
        drone.clip.var_1e0eb63ecb3f1e2 = 1;
        drone.clip.var_4919d15787f01154 = 1;
        drone.clip.max_fake_health = drone.max_fake_health;
        drone.clip.fake_health = drone.fake_health;
        drone.clip setcandamage(1);
        drone thread function_bd97b7f184ae69b2(params);
    } else {
        if (isdefined(drone.clip)) {
            drone.clip notify("death");
            drone.clip delete();
        }
        drone.var_2a6024dda5bc8738 = 0;
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43a7
// Size: 0x78
function function_e49c2a4a3183522a() {
    level.var_86b4835c1806d690 = array_remove(level.var_86b4835c1806d690, self);
    self notify("death");
    if (isdefined(self.dangericonent)) {
        self.dangericonent delete();
    }
    if (isdefined(self.clip)) {
        self.clip notify("death");
        self.clip delete();
    }
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4426
// Size: 0xd9
function function_7e776322ab6a3ed0(exploded, var_1a00611a25c12747) {
    if (isdefined(self) && !istrue(self.var_463aecbced511653)) {
        self.var_463aecbced511653 = 1;
        if (exploded == 0) {
            playfx(getfx("drone_turret_explode"), self.origin);
            self playsound("jup_maestro_drone_destroyed");
        }
        if (!istrue(var_1a00611a25c12747)) {
            level.var_86b4835c1806d690 = array_remove(level.var_86b4835c1806d690, self);
        }
        if (isdefined(self.dangericonent)) {
            self.dangericonent delete();
        }
        waitframe();
        self notify("death");
        if (isdefined(self.clip)) {
            self.clip notify("death");
            self.clip delete();
        }
        if (isdefined(self)) {
            self delete();
        }
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4506
// Size: 0xf0
function function_e681027fc9108d7() {
    self.exploding = 1;
    if (self.var_f781079e220f1cde == 1) {
        self.forcestop = 1;
        self.var_39b4dfdad5a00c8c = 1;
        self setscriptablepartstate("lights", "chase", 0);
        self vehicle_setspeedimmediate(0, 15, 15);
    } else {
        self moveto(self.origin, 0.1);
    }
    wait(self.var_176f2563dbfd1669);
    /#
        if (getdvarint(@"hash_663fcb5399f02f8b", 0)) {
            sphere(self.origin, 50, (1, 0, 1), 0, 120);
        }
    #/
    if (isdefined(self)) {
        self setscriptablepartstate("explode", "on", 0);
        if (isdefined(self.dangericonent)) {
            self.dangericonent delete();
        }
        thread function_7e776322ab6a3ed0(1, istrue(self.var_1a00611a25c12747));
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45fd
// Size: 0x24
function function_7c3b5beb399db271(data) {
    if (isdefined(self)) {
        thread function_7e776322ab6a3ed0(0, istrue(self.var_1a00611a25c12747));
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4628
// Size: 0x1f
function function_3e42dda71c258e8a() {
    self endon("death");
    self waittill("shockStick_haywireApplied");
    if (isdefined(self)) {
        self notify("drop_shield");
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x464e
// Size: 0x45
function function_31bd1c2dc85b7b5c() {
    self endon("death");
    while (1) {
        self waittill("pause_move");
        self vehicle_setspeedimmediate(0, 15, 15);
        wait(0.5);
        self vehicle_setspeed(self.maxspeed, self.maxspeed);
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x469a
// Size: 0x11f
function function_abd3fe39b9962cf2(target, offset) {
    var_27b697504d9397d = 0;
    contents = namespace_2a184fc4902783dc::create_contents(0, 1, 0, 1, 1, 1, 0, 1);
    ignore = [];
    if (isent(self)) {
        ignore[ignore.size] = self;
    }
    tracepoints = [];
    if (isplayer(target)) {
        tracepoints = [0:target gettagorigin("j_head"), 1:target gettagorigin("j_mainroot"), 2:target gettagorigin("tag_origin")];
        var_a5d118f040f60db0 = target namespace_f8065cafc523dba5::getvehicle();
        if (isdefined(var_a5d118f040f60db0)) {
            ignore[ignore.size] = var_a5d118f040f60db0;
        }
    } else {
        tracepoints[tracepoints.size] = target.origin + (0, 0, 35);
    }
    for (i = 0; i < tracepoints.size; i++) {
        if (!namespace_2a184fc4902783dc::ray_trace_passed(self.origin + offset, tracepoints[i], ignore, contents)) {
            continue;
        }
        var_27b697504d9397d = 1;
        break;
    }
    return var_27b697504d9397d;
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47c1
// Size: 0x2b4
function function_7dbd5a71beaa0999(maestro, trackers) {
    maestro waittill("death");
    if (isdefined(trackers.var_647a70845738f8bc)) {
        foreach (drone in trackers.var_647a70845738f8bc) {
            drone thread function_7e776322ab6a3ed0(0);
        }
        trackers.var_647a70845738f8bc = [];
    }
    if (isdefined(trackers.var_dd72808b849e4d52)) {
        foreach (drone in trackers.var_dd72808b849e4d52) {
            drone thread function_7e776322ab6a3ed0(0);
        }
        trackers.var_dd72808b849e4d52 = [];
    }
    if (isdefined(trackers.var_d5dc746b4c149b00)) {
        foreach (var_d96e5c15d869ca53 in trackers.var_d5dc746b4c149b00) {
            foreach (drone in var_d96e5c15d869ca53) {
                if (isdefined(drone)) {
                    drone thread function_7e776322ab6a3ed0(0);
                }
            }
            var_d96e5c15d869ca53 = [];
        }
    }
    if (isdefined(trackers.var_3aef66aa7812fab4)) {
        foreach (drone in trackers.var_3aef66aa7812fab4) {
            drone thread function_7e776322ab6a3ed0(0);
        }
        trackers.var_3aef66aa7812fab4 = [];
    }
    if (isdefined(trackers.var_c85cd95d46492795)) {
        foreach (var_8a28fd9df2f03764 in trackers.var_c85cd95d46492795) {
            if (isdefined(var_8a28fd9df2f03764) && isdefined(var_8a28fd9df2f03764.owner) && var_8a28fd9df2f03764.owner == maestro) {
                var_8a28fd9df2f03764.owner = undefined;
                var_8a28fd9df2f03764 setentityowner(undefined);
            }
        }
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4a7c
// Size: 0x141
function private function_404b2f21d0e54fb1() {
    while (1) {
        /#
            x = 800;
            y = 300;
            if (getdvarint(@"hash_584aaa9da0bcc0d")) {
                foreach (drone in level.var_86b4835c1806d690) {
                    print3d(drone.origin + (0, 0, 20), "<unknown string>" + string(drone.fake_health), (0, 1, 0));
                    if (isdefined(drone.next_node)) {
                        line(drone.origin, drone.next_node.origin, (0.5, 0, 1));
                        draw_circle(drone.next_node.origin, 5, (0, 1, 0.25), 1, 0, 1);
                    }
                }
            }
        #/
        waitframe();
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bc4
// Size: 0xfd
function function_4c99c360d70d867a() {
    self endon("death");
    var_ba8236926bd74c7f = 0;
    isdying = 0;
    while (1) {
        if (!istrue(isdying)) {
            if (isdefined(self.var_4d0b3556ea76e2bc)) {
                foreach (killzone in self.var_4d0b3556ea76e2bc) {
                    distsq = distancesquared(self.origin, killzone.origin);
                    if (distsq < killzone.radius * killzone.radius) {
                        var_ba8236926bd74c7f = 1;
                    }
                }
            }
            if (self.fake_health <= 0 || var_ba8236926bd74c7f) {
                isdying = 1;
                thread function_7e776322ab6a3ed0(0, istrue(self.var_1a00611a25c12747));
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cc8
// Size: 0x370
function function_301048eaf1a616d(params) {
    self endon("death");
    level endon("game_ended");
    while (1) {
        inflictor = normal = angles = origin = objweapon = idflags = partname = tagname = modelname = meansofdeath = point = direction_vec = attacker = damage = self waittill("damage");
        if (isdefined(self) && self.var_2a6024dda5bc8738 == 0 && isdefined(attacker) && (isplayer(attacker) || isdefined(attacker.owner) && isplayer(attacker.owner))) {
            player = attacker;
            if (isplayer(attacker.owner)) {
                player = attacker.owner;
            }
            if (isplayer(attacker) && damage > 0 && (!isdefined(partname) || partname != "shield")) {
                attacker namespace_e072c8407b2a861c::updatedamagefeedback("standard", damage >= self.health);
            }
            if (self.var_f781079e220f1cde == 0 && !isdefined(self.var_400c3f28e44db94e) && function_abd3fe39b9962cf2(player, (0, 0, 0))) {
                if (isinlaststand(player) || istrue(player.notarget) || istrue(player.ignoreme)) {
                    self playsound("jup_maestro_drone_damaged");
                    self.fake_health = int(max(0, self.fake_health - damage));
                    continue;
                }
                if (isdefined(self.var_d96e5c15d869ca53)) {
                    if (array_contains(self.var_d96e5c15d869ca53.var_ca1c748118b3de7f, player)) {
                        player.var_68cea97f9e78379d = gettime();
                        self playsound("jup_maestro_drone_damaged");
                        self.fake_health = int(max(0, self.fake_health - damage));
                        continue;
                    }
                    self.var_d96e5c15d869ca53 thread function_d66f206de2a2b7d1(player, self, self.owner, params);
                }
                self.var_400c3f28e44db94e = player;
                self notify("target_found");
            } else if (self.var_f781079e220f1cde == 0 && isdefined(self.var_400c3f28e44db94e) && function_abd3fe39b9962cf2(player, (0, 0, 0))) {
                if (isdefined(self.var_d96e5c15d869ca53) && array_contains(self.var_d96e5c15d869ca53.var_ca1c748118b3de7f, player)) {
                    player.var_68cea97f9e78379d = gettime();
                    self playsound("jup_maestro_drone_damaged");
                    self.fake_health = int(max(0, self.fake_health - damage));
                    continue;
                }
            }
            self playsound("jup_maestro_drone_damaged");
            self.fake_health = int(max(0, self.fake_health - damage));
        }
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x503f
// Size: 0x2cd
function function_bd97b7f184ae69b2(params) {
    self endon("death");
    self endon("brush_swap");
    level endon("game_ended");
    childthread function_e09cd5df1632b200();
    while (1) {
        inflictor = normal = angles = origin = objweapon = idflags = partname = tagname = modelname = meansofdeath = point = direction_vec = attacker = damage = self.clip waittill("damage");
        if (isdefined(self) && isdefined(attacker) && (isplayer(attacker) || isdefined(attacker.owner) && isplayer(attacker.owner))) {
            var_93b3fad2f7986694 = damage;
            if (self.var_2a6024dda5bc8738) {
                var_93b3fad2f7986694 = int(damage * params.var_92b6c09a361e59b6);
            }
            if (isdefined(objweapon) && is_equal(function_f581838ce4328f7a(objweapon), "blackhole_bomb") && meansofdeath == "MOD_EXPLOSIVE") {
                var_93b3fad2f7986694 = self.max_fake_health * 0.6;
            }
            player = attacker;
            if (isplayer(attacker.owner)) {
                player = attacker.owner;
            }
            if (isplayer(attacker) && var_93b3fad2f7986694 > 0 && (!isdefined(partname) || partname != "shield")) {
                attacker namespace_e072c8407b2a861c::updatedamagefeedback("standard", var_93b3fad2f7986694 >= self.health);
            }
            self playsound("jup_maestro_drone_damaged");
            if (isdefined(self.owner) && self.owner.isactive) {
                params.trackers.var_dffa579e39f9bdd5 = gettime() + (params.var_db9991611a26b0c1 - params.var_cfc9c46afa203cf6 * self.owner.var_8f9e0bd9f1142b53) * 1000;
                if (!istrue(self.owner.var_f89e16252aec0396)) {
                    params.trackers.var_8c0638b444bc5206 = 0;
                }
            }
            self.fake_health = int(max(0, self.fake_health - var_93b3fad2f7986694));
            self.clip.fake_health = self.fake_health;
        }
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5313
// Size: 0x6b
function function_e09cd5df1632b200() {
    self endon("attacking");
    while (1) {
        self waittill("drop_shield");
        self setscriptablepartstate("ddos", "disabled");
        wait(1);
        self.var_2a6024dda5bc8738 = 0;
        wait(3);
        self setscriptablepartstate("ddos", "neutral");
        self setscriptablepartstate("shield", "on");
        self.var_2a6024dda5bc8738 = 1;
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5385
// Size: 0x1de
function function_19477228c9b4907b() {
    self endon("death");
    var_65d5104e6f0ea258 = istrue(self.var_f781079e220f1cde) && isdefined(self.behavior) && self.behavior == "protect";
    params = level.ob.var_bfc5850d296d2ebe["Maestro"];
    var_66307b279305fb2 = params.var_4e0524c57d0a1e75;
    if (var_65d5104e6f0ea258) {
        var_477db86aaf01fdb7 = params.var_7ce9f91c0bd1c384;
    }
    while (1) {
        if (!isdefined(self)) {
            break;
        }
        nearby_players = namespace_7e17181d03156026::getplayersinradius(self.origin, var_66307b279305fb2);
        foreach (player in nearby_players) {
            if (function_ad443bbcdcf37b85(player) && player.origin[2] < self.origin[2] + 50) {
                if (isdefined(self.owner) && self.owner.isactive) {
                    params.trackers.var_dffa579e39f9bdd5 = gettime() + (params.var_db9991611a26b0c1 - params.var_cfc9c46afa203cf6 * self.owner.var_8f9e0bd9f1142b53) * 1000;
                    if (!istrue(self.owner.var_f89e16252aec0396)) {
                        params.trackers.var_8c0638b444bc5206 = 0;
                    }
                }
                function_e681027fc9108d7();
                wait(100);
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x556a
// Size: 0x1e5
function function_4f013c722a300e5b(params) {
    self endon("death");
    thread namespace_dc53a27a8db8e6bf::function_d01822693171d7c1();
    for (i = 0; i < params.var_3d00b877b2d0ecbb; i++) {
        var_3d00b877b2d0ecbb = function_99fedeb298e8b70(params, self.var_8f9e0bd9f1142b53);
        if (params.trackers.var_647a70845738f8bc.size >= var_3d00b877b2d0ecbb || params.trackers.var_d6f06f378d054276 + params.var_380bac03870b68ea * 1000 >= gettime() || !istrue(params.trackers.var_8c0638b444bc5206)) {
            break;
        }
        offsets = [0:(-60, -60, 100), 1:(-60, 0, 100), 2:(-60, 60, 100), 3:(0, -60, 100), 4:(0, 0, 100), 5:(0, 60, 100), 6:(60, -60, 100), 7:(60, 0, 100), 8:(60, 60, 100)];
        point = self.origin + random(offsets);
        if (istrue(self.var_f89e16252aec0396)) {
            waitframe();
        } else {
            var_8db63dbb992664de = randomfloatrange(0.5, 1);
            wait(var_8db63dbb992664de);
        }
        self playsound("jup_maestro_drone_activate_launch");
        drone = function_35a2d548eaf273dd(point, params, 1, 0);
    }
    params.trackers.var_8c0638b444bc5206 = 0;
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5756
// Size: 0x223
function function_2961b32bea91aa54(params, drones, var_c3de2c3b803cc3d, var_858b56231d6570cb) {
    var_2658c11fc0ea9a0c = var_c3de2c3b803cc3d namespace_86b52005c685dfb9::function_2e1b23386b967c10();
    curr_time = gettime();
    drones[0].var_e111e406f2e7a626 = var_858b56231d6570cb;
    drones[0].targeted_enemy = var_c3de2c3b803cc3d;
    drones[0].var_3aec9a4ec140655a = var_2658c11fc0ea9a0c;
    drones[0].var_87babc8a58bc3639 = curr_time;
    drones[0].behavior = "bomb_attack_leader";
    drones[0].var_39b4dfdad5a00c8c = 1;
    drones[0].var_788e2acc86a73834 = curr_time + params.var_21b55f9053ab09db * 1000;
    params.trackers.var_dd72808b849e4d52[params.trackers.var_dd72808b849e4d52.size] = drones[0];
    drones[0] setscriptablepartstate("warning_beep", "on", 0);
    drones[0] notify("attacking");
    var_a25b73faa68a51c2 = function_c4a3b2f8fe65e727(params, self.var_8f9e0bd9f1142b53);
    for (i = 1; i < var_a25b73faa68a51c2; i++) {
        if (isdefined(drones[i])) {
            drones[i].var_e111e406f2e7a626 = var_858b56231d6570cb;
            drones[i].targeted_enemy = var_c3de2c3b803cc3d;
            drones[i].behavior = "bomb_attack_follower";
            drones[i].bomb_attack_leader = drones[0];
            drones[i].var_39b4dfdad5a00c8c = 1;
            drones[i].var_788e2acc86a73834 = curr_time + params.var_21b55f9053ab09db * 1000;
            params.trackers.var_dd72808b849e4d52[params.trackers.var_dd72808b849e4d52.size] = drones[i];
            drones[i] setscriptablepartstate("warning_beep", "on", 0);
            drones[i] notify("attacking");
        }
    }
    params.trackers.var_f6b4651f19aa358++;
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5980
// Size: 0x125
function function_52131076d4d3fe44(params, maestro) {
    maestro endon("death");
    self endon("death");
    while (1) {
        player = self waittill("trigger");
        if (istrue(player.notarget) || istrue(player.ignoreme)) {
            continue;
        }
        if (isdefined(maestro) && getdvarint(@"hash_771e174bc8bdaeea", 0)) {
            if (isplayer(player) && function_ad443bbcdcf37b85(player) && params.var_d824ae1f19006400 > params.trackers.var_f6b4651f19aa358) {
                point = maestro.origin + (0, 0, 80);
                var_feefcb2762265368 = [];
                for (i = 0; i < function_c4a3b2f8fe65e727(params, 0); i++) {
                    var_feefcb2762265368[i] = maestro function_35a2d548eaf273dd(point, params, 1, 1);
                }
                function_2961b32bea91aa54(params, var_feefcb2762265368, player, 1);
                break;
            }
        } else {
            break;
        }
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5aac
// Size: 0x711
function function_4f3833106786643e(params) {
    self endon("death");
    thread function_ecc8e68beaa407af(params);
    previoustime = gettime();
    params.trackers.var_600e626bc6761fde = 0;
    params.trackers.var_67ecec14024015ca = 0;
    params.trackers.var_6b0bf75d6f4e6684 = 0;
    function_6385032960fc51b1(0);
    var_4e427fadfa92de91 = 0;
    var_9b67eaff05a41947 = 5000;
    var_c8efbcbae752bda0 = 800;
    while (1) {
        var_47085f3bf583f9f = gettime();
        var_39a3088671665a14 = params.var_d824ae1f19006400;
        if (self.var_8f9e0bd9f1142b53 > 1) {
            var_39a3088671665a14++;
        }
        if ((var_47085f3bf583f9f > params.trackers.var_47ed3bc2d55c6fce || var_47085f3bf583f9f > params.trackers.var_d220d4746b1774d5) && function_c4a3b2f8fe65e727(params, self.var_8f9e0bd9f1142b53) > 0 && var_39a3088671665a14 > params.trackers.var_f6b4651f19aa358) {
            var_d68140ac3f3b837b = [];
            var_858b56231d6570cb = 0;
            if (self.var_c557ad4f44477f11 == 1) {
                if (var_47085f3bf583f9f > params.trackers.var_d220d4746b1774d5) {
                    nearby_players = namespace_7e17181d03156026::getplayersinradius(self.origin, params.var_f78dccad86bc937a);
                    foreach (player in nearby_players) {
                        if (isinlaststand(player) || istrue(player.notarget) || istrue(player.ignoreme)) {
                            continue;
                        }
                        var_d68140ac3f3b837b[var_d68140ac3f3b837b.size] = player;
                    }
                    var_858b56231d6570cb = 1;
                } else {
                    nearby_players = namespace_7e17181d03156026::getplayersinradius(self.origin, params.var_ab5d8fc6026bb639);
                    foreach (player in nearby_players) {
                        if (isinlaststand(player) || istrue(player.notarget) || istrue(player.ignoreme)) {
                            continue;
                        }
                        if (self cansee(player)) {
                            var_d68140ac3f3b837b[var_d68140ac3f3b837b.size] = player;
                        }
                    }
                }
            }
            if (var_d68140ac3f3b837b.size > 0) {
                var_c3de2c3b803cc3d = random(var_d68140ac3f3b837b);
                var_b27493f0dde36018 = [];
                offsets = [0:(-30, -75, 180), 1:(-30, 0, 180), 2:(-30, 75, 180), 3:(0, -75, 180), 4:(0, 0, 180), 5:(0, 75, 180), 6:(30, -75, 180), 7:(30, 0, 180), 8:(30, 75, 180)];
                for (i = 0; i < function_c4a3b2f8fe65e727(params, self.var_8f9e0bd9f1142b53); i++) {
                    point = self.origin + random(offsets);
                    var_b27493f0dde36018[i] = function_35a2d548eaf273dd(point, params, 1, 1);
                }
                function_2961b32bea91aa54(params, var_b27493f0dde36018, var_c3de2c3b803cc3d, var_858b56231d6570cb);
                if (var_858b56231d6570cb == 0) {
                    thread namespace_dc53a27a8db8e6bf::function_85d8080b6082da5f();
                }
            }
            var_926013518bd7bedd = self.var_8f9e0bd9f1142b53 * 150;
            interval = params.var_482220154ebed932 * (1000 - var_926013518bd7bedd);
            params.trackers.var_47ed3bc2d55c6fce = var_47085f3bf583f9f + interval;
            if (var_858b56231d6570cb) {
                params.trackers.var_d220d4746b1774d5 = var_47085f3bf583f9f + params.var_40ed8a6dd8f0e6c5 * 1000;
            }
        }
        if (function_17ae7d764ad366a9()) {
            if ((var_47085f3bf583f9f >= params.trackers.var_dffa579e39f9bdd5 && params.trackers.var_d6f06f378d054276 + params.var_380bac03870b68ea * 1000 < var_47085f3bf583f9f || istrue(self.var_f89e16252aec0396)) && params.trackers.var_647a70845738f8bc.size < function_99fedeb298e8b70(params, self.var_8f9e0bd9f1142b53) && params.trackers.var_8c0638b444bc5206 == 0) {
                params.trackers.var_8c0638b444bc5206 = 1;
                thread function_4f013c722a300e5b(params);
            }
        } else if (var_47085f3bf583f9f > var_4e427fadfa92de91) {
            var_d68140ac3f3b837b = namespace_7e17181d03156026::getplayersinradius(self.origin, var_c8efbcbae752bda0);
            var_984bece0413ef6bb = [];
            foreach (target in var_d68140ac3f3b837b) {
                if (target hastacvis(self, 0, var_c8efbcbae752bda0)) {
                    var_984bece0413ef6bb = array_add_safe(var_984bece0413ef6bb, target);
                }
            }
            if (var_984bece0413ef6bb.size > 0) {
                function_6385032960fc51b1(1);
                params.trackers.var_d220d4746b1774d5 = var_47085f3bf583f9f + params.var_40ed8a6dd8f0e6c5 * 1000;
            } else {
                var_4e427fadfa92de91 = var_47085f3bf583f9f + var_9b67eaff05a41947;
            }
        }
        var_f0686423d61924b0 = (var_47085f3bf583f9f - previoustime) * 0.05;
        previoustime = var_47085f3bf583f9f;
        params.trackers.var_600e626bc6761fde = params.trackers.var_600e626bc6761fde + var_f0686423d61924b0;
        if (params.trackers.var_600e626bc6761fde >= 360) {
            params.trackers.var_600e626bc6761fde = params.trackers.var_600e626bc6761fde - 360;
        }
        params.trackers.var_67ecec14024015ca = cos(params.trackers.var_600e626bc6761fde);
        params.trackers.var_6b0bf75d6f4e6684 = sin(params.trackers.var_600e626bc6761fde);
        waitframe();
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x61c4
// Size: 0x27
function private function_6385032960fc51b1(value) {
    self.var_fbaf86a86d9b2dfa = value;
    if (istrue(value)) {
        ent_flag_set("warlord_start_combat_chatter");
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x61f2
// Size: 0xd
function private function_17ae7d764ad366a9() {
    return istrue(self.var_fbaf86a86d9b2dfa);
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6207
// Size: 0x81
function private function_62883a99c01a4108(params) {
    self endon("death");
    while (1) {
        if (istrue(self.var_fbaf86a86d9b2dfa)) {
            self.var_f89e16252aec0396 = 1;
            break;
        }
        wait(0.1);
    }
    while (1) {
        if (params.trackers.var_647a70845738f8bc.size >= function_99fedeb298e8b70(params, self.var_8f9e0bd9f1142b53)) {
            self.var_f89e16252aec0396 = 0;
            break;
        }
        wait(0.1);
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x628f
// Size: 0x1b0
function private function_dfda2e2f7083463b(params) {
    self notify("droneBombMonitor");
    self endon("droneBombMonitor");
    self waittill("death");
    params.trackers.var_647a70845738f8bc = array_remove(params.trackers.var_647a70845738f8bc, self);
    params.trackers.var_dd72808b849e4d52 = array_remove(params.trackers.var_dd72808b849e4d52, self);
    if (self.behavior == "bomb_attack_leader") {
        newleader = undefined;
        foreach (drone in params.trackers.var_dd72808b849e4d52) {
            if (drone.behavior == "bomb_attack_follower" && drone.bomb_attack_leader == self) {
                if (isdefined(newleader)) {
                    drone.bomb_attack_leader = newleader;
                } else {
                    drone.targeted_enemy = self.targeted_enemy;
                    drone.var_3aec9a4ec140655a = self.var_3aec9a4ec140655a;
                    drone.var_87babc8a58bc3639 = gettime();
                    drone.behavior = "bomb_attack_leader";
                    drone.var_39b4dfdad5a00c8c = 1;
                    newleader = drone;
                }
            }
        }
        if (!isdefined(newleader)) {
            params.trackers.var_f6b4651f19aa358--;
        }
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6446
// Size: 0x2c
function private function_3145d0fdef5009b9() {
    if (isdefined(self.var_788e2acc86a73834) && self.var_788e2acc86a73834 < gettime()) {
        thread function_7e776322ab6a3ed0(0);
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6479
// Size: 0x7a2
function private function_9d8b7e5c2ee17132(params) {
    self endon("death");
    while (1) {
        function_3145d0fdef5009b9();
        target = undefined;
        self.var_39b4dfdad5a00c8c = 0;
        if (self.behavior == "idle" || self.forcestop == 1) {
            wait(0.1);
        } else {
            if (self.behavior == "protect") {
                self.var_b6610da05df6cc67 = self.owner.origin;
                self setscriptablepartstate("lights", "chase", 0);
                self setscriptablepartstate("shield", "on", 0);
                function_19d48dfe8f3cbc84(1, self, params);
                while (self.behavior == "protect" && isdefined(self.owner)) {
                    if (isdefined(self.owner.var_5e9eeedc4f37723b)) {
                        if (self.owner.var_5e9eeedc4f37723b <= 0) {
                            var_a9152cc6eaa08e10 = [0:(1, 1, 45), 1:(1, 1, 25), 2:(-1, -1, 45), 3:(-1, -1, 25), 4:(1, 1, 65), 5:(-1, -1, 65), 6:(1.3, 1.3, 35), 7:(-1.3, -1.3, 35), 8:(1.3, 1.3, 55), 9:(-1.3, -1.3, 55)];
                            var_b14c3da34a99e4cc = 33;
                            if (!isdefined(self.var_1a6a2f69c980829c)) {
                                self.var_1a6a2f69c980829c = randomintrange(0, 8);
                            }
                            vec = (var_a9152cc6eaa08e10[self.var_1a6a2f69c980829c][0] * params.trackers.var_67ecec14024015ca * var_b14c3da34a99e4cc, var_a9152cc6eaa08e10[self.var_1a6a2f69c980829c][1] * params.trackers.var_6b0bf75d6f4e6684 * var_b14c3da34a99e4cc, var_a9152cc6eaa08e10[self.var_1a6a2f69c980829c][2]);
                            if (self.var_1a6a2f69c980829c == 0 || self.var_1a6a2f69c980829c == 2) {
                                vec = (var_a9152cc6eaa08e10[self.var_1a6a2f69c980829c][1] * params.trackers.var_6b0bf75d6f4e6684 * var_b14c3da34a99e4cc, var_a9152cc6eaa08e10[self.var_1a6a2f69c980829c][0] * params.trackers.var_67ecec14024015ca * var_b14c3da34a99e4cc, var_a9152cc6eaa08e10[self.var_1a6a2f69c980829c][2]);
                            }
                        } else {
                            var_a9152cc6eaa08e10 = [0:(1, 1, 1.5), 1:(1, 1, -1.5), 2:(-1, -1, 1.5), 3:(-1, -1, -1.5), 4:(1.5, 1.5, 2), 5:(1.5, 1.5, -2), 6:(-1.5, -1.5, 2), 7:(-1.5, -1.5, -2)];
                            var_7bb72bedac0fd101 = int(self.var_1a6a2f69c980829c / self.owner.var_5e9eeedc4f37723b);
                            var_92580dadf0e61cae = self.var_1a6a2f69c980829c % self.owner.var_5e9eeedc4f37723b;
                            var_8170fee5aa3b28dd = self.owner.var_8a8bfb7e19f13a33[var_92580dadf0e61cae];
                            var_5fbe54f9c6f5babf = self.owner.var_b8914dd33e1c911d[var_92580dadf0e61cae];
                            vec = var_8170fee5aa3b28dd + (var_5fbe54f9c6f5babf[0] * var_a9152cc6eaa08e10[self.var_1a6a2f69c980829c][0] * params.trackers.var_67ecec14024015ca, var_5fbe54f9c6f5babf[1] * var_a9152cc6eaa08e10[self.var_1a6a2f69c980829c][1] * params.trackers.var_67ecec14024015ca, var_5fbe54f9c6f5babf[2] * var_a9152cc6eaa08e10[self.var_1a6a2f69c980829c][2] * params.trackers.var_6b0bf75d6f4e6684);
                        }
                        self vehicle_setspeed(100, 100);
                        if (istrue(self.owner.var_38e2a82236a1bb9a)) {
                            self setvehgoalpos(self.var_b6610da05df6cc67 + vec, 0);
                        } else {
                            self setvehgoalpos(self.var_b6610da05df6cc67 + vec, 1);
                        }
                        self.var_b6610da05df6cc67 = self.owner.origin;
                    }
                    waitframe();
                }
                function_19d48dfe8f3cbc84(0, self, params);
                self setscriptablepartstate("shield", "off", 0);
                self setscriptablepartstate("lights", "chase", 0);
            }
            if (self.behavior == "bomb_attack_leader") {
                var_c3de2c3b803cc3d = function_a94ff7ec9c071dc3();
                if (!isdefined(var_c3de2c3b803cc3d)) {
                    nearby_players = namespace_7e17181d03156026::getplayersinradius(self.origin, self.sightdistance);
                    foreach (player in nearby_players) {
                        if (function_ad443bbcdcf37b85(player) && function_abd3fe39b9962cf2(player, (0, 0, 0))) {
                            var_c3de2c3b803cc3d = player namespace_86b52005c685dfb9::function_2e1b23386b967c10();
                            self.targeted_enemy = player;
                            self.var_3aec9a4ec140655a = var_c3de2c3b803cc3d;
                            self.var_87babc8a58bc3639 = gettime();
                            break;
                        }
                    }
                    if (!isdefined(var_c3de2c3b803cc3d)) {
                        self.targeted_enemy = undefined;
                        thread function_7e776322ab6a3ed0(0);
                        wait(10);
                    }
                }
                if (isdefined(var_c3de2c3b803cc3d)) {
                    target = var_c3de2c3b803cc3d;
                    if (issharedfuncdefined("weapons", "_launchGrenade")) {
                        if (!isdefined(self.dangericonent)) {
                            dangericonent = self [[ getsharedfunc("weapons", "_launchGrenade") ]]("assault_drone_danger_mp", self.origin, (0, 0, 0), 100, 1);
                            dangericonent linkto(self);
                            self.dangericonent = dangericonent;
                        }
                    }
                    self.var_326452e72e7d0115 = 9000;
                }
            }
            if (self.behavior == "bomb_attack_follower") {
                if (isdefined(self.bomb_attack_leader)) {
                    var_872d0fddcd37a140 = self.bomb_attack_leader.origin;
                    if (isdefined(self.bomb_attack_leader.var_3aec9a4ec140655a)) {
                        var_872d0fddcd37a140 = self.bomb_attack_leader.var_3aec9a4ec140655a;
                    }
                    points = getnodesinradius(var_872d0fddcd37a140, 200, 50, 75, "Path 3D");
                    if (points.size > 0) {
                        point = random(points);
                        target = point.origin;
                    } else {
                        wait(randomfloatrange(1, 3));
                        target = var_872d0fddcd37a140;
                    }
                    self.var_326452e72e7d0115 = 3000;
                } else {
                    /#
                        assertmsg("VDrone_beahvior - Drone Follower without Drone Leader ");
                    #/
                }
            }
        }
        if (isdefined(target)) {
            childthread function_b737854d4e6433e9(self.origin, target);
            self waittill("goal");
        } else {
            wait(0.1);
        }
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c22
// Size: 0x1d1
function function_b737854d4e6433e9(startpoint, endpoint) {
    self endon("death");
    points = function_be2d74bb3a32175(startpoint, endpoint);
    self vehicle_setspeed(self.maxspeed, self.maxspeed);
    var_c8ad2ec7b6c85d3d = gettime() + self.var_326452e72e7d0115;
    var_76fc9c72cbf75eca = getdvarint(@"hash_37752ee8659d9a34", 25);
    if (isdefined(points)) {
        for (i = 0; i < points.size; i++) {
            self setvehgoalpos(points[i].origin, 1);
            while (distance2dsquared(self.origin, points[i].origin) > var_76fc9c72cbf75eca * var_76fc9c72cbf75eca) {
                if (self.var_39b4dfdad5a00c8c || gettime() > var_c8ad2ec7b6c85d3d) {
                    self notify("goal");
                    return;
                }
                function_3145d0fdef5009b9();
                waitframe();
            }
        }
    } else {
        var_1bfa180c6fdd09dd = physics_createcontents([0:"physicscontents_glass", 1:"physicscontents_vehicleclip", 2:"physicscontents_missileclip", 3:"physicscontents_clipshot"]);
        ignore = [0:self];
        passed = namespace_2a184fc4902783dc::sphere_trace_passed(startpoint, endpoint, 8, ignore, var_1bfa180c6fdd09dd);
        if (istrue(passed)) {
            self setvehgoalpos(endpoint, 1);
            while (distance2dsquared(self.origin, endpoint) > var_76fc9c72cbf75eca * var_76fc9c72cbf75eca) {
                if (self.var_39b4dfdad5a00c8c || gettime() > var_c8ad2ec7b6c85d3d) {
                    self notify("goal");
                    return;
                }
                function_3145d0fdef5009b9();
                waitframe();
            }
        } else {
            self.var_788e2acc86a73834 = 0;
            function_3145d0fdef5009b9();
            return;
        }
    }
    self notify("goal");
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6dfb
// Size: 0x116
function function_a94ff7ec9c071dc3() {
    if (isdefined(self.targeted_enemy) && isplayer(self.targeted_enemy) && function_ad443bbcdcf37b85(self.targeted_enemy) && (self.var_e111e406f2e7a626 || distancesquared(self.origin, self.targeted_enemy.origin) < self.sightdistance * self.sightdistance)) {
        if (self.var_e111e406f2e7a626 || function_abd3fe39b9962cf2(self.targeted_enemy, (0, 0, 0))) {
            outval = self.targeted_enemy namespace_86b52005c685dfb9::function_2e1b23386b967c10();
            self.var_3aec9a4ec140655a = outval;
            self.var_87babc8a58bc3639 = gettime();
            return outval;
        }
        if (isdefined(self.var_3aec9a4ec140655a)) {
            if (self.var_87babc8a58bc3639 + 10000 < gettime()) {
                self.var_3aec9a4ec140655a = undefined;
            } else {
                return self.var_3aec9a4ec140655a;
            }
        }
    }
    return undefined;
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f19
// Size: 0x105
function function_3a06a5b74de0e429(destination, max_speed, var_39ec3953ca2743f4, var_8b42b0dbf3d7fc33) {
    var_3e4c94befd846398 = max_speed * 17.6;
    dist = distance(self.origin, destination);
    var_8bd1bdc3bfb8d76 = 0.5;
    if (istrue(var_8b42b0dbf3d7fc33)) {
        var_ed3df9bc8bfd7ad4 = max(0.1, dist / var_3e4c94befd846398);
        self moveto(destination, var_ed3df9bc8bfd7ad4, var_ed3df9bc8bfd7ad4 * var_8bd1bdc3bfb8d76, 0);
    } else if (istrue(var_39ec3953ca2743f4)) {
        var_ed3df9bc8bfd7ad4 = max(0.1, dist / var_3e4c94befd846398 * var_8bd1bdc3bfb8d76);
        self moveto(destination, var_ed3df9bc8bfd7ad4, 0, var_ed3df9bc8bfd7ad4 * var_8bd1bdc3bfb8d76);
    } else if (istrue(var_39ec3953ca2743f4) && istrue(var_8b42b0dbf3d7fc33)) {
        var_ed3df9bc8bfd7ad4 = max(0.1, dist / var_3e4c94befd846398);
        self moveto(destination, var_ed3df9bc8bfd7ad4, 0, 0);
    } else {
        var_ed3df9bc8bfd7ad4 = max(0.1, dist / var_3e4c94befd846398 * (1 + var_8bd1bdc3bfb8d76));
        self moveto(destination, var_ed3df9bc8bfd7ad4, var_ed3df9bc8bfd7ad4 * var_8bd1bdc3bfb8d76, var_ed3df9bc8bfd7ad4 * var_8bd1bdc3bfb8d76);
    }
    return var_ed3df9bc8bfd7ad4;
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7026
// Size: 0x2f9
function function_c810b23729e64272(var_42ed2faebf159cca, target) {
    params = level.ob.var_bfc5850d296d2ebe["Maestro"];
    startpos = var_42ed2faebf159cca.origin;
    startang = var_42ed2faebf159cca.angles;
    vehicleinfo = "veh_maestro_bomb_drone_ob";
    drone = spawnvehicle("veh8_mil_air_tuniform_c4_ob", "drone_turret", vehicleinfo, startpos, startang);
    drone.var_52dcdba485e7ceeb = "j_body";
    drone.team = self.team;
    drone.var_463aecbced511653 = 0;
    drone.var_2a6024dda5bc8738 = 0;
    drone.maxspeed = float(params.var_79b43d1888144e20);
    drone.var_c1f849cc6244fa6b = params.var_a7cdb2a8ec572747;
    drone.sightdistance = params.var_353ddc1540d767c5;
    drone.exploding = 0;
    drone.var_176f2563dbfd1669 = params.var_176f2563dbfd1669;
    drone.forcestop = 0;
    drone.health = 999999;
    drone.var_9d26ac1e325367ce = function_2336488258354fbc(#"aitype", %"hash_fb34274fe0861d2");
    drone.var_534e788bc498be9f = getscriptbundle(%"hash_781de85130f2625a");
    drone.subclass = drone.var_534e788bc498be9f.name;
    drone.var_1e0eb63ecb3f1e2 = 1;
    drone.var_4919d15787f01154 = 1;
    drone.max_fake_health = params.var_53385b6be5f6c52f;
    drone.fake_health = var_42ed2faebf159cca.fake_health;
    drone.var_db8581b0d3afd64c = 1;
    drone.var_4d0b3556ea76e2bc = params.var_4d0b3556ea76e2bc;
    drone.var_400c3f28e44db94e = target;
    drone.owner = var_42ed2faebf159cca.owner;
    drone.var_f781079e220f1cde = 0;
    drone.var_1a00611a25c12747 = 1;
    drone.var_d96e5c15d869ca53 = var_42ed2faebf159cca.var_d96e5c15d869ca53;
    drone.var_aa6fe6af4cbbdd47 = &function_aeaae75fa8cfd4cb;
    drone thread function_301048eaf1a616d(params);
    drone setcandamage(1);
    drone enableaimassist();
    drone thread function_4c99c360d70d867a();
    drone thread function_3e42dda71c258e8a();
    drone thread function_2395aa8d473eb61f();
    drone function_f3bb4f4911a1beb2(#"emp", #"hash_a865e3770eb96298", drone, &function_7c3b5beb399db271);
    drone setscriptablepartstate("Spawn_Reveal", "Reveal_Instant", 0);
    return drone;
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7327
// Size: 0x541
function function_617427d0e4d6b667() {
    self endon("death");
    var_691a41584ef070e8 = self.origin;
    var_202265225c2b02b8 = self.var_400c3f28e44db94e.origin + (0, 0, 50);
    self.move_speed = self.maxspeed;
    self vehicle_setspeed(self.maxspeed, self.maxspeed * 10, self.maxspeed * 10);
    self setscriptablepartstate("warning_beep", "on", 0);
    self setscriptablepartstate("engine_sound", "high", 0);
    self setscriptablepartstate("lights", "chase", 0);
    if (issharedfuncdefined("weapons", "_launchGrenade")) {
        dangericonent = self [[ getsharedfunc("weapons", "_launchGrenade") ]]("assault_drone_danger_mp", self.origin, (0, 0, 0), 100, 1);
        dangericonent linkto(self);
        self.dangericonent = dangericonent;
    }
    thread function_19477228c9b4907b();
    points = function_be2d74bb3a32175(var_691a41584ef070e8, var_202265225c2b02b8);
    ignore = [0:self];
    var_1bfa180c6fdd09dd = physics_createcontents([0:"physicscontents_glass", 1:"physicscontents_vehicleclip", 2:"physicscontents_missileclip", 3:"physicscontents_clipshot"]);
    passed = namespace_2a184fc4902783dc::sphere_trace_passed(var_691a41584ef070e8, self.var_400c3f28e44db94e.origin + (0, 0, 50), 8, ignore, var_1bfa180c6fdd09dd);
    /#
        if (getdvarint(@"hash_663fcb5399f02f8b", 0)) {
            line(var_691a41584ef070e8, var_202265225c2b02b8, (1, 0, 1), 1, 0, 100);
        }
    #/
    if (!istrue(passed) && isdefined(points)) {
        for (i = 0; i < points.size; i++) {
            var_5a8011e9322aaee1 = i == points.size - 1;
            if (var_5a8011e9322aaee1) {
                self setvehgoalpos(points[i].origin, 1);
                var_81203b77e0f72dd = 400;
            } else {
                self setvehgoalpos(points[i].origin, 0);
                var_81203b77e0f72dd = 900;
            }
            /#
                if (getdvarint(@"hash_663fcb5399f02f8b", 0)) {
                    line(self.origin, points[i].origin, (0, 1, 1), 1, 0, 100);
                    print3d(self.origin, "<unknown string>", (0, 1, 1), 1, 1, 60);
                }
            #/
            while (distance2dsquared(self.origin, points[i].origin) > var_81203b77e0f72dd) {
                waitframe();
            }
            canseetarget = namespace_2a184fc4902783dc::sphere_trace_passed(self.origin, self.var_400c3f28e44db94e.origin + (0, 0, 50), 8, ignore, var_1bfa180c6fdd09dd);
            if (canseetarget) {
                self setvehgoalpos(self.var_400c3f28e44db94e.origin + (0, 0, 50), 1);
                /#
                    if (getdvarint(@"hash_663fcb5399f02f8b", 0)) {
                        line(self.origin, self.var_400c3f28e44db94e.origin + (0, 0, 50), (1, 0, 1), 1, 0, 100);
                        print3d(self.origin, "<unknown string>", (1, 0, 1), 1, 1, 60);
                    }
                #/
                if (!var_5a8011e9322aaee1) {
                    while (distance2dsquared(self.origin, var_202265225c2b02b8) > 400) {
                        waitframe();
                    }
                    break;
                }
            }
        }
    } else {
        if (!isdefined(points)) {
            if (getdvarint(@"hash_62d49f4d2d6a1f23", 1)) {
                /#
                    if (getdvarint(@"hash_663fcb5399f02f8b", 0)) {
                        print3d(self.origin, "<unknown string>", (1, 1, 0), 1, 1, 100);
                    }
                #/
                function_e681027fc9108d7();
                return;
            } else {
                /#
                    if (getdvarint(@"hash_663fcb5399f02f8b", 0)) {
                        print3d(self.origin, "<unknown string>", (1, 1, 0), 1, 1, 100);
                    }
                #/
            }
        } else {
            /#
                if (getdvarint(@"hash_663fcb5399f02f8b", 0)) {
                    line(self.origin, var_202265225c2b02b8, (1, 1, 0), 1, 0, 100);
                    print3d(self.origin, "<unknown string>", (1, 1, 0), 1, 1, 60);
                }
            #/
        }
        self setvehgoalpos(var_202265225c2b02b8, 1);
        while (distance2dsquared(self.origin, var_202265225c2b02b8) > 400) {
            waitframe();
        }
    }
    if (self.exploding == 0) {
        function_e681027fc9108d7();
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x786f
// Size: 0x1bf
function function_727d5c4c176aebb0(var_c52c3e2b356a8268, var_26246b374d066079, patrol_radius, var_63a7d0d7ed355f9b, params) {
    self endon("death");
    for (i = 1; i < var_c52c3e2b356a8268.size; i++) {
        wait_time = function_3a06a5b74de0e429(var_c52c3e2b356a8268[i], self.maxspeed);
        waittill_any_timeout_1(wait_time, "target_found");
        if (isdefined(self.var_400c3f28e44db94e)) {
            break;
        }
    }
    if (isdefined(self.var_400c3f28e44db94e)) {
        var_83cc6473cc606e0f = self.owner function_c810b23729e64272(self, self.var_400c3f28e44db94e);
        if (!isdefined(params.trackers.var_3aef66aa7812fab4)) {
            params.trackers.var_3aef66aa7812fab4 = [];
        } else {
            params.trackers.var_3aef66aa7812fab4 = array_removeundefined(params.trackers.var_3aef66aa7812fab4);
        }
        params.trackers.var_3aef66aa7812fab4[params.trackers.var_3aef66aa7812fab4.size] = var_83cc6473cc606e0f;
        var_83cc6473cc606e0f thread function_617427d0e4d6b667();
        if (isdefined(self.var_d96e5c15d869ca53) && isdefined(self.var_d96e5c15d869ca53.var_15cd05e77f16664b) && self.var_d96e5c15d869ca53.var_15cd05e77f16664b == self) {
            self.var_d96e5c15d869ca53.var_15cd05e77f16664b = var_83cc6473cc606e0f;
        }
        thread function_e49c2a4a3183522a();
    } else {
        thread function_91e1b29969538cd3(var_26246b374d066079, patrol_radius, var_63a7d0d7ed355f9b, params);
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a35
// Size: 0x323
function function_5cbe39f2741ec0b0(var_828d42220bf8cd49, var_c52c3e2b356a8268, var_26246b374d066079, patrol_radius, var_63a7d0d7ed355f9b, var_894c2f02e82b97cf, params) {
    self endon("death");
    self endon("end_patrolling_drones");
    var_d96e5c15d869ca53 = spawnstruct();
    var_d96e5c15d869ca53.var_828d42220bf8cd49 = var_828d42220bf8cd49;
    var_d96e5c15d869ca53.var_ca1c748118b3de7f = [];
    var_d96e5c15d869ca53.owner = self;
    var_d96e5c15d869ca53.var_1d7c18d3c0a3be26 = params.var_1d7c18d3c0a3be26;
    params.var_977ea40af0a78460[var_828d42220bf8cd49] = var_d96e5c15d869ca53;
    for (var_60c579d3b2ec6254 = 0; var_60c579d3b2ec6254 < var_894c2f02e82b97cf; var_60c579d3b2ec6254++) {
        drone = function_35a2d548eaf273dd(var_26246b374d066079, params, 0, 0);
        var_610c9bf70691838c = params.trackers.var_d5dc746b4c149b00[var_828d42220bf8cd49].size;
        params.trackers.var_d5dc746b4c149b00[var_828d42220bf8cd49][var_610c9bf70691838c] = drone;
        drone.var_d96e5c15d869ca53 = var_d96e5c15d869ca53;
        drone thread function_91e1b29969538cd3(var_26246b374d066079, patrol_radius, var_63a7d0d7ed355f9b, params);
    }
    while (1) {
        areplayersnear = 0;
        if (self.ob.instancedata.var_6c29f2fdb0054bbe.size > 0) {
            foreach (player in self.ob.instancedata.var_6c29f2fdb0054bbe) {
                if (distance(player.origin, var_26246b374d066079) < 4000) {
                    areplayersnear = 1;
                    break;
                }
            }
        }
        params.trackers.var_d5dc746b4c149b00[var_828d42220bf8cd49] = array_removeundefined(params.trackers.var_d5dc746b4c149b00[var_828d42220bf8cd49]);
        if (areplayersnear && params.trackers.var_d5dc746b4c149b00[var_828d42220bf8cd49].size < var_894c2f02e82b97cf) {
            wait(params.var_8ff0d62ff823d63f);
            params.trackers.var_d5dc746b4c149b00[var_828d42220bf8cd49] = array_removeundefined(params.trackers.var_d5dc746b4c149b00[var_828d42220bf8cd49]);
            while (params.trackers.var_d5dc746b4c149b00[var_828d42220bf8cd49].size < var_894c2f02e82b97cf) {
                drone = function_35a2d548eaf273dd(var_c52c3e2b356a8268[0], params, 0, 0);
                var_610c9bf70691838c = params.trackers.var_d5dc746b4c149b00[var_828d42220bf8cd49].size;
                params.trackers.var_d5dc746b4c149b00[var_828d42220bf8cd49][var_610c9bf70691838c] = drone;
                drone.var_d96e5c15d869ca53 = var_d96e5c15d869ca53;
                drone thread function_727d5c4c176aebb0(var_c52c3e2b356a8268, var_26246b374d066079, patrol_radius, var_63a7d0d7ed355f9b, params);
                wait(0.2);
            }
        } else {
            waitframe();
        }
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d5f
// Size: 0x152
function function_d66f206de2a2b7d1(target, var_e2ebc6c792eb1a5f, warlord, params) {
    self.owner endon("death");
    self.var_ca1c748118b3de7f[self.var_ca1c748118b3de7f.size] = target;
    target.var_68cea97f9e78379d = gettime();
    self.var_15cd05e77f16664b = var_e2ebc6c792eb1a5f;
    while (gettime() - target.var_68cea97f9e78379d < self.var_1d7c18d3c0a3be26) {
        if (isdefined(self.var_15cd05e77f16664b)) {
            waitframe();
        } else {
            foreach (drone in params.trackers.var_d5dc746b4c149b00[self.var_828d42220bf8cd49]) {
                if (isdefined(drone) && !isdefined(drone.var_400c3f28e44db94e)) {
                    drone.var_400c3f28e44db94e = target;
                    self.var_15cd05e77f16664b = drone;
                    drone notify("target_found");
                    break;
                }
            }
        }
        wait(0.2);
    }
    self.var_ca1c748118b3de7f = array_remove(self.var_ca1c748118b3de7f, target);
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7eb8
// Size: 0x6a7
function function_1d511f730cc98a07(params) {
    self endon("death");
    params.var_977ea40af0a78460 = [];
    if (isdefined(level.ob.var_bfc5850d296d2ebe["Maestro"].var_68e6124a989b5a31)) {
        spawners = array_randomize(level.ob.var_bfc5850d296d2ebe["Maestro"].var_68e6124a989b5a31);
        var_aced406793c2161 = level.ob.var_bfc5850d296d2ebe["Maestro"].var_5a0e8d4bcd8ac4c2;
        var_d1800a4c39d15e76 = level.ob.var_bfc5850d296d2ebe["Maestro"].var_926ec82bd8dad665;
        params.var_977ea40af0a78460 = var_d1800a4c39d15e76;
        var_3d8706c40d78204b = getdvarint(@"hash_33ab4ca7c0b34970", 100);
        var_828d42220bf8cd49 = 0;
        foreach (point in spawners) {
            var_c52c3e2b356a8268 = [];
            var_4ea37629acda5a9c = 0;
            var_26246b374d066079 = undefined;
            patrol_radius = undefined;
            var_894c2f02e82b97cf = undefined;
            var_c52c3e2b356a8268[var_c52c3e2b356a8268.size] = point.origin;
            var_421c1edf6e0646b2 = point.target;
            var_6a3a803356796c71 = 1;
            while (1) {
                if (var_6a3a803356796c71) {
                    foreach (var_d96e5c15d869ca53 in var_d1800a4c39d15e76) {
                        if (var_421c1edf6e0646b2 == var_d96e5c15d869ca53.targetname) {
                            var_c52c3e2b356a8268[var_c52c3e2b356a8268.size] = var_d96e5c15d869ca53.origin;
                            var_26246b374d066079 = var_d96e5c15d869ca53.origin;
                            patrol_radius = var_d96e5c15d869ca53.radius;
                            var_63a7d0d7ed355f9b = var_d96e5c15d869ca53.height;
                            var_894c2f02e82b97cf = var_d96e5c15d869ca53.script_count;
                            var_4ea37629acda5a9c = 1;
                            break;
                        }
                    }
                } else {
                    /#
                        assertmsg("Maestro Drone Behavior: Repopulation Path could not find target " + var_421c1edf6e0646b2);
                    #/
                    break;
                }
                if (var_4ea37629acda5a9c) {
                    break;
                }
                var_6a3a803356796c71 = 0;
                foreach (pathpoint in var_aced406793c2161) {
                    if (var_421c1edf6e0646b2 == pathpoint.targetname) {
                        var_c52c3e2b356a8268[var_c52c3e2b356a8268.size] = pathpoint.origin;
                        var_421c1edf6e0646b2 = pathpoint.target;
                        var_6a3a803356796c71 = 1;
                        break;
                    }
                }
            }
            if (var_4ea37629acda5a9c && var_3d8706c40d78204b > 0) {
                if (var_894c2f02e82b97cf > var_3d8706c40d78204b) {
                    var_894c2f02e82b97cf = var_3d8706c40d78204b;
                    var_3d8706c40d78204b = 0;
                } else {
                    var_3d8706c40d78204b = var_3d8706c40d78204b - var_894c2f02e82b97cf;
                }
                if (!isdefined(params.trackers.var_d5dc746b4c149b00[var_828d42220bf8cd49])) {
                    params.trackers.var_d5dc746b4c149b00[var_828d42220bf8cd49] = [];
                } else {
                    params.trackers.var_d5dc746b4c149b00[var_828d42220bf8cd49] = function_fdc9d5557c53078e(params.trackers.var_d5dc746b4c149b00[var_828d42220bf8cd49]);
                }
                thread function_5cbe39f2741ec0b0(var_828d42220bf8cd49, var_c52c3e2b356a8268, var_26246b374d066079, patrol_radius, var_63a7d0d7ed355f9b, var_894c2f02e82b97cf, params);
                var_828d42220bf8cd49 = var_828d42220bf8cd49 + 1;
            }
        }
        if (var_3d8706c40d78204b > 0) {
            var_4d8542dfe820fdd4 = array_randomize(level.ob.var_bfc5850d296d2ebe["Maestro"].var_784a9ecb89bdd253);
            params.var_977ea40af0a78460 = function_ef4b3df86351aa00(params.var_977ea40af0a78460, var_4d8542dfe820fdd4, params.var_977ea40af0a78460.size);
            foreach (point in var_4d8542dfe820fdd4) {
                if (var_3d8706c40d78204b == 0) {
                    break;
                }
                count = min(point.script_count, var_3d8706c40d78204b);
                if (!isdefined(params.trackers.var_d5dc746b4c149b00[var_828d42220bf8cd49])) {
                    params.trackers.var_d5dc746b4c149b00[var_828d42220bf8cd49] = [];
                } else {
                    params.trackers.var_d5dc746b4c149b00[var_828d42220bf8cd49] = function_fdc9d5557c53078e(params.trackers.var_d5dc746b4c149b00[var_828d42220bf8cd49]);
                }
                var_3d8706c40d78204b = var_3d8706c40d78204b - count;
                var_d96e5c15d869ca53 = spawnstruct();
                var_d96e5c15d869ca53.var_828d42220bf8cd49 = var_828d42220bf8cd49;
                var_d96e5c15d869ca53.var_ca1c748118b3de7f = [];
                var_d96e5c15d869ca53.owner = self;
                var_d96e5c15d869ca53.var_1d7c18d3c0a3be26 = params.var_1d7c18d3c0a3be26;
                params.var_977ea40af0a78460[var_828d42220bf8cd49] = var_d96e5c15d869ca53;
                for (i = 0; i < count; i++) {
                    angle = randomfloatrange(0, 360);
                    var_c3ca7cb888615c37 = cos(angle);
                    sine = sin(angle);
                    vec = (var_c3ca7cb888615c37 * point.radius, sine * point.radius, randomfloatrange(0, point.height)) + point.origin;
                    drone = function_35a2d548eaf273dd(vec, params, 0, 0);
                    if (isdefined(drone)) {
                        drone thread function_91e1b29969538cd3(point.origin, point.radius, point.height, params);
                    }
                    var_446798ea3be5bbfb = params.trackers.var_d5dc746b4c149b00[var_828d42220bf8cd49].size;
                    params.trackers.var_d5dc746b4c149b00[var_828d42220bf8cd49][var_446798ea3be5bbfb] = drone;
                    drone.var_d96e5c15d869ca53 = var_d96e5c15d869ca53;
                    drone.var_d13606ca2e7d4328 = 1;
                    wait(0.2);
                }
                var_828d42220bf8cd49 = var_828d42220bf8cd49 + 1;
            }
        }
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8566
// Size: 0x365
function function_d2eaa684b4981192(params) {
    self endon("death");
    while (isdefined(self) && !isdefined(self.var_400c3f28e44db94e)) {
        var_c7e2da5eeb30de27 = namespace_235de5057ddc58e0::function_d9ce8fb00f0e5fa1(self.origin, self.var_c1f849cc6244fa6b, undefined, self.owner);
        var_787ddfc55a3b8242 = [];
        foreach (guy in var_c7e2da5eeb30de27) {
            if (!isdefined(self.owner) || !isdefined(self.owner.team) || !isdefined(guy.team) || guy.team != self.owner.team) {
                if (isplayer(guy) && (isinlaststand(guy) || istrue(guy.notarget) || istrue(guy.ignoreme))) {
                    continue;
                }
                var_787ddfc55a3b8242[var_787ddfc55a3b8242.size] = guy;
            }
        }
        var_99afb4d38ca52ad1 = [];
        if (var_787ddfc55a3b8242.size > 0) {
            foreach (target in var_787ddfc55a3b8242) {
                if (target.origin[2] < self.origin[2] + 20 && isalive(target) && function_abd3fe39b9962cf2(target, (0, 0, 0))) {
                    var_99afb4d38ca52ad1[var_99afb4d38ca52ad1.size] = target;
                }
            }
        }
        mindist = 100000;
        foreach (target in var_99afb4d38ca52ad1) {
            disttotarget = distance2d(target.origin, self.origin);
            if (disttotarget < mindist) {
                targetfound = target;
                mindist = disttotarget;
            } else if (isdefined(targetfound) && isagent(targetfound) && isplayer(target)) {
                targetfound = target;
            }
        }
        if (isagent(targetfound) && isdefined(self.var_d96e5c15d869ca53)) {
            foreach (var_4ba8d721b2c362b0 in params.trackers.var_d5dc746b4c149b00[self.var_d96e5c15d869ca53.var_828d42220bf8cd49]) {
                if (isdefined(var_4ba8d721b2c362b0) && isdefined(var_4ba8d721b2c362b0.var_400c3f28e44db94e) && var_4ba8d721b2c362b0.var_400c3f28e44db94e == targetfound) {
                    targetfound = undefined;
                    break;
                }
            }
        }
        if (isdefined(targetfound)) {
            self.var_400c3f28e44db94e = targetfound;
            self notify("target_found");
            break;
        }
        wait(0.2);
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88d2
// Size: 0x200
function function_91e1b29969538cd3(var_26246b374d066079, patrol_radius, var_63a7d0d7ed355f9b, params) {
    self endon("death");
    while (!isdefined(self.var_400c3f28e44db94e)) {
        angle = randomfloatrange(0, 360);
        var_c3ca7cb888615c37 = cos(angle);
        sine = sin(angle);
        vec = (var_c3ca7cb888615c37 * patrol_radius, sine * patrol_radius, randomfloatrange(0, var_63a7d0d7ed355f9b)) + var_26246b374d066079;
        wait_time = function_3a06a5b74de0e429(vec, 8);
        rot_angle = randomfloatrange(-360, 360);
        self rotateyaw(rot_angle, 3);
        if (isdefined(self.var_400c3f28e44db94e)) {
            break;
        }
        waittill_any_timeout_1(wait_time, "target_found");
    }
    var_83cc6473cc606e0f = self.owner function_c810b23729e64272(self, self.var_400c3f28e44db94e);
    if (!isdefined(params.trackers.var_3aef66aa7812fab4)) {
        params.trackers.var_3aef66aa7812fab4 = [];
    } else {
        params.trackers.var_3aef66aa7812fab4 = array_removeundefined(params.trackers.var_3aef66aa7812fab4);
    }
    params.trackers.var_3aef66aa7812fab4[params.trackers.var_3aef66aa7812fab4.size] = var_83cc6473cc606e0f;
    var_83cc6473cc606e0f thread function_617427d0e4d6b667();
    if (isdefined(self.var_d96e5c15d869ca53) && isdefined(self.var_d96e5c15d869ca53.var_15cd05e77f16664b) && self.var_d96e5c15d869ca53.var_15cd05e77f16664b == self) {
        self.var_d96e5c15d869ca53.var_15cd05e77f16664b = var_83cc6473cc606e0f;
    }
    thread function_e49c2a4a3183522a();
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ad9
// Size: 0x38d
function wheelson_spawn(pos, var_e0c08758eb0006be, vehicle, model, patrolradius, name, var_26ebc4ab45d7e908) {
    if (!isdefined(var_26ebc4ab45d7e908)) {
        /#
            assertmsg("Trying to spawn the Maestro's wheelson but have no ownerOverride!");
        #/
        return;
    }
    spawndata = spawnstruct();
    spawndata.origin = pos;
    spawndata.angles = (0, 0, 0);
    spawndata.spawntype = "veh_pac_sentry_amphibious_mp_biolab";
    spawndata.owner = undefined;
    spawndata.team = var_26ebc4ab45d7e908.team;
    spawndata.modelname = "veh9_mil_lnd_whotel_v2_composite_ob";
    spawndata.vehicletype = "veh_pac_sentry_amphibious_mp_biolab";
    spawndata.targetname = "remote_tank";
    spawndata.cancapture = 0;
    spawndata.cancaptureimmediately = 0;
    spawndata.activateimmediately = 1;
    remoteTank = namespace_f64231d5b7a2c3c4::_spawnvehicle(spawndata);
    remoteTank.owner = var_26ebc4ab45d7e908;
    remoteTank setentityowner(var_26ebc4ab45d7e908);
    remoteTank namespace_6d9917c3dc05dbe9::registersentient("Killstreak_Ground", var_26ebc4ab45d7e908.team);
    remoteTank.team = var_26ebc4ab45d7e908.team;
    remoteTank.tanktype = "remote_tank";
    remoteTank.maxhealth = 6000;
    remoteTank.health = 6000;
    remoteTank.currenthealth = 6000;
    remoteTank.pathstruct = var_e0c08758eb0006be;
    remoteTank.var_e0c08758eb0006be = var_e0c08758eb0006be;
    remoteTank.vehiclename = "pac_sentry";
    remoteTank.var_1d52051e15c4b0c5 = 10;
    remoteTank.var_240dc8d5c31629d2 = 150;
    remoteTank.spinuptime = 1;
    remoteTank laseron();
    remoteTank function_d2e41c7603ba7697("p2p");
    remoteTank function_77320e794d35465a("p2p", "reverseGasNormal", 1.5);
    remoteTank function_77320e794d35465a("p2p", "steeringMultiplier", 20);
    remoteTank function_77320e794d35465a("p2p", "manualSpeed", 10);
    remoteTank function_77320e794d35465a("p2p", "reverseForBehindGoal", 1);
    remoteTank function_77320e794d35465a("p2p", "stuckTime", 4);
    remoteTank function_77320e794d35465a("p2p", "goalThreshold", 50);
    remoteTank namespace_5a51aa78ea0b1b9f::set_start_emp_callback(&empStarted);
    remoteTank namespace_5a51aa78ea0b1b9f::set_clear_emp_callback(&empCleared);
    remoteTank namespace_b6b4a3ac458ab6e2::function_172d848d58051fdf(&function_f149e9383f183cf0);
    remoteTank namespace_b6b4a3ac458ab6e2::function_aa823a31304ed981(&function_5c67fa91fe5b79);
    remoteTank.var_8ffa366ec68f0c8b = 3600;
    remoteTank namespace_6ca1587edcca0018::function_89445073f3e86e5c(remoteTank.vehiclename);
    function_45c8ebe59275b96e(remoteTank.vehiclename);
    playfxontag(getfx("vfx_dmz_Wheelson_flashlight"), remoteTank, "tag_flash");
    remoteTank.currentstate = 0;
    remoteTank vehicleshowonminimap(0);
    remoteTank.damagecallback = &namespace_adc82618e9ef9897::function_96b758d589365ef6;
    remoteTank.var_1329597b4278afe9 = [];
    remoteTank thread function_a51eaffdb54130b2(var_e0c08758eb0006be);
    remoteTank thread function_42bc36af24a342e();
    remoteTank thread function_93dccf3096384da0();
    remoteTank.damagestate = 0;
    namespace_f64231d5b7a2c3c4::vehicle_tracking_registerinstance(remoteTank, remoteTank.owner, remoteTank.owner.team);
    return remoteTank;
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 14, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e6e
// Size: 0x141
function function_168280faef14cbf8(inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, var_799f234362adb813, partname, eventid) {
    if (!isdefined(self.destroyed) || self.destroyed == 0) {
        if (isdefined(attacker) && (isplayer(attacker) || isplayer(attacker.owner))) {
            player = attacker;
            if (isplayer(attacker.owner)) {
                player = attacker.owner;
            }
            if (isplayer(attacker) && damage > 0 && (!isdefined(hitloc) || hitloc != "shield")) {
                attacker namespace_e072c8407b2a861c::updatedamagefeedback("standard", damage >= self.health);
            }
        }
        namespace_adc82618e9ef9897::function_96b758d589365ef6(inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, var_799f234362adb813, partname, eventid);
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 12, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8fb6
// Size: 0x1e4
function function_120b1e4e62e7695c(inflictor, attacker, damage, idflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, partname) {
    if (istrue(self.destroyed)) {
        return;
    } else {
        self.destroyed = 1;
    }
    self notify("death");
    self.health = 1;
    namespace_5a0f3ca265d3a4c8::vehicle_damage_setcandamage(0);
    namespace_5a51aa78ea0b1b9f::clear_emp(1);
    namespace_5a51aa78ea0b1b9f::allow_emp(0);
    namespace_d9c77dc2a6fe29c6::clearoob(self, 1);
    namespace_6ca1587edcca0018::function_6add0f629e59f222();
    self setscriptablepartstate("body_damage_heavy", "on", 0);
    self setscriptablepartstate("turret_damage", "on", 0);
    var_db78384599e4b42 = anglestoforward(self gettagangles("tag_flash"));
    self setturrettargetvec(var_db78384599e4b42 * 500 + (0, -800, 0));
    wait(0.3);
    self function_77320e794d35465a("p2p", "pause", 1);
    wait(1.2);
    self playsound("veh_ks_wheelson_explode");
    self setscriptablepartstate("explode", "on", 0);
    wait(0.35);
    self.health = 0;
    if (isdefined(attacker)) {
        var_75778a2941f7b2c0 = ter_op(isdefined(attacker.owner), attacker.owner, attacker);
        if (isplayer(var_75778a2941f7b2c0)) {
            var_7ec7671a1e0c788f = spawnstruct();
            var_7ec7671a1e0c788f.var_b421b1d42317ccb2 = 1;
            var_75778a2941f7b2c0 thread namespace_48a08c5037514e04::doScoreEvent(#"hash_2b5885666af24123", objweapon, undefined, undefined, self, undefined, undefined, 0, var_7ec7671a1e0c788f, 1);
        }
    }
    if (isdefined(self)) {
        namespace_f64231d5b7a2c3c4::_deletevehicle(self);
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x91a1
// Size: 0x1ba
function private function_76b01f56cccfc5ec(params) {
    /#
        if (!isdefined(params.var_9e6eb7678f5c7ff3)) {
            return;
        }
        while (1) {
            if (getdvarint(@"hash_8da2e3f75d2bf514", 0)) {
                for (i = 0; i < params.var_9e6eb7678f5c7ff3.path.size; i++) {
                    point = params.var_9e6eb7678f5c7ff3.path[i];
                    if (isdefined(params.var_9e6eb7678f5c7ff3.path[i + 1])) {
                        nextpoint = params.var_9e6eb7678f5c7ff3.path[i + 1];
                    }
                    point draw_ent_axis(point.origin, 0.5, 5);
                    if (isdefined(point) && isdefined(nextpoint)) {
                        line(point.origin, nextpoint.origin, (1, 0, 1), 1, 0, 0.5);
                        vec = vectornormalize(nextpoint.origin - point.origin);
                        midpoint = (nextpoint.origin + point.origin) / 2;
                        var_39fe0c8de290e4c7 = midpoint + -1 * vec * 64;
                        var_b12efc1bdc54eac2 = midpoint + vec * 64;
                        draw_arrow_time(var_39fe0c8de290e4c7, var_b12efc1bdc54eac2, (1, 0.5, 0.5), 0.5);
                    }
                }
            }
            wait(0.5);
        }
    #/
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9362
// Size: 0x79
function function_4b8b0afabc972cf8(maestro) {
    maestro endon("reinforcement_triggered");
    maestro endon("death");
    while (1) {
        player = self waittill("trigger");
        if (isplayer(player)) {
            maestro.ob.var_1144fa51d2a07ee4 = 1;
            maestro.ob.var_e6d6e2128152581a = 1;
            maestro notify("reinforcement_triggered");
        }
        wait(1);
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93e2
// Size: 0x6a
function function_a0c7cc505f1c5675(requestid, maestro, var_2648b8fc988ecd74) {
    if (isdefined(maestro) && isdefined(maestro.ob) && istrue(maestro.ob.var_1144fa51d2a07ee4)) {
        maestro.ob.var_1144fa51d2a07ee4 = 0;
        return 1;
    } else {
        return 0;
    }
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9453
// Size: 0x42
function function_20076ce5ca820299(requestid, maestro) {
    if (isdefined(maestro) && istrue(maestro.var_fbaf86a86d9b2dfa)) {
        function_df930eed75d4f74f(requestid, maestro.origin, 800);
        return 1;
    }
    return 0;
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x949d
// Size: 0x28
function function_6fe30a922ca26cb0(requestid, maestro) {
    if (!isdefined(maestro) || !isalive(maestro)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x94cd
// Size: 0x73
function function_cb3106863907299c(requestid, maestro, agent) {
    self endon("death");
    maestro endon("death");
    volume = level.ob.var_bfc5850d296d2ebe["Maestro"].goalvolume;
    self function_398d3434e12ab1d1(volume);
    self setgoalvolumeauto(volume);
    self.aggressivemode = 1;
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9547
// Size: 0x4b
function function_a2fef9d268c4b5c2(requestid, maestro, agent) {
    if (agent == maestro) {
        return;
    }
    agent.var_5323a94889eff1de = 1;
    agent.var_4ebe755e0a0a430e = 1;
    agent thread function_cb3106863907299c(requestid, agent, maestro);
}

// Namespace namespace_28488a8b5ddf6dbc/namespace_1f95f5cd850f6060
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9599
// Size: 0x25
function function_b983c2159ac7d649(note) {
    if (note == "linkDrone") {
        return;
    } else if (note == "unlinkDrone") {
        return;
    }
}

