#using scripts\engine\scriptable;

#namespace rollup_doors;

// Namespace rollup_doors / namespace_ba0e313b6e029ac1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15b
// Size: 0x96
function rollup_doors()
{
    level waittill( "prematch_done" );
    [ var_c8e8a7bd09836a86 ] = getentitylessscriptablearray( "scriptable_scriptable_door_uk_garage_01", "classname" );
    var_dada11d7451d2e6 = getentarray( "rollup_door_trigger", "script_noteworthy" );
    
    foreach ( var_e749829cd971c69d in var_dada11d7451d2e6 )
    {
        var_e749829cd971c69d thread function_4c1e29fbd2f64593();
    }
}

// Namespace rollup_doors / namespace_ba0e313b6e029ac1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f9
// Size: 0xa7
function function_4c1e29fbd2f64593()
{
    level endon( "game_ended" );
    self endon( "death" );
    [ var_c8e8a7bd09836a86 ] = getentitylessscriptablearray( self.target, "targetname" );
    
    while ( true )
    {
        self waittill( "trigger", player );
        var_dfbdd027ef33103 = var_c8e8a7bd09836a86 getscriptablepartstate( "base", 1 );
        
        if ( var_dfbdd027ef33103 == "opening" || var_dfbdd027ef33103 == "open" )
        {
            var_c8e8a7bd09836a86 setscriptablepartstate( "base", "closing" );
            continue;
        }
        
        var_c8e8a7bd09836a86 setscriptablepartstate( "base", "opening" );
    }
}

