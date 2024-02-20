// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_247745a526421ba7;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\usability.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using script_5762ac2f22202ba2;
#using scripts\cp_mp\utility\train_utility.gsc;
#using script_1ed1214969b5eba7;
#using scripts\mp\utility\join_team_aggregator.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using script_736dec95a49487a6;
#using script_5f903436642211af;
#using scripts\cp_mp\challenges.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\cp_mp\ent_manager.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\damage.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\analyticslog.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\spectating.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\class.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\mp\equipment\tac_insert.gsc;

#namespace namespace_97cd0e84a74e2089;

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d0
// Size: 0x2b
function tacinsert_init() {
    level.tacinserts = [];
    namespace_1309ce202b9aa92b::registeronplayerjointeamcallback(&tacinsert_onjoinedteam);
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        level thread tacinsert_deleteontoofar();
    }
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x802
// Size: 0x6b
function tacinsert_onjoinedteam(player) {
    foreach (tacinsert in level.tacinserts) {
        tacinsert tacinsert_updatepickupusability(player);
        tacinsert tacinsert_updatedestroyusability(player);
    }
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x874
// Size: 0x142
function tacinsert_deleteontoofar() {
    level endon("game_ended");
    bundle = supers::function_bf9c7e9dd30180e3("super_tac_insert");
    while (1) {
        tacinserts = level.tacinserts;
        checks = 0;
        foreach (tacinsert in tacinserts) {
            if (!isdefined(tacinsert)) {
                continue;
            }
            if (istrue(tacinsert.isdestroyed)) {
                continue;
            }
            if (!isdefined(tacinsert.owner)) {
                continue;
            }
            distsq = distance2dsquared(tacinsert.origin, tacinsert.owner.origin);
            var_7484b6defeda6fce = bundle.var_99760dae8f3dda04 * bundle.var_99760dae8f3dda04;
            if (distsq >= var_7484b6defeda6fce) {
                tacinsert.owner thread namespace_44abc05161e2e2cb::showsplash("tac_insert_fail_br_too_far");
                tacinsert tacinsert_destroy(0);
            }
            checks++;
            if (checks >= 5) {
                checks = 0;
                waitframe();
            }
        }
        waitframe();
    }
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9bd
// Size: 0x24
function tacinsert_set(equipmentref, slot, variantid) {
    thread tacinsert_monitorupdatespawnposition();
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e8
// Size: 0x1c
function tacinsert_unset(equipmentref, slot) {
    self notify("end_monitorTIUse");
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa0b
// Size: 0x87
function tacinsert_monitorupdatespawnposition() {
    self endon("disconnect");
    level endon("game_ended");
    self endon("end_monitorTIUse");
    self.tispawnposition = [];
    while (1) {
        tacinsert_updatespawnposition();
        currentweapon = self getheldoffhand();
        var_c5aeb8763ac1e868 = currentweapon.basename == "flare_mp";
        var_46bf0299656795d3 = ter_op(var_c5aeb8763ac1e868, 0.05, 1);
        waittill_any_timeout_1(var_46bf0299656795d3, "offhand_pullback");
    }
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa99
// Size: 0x41
function function_48444bc9e4a578ff(player) {
    player endon("disconnect");
    level endon("game_ended");
    player endon("end_monitorTIUse");
    player endon("end_movingUpdate");
    while (1) {
        wait(1);
        player function_3ad5d3768653f711(self, 1);
    }
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae1
// Size: 0x36
function tacinsert_updatespawnposition() {
    spawnpos = self.origin;
    result = tacinsert_isvalidspawnposition(spawnpos);
    if (istrue(result)) {
        tacinsert_cachespawnposition(spawnpos);
    }
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb1e
// Size: 0x33
function function_801a0264d93b7be6(spawnpos) {
    var_cc089176a2d8ab71 = spawnpos + (0, 0, 3);
    if (!canspawn(var_cc089176a2d8ab71)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb59
// Size: 0x6b
function tacinsert_isvalidspawnposition(spawnpos, var_38dc095fcfb3c9c3) {
    if (!function_801a0264d93b7be6(spawnpos)) {
        return 0;
    }
    if (!isalive(self)) {
        return 1;
    }
    if (namespace_d9c77dc2a6fe29c6::istouchingoobtrigger()) {
        return 0;
    }
    if (!self isonground() && !self isswimming()) {
        return 0;
    }
    if (!istrue(var_38dc095fcfb3c9c3)) {
        waitframe();
    }
    if (!self isonground() && !self isswimming()) {
        return 0;
    }
    return 1;
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbcc
// Size: 0x52
function tacinsert_cachespawnposition(newposition) {
    if (isdefined(self.tispawnposition[0]) && self.tispawnposition[0] == newposition) {
        return;
    }
    self.tispawnposition[1] = self.tispawnposition[0];
    self.tispawnposition[0] = newposition;
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc25
// Size: 0x4c
function tacinsert_getspawnposition() {
    if (isdefined(self.tispawnposition)) {
        if (isdefined(self.tispawnposition[1])) {
            return self.tispawnposition[1];
        } else if (isdefined(self.tispawnposition[0])) {
            return self.tispawnposition[0];
        }
    }
    return undefined;
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc79
// Size: 0xa
function deletetacinsert() {
    tacinsert_destroy();
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc8a
// Size: 0x2a
function tacinsert_used(grenade) {
    result = function_98aeda580a749be4(grenade);
    if (!istrue(result)) {
        grenade delete();
    }
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcbb
// Size: 0x3c4
function function_98aeda580a749be4(grenade) {
    grenade setscriptablepartstate("visibility", "hide", 0);
    tacinsert_updatespawnposition();
    spawnposition = tacinsert_getspawnposition();
    if (!isdefined(spawnposition)) {
        namespace_44abc05161e2e2cb::showerrormessage("MP/TAC_INSERT_CANNOT_PLACE");
        thread function_3fd179c2e0859395();
        return 0;
    }
    var_66992a25e9654ed8 = distancesquared(self.origin, spawnposition);
    if (var_66992a25e9654ed8 >= 65536) {
        namespace_44abc05161e2e2cb::showerrormessage("MP/TAC_INSERT_CANNOT_PLACE");
        thread function_3fd179c2e0859395();
        return 0;
    }
    if (touchingbadtrigger()) {
        namespace_44abc05161e2e2cb::showerrormessage("MP/TAC_INSERT_CANNOT_PLACE");
        thread function_3fd179c2e0859395();
        return 0;
    }
    startpos = spawnposition + (0, 0, 16);
    endpos = spawnposition + (0, 0, -16);
    if (!function_6aa9474826722600(grenade, startpos, endpos)) {
        namespace_44abc05161e2e2cb::showerrormessage("MP/TAC_INSERT_CANNOT_PLACE");
        thread function_3fd179c2e0859395();
        return 0;
    }
    if (isdefined(level.var_ca4e08767cbdae12)) {
        var_425925a45729deae = grenade [[ level.var_ca4e08767cbdae12 ]]();
        if (!var_425925a45729deae) {
            namespace_44abc05161e2e2cb::showerrormessage("MP/TAC_INSERT_CANNOT_PLACE");
            thread function_3fd179c2e0859395();
            return 0;
        }
    }
    if (isdefined(level.var_f91a05bc873bd121)) {
        if (!self [[ level.var_f91a05bc873bd121 ]](spawnposition)) {
            namespace_44abc05161e2e2cb::showerrormessage("MP/TAC_INSERT_CANNOT_PLACE");
            thread function_3fd179c2e0859395();
            return 0;
        }
    }
    spawnpoint_clearspawnpoint(0, 0, 1);
    isplayerunderwater = self function_6f55d55ccff20d14();
    isplayerswimming = self isswimming();
    tacinsert = undefined;
    if (isplayerunderwater) {
        tacinsert = function_f480e30874e3b591(grenade, startpos, endpos);
    } else {
        tacinsert = function_1f15609989e6bf6f(grenade, startpos, endpos, isplayerswimming);
    }
    if (!isdefined(tacinsert)) {
        namespace_44abc05161e2e2cb::showerrormessage("MP/TAC_INSERT_CANNOT_PLACE");
        thread function_3fd179c2e0859395();
        return 0;
    }
    thread function_176bfee86c8e71cc(tacinsert);
    tacinsert setscriptablepartstate("visibility", "show", 0);
    function_69248052b7181e1a(tacinsert);
    tacinsert namespace_6d9917c3dc05dbe9::registersentient("Tactical_Static", self);
    level thread namespace_25c5a6f43bb97b43::trysaylocalsound(self, #"hash_c85d1a0cde245e18");
    namespace_3bbb5a98b932c46f::onequipmentplanted(tacinsert, "equip_tac_insert", &tacinsert_destroy);
    var_93494d8d17d67d84 = getgametype() == "siege";
    thread namespace_3bbb5a98b932c46f::monitordisownedequipment(self, tacinsert, var_93494d8d17d67d84);
    tacinsert namespace_5a51aa78ea0b1b9f::set_apply_emp_callback(&tacinsert_empapplied);
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        tacinsert [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&tacinsert_empapplied);
    }
    tacinsert namespace_b6b4a3ac458ab6e2::function_172d848d58051fdf(&tacinsert_empapplied);
    tacinsert function_49197cd063a740ea(&tacinsert_destroy);
    if (isdefined(level.elevators)) {
        foreach (elevators in level.elevators) {
            elevators thread namespace_272931699e2fe8e9::function_5c07037726ae5001(tacinsert);
        }
    }
    var_90ae7709c6cc1672 = self isswimming();
    spawnpoint_setspawnpoint(spawnposition, self.angles, tacinsert, 1, var_90ae7709c6cc1672);
    thread function_b2e205b73c40f44f(grenade);
    entnum = tacinsert getentitynumber();
    level.tacinserts[entnum] = tacinsert;
    if (isdefined(level.tacinsert_gamemode_callback)) {
        self [[ level.tacinsert_gamemode_callback ]]();
    }
    namespace_aad14af462a74d08::function_d997435895422ecc("super_tac_insert", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
    return 1;
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1087
// Size: 0x36
function function_176bfee86c8e71cc(tacinsert) {
    tacinsert endon("tacInsert_destroyed");
    waittill_any_3("disconnect", "joined_team", "joined_spectators");
    tacinsert tacinsert_destroy(0, 1, 1);
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c4
// Size: 0x1d0
function function_f480e30874e3b591(grenade, startpos, endpos) {
    ignoreents = [0:self, 1:grenade];
    var_741196a281686ee = namespace_2a184fc4902783dc::create_contents(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
    var_2171f3a7d917e8f9 = self.origin + (0, 0, 3000);
    var_8b797cfd0b9eaa2 = self.origin;
    var_da869fb61136a01a = namespace_2a184fc4902783dc::ray_trace(var_2171f3a7d917e8f9, var_8b797cfd0b9eaa2, ignoreents, var_741196a281686ee, 0);
    /#
        assertex(var_da869fb61136a01a["hittype"] != "hittype_none", "tac_insert: Script expected player to be inside a water volume");
    #/
    var_ce551e860b6694b3 = var_da869fb61136a01a["position"];
    var_eff356a39f0afed3 = self.origin;
    var_a05d36260445f404 = physics_createcontents([0:"physicscontents_itemclip", 1:"physicscontents_item"]);
    var_f6b508749cbf85c4 = namespace_2a184fc4902783dc::ray_trace(var_eff356a39f0afed3, var_ce551e860b6694b3, ignoreents, var_a05d36260445f404, 1);
    if (var_f6b508749cbf85c4["hittype"] != "hittype_none") {
        return;
    }
    if (!canspawn(var_ce551e860b6694b3, self)) {
        return;
    }
    var_19d271ce56d26a0 = self.origin;
    var_f2674c33fe0cece = self.angles;
    bundle = supers::function_bf9c7e9dd30180e3("super_tac_insert");
    grenade.angles = var_f2674c33fe0cece;
    tacinsert = namespace_68e641469fde3fa7::_launchgrenade("flare_mp", var_19d271ce56d26a0, (0, 0, 0), undefined, 1, grenade);
    tacinsert.angles = var_f2674c33fe0cece;
    tacinsert thread function_48444bc9e4a578ff(self);
    thread function_c21a6baeeb5139be(tacinsert);
    return tacinsert;
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x129c
// Size: 0xd6
function function_69248052b7181e1a(tacinsert) {
    tacinsert.team = self.team;
    tacinsert.owner = self;
    tacinsert namespace_2a9588dfac284b77::registerspawn(3, &deletetacinsert);
    tacinsert setscriptablepartstate("smoke", "active", 0);
    tacinsert.issuper = isdefined(self.super) && self.super.staticdata.ref == "super_tac_insert";
    tacinsert.superid = level.superglobals.staticsuperdata["super_tac_insert"].id;
    tacinsert thread tacinsert_setupandwaitfordeath(self);
    tacinsert thread tacinsert_destroyongameended();
    tacinsert setotherent(self);
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1379
// Size: 0x1d5
function function_1f15609989e6bf6f(grenade, startpos, endpos, var_5a413baccf7593f7) {
    ignoreents = [0:self, 1:grenade];
    contentoverride = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 0, 1, 0);
    traceresult = namespace_2a184fc4902783dc::ray_trace_detail(startpos, endpos, ignoreents, contentoverride, 0);
    if (traceresult["hittype"] == "hittype_none") {
        waitframe();
        radius = 14;
        traceresult = namespace_2a184fc4902783dc::sphere_trace(startpos, endpos, radius, ignoreents, contentoverride, 0);
    }
    if (traceresult["hittype"] == "hittype_none") {
        return undefined;
    }
    normal = traceresult["normal"];
    var_19d271ce56d26a0 = traceresult["position"] + normal * (0, 0, 0.5);
    spawnposition = tacinsert_getspawnposition();
    distancesq = distancesquared(spawnposition, var_19d271ce56d26a0);
    if (distancesq > 196) {
        return undefined;
    }
    bundle = supers::function_bf9c7e9dd30180e3("super_tac_insert");
    tacinsert = namespace_68e641469fde3fa7::_launchgrenade(bundle.offhandweapon, var_19d271ce56d26a0, (0, 0, 0), undefined, 1, grenade);
    tacinsert.angles = self.angles;
    if (istrue(var_5a413baccf7593f7)) {
        thread function_c21a6baeeb5139be(grenade);
    }
    var_87993e713735a8f8 = traceresult["entity"];
    if (isdefined(var_87993e713735a8f8) && namespace_9abe40d2af041eb2::function_3c5c5d86ef14420e(var_87993e713735a8f8)) {
        tacinsert linkto(var_87993e713735a8f8);
        var_c4c31894d4002f8a = getdvarint(@"hash_956f65ae92f862e", 1);
        if (var_c4c31894d4002f8a) {
            tacinsert thread function_48444bc9e4a578ff(self);
        }
    }
    return tacinsert;
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1556
// Size: 0x12b
function function_b2e205b73c40f44f(var_6441771c72e49747) {
    var_6441771c72e49747 endon("missile_water_impact");
    level endon("game_ended");
    timer = 0;
    var_b609aa1dfba252da = 0;
    while (1) {
        msg = var_6441771c72e49747 waittill_notify_or_timeout_return("missile_stuck", 0.25);
        if (msg == "missile_stuck") {
            break;
        } else {
            if (timer >= 2) {
                break;
            }
            spawnpoint = self.setspawnpoint;
            if (!isdefined(spawnpoint)) {
                var_b609aa1dfba252da = 1;
            } else {
                level thread draw_angles(var_6441771c72e49747.angles, var_6441771c72e49747.origin, (1, 0, 0), 1000, 100);
                distancesq = distancesquared(var_6441771c72e49747.origin, spawnpoint.playerspawnpos);
                if (distancesq > 196) {
                    var_b609aa1dfba252da = 1;
                }
            }
            if (var_b609aa1dfba252da) {
                break;
            }
            timer = timer + 0.25;
        }
    }
    if (var_b609aa1dfba252da) {
        namespace_44abc05161e2e2cb::showerrormessage("MP/TAC_INSERT_CANNOT_PLACE");
        var_6441771c72e49747 tacinsert_destroy(0, 0, 1);
        function_3fd179c2e0859395();
    }
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1688
// Size: 0x3b
function function_c21a6baeeb5139be(grenade) {
    self endon("disconnect");
    grenade endon("death");
    level endon("game_ended");
    grenade waittill("missile_stuck");
    grenade setscriptablepartstate("splash", "splash", 0);
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ca
// Size: 0x33
function tacinsert_setupandwaitfordeath(owner) {
    thread tacinsert_damagelistener(owner);
    thread tacinsert_destroyuselistener(owner);
    if (!self.issuper) {
        thread tacinsert_pickuplistener(owner);
    }
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1704
// Size: 0x45
function tacinsert_damagelistener(owner) {
    bundle = supers::function_bf9c7e9dd30180e3("super_tac_insert");
    namespace_3e725f3cc58bddd3::monitordamage(bundle.maxhealth, "hitequip", &tacinsert_handledeathdamage, &tacinsert_modifydamage, 1);
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1750
// Size: 0x4b
function tacinsert_modifydamage(data) {
    objweapon = data.objweapon;
    type = data.meansofdeath;
    return utility::handlemeleedamage(objweapon, type, data.damage);
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17a3
// Size: 0x9d
function tacinsert_handledeathdamage(data) {
    attacker = data.attacker;
    self notify("enemy_destroyed_equipment", attacker);
    if (!isdefined(self.owner) || istrue(namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker))) {
        self.owner thread namespace_944ddf7b8df1b0e3::leaderdialogonplayer("ti_destroyed", undefined, undefined, self.origin);
        attacker thread namespace_25c5a6f43bb97b43::onFieldUpgradeDestroy(#"hash_102234d643c5dbce");
        attacker thread namespace_48a08c5037514e04::doScoreEvent(#"destroyed_equipment");
    }
    thread tacinsert_destroy(1);
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1847
// Size: 0x118
function tacinsert_pickuplistener(owner) {
    self endon("death");
    level endon("game_ended");
    owner endon("disconnect");
    self.pickuptrigger = spawn("script_origin", self.origin);
    self.pickuptrigger makeusable();
    self.pickuptrigger setcursorhint("HINT_NOICON");
    self.pickuptrigger sethintstring("MP_PATCH/PICKUP_TI");
    self.pickuptrigger linkto(self);
    foreach (player in level.players) {
        tacinsert_updatepickupusability(player);
    }
    for (;;) {
        player = self.pickuptrigger waittill("trigger");
        player playsound("iw9_tactical_insert_flare_pu");
        player namespace_1a507865f681850e::giveequipment("equip_tac_insert", "secondary");
        thread tacinsert_destroy(0, 0, 1);
    }
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1966
// Size: 0x80
function tacinsert_updatepickupusability(player) {
    if (!isdefined(player)) {
        return;
    }
    if (!isdefined(self) || !isdefined(self.pickuptrigger)) {
        return;
    }
    if (istrue(self.isdestroyed)) {
        return;
    }
    isowner = isdefined(self.owner) && player == self.owner;
    if (isowner) {
        self.pickuptrigger enableplayeruse(player);
    } else {
        self.pickuptrigger disableplayeruse(player);
    }
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19ed
// Size: 0x1eb
function tacinsert_destroy(var_4fac8b8ce36e09f1, var_809a2ecf919c757a, var_91e5860de38e0ea6) {
    if (!isdefined(self) || istrue(self.isdestroyed)) {
        return;
    }
    self.isdestroyed = 1;
    self.var_15db4b9b5e7debec = undefined;
    self.var_eaea86358d19ed20 = undefined;
    if (isdefined(self.owner)) {
        if (istrue(var_809a2ecf919c757a)) {
            thread tacinsert_brrespawnsplash();
            self.owner namespace_3c5a4254f2b957ea::incpersstat("tacticalInsertionSpawns", 1);
            self.owner namespace_85d036cb78063c4a::combatrecordsupermisc("super_tac_insert");
            self.owner namespace_aad14af462a74d08::function_d997435895422ecc("super_tac_insert", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"hit"));
            namespace_bd0162aedd8c8594::logevent_fieldupgradeexpired(self.owner, self.superid, 1, istrue(var_4fac8b8ce36e09f1));
        } else {
            namespace_bd0162aedd8c8594::logevent_fieldupgradeexpired(self.owner, self.superid, 0, istrue(var_4fac8b8ce36e09f1));
        }
        if (!istrue(var_809a2ecf919c757a) && !istrue(var_91e5860de38e0ea6)) {
            self.owner thread tacinsert_tacinsertdestroyedfeedback();
        }
        self.owner.setspawnpoint = undefined;
    }
    self makeunusable();
    if (isdefined(self.pickuptrigger)) {
        self.pickuptrigger delete();
    }
    self notify("death");
    if (isdefined(self.owner)) {
        self.owner notify("tacInsert_destroyed");
    }
    if (!istrue(self.skipscriptable)) {
        self setscriptablepartstate("smoke", "neutral", 0);
    }
    if (istrue(var_4fac8b8ce36e09f1) && isdefined(self getscriptablepartstate("destroy", 1)) && isdefined(self getscriptablepartstate("visibility", 1))) {
        self setscriptablepartstate("destroy", "active", 0);
        self setscriptablepartstate("visibility", "hide", 0);
    }
    thread tacinsert_delayeddelete();
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bdf
// Size: 0x50
function tacinsert_tacinsertdestroyedfeedback() {
    level endon("game_ended");
    self endon("disconnect");
    var_975ca91cf49e21c8 = 0;
    while (!isreallyalive(self) || isinkillcam()) {
        var_975ca91cf49e21c8 = 1;
        waitframe();
    }
    if (var_975ca91cf49e21c8) {
        wait(0.3);
    }
    hudicontype("tacinsert_destroyed");
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c36
// Size: 0x43
function tacinsert_brrespawnsplash() {
    if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
        return;
    }
    owner = self.owner;
    level endon("game_ended");
    owner endon("death_or_disconnect");
    wait(1.5);
    owner thread namespace_44abc05161e2e2cb::showsplash("tac_insert_success_br");
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c80
// Size: 0x1e
function tacinsert_destroyongameended() {
    self endon("death");
    level waittill("game_ended");
    thread tacinsert_destroy(0, 0, 1);
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ca5
// Size: 0x14
function tacinsert_delayeddelete() {
    wait(1);
    namespace_2a9588dfac284b77::deregisterspawn();
    self delete();
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cc0
// Size: 0xce
function tacinsert_destroyuselistener(owner) {
    self endon("death");
    level endon("game_ended");
    owner endon("disconnect");
    self makeusable();
    self enablemissilehint(1);
    self setcursorhint("HINT_NOICON");
    self sethintstring("MP_PATCH/DESTROY_TI");
    foreach (player in level.players) {
        tacinsert_updatedestroyusability(player);
    }
    for (;;) {
        player = self waittill("trigger");
        player notify("destroyed_insertion", owner);
        player notify("destroyed_equipment");
        tacinsert_givepointsfordeath(player);
        thread tacinsert_destroy(1);
    }
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d95
// Size: 0x1a9
function function_617d41ffb1f25aa5(var_fef2728753dd969c) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    if (!isdefined(self.setspawnpoint)) {
        return 0;
    }
    if (namespace_cd0b2d039510b38d::isteamreviveenabled() && istrue(level.liveRagdollRevive)) {
        return 0;
    }
    if (namespace_36f464722d326bbe::function_2536e99eb6586f8f() && getdvarint(@"hash_b8bb29ae58a355f1", 1)) {
        return 0;
    }
    timeout = level.tispawndelay;
    if (isdefined(var_fef2728753dd969c)) {
        timeout = var_fef2728753dd969c;
    }
    if (timeout == 0) {
        return 0;
    }
    self.setspawnpoint setscriptablepartstate("respawning", "active", 0);
    cameraent = function_eeb16781ffde3d11();
    thread function_afe3d129af2c2ada(cameraent);
    childthread function_c273570f23917192(timeout);
    childthread function_e1a9e6a0debbc17f();
    childthread function_67567cb3076fb060(timeout);
    msg = function_efe4706df8361219("use_ti_spawn", "tacInsert_destroyed", "force_spawn", "use_normal_spawn", "joined_team", "joined_spectators");
    self setclientomnvar("ui_super_tac_insert_respawn", 0);
    self setclientomnvar("ui_tom_ti_respawnTimer", 0);
    if (msg == "force_spawn" || msg == "use_normal_spawn" || msg == "tacInsert_destroyed" || msg == "joined_team" || msg == "joined_spectators") {
        var_a8fe5d296bc1fd29 = msg != "tacInsert_destroyed";
        function_2fdad346acd5e7d5(cameraent);
        spawnpoint_clearspawnpoint(1, 0, var_a8fe5d296bc1fd29);
    } else if (msg == "use_ti_spawn") {
        thread function_167f151646e822dc(cameraent);
    }
    if (isdefined(self.var_15db4b9b5e7debec)) {
        return self.var_15db4b9b5e7debec;
    } else {
        return 0;
    }
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f45
// Size: 0x62
function function_67567cb3076fb060(timeout) {
    level endon("game_ended");
    self endon("disconnect");
    timeelapsed = 0;
    while (!istrue(self.var_8e9d87c3fcb2bd19)) {
        timeelapsed = timeelapsed + level.framedurationseconds;
        waitframe();
    }
    namespace_58fb4f2e73fd41a0::setlowermessageomnvar("waiting_to_spawn", int(gettime() + (timeout - timeelapsed) * 1000));
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fae
// Size: 0x14e
function function_afe3d129af2c2ada(cameraent) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("joined_team");
    self endon("joined_spectators");
    printspawnmessage("tac Insert Spawn::tacInsert_activateSpawnCamera() START");
    if (isai(self)) {
        return;
    }
    if (istrue(level.gameended)) {
        return;
    }
    if (!isdefined(cameraent)) {
        self.var_309a9b707ba4b596 = 0;
        self notify("use_normal_spawn");
        return;
    }
    self.var_309a9b707ba4b596 = 1;
    waitframe();
    if (!isdefined(cameraent)) {
        self.var_309a9b707ba4b596 = 0;
        self notify("use_normal_spawn");
        return;
    }
    namespace_5aeecefc462876::setdisabled();
    childthread function_41fd0549b6e60a03(0, 0);
    while (!istrue(self.var_8e9d87c3fcb2bd19)) {
        waitframe();
    }
    waitframe();
    self setclientomnvar("ui_tom_ti_respawnTimer", gettime() + level.tispawndelay * 1000);
    self setclientomnvar("ui_super_tac_insert_respawn", 1);
    namespace_99ac021a7547cae3::respawn_asspectator(self.origin, self.angles);
    namespace_7e17181d03156026::setdof_default();
    updatesessionstate("spectator");
    if (namespace_36f464722d326bbe::isnightmap()) {
        self visionsetkillstreakforplayer("iw9_mp_nvg_base_color");
    } else {
        self visionsetkillstreakforplayer("recon_drone_color_mp", 0);
    }
    self cameralinkto(cameraent, "tag_origin", 0, 1);
    childthread function_ca63411e99d83e54(cameraent);
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2103
// Size: 0x209
function function_167f151646e822dc(cameraent) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("joined_spectators");
    self waittill("ti_spawncamera_start");
    self cameralinkto(cameraent, "tag_origin", 1, 1);
    if (namespace_36f464722d326bbe::isnightmap()) {
        self visionsetkillstreakforplayer("iw9_mp_nvg_base_color");
    } else {
        self visionsetkillstreakforplayer("recon_drone_color_mp", 0);
    }
    _freezecontrols(1, undefined, "slamZoom");
    namespace_f8065cafc523dba5::function_a593971d75d82113();
    namespace_f8065cafc523dba5::function_379bb555405c16bb("tac_insert::tacInsert_onSpawnCameraSlamZoom()");
    self useinvisibleplayerduringspawnselection(1);
    self.plotarmor = 1;
    val::set("slamZoom", "vehicle_use", 0);
    /#
        assertex(isdefined(self.spawndata), "TacInsert_onSpawnCameraSlamZoom(): player spawnData not defined");
    #/
    /#
        assertex(isdefined(cameraent), "TacInsert_onSpawnCameraSlamZoom(): camera entity not defined");
    #/
    targetpos = self.spawndata.spawnorigin + (0, 0, 64);
    targetangles = self.spawndata.spawnangles;
    var_a54a664cef414612 = getdvarfloat(@"hash_2552d1d61db3c4aa", 0.75);
    childthread function_6a6876b45711760f(cameraent, targetpos, targetangles, var_a54a664cef414612);
    function_eeeb466cb2ddd1c4(cameraent, targetpos, targetangles, var_a54a664cef414612);
    function_2fdad346acd5e7d5(cameraent);
    updatesessionstate("playing");
    _freezecontrols(0, undefined, "slamZoom");
    namespace_f8065cafc523dba5::function_6fb380927695ee76();
    namespace_f8065cafc523dba5::function_985b0973f29da4f8("tac_insert::tacInsert_onSpawnCameraSlamZoom()");
    self useinvisibleplayerduringspawnselection(0);
    self.plotarmor = 0;
    val::function_c9d0b43701bdba00("slamZoom");
    self notify("spawned_player");
    namespace_aad14af462a74d08::function_d997435895422ecc("super_tac_insert", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"activate"));
    level notify("player_spawned", self);
    thread namespace_99ac021a7547cae3::setspawnnotifyomnvar();
    self.wasrevivespawn = undefined;
    self.delayedspawnedplayernotify = undefined;
    self.spawndata = undefined;
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2313
// Size: 0x5c
function function_3807e5acb77b5011(var_9156b53bcf7ce573) {
    level endon("game_ended");
    self endon("disconnect");
    if (!isdefined(self)) {
        return;
    }
    delay = getdvarfloat(@"hash_128ea8c781fb5fb8", 0.65);
    wait(delay);
    namespace_d19129e4fa5d176::giveloadout(self.team, self.class, undefined, undefined, var_9156b53bcf7ce573);
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2376
// Size: 0x2f
function function_2fdad346acd5e7d5(cameraent) {
    self cameraunlink(cameraent);
    self.var_309a9b707ba4b596 = undefined;
    self.var_8e9d87c3fcb2bd19 = undefined;
    cameraent delete();
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23ac
// Size: 0xdd
function function_eeeb466cb2ddd1c4(cameraent, targetpos, targetangles, var_a54a664cef414612) {
    var_e3acce2d88cf3bf4 = math::anglebetweenvectors(anglestoforward(cameraent.angles), anglestoforward(targetangles)) > 45;
    var_d43d6364668556c7 = distance2dsquared(cameraent.origin, targetpos) > 1000000;
    wait(0.05);
    cameraent moveto(targetpos, var_a54a664cef414612, 0.1, 0.1);
    var_929bfed58a804bf4 = getdvarfloat(@"hash_5474294e363a8320", 0.25);
    wait(var_a54a664cef414612 - var_929bfed58a804bf4);
    cameraent rotateto(targetangles, var_929bfed58a804bf4, 0.075, 0.075);
    wait(0.25);
    self visionsetkillstreakforplayer("", 0.05);
    wait(0.05);
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2490
// Size: 0x136
function function_6a6876b45711760f(cameraent, targetpos, targetangles, var_a54a664cef414612) {
    content = [0:"physicscontents_clipshot", 1:"physicscontents_missileclip", 2:"physicscontents_vehicle", 3:"physicscontents_characterproxy", 4:"physicscontents_glass", 5:"physicscontents_itemclip"];
    contentoverride = physics_createcontents(content);
    var_19a552c4bce63400 = namespace_2a184fc4902783dc::ray_trace(cameraent.origin, targetpos, undefined, contentoverride);
    groundtrace = namespace_2a184fc4902783dc::ray_trace(targetpos, cameraent.origin, undefined, contentoverride);
    var_9759221a13e07f1b = var_19a552c4bce63400["fraction"];
    var_8bb2698c2acb0fc6 = groundtrace["fraction"];
    var_4727e885c8a34003 = 0.11;
    if (var_9759221a13e07f1b < 1) {
        if (var_9759221a13e07f1b - 0.22 > 0) {
            wait(var_9759221a13e07f1b - 0.22);
        }
        holdtime = var_a54a664cef414612 - var_9759221a13e07f1b - var_8bb2698c2acb0fc6 + var_4727e885c8a34003;
        thread function_41fd0549b6e60a03(0.1, holdtime, 0.25);
    }
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25cd
// Size: 0x12f
function function_ca63411e99d83e54(cameraent) {
    self endon("use_ti_spawn");
    self endon("tacInsert_destroyed");
    self endon("force_spawn");
    self endon("use_normal_spawn");
    self endon("joined_team");
    self endon("joined_spectators");
    counter = 0;
    var_c8442f16520eec66 = getdvarint(@"hash_96cda220c7b9c3b8", 50);
    var_1e730115822dc920 = getdvarfloat(@"hash_a7b33246bb4a88ce", 5);
    var_616664ec7bbc47b3 = var_c8442f16520eec66 / 2;
    offset = 0;
    while (1) {
        if (counter == 0) {
            offset = var_616664ec7bbc47b3;
        } else {
            offset = var_c8442f16520eec66;
            if (counter % 2 == 1) {
                offset = offset * -1;
            }
        }
        if (!isdefined(cameraent)) {
            return;
        }
        destination = cameraent.origin + anglestoright(cameraent.angles) * offset;
        cameraent moveto(destination, ter_op(counter == 0, var_1e730115822dc920 / 2, var_1e730115822dc920), 0.25, 0.25);
        while (distancesquared(cameraent.origin, destination) > 0.5) {
            waitframe();
        }
        counter++;
    }
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2703
// Size: 0x107
function function_41fd0549b6e60a03(var_f503170ef47452e7, holdtime, var_1bb7594c18d17443) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    if (!isdefined(var_f503170ef47452e7)) {
        var_f503170ef47452e7 = 0;
    }
    if (!isdefined(holdtime)) {
        holdtime = 0;
    }
    if (!isdefined(var_1bb7594c18d17443)) {
        var_1bb7594c18d17443 = 0.5;
    }
    var_58be5d0fc187610e = 0;
    var_64423461fe38ecb3 = int(floor(var_f503170ef47452e7 / level.framedurationseconds));
    var_4a1830f604c82b9f = 0;
    while (var_4a1830f604c82b9f <= var_64423461fe38ecb3) {
        if (var_64423461fe38ecb3 == 0) {
            break;
        }
        var_58be5d0fc187610e = var_4a1830f604c82b9f / var_64423461fe38ecb3;
        self setclientomnvar("ui_world_fade", var_58be5d0fc187610e);
        var_4a1830f604c82b9f++;
        waitframe();
    }
    self.var_8e9d87c3fcb2bd19 = 1;
    if (holdtime > 0) {
        wait(holdtime);
    }
    var_64423461fe38ecb3 = int(ceil(var_1bb7594c18d17443 / level.framedurationseconds));
    var_4a1830f604c82b9f = 0;
    var_58be5d0fc187610e = 1;
    while (var_4a1830f604c82b9f <= var_64423461fe38ecb3) {
        var_58be5d0fc187610e = (var_64423461fe38ecb3 - var_4a1830f604c82b9f) / var_64423461fe38ecb3;
        self setclientomnvar("ui_world_fade", var_58be5d0fc187610e);
        var_4a1830f604c82b9f++;
        waitframe();
    }
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2811
// Size: 0xe4
function function_eeb16781ffde3d11() {
    var_95706ef8ae64e9dd = anglestoup(self.setspawnpoint.angles);
    var_34066fb22d6b1469 = getdvarint(@"hash_2ace60ec27da45be", 50);
    var_4f0797146c5bf0af = getdvarint(@"hash_27a03e1f75a3fdda", 2000);
    var_37e589a5e0f61a45 = self.setspawnpoint.origin + var_95706ef8ae64e9dd * var_34066fb22d6b1469 + (0, 0, 1) * var_4f0797146c5bf0af;
    var_78a5beaea9e56a9b = vectortoangles(self.setspawnpoint.origin - var_37e589a5e0f61a45);
    cameraent = spawn("script_model", var_37e589a5e0f61a45);
    cameraent setmodel("tag_origin");
    cameraent.angles = var_78a5beaea9e56a9b;
    return cameraent;
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28fd
// Size: 0x35
function function_c273570f23917192(timeout) {
    self endon("tacInsert_destroyed");
    self endon("force_spawn");
    self endon("use_normal_spawn");
    wait(timeout);
    self.var_15db4b9b5e7debec = timeout;
    self notify("use_ti_spawn");
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2939
// Size: 0xcb
function function_e1a9e6a0debbc17f() {
    self endon("tacInsert_destroyed");
    self endon("force_spawn");
    self endon("use_ti_spawn");
    var_91c95e88f4de9ed7 = 0;
    timeelapsed = 0;
    while (self usebuttonpressed()) {
        waitframe();
    }
    while (isdefined(self)) {
        timeelapsed = timeelapsed + level.framedurationseconds;
        if (self usebuttonpressed()) {
            var_91c95e88f4de9ed7 = var_91c95e88f4de9ed7 + level.framedurationseconds;
            self setclientomnvar("ui_exit_progress", var_91c95e88f4de9ed7 / 0.45);
            if (var_91c95e88f4de9ed7 > 0.45) {
                self notify("use_normal_spawn");
                self.var_15db4b9b5e7debec = timeelapsed;
                return;
            }
        } else if (var_91c95e88f4de9ed7 > 0) {
            var_91c95e88f4de9ed7 = var_91c95e88f4de9ed7 - level.framedurationseconds;
            self setclientomnvar("ui_exit_progress", var_91c95e88f4de9ed7 / 0.45);
            if (var_91c95e88f4de9ed7 <= 0) {
                var_91c95e88f4de9ed7 = 0;
            }
        }
        waitframe();
    }
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2a0b
// Size: 0x211
function function_b90a2bd2987f0bac(origin, angles) {
    baseangles = angles;
    var_f03302c066639995 = 30;
    var_519305604d8e28e4 = 360 / var_f03302c066639995;
    stepcount = 0;
    var_5a08ed54211895bf = 1;
    var_ac59002aa0721741 = getdvarint(@"hash_984d01a22fdb9767", 50);
    var_e95d8b067be88b21 = undefined;
    var_634e1a5fda766caa = 0;
    camerapos = origin;
    cameraangles = angles;
    radius = 2;
    passed = 0;
    while (stepcount < var_519305604d8e28e4) {
        if (stepcount == 0) {
            var_e95d8b067be88b21 = anglestoforward(baseangles);
            stepcount++;
        } else {
            var_e95d8b067be88b21 = anglestoforward(baseangles + (0, ter_op(var_5a08ed54211895bf, var_f03302c066639995, var_f03302c066639995 * -1) * stepcount, 0));
            var_5a08ed54211895bf = !var_5a08ed54211895bf;
            if (var_5a08ed54211895bf) {
                stepcount++;
            }
        }
        tracestart = origin + (0, 0, 2);
        var_2d8064e28c26d52 = getdvarfloat(@"hash_9e4c984d178a39ed", 0.75);
        var_64be15313632fb31 = getdvarfloat(@"hash_6a4a8ac28728f9ec", 0.5);
        traceend = origin + var_e95d8b067be88b21 * var_ac59002aa0721741 * var_2d8064e28c26d52 + (0, 0, var_ac59002aa0721741 * var_64be15313632fb31);
        trace = namespace_2a184fc4902783dc::sphere_trace(tracestart, traceend, radius, [0:self.setspawnpoint], undefined, 1);
        hitpos = trace["position"];
        if (trace["fraction"] > 0.99) {
            camerapos = hitpos;
            cameraangles = vectortoangles(vectornormalize(origin - camerapos));
            break;
        }
    }
    cameraent = spawn("script_model", camerapos);
    cameraent setmodel("tag_player");
    cameraent.angles = cameraangles;
    return cameraent;
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c24
// Size: 0x58
function tacinsert_updatedestroyusability(player) {
    if (!isdefined(player)) {
        return;
    }
    if (!isdefined(self)) {
        return;
    }
    if (istrue(self.isdestroyed)) {
        return;
    }
    isenemy = namespace_f8065cafc523dba5::playersareenemies(self.owner, player);
    if (isenemy) {
        self enableplayeruse(player);
    } else {
        self disableplayeruse(player);
    }
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c83
// Size: 0x86
function tacinsert_empapplied(data) {
    attacker = data.attacker;
    self notify("enemy_destroyed_equipment", attacker);
    tacinsert_givepointsfordeath(attacker, 1);
    if (isdefined(self.owner) && data.attacker != self.owner) {
        self.owner thread namespace_944ddf7b8df1b0e3::leaderdialogonplayer("ti_destroyed", undefined, undefined, self.origin);
    }
    thread tacinsert_destroy(1);
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d10
// Size: 0x5b
function tacinsert_givepointsfordeath(attacker, var_d60fddb3d37776a1) {
    if (istrue(namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker))) {
        attacker notify("destroyed_equipment");
        attacker thread givescorefordestroyedtacinsert(var_d60fddb3d37776a1);
        self.owner thread namespace_944ddf7b8df1b0e3::leaderdialogonplayer("ti_destroyed", undefined, undefined, self.origin);
    }
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d72
// Size: 0x1c5
function function_6aa9474826722600(grenade, var_14b9b15ccd581542, var_27ac9f99fc2e7a9b) {
    var_8e973c3cce3e3264 = 1;
    ignoreent = [0:self, 1:grenade];
    contentoverride = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 1, 1, 1, 1, 1);
    traceresult = namespace_2a184fc4902783dc::sphere_trace(var_14b9b15ccd581542, var_27ac9f99fc2e7a9b, 20, ignoreent, contentoverride, 1);
    if (isdefined(traceresult)) {
        if (isdefined(traceresult["hittype"]) && traceresult["hittype"] != "hittype_none") {
            surfacetype = traceresult["surfacetype"];
            if (isdefined(surfacetype) && surfacetype != "surftype_none") {
                surfacetype = traceresult["surfacetype"];
                if (surfacetype == "surftype_glass_pane") {
                    var_8e973c3cce3e3264 = 0;
                }
            }
            ent = traceresult["entity"];
            if (isdefined(ent)) {
                var_d356bc81ef55c39d = is_train_ent(ent);
                if (ent namespace_1f188a13f7e79610::isvehicle() && !var_d356bc81ef55c39d) {
                    var_8e973c3cce3e3264 = 0;
                }
                var_c4c31894d4002f8a = getdvarint(@"hash_956f65ae92f862e", 1);
                if (!var_c4c31894d4002f8a && var_d356bc81ef55c39d) {
                    var_8e973c3cce3e3264 = 0;
                }
                if (getdvarint(@"hash_9b8b6a0216965e80", 1) == 1 && istrue(self.var_8e2d666b5b0f2bd3)) {
                    var_8e973c3cce3e3264 = 0;
                }
                if (isdefined(ent.classname)) {
                    switch (ent.classname) {
                    case #"hash_81903cb95a447b8c":
                    case #"hash_e224d0b635d0dadd":
                        var_8e973c3cce3e3264 = 0;
                        break;
                    case #"hash_3872eb7d97592cac":
                        if (isdefined(ent.crate)) {
                            var_8e973c3cce3e3264 = 0;
                        }
                        break;
                    }
                }
            }
        }
    }
    return istrue(var_8e973c3cce3e3264);
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f3f
// Size: 0x7c
function function_3fd179c2e0859395() {
    self endon("disconnect");
    level endon("game_ended");
    var_3bdc9f6146deef30 = getdvarint(@"hash_3ab7920059d1179a", 1);
    if (var_3bdc9f6146deef30 == 0) {
        return;
    }
    if (istrue(level.isgroundwarinfected) || namespace_36f464722d326bbe::function_2536e99eb6586f8f()) {
        if (level.infectedtactical == "equip_tac_insert") {
            namespace_1a507865f681850e::giveequipment(level.infectedtactical, "secondary");
        }
    } else {
        thread namespace_85d036cb78063c4a::refundsuper();
    }
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fc2
// Size: 0x16
function function_49197cd063a740ea(callbackfunction) {
    self.var_d1659ed0a33bf98f = callbackfunction;
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fdf
// Size: 0xf6
function spawnpoint_setspawnpoint(pos, angles, var_5436f99da0ab0d6, var_e054c5b70dc5b332, var_97f4d755d6790643) {
    spawnpoint_clearspawnpoint();
    spawnpoint = undefined;
    if (isdefined(var_5436f99da0ab0d6)) {
        spawnpoint = var_5436f99da0ab0d6;
    } else {
        spawnpoint = spawn("script_model", pos);
    }
    spawnpoint.playerspawnpos = pos;
    spawnpoint.playerspawnangles = angles;
    spawnpoint.notti = !istrue(var_e054c5b70dc5b332);
    spawnpoint.issuper = isdefined(var_5436f99da0ab0d6) && istrue(var_5436f99da0ab0d6.issuper);
    spawnpoint.var_97f4d755d6790643 = var_97f4d755d6790643;
    if (istrue(var_97f4d755d6790643)) {
        zoffset = getdvarint(@"hash_aae1c46aed802dea", 30);
        spawnpoint.playerspawnpos = spawnpoint.playerspawnpos + (0, 0, zoffset * -1);
    }
    self.setspawnpoint = spawnpoint;
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30dc
// Size: 0x65
function spawnpoint_clearspawnpoint(var_4fac8b8ce36e09f1, var_809a2ecf919c757a, var_91e5860de38e0ea6) {
    if (isdefined(self.setspawnpoint)) {
        if (istrue(self.setspawnpoint.notti)) {
            self.setspawnpoint delete();
        } else {
            self.setspawnpoint namespace_add8ab90fc53d7f7::tacinsert_destroy(var_4fac8b8ce36e09f1, var_809a2ecf919c757a, var_91e5860de38e0ea6);
        }
    }
}

// Namespace namespace_97cd0e84a74e2089/namespace_add8ab90fc53d7f7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3148
// Size: 0x93
function function_3ad5d3768653f711(ent, var_e054c5b70dc5b332) {
    if (!isdefined(ent)) {
        self notify("end_movingUpdate");
        return;
    }
    spawnpoint = ent;
    spawnpoint.playerspawnpos = ent.origin;
    spawnpoint.playerspawnangles = ent.angles;
    spawnpoint.notti = !istrue(var_e054c5b70dc5b332);
    spawnpoint.issuper = isdefined(ent) && istrue(ent.issuper);
    self.setspawnpoint = spawnpoint;
}

