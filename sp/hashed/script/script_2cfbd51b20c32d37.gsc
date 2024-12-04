#using script_35de402efc5acfb3;
#using scripts\anim\utility_common;
#using scripts\common\utility;
#using scripts\engine\utility;

#namespace battlechatter_wrapper;

// Namespace battlechatter_wrapper / namespace_85ac543d191cba31
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x97
// Size: 0xb
function evaluatemoveevent(var_76af5757c71b312c) {
    
}

// Namespace battlechatter_wrapper / namespace_85ac543d191cba31
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaa
// Size: 0x2
function evaluatereloadevent() {
    
}

// Namespace battlechatter_wrapper / namespace_85ac543d191cba31
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb4
// Size: 0x2a
function function_f56c2de6db70455f(enemytype, enemy) {
    executeevent("spotted", [enemytype, enemy]);
}

// Namespace battlechatter_wrapper / namespace_85ac543d191cba31
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe6
// Size: 0x18
function evaluateattackevent(type) {
    executeevent("attack", type);
}

