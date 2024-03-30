// mwiii decomp prototype
#using scripts\mp\hud_message.gsc;
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_27fdece778e999d8;
#using script_4a941421347ff7df;
#using scripts\mp\autopilot.gsc;
#using script_59ff79d681bb860c;
#using scripts\mp\utility\game.gsc;

#namespace mgl_mp;

// Namespace mgl_mp / scripts/mp/gametypes/mgl_mp
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25d
// Size: 0x7e
function function_8bb13aa2a5d32576(player, splashref, var_de02835724550257) {
    level endon("game_ended");
    self endon("disconnect");
    if (!isdefined(var_de02835724550257)) {
        var_de02835724550257 = getdvarfloat(@"hash_1ec37b5e27207639", 7);
    }
    player thread scripts/mp/hud_message::function_cd236201b71f07e2(splashref, var_de02835724550257);
    self setclientomnvar("ui_br_extended_load_screen", 1);
    wait(getdvarfloat(@"hash_eed49e631705b0ba", 6));
    self setclientomnvar("ui_br_extended_load_screen", 0);
}

// Namespace mgl_mp / scripts/mp/gametypes/mgl_mp
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e2
// Size: 0x1e
function function_97a717c89c217036(additional) {
    return scripts/engine/utility::array_combine([scripts/cp_mp/utility/game_utility::getlocaleid()], additional);
}

// Namespace mgl_mp / scripts/mp/gametypes/mgl_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x308
// Size: 0xc
function function_da8af86f82f90504() {
    level thread namespace_da125b44c190d236::function_c38398385afc10fc();
}

// Namespace mgl_mp / scripts/mp/gametypes/mgl_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31b
// Size: 0x55
function function_f9ae07213a0af3de() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    if (isai(self)) {
        return;
    }
    var_cba993afe88eb432 = getdvarint(@"hash_fd56cd977b402492", 0);
    if (var_cba993afe88eb432 <= 0) {
        return;
    }
    while (true) {
        self waittill("giveLoadout");
        childthread function_212d126522ad2c4f(var_cba993afe88eb432);
    }
}

// Namespace mgl_mp / scripts/mp/gametypes/mgl_mp
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x377
// Size: 0x7e
function function_212d126522ad2c4f(var_cba993afe88eb432) {
    self endon("giveLoadout");
    while (true) {
        var_24b56b36c35a0973 = self getcurrentprimaryweapon();
        if (isdefined(var_24b56b36c35a0973) && !isnullweapon(var_24b56b36c35a0973) && var_24b56b36c35a0973.classname != "melee") {
            currentweaponclipsize = weaponclipsize(var_24b56b36c35a0973);
            self setweaponammostock(var_24b56b36c35a0973, var_24b56b36c35a0973.startammo + (var_cba993afe88eb432 - 1) * currentweaponclipsize, 0);
            return;
        }
        waitframe();
    }
}

// Namespace mgl_mp / scripts/mp/gametypes/mgl_mp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3fc
// Size: 0xf
function function_9acf99e8c077e74d() {
    namespace_da125b44c190d236::initialize(&function_8bd0955f703e9104);
}

// Namespace mgl_mp / scripts/mp/gametypes/mgl_mp
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x412
// Size: 0x28
function private function_8bd0955f703e9104(mind_personality) {
    var_577f45571c039a54 = namespace_823e1abd5161abb1::function_e65493518b3de050();
    var_577f45571c039a54[var_577f45571c039a54.size] = "CaptureFlag";
    return var_577f45571c039a54;
}

// Namespace mgl_mp / scripts/mp/gametypes/mgl_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x442
// Size: 0x13
function function_4248416fffb4c5b3() {
    return function_97a717c89c217036(["dom_mgl"]);
}

// Namespace mgl_mp / scripts/mp/gametypes/mgl_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45d
// Size: 0x22
function function_8c9c24a50231b1f9() {
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    function_da8af86f82f90504();
}

// Namespace mgl_mp / scripts/mp/gametypes/mgl_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x486
// Size: 0x3a
function function_53ae52a625b5c703() {
    if (!scripts/cp_mp/utility/game_utility::function_6493ec89ae923684()) {
        level.bot_funcs["should_do_killcam"] = &function_4eb101b735d9f3fd;
    }
    namespace_da125b44c190d236::initialize();
    scripts/mp/autopilot::initialize(undefined, &function_132e4bfc51f7ecea, &function_d4307f8c6af7844);
}

