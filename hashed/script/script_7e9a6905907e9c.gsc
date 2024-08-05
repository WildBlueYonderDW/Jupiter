#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;

#namespace namespace_8b4ca639c85dfd2a;

// Namespace namespace_8b4ca639c85dfd2a / namespace_4a18ecbfbbf3b582
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf3
// Size: 0x66
function main() {
    utility::registersharedfunc("gunship_sp", "introDofStart", &function_7c002c199b5b00df);
    utility::registersharedfunc("gunship_sp", "introDofEnd", &function_e71c2f0a026baf4a);
    utility::registersharedfunc("gunship_sp", "introStartLighting", &function_6308b70a035f1d38);
    utility::registersharedfunc("gunship_sp", "introEndLighting", &function_ff594bb5e7381989);
    post_load_precache(&function_bf161307a213ad69);
}

// Namespace namespace_8b4ca639c85dfd2a / namespace_4a18ecbfbbf3b582
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x161
// Size: 0x2
function function_bf161307a213ad69() {
    
}

// Namespace namespace_8b4ca639c85dfd2a / namespace_4a18ecbfbbf3b582
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16b
// Size: 0x20
function function_6308b70a035f1d38() {
    wait 0.5;
    setsundirection(anglestoforward((-16, -156, 0)));
}

// Namespace namespace_8b4ca639c85dfd2a / namespace_4a18ecbfbbf3b582
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x193
// Size: 0x3d
function function_7c002c199b5b00df() {
    level.player thread utility::dof_disable_autofocus();
    level.player enablephysicaldepthoffieldscripting();
    level.player setphysicaldepthoffield(1.5, 325, 15, 50);
}

// Namespace namespace_8b4ca639c85dfd2a / namespace_4a18ecbfbbf3b582
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d8
// Size: 0x11
function function_e71c2f0a026baf4a() {
    level.player disablephysicaldepthoffieldscripting();
}

// Namespace namespace_8b4ca639c85dfd2a / namespace_4a18ecbfbbf3b582
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f1
// Size: 0xe
function function_ff594bb5e7381989() {
    wait 0.5;
    resetsundirection();
}

// Namespace namespace_8b4ca639c85dfd2a / namespace_4a18ecbfbbf3b582
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x207
// Size: 0x78
function function_82fbd9a01aa6f773() {
    if (getdvarint(@"hash_e6afce2cf5cf7515") != 0) {
        return;
    }
    var_2e18ffc5b8c331f0 = getentarray("lighting_capture_model", "targetname");
    foreach (var_ce174878f5681d61 in var_2e18ffc5b8c331f0) {
        var_ce174878f5681d61 hide();
    }
}

