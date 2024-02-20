// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\stealth\threat_sight.gsc;
#using scripts\stealth\callbacks.gsc;
#using scripts\stealth\debug.gsc;
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\stealth\enemy.gsc;
#using scripts\stealth\group.gsc;
#using scripts\stealth\event.gsc;

#namespace neutral;

// Namespace neutral/namespace_aa303642163f52a7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc7
// Size: 0xb3
function main() {
    if (isdefined(self.stealth)) {
        return;
    }
    namespace_6db9b2dcda758664::init_settings();
    self.neutralsenses = 1;
    self.var_d7f4a1b60f84e53f = self.script_stealthgroup;
    namespace_6db9b2dcda758664::init_flags();
    namespace_e5c9a7258a3d79cb::addtogroup(self.script_stealthgroup, self);
    self function_4db6fc194702d153();
    namespace_92d413b0c411a750::event_init_entity();
    thread namespace_6db9b2dcda758664::monitor_damage_thread(level.stealth.damage_auto_range, level.stealth.damage_sight_range);
    /#
        thread namespace_91707ccc3e1bf8ff::function_f545d4a803ca4bd7();
    #/
    self function_1aff80c5fc5a3eea("noncombat");
    namespace_6db9b2dcda758664::bt_set_stealth_state("idle");
    namespace_6db9b2dcda758664::stealth_init_goal_radius();
}

