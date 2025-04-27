#using scripts\unittest\util;

#namespace unittest_error;

// Namespace unittest_error / scripts\unittest\error
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4b7
// Size: 0x37
function error_print( msg, var )
{
    if ( isdefined( var ) )
    {
        test_print( msg + ": defined" );
        return;
    }
    
    test_print( msg + ": not defined" );
}

// Namespace unittest_error / scripts\unittest\error
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4f6
// Size: 0x1b
function func( a, b, c )
{
    
}

// Namespace unittest_error / scripts\unittest\error
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x519
// Size: 0x10, Type: bool
function cond_func()
{
    test_print( "cond func" );
    return true;
}

// Namespace unittest_error / scripts\unittest\error
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x532
// Size: 0xc5
function params()
{
    s = spawnstruct();
    test_print( "func param" );
    func( 1, "x", s );
    test_print( "meth param" );
    s func( 1, "x", s );
    test_print( "func thread param" );
    thread func( 1, "x", s );
    test_print( "meth thread param" );
    s thread func( 1, "x", s );
    f = &func;
    test_print( "func pointer param" );
    thread [[ f ]]( 1, "x", s );
    test_print( "meth pointer param" );
    s thread [[ f ]]( 1, "x", s );
}

// Namespace unittest_error / scripts\unittest\error
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5ff
// Size: 0x3be
function types()
{
    x = 1;
    s = spawnstruct();
    a = [ 1, 2, 3, 4, 5, 6 ];
    v = ( 1, 2, 3 );
    p = level.players[ 0 ];
    str = "foo";
    y = x + s;
    error_print( "+", y );
    y = x < str;
    error_print( "lt", y );
    y = x >= str;
    error_print( "ge", y );
    y = 1;
    y++;
    error_print( "inc float", y );
    s++;
    error_print( "inc struct", s );
    y = s && cond_func();
    error_print( "and struct", y );
    y = s || cond_func();
    error_print( "or struct", y );
    y = x < str || cond_func();
    error_print( "or expr", y );
    test_print( "array field" );
    x = a.foo;
    test_print( "array field ref" );
    a.foo = 0;
    test_print( "vector field" );
    x = v.foo;
    test_print( "vector field ref" );
    v.foo = 0;
    s.a[ 0 ] = 1;
    y = s.a[ 1 ];
    error_print( "unknown array int", y );
    y = s.a[ "hi" ];
    error_print( "unknown array string", y );
    test_print( "vec ref" );
    v[ 0 ] = 0;
    test_print( "str ref" );
    str[ 0 ] = "x";
    s[ 0 ] = 0;
    test_print( "array ref bad int index" );
    a[ 16777216 ] = 0;
    test_print( "array ref bad struct index" );
    a[ s ] = 0;
    test_print( "ent field array ref" );
    p.team[ 0 ] = 0;
    test_print( "ent array ref" );
    p[ 0 ] = 0;
    y = v[ 3 ];
    error_print( "vec bad int index", y );
    y = v[ "hi" ];
    error_print( "vec str index", y );
    y = str[ 3 ];
    error_print( "str bad int index", y );
    y = str[ "hi" ];
    error_print( "str str index", y );
    y = a[ 16777216 ];
    error_print( "array bad int index", y );
    y = a[ s ];
    error_print( "array struct index", y );
    y = p[ 0 ];
    error_print( "ent array index", y );
    test_print( "str clear" );
    s[ 0 ] = undefined;
    test_print( "array clear bad int index" );
    a[ 16777216 ] = undefined;
    test_print( "array clear struct index" );
    a[ s ] = undefined;
    test_print( "array clear player" );
    p[ 0 ] = undefined;
    test_print( "array clear vector" );
    v[ 0 ] = undefined;
    y = v.size;
    error_print( "vector size", y );
    y = s.size;
    error_print( "struct size", y );
    y = p.size;
    error_print( "player size", y );
    y = x.size;
    error_print( "int size", y );
    test_print( "bad vector" );
    bad_vector = ( 0, str, 1 );
}

// Namespace unittest_error / scripts\unittest\error
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9c5
// Size: 0x52
function wait_notify()
{
    s = spawnstruct();
    x = 1;
    wait -1;
    wait 16777216;
    wait s;
    level waittill( 1 );
    x waittill( "foo" );
    level endon( 1 );
    x endon( "foo" );
    level notify( 1 );
    x notify( "foo" );
}

