#using script_53651341190c5aab;
#using scripts\asm\asm;
#using scripts\common\cap;
#using scripts\common\string;

#namespace civ_group;

// Namespace civ_group / namespace_6dfc85bbd850d6d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x122
// Size: 0x87
function getfunction( funcid )
{
    switch ( funcid )
    {
        case #"hash_fe0e9f8796a0acad":
            return &function_3dbd361f74b442f9;
        case #"hash_e93ace2ec1639636":
            return &function_a157fbbc31d9eb1a;
        case #"hash_ec77c425122ce561":
            return &function_2cd30a67aedce945;
        case #"hash_f803c2a7263b7274":
            return &assignrole;
        case #"hash_c97cf04d1c01da13":
            return &function_554a1f4495cb227;
        case #"hash_331df3154e569c83":
            return &function_51877ad33d5c3c07;
    }
    
    return namespace_f901a4f9d899be59::function_efcea5d26798e5b6( funcid );
}

// Namespace civ_group / namespace_6dfc85bbd850d6d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b2
// Size: 0x99
function function_3dbd361f74b442f9( interactionid )
{
    sid = scripts\common\string::to_string( interactionid );
    
    if ( !isdefined( level.var_80275ca89b572683 ) )
    {
        level.var_80275ca89b572683 = [];
    }
    
    if ( !isdefined( level.var_80275ca89b572683[ sid ] ) )
    {
        level.var_80275ca89b572683[ sid ] = spawnstruct();
        level.var_80275ca89b572683[ sid ].nextrole = 0;
    }
    
    self.lastrole = 0;
    self.interactionrole = "undefined";
    self.var_85ecbbe4fae7c0ae = "cap_init";
    self notify( "interaction_end" );
}

// Namespace civ_group / namespace_6dfc85bbd850d6d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x253
// Size: 0x91
function function_a157fbbc31d9eb1a( interactionid )
{
    function_25c933655d73066a( interactionid );
    self.lastrole = undefined;
    self.interactionrole = undefined;
    self.lastrole = 0;
    self._blackboard.var_7460b96395361857 = undefined;
    sid = scripts\common\string::to_string( interactionid );
    level.var_80275ca89b572683[ sid ].nextrole--;
    function_8add99cb1b82b964( interactionid );
    
    if ( self.defaultasm != self.asmname )
    {
        scripts\common\cap::cap_exit();
    }
}

// Namespace civ_group / namespace_6dfc85bbd850d6d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2ec
// Size: 0xee
function assignrole( statename, params )
{
    roles = [ "Guy1", "Guy2", "Guy3", "Guy4", "Guy5", "Guy6" ];
    interactionid = self function_92435c7a6ae85c3c();
    sid = scripts\common\string::to_string( interactionid );
    roleindex = level.var_80275ca89b572683[ sid ].nextrole;
    self.interactionrole = roles[ roleindex ];
    capinfo = undefined;
    
    if ( isdefined( roles[ roleindex + 1 ] ) )
    {
        capinfo = function_a0cccf0b4c466b2c( self, roles[ roleindex + 1 ] );
    }
    
    if ( !isdefined( capinfo ) )
    {
        self.lastrole = 1;
    }
    
    level.var_80275ca89b572683[ sid ].nextrole++;
}

// Namespace civ_group / namespace_6dfc85bbd850d6d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3e2
// Size: 0xab
function function_2cd30a67aedce945( statename, shouldteleport )
{
    capinfo = undefined;
    
    if ( isdefined( self.interactionrole ) )
    {
        capinfo = function_a0cccf0b4c466b2c( self, self.interactionrole );
    }
    
    if ( !isdefined( capinfo ) )
    {
        scripts\asm\asm::asm_fireephemeralevent( "exit", "end" );
        self leaveinteraction();
        return;
    }
    
    role = [ self.interactionrole ];
    
    if ( isdefined( shouldteleport[ 0 ] ) || istrue( self.var_3605e45b535f0536 ) )
    {
        self.var_3605e45b535f0536 = 1;
        self.var_ddad29bbdecd1671 = &customarrival;
    }
    
    startcap( statename, role );
}

// Namespace civ_group / namespace_6dfc85bbd850d6d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x495
// Size: 0x15, Type: bool
function function_554a1f4495cb227( param )
{
    return istrue( self.lastrole );
}

// Namespace civ_group / namespace_6dfc85bbd850d6d
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4b3
// Size: 0x2d, Type: bool
function function_51877ad33d5c3c07( asmname, statename, tostatename, params )
{
    return istrue( self.var_51877ad33d5c3c07 );
}

// Namespace civ_group / namespace_6dfc85bbd850d6d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e9
// Size: 0x2
function customarrival()
{
    
}

