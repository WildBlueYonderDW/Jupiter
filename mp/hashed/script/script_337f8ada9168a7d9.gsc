#using scripts\common\devgui.gsc;
#using script_247745a526421ba7;
#using scripts\engine\utility.gsc;
#using script_7ab5b649fa408138;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\gametypes\br_analytics.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_64acb6ce534155b7;
#using scripts\mp\utility\script.gsc;
#using script_5bab271917698dc4;

#namespace reinforcement_flare;

// Namespace reinforcement_flare / namespace_1ce5d6a34233a4f
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x2d6
// Size: 0xb
function autoexec main() {
    level thread function_566f849e77540164();
}

// Namespace reinforcement_flare / namespace_1ce5d6a34233a4f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e9
// Size: 0x18
function function_566f849e77540164() {
    level endon("game_ended");
    level waittill("init_supers");
    init();
}

// Namespace reinforcement_flare / namespace_1ce5d6a34233a4f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x309
// Size: 0x162
function init() {
    scripts\mp\supers::function_53110a12409d01da("super_reinforcement_flare", undefined, &function_90c4a88974378104, &function_abefbdbd41128e07, undefined, undefined, &function_454bc6bf585af432);
    scripts\engine\utility::registersharedfunc("reinforcement_flare", "grenadeUsed", &function_304d5fa1128c5a76);
    level.var_eed57e4583118823 = spawnstruct();
    level.var_eed57e4583118823.type = getdvarint(@"hash_fe6d7336b7f92218", 3);
    level.var_eed57e4583118823.delay = getdvarint(@"hash_9791c5e947b42f3f", 1);
    level.var_eed57e4583118823.var_52c848ed985b69bf = getdvarint(@"hash_b6d7a4020f569c04", 5000);
    level.var_eed57e4583118823.var_14c8c6253fa5e1ee = getdvarint(@"hash_578ea151ae11d179", 1);
    level.var_eed57e4583118823.var_a1d415ab15d07845 = getdvarint(@"hash_3c8c43e7f91baee4", 1);
    level.var_eed57e4583118823.var_60a077e73164fa34 = getdvarint(@"hash_58392bda66da5795", 1);
    level.var_eed57e4583118823.var_d7397c466ee881e3 = 0;
    level.var_eed57e4583118823.superid = scripts\mp\supers::getsuperid("super_reinforcement_flare");
    init_anim();
    function_30afc24cc88c8d3();
}

// Namespace reinforcement_flare / namespace_1ce5d6a34233a4f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x473
// Size: 0x59
function init_anim() {
    notes = getnotetracktimes(script_model%misc_vm_flare_gun_fire, "reinforcement_flare_fired");
    total = getanimlength(script_model%misc_vm_flare_gun_fire);
    if (notes.size > 0) {
        level.var_eed57e4583118823.var_d7397c466ee881e3 = total * notes[0];
    }
}

// Namespace reinforcement_flare / namespace_1ce5d6a34233a4f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d4
// Size: 0x4d
function function_30afc24cc88c8d3() {
    /#
        function_6e7290c8ee4f558b("<dev string:x1c>");
        function_a2fe753948998c89("<dev string:x36>", "<dev string:x4d>");
        function_fe953f000498048f();
        function_6e7290c8ee4f558b("<dev string:x85>");
        function_a2fe753948998c89("<dev string:x36>", "<dev string:xa0>");
        function_fe953f000498048f();
    #/
}

// Namespace reinforcement_flare / namespace_1ce5d6a34233a4f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x529
// Size: 0xb
function function_454bc6bf585af432() {
    function_a69a3c97f0e5fb45(1);
}

// Namespace reinforcement_flare / namespace_1ce5d6a34233a4f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x53c
// Size: 0xa
function function_90c4a88974378104() {
    function_a69a3c97f0e5fb45(0);
}

// Namespace reinforcement_flare / namespace_1ce5d6a34233a4f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x54e
// Size: 0x51
function function_a69a3c97f0e5fb45(on) {
    if (!level.var_eed57e4583118823.var_60a077e73164fa34) {
        return;
    }
    superid = on ? level.var_eed57e4583118823.superid : 0;
    scripts\mp\supers::function_7203e7aa96ff0ba9(superid);
}

