// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_53651341190c5aab;
#using script_4e1d4dd23699a8a4;

#namespace namespace_1c7df4b6943c83c1;

// Namespace namespace_1c7df4b6943c83c1/namespace_a01fc1e44854f961
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc3
// Size: 0x40
function function_36ae2d2c117cdb23(var_cc4f2e0388379546) {
    switch (var_cc4f2e0388379546) {
    case #"hash_4d7ca12cb5ce1028":
        return &function_29946584b628c719;
    case #"hash_2265dc8309b4f346":
        return &function_8190fffc19bdbc2a;
        break;
    }
    return namespace_f901a4f9d899be59::function_efcea5d26798e5b6(var_cc4f2e0388379546);
}

// Namespace namespace_1c7df4b6943c83c1/namespace_a01fc1e44854f961
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10b
// Size: 0x114
function function_8190fffc19bdbc2a(var_f8d4ed108521e632) {
    if (!isalive(self)) {
        users = function_adf0d34ff483c35a(var_f8d4ed108521e632);
        statename = "friend_down";
        alias = "friend_down_anim";
        foreach (user in users) {
            if (namespace_dd3a5c61bf082e18::function_f179ede0989e6734(statename, alias)) {
                user._blackboard.var_7460b96395361857 = "friend_down";
            }
        }
    } else if (isdefined(self.stealth) && self.var_fe5ebefa740c7106 != 0 || isdefined(self.var_fd01ad49b4e38ae8)) {
        self._blackboard.var_7460b96395361857 = "react";
    } else {
        self._blackboard.var_7460b96395361857 = "end";
    }
}

// Namespace namespace_1c7df4b6943c83c1/namespace_a01fc1e44854f961
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x226
// Size: 0x1d
function function_29946584b628c719(statename, params) {
    namespace_f901a4f9d899be59::function_29946584b628c719(statename, params);
}

