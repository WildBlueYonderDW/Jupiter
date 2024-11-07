#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\sp\equipment\offhands.gsc;
#using scripts\anim\face.gsc;

#namespace smoke;

// Namespace smoke / scripts\sp\equipment\smoke
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11c
// Size: 0x18
function precache(offhand) {
    registeroffhandfirefunc(offhand, &smokefiremain);
}

// Namespace smoke / scripts\sp\equipment\smoke
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x13c
// Size: 0x271
function smokefiremain(grenade, weapon) {
    var_328d4dc9f970b40 = self;
    function_216c67ab6749137a(var_328d4dc9f970b40, undefined, "grenade_throw", "smoke_grenade");
    grenade waittill("explode", grenadeorigin);
    earthquake(0.25, 0.35, grenadeorigin, 1000);
    playrumbleonposition("grenade_rumble", grenadeorigin);
    var_a830aa21c1b60a3c = distancesquared(level.player.origin, grenadeorigin);
    if (var_a830aa21c1b60a3c <= 22500) {
        traceoffset = (0, 0, 18);
        if (!ray_trace_passed(level.player.origin + traceoffset, grenadeorigin + traceoffset, level.player)) {
            return;
        }
        level.player forceplaygestureviewmodel("iw9_ges_gas_cough_long", undefined, 0.5, 0, 1, 0);
    }
    enemies = getaiarray("axis");
    foreach (enemy in enemies) {
        distancesquared = distancesquared(enemy.origin, grenadeorigin);
        var_690b87cf6507d86 = isdefined(enemy.stealth);
        incombat = isdefined(enemy.fnisinstealthcombat) && enemy [[ enemy.fnisinstealthcombat ]]();
        if (var_690b87cf6507d86 && !incombat && distancesquared <= 1000000) {
            event = spawnstruct();
            event.typeorig = "explosion";
            event.type = "cover_blown";
            event.entity = level.player;
            event.origin = grenadeorigin;
            event.investigate_pos = grenadeorigin;
            enemy [[ enemy.fnsetstealthstate ]]("hunt", event);
        }
        if (distancesquared <= 57600) {
            enemy scripts\anim\face::saygenericdialogue("cough_fit");
            if (!isdefined(enemy.stealth)) {
                enemy aieventlistenerevent("explosion", self, grenadeorigin);
            }
        }
    }
}

