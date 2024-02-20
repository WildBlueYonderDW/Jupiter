// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_7ab5b649fa408138;
#using scripts\mp\utility\sound.gsc;
#using scripts\mp\utility\game.gsc;

#namespace audio;

// Namespace audio/namespace_6d5a878b89a00070
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed
// Size: 0x3a
function init_audio() {
    if (!isdefined(level.audio)) {
        level.audio = spawnstruct();
    }
    function_6dca6f439ca0a74f();
    init_reverb();
    level.onplayerconnectaudioinit = &onplayerconnectaudioinit;
}

// Namespace audio/namespace_6d5a878b89a00070
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12e
// Size: 0x3f
function onplayerconnectaudioinit() {
    apply_reverb("default");
    if (getdvarint(@"hash_66c38b5b61297ac1") == 1) {
        setglobalsoundcontext("thirdpersonmode", "on");
    }
    self setsoundsubmix("hit_indicator_hipfire");
}

// Namespace audio/namespace_6d5a878b89a00070
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x174
// Size: 0x20
function init_reverb() {
    add_reverb("default", "generic", 0.15, 0.9, 2);
}

// Namespace audio/namespace_6d5a878b89a00070
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19b
// Size: 0x9c
function add_reverb(name, type, wetlevel, drylevel, fadetime) {
    /#
        assert(isdefined(type));
    #/
    /#
        assert(isdefined(wetlevel));
    #/
    /#
        assert(isdefined(drylevel));
    #/
    reverb = [];
    is_roomtype_valid(type);
    reverb["roomtype"] = type;
    reverb["wetlevel"] = wetlevel;
    reverb["drylevel"] = drylevel;
    reverb["fadetime"] = fadetime;
    level.audio.reverb_settings[name] = reverb;
}

// Namespace audio/namespace_6d5a878b89a00070
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23e
// Size: 0x170
function is_roomtype_valid(type) {
    /#
        switch (type) {
        case #"hash_cb77b3d8a372e08":
        case #"hash_fc258a369439547":
        case #"hash_1b4f1c09bc30f8b7":
        case #"hash_1c5d5131b5fa462e":
        case #"hash_3d9ccd28b21cb88e":
        case #"hash_3e5e0a1ebaebcc7d":
        case #"hash_3f9f17c1662d120a":
        case #"hash_4bdd565aad97d89e":
        case #"hash_4d3e369017db8fda":
        case #"hash_5ff8e011d5b9d1c8":
        case #"hash_67c4c671ba316fb9":
        case #"hash_6929fc3845c34be3":
        case #"hash_8944a3af59c61e8b":
        case #"hash_8a6d0b4f5207c46b":
        case #"hash_9e7f75efc4013b79":
        case #"hash_a1800029963e0fb8":
        case #"hash_af68187c92c7fbc0":
        case #"hash_afe4256f96628234":
        case #"hash_b445759ac0026f01":
        case #"hash_c16009bb5fe873b1":
        case #"hash_dc295829b4ceffa2":
        case #"hash_de1caed68cb47987":
        case #"hash_e991ce5bbbefabf9":
        case #"hash_ed5b5dc2ce86f143":
        case #"hash_f1a23e97c35685da":
        case #"hash_f67bf6cfc4a6bc7a":
            
        default:
            /#
                assertmsg(type + "<unknown string>");
            #/
            break;
        }
    #/
}

// Namespace audio/namespace_6d5a878b89a00070
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b5
// Size: 0x63
function apply_reverb(name) {
    if (!isdefined(level.audio.reverb_settings[name])) {
        reverb = level.audio.reverb_settings["default"];
    } else {
        reverb = level.audio.reverb_settings[name];
    }
}

