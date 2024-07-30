#using scripts\asm\asm.gsc;
#using script_7ff3a914e6c698c5;
#using scripts\common\callbacks.gsc;
#using scripts\engine\utility.gsc;

#namespace namespace_ae9d35285f2a2d94;

// Namespace namespace_ae9d35285f2a2d94 / namespace_4dae370e6c999476
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb0
// Size: 0x22
function function_a40873f83b05ce3c() {
    callback::function_e7fddda1f0b46b5e(self.animsetname) callback::add("on_is_crawling_changed", &function_a74672983ef7a645);
}

// Namespace namespace_ae9d35285f2a2d94 / namespace_4dae370e6c999476
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xda
// Size: 0x20
function private function_a74672983ef7a645(params) {
    asm_fireevent_internal(self.asmname, "loop_reroll_anim");
}

