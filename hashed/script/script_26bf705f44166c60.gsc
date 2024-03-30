// mwiii decomp prototype
#using scripts\common\callbacks.gsc;
#using script_405d05c89e998922;

#namespace namespace_960978fc5a7ce390;

// Namespace namespace_960978fc5a7ce390 / namespace_43e89ac0d1f8fd7a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b
// Size: 0x23
function function_a8d762b7f47cf728() {
    callback::function_e7fddda1f0b46b5e(self.animsetname) callback::add("on_is_crawling_changed", &function_3ba2fe8330d232b5);
}

// Namespace namespace_960978fc5a7ce390 / namespace_43e89ac0d1f8fd7a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc5
// Size: 0x23
function init_traverse() {
    self.var_db44b0ed0f52e2b = [];
    self.var_db44b0ed0f52e2b["is_crawling"] = namespace_9e6ef02d993a7eba::is_crawling();
}

// Namespace namespace_960978fc5a7ce390 / namespace_43e89ac0d1f8fd7a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xef
// Size: 0x27
function private function_3ba2fe8330d232b5(params) {
    self.var_db44b0ed0f52e2b["is_crawling"] = int(namespace_9e6ef02d993a7eba::is_crawling());
}

