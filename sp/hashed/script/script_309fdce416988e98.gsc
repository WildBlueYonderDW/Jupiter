#using script_72ef6b9f0cf1f55a;
#using scripts\engine\sp\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\system.gsc;
#using scripts\common\ui.gsc;

#namespace compass_messaging;

// Namespace compass_messaging / namespace_5d422cd60f12e32e
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x1b3
// Size: 0x21
function private autoexec __init__system__() {
    system::register(#"compass_messaging", #"hash_58f5dc856591d010", &pre_main, undefined);
}

// Namespace compass_messaging / namespace_5d422cd60f12e32e
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1dc
// Size: 0x81
function private pre_main() {
    if (!isdefined(level.compass_messaging)) {
        level.compass_messaging = spawnstruct();
    }
    level.compass_messaging.widget = function_6cd0a8e23ff14e13("scripted_widget_compass_area_display");
    level.compass_messaging.var_59c6013a7507e6a = [];
    scripts\common\ui::lui_registercallback("compass_area_display_simple_message_done", &function_e8b07426ecc4985d);
    function_38e800ec19177b32(["in_search_area", "restricted_area"], "in_restricted_search_area");
}

// Namespace compass_messaging / namespace_5d422cd60f12e32e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x265
// Size: 0x8f
function function_38e800ec19177b32(var_23ef8d2ca61c2ef, var_b469cdf176e59127) {
    index = level.compass_messaging.var_59c6013a7507e6a.size;
    level.compass_messaging.var_59c6013a7507e6a[index] = spawnstruct();
    level.compass_messaging.var_59c6013a7507e6a[index].var_23ef8d2ca61c2ef = var_23ef8d2ca61c2ef;
    level.compass_messaging.var_59c6013a7507e6a[index].var_b469cdf176e59127 = var_b469cdf176e59127;
}

// Namespace compass_messaging / namespace_5d422cd60f12e32e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2fc
// Size: 0xbc
function function_2d2bf9bf75ae791e(var_bd4d9cdcb3a696c8, message) {
    if (!isdefined(level.compass_messaging.widget)) {
        return;
    }
    if (!isdefined(self.compass_messaging)) {
        self.compass_messaging = spawnstruct();
        self.compass_messaging.messages = [];
    }
    if (isdefined(message)) {
        message = function_8c14a8a658013e4e(message);
    }
    if (isdefined(self.compass_messaging.messages[var_bd4d9cdcb3a696c8]) && (!isdefined(message) || array_contains(self.compass_messaging.messages[var_bd4d9cdcb3a696c8].messages, message))) {
        return;
    }
    function_995628fd8247db2f(var_bd4d9cdcb3a696c8, message);
}

// Namespace compass_messaging / namespace_5d422cd60f12e32e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3c0
// Size: 0x137
function function_376aee39c931c5ff(var_bd4d9cdcb3a696c8, message) {
    if (isdefined(self.compass_messaging) && isdefined(self.compass_messaging.messages[var_bd4d9cdcb3a696c8])) {
        if (isdefined(message) && isistring(message)) {
            message = function_8c14a8a658013e4e(message);
        }
        if (!isdefined(message) || self.compass_messaging.messages[var_bd4d9cdcb3a696c8].messages.size == 1 && self.compass_messaging.messages[var_bd4d9cdcb3a696c8].messages[0] == message) {
            function_7c17bfd98aea6570(var_bd4d9cdcb3a696c8);
            return;
        }
        update = 0;
        if (self.compass_messaging.messages[var_bd4d9cdcb3a696c8].messages[0] == message) {
            update = 1;
        }
        self.compass_messaging.messages[var_bd4d9cdcb3a696c8].messages = array_remove(self.compass_messaging.messages[var_bd4d9cdcb3a696c8].messages, message);
        if (update) {
            function_8466c8d7d5bfa33a();
        }
    }
}

// Namespace compass_messaging / namespace_5d422cd60f12e32e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ff
// Size: 0x20
function function_716cd5eee423ff24() {
    self notify("compass_message_closed");
    self.compass_messaging = undefined;
    function_f2784cc23bce336("hide");
}

// Namespace compass_messaging / namespace_5d422cd60f12e32e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x527
// Size: 0x42
function function_f2784cc23bce336(var_c9913039c855ec7e) {
    assertex(isdefined(var_c9913039c855ec7e), "You must specify a state string defined in the <" + level.compass_messaging.widget + "> asset.");
    function_d28fa5295a04d555("compass_messaging", var_c9913039c855ec7e);
}

// Namespace compass_messaging / namespace_5d422cd60f12e32e
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x571
// Size: 0x3d
function private function_e8b07426ecc4985d(val) {
    if (isdefined(self.compass_messaging.var_3b4ef3dd92b5337c)) {
        function_376aee39c931c5ff(self.compass_messaging.var_3b4ef3dd92b5337c, val);
    }
}

// Namespace compass_messaging / namespace_5d422cd60f12e32e
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x5b6
// Size: 0x23c
function private function_995628fd8247db2f(var_bd4d9cdcb3a696c8, message, var_8641c5c765d283f4) {
    if (!isdefined(var_8641c5c765d283f4)) {
        var_8641c5c765d283f4 = 0;
    }
    if (!isdefined(self.compass_messaging.messages[var_bd4d9cdcb3a696c8])) {
        self.compass_messaging.messages[var_bd4d9cdcb3a696c8] = spawnstruct();
        self.compass_messaging.messages[var_bd4d9cdcb3a696c8].index = function_7be2b65191088c8a(level.compass_messaging.widget, var_bd4d9cdcb3a696c8);
        self.compass_messaging.messages[var_bd4d9cdcb3a696c8].messages = [];
        self.compass_messaging.messages[var_bd4d9cdcb3a696c8].var_8641c5c765d283f4 = var_8641c5c765d283f4;
    }
    if (isdefined(message)) {
        self.compass_messaging.messages[var_bd4d9cdcb3a696c8].messages = array_add(self.compass_messaging.messages[var_bd4d9cdcb3a696c8].messages, message);
    }
    foreach (combo in level.compass_messaging.var_59c6013a7507e6a) {
        if (!isdefined(self.compass_messaging.messages[combo.var_b469cdf176e59127])) {
            var_5bbfc040446ef991 = 1;
            foreach (param in combo.var_23ef8d2ca61c2ef) {
                if (!isdefined(self.compass_messaging.messages[param])) {
                    var_5bbfc040446ef991 = 0;
                    break;
                }
            }
            if (var_5bbfc040446ef991) {
                function_995628fd8247db2f(combo.var_b469cdf176e59127, undefined, 1);
            }
        }
    }
    if (!var_8641c5c765d283f4) {
        function_8466c8d7d5bfa33a();
    }
}

// Namespace compass_messaging / namespace_5d422cd60f12e32e
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x7fa
// Size: 0x112
function private function_7c17bfd98aea6570(var_bd4d9cdcb3a696c8, var_34c256cc3718ee19) {
    if (!isdefined(var_34c256cc3718ee19)) {
        var_34c256cc3718ee19 = 0;
    }
    self notify("compass_message_removed_" + var_bd4d9cdcb3a696c8);
    self.compass_messaging.messages[var_bd4d9cdcb3a696c8] = undefined;
    foreach (combo in level.compass_messaging.var_59c6013a7507e6a) {
        if (isdefined(self.compass_messaging.messages[combo.var_b469cdf176e59127]) && self.compass_messaging.messages[combo.var_b469cdf176e59127].var_8641c5c765d283f4) {
            if (array_contains(combo.var_23ef8d2ca61c2ef, var_bd4d9cdcb3a696c8)) {
                function_7c17bfd98aea6570(combo.var_b469cdf176e59127, 1);
            }
        }
    }
    if (!var_34c256cc3718ee19) {
        function_8466c8d7d5bfa33a();
    }
}

// Namespace compass_messaging / namespace_5d422cd60f12e32e
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x914
// Size: 0x114
function private function_8466c8d7d5bfa33a() {
    if (self.compass_messaging.messages.size == 0) {
        function_716cd5eee423ff24();
        return;
    }
    highest_priority = -1;
    var_9bcb4f4973c9c5e6 = undefined;
    foreach (message in self.compass_messaging.messages) {
        if (message.index > highest_priority) {
            highest_priority = message.index;
            var_9bcb4f4973c9c5e6 = ref;
        }
    }
    if (isdefined(var_9bcb4f4973c9c5e6) && (!isdefined(self.compass_messaging.var_3b4ef3dd92b5337c) || self.compass_messaging.var_3b4ef3dd92b5337c != var_9bcb4f4973c9c5e6 || self.compass_messaging.messages[var_9bcb4f4973c9c5e6].messages.size > 0)) {
        function_309fb06c47e16c0f(var_9bcb4f4973c9c5e6);
    }
}

// Namespace compass_messaging / namespace_5d422cd60f12e32e
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa30
// Size: 0xd5
function private function_309fb06c47e16c0f(ref) {
    self.compass_messaging.var_3b4ef3dd92b5337c = ref;
    message = self.compass_messaging.messages[ref];
    if (!function_ada0825249682644("compass_messaging")) {
        function_90de31b2cbef19f9("compass_messaging", level.compass_messaging.widget);
        function_f4c37324750dc183("compass_messaging", 0, 40, 1, 0, 1);
    }
    function_af4f62f0f944a8f1("compass_messaging", ref);
    function_f2784cc23bce336("show");
    fields = [];
    fields["message_param"] = default_to(array_get_first_item(message.messages), 0);
    function_14a0ee2aaf9128c3("compass_messaging", fields, 1);
}

