// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\utility\damage.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\mp\equipment\gas_grenade.gsc;
#using scripts\mp\teams.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\cp_mp\killstreaks\white_phosphorus.gsc;
#using scripts\mp\gameobjects.gsc;
#using script_6a5d3bf7a5b7064a;
#using script_74b851b7aa1ef32d;
#using script_189b67b2735b981d;
#using scripts\cp_mp\execution.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\hostmigration.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\perks\perkpackage.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\game.gsc;

#namespace juggernaut;

// Namespace juggernaut/namespace_68f1873625691c6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92c
// Size: 0xd0
function init() {
    level.activejuggernauts = [];
    level.var_ed61c38f5c8bb414 = [0:"pristine", 1:"damaged"];
    level.var_13819795c6ee9ff8 = [0:"helmet", 1:"neckguard", 2:"backpack", 3:"shoulderpad_l", 4:"shoulderpad_r", 5:"forearmpad_l", 6:"forearmpad_r", 7:"qamis", 8:"thighpad_l", 9:"thighpad_r"];
    /#
        setdevdvarifuninitialized(@"hash_caba4093ed4a5d5d", 0);
        setdevdvarifuninitialized(@"hash_63bf655a03b825eb", 0);
        setdevdvarifuninitialized(@"hash_ae2c4f86ffaf24db", 0);
        setdevdvarifuninitialized(@"hash_4f7da19a233d6916", 0);
    #/
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa03
// Size: 0xa4e
function jugg_makejuggernaut(juggconfig, streakinfo, bundle) {
    /#
        assert(isreallyalive(self));
    #/
    var_7a377f8d3f83484d = function_a5af0a72ac912a3d(juggconfig);
    if (!isdefined(var_7a377f8d3f83484d)) {
        namespace_44abc05161e2e2cb::showerrormessage("KILLSTREAKS/JUGG_CANNOT_BECOME");
        return 0;
    }
    var_8a867002df857d70 = var_7a377f8d3f83484d != self getstance();
    self.isjuggernaut = 1;
    namespace_25c5a6f43bb97b43::disablebattlechatter(self);
    namespace_d39a86483d995ed1::gas_updateplayereffects();
    juggcontext = spawnstruct();
    juggcontext.juggconfig = juggconfig;
    customization = namespace_6d8da2b47f878104::getoperatorcustomization();
    juggcontext.prevhealth = self.health;
    juggcontext.prevmaxhealth = self.maxhealth;
    juggcontext.prevbody = customization[0];
    juggcontext.prevhead = customization[1];
    juggcontext.prevviewmodel = self getcustomizationviewmodel();
    juggcontext.prevspeedscale = self.playerstreakspeedscale;
    juggcontext.prevsuit = self.suit;
    juggcontext.prevclothtype = self.clothtype;
    juggcontext.var_aaac4cd2da0aa927 = self.operatorcustomization.var_400ef51562606e7a;
    juggcontext.maskomnvar = "ui_gas_mask_juggernaut";
    if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.execution)) {
        juggcontext.var_1fa2a9ca3621008a = self.operatorcustomization.execution;
    }
    if (isdefined(self.super)) {
        juggcontext.var_c18e401ced26383c = getcurrentsuperpoints();
    }
    juggcontext.var_46ad94f231cd4ef3 = [];
    juggcontext.var_46ad94f231cd4ef3["head_health"] = ter_op(isdefined(juggconfig.head_health), juggconfig.head_health, 100);
    juggcontext.var_46ad94f231cd4ef3["torso_upper_health"] = ter_op(isdefined(juggconfig.torso_upper_health), juggconfig.torso_upper_health, 100);
    juggcontext.var_46ad94f231cd4ef3["torso_lower_health"] = ter_op(isdefined(juggconfig.torso_lower_health), juggconfig.torso_lower_health, 100);
    juggcontext.var_46ad94f231cd4ef3["right_upper_arm_health"] = ter_op(isdefined(juggconfig.right_upper_arm_health), juggconfig.right_upper_arm_health, 100);
    juggcontext.var_46ad94f231cd4ef3["right_lower_arm_health"] = ter_op(isdefined(juggconfig.right_lower_arm_health), juggconfig.right_lower_arm_health, 100);
    juggcontext.var_46ad94f231cd4ef3["left_upper_arm_health"] = ter_op(isdefined(juggconfig.left_upper_arm_health), juggconfig.left_upper_arm_health, 100);
    juggcontext.var_46ad94f231cd4ef3["left_lower_arm_health"] = ter_op(isdefined(juggconfig.left_lower_arm_health), juggconfig.left_lower_arm_health, 100);
    juggcontext.var_46ad94f231cd4ef3["right_leg_health"] = ter_op(isdefined(juggconfig.right_leg_health), juggconfig.right_leg_health, 100);
    juggcontext.var_46ad94f231cd4ef3["left_leg_health"] = ter_op(isdefined(juggconfig.left_leg_health), juggconfig.left_leg_health, 100);
    juggcontext.executionlist = [0:"execution_mp_juggernaut_01", 1:"execution_mp_juggernaut_02", 2:"execution_mp_juggernaut_03"];
    self.var_a23031c04df01bf = &function_4217f11ffb352425;
    self.maxhealth = juggconfig.maxhealth;
    self.health = juggconfig.startinghealth;
    self.var_59651a2893429638 = 0;
    namespace_3bbb5a98b932c46f::savetogglescopestates();
    namespace_3bbb5a98b932c46f::savealtstates();
    if (isdefined(level.clearbrinventory) && !istrue(self.gulag)) {
        self [[ level.clearbrinventory ]]();
    }
    if (isdefined(juggconfig.classstruct)) {
        respawnitems = namespace_d19129e4fa5d176::respawnitems_saveplayeritemstostruct();
        if (isdefined(level.var_dc475334f61b89d)) {
            [[ level.var_dc475334f61b89d ]](respawnitems);
        }
        juggcontext.respawnitems = respawnitems;
        juggcontext.prevclass = self.lastclass;
        juggcontext.prevclassstruct = self.classstruct;
        namespace_d19129e4fa5d176::loadout_updateclass(juggconfig.classstruct, "juggernaut");
        namespace_d19129e4fa5d176::preloadandqueueclassstruct(juggconfig.classstruct, 1, 1);
        namespace_d19129e4fa5d176::giveloadout(self.team, "juggernaut", 0, 1);
        if (isdefined(juggconfig.classstruct.loadoutequipmentprimary) && isdefined(juggconfig.var_238382d33b25a18a) && juggconfig.var_238382d33b25a18a > 1) {
            namespace_1a507865f681850e::incrementequipmentammo(juggconfig.classstruct.loadoutequipmentprimary, juggconfig.var_238382d33b25a18a - 1);
        }
        if (isdefined(juggconfig.classstruct.loadoutequipmentsecondary) && isdefined(juggconfig.var_2c455d4333df379f) && juggconfig.var_2c455d4333df379f > 1) {
            namespace_1a507865f681850e::incrementequipmentammo(juggconfig.classstruct.loadoutequipmentsecondary, juggconfig.var_2c455d4333df379f - 1);
        }
        var_676dfe39dfe67969 = isdefined(juggconfig.classstruct.loadoutequipmentprimary) && isdefined(juggconfig.var_238382d33b25a18a) && juggconfig.var_238382d33b25a18a > 0;
        var_66b2e33eabc9522d = isdefined(juggconfig.classstruct.loadoutequipmentsecondary) && isdefined(juggconfig.var_2c455d4333df379f) && juggconfig.var_2c455d4333df379f > 0;
        var_3227d3b8596888f9 = 0;
        if (var_676dfe39dfe67969 && var_66b2e33eabc9522d) {
            var_3227d3b8596888f9 = 3;
        } else if (var_676dfe39dfe67969) {
            var_3227d3b8596888f9 = 1;
        } else if (var_66b2e33eabc9522d) {
            var_3227d3b8596888f9 = 2;
        }
        self setclientomnvar("ui_gas_mask_juggernaut_equipment", var_3227d3b8596888f9);
    }
    self.lastdroppableweaponobj = undefined;
    foreach (perk, unused in juggconfig.perks) {
        giveperk(perk);
    }
    if (istrue(self.pickedupcoreminigun)) {
        val::function_588f2307a3040610("fakeJugg");
        self.pickedupcoreminigun = undefined;
    }
    jugg_toggleallows(juggconfig.allows, 0);
    self skydive_setbasejumpingstatus(0);
    namespace_e765f0aad2368473::enableloopingcoughaudiosupression();
    self function_ecdccfda4326de02();
    jugg_setmodel(juggconfig);
    self.playerstreakspeedscale = juggconfig.movespeedscalar;
    namespace_3bbb5a98b932c46f::updatemovespeedscale();
    self.juggcontext = juggcontext;
    _setsuit(juggconfig.suit);
    self setclothtype(function_1823ff50bb28148d(juggconfig.clothtype));
    self function_8abe5a968cc3c220(juggconfig.var_400ef51562606e7a);
    jugg_enableoverlay(juggcontext);
    function_3f55c1fb553a4775(self);
    if (getdvarint(@"hash_4f7da19a233d6916", 0)) {
        function_551e4a3bb31658bc(juggcontext.juggconfig.execution);
    }
    if (juggconfig.infiniteammo) {
        thread infiniteammothread(juggconfig.infiniteammoupdaterate, undefined, 1);
    } else {
        weaponslist = self getweaponslistall();
        foreach (weapon in weaponslist) {
            if (!function_a585b2993726d3b(juggconfig, weapon.basename)) {
                continue;
            }
            self setweaponammoclip(weapon, weaponclipsize(weapon));
            if (jugg_canreload()) {
                self givemaxammo(weapon);
                thread jugg_managestockammo(weapon);
            }
        }
    }
    self.streakinfo = streakinfo;
    self notify("juggernaut_start");
    thread namespace_19b4203b51d56488::onjuggernaut();
    if (!isdefined(bundle)) {
        bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["juggernaut"];
    }
    thread jugg_watchmusictoggle(streakinfo.streakname);
    thread jugg_watchfordeath();
    thread jugg_watchforgameend();
    thread jugg_watchfordisconnect();
    thread jugg_watchforfire();
    thread jugg_watchherodrop();
    thread function_5b7c34dbc50c3c4e();
    thread jugg_watchoverlaydamagestates(self.juggcontext);
    thread jugg_watchforoverlayexecutiontoggle();
    thread function_e7282c5ce62c103d();
    thread function_24b195a997fe1263();
    thread function_eb351ef41167c059(bundle);
    if (!(isdefined(bundle) && istrue(bundle.var_5496352e07d93f72)) && jugg_canparachute()) {
        self skydive_setbasejumpingstatus(1);
        self skydive_setdeploymentstatus(1);
        self skydive_cutparachuteon();
    }
    if (isdefined(level.addjuggfunctionality)) {
        self [[ level.addjuggfunctionality ]]();
    }
    self.var_64ad02e4f03697a0 = isdefined(bundle) && istrue(bundle.var_64ad02e4f03697a0);
    if (istrue(self.var_64ad02e4f03697a0)) {
        function_43061427967f3c9f("stand");
    } else if (var_8a867002df857d70) {
        function_43061427967f3c9f(var_7a377f8d3f83484d);
    }
    namespace_4887422e77f3514e::onexitdeathsdoor(1);
    self.var_9c1941d3bc009d2e = isdefined(bundle) && istrue(bundle.var_9c1941d3bc009d2e);
    self.var_7e5d64139d5dabb6 = isdefined(bundle) && istrue(bundle.var_7e5d64139d5dabb6);
    jugg_addtoactivejugglist();
    namespace_a850435086c88de3::doonactionscoreevent(2, "juggernautEquipped");
    namespace_27c74152ccb91331::function_55b08d6d71b41402(self, "become_juggernaut");
    return 1;
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1459
// Size: 0x33
function function_43061427967f3c9f(stance) {
    if (getdvarint(@"hash_aa0f362e5960ad01", 0)) {
        self setstance("crouch");
        waitframe();
    }
    self setstance(stance);
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1493
// Size: 0x2e6
function jugg_removejuggernaut() {
    if (!isdefined(self)) {
        return;
    }
    /#
        assert(istrue(self.isjuggernaut));
    #/
    /#
        assert(isdefined(self.juggcontext));
    #/
    self notify("juggernaut_end");
    juggcontext = self.juggcontext;
    juggconfig = juggcontext.juggconfig;
    self setscriptablepartstate("remove_juggernaut", "remove", 0);
    self.musicplaying = undefined;
    self.var_a23031c04df01bf = undefined;
    self.var_59651a2893429638 = undefined;
    jugg_disableoverlay(juggcontext);
    jugg_toggleallows(juggconfig.allows, 1);
    function_17576a4cdcd447a7(self);
    if (isreallyalive(self)) {
        self.maxhealth = juggcontext.prevmaxhealth;
        self.health = juggcontext.prevhealth;
        namespace_e765f0aad2368473::disableloopingcoughaudiosupression();
        if (isdefined(juggconfig.classstruct)) {
            namespace_d19129e4fa5d176::respawnitems_assignrespawnitems(juggcontext.respawnitems);
            namespace_d19129e4fa5d176::giveloadout(self.team, juggcontext.prevclass, 0, 1, 1);
        }
        if (isdefined(juggcontext.var_c18e401ced26383c)) {
            setsuperbasepoints(juggcontext.var_c18e401ced26383c);
        }
        foreach (perk, unused in juggconfig.perks) {
            removeperk(perk);
        }
    }
    if (juggconfig.infiniteammo) {
        stopinfiniteammothread();
    }
    jugg_restoremodel(juggcontext);
    self.playerstreakspeedscale = juggcontext.prevspeedscale;
    namespace_3bbb5a98b932c46f::updatemovespeedscale();
    _setsuit(juggcontext.prevsuit);
    self setclothtype(function_1823ff50bb28148d(juggcontext.prevclothtype));
    self function_8abe5a968cc3c220(juggcontext.var_aaac4cd2da0aa927);
    self setscriptablepartstate("juggernaut", "neutral", 0);
    if (isdefined(juggcontext.var_1fa2a9ca3621008a)) {
        namespace_f446f6030ca8cff8::_giveexecution(juggcontext.var_1fa2a9ca3621008a);
    }
    if (jugg_canparachute()) {
        self skydive_setbasejumpingstatus(1);
        self skydive_setdeploymentstatus(1);
        self skydive_cutparachuteon();
    } else {
        self skydive_setbasejumpingstatus(0);
        self skydive_setdeploymentstatus(0);
        self skydive_cutparachuteoff();
    }
    if (istrue(self.var_64ad02e4f03697a0)) {
        self setstance("stand");
    }
    self.isjuggernaut = 0;
    self.juggcontext = undefined;
    self.streakinfo = undefined;
    self.var_64ad02e4f03697a0 = undefined;
    self.var_9c1941d3bc009d2e = 0;
    self.var_7e5d64139d5dabb6 = undefined;
    namespace_25c5a6f43bb97b43::enablebattlechatter(self);
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1780
// Size: 0x29d
function jugg_createconfig(var_d493bd7620fa1af0, var_ed0b84b88196cca6) {
    config = spawnstruct();
    config.maxhealth = 3000;
    config.startinghealth = config.maxhealth;
    config.movespeedscalar = -0.2;
    config.maxvehicledamagedivisor = 5;
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        config.maxvehicledamagedivisor = 3;
    }
    config.forcetostand = 1;
    config.suit = "iw9_juggernaut_mp";
    config.var_400ef51562606e7a = "milhvygr";
    config.infiniteammo = 0;
    config.infiniteammoupdaterate = undefined;
    config.classstruct = jugg_getdefaultclassstruct();
    config.allows = [];
    config.allows["stick_kill"] = 1;
    config.allows["health_regen"] = 1;
    config.allows["one_hit_melee_victim"] = 1;
    config.allows["flashed"] = 1;
    config.allows["stunned"] = 1;
    config.allows["prone"] = 1;
    config.allows["equipment_primary"] = 1;
    config.allows["equipment_secondary"] = 1;
    config.allows["supers"] = 1;
    config.allows["killstreaks"] = 1;
    config.allows["slide"] = 1;
    config.allows["weapon_pickup"] = 1;
    config.allows["execution_victim"] = 1;
    config.allows["cough_gesture"] = 1;
    config.allows["offhand_throwback"] = 1;
    config.perks = [];
    config.perks["specialty_stun_resistance"] = 1;
    config.perks["specialty_sharp_focus"] = 1;
    config.perks["specialty_melee_resist"] = 1;
    config.perks["specialty_blastshield"] = 1;
    config.perks["specialty_armorpiercing"] = 1;
    if (istrue(level.var_f483855733b6ebd9)) {
        config.classstruct = undefined;
    }
    return config;
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a25
// Size: 0xbb
function jugg_toggleallows(allows, allowed) {
    if (!allowed) {
        foreach (var_f36a1ae440b2a250, used in allows) {
            if (used) {
                var_f36a1ae440b2a250 = tolower(var_f36a1ae440b2a250);
                val::set("juggernaut", var_f36a1ae440b2a250, 0);
            }
        }
    }
    if (!istrue(level.disablemount)) {
        if (!allowed) {
            val::set("juggernaut", "mount_top", 0);
            val::set("juggernaut", "mount_side", 0);
        } else {
            val::function_c9d0b43701bdba00("juggernaut");
        }
    }
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ae7
// Size: 0x48
function jugg_getdefaultclassstruct() {
    classstruct = namespace_d19129e4fa5d176::loadout_getclassstruct();
    classstruct.loadoutarchetype = "archetype_assault";
    classstruct.loadoutprimary = "iw9_minigunksjugg_mp";
    classstruct.loadoutsecondary = "iw9_pi_golf18_mp";
    return classstruct;
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b37
// Size: 0x288
function jugg_watchmusictoggle(streakname) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("juggernaut_end");
    var_adfb98eeab072ea = 0;
    if (!isbot(self) && !isagent(self)) {
        self notifyonplayercommand("toggle_music", "+actionslot 3");
        self notifyonplayercommand("toggle_music", "killstreak_wheel");
    }
    var_e5c8d9d7e001af68 = makeweapon("ks_gesture_jugg_music_mp");
    var_8e47447445c817e5 = weaponfiretime(var_e5c8d9d7e001af68);
    if (!isdefined(self.musicplaying)) {
        var_aa73ba383f8079ea = self getjuggdefaultmusicenabled();
        self.musicplaying = var_aa73ba383f8079ea;
    }
    if (!istrue(self.musicplaying)) {
        self setscriptablepartstate("juggernaut", "neutral", 0);
    } else if (isdefined(streakname) && streakname == "juggernaut_recon") {
        self setscriptablepartstate("juggernaut", "music_recon", 0);
    } else if (isdefined(level.music_style) && level.music_style == "mexico") {
        self setscriptablepartstate("juggernaut", "music_mx", 0);
    } else {
        self setscriptablepartstate("juggernaut", "music", 0);
    }
    if (istrue(level.var_f483855733b6ebd9)) {
        self setscriptablepartstate("juggernaut", "neutral", 0);
    }
    if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
        self setclientomnvar("ui_enable_juggernaut_music", istrue(self.musicplaying));
    }
    while (1) {
        self waittill("toggle_music");
        if (self isonladder() || self ismantling()) {
            continue;
        }
        self giveandfireoffhand(var_e5c8d9d7e001af68);
        self playsoundonmovingent("mp_jugg_mus_toggle_foley");
        self playlocalsound("mp_jugg_mus_toggle_button");
        var_6e79fbf50c8ea64f = 0.2;
        if (istrue(self.musicplaying)) {
            var_6e79fbf50c8ea64f = 0.65;
        }
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_6e79fbf50c8ea64f);
        if (istrue(self.musicplaying)) {
            self.musicplaying = 0;
            self setscriptablepartstate("juggernaut", "neutral", 0);
        } else {
            self.musicplaying = 1;
            if (isdefined(streakname) && streakname == "juggernaut_recon") {
                self setscriptablepartstate("juggernaut", "music_recon", 0);
            } else {
                self setscriptablepartstate("juggernaut", "music", 0);
            }
        }
        if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
            self setclientomnvar("ui_enable_juggernaut_music", istrue(self.musicplaying));
        }
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(1.5);
    }
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dc6
// Size: 0x21
function jugg_watchfordeath() {
    self endon("disconnect");
    level endon("game_ended");
    self waittill("death");
    childthread jugg_removejuggernaut();
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dee
// Size: 0x6f
function jugg_watchforgameend() {
    self endon("disconnect");
    self endon("juggernaut_end");
    juggcontext = self.juggcontext;
    level waittill("game_ended");
    self.maxhealth = juggcontext.prevmaxhealth;
    self.health = juggcontext.prevhealth;
    jugg_disableoverlay(juggcontext);
    self setscriptablepartstate("juggernaut", "neutral", 0);
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e64
// Size: 0x53
function jugg_watchfordisconnect() {
    self endon("juggernaut_end");
    juggcontext = self.juggcontext;
    self waittill("disconnect");
    if (isdefined(self)) {
        self.maxhealth = juggcontext.prevmaxhealth;
        self.health = juggcontext.prevhealth;
    }
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ebe
// Size: 0x53
function jugg_watchforfire() {
    self endon("juggernaut_end");
    while (1) {
        self waittill("weapon_fired");
        if (isdefined(self.streakinfo) && isdefined(self.streakinfo.shots_fired)) {
            self.streakinfo.shots_fired++;
        }
    }
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f18
// Size: 0xaf
function jugg_getjuggmodels(juggconfig) {
    models = [];
    if (isdefined(juggconfig.bodymodel)) {
        models["body"] = juggconfig.bodymodel;
    } else {
        models["body"] = "body_sp_opforce_aq_jugg_basebody";
    }
    if (isdefined(juggconfig.headmodel)) {
        models["head"] = juggconfig.headmodel;
    } else {
        models["head"] = "head_sp_opforce_aq_jugg";
    }
    if (isdefined(juggconfig.viewmodel)) {
        models["view"] = juggconfig.viewmodel;
    } else {
        models["view"] = "mp_vm_arms_jugg_aq_iw9_1_1";
    }
    return models;
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fcf
// Size: 0x9a
function jugg_setmodel(juggconfig) {
    models = jugg_getjuggmodels(juggconfig);
    if (isdefined(self.headmodel)) {
        self detach(self.headmodel);
    }
    bodymodelname = models["body"];
    headmodelname = models["head"];
    var_41bd2eeda1c033d2 = models["view"];
    self setmodel(bodymodelname);
    self setviewmodel(var_41bd2eeda1c033d2);
    self attach(headmodelname, "", 1);
    self.headmodel = headmodelname;
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2070
// Size: 0x5a
function jugg_restoremodel(juggcontext) {
    if (namespace_f8065cafc523dba5::_isalive()) {
        self setcustomization(juggcontext.prevbody, juggcontext.prevhead);
        namespace_6d8da2b47f878104::setcharactermodels(juggcontext.prevbody, juggcontext.prevhead, juggcontext.prevviewmodel);
    }
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20d1
// Size: 0x1b5
function function_a5af0a72ac912a3d(juggconfig) {
    var_7a377f8d3f83484d = undefined;
    var_6497396fb64ea3b9 = self getstance();
    if (var_6497396fb64ea3b9 != "stand") {
        var_d906346cab6e17c8 = !istrue(juggconfig.forcetostand) && !isdefined(juggconfig.allows["crouch"]) || istrue(juggconfig.allowcrouch);
        var_6900f3419d3c4dd0 = !istrue(juggconfig.forcetostand) && !isdefined(juggconfig.allows["prone"]) || istrue(juggconfig.allowprone);
        contentoverride = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 0, 0, 1, 1, 0);
        if (!var_d906346cab6e17c8 && !var_6900f3419d3c4dd0) {
            var_7a377f8d3f83484d = "stand";
        } else if (var_6497396fb64ea3b9 == "crouch") {
            if (!var_d906346cab6e17c8) {
                var_775bd34dfd0c192f = namespace_2a184fc4902783dc::ray_trace_passed(self.origin, getstancetop("stand"), self, contentoverride);
                if (var_775bd34dfd0c192f) {
                    var_7a377f8d3f83484d = "stand";
                }
            } else {
                var_7a377f8d3f83484d = "crouch";
            }
        } else if (var_6497396fb64ea3b9 == "prone") {
            if (!var_6900f3419d3c4dd0) {
                if (var_d906346cab6e17c8) {
                    var_2030158f5eb8b187 = namespace_2a184fc4902783dc::ray_trace_passed(self.origin, getstancetop("crouch"), self, contentoverride);
                    if (var_2030158f5eb8b187) {
                        var_7a377f8d3f83484d = "crouch";
                    }
                } else {
                    var_775bd34dfd0c192f = namespace_2a184fc4902783dc::ray_trace_passed(self.origin, getstancetop("stand"), self, contentoverride);
                    if (var_775bd34dfd0c192f) {
                        var_7a377f8d3f83484d = "stand";
                    }
                }
            } else {
                var_7a377f8d3f83484d = "prone";
            }
        }
    } else {
        var_7a377f8d3f83484d = "stand";
    }
    return var_7a377f8d3f83484d;
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x228e
// Size: 0x56
function function_e7282c5ce62c103d() {
    self endon("juggernaut_end");
    self endon("death_or_disconnect");
    level endon("game_ended");
    juggcontext = self.juggcontext;
    while (1) {
        self waittill("remote_enter");
        jugg_disableoverlay(juggcontext, 1);
        self waittill("remote_exit");
        jugg_enableoverlay(juggcontext);
    }
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22eb
// Size: 0x188
function jugg_watchoverlaydamagestates(juggcontext) {
    self endon("juggernaut_end");
    self endon("death or disconnect");
    level endon("game_ended");
    startinghealth = self.health;
    var_4eb5162696baff69 = startinghealth - startinghealth * 0.1;
    var_5c8e464293ed834c = startinghealth - startinghealth * 0.35;
    var_eed2946cc87372bb = startinghealth - startinghealth * 0.6;
    var_1f9cebca13994806 = startinghealth - startinghealth * 0.85;
    var_654eba19046746e8 = 1;
    var_ea0a3076fb747a79 = var_654eba19046746e8;
    var_4f287978d27b5156 = "mask_on";
    while (1) {
        waittill_any_2("damage", "jugg_health_regen");
        if (self.health <= var_1f9cebca13994806) {
            var_4f287978d27b5156 = "mask_damage_critical";
            var_654eba19046746e8 = 5;
        } else if (self.health <= var_eed2946cc87372bb) {
            var_4f287978d27b5156 = "mask_damage_high";
            var_654eba19046746e8 = 4;
        } else if (self.health <= var_5c8e464293ed834c) {
            var_4f287978d27b5156 = "mask_damage_med";
            var_654eba19046746e8 = 3;
        } else if (self.health <= var_4eb5162696baff69) {
            var_4f287978d27b5156 = "mask_damage_low";
            var_654eba19046746e8 = 2;
        } else {
            var_4f287978d27b5156 = "mask_on";
            var_654eba19046746e8 = 1;
        }
        if (var_ea0a3076fb747a79 != var_654eba19046746e8) {
            namespace_9abe40d2af041eb2::_setvisibiilityomnvarforkillstreak("juggernaut", var_4f287978d27b5156);
            self setclientomnvar(juggcontext.maskomnvar, var_654eba19046746e8);
            var_ea0a3076fb747a79 = var_654eba19046746e8;
            self.juggoverlaystatelabel = var_4f287978d27b5156;
            self.juggoverlaystate = var_654eba19046746e8;
        }
    }
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x247a
// Size: 0x8f
function jugg_watchforoverlayexecutiontoggle() {
    self endon("juggernaut_end");
    self endon("death_or_disconnect");
    level endon("game_ended");
    juggcontext = self.juggcontext;
    var_2bf9392cab435cdf = 0;
    while (1) {
        if (!self isinexecutionattack()) {
            if (istrue(var_2bf9392cab435cdf)) {
                jugg_enableoverlay(juggcontext);
                var_2bf9392cab435cdf = 0;
                if (getdvarint(@"hash_4f7da19a233d6916", 0)) {
                    function_551e4a3bb31658bc("random");
                }
            }
            waitframe();
            continue;
        }
        if (!istrue(var_2bf9392cab435cdf)) {
            jugg_disableoverlay(juggcontext, 1);
            var_2bf9392cab435cdf = 1;
        }
        waitframe();
    }
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2510
// Size: 0xb8
function private function_e657bb1fe2ef34a8() {
    juggcontext = self.juggcontext;
    var_f58302a7cf2e40e4 = self.var_3be02516d5f4bff0;
    var_986a24725e33212a = [];
    foreach (execution in juggcontext.executionlist) {
        if (isdefined(var_f58302a7cf2e40e4) && execution == var_f58302a7cf2e40e4) {
            continue;
        }
        var_986a24725e33212a[var_986a24725e33212a.size] = execution;
    }
    var_bf6a09a02219215d = var_986a24725e33212a[randomint(var_986a24725e33212a.size)];
    if (!isdefined(var_bf6a09a02219215d)) {
        var_bf6a09a02219215d = var_f58302a7cf2e40e4;
    }
    return var_bf6a09a02219215d;
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x25d0
// Size: 0x57
function private function_551e4a3bb31658bc(executionref) {
    juggcontext = self.juggcontext;
    var_329dd2016317e381 = executionref;
    if (!isdefined(var_329dd2016317e381) || executionref == "random") {
        var_329dd2016317e381 = function_e657bb1fe2ef34a8();
    }
    namespace_f446f6030ca8cff8::_giveexecution(var_329dd2016317e381);
    self.var_3be02516d5f4bff0 = var_329dd2016317e381;
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x262e
// Size: 0xb5
function private function_24b195a997fe1263() {
    self endon("disconnect");
    self endon("juggernaut_end");
    config = self.juggcontext.juggconfig;
    var_350710ea016eac45 = namespace_d325722f2754c2c4::function_eeaa22f0cd1ff845(config.classstruct.loadoutsecondary);
    inwater = 0;
    while (1) {
        if (self isswimming()) {
            if (!istrue(inwater)) {
                namespace_df5cfdbe6e2d3812::_giveweapon(var_350710ea016eac45, undefined, undefined, 1);
                self switchtoweaponimmediate(var_350710ea016eac45);
                inwater = 1;
            }
        } else if (istrue(inwater)) {
            namespace_df5cfdbe6e2d3812::_takeweapon(var_350710ea016eac45);
            self switchtoweaponimmediate(jugg_getminigunweapon());
            inwater = 0;
        }
        wait(0.05);
    }
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x26ea
// Size: 0xd7
function private function_eb351ef41167c059(bundle) {
    self endon("disconnect");
    self endon("juggernaut_end");
    if (!isdefined(bundle.var_d1cf3a8ed7c50b01) || bundle.var_d1cf3a8ed7c50b01 <= 0) {
        return;
    }
    config = self.juggcontext.juggconfig;
    self.loadoutfieldupgrade1 = "super_juggernaut";
    thread namespace_727d2aa1d6c72038::perkpackage_initperkpackages();
    var_35c21af2867bac3c = 0;
    pointsneeded = getsuperpointsneeded();
    if (pointsneeded <= 0) {
        return;
    }
    while (var_35c21af2867bac3c < bundle.var_d1cf3a8ed7c50b01) {
        var_35c21af2867bac3c = var_35c21af2867bac3c + 0.1;
        setsuperbasepoints((1 - var_35c21af2867bac3c / bundle.var_d1cf3a8ed7c50b01) * pointsneeded);
        wait(0.1);
    }
    thread jugg_removejuggernaut();
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x27c8
// Size: 0x94
function private jugg_enableoverlay(juggcontext, forcereset) {
    self notify("jugg_mask_on");
    if (!isdefined(self.juggoverlaystatelabel) && !isdefined(self.juggoverlaystate) || istrue(forcereset)) {
        self.juggoverlaystatelabel = "mask_on";
        self.juggoverlaystate = 1;
    }
    self setclientomnvar("ui_assault_suit_on", 0);
    namespace_9abe40d2af041eb2::_setvisibiilityomnvarforkillstreak("juggernaut", self.juggoverlaystatelabel);
    self setclientomnvar(juggcontext.maskomnvar, self.juggoverlaystate);
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2863
// Size: 0x59
function private jugg_disableoverlay(juggcontext, var_a2c3dd1be38a2035) {
    self notify("jugg_mask_off");
    if (!istrue(var_a2c3dd1be38a2035)) {
        self.juggoverlaystatelabel = undefined;
        self.juggoverlaystate = undefined;
    }
    namespace_9abe40d2af041eb2::_setvisibiilityomnvarforkillstreak("juggernaut", "off");
    self setclientomnvar(juggcontext.maskomnvar, 0);
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28c3
// Size: 0x8
function jugg_getmovespeedscalar() {
    return -0.2;
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28d3
// Size: 0x50
function jugg_getminigunweapon() {
    /#
        assertex(namespace_a2f809133c566621::isjuggernaut(), "jugg_getMiniGunWeapon: Trying to get the player's ( jugg ) minigun weapon when not a jugg");
    #/
    var_791c14fbd0f3282d = namespace_d325722f2754c2c4::function_eeaa22f0cd1ff845(self.juggcontext.juggconfig.classstruct.loadoutprimary);
    return var_791c14fbd0f3282d;
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x292b
// Size: 0x35
function jugg_canreload() {
    /#
        assertex(namespace_a2f809133c566621::isjuggernaut(), "jugg_canReload: Trying to see if the player( jugg ) can reload when not a jugg");
    #/
    return istrue(self.juggcontext.juggconfig.usereload);
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2968
// Size: 0x35
function jugg_canuseweaponpickups() {
    /#
        assertex(namespace_a2f809133c566621::isjuggernaut(), "jugg_canUseWeaponPickups: Trying to see if the player( jugg ) can use weapon pickups when not a jugg");
    #/
    return istrue(self.juggcontext.juggconfig.useweaponpickups);
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29a5
// Size: 0x59
function jugg_managestockammo(weapon) {
    self endon("juggernaut_end");
    level endon("game_ended");
    stockammo = self getweaponammostock(weapon);
    thread jugg_watchmanualreload(weapon, stockammo);
    thread jugg_watchammo(weapon, stockammo);
    while (1) {
        self waittill("minigun_restock");
        self setweaponammostock(weapon, stockammo);
    }
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a05
// Size: 0x5b
function jugg_watchmanualreload(weapon, var_81c05719bd3dc08f) {
    self endon("death_or_disconnect");
    self endon("juggernaut_end");
    level endon("game_ended");
    while (1) {
        if (self reloadbuttonpressed()) {
            var_9938d9499df221d6 = self getweaponammostock(weapon);
            if (var_9938d9499df221d6 < var_81c05719bd3dc08f) {
                self notify("minigun_restock");
            }
        }
        waitframe();
    }
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a67
// Size: 0x6a
function jugg_watchammo(weapon, var_81c05719bd3dc08f) {
    self endon("death_or_disconnect");
    self endon("juggernaut_end");
    level endon("game_ended");
    while (1) {
        var_a3254571b0c90796 = self getweaponammoclip(weapon);
        if (var_a3254571b0c90796 == 0) {
            var_9938d9499df221d6 = self getweaponammostock(weapon);
            if (var_9938d9499df221d6 < var_81c05719bd3dc08f) {
                self notify("minigun_restock");
            }
        }
        waitframe();
    }
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ad8
// Size: 0x38
function jugg_addtoactivejugglist() {
    if (!isdefined(level.activejuggernauts)) {
        level.activejuggernauts = [];
    }
    level.activejuggernauts[level.activejuggernauts.size] = self;
    thread jugg_watchforremovejugg();
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b17
// Size: 0x2b
function jugg_watchforremovejugg() {
    level endon("game_ended");
    waittill_any_in_array_return_no_endon_death([0:"juggernaut_end", 1:"disconnect"]);
    jugg_removefromactivejugglist();
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b49
// Size: 0x3c
function jugg_removefromactivejugglist() {
    if (!isdefined(self)) {
        level.activejuggernauts = array_removeundefined(level.activejuggernauts);
    } else {
        level.activejuggernauts = array_remove(level.activejuggernauts, self);
    }
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b8c
// Size: 0xa1
function jugg_watchherodrop() {
    self endon("death_or_disconnect");
    self endon("juggernaut_end");
    level endon("game_ended");
    juggconfig = self.juggcontext.juggconfig;
    juggconfig.herodrop = 0;
    while (1) {
        thread function_12928f267a4a789c(juggconfig);
        self waittill("perform_hero_drop");
        if (!istrue(juggconfig.herodrop)) {
            juggconfig.herodrop = 1;
            self radiusdamage(self.origin, 300, 2000, 500, self, "MOD_CRUSH");
            thread jugg_setherodropscriptable(juggconfig);
        }
    }
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c34
// Size: 0x113
function function_12928f267a4a789c(juggconfig) {
    self endon("death_or_disconnect");
    self endon("juggernaut_end");
    self endon("perform_hero_drop");
    level endon("game_ended");
    var_5db2a98e8bf08146 = 0;
    var_87bd779b6eb7ebb5 = 0.5;
    var_696ca80dcdb269f8 = var_87bd779b6eb7ebb5;
    var_29c3e7e659ebd38c = getdvarint(@"hash_de79e5c6b8a17221");
    if (!isdefined(var_29c3e7e659ebd38c)) {
        var_29c3e7e659ebd38c = 225;
    }
    while (1) {
        if (function_ba71f6475f1c75d9()) {
            var_696ca80dcdb269f8 = var_696ca80dcdb269f8 - level.framedurationseconds;
            if (var_696ca80dcdb269f8 <= 0) {
                var_696ca80dcdb269f8 = 0;
                if (!istrue(var_5db2a98e8bf08146)) {
                    var_c2d7296c1d69dc0f = namespace_2a184fc4902783dc::ray_trace_passed(self.origin, self.origin - (0, 0, var_29c3e7e659ebd38c), self);
                    if (istrue(var_c2d7296c1d69dc0f)) {
                        var_5db2a98e8bf08146 = 1;
                        self setscriptablepartstate("heroDiveVfx", "falling", 0);
                    }
                }
            }
        } else if (istrue(var_5db2a98e8bf08146) && !istrue(juggconfig.herodrop)) {
            var_5db2a98e8bf08146 = 0;
            var_696ca80dcdb269f8 = var_87bd779b6eb7ebb5;
            self setscriptablepartstate("heroDiveVfx", "off", 0);
        }
        waitframe();
    }
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d4e
// Size: 0x49
function function_ba71f6475f1c75d9() {
    if (self ismantling()) {
        return 0;
    }
    if (self isonladder()) {
        return 0;
    }
    if (namespace_f8065cafc523dba5::isinvehicle(1)) {
        return 0;
    }
    if (!self isonground()) {
        if (self isparachuting()) {
            return 0;
        }
        if (self isswimming()) {
            return 0;
        }
        return 1;
    }
    return 0;
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d9f
// Size: 0x55
function jugg_setherodropscriptable(juggconfig) {
    self endon("death_or_disconnect");
    self endon("juggernaut_end");
    level endon("game_ended");
    self setscriptablepartstate("heroDiveVfx", "impact", 0);
    wait(1);
    self setscriptablepartstate("heroDiveVfx", "off", 0);
    juggconfig.herodrop = 0;
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dfb
// Size: 0x1c
function jugg_modifyfalldamage() {
    if (self isskydiving()) {
        self skydive_interrupt();
    }
    self notify("perform_hero_drop");
    return 0;
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e1f
// Size: 0xc1
function jugg_modifyvehicletoplayerdamage(originaldamage, meansofdeath) {
    maxhealth = self.maxhealth;
    config = self.juggcontext.juggconfig;
    damagescale = 0.5;
    var_db8996c1c1e56963 = 10;
    if (isdefined(meansofdeath) && isexplosivedamagemod(meansofdeath)) {
        damagescale = 7;
        var_db8996c1c1e56963 = config.maxvehicledamagedivisor;
    }
    var_cfc4cbfd4bf876c2 = originaldamage * damagescale;
    var_5ecb2f54e00c220e = maxhealth / var_db8996c1c1e56963;
    modifieddamage = namespace_9c840bb9f2ecbf00::roundup(min(var_5ecb2f54e00c220e, var_cfc4cbfd4bf876c2));
    return int(modifieddamage);
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ee8
// Size: 0x15
function jugg_modifyherodroptoplayerdamage(originaldamage) {
    return int(originaldamage / 2);
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f05
// Size: 0x6b
function jugg_canparachute() {
    canparachute = 0;
    var_68b25f2410254f22 = 0;
    /#
        var_68b25f2410254f22 = getdvarint(@"hash_174506584f9d388e", 0) == 1;
    #/
    if (isusingmatchrulesdata() && getmatchrulesdata("commonOption", "allowParachute") || var_68b25f2410254f22 || namespace_cd0b2d039510b38d::gametypesupportsbasejumping() && namespace_cd0b2d039510b38d::mapsupportsbasejumping()) {
        canparachute = 1;
    }
    return canparachute;
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f78
// Size: 0xc0
function function_8e6b2de818370baa(parts, state) {
    if (!isdefined(state)) {
        /#
            /#
                assertmsg("fakeJugg");
            #/
        #/
        return;
    }
    var_3d1c10f919cd5af0 = [];
    if (isarray(parts)) {
        var_3d1c10f919cd5af0 = array_combine(var_3d1c10f919cd5af0, parts);
    } else {
        var_3d1c10f919cd5af0[var_3d1c10f919cd5af0.size] = parts;
    }
    foreach (part in var_3d1c10f919cd5af0) {
        self setscriptablepartstate(part, state, 0);
        /#
            iprintln("game_ended" + part + "music_mx" + state + "mp_vm_arms_jugg_aq_iw9_1_1");
        #/
    }
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x303f
// Size: 0x6d
function function_4217f11ffb352425(damage, shitloc, smeansofdeath, attacker) {
    var_1f48003b8e69560c = function_c0aa811f7b45687c(shitloc, smeansofdeath, attacker);
    if (!isdefined(var_1f48003b8e69560c)) {
        if (isdefined(attacker) && isdefined(shitloc) && isplayer(attacker)) {
            /#
                attacker iprintln("death_or_disconnect" + shitloc);
            #/
        }
        return;
    }
    function_b47072bcd58c0c99(var_1f48003b8e69560c, damage);
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30b3
// Size: 0x11d
function function_c0aa811f7b45687c(shitloc, smeansofdeath, attacker) {
    var_1f48003b8e69560c = undefined;
    if (isheadshot(shitloc, smeansofdeath, attacker)) {
        var_1f48003b8e69560c = "head_health";
    } else if (istorsouppershot(shitloc, smeansofdeath, attacker)) {
        var_1f48003b8e69560c = "torso_upper_health";
    } else if (function_77ed09d75c0c7165(shitloc, smeansofdeath, attacker)) {
        var_1f48003b8e69560c = "torso_lower_health";
    } else if (function_24278eb0ec1e2953(shitloc, smeansofdeath, attacker)) {
        var_1f48003b8e69560c = "right_upper_arm_health";
    } else if (function_bf1efc7185168448(shitloc, smeansofdeath, attacker)) {
        var_1f48003b8e69560c = "right_lower_arm_health";
    } else if (function_82850161196df912(shitloc, smeansofdeath, attacker)) {
        var_1f48003b8e69560c = "left_upper_arm_health";
    } else if (function_d7395809e0049a49(shitloc, smeansofdeath, attacker)) {
        var_1f48003b8e69560c = "left_lower_arm_health";
    } else if (function_c0bd16deeb47765b(shitloc, smeansofdeath, attacker)) {
        var_1f48003b8e69560c = "right_leg_health";
    } else if (function_f15a47528fffce28(shitloc, smeansofdeath, attacker)) {
        var_1f48003b8e69560c = "left_leg_health";
    }
    /#
        if (isdefined(shitloc) && shitloc != "<unknown string>" && isdefined(attacker) && isplayer(attacker)) {
            attacker iprintlnbold("<unknown string>" + shitloc);
        }
    #/
    return var_1f48003b8e69560c;
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x31d8
// Size: 0x13a
function private function_b47072bcd58c0c99(part, damage) {
    if (isdefined(self.juggcontext.var_5f03cad2b199e1bc)) {
        self [[ self.juggcontext.var_5f03cad2b199e1bc ]](part, damage);
    }
    if (isdefined(self.juggcontext.var_46ad94f231cd4ef3[part])) {
        self.juggcontext.var_46ad94f231cd4ef3[part] = self.juggcontext.var_46ad94f231cd4ef3[part] - damage;
        if (part == "head_health") {
            if (self.juggcontext.var_46ad94f231cd4ef3[part] <= 0) {
                self.juggcontext.var_46ad94f231cd4ef3[part] = undefined;
                function_8e6b2de818370baa(part, "destroyed");
            } else if (self.juggcontext.var_46ad94f231cd4ef3[part] <= 50) {
                function_8e6b2de818370baa(part, "damaged");
            }
        } else if (self.juggcontext.var_46ad94f231cd4ef3[part] <= 0) {
            self.juggcontext.var_46ad94f231cd4ef3[part] = undefined;
            function_8e6b2de818370baa(part, "damaged");
        }
    }
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3319
// Size: 0x40
function private function_5b7c34dbc50c3c4e() {
    self endon("death_or_disconnect");
    self endon("juggernaut_end");
    level endon("game_ended");
    function_8e6b2de818370baa(level.var_13819795c6ee9ff8, "pristine");
    /#
        childthread function_5e9c6b97e4c3c059();
        childthread function_59469cc44ca7fa81();
    #/
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3360
// Size: 0x96
function private function_a585b2993726d3b(config, weaponref) {
    if (!isdefined(weaponref) || weaponref == "none") {
        return 0;
    }
    if (isdefined(config.classstruct.loadoutprimary) && weaponref == config.classstruct.loadoutprimary) {
        return 1;
    }
    if (isdefined(config.classstruct.loadoutsecondary) && weaponref == config.classstruct.loadoutsecondary) {
        return 1;
    }
    return 0;
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x33fe
// Size: 0x3fb
function private function_5e9c6b97e4c3c059() {
    /#
        juggcontext = self.juggcontext;
        juggconfig = juggcontext.juggconfig;
        while (1) {
            var_5e13789652ec8a23 = getdvarint(@"hash_63bf655a03b825eb", 0);
            if (!var_5e13789652ec8a23) {
                waitframe();
                continue;
            }
            var_be4f784126f5409d = function_354f191d8b1ec22d(var_5e13789652ec8a23 - 1);
            var_f05a031dc1df54df = "<unknown string>";
            var_5aa83db0e5d721db = var_be4f784126f5409d;
            if (var_be4f784126f5409d == "<unknown string>") {
                var_5aa83db0e5d721db = "<unknown string>";
            }
            function_8e6b2de818370baa(var_f05a031dc1df54df, var_5aa83db0e5d721db);
            var_27058b2d51dcf191 = "<unknown string>";
            var_e0aad72b2cb25382 = var_be4f784126f5409d;
            if (var_be4f784126f5409d == "<unknown string>") {
                var_e0aad72b2cb25382 = "<unknown string>";
            }
            function_8e6b2de818370baa(var_27058b2d51dcf191, var_e0aad72b2cb25382);
            var_3d1c10f919cd5af0 = [0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>", 3:"<unknown string>", 4:"<unknown string>", 5:"<unknown string>", 6:"<unknown string>", 7:"<unknown string>", 8:"<unknown string>", 9:"<unknown string>", 10:"<unknown string>", 11:"<unknown string>", 12:"<unknown string>", 13:"<unknown string>", 14:"<unknown string>", 15:"<unknown string>", 16:"<unknown string>"];
            function_8e6b2de818370baa(var_3d1c10f919cd5af0, var_be4f784126f5409d);
            if (var_be4f784126f5409d == "<unknown string>") {
                juggcontext.var_46ad94f231cd4ef3["<unknown string>"] = ter_op(isdefined(juggconfig.head_health), juggconfig.head_health, 100);
                juggcontext.var_46ad94f231cd4ef3["<unknown string>"] = ter_op(isdefined(juggconfig.torso_upper_health), juggconfig.torso_upper_health, 100);
                juggcontext.var_46ad94f231cd4ef3["<unknown string>"] = ter_op(isdefined(juggconfig.torso_lower_health), juggconfig.torso_lower_health, 100);
                juggcontext.var_46ad94f231cd4ef3["<unknown string>"] = ter_op(isdefined(juggconfig.right_upper_arm_health), juggconfig.right_upper_arm_health, 100);
                juggcontext.var_46ad94f231cd4ef3["<unknown string>"] = ter_op(isdefined(juggconfig.right_lower_arm_health), juggconfig.right_lower_arm_health, 100);
                juggcontext.var_46ad94f231cd4ef3["<unknown string>"] = ter_op(isdefined(juggconfig.left_upper_arm_health), juggconfig.left_upper_arm_health, 100);
                juggcontext.var_46ad94f231cd4ef3["<unknown string>"] = ter_op(isdefined(juggconfig.left_lower_arm_health), juggconfig.left_lower_arm_health, 100);
                juggcontext.var_46ad94f231cd4ef3["<unknown string>"] = ter_op(isdefined(juggconfig.right_leg_health), juggconfig.right_leg_health, 100);
                juggcontext.var_46ad94f231cd4ef3["<unknown string>"] = ter_op(isdefined(juggconfig.left_leg_health), juggconfig.left_leg_health, 100);
            } else {
                juggcontext.var_46ad94f231cd4ef3["<unknown string>"] = undefined;
                juggcontext.var_46ad94f231cd4ef3["<unknown string>"] = undefined;
                juggcontext.var_46ad94f231cd4ef3["<unknown string>"] = undefined;
                juggcontext.var_46ad94f231cd4ef3["<unknown string>"] = undefined;
                juggcontext.var_46ad94f231cd4ef3["<unknown string>"] = undefined;
                juggcontext.var_46ad94f231cd4ef3["<unknown string>"] = undefined;
                juggcontext.var_46ad94f231cd4ef3["<unknown string>"] = undefined;
                juggcontext.var_46ad94f231cd4ef3["<unknown string>"] = undefined;
                juggcontext.var_46ad94f231cd4ef3["<unknown string>"] = undefined;
            }
            setdvar(@"hash_63bf655a03b825eb", 0);
            waitframe();
        }
    #/
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3800
// Size: 0x9b
function private function_59469cc44ca7fa81() {
    /#
        var_be4f784126f5409d = "<unknown string>";
        while (1) {
            var_d131f91d9bea09f3 = getdvarint(@"hash_ae2c4f86ffaf24db", 0);
            if (!var_d131f91d9bea09f3) {
                waitframe();
                continue;
            }
            var_1649908c7ce1a12d = function_1e84eeb2a6f4129d(var_d131f91d9bea09f3 - 1);
            if (var_be4f784126f5409d == "<unknown string>") {
                var_be4f784126f5409d = "<unknown string>";
                if (var_1649908c7ce1a12d == "<unknown string>") {
                    var_be4f784126f5409d = "<unknown string>";
                }
            } else {
                var_be4f784126f5409d = "<unknown string>";
            }
            function_8e6b2de818370baa(var_1649908c7ce1a12d, var_be4f784126f5409d);
            setdvar(@"hash_ae2c4f86ffaf24db", 0);
            waitframe();
        }
    #/
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x38a2
// Size: 0x1b
function private function_354f191d8b1ec22d(index) {
    /#
        return level.var_ed61c38f5c8bb414[index];
    #/
}

// Namespace juggernaut/namespace_68f1873625691c6
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x38c4
// Size: 0x1b
function private function_1e84eeb2a6f4129d(index) {
    /#
        return level.var_13819795c6ee9ff8[index];
    #/
}

