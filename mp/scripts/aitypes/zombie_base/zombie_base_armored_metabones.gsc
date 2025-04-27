#using scripts\common\callbacks;
#using scripts\common\metabone;
#using scripts\engine\utility;

#namespace zombie_base_armored_metabones;

// Namespace zombie_base_armored_metabones / scripts\aitypes\zombie_base\zombie_base_armored_metabones
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0xdf
// Size: 0x20
function autoexec main()
{
    var_601bcee5d276f46d = "zombie_base_armored";
    function_d6736c5ef5ac2990( var_601bcee5d276f46d, &function_b9f4b7206d76e7ce );
}

// Namespace zombie_base_armored_metabones / scripts\aitypes\zombie_base\zombie_base_armored_metabones
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x107
// Size: 0x1d
function private function_b9f4b7206d76e7ce( params )
{
    function_ebb83c1efeaae2c7( params.var_c02b1f6c1721c844 );
}

// Namespace zombie_base_armored_metabones / scripts\aitypes\zombie_base\zombie_base_armored_metabones
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x12c
// Size: 0x56
function private function_ebb83c1efeaae2c7( var_c02b1f6c1721c844 )
{
    if ( self getscriptablehaspart( var_c02b1f6c1721c844 ) )
    {
        self setscriptablepartstate( var_c02b1f6c1721c844, "destroyed" );
        function_3d2728c0e2252a1d( var_c02b1f6c1721c844, "exposed" );
        
        if ( var_c02b1f6c1721c844 == "armored_head" )
        {
            function_7380ccd6f2c49392( var_c02b1f6c1721c844, 1 );
        }
        
        return;
    }
    
    assertmsg( "<dev string:x1c>" + var_c02b1f6c1721c844 );
}

