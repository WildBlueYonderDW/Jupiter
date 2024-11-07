#using script_7e4d332e911e1b90;
#using scripts\anim\utility_common.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using script_13d1c402f1421c35;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_sp.gsc;
#using script_3433ee6b63c7e243;
#using scripts\asm\shared\utility.gsc;
#using scripts\sp\equipment\offhands.gsc;
#using scripts\sp\names.gsc;
#using script_c11d6400ba31ed7;
#using script_5c36b3719581f7cc;
#using script_35de402efc5acfb3;
#using scripts\sp\player\playerchatter.gsc;
#using scripts\sp\load.gsc;
#using scripts\common\ai.gsc;
#using script_55b3046625fb79b6;
#using scripts\anim\face.gsc;
#using script_6fb5933380201a3a;
#using scripts\smartobjects\utility.gsc;

#namespace init;

// Namespace init / namespace_a8b91aa898baa76c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x226
// Size: 0xfe
function main() {
    if (!flag_exist("load_finished")) {
        flag_init("load_finished");
    }
    if (!isdefined(self.export)) {
        self.export = -1;
    }
    setupuniqueanims();
    if (self.type != "zombie") {
        scripts\asm\shared\utility::setupsoldierdefaults();
        thread setupweapons();
    }
    thread scripts\sp\equipment\offhands::offhandfiremanager();
    if (!isdefined(level.disablemonitorflash)) {
        thread monitorflash();
    }
    thread ondeath();
    if (!getdvarint(@"hash_e6afce2cf5cf7515")) {
        self pushplayer(0);
    }
    if (self.type != "zombie") {
        thread setnameandrank_andaddtosquad();
    }
    if (isdefined(level.aitypeinitfuncs) && isdefined(level.aitypeinitfuncs[self.classname])) {
        self [[ level.aitypeinitfuncs[self.classname] ]]();
    }
    self.fnachievements = &achievement_death_tracker;
}

// Namespace init / namespace_a8b91aa898baa76c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x32c
// Size: 0x2d
function shouldforceupdatebt() {
    return isdefined(self.bt.forceupdate) && self.bt.forceupdate;
}

// Namespace init / namespace_a8b91aa898baa76c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x362
// Size: 0x6b
function weapons_with_ir(weapon) {
    weapons[0] = "m4_grenadier";
    weapons[1] = "m4_grunt";
    weapons[2] = "m4_silencer";
    weapons[3] = "m4m203";
    if (!isdefined(weapon)) {
        return false;
    }
    for (i = 0; i < weapons.size; i++) {
        if (issubstr(weapon, weapons[i])) {
            return true;
        }
    }
    return false;
}

// Namespace init / namespace_a8b91aa898baa76c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d6
// Size: 0x18
function setnameandrank_andaddtosquad() {
    self endon("death");
    scripts\sp\names::get_name();
    thread namespace_fe5fbd2b56f035f::addtosquad();
}

/#

    // Namespace init / namespace_a8b91aa898baa76c
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3f6
    // Size: 0x186
    function pollallowedstancesthread() {
        for (;;) {
            if (self isstanceallowed("<dev string:x1c>")) {
                line[0] = "<dev string:x22>";
                color[0] = (0, 1, 0);
            } else {
                line[0] = "<dev string:x30>";
                color[0] = (1, 0, 0);
            }
            if (self isstanceallowed("<dev string:x42>")) {
                line[1] = "<dev string:x49>";
                color[1] = (0, 1, 0);
            } else {
                line[1] = "<dev string:x58>";
                color[1] = (1, 0, 0);
            }
            if (self isstanceallowed("<dev string:x6b>")) {
                line[2] = "<dev string:x71>";
                color[2] = (0, 1, 0);
            } else {
                line[2] = "<dev string:x7f>";
                color[2] = (1, 0, 0);
            }
            var_3ca3c774a3d57bc0 = self getshootatpos() + (0, 0, 30);
            offset = (0, 0, -10);
            for (i = 0; i < line.size; i++) {
                textpos = (var_3ca3c774a3d57bc0[0] + offset[0] * i, var_3ca3c774a3d57bc0[1] + offset[1] * i, var_3ca3c774a3d57bc0[2] + offset[2] * i);
                print3d(textpos, line[i], color[i], 1, 0.75);
            }
            wait 0.05;
        }
    }

#/