// Namespace mgl_mp / scripts/mp/gametypes/mgl_mp
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4c7
// Size: 0x21
function private function_4eb101b735d9f3fd() {
    if (istrue(game["isLaunchChunk"])) {
        return true;
    }
    return randomfloat(1) < 0.9;
}

// Namespace mgl_mp / scripts/mp/gametypes/mgl_mp
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4f0
// Size: 0xf
function private function_132e4bfc51f7ecea() {
    namespace_41f4dfb71dd08362::onbotspawnedcommon("Combat");
}

// Namespace mgl_mp / scripts/mp/gametypes/mgl_mp
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x506
// Size: 0x4
function private function_d4307f8c6af7844() {
    waitframe();
}

// Namespace mgl_mp / scripts/mp/gametypes/mgl_mp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x511
// Size: 0x13
function function_e6cabfefe9db5685() {
    return function_97a717c89c217036(["war_mgl"]);
}

// Namespace mgl_mp / scripts/mp/gametypes/mgl_mp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x52c
// Size: 0x39
function function_ce76a0f1345b7f4f() {
    if (!scripts/cp_mp/utility/game_utility::function_6493ec89ae923684()) {
        level.onplayerconnect = &war_onplayerconnect;
        level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    }
    function_da8af86f82f90504();
}

// Namespace mgl_mp / scripts/mp/gametypes/mgl_mp
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x56c
// Size: 0x1b
function private war_onplayerconnect(player) {
    player thread function_8bb13aa2a5d32576(player, "mp_gametype_war_mgl_match_introduction");
}

// Namespace mgl_mp / scripts/mp/gametypes/mgl_mp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x58e
// Size: 0xf
function function_892db361940e142d() {
    namespace_da125b44c190d236::initialize(&function_8aac6813797463e4);
}

// Namespace mgl_mp / scripts/mp/gametypes/mgl_mp
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5a4
// Size: 0x28
function private function_8aac6813797463e4(mind_personality) {
    var_577f45571c039a54 = namespace_823e1abd5161abb1::function_e65493518b3de050();
    var_577f45571c039a54[var_577f45571c039a54.size] = "CaptureHardpoint";
    return var_577f45571c039a54;
}

// Namespace mgl_mp / scripts/mp/gametypes/mgl_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d4
// Size: 0x25
function function_7b7c572755736c13() {
    return function_97a717c89c217036(["koth_mgl", "hardpoint", "tdm"]);
}

// Namespace mgl_mp / scripts/mp/gametypes/mgl_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x601
// Size: 0x1c
function function_29020e26e20049d9() {
    if (!getdvarint(@"hash_131a7029db1ed456", 0)) {
        function_da8af86f82f90504();
    }
}

// Namespace mgl_mp / scripts/mp/gametypes/mgl_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x624
// Size: 0x8
function function_d91924619ae46b1f() {
    return "icon_medium";
}

// Namespace mgl_mp / scripts/mp/gametypes/mgl_mp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x634
// Size: 0x8d
function function_afadc6882a95f376(revivespawn) {
    thread function_f9ae07213a0af3de();
    isfirstround = scripts/mp/utility/game::isfirstround();
    isswitchedsides = istrue(game["shouldDisplayRoundSwitch"]);
    if (isfirstround || isswitchedsides) {
        var_de02835724550257 = undefined;
        if (!isfirstround) {
            var_de02835724550257 = 2.9;
        }
        if (game["attackers"] == self.team) {
            thread function_8bb13aa2a5d32576(self, "mp_gametype_sd_mgl_match_attacker_introduction", var_de02835724550257);
            return;
        }
        thread function_8bb13aa2a5d32576(self, "mp_gametype_sd_mgl_match_defender_introduction", var_de02835724550257);
    }
}

// Namespace mgl_mp / scripts/mp/gametypes/mgl_mp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6c8
// Size: 0x11
function function_47e2a0de1d6b6115() {
    level.onplayerconnect = &conf_onplayerconnect;
}

// Namespace mgl_mp / scripts/mp/gametypes/mgl_mp
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6e0
// Size: 0x1b
function private conf_onplayerconnect(player) {
    player thread function_8bb13aa2a5d32576(player, "mp_gametype_conf_mgl_match_introduction");
}

