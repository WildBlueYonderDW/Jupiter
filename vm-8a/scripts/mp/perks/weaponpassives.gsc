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

// Namespace weaponpassives / scripts\mp\perks\weaponpassives
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x110
// Size: 0xe
function weaponpassivesinit() {
    scripts\mp\utility\spawn_event_aggregator::registeronplayerspawncallback(&onplayerspawnedweaponpassives);
}

// Namespace weaponpassives / scripts\mp\perks\weaponpassives
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x126
// Size: 0xa
function onplayerspawnedweaponpassives() {
    thread watchweaponchanged();
}

// Namespace weaponpassives / scripts\mp\perks\weaponpassives
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x138
// Size: 0x38
function applyweaponchange() {
    newweapon = self.currentweapon;
    if (isdefined(newweapon) && newweapon.basename != "none") {
        giveweaponpassives(newweapon);
    }
}

// Namespace weaponpassives / scripts\mp\perks\weaponpassives
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x178
// Size: 0x29
function watchweaponchanged() {
    self endon("death_or_disconnect");
    while (true) {
        applyweaponchange();
        waittill_either("weapon_change", "giveLoadout");
    }
}

// Namespace weaponpassives / scripts\mp\perks\weaponpassives
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a9
// Size: 0x93
function giveweaponpassives(weapon) {
    clearpassives();
    passives = scripts\mp\loot::getpassivesforweapon(weapon.basename, weapon.variantid);
    if (isdefined(passives)) {
        foreach (passive in passives) {
            giveplayerpassive(passive);
        }
    }
    self notify("weapon_passives_given");
}

// Namespace weaponpassives / scripts\mp\perks\weaponpassives
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x244
// Size: 0x29
function giveplayerpassive(passive) {
    giveperk(passive);
    self.weaponpassives[self.weaponpassives.size] = passive;
}

// Namespace weaponpassives / scripts\mp\perks\weaponpassives
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x275
// Size: 0x6e
function clearpassives() {
    if (isdefined(self.weaponpassives)) {
        foreach (passive in self.weaponpassives) {
            removeperk(passive);
        }
    }
    self.weaponpassives = [];
}

// Namespace weaponpassives / scripts\mp\perks\weaponpassives
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2eb
// Size: 0xc
function forgetpassives() {
    self.weaponpassives = [];
}

// Namespace weaponpassives / scripts\mp\perks\weaponpassives
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ff
// Size: 0x42
function definepassivevalue(link) {
    if (!isdefined(self.passivevalues)) {
        self.passivevalues = [];
    }
    if (!isdefined(self.passivevalues[link])) {
        self.passivevalues[link] = 0;
    }
}

// Namespace weaponpassives / scripts\mp\perks\weaponpassives
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x349
// Size: 0x1e
function getpassivevalue(link) {
    definepassivevalue(link);
    return self.passivevalues[link];
}

// Namespace weaponpassives / scripts\mp\perks\weaponpassives
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x370
// Size: 0x28
function setpassivevalue(link, value) {
    definepassivevalue(link);
    self.passivevalues[link] = value;
}

// Namespace weaponpassives / scripts\mp\perks\weaponpassives
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3a0
// Size: 0x3a
function teamsmatch(sourceplayer, targetplayer) {
    if (level.teambased) {
        return (sourceplayer.team == targetplayer.team);
    }
    return sourceplayer == targetplayer;
}

// Namespace weaponpassives / scripts\mp\perks\weaponpassives
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3e3
// Size: 0x13
function updateweaponpassivesonuse(player, objweapon) {
    
}

// Namespace weaponpassives / scripts\mp\perks\weaponpassives
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x3fe
// Size: 0x53
function updateweaponpassivesondamage(victim, attacker, damage, smeansofdeath, objweapon, impactpoint, impactdir, shitloc, inflictor, query) {
    
}

// Namespace weaponpassives / scripts\mp\perks\weaponpassives
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x459
// Size: 0xb
function loadoutweapongiven(objweapon) {
    
}

// Namespace weaponpassives / scripts\mp\perks\weaponpassives
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46c
// Size: 0x43
function updateweaponpassivesonkill(einflictor, attacker, victim, idamage, smeansofdeath, objweapon, shitloc, vdir) {
    
}

// Namespace weaponpassives / scripts\mp\perks\weaponpassives
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4b7
// Size: 0x84
function testpassivemessage(passive, suffix) {
    if (!isdefined(suffix)) {
        suffix = "";
    }
    messagesuccess = 0;
    messageref = scripts\mp\passives::getpassivemessage(passive);
    messagestring = "";
    if (isdefined(messageref)) {
        messagestring = messageref + suffix;
        messagesuccess = scripts\mp\hud_message::testmiscmessage(messagestring);
    }
    /#
        if (messagesuccess) {
            println("<dev string:x1c>" + messagestring);
            return;
        }
        println("<dev string:x39>" + messagestring);
    #/
}

// Namespace weaponpassives / scripts\mp\perks\weaponpassives
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x543
// Size: 0x68
function checkpassivemessage(passive, suffix) {
    if (!isdefined(suffix)) {
        suffix = "";
    }
    messageref = scripts\mp\passives::getpassivemessage(passive);
    if (isdefined(messageref)) {
        if (isendstr(suffix, "_camo")) {
            tempstring = strip_suffix(suffix, "_camo");
            suffix = tempstring;
        }
        scripts\mp\hud_message::showmiscmessage(messageref + suffix);
    }
}

// Namespace weaponpassives / scripts\mp\perks\weaponpassives
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5b3
// Size: 0x4b
function getpassivedeathwatching(attacker, key) {
    if (!isdefined(attacker.passivedeathwatcher)) {
        return false;
    }
    if (!isdefined(attacker.passivedeathwatcher[key])) {
        return false;
    }
    if (attacker.passivedeathwatcher[key]) {
        return true;
    }
    return false;
}

// Namespace weaponpassives / scripts\mp\perks\weaponpassives
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x607
// Size: 0x46
function setpassivedeathwatching(attacker, key, enabled) {
    if (!isdefined(attacker.passivedeathwatcher)) {
        attacker.passivedeathwatcher = [];
    }
    attacker.passivedeathwatcher[key] = enabled;
}

// Namespace weaponpassives / scripts\mp\perks\weaponpassives
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x655
// Size: 0x3c
function clearpassivedeathwatching(attacker, key) {
    if (!isdefined(attacker.passivedeathwatcher)) {
        attacker.passivedeathwatcher = [];
    }
    attacker.passivedeathwatcher[key] = undefined;
}

// Namespace weaponpassives / scripts\mp\perks\weaponpassives
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x699
// Size: 0x9a
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

// Namespace weaponpassives / scripts\mp\perks\weaponpassives
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73b
// Size: 0x42
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

// Namespace weaponpassives / scripts\mp\perks\weaponpassives
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x786
// Size: 0x2f
function getstackcount(id) {
    values = getstackvalues(id);
    if (!isdefined(values)) {
        return 0;
    }
    return values.stackscurrent;
}

// Namespace weaponpassives / scripts\mp\perks\weaponpassives
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7be
// Size: 0x13
function addstackcount(id, amount) {
    
}

