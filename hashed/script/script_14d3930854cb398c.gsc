// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\teamrevive.gsc;
#using script_58be75c518bf0d40;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\tweakables.gsc;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using script_3ff084f114b7f6c9;
#using script_451a1a9bd9613164;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\engine\scriptable.gsc;
#using script_448ef4d9e70ce5e;
#using script_1174abedbefe9ada;
#using script_1b1a05843f74cfa9;
#using scripts\mp\utility\lower_message.gsc;
#using script_1f97a44d1761c919;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using script_396a814d39e7044f;
#using scripts\mp\utility\points.gsc;
#using script_188008b85f8b14d4;
#using scripts\mp\gametypes\br_respawn.gsc;
#using script_5307834cd39b435c;
#using script_6a5d3bf7a5b7064a;
#using scripts\mp\playerlogic.gsc;
#using scripts\cp_mp\execution.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using script_a34750d17473c49;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\cp_mp\utility\omnvar_utility.gsc;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using scripts\mp\utility\trigger.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_3314add7998ab13;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\gametypes\br_dev.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;

#namespace namespace_aca170e0fe882d77;

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89c
// Size: 0x2f5
function init() {
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        namespace_71073fa38f11492::enablefeature("pleaForHelp");
    }
    var_cc0d5a1e8a904e5c = issharedfuncdefined("teamAssim", "isEnabled") && [[ getsharedfunc("teamAssim", "isEnabled") ]]();
    /#
        assert(var_cc0d5a1e8a904e5c, "Team Assimilation must be enabled for Plea for Help feature to function properly.");
    #/
    level.laststand = namespace_775507ba36294dfb::gettweakablevalue("player", "laststand");
    setomnvar("ui_last_stand_type", level.laststand);
    level.liveragdollrevive = getmatchrulesdata("commonOption", "liveRagdollRevive");
    registersharedfunc("pleaForHelp", "isEnabled", &function_4db915a9ce0e903a);
    registersharedfunc("pleaForHelp", "callForHelp", &callforhelp);
    registersharedfunc("pleaForHelp", "isPleading", &ispleading);
    registersharedfunc("pleaForHelp", "UpdatePlayerPleaForAll", &updateplayerpleaforall);
    registersharedfunc("pleaForHelp", "deletePleasFromTeam", &deletepleasfromteam);
    registersharedfunc("ping", "calloutMarkerPing_markerAdded", &function_816b58482c18b840);
    /#
        level thread function_ae60e43aa67248ec();
    #/
    namespace_f1d40c362677777e::registerondisconnecteventcallback(&onplayerdisconnect);
    namespace_76a219af07c28c13::registerteamassimilatecallback(&function_6bdc6f56944dc3aa);
    namespace_bc0abb78a303bb78::function_8ece37593311858a(&function_ddbdc83e53b603f7);
    namespace_71eef510d7f364cf::registeronplayerspawncallback(&onplayerrespawn);
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("plea_request", &function_4e60ea7d6c5ab305);
    level.pleaforhelp = spawnstruct();
    level.pleaforhelp.var_30db13447a236f3a = 0;
    level.pleaforhelp.var_807ffb67240349f5 = [];
    level.pleaforhelp.var_7ff3973c2ad05964 = getdvarint(@"hash_9cce9b50f7eed8", 10000);
    level.pleaforhelp.var_fccaea57406d9937 = getdvarint(@"hash_7d0b9f953d90d2e1", 0);
    level.pleaforhelp.var_a8f396f44df1c126 = getdvarint(@"hash_71770d1190c57088", 300);
    level.pleaforhelp.var_5a0820c3017c65a6 = getdvarint(@"hash_ba3dc3c4d745f037", 24);
    level.pleaforhelp.var_7836c12f19dd2c3 = getdvarint(@"hash_f1e1a5ed455c1600", 2);
    level.pleaforhelp.var_afdd97402f873f1e = getdvarfloat(@"hash_329cd90cfddd2497", 0.5);
    level.pleaforhelp.var_ab651cb230f0d65 = getdvarint(@"hash_4d7861bbe97a0c2", 1);
    level.pleaforhelp.var_b1a743ca97f7690e = getdvarint(@"hash_523a07040487ff3e", 30);
    level.pleaforhelp.var_504fa7a88ba40e41 = getdvarint(@"hash_40ad1dd5f4a4f9e2", 0);
    thread function_ba1cbfc640da6557();
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb98
// Size: 0x15
function private function_ddbdc83e53b603f7() {
    self.var_5a6bec925741fee3 = 0;
    function_5cccb32072a43854(0);
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb4
// Size: 0x3e
function function_4db915a9ce0e903a() {
    if (!namespace_76a219af07c28c13::function_6934349b7823d888()) {
        return 0;
    }
    if (!isdefined(level.var_5e3e13175c48c44a)) {
        level.var_5e3e13175c48c44a = getdvarint(@"hash_b682a9c77af06b57", 1);
    }
    return istrue(level.var_5e3e13175c48c44a);
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbfa
// Size: 0x59
function pleaforhelp(origin, var_15ab90a8de6865aa) {
    if (!istrue(level.pleaforhelp.var_ab651cb230f0d65)) {
        var_15ab90a8de6865aa function_2e673b4c90cd35fb();
    }
    var_496aaa68c40aeb44 = function_1144dea4d6d6e575(origin, var_15ab90a8de6865aa);
    var_496aaa68c40aeb44 function_c9e6fcd7831f36af(origin);
    var_15ab90a8de6865aa thread function_e163b2023ba2bfc6(origin);
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc5a
// Size: 0x16
function function_ad29f2cdc94aac3b() {
    return level.pleaforhelp.var_7ff3973c2ad05964;
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc78
// Size: 0x4b
function private function_4fb04db192fbf4da(player) {
    return issharedfuncdefined("teamAssim", "isPlayersAssimDisabled") && ![[ getsharedfunc("teamAssim", "isPlayersAssimDisabled") ]](self) && !istrue(level.pleaforhelp.var_30db13447a236f3a);
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xccb
// Size: 0x116
function function_bfdfd3c9ba0cc7cb(player, var_6298140c625d09c5) {
    if (!isdefined(level.pleaforhelp) || istrue(level.pleaforhelp.var_30db13447a236f3a)) {
        return 0;
    }
    if (istrue(player.squadwiped) && !getdvarint(@"hash_a5bfce6c742aa583", 1)) {
        return 0;
    }
    if (!istrue(player.liveragdoll) && !namespace_bed52b18307bf1e0::function_afb40a34c99dc4e4(var_6298140c625d09c5)) {
        return 0;
    }
    if (!function_4fb04db192fbf4da(player)) {
        return 0;
    }
    if (level.pleaforhelp.var_fccaea57406d9937 > 0 && player.var_5a6bec925741fee3 >= level.pleaforhelp.var_fccaea57406d9937) {
        return 0;
    }
    if (level.pleaforhelp.var_807ffb67240349f5.size >= level.pleaforhelp.var_5a0820c3017c65a6) {
        return 0;
    }
    if (namespace_36f464722d326bbe::isbrstylegametype() && namespace_7789f919216d38a2::function_76ef3c8b8171d2d(player.origin)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde9
// Size: 0x1e
function ispleading(player) {
    return function_4db915a9ce0e903a() && isdefined(function_c069f41a6bc4a19a(player));
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe0f
// Size: 0x40
function function_c069f41a6bc4a19a(player) {
    if (!isdefined(player)) {
        return undefined;
    }
    index = player getentitynumber();
    if (isdefined(index)) {
        return level.pleaforhelp.var_807ffb67240349f5[index];
    }
    return undefined;
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe57
// Size: 0x99
function function_31097cf0c8f08654() {
    if (istrue(level.pleaforhelp.var_30db13447a236f3a)) {
        return;
    }
    level.pleaforhelp.var_30db13447a236f3a = 1;
    foreach (var_496aaa68c40aeb44 in level.pleaforhelp.var_807ffb67240349f5) {
        if (!isdefined(var_496aaa68c40aeb44)) {
            continue;
        }
        var_496aaa68c40aeb44 thread function_b5341d976f6c944d();
    }
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xef7
// Size: 0x23
function private function_ba1cbfc640da6557() {
    level endon("game_ended");
    level waittill_any_2("gulag_closed", "dmz_radiation_started");
    function_31097cf0c8f08654();
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf21
// Size: 0x10d
function callforhelp(var_6298140c625d09c5) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("spawned");
    self endon("br_team_fully_eliminated");
    function_5cccb32072a43854(0);
    self.var_7c813e50ff75be27 = undefined;
    namespace_54fe482119c59b2f::function_7a8a04d15ad052d5();
    if (!function_bfdfd3c9ba0cc7cb(self, var_6298140c625d09c5)) {
        return;
    }
    function_5cccb32072a43854(1);
    var_6e9f9801408856f8 = isbot(self) && shouldautoacceptteamswitch();
    endons = [0:"spawned", 1:"plea_deleted", 2:"plea_created", 3:"br_team_fully_eliminated", 4:"plea_eliminated"];
    self function_bc667001f9dd3808(self.origin);
    self.var_250a9483d4ca72cd = undefined;
    function_bbf44d52ca2820cd("request_plea_kbm", "activate", &function_d9ae2a812e5ee454, undefined, endons, 4, &function_52273a4095c18970, "kbm_only", var_6e9f9801408856f8);
    function_bbf44d52ca2820cd("request_plea_gamepad", "actionslot 2", &function_d9ae2a812e5ee454, undefined, endons, 4, &function_52273a4095c18970, "gamepad_only");
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1035
// Size: 0x111
function private function_52273a4095c18970(var_4f0c2c3538662f1b, progress, iscomplete) {
    var_c0dd862e5087634c = !iscomplete && progress == 0;
    if (self.var_36c1dc28edf11bed == 1 && progress > 0) {
        if (!isdefined(self.var_250a9483d4ca72cd) && isdefined(self.var_6af52e47cbd09141)) {
            self.var_250a9483d4ca72cd = gettime();
        }
        namespace_58fb4f2e73fd41a0::setlowermessageomnvar("plea_no_time");
        function_5cccb32072a43854(2);
    } else if (self.var_36c1dc28edf11bed == 2 && var_c0dd862e5087634c) {
        if (isdefined(self.var_250a9483d4ca72cd) && isdefined(self.var_6af52e47cbd09141)) {
            var_99baa92bb2ab2fb3 = gettime() - self.var_250a9483d4ca72cd;
            var_7ec6a65c4b4043a3 = self.var_6af52e47cbd09141 + var_99baa92bb2ab2fb3;
            self.var_6af52e47cbd09141 = var_7ec6a65c4b4043a3;
            namespace_58fb4f2e73fd41a0::setlowermessageomnvar("plea_time", var_7ec6a65c4b4043a3);
            self.var_250a9483d4ca72cd = undefined;
        }
        function_5cccb32072a43854(1);
    }
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x114d
// Size: 0x54
function private function_d9ae2a812e5ee454(var_4f0c2c3538662f1b) {
    if (self.var_36c1dc28edf11bed == 2) {
        namespace_58fb4f2e73fd41a0::setlowermessageomnvar("plea_waiting");
        pleaforhelp(self.origin, self);
        waitframe();
        function_5cccb32072a43854(3);
        self.var_5a6bec925741fee3++;
        self notify("plea_created");
    }
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a8
// Size: 0xb0
function function_1144dea4d6d6e575(origin, var_15ab90a8de6865aa) {
    var_496aaa68c40aeb44 = spawnstruct();
    var_496aaa68c40aeb44.var_15ab90a8de6865aa = var_15ab90a8de6865aa;
    var_496aaa68c40aeb44.var_8f6367cf93ae04f0 = 0;
    if (getdvarint(@"hash_54e551efd4ecaf0b", 1)) {
        function_b03cf5a57e364af2(var_15ab90a8de6865aa);
    }
    var_496aaa68c40aeb44 function_23c9a2a29579048d(origin);
    var_496aaa68c40aeb44 function_7e7f8fac7f822024(origin);
    var_496aaa68c40aeb44 function_5cb50ec8cf0f89a5();
    function_675d06c4a07c4178(var_496aaa68c40aeb44);
    var_15ab90a8de6865aa clearpredictedstreampos();
    var_496aaa68c40aeb44 thread function_d00f5adc927eee80();
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        var_496aaa68c40aeb44 thread function_99a48d20b7d454ef();
    }
    namespace_446fc987a980892f::function_d87d5deb069bf8e5("assim_plea_me_join_you", [0:var_15ab90a8de6865aa]);
    return var_496aaa68c40aeb44;
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1260
// Size: 0x52
function private function_b03cf5a57e364af2(player) {
    index = player getentitynumber();
    if (isdefined(level.pleaforhelp.var_807ffb67240349f5[index])) {
        level.pleaforhelp.var_807ffb67240349f5[index] function_b5341d976f6c944d();
    }
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12b9
// Size: 0x85
function private function_675d06c4a07c4178(var_496aaa68c40aeb44) {
    index = var_496aaa68c40aeb44.var_15ab90a8de6865aa getentitynumber();
    /#
        assertex(!isdefined(level.pleaforhelp.var_807ffb67240349f5[index]), "Player e" + index + " can't have two plea requests at once.");
    #/
    var_496aaa68c40aeb44.index = index;
    level.pleaforhelp.var_807ffb67240349f5[index] = var_496aaa68c40aeb44;
    var_496aaa68c40aeb44.var_3bf41bb7c12cdb4e = [];
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1345
// Size: 0xdb
function private function_23c9a2a29579048d(origin) {
    offset = (0, 0, 20);
    spawnpos = origin + offset;
    self.useent = spawnscriptable("br_plea_request", spawnpos, (0, 0, 0));
    self.useent utility::function_6e506f39f121ea8a(self.var_15ab90a8de6865aa, offset);
    self.useent.id = "plea_for_help_looting";
    self.useent.usetime = level.pleaforhelp.var_7836c12f19dd2c3 * 1000;
    self.useent.curprogress = 0;
    self.useent.var_496aaa68c40aeb44 = self;
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1427
// Size: 0xda
function private function_7e7f8fac7f822024(origin) {
    self.objid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
    /#
        assert(self.objid != -1);
    #/
    if (self.objid != -1) {
        namespace_5a22b6f3a56f7e9b::objective_add_objective(self.objid, "current", origin, "hud_icon_plea_for_help");
        namespace_5a22b6f3a56f7e9b::update_objective_setbackground(self.objid, 1);
        namespace_5a22b6f3a56f7e9b::objective_set_play_intro(self.objid, 1);
        namespace_5a22b6f3a56f7e9b::update_objective_onentity(self.objid, self.var_15ab90a8de6865aa);
        objective_setlabel(self.objid, "MP_BR_INGAME/PLEA_FOR_HELP");
        var_7ff3973c2ad05964 = function_ad29f2cdc94aac3b();
        function_c047d7ffe7a83501(self.objid, var_7ff3973c2ad05964 - 500, var_7ff3973c2ad05964);
        function_9b68823114a3405f();
    }
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1508
// Size: 0x6f
function private function_d00f5adc927eee80() {
    self endon("plea_deleted");
    self.var_15ab90a8de6865aa endon("disconnect");
    timeout = level.pleaforhelp.var_a8f396f44df1c126;
    if (istrue(level.pleaforhelp.var_504fa7a88ba40e41)) {
        level waittill_notify_or_timeout("game_ended", timeout);
    } else {
        level waittill("game_ended");
    }
    thread function_b5341d976f6c944d();
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x157e
// Size: 0x4d
function private function_99a48d20b7d454ef() {
    self endon("plea_deleted");
    level endon("game_ended");
    var_b2e7e41c5df2102b = 0;
    while (!var_b2e7e41c5df2102b) {
        var_b2e7e41c5df2102b = namespace_7789f919216d38a2::function_76ef3c8b8171d2d(self.useent.origin);
        wait(1);
    }
    wait(5);
    thread function_b5341d976f6c944d();
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x15d2
// Size: 0x50
function private updateplayerpleaforall(var_f99d56bcb582a8ba) {
    if (!ispleading(var_f99d56bcb582a8ba)) {
        return;
    }
    index = var_f99d56bcb582a8ba getentitynumber();
    var_496aaa68c40aeb44 = level.pleaforhelp.var_807ffb67240349f5[index];
    var_496aaa68c40aeb44 function_5cb50ec8cf0f89a5();
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1629
// Size: 0x92
function private function_46eea9b19a5046cf(var_f99d56bcb582a8ba, var_784c8ada1184ff89) {
    if (!isdefined(var_f99d56bcb582a8ba) || !isdefined(var_784c8ada1184ff89)) {
        return 1;
    }
    if (!isdefined(var_f99d56bcb582a8ba.lastkilledby) || !isdefined(var_f99d56bcb582a8ba.team) || !isdefined(var_784c8ada1184ff89.team)) {
        return 1;
    }
    if (getdvarint(@"hash_a37e111d455283d2", 1) || var_f99d56bcb582a8ba.lastkilledby.team != var_784c8ada1184ff89.team) {
        return 1;
    }
    return 0;
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16c3
// Size: 0x14e
function private function_5cb50ec8cf0f89a5() {
    var_7ff3973c2ad05964 = function_ad29f2cdc94aac3b();
    var_e965bce0774276b4 = namespace_7e17181d03156026::getplayersinradius(self.useent.origin, var_7ff3973c2ad05964);
    var_6985f8ad6a6fc95b = array_difference(level.players, var_e965bce0774276b4);
    namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(self.objid);
    foreach (player in var_e965bce0774276b4) {
        if (!isdefined(player)) {
            continue;
        }
        if (function_f4468dd443922b9e(self.var_15ab90a8de6865aa, player, 1) && function_46eea9b19a5046cf(self.var_15ab90a8de6865aa, player)) {
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("assim_plea_me_join_you_nearby", [0:player]);
            function_9610eee898ac5a6(player);
        } else {
            function_e0949addb6054291(player);
        }
    }
    foreach (player in var_6985f8ad6a6fc95b) {
        if (!isdefined(player)) {
            continue;
        }
        function_e0949addb6054291(player);
    }
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1818
// Size: 0x3e
function private function_e0949addb6054291(player) {
    namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(self.objid, player);
    self.useent disablescriptableplayeruse(player);
    self.var_15ab90a8de6865aa function_4dec72501ac491a5(player);
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x185d
// Size: 0x2d
function private function_9610eee898ac5a6(player) {
    namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(self.objid, player);
    self.useent enablescriptableplayeruse(player);
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1891
// Size: 0xf6
function private function_9a375c85268afaaa(team) {
    players = namespace_54d20dd0dd79277f::getteamdata(team, "players");
    var_7ff3973c2ad05964 = function_ad29f2cdc94aac3b();
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        canassimilate = function_f4468dd443922b9e(self.var_15ab90a8de6865aa, player, 1);
        if (!canassimilate) {
            function_e0949addb6054291(player);
        } else {
            dist = distance2d(self.useent.origin, player.origin);
            if (dist <= var_7ff3973c2ad05964) {
                function_9610eee898ac5a6(player);
            } else {
                function_e0949addb6054291(player);
            }
        }
    }
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x198e
// Size: 0x74
function private function_631c07dea1296288(team) {
    foreach (var_496aaa68c40aeb44 in level.pleaforhelp.var_807ffb67240349f5) {
        if (!isdefined(var_496aaa68c40aeb44)) {
            continue;
        }
        var_496aaa68c40aeb44 function_9a375c85268afaaa(team);
    }
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a09
// Size: 0x6d
function private function_4dec72501ac491a5(player) {
    if (isdefined(self.var_6a4360dcf2a8f3d4)) {
        if (istrue(self.var_6a4360dcf2a8f3d4.hidefromteam) && self.team == player.team) {
            self.var_6a4360dcf2a8f3d4 disablescriptableplayeruse(player);
            return;
        } else {
            self.var_6a4360dcf2a8f3d4 enablescriptableplayeruse(player);
        }
    }
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1a7d
// Size: 0x29
function private function_1032f89962bec545(player) {
    if (isdefined(self.var_6a4360dcf2a8f3d4)) {
        self.var_6a4360dcf2a8f3d4 disablescriptableplayeruse(player);
    }
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1aad
// Size: 0xb8
function private function_1b4a4affdf4c7798() {
    if (isdefined(self.var_6a4360dcf2a8f3d4)) {
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            if (istrue(self.var_6a4360dcf2a8f3d4.hidefromteam) && self.team == player.team) {
                self.var_6a4360dcf2a8f3d4 disablescriptableplayeruse(player);
            } else {
                self.var_6a4360dcf2a8f3d4 enablescriptableplayeruse(player);
            }
        }
    }
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b6c
// Size: 0x253
function private function_7bbc24bc9f4693bb(instance, part, state, player, var_496aaa68c40aeb44) {
    level endon("game_ended");
    var_496aaa68c40aeb44.var_15ab90a8de6865aa endon("disconnect");
    var_496aaa68c40aeb44 endon("plea_deleted");
    if (!function_f4468dd443922b9e(var_496aaa68c40aeb44.var_15ab90a8de6865aa, player, 1)) {
        player namespace_44abc05161e2e2cb::showerrormessage("MP_PING_INGAME/ASSIM_FAILED_TEAM_SIZE");
        return;
    }
    if (isdefined(instance.var_e4f0b27dd32f8d95) || var_496aaa68c40aeb44.var_15ab90a8de6865aa getbeingrevivedinternal()) {
        player namespace_44abc05161e2e2cb::showerrormessage("MP/CANNOT_USE_GENERIC");
        return;
    }
    var_d31d331a4c57867b = isbot(player);
    instance.curprogress = 0;
    instance.var_e4f0b27dd32f8d95 = player;
    instance.owner = var_496aaa68c40aeb44.var_15ab90a8de6865aa;
    instance.owner.reviver = player;
    beingrevived = 0;
    while ((player usebuttonpressed() || var_d31d331a4c57867b) && instance.curprogress < instance.usetime && namespace_7e17181d03156026::function_ad443bbcdcf37b85(player) && !beingrevived) {
        instance.curprogress = instance.curprogress + level.frameduration;
        if (instance.curprogress >= 250) {
            player namespace_19b4203b51d56488::updateuiprogress(instance, 1);
        }
        waitframe();
        beingrevived = var_496aaa68c40aeb44.var_15ab90a8de6865aa getbeingrevivedinternal();
        if (var_d31d331a4c57867b && istrue(instance.var_fb04222d93e0905b)) {
            break;
        }
    }
    var_7e41aed52f964714 = instance.curprogress >= instance.usetime;
    instance.curprogress = 0;
    player namespace_19b4203b51d56488::updateuiprogress(instance, 0);
    if (isdefined(var_496aaa68c40aeb44) && namespace_7e17181d03156026::function_ad443bbcdcf37b85(player) && !beingrevived && var_7e41aed52f964714) {
        var_97d4aa6a47a2a3df = var_496aaa68c40aeb44 function_fec9399c00988060(player);
    }
    if (isdefined(instance)) {
        instance.var_e4f0b27dd32f8d95 = undefined;
        if (isdefined(instance.owner)) {
            instance.owner.reviver = undefined;
            instance.owner = undefined;
        }
    }
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1dc6
// Size: 0x8e
function private function_30655e044834fc14(var_e501c18e04378d20) {
    if (isdefined(self.var_15ab90a8de6865aa.var_6a4360dcf2a8f3d4) && !isbot(var_e501c18e04378d20)) {
        var_89aa81c53e4e27b = self.var_15ab90a8de6865aa.var_6a4360dcf2a8f3d4;
        var_89aa81c53e4e27b setscriptablepartstate("body", "partially_open_in_use_unusable");
        items = getscriptablelootcachecontents(var_89aa81c53e4e27b);
        var_89aa81c53e4e27b namespace_1b7e64f50cca9321::lootcachespawncontents(items, 1, var_e501c18e04378d20, var_89aa81c53e4e27b.contents);
    }
    thread function_b5341d976f6c944d();
    return 1;
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e5c
// Size: 0x19f
function private function_fec9399c00988060(var_784c8ada1184ff89) {
    var_3b96d5666000c2e0 = self.var_15ab90a8de6865aa;
    if (getdvarint(@"hash_216394a34963463d", 1)) {
        var_3b96d5666000c2e0.var_2ee33cfb70f7eaaf = var_784c8ada1184ff89;
        var_784c8ada1184ff89.var_2f950a6a60ffb7d3 = var_3b96d5666000c2e0;
        var_784c8ada1184ff89 thread namespace_314d49cda6272573::function_36edf91561322753(6, 20, &function_c26f981347110521);
        function_4216d7bae9b2f46b(var_3b96d5666000c2e0);
        params = {var_ddbaeed5496aa116:self, reviver:var_784c8ada1184ff89};
        var_3b96d5666000c2e0 callback::callback(#"hash_83238eee27237eeb", params);
        var_784c8ada1184ff89 thread namespace_48a08c5037514e04::givexpwithtext(#"hash_6990f2812894108b");
        if (getdvarint(@"hash_3c8939469c4d6c50", 0)) {
            teammates = namespace_54d20dd0dd79277f::getteamdata(var_784c8ada1184ff89.team, "alivePlayers");
            namespace_27cdbf2464b21c84::function_ed4c2d913d203bf(teammates, "plea_grace_time");
            namespace_27cdbf2464b21c84::function_ed4c2d913d203bf([0:var_3b96d5666000c2e0], "plea_grace_time");
            var_cd4d702523c3efb7 = array_add(teammates, var_3b96d5666000c2e0);
            level thread function_3ee28c2ef70bb7d3(var_cd4d702523c3efb7);
        }
        thread function_b5341d976f6c944d();
        return 1;
    } else if (function_7eea956b4d052875(var_3b96d5666000c2e0, var_784c8ada1184ff89)) {
        function_4216d7bae9b2f46b(var_3b96d5666000c2e0);
        params = {var_26ac2a3a59347b9e:1, var_ddbaeed5496aa116:self, reviver:var_784c8ada1184ff89};
        var_3b96d5666000c2e0 callback::callback(#"hash_83238eee27237eeb", params);
        var_784c8ada1184ff89 thread namespace_48a08c5037514e04::givexpwithtext(#"hash_6990f2812894108b");
        function_b7102c003905c9b1("player_team_switched", [0:var_3b96d5666000c2e0]);
        thread function_b5341d976f6c944d();
        return 1;
    }
    return 0;
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2003
// Size: 0x76
function private function_7eea956b4d052875(var_3b96d5666000c2e0, var_784c8ada1184ff89) {
    if (!issharedfuncdefined("teamAssim", "canAssimilate") || !issharedfuncdefined("teamAssim", "assimilatePlayer")) {
        return 0;
    }
    if ([[ getsharedfunc("teamAssim", "canAssimilate") ]](var_3b96d5666000c2e0, var_784c8ada1184ff89, var_784c8ada1184ff89, 0)) {
        [[ getsharedfunc("teamAssim", "assimilatePlayer") ]](var_3b96d5666000c2e0, var_784c8ada1184ff89, 1);
        return 1;
    } else {
        return 0;
    }
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2080
// Size: 0xb6
function private function_c26f981347110521(var_8d1dd77475db7a6a) {
    if (!istrue(var_8d1dd77475db7a6a)) {
        return 0;
    }
    var_784c8ada1184ff89 = self;
    var_3b96d5666000c2e0 = self.var_2f950a6a60ffb7d3;
    if (!issharedfuncdefined("teamAssim", "canAssimilate") || !issharedfuncdefined("teamAssim", "assimilatePlayer")) {
        return 0;
    }
    if ([[ getsharedfunc("teamAssim", "canAssimilate") ]](var_3b96d5666000c2e0, var_784c8ada1184ff89, var_784c8ada1184ff89, 0)) {
        success = [[ getsharedfunc("teamAssim", "sendDirectAssimRequest") ]](var_784c8ada1184ff89, var_3b96d5666000c2e0, 0, 0);
        if (istrue(success)) {
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("assim_request_you_join_me", [0:var_784c8ada1184ff89]);
        }
        return istrue(success);
    } else {
        return 0;
    }
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x213d
// Size: 0x5e
function function_4216d7bae9b2f46b(var_3b96d5666000c2e0) {
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        var_3b96d5666000c2e0 playerrespawn();
    } else {
        if (!isdefined(var_3b96d5666000c2e0.revivecount)) {
            var_3b96d5666000c2e0.revivecount = 1;
        } else {
            var_3b96d5666000c2e0.revivecount++;
        }
        var_3b96d5666000c2e0 player::setbeingrevivedinternal(0);
        var_3b96d5666000c2e0 thread teamrevive::respawn();
    }
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21a2
// Size: 0xab
function playerrespawn() {
    level endon("game_ended");
    self endon("disconnect");
    if (istrue(level.gameended)) {
        return;
    }
    namespace_4f9f94245708410d::playerfakespectate(0);
    namespace_25b25d188ef778c4::function_b892c6b4c68c344a([0:self], 0.5);
    namespace_4887422e77f3514e::function_a2b4e6088394bade();
    self clearsoundsubmix("iw9_mp_killcam");
    self.isrespawn = 1;
    namespace_58fb4f2e73fd41a0::setlowermessageomnvar("clear_lower_msg");
    namespace_99ac021a7547cae3::spawnplayer(undefined, 1);
    namespace_f446f6030ca8cff8::_clearexecution();
    namespace_cb965d2f71fefddc::initplayer();
    namespace_80cec6cfc70c4f95::unmarkplayeraseliminated(self);
    level thread namespace_25c5a6f43bb97b43::trysaylocalsound(self, #"hash_b092e3259ec308d8");
    namespace_e0a7597be4f2b843::setcachedclientomnvar("ui_br_transition_type", 0);
    thread namespace_d696adde758cbe79::function_707d956bdbd4b134();
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2254
// Size: 0xb2
function private function_e163b2023ba2bfc6(deathpos) {
    self endon("disconnect");
    /#
        assert(istrue(self.liveragdoll));
    #/
    contents = physics_createcontents([0:"physicscontents_item", 1:"physicscontents_vehicle", 2:"physicscontents_solid", 3:"physicscontents_glass", 4:"physicscontents_playernosight"]);
    var_a92e3d2ff7af10c9 = namespace_7e17181d03156026::function_6d606d81ea9ab50b(1, 1, contents);
    if (!isdefined(var_a92e3d2ff7af10c9)) {
        return;
    }
    thread function_c3ff897e4de174f9(var_a92e3d2ff7af10c9, deathpos);
    self waittill("plea_deleted");
    self allowspectateteam(self.team, 1);
    self cameraunlink();
    var_a92e3d2ff7af10c9 delete();
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x230d
// Size: 0x14b
function private function_c3ff897e4de174f9(cameraent, deathpos) {
    self endon("disconnect");
    self endon("plea_deleted");
    if (isbot(self) || cameraent.data.var_6095efe86105e553.size == 0) {
        return;
    }
    wait(0.5);
    cameraent.deathpos = deathpos;
    cameraent.positionindex = 0;
    cameraent.intervaltime = level.pleaforhelp.var_afdd97402f873f1e;
    function_4b6858706980b154("previous_camera_position_kbm", "moveleft", &function_7bc6ee82d60a23ac, cameraent, [0:"plea_deleted"], "kbm_only", cameraent.intervaltime);
    function_4b6858706980b154("next_camera_position_kbm", "moveright", &function_93267d1b12626524, cameraent, [0:"plea_deleted"], "kbm_only", cameraent.intervaltime);
    function_4b6858706980b154("previous_camera_position_gamepad", "actionslot 3", &function_7bc6ee82d60a23ac, cameraent, [0:"plea_deleted"], "gamepad_only", cameraent.intervaltime);
    function_4b6858706980b154("next_camera_position_gamepad", "actionslot 4", &function_93267d1b12626524, cameraent, [0:"plea_deleted"], "gamepad_only", cameraent.intervaltime);
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x245f
// Size: 0x7f
function private function_93267d1b12626524(cameraent) {
    var_379de5a38f0e582a = cameraent.data;
    cameraent.positionindex = (cameraent.positionindex + 1) % var_379de5a38f0e582a.var_6095efe86105e553.size;
    var_12b614f64a9ba025 = var_379de5a38f0e582a.var_6095efe86105e553[cameraent.positionindex];
    cameraent function_3718dcb439a51665(var_12b614f64a9ba025, cameraent.deathpos);
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x24e5
// Size: 0x9d
function private function_7bc6ee82d60a23ac(cameraent) {
    var_379de5a38f0e582a = cameraent.data;
    cameraent.positionindex = cameraent.positionindex - 1;
    if (cameraent.positionindex < 0) {
        cameraent.positionindex = var_379de5a38f0e582a.var_6095efe86105e553.size - 1;
    }
    var_12b614f64a9ba025 = var_379de5a38f0e582a.var_6095efe86105e553[cameraent.positionindex];
    cameraent function_3718dcb439a51665(var_12b614f64a9ba025, cameraent.deathpos);
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2589
// Size: 0x52
function private function_3718dcb439a51665(var_12b614f64a9ba025, deathpos) {
    playerdirection = vectornormalize(deathpos - var_12b614f64a9ba025);
    self moveto(var_12b614f64a9ba025, self.intervaltime, 0, 0);
    self rotateto(vectortoangles(playerdirection), self.intervaltime, 0, 0);
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x25e2
// Size: 0x99
function private function_9b68823114a3405f() {
    var_7d2e1a4944f8b507 = function_ad29f2cdc94aac3b();
    triggerheight = 6000;
    heightoffset = (0, 0, 2000);
    triggerradius = spawn("trigger_radius", self.useent.origin - heightoffset, 0, var_7d2e1a4944f8b507, 6000);
    triggerradius.var_496aaa68c40aeb44 = self;
    self.trigger = triggerradius;
    namespace_f1565a2788ab1e89::makeenterexittrigger(triggerradius, &function_b786b6748090b866, &function_1361f5d497e474d0, undefined, undefined, &function_76e95d35a6cdbe41);
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2682
// Size: 0x93
function private function_b786b6748090b866(var_b7e6e0af9c1157cc, trigger) {
    if (isplayer(var_b7e6e0af9c1157cc)) {
        function_78d0ae2d6462054f(var_b7e6e0af9c1157cc, trigger);
        return;
    }
    if (var_b7e6e0af9c1157cc namespace_1f188a13f7e79610::isvehicle()) {
        occupants = namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(var_b7e6e0af9c1157cc, 0);
        foreach (player in occupants) {
            function_78d0ae2d6462054f(player, trigger);
        }
        return;
    }
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x271c
// Size: 0xfc
function private function_78d0ae2d6462054f(player, trigger) {
    var_496aaa68c40aeb44 = trigger.var_496aaa68c40aeb44;
    if (!isalive(player) || !function_f4468dd443922b9e(var_496aaa68c40aeb44.var_15ab90a8de6865aa, player, 1) || !function_46eea9b19a5046cf(var_496aaa68c40aeb44.var_15ab90a8de6865aa, player)) {
        return;
    }
    var_496aaa68c40aeb44 function_9610eee898ac5a6(player);
    if (isdefined(var_496aaa68c40aeb44.var_3bf41bb7c12cdb4e) && !array_contains(var_496aaa68c40aeb44.var_3bf41bb7c12cdb4e, player.guid)) {
        if (issharedfuncdefined("hud", "showBrDMZSplash")) {
            [[ getsharedfunc("hud", "showBrDMZSplash") ]]("dmz_plea_for_help_requested", [0:player], undefined, undefined, undefined, level.var_42b1e877ab187c6);
        }
        var_496aaa68c40aeb44.var_3bf41bb7c12cdb4e[var_496aaa68c40aeb44.var_3bf41bb7c12cdb4e.size] = player.guid;
    }
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x281f
// Size: 0x9e
function private function_1361f5d497e474d0(var_958bf41eef0281ec, trigger) {
    if (isplayer(var_958bf41eef0281ec)) {
        if (var_958bf41eef0281ec namespace_f8065cafc523dba5::isinvehicle()) {
            return;
        }
        function_bc597aac077677c5(var_958bf41eef0281ec, trigger);
        return;
    }
    if (var_958bf41eef0281ec namespace_1f188a13f7e79610::isvehicle()) {
        occupants = namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(var_958bf41eef0281ec, 0);
        foreach (player in occupants) {
            function_bc597aac077677c5(player, trigger);
        }
        return;
    }
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x28c4
// Size: 0x33
function private function_bc597aac077677c5(player, trigger) {
    var_496aaa68c40aeb44 = trigger.var_496aaa68c40aeb44;
    var_496aaa68c40aeb44 function_e0949addb6054291(player);
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x28fe
// Size: 0x75
function private function_72c2355a581a6edb(trigger) {
    self endon("plea_squad_count_updated");
    self endon("plea_deleted");
    waittillframeend();
    if (!isdefined(self.var_15ab90a8de6865aa)) {
        return;
    }
    var_8f6367cf93ae04f0 = function_a05533b81ce8225c(trigger, self.var_15ab90a8de6865aa);
    if (self.var_8f6367cf93ae04f0 != var_8f6367cf93ae04f0) {
        self.var_8f6367cf93ae04f0 = var_8f6367cf93ae04f0;
        self.var_15ab90a8de6865aa function_f3b1f4580ffb7524(var_8f6367cf93ae04f0);
    }
    self notify("plea_squad_count_updated");
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x297a
// Size: 0xd9
function private function_a05533b81ce8225c(trigger, var_15ab90a8de6865aa) {
    var_aed530c6ccca889e = [];
    foreach (playerent in trigger.triggerenterents) {
        if (!isdefined(playerent) || !isplayer(playerent)) {
            continue;
        }
        if (!isdefined(playerent.team) || playerent.team == var_15ab90a8de6865aa.team) {
            continue;
        }
        if (!canteamassimilate(playerent.team)) {
            continue;
        }
        var_aed530c6ccca889e[playerent.team] = 1;
    }
    return var_aed530c6ccca889e.size;
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2a5b
// Size: 0x4c
function private function_76e95d35a6cdbe41(var_102ff186309f63b8, trigger) {
    if (!isdefined(trigger)) {
        return 1;
    }
    if (var_102ff186309f63b8 namespace_1f188a13f7e79610::isvehicle()) {
        occupants = namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(var_102ff186309f63b8, 0);
        return (!isdefined(occupants) || occupants.size <= 0);
    }
    return !isplayer(var_102ff186309f63b8);
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2aaf
// Size: 0x10b
function function_b5341d976f6c944d() {
    if (isdefined(self.trigger)) {
        self.trigger delete();
    }
    if (isdefined(self.objid)) {
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.objid);
    }
    if (isdefined(self.useent)) {
        if (isdefined(self.useent.var_e4f0b27dd32f8d95)) {
            self.useent.curprogress = 0;
            self.useent.var_e4f0b27dd32f8d95 namespace_19b4203b51d56488::updateuiprogress(self.useent, 0);
        }
        self.useent freescriptable();
    }
    if (isdefined(self.var_15ab90a8de6865aa)) {
        self.var_15ab90a8de6865aa function_5cccb32072a43854(0);
        self.var_15ab90a8de6865aa function_1b4a4affdf4c7798();
    }
    level.pleaforhelp.var_807ffb67240349f5[self.index] = undefined;
    self notify("plea_deleted");
    self.var_15ab90a8de6865aa notify("plea_deleted");
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bc1
// Size: 0x95
function deletepleasfromteam(team) {
    teamplayers = namespace_54d20dd0dd79277f::getteamdata(team, "players");
    foreach (player in teamplayers) {
        if (!isdefined(player)) {
            continue;
        }
        if (ispleading(player)) {
            var_496aaa68c40aeb44 = function_c069f41a6bc4a19a(player);
            var_496aaa68c40aeb44 thread function_b5341d976f6c944d();
        }
    }
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2c5d
// Size: 0x44
function private function_58e61608aab59511(player) {
    if (!isdefined(player)) {
        return;
    }
    var_496aaa68c40aeb44 = function_c069f41a6bc4a19a(player);
    if (isdefined(var_496aaa68c40aeb44)) {
        var_496aaa68c40aeb44 thread function_b5341d976f6c944d();
        function_631c07dea1296288(player.team);
    }
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ca8
// Size: 0x10e
function function_c9e6fcd7831f36af(origin) {
    var_7ff3973c2ad05964 = function_ad29f2cdc94aac3b();
    var_e965bce0774276b4 = namespace_7e17181d03156026::getplayersinradius(origin, var_7ff3973c2ad05964);
    foreach (player in var_e965bce0774276b4) {
        if (!isdefined(player)) {
            continue;
        }
        if (isreallyalive(player) && function_f4468dd443922b9e(self.var_15ab90a8de6865aa, player, 1) && function_46eea9b19a5046cf(self.var_15ab90a8de6865aa, player)) {
            if (issharedfuncdefined("hud", "showBrDMZSplash")) {
                [[ getsharedfunc("hud", "showBrDMZSplash") ]]("dmz_plea_for_help_requested", [0:player], undefined, undefined, undefined, level.var_42b1e877ab187c6);
            }
            self.var_3bf41bb7c12cdb4e[self.var_3bf41bb7c12cdb4e.size] = player.guid;
        }
    }
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2dbd
// Size: 0x14
function private onplayerdisconnect(player) {
    function_58e61608aab59511(player);
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2dd8
// Size: 0xb
function private onplayerrespawn() {
    function_58e61608aab59511(self);
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2dea
// Size: 0x2c
function private function_6bdc6f56944dc3aa(player, oldteam, newteam) {
    function_631c07dea1296288(oldteam);
    function_631c07dea1296288(newteam);
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e1d
// Size: 0x4b
function private function_4e60ea7d6c5ab305(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    thread function_7bbc24bc9f4693bb(instance, part, state, player, instance.var_496aaa68c40aeb44);
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e6f
// Size: 0x26
function private function_5cccb32072a43854(var_6d38df6ea2eb7767) {
    namespace_e0a7597be4f2b843::function_63437fca39c681dc("ui_plea_for_help_data", 0, 2, var_6d38df6ea2eb7767);
    self.var_36c1dc28edf11bed = var_6d38df6ea2eb7767;
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e9c
// Size: 0x1d
function private function_f3b1f4580ffb7524(var_511a034ba346f623) {
    namespace_e0a7597be4f2b843::function_63437fca39c681dc("ui_plea_for_help_data", 2, 8, var_511a034ba346f623);
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2ec0
// Size: 0x3c
function private function_b7102c003905c9b1(splashname, var_9052970ff4bce526) {
    if (issharedfuncdefined("hud", "showDMZSplash")) {
        [[ getsharedfunc("hud", "showDMZSplash") ]](splashname, var_9052970ff4bce526);
    }
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f03
// Size: 0x58
function private function_f4468dd443922b9e(var_3b96d5666000c2e0, var_784c8ada1184ff89, var_4ade2291346e1240) {
    if (!istrue(var_3b96d5666000c2e0.br_iseliminated)) {
        return 0;
    }
    if (!issharedfuncdefined("teamAssim", "canAssimilate")) {
        return 0;
    }
    return [[ getsharedfunc("teamAssim", "canAssimilate") ]](var_3b96d5666000c2e0, var_784c8ada1184ff89, var_784c8ada1184ff89, var_4ade2291346e1240);
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f63
// Size: 0x34
function private canteamassimilate(team) {
    if (!issharedfuncdefined("teamAssim", "canTeamAssimilate")) {
        return 0;
    }
    return [[ getsharedfunc("teamAssim", "canTeamAssimilate") ]](team);
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f9f
// Size: 0x2a
function private shouldautoacceptteamswitch() {
    if (!issharedfuncdefined("teamAssim", "shouldAutoAcceptTeamSwitch")) {
        return 0;
    }
    return [[ getsharedfunc("teamAssim", "shouldAutoAcceptTeamSwitch") ]]();
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2fd1
// Size: 0x14
function private function_2e673b4c90cd35fb() {
    thread namespace_7db13bdf599e41a6::removetrigger(self.guid);
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2fec
// Size: 0xfb
function private function_3ee28c2ef70bb7d3(players) {
    level endon("game_ended");
    var_b1a743ca97f7690e = level.pleaforhelp.var_b1a743ca97f7690e;
    var_3e8aeb2a9e8d86d6 = undefined;
    foreach (player in players) {
        if (!isdefined(var_3e8aeb2a9e8d86d6)) {
            var_3e8aeb2a9e8d86d6 = player.team + "_proxy";
        }
        player.var_3e8aeb2a9e8d86d6 = var_3e8aeb2a9e8d86d6;
    }
    wait(var_b1a743ca97f7690e);
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        player.var_3e8aeb2a9e8d86d6 = undefined;
    }
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30ee
// Size: 0x43
function function_6d3365e999c489ac(squadmembers) {
    if (!isdefined(squadmembers) || !function_4db915a9ce0e903a() || !getdvarint(@"hash_a5bfce6c742aa583", 1) && squadmembers.size == 1) {
        return 0;
    }
    return function_9495edea61941f81(squadmembers);
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3139
// Size: 0x6b
function function_1714ffea633dcfed(team) {
    if (team == "all" || !function_4db915a9ce0e903a() || !getdvarint(@"hash_a5bfce6c742aa583", 1)) {
        return 0;
    }
    if (getsubgametype() == "dmz") {
        namespace_244fdc99ed0f5d2b::function_adc51ade78872d95(team);
    }
    players = namespace_54d20dd0dd79277f::getteamdata(team, "players");
    return function_9495edea61941f81(players);
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x31ac
// Size: 0xb7
function private function_9495edea61941f81(players) {
    if (!isdefined(players) || !isdefined(level.var_74e0aae435a09a51)) {
        return 0;
    }
    foreach (player in players) {
        if (!ispleading(player)) {
            player notify("check_for_plea");
            if (!function_bfdfd3c9ba0cc7cb(player)) {
                thread [[ level.var_74e0aae435a09a51 ]](player);
                player notify("plea_eliminated");
            } else if (!istrue(player.var_48a3f47058b86705)) {
                thread function_5df318837f8d78a2(player, players);
            }
        }
    }
    return 1;
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x326b
// Size: 0x90
function function_4253eec492c87aa() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("spawned");
    starttime = gettime();
    if (level.killcam) {
        while (!isdefined(self.var_7c813e50ff75be27)) {
            timeelapsed = gettime() - starttime;
            if (timeelapsed >= 1000) {
                return;
            }
            waitframe();
        }
        if (level.killcam && istrue(self.killcam)) {
            utility::waittill_any_3("killcam_ended", "killcam_canceled", "abort_killcam");
        }
    }
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3302
// Size: 0x5b
function function_d8b32f106816afc1(player) {
    level endon("game_ended");
    player endon("disconnect");
    if (!isdefined(player.var_6af52e47cbd09141)) {
        return;
    }
    while (1) {
        if (isdefined(player.var_250a9483d4ca72cd)) {
            waitframe();
            continue;
        }
        if (player.var_6af52e47cbd09141 <= gettime()) {
            return;
        }
        waitframe();
    }
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3364
// Size: 0x151
function function_5df318837f8d78a2(player, squadmembers) {
    player notify("waiting_for_plea");
    level endon("game_ended");
    player endon("disconnect");
    player endon("revivedAlive");
    player endon("waiting_for_plea");
    player endon("plea_created");
    foreach (member in squadmembers) {
        if (isdefined(member)) {
            member endon("spawned_player");
        }
    }
    thread function_c2349bc095414f22(player, squadmembers);
    player.var_48a3f47058b86705 = 1;
    player setclientomnvar("ui_show_spectateHud", player getentitynumber());
    player.var_7c813e50ff75be27 = undefined;
    player function_4253eec492c87aa();
    waitframe();
    player setclientomnvar("ui_waiting_for_aar", 1);
    endtime = int(gettime() + getdvarint(@"hash_e323d1171dab7bff", 20) * 1000);
    player.var_6af52e47cbd09141 = endtime;
    player namespace_58fb4f2e73fd41a0::setlowermessageomnvar("plea_time", endtime);
    function_d8b32f106816afc1(player);
    thread [[ level.var_74e0aae435a09a51 ]](player);
    player notify("plea_eliminated");
    if (ispleading(player)) {
        function_58e61608aab59511(player);
    }
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34bc
// Size: 0x85
function function_c2349bc095414f22(player, squadmembers) {
    level endon("game_ended");
    player endon("disconnect");
    player endon("waiting_for_plea");
    thread function_65a09992948e3276(player, squadmembers);
    player utility::waittill_any_3("plea_created", "revivedAlive", "squad_member_revived");
    player namespace_58fb4f2e73fd41a0::setlowermessageomnvar("clear_lower_msg");
    player setclientomnvar("ui_waiting_for_aar", 0);
    player.var_48a3f47058b86705 = undefined;
    player setclientomnvar("ui_show_spectateHud", -1);
    player notify("plea_vars_cleared");
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3548
// Size: 0x47
function function_65a09992948e3276(player, squadmembers) {
    level endon("game_ended");
    player endon("disconnect");
    player endon("waiting_for_plea");
    player endon("revivedAlive");
    player endon("plea_vars_cleared");
    function_6e816e7323725b59(squadmembers);
    player notify("squad_member_revived");
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3596
// Size: 0x6d
function function_6e816e7323725b59(squadmembers) {
    level endon("game_ended");
    foreach (member in squadmembers) {
        if (isdefined(member)) {
            member endon("spawned_player");
        }
    }
    while (1) {
        waitframe();
    }
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x360a
// Size: 0x114
function function_816b58482c18b840(var_93a0836a10e99c34, var_394466c2ddb208cb) {
    pingtype = var_93a0836a10e99c34 calloutmarkerping_gettype(var_394466c2ddb208cb);
    if (pingtype == 4) {
        var_6d7cff43e352d995 = var_93a0836a10e99c34 calloutmarkerping_getgscobjectiveindex(var_394466c2ddb208cb);
        if (isdefined(level.pleaforhelp) && isdefined(level.pleaforhelp.var_807ffb67240349f5)) {
            foreach (request in level.pleaforhelp.var_807ffb67240349f5) {
                if (!isdefined(request.objid) || request.objid != var_6d7cff43e352d995) {
                    continue;
                }
                namespace_446fc987a980892f::function_d87d5deb069bf8e5("assim_plea_successful", [0:request.var_15ab90a8de6865aa]);
                request.var_15ab90a8de6865aa namespace_58fb4f2e73fd41a0::setlowermessageomnvar("plea_found");
            }
        }
    }
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x3725
// Size: 0x83
function private function_92a21f649c882681(players, excludeself) {
    /#
        foreach (player in players) {
            if (istrue(excludeself) && player == self) {
                continue;
            }
            if (canteamassimilate(player.team)) {
                return player;
            }
        }
        return undefined;
    #/
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x37af
// Size: 0x2a
function private function_7042dba41fa6caa7() {
    /#
        enemies = namespace_54d20dd0dd79277f::getenemyplayers(self.team, 1);
        return function_92a21f649c882681(enemies);
    #/
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x37e0
// Size: 0x2c
function private function_48837726773365a3() {
    /#
        allies = namespace_54d20dd0dd79277f::getfriendlyplayers(self.team, 1);
        return function_92a21f649c882681(allies, 1);
    #/
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3813
// Size: 0x62
function private function_18e2c1e35d898fd4(players) {
    /#
        foreach (player in players) {
            if (ispleading(player)) {
                return player;
            }
        }
        return undefined;
    #/
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x387c
// Size: 0x29
function private function_2d8d6f7a961651a() {
    /#
        allies = namespace_54d20dd0dd79277f::getfriendlyplayers(self.team, 0);
        return function_18e2c1e35d898fd4(allies);
    #/
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x38ac
// Size: 0x29
function private function_7d0bc76589236066() {
    /#
        enemies = namespace_54d20dd0dd79277f::getenemyplayers(self.team, 0);
        return function_18e2c1e35d898fd4(enemies);
    #/
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x38dc
// Size: 0x3c
function private function_ae60e43aa67248ec() {
    /#
        level endon("request_plea_kbm");
        while (1) {
            debugstr = getdvar(@"hash_eb618aa3462ac731", "plea_for_help_looting");
            function_e6c82ddc6a58c02f(debugstr);
            waitframe();
        }
    #/
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x391f
// Size: 0x8eb
function function_e6c82ddc6a58c02f(command) {
    /#
        if (command == "plea_for_help_looting") {
            return;
        }
        setdvar(@"hash_eb618aa3462ac731", "plea_for_help_looting");
        /#
            assert(function_4db915a9ce0e903a(), "hud_icon_plea_for_help" + command + "squad_member_revived");
        #/
        host = namespace_d576b6dc7cef9c62::gethostplayer();
        switch (command) {
        case #"hash_819aac6f5ae2fb78":
            spawnorigin = namespace_e4c20df2c9115a56::function_78ec4accff5f158b(host);
            pleaforhelp(spawnorigin, host);
            break;
        case #"hash_f496f56c03c5932a":
            index = 0;
            var_496aaa68c40aeb44 = level.pleaforhelp.var_807ffb67240349f5[index];
            if (isdefined(var_496aaa68c40aeb44)) {
                var_496aaa68c40aeb44 function_b5341d976f6c944d();
            }
            break;
        case #"hash_b06d15a59bd8ea50":
            var_784c8ada1184ff89 = undefined;
            if (namespace_36f464722d326bbe::isbrstylegametype()) {
                var_784c8ada1184ff89 = host function_7042dba41fa6caa7();
            } else {
                var_607da387f3617ed1 = host squad_utility::getsquadmembers(undefined, 1);
                foreach (player in level.players) {
                    if (!array_contains(var_607da387f3617ed1, player)) {
                        var_784c8ada1184ff89 = player;
                        break;
                    }
                }
            }
            index = host getentitynumber();
            var_496aaa68c40aeb44 = level.pleaforhelp.var_807ffb67240349f5[index];
            if (isdefined(var_784c8ada1184ff89) && isdefined(var_496aaa68c40aeb44)) {
                var_496aaa68c40aeb44 function_fec9399c00988060(var_784c8ada1184ff89);
            } else {
                host function_4216d7bae9b2f46b();
            }
            break;
        case #"hash_4dbdd32b739cea31":
            var_784c8ada1184ff89 = undefined;
            var_8850d9f771525016 = undefined;
            if (namespace_36f464722d326bbe::isbrstylegametype()) {
                var_784c8ada1184ff89 = host function_7042dba41fa6caa7();
            } else {
                var_607da387f3617ed1 = host squad_utility::getsquadmembers();
                foreach (player in level.players) {
                    if (!array_contains(var_607da387f3617ed1, player)) {
                        var_784c8ada1184ff89 = player;
                        break;
                    }
                }
                foreach (player in var_607da387f3617ed1) {
                    if (player != host) {
                        var_8850d9f771525016 = player;
                        break;
                    }
                }
            }
            if (!isdefined(var_8850d9f771525016)) {
                break;
            }
            index = var_8850d9f771525016 getentitynumber();
            var_496aaa68c40aeb44 = level.pleaforhelp.var_807ffb67240349f5[index];
            if (isdefined(var_784c8ada1184ff89) && isdefined(var_496aaa68c40aeb44)) {
                var_496aaa68c40aeb44 function_fec9399c00988060(var_784c8ada1184ff89);
            } else {
                var_8850d9f771525016 function_4216d7bae9b2f46b();
            }
            break;
        case #"hash_d9c066dce739a214":
            enemy = host function_7042dba41fa6caa7();
            ally = host function_2d8d6f7a961651a();
            if (isdefined(enemy) && isdefined(ally)) {
                var_496aaa68c40aeb44 = level.pleaforhelp.var_807ffb67240349f5[ally getentitynumber()];
                var_496aaa68c40aeb44 function_fec9399c00988060(enemy);
            }
            break;
        case #"hash_f4117cda32ce76e2":
            var_f2bfd23f22dffe48 = host function_48837726773365a3();
            var_bff0b5021a849939 = host function_7d0bc76589236066();
            index = var_bff0b5021a849939 getentitynumber();
            var_496aaa68c40aeb44 = level.pleaforhelp.var_807ffb67240349f5[index];
            var_496aaa68c40aeb44.useent.var_fb04222d93e0905b = 0;
            if (isdefined(var_f2bfd23f22dffe48) && isdefined(var_bff0b5021a849939) && isdefined(var_496aaa68c40aeb44)) {
                thread function_4e60ea7d6c5ab305(var_496aaa68c40aeb44.useent, undefined, undefined, var_f2bfd23f22dffe48, undefined, undefined);
            }
            break;
        case #"hash_a1d0fbd842549820":
            var_ac7a2c561f3b5346 = host function_7042dba41fa6caa7();
            var_33f9f9c6a27f196d = host function_2d8d6f7a961651a();
            var_496aaa68c40aeb44 = function_c069f41a6bc4a19a(var_33f9f9c6a27f196d);
            if (isdefined(var_ac7a2c561f3b5346) && isdefined(var_33f9f9c6a27f196d) && isdefined(var_496aaa68c40aeb44)) {
                wait(2);
                var_496aaa68c40aeb44.useent.var_fb04222d93e0905b = 1;
                while (ispleading(var_33f9f9c6a27f196d)) {
                    waitframe();
                }
            }
            break;
        case #"hash_95da9dc85da1516a":
            var_e598f816aa2660e2 = function_18e2c1e35d898fd4(level.players);
            enemy = var_e598f816aa2660e2 function_7042dba41fa6caa7();
            if (isdefined(enemy) && isdefined(var_e598f816aa2660e2)) {
                var_496aaa68c40aeb44 = level.pleaforhelp.var_807ffb67240349f5[var_e598f816aa2660e2 getentitynumber()];
                var_496aaa68c40aeb44 function_fec9399c00988060(enemy);
            }
            break;
        case #"hash_917a1f42016f6b48":
            foreach (player in level.players) {
                if (isdefined(player.var_ca28d060b3b6ab8e) && player.var_ca28d060b3b6ab8e.type == 6) {
                    player notify("<unknown string>", player.var_ca28d060b3b6ab8e.var_2a29afaacf2a9d72);
                }
            }
            break;
        case #"hash_f6de0b121a9d0974":
            level.laststandtimer = 2;
            var_68b39107a02d32e3 = [];
            foreach (player in level.players) {
                var_607da387f3617ed1 = player squad_utility::getsquadmembers(undefined, 1);
                if (var_607da387f3617ed1.size > 0 && player != host && !array_contains(var_607da387f3617ed1, host)) {
                    var_68b39107a02d32e3 = var_607da387f3617ed1;
                    break;
                }
            }
            thread function_23338d1c114a5c21(var_68b39107a02d32e3);
            break;
        case #"hash_acfb3e43dfccf93b":
            level.laststandtimer = 2;
            var_607da387f3617ed1 = host squad_utility::getsquadmembers(undefined, 1);
            thread function_23338d1c114a5c21(var_607da387f3617ed1);
            break;
        case #"hash_d6deadb2181a2563":
            var_784c8ada1184ff89 = undefined;
            var_607da387f3617ed1 = host squad_utility::getsquadmembers(undefined, 1);
            foreach (player in level.players) {
                if (!array_contains(var_607da387f3617ed1, player)) {
                    var_784c8ada1184ff89 = player;
                    break;
                }
            }
            if (isdefined(var_784c8ada1184ff89)) {
                var_784c8ada1184ff89.var_2f950a6a60ffb7d3 = host;
                var_784c8ada1184ff89 function_c26f981347110521(1);
            }
            break;
        case #"hash_4075b8ee46173ea":
            var_784c8ada1184ff89 = undefined;
            if (!isdefined(level.var_1a1165320c5bbcab)) {
                foreach (player in level.players) {
                    if (isbot(player)) {
                        level.var_1a1165320c5bbcab = player;
                        break;
                    }
                }
            }
            var_607da387f3617ed1 = level.var_1a1165320c5bbcab squad_utility::getsquadmembers(undefined, 1);
            foreach (player in level.players) {
                if (!array_contains(var_607da387f3617ed1, player)) {
                    var_784c8ada1184ff89 = player;
                    break;
                }
            }
            if (isdefined(var_784c8ada1184ff89)) {
                var_784c8ada1184ff89.var_2f950a6a60ffb7d3 = level.var_1a1165320c5bbcab;
                var_784c8ada1184ff89 function_c26f981347110521(1);
            }
            break;
        case #"hash_f4e4c7de968632b9":
            foreach (player in level.players) {
                player namespace_ede58c1e66c2c280::calloutmarkerping_createcallout(16, player.origin);
            }
            break;
        case #"hash_c4bdef897a6d7d6e":
            var_607da387f3617ed1 = host squad_utility::getsquadmembers(undefined, 1);
            foreach (player in level.players) {
                if (!array_contains(var_607da387f3617ed1, player)) {
                    player namespace_ede58c1e66c2c280::calloutmarkerping_createcallout(16, player.origin);
                    break;
                }
            }
            break;
        }
    #/
}

// Namespace namespace_aca170e0fe882d77/namespace_51790b5acb47a506
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4211
// Size: 0x8a
function function_23338d1c114a5c21(var_607da387f3617ed1) {
    /#
        level endon("request_plea_kbm");
        foreach (player in var_607da387f3617ed1) {
            player dodamage(player.health + 10000, player.origin, player);
            wait(level.laststandtimer + 1);
        }
    #/
}

