// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_2d9d24f7c63ac143;
#using scripts\mp\hud_message.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;

#namespace target_marker;

// Namespace target_marker/namespace_85d5d0fd4ecd2e9e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x471
// Size: 0x61
function init() {
    val::function_2d6e7e0b80767910("target_marker", [0:"usability", 1:"gesture", 2:"sprint", 3:"weapon_switch", 4:"offhand_weapons", 5:"melee", 6:"execution_attack", 7:"ladder_placement", 8:"supers"]);
}

// Namespace target_marker/namespace_85d5d0fd4ecd2e9e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d9
// Size: 0x5b1
function gettargetmarker(streakinfo, var_281c85042194c88f, var_99514d9b932ce768) {
    /#
        assertex(isplayer(self), "this function needs to be called on a player Entity");
    #/
    if (!namespace_f8065cafc523dba5::_isalive()) {
        return;
    }
    val::function_3633b947164be4f3("target_marker", 0);
    _enableequipdeployvfx();
    weapon = makeweaponfromstring(streakinfo.weaponname);
    var_e7db3d4387bc5207 = undefined;
    thread watchforinvalidweapon(weapon, streakinfo);
    thread watchforammouse(weapon, streakinfo);
    thread watchforempapply(weapon, streakinfo);
    thread function_4f304cc560c066ae(streakinfo);
    thread watchforlaststand(streakinfo);
    thread function_9a5aedfd9a5ca5e6(streakinfo);
    thread function_46b5bec68eecb29(streakinfo);
    thread function_a3234162c515654f(streakinfo);
    if (!istrue(var_281c85042194c88f)) {
        if (!isai(self)) {
            self notifyonplayercommand("equip_deploy_end", "+weapnext");
            self notifyonplayercommand("equip_deploy_end", "+weapprev");
            self notifyonplayercommand("equip_deploy_end", "+actionslot 4");
            if (!self isconsoleplayer()) {
                self notifyonplayercommand("equip_deploy_end", "+actionslot 5");
                self notifyonplayercommand("equip_deploy_end", "+actionslot 6");
                self notifyonplayercommand("equip_deploy_end", "+actionslot 7");
            }
        }
    }
    if (namespace_aead94004cf4c147::isBackpackInventoryEnabled()) {
        self setclientomnvar("ui_br_inventory_disabled", 1);
    }
    while (1) {
        var_e7db3d4387bc5207 = waittill_succeed_fail_end("equip_deploy_succeeded", "equip_deploy_failed", "equip_deploy_end", "equip_deploy_cancel", "giveLoadout_start");
        if (var_e7db3d4387bc5207.string == "equip_deploy_cancel") {
            break;
        } else if (var_e7db3d4387bc5207.string == "equip_deploy_end") {
            if (!istrue(var_281c85042194c88f)) {
                break;
            } else {
                namespace_44abc05161e2e2cb::showerrormessage("KILLSTREAKS/CANNOT_SWITCH");
            }
        } else if (var_e7db3d4387bc5207.string == "equip_deploy_failed") {
            namespace_44abc05161e2e2cb::showerrormessage("KILLSTREAKS/CANNOT_BE_PLACED");
        } else {
            if (isdefined(var_e7db3d4387bc5207) && var_e7db3d4387bc5207.string == "equip_deploy_succeeded") {
                if (isplacementplayerobstructed(var_e7db3d4387bc5207)) {
                    namespace_44abc05161e2e2cb::showerrormessage("KILLSTREAKS/CANNOT_BE_PLACED_PLAYER");
                    continue;
                } else if (!self isonground() || self isonladder()) {
                    namespace_44abc05161e2e2cb::showerrormessage("KILLSTREAKS/CANNOT_BE_PLACED_AIR");
                    continue;
                } else if (isdefined(level.var_ca4e08767cbdae12)) {
                    var_425925a45729deae = self [[ level.var_ca4e08767cbdae12 ]](var_e7db3d4387bc5207.location);
                    if (!var_425925a45729deae) {
                        namespace_44abc05161e2e2cb::showerrormessage("KILLSTREAKS/CANNOT_BE_PLACED");
                        continue;
                    }
                } else if (isdefined(var_99514d9b932ce768) && self [[ var_99514d9b932ce768 ]](var_e7db3d4387bc5207)) {
                    continue;
                }
            }
            break;
        }
    }
    if (isdefined(var_e7db3d4387bc5207.location) && isdefined(var_e7db3d4387bc5207.angles)) {
        starttrace = var_e7db3d4387bc5207.location + (0, 0, 80);
        endtrace = var_e7db3d4387bc5207.location + (0, 0, -1000);
        var_86c927742fe0f6ae = [0:"physicscontents_aiclip", 1:"physicscontents_glass", 2:"physicscontents_vehicle", 3:"physicscontents_playerclip", 4:"physicscontents_item"];
        var_c3fbb6661b91750f = physics_createcontents(var_86c927742fe0f6ae);
        var_361673325f14226b = namespace_2a184fc4902783dc::sphere_trace(starttrace, endtrace, 20, undefined, var_c3fbb6661b91750f);
        moving_platform = var_361673325f14226b["entity"];
        if (function_fcd42ee510c535fc(moving_platform)) {
            var_e7db3d4387bc5207.moving_platform = moving_platform;
            var_f3589428c6ee8c59 = var_e7db3d4387bc5207.location - moving_platform.origin;
            var_1df3e0c98e18cb08 = vectordot(var_f3589428c6ee8c59, anglestoforward(moving_platform.angles));
            var_1df3e1c98e18cd3b = -1 * vectordot(var_f3589428c6ee8c59, anglestoright(moving_platform.angles));
            var_1df3e2c98e18cf6e = vectordot(var_f3589428c6ee8c59, anglestoup(moving_platform.angles));
            var_e7db3d4387bc5207.moving_platform_offset = (var_1df3e0c98e18cb08, var_1df3e1c98e18cd3b, var_1df3e2c98e18cf6e);
            var_e7db3d4387bc5207.moving_platform_angles_offset = combineangles(invertangles(moving_platform.angles), var_e7db3d4387bc5207.angles);
        } else if (getdvarint(@"hash_50998d037e0d13b9", 0)) {
            if (var_361673325f14226b["hittype"] != "hittype_none" && isdefined(var_361673325f14226b["position"])) {
                /#
                    thread namespace_f2ffc0540883e1ad::drawsphere(var_e7db3d4387bc5207.location, 5, 30, (1, 0, 0));
                    thread namespace_f2ffc0540883e1ad::drawsphere(var_361673325f14226b["physicscontents_glass"], 5, 30, (0, 1, 0));
                #/
                var_c49ac9441d2c5419 = (0, 0, 0);
                if (distancesquared(var_e7db3d4387bc5207.location, var_361673325f14226b["position"]) >= 100) {
                    var_c49ac9441d2c5419 = (0, 0, 10);
                }
                var_e7db3d4387bc5207.location = (var_e7db3d4387bc5207.location[0], var_e7db3d4387bc5207.location[1], var_361673325f14226b["position"][2]) - var_c49ac9441d2c5419;
            }
        }
    }
    if (namespace_aead94004cf4c147::isBackpackInventoryEnabled()) {
        self setclientomnvar("ui_br_inventory_disabled", 0);
    }
    if (isreallyalive(self)) {
        streakinfo notify("killstreak_finished_with_deploy_weapon");
        val::function_c9d0b43701bdba00("watchPlacement");
    }
    _disableequipdeployvfx();
    thread delaythread(0.05, &val::function_588f2307a3040610, "target_marker");
    return var_e7db3d4387bc5207;
}

