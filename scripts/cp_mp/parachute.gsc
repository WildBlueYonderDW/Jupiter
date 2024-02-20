// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using script_7ab5b649fa408138;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using script_16ea1b94f0f381b3;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\parachute.gsc;

#namespace parachute;

// Namespace parachute/namespace_5078ee98abb32db9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44e
// Size: 0x3d3
function initparachutedvars() {
    setdvarifuninitialized(@"hash_df1a64ca42c9a254", 256);
    setdvarifuninitialized(@"hash_a6cbd1a7783679d3", 0);
    setdvarifuninitialized(@"hash_b3753b4b05ad5c76", (0, 0, 0));
    setdvarifuninitialized(@"hash_1173d2bfe5fb201c", 2);
    setdvarifuninitialized(@"hash_915273f1933ae779", 1);
    setdvarifuninitialized(@"hash_fe5686b5fc4463d4", 1);
    setdvarifuninitialized(@"hash_d5f50ecdfdc6c716", 0.5);
    setdvarifuninitialized(@"hash_b07928ed107a4cf4", 0);
    setdvarifuninitialized(@"hash_9f66821b2aaf39d8", 0);
    setdvarifuninitialized(@"hash_5ac691c4bd26e73a", 5000);
    setdvarifuninitialized(@"hash_9900614b9e630dcc", 10);
    setdvarifuninitialized(@"hash_ff536a80f82c4872", 2);
    setdvarifuninitialized(@"hash_8585ab654ea58865", 10000);
    setdvarifuninitialized(@"hash_424b04903c6347b7", 7500);
    setdvarifuninitialized(@"hash_df7bfdbd61db3ed7", -2);
    level.parachutecancutautodeploy = getdvarint(@"hash_ff604c5295c4e36c", 1);
    level.parachutecancutparachute = getdvarint(@"hash_5f25fd4c8fc1a759", 1);
    level.var_492c3dce9458c51e = getdvarint(@"hash_b99e3b3c6154ced8", 1);
    level.parachuteinitfinished = 1;
    level.activeparachuters = [];
    if (!isdefined(level.dontshootwhileparachuting)) {
        level.dontshootwhileparachuting = 1;
    }
    if (!isdefined(level.freefallstartcb)) {
        level.freefallstartcb = &freefallstartdefault;
    }
    if (!isdefined(level.parachuteopencb)) {
        level.parachuteopencb = &parachuteopendefault;
    }
    if (!isdefined(level.parachutecompletecb)) {
        level.parachutecompletecb = &parachutecompletedefault;
    }
    if (!isdefined(level.parachutetakeweaponscb)) {
        level.parachutetakeweaponscb = &leaveweaponsdefaultfunc;
    }
    if (!isdefined(level.parachuterestoreweaponscb)) {
        level.parachuterestoreweaponscb = &norestoreweaponsdefaultfunc;
    }
    if (!isdefined(level.parachuteprelaststandfunc)) {
        level.parachuteprelaststandfunc = &parachuteprelaststandfunction;
    }
    level.skydivestreamhintdvars = spawnstruct();
    level.skydivestreamhintdvars.streamhintenabled = getdvarint(@"hash_fe5686b5fc4463d4", 1);
    level.skydivestreamhintdvars.xyvelscale_high = getdvarfloat(@"hash_9900614b9e630dcc", 0);
    level.skydivestreamhintdvars.xyvelscale_low = getdvarfloat(@"hash_ff536a80f82c4872", 0);
    level.skydivestreamhintdvars.xyvelscale_maxheight = getdvarfloat(@"hash_8585ab654ea58865", 0);
    level.skydivestreamhintdvars.xylimit = getdvarfloat(@"hash_424b04903c6347b7", 0);
    level.skydivestreamhintdvars.zdrop = getdvarfloat(@"hash_d5f50ecdfdc6c716", 0);
    level.skydivestreamhintdvars.zoffset = getdvarfloat(@"hash_b07928ed107a4cf4", 0);
    level.skydivestreamhintdvars.zvelscale = getdvarfloat(@"hash_9f66821b2aaf39d8", 0);
    level.skydivestreamhintdvars.zlimit = getdvarfloat(@"hash_5ac691c4bd26e73a", 0);
    level.skydivestreamhintdvars.falling_xyratio = getdvarfloat(@"hash_df7bfdbd61db3ed7", 0);
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x828
// Size: 0x251
function startfreefall(falltime, var_eb0c093d4b21e9dd, var_32dcb143b4eb723a, var_928936fd7c1bff02, var_f9eb100d9c645f51, var_c017d2557d7b9c53) {
    self.var_6a984a8887a1a08b = 0;
    if (getdvarint(@"hash_915273f1933ae779", 0)) {
        thread freefallfromplanestatemachine(falltime, var_eb0c093d4b21e9dd, var_32dcb143b4eb723a, var_928936fd7c1bff02, var_f9eb100d9c645f51, var_c017d2557d7b9c53);
        return;
    }
    self endon("death_or_disconnect");
    thread parachutemidairdeathwatcher();
    self skydive_interrupt();
    /#
        if (getdvarint(@"hash_efd5d9204cedd02", 0) == 1) {
            thread function_3c9c50a97447b483();
        }
    #/
    if (!isdefined(var_c017d2557d7b9c53)) {
        var_c017d2557d7b9c53 = 1;
    }
    if (!istrue(level.parachuteinitfinished)) {
        initparachutedvars();
    }
    if (!isdefined(level.dontshootwhileparachuting)) {
        level.dontshootwhileparachuting = 1;
    }
    if (!isdefined(level.freefallstartcb)) {
        level.freefallstartcb = &freefallstartdefault;
    }
    if (!isdefined(level.parachuteopencb)) {
        level.parachuteopencb = &parachuteopendefault;
    }
    if (!isdefined(level.parachutecompletecb)) {
        level.parachutecompletecb = &parachutecompletedefault;
    }
    if (!isdefined(level.parachutetakeweaponscb)) {
        level.parachutetakeweaponscb = &leaveweaponsdefaultfunc;
    }
    if (!isdefined(level.parachuterestoreweaponscb)) {
        level.parachuterestoreweaponscb = &norestoreweaponsdefaultfunc;
    }
    if (!isdefined(falltime)) {
        falltime = 4;
    }
    if (var_c017d2557d7b9c53) {
        self [[ level.parachutetakeweaponscb ]]();
    }
    self [[ level.freefallstartcb ]]();
    if (isparachutegametype()) {
        self setclientomnvar("ui_br_altimeter_state", 1);
    }
    if (!isdefined(var_32dcb143b4eb723a)) {
        self notifyonplayercommand("open_parachute", "+gostand");
    }
    self animscriptsetinputparamreplicationstatus(1);
    if (isdefined(var_928936fd7c1bff02)) {
        self setvelocity(var_928936fd7c1bff02);
    }
    self skydive_beginfreefall();
    if (getdvarint(@"hash_1173d2bfe5fb201c", 1) != 2) {
        self skydive_setforcethirdpersonstatus(1);
    }
    var_19bf98acee238bc1 = namespace_53fc9ddbb516e6e1::function_9d18a22123e54d05("infilParachuteVfx");
    if (namespace_36f464722d326bbe::isBRStyleGameType() && (!istrue(var_f9eb100d9c645f51) || var_19bf98acee238bc1) && istrue(level.var_492c3dce9458c51e)) {
        thread infilparachutevfx(getdvarint(@"hash_96e4167dd77b8cee", 1) == 1 && var_19bf98acee238bc1);
    }
    if (!istrue(var_eb0c093d4b21e9dd)) {
        wait(falltime);
    }
    thread pullchute(var_32dcb143b4eb723a, var_eb0c093d4b21e9dd);
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa80
// Size: 0x1c5
function infilparachutevfx(var_4e5940a26eb12680) {
    player = self;
    level endon("game_ended");
    player endon("disconnect");
    player = self;
    wait(1);
    if (namespace_3c37cb17ade254d::issharedfuncdefined("ftue", "player_action")) {
        player [[ namespace_3c37cb17ade254d::getsharedfunc("ftue", "player_action") ]]("br_ftue_parachute");
    }
    targetstate = "enabled";
    if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.brinfilsmokesuffix)) {
        targetstate = targetstate + self.operatorcustomization.brinfilsmokesuffix;
    }
    player setscriptablepartstate("skydiveVfx", targetstate, 0);
    player setisinfilskydive(1);
    wait(2);
    while (isalive(player) && !player shoulddisableskydivevfx()) {
        wait(0.25);
    }
    if (var_4e5940a26eb12680) {
        while (isalive(player)) {
            var_aa4f5ea34dfe428b = istrue(player.inlaststand);
            var_31c5dac60b438208 = player isonground() || player isswimming() || player function_415fe9eeca7b2e2b();
            var_a2b5f51a86d266ad = player isonladder();
            var_b48e997e59346e83 = !namespace_f8065cafc523dba5::isreallyalive(player);
            binvehicle = player function_793f941d7dff15ed();
            var_15d3f6cdd6f19d4d = player function_9cc921a57ff4deb5();
            if (var_aa4f5ea34dfe428b || var_31c5dac60b438208 || var_a2b5f51a86d266ad || var_b48e997e59346e83 || binvehicle || var_15d3f6cdd6f19d4d) {
                break;
            }
            wait(0.25);
        }
    }
    player setscriptablepartstate("skydiveVfx", "default", 0);
    player setisinfilskydive(0);
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc4c
// Size: 0x93
function riotshield_attach_parachute(var_f8ee3e194415c066, var_a6ef975da2ddff4b) {
    var_8f79d15efb6089c2 = undefined;
    if (var_f8ee3e194415c066) {
        /#
            assertex(!isdefined(self.riotshieldmodel), "riotShield_attach_parachute() called on player with no riot shield model on the arm");
        #/
        self.riotshieldmodel = var_a6ef975da2ddff4b;
        var_8f79d15efb6089c2 = "tag_weapon_right";
    } else {
        /#
            assertex(!isdefined(self.riotshieldmodelstowed), "riotShield_attach_parachute() called on player with no riot shield model stowed");
        #/
        self.riotshieldmodelstowed = var_a6ef975da2ddff4b;
        var_8f79d15efb6089c2 = "tag_shield_back";
    }
    self attachshieldmodel(var_a6ef975da2ddff4b, var_8f79d15efb6089c2);
    self.hasriotshield = riotshield_hasweapon_parachute();
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce6
// Size: 0x8
function riotshield_getmodel_parachute() {
    return "weapon_wm_riotshield";
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf6
// Size: 0x77
function riotshield_hasweapon_parachute() {
    result = 0;
    weaponlist = self getweaponslistprimaries();
    foreach (weapon in weaponlist) {
        if (isriotshield_parachute(weapon)) {
            result = 1;
            break;
        }
    }
    return result;
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd75
// Size: 0x43
function isriotshield_parachute(weapon) {
    if (isweapon(weapon) && isnullweapon(weapon)) {
        return 0;
    }
    if (isstring(weapon) && weapon == "none") {
        return 0;
    }
    return weapontype(weapon) == "riotshield";
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc0
// Size: 0x11c
function isparachutegametype() {
    if (!isdefined(level.gametype)) {
        return 0;
    }
    if (!isdefined(level.isparachutegametype)) {
        level.isparachutegametype = level.gametype == "arm" || level.gametype == "bigctf" || level.gametype == "conflict" || level.gametype == "risk" || level.gametype == "war" || level.gametype == "war_mgl" || level.gametype == "war_mgl" || level.gametype == "missions" || level.gametype == "trial" || level.gametype == "brtdm" || level.gametype == "brtdm_mgl" || level.gametype == "wm";
    }
    return namespace_36f464722d326bbe::isBRStyleGameType() || istrue(level.isparachutegametype);
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xee4
// Size: 0x3f
function getc130height() {
    if (isdefined(level.br_level) && isdefined(level.br_level.c130_heightoverride)) {
        return level.br_level.c130_heightoverride;
    }
    return 24000;
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf2b
// Size: 0x1d
function getc130airdropheight() {
    if (isdefined(level.c130airdrop_heightoverride)) {
        return level.c130airdrop_heightoverride;
    }
    return 24000;
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf50
// Size: 0x3f
function getc130sealevel() {
    if (isdefined(level.br_level) && isdefined(level.br_level.c130_sealeveloverride)) {
        return level.br_level.c130_sealeveloverride;
    }
    return 650;
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf97
// Size: 0x6f
function steerfalling(var_d051bb0593db1e4) {
    var_80e7f25c27613389 = spawn("script_model", self.origin);
    var_80e7f25c27613389.angles = self.angles;
    var_80e7f25c27613389 setmodel("viewhands_base_iw8");
    var_80e7f25c27613389 hide();
    self playerlinktodelta(var_80e7f25c27613389, "tag_player");
    steerfallinginternal(var_80e7f25c27613389, var_d051bb0593db1e4);
    var_80e7f25c27613389 delete();
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x100d
// Size: 0x3a0
function steerfallinginternal(var_80e7f25c27613389, var_d051bb0593db1e4) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("freefall_complete");
    self endon("parachute_complete");
    self notify("steerFalling()");
    self endon("steerFalling()");
    var_aa7a541d584bfb8f = 13.8;
    var_41ba641096fd5e9 = 0.0001;
    var_817beab23f026d04 = -1350;
    var_393260f42c7893cb = 1400;
    var_fa4dfac825a92d66 = 1600;
    var_b16089157712c28d = -100;
    if (level.gametype == "arm" || level.gametype == "conflict" || level.gametype == "risk" || level.gametype == "bigctf") {
        var_817beab23f026d04 = -1750;
        var_393260f42c7893cb = 400;
        var_fa4dfac825a92d66 = 400;
    }
    if (isdefined(var_d051bb0593db1e4)) {
        var_393260f42c7893cb = var_393260f42c7893cb * var_d051bb0593db1e4;
        var_fa4dfac825a92d66 = var_fa4dfac825a92d66 * var_d051bb0593db1e4;
    }
    var_b1da74ce505dd34a = level.framedurationseconds * var_41ba641096fd5e9;
    var_80e7f25c27613389.vel = (0, 0, var_b16089157712c28d);
    waitframe();
    var_948edc0858691623 = getdvarint(@"hash_b5d7d39d32720e78");
    var_5f5f04187af565b0 = (0, 0, 0);
    while (1) {
        var_f619fe4a4e1d4868 = self getnormalizedmovement();
        var_58724d69ca657b30 = var_f619fe4a4e1d4868[0];
        var_58724e69ca657d63 = var_f619fe4a4e1d4868[1];
        playerangles = self getplayerangles(1);
        axisy = anglestoforward(playerangles) * var_58724d69ca657b30;
        axisx = anglestoright(playerangles) * var_58724e69ca657d63;
        var_8c78cdd73a605b74 = axisx + axisy;
        var_c068649575851bdf = vectornormalize(var_8c78cdd73a605b74) * var_fa4dfac825a92d66;
        var_5f5f04187af565b0 = var_5f5f04187af565b0 + vectornormalize(var_c068649575851bdf - var_5f5f04187af565b0) * level.framedurationseconds * var_393260f42c7893cb;
        var_5f5f04187af565b0 = var_5f5f04187af565b0 - var_5f5f04187af565b0 * length(var_5f5f04187af565b0) * var_b1da74ce505dd34a;
        var_e925941037b2689c = var_80e7f25c27613389.vel[2] - var_aa7a541d584bfb8f * 39.37 * level.framedurationseconds;
        var_e925941037b2689c = max(var_817beab23f026d04, var_e925941037b2689c);
        var_3ae149ad9d0d0d54 = (0, 0, var_e925941037b2689c);
        var_80e7f25c27613389.vel = var_3ae149ad9d0d0d54 + var_5f5f04187af565b0;
        var_80e7f25c27613389.origin = var_80e7f25c27613389.origin + level.framedurationseconds * var_80e7f25c27613389.vel;
        var_8f24116d9f017e9a = sqrt(var_80e7f25c27613389.vel[0] * var_80e7f25c27613389.vel[0] + var_80e7f25c27613389.vel[1] * var_80e7f25c27613389.vel[1]);
        var_2c34526903066260 = veltomph(var_80e7f25c27613389.vel[2] * -1);
        var_a356040e48e00766 = veltomph(var_8f24116d9f017e9a);
        var_1b9ab28b471eed2e = min(1, (self.origin[2] - getc130sealevel()) / (getc130height() - getc130sealevel()));
        if (isparachutegametype()) {
            self setclientomnvar("ui_br_altimeter_height", var_1b9ab28b471eed2e);
            self setclientomnvar("ui_br_altimeter_vertical_speed", int(var_2c34526903066260));
            self setclientomnvar("ui_br_altimeter_horizontal_speed", int(var_a356040e48e00766));
        }
        waitframe();
    }
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b4
// Size: 0x1f
function veltomph(v) {
    var_360e0b041df08cac = v * 0.05682;
    return var_360e0b041df08cac;
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13db
// Size: 0x6f
function steerparachuting(var_d051bb0593db1e4) {
    var_80e7f25c27613389 = spawn("script_model", self.origin);
    var_80e7f25c27613389.angles = self.angles;
    var_80e7f25c27613389 setmodel("viewhands_base_iw8");
    var_80e7f25c27613389 hide();
    self playerlinktodelta(var_80e7f25c27613389, "tag_player");
    steerparachutinginternal(var_80e7f25c27613389, var_d051bb0593db1e4);
    var_80e7f25c27613389 delete();
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1451
// Size: 0x4d0
function steerparachutinginternal(var_80e7f25c27613389, var_d051bb0593db1e4) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("freefall_complete");
    self endon("parachute_landed");
    self notify("steerFalling()");
    self endon("steerFalling()");
    var_998fd4b607b8174e = 100;
    var_d86bcc969a419e41 = -200;
    var_d866fe3ebb06e803 = 600;
    var_2eea432f6e468ab2 = 240;
    var_388b5f929fee9772 = 120;
    var_b02d7a2abe83a9ef = 60;
    var_6ad7cb3f09b4c201 = 48;
    maxpitch = 35;
    var_5b1764b1412948fe = 700;
    var_92517cd227297246 = 100;
    var_290f01f649f1e57e = 600;
    var_71bea2cdd6eb1010 = 300;
    var_2afa890495dced11 = 100;
    var_9d628820b95f3bed = -150;
    if (level.gametype == "arm" || level.gametype == "bigctf" || level.gametype == "conflict" || level.gametype == "risk") {
        var_9d628820b95f3bed = -200;
    }
    if (isdefined(var_d051bb0593db1e4)) {
        var_998fd4b607b8174e = var_998fd4b607b8174e * var_d051bb0593db1e4;
        var_d86bcc969a419e41 = var_d86bcc969a419e41 * var_d051bb0593db1e4;
        var_d866fe3ebb06e803 = var_d866fe3ebb06e803 * var_d051bb0593db1e4;
        var_2eea432f6e468ab2 = var_2eea432f6e468ab2 * var_d051bb0593db1e4;
        var_388b5f929fee9772 = var_388b5f929fee9772 * var_d051bb0593db1e4;
        var_b02d7a2abe83a9ef = var_b02d7a2abe83a9ef * var_d051bb0593db1e4;
        var_5b1764b1412948fe = var_5b1764b1412948fe * var_d051bb0593db1e4;
        var_290f01f649f1e57e = var_290f01f649f1e57e * var_d051bb0593db1e4;
        var_71bea2cdd6eb1010 = var_71bea2cdd6eb1010 * var_d051bb0593db1e4;
        var_2afa890495dced11 = var_2afa890495dced11 * var_d051bb0593db1e4;
    }
    var_d7bd29ab98f4f1a2 = 100;
    var_648b9956418a7253 = 0;
    var_924e22db76c21025 = 0;
    var_80e7f25c27613389.vel = (0, 0, 0);
    while (1) {
        var_f619fe4a4e1d4868 = self getnormalizedmovement();
        var_58724d69ca657b30 = var_f619fe4a4e1d4868[0];
        var_58724e69ca657d63 = var_f619fe4a4e1d4868[1];
        playerangles = self getplayerangles(1);
        playerforward = anglestoforward(playerangles);
        playerright = anglestoright(playerangles);
        var_65678a4c23282859 = ter_op(var_58724d69ca657b30 > 0, var_2eea432f6e468ab2, var_388b5f929fee9772);
        var_d7bd29ab98f4f1a2 = var_d7bd29ab98f4f1a2 + var_58724d69ca657b30 * var_65678a4c23282859 * level.framedurationseconds;
        var_d7bd29ab98f4f1a2 = var_d7bd29ab98f4f1a2 + var_b02d7a2abe83a9ef * level.framedurationseconds * sign(var_998fd4b607b8174e - var_d7bd29ab98f4f1a2);
        var_d7bd29ab98f4f1a2 = clamp(var_d7bd29ab98f4f1a2, var_d86bcc969a419e41, var_d866fe3ebb06e803);
        var_82bc834ceac5a4d4 = -1 * var_58724d69ca657b30 * maxpitch;
        var_648b9956418a7253 = var_648b9956418a7253 + sign(var_82bc834ceac5a4d4 - var_648b9956418a7253) * var_6ad7cb3f09b4c201 * level.framedurationseconds;
        var_7677f3eb70b218e0 = rotatepointaroundvector(playerright, playerforward, var_648b9956418a7253);
        var_54e4eab74afe520a = var_d7bd29ab98f4f1a2 * var_7677f3eb70b218e0;
        var_3b93dfd1e0dd8d07 = playerforward * var_2afa890495dced11 + (0, 0, var_9d628820b95f3bed);
        var_924e22db76c21025 = var_924e22db76c21025 + var_290f01f649f1e57e * level.framedurationseconds * var_58724e69ca657d63;
        var_924e22db76c21025 = var_924e22db76c21025 - var_71bea2cdd6eb1010 * level.framedurationseconds * sign(var_924e22db76c21025);
        var_924e22db76c21025 = clamp(var_924e22db76c21025, -1 * var_5b1764b1412948fe, var_5b1764b1412948fe);
        var_bc87083848248be5 = var_924e22db76c21025 * playerright;
        var_c3b8a869a54da74a = var_92517cd227297246 * abs(var_58724e69ca657d63);
        var_bc87083848248be5 = var_bc87083848248be5 + (0, 0, -1 * var_c3b8a869a54da74a);
        var_80e7f25c27613389.vel = var_54e4eab74afe520a + var_bc87083848248be5 + var_3b93dfd1e0dd8d07;
        var_80e7f25c27613389.origin = var_80e7f25c27613389.origin + var_80e7f25c27613389.vel * level.framedurationseconds;
        var_8f24116d9f017e9a = sqrt(var_80e7f25c27613389.vel[0] * var_80e7f25c27613389.vel[0] + var_80e7f25c27613389.vel[1] * var_80e7f25c27613389.vel[1]);
        var_2c34526903066260 = max(0, veltomph(var_80e7f25c27613389.vel[2] * -1));
        var_a356040e48e00766 = max(0, veltomph(var_8f24116d9f017e9a));
        var_1b9ab28b471eed2e = min(1, (self.origin[2] - getc130sealevel()) / (getc130height() - getc130sealevel()));
        if (isparachutegametype()) {
            self setclientomnvar("ui_br_altimeter_height", var_1b9ab28b471eed2e);
            self setclientomnvar("ui_br_altimeter_vertical_speed", int(var_2c34526903066260));
            self setclientomnvar("ui_br_altimeter_horizontal_speed", int(var_a356040e48e00766));
        }
        waitframe();
    }
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1928
// Size: 0x2d
function isskydivestatedisabled() {
    return isdefined(self.ffsm_state) && (self.ffsm_state == 5 || self.ffsm_state == 6);
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x195d
// Size: 0x52
function enablemanualpullchute(waitsec) {
    self endon("death_or_disconnect");
    if (isdefined(waitsec) && waitsec > 0) {
        self skydive_setdeploymentstatus(0);
        self skydive_setbasejumpingstatus(0);
        wait(waitsec);
    }
    if (isdefined(self)) {
        if (isskydivestatedisabled()) {
            return;
        }
        self skydive_setdeploymentstatus(1);
        self skydive_setbasejumpingstatus(1);
    }
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19b6
// Size: 0x7e
function pullchute(var_32dcb143b4eb723a, var_eb0c093d4b21e9dd, var_4a8a64090ddb9c62) {
    self endon("death_or_disconnect");
    thread enablemanualpullchute(3);
    self waittill("skydive_deployparachute");
    self skydive_setdeploymentstatus(0);
    self notify("freefall_complete");
    if (isparachutegametype()) {
        self setclientomnvar("ui_br_altimeter_state", 2);
    }
    if (!istrue(level.dontshootwhileparachuting)) {
        self [[ level.parachuteopencb ]]();
    }
    thread startparachute();
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a3b
// Size: 0x128
function parachutedamagemonitor(parachute) {
    self endon("death_or_disconnect");
    self endon("parachute_complete");
    parachute endon("death");
    parachute setcandamage(1);
    damage = undefined;
    attacker = undefined;
    direction_vec = undefined;
    meansofdeath = undefined;
    modelname = undefined;
    tagname = undefined;
    partname = undefined;
    idflags = undefined;
    objweapon = undefined;
    origin = undefined;
    angles = undefined;
    normal = undefined;
    inflictor = undefined;
    parachute.shotstaken = 0;
    while (1) {
        inflictor = normal = angles = origin = objweapon = idflags = partname = tagname = modelname = meansofdeath = point = direction_vec = attacker = damage = parachute waittill("damage");
        if (isdefined(meansofdeath)) {
            if (isbulletdamage(meansofdeath)) {
                parachute.shotstaken++;
            }
        }
    }
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b6a
// Size: 0xd2
function startparachute() {
    self endon("death_or_disconnect");
    if (getdvarint(@"hash_1173d2bfe5fb201c", 1) == 1) {
        self skydive_setforcethirdpersonstatus(0);
    }
    self waittill("skydive_end");
    self.ignorefalldamagetime = gettime() + 5000;
    if (istrue(self.delayswaploadout)) {
        self.delayswaploadout = 0;
    }
    waitframe();
    self [[ level.parachuterestoreweaponscb ]]();
    if (istrue(level.dontshootwhileparachuting)) {
        self [[ level.parachutecompletecb ]]();
    }
    self notify("parachute_landed");
    self skydive_setforcethirdpersonstatus(0);
    self notify("parachute_complete");
    self animscriptsetinputparamreplicationstatus(0);
    if (isparachutegametype()) {
        self setclientomnvar("ui_br_altimeter_state", 0);
        if (isdefined(level.onfirstlandcallback)) {
            self [[ level.onfirstlandcallback ]](self);
        }
    }
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c43
// Size: 0x28
function parachutemidairdeathwatcher() {
    self endon("parachute_complete");
    self waittill("death");
    if (isparachutegametype()) {
        self setclientomnvar("ui_br_altimeter_state", 0);
    }
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c72
// Size: 0xa
function freefallstartdefault() {
    self disableusability();
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c83
// Size: 0x3
function parachuteopendefault() {
    
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c8d
// Size: 0x2e
function parachutecompletedefault() {
    self enableusability();
    if (isdefined(level.modespecificparachutecompletecb)) {
        self [[ level.modespecificparachutecompletecb ]]();
    }
    self.jumptype = undefined;
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cc2
// Size: 0x8
function getautodeploynorm() {
    return 0.25;
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cd2
// Size: 0xf
function spawnorbitcamera() {
    self cameraset("camera_custom_orbit_0_noremote");
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ce8
// Size: 0xa
function removeorbitcamera() {
    self cameradefault();
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cf9
// Size: 0x3
function leaveweaponsdefaultfunc() {
    
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d03
// Size: 0x3
function norestoreweaponsdefaultfunc() {
    
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d0d
// Size: 0x13a
function takeweaponsdefaultfunc() {
    if (isdefined(self.primaryweaponobj)) {
        self.primaryweaponclipammo = self getweaponammoclip(self.primaryweaponobj);
        self.primaryweaponstockammo = self getweaponammostock(self.primaryweaponobj);
    }
    if (isdefined(self.secondaryweaponobj)) {
        self.secondaryweaponclipammo = self getweaponammoclip(self.secondaryweaponobj);
        self.secondaryweaponstockammo = self getweaponammostock(self.secondaryweaponobj);
    }
    gunless = makeweapon("iw9_me_fists_mp");
    var_f9f3100428a6e476 = makeweapon("none");
    self.weaponlist = self.primaryweapons;
    self clearaccessory();
    if (!self hasweapon(gunless)) {
        namespace_df5cfdbe6e2d3812::_giveweapon(gunless, undefined, undefined, 1);
    }
    for (i = 0; i < self.weaponlist.size; i++) {
        weapon = self.weaponlist[i];
        if (isdefined(weapon) && !issameweapon(gunless, weapon) && !issameweapon(var_f9f3100428a6e476, weapon)) {
            self takeweapon(weapon);
        }
    }
    namespace_df5cfdbe6e2d3812::domonitoredweaponswitch(gunless, 1);
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e4e
// Size: 0x16f
function restoreweaponsdefaultfunc() {
    self takeweapon(self.weaponlist[0]);
    self clearaccessory();
    if (isdefined(self.primaryweaponobj)) {
        namespace_df5cfdbe6e2d3812::_giveweapon(self.primaryweaponobj, undefined, undefined, 0);
        if (isdefined(self.primaryweaponclipammo)) {
            self setweaponammoclip(self.primaryweaponobj, self.primaryweaponclipammo);
            self setweaponammostock(self.primaryweaponobj, self.primaryweaponstockammo);
        }
    }
    if (isdefined(self.secondaryweaponobj)) {
        namespace_df5cfdbe6e2d3812::_giveweapon(self.secondaryweaponobj, undefined, undefined, 1);
        if (isdefined(self.primaryweaponclipammo)) {
            self setweaponammoclip(self.secondaryweaponobj, self.secondaryweaponclipammo);
            self setweaponammostock(self.secondaryweaponobj, self.secondaryweaponstockammo);
        }
    }
    self.weaponlist = self getweaponslistprimaries();
    if (isdefined(self.weaponlist[0])) {
        namespace_df5cfdbe6e2d3812::domonitoredweaponswitch(self.weaponlist[0]);
    }
    if (isdefined(self.weaponlist) && isdefined(self.weaponlist[0])) {
        self.primaryweaponobj = self.weaponlist[0];
    }
    if (isdefined(self.weaponlist) && isdefined(self.weaponlist[1])) {
        self.secondaryweaponobj = self.weaponlist[1];
    }
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fc4
// Size: 0x1eb
function playerwatchforredeploy() {
    level endon("game_ended");
    self endon("disconnect");
    if (utility::iscp()) {
        self endon("death");
    }
    var_1f32658706c07dc8 = getdvarfloat(@"hash_df1a64ca42c9a254", 256);
    var_3c2ee4bed7df269d = 0;
    self.redeployenabled = 1;
    while (1) {
        if (istrue(self.redeployenabled) && !self isonground() && namespace_f8065cafc523dba5::_isalive() && !self isskydiving() && !self islinked() && !istrue(self.carrying)) {
            var_7c999fc0722653c3 = 0;
            switch (getdvarint(@"hash_a6cbd1a7783679d3", 0)) {
            case 0:
                if (var_3c2ee4bed7df269d == 0 && self jumpbuttonpressed()) {
                    var_7c999fc0722653c3 = 1;
                }
                break;
            case 1:
                if (self jumpbuttonpressed() && var_3c2ee4bed7df269d + 500 < gettime()) {
                    var_7c999fc0722653c3 = 1;
                }
                break;
            case 2:
                if (!isdefined(self.doublejumpdetected)) {
                    thread watchfordoublejump();
                }
                if (istrue(self.doublejumpdetected)) {
                    var_7c999fc0722653c3 = 1;
                }
                break;
            default:
                break;
            }
            if (var_7c999fc0722653c3) {
                var_f9cf6c85797f2b98 = utility::groundpos(self.origin);
                var_c14047c4299f9c74 = self.origin[2] - var_f9cf6c85797f2b98[2];
                /#
                    var_1f32658706c07dc8 = getdvarfloat(@"hash_df1a64ca42c9a254", 256);
                #/
                if (var_c14047c4299f9c74 > var_1f32658706c07dc8) {
                    self notify("skydive_deployparachute");
                    self skydive_deployparachute();
                }
            }
        }
        if (isdefined(self) && namespace_f8065cafc523dba5::_isalive()) {
            if (!self jumpbuttonpressed()) {
                var_3c2ee4bed7df269d = 0;
            } else if (var_3c2ee4bed7df269d == 0) {
                var_3c2ee4bed7df269d = gettime();
            }
        } else {
            var_3c2ee4bed7df269d = 0;
        }
        waitframe();
    }
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21b6
// Size: 0xed
function watchfordoublejump() {
    level endon("game_ended");
    self endon("disconnect");
    self.doublejumpdetected = 0;
    while (1) {
        if (self jumpbuttonpressed()) {
            var_e5486d00ebba6e9 = gettime();
            var_2b69ebf1aeb9c653 = 0;
            waitframe();
            while (1) {
                if (!self jumpbuttonpressed()) {
                    if (gettime() < var_e5486d00ebba6e9 + 500 && !self isonground()) {
                        var_2b69ebf1aeb9c653 = gettime();
                    }
                    break;
                }
                if (gettime() > var_e5486d00ebba6e9 + 500) {
                    break;
                }
                waitframe();
            }
            if (var_2b69ebf1aeb9c653 == 0) {
                continue;
            }
            waitframe();
            while (1) {
                if (self jumpbuttonpressed()) {
                    if (gettime() < var_2b69ebf1aeb9c653 + 500 && !self isonground()) {
                        self.doublejumpdetected = 1;
                        waitframe();
                        self.doublejumpdetected = 0;
                    }
                    break;
                }
                if (gettime() > var_2b69ebf1aeb9c653 + 500) {
                    break;
                }
                waitframe();
            }
        }
        waitframe();
    }
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22aa
// Size: 0xde
function function_3c9c50a97447b483() {
    /#
        self endon("brtdm");
        self endon("ftue_trigger_landed_hint");
        while (1) {
            thread drawangles(self.origin, self.angles, 0.05, 5);
            velocity = self getvelocity();
            mag = length(velocity);
            thread drawline(self.origin, self.origin + vectornormalize(velocity) * mag, 0.05, (1, 0, 1));
            printtoscreen2d(750, 800, "<unknown string>" + vectornormalize(velocity), (1, 0, 1), 2);
            printtoscreen2d(750, 825, "<unknown string>" + mag, (1, 0, 1), 2);
            waitframe();
        }
    #/
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x238f
// Size: 0x84
function parachuteprelaststandfunction() {
    player = self;
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        if (isdefined(player.ffsm_state) && (player.ffsm_state == 1 || player.ffsm_state == 2)) {
            player namespace_5078ee98abb32db9::ffsm_landed_stateenter();
            player.ffsm_state = 3;
        }
    } else if (utility::iscp()) {
        player setclientomnvar("ui_br_altimeter_state", 0);
        player namespace_5078ee98abb32db9::ffsm_landed_stateenter(1);
    }
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x241a
// Size: 0x1fb
function updateparachutestreamhint() {
    player = self;
    velocity = player getvelocity();
    var_eac21b0ad618df9d = clamp(player.origin[2], 0, level.skydivestreamhintdvars.xyvelscale_maxheight) / level.skydivestreamhintdvars.xyvelscale_maxheight;
    var_e86082fb50387e1d = level.skydivestreamhintdvars.xyvelscale_low + (level.skydivestreamhintdvars.xyvelscale_high - level.skydivestreamhintdvars.xyvelscale_low) * var_eac21b0ad618df9d;
    var_941cadc9d7b59dc9 = velocity * (1, 1, 0);
    var_9854dc90ee9da402 = length(var_941cadc9d7b59dc9);
    var_cbc44aa5555239a3 = var_941cadc9d7b59dc9 * var_e86082fb50387e1d;
    var_22133650825cd26b = var_9854dc90ee9da402 * var_e86082fb50387e1d;
    if (var_22133650825cd26b > level.skydivestreamhintdvars.xylimit) {
        var_cbc44aa5555239a3 = var_cbc44aa5555239a3 * level.skydivestreamhintdvars.xylimit / var_22133650825cd26b;
    }
    var_81f6dda3fd92e0b4 = 0;
    var_81f6dda3fd92e0b4 = var_81f6dda3fd92e0b4 - player.origin[2] * level.skydivestreamhintdvars.zdrop;
    var_81f6dda3fd92e0b4 = var_81f6dda3fd92e0b4 + level.skydivestreamhintdvars.zoffset;
    var_81f6dda3fd92e0b4 = var_81f6dda3fd92e0b4 + velocity[2] * level.skydivestreamhintdvars.zvelscale;
    var_81f6dda3fd92e0b4 = clamp(var_81f6dda3fd92e0b4, -1 * level.skydivestreamhintdvars.zlimit, 0);
    var_b20b88ebdfc7194f = 1;
    if (var_9854dc90ee9da402 < level.skydivestreamhintdvars.falling_xyratio * velocity[2]) {
        var_b20b88ebdfc7194f = 2;
    }
    player function_670863fc4008c3d8(player.origin + (var_cbc44aa5555239a3[0], var_cbc44aa5555239a3[1], var_81f6dda3fd92e0b4), var_b20b88ebdfc7194f);
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x261c
// Size: 0x363
function freefallfromplanestatemachine(falltime, var_eb0c093d4b21e9dd, var_32dcb143b4eb723a, var_928936fd7c1bff02, var_f9eb100d9c645f51, var_c017d2557d7b9c53) {
    self endon("disconnect");
    level endon("game_ended");
    self notify("freeFallFromPlaneStateMachine");
    self endon("freeFallFromPlaneStateMachine");
    player = self;
    player.ffsm_state = 1;
    player.ffsm_isgulagrespawn = istrue(var_f9eb100d9c645f51);
    player.ffsm_nextstreamhinttime = 0;
    player ffsm_introsetup(falltime, var_eb0c093d4b21e9dd, var_32dcb143b4eb723a, var_928936fd7c1bff02, var_c017d2557d7b9c53);
    player ffsm_skydive_stateenter();
    starttime = gettime();
    while (1) {
        if (player isskydiving() || starttime + 2000 < gettime() || player isskydivestatedisabled()) {
            break;
        }
        waitframe();
    }
    while (1) {
        if (level.skydivestreamhintdvars.streamhintenabled && player.ffsm_nextstreamhinttime < gettime()) {
            player updateparachutestreamhint();
            player.ffsm_nextstreamhinttime = gettime() + 500;
        }
        if (player isinfreefall() && player.ffsm_state != 1) {
            player ffsm_skydive_stateenter();
            player.ffsm_state = 1;
        }
        if (player isparachuting() && player.ffsm_state != 2) {
            player ffsm_parachuteopen_stateenter();
            player.ffsm_state = 2;
        }
        if (!player isskydiving() && player.ffsm_state != 3 && player.ffsm_state != 4 && player.ffsm_state != 6 || player.ffsm_state == 5) {
            player ffsm_landed_stateenter();
            if (player.ffsm_state != 5) {
                player.ffsm_state = 3;
            } else {
                /#
                    assert(player.ffsm_state == 5);
                #/
                player.ffsm_state = 6;
            }
        }
        var_aa4f5ea34dfe428b = istrue(player.inlaststand);
        var_31c5dac60b438208 = (player isonground() || player isswimming() || player function_415fe9eeca7b2e2b()) && (player.ffsm_state == 3 || player isskydivestatedisabled());
        var_a2b5f51a86d266ad = player isonladder();
        var_b48e997e59346e83 = !namespace_f8065cafc523dba5::isreallyalive(player);
        binvehicle = player function_793f941d7dff15ed();
        var_15d3f6cdd6f19d4d = player function_9cc921a57ff4deb5();
        if (var_aa4f5ea34dfe428b || var_31c5dac60b438208 || var_a2b5f51a86d266ad || var_b48e997e59346e83 || binvehicle || var_15d3f6cdd6f19d4d) {
            if (namespace_3c37cb17ade254d::issharedfuncdefined("hud", "ftue_trigger_landed_hint")) {
                player [[ namespace_3c37cb17ade254d::getsharedfunc("hud", "ftue_trigger_landed_hint") ]]();
            }
            player ffsm_onground_stateenter();
            player.ffsm_state = undefined;
            player.ffsm_isgulagrespawn = undefined;
            player.ffsm_nextstreamhinttime = undefined;
            if (var_a2b5f51a86d266ad) {
                player skydive_interrupt();
            }
            return;
        }
        waitframe();
    }
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2986
// Size: 0x17e
function ffsm_introsetup(falltime, var_eb0c093d4b21e9dd, var_32dcb143b4eb723a, var_928936fd7c1bff02, var_c017d2557d7b9c53) {
    /#
        if (getdvarint(@"hash_efd5d9204cedd02", 0) == 1) {
            thread function_3c9c50a97447b483();
        }
    #/
    self skydive_interrupt();
    if (!istrue(level.parachuteinitfinished)) {
        initparachutedvars();
    }
    if (!isdefined(falltime)) {
        falltime = 4;
    }
    if (!isdefined(var_c017d2557d7b9c53)) {
        var_c017d2557d7b9c53 = 1;
    }
    if (var_c017d2557d7b9c53 && !namespace_36f464722d326bbe::isBRStyleGameType()) {
        self [[ level.parachutetakeweaponscb ]]();
    }
    self [[ level.freefallstartcb ]]();
    if (!isdefined(var_32dcb143b4eb723a)) {
        self notifyonplayercommand("open_parachute", "+gostand");
    }
    self animscriptsetinputparamreplicationstatus(1);
    if (isdefined(var_928936fd7c1bff02)) {
        self setvelocity(var_928936fd7c1bff02);
    }
    self skydive_beginfreefall();
    if (getdvarint(@"hash_1173d2bfe5fb201c", 1) != 2) {
        self skydive_setforcethirdpersonstatus(1);
    }
    var_19bf98acee238bc1 = namespace_53fc9ddbb516e6e1::function_9d18a22123e54d05("infilParachuteVfx");
    if (namespace_36f464722d326bbe::isBRStyleGameType() && (!istrue(self.ffsm_isgulagrespawn) || var_19bf98acee238bc1) && istrue(level.var_492c3dce9458c51e)) {
        thread infilparachutevfx(getdvarint(@"hash_96e4167dd77b8cee", 1) == 1 && var_19bf98acee238bc1);
    }
    if (istrue(var_eb0c093d4b21e9dd)) {
        thread enablemanualpullchute(0);
    } else {
        thread enablemanualpullchute(falltime);
    }
    self [[ level.parachuterestoreweaponscb ]]();
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b0b
// Size: 0x84
function ffsm_skydive_stateenter() {
    if (isparachutegametype()) {
        self setclientomnvar("ui_br_altimeter_state", 1);
        level.activeparachuters[self getxuid()] = self;
    }
    if (!self.ffsm_isgulagrespawn) {
        targetstate = "enabled";
        if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.brinfilsmokesuffix)) {
            targetstate = targetstate + self.operatorcustomization.brinfilsmokesuffix;
        }
    }
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b96
// Size: 0x93
function ffsm_parachuteopen_stateenter() {
    self notify("freefall_complete");
    if (isdefined(self.jump_music) && self.jump_music == 1) {
        br_plane_jump_parachute = function_17ee301cf0b5ba85("br_plane_jump_parachute");
        self setplayermusicstate(br_plane_jump_parachute);
        self.jump_music = 0;
    }
    level.activeparachuters[self getxuid()] = self;
    if (isparachutegametype()) {
        self setclientomnvar("ui_br_altimeter_state", 2);
    }
    if (!istrue(level.dontshootwhileparachuting)) {
        self [[ level.parachuteopencb ]]();
    }
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c30
// Size: 0xc1
function ffsm_landed_stateenter(var_83e33c8931d52d73) {
    self.ignorefalldamagetime = gettime() + 5000;
    if (istrue(self.delayswaploadout)) {
        self.delayswaploadout = 0;
    }
    if (istrue(level.dontshootwhileparachuting)) {
        self [[ level.parachutecompletecb ]]();
    }
    self notify("parachute_landed");
    self skydive_setforcethirdpersonstatus(0);
    if (!isskydivestatedisabled()) {
        self skydive_setbasejumpingstatus(1);
    }
    if (istrue(self.restoreriotshieldonland)) {
        riotshield_attach_parachute(self.restoreriotshieldonland == 1, riotshield_getmodel_parachute());
        self.restoreriotshieldonland = undefined;
    }
    level.activeparachuters[self getxuid()] = undefined;
    self notify("parachute_complete");
    self animscriptsetinputparamreplicationstatus(0);
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cf8
// Size: 0x74
function ffsm_onground_stateenter() {
    self.var_6a984a8887a1a08b = 1;
    if (level.skydivestreamhintdvars.streamhintenabled) {
        self clearadditionalstreampos();
    }
    if (isparachutegametype()) {
        level.activeparachuters[self getxuid()] = undefined;
        self setclientomnvar("ui_br_altimeter_state", 0);
        thread playlandingbreath();
        if (isdefined(level.onfirstlandcallback)) {
            self [[ level.onfirstlandcallback ]](self);
        }
    }
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d73
// Size: 0x52
function playlandingbreath() {
    self endon("death_or_disconnect");
    wait(0.3);
    if (issharedfuncdefined("player", "isReallyAlive")) {
        if ([[ namespace_3c37cb17ade254d::getsharedfunc("player", "isReallyAlive") ]](self)) {
            self playlocalsound("plr_breath_land_parachute", self);
            self playsoundonmovingent("breath_land_parachute_npc");
        }
    }
}

// Namespace parachute/namespace_5078ee98abb32db9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dcc
// Size: 0x36
function parachutecleanup() {
    player = self;
    player skydive_interrupt();
    if (isdefined(player.parachute)) {
        player.parachute delete();
    }
}

