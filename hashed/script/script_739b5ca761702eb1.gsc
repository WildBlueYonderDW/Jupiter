#using scripts\engine\utility.gsc;
#using scripts\engine\sp\utility.gsc;
#using script_109cf9cc19f3d346;

#namespace namespace_f2b9ea9ad5a79be8;

// Namespace namespace_f2b9ea9ad5a79be8 / namespace_603ad01874c9514b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f8
// Size: 0x5e
function function_e342035d4be91696() {
    level.var_1b2599094f1aa7a3 = spawnstruct();
    level.var_1b2599094f1aa7a3.actors = [];
    level.var_1b2599094f1aa7a3.nodes = [];
    level.var_1b2599094f1aa7a3.current_node = undefined;
    level.var_1b2599094f1aa7a3 thread function_511a5e11aca48790();
}

// Namespace namespace_f2b9ea9ad5a79be8 / namespace_603ad01874c9514b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25e
// Size: 0xaf
function function_511a5e11aca48790() {
    var_f57c69a240493994 = 0;
    while (true) {
        waitframe();
        if (!isdefined(level.var_1b2599094f1aa7a3.current_node)) {
            var_f57c69a240493994 = 0;
            continue;
        }
        if (!var_f57c69a240493994) {
            level notify("dialogue_start");
        }
        var_f57c69a240493994 = 1;
        next_node = function_a375ef915e817d5d();
        if (istrue(level.var_1b2599094f1aa7a3.aborted)) {
            level.var_1b2599094f1aa7a3.aborted = undefined;
            continue;
        }
        level.var_1b2599094f1aa7a3.current_node = next_node;
        if (!isdefined(next_node)) {
            level notify("dialogue_end");
            continue;
        }
        level notify("dialogue_next_node");
    }
}

// Namespace namespace_f2b9ea9ad5a79be8 / namespace_603ad01874c9514b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x315
// Size: 0xca
function function_a375ef915e817d5d() {
    level endon("dialogue_abort");
    current_node = level.var_1b2599094f1aa7a3.current_node;
    next_node = undefined;
    current_node.visited = 1;
    if (isdefined(current_node.func)) {
        next_node = current_node.owner [[ current_node.func ]]();
    } else {
        next_node = current_node.owner waittill(current_node.name + "_end");
    }
    current_node.completed = 1;
    if (isdefined(next_node)) {
        if (isstring(next_node)) {
            next_node = function_8c75a86890a649dc(next_node);
        }
        next_node.owner = current_node.owner;
    }
    return next_node;
}

// Namespace namespace_f2b9ea9ad5a79be8 / namespace_603ad01874c9514b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3e8
// Size: 0x116
function function_3ecb520991a212fc(name, animname, team) {
    if (isdefined(name)) {
        self.ainame = name;
    }
    if (isdefined(animname)) {
        self.animname = animname;
    }
    if (isdefined(team)) {
        self.team = team;
    }
    assert(isdefined(self.ainame), "Dialogue Tree Actor must have a name");
    assert(isdefined(self.animname), "Dialogue Tree Actor must have an animname");
    assert(isdefined(self.team), "Dialogue Tree Actor must have a team");
    actors = level.var_1b2599094f1aa7a3.actors[self.animname];
    if (isdefined(actors)) {
        if (!isarray(actors)) {
            actors = [actors];
        }
        level.var_1b2599094f1aa7a3.actors[self.animname] = array_add(actors, self);
        return;
    }
    level.var_1b2599094f1aa7a3.actors[self.animname] = self;
}

// Namespace namespace_f2b9ea9ad5a79be8 / namespace_603ad01874c9514b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x506
// Size: 0xde
function function_3bcb10406ab4ad1d(animname) {
    if (!isdefined(animname)) {
        animname = self.animname;
    }
    actors = level.var_1b2599094f1aa7a3.actors[animname];
    if (isarray(actors)) {
        assert(isdefined(self) && is_equal(self.animname, animname), "Don't know which Dialogue Tree Actor to remove!");
        actors = array_remove(actors, self);
        if (actors.size > 1) {
            level.var_1b2599094f1aa7a3.actors[animname] = actors;
        } else {
            level.var_1b2599094f1aa7a3.actors[animname] = actors[0];
        }
        return;
    }
    level.var_1b2599094f1aa7a3.actors = array_remove_key(level.var_1b2599094f1aa7a3.actors, animname);
}

