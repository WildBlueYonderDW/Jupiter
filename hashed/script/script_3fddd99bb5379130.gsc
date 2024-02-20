// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\gametypes\br_publicevents.gsc;
#using script_294dda4a4b00ffe3;
#using script_261e315c49e5e4ef;
#using script_38eb8f4be20d54f4;

#namespace namespace_37c7dafba349785b;

// Namespace namespace_37c7dafba349785b/namespace_63cf6ff9a005699c
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0xac
// Size: 0x1e
function autoexec main() {
    namespace_d76af9f804655767::function_dbc8f6cb3760cd82("loadoutdrop", &init);
    /#
        debug_init();
    #/
}

// Namespace namespace_37c7dafba349785b/namespace_63cf6ff9a005699c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd1
// Size: 0xbb
function init(config) {
    var_7ec7671a1e0c788f = spawnstruct();
    var_7ec7671a1e0c788f.validatefunc = &validatefunc;
    var_7ec7671a1e0c788f.activatefunc = &activatefunc;
    var_7ec7671a1e0c788f.var_c9e871d29702e8cf = &function_c9e871d29702e8cf;
    var_7ec7671a1e0c788f.weight = config.weight;
    var_7ec7671a1e0c788f.var_d72a1842c5b57d1d = config.var_ce4b48e2a63b3705;
    var_7ec7671a1e0c788f.var_f0f6529c88a18128 = namespace_d76af9f804655767::function_8fc51a5af06412cf(config.var_2b5e23900f3a692e);
    var_7ec7671a1e0c788f.var_b9b56551e1acfee2 = namespace_c711384b1335919::function_8be9bae8228a91f7("loadoutdrop");
    namespace_d76af9f804655767::registerpublicevent(21, var_7ec7671a1e0c788f);
}

// Namespace namespace_37c7dafba349785b/namespace_63cf6ff9a005699c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x193
// Size: 0x3a
function activatefunc() {
    level thread function_ad91760f4f41c169(0);
    level thread function_ab8c6a785614ca99(0);
    var_70bcbf0ad5028219 = [0:1, 1:1];
    namespace_f51c41a139e03299::function_607167c18661377b(var_70bcbf0ad5028219, undefined, 1);
}

// Namespace namespace_37c7dafba349785b/namespace_63cf6ff9a005699c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d4
// Size: 0x5
function validatefunc() {
    return 1;
}

// Namespace namespace_37c7dafba349785b/namespace_63cf6ff9a005699c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e1
// Size: 0x3
function function_c9e871d29702e8cf() {
    
}

// Namespace namespace_37c7dafba349785b/namespace_63cf6ff9a005699c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1eb
// Size: 0x6
function function_3a24d044bf8e442e() {
    /#
    #/
}

// Namespace namespace_37c7dafba349785b/namespace_63cf6ff9a005699c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f8
// Size: 0x2f
function debug_init() {
    /#
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>");
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_db70bae7732f5204);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
    #/
}

// Namespace namespace_37c7dafba349785b/namespace_63cf6ff9a005699c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22e
// Size: 0x11
function function_db70bae7732f5204() {
    /#
        level thread namespace_d76af9f804655767::function_e37ee072d95a7c98(21);
    #/
}

