#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_mines.gsc;

#namespace namespace_9609f46bac493ba4;

// Namespace namespace_9609f46bac493ba4 / scripts\mp\vehicles\vehicle_mines_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x96
// Size: 0x18
function vehicle_mines_mp_init() {
    registersharedfunc("vehicle_mines", "trigger", &vehicle_mines_mp_minetrigger);
}

// Namespace namespace_9609f46bac493ba4 / scripts\mp\vehicles\vehicle_mines_mp
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb6
// Size: 0x13
function vehicle_mines_mp_minetrigger(vehicle, mine) {
    
}