// Namespace namespace_f2b9ea9ad5a79be8 / namespace_603ad01874c9514b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5ec
// Size: 0x51
function function_88c416555bc21541(animname) {
    actor = level.var_1b2599094f1aa7a3.actors[animname];
    if (isarray(actor)) {
        actor = getclosest(level.player.origin, actor);
    }
    return actor;
}

// Namespace namespace_f2b9ea9ad5a79be8 / namespace_603ad01874c9514b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x646
// Size: 0x7e
function function_2ca2807712501171() {
    actors = [];
    foreach (value in level.var_1b2599094f1aa7a3.actors) {
        if (isarray(value)) {
            actors = array_combine(actors, value);
            continue;
        }
        actors[actors.size] = value;
    }
    return actors;
}

// Namespace namespace_f2b9ea9ad5a79be8 / namespace_603ad01874c9514b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6cd
// Size: 0x81
function function_88e8f81ba53c8399(name) {
    name = tolower(name);
    assert(!function_937c5de25d5682b(), "Cannot run more than one node at a time");
    assert(array_contains_key(level.var_1b2599094f1aa7a3.nodes, name), "Dialogue node with name " + name + " does not exist");
    level.var_1b2599094f1aa7a3.current_node = level.var_1b2599094f1aa7a3.nodes[name];
}

// Namespace namespace_f2b9ea9ad5a79be8 / namespace_603ad01874c9514b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x756
// Size: 0x5a
function function_6b2794be53922d6e() {
    if (namespace_41e91af8aef2354e::function_ffdce2654ea23d5a()) {
        namespace_41e91af8aef2354e::function_6f846e9519b4cff2();
    }
    if (isdefined(level.var_1b2599094f1aa7a3.current_node)) {
        level.var_1b2599094f1aa7a3.aborted = 1;
        level.var_1b2599094f1aa7a3.current_node = undefined;
    }
    level notify("dialogue_abort");
}

// Namespace namespace_f2b9ea9ad5a79be8 / namespace_603ad01874c9514b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7b8
// Size: 0x16
function function_937c5de25d5682b() {
    return isdefined(level.var_1b2599094f1aa7a3.current_node);
}

// Namespace namespace_f2b9ea9ad5a79be8 / namespace_603ad01874c9514b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7d7
// Size: 0x72
function function_44768f37b1a9f788(leader, startnode) {
    scene = spawnstruct();
    scene.leader = leader;
    scene.var_f087ac9bee88f3df = startnode;
    scene.started = 0;
    scene.running = 0;
    scene.var_37563fdbbec9d7ee = 0;
    scene.timedout = 0;
    return scene;
}

// Namespace namespace_f2b9ea9ad5a79be8 / namespace_603ad01874c9514b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x852
// Size: 0x1b1
function function_e0b639a16bf31bcf(name, params) {
    node = spawnstruct();
    name = tolower(name);
    node.name = name;
    node.visited = 0;
    node.completed = 0;
    node.owner = level;
    node.resetOptions = 0;
    node.responseRequired = 1;
    if (isfunction(params)) {
        node.func = params;
    }
    if (isarray(params)) {
        foreach (value in params) {
            switch (key) {
            case #"hash_cd4f17d4aa69e985": 
                node.options = value;
                break;
            case #"hash_e702ff190f9ffed5": 
                node.results = value;
                break;
            case #"hash_6b1ba289ab27fab4": 
                node.owner = value;
                break;
            case #"hash_847455c830e9351e": 
                node.resetOptions = value;
                break;
            case #"hash_ada48ad47876cc77": 
                node.responseRequired = value;
                break;
            case #"hash_d529bbd00a46c374": 
                node.timeoutNode = value;
                break;
            default: 
                break;
            }
        }
    }
    level.var_1b2599094f1aa7a3.nodes[name] = node;
}

