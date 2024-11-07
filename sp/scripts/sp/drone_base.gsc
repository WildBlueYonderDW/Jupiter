#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\sp\names.gsc;
#using scripts\sp\friendlyfire.gsc;

#namespace namespace_13388e6e14bbfb33;

// Namespace namespace_13388e6e14bbfb33 / scripts\sp\drone_base
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xce
// Size: 0xb1
function drone_give_soul() {
    assign_drone_tree();
    self startusingheroonlylighting();
    if (isdefined(self.script_moveplaybackrate)) {
        self.moveplaybackrate = self.script_moveplaybackrate;
    } else {
        self.moveplaybackrate = 1;
    }
    if (self.team == "allies") {
        scripts\sp\names::get_name();
        self setlookattext(self.name, %);
    }
    if (isdefined(level.dronecallbackthread)) {
        self thread [[ level.dronecallbackthread ]]();
    }
    if (!isdefined(self.script_friendly_fire_disable)) {
        level thread scripts\sp\friendlyfire::friendly_fire_think(self);
    }
    if (!isdefined(level.ai_dont_glow_in_thermal)) {
        thermaldrawenabledrone();
    }
}

// Namespace namespace_13388e6e14bbfb33 / scripts\sp\drone_base
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x187
// Size: 0x87
function thermaldrawenabledrone() {
    if (!isdefined(level.dronesthermalteamselect)) {
        level.dronesthermalteamselect = "all";
    }
    var_2dc225905ea86379 = 0;
    switch (level.dronesthermalteamselect) {
    case #"hash_c482c6c109150a4":
        var_2dc225905ea86379 = 1;
        break;
    case #"hash_7c2d091e6337bf54":
        var_2dc225905ea86379 = self.team == "axis";
        break;
    default:
        break;
    }
    if (var_2dc225905ea86379) {
        self thermaldrawenable();
    }
}

// Namespace namespace_13388e6e14bbfb33 / scripts\sp\drone_base
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x216
// Size: 0x322
function drone_init_path() {
    if (!isdefined(self.target)) {
        return;
    }
    if (isdefined(level.drone_paths[self.target])) {
        return;
    }
    level.drone_paths[self.target] = 1;
    target = self.target;
    node = getstruct(target, "targetname");
    if (!isdefined(node)) {
        return;
    }
    vectors = [];
    var_ad7ee73eeaf14390 = [];
    var_f1e6b7ef99e38943 = node;
    for (;;) {
        node = var_f1e6b7ef99e38943;
        for (var_42b4575e536fb56f = 0; ; var_42b4575e536fb56f = 1) {
            if (!isdefined(node.target)) {
                break;
            }
            var_b45bd7c79fc01491 = getstructarray(node.target, "targetname");
            if (var_b45bd7c79fc01491.size) {
                break;
            }
            nextnode = undefined;
            foreach (newnode in var_b45bd7c79fc01491) {
                if (isdefined(var_ad7ee73eeaf14390[newnode.origin + ""])) {
                    continue;
                }
                nextnode = newnode;
                break;
            }
            if (!isdefined(nextnode)) {
                break;
            }
            var_ad7ee73eeaf14390[nextnode.origin + ""] = 1;
            vectors[node.targetname] = nextnode.origin - node.origin;
            node.angles = vectortoangles(vectors[node.targetname]);
            node = nextnode;
        }
        if (!var_42b4575e536fb56f) {
            break;
        }
    }
    target = self.target;
    node = getstruct(target, "targetname");
    prevnode = node;
    var_ad7ee73eeaf14390 = [];
    for (;;) {
        node = var_f1e6b7ef99e38943;
        var_42b4575e536fb56f = 0;
        for (;;) {
            if (!isdefined(node.target)) {
                return;
            }
            if (!isdefined(vectors[node.targetname])) {
                return;
            }
            var_b45bd7c79fc01491 = getstructarray(node.target, "targetname");
            if (var_b45bd7c79fc01491.size) {
                break;
            }
            nextnode = undefined;
            foreach (newnode in var_b45bd7c79fc01491) {
                if (isdefined(var_ad7ee73eeaf14390[newnode.origin + ""])) {
                    continue;
                }
                nextnode = newnode;
                break;
            }
            if (!isdefined(nextnode)) {
                break;
            }
            if (isdefined(node.radius)) {
                vec1 = vectors[prevnode.targetname];
                vec2 = vectors[node.targetname];
                vec = (vec1 + vec2) * 0.5;
                node.angles = vectortoangles(vec);
            }
            var_42b4575e536fb56f = 1;
            prevnode = node;
            node = nextnode;
        }
        if (!var_42b4575e536fb56f) {
            break;
        }
    }
}

// Namespace namespace_13388e6e14bbfb33 / scripts\sp\drone_base
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x540
// Size: 0x32
function assign_drone_tree() {
    if (isdefined(self.type)) {
        if (self.type == "dog") {
            assign_animals_tree();
            return;
        }
        assign_generic_human_tree();
    }
}

// Namespace namespace_13388e6e14bbfb33 / scripts\sp\drone_base
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57a
// Size: 0xb
function assign_generic_human_tree() {
    self useanimtree(%generic_human);
}

// Namespace namespace_13388e6e14bbfb33 / scripts\sp\drone_base
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x58d
// Size: 0xb
function assign_animals_tree() {
    self useanimtree(%animals);
}

