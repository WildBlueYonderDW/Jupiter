// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_6c4e8cea70bf4b6d;
#using script_3314add7998ab13;
#using scripts\mp\equipment\flash_grenade.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using script_64acb6ce534155b7;
#using script_744cad313ed0a87e;
#using scripts\mp\gameobjects.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\mp\gametypes\obj_dom.gsc;
#using script_4f9a55dee6aebc8f;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_4948cdf739393d2d;
#using scripts\mp\hud_message.gsc;
#using script_58f20490049af6ac;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\mp\utility\trigger.gsc;
#using scripts\mp\utility\lower_message.gsc;

#namespace namespace_1ab3ae0ffed87c04;

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72e
// Size: 0x1c4
function function_7aae8cb0d8b0ac6a(data) {
    level.var_dac66bb7e0b0f8a5 = spawnstruct();
    level.var_dac66bb7e0b0f8a5.circleradius = getdvarint(@"hash_456cced132e54c3d", 138);
    level.var_dac66bb7e0b0f8a5.capturetime = getdvarfloat(@"hash_70cb1dcb1d1ac8fe", 30);
    level.var_dac66bb7e0b0f8a5.var_1d0e180d1dd60548 = getdvarint(@"hash_cae441d87fa6374d", 0);
    level.var_dac66bb7e0b0f8a5.var_cbb87a25616a7681 = getdvarint(@"hash_d1ddb41c6c8a3af0", 4);
    level.var_dac66bb7e0b0f8a5.var_62623980dc128fd7 = getdvarint(@"hash_ef416ac86fbcd18e", 6);
    level.var_dac66bb7e0b0f8a5.var_b78e47e5cb9e429a = getdvarfloat(@"hash_9efddff4d4e1dc53", 0.2);
    level.var_dac66bb7e0b0f8a5.var_ee98df80874c48e0 = getdvarint(@"hash_631c94c8c496ec51", 5);
    level.var_dac66bb7e0b0f8a5.var_281e288ae263a2b9 = getdvarfloat(@"hash_9d45aadc299781b0", 0.5);
    level.var_dac66bb7e0b0f8a5.var_8bc6bb4728f30ffe = getdvarfloat(@"hash_cecd445a628e208d", 0);
    level.var_dac66bb7e0b0f8a5.var_be644fc4b0bd2cd9 = getdvarint(@"hash_c81ebcee034129b5", 1);
    data.createfunc = &function_9490ccb2177749a8;
    if (!isdefined(level._effect["bomb_squad_explosion"])) {
        level._effect["bomb_squad_explosion"] = loadfx("vfx/iw8_mp/gamemode/vfx_search_bombsite_destroy.vfx");
    }
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f9
// Size: 0x1fd
function function_9490ccb2177749a8(activity, owner) {
    task = function_5f6d9fd82bdd2d05(activity);
    task.owner = owner;
    owner.task = task;
    task.players = [];
    task.funcs["onInit"] = &function_1c76ce9faf00edd7;
    task.funcs["onPlayerAssigned"] = &function_dd6410a59565d135;
    task.funcs["onPlayerJoined"] = &function_b380232fafd74325;
    task.funcs["onPlayerRemoved"] = &function_7204f8ab0ccdb640;
    task.funcs["onTeamStart"] = &function_b28dc157dbd35764;
    task.funcs["onPlayerExitVolume"] = &function_fc5cebaf6ff3bfd6;
    task.funcs["onPlayerExitTimeout"] = &function_e09f977d133bac40;
    task.funcs["onPlayerReenterVolume"] = &function_e687ce41da9f8ef7;
    task.ref = "br_hold";
    task.var_30e8a65cff941c7a = namespace_1eb3c4e0e28fac71::getquesttableindex(task.ref);
    task.var_40dbdb41f33299f7 = 0;
    task.tier = task.owner namespace_bd614c3c2275579a::function_b7a9796c95aa8e8d();
    if (task.tier == "black") {
        task.mission_index = 49;
        task.mission_complete = 50;
        task.mission_fail = 0;
        task.var_bd764b17d3bf6325 = 0;
        task.var_3fa17a5a7af04803 = 65;
    } else {
        task.mission_index = 49;
        task.mission_complete = 50;
        task.mission_fail = 0;
        task.var_bd764b17d3bf6325 = 0;
        task.var_3fa17a5a7af04803 = 65;
    }
    return task;
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xafe
// Size: 0xe5
function function_1c76ce9faf00edd7() {
    task = self;
    task.activity.origin = task.owner.origin;
    task.circleradius = level.var_dac66bb7e0b0f8a5.circleradius;
    level.iconneutral = "hold_icon_captureneutral_br";
    level.iconcapture = "hold_icon_capture_br";
    level.var_1ab489e74bd53602 = "hold_icon_capture_enemy_br";
    level.icondefend = "hold_icon_defend_br";
    level.icondefending = "hold_icon_defending_br";
    level.iconcontested = "hold_icon_contested_br";
    level.icontaking = "hold_icon_taking_br";
    level.var_fa0fe1eb08253674 = "hold_icon_taking_enemy_br";
    level.iconlosing = "hold_icon_losing_br";
    level.iconovertime = "hold_icon_ot_br";
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbea
// Size: 0x253
function function_62d882541a989602() {
    task = self;
    trigger = spawn("trigger_radius", task.owner.loadout[0].origin, 0, level.var_dac66bb7e0b0f8a5.circleradius, 62);
    task.var_54f5e15c58954932 = task function_90087f601daf9fa1(trigger, "neutral", 0, 1, 0);
    task.var_54f5e15c58954932.onuse = &function_9498066c4d179fc0;
    task.var_54f5e15c58954932.onbeginuse = &function_423f3fa547719245;
    task.var_54f5e15c58954932.onenduse = &function_581b3c43aba983c5;
    task.var_54f5e15c58954932.id = "domFlag";
    task.var_54f5e15c58954932.ignorestomp = 0;
    task.var_54f5e15c58954932 namespace_19b4203b51d56488::requestid(0, 1, undefined, 0, 0);
    task.var_54f5e15c58954932.visibilitymanuallycontrolled = 1;
    task.var_54f5e15c58954932.stronghold = task.owner;
    task.var_54f5e15c58954932.task = task;
    task.circlecenter = task.owner.crate.origin;
    objective_removeallfrommask(task.var_54f5e15c58954932.objidnum);
    objective_showtoplayersinmask(task.var_54f5e15c58954932.objidnum);
    if (level.var_dac66bb7e0b0f8a5.var_be644fc4b0bd2cd9) {
        task.var_54f5e15c58954932.trigger namespace_5a51aa78ea0b1b9f::set_apply_emp_callback(&function_271a1d82062c2492);
        task.var_54f5e15c58954932.trigger.var_3545410459b16762 = &function_271a1d82062c2492;
        task.var_54f5e15c58954932.trigger.stronghold = task.owner;
    }
    task function_dd16568083975585();
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe44
// Size: 0x3d9
function function_90087f601daf9fa1(trigger, team, var_5ddbc1faed2c56e6, var_8b9949739f4e0f6, showoncompass) {
    task = self;
    function_b8069681edb5d72d();
    trigger function_57257d1ed9ce2f48(&function_a75fac84a75a8110);
    trigger.task = task;
    visuals[0] = spawn("script_model", trigger.origin);
    visuals[0] setmodel("tag_origin");
    visuals[0].angles = task.owner.loadout[0].angles;
    if (!isdefined(level.var_fb607d7bf823f6f9)) {
        level.var_fb607d7bf823f6f9 = level.var_dac66bb7e0b0f8a5.capturetime * 0.5;
    }
    var_3c2389ba69e5822b = undefined;
    team = "neutral";
    domflag = namespace_19b4203b51d56488::createuseobject(team, trigger, visuals, (0, 0, 62), var_3c2389ba69e5822b, var_8b9949739f4e0f6, showoncompass);
    domflag namespace_19b4203b51d56488::allowuse("any");
    domflag namespace_19b4203b51d56488::cancontestclaim(1);
    domflag namespace_19b4203b51d56488::setusetime(level.var_dac66bb7e0b0f8a5.capturetime);
    domflag namespace_19b4203b51d56488::pinobjiconontriggertouch();
    if (isdefined(level.capturetype)) {
        domflag namespace_19b4203b51d56488::setcapturebehavior(namespace_98b55913d2326ac8::getcapturetype());
    }
    domflag.onuse = &function_9498066c4d179fc0;
    domflag.onbeginuse = &function_423f3fa547719245;
    domflag.onenduse = &function_581b3c43aba983c5;
    domflag.onuncontested = &function_425361a8192f04a3;
    domflag.oncontested = &function_37011fa9cb797322;
    domflag.onuseupdate = &namespace_98b55913d2326ac8::dompoint_onuseupdate;
    domflag.onpinnedstate = &namespace_98b55913d2326ac8::dompoint_onpinnedstate;
    domflag.onunpinnedstate = &namespace_98b55913d2326ac8::dompoint_onunpinnedstate;
    domflag.nousebar = 1;
    domflag.id = "domFlag";
    domflag.claimgracetime = level.var_dac66bb7e0b0f8a5.capturetime * 1000;
    domflag.firstcapture = 1;
    domflag.var_823c5a7bf6a0e64a = 0;
    domflag.var_fb60f3aec3a62f06 = level.flagModelHidden;
    if (istrue(domflag.var_823c5a7bf6a0e64a)) {
        domflag.var_9abe4ab71ae5d548 = domflag.usetime - 1;
        domflag.reinforcementStompScalar = level.reinforcementStompScalar;
        if (isdefined(level.flagDecayTime) && level.flagDecayTime > 0) {
            domflag.decayrate = domflag.usetime * level.framedurationseconds / level.flagDecayTime;
        }
    }
    domflag.baseeffectpos = trigger.origin;
    if (getdvarint(@"hash_ac14d98c253c4715", 1) == 1) {
        var_c6b7900c1fa0a1b6 = trigger.origin;
        var_62a39a040c10984c = spawn("script_model", var_c6b7900c1fa0a1b6);
        var_62a39a040c10984c setmodel("stronghold_control_point");
        var_62a39a040c10984c.angles = task.owner.loadout[0].angles;
        var_62a39a040c10984c setscriptablepartstate("flag", "idle");
        domflag.vfxnamemod = var_62a39a040c10984c;
        var_62a39a040c10984c.domflag = domflag;
    }
    domflag.noscriptable = 1;
    domflag namespace_98b55913d2326ac8::initializematchrecording();
    if (!istrue(var_8b9949739f4e0f6)) {
        domflag namespace_98b55913d2326ac8::domflag_setneutral();
    }
    return domflag;
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1225
// Size: 0x56
function function_a75fac84a75a8110() {
    trigger = self;
    if (isdefined(trigger.task)) {
        trigger.task thread namespace_b8f885001f04bb5::function_addda96ba479db4e(undefined, 1, undefined, istrue(trigger.task.var_54f5e15c58954932.var_554291b6257ea5d0));
    }
    return 0;
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1283
// Size: 0x131
function function_425361a8192f04a3(lastclaimteam) {
    if (istrue(level.flagneutralization) && !self.firstcapture) {
        namespace_19b4203b51d56488::setusetime(level.flagcapturetime * 0.5);
    }
    self.contestedtime = undefined;
    self.didstatusnotify = 0;
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    var_ff99447227b9fbac = ter_op(ownerteam == "neutral", "idle", ownerteam);
    thread namespace_98b55913d2326ac8::updateflagstate(var_ff99447227b9fbac, 0);
    self.task function_68b9ba1de74cb130();
    foreach (player in self.task.players) {
        if (player getclientomnvar("ui_br_stronghold_mission") == self.task.var_3fa17a5a7af04803) {
            player setclientomnvar("ui_br_stronghold_mission", self.task.mission_index);
        }
    }
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13bb
// Size: 0xdf
function function_b8069681edb5d72d() {
    _setdomencountericoninfo("hold_icon_captureneutral_br", "neutral", "hud_icon_objective_defend_point_neutral");
    _setdomencountericoninfo("hold_icon_defend_br", "friendly", "hud_icon_objective_defend_point_friendly");
    _setdomencountericoninfo("hold_icon_defending_br", "friendly", "hud_icon_objective_defend_point_friendly");
    _setdomencountericoninfo("hold_icon_contested_br", "contest", "hud_icon_objective_defend_point_contest");
    _setdomencountericoninfo("hold_icon_losing_br", "enemy", "hud_icon_objective_defend_point_enemy");
    _setdomencountericoninfo("hold_icon_ot_br", "friendly", "hud_icon_objective_defend_point_friendly");
    _setdomencountericoninfo("hold_icon_taking_br", "friendly", "hud_icon_objective_defend_point_friendly");
    _setdomencountericoninfo("hold_icon_taking_enemy_br", "enemy", "hud_icon_objective_defend_point_enemy");
    _setdomencountericoninfo("hold_icon_capture_br", "friendly", "hud_icon_objective_defend_point_friendly");
    _setdomencountericoninfo("hold_icon_capture_enemy_br", "enemy", "hud_icon_objective_defend_point_enemy");
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14a1
// Size: 0x44
function _setdomencountericoninfo(name, colors, icon) {
    level.waypointcolors[name] = colors;
    level.waypointbgtype[name] = 1;
    level.waypointshader[name] = icon;
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14ec
// Size: 0xbb
function function_37011fa9cb797322(lastclaimteam) {
    namespace_98b55913d2326ac8::dompoint_oncontested();
    foreach (player in self.task.players) {
        if (player getclientomnvar("ui_br_stronghold_mission") != self.task.var_3fa17a5a7af04803) {
            player setclientomnvar("ui_br_stronghold_mission", self.task.var_3fa17a5a7af04803);
        }
    }
    self.task function_68b9ba1de74cb130();
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ae
// Size: 0xdd
function function_423f3fa547719245(player) {
    if (isdefined(self.stronghold.var_4756733ecc825a2) && isdefined(self.claimteam)) {
        if (self.claimteam == self.stronghold.var_4756733ecc825a2) {
            self.task brTask_holdSetVisible(0);
        } else {
            self.task notify("stronghold_enemy_capture_start");
        }
    }
    var_54f5e15c58954932 = self;
    player.iscapturing = 1;
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    if (ownerteam == "neutral" && isplayer(player)) {
        player setclientomnvar("ui_objective_pinned_text_param", 1);
    }
    self.didstatusnotify = 1;
    self.task function_68b9ba1de74cb130();
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1692
// Size: 0x317
function function_9498066c4d179fc0(player) {
    var_54f5e15c58954932 = self;
    isvalidplayer = isdefined(player) && isplayer(player) && isalive(player);
    if (isvalidplayer) {
        if (istrue(level.var_25e8b4afe5e06169)) {
            level thread namespace_1eb3c4e0e28fac71::utilflare_shootflare(var_54f5e15c58954932.stronghold.origin, "revive", 1);
            dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
            if (!isdefined(var_54f5e15c58954932.var_ba8ebd863c649d8e)) {
                var_54f5e15c58954932.var_ba8ebd863c649d8e = [];
            }
            if (!istrue(var_54f5e15c58954932.var_3c83e6760ebc0979) && !array_contains(var_54f5e15c58954932.var_ba8ebd863c649d8e, player.team)) {
                if (isdefined(var_54f5e15c58954932.stronghold.var_6278cec927f21e0) && var_54f5e15c58954932.stronghold.var_6278cec927f21e0 != player.team && !istrue(level.var_702998e8e05d126f)) {
                    player namespace_bd614c3c2275579a::function_9d216f4cd30f141d(dropstruct, getteamarray(player.team, 0), player.team);
                    var_54f5e15c58954932.var_ba8ebd863c649d8e = array_add(var_54f5e15c58954932.var_ba8ebd863c649d8e, player.team);
                } else if (!isdefined(var_54f5e15c58954932.stronghold.var_4756733ecc825a2) && !isdefined(var_54f5e15c58954932.stronghold.var_6278cec927f21e0)) {
                    var_54f5e15c58954932.stronghold.var_6278cec927f21e0 = player.team;
                    player namespace_bd614c3c2275579a::function_9d216f4cd30f141d(dropstruct, getteamarray(player.team, 0), player.team);
                    var_54f5e15c58954932.var_ba8ebd863c649d8e = array_add(var_54f5e15c58954932.var_ba8ebd863c649d8e, player.team);
                }
            }
            var_54f5e15c58954932.task function_addda96ba479db4e(player.team, 0, 1, istrue(var_54f5e15c58954932.var_554291b6257ea5d0));
            var_54f5e15c58954932.task.owner function_c148f98e91e7df37(dropstruct, player);
        } else {
            level thread namespace_1eb3c4e0e28fac71::utilflare_shootflare(var_54f5e15c58954932.stronghold.origin, "revive", 1);
            dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
            var_54f5e15c58954932.task.owner function_c148f98e91e7df37(dropstruct, player);
            function_6f6f83ab76483811(var_54f5e15c58954932.task, player);
            if (!istrue(var_54f5e15c58954932.var_3c83e6760ebc0979)) {
                player namespace_bd614c3c2275579a::function_9d216f4cd30f141d(dropstruct, getteamarray(player.team, 0), player.team);
            }
            var_54f5e15c58954932.task function_addda96ba479db4e(player.team, undefined, undefined, istrue(var_54f5e15c58954932.var_554291b6257ea5d0));
        }
    }
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19b0
// Size: 0xab
function function_581b3c43aba983c5(team, player, success) {
    if (isplayer(player)) {
        player.iscapturing = 0;
        player setclientomnvar("ui_objective_pinned_text_param", 0);
        player.ui_dom_securing = undefined;
    }
    self.task brTask_holdSetVisible(0);
    self.task function_68b9ba1de74cb130();
    self.didstatusnotify = 0;
    if (isdefined(team) && team == "none" || player.team != team) {
        return;
    }
    thread namespace_98b55913d2326ac8::updateflagstate(team, 0);
    self.neutralized = 0;
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a62
// Size: 0x99
function function_750304b9f07eb073(player) {
    task = self;
    teamname = player.team;
    task notify("strongholdNeutralize");
    task endon("strongholdNeutralize");
    task endon("stronghold_recapture");
    task endon("stronghold_enemy_capture_start");
    var_fcd89921f4b87602 = getdvarint(@"hash_d95a688350cfedbc", 30);
    if (isdefined(var_fcd89921f4b87602)) {
        wait(var_fcd89921f4b87602);
    }
    var_5f8fc154303502fa = task namespace_244fdc99ed0f5d2b::function_ad20469c1815a7c7(teamname, 1);
    if (var_5f8fc154303502fa.size > 0) {
        return;
    }
    task function_3b3b119a92986947(player, 0, "timeout");
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b03
// Size: 0x2ca
function function_3b3b119a92986947(player, var_d60fddb3d37776a1, var_384785a7fc070482) {
    task = self;
    teamname = player.team;
    if (isdefined(task.var_54f5e15c58954932.stronghold)) {
        if (istrue(var_d60fddb3d37776a1) || istrue(level.var_ac1bfebb54363b49) && task.var_54f5e15c58954932.stronghold.var_4756733ecc825a2 == teamname) {
            task.owner notify("fortressNeutralized");
        }
        function_d95dbf57b47734d9(task.var_54f5e15c58954932.stronghold, 0);
        if (task.var_54f5e15c58954932.stronghold.var_aac94ce6a0278a36.playercount > 0 && !istrue(var_d60fddb3d37776a1)) {
            function_d95dbf57b47734d9(task.var_54f5e15c58954932.stronghold, 1);
        }
        player namespace_bd614c3c2275579a::function_20ade7ff2a106977(task.var_54f5e15c58954932.stronghold, var_384785a7fc070482, "neutralized");
    }
    if (isdefined(task.owner) && isdefined(task.owner.crate) && isdefined(task.owner.crate.players)) {
        foreach (var_4494cac530e83f63 in task.owner.crate.players) {
            task.owner.crate namespace_bd614c3c2275579a::function_648d8f21bd9dc5c4(var_4494cac530e83f63);
        }
        task.owner.crate.players = [];
    }
    task.var_54f5e15c58954932 namespace_98b55913d2326ac8::domflag_setneutral();
    task.var_54f5e15c58954932 namespace_19b4203b51d56488::resetcaptureprogress();
    namespace_5a22b6f3a56f7e9b::objective_set_progress_team(task.var_54f5e15c58954932.objidnum, "none");
    namespace_5a22b6f3a56f7e9b::objective_set_progress(task.var_54f5e15c58954932.objidnum, 0);
    namespace_5a22b6f3a56f7e9b::objective_show_progress(task.var_54f5e15c58954932.objidnum, 0);
    task.var_54f5e15c58954932.stronghold.var_4756733ecc825a2 = undefined;
    task function_68b9ba1de74cb130();
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dd4
// Size: 0x4b
function function_29c7e65e828011cf(enable) {
    if (enable) {
        namespace_19b4203b51d56488::allowuse("any");
        self.trigger namespace_3c37cb17ade254d::trigger_on();
    } else {
        namespace_19b4203b51d56488::allowuse("none");
        self.trigger namespace_3c37cb17ade254d::trigger_off();
    }
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e26
// Size: 0x68
function brTask_holdSetVisible(enable, preview, var_ddf49b0f7bd17a0c) {
    task = self;
    task.var_54f5e15c58954932 notify("brTask_holdSetVisible");
    if (enable) {
        task function_68b9ba1de74cb130();
    } else {
        task.var_54f5e15c58954932 function_5f306cd80ad9fd17(task.owner, preview, var_ddf49b0f7bd17a0c);
    }
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e95
// Size: 0x5b
function function_5f306cd80ad9fd17(owner, preview, var_ddf49b0f7bd17a0c) {
    var_54f5e15c58954932 = self;
    var_54f5e15c58954932 endon("brTask_holdSetVisible");
    if (!istrue(var_ddf49b0f7bd17a0c)) {
        objective_setpinned(var_54f5e15c58954932.objidnum, 0);
        wait(1);
    }
    var_54f5e15c58954932.task function_562f681bfeedc7c3();
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ef7
// Size: 0xb8
function function_69826af85003ab57(owner) {
    var_54f5e15c58954932 = self;
    if (!isdefined(owner.var_aac94ce6a0278a36)) {
        return;
    }
    objective_removeallfrommask(var_54f5e15c58954932.objidnum);
    foreach (ent in owner.var_aac94ce6a0278a36.var_abe8f125e1a6ad1e) {
        if (isplayer(ent) && isreallyalive(ent)) {
            objective_addclienttomask(var_54f5e15c58954932.objidnum, ent);
        }
    }
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fb6
// Size: 0x45
function function_562f681bfeedc7c3() {
    task = self;
    objective_removeallfrommask(task.var_54f5e15c58954932.objidnum);
    objective_removeallfrommask(task.var_936e3ff613f879a1.objidnum);
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2002
// Size: 0x1e8
function function_dd6410a59565d135(teamname, player, var_554291b6257ea5d0) {
    if (!isdefined(var_554291b6257ea5d0)) {
        var_554291b6257ea5d0 = 0;
    }
    task = self;
    var_aa128e29d7c10074 = namespace_36f464722d326bbe::isaigameparticipant(player);
    task.owner namespace_bd614c3c2275579a::function_dacf98a6e7acadeb(player, player.team);
    if (!istrue(player.var_3e65a82afb7eb67)) {
        player.var_3e65a82afb7eb67 = 1;
    } else {
        return;
    }
    if (!var_554291b6257ea5d0) {
        task thread namespace_244fdc99ed0f5d2b::function_a33c10c0682918bd(task.owner.var_e1dd7bed632a13c3, 0);
    }
    if (!isdefined(task.var_54f5e15c58954932)) {
        task function_62d882541a989602();
        task.var_54f5e15c58954932.originalteam = player.team;
        if (istrue(level.var_dac66bb7e0b0f8a5.var_1d0e180d1dd60548)) {
            task thread namespace_bd614c3c2275579a::function_6162d039fd0cdbd4(task.owner, "high", level.var_dac66bb7e0b0f8a5.var_cbb87a25616a7681);
            task thread function_56d0be781029a019();
        }
    }
    if (isdefined(task.var_54f5e15c58954932) && !istrue(task.var_54f5e15c58954932.var_cd46901b33d5fd1b)) {
        if (istrue(level.var_25e8b4afe5e06169)) {
            if (!isdefined(task.var_54f5e15c58954932.stronghold.var_4756733ecc825a2)) {
                namespace_9823ee6035594d67::function_d95dbf57b47734d9(task.owner, 1);
            }
        } else {
            namespace_9823ee6035594d67::function_d95dbf57b47734d9(task.owner, 1);
        }
    }
    if (var_aa128e29d7c10074) {
        task function_b380232fafd74325(player, var_554291b6257ea5d0);
        return;
    }
    if (!istrue(level.br_circle_disabled)) {
        task thread function_682e6a05a3109ea1(var_554291b6257ea5d0);
    }
    task function_b380232fafd74325(player, var_554291b6257ea5d0);
    player.var_3e65a82afb7eb67 = undefined;
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21f1
// Size: 0x15d
function function_56d0be781029a019() {
    level endon("game_ended");
    task = self;
    task endon("task_ended");
    while (isdefined(task.var_54f5e15c58954932) && isdefined(task.var_54f5e15c58954932.usetime) && task.var_54f5e15c58954932.usetime * level.var_dac66bb7e0b0f8a5.var_b78e47e5cb9e429a > task.var_54f5e15c58954932.curprogress) {
        wait(0.5);
    }
    thread namespace_bd614c3c2275579a::function_6162d039fd0cdbd4(task.owner, "high", level.var_dac66bb7e0b0f8a5.var_62623980dc128fd7);
    while (isdefined(task.var_54f5e15c58954932) && isdefined(task.var_54f5e15c58954932.usetime) && task.var_54f5e15c58954932.usetime * level.var_dac66bb7e0b0f8a5.var_281e288ae263a2b9 > task.var_54f5e15c58954932.curprogress) {
        wait(0.5);
    }
    thread namespace_bd614c3c2275579a::function_6162d039fd0cdbd4(task.owner, "high", level.var_dac66bb7e0b0f8a5.var_ee98df80874c48e0);
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2355
// Size: 0x1f8
function function_b380232fafd74325(player, var_554291b6257ea5d0) {
    if (!isdefined(var_554291b6257ea5d0)) {
        var_554291b6257ea5d0 = 0;
    }
    task = self;
    if (!isdefined(array_find(task.players, player))) {
        size = task.players.size;
        task.players[size] = player;
    }
    var_aa128e29d7c10074 = namespace_36f464722d326bbe::isaigameparticipant(player);
    if (var_aa128e29d7c10074) {
        return;
    }
    var_d0cb4e7edbd1a617 = player getclientomnvar("ui_br_stronghold_mission");
    if (!isdefined(task.originalteam)) {
        task.originalteam = player.team;
    }
    if (!istrue(task.var_54f5e15c58954932.var_cd46901b33d5fd1b)) {
        task.var_54f5e15c58954932 function_29c7e65e828011cf(1);
    }
    task brTask_holdSetVisible(1);
    player.initialized_gameobject_vars = 1;
    if (!isdefined(player.touchtriggers)) {
        player.touchtriggers = [];
    }
    if (!var_554291b6257ea5d0 && (!isdefined(task.var_54f5e15c58954932.stronghold.var_4756733ecc825a2) || task.var_54f5e15c58954932.stronghold.var_4756733ecc825a2 != player.team)) {
        player thread namespace_44abc05161e2e2cb::showsplash("stronghold_operation_hold_the_line");
        wait(4);
    }
    if (!isdefined(player) || !array_contains(task.players, player)) {
        return;
    }
    if (!var_554291b6257ea5d0 && var_d0cb4e7edbd1a617 == player getclientomnvar("ui_br_stronghold_mission")) {
        player setclientomnvar("ui_br_stronghold_mission", task.mission_index);
    }
    task function_1851e9cfb7687f68(player);
    /#
        if (level.var_dac66bb7e0b0f8a5.var_8bc6bb4728f30ffe) {
            task thread function_f2aabfd0e35a668b();
        }
    #/
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2554
// Size: 0xa4
function function_7204f8ab0ccdb640(player, var_554291b6257ea5d0) {
    if (!isdefined(var_554291b6257ea5d0)) {
        var_554291b6257ea5d0 = 0;
    }
    task = self;
    var_aa128e29d7c10074 = namespace_36f464722d326bbe::isaigameparticipant(player);
    if (!var_554291b6257ea5d0) {
        task.players = array_remove(task.players, player);
    }
    if (var_aa128e29d7c10074) {
        return;
    }
    if (!var_554291b6257ea5d0) {
        player setclientomnvar("ui_br_stronghold_mission", task.mission_fail);
    }
    task.var_54f5e15c58954932 function_581b3c43aba983c5(player.team, player, 0);
    task notify("left_activity_area");
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25ff
// Size: 0x8f
function function_f2aabfd0e35a668b() {
    /#
        task = self;
        level endon("stronghold_control_point");
        task endon("stronghold_enemy_capture_start");
        color = (0.5, 1, 1);
        while (1) {
            draw_circle(task.var_54f5e15c58954932.trigger.origin + (0, 0, 5), level.var_dac66bb7e0b0f8a5.circleradius, color, 1, 1, 1);
            waitframe();
        }
    #/
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2695
// Size: 0x1c
function function_b28dc157dbd35764(teamname) {
    /#
        assert(1, "Bomb Squad is a volume player start stronghold mission only!");
    #/
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26b8
// Size: 0x1ae
function function_59a5a14bce811cdd(teamname, var_b677bbe2241c4e3f, detonated, var_641c32466af43f9, var_554291b6257ea5d0) {
    if (!isdefined(var_554291b6257ea5d0)) {
        var_554291b6257ea5d0 = 0;
    }
    task = self;
    var_5f8fc154303502fa = task namespace_244fdc99ed0f5d2b::function_ad20469c1815a7c7(teamname, 1);
    if (!var_554291b6257ea5d0) {
        level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[teamname].var_83abcb9b3a5dbe24 = array_remove(level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[teamname].var_83abcb9b3a5dbe24, task.activity.id);
        task.teams = array_remove(task.teams, teamname);
        level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[teamname].active = 0;
    }
    var_e4ba0357793fd3c7 = !var_554291b6257ea5d0;
    foreach (player in var_5f8fc154303502fa) {
        if (!var_554291b6257ea5d0) {
            task.players = array_remove(task.players, player);
            task.var_54f5e15c58954932 function_581b3c43aba983c5(teamname, player, var_641c32466af43f9);
        }
        if (namespace_36f464722d326bbe::isaigameparticipant(player)) {
            continue;
        }
        if (!var_554291b6257ea5d0 || !istrue(detonated)) {
            task function_aeb2d6fe1ee9d0f3(player, detonated, var_b677bbe2241c4e3f, var_e4ba0357793fd3c7);
        }
    }
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x286d
// Size: 0x53
function function_fc5cebaf6ff3bfd6(player) {
    task = self;
    player.var_e09c6ea56555f1ed = 1;
    var_aa128e29d7c10074 = namespace_36f464722d326bbe::isaigameparticipant(player);
    if (!var_aa128e29d7c10074) {
        player setclientomnvar("ui_br_stronghold_mission", task.var_bd764b17d3bf6325);
    }
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28c7
// Size: 0xaa
function function_e687ce41da9f8ef7(player) {
    task = self;
    player.var_e09c6ea56555f1ed = undefined;
    var_aa128e29d7c10074 = namespace_36f464722d326bbe::isaigameparticipant(player);
    if (!var_aa128e29d7c10074) {
        player setclientomnvar("ui_br_stronghold_mission", task.mission_index);
    }
    if (isdefined(task.var_54f5e15c58954932.stronghold.var_4756733ecc825a2) && player.team == task.var_54f5e15c58954932.stronghold.var_4756733ecc825a2) {
        task notify("stronghold_recapture");
    }
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2978
// Size: 0xb4
function function_e09f977d133bac40(player) {
    task = self;
    task function_7204f8ab0ccdb640(player);
    player.var_e09c6ea56555f1ed = 1;
    if (isdefined(level.var_fc0e8c2ea4f84613)) {
        task [[ level.var_fc0e8c2ea4f84613 ]](player);
    }
    if (istrue(level.var_ac1bfebb54363b49) && isdefined(task.var_54f5e15c58954932.stronghold.var_4756733ecc825a2) && player.team == task.var_54f5e15c58954932.stronghold.var_4756733ecc825a2) {
        task thread function_750304b9f07eb073(player);
    }
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2a33
// Size: 0x99
function private function_aeb2d6fe1ee9d0f3(player, detonated, var_b677bbe2241c4e3f, var_e4ba0357793fd3c7) {
    task = self;
    if (istrue(var_e4ba0357793fd3c7)) {
        player setclientomnvar("ui_br_stronghold_mission", var_b677bbe2241c4e3f);
    }
    if (var_b677bbe2241c4e3f == task.mission_complete) {
        player thread namespace_44abc05161e2e2cb::showsplash("stronghold_operation_hold_the_line_completed");
    } else {
        if (istrue(detonated)) {
            player thread namespace_44abc05161e2e2cb::showsplash("stronghold_operation_hold_the_line_failed");
        } else {
            player thread namespace_44abc05161e2e2cb::showsplash("stronghold_operation_hold_the_line_failed");
        }
        if (istrue(var_e4ba0357793fd3c7)) {
            player setclientomnvar("ui_br_stronghold_mission", 0);
        }
    }
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2ad3
// Size: 0x4d0
function private function_addda96ba479db4e(teamname, detonated, loop, var_554291b6257ea5d0) {
    if (!isdefined(var_554291b6257ea5d0)) {
        var_554291b6257ea5d0 = 0;
    }
    task = self;
    if (isdefined(level.var_3afacc0c3b10b7fe) && isdefined(teamname)) {
        task.owner [[ level.var_3afacc0c3b10b7fe ]](teamname, !istrue(detonated));
    }
    var_e4ba0357793fd3c7 = !var_554291b6257ea5d0;
    if (istrue(loop)) {
        if (isdefined(task.var_54f5e15c58954932.stronghold.var_4756733ecc825a2)) {
            foreach (player in getteamdata(task.var_54f5e15c58954932.stronghold.var_4756733ecc825a2, "players")) {
                player thread namespace_44abc05161e2e2cb::showsplash("stronghold_operation_hold_the_line_stolen");
            }
        }
        foreach (team in task.teams) {
            var_641c32466af43f9 = 0;
            if (isdefined(teamname) && isdefined(team)) {
                var_641c32466af43f9 = team == teamname;
            }
            var_b677bbe2241c4e3f = task.mission_fail;
            if (var_641c32466af43f9) {
                var_b677bbe2241c4e3f = task.mission_complete;
            }
            var_5f8fc154303502fa = task namespace_244fdc99ed0f5d2b::function_ad20469c1815a7c7(team, 1);
            foreach (player in var_5f8fc154303502fa) {
                if (isdefined(task.var_54f5e15c58954932.stronghold.var_4756733ecc825a2)) {
                    jumpiffalse(player.team == task.var_54f5e15c58954932.stronghold.var_4756733ecc825a2) LOC_00000251;
                } else {
                LOC_00000251:
                    if (namespace_36f464722d326bbe::isaigameparticipant(player)) {
                        continue;
                    }
                    task function_aeb2d6fe1ee9d0f3(player, detonated, var_b677bbe2241c4e3f, var_e4ba0357793fd3c7);
                }
            }
        }
    } else {
        if (!var_554291b6257ea5d0) {
            task notify("task_ended");
            namespace_9823ee6035594d67::function_be5a531f97b7c07e(task.owner);
        }
        var_ed264f0df8bf58fb = 0;
        foreach (team in task.teams) {
            var_641c32466af43f9 = 0;
            if (isdefined(teamname) && isdefined(team)) {
                var_641c32466af43f9 = team == teamname;
            }
            var_b677bbe2241c4e3f = task.mission_fail;
            if (var_641c32466af43f9) {
                var_ed264f0df8bf58fb = 1;
                var_b677bbe2241c4e3f = task.mission_complete;
            }
            task function_59a5a14bce811cdd(team, var_b677bbe2241c4e3f, detonated, var_641c32466af43f9, var_554291b6257ea5d0);
        }
        if (!var_554291b6257ea5d0) {
            task.players = [];
            task.teams = [];
            task function_2476daefa3384c5e();
            task function_629ed367d1393020();
            task function_114582ecfebb0acc();
        }
        if (istrue(detonated)) {
            task.owner.crate thread namespace_bd614c3c2275579a::function_faa1ecbc7f0bed85(undefined, 0, 1, 1, 0);
        }
        if (!isdefined(detonated)) {
            detonated = 0;
        }
        if (!var_554291b6257ea5d0) {
            task.starttime = undefined;
            if (isdefined(task.activity) && isdefined(task.activity.var_b7718b6e41108129) && task.activity.var_b7718b6e41108129.size >= 1 && (var_ed264f0df8bf58fb || detonated)) {
                task.owner.var_e1dd7bed632a13c3 notify("activity_ended");
                level.var_1b7407dffe81e6e8.var_83abcb9b3a5dbe24[task.activity.id] = undefined;
                task.activity.var_b7718b6e41108129 = undefined;
                namespace_98b55913d2326ac8::removeobjective(task.var_54f5e15c58954932);
            }
        } else if (istrue(detonated)) {
            namespace_98b55913d2326ac8::removeobjective(task.var_54f5e15c58954932);
            if (isdefined(task.var_54f5e15c58954932.vfxnamemod)) {
                task.var_54f5e15c58954932.vfxnamemod setscriptablepartstate("flag", "off");
            }
        }
    }
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2faa
// Size: 0x16f
function function_682e6a05a3109ea1(var_554291b6257ea5d0) {
    task = self;
    level endon("game_ended");
    if (!var_554291b6257ea5d0) {
        task endon("task_ended");
        task.owner.var_e1dd7bed632a13c3 endon("deleted");
        task.owner.var_e1dd7bed632a13c3 endon("activity_ended");
    }
    if (istrue(task.owner.var_d7be9c77ce31b93d)) {
        return;
    }
    origin = task.owner.origin + (0, 0, 62);
    task.owner.var_d7be9c77ce31b93d = 1;
    waitframe();
    waittillframeend();
    while (namespace_bbc79db4c3949a5c::function_ee854fdd1e77efc4(origin) || namespace_bbc79db4c3949a5c::function_a465e3c1371d7dab(origin)) {
        wait(0.25);
    }
    if (!var_554291b6257ea5d0) {
        foreach (player in task.players) {
            if (!isdefined(player)) {
                continue;
            }
            var_aa128e29d7c10074 = namespace_36f464722d326bbe::isaigameparticipant(player);
            if (var_aa128e29d7c10074) {
                continue;
            }
            task thread function_e09f977d133bac40(player);
        }
    }
    task thread function_addda96ba479db4e(undefined, 1, undefined, var_554291b6257ea5d0);
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3121
// Size: 0xb7
function function_c148f98e91e7df37(dropstruct, player) {
    fortress = self;
    if (istrue(fortress.var_933f9685674999fb)) {
        uavtype = "directional_uav";
    } else {
        uavtype = "uav";
    }
    player namespace_bd614c3c2275579a::function_20ade7ff2a106977(fortress, "captured", "captured");
    if (istrue(level.var_25e8b4afe5e06169) && istrue(fortress.captured)) {
        fortress namespace_bd614c3c2275579a::function_5c26662d5381e975(player, undefined, uavtype, 1);
    } else {
        fortress namespace_bd614c3c2275579a::function_5c26662d5381e975(player, undefined, uavtype, 1);
        if (istrue(level.var_10171e70e51c0380)) {
            function_11245b6b51ac26b7(dropstruct, player, fortress.crate);
        }
    }
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31df
// Size: 0x1d6
function function_11245b6b51ac26b7(dropstruct, player, crate) {
    var_4dbe8ef27554367a = getdvarint(@"hash_3174d9a2553a5fa7", 1);
    var_75ea56ac509fed3b = getscriptcachecontents("bomb_defuse_reward", 0);
    var_df2f68507645906f = [0:"brloot_super_munitionsbox", 1:"brloot_super_armorbox"];
    teammatecount = undefined;
    teammates = namespace_54d20dd0dd79277f::getSquadmates(player.team, player.var_ff97225579de16a, 0);
    if (isdefined(teammates)) {
        teammatecount = teammates.size;
    }
    if (var_4dbe8ef27554367a >= 0) {
        for (i = 0; i < var_4dbe8ef27554367a; i++) {
            randomindex = randomintrange(0, 25);
            var_75ea56ac509fed3b = getscriptcachecontents("bomb_defuse_reward", randomindex);
            function_3d712346afff9ef3(dropstruct, player, crate, var_75ea56ac509fed3b);
        }
    } else if (isdefined(teammatecount)) {
        for (i = 0; i < teammatecount; i++) {
            randomindex = randomintrange(0, 25);
            var_75ea56ac509fed3b = getscriptcachecontents("bomb_defuse_reward", randomindex);
            var_75ea56ac509fed3b[var_75ea56ac509fed3b.size] = var_df2f68507645906f[i % var_df2f68507645906f.size];
            function_3d712346afff9ef3(dropstruct, player, crate, var_75ea56ac509fed3b);
        }
    } else {
        function_3d712346afff9ef3(dropstruct, player, crate, var_75ea56ac509fed3b);
    }
    if (getdvarint(@"hash_81e631c248118cd6", 1) != 1) {
        return;
    } else {
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, player.origin, player.angles, player);
        count = level.br_pickups.counts["brloot_gascan_palfa"];
        spawned = namespace_cb965d2f71fefddc::spawnpickup("brloot_gascan_palfa", var_cb4fad49263e20c4, count);
    }
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33bc
// Size: 0x117
function function_3d712346afff9ef3(dropstruct, player, crate, var_75ea56ac509fed3b) {
    if (isdefined(crate) && getdvarint(@"hash_13c3754911cca521", 1)) {
        crate.itemsdropped = 0;
        crate namespace_1b7e64f50cca9321::lootspawnitemlist(dropstruct, var_75ea56ac509fed3b, 1, player);
        return;
    }
    count = undefined;
    foreach (var_5b63aed4a779b0aa in var_75ea56ac509fed3b) {
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, player.origin, player.angles, player);
        count = level.br_pickups.counts[var_5b63aed4a779b0aa];
        spawned = namespace_cb965d2f71fefddc::spawnpickup(var_5b63aed4a779b0aa, var_cb4fad49263e20c4, count);
        if (isdefined(spawned)) {
            spawned setscriptablepartstate(var_5b63aed4a779b0aa, "dropped");
        }
    }
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34da
// Size: 0x16e
function function_dd16568083975585() {
    task = self;
    task.var_936e3ff613f879a1 = spawnstruct();
    task.var_936e3ff613f879a1.curorigin = task.var_54f5e15c58954932.curorigin;
    task.var_936e3ff613f879a1.offset3d = task.var_54f5e15c58954932.offset3d;
    task.var_936e3ff613f879a1 namespace_19b4203b51d56488::requestid(0, 1, undefined, 0, 0);
    icon = namespace_19b4203b51d56488::getwaypointshader(level.var_1ab489e74bd53602);
    namespace_5a22b6f3a56f7e9b::update_objective_icon(task.var_936e3ff613f879a1.objidnum, icon);
    var_bab98e6efff82b79 = namespace_19b4203b51d56488::getwaypointbackgroundtype(level.var_1ab489e74bd53602);
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(task.var_936e3ff613f879a1.objidnum, var_bab98e6efff82b79);
    objective_setshowprogress(task.var_936e3ff613f879a1.objidnum, 1);
    objective_removeallfrommask(task.var_936e3ff613f879a1.objidnum);
    objective_showtoplayersinmask(task.var_936e3ff613f879a1.objidnum);
    task thread function_8676671228ac7f2c(task.var_54f5e15c58954932, task.var_936e3ff613f879a1);
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x364f
// Size: 0x52
function function_114582ecfebb0acc() {
    task = self;
    if (isdefined(task.var_936e3ff613f879a1)) {
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(task.var_936e3ff613f879a1.objidnum);
        task.var_936e3ff613f879a1.objidnum = -1;
    }
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36a8
// Size: 0xb1
function function_8676671228ac7f2c(var_54f5e15c58954932, var_7457e79dbf4ebd2a) {
    task = self;
    level endon("game_ended");
    task endon("task_ended");
    while (isdefined(var_7457e79dbf4ebd2a.objidnum) && var_7457e79dbf4ebd2a.objidnum != -1) {
        progress = function_53c4c53197386572(var_54f5e15c58954932.curprogress, 0);
        var_9565886677a296e0 = min(var_54f5e15c58954932.curprogress / var_54f5e15c58954932.usetime, 1);
        namespace_5a22b6f3a56f7e9b::objective_set_progress(var_7457e79dbf4ebd2a.objidnum, var_9565886677a296e0);
        wait(0.2);
    }
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3760
// Size: 0x3d9
function function_68b9ba1de74cb130() {
    task = self;
    var_54f5e15c58954932 = task.var_54f5e15c58954932;
    var_936e3ff613f879a1 = task.var_936e3ff613f879a1;
    claimteam = var_54f5e15c58954932.claimteam;
    contested = isdefined(var_54f5e15c58954932.contestedtime);
    neutral = !isdefined(claimteam) || claimteam == "none";
    var_8465eb3d5baaf0cd = isdefined(var_54f5e15c58954932.stronghold.var_4756733ecc825a2) && isdefined(var_54f5e15c58954932.claimteam) && var_54f5e15c58954932.claimteam == var_54f5e15c58954932.stronghold.var_4756733ecc825a2;
    if (contested) {
        var_54f5e15c58954932 namespace_19b4203b51d56488::setobjectivestatusicons(level.iconcontested);
        namespace_5a22b6f3a56f7e9b::update_objective_icon(var_54f5e15c58954932.stronghold.objectiveiconid, var_54f5e15c58954932.stronghold.var_395a039bdc0591e2);
    } else if (neutral) {
        var_54f5e15c58954932 namespace_19b4203b51d56488::setobjectivestatusicons(level.iconneutral);
        namespace_9823ee6035594d67::function_d95dbf57b47734d9(var_54f5e15c58954932.stronghold, 1);
    } else {
        var_54f5e15c58954932 namespace_19b4203b51d56488::setobjectivestatusicons(level.icontaking);
        namespace_5a22b6f3a56f7e9b::function_9b1a086f348520b0(var_54f5e15c58954932.objidnum, claimteam);
        namespace_5a22b6f3a56f7e9b::objective_set_progress_team(var_54f5e15c58954932.objidnum, claimteam);
        namespace_5a22b6f3a56f7e9b::function_9b1a086f348520b0(var_936e3ff613f879a1.objidnum, claimteam);
        namespace_5a22b6f3a56f7e9b::objective_set_progress_team(var_936e3ff613f879a1.objidnum, claimteam);
        namespace_9823ee6035594d67::function_d95dbf57b47734d9(var_54f5e15c58954932.stronghold, 1);
    }
    var_54f5e15c58954932 namespace_19b4203b51d56488::setvisibleteam("any");
    var_54f5e15c58954932 namespace_19b4203b51d56488::setownerteam("neutral");
    if (isdefined(var_54f5e15c58954932.objidnum)) {
        objective_removeallfrommask(var_54f5e15c58954932.objidnum);
    }
    if (isdefined(var_936e3ff613f879a1.objidnum)) {
        objective_removeallfrommask(var_936e3ff613f879a1.objidnum);
    }
    foreach (player in task.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (!var_8465eb3d5baaf0cd) {
            if (contested || neutral || player.team == claimteam) {
                objective_addclienttomask(var_54f5e15c58954932.objidnum, player);
            }
        } else if (!contested && !neutral && player.team != claimteam) {
            objective_addclienttomask(var_936e3ff613f879a1.objidnum, player);
        }
        var_ecb343c4e911d9d0 = undefined;
        if (isdefined(var_54f5e15c58954932.vfxnamemod)) {
            if (neutral) {
                var_ecb343c4e911d9d0 = 0;
                var_54f5e15c58954932.vfxnamemod setscriptablepartstate("flag", "idle");
            } else if (contested) {
                var_ecb343c4e911d9d0 = 3;
                var_54f5e15c58954932.vfxnamemod setscriptablepartstate("flag", "contested");
            } else if (player.team == claimteam) {
                var_ecb343c4e911d9d0 = 1;
                var_54f5e15c58954932.vfxnamemod setscriptablepartstate("flag", "blue_red");
            } else {
                var_ecb343c4e911d9d0 = 2;
                var_54f5e15c58954932.vfxnamemod setscriptablepartstate("flag", "blue_red");
            }
        } else if (neutral) {
            var_ecb343c4e911d9d0 = 0;
        } else if (contested) {
            var_ecb343c4e911d9d0 = 3;
        } else if (player.team == claimteam) {
            var_ecb343c4e911d9d0 = 1;
        } else {
            var_ecb343c4e911d9d0 = 2;
        }
        player setclientomnvar("ui_br_stronghold_mission_status", var_ecb343c4e911d9d0);
    }
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b40
// Size: 0x4f
function function_271a1d82062c2492(data) {
    task = self.task;
    task function_3b3b119a92986947(data.attacker, 1, "EMP_" + data.reason);
    thread brTask_holdDisableForTime(data);
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b96
// Size: 0x169
function brTask_holdDisableForTime(data) {
    self notify("brTask_holdDisableForTime");
    self endon("brTask_holdDisableForTime");
    self.task.var_54f5e15c58954932 function_29c7e65e828011cf(0);
    self.task.var_54f5e15c58954932.var_cd46901b33d5fd1b = 1;
    if (!isdefined(self.var_bc40e6506a04d555)) {
        self.var_bc40e6506a04d555 = spawn("trigger_radius", self.origin, 0, level.var_dac66bb7e0b0f8a5.circleradius, 62);
        namespace_f1565a2788ab1e89::makeenterexittrigger(self.var_bc40e6506a04d555, &function_2725487ad0b3391b, &playerExitHoldPointDisabled);
    }
    self.var_bc40e6506a04d555.endtime = int(gettime() + function_a5b14435e3229bed(data.time));
    wait(data.time);
    self.task.var_54f5e15c58954932 function_29c7e65e828011cf(1);
    self.task.var_54f5e15c58954932.var_cd46901b33d5fd1b = undefined;
    if (istrue(self.task.players.size > 0)) {
        namespace_9823ee6035594d67::function_d95dbf57b47734d9(self.task.owner, 1);
    }
    self.var_bc40e6506a04d555 delete();
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d06
// Size: 0x61
function function_2725487ad0b3391b(player, trigger) {
    self endon("playerExitHoldPointDisabled");
    namespace_58fb4f2e73fd41a0::setlowermessageomnvar("uav_offline", trigger.endtime);
    timeleft = function_c89ed1840c8d0f0f(trigger.endtime - gettime());
    wait(timeleft);
    waitframe();
    thread playerExitHoldPointDisabled(player, trigger);
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d6e
// Size: 0x28
function playerExitHoldPointDisabled(player, trigger) {
    namespace_58fb4f2e73fd41a0::setlowermessageomnvar("clear_lower_msg");
    self notify("playerExitHoldPointDisabled");
}

// Namespace namespace_1ab3ae0ffed87c04/namespace_b8f885001f04bb5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d9d
// Size: 0x45
function function_c94e9cae0cafd8cf(var_fcd89921f4b87602) {
    /#
        task = self;
        if (isdefined(var_fcd89921f4b87602)) {
            wait(var_fcd89921f4b87602);
        }
        task function_addda96ba479db4e(undefined, 1, undefined, istrue(task.var_54f5e15c58954932.var_554291b6257ea5d0));
        return;
    #/
}

