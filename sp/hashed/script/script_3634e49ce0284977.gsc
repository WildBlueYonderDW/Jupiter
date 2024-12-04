#using scripts\common\utility;

#namespace namespace_d3f74580b9dae3a3;

// Namespace namespace_d3f74580b9dae3a3 / namespace_7e2fdc4d18670b43
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xe5
// Size: 0x9a
function private autoexec init() {
    character = #"hash_a6184d056c372927";
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

// Namespace namespace_d3f74580b9dae3a3 / namespace_7e2fdc4d18670b43
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x187
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"shadowcompany";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_sp_opforce_shadow_company_armored_dmr_1_1");
    self attach("head_sp_opforce_shadow_company_armored_dmr_1_1", "", 1);
    self.headmodel = "head_sp_opforce_shadow_company_armored_dmr_1_1";
    self setclothtype(#"nylon");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_d3f74580b9dae3a3 / namespace_7e2fdc4d18670b43
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x249
// Size: 0x2
function precache() {
    
}

// Namespace namespace_d3f74580b9dae3a3 / namespace_7e2fdc4d18670b43
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x253
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_sp_opforce_shadow_company_armored_dmr_1_1");
    precachemodel("head_sp_opforce_shadow_company_armored_dmr_1_1");
}

// Namespace namespace_d3f74580b9dae3a3 / namespace_7e2fdc4d18670b43
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27a
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

