// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace debug_reflection;

// Namespace debug_reflection / scripts/common/debug_reflection
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x78
// Size: 0x1a
function init_reflection_probe(handleplayerconnect) {
    /#
        precachemodel("<unknown string>");
    #/
}

// Namespace debug_reflection / scripts/common/debug_reflection
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x99
// Size: 0x2c
function spplayerconnect() {
    /#
        while (!isdefined(level.player)) {
            waitframe();
        }
        level.player add_frame_event(&debug_reflection_probes);
    #/
}

// Namespace debug_reflection / scripts/common/debug_reflection
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcc
// Size: 0x46
function onplayerconnect() {
    if (isdefined(level.func_run_lean_threads) && [[ level.func_run_lean_threads ]]()) {
        return;
    }
    /#
        for (;;) {
            player = level waittill("<unknown string>");
            player scripts/engine/utility::add_frame_event(&debug_reflection_probes);
        }
    #/
}

// Namespace debug_reflection / scripts/common/debug_reflection
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x119
// Size: 0x16b
function debug_reflection_probes() {
    /#
        if (getdvar(@"hash_925f7645ee214f2a") == "<unknown string>" && level.debug.reflection != 2 || getdvar(@"hash_925f7645ee214f2a") == "<unknown string>" && level.debug.reflection != 3) {
            function_da5718b2a8be7b0b();
            if (getdvar(@"hash_925f7645ee214f2a") == "<unknown string>") {
                level.debug.reflection = 2;
            } else {
                create_reflection_object();
                level.debug.reflection = 3;
            }
        } else if (getdvar(@"hash_925f7645ee214f2a") == "<unknown string>" && level.debug.reflection != 1) {
            function_da5718b2a8be7b0b();
            create_reflection_object();
            level.debug.reflection = 1;
        } else if (getdvar(@"hash_925f7645ee214f2a") == "<unknown string>" && level.debug.reflection != 0) {
            function_da5718b2a8be7b0b();
            level.debug.reflection = 0;
        }
        debug_reflection_buttons();
    #/
}

// Namespace debug_reflection / scripts/common/debug_reflection
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28b
// Size: 0xa7
function create_reflection_object() {
    /#
        self.var_93a1cb702f026ba7 = spawn("<unknown string>", self geteye() + anglestoforward(self.angles) * 100);
        self.var_93a1cb702f026ba7 setmodel("<unknown string>");
        self.var_93a1cb702f026ba7.origin = self geteye() + anglestoforward(self getplayerangles()) * 100;
        object = self.var_93a1cb702f026ba7;
        object.offset = 100;
        object.lastoffset = object.offset;
    #/
}

// Namespace debug_reflection / scripts/common/debug_reflection
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x339
// Size: 0x48
function function_da5718b2a8be7b0b() {
    /#
        if (level.debug.reflection == 1 || level.debug.reflection == 3) {
            self.var_93a1cb702f026ba7 delete();
        }
    #/
}

// Namespace debug_reflection / scripts/common/debug_reflection
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x388
// Size: 0xda
function debug_reflection_buttons() {
    /#
        if (!isdefined(self.var_93a1cb702f026ba7)) {
            return;
        }
        object = self.var_93a1cb702f026ba7;
        if (self buttonpressed("<unknown string>")) {
            object.offset = object.offset + 50;
        }
        if (self buttonpressed("<unknown string>")) {
            object.offset = object.offset - 50;
        }
        object.offset = clamp(object.offset, 64, 1000);
        object.origin = self geteye() + anglestoforward(self getplayerangles()) * object.offset;
        object.lastoffset = object.offset;
    #/
}

