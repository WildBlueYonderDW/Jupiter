#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\player.gsc;

#namespace namespace_70e675ecd54f03da;

// Namespace namespace_70e675ecd54f03da / scripts\mp\perks\perk_mark_targets
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x105
// Size: 0x2
function marktarget_init() {
    
}

// Namespace namespace_70e675ecd54f03da / scripts\mp\perks\perk_mark_targets
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x10f
// Size: 0x71
function marktarget_run(victim, objweapon, smeansofdeath) {
    if (isbulletdamage(smeansofdeath) && isplayer(victim) && isreallyalive(victim) && victim.team != self.team && isdefined(objweapon) && !objweapon.isalternate) {
        thread marktarget_execute(victim);
    }
}

// Namespace namespace_70e675ecd54f03da / scripts\mp\perks\perk_mark_targets
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x188
// Size: 0x3d
function marktarget_execute(target) {
    target notify("delayHealing_started");
    target endon("delayHealing_started");
    target.healthregendisabled = 1;
    tagmarkedplayer(target);
    if (isdefined(target)) {
        target removemarkfromtarget();
    }
}

// Namespace namespace_70e675ecd54f03da / scripts\mp\perks\perk_mark_targets
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1cd
// Size: 0x70
function tagmarkedplayer(target) {
    self endon("death_or_disconnect");
    target endon("death_or_disconnect");
    var_79e98e0273d56283 = 1;
    if (target _hasperk("specialty_frangible_resist")) {
        var_79e98e0273d56283 += getdvarfloat(@"hash_cfc1f984f402559f", -0.5);
    }
    timemarked = gettime() + 3500 * var_79e98e0273d56283;
    while (gettime() < timemarked) {
        waitframe();
    }
}

// Namespace namespace_70e675ecd54f03da / scripts\mp\perks\perk_mark_targets
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x245
// Size: 0xc
function removemarkfromtarget() {
    self.healthregendisabled = undefined;
}

