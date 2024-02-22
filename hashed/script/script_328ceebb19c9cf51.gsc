// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\engine\trace.gsc;
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
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_104e3370b024f998;
#using scripts\mp\supers.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\perks\perkpackage.gsc;

#namespace super_laser_charge;

// Namespace super_laser_charge/namespace_d287cdac8347c2c7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56d
// Size: 0x1c3
function function_38a4f67440cf220e() {
    namespace_1cd9f6896754adb0::function_2d6e7e0b80767910("laserRaise", [0:"allow_jump", 1:"mantle", 2:"melee", 3:"usability", 4:"killstreaks", 5:"supers", 6:"gesture", 7:"allow_movement", 8:"offhand_weapons", 9:"crouch", 10:"prone", 11:"sprint", 12:"execution_attack", 13:"execution_victim"]);
    namespace_1cd9f6896754adb0::function_2d6e7e0b80767910("laserFire", [0:"allow_jump", 1:"mantle", 2:"melee", 3:"usability", 4:"killstreaks", 5:"supers", 6:"gesture", 7:"weapon_switch", 8:"allow_movement", 9:"offhand_weapons", 10:"crouch", 11:"prone", 12:"sprint", 13:"execution_attack", 14:"execution_victim"]);
    namespace_1cd9f6896754adb0::function_2d6e7e0b80767910("laserDrop", [0:"allow_jump", 1:"mantle", 2:"melee", 3:"usability", 4:"killstreaks", 5:"supers", 6:"gesture", 7:"allow_movement", 8:"offhand_weapons", 9:"crouch", 10:"prone", 11:"sprint", 12:"execution_attack", 13:"execution_victim"]);
    namespace_3c37cb17ade254d::registersharedfunc("super_laser_charge", "tryUse", &function_2b8f6cdb729062b4);
}

// Namespace super_laser_charge/namespace_d287cdac8347c2c7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x737
// Size: 0x1e
function function_37ddcde87b74cc48() {
    result = function_2b8f6cdb729062b4(undefined);
    if (!istrue(result)) {
        return 0;
    }
    return 1;
}

// Namespace super_laser_charge/namespace_d287cdac8347c2c7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x75d
// Size: 0x3b3
function private function_2b8f6cdb729062b4(killstreakbundle) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (self isswimming()) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ getsharedfunc("hud", "showErrorMessage") ]]("SUPER_MP/SUPER_CANNOT_USE_SWIM");
        }
        return 0;
    }
    if (!self isonground()) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ getsharedfunc("hud", "showErrorMessage") ]]("SUPER_MP/SUPER_CANNOT_USE_AIR");
        }
        return 0;
    }
    if (namespace_f8065cafc523dba5::isinvehicle(1)) {
        return 0;
    }
    var_424b1932c6e3004a = self function_29c14c6e321b9789("stand");
    if (istrue(var_424b1932c6e3004a)) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ getsharedfunc("hud", "showErrorMessage") ]]("SUPER_MP/SUPER_CANNOT_USE_SPACE");
        }
        return 0;
    }
    starttrace = self.origin + (0, 0, 5);
    endtrace = starttrace + (0, 0, 80);
    contentoverride = create_contents(0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0);
    heighttrace = ray_trace(starttrace, endtrace, self, contentoverride);
    if (isdefined(heighttrace)) {
        if (heighttrace["hittype"] != "hittype_none" || !sphere_trace_passed(endtrace, endtrace, 15, self, contentoverride)) {
            /#
                level thread namespace_f2ffc0540883e1ad::drawline(starttrace, endtrace, 10, (1, 0, 0));
                level thread namespace_f2ffc0540883e1ad::drawsphere(endtrace, 20, 10, (1, 0, 0));
                level thread namespace_f2ffc0540883e1ad::drawsphere(heighttrace["hittype"], 5, 10, (1, 1, 0));
            #/
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                self [[ getsharedfunc("hud", "showErrorMessage") ]]("SUPER_MP/SUPER_CANNOT_USE_SPACE");
            }
            return 0;
        }
    }
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        self setclientomnvar("ui_br_inventory_disabled", 1);
    }
    currentstance = self getstance();
    if (currentstance != "stand") {
        self setstance("stand");
    }
    var_de3c27c551c3dfbd = self.pers["lastStanceChangeTime"];
    if (isdefined(var_de3c27c551c3dfbd)) {
        var_31e819a78d024d77 = (gettime() - var_de3c27c551c3dfbd) / 1000;
        var_e6d9634522574c56 = 0;
        if (var_31e819a78d024d77 < 0.8) {
            var_e6d9634522574c56 = 0.8 - var_31e819a78d024d77;
        }
        if (var_e6d9634522574c56 > 0) {
            wait(var_e6d9634522574c56);
        }
    }
    namespace_1cd9f6896754adb0::function_3633b947164be4f3("laserRaise", 0);
    if (!isdefined(killstreakbundle)) {
        self setclientomnvar("ui_field_upgrade_use", 0);
    }
    giveperk("specialty_super_protection");
    deployweapon = isdefined(killstreakbundle) && isdefined(killstreakbundle.var_69539d680440246) ? killstreakbundle.var_69539d680440246 : "super_laser_charge_mp";
    objweapon = makeweapon(deployweapon, [0:"lasercustom_super_laser"]);
    _giveweapon(objweapon);
    thread function_f9c583614e43d70b();
    self setscriptablepartstate("superpowers", "laser_charge", 0);
    var_d54d53eaf955518d = domonitoredweaponswitch(objweapon, 1, 1);
    if (!istrue(var_d54d53eaf955518d)) {
        self setscriptablepartstate("superpowers", "off", 0);
        removeperk("specialty_super_protection");
        namespace_1cd9f6896754adb0::function_588f2307a3040610("laserRaise");
        thread getridofweapon(objweapon, 1);
        if (namespace_36f464722d326bbe::isbrstylegametype()) {
            self setclientomnvar("ui_br_inventory_disabled", 0);
        }
        return 0;
    }
    function_57e6c0e97f405130(objweapon, killstreakbundle);
    return 1;
}

