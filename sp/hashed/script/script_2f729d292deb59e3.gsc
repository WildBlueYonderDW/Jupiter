#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\sp\equipment\offhands.gsc;
#using scripts\anim\face.gsc;

#namespace smoke_bomb;

// Namespace smoke_bomb / namespace_1a352b34d2d4362f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x125
// Size: 0x18
function precache(offhand) {
    registeroffhandfirefunc(offhand, &function_172b68e9ea28c13);
}

// Namespace smoke_bomb / namespace_1a352b34d2d4362f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x145
// Size: 0x1cb
function function_172b68e9ea28c13(grenade, weapon) {
    var_328d4dc9f970b40 = self;
    grenade waittill("missile_stuck", null, null, null, null, grenadeorigin);
    earthquake(0.25, 0.35, grenadeorigin, 1000);
    playrumbleonposition("grenade_rumble", grenadeorigin);
    var_a830aa21c1b60a3c = distancesquared(level.player.origin, grenadeorigin);
    if (var_a830aa21c1b60a3c <= 22500) {
        thread function_14dd7fe1d23f9dc3("iw9_ges_gas_cough_long", grenadeorigin, "smoke_bomb", 150);
    }
    enemies = getaiarray("axis");
    foreach (enemy in enemies) {
        distancesquared = distancesquared(enemy.origin, grenadeorigin);
        var_690b87cf6507d86 = isdefined(enemy.stealth);
        incombat = isdefined(enemy.fnisinstealthcombat) && enemy [[ enemy.fnisinstealthcombat ]]();
        if (var_690b87cf6507d86 && !incombat && distancesquared <= 1000000) {
            enemy aieventlistenerevent("explosion", level.player, grenadeorigin);
        }
        if (distancesquared <= 57600) {
            enemy thread function_281e000bb98136ed(9);
            enemy notify("flashbang", (0, 0, 0), 1, 1, var_328d4dc9f970b40, "allies", 9);
            enemy scripts\anim\face::saygenericdialogue("cough_fit");
        }
    }
}

// Namespace smoke_bomb / namespace_1a352b34d2d4362f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x318
// Size: 0x38
function function_281e000bb98136ed(duration) {
    self endon("death");
    self notify("smoked_bombed");
    self endon("smoked_bombed");
    self.var_8be07fc13ba66777 = 1;
    wait duration;
    self.var_8be07fc13ba66777 = undefined;
}

