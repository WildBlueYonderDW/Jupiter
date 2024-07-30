#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;

#namespace areas;

// Namespace areas / scripts\mp\areas
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xed
// Size: 0x130
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
            assert(!isdefined(trigger.destructible));
            trigger.destructible = destructible;
        }
    }
    thread onplayerconnect();
}

// Namespace areas / scripts\mp\areas
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x225
// Size: 0x36
function onplayerconnect() {
    if (scripts\mp\utility\game::runleanthreadmode()) {
        return;
    }
    for (;;) {
        player = level waittill("connected");
        player.softlanding = undefined;
        player thread softlandingwaiter();
    }
}

// Namespace areas / scripts\mp\areas
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x263
// Size: 0x15
function playerentersoftlanding(trigger) {
    self.softlanding = trigger;
}

// Namespace areas / scripts\mp\areas
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x280
// Size: 0x15
function playerleavesoftlanding(trigger) {
    self.softlanding = undefined;
}

// Namespace areas / scripts\mp\areas
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29d
// Size: 0x3c
function softlandingwaiter() {
    self endon("disconnect");
    for (;;) {
        trigger, damage = self waittill("soft_landing");
        if (!isdefined(trigger.destructible)) {
        }
    }
}

