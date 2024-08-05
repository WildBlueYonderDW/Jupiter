#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\ai.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\sp\equipment\offhands.gsc;

#namespace semtex;

// Namespace semtex / scripts\sp\equipment\semtex
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13f
// Size: 0x18
function precache(offhand) {
    registeroffhandfirefunc(offhand, &semtexfiremain);
}

// Namespace semtex / scripts\sp\equipment\semtex
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x15f
// Size: 0x70
function semtexfiremain(grenade, weapon, fuse) {
    if (!isdefined(grenade)) {
        return;
    }
    if (isai(self)) {
        function_216c67ab6749137a(self, undefined, "grenade_throw", "frag_grenade");
        grenade setentityowner(self);
        grenade setotherent(self);
    }
    grenade makeunusable();
    grenade thread semtex_watch_beacon(self, fuse);
    grenade thread semtex_watch_stuck();
    grenade thread semtex_watch_fuse();
}

// Namespace semtex / scripts\sp\equipment\semtex
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1d7
// Size: 0x8a
function semtex_watch_beacon(attacker, fuse) {
    currentstate = self getscriptablepartstate("state");
    self endon("entitydeleted");
    if (currentstate == "beacon_ai" || currentstate == "beacon") {
        return;
    }
    if (isai(attacker)) {
        var_db4cc438ccd1b2b3 = 2;
        if (isdefined(fuse)) {
            var_db4cc438ccd1b2b3 = fuse;
        }
        self setscriptablepartstate("state", "beacon_ai", 0);
        wait var_db4cc438ccd1b2b3;
    }
    self setscriptablepartstate("state", "beacon", 0);
}

// Namespace semtex / scripts\sp\equipment\semtex
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x269
// Size: 0x5f
function semtex_watch_stuck() {
    self endon("death");
    stuckto = self waittill("missile_stuck");
    if (isai(stuckto) && isalive(stuckto)) {
        function_216c67ab6749137a(stuckto, undefined, "semtex_stuck");
        function_60daa23100a2b874(self, stuckto);
    }
    if (isplayer(stuckto) && isalive(stuckto)) {
        semtexstucktoplayer();
    }
}

// Namespace semtex / scripts\sp\equipment\semtex
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d0
// Size: 0x29
function semtexstucktoplayer() {
    if (isdefined(level.func["semtex_player_stuck_workaround"])) {
        self thread [[ level.func["semtex_player_stuck_workaround"] ]]();
    }
}

// Namespace semtex / scripts\sp\equipment\semtex
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x301
// Size: 0x35
function semtex_watch_fuse() {
    org = self waittill("explode");
    playrumbleonposition("grenade_rumble", org);
    earthquake(0.45, 0.7, org, 800);
}