// Namespace super_laser_charge/namespace_d287cdac8347c2c7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb18
// Size: 0x4d
function private function_f9c583614e43d70b() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    var_cc9e0298558036cf = self.suit;
    var_acd43aae173cba08 = "iw9_laser_eye_mp";
    _setsuit(var_acd43aae173cba08);
    self waittill("superLaserCharge_finished");
    _setsuit(var_cc9e0298558036cf);
}

// Namespace super_laser_charge/namespace_d287cdac8347c2c7
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb6c
// Size: 0x92
function private function_57e6c0e97f405130(var_76ce32a62b846a64, killstreakbundle) {
    if (!isdefined(killstreakbundle)) {
        self.super.isactive = 1;
    }
    giveperk("specialty_third_person");
    function_3a9f59811a994a17();
    thread superlasercharge_watchforgameended(killstreakbundle);
    var_3ae043bbb7b2fdf0 = spawn("script_model", self gettagorigin("tag_eye"));
    var_3ae043bbb7b2fdf0 setmodel("super_laser_charge_impact");
    var_3ae043bbb7b2fdf0 dontinterpolate();
    thread function_d962bef837cc0b26(var_76ce32a62b846a64, var_3ae043bbb7b2fdf0, killstreakbundle);
    thread function_701f65bff172b328(var_3ae043bbb7b2fdf0);
}

// Namespace super_laser_charge/namespace_d287cdac8347c2c7
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc05
// Size: 0x23c
function private function_d962bef837cc0b26(var_76ce32a62b846a64, var_3ae043bbb7b2fdf0, killstreakbundle) {
    self endon("disconnect");
    namespace_1cd9f6896754adb0::function_588f2307a3040610("laserRaise");
    namespace_1cd9f6896754adb0::function_3633b947164be4f3("laserFire", 0);
    thread function_2fd73aeab5c5946d(var_3ae043bbb7b2fdf0, killstreakbundle);
    thread function_fc9013fb22941577();
    var_eb3aa4092c07d861 = 0;
    var_dc9cdb0dde14c2e3 = 1;
    var_117a5f27b3ffab8e = 0;
    var_3f53c2d5d19e37c1 = 0;
    var_f5af0b5d26948d94 = 0;
    var_a7be10e54a3a4b99 = weaponclipsize(var_76ce32a62b846a64);
    while (!istrue(self.var_2dd3e994a0214ad1)) {
        currentweapon = self getcurrentweapon();
        currentammo = self getweaponammoclip(var_76ce32a62b846a64);
        if (currentweapon == var_76ce32a62b846a64) {
            if (!istrue(var_3f53c2d5d19e37c1)) {
                var_3f53c2d5d19e37c1 = 1;
                self notify("superLaserCharge_start_fire");
            }
        }
        if (!istrue(function_769566ab9e727f94(currentweapon, var_76ce32a62b846a64))) {
            var_117a5f27b3ffab8e = 1;
            if (!isreallyalive(self) || isinlaststand(self)) {
                var_eb3aa4092c07d861 = 1;
            }
            if (istrue(var_3f53c2d5d19e37c1)) {
                var_dc9cdb0dde14c2e3 = 0;
            } else {
                var_f5af0b5d26948d94 = 1;
            }
            break;
        }
        if (currentammo <= 10) {
            break;
        }
        waitframe();
    }
    self notify("superLaserCharge_stop_fire");
    if (istrue(var_117a5f27b3ffab8e) || istrue(self.var_2dd3e994a0214ad1)) {
        namespace_1cd9f6896754adb0::function_588f2307a3040610("laserFire");
        thread getridofweapon(var_76ce32a62b846a64, 1);
        self notify("superLaserCharge_finished");
        removeperk("specialty_third_person");
        removeperk("specialty_super_protection");
        if (istrue(self.var_2dd3e994a0214ad1)) {
            self.var_2dd3e994a0214ad1 = undefined;
            self stopforcedfire();
        }
    } else {
        namespace_1cd9f6896754adb0::function_588f2307a3040610("laserFire");
        namespace_1cd9f6896754adb0::function_3633b947164be4f3("laserDrop", 0);
        thread getridofweapon(var_76ce32a62b846a64);
        wait(1);
        self notify("superLaserCharge_finished");
        removeperk("specialty_third_person");
        removeperk("specialty_super_protection");
        namespace_1cd9f6896754adb0::function_588f2307a3040610("laserDrop");
    }
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        self setclientomnvar("ui_br_inventory_disabled", 0);
    }
    namespace_416e533f6ed17708::function_269b97f3d86eb172(var_eb3aa4092c07d861, 0, undefined, isdefined(killstreakbundle));
    if (istrue(var_f5af0b5d26948d94)) {
        function_76ac6722cb845c98(killstreakbundle);
    } else if (isdefined(killstreakbundle)) {
        self notify("superLaserCharge_finishedWithoutRefund");
    }
}

