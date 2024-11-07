#using scripts\engine\utility.gsc;
#using script_53651341190c5aab;
#using scripts\asm\cap.gsc;

#namespace soldier_conversation;

// Namespace soldier_conversation / namespace_a01fc1e44854f961
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc3
// Size: 0x3f
function getfunction(funcid) {
    switch (funcid) {
    case #"hash_4d7ca12cb5ce1028":
        return &startcap;
    case #"hash_2265dc8309b4f346":
        return &function_8190fffc19bdbc2a;
    }
    return namespace_f901a4f9d899be59::function_efcea5d26798e5b6(funcid);
}

// Namespace soldier_conversation / namespace_a01fc1e44854f961
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10b
// Size: 0x10f
function function_8190fffc19bdbc2a(interactionid) {
    if (!isalive(self)) {
        users = function_adf0d34ff483c35a(interactionid);
        statename = "friend_down";
        alias = "friend_down_anim";
        foreach (user in users) {
            if (scripts\asm\cap::function_f179ede0989e6734(statename, alias)) {
                user._blackboard.var_7460b96395361857 = "friend_down";
            }
        }
        return;
    }
    if (isdefined(self.stealth) && self.var_fe5ebefa740c7106 != 0 || isdefined(self.var_fd01ad49b4e38ae8)) {
        self._blackboard.var_7460b96395361857 = "react";
        return;
    }
    self._blackboard.var_7460b96395361857 = "end";
}

// Namespace soldier_conversation / namespace_a01fc1e44854f961
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x222
// Size: 0x1c
function startcap(statename, params) {
    namespace_f901a4f9d899be59::startcap(statename, params);
}

