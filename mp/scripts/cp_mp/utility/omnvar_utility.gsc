#namespace omnvar_utility;

// Namespace omnvar_utility / scripts\cp_mp\utility\omnvar_utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x88
// Size: 0x7a
function setcachedgameomnvar( omnvar, value )
{
    if ( !isdefined( omnvar ) || !isdefined( value ) )
    {
        return;
    }
    
    if ( !isdefined( level.cachedomnars ) )
    {
        level.cachedomnars = [];
    }
    
    shouldset = !isdefined( level.cachedomnars[ omnvar ] ) || level.cachedomnars[ omnvar ] != value;
    level.cachedomnars[ omnvar ] = value;
    
    if ( shouldset )
    {
        setomnvar( omnvar, value );
    }
}

// Namespace omnvar_utility / scripts\cp_mp\utility\omnvar_utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10a
// Size: 0x81
function setcachedclientomnvar( omnvar, value )
{
    if ( !isdefined( self ) || !isdefined( omnvar ) || !isdefined( value ) )
    {
        return;
    }
    
    if ( !isdefined( self.cachedomnars ) )
    {
        self.cachedomnars = [];
    }
    
    shouldset = !isdefined( self.cachedomnars[ omnvar ] ) || self.cachedomnars[ omnvar ] != value;
    self.cachedomnars[ omnvar ] = value;
    
    if ( shouldset )
    {
        self setclientomnvar( omnvar, value );
    }
}

// Namespace omnvar_utility / scripts\cp_mp\utility\omnvar_utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x193
// Size: 0x7b
function function_8b532402ee55336e( bitoffset, bitwidth, var_49f3b7a464f1d70d, newvalue )
{
    mask = int( pow( 2, bitwidth ) ) - 1;
    var_a463992091f1d483 = ( newvalue & mask ) << bitoffset;
    var_f8f977081d3da8b4 = ~( mask << bitoffset );
    cleanedbase = var_49f3b7a464f1d70d & var_f8f977081d3da8b4;
    var_82a90e56e416fa55 = cleanedbase + var_a463992091f1d483;
    return var_82a90e56e416fa55;
}

// Namespace omnvar_utility / scripts\cp_mp\utility\omnvar_utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x217
// Size: 0x47
function unpackvalue( bitoffset, bitwidth, packedvalue )
{
    mask = int( pow( 2, bitwidth ) ) - 1;
    var_a463992091f1d483 = packedvalue >> bitoffset & mask;
    return var_a463992091f1d483;
}

// Namespace omnvar_utility / scripts\cp_mp\utility\omnvar_utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x267
// Size: 0x59
function function_63437fca39c681dc( var_e9d476a3809cb3f1, bitoffset, bitwidth, value )
{
    prevvalue = self getclientomnvar( var_e9d476a3809cb3f1 );
    var_82a90e56e416fa55 = function_8b532402ee55336e( bitoffset, bitwidth, prevvalue, value );
    
    if ( prevvalue != var_82a90e56e416fa55 )
    {
        self setclientomnvar( var_e9d476a3809cb3f1, var_82a90e56e416fa55 );
    }
}

// Namespace omnvar_utility / scripts\cp_mp\utility\omnvar_utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2c8
// Size: 0x42
function function_40f3e4aeda0e3f00( var_e9d476a3809cb3f1, bitoffset, bitwidth )
{
    value = self getclientomnvar( var_e9d476a3809cb3f1 );
    var_26a6c0adbaffb03f = unpackvalue( bitoffset, bitwidth, value );
    return var_26a6c0adbaffb03f;
}

// Namespace omnvar_utility / scripts\cp_mp\utility\omnvar_utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x313
// Size: 0x57
function function_d3cf7ff1a257e2c3( var_e9d476a3809cb3f1, bitoffset, bitwidth, value )
{
    prevvalue = getomnvar( var_e9d476a3809cb3f1 );
    var_82a90e56e416fa55 = function_8b532402ee55336e( bitoffset, bitwidth, prevvalue, value );
    
    if ( prevvalue != var_82a90e56e416fa55 )
    {
        setomnvar( var_e9d476a3809cb3f1, var_82a90e56e416fa55 );
    }
}

// Namespace omnvar_utility / scripts\cp_mp\utility\omnvar_utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x372
// Size: 0x41
function function_610e0cca26bba2f( var_e9d476a3809cb3f1, bitoffset, bitwidth )
{
    value = getomnvar( var_e9d476a3809cb3f1 );
    var_26a6c0adbaffb03f = unpackvalue( bitoffset, bitwidth, value );
    return var_26a6c0adbaffb03f;
}

