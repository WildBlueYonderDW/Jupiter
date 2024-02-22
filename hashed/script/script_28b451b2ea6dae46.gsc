// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using scripts\cp_mp\utility\callback_group.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\train_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
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
#using script_5f903436642211af;
#using script_16ea1b94f0f381b3;
#using scripts\cp_mp\challenges.gsc;
#using script_509a782dd5b89cf1;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\mp\analyticslog.gsc;

#namespace namespace_a0b76cce7b2e8e3e;

// Namespace namespace_a0b76cce7b2e8e3e/namespace_6042a7b1a31aaedc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x389
// Size: 0x3
function function_a09bd8d12b478568() {
    
}

// Namespace namespace_a0b76cce7b2e8e3e/namespace_6042a7b1a31aaedc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x393
// Size: 0x340
function function_2d117eeb564f6ea3(grenade) {
    grenade endon("death");
    self endon("disconnect");
    /#
        printgameaction("close", self);
    #/
    grenade namespace_2a9588dfac284b77::registerspawn(1, &function_2564841f84f5470c);
    thread namespace_3bbb5a98b932c46f::monitordisownedgrenade(self, grenade);
    grenade setscriptablepartstate("visibility", "show", 0);
    stuckto = grenade waittill("missile_stuck");
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
    grenade.issuper = 1;
    grenade.superid = level.superglobals.staticsuperdata["super_sonar_pulse"].id;
    grenade.usedcount = 0;
    grenade.deployingplayer = self;
    grenade.headiconid = grenade namespace_7bdde15c3500a23f::setheadicon_factionimage(0, 5, undefined, undefined, undefined, undefined, 1);
    var_307667d0142f2035 = _hasperk("specialty_rugged_eqp");
    onequipmentplanted(grenade, "sonar_pulse_mp", &function_2564841f84f5470c);
    level thread monitordisownedequipment(self, grenade);
    grenade namespace_6d9917c3dc05dbe9::registersentient("Tactical_Static", self);
    maxhealth = ter_op(var_307667d0142f2035, 150, 75);
    grenade thread namespace_3e725f3cc58bddd3::monitordamage(maxhealth, "hitequip", &function_ce4c686b86693133, &function_87b9594a020ed3fd, 0);
    grenade set_apply_emp_callback(&function_93fd2cdcd109695b);
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        grenade [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_2d4af97585682afd);
    }
    if (issharedfuncdefined("emp", "setEMP_Cleared_Callback")) {
        grenade [[ getsharedfunc("emp", "setEMP_Cleared_Callback") ]](&function_8cf01d18d90d2c4c);
    }
    grenade function_49197cd063a740ea(&function_2564841f84f5470c);
    if (isdefined(level.elevators)) {
        foreach (elevators in level.elevators) {
            elevators thread namespace_272931699e2fe8e9::function_5c07037726ae5001(grenade);
        }
    }
    if (isdefined(stuckto) && isplayer(stuckto)) {
        grenade.owner thread namespace_3bbb5a98b932c46f::grenadestuckto(grenade, stuckto);
        grenade thread function_4ae3bcdc7576ebe4(stuckto);
    }
    var_b608af6e8d86fe42 = 0;
    if (namespace_53fc9ddbb516e6e1::function_87072b42853a9c58("specialty_uav_buff")) {
        var_b608af6e8d86fe42 = 1;
    }
    grenade thread function_60d095cd40221aea(var_b608af6e8d86fe42);
    grenade thread function_b562d405020e0724(var_b608af6e8d86fe42);
    grenade function_4b1fcc56668622d1();
    grenade namespace_85d036cb78063c4a::function_235470b268f029ca(&function_2564841f84f5470c);
    namespace_aad14af462a74d08::function_d997435895422ecc("super_sonar_pulse", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
}

// Namespace namespace_a0b76cce7b2e8e3e/namespace_6042a7b1a31aaedc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6da
// Size: 0x30
function function_4ae3bcdc7576ebe4(var_1e68c31b55f99759) {
    self endon("death");
    self endon("destroyed");
    level endon("game_ended");
    var_1e68c31b55f99759 waittill("death_or_disconnect");
    self unlink();
}

// Namespace namespace_a0b76cce7b2e8e3e/namespace_6042a7b1a31aaedc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x711
// Size: 0x3a
function function_60d095cd40221aea(var_b608af6e8d86fe42) {
    self endon("death");
    self endon("destroyed");
    level endon("game_ended");
    while (1) {
        self waittill("enable_sonar");
        thread function_6f9be6b35f3dd478(var_b608af6e8d86fe42);
    }
}

