// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\flags.gsc;

#namespace scriptable;

// Namespace scriptable / scripts/mp/scriptable
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a
// Size: 0xf
function scriptable_mpglobalcallback() {
    scripts/engine/scriptable::scriptable_setinitcallback(&scriptable_mpcallback);
}

// Namespace scriptable / scripts/mp/scriptable
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb0
// Size: 0x35
function scriptable_mpcallback() {
    scripts/mp/flags::levelflagset("scriptables_ready");
    if (!flag_exist("scriptables_ready")) {
        flag_init("scriptables_ready");
    }
    flag_set("scriptables_ready");
}

