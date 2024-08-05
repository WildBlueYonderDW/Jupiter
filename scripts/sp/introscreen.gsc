#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\sp\hud_util.gsc;
#using script_575fda2758b0a36e;

#namespace introscreen;

// Namespace introscreen / scripts\sp\introscreen
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11f
// Size: 0xe
function init_introscreen() {
    flag_init("introscreen_complete");
}

// Namespace introscreen / scripts\sp\introscreen
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x135
// Size: 0x38
function main() {
    precacheshader("black");
    /#
        setdevdvarifuninitialized(@"hash_aed83730eafa2578", "<dev string:x1c>");
    #/
    setomnvar("ui_chyron_on", 0);
    thread main_thread();
}

// Namespace introscreen / scripts\sp\introscreen
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x175
// Size: 0x7d
function main_thread() {
    flag_wait("start_is_set");
    var_8fd2f9e5c4358def = 0;
    /#
        var_8fd2f9e5c4358def = getdvar(@"hash_aed83730eafa2578") == "<dev string:x1e>";
    #/
    thread quick_fadeup();
    if (!is_default_start() || var_8fd2f9e5c4358def) {
        delaythread(0.05, &flag_set, "introscreen_complete");
        return;
    }
    if (!flag("introscreen_custom")) {
        delaythread(1, &introscreen);
    }
}

// Namespace introscreen / scripts\sp\introscreen
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fa
// Size: 0x39
function level_has_chyron() {
    mapinfo = function_f1e2d555fd823e99();
    return isdefined(mapinfo) && isdefined(mapinfo.var_589e062e2afaa7b8) && mapinfo.var_589e062e2afaa7b8 != %;
}

// Namespace introscreen / scripts\sp\introscreen
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23c
// Size: 0x42
function quick_fadeup() {
    level.var_1eb2a64ead0ad6f5 = create_client_overlay("black", 1);
    wait 0.2;
    level.var_1eb2a64ead0ad6f5.alpha = 0;
    level.var_1eb2a64ead0ad6f5 destroy();
}

// Namespace introscreen / scripts\sp\introscreen
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x286
// Size: 0xa0
function introscreen(var_de42e9cd2606a1d4, var_b27cad3410976f5e) {
    if (flag_exist("introscreen_start_wait")) {
        flag_wait("introscreen_start_wait");
    }
    index = namespace_d6cca25f4b0ab62::getlevelindex(level.script);
    if (!isdefined(index)) {
        return;
    }
    index += 1;
    setomnvar("ui_chyron_level_index", index);
    setomnvar("ui_chyron_on", 1);
    setomnvar("ui_hide_dpad_hud", 1);
    wait 6;
    setomnvar("ui_hide_dpad_hud", 0);
    setomnvar("ui_chyron_on", 0);
    flag_set("introscreen_complete");
}

