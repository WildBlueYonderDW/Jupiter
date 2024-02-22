// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_cbb0697de4c5728;
#using scripts\engine\trace.gsc;

#namespace namespace_e47104b48662385b;

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b4
// Size: 0x8e
function getstancecenter() {
    if (self getstance() == "crouch") {
        center = self.origin + 0.5 * (0, 0, 48);
    } else if (self getstance() == "prone") {
        center = self.origin + 0.5 * (0, 0, 20);
    } else {
        center = self.origin + 0.5 * (0, 0, 64);
    }
    return center;
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64a
// Size: 0x94
function getstancetop(var_2eea482c1a2f43a9) {
    var_6497396fb64ea3b9 = self getstance();
    if (isdefined(var_2eea482c1a2f43a9)) {
        var_6497396fb64ea3b9 = var_2eea482c1a2f43a9;
    }
    if (var_6497396fb64ea3b9 == "crouch") {
        top = self.origin + (0, 0, 48);
    } else if (var_6497396fb64ea3b9 == "prone") {
        top = self.origin + (0, 0, 20);
    } else {
        top = self.origin + (0, 0, 64);
    }
    return top;
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e6
// Size: 0x33
function _isalive() {
    return isalive(self) && !isdefined(self.fauxdead) && !istrue(self.delayedspawnedplayernotify) && !istrue(self.liveragdoll);
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x721
// Size: 0x33
function setusingremote(remotename) {
    if (issharedfuncdefined("player", "setUsingRemote")) {
        [[ getsharedfunc("player", "setUsingRemote") ]](remotename);
    }
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75b
// Size: 0x33
function clearusingremote(var_2c111f02d48e2671) {
    if (issharedfuncdefined("player", "clearUsingRemote")) {
        [[ getsharedfunc("player", "clearUsingRemote") ]](var_2c111f02d48e2671);
    }
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x795
// Size: 0x50
function function_1e4a0e61fdb00e32(player) {
    if (issharedfuncdefined("player", "isOOB")) {
        return [[ getsharedfunc("player", "isOOB") ]](player);
    }
    return isdefined(player.oob) && player.oob > 0;
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ed
// Size: 0x86
function isenemy(other) {
    if (level.teambased) {
        if (isdefined(other.team) && isdefined(self.team)) {
            return (other.team != self.team);
        } else {
            /#
                assertmsg("Team based modes should have .team on all players and agents.");
            #/
            return 1;
        }
    } else if (isdefined(other.owner)) {
        return (other.owner != self);
    } else {
        return (other != self);
    }
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87a
// Size: 0x62
function isinvehicle(var_a24a6968cfc1c46d) {
    if (isdefined(self.vehicle) && isdefined(self.vehicle.vehiclename)) {
        return 1;
    }
    if (istrue(var_a24a6968cfc1c46d)) {
        if (isdefined(self.vehiclereserved) && isdefined(self.vehiclereserved.vehiclename)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e4
// Size: 0x32
function getvehicle(var_3fcd58f5bae3bd0) {
    if (isinvehicle()) {
        return self.vehicle;
    } else if (istrue(var_3fcd58f5bae3bd0)) {
        return self.var_abd157413ac4e022;
    }
    return undefined;
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x91e
// Size: 0x3d
function function_f8789f15330de751(player) {
    if (!isdefined(player) || isbot(player) || isagent(player)) {
        return 0;
    }
    return istrue(player isinvehicle(1)) || isdefined(player getmovingplatformparent());
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x963
// Size: 0x110
function getteamarray(team, var_dcc07fcc8a9beb59) {
    teamarray = [];
    if (!isdefined(var_dcc07fcc8a9beb59) || var_dcc07fcc8a9beb59) {
        foreach (player in level.characters) {
            if (isdefined(player.team) && player.team == team) {
                teamarray[teamarray.size] = player;
            }
        }
    } else {
        foreach (player in level.players) {
            if (isdefined(player.team) && player.team == team) {
                teamarray[teamarray.size] = player;
            }
        }
    }
    return teamarray;
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa7b
// Size: 0x45
function _freezecontrols(frozen, force, debug) {
    if (issharedfuncdefined("player", "freezeControls")) {
        return [[ getsharedfunc("player", "freezeControls") ]](frozen, force, debug);
    }
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xac7
// Size: 0x29
function function_8213d31f7a3c32e2() {
    if (issharedfuncdefined("player", "freezeControlsDebug")) {
        return [[ getsharedfunc("player", "freezeControlsDebug") ]]();
    }
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf7
// Size: 0x3c
function _freezelookcontrols(frozen, force) {
    if (issharedfuncdefined("player", "freezeLookControls")) {
        return [[ getsharedfunc("player", "freezeLookControls") ]](frozen, force);
    }
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb3a
// Size: 0x1c
function function_82f44f5f304ba91a(enabled) {
    function_f2c3ee9fded6a3df(enabled);
    function_cb6c6cd4245c5551(enabled);
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb5d
// Size: 0x30
function function_f2c3ee9fded6a3df(enabled) {
    self allowmovement(!enabled);
    self allowprone(!enabled);
    self allowjump(!enabled);
    self allowmelee(!enabled);
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb94
// Size: 0x1c
function function_cb6c6cd4245c5551(enabled) {
    self freezecontrols(enabled);
    self freezelookcontrols(enabled);
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb7
// Size: 0x3f
function getplayersuperfaction(player) {
    var_a67aa6a470ceeb29 = 0;
    if (isdefined(player.operatorcustomization)) {
        var_a67aa6a470ceeb29 = player.operatorcustomization.superfaction;
    }
    return var_a67aa6a470ceeb29;
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbfe
// Size: 0x4d
function setthermalvision(bool, fstop, focusdistance) {
    if (istrue(bool)) {
        self enablephysicaldepthoffieldscripting();
        self setphysicaldepthoffield(fstop, focusdistance, 20, 20);
        self thermalvisionon();
    } else {
        self disablephysicaldepthoffieldscripting();
        self thermalvisionoff();
    }
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc52
// Size: 0x85
function watchthermalinputchange(var_2153d566f8b7319a) {
    self notify("watch_thermal_input_change");
    self endon("watch_thermal_input_change");
    self endon("disconnect");
    while (1) {
        var_ff8e235b01cd7409 = getthermalswitchplayercommand(var_2153d566f8b7319a);
        self notifyonplayercommand("switch_thermal_mode", var_ff8e235b01cd7409);
        var_fd99cc32b0ac87b4 = waittill_any_return_no_endon_death_2("input_type_changed", "thermal_handling_ended");
        self notifyonplayercommandremove("switch_thermal_mode", var_ff8e235b01cd7409);
        if (!isdefined(var_fd99cc32b0ac87b4) || var_fd99cc32b0ac87b4 == "thermal_handling_ended") {
            break;
        }
    }
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcde
// Size: 0xb
function stopwatchingthermalinputchange() {
    self notify("thermal_handling_ended");
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf0
// Size: 0x44
function updateinputtypewatcher() {
    var_51ec07dc533464b5 = is_player_gamepad_enabled();
    if (!isdefined(self.gamepadwasenabled) || self.gamepadwasenabled != var_51ec07dc533464b5) {
        self notify("input_type_changed", var_51ec07dc533464b5);
        self.gamepadwasenabled = var_51ec07dc533464b5;
    }
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd3b
// Size: 0x2b
function getthermalswitchplayercommand(var_2153d566f8b7319a) {
    if (is_player_gamepad_enabled()) {
        if (istrue(var_2153d566f8b7319a)) {
            return "+stance";
        }
        return "+gostand";
    }
    return "nightvision";
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd6e
// Size: 0x3c
function enabledemeanorsafe() {
    if (!isdefined(self.demeanorsafeenabled)) {
        self.demeanorsafeenabled = 0;
    }
    self.demeanorsafeenabled++;
    if (self.demeanorsafeenabled == 1) {
        forcedemeanorsafe(1);
    }
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdb1
// Size: 0x54
function disabledemeanorsafe() {
    /#
        assertex(isdefined(self.demeanorsafeenabled) && self.demeanorsafeenabled > 0, "disableDemeanorSafe called more times than enableDemeanorSafe.");
    #/
    self.demeanorsafeenabled--;
    if (self.demeanorsafeenabled == 0) {
        self.demeanorsafeenabled = undefined;
        forcedemeanorsafe(0);
    }
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe0c
// Size: 0x4a
function forcedemeanorsafe(bool) {
    if (bool && self getdemeanorviewmodel() != "safe") {
        thread forcedemeanorsafeinteral(bool);
    } else if (!bool && self getdemeanorviewmodel() == "safe") {
        thread forcedemeanorsafeinteral(bool);
    }
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe5d
// Size: 0xb4
function forcedemeanorsafeinteral(bool) {
    self endon("death_or_disconnect");
    self notify("forceDemeanorSafeInteral");
    self endon("forceDemeanorSafeInteral");
    var_e71278c78bf4be92 = self issprinting();
    if (!istrue(self.demeanorsprintdisable)) {
        val::set("forceDemeanor", "sprint", 0);
        self.demeanorsprintdisable = 1;
    }
    if (var_e71278c78bf4be92) {
        wait(0.5);
    }
    if (bool) {
        self setdemeanorviewmodel("safe", "iw8_ges_demeanor_safe");
    } else {
        self setdemeanorviewmodel("normal");
    }
    wait(0.5);
    if (istrue(self.demeanorsprintdisable)) {
        val::function_c9d0b43701bdba00("forceDemeanor");
        self.demeanorsprintdisable = undefined;
    }
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf18
// Size: 0x17
function cleardemeanorsafe() {
    self.demeanorsafeenabled = undefined;
    self.demeanorsprintdisable = undefined;
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf36
// Size: 0xea
function playersareenemies(firstplayer, var_204da528aa0a3464, var_b2b9b3d299fbaeb1) {
    if (!isdefined(firstplayer) || !isdefined(var_204da528aa0a3464)) {
        return 0;
    }
    if (!isdefined(firstplayer.team) || !isdefined(var_204da528aa0a3464.team)) {
        return 0;
    }
    if (level.teambased) {
        var_8b1b7044e27e6a56 = firstplayer.team == var_204da528aa0a3464.team;
        if (istrue(var_b2b9b3d299fbaeb1)) {
            var_a64bc29810299920 = 0;
            if (isdefined(firstplayer.var_b5091efefe8e436b) && isdefined(var_204da528aa0a3464.var_b5091efefe8e436b) && firstplayer.var_b5091efefe8e436b != "none") {
                var_a64bc29810299920 = firstplayer.var_b5091efefe8e436b == var_204da528aa0a3464.var_b5091efefe8e436b;
            }
            return (!var_8b1b7044e27e6a56 && !var_a64bc29810299920);
        }
        return !var_8b1b7044e27e6a56;
    } else {
        return (firstplayer != var_204da528aa0a3464);
    }
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1027
// Size: 0x1d
function getteamindex(teamname) {
    return level.teamdata[teamname]["index"];
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x104c
// Size: 0x9
function playerbloodrestricted() {
    return utility::iswegameplatform();
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x105d
// Size: 0xd
function initdismembermentlist() {
    level.playerswithoutdismemberment = [];
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1071
// Size: 0x36
function addtodismembermentlist() {
    /#
        assertex(isdefined(level.playerswithoutdismemberment), "addToDismembermentList called before initDismembermentList.");
    #/
    if (!self isdismembermentenabledforplayer()) {
        level.playerswithoutdismemberment[self getxuid()] = self;
    }
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ae
// Size: 0x2b
function removefromdismembermentlist() {
    /#
        assertex(isdefined(level.playerswithoutdismemberment), "removeFromDismembermentList called before initDismembermentList.");
    #/
    level.playerswithoutdismemberment[self getxuid()] = undefined;
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e0
// Size: 0xc
function getdismembermentlist() {
    return level.playerswithoutdismemberment;
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f4
// Size: 0x39
function function_305fb8c759fa4de5() {
    if (!isdefined(self.var_5b98a9fa81294730)) {
        self.var_5b98a9fa81294730 = 0;
    }
    if (self.var_5b98a9fa81294730 == 0) {
        function_a593971d75d82113();
    }
    self.var_5b98a9fa81294730++;
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1134
// Size: 0x2b
function function_a593971d75d82113(var_1fffb4c6d7b458a3) {
    namespace_46e942396566f2da::function_112e56b7dbe18137();
    if (istrue(var_1fffb4c6d7b458a3)) {
        self playerhide(1);
    } else {
        self playerhide();
    }
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1166
// Size: 0x3e
function function_379bb555405c16bb(reason) {
    if (getdvarint(@"hash_b5fe5be1cf552f2e", 0) == 0) {
        return;
    }
    logprint("PlayerHide(): " + reason);
    /#
        println("addToDismembermentList called before initDismembermentList." + reason);
    #/
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11ab
// Size: 0x62
function function_f81e91f54bddaf46() {
    /#
        assertex(isdefined(self.var_5b98a9fa81294730) && self.var_5b98a9fa81294730 > 0, "_playerShow called when player is not hidden.");
    #/
    if (self.var_5b98a9fa81294730 == 1) {
        function_6fb380927695ee76();
    }
    self.var_5b98a9fa81294730--;
    if (self.var_5b98a9fa81294730 == 0) {
        self.var_5b98a9fa81294730 = undefined;
    }
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1214
// Size: 0x2b
function function_6fb380927695ee76(var_1fffb4c6d7b458a3) {
    if (istrue(var_1fffb4c6d7b458a3)) {
        self playershow(1);
    } else {
        self playershow();
    }
    namespace_46e942396566f2da::function_33637806fc5ac024();
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1246
// Size: 0x3e
function function_985b0973f29da4f8(reason) {
    if (getdvarint(@"hash_11b8360f35c60d6f", 0) == 0) {
        return;
    }
    logprint("PlayerShow(): " + reason);
    /#
        println("Undefined deathPos for death ragdoll 3rd person camera." + reason);
    #/
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x128b
// Size: 0x45
function function_c28310e3b33872cb() {
    self.var_5b98a9fa81294730 = undefined;
    if (!isdefined(level.var_61a823f67a0cb19f)) {
        level.var_61a823f67a0cb19f = getdvarint(@"hash_e6a081201f8d6465", 0);
    }
    if (level.var_61a823f67a0cb19f) {
        self playershow();
    }
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12d7
// Size: 0x42
function isreallyalive(player) {
    return isalive(player) && !isdefined(player.fauxdead) && !istrue(player.delayedspawnedplayernotify) && !istrue(player.liveragdoll);
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1321
// Size: 0x39
function function_eba2f2e094684b8f(perk) {
    if (issharedfuncdefined("perk", "hasPerk")) {
        return self [[ getsharedfunc("perk", "hasPerk") ]](perk);
    } else {
        return 0;
    }
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1361
// Size: 0x42
function isfemale() {
    return isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.gender) && self.operatorcustomization.gender == "female";
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ab
// Size: 0x13
function function_988138367c74b1f5() {
    return self isswimming() && self function_6f55d55ccff20d14();
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13c6
// Size: 0x13
function function_d474b372046544b0() {
    return self isswimming() && !self function_6f55d55ccff20d14();
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e1
// Size: 0x2d
function playplayerandnpcsounds(player, var_1cab65da5c44046f, var_81e52266244f7216) {
    player playlocalsound(var_1cab65da5c44046f);
    player playsound(var_81e52266244f7216, player);
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1415
// Size: 0x104
function function_f7348e400b4a608d(player, var_3be15d8ad8b7024d, priority, var_d072d3a2581e3699) {
    if (!isdefined(player) || isbot(player) || isagent(player)) {
        return;
    }
    if (!isdefined(player.var_82b2c97dad24de07)) {
        player.var_82b2c97dad24de07 = spawnstruct();
        player.var_82b2c97dad24de07.asset = var_3be15d8ad8b7024d;
        player.var_82b2c97dad24de07.priority = priority;
    } else if (istrue(var_d072d3a2581e3699) || !isdefined(player.var_82b2c97dad24de07.priority) || player.var_82b2c97dad24de07.priority <= priority) {
        player.var_82b2c97dad24de07.asset = var_3be15d8ad8b7024d;
        player.var_82b2c97dad24de07.priority = priority;
    } else {
        return;
    }
    player setcinematicmotionoverride(var_3be15d8ad8b7024d);
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1520
// Size: 0x67
function function_56d83cde22535f96(player) {
    if (!isdefined(player) || isbot(player) || isagent(player)) {
        return;
    }
    player clearcinematicmotionoverride();
    if (isdefined(player.var_82b2c97dad24de07)) {
        player.var_82b2c97dad24de07.asset = undefined;
        player.var_82b2c97dad24de07.priority = undefined;
    }
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x158e
// Size: 0xe4
function printspawnmessage(message) {
    /#
        if (getdvarint(@"hash_da3b86849f785e06", 0) == 1) {
            println("player::updateSessionState() " + gettime() + "physicscontents_characterproxy" + self.name + "hittype_none" + message);
            println("isFriendlyTeam argument 2 is not defined" + self.sessionstate);
            println("<unknown string>" + self.origin);
            if (isdefined(self.forcedspawncameraref)) {
                println("<unknown string>" + self.forcedspawncameraref);
            }
            if (isdefined(self.spawncameraent)) {
                println("<unknown string>" + self.spawncameraent.origin);
                println("<unknown string>" + self.spawncameraent.angles);
            }
        }
    #/
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1679
// Size: 0x65
function function_7a8a04d15ad052d5() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("spawned");
    if (level.killcam) {
        while (!isdefined(self.var_7c813e50ff75be27)) {
            waitframe();
        }
        if (level.killcam && istrue(self.killcam)) {
            waittill_any_3("killcam_ended", "killcam_canceled", "abort_killcam");
        }
    }
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16e5
// Size: 0x75
function function_fdff38028c016239() {
    self endon("disconnect");
    /#
        assert(istrue(self.liveragdoll));
    #/
    var_a92e3d2ff7af10c9 = function_6d606d81ea9ab50b(0, 0);
    self.var_7c813e50ff75be27 = undefined;
    wait(getdvarfloat(@"hash_ac849f1ec300d19c", 1.75));
    function_7a8a04d15ad052d5();
    self allowspectateteam(self.team, 1);
    self cameraunlink();
    var_a92e3d2ff7af10c9 delete();
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1761
// Size: 0xc6
function function_6d606d81ea9ab50b(var_81aa39b3e585cd66, var_d198b30dc157c5cd) {
    if (!isdefined(var_81aa39b3e585cd66)) {
        var_81aa39b3e585cd66 = 0;
    }
    var_379de5a38f0e582a = function_d93211a15c000cd(self, self.attacker, var_d198b30dc157c5cd);
    if (!isdefined(var_379de5a38f0e582a)) {
        return undefined;
    }
    var_a92e3d2ff7af10c9 = spawn("script_model", var_379de5a38f0e582a.origin);
    var_a92e3d2ff7af10c9 setmodel("tag_origin");
    var_a92e3d2ff7af10c9.angles = var_379de5a38f0e582a.angles;
    var_a92e3d2ff7af10c9.data = var_379de5a38f0e582a;
    playermover = self getmovingplatformparent();
    if (isdefined(playermover)) {
        var_a92e3d2ff7af10c9 linkto(playermover);
    }
    self allowspectateallteams(0);
    self cameralinkto(var_a92e3d2ff7af10c9, "tag_origin", 1, var_81aa39b3e585cd66);
    return var_a92e3d2ff7af10c9;
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x182f
// Size: 0x286
function function_d93211a15c000cd(victim, attacker, var_d198b30dc157c5cd) {
    /#
        assert(isdefined(victim) && isent(victim));
    #/
    /#
        assert(isdefined(attacker) && isent(attacker));
    #/
    deathpos = undefined;
    if (isdefined(victim.origin)) {
        deathpos = victim.origin;
    } else if (isdefined(victim.lastdeathpos)) {
        deathpos = victim.lastdeathpos;
    }
    if (!isdefined(deathpos)) {
        logstring("Undefined deathPos for death ragdoll 3rd person camera.");
        return undefined;
    }
    if (victim == attacker) {
        forwardvector = anglestoforward(victim.angles);
        forwardvector = function_767cea82b001f645(forwardvector);
    } else {
        forwardvector = vectornormalize(deathpos - attacker.origin);
    }
    baseangles = generateaxisanglesfromforwardvector(forwardvector, (0, 0, 1));
    var_12b614f64a9ba025 = deathpos + (0, 0, 12);
    var_ac59002aa0721741 = 200;
    var_eff05a57ce34e3ea = 30;
    var_519305604d8e28e4 = 360 / var_eff05a57ce34e3ea;
    var_6095efe86105e553 = [];
    for (i = 0; i < var_519305604d8e28e4; i++) {
        var_58f17fbb36dc3c08 = anglestoforward(baseangles + (0, var_eff05a57ce34e3ea * i, 0));
        startposition = deathpos + (0, 0, 12);
        endposition = deathpos + var_58f17fbb36dc3c08 * var_ac59002aa0721741 + (0, 0, 150);
        trace = namespace_2a184fc4902783dc::sphere_trace(startposition, endposition, 2, [0:victim, 1:attacker]);
        if (isdefined(trace) && trace["fraction"] > 0.99) {
            var_6095efe86105e553[var_6095efe86105e553.size] = trace["position"];
            if (!istrue(var_d198b30dc157c5cd)) {
                break;
            }
        }
    }
    if (var_6095efe86105e553.size > 0) {
        var_12b614f64a9ba025 = var_6095efe86105e553[0];
    }
    victimdirection = vectornormalize(deathpos - var_12b614f64a9ba025);
    var_379de5a38f0e582a = spawnstruct();
    var_379de5a38f0e582a.origin = var_12b614f64a9ba025;
    var_379de5a38f0e582a.angles = vectortoangles(victimdirection);
    var_379de5a38f0e582a.distance = var_ac59002aa0721741;
    var_379de5a38f0e582a.var_6095efe86105e553 = var_6095efe86105e553;
    return var_379de5a38f0e582a;
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1abd
// Size: 0x1da
function updatesessionstate(sessionstate, statusicon) {
    /#
        assert(sessionstate == "playing" || sessionstate == "dead" || sessionstate == "spectator" || sessionstate == "intermission" || sessionstate == "playing_but_spectating");
    #/
    ui_session_state = sessionstate;
    if (istrue(self.liveragdoll)) {
        if (self.sessionstate == "playing_but_spectating" && (sessionstate == "dead" || sessionstate == "spectator")) {
            printspawnmessage("player::updateSessionState() didn't not update because we are in liveRagdoll");
            return;
        }
        if (sessionstate == "playing_but_spectating") {
            ui_session_state = "spectator";
            if (getdvarint(@"hash_f47d7bfe207dc431", 1) == 0) {
                thread function_fdff38028c016239();
            }
        }
    }
    switch (sessionstate) {
    case #"hash_6e223a17d0eb5015":
    case #"hash_7135993aa112803d":
        statusicon = "";
        break;
    case #"hash_9430ae82e6671e2a":
    case #"hash_cf14c509efeb3c87":
        if (istrue(level.var_286c2c7b34d03b04)) {
            statusicon = "";
        } else if (istrue(level.numlifelimited)) {
            if (istrue(self.tagavailable)) {
                statusicon = "hud_status_dogtag";
            } else if (istrue(self.revivetriggeravailable)) {
                if (isdefined(self.statusicon) && self.statusicon == "hud_status_revive_or") {
                    statusicon = "hud_status_revive_or";
                } else {
                    statusicon = "hud_status_revive_wh";
                }
            } else {
                statusicon = "hud_status_dead";
            }
        } else {
            statusicon = "hud_status_dead";
        }
        break;
    }
    if (!isdefined(statusicon)) {
        statusicon = "";
    }
    self.sessionstate = sessionstate;
    self.statusicon = statusicon;
    self setclientomnvar("ui_session_state", ui_session_state);
    printspawnmessage("player::updateSessionState() " + sessionstate);
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c9e
// Size: 0x49
function clearkillcamstate() {
    self.forcespectatorclient = -1;
    self.killcamentity = -1;
    self.archivetime = 0;
    self.archiveusepotg = 0;
    self.psoffsettime = 0;
    self.spectatekillcam = 0;
    thread function_c5a5b36868d0a68e();
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1cee
// Size: 0x62
function private function_c5a5b36868d0a68e() {
    self endon("disconnect");
    self notify("reset_killcam_player");
    self endon("reset_killcam_player");
    wait(0.05);
    restorepitch = 0;
    var_3091aada55546bfe = 0;
    var_7500ec3e41c123ab = self getplayerangles();
    var_aca8796e2dfc14c8 = var_7500ec3e41c123ab[1];
    self setplayerangles((restorepitch, var_aca8796e2dfc14c8, var_3091aada55546bfe));
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d57
// Size: 0x224
function getplayersinradius(origin, radius, var_beb392bbb338d308, var_24ee99fa6d091c2a) {
    if (radius <= 0) {
        return [];
    }
    var_2649564eba242b56 = undefined;
    if (isdefined(var_24ee99fa6d091c2a)) {
        if (isarray(var_24ee99fa6d091c2a)) {
            var_2649564eba242b56 = var_24ee99fa6d091c2a;
        } else {
            var_2649564eba242b56 = [0:var_24ee99fa6d091c2a];
        }
    }
    results = physics_querypoint(origin, radius, physics_createcontents([0:"physicscontents_characterproxy"]), var_2649564eba242b56, "physicsquery_all");
    var_815aae0bd650b698 = [];
    if (!isdefined(var_beb392bbb338d308)) {
        foreach (result in results) {
            e = result["entity"];
            if (isplayer(e)) {
                var_815aae0bd650b698[var_815aae0bd650b698.size] = e;
            }
        }
    } else {
        foreach (result in results) {
            e = result["entity"];
            if (isplayer(e) && isdefined(e.team) && e.team == var_beb392bbb338d308) {
                var_815aae0bd650b698[var_815aae0bd650b698.size] = e;
            }
        }
    }
    /#
        if (getdvarint(@"hash_500c5c1476d28421", 0) > 0) {
            var_a3f2a72292d7314 = 60;
            sphere(origin, radius, (1, 1, 1), 0, var_a3f2a72292d7314);
            foreach (player in var_815aae0bd650b698) {
                sphere(player.origin, 10, (1, 0, 0), 1, var_a3f2a72292d7314);
            }
        }
    #/
    return var_815aae0bd650b698;
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f83
// Size: 0xd0
function function_a104c06453297036(player, ignoreents, contentoverride) {
    contents = namespace_2a184fc4902783dc::create_default_contents();
    if (isdefined(contentoverride)) {
        if (isarray(contentoverride)) {
            contentoverride = physics_createcontents(contentoverride);
        }
        contents = contentoverride;
    }
    starttrace = player getvieworigin();
    if (player getcamerathirdperson()) {
        starttrace = player getcamerathirdpersonorigin();
    }
    endtrace = starttrace + anglestoforward(player getplayerangles()) * 20000;
    trace = namespace_2a184fc4902783dc::ray_trace(starttrace, endtrace, ignoreents, contentoverride);
    endpos = undefined;
    if (isdefined(trace["hittype"]) && trace["hittype"] != "hittype_none") {
        endpos = trace["position"];
    }
    return endpos;
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x205b
// Size: 0x7e
function _visionsetnaked(visionset, time) {
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (isai(player)) {
            continue;
        }
        player visionsetnakedforplayer(visionset, time);
    }
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x20e1
// Size: 0x86
function waittillrecoveredhealth(time, interval) {
    self endon("death_or_disconnect");
    fullhealthtime = 0;
    if (!isdefined(interval)) {
        interval = 0.05;
    }
    if (!isdefined(time)) {
        time = 0;
    }
    while (1) {
        if (self.health != self.maxhealth) {
            fullhealthtime = 0;
        } else {
            fullhealthtime = fullhealthtime + interval;
        }
        wait(interval);
        if (self.health == self.maxhealth && fullhealthtime >= time) {
            break;
        }
    }
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x216f
// Size: 0x40
function hidehudenable() {
    if (!isdefined(self.ui_hudhidden)) {
        self.hidehudenabled = 0;
    }
    if (self.hidehudenabled == 0) {
        self setclientomnvar("ui_hide_hud", 1);
    }
    self.hidehudenabled++;
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21b6
// Size: 0x50
function hidehuddisable() {
    /#
        assert(isdefined(self.hidehudenabled) && self.hidehudenabled > 0, "hideHudDisable called when hud is not hidden.");
    #/
    if (self.hidehudenabled == 1) {
        self setclientomnvar("ui_hide_hud", 0);
    }
    self.hidehudenabled--;
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x220d
// Size: 0x1a
function hidehudclear() {
    self.hidehudenabled = undefined;
    self setclientomnvar("ui_hide_hud", 0);
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x222e
// Size: 0x28
function function_b7869f6d9d4242e3(reviver) {
    return istrue(reviver.revivingteammate) && !istrue(reviver.var_383e041e3e341315);
}

// Namespace namespace_e47104b48662385b/namespace_f8065cafc523dba5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x225e
// Size: 0x62
function isfriendly(var_da8cec9bce12f9cb, var_c4b81997f0120a97) {
    /#
        assertex(isdefined(var_c4b81997f0120a97), "isFriendlyTeam argument 2 is not defined");
    #/
    if (!level.teambased) {
        return 0;
    }
    if (!isplayer(var_c4b81997f0120a97) && !isdefined(var_c4b81997f0120a97.team)) {
        return 0;
    }
    if (var_da8cec9bce12f9cb != var_c4b81997f0120a97.team) {
        return 0;
    }
    return 1;
}

