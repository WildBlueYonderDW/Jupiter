// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\bots\bots_strategy.gsc;
#using scripts\mp\bots\bots_gametype_br.gsc;
#using script_59ff79d681bb860c;
#using scripts\engine\math.gsc;
#using script_d74ae0b4aa21186;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using script_26ccbfe3954cacf4;
#using script_642082e8edba5663;
#using scripts\mp\utility\game.gsc;
#using script_4c9bd9a3bf3f8cf7;
#using scripts\mp\gametypes\br_plunder.gsc;
#using script_5120873d6d2bb7e2;
#using script_4a6760982b403bad;
#using scripts\mp\gametypes\br_public.gsc;
#using script_3904cfff5ce7fdcb;
#using script_58be75c518bf0d40;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\br_c130.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using script_40e63dd222434655;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\class.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br.gsc;
#using script_72af5a878a9d3397;
#using scripts\mp\gametypes\br_spectate.gsc;
#using scripts\mp\gametypes\br_armory_kiosk.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using script_110fd2130c2ed1fe;
#using script_6388860e9e2a83bd;
#using scripts\mp\gametypes\br_assassination_quest.gsc;
#using scripts\mp\gametypes\br_vip_quest.gsc;
#using scripts\cp_mp\gasmask.gsc;
#using script_64acb6ce534155b7;
#using scripts\mp\equipment.gsc;
#using script_58f20490049af6ac;
#using scripts\mp\gametypes\br_weapons.gsc;

