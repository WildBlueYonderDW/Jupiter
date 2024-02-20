// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\loot.gsc;
#using scripts\mp\passives.gsc;
#using scripts\mp\hud_message.gsc;

#namespace weaponpassives;

// Namespace weaponpassives/namespace_bc06084df083b232
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x110
// Size: 0xf
function weaponpassivesinit() {
    namespace_71eef510d7f364cf::registeronplayerspawncallback(&onplayerspawnedweaponpassives);
}

// Namespace weaponpassives/namespace_bc06084df083b232
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x126
// Size: 0xb
function onplayerspawnedweaponpassives() {
    thread watchweaponchanged();
}

// Namespace weaponpassives/namespace_bc06084df083b232
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x138
// Size: 0x39
function applyweaponchange() {
    newweapon = self.currentweapon;
    if (isdefined(newweapon) && newweapon.basename != "none") {
        giveweaponpassives(newweapon);
    }
}

// Namespace weaponpassives/namespace_bc06084df083b232
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x178
// Size: 0x2a
function watchweaponchanged() {
    self endon("death_or_disconnect");
    while (1) {
        applyweaponchange();
        waittill_either("weapon_change", "giveLoadout");
    }
}

// Namespace weaponpassives/namespace_bc06084df083b232
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a9
// Size: 0x94
function giveweaponpassives(weapon) {
    clearpassives();
    passives = namespace_3f0ea7483345a2c0::getpassivesforweapon(weapon.basename, weapon.variantid);
    if (isdefined(passives)) {
        foreach (passive in passives) {
            giveplayerpassive(passive);
        }
    }
    self notify("weapon_passives_given");
}

// Namespace weaponpassives/namespace_bc06084df083b232
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x244
// Size: 0x2a
function giveplayerpassive(passive) {
    giveperk(passive);
    self.weaponpassives[self.weaponpassives.size] = passive;
}

// Namespace weaponpassives/namespace_bc06084df083b232
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x275
// Size: 0x6f
function clearpassives() {
    if (isdefined(self.weaponpassives)) {
        foreach (passive in self.weaponpassives) {
            removeperk(passive);
        }
    }
    self.weaponpassives = [];
}

// Namespace weaponpassives/namespace_bc06084df083b232
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2eb
// Size: 0xd
function forgetpassives() {
    self.weaponpassives = [];
}

// Namespace weaponpassives/namespace_bc06084df083b232
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ff
// Size: 0x43
function definepassivevalue(link) {
    if (!isdefined(self.passivevalues)) {
        self.passivevalues = [];
    }
    if (!isdefined(self.passivevalues[link])) {
        self.passivevalues[link] = 0;
    }
}

// Namespace weaponpassives/namespace_bc06084df083b232
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x349
// Size: 0x1f
function getpassivevalue(link) {
    definepassivevalue(link);
    return self.passivevalues[link];
}

// Namespace weaponpassives/namespace_bc06084df083b232
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x370
// Size: 0x29
function setpassivevalue(link, value) {
    definepassivevalue(link);
    self.passivevalues[link] = value;
}

// Namespace weaponpassives/namespace_bc06084df083b232
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3a0
// Size: 0x3b
function teamsmatch(var_57c86efa51e1f301, targetplayer) {
    if (level.teambased) {
        return (var_57c86efa51e1f301.team == targetplayer.team);
    }
    return var_57c86efa51e1f301 == targetplayer;
}

// Namespace weaponpassives/namespace_bc06084df083b232
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3e3
// Size: 0x14
function updateweaponpassivesonuse(player, objweapon) {
    
}

// Namespace weaponpassives/namespace_bc06084df083b232
// Params a, eflags: 0x0
// Checksum 0x0, Offset: 0x3fe
// Size: 0x54
function updateweaponpassivesondamage(victim, attacker, damage, smeansofdeath, objweapon, var_96586eec2364c35b, var_483b72bbc1109ab2, shitloc, inflictor, query) {
    
}

// Namespace weaponpassives/namespace_bc06084df083b232
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x459
// Size: 0xc
function loadoutweapongiven(objweapon) {
    
}

