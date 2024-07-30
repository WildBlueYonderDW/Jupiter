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

// Namespace neutral / scripts\stealth\neutral
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc7
// Size: 0xb2
function main() {
    if (isdefined(self.stealth)) {
        return;
    }
    scripts\stealth\enemy::init_settings();
    self.neutralsenses = 1;
    self.stealth_groupname = self.script_stealthgroup;
    scripts\stealth\enemy::init_flags();
    scripts\stealth\group::addtogroup(self.script_stealthgroup, self);
    self function_4db6fc194702d153();
    scripts\stealth\event::event_init_entity();
    thread scripts\stealth\enemy::monitor_damage_thread(level.stealth.damage_auto_range, level.stealth.damage_sight_range);
    /#
        thread scripts\stealth\debug::debug_enemy();
    #/
    self function_1aff80c5fc5a3eea("noncombat");
    scripts\stealth\enemy::bt_set_stealth_state("idle");
    scripts\stealth\enemy::stealth_init_goal_radius();
}

