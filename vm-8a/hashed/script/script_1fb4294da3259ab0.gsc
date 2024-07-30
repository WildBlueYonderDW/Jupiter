#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_7edf952f8921aa6b;
#using scripts\common\devgui.gsc;
#using scripts\asm\shared\mp\utility.gsc;
#using script_793f5fa29ca62c00;

#namespace ob_dog_whistle;

// Namespace ob_dog_whistle / namespace_d546a7e525bb4c8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf8
// Size: 0x24
function function_d18f1e707dc52a0d() {
    /#
        level thread function_9b5eae6a141d151();
    #/
    registersharedfunc("ob_dog_whistle", "spawn_hellhound_pet", &spawn_hellhound_pet);
}

// Namespace ob_dog_whistle / namespace_d546a7e525bb4c8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x124
// Size: 0xed
function spawn_hellhound_pet() {
    if (!isplayer(self)) {
        return;
    }
    if (self getcurrentweapon() != nullweapon()) {
        self playgestureviewmodel("jup_vm_gesture_zm_dogwhistle");
    }
    spawn_struct = spawnstruct();
    spawn_struct.angles = self.angles;
    forward = anglestoforward(self.angles);
    forward = vectornormalize(forward);
    forward *= (64, 64, 64);
    pos = self.origin + forward;
    if (!ispointonnavmesh(pos)) {
        pos = getgroundposition(self.origin + forward, 1);
    }
    spawn_struct.origin = pos;
    hound = namespace_f82e883a38a92b9a::function_93c37ea2b2745734(self, spawn_struct, 1);
    hound thread function_577d8abff6067c23("spawn", "spawn_end", undefined, undefined, "spawn_animating");
}

/#

    // Namespace ob_dog_whistle / namespace_d546a7e525bb4c8
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x219
    // Size: 0x2e
    function function_9b5eae6a141d151() {
        function_6e7290c8ee4f558b("<dev string:x1c>");
        function_a9a864379a098ad6("<dev string:x20>", "<dev string:x39>", &function_cb675302a33d65ae);
        function_fe953f000498048f();
    }

    // Namespace ob_dog_whistle / namespace_d546a7e525bb4c8
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x24f
    // Size: 0x5a
    function function_cb675302a33d65ae() {
        foreach (player in level.players) {
            player spawn_hellhound_pet();
        }
    }

#/