// Namespace namespace_f2b9ea9ad5a79be8 / namespace_603ad01874c9514b
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xa0b
// Size: 0x96
function function_bda26c6b3a7d395a(owner, options, results, resetOptions, responseRequired, timeoutNode) {
    params = [];
    if (isdefined(owner)) {
        params["owner"] = owner;
    }
    if (isdefined(options)) {
        params["options"] = options;
    }
    if (isdefined(results)) {
        params["results"] = results;
    }
    if (isdefined(resetOptions)) {
        params["resetOptions"] = resetOptions;
    }
    if (isdefined(responseRequired)) {
        params["responseRequired"] = responseRequired;
    }
    if (isdefined(timeoutNode)) {
        params["timeoutNode"] = timeoutNode;
    }
    return params;
}

// Namespace namespace_f2b9ea9ad5a79be8 / namespace_603ad01874c9514b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaaa
// Size: 0x28
function function_8c75a86890a649dc(name) {
    name = tolower(name);
    return level.var_1b2599094f1aa7a3.nodes[name];
}

// Namespace namespace_f2b9ea9ad5a79be8 / namespace_603ad01874c9514b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xadb
// Size: 0x70
function function_bd86a7339819b9a4(name) {
    name = tolower(name);
    assert(array_contains_key(level.var_1b2599094f1aa7a3.nodes, name), "Dialogue node with name " + name + " does not exist");
    node = level.var_1b2599094f1aa7a3.nodes[name];
    node.owner = self;
}

// Namespace namespace_f2b9ea9ad5a79be8 / namespace_603ad01874c9514b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb53
// Size: 0x2a
function function_cbd09ef58f58efef(name) {
    node = function_8c75a86890a649dc(name);
    return node.owner == self;
}

// Namespace namespace_f2b9ea9ad5a79be8 / namespace_603ad01874c9514b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb86
// Size: 0x32
function function_d22210db2062c3ba(name) {
    name = tolower(name);
    return level.var_1b2599094f1aa7a3.nodes[name].visited;
}

// Namespace namespace_f2b9ea9ad5a79be8 / namespace_603ad01874c9514b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbc1
// Size: 0x32
function function_55f69519f0c8adb9(name) {
    name = tolower(name);
    return level.var_1b2599094f1aa7a3.nodes[name].completed;
}

// Namespace namespace_f2b9ea9ad5a79be8 / namespace_603ad01874c9514b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbfc
// Size: 0x29
function function_4e65800aa9026a50(name) {
    name = tolower(name);
    return isdefined(level.var_1b2599094f1aa7a3.nodes[name]);
}

// Namespace namespace_f2b9ea9ad5a79be8 / namespace_603ad01874c9514b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc2e
// Size: 0x24
function function_bf2b4156c2ad2ece(message) {
    if (!flag_exist(message)) {
        flag_init(message);
    }
    return flag(message);
}

// Namespace namespace_f2b9ea9ad5a79be8 / namespace_603ad01874c9514b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc5b
// Size: 0x25
function function_b4fd13a02335dcd6(message) {
    if (!flag_exist(message)) {
        flag_init(message);
    }
    flag_set(message);
}

// Namespace namespace_f2b9ea9ad5a79be8 / namespace_603ad01874c9514b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc88
// Size: 0x28
function function_c3b8ade88249f5ff(message) {
    if (!flag_exist(message)) {
        flag_init(message);
        return;
    }
    flag_clear(message);
}

// Namespace namespace_f2b9ea9ad5a79be8 / namespace_603ad01874c9514b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcb8
// Size: 0x24
function function_ac9f4287e5e75c03(message) {
    if (!ent_flag_exist(message)) {
        ent_flag_init(message);
    }
    return ent_flag(message);
}

// Namespace namespace_f2b9ea9ad5a79be8 / namespace_603ad01874c9514b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xce5
// Size: 0x25
function function_670bf3283b391e01(message) {
    if (!ent_flag_exist(message)) {
        ent_flag_init(message);
    }
    ent_flag_set(message);
}

// Namespace namespace_f2b9ea9ad5a79be8 / namespace_603ad01874c9514b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd12
// Size: 0x28
function function_aac7cc330b31b0ec(message) {
    if (!ent_flag_exist(message)) {
        ent_flag_init(message);
        return;
    }
    ent_flag_clear(message);
}

