// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_cd074ac917dcd87a;

// Namespace namespace_cd074ac917dcd87a/namespace_2a9588dfac284b77
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x102
// Size: 0x30
function init() {
    level.entbudgetused = 0;
    level.entbudget = getdvarint(@"hash_3e029cf0de92274b", 200);
    level.budgetedents = [];
}

// Namespace namespace_cd074ac917dcd87a/namespace_2a9588dfac284b77
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x139
// Size: 0x31
function registerspawncount(entcount) {
    self.entcount = entcount;
    level.entbudgetused = level.entbudgetused + entcount;
    updatebudget();
}

// Namespace namespace_cd074ac917dcd87a/namespace_2a9588dfac284b77
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x171
// Size: 0xa5
function deregisterspawn() {
    if (isdefined(self.entcount) && !isdefined(self.deregistered)) {
        level.entbudgetused = level.entbudgetused - self.entcount;
        self.deregistered = 1;
        self.entcount = undefined;
        if (level.entbudgetused < 0) {
            level.entbudgetused = 0;
            /#
                assertmsg("Error more spawns deregistered than registered!");
            #/
        }
    }
    if (isdefined(self.entdeletefunc)) {
        level.budgetedents = namespace_3c37cb17ade254d::array_remove(level.budgetedents, self);
        self.entdeletefunc = undefined;
    }
}

// Namespace namespace_cd074ac917dcd87a/namespace_2a9588dfac284b77
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21d
// Size: 0x59
function registerspawn(entcount, deletefunc) {
    self.entcount = entcount;
    self.entdeletefunc = deletefunc;
    level.entbudgetused = level.entbudgetused + entcount;
    level.budgetedents[level.budgetedents.size] = self;
    updatebudget();
}

// Namespace namespace_cd074ac917dcd87a/namespace_2a9588dfac284b77
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27d
// Size: 0x95
function updatebudget() {
    if (level.entbudgetused > level.entbudget) {
        if (isdefined(level.budgetedents[0])) {
            level.entbudgetused = level.entbudgetused - level.budgetedents[0].entcount;
            self [[ level.budgetedents[0].entdeletefunc ]]();
        } else {
            /#
                assertmsg("Error undefined entry in level.budgetedEnts!  Did this get deleted before deregistration?");
            #/
        }
        level.budgetedents = namespace_3c37cb17ade254d::array_slice(level.budgetedents, 0, 1);
    }
}

// Namespace namespace_cd074ac917dcd87a/namespace_2a9588dfac284b77
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x319
// Size: 0x7e
function function_a5aa9e07f21b879e() {
    /#
        if (isdefined(level.budgetedents)) {
            foreach (ent in level.budgetedents) {
                if (isdefined(ent.entdeletefunc)) {
                    ent [[ ent.entdeletefunc ]]();
                }
            }
        }
    #/
}

