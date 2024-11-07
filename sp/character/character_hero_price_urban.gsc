#using scripts\common\utility.gsc;

#namespace namespace_c97b75274bf2187c;

// Namespace namespace_c97b75274bf2187c / character\character_hero_price_urban
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xd6
// Size: 0x9a
function private autoexec init() {
    character = #"hash_68ecfbe4c62c020";
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

// Namespace namespace_c97b75274bf2187c / character\character_hero_price_urban
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x178
// Size: 0xd9
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"sas";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self setmodel("body_hero_price_urban_beanie");
    self attach("head_hero_price_newrig_bald", "", 1);
    self.headmodel = "head_hero_price_newrig_bald";
    self.hatmodel = "hat_hero_price_beanie";
    self attach(self.hatmodel);
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_c97b75274bf2187c / character\character_hero_price_urban
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x259
// Size: 0x2
function precache() {
    
}

// Namespace namespace_c97b75274bf2187c / character\character_hero_price_urban
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x263
// Size: 0x2a
function precache_sp() {
    precache();
    precachemodel("body_hero_price_urban_beanie");
    precachemodel("head_hero_price_newrig_bald");
    precachemodel("hat_hero_price_beanie");
}

// Namespace namespace_c97b75274bf2187c / character\character_hero_price_urban
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x295
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