// Namespace target_marker/namespace_85d5d0fd4ecd2e9e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa92
// Size: 0x47
function function_fcd42ee510c535fc(var_a2731e6d9af15254) {
    if (!isdefined(var_a2731e6d9af15254)) {
        return 0;
    }
    if (isdefined(var_a2731e6d9af15254.helperdronetype)) {
        return 0;
    }
    if (var_a2731e6d9af15254 namespace_1f188a13f7e79610::isvehicle() && var_a2731e6d9af15254.vehiclename == "veh9_acv_6x6") {
        return 0;
    }
    return 1;
}

// Namespace target_marker/namespace_85d5d0fd4ecd2e9e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae1
// Size: 0x55
function isplacementplayerobstructed(marker) {
    var_5866e1790a4c2f2d = 0;
    var_9673c988f7266c67 = marker.location;
    if (!namespace_2a184fc4902783dc::sphere_trace_passed(var_9673c988f7266c67 + (0, 0, 100), var_9673c988f7266c67, 20, undefined, namespace_2a184fc4902783dc::create_character_contents())) {
        var_5866e1790a4c2f2d = 1;
    }
    return var_5866e1790a4c2f2d;
}

// Namespace target_marker/namespace_85d5d0fd4ecd2e9e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb3e
// Size: 0x48
function watchforinvalidweapon(weapon, streakinfo) {
    self endon("death_or_disconnect");
    streakinfo endon("killstreak_finished_with_deploy_weapon");
    level endon("game_ended");
    while (1) {
        if (self getcurrentweapon() != weapon) {
            self notify("equip_deploy_end");
            break;
        }
        waitframe();
    }
}

