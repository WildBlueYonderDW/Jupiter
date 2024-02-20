// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_639bf783929acf9b;
#using script_38eb8f4be20d54f4;
#using script_7b2517368c79e5bc;
#using script_860bfdfe82326e3;

#namespace namespace_abf9477bf4a0e36e;

// Namespace namespace_abf9477bf4a0e36e/namespace_6930997dcab65131
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x194
// Size: 0x2a
function function_ef875512a592bbc1() {
    flag_wait("common_items_init");
    level.var_abf9477bf4a0e36e = [];
    callback::add("ob_content_process_create_script", &function_17af5fcd80a95961);
}

// Namespace namespace_abf9477bf4a0e36e/namespace_6930997dcab65131
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c5
// Size: 0xd3
function function_17af5fcd80a95961(var_d27680ff86693f5c) {
    var_3c3122af5c02bd7 = getstructarray("content_struct", "variantname");
    var_a1e0b05ac75f968 = [];
    foreach (struct in var_3c3122af5c02bd7) {
        if (isdefined(struct.content_key) && struct.content_key == "essence_large_spawn") {
            var_a1e0b05ac75f968[var_a1e0b05ac75f968.size] = struct;
        }
    }
    if (isdefined(level.var_c383b967aa7e551b)) {
        var_a1e0b05ac75f968 = [[ level.var_c383b967aa7e551b ]]("essence", var_a1e0b05ac75f968, &function_51b5ba468783ae71);
    }
    callback::callback("ob_essence_create_script_done");
}

// Namespace namespace_abf9477bf4a0e36e/namespace_6930997dcab65131
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29f
// Size: 0x8b
function function_e8b0e602ea21de7b() {
    namespace_4164bc931714b00b::function_72f3dd0512f43c96("essence_large", &function_4cdf5f740a62fd75);
    var_e10b8f561af1621c = getstructarray("content_destination", "variantname");
    if (isdefined(var_e10b8f561af1621c) && var_e10b8f561af1621c.size > 0) {
        foreach (destination in var_e10b8f561af1621c) {
            level thread function_eb034db4994911d1(destination);
        }
    }
}

// Namespace namespace_abf9477bf4a0e36e/namespace_6930997dcab65131
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x331
// Size: 0xd3
function function_eb034db4994911d1(destination) {
    foreach (location in destination.locations) {
        var_b45a823d9b08eca9 = location.instances["essence_large"];
        if (isdefined(var_b45a823d9b08eca9)) {
            foreach (instance in var_b45a823d9b08eca9.var_67b2b78e28eaa758) {
                namespace_4164bc931714b00b::function_7e2984b7610f3616(instance);
            }
        }
    }
}

// Namespace namespace_abf9477bf4a0e36e/namespace_6930997dcab65131
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40b
// Size: 0x8f
function function_4cdf5f740a62fd75(struct) {
    /#
        assert(isstruct(struct), "no struct on spawn essence_large");
    #/
    spawn_points = struct.var_305e36cbb51f88ce["essence_large_spawn"];
    if (isdefined(spawn_points)) {
        foreach (point in spawn_points) {
            point function_51b5ba468783ae71(point);
        }
    }
}

// Namespace namespace_abf9477bf4a0e36e/namespace_6930997dcab65131
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a1
// Size: 0x4d
function function_51b5ba468783ae71(var_ceab0569f6f2612b) {
    var_c38189364d07e3d0 = getscriptbundle("itemspawnentry:ob_jup_item_essence_large");
    namespace_2abc885019e1956::function_d59d110ccf0f5b8b(var_c38189364d07e3d0, var_c38189364d07e3d0.spawncount, var_ceab0569f6f2612b.origin, var_ceab0569f6f2612b.angles, 0, 1);
}

// Namespace namespace_abf9477bf4a0e36e/namespace_6930997dcab65131
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4f5
// Size: 0xc
function function_8d5e4f5d5d501bb6(player) {
    
}