// Namespace init / namespace_a8b91aa898baa76c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x584
// Size: 0x25
function setupuniqueanims() {
    if (!isdefined(self.animplaybackrate) || !isdefined(self.moveplaybackrate)) {
        set_anim_playback_rate();
    }
}

// Namespace init / namespace_a8b91aa898baa76c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b1
// Size: 0x54
function set_anim_playback_rate() {
    self.animplaybackrate = 0.97 + randomfloat(0.13);
    self.movetransitionrate = 0.97 + randomfloat(0.13);
    self.moveplaybackrate = self.movetransitionrate;
    self.sidesteprate = 1.35;
}

// Namespace init / namespace_a8b91aa898baa76c
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x60d
// Size: 0x2b
function infiniteloop(one, two, three, var_7fafd0db06fdaa23) {
    anim waittill("new exceptions");
}

// Namespace init / namespace_a8b91aa898baa76c
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x640
// Size: 0x23
function empty(one, two, three, var_7fafd0db06fdaa23) {
    
}

// Namespace init / namespace_a8b91aa898baa76c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x66b
// Size: 0x104
function initdeveloperdvars() {
    /#
        if (getdvar(@"hash_993202a1929383dc") == "<dev string:x91>") {
            setdvar(@"hash_993202a1929383dc", "<dev string:x92>");
        } else if (getdvar(@"hash_993202a1929383dc") == "<dev string:x96>") {
            anim.defaultexception = &namespace_a8b91aa898baa76c::infiniteloop;
        }
        if (getdvar(@"hash_27494f1d75fc0809") == "<dev string:x91>") {
            setdvar(@"hash_27494f1d75fc0809", "<dev string:x92>");
        }
        if (getdvar(@"hash_c407a6f2012f4956") == "<dev string:x91>") {
            setdvar(@"hash_c407a6f2012f4956", "<dev string:x99>");
        }
        if (getdvar(@"anim_debug") == "<dev string:x91>") {
            setdvar(@"anim_debug", "<dev string:x91>");
        }
        if (getdvar(@"hash_a5a1f35d513dd71b") == "<dev string:x91>") {
            setdvar(@"hash_a5a1f35d513dd71b", "<dev string:x91>");
        }
    #/
}

// Namespace init / namespace_a8b91aa898baa76c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x777
// Size: 0x62
function initbattlechatter() {
    if (!isdefined(anim.player.team)) {
        anim.player.team = "allies";
    }
    init_squadmanager();
    namespace_378f8281e2d12ced::init_battlechatter();
    anim.player thread scripts\sp\player\playerchatter::playeranimnameswitch();
    anim.player thread namespace_fe5fbd2b56f035f::addtosquad();
}

// Namespace init / namespace_a8b91aa898baa76c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7e1
// Size: 0x9a
function initgrenades() {
    for (i = 0; i < level.players.size; i++) {
        player = level.players[i];
        function_b4ebe6632d7e8efe(player, "lethal", randomintrange(1000, 20000));
        function_b4ebe6632d7e8efe(player, "tactical", randomintrange(1000, 20000));
        player thread setnextplayergrenadetime();
    }
    function_b4ebe6632d7e8efe(undefined, "lethal", randomintrange(0, 20000));
    function_b4ebe6632d7e8efe(undefined, "tactical", randomintrange(0, 20000));
}

// Namespace init / namespace_a8b91aa898baa76c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x883
// Size: 0xcf
function setnextplayergrenadetime() {
    assert(isplayer(self));
    waittillframeend();
    if (isdefined(self.gs.playergrenaderangetime)) {
        maxtime = int(self.gs.playergrenaderangetime * 0.7);
        if (maxtime < 1) {
            maxtime = 1;
        }
        function_b4ebe6632d7e8efe(self, "lethal", randomintrange(0, maxtime));
    }
    if (isdefined(self.gs.playerdoublegrenadetime)) {
        maxtime = int(self.gs.playerdoublegrenadetime);
        mintime = int(maxtime / 2);
        if (maxtime <= mintime) {
            maxtime = mintime + 1;
        }
        function_e4da167dc330b3d3(self, randomintrange(mintime, maxtime));
    }
}

// Namespace init / namespace_a8b91aa898baa76c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x95a
// Size: 0x4d
function ondeath() {
    if (isdefined(level.disablestrangeondeath)) {
        return;
    }
    self waittill("death");
    if (!isdefined(self)) {
        if (isdefined(self.a.usingturret)) {
            self.a.usingturret delete();
        }
    }
}

