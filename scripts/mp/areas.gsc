// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;

#namespace namespace_d09aecdb0d855501;

// Namespace namespace_d09aecdb0d855501/namespace_5e01953190a9daa0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xed
// Size: 0x131
function init() {
    level.softlandingtriggers = getentarray("trigger_multiple_softlanding", "classname");
    destructibles = getentarray("destructible_vehicle", "targetname");
    foreach (trigger in level.softlandingtriggers) {
        if (trigger.script_type != "car") {
            continue;
        }
        foreach (destructible in destructibles) {
            if (distance(trigger.origin, destructible.origin) > 64) {
                continue;
            }
            /#
                assert(!isdefined(trigger.destructible));
            #/
            trigger.destructible = destructible;
        }
    }
    thread onplayerconnect();
}

// Namespace namespace_d09aecdb0d855501/namespace_5e01953190a9daa0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x225
// Size: 0x37
function onplayerconnect() {
    if (namespace_cd0b2d039510b38d::runleanthreadmode()) {
        return;
    }
    for (;;) {
        player = level waittill("connected");
        player.softlanding = undefined;
        player thread softlandingwaiter();
    }
}

// Namespace namespace_d09aecdb0d855501/namespace_5e01953190a9daa0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x263
// Size: 0x16
function playerentersoftlanding(trigger) {
    self.softlanding = trigger;
}

// Namespace namespace_d09aecdb0d855501/namespace_5e01953190a9daa0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x280
// Size: 0x16
function playerleavesoftlanding(trigger) {
    self.softlanding = undefined;
}

// Namespace namespace_d09aecdb0d855501/namespace_5e01953190a9daa0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29d
// Size: 0x3d
function softlandingwaiter() {
    self endon("disconnect");
    for (;;) {
        damage = trigger = self waittill("soft_landing");
        if (!isdefined(trigger.destructible)) {
            continue;
        }
    }
}

