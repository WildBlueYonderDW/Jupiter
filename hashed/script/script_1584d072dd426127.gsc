// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\stealth\event.gsc;

#namespace namespace_3bcb91eb4ed42d8;

// Namespace namespace_3bcb91eb4ed42d8/namespace_9ca3010f3836632d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1aa
// Size: 0x1f
function init() {
    if (!getdvarint(@"hash_7a7e37d9ccf3bff4", 1)) {
        return;
    }
    thread function_6daf5a86616316bd();
}

// Namespace namespace_3bcb91eb4ed42d8/namespace_9ca3010f3836632d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d0
// Size: 0x135
function function_6daf5a86616316bd() {
    level endon("game_ended");
    level.var_5dcc3658a9fccf63 = getstructarray("alarmmanager", "script_noteworthy");
    namespace_4b0406965e556711::function_1240434f4201ac9d("prematch_fade_done");
    wait(1);
    foreach (alarm in level.var_5dcc3658a9fccf63) {
        alarm.active = 0;
        alarm.glass = getglass(alarm.target);
        stickers = getentitylessscriptablearray(alarm.target, "targetname");
        if (stickers.size > 0) {
            /#
                assertex(stickers.size == 1, "glass at location " + alarm.origin + " has more than one sticker.  Please remove extras so there is only one.");
            #/
            alarm.sticker = stickers[0];
            if (isdefined(alarm.sticker)) {
                alarm.sticker setscriptablepartstate("base", "visible");
            }
        }
    }
    thread function_acdb910cc20a22fb();
}

// Namespace namespace_3bcb91eb4ed42d8/namespace_9ca3010f3836632d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x30c
// Size: 0x1ca
function function_acdb910cc20a22fb() {
    level endon("game_ended");
    if (!isdefined(level.var_cbe618f35b332990)) {
        level.var_cbe618f35b332990 = spawn("script_origin", (0, 0, 0));
    }
    while (1) {
        var_7cf165bc68d7f162 = level waittill("glass_destroyed");
        foreach (alarm in level.var_5dcc3658a9fccf63) {
            if (isdefined(alarm.glass) && alarm.glass == var_7cf165bc68d7f162) {
                if (isdefined(alarm.sticker)) {
                    alarm.sticker setscriptablepartstate("base", "destroyed");
                    level.var_cbe618f35b332990.var_1fb1e7fe25742f06 = alarm.sticker.origin;
                    namespace_92d413b0c411a750::event_broadcast_generic("cover_blown", alarm.sticker.origin, 2500, level.var_cbe618f35b332990);
                    level.var_cbe618f35b332990.var_1fb1e7fe25742f06 = (0, 0, 0);
                }
                if (!alarm.active) {
                    dlog_recordevent("dlog_event_br_window_alarm", [0:"window_x", 1:alarm.origin[0], 2:"window_y", 3:alarm.origin[1], 4:"window_z", 5:alarm.origin[2]]);
                }
            }
        }
    }
}

