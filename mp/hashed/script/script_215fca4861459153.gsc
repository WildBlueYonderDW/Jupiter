#using scripts\common\utility;

#namespace namespace_de59c502415156af;

// Namespace namespace_de59c502415156af / namespace_cfa3fb38eb4bf04f
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xde
// Size: 0x9b
function private autoexec init() {
    character = #"hash_9b9cebd8eb5eb803";
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

// Namespace namespace_de59c502415156af / namespace_cfa3fb38eb4bf04f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x181
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_entity";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_entity";
    self setmodel("body_c_jup_zmb_npc_entity");
    self attach("head_c_jup_zmb_npc_entity", "", 1);
    self.headmodel = "head_c_jup_zmb_npc_entity";
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_de59c502415156af / namespace_cfa3fb38eb4bf04f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x243
// Size: 0x2
function precache() {
    
}

// Namespace namespace_de59c502415156af / namespace_cfa3fb38eb4bf04f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24d
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_zmb_npc_entity");
    precachemodel("head_c_jup_zmb_npc_entity");
}

// Namespace namespace_de59c502415156af / namespace_cfa3fb38eb4bf04f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x274
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

