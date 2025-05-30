#using scripts\common\utility;
#using scripts\engine\utility;

#namespace vehicle_anim;

// Namespace vehicle_anim / scripts\cp_mp\vehicles\vehicle_anim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe1
// Size: 0x24
function init_vehicles()
{
    create_func_ref( "fastrope_anim", &fastrope_anim );
    create_func_ref( "vehicle_door_anim", &vehicle_anim );
}

// Namespace vehicle_anim / scripts\cp_mp\vehicles\vehicle_anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x10d
// Size: 0x4d
function fastrope_anim( model, animation, flag )
{
    model dontinterpolate();
    model scriptmodelclearanim();
    model scriptmodelplayanimdeltamotionfrompos( getanimname( animation ), model.origin, model.angles, flag );
}

// Namespace vehicle_anim / scripts\cp_mp\vehicles\vehicle_anim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x162
// Size: 0xb2
function vehicle_anim( vehicle, animation )
{
    if ( isdefined( vehicle ) )
    {
        if ( istrue( vehicle.animintro ) )
        {
            if ( !istrue( vehicle.var_28140f53a0386f0e ) )
            {
                vehicle.var_28140f53a0386f0e = 1;
                vehicle animscripted( "placeholder", vehicle.scenenode.origin, vehicle.scenenode.angles, animation );
            }
            
            return;
        }
        
        vehicle animscripted( "placeholder", vehicle.origin, vehicle.angles, mp_vehicles_always_loaded#iw9_veh_blank_5_seconds );
        vehicle vehicleplayanim( animation, 0 );
    }
}

// Namespace vehicle_anim / scripts\cp_mp\vehicles\vehicle_anim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21c
// Size: 0x13
function vehicleaniminit()
{
    scripts\engine\utility::create_func_ref( "use_turret", &utility::use_turret );
}

// Namespace vehicle_anim / scripts\cp_mp\vehicles\vehicle_anim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x237
// Size: 0xc
function set_vehicle_anims_mkilo23_ai_infil( positions )
{
    return positions;
}

// Namespace vehicle_anim / scripts\cp_mp\vehicles\vehicle_anim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x24c
// Size: 0xc
function set_vehicle_anims_umike( positions )
{
    return positions;
}

