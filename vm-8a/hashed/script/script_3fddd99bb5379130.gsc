#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\gametypes\br_publicevents.gsc;
#using script_294dda4a4b00ffe3;
#using script_261e315c49e5e4ef;
#using scripts\common\devgui.gsc;

#namespace namespace_37c7dafba349785b;

// Namespace namespace_37c7dafba349785b / namespace_63cf6ff9a005699c
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0xac
// Size: 0x1d
function autoexec main() {
    scripts\mp\gametypes\br_publicevents::function_dbc8f6cb3760cd82("loadoutdrop", &init);
    /#
        debug_init();
    #/
}

// Namespace namespace_37c7dafba349785b / namespace_63cf6ff9a005699c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd1
// Size: 0xba
function init(config) {
    eventinfo = spawnstruct();
    eventinfo.validatefunc = &validatefunc;
    eventinfo.activatefunc = &activatefunc;
    eventinfo.postinitfunc = &postinitfunc;
    eventinfo.weight = config.weight;
    eventinfo.var_d72a1842c5b57d1d = config.maxtimes;
    eventinfo.circleeventweights = scripts\mp\gametypes\br_publicevents::function_8fc51a5af06412cf(config.circleweights);
    eventinfo.var_b9b56551e1acfee2 = namespace_c711384b1335919::function_8be9bae8228a91f7("loadoutdrop");
    scripts\mp\gametypes\br_publicevents::registerpublicevent(21, eventinfo);
}

// Namespace namespace_37c7dafba349785b / namespace_63cf6ff9a005699c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x193
// Size: 0x39
function activatefunc() {
    level thread function_ad91760f4f41c169(0);
    level thread function_ab8c6a785614ca99(0);
    var_70bcbf0ad5028219 = [1, 1];
    namespace_f51c41a139e03299::function_607167c18661377b(var_70bcbf0ad5028219, undefined, 1);
}

// Namespace namespace_37c7dafba349785b / namespace_63cf6ff9a005699c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d4
// Size: 0x4
function validatefunc() {
    return true;
}

// Namespace namespace_37c7dafba349785b / namespace_63cf6ff9a005699c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e1
// Size: 0x2
function postinitfunc() {
    
}

/#

    // Namespace namespace_37c7dafba349785b / namespace_63cf6ff9a005699c
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1eb
    // Size: 0x5
    function __debug() {
        
    }

    // Namespace namespace_37c7dafba349785b / namespace_63cf6ff9a005699c
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1f8
    // Size: 0x2e
    function debug_init() {
        scripts\common\devgui::function_6e7290c8ee4f558b("<dev string:x1c>");
        scripts\common\devgui::function_a9a864379a098ad6("<dev string:x31>", "<dev string:x3e>", &function_db70bae7732f5204);
        scripts\common\devgui::function_fe953f000498048f();
    }

    // Namespace namespace_37c7dafba349785b / namespace_63cf6ff9a005699c
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x22e
    // Size: 0x10
    function function_db70bae7732f5204() {
        level thread scripts\mp\gametypes\br_publicevents::function_e37ee072d95a7c98(21);
    }

#/
