#using scripts\common\metabone;

#namespace zombie_disciple_metabones;

// Namespace zombie_disciple_metabones / scripts\aitypes\zombie_disciple\zombie_disciple_metabones
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0xc0
// Size: 0x20
function autoexec main()
{
    var_601bcee5d276f46d = "zombie_disciple";
    function_d6736c5ef5ac2990( var_601bcee5d276f46d, &function_b9f4b7206d76e7ce );
}

// Namespace zombie_disciple_metabones / scripts\aitypes\zombie_disciple\zombie_disciple_metabones
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xe8
// Size: 0x7e
function private function_b9f4b7206d76e7ce( params )
{
    var_c02b1f6c1721c844 = params.var_c02b1f6c1721c844;
    
    if ( self getscriptablehaspart( var_c02b1f6c1721c844 ) )
    {
        self setscriptablepartstate( var_c02b1f6c1721c844, "destroyed" );
        function_3d2728c0e2252a1d( var_c02b1f6c1721c844, "destroyed" );
        function_7380ccd6f2c49392( var_c02b1f6c1721c844, 1 );
        
        if ( !istrue( self.var_8eea1c7b28ac77b5 ) )
        {
            self function_3e89eb3d8e3f1811( "in_head_pain", 1 );
        }
        
        return;
    }
    
    assertmsg( "<dev string:x1c>" + var_c02b1f6c1721c844 );
}

