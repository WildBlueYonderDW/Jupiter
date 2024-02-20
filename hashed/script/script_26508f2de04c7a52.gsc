// mwiii decomp prototype
#using scripts\mp\hud_message.gsc;
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_27fdece778e999d8;
#using script_4a941421347ff7df;
#using script_642082e8edba5663;
#using script_59ff79d681bb860c;
#using scripts\mp\utility\game.gsc;

#namespace namespace_3e12eae785a1f325;

// Namespace namespace_3e12eae785a1f325/namespace_afbc0aa1b551667a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25d
// Size: 0x7e
function function_8bb13aa2a5d32576(player, var_f7b6cc6c062a7a43, var_de02835724550257) {
    level endon("game_ended");
    self endon("disconnect");
    if (!isdefined(var_de02835724550257)) {
        var_de02835724550257 = getdvarfloat(@"hash_1ec37b5e27207639", 7);
    }
    player thread namespace_44abc05161e2e2cb::function_cd236201b71f07e2(var_f7b6cc6c062a7a43, var_de02835724550257);
    self setclientomnvar("ui_br_extended_load_screen", 1);
    wait(getdvarfloat(@"hash_eed49e631705b0ba", 6));
    self setclientomnvar("ui_br_extended_load_screen", 0);
}

// Namespace namespace_3e12eae785a1f325/namespace_afbc0aa1b551667a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e2
// Size: 0x1e
function function_97a717c89c217036(var_51a32b881be32558) {
    return namespace_3c37cb17ade254d::array_combine([0:namespace_36f464722d326bbe::getlocaleid()], var_51a32b881be32558);
}

// Namespace namespace_3e12eae785a1f325/namespace_afbc0aa1b551667a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x308
// Size: 0xc
function function_da8af86f82f90504() {
    level thread namespace_da125b44c190d236::function_c38398385afc10fc();
}

// Namespace namespace_3e12eae785a1f325/namespace_afbc0aa1b551667a
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
    while (1) {
        self waittill("giveLoadout");
        childthread function_212d126522ad2c4f(var_cba993afe88eb432);
    }
}

// Namespace namespace_3e12eae785a1f325/namespace_afbc0aa1b551667a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x377
// Size: 0x7e
function function_212d126522ad2c4f(var_cba993afe88eb432) {
    self endon("giveLoadout");
    while (1) {
        var_24b56b36c35a0973 = self getcurrentprimaryweapon();
        if (isdefined(var_24b56b36c35a0973) && !isnullweapon(var_24b56b36c35a0973) && var_24b56b36c35a0973.classname != "melee") {
            var_624e160470aba9b9 = weaponclipsize(var_24b56b36c35a0973);
            self setweaponammostock(var_24b56b36c35a0973, var_24b56b36c35a0973.startammo + (var_cba993afe88eb432 - 1) * var_624e160470aba9b9, 0);
            return;
        }
        waitframe();
    }
}

// Namespace namespace_3e12eae785a1f325/namespace_afbc0aa1b551667a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3fc
// Size: 0xf
function function_9acf99e8c077e74d() {
    namespace_da125b44c190d236::initialize(&function_8bd0955f703e9104);
}

// Namespace namespace_3e12eae785a1f325/namespace_afbc0aa1b551667a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x412
// Size: 0x28
function private function_8bd0955f703e9104(var_e2055bf088954e86) {
    var_577f45571c039a54 = namespace_823e1abd5161abb1::function_e65493518b3de050();
    var_577f45571c039a54[var_577f45571c039a54.size] = "CaptureFlag";
    return var_577f45571c039a54;
}

// Namespace namespace_3e12eae785a1f325/namespace_afbc0aa1b551667a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x442
// Size: 0x13
function function_4248416fffb4c5b3() {
    return function_97a717c89c217036([0:"dom_mgl"]);
}

// Namespace namespace_3e12eae785a1f325/namespace_afbc0aa1b551667a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45d
// Size: 0x22
function function_8c9c24a50231b1f9() {
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    function_da8af86f82f90504();
}

// Namespace namespace_3e12eae785a1f325/namespace_afbc0aa1b551667a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x486
// Size: 0x3a
function function_53ae52a625b5c703() {
    if (!namespace_36f464722d326bbe::function_6493ec89ae923684()) {
        level.bot_funcs["should_do_killcam"] = &function_4eb101b735d9f3fd;
    }
    namespace_da125b44c190d236::initialize();
    namespace_fed7ec0976bb84c5::initialize(undefined, &function_132e4bfc51f7ecea, &function_d4307f8c6af7844);
}

