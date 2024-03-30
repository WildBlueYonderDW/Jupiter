// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using script_653970bffe964e7e;
#using scripts\code\character.gsc;
#using script_6ab80473ddb4f43c;

#namespace namespace_dc7a2e4444a71aef;

// Namespace namespace_dc7a2e4444a71aef / namespace_286250693b37a94f
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x130
// Size: 0xb4
function private autoexec init() {
    character = #"hash_c5787d7f9f0308eb";
    if (!isdefined(level.fncharacter)) {
        level.fncharacter = [];
    }
    if (!isdefined(level.var_7d97144daa7995cd)) {
        level.var_7d97144daa7995cd = [];
    }
    if (!isdefined(level.var_44bf7e31237b3073)) {
        level.var_44bf7e31237b3073 = [];
    }
    level.fncharacter[character] = &main;
    if (issp()) {
        level.var_7d97144daa7995cd[character] = &precache_sp;
        level.var_44bf7e31237b3073[%"hash_1d3368c036efc152"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_dc7a2e4444a71aef / namespace_286250693b37a94f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eb
// Size: 0xb2
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self function_6b0082dec4510b24("c_jup_zmb_zombie_base_female_jeans_body_rz", namespace_857e5d80736a0998::main());
    scripts/code/character::attachhead("c_jup_zmb_zombie_base_female_jeans_head_rz", namespace_3533caf9c67d2326::main());
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_dc7a2e4444a71aef / namespace_286250693b37a94f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a4
// Size: 0x3
function precache() {
    
}

// Namespace namespace_dc7a2e4444a71aef / namespace_286250693b37a94f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ae
// Size: 0x24
function precache_sp() {
    precache();
    scripts/code/character::precachemodelarray(namespace_857e5d80736a0998::main());
    scripts/code/character::precachemodelarray(namespace_3533caf9c67d2326::main());
}

// Namespace namespace_dc7a2e4444a71aef / namespace_286250693b37a94f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d9
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_dc7a2e4444a71aef / namespace_286250693b37a94f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ea
// Size: 0x4a
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_d18a4e953b69de34":
        return namespace_857e5d80736a0998::main();
    case #"hash_145f6393c87a2382":
        return namespace_3533caf9c67d2326::main();
    }
    /#
        assert(0, "character_jup_zombie_base_female_jeans_rz do not have any xmodelalias");
    #/
}

