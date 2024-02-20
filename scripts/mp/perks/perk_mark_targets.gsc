// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\player.gsc;

#namespace namespace_70e675ecd54f03da;

// Namespace namespace_70e675ecd54f03da/namespace_293239a8fbb98e69
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc
// Size: 0x3
function marktarget_init() {
    
}

// Namespace namespace_70e675ecd54f03da/namespace_293239a8fbb98e69
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe6
// Size: 0x72
function marktarget_run(victim, objweapon, smeansofdeath) {
    if (isbulletdamage(smeansofdeath) && isplayer(victim) && isreallyalive(victim) && victim.team != self.team && isdefined(objweapon) && !objweapon.isalternate) {
        thread marktarget_execute(victim);
    }
}

// Namespace namespace_70e675ecd54f03da/namespace_293239a8fbb98e69
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15f
// Size: 0x3e
function marktarget_execute(target) {
    target notify("delayHealing_started");
    target endon("delayHealing_started");
    target.healthregendisabled = 1;
    tagmarkedplayer(target);
    if (isdefined(target)) {
        target removemarkfromtarget();
    }
}

// Namespace namespace_70e675ecd54f03da/namespace_293239a8fbb98e69
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a4
// Size: 0x71
function tagmarkedplayer(target) {
    self endon("death_or_disconnect");
    target endon("death_or_disconnect");
    var_79e98e0273d56283 = 1;
    if (target _hasperk("specialty_frangible_resist")) {
        var_79e98e0273d56283 = var_79e98e0273d56283 + getdvarfloat(@"hash_cfc1f984f402559f", -0.5);
    }
    var_97384b887ab6a3c0 = gettime() + 3500 * var_79e98e0273d56283;
    while (gettime() < var_97384b887ab6a3c0) {
        waitframe();
    }
}

// Namespace namespace_70e675ecd54f03da/namespace_293239a8fbb98e69
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21c
// Size: 0xd
function removemarkfromtarget() {
    self.healthregendisabled = undefined;
}