// Namespace namespace_3e12eae785a1f325/namespace_afbc0aa1b551667a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4c7
// Size: 0x21
function private function_4eb101b735d9f3fd() {
    if (istrue(game["isLaunchChunk"])) {
        return 1;
    }
    return randomfloat(1) < 0.9;
}

// Namespace namespace_3e12eae785a1f325/namespace_afbc0aa1b551667a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4f0
// Size: 0xf
function private function_132e4bfc51f7ecea() {
    namespace_41f4dfb71dd08362::function_21b2d65575e9c0cc("Combat");
}

// Namespace namespace_3e12eae785a1f325/namespace_afbc0aa1b551667a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x506
// Size: 0x4
function private function_d4307f8c6af7844() {
    waitframe();
}

// Namespace namespace_3e12eae785a1f325/namespace_afbc0aa1b551667a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x511
// Size: 0x13
function function_e6cabfefe9db5685() {
    return function_97a717c89c217036([0:"war_mgl"]);
}

// Namespace namespace_3e12eae785a1f325/namespace_afbc0aa1b551667a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x52c
// Size: 0x39
function function_ce76a0f1345b7f4f() {
    if (!namespace_36f464722d326bbe::function_6493ec89ae923684()) {
        level.onplayerconnect = &function_bc2ddbf95aecc9e0;
        level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    }
    function_da8af86f82f90504();
}

// Namespace namespace_3e12eae785a1f325/namespace_afbc0aa1b551667a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x56c
// Size: 0x1b
function private function_bc2ddbf95aecc9e0(player) {
    player thread function_8bb13aa2a5d32576(player, "mp_gametype_war_mgl_match_introduction");
}

// Namespace namespace_3e12eae785a1f325/namespace_afbc0aa1b551667a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x58e
// Size: 0xf
function function_892db361940e142d() {
    namespace_da125b44c190d236::initialize(&function_8aac6813797463e4);
}

// Namespace namespace_3e12eae785a1f325/namespace_afbc0aa1b551667a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5a4
// Size: 0x28
function private function_8aac6813797463e4(var_e2055bf088954e86) {
    var_577f45571c039a54 = namespace_823e1abd5161abb1::function_e65493518b3de050();
    var_577f45571c039a54[var_577f45571c039a54.size] = "CaptureHardpoint";
    return var_577f45571c039a54;
}

// Namespace namespace_3e12eae785a1f325/namespace_afbc0aa1b551667a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d4
// Size: 0x25
function function_7b7c572755736c13() {
    return function_97a717c89c217036([0:"koth_mgl", 1:"hardpoint", 2:"tdm"]);
}

// Namespace namespace_3e12eae785a1f325/namespace_afbc0aa1b551667a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x601
// Size: 0x1c
function function_29020e26e20049d9() {
    if (!getdvarint(@"hash_131a7029db1ed456", 0)) {
        function_da8af86f82f90504();
    }
}

// Namespace namespace_3e12eae785a1f325/namespace_afbc0aa1b551667a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x624
// Size: 0x8
function function_d91924619ae46b1f() {
    return "icon_medium";
}

// Namespace namespace_3e12eae785a1f325/namespace_afbc0aa1b551667a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x634
// Size: 0x8d
function function_afadc6882a95f376(var_9156b53bcf7ce573) {
    thread function_f9ae07213a0af3de();
    isfirstround = namespace_cd0b2d039510b38d::isfirstround();
    var_f959a774a90894c4 = istrue(game["shouldDisplayRoundSwitch"]);
    if (isfirstround || var_f959a774a90894c4) {
        var_de02835724550257 = undefined;
        if (!isfirstround) {
            var_de02835724550257 = 2.9;
        }
        if (game["attackers"] == self.team) {
            thread function_8bb13aa2a5d32576(self, "mp_gametype_sd_mgl_match_attacker_introduction", var_de02835724550257);
        } else {
            thread function_8bb13aa2a5d32576(self, "mp_gametype_sd_mgl_match_defender_introduction", var_de02835724550257);
        }
    }
}

// Namespace namespace_3e12eae785a1f325/namespace_afbc0aa1b551667a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6c8
// Size: 0x11
function function_47e2a0de1d6b6115() {
    level.onplayerconnect = &function_e96348590e5e9676;
}

// Namespace namespace_3e12eae785a1f325/namespace_afbc0aa1b551667a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6e0
// Size: 0x1b
function private function_e96348590e5e9676(player) {
    player thread function_8bb13aa2a5d32576(player, "mp_gametype_conf_mgl_match_introduction");
}

