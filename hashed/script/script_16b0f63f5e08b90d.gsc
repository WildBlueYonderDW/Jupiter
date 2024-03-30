// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using scripts\code\character.gsc;
#using script_28fa69b7d63b8b9e;

#namespace namespace_efb867154cb590ed;

// Namespace namespace_efb867154cb590ed / namespace_d910f80f6cf1170d
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x116
// Size: 0xb4
function private autoexec init() {
    character = #"hash_34c2874d41b5e001";
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
        level.var_44bf7e31237b3073[%"hash_62f85112093bf514"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_efb867154cb590ed / namespace_d910f80f6cf1170d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d1
// Size: 0xac
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self setmodel("c_jup_zmb_zombie_base_male_merc_body");
    scripts/code/character::attachhead("c_jup_zmb_zombie_base_male_merc_head", namespace_12df6c254f1d634c::main());
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_efb867154cb590ed / namespace_d910f80f6cf1170d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x284
// Size: 0x3
function precache() {
    
}

// Namespace namespace_efb867154cb590ed / namespace_d910f80f6cf1170d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28e
// Size: 0x22
function precache_sp() {
    precache();
    precachemodel("c_jup_zmb_zombie_base_male_merc_body");
    scripts/code/character::precachemodelarray(namespace_12df6c254f1d634c::main());
}

// Namespace namespace_efb867154cb590ed / namespace_d910f80f6cf1170d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b7
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_efb867154cb590ed / namespace_d910f80f6cf1170d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c8
// Size: 0x37
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_36614506bb40610":
        return namespace_12df6c254f1d634c::main();
    }
    /#
        assert(0, "character_jup_zombie_base_male_merc do not have any xmodelalias");
    #/
}