// Namespace target_marker/namespace_85d5d0fd4ecd2e9e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb8d
// Size: 0x65
function watchforammouse(weapon, streakinfo) {
    self endon("death_or_disconnect");
    streakinfo endon("killstreak_finished_with_deploy_weapon");
    level endon("game_ended");
    var_450ebd9f1229aca5 = self getweaponammoclip(weapon);
    while (1) {
        objweapon = self waittill("weapon_fired");
        if (objweapon == weapon) {
            self setweaponammoclip(objweapon, var_450ebd9f1229aca5);
        }
    }
}

// Namespace target_marker/namespace_85d5d0fd4ecd2e9e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf9
// Size: 0x39
function watchforempapply(weapon, streakinfo) {
    self endon("death_or_disconnect");
    streakinfo endon("killstreak_finished_with_deploy_weapon");
    level endon("game_ended");
    self waittill("emp_applied");
    self notify("equip_deploy_end");
}

// Namespace target_marker/namespace_85d5d0fd4ecd2e9e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc39
// Size: 0x4a
function function_4f304cc560c066ae(streakinfo) {
    self endon("death_or_disconnect");
    streakinfo endon("killstreak_finished_with_deploy_weapon");
    level endon("game_ended");
    while (1) {
        if (self isswimming()) {
            namespace_44abc05161e2e2cb::showerrormessage("KILLSTREAKS/PLACEMENT_CANCELED_WATER");
            self notify("equip_deploy_cancel");
            break;
        }
        waitframe();
    }
}

// Namespace target_marker/namespace_85d5d0fd4ecd2e9e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc8a
// Size: 0x3d
function watchforlaststand(streakinfo) {
    self endon("death_or_disconnect");
    streakinfo endon("killstreak_finished_with_deploy_weapon");
    level endon("game_ended");
    self waittill("last_stand_start");
    namespace_44abc05161e2e2cb::showerrormessage("KILLSTREAKS/PLACEMENT_CANCELED");
    self notify("equip_deploy_cancel");
}

// Namespace target_marker/namespace_85d5d0fd4ecd2e9e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcce
// Size: 0x4a
function function_9a5aedfd9a5ca5e6(streakinfo) {
    self endon("death_or_disconnect");
    streakinfo endon("killstreak_finished_with_deploy_weapon");
    level endon("game_ended");
    while (1) {
        if (self isparachuting()) {
            namespace_44abc05161e2e2cb::showerrormessage("KILLSTREAKS/PLACEMENT_CANCELED");
            self notify("equip_deploy_cancel");
            break;
        }
        waitframe();
    }
}

// Namespace target_marker/namespace_85d5d0fd4ecd2e9e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd1f
// Size: 0x31
function function_46b5bec68eecb29(streakinfo) {
    self endon("death_or_disconnect");
    streakinfo endon("killstreak_finished_with_deploy_weapon");
    level endon("game_ended");
    self waittill("oob_cooldown_end");
    self notify("equip_deploy_failed");
}