#namespace namespace_7823423e849112c7;

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa1
// Size: 0xaf
function function_81a10b74bfe305a9() {
    level.bot_funcs["player_spawned_gamemode"] = &spawned;
    level.bot_funcs["gametype_think"] = &function_f7453e13040e1140;
    level.bot_funcs["select_class_from_airdrop"] = &function_5b54ecc3b227f84d;
    level.bot_funcs["revive_think"] = &void;
    namespace_56b9cc3deb6e3f5e::function_232b4a5109df340(level.var_18c3a736721cd3a4);
    namespace_71073fa38f11492::registerbrgametypefunc("accelerateBotsGulagMatch", &function_b5e22620a8778c4a);
    /#
        function_c8cc3e3589f34923(level.br_level.var_61321b51908d55cb);
        function_c8cc3e3589f34923(level.br_level.var_61321c51908d57fe);
    #/
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1057
// Size: 0xae
function function_5865e18adb02de38() {
    function_c31d67862e4c9341();
    level.var_7d43ccdc62f43db3 = &function_81a10b74bfe305a9;
    level.bots_gametype_handles_class_choice = !istrue(level.var_66113aa6fc12be57);
    registerbrgametypefunc("onSpawnPlayer", &onspawnplayer);
    registerbrgametypefunc("mayConsiderPlayerDead", &function_98ba4f8e00e49831);
    if (namespace_95d8d8ec67e3e074::isenabled()) {
        registerbrgametypefunc("onPlayerConnect", &namespace_95d8d8ec67e3e074::onplayerconnect);
        registerbrgametypefunc("onPlayerDisconnect", &namespace_95d8d8ec67e3e074::onplayerdisconnect);
        registerbrgametypefunc("isTeamEliminated", &namespace_95d8d8ec67e3e074::isteameliminated);
    }
    namespace_fed7ec0976bb84c5::initialize(undefined, &function_bb8b7cdce37ccab, &function_eac6ce0d8138984b);
    if (namespace_cd0b2d039510b38d::matchmakinggame()) {
        level thread function_f4cd8d89e37b4888();
    }
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x110c
// Size: 0x54f
function private function_c31d67862e4c9341() {
    if (isusingmatchrulesdata() && !getdvarint(@"hash_4f22ec718d3c74f6", 0)) {
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "brBotSurvivalCurveEnabled");
        setdynamicdvar(@"hash_79500dabf3e1a102", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "botMindCombatExtraGrenadeThrow");
        setdynamicdvar(@"hash_d118fed8f0c59f4d", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "botMindBrSniperCombatExtraGrenadeThrow");
        setdynamicdvar(@"hash_7fc4f004028aa76", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "brBotRecycleEnabled");
        setdynamicdvar(@"hash_b7fcb658021d7931", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "brBotUiBotMaxCount");
        setdynamicdvar(@"hash_f3a6b99340f5a95f", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "brBotRespawnRecycleAllowed");
        setdynamicdvar(@"hash_417e3b8c61f58e03", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "brBotRecycleDelaySec");
        setdynamicdvar(@"hash_de394b7049bf2445", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "brBotRecycleNormal2DDistance");
        setdynamicdvar(@"hash_d0dc9e305f43690", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "brBotRecycleLanding2DDistance");
        setdynamicdvar(@"hash_81156fddeb6b5508", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "brBotRecycleInactiveTimeMs");
        setdynamicdvar(@"hash_8f312094be1c23b0", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "brBotRandomFightIntervalSec");
        setdynamicdvar(@"hash_e0ec70c334cf532a", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "brBotDormantToUiBotTimeMs");
        setdynamicdvar(@"hash_3b0dbf95a91a8233", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "brBotDeployAroundHumanRadius");
        setdynamicdvar(@"hash_358164e65d640280", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "brBotHumanUnengagedTimeMs");
        setdynamicdvar(@"hash_e32340e297efbbdd", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "brIdlePenaltyTimeForUnengagedHuman");
        setdynamicdvar(@"hash_9be4e2fbbfe8d9c5", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "brBotAirDeployChance");
        setdynamicdvar(@"hash_e4a177febf5c5689", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "brBotClearPlotArmorTriggerHurtTimeoutSec");
        setdynamicdvar(@"hash_b7f8b4b89ea6ced1", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "brBotPrematchActivePlayerMaxCount");
        setdynamicdvar(@"hash_e82992eec48cf830", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "brBotGiveLoadoutDelay");
        setdynamicdvar(@"hash_b18793f70e0f6b34", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "brBotGiveLoadoutDistance");
        setdynamicdvar(@"hash_3da4efd986f095de", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "botDifficultyProportionRecruit");
        setdynamicdvar(@"hash_60ae0d4490076046", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "botDifficultyProportionRegular");
        setdynamicdvar(@"hash_55ccab727e144f34", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "botDifficultyProportionHardened");
        setdynamicdvar(@"hash_b3f66372fb38fccb", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "botDifficultyProportionVeteran");
        setdynamicdvar(@"hash_ff9490c8b80cf74f", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "botMindPersonalityProportionDefault");
        setdynamicdvar(@"hash_dfd0051082e1f237", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "botMindPersonalityProportionSniper");
        setdynamicdvar(@"hash_8a746ee0f068d111", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "botMindPersonalityProportionAutomation");
        setdynamicdvar(@"hash_a30827606766b1a5", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "brMindCombatExpectedKillMaxInput");
        setdynamicdvar(@"hash_b1dfabb180ed75b1", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "brMindCombatExpectedKillMaxOutput");
        setdynamicdvar(@"hash_5057e020d534d5ee", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "botTargetTypeIncludeAgent");
        setdynamicdvar(@"hash_484a3169a5caef10", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "damageRatioBotToBot");
        setdynamicdvar(@"hash_19b1deee03b39dce", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "damageRatioBotToBotWithHumanTeammate");
        setdynamicdvar(@"hash_72dce163d860183a", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "damageRatioBotToHumanFactorRecruit");
        setdynamicdvar(@"hash_27c78d2661500e49", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "damageRatioBotToHumanFactorRegular");
        setdynamicdvar(@"hash_1ab2939c54efab3f", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "damageRatioBotToHumanFactorHardened");
        setdynamicdvar(@"hash_3fe6928216982556", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "damageRatioBotToHumanFactorVeteran");
        setdynamicdvar(@"hash_9ee861df3ee7281c", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "damageRatioBotToHumanAddendRecruit");
        setdynamicdvar(@"hash_c6db8f289a513376", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "damageRatioBotToHumanAddendRegular");
        setdynamicdvar(@"hash_71720d5fda9ada04", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "damageRatioBotToHumanAddendHardened");
        setdynamicdvar(@"hash_d3f0c08b944e8c3b", var_fce3d6d6d9b8fa75);
        var_fce3d6d6d9b8fa75 = getmatchrulesdata("ftueBotsData", "damageRatioBotToHumanAddendVeteran");
        setdynamicdvar(@"hash_cc3a6aab020970df", var_fce3d6d6d9b8fa75);
    }
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1662
// Size: 0x10a
function spawned() {
    function_543a0a3113ff89f7();
    function_21b2d65575e9c0cc("Skydive");
    self.var_ab5f5270cb22e3c8 = 0;
    var_2eb0354a11a56b73 = isdefined(self.uibot) && isdefined(self.uibot.var_7dbb8165d792b06c);
    var_da17fcd71681c773 = isdefined(self.gulaguses) && self.gulaguses > 0;
    var_d2c758dfb50b7949 = !var_2eb0354a11a56b73 && !var_da17fcd71681c773 && !istrue(self.respawningfromtoken);
    if (var_d2c758dfb50b7949) {
        function_d9dcf5d9abdd5998();
    }
    self.var_a80ab26b5150a5ee = self botgetdifficulty();
    self botsetflag("allow_laststand_decision", 1);
    namespace_c50b30148766aa59::function_c827480e6d21a271();
    if (var_d2c758dfb50b7949 && !namespace_d576b6dc7cef9c62::function_1147bbc93ea9b83c()) {
        var_21e1f88e3b6c27bb = getmatchrulesdata("brData", "plunderStartAmount");
        var_d437bea518f94dd0 = getmatchrulesdata("brData", "plunderBotStartAmount");
        namespace_c6ccccd95254983f::playersetplundercount(var_d437bea518f94dd0);
    }
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1773
// Size: 0x40
function registerbrgametypefunc(name, func) {
    if (namespace_71073fa38f11492::isbrgametypefuncdefined(name)) {
        /#
            assertmsg("Bot BR function: (" + name + ") already registered");
        #/
    } else {
        namespace_71073fa38f11492::registerbrgametypefunc(name, func);
    }
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ba
// Size: 0x2f
function onspawnplayer() {
    val::function_8b5f9e0014775208();
    if (!isbot(self) && isplayer(self)) {
        vehicle_allowplayeruse(self, 1);
        thread namespace_27cc7cdc2e4475be::function_608ad5a3783431d9();
    }
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17f0
// Size: 0x1e
function function_98ba4f8e00e49831(player) {
    if (isbot(player)) {
        return namespace_95d8d8ec67e3e074::function_fb4771e79218146b(player);
    }
    return undefined;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1816
// Size: 0xed
function function_f4cd8d89e37b4888() {
    function_6acbb2af086c64fa();
    level waittill("br_prematchEnded");
    function_6acbb2af086c64fa();
    foreach (player in level.players) {
        if (isbot(player)) {
            player function_d9dcf5d9abdd5998();
        }
    }
    if (isdefined(level.var_7b37b2193f163b9b)) {
        foreach (uibot in level.var_7b37b2193f163b9b.var_156f390a5362bc55) {
            uibot.difficulty = function_f09bcfcfe853f63f();
        }
    }
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x190a
// Size: 0x9a
function function_d9dcf5d9abdd5998() {
    if (namespace_cd0b2d039510b38d::matchmakinggame()) {
        difficulty = function_f09bcfcfe853f63f();
    } else {
        difficulty = function_d55289ceec7cf934();
    }
    bot_set_difficulty(difficulty);
    function_8771893f1bcb49bb(self, difficulty);
    if (namespace_cd0b2d039510b38d::getsubgametype() == "rumble_mgl") {
        var_3dfe644341de1e18 = self botgetdifficultysetting("strafeWeaponMaxRangeMultiplier");
        self botsetdifficultysetting("strafeWeaponMaxRangeMultiplier", var_3dfe644341de1e18 + 0.5);
        var_2e222bbaea1f163a = self botgetdifficultysetting("strafeWeaponMinRangeMultiplier");
        self botsetdifficultysetting("strafeWeaponMinRangeMultiplier", var_2e222bbaea1f163a + 0.5);
    }
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19ab
// Size: 0x4b
function function_8771893f1bcb49bb(bot, difficulty) {
    var_7e2c53b0bcf117d9 = spawnstruct();
    var_7e2c53b0bcf117d9.bot = bot;
    var_7e2c53b0bcf117d9.difficulty = difficulty;
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_bot_set_difficulty", var_7e2c53b0bcf117d9);
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19fd
// Size: 0x97
function function_f09bcfcfe853f63f() {
    var_4084c1d43f28940f = randomfloat(1);
    var_4084c1d43f28940f = var_4084c1d43f28940f - level.var_9f9aee78f75f1519[0];
    if (var_4084c1d43f28940f <= 0) {
        return "recruit";
    }
    var_4084c1d43f28940f = var_4084c1d43f28940f - level.var_9f9aee78f75f1519[1];
    if (var_4084c1d43f28940f <= 0) {
        return "regular";
    }
    var_4084c1d43f28940f = var_4084c1d43f28940f - level.var_9f9aee78f75f1519[2];
    if (var_4084c1d43f28940f <= 0) {
        return "hardened";
    }
    var_4084c1d43f28940f = var_4084c1d43f28940f - level.var_9f9aee78f75f1519[3];
    if (var_4084c1d43f28940f <= 0) {
        return "veteran";
    }
    /#
        assertmsg("GetBotRandomDifficultyFromHumanPerformance(): invalid difficulty, fallback to regular difficulty.");
    #/
    return "regular";
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a9c
// Size: 0x77
function function_6acbb2af086c64fa() {
    var_3d1db28cd6cdd65e = function_de4dbfc4bf8e46b7();
    var_22ba435fe8f3e8f6 = function_9467e76f2bdbd0eb(var_3d1db28cd6cdd65e);
    var_f8793c23a0ec47ab = var_22ba435fe8f3e8f6[0] + var_22ba435fe8f3e8f6[1] + var_22ba435fe8f3e8f6[2] + var_22ba435fe8f3e8f6[3];
    var_22ba435fe8f3e8f6[0] = var_22ba435fe8f3e8f6[0] / var_f8793c23a0ec47ab;
    var_22ba435fe8f3e8f6[1] = var_22ba435fe8f3e8f6[1] / var_f8793c23a0ec47ab;
    var_22ba435fe8f3e8f6[2] = var_22ba435fe8f3e8f6[2] / var_f8793c23a0ec47ab;
    var_22ba435fe8f3e8f6[3] = var_22ba435fe8f3e8f6[3] / var_f8793c23a0ec47ab;
    level.var_9f9aee78f75f1519 = var_22ba435fe8f3e8f6;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b1a
// Size: 0xba
function function_de4dbfc4bf8e46b7() {
    var_786f842d5771cdb6 = function_538e92208b641725();
    var_3a8bf6b9f6916e85 = [];
    foreach (var_e72dfdb2a9343f1b in var_786f842d5771cdb6) {
        if (!var_e72dfdb2a9343f1b.isai && isdefined(var_e72dfdb2a9343f1b.performance)) {
            var_3a8bf6b9f6916e85[var_3a8bf6b9f6916e85.size] = var_e72dfdb2a9343f1b.performance;
        }
    }
    /#
        assert(var_3a8bf6b9f6916e85.size > 0);
    #/
    var_3a8bf6b9f6916e85 = array_sort_with_func(var_3a8bf6b9f6916e85, &function_b0b032b5db8cdd66);
    return var_3a8bf6b9f6916e85[int(var_3a8bf6b9f6916e85.size / 2)];
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bdc
// Size: 0x17
function function_b0b032b5db8cdd66(value1, value2) {
    return value1 < value2;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bfb
// Size: 0xda
function function_9467e76f2bdbd0eb(performancevalue) {
    /#
        assert(performancevalue <= 1000 && performancevalue >= -1000);
    #/
    performancevalue = performancevalue / 1000;
    var_60ca8d97eb9cab53 = function_6c4f073450168827();
    var_685c40e8fbd9e877 = -1;
    var_e4fe8da17613f261 = -1;
    for (index = 0; index < var_60ca8d97eb9cab53.size; index++) {
        maxrange = var_60ca8d97eb9cab53[index][0];
        if (performancevalue >= var_685c40e8fbd9e877 && performancevalue <= maxrange) {
            var_e4fe8da17613f261 = index;
            break;
        }
        var_685c40e8fbd9e877 = maxrange;
    }
    if (var_e4fe8da17613f261 < 0) {
        /#
            assertmsg("GetBotDifficultyProportion(): Invalid ReturnIndex returned.");
        #/
        var_e4fe8da17613f261 = var_60ca8d97eb9cab53.size - 1;
    }
    return [0:var_60ca8d97eb9cab53[var_e4fe8da17613f261][1], 1:var_60ca8d97eb9cab53[var_e4fe8da17613f261][2], 2:var_60ca8d97eb9cab53[var_e4fe8da17613f261][3], 3:var_60ca8d97eb9cab53[var_e4fe8da17613f261][4]];
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cdd
// Size: 0x189
function function_6c4f073450168827() {
    rowcount = getdvarint(@"hash_8b89c88ebbde4299");
    if (rowcount <= 0) {
        return function_b5b189c89f00beb8("The value of config dvar 'scr_skill_based_bot_difficulties_config_count' is invalid.");
    }
    var_60ca8d97eb9cab53 = [];
    var_e6706c52d7fd2baf = -1;
    for (index = 1; index <= rowcount; index++) {
        dvar = function_2ef675c13ca1c4af(@"hash_31f8565b191b4452", index);
        var_929a919f782b1c96 = getdvar(dvar);
        if (var_929a919f782b1c96 == "") {
            return function_b5b189c89f00beb8("The config dvar 'scr_skill_based_bot_difficulties_config_" + index + "' is empty.");
        }
        columns = [];
        values = strtok(var_929a919f782b1c96, ",");
        foreach (value in values) {
            columns[columns.size] = float(value);
        }
        if (columns.size != 5) {
            return function_b5b189c89f00beb8("The columns count of the dvar 'scr_skill_based_bot_difficulties_config_" + index + "' is not valid.");
        }
        if (columns[0] <= var_e6706c52d7fd2baf || columns[0] > 1) {
            return function_b5b189c89f00beb8("The performance max range is not valid in the dvar 'scr_skill_based_bot_difficulties_config_" + index + "' .");
        }
        var_e6706c52d7fd2baf = columns[0];
        var_60ca8d97eb9cab53[var_60ca8d97eb9cab53.size] = columns;
    }
    if (var_e6706c52d7fd2baf != 1) {
        var_60ca8d97eb9cab53[var_60ca8d97eb9cab53.size - 1][0] = 1;
    }
    return var_60ca8d97eb9cab53;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e6e
// Size: 0x111
function function_b5b189c89f00beb8(errormsg) {
    /#
        assertmsg(errormsg);
    #/
    return [0:[0:-0.2, 1:10, 2:0, 3:0, 4:0], 1:[0:-0.15, 1:7, 2:3, 3:0, 4:0], 2:[0:0, 1:5, 2:3, 3:2, 4:0], 3:[0:0.3, 1:3, 2:3, 3:3, 4:1], 4:[0:0.8, 1:1, 2:3, 3:3, 4:3], 5:[0:0.9, 1:0, 2:1, 3:1, 4:8], 6:[0:1, 1:0, 2:0, 3:1, 4:9]];
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f87
// Size: 0x8d
function function_92a85a0dda6ca085(damagedata) {
    var_dfabe685a74f1b33 = isdefined(damagedata.victim) && isbot(damagedata.victim) && damagedata.victim namespace_c50b30148766aa59::function_6f6c5cb39cd095b0();
    modifieddamage = namespace_41f4dfb71dd08362::function_d111733407f6518(damagedata.meansofdeath, damagedata.victim, damagedata.attacker, damagedata.damage, 1, var_dfabe685a74f1b33);
    return modifieddamage;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x201c
// Size: 0x104
function function_a12de8d6fa23a4d9() {
    if (namespace_d576b6dc7cef9c62::function_1147bbc93ea9b83c()) {
        return undefined;
    }
    if (!istrue(level.var_c61af0e49678f2ba)) {
        level.var_c61af0e49678f2ba = 1;
        var_3d1db28cd6cdd65e = undefined;
        if (namespace_cd0b2d039510b38d::matchmakinggame()) {
            var_3d1db28cd6cdd65e = function_de4dbfc4bf8e46b7();
        } else {
            var_3d1db28cd6cdd65e = getdvarfloat(@"hash_502ea1a19a22a22f", 0);
        }
        level.var_935fc4498c2f463d = clamp(var_3d1db28cd6cdd65e / 1000, -1, 1);
        level.var_6916d2bb0277da6e = function_ac985998f660d63d();
    }
    if (!isdefined(level.var_6916d2bb0277da6e) || level.var_6916d2bb0277da6e.size < 1) {
        return undefined;
    }
    rowindex = level.var_6916d2bb0277da6e.size - 1;
    for (index = 0; index < level.var_6916d2bb0277da6e.size; index++) {
        if (level.var_935fc4498c2f463d <= level.var_6916d2bb0277da6e[index][0]) {
            rowindex = index;
            break;
        }
    }
    return level.var_6916d2bb0277da6e[rowindex];
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2128
// Size: 0x109
function function_ac985998f660d63d() {
    rowcount = getdvarint(@"hash_eff52385b9663477");
    if (rowcount <= 0) {
        /#
            assertmsg("The value of config dvar 'scr_skill_based_damage_ratio_bot_to_human_config_count' is invalid.");
        #/
        return [];
    }
    var_a95a701fc50363c9 = [];
    for (index = 1; index <= rowcount; index++) {
        dvar = function_2ef675c13ca1c4af(@"hash_9e9368fde1b1a498", index);
        var_929a919f782b1c96 = getdvar(dvar);
        if (var_929a919f782b1c96 == "") {
            /#
                assertmsg("The config dvar 'scr_skill_based_damage_ratio_bot_to_human_config_" + index + "' is empty.");
            #/
            return [];
        }
        values = strtok(var_929a919f782b1c96, ",");
        if (values.size != 3) {
            /#
                assertmsg("The columns count of the dvar 'scr_skill_based_damage_ratio_bot_to_human_config_" + index + "' is not valid.");
            #/
            return [];
        }
        var_a95a701fc50363c9[var_a95a701fc50363c9.size] = (float(values[0]), float(values[1]), float(values[2]));
    }
    var_a95a701fc50363c9 = array_sort_with_func(var_a95a701fc50363c9, &function_41ee7f6310c3975a);
    return var_a95a701fc50363c9;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2239
// Size: 0x1b
function function_41ee7f6310c3975a(var_472d4f042b732e8a, var_cb730d03142c3f30) {
    return var_472d4f042b732e8a[0] < var_cb730d03142c3f30[0];
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x225c
// Size: 0x298
function function_f7453e13040e1140() {
    self.var_deb55e4a0429ef1 = 1;
    self.var_38df06a438df2608 = undefined;
    self notify("bot_br_super_think");
    self endon("bot_br_super_think");
    self endon("bot_suspended");
    self endon("death_or_disconnect");
    level endon("game_ended");
    namespace_c50b30148766aa59::function_83574001589fb42d();
    if (namespace_d576b6dc7cef9c62::function_1147bbc93ea9b83c()) {
        if (namespace_95d8d8ec67e3e074::function_64432af189b8a177(1, 0)) {
            return;
        }
    } else if (istrue(level.skipprematch) && !istrue(level.br_infils_disabled)) {
        if (namespace_95d8d8ec67e3e074::function_64432af189b8a177(2, 0)) {
            return;
        }
    }
    childthread function_3b14fd3847fb5fe6();
    childthread function_290494c263cb346d();
    childthread function_b4b715fd038025c6();
    while (1) {
        /#
            if (getdvarint(@"hash_c2de8ca6dc8512c1") || self.sessionstate == "brBotPrematchActivePlayerMaxCount") {
                wait(0.05);
                continue;
            }
        #/
        if (namespace_95d8d8ec67e3e074::function_6ecc7cd453466014()) {
            wait(0.05);
            continue;
        }
        if (!namespace_d3d40f75bb4e4c32::function_55b494a07469298a()) {
            if (infilthink()) {
                continue;
            }
        }
        if (namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
            namespace_2913f85acadc353f::function_88039a31ef9e74dd();
            wait(1);
        }
        if (isdefined(level.br_circle) && isnavmeshloaded() && !bot_is_remote_or_linked()) {
            var_a4273e17f90bfbe6 = function_9230bcb84b43d245();
            var_7e5c62f21600a060 = namespace_d576b6dc7cef9c62::function_1147bbc93ea9b83c();
            switch (var_a4273e17f90bfbe6) {
            case #"hash_b276405783bce7ac":
                if (self isskydiving() && (istrue(self.jumped) || var_7e5c62f21600a060)) {
                    self botsetflag("disable_all_ai", 0);
                    self botclearscriptgoal();
                    if (function_ded80385ea7471db(self.var_69652181699375d4) && !var_7e5c62f21600a060 && !istrue(self.infil_complete)) {
                        function_19b63d254615307();
                    }
                    if (!isdefined(self.var_38df06a438df2608)) {
                        function_85686f0d8a5667da(var_7e5c62f21600a060);
                    }
                    parachute(var_7e5c62f21600a060);
                    if (var_7e5c62f21600a060 && !namespace_d576b6dc7cef9c62::function_1147bbc93ea9b83c()) {
                        function_1e8fe34f5dfdea49("Skydive");
                    } else {
                        function_1e8fe34f5dfdea49("Combat");
                    }
                } else if (self isonground()) {
                    function_1e8fe34f5dfdea49("Combat");
                }
                break;
            case #"hash_f4773cddc9292f61":
                val::set("brBotCombat", "vehicle_use", 0);
                function_84930089af3d03b(var_7e5c62f21600a060);
                if (var_7e5c62f21600a060 && !namespace_d576b6dc7cef9c62::function_1147bbc93ea9b83c()) {
                    namespace_56b9cc3deb6e3f5e::function_cd40e795b7776f14();
                    function_1e8fe34f5dfdea49("Skydive");
                }
                break;
            default:
                /#
                    assertex(0, "The bot's next status is " + var_a4273e17f90bfbe6 + " but we have no logic for it.");
                #/
                break;
            }
        }
        wait(0.05);
    }
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24fb
// Size: 0x2e
function infilthink() {
    if (!istrue(self.jumped)) {
        function_1a64cf8eb4b49c7e(1);
        if (function_15217dc6e3e6ac8e()) {
            return 1;
        }
    }
    function_1a64cf8eb4b49c7e(0);
    return 0;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2531
// Size: 0xc1
function function_15217dc6e3e6ac8e() {
    if (getdvarint(@"hash_5270e4999186a160", 0) == 1) {
        function_6eeca72e3e1f4be8();
        return 0;
    }
    if (isdefined(level.br_c130spawndone) && !level.br_c130spawndone) {
        if (istrue(level.c130inbounds) && isdefined(self.br_infil_type)) {
            if (!isdefined(self.var_69652181699375d4) && !namespace_d576b6dc7cef9c62::function_1147bbc93ea9b83c() && !istrue(self.infil_complete)) {
                self.var_69652181699375d4 = function_56a8312d296b291a();
            }
            if (function_ded80385ea7471db(self.var_69652181699375d4)) {
                function_bd52989c7fd9eaa5();
            } else {
                function_88b1bc0a1f68a014();
            }
            function_6eeca72e3e1f4be8();
            return 0;
        }
        wait(0.05);
        return 1;
    }
    return 0;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25fa
// Size: 0x48
function function_6eeca72e3e1f4be8() {
    self.gulaguses = ter_op(getdvarint(@"hash_3ff738f6200e3a65", 1) != 0, 0, 1);
    self.jumped = 1;
    while (isdefined(self.br_infil_type)) {
        wait(0.05);
    }
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2649
// Size: 0x36
function function_1a64cf8eb4b49c7e(suspend) {
    if (suspend) {
        self botclearscriptgoal();
        function_2c2b5b435027f895(undefined);
    }
    self.ignoreall = suspend;
    self botsetflag("suspended", suspend);
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2686
// Size: 0xe4
function function_56a8312d296b291a() {
    if (!function_6dd2dfeb41384764()) {
        return undefined;
    }
    squadleader = namespace_ca7b90256548aa40::getsquadleader(self.team, self.var_ff97225579de16a);
    if (function_40034c2faf09a87b(squadleader) && !istrue(squadleader.jumped)) {
        return squadleader;
    }
    teammates = namespace_54d20dd0dd79277f::getteamdata(self.team, "players");
    foreach (player in teammates) {
        if (player == self || isdefined(squadleader) && player == squadleader) {
            continue;
        }
        if (function_40034c2faf09a87b(player) && !istrue(player.jumped)) {
            return player;
        }
    }
    return undefined;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2772
// Size: 0xa7
function function_bd52989c7fd9eaa5() {
    /#
        assert(function_ded80385ea7471db(self.var_69652181699375d4));
    #/
    self endon("br_jump");
    msg = self.var_69652181699375d4 waittill_any_in_array_return([0:"br_jump", 1:"death_or_disconnect"]);
    if (isdefined(msg) && msg == "br_jump") {
        var_d17925e505d5039d = 500;
        var_cdb1d6030cfea6b = 3000;
        var_ccb34012fba88c34 = randomintrange(var_d17925e505d5039d, var_cdb1d6030cfea6b);
        wait(var_ccb34012fba88c34 * 0.001);
        self notify("halo_jump_solo_c130");
    } else {
        function_88b1bc0a1f68a014();
    }
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2820
// Size: 0x57
function function_88b1bc0a1f68a014() {
    self.var_281aa410a3a5e229 = function_b7799ae6d79c86c9();
    function_85686f0d8a5667da(namespace_d576b6dc7cef9c62::function_1147bbc93ea9b83c());
    var_c2e1d99c4cb9d658 = function_2e7e3e8a96b8690c(self.var_38df06a438df2608);
    wait(var_c2e1d99c4cb9d658);
    if (namespace_d3d40f75bb4e4c32::isplayerbrsquadleader()) {
        self notify("halo_jump_c130");
    } else {
        self notify("halo_jump_solo_c130");
    }
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x287e
// Size: 0xd3
function function_85686f0d8a5667da(var_7e5c62f21600a060) {
    var_221fa3ac27e4925e = undefined;
    if (function_ded80385ea7471db(self.var_6601ccd8ec4b0356)) {
        var_221fa3ac27e4925e = self.var_6601ccd8ec4b0356.origin;
        self.var_281aa410a3a5e229 = function_89b90eaac28334c7(var_221fa3ac27e4925e);
    } else if (!isdefined(self.var_281aa410a3a5e229)) {
        if (var_7e5c62f21600a060) {
            self.var_281aa410a3a5e229 = function_3023eeef223a5594();
        } else {
            self.var_281aa410a3a5e229 = function_e39354ebeca71c56();
        }
    }
    self.var_38df06a438df2608 = function_9816d841f0f205e2(var_7e5c62f21600a060, var_221fa3ac27e4925e);
    var_518bd7ffa76f3234 = 30;
    self.var_38df06a438df2608 = self.var_38df06a438df2608 + randomvector(var_518bd7ffa76f3234);
    if (isdefined(self.var_6601ccd8ec4b0356)) {
        self.var_6601ccd8ec4b0356 = undefined;
    }
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2958
// Size: 0x16
function function_3b14fd3847fb5fe6() {
    self endon("bot_suspended");
    ammo_manager(&function_da84567cda38847e);
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2975
// Size: 0x54
function function_290494c263cb346d() {
    while (1) {
        msg = waittill_any_in_array_return([0:"last_stand_start", 1:"last_stand_finished"]);
        self botsetflag("ignore_script_weapon", msg == "last_stand_finished");
        if (msg == "last_stand_start") {
            function_2c2b5b435027f895(undefined);
        }
    }
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29d0
// Size: 0x73
function function_b4b715fd038025c6() {
    if (isdefined(self.var_a80ab26b5150a5ee)) {
        if (self.var_a80ab26b5150a5ee != self botgetdifficulty()) {
            namespace_56b9cc3deb6e3f5e::function_b4c45ed36fa851d5();
        }
        self.var_a80ab26b5150a5ee = undefined;
    }
    while (1) {
        var_c31923566c85f07 = self botgetdifficulty();
        self waittill("bot_difficulty_updated");
        var_21ec7a51a6627b28 = self botgetdifficulty();
        if (var_21ec7a51a6627b28 != var_c31923566c85f07) {
            namespace_56b9cc3deb6e3f5e::function_b4c45ed36fa851d5();
        }
    }
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a4a
// Size: 0x36b
function function_9816d841f0f205e2(var_7bf0ba85ec52e893, closestpoint) {
    if (isdefined(level.br_circle) && isnavmeshloaded()) {
        var_f3fcf5af579acd60 = undefined;
        zoneindex = self.var_281aa410a3a5e229;
        if (isdefined(level.var_dbcb33d81f7d48d) && isdefined(zoneindex) && isdefined(level.var_dbcb33d81f7d48d.zones[zoneindex]) && isdefined(level.var_dbcb33d81f7d48d.zones[zoneindex].var_301d639da97100c9)) {
            if (var_7bf0ba85ec52e893) {
                var_301d639da97100c9 = level.var_dbcb33d81f7d48d.zones[zoneindex].var_301d639da97100c9;
            } else {
                var_301d639da97100c9 = function_1c7137099a813ae1(level.var_dbcb33d81f7d48d.zones[zoneindex].var_301d639da97100c9);
            }
            var_58c7087bbb70385c = [];
            if (var_301d639da97100c9.size == 0) {
                level.var_dbcb33d81f7d48d.zones[zoneindex].var_bd664214823fbf8d = 1;
                foreach (index, zone in level.var_dbcb33d81f7d48d.zones) {
                    if (index != zoneindex && !istrue(zone.var_bd664214823fbf8d)) {
                        var_58c7087bbb70385c[var_58c7087bbb70385c.size] = index;
                    }
                }
            }
            while (var_301d639da97100c9.size == 0 && var_58c7087bbb70385c.size > 0) {
                zoneindex = random(var_58c7087bbb70385c);
                zone = level.var_dbcb33d81f7d48d.zones[zoneindex];
                var_301d639da97100c9 = function_1c7137099a813ae1(zone.var_301d639da97100c9);
                if (var_301d639da97100c9.size == 0) {
                    zone.var_bd664214823fbf8d = 1;
                    var_58c7087bbb70385c = array_remove(var_58c7087bbb70385c, zoneindex);
                }
            }
            if (zoneindex != self.var_281aa410a3a5e229) {
                self.var_281aa410a3a5e229 = zoneindex;
            }
            /#
                if (var_301d639da97100c9.size == 0) {
                    println("brMindCombatExpectedKillMaxInput");
                }
            #/
            if (isdefined(closestpoint)) {
                mindistancesq = undefined;
                foreach (spot in var_301d639da97100c9) {
                    distancesq = distancesquared(spot.origin, closestpoint);
                    if (!isdefined(mindistancesq) || mindistancesq > distancesq) {
                        var_f3fcf5af579acd60 = spot;
                        mindistancesq = distancesq;
                    }
                }
            } else {
                var_f3fcf5af579acd60 = random(var_301d639da97100c9);
            }
        }
        if (isdefined(var_f3fcf5af579acd60)) {
            randompoint = var_f3fcf5af579acd60.origin;
        } else {
            /#
                if (isdefined(zoneindex) && isdefined(level.var_dbcb33d81f7d48d.zones[zoneindex])) {
                    println("ignore_script_weapon" + level.var_dbcb33d81f7d48d.zones[zoneindex].name + "spawned_bots");
                } else {
                    println("<unknown string>");
                }
            #/
            randompoint = function_61e3c952715399e0();
        }
        return function_f8350ab882cc2439(randompoint);
    }
    return undefined;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dbd
// Size: 0x78
function function_1c7137099a813ae1(var_d845b94e50a75d37) {
    var_174345e983092e85 = [];
    foreach (spot in var_d845b94e50a75d37) {
        if (function_bcb0778bb33e86de(spot.origin)) {
            var_174345e983092e85[var_174345e983092e85.size] = spot;
        }
    }
    return var_174345e983092e85;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e3d
// Size: 0xb5
function function_89b90eaac28334c7(origin) {
    var_73a56d219e2f275a = undefined;
    if (isdefined(level.var_dbcb33d81f7d48d)) {
        closestdistsq = undefined;
        foreach (zoneindex, zone in level.var_dbcb33d81f7d48d.zones) {
            distsq = distancesquared(origin, function_774e0b129d4d22b8(zoneindex));
            if (!isdefined(closestdistsq) || closestdistsq > distsq) {
                closestdistsq = distsq;
                var_73a56d219e2f275a = zoneindex;
            }
        }
    }
    return var_73a56d219e2f275a;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2efa
// Size: 0x1e1
function function_2e7e3e8a96b8690c(targetpos) {
    if (!isdefined(targetpos)) {
        return function_a4091ef2be7e55b0();
    }
    plane = level.br_ac130;
    startpos = plane.pathstruct.startptui;
    endpos = plane.pathstruct.endptui;
    pathdir = plane.pathstruct.pathdir;
    var_2872eacf6d85a1f5 = plane.origin;
    startpos = (startpos[0], startpos[1], var_2872eacf6d85a1f5[2]);
    endpos = (endpos[0], endpos[1], var_2872eacf6d85a1f5[2]);
    var_197025dbf2c26cc2 = targetpos - vectorfromlinetopoint(startpos, endpos, targetpos);
    var_b7070691fd070bc9 = length(var_197025dbf2c26cc2 - targetpos) / tan(75);
    var_9f418d46ed639267 = var_197025dbf2c26cc2 - pathdir * var_b7070691fd070bc9;
    var_b6c3c93e7fbd38f8 = var_197025dbf2c26cc2 + pathdir * var_b7070691fd070bc9;
    var_e5b79916651603b4 = vectordot(startpos - var_2872eacf6d85a1f5, pathdir);
    var_7b9ffa2027e95f7b = vectordot(endpos - var_2872eacf6d85a1f5, pathdir);
    var_29e91993665650d2 = vectordot(var_9f418d46ed639267 - var_2872eacf6d85a1f5, pathdir);
    var_208bbcaa2d81395f = vectordot(var_b6c3c93e7fbd38f8 - var_2872eacf6d85a1f5, pathdir);
    if (var_208bbcaa2d81395f <= var_e5b79916651603b4) {
        var_4f120df4104fc38a = max(var_e5b79916651603b4, 0);
    } else if (var_29e91993665650d2 >= var_7b9ffa2027e95f7b) {
        var_4f120df4104fc38a = max(var_7b9ffa2027e95f7b, 0);
    } else {
        var_208bbcaa2d81395f = min(var_208bbcaa2d81395f, var_7b9ffa2027e95f7b);
        if (var_208bbcaa2d81395f <= 0) {
            return 0;
        }
        var_29e91993665650d2 = max(max(var_29e91993665650d2, var_e5b79916651603b4), 0);
        var_4f120df4104fc38a = randomfloatrange(var_29e91993665650d2, var_208bbcaa2d81395f);
    }
    var_c2e1d99c4cb9d658 = var_4f120df4104fc38a / namespace_ad389306d44fc6b4::getc130speed();
    return var_c2e1d99c4cb9d658;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30e3
// Size: 0xd1
function function_774e0b129d4d22b8(zoneindex) {
    if (!isdefined(level.var_dbcb33d81f7d48d) || !isdefined(zoneindex) || !isdefined(level.var_dbcb33d81f7d48d.zones[zoneindex])) {
        return undefined;
    }
    zone = level.var_dbcb33d81f7d48d.zones[zoneindex];
    var_26910ae9f2257df0 = zone.var_26910ae9f2257df0;
    if (!isdefined(var_26910ae9f2257df0)) {
        if (zone.var_301d639da97100c9.size > 0) {
            var_26910ae9f2257df0 = zone.var_301d639da97100c9[0].origin;
        }
    }
    if (!isdefined(var_26910ae9f2257df0)) {
        if (zone.var_5b8d15b94e3cd0.size > 0) {
            var_26910ae9f2257df0 = zone.var_5b8d15b94e3cd0[0].origin;
        }
    }
    return var_26910ae9f2257df0;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31bc
// Size: 0xad
function function_b7799ae6d79c86c9() {
    if (namespace_ca7b90256548aa40::issquadmode()) {
        squad = level.squaddata[self.team][self.var_ff97225579de16a];
        zoneindex = squad.var_21c2f79e8bfa9162;
        if (isdefined(zoneindex)) {
            /#
                println("<unknown string>", "<unknown string>", self.team, "<unknown string>", self.var_ff97225579de16a, "<unknown string>", self.name, "<unknown string>", zoneindex);
            #/
        } else {
            zoneindex = function_e39354ebeca71c56();
            squad.var_21c2f79e8bfa9162 = zoneindex;
        }
        return zoneindex;
    }
    return function_e39354ebeca71c56();
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3271
// Size: 0x36
function function_3023eeef223a5594() {
    if (isdefined(level.prematchspawnorigins) && level.prematchspawnorigins.size > 0) {
        return function_89b90eaac28334c7(self.origin);
    }
    return function_e39354ebeca71c56();
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32af
// Size: 0x1b6
function function_e39354ebeca71c56() {
    if (isdefined(level.var_dbcb33d81f7d48d) && level.var_dbcb33d81f7d48d.var_f51f037fb790e57c > 0) {
        /#
            var_5bf6352b53e5acd1 = getdvar(@"hash_a2fdccd1d3ae6e9e", "<unknown string>");
            if (var_5bf6352b53e5acd1 != "<unknown string>") {
                foreach (index, zone in level.var_dbcb33d81f7d48d.zones) {
                    if (zone.name == var_5bf6352b53e5acd1) {
                        return index;
                    }
                }
            }
        #/
        result = randomint(level.var_dbcb33d81f7d48d.var_f51f037fb790e57c);
        left = 0;
        right = level.var_dbcb33d81f7d48d.zones.size - 1;
        while (left <= right) {
            pivot = left + int((right - left) / 2);
            if (pivot == 0) {
                rangemin = 0;
            } else {
                rangemin = level.var_dbcb33d81f7d48d.zones[pivot - 1].var_68e87685aa19da24;
            }
            rangemax = level.var_dbcb33d81f7d48d.zones[pivot].var_68e87685aa19da24;
            if (result < rangemin) {
                right = pivot - 1;
            } else if (result >= rangemax) {
                left = pivot + 1;
            } else {
                return pivot;
            }
        }
    }
    return undefined;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x346d
// Size: 0x276
function function_19b63d254615307() {
    /#
        assert(function_ded80385ea7471db(self.var_69652181699375d4));
    #/
    self.var_69652181699375d4 endon("death_or_disconnect");
    self.ignoreall = 1;
    function_142b713a2846f9ac("Parachuting - Following");
    var_82b713438181c528 = 3000;
    var_8d8b1541818e49bc = 1000;
    var_db0e9f8bcd027630 = 500;
    var_f68b4c88fdd8234e = 1;
    var_696ba03dd97c3224 = 1;
    while (self isskydiving()) {
        var_d459f6d98bfb8aad = function_82dc476c43087820();
        if (var_d459f6d98bfb8aad < var_82b713438181c528) {
            self.var_6601ccd8ec4b0356 = self;
            break;
        }
        if (!self.var_69652181699375d4 isskydiving()) {
            self.var_6601ccd8ec4b0356 = self.var_69652181699375d4;
            break;
        }
        deltaheight = self.origin[2] - self.var_69652181699375d4.origin[2];
        if (self isparachuting()) {
            if (deltaheight > var_8d8b1541818e49bc) {
                self botpressbutton("cut_chute");
            }
        } else if (deltaheight <= 0 || deltaheight <= var_8d8b1541818e49bc && self.var_69652181699375d4 isparachuting()) {
            self botpressbutton("jump");
        }
        var_3840f75fd5fc4336 = distance2d(self.origin, self.var_69652181699375d4.origin);
        if (var_3840f75fd5fc4336 <= var_db0e9f8bcd027630) {
            var_56aff2cb796714dd = anglestoforward(self.var_69652181699375d4.angles);
            self botlookatpoint(self.origin + var_56aff2cb796714dd * 1000, var_f68b4c88fdd8234e, "script_forced");
            var_3e1f9c45395e389f = self.var_69652181699375d4 getvelocity();
            velocity = self getvelocity();
            var_f0d4f34e58368f52 = var_3e1f9c45395e389f - velocity;
            var_b2bee1aed960f257 = vectortoangles(vectornormalize(var_f0d4f34e58368f52));
            self botsetscriptmove(var_b2bee1aed960f257[1], var_f68b4c88fdd8234e, var_696ba03dd97c3224);
        } else {
            function_c43469e7a5ae4ba4(self.var_69652181699375d4.origin, var_f68b4c88fdd8234e);
            var_b2bee1aed960f257 = bot_get_angles_to_goal(self, self.var_69652181699375d4.origin);
            self botsetscriptmove(var_b2bee1aed960f257[1], var_f68b4c88fdd8234e, var_696ba03dd97c3224);
        }
        wait(var_f68b4c88fdd8234e);
    }
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36ea
// Size: 0x342
function parachute(var_7bf0ba85ec52e893) {
    if (var_7bf0ba85ec52e893) {
        level endon("prematch_over");
    }
    self.ignoreall = 1;
    /#
        if (getdvarint(@"hash_ba0d232bde107bad") > 0) {
            thread function_fd1265363788e726();
        }
    #/
    var_c4672d91a23583fb = 1200;
    var_c4442391a20f2645 = 3000;
    var_15f70b9b7e9402e3 = randomfloatrange(var_c4672d91a23583fb, var_c4442391a20f2645);
    var_9cd127607fba42b1 = 0;
    var_6ec7d15ca86b6b0a = 0;
    lastposition = undefined;
    var_b012001b3448e7c7 = undefined;
    stuck = 0;
    self.var_18b21e1e1191bcea = 2147483647;
    self.var_b7c77afce58bcac6 = 0;
    function_142b713a2846f9ac("Parachuting");
    while (self isskydiving()) {
        function_d0539e08120fcb08();
        var_b2bee1aed960f257 = bot_get_angles_to_goal(self, self.var_38df06a438df2608);
        speed = 1;
        var_26555d95dc188e56 = self.var_38df06a438df2608 - self geteye();
        if (var_26555d95dc188e56[2] > 0 && !function_41a2827fb8521c44(var_26555d95dc188e56)) {
            self.var_38df06a438df2608 = self.origin - (0, 0, 100);
        }
        function_c43469e7a5ae4ba4(self.var_38df06a438df2608, 0.05);
        self botsetscriptmove(var_b2bee1aed960f257[1], 0.05, speed);
        curtime = gettime();
        var_d459f6d98bfb8aad = function_82dc476c43087820();
        if (var_d459f6d98bfb8aad <= var_15f70b9b7e9402e3 && var_9cd127607fba42b1 <= 0) {
            self botpressbutton("jump");
            var_9cd127607fba42b1 = curtime;
            self.var_18b21e1e1191bcea = curtime;
        }
        if (var_9cd127607fba42b1 <= 0 && self isparachuting()) {
            var_9cd127607fba42b1 = curtime;
            self.var_18b21e1e1191bcea = curtime;
        }
        if (!var_6ec7d15ca86b6b0a && var_9cd127607fba42b1 > 0 && var_26555d95dc188e56[2] < 0 && curtime - var_9cd127607fba42b1 > 1000) {
            var_6ec7d15ca86b6b0a = function_ac55a70c78ec6aa5();
        }
        if (var_9cd127607fba42b1 > 0 && self function_3c6bb30ae7106b7a()) {
            function_4473b5af345c0b75(var_d459f6d98bfb8aad);
        }
        if (isdefined(lastposition) && distancesquared(self.origin, lastposition) > 10) {
            var_b012001b3448e7c7 = curtime;
        }
        lastposition = self.origin;
        if (isdefined(var_b012001b3448e7c7) && curtime - var_b012001b3448e7c7 > 1000) {
            stuck = 1;
            break;
        }
        wait(0.05);
    }
    if (!self.var_ab5f5270cb22e3c8 && !namespace_d576b6dc7cef9c62::function_1147bbc93ea9b83c()) {
        thread function_916e2512538553db();
    }
    self botlookatpoint(undefined);
    self.ignoreall = 0;
    var_4a564ebb47167dc9 = 0;
    if (!var_7bf0ba85ec52e893 && !istrue(self.infil_complete)) {
        self.var_281aa410a3a5e229 = undefined;
        self.infil_complete = 1;
        if (stuck) {
            var_1a645e724209ac4a = 3;
        } else {
            var_1a645e724209ac4a = 0;
        }
        var_487d2cc72334743d = namespace_95d8d8ec67e3e074::function_64432af189b8a177(var_1a645e724209ac4a, 1);
        if (var_487d2cc72334743d) {
            if (var_1a645e724209ac4a == 0) {
                return;
            }
        } else if (stuck) {
            var_4a564ebb47167dc9 = 1;
        }
    }
    if (stuck) {
        while (self isskydiving()) {
            if (namespace_95d8d8ec67e3e074::function_64432af189b8a177(3, var_4a564ebb47167dc9)) {
                return;
            }
            wait(1);
        }
    }
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a33
// Size: 0x13c
function function_fd1265363788e726() {
    /#
        self endon("<unknown string>");
        level endon("<unknown string>");
        while (1) {
            if (isdefined(self.var_38df06a438df2608)) {
                var_12225bdacc8b6654 = (1, 0, 0);
                var_ef9d8bf7f4d7b604 = (0, 1, 0);
                var_b792c387402095b1 = (1, 1, 0);
                if (self isskydiving()) {
                    line(self.origin, self.var_38df06a438df2608, var_ef9d8bf7f4d7b604, 1, 0, 3);
                    circleorigin = namespace_c5622898120e827f::getsafecircleorigin();
                    circleradius = namespace_c5622898120e827f::getsafecircleradius();
                    var_fc62075a9f6e7cab = var_ef9d8bf7f4d7b604;
                    if (istrue(level.circleclosing)) {
                        var_fc62075a9f6e7cab = var_12225bdacc8b6654;
                    }
                    sphere(circleorigin, circleradius, var_fc62075a9f6e7cab, 0, 5);
                    sphere(self.var_38df06a438df2608, 128, var_fc62075a9f6e7cab, 0, 5);
                } else {
                    sphere(self.var_38df06a438df2608, 128, var_b792c387402095b1, 0, 5);
                }
                print3d(self.var_38df06a438df2608, self.name + "<unknown string>", var_b792c387402095b1, 1, 1, 5, 1);
            }
            wait(0.05);
        }
    #/
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b76
// Size: 0x2b
function function_c43469e7a5ae4ba4(targetpoint, seconds) {
    targetpoint = function_fc1a8616655393a5(targetpoint);
    self botlookatpoint(targetpoint, seconds, "script_forced");
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3ba8
// Size: 0xf5
function private function_fc1a8616655393a5(targetpoint) {
    if (!isdefined(targetpoint)) {
        return undefined;
    }
    if (function_79eb95c7588f2191(targetpoint)) {
        return targetpoint;
    }
    var_eefe5ec3aecf7fa3 = self geteye();
    var_c74535e72311f8b0 = targetpoint - var_eefe5ec3aecf7fa3;
    height = var_c74535e72311f8b0[2];
    /#
        assert(height > 0);
    #/
    if (height < 1) {
        return undefined;
    }
    var_7443f3542b52786a = length2dsquared(var_c74535e72311f8b0);
    if (var_7443f3542b52786a < 1) {
        var_4821e22d1e800bf1 = anglestoforward(self.angles);
    } else {
        var_4821e22d1e800bf1 = var_c74535e72311f8b0;
    }
    var_4821e22d1e800bf1 = vectornormalize((var_4821e22d1e800bf1[0], var_4821e22d1e800bf1[1], 0));
    var_d9a4e368b3862c16 = 0.46631;
    var_78ed320e488c3260 = height * var_d9a4e368b3862c16;
    var_9309d9ef2e527fff = var_78ed320e488c3260 * var_4821e22d1e800bf1;
    var_a7c61b8eea2709c3 = var_9309d9ef2e527fff + (0, 0, height);
    return var_eefe5ec3aecf7fa3 + var_a7c61b8eea2709c3;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ca5
// Size: 0x26
function function_79eb95c7588f2191(targetpoint) {
    var_c74535e72311f8b0 = targetpoint - self geteye();
    return function_41a2827fb8521c44(var_c74535e72311f8b0);
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cd3
// Size: 0x36
function function_41a2827fb8521c44(var_fdef162daf80093b) {
    var_c7086d1ad1cbd95d = 0.939693;
    return vectordot(vectornormalize(var_fdef162daf80093b), (0, 0, 1)) <= var_c7086d1ad1cbd95d;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d11
// Size: 0x2ce
function function_ac55a70c78ec6aa5() {
    var_26555d95dc188e56 = self.var_38df06a438df2608 - self.origin;
    velocity = self getvelocity();
    var_1a094e3a2254b084 = abs(var_26555d95dc188e56[2]);
    verticalspeed = abs(velocity[2]);
    if (verticalspeed > 50 && var_1a094e3a2254b084 > 200) {
        var_4cf0e4661298ed8a = var_1a094e3a2254b084 / verticalspeed;
        var_5c530f8b9afd0804 = length2d(velocity);
        var_3840f75fd5fc4336 = length2d(var_26555d95dc188e56);
        if (var_5c530f8b9afd0804 < 200) {
            var_5c530f8b9afd0804 = 700;
        }
        var_8105af709f0adc35 = var_3840f75fd5fc4336 / var_5c530f8b9afd0804;
        if (var_4cf0e4661298ed8a < var_8105af709f0adc35 && var_4cf0e4661298ed8a > 1 && var_3840f75fd5fc4336 > 0) {
            var_2127d880e420797f = var_5c530f8b9afd0804 * (var_4cf0e4661298ed8a - 1) / 2;
            /#
                if (getdvarint(@"hash_ba0d232bde107bad") > 0) {
                    println("<unknown string>" + self.entity_number + "<unknown string>" + "<unknown string>" + "<unknown string>" + self.var_38df06a438df2608[0] + "<unknown string>" + self.var_38df06a438df2608[1] + "<unknown string>" + self.var_38df06a438df2608[2] + "<unknown string>" + self.origin[0] + "<unknown string>" + self.origin[1] + "<unknown string>" + self.origin[2] + "<unknown string>" + var_4cf0e4661298ed8a + "<unknown string>" + var_8105af709f0adc35 + "<unknown string>" + var_2127d880e420797f);
                }
            #/
            var_365b4b90d1e6a26c = function_30ddbfd5e5e2a771(self.origin, velocity, self.var_38df06a438df2608, var_2127d880e420797f, 1, 200, 700);
            if (isdefined(var_365b4b90d1e6a26c)) {
                self.var_38df06a438df2608 = var_365b4b90d1e6a26c;
                /#
                    if (getdvarint(@"hash_ba0d232bde107bad") > 0) {
                        sphere(var_365b4b90d1e6a26c, 128, (0, 1, 1), 0, 5000);
                        var_14efa638229efbd5 = "<unknown string>" + var_365b4b90d1e6a26c[0] + "<unknown string>" + var_365b4b90d1e6a26c[1] + "<unknown string>" + var_365b4b90d1e6a26c[2] + "<unknown string>";
                        print3d(var_365b4b90d1e6a26c, var_14efa638229efbd5, (0, 1, 1), 1, 1, 5000, 1);
                        line(self.origin, var_365b4b90d1e6a26c, (0, 1, 0), 1, 0, 5000);
                        pos = (var_365b4b90d1e6a26c[0], var_365b4b90d1e6a26c[1], self.origin[2]);
                        line(pos, var_365b4b90d1e6a26c, (0, 1, 0), 1, 0, 5000);
                    }
                #/
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fe7
// Size: 0x11
function function_d0539e08120fcb08() {
    function_f42d549e3be7e8a1();
    function_9dd97fd712f1f9de();
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fff
// Size: 0x4b
function function_f42d549e3be7e8a1() {
    if (level.br_circle.circleindex > 0 && istrue(level.circleclosing) && !function_bcb0778bb33e86de(self.var_38df06a438df2608)) {
        self.var_38df06a438df2608 = namespace_bc2665cbe6cf4e1f::function_61e3c952715399e0();
    }
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4051
// Size: 0x31
function function_9dd97fd712f1f9de() {
    newpos = function_44ae04156d124e2();
    if (isdefined(newpos)) {
        self.var_38df06a438df2608 = newpos;
        self.var_b7c77afce58bcac6 = 2147483647;
    }
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4089
// Size: 0x581
function function_44ae04156d124e2() {
    if (!isdefined(self.var_18b21e1e1191bcea) || gettime() < self.var_18b21e1e1191bcea) {
        return;
    }
    var_5a131f8f7a5add85 = 1000;
    self.var_18b21e1e1191bcea = gettime() + var_5a131f8f7a5add85;
    var_b57907e360347347 = 2400;
    var_94264830825789e8 = 2500;
    var_364d2e6c896f4667 = var_b57907e360347347 * 2;
    var_74005c948f0bef90 = var_b57907e360347347 * var_b57907e360347347;
    var_23788b3a59f98f59 = var_94264830825789e8 * var_94264830825789e8;
    var_e6c45dad3f36fcf0 = var_364d2e6c896f4667 * var_364d2e6c896f4667;
    var_6d622e482d3d314d = [];
    var_a871590cb205e828 = [];
    var_3c58660908436303 = undefined;
    foreach (player in level.players) {
        if (player.team == self.team || player isskydiving() || !function_40034c2faf09a87b(player)) {
            continue;
        }
        distsq = distance2dsquared(player.origin, self.var_38df06a438df2608);
        if (distsq <= var_e6c45dad3f36fcf0) {
            if (distsq <= var_74005c948f0bef90) {
                var_6d622e482d3d314d[var_6d622e482d3d314d.size] = player.origin;
                if (!isdefined(var_3c58660908436303) || distsq < var_3c58660908436303) {
                    var_3c58660908436303 = distsq;
                }
            } else {
                var_a871590cb205e828[var_a871590cb205e828.size] = player.origin;
            }
        }
    }
    if (var_6d622e482d3d314d.size == 0) {
        return;
    }
    if (var_6d622e482d3d314d.size == 1) {
        enemyorigin = var_6d622e482d3d314d[0];
        vec = self.var_38df06a438df2608 - enemyorigin;
        if (length2dsquared(vec) < 10) {
            vec = function_e5b4b5992cddb221().origin - enemyorigin;
        }
        vec = function_767cea82b001f645(vec) * var_94264830825789e8;
        newpos = enemyorigin + vec;
        if (function_bcb0778bb33e86de(newpos)) {
            newpos = utility::groundpos((newpos[0], newpos[1], self.origin[2]));
            if (isdefined(newpos)) {
                newpos = function_f8350ab882cc2439(newpos);
                if (isdefined(newpos)) {
                    foreach (origin in var_a871590cb205e828) {
                        if (distance2dsquared(origin, newpos) <= var_3c58660908436303) {
                            return;
                        }
                    }
                    return newpos;
                }
            }
        }
        return;
    }
    var_3220296428c5ac4d = [];
    for (i = 0; i < var_6d622e482d3d314d.size - 1; i++) {
        for (j = i + 1; j < var_6d622e482d3d314d.size; j++) {
            var_b1a9b1030275146c = (var_6d622e482d3d314d[i][0], var_6d622e482d3d314d[i][1], 0);
            var_b1a9b40302751b05 = (var_6d622e482d3d314d[j][0], var_6d622e482d3d314d[j][1], 0);
            var_7040f2f2a3d4befe = var_b1a9b40302751b05 - var_b1a9b1030275146c;
            var_7040eff2a3d4b865 = 0.5 * var_7040f2f2a3d4befe;
            var_7038f4f2a3ccd7b6 = (-1 * var_7040eff2a3d4b865[1], var_7040eff2a3d4b865[0], 0);
            var_7038f4f2a3ccd7b6 = function_767cea82b001f645(var_7038f4f2a3ccd7b6) * sqrt(var_23788b3a59f98f59 - length2dsquared(var_7040eff2a3d4b865));
            var_3220296428c5ac4d[var_3220296428c5ac4d.size] = var_b1a9b1030275146c + var_7040eff2a3d4b865 + var_7038f4f2a3ccd7b6;
            var_3220296428c5ac4d[var_3220296428c5ac4d.size] = var_b1a9b1030275146c + var_7040eff2a3d4b865 - var_7038f4f2a3ccd7b6;
        }
    }
    var_6dff6be8c8798910 = undefined;
    var_366212ea1a52e19b = undefined;
    var_3aae82b8dac4e50e = 0;
    foreach (intersection in var_3220296428c5ac4d) {
        if (!function_bcb0778bb33e86de(intersection)) {
            continue;
        }
        var_fac4e1aa13aa4d48 = 0;
        foreach (origin in var_6d622e482d3d314d) {
            if (distance2dsquared(origin, intersection) <= var_74005c948f0bef90) {
                var_fac4e1aa13aa4d48 = 1;
                break;
            }
        }
        if (var_fac4e1aa13aa4d48) {
            continue;
        }
        nearestdistsq = undefined;
        foreach (origin in var_a871590cb205e828) {
            distsq = distance2dsquared(origin, intersection);
            if (!isdefined(nearestdistsq) || distsq < nearestdistsq) {
                nearestdistsq = distsq;
            }
            if (nearestdistsq <= var_3c58660908436303) {
                break;
            }
        }
        if (!isdefined(nearestdistsq) || nearestdistsq > var_74005c948f0bef90) {
            var_6dff6be8c8798910 = intersection;
            break;
        } else if (nearestdistsq <= var_3c58660908436303) {
            continue;
        } else if (!isdefined(var_366212ea1a52e19b) || nearestdistsq > var_3aae82b8dac4e50e) {
            var_366212ea1a52e19b = intersection;
            var_3aae82b8dac4e50e = nearestdistsq;
        }
    }
    var_a72a1923fc04f151 = function_53c4c53197386572(var_6dff6be8c8798910, var_366212ea1a52e19b);
    if (isdefined(var_a72a1923fc04f151)) {
        newpos = utility::groundpos((var_a72a1923fc04f151[0], var_a72a1923fc04f151[1], self.origin[2]));
        if (isdefined(newpos)) {
            newpos = function_f8350ab882cc2439(newpos);
            if (isdefined(newpos)) {
                return newpos;
            }
        }
    }
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4611
// Size: 0x400
function function_4473b5af345c0b75(startheight) {
    var_75bb4da43489d9ae = distance2d(self.origin, self.var_38df06a438df2608);
    var_e5da52ae39be43f3 = 1000;
    var_e5fef95b22eec246 = 350;
    if (var_75bb4da43489d9ae < var_e5da52ae39be43f3 && startheight > var_e5fef95b22eec246) {
        self botpressbutton("cut_chute");
        var_aa17a2b26eaf935f = 10000;
        endtime = gettime() + var_aa17a2b26eaf935f;
        while (1) {
            currenttime = gettime();
            if (currenttime >= endtime) {
                break;
            }
            function_d0539e08120fcb08();
            var_19ed8a8a2a03e81a = 50;
            var_d459f6d98bfb8aad = function_82dc476c43087820();
            var_c6f79a0dcb0aca65 = self.origin[2] - self.var_38df06a438df2608[2];
            if (var_c6f79a0dcb0aca65 < var_e5fef95b22eec246 && self isparachuting() || var_d459f6d98bfb8aad < var_19ed8a8a2a03e81a) {
                break;
            }
            var_6a8da31c699ef658 = 1;
            var_b8996303b685a203 = 800;
            gravity = getdvarint(@"hash_b5d7d39d32720e78", var_b8996303b685a203);
            velocity = self getvelocity();
            var_966b732f6569a932 = abs(velocity[2]) * var_6a8da31c699ef658 + gravity * var_6a8da31c699ef658 * var_6a8da31c699ef658 * 0.5;
            var_ef86ab5709584341 = max(abs(velocity[2]) * var_6a8da31c699ef658, var_e5fef95b22eec246);
            var_4e25ddb1d88d3b34 = randomfloat(1) > 0.1;
            if (!self isparachuting() && var_d459f6d98bfb8aad < var_966b732f6569a932) {
                self botpressbutton("jump");
            } else if (self function_3c6bb30ae7106b7a() && var_d459f6d98bfb8aad > var_ef86ab5709584341) {
                if (var_4e25ddb1d88d3b34) {
                    self botpressbutton("cut_chute");
                } else if (isdefined(self.var_b7c77afce58bcac6) && currenttime >= self.var_b7c77afce58bcac6) {
                    verticalspeed = max(abs(velocity[2]), 0.1);
                    time = var_d459f6d98bfb8aad / verticalspeed;
                    dist = 200 * time * randomfloatrange(0.1, 1);
                    theta = randomfloat(360);
                    offset = (dist * cos(theta), dist * sin(theta), 0);
                    randompoint = self.var_38df06a438df2608 + offset;
                    newpos = function_f8350ab882cc2439(randompoint);
                    if (function_bcb0778bb33e86de(newpos) && namespace_2a184fc4902783dc::ray_trace_passed(self geteye(), newpos, self)) {
                        self.var_38df06a438df2608 = newpos;
                        self.var_b7c77afce58bcac6 = 2147483647;
                    } else {
                        var_5a131f8f7a5add85 = 1000;
                        self.var_b7c77afce58bcac6 = currenttime + var_5a131f8f7a5add85;
                    }
                }
            }
            function_c43469e7a5ae4ba4(self.var_38df06a438df2608, 0.05);
            var_237d4ab7b21367f0 = max(abs(velocity[2]), 0.1);
            var_642a9b3ce402ec00 = var_c6f79a0dcb0aca65 / var_237d4ab7b21367f0;
            var_75bb4da43489d9ae = distance2d(self.origin, self.var_38df06a438df2608);
            var_4a1fb03882e4e567 = var_75bb4da43489d9ae / var_642a9b3ce402ec00;
            var_734a884df1a36225 = self.var_38df06a438df2608 - self.origin;
            var_734a884df1a36225 = vectornormalize((var_734a884df1a36225[0], var_734a884df1a36225[1], 0));
            var_3e1f9c45395e389f = var_734a884df1a36225 * var_4a1fb03882e4e567;
            var_f0d4f34e58368f52 = var_3e1f9c45395e389f - velocity;
            var_b2bee1aed960f257 = vectortoangles(vectornormalize(var_f0d4f34e58368f52));
            self botsetscriptmove(var_b2bee1aed960f257[1], 0.05, 1);
            wait(0.05);
        }
    }
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a18
// Size: 0x45
function function_82dc476c43087820() {
    var_c1d1fc4d9d46438d = -25000;
    groundpos = namespace_3c37cb17ade254d::drop_to_ground(self.origin, 0, var_c1d1fc4d9d46438d);
    if (isdefined(groundpos)) {
        return (self.origin[2] - groundpos[2]);
    }
    return 0;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a65
// Size: 0xcd
function function_916e2512538553db() {
    self notify("bot_delay_give_loadout");
    self endon("bot_delay_give_loadout");
    self endon("bot_suspended");
    self endon("death_or_disconnect");
    level endon("game_ended");
    delaysec = getdvarint(@"hash_b18793f70e0f6b34", 30);
    /#
        assertex(delaysec > 0, "scr_br_bot_give_loadout_delay should > 0");
    #/
    wait(delaysec);
    dist = getdvarint(@"hash_3da4efd986f095de", 3900);
    /#
        assertex(dist > 0, "scr_br_bot_give_loadout_distance should > 0");
    #/
    while (!self.var_ab5f5270cb22e3c8 && !namespace_7e17181d03156026::isinlaststand(self)) {
        if (!function_a094b75e2ab2c597(dist) && !function_b74cf5eb822312cb() && !function_da84567cda38847e()) {
            function_532c9aa14c794ff(function_3032314d524a3487());
            return;
        }
        wait(1);
    }
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b39
// Size: 0x194
function function_3032314d524a3487() {
    if (!isdefined(level.br_circle.var_5b8569581e64d55a)) {
        /#
            assertmsg("level.br_circle.circleInitTime is not defined, unable to get the phase of the game");
        #/
        return level.br_level.var_61321b51908d55cb;
    }
    if (!isdefined(level.br_level.var_67ba7c3c6b03a843)) {
        level.br_level.var_67ba7c3c6b03a843 = 0;
        for (circleindex = 0; circleindex < level.br_level.br_circleclosetimes.size - level.br_level.br_movingcirclecount; circleindex++) {
            level.br_level.var_67ba7c3c6b03a843 = level.br_level.var_67ba7c3c6b03a843 + level.br_level.br_circleclosetimes[circleindex];
            level.br_level.var_67ba7c3c6b03a843 = level.br_level.var_67ba7c3c6b03a843 + level.br_level.br_circledelaytimes[circleindex];
        }
    }
    var_27a51444298629d = (gettime() - level.br_circle.var_5b8569581e64d55a) / 1000;
    if (var_27a51444298629d < level.br_level.var_67ba7c3c6b03a843 * 0.4) {
        return level.br_level.var_61321b51908d55cb;
    } else {
        return level.br_level.var_61321c51908d57fe;
    }
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cd4
// Size: 0x96
function function_a094b75e2ab2c597(var_667b3eef65d8914) {
    radiussq = squared(var_667b3eef65d8914);
    foreach (player in level.players) {
        if (function_40034c2faf09a87b(player)) {
            if (distancesquared(self.origin, player.origin) <= radiussq) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d72
// Size: 0x3d
function function_532c9aa14c794ff(table) {
    if (istrue(self.var_ab5f5270cb22e3c8)) {
        return;
    }
    /#
        assertex(isdefined(table), "loadout config file is not defined");
    #/
    self.var_ab5f5270cb22e3c8 = 1;
    function_91774b01bc741d01(table);
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4db6
// Size: 0x1a8
function function_91774b01bc741d01(table) {
    var_7d958726e11b327 = namespace_d19129e4fa5d176::function_df2933f96d726d71(table);
    var_1a0fe414f9014246 = randomintrange(0, var_7d958726e11b327);
    struct = namespace_d19129e4fa5d176::loadout_getclassstruct();
    struct = namespace_d19129e4fa5d176::function_1d52554d28b51cbc(struct, var_1a0fe414f9014246, table);
    var_e2154dbde4bd1cac = strtok(struct.loadoutprimary, "|");
    struct.loadoutprimary = var_e2154dbde4bd1cac[0];
    var_63cbf0be53790618 = strtok(struct.loadoutsecondary, "|");
    struct.loadoutsecondary = var_63cbf0be53790618[0];
    struct = namespace_d19129e4fa5d176::loadout_updateclass(struct, "juggernaut");
    if (isdefined(var_e2154dbde4bd1cac[1])) {
        fullname = function_8673b301658f7e88(struct.loadoutprimary, var_e2154dbde4bd1cac[1]);
        if (isdefined(fullname)) {
            struct.loadoutprimaryfullname = fullname;
            struct.loadoutprimaryobject = makeweaponfromstring(struct.loadoutprimaryfullname);
        }
    }
    if (isdefined(var_63cbf0be53790618[1])) {
        fullname = function_8673b301658f7e88(struct.loadoutsecondary, var_63cbf0be53790618[1]);
        if (isdefined(fullname)) {
            struct.loadoutsecondaryfullname = fullname;
            struct.loadoutsecondaryobject = makeweaponfromstring(struct.loadoutsecondaryfullname);
        }
    }
    namespace_d19129e4fa5d176::preloadandqueueclassstruct(struct, 1, 1);
    self takeallweapons();
    namespace_d19129e4fa5d176::giveloadout(self.team, "juggernaut", 1, 1);
    self switchtoweapon(self.primaryweapons[0]);
    namespace_d19129e4fa5d176::loadout_updateplayerkillstreaks(struct, "juggernaut");
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f65
// Size: 0xd7
function function_8673b301658f7e88(var_5c3f9357f11d2223, rarity) {
    /#
        assert(isdefined(level.br_pickups.br_weapontoscriptable));
    #/
    foreach (fullweaponname, var_6180da62ad446599 in level.br_pickups.br_weapontoscriptable) {
        if (issubstr(fullweaponname, var_5c3f9357f11d2223) && issubstr(var_6180da62ad446599, rarity)) {
            return fullweaponname;
        }
    }
    if (namespace_cd0b2d039510b38d::getsubgametype() != "aladdin" && !namespace_36f464722d326bbe::function_6493ec89ae923684()) {
        /#
            assertmsg("No weapon can be selected ( " + var_5c3f9357f11d2223 + ", " + rarity + " ). ");
        #/
    }
    return undefined;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5044
// Size: 0x27
function function_5b54ecc3b227f84d() {
    tablename = "classtable:classtable_br_bot_loadouts_airdrop_" + self.difficulty;
    function_91774b01bc741d01(tablename);
    return 1;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5073
// Size: 0x43d
function function_c8cc3e3589f34923(table) {
    /#
        var_abb1091bb76019bc = [];
        var_abb1091bb76019bc["<unknown string>"] = 0;
        var_abb1091bb76019bc["<unknown string>"] = 1;
        var_abb1091bb76019bc["<unknown string>"] = 2;
        var_abb1091bb76019bc["<unknown string>"] = 3;
        var_abb1091bb76019bc["<unknown string>"] = 4;
        if (isdefined(table)) {
            var_7d958726e11b327 = namespace_d19129e4fa5d176::function_df2933f96d726d71(table);
            for (i = 0; i < var_7d958726e11b327; i++) {
                struct = namespace_d19129e4fa5d176::loadout_getclassstruct();
                struct = namespace_d19129e4fa5d176::function_1d52554d28b51cbc(struct, i, table);
                var_e2154dbde4bd1cac = strtok(struct.loadoutprimary, "<unknown string>");
                var_63cbf0be53790618 = strtok(struct.loadoutsecondary, "<unknown string>");
                /#
                    assert(var_e2154dbde4bd1cac.size == 2 && isdefined(var_e2154dbde4bd1cac[0]) && isdefined(var_e2154dbde4bd1cac[1]));
                #/
                /#
                    assert(var_63cbf0be53790618.size == 2 && isdefined(var_63cbf0be53790618[0]) && isdefined(var_63cbf0be53790618[1]));
                #/
                var_e206fc674b6318b0 = 0;
                var_c44bd0362ab35bf0 = 0;
                var_9eea23b5420bb92e = 0;
                var_adc7a698896266e = 0;
                if (!istrue(level.var_a9350d89a2e4d752)) {
                    var_4236bee99ba1d49b = tablelookupgetnumrows(level.brloottablename);
                    for (row = 0; row < var_4236bee99ba1d49b; row++) {
                        if (tablelookupbyrow(level.brloottablename, row, 0) != "<unknown string>") {
                            continue;
                        }
                        var_c3ce54fc5fbe47c9 = 8;
                        var_982e0173be395ad2 = 3;
                        var_92fce7b1696254e3 = tablelookupbyrow(level.brloottablename, row, var_c3ce54fc5fbe47c9);
                        rarity = int(tablelookupbyrow(level.brloottablename, row, var_982e0173be395ad2));
                        if (!isdefined(var_92fce7b1696254e3)) {
                            continue;
                        }
                        if (var_92fce7b1696254e3 == var_e2154dbde4bd1cac[0] && rarity == var_abb1091bb76019bc[var_e2154dbde4bd1cac[1]]) {
                            var_e206fc674b6318b0 = 1;
                        }
                        if (var_92fce7b1696254e3 == var_63cbf0be53790618[0] && rarity == var_abb1091bb76019bc[var_63cbf0be53790618[1]]) {
                            var_c44bd0362ab35bf0 = 1;
                        }
                        if (var_92fce7b1696254e3 == struct.loadoutequipmentprimary) {
                            var_9eea23b5420bb92e = 1;
                        }
                        if (var_92fce7b1696254e3 == struct.loadoutequipmentsecondary) {
                            var_adc7a698896266e = 1;
                        }
                    }
                    /#
                        assertex(var_e206fc674b6318b0, "<unknown string>" + struct.loadoutprimary + "<unknown string>");
                    #/
                    /#
                        assertex(var_c44bd0362ab35bf0, "<unknown string>" + struct.loadoutsecondary + "<unknown string>");
                    #/
                    /#
                        assertex(var_9eea23b5420bb92e, "<unknown string>" + struct.loadoutequipmentprimary + "<unknown string>");
                    #/
                    /#
                        assertex(var_adc7a698896266e, "<unknown string>" + struct.loadoutequipmentsecondary + "<unknown string>");
                    #/
                } else {
                    foreach (var_14004b68ddacb781, var_92fce7b1696254e3 in level.var_fb8e78837bc5ee6c) {
                        var_c3ce54fc5fbe47c9 = 8;
                        var_982e0173be395ad2 = 3;
                        if (!isdefined(var_92fce7b1696254e3)) {
                            continue;
                        }
                        rarity = level.br_pickups.br_itemrarity[var_14004b68ddacb781];
                        if (isdefined(rarity)) {
                            if (var_92fce7b1696254e3 == var_e2154dbde4bd1cac[0] && rarity == var_abb1091bb76019bc[var_e2154dbde4bd1cac[1]]) {
                                var_e206fc674b6318b0 = 1;
                            }
                            if (var_92fce7b1696254e3 == var_63cbf0be53790618[0] && rarity == var_abb1091bb76019bc[var_63cbf0be53790618[1]]) {
                                var_c44bd0362ab35bf0 = 1;
                            }
                            if (var_92fce7b1696254e3 == struct.loadoutequipmentprimary) {
                                var_9eea23b5420bb92e = 1;
                            }
                            if (var_92fce7b1696254e3 == struct.loadoutequipmentsecondary) {
                                var_adc7a698896266e = 1;
                            }
                        }
                    }
                    /#
                        assertex(var_e206fc674b6318b0, "<unknown string>" + struct.loadoutprimary + "<unknown string>");
                    #/
                    /#
                        assertex(var_c44bd0362ab35bf0, "<unknown string>" + struct.loadoutsecondary + "<unknown string>");
                    #/
                    /#
                        assertex(var_9eea23b5420bb92e, "<unknown string>" + struct.loadoutequipmentprimary + "<unknown string>");
                    #/
                    /#
                        assertex(var_adc7a698896266e, "<unknown string>" + struct.loadoutequipmentsecondary + "<unknown string>");
                    #/
                }
            }
        }
    #/
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54b7
// Size: 0x6b
function function_84930089af3d03b(var_7bf0ba85ec52e893) {
    if (var_7bf0ba85ec52e893) {
        level endon("prematch_over");
    } else {
        self notify("start_combat");
    }
    function_142b713a2846f9ac("Mind");
    self botsetflag("enable_deploy_parachute", 1);
    namespace_56b9cc3deb6e3f5e::function_555c24cbde8f72c6();
    while (1) {
        if (getdvarint(@"hash_40d69a9ed755f536", 0)) {
            function_ab1937128f48283f();
        }
        namespace_56b9cc3deb6e3f5e::update();
    }
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5529
// Size: 0x48
function function_ab1937128f48283f() {
    if (namespace_d20f8ef223912e12::function_72ce5f47da0f5661() && !namespace_95d8d8ec67e3e074::function_6ecc7cd453466014() && self botgetdifficulty() == "recruit") {
        if (function_c4053e29135c5d27()) {
            self botsetdifficulty("regular");
            function_8771893f1bcb49bb(self, "regular");
        }
    }
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5578
// Size: 0x63
function kickplayer(var_891a45ddc315b75e, var_f0f6d13c70d13c4f) {
    if (!isdefined(var_891a45ddc315b75e)) {
        var_891a45ddc315b75e = "kickout";
    }
    namespace_92443376a63aa4bd::function_b1c37e649a5cd380(var_891a45ddc315b75e, var_f0f6d13c70d13c4f);
    self.var_6a91d0e80cc504e = var_891a45ddc315b75e == "uibot";
    if (var_891a45ddc315b75e == "uibot") {
        kick(self getentitynumber(), "EXE/PLAYERKICKED_BOT_TO_UIBOT");
    } else {
        kick(self getentitynumber());
    }
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55e2
// Size: 0x6e
function function_f6e88d354cb8d3cd() {
    var_49a1f28198874781 = getdvarint(@"hash_c794e905073b07a4", 5);
    var_24770e5472ff8c0b = getdvarint(@"hash_cffa0859ef69d472", 20);
    /#
        assert(var_49a1f28198874781 < var_24770e5472ff8c0b);
    #/
    wait(randomintrange(var_49a1f28198874781, var_24770e5472ff8c0b));
    if (isdefined(self) && (function_a9cbf557dc66d201() || isdefined(self getspectatingplayer()))) {
        kickplayer();
    }
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5657
// Size: 0xda
function function_b74cf5eb822312cb(var_d0ef19bb4272812a) {
    foreach (player in level.players) {
        if (istrue(var_d0ef19bb4272812a) && self.team == player.team) {
            continue;
        }
        if (function_40034c2faf09a87b(player)) {
            var_c907d6a55798b4e = anglestoforward(player.angles);
            var_87c3be94eb77030f = self.origin - player.origin;
            if (vectordot(var_87c3be94eb77030f, var_c907d6a55798b4e) > 0) {
                if (player function_5480d301bbdb5da1(self)) {
                    return 1;
                }
            }
        }
    }
    return 0;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5739
// Size: 0x5d
function function_16a5388d4963e316() {
    if (!isdefined(self.var_23df2e87f39050f5) || self.var_23df2e87f39050f5 != gettime()) {
        self.var_23df2e87f39050f5 = gettime();
        self.var_fff6e27dea20881 = function_b74cf5eb822312cb();
    }
    /#
        assert(isdefined(self.var_fff6e27dea20881));
    #/
    return self.var_fff6e27dea20881;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x579e
// Size: 0x7b
function function_da84567cda38847e() {
    foreach (player in level.players) {
        if (!isai(player)) {
            playertospectate = player namespace_a9c534dc7832aba4::playergetspectatingplayer();
            if (isdefined(playertospectate) && playertospectate == self) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5821
// Size: 0x2a
function function_5480d301bbdb5da1(targetplayer) {
    /#
        assert(isplayer(targetplayer));
    #/
    return targetplayer sightconetrace(self geteye(), self) > 0;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5853
// Size: 0xd
function function_a9cbf557dc66d201() {
    return istrue(self.br_iseliminated);
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5868
// Size: 0x29
function function_36fd4f80d95cd0c4(player) {
    return function_ded80385ea7471db(player) && !player function_a9cbf557dc66d201() && !player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag();
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5899
// Size: 0x1d
function function_40034c2faf09a87b(player) {
    return isvalidplayer(player) && !isai(player);
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58be
// Size: 0x28
function isvalidbot(player) {
    return isvalidplayer(player) && isbot(player) && !player namespace_95d8d8ec67e3e074::function_6ecc7cd453466014();
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58ee
// Size: 0x1d
function function_56fb6eea7e566a2(player) {
    return isvalidplayer(player) && !player isskydiving();
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5913
// Size: 0x36
function function_81b00a2ba10c143a(type) {
    var_16efcf27e6efcbe8 = namespace_a4b43c1cf86c6fe5::function_601181692f53e4ed(type);
    if (!isdefined(var_16efcf27e6efcbe8)) {
        return 0;
    }
    return namespace_cb965d2f71fefddc::function_81b00a2ba10c143a(var_16efcf27e6efcbe8.ref);
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5951
// Size: 0x54
function function_c4053e29135c5d27() {
    /#
        assert(isbot(self));
    #/
    var_b8bba9ccd960781 = getdvarint(@"hash_946321d51f80b343", 3000);
    var_c3f669f8cd557637 = function_a0fbe39135ab0d35();
    var_ae5632495dfca986 = gettime() - var_c3f669f8cd557637;
    return var_ae5632495dfca986 > var_b8bba9ccd960781;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59ad
// Size: 0x8b
function function_a0fbe39135ab0d35() {
    var_c3f669f8cd557637 = 0;
    if (isdefined(self.lastdamagedtime)) {
        var_c3f669f8cd557637 = max(var_c3f669f8cd557637, self.lastdamagedtime);
    }
    if (isdefined(self.var_c826ab9d43c24233)) {
        var_c3f669f8cd557637 = max(var_c3f669f8cd557637, self.var_c826ab9d43c24233);
    }
    if (!isai(self)) {
        var_44f4fb2fdd683ffa = self.var_44f4fb2fdd683ffa;
        if (isdefined(var_44f4fb2fdd683ffa.var_f315b15bf1bd4b5e)) {
            var_c3f669f8cd557637 = max(var_c3f669f8cd557637, var_44f4fb2fdd683ffa.var_f315b15bf1bd4b5e);
        }
    }
    return var_c3f669f8cd557637;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a40
// Size: 0x57
function function_5f352fb76c54705c() {
    var_aea051c033b84a83 = undefined;
    var_7a8b23e91af57c28 = undefined;
    if (getdvarint(@"hash_82bde055b11e6698", 0)) {
        var_aea051c033b84a83 = namespace_94f9b19ae91ab934::function_5f352fb76c54705c();
        var_7a8b23e91af57c28 = namespace_5a4a9f3e4a0baf2f::function_5f352fb76c54705c();
    } else {
        var_aea051c033b84a83 = namespace_1570f123b2a33e9e::function_5f352fb76c54705c();
        var_7a8b23e91af57c28 = namespace_b5b2280a66414fff::function_5f352fb76c54705c();
    }
    return var_aea051c033b84a83 || istrue(var_7a8b23e91af57c28);
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a9f
// Size: 0x36b
function function_bbc2d6967287dc7(var_2b7395b3855ce24f, var_2f96c6a3fad9912) {
    var_5577636292591c8b = level.br_pickups.br_itemtype[var_2b7395b3855ce24f];
    if (var_2b7395b3855ce24f == "military_ammo_restock") {
        var_5577636292591c8b = function_1823ff50bb28148d("ammo_restock");
    }
    /#
        assertex(isdefined(var_5577636292591c8b), "The loot name is: " + var_2b7395b3855ce24f);
    #/
    switch (var_5577636292591c8b) {
    case #"ammo":
        return namespace_cb965d2f71fefddc::canholdammobox(var_2b7395b3855ce24f);
    case #"gear":
        return !namespace_9c6cddd872ad75f7::hasgasmask(self);
    case #"health":
        return function_5ba1e582607305e4("health", var_2b7395b3855ce24f);
    case #"revive":
        return !namespace_d3d40f75bb4e4c32::hasselfrevivetoken();
    case #"lethal":
        return function_5ba1e582607305e4("primary", var_2b7395b3855ce24f, var_2f96c6a3fad9912);
    case #"tactical":
        return function_5ba1e582607305e4("secondary", var_2b7395b3855ce24f, var_2f96c6a3fad9912);
    case #"killstreak":
        if (!namespace_cb965d2f71fefddc::hasanykillstreak()) {
            return 1;
            goto LOC_000001e0;
        }
        if (isdefined(var_2f96c6a3fad9912)) {
            defaultvalue = var_2f96c6a3fad9912.var_3a436bd812a2b86[#"killstreak"];
            /#
                assert(isdefined(defaultvalue));
            #/
            equippedkillstreak = level.br_pickups.var_838863c4848d4c26[self.streakdata.streaks[1].streakname];
            var_82650800f1c44914 = ter_op(isdefined(var_2f96c6a3fad9912.var_1987d8b5d11dfd90[equippedkillstreak]), var_2f96c6a3fad9912.var_1987d8b5d11dfd90[equippedkillstreak], defaultvalue);
            var_452a165d9f2f19b3 = ter_op(isdefined(var_2f96c6a3fad9912.var_1987d8b5d11dfd90[var_2b7395b3855ce24f]), var_2f96c6a3fad9912.var_1987d8b5d11dfd90[var_2b7395b3855ce24f], defaultvalue);
            return (var_452a165d9f2f19b3 > var_82650800f1c44914);
            goto LOC_000001e0;
        }
        return 0;
    case #"super":
    LOC_000001e0:
        return function_5ba1e582607305e4("super", var_2b7395b3855ce24f, var_2f96c6a3fad9912);
    case #"weapon":
        classname = level.br_lootiteminfo[var_2b7395b3855ce24f].fullweaponobj.classname;
        var_f8a42b1fc9705ecf = undefined;
        if (!isdefined(classname)) {
            var_f8a42b1fc9705ecf = 0;
            /#
                assertmsg(var_2b7395b3855ce24f + " does not have fullweaponobj.classname");
            #/
        } else {
            var_f8a42b1fc9705ecf = classname == "pistol" || classname == "rocketlauncher";
        }
        var_b68c8dfac38718ab = 0;
        currentprimaryweapon = self getcurrentprimaryweapon();
        var_d8b029b01e855cfc = weaponclass(currentprimaryweapon);
        if (var_d8b029b01e855cfc == "pistol" || var_d8b029b01e855cfc == "melee") {
            var_b68c8dfac38718ab = -1;
        } else {
            var_b68c8dfac38718ab = namespace_cb965d2f71fefddc::function_96b5a34cd1572d60(currentprimaryweapon);
        }
        var_afd7802bb6a15a78 = level.br_lootiteminfo[var_2b7395b3855ce24f].fullweaponobj;
        var_167e430a395b12ba = namespace_cb965d2f71fefddc::function_96b5a34cd1572d60(var_afd7802bb6a15a78);
        var_c946bb8bd070cc8b = var_b68c8dfac38718ab < var_167e430a395b12ba;
        return (!var_f8a42b1fc9705ecf && var_c946bb8bd070cc8b);
    case #"cache":
        return 1;
    case #"ammo_restock":
        return 1;
    case #"plunder":
        return 1;
    case #"tablet":
        return !namespace_1eb3c4e0e28fac71::function_7094c7010c5e3827(self.team);
        break;
    }
    return 0;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e12
// Size: 0x162
function function_5ba1e582607305e4(slot, var_a1093166de09e6b8, var_2f96c6a3fad9912) {
    var_a79a5a265cafae46 = self.equipment[slot];
    if (!isdefined(var_a79a5a265cafae46)) {
        return 1;
    }
    var_58f7650e8def9a65 = level.br_pickups.br_equipnametoscriptable[var_a79a5a265cafae46];
    if (!isdefined(var_58f7650e8def9a65)) {
        /#
            println("<unknown string>" + var_a79a5a265cafae46 + "<unknown string>");
        #/
        return 0;
    }
    if (var_58f7650e8def9a65 == var_a1093166de09e6b8) {
        var_5324597edfaff57c = namespace_1a507865f681850e::getequipmentslotammo(slot);
        var_b5cdf4d935e6ac13 = namespace_1a507865f681850e::getequipmentmaxammo(var_a79a5a265cafae46);
        return (var_5324597edfaff57c < var_b5cdf4d935e6ac13);
    } else if (isdefined(var_2f96c6a3fad9912)) {
        var_5577636292591c8b = level.br_pickups.br_itemtype[var_a1093166de09e6b8];
        defaultvalue = var_2f96c6a3fad9912.var_3a436bd812a2b86[var_5577636292591c8b];
        /#
            assert(isdefined(defaultvalue));
        #/
        var_82650800f1c44914 = ter_op(isdefined(var_2f96c6a3fad9912.var_1987d8b5d11dfd90[var_58f7650e8def9a65]), var_2f96c6a3fad9912.var_1987d8b5d11dfd90[var_58f7650e8def9a65], defaultvalue);
        var_452a165d9f2f19b3 = ter_op(isdefined(var_2f96c6a3fad9912.var_1987d8b5d11dfd90[var_a1093166de09e6b8]), var_2f96c6a3fad9912.var_1987d8b5d11dfd90[var_a1093166de09e6b8], defaultvalue);
        return (var_452a165d9f2f19b3 > var_82650800f1c44914);
    } else {
        return 0;
    }
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f7b
// Size: 0x37
function ispointincurrentsafecircle(point) {
    circleorigin = namespace_c5622898120e827f::getsafecircleorigin();
    circleradius = namespace_c5622898120e827f::getsafecircleradius();
    return ispointinsidecircle(point, circleorigin, circleradius);
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5fba
// Size: 0xa6
function function_e5b4b5992cddb221() {
    var_4f5c90c268d3ebf1 = namespace_bbc79db4c3949a5c::function_7d381171eae99b77();
    var_624c059685e285b3 = namespace_bbc79db4c3949a5c::function_bf15a5aa7e72aee9();
    result = spawnstruct();
    var_2c6a15308bc5c400 = -1;
    for (i = 0; i < var_4f5c90c268d3ebf1.size; i++) {
        var_7617c5ac71106ac5 = distance2dsquared(self.origin, var_4f5c90c268d3ebf1[i]);
        if (var_2c6a15308bc5c400 < 0 || var_7617c5ac71106ac5 < var_2c6a15308bc5c400) {
            var_2c6a15308bc5c400 = var_7617c5ac71106ac5;
            result.origin = var_4f5c90c268d3ebf1[i];
            result.radius = var_624c059685e285b3[i];
        }
    }
    return result;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6068
// Size: 0x49
function function_61e3c952715399e0() {
    circle = function_e5b4b5992cddb221();
    point = namespace_c5622898120e827f::getrandompointincircle(circle.origin, circle.radius, undefined, undefined, 1, 0, undefined, undefined);
    return namespace_c52269d70f989750::function_f8350ab882cc2439(point);
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60b9
// Size: 0x42
function function_c42a53b48c0a683e() {
    circle = function_e5b4b5992cddb221();
    point = function_fcc75af6225b896b(circle.origin, circle.radius);
    return function_207ba502560fa1d2(point);
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6103
// Size: 0x79
function function_bcb0778bb33e86de(point) {
    if (namespace_d576b6dc7cef9c62::function_1147bbc93ea9b83c()) {
        return 1;
    }
    if (namespace_bbc79db4c3949a5c::function_ee854fdd1e77efc4(self.origin)) {
        return namespace_bbc79db4c3949a5c::function_77cec84f05ca9418(self.origin, point);
    } else {
        circle = function_e5b4b5992cddb221();
        return (distance2dsquared(point, circle.origin) < circle.radius * circle.radius);
    }
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6183
// Size: 0x34
function function_8b201bccc0aa3695(point, seconds) {
    self setplayerangles(vectortoangles(point - self.origin));
    function_c43469e7a5ae4ba4(point, seconds);
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61be
// Size: 0x50
function function_d1acad1ee42b2b2f(entity, seconds, var_185569febc7f5481) {
    randomrange = randomintrange(var_185569febc7f5481 * -1, var_185569febc7f5481);
    self botsetscriptmove(entity.angles[1] + randomrange, seconds, 0.1);
    wait(seconds);
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6215
// Size: 0x45
function function_6dd2dfeb41384764() {
    /#
        assertex(namespace_36f464722d326bbe::isBRStyleGameType(), "MixedSquadSupported() is meant to be called in BR mode!");
    #/
    if (!namespace_ca7b90256548aa40::issquadmode()) {
        return 0;
    }
    if (namespace_cd0b2d039510b38d::matchmakinggame()) {
        return function_48dc7b5f7e9e4061();
    } else {
        return !getdvarint(@"hash_d356a7876f773136", 0);
    }
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6261
// Size: 0x181
function function_8a0fa223b19e44f4(var_b25f7bc9b6613cc9, inputarray, var_330c401bd2801f95, var_3b233cde4adf9cd0, var_bef59d5b603763b0, var_6681cebd53b80d74) {
    var_9a2062c443cb9c3a = undefined;
    var_f599866086ff8be = 0;
    if (istrue(var_3b233cde4adf9cd0)) {
        var_7de0efbf334063a9 = &ispointincurrentsafecircle;
    } else {
        var_7de0efbf334063a9 = &namespace_a36a697bb5de283b::ispointincurrentcircle;
    }
    foreach (place in var_b25f7bc9b6613cc9) {
        if (![[ var_7de0efbf334063a9 ]](place.origin)) {
            continue;
        }
        var_5ffe906c9d39a37f = distance(self.origin, place.origin);
        var_c7cbb0c4d50eae12 = function_9d1ab012058221bb(var_5ffe906c9d39a37f, inputarray, var_330c401bd2801f95);
        if (isdefined(var_bef59d5b603763b0)) {
            var_7d9a6d00a336393b = namespace_bbc79db4c3949a5c::function_3e0a90b32e551ad(place.origin);
            var_40f4b7920a0ca8a0 = function_9d1ab012058221bb(var_7d9a6d00a336393b, var_bef59d5b603763b0, var_6681cebd53b80d74);
            var_c7cbb0c4d50eae12 = var_c7cbb0c4d50eae12 + var_40f4b7920a0ca8a0;
        }
        if (var_c7cbb0c4d50eae12 > var_f599866086ff8be) {
            var_f599866086ff8be = var_c7cbb0c4d50eae12;
            var_9a2062c443cb9c3a = place;
        }
    }
    if (!isdefined(var_9a2062c443cb9c3a)) {
        return undefined;
    }
    var_1f83dd662a0dc9dc = spawnstruct();
    var_1f83dd662a0dc9dc.score = var_f599866086ff8be;
    var_1f83dd662a0dc9dc.target = var_9a2062c443cb9c3a;
    return var_1f83dd662a0dc9dc;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63ea
// Size: 0xd8
function function_813a1a6f2c5abddb(weaponobj, ratio) {
    ammotype = namespace_3bcd40a3005712ec::br_ammo_type_for_weapon(weaponobj);
    if (!isdefined(ammotype)) {
        return 0;
    }
    var_b76e538aee4d17aa = !isdefined(self.br_ammo) || !isdefined(self.br_ammo[ammotype]) || !isdefined(level.var_e6ea72fc5e3fcd00[ammotype]);
    if (var_b76e538aee4d17aa) {
        /#
            assertmsg("Ammo type [" + ammotype + "] is invalid for weapon [" + weaponobj.basename + "]");
        #/
        return 0;
    }
    var_156b27cc0da0f727 = self.br_ammo[ammotype] + self getweaponammoclip(weaponobj);
    var_ab0ee360900bcb85 = level.var_e6ea72fc5e3fcd00[ammotype];
    var_49fffc1ce970e26d = var_156b27cc0da0f727 / var_ab0ee360900bcb85 > ratio;
    return var_49fffc1ce970e26d;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64ca
// Size: 0x44
function function_1c51f7c46a848ddd() {
    return float(level.br_circle.circleindex) / (level.br_level.br_circledelaytimes.size - level.br_level.br_movingcirclecount);
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6516
// Size: 0x4d
function function_c38398385afc10fc() {
    player = level waittill("player_spawned");
    if (!namespace_cd0b2d039510b38d::matchmakinggame()) {
        botcount = getdvarint(@"hash_116700c9b39c1eba", 0);
        level thread function_f166b9f78beca5e6(botcount);
    }
    /#
        function_479aea2ae06a371c();
    #/
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x656a
// Size: 0x6d
function function_f166b9f78beca5e6(count) {
    var_50ade409b1e5efcb = [];
    for (i = 1; i <= count; i++) {
        botinfo = spawnstruct();
        botinfo.name = "";
        var_50ade409b1e5efcb[var_50ade409b1e5efcb.size] = botinfo;
    }
    level function_7d92b857142dbdc6(var_50ade409b1e5efcb, "autoassign", undefined, undefined, "spawned_bots");
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65de
// Size: 0x237
function function_b5e22620a8778c4a(arena) {
    if (!isdefined(arena)) {
        return;
    }
    if (arena.arenaplayers.size < 2) {
        return;
    }
    gulagplayers = array_combine(arena.arenaplayers, arena.jailedplayers);
    foreach (player in gulagplayers) {
        if (!isbot(player)) {
            return;
        }
    }
    foreach (player in gulagplayers) {
        if (player function_da84567cda38847e()) {
            return;
        }
    }
    winners = [];
    var_93b3b06a17cc437b = [];
    var_37e0fe1f4e33613 = arena.arenaplayers[ter_op(randomint(2) == 0, 0, 1)].team;
    foreach (player in arena.arenaplayers) {
        if (player.team == var_37e0fe1f4e33613) {
            winners[winners.size] = player;
        } else {
            var_93b3b06a17cc437b[var_93b3b06a17cc437b.size] = player;
        }
    }
    foreach (loser in var_93b3b06a17cc437b) {
        loser dodamage(loser.health + 1000, winners[0].origin, winners[0], winners[0], "MOD_RIFLE_BULLET", winners[0] getcurrentweapon());
        /#
            println("<unknown string>" + loser.name + "<unknown string>");
        #/
    }
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x681c
// Size: 0x4d
function private function_bb8b7cdce37ccab() {
    namespace_a36a697bb5de283b::function_543a0a3113ff89f7();
    namespace_41f4dfb71dd08362::function_21b2d65575e9c0cc("Combat");
    self botsetflag("allow_laststand_decision", 1);
    self.var_a80ab26b5150a5ee = self botgetdifficulty();
    self.difficulty = self botgetdifficulty();
    self.var_ab5f5270cb22e3c8 = 1;
}

// Namespace namespace_7823423e849112c7/namespace_bc2665cbe6cf4e1f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6870
// Size: 0x4
function private function_eac6ce0d8138984b() {
    waitframe();
}