// Namespace reinforcement_flare / namespace_1ce5d6a34233a4f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5a7
// Size: 0xb5
function function_abefbdbd41128e07() {
    /#
        if (getdvarint(@"hash_138efa1711913cad", 0)) {
            thread function_917bdaef968dc5b4();
            wait level.var_eed57e4583118823.var_d7397c466ee881e3;
            thread function_81973eac6cda5de8();
            wait level.var_eed57e4583118823.delay;
            thread scripts\mp\hud_message::showsplash("<dev string:xe5>");
            scripts\mp\utility\points::doScoreEvent(#"hash_6ce458a0c07fd247");
            return false;
        }
    #/
    var_afe6989e38932fd3 = function_59dd9b163e569a63();
    if (!function_be3f53a872e6984(var_afe6989e38932fd3, 1)) {
        return false;
    }
    self.super.isactive = 1;
    self disableoffhandspecialweapons();
    thread function_1d40065a3c6120da();
    return true;
}

// Namespace reinforcement_flare / namespace_1ce5d6a34233a4f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x665
// Size: 0xd5
function function_1d40065a3c6120da() {
    thread function_917bdaef968dc5b4();
    wait level.var_eed57e4583118823.var_d7397c466ee881e3;
    self enableoffhandspecialweapons();
    var_afe6989e38932fd3 = function_59dd9b163e569a63();
    if (!function_be3f53a872e6984(var_afe6989e38932fd3, istrue(level.var_eed57e4583118823.var_a1d415ab15d07845))) {
        scripts\mp\supers::refundsuper();
        return 0;
    }
    function_a69a3c97f0e5fb45(0);
    thread function_81973eac6cda5de8();
    function_bd86834dafc95671(var_afe6989e38932fd3);
    wait level.var_eed57e4583118823.delay;
    thread scripts\mp\hud_message::showsplash("br_squadmate_revived");
    scripts\mp\utility\points::doScoreEvent(#"hash_6ce458a0c07fd247");
    scripts\mp\gametypes\br_analytics::function_885c6daf0ece2cf6(1, 0);
    scripts\cp_mp\challenges::function_d997435895422ecc("super_reinforcement_flare", ae_utility::function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
}

// Namespace reinforcement_flare / namespace_1ce5d6a34233a4f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x742
// Size: 0x6a
function function_be3f53a872e6984(var_afe6989e38932fd3, var_1604d9f4d5cc32d7) {
    if (!scripts\mp\utility\player::function_ad443bbcdcf37b85(self)) {
        return 0;
    }
    if (istrue(var_1604d9f4d5cc32d7)) {
        if (self isswimunderwater()) {
            return function_22f07d1048d1a37("reinforcement_flare_underwater", 1);
        }
        if (function_7511c0cbd6c3f1cf()) {
            return function_22f07d1048d1a37("reinforcement_flare_not_enough_space", 2);
        }
    }
    if (var_afe6989e38932fd3.size < 1) {
        return function_22f07d1048d1a37("reinforcement_flare_nobody_to_respawn", 3);
    }
    return 1;
}

// Namespace reinforcement_flare / namespace_1ce5d6a34233a4f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7b5
// Size: 0x20
function function_917bdaef968dc5b4() {
    weapon = makeweapon("reinforcement_flare_mp_br");
    scripts\cp_mp\utility\weapon_utility::giveandfireoffhandreliable(weapon);
}

// Namespace reinforcement_flare / namespace_1ce5d6a34233a4f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7dd
// Size: 0xb4
function function_7511c0cbd6c3f1cf() {
    startpos = self getorigin();
    endpos = startpos + (0, 0, level.var_eed57e4583118823.var_52c848ed985b69bf);
    var_5ed27d399605829 = scripts\engine\trace::create_contents(0, 0, 1, 1, 0, 1, 1, 1, 0, 1, 0);
    var_1ac16b7e89c07b85 = scripts\engine\trace::ray_trace_passed(startpos, endpos, self, var_5ed27d399605829);
    /#
        if (getdvarint(@"hash_b57b0de95df4c797", 0)) {
            line(startpos, endpos, ter_op(var_1ac16b7e89c07b85, (0, 1, 0), (1, 0, 0)), 1, 0, 1800);
        }
    #/
    return !var_1ac16b7e89c07b85;
}

// Namespace reinforcement_flare / namespace_1ce5d6a34233a4f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x89a
// Size: 0x34
function function_22f07d1048d1a37(hint, reason) {
    self playlocalsound("br_pickup_deny");
    setlowermessageomnvar(hint, undefined, 5);
    scripts\mp\gametypes\br_analytics::function_885c6daf0ece2cf6(0, reason);
    return false;
}

// Namespace reinforcement_flare / namespace_1ce5d6a34233a4f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8d7
// Size: 0x90
function function_59dd9b163e569a63() {
    list = [];
    squad = getteamdata(self.team, "players");
    foreach (squadmate in squad) {
        if (!isdefined(squadmate) || squadmate == self) {
            continue;
        }
        if (squadmate function_a36dfafc12f9a469()) {
            list[list.size] = squadmate;
        }
    }
    return list;
}

// Namespace reinforcement_flare / namespace_1ce5d6a34233a4f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x970
// Size: 0x12
function function_a36dfafc12f9a469() {
    return scripts\mp\gametypes\br_public::iseligibleforteamrevive() || scripts\mp\gametypes\br_public::function_8f0e6614368f64c2();
}

// Namespace reinforcement_flare / namespace_1ce5d6a34233a4f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x98b
// Size: 0x7c
function function_81973eac6cda5de8() {
    location = self.origin;
    if (self tagexists("tag_weapon_right")) {
        location = self gettagorigin("tag_weapon_right");
    }
    flareoverride = getdvar(@"hash_58d8dfa7b8338078", "");
    if (flareoverride != "") {
        level namespace_1eb3c4e0e28fac71::utilflare_shootflare(location, flareoverride);
    } else {
        level namespace_1eb3c4e0e28fac71::utilflare_shootflare(location, "reinforcement_flare");
    }
    thread function_e02eb68b52ee2576();
}

// Namespace reinforcement_flare / namespace_1ce5d6a34233a4f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa0f
// Size: 0x4e
function function_e02eb68b52ee2576() {
    player = self;
    player endon("death_or_disconnect");
    player setscriptablepartstate("ReinforcementFlare", "on", 0);
    wait level.var_eed57e4583118823.var_14c8c6253fa5e1ee;
    player setscriptablepartstate("ReinforcementFlare", "off", 0);
}

// Namespace reinforcement_flare / namespace_1ce5d6a34233a4f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa65
// Size: 0x17d
function function_bd86834dafc95671(var_afe6989e38932fd3) {
    switch (level.var_eed57e4583118823.type) {
    case 3:
        var_afe6989e38932fd3 = array_randomize_objects(var_afe6989e38932fd3);
        break;
    case 2:
        var_afe6989e38932fd3 = scripts\mp\utility\script::quicksort(var_afe6989e38932fd3, &function_ae1f6e9c36dbaf8d);
        break;
    case 4:
        var_afe6989e38932fd3 = scripts\mp\utility\script::quicksort(var_afe6989e38932fd3, &function_6061807fd4bf9173);
        break;
    default:
        break;
    }
    if (level.var_eed57e4583118823.type == 1) {
        foreach (squadmate in var_afe6989e38932fd3) {
            namespace_8bfdb6eb5a3df67a::br_kioskrevive(squadmate, self, 0, undefined, undefined, undefined, undefined, "reinforcement_flare");
        }
        return;
    }
    var_a4a43a5fca0097ef = var_afe6989e38932fd3[0];
    if (istrue(var_a4a43a5fca0097ef.var_632bad3edb4e449e)) {
        foreach (squadmate in var_afe6989e38932fd3) {
            if (!istrue(squadmate.var_632bad3edb4e449e)) {
                var_a4a43a5fca0097ef = squadmate;
                break;
            }
        }
    }
    namespace_8bfdb6eb5a3df67a::br_kioskrevive(var_a4a43a5fca0097ef, self, 0, undefined, undefined, undefined, undefined, "reinforcement_flare");
}

// Namespace reinforcement_flare / namespace_1ce5d6a34233a4f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xbea
// Size: 0x52
function function_ae1f6e9c36dbaf8d(player1, player2) {
    var_22e05fceeb58392a = default_to(player1.var_14110ad8d5069e7, -1);
    var_7ba3baf60b4a6d7 = default_to(player2.var_14110ad8d5069e7, -1);
    return var_22e05fceeb58392a <= var_7ba3baf60b4a6d7;
}

// Namespace reinforcement_flare / namespace_1ce5d6a34233a4f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc45
// Size: 0x50
function function_6061807fd4bf9173(player1, player2) {
    var_c86a63410b3461a6 = default_to(player1.plundercount, 0);
    var_55551d86b36ece5f = default_to(player2.plundercount, 0);
    return var_c86a63410b3461a6 >= var_55551d86b36ece5f;
}

// Namespace reinforcement_flare / namespace_1ce5d6a34233a4f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc9e
// Size: 0x17
function function_304d5fa1128c5a76(grenade) {
    if (isdefined(grenade)) {
        grenade delete();
    }
}