// Namespace target_marker/namespace_85d5d0fd4ecd2e9e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd57
// Size: 0x48
function function_a3234162c515654f(streakinfo) {
    self endon("death_or_disconnect");
    streakinfo endon("killstreak_finished_with_deploy_weapon");
    level endon("game_ended");
    while (1) {
        if (self isinexecutionattack() || self isinexecutionvictim()) {
            self notify("equip_deploy_cancel");
            break;
        }
        waitframe();
    }
}

// Namespace target_marker/namespace_85d5d0fd4ecd2e9e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda6
// Size: 0xe2
function watchForPlacementFireState(streakinfo, endonnotify, weaponobj) {
    self endon(endonnotify);
    self endon("death_or_disconnect");
    streakinfo endon("killstreak_finished_with_deploy_weapon");
    level endon("game_ended");
    if (isdefined(weaponobj) && !namespace_ff4d906e30e82f8::candeploykillstreak(streakinfo, weaponobj)) {
        return;
    }
    var_d5efe0dc4421b041 = 0;
    val::set("watchPlacement", "fire", 0);
    val::set("watchPlacement", "usability", 0);
    thread function_502f817c790dec40(streakinfo, endonnotify);
    while (1) {
        var_226b8d81bc032929 = self waittill("deploy_equip_valid_changed");
        if (!istrue(var_226b8d81bc032929)) {
            if (istrue(var_d5efe0dc4421b041)) {
                var_d5efe0dc4421b041 = 0;
                val::set("watchPlacement", "fire", 0);
            }
        } else if (!touchingoobtrigger()) {
            if (!istrue(var_d5efe0dc4421b041)) {
                var_d5efe0dc4421b041 = 1;
                val::set("watchPlacement", "fire", 1);
            }
        }
    }
}

// Namespace target_marker/namespace_85d5d0fd4ecd2e9e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe8f
// Size: 0x39
function function_502f817c790dec40(streakinfo, endonnotify) {
    self endon("death_or_disconnect");
    streakinfo endon("killstreak_finished_with_deploy_weapon");
    level endon("game_ended");
    self waittill(endonnotify);
    val::function_c9d0b43701bdba00("watchPlacement");
}

// Namespace target_marker/namespace_85d5d0fd4ecd2e9e
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xecf
// Size: 0x140
function waittill_succeed_fail_end(var_12e3586b64301806, var_56fd0c716f6be894, endstring, var_9ba4fcfeb48763ba, var_bd92ce9529bd1f2e) {
    ent = spawnstruct();
    if (isdefined(var_12e3586b64301806)) {
        childthread waittill_return(var_12e3586b64301806, ent);
    }
    if (isdefined(var_56fd0c716f6be894)) {
        childthread waittill_return(var_56fd0c716f6be894, ent);
    }
    if (isdefined(endstring)) {
        childthread waittill_return(endstring, ent);
    }
    if (isdefined(var_9ba4fcfeb48763ba)) {
        childthread waittill_return(var_9ba4fcfeb48763ba, ent);
    }
    if (isdefined(var_bd92ce9529bd1f2e)) {
        childthread waittill_return(var_bd92ce9529bd1f2e, ent);
    }
    childthread waittill_return("death", ent);
    string = angle = location = weaponname = var_2fd23e27096da380 = ent waittill("returned");
    ent notify("die");
    var_6e586a99fa56a20f = spawnstruct();
    var_6e586a99fa56a20f.weapon = weaponname;
    var_6e586a99fa56a20f.location = location;
    var_6e586a99fa56a20f.angles = angle;
    var_6e586a99fa56a20f.string = string;
    var_6e586a99fa56a20f.fxoffset = var_2fd23e27096da380;
    return var_6e586a99fa56a20f;
}

// Namespace target_marker/namespace_85d5d0fd4ecd2e9e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1017
// Size: 0x69
function waittill_return(var_12e3586b64301806, ent) {
    if (var_12e3586b64301806 != "death") {
        self endon("death");
    }
    ent endon("die");
    angle = location = weapon = var_2fd23e27096da380 = self waittill(var_12e3586b64301806);
    ent notify("returned", var_2fd23e27096da380);
}

