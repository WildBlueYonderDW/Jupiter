// mwiii decomp prototype
#namespace destructables;

// Namespace destructables/namespace_578e16704db5bf25
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b
// Size: 0x74
function init() {
    ents = getentarray("destructable", "targetname");
    if (getdvar(@"hash_22975ef58f3a25e") == "0") {
        for (i = 0; i < ents.size; i++) {
            ents[i] delete();
        }
    } else {
        for (i = 0; i < ents.size; i++) {
            ents[i] thread destructable_think();
        }
    }
}

// Namespace destructables/namespace_578e16704db5bf25
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x106
// Size: 0x114
function destructable_think() {
    accumulate = 40;
    threshold = 0;
    if (isdefined(self.script_accumulate)) {
        accumulate = self.script_accumulate;
    }
    if (isdefined(self.script_threshold)) {
        threshold = self.script_threshold;
    }
    if (isdefined(self.script_destructable_area)) {
        var_d09aecdb0d855501 = strtok(self.script_destructable_area, " ");
        for (i = 0; i < var_d09aecdb0d855501.size; i++) {
            blockarea(var_d09aecdb0d855501[i]);
        }
    }
    if (isdefined(self.script_fxid)) {
        self.fx = loadfx(self.script_fxid);
    }
    dmg = 0;
    self setcandamage(1);
    while (1) {
        other = amount = self waittill("damage");
        if (amount >= threshold) {
            dmg = dmg + amount;
            if (dmg >= accumulate) {
                thread destructable_destruct();
                return;
            }
        }
    }
}

// Namespace destructables/namespace_578e16704db5bf25
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x221
// Size: 0x9d
function destructable_destruct() {
    ent = self;
    if (isdefined(self.script_destructable_area)) {
        var_d09aecdb0d855501 = strtok(self.script_destructable_area, " ");
        for (i = 0; i < var_d09aecdb0d855501.size; i++) {
            unblockarea(var_d09aecdb0d855501[i]);
        }
    }
    if (isdefined(ent.fx)) {
        playfx(ent.fx, ent.origin + (0, 0, 6));
    }
    ent delete();
}

// Namespace destructables/namespace_578e16704db5bf25
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c5
// Size: 0xc
function blockarea(area) {
    
}

// Namespace destructables/namespace_578e16704db5bf25
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2d8
// Size: 0x14
function blockentsinarea(ents, area) {
    
}

// Namespace destructables/namespace_578e16704db5bf25
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f3
// Size: 0xc
function unblockarea(area) {
    
}

// Namespace destructables/namespace_578e16704db5bf25
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x306
// Size: 0x14
function unblockentsinarea(ents, area) {
    
}

