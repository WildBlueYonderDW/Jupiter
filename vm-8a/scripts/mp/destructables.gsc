#namespace destructables;

// Namespace destructables / scripts\mp\destructables
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b
// Size: 0x73
function init() {
    ents = getentarray("destructable", "targetname");
    if (getdvar(@"hash_22975ef58f3a25e") == "0") {
        for (i = 0; i < ents.size; i++) {
            ents[i] delete();
        }
        return;
    }
    for (i = 0; i < ents.size; i++) {
        ents[i] thread destructable_think();
    }
}

// Namespace destructables / scripts\mp\destructables
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x106
// Size: 0x113
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
        areas = strtok(self.script_destructable_area, " ");
        for (i = 0; i < areas.size; i++) {
            blockarea(areas[i]);
        }
    }
    if (isdefined(self.script_fxid)) {
        self.fx = loadfx(self.script_fxid);
    }
    dmg = 0;
    self setcandamage(1);
    while (true) {
        amount, other = self waittill("damage");
        if (amount >= threshold) {
            dmg += amount;
            if (dmg >= accumulate) {
                thread destructable_destruct();
                return;
            }
        }
    }
}

// Namespace destructables / scripts\mp\destructables
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x221
// Size: 0x9c
function destructable_destruct() {
    ent = self;
    if (isdefined(self.script_destructable_area)) {
        areas = strtok(self.script_destructable_area, " ");
        for (i = 0; i < areas.size; i++) {
            unblockarea(areas[i]);
        }
    }
    if (isdefined(ent.fx)) {
        playfx(ent.fx, ent.origin + (0, 0, 6));
    }
    ent delete();
}

// Namespace destructables / scripts\mp\destructables
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c5
// Size: 0xb
function blockarea(area) {
    
}

// Namespace destructables / scripts\mp\destructables
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2d8
// Size: 0x13
function blockentsinarea(ents, area) {
    
}

// Namespace destructables / scripts\mp\destructables
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f3
// Size: 0xb
function unblockarea(area) {
    
}

// Namespace destructables / scripts\mp\destructables
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x306
// Size: 0x13
function unblockentsinarea(ents, area) {
    
}