// Namespace init / namespace_a8b91aa898baa76c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9af
// Size: 0x206
function firstinit() {
    /#
        setdvarifuninitialized(@"hash_f53ba58df3983a20", "<dev string:x96>");
        setdvarifuninitialized(@"hash_a19781010239d2e6", "<dev string:x91>");
        setdvarifuninitialized(@"hash_5fa8fd0b6bdb960", "<dev string:x91>");
        setdvarifuninitialized(@"hash_326268c4fc6f45f9", 0);
    #/
    if (isdefined(anim.notfirsttime)) {
        return;
    }
    anim.notfirsttime = 1;
    scripts\sp\load::anim_earlyinit();
    level.nextgrenadedrop = randomint(3);
    level.lastplayersighted = 100;
    anim.defaultexception = &namespace_a8b91aa898baa76c::empty;
    if (!isdefined(level.g_effect)) {
        level.g_effect = [];
    }
    initdeveloperdvars();
    scripts\sp\names::setup_names();
    initanimvars();
    function_a2b8f8b0891ee7fe();
    scripts\common\ai::function_67ec1df786cad61a();
    initgrenades();
    initmeleecharges();
    level.fngetcorpsearrayfunc = &getcorpsearraysp;
    level.fnsetcorpseremovetimerfunc = &setcorpseremovetimersp;
    if (!isdefined(anim.optionalstepeffectfunction)) {
        anim.fnfootstepeffectsmall = &namespace_acef762f74130ac8::playfootstepeffectsmall;
        anim.fnfootstepeffect = &namespace_acef762f74130ac8::playfootstepeffect;
    }
    if (!isdefined(anim.fnfootprinteffect)) {
        anim.fnfootprinteffect = &namespace_acef762f74130ac8::playfootprinteffect;
    }
    if (getdvarint(@"hash_5e3944acaebdd5a0", 0) == 1) {
    }
    namespace_acef762f74130ac8::registernotetracksifnot();
    scripts\engine\sp\utility::setupglobalcallbackfunctions_sp();
    /#
        setdvarifuninitialized(@"hash_45108357a895b6c4", "<dev string:x92>");
    #/
    level.painai = undefined;
    scripts\anim\face::initlevelface();
    if (!isdefined(anim.chatinitialized)) {
        if (scripts\engine\utility::player_is_in_jackal()) {
            anim.player = level.player_jackal;
        } else {
            anim.player = getentarray("player", "classname")[0];
        }
        initbattlechatter();
    }
    initwindowtraverse();
    namespace_9b37831a42423308::setupcqbpointsofinterest();
    scripts\smartobjects\utility::init_smartobjects();
    setuprandomtable();
    level.player thread watchreloading();
}

// Namespace init / namespace_a8b91aa898baa76c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbbd
// Size: 0x13
function getcorpsearraysp() {
    result = getcorpsearray();
    return result;
}

// Namespace init / namespace_a8b91aa898baa76c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbd9
// Size: 0x12
function setcorpseremovetimersp(time) {
    return self setcorpseremovetimer(time);
}

// Namespace init / namespace_a8b91aa898baa76c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbf4
// Size: 0x175
function achievement_death_tracker() {
    if (!isdefined(self.attacker) || !isplayer(self.attacker)) {
        return;
    }
    if (!isdefined(self.team) || self.team != "axis" && self.team != "team3") {
        return;
    }
    if (isdefined(self.damagemod) && isdefined(self.damageweapon) && isdefined(self.damageweapon.basename)) {
        if (self.damagemod == "MOD_IMPACT" && isstartstr(self.damageweapon.basename, "smoke")) {
            level thread scripts\sp\utility::giveachievement_wrapper("smokedirect");
        }
    }
    if (level.player isonladder()) {
        var_32963b8862f62085 = level.player getplayerprogression("achievementHangtime");
        if (var_32963b8862f62085 < 3) {
            if (isdefined(self.damagemod) && (self.damagemod == "MOD_PISTOL_BULLET" || self.damagemod == "MOD_RIFLE_BULLET" || self.damagemod == "MOD_EXPLOSIVE_BULLET")) {
                if (var_32963b8862f62085 == 2) {
                    level thread scripts\sp\utility::giveachievement_wrapper("hangtime");
                }
                level.player setplayerprogression("achievementHangtime", var_32963b8862f62085 + 1);
            }
        }
    }
}

