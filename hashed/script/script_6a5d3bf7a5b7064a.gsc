// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_372301af73968cb;
#using script_7c40fa80892a721;
#using script_4b87f2871b6b025c;
#using scripts\cp_mp\utility\shellshock_utility.gsc;

#namespace namespace_646e434ccdd09379;

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x46d
// Size: 0x39
function init() {
    if (!isdefined(level.var_562530bdb8e83b66)) {
        level.var_562530bdb8e83b66 = 0.55;
    }
    if (!isdefined(level.var_fdd1af3c4c6cbe86)) {
        level.var_fdd1af3c4c6cbe86 = 0.7;
    }
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ad
// Size: 0x12e
function function_9bc46d4b8891a740() {
    if (!isplayer(self) || isbot(self)) {
        return;
    }
    if (!isdefined(self.damage)) {
        self.damage = spawnstruct();
    } else if (isdefined(self.damage.var_7076478738f62d10)) {
        foreach (overlay in self.damage.var_7076478738f62d10) {
            if (isdefined(overlay)) {
                overlay destroy();
            }
        }
    }
    self.damage.var_7076478738f62d10 = [];
    self.damage.var_f4687931bd3b8634 = [];
    self.damage.altdirectionalbloodoverlay = 0;
    self.damage.lastdiretionalbloodtime = -99999;
    initdeathsdooroverlaypulse();
    function_12bd9b0199862940();
    thread function_fba4aaaecf8e34ac();
    thread function_c0124edee3a13496();
    thread function_54117659a8e5c5b4();
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e2
// Size: 0x25c
function initdeathsdooroverlaypulse() {
    if (!isdefined(level.var_21e8a7768c0260f2) || !isdefined(level.var_21e8a7768c0260f2.var_1ad4a3f795bf0321)) {
        return;
    }
    self.damage.deathsdooroverlaypulse = newclienthudelem(self);
    self.damage.deathsdooroverlaypulse.sort = 9;
    self.damage.deathsdooroverlaypulse.x = 0;
    self.damage.deathsdooroverlaypulse.y = 0;
    self.damage.deathsdooroverlaypulse.alignx = "left";
    self.damage.deathsdooroverlaypulse.aligny = "top";
    self.damage.deathsdooroverlaypulse.foreground = 0;
    self.damage.deathsdooroverlaypulse.lowresbackground = 1;
    self.damage.deathsdooroverlaypulse.horzalign = "fullscreen";
    self.damage.deathsdooroverlaypulse.vertalign = "fullscreen";
    self.damage.deathsdooroverlaypulse.alpha = 0;
    self.damage.deathsdooroverlaypulse.enablehudlighting = 0;
    self.damage.deathsdooroverlaypulse.var_79a4133f925e83f8 = 1;
    self.damage.deathsdooroverlaypulse setshader(level.var_21e8a7768c0260f2.var_1ad4a3f795bf0321, 640, 480);
    self.damage.deathsdooroverlaypulse.var_eeda4296ae80e949 = 0;
    self.damage.var_7076478738f62d10 = array_add(self.damage.var_7076478738f62d10, self.damage.deathsdooroverlaypulse);
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x845
// Size: 0x23d
function function_12bd9b0199862940() {
    if (!isdefined(level.var_21e8a7768c0260f2) || !isdefined(level.var_21e8a7768c0260f2.var_e44fdf0e370e159a)) {
        return;
    }
    self.damage.var_5d28af440fb50e5a = newclienthudelem(self);
    self.damage.var_5d28af440fb50e5a.sort = 10;
    self.damage.var_5d28af440fb50e5a.x = 0;
    self.damage.var_5d28af440fb50e5a.y = 0;
    self.damage.var_5d28af440fb50e5a.alignx = "left";
    self.damage.var_5d28af440fb50e5a.aligny = "top";
    self.damage.var_5d28af440fb50e5a.foreground = 0;
    self.damage.var_5d28af440fb50e5a.lowresbackground = 1;
    self.damage.var_5d28af440fb50e5a.horzalign = "fullscreen";
    self.damage.var_5d28af440fb50e5a.vertalign = "fullscreen";
    self.damage.var_5d28af440fb50e5a.alpha = 0;
    self.damage.var_5d28af440fb50e5a.enablehudlighting = 0;
    self.damage.var_5d28af440fb50e5a.var_79a4133f925e83f8 = 1;
    self.damage.var_5d28af440fb50e5a setshader(level.var_21e8a7768c0260f2.var_e44fdf0e370e159a, 640, 480);
    self.damage.var_f4687931bd3b8634 = array_add(self.damage.var_7076478738f62d10, self.damage.var_5d28af440fb50e5a);
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa89
// Size: 0x83
function function_fba4aaaecf8e34ac() {
    var_993e5cf734fbd0fc = self.damage.var_7076478738f62d10;
    waittill_any_2("death_or_disconnect", "ending_cinematic");
    foreach (overlay in var_993e5cf734fbd0fc) {
        if (isdefined(overlay)) {
            overlay destroy();
        }
    }
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb13
// Size: 0x8d
function function_c0124edee3a13496() {
    var_993e5cf734fbd0fc = self.damage.var_f4687931bd3b8634;
    waittill_any_4("disconnect", "death_delay_finished", "spawned", "ending_cinematic");
    foreach (overlay in var_993e5cf734fbd0fc) {
        if (isdefined(overlay)) {
            overlay destroy();
        }
    }
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba7
// Size: 0x26
function function_3d879029586de3(var_e7b8e2a5586f580c) {
    if (getdvarint(@"hash_4d7862eaa83b3b27")) {
        return (var_e7b8e2a5586f580c * 0.6);
    }
    return var_e7b8e2a5586f580c;
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd5
// Size: 0xf4
function onenterdeathsdoor(smeansofdeath) {
    if (istrue(self.deathsdoor)) {
        return;
    }
    self.deathsdoor = 1;
    self.painbreathloopsplayed = 0;
    self.var_632fcfdf269b9dc8 = gettime();
    self notify("startHeartbeatPulse");
    if (!istrue(self.deathsdoorsfx) && !istrue(self.var_a9982aba7477cc90)) {
        self.deathsdoorsfx = 1;
        self stoplocalsound("deaths_door_out");
        self playlocalsound("deaths_door_in");
        function_501be800abf11f33(0.2, 1);
        self enableplayerbreathsystem(0);
        self setentitysoundcontext("deaths_door", "active", 0.1);
        thread playerbreathingpainsound();
        if (isplayer(self) && !isbot(self)) {
            function_9030f56a68f604dc();
            function_c2e66bc8cbf81b2d();
        }
    }
    if (level.healthregendisabled) {
        self painvisionon();
    }
    self notify("deaths_door_enter");
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd0
// Size: 0xef
function playerbreathingpainsound(healthcap) {
    self endon("death_or_disconnect");
    self endon("deaths_door_exit");
    self endon("healed");
    self endon("joined_spectators");
    self endon("last_stand_revived");
    level endon("game_ended");
    self.painbreathloopsplayed = function_53c4c53197386572(self.painbreathloopsplayed, 0);
    wait(0.5);
    while (1) {
        if (isusingremote()) {
            waitframe();
            continue;
        }
        if (!val::get("health_regen") || level.healthregendisabled || level.var_be39d6b46044f344 < 40) {
            self.painbreathloopsplayed++;
            if (self.painbreathloopsplayed > ter_op(istrue(self.hasdonepainbreathloopthislife), 1, 4)) {
                wait(1);
                self.hasdonepainbreathloopthislife = 1;
                onexitdeathsdoor(0);
                break;
            }
        }
        self playlocalsound("plr_breath_pain_ong_exh");
        wait(1.7);
    }
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc6
// Size: 0xde
function onexitdeathsdoor(healed) {
    if (istrue(healed)) {
        self.painbreathloopsplayed = 0;
        self.hasdonepainbreathloopthislife = 0;
    }
    if (!istrue(self.deathsdoor)) {
        return;
    }
    self.deathsdoor = 0;
    self.deathsdoorsfx = 0;
    if (isplayer(self) && !isbot(self)) {
        function_86765f42c27f4bee();
        function_7067dfb2023a23b7();
    }
    self stoplocalsound("deaths_door_in");
    self playlocalsound("deaths_door_out");
    function_a2b4e6088394bade();
    self playlocalsound(ter_op(isfemale(), "Fem_breathing_better", "breathing_better"));
    self setentitysoundcontext("deaths_door", "", 0.1);
    self enableplayerbreathsystem(1);
    if (level.healthregendisabled) {
        self painvisionoff();
    }
    self notify("deaths_door_exit");
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeab
// Size: 0x23
function function_9030f56a68f604dc() {
    if (!isdefined(self.damage.deathsdooroverlaypulse)) {
        return;
    }
    thread function_41a40f1e0a6aa78e();
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed5
// Size: 0x7f
function function_c2e66bc8cbf81b2d() {
    if (!isdefined(self.damage.var_5d28af440fb50e5a)) {
        return;
    }
    self.damage.var_5d28af440fb50e5a fadeovertime(0.15);
    self.damage.var_5d28af440fb50e5a.alpha = function_3d879029586de3(1);
    self.damage.var_5d28af440fb50e5a.var_8a8941ad64562137 = 1;
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf5b
// Size: 0x11
function function_86765f42c27f4bee() {
    thread function_47b9c7c77690bb03(0, 3.5);
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf73
// Size: 0x58
function function_7067dfb2023a23b7() {
    if (!isdefined(self.damage.var_5d28af440fb50e5a)) {
        return;
    }
    self.damage.var_5d28af440fb50e5a fadeovertime(2);
    self.damage.var_5d28af440fb50e5a.alpha = 0;
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfd2
// Size: 0x68
function applyshrapnelfx() {
    self endon("disconnect");
    self notify("applyShrapnelFX");
    self endon("applyShrapnelFX");
    self setclientomnvar("ui_shrapnel_overlay", 1);
    self playlocalsound("iw8_mp_perk_shrapnel");
    var_25d2445e5d783e47 = applyshrapnelfxinternal();
    if (istrue(var_25d2445e5d783e47)) {
        self setclientomnvar("ui_shrapnel_overlay", 2);
    } else {
        self setclientomnvar("ui_shrapnel_overlay", 3);
    }
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1041
// Size: 0x46
function applyshrapnelfxinternal() {
    self endon("death");
    self endon("joined_team");
    self endon("joined_spectators");
    level endon("game_ended");
    value = waittill_any_return_3("shrapnel_ended_early", "shrapnel_ended", "force_regeneration");
    return value == "shrapnel_ended";
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x108f
// Size: 0x4d
function function_6410111baf734017() {
    if (!isdefined(level.var_194088d9669cb53d)) {
        level.var_194088d9669cb53d = getdvarint(@"hash_57bac575c6d501c4", 2000);
        level.var_1736de83d797adc0 = getdvarint(@"hash_2fd03831cb8a51e6", 4000);
    }
    return level.var_194088d9669cb53d;
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e4
// Size: 0x19
function function_549fbfada3618987() {
    var_194088d9669cb53d = function_6410111baf734017();
    return var_194088d9669cb53d > 2000;
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1105
// Size: 0x67
function function_f74c4c476c9489f6() {
    if (function_549fbfada3618987()) {
        /#
            assert(isdefined(level.var_1736de83d797adc0));
        #/
        if (!isdefined(self.lasttimedamaged)) {
            self.firsttimedamaged = gettime();
        } else if (gettime() - self.lasttimedamaged > level.var_1736de83d797adc0) {
            self.firsttimedamaged = gettime();
        }
    }
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1173
// Size: 0xd8
function removeoldattackersovertime() {
    self endon("damage");
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (!isdefined(self.attackers)) {
        return;
    }
    var_194088d9669cb53d = function_6410111baf734017();
    while (1) {
        time = gettime();
        foreach (guid, attacker in self.attackers) {
            if (isdefined(attacker) && time - self.attackerdata[guid].lasttimedamaged < var_194088d9669cb53d) {
                continue;
            }
            self.attackers[guid] = undefined;
            self.attackerdata[guid] = undefined;
        }
        waitframe();
    }
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1252
// Size: 0x17
function function_446043a04ae1bfe() {
    self.attackers = [];
    self.attackerdata = [];
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1270
// Size: 0x116
function damageeffects(idamage, eattacker, smeansofdeath, vpoint, var_1da1a66b5c6a06a7, objweapon, shitloc) {
    self endon("death_or_disconnect");
    self notify("damageEffects");
    if (!isplayer(self) || isbot(self) || function_483cc81bff18273b(self)) {
        return;
    }
    if (function_816434396dce13f(self)) {
        return;
    }
    var_ccbba16287668f0a = damageratio(idamage + var_1da1a66b5c6a06a7);
    if (!isdefined(eattacker) && smeansofdeath == "MOD_FALLING") {
        eattacker = self;
    }
    childthread damagepainvision(vpoint, var_ccbba16287668f0a, smeansofdeath, idamage, objweapon);
    childthread damagebloodoverlaydirectional(vpoint, var_ccbba16287668f0a, smeansofdeath, idamage, objweapon, shitloc);
    var_2809cfd0f803f738 = {objweapon:objweapon, var_1da1a66b5c6a06a7:var_1da1a66b5c6a06a7, vpoint:vpoint, smeansofdeath:smeansofdeath, eattacker:eattacker, idamage:idamage};
    callback::callback("on_player_damage_effects", var_2809cfd0f803f738);
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x138d
// Size: 0xc5
function damagepainvision(vpoint, var_ccbba16287668f0a, smeansofdeath, idamage, objweapon) {
    self endon("damageEffects");
    self endon("death_or_disconnect");
    if (!shoulddopainvision(objweapon)) {
        return 0;
    }
    if (function_c1af921b6351d49a(smeansofdeath)) {
        self function_2f6b8c6721d18b0b("vsp_fall");
        self function_9227c84d3fb311a3("vsp_bullet");
        return;
    }
    if (function_3e54581e73dff375(smeansofdeath)) {
        eventtype = "vsp_fall";
    } else if (function_6a97b15cdcd5961b(smeansofdeath)) {
        eventtype = "vsp_fire";
    } else if (function_9ca01a02f4efc7f6(smeansofdeath)) {
        eventtype = "vsp_explosive";
    } else {
        eventtype = "vsp_bullet";
    }
    self function_2f6b8c6721d18b0b(eventtype);
    self function_9227c84d3fb311a3(eventtype);
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1459
// Size: 0x47
function shoulddopainvision(objweapon) {
    if (istrue(level.wpinprogress) || istrue(self.focus)) {
        return 0;
    }
    if (isdefined(objweapon) && objweapon.basename == "dragonsbreath_mp") {
        return 0;
    }
    return 1;
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14a8
// Size: 0x27
function function_52f60ac82b866362(fadetime) {
    if (istrue(level.wpinprogress)) {
        return;
    }
    self visionsetnakedforplayer("", fadetime);
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14d6
// Size: 0x204
function damagebloodoverlaydirectional(vpoint, var_ccbba16287668f0a, smeansofdeath, idamage, objweapon, shitloc) {
    if (!isdefined(vpoint)) {
        return;
    }
    if (!function_9c9288020fccd597(var_ccbba16287668f0a, smeansofdeath, idamage, objweapon, shitloc)) {
        return;
    }
    time = gettime();
    if (time - self.damage.lastdiretionalbloodtime < 200) {
        return;
    } else {
        self.damage.lastdiretionalbloodtime = time;
    }
    sides = getplayersidesfromposition(vpoint);
    var_f34ffb5314f27b6d = "";
    if (function_9ca01a02f4efc7f6(smeansofdeath)) {
        prefix = "fullscreen_dirt_";
    } else if (!namespace_f8d3520d3483c1::hasarmor()) {
        prefix = "fullscreen_blood_";
        if (self.damage.altdirectionalbloodoverlay) {
            var_f34ffb5314f27b6d = "_alt";
            self.damage.altdirectionalbloodoverlay = 0;
        } else {
            self.damage.altdirectionalbloodoverlay = 1;
        }
    } else {
        prefix = "fullscreen_armor_";
    }
    foreach (side, type in sides) {
        material = prefix + side;
        var_f75ce51bc49a2e0f = material + "_splash";
        material = material + var_f34ffb5314f27b6d;
        var_6a78028dc80d36fe = createscreeneffectoffsets(randomfloatrange(0, 1), randomfloatrange(0, 1), randomfloatrange(0, 1));
        createscreeneffect(side, material, 0.15, 2, var_6a78028dc80d36fe, 1, 1, 1);
        createscreeneffect(side, var_f75ce51bc49a2e0f, 0.15, 0.15, var_6a78028dc80d36fe, 0, 1, 1);
    }
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16e1
// Size: 0x54
function function_9ca01a02f4efc7f6(smeansofdeath) {
    var_1c6cceb173ce3935 = [0:"MOD_PROJECTILE", 1:"MOD_PROJECTILE_SPLASH", 2:"MOD_EXPLOSIVE", 3:"MOD_GRENADE", 4:"MOD_GRENADE_SPLASH"];
    if (array_contains(var_1c6cceb173ce3935, smeansofdeath)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x173d
// Size: 0x25
function function_3e54581e73dff375(smeansofdeath) {
    if (smeansofdeath == "MOD_FALLING" || smeansofdeath == "MOD_IMPACT") {
        return 1;
    }
    return 0;
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x176a
// Size: 0x1a
function function_6a97b15cdcd5961b(smeansofdeath) {
    if (smeansofdeath == "MOD_FIRE") {
        return 1;
    }
    return 0;
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x178c
// Size: 0x1a
function function_c1af921b6351d49a(smeansofdeath) {
    if (smeansofdeath == "MOD_DOWN") {
        return 1;
    }
    return 0;
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ae
// Size: 0xb2
function function_9c9288020fccd597(var_ccbba16287668f0a, smeansofdeath, idamage, objweapon, shitloc) {
    if (!isalive(self)) {
        return 0;
    }
    if (isdefined(idamage) && idamage <= 12) {
        return 0;
    }
    if (utility::iswegameplatform()) {
        return 0;
    }
    if (namespace_8ade6bdb04213c12::isplayerunderwater()) {
        return 0;
    }
    if (function_3e54581e73dff375(smeansofdeath) || function_6a97b15cdcd5961b(smeansofdeath)) {
        return 0;
    }
    if (isdefined(objweapon) && objweapon.basename == "dragonsbreath_mp") {
        return 0;
    }
    if (istrue(self.inlaststand)) {
        return 0;
    }
    if (isdefined(shitloc) && shitloc == "shield") {
        return 0;
    }
    return 1;
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1868
// Size: 0xe5
function getplayersidesfromposition(position) {
    forwardvec = vectornormalize(anglestoforward(self.angles));
    rightvec = vectornormalize(anglestoright(self.angles));
    var_44ade5cf4179de8f = vectornormalize((position[0], position[1], 0) - (self.origin[0], self.origin[1], 0));
    fdot = vectordot(var_44ade5cf4179de8f, forwardvec);
    rdot = vectordot(var_44ade5cf4179de8f, rightvec);
    sides = [];
    if (abs(fdot) > 0.819152) {
        sides["bottom"] = 1;
    } else if (rdot > 0) {
        sides["right"] = 1;
    } else {
        sides["left"] = 1;
    }
    return sides;
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1955
// Size: 0x44
function createscreeneffectoffsets(x, y, scale) {
    offsets = [];
    offsets["x"] = x;
    offsets["y"] = y;
    offsets["scale"] = scale;
    return offsets;
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19a1
// Size: 0x29c
function createscreeneffect(side, shader, var_187ef7fae5a4f6f3, outtime, var_6a78028dc80d36fe, fadein, var_8983cfc1a0ff4ea1, var_ddd23dc36ab7cb2c) {
    hud = newclienthudelem(self);
    hud.sort = 13;
    hud.foreground = 0;
    hud.lowresbackground = var_8983cfc1a0ff4ea1;
    hud.horzalign = "fullscreen";
    hud.vertalign = "fullscreen";
    hud.alpha = 0;
    hud.enablehudlighting = 1;
    hud.var_79a4133f925e83f8 = 1;
    hud.var_8a8941ad64562137 = var_ddd23dc36ab7cb2c;
    x = 0;
    y = 0;
    var_ba8d59c006ab07c1 = 0;
    var_ba8d58c006ab058e = 0;
    var_91180be623f6b59b = math::factor_value(0.9, 1.25, var_6a78028dc80d36fe["scale"]);
    switch (side) {
    case #"hash_c9b3133a17a3b2d0":
        hud.aligny = "top";
        hud.alignx = "left";
        x = -640;
        y = math::factor_value(-30, 30, var_6a78028dc80d36fe["y"]);
        var_ba8d58c006ab058e = y;
        var_ba8d59c006ab07c1 = math::factor_value(-55, 0, var_6a78028dc80d36fe["x"]);
        break;
    case #"hash_96815ce4f2a3dbc5":
        hud.aligny = "top";
        hud.alignx = "right";
        x = 1280;
        y = math::factor_value(-30, 30, var_6a78028dc80d36fe["y"]);
        var_ba8d58c006ab058e = y;
        var_ba8d59c006ab07c1 = math::factor_value(0, 55, var_6a78028dc80d36fe["x"]) + 640;
        break;
    case #"hash_dcbcc9b3083fb78a":
        hud.aligny = "bottom";
        hud.alignx = "left";
        y = 960;
        x = math::factor_value(-50, 50, var_6a78028dc80d36fe["x"]);
        var_ba8d58c006ab058e = math::factor_value(0, 50, var_6a78028dc80d36fe["y"]);
        var_ba8d58c006ab058e = var_ba8d58c006ab058e + 480;
        var_ba8d59c006ab07c1 = x;
        break;
    }
    hud.x = x;
    hud.y = y;
    hud setshader(shader, 640, 480);
    thread screeneffectcleanup(hud);
    thread animatescreeneffect(hud, var_187ef7fae5a4f6f3, outtime, var_ba8d59c006ab07c1, var_ba8d58c006ab058e, var_91180be623f6b59b, fadein);
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c44
// Size: 0x28
function screeneffectcleanup(hud) {
    function_81a2b809749b4189(hud);
    if (isdefined(hud)) {
        hud notify("destroySreenEffectOverlay");
        hud destroy();
    }
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c73
// Size: 0x1b
function function_81a2b809749b4189(hud) {
    self endon("death_or_disconnect");
    hud waittill("destroySreenEffectOverlay");
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c95
// Size: 0x167
function animatescreeneffect(hud, var_187ef7fae5a4f6f3, outtime, x, y, scale, fadein) {
    self endon("death_or_disconnect");
    hud endon("destroySreenEffectOverlay");
    width = int(640 * scale);
    height = int(480 * scale);
    if (!fadein) {
        width = int(640 * scale);
        height = int(480 * scale);
        hud scaleovertime(var_187ef7fae5a4f6f3, width, height);
        hud moveovertime(var_187ef7fae5a4f6f3);
        hud.x = x;
        hud.y = y;
        var_187ef7fae5a4f6f3 = 0.05;
        hud.alpha = function_3d879029586de3(1);
        wait(0.05);
    } else {
        hud scaleovertime(var_187ef7fae5a4f6f3, width, height);
        hud.x = x;
        hud.y = y;
        wait(0.15);
        hud fadeovertime(var_187ef7fae5a4f6f3);
        hud.alpha = function_3d879029586de3(1);
        wait(var_187ef7fae5a4f6f3);
    }
    if (isdefined(hud)) {
        hud fadeovertime(outtime);
        hud.alpha = 0;
    }
    wait(outtime + 0.05);
    if (isdefined(hud)) {
        hud notify("destroySreenEffectOverlay");
    }
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e03
// Size: 0x17
function damageratio(idamage) {
    return math::normalize_value(10, 40, idamage);
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e22
// Size: 0x77
function function_2a9705c393c0e2c4() {
    return self.deathsdoor || isdefined(self.damage) && isdefined(self.damage.deathsdooroverlaypulse) && isdefined(self.damage.deathsdooroverlaypulse.var_eeda4296ae80e949) && self.damage.deathsdooroverlaypulse.var_eeda4296ae80e949 > 0;
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ea1
// Size: 0x19a
function function_41a40f1e0a6aa78e() {
    self notify("deaths_door_overlay_pulse");
    self endon("death_or_disconnect");
    self endon("deaths_door_overlay_pulse");
    thread function_47b9c7c77690bb03(1, 0.3);
    var_10c70bd3a4adb1a8 = function_5c0987ada94437df();
    starttime = gettime();
    if (!isdefined(self.heartbeat) || !isdefined(self.heartbeat.pulsetime)) {
        return;
    }
    while (function_2a9705c393c0e2c4()) {
        var_5c46646210255ef0 = self.heartbeat.pulsetime;
        var_60027769b32b054 = math::factor_value(0.15, 0.45, var_5c46646210255ef0);
        var_5dd15769b0c4106 = math::factor_value(0.05, 0.28, var_5c46646210255ef0);
        timepassed = gettime() - starttime;
        if (var_10c70bd3a4adb1a8 > 0) {
            var_3b56fe29ad0cb0b5 = math::normalize_value(0, var_10c70bd3a4adb1a8, timepassed);
        } else {
            var_3b56fe29ad0cb0b5 = 0;
        }
        var_9e6a60ab5457b772 = math::factor_value(var_60027769b32b054, var_5dd15769b0c4106, var_3b56fe29ad0cb0b5);
        if (isdefined(self.damage.deathsdooroverlaypulse)) {
            var_9e6a60ab5457b772 = var_9e6a60ab5457b772 * self.damage.deathsdooroverlaypulse.var_eeda4296ae80e949;
            var_9e6a60ab5457b772 = function_3d879029586de3(var_9e6a60ab5457b772);
            self.damage.deathsdooroverlaypulse fadeovertime(0.05);
            self.damage.deathsdooroverlaypulse.alpha = var_9e6a60ab5457b772;
        }
        waitframe();
    }
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2042
// Size: 0x107
function function_252173bf5ac108a3(startalpha, time) {
    if (!isplayer(self)) {
        return;
    }
    if (self.deathsdoor) {
        return;
    }
    if (!isdefined(self.damage)) {
        return;
    }
    self notify("deaths_door_overlay_pulse_oneoff");
    self endon("deaths_door_overlay_pulse_oneoff");
    self endon("deaths_door_overlay_pulse");
    self endon("death_or_disconnect");
    level endon("game_ended");
    starttime = time;
    while (time > 0) {
        if (!isdefined(self.damage.deathsdooroverlaypulse)) {
            return;
        }
        timefactor = math::normalize_value(0, starttime, time);
        var_9e6a60ab5457b772 = math::factor_value(0, startalpha, timefactor);
        var_9e6a60ab5457b772 = function_3d879029586de3(var_9e6a60ab5457b772);
        self.damage.deathsdooroverlaypulse fadeovertime(0.05);
        self.damage.deathsdooroverlaypulse.alpha = var_9e6a60ab5457b772;
        wait(0.05);
        time = time - 0.05;
    }
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2150
// Size: 0x14a
function function_47b9c7c77690bb03(var_5e6f92830acab138, time) {
    self notify("lerpDeathDoorOverlayAlpha");
    self endon("lerpDeathDoorOverlayAlpha");
    self endon("death_or_disconnect");
    if (!isdefined(self.damage) || !isdefined(self.damage.deathsdooroverlaypulse)) {
        return;
    }
    timer = time;
    startalpha = self.damage.deathsdooroverlaypulse.var_eeda4296ae80e949;
    while (timer > 0) {
        if (!isdefined(self.damage) || !isdefined(self.damage.deathsdooroverlaypulse)) {
            return;
        }
        var_47af4311a1d5afda = math::normalize_value(0, time, timer);
        var_eeda4296ae80e949 = math::factor_value(var_5e6f92830acab138, startalpha, var_47af4311a1d5afda);
        self.damage.deathsdooroverlaypulse.var_eeda4296ae80e949 = var_eeda4296ae80e949;
        timer = timer - 0.05;
        waitframe();
    }
    if (isdefined(self.damage) && isdefined(self.damage.deathsdooroverlaypulse)) {
        self.damage.deathsdooroverlaypulse.var_eeda4296ae80e949 = var_5e6f92830acab138;
    }
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22a1
// Size: 0xf1
function function_2ca98396c7f5cc85(falldamage) {
    var_ccbba16287668f0a = falldamage / self.maxhealth;
    var_2ff497a47c266950 = getdvarfloat(@"hash_6b03d4dba904d25e", 0.5);
    if (var_ccbba16287668f0a >= var_2ff497a47c266950) {
        var_4bc08db3876de031 = getdvarfloat(@"hash_2558d1926211903", 3);
        var_b1505e7ce3af8fea = 1 - var_2ff497a47c266950;
        var_acc0f0811605b1fe = (var_ccbba16287668f0a - var_2ff497a47c266950) / var_b1505e7ce3af8fea;
        var_f5ae019bfc804965 = var_acc0f0811605b1fe * var_4bc08db3876de031;
        namespace_9e00394bef0f1e98::_shellshock("falldamage", "damage", var_f5ae019bfc804965, 0, 0);
    }
    pulsetime = math::factor_value(0.5, 0.5, var_ccbba16287668f0a);
    var_9e6a60ab5457b772 = math::factor_value(0.3, 0.7, var_ccbba16287668f0a);
    function_252173bf5ac108a3(var_9e6a60ab5457b772, pulsetime);
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2399
// Size: 0x53
function function_54117659a8e5c5b4() {
    self.var_dd452cc5c546120b = "deaths_door_mp";
    if (isdefined(level.var_c3934394c0f5cb03)) {
        self.var_dd452cc5c546120b = level.var_c3934394c0f5cb03;
    } else if (level.gametype == "dungeons") {
        self.var_dd452cc5c546120b = "deaths_door_sp";
    }
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23f3
// Size: 0x65
function function_501be800abf11f33(fadetime, scale) {
    var_c96095bb15c39d95 = function_53c4c53197386572(self.var_dd452cc5c546120b, "deaths_door_mp");
    var_43a91c6f28585b19 = function_53c4c53197386572(fadetime, -1);
    n_scale = function_53c4c53197386572(scale, 1);
    self setsoundsubmix(var_c96095bb15c39d95, var_43a91c6f28585b19, n_scale);
}

// Namespace namespace_646e434ccdd09379/namespace_4887422e77f3514e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x245f
// Size: 0x57
function function_a2b4e6088394bade(fadetime) {
    var_c96095bb15c39d95 = function_53c4c53197386572(self.var_dd452cc5c546120b, "deaths_door_mp");
    var_43a91c6f28585b19 = function_53c4c53197386572(fadetime, undefined);
    if (isdefined(var_43a91c6f28585b19)) {
        self clearsoundsubmix(var_c96095bb15c39d95, var_43a91c6f28585b19);
    } else {
        self clearsoundsubmix(var_c96095bb15c39d95);
    }
}

