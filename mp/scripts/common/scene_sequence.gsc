#using scripts\common\scene;
#using scripts\engine\utility;

#namespace scene_sequence;

/#

    // Namespace scene_sequence / scripts\common\scene_sequence
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x11b
    // Size: 0x5, Type: dev
    function function_e514286a93d143da()
    {
        
    }

#/

// Namespace scene_sequence / scripts\common\scene_sequence
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x128
// Size: 0x391
function function_7227ec8ef6d85118( existingentities, sequencename, defaultscenename )
{
    var_3fb4893405249050 = self;
    
    /#
    #/
    
    var_6fb1514b3fe5c721 = [];
    sequencebundle = getscriptbundle( "sequencescriptbundle:" + sequencename );
    var_3fb4893405249050.scenesequence = spawnstruct();
    var_3fb4893405249050.scenesequence.sequencename = sequencename;
    var_3fb4893405249050.scenesequence.sequencebundle = sequencebundle;
    var_3fb4893405249050.existingentities = existingentities;
    var_3fb4893405249050.scenesequence.nodes = [];
    var_3fb4893405249050.scenesequence.scenestructs = [];
    var_3fb4893405249050.scenesequence.running = [];
    startnode = undefined;
    var_a2f0efa133d35b66 = undefined;
    
    foreach ( scenenode in sequencebundle.sequencenodes )
    {
        var_3fb4893405249050.scenesequence.nodes[ scenenode.name ] = scenenode;
        
        if ( istrue( scenenode.var_3f62c90b71689589 ) && !isdefined( startnode ) )
        {
            startnode = scenenode;
        }
        
        if ( !isdefined( scenenode.scene ) )
        {
            if ( isdefined( defaultscenename ) )
            {
                scenenode.scene = defaultscenename;
                
                if ( !isdefined( var_a2f0efa133d35b66 ) )
                {
                    var_bf0ed7802686aa = getscriptbundle( "scenescriptbundle:" + scenenode.scene );
                    var_a2f0efa133d35b66 = var_bf0ed7802686aa scene::function_8a37fe423de2b9db();
                }
                
                if ( !isdefined( var_6fb1514b3fe5c721[ scenenode.scene ] ) && array_contains( var_a2f0efa133d35b66, scenenode.shot ) )
                {
                    var_6fb1514b3fe5c721[ scenenode.scene ] = scenenode.scene;
                }
            }
            
            continue;
        }
        
        if ( isdefined( scenenode.scene ) && !isdefined( var_6fb1514b3fe5c721[ scenenode.scene ] ) )
        {
            var_6fb1514b3fe5c721[ scenenode.scene ] = scenenode.scene;
        }
    }
    
    foreach ( scenename in var_6fb1514b3fe5c721 )
    {
        var_bc084584b46923e7 = -1;
        
        if ( isdefined( level.var_f99b1d319e65854c ) )
        {
            for (i = 0; i < level.var_f99b1d319e65854c.size; i++) {
                if ( level.var_f99b1d319e65854c[ i ] == scenename )
                {
                    var_bc084584b46923e7 = i;
                    break;
                }
            }
        }
        
        if ( var_bc084584b46923e7 >= 0 )
        {
            var_3fb4893405249050.scenesequence.scenestructs[ scenename ] = level.var_a0b4eb1703be349a[ var_bc084584b46923e7 ];
            continue;
        }
        
        var_3fb4893405249050.scenesequence.scenestructs[ scenename ] = spawnstruct();
        var_3fb4893405249050.scenesequence.scenestructs[ scenename ].origin = var_3fb4893405249050.origin;
        var_3fb4893405249050.scenesequence.scenestructs[ scenename ].angles = var_3fb4893405249050.angles;
    }
    
    thread start_sequence( startnode );
}

// Namespace scene_sequence / scripts\common\scene_sequence
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4c1
// Size: 0x2a
function private start_sequence( startnode )
{
    var_3fb4893405249050 = self;
    var_3fb4893405249050 thread function_fcafbb83f84886ce( startnode );
    var_3fb4893405249050 waittill( "sequence_finished" );
}

// Namespace scene_sequence / scripts\common\scene_sequence
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x4f3
// Size: 0x89
function private play_node( scenestruct, shot, scene, existingentities, var_8ae676fd0285f8c2 )
{
    foreach ( conditionname in var_8ae676fd0285f8c2 )
    {
        self endon( conditionname );
    }
    
    scene::play( existingentities, shot, scene );
    scenestruct notify( "Complete" + shot );
}

