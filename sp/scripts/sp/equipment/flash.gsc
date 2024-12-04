#using scripts\common\utility;
#using scripts\engine\math;
#using scripts\engine\sp\utility;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\sp\equipment\offhands;
#using scripts\sp\utility;

#namespace flash;

// Namespace flash / scripts\sp\equipment\flash
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf1
// Size: 0x24
function precache(offhand) {
    registeroffhandfirefunc(offhand, &flashfiremain);
    playeroffhandthread(&flashbangmonitor);
}

// Namespace flash / scripts\sp\equipment\flash
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11d
// Size: 0x25
function flashfiremain(grenade, weapon) {
    function_216c67ab6749137a(self, undefined, "grenade_throw", "flash_grenade");
}

// Namespace flash / scripts\sp\equipment\flash
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14a
// Size: 0x12d
function flashbangmonitor() {
    self notify("_flashBangMonitor");
    self endon("_flashBangMonitor");
    while (true) {
        self waittill("flashbang", origin, var_b5fc4d6cbb090225, var_cec6c416223cd185, attacker, team);
        var_232b4f4d5ac19b58 = 0.8;
        var_7cf0df913626e40e = 0.65;
        var_1bd7bb5d30fe89cb = 0.3;
        var_cec6c416223cd185 = math::normalize_value(var_7cf0df913626e40e, var_232b4f4d5ac19b58, var_cec6c416223cd185);
        var_cec6c416223cd185 = factor_value(var_1bd7bb5d30fe89cb, 1, var_cec6c416223cd185);
        factors = [var_b5fc4d6cbb090225, var_cec6c416223cd185];
        factor = var_cec6c416223cd185 * var_b5fc4d6cbb090225;
        duration = factor * self.gs.maxflashbangtime;
        self.flashendtime = gettime() + int(duration * 1000);
        self shellshock("flashbang", duration);
        thread flashbangrumbleloop(duration * 0.45);
        thread flashbanginvulnerability(duration * 0.65);
    }
}

// Namespace flash / scripts\sp\equipment\flash
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x27f
// Size: 0xa4
function flashbangrumbleloop(duration) {
    self endon("flashbang");
    starttime = gettime();
    var_5ede121642e7476f = duration * 1000;
    goaltime = starttime + var_5ede121642e7476f;
    while (gettime() < goaltime) {
        currenttime = gettime();
        timedifference = currenttime - starttime;
        pulsetime = math::factor_value(0.05, 0.15, timedifference / var_5ede121642e7476f);
        self playrumbleonentity("damage_heavy");
        wait pulsetime;
    }
    self playrumbleonentity("tank_rumble");
}

// Namespace flash / scripts\sp\equipment\flash
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x32b
// Size: 0x29
function flashbanginvulnerability(duration) {
    self endon("flashbang");
    self.flashinvul = 1;
    wait duration;
    self.flashinvul = undefined;
}

