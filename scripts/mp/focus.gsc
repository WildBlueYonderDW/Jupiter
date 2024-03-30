// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using script_2669878cf5a1b6bc;

#namespace focus;

// Namespace focus / scripts/mp/focus
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa
// Size: 0xf
function init() {
    scripts/mp/utility/spawn_event_aggregator::registeronplayerspawncallback(&onplayerspawned);
}

// Namespace focus / scripts/mp/focus
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x110
// Size: 0x23
function onplayerspawned() {
    self.focus = 0;
    self.focuslasttime = -99999;
    thread managefocus();
}

// Namespace focus / scripts/mp/focus
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a
// Size: 0x35
function managefocus() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (true) {
        while (!self isholdingbreath()) {
            waitframe();
        }
        childthread watchforfire();
        dofocus();
    }
}

// Namespace focus / scripts/mp/focus
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x176
// Size: 0x5e
function dofocus() {
    var_663dab9b536c9a71 = !istrue(level.wpinprogress);
    if (var_663dab9b536c9a71) {
        self.focus = 1;
        focusvision();
    }
    while (self isholdingbreath()) {
        waitframe();
    }
    self notify("stop_focus_fire_watcher");
    if (var_663dab9b536c9a71) {
        self.focus = 0;
        restorebasevisionset(0.35);
    }
}

// Namespace focus / scripts/mp/focus
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1db
// Size: 0x20
function watchforfire() {
    self endon("stop_focus_fire_watcher");
    self waittill("weapon_fired");
    self.focuslasttime = gettime();
}

// Namespace focus / scripts/mp/focus
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x202
// Size: 0xa1
function function_bd0d33f283ede2f8() {
    weapontype = namespace_e0ee43ef2dddadaa::getweaponclasstoken(self.currentweapon.basename);
    switch (weapontype) {
    case #"hash_fa0ed9f6bd4f4e9a":
    case #"hash_fa18d2f6bd57925a":
    case #"hash_fa21c4f6bd5e3815":
    case #"hash_fa27b9f6bd62a3f2":
    case #"hash_fa4dbdf6bd80bf52":
    case #"hash_fa50b4f6bd82efbe":
    case #"hash_fa50b6f6bd82f2e4":
    case #"hash_fa50b9f6bd82f79d":
        return 1;
    default:
        return 0;
    }
}

// Namespace focus / scripts/mp/focus
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2aa
// Size: 0x14
function focusvision() {
    self visionsetnakedforplayer("focus", 0.57);
}

