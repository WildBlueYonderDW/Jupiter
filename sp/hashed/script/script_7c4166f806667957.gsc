#using scripts\cp_mp\vehicles\vehicle;

#namespace namespace_7709500196d2fa46;

// Namespace namespace_7709500196d2fa46 / namespace_bc95a1194169b6e9
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x7d
// Size: 0x1e
function autoexec main()
{
    level.var_7bf42d565645a485 = 1;
    function_c0b3ddc9a6bdcc46( "veh_jup_hind", &function_2e36ed86124a1acf );
}

// Namespace namespace_7709500196d2fa46 / namespace_bc95a1194169b6e9
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xa3
// Size: 0x1d
function private function_2e36ed86124a1acf()
{
    if ( !function_9697379150687859( "veh_jup_hind" ) )
    {
        return;
    }
    
    function_8497e7e46b5e397( "veh_jup_hind" );
}

