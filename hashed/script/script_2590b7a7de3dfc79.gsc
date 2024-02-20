// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\mp\gamescore.gsc;
#using script_3214e6fcdce468a7;
#using script_38eb8f4be20d54f4;
#using script_3b64eb40368c1450;
#using script_16ea1b94f0f381b3;
#using script_2590b7a7de3dfc79;
#using script_639bf783929acf9b;
#using scripts\mp\rank.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\points.gsc;
#using script_3f1b6713ca4c9c7;
#using scripts\mp\utility\killstreak.gsc;
#using script_2669878cf5a1b6bc;

#namespace points;

// Namespace points/namespace_301533d2f1378cb9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55d
// Size: 0xd1
function init() {
    registersharedfunc("points", "get_points", &function_b86115649d705017);
    registersharedfunc("points", "set_points", &function_5fb17ad4d286b0d5);
    registersharedfunc("points", "take_points", &function_e04a2325dbe8153c);
    registersharedfunc("points", "add_points", &function_b5b4f530f1c579aa);
    level.modifyunifiedpointscallback = &function_c7f9db170bb3828b;
    level.var_9871526022516e0b = &function_cf6a439e1dd8049f;
    level callback::add("on_ai_killed", &function_269657aa69da2b38);
    level callback::add("zombie_score_event", &function_ccac14f2510dd65a);
    level callback::add("player_connect", &on_player_connect);
    level callback::add("player_damaged", &on_player_damaged);
    level callback::add("lootcache_looted", &function_8b134141131f364a);
}