// Namespace super_laser_charge/namespace_d287cdac8347c2c7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe48
// Size: 0x26
function private function_fc9013fb22941577() {
    self endon("disconnect");
    self endon("superLaserCharge_start_fire");
    self endon("superLaserCharge_stop_fire");
    wait(2);
    self.var_2dd3e994a0214ad1 = 1;
}

// Namespace super_laser_charge/namespace_d287cdac8347c2c7
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe75
// Size: 0x72
function private function_769566ab9e727f94(currentweapon, var_76ce32a62b846a64) {
    var_c68efa84b7136f03 = istrue(level.gameended);
    var_a80fe11aed36c72 = currentweapon == var_76ce32a62b846a64;
    return isreallyalive(self) && self isonground() && istrue(var_a80fe11aed36c72) && !isinlaststand(self) && !self isswimming() && !self isonladder() && !var_c68efa84b7136f03;
}

// Namespace super_laser_charge/namespace_d287cdac8347c2c7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xeef
// Size: 0x1af
function private function_3a9f59811a994a17() {
    traceoffset = 50;
    starttrace = self gettagorigin("j_spineupper");
    var_4b787d72c87edfd7 = starttrace + anglestoright(self.angles) * traceoffset;
    var_d809cfcc948bb9ff = ray_trace(starttrace, var_4b787d72c87edfd7, self, create_default_contents(1));
    var_d8b6b92db6431a66 = undefined;
    if (isdefined(var_d809cfcc948bb9ff) && var_d809cfcc948bb9ff["hittype"] != "hittype_none") {
        var_d8b6b92db6431a66 = distance2dsquared(starttrace, var_d809cfcc948bb9ff["position"]);
        /#
            level thread namespace_f2ffc0540883e1ad::drawline(starttrace, var_4b787d72c87edfd7, 10, (1, 0, 0));
            level thread namespace_f2ffc0540883e1ad::drawsphere(var_d809cfcc948bb9ff["hittype"], 5, 10, (1, 0, 0));
        #/
    }
    var_61795bc1d5be4f22 = starttrace - anglestoright(self.angles) * traceoffset;
    var_bdf14b0d52e29044 = ray_trace(starttrace, var_61795bc1d5be4f22, self, create_default_contents(1));
    var_e386728fd4c32e07 = undefined;
    if (isdefined(var_bdf14b0d52e29044) && var_bdf14b0d52e29044["hittype"] != "hittype_none") {
        var_e386728fd4c32e07 = distance2dsquared(starttrace, var_bdf14b0d52e29044["position"]);
        /#
            level thread namespace_f2ffc0540883e1ad::drawline(starttrace, var_61795bc1d5be4f22, 10, (0, 1, 0));
            level thread namespace_f2ffc0540883e1ad::drawsphere(var_bdf14b0d52e29044["hittype"], 5, 10, (0, 1, 0));
        #/
    }
    var_e4e4333961b8666a = 1;
    if (isdefined(var_d8b6b92db6431a66) && isdefined(var_e386728fd4c32e07) && var_d8b6b92db6431a66 > var_e386728fd4c32e07) {
        var_e4e4333961b8666a = 0;
    } else if (!isdefined(var_d8b6b92db6431a66)) {
        var_e4e4333961b8666a = 0;
    }
}

