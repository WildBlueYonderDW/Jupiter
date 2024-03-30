// mwiii decomp prototype
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace arbitrary_up;

// Namespace arbitrary_up / scripts/mp/arbitrary_up
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92
// Size: 0x170
function initarbitraryuptriggers() {
    if (isdefined(level.arbitraryuptriggers)) {
        return;
    }
    level.arbitraryuptriggers = [];
    level.arbitraryuptriggersstructs = [];
    if (getmapname() == "mp_junk") {
        arbitraryuptriggers = getentarray("mag_up", "targetname");
        if (!isdefined(arbitraryuptriggers) || arbitraryuptriggers.size == 0) {
            return;
        }
        level.arbitraryuptriggers = arbitraryuptriggers;
        foreach (trigger in arbitraryuptriggers) {
            entnum = trigger getentitynumber();
            triggerstruct = spawnstruct();
            triggerstruct.trigger = trigger;
            triggerstruct.base = undefined;
            triggerstruct.entsinside = [];
            if (isdefined(trigger.target)) {
                triggerstruct.base = getent(trigger.target, "targetname");
                triggerstruct.blinkloc = triggerstruct.base.origin + (0, 0, -175);
            }
            level.arbitraryuptriggersstructs[entnum] = triggerstruct;
            thread watcharbitraryuptriggerenter(triggerstruct);
            thread watcharbitraryuptriggerexit(triggerstruct);
        }
    }
}

// Namespace arbitrary_up / scripts/mp/arbitrary_up
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x209
// Size: 0x74
function watcharbitraryuptriggerenter(triggerstruct) {
    while (true) {
        ent = triggerstruct.trigger waittill("trigger");
        if (!isdefined(ent)) {
            continue;
        }
        if (!shouldaddtoarbitraryuptrigger(triggerstruct, ent)) {
            continue;
        }
        entnum = ent getentitynumber();
        triggerstruct.entsinside[entnum] = ent;
        ent.arbitraryuptriggerstruct = triggerstruct;
    }
}

// Namespace arbitrary_up / scripts/mp/arbitrary_up
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x284
// Size: 0xc3
function watcharbitraryuptriggerexit(triggerstruct) {
    while (true) {
        foreach (ent in triggerstruct.entsinside) {
            if (!isdefined(ent)) {
                continue;
            }
            if (!shouldremovefromarbitraryuptrigger(triggerstruct, ent)) {
                continue;
            }
            entnum = ent getentitynumber();
            triggerstruct.entsinside[entnum] = undefined;
            if (isdefined(ent.arbitraryuptriggerstruct) && ent.arbitraryuptriggerstruct == triggerstruct) {
                ent.arbitraryuptriggerstruct = undefined;
            }
        }
        waitframe();
    }
}

// Namespace arbitrary_up / scripts/mp/arbitrary_up
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34e
// Size: 0x45
function shouldaddtoarbitraryuptrigger(triggerstruct, ent) {
    if (!isplayer(ent)) {
        return false;
    }
    entnum = ent getentitynumber();
    if (isdefined(triggerstruct.entsinside[entnum])) {
        return false;
    }
    return true;
}

// Namespace arbitrary_up / scripts/mp/arbitrary_up
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39b
// Size: 0x2c
function shouldremovefromarbitraryuptrigger(triggerstruct, ent) {
    if (!ent istouching(triggerstruct.trigger)) {
        return true;
    }
    return false;
}

// Namespace arbitrary_up / scripts/mp/arbitrary_up
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3cf
// Size: 0x25
function getarbitraryuptrigger() {
    if (!isdefined(self.arbitraryuptriggerstruct)) {
        return undefined;
    }
    return self.arbitraryuptriggerstruct.trigger;
}

// Namespace arbitrary_up / scripts/mp/arbitrary_up
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3fc
// Size: 0x25
function getarbitraryuptriggerbase() {
    if (!isdefined(self.arbitraryuptriggerstruct)) {
        return undefined;
    }
    return self.arbitraryuptriggerstruct.base;
}

// Namespace arbitrary_up / scripts/mp/arbitrary_up
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x429
// Size: 0x25
function getarbitraryuptriggerblinkloc() {
    if (!isdefined(self.arbitraryuptriggerstruct)) {
        return undefined;
    }
    return self.arbitraryuptriggerstruct.blinkloc;
}

// Namespace arbitrary_up / scripts/mp/arbitrary_up
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x456
// Size: 0x27
function isinarbitraryup() {
    if (isplayer(self)) {
        if (self getworldupreferenceangles() != (0, 0, 0)) {
            return true;
        }
    }
    return false;
}

