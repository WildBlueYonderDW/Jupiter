// mwiii decomp prototype
#using script_104e3370b024f998;
#using scripts\mp\utility\player.gsc;
#using scripts\engine\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\equipment\gas_grenade.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\cp_mp\killstreaks\white_phosphorus.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using script_6a5d3bf7a5b7064a;

#namespace namespace_5e1ef10a2cd37246;

// Namespace namespace_5e1ef10a2cd37246/namespace_314b181252bf1520
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d3
// Size: 0x49
function function_41c4a42ae28c7e16() {
    if (!isdefined(level.var_b35fc6d4a1b9424f)) {
        return;
    }
    if (!isdefined(level.var_b35fc6d4a1b9424f.powers)) {
        return;
    }
    level.var_b35fc6d4a1b9424f.powers["melee"] = function_ea71e04a720a17ae();
}

// Namespace namespace_5e1ef10a2cd37246/namespace_314b181252bf1520
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x323
// Size: 0xbb
function function_ea71e04a720a17ae() {
    config = spawnstruct();
    config.maxhealth = 1000;
    config.startinghealth = config.maxhealth;
    config.movespeedscalar = getdvarfloat(@"hash_8e4a9b19254b5834", 0.5);
    config.maxvehicledamagedivisor = 3;
    config.classstruct = function_fb01d574364a561();
    config.var_e83263899daaa528 = &function_d3796b128ec7a952;
    config.perks = [0:"specialty_huntmaster", 1:"specialty_tac_resist", 2:"specialty_hustle", 3:"specialty_eod"];
    return config;
}

// Namespace namespace_5e1ef10a2cd37246/namespace_314b181252bf1520
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e6
// Size: 0x3f
function function_8db15a70b73b907e() {
    /#
        assertex(isdefined(level.var_b35fc6d4a1b9424f.powers["melee"]));
    #/
    return level.var_b35fc6d4a1b9424f.powers["melee"];
}

// Namespace namespace_5e1ef10a2cd37246/namespace_314b181252bf1520
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42d
// Size: 0x66
function function_d3796b128ec7a952(isactivated) {
    if (isactivated) {
        var_6944da8624ccdf1d = [0:"ads", 1:"weapon_switch", 2:"weapon_pickup", 3:"weapon_switch_clip", 4:"reload"];
        namespace_1cd9f6896754adb0::function_59c053b89257bc95("melee_superpower", var_6944da8624ccdf1d, 0);
    } else {
        namespace_1cd9f6896754adb0::function_c9d0b43701bdba00("melee_superpower");
    }
}

// Namespace namespace_5e1ef10a2cd37246/namespace_314b181252bf1520
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49a
// Size: 0x26e
function function_c54f7da664700b4b() {
    /#
        assert(isreallyalive(self));
    #/
    self.var_2bb368acf8b4df7d = 1;
    namespace_d39a86483d995ed1::gas_updateplayereffects();
    var_912cd62cf459e05c = function_8db15a70b73b907e();
    var_2e37bfd92800e030 = spawnstruct();
    var_2e37bfd92800e030.config = var_912cd62cf459e05c;
    var_2e37bfd92800e030.prevhealth = self.health;
    var_2e37bfd92800e030.maxhealth = self.maxhealth;
    var_2e37bfd92800e030.prevspeedscale = ter_op(isdefined(self.playerstreakspeedscale), self.playerstreakspeedscale, 0);
    var_2e37bfd92800e030.maskomnvar = "ui_gas_mask_juggernaut";
    self.maxhealth = var_912cd62cf459e05c.maxhealth;
    self.health = var_912cd62cf459e05c.startinghealth;
    namespace_3bbb5a98b932c46f::savetogglescopestates();
    namespace_3bbb5a98b932c46f::savealtstates();
    if (isdefined(level.clearbrinventory)) {
        self [[ level.clearbrinventory ]]();
    }
    self.lastdroppableweaponobj = undefined;
    if (isdefined(var_912cd62cf459e05c.classstruct)) {
        var_2e37bfd92800e030.prevclass = self.lastclass;
        var_2e37bfd92800e030.prevclassstruct = self.classstruct;
        namespace_d19129e4fa5d176::loadout_updateclass(var_912cd62cf459e05c.classstruct, "superpower");
        namespace_d19129e4fa5d176::preloadandqueueclassstruct(var_912cd62cf459e05c.classstruct, 1, 1);
        namespace_d19129e4fa5d176::giveloadout(self.team, "superpower", 0, 1);
    }
    foreach (perk in var_912cd62cf459e05c.perks) {
        namespace_82dcd1d5ae30ff7::giveperk(perk);
    }
    self [[ var_912cd62cf459e05c.var_e83263899daaa528 ]](1);
    namespace_e765f0aad2368473::enableloopingcoughaudiosupression();
    self.playerstreakspeedscale = var_912cd62cf459e05c.movespeedscalar;
    namespace_3bbb5a98b932c46f::updatemovespeedscale();
    self.var_eeeda506d0a854e = var_2e37bfd92800e030;
    function_d0d55fbccb850211();
    namespace_9abe40d2af041eb2::function_3f55c1fb553a4775(self);
    self notify("tempV_start", "melee");
    thread function_3a82a23975071040();
    thread function_4a4634fd5341faa5();
    thread function_ebbdb959c319dbf4();
    thread function_4bde88943fe1ed4a(self.var_eeeda506d0a854e);
    namespace_4887422e77f3514e::onexitdeathsdoor(1);
}

