#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
#using script_639bf783929acf9b;
#using scripts\common\devgui.gsc;
#using script_7b2517368c79e5bc;
#using script_860bfdfe82326e3;

#namespace namespace_abf9477bf4a0e36e;

// Namespace namespace_abf9477bf4a0e36e / namespace_6930997dcab65131
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x194
// Size: 0x29
function function_ef875512a592bbc1() {
    flag_wait("common_items_init");
    level.var_abf9477bf4a0e36e = [];
    callback::add("ob_content_process_create_script", &function_17af5fcd80a95961);
}

// Namespace namespace_abf9477bf4a0e36e / namespace_6930997dcab65131
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c5
// Size: 0xd2
function function_17af5fcd80a95961(sparams) {
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

// Namespace namespace_abf9477bf4a0e36e / namespace_6930997dcab65131
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29f
// Size: 0x8a
function function_e8b0e602ea21de7b() {
    namespace_4164bc931714b00b::register_script("essence_large", &function_4cdf5f740a62fd75);
    mapdestinations = getstructarray("content_destination", "variantname");
    if (isdefined(mapdestinations) && mapdestinations.size > 0) {
        foreach (destination in mapdestinations) {
            level thread function_eb034db4994911d1(destination);
        }
    }
}

// Namespace namespace_abf9477bf4a0e36e / namespace_6930997dcab65131
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x331
// Size: 0xd2
function function_eb034db4994911d1(destination) {
    foreach (location in destination.locations) {
        essence_container = location.instances["essence_large"];
        if (isdefined(essence_container)) {
            foreach (instance in essence_container.versions) {
                namespace_4164bc931714b00b::spawn_instance(instance);
            }
        }
    }
}

// Namespace namespace_abf9477bf4a0e36e / namespace_6930997dcab65131
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40b
// Size: 0x8e
function function_4cdf5f740a62fd75(struct) {
    assert(isstruct(struct), "no struct on spawn essence_large");
    spawn_points = struct.contentgroups["essence_large_spawn"];
    if (isdefined(spawn_points)) {
        foreach (point in spawn_points) {
            point function_51b5ba468783ae71(point);
        }
    }
}

// Namespace namespace_abf9477bf4a0e36e / namespace_6930997dcab65131
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a1
// Size: 0x4c
function function_51b5ba468783ae71(structspawn) {
    dropbundle = getscriptbundle("itemspawnentry:ob_jup_item_essence_large");
    namespace_2abc885019e1956::function_d59d110ccf0f5b8b(dropbundle, dropbundle.spawncount, structspawn.origin, structspawn.angles, 0, 1);
}

// Namespace namespace_abf9477bf4a0e36e / namespace_6930997dcab65131
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4f5
// Size: 0xb
function function_8d5e4f5d5d501bb6(player) {
    
}

