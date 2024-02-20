// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using script_4c770a9a4ad7659c;
#using script_3b64eb40368c1450;
#using script_396a814d39e7044f;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using scripts\mp\codcasterclientmatchdata.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\inventory.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\hud_util.gsc;
#using script_40e63dd222434655;
#using scripts\mp\weapons.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using script_3ff084f114b7f6c9;
#using scripts\mp\teamrevive.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using script_556b8aeaa691317f;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\perks\perkfunctions.gsc;
#using script_21c19cfc7139d773;
#using scripts\mp\tweakables.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\utility\outline.gsc;
#using script_6a5d3bf7a5b7064a;
#using script_2669878cf5a1b6bc;
#using script_19fd5b5d73d44c18;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\gametypes\br_analytics.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br.gsc;
#using script_372301af73968cb;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\gamelogic.gsc;
#using script_189b67b2735b981d;
#using scripts\mp\rank.gsc;
#using scripts\mp\laststand.gsc;
#using scripts\engine\trace.gsc;
#using script_2b264b25c7da0b12;
#using script_15eddb0fac236a22;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\events.gsc;
#using scripts\mp\utility\stats.gsc;
#using script_5762ac2f22202ba2;
#using scripts\mp\analyticslog.gsc;
#using script_58be75c518bf0d40;
#using script_6d68cfdf0836123c;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\damage.gsc;
#using script_448ef4d9e70ce5e;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\gametypes\obj_dogtag.gsc;
#using scripts\mp\gametypes\grind.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\cranked.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\anim.gsc;
#using scripts\mp\utility\script.gsc;

