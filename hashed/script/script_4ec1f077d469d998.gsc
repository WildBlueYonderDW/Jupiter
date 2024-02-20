// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_5d813d45c6b1b1be;

#namespace namespace_a5e891e44109f8db;

// Namespace namespace_a5e891e44109f8db/namespace_e9b0ed286e0145cc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x102
// Size: 0x114
function init(var_5179c48492d1d2c2) {
    function_efabc5ae0422de9e(var_5179c48492d1d2c2);
    var_5179c48492d1d2c2.triggers = [];
    var_5179c48492d1d2c2.participants = [];
    structs = getstructarray(var_5179c48492d1d2c2.target, "targetname");
    foreach (struct in structs) {
        var_5179c48492d1d2c2.triggers = array_add(var_5179c48492d1d2c2.triggers, namespace_8eedd8f6cf5d9f19::function_698513ab21b7913d(struct));
    }
    foreach (trigger in var_5179c48492d1d2c2.triggers) {
        thread function_b8af89d13c8c2c23(var_5179c48492d1d2c2, trigger);
    }
}

// Namespace namespace_a5e891e44109f8db/namespace_e9b0ed286e0145cc
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x21d
// Size: 0x17e
function private function_b8af89d13c8c2c23(var_5179c48492d1d2c2, var_f770e9d1531ed3cd) {
    var_5179c48492d1d2c2 endon("MRP_NUCLEAR_NOTIFY_SUCCESS");
    while (1) {
        data = var_f770e9d1531ed3cd waittill("trigger");
        if (isplayer(data) && !data isonground() && data isparachuting()) {
            /#
                iprintlnbold("<unknown string>");
            #/
            var_8efef5b1e4d79b79 = data getentitynumber();
            if (!isdefined(var_5179c48492d1d2c2.participants[var_8efef5b1e4d79b79])) {
                var_5179c48492d1d2c2.participants[var_8efef5b1e4d79b79] = [];
            }
            data thread function_6ac96bbbe4d24c6b(var_5179c48492d1d2c2);
            if (!array_contains(var_5179c48492d1d2c2.participants[var_8efef5b1e4d79b79], var_f770e9d1531ed3cd)) {
                var_5179c48492d1d2c2.participants[var_8efef5b1e4d79b79] = array_add(var_5179c48492d1d2c2.participants[var_8efef5b1e4d79b79], var_f770e9d1531ed3cd);
                function_43c810b52ef4956b(data, var_5179c48492d1d2c2.participants[var_8efef5b1e4d79b79].size);
            }
            if (var_5179c48492d1d2c2.participants[var_8efef5b1e4d79b79].size >= var_5179c48492d1d2c2.triggers.size) {
                function_568b8a57e0fa955f(var_5179c48492d1d2c2, data);
                data thread function_e91b33a3f6f80a68();
                foreach (trigger in var_5179c48492d1d2c2.triggers) {
                    trigger delete();
                }
                var_5179c48492d1d2c2 notify("MRP_NUCLEAR_NOTIFY_SUCCESS");
                return;
            }
        }
    }
}

// Namespace namespace_a5e891e44109f8db/namespace_e9b0ed286e0145cc
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3a2
// Size: 0x23
function private function_43c810b52ef4956b(player, var_8bc0c3dfc3ad503b) {
    player playsoundtoplayer("evt_ob_mrpeeks_stinger_progression_lvl_" + var_8bc0c3dfc3ad503b, player);
}

// Namespace namespace_a5e891e44109f8db/namespace_e9b0ed286e0145cc
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3cc
// Size: 0x31
function private function_6ac96bbbe4d24c6b(var_5179c48492d1d2c2) {
    while (1) {
        if (self isonground()) {
            var_5179c48492d1d2c2.participants[self getentitynumber()] = undefined;
            return;
        }
        waitframe();
    }
}

// Namespace namespace_a5e891e44109f8db/namespace_e9b0ed286e0145cc
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x404
// Size: 0x20
function private function_e91b33a3f6f80a68() {
    while (!self isonground()) {
        waitframe();
    }
    namespace_8eedd8f6cf5d9f19::function_a4dfabe55dd4a652(self, undefined, "ob_jup_items_activity_mrp_nuclear_precision", 1);
}

