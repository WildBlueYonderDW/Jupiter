// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using scripts\mp\weapons.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using script_2669878cf5a1b6bc;
#using script_5762ac2f22202ba2;
#using script_16ea1b94f0f381b3;
#using script_1ed1214969b5eba7;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\cp_mp\ent_manager.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\mp\damage.gsc;
#using script_736dec95a49487a6;
#using script_5f903436642211af;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\mp\equipment_interact.gsc;
#using scripts\mp\perks\perk_equipmentping.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\analyticslog.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\equipment\trophy_system.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\equipment\snapshot_grenade.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\battlechatter_mp.gsc;

#namespace trophy_system;

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x815
// Size: 0x161
function trophy_init() {
    var_2fc780a60bf174fc = spawnstruct();
    var_2fc780a60bf174fc.var_89c25693a4a496ff = [];
    var_a0cfb5f5550d1c3b = namespace_4a3033eafa6fd07::function_bf9c7e9dd30180e3("super_trophy");
    if (!isdefined(var_a0cfb5f5550d1c3b)) {
        var_a0cfb5f5550d1c3b = spawnstruct();
    }
    if (isdefined(var_a0cfb5f5550d1c3b.var_79d1530167958e93) && var_a0cfb5f5550d1c3b.var_79d1530167958e93.size > 0) {
        foreach (idx, barrel in var_a0cfb5f5550d1c3b.var_79d1530167958e93) {
            var_2fc780a60bf174fc.var_89c25693a4a496ff[idx] = barrel;
        }
    } else {
        for (idx = 0; idx < 3; idx++) {
            barrel = spawnstruct();
            barrel.tag = "tag_barrel_" + idx + 1;
            barrel.part = "barrel" + idx + 1;
            var_2fc780a60bf174fc.var_89c25693a4a496ff[idx] = barrel;
        }
    }
    var_2fc780a60bf174fc.timeout = getdvarfloat(@"hash_d9b119233df13ac1", 45);
    var_2fc780a60bf174fc.var_24e6fadd4ed4be59 = function_53c4c53197386572(var_a0cfb5f5550d1c3b.var_328d916a2837b8b1, "trophy_system_mp_explode");
    level.trophy = var_2fc780a60bf174fc;
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x97d
// Size: 0x2a
function trophy_set(equipmentref, slot, variantid) {
    trophy_clearstored();
    trophy_populatestored();
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ae
// Size: 0x3
function trophy_onsuperset() {
    
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b8
// Size: 0x1b
function trophy_unset(equipmentref, slot) {
    trophy_clearstored();
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9da
// Size: 0x52
function private function_1d2418d7aa544534() {
    self endon("death");
    self.owner endon("disconnect");
    self endon("missile_stuck");
    var_71c76f81eb0c95ee = var_53f81081d4e7f40b = var_850fdf3fb1c7eb84 = self waittill("missile_water_impact");
    thread function_74c86105e1bfe367(var_53f81081d4e7f40b);
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa33
// Size: 0x79
function private function_74c86105e1bfe367(var_53f81081d4e7f40b) {
    self endon("death");
    self.owner endon("disconnect");
    self endon("missile_stuck");
    var_2d760ab785734b07 = 0;
    while (var_2d760ab785734b07 < 20) {
        var_2d760ab785734b07 = abs(var_53f81081d4e7f40b[2] - self.origin[2]);
        if (var_2d760ab785734b07 > 20) {
            self.owner thread function_90dfe835641ca526();
            thread trophy_shutdownanddestroy(0);
        }
        waitframe();
    }
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab3
// Size: 0x27
function function_90dfe835641ca526() {
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        delaythread(2.5, &function_ffb7ecaf8fce4a9a);
    } else {
        namespace_85d036cb78063c4a::refundsuper();
    }
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae1
// Size: 0x8e
function function_ffb7ecaf8fce4a9a() {
    var_60227bff1e9478cc = spawnstruct();
    var_60227bff1e9478cc.scriptablename = "brloot_offhand_trophysystem";
    var_60227bff1e9478cc.origin = self.origin;
    var_60227bff1e9478cc.count = 1;
    var_60227bff1e9478cc.var_8598d3d3bc3d9ceb = 1;
    var_1a33360665b6bb36 = 0;
    if (isdefined(self.super) && istrue(self.var_1066fbd86c88a6df)) {
        var_1a33360665b6bb36 = 1;
    }
    namespace_cb965d2f71fefddc::function_b5f5576a0017c089(var_60227bff1e9478cc, undefined, self, undefined, undefined, undefined, var_1a33360665b6bb36);
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb76
// Size: 0x15e
function function_857afda0a870989f(grenade) {
    level endon("game_ended");
    self endon("disconnect");
    grenade endon("death");
    var_5f0b7d8e7d0627b8 = getdvarint(@"hash_d57482b850330a6", 150);
    grenade childthread function_1d2418d7aa544534();
    while (1) {
        grenade childthread trophy_watch_flight(self);
        hitnormal = position = velocity = surfacetype = var_b3fcd958f4d7876e = var_82d5e3b42d0191c9 = grenade waittill("missile_stuck");
        var_cb4d3248c7f2eadf = 0;
        if (isdefined(var_82d5e3b42d0191c9)) {
            if (var_82d5e3b42d0191c9 namespace_1f188a13f7e79610::isvehicle()) {
                if (isdefined(var_b3fcd958f4d7876e)) {
                    var_b3fcd958f4d7876e = namespace_dbbb37eb352edf96::function_8ed0ffa3f8be7c75(var_b3fcd958f4d7876e);
                    var_394b941c42b43ba0 = issubstr(var_b3fcd958f4d7876e, "wheel");
                    if (var_394b941c42b43ba0) {
                        var_cb4d3248c7f2eadf = 1;
                    }
                }
            }
        }
        if (var_cb4d3248c7f2eadf) {
            grenade unlink();
            offsetvec = hitnormal + self gettagorigin("j_spineupper") - grenade.origin;
            neworigin = grenade.origin + vectornormalize(offsetvec) * 10;
            grenade = namespace_68e641469fde3fa7::_launchgrenade("trophy_mp", neworigin, hitnormal * var_5f0b7d8e7d0627b8, undefined, 1, grenade);
        } else {
            break;
        }
    }
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcdc
// Size: 0x41d
function trophy_used(grenade) {
    grenade endon("death");
    self endon("disconnect");
    printgameaction("trophy spawned", self);
    grenade.bundle = namespace_4a3033eafa6fd07::function_bf9c7e9dd30180e3("super_trophy");
    grenade namespace_2a9588dfac284b77::registerspawn(2, &sweeptrophy);
    thread namespace_3bbb5a98b932c46f::monitordisownedgrenade(self, grenade);
    grenade thread function_1d2418d7aa544534();
    grenade thread trophy_hideandshowaftertime();
    function_857afda0a870989f(grenade);
    if (isdefined(level.var_ca4e08767cbdae12)) {
        var_425925a45729deae = grenade [[ level.var_ca4e08767cbdae12 ]]();
        if (!var_425925a45729deae) {
            namespace_85d036cb78063c4a::refundsuper();
            namespace_44abc05161e2e2cb::showerrormessage("EQUIPMENT/PLANT_FAILED");
            grenade delete();
            return;
        }
    }
    grenade setotherent(self);
    grenade setnodeploy(1);
    grenade.issuper = isdefined(self.super) && self.super.staticdata.ref == "super_trophy";
    grenade.superid = level.superglobals.staticsuperdata["super_trophy"].id;
    grenade.usedcount = 0;
    grenade.deployingplayer = self;
    var_307667d0142f2035 = _hasperk("specialty_rugged_eqp");
    if (var_307667d0142f2035) {
        grenade.hasruggedeqp = 1;
    }
    if (!istrue(grenade.issuper)) {
        grenade.ammo = trophy_removestored();
        if (!isdefined(grenade.ammo)) {
            grenade.ammo = 3;
        }
        /#
            if (getdvarint(@"hash_20d714b15057681f", 0) == 1) {
                grenade.ammo = 3;
            }
        #/
        grenade thread makeexplosiveusabletag("tag_use", 1);
    } else {
        grenade.ammo = 3;
    }
    onequipmentplanted(grenade, "equip_trophy", &trophy_shutdownanddestroy);
    thread monitordisownedequipment(self, grenade);
    grenade namespace_6d9917c3dc05dbe9::registersentient("Tactical_Static", self);
    grenade.explosion = trophy_createexplosion(grenade);
    var_b466b364114d5ae5 = function_53c4c53197386572(grenade.bundle.var_f96f1b8352a4d4e9, 100);
    var_e2fd764179de2d27 = function_53c4c53197386572(grenade.bundle.var_d37a7103c63003c4, 200);
    maxhealth = ter_op(var_307667d0142f2035, var_e2fd764179de2d27, var_b466b364114d5ae5);
    damagefeedback = "hitequip";
    grenade thread namespace_3e725f3cc58bddd3::monitordamage(maxhealth, damagefeedback, &trophy_handlefataldamage, &trophy_handledamage, 0);
    grenade function_641996b5e113c5c6(grenade, &trophy_applyempcallback);
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        grenade [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_ef909a912567cbd8);
    }
    if (issharedfuncdefined("emp", "setEMP_Cleared_Callback")) {
        grenade [[ getsharedfunc("emp", "setEMP_Cleared_Callback") ]](&function_dac6193dd5a71f4b);
    }
    grenade namespace_b6b4a3ac458ab6e2::function_172d848d58051fdf(&function_fa497ea83e7adc8c);
    grenade function_49197cd063a740ea(&trophy_destroy);
    if (isdefined(level.elevators)) {
        foreach (elevators in level.elevators) {
            if (!isdefined(elevators)) {
                continue;
            }
            elevators thread namespace_272931699e2fe8e9::function_5c07037726ae5001(grenade);
        }
    }
    if (issharedfuncdefined(#"hash_d8976e21a6adafba", #"hash_ca0042e3cac99672")) {
        grenade [[ getsharedfunc(#"hash_d8976e21a6adafba", #"hash_ca0042e3cac99672") ]](grenade);
    }
    grenade setscriptablepartstate("visibility", "show", 0);
    grenade thread trophy_deploy();
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1100
// Size: 0x12f
function trophy_watch_flight(player) {
    self endon("death");
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
    if (traceresults["fraction"] < 1) {
        groundentity = traceresults["entity"];
        if (isdefined(groundentity)) {
            if (is_train_ent(groundentity)) {
                self.origin = player.origin;
            }
        }
    }
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1236
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

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12de
// Size: 0xf
function function_da07fdc88865707a(target) {
    /#
    #/
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12f4
// Size: 0x124
function trophy_deploy() {
    self endon("death");
    self setscriptablepartstate("effects", "activeLand");
    wait(0.1);
    thread trophy_deployanimation();
    wait(0.2);
    self.headiconid = namespace_7bdde15c3500a23f::setheadicon_factionimage(0, 25, undefined, undefined, undefined, undefined, 1);
    thread outlineequipmentforowner(self);
    if (getdvarint(@"hash_a0495fcfca0849aa", 0) != 0) {
        /#
            if (getdvarint(@"hash_2fb6b2a16c2792d0", 0) != 0) {
                thread function_281b0f9d6b4c66ad(45, 325, &function_9f13cc66529c6e8f, &function_da07fdc88865707a, 1);
            }
        #/
        thread function_281b0f9d6b4c66ad(45, 325, &function_9f13cc66529c6e8f, &function_509f8c901a3ae35, 0);
    } else {
        thread trophy_watchprotection(45, 105625, &function_9f13cc66529c6e8f, &function_509f8c901a3ae35);
    }
    thread trophy_watchtimeoutorgameended();
    thread namespace_43a68cf8c122ab9::remoteinteractsetup(&trophy_remote_destroy, 1, 1);
    thread namespace_90b872e9b61df82b::runequipmentping();
    self.owner namespace_aad14af462a74d08::function_d997435895422ecc("super_trophy", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
    /#
        if (0) {
            function_b96541d92295c9ca();
        }
    #/
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x141f
// Size: 0x33
function trophy_deployanimation() {
    self endon("death");
    self setscriptablepartstate("effects", "activeDeployStart");
    wait(trophy_getdeployanimtime());
    self setscriptablepartstate("effects", "activeDeployEnd");
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1459
// Size: 0x51
function trophy_hideandshowaftertime() {
    self endon("death");
    self endon("missile_stuck");
    var_722684af55e05749 = getdvarfloat(@"hash_64483ec1fd3d3c77", 0);
    self setscriptablepartstate("visibility", "hide", 0);
    wait(var_722684af55e05749);
    self setscriptablepartstate("visibility", "show", 0);
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14b1
// Size: 0x15
function trophy_remote_destroy(player) {
    trophy_destroy(1);
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14cd
// Size: 0x1e
function sweeptrophy() {
    thread trophy_delete(0);
    self setscriptablepartstate("effects", "activeDestroyEnd", 0);
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14f2
// Size: 0x2c
function trophy_destroy(var_4fac8b8ce36e09f1) {
    thread trophy_delete(0.1, var_4fac8b8ce36e09f1);
    self setscriptablepartstate("effects", "activeDestroyEnd", 0);
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1525
// Size: 0x4b
function trophy_shutdownanddestroy(var_4fac8b8ce36e09f1) {
    level endon("game_ended");
    thread trophy_delete(2.6, var_4fac8b8ce36e09f1);
    self setscriptablepartstate("effects", "activeDestroyStart", 0);
    wait(2.5);
    self setscriptablepartstate("effects", "activeDestroyEnd", 0);
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1577
// Size: 0x168
function trophy_delete(var_cbf7be4f62a0ddb2, var_4fac8b8ce36e09f1) {
    self notify("death");
    self setscriptablepartstate("hack_usable", "off");
    self.owner namespace_aad14af462a74d08::function_d997435895422ecc("super_trophy", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"end"), self.usedcount);
    namespace_bd0162aedd8c8594::logevent_fieldupgradeexpired(self.owner, self.superid, self.usedcount, istrue(var_4fac8b8ce36e09f1));
    level.mines[self getentitynumber()] = undefined;
    self setcandamage(0);
    if (!istrue(self.issuper)) {
        self makeunusable();
        makeexplosiveunusuabletag();
    }
    namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.headiconid);
    self.headiconid = undefined;
    self.exploding = 1;
    if (isdefined(self.owner)) {
        self.owner notify("trophy_update", 0);
        self.owner removeequip(self);
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

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16e6
// Size: 0x231
function function_d614b6efd4de7093(trophy_castcontents, var_2cc97e113610ca14, var_5b95596970b49b4, var_d0b9c256ce9d59f4) {
    namespace_36f464722d326bbe::function_f5e8b13acc5b4e24();
    foreach (targetarray in level.var_715aa7f8de54c394 function_df633f460888a47(self.origin)) {
        foreach (var_1dbabe317739127e in targetarray) {
            if (!isdefined(var_1dbabe317739127e)) {
                continue;
            }
            if (istrue(var_1dbabe317739127e.exploding)) {
                continue;
            }
            if (var_1dbabe317739127e == self) {
                continue;
            }
            if (trophy_checkignorelist(var_1dbabe317739127e)) {
                continue;
            }
            var_1ba7b2d16dc215e1 = var_1dbabe317739127e.owner;
            if (!isdefined(var_1ba7b2d16dc215e1) && isdefined(var_1dbabe317739127e.vehicle)) {
                var_1ba7b2d16dc215e1 = var_1dbabe317739127e.vehicle.owner;
            }
            if (!isdefined(var_1ba7b2d16dc215e1) && isdefined(var_1dbabe317739127e.weapon_name) && weaponclass(var_1dbabe317739127e.weapon_name) == "grenade") {
                var_1ba7b2d16dc215e1 = getmissileowner(var_1dbabe317739127e);
            }
            var_f31940d93afc41db = 1;
            /#
                if (getdvarint(@"hash_3c6c485214ca7673", 0) == 1) {
                    var_f31940d93afc41db = 0;
                }
            #/
            if (var_f31940d93afc41db) {
                jumpiffalse(isdefined(var_1ba7b2d16dc215e1) && !istrue(namespace_f8065cafc523dba5::playersareenemies(self.owner, var_1ba7b2d16dc215e1))) LOC_000001a4;
            } else {
            LOC_000001a4:
                if (distancesquared(var_1dbabe317739127e.origin, self.origin) > trophy_modifiedprotectiondistsqr(var_1dbabe317739127e, var_5b95596970b49b4)) {
                    continue;
                }
                var_e021c2744cc7ed68 = physics_raycast(var_2cc97e113610ca14, var_1dbabe317739127e.origin, trophy_castcontents, [0:self, 1:var_1dbabe317739127e], 0, "physicsquery_closest");
                if (isdefined(var_e021c2744cc7ed68) && var_e021c2744cc7ed68.size > 0) {
                    continue;
                }
                self [[ var_d0b9c256ce9d59f4 ]](var_1dbabe317739127e);
            }
        }
    }
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x191e
// Size: 0x82
function trophy_watchprotection(var_69e07c42d3e11801, var_5b95596970b49b4, var_b701d494f3ae184f, var_d0b9c256ce9d59f4) {
    self endon("death");
    trophy_castcontents = trophy_castcontents();
    while ([[ var_b701d494f3ae184f ]]()) {
        if (istrue(self.isdisabled) || istrue(self.isjammed)) {
            waitframe();
            continue;
        }
        var_2cc97e113610ca14 = trophy_castorigin(var_69e07c42d3e11801);
        function_d614b6efd4de7093(trophy_castcontents, var_2cc97e113610ca14, var_5b95596970b49b4, var_d0b9c256ce9d59f4);
        waitframe();
    }
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x19a7
// Size: 0xc1
function function_1b7a7b44f46c24df(ents, var_cf0b868d38a1e6c3) {
    /#
        println("entity");
        foreach (entnum, e in ents) {
            println(entnum);
        }
        println("grenade");
        foreach (entnum, e in var_cf0b868d38a1e6c3) {
            println(entnum);
        }
        /#
            assertmsg("explode1");
        #/
    #/
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a6f
// Size: 0x14e
function function_15592e4d9e958065(ents) {
    /#
        var_cf0b868d38a1e6c3 = [];
        namespace_36f464722d326bbe::function_f5e8b13acc5b4e24();
        foreach (targetarray in level.var_715aa7f8de54c394 function_df633f460888a47(self.origin)) {
            foreach (var_1dbabe317739127e in targetarray) {
                var_cf0b868d38a1e6c3[var_1dbabe317739127e getentitynumber()] = var_1dbabe317739127e;
            }
        }
        if (ents.size != var_cf0b868d38a1e6c3.size) {
            function_1b7a7b44f46c24df(ents, var_cf0b868d38a1e6c3);
        }
        foreach (e in ents) {
            entnum = e getentitynumber();
            if (!isdefined(var_cf0b868d38a1e6c3[entnum])) {
                function_1b7a7b44f46c24df(ents, var_cf0b868d38a1e6c3);
            }
        }
    #/
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1bc4
// Size: 0x22
function function_4f556f0dda3cc79d(var_1dbabe317739127e) {
    /#
        level.var_28e720832f5f98a6[var_1dbabe317739127e getentitynumber()] = 1;
    #/
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1bed
// Size: 0xca
function function_6a0da54618dea55c(ents, trophy_castcontents, var_2cc97e113610ca14, var_5b95596970b49b4) {
    /#
        level.var_28e720832f5f98a6 = [];
        function_d614b6efd4de7093(trophy_castcontents, var_2cc97e113610ca14, var_5b95596970b49b4, &function_4f556f0dda3cc79d);
        if (ents.size != level.var_28e720832f5f98a6.size) {
            function_1b7a7b44f46c24df(ents, level.var_28e720832f5f98a6);
        }
        foreach (entnum, e in ents) {
            if (!isdefined(level.var_28e720832f5f98a6[entnum])) {
                function_1b7a7b44f46c24df(ents, level.var_28e720832f5f98a6);
            }
        }
    #/
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cbe
// Size: 0x2bd
function function_281b0f9d6b4c66ad(var_69e07c42d3e11801, var_4ae78ef03ac4997a, var_b701d494f3ae184f, var_d0b9c256ce9d59f4, var_f7e60faaa2858052) {
    self endon("death");
    trophy_castcontents = trophy_castcontents();
    typemask = function_869ccb4e3451b8c6([0:"etype_missile", 1:"etype_vehicle"]);
    var_5b95596970b49b4 = var_4ae78ef03ac4997a * var_4ae78ef03ac4997a;
    /#
        var_38e0fc2c9ac78ec0 = [];
    #/
    while ([[ var_b701d494f3ae184f ]]()) {
        if (istrue(self.isdisabled) || istrue(self.isjammed)) {
            waitframe();
            continue;
        }
        /#
            if (var_f7e60faaa2858052) {
                var_38e0fc2c9ac78ec0 = [];
            }
        #/
        var_2cc97e113610ca14 = trophy_castorigin(var_69e07c42d3e11801);
        ents = function_b1eef70090b5b7b5(self.origin, 500, typemask, [0:self]);
        foreach (var_1dbabe317739127e in ents) {
            if (!isdefined(var_1dbabe317739127e)) {
                continue;
            }
            if (istrue(var_1dbabe317739127e.exploding)) {
                continue;
            }
            if (trophy_checkignorelist(var_1dbabe317739127e)) {
                continue;
            }
            var_1ba7b2d16dc215e1 = var_1dbabe317739127e.owner;
            if (!isdefined(var_1ba7b2d16dc215e1) && isdefined(var_1dbabe317739127e.vehicle)) {
                var_1ba7b2d16dc215e1 = var_1dbabe317739127e.vehicle.owner;
            }
            if (!isdefined(var_1ba7b2d16dc215e1) && isdefined(var_1dbabe317739127e.weapon_name) && weaponclass(var_1dbabe317739127e.weapon_name) == "grenade") {
                var_1ba7b2d16dc215e1 = getmissileowner(var_1dbabe317739127e);
            }
            var_f31940d93afc41db = 1;
            /#
                if (getdvarint(@"hash_3c6c485214ca7673", 0) == 1) {
                    var_f31940d93afc41db = 0;
                }
            #/
            if (var_f31940d93afc41db) {
                jumpiffalse(isdefined(var_1ba7b2d16dc215e1) && !istrue(namespace_f8065cafc523dba5::playersareenemies(self.owner, var_1ba7b2d16dc215e1))) LOC_00000214;
            } else {
            LOC_00000214:
                if (distancesquared(var_1dbabe317739127e.origin, self.origin) > trophy_modifiedprotectiondistsqr(var_1dbabe317739127e, var_5b95596970b49b4)) {
                    continue;
                }
                var_e021c2744cc7ed68 = physics_raycast(var_2cc97e113610ca14, var_1dbabe317739127e.origin, trophy_castcontents, [0:self, 1:var_1dbabe317739127e], 0, "physicsquery_closest");
                if (isdefined(var_e021c2744cc7ed68) && var_e021c2744cc7ed68.size > 0) {
                    continue;
                }
                /#
                    if (var_f7e60faaa2858052) {
                        var_38e0fc2c9ac78ec0[var_1dbabe317739127e getentitynumber()] = 1;
                    }
                #/
                self [[ var_d0b9c256ce9d59f4 ]](var_1dbabe317739127e);
            }
        }
        /#
            if (var_f7e60faaa2858052) {
                function_6a0da54618dea55c(var_38e0fc2c9ac78ec0, trophy_castcontents, var_2cc97e113610ca14, var_5b95596970b49b4);
            }
        #/
        waitframe();
    }
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f82
// Size: 0xd
function function_9f13cc66529c6e8f() {
    return isdefined(self.owner);
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f97
// Size: 0x15
function function_509f8c901a3ae35(var_1dbabe317739127e) {
    thread function_df73a01c76de4b5c(var_1dbabe317739127e);
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1fb3
// Size: 0x58
function private function_ba83e8dc816c34b(var_1dbabe317739127e) {
    var_f081f86b3a475009 = 1;
    if (!isdefined(var_1dbabe317739127e)) {
        return var_f081f86b3a475009;
    }
    if (!isdefined(var_1dbabe317739127e.weapon_name)) {
        return var_f081f86b3a475009;
    }
    switch (var_1dbabe317739127e.weapon_name) {
    case #"hash_5c272c0617caebf0":
        var_f081f86b3a475009 = 3;
        break;
    }
    return var_f081f86b3a475009;
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2013
// Size: 0x137
function private function_df73a01c76de4b5c(var_1dbabe317739127e) {
    self endon("death");
    self.owner endon("disconnect");
    level endon("game_end");
    self.owner thread namespace_d576b6dc7cef9c62::threadedsetweaponstatbyname("trophy_mp", 1, "hits");
    self.owner namespace_3c5a4254f2b957ea::incpersstat("trophySystemHits", 1);
    self.owner namespace_85d036cb78063c4a::combatrecordsupermisc("super_trophy");
    self.usedcount++;
    /#
        if (0) {
            namespace_832187ad8517bd27::function_1e892f6dd85d5b9c(var_1dbabe317739127e);
        }
    #/
    var_edad871174aa4c18 = var_1dbabe317739127e.origin;
    var_4f60747b7042e21f = trophy_modifiedprotectiondistsqr(var_1dbabe317739127e, 105625);
    var_72638b7e8b50d411 = var_1dbabe317739127e.spawnpos;
    numshots = function_ba83e8dc816c34b(var_1dbabe317739127e);
    if (self.ammo >= numshots) {
        function_477783276ea16601(var_1dbabe317739127e);
        self.owner namespace_58a74e7d54b56e8d::givescorefortrophyblocks();
        logtrophysuccesful(var_1dbabe317739127e);
    }
    for (i = 0; i < numshots; i++) {
        childthread function_363a32a7a77c9fe0(var_edad871174aa4c18, i, var_4f60747b7042e21f);
        wait(0.2);
    }
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2151
// Size: 0x168
function private function_363a32a7a77c9fe0(var_75b2197d2c846c44, shotnum, var_28ec07131b11812b) {
    if (self.ammo <= 0) {
        thread trophy_shutdownanddestroy(0);
        return 0;
    }
    var_d7030318ca9e674a = var_75b2197d2c846c44;
    var_c96a7e0d1ec7bc53 = function_ef4a284b37373510(var_d7030318ca9e674a, var_28ec07131b11812b);
    if (var_c96a7e0d1ec7bc53) {
        var_d7030318ca9e674a = function_514a12868913d9b7(var_d7030318ca9e674a);
    }
    if (shotnum > 1) {
        var_d7030318ca9e674a = function_b2e78337c5df1c34(var_d7030318ca9e674a);
    }
    barrel = function_bf727b4b45ca91de(var_d7030318ca9e674a);
    tag = barrel.tag;
    part = barrel.part;
    self setscriptablepartstate(part, "active", 0);
    var_1331aefd6d9a100 = vectortoangles(self gettagorigin(tag) - var_d7030318ca9e674a);
    var_cc29543de9737588 = combineangles(var_1331aefd6d9a100, (-90, 0, 0));
    self.explosion thread trophy_explode(var_d7030318ca9e674a, var_cc29543de9737588);
    self setscriptablepartstate("sfx_" + part, "fire", 0);
    self.ammo--;
    /#
        if (getdvarint(@"hash_20d714b15057681f", 0) == 1) {
            self.ammo = 3;
        }
    #/
    if (self.ammo <= 0) {
        thread trophy_shutdownanddestroy(0);
    }
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x22c0
// Size: 0x25
function private function_ef4a284b37373510(var_b4efcfbd69fc05e4, var_28ec07131b11812b) {
    return distancesquared(var_b4efcfbd69fc05e4, self.origin) < var_28ec07131b11812b;
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x22ed
// Size: 0x53
function private function_514a12868913d9b7(var_d7030318ca9e674a) {
    var_cf6ccb76c65463e3 = var_d7030318ca9e674a;
    var_6bdb8335862f56ee = min(1 - 24 / length(self.origin - var_d7030318ca9e674a), 1);
    var_cf6ccb76c65463e3 = vectorlerp(self.origin, var_cf6ccb76c65463e3, var_6bdb8335862f56ee);
    return var_cf6ccb76c65463e3;
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2348
// Size: 0x10f
function private function_b2e78337c5df1c34(var_5c1a8852fefebef5) {
    var_f95c4b9d1740f23b = 0.05;
    var_e5006c8cd0e8153a = randomfloatrange(0.9, 1.1);
    var_8413896733593a21 = randomfloatrange(0.9, 1.1);
    var_ab91c9ec1fae3ab8 = randomfloatrange(0.8, 1.2);
    x = var_5c1a8852fefebef5[0];
    y = var_5c1a8852fefebef5[1];
    z = var_5c1a8852fefebef5[2];
    var_b5c4765694e99f2a = x * var_e5006c8cd0e8153a;
    var_7898d81eae47ece1 = y * var_8413896733593a21;
    z_delta = z * var_ab91c9ec1fae3ab8;
    if (abs(x - var_b5c4765694e99f2a) < x * var_f95c4b9d1740f23b) {
        var_b5c4765694e99f2a = var_b5c4765694e99f2a + var_b5c4765694e99f2a * var_f95c4b9d1740f23b;
    }
    if (abs(y - var_7898d81eae47ece1) < y * var_f95c4b9d1740f23b) {
        var_7898d81eae47ece1 = var_7898d81eae47ece1 + var_7898d81eae47ece1 * var_f95c4b9d1740f23b;
    }
    if (abs(z - z_delta) < z * var_f95c4b9d1740f23b) {
        z_delta = z_delta + z_delta * var_f95c4b9d1740f23b;
    }
    return (var_b5c4765694e99f2a, var_7898d81eae47ece1, z_delta);
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x245f
// Size: 0x5e
function function_477783276ea16601(var_1dbabe317739127e) {
    var_1dbabe317739127e setcandamage(0);
    var_1dbabe317739127e stopsounds();
    trophy_notifytrophytargetowner(var_1dbabe317739127e, "trophy_mp", self.owner);
    trophy_tryreflectsnapshot(var_1dbabe317739127e, var_1dbabe317739127e.owner, self.owner);
    if (!var_1dbabe317739127e namespace_1a507865f681850e::ondestroyedbytrophy()) {
        var_1dbabe317739127e delete();
    }
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24c4
// Size: 0xc0
function trophy_tryreflectsnapshot(var_1dbabe317739127e, victim, attacker) {
    if (!isdefined(var_1dbabe317739127e.equipmentref) || var_1dbabe317739127e.equipmentref != "equip_snapshot_grenade") {
        return;
    }
    if (!isdefined(var_1dbabe317739127e.owner) || !isdefined(self.owner)) {
        return;
    }
    if (!isreallyalive(victim)) {
        return;
    }
    owner = attacker;
    position = victim.origin;
    var_7aa1ff687cfc30d1 = namespace_ce72036f17f28af2::snapshot_grenade_createoutlinedata(owner, position, self.bundle);
    namespace_ce72036f17f28af2::snapshot_grenade_applysnapshot(victim, attacker, var_7aa1ff687cfc30d1, undefined, undefined, undefined, self.bundle);
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x258b
// Size: 0x1a
function trophy_watchtimeoutorgameended() {
    self endon("death");
    trophy_watchtimeoutorgameendedinternal();
    thread trophy_shutdownanddestroy(0);
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25ac
// Size: 0x3c
function trophy_watchtimeoutorgameendedinternal() {
    level endon("game_ended");
    timeout = level.trophy.timeout;
    if (!isdefined(timeout)) {
        timeout = 45;
    }
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(timeout);
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25ef
// Size: 0x9b
function trophy_handledamage(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    modifieddamage = damage;
    modifieddamage = utility::handlemeleedamage(objweapon, type, modifieddamage);
    modifieddamage = namespace_3e725f3cc58bddd3::handleapdamage(objweapon, type, modifieddamage, attacker);
    namespace_3bbb5a98b932c46f::equipmenthit(self.owner, attacker, objweapon, type);
    return modifieddamage;
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2692
// Size: 0x51
function trophy_handlefataldamage(data) {
    self notify("enemy_destroyed_equipment", data.attacker);
    data.victim trophy_givepointsfordeath(data.attacker);
    data.victim thread trophy_destroy(1);
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26ea
// Size: 0x34
function trophy_applyempcallback(data) {
    self notify("enemy_destroyed_equipment", data.attacker);
    data.victim thread trophy_destroy(1);
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2725
// Size: 0x3e
function function_fa497ea83e7adc8c(data) {
    data.victim trophy_givepointsfordeath(data.attacker);
    data.victim thread trophy_destroy(1);
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x276a
// Size: 0x4d
function function_ef909a912567cbd8(data) {
    self endon("death");
    self.isdisabled = 1;
    self setscriptablepartstate("empd", "active", 0);
    if (!isdefined(data.ksemp)) {
        wait(6);
        function_dac6193dd5a71f4b(data);
    }
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27be
// Size: 0x2f
function function_dac6193dd5a71f4b(data) {
    self endon("death");
    self.isdisabled = 0;
    self setscriptablepartstate("empd", "neutral", 0);
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27f4
// Size: 0x33
function trophy_pickup() {
    if (self.owner namespace_1a507865f681850e::hasequipment("equip_trophy")) {
        self.owner trophy_addstored(self.ammo);
    }
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x282e
// Size: 0xf1
function trophy_createexplosion(trophy) {
    explosion = spawn("script_model", trophy.origin);
    explosion.killcament = trophy;
    explosion.owner = trophy.owner;
    explosion.team = trophy.team;
    explosion.equipmentref = trophy.equipmentref;
    explosion.weapon_name = trophy.weapon_name;
    explosion setotherent(explosion.owner);
    explosion setentityowner(explosion.owner);
    explosion setmodel(level.trophy.var_24e6fadd4ed4be59);
    explosion.explode1available = 1;
    explosion thread trophy_cleanuponparentdeath(trophy, 0.1);
    return explosion;
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2927
// Size: 0x78
function trophy_explode(position, angles) {
    self dontinterpolate();
    self.origin = position;
    self.angles = angles;
    if (istrue(self.explode1available)) {
        self setscriptablepartstate("explode1", "activeDirectional", 0);
        self.explode1available = 0;
    } else {
        self setscriptablepartstate("explode2", "activeDirectional", 0);
        self.explode1available = 1;
    }
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29a6
// Size: 0x26
function trophy_castorigin(var_69e07c42d3e11801) {
    return self.origin + anglestoup(self.angles) * var_69e07c42d3e11801;
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29d4
// Size: 0x36
function trophy_castcontents() {
    return physics_createcontents([0:"physicscontents_missileclip", 1:"physicscontents_vehicle", 2:"physicscontents_glass", 3:"physicscontents_water", 4:"physicscontents_item"]);
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a12
// Size: 0xe4
function trophy_modifiedprotectiondistsqr(var_1dbabe317739127e, var_5b95596970b49b4) {
    if (!isdefined(var_1dbabe317739127e)) {
        return var_5b95596970b49b4;
    }
    if (isdefined(var_1dbabe317739127e.weapon_name)) {
        switch (var_1dbabe317739127e.weapon_name) {
        case #"hash_c500a77b6bb7c5d0":
            if (105625 * 1.2 > var_5b95596970b49b4) {
                var_5b95596970b49b4 = 105625 * 1.2;
            }
            break;
        }
    }
    if (isdefined(var_1dbabe317739127e.classname)) {
        switch (var_1dbabe317739127e.classname) {
        case #"hash_4af55147c6098215":
            if (105625 * 2 > var_5b95596970b49b4) {
                var_5b95596970b49b4 = 105625 * 2;
            }
            break;
        case #"hash_8b48887639da2db5":
            if (105625 * 1.2 > var_5b95596970b49b4) {
                var_5b95596970b49b4 = 105625 * 1.2;
            }
            break;
        }
    }
    return var_5b95596970b49b4;
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2afe
// Size: 0x24f
function trophy_checkignorelist(var_1dbabe317739127e) {
    bundle = var_1dbabe317739127e.bundle;
    if (isdefined(bundle) && istrue(bundle.var_c3333778ec49a2c)) {
        return 1;
    }
    weaponname = var_1dbabe317739127e.weapon_name;
    if (!isdefined(weaponname)) {
        weapon_object = var_1dbabe317739127e.weapon_object;
        if (isdefined(weapon_object)) {
            weaponname = weapon_object.basename;
        }
    }
    if (isdefined(var_1dbabe317739127e.streakname)) {
        switch (var_1dbabe317739127e.streakname) {
        case #"hash_6362d6aae3e5a62e":
        case #"hash_7a687f6a4d685110":
            return 1;
            break;
        }
    }
    if (isdefined(weaponname)) {
        if (iskillstreakweapon(weaponname) && weaponname != "chopper_gunner_proj_mp" && !issubstr(weaponname, "missile_turret_proj") && !issubstr(weaponname, "switchblade_drone") && !issubstr(weaponname, "drone_swarm_drone")) {
            return 1;
        }
        if (isaxeweapon(weaponname)) {
            return 1;
        }
        weapon_object = var_1dbabe317739127e.weapon_object;
        if (isdefined(weapon_object) && weapon::function_6faaa2882e3d2e4e(weapon_object)) {
            return 1;
        }
        switch (weaponname) {
        case #"hash_5e3fa526a48eaaa5":
            if (isplantedequipment(var_1dbabe317739127e)) {
                return 1;
            }
            break;
        case #"hash_1a30d3a1753a5b6":
        case #"hash_22f1c67a16accbe":
        case #"hash_34f28162f0f54c6e":
        case #"hash_523f0c8fe1ead306":
        case #"hash_53d34fb712dd4235":
        case #"hash_571e95536d9682a1":
        case #"hash_5907ae753546a1e8":
        case #"hash_5be4c94863c15240":
        case #"hash_5cc52f4b3d579bc3":
        case #"hash_617feab345ee4f01":
        case #"hash_829141045b36cf1c":
        case #"hash_83ef591efa62a73b":
        case #"hash_badacfdae124cc01":
        case #"hash_c4b9b21ecac2ced4":
        case #"hash_cce14c95e4764532":
        case #"hash_e4aed4089cbf3bc9":
        case #"hash_ef5768c3c9f00e10":
        case #"hash_ffdabdde3cb352ca":
            return 1;
            break;
        }
    }
    if (var_1dbabe317739127e namespace_dbbb37eb352edf96::isvehicle() && !istrue(var_1dbabe317739127e.isprojectilekillstreak)) {
        return 1;
    }
    return 0;
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d55
// Size: 0xd6
function trophy_notifytrophytargetowner(var_1dbabe317739127e, var_c1d3b25c841af510, var_6b21ea0780aa76fe) {
    if (!isdefined(var_1dbabe317739127e.owner) || !isplayer(var_1dbabe317739127e.owner)) {
        return;
    }
    var_1dbabe317739127e.owner updatedamagefeedback("hittrophysystem");
    if (isdefined(var_1dbabe317739127e.weapon_name)) {
        switch (var_1dbabe317739127e.weapon_name) {
        case #"hash_5b1e7be1304d43db":
        case #"hash_94c7880dca9ccc3f":
        case #"hash_b23a0686850cd666":
            var_1dbabe317739127e.owner notify("destroyed_by_trophy", var_6b21ea0780aa76fe);
            break;
        }
    }
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e32
// Size: 0x105
function function_bf727b4b45ca91de(position) {
    var_89c25693a4a496ff = level.trophy.var_89c25693a4a496ff;
    bestdot = undefined;
    var_b063722aee092c63 = undefined;
    foreach (id, barrel in var_89c25693a4a496ff) {
        tag = barrel.tag;
        origin = self gettagorigin(tag);
        angles = self gettagangles(tag);
        forward = anglestoforward(angles);
        dot = vectordot(vectornormalize(position - origin), forward);
        if (id == 0 || dot > bestdot) {
            bestdot = dot;
            var_b063722aee092c63 = barrel;
        }
    }
    return var_b063722aee092c63;
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f3f
// Size: 0x4c
function trophy_givepointsfordeath(attacker) {
    if (istrue(namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker))) {
        attacker notify("destroyed_equipment");
        attacker thread doscoreevent(#"destroyed_equipment");
        attacker thread namespace_25c5a6f43bb97b43::onfieldupgradedestroy(#"hash_2a7b7fea9428cd37");
    }
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f92
// Size: 0x11
function trophy_getdeployanimtime() {
    return getanimlength(scriptables%wm_trophy_system_deploy);
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2fab
// Size: 0x42
function trophy_givedamagefeedback(attacker) {
    damagefeedback = "";
    if (istrue(self.hasruggedeqp)) {
        damagefeedback = "hitequip";
    }
    if (isplayer(attacker)) {
        attacker updatedamagefeedback(damagefeedback);
    }
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ff4
// Size: 0x56
function trophy_addstored(ammo) {
    if (!isdefined(self.trophies)) {
        self.trophies = [];
    }
    if (self.trophies.size < trophy_maxstored()) {
        if (!isdefined(ammo)) {
            ammo = 3;
        }
        self.trophies[self.trophies.size] = ammo;
    }
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3051
// Size: 0x5c
function trophy_removestored() {
    if (isdefined(self.trophies) && self.trophies.size > 0) {
        trophy = self.trophies[self.trophies.size - 1];
        self.trophies[self.trophies.size - 1] = undefined;
        return trophy;
    }
    return undefined;
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30b5
// Size: 0xd
function trophy_clearstored() {
    self.trophies = undefined;
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30c9
// Size: 0x38
function trophy_populatestored() {
    maxcharges = namespace_1a507865f681850e::getequipmentmaxammo("equip_trophy");
    for (i = 0; i < maxcharges; i++) {
        trophy_addstored();
    }
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3108
// Size: 0xe
function trophy_maxstored() {
    return namespace_1a507865f681850e::getequipmentmaxammo("equip_trophy");
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x311e
// Size: 0xe2
function trophy_modifieddamage(attacker, victim, sweapon, damage, var_6cac94b6632aa667) {
    if (!isdefined(sweapon)) {
        return [0:damage, 1:var_6cac94b6632aa667];
    }
    if (damage == 0) {
        return [0:damage, 1:var_6cac94b6632aa667];
    }
    var_512d1bc7add3eaa3 = undefined;
    if (namespace_36f464722d326bbe::function_21322da268e71c19()) {
        switch (sweapon) {
        case #"hash_5e3fa526a48eaaa5":
        case #"hash_6f08e94ea93bfaf9":
        case #"hash_f085b57dce639767":
            maxhealth = getdvarint(@"hash_b1d561f9a9241e09", 150);
            var_512d1bc7add3eaa3 = 0.66 * maxhealth;
            break;
        }
    }
    var_b85ff186894ba31e = var_6cac94b6632aa667;
    if (isdefined(var_512d1bc7add3eaa3)) {
        var_b85ff186894ba31e = var_512d1bc7add3eaa3 - damage;
    }
    var_b85ff186894ba31e = min(var_b85ff186894ba31e, var_6cac94b6632aa667);
    return [0:damage, 1:var_b85ff186894ba31e];
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3208
// Size: 0x2c
function trophy_cleanuponparentdeath(parent, delay) {
    self endon("death");
    parent waittill("death");
    wait(delay);
    self delete();
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x323b
// Size: 0xc1
function logtrophysuccesful(var_1dbabe317739127e) {
    if (!isdefined(var_1dbabe317739127e)) {
        return;
    }
    if (!isdefined(self.deployingplayer)) {
        return;
    }
    if (isdefined(var_1dbabe317739127e.owner) && !isplayer(var_1dbabe317739127e.owner)) {
        return;
    }
    if (isdefined(var_1dbabe317739127e.weapon_object)) {
        weaponname = getweaponrootname(var_1dbabe317739127e.weapon_object);
    } else {
        return;
    }
    if (!isdefined(weaponname)) {
        return;
    }
    dlog_recordevent("dlog_event_trophy_successful", [0:"deploying_player", 1:self.deployingplayer, 2:"grenade_owner", 3:var_1dbabe317739127e.owner, 4:"negated_target", 5:weaponname]);
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3303
// Size: 0x16
function function_49197cd063a740ea(callbackfunction) {
    self.var_d1659ed0a33bf98f = callbackfunction;
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3320
// Size: 0x5a
function function_fc792b373d83f8d4(weaponname) {
    var_c3b3f1e6760e03f1 = undefined;
    if (iskillstreakweapon(weaponname)) {
        var_c3b3f1e6760e03f1 = 1;
        switch (weaponname) {
        case #"hash_841e4cad9f0e242e":
        case #"hash_c5c19fe9ae40cd0c":
        case #"hash_f4d2562ef860c1c0":
            var_c3b3f1e6760e03f1 = 0;
            break;
        }
    }
    return var_c3b3f1e6760e03f1;
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3382
// Size: 0x77
function function_d70f6fa2c37c1230(var_c0f9139ffd72e62d) {
    self setscriptablepartstate("hacked", "active", 0);
    sentientpool = self.sentientpool;
    namespace_6d9917c3dc05dbe9::unregistersentient(self.sentientpool, self.sentientpoolindex);
    namespace_6d9917c3dc05dbe9::registersentient(sentientpool, self.owner);
    thread monitordisownedequipment(self.owner, self);
    thread outlineequipmentforowner(self);
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3400
// Size: 0x16
function function_b96541d92295c9ca() {
    /#
        thread function_d146ac9c9d0a4f24();
        thread function_a649727b9944afc2();
    #/
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x341d
// Size: 0xe
function function_194a2d4a0c7509ea() {
    /#
        self notify("<unknown string>");
    #/
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3432
// Size: 0x119
function function_d146ac9c9d0a4f24() {
    /#
        level endon("<unknown string>");
        self endon("<unknown string>");
        self.owner endon("<unknown string>");
        self endon("<unknown string>");
        var_98346911a72d33e1 = 105625;
        var_6e0ae1d28b9e917d = 105625 * 1.2;
        var_6e0aded28b9e8ae4 = 105625 * 2;
        var_98346911a72d33e1 = sqrt(var_98346911a72d33e1);
        var_6e0ae1d28b9e917d = sqrt(var_6e0ae1d28b9e917d);
        var_6e0aded28b9e8ae4 = sqrt(var_6e0aded28b9e8ae4);
        ranges = [];
        ranges[0] = var_98346911a72d33e1;
        ranges[1] = var_6e0ae1d28b9e917d;
        ranges[2] = var_6e0aded28b9e8ae4;
        var_fc62075a9f6e7cab = (1, 0, 0);
        while (1) {
            foreach (range in ranges) {
                sphere(self.origin, range, var_fc62075a9f6e7cab, 0, 1);
            }
            waitframe();
        }
    #/
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3552
// Size: 0xaf
function function_a649727b9944afc2() {
    /#
        level endon("<unknown string>");
        self endon("<unknown string>");
        self.owner endon("<unknown string>");
        self endon("<unknown string>");
        self.var_5fddd5317487c6c3 = [];
        var_fc62075a9f6e7cab = (0, 1, 0);
        while (1) {
            foreach (var_8950dc21de5cc6e8 in self.var_5fddd5317487c6c3) {
                sphere(var_8950dc21de5cc6e8, 5, var_fc62075a9f6e7cab, 0, 1);
            }
            waitframe();
        }
    #/
}

// Namespace trophy_system/namespace_832187ad8517bd27
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3608
// Size: 0x69
function function_1e892f6dd85d5b9c(var_8e101ea21f6c5f4f) {
    /#
        if (isdefined(self.var_5fddd5317487c6c3)) {
            self.var_5fddd5317487c6c3[self.var_5fddd5317487c6c3.size] = var_8e101ea21f6c5f4f.origin;
        } else {
            self.var_5fddd5317487c6c3 = [];
            self.var_5fddd5317487c6c3[self.var_5fddd5317487c6c3.size] = var_8e101ea21f6c5f4f.origin;
        }
    #/
}