// Namespace namespace_5e1ef10a2cd37246/namespace_314b181252bf1520
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70f
// Size: 0x59
function function_fb01d574364a561() {
    classstruct = namespace_d19129e4fa5d176::loadout_getclassstruct();
    classstruct.loadoutarchetype = "archetype_assault";
    classstruct.loadoutprimary = "iw9_me_superfists_mp";
    classstruct.loadoutsecondary = "none";
    classstruct.loadoutequipmentprimary = "equip_throwing_knife";
    return classstruct;
}

// Namespace namespace_5e1ef10a2cd37246/namespace_314b181252bf1520
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x770
// Size: 0x20
function function_3a82a23975071040() {
    self endon("disconnect");
    level endon("game_ended");
    self waittill("death");
    function_9c66adbb62a5ef8();
}

// Namespace namespace_5e1ef10a2cd37246/namespace_314b181252bf1520
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x797
// Size: 0x58
function function_4a4634fd5341faa5() {
    self endon("disconnect");
    self endon("tempV_meleeEnd");
    level waittill("game_ended");
    self.maxhealth = self.var_eeeda506d0a854e.prevmaxhealth;
    self.health = self.var_eeeda506d0a854e.prevhealth;
    function_9c66adbb62a5ef8();
}

// Namespace namespace_5e1ef10a2cd37246/namespace_314b181252bf1520
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f6
// Size: 0x5a
function function_ebbdb959c319dbf4() {
    level endon("game_ended");
    self endon("tempV_meleeEnd");
    var_eeeda506d0a854e = self.var_eeeda506d0a854e;
    self waittill("disconnect");
    if (isdefined(self)) {
        self.maxhealth = var_eeeda506d0a854e.prevmaxhealth;
        self.health = var_eeeda506d0a854e.prevhealth;
    }
}

// Namespace namespace_5e1ef10a2cd37246/namespace_314b181252bf1520
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x857
// Size: 0x91
function function_d0d55fbccb850211() {
    self notify("tempV_melee_mask_on");
    var_eeeda506d0a854e = self.var_eeeda506d0a854e;
    if (!isdefined(self.var_ffa2b1ee380f2ea4) && !isdefined(self.var_f7dd37e04de8ff0e)) {
        self.var_ffa2b1ee380f2ea4 = "mask_on";
        self.var_f7dd37e04de8ff0e = 1;
    }
    self setclientomnvar("ui_assault_suit_on", 0);
    namespace_9abe40d2af041eb2::_setvisibiilityomnvarforkillstreak("juggernaut", self.var_ffa2b1ee380f2ea4);
    self setclientomnvar(var_eeeda506d0a854e.maskomnvar, self.var_f7dd37e04de8ff0e);
}

// Namespace namespace_5e1ef10a2cd37246/namespace_314b181252bf1520
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ef
// Size: 0x59
function function_1210f1bc7a0d8940(var_eeeda506d0a854e, var_a2c3dd1be38a2035) {
    self notify("tempV_melee_mask_off");
    if (!istrue(var_a2c3dd1be38a2035)) {
        self.var_ffa2b1ee380f2ea4 = undefined;
        self.var_f7dd37e04de8ff0e = undefined;
    }
    namespace_9abe40d2af041eb2::_setvisibiilityomnvarforkillstreak("juggernaut", "off");
    self setclientomnvar(var_eeeda506d0a854e.maskomnvar, 0);
}

// Namespace namespace_5e1ef10a2cd37246/namespace_314b181252bf1520
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x94f
// Size: 0x1a8
function function_9c66adbb62a5ef8() {
    if (!isdefined(self)) {
        return;
    }
    /#
        assert(istrue(self.var_2bb368acf8b4df7d));
    #/
    /#
        assert(isdefined(self.var_eeeda506d0a854e));
    #/
    self notify("tempV_end");
    var_eeeda506d0a854e = self.var_eeeda506d0a854e;
    var_912cd62cf459e05c = var_eeeda506d0a854e.config;
    self.musicplaying = undefined;
    self.var_a23031c04df01bf = undefined;
    self.var_59651a2893429638 = undefined;
    function_1210f1bc7a0d8940(self.var_eeeda506d0a854e);
    self [[ var_912cd62cf459e05c.var_e83263899daaa528 ]](1);
    namespace_9abe40d2af041eb2::function_17576a4cdcd447a7(self);
    if (isreallyalive(self)) {
        self.maxhealth = var_eeeda506d0a854e.prevmaxhealth;
        self.health = var_eeeda506d0a854e.prevhealth;
        namespace_e765f0aad2368473::disableloopingcoughaudiosupression();
        if (isdefined(var_912cd62cf459e05c.classstruct)) {
            namespace_d19129e4fa5d176::respawnitems_assignrespawnitems(var_eeeda506d0a854e.respawnitems);
            namespace_d19129e4fa5d176::giveloadout(self.team, var_eeeda506d0a854e.prevclass, 0, 1, 1);
        }
        foreach (perk, unused in var_912cd62cf459e05c.perks) {
            namespace_82dcd1d5ae30ff7::removeperk(perk);
        }
    }
    self.playerstreakspeedscale = var_eeeda506d0a854e.prevspeedscale;
    namespace_3bbb5a98b932c46f::updatemovespeedscale();
    self.var_eeeda506d0a854e = undefined;
    self.var_2bb368acf8b4df7d = undefined;
}

// Namespace namespace_5e1ef10a2cd37246/namespace_314b181252bf1520
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xafe
// Size: 0x188
function function_4bde88943fe1ed4a(var_eeeda506d0a854e) {
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
            self setclientomnvar(var_eeeda506d0a854e.maskomnvar, var_654eba19046746e8);
            var_ea0a3076fb747a79 = var_654eba19046746e8;
            self.var_ffa2b1ee380f2ea4 = var_4f287978d27b5156;
            self.var_f7dd37e04de8ff0e = var_654eba19046746e8;
        }
    }
}