// Namespace scene_sequence / scripts\common\scene_sequence
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x584
// Size: 0x397
function private function_fcafbb83f84886ce( currentnode )
{
    var_3fb4893405249050 = self;
    scenestruct = var_3fb4893405249050.scenesequence.scenestructs[ currentnode.scene ];
    var_3fb4893405249050.scenesequence.running[ currentnode.scene + "-" + currentnode.shot ] = scenestruct;
    var_926d6911427d0585 = [];
    var_3f8a8c5b87e149b1 = [];
    var_e06c9ea172ad5900 = [];
    var_90773fd2e792f06c = undefined;
    
    foreach ( condition in currentnode.var_50f41da7fed36214 )
    {
        if ( condition.var_a3a06df92bada64e.size > 0 )
        {
            if ( condition.outputcondition == "ConditionAndActive" )
            {
                var_e06c9ea172ad5900[ var_e06c9ea172ad5900.size ] = condition;
                var_926d6911427d0585[ var_926d6911427d0585.size ] = condition;
                var_3f8a8c5b87e149b1[ var_3f8a8c5b87e149b1.size ] = condition.name;
                continue;
            }
            
            if ( condition.outputcondition == "ConditionAndComplete" )
            {
                var_e06c9ea172ad5900[ var_e06c9ea172ad5900.size ] = condition;
                continue;
            }
            
            var_90773fd2e792f06c = condition;
        }
    }
    
    var_3fb4893405249050 thread play_node( scenestruct, currentnode.shot, currentnode.scene, var_3fb4893405249050.existingentities, var_3f8a8c5b87e149b1 );
    
    foreach ( condition in var_926d6911427d0585 )
    {
        if ( var_3fb4893405249050 ent_flag_exist( condition.name ) )
        {
            var_3fb4893405249050 thread finish_node( currentnode, condition );
            return;
        }
    }
    
    var_3f8a8c5b87e149b1[ var_3f8a8c5b87e149b1.size ] = "Complete" + currentnode.shot;
    var_498eb82cbce10930 = scenestruct waittill_any_in_array_return( var_3f8a8c5b87e149b1 );
    
    if ( var_498eb82cbce10930 == "Complete" + currentnode.shot )
    {
        if ( !isdefined( var_90773fd2e792f06c ) && var_e06c9ea172ad5900.size > 0 )
        {
            var_b6b8a3e9e4f5d9f2 = [];
            
            foreach ( condition in var_e06c9ea172ad5900 )
            {
                var_b6b8a3e9e4f5d9f2[ var_b6b8a3e9e4f5d9f2.size ] = condition.name;
            }
            
            var_498eb82cbce10930 = scenestruct waittill_any_in_array_return( var_b6b8a3e9e4f5d9f2 );
        }
        
        foreach ( condition in var_e06c9ea172ad5900 )
        {
            if ( var_498eb82cbce10930 == condition.name || var_3fb4893405249050 ent_flag_exist( condition.name ) )
            {
                var_3fb4893405249050 thread finish_node( currentnode, condition );
                return;
            }
        }
        
        var_3fb4893405249050 thread finish_node( currentnode, var_90773fd2e792f06c );
        return;
    }
    
    foreach ( condition in var_926d6911427d0585 )
    {
        if ( var_498eb82cbce10930 == condition.name || var_3fb4893405249050 ent_flag_exist( condition.name ) )
        {
            var_3fb4893405249050 thread finish_node( currentnode, condition );
            return;
        }
    }
}

// Namespace scene_sequence / scripts\common\scene_sequence
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x923
// Size: 0x13c
function private finish_node( currentnode, exitcondition )
{
    var_3fb4893405249050 = self;
    var_3fb4893405249050.scenesequence.running[ currentnode.scene + "-" + currentnode.shot ] = undefined;
    scenestruct = var_3fb4893405249050.scenesequence.scenestructs[ currentnode.scene ];
    scenestruct function_5e4d2ddddbc6b48b( currentnode.shot );
    
    if ( isdefined( exitcondition ) )
    {
        foreach ( nextnodename in exitcondition.var_a3a06df92bada64e )
        {
            nextnode = var_3fb4893405249050.scenesequence.nodes[ nextnodename.var_dfd206830b573422 ];
            var_3fb4893405249050 thread function_fcafbb83f84886ce( nextnode );
        }
    }
    
    waitframe();
    
    if ( var_3fb4893405249050.scenesequence.running.size == 0 )
    {
        var_3fb4893405249050 notify( "sequence_finished" );
    }
}

