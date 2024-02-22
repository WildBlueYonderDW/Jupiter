// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using scripts\cp_mp\utility\callback_group.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\train_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\engine\trace.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\cp_mp\ent_manager.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\mp\damage.gsc;
#using script_736dec95a49487a6;
#using script_5f903436642211af;
#using scripts\cp_mp\challenges.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\mp\analyticslog.gsc;
#using script_13d1c402f1421c35;
#using scripts\mp\shellshock.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;

#namespace sound_veil;

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x431
// Size: 0x26
function function_735ed2b006dce0eb() {
    /#
        setdevdvarifuninitialized(@"hash_7ab7001b47624fdc", 0);
        setdevdvarifuninitialized(@"hash_aa851e1cd1444734", 0);
    #/
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45e
// Size: 0x380
function function_6d91f8514005d18(grenade) {
    grenade endon("death");
    self endon("disconnect");
    /#
        printgameaction("enable_", self);
    #/
    if (!isdefined(level.var_4405e76242d7cb8e)) {
        level.var_4405e76242d7cb8e = 0;
    }
    grenade namespace_2a9588dfac284b77::registerspawn(1, &function_558d562eb33ea61d);
    thread namespace_3bbb5a98b932c46f::monitordisownedgrenade(self, grenade);
    grenade setscriptablepartstate("visibility", "show", 0);
    stuckto = grenade waittill("missile_stuck");
    if (isdefined(stuckto) && stuckto isvehicle()) {
        grenade.vehicle_stuck = 1;
    }
    if (isdefined(level.var_ca4e08767cbdae12)) {
        var_425925a45729deae = grenade [[ level.var_ca4e08767cbdae12 ]]();
        if (!var_425925a45729deae) {
            namespace_85d036cb78063c4a::refundsuper();
            namespace_44abc05161e2e2cb::showerrormessage("EQUIPMENT/PLANT_FAILED");
            grenade delete();
            return;
        }
    }
    grenade setscriptablepartstate("plant", "active", 0);
    grenade setotherent(self);
    grenade setnodeploy(1);
    grenade setnonstick(1);
    grenade.issuper = 1;
    grenade.superid = level.superglobals.staticsuperdata["super_sound_veil"].id;
    grenade.usedcount = 0;
    grenade.deployingplayer = self;
    grenade.headiconid = grenade namespace_7bdde15c3500a23f::setheadicon_factionimage(0, 20, undefined, undefined, undefined, undefined, 1);
    grenade.var_89ee7eba7b1862cf = [];
    trigger = spawn("trigger_rotatable_radius", grenade.origin, 0, 80, 300);
    trigger.angles = grenade.angles;
    grenade.trigger = trigger;
    trigger enablelinkto();
    trigger linkto(grenade);
    var_307667d0142f2035 = _hasperk("specialty_rugged_eqp");
    onequipmentplanted(grenade, "sound_veil_mp", &function_558d562eb33ea61d);
    level thread monitordisownedequipment(self, grenade);
    grenade namespace_6d9917c3dc05dbe9::registersentient("Tactical_Static", self);
    maxhealth = ter_op(var_307667d0142f2035, 225, 150);
    grenade thread namespace_3e725f3cc58bddd3::monitordamage(maxhealth, "hitequip", &function_f313405d166290be, &function_50b1d2352a6a686a, 0);
    grenade set_apply_emp_callback(&function_b434ea15774ed770);
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        grenade [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_3b78125a41e822);
    }
    if (issharedfuncdefined("emp", "setEMP_Cleared_Callback")) {
        grenade [[ getsharedfunc("emp", "setEMP_Cleared_Callback") ]](&function_844431456055a07b);
    }
    grenade namespace_b6b4a3ac458ab6e2::function_172d848d58051fdf(&function_391ebdde9e0eec71);
    grenade function_49197cd063a740ea(&function_558d562eb33ea61d);
    if (isdefined(level.elevators)) {
        foreach (elevators in level.elevators) {
            elevators thread namespace_272931699e2fe8e9::function_5c07037726ae5001(grenade);
        }
    }
    grenade function_74844a68121c9b36();
    namespace_aad14af462a74d08::function_d997435895422ecc("super_sound_veil", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e5
// Size: 0x5e
function function_7a9d11f284eb6bc3(timeout, var_cd96ae96391c79e6) {
    self endon("destroyed");
    self notify("reset_timeout");
    self endon("reset_timeout");
    level endon("game_ended");
    result = waittill_any_timeout_1(timeout, "death");
    if (istrue(var_cd96ae96391c79e6)) {
        function_a322c0dd80d5eff7();
    } else {
        function_558d562eb33ea61d();
    }
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x84a
// Size: 0x13b
function function_95a96c443ac9ea46(player) {
    self endon("death");
    self endon("destroyed");
    self endon("missile_stuck");
    player endon("disconnect");
    msg = waittill_any_timeout_1(2, "touching_platform");
    if (msg == "timeout") {
        return;
    }
    groundentity = undefined;
    ignoreents = vehicle_getarrayinradius(self.origin, 500, 500);
    ignoreents[ignoreents.size] = self;
    var_fbcabd62b8f66eb8 = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 0, 1, 1, 0, 1);
    tracestart = self.origin;
    var_3a7f0173b03f5767 = -2000;
    traceend = self.origin + (0, 0, var_3a7f0173b03f5767);
    traceresults = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreents, var_fbcabd62b8f66eb8);
    groundentity = traceresults["entity"];
    if (isdefined(groundentity)) {
        if (is_train_ent(groundentity)) {
            self.origin = self.origin + (0, 0, 1.6);
            self linkto(groundentity);
        }
    }
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x98c
// Size: 0xa4
function function_50b1d2352a6a686a(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    modifieddamage = damage;
    modifieddamage = utility::handlemeleedamage(objweapon, type, modifieddamage);
    modifieddamage = namespace_3e725f3cc58bddd3::handleapdamage(objweapon, type, modifieddamage, attacker);
    if (!isagent(attacker)) {
        namespace_3bbb5a98b932c46f::equipmenthit(self.owner, attacker, objweapon, type);
    }
    return modifieddamage;
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa38
// Size: 0x74
function function_f313405d166290be(data) {
    attacker = data.attacker;
    if (isplayer(attacker) && istrue(namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker))) {
        attacker notify("destroyed_equipment");
        attacker thread doscoreevent(#"destroyed_equipment");
        attacker thread namespace_25c5a6f43bb97b43::onfieldupgradedestroy(#"hash_fc93a01157648dcc");
    }
    function_558d562eb33ea61d(data);
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab3
// Size: 0xbe
function function_558d562eb33ea61d(data) {
    if (!isdefined(self)) {
        return;
    }
    var_ffe0d0bdd9bd7d44 = 0;
    if (isdefined(data) && isdefined(data.attacker)) {
        var_ffe0d0bdd9bd7d44 = 1;
        function_7c9d9f1ca399b82c(data.attacker);
    }
    if (isdefined(self.headiconid)) {
        namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.headiconid);
    }
    if (isdefined(self.navobstacle)) {
        destroynavobstacle(self.navobstacle);
    }
    function_77bbce9593e3b2cc();
    thread function_53b79c2279dc402(var_ffe0d0bdd9bd7d44);
    self setscriptablepartstate("activate", "neutral", 0);
    self setscriptablepartstate("destroy", "active", 0);
    self notify("destroyed");
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb78
// Size: 0xed
function function_53b79c2279dc402(var_4fac8b8ce36e09f1) {
    self endon("death");
    if (!isdefined(self)) {
        /#
            iprintln("killed_player");
        #/
    }
    self.exploding = 1;
    if (isdefined(self.trigger)) {
        self.trigger delete();
    }
    if (isdefined(self.owner) && isplayer(self.owner)) {
        self.owner namespace_aad14af462a74d08::function_d997435895422ecc("super_sound_veil", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"end"), self.usedcount);
        namespace_bd0162aedd8c8594::logevent_fieldupgradeexpired(self.owner, self.superid, self.usedcount, istrue(var_4fac8b8ce36e09f1));
        self.owner removeequip(self);
    }
    wait(2);
    namespace_2a9588dfac284b77::deregisterspawn();
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc6c
// Size: 0x4e
function function_7c9d9f1ca399b82c(attacker) {
    if (isplayer(attacker) && istrue(namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker))) {
        attacker notify("destroyed_equipment");
        attacker thread doscoreevent(#"destroyed_equipment");
        attacker thread namespace_25c5a6f43bb97b43::equipmentdestroyed(self);
    }
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc1
// Size: 0xa7
function function_b434ea15774ed770(data) {
    if (!isdefined(data) || !isdefined(data.victim)) {
        return;
    }
    data.victim endon("death");
    data.victim endon("destroyed");
    data.victim setscriptablepartstate("empd", "active", 0);
    data.victim function_3e3ba6dfdea9465b();
    wait(6);
    data.victim setscriptablepartstate("empd", "neutral", 0);
    data.victim function_74844a68121c9b36();
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd6f
// Size: 0x73
function function_3b78125a41e822(data) {
    if (!isdefined(data) || !isdefined(data.victim)) {
        return;
    }
    data.victim endon("death");
    data.victim endon("destroyed");
    data.victim setscriptablepartstate("empd", "active", 0);
    data.victim function_3e3ba6dfdea9465b();
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde9
// Size: 0x3a
function function_844431456055a07b(data) {
    data.victim setscriptablepartstate("empd", "neutral", 0);
    data.victim function_74844a68121c9b36();
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe2a
// Size: 0x14
function function_391ebdde9e0eec71(data) {
    function_558d562eb33ea61d(data);
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe45
// Size: 0xb8
function function_74844a68121c9b36() {
    self notify("enable_" + "super_sound_veil");
    self setscriptablepartstate("arm", "active", 0);
    if (!istrue(self.var_eec43b28df0bc8d6) && !istrue(self.var_d01a8a39e172ea92)) {
        var_20f555e2261730d5 = 60;
        if (namespace_36f464722d326bbe::isbrstylegametype()) {
            var_20f555e2261730d5 = 480;
        }
        var_38a6b48a5f70c0b8 = getdvarint(@"hash_aa851e1cd1444734", 0);
        if (var_38a6b48a5f70c0b8 > 0) {
            var_20f555e2261730d5 = var_38a6b48a5f70c0b8;
        }
        thread function_7a9d11f284eb6bc3(var_20f555e2261730d5);
    }
    if (istrue(self.triggered)) {
        self setscriptablepartstate("activate", "active", 0);
    }
    thread function_caab3d73a9d2b003();
    self.var_eec43b28df0bc8d6 = 1;
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf04
// Size: 0x294
function function_caab3d73a9d2b003() {
    self endon("death");
    self endon("destroyed");
    self endon("disable_" + "super_sound_veil");
    level endon("game_ended");
    self.var_b8117f3dca9b4070 = [];
    while (1) {
        var_ca79210cd76fada3 = self.trigger waittill("trigger");
        var_da8cec9bce12f9cb = var_ca79210cd76fada3.team;
        if (!isdefined(var_da8cec9bce12f9cb) && isagent(var_ca79210cd76fada3) && isdefined(var_ca79210cd76fada3.agentteam)) {
            var_da8cec9bce12f9cb = var_ca79210cd76fada3.agentteam;
        }
        if (isdefined(var_da8cec9bce12f9cb) && var_da8cec9bce12f9cb == self.owner.team) {
            continue;
        }
        if (isagent(var_ca79210cd76fada3) && !array_contains(self.var_b8117f3dca9b4070, var_ca79210cd76fada3)) {
            if (istrue(self.var_fff21a869f9fa687) && !function_a5a768ec20759f3d(var_ca79210cd76fada3)) {
                continue;
            }
            self.var_b8117f3dca9b4070[self.var_b8117f3dca9b4070.size] = var_ca79210cd76fada3;
            var_ca79210cd76fada3 namespace_ba1fcf33692e2fad::flashbangstart(3);
        }
        if (!istrue(self.triggered)) {
            if (!function_2567c5ffae3aa0cc(var_ca79210cd76fada3)) {
                continue;
            }
            self.triggered = 1;
            thread function_7a9d11f284eb6bc3(20, istrue(self.var_d01a8a39e172ea92));
            if (istrue(var_ca79210cd76fada3.var_f19a8bf0b538aaf8)) {
                explosivetrigger(var_ca79210cd76fada3, 0);
            }
            self setscriptablepartstate("trigger", "active", 0);
            wait(0.35);
            self setscriptablepartstate("activate", "active", 0);
            namespace_6de0840c25c8dc22::grenade_earthquakeatposition(self.origin, 0.25);
            if (!isdefined(self.vehicle_stuck) && !isdefined(self.navobstacle)) {
                half_height = 150;
                var_11234f42cb6a6dd2 = 20;
                var_195a2ed93e9eaef9 = anglestoup(self.angles);
                var_d5dd171f21b7daca = self.origin + var_195a2ed93e9eaef9 * half_height - var_195a2ed93e9eaef9 * var_11234f42cb6a6dd2;
                if (getgametype() == "koth_horde") {
                    var_1d2a597723c03d2e = [0:"axis", 1:"allies"];
                    self.navobstacle = createnavbadplacebyshape(var_d5dd171f21b7daca, self.angles, 8, 90, half_height + 40, var_1d2a597723c03d2e);
                } else {
                    self.navobstacle = createnavbadplacebyshape(var_d5dd171f21b7daca, self.angles, 8, 90, half_height + 40);
                }
            }
        } else {
            function_ffb333a3a7d50710(var_ca79210cd76fada3);
        }
    }
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x119f
// Size: 0xd7
function function_2567c5ffae3aa0cc(potentialtarget) {
    if (potentialtarget isvehicle()) {
        if (!isdefined(potentialtarget.streakinfo)) {
            vehicle = potentialtarget;
            vehicleoccupants = vehicle_occupancy_getalloccupants(vehicle);
            var_7f22902f9e860f6a = 0;
            if (isdefined(vehicleoccupants) && vehicleoccupants.size > 0) {
                foreach (occupant in vehicleoccupants) {
                    if (!function_bd10b05c42bb5432(occupant, 1)) {
                        continue;
                    }
                    var_7f22902f9e860f6a = 1;
                    break;
                }
            }
            if (!istrue(var_7f22902f9e860f6a)) {
                return 0;
            }
        } else {
            return 0;
        }
    } else if (!function_bd10b05c42bb5432(potentialtarget)) {
        return 0;
    }
    return 1;
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x127e
// Size: 0x56
function function_bd10b05c42bb5432(potentialtarget, var_c21cbb75e13200d4, var_e6c0b49674829ef4) {
    if (!function_fb91ac0d17ce422e(potentialtarget, var_e6c0b49674829ef4)) {
        return 0;
    }
    if (function_8be3970b7e22cb24(potentialtarget)) {
        return 0;
    }
    if (!function_669bd251f952db32(potentialtarget) && !istrue(var_c21cbb75e13200d4)) {
        return 0;
    }
    if (!function_47bba92311467ca4(potentialtarget)) {
        return 0;
    }
    return 1;
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12dc
// Size: 0x18
function function_8be3970b7e22cb24(potentialtarget) {
    return istrue(potentialtarget.var_baf99ff6e658c413);
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12fc
// Size: 0x1e
function function_669bd251f952db32(potentialtarget) {
    return potentialtarget sightconetrace(self.origin, self) > 0;
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1322
// Size: 0x49
function function_47bba92311467ca4(potentialtarget) {
    if ((isplayer(potentialtarget) || isagent(potentialtarget)) && potentialtarget namespace_f8065cafc523dba5::isinvehicle()) {
        potentialtarget = potentialtarget namespace_f8065cafc523dba5::getvehicle();
    }
    if (!potentialtarget istouching(self.trigger)) {
        return 0;
    }
    return 1;
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1373
// Size: 0x9f
function function_b6727d48164ba951(potentialtarget, var_e6c0b49674829ef4, var_4a6a11a4f1e2c293) {
    if (!isreallyalive(potentialtarget)) {
        return 0;
    }
    if (istrue(level.teambased)) {
        if (potentialtarget.team == self.owner.team) {
            if (potentialtarget == self.owner) {
                if (istrue(var_e6c0b49674829ef4) || istrue(var_4a6a11a4f1e2c293)) {
                    return 1;
                }
            }
        } else {
            return 1;
        }
    } else if (potentialtarget == self.owner) {
        if (istrue(var_e6c0b49674829ef4) || istrue(var_4a6a11a4f1e2c293)) {
            return 1;
        }
    } else {
        return 1;
    }
    return 0;
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x141a
// Size: 0xb6
function function_a5a768ec20759f3d(potentialtarget) {
    if (isdefined(potentialtarget.agent_type) && issubstr(potentialtarget.agent_type, "civilian")) {
        return 0;
    }
    if (!istrue(potentialtarget.isactive)) {
        return 0;
    }
    var_da8cec9bce12f9cb = potentialtarget.team;
    if (!isdefined(var_da8cec9bce12f9cb) && isagent(potentialtarget) && isdefined(potentialtarget.agentteam)) {
        var_da8cec9bce12f9cb = potentialtarget.agentteam;
    }
    if (isdefined(var_da8cec9bce12f9cb) && potentialtarget.team == self.owner.team) {
        return 0;
    }
    return 1;
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14d8
// Size: 0x6b
function function_fb91ac0d17ce422e(potentialtarget, var_e6c0b49674829ef4) {
    var_4a6a11a4f1e2c293 = 0;
    /#
        var_4a6a11a4f1e2c293 = getdvarint(@"hash_7ab7001b47624fdc", 0);
    #/
    if (!isdefined(potentialtarget)) {
        return 0;
    }
    if (isplayer(potentialtarget) && !function_b6727d48164ba951(potentialtarget, var_e6c0b49674829ef4, var_4a6a11a4f1e2c293)) {
        return 0;
    }
    if (isagent(potentialtarget) && !function_a5a768ec20759f3d(potentialtarget)) {
        return 0;
    }
    return 1;
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x154b
// Size: 0x165
function function_ffb333a3a7d50710(enemytarget) {
    var_c8d9f540bee26b9 = [];
    if (enemytarget isvehicle()) {
        if (!isdefined(enemytarget.streakinfo)) {
            vehicleoccupants = vehicle_occupancy_getalloccupants(enemytarget);
            if (isdefined(vehicleoccupants) && vehicleoccupants.size > 0) {
                foreach (occupant in vehicleoccupants) {
                    if (function_bd10b05c42bb5432(occupant, 1, 1)) {
                        var_c8d9f540bee26b9[var_c8d9f540bee26b9.size] = occupant;
                    }
                }
            }
        } else {
            return;
        }
    } else if (function_bd10b05c42bb5432(enemytarget, undefined, 1)) {
        var_c8d9f540bee26b9[var_c8d9f540bee26b9.size] = enemytarget;
    }
    foreach (target in var_c8d9f540bee26b9) {
        if (!isdefined(target)) {
            continue;
        }
        function_58224ad5db7ba3ef(target);
        var_cff38bae1f51bbbf = function_55f4107c03475907(target);
        function_dba08b318eb4224d(target, var_cff38bae1f51bbbf);
        thread function_20e0e81ccc2160e7(target, var_cff38bae1f51bbbf);
        if (isplayer(target) && !isbot(target)) {
            function_99f74e04a216a21c(target, var_cff38bae1f51bbbf);
        }
    }
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16b7
// Size: 0x59
function function_55f4107c03475907(target) {
    level.var_4405e76242d7cb8e++;
    var_cff38bae1f51bbbf = 0;
    if (isplayer(target) && !isbot(target)) {
        var_cff38bae1f51bbbf = target getxuid();
    } else {
        var_cff38bae1f51bbbf = target getentitynumber();
    }
    return var_cff38bae1f51bbbf + "_" + level.var_4405e76242d7cb8e;
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1718
// Size: 0x14e
function function_20e0e81ccc2160e7(enemytarget, var_cff38bae1f51bbbf) {
    self endon("death");
    self endon("destroyed");
    self endon("lost_target_" + var_cff38bae1f51bbbf);
    self endon("disable_" + "super_sound_veil");
    level endon("game_ended");
    var_4a6a11a4f1e2c293 = 0;
    /#
        var_4a6a11a4f1e2c293 = getdvarint(@"hash_7ab7001b47624fdc", 0);
        if (var_4a6a11a4f1e2c293 == 2) {
            return;
        }
    #/
    if (isdefined(enemytarget) && isplayer(enemytarget) && isplayer(self.owner) && enemytarget != self.owner) {
        self.owner thread doscoreevent(#"hash_62166c6d2fcb36c3");
    }
    while (isdefined(enemytarget)) {
        var_22f87c8bf7c4616b = "sound_veil_mp";
        if (isplayer(enemytarget)) {
            if (enemytarget _hasperk("specialty_tac_resist") || enemytarget _hasperk("specialty_tac_resist_br")) {
                var_22f87c8bf7c4616b = "sound_veil_reduced_mp";
            }
        }
        enemytarget namespace_9e00394bef0f1e98::_shellshock(var_22f87c8bf7c4616b, "stun", 0.5, 0);
        if (isdefined(self.owner)) {
            enemytarget dodamage(1, self.origin, self.owner, self, "MOD_EXPLOSIVE", self.weapon_object, "torso_upper");
        }
        wait(0.5);
    }
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x186d
// Size: 0x33
function function_99f74e04a216a21c(enemytarget, var_cff38bae1f51bbbf) {
    if (enemytarget namespace_448ccf1ca136fbbe::isusingremote()) {
        thread function_a996433357117a3f(enemytarget, var_cff38bae1f51bbbf);
        return;
    }
    thread function_a8b8c5877fc13197(enemytarget, var_cff38bae1f51bbbf);
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18a7
// Size: 0x5d
function function_a996433357117a3f(enemytarget, var_cff38bae1f51bbbf) {
    self endon("death");
    self endon("destroyed");
    self endon("lost_target_" + var_cff38bae1f51bbbf);
    self endon("disable_" + "super_sound_veil");
    level endon("game_ended");
    while (isdefined(enemytarget) && enemytarget namespace_448ccf1ca136fbbe::isusingremote()) {
        waitframe();
    }
    thread function_a8b8c5877fc13197(enemytarget, var_cff38bae1f51bbbf);
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x190b
// Size: 0xe7
function function_a8b8c5877fc13197(enemytarget, var_cff38bae1f51bbbf) {
    level endon("game_ended");
    var_4a6a11a4f1e2c293 = 0;
    /#
        var_4a6a11a4f1e2c293 = getdvarint(@"hash_7ab7001b47624fdc", 0);
        if (var_4a6a11a4f1e2c293 == 2) {
            return;
        }
    #/
    var_b249c1ffaebdbc61 = "player_soundveil_shake_mp";
    var_5c46a6026a0b4d43 = 5;
    if (enemytarget _hasperk("specialty_tac_resist")) {
        var_b249c1ffaebdbc61 = "player_soundveil_shake_reduced_mp";
        var_5c46a6026a0b4d43 = 3;
    }
    namespace_f8065cafc523dba5::function_f7348e400b4a608d(enemytarget, var_b249c1ffaebdbc61, 1);
    enemytarget setclientomnvar("ui_hud_shake", 1);
    enemytarget namespace_5a51aa78ea0b1b9f::play_emp_scramble(var_5c46a6026a0b4d43);
    level waittill_any_ents(self, "death", self, "destroyed", self, "lost_target_" + var_cff38bae1f51bbbf, self, "disable_" + "super_sound_veil");
    if (isdefined(enemytarget)) {
        namespace_f8065cafc523dba5::function_56d83cde22535f96(enemytarget);
        enemytarget setclientomnvar("ui_hud_shake", 0);
        enemytarget namespace_5a51aa78ea0b1b9f::stop_emp_scramble(var_5c46a6026a0b4d43);
    }
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19f9
// Size: 0x3c
function function_dba08b318eb4224d(enemytarget, var_cff38bae1f51bbbf) {
    thread function_de45ed589c44b1b6(enemytarget, var_cff38bae1f51bbbf);
    thread function_f6ff6461277e08e7(enemytarget, var_cff38bae1f51bbbf);
    thread function_5fdece59c0ffc021(enemytarget, var_cff38bae1f51bbbf);
    thread function_9ad53f155f459571(enemytarget, var_cff38bae1f51bbbf);
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a3c
// Size: 0x6f
function function_f6ff6461277e08e7(enemytarget, var_cff38bae1f51bbbf) {
    self endon("death");
    self endon("destroyed");
    self endon("lost_target_" + var_cff38bae1f51bbbf);
    self endon("disable_" + "super_sound_veil");
    level endon("game_ended");
    if (isplayer(enemytarget)) {
        enemytarget waittill_any_2("death_or_disconnect", "killed_player");
    } else {
        enemytarget waittill("death");
    }
    self notify("lost_target_" + var_cff38bae1f51bbbf);
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ab2
// Size: 0x7b
function function_5fdece59c0ffc021(enemytarget, var_cff38bae1f51bbbf) {
    self endon("death");
    self endon("destroyed");
    self endon("lost_target_" + var_cff38bae1f51bbbf);
    self endon("disable_" + "super_sound_veil");
    level endon("game_ended");
    while (isdefined(enemytarget)) {
        if (!isdefined(enemytarget.vehicle)) {
            if (!function_669bd251f952db32(enemytarget)) {
                break;
            }
        }
        if (!function_47bba92311467ca4(enemytarget)) {
            break;
        }
        waitframe();
    }
    self notify("lost_target_" + var_cff38bae1f51bbbf);
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b34
// Size: 0x51
function function_9ad53f155f459571(enemytarget, var_cff38bae1f51bbbf) {
    self endon("death");
    self endon("destroyed");
    self endon("lost_target_" + var_cff38bae1f51bbbf);
    self endon("disable_" + "super_sound_veil");
    level endon("game_ended");
    enemytarget waittill("using_remote");
    self notify("lost_target_" + var_cff38bae1f51bbbf);
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b8c
// Size: 0x4a
function function_de45ed589c44b1b6(enemytarget, var_cff38bae1f51bbbf) {
    self endon("death");
    self endon("destroyed");
    level endon("game_ended");
    waittill_any_2("lost_target_" + var_cff38bae1f51bbbf, "disable_" + "super_sound_veil");
    function_61d589d2064b53f2(enemytarget);
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bdd
// Size: 0x35
function function_3e3ba6dfdea9465b() {
    self notify("disable_" + "super_sound_veil");
    self setscriptablepartstate("activate", "neutral", 0);
    self setscriptablepartstate("arm", "neutral", 0);
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c19
// Size: 0x39
function function_a322c0dd80d5eff7() {
    self setscriptablepartstate("arm", "active", 0);
    self setscriptablepartstate("activate", "neutral", 0);
    self setscriptablepartstate("trigger", "neutral", 0);
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c59
// Size: 0x3a
function function_58224ad5db7ba3ef(enemytarget) {
    enemytarget.var_baf99ff6e658c413 = 1;
    self.usedcount++;
    self.var_89ee7eba7b1862cf[self.var_89ee7eba7b1862cf.size] = enemytarget;
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c9a
// Size: 0x84
function function_3c43dcc55621952a(enemytarget) {
    if (isdefined(self) && self.var_89ee7eba7b1862cf.size > 0) {
        foreach (target in self.var_89ee7eba7b1862cf) {
            if (isdefined(target) && isdefined(enemytarget) && target == enemytarget) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d26
// Size: 0x35
function function_61d589d2064b53f2(enemytarget) {
    if (isdefined(enemytarget)) {
        enemytarget.var_baf99ff6e658c413 = undefined;
        self.var_89ee7eba7b1862cf = array_remove(self.var_89ee7eba7b1862cf, enemytarget);
    }
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d62
// Size: 0x65
function function_77bbce9593e3b2cc() {
    if (isdefined(self.var_89ee7eba7b1862cf)) {
        foreach (target in self.var_89ee7eba7b1862cf) {
            function_61d589d2064b53f2(target);
        }
    }
}

// Namespace sound_veil/namespace_f4f0e3ec4c6dce27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dce
// Size: 0x16
function function_49197cd063a740ea(callbackfunction) {
    self.var_d1659ed0a33bf98f = callbackfunction;
}