// Namespace namespace_a0b76cce7b2e8e3e/namespace_6042a7b1a31aaedc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x752
// Size: 0x173
function function_6f9be6b35f3dd478(var_b608af6e8d86fe42) {
    self endon("death");
    self endon("destroyed");
    self endon("disable_sonar");
    level endon("game_ended");
    wait(0.5);
    while (1) {
        var_489bfe1c59fe7d65 = 650;
        var_2ff0b7294cde30f8 = 1;
        if (islargemap()) {
            var_489bfe1c59fe7d65 = 3000;
        }
        var_489bfe1c59fe7d65 = int(var_489bfe1c59fe7d65 * ter_op(isdefined(level.var_c0fe6cb6face684e) && istrue(var_b608af6e8d86fe42), level.var_c0fe6cb6face684e, 1));
        thread function_10ec22d7a74ce832(var_2ff0b7294cde30f8);
        thread function_e6f69ea82cb18d6();
        if (isbrstylegametype()) {
            namespace_2c99f682179581bf::function_e457560e955be5f5(self.owner.team, self.origin, var_489bfe1c59fe7d65, 2.05);
        }
        var_cfe9a57ce86b8d4 = int(var_2ff0b7294cde30f8 * 1000);
        if (level.teambased) {
            triggerportableradarpingteam(self.origin, self.owner.team, var_489bfe1c59fe7d65, var_cfe9a57ce86b8d4);
            level notify("portable_radar_ping_team", self.origin);
        } else {
            triggerportableradarping(self.origin, self.owner, var_489bfe1c59fe7d65, var_cfe9a57ce86b8d4);
            level notify("portable_radar_ping", self.origin);
        }
        wait(2);
    }
}

// Namespace namespace_a0b76cce7b2e8e3e/namespace_6042a7b1a31aaedc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8cc
// Size: 0x57
function function_10ec22d7a74ce832(var_2ff0b7294cde30f8) {
    self endon("death");
    self endon("destroyed");
    level endon("game_ended");
    self setscriptablepartstate("pulse", "active", 0);
    wait(min(0.1, var_2ff0b7294cde30f8 - 0.5));
    self setscriptablepartstate("pulse", "neutral", 0);
}

// Namespace namespace_a0b76cce7b2e8e3e/namespace_6042a7b1a31aaedc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92a
// Size: 0x43
function function_e6f69ea82cb18d6() {
    self endon("death");
    self endon("destroyed");
    level endon("game_ended");
    self setscriptablepartstate("anims", "open", 0);
    wait(function_e2ad1107cffcf46());
    self setscriptablepartstate("anims", "close", 0);
}

// Namespace namespace_a0b76cce7b2e8e3e/namespace_6042a7b1a31aaedc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x974
// Size: 0x11
function function_e2ad1107cffcf46() {
    return getanimlength(scriptables%wm_sonar_pulse_ground_open);
}

// Namespace namespace_a0b76cce7b2e8e3e/namespace_6042a7b1a31aaedc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x98d
// Size: 0x5c
function function_b562d405020e0724(var_b608af6e8d86fe42) {
    self endon("death");
    self endon("destroyed");
    level endon("game_ended");
    waittime = 20;
    if (istrue(var_b608af6e8d86fe42)) {
        waittime = 20 * ter_op(isdefined(level.var_1408c77a4f773854), level.var_1408c77a4f773854, 1);
    }
    wait(waittime);
    function_2564841f84f5470c();
}

