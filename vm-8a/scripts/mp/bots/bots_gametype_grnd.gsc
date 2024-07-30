#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\bots\bots_strategy.gsc;

#namespace bots_gametype_grnd;

// Namespace bots_gametype_grnd / scripts\mp\bots\bots_gametype_grnd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xed
// Size: 0x10
function main() {
    setup_callbacks();
    setup_bot_grnd();
}

/#

    // Namespace bots_gametype_grnd / scripts\mp\bots\bots_gametype_grnd
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x105
    // Size: 0x5
    function function_e45e46b7c35deadb() {
        
    }

#/

// Namespace bots_gametype_grnd / scripts\mp\bots\bots_gametype_grnd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x112
// Size: 0x17
function setup_callbacks() {
    level.bot_funcs["gametype_think"] = &bot_grnd_think;
}

// Namespace bots_gametype_grnd / scripts\mp\bots\bots_gametype_grnd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x131
// Size: 0x21
function setup_bot_grnd() {
    bot_waittill_bots_enabled(1);
    level.protect_radius = 128;
    level.bot_gametype_precaching_done = 1;
}

// Namespace bots_gametype_grnd / scripts\mp\bots\bots_gametype_grnd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15a
// Size: 0xdd
function bot_grnd_think() {
    self notify("bot_grnd_think");
    self endon("bot_grnd_think");
    self endon("death_or_disconnect");
    level endon("game_ended");
    self botclearscriptgoal();
    while (!isdefined(level.bot_gametype_precaching_done)) {
        wait 0.05;
    }
    self botsetflag("separation", 0);
    thread clear_defend();
    while (true) {
        wait 0.05;
        if (bot_has_tactical_goal()) {
            continue;
        }
        if (!self bothasscriptgoal()) {
            position = getnodeinzone();
            if (isdefined(position)) {
                self botsetscriptgoal(position.origin, 0, "objective");
            }
            continue;
        }
        if (!bot_is_defending()) {
            self botclearscriptgoal();
            position = getnodeinzone();
            if (isdefined(position)) {
                bot_protect_point(position.origin, level.protect_radius);
            }
        }
    }
}

// Namespace bots_gametype_grnd / scripts\mp\bots\bots_gametype_grnd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23f
// Size: 0x22
function clear_defend() {
    while (true) {
        level waittill("zone_reset");
        if (bot_is_defending()) {
            bot_defend_stop();
        }
    }
}

// Namespace bots_gametype_grnd / scripts\mp\bots\bots_gametype_grnd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x269
// Size: 0x56
function getnodeinzone() {
    nodes = getnodesintrigger(level.zone.trigger);
    if (nodes.size == 0 || !isdefined(nodes)) {
        return undefined;
    }
    nodesnum = randomintrange(0, nodes.size);
    position = nodes[nodesnum];
    return position;
}

// Namespace bots_gametype_grnd / scripts\mp\bots\bots_gametype_grnd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c8
// Size: 0x2
function temp() {
    
}

