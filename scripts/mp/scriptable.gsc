#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\flags.gsc;

#namespace scriptable;

// Namespace scriptable / scripts\mp\scriptable
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbd
// Size: 0xe
function scriptable_mpglobalcallback() {
    scripts\engine\scriptable::scriptable_setinitcallback(&scriptable_mpcallback);
}

// Namespace scriptable / scripts\mp\scriptable
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd3
// Size: 0x34
function scriptable_mpcallback() {
    scripts\mp\flags::levelflagset("scriptables_ready");
    if (!flag_exist("scriptables_ready")) {
        flag_init("scriptables_ready");
    }
    flag_set("scriptables_ready");
}

