#using scripts\common\utility.gsc;

#namespace namespace_c477bdbc9ed3505d;

// Namespace namespace_c477bdbc9ed3505d / namespace_b04686cefb621a3d
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xd4
// Size: 0x9a
function private autoexec init() {
    character = #"hash_ca1d120b5d8ded99";
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

// Namespace namespace_c477bdbc9ed3505d / namespace_b04686cefb621a3d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x176
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react_female";
    self.voice = #"hash_56d2a75e94b008ce";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_civ_plane_attendant_02");
    self attach("head_hero_stewardess_lod0", "", 1);
    self.headmodel = "head_hero_stewardess_lod0";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_c477bdbc9ed3505d / namespace_b04686cefb621a3d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x238
// Size: 0x2
function precache() {
    
}

// Namespace namespace_c477bdbc9ed3505d / namespace_b04686cefb621a3d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x242
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_civ_plane_attendant_02");
    precachemodel("head_hero_stewardess_lod0");
}

// Namespace namespace_c477bdbc9ed3505d / namespace_b04686cefb621a3d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x269
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

