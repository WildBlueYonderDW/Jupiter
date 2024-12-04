#using scripts\common\utility;
#using scripts\engine\utility;

#namespace debug_graycard;

/#

    // Namespace debug_graycard / scripts\common\debug_graycard
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x78
    // Size: 0xe1
    function init_graycard(handleplayerconnect) {
        setdevdvarifuninitialized(@"hash_a6381f8c58314102", "<dev string:x1c>");
        setdevdvarifuninitialized(@"hash_1dfb6641a37c41f1", "<dev string:x1c>");
        precachemodel("<dev string:x1e>");
        precachemodel("<dev string:x2e>");
        precachemodel("<dev string:x4e>");
        precachemodel("<dev string:x70>");
        precachemodel("<dev string:x8c>");
        precachemodel("<dev string:xa6>");
        precachemodel("<dev string:xba>");
        precachemodel("<dev string:xd0>");
        precachemodel("<dev string:xea>");
        if (!isdefined(level.debug)) {
            level.debug = spawnstruct();
        }
        level.debug.graycard = 0;
        if (isdefined(handleplayerconnect)) {
            thread onplayerconnect();
            return;
        }
        thread spplayerconnect();
    }

    // Namespace debug_graycard / scripts\common\debug_graycard
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x161
    // Size: 0x2b
    function spplayerconnect() {
        while (!isdefined(level.player)) {
            waitframe();
        }
        level.player add_frame_event(&debug_gray_card);
    }

#/

// Namespace debug_graycard / scripts\common\debug_graycard
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x194
// Size: 0x45
function onplayerconnect() {
    if (isdefined(level.func_run_lean_threads) && [[ level.func_run_lean_threads ]]()) {
        return;
    }
    /#
        for (;;) {
            level waittill("<dev string:x102>", player);
            player scripts\engine\utility::add_frame_event(&debug_gray_card_mp);
        }
    #/
}

