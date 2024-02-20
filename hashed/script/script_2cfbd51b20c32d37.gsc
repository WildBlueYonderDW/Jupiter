// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\anim\utility_common.gsc;
#using script_35de402efc5acfb3;

#namespace namespace_9484aab99c9709b4;

// Namespace namespace_9484aab99c9709b4/namespace_85ac543d191cba31
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x97
// Size: 0xc
function evaluatemoveevent(var_76af5757c71b312c) {
    
}

// Namespace namespace_9484aab99c9709b4/namespace_85ac543d191cba31
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaa
// Size: 0x3
function evaluatereloadevent() {
    
}

// Namespace namespace_9484aab99c9709b4/namespace_85ac543d191cba31
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb4
// Size: 0x2b
function function_f56c2de6db70455f(var_c5b28f88d9b3bfd7, enemy) {
    function_c0da17570a24346c("spotted", [0:var_c5b28f88d9b3bfd7, 1:enemy]);
}

// Namespace namespace_9484aab99c9709b4/namespace_85ac543d191cba31
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe6
// Size: 0x19
function evaluateattackevent(type) {
    function_c0da17570a24346c("attack", type);
}

