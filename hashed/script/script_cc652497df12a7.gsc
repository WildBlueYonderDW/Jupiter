#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\bots\bots_strategy.gsc;
#using scripts\mp\bots\bots_gametype_common.gsc;
#using scripts\mp\gameobjects.gsc;

#namespace namespace_b42a3e1ccd896bd5;

// Namespace namespace_b42a3e1ccd896bd5 / namespace_a342547bb5b1897d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x160
// Size: 0x10
function main() {
    setup_callbacks();
    function_a84ac36891eff2cb();
}

/#

    // Namespace namespace_b42a3e1ccd896bd5 / namespace_a342547bb5b1897d
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x178
    // Size: 0x5
    function function_e45e46b7c35deadb() {
        
    }

#/

// Namespace namespace_b42a3e1ccd896bd5 / namespace_a342547bb5b1897d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x185
// Size: 0x17
function setup_callbacks() {
    level.bot_funcs["gametype_think"] = &bot_ko_think;
}

// Namespace namespace_b42a3e1ccd896bd5 / namespace_a342547bb5b1897d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a4
// Size: 0x2
function function_a84ac36891eff2cb() {
    
}

// Namespace namespace_b42a3e1ccd896bd5 / namespace_a342547bb5b1897d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ae
// Size: 0x1e3
function bot_ko_think() {
    self notify("bot_ko_think");
    self endon("bot_ko_think");
    self endon("death_or_disconnect");
    level endon("game_ended");
    self.next_flag_hide_time = 0;
    self botsetflag("separation", 0);
    self botsetflag("use_obj_path_style", 1);
    while (true) {
        /#
            if (getdvarint(@"bot_DisableAllAI")) {
                wait 0.05;
                continue;
            }
        #/
        flagownerteam = level.var_d63f297a45dd1f87 scripts\mp\gameobjects::getownerteam();
        if (flagownerteam == "none" || flagownerteam == "neutral") {
            clear_defend();
            self botsetscriptgoal(level.var_d63f297a45dd1f87.curorigin, 16, "critical");
        } else if (flagownerteam == self.team) {
            if (level.var_d63f297a45dd1f87.currentcarrier == self) {
                if (gettime() > self.next_flag_hide_time) {
                    clear_defend();
                    nodes = getnodesinradius(self.origin, 900, 0, 300);
                    hide_node = self botnodepick(nodes, nodes.size * 0.15, "node_hide_anywhere");
                    if (isdefined(hide_node)) {
                        success = self botsetscriptgoalnode(hide_node, "critical");
                        if (success) {
                            self.next_flag_hide_time = gettime() + 15000;
                        }
                    }
                }
            } else if (!bot_is_bodyguarding()) {
                clear_defend();
                self botclearscriptgoal();
                bot_guard_player(level.var_d63f297a45dd1f87.currentcarrier, 500);
            }
        } else {
            clear_defend();
            self botsetscriptgoal(level.var_d63f297a45dd1f87.currentcarrier.origin, 16, "critical");
        }
        wait 0.05;
    }
}

// Namespace namespace_b42a3e1ccd896bd5 / namespace_a342547bb5b1897d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x399
// Size: 0x12
function clear_defend() {
    if (bot_is_defending()) {
        bot_defend_stop();
    }
}

