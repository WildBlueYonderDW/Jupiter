// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\equipment.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\cp_mp\vehicles\vehicle_mines.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\damage.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using script_5762ac2f22202ba2;
#using scripts\mp\hud_message.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\cp_mp\ent_manager.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using script_736dec95a49487a6;
#using script_5f903436642211af;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\equipment\claymore.gsc;
#using script_1cf2ed809496bf4e;
#using scripts\mp\movers.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\sentientpoolmanager.gsc;

#namespace deployed_decoy;

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f9
// Size: 0x7e
function function_35f02578b0c90838() {
    if (istrue(game["isLaunchChunk"])) {
        return;
    }
    minetriggerdata = namespace_739a1beacdad3457::vehicle_mines_getleveldataformine("equip_deployed_decoy", 1);
    minetriggerdata.triggercallback = &function_81d957f621cb0552;
    if (isdefined(level.superglobals.staticsuperdata["super_deployed_decoy"])) {
        level.superglobals.staticsuperdata["super_deployed_decoy"].var_f6604eebabcac6c2 = &function_f4231eed765ce56c;
    }
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa7e
// Size: 0x75
function deployeddecoy_unset() {
    self notify("deployedDecoy_unset");
    if (isdefined(self.var_7f0ad61b396c9477)) {
        foreach (var_a335666a563c40c0 in self.var_7f0ad61b396c9477) {
            var_a335666a563c40c0 thread function_183a7478c53fd2f2();
        }
    }
    function_46ff5657c998dce8();
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xafa
// Size: 0x2e
function function_aba5cd3449e22124(ison) {
    if (ison) {
        namespace_85d036cb78063c4a::function_7203e7aa96ff0ba9(38);
        thread function_8bf69e0818e85062();
    } else {
        namespace_85d036cb78063c4a::function_7203e7aa96ff0ba9(0, 1);
    }
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb2f
// Size: 0x4f
function function_8bf69e0818e85062() {
    if (!isdefined(level.var_62f6f7640e4431e3) || !istrue(level.var_62f6f7640e4431e3.var_5b66ed80c98f795b)) {
        return;
    }
    self notify("decoy_monitor_death");
    level endon("game_ended");
    self endon("decoy_monitor_death");
    self waittill("death");
    function_46ff5657c998dce8();
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb85
// Size: 0x22
function function_3750d0e9ad3887f2() {
    self notify("deployedDecoy_parkedReady");
    self setclientomnvar("ui_deployed_decoy_use", 1);
    function_aba5cd3449e22124(1);
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbae
// Size: 0x34
function function_b53a82180c76b481() {
    self endon("disconnect");
    self endon("deployedDecoy_parkedReady");
    level endon("game_ended");
    self setclientomnvar("ui_deployed_decoy_use", 2);
    wait(2);
    function_aba5cd3449e22124(0);
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe9
// Size: 0x18
function function_46ff5657c998dce8() {
    self setclientomnvar("ui_deployed_decoy_use", 0);
    function_aba5cd3449e22124(0);
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc08
// Size: 0x1c
function function_9aa20ecdd4292776() {
    thread namespace_3e725f3cc58bddd3::monitordamage(225, "hitequip", &function_1621f495789f13e3, &function_19411386fd3d2e2d);
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc2b
// Size: 0x7a
function function_1621f495789f13e3(data) {
    attacker = data.attacker;
    if (!isdefined(self.owner) || istrue(namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker))) {
        attacker notify("destroyed_equipment");
        attacker thread namespace_48a08c5037514e04::doscoreevent(#"destroyed_equipment");
        attacker thread namespace_25c5a6f43bb97b43::onfieldupgradedestroy(#"hash_813ac6f7a5a8cfb3");
    }
    function_5d24d48d0b8eb170(1);
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcac
// Size: 0x150
function function_19411386fd3d2e2d(data) {
    var_4fb949ce5da41eca = 0;
    if (isdefined(data.objweapon.basename)) {
        if (data.objweapon.basename == "deployed_decoy_mp") {
            return var_4fb949ce5da41eca;
        }
    }
    if (!isdefined(self)) {
        return var_4fb949ce5da41eca;
    }
    var_8d480ace410e1f75 = self.origin;
    var_b404d98ccc440862 = self.team;
    var_7ca58b9d801cfa0e = self.owner;
    var_780fffabe38cb3b5 = self.maxhealth;
    hits = function_1e1a5a07121e30f8(data);
    if (isdefined(hits)) {
        if (isdefined(var_8d480ace410e1f75) && isdefined(var_b404d98ccc440862) && isdefined(var_7ca58b9d801cfa0e)) {
            pinglocationenemyteams(var_8d480ace410e1f75, var_b404d98ccc440862, var_7ca58b9d801cfa0e);
        }
        thread function_3972a29b456ebeec(data);
        var_4fb949ce5da41eca = int(ceil(min(1, hits / 10) * var_780fffabe38cb3b5));
    }
    if (isdefined(data.attacker) && !function_69adb0b10bae1be4(data)) {
        data.attacker namespace_e072c8407b2a861c::updatedamagefeedback("hitequip", 0, 0, "hitequip", 0, 1);
    }
    thread deployeddecoy_animatehitreact(data);
    /#
        if (0) {
            var_4fb949ce5da41eca = 0;
        }
        return var_4fb949ce5da41eca;
    #/
    return var_4fb949ce5da41eca;
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe04
// Size: 0xec
function private deployeddecoy_animatehitreact(data) {
    self endon("death");
    self notify("deployedDecoy_animateHitReact");
    self endon("deployedDecoy_animateHitReact");
    self endon("deployedDecoy_queueDummyDestroy_Interupt");
    if (istrue(self.var_3fe87ed1237724cc)) {
        return 0;
    }
    var_2dc841aff232fb90 = function_5d2ce17e3de0719b(data);
    if (isdefined(var_2dc841aff232fb90)) {
        self setscriptablepartstate("hitreact", "neutral", 0);
        waitframe();
        switch (var_2dc841aff232fb90) {
        case #"hash_d64fcbeaa252845e":
            thread function_6f3c08a3a1b58895();
            break;
        case #"hash_68a4a9ece8b99b1e":
            thread function_b6e412b5e07835a5();
            break;
        case #"hash_c3e0c50d649e2385":
            thread function_aff778ccce490bae();
            break;
        case #"hash_db4f1eafb9d628c1":
            thread function_2fc8c731d6bfd24a();
            break;
        default:
            break;
        }
    } else {
        /#
            function_46bfca70cc1648f8(data);
        #/
    }
    thread function_1c5e39beb07f8bb3();
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xef7
// Size: 0xb8
function private function_5d2ce17e3de0719b(data) {
    forward = anglestoforward(self.angles);
    right = anglestoright(self.angles);
    direction = data.direction_vec;
    var_dd4fec1f7555332c = vectordot(forward, direction);
    var_8bbcf51ff5504b0d = vectordot(right, direction);
    if (var_dd4fec1f7555332c <= -0.705) {
        return "frontToBack";
    }
    if (var_dd4fec1f7555332c >= 0.705) {
        return "backToFront";
    }
    if (var_8bbcf51ff5504b0d >= 0.705) {
        return "leftToRight";
    }
    if (var_8bbcf51ff5504b0d <= -0.705) {
        return "rightToLeft";
    }
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfb6
// Size: 0xd7
function private function_6f3c08a3a1b58895() {
    self endon("deployedDecoy_animateHitReact");
    self endon("death");
    self.owner endon("disconnect");
    level endon("game_ended");
    switch (self.var_9aadbd8d704d2fab) {
    case #"hash_e2fb276aea336c4c":
        self setscriptablepartstate("hitreact", "iw9_mp_decoymine_hitreac_front", 0);
        wait(getanimlength(scriptables%iw9_mp_decoymine_hitreac_front));
        break;
    case #"hash_cb01a8c73dfd3d8e":
        self setscriptablepartstate("hitreact", "iw9_mp_decoymine_crouch_hitreac_front", 0);
        wait(getanimlength(scriptables%iw9_mp_decoymine_crouch_hitreac_front));
        break;
    case #"hash_db29f8f85388749":
        self setscriptablepartstate("hitreact", "iw9_mp_decoymine_swim_hitreac_front", 0);
        wait(getanimlength(scriptables%iw9_mp_decoymine_swim_hitreac_front));
        break;
    default:
        break;
    }
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1094
// Size: 0xd7
function private function_b6e412b5e07835a5() {
    self endon("deployedDecoy_animateHitReact");
    self endon("death");
    self.owner endon("disconnect");
    level endon("game_ended");
    switch (self.var_9aadbd8d704d2fab) {
    case #"hash_e2fb276aea336c4c":
        self setscriptablepartstate("hitreact", "iw9_mp_decoymine_hitreac_back", 0);
        wait(getanimlength(scriptables%iw9_mp_decoymine_hitreac_back));
        break;
    case #"hash_cb01a8c73dfd3d8e":
        self setscriptablepartstate("hitreact", "iw9_mp_decoymine_crouch_hitreac_back", 0);
        wait(getanimlength(scriptables%iw9_mp_decoymine_crouch_hitreac_back));
        break;
    case #"hash_db29f8f85388749":
        self setscriptablepartstate("hitreact", "iw9_mp_decoymine_swim_hitreac_back", 0);
        wait(getanimlength(scriptables%iw9_mp_decoymine_swim_hitreac_back));
        break;
    default:
        break;
    }
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1172
// Size: 0xd7
function private function_aff778ccce490bae() {
    self endon("deployedDecoy_animateHitReact");
    self endon("death");
    self.owner endon("disconnect");
    level endon("game_ended");
    switch (self.var_9aadbd8d704d2fab) {
    case #"hash_e2fb276aea336c4c":
        self setscriptablepartstate("hitreact", "iw9_mp_decoymine_hitreac_right", 0);
        wait(getanimlength(scriptables%iw9_mp_decoymine_hitreac_right));
        break;
    case #"hash_cb01a8c73dfd3d8e":
        self setscriptablepartstate("hitreact", "iw9_mp_decoymine_crouch_hitreac_right", 0);
        wait(getanimlength(scriptables%iw9_mp_decoymine_crouch_hitreac_right));
        break;
    case #"hash_db29f8f85388749":
        self setscriptablepartstate("hitreact", "iw9_mp_decoymine_swim_hitreac_right", 0);
        wait(getanimlength(scriptables%iw9_mp_decoymine_crouch_hitreac_right));
        break;
    default:
        break;
    }
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1250
// Size: 0xd7
function private function_2fc8c731d6bfd24a() {
    self endon("deployedDecoy_animateHitReact");
    self endon("death");
    self.owner endon("disconnect");
    level endon("game_ended");
    switch (self.var_9aadbd8d704d2fab) {
    case #"hash_e2fb276aea336c4c":
        self setscriptablepartstate("hitreact", "iw9_mp_decoymine_hitreac_left", 0);
        wait(getanimlength(scriptables%iw9_mp_decoymine_hitreac_left));
        break;
    case #"hash_cb01a8c73dfd3d8e":
        self setscriptablepartstate("hitreact", "iw9_mp_decoymine_crouch_hitreac_left", 0);
        wait(getanimlength(scriptables%iw9_mp_decoymine_crouch_hitreac_left));
        break;
    case #"hash_db29f8f85388749":
        self setscriptablepartstate("hitreact", "iw9_mp_decoymine_swim_hitreac_left", 0);
        wait(getanimlength(scriptables%iw9_mp_decoymine_swim_hitreac_left));
        break;
    default:
        break;
    }
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x132e
// Size: 0xdd
function private function_1c5e39beb07f8bb3() {
    self endon("deployedDecoy_animateHitReact");
    self endon("deployedDecoy_resumeIdleAnimation_cancel");
    self endon("death");
    self.owner endon("disconnect");
    level endon("game_ended");
    wait(2);
    if (!isdefined(self)) {
        return 0;
    }
    if (istrue(self.var_3fe87ed1237724cc)) {
        return 0;
    }
    self setscriptablepartstate("idle", "neutral", 0);
    waitframe();
    switch (self.var_9aadbd8d704d2fab) {
    case #"hash_e2fb276aea336c4c":
        self setscriptablepartstate("idle", "iw9_mp_decoymine_idle", 0);
        break;
    case #"hash_cb01a8c73dfd3d8e":
        self setscriptablepartstate("idle", "iw9_mp_decoymine_crouch_idle", 0);
        break;
    case #"hash_db29f8f85388749":
        self setscriptablepartstate("idle", "iw9_mp_decoymine_swim_idle", 0);
        break;
    default:
        break;
    }
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1412
// Size: 0x5a
function function_69adb0b10bae1be4(data) {
    /#
        if (istrue(0)) {
            return 0;
        }
    #/
    if (!isdefined(self.owner)) {
        return 0;
    }
    if (self.owner == data.attacker) {
        return 0;
    }
    return !namespace_f8065cafc523dba5::playersareenemies(self.owner, data.attacker);
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1474
// Size: 0xfc
function function_1e1a5a07121e30f8(data) {
    var_7e6d3acf41d01437 = [0:"MOD_GRENADE_SPLASH", 1:"MOD_GRENADE", 2:"MOD_EXPLOSIVE"];
    if (isdefined(data.inflictor) && isdefined(data.inflictor.classname) && data.inflictor.classname == "script_vehicle") {
        return 10;
    }
    if (function_69adb0b10bae1be4(data)) {
        return 0;
    }
    if (array_contains(var_7e6d3acf41d01437, data.meansofdeath)) {
        return 10;
    }
    if (data.meansofdeath == "MOD_IMPACT") {
        return 2;
    }
    hits = 0;
    if (data.damage >= 100) {
        return (hits + 9);
    } else if (data.damage >= 40) {
        return (hits + 4);
    } else {
        return (hits + 2);
    }
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1577
// Size: 0x1df
function function_255bed505249bc85(grenade) {
    grenade.var_bdef88e59dc867f4 = gettime();
    self.var_7f0ad61b396c9477[grenade.var_bdef88e59dc867f4] = grenade;
    if (self.var_7f0ad61b396c9477.size > 2) {
        var_37239b3e8021e7c1 = array_get_first_item(self.var_7f0ad61b396c9477);
        if (isdefined(var_37239b3e8021e7c1)) {
            var_37239b3e8021e7c1 thread function_183a7478c53fd2f2();
        }
    }
    if (isdefined(self.var_b79b9aa464c929bd)) {
        if (self.var_b79b9aa464c929bd.size > 1) {
            var_10987e27e7131c9a = array_get_first_item(self.var_b79b9aa464c929bd);
            var_10987e27e7131c9a thread function_5d24d48d0b8eb170();
        }
    }
    grenade.var_2fd40475457dffdf = grenade.owner.angles;
    grenade.var_1ae0630643036981 = 0;
    grenade.issuper = 1;
    thread namespace_3bbb5a98b932c46f::monitordisownedgrenade(self, grenade);
    grenade thread function_2482348a6042306();
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
    if (isdefined(stuckto)) {
        grenade.var_4e068e1c487dbebc = stuckto;
    }
    grenade.angles = grenade.var_2fd40475457dffdf;
    grenade.var_2fd40475457dffdf = undefined;
    if (!namespace_9abe40d2af041eb2::function_3c5c5d86ef14420e(grenade.var_4e068e1c487dbebc)) {
        grenade function_85364189c6f041d7();
    }
    grenade thread function_d030dd50ce502ce4();
    namespace_aad14af462a74d08::function_d997435895422ecc("super_deployed_decoy", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
    /#
        if (1) {
            grenade thread function_fa6a545da2197663();
        }
    #/
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x175d
// Size: 0x480
function function_85364189c6f041d7() {
    self endon("death");
    forward = anglestoforward(self.angles);
    up = anglestoup(self.angles);
    self.var_21b8be41b5b72905 = [0:self.origin];
    ignorelist = [];
    ignorelist[0] = self;
    contents = namespace_2a184fc4902783dc::create_default_contents(1);
    var_2c7cfe7b49cabd76 = namespace_9abe40d2af041eb2::function_3c5c5d86ef14420e(self.var_4e068e1c487dbebc);
    var_628c601da57430da = var_2c7cfe7b49cabd76 ? 8 : 4;
    var_2da991e151cfb17f = var_2c7cfe7b49cabd76 ? 45 : 90;
    for (i = 0; i <= var_628c601da57430da; i++) {
        degrees = 0 + var_2da991e151cfb17f * i;
        rot = rotatepointaroundvector(up, forward, degrees);
        rot = vectornormalize(rot) * 28;
        rot = self.origin + rot;
        var_e021c2744cc7ed68 = namespace_2a184fc4902783dc::ray_trace(self.origin, rot, ignorelist, contents, 0, 1, 0);
        var_193cbb3cc7cccdf = isdefined(var_e021c2744cc7ed68) && var_e021c2744cc7ed68.size > 0 && var_e021c2744cc7ed68["hittype"] != "hittype_none";
        if (var_193cbb3cc7cccdf) {
            var_92890a1f9c92f102 = var_e021c2744cc7ed68["position"] - rot;
            var_92890a1f9c92f102 = var_92890a1f9c92f102 * 2;
            var_92890a1f9c92f102 = self.origin + var_92890a1f9c92f102;
            self.var_21b8be41b5b72905[self.var_21b8be41b5b72905.size] = var_92890a1f9c92f102;
        }
        /#
            if (1) {
                colorred = (1, 0, 0);
                colorgreen = (0, 1, 0);
                var_fc62075a9f6e7cab = colorgreen;
                var_9f92884414aa49fb = level.framedurationseconds * 60 * 10;
                if (var_193cbb3cc7cccdf) {
                    var_fc62075a9f6e7cab = colorred;
                    var_49d30df50940b9d7 = var_e021c2744cc7ed68["iw9_mp_decoymine_crouch_hitreac_right"];
                    if (isdefined(var_49d30df50940b9d7)) {
                        thread namespace_f2ffc0540883e1ad::drawsphere(var_49d30df50940b9d7, 0.5, var_9f92884414aa49fb, var_fc62075a9f6e7cab);
                    }
                }
                thread namespace_f2ffc0540883e1ad::drawsphere(rot, 1, var_9f92884414aa49fb, var_fc62075a9f6e7cab);
                thread namespace_f2ffc0540883e1ad::drawline(self.origin, rot, var_9f92884414aa49fb, var_fc62075a9f6e7cab);
            }
        #/
        if (!var_2c7cfe7b49cabd76) {
            waitframe();
        }
    }
    self.var_94981af7e247f403 = undefined;
    while (isdefined(self.var_21b8be41b5b72905) && self.var_21b8be41b5b72905.size > 0) {
        var_c56ac98044693987 = undefined;
        if (isdefined(self.var_21b8be41b5b72905) && self.var_21b8be41b5b72905.size > 1) {
            var_c56ac98044693987 = averagepoint(self.var_21b8be41b5b72905);
        } else {
            var_c56ac98044693987 = self.var_21b8be41b5b72905[0];
        }
        var_4ee1c3d63bd43d9a = ray_trace(var_c56ac98044693987, var_c56ac98044693987 + (0, 0, -24), ignorelist, contents);
        var_193cbb3cc7cccdf = isdefined(var_4ee1c3d63bd43d9a) && var_4ee1c3d63bd43d9a.size > 0 && var_4ee1c3d63bd43d9a["hittype"] != "hittype_none";
        if (var_193cbb3cc7cccdf) {
            self.var_94981af7e247f403 = var_4ee1c3d63bd43d9a["position"];
            if (1) {
                var_2fa8c5e0c76efe74 = (1, 1, 0);
                var_9f92884414aa49fb = level.framedurationseconds * 60 * 10;
                thread namespace_f2ffc0540883e1ad::drawsphere(var_4ee1c3d63bd43d9a["position"], 1, var_9f92884414aa49fb, var_2fa8c5e0c76efe74);
            }
            var_a813ea1a33d83aca = function_db978960f126d2b();
            if (var_a813ea1a33d83aca != 0) {
                break;
            }
        }
        closest = self.var_21b8be41b5b72905[0];
        foreach (point in self.var_21b8be41b5b72905) {
            if (distancesquared(closest, var_c56ac98044693987) > distancesquared(point, var_c56ac98044693987)) {
                closest = point;
            }
        }
        self.var_21b8be41b5b72905 = array_remove(self.var_21b8be41b5b72905, closest);
    }
    /#
        if (1) {
            var_49d0a7e86d4f34f6 = (1, 0, 1);
            var_9f92884414aa49fb = level.framedurationseconds * 60 * 10;
            if (isdefined(self.var_94981af7e247f403)) {
                thread namespace_f2ffc0540883e1ad::drawsphere(self.var_94981af7e247f403, 1, var_9f92884414aa49fb, var_49d0a7e86d4f34f6);
            }
        }
    #/
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1be4
// Size: 0x67
function function_2482348a6042306() {
    self endon("explode");
    self endon("death");
    self endon("missile_stuck");
    var_71c76f81eb0c95ee = var_53f81081d4e7f40b = var_850fdf3fb1c7eb84 = self waittill("missile_water_impact");
    if (isdefined(var_53f81081d4e7f40b)) {
        self.var_87df5e3d4be5e294 = var_53f81081d4e7f40b;
        self.var_d2f74cac2ef25448 = self.owner function_6f55d55ccff20d14();
    }
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c52
// Size: 0x1c3
function function_d030dd50ce502ce4() {
    self.owner endon("disconnect");
    self endon("death");
    namespace_2a9588dfac284b77::registerspawn(1, &function_ec4ed8b35f49093);
    self.owner onequipmentplanted(self, "equip_deployed_decoy", &function_ec4ed8b35f49093);
    thread monitordisownedequipment(self.owner, self);
    function_536a359e6fa67df2();
    self setentityowner(self.owner);
    self setotherent(self.owner);
    self setnodeploy(1);
    self missilethermal();
    self missileoutline();
    self.headiconid = namespace_7bdde15c3500a23f::setheadicon_factionimage(0, 5, undefined, undefined, undefined, 0.1, 1);
    thread minedamagemonitor();
    thread function_9b581bb90dfe8e0f();
    if (!isbot(self.owner)) {
        self.owner thread function_60135177a2faec7c(self);
    }
    namespace_5a51aa78ea0b1b9f::set_apply_emp_callback(&function_3bf15b6532c44f8d);
    namespace_b6b4a3ac458ab6e2::function_172d848d58051fdf(&function_a6d1fd8a98751a36);
    self.owner function_3750d0e9ad3887f2();
    function_49197cd063a740ea(&function_183a7478c53fd2f2);
    if (isdefined(level.elevators)) {
        foreach (elevators in level.elevators) {
            elevators thread namespace_272931699e2fe8e9::function_5c07037726ae5001(self);
        }
    }
    function_fc9eaf4f16837717();
    self setscriptablepartstate("plant", "active", 0);
    function_91b48467f9da9f0e();
    self.armed = 1;
    self.owner thread deployeddecoy_watchfordetonate();
    wait(0.5);
    thread function_8bf9fb0f704eceb0();
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e1c
// Size: 0x1f2
function function_536a359e6fa67df2() {
    if (isdefined(self.var_87df5e3d4be5e294)) {
        var_9bb71e2186bdac1f = self.origin + (0, 0, 2000);
        ignorelist = function_3ad49688e4d76bf0();
        contents = namespace_2a184fc4902783dc::function_b88b8bd51ea7fe24();
        var_e021c2744cc7ed68 = namespace_2a184fc4902783dc::ray_trace(self.origin, var_9bb71e2186bdac1f, ignorelist, contents, 0, 1, 0);
        if (isdefined(var_e021c2744cc7ed68) && var_e021c2744cc7ed68["hittype"] != "hittype_none") {
            self.var_ffe647a3e2fc6a87 = distance(self.origin, var_e021c2744cc7ed68["position"]);
            /#
                if (istrue(0)) {
                    var_9f92884414aa49fb = 10;
                    var_6bc62fe7e1454254 = int(var_9f92884414aa49fb / level.framedurationseconds);
                    var_76704cee002e54f6 = 0.15;
                    thread namespace_f2ffc0540883e1ad::drawsphere(var_9bb71e2186bdac1f, 15, level.framedurationseconds * 60 * 5, (255, 0, 0));
                    thread namespace_f2ffc0540883e1ad::drawsphere(var_e021c2744cc7ed68["iw9_mp_decoymine_crouch_hitreac_right"], 15, level.framedurationseconds * 60 * 5, (0, 0, 255));
                    print3d(self.origin + (0, 0, 24), "iw9_mp_decoymine_swim_idle" + self.var_ffe647a3e2fc6a87, (0, 255, 0), 1, var_76704cee002e54f6, var_6bc62fe7e1454254, 1);
                    thread namespace_f2ffc0540883e1ad::drawline(var_9bb71e2186bdac1f, self.origin, level.framedurationseconds * 60 * 5, (0, 0, 255));
                    thread namespace_f2ffc0540883e1ad::drawsphere(self.origin, 15, level.framedurationseconds * 60 * 5, (0, 255, 0));
                }
            #/
        } else {
            self.var_ffe647a3e2fc6a87 = undefined;
        }
    }
    return self.var_ffe647a3e2fc6a87;
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2016
// Size: 0xf1
function function_8bf9fb0f704eceb0() {
    self endon("mine_triggered");
    self endon("mine_destroyed");
    self endon("death");
    var_a7c5aff6be6dce49 = 0;
    while (!var_a7c5aff6be6dce49) {
        var_f9b008542cd70a05 = self waittill("trigger_grenade");
        /#
            assert(isdefined(var_f9b008542cd70a05));
        #/
        if (istrue(self.stunned) || istrue(self.owner.var_65219c911f198c95)) {
            continue;
        }
        foreach (ent in var_f9b008542cd70a05) {
            if (!function_b49d2e0eca61db98(ent)) {
                continue;
            }
            function_5fa9e8666a1b8da(ent);
            if (self.var_820c08bc4a68289f.var_2b7fcecfef6352b4) {
                thread function_81d957f621cb0552(ent);
                var_a7c5aff6be6dce49 = 1;
                break;
            }
        }
    }
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x210e
// Size: 0x86
function function_b49d2e0eca61db98(ent) {
    /#
        if (istrue(0)) {
            return 0;
        }
    #/
    if (ent == self.owner) {
        return 0;
    }
    if (!isdefined(ent.team) || ent.team == self.team) {
        return 0;
    }
    if (!isdefined(ent.classname)) {
        return 0;
    }
    if (!isplayer(ent) && !isagent(ent)) {
        return 0;
    }
    if (!isreallyalive(ent)) {
        return 0;
    }
    return 1;
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x219c
// Size: 0x8f
function private deployeddecoy_watchfordetonate() {
    self notify("deployedDecoy_watchForDetonate");
    self endon("deployedDecoy_watchForDetonate");
    self endon("mine_destroyed");
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (1) {
        self waittill("detonate");
        if (!istrue(self.var_65219c911f198c95)) {
            if (self getheldoffhand().basename == "deployed_decoy_mp" || self getheldoffhand().basename == "none" && istrue(self.isusingcamera)) {
                function_8c54dff0ad6753d4();
                break;
            }
        }
    }
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2232
// Size: 0x6f
function private function_8c54dff0ad6753d4() {
    self.var_972e08bb6f0816f1 = undefined;
    if (isdefined(self.var_7f0ad61b396c9477)) {
        foreach (var_a335666a563c40c0 in self.var_7f0ad61b396c9477) {
            var_a335666a563c40c0 function_a5577c168f2cd487();
        }
    }
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x22a8
// Size: 0x5c
function private function_6438a3c103f573ee(ent) {
    var_44060504f23c16af = [];
    if (isdefined(ent)) {
        var_ad283a45677a1ea3 = ent gettagorigin("j_mainroot");
        var_44060504f23c16af = [0:var_ad283a45677a1ea3];
        var_44060504f23c16af[var_44060504f23c16af.size] = ent gettagorigin("j_spineupper");
        var_44060504f23c16af[var_44060504f23c16af.size] = ent.origin;
    }
    return var_44060504f23c16af;
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x230c
// Size: 0x250
function private function_5fa9e8666a1b8da(ent) {
    self.var_820c08bc4a68289f = undefined;
    var_820c08bc4a68289f = spawnstruct();
    var_820c08bc4a68289f.iscomplete = 0;
    var_44060504f23c16af = function_6438a3c103f573ee(ent);
    foreach (var_a00164b06f60f5e6 in var_44060504f23c16af) {
        var_820c08bc4a68289f = spawnstruct();
        var_820c08bc4a68289f.targetpos = var_a00164b06f60f5e6;
        var_820c08bc4a68289f.iscomplete = 1;
        var_820c08bc4a68289f.var_f2a216076f977490 = 0;
        var_820c08bc4a68289f.var_37e9b11a3f0f2afc = 0;
        var_820c08bc4a68289f.var_d1fd51d0f7befd26 = 0;
        var_820c08bc4a68289f.var_e9b7d63908996c9e = 0;
        var_820c08bc4a68289f.var_3045266dfc71b133 = 0;
        var_820c08bc4a68289f.var_2b7fcecfef6352b4 = 0;
        var_820c08bc4a68289f.var_f2a216076f977490 = function_1f54beb17865d9c2(var_a00164b06f60f5e6);
        var_820c08bc4a68289f.var_37e9b11a3f0f2afc = function_284789987babce6e(var_a00164b06f60f5e6);
        var_820c08bc4a68289f.var_d1fd51d0f7befd26 = function_5992cd0b16e52700(var_a00164b06f60f5e6, 58);
        var_820c08bc4a68289f.var_e9b7d63908996c9e = function_5992cd0b16e52700(var_a00164b06f60f5e6, 40);
        if (isdefined(self.var_ffe647a3e2fc6a87) && istrue(self.var_ffe647a3e2fc6a87 >= 72)) {
            var_820c08bc4a68289f.var_3045266dfc71b133 = function_5992cd0b16e52700(var_a00164b06f60f5e6, self.var_ffe647a3e2fc6a87);
        }
        if (isdefined(self.var_87df5e3d4be5e294)) {
            var_820c08bc4a68289f.var_2b7fcecfef6352b4 = var_820c08bc4a68289f.var_37e9b11a3f0f2afc && (var_820c08bc4a68289f.var_3045266dfc71b133 || var_820c08bc4a68289f.var_d1fd51d0f7befd26);
        } else {
            var_820c08bc4a68289f.var_2b7fcecfef6352b4 = var_820c08bc4a68289f.var_f2a216076f977490 && var_820c08bc4a68289f.var_37e9b11a3f0f2afc && (var_820c08bc4a68289f.var_d1fd51d0f7befd26 || var_820c08bc4a68289f.var_e9b7d63908996c9e);
        }
        if (var_820c08bc4a68289f.var_2b7fcecfef6352b4) {
            break;
        }
    }
    var_820c08bc4a68289f.var_e4cbf98c9aad2678 = 0;
    var_820c08bc4a68289f.var_e4cbf98c9aad2678 = function_db978960f126d2b();
    self.var_820c08bc4a68289f = var_820c08bc4a68289f;
    return self.var_820c08bc4a68289f;
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2564
// Size: 0x155
function private function_db978960f126d2b() {
    ignorelist = function_3ad49688e4d76bf0();
    contents = function_fb584d71af834f48();
    caststart = ter_op(isdefined(self.var_94981af7e247f403), self.var_94981af7e247f403, self.origin);
    caststart = caststart + (0, 0, 17);
    castend = caststart + (0, 0, 66);
    var_e021c2744cc7ed68 = namespace_2a184fc4902783dc::ray_trace(caststart, castend, ignorelist, contents, 0, 0);
    var_e229e51f9ff9a0e = 0;
    var_5700902c7edd5163 = undefined;
    if (isdefined(var_e021c2744cc7ed68["hittype"])) {
        if (var_e021c2744cc7ed68["hittype"] == "hittype_world" && isdefined(var_e021c2744cc7ed68["position"])) {
            var_5700902c7edd5163 = distance(caststart, var_e021c2744cc7ed68["position"]);
            thread namespace_f2ffc0540883e1ad::drawsphere(var_e021c2744cc7ed68["position"], 1, 100, (1, 0, 0));
        }
    }
    if (isdefined(var_5700902c7edd5163)) {
        if (var_5700902c7edd5163 >= 53) {
            var_e229e51f9ff9a0e = 1;
        }
        if (var_5700902c7edd5163 >= 66) {
            var_e229e51f9ff9a0e = 2;
        }
    } else {
        var_e229e51f9ff9a0e = 2;
    }
    /#
        if (1) {
            thread namespace_f2ffc0540883e1ad::drawline(caststart, caststart + (0, 0, 66), 5, (127, 0, 0));
        }
    #/
    return var_e229e51f9ff9a0e;
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x26c1
// Size: 0xec
function private function_5992cd0b16e52700(var_a00164b06f60f5e6, var_aa95611290376282) {
    ignorelist = function_3ad49688e4d76bf0();
    contents = function_ba2606cfb4c66281();
    var_e021c2744cc7ed68 = namespace_2a184fc4902783dc::ray_trace(self.origin + (0, 0, var_aa95611290376282), var_a00164b06f60f5e6, ignorelist, contents, 0, 1, 0);
    var_193cbb3cc7cccdf = isdefined(var_e021c2744cc7ed68) && var_e021c2744cc7ed68.size > 0 && var_e021c2744cc7ed68["hittype"] == "hittype_entity";
    /#
        if (1) {
            if (var_193cbb3cc7cccdf) {
                thread namespace_f2ffc0540883e1ad::drawline(self.origin + (0, 0, var_aa95611290376282), var_a00164b06f60f5e6, level.framedurationseconds, (0, 127, 0));
            } else {
                thread namespace_f2ffc0540883e1ad::drawline(self.origin + (0, 0, var_aa95611290376282), var_a00164b06f60f5e6, level.framedurationseconds, (127, 0, 0));
            }
        }
    #/
    return var_193cbb3cc7cccdf;
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x27b5
// Size: 0x6b
function private function_74514723c815eeca(var_47293b1e94ff8fb0) {
    if (!isdefined(var_47293b1e94ff8fb0)) {
        return 0;
    }
    forward = anglestoforward(self.angles);
    var_1650a941c8770f2f = vectornormalize(var_47293b1e94ff8fb0 - self.origin);
    var_3fe3a3dd483d56c9 = vectordot(forward, var_1650a941c8770f2f);
    return var_3fe3a3dd483d56c9 > 0.866 && var_3fe3a3dd483d56c9 > -0.866;
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2828
// Size: 0x32
function private function_284789987babce6e(var_a00164b06f60f5e6) {
    var_27789e85bfa3ea1f = abs(self.origin[2] - var_a00164b06f60f5e6[2]);
    return 384 >= var_27789e85bfa3ea1f;
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2862
// Size: 0x1f
function private function_1f54beb17865d9c2(var_a00164b06f60f5e6) {
    return 350 >= distance2d(var_a00164b06f60f5e6, self.origin);
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2889
// Size: 0x6d
function function_81d957f621cb0552(attacker, ent) {
    if (isdefined(attacker)) {
        attacker endon("death_or_disconnect");
    } else {
        attacker = self.owner;
    }
    printgameaction("Decoy triggered", self.owner);
    makeexplosiveunusuabletag();
    self setscriptablepartstate("trigger", "active", 0);
    thread function_a5577c168f2cd487(attacker);
    self notify("mine_triggered");
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x28fd
// Size: 0x7d
function private function_9b581bb90dfe8e0f() {
    self endon("death");
    level endon("game_ended");
    owner = self.owner;
    attacker = self waittill("detonateExplosive");
    self.detonatingplayer = attacker;
    if (istrue(self.owner.var_65219c911f198c95)) {
        owner notify("deployedDecoy_unset");
        thread function_183a7478c53fd2f2();
        owner function_46ff5657c998dce8();
    } else {
        thread function_a5577c168f2cd487(attacker);
    }
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2981
// Size: 0x65
function function_786a7189ad105a77(var_b8f96bd12748f572) {
    if (!isdefined(self.var_7f0ad61b396c9477) || self.var_7f0ad61b396c9477.size == 0) {
        return 0;
    }
    _takeweapon(var_b8f96bd12748f572);
    self clearoffhandspecial();
    self.var_972e08bb6f0816f1 = 1;
    self notify("activateDecoy", "success");
    _giveweapon(var_b8f96bd12748f572);
    self assignweaponoffhandspecial(var_b8f96bd12748f572);
    return 1;
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x29ee
// Size: 0x6d
function private function_7168b5644ecfc7b7() {
    if (istrue(self.isjuggernaut)) {
        return 0;
    }
    if (self isinfreefall()) {
        return 0;
    }
    if (namespace_85d036cb78063c4a::issuperready() && !istrue(self.var_972e08bb6f0816f1)) {
        return 0;
    }
    if (self function_415fe9eeca7b2e2b()) {
        return 0;
    }
    if (self isthrowinggrenade()) {
        return 0;
    }
    if (!val::get("supers")) {
        return 0;
    }
    if (istrue(self.var_65219c911f198c95)) {
        return 0;
    }
    return 1;
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2a63
// Size: 0x11d
function private function_60135177a2faec7c(mine) {
    level endon("game_ended");
    self endon("deployedDecoy_unset");
    self notify("deployedDecoy_monitoringDetonation");
    self endon("deployedDecoy_monitoringDetonation");
    self endon("disconnect");
    if (isdefined(level.var_62f6f7640e4431e3) && istrue(level.var_62f6f7640e4431e3.var_5b66ed80c98f795b)) {
        self endon("death");
    }
    weaponobj = makeweapon("iw9_detonator_mp");
    while (1) {
        success = function_91132a4fd7767609();
        if (!success) {
            continue;
        }
        if (!function_7168b5644ecfc7b7()) {
            continue;
        }
        var_19163e14365d9264 = namespace_85d036cb78063c4a::getcurrentsuper();
        if (!isdefined(var_19163e14365d9264)) {
            continue;
        }
        if (var_19163e14365d9264.staticdata.ref == "super_select") {
            val::function_c9d0b43701bdba00("ppmenu");
            waitframe();
        }
        var_b8518d272e4c3423 = namespace_d325722f2754c2c4::function_f19f8b4cf085ecbd(weaponobj);
        /#
            if (!var_b8518d272e4c3423) {
                print("hittype");
            }
        #/
        thread function_8c54dff0ad6753d4();
        return;
    }
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2b87
// Size: 0x60
function private function_91132a4fd7767609() {
    childthread function_8711cc188d381233();
    childthread function_2708229faea7e5fd();
    msg = self waittill("activateDecoy");
    self notifyonplayercommandremove("tacButtonPress", "+smoke");
    self notifyonplayercommandremove("fragButtonPress", "+frag");
    self notifyonplayercommandremove("cameraActive", "+special");
    return msg == "success";
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2bef
// Size: 0x30
function private function_8711cc188d381233() {
    self endon("activateDecoy");
    self notifyonplayercommand("decoyExplodeKBM", "+special");
    self waittill("decoyExplodeKBM");
    self notify("activateDecoy", "success");
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2c26
// Size: 0x75
function private function_2708229faea7e5fd() {
    self endon("activateDecoy");
    self notifyonplayercommand("tacButtonPress", "+smoke");
    self notifyonplayercommand("fragButtonPress", "+frag");
    var_bd1267e9dea3dba9 = [0:"tacButtonPress", 1:"fragButtonPress"];
    thread namespace_85d036cb78063c4a::function_8d6d95114b2c9b0d(var_bd1267e9dea3dba9, [], 0.75);
    msg = self waittill("controllerSuperPress");
    self notify("activateDecoy", msg);
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2ca2
// Size: 0x26
function private function_ba2606cfb4c66281() {
    contents = namespace_2a184fc4902783dc::create_contents(1, 1, 0, 1, 1, 1, 1, 1, 1);
    return contents;
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2cd0
// Size: 0x28
function private function_fb584d71af834f48() {
    contents = namespace_2a184fc4902783dc::create_contents(1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0);
    return contents;
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2d00
// Size: 0x15
function private function_3ad49688e4d76bf0() {
    ignorelist = function_e0f66654476dc4f4();
    return ignorelist;
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2d1d
// Size: 0x135
function private function_e0f66654476dc4f4() {
    var_f755fddcdbf39420 = 1;
    /#
        var_f755fddcdbf39420 = 1;
    #/
    ignorelist = [];
    if (var_f755fddcdbf39420) {
        ignorelist[ignorelist.size] = self.owner;
        linkedents = self getlinkedchildren(1);
        if (!isdefined(linkedents)) {
            linkedents = [];
        }
        linkedents[linkedents.size] = self getlinkedparent();
        foreach (linkedent in linkedents) {
            if (isdefined(linkedent) && linkedent.classname == "grenade") {
                ignorelist[ignorelist.size] = linkedent;
            }
        }
    }
    if (isdefined(level.dynamicladders)) {
        foreach (struct in level.dynamicladders) {
            ignorelist[ignorelist.size] = struct.ents[0];
        }
    }
    return ignorelist;
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e5a
// Size: 0x14
function private function_3bf15b6532c44f8d(data) {
    namespace_8c5b266f689b1e0b::claymore_empapplied(data);
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e75
// Size: 0x1e
function private function_a6d1fd8a98751a36(data) {
    function_a5577c168f2cd487(data.attacker);
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e9a
// Size: 0x14
function private function_3b1d270b83dcdd41() {
    if (!istrue(self.armed)) {
        return 0;
    }
    return 1;
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2eb6
// Size: 0x74
function private function_2a3abc2b830ff7d2(dummy) {
    if (isdefined(dummy.var_44736cee8afad49b)) {
        foreach (door in dummy.var_44736cee8afad49b) {
            door thread function_3033ebeb29280a95(dummy);
        }
    }
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f31
// Size: 0x56
function private function_3033ebeb29280a95(dummy) {
    doorstate = self getscriptablepartstate("door", 1);
    if (isdefined(doorstate) && doorstate != "frozen" && doorstate != "locked") {
        self function_c7f3ac96dd01424("away", dummy.origin);
    }
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f8e
// Size: 0x2b
function private function_fab47ae10a7ec712(stuckto) {
    self endon("death");
    level endon("game_ended");
    stuckto waittill("death");
    function_5d24d48d0b8eb170(1);
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2fc0
// Size: 0x542
function private function_a5577c168f2cd487(attacker) {
    var_859c5e9d6c961151 = self.origin;
    cachedteam = self.team;
    var_3a8872b8e0be346a = self.owner;
    var_2c7cfe7b49cabd76 = namespace_9abe40d2af041eb2::function_3c5c5d86ef14420e(self.var_4e068e1c487dbebc);
    if (!function_3b1d270b83dcdd41()) {
        return;
    }
    level.mines[self getentitynumber()] = undefined;
    namespace_2a9588dfac284b77::deregisterspawn();
    makeexplosiveunusuabletag();
    if (isdefined(self.useobj)) {
        self.useobj delete();
    }
    self.exploding = 1;
    namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.headiconid);
    var_a199d96200a367d6 = self.angles;
    if (isdefined(attacker)) {
        if (!isdefined(self.var_820c08bc4a68289f) || !istrue(self.var_820c08bc4a68289f.iscomplete)) {
            function_5fa9e8666a1b8da(attacker);
        }
        if (attacker == self.owner) {
            var_a199d96200a367d6 = self.angles;
        } else {
            var_a199d96200a367d6 = vectortoangles(attacker.origin - self.origin);
            var_a199d96200a367d6 = (0, var_a199d96200a367d6[1], 0);
        }
    } else {
        function_5fa9e8666a1b8da(undefined);
    }
    /#
        if (1) {
            if (isdefined(attacker)) {
                thread namespace_f2ffc0540883e1ad::drawsphere(attacker.origin, 15, level.framedurationseconds, (255, 0, 0));
            }
            thread namespace_f2ffc0540883e1ad::drawangles(self.origin, var_a199d96200a367d6, 10, 1);
        }
    #/
    if (var_2c7cfe7b49cabd76) {
        function_85364189c6f041d7();
    }
    self.dummy = function_8958b19a2ecc8d46();
    self.owner.var_b79b9aa464c929bd[self.var_bdef88e59dc867f4] = self.dummy;
    self.dummy.var_9aadbd8d704d2fab = self.var_9aadbd8d704d2fab;
    self.dummy.angles = var_a199d96200a367d6;
    self.dummy.var_bdef88e59dc867f4 = self.var_bdef88e59dc867f4;
    self.dummy.var_44736cee8afad49b = self.var_44736cee8afad49b;
    if (isdefined(self.var_4e068e1c487dbebc) && var_2c7cfe7b49cabd76) {
        self.dummy linkto(self.var_4e068e1c487dbebc);
    } else if (isdefined(self.var_4e068e1c487dbebc)) {
        self.dummy thread function_fab47ae10a7ec712(self.var_4e068e1c487dbebc);
    }
    self setscriptablepartstate("plant", "neutral", 0);
    self setscriptablepartstate("trigger", "neutral", 0);
    self setscriptablepartstate("explode", "active", 0);
    thread namespace_861236fa8235a2ba::function_ecf65e63998a0845();
    glassradiusdamage(self.origin, 85, 75, 25);
    function_2a3abc2b830ff7d2(self.dummy);
    if (isdefined(self.dummy)) {
        self.dummy thread function_2ae474eb2c763dca(self.var_9aadbd8d704d2fab);
        self.dummy thread function_38042b771a7de69d(1);
        self.dummy function_49197cd063a740ea(&function_5d24d48d0b8eb170);
        if (isdefined(self.var_4e068e1c487dbebc)) {
            self.dummy.moving_platform = self.var_4e068e1c487dbebc;
            data = spawnstruct();
            data.linkparent = self.dummy.moving_platform;
            data.deathoverridecallback = &function_56a30ebf54077e71;
            data.validateaccuratetouching = 1;
            self.dummy thread namespace_d7b023c7eb3949d0::handle_moving_platforms(data);
            self.dummy thread function_19c1fff6756bca97();
        } else if (isdefined(level.wztrain_info)) {
            data = spawnstruct();
            data.deathoverridecallback = &function_56a30ebf54077e71;
            self.dummy thread namespace_d7b023c7eb3949d0::handle_moving_platforms(data);
        }
    }
    if (isdefined(var_859c5e9d6c961151) && isdefined(cachedteam) && isdefined(var_3a8872b8e0be346a)) {
        pinglocationenemyteams(var_859c5e9d6c961151, cachedteam, var_3a8872b8e0be346a);
    }
    if (isdefined(level) && isdefined(level.elevators)) {
        foreach (elevators in level.elevators) {
            if (!isdefined(elevators)) {
                continue;
            }
            if (!isdefined(self)) {
                continue;
            }
            if (!isdefined(self.dummy)) {
                continue;
            }
            elevators thread namespace_272931699e2fe8e9::function_29de8f099a0a63df(self.dummy);
        }
    }
    self.owner thread function_b53a82180c76b481();
    if (isdefined(self.dummy) && isdefined(self.var_820c08bc4a68289f) && self.var_820c08bc4a68289f.var_e4cbf98c9aad2678 == 0) {
        self.dummy thread function_5d24d48d0b8eb170(1);
    }
    function_183a7478c53fd2f2();
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3509
// Size: 0xbd
function private function_ecf65e63998a0845() {
    level endon("game_ended");
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (player.team == self.team) {
            continue;
        }
        if (16 >= distance2dsquared(self.origin, player.origin)) {
            player dodamage(125, self.origin, self.owner, self, undefined, "deployed_decoy_mp", undefined, undefined);
        }
    }
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35cd
// Size: 0x21
function function_19c1fff6756bca97() {
    self endon("death");
    while (isdefined(self getlinkedparent())) {
        waitframe();
    }
    function_5d24d48d0b8eb170(1);
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x35f5
// Size: 0x6f
function private function_fc9eaf4f16837717() {
    if (istrue(level.dangerzoneskipequipment)) {
        return;
    }
    if (isdefined(self.dangerzone)) {
        namespace_b2d5aa2baf2b5701::removespawndangerzone(self.dangerzone);
    }
    self.dangerzone = namespace_b2d5aa2baf2b5701::addspawndangerzone(self.origin, namespace_b2d5aa2baf2b5701::getdefaultminedangerzoneradiussize(), 72, self.owner.team, undefined, self.owner, 0, self, 1);
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x366b
// Size: 0xeb
function private function_a6856182b82cbc63(var_629e073572854f50, var_a50d4ac45ec0f007) {
    if (!isdefined(var_a50d4ac45ec0f007)) {
        spawnpos = ter_op(isdefined(self.var_94981af7e247f403), self.var_94981af7e247f403, self.origin);
    } else {
        spawnpos = ter_op(isdefined(self.var_94981af7e247f403), self.var_94981af7e247f403, self.origin) + var_a50d4ac45ec0f007;
    }
    model = spawn("script_model", spawnpos);
    model setmodel(var_629e073572854f50);
    model.weapon_name = "deployed_decoy_mp";
    model.team = self.owner.team;
    model.owner = self.owner;
    model namespace_6d9917c3dc05dbe9::registersentient("Killstreak_Ground", self.owner, 1);
    return model;
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x375e
// Size: 0x16d
function private function_8958b19a2ecc8d46() {
    dummy = undefined;
    if (isdefined(self.var_ffe647a3e2fc6a87) && self.var_ffe647a3e2fc6a87 > 40) {
        dummy = function_120277e9245abef8();
    } else if (isdefined(self.var_820c08bc4a68289f) && istrue(self.var_820c08bc4a68289f.iscomplete) && istrue(self.var_820c08bc4a68289f.var_d1fd51d0f7befd26 && !self.var_820c08bc4a68289f.var_e9b7d63908996c9e && self.var_820c08bc4a68289f.var_e4cbf98c9aad2678 >= 2)) {
        dummy = function_65bab2b826c7c79f();
    } else if (isdefined(self.var_820c08bc4a68289f) && istrue(self.var_820c08bc4a68289f.iscomplete) && istrue(!self.var_820c08bc4a68289f.var_d1fd51d0f7befd26 && self.var_820c08bc4a68289f.var_e9b7d63908996c9e && self.var_820c08bc4a68289f.var_e4cbf98c9aad2678 >= 1)) {
        dummy = function_a9b9f466bd2859c7();
    } else {
        randint = randomint(2);
        if (randint > 0) {
            dummy = function_65bab2b826c7c79f();
        } else {
            dummy = function_a9b9f466bd2859c7();
        }
    }
    dummy function_9aa20ecdd4292776();
    dummy namespace_2a9588dfac284b77::registerspawn(1, &function_d3862975bb307ee3);
    return dummy;
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x38d3
// Size: 0x28
function private function_65bab2b826c7c79f() {
    var_32255dab0bc79f68 = function_a6856182b82cbc63("offhand_2h_wm_decoy_mine_dummy01_v0_mp");
    self.var_9aadbd8d704d2fab = "dummy_standing";
    return var_32255dab0bc79f68;
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3903
// Size: 0x28
function private function_a9b9f466bd2859c7() {
    var_32255dab0bc79f68 = function_a6856182b82cbc63("offhand_2h_wm_decoy_mine_dummy02_v0_mp");
    self.var_9aadbd8d704d2fab = "dummy_crouching";
    return var_32255dab0bc79f68;
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3933
// Size: 0x37
function private function_120277e9245abef8() {
    var_32255dab0bc79f68 = function_a6856182b82cbc63("offhand_2h_wm_decoy_mine_dummy03_v0_mp", (0, 0, self.var_ffe647a3e2fc6a87 - 8));
    self.var_9aadbd8d704d2fab = "dummy_swimming";
    return var_32255dab0bc79f68;
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3972
// Size: 0x144
function private function_2ae474eb2c763dca(instring) {
    self.owner endon("disconnect");
    self endon("death");
    level endon("endgame");
    if (!isdefined(instring)) {
        return 0;
    }
    switch (instring) {
    case #"hash_e2fb276aea336c4c":
        self setscriptablepartstate("inflate", "iw9_mp_decoymine_inflate", 0);
        wait(getanimlength(scriptables%iw9_mp_decoymine_inflate));
        self setscriptablepartstate("idle", "iw9_mp_decoymine_idle", 0);
        self setscriptablepartstate("inflate", "neutral", 0);
        break;
    case #"hash_cb01a8c73dfd3d8e":
        self setscriptablepartstate("inflate", "iw9_mp_decoymine_crouch_inflate", 0);
        wait(getanimlength(scriptables%iw9_mp_decoymine_crouch_inflate));
        self setscriptablepartstate("idle", "iw9_mp_decoymine_crouch_idle", 0);
        self setscriptablepartstate("inflate", "neutral", 0);
        break;
    case #"hash_db29f8f85388749":
        self setscriptablepartstate("inflate", "iw9_mp_decoymine_swim_inflate", 0);
        wait(getanimlength(scriptables%iw9_mp_decoymine_swim_inflate));
        self setscriptablepartstate("idle", "iw9_mp_decoymine_swim_idle", 0);
        self setscriptablepartstate("inflate", "neutral", 0);
        break;
    default:
        break;
    }
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3abd
// Size: 0x2e1
function private function_3f3ce37397b66e92(instring, var_4ba1c61df5b425cc) {
    self endon("death");
    switch (instring) {
    case #"hash_e2fb276aea336c4c":
        if (istrue(var_4ba1c61df5b425cc)) {
            self setscriptablepartstate("deflate", "iw9_mp_decoymine_pop", 0);
            wait(getanimlength(scriptables%iw9_mp_decoymine_pop));
            self setscriptablepartstate("dummy_vis", "dummy_vis_hide", 0);
            wait(0.4);
            glassradiusdamage(self.origin, 72, 75, 25);
            self setscriptablepartstate("deflate", "neutral", 0);
        } else {
            self setscriptablepartstate("hitreact", "neutral", 0);
            self setscriptablepartstate("idle", "neutral", 0);
            self setscriptablepartstate("deflate", "iw9_mp_decoymine_deflate", 0);
            wait(getanimlength(scriptables%iw9_mp_decoymine_deflate));
            self setscriptablepartstate("dummy_vis", "dummy_vis_hide", 0);
            self setscriptablepartstate("deflate", "neutral", 0);
        }
        break;
    case #"hash_cb01a8c73dfd3d8e":
        if (istrue(var_4ba1c61df5b425cc)) {
            self setscriptablepartstate("deflate", "iw9_mp_decoymine_crouch_pop", 0);
            wait(getanimlength(scriptables%iw9_mp_decoymine_crouch_pop));
            self setscriptablepartstate("dummy_vis", "dummy_vis_hide", 0);
            wait(0.4);
            glassradiusdamage(self.origin, 72, 75, 25);
            self setscriptablepartstate("deflate", "neutral", 0);
        } else {
            self setscriptablepartstate("hitreact", "neutral", 0);
            self setscriptablepartstate("idle", "neutral", 0);
            self setscriptablepartstate("deflate", "iw9_mp_decoymine_crouch_deflate", 0);
            wait(getanimlength(scriptables%iw9_mp_decoymine_crouch_deflate));
            self setscriptablepartstate("dummy_vis", "dummy_vis_hide", 0);
            self setscriptablepartstate("deflate", "neutral", 0);
        }
        break;
    case #"hash_db29f8f85388749":
        if (istrue(var_4ba1c61df5b425cc)) {
            self setscriptablepartstate("deflate", "iw9_mp_decoymine_swim_pop", 0);
            wait(getanimlength(scriptables%iw9_mp_decoymine_swim_pop));
            self setscriptablepartstate("dummy_vis", "dummy_vis_hide", 0);
            wait(0.4);
            glassradiusdamage(self.origin, 72, 75, 25);
            self setscriptablepartstate("dummy_vis", "dummy_vis_hide", 0);
            self setscriptablepartstate("deflate", "neutral", 0);
        } else {
            self setscriptablepartstate("hitreact", "neutral", 0);
            self setscriptablepartstate("idle", "neutral", 0);
            self setscriptablepartstate("deflate", "iw9_mp_decoymine_swim_deflate", 0);
            wait(getanimlength(scriptables%iw9_mp_decoymine_swim_deflate));
            self setscriptablepartstate("deflate", "neutral", 0);
        }
        break;
    default:
        /#
            assertmsg("No dummy type string passed in when calling deployedDecoy_animateDummyDeflate()");
        #/
        break;
    }
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3da5
// Size: 0xc6
function private function_38042b771a7de69d(delay) {
    level endon("game_ended");
    self endon("death");
    self endon("destroy");
    if (isdefined(delay)) {
        wait(delay);
    }
    switch (self.var_9aadbd8d704d2fab) {
    case #"hash_e2fb276aea336c4c":
        self.headiconid = namespace_7bdde15c3500a23f::setheadicon_factionimage(0, 65, undefined, undefined, undefined, 0, 1, 0, undefined, 0);
        break;
    case #"hash_cb01a8c73dfd3d8e":
        self.headiconid = namespace_7bdde15c3500a23f::setheadicon_factionimage(0, 52, undefined, undefined, undefined, 0, 1, 0, undefined, 0);
        break;
    case #"hash_db29f8f85388749":
        self.headiconid = namespace_7bdde15c3500a23f::setheadicon_factionimage(0, 29, undefined, undefined, undefined, 0, 1, 0, undefined, 0);
        break;
    default:
        break;
    }
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3e72
// Size: 0x98
function private function_91b48467f9da9f0e() {
    var_913576e1dc1762b5 = getentitylessscriptablearray(undefined, undefined, self.origin, 75);
    self.var_44736cee8afad49b = [];
    foreach (var_1109e0ccf82e9964 in var_913576e1dc1762b5) {
        if (var_1109e0ccf82e9964 scriptableisdoor() || var_1109e0ccf82e9964 scriptabledoorisdouble()) {
            self.var_44736cee8afad49b[self.var_44736cee8afad49b.size] = var_1109e0ccf82e9964;
        }
    }
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f11
// Size: 0x29
function function_183a7478c53fd2f2() {
    level endon("endgame");
    if (isdefined(self)) {
        self setscriptablepartstate("destroy", "active", 0);
        childthread function_ec4ed8b35f49093();
    }
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f41
// Size: 0x14a
function function_ec4ed8b35f49093() {
    self endon("death");
    level endon("endgame");
    if (isdefined(self)) {
        self setscriptablepartstate("hack_usable", "off");
        if (isdefined(self.owner) && isdefined(self.owner.var_7f0ad61b396c9477)) {
            self.owner.var_7f0ad61b396c9477 = array_remove(self.owner.var_7f0ad61b396c9477, self);
        }
        namespace_3e725f3cc58bddd3::monitordamageend();
        level.mines[self getentitynumber()] = undefined;
        self setcandamage(0);
        makeexplosiveunusuabletag();
        namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.headiconid);
        self.headiconid = undefined;
        self.exploding = 1;
        if (isdefined(self.dangerzone)) {
            namespace_b2d5aa2baf2b5701::removespawndangerzone(self.dangerzone);
            self.dangerzone = undefined;
        }
        if (isdefined(self.dummy)) {
            self.dummy thread function_13249d21f9c1c453(30);
            self.dummy thread function_954e9d8fc6c1e0c6();
        }
        namespace_2a9588dfac284b77::deregisterspawn();
        if (isdefined(self.owner)) {
            self.owner removeequip(self);
        }
        waitframe();
        self delete();
    }
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4092
// Size: 0x94
function private function_d3862975bb307ee3() {
    self endon("death");
    level endon("game_ended");
    namespace_3e725f3cc58bddd3::monitordamageend();
    namespace_2a9588dfac284b77::deregisterspawn();
    namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.headiconid);
    self.headiconid = undefined;
    if (isdefined(self.owner) && isdefined(self.owner.var_b79b9aa464c929bd)) {
        self.owner.var_b79b9aa464c929bd = array_remove(self.owner.var_b79b9aa464c929bd, self);
    }
    waittillframeend();
    self delete();
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x412d
// Size: 0x15
function function_56a30ebf54077e71(data) {
    function_5d24d48d0b8eb170(1);
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4149
// Size: 0x67
function private function_5d24d48d0b8eb170(var_4ba1c61df5b425cc) {
    if (!isdefined(self)) {
        return;
    }
    self endon("death");
    self.var_3fe87ed1237724cc = 1;
    self notify("deployedDecoy_resumeIdleAnimation_cancel");
    self notify("deployedDecoy_queueDummyDestroy_Interupt");
    self setscriptablepartstate("hitreact", "neutral", 0);
    self notify("destroy");
    function_3f3ce37397b66e92(self.var_9aadbd8d704d2fab, var_4ba1c61df5b425cc);
    waittillframeend();
    function_d3862975bb307ee3();
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x41b7
// Size: 0x25
function private function_13249d21f9c1c453(var_cbf7be4f62a0ddb2) {
    self endon("deployedDecoy_queueDummyDestroy_Interupt");
    if (!isdefined(var_cbf7be4f62a0ddb2)) {
        var_cbf7be4f62a0ddb2 = 0;
    }
    wait(var_cbf7be4f62a0ddb2);
    thread function_5d24d48d0b8eb170();
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x41e3
// Size: 0x49
function private function_954e9d8fc6c1e0c6() {
    if (!isdefined(level.var_62f6f7640e4431e3) || !istrue(level.var_62f6f7640e4431e3.var_5b66ed80c98f795b)) {
        return;
    }
    self endon("deployedDecoy_queueDummyDestroy_Interupt");
    self.owner waittill("death_or_disconnect");
    thread function_5d24d48d0b8eb170();
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4233
// Size: 0x4a
function function_34669788fde2926b(objweapon, var_7004db721e68783e) {
    if (istrue(var_7004db721e68783e)) {
        return (isdefined(objweapon) && istrue(objweapon.basename == "deployed_decoy_mp"));
    }
    return isdefined(objweapon) && istrue(objweapon.basename == "deployed_decoy_mp");
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4285
// Size: 0x90
function private function_31abc24ceaa8d163(var_f357880cc9acabda) {
    if (!isdefined(var_f357880cc9acabda) || !isdefined(var_f357880cc9acabda.owner)) {
        return 0;
    }
    self notify("deployedDecoy_watchScoringThread");
    self endon("deployedDecoy_watchScoringThread");
    var_f357880cc9acabda.owner endon("disconnect");
    level endon("game_ended");
    self.var_a4d803f0a1114e87 = var_f357880cc9acabda getentitynumber();
    self.var_b8b8b6b0af551e03 = var_f357880cc9acabda.owner;
    waittill_any_timeout_1(10, "decoyDummyEndScoring");
    self.var_a4d803f0a1114e87 = undefined;
    self.var_b8b8b6b0af551e03 = undefined;
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x431c
// Size: 0x74
function private function_3972a29b456ebeec(data) {
    if (data.attacker != self.owner) {
        if (!data.attacker function_a26953a3e8e58a3f(self)) {
            if (isdefined(self.owner)) {
                self.owner thread namespace_48a08c5037514e04::doscoreevent(#"hash_218b72ef391e7f09");
            }
        }
        data.attacker thread function_31abc24ceaa8d163(self);
    }
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4397
// Size: 0x42
function function_a22d831b624cccd2() {
    if (function_a26953a3e8e58a3f()) {
        self.var_b8b8b6b0af551e03 thread namespace_48a08c5037514e04::doscoreevent(#"hash_63ddb3737fcc850d");
        self notify("decoyDummyEndScoring");
    }
    self.var_a4d803f0a1114e87 = undefined;
    self.var_b8b8b6b0af551e03 = undefined;
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x43e0
// Size: 0x63
function private function_a26953a3e8e58a3f(var_734c4b4e112907b2) {
    if (!isdefined(var_734c4b4e112907b2) && isdefined(self.var_a4d803f0a1114e87)) {
        var_734c4b4e112907b2 = getentbynum(self.var_a4d803f0a1114e87);
    }
    return isdefined(self.var_a4d803f0a1114e87) && isdefined(self.var_b8b8b6b0af551e03) && isdefined(var_734c4b4e112907b2) && istrue(var_734c4b4e112907b2 getentitynumber() == self.var_a4d803f0a1114e87);
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x444b
// Size: 0x1d
function function_f4231eed765ce56c() {
    return isdefined(self.var_7f0ad61b396c9477) && self.var_7f0ad61b396c9477.size > 0;
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4470
// Size: 0x16
function function_49197cd063a740ea(callbackfunction) {
    self.var_d1659ed0a33bf98f = callbackfunction;
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x448d
// Size: 0x1c5
function private function_fa6a545da2197663() {
    /#
        self endon("No dummy type string passed in when calling deployedDecoy_animateDummyDeflate()");
        self endon("iw9_mp_decoymine_crouch_hitreac_back");
        self endon("scriptables");
        while (1) {
            if (!isdefined(self)) {
                return;
            }
            if (!isdefined(self.origin)) {
                return;
            }
            thread namespace_f2ffc0540883e1ad::drawcylinder(self.origin, 720, 384, level.framedurationseconds, (0, 0, 255));
            thread namespace_f2ffc0540883e1ad::drawcylinder(self.origin, 350, 384, level.framedurationseconds, (0, 0, 255));
            thread namespace_f2ffc0540883e1ad::drawcylinder(self.origin, 15, 40, level.framedurationseconds, (0, 0, 127));
            thread namespace_f2ffc0540883e1ad::drawcylinder(self.origin, 15, 58, level.framedurationseconds, (0, 0, 127));
            thread namespace_f2ffc0540883e1ad::drawangles(self.origin, self.angles, level.framedurationseconds, 1);
            if (isdefined(self.dummy)) {
                thread namespace_f2ffc0540883e1ad::drawsphere(self.dummy.origin, 1, level.framedurationseconds, (0, 0, 127));
                thread namespace_f2ffc0540883e1ad::drawangles(self.dummy.origin, self.dummy.angles, level.framedurationseconds, 1);
            }
            if (isdefined(self.var_87df5e3d4be5e294)) {
                thread namespace_f2ffc0540883e1ad::drawcylinder(self.var_87df5e3d4be5e294, 350, 5, level.framedurationseconds, (255, 0, 255));
            }
            waitframe();
        }
    #/
}

// Namespace deployed_decoy/namespace_861236fa8235a2ba
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4659
// Size: 0x408
function private function_46bfca70cc1648f8(data) {
    /#
        if (0) {
            var_9f92884414aa49fb = 10;
            var_6bc62fe7e1454254 = int(var_9f92884414aa49fb / level.framedurationseconds);
            var_76704cee002e54f6 = 0.15;
            colorred = (1, 0, 0);
            colorgreen = (0, 1, 0);
            var_92f3061f37d30238 = (0, 0, 1);
            var_6a7c727cda8dbc21 = (1, 0, 1);
            up = anglestoup(self.angles);
            var_4a67f8baa6fccee8 = self.origin + up;
            forward = anglestoforward(self.angles);
            var_5ab83cafab126362 = self.origin + forward;
            var_b752aa0da59ae52c = self.origin + forward * 72;
            thread namespace_f2ffc0540883e1ad::drawline(self.origin, var_b752aa0da59ae52c, var_9f92884414aa49fb, var_6a7c727cda8dbc21);
            right = anglestoright(self.angles);
            var_aa2ccc129f7c6e1d = self.origin + right;
            direction = data.direction_vec;
            var_6bf329488283c602 = self.origin + vectornormalize(direction);
            var_7de45188a78bcccc = self.origin + vectornormalize(direction) * 72;
            angledelta = anglesdelta(vectortoangles(direction), vectortoangles(forward));
            var_dd4fec1f7555332c = vectordot(forward, direction);
            var_8bbcf51ff5504b0d = vectordot(right, direction);
            var_29a6370ca54fc4b7 = function_53c4c53197386572(function_5d2ce17e3de0719b(data), "scriptables");
            thread namespace_f2ffc0540883e1ad::drawcylinder(self.origin, 72, 10, var_9f92884414aa49fb, colorgreen);
            for (i = 0; i <= 3; i++) {
                degrees = 45 + 90 * i;
                rot = rotatepointaroundvector(up, forward, degrees);
                rot = vectornormalize(rot) * 72;
                thread namespace_f2ffc0540883e1ad::drawsphere(self.origin + rot, 1, var_9f92884414aa49fb, colorgreen);
                thread namespace_f2ffc0540883e1ad::drawline(self.origin, self.origin + rot, var_9f92884414aa49fb, colorgreen);
            }
            if (isdefined(data)) {
                if (isdefined(data.point)) {
                    thread namespace_f2ffc0540883e1ad::drawsphere(data.point, 1, var_9f92884414aa49fb, colorred);
                    if (isdefined(data.attacker)) {
                        thread namespace_f2ffc0540883e1ad::drawline(data.point, data.attacker.origin, var_9f92884414aa49fb, colorred);
                    }
                }
                if (isdefined(data.direction_vec)) {
                    thread namespace_f2ffc0540883e1ad::drawline(self.origin, var_7de45188a78bcccc, var_9f92884414aa49fb, var_92f3061f37d30238);
                }
                var_bce79209c754c068 = data.attacker.origin;
                print3d(var_bce79209c754c068 + (0, 0, 24), "iw9_mp_decoymine_crouch_deflate" + angledelta, colorgreen, 1, var_76704cee002e54f6, var_6bc62fe7e1454254, 1);
                print3d(var_bce79209c754c068 + (0, 0, 18), "<unknown string>" + var_dd4fec1f7555332c, colorgreen, 1, var_76704cee002e54f6, var_6bc62fe7e1454254, 1);
                print3d(var_bce79209c754c068 + (0, 0, 12), "<unknown string>" + var_8bbcf51ff5504b0d, colorgreen, 1, var_76704cee002e54f6, var_6bc62fe7e1454254, 1);
                print3d(var_bce79209c754c068 + (0, 0, 6), "<unknown string>" + var_29a6370ca54fc4b7, colorgreen, 1, var_76704cee002e54f6, var_6bc62fe7e1454254, 1);
            }
        }
    #/
}