// Namespace namespace_a0b76cce7b2e8e3e/namespace_6042a7b1a31aaedc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9f0
// Size: 0x13b
function function_16c572662acaaf67(player) {
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

// Namespace namespace_a0b76cce7b2e8e3e/namespace_6042a7b1a31aaedc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb32
// Size: 0x9b
function function_87b9594a020ed3fd(data) {
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

// Namespace namespace_a0b76cce7b2e8e3e/namespace_6042a7b1a31aaedc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd5
// Size: 0x62
function function_ce4c686b86693133(data) {
    attacker = data.attacker;
    if (istrue(namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker))) {
        attacker notify("destroyed_equipment");
        attacker thread doscoreevent(#"destroyed_equipment");
        attacker thread namespace_25c5a6f43bb97b43::equipmentdestroyed(self);
    }
    function_2564841f84f5470c(data);
}

// Namespace namespace_a0b76cce7b2e8e3e/namespace_6042a7b1a31aaedc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc3e
// Size: 0x83
function function_2564841f84f5470c(data) {
    var_ffe0d0bdd9bd7d44 = 0;
    if (isdefined(data) && isdefined(data.attacker)) {
        var_ffe0d0bdd9bd7d44 = 1;
        function_248b0fbbc5de7e43(data.attacker);
    }
    if (isdefined(self.headiconid)) {
        namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.headiconid);
    }
    thread function_9c91a67e3f179afd(var_ffe0d0bdd9bd7d44);
    self setscriptablepartstate("destroy", "active", 0);
    self notify("destroyed");
}

// Namespace namespace_a0b76cce7b2e8e3e/namespace_6042a7b1a31aaedc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc8
// Size: 0x90
function function_9c91a67e3f179afd(var_4fac8b8ce36e09f1) {
    self endon("death");
    if (!isdefined(self)) {
        /#
            iprintln("<unknown string>");
        #/
    }
    self.exploding = 1;
    function_a8d0b1afb1554b5a();
    if (isdefined(self.owner)) {
        namespace_bd0162aedd8c8594::logevent_fieldupgradeexpired(self.owner, self.superid, self.usedcount, istrue(var_4fac8b8ce36e09f1));
        self.owner removeequip(self);
    }
    wait(2);
    namespace_2a9588dfac284b77::deregisterspawn();
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace namespace_a0b76cce7b2e8e3e/namespace_6042a7b1a31aaedc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd5f
// Size: 0x44
function function_248b0fbbc5de7e43(attacker) {
    if (istrue(namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker))) {
        attacker notify("destroyed_equipment");
        attacker thread doscoreevent(#"destroyed_equipment");
        attacker thread namespace_25c5a6f43bb97b43::equipmentdestroyed(self);
    }
}

// Namespace namespace_a0b76cce7b2e8e3e/namespace_6042a7b1a31aaedc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdaa
// Size: 0x7c
function function_93fd2cdcd109695b(data) {
    data.victim endon("destroyed");
    data.victim setscriptablepartstate("empd", "active", 0);
    data.victim function_a8d0b1afb1554b5a();
    wait(6);
    data.victim setscriptablepartstate("empd", "neutral", 0);
    data.victim function_4b1fcc56668622d1();
}

// Namespace namespace_a0b76cce7b2e8e3e/namespace_6042a7b1a31aaedc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe2d
// Size: 0x4b
function function_2d4af97585682afd(data) {
    data.victim endon("destroyed");
    data.victim setscriptablepartstate("empd", "active", 0);
    data.victim function_a8d0b1afb1554b5a();
}

// Namespace namespace_a0b76cce7b2e8e3e/namespace_6042a7b1a31aaedc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe7f
// Size: 0x3a
function function_8cf01d18d90d2c4c(data) {
    data.victim setscriptablepartstate("empd", "neutral", 0);
    data.victim function_4b1fcc56668622d1();
}

// Namespace namespace_a0b76cce7b2e8e3e/namespace_6042a7b1a31aaedc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec0
// Size: 0x55
function function_4b1fcc56668622d1() {
    if (isdefined(self.owner) && istrue(level.tier1modeenabled)) {
        if (issharedfuncdefined("player", "showMiniMap")) {
            self.owner [[ getsharedfunc("player", "showMiniMap") ]]();
        }
    }
    self notify("enable_sonar");
}

// Namespace namespace_a0b76cce7b2e8e3e/namespace_6042a7b1a31aaedc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf1c
// Size: 0x67
function function_a8d0b1afb1554b5a() {
    if (isdefined(self.owner) && istrue(level.tier1modeenabled)) {
        if (issharedfuncdefined("player", "hideMiniMap")) {
            self.owner [[ getsharedfunc("player", "hideMiniMap") ]]();
        }
    }
    self setscriptablepartstate("pulse", "neutral", 0);
    self notify("disable_sonar");
}

// Namespace namespace_a0b76cce7b2e8e3e/namespace_6042a7b1a31aaedc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf8a
// Size: 0x16
function function_49197cd063a740ea(callbackfunction) {
    self.var_d1659ed0a33bf98f = callbackfunction;
}

