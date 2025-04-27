#using scripts\common\progress_tracker;
#using scripts\common\utility;
#using scripts\engine\utility;

#namespace namespace_a81ff4b57c69b411;

// Namespace namespace_a81ff4b57c69b411 / namespace_3ab0c2d9cd55890e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbf
// Size: 0xc
function function_25599e7b57187fba()
{
    self.var_e3d833b1e5d30b03 = [];
}

// Namespace namespace_a81ff4b57c69b411 / namespace_3ab0c2d9cd55890e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd3
// Size: 0x12, Type: bool
function function_2cd8a95641b4e4f1()
{
    return isdefined( self ) && isdefined( self.var_e3d833b1e5d30b03 );
}

// Namespace namespace_a81ff4b57c69b411 / namespace_3ab0c2d9cd55890e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xee
// Size: 0x44
function function_6ef305e92aa56110( uniquename )
{
    assertex( function_2cd8a95641b4e4f1(), "<dev string:x1c>" );
    assertex( isdefined( self.var_e3d833b1e5d30b03[ uniquename ] ), "<dev string:x60>" );
    return self.var_e3d833b1e5d30b03[ uniquename ];
}

// Namespace namespace_a81ff4b57c69b411 / namespace_3ab0c2d9cd55890e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x13b
// Size: 0x58
function function_53a8c0ab528f44cd( uniquename, progresstracker )
{
    assertex( function_2cd8a95641b4e4f1(), "<dev string:x1c>" );
    assertex( !isdefined( self.var_e3d833b1e5d30b03[ uniquename ] ), "<dev string:xb0>" );
    progresstracker function_5cd1865af5a5edcf( uniquename );
    self.var_e3d833b1e5d30b03[ uniquename ] = progresstracker;
}

// Namespace namespace_a81ff4b57c69b411 / namespace_3ab0c2d9cd55890e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19b
// Size: 0x56
function function_11bf7ad9c1fdc527( uniquename )
{
    assertex( function_2cd8a95641b4e4f1(), "<dev string:x1c>" );
    assertex( isdefined( self.var_e3d833b1e5d30b03[ uniquename ] ), "<dev string:x60>" );
    self.var_e3d833b1e5d30b03[ uniquename ] notify( "progress_tracking_concluded" );
    self.var_e3d833b1e5d30b03[ uniquename ] = undefined;
}

// Namespace namespace_a81ff4b57c69b411 / namespace_3ab0c2d9cd55890e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1f9
// Size: 0x54
function function_a1a1d73d3e5772a5( uniquename, incrementvalue )
{
    assertex( function_2cd8a95641b4e4f1(), "<dev string:x1c>" );
    assertex( isdefined( self.var_e3d833b1e5d30b03[ uniquename ] ), "<dev string:x109>" );
    self.var_e3d833b1e5d30b03[ uniquename ] function_a370b85e4225923c( incrementvalue );
}

// Namespace namespace_a81ff4b57c69b411 / namespace_3ab0c2d9cd55890e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x255
// Size: 0x54
function function_a6663c5b87c63d51( uniquename, decrementvalue )
{
    assertex( function_2cd8a95641b4e4f1(), "<dev string:x1c>" );
    assertex( isdefined( self.var_e3d833b1e5d30b03[ uniquename ] ), "<dev string:x109>" );
    self.var_e3d833b1e5d30b03[ uniquename ] function_1e9e5153831d8c68( decrementvalue );
}

// Namespace namespace_a81ff4b57c69b411 / namespace_3ab0c2d9cd55890e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2b1
// Size: 0x54
function function_82a2f59593fe059e( uniquename, progressvalue )
{
    assertex( function_2cd8a95641b4e4f1(), "<dev string:x1c>" );
    assertex( isdefined( self.var_e3d833b1e5d30b03[ uniquename ] ), "<dev string:x109>" );
    self.var_e3d833b1e5d30b03[ uniquename ] function_7681e7890758b69b( progressvalue );
}

// Namespace namespace_a81ff4b57c69b411 / namespace_3ab0c2d9cd55890e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x30d
// Size: 0x54
function function_34a7c2ed4dbe722b( uniquename, finalvalue )
{
    assertex( function_2cd8a95641b4e4f1(), "<dev string:x1c>" );
    assertex( isdefined( self.var_e3d833b1e5d30b03[ uniquename ] ), "<dev string:x109>" );
    self.var_e3d833b1e5d30b03[ uniquename ] function_ea45d380408d2922( finalvalue );
}

