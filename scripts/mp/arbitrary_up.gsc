// mwiii decomp prototype
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_5a29617a8a3d19b3;

// Namespace namespace_5a29617a8a3d19b3/namespace_ab403fa2c6c142a4
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
            var_633ed0d009b54036 = spawnstruct();
            var_633ed0d009b54036.trigger = trigger;
            var_633ed0d009b54036.base = undefined;
            var_633ed0d009b54036.entsinside = [];
            if (isdefined(trigger.target)) {
                var_633ed0d009b54036.base = getent(trigger.target, "targetname");
                var_633ed0d009b54036.blinkloc = var_633ed0d009b54036.base.origin + (0, 0, -175);
            }
            level.arbitraryuptriggersstructs[entnum] = var_633ed0d009b54036;
            thread watcharbitraryuptriggerenter(var_633ed0d009b54036);
            thread watcharbitraryuptriggerexit(var_633ed0d009b54036);
        }
    }
}

// Namespace namespace_5a29617a8a3d19b3/namespace_ab403fa2c6c142a4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x209
// Size: 0x74
function watcharbitraryuptriggerenter(var_633ed0d009b54036) {
    while (1) {
        ent = var_633ed0d009b54036.trigger waittill("trigger");
        if (!isdefined(ent)) {
            continue;
        }
        if (!shouldaddtoarbitraryuptrigger(var_633ed0d009b54036, ent)) {
            continue;
        }
        entnum = ent getentitynumber();
        var_633ed0d009b54036.entsinside[entnum] = ent;
        ent.arbitraryuptriggerstruct = var_633ed0d009b54036;
    }
}

// Namespace namespace_5a29617a8a3d19b3/namespace_ab403fa2c6c142a4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x284
// Size: 0xc3
function watcharbitraryuptriggerexit(var_633ed0d009b54036) {
    while (1) {
        foreach (ent in var_633ed0d009b54036.entsinside) {
            if (!isdefined(ent)) {
                continue;
            }
            if (!shouldremovefromarbitraryuptrigger(var_633ed0d009b54036, ent)) {
                continue;
            }
            entnum = ent getentitynumber();
            var_633ed0d009b54036.entsinside[entnum] = undefined;
            if (isdefined(ent.arbitraryuptriggerstruct) && ent.arbitraryuptriggerstruct == var_633ed0d009b54036) {
                ent.arbitraryuptriggerstruct = undefined;
            }
        }
        waitframe();
    }
}

// Namespace namespace_5a29617a8a3d19b3/namespace_ab403fa2c6c142a4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34e
// Size: 0x45
function shouldaddtoarbitraryuptrigger(var_633ed0d009b54036, ent) {
    if (!isplayer(ent)) {
        return 0;
    }
    entnum = ent getentitynumber();
    if (isdefined(var_633ed0d009b54036.entsinside[entnum])) {
        return 0;
    }
    return 1;
}

// Namespace namespace_5a29617a8a3d19b3/namespace_ab403fa2c6c142a4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39b
// Size: 0x2c
function shouldremovefromarbitraryuptrigger(var_633ed0d009b54036, ent) {
    if (!ent istouching(var_633ed0d009b54036.trigger)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_5a29617a8a3d19b3/namespace_ab403fa2c6c142a4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3cf
// Size: 0x25
function getarbitraryuptrigger() {
    if (!isdefined(self.arbitraryuptriggerstruct)) {
        return undefined;
    }
    return self.arbitraryuptriggerstruct.trigger;
}

// Namespace namespace_5a29617a8a3d19b3/namespace_ab403fa2c6c142a4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3fc
// Size: 0x25
function getarbitraryuptriggerbase() {
    if (!isdefined(self.arbitraryuptriggerstruct)) {
        return undefined;
    }
    return self.arbitraryuptriggerstruct.base;
}

// Namespace namespace_5a29617a8a3d19b3/namespace_ab403fa2c6c142a4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x429
// Size: 0x25
function getarbitraryuptriggerblinkloc() {
    if (!isdefined(self.arbitraryuptriggerstruct)) {
        return undefined;
    }
    return self.arbitraryuptriggerstruct.blinkloc;
}

// Namespace namespace_5a29617a8a3d19b3/namespace_ab403fa2c6c142a4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x456
// Size: 0x27
function isinarbitraryup() {
    if (isplayer(self)) {
        if (self getworldupreferenceangles() != (0, 0, 0)) {
            return 1;
        }
    }
    return 0;
}