// Namespace points/namespace_301533d2f1378cb9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x635
// Size: 0x5f
function function_8b134141131f364a(params) {
    if (isdefined(params.var_beeb487603b69a3e) && isdefined(params.var_beeb487603b69a3e.type) && !istrue(params.var_beeb487603b69a3e.var_ae47fb2dd3b3a15f)) {
        namespace_301533d2f1378cb9::function_ddee59d6b1a2b9e(#"hash_f0bd5f0d32453556");
    }
}

// Namespace points/namespace_301533d2f1378cb9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69b
// Size: 0x68
function on_player_damaged(params) {
    if (isplayer(params.victim)) {
        params.victim.var_b57b122cb903fddf = function_53c4c53197386572(params.victim.var_b57b122cb903fddf, 0);
        params.victim.var_b57b122cb903fddf = 0;
    }
}

// Namespace points/namespace_301533d2f1378cb9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70a
// Size: 0x47
function on_player_connect(params) {
    var_79d8c8dc68beb094 = function_53c4c53197386572(namespace_7dfc6454a70f3f39::function_7dfe1b812431019f("essence"), 0);
    namespace_7dfc6454a70f3f39::function_adc47eed1b02ec05("essence", var_79d8c8dc68beb094);
    callback::add("safe_opened_nearby", &function_72ce62d47c71bec5);
}

// Namespace points/namespace_301533d2f1378cb9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x758
// Size: 0x1c
function function_72ce62d47c71bec5(var_d27680ff86693f5c) {
    function_ddee59d6b1a2b9e(#"hash_c02c8c802f07c908");
}

// Namespace points/namespace_301533d2f1378cb9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77b
// Size: 0x44
function function_bd0c9022c796f049(eventstring, sweapon) {
    if (!function_d03495fe6418377b(eventstring)) {
        eventstring = function_1823ff50bb28148d(eventstring);
    }
    xp = namespace_62c556437da28f50::getscoreinfoxp(eventstring);
    if (isdefined(xp) && xp != 0) {
    }
    return xp;
}

// Namespace points/namespace_301533d2f1378cb9
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c7
// Size: 0x2d
function function_c7f9db170bb3828b(points, event, player, objweapon) {
    return points * player function_1b86539a6f213fc3();
}

// Namespace points/namespace_301533d2f1378cb9
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fc
// Size: 0xaa
function function_ddee59d6b1a2b9e(scoreevent, sweapon, var_7594386ec6f06936, reason) {
    if (!isdefined(var_7594386ec6f06936)) {
        var_7594386ec6f06936 = 0;
    }
    if (!isdefined(reason)) {
        reason = #"none";
    }
    if (!isplayer(self) || namespace_7e17181d03156026::isinlaststand(self) && !var_7594386ec6f06936) {
        return;
    }
    var_4b5a99c16abfdfb1 = function_bd0c9022c796f049(scoreevent, sweapon);
    namespace_48a08c5037514e04::doScoreEvent(scoreevent, undefined, undefined, var_4b5a99c16abfdfb1, undefined, undefined, undefined, undefined, undefined, 1);
    essence = function_b86115649d705017();
    namespace_7dfc6454a70f3f39::function_d0948454b7f94d18("essence", essence, reason);
    self setclientomnvar("zm_essence", essence);
}

// Namespace points/namespace_301533d2f1378cb9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ad
// Size: 0x73
function function_8c80bfd5eb313b22(eventstring, points, victim) {
    if (!isplayer(self) || namespace_7e17181d03156026::isinlaststand(self)) {
        return;
    }
    namespace_48a08c5037514e04::doScoreEvent(eventstring, undefined, points, undefined, victim, undefined, undefined, undefined, undefined, 1);
    essence = function_b86115649d705017();
    self.currency["essence"] = essence;
    self setclientomnvar("zm_essence", essence);
}

// Namespace points/namespace_301533d2f1378cb9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x927
// Size: 0x64
function function_e04a2325dbe8153c(points) {
    var_7460d810db8a0ba9 = namespace_e8a49b70d0769b66::_getplayerscore(self);
    points = var_7460d810db8a0ba9 - points;
    if (points < 0) {
        points = 0;
    }
    namespace_e8a49b70d0769b66::_setplayerscore(self, points);
    essence = function_b86115649d705017();
    self.currency["essence"] = essence;
    self setclientomnvar("zm_essence", essence);
}

// Namespace points/namespace_301533d2f1378cb9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x992
// Size: 0x1b
function function_5ef7bc993b154224() {
    self.var_614607f42dca0826 = namespace_e8a49b70d0769b66::_getplayerscore(self);
    function_5fb17ad4d286b0d5(0);
}

// Namespace points/namespace_301533d2f1378cb9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b4
// Size: 0x21
function function_d57de844b62e642b() {
    if (!isdefined(self.var_614607f42dca0826)) {
        return;
    }
    function_5fb17ad4d286b0d5(self.var_614607f42dca0826);
}

// Namespace points/namespace_301533d2f1378cb9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9dc
// Size: 0x1e
function function_b86115649d705017() {
    var_7460d810db8a0ba9 = namespace_e8a49b70d0769b66::_getplayerscore(self);
    namespace_14f37777effc564d::function_52bea99a5c38fbe5(var_7460d810db8a0ba9);
    return var_7460d810db8a0ba9;
}

// Namespace points/namespace_301533d2f1378cb9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa02
// Size: 0x34
function function_b5b4f530f1c579aa(points) {
    var_7460d810db8a0ba9 = namespace_e8a49b70d0769b66::_getplayerscore(self);
    totalpoints = var_7460d810db8a0ba9 + points;
    function_5fb17ad4d286b0d5(totalpoints);
}

// Namespace points/namespace_301533d2f1378cb9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa3d
// Size: 0x77
function function_5fb17ad4d286b0d5(points) {
    if (points > 999999) {
        /#
            println("powerup_insta_kill_active" + points + "script_vehicle" + 999999 + "<unknown string>");
        #/
        points = 999999;
    }
    namespace_e8a49b70d0769b66::_setplayerscore(self, points);
    essence = function_b86115649d705017();
    self.currency["essence"] = essence;
    self setclientomnvar("zm_essence", essence);
}

// Namespace points/namespace_301533d2f1378cb9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xabb
// Size: 0x2a
function function_be68f708692f876f(value) {
    /#
        assert(isplayer(self), "set_point_scalar() called with a non-player!");
    #/
    self.zombie_point_scalar = value;
}

// Namespace points/namespace_301533d2f1378cb9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaec
// Size: 0x34
function function_1b86539a6f213fc3() {
    /#
        assert(isplayer(self), "get_point_scalar() called with a non-player!");
    #/
    if (isnumber(self.zombie_point_scalar)) {
        return self.zombie_point_scalar;
    }
    return 1;
}

// Namespace points/namespace_301533d2f1378cb9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb28
// Size: 0xe9
function function_818ac0c0b8f0b22(var_2267bb02be780ba4, var_5c46335c60a76f0) {
    if (var_2267bb02be780ba4 == #"hash_7296a029a7f526ab") {
        returnstring = function_2ef675c13ca1c4af(#"hash_7296a029a7f526ab", var_5c46335c60a76f0);
    } else if (var_2267bb02be780ba4 == #"hash_2366d11111d4ffbf") {
        returnstring = function_2ef675c13ca1c4af(#"hash_2366d11111d4ffbf", var_5c46335c60a76f0);
    } else if (var_2267bb02be780ba4 == #"hash_d9eee31ed154db7f") {
        returnstring = function_2ef675c13ca1c4af(#"hash_d9eee31ed154db7f", var_5c46335c60a76f0);
    } else if (var_2267bb02be780ba4 == #"hash_771a04cade420de4") {
        returnstring = function_2ef675c13ca1c4af(#"hash_771a04cade420de4", var_5c46335c60a76f0);
    } else if (var_2267bb02be780ba4 == #"hash_ec9ea86ce056e529") {
        returnstring = function_2ef675c13ca1c4af(#"hash_ec9ea86ce056e529", var_5c46335c60a76f0);
    } else {
        returnstring = var_2267bb02be780ba4;
    }
    returnstring = function_1823ff50bb28148d(returnstring);
    if (!array_contains_key(level.scoreinfo, returnstring)) {
        returnstring = var_2267bb02be780ba4;
    }
    return returnstring;
}

// Namespace points/namespace_301533d2f1378cb9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc19
// Size: 0x79
function function_191e620389d99b8e(weapon) {
    if (isdefined(weapon) && isdefined(weapon.basename)) {
        switch (weapon.basename) {
        case #"hash_e69f44ae97e8fc97":
            return "_monkeybomb";
        case #"hash_3e6715cf4cbc46d0":
            return "_turret_trap";
        case #"hash_15f465447f809c29":
            return "_kazimir";
        default:
            return undefined;
            break;
        }
    }
    return undefined;
}

// Namespace points/namespace_301533d2f1378cb9
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9a
// Size: 0x2ef
function function_cf6a439e1dd8049f(victim, eattacker, einflictor, smeansofdeath, sweapon, shitloc, typestring, var_aaf0465944b061ed) {
    if (isdefined(self.var_d37b75616f7c2ee) && isplayer(self.var_d37b75616f7c2ee.var_941802a0997e0c42) || isplayer(self.var_941802a0997e0c42)) {
        return;
    }
    var_76500cc4d834708d = var_aaf0465944b061ed;
    var_8c817724af28fb4d = function_191e620389d99b8e(sweapon);
    if (isdefined(var_8c817724af28fb4d)) {
        var_aaf0465944b061ed = function_818ac0c0b8f0b22(var_aaf0465944b061ed, var_8c817724af28fb4d);
    } else if (isdefined(einflictor.weapon_name) && isdefined(level.killstreakweaponmap[einflictor.weapon_name])) {
        var_aae9816cbf26fa0e = "_" + level.killstreakweaponmap[einflictor.weapon_name];
        var_aaf0465944b061ed = function_818ac0c0b8f0b22(var_aaf0465944b061ed, var_aae9816cbf26fa0e);
    } else if (eattacker namespace_a2f809133c566621::isjuggernaut()) {
        var_aaf0465944b061ed = function_818ac0c0b8f0b22(var_aaf0465944b061ed, "_juggernaut");
    } else if (namespace_e0ee43ef2dddadaa::iskillstreakweapon(sweapon)) {
        var_aae9816cbf26fa0e = "_" + level.killstreakweaponmap[sweapon.basename];
        var_aaf0465944b061ed = function_818ac0c0b8f0b22(var_aaf0465944b061ed, var_aae9816cbf26fa0e);
    } else if (is_equal(einflictor.weapon_name, "hellhound_molotov")) {
        var_aae9816cbf26fa0e = "_hellhound_flame";
        var_aaf0465944b061ed = function_818ac0c0b8f0b22(var_aaf0465944b061ed, var_aae9816cbf26fa0e);
    } else {
        binvehicle = 0;
        if (isdefined(einflictor.vehicletype)) {
            var_aaf0465944b061ed = function_818ac0c0b8f0b22(var_aaf0465944b061ed, "_vehicle");
        }
        if (smeansofdeath == "MOD_MELEE") {
            var_aaf0465944b061ed = function_818ac0c0b8f0b22(var_aaf0465944b061ed, "_melee");
        }
        if (isdefined(self.var_d37b75616f7c2ee) && istrue(self.var_d37b75616f7c2ee.var_14edc6d1db3695bc)) {
            var_aaf0465944b061ed = function_818ac0c0b8f0b22(var_aaf0465944b061ed, "_critical");
        }
    }
    if (isdefined(self.var_5ede61272f442abd)) {
        var_aaf0465944b061ed = self.var_5ede61272f442abd;
    }
    if (isdefined(smeansofdeath) && smeansofdeath == "MOD_EXECUTION" && self.unittype == "zombie") {
        var_aaf0465944b061ed = #"zombie_kia_executed";
    }
    eattacker thread function_97bd8649553541e9(var_aaf0465944b061ed, sweapon, self);
    if (isdefined(self.var_21a8839dd03e31cd)) {
        if (self.var_21a8839dd03e31cd.size > 0) {
            foreach (player in self.var_21a8839dd03e31cd) {
                if (eattacker == player) {
                    continue;
                }
                player thread function_97bd8649553541e9(var_76500cc4d834708d, sweapon);
            }
        }
    }
    eattacker function_b5679c2e3399669d(victim, smeansofdeath, sweapon);
}

// Namespace points/namespace_301533d2f1378cb9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf90
// Size: 0xea
function function_97bd8649553541e9(var_76500cc4d834708d, sweapon, var_c35ec803ca611c0a) {
    var_dfb32fa12d928f0b = 0;
    if (isdefined(var_c35ec803ca611c0a) && istrue(var_c35ec803ca611c0a.var_f405191d4605c15c)) {
        var_dfb32fa12d928f0b = 1;
    }
    if (ent_flag("powerup_insta_kill_active")) {
        var_dfb32fa12d928f0b = 1;
    }
    if (!isdefined(level.var_fe43fca6e0f2c11a)) {
        level.var_fe43fca6e0f2c11a = function_e4c99b0f178ffb98("ob_killing_score_event", 2, level.framedurationseconds);
    }
    var_fe5a1e73a59d3b04 = spawnstruct();
    function_f632348cbb773537(level.var_fe43fca6e0f2c11a, var_fe5a1e73a59d3b04);
    if (var_76500cc4d834708d == "zombie_kia_executed") {
        wait(1);
    }
    if (isdefined(self)) {
        if (var_dfb32fa12d928f0b) {
            val::set("zm_allow_give_super_point", "allow_give_super_point", 0);
        }
        namespace_301533d2f1378cb9::function_ddee59d6b1a2b9e(var_76500cc4d834708d, sweapon, 0, #"kill");
        val::function_c9d0b43701bdba00("zm_allow_give_super_point");
    }
}

// Namespace points/namespace_301533d2f1378cb9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1081
// Size: 0x5ee
function function_b5679c2e3399669d(victim, smeansofdeath, sweapon) {
    if (isdefined(self.var_b57b122cb903fddf) && self.var_b57b122cb903fddf != 0 && (self.var_b57b122cb903fddf + 1) % 30 == 0) {
        namespace_301533d2f1378cb9::function_ddee59d6b1a2b9e(#"hash_d22e697329f5f6d2");
    }
    if (!isdefined(self.var_2d9a19517f7a4632)) {
        return;
    }
    if (isdefined(self.var_2d9a19517f7a4632["MOD_MELEE"]) && self.var_2d9a19517f7a4632["MOD_MELEE"].var_b1be67b61f13e5c9 != 0) {
        if (self.var_2d9a19517f7a4632["MOD_MELEE"].var_b1be67b61f13e5c9 % 15 == 0) {
            namespace_301533d2f1378cb9::function_ddee59d6b1a2b9e(#"hash_934604e5ebee53a5");
        } else if (self.var_2d9a19517f7a4632["MOD_MELEE"].var_b1be67b61f13e5c9 % 10 == 0) {
            namespace_301533d2f1378cb9::function_ddee59d6b1a2b9e(#"hash_9345ffe5ebee4b26");
        } else if (self.var_2d9a19517f7a4632["MOD_MELEE"].var_b1be67b61f13e5c9 % 5 == 0) {
            namespace_301533d2f1378cb9::function_ddee59d6b1a2b9e(#"hash_d586c80f3dbf32a6");
        }
    }
    if (isdefined(self.var_2d9a19517f7a4632["primary"]) && self.var_2d9a19517f7a4632["primary"].var_b1be67b61f13e5c9 != 0) {
        if (self.var_2d9a19517f7a4632["primary"].var_b1be67b61f13e5c9 % 20 == 0) {
            namespace_301533d2f1378cb9::function_ddee59d6b1a2b9e(#"hash_68999452ce033b78");
        } else if (self.var_2d9a19517f7a4632["primary"].var_b1be67b61f13e5c9 % 15 == 0) {
            namespace_301533d2f1378cb9::function_ddee59d6b1a2b9e(#"hash_68a38952ce0b7d4c");
        } else if (self.var_2d9a19517f7a4632["primary"].var_b1be67b61f13e5c9 % 10 == 0) {
            namespace_301533d2f1378cb9::function_ddee59d6b1a2b9e(#"hash_68a38652ce0b7833");
        }
    }
    if (isdefined(self.var_2d9a19517f7a4632["vehicle_crush_or_kill"]) && self.var_2d9a19517f7a4632["vehicle_crush_or_kill"].var_b1be67b61f13e5c9 != 0) {
        if (self.var_2d9a19517f7a4632["vehicle_crush_or_kill"].var_b1be67b61f13e5c9 % 20 == 0) {
            namespace_301533d2f1378cb9::function_ddee59d6b1a2b9e(#"hash_2ff2bec46b4deb91");
        } else if (self.var_2d9a19517f7a4632["vehicle_crush_or_kill"].var_b1be67b61f13e5c9 % 15 == 0) {
            namespace_301533d2f1378cb9::function_ddee59d6b1a2b9e(#"hash_2ff641c46b510001");
        } else if (self.var_2d9a19517f7a4632["vehicle_crush_or_kill"].var_b1be67b61f13e5c9 % 10 == 0) {
            namespace_301533d2f1378cb9::function_ddee59d6b1a2b9e(#"hash_2ff644c46b51051a");
        }
    }
    if (isdefined(self.var_2d9a19517f7a4632["single_explosive_kill"]) && self.var_2d9a19517f7a4632["single_explosive_kill"].var_b1be67b61f13e5c9 != 0) {
        if (self.var_2d9a19517f7a4632["single_explosive_kill"].var_b1be67b61f13e5c9 % 20 == 0) {
            namespace_301533d2f1378cb9::function_ddee59d6b1a2b9e(#"hash_54f28fa9ddf9b769");
        } else if (self.var_2d9a19517f7a4632["single_explosive_kill"].var_b1be67b61f13e5c9 % 15 == 0) {
            namespace_301533d2f1378cb9::function_ddee59d6b1a2b9e(#"hash_54f592a9ddfbf259");
        } else if (self.var_2d9a19517f7a4632["single_explosive_kill"].var_b1be67b61f13e5c9 % 10 == 0) {
            namespace_301533d2f1378cb9::function_ddee59d6b1a2b9e(#"hash_54f595a9ddfbf772");
        }
    }
    if (isdefined(self.var_2d9a19517f7a4632["killstreak_kill"]) && self.var_2d9a19517f7a4632["killstreak_kill"].var_b1be67b61f13e5c9 != 0) {
        if (self.var_2d9a19517f7a4632["killstreak_kill"].var_b1be67b61f13e5c9 % 20 == 0) {
            namespace_301533d2f1378cb9::function_ddee59d6b1a2b9e(#"hash_6ded9a614605c2b0");
        } else if (self.var_2d9a19517f7a4632["killstreak_kill"].var_b1be67b61f13e5c9 % 15 == 0) {
            namespace_301533d2f1378cb9::function_ddee59d6b1a2b9e(#"hash_6df7af61460e3ae4");
        } else if (self.var_2d9a19517f7a4632["killstreak_kill"].var_b1be67b61f13e5c9 % 10 == 0) {
            namespace_301533d2f1378cb9::function_ddee59d6b1a2b9e(#"hash_6df7ac61460e35cb");
        }
    }
    if (isdefined(self.var_2d9a19517f7a4632["elemental_kill_fire"]) && self.var_2d9a19517f7a4632["elemental_kill_fire"].var_b1be67b61f13e5c9 != 0) {
        if (self.var_2d9a19517f7a4632["elemental_kill_fire"].var_b1be67b61f13e5c9 % 10 == 0) {
            namespace_301533d2f1378cb9::function_ddee59d6b1a2b9e(#"hash_1d16a90346898202");
        }
    }
    if (isdefined(self.var_2d9a19517f7a4632["elemental_kill_cold"]) && self.var_2d9a19517f7a4632["elemental_kill_cold"].var_b1be67b61f13e5c9 != 0) {
        if (self.var_2d9a19517f7a4632["elemental_kill_cold"].var_b1be67b61f13e5c9 % 10 == 0) {
            namespace_301533d2f1378cb9::function_ddee59d6b1a2b9e(#"hash_a12b45eb4f1d0138");
        }
    }
    if (isdefined(self.var_2d9a19517f7a4632["elemental_kill_electrical"]) && self.var_2d9a19517f7a4632["elemental_kill_electrical"].var_b1be67b61f13e5c9 != 0) {
        if (self.var_2d9a19517f7a4632["elemental_kill_electrical"].var_b1be67b61f13e5c9 % 10 == 0) {
            namespace_301533d2f1378cb9::function_ddee59d6b1a2b9e(#"hash_deefad4fef3853c");
        }
    }
    if (isdefined(self.var_2d9a19517f7a4632["elemental_kill_toxic"]) && self.var_2d9a19517f7a4632["elemental_kill_toxic"].var_b1be67b61f13e5c9 != 0) {
        if (self.var_2d9a19517f7a4632["elemental_kill_toxic"].var_b1be67b61f13e5c9 % 10 == 0) {
            namespace_301533d2f1378cb9::function_ddee59d6b1a2b9e(#"hash_2d04f4b7c3b707");
        }
    }
}

// Namespace points/namespace_301533d2f1378cb9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1676
// Size: 0x43
function function_ccac14f2510dd65a(var_d27680ff86693f5c) {
    if (isplayer(self) && isdefined(var_d27680ff86693f5c.scoreevent)) {
        scoreevent = var_d27680ff86693f5c.scoreevent;
        namespace_301533d2f1378cb9::function_ddee59d6b1a2b9e(scoreevent);
    }
}

// Namespace points/namespace_301533d2f1378cb9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16c0
// Size: 0x1bc
function function_591305dc9c07499b(objweapon, eattacker, smeansofdeath) {
    element = "none";
    var_225a577cbeda65c2 = objweapon.var_9d7facbe889e667c;
    var_4c1dfbfd3368cae6 = level.sharedfuncs["zombie"]["has_ammo_mod"];
    if (isplayer(eattacker) && istrue(level.var_bfa98c9dd6edb929) && isdefined(var_4c1dfbfd3368cae6) && eattacker [[ var_4c1dfbfd3368cae6 ]](objweapon)) {
        var_87acb5f0ae5e6d72 = level.sharedfuncs["zombie"]["get_ammo_mod_name"];
        if (isdefined(var_87acb5f0ae5e6d72)) {
            var_2632b2da60d34841 = eattacker [[ var_87acb5f0ae5e6d72 ]](objweapon);
            if (isdefined(level.var_1b3072262db80fc1[var_2632b2da60d34841].element)) {
                element = level.var_1b3072262db80fc1[var_2632b2da60d34841].element;
            }
        }
    } else {
        var_85240ff9a325f4d = undefined;
        if (isdefined(level.var_96c4059aa2eabfb8)) {
            var_85240ff9a325f4d = level.var_96c4059aa2eabfb8[var_225a577cbeda65c2];
        }
        if (isdefined(var_85240ff9a325f4d) && isdefined(var_85240ff9a325f4d.var_6792fe92d7b33272)) {
            element = var_85240ff9a325f4d.var_6792fe92d7b33272;
        }
    }
    if (isdefined(smeansofdeath)) {
        if (smeansofdeath == "MOD_FIRE" || smeansofdeath == "MOD_ELEMENTAL_FIRE") {
            element = "fire";
        }
        if (smeansofdeath == "MOD_ELEMENTAL_ELEC") {
            element = "electrical";
        }
        if (smeansofdeath == "MOD_ELEMENTAL_COLD") {
            element = "cold";
        }
        if (smeansofdeath == "MOD_ELEMENTAL_TOXIC") {
            element = "toxic";
        }
        if (smeansofdeath == "MOD_ELEMENTAL_DARK") {
            element = "dark";
        }
        if (smeansofdeath == "MOD_ELEMENTAL_LIGHT") {
            element = "light";
        }
    }
    return element;
}

// Namespace points/namespace_301533d2f1378cb9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1884
// Size: 0x7df
function function_269657aa69da2b38(var_d27680ff86693f5c) {
    var_8a9445752cf5f1c9 = self.var_941802a0997e0c42;
    if (isdefined(var_d27680ff86693f5c.eattacker)) {
        goto LOC_0000008e;
    }
    var_d8d142881fb224 = undefined;
    var_691b16f55274b1c5 = self.var_691b16f55274b1c5;
    if (!isdefined(level.ob_ai_killed_points_throttle)) {
        level.ob_ai_killed_points_throttle = function_e4c99b0f178ffb98("ob_ai_killed_points_throttle", 1, level.framedurationseconds);
    }
    var_c11d6c177d7ab5a2 = spawnstruct();
    function_f632348cbb773537(level.ob_ai_killed_points_throttle, var_c11d6c177d7ab5a2);
    if (isplayer(var_d8d142881fb224)) {
        var_d8d142881fb224 namespace_301533d2f1378cb9::function_ddee59d6b1a2b9e(#"hash_f3f5a252c3efe701", undefined, 0, #"kill");
    }
    if (isplayer(var_8a9445752cf5f1c9)) {
        var_8a9445752cf5f1c9 namespace_301533d2f1378cb9::function_ddee59d6b1a2b9e(#"hash_f3f5a252c3efe701", undefined, 0, #"kill");
    }
    if (isplayer(var_d27680ff86693f5c.eattacker)) {
        if (!isdefined(var_d27680ff86693f5c.eattacker.var_2d9a19517f7a4632)) {
            goto LOC_00000172;
        }
        var_d27680ff86693f5c.eattacker.var_2d9a19517f7a4632 = var_d27680ff86693f5c.eattacker.var_2d9a19517f7a4632;
        if (isdefined(var_d27680ff86693f5c.smeansofdeath)) {
            var_d27680ff86693f5c.eattacker function_54de0dcded063f2d(var_d27680ff86693f5c.smeansofdeath);
        }
        var_38a9d32b5a5ad939 = function_9da9c82aa52d0513(var_d27680ff86693f5c);
        var_ed466cf2ffea8d4 = function_135f1d917020589a(var_d27680ff86693f5c.sweapon);
        if (isdefined(var_d27680ff86693f5c.sweapon) && var_d27680ff86693f5c.sweapon.classname != "turret" && is_equal(var_d27680ff86693f5c.sweapon.inventorytype, "primary") && isdefined(var_d27680ff86693f5c.smeansofdeath) && var_d27680ff86693f5c.smeansofdeath != "MOD_MELEE" && !var_38a9d32b5a5ad939) {
            var_d27680ff86693f5c.eattacker function_54de0dcded063f2d("primary");
        }
        if (isdefined(var_d27680ff86693f5c.smeansofdeath) && !var_ed466cf2ffea8d4 && !var_38a9d32b5a5ad939 && var_d27680ff86693f5c.smeansofdeath == "MOD_EXPLOSIVE" || var_d27680ff86693f5c.smeansofdeath == "MOD_PROJECTILE" || var_d27680ff86693f5c.smeansofdeath == "MOD_PROJECTILE_SPLASH" || var_d27680ff86693f5c.smeansofdeath == "MOD_GRENADE_SPLASH") {
            var_d27680ff86693f5c.eattacker function_54de0dcded063f2d("single_explosive_kill", var_d27680ff86693f5c.sweapon);
        }
        if (isdefined(var_d27680ff86693f5c.eattacker.vehicle) && is_equal(var_d27680ff86693f5c.eattacker.currentweapon.classname, "turret")) {
            var_d27680ff86693f5c.eattacker function_54de0dcded063f2d("vehicle_crush_or_kill");
        }
        if (var_d27680ff86693f5c.eattacker namespace_a2f809133c566621::isjuggernaut() || var_ed466cf2ffea8d4) {
            var_d27680ff86693f5c.eattacker function_54de0dcded063f2d("killstreak_kill");
        }
        var_d27680ff86693f5c.eattacker.var_b57b122cb903fddf = isdefined(var_d27680ff86693f5c.eattacker.var_b57b122cb903fddf) ? 0 : var_d27680ff86693f5c.eattacker.var_b57b122cb903fddf;
        var_d27680ff86693f5c.eattacker.var_b57b122cb903fddf++;
    }
    if (isdefined(var_d27680ff86693f5c.eattacker) && isplayer(var_d27680ff86693f5c.eattacker.owner)) {
        if (!isdefined(var_d27680ff86693f5c.eattacker.owner.var_2d9a19517f7a4632)) {
            goto LOC_00000452;
        }
        var_d27680ff86693f5c.eattacker.owner.var_2d9a19517f7a4632 = var_d27680ff86693f5c.eattacker.owner.var_2d9a19517f7a4632;
        if (isdefined(var_d27680ff86693f5c.eattacker.streakname) && var_d27680ff86693f5c.eattacker.streakname == "sentry_turret") {
            var_d27680ff86693f5c.eattacker.owner function_54de0dcded063f2d("killstreak_kill");
        }
        if (is_equal(var_d27680ff86693f5c.eattacker.classname, "script_vehicle")) {
            var_d27680ff86693f5c.eattacker.owner function_54de0dcded063f2d("vehicle_crush_or_kill");
        }
    }
    if (isdefined(var_d27680ff86693f5c.sweapon) && isdefined(var_d27680ff86693f5c.smeansofdeath) && isplayer(var_d27680ff86693f5c.eattacker)) {
        var_2bd7283211fa61e7 = function_591305dc9c07499b(var_d27680ff86693f5c.sweapon, var_d27680ff86693f5c.eattacker, var_d27680ff86693f5c.smeansofdeath);
        var_4106d2021e226fcd = "none";
        if (var_2bd7283211fa61e7 == "fire" || var_d27680ff86693f5c.smeansofdeath == "MOD_ELEMENTAL_FIRE") {
            if (!isdefined(var_d27680ff86693f5c.einflictor) || !is_equal(var_d27680ff86693f5c.einflictor.weapon_name, "hellhound_molotov")) {
                var_d27680ff86693f5c.eattacker function_54de0dcded063f2d("elemental_kill_fire");
                var_4106d2021e226fcd = #"hash_f09b4f756df11aa4";
            }
        } else if (var_2bd7283211fa61e7 == "cold" || var_d27680ff86693f5c.smeansofdeath == "MOD_ELEMENTAL_COLD") {
            var_d27680ff86693f5c.eattacker function_54de0dcded063f2d("elemental_kill_cold");
            var_4106d2021e226fcd = #"hash_a62035653525d27e";
        } else if (var_2bd7283211fa61e7 == "electrical" || var_d27680ff86693f5c.smeansofdeath == "MOD_ELEMENTAL_ELEC") {
            var_d27680ff86693f5c.eattacker function_54de0dcded063f2d("elemental_kill_electrical");
            var_4106d2021e226fcd = #"hash_f48e7e053c787be5";
        } else if (var_2bd7283211fa61e7 == "toxic" || var_d27680ff86693f5c.smeansofdeath == "MOD_ELEMENTAL_TOXIC") {
            var_d27680ff86693f5c.eattacker function_54de0dcded063f2d("elemental_kill_toxic");
            var_4106d2021e226fcd = #"hash_e1c37b28b02f43bf";
        }
        if (isdefined(var_691b16f55274b1c5) && isarray(var_691b16f55274b1c5) && istrue(var_691b16f55274b1c5[var_2bd7283211fa61e7]) && var_4106d2021e226fcd != "none") {
            var_d27680ff86693f5c.eattacker namespace_301533d2f1378cb9::function_ddee59d6b1a2b9e(var_4106d2021e226fcd, undefined, 0, #"kill");
        }
    }
    if (isplayer(var_d27680ff86693f5c.eattacker) && isdefined(var_d27680ff86693f5c.einflictor) && is_equal(var_d27680ff86693f5c.einflictor.weapon_name, "hellhound_molotov")) {
        einflictor = var_d27680ff86693f5c.einflictor;
        if (isdefined(einflictor.var_6f3cee3c008da525)) {
            einflictor [[ einflictor.var_6f3cee3c008da525 ]]();
        }
    }
    if (isdefined(var_d27680ff86693f5c.eattacker) && istrue(var_d27680ff86693f5c.eattacker.var_873d30685528d962)) {
        if (isplayer(var_d27680ff86693f5c.eattacker.var_66c1831357048c02)) {
            var_d27680ff86693f5c.eattacker.var_66c1831357048c02 namespace_301533d2f1378cb9::function_ddee59d6b1a2b9e(#"hash_9c375574d4a407ec", undefined, 0, #"kill");
        }
    }
}

// Namespace points/namespace_301533d2f1378cb9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x206a
// Size: 0x67
function function_de67925b7692fe3d(var_444cec370990f32) {
    self notify(var_444cec370990f32 + "recent_zombie_rapid_kill");
    self endon(var_444cec370990f32 + "recent_zombie_rapid_kill");
    level endon("game_ended");
    wait(2);
    if (isplayer(self) && isdefined(self.var_2d9a19517f7a4632) && isdefined(self.var_2d9a19517f7a4632[var_444cec370990f32])) {
        self.var_2d9a19517f7a4632[var_444cec370990f32].var_b1be67b61f13e5c9 = 0;
    }
}

// Namespace points/namespace_301533d2f1378cb9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20d8
// Size: 0xf1
function function_54de0dcded063f2d(var_444cec370990f32, sweapon) {
    self.var_2d9a19517f7a4632[var_444cec370990f32] = function_53c4c53197386572(self.var_2d9a19517f7a4632[var_444cec370990f32], spawnstruct());
    self.var_2d9a19517f7a4632[var_444cec370990f32].var_b1be67b61f13e5c9 = function_53c4c53197386572(self.var_2d9a19517f7a4632[var_444cec370990f32].var_b1be67b61f13e5c9, 0);
    if (isdefined(sweapon)) {
        if (!isdefined(self.var_2d9a19517f7a4632[var_444cec370990f32].weapon)) {
            self.var_2d9a19517f7a4632[var_444cec370990f32].weapon = sweapon;
        } else if (self.var_2d9a19517f7a4632[var_444cec370990f32].weapon != sweapon) {
            self.var_2d9a19517f7a4632[var_444cec370990f32].var_b1be67b61f13e5c9 = 0;
            return;
        }
    }
    self.var_2d9a19517f7a4632[var_444cec370990f32].var_b1be67b61f13e5c9++;
    thread function_de67925b7692fe3d(var_444cec370990f32);
}

// Namespace points/namespace_301533d2f1378cb9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21d0
// Size: 0x69
function function_135f1d917020589a(sweapon) {
    return isdefined(sweapon) && isdefined(sweapon.basename) && issubstr(sweapon.basename, "cluster_spike") || issubstr(sweapon.basename, "toma_proj") || issubstr(sweapon.basename, "artillery_mp");
}

// Namespace points/namespace_301533d2f1378cb9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2241
// Size: 0xe5
function function_9da9c82aa52d0513(var_d27680ff86693f5c) {
    var_e012ae5b74d203e4 = [0:%"hash_41abaa40d2817d6c", 1:%"hash_2c13a4eea7325f3b", 2:%"frost_blast"];
    if (isdefined(var_d27680ff86693f5c.sweapon)) {
        foreach (field_upgrade in var_e012ae5b74d203e4) {
            if (isdefined(level.var_96c4059aa2eabfb8[field_upgrade]) && isdefined(level.var_96c4059aa2eabfb8[field_upgrade].weaponobj) && level.var_96c4059aa2eabfb8[field_upgrade].weaponobj == var_d27680ff86693f5c.sweapon) {
                return 1;
            }
        }
    }
    return 0;
}