/#

    // Namespace debug_graycard / scripts\common\debug_graycard
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1e1
    // Size: 0xe
    function debug_gray_card_mp() {
        debug_gray_card(1);
    }

    // Namespace debug_graycard / scripts\common\debug_graycard
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1f7
    // Size: 0x1be
    function debug_gray_card(ismp) {
        if (!isdefined(ismp)) {
            ismp = 0;
        }
        if (getdvar(@"hash_a6381f8c58314102") == "<dev string:x10c>") {
            if (level.debug.graycard != 1) {
                remove_graycard_objects();
                create_graycard_object();
                level.debug.graycard = 1;
            }
            debug_graycard_buttons(ismp);
        } else if (getdvar(@"hash_a6381f8c58314102") == "<dev string:x1c>" && level.debug.graycard != 0) {
            remove_graycard_objects();
            level.debug.graycard = 0;
        }
        switch (getdvar(@"hash_1dfb6641a37c41f1")) {
        case #"hash_311010bc01bd3a0f":
            set_debug_models("<dev string:x2e>");
            break;
        case #"hash_31100fbc01bd387c":
            set_debug_models("<dev string:x4e>");
            break;
        case #"hash_311012bc01bd3d35":
            set_debug_models("<dev string:x70>");
            break;
        case #"hash_311011bc01bd3ba2":
            set_debug_models("<dev string:xa6>");
            break;
        case #"hash_31100cbc01bd33c3":
            set_debug_models("<dev string:x8c>");
            break;
        case #"hash_31100bbc01bd3230":
            set_debug_models("<dev string:xea>");
            break;
        case #"hash_31100ebc01bd36e9":
            set_debug_models("<dev string:xd0>");
            break;
        case #"hash_31100dbc01bd3556":
            set_debug_models("<dev string:x1e>");
            break;
        default:
            break;
        }
    }

    // Namespace debug_graycard / scripts\common\debug_graycard
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x3bd
    // Size: 0x9d
    function set_debug_models(model) {
        if (isdefined(level.debug.var_286073a8108cd67f)) {
            foreach (ent in level.debug.var_286073a8108cd67f) {
                ent setmodel(model);
            }
        }
        if (isdefined(self.var_56868152de824f45)) {
            self.var_56868152de824f45 setmodel(model);
        }
    }

    // Namespace debug_graycard / scripts\common\debug_graycard
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x462
    // Size: 0xa5
    function remove_graycard_objects() {
        if (isdefined(level.debug.var_286073a8108cd67f)) {
            foreach (ent in level.debug.var_286073a8108cd67f) {
                ent delete();
            }
            level.debug.var_286073a8108cd67f = undefined;
        }
        if (isdefined(self.var_56868152de824f45)) {
            self.var_56868152de824f45 delete();
        }
    }

    // Namespace debug_graycard / scripts\common\debug_graycard
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x50f
    // Size: 0x74
    function create_graycard_object() {
        self.var_56868152de824f45 = spawn_graycard();
        object = self.var_56868152de824f45;
        object.offset = 100;
        object.lastoffset = object.offset;
        object.copy_released = 1;
        object.offsetangles = (0, 0, 0);
    }

    // Namespace debug_graycard / scripts\common\debug_graycard
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x58b
    // Size: 0x31
    function spawn_graycard() {
        model = spawn("<dev string:x11a>", self.origin);
        model setmodel("<dev string:xa6>");
        return model;
    }

    // Namespace debug_graycard / scripts\common\debug_graycard
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x5c4
    // Size: 0x27d
    function debug_graycard_buttons(ismp) {
        if (!isdefined(self.var_56868152de824f45)) {
            return;
        }
        object = self.var_56868152de824f45;
        if (self buttonpressed("<dev string:x127>")) {
            object.offset += 5;
        }
        if (self buttonpressed("<dev string:x130>")) {
            object.offset -= 5;
        }
        if (self buttonpressed("<dev string:x139>")) {
            object.offsetangles += (0, 6, 0);
        }
        if (self buttonpressed("<dev string:x142>")) {
            object.offsetangles += (0, -6, 0);
        }
        if (self buttonpressed("<dev string:x14b>")) {
            object.offsetangles += (6, 0, 0);
        }
        if (self buttonpressed("<dev string:x159>")) {
            object.offsetangles += (-6, 0, 0);
        }
        if (self buttonpressed("<dev string:x167>")) {
            object.offsetangles = (0, 0, 0);
        }
        if (object.copy_released) {
            if (self buttonpressed("<dev string:x175>")) {
                create_copy(object);
                object.copy_released = 0;
            }
        } else if (!self buttonpressed("<dev string:x175>")) {
            object.copy_released = 1;
        }
        if (object.offset > 1000) {
            object.offset = 1000;
        }
        if (object.offset < 16) {
            object.offset = 16;
        }
        if (!ismp) {
            object unlink();
        }
        object.origin = self geteye() + anglestoforward(self getplayerangles()) * object.offset;
        object.angles = combineangles(self getplayerangles(), object.offsetangles);
        object.lastoffset = object.offset;
        if (!ismp) {
            object linkto(self);
        }
    }

    // Namespace debug_graycard / scripts\common\debug_graycard
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x849
    // Size: 0x10d
    function create_copy(object) {
        copyobject = spawn_graycard();
        copyobject.origin = object.origin;
        copyobject.angles = object.angles;
        if (!isdefined(level.debug.var_286073a8108cd67f)) {
            level.debug.var_286073a8108cd67f = [copyobject];
            return;
        }
        if (level.debug.var_286073a8108cd67f.size > 50) {
            level.debug.var_286073a8108cd67f[0] delete();
            level.debug.var_286073a8108cd67f = array_removeundefined(level.debug.var_286073a8108cd67f);
        }
        level.debug.var_286073a8108cd67f[level.debug.var_286073a8108cd67f.size] = copyobject;
    }

#/
