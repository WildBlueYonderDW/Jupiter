#using scripts\common\utility;

#namespace namespace_4ad7bb8eab904f94;

// Namespace namespace_4ad7bb8eab904f94 / namespace_d7fd5db8f39ef374
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xff
// Size: 0x9b
function private autoexec init() {
    character = #"hash_fa09adc25d9aa6b8";
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
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_4ad7bb8eab904f94 / namespace_d7fd5db8f39ef374
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a2
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self setmodel("c_jup_zmb_zombie_base_female_skirt_wrap");
    self attach("c_jup_zmb_zombie_base_female_skirt_head_01_yz", "", 1);
    self.headmodel = "c_jup_zmb_zombie_base_female_skirt_head_01_yz";
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_4ad7bb8eab904f94 / namespace_d7fd5db8f39ef374
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x264
// Size: 0x2
function precache() {
    
}

// Namespace namespace_4ad7bb8eab904f94 / namespace_d7fd5db8f39ef374
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26e
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("c_jup_zmb_zombie_base_female_skirt_wrap");
    precachemodel("c_jup_zmb_zombie_base_female_skirt_head_01_yz");
}

// Namespace namespace_4ad7bb8eab904f94 / namespace_d7fd5db8f39ef374
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x295
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