#namespace laststand;

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f92
// Size: 0x22a
function init() {
    function_150b60d7cbd3ba2();
    level._effect["vfx_br_interr_in"] = loadfx("vfx/iw9_br/vfx_br_interr_in");
    level._effect["vfx_br_interr_mid"] = loadfx("vfx/iw9_br/vfx_br_interr_mid");
    level._effect["vfx_br_interr_out"] = loadfx("vfx/iw9_br/vfx_br_interr_out");
    setdvarifuninitialized(@"hash_ddbf6f11fc2231f2", 3);
    setdvarifuninitialized(@"hash_6acfbd4650e8691f", 300);
    setdvarifuninitialized(@"hash_a8e0e2bf5a22916c", 5);
    setdvarifuninitialized(@"hash_3c56d9ef17112cdd", 3);
    setdvarifuninitialized(@"hash_c1469be98181753d", 15);
    setdvarifuninitialized(@"hash_de39bef0e704c70b", 2);
    setdvarifuninitialized(@"hash_cc42e9e3eb814f82", 1);
    setdvarifuninitialized(@"hash_6cc46c78f1221930", 100);
    setdvarifuninitialized(@"hash_dcdd2aa64529509e", 185);
    setdvarifuninitialized(@"hash_46685b5a7ab844eb", 0.2);
    setdvarifuninitialized(@"hash_a77cf11d23a937f4", 1);
    setdvarifuninitialized(@"hash_2e92604af6208d28", 1);
    setdvarifuninitialized(@"hash_97e42d15f6dd7208", 0.2);
    setdvarifuninitialized(@"hash_d856d9dc9669c4f2", 100);
    namespace_f1d40c362677777e::registerondisconnecteventcallback(&function_1cec99551dbf4dd3);
    if (namespace_76a219af07c28c13::function_6934349b7823d888()) {
        namespace_76a219af07c28c13::registerTeamAssimilateCallback(&namespace_7db13bdf599e41a6::function_df4a3cff3137d441);
    }
    /#
        setdevdvarifuninitialized(@"hash_f1bef8e461ed63f", 0);
        level thread function_d9b9b021d2e292a7();
    #/
    if (getgametype() == "xfire") {
        level.var_a04b495bbccdf0bf = 0;
        level.var_eb919e162d131112 = 0;
        level.var_62973ff88470b851 = 0;
        setomnvar("ui_cutthroat_num_reviving_team_1", 0);
        setomnvar("ui_cutthroat_num_reviving_team_2", 0);
        setomnvar("ui_cutthroat_num_reviving_team_3", 0);
        level.var_2d9a769507f8c794 = 0;
        level.var_419bc98b5f722331 = 0;
        level.var_9663d50652fde8c2 = 0;
        setomnvar("ui_cutthroat_num_downed_team_1", 0);
        setomnvar("ui_cutthroat_num_downed_team_2", 0);
        setomnvar("ui_cutthroat_num_downed_team_3", 0);
    }
    level.var_7bcefa52cab9850f = 0;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31c3
// Size: 0x15d
function laststandthink() {
    level endon("game_ended");
    onenter();
    result = function_efe4706df8361219("last_stand_heal_success", "last_stand_revived", "last_stand_bleedout", "death", "disconnect", "last_stand_self_revive", "enter_live_ragdoll");
    /#
        if (0) {
            var_bc8faa6f0ea66738 = ter_op(isdefined(result), result, "specialty_shroud");
            println("vehicle_exit" + var_bc8faa6f0ea66738);
        }
    #/
    switch (result) {
    case #"hash_d95fe2980633f282":
        onrevive();
        break;
    case #"hash_a7951892dd77e7b":
        onrevive(1);
        break;
    case #"hash_7720db6a74f74d2b":
        onbleedout();
        break;
    case #"hash_3ea67ab430b19bc5":
        onrevive(0, 1);
        break;
    case #"hash_acbcd2ee2d01c7c4":
        break;
    case #"hash_e8bc3da4af287c2d":
        if (!((isteamreviveenabled() || namespace_36f464722d326bbe::isBRStyleGameType()) && namespace_4b0406965e556711::gameflag("prematch_done"))) {
            ondeath();
        } else {
            onexitcommon();
            if (isdefined(self)) {
                dropcarryobject();
            }
        }
        break;
    case #"hash_8a3297e83141974b":
        ondeath();
        break;
    }
    if (isdefined(self)) {
        self setclientomnvar("ui_is_laststand", 0);
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3327
// Size: 0x6a8
function onenter() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    self endon("last_stand_finished");
    self notify("last_stand_start");
    self setclientomnvar("ui_is_laststand", 1);
    if (getgametype() == "xfire") {
        function_e6ccdf90ba898cdc(self.team, 1);
        self setclientomnvar("ui_cutthroat_player_state", 1);
    }
    level thread namespace_25c5a6f43bb97b43::trysaylocalsound(self, #"hash_1c1a3ebe5f3a23af", undefined, 0.25);
    self.var_b24e609023ce8208 = namespace_833bd5cc623ca701::function_a35fff2ff233592a() && !namespace_d3d40f75bb4e4c32::hasselfrevivetoken();
    if (_hasperk("specialty_shroud")) {
        thread namespace_282db5a41b643e19::function_1665d49ac1a4f08e();
    }
    if (_hasperk("specialty_survivor")) {
        self.var_4945d0d82dd3964b = 1;
    }
    if (_hasperk("specialty_ping_attacker_on_laststand")) {
        thread namespace_88bfae359020fdd3::function_8fdd864a86afe560(self.laststandattacker);
    }
    var_a776f097eb36e500 = level.laststandhealth;
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        thread last_stand_sfx();
    }
    /#
        if (!isusingmatchrulesdata()) {
            var_a776f097eb36e500 = getwatcheddvar("offhand_1h_wm_stim_v0");
            if (!isdefined(var_a776f097eb36e500)) {
                var_a776f097eb36e500 = getdvarint(@"hash_984461a4d8ff9473", 50);
            }
            if (var_a776f097eb36e500 > namespace_775507ba36294dfb::gettweakablevalue("afk_tracking_resume", "postgame")) {
                var_a776f097eb36e500 = namespace_775507ba36294dfb::gettweakablevalue("afk_tracking_resume", "postgame");
            }
        }
    #/
    if (function_311066dfee085643(self)) {
        var_a776f097eb36e500 = level.var_409e54f81172d6d8.laststandhealth;
    }
    self.health = var_a776f097eb36e500;
    namespace_9abe40d2af041eb2::function_3f55c1fb553a4775(self);
    thread makelaststandinvuln();
    giveperk("specialty_block_health_regen");
    giveperk("specialty_blindeye");
    self.var_2fb534abd9eb93ca = 0;
    self.inlaststand = 1;
    self.playergoingintols = undefined;
    self.hasshownlaststandicon = 0;
    self.laststandstarttime = gettime();
    self.ignoreafkcheck = 1;
    if (namespace_36f464722d326bbe::isBRStyleGameType() && !namespace_d3d40f75bb4e4c32::hasselfrevivetoken() && !istrue(self.var_b24e609023ce8208)) {
        if (isdefined(level.checkforlaststandfinish)) {
            [[ level.checkforlaststandfinish ]]();
        }
    }
    if (_hasperk("specialty_survivor") && !namespace_36f464722d326bbe::isBRStyleGameType()) {
        self.timeuntilbleedout = level.laststandtimer;
        setlowermessageomnvar("survivor_revive", int(gettime() + self.timeuntilbleedout * 1000));
    }
    if (isdefined(self.var_4d52ef6a17e52924)) {
        weapon::updatemovespeedscale();
    }
    self.laststandoldweaponobj = getlastweapon();
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        if (!istrue(self.gulag)) {
            namespace_71073fa38f11492::runbrgametypefunc("onLastStandEnter");
            if (!istrue(level.var_7a37960f05887b39)) {
                foreach (teammate in level.teamdata[self.team]["alivePlayers"]) {
                    if (!isdefined(teammate)) {
                        continue;
                    }
                    if (teammate != self) {
                        teammate thread namespace_44abc05161e2e2cb::showsplash("br_teammate_down", undefined, self);
                        teammate thread namespace_88bfae359020fdd3::function_4e19e6bf429dda56(self);
                    }
                }
            }
        }
    }
    if (getdvarint(@"hash_7bb41608649743f4", 0) != 0) {
        self function_187fb04ebd01baea();
    } else if (getdvarint(@"hash_112f10fcbe78647", 0) != 0) {
        self function_720152d5d95e2d86();
    }
    laststandweapon = level.laststandweapon;
    /#
        if (!isusingmatchrulesdata()) {
            laststandweapon = getwatcheddvar("revive_trigger");
            if (!isdefined(laststandweapon)) {
                laststandweapon = getdvar(@"hash_ab99ad42c8f9d6fd", "self_revive_on_kill_success");
            }
        }
    #/
    if (function_311066dfee085643(self)) {
        laststandweapon = self [[ level.var_409e54f81172d6d8.laststandweaponcallback ]]();
    } else if (isdefined(level.laststandweaponcallback) && getdvarint(@"hash_ddd02929770fcc8c", 0)) {
        laststandweapon = self [[ level.laststandweaponcallback ]]();
    }
    if (!isweapon(laststandweapon)) {
        laststandweapon = namespace_d325722f2754c2c4::function_eeaa22f0cd1ff845(laststandweapon);
    }
    if (!istrue(self.usingascender)) {
        self stopanimscriptsceneevent();
    }
    if (self isviewmodelanimplaying()) {
        self stopviewmodelanim();
    }
    if (istrue(self.killstreaklaststand) && isdefined(level.killstreak_laststand_func)) {
        self [[ level.killstreak_laststand_func ]]();
        return;
    }
    if (isdefined(level.modeonlaststandfunc)) {
        self [[ level.modeonlaststandfunc ]]();
    }
    if (isdefined(level.levelonlaststandfunc)) {
        self thread [[ level.levelonlaststandfunc ]]();
    }
    if (isdefined(level.customlaststandactionset)) {
        self.laststandactionset = level.customlaststandactionset;
    } else {
        self.laststandactionset = "laststand";
    }
    if (isdefined(self.vehicle)) {
        self waittill("vehicle_exit");
    }
    val::function_3633b947164be4f3(self.laststandactionset, 0);
    thread handlelaststandweapongivepipeline(laststandweapon);
    if (isdefined(level.addlaststandoverheadiconcallback)) {
        self [[ level.addlaststandoverheadiconcallback ]]();
    } else {
        addoverheadicon();
    }
    var_276b87b88716c2a5 = level.laststandsuicidetimer;
    /#
        if (!isusingmatchrulesdata()) {
            var_276b87b88716c2a5 = getwatcheddvar("MP_BR_INGAME/INTERROGATE_BLOCKED");
            if (!isdefined(var_276b87b88716c2a5)) {
                var_276b87b88716c2a5 = getdvarfloat(@"hash_a4353f59ee601382", 5);
            }
        }
    #/
    _shellshock("last_stand_mp", "damage", var_276b87b88716c2a5, 0);
    thread revivesetup(self);
    if (function_2a3c9a91bf1d3911()) {
        thread function_35e8814575e3963d(self);
    }
    self.fastcrouchspeedmod = getdvarfloat(@"hash_1a0de898609317b4", 0);
    namespace_aad14af462a74d08::stopchallengetimer("alive_not_downed");
    if (isdefined(self.laststandattacker) && self.laststandattacker _hasperk("specialty_reduce_regen_delay_on_kill")) {
        self.laststandattacker namespace_282db5a41b643e19::regendelayreduce_onkill();
    }
    if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
        childthread stucktime(var_276b87b88716c2a5);
    } else {
        if (isdefined(self.var_3f78c6a0862f9e25) && (!isdefined(level.var_d21c4a649c5aca6c) || level.var_d21c4a649c5aca6c)) {
            var_f1398052687d83da = "outline_nodepth_brplayer" + self.var_3f78c6a0862f9e25 + 1;
            self.laststandoutlineid = namespace_cbd3754a0c69cc63::outlineenableforteam(self, self.team, var_f1398052687d83da, "laststand");
        }
        childthread dodamagewhiledown();
    }
    namespace_aad14af462a74d08::function_fb2db8647d693699(self);
    callback::callback("player_laststand");
    self notify("last_stand_enter_finished");
    level notify("last_stand_enter_finished", self);
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39d6
// Size: 0x60
function last_stand_sfx() {
    if (!istrue(self.deathsdoorsfx) && !istrue(self.var_a9982aba7477cc90)) {
        self.deathsdoorsfx = 1;
        self stoplocalsound("deaths_door_out");
        self playlocalsound("deaths_door_in");
        namespace_4887422e77f3514e::function_501be800abf11f33(0.2, 1);
        self enableplayerbreathsystem(0);
        thread namespace_4887422e77f3514e::playerbreathingpainsound();
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a3d
// Size: 0x1a1
function handlelaststandweapongivepipeline(laststandweapon) {
    self endon("death_or_disconnect");
    self endon("last_stand_finished");
    level endon("game_ended");
    while (isdefined(self.currentweapon) && isdefined(self.currentweapon.basename) && (self.currentweapon.basename == "iw9_armor_plate_deploy_mp" || self.currentweapon.basename == "teammate_revive_stim_mp")) {
        waitframe();
    }
    waitframe();
    var_dec5f8278c01ccc3 = makeweapon("iw8_gunless_last_stand_enter");
    _giveweapon(var_dec5f8278c01ccc3, undefined, undefined, 0);
    thread _switchtoweaponimmediate(var_dec5f8278c01ccc3);
    var_426ffb976d0a19db = 1.7;
    if (isdefined(level.var_1a2b600a06ec21f4) && isdefined(level.var_1a2b600a06ec21f4.var_9fba02f6bbe6e6bd)) {
        var_426ffb976d0a19db = level.var_1a2b600a06ec21f4.var_9fba02f6bbe6e6bd;
    }
    wait(var_426ffb976d0a19db);
    self notify("last_stand_transition_done");
    _takeweapon(var_dec5f8278c01ccc3);
    laststandweapondelay = 0;
    if (!isweapon(laststandweapon) && (laststandweapon == "none" || laststandweapon == "iw9_me_fists_mp_ls")) {
        givedefaultlaststandweapon();
    } else {
        laststandweapondelay = level.laststandweapondelay;
        /#
            if (!isusingmatchrulesdata()) {
                laststandweapondelay = getwatcheddvar("+togglecrouch");
                if (!isdefined(laststandweapondelay)) {
                    laststandweapondelay = getdvarint(@"hash_c47411f597dae120", 0);
                }
            }
        #/
        if (laststandweapondelay > 0) {
            thread handlelaststandweapongivedelay(laststandweapondelay, laststandweapon);
        } else {
            givelaststandweapon(laststandweapon);
        }
    }
    wait(laststandweapondelay);
    self.var_2fb534abd9eb93ca = 1;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3be5
// Size: 0x37
function takelaststandtransitionweapon() {
    player = self;
    var_dec5f8278c01ccc3 = makeweapon("iw8_gunless_last_stand_enter");
    if (player hasweapon(var_dec5f8278c01ccc3)) {
        player _takeweapon(var_dec5f8278c01ccc3);
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c23
// Size: 0x5f
function handlelaststandweapongivedelay(laststandweapondelay, laststandweapon) {
    self endon("death");
    self endon("last_stand_revived");
    level endon("game_ended");
    var_3fe001fff6b3ba = givedefaultlaststandweapon();
    if (issameweapon(var_3fe001fff6b3ba, laststandweapon)) {
        return;
    }
    wait(laststandweapondelay);
    self notify("end_switchToFists");
    _takeweapon(var_3fe001fff6b3ba);
    givelaststandweapon(laststandweapon);
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c89
// Size: 0x4c
function givedefaultlaststandweapon() {
    var_ae0da1578aece301 = getwatcheddvar("lastStandWeapon");
    if (!isdefined(var_ae0da1578aece301)) {
        var_ae0da1578aece301 = "iw9_me_fists_mp_ls";
    }
    var_3fe001fff6b3ba = makeweapon(var_ae0da1578aece301);
    _giveweapon(var_3fe001fff6b3ba, undefined, undefined, 1);
    thread _switchtoweaponimmediate(var_3fe001fff6b3ba);
    return var_3fe001fff6b3ba;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cdd
// Size: 0x58
function givelaststandweapon(laststandweapon) {
    if (!isweapon(laststandweapon)) {
        laststandweapon = namespace_e0ee43ef2dddadaa::buildweapon(laststandweapon);
    }
    fullname = getcompleteweaponname(laststandweapon);
    if (!self hasweapon(fullname)) {
        _giveweapon(laststandweapon, undefined, undefined, 1);
        self.laststandweaponobj = laststandweapon;
    }
    thread _switchtoweaponimmediate(fullname);
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d3c
// Size: 0x3e
function disableweaponsovertime(t) {
    level endon("game_ended");
    val::set("disable_weapons_for_time", "weapon", 0);
    waittill_any_timeout_1(t, "death_or_disconnect");
    val::function_c9d0b43701bdba00("disable_weapons_for_time");
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d81
// Size: 0x2c
function switchtofists(laststandweapon) {
    self endon("death_or_disconnect");
    self endon("end_switchToFists");
    while (domonitoredweaponswitch(laststandweapon, 1) == 0) {
        waitframe();
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3db4
// Size: 0x233
function dodamagewhiledown() {
    self endon("laststand_revived");
    self endon("disconnect");
    self endon("squad_wipe_death");
    basehealth = level.laststandhealth;
    bleedouttime = level.laststandtimer;
    /#
        if (!isusingmatchrulesdata()) {
            basehealth = getwatcheddvar("offhand_1h_wm_stim_v0");
            if (!isdefined(basehealth)) {
                basehealth = getdvarint(@"hash_984461a4d8ff9473", 50);
            }
            if (basehealth > namespace_775507ba36294dfb::gettweakablevalue("afk_tracking_resume", "postgame")) {
                basehealth = namespace_775507ba36294dfb::gettweakablevalue("afk_tracking_resume", "postgame");
            }
            bleedouttime = getwatcheddvar("MOD_INTERROGATE");
            if (!isdefined(bleedouttime)) {
                bleedouttime = getdvarfloat(@"hash_546d8a10bb4e83de", 10);
            }
        }
    #/
    if (function_311066dfee085643(self)) {
        bleedouttime = level.var_409e54f81172d6d8.var_1694969c43add70d;
    }
    if (bleedouttime <= 0) {
        onbleedout();
        return;
    }
    var_76e563db5d11a0ea = float(basehealth) / float(bleedouttime);
    var_76e563db5d11a0ea = var_76e563db5d11a0ea / max(getmatchrulesdata("commonOption", "lastStandDamageTakenScalar"), 0.01);
    wait(1);
    var_6561e2b7a451e472 = makeweapon("iw9_me_fists_mp_ls");
    if (!istrue(level.var_28a06842b082bea1)) {
        thread suicidesetup();
    }
    damagedealt = 0;
    while (self.health > 0) {
        /#
            if (getdvarint(@"hash_312c93a94bab8ee", 0) != 0) {
                wait(1);
                continue;
            }
        #/
        if (self isinexecutionvictim()) {
            wait(1);
            continue;
        }
        if (!istrue(getbeingrevivedinternal())) {
            var_703f141d7d6fea1e = int(damagedealt + var_76e563db5d11a0ea) - int(damagedealt);
            damagedealt = damagedealt + var_76e563db5d11a0ea;
            self.islaststandbleedoutdmg = 1;
            self dodamage(var_703f141d7d6fea1e, self.origin, self, undefined, "MOD_TRIGGER_HURT", var_6561e2b7a451e472, "none");
            self playlocalsound("mvmt_heartbeat_plr_laststand");
            self.islaststandbleedoutdmg = undefined;
        }
        if (self.health <= 0 || istrue(self.liveRagdoll)) {
            onbleedout();
            break;
        }
        wait(1);
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fee
// Size: 0x131
function stucktime(var_276b87b88716c2a5) {
    self.stuckinlaststand = 1;
    wait(var_276b87b88716c2a5);
    self.stuckinlaststand = 0;
    timeleft = level.laststandtimer;
    /#
        if (getdvarint(@"hash_312c93a94bab8ee", 0) != 0 || getdvarfloat(@"hash_546d8a10bb4e83de", 10) == -1) {
            return;
        }
        if (!isusingmatchrulesdata()) {
            timeleft = getwatcheddvar("MOD_INTERROGATE");
            if (!isdefined(timeleft)) {
                timeleft = getdvarfloat(@"hash_546d8a10bb4e83de", 10);
            }
        }
    #/
    if (function_311066dfee085643(self)) {
        timeleft = level.var_409e54f81172d6d8.var_1694969c43add70d;
    }
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        /#
            assertex(timeleft > 0, "Last Stand: Bleedout time must be greater than 0");
        #/
    }
    if (!namespace_36f464722d326bbe::isBRStyleGameType() && timeleft != 0) {
        timeleft = max(timeleft - level.laststandsuicidetimer, 1);
    } else {
        timeleft = 0;
    }
    self.timeuntilbleedout = timeleft;
    if (isdefined(level.var_b57e01a4f8558a6b)) {
        self thread [[ level.var_b57e01a4f8558a6b ]]();
    } else {
        thread bleedoutthink();
        thread suicidesetup();
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4126
// Size: 0x5d
function selfrevivebuttonpressed(var_1730c8d8475566cd) {
    /#
        if (isbot(var_1730c8d8475566cd) && istrue(var_1730c8d8475566cd.var_f932828585d0926c)) {
            return 1;
        }
        if (getdvarint(@"hash_51d681fbc88502b9", 0) == 1) {
            return 1;
        }
    #/
    if (var_1730c8d8475566cd usinggamepad()) {
        return var_1730c8d8475566cd weaponswitchbuttonpressed();
    } else {
        return var_1730c8d8475566cd activatekeypressed();
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x418a
// Size: 0x17e
function selfrevivethink() {
    var_6bcc6405c250ecb4 = self;
    var_1730c8d8475566cd = var_6bcc6405c250ecb4.owner;
    level endon("game_ended");
    var_6bcc6405c250ecb4 endon("death");
    var_1730c8d8475566cd endon("death_or_disconnect");
    var_1730c8d8475566cd endon("last_stand_revived");
    usetime = getwatcheddvar("lastStandReviveTimer") * 1000;
    if (isdefined(var_1730c8d8475566cd.var_c101ccd3d5f8bd81)) {
        usetime = var_1730c8d8475566cd.var_c101ccd3d5f8bd81 * 1000;
    } else if (var_1730c8d8475566cd _hasperk("specialty_survivor") && isdefined(level.var_d69a2eb29ce33499)) {
        usetime = level.var_d69a2eb29ce33499;
    }
    if (namespace_36f464722d326bbe::isBRStyleGameType() && var_1730c8d8475566cd _hasperk("specialty_br_faster_revive")) {
        usetime = usetime * 0.75;
    }
    var_6bcc6405c250ecb4.usetime = usetime;
    if (!isdefined(self.curprogress)) {
        self.curprogress = 0;
    }
    while (1) {
        if (selfrevivebuttonpressed(var_1730c8d8475566cd) && !istrue(var_1730c8d8475566cd.isselfreviving) && !istrue(var_1730c8d8475566cd.beingrevived) && (var_1730c8d8475566cd isonground() || var_1730c8d8475566cd isswimming())) {
            var_6bcc6405c250ecb4 notify("self_revive_start");
            var_1730c8d8475566cd setlaststandselfreviving(1, istrue(var_1730c8d8475566cd.var_b24e609023ce8208));
            if (namespace_d3d40f75bb4e4c32::function_38a924a5f3d8ca8(var_1730c8d8475566cd)) {
                var_1730c8d8475566cd namespace_e6ac9d98b8876b98::function_cc4ed2ddd1a0c88d();
            }
            if (namespace_36f464722d326bbe::isBRStyleGameType()) {
                var_1730c8d8475566cd namespace_d3d40f75bb4e4c32::setplayerselfrevivingextrainfo(1);
            }
            var_6bcc6405c250ecb4 thread selfrevivemonitorrevivebuttonpressed();
        }
        waitframe();
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x430f
// Size: 0x2b
function function_8afb9538db673551() {
    if (!function_14430db14b833985()) {
        self attach("offhand_1h_wm_stim_v0", "tag_accessory_left");
        self.var_f46a64206952c575 = "offhand_1h_wm_stim_v0";
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4341
// Size: 0x2b
function function_a904cc021551fd6b() {
    if (!function_14430db14b833985()) {
        self attach("misc_wm_stim_pistol_v0", "tag_accessory_left");
        self.var_f46a64206952c575 = "misc_wm_stim_pistol_v0";
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4373
// Size: 0x2b
function function_9e41f17f1bd6e77e() {
    if (function_14430db14b833985()) {
        self detach(self.var_f46a64206952c575, "tag_accessory_left");
        self.var_f46a64206952c575 = undefined;
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43a5
// Size: 0xd
function function_14430db14b833985() {
    return isdefined(self.var_f46a64206952c575);
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43ba
// Size: 0x3e4
function selfrevivemonitorrevivebuttonpressed() {
    var_1730c8d8475566cd = self.owner;
    var_6bcc6405c250ecb4 = self;
    level endon("game_ended");
    var_1730c8d8475566cd endon("death_or_disconnect");
    var_1730c8d8475566cd endon("last_stand_finished");
    var_6bcc6405c250ecb4.waitingforteammaterevive = 0;
    var_6bcc6405c250ecb4 thread selfrevivebuttonpresscleanup();
    while (isreallyalive(var_1730c8d8475566cd) && (selfrevivebuttonpressed(var_1730c8d8475566cd) || var_1730c8d8475566cd function_77799f0211be1728()) && var_6bcc6405c250ecb4.curprogress < var_6bcc6405c250ecb4.usetime) {
        while (!(var_1730c8d8475566cd isonground() || var_1730c8d8475566cd isswimming()) && selfrevivebuttonpressed(var_1730c8d8475566cd) && !istrue(var_1730c8d8475566cd.isselfreviving)) {
            waitframe();
        }
        if (!selfrevivebuttonpressed(var_1730c8d8475566cd) && !var_1730c8d8475566cd function_77799f0211be1728()) {
            break;
        }
        if (var_1730c8d8475566cd isinexecutionvictim()) {
            break;
        }
        if (istrue(var_1730c8d8475566cd.var_12bfb031c0a0efd8)) {
            break;
        }
        if (istrue(var_1730c8d8475566cd.var_fa3003648b3c8eac)) {
            var_1730c8d8475566cd setbeingrevivedinternal(0);
            var_1730c8d8475566cd function_51feaa413342a5a1();
            var_1730c8d8475566cd namespace_19b4203b51d56488::updateuiprogress(var_6bcc6405c250ecb4, 1);
            break;
        }
        if (istrue(var_1730c8d8475566cd.beingrevived)) {
            var_1730c8d8475566cd namespace_19b4203b51d56488::updateuiprogress(var_6bcc6405c250ecb4, 1);
            break;
        }
        if (!istrue(var_1730c8d8475566cd.isselfreviving)) {
            var_1730c8d8475566cd val::function_588f2307a3040610("laststand");
            var_1730c8d8475566cd val::set("_group_laststand", "weapon_pickup", 0);
            teststring = var_1730c8d8475566cd val::get("gesture");
            var_1730c8d8475566cd.isselfreviving = 1;
            var_1730c8d8475566cd allowmovement(0);
        }
        if (istrue(var_1730c8d8475566cd.var_b24e609023ce8208) && !var_1730c8d8475566cd hasweapon("iw8_ges_plyr_self_revive_stim_pistol")) {
            var_1730c8d8475566cd function_a904cc021551fd6b();
            var_1730c8d8475566cd thread namespace_d3d40f75bb4e4c32::playerplaygestureweaponanim("iw8_ges_plyr_self_revive_stim_pistol", 10);
            var_1730c8d8475566cd.var_c6a5ba98f5f43e0d = 1;
            var_6bcc6405c250ecb4.inuse = 1;
        } else if (!var_1730c8d8475566cd hasweapon("iw8_ges_plyr_self_revive")) {
            var_1730c8d8475566cd function_8afb9538db673551();
            var_dd016b4325035d0 = namespace_d3d40f75bb4e4c32::function_38a924a5f3d8ca8(var_1730c8d8475566cd);
            var_1730c8d8475566cd thread namespace_d3d40f75bb4e4c32::playerplaygestureweaponanim("iw8_ges_plyr_self_revive", 10);
        }
        if (!(var_1730c8d8475566cd isonground() || var_1730c8d8475566cd isswimming())) {
            break;
        }
        if (!isdefined(var_6bcc6405c250ecb4.userate)) {
            var_6bcc6405c250ecb4.userate = 0;
        }
        var_6bcc6405c250ecb4.curprogress = var_6bcc6405c250ecb4.curprogress + level.frameduration * var_6bcc6405c250ecb4.userate;
        var_6bcc6405c250ecb4.userate = 1;
        var_1730c8d8475566cd namespace_19b4203b51d56488::updateuiprogress(var_6bcc6405c250ecb4, 1);
        if (var_6bcc6405c250ecb4.curprogress >= var_6bcc6405c250ecb4.usetime) {
            var_1730c8d8475566cd stopgestureviewmodel("ges_equip_stim_self_revive");
            var_1730c8d8475566cd stopgestureviewmodel("iw9_vm_ges_stimpistol_self_revive");
            if (namespace_d3d40f75bb4e4c32::function_38a924a5f3d8ca8(var_1730c8d8475566cd)) {
                var_1730c8d8475566cd thread namespace_e6ac9d98b8876b98::function_905b7bada6fd91cb(2);
            }
            wait(0.5);
            if (namespace_36f464722d326bbe::isBRStyleGameType()) {
                namespace_a011fbf6d93f25e5::branalytics_selfrevive(var_1730c8d8475566cd);
            }
            var_1730c8d8475566cd finishreviveplayer("self_revive_success", var_1730c8d8475566cd);
            if (istrue(var_1730c8d8475566cd.var_b24e609023ce8208)) {
                var_1730c8d8475566cd thread namespace_833bd5cc623ca701::function_31afe9d7b373900f();
            } else if (isdefined(level.removeselfrevivetoken)) {
                var_1730c8d8475566cd [[ level.removeselfrevivetoken ]]();
                var_1730c8d8475566cd namespace_cb965d2f71fefddc::function_b76f69ce63757cea("brloot_self_revive");
            }
            return;
        }
        /#
            if (istrue(var_1730c8d8475566cd.var_4ab61a57453e2816)) {
                if (!isdefined(var_1730c8d8475566cd.var_8fc34ee7d773b639)) {
                    var_1730c8d8475566cd.var_8fc34ee7d773b639 = 0;
                }
                var_1730c8d8475566cd.var_8fc34ee7d773b639 = var_1730c8d8475566cd.var_8fc34ee7d773b639 + level.frameduration;
            }
        #/
        waitframe();
    }
    var_1730c8d8475566cd namespace_e6ac9d98b8876b98::function_f009283993c81afd();
    if (!istrue(var_1730c8d8475566cd getbeingrevivedinternal())) {
        if (namespace_36f464722d326bbe::isBRStyleGameType()) {
            namespace_d20f8ef223912e12::updatesquadmemberlaststandreviveprogress(var_1730c8d8475566cd, var_1730c8d8475566cd, var_6bcc6405c250ecb4.curprogress, 1);
        }
        var_6bcc6405c250ecb4 thread decayreviveprogress();
    }
    var_1730c8d8475566cd notify("stopped_self_revive");
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47a5
// Size: 0xd
function function_77799f0211be1728() {
    return istrue(self.var_c6a5ba98f5f43e0d);
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47ba
// Size: 0x19
function function_51feaa413342a5a1() {
    self.var_c6a5ba98f5f43e0d = 0;
    self stopgestureviewmodel("iw9_vm_ges_stimpistol_self_revive");
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47da
// Size: 0xb2
function selfrevivebuttonpresscleanup() {
    var_1730c8d8475566cd = self.owner;
    var_6bcc6405c250ecb4 = self;
    level endon("game_ended");
    var_1730c8d8475566cd notify("self_revive_cleanup_start");
    var_1730c8d8475566cd endon("self_revive_cleanup_start");
    var_1730c8d8475566cd waittill_any_return_no_endon_death_3("last_stand_finished", "stopped_self_revive", "death_or_disconnect");
    if (isdefined(var_1730c8d8475566cd)) {
        if (!istrue(var_1730c8d8475566cd.beingrevived)) {
            var_1730c8d8475566cd namespace_19b4203b51d56488::updateuiprogress(var_6bcc6405c250ecb4, 0);
            var_1730c8d8475566cd allowmovement(1);
        }
        var_1730c8d8475566cd function_9e41f17f1bd6e77e();
        var_1730c8d8475566cd stopgestureviewmodel("ges_equip_stim_self_revive");
        var_1730c8d8475566cd setlaststandselfreviving(0);
        if (namespace_36f464722d326bbe::isBRStyleGameType()) {
            var_1730c8d8475566cd namespace_d3d40f75bb4e4c32::setplayerselfrevivingextrainfo(0);
        }
        var_1730c8d8475566cd.isselfreviving = 0;
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4893
// Size: 0x29f
function onexitcommon(revived) {
    if (!isdefined(self)) {
        return;
    }
    self endon("disconnect");
    level endon("game_ended");
    self.laststandactionset = undefined;
    self.var_c6a5ba98f5f43e0d = undefined;
    namespace_9abe40d2af041eb2::function_17576a4cdcd447a7(self);
    thread clearlaststandinvuln();
    self allowmovement(1);
    self.fastcrouchspeedmod = 0;
    namespace_3bbb5a98b932c46f::updatemovespeedscale();
    if (_hasperk("specialty_block_health_regen")) {
        removeperk("specialty_block_health_regen");
    }
    if (_hasperk("specialty_blindeye")) {
        removeperk("specialty_blindeye");
    }
    if (istrue(revived)) {
        namespace_54a2eae43eaa8bf5::function_19b9bb9cef6a2d3();
    }
    laststandweapon = level.laststandweapon;
    /#
        if (!isusingmatchrulesdata()) {
            laststandweapon = getwatcheddvar("revive_trigger");
        }
    #/
    laststandweapon = makeweapon(laststandweapon);
    if (self getcurrentprimaryweapon() != laststandweapon) {
        self notify("end_switchToFists");
        abortmonitoredweaponswitch(laststandweapon);
    } else {
        _takeweapon(laststandweapon);
    }
    self notify("last_stand_finished");
    self.laststandoldweapon = undefined;
    if (istrue(getbeingrevivedinternal())) {
        setbeingrevivedinternal(0);
    }
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        namespace_d20f8ef223912e12::updatesquadmemberlaststandreviveprogress(self, self, 0, 1);
        namespace_d3d40f75bb4e4c32::setplayerbeingrevivedextrainfo(0);
        self.brdownedbyairstriketime = undefined;
    }
    self setclientomnvar("ui_is_laststand", 0);
    self setclientomnvar("ui_securing", 0);
    if (getgametype() == "xfire") {
        var_6e672788835fc16b = self getclientomnvar("ui_cutthroat_player_state");
        if (var_6e672788835fc16b == 1) {
            function_e6ccdf90ba898cdc(self.team, -1);
        }
        if (var_6e672788835fc16b == 2) {
            function_5911caad56f963ea(self.team, -1);
        }
        if (istrue(revived)) {
            self setclientomnvar("ui_cutthroat_player_state", 0);
        } else {
            self setclientomnvar("ui_cutthroat_player_state", 3);
        }
    }
    setlowermessageomnvar("clear_lower_msg");
    if (isdefined(level.modeonexitlaststandfunc)) {
        self [[ level.modeonexitlaststandfunc ]](revived);
    }
    namespace_833bd5cc623ca701::function_807b3b0a3b4128f9();
    if (function_2a3c9a91bf1d3911()) {
        if (isdefined(self.laststandreviveent)) {
            namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.laststandreviveent.var_121a99ed77d25f87);
            namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.laststandreviveent.var_a2bc763e8380844b);
            self.laststandreviveent.var_121a99ed77d25f87 = undefined;
            self.laststandreviveent.var_a2bc763e8380844b = undefined;
        }
        self setclientomnvar("ui_br_has_been_interrogated", 0);
    }
    waittillframeend();
    self.inlaststand = 0;
    self.ignoreafkcheck = 0;
    self notify("afk_tracking_resume");
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b39
// Size: 0x3ea
function onrevive(var_4920bf02df960be9, var_d07b7dcc79b24490) {
    var_ba5943944b6cba2f = self.laststandoldweaponobj;
    val::function_c9d0b43701bdba00("laststand");
    brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
    if (brgametype == "plunder" || brgametype == "risk") {
        namespace_c6ccccd95254983f::plunder_allowallrepositoryuseforplayer(self, 1, 1);
    }
    val::function_588f2307a3040610(function_53c4c53197386572(self.laststandactionset, "laststand"));
    onexitcommon(1);
    self laststandrevive();
    self playsoundtoteam("npc_breath_revive", self.team, self, self);
    self playlocalsound("plr_breath_revive");
    self stoplocalsound("mvmt_heartbeat_plr_laststand");
    self notify("laststand_revived");
    laststandweapon = level.laststandweapon;
    /#
        if (!isusingmatchrulesdata()) {
            laststandweapon = getwatcheddvar("revive_trigger");
            if (!isdefined(laststandweapon)) {
                laststandweapon = getdvar(@"hash_ab99ad42c8f9d6fd", "self_revive_on_kill_success");
            }
        }
    #/
    if (laststandweapon != "none") {
        thread domonitoredweaponswitch(var_ba5943944b6cba2f, 1);
    }
    if (function_311066dfee085643(self)) {
        self.health = level.var_409e54f81172d6d8.laststandrevivehealth;
    } else if (!istrue(var_d07b7dcc79b24490)) {
        var_a776f097eb36e500 = level.laststandrevivehealth;
        /#
            if (!isusingmatchrulesdata()) {
                var_a776f097eb36e500 = getwatcheddvar("outlinefill_nodepth_orange");
                if (!isdefined(var_a776f097eb36e500)) {
                    var_a776f097eb36e500 = getdvarint(@"hash_984461a4d8ff9473", 50);
                }
                if (var_a776f097eb36e500 > namespace_775507ba36294dfb::gettweakablevalue("afk_tracking_resume", "postgame")) {
                    var_a776f097eb36e500 = namespace_775507ba36294dfb::gettweakablevalue("afk_tracking_resume", "postgame");
                }
            }
        #/
        if (!getdvarint(@"hash_bba79eeb1c990103") || self.health < level.laststandrevivehealth) {
            self.health = level.laststandrevivehealth;
            self notify("force_regeneration");
        }
    } else {
        self.health = self.maxhealth;
    }
    if (game["state"] == "postgame") {
        /#
            assert(!level.intermission);
        #/
        namespace_d576b6dc7cef9c62::freezeplayerforroundend();
    }
    setbeingrevivedinternal(0);
    if (namespace_36f464722d326bbe::isBRStyleGameType() && !istrue(self.gulag)) {
        if (!istrue(level.var_7a37960f05887b39)) {
            foreach (teammate in level.teamdata[self.team]["alivePlayers"]) {
                if (!isdefined(teammate)) {
                    continue;
                }
                if (teammate != self) {
                    teammate thread namespace_44abc05161e2e2cb::showsplash("br_teammate_revived", undefined, self);
                }
            }
        }
    }
    _stopshellshock();
    if (istrue(var_4920bf02df960be9) && istrue(level.allowselfrevive)) {
        allowselfrevive(0);
    }
    namespace_aad14af462a74d08::function_b050ed1983293d8(self, function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"hit"), "specialty_survivor", undefined);
    params = spawnstruct();
    params.reviver = self.var_63b104851a574f2a;
    callback::callback("player_revived", params);
    self.var_63b104851a574f2a = undefined;
    self.laststandattacker = undefined;
    self.laststandmeansofdeath = undefined;
    self.laststandweaponobj = undefined;
    self.laststanddowneddata = undefined;
    self.laststandattackermodifiers = undefined;
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        if (isdefined(self.var_a188fba649ffd953)) {
            namespace_cb965d2f71fefddc::forcegivesuper(self.var_a188fba649ffd953);
            self.var_a188fba649ffd953 = undefined;
        }
        namespace_d3d40f75bb4e4c32::setplayerdownedextrainfo(0);
    }
    if (istrue(var_4920bf02df960be9)) {
        namespace_27c74152ccb91331::function_55b08d6d71b41402(self, "self_revive");
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f2a
// Size: 0x15a
function onbleedout() {
    if (!isdefined(self)) {
        return;
    }
    thread onexitcommon();
    dropcarryobject();
    if (isdefined(self.laststandattacker)) {
        self.laststandattacker thread namespace_62c556437da28f50::scoreeventpopup(#"kill_confirmed");
    }
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        if (!istrue(level.gameended)) {
            self.deathsdoorsfx = 0;
            namespace_4887422e77f3514e::function_a2b4e6088394bade();
            self notify("deaths_door_exit");
            self playlocalsound("deaths_door_death");
            self stoplocalsound("mvmt_heartbeat_plr_laststand");
            self enableplayerbreathsystem(1);
        }
    }
    callback::callback("player_bleedout");
    inflictor = undefined;
    if (isdefined(self.laststandattacker)) {
        inflictor = self.laststandattacker;
    } else if (isdefined(self.laststanddowneddata) && isdefined(self.laststanddowneddata.attacker)) {
        inflictor = self.laststanddowneddata.attacker;
    } else {
        inflictor = self;
    }
    self.var_1cae08f4d3d931c1 = 1;
    self dodamage(self.health + 1000, self.origin, self, inflictor, "MOD_TRIGGER_HURT", makeweapon("iw9_me_fists_mp_ls"), "none");
    self.var_1cae08f4d3d931c1 = undefined;
    function_ed6f8ae3c33ed504(self.laststandattacker);
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x508b
// Size: 0xce
function ondeath(var_642470e1abc1bbf9) {
    if (!isdefined(self)) {
        return;
    }
    if (isdefined(self.laststandattacker) && _hasperk("specialty_survivor")) {
        function_ed6f8ae3c33ed504(self.laststandattacker);
    }
    if (istrue(self.isselfreviving)) {
        self notify("stopped_self_revive");
    }
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        if (!istrue(level.gameended)) {
            self.deathsdoorsfx = 0;
            self notify("deaths_door_exit");
            namespace_4887422e77f3514e::function_a2b4e6088394bade();
            self playlocalsound("deaths_door_death");
            self stoplocalsound("mvmt_heartbeat_plr_laststand");
            self enableplayerbreathsystem(1);
        }
    }
    if (isdefined(level.checkforlaststandwipe)) {
        [[ level.checkforlaststandwipe ]](self, 1);
    }
    thread onexitcommon();
    dropcarryobject();
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5160
// Size: 0x21
function dropcarryobject() {
    if (isdefined(self.carryobject)) {
        self.carryobject thread namespace_19b4203b51d56488::setdropped();
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5188
// Size: 0x232
function revivesetup(owner) {
    owner endon("death_or_disconnect");
    level endon("game_ended");
    owner waittill("last_stand_transition_done");
    reviveent = spawn("script_model", owner.origin);
    reviveent setmodel("tag_origin");
    owner.var_65a2b57b2b474c00 = reviveent;
    /#
        if (!isdefined(level.laststandreviveents)) {
            level.laststandreviveents = [];
        }
        level.laststandreviveents[level.laststandreviveents.size] = reviveent;
    #/
    team = owner.team;
    reviveent linkto(owner, "tag_origin", (0, 0, 20), (0, 0, 0));
    reviveent.owner = owner;
    reviveent.inuse = 0;
    reviveent.id = "laststand_reviver";
    reviveent.trigger = spawnstruct();
    reviveent.trigger.owner = owner;
    reviveent.trigger.id = "laststand_reviver";
    reviveent.trigger.targetname = "revive_trigger";
    reviveent makeusable();
    function_6b9549a69dc6a346(reviveent);
    reviveent thread function_4a3b25b6b877fe73(team);
    reviveent thread revivetriggerthink(team);
    reviveent thread endreviveonownerdeathordisconnect();
    if (getdvarint(@"hash_7a493092f8a1c04c", 0) && getdvarint(@"hash_ddd02929770fcc8c", 0) || function_311066dfee085643(self)) {
        owner thread secondwindthink();
    }
    owner.laststandreviveent = reviveent;
    level.laststandreviveents[reviveent getentitynumber()] = reviveent;
    reviveent thread removereviveentfromlevelarrayondeath();
    owner thread function_788452276786dcc7();
    if (owner namespace_d3d40f75bb4e4c32::hasselfrevivetoken() || istrue(owner.var_b24e609023ce8208) || istrue(owner _hasperk("specialty_survivor")) && !isdefined(self.var_d3bfe8baae5df8e0)) {
        owner.laststandreviveent selfrevivethink();
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53c1
// Size: 0x157
function function_6b9549a69dc6a346(reviveent) {
    /#
        assert(isdefined(reviveent));
    #/
    if (isdefined(reviveent.owner) && getdvarint(@"hash_39c3947a2e4f5f9e", 0)) {
        reviveent setcursorhint("HINT_BUTTON");
        reviveent sethinticon("hud_icon_cyber_revive");
        reviveent sethintdisplayrange(96);
        reviveent setuserange(96);
    } else {
        reviveent setcursorhint("HINT_NOICON");
    }
    reviveent setusehideprogressbar(1);
    reviveent setuseholdduration("duration_none");
    reviveent sethintstring("MP/LASTSTAND_REVIVE_USE");
    reviveent setusepriority(-1 - 1 - 1);
    reviveent sethintdisplayfov(90);
    reviveent setusefov(90);
    if (function_2a3c9a91bf1d3911() && !isdefined(reviveent.var_121a99ed77d25f87) && !isdefined(reviveent.var_a2bc763e8380844b)) {
        reviveent.var_121a99ed77d25f87 = namespace_7bdde15c3500a23f::setheadicon_singleimage([], "hud_icon_interrogation", 16, 0, 800, 100, undefined, 1, 1);
        reviveent.var_a2bc763e8380844b = namespace_7bdde15c3500a23f::setheadicon_singleimage([], "hud_icon_interrogation_active", 16, 0, 800, 100, undefined, 1, 1);
        setheadiconteam(reviveent.var_121a99ed77d25f87, reviveent.trigger.owner.team);
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x551f
// Size: 0x1ac
function function_35e8814575e3963d(owner) {
    owner endon("death_or_disconnect");
    level endon("game_ended");
    owner waittill("last_stand_transition_done");
    var_cd0de96a0ca17db5 = spawn("script_model", owner.origin);
    var_cd0de96a0ca17db5 setmodel("tag_origin");
    team = owner.team;
    var_cd0de96a0ca17db5 linkto(owner, "tag_origin", (0, 0, 12), (0, 0, 0));
    var_cd0de96a0ca17db5.number = level.var_7bcefa52cab9850f;
    level.var_7bcefa52cab9850f++;
    var_cd0de96a0ca17db5.owner = owner;
    var_cd0de96a0ca17db5.inuse = 0;
    var_cd0de96a0ca17db5.id = "laststand_interrogator";
    var_cd0de96a0ca17db5.count = getdvarint(@"hash_1ad2bfeffad0c8", 1);
    var_cd0de96a0ca17db5.trigger = spawnstruct();
    var_cd0de96a0ca17db5.trigger.owner = owner;
    var_cd0de96a0ca17db5.trigger.id = "laststand_interrogation";
    var_cd0de96a0ca17db5.trigger.targetname = "interrogation_trigger";
    var_cd0de96a0ca17db5 makeusable();
    var_cd0de96a0ca17db5 setuserange(getdvarfloat(@"hash_6cc46c78f1221930", 100));
    function_2aa6e4d20914e40a(var_cd0de96a0ca17db5);
    owner setclientomnvar("ui_br_has_been_interrogated", 0);
    owner.var_f159f1c13aa75721 = var_cd0de96a0ca17db5;
    var_cd0de96a0ca17db5 thread function_dc8861a5e3b418d5(team);
    var_cd0de96a0ca17db5 thread function_56e47961499ca06c(team);
    var_cd0de96a0ca17db5 thread endreviveonownerdeathordisconnect();
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56d2
// Size: 0xb2
function function_2aa6e4d20914e40a(var_cd0de96a0ca17db5) {
    /#
        assert(isdefined(var_cd0de96a0ca17db5));
    #/
    if (isdefined(var_cd0de96a0ca17db5.owner) && var_cd0de96a0ca17db5.owner function_c6cb3e654225077a()) {
        var_cd0de96a0ca17db5 setcursorhint("HINT_BUTTON");
        var_cd0de96a0ca17db5 sethinticon("ui_mp_br_player_status_interrogation");
        var_cd0de96a0ca17db5 sethintdisplayrange(96);
        var_cd0de96a0ca17db5 setuserange(96);
    } else {
        var_cd0de96a0ca17db5 setcursorhint("HINT_NOBUTTON");
    }
    var_cd0de96a0ca17db5 setusehideprogressbar(1);
    var_cd0de96a0ca17db5 setuseholdduration("duration_none");
    var_cd0de96a0ca17db5 sethintstring("MP/LASTSTAND_INTERROGATE_USE");
    var_cd0de96a0ca17db5 setusepriority(-1 - 1);
    var_cd0de96a0ca17db5 sethintdisplayfov(90);
    var_cd0de96a0ca17db5 setusefov(90);
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x578b
// Size: 0xf1
function function_d393166ea9eab059(var_642470e1abc1bbf9) {
    victim = var_642470e1abc1bbf9.victim;
    if (istrue(level.var_1a2b600a06ec21f4.var_198508771f0592a9) && isdefined(victim.attackers)) {
        foreach (attacker in victim.attackers) {
            if (istrue(attacker.inlaststand)) {
                attacker thread namespace_10260b963310d30e::onlaststandkillenemy(var_642470e1abc1bbf9);
            }
        }
    } else if (isdefined(var_642470e1abc1bbf9.attacker) && istrue(var_642470e1abc1bbf9.attacker.inlaststand)) {
        var_642470e1abc1bbf9.attacker thread namespace_10260b963310d30e::onlaststandkillenemy(var_642470e1abc1bbf9);
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5883
// Size: 0x250
function secondwindthink() {
    var_1730c8d8475566cd = self;
    var_1730c8d8475566cd endon("death_or_disconnect");
    var_1730c8d8475566cd endon("last_stand_finished");
    level endon("game_ended");
    var_7bf1255a3715a632 = gettime();
    var_738570dc981c9b43 = var_7c51875477ead31e = var_a47d4c036f14fc38 = laststandmeansofdeath = weaponname = meansofdeath = objweapon = einflictor = evictim = var_1730c8d8475566cd waittill("killed_enemy_in_last_stand");
    while (1) {
        if (var_7c51875477ead31e && !function_311066dfee085643(var_1730c8d8475566cd)) {
            var_738570dc981c9b43 = var_7c51875477ead31e = var_a47d4c036f14fc38 = laststandmeansofdeath = weaponname = meansofdeath = objweapon = einflictor = evictim = var_1730c8d8475566cd waittill("killed_enemy_in_last_stand");
            continue;
        }
        break;
    }
    /#
        assert(istrue(var_1730c8d8475566cd.inlaststand));
    #/
    var_36cd2fa9e32592d7 = evictim.laststandattacker;
    if (!isdefined(var_36cd2fa9e32592d7)) {
        var_36cd2fa9e32592d7 = evictim;
    }
    var_1450075a920a7dd5 = isdefined(var_36cd2fa9e32592d7) && var_36cd2fa9e32592d7 != var_1730c8d8475566cd;
    var_c9d5089e35e3ff9e = var_7c51875477ead31e;
    var_e6ef59bd6dc2938a = var_738570dc981c9b43 || isdefined(einflictor) && einflictor getentitynumber() == worldentnumber();
    var_5ba6882801957605 = gettime() - var_7bf1255a3715a632;
    var_6b0df23a41285117 = float(var_5ba6882801957605 / 1000);
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        namespace_a011fbf6d93f25e5::branalytics_secondwind(var_1730c8d8475566cd, var_36cd2fa9e32592d7, evictim, meansofdeath, weaponname, laststandmeansofdeath, var_a47d4c036f14fc38, var_1450075a920a7dd5, var_c9d5089e35e3ff9e, var_e6ef59bd6dc2938a, var_6b0df23a41285117);
        var_1730c8d8475566cd thread namespace_44abc05161e2e2cb::showsplash("br_second_wind");
    }
    var_1730c8d8475566cd finishreviveplayer("self_revive_on_kill_success", var_1730c8d8475566cd);
    var_e2b2bbd9e6539f11 = namespace_54d20dd0dd79277f::getteamdata(var_1730c8d8475566cd.team, "players");
    foreach (player in var_e2b2bbd9e6539f11) {
        if (player != var_1730c8d8475566cd && isalive(player)) {
            player thread namespace_44abc05161e2e2cb::showsplash("br_teammate_second_wind", undefined, var_1730c8d8475566cd);
        }
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ada
// Size: 0xe8
function onlaststandkillenemy(var_642470e1abc1bbf9, laststandmeansofdeath, laststandweaponobj) {
    evictim = var_642470e1abc1bbf9.victim;
    einflictor = var_642470e1abc1bbf9.inflictor;
    objweapon = var_642470e1abc1bbf9.objweapon;
    meansofdeath = var_642470e1abc1bbf9.meansofdeath;
    weaponname = var_642470e1abc1bbf9.weaponfullstring;
    var_7c51875477ead31e = var_642470e1abc1bbf9.attacker != self;
    var_738570dc981c9b43 = istrue(var_642470e1abc1bbf9.assistedsuicide);
    var_a47d4c036f14fc38 = undefined;
    if (isdefined(laststandweaponobj)) {
        var_a47d4c036f14fc38 = getcompleteweaponname(laststandweaponobj);
    }
    self notify("killed_enemy_in_last_stand", evictim);
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5bc9
// Size: 0x35
function endreviveonownerdeathordisconnect() {
    self endon("death");
    self.owner waittill_any_4("death_or_disconnect", "last_stand_finished", "last_stand_heal_active", "interrogation_finished");
    self delete();
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c05
// Size: 0x2e
function removereviveentfromlevelarrayondeath() {
    level endon("game_ended");
    entnum = self getentitynumber();
    self waittill("death");
    level.laststandreviveents[entnum] = undefined;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c3a
// Size: 0x8e
function updateusablebyteam(team) {
    self disableplayeruseforallplayers();
    function_4c452a6c72371f17();
    foreach (player in level.players) {
        if (team == player.team && player != self.owner) {
            self enableplayeruse(player);
        }
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ccf
// Size: 0x87
function function_38f5ade989b3848f(team) {
    /#
        assert(function_2a3c9a91bf1d3911());
    #/
    self enableplayeruseforallplayers();
    foreach (player in level.players) {
        if (team == player.team) {
            self disableplayeruse(player);
        }
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d5d
// Size: 0x5e
function function_4a3b25b6b877fe73(team) {
    self endon("death");
    self.owner endon("last_stand_finished");
    while (1) {
        updateusablebyteam(self.owner.team);
        self.owner waittill_any_2("joined_team", "refresh_revives");
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5dc2
// Size: 0x54
function function_dc8861a5e3b418d5(team) {
    self endon("death");
    self.owner endon("last_stand_finished");
    while (1) {
        function_38f5ade989b3848f(self.owner.team);
        self.owner waittill("joined_team");
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e1d
// Size: 0x26
function function_7627883ac8601401() {
    if (!self isonground() && !self isswimming()) {
        return 0;
    }
    if (self function_e5bf22923d0004bc()) {
        return 0;
    }
    return 1;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e4b
// Size: 0x39
function function_f111048fabf84e37(revivee) {
    if (!isdefined(revivee)) {
        return 0;
    }
    if (!isdefined(self)) {
        return 0;
    }
    return self usebuttonpressed() || istrue(self.var_7f59448717b5aa63) || revivee namespace_833bd5cc623ca701::function_f0d1c9c39359efff();
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e8c
// Size: 0x450
function revivetriggerthink(team) {
    self.owner endon("last_stand_finished");
    self.owner endon("last_stand_heal_active");
    self.owner endon("disconnect");
    level endon("game_ended");
    for (;;) {
        reviver = self waittill("trigger");
        /#
            reviver notify("reviving_self");
        #/
        if (istrue(self.owner.var_c6a5ba98f5f43e0d)) {
            continue;
        }
        if (reviver.team != self.owner.team && !istrue(self.var_fd7344b9978191be)) {
            continue;
        }
        if (istrue(self.owner.var_895c1aaac16f7256) || istrue(reviver.var_93018d510a589832)) {
            continue;
        }
        var_2a2f3b9577569f6f = reviver getmovingplatformparent();
        var_d73e510900c0d7f0 = self.owner getmovingplatformparent();
        var_b72a36ac20c64b41 = isdefined(var_2a2f3b9577569f6f) || isdefined(var_d73e510900c0d7f0);
        if (var_b72a36ac20c64b41 && !namespace_2a184fc4902783dc::ray_trace_detail_passed(reviver geteye(), self.origin + (0, 0, 20), [0:reviver, 1:self.owner], namespace_2a184fc4902783dc::create_contents(1, 0, 0, 0, 0, 1))) {
            reviver namespace_44abc05161e2e2cb::showerrormessage("MP/REVIVE_BLOCKED");
        } else {
            while (reviver function_f111048fabf84e37(self.owner) && !reviver function_7627883ac8601401()) {
                waitframe();
            }
            if (istrue(reviver.insertingarmorplate) && !self.owner namespace_833bd5cc623ca701::function_f0d1c9c39359efff()) {
                reviver notify("try_armor_cancel", "last_stand_reviver_start");
                while (istrue(reviver.insertingarmorplate) && reviver function_f111048fabf84e37(self.owner)) {
                    waitframe();
                }
            }
            if (!reviver function_f111048fabf84e37(self.owner)) {
                continue;
            }
            if (getgametype() == "xfire") {
                var_6e672788835fc16b = self.owner getclientomnvar("ui_cutthroat_player_state");
                if (var_6e672788835fc16b != 2 && getgametype() == "xfire") {
                    self.owner setclientomnvar("ui_cutthroat_player_state", 2);
                    function_5911caad56f963ea(team, 1);
                    function_e6ccdf90ba898cdc(team, -1);
                }
            }
            self.owner setbeingrevivedinternal(1);
            if (!self.owner namespace_833bd5cc623ca701::function_f0d1c9c39359efff()) {
                reviver thread namespace_7db13bdf599e41a6::function_c86cf00d5859ce10(self.owner.origin);
            }
            revived = 0;
            self.owner notify("handle_revive_message");
            self makeunusable();
            if (reviver function_c6cb3e654225077a()) {
                reviver function_fc1c1e51058904a3("MP/LASTSTAND_REVIVE_USE");
            }
            self.owner allowmovement(0);
            if (!self.owner namespace_833bd5cc623ca701::function_f0d1c9c39359efff()) {
                reviver setlaststandreviving(1, 0);
            } else {
                reviver setlaststandreviving(1, 1);
            }
            reviver namespace_1d863a7bbc05fc52::function_d9bd056c79a6077b(self.owner);
            thread useholdthink(reviver);
            if (!self.owner namespace_833bd5cc623ca701::function_f0d1c9c39359efff()) {
                reviver thread switchtoteammatereviveweapon(self.owner);
            }
            if (namespace_36f464722d326bbe::isBRStyleGameType()) {
                self.owner namespace_d3d40f75bb4e4c32::setplayerbeingrevivedextrainfo(1);
            }
            var_4930cbce302555b1 = waittill_any_return_no_endon_death_3("use_hold_revive_success", "use_hold_revive_fail", "death_or_disconnect");
            if (reviver function_c6cb3e654225077a()) {
                reviver forceusehintoff();
            }
            if (var_4930cbce302555b1 == "use_hold_revive_success") {
                revived = 1;
            }
            reviver notify("finish_buddy_reviving");
            if (!isbot(reviver) && !isbot(self)) {
                reviver thread namespace_6b49ddb858f34366::function_b821fe623180790();
            }
            self.owner setbeingrevivedinternal(0);
            revived = self.owner finishreviveplayer(var_4930cbce302555b1, reviver);
            if (revived) {
                return;
            }
            thread decayreviveprogress();
            self makeusable();
            function_6b9549a69dc6a346(self);
            updateusablebyteam(self.owner.team);
            waittillframeend();
        }
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62e3
// Size: 0x61c
function function_56e47961499ca06c(team) {
    self.owner endon("disconnect");
    level endon("game_ended");
    var_5bebd2013b0f01ec = self.owner;
    for (;;) {
        interrogator = self waittill("trigger");
        if (interrogator.team == self.owner.team) {
            continue;
        }
        if (interrogator ismeleeing() || interrogator isinexecutionattack()) {
            continue;
        }
        if (istrue(var_5bebd2013b0f01ec getbeingrevivedinternal())) {
            if (istrue(var_5bebd2013b0f01ec.isselfreviving)) {
                var_5bebd2013b0f01ec.var_fa3003648b3c8eac = 1;
                var_5bebd2013b0f01ec setbeingrevivedinternal(0);
                waitframe();
                var_5bebd2013b0f01ec.var_fa3003648b3c8eac = 0;
                goto LOC_00000101;
            }
        } else {
        LOC_00000101:
            while (!interrogator function_7627883ac8601401() && interrogator function_f111048fabf84e37(var_5bebd2013b0f01ec)) {
                waitframe();
            }
            if (interrogator getstance() != "stand") {
                var_ccbc8f28cb6a19e7 = interrogator setstance("stand", 0, 1);
                if (var_ccbc8f28cb6a19e7) {
                    wait(0.4);
                    goto LOC_00000164;
                }
                interrogator namespace_44abc05161e2e2cb::showerrormessage("MP_BR_INGAME/INTERROGATE_BLOCKED_STANCE");
                wait(0.1);
            } else {
            LOC_00000164:
                if (istrue(interrogator.insertingarmorplate)) {
                    interrogator notify("try_armor_cancel", "interrogation_interrogator_start");
                    while (istrue(interrogator.insertingarmorplate) && interrogator function_f111048fabf84e37(var_5bebd2013b0f01ec)) {
                        waitframe();
                    }
                }
                if (!isreallyalive(interrogator) || !isreallyalive(var_5bebd2013b0f01ec)) {
                    continue;
                }
                if (!interrogator function_f111048fabf84e37(interrogator)) {
                    continue;
                }
                var_18d0bf9a1f307a7a = function_f671d7efef879a1(interrogator, var_5bebd2013b0f01ec);
                switch (var_18d0bf9a1f307a7a) {
                case 4:
                    interrogator namespace_44abc05161e2e2cb::showerrormessage("MP_BR_INGAME/INTERROGATE_BLOCKED_SWIMMING");
                    wait(0.1);
                    continue;
                case 0:
                case 1:
                case 2:
                    break;
                case 5:
                    break;
                default:
                    interrogator namespace_44abc05161e2e2cb::showerrormessage("MP_BR_INGAME/INTERROGATE_BLOCKED");
                    wait(0.1);
                    continue;
                }
                interrogator setclientomnvar("ui_tablet_usb", 10);
                interrogator function_4ba85e5091eee483(#"hash_d0f9d14b2396542b", 4);
                if (getdvarint(@"hash_60a0581926005683", 1) != 0) {
                    thread function_b3f5eede669e7182(interrogator, var_5bebd2013b0f01ec);
                }
                var_5bebd2013b0f01ec setbeingrevivedinternal(1);
                var_5bebd2013b0f01ec namespace_d3d40f75bb4e4c32::function_cc20f0c1304019d9(1);
                interrogator namespace_d3d40f75bb4e4c32::function_eb28f4724f0f14b(1);
                revived = 0;
                self makeunusable();
                if (interrogator function_c6cb3e654225077a()) {
                    interrogator function_fc1c1e51058904a3("MP/LASTSTAND_INTERROGATE_USE");
                }
                var_5bebd2013b0f01ec.var_21fc661949481ced = namespace_cbd3754a0c69cc63::outlineenableforteam(var_5bebd2013b0f01ec, var_5bebd2013b0f01ec.team, "outline_nodepth_orange", "level_script");
                var_5bebd2013b0f01ec allowmovement(0);
                interrogator.var_93018d510a589832 = 1;
                var_5bebd2013b0f01ec.var_895c1aaac16f7256 = 1;
                thread useholdthink(interrogator, undefined, 1);
                if (var_18d0bf9a1f307a7a == 5) {
                    thread function_1d6e0919bcc01c46(interrogator, var_5bebd2013b0f01ec, self.usetime);
                    interrogator.var_a3fb93a908cc7f32 = 1;
                } else {
                    var_52c70b19d5ea6edf = rotatevector((4.167, -0.186, 39.969), self.owner.angles);
                    interrogator thread function_96f2172e98188560(self.owner.origin + var_52c70b19d5ea6edf);
                }
                interrogator thread switchtoteammatereviveweapon(var_5bebd2013b0f01ec, 1);
                thread function_bef121e9cc93f796(interrogator, var_5bebd2013b0f01ec);
                self.owner.laststandreviveent.var_f1da02a134648443 = 4;
                self.owner.laststandreviveent function_4c452a6c72371f17();
                var_4930cbce302555b1 = waittill_any_return_no_endon_death_3("use_hold_interrogate_success", "use_hold_interrogate_fail", "death_or_disconnect");
                if (interrogator function_c6cb3e654225077a()) {
                    interrogator forceusehintoff();
                }
                if (var_4930cbce302555b1 == "use_hold_interrogate_success") {
                    var_5bebd3013b0f041f = 1;
                } else {
                    self.owner.laststandreviveent.var_f1da02a134648443 = 1;
                    self.owner.laststandreviveent function_4c452a6c72371f17();
                }
                interrogator notify("finish_victim_interrogation");
                if (var_4930cbce302555b1 == "use_hold_interrogate_success" || var_4930cbce302555b1 == "use_hold_interrogate_fail") {
                    var_5bebd2013b0f01ec notify(var_4930cbce302555b1);
                }
                var_5bebd2013b0f01ec setbeingrevivedinternal(0);
                var_5bebd2013b0f01ec namespace_d3d40f75bb4e4c32::function_cc20f0c1304019d9(0);
                interrogator namespace_d3d40f75bb4e4c32::function_eb28f4724f0f14b(0);
                interrogator setclientomnvar("ui_tablet_usb", 0);
                var_5bebd3013b0f041f = var_5bebd2013b0f01ec function_70f1dbc7125939b8(var_4930cbce302555b1, interrogator, self.owner.team);
                if (var_4930cbce302555b1 == "use_hold_interrogate_fail") {
                    wait(0.25);
                }
                if (!isdefined(self)) {
                    return;
                }
                /#
                    if (istrue(var_5bebd3013b0f041f) && isbot(interrogator)) {
                        self makeusable();
                    }
                #/
                if (istrue(var_5bebd3013b0f041f)) {
                    self.count--;
                    if (self.count <= 0) {
                        if (isdefined(self.owner) && isdefined(self.owner.laststandreviveent)) {
                            self.owner.laststandreviveent.var_f1da02a134648443 = 2;
                            self.owner.laststandreviveent.var_9d797a762d9195eb = 1;
                            self.owner setclientomnvar("ui_br_has_been_interrogated", 1);
                            self.owner.laststandreviveent function_4c452a6c72371f17();
                        }
                        return;
                    }
                }
                thread function_1f761672c3708743();
                self makeusable();
                self setuserange(getdvarfloat(@"hash_6cc46c78f1221930", 100));
                function_2aa6e4d20914e40a(self);
                function_38f5ade989b3848f(self.owner.team);
            LOC_00000617:
            }
        LOC_00000617:
        }
    LOC_00000617:
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6906
// Size: 0x5b
function function_bef121e9cc93f796(interrogator, var_5bebd2013b0f01ec) {
    var_d33a0baa5624a4a = interrogator.team;
    var_ca6fac37f3e2227d = var_5bebd2013b0f01ec.team;
    function_dab2d0f370a19a17(var_d33a0baa5624a4a, var_ca6fac37f3e2227d);
    function_6ffc1d64d4e5832d(interrogator, var_5bebd2013b0f01ec);
    function_a73848ef9a4e7932(var_d33a0baa5624a4a, var_ca6fac37f3e2227d);
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6968
// Size: 0x46
function function_6ffc1d64d4e5832d(interrogator, var_5bebd2013b0f01ec) {
    level endon("game_ended");
    self endon("use_hold_interrogate_fail");
    self endon("death_or_disconnect");
    var_5bebd2013b0f01ec endon("last_stand_finished");
    var_5bebd2013b0f01ec endon("check_for_plea");
    var_5bebd2013b0f01ec endon("disconnect");
    interrogator waittill("interrogation_signal_lost");
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69b5
// Size: 0x110
function function_dab2d0f370a19a17(var_d33a0baa5624a4a, var_ca6fac37f3e2227d) {
    if (!issharedfuncdefined("teamAssim", "disablePlayer")) {
        return;
    }
    foreach (player in level.teamdata[var_d33a0baa5624a4a]["players"]) {
        [[ getsharedfunc("teamAssim", "disablePlayer") ]](player, "interrogation_" + self.number);
    }
    foreach (player in level.teamdata[var_ca6fac37f3e2227d]["players"]) {
        [[ getsharedfunc("teamAssim", "disablePlayer") ]](player, "interrogation_" + self.number);
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6acc
// Size: 0x110
function function_a73848ef9a4e7932(var_d33a0baa5624a4a, var_ca6fac37f3e2227d) {
    if (!issharedfuncdefined("teamAssim", "enablePlayer")) {
        return;
    }
    foreach (player in level.teamdata[var_d33a0baa5624a4a]["players"]) {
        [[ getsharedfunc("teamAssim", "enablePlayer") ]](player, "interrogation_" + self.number);
    }
    foreach (player in level.teamdata[var_ca6fac37f3e2227d]["players"]) {
        [[ getsharedfunc("teamAssim", "enablePlayer") ]](player, "interrogation_" + self.number);
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6be3
// Size: 0xfb
function switchtoteammatereviveweapon(revivee, interrogation) {
    reviver = self;
    reviver endon("death_or_disconnect");
    level endon("game_ended");
    if (!isdefined(interrogation)) {
        interrogation = 0;
    }
    if (istrue(interrogation)) {
        weaponobj = makeweapon("interrogation_tools_mp");
    } else {
        weaponobj = makeweapon("teammate_revive_stim_mp");
    }
    if (!istrue(reviver.var_a3fb93a908cc7f32)) {
        reviver _giveweapon(weaponobj, 0, 0, 0);
        reviver thread function_4a81a13950a6021d(weaponobj);
    }
    reviver thread watchfordeathwhilereviving();
    reviver thread watchforteammatedeathwhilereviving(revivee);
    reviver thread watchforteammaterevivedwhilereviving(revivee);
    if (!istrue(reviver.var_a3fb93a908cc7f32)) {
        var_41bf9bf4918115ac = domonitoredweaponswitch(weaponobj, isbot(reviver));
        if (!istrue(var_41bf9bf4918115ac)) {
            return;
        }
        reviver val::set("last_stand_weapon_switch", "weapon_switch", 0);
    }
    if (isdefined(reviver.var_a3fb93a908cc7f32)) {
        reviver.var_a3fb93a908cc7f32 = undefined;
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6ce5
// Size: 0x5d
function private function_4a81a13950a6021d(weaponobj) {
    reviver = self;
    level endon("game_ended");
    reviver teammatereviveweaponwaitputaway();
    if (isdefined(reviver)) {
        var_75d67fbf8f835d55 = 1;
        if (!reviver namespace_f8065cafc523dba5::_isalive() || isinlaststand(reviver)) {
            var_75d67fbf8f835d55 = 0;
        }
        reviver thread function_1d21f6e823b18aa8(weaponobj, var_75d67fbf8f835d55);
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6d49
// Size: 0xb8
function private function_1d21f6e823b18aa8(weaponobj, var_75d67fbf8f835d55) {
    reviver = self;
    reviver endon("disconnect");
    level endon("game_ended");
    reviver val::function_c9d0b43701bdba00("last_stand_weapon_switch");
    reviver notify("revive_stim_finished");
    if (reviver isswitchingtoweaponwithmonitoring(weaponobj)) {
        reviver abortmonitoredweaponswitch(weaponobj);
    } else {
        reviver _takeweapon(weaponobj);
    }
    if (istrue(var_75d67fbf8f835d55)) {
        var_41bf9bf4918115ac = reviver domonitoredweaponswitch(reviver.lastdroppableweaponobj, isbot(reviver));
        currentweapon = reviver getcurrentweapon();
        if (currentweapon.basename == "none") {
            reviver forcevalidweapon();
        }
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e08
// Size: 0x105
function teammatereviveweaponwaitputaway(streakinfo) {
    reviver = self;
    level endon("game_ended");
    if (!istrue(reviver.revivingteammate) && !istrue(reviver.var_93018d510a589832)) {
        /#
            if (0) {
                var_7adbad8ca91fb457 = ter_op(istrue(reviver.revivingteammate), 1, 0);
                var_6c0402dbf33cc28a = ter_op(istrue(reviver.var_93018d510a589832), 1, 0);
                println("meat_shield" + var_7adbad8ca91fb457 + "interrogate_frontleft_knife_start" + var_6c0402dbf33cc28a);
            }
        #/
        return;
    }
    /#
        if (0) {
            println("script_vehicle" + gettime());
        }
    #/
    var_fa7c7b71dc2c9cb0 = [0:"death_or_disconnect", 1:"finish_buddy_reviving", 2:"last_stand_start", 3:"finish_victim_interrogation"];
    reviver waittill_any_in_array_return_no_endon_death(var_fa7c7b71dc2c9cb0);
    /#
        if (0) {
            println("script_model" + gettime());
        }
    #/
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f14
// Size: 0x53
function watchfordeathwhilereviving() {
    /#
        if (0) {
            println("script_model" + gettime());
        }
    #/
    reviver = self;
    reviver endon("finish_buddy_reviving");
    reviver endon("finish_victim_interrogation");
    reviver endon("disconnect");
    level endon("game_ended");
    reviver waittill("death");
    reviver notify("finish_buddy_reviving");
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f6e
// Size: 0x66
function watchforteammatedeathwhilereviving(revivee) {
    /#
        if (0) {
            println("iw9_wz_interrogate_backleft_pda_loop" + gettime());
        }
    #/
    reviver = self;
    reviver endon("finish_buddy_reviving");
    reviver endon("finish_victim_interrogation");
    reviver endon("death_or_disconnect");
    level endon("game_ended");
    revivee waittill_any_2("death_or_disconnect", "enter_live_ragdoll");
    reviver notify("finish_buddy_reviving");
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6fdb
// Size: 0x5c
function watchforteammaterevivedwhilereviving(revivee) {
    /#
        if (0) {
            println("<unknown string>" + gettime());
        }
    #/
    reviver = self;
    reviver endon("finish_buddy_reviving");
    reviver endon("finish_victim_interrogation");
    reviver endon("death_or_disconnect");
    level endon("game_ended");
    revivee waittill("last_stand_revived");
    reviver notify("finish_buddy_reviving");
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x703e
// Size: 0x157
function function_788452276786dcc7() {
    revivee = self;
    if (!isplayer(revivee)) {
        return;
    }
    if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
        return;
    }
    var_98422a847a5a36b3 = getdvarint(@"hash_fa3a2702c11c396c", 0) == 1;
    if (!var_98422a847a5a36b3) {
        return;
    }
    revivee endon("death_or_disconnect");
    revivee endon("last_stand_revived");
    if (!isai(revivee)) {
        revivee notifyonplayercommand("stanceChangePressed", "+stancedown");
        revivee notifyonplayercommand("stanceChangePressed", "+movedown");
        revivee notifyonplayercommand("stanceChangePressed", "+prone");
        revivee notifyonplayercommand("stanceChangePressed", "+stance");
        revivee notifyonplayercommand("stanceChangePressed", "+togglecrouch");
        revivee notifyonplayercommand("stanceChangeReleased", "-stancedown");
        revivee notifyonplayercommand("stanceChangeReleased", "-movedown");
        revivee notifyonplayercommand("stanceChangeReleased", "-prone");
        revivee notifyonplayercommand("stanceChangeReleased", "-stance");
        revivee notifyonplayercommand("stanceChangeReleased", "-togglecrouch");
    }
    for (;;) {
        revivee waittill("stanceChangePressed");
        var_8c7ad61293102245 = gettime();
        revivee waittill("stanceChangeReleased");
        var_22def5ecdec8de62 = gettime() - var_8c7ad61293102245;
        var_566b9019751185de = 350;
        if (var_22def5ecdec8de62 < var_566b9019751185de) {
            function_fc2445a76915f9e7(revivee);
        }
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x719c
// Size: 0x61
function function_fc2445a76915f9e7(revivee) {
    revivee.var_84649776f0d63667 = !istrue(revivee.var_84649776f0d63667);
    var_dc7d14535d73eda1 = istrue(revivee.var_84649776f0d63667);
    var_9c0bec190d4fa4da = ter_op(var_dc7d14535d73eda1, "MP_BR_INGAME/WILL_REVIVE_INTO_PRONE", "MP_BR_INGAME/WILL_REVIVE_INTO_CROUCH");
    revivee namespace_44abc05161e2e2cb::showerrormessage(var_9c0bec190d4fa4da);
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7204
// Size: 0x416
function finishreviveplayer(var_70687e0cc558a009, reviver) {
    revivee = self;
    revived = 0;
    if (!isdefined(revivee) || !isalive(revivee)) {
        return 0;
    }
    if (var_70687e0cc558a009 == "use_hold_revive_success" || var_70687e0cc558a009 == "self_revive_on_kill_success" || var_70687e0cc558a009 == "self_revive_success") {
        revived = 1;
    }
    if (getgametype() == "xfire") {
        var_6e672788835fc16b = self getclientomnvar("ui_cutthroat_player_state");
        if (var_6e672788835fc16b == 2) {
            function_5911caad56f963ea(revivee.team, -1);
            if (var_70687e0cc558a009 == "use_hold_revive_fail") {
                self setclientomnvar("ui_cutthroat_player_state", 1);
                function_e6ccdf90ba898cdc(revivee.team, 1);
            } else if (istrue(revived)) {
                self setclientomnvar("ui_cutthroat_player_state", 0);
            } else {
                self setclientomnvar("ui_cutthroat_player_state", 3);
            }
        }
    }
    revivee.isselfreviving = 0;
    revivee setbeingrevivedinternal(0);
    if (var_70687e0cc558a009 == "self_revive_success") {
        revivee selfrevivingdoneanimevent();
    }
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        revivee namespace_d3d40f75bb4e4c32::setplayerbeingrevivedextrainfo(0);
        revivee namespace_d3d40f75bb4e4c32::setplayerselfrevivingextrainfo(0);
    }
    revivee allowmovement(1);
    if (revived) {
        revivee setlowermessageomnvar("clear_lower_msg");
        revivee notify("last_stand_revived");
        self.fastcrouchspeedmod = 0;
        namespace_3bbb5a98b932c46f::updatemovespeedscale();
        if (namespace_36f464722d326bbe::isBRStyleGameType()) {
            if (!istrue(level.gameended)) {
                revivee namespace_d3d40f75bb4e4c32::setplayerdownedextrainfo(0);
                namespace_391de535501b0143::revivedplayer(reviver, revivee);
                namespace_aad14af462a74d08::onlaststandrevive(reviver, revivee);
                revivee startchallengetimer("alive_not_downed");
                if (reviver != revivee) {
                    reviver namespace_3c5a4254f2b957ea::incpersstat("rescues", 1);
                    reviver namespace_b919c4be206d3c80::function_48544e365f4f5648(17, 1);
                    revivee namespace_3c5a4254f2b957ea::incpersstat("rescued", 1);
                }
                revivee.deathsdoorsfx = 0;
                revivee namespace_4887422e77f3514e::onexitdeathsdoor(1);
            }
            if (!namespace_d3d40f75bb4e4c32::istutorial()) {
                setting = getdvarint(@"hash_60fa486ada22dba2", 0);
                switch (setting) {
                case 1:
                    revivee playsoundtoteam("br_player_revived", revivee.team, undefined, self);
                    break;
                case 2:
                    playsoundatpos(revivee.origin, "br_player_revived");
                    break;
                case 0:
                default:
                    break;
                }
            }
            if (isdefined(self.laststandoutlineid)) {
                namespace_cbd3754a0c69cc63::outlinedisable(self.laststandoutlineid, self);
                self.laststandoutlineid = undefined;
            }
        }
        if (reviver != revivee) {
            reviver playlocalsound("jup_revive_teammate_success");
            if (revivee.team == reviver.team) {
                if (function_7ba31cb6b21c346f()) {
                    revivee thread function_36edf91561322753(2);
                } else {
                    level thread namespace_25c5a6f43bb97b43::trysaylocalsound(self, #"hash_1f1f4fe800e03b33");
                }
            } else {
                level thread namespace_25c5a6f43bb97b43::trysaylocalsound(self, #"hash_e44d24d831d79c62");
            }
        } else {
            level thread namespace_25c5a6f43bb97b43::trysaylocalsound(self, #"hash_8c6faf2929248da5");
        }
        if (namespace_36f464722d326bbe::isBRStyleGameType()) {
            var_e95cd93fdb0f51a8 = "crouch";
            if (istrue(self.var_84649776f0d63667)) {
                var_e95cd93fdb0f51a8 = "prone";
            }
            self.var_84649776f0d63667 = undefined;
            var_ccbc8f28cb6a19e7 = revivee setstance(var_e95cd93fdb0f51a8);
            if (!var_ccbc8f28cb6a19e7) {
                var_82ee04dfa5b600e1 = var_e95cd93fdb0f51a8 == "crouch";
                var_ccbc8f28cb6a19e7 = revivee setstance(ter_op(var_82ee04dfa5b600e1, "prone", "crouch"));
            }
        }
        revivee.var_63b104851a574f2a = reviver;
        if (reviver != revivee) {
            thread namespace_27c74152ccb91331::function_bd70b31dd13292bc(reviver);
            thread namespace_27c74152ccb91331::function_bd70a21dd1326d59(revivee);
        }
    }
    revivee takelaststandtransitionweapon();
    revivee thread function_78d588e2e4cbda39();
    if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
        revivee thread function_a3a340a5d9222a17();
    }
    return revived;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7622
// Size: 0x68
function function_78d588e2e4cbda39() {
    self endon("death_or_disconnect");
    if (level.gametype != "br") {
        return;
    }
    val::set("laststand", "offhand_secondary_weapons", 0);
    while (self isthrowingbackgrenade()) {
        self.var_47f9a068df7c5418 = 1;
        self giveandfireoffhand("rock_mp");
        wait(1);
    }
    val::set("laststand", "offhand_secondary_weapons", 1);
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7691
// Size: 0xfe
function function_a3a340a5d9222a17() {
    self endon("death_or_disconnect");
    waitframe();
    var_9dd68ebdd6e786a9 = isdefined(level.var_1a2b600a06ec21f4) && isdefined(level.var_1a2b600a06ec21f4.var_9132b898f78c9d19) && istrue(level.var_1a2b600a06ec21f4.var_9132b898f78c9d19 != "NONE");
    if (!var_9dd68ebdd6e786a9) {
        var_ccbc8f28cb6a19e7 = self setstance("crouch");
        if (!var_ccbc8f28cb6a19e7) {
            self setstance("prone");
        }
    } else {
        switch (level.var_1a2b600a06ec21f4.var_9132b898f78c9d19) {
        case #"hash_b5d4f2ac1b263b63":
            self setstance("stand");
            break;
        case #"hash_a8f9e4a698fa0eeb":
            self setstance("crouch");
            break;
        case #"hash_e85597ec7477d565":
            self setstance("prone");
            break;
        default:
            break;
        }
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7796
// Size: 0x28b
function function_70f1dbc7125939b8(var_70687e0cc558a009, interrogator, team) {
    var_5bebd2013b0f01ec = self;
    var_5bebd3013b0f041f = 0;
    if (!isdefined(var_5bebd2013b0f01ec) || !isalive(var_5bebd2013b0f01ec)) {
        return 0;
    }
    self.fastcrouchspeedmod = 0;
    namespace_3bbb5a98b932c46f::updatemovespeedscale();
    if (var_70687e0cc558a009 == "use_hold_interrogate_success") {
        var_5bebd3013b0f041f = 1;
    }
    var_5bebd2013b0f01ec.var_895c1aaac16f7256 = 0;
    namespace_cbd3754a0c69cc63::outlinedisable(var_5bebd2013b0f01ec.var_21fc661949481ced, var_5bebd2013b0f01ec);
    var_5bebd2013b0f01ec allowmovement(1);
    if (var_5bebd3013b0f041f) {
        var_5bebd2013b0f01ec setlowermessageomnvar("clear_lower_msg");
        var_5bebd2013b0f01ec notify("last_stand_interrogated");
        if (isdefined(self.laststandoutlineid)) {
            namespace_cbd3754a0c69cc63::outlinedisable(self.laststandoutlineid, self);
            self.laststandoutlineid = undefined;
        }
        interrogator namespace_3c5a4254f2b957ea::incpersstat("interrogations", 1);
        interrogator thread function_1b56d7c4fe15b79c(interrogator, var_5bebd2013b0f01ec);
        objweapon = makeweapon("interrogation_tools_mp");
        obituary(var_5bebd2013b0f01ec, interrogator, objweapon, "MOD_INTERROGATE", level.teamdata[interrogator.team]["alivePlayers"]);
        obituary(var_5bebd2013b0f01ec, interrogator, objweapon, "MOD_INTERROGATE", level.teamdata[var_5bebd2013b0f01ec.team]["alivePlayers"]);
        foreach (teammate in level.teamdata[interrogator.team]["alivePlayers"]) {
            if (!isdefined(teammate)) {
                continue;
            }
            var_9b042f0ef4a15a40 = interrogator getentitynumber();
            teammate thread namespace_44abc05161e2e2cb::showsplash("br_enemy_interrogated_center", var_9b042f0ef4a15a40, interrogator);
        }
        foreach (teammate in level.teamdata[var_5bebd2013b0f01ec.team]["alivePlayers"]) {
            if (!isdefined(teammate)) {
                continue;
            }
            var_fbc3739d54c0a83f = var_5bebd2013b0f01ec getentitynumber();
            teammate thread namespace_44abc05161e2e2cb::showsplash("br_teammate_interrogated_center", var_fbc3739d54c0a83f, var_5bebd2013b0f01ec);
        }
        var_5bebd2013b0f01ec playsound("br_player_interrogated_enemy");
        function_b37595afabefa038(interrogator, var_5bebd2013b0f01ec);
    }
    return var_5bebd3013b0f041f;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a29
// Size: 0x220
function function_b37595afabefa038(interrogator, var_5bebd2013b0f01ec) {
    var_e6df16e26edacea = getdvarint(@"hash_2e92604af6208d28", 0);
    if (var_e6df16e26edacea != 0) {
        var_257077ad57a19a9b = 0;
        if (var_e6df16e26edacea == 1 || var_e6df16e26edacea == 3) {
            var_257077ad57a19a9b = var_257077ad57a19a9b + getdvarint(@"hash_d856d9dc9669c4f2", 100);
        }
        if (var_e6df16e26edacea == 2 || var_e6df16e26edacea == 3) {
            if (isdefined(var_5bebd2013b0f01ec.plundercount) && var_5bebd2013b0f01ec.plundercount > 0) {
                var_fb2196e070a5d84e = var_5bebd2013b0f01ec.plundercount;
                var_8b0211f6498a95b7 = getdvarfloat(@"hash_97e42d15f6dd7208", 0.2);
                var_257077ad57a19a9b = var_257077ad57a19a9b + int(var_fb2196e070a5d84e * var_8b0211f6498a95b7);
                var_a356a7a2d1d5b890 = int(var_fb2196e070a5d84e - var_fb2196e070a5d84e * var_8b0211f6498a95b7);
                var_5bebd2013b0f01ec namespace_c6ccccd95254983f::playersetplundercount(var_a356a7a2d1d5b890);
            }
        }
        lootid = level.br_pickups.var_7b2bff2d04ee1017["brloot_plunder_cash_uncommon_1"];
        if (isdefined(lootid)) {
            view_origin = interrogator getvieworigin();
            interrogator namespace_cb965d2f71fefddc::function_37be6e543436f3b3(lootid, view_origin, 1, var_257077ad57a19a9b);
        }
        interrogator namespace_c6ccccd95254983f::playerplunderpickup(var_257077ad57a19a9b);
        interrogator namespace_c6ccccd95254983f::function_5a2284274d70f7d(0, var_257077ad57a19a9b);
        var_3466c10973e9c476 = namespace_c6ccccd95254983f::getplundernamebyamount(var_257077ad57a19a9b);
        var_9d5bc8e32ee3635 = namespace_cb965d2f71fefddc::getcashsoundaliasforplayer(interrogator, var_3466c10973e9c476);
        playsoundatpos(var_5bebd2013b0f01ec.origin, var_9d5bc8e32ee3635);
    } else if (level.var_a9978096255cd8ed == 1) {
        if (isdefined(var_5bebd2013b0f01ec.plundercount) && var_5bebd2013b0f01ec.plundercount > 0) {
            var_fb2196e070a5d84e = var_5bebd2013b0f01ec.plundercount;
            var_8b0211f6498a95b7 = level.var_201395ee05e5c10d;
            var_6ca9968104a4e778 = int(var_fb2196e070a5d84e * var_8b0211f6498a95b7);
            var_a356a7a2d1d5b890 = var_fb2196e070a5d84e - var_6ca9968104a4e778;
            var_257077ad57a19a9b = interrogator.plundercount + var_6ca9968104a4e778;
            interrogator namespace_c6ccccd95254983f::playersetplundercount(var_257077ad57a19a9b);
            var_5bebd2013b0f01ec namespace_c6ccccd95254983f::playersetplundercount(var_a356a7a2d1d5b890);
        }
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c50
// Size: 0x149
function decayreviveprogress() {
    self.owner endon("last_stand_finished");
    self.owner endon("last_stand_heal_active");
    self.owner endon("disconnect");
    self endon("use_hold_revive_start");
    self endon("use_hold_interrogate_start");
    self endon("self_revive_start");
    self endon("death");
    level endon("game_ended");
    decayscale = level.laststandrevivedecayscale;
    /#
        if (!isusingmatchrulesdata()) {
            decayscale = getwatcheddvar("<unknown string>");
            if (!isdefined(decayscale)) {
                decayscale = getdvarfloat(@"hash_e0f04861824e8440", 0.5);
            }
        }
    #/
    if (decayscale <= 0) {
        return;
    }
    while (1) {
        self.curprogress = self.curprogress - level.frameduration * decayscale;
        /#
            if (istrue(self.owner.var_4ab61a57453e2816) && isdefined(self.owner.var_8fc34ee7d773b639)) {
                self.owner.var_8fc34ee7d773b639 = max(self.owner.var_8fc34ee7d773b639 - level.frameduration, 0);
            }
        #/
        if (self.curprogress <= 0) {
            self.curprogress = 0;
            return;
        }
        waitframe();
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7da0
// Size: 0x29
function function_1f761672c3708743() {
    if (getdvarint(@"hash_b12dfd71b2d623af", 0)) {
        decayreviveprogress();
    } else {
        self.curprogress = 0;
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7dd0
// Size: 0x545
function function_1b56d7c4fe15b79c(interrogator, victim) {
    level endon("game_ended");
    var_864c4c4116d403ea = interrogator.matchdatalifeindex;
    var_68fa2b6918f6e714 = victim.matchdatalifeindex;
    var_2c3d3f5969bf19b5 = getdvarfloat(@"hash_6acfbd4650e8691f", 300);
    var_4907bb8d6f92ac4d = getdvarfloat(@"hash_a8e0e2bf5a22916c", 5);
    var_74aab602082bb02b = int(var_4907bb8d6f92ac4d * 1000);
    var_8b226fa0a4438980 = 0;
    var_4f8e6f961392009f = gettime();
    var_4218a6a2df4a5555 = 99;
    var_6562c7c3c91a0c6a = 0;
    victimteam = victim.team;
    var_d33a0baa5624a4a = interrogator.team;
    var_26568fed2b866c11 = level.teamdata[victimteam]["players"];
    victimid = victim getuniqueid();
    var_4ec493e39340a7ce = interrogator getuniqueid();
    if (!isdefined(victimid)) {
        victimid = victim.clientid;
    }
    if (!isdefined(var_4ec493e39340a7ce)) {
        var_4ec493e39340a7ce = interrogator.clientid;
    }
    rewardtype = getdvarint(@"hash_3c56d9ef17112cdd", 3);
    if (rewardtype == 2) {
        victim.var_d2f1408e18d00988 = undefined;
    }
    wait(2);
    thread function_38526ff55909d928(interrogator, victim);
    foreach (player in var_26568fed2b866c11) {
        if (isdefined(player.plantedlethalequip)) {
            var_6562c7c3c91a0c6a = var_6562c7c3c91a0c6a + player.plantedlethalequip.size;
        }
    }
    function_7fac7bee548fbdd8(var_d33a0baa5624a4a, victimteam, victimid);
    var_f67d2e6165b4028a = 0;
    while (var_f67d2e6165b4028a == 0) {
        var_c3b838deb5a442d4 = 2;
        if (isdefined(interrogator) && isdefined(victim)) {
            var_c3b838deb5a442d4 = distance2d(interrogator.origin, victim.origin) / var_2c3d3f5969bf19b5;
        }
        switch (rewardtype) {
        case 1:
            var_f67d2e6165b4028a = function_8924785604554899(interrogator, victim);
            break;
        case 3:
            var_f67d2e6165b4028a = function_b4c6cb65b8221e77(interrogator, victim, var_4f8e6f961392009f + 2000);
            break;
        case 2:
            if (!isdefined(victim.laststanddowneddata) && !isdefined(victim.var_d2f1408e18d00988)) {
                victim.var_d2f1408e18d00988 = gettime();
            }
            var_f67d2e6165b4028a = function_59db0668402ef9d0(interrogator, victim);
            break;
        case 4:
            var_f67d2e6165b4028a = function_2916fc520c1ada8d(interrogator, victim, var_4f8e6f961392009f + 2000);
            break;
        case 0:
        default:
            var_f67d2e6165b4028a = function_d5bce40589690efb(interrogator, victim, var_c3b838deb5a442d4);
            break;
        }
        if (var_f67d2e6165b4028a) {
            interrogator notify("interrogation_signal_lost");
            function_8f5cf57cb69d0df5(var_d33a0baa5624a4a, victimteam, victimid);
            if (isdefined(victim) && isdefined(victim.laststandreviveent)) {
                victim.laststandreviveent.var_f1da02a134648443 = 3;
                victim.laststandreviveent function_4c452a6c72371f17();
            }
            break;
        }
        /#
            if (getdvarint(@"hash_2ae289b7c1cdeffe", 0)) {
                color = (0, 1, 0);
                if (var_c3b838deb5a442d4 > 0.7) {
                    color = (1, 0, 0);
                } else if (var_c3b838deb5a442d4 > 0.4) {
                    color = (1, 1, 0);
                }
                draw_circle(victim.origin, var_2c3d3f5969bf19b5, color, 1, 1, 1);
            }
        #/
        if (var_8b226fa0a4438980 + var_74aab602082bb02b < gettime()) {
            var_26568fed2b866c11 = array_removeundefined(var_26568fed2b866c11);
            foreach (player in var_26568fed2b866c11) {
                if (!isalive(player)) {
                    continue;
                }
                if (!player namespace_82dcd1d5ae30ff7::_hasperk("specialty_snapshot_immunity")) {
                    player thread function_da121b53657256c7(interrogator, var_4907bb8d6f92ac4d);
                    if (getdvarint(@"hash_a77cf11d23a937f4", 0) == 1) {
                        player thread function_f8b195391ced24fc(interrogator, var_4907bb8d6f92ac4d);
                    } else {
                        player thread function_980d4a9e760f8e0e(interrogator, var_4907bb8d6f92ac4d);
                    }
                    player function_8b6cb3c86797ead5(interrogator, var_4907bb8d6f92ac4d);
                } else {
                    interrogator namespace_e072c8407b2a861c::updatedamagefeedback("hittacresist");
                }
            }
            var_8b226fa0a4438980 = gettime();
        }
        waitframe();
    }
    var_126c5ba5e88a23b7 = int(gettime() - var_4f8e6f961392009f);
    namespace_bd0162aedd8c8594::function_b4e1d087442647ef(var_864c4c4116d403ea, var_68fa2b6918f6e714, var_26568fed2b866c11.size, int(var_6562c7c3c91a0c6a), var_126c5ba5e88a23b7, var_f67d2e6165b4028a);
    if (isdefined(interrogator)) {
        namespace_a011fbf6d93f25e5::function_3461c9a3dbbccecf(interrogator, var_126c5ba5e88a23b7, string(var_6562c7c3c91a0c6a));
    }
    if (isdefined(victim)) {
        namespace_a011fbf6d93f25e5::function_82b50d847253078f(victim, var_26568fed2b866c11.size);
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x831c
// Size: 0xc6
function function_38526ff55909d928(attacker, victim) {
    level endon("game_ended");
    if (!isdefined(victim)) {
        return;
    }
    var_29cd2ba60d64e75d = victim spawn_tag_origin();
    var_29cd2ba60d64e75d linkto(victim);
    var_29cd2ba60d64e75d show();
    waitframe();
    if (!isdefined(victim) || !isdefined(attacker)) {
        var_29cd2ba60d64e75d delete();
        return;
    }
    var_122194ceec0993a8 = level._effect["vfx_br_interr_in"];
    playfxontagforclients(var_122194ceec0993a8, var_29cd2ba60d64e75d, "tag_origin", attacker);
    playfxontagforclients(var_122194ceec0993a8, var_29cd2ba60d64e75d, "tag_origin", victim);
    waittill_any_ents(attacker, "interrogation_signal_lost", attacker, "death_or_disconnect", victim, "death_or_disconnect", victim, "last_stand_finished", victim, "enter_live_ragdoll");
    killfxontag(var_122194ceec0993a8, var_29cd2ba60d64e75d, "tag_origin");
    var_29cd2ba60d64e75d delete();
}

// Namespace laststand/namespace_10260b963310d30e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83e9
// Size: 0x16a
function function_7fac7bee548fbdd8(var_d33a0baa5624a4a, victimteam, var_22932bfdcf2af2d9) {
    var_26568fed2b866c11 = level.teamdata[victimteam]["players"];
    var_ccba29fa2a3a27ff = level.teamdata[var_d33a0baa5624a4a]["players"];
    foreach (player in var_26568fed2b866c11) {
        if (!isdefined(player.var_50a75a4bfa03a8e2)) {
            player.var_50a75a4bfa03a8e2 = [];
        }
        player.var_50a75a4bfa03a8e2 = function_6d6af8144a5131f1(player.var_50a75a4bfa03a8e2, var_22932bfdcf2af2d9);
        player setclientomnvar("ui_br_interrogate_team_is_being_tracked", 1);
    }
    foreach (player in var_ccba29fa2a3a27ff) {
        if (!isdefined(player.var_8d021ab39b012f9d)) {
            player.var_8d021ab39b012f9d = [];
        }
        player.var_8d021ab39b012f9d = function_6d6af8144a5131f1(player.var_8d021ab39b012f9d, var_22932bfdcf2af2d9);
        player setclientomnvar("ui_br_interrogate_tracking_other_team", 1);
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x855a
// Size: 0x1ac
function function_8f5cf57cb69d0df5(var_d33a0baa5624a4a, victimteam, var_22932bfdcf2af2d9) {
    var_26568fed2b866c11 = level.teamdata[victimteam]["players"];
    var_ccba29fa2a3a27ff = level.teamdata[var_d33a0baa5624a4a]["players"];
    foreach (player in var_26568fed2b866c11) {
        if (!isdefined(player.var_50a75a4bfa03a8e2)) {
            player.var_50a75a4bfa03a8e2 = [];
        }
        player.var_50a75a4bfa03a8e2 = array_remove(player.var_50a75a4bfa03a8e2, var_22932bfdcf2af2d9);
        if (player.var_50a75a4bfa03a8e2.size > 0) {
            player setclientomnvar("ui_br_interrogate_team_is_being_tracked", 1);
        } else {
            player setclientomnvar("ui_br_interrogate_team_is_being_tracked", 0);
        }
    }
    foreach (player in var_ccba29fa2a3a27ff) {
        if (!isdefined(player.var_8d021ab39b012f9d)) {
            player.var_8d021ab39b012f9d = [];
        }
        player.var_8d021ab39b012f9d = array_remove(player.var_8d021ab39b012f9d, var_22932bfdcf2af2d9);
        if (player.var_8d021ab39b012f9d.size > 0) {
            player setclientomnvar("ui_br_interrogate_tracking_other_team", 1);
        } else {
            player setclientomnvar("ui_br_interrogate_tracking_other_team", 0);
        }
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x870d
// Size: 0x5f
function function_d5bce40589690efb(interrogator, victim, var_c3b838deb5a442d4) {
    if (!isdefined(victim) || !isreallyalive(victim)) {
        return 1;
    }
    if (!isinlaststand(victim)) {
        return 2;
    }
    if (!isdefined(interrogator) || !isreallyalive(interrogator)) {
        return 3;
    }
    if (var_c3b838deb5a442d4 > 1) {
        return 4;
    }
    return 0;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8774
// Size: 0x4a
function function_8924785604554899(interrogator, victim) {
    if (!isdefined(interrogator) || !isreallyalive(interrogator)) {
        return 3;
    }
    if (!isinlaststand(victim)) {
        return 2;
    }
    if (!isdefined(victim) || !isreallyalive(victim)) {
        return 1;
    }
    return 0;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87c6
// Size: 0xac
function function_59db0668402ef9d0(interrogator, victim) {
    if (!isdefined(interrogator) || !isreallyalive(interrogator)) {
        return 3;
    }
    var_3de93940b47adab4 = 0;
    if (isdefined(victim.var_d2f1408e18d00988)) {
        duration = int(getdvarint(@"hash_c1469be98181753d", 15) * 1000);
        var_3de93940b47adab4 = gettime() > victim.var_d2f1408e18d00988 + duration;
    }
    if (!isinlaststand(victim) && var_3de93940b47adab4) {
        return 2;
    }
    if ((!isdefined(victim) || !isreallyalive(victim)) && var_3de93940b47adab4) {
        return 1;
    }
    return 0;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x887a
// Size: 0x98
function function_b4c6cb65b8221e77(interrogator, victim, starttime) {
    if (!isdefined(interrogator) || !isreallyalive(interrogator)) {
        return 3;
    }
    duration = int(getdvarint(@"hash_c1469be98181753d", 15) * 1000);
    var_3de93940b47adab4 = gettime() > starttime + duration;
    if (!isinlaststand(victim) && var_3de93940b47adab4) {
        return 2;
    }
    if ((!isdefined(victim) || !isreallyalive(victim)) && var_3de93940b47adab4) {
        return 1;
    }
    return 0;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x891a
// Size: 0x67
function function_2916fc520c1ada8d(interrogator, victim, starttime) {
    if (!isdefined(interrogator) || !isreallyalive(interrogator)) {
        return 3;
    }
    duration = int(getdvarint(@"hash_c1469be98181753d", 15) * 1000);
    if (gettime() > starttime + duration) {
        return 4;
    }
    return 0;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8989
// Size: 0x192
function function_f671d7efef879a1(attacker, victim) {
    /#
        if (getdvarint(@"hash_53c1b57d852a5efc", 0)) {
            return 5;
        }
        if (getdvarint(@"hash_985260dbcc2b00f8", 0)) {
            return 0;
        }
    #/
    if (attacker isswimming() || victim isswimming()) {
        return 4;
    }
    var_f22d5402740e9b35 = attacker getmovingplatformparent();
    var_7e63b8c286d4794e = victim getmovingplatformparent();
    if (isdefined(var_f22d5402740e9b35) || isdefined(var_7e63b8c286d4794e)) {
        return 2;
    }
    if (abs(attacker.origin[2] - victim.origin[2]) > 30) {
        return 1;
    }
    dir = function_16f1ed28a559f91f(attacker, victim);
    var_c0014262498c3f37 = function_341c7024a3e54638(dir, victim, attacker);
    var_439ae466e036ac7d = var_c0014262498c3f37[3];
    var_93e84816600b6f9b = var_c0014262498c3f37[2];
    var_67d8ddf901f65b1d = var_c0014262498c3f37[1];
    var_691d365a2045e893 = var_c0014262498c3f37[0];
    var_86c1c8628b1d55f8 = victim.origin + var_691d365a2045e893;
    var_67d8ddf901f65b1d = (0, var_67d8ddf901f65b1d[1], 0);
    ignoreents = [0:attacker, 1:victim];
    if (!attacker namespace_2a184fc4902783dc::player_trace_passed(attacker.origin + (0, 0, 10), var_86c1c8628b1d55f8 + (0, 0, 10), var_67d8ddf901f65b1d, ignoreents)) {
        return 0;
    }
    return 5;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8b23
// Size: 0x1bb
function function_a5c6dc149afb51c9(interrogator, outlinetime) {
    self endon("disconnect");
    level endon("game_ended");
    victim = self;
    if (isplayer(victim)) {
        if (isdefined(victim.painted) && victim.painted == 1) {
            return;
        }
        var_5283d6ed761e8022 = 2000;
        if (istrue(victim.var_89e94d8f0846d342)) {
            var_5283d6ed761e8022 = 500;
        }
        if (!isdefined(outlinetime)) {
            outlinetime = 5;
        }
        victim.painted = 1;
        var_1f6df6fd9a4a3ea0 = 0;
        while (var_1f6df6fd9a4a3ea0 < level.var_3908273e5522e91d) {
            if (!level.teambased) {
                id = namespace_cbd3754a0c69cc63::outlineenableforplayer(victim, interrogator, "outlinefill_nodepth_red", "equipment");
            } else if (namespace_ca7b90256548aa40::shouldmodesetsquads()) {
                id = namespace_cbd3754a0c69cc63::outlineenableforsquad(victim, interrogator.team, interrogator.var_ff97225579de16a, "outlinefill_nodepth_red", "equipment");
            } else {
                id = namespace_cbd3754a0c69cc63::outlineenableforteam(victim, interrogator.team, "outlinefill_nodepth_red", "equipment");
            }
            triggerportableradarpingteam(victim.origin, interrogator.team, level.var_575cb25b5d41b53, int(var_5283d6ed761e8022));
            victim iprintlnbold("You are compromised!");
            result = victim waittill_any_timeout_1(outlinetime, "death");
            if (result == "death") {
                namespace_cbd3754a0c69cc63::outlinedisable(id, victim);
                victim.painted = 0;
                return;
            }
            namespace_cbd3754a0c69cc63::outlinedisable(id, victim);
            var_1f6df6fd9a4a3ea0++;
            wait(1);
        }
        victim.painted = 0;
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ce5
// Size: 0x106
function function_da121b53657256c7(interrogator, var_b6b08a6a6f96b5c4) {
    victim = self;
    if (isplayer(victim)) {
        if (isdefined(victim.painted) && victim.painted == 1) {
            return;
        }
        var_5283d6ed761e8022 = var_b6b08a6a6f96b5c4 * 1000;
        radartype = getdvarint(@"hash_de39bef0e704c70b", 1);
        if (radartype == 0) {
            return;
        }
        switch (radartype) {
        case 3:
            break;
        case 2:
            var_5283d6ed761e8022 = int(var_5283d6ed761e8022 * 0.75);
            break;
        case 1:
        default:
            var_5283d6ed761e8022 = int(var_5283d6ed761e8022 * 0.25);
            break;
        }
        triggerportableradarpingteam(victim.origin, interrogator.team, level.var_575cb25b5d41b53, int(var_5283d6ed761e8022));
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8df2
// Size: 0x126
function function_f8b195391ced24fc(interrogator, waittime) {
    victim = self;
    if (!isdefined(victim)) {
        return;
    }
    if (isplayer(victim)) {
        if (isdefined(victim.var_8ab4c2fc351eeff8) && victim.var_8ab4c2fc351eeff8 == 1) {
            return;
        }
        victim.var_9283bb519d50dcf5 = 1;
        var_78fe05bbd455392e = getdvarint(@"hash_cc42e9e3eb814f82", 1);
        if (var_78fe05bbd455392e == 0) {
            return;
        }
        if (!isdefined(waittime)) {
            waittime = 2.5;
        }
        switch (var_78fe05bbd455392e) {
        case 3:
            break;
        case 2:
            waittime = waittime * 0.75;
            break;
        case 1:
        default:
            waittime = waittime * 0.25;
            break;
        }
        icon = victim thread namespace_7bdde15c3500a23f::setheadicon_singleimage(interrogator.team, "hud_icon_new_marked", 8, 1, 5000, 500, undefined, 1, 1);
        victim namespace_893ac0cf28c5af44::function_fa08d1d78cf5cb01();
        victim thread function_80dc9867bc1b31f8(icon, waittime);
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f1f
// Size: 0x41
function function_80dc9867bc1b31f8(icon, waittime) {
    level endon("game_ended");
    self endon("disconnect");
    waittill_notify_or_timeout("death", waittime);
    namespace_7bdde15c3500a23f::setheadicon_deleteicon(icon);
    self.var_8ab4c2fc351eeff8 = 0;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f67
// Size: 0x18b
function function_980d4a9e760f8e0e(interrogator, outlinetime) {
    victim = self;
    if (!isdefined(victim)) {
        return;
    }
    if (isplayer(victim)) {
        if (isdefined(victim.painted) && victim.painted == 1) {
            return;
        }
        var_78fe05bbd455392e = getdvarint(@"hash_cc42e9e3eb814f82", 1);
        if (var_78fe05bbd455392e == 0) {
            return;
        }
        if (!isdefined(outlinetime)) {
            outlinetime = 2.5;
        }
        switch (var_78fe05bbd455392e) {
        case 3:
            break;
        case 2:
            outlinetime = outlinetime * 0.75;
            break;
        case 1:
        default:
            outlinetime = outlinetime * 0.25;
            break;
        }
        victim.painted = 1;
        if (!level.teambased) {
            id = namespace_cbd3754a0c69cc63::outlineenableforplayer(victim, interrogator, "outlinefill_nodepth_orange", "equipment");
        } else if (namespace_ca7b90256548aa40::shouldmodesetsquads()) {
            id = namespace_cbd3754a0c69cc63::outlineenableforsquad(victim, interrogator.team, interrogator.var_ff97225579de16a, "outlinefill_nodepth_orange", "equipment");
        } else {
            id = namespace_cbd3754a0c69cc63::outlineenableforteam(victim, interrogator.team, "outlinefill_nodepth_orange", "equipment");
        }
        victim namespace_cbd3754a0c69cc63::_hudoutlineviewmodelenable("outlinefill_nodepth_orange", 0);
        victim namespace_893ac0cf28c5af44::function_fa08d1d78cf5cb01();
        victim thread watchpainted(id, outlinetime);
        victim thread watchpaintedagain(id);
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90f9
// Size: 0x13f
function function_8b6cb3c86797ead5(interrogator, outlinetime) {
    victim = self;
    if (isplayer(victim)) {
        if (!isdefined(outlinetime)) {
            outlinetime = 5;
        }
        if (!isdefined(victim.plantedlethalequip) || victim.plantedlethalequip.size == 0) {
            return;
        }
        foreach (equipment in array_removeundefined(victim.plantedlethalequip)) {
            if (!level.teambased) {
                var_f275474aacd30c96 = namespace_cbd3754a0c69cc63::outlineenableforplayer(equipment, interrogator, "outlinefill_nodepth_orange", "equipment");
            } else if (namespace_ca7b90256548aa40::shouldmodesetsquads()) {
                var_f275474aacd30c96 = namespace_cbd3754a0c69cc63::outlineenableforsquad(equipment, interrogator.team, interrogator.var_ff97225579de16a, "outlinefill_nodepth_orange", "equipment");
            } else {
                var_f275474aacd30c96 = namespace_cbd3754a0c69cc63::outlineenableforteam(equipment, interrogator.team, "outlinefill_nodepth_orange", "equipment");
            }
            equipment thread watchpainted(var_f275474aacd30c96, outlinetime);
            equipment thread watchpaintedagain(var_f275474aacd30c96);
        }
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x923f
// Size: 0x74
function watchpainted(id, timeout) {
    self notify("painted_again");
    self endon("painted_again");
    self endon("disconnect");
    level endon("game_ended");
    waittill_any_timeout_1(timeout, "death");
    namespace_cbd3754a0c69cc63::outlinedisable(id, self);
    if (isdefined(self) && isplayer(self)) {
        self.painted = 0;
        namespace_cbd3754a0c69cc63::_hudoutlineviewmodeldisable();
    }
    if (isdefined(self)) {
        self notify("painted_end");
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92ba
// Size: 0x34
function watchpaintedagain(id) {
    self endon("disconnect");
    level endon("game_ended");
    waittill_any_2("painted_again", "painted_end");
    namespace_cbd3754a0c69cc63::outlinedisable(id, self);
}

// Namespace laststand/namespace_10260b963310d30e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92f5
// Size: 0x2cf
function useholdthink(reviver, usetime, interrogation) {
    self.owner endon("last_stand_finished");
    reviver endon("death");
    level endon("game_ended");
    if (!isdefined(interrogation)) {
        interrogation = 0;
    }
    self.var_4af51e13229c40fe = reviver;
    revivee = self.owner;
    var_6a1154c8bc126a40 = getdvarint(@"hash_c959af6f995bf79a");
    var_93da003f4f870af4 = spawn("script_origin", self.origin);
    var_93da003f4f870af4 hide();
    if (!var_6a1154c8bc126a40 && !self.owner namespace_833bd5cc623ca701::function_f0d1c9c39359efff()) {
        reviver val::function_3633b947164be4f3("laststand_revive", 0);
    }
    if (istrue(interrogation)) {
        self notify("use_hold_interrogate_start");
    } else {
        self notify("use_hold_revive_start");
    }
    if (!self.owner namespace_833bd5cc623ca701::function_f0d1c9c39359efff() && !interrogation) {
        reviver thread sfx_revive_lp();
    }
    if (var_6a1154c8bc126a40) {
        dragallyprototype(reviver, revivee);
    }
    if (!isdefined(self.curprogress) || isdefined(self.var_d50d5a16df84df44)) {
        self.curprogress = 0;
    }
    self.var_d50d5a16df84df44 = undefined;
    self.inuse = 1;
    self.userate = 0;
    var_391186b6dae520cc = 0;
    if (isdefined(usetime)) {
        self.usetime = usetime;
    }
    if (!interrogation) {
        if (isdefined(revivee.var_c101ccd3d5f8bd81)) {
            self.usetime = revivee.var_c101ccd3d5f8bd81 * 1000;
        } else if (reviver _hasperk("specialty_medic")) {
            self.usetime = getwatcheddvar("lastStandReviveTimer") * 1000 * getdvarfloat(@"hash_6f08a22fd52e004c");
        } else {
            self.usetime = getwatcheddvar("lastStandReviveTimer") * 1000;
        }
        if (isdefined(reviver.var_1f8a2a7d3f537)) {
            self.usetime = self.usetime * reviver.var_1f8a2a7d3f537;
        } else if (namespace_36f464722d326bbe::isBRStyleGameType() && reviver _hasperk("specialty_br_faster_revive")) {
            self.usetime = self.usetime * 0.75;
        }
    } else {
        self.usetime = getdvarfloat(@"hash_ddbf6f11fc2231f2", 3) * 1000;
    }
    if (!interrogation) {
        if (revivee.team == reviver.team) {
            level thread namespace_25c5a6f43bb97b43::trysaylocalsound(reviver, #"hash_572347275dfb41ab");
        } else {
            level thread namespace_25c5a6f43bb97b43::trysaylocalsound(reviver, #"hash_e716d32302942aaa");
        }
    }
    thread useholdthinkcleanup(reviver, var_93da003f4f870af4, interrogation);
    thread useholdthinkloop(reviver);
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95cb
// Size: 0x4c
function dragallyprototype(reviver, revivee) {
    revivetrigger = self;
    revivee playerlinkto(reviver);
    revivee playerlinkedoffsetenable();
    revivee allowmovement(0);
    reviver setmovespeedscale(getdvarfloat(@"hash_ccfb1fe297ce6f9b"));
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x961e
// Size: 0x2d
function cleanupdragallyprototype(reviver, revivee) {
    revivee unlink();
    revivee allowmovement(1);
    reviver setmovespeedscale(1);
}

// Namespace laststand/namespace_10260b963310d30e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9652
// Size: 0x2de
function useholdthinkcleanup(reviver, var_93da003f4f870af4, interrogation) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    if (!isdefined(interrogation)) {
        interrogation = 0;
    }
    var_6a1154c8bc126a40 = getdvarint(@"hash_c959af6f995bf79a");
    revivee = self.owner;
    var_4930cbce302555b1 = revivee waittill_any_return_no_endon_death_4("death_or_disconnect", "use_hold_think_success", "use_hold_think_fail", "last_stand_finished");
    /#
        if (getdvarint(@"hash_8961da4992114762", 0) != 0 && interrogation && var_4930cbce302555b1 == "<unknown string>") {
            var_4930cbce302555b1 = "<unknown string>";
        }
    #/
    var_888761054df5b48c = reviver namespace_1fbd40990ee60ede::function_2e8745a2d6ec9fd1();
    if (isdefined(var_888761054df5b48c)) {
        level thread namespace_1f188a13f7e79610::vehicle_preventplayercollisiondamagefortimeafterexit(var_888761054df5b48c, reviver);
    }
    self.inuse = 0;
    var_93da003f4f870af4 delete();
    if (isdefined(reviver)) {
        reviver namespace_7db13bdf599e41a6::function_a3ffe1d08888c2();
        reviver buddyrevivingdoneanimevent();
        reviver setlaststandreviving(0);
        if (istrue(interrogation)) {
            reviver.var_93018d510a589832 = 0;
            if (isdefined(revivee)) {
                revivee.var_895c1aaac16f7256 = 0;
            }
        } else {
            reviver namespace_1d863a7bbc05fc52::function_42d99e200aa9762a(revivee);
        }
        reviver namespace_19b4203b51d56488::updateuiprogress(self, 0);
        if (reviver function_c6cb3e654225077a()) {
            reviver forceusehintoff();
        }
        reviver notify("sfx_revive_done");
    }
    if (isdefined(revivee)) {
        revivee namespace_19b4203b51d56488::updateuiprogress(self, 0);
    }
    if (isreallyalive(reviver)) {
        if (var_6a1154c8bc126a40) {
            cleanupdragallyprototype(reviver, revivee);
        } else {
            reviver val::function_588f2307a3040610("laststand_revive");
        }
    }
    if (var_4930cbce302555b1 == "use_hold_think_success") {
        if (istrue(interrogation)) {
            reviver thread doScoreEvent(#"interrogation");
        } else if (reviver.team == self.owner.team) {
            reviver thread doScoreEvent(#"reviver");
        }
        if (istrue(level.allowselfrevive)) {
            reviver allowselfrevive(1);
        }
        if (!namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
            if (!istrue(interrogation)) {
                if (revivee.team == reviver.team) {
                    revivee thread namespace_62c556437da28f50::scoreeventpopup(#"revived");
                }
            }
        }
        if (istrue(interrogation)) {
            self.var_d50d5a16df84df44 = 1;
            self notify("use_hold_interrogate_success");
        } else {
            if (isdefined(revivee)) {
                revivee thread namespace_44abc05161e2e2cb::showsplash("revived", undefined, reviver);
                revivee.inlaststand = 0;
            }
            self notify("use_hold_revive_success");
        }
        return;
    } else if (var_4930cbce302555b1 == "use_hold_think_fail") {
        if (isdefined(revivee)) {
            revivee notify("handle_revive_message");
        }
    }
    if (istrue(interrogation)) {
        self notify("use_hold_interrogate_fail");
    } else {
        self notify("use_hold_revive_fail");
    }
    if (isdefined(reviver)) {
        reviver.var_a23f35f8460d8857 = undefined;
    }
    if (isdefined(revivee)) {
        revivee.var_a23f35f8460d8857 = undefined;
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9937
// Size: 0x6e
function sfx_revive_lp() {
    var_4cf58793cc4f1ad6 = spawn("script_origin", self.origin);
    var_4cf58793cc4f1ad6 linkto(self);
    var_4cf58793cc4f1ad6 playloopsound("br_reviver_use_lp");
    waittill_any_2("sfx_revive_done", "disconnect");
    if (isdefined(self.origin)) {
        playsoundatpos(self.origin, "br_reviver_use_end");
    }
    var_4cf58793cc4f1ad6 delete();
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x99ac
// Size: 0x1ce
function useholdthinkloop(reviver) {
    revivee = self.owner;
    level endon("game_ended");
    revivee endon("death_or_disconnect");
    revivee endon("last_stand_finished");
    var_e2c5c56bb79de4b = getdvarint(@"hash_a23e8f787d85f762", 0);
    mintime = getdvarint(@"hash_15e9b25b07a2bbb6", 0.5) * 1000 + gettime();
    var_91c8d5414cb0cd50 = 0;
    while (function_452247e0ceec0a3b(reviver, revivee, mintime, var_e2c5c56bb79de4b)) {
        /#
            reviver notify("<unknown string>");
        #/
        if (istrue(reviver.tacopsmedicrole)) {
            return isreallyalive(reviver);
        }
        self.curprogress = self.curprogress + level.frameduration * self.userate;
        self.userate = 1;
        reviver namespace_19b4203b51d56488::updateuiprogress(self, 1);
        if (self.curprogress >= self.usetime) {
            revivee notify("use_hold_think_success");
            return;
        }
        /#
            if (istrue(revivee.var_4ab61a57453e2816)) {
                if (!isdefined(revivee.var_8fc34ee7d773b639)) {
                    revivee.var_8fc34ee7d773b639 = 0;
                }
                revivee.var_8fc34ee7d773b639 = revivee.var_8fc34ee7d773b639 + level.frameduration;
            }
            var_91c8d5414cb0cd50 = var_91c8d5414cb0cd50 + level.framedurationseconds;
            var_22260ab682bcc081 = getdvarint(@"hash_f1bef8e461ed63f", 0);
            if (var_22260ab682bcc081 > 0) {
                if (var_91c8d5414cb0cd50 >= var_22260ab682bcc081) {
                    revivee dodamage(revivee.maxhealth, revivee.origin, reviver, reviver, "<unknown string>", makeweapon("<unknown string>"), "<unknown string>");
                }
            }
        #/
        waitframe();
    }
    revivee notify("use_hold_think_fail");
}

// Namespace laststand/namespace_10260b963310d30e
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b82
// Size: 0x108
function function_452247e0ceec0a3b(reviver, revivee, mintime, var_e2c5c56bb79de4b) {
    if (!isreallyalive(reviver)) {
        return 0;
    }
    if (self.curprogress >= self.usetime) {
        return 0;
    }
    if (istrue(reviver.inlaststand)) {
        return 0;
    }
    if (istrue(reviver.extracted) || istrue(revivee.extracted)) {
        return 0;
    }
    if (!reviver function_f111048fabf84e37(revivee) && !istrue(var_e2c5c56bb79de4b) && !(gettime() < mintime)) {
        return 0;
    }
    if (distancesquared(reviver.origin, self.origin) > 65536 && !revivee namespace_833bd5cc623ca701::function_f0d1c9c39359efff()) {
        return 0;
    }
    if (istrue(reviver.var_12bfb031c0a0efd8)) {
        return 0;
    }
    if (istrue(reviver isinexecutionvictim())) {
        return 0;
    }
    if (istrue(reviver.var_a23f35f8460d8857) || istrue(revivee.var_a23f35f8460d8857)) {
        return 0;
    }
    return 1;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c92
// Size: 0x2c7
function suicidesetup() {
    self endon("death_or_disconnect");
    self endon("last_stand_finished");
    level endon("game_ended");
    thread showsuicidehintstring();
    var_7831c27971ffde60 = getdvarint(@"hash_45dbdc45bdf8f5ff", 0);
    var_3cbcaf4eda0f3704 = getdvarfloat(@"hash_f36ad71f9fadec59", 300);
    /#
        level.var_ccf76d87061de768 = getdvarfloat(@"hash_9f647aa84d08a764", 3);
    #/
    if (!isbot(self)) {
        thread suicidemonitorcrouchbuttonpress();
    }
    holdtime = 0;
    var_58d906af2cac1064 = level.var_21bc3423c7e17c34;
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        var_58d906af2cac1064 = level.var_84f71f417b53242e;
        if (function_2a3c9a91bf1d3911()) {
            var_58d906af2cac1064 = level.var_ccf76d87061de768;
        }
    }
    while (1) {
        waitframe();
        if (self stancebuttonpressed() && self isinexecutionvictim() == 0 && !self getbeingrevived() && !selfrevivebuttonpressed(self) && !function_77799f0211be1728()) {
            if (function_2a3c9a91bf1d3911()) {
                if (isdefined(self.laststandreviveent)) {
                    if (istrue(self.laststandreviveent.var_9d797a762d9195eb)) {
                        holdtime = 0;
                        self setclientomnvar("ui_securing", 0);
                        self setclientomnvar("ui_securing_progress", 0);
                        namespace_44abc05161e2e2cb::showerrormessage("MP_BR_INGAME/INTERROGATION_IN_PROGRESS");
                        wait(0.5);
                        continue;
                    }
                }
                if (var_7831c27971ffde60) {
                    players = getplayersinradius(self.origin, var_3cbcaf4eda0f3704);
                    foreach (player in players) {
                        if (player.team != self.team) {
                            self iprintlnbold("There are enemies near by...");
                            holdtime = 0;
                            if (!selfrevivebuttonpressed(self) && !function_77799f0211be1728()) {
                                self setclientomnvar("ui_securing", 0);
                                self setclientomnvar("ui_securing_progress", 0);
                            }
                            wait(0.5);
                            break;
                        }
                    }
                }
            }
            self setclientomnvar("ui_securing", 20);
            if (holdtime >= var_58d906af2cac1064) {
                self setclientomnvar("ui_securing", 0);
                self setclientomnvar("ui_securing_progress", 0);
                break;
            }
            var_5d3a428e1f92c6ba = holdtime / var_58d906af2cac1064;
            self setclientomnvar("ui_securing_progress", var_5d3a428e1f92c6ba);
            holdtime = holdtime + level.framedurationseconds;
        } else {
            holdtime = 0;
            if (!selfrevivebuttonpressed(self) && !istrue(self.beingrevived) && !function_77799f0211be1728()) {
                self setclientomnvar("ui_securing", 0);
            }
        }
    }
    suicideonend();
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f60
// Size: 0x96
function function_d9324dc2bceedf27(var_4ce97d438a53f1d5) {
    self endon("death_or_disconnect");
    self endon("stance_pressed_up");
    self endon("endGivUpProgressBar");
    level endon("game_ended");
    self setclientomnvar("ui_securing", 20);
    progress = 0;
    while (1) {
        if (progress >= var_4ce97d438a53f1d5) {
            break;
        }
        var_5d3a428e1f92c6ba = progress / var_4ce97d438a53f1d5;
        self setclientomnvar("ui_securing_progress", var_5d3a428e1f92c6ba);
        progress = progress + level.frameduration;
        waitframe();
    }
    self setclientomnvar("ui_securing", 0);
    self setclientomnvar("ui_securing_progress", 0);
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ffd
// Size: 0x1d5
function suicidemonitorcrouchbuttonpress() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    self notifyonplayercommand("stance_pressed_down", "+movedown");
    self notifyonplayercommand("stance_pressed_up", "-movedown");
    self notifyonplayercommand("stance_pressed_down", "+stancedown");
    self notifyonplayercommand("stance_pressed_up", "-stancedown");
    holdtime = gettime();
    var_95e94c34040bc5ad = 0;
    var_51bee2f5b3b4e278 = 0;
    if (function_2a3c9a91bf1d3911()) {
        var_58d906af2cac1064 = level.var_ccf76d87061de768;
    } else {
        var_58d906af2cac1064 = level.var_21bc3423c7e17c34;
    }
    var_4ce97d438a53f1d5 = var_58d906af2cac1064 * 1000;
    var_9a87080fb741de0c = 0;
    while (!var_9a87080fb741de0c && !var_95e94c34040bc5ad) {
        var_95e94c34040bc5ad = 0;
        if (!var_51bee2f5b3b4e278) {
            holdtime = gettime();
        }
        ret = waittill_any_timeout_5(var_58d906af2cac1064, "stance_pressed_down", "stance_pressed_up", "last_stand_finished", "last_stand_self_revive", "last_stand_bleedout");
        switch (ret) {
        case #"hash_9b3673b33c822e31":
            holdtime = gettime();
            var_51bee2f5b3b4e278 = 1;
            thread function_d9324dc2bceedf27(var_4ce97d438a53f1d5);
            break;
        case #"hash_f0a7edb65e311d04":
            var_51bee2f5b3b4e278 = 0;
        case #"hash_d4dde12b38318c68":
            if (var_51bee2f5b3b4e278 && gettime() - holdtime >= var_4ce97d438a53f1d5) {
                self notify("endGiveUpProgressBar");
                var_95e94c34040bc5ad = 1;
            }
            break;
        default:
            var_9a87080fb741de0c = 1;
            break;
        }
        waitframe();
    }
    if (var_95e94c34040bc5ad) {
        suicideonend();
    }
    self notifyonplayercommandremove("stance_pressed_down", "+movedown");
    self notifyonplayercommandremove("stance_pressed_up", "-movedown");
    self notifyonplayercommandremove("stance_pressed_down", "+stancedown");
    self notifyonplayercommandremove("stance_pressed_up", "-stancedown");
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa1d9
// Size: 0x23
function suicideonend() {
    if (istrue(self.allowselfrevive)) {
        self notify("last_stand_self_revive");
    } else {
        self notify("last_stand_bleedout");
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa203
// Size: 0x62
function showsuicidehintstring() {
    if (istrue(self.allowselfrevive)) {
        self forceusehinton("MP/HEROES_RETURN");
    } else if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
        thread handlerevivemessage();
    }
    waittill_any_ents(self, "death_or_disconnect", self, "last_stand_finished", level, "game_ended");
    if (!isdefined(self)) {
        return;
    }
    setlowermessageomnvar("clear_lower_msg");
    self forceusehintoff();
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa26c
// Size: 0x2a7
function handlerevivemessage() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("last_stand_finished");
    while (1) {
        setlowermessageomnvar("clear_lower_msg");
        var_649e600e12376e07 = 0;
        var_5237a188ccda4d7b = namespace_85d036cb78063c4a::getcurrentsuperref();
        if (isdefined(var_5237a188ccda4d7b) && var_5237a188ccda4d7b == "super_laststand_heal" && namespace_85d036cb78063c4a::issuperready()) {
            var_649e600e12376e07 = 1;
        }
        if (istrue(getbeingrevivedinternal())) {
            setlowermessageomnvar("being_revived");
        } else if (istrue(self.laststandhealisactive)) {
            setlowermessageomnvar("reviving_self");
        } else if (isdefined(self.timeuntilbleedout)) {
            if (var_649e600e12376e07) {
                setlowermessageomnvar("self_revive", int(gettime() + self.timeuntilbleedout * 1000));
            } else if (getgametype() != "dm") {
                if (self.pers["lives"] == 0 && isteamreviveenabled()) {
                    setlowermessageomnvar("spawn_revive_wait", int(gettime() + self.timeuntilbleedout * 1000));
                } else if (_hasperk("specialty_survivor")) {
                    setlowermessageomnvar("survivor_revive", int(gettime() + self.timeuntilbleedout * 1000));
                } else {
                    setlowermessageomnvar("revive_or_respawn", int(gettime() + self.timeuntilbleedout * 1000));
                }
            } else if (_hasperk("specialty_survivor")) {
                setlowermessageomnvar("survivor_revive", int(gettime() + self.timeuntilbleedout * 1000));
            } else {
                setlowermessageomnvar("ffa_down_give_up", int(gettime() + self.timeuntilbleedout * 1000));
            }
        } else if (var_649e600e12376e07) {
            setlowermessageomnvar("self_revive");
        } else if (self.pers["lives"] == 0 && isteamreviveenabled()) {
            setlowermessageomnvar("spawn_revive_wait");
        } else if (_hasperk("specialty_survivor")) {
            setlowermessageomnvar("survivor_revive", int(gettime() + self.timeuntilbleedout * 1000));
        } else {
            setlowermessageomnvar("revive_or_respawn");
        }
        while (1) {
            var_4930cbce302555b1 = waittill_any_return_no_endon_death_2("super_ready", "handle_revive_message");
            if (var_4930cbce302555b1 == "super_ready" && namespace_85d036cb78063c4a::getcurrentsuperref() != "super_laststand_heal") {
                continue;
            } else {
                break;
            }
        }
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa51a
// Size: 0x88
function bleedoutthink() {
    self endon("death_or_disconnect");
    self endon("last_stand_finished");
    self endon("last_stand_heal_active");
    level endon("game_ended");
    timeleft = self.timeuntilbleedout;
    if (timeleft != 0) {
        while (1) {
            waitframe();
            if (self isinexecutionvictim()) {
                continue;
            }
            if (!istrue(getbeingrevivedinternal())) {
                timeleft = timeleft - level.framedurationseconds;
            }
            if (timeleft <= level.framedurationseconds) {
                self notify("last_stand_bleedout");
                break;
            }
            self.timeuntilbleedout = timeleft;
        }
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa5a9
// Size: 0xba
function addoverheadicon() {
    showto = self.team;
    image = "hud_realism_head_revive";
    offset = 25;
    var_e0e11f3b4551be11 = 1;
    var_c5409ca7522182b3 = 1280;
    var_30516b4afd1763de = 250;
    delaytime = undefined;
    var_fa4cf28a58192889 = undefined;
    var_b3ea37733a1577e5 = 0;
    var_7591ed99e87a77d3 = undefined;
    showonminimap = 0;
    image = namespace_7bdde15c3500a23f::setheadicon_singleimage(showto, image, offset, var_e0e11f3b4551be11, var_c5409ca7522182b3, var_30516b4afd1763de, delaytime, var_fa4cf28a58192889, var_b3ea37733a1577e5, var_7591ed99e87a77d3, showonminimap);
    thread cleanupoverheadicon(image);
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa66a
// Size: 0x25
function cleanupoverheadicon(image) {
    waittill_any_2("death_or_disconnect", "last_stand_finished");
    namespace_7bdde15c3500a23f::setheadicon_deleteicon(image);
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa696
// Size: 0xbc
function showwaverespawnmessage() {
    wavebased = getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_waverespawndelay")) > 0;
    if (!wavebased) {
        return;
    }
    self endon("last_stand_finished");
    while (1) {
        self.respawntimerstarttime = gettime();
        wavebased = getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_waverespawndelay")) > 0;
        if (wavebased) {
            timeuntilspawn = namespace_99ac021a7547cae3::timeuntilwavespawn(0);
            setlowermessageomnvar("next_team_spawn", int(gettime() + timeuntilspawn * 1000));
            wait(timeuntilspawn);
            setlowermessageomnvar("clear_lower_msg");
        }
        wait(2);
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa759
// Size: 0x23
function allowselfrevive(allow) {
    self.allowselfrevive = allow;
    self setclientomnvar("ui_self_revive", allow);
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa783
// Size: 0x53
function laststandmonitor() {
    level endon("game_ended");
    if (istrue(level.laststandkillteamifdowndisable)) {
        return;
    }
    while (1) {
        level waittill("last_stand_enter_finished");
        if (getgametypenumlives() == 0 && !istrue(level.disablespawning)) {
            continue;
        }
        wait(0.6);
        level thread laststandkillteamifdown();
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa7dd
// Size: 0x172
function laststandkillteamifdown() {
    foreach (entry in level.teamnamelist) {
        livesremaining = namespace_54d20dd0dd79277f::getteamdata(entry, "livesCount");
        if (livesremaining != 0) {
            continue;
        }
        var_e2b2bbd9e6539f11 = getfriendlyplayers(entry, 1);
        var_2d2abb649737b34e = [];
        foreach (player in var_e2b2bbd9e6539f11) {
            if (istrue(player.inlaststand) && !istrue(function_311066dfee085643(player)) && !istrue(player _hasperk("specialty_survivor"))) {
                var_2d2abb649737b34e[var_2d2abb649737b34e.size] = player;
            }
        }
        if (var_2d2abb649737b34e.size > 0 && var_e2b2bbd9e6539f11.size <= var_2d2abb649737b34e.size) {
            level.laststandrequiresmelee = 0;
            foreach (player in var_2d2abb649737b34e) {
                if (!isdefined(player)) {
                    continue;
                }
                player notify("last_stand_bleedout");
            }
        }
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa956
// Size: 0x9c
function getclassiclaststandpistol() {
    weaponlist = self getweaponslistprimaries();
    foreach (weapon in weaponlist) {
        class = weaponclass(weapon);
        if (weaponclass(weapon) == "pistol") {
            return weapon;
        }
    }
    weapon = namespace_e0ee43ef2dddadaa::buildweapon(namespace_e0ee43ef2dddadaa::getweaponrootname("iw8_pi_golf21_mp"), [], "none", "none", -1);
    return weapon;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa9fa
// Size: 0x91
function makelaststandinvuln() {
    lastStandInvulnTimer = level.laststandinvulntime;
    /#
        if (!isusingmatchrulesdata()) {
            lastStandInvulnTimer = getwatcheddvar("<unknown string>");
            if (!isdefined(lastStandInvulnTimer)) {
                dvarstring = namespace_296c793a004e81b3::function_3514ae5d09f47ed2("<unknown string>");
                lastStandInvulnTimer = getdvarfloat(dvarstring, 1);
            }
        }
    #/
    clearlaststandinvuln();
    self endon("disconnect");
    self endon("clear_last_stand_invuln");
    namespace_169cd7a8fbc76ee5::adddamagemodifier("last_stand_invuln", 0, 0, &laststandinvulnignorefunc);
    namespace_3c37cb17ade254d::waittill_notify_or_timeout("death", lastStandInvulnTimer);
    thread clearlaststandinvuln();
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa92
// Size: 0x18
function clearlaststandinvuln() {
    self notify("clear_last_stand_invuln");
    namespace_169cd7a8fbc76ee5::removedamagemodifier("last_stand_invuln", 0);
}

// Namespace laststand/namespace_10260b963310d30e
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaab1
// Size: 0x4a
function laststandinvulnignorefunc(inflictor, attacker, victim, damage, meansofdeath, objweapon, hitloc) {
    if (meansofdeath == "MOD_TRIGGER_HURT") {
        return 1;
    }
    return 0;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xab03
// Size: 0x5
function getdefaultlaststandtimervalue() {
    return 10;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab10
// Size: 0x5
function getdefaultlaststandrevivetimervalue() {
    return 5;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab1d
// Size: 0x11
function getshellshockinterruptdelayms(duration) {
    return duration * 1000;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab36
// Size: 0x5b
function function_643969f67556243f(player, reason) {
    if (isdefined(player) && getdvarint(@"hash_6d80c8821451e612", namespace_36f464722d326bbe::isBRStyleGameType())) {
        logstring("[lastStandFailureReason] player: " + function_53c4c53197386572(player.name, "") + ", reason: " + reason);
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab98
// Size: 0x4f6
function function_27d0ea02ed3cc35f(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration) {
    var_6d8f177c77496430 = namespace_3e725f3cc58bddd3::isforcedlaststand(self, einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc);
    if (!istrue(var_6d8f177c77496430)) {
        if (istrue(self.inlaststand) || istrue(self.playergoingintols)) {
            function_643969f67556243f(self, "in_last_stand");
            return 0;
        }
        if (namespace_bed52b18307bf1e0::function_afb40a34c99dc4e4(objweapon)) {
            function_643969f67556243f(self, "drown_weapon");
            return 0;
        }
        if (!namespace_36f464722d326bbe::isBRStyleGameType() && !istrue(level.var_d88255cd662eb5c) && !istrue(self.killstreaklaststand) && smeansofdeath == "MOD_MELEE" && objweapon.basename != "iw9_me_fists_mp" && objweapon.basename != "iw9_me_fists_mp_ls") {
            if (!function_311066dfee085643(self, "melee")) {
                function_643969f67556243f(self, "melee");
                return 0;
            }
        }
        if (smeansofdeath == "MOD_EXECUTION") {
            function_643969f67556243f(self, "execution");
            return 0;
        }
        if (smeansofdeath == "MOD_MEATSHIELD") {
            function_643969f67556243f(self, "meat_shield");
            return 0;
        }
        if (!namespace_36f464722d326bbe::isBRStyleGameType() && isheadshot(shitloc, smeansofdeath, attacker) && !_hasperk("specialty_survivor") && !istrue(level.var_d88255cd662eb5c)) {
            if (!function_5bfdc69fe21c4118() && !function_311066dfee085643(self, "headshot")) {
                function_643969f67556243f(self, "headshot");
                return 0;
            }
        }
        if (!namespace_36f464722d326bbe::isBRStyleGameType() && isexplosivedamagemod(smeansofdeath) && !istrue(level.var_d88255cd662eb5c)) {
            if (!function_311066dfee085643(self, "explosive") && !(getgametype() == "xfire")) {
                function_643969f67556243f(self, "explosive");
                return 0;
            }
        }
        if (istrue(self.gulagarena)) {
            if (getdvarint(@"hash_8d6a8990465b92fc", 0)) {
                if (isdefined(self.name)) {
                    playername = self.name;
                } else {
                    playername = "";
                }
                if (isdefined(self.gulagarena)) {
                    var_54b9737d53438793 = self.gulagarena;
                } else {
                    var_54b9737d53438793 = "";
                }
                if (isdefined(self.gulag)) {
                    var_39b32cc7f5d22bcc = self.gulag;
                } else {
                    var_39b32cc7f5d22bcc = "";
                }
                var_b0686d6beeedbe48 = "[gulag_getPlayerStateWait] Player " + playername + " has .gulagArena : " + var_54b9737d53438793 + " and .gulag : " + var_39b32cc7f5d22bcc;
                logstring(var_b0686d6beeedbe48);
            }
            function_643969f67556243f(self, "gulag");
            return 0;
        }
        if (isdefined(attacker) && isdefined(attacker.classname) && (attacker.classname == "trigger_hurt" || attacker.classname == "worldspawn")) {
            if (!function_311066dfee085643(self, "world") && !istrue(level.var_2d3f190c222f8218)) {
                function_643969f67556243f(self, "world");
                return 0;
            }
        }
        if (is_equal(attacker, self) && !namespace_36f464722d326bbe::isBRStyleGameType() && !istrue(level.var_d88255cd662eb5c)) {
            function_643969f67556243f(self, "suicide");
            return 0;
        }
        if (namespace_36f464722d326bbe::isBRStyleGameType() && namespace_a2f809133c566621::isjuggernaut()) {
            function_643969f67556243f(self, "juggernaut");
            return 0;
        }
        if (namespace_36f464722d326bbe::isBRStyleGameType() && !namespace_4b0406965e556711::gameflag("prematch_done")) {
            function_643969f67556243f(self, "br_prematch");
            return 0;
        }
        if (isdefined(objweapon) && getweaponbasename(objweapon) == "nuke_mp") {
            function_643969f67556243f(self, "nuke");
            return 0;
        }
        if (isdefined(level.modelaststandallowed) && !self [[ level.modelaststandallowed ]](einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration)) {
            function_643969f67556243f(self, "mode_allow");
            return 0;
        }
        if (istrue(level.var_999d19ffa4f37df9)) {
            return 0;
        }
        var_b9acab71a2b1fd8a = (_hasperk("specialty_survivor") || _hasperk("specialty_pistoldeath")) && !istrue(self.var_4945d0d82dd3964b) || namespace_cd0b2d039510b38d::islaststandenabled();
        if (!namespace_36f464722d326bbe::isBRStyleGameType() && !istrue(level.var_d88255cd662eb5c) && !var_b9acab71a2b1fd8a) {
            function_643969f67556243f(self, "available");
            return 0;
        }
        if (level.laststand == 2 && !var_b9acab71a2b1fd8a) {
            function_643969f67556243f(self, "laststand_2_available");
            return 0;
        }
        /#
            if (istrue(self.var_add7dba6d7dab7d9)) {
                function_643969f67556243f(self, "<unknown string>");
                return 0;
            }
        #/
    }
    return 1;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb096
// Size: 0x2e
function function_5bfdc69fe21c4118() {
    switch (getgametype()) {
    case #"hash_25397d96e5bc8403":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb0cb
// Size: 0x100
function function_ed6f8ae3c33ed504(attacker) {
    if (!isdefined(attacker)) {
        return;
    }
    if (getgametype() == "grind" && namespace_4b0406965e556711::gameflag("prematch_done")) {
        level thread namespace_ba880bc821ba2f06::spawndogtags(self, attacker, "new_tag_spawned", undefined);
        level thread namespace_ca106a843d09cdd4::droptags(self, attacker);
    } else if (level.dogtagsenabled && namespace_4b0406965e556711::gameflag("prematch_done")) {
        level thread namespace_ba880bc821ba2f06::spawndogtags(self, attacker, "new_tag_spawned", undefined);
    }
    score = level.scoremod["kill"];
    if (score != 0) {
        if (level.teambased) {
            level namespace_e8a49b70d0769b66::giveteamscoreforobjective(attacker.pers["team"], score, 0);
        } else {
            attacker namespace_e8a49b70d0769b66::giveplayerscore(#"kill", score, self);
        }
    }
    if (namespace_cd0b2d039510b38d::function_f698bfd3efa33302() || namespace_cd0b2d039510b38d::function_e9f3a160bbefe208(attacker) || namespace_cd0b2d039510b38d::function_e9f3a160bbefe208(self)) {
        namespace_58012cf453ba1014::oncranked(self, attacker);
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb1d2
// Size: 0x6d
function function_3b4a396318897a49(weapon) {
    if (isstring(weapon)) {
        weaponname = weapon;
    } else {
        weaponname = weapon.basename;
    }
    if (!isdefined(weaponname)) {
        return 0;
    }
    currentweapon = 0;
    switch (weaponname) {
    case #"hash_6f9360f4d23e4f4c":
    case #"hash_7e9d38063954e4b6":
        currentweapon = 1;
        break;
    }
    return currentweapon;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb247
// Size: 0x27
function function_2a3c9a91bf1d3911() {
    /#
        if (getdvarint(@"hash_1e86798724d1115d", 0) != 0) {
            return 1;
        }
    #/
    return istrue(level.var_7bea6884afd52e81);
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb276
// Size: 0x55
function function_a2dd7d8143656503(player) {
    if (player getclientomnvar("ui_br_has_been_interrogated") == 1 || player getclientomnvar("ui_br_interrogate_team_is_being_tracked") == 1 || player getclientomnvar("ui_br_interrogate_tracking_other_team") == 1 || istrue(player.var_895c1aaac16f7256)) {
        return 1;
    }
    return 0;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb2d3
// Size: 0x76
function function_4c452a6c72371f17() {
    if (!isdefined(self.var_f1da02a134648443)) {
        self.var_f1da02a134648443 = 1;
    }
    foreach (player in level.players) {
        if (!isdefined(player)) {
            return;
        }
        function_42994e73b40cc1a4(player);
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb350
// Size: 0x1ba
function function_42994e73b40cc1a4(player) {
    if (!isdefined(self)) {
        return;
    }
    if (!isdefined(player)) {
        return;
    }
    var_4d9b9e1c6d61a950 = self.var_121a99ed77d25f87;
    if (!isdefined(var_4d9b9e1c6d61a950)) {
        return;
    }
    var_142b0f57d2ac79d9 = self.var_a2bc763e8380844b;
    if (!isdefined(var_142b0f57d2ac79d9)) {
        return;
    }
    var_a2d7f6dad9c7fae5 = namespace_f8065cafc523dba5::isfriendly(self.owner.team, player);
    var_d36495a3a4245392 = getdvarint(@"hash_d0cbc658324b1dae", 0) != 0;
    if (isdefined(self.owner.laststandattacker) && !var_d36495a3a4245392) {
        var_d36495a3a4245392 = namespace_f8065cafc523dba5::isfriendly(self.owner.laststandattacker.team, player);
    } else {
        var_d36495a3a4245392 = 1;
    }
    if (var_a2d7f6dad9c7fae5 || !var_d36495a3a4245392) {
        namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(var_4d9b9e1c6d61a950, player);
        namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(var_142b0f57d2ac79d9, player);
        return;
    }
    if (!isdefined(self.var_f1da02a134648443)) {
        return;
    }
    switch (self.var_f1da02a134648443) {
    case 1:
        namespace_7bdde15c3500a23f::setheadicon_addclienttomask(var_4d9b9e1c6d61a950, player);
        namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(var_142b0f57d2ac79d9, player);
        setheadicondrawthroughgeo(var_4d9b9e1c6d61a950, 0);
        break;
    case 2:
        namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(var_4d9b9e1c6d61a950, player);
        namespace_7bdde15c3500a23f::setheadicon_addclienttomask(var_142b0f57d2ac79d9, player);
        setheadicondrawthroughgeo(var_4d9b9e1c6d61a950, 0);
        break;
    case 4:
        namespace_7bdde15c3500a23f::setheadicon_addclienttomask(var_4d9b9e1c6d61a950, player);
        namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(var_142b0f57d2ac79d9, player);
        setheadicondrawthroughgeo(var_4d9b9e1c6d61a950, 1);
        break;
    case 3:
    default:
        namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(var_4d9b9e1c6d61a950, player);
        namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(var_142b0f57d2ac79d9, player);
        break;
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb511
// Size: 0x5fd
function function_150b60d7cbd3ba2() {
    function_e1841af234a09407(script_model%iw9_wz_interrogate_frontleft_attacker_start, "interrogate_frontleft_attacker_start");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_frontleft_attacker_loop, "interrogate_frontleft_attacker_loop");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_frontleft_attacker_end, "interrogate_frontleft_attacker_end");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_frontleft_defender_start, "interrogate_frontleft_defender_start");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_frontleft_defender_loop, "interrogate_frontleft_defender_loop");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_frontleft_defender_end, "interrogate_frontleft_defender_end");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_frontright_attacker_start, "interrogate_frontright_attacker_start");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_frontright_attacker_loop, "interrogate_frontright_attacker_loop");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_frontright_attacker_end, "interrogate_frontright_attacker_end");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_frontright_defender_start, "interrogate_frontright_defender_start");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_frontright_defender_loop, "interrogate_frontright_defender_loop");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_frontright_defender_end, "interrogate_frontright_defender_end");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_backleft_attacker_start, "interrogate_backleft_attacker_start");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_backleft_attacker_loop, "interrogate_backleft_attacker_loop");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_backleft_attacker_end, "interrogate_backleft_attacker_end");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_backleft_defender_start, "interrogate_backleft_defender_start");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_backleft_defender_loop, "interrogate_backleft_defender_loop");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_backleft_defender_end, "interrogate_backleft_defender_end");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_backright_attacker_start, "interrogate_backright_attacker_start");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_backright_attacker_loop, "interrogate_backright_attacker_loop");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_backright_attacker_end, "interrogate_backright_attacker_end");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_backright_defender_start, "interrogate_backright_defender_start");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_backright_defender_loop, "interrogate_backright_defender_loop");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_backright_defender_end, "interrogate_backright_defender_end");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_frontleft_attacker3pcam_start, "interrogate_frontleft_attacker3pcam_start");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_frontleft_attacker3pcam_loop, "interrogate_frontleft_attacker3pcam_loop");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_frontleft_attacker3pcam_end, "interrogate_frontleft_attacker3pcam_end");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_frontleft_defender3pcam_start, "interrogate_frontleft_defender3pcam_start");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_frontleft_defender3pcam_loop, "interrogate_frontleft_defender3pcam_loop");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_frontleft_defender3pcam_end, "interrogate_frontleft_defender3pcam_end");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_frontright_attacker3pcam_start, "interrogate_frontright_attacker3pcam_start");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_frontright_attacker3pcam_loop, "interrogate_frontright_attacker3pcam_loop");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_frontright_attacker3pcam_end, "interrogate_frontright_attacker3pcam_end");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_frontright_defender3pcam_start, "interrogate_frontright_defender3pcam_start");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_frontright_defender3pcam_loop, "interrogate_frontright_defender3pcam_loop");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_frontright_defender3pcam_end, "interrogate_frontright_defender3pcam_end");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_backleft_attacker3pcam_start, "interrogate_backleft_attacker3pcam_start");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_backleft_attacker3pcam_loop, "interrogate_backleft_attacker3pcam_loop");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_backleft_attacker3pcam_end, "interrogate_backleft_attacker3pcam_end");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_backleft_defender3pcam_start, "interrogate_backleft_defender3pcam_start");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_backleft_defender3pcam_loop, "interrogate_backleft_defender3pcam_loop");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_backleft_defender3pcam_end, "interrogate_backleft_defender3pcam_end");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_backright_attacker3pcam_start, "interrogate_backright_attacker3pcam_start");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_backright_attacker3pcam_loop, "interrogate_backright_attacker3pcam_loop");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_backright_attacker3pcam_end, "interrogate_backright_attacker3pcam_end");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_backright_defender3pcam_start, "interrogate_backright_defender3pcam_start");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_backright_defender3pcam_loop, "interrogate_backright_defender3pcam_loop");
    function_e1841af234a09407(script_model%iw9_wz_interrogate_backright_defender3pcam_end, "interrogate_backright_defender3pcam_end");
    level.scr_animtree["device"] = %script_model;
    function_4a6b9ecae4b71ae5(script_model%iw9_wz_interrogate_backleft_knife_start, "interrogate_backleft_knife_start");
    function_4a6b9ecae4b71ae5(script_model%iw9_wz_interrogate_backleft_knife_loop, "interrogate_backleft_knife_loop");
    function_4a6b9ecae4b71ae5(script_model%iw9_wz_interrogate_backleft_knife_end, "interrogate_backleft_knife_end");
    function_4a6b9ecae4b71ae5(script_model%iw9_wz_interrogate_backright_knife_start, "interrogate_backright_knife_start");
    function_4a6b9ecae4b71ae5(script_model%iw9_wz_interrogate_backright_knife_loop, "interrogate_backright_knife_loop");
    function_4a6b9ecae4b71ae5(script_model%iw9_wz_interrogate_backright_knife_end, "interrogate_backright_knife_end");
    function_4a6b9ecae4b71ae5(script_model%iw9_wz_interrogate_frontleft_knife_start, "interrogate_frontleft_knife_start");
    function_4a6b9ecae4b71ae5(script_model%iw9_wz_interrogate_frontleft_knife_loop, "interrogate_frontleft_knife_loop");
    function_4a6b9ecae4b71ae5(script_model%iw9_wz_interrogate_frontleft_knife_end, "interrogate_frontleft_knife_end");
    function_4a6b9ecae4b71ae5(script_model%iw9_wz_interrogate_frontright_knife_start, "interrogate_frontright_knife_start");
    function_4a6b9ecae4b71ae5(script_model%iw9_wz_interrogate_frontright_knife_loop, "interrogate_frontright_knife_loop");
    function_4a6b9ecae4b71ae5(script_model%iw9_wz_interrogate_frontright_knife_end, "interrogate_frontright_knife_end");
    function_4a6b9ecae4b71ae5(script_model%iw9_wz_interrogate_backleft_pda_start, "interrogate_backleft_pda_start");
    function_4a6b9ecae4b71ae5(script_model%iw9_wz_interrogate_backleft_pda_loop, "interrogate_backleft_pda_loop");
    function_4a6b9ecae4b71ae5(script_model%iw9_wz_interrogate_backleft_pda_end, "interrogate_backleft_pda_end");
    function_4a6b9ecae4b71ae5(script_model%iw9_wz_interrogate_backright_pda_start, "interrogate_backright_pda_start");
    function_4a6b9ecae4b71ae5(script_model%iw9_wz_interrogate_backright_pda_loop, "interrogate_backright_pda_loop");
    function_4a6b9ecae4b71ae5(script_model%iw9_wz_interrogate_backright_pda_end, "interrogate_backright_pda_end");
    function_4a6b9ecae4b71ae5(script_model%iw9_wz_interrogate_frontleft_pda_start, "interrogate_frontleft_pda_start");
    function_4a6b9ecae4b71ae5(script_model%iw9_wz_interrogate_frontleft_pda_loop, "interrogate_frontleft_pda_loop");
    function_4a6b9ecae4b71ae5(script_model%iw9_wz_interrogate_frontleft_pda_end, "interrogate_frontleft_pda_end");
    function_4a6b9ecae4b71ae5(script_model%iw9_wz_interrogate_frontright_pda_start, "interrogate_frontright_pda_start");
    function_4a6b9ecae4b71ae5(script_model%iw9_wz_interrogate_frontright_pda_loop, "interrogate_frontright_pda_loop");
    function_4a6b9ecae4b71ae5(script_model%iw9_wz_interrogate_frontright_pda_end, "interrogate_frontright_pda_end");
}

// Namespace laststand/namespace_10260b963310d30e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb15
// Size: 0x5c
function function_1d6e0919bcc01c46(attacker, defender, playtime) {
    level endon("game_ended");
    dir = function_16f1ed28a559f91f(attacker, defender);
    self notify("interrogation_anim_setup_start");
    function_4aa5cc0d5aaf5e13(dir, attacker, defender);
    self notify("interrogation_anim_setup_done");
    thread function_7aa8b6e88b420bdb(dir, attacker, defender, playtime);
}

// Namespace laststand/namespace_10260b963310d30e
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb78
// Size: 0x8e
function function_7aa8b6e88b420bdb(dir, attacker, defender, playtime) {
    self endon("use_hold_interrogate_fail");
    attacker endon("death_or_disconnect");
    defender endon("death_or_disconnect");
    self notify("interrogation_anim_start");
    childthread function_85b5f0cafa43fc83(dir, attacker, defender);
    if (!istrue(self.var_d50d5a16df84df44)) {
        remainingtime = function_a8d9949bcfbf31c6(dir, attacker, defender, playtime);
        if (isdefined(remainingtime)) {
            function_25bb5b0a542a335c(dir, attacker, defender, remainingtime);
        }
    }
    self waittill("interrogation_anim_end_done");
    self notify("interrogation_anim_complete");
}

// Namespace laststand/namespace_10260b963310d30e
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc0d
// Size: 0x7e
function function_a8d9949bcfbf31c6(dir, attacker, defender, var_451899d86c262b06) {
    self endon("use_hold_interrogate_fail");
    self endon("use_hold_interrogate_success");
    attacker endon("death_or_disconnect");
    defender endon("death_or_disconnect");
    var_a9a4271fa4d4acee = gettime();
    function_2bc915da80c90aa0(dir, attacker, defender, "start", 1, 1);
    var_a9a4271fa4d4acee = var_451899d86c262b06 - gettime() - var_a9a4271fa4d4acee;
    var_a9a4271fa4d4acee = max(var_a9a4271fa4d4acee, 0);
    return var_a9a4271fa4d4acee / 1000;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc93
// Size: 0xb0
function function_25bb5b0a542a335c(dir, attacker, defender, playtime) {
    self endon("use_hold_interrogate_fail");
    self endon("use_hold_interrogate_success");
    attacker endon("death_or_disconnect");
    defender endon("death_or_disconnect");
    if (!isdefined(playtime)) {
        return 0;
    }
    animlength = function_fa005dea3b675dd4(dir, "loop");
    timeleft = playtime;
    while (timeleft > 0) {
        if (!isdefined(self)) {
            break;
        }
        function_2bc915da80c90aa0(dir, attacker, defender, "loop", 0);
        waittime = min(animlength, timeleft);
        wait(waittime);
        timeleft = timeleft - waittime;
    }
    self notify("interrogation_anim_loop_done");
    return 1;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd4b
// Size: 0x62
function function_85b5f0cafa43fc83(dir, attacker, defender) {
    self notify("interrogation_anim_end");
    self endon("interrogation_anim_end");
    if (!istrue(self.var_d50d5a16df84df44)) {
        waittill_any_2("interrogation_anim_loop_done", "use_hold_interrogate_success");
    }
    function_2bc915da80c90aa0(dir, attacker, defender, "end", 1);
    self notify("interrogation_anim_end_done");
}

// Namespace laststand/namespace_10260b963310d30e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbdb4
// Size: 0x252
function function_4aa5cc0d5aaf5e13(dir, attacker, defender) {
    self endon("use_hold_interrogate_fail");
    attacker endon("death_or_disconnect");
    defender endon("death_or_disconnect");
    self.angles = (0, defender.angles[1], 0);
    var_c01bc36249a983f4 = function_341c7024a3e54638(dir, defender, attacker);
    var_439ae466e036ac7d = var_c01bc36249a983f4[3];
    var_93e84816600b6f9b = var_c01bc36249a983f4[2];
    var_67d8ddf901f65b1d = var_c01bc36249a983f4[1];
    var_691d365a2045e893 = var_c01bc36249a983f4[0];
    attacker thread function_52a9113423ff7ce1(defender.origin + var_691d365a2045e893, var_67d8ddf901f65b1d);
    defender thread function_52a9113423ff7ce1(defender.origin + var_93e84816600b6f9b, var_439ae466e036ac7d);
    self.var_61859dd33e04afac = function_64c48800869451a1(attacker, defender.origin + var_93e84816600b6f9b, var_439ae466e036ac7d);
    self.var_862b6f35ada766b8 = function_64c48800869451a1(defender, defender.origin + var_93e84816600b6f9b, var_439ae466e036ac7d);
    self.var_862b6f35ada766b8 childthread function_eef4880f266f99e6(attacker);
    thread function_8ae5403c4d1733d6(dir, attacker, defender);
    thread function_d0010fdbcdaeaf0a(attacker);
    var_7574e1170872d13a = gettime();
    attacker namespace_df5cfdbe6e2d3812::function_f1e9d0c09f38006b(0);
    var_f4ec18f455b87d6f = getdvarfloat(@"hash_46685b5a7ab844eb", 0.2);
    var_19c8c749987d4fea = var_7574e1170872d13a + var_f4ec18f455b87d6f * 1000;
    var_a4994b77554c30de = gettime();
    if (var_a4994b77554c30de < var_19c8c749987d4fea) {
        wait((var_19c8c749987d4fea - var_a4994b77554c30de) / 1000);
    }
    attacker.player_rig linkto(self.var_61859dd33e04afac, "tag_origin", (0, 0, 0), (0, 0, 0));
    defender.player_rig linkto(self.var_862b6f35ada766b8, "tag_origin", (0, 0, 0), (0, 0, 0));
    if (!attacker GetCameraThirdPerson()) {
        attacker.player_rig showonlytoplayer(attacker);
    }
    if (!defender GetCameraThirdPerson()) {
        defender.player_rig showonlytoplayer(defender);
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc00d
// Size: 0xd0
function function_eef4880f266f99e6(attacker) {
    self endon("entitydeleted");
    self notify("vehicleWatchLogic");
    self endon("vehicleWatchLogic");
    var_a9c79142e2ac7704 = getdvarint(@"hash_dcdd2aa64529509e", 185);
    self.trigger = spawn("trigger_radius", self.origin, 0, var_a9c79142e2ac7704, var_a9c79142e2ac7704);
    while (1) {
        var_2087e4030aa793b = self.trigger waittill("trigger");
        if (isdefined(var_2087e4030aa793b.classname) && var_2087e4030aa793b.classname == "script_vehicle") {
            occupants = namespace_1fbd40990ee60ede::vehicle_occupancy_getalloccupantsandreserving(var_2087e4030aa793b);
            if (isdefined(occupants) && occupants.size > 0) {
                attacker.var_a23f35f8460d8857 = 1;
            }
        }
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc0e4
// Size: 0x13f
function function_8ae5403c4d1733d6(dir, attacker, defender) {
    level endon("game_ended");
    self notify("interrogation_anim_cleanup");
    self endon("interrogation_anim_cleanup");
    var_4930cbce302555b1 = waittill_any_return_3("interrogation_anim_complete", "use_hold_interrogate_fail", "last_stand_finished");
    if (isalive(attacker) && isdefined(self.var_61859dd33e04afac)) {
        attacker stopanimscriptsceneevent();
    }
    if (isalive(defender) && isdefined(self.var_862b6f35ada766b8)) {
        defender stopanimscriptsceneevent();
    }
    if (isdefined(self.var_61859dd33e04afac)) {
        self.var_61859dd33e04afac function_dbc6c6adf9cf2998();
    }
    if (isdefined(self.var_862b6f35ada766b8)) {
        self.var_862b6f35ada766b8 function_dbc6c6adf9cf2998();
    }
    waitframe();
    gunless = makeweapon(function_3d5c51904fd25773());
    if (!isdefined(attacker.gunnlessweapon)) {
        curweapon = attacker getcurrentweapon();
        if (curweapon == gunless) {
            attacker.gunnlessweapon = curweapon;
        }
    }
    if (attacker isswitchingtoweaponwithmonitoring(gunless)) {
        attacker abortmonitoredweaponswitch(gunless);
    }
    attacker thread namespace_df5cfdbe6e2d3812::function_9897d143c3feee05();
    attacker notify("remove_rig");
    defender notify("remove_rig");
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc22a
// Size: 0x78
function function_dbc6c6adf9cf2998() {
    if (isalive(self.player) && isdefined(self.player.player_rig) && self.player.player_rig islinked()) {
        self.player.player_rig unlink();
    }
    if (self islinked()) {
        self unlink();
    }
    self delete();
}

// Namespace laststand/namespace_10260b963310d30e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc2a9
// Size: 0xc5
function function_b5963c08352be7e9(dir, attacker, defender) {
    level endon("game_ended");
    self endon("interrogation_anim_setup_start");
    defender endon("death_or_disconnect");
    self.var_61859dd33e04afac function_dbc6c6adf9cf2998();
    self.var_862b6f35ada766b8 function_dbc6c6adf9cf2998();
    waitframe();
    if (isalive(attacker)) {
        gunless = makeweapon(function_3d5c51904fd25773());
        if (attacker isswitchingtoweaponwithmonitoring(gunless)) {
            attacker abortmonitoredweaponswitch(gunless);
        }
        attacker thread namespace_df5cfdbe6e2d3812::function_9897d143c3feee05();
        attacker notify("remove_rig");
    }
    if (isalive(defender) && isdefined(self.var_862b6f35ada766b8)) {
        defender stopanimscriptsceneevent();
    }
    if (isalive(defender)) {
        defender notify("remove_rig");
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc375
// Size: 0x172
function function_d0010fdbcdaeaf0a(attacker) {
    var_74c33a61490f2af7 = function_acc5ea9379317664(attacker, "offhand1h_vm_smartphone_inter", "tag_origin", 1);
    var_213abe1dbc252aca = function_acc5ea9379317664(attacker, "offhand1h_wm_smartphone_v0", "tag_accessory_left", 0);
    var_63254b5552422209 = function_acc5ea9379317664(attacker, "att_vm_p33_me_tac_knife01_inter", "tag_origin", 1);
    var_8973c46d8ffcc3dc = function_acc5ea9379317664(attacker, "att_vm_p33_me_tac_knife01_v0", "j_gun", 0);
    attacker.var_74c33a61490f2af7 = var_74c33a61490f2af7;
    attacker.var_213abe1dbc252aca = var_213abe1dbc252aca;
    attacker.var_63254b5552422209 = var_63254b5552422209;
    attacker.var_8973c46d8ffcc3dc = var_8973c46d8ffcc3dc;
    attacker setclientomnvar("ui_tablet_usb", 10);
    if (isdefined(self.var_61859dd33e04afac)) {
        attacker.var_74c33a61490f2af7 linkto(self.var_61859dd33e04afac, "tag_origin");
        attacker.var_63254b5552422209 linkto(self.var_61859dd33e04afac, "tag_origin");
        attacker.var_74c33a61490f2af7.animname = "device";
        attacker.var_74c33a61490f2af7 namespace_bc4a4b9456315863::setanimtree();
        attacker.var_63254b5552422209.animname = "device";
        attacker.var_63254b5552422209 namespace_bc4a4b9456315863::setanimtree();
    }
    thread function_7005f2911baffe7f(attacker);
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc4ee
// Size: 0xcd
function function_7005f2911baffe7f(attacker) {
    level endon("game_ended");
    var_74c33a61490f2af7 = attacker.var_74c33a61490f2af7;
    var_213abe1dbc252aca = attacker.var_213abe1dbc252aca;
    var_63254b5552422209 = attacker.var_63254b5552422209;
    var_8973c46d8ffcc3dc = attacker.var_8973c46d8ffcc3dc;
    var_a25061bfc986e905 = getwatcheddvar("lastStandReviveTimer") + 5;
    waittill_any_timeout_3(var_a25061bfc986e905, "interrogation_anim_complete", "use_hold_interrogate_fail", "last_stand_finished");
    if (isdefined(attacker)) {
        attacker setclientomnvar("ui_tablet_usb", 0);
    }
    function_a0b08dae03df9dae(var_74c33a61490f2af7);
    function_a0b08dae03df9dae(var_213abe1dbc252aca);
    function_a0b08dae03df9dae(var_63254b5552422209);
    function_a0b08dae03df9dae(var_8973c46d8ffcc3dc);
}

// Namespace laststand/namespace_10260b963310d30e
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc5c2
// Size: 0x246
function function_2bc915da80c90aa0(dir, attacker, defender, animtype, var_e830f42670718693, var_7a26e48fe2aee716) {
    self endon("last_stand_finished");
    self notify("interrogation_anim_play_handle");
    self endon("interrogation_anim_play_handle");
    var_b6ca10cadf0a2d = 0;
    var_baa7bf816c823379 = 0;
    if (isdefined(attacker)) {
        var_b6ca10cadf0a2d = attacker GetCameraThirdPerson();
    }
    if (isdefined(defender)) {
        var_baa7bf816c823379 = defender GetCameraThirdPerson();
    }
    var_fd346d58d905a11b = function_27e4565cfcbf5e25(dir, animtype, "attacker", var_b6ca10cadf0a2d);
    var_c125143a1b692a67 = function_27e4565cfcbf5e25(dir, animtype, "defender", var_baa7bf816c823379);
    var_4f0410bbd831664f = function_27e4565cfcbf5e25(dir, animtype, "knife");
    var_77a57e091496b231 = function_27e4565cfcbf5e25(dir, animtype, "pda");
    if (isdefined(self.var_61859dd33e04afac) && isdefined(attacker) && isdefined(attacker.player_rig) && isdefined(var_fd346d58d905a11b)) {
        attacker endon("death_or_disconnect");
        if (istrue(var_7a26e48fe2aee716)) {
            self.var_61859dd33e04afac namespace_bc4a4b9456315863::anim_first_frame_solo(attacker.player_rig, var_fd346d58d905a11b);
        }
        self.var_61859dd33e04afac childthread namespace_4e680905778c0f0f::anim_player_solo(attacker, attacker.player_rig, var_fd346d58d905a11b);
        if (isdefined(attacker.var_63254b5552422209)) {
            self.var_61859dd33e04afac childthread namespace_bc4a4b9456315863::anim_single_solo(attacker.var_63254b5552422209, var_4f0410bbd831664f);
        }
        if (isdefined(attacker.var_74c33a61490f2af7)) {
            self.var_61859dd33e04afac childthread namespace_bc4a4b9456315863::anim_single_solo(attacker.var_74c33a61490f2af7, var_77a57e091496b231);
        }
    }
    if (isdefined(self.var_862b6f35ada766b8) && isdefined(defender) && isdefined(defender.player_rig) && isdefined(var_c125143a1b692a67)) {
        defender endon("death_or_disconnect");
        if (istrue(var_7a26e48fe2aee716)) {
            self.var_862b6f35ada766b8 namespace_bc4a4b9456315863::anim_first_frame_solo(defender.player_rig, var_c125143a1b692a67);
        }
        self.var_862b6f35ada766b8 childthread namespace_4e680905778c0f0f::anim_player_solo(defender, defender.player_rig, var_c125143a1b692a67);
    }
    if (istrue(var_e830f42670718693)) {
        var_dbe2f5c8bbbeee8c = function_fa005dea3b675dd4(dir, animtype);
        wait(var_dbe2f5c8bbbeee8c);
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc80f
// Size: 0x49
function function_27e4565cfcbf5e25(dir, animtype, var_846e68fe5b28f790, var_24b6f4bd2e81097d) {
    if (istrue(var_24b6f4bd2e81097d)) {
        var_846e68fe5b28f790 = var_846e68fe5b28f790 + "3pcam";
    }
    return "interrogate_" + dir + "_" + var_846e68fe5b28f790 + "_" + animtype;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc860
// Size: 0x48
function function_16f1ed28a559f91f(attacker, defender) {
    var_1a91c43c0366371a = getdvarint(@"hash_84ba96c2974a8135", 0);
    if (istrue(var_1a91c43c0366371a)) {
        return function_a30d65a6f3331dc1(attacker, defender);
    } else {
        return function_bf625405d3e068af(attacker, defender);
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc8af
// Size: 0x151
function function_a30d65a6f3331dc1(attacker, defender) {
    var_ac727774017accae = 22.5;
    var_bbf4a6fb1025338a = 67.5;
    var_10f21406a3625090 = 112.5;
    var_7244d6d492287f0e = 157.5;
    var_3e0d351e6e3a5cc2 = angleclamp(defender.angles);
    var_9ef779c4d770e613 = math::anglebetweenvectorssigned(attacker.origin - defender.origin, anglestoforward(var_3e0d351e6e3a5cc2), (0, 0, 1));
    var_ed478e32f316bd8c = 0;
    if (var_9ef779c4d770e613 < 0) {
        var_ed478e32f316bd8c = 1;
    }
    if (abs(var_9ef779c4d770e613) < var_ac727774017accae) {
        dir = "front";
    } else if (abs(var_9ef779c4d770e613) < var_bbf4a6fb1025338a) {
        if (var_ed478e32f316bd8c) {
            dir = "frontleft";
        } else {
            dir = "frontright";
        }
    } else if (abs(var_9ef779c4d770e613) < var_10f21406a3625090) {
        if (var_ed478e32f316bd8c) {
            dir = "left";
        } else {
            dir = "right";
        }
    } else if (abs(var_9ef779c4d770e613) < var_7244d6d492287f0e) {
        if (var_ed478e32f316bd8c) {
            dir = "backleft";
        } else {
            dir = "backright";
        }
    } else {
        dir = "back";
    }
    return dir;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca08
// Size: 0xad
function function_bf625405d3e068af(attacker, defender) {
    var_3e0d351e6e3a5cc2 = angleclamp(defender.angles);
    var_9ef779c4d770e613 = math::anglebetweenvectorssigned(attacker.origin - defender.origin, anglestoforward(var_3e0d351e6e3a5cc2), (0, 0, 1));
    if (var_9ef779c4d770e613 > 0) {
        if (var_9ef779c4d770e613 > 90) {
            dir = "backright";
        } else {
            dir = "frontright";
        }
    } else if (var_9ef779c4d770e613 < -90) {
        dir = "backleft";
    } else {
        dir = "frontleft";
    }
    return dir;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcabd
// Size: 0xd2
function function_acc5ea9379317664(player, var_7f6d36cc641739d9, animtag, var_64fc43b788afae69, originoffset, anglesoffset) {
    if (!isdefined(originoffset)) {
        originoffset = (0, 0, 0);
    }
    if (!isdefined(anglesoffset)) {
        anglesoffset = (0, 0, 0);
    }
    newmodel = spawn("script_model", (0, 0, 0));
    newmodel setmodel(var_7f6d36cc641739d9);
    newmodel show();
    if (istrue(var_64fc43b788afae69)) {
        if (player GetCameraThirdPerson()) {
            newmodel hide();
        } else {
            newmodel showonlytoplayer(player);
        }
    } else {
        if (!player GetCameraThirdPerson()) {
            newmodel hidefromplayer(player);
        }
        newmodel linkto(player, animtag, originoffset, anglesoffset);
    }
    return newmodel;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb97
// Size: 0x60
function function_64c48800869451a1(player, var_dc1711ffc6cd2bf1, sceneangles) {
    var_58debfd84e38f50b = spawn("script_model", var_dc1711ffc6cd2bf1);
    var_58debfd84e38f50b.angles = sceneangles;
    var_58debfd84e38f50b setmodel("tag_origin");
    var_58debfd84e38f50b hide();
    var_58debfd84e38f50b.player = player;
    return var_58debfd84e38f50b;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcbff
// Size: 0x52
function function_e1841af234a09407(var_b1e6fbabce1a26ba, var_41503cd028efb569) {
    if (!isdefined(var_41503cd028efb569)) {
        return;
    }
    level.scr_animtree["player"] = %script_model;
    level.scr_anim["player"][var_41503cd028efb569] = var_b1e6fbabce1a26ba;
    level.scr_eventanim["player"][var_41503cd028efb569] = var_41503cd028efb569;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc58
// Size: 0x52
function function_4a6b9ecae4b71ae5(var_b1e6fbabce1a26ba, var_41503cd028efb569) {
    if (!isdefined(var_41503cd028efb569)) {
        return;
    }
    level.scr_animtree["device"] = %script_model;
    level.scr_anim["device"][var_41503cd028efb569] = var_b1e6fbabce1a26ba;
    level.scr_eventanim["device"][var_41503cd028efb569] = var_41503cd028efb569;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xccb1
// Size: 0x291
function function_52a9113423ff7ce1(spawnpos, var_b7850001037aa074) {
    var_95658f1d17762b45 = getdvarfloat(@"hash_46685b5a7ab844eb", 0.2) - 0.05;
    /#
        assert(var_95658f1d17762b45 > 0);
    #/
    self.animname = "player";
    if (!isdefined(spawnpos)) {
        spawnpos = (0, 0, 0);
    }
    if (!isdefined(var_b7850001037aa074)) {
        var_b7850001037aa074 = (0, 0, 0);
    }
    var_7521c682c7617240 = self GetCameraThirdPerson();
    self function_b88c89bb7cd1ab8e(spawnpos);
    eyepos = (0, 0, self getplayerviewheight(self getstance()));
    var_7b71e4920d76c2c1 = rotatevector(eyepos, self getplayerangles());
    var_7b71e4920d76c2c1 = eyepos - var_7b71e4920d76c2c1;
    player_rig = spawn("script_arms", self.origin + var_7b71e4920d76c2c1, 0, 0, self);
    player_rig.angles = self getplayerangles();
    player_rig.player = self;
    self.player_rig = player_rig;
    self.player_rig hide(1);
    self.player_rig.animname = "player";
    self.player_rig useanimtree(%script_model);
    self.player_rig.updatedversion = 1;
    if (istrue(var_7521c682c7617240)) {
        self playerlinktodelta(self.player_rig, "tag_origin", 1, 0, 0, 0, 0, 0, 1, 1);
    } else if (!isinlaststand(self)) {
        self playerlinktodelta(self.player_rig, "tag_origin", 1, 10, 10, 10, 10, 0, 1, 1);
    } else {
        self playerlinktodelta(self.player_rig, "tag_origin", 1, 4, 4, 8, 8, 0, 1, 1);
    }
    self.player_rig moveto(spawnpos, var_95658f1d17762b45, 0.05, var_95658f1d17762b45 * 0.25);
    self.player_rig rotateto(var_b7850001037aa074, var_95658f1d17762b45, 0.05, var_95658f1d17762b45 * 0.25);
    self notify("rig_created");
    waittill_any_2("remove_rig", "player_free_spot");
    if (istrue(level.gameended)) {
        return;
    }
    if (isdefined(self)) {
        self unlink();
        gunless = makeweapon(function_3d5c51904fd25773());
        if (isswitchingtoweaponwithmonitoring(gunless)) {
            abortmonitoredweaponswitch(gunless);
        }
        thread namespace_df5cfdbe6e2d3812::function_9897d143c3feee05();
    }
    if (isdefined(player_rig)) {
        player_rig delete();
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf49
// Size: 0x99
function function_fa005dea3b675dd4(dir, animtype) {
    if (!isdefined(dir) || !isdefined(animtype)) {
        return 0;
    }
    animname = function_27e4565cfcbf5e25(dir, animtype, "attacker");
    animlength = getanimlength(level.scr_anim["player"][animname]);
    if (isdefined(animlength)) {
        return animlength;
    }
    animname = function_27e4565cfcbf5e25(dir, animtype, "defender");
    animlength = getanimlength(level.scr_anim["player"][animname]);
    if (isdefined(animlength)) {
        return animlength;
    }
    return 0;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcfea
// Size: 0x36a
function function_341c7024a3e54638(dir, defender, attacker) {
    var_da04238f117f371e = (62.707, 46.051, 6);
    var_af1341bec25ffc13 = (74.806, -48.163, 19);
    var_4a1c12f2f92b81c4 = (-26.042, 72.986, 19);
    var_72d69e3f71a14b91 = (-41.891, -85.123, 16);
    var_c9de492ad170fa99 = (33.226, -140.939, 0);
    var_4945066f80fb403a = (47, 144.501, 0);
    var_c8da9727e974891d = (47.171, -66.087, 0);
    var_fcb771762f1ba156 = (42.768, 53.39, 0);
    var_f66fd0d606305 = (0, 0, 0);
    var_524b19d2034e1406 = (0, 0, 0);
    var_b047501ce5a60bc9 = (0, 0, 0);
    var_3e0d351e6e3a5cc2 = (0, 0, 0);
    var_18ba7ff327954c = var_fcb771762f1ba156;
    var_ba0a9212a8d8504f = (0, 0, 0);
    switch (dir) {
    case #"hash_b7ac0cd88b535f49":
        var_18ba7ff327954c = var_c9de492ad170fa99;
        var_ba0a9212a8d8504f = var_da04238f117f371e;
        break;
    case #"hash_1a6710a30ea5fea":
        var_18ba7ff327954c = var_4945066f80fb403a;
        var_ba0a9212a8d8504f = var_af1341bec25ffc13;
        break;
    case #"hash_29a0586a7056ac8f":
        var_18ba7ff327954c = var_c8da9727e974891d;
        var_ba0a9212a8d8504f = var_4a1c12f2f92b81c4;
        break;
    case #"hash_4337df7547428000":
        var_18ba7ff327954c = var_fcb771762f1ba156;
        var_ba0a9212a8d8504f = var_72d69e3f71a14b91;
        break;
    }
    var_f462fa4a0e9af84 = vectornormalize(attacker.origin - defender.origin);
    var_c2a3587914211083 = anglestoforward(defender.angles);
    var_e5cd56ac6f0ac63f = (1, 0, 0);
    currentangle = math::anglebetweenvectorssigned(var_c2a3587914211083, var_f462fa4a0e9af84, (0, 0, 1));
    var_604cca21b20714f7 = math::anglebetweenvectorssigned(var_e5cd56ac6f0ac63f, var_ba0a9212a8d8504f, (0, 0, 1));
    var_4051c7fd18783671 = currentangle - var_604cca21b20714f7;
    var_28eb2de6a2e2e9df = rotatepointaroundvector((0, 0, 1), var_c2a3587914211083, var_4051c7fd18783671);
    var_3e0d351e6e3a5cc2 = namespace_9c840bb9f2ecbf00::vectortoanglessafe(var_28eb2de6a2e2e9df, (0, 0, 1));
    if (getdvarint(@"hash_bbd8136229f7e702", 0)) {
        var_28eb2de6a2e2e9df = var_c2a3587914211083;
        var_3e0d351e6e3a5cc2 = defender.angles;
    }
    var_5019e02fc30e335 = math::anglebetweenvectorssigned(var_e5cd56ac6f0ac63f, var_28eb2de6a2e2e9df, (0, 0, 1));
    var_f66fd0d606305 = rotatepointaroundvector((0, 0, 1), var_ba0a9212a8d8504f, var_5019e02fc30e335);
    var_181640917809e880 = anglestoforward(var_18ba7ff327954c);
    var_4d034c998a162518 = rotatepointaroundvector((0, 0, 1), var_181640917809e880, var_5019e02fc30e335);
    var_524b19d2034e1406 = namespace_9c840bb9f2ecbf00::vectortoanglessafe(vectornormalize(var_4d034c998a162518), (0, 0, 1));
    return [0:var_f66fd0d606305, 1:var_524b19d2034e1406, 2:var_b047501ce5a60bc9, 3:var_3e0d351e6e3a5cc2];
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd35c
// Size: 0x28
function function_a0b08dae03df9dae(var_7f6d36cc641739d9) {
    if (isdefined(var_7f6d36cc641739d9)) {
        if (var_7f6d36cc641739d9 islinked()) {
            var_7f6d36cc641739d9 unlink();
        }
        var_7f6d36cc641739d9 delete();
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd38b
// Size: 0x151
function function_96f2172e98188560(target) {
    if (!isdefined(self) || !isplayer(self) || !isdefined(target)) {
        return;
    }
    if (getdvarint(@"hash_72771711644c3f78", 1) == 0) {
        return;
    }
    if (self isswimming()) {
        return;
    }
    if (isdefined(self.var_88f59c89f67e4385)) {
        self.var_88f59c89f67e4385 delete();
    }
    startangles = self getplayerangles();
    newangles = vectortoangles(vectornormalize(target - self geteye()));
    var_88f59c89f67e4385 = spawn("script_model", self.origin);
    var_88f59c89f67e4385.angles = startangles;
    var_88f59c89f67e4385 setmodel("tag_origin");
    var_88f59c89f67e4385 rotateto(newangles, 0.4, 0.05);
    var_88f59c89f67e4385 thread namespace_7db13bdf599e41a6::function_7f0aebb7ad935939(self);
    self.var_88f59c89f67e4385 = var_88f59c89f67e4385;
    mover = self getmovingplatformparent();
    if (isdefined(mover)) {
        namespace_1fbd40990ee60ede::function_3dfe65e73a7d0c86(self, mover);
        var_88f59c89f67e4385 linkto(mover);
        thread namespace_7db13bdf599e41a6::function_34fd10b9791b7bb2(mover);
    } else {
        thread namespace_7db13bdf599e41a6::function_d75bbd43c2e29f0c();
    }
    self playerlinktodelta(var_88f59c89f67e4385, "", 1, 10, 10, 0, 0, 0, 0, 0, 1, 0, 0.3, 0.3);
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd4e3
// Size: 0x14b
function function_1cec99551dbf4dd3(player) {
    if (!isdefined(player) || !function_2a3c9a91bf1d3911()) {
        return;
    }
    if (isdefined(player.laststandreviveent)) {
        if (isdefined(player.laststandreviveent.var_121a99ed77d25f87)) {
            namespace_7bdde15c3500a23f::setheadicon_deleteicon(player.laststandreviveent.var_121a99ed77d25f87);
            namespace_7bdde15c3500a23f::setheadicon_deleteicon(player.laststandreviveent.var_a2bc763e8380844b);
            player.laststandreviveent.var_121a99ed77d25f87 = undefined;
            player.laststandreviveent.var_a2bc763e8380844b = undefined;
        }
        player setclientomnvar("ui_br_has_been_interrogated", 0);
    }
    if (istrue(player.var_895c1aaac16f7256) && isdefined(player.var_f159f1c13aa75721) && isdefined(player.var_f159f1c13aa75721.var_4af51e13229c40fe) && isplayer(player.var_f159f1c13aa75721.var_4af51e13229c40fe)) {
        interrogator = player.var_f159f1c13aa75721.var_4af51e13229c40fe;
        var_5bebd2013b0f01ec = player;
        interrogator thread function_1b56d7c4fe15b79c(interrogator, var_5bebd2013b0f01ec);
        function_b37595afabefa038(interrogator, var_5bebd2013b0f01ec);
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd635
// Size: 0xcf
function function_5911caad56f963ea(team, var_a25318088473dc60) {
    if (team == "axis") {
        level.var_a04b495bbccdf0bf = level.var_a04b495bbccdf0bf + var_a25318088473dc60;
        setomnvar("ui_cutthroat_num_reviving_team_1", level.var_a04b495bbccdf0bf);
    } else if (team == "allies") {
        level.var_eb919e162d131112 = level.var_eb919e162d131112 + var_a25318088473dc60;
        setomnvar("ui_cutthroat_num_reviving_team_2", level.var_eb919e162d131112);
    } else if (team == "team_three") {
        level.var_62973ff88470b851 = level.var_62973ff88470b851 + var_a25318088473dc60;
        setomnvar("ui_cutthroat_num_reviving_team_3", level.var_62973ff88470b851);
    } else {
        namespace_44abc05161e2e2cb::showerrormessage("setCutthroatRevivingOmnvar : invalid team" + self.team + " passed through");
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd70b
// Size: 0xcf
function function_e6ccdf90ba898cdc(team, var_a25318088473dc60) {
    if (team == "axis") {
        level.var_2d9a769507f8c794 = level.var_2d9a769507f8c794 + var_a25318088473dc60;
        setomnvar("ui_cutthroat_num_downed_team_1", level.var_2d9a769507f8c794);
    } else if (team == "allies") {
        level.var_419bc98b5f722331 = level.var_419bc98b5f722331 + var_a25318088473dc60;
        setomnvar("ui_cutthroat_num_downed_team_2", level.var_419bc98b5f722331);
    } else if (team == "team_three") {
        level.var_9663d50652fde8c2 = level.var_9663d50652fde8c2 + var_a25318088473dc60;
        setomnvar("ui_cutthroat_num_downed_team_3", level.var_9663d50652fde8c2);
    } else {
        namespace_44abc05161e2e2cb::showerrormessage("setCutthroatDownOmnvar: invalid team" + self.team + " passed through");
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd7e1
// Size: 0xf2
function function_9168ee31efcf3393() {
    /#
        level endon("<unknown string>");
        setdevdvarifuninitialized(@"hash_9564fda23c9d6dbd", 0);
        while (1) {
            var_e02c3ca432c52a42 = getdvarint(@"hash_9564fda23c9d6dbd", 0);
            if (!var_e02c3ca432c52a42 || istrue(self.inlaststand)) {
                waitframe();
                continue;
            }
            foreach (player in level.players) {
                if (!player namespace_f8065cafc523dba5::_isalive()) {
                    continue;
                }
                if (istrue(player.inlaststand)) {
                    continue;
                }
                if (isagent(player)) {
                    continue;
                }
                if (isbot(player)) {
                    continue;
                }
                player function_6d8f177c77496430();
            }
            setdvar(@"hash_9564fda23c9d6dbd", 0);
        }
    #/
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd8da
// Size: 0x43
function function_6d8f177c77496430() {
    /#
        if (!_hasperk("<unknown string>")) {
            giveperk("<unknown string>");
        }
        self dodamage(self.maxhealth * 2, self.origin, self, undefined, "<unknown string>");
    #/
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd924
// Size: 0x437
function function_e7884f1619dc53be() {
    /#
        level endon("<unknown string>");
        setdvarifuninitialized(@"hash_a9e6f66d5c357e7e", 0);
        while (1) {
            var_e96f64067bfc72b8 = getdvarint(@"hash_a9e6f66d5c357e7e", 0);
            if (!var_e96f64067bfc72b8) {
                wait(0.5);
                continue;
            }
            setdvar(@"hash_a9e6f66d5c357e7e", 0);
            var_678a0776298909d1 = level.players[0];
            var_4cd9f1ecf86a97bb = level.players[1];
            var_de75a3b89e8300f5 = level.players[2];
            /#
                assert(isdefined(var_678a0776298909d1) && isplayer(var_678a0776298909d1));
            #/
            switch (var_e96f64067bfc72b8) {
            case 1:
                if (!isdefined(var_4cd9f1ecf86a97bb)) {
                    iprintlnbold("<unknown string>");
                    break;
                }
                var_4374624f5f9c6207 = var_678a0776298909d1 namespace_d3d40f75bb4e4c32::playergetlaststandpistol();
                if (!isdefined(var_4374624f5f9c6207)) {
                    iprintlnbold("<unknown string>");
                    break;
                }
                var_678a0776298909d1 dodamage(var_678a0776298909d1.health + 200, var_4cd9f1ecf86a97bb.origin, var_4cd9f1ecf86a97bb, var_4cd9f1ecf86a97bb, "<unknown string>", var_4cd9f1ecf86a97bb.primaryweaponobj, "<unknown string>");
                var_4cd9f1ecf86a97bb hudoutlineenable("<unknown string>");
                iprintlnbold("<unknown string>");
                break;
            case 2:
                if (!isdefined(var_4cd9f1ecf86a97bb) || !isdefined(var_de75a3b89e8300f5)) {
                    iprintlnbold("<unknown string>");
                    break;
                }
                var_4374624f5f9c6207 = var_678a0776298909d1 namespace_d3d40f75bb4e4c32::playergetlaststandpistol();
                if (!isdefined(var_4374624f5f9c6207)) {
                    iprintlnbold("<unknown string>");
                    break;
                }
                var_678a0776298909d1 dodamage(var_678a0776298909d1.health + 200, var_4cd9f1ecf86a97bb.origin, var_4cd9f1ecf86a97bb, var_4cd9f1ecf86a97bb, "<unknown string>", var_4cd9f1ecf86a97bb.primaryweaponobj, "<unknown string>");
                wait(1);
                var_4cd9f1ecf86a97bb dodamage(var_4cd9f1ecf86a97bb.health + 200, var_de75a3b89e8300f5.origin, var_de75a3b89e8300f5, var_de75a3b89e8300f5, "<unknown string>", var_de75a3b89e8300f5.primaryweaponobj, "<unknown string>");
                var_4cd9f1ecf86a97bb hudoutlineenable("<unknown string>");
                iprintlnbold("<unknown string>");
                break;
            case 3:
                if (!isdefined(var_4cd9f1ecf86a97bb) || !isdefined(var_de75a3b89e8300f5)) {
                    iprintlnbold("<unknown string>");
                    break;
                }
                var_4cd9f1ecf86a97bb dodamage(var_4cd9f1ecf86a97bb.health + 200, var_678a0776298909d1.origin, var_678a0776298909d1, var_678a0776298909d1, "<unknown string>", var_678a0776298909d1.primaryweaponobj, "<unknown string>");
                wait(1);
                var_678a0776298909d1 dodamage(var_678a0776298909d1.health + 200, var_de75a3b89e8300f5.origin, var_de75a3b89e8300f5, var_de75a3b89e8300f5, "<unknown string>", var_de75a3b89e8300f5.primaryweaponobj, "<unknown string>");
                iprintlnbold("<unknown string>");
                break;
            case 4:
                if (!isdefined(var_4cd9f1ecf86a97bb) || !isdefined(var_de75a3b89e8300f5)) {
                    iprintlnbold("<unknown string>");
                    break;
                }
                var_4374624f5f9c6207 = var_678a0776298909d1 namespace_d3d40f75bb4e4c32::playergetlaststandpistol();
                if (!isdefined(var_4374624f5f9c6207)) {
                    iprintlnbold("<unknown string>");
                    break;
                }
                var_678a0776298909d1 dodamage(var_678a0776298909d1.health + 200, var_4cd9f1ecf86a97bb.origin, var_4cd9f1ecf86a97bb, var_4cd9f1ecf86a97bb, "<unknown string>", var_4cd9f1ecf86a97bb.primaryweaponobj, "<unknown string>");
                var_4cd9f1ecf86a97bb hudoutlineenable("<unknown string>");
                iprintlnbold("<unknown string>");
                var_4cd9f1ecf86a97bb waittill("<unknown string>");
                wait(1);
                var_4cd9f1ecf86a97bb dodamage(var_4cd9f1ecf86a97bb.health + 200, var_de75a3b89e8300f5.origin, var_de75a3b89e8300f5, var_de75a3b89e8300f5, "<unknown string>", var_de75a3b89e8300f5.primaryweaponobj, "<unknown string>");
                break;
            case 5:
                if (!isdefined(var_4cd9f1ecf86a97bb) || !isdefined(var_de75a3b89e8300f5)) {
                    iprintlnbold("<unknown string>");
                    break;
                }
                var_de75a3b89e8300f5 dodamage(var_de75a3b89e8300f5.health + 200, var_4cd9f1ecf86a97bb.origin, var_4cd9f1ecf86a97bb, var_4cd9f1ecf86a97bb, "<unknown string>", var_4cd9f1ecf86a97bb.primaryweaponobj, "<unknown string>");
                var_4cd9f1ecf86a97bb hudoutlineenable("<unknown string>");
                iprintlnbold("<unknown string>");
                var_4cd9f1ecf86a97bb waittill("<unknown string>");
                var_4cd9f1ecf86a97bb hudoutlinedisable();
                wait(1);
                var_de75a3b89e8300f5 notify("<unknown string>");
                break;
            }
        }
    #/
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdd62
// Size: 0x5df
function function_cb1f25df9191cd3c() {
    /#
        while (1) {
            host = undefined;
            if (getdvarint(@"hash_d475fd19488b5a6d", 0) == 1) {
                wait(1);
                foreach (player in level.players) {
                    if (player ishost()) {
                        host = player;
                        break;
                    }
                }
                if (isinlaststand(host) || istrue(host.liveRagdoll)) {
                    foreach (player in level.players) {
                        if (player.team == host.team && isbot(player) && isalive(player)) {
                            player setorigin(host.origin + (0, 0, 18));
                            host.reviver = player;
                            wait(0.5);
                            break;
                        }
                    }
                    if (isdefined(host.reviver)) {
                        var_e5486d00ebba6e9 = level.laststandrevivetimer + 1;
                        host.reviver botpressbutton("<unknown string>", var_e5486d00ebba6e9);
                        wait(var_e5486d00ebba6e9 + 0.5);
                        if (isinlaststand(host) || istrue(host.liveRagdoll)) {
                            host.reviver botpressbutton("<unknown string>", var_e5486d00ebba6e9);
                        }
                    }
                } else {
                    iprintlnbold("<unknown string>");
                }
                setdevdvar(@"hash_d475fd19488b5a6d", 0);
            } else if (getdvarint(@"hash_b5de345e9da778b5", 0) == 1) {
                wait(1);
                while (1) {
                    victim = undefined;
                    foreach (player in level.players) {
                        if (isinlaststand(player)) {
                            victim = player;
                            break;
                        }
                    }
                    if (!isdefined(victim)) {
                        iprintlnbold("<unknown string>");
                        break;
                    }
                    foreach (player in level.players) {
                        if (isbot(player) && isalive(player) && player.team == victim.team) {
                            player setorigin(victim.origin + (0, 0, 18));
                            victim.reviver = player;
                            wait(0.5);
                            break;
                        }
                    }
                    if (isdefined(victim.reviver)) {
                        var_e5486d00ebba6e9 = level.laststandrevivetimer + 1;
                        victim.reviver botpressbutton("<unknown string>", var_e5486d00ebba6e9);
                        wait(var_e5486d00ebba6e9 + 0.5);
                        if (isinlaststand(victim)) {
                            victim.reviver botpressbutton("<unknown string>", var_e5486d00ebba6e9);
                        }
                        break;
                    }
                    setdevdvar(@"hash_b5de345e9da778b5", 0);
                }
            } else if (getdvarint(@"hash_d475fd19488b5a6d", 0) == 2) {
                foreach (player in level.players) {
                    if (player ishost() && isinlaststand(player)) {
                        player onrevive(1);
                        break;
                    }
                }
                setdevdvar(@"hash_d475fd19488b5a6d", 0);
            } else if (getdvarint(@"hash_d475fd19488b5a6d", 0) == 3) {
                wait(1);
                foreach (player in level.players) {
                    if (player ishost()) {
                        host = player;
                        break;
                    }
                }
                foreach (player in level.players) {
                    if (player.team == host.team && isbot(player) && isalive(player)) {
                        player setorigin(host.origin + (0, 0, 18));
                        host.reviver = player;
                        wait(0.5);
                        break;
                    }
                }
                if (isdefined(host.reviver)) {
                    host function_e4ccd01fb7ec7a6f(0);
                    host function_d87e1768229d0e3e();
                    if (isdefined(host.var_6627db08bfd4f903)) {
                        host.var_6627db08bfd4f903 setdevtext("<unknown string>");
                        host.var_6627db08bfd4f903.color = (1, 1, 1);
                    } else {
                        host iprintlnbold("<unknown string>");
                    }
                }
                setdevdvar(@"hash_d475fd19488b5a6d", 0);
            }
            wait(1);
        }
    #/
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe348
// Size: 0x8e
function function_b3f5eede669e7182(attacker, victim) {
    level endon("game_ended");
    victim endon("death_or_disconnect");
    victim endon("last_stand_finished");
    victim endon("use_hold_interrogate_success");
    victim endon("use_hold_interrogate_fail");
    while (1) {
        if (!isdefined(victim) || !isdefined(attacker)) {
            break;
        }
        if (victim usebuttonpressed() || istrue(victim.var_7f59448717b5aa63)) {
            victim function_4ba85e5091eee483(#"hash_2f9162f82ed1f900", 4);
            victim thread namespace_88bfae359020fdd3::function_8fdd864a86afe560(attacker);
            wait(1.5);
        }
        waitframe();
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3dd
// Size: 0x64
function function_4ba85e5091eee483(var_f2f805fffe803696, debounce) {
    if (!isdefined(self.var_b91fc73cfedfc41)) {
        self.var_b91fc73cfedfc41 = 0;
    }
    if (!isdefined(debounce)) {
        debounce = 0;
    }
    if (self.var_b91fc73cfedfc41 == 0) {
        self.var_b91fc73cfedfc41 = 1;
        level thread namespace_25c5a6f43bb97b43::trysaylocalsound(self, var_f2f805fffe803696);
        thread function_6945da38c80ec9cf(debounce);
    }
}

// Namespace laststand/namespace_10260b963310d30e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe448
// Size: 0x26
function function_6945da38c80ec9cf(debounce) {
    level endon("game_ended");
    self endon("disconnect");
    wait(debounce);
    self.var_b91fc73cfedfc41 = 0;
}

// Namespace laststand/namespace_10260b963310d30e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe475
// Size: 0x2eb
function function_d9b9b021d2e292a7() {
    /#
        level endon("<unknown string>");
        while (1) {
            if (getdvarint(@"hash_eb12fbdb604176fb", 0) != 0) {
                setdvar(@"hash_eb12fbdb604176fb", 0);
                localplayer = level.players[0];
                foreach (bot in level.players) {
                    if (bot != localplayer && isbot(bot) && localplayer.team == bot.team) {
                        function_78e1a6bd9380a160(bot, localplayer);
                        break;
                    }
                }
            }
            if (getdvarint(@"hash_12b095ece3375ee2", 0) != 0) {
                setdvar(@"hash_12b095ece3375ee2", 0);
                localplayer = level.players[0];
                if (!isinlaststand(localplayer)) {
                    foreach (bot in level.players) {
                        if (isinlaststand(bot)) {
                            localplayer = bot;
                            break;
                        }
                    }
                }
                foreach (bot in level.players) {
                    if (bot != localplayer && isbot(bot) && localplayer.team != bot.team) {
                        function_78e1a6bd9380a160(bot, localplayer);
                        break;
                    }
                }
            }
            if (getdvarint(@"hash_b81bebd8a028bd0a", 0) != 0) {
                setdvar(@"hash_b81bebd8a028bd0a", 0);
                localplayer = level.players[0];
                foreach (bot in level.players) {
                    if (bot != localplayer && isbot(bot) && function_ad443bbcdcf37b85(bot) && bot.team == localplayer.team) {
                        if (!bot namespace_d3d40f75bb4e4c32::hasselfrevivetoken()) {
                            bot namespace_cb965d2f71fefddc::addselfrevivetoken();
                        }
                        bot function_6d8f177c77496430();
                        wait(1);
                        bot.var_f932828585d0926c = 1;
                        bot waittill_any_timeout_1(10, "<unknown string>");
                        bot.var_f932828585d0926c = undefined;
                        break;
                    }
                }
            }
            wait(1);
        }
    #/
}

// Namespace laststand/namespace_10260b963310d30e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xe767
// Size: 0xaa
function function_78e1a6bd9380a160(bot, var_1730c8d8475566cd, var_cebe2632e00d0e2d) {
    /#
        /#
            assert(isdefined(bot));
        #/
        /#
            assert(isdefined(var_1730c8d8475566cd));
        #/
        if (!isinlaststand(var_1730c8d8475566cd)) {
            return;
        }
        if (!isdefined(var_cebe2632e00d0e2d)) {
            var_cebe2632e00d0e2d = (1, 0, 0);
        }
        var_558a3833630c48 = var_1730c8d8475566cd.origin + function_767cea82b001f645(var_cebe2632e00d0e2d) * 50;
        bot setorigin(var_558a3833630c48, 1);
        bot function_8b201bccc0aa3695(var_1730c8d8475566cd.origin, 0.5);
        wait(0.5);
        bot botpressbutton("<unknown string>", 8);
    #/
}

