#using script_405d05c89e998922;
#using scripts\common\callbacks;

#namespace namespace_960978fc5a7ce390;

// Namespace namespace_960978fc5a7ce390 / namespace_43e89ac0d1f8fd7a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc1
// Size: 0x22
function function_a8d762b7f47cf728() {
    callback::function_e7fddda1f0b46b5e(self.animsetname) callback::add("on_is_crawling_changed", &function_3ba2fe8330d232b5);
}

// Namespace namespace_960978fc5a7ce390 / namespace_43e89ac0d1f8fd7a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xeb
// Size: 0x22
function init_traverse() {
    self.var_db44b0ed0f52e2b = [];
    self.var_db44b0ed0f52e2b["is_crawling"] = namespace_9e6ef02d993a7eba::is_crawling();
}

// Namespace namespace_960978fc5a7ce390 / namespace_43e89ac0d1f8fd7a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x115
// Size: 0x26
function private function_3ba2fe8330d232b5(params) {
    self.var_db44b0ed0f52e2b["is_crawling"] = int(namespace_9e6ef02d993a7eba::is_crawling());
}

