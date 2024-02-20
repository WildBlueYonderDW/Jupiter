// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using scripts\code\character.gsc;
#using script_25abd4d1c887d67b;

#namespace namespace_7307c5b8ecdbf680;

// Namespace namespace_7307c5b8ecdbf680/namespace_d4b4a4dc6de14fe0
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x134
// Size: 0xb4
function private autoexec init() {
    character = #"hash_880d4518c4e12ae4";
    if (!isdefined(level.var_586887bc5dc30f34)) {
        level.var_586887bc5dc30f34 = [];
    }
    if (!isdefined(level.var_7d97144daa7995cd)) {
        level.var_7d97144daa7995cd = [];
    }
    if (!isdefined(level.var_44bf7e31237b3073)) {
        level.var_44bf7e31237b3073 = [];
    }
    level.var_586887bc5dc30f34[character] = &main;
    if (issp()) {
        level.var_7d97144daa7995cd[character] = &function_430419022a9c3ffe;
        level.var_44bf7e31237b3073[%"hash_5af2cfb07ca0ad65"] = &function_ecf17a96e49ab67;
    } else {
        level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
    }
}

// Namespace namespace_7307c5b8ecdbf680/namespace_d4b4a4dc6de14fe0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ef
// Size: 0xac
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self setmodel("c_jup_zmb_zombie_base_male_shortsleeve_body_yz");
    namespace_ac7e8770abb7eb1::attachhead("c_jup_zmb_zombie_base_male_shortsleeve_head_yz", namespace_fe012875aeb2d791::main());
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_7307c5b8ecdbf680/namespace_d4b4a4dc6de14fe0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a2
// Size: 0x3
function precache() {
    
}

// Namespace namespace_7307c5b8ecdbf680/namespace_d4b4a4dc6de14fe0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ac
// Size: 0x22
function function_430419022a9c3ffe() {
    precache();
    precachemodel("c_jup_zmb_zombie_base_male_shortsleeve_body_yz");
    namespace_ac7e8770abb7eb1::precachemodelarray(namespace_fe012875aeb2d791::main());
}

// Namespace namespace_7307c5b8ecdbf680/namespace_d4b4a4dc6de14fe0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d5
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_7307c5b8ecdbf680/namespace_d4b4a4dc6de14fe0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e6
// Size: 0x37
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_9f81095ee5027585":
        return namespace_fe012875aeb2d791::main();
        break;
    }
    /#
        assert(0, "character_jup_zombie_base_male_shortsleeve_yz do not have any xmodelalias");
    #/
}