// Namespace weaponpassives/namespace_bc06084df083b232
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46c
// Size: 0x44
function updateweaponpassivesonkill(einflictor, attacker, victim, idamage, smeansofdeath, objweapon, shitloc, vdir) {
    
}

// Namespace weaponpassives/namespace_bc06084df083b232
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4b7
// Size: 0x85
function testpassivemessage(passive, suffix) {
    if (!isdefined(suffix)) {
        suffix = "";
    }
    var_77bdbf78236f1f9b = 0;
    messageref = namespace_d42f0311f511b910::getpassivemessage(passive);
    var_bcedf03b3e6abcb1 = "";
    if (isdefined(messageref)) {
        var_bcedf03b3e6abcb1 = messageref + suffix;
        var_77bdbf78236f1f9b = namespace_44abc05161e2e2cb::testmiscmessage(var_bcedf03b3e6abcb1);
    }
    /#
        if (var_77bdbf78236f1f9b) {
            println("<unknown string>" + var_bcedf03b3e6abcb1);
        } else {
            println("<unknown string>" + var_bcedf03b3e6abcb1);
        }
    #/
}

// Namespace weaponpassives/namespace_bc06084df083b232
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x543
// Size: 0x69
function checkpassivemessage(passive, suffix) {
    if (!isdefined(suffix)) {
        suffix = "";
    }
    messageref = namespace_d42f0311f511b910::getpassivemessage(passive);
    if (isdefined(messageref)) {
        if (isendstr(suffix, "_camo")) {
            var_b545d8c9b1eb9f0e = strip_suffix(suffix, "_camo");
            suffix = var_b545d8c9b1eb9f0e;
        }
        namespace_44abc05161e2e2cb::showmiscmessage(messageref + suffix);
    }
}

// Namespace weaponpassives/namespace_bc06084df083b232
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5b3
// Size: 0x4c
function getpassivedeathwatching(attacker, key) {
    if (!isdefined(attacker.passivedeathwatcher)) {
        return 0;
    }
    if (!isdefined(attacker.passivedeathwatcher[key])) {
        return 0;
    }
    if (attacker.passivedeathwatcher[key]) {
        return 1;
    }
    return 0;
}

// Namespace weaponpassives/namespace_bc06084df083b232
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x607
// Size: 0x47
function setpassivedeathwatching(attacker, key, enabled) {
    if (!isdefined(attacker.passivedeathwatcher)) {
        attacker.passivedeathwatcher = [];
    }
    attacker.passivedeathwatcher[key] = enabled;
}

// Namespace weaponpassives/namespace_bc06084df083b232
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x655
// Size: 0x3d
function clearpassivedeathwatching(attacker, key) {
    if (!isdefined(attacker.passivedeathwatcher)) {
        attacker.passivedeathwatcher = [];
    }
    attacker.passivedeathwatcher[key] = undefined;
}

// Namespace weaponpassives/namespace_bc06084df083b232
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x699
// Size: 0x9b
function setstackvalues(id, stacksmax, var_4d8375d9e2e75e74, decaytime) {
    if (!isdefined(self.stackvalues)) {
        self.stackvalues = [];
    }
    if (!isdefined(self.stackvalues[id])) {
        values = spawnstruct();
        values.id = id;
        values.stacksmax = stacksmax;
        values.stackscurrent = var_4d8375d9e2e75e74;
        values.decaytime = decaytime;
        self.stackvalues[id] = values;
    }
}

// Namespace weaponpassives/namespace_bc06084df083b232
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73b
// Size: 0x43
function getstackvalues(id) {
    if (!isdefined(self.stackvalues)) {
        return undefined;
    }
    if (!isdefined(self.stackvalues[id])) {
        return undefined;
    }
    values = self.stackvalues[id];
    return values;
}

// Namespace weaponpassives/namespace_bc06084df083b232
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x786
// Size: 0x30
function getstackcount(id) {
    values = getstackvalues(id);
    if (!isdefined(values)) {
        return 0;
    }
    return values.stackscurrent;
}

// Namespace weaponpassives/namespace_bc06084df083b232
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7be
// Size: 0x14
function addstackcount(id, amount) {
    
}