// Namespace unittest_error / scripts\unittest\error
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa1f
// Size: 0x83
function switch_func( msg, var )
{
    test_print( msg );
    
    switch ( var )
    {
        case 0:
            test_print( "0" );
            break;
        case #"":
            test_print( "empty" );
            break;
        default:
            test_print( "default" );
            break;
    }
    
    test_print( msg + " end" );
}

// Namespace unittest_error / scripts\unittest\error
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaaa
// Size: 0x54
function switch_test()
{
    switch_func( "switch float", 1 );
    switch_func( "switch bad int", 16777216 );
    switch_func( "switch struct", spawnstruct() );
    switch_func( "switch vec", [ 1, 2, 3 ] );
}

// Namespace unittest_error / scripts\unittest\error
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb06
// Size: 0x29b
function cond()
{
    s = spawnstruct();
    
    if ( s )
    {
        test_print( "struct if" );
    }
    else
    {
        test_print( "struct else" );
    }
    
    if ( !s )
    {
        test_print( "struct not if" );
    }
    else
    {
        test_print( "struct not else" );
    }
    
    x = 1;
    y = "hi";
    
    if ( x < y )
    {
        test_print( "lt if" );
    }
    else
    {
        test_print( "lt else" );
    }
    
    if ( s && cond_func() )
    {
        test_print( "and if" );
    }
    else
    {
        test_print( "and else" );
    }
    
    if ( s || cond_func() )
    {
        test_print( "or if" );
    }
    else
    {
        test_print( "or else" );
    }
    
    if ( !( s < 1 ) && cond_func() )
    {
        test_print( "!bool and if" );
    }
    else
    {
        test_print( "!bool and else" );
    }
    
    if ( !( s < 1 ) || cond_func() )
    {
        test_print( "!bool or if" );
    }
    else
    {
        test_print( "!bool or else" );
    }
    
    if ( !s && cond_func() )
    {
        test_print( "!struct and if" );
    }
    else
    {
        test_print( "!struct and else" );
    }
    
    if ( !s || cond_func() )
    {
        test_print( "!struct or if" );
    }
    else
    {
        test_print( "!struct or else" );
    }
    
    if ( !( s && cond_func() ) )
    {
        test_print( "!(and) if" );
    }
    else
    {
        test_print( "!(and) else" );
    }
    
    if ( !( s || cond_func() ) )
    {
        test_print( "!(or) if" );
    }
    else
    {
        test_print( "!(or) else" );
    }
    
    c = 0;
    
    while ( x < y )
    {
        test_print( "lt while: " + c );
        c++;
        
        if ( c > 2 )
        {
            break;
        }
    }
    
    c = 0;
    
    while ( !( x < y ) )
    {
        test_print( "!lt while: " + c );
        c++;
        
        if ( c > 2 )
        {
            break;
        }
    }
    
    c = 0;
    
    while ( c < 2 && x < y )
    {
        test_print( "lt for: " + c );
        c++;
        
        if ( c > 2 )
        {
            break;
        }
        
        s++;
    }
    
    c = 0;
    
    while ( c < 2 && !( x < y ) )
    {
        test_print( "!lt for: " + c );
        c++;
        
        if ( c > 2 )
        {
            break;
        }
        
        s++;
    }
}

// Namespace unittest_error / scripts\unittest\error
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xda9
// Size: 0x57
function is_true_print( val, name )
{
    b = istrue( val );
    
    if ( !isdefined( b ) )
    {
        b = "undefined";
    }
    
    d = isdefined( val );
    test_print( "is_true: " + name + ": " + b + " isdefined: " + d );
}

// Namespace unittest_error / scripts\unittest\error
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe08
// Size: 0x38
function is_true()
{
    a = [];
    is_true_print( a, "array" );
    s = spawnstruct();
    is_true_print( s, "struct" );
}

// Namespace unittest_error / scripts\unittest\error
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe48
// Size: 0x44
function main()
{
    test_begin( "Error" );
    params();
    types();
    wait_notify();
    switch_test();
    cond();
    is_true();
    test_end( "Error" );
}

