// mwiii decomp prototype
#using scripts\asm\asm.gsc;

#namespace namespace_8259b43da74930e4;

// Namespace namespace_8259b43da74930e4/namespace_f08e04b63067d27f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70
// Size: 0x51
function init() {
    if (isdefined(level._btactions)) {
        return;
    }
    level._btactions = [];
    anim.failure = 0;
    anim.success = 1;
    anim.running = 2;
    anim.skip = 3;
    anim.invalid = 4;
}

// Namespace namespace_8259b43da74930e4/namespace_f08e04b63067d27f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc8
// Size: 0x57
function bt_init() {
    /#
        assert(!isdefined(self.bt));
    #/
    self.bt = spawnstruct();
    if (isdefined(self.behaviortreeasset)) {
        self btregistertreeinstance(self.behaviortreeasset);
    }
    self.bt.instancedata = [];
}

// Namespace namespace_8259b43da74930e4/namespace_f08e04b63067d27f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x126
// Size: 0x32
function bt_terminateandreplace(var_99252870276d5b3e) {
    self btterminatetreeinstance();
    if (isdefined(var_99252870276d5b3e)) {
        self.behaviortreeasset = var_99252870276d5b3e;
        self btregistertreeinstance(self.behaviortreeasset);
    }
}

