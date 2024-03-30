// mwiii decomp prototype
#using scripts\common\utility.gsc;

#namespace character;

// Namespace character / scripts/code/character
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe0
// Size: 0xbe
function get_least_used_model(array) {
    lowest_indices = [];
    lowest_use = 999999;
    lowest_indices[0] = 0;
    for (i = 0; i < array.size; i++) {
        if (!isdefined(level.character_model_cache[array[i]])) {
            level.character_model_cache[array[i]] = 0;
        }
        model_count = level.character_model_cache[array[i]];
        if (model_count > lowest_use) {
            continue;
        }
        if (model_count < lowest_use) {
            lowest_indices = [];
            lowest_use = model_count;
        }
        lowest_indices[lowest_indices.size] = i;
    }
    /#
        assertex(lowest_indices.size, "Tried to set a model but the lowest indices didn't exist");
    #/
    rnd = random(lowest_indices);
    return array[rnd];
}

// Namespace character / scripts/code/character
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a6
// Size: 0x2e
function precachemodelarray(a) {
    for (i = 0; i < a.size; i++) {
        precachemodel(a[i]);
    }
}

// Namespace character / scripts/code/character
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1db
// Size: 0x11a
function attachhead(var_e1b8a2cda2a36f9, var_7556f3e1bb0846bc) {
    /#
        if (isdefined(level.var_ccf5af826b36fa06)) {
            if (!isdefined(self.characterinfo)) {
                self.characterinfo = spawnstruct();
                self.characterinfo.var_e1b8a2cda2a36f9 = var_e1b8a2cda2a36f9;
                self.characterinfo.var_7556f3e1bb0846bc = var_7556f3e1bb0846bc;
            }
        }
    #/
    if (!isdefined(level.character_head_index)) {
        level.character_head_index = [];
    }
    if (!isdefined(level.character_head_index[var_e1b8a2cda2a36f9])) {
        level.character_head_index[var_e1b8a2cda2a36f9] = randomint(var_7556f3e1bb0846bc.size);
    }
    /#
        assert(level.character_head_index[var_e1b8a2cda2a36f9] < var_7556f3e1bb0846bc.size);
    #/
    index = (level.character_head_index[var_e1b8a2cda2a36f9] + 1) % var_7556f3e1bb0846bc.size;
    if (isdefined(self.script_char_index)) {
        index = self.script_char_index % var_7556f3e1bb0846bc.size;
    }
    level.character_head_index[var_e1b8a2cda2a36f9] = index;
    self attach(var_7556f3e1bb0846bc[index], "", 1);
    self.headmodel = var_7556f3e1bb0846bc[index];
}

// Namespace character / scripts/code/character
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2fc
// Size: 0xa3
function attachhat(var_cb1b71997ebf2a1a, var_827c5e69d673ce17) {
    if (!isdefined(level.character_hat_index)) {
        level.character_hat_index = [];
    }
    if (!isdefined(level.character_hat_index[var_cb1b71997ebf2a1a])) {
        level.character_hat_index[var_cb1b71997ebf2a1a] = randomint(var_827c5e69d673ce17.size);
    }
    /#
        assert(level.character_hat_index[var_cb1b71997ebf2a1a] < var_827c5e69d673ce17.size);
    #/
    index = (level.character_hat_index[var_cb1b71997ebf2a1a] + 1) % var_827c5e69d673ce17.size;
    level.character_hat_index[var_cb1b71997ebf2a1a] = index;
    self attach(var_827c5e69d673ce17[index]);
    self.hatmodel = var_827c5e69d673ce17[index];
}

// Namespace character / scripts/code/character
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a6
// Size: 0x40
function new() {
    self detachall();
    oldgunhand = self.anim_gunhand;
    if (!isdefined(oldgunhand)) {
        return;
    }
    self.anim_gunhand = "none";
    self [[ anim.putguninhand ]](oldgunhand);
}

// Namespace character / scripts/code/character
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ed
// Size: 0xee
function save() {
    info["gunHand"] = self.anim_gunhand;
    info["gunInHand"] = self.anim_guninhand;
    info["model"] = self.model;
    info["hatModel"] = self.hatmodel;
    if (isdefined(self.name)) {
        info["name"] = self.name;
        /#
            println("<unknown string>", self.name);
        #/
    } else {
        /#
            println("<unknown string>");
        #/
    }
    attachsize = self getattachsize();
    for (i = 0; i < attachsize; i++) {
        info["attach"][i]["model"] = self getattachmodelname(i);
        info["attach"][i]["tag"] = self getattachtagname(i);
    }
    return info;
}

// Namespace character / scripts/code/character
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4e3
// Size: 0xe4
function load(info) {
    self detachall();
    self.anim_gunhand = info["gunHand"];
    self.anim_guninhand = info["gunInHand"];
    self setmodel(info["model"]);
    self.hatmodel = info["hatModel"];
    if (isdefined(info["name"])) {
        self.name = info["name"];
        /#
            println("<unknown string>", self.name);
        #/
    } else {
        /#
            println("<unknown string>");
        #/
    }
    attachinfo = info["attach"];
    attachsize = attachinfo.size;
    for (i = 0; i < attachsize; i++) {
        self attach(attachinfo[i]["model"], attachinfo[i]["tag"]);
    }
}

// Namespace character / scripts/code/character
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5ce
// Size: 0x90
function precache(info) {
    if (isdefined(info["name"])) {
        /#
            println("<unknown string>", info["<unknown string>"]);
        #/
    } else {
        /#
            println("<unknown string>");
        #/
    }
    precachemodel(info["model"]);
    attachinfo = info["attach"];
    attachsize = attachinfo.size;
    for (i = 0; i < attachsize; i++) {
        precachemodel(attachinfo[i]["model"]);
    }
}

// Namespace character / scripts/code/character
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x665
// Size: 0x45
function initialize_character_group(prefix, group, amount) {
    for (i = 0; i < amount; i++) {
        level.character_index_cache[prefix][group][i] = 0;
    }
}

// Namespace character / scripts/code/character
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b1
// Size: 0x12
function get_random_weapon(amount) {
    return randomint(amount);
}

// Namespace character / scripts/code/character
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6cb
// Size: 0x15
function random(array) {
    return array[randomint(array.size)];
}