// Namespace scene_sequence / scripts\common\scene_sequence
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa67
// Size: 0x9f
function function_d2345fa03215e539( note )
{
    var_3fb4893405249050 = self;
    var_3fb4893405249050 notify( note );
    
    if ( isdefined( var_3fb4893405249050.scenesequence ) && isdefined( var_3fb4893405249050.scenesequence.scenestructs ) )
    {
        foreach ( scenestruct in var_3fb4893405249050.scenesequence.scenestructs )
        {
            scenestruct notify( note );
        }
    }
}

// Namespace scene_sequence / scripts\common\scene_sequence
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xb0e
// Size: 0xbd
function function_2af98a24e1bf3199( notifytarget, note, objectname, repeat )
{
    var_3fb4893405249050 = self;
    
    if ( isdefined( var_3fb4893405249050.scenesequence ) && isdefined( var_3fb4893405249050.scenesequence.scenestructs ) )
    {
        foreach ( scenestruct in var_3fb4893405249050.scenesequence.scenestructs )
        {
            scenestruct scene::function_8207074e79f22926( notifytarget, note, objectname, repeat );
        }
    }
}

// Namespace scene_sequence / scripts\common\scene_sequence
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbd3
// Size: 0x1c
function function_12b58037eff0f736( conditionname )
{
    if ( isstring( conditionname ) )
    {
        ent_flag_set( conditionname );
    }
}

// Namespace scene_sequence / scripts\common\scene_sequence
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbf7
// Size: 0x1e
function function_919ec256b1627543( conditionname )
{
    if ( isstring( conditionname ) )
    {
        ent_flag_clear( conditionname, 1 );
    }
}

// Namespace scene_sequence / scripts\common\scene_sequence
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xc1d
// Size: 0x207
function function_d57898e86f3bb52f( scene, shotname, func, param1, param2, param3, param4 )
{
    var_3fb4893405249050 = self;
    scenestruct = undefined;
    
    if ( isstruct( scene ) )
    {
        foreach ( st in var_3fb4893405249050.scenesequence.scenestructs )
        {
            if ( st == scene )
            {
                scenestruct = scene;
                break;
            }
        }
    }
    else if ( isstring( scene ) )
    {
        if ( isdefined( var_3fb4893405249050.scenesequence.scenestructs[ scene ] ) )
        {
            scenestruct = var_3fb4893405249050.scenesequence.scenestructs[ scene ];
        }
    }
    
    if ( isdefined( scenestruct ) )
    {
        if ( !isdefined( scenestruct.callbacks ) )
        {
            scenestruct.callbacks = [];
        }
        
        if ( !isdefined( scenestruct.callbacks[ shotname ] ) )
        {
            scenestruct.callbacks[ shotname ] = [];
        }
        
        index = scenestruct.callbacks[ shotname ].size;
        scenestruct.callbacks[ shotname ][ index ] = spawnstruct();
        scenestruct.callbacks[ shotname ][ index ].func = func;
        scenestruct.callbacks[ shotname ][ index ].param1 = param1;
        scenestruct.callbacks[ shotname ][ index ].param2 = param2;
        scenestruct.callbacks[ shotname ][ index ].param3 = param3;
        scenestruct.callbacks[ shotname ][ index ].param4 = param4;
    }
}

// Namespace scene_sequence / scripts\common\scene_sequence
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xe2c
// Size: 0x1a2
function private function_5e4d2ddddbc6b48b( shotname )
{
    scenestruct = self;
    
    if ( isdefined( scenestruct.callbacks ) && isdefined( scenestruct.callbacks[ shotname ] ) )
    {
        foreach ( callbackstruct in scenestruct.callbacks[ shotname ] )
        {
            if ( isdefined( callbackstruct.func ) )
            {
                if ( isdefined( callbackstruct.parm4 ) )
                {
                    self [[ callbackstruct.func ]]( callbackstruct.parm1, callbackstruct.parm2, callbackstruct.parm3, callbackstruct.parm4 );
                    continue;
                }
                
                if ( isdefined( callbackstruct.parm3 ) )
                {
                    self [[ callbackstruct.func ]]( callbackstruct.parm1, callbackstruct.parm2, callbackstruct.parm3, callbackstruct.parm4 );
                    continue;
                }
                
                if ( isdefined( callbackstruct.parm2 ) )
                {
                    self [[ callbackstruct.func ]]( callbackstruct.parm1, callbackstruct.parm2 );
                    continue;
                }
                
                if ( isdefined( callbackstruct.parm1 ) )
                {
                    self [[ callbackstruct.func ]]( callbackstruct.parm1 );
                    continue;
                }
                
                self [[ callbackstruct.func ]]();
            }
        }
    }
}

