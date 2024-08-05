#using scripts\cp\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3a8f9ace195c9da9;
#using scripts\cp_mp\utility\scriptable_door_utility.gsc;

#namespace cp_lock_door;

// Namespace cp_lock_door / namespace_92d3af7d6c233f98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf4
// Size: 0x178
function function_5e512a9e89597b21() {
    flag_wait("dungeon_load_finished");
    flag_wait("scriptables_ready");
    var_8def23560c2362bb = getstructarray("cp_lock_door", "targetname");
    foreach (locker in var_8def23560c2362bb) {
        if (isdefined(locker.target)) {
            doors = getentitylessscriptablearray(locker.target, "targetname");
            door = getclosest(locker.origin, doors);
        }
        if (!isdefined(door)) {
            doors = scripts\cp_mp\utility\scriptable_door_utility::scriptable_door_get_in_radius(locker.origin, float(locker.radius), float(locker.radius));
            door = getclosest(locker.origin, doors);
        }
        if (isdefined(door)) {
            door function_79a4d351eac40e17();
            if (!isdefined(locker.var_c7ca156b125fd448) || istrue(int(locker.var_c7ca156b125fd448))) {
                door scriptabledoorfreeze(1);
            }
            if (!isdefined(locker.var_cd11c31526523a63) || istrue(int(locker.var_cd11c31526523a63))) {
                locker thread function_c2d0f610d609e57d(door);
            }
        }
    }
}

// Namespace cp_lock_door / namespace_92d3af7d6c233f98
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x274
// Size: 0xa8
function function_c2d0f610d609e57d(door) {
    if (!isdefined(door)) {
        return;
    }
    level endon("game_ended");
    self notify("closet_opener_start");
    self endon("closet_opener_start");
    while (isdefined(door)) {
        var_623a48a3acd836c7 = getaiarrayinradius(self.origin, self.radius, "axis");
        foreach (ai in var_623a48a3acd836c7) {
            door scripts\cp_mp\utility\scriptable_door_utility::scriptable_door_freeze_open(1);
            return;
        }
        wait 0.25;
    }
}