// Namespace super_laser_charge/namespace_d287cdac8347c2c7
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10a5
// Size: 0xda
function private function_2fd73aeab5c5946d(var_3ae043bbb7b2fdf0, killstreakbundle) {
    self endon("disconnect");
    /#
        thread function_faa526904671fdb4();
    #/
    self startforcedfire();
    self playsoundtoplayer("weap_lasereyes_levitate", self);
    self playsound("weap_lasereyes_levitate_npc", self, self);
    var_5e8542114221e306 = waittill_any_timeout_1(1.5, "superLaserCharge_stop_fire");
    if (!isdefined(var_5e8542114221e306) || var_5e8542114221e306 != "timeout") {
        self stopforcedfire();
        return;
    }
    if (!isdefined(killstreakbundle)) {
        thread namespace_85d036cb78063c4a::updateusetimedecay();
    }
    self playsoundtoplayer("weap_laser_fire_start", self);
    self playsound("weap_laser_fire_start_npc", self, self);
    self waittill("superLaserCharge_stop_fire");
    self playsoundtoplayer("weap_laser_fire_stop", self);
    self playsound("weap_laser_fire_stop_npc", self, self);
    self stopforcedfire();
    if (isdefined(var_3ae043bbb7b2fdf0)) {
        var_3ae043bbb7b2fdf0 delete();
    }
}

// Namespace super_laser_charge/namespace_d287cdac8347c2c7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1186
// Size: 0x4c
function function_701f65bff172b328(var_3ae043bbb7b2fdf0) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (isdefined(var_3ae043bbb7b2fdf0)) {
        var_6a31d62c64e37d60 = namespace_f8065cafc523dba5::function_a104c06453297036(self);
        if (isdefined(var_6a31d62c64e37d60)) {
            var_3ae043bbb7b2fdf0.origin = var_6a31d62c64e37d60;
        }
        wait(0.05);
    }
}

// Namespace super_laser_charge/namespace_d287cdac8347c2c7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11d9
// Size: 0x49
function function_4595a2e368e64b18(var_fcef8d217a441961) {
    self.super.isactive = 0;
    if (utility::issharedfuncdefined("br", "superSlotCleanUp")) {
        [[ utility::getsharedfunc("br", "superSlotCleanUp") ]](self);
    }
    return 0;
}

// Namespace super_laser_charge/namespace_d287cdac8347c2c7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x122a
// Size: 0x6f
function function_be41fd9988f890d9() {
    if (getgametype() != "infect") {
        namespace_85d036cb78063c4a::combatrecordsuperkill("super_laser_charge");
        self.var_e3ca8ebb9ba5260d++;
        var_2a46027b0350b6aa = namespace_85d036cb78063c4a::getcombatrecordsupermisc("super_laser_charge");
        if (self.var_e3ca8ebb9ba5260d > var_2a46027b0350b6aa) {
            increment = self.var_e3ca8ebb9ba5260d - var_2a46027b0350b6aa;
            namespace_85d036cb78063c4a::combatrecordsupermisc("super_laser_charge", increment);
        }
    }
}

// Namespace super_laser_charge/namespace_d287cdac8347c2c7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12a0
// Size: 0x48
function private superlasercharge_watchforgameended(killstreakbundle) {
    self endon("death_or_disconnect");
    self endon("super_use_finished");
    self notify("superLaserCharge_watchForGameEnded");
    self endon("superLaserCharge_watchForGameEnded");
    level waittill_any_2("game_ended", "prematch_cleanup");
    if (!isdefined(killstreakbundle)) {
        thread namespace_85d036cb78063c4a::superusefinished();
    }
}

// Namespace super_laser_charge/namespace_d287cdac8347c2c7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12ef
// Size: 0x47
function private function_76ac6722cb845c98(killstreakbundle) {
    if (isdefined(killstreakbundle)) {
        self notify("superLaserCharge_refund");
    } else if (namespace_36f464722d326bbe::isbrstylegametype()) {
        namespace_cb965d2f71fefddc::_givebrsuper("equip_laser_charge", "super_laser_charge", 1);
    } else {
        namespace_727d2aa1d6c72038::perkpackage_giveimmediate("super_laser_charge");
    }
}

// Namespace super_laser_charge/namespace_d287cdac8347c2c7
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x133d
// Size: 0x1b
function private function_faa526904671fdb4() {
    /#
        self endon("superpowers");
        self endon("weap_laser_fire_stop_npc");
        level endon("<unknown string>");
    #/
}

