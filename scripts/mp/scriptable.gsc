// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\flags.gsc;

#namespace scriptable;

// Namespace scriptable/namespace_4a9a40b901844a85
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a
// Size: 0xf
function scriptable_mpglobalcallback() {
    namespace_17c25f0877bfb620::scriptable_setinitcallback(&scriptable_mpcallback);
}

// Namespace scriptable/namespace_4a9a40b901844a85
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb0
// Size: 0x35
function scriptable_mpcallback() {
    namespace_4b0406965e556711::levelflagset("scriptables_ready");
    if (!flag_exist("scriptables_ready")) {
        flag_init("scriptables_ready");
    }
    flag_set("scriptables_ready");
}

