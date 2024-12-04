#using script_44a4ad8c0d35f203;
#using scripts\engine\utility;

#namespace bullet_feedback;

// Namespace bullet_feedback / scripts\sp\player\bullet_feedback
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9d
// Size: 0x3f
function bullet_feedback_init() {
    namespace_d55725aa5dd0745b::init();
    level.player ent_flag_init("pause_suppression");
    level.player thread bulletwhizby_monitor();
    level.player namespace_d55725aa5dd0745b::initplayer();
}

// Namespace bullet_feedback / scripts\sp\player\bullet_feedback
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe4
// Size: 0x5c
function bulletwhizby_monitor() {
    self endon("death");
    while (true) {
        self waittill("bulletwhizby", attacker, distance, position, forward);
        if (!shoulddobulletwhizby()) {
            continue;
        }
        namespace_d55725aa5dd0745b::function_a6e6611efb4164d5(attacker, distance, position, forward);
    }
}

// Namespace bullet_feedback / scripts\sp\player\bullet_feedback
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x148
// Size: 0x14
function shoulddobulletwhizby() {
    if (ent_flag("pause_suppression")) {
        return false;
    }
    return true;
}

