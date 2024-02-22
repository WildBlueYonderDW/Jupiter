// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\common\vehicle.gsc;
#using script_77c18cdedec620b3;
#using scripts\common\system.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_610f57bddd265be2;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gametypes\br_armory_kiosk.gsc;
#using scripts\cp_mp\parachute.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\cp_mp\utility\train_utility.gsc;
#using script_5762ac2f22202ba2;
#using scripts\mp\utility\points.gsc;
#using script_58f20490049af6ac;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\gametypes\br_publicevents.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\mp\supers.gsc;

#namespace namespace_97366e61f00cc219;

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x89a
// Size: 0x1a
function private autoexec __init__system__() {
    system::register(#"hash_a13d72e5b443db7d", undefined, undefined, &post_main);
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bb
// Size: 0x2f
function post_main() {
    if (!getdvarint(@"hash_51d19a3b234da781", 1)) {
        return;
    }
    if (!namespace_36f464722d326bbe::isbrstylegametype()) {
        return;
    }
    function_ce60e2da53459a87();
    function_41b95bcf009214f();
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f1
// Size: 0x422
function function_ce60e2da53459a87() {
    namespace_2c2703f78fc59600::function_c592e91fc6604ad0();
    namespace_17c25f0877bfb620::scriptable_addusedcallback(&function_208501a7029ab500);
    level.var_ed2dca1658da90b2 = spawnstruct();
    level.var_ed2dca1658da90b2.drones = [];
    level.var_ed2dca1658da90b2.var_53385b6be5f6c52f = getdvarint(@"hash_6af9ea32f9fbbaa6", 200);
    level.var_ed2dca1658da90b2.var_406bfeebff3aa082 = getdvarint(@"hash_7d6d2cb2d139a844", 5);
    level.var_ed2dca1658da90b2.var_2c40e29836434cbe = 0;
    level.var_ed2dca1658da90b2.var_11f0849a2c7b79ca = getdvarint(@"hash_dc10f0e5e78347b4", 0) == 1;
    level.var_ed2dca1658da90b2.var_5b25e7620e424cb2 = [];
    level.var_ed2dca1658da90b2.var_ffe6c41436efb0b2 = getdvarint(@"hash_37c837989177c57c", 7);
    level.var_ed2dca1658da90b2.var_a03d33b617b44f0a = getdvarint(@"hash_83b158696cbcbcfd", 0) == 1;
    level.var_ed2dca1658da90b2.var_1e8af39fa33c422e = getdvarint(@"hash_cdfd65a23b480aa1", 1) == 1;
    level.var_ed2dca1658da90b2.var_23c27e34b377c901 = getdvarint(@"hash_b9d0bfe07133a6b8", 1) == 1;
    level.var_ed2dca1658da90b2.var_f298ad183edd53ef = getdvarint(@"hash_e0b32ad490e21930", 1) == 1;
    level.var_ed2dca1658da90b2.var_5944536d424aa063 = getdvarint(@"hash_b2198e7c0b5206a8", 1) == 1;
    level.var_ed2dca1658da90b2.var_338b4f24fc6601c = getdvarint(@"hash_4c8e6f955528e47e", 85);
    level.var_ed2dca1658da90b2.var_c95cc1e87110d92d = getdvarint(@"hash_afa742b5487ef5a3", -9000);
    level.var_ed2dca1658da90b2.var_1a01d5e71d5a4ce = getdvarint(@"hash_3ca0eef1458f68a4", 1300);
    level.var_ed2dca1658da90b2.var_aad8a9e2592cf1a5 = getdvarint(@"hash_5881e1a607c924db", 6700);
    level.var_ed2dca1658da90b2.var_8c3590379c7ab36f = getdvarint(@"hash_3e56c6bbb230d4cd", 4000);
    level.var_ed2dca1658da90b2.var_90aa3a29f5c33db3 = getdvarint(@"hash_af27e42ca35d8854", 200);
    level.var_ed2dca1658da90b2.explosionradius = getdvarint(@"hash_422387a5d7b1948e", 512);
    level.var_ed2dca1658da90b2.explosiondamage = getdvarint(@"hash_3b47b4edafa8e459", 40);
    level.var_ed2dca1658da90b2.var_3d4073df2f497525 = getdvarfloat(@"hash_2ec1c01324ea0e78", 9);
    level.var_ed2dca1658da90b2.var_e90f0fe1f275a8b6 = getdvarfloat(@"hash_1f22affc058a4f7d", 1574);
    level.var_ed2dca1658da90b2.var_aeeb98b4d36b65a6 = getdvarfloat(@"hash_742372c71d3e7554", 1574);
    level.var_ed2dca1658da90b2.var_1a19bd75a8860186 = getdvarint(@"hash_56748969528a88e7", 0) == 1;
    level.var_ed2dca1658da90b2.var_e134bc850cb28724 = getdvarint(@"hash_29fd03280bc10d14", 1) == 1;
    level.var_ed2dca1658da90b2.var_d455ff81de6949d = getdvarfloat(@"hash_792338b4d870020d", 80);
    level.var_4358d3a0ee13b0f9 = &function_590979ef771686a8;
    level.var_ae0244c4c517ba75 = &function_aa19007a48fca6c0;
    level.var_ff4bbeb786042d78 = &function_ff4bbeb786042d78;
    namespace_c5622898120e827f::function_eca79fa0f341ee08(15, &function_1e28980b8235671e, &function_b77546749eb0c127, &function_313d9044d8e6f53c, &function_ad1b6f540c35705d);
    level._effect["deployable_kiosk_explosion"] = loadfx("vfx/iw9/prop/scriptables/vfx_military_deployable_buystation.vfx");
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd1a
// Size: 0x4d
function function_41b95bcf009214f() {
    /#
        assert(isdefined(game["dialog"]));
    #/
    game["dialog"]["deploy_ready"] = "dplb_grav_redy";
    game["dialog"]["enemy_active"] = "dplb_grav_nmy1";
    game["dialog"]["friendly_active"] = "dplb_grav_frnd";
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd6e
// Size: 0xca
function function_208501a7029ab500(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!namespace_d3d40f75bb4e4c32::function_746c06c00cd6bdc5(instance.type)) {
        return;
    }
    if (!istrue(instance.entity.var_98aabca05601aa67)) {
        player playlocalsound("br_plunder_atm_cancel");
        player namespace_44abc05161e2e2cb::showerrormessage("MP_BR_INGAME/UNUSABLE_DEPLOYABLE_KIOSK");
        return;
    }
    if (!isdefined(instance.playersusing)) {
        instance.playersusing = [];
    }
    instance.playersusing[instance.playersusing.size] = player;
    instance.var_746c06c00cd6bdc5 = 1;
    player thread namespace_a4b43c1cf86c6fe5::_runpurchasemenu(instance);
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3f
// Size: 0x5e5
function function_590979ef771686a8(player, location, var_c6a143d018a52c3) {
    owner = undefined;
    ownerteam = undefined;
    if (isdefined(player)) {
        owner = player;
        ownerteam = player.team;
    }
    traceheight = namespace_5078ee98abb32db9::getc130height();
    var_52c23adaecc7756f = namespace_d3d40f75bb4e4c32::droptogroundmultitrace((location[0], location[1], traceheight));
    if (istrue(level.var_ed2dca1658da90b2.var_1a19bd75a8860186)) {
        var_4e4df9cada88ab11 = "[deployableKioskSpawned]" + ": " + function_53c4c53197386572(player.name, "-") + ", " + function_53c4c53197386572(player getxuid(), "-") + ", " + function_53c4c53197386572(player.team, "-") + ", " + function_53c4c53197386572(player.origin[0], string(0)) + ", " + function_53c4c53197386572(player.origin[1], string(0)) + ", " + function_53c4c53197386572(player.origin[2], string(0)) + ", " + function_53c4c53197386572(location[0], string(0)) + ", " + function_53c4c53197386572(location[1], string(0)) + ", " + function_53c4c53197386572(location[2], string(0)) + ", " + function_53c4c53197386572(var_52c23adaecc7756f[0], string(0)) + ", " + function_53c4c53197386572(var_52c23adaecc7756f[1], string(0)) + ", " + function_53c4c53197386572(var_52c23adaecc7756f[2], string(0));
        logstring(var_4e4df9cada88ab11);
    }
    var_e64fdae06df3b0aa = undefined;
    if (level.var_ed2dca1658da90b2.var_23c27e34b377c901) {
        var_e64fdae06df3b0aa = function_b8214cb8c9e75675(player, var_52c23adaecc7756f);
    }
    goto = spawnstruct();
    goto.origin = var_52c23adaecc7756f + (0, 0, level.var_ed2dca1658da90b2.var_1a01d5e71d5a4ce);
    if (isdefined(var_e64fdae06df3b0aa)) {
        goto.dir = var_e64fdae06df3b0aa;
    } else {
        goto.dir = function_767cea82b001f645(getclosestpointonnavmesh(var_52c23adaecc7756f) - goto.origin);
    }
    goto.angles = generateaxisanglesfromforwardvector(goto.dir, (0, 0, 1));
    var_f00fa6965d8d5dad = goto.dir * level.var_ed2dca1658da90b2.var_c95cc1e87110d92d + (0, 0, level.var_ed2dca1658da90b2.var_aad8a9e2592cf1a5);
    goto.exit = (var_f00fa6965d8d5dad[0] + goto.origin[0], var_f00fa6965d8d5dad[1] + goto.origin[1], var_f00fa6965d8d5dad[2]);
    drone = spawn("script_model", goto.exit);
    drone.goto = goto;
    drone setmodel("veh9_mil_air_drone_supply_sweep");
    drone.angles = (0, randomint(360), 0);
    drone.speed = 0;
    drone.health = level.var_ed2dca1658da90b2.var_53385b6be5f6c52f;
    drone.maxhealth = drone.health;
    drone.owner = owner;
    drone.team = ownerteam;
    if (isdefined(player)) {
        drone setcandamage(1);
    } else {
        drone setcandamage(0);
    }
    drone forcenetfieldhighlod(1);
    if (isdefined(player)) {
        namespace_3bbb5a98b932c46f::function_e00b77a9cb4d8322(drone);
        drone thread function_78966bc6b28da9b4();
    }
    drone thread function_88ad5bddafd52f6e(var_c6a143d018a52c3);
    if (!istrue(var_c6a143d018a52c3)) {
        level.var_ed2dca1658da90b2.drones[level.var_ed2dca1658da90b2.drones.size] = drone;
    }
    if (isdefined(player)) {
        teammates = level.teamdata[player.team]["alivePlayers"];
        if (teammates.size > 0) {
            foreach (p in teammates) {
                if (!isdefined(p)) {
                    continue;
                }
                p thread namespace_44abc05161e2e2cb::showsplash("br_deployable_kiosk_incoming", undefined, drone.owner);
            }
        }
    }
    drone.spawnorigin = drone.origin;
    drone.goalorigin = goto.origin;
    drone.var_dd4f599b9c56db3a = location[0];
    drone.var_dd4f5a9b9c56dd6d = location[1];
    drone.var_dd4f579b9c56d6d4 = location[2];
    var_a059cab9dfe3d005 = 0;
    if (isdefined(player)) {
        var_bbb0b7af9811acef = namespace_54d20dd0dd79277f::getteamdata(player.team, "alivePlayers");
        foreach (ent in var_bbb0b7af9811acef) {
            var_a059cab9dfe3d005 = var_a059cab9dfe3d005 + ent.plundercount;
        }
    }
    drone.var_6c90750b2bde4f94 = var_a059cab9dfe3d005;
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x142b
// Size: 0x405
function function_b8214cb8c9e75675(player, location) {
    spawnangles = (0, 0, 0);
    if (!isdefined(player)) {
        spawnangles = (0, randomfloatrange(0, 360), 0);
    } else {
        spawnangles = player.angles;
    }
    var_d77253c873d2b420 = anglestoforward(spawnangles);
    contents = namespace_2a184fc4902783dc::create_default_contents(1);
    trace = namespace_2a184fc4902783dc::ray_trace(location - var_d77253c873d2b420 * 30, location + var_d77253c873d2b420 * 1000, undefined, contents);
    var_6e7c70b904418daa = trace["position"] + trace["normal"] * 20;
    targetpos = location;
    var_359711dd322783ec = namespace_5078ee98abb32db9::getc130height();
    ownerforward = anglestoforward(spawnangles);
    var_3c5a1b26c6973c2a = anglestoright(spawnangles);
    var_f74f18c717b149e2 = [0:targetpos + (-1 * ownerforward - var_3c5a1b26c6973c2a) * 100, 1:targetpos + (var_3c5a1b26c6973c2a - ownerforward) * 100, 2:targetpos - ownerforward * 100, 3:targetpos + ownerforward * 100, 4:targetpos + var_3c5a1b26c6973c2a * 100, 5:targetpos - var_3c5a1b26c6973c2a * 100, 6:targetpos + (ownerforward + var_3c5a1b26c6973c2a) * 100, 7:targetpos + (ownerforward - var_3c5a1b26c6973c2a) * 100];
    var_d9323f93b3960e7c = vectornormalize(var_f74f18c717b149e2[2] - targetpos);
    var_e3b1338d5bd4399f = 0;
    var_601da10886b0da3d = 0;
    var_a9df94497d7dbdaf = 0;
    foreach (var_f9567f37db523f7a in var_f74f18c717b149e2) {
        var_7a7426e42e674e40 = vectornormalize(var_f9567f37db523f7a - targetpos);
        var_c45bbeb56df09b5d = targetpos * (1, 1, 0) + (0, 0, var_359711dd322783ec);
        var_32a961dac02545b0 = var_c45bbeb56df09b5d - var_7a7426e42e674e40 * 24000;
        var_19189fd85d8a2c19 = var_c45bbeb56df09b5d + var_7a7426e42e674e40 * 24000;
        traceresult = namespace_2a184fc4902783dc::ray_trace_passed(var_32a961dac02545b0, var_19189fd85d8a2c19, undefined, contents);
        if (!istrue(traceresult)) {
            continue;
        }
        /#
            if (istrue(var_a9df94497d7dbdaf)) {
                level thread namespace_f2ffc0540883e1ad::drawline(var_32a961dac02545b0, var_19189fd85d8a2c19, 30, (1, 1, 0));
            }
        #/
        var_48384e792726b96a = var_c45bbeb56df09b5d - var_7a7426e42e674e40 * int(8000);
        var_e313995ecad6abbc = [0:targetpos, 1:targetpos - var_7a7426e42e674e40 * 512, 2:targetpos - var_7a7426e42e674e40 * 256, 3:targetpos + var_7a7426e42e674e40 * 256, 4:targetpos + var_7a7426e42e674e40 * 512];
        var_f0c12707e0cbb8d9 = 0;
        foreach (var_27ac9f99fc2e7a9b in var_e313995ecad6abbc) {
            results = namespace_2a184fc4902783dc::ray_trace(var_48384e792726b96a, var_27ac9f99fc2e7a9b, undefined, contents);
            traceresult = results["fraction"] == 1;
            if (!istrue(traceresult)) {
                /#
                    if (istrue(var_a9df94497d7dbdaf)) {
                        line(var_48384e792726b96a, results["kiosk_drone_eng_swt"], (1, 1, 0), 1, 0, 500);
                        line(results["kiosk_drone_eng_swt"], var_27ac9f99fc2e7a9b, (1, 0, 0), 1, 0, 500);
                    }
                #/
            } else {
                var_f0c12707e0cbb8d9++;
                /#
                    if (istrue(var_a9df94497d7dbdaf)) {
                        line(var_48384e792726b96a, var_27ac9f99fc2e7a9b, (0, 1, 0), 1, 0, 500);
                    }
                #/
            }
        }
        if (var_f0c12707e0cbb8d9 > var_e3b1338d5bd4399f) {
            var_d9323f93b3960e7c = var_7a7426e42e674e40;
            var_e3b1338d5bd4399f = var_f0c12707e0cbb8d9;
            if (var_f0c12707e0cbb8d9 >= 3) {
                break;
            }
        }
    }
    return var_d9323f93b3960e7c;
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1838
// Size: 0x5b4
function function_88ad5bddafd52f6e(var_c6a143d018a52c3) {
    drone = self;
    level endon("game_ended");
    drone endon("entitydeleted");
    drone.var_1d3bf3b408da503f = 0;
    if (level.var_ed2dca1658da90b2.var_2c40e29836434cbe) {
        /#
            if (getdvarint(@"hash_d7987b5db214b981", 0)) {
                debug::debug_sphere(drone, 25, (1, 0, 0), undefined, "monitorAverageVelocityAndUpdate", "scriptable_redeploy_drone_explosion");
                debug::draw_angles(drone, undefined, 150, undefined, "monitorAverageVelocityAndUpdate", "scriptable_redeploy_drone_explosion");
            }
        #/
    }
    goto = spawnstruct();
    goto.origin = drone.goto.origin;
    goto.angles = drone.goto.angles;
    team = undefined;
    if (isdefined(drone.owner) && isdefined(drone.owner.team)) {
        team = drone.owner.team;
    }
    drone.buystation = spawn("script_model", drone.origin);
    drone.buystation setmodel("military_deployable_buystation");
    drone.buystation linkto(drone, "tag_origin", (0, 0, -75), (0, 0, 0));
    drone.buystation setcandamage(1);
    drone.buystation.maxhealth = 999999999;
    drone.buystation.health = 999999999;
    drone.buystation function_4e70ba4ebdc8dbe9(drone.owner, "ui_map_icon_buystation_drone", "ui_map_icon_buystation_drone_enemy");
    drone.buystation thread function_90fa8c1f0ea25d78();
    drone.buystation.team = team;
    drone.buystation.owner = drone.owner;
    drone.buystation.var_98aabca05601aa67 = 1;
    drone.buystation.var_c23ca3472233553d = 1;
    if (isdefined(drone.owner)) {
        drone playsoundtoplayer("kiosk_drone_eng_swt", drone.owner, drone);
    }
    drone.buystation.var_3ed07487789e6309 = drone;
    level.var_ed2dca1658da90b2.var_5b25e7620e424cb2[level.var_ed2dca1658da90b2.var_5b25e7620e424cb2.size] = drone.buystation;
    if (!istrue(var_c6a143d018a52c3)) {
        drone.buystation function_9e8c5e7b9d1572b7();
    }
    if (isdefined(drone.team)) {
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("friendly_active", drone.team, 1, 2, undefined);
        var_59c0e644f7951e0c = namespace_54d20dd0dd79277f::getteamdata(drone.team, "players");
        var_47d7ff10e782d70e = ((goto.origin[0] + drone.origin[0]) / 2, (goto.origin[1] + drone.origin[1]) / 2, (goto.origin[2] + drone.origin[2]) / 2);
        var_ec0171e2f69933c1 = namespace_d3d40f75bb4e4c32::droptogroundmultitrace(var_47d7ff10e782d70e);
        var_826839f2397f1e47 = namespace_d3d40f75bb4e4c32::droptogroundmultitrace(goto.origin);
        var_1f0e57a3271d5faf = namespace_7e17181d03156026::getplayersinradius(var_ec0171e2f69933c1, level.var_ed2dca1658da90b2.var_8c3590379c7ab36f, undefined, var_59c0e644f7951e0c);
        var_20dab4933911dadf = namespace_7e17181d03156026::getplayersinradius(var_826839f2397f1e47, level.var_ed2dca1658da90b2.var_8c3590379c7ab36f, undefined, var_59c0e644f7951e0c);
        var_b6cd0d44c9bc37e5 = array_combine(var_1f0e57a3271d5faf, var_20dab4933911dadf);
        if (isdefined(var_b6cd0d44c9bc37e5) || var_b6cd0d44c9bc37e5.length > 0) {
            foreach (player in var_b6cd0d44c9bc37e5) {
                level thread namespace_d3d40f75bb4e4c32::brleaderdialogplayer("enemy_active", player, 1, undefined, 2, undefined);
            }
        }
    }
    if (istrue(level.var_ed2dca1658da90b2.var_1a19bd75a8860186)) {
        var_4e4df9cada88ab11 = "[deployableKioskMovingSequence]" + ": " + function_53c4c53197386572(goto.origin[0], string(0)) + ", " + function_53c4c53197386572(goto.origin[1], string(0)) + ", " + function_53c4c53197386572(goto.origin[2], string(0));
        logstring(var_4e4df9cada88ab11);
    }
    function_dcf070d2485a90a4(goto, 0);
    drone thread function_4132402c7ec5947c();
    wait(3);
    goto.origin = drone.goto.exit;
    function_dcf070d2485a90a4(goto, 1);
    drone delete();
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1df3
// Size: 0x1bb
function function_4132402c7ec5947c(eattacker) {
    drone = self;
    drone.buystation unlink();
    drone.buystation.physicsactivated = 1;
    drone.buystation physicslaunchserver((0, 0, 0), (0, 0, 0));
    var_212a44a5393c3b34 = drone.buystation physics_getbodyid(0);
    physics_setbodycenterofmassnormal(var_212a44a5393c3b34, (0, 0, 1));
    drone.buystation.angles = (0, drone.buystation.angles[1], 0);
    drone.var_1d3bf3b408da503f = 1;
    drone.buystation function_42349f0ab9120240();
    drone.buystation thread function_c9064aca910696fa();
    drone.buystation playsound("br_deployable_kiosk_detach");
    drone thread function_3313d37dfd52a977();
    drone function_f0b074bef81e8c7b(eattacker);
    if (istrue(level.var_ed2dca1658da90b2.var_1a19bd75a8860186)) {
        var_4e4df9cada88ab11 = "[deployableKioskDrop]" + ": " + function_53c4c53197386572(drone.origin[0], string(0)) + ", " + function_53c4c53197386572(drone.origin[1], string(0)) + ", " + function_53c4c53197386572(drone.origin[2], string(0));
        logstring(var_4e4df9cada88ab11);
    }
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fb5
// Size: 0xa5
function function_dcf070d2485a90a4(goto, var_ceb89b7c7c66002a) {
    drone = self;
    drone.var_3b4fee20d214bd9b = undefined;
    drone.var_f44262daab1a384a = undefined;
    drone.speed = 0;
    drone thread function_6d9358d777958a1b(goto, var_ceb89b7c7c66002a);
    drone thread namespace_2c2703f78fc59600::function_53a07930f4fc0e08(goto);
    drone thread function_19375ce96b24aff();
    drone waittill("redeploy_drone_arrive");
    while (!isdefined(drone.var_3b4fee20d214bd9b) || !isdefined(drone.var_f44262daab1a384a)) {
        wait(1);
    }
    drone.var_3b4fee20d214bd9b = undefined;
    drone.var_f44262daab1a384a = undefined;
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2061
// Size: 0x3eb
function function_6d9358d777958a1b(var_daad7d20d7a17c02, var_ceb89b7c7c66002a) {
    level endon("game_ended");
    self endon("entitydeleted");
    self.v_destination = var_daad7d20d7a17c02.origin;
    var_f69a5288e749a523 = level.var_ed2dca1658da90b2.var_338b4f24fc6601c;
    var_f3da9daf22907093 = 15000;
    /#
        utility::function_2bf8ec790b5a10f8(@"hash_d7987b5db214b981", [0:&debug::debug_line, 1:self, 2:var_daad7d20d7a17c02.origin, 3:(1, 0, 0), 4:undefined, 5:"monitorAverageVelocityAndUpdate", 6:"<unknown string>"]);
    #/
    intervaltime = 0.05;
    if (var_ceb89b7c7c66002a) {
        self.speed = 0;
        while (self.speed < var_f69a5288e749a523) {
            self.speed = self.speed + 1;
            if (self.speed > var_f69a5288e749a523) {
                self.speed = var_f69a5288e749a523;
            }
            self moveto(self.origin + self.speed * vectornormalize(self.v_destination - self.origin), intervaltime, 0, 0);
            wait(intervaltime);
        }
    } else {
        self.speed = 180;
        while (self.speed > var_f69a5288e749a523) {
            self.speed = self.speed - 0.8;
            if (self.speed < var_f69a5288e749a523) {
                self.speed = var_f69a5288e749a523;
            }
            self moveto(self.origin + self.speed * vectornormalize(self.v_destination - self.origin), intervaltime, 0, 0);
            wait(intervaltime);
        }
    }
    intervaltime = 0.05;
    if (self.speed > level.var_fc4bb27a820f54dd.var_73e374ce21fb4fb5) {
        while (distancesquared(self.origin, self.v_destination) > squared(self.speed * 20 * 0.5)) {
            self moveto(self.origin + self.speed * vectornormalize(self.v_destination - self.origin), 0.052, 0, 0);
            wait(0.05);
        }
        self notify("redeploy_drone_arrive");
        while (distancesquared(self.origin, self.v_destination) > var_f3da9daf22907093) {
            self moveto(self.origin + (self.v_destination - self.origin) * 0.05 / 0.52, 0.05, 0, 0);
            self.speed = self.speed * 0.95;
            wait(0.05);
        }
    } else {
        while (distancesquared(self.origin, self.v_destination) > 500) {
            self moveto(self.origin + self.speed * vectornormalize(self.v_destination - self.origin), 0.05, 0, 0);
            wait(0.05);
        }
        self notify("redeploy_drone_arrive");
        while (distancesquared(self.origin, self.v_destination) > 0.01) {
            self moveto(self.origin + (self.v_destination - self.origin) * 0.1, 0.05, 0, 0);
            self.speed = self.speed * 0.9;
            wait(0.05);
        }
    }
    self.speed = 0;
    self.v_destination = undefined;
    self.var_3b4fee20d214bd9b = 1;
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2453
// Size: 0x24f
function function_3313d37dfd52a977() {
    drone = self;
    var_1257f2498cdcfea0 = drone.team;
    kiosk = drone.buystation;
    kiosk endon("death");
    level endon("game_ended");
    kiosk.var_325bf59fe5f05db3 = 0;
    if (level.var_ed2dca1658da90b2.var_1e8af39fa33c422e) {
        kiosk thread function_443c7f998e6d02eb();
    }
    var_ee011d69b16ff21d = level.var_ed2dca1658da90b2.var_3d4073df2f497525;
    var_f7989328effff2ed = 0.5;
    while (!kiosk.var_325bf59fe5f05db3 && var_ee011d69b16ff21d > 0) {
        contents = namespace_2a184fc4902783dc::create_default_contents(1);
        ignoreents = [0:kiosk];
        trace = namespace_2a184fc4902783dc::ray_trace(kiosk.origin, kiosk.origin - (0, 0, 100), ignoreents, contents);
        if (isdefined(trace["hittype"]) && trace["hittype"] != "hittype_none") {
            kiosk.var_325bf59fe5f05db3 = 1;
        }
        var_ee011d69b16ff21d = var_ee011d69b16ff21d - var_f7989328effff2ed;
        wait(var_f7989328effff2ed);
    }
    kiosk.var_325bf59fe5f05db3 = 1;
    if (isdefined(kiosk) && isdefined(var_1257f2498cdcfea0)) {
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("deploy_ready", var_1257f2498cdcfea0, 1, 2, undefined);
    }
    if (level.var_ed2dca1658da90b2.var_e134bc850cb28724) {
        kiosk monitoraveragevelocityandupdate();
        var_a679c918818fa808 = getlootscriptablearrayinradius(undefined, undefined, kiosk.origin, level.var_ed2dca1658da90b2.var_d455ff81de6949d);
        if (isdefined(var_a679c918818fa808)) {
            foreach (loot in var_a679c918818fa808) {
                if (!namespace_cb965d2f71fefddc::function_2ae5e94bd6518ab5(loot, 0)) {
                    continue;
                }
                if (loot getscriptableisreserved() && !isdefined(loot.brpickupscriptableid)) {
                    continue;
                }
                namespace_cb965d2f71fefddc::loothide(loot);
            }
        }
    }
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26a9
// Size: 0x13a
function monitoraveragevelocityandupdate() {
    kiosk = self;
    kiosk endon("death");
    level endon("game_ended");
    kiosk notify("monitorAverageVelocityAndUpdate");
    kiosk endon("monitorAverageVelocityAndUpdate");
    var_e8893003a2073456 = 0.1;
    var_d315a7ea0605287e = 8;
    kiosk thread namespace_6c578d6ef48f10ef::monitoraveragevelocities(var_e8893003a2073456, var_d315a7ea0605287e);
    var_717e0cfd076f91d = 0;
    var_4080d353839c6230 = 0;
    var_1684a0b0fb3502c6 = undefined;
    while (!istrue(self.physicssettled)) {
        var_7e41acfab43987ed = namespace_6c578d6ef48f10ef::getaveragelinearvelocity();
        var_4f4e6a033ea9ada4 = namespace_6c578d6ef48f10ef::getaverageangularvelocity();
        if (isdefined(var_7e41acfab43987ed) && isdefined(var_4f4e6a033ea9ada4)) {
            if (var_7e41acfab43987ed <= namespace_6c578d6ef48f10ef::function_3c4492046080faa9() && var_4f4e6a033ea9ada4 <= namespace_6c578d6ef48f10ef::function_f7e3f128296ac3b6()) {
                var_717e0cfd076f91d++;
                var_4080d353839c6230 = 0;
                if (var_717e0cfd076f91d == namespace_6c578d6ef48f10ef::function_d4833b6c916db9c6()) {
                    self.physicssettled = 1;
                    var_1684a0b0fb3502c6 = self.origin;
                }
            } else {
                if (isdefined(var_1684a0b0fb3502c6)) {
                    if (distancesquared(self.origin, var_1684a0b0fb3502c6) <= 2500) {
                        wait(var_e8893003a2073456);
                        continue;
                    }
                }
                var_4080d353839c6230++;
                var_717e0cfd076f91d = 0;
                if (var_4080d353839c6230 == 1) {
                    self.physicssettled = undefined;
                }
            }
            wait(var_e8893003a2073456);
        } else {
            waitframe();
        }
    }
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27ea
// Size: 0x4a
function function_19375ce96b24aff() {
    drone = self;
    level endon("game_ended");
    drone endon("entitydeleted");
    wait(1);
    drone setscriptablepartstate("redeploy_drone_relocation_sfx", "kiosk_drone_move_sfx");
    drone waittill("redeploy_drone_arrive");
    drone setscriptablepartstate("redeploy_drone_relocation_sfx", "kiosk_drone_idle_sfx");
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x283b
// Size: 0x1cd
function function_443c7f998e6d02eb() {
    kiosk = self;
    kiosk endon("death");
    level endon("game_ended");
    kiosk endon("monitorPlayerImpactEnd");
    kiosk physics_registerforcollisioncallback();
    var_e6de3e488795da29 = 0;
    var_7b497a1523996243 = [];
    var_dbbb663991d31286 = 0;
    while (1) {
        ent = impulse = normal = position = flag1 = flag0 = body1 = body0 = kiosk waittill("collision");
        if (level.var_ed2dca1658da90b2.var_f298ad183edd53ef) {
            kiosk checklinktotrain(ent);
        }
        if (level.var_ed2dca1658da90b2.var_5944536d424aa063 && ent isvehicle() && !array_contains(var_7b497a1523996243, ent) && !istrue(kiosk.var_325bf59fe5f05db3)) {
            ent dodamage(max(0, ent.health - 30), kiosk.origin, undefined, undefined, "MOD_EXPLOSIVE");
            var_7b497a1523996243[var_7b497a1523996243.size] = ent;
        }
        if (gettime() - var_e6de3e488795da29 >= level.var_ed2dca1658da90b2.var_90aa3a29f5c33db3) {
            var_e6de3e488795da29 = gettime();
            surface = physics_getsurfacetypefromflags(flag1);
            surfacetype = getsubstr(surface["name"], 9);
            if (surfacetype == "user_terrain1") {
                surfacetype = "user_terrain_1";
            }
            if (surfacetype == "user_terrain5") {
                surfacetype = "user_terrain_5";
            }
            kiosk function_a23aa2d6571bd5e4(position, normal, impulse, surfacetype);
        }
    }
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a0f
// Size: 0xa1
function checklinktotrain(ent) {
    kiosk = self;
    if (isdefined(ent) && isdefined(ent.script_noteworthy) && isstartstr(ent.script_noteworthy, "train_") && !isdefined(kiosk getlinkedparent())) {
        if (isdefined(kiosk.trainent)) {
            if (kiosk.trainent == ent) {
                return;
            } else {
                kiosk cancelchecklinktotrain();
            }
        }
        kiosk.trainent = ent;
        kiosk.traincylestolink = 4;
        kiosk thread checklinktotraininternal(ent);
    }
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ab7
// Size: 0x43
function cancelchecklinktotrain() {
    kiosk = self;
    kiosk notify("cancel_link_to_train");
    kiosk.trainent = undefined;
    kiosk.traintracerelpos = undefined;
    kiosk.traintracefails = undefined;
    kiosk.traintracesuccesses = undefined;
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b01
// Size: 0x23c
function checklinktotraininternal(ent) {
    kiosk = self;
    kiosk endon("death");
    kiosk endon("cancel_link_to_train");
    ent endon("death");
    var_98296bb53c7acf6e = 4;
    halfheight = 30;
    var_8f62152221c4541c = 200;
    var_1375dd9df5ebf6cd = 100;
    contents = namespace_2a184fc4902783dc::create_contents(0, 1, 0, 0, 0, 1, 1, 0, 0);
    ignorelist = [0:self];
    foreach (linkedent in self getlinkedchildren(1)) {
        ignorelist[ignorelist.size] = linkedent;
    }
    self.traintracefails = 0;
    self.traintracesuccesses = 0;
    while (self.traintracefails < 20) {
        caststart = self.origin + anglestoup(self.angles) * halfheight;
        castend = caststart + (0, 0, -1 * var_8f62152221c4541c);
        traceresult = namespace_2a184fc4902783dc::ray_trace(caststart, castend, ignorelist, contents);
        if (traceresult.size > 0 && isdefined(traceresult["entity"]) && namespace_9db09f982acd35b4::is_train_ent(traceresult["entity"])) {
            traintracerelpos = combineangles(invertangles(ent.angles), ent.origin - traceresult["position"]);
            if (!isdefined(self.traintracerelpos)) {
                goto LOC_00000219;
            }
            if (distancesquared(traintracerelpos, self.traintracerelpos) > var_1375dd9df5ebf6cd) {
                self.traintracefails++;
                self.traintracesuccesses = 0;
            } else {
                self.traintracesuccesses++;
                if (self.traintracesuccesses >= var_98296bb53c7acf6e) {
                    self linkto(ent);
                    thread function_d49b71f319f0c952();
                    break;
                }
            LOC_00000219:
            }
        LOC_00000219:
            self.traintracerelpos = traintracerelpos;
        } else {
            break;
        }
        wait(0.1);
    }
    thread cancelchecklinktotrain();
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d44
// Size: 0x4c
function function_d49b71f319f0c952() {
    kiosk = self;
    if (!istrue(kiosk.physicsactivated)) {
        return;
    }
    kiosk.physicsactivated = undefined;
    kiosk.physicssettled = undefined;
    kiosk physicsstopserver();
    kiosk namespace_6c578d6ef48f10ef::monitorplayerimpactend();
    kiosk cancelchecklinktotrain();
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d97
// Size: 0x52
function function_a23aa2d6571bd5e4(position, normal, impulse, surfacetype) {
    kiosk = self;
    if (surfacetype != "glass_pane") {
        var_64eb7ced98f907bd = "br_deployable_kiosk_impact_high";
        kiosk playsound(var_64eb7ced98f907bd);
    }
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2df0
// Size: 0xbc
function function_78966bc6b28da9b4() {
    drone = self;
    level endon("game_ended");
    drone endon("entitydeleted");
    drone endon("deployable_kiosk_drone_shot_down");
    while (1) {
        objweapon = dflags = partname = tagname = modelname = smeansofdeath = damagelocation = direction_vec = eattacker = idamage = drone waittill("damage");
        drone function_614262699fa8e2f2(idamage, eattacker, direction_vec, damagelocation, smeansofdeath, modelname, tagname, partname, dflags, objweapon);
    }
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2eb3
// Size: 0xee
function function_90fa8c1f0ea25d78() {
    kiosk = self;
    level endon("game_ended");
    kiosk endon("entitydeleted");
    kiosk endon("death");
    while (1) {
        objweapon = dflags = partname = tagname = modelname = smeansofdeath = damagelocation = direction_vec = eattacker = idamage = kiosk waittill("damage");
        if (isdefined(kiosk.var_3ed07487789e6309) && !istrue(kiosk.var_3ed07487789e6309.var_1d3bf3b408da503f)) {
            kiosk.var_3ed07487789e6309 function_614262699fa8e2f2(idamage, eattacker, direction_vec, damagelocation, smeansofdeath, modelname, tagname, partname, dflags, objweapon);
        }
    }
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fa8
// Size: 0x2a8
function function_614262699fa8e2f2(idamage, eattacker, direction_vec, damagelocation, smeansofdeath, modelname, tagname, partname, dflags, objweapon) {
    drone = self;
    if (isplayer(eattacker)) {
        eattacker namespace_e072c8407b2a861c::updatehitmarker("standard", drone.health == 0, 0, 1, "hitequip");
    } else if (isdefined(eattacker.owner) && isplayer(eattacker.owner)) {
        eattacker.owner namespace_e072c8407b2a861c::updatehitmarker("standard", drone.health == 0, 0, 1, "hitequip");
    }
    if (isdefined(eattacker.model) && eattacker.model == "veh8_mil_air_lbravo_mp_flyable" || eattacker.model == "veh8_mil_air_lbravo_mp_flyable_mg") {
        level thread namespace_2c2703f78fc59600::function_cf65fbc1c077fadb(eattacker, drone.origin);
    }
    if (isdefined(smeansofdeath) && smeansofdeath == "MOD_EXPLOSIVE_BULLET" || smeansofdeath == "MOD_GRENADE" || smeansofdeath == "MOD_GRENADE_SPLASH" || smeansofdeath == "MOD_PROJECTILE" || smeansofdeath == "MOD_PROJECTILE_SPLASH" || smeansofdeath == "MOD_EXPLOSIVE") {
        idamage = int(idamage * level.var_fc4bb27a820f54dd.var_4b2cdacf483dccc4);
    }
    if (isdefined(modelname) && modelname == "ks_airstrike_target_br_ch3") {
        idamage = level.var_fc4bb27a820f54dd.var_71ba1ddbe86cab15;
    }
    drone.health = drone.health - idamage;
    if (!isdefined(drone.var_dfdcc313086c8290)) {
        drone.var_dfdcc313086c8290 = 0;
    }
    drone.var_dfdcc313086c8290 = drone.var_dfdcc313086c8290 + 1;
    if (isdefined(objweapon) && isdefined(objweapon.basename) && objweapon.basename == "toma_proj_mp") {
        drone.health = 0;
    }
    if (drone.health <= 0) {
        drone thread function_aa19007a48fca6c0(eattacker);
        drone notify("deployable_kiosk_drone_shot_down");
        return;
    } else if (level.var_ed2dca1658da90b2.var_11f0849a2c7b79ca && isdefined(self.var_1d3bf3b408da503f) && !self.var_1d3bf3b408da503f) {
        drone thread function_495982203bfc8d29(eattacker);
    }
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3257
// Size: 0x177
function function_495982203bfc8d29(eattacker) {
    drone = self;
    var_54a8b2d622f1a1e0 = drone.maxhealth / 2;
    if (!isdefined(drone.var_3e9b7fbc105df68b)) {
        drone.var_3e9b7fbc105df68b = 3;
    }
    for (i = 2; i > 0; i--) {
        if (drone.health < var_54a8b2d622f1a1e0 * i) {
            if (drone.var_3e9b7fbc105df68b > i) {
                drone.var_3e9b7fbc105df68b = i;
                eattacker namespace_48a08c5037514e04::doscoreevent(#"hash_6141024a6fca1305");
                itemlist = [0:"brloot_plunder_cash_common_1", 1:"brloot_armor_plate"];
                var_55bedc0453a6c09b = randomint(100);
                dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
                var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, drone.var_43ffd30a35b0da72.origin - (0, 0, 200), drone.var_43ffd30a35b0da72.angles, drone, undefined, undefined, undefined, undefined, undefined, 12000);
                if (var_55bedc0453a6c09b < 70) {
                    item = namespace_cb965d2f71fefddc::spawnpickup(itemlist[0], var_cb4fad49263e20c4, undefined, 1, undefined, 0);
                } else {
                    item = namespace_cb965d2f71fefddc::spawnpickup(itemlist[1], var_cb4fad49263e20c4, undefined, 1, undefined, 0);
                }
                break;
            }
        }
    }
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33d5
// Size: 0x17d
function function_9e8c5e7b9d1572b7() {
    buystation = self;
    if (level.var_ed2dca1658da90b2.var_a03d33b617b44f0a) {
        foreach (var_fe9c88140bfaeef5 in level.var_ed2dca1658da90b2.var_5b25e7620e424cb2) {
            if (var_fe9c88140bfaeef5 == buystation) {
                continue;
            }
            if (!isdefined(buystation.team) || !isdefined(var_fe9c88140bfaeef5.team)) {
                continue;
            }
            if (buystation.team == var_fe9c88140bfaeef5.team) {
                var_fe9c88140bfaeef5 thread function_f5a81afeb40e65cd();
            }
        }
    }
    var_9b5871d1f2cb57e9 = 0;
    foreach (var_7551d41cb4f1b721 in level.var_ed2dca1658da90b2.var_5b25e7620e424cb2) {
        if (!isdefined(var_7551d41cb4f1b721)) {
            continue;
        }
        var_9b5871d1f2cb57e9++;
    }
    if (var_9b5871d1f2cb57e9 > level.var_ed2dca1658da90b2.var_ffe6c41436efb0b2) {
        var_f079a3ac63ff9964 = level.var_ed2dca1658da90b2.var_5b25e7620e424cb2[0];
        var_f079a3ac63ff9964 thread function_f5a81afeb40e65cd();
    }
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3559
// Size: 0x12d
function function_1e28980b8235671e(var_819edacdacb810e4, var_e86632d645c137d0, var_5d954f1724092f5a) {
    if (getdvarint(@"hash_271d21fb3081ae5f", 0) == 1) {
        return;
    }
    if (!isdefined(level.var_ed2dca1658da90b2.var_5b25e7620e424cb2)) {
        return;
    }
    var_52d59c928eb97c81 = var_e86632d645c137d0 + level.var_ed2dca1658da90b2.var_e90f0fe1f275a8b6;
    var_c434624ff361bba2 = var_52d59c928eb97c81 * var_52d59c928eb97c81;
    foreach (var_fe9c88140bfaeef5 in level.var_ed2dca1658da90b2.var_5b25e7620e424cb2) {
        var_e4e4ae4481958d2e = distance2dsquared(var_fe9c88140bfaeef5.origin, var_819edacdacb810e4) + level.var_ed2dca1658da90b2.var_e90f0fe1f275a8b6 > var_c434624ff361bba2;
        if (istrue(var_fe9c88140bfaeef5.var_98aabca05601aa67)) {
            if (var_e4e4ae4481958d2e) {
                var_fe9c88140bfaeef5 function_98913cb90ff3af87();
            }
        } else if (!var_e4e4ae4481958d2e) {
            function_313d9044d8e6f53c(var_fe9c88140bfaeef5);
        }
    }
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x368d
// Size: 0x118
function function_b77546749eb0c127(var_819edacdacb810e4, var_e86632d645c137d0, var_5d954f1724092f5a) {
    if (getdvarint(@"hash_271d21fb3081ae5f", 0) == 1) {
        return;
    }
    if (!isdefined(level.var_ed2dca1658da90b2.var_5b25e7620e424cb2)) {
        return;
    }
    var_31966dae052c3d71 = [];
    foreach (var_fe9c88140bfaeef5 in level.var_ed2dca1658da90b2.var_5b25e7620e424cb2) {
        var_e4e4ae4481958d2e = !namespace_bbc79db4c3949a5c::function_ee854fdd1e77efc4(var_fe9c88140bfaeef5.origin, level.var_ed2dca1658da90b2.var_aeeb98b4d36b65a6);
        if (istrue(var_fe9c88140bfaeef5.var_98aabca05601aa67)) {
            if (var_e4e4ae4481958d2e) {
                var_31966dae052c3d71[var_31966dae052c3d71.size] = var_fe9c88140bfaeef5;
                var_fe9c88140bfaeef5 function_98913cb90ff3af87();
            }
        } else if (!var_e4e4ae4481958d2e) {
            var_31966dae052c3d71 = array_remove(var_31966dae052c3d71, var_fe9c88140bfaeef5);
            function_313d9044d8e6f53c(var_fe9c88140bfaeef5);
        }
    }
    return var_31966dae052c3d71;
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x37ad
// Size: 0x2b
function function_7b0648952e816403(var_fe9c88140bfaeef5) {
    var_fe9c88140bfaeef5.var_98aabca05601aa67 = 1;
    var_fe9c88140bfaeef5 setscriptablepartstate("screen", "activated");
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37df
// Size: 0x89
function function_ad1b6f540c35705d() {
    if (!isdefined(level.var_ed2dca1658da90b2.var_5b25e7620e424cb2)) {
        return;
    }
    foreach (var_fe9c88140bfaeef5 in level.var_ed2dca1658da90b2.var_5b25e7620e424cb2) {
        if (isdefined(var_fe9c88140bfaeef5.var_98aabca05601aa67)) {
            var_fe9c88140bfaeef5 function_98913cb90ff3af87();
        }
    }
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x386f
// Size: 0x2b
function function_313d9044d8e6f53c(var_fe9c88140bfaeef5) {
    var_fe9c88140bfaeef5.var_98aabca05601aa67 = 1;
    var_fe9c88140bfaeef5 setscriptablepartstate("screen", "activated");
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38a1
// Size: 0xc8
function function_98913cb90ff3af87() {
    var_fe9c88140bfaeef5 = self;
    var_fe9c88140bfaeef5.var_98aabca05601aa67 = 0;
    var_fe9c88140bfaeef5 setscriptablepartstate("screen", "deactivated");
    foreach (p in level.players) {
        if (isdefined(p.br_kiosk) && isdefined(p.br_kiosk.entity) && p.br_kiosk.entity == var_fe9c88140bfaeef5) {
            p namespace_a4b43c1cf86c6fe5::_closepurchasemenuwithresponse(2);
        }
    }
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3970
// Size: 0xb2
function function_7440e01cdf6ad541() {
    player = self;
    var_961550ea13ebbf78 = 0;
    foreach (drone in level.var_ed2dca1658da90b2.drones) {
        if (!isdefined(drone)) {
            continue;
        }
        var_961550ea13ebbf78++;
    }
    if (var_961550ea13ebbf78 >= level.var_ed2dca1658da90b2.var_406bfeebff3aa082) {
        player playlocalsound("br_plunder_atm_cancel");
        player namespace_44abc05161e2e2cb::showerrormessage("MP_BR_INGAME/AIRSPACE_CROWDED_DEPLOYABLE_KIOSK");
        return 1;
    }
    return 0;
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a2a
// Size: 0x109
function function_f5a81afeb40e65cd() {
    buystation = self;
    level endon("game_ended");
    if (isdefined(buystation.var_3ed07487789e6309)) {
        if (!istrue(buystation.var_3ed07487789e6309.var_1d3bf3b408da503f)) {
            buystation.var_3ed07487789e6309 thread function_aa19007a48fca6c0();
        }
    }
    playfx(getfx("deployable_kiosk_explosion"), buystation.origin, anglestoforward(buystation.angles), anglestoup(buystation.angles));
    self playsound("br_deployable_kiosk_explode");
    wait(1.4);
    buystation function_42349f0ab9120240();
    level.var_ed2dca1658da90b2.var_5b25e7620e424cb2 = array_remove(level.var_ed2dca1658da90b2.var_5b25e7620e424cb2, buystation);
    buystation delete();
    level.var_ed2dca1658da90b2.var_5b25e7620e424cb2 = array_removeundefined(level.var_ed2dca1658da90b2.var_5b25e7620e424cb2);
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b3a
// Size: 0x15e
function function_aa19007a48fca6c0(eattacker) {
    drone = self;
    level endon("game_ended");
    level.var_ed2dca1658da90b2.drones = array_remove(level.var_ed2dca1658da90b2.drones, drone);
    level.var_ed2dca1658da90b2.drones = array_removeundefined(level.var_ed2dca1658da90b2.drones);
    if (!istrue(drone.var_1d3bf3b408da503f) && isdefined(drone.buystation)) {
        drone thread function_4132402c7ec5947c(eattacker);
    }
    if (isdefined(eattacker) && isdefined(drone.buystation) && isdefined(drone.buystation.owner)) {
        if (eattacker.team != drone.buystation.owner.team) {
            eattacker namespace_48a08c5037514e04::doscoreevent(#"hash_e87586ea44aa31d9");
        }
    }
    drone stopsounds();
    drone setscriptablepartstate("redeploy_drone_relocation_smoke_vfx", "enabled");
    drone physics_registerforcollisioncallback();
    drone thread namespace_2c2703f78fc59600::function_26aacbd66ab5c92();
    drone waittill("collision");
    drone function_1519cc09e0dbad0c();
    namespace_3bbb5a98b932c46f::function_1a33bd42949ccbda(drone);
    if (isdefined(drone)) {
        drone delete();
    }
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c9f
// Size: 0xd7
function function_1519cc09e0dbad0c() {
    drone = self;
    nearbyplayers = namespace_7e17181d03156026::getplayersinradius(drone.origin, level.var_ed2dca1658da90b2.explosionradius);
    foreach (player in nearbyplayers) {
        player dodamage(level.var_ed2dca1658da90b2.explosiondamage, drone.origin, player, player, "MOD_CRUSH");
    }
    vfx = spawnscriptable("scriptable_redeploy_drone_explosion", drone.origin);
    waitframe();
    vfx freescriptable();
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d7d
// Size: 0x331
function function_f0b074bef81e8c7b(eattacker) {
    drone = self;
    if (!isdefined(drone.owner)) {
        return;
    }
    eventparams = [];
    eventparams[eventparams.size] = "shots_taken";
    var_dfdcc313086c8290 = ter_op(isdefined(drone.var_dfdcc313086c8290), drone.var_dfdcc313086c8290, 0);
    eventparams[eventparams.size] = var_dfdcc313086c8290;
    eventparams[eventparams.size] = "shot_down";
    var_40b256cd5e9c4485 = ter_op(isdefined(eattacker), 1, 0);
    eventparams[eventparams.size] = var_40b256cd5e9c4485;
    eventparams[eventparams.size] = "shot_down_by_enemy";
    var_47d00efcfd046ccb = isdefined(eattacker);
    var_1e8ce7bafb66028c = ter_op(var_47d00efcfd046ccb && drone.owner.team != eattacker.team, 1, 0);
    eventparams[eventparams.size] = var_1e8ce7bafb66028c;
    eventparams[eventparams.size] = "percentage_distance_travelled";
    var_6303f40d469148e7 = distance2dsquared(drone.spawnorigin, drone.goalorigin);
    var_af992377583332fe = distance2dsquared(drone.spawnorigin, drone.origin);
    if (var_6303f40d469148e7 <= 0) {
        var_f21610e75d76df0b = 100;
    } else {
        var_f21610e75d76df0b = var_af992377583332fe / var_6303f40d469148e7 * 100;
    }
    eventparams[eventparams.size] = int(var_f21610e75d76df0b);
    eventparams[eventparams.size] = "weapon_shot_down";
    var_3565c47f3b387a0a = isdefined(eattacker) && isdefined(eattacker.currentweapon) && isdefined(eattacker.currentweapon.basename);
    var_f737d47e3c909ccd = "";
    if (var_3565c47f3b387a0a) {
        var_f737d47e3c909ccd = eattacker.currentweapon.basename;
    }
    eventparams[eventparams.size] = var_f737d47e3c909ccd;
    eventparams[eventparams.size] = "request_x";
    var_7db719e63a1f19e = ter_op(isdefined(drone.var_dd4f599b9c56db3a), drone.var_dd4f599b9c56db3a, -1);
    eventparams[eventparams.size] = var_7db719e63a1f19e;
    eventparams[eventparams.size] = "request_y";
    var_7db729e63a1f3d1 = ter_op(isdefined(drone.var_dd4f5a9b9c56dd6d), drone.var_dd4f5a9b9c56dd6d, -1);
    eventparams[eventparams.size] = var_7db729e63a1f3d1;
    eventparams[eventparams.size] = "request_z";
    var_7db6f9e63a1ed38 = ter_op(isdefined(drone.var_dd4f579b9c56d6d4), drone.var_dd4f579b9c56d6d4, -1);
    eventparams[eventparams.size] = var_7db6f9e63a1ed38;
    eventparams[eventparams.size] = "total_squad_cash";
    eventparams[eventparams.size] = drone.var_6c90750b2bde4f94;
    eventparams[eventparams.size] = "circle_index";
    circleindex = -1;
    if (isdefined(level.br_circle) && isdefined(level.br_circle.circleindex)) {
        circleindex = level.br_circle.circleindex;
    }
    eventparams[eventparams.size] = circleindex;
    drone.owner dlog_recordplayerevent("dlog_event_br_deployable_kiosk", eventparams);
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40b5
// Size: 0x1b4
function function_4e70ba4ebdc8dbe9(owner, friendlyicon, var_30f120a1efc1dcbe) {
    buystation = self;
    objid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
    objective_state(objid, "active");
    objective_position(objid, buystation.origin);
    objective_sethideelevation(objid, 1);
    objective_setplayintro(objid, 0);
    objective_onentity(objid, buystation);
    objective_setzoffset(objid, 50);
    objective_setshowdistance(objid, 0);
    objective_setshowoncompass(objid, 0);
    function_865f9c5d005f9a08(objid, 0);
    namespace_5a22b6f3a56f7e9b::update_objective_icon(objid, friendlyicon);
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objid, 5);
    namespace_5a22b6f3a56f7e9b::function_2946e9eb07acb3f1(objid, "EQUIPMENT/DEPLOYABLE_KIOSK_MARKER");
    if (isdefined(owner)) {
        namespace_5a22b6f3a56f7e9b::objective_teammask_addtomask(objid, owner.team);
    } else {
        namespace_5a22b6f3a56f7e9b::objective_playermask_showtoall(objid);
    }
    function_865f9c5d005f9a08(objid, 0);
    objective_sethideelevation(objid, 1);
    buystation.var_74dc8d9eedcd0d15 = objid;
    if (isdefined(owner)) {
        objid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
        objective_state(objid, "active");
        objective_position(objid, buystation.origin);
        objective_sethideelevation(objid, 1);
        objective_setplayintro(objid, 0);
        objective_onentity(objid, buystation);
        objective_setzoffset(objid, 50);
        objective_setshowdistance(objid, 0);
        objective_setshowoncompass(objid, 0);
        function_865f9c5d005f9a08(objid, 0);
        namespace_5a22b6f3a56f7e9b::update_objective_icon(objid, var_30f120a1efc1dcbe);
        namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objid, 5);
        namespace_5a22b6f3a56f7e9b::function_2946e9eb07acb3f1(objid, "EQUIPMENT/DEPLOYABLE_KIOSK_MARKER");
        namespace_5a22b6f3a56f7e9b::function_a28e8535e00d34f3(objid);
        namespace_5a22b6f3a56f7e9b::objective_teammask_removefrommask(objid, owner.team);
        function_865f9c5d005f9a08(objid, 0);
        objective_sethideelevation(objid, 1);
        buystation.enemyobjid = objid;
    }
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4270
// Size: 0xcc
function function_42349f0ab9120240() {
    buystation = self;
    if (!isdefined(buystation)) {
        return;
    }
    if (isdefined(buystation.objid)) {
        objective_hidefromplayersinmask(buystation.objid);
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(buystation.objid);
        buystation.objid = undefined;
    }
    if (isdefined(buystation.var_74dc8d9eedcd0d15)) {
        objective_hidefromplayersinmask(buystation.var_74dc8d9eedcd0d15);
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(buystation.var_74dc8d9eedcd0d15);
        buystation.var_74dc8d9eedcd0d15 = undefined;
    }
    if (isdefined(buystation.enemyobjid)) {
        objective_hidefromplayersinmask(buystation.enemyobjid);
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(buystation.enemyobjid);
        buystation.enemyobjid = undefined;
    }
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4343
// Size: 0x5b
function private function_4b8f0a33e19c0310() {
    buystation = self;
    if (!isdefined(buystation)) {
        return;
    }
    if (!isdefined(buystation.objid)) {
        return;
    }
    if (namespace_d76af9f804655767::ispubliceventoftypeactive(2)) {
        namespace_5a22b6f3a56f7e9b::update_objective_setbackground(buystation.objid, 11);
    } else {
        namespace_5a22b6f3a56f7e9b::update_objective_setbackground(buystation.objid, 5);
    }
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x43a5
// Size: 0x3f
function private function_c9064aca910696fa() {
    buystation = self;
    level endon("game_ended");
    buystation endon("death");
    while (1) {
        level waittill_any_2("public_event_firesale_start", "public_event_firesale_end");
        buystation function_4b8f0a33e19c0310();
    }
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43eb
// Size: 0xc7
function function_ff4bbeb786042d78(grenade) {
    player = self;
    player endon("disconnect");
    grenade endon("explode_end");
    grenade thread notifyafterframeend("death", "explode_end");
    player thread function_58d05fe18dd1c713(grenade);
    position = grenade waittill("explode");
    player notify("deployable_kiosk_drop_finished");
    thread function_1e270e9c7a27bb49(position);
    if (namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(position) || player function_7440e01cdf6ad541()) {
        if (isdefined(grenade)) {
            grenade delete();
        }
        if (isdefined(player.super)) {
            player namespace_85d036cb78063c4a::superusefinished(1);
        }
        return;
    }
    function_590979ef771686a8(player, position);
    if (isdefined(player.super)) {
        player namespace_85d036cb78063c4a::superusefinished(undefined, undefined, undefined, 1);
    }
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44b9
// Size: 0x48
function function_58d05fe18dd1c713(grenade) {
    player = self;
    player endon("disconnect");
    player endon("deployable_kiosk_drop_finished");
    grenade waittill("death");
    waitframe();
    if (isdefined(player.super)) {
        player namespace_85d036cb78063c4a::superusefinished(1);
    }
}

// Namespace namespace_97366e61f00cc219/namespace_118d21fe30d82c84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4508
// Size: 0x53
function function_1e270e9c7a27bb49(position) {
    var_ba3396e2b7597b2 = spawn("script_origin", position);
    var_ba3396e2b7597b2 playloopsound("smoke_carepackage_smoke_lp");
    wait(21);
    var_ba3396e2b7597b2 playsound("smoke_canister_tail_dissipate");
    var_ba3396e2b7597b2 stoploopsound("smoke_carepackage_smoke_lp");
    wait(5);
    var_ba3396e2b7597b2 delete();
}

